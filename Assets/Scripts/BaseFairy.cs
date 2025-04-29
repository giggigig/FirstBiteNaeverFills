using UnityEngine;
using System.Collections.Generic;


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
    private float staminaDecreaseRate = 10f;  // 초당 감소
    private float staminaRecoverRate = 5f;     // 초당 회복
    private float runThreshold = 50f;          // 50 이상이면 뛴다
    private float exhaustedThreshold = 1f;     // 1 이하면 Exhausted

    protected virtual void Awake()
    {
        animator = GetComponentInChildren<Animator>();
    }

    protected virtual void Update()
    {
        HandleMovement();
        HandleStamina();
        UpdateAnimator();
    }

    protected virtual void HandleMovement()
    {
        if (path == null || pathIndex >= path.Count) return;

        Vector3 target = path[pathIndex];
        transform.position = Vector3.MoveTowards(transform.position, target, GetCurrentSpeed() * Time.deltaTime);

        // 방향 회전
        if (target - transform.position != Vector3.zero)
        {
            Quaternion targetRotation = Quaternion.LookRotation(target - transform.position);
            transform.rotation = Quaternion.Slerp(transform.rotation, targetRotation, Time.deltaTime * 5f);
        }

        if (Vector3.Distance(transform.position, target) < 0.05f)
        {
            pathIndex++;
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

            if (stamina >= runThreshold && Random.value < 0.02f) // 달릴 확률
            {
                moveMode = MoveMode.Run;
            }
            else
            {
                moveMode = MoveMode.Walk;
            }
        }
    }

    protected virtual float GetCurrentSpeed()
    {
        switch (moveMode)
        {
            case MoveMode.Walk: return moveSpeed;
            case MoveMode.Run: return moveSpeed * 1.5f;
            case MoveMode.Exhausted: return moveSpeed * 0.5f;
            default: return 0f;
        }
    }

    protected virtual void UpdateAnimator()
    {
        if (animator != null)
        {
            animator.SetInteger("moveMode", (int)moveMode);
        }
    }

    public virtual void SetPath(List<Vector3> newPath)
    {
        if (newPath == null || newPath.Count == 0) return;

        path = new List<Vector3>(newPath);
        pathIndex = 0;
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
                rb.AddForce(Random.insideUnitSphere * 2f, ForceMode.Impulse);
            }

            carriedItem = null;
        }
    }
}
