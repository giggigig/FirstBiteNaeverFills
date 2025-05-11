using UnityEngine;
using System.Collections.Generic;

//public enum MoveMode
//{
//    Idle,
//    Walk,
//    Run,
//    Exhausted
//}

//public enum FairyState
//{
//    Idle,
//    MoveToResource,
//    PickUp,
//    MoveToTarget,
//    DropOff,
//    Blocked,
//    Stumble,
//    MissingItem,
//}

public class BaseFairy : LivingBeing
{
    [Header("Base Fairy Settings")]
    protected Animator animator;
    protected List<Vector3> path = new List<Vector3>();
    protected int pathIndex = 0;

    protected GameObject carriedItem;
    [SerializeField] protected Transform carrySlot;

    [Header("Move Mode Settings")]
    protected MoveMode moveMode = MoveMode.Idle;
    private float stamina = 100f;
    private float maxStamina = 100f;
    private float staminaDecreaseRate = 10f;
    private float staminaRecoverRate = 5f;
    private float runThreshold = 50f;
    private float exhaustedThreshold = 1f;

    protected FairyData fairyData; // 요정 초기화용
    protected FairyState state = FairyState.Idle;
    protected bool goingToResource = true; // 패쓰 방향 저장
    protected ParticleSystem runParticle;

    protected bool isGrabbed = false;

    protected virtual void Awake()
    {
        animator = GetComponentInChildren<Animator>();
        runParticle = GetComponentInChildren<ParticleSystem>();    
    }

    protected virtual void Update()
    {
       // Debug.Log($"[Fairy] Update 동작중 - state: {state}, moveMode: {moveMode}, pathIndex: {pathIndex}/{path.Count}");
       if(isGrabbed)
        {
            particleUpdate();
            return;
        }
        HandleMovement();
        HandleStamina();
        UpdateAnimator();
        HandleStateLogic();
    }
    protected virtual void HandleStateLogic()
    {
        if (state == FairyState.PickUp)
        {
            PerformPickup();
        }
        else if (state == FairyState.DropOff)
        {
            PerformDropoff();
        }
    }
    protected virtual void particleUpdate()
    {
        if (moveMode==MoveMode.Run)
        {
            if (runParticle != null && runParticle.isPlaying == false)
            {
                runParticle.Play();
            }
        }
        else
        {
            if (runParticle != null && runParticle.isPlaying == true)
            {
                runParticle.Stop();
            }
        }
    }
    protected virtual void HandleMovement()
    {
        if (path == null || pathIndex >= path.Count) return;

        Vector3 target = path[pathIndex];

        // 1. Path 방향 (x, z만)
        Vector3 toTarget = (target - transform.position);
        toTarget.y = 0f;
        toTarget = toTarget.normalized;

        // 2. Boid 보조 힘 (Separation)
        Vector3 separationForce = CalculateSeparationForce();

        // 3. 최종 이동 방향+방향 보간: path 방향 80% + separation 20% (조정 가능)
        Vector3 desiredDirection = (toTarget * 0.3f + separationForce * 0.7f).normalized;


        // 4. 실제 이동
        transform.position += desiredDirection * GetCurrentMoveSpeed() * Time.deltaTime;

        // 5. y축 고정
        transform.position = new Vector3(transform.position.x, 0f, transform.position.z);

        // 6. 방향 회전
        if (desiredDirection != Vector3.zero)
        {
            Quaternion targetRotation = Quaternion.LookRotation(desiredDirection);
            transform.rotation = Quaternion.Slerp(transform.rotation, targetRotation, Time.deltaTime * 5f);
        }

        // 7. 목적지 도착 체크
        Vector3 flatTarget = new Vector3(target.x, transform.position.y, target.z); // y는 현재 높이에 맞춤
        if (Vector3.Distance(transform.position, flatTarget) < 0.5f)
        {
            pathIndex++;
            if (pathIndex >= path.Count)
            {
                if (state == FairyState.MoveToResource)
                    state = FairyState.PickUp;
                else if (state == FairyState.MoveToTarget)
                    state = FairyState.DropOff;
            }
        }
    }

    //protected virtual void HandleMovement()
    //{
    //    if (path == null || pathIndex >= path.Count) return;

    //    Vector3 target = path[pathIndex];
    //    transform.position = Vector3.MoveTowards(transform.position, target, GetCurrentMoveSpeed() * Time.deltaTime);

    //    if (target - transform.position != Vector3.zero)
    //    {
    //        Quaternion targetRotation = Quaternion.LookRotation(target - transform.position);
    //        transform.rotation = Quaternion.Slerp(transform.rotation, targetRotation, Time.deltaTime * 5f);
    //    }

    //    if (Vector3.Distance(transform.position, target) < 0.05f)
    //    {
    //        pathIndex++;
    //        if (pathIndex >= path.Count)
    //        {
    //            if (state == FairyState.MoveToResource)
    //                state = FairyState.PickUp;
    //            else if (state == FairyState.MoveToTarget)
    //                state = FairyState.DropOff;
    //        }
    //    }
    //}

    private Vector3 CalculateSeparationForce()
    {
        Vector3 force = Vector3.zero;
        int neighborCount = 0;
        float separationRadius = 1.5f;

        foreach (var otherFairy in GameManager.Instance.fairies)
        {
            if (otherFairy == this) continue;

            float dist = Vector3.Distance(transform.position, otherFairy.transform.position);
            if (dist < separationRadius)
            {
                Vector3 away = (transform.position - otherFairy.transform.position);
                away.y = 0f;

                // 거리 기반 falloff (멀수록 힘 약하게)
                float strength = Mathf.Clamp01(1f - dist / separationRadius);

                force += away.normalized * strength;
                neighborCount++;
            }
        }

        if (neighborCount > 0)
        {
            force /= neighborCount;
        }

        return force * 1.0f; // 힘 자체는 조금 약하게 (1.0배)
    }


    protected virtual void PerformPickup()
    {
        var bean = ResourceManager.Instance.RequestBeanFromClosest(transform.position);
        if (bean != null)
        {
            PickUpItem(bean);
            state = FairyState.MoveToTarget;
            SetPath(GameManager.Instance.GetLatestPath(), false); // ← B 방향으로!
        }
        else
        {
            Debug.LogWarning("[Fairy] 콩 없음! ResourceManager에서 못 받음");
            state = FairyState.Idle;
        }
    }
    protected virtual void PerformDropoff()
    {
        if (carriedItem != null)
        {
            DropItem(); // 부모에서 처리함

            Debug.Log("[Fairy] 콩 배달 완료!");

            // 점수 추가
            LevelManager.Instance.AddDScore(1);

            // 다음 경로 재설정
            SetPath(GameManager.Instance.GetLatestPath(), true); // 다시 자원 A로
            state = FairyState.MoveToResource;
        }
        else
        {
            Debug.LogWarning("[Fairy] Dropoff 요청됐는데 carriedItem이 없음!");
            state = FairyState.Idle;
        }
    }
    protected virtual void HandleStamina()
    {
        if (moveMode == MoveMode.Run)
        {
            stamina -= staminaDecreaseRate * Time.deltaTime;
            if (stamina <= exhaustedThreshold)
            {
                stamina = Mathf.Max(stamina, 0f);
                moveMode = MoveMode.Exhausted;
            }
        }
        else if (moveMode == MoveMode.Walk || moveMode == MoveMode.Exhausted)
        {
            stamina += staminaRecoverRate * Time.deltaTime;
            stamina = Mathf.Min(stamina, maxStamina);

            if (stamina >= runThreshold && Random.value < 0.02f)
            {
                moveMode = MoveMode.Run;
            }
            else
            {
                moveMode = MoveMode.Walk;
            }
        }
        particleUpdate();
    }

    protected virtual void UpdateAnimator()
    {
        if (animator != null)
        {
            animator.SetInteger("moveMode", (int)moveMode);
        }
    }

    // 경로 설정 (자원쪽/타겟쪽 구분)
    public virtual void SetPath(List<Vector3> newPath, bool toResource)
    {
        if (newPath == null || newPath.Count == 0) return;
        float noiseMagnitude = 1.0f;
        //path = new List<Vector3>(newPath);
        // 경로를 랜덤하게 변형 (노이즈 추가)
        path = new List<Vector3>();
        Vector3 noiseOffset = new Vector3(
            Random.Range(-noiseMagnitude, noiseMagnitude),
            0f,
            Random.Range(-noiseMagnitude, noiseMagnitude)
        );

        // 왕복 경로 분리 offset
        float sideOffset = toResource ? -2f : 2f;
        Vector3 offsetDir = Vector3.Cross((newPath[^1] - newPath[0]).normalized, Vector3.up); // 경로 기준 좌측 방향

        pathIndex = 0;
        goingToResource = toResource;

        foreach (var point in newPath)
        {
            Vector3 offsetPoint = point + noiseOffset + offsetDir * sideOffset;
            offsetPoint.y = 0f;
            path.Add(offsetPoint);
        }
        if (!toResource)
        {
            path.Reverse();
        }

      

        //가장 가까운 지점 찾기(or 그냥 0에서 시작해도 됨)
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
        pathIndex = closestIndex;

        state = toResource ? FairyState.MoveToResource : FairyState.MoveToTarget;
        moveMode = MoveMode.Walk;
    }

    // 현재 경로 목적지 리턴
    public virtual bool IsGoingToResource()
    {
        return goingToResource;
    }

    //  현재 속도 리턴
    public virtual float GetCurrentMoveSpeed()
    {
        return GetCurrentSpeed();
    }

    protected virtual float GetCurrentSpeed()
    {
       // Debug.Log($"[Fairy] MoveMode: {moveMode}, Speed: {moveSpeed}");
        switch (moveMode)
        {
            case MoveMode.Walk: return moveSpeed;
            case MoveMode.Run: return moveSpeed * 1.5f;
            case MoveMode.Exhausted: return moveSpeed * 0.5f;
            default: return 0f;
        }
    }

    // 요정 초기화
    public virtual void Initialize(FairyData data)
    {
        fairyData = data;
        if (data != null)
        {
            moveSpeed = data.baseMoveSpeed;
            //staminaRecoverRate = data.staminaRecovery;
            //staminaDecreaseRate = data.staminaConsume;
            // 추가 스탯 적용 가능
        }
    }

    public virtual void PickUpItem(GameObject item)
    {
        carriedItem = item;
        carriedItem.transform.SetParent(carrySlot);
        carriedItem.transform.localPosition = Vector3.zero;

        Rigidbody rb = carriedItem.GetComponent<Rigidbody>();
        if (rb != null)
        {
            rb.isKinematic = true;
        }
    }

    public virtual void DropItem()
    {
        if (carriedItem != null)
        {
            carriedItem.transform.parent = null;

            Rigidbody rb = carriedItem.GetComponent<Rigidbody>();
            if (rb != null)
            {
                rb.isKinematic = false;
                rb.AddForce(Vector3.up * 1f + Random.insideUnitSphere * 1f, ForceMode.Impulse);
            }

            carriedItem = null;
        }
    }

    public virtual void SetGrabbed(bool value)
    {
        isGrabbed = value;

        if (animator != null)
        {
            if (value)
            {
                animator.SetTrigger("grabTrigger"); // 한 번만 실행
                animator.SetBool("isGrabbed", true); 
            }
            else
            {
                animator.SetBool("isGrabbed", false); // 평소 상태 복귀
            }
        }

        if (value)
        {
            moveMode = MoveMode.Idle;
            state = FairyState.Idle;
        }
    }

    public virtual void ResumeAfterGrab()
    {
        SetPath(GameManager.Instance.GetLatestPath(), goingToResource); // 방향 조건도 가능
    }
    private void OnDrawGizmos()
    {
        if (Application.isPlaying)
        {
            Gizmos.color = Color.cyan;
            Vector3 dir = (path != null && pathIndex < path.Count)
                ? (path[pathIndex] - transform.position)
                : transform.forward;

            dir.y = 0f;
            Gizmos.DrawLine(transform.position, transform.position + dir.normalized * 2f);
        }
    }
}
