using System.Collections;
using System.Collections.Generic;
using System.Resources;
using UnityEditor.Experimental.GraphView;
using UnityEngine;
using UnityEngine.SceneManagement;

public enum FairyState
{
    Idle,
    MoveToResource,
    PickUp,
    MoveToTarget,
    DropOff,
    Blocked,
    Stumble,     //  넘어지는 중
    Standig,     //  일어나는 중
    MissingBean, //  콩 다시 주우러 가는 중
}

public enum FairyType
{
    Common,
    Rare,
    Legendary,
    Shy,
    Hyper,
    Sleepy
}

public enum MoveMode { Idle, Walk, Run, Exhausted }
public enum FairyEffectType { Dust, Heart, Exhaust, none }

[System.Serializable]
public class EffectEntry
{
    public FairyEffectType type;
    public ParticleSystem particle;
}

public class Fairy : MonoBehaviour
{
    public FairyState state = FairyState.Idle;

    private List<Vector3> path;
    private int pathIndex = 0;

    private GameObject carriedItem = null;
    public Transform carrySlot; // 콩을 들 위치 (빈 GameObject)
    private bool hasDropped = false;

    private FairyData fairyData;

    [Header("fairyMoveController")]
    [SerializeField] private float moveSpeed = 1f; 
    [SerializeField] private float walkSpeed = 1f;
    [SerializeField] private float runSpeed = 2f;
    [SerializeField] private float stamina = 5f; // 0.0 ~ 1.0
    [SerializeField] private float staminaDrainRate = 0.2f; // per second
    [SerializeField] private float staminaRegenRate = 0.1f; // per second


    [SerializeField] private List<EffectEntry> effectEntries;

    [SerializeField] private float avoidDistance = 0.5f;
    [SerializeField] private float avoidStrength = 1.0f;

    [SerializeField] private float idSeed;
    [SerializeField] private float noiseMagnitude = 1.0f;

    [SerializeField] private float stumbleChancePerSecond = 0.01f; // 초당 넘어질 확률
    private bool isStumbling = false;
    private bool isStanding = false;
    private GameObject droppedBean;
    [SerializeField] CapsuleCollider fairyCol;
    private Animator animator;

    [SerializeField] private MoveMode moveMode = MoveMode.Walk;
    private float modeSwitchTimer = 0f;

    private Dictionary<FairyEffectType, ParticleSystem> effects;

    [SerializeField] private FairyType fairyType;
    public FairyType FairyType => fairyType;

    public void Initialize(FairyData data)
    {
        fairyData = data;
        ApplyFairyData();
    }

    private void ApplyFairyData()
    {
        // 외형, 속성 적용
        SkinnedMeshRenderer skinnedMeshRenderer = GetComponentInChildren<SkinnedMeshRenderer>();
        if (skinnedMeshRenderer)
        {
            skinnedMeshRenderer.material = fairyData.fairyMat;
        }
        moveSpeed = fairyData.baseMoveSpeed;
    }

    void Awake()
    {
        effects = new();
        foreach (var entry in effectEntries)
        {
            if (!effects.ContainsKey(entry.type))
            {
                effects.Add(entry.type, entry.particle);
            }
        }

        idSeed = Random.Range(0f, 1000f);
        Instantiate(effects[FairyEffectType.Dust], transform.position, Quaternion.identity, transform);
        animator = GetComponentInChildren<Animator>();
        fairyCol = GetComponentInChildren<CapsuleCollider>();

    }

    void Update()
    {
        switch (state)
        {
            case FairyState.MoveToResource:
                moveMode = MoveMode.Run;
                HandleMovement();
                AvoidOtherFairies();
                //CheckStumble();
                break;
            case FairyState.MoveToTarget:
                moveMode = MoveMode.Walk;
                HandleMovement();
                AvoidOtherFairies();
                //CheckStumble();
                break;

            case FairyState.PickUp:
                PerformPickup();
                break;

            case FairyState.DropOff:
                PerformDropOff();
                break;
            case FairyState.Blocked:
                // 아무것도 안함, 경로 갱신 기다림
                break;
            case FairyState.MissingBean:
                HandleMoveToDroppedBean();
                break;
        }
        //if (bean == null) state = FairyState.Waiting;

    }

    private void UpdateAnimator()
    {
        animator.SetInteger("moveMode", (int)moveMode);
        animator.SetBool("isExhausted", moveMode == MoveMode.Exhausted);

        animator.SetBool("isStumbling", state == FairyState.Stumble);
        animator.SetBool("isStanding", state == FairyState.Standig);
        animator.SetBool("isMissingBean", state == FairyState.MissingBean);
    }

    public void SetPath(List<Vector3> newPath, bool toResource)
    {
        if (newPath == null || newPath.Count == 0) return;

        //path = new List<Vector3>(newPath); 원래경로 
        // 경로를 랜덤하게 변형 (노이즈 추가)
        path = new List<Vector3>();
        Vector3 offset = new Vector3(
            Random.Range(-noiseMagnitude, noiseMagnitude),
            0f,
            Random.Range(-noiseMagnitude, noiseMagnitude)
        );

        foreach (var point in newPath)
        {
            path.Add(point + offset);
        }

        //  toTarget일 경우 → 경로를 뒤집는다
        
        if (!toResource)
        {
            path.Reverse();
        }
        // 가장 가까운 지점 찾기 (or 그냥 0에서 시작해도 됨)
        float shortestDistance = float.MaxValue;
        int closestIndex = 0;

        for (int i = 0; i < path.Count; i++)
        {
            float dist = Vector3.Distance(transform.position, path[i]);
            if (dist < shortestDistance)
            {
                shortestDistance = dist;
                closestIndex = i;
            }
        }

        // 항상 앞에서부터 시작해도 되고, closestIndex 써도 OK
        pathIndex = closestIndex;
        state = toResource ? FairyState.MoveToResource : FairyState.MoveToTarget;

       // Debug.Log($"[SetPath] Direction: {(toResource ? "A ?? B" : "B ?? A")}, pathIndex = {pathIndex}, pathCount = {path.Count}, FirstPoint: {path[0]}, LastPoint: {path[^1]}");
    }
    Vector3 tar;
    private void HandleMovement()
    {
        if (path == null || pathIndex >= path.Count) return;

        UpdateMoveMode();

        float speed = moveMode switch
        {
            MoveMode.Run => runSpeed,
            MoveMode.Walk => walkSpeed,
            _ => 0f,
        };


        Vector3 target = path[pathIndex]+ GetNoisyOffset();
        transform.position = Vector3.MoveTowards(transform.position, target, moveSpeed * speed * Time.deltaTime);

        Vector3 direction = target - transform.position;
        tar = direction;
        if (IsBlockedByObstacle(direction))
        {
            // 멈춤 상태로 전환
            state = FairyState.Blocked;
            Debug.Log("요정이 막혔어요!");
            return;
        }

        if (direction.sqrMagnitude > 0.001f)
        {
            transform.rotation = Quaternion.Slerp(transform.rotation, Quaternion.LookRotation(target - transform.position), Time.deltaTime * 5f);
        }
        if (Vector3.Distance(transform.position, target) < 0.05f)
        {
            pathIndex++;
            if (pathIndex >= path.Count)
            {
                // 다음 상태로 전환
                if (state == FairyState.MoveToResource) state = FairyState.PickUp;
                else if (state == FairyState.MoveToTarget) state = FairyState.DropOff;
            }
        }

    }

    private void PerformPickup()
    {
        if (carriedItem == null)
        {
            GameObject bean = ResourceManager.Instance.RequestBeanFromClosest(transform.position);
            if (bean != null)
            {
                bean.transform.SetParent(carrySlot);
                bean.transform.localPosition = Vector3.zero;
                carriedItem = bean;

                //Debug.Log("콩 집었음");

                // 콩을 집은 후 상태 전이: 목적지로 출발
                SetPath(GameManager.Instance.GetLatestPath(), false);
                hasDropped = false;

            }
            else
            {
                Debug.Log("자원이 없음!");
                state = FairyState.Idle;  // 자원이 없으면 일단 대기
            }
        }
    }
    private void PerformDropOff()
    {
        if (hasDropped) return;

        if (carriedItem != null)
        {
            var dropTarget = GameManager.Instance.GetDeliveryPoint();
            //dropTarget.ReceiveBean(carriedItem);
            carriedItem = null;
            //Debug.Log("콩 배달 완료!");

            ScoreManager.Instance.AddScore(); // 점수 추가!
        }

        state = FairyState.Idle;
        hasDropped = true;

        LevelManager.Instance.AddScore(1);

        SetPath(GameManager.Instance.GetLatestPath(), true);
    }

    public bool IsGoingToResource()
    {
        return state == FairyState.MoveToResource || state == FairyState.PickUp;
    }

    private void UpdateMoveMode()
    {
        switch (moveMode)
        {
            case MoveMode.Run:
                PlayEffect(FairyEffectType.Dust);
                stamina -= staminaDrainRate * Time.deltaTime;
                if (stamina <= 0.01f)
                {
                    stamina = 0f;
                    moveMode = MoveMode.Exhausted;
                    modeSwitchTimer = Random.Range(.2f, 1.0f); // 숨 고르기 시간
                }
                break;

            case MoveMode.Walk:
                PlayEffect(FairyEffectType.none);
                stamina += staminaRegenRate * Time.deltaTime;
                stamina = Mathf.Clamp01(stamina);
                break;

            case MoveMode.Exhausted:
                stamina += staminaRegenRate * Time.deltaTime;
                stamina = Mathf.Clamp01(stamina);
                modeSwitchTimer -= Time.deltaTime;

                if (modeSwitchTimer <= 0 && stamina >= 0.2f)
                {
                    moveMode = MoveMode.Walk;
                }
                break;

            case MoveMode.Idle:
            default:
                break;
        }
        animator.SetInteger("moveMode", (int)moveMode);
        animator.SetBool("isExhausted", moveMode == MoveMode.Exhausted);
    }
    private void OnGUI()
    {
        GUI.Label(new Rect(10, 10 + 20 * GetInstanceID(), 200, 20), $"[Fairy] Mode: {moveMode}, Stamina: {stamina:F2}");
    }

    public void PlayEffect(FairyEffectType type)
    {
        foreach (var kvp in effects)
        {
            if (kvp.Key == type)
            {
                if (!kvp.Value.isPlaying) kvp.Value.Play();
            }
            else
            {
                if (kvp.Value.isPlaying) kvp.Value.Stop();
            }
        }
    }

    private void AvoidOtherFairies()
    {
        foreach (var other in GameManager.Instance.fairies)
        {
            if (other == this) continue;

            float dist = Vector3.Distance(transform.position, other.transform.position);
            if (dist < avoidDistance && dist > 0.1f)
            {
                Vector3 pushDir = (transform.position - other.transform.position).normalized;
                transform.position += pushDir * avoidStrength * Time.deltaTime;
            }
        }
    }

    private Vector3 GetNoisyOffset()
    {
        float x = Mathf.PerlinNoise(Time.time * 0.5f, idSeed) - 0.5f;
        float z = Mathf.PerlinNoise(Time.time * 0.5f + 100f, idSeed + 1f) - 0.5f;

        return new Vector3(x, 0, z) * 1.5f; // 0.3f는 노이즈 강도
    }

    private bool IsBlockedByObstacle(Vector3 direction)
    {
        return Physics.Raycast(transform.position, direction.normalized, out RaycastHit hit, 0.6f)
            && hit.collider.CompareTag("Obstacle");
    }

    public float GetCurrentMoveSpeed()
    {
        return moveMode switch
        {
            MoveMode.Run => runSpeed,
            MoveMode.Walk => walkSpeed,
            _ => 0f,
        };
    }
    private void CheckStumble()
    {
        if (isStumbling) return; // 이미 넘어져있으면 무시

        if (Random.value < stumbleChancePerSecond * Time.deltaTime)
        {
            StartCoroutine(StumbleRoutine());
        }
    }
    private IEnumerator StumbleRoutine()
    {
        isStumbling = true; 
        state = FairyState.Stumble; //  넘어지는 상태로 전환
        animator.SetTrigger("isStumbling");

        UpdateAnimator(); // 애니메이션 갱신

        Debug.Log($"[Fairy] 요정이 넘어졌다! ({name})");

        if (carriedItem != null)
        {
            // 1. 콩을 떨어뜨리고
            DropAndRollBean();

            // 2. 1초간 넘어짐 상태
            yield return new WaitForSeconds(3.0f);
            state = FairyState.Standig;
            UpdateAnimator();
            yield return new WaitForSeconds(1.0f);
            state = FairyState.MissingBean;
            moveMode = MoveMode.Run;
            UpdateAnimator(); // 상태 바뀌었으니 다시 애니메이션 갱신
            // 3. 떨어뜨린 콩 포지션으로 이동
            SetPath(new List<Vector3> { transform.position, droppedBean.transform.position }, true);

        }
        else
        {
            yield return new WaitForSeconds(3.0f);
            state = FairyState.Standig;
            UpdateAnimator();
            yield return new WaitForSeconds(1.0f);
            // 콩 없으면 그냥 계속 경로 따라감
            state = FairyState.MoveToResource; // or 원래 상태 복귀
            moveMode = MoveMode.Run;
            UpdateAnimator();
        }

        isStumbling = false;
    }

    private void DropAndRollBean()
    {
        if (carriedItem != null)
        {
            droppedBean = carriedItem;
            carriedItem.transform.parent = null;

            Rigidbody rb = droppedBean.GetComponent<Rigidbody>();
            if (rb != null)
            {
                rb.isKinematic = false; // 리지드바디 활성화
                rb.AddForce(new Vector3(
                    Random.Range(-1f, 1f),
                    1f,
                    Random.Range(-1f, 1f)
                ) * 2f, ForceMode.Impulse); // 살짝 튀면서 굴러가게
            }

            //  요정과 콩 충돌 끄기
            CapsuleCollider beanCol = carriedItem.GetComponent<CapsuleCollider>();
            if (fairyCol != null && beanCol != null)
            {
                Physics.IgnoreCollision(fairyCol, beanCol, false);
            }

            carriedItem = null; // 현재 들고있는 상태 해제
        }
    }

    private void HandleMoveToDroppedBean()
    {
        if (droppedBean == null)
        {
            // 에러방지
            Debug.LogWarning("DroppedBean이 없습니다!");
            return;
        }

        Vector3 target = droppedBean.transform.position;
        transform.position = Vector3.MoveTowards(transform.position, target, runSpeed * Time.deltaTime);
        transform.rotation = Quaternion.Slerp(transform.rotation, Quaternion.LookRotation(target - transform.position), Time.deltaTime * 5f);

        if (Vector3.Distance(transform.position, target) < .7f)
        {
            PickUpDroppedBean();
        }
    }
    private void PickUpDroppedBean()
    {

        carriedItem = droppedBean;
        carriedItem.transform.SetParent(carrySlot);
        carriedItem.transform.localPosition = Vector3.zero;
        carriedItem.transform.localRotation = Quaternion.identity; // 콩회전 초기화

        Rigidbody rb = droppedBean.GetComponent<Rigidbody>();
        if (rb != null)
        {
            rb.isKinematic = true;
        }

        Collider fairyCol = GetComponentInChildren<CapsuleCollider>();
        if (fairyCol != null)
        {
            fairyCol.isTrigger = false;
        }

        droppedBean = null;

        // 다시 원래 Path 이어서 이동
        SetPath(GameManager.Instance.GetLatestPath(), false); // toTarget 방향
        moveMode = MoveMode.Walk; // 다시 walk로 전환
        Debug.Log($"[Fairy] 콩 다시 주웠다! ({name})");
        UpdateAnimator();
    }

    public void OnStumbleEnd()
    {
        isStumbling = false;
        UpdateAnimator();
    }
}

