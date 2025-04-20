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
    Blocked
}

public enum MoveMode { Idle, Walk, Run, Exhausted }
public enum FairyEffectType { Dust, Heart, Exhaust }

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
    public Transform carryPoint; // ???? ?? ???? (?? GameObject)
    private bool hasDropped = false;


    [Header("fairyMoveController")]
    [SerializeField] private float moveSpeed = 1f; // ???????? ?????? ?????????????? ??????
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

    private MoveMode moveMode = MoveMode.Walk;
    private float modeSwitchTimer = 0f;

    private Dictionary<FairyEffectType, ParticleSystem> effects;

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
    }

    void Update()
    {
        switch (state)
        {
            case FairyState.MoveToResource:
                moveMode = MoveMode.Run;
                HandleMovement();
                AvoidOtherFairies();
                break;
            case FairyState.MoveToTarget:
                moveMode = MoveMode.Walk;
                HandleMovement();
                AvoidOtherFairies();
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
        }
        //if (bean == null) state = FairyState.Waiting;

    }

    public void SetPath(List<Vector3> newPath, bool toResource)
    {
        if (newPath == null || newPath.Count == 0) return;

        // toTarget?? ???? ?? ?????? ????????
        path = new List<Vector3>(newPath);
        if (!toResource)
        {
            path.Reverse();
        }
        // ???? ?????? ???? ???? (or ???? 0???? ???????? ??)
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

        // ???? ?????????? ???????? ????, closestIndex ???? OK
        pathIndex = closestIndex;
        state = toResource ? FairyState.MoveToResource : FairyState.MoveToTarget;

        Debug.Log($"[SetPath] Direction: {(toResource ? "A ?? B" : "B ?? A")}, pathIndex = {pathIndex}, pathCount = {path.Count}, FirstPoint: {path[0]}, LastPoint: {path[^1]}");
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
        transform.position = Vector3.MoveTowards(transform.position, target, speed * Time.deltaTime);

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
                // ???? ?????? ????
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
                bean.transform.SetParent(carryPoint);
                bean.transform.localPosition = Vector3.zero;
                carriedItem = bean;

                Debug.Log("?? ??????");

                // ???? ???? ?? ???? ????: ???????? ????
                SetPath(GameManager.Instance.GetLatestPath(), false);
                hasDropped = false;

            }
            else
            {
                Debug.Log("?????? ????!");
                state = FairyState.Idle; // ?????? ?????? ???? ????
            }
        }
    }
    private void PerformDropOff()
    {
        if (hasDropped) return;

        if (carriedItem != null)
        {
            var dropTarget = GameManager.Instance.GetDeliveryPoint();
            dropTarget.ReceiveBean(carriedItem);
            carriedItem = null;
            Debug.Log("?? ???? ????!");

            ScoreManager.Instance.AddScore(); // ???? ????!
        }

        state = FairyState.Idle;
        hasDropped = true;
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
                    modeSwitchTimer = Random.Range(.2f, 1.0f); // ?? ?????? ????
                }
                break;

            case MoveMode.Walk:
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
            if (dist < avoidDistance && dist > 0.01f)
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

    private void OnDrawGizmos()
    {
        Gizmos.DrawLine(transform.position, tar);
    }
}

