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
    DropOff
}

public enum MoveMode { Idle, Walk, Run, Exhausted }

public class Fairy : MonoBehaviour
{
    public FairyState state = FairyState.Idle;

    private List<Vector3> path;
    private int pathIndex = 0;

    private GameObject carriedItem = null;
    public Transform carryPoint; // ���� �� ��ġ (�� GameObject)
    private bool hasDropped = false;


    [Header("fairyMoveController")]
    [SerializeField] private float moveSpeed = 1f; // �Ⱦ����� ���߿� ���Ҽ��������� ���ܵ�
    [SerializeField] private float walkSpeed = 1f;
    [SerializeField] private float runSpeed = 2f;
    [SerializeField] private float stamina = 5f; // 0.0 ~ 1.0
    [SerializeField] private float staminaDrainRate = 0.2f; // per second
    [SerializeField] private float staminaRegenRate = 0.1f; // per second


    private MoveMode moveMode = MoveMode.Walk;
    private float modeSwitchTimer = 0f;

    void Update()
    {
        switch (state)
        {
            case FairyState.MoveToResource:
                HandleMovement();
                break;
            case FairyState.MoveToTarget:
                HandleMovement();
                break;

            case FairyState.PickUp:
                PerformPickup();
                break;

            case FairyState.DropOff:
                PerformDropOff();
                break;
        }
        //if (bean == null) state = FairyState.Waiting;

    }

    public void SetPath(List<Vector3> newPath, bool toResource)
    {
        if (newPath == null || newPath.Count == 0) return;

        // toTarget�� ��� �� ��θ� �����´�
        path = new List<Vector3>(newPath);
        if (!toResource)
        {
            path.Reverse();
        }
        // ���� ����� ���� ã�� (or �׳� 0���� �����ص� ��)
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

        // �׻� �տ������� �����ص� �ǰ�, closestIndex �ᵵ OK
        pathIndex = closestIndex;
        state = toResource ? FairyState.MoveToResource : FairyState.MoveToTarget;

        Debug.Log($"[SetPath] Direction: {(toResource ? "A �� B" : "B �� A")}, pathIndex = {pathIndex}, pathCount = {path.Count}, FirstPoint: {path[0]}, LastPoint: {path[^1]}");
    }

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


        Vector3 target = path[pathIndex];
        transform.position = Vector3.MoveTowards(transform.position, target, speed * Time.deltaTime);

        Vector3 direction = target - transform.position;

        if (direction.sqrMagnitude > 0.001f)
        {
            transform.rotation = Quaternion.Slerp(transform.rotation, Quaternion.LookRotation(target - transform.position), Time.deltaTime * 5f);
        }
        if (Vector3.Distance(transform.position, target) < 0.05f)
        {
            pathIndex++;
            if (pathIndex >= path.Count)
            {
                // ���� ���·� ��ȯ
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

                Debug.Log("�� ������");

                // ���� ���� �� ���� ����: �������� ���
                SetPath(GameManager.Instance.GetLatestPath(), false);
                hasDropped = false;

            }
            else
            {
                Debug.Log("�ڿ��� ����!");
                state = FairyState.Idle; // �ڿ��� ������ �ϴ� ���
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
            Debug.Log("�� ��� �Ϸ�!");

            ScoreManager.Instance.AddScore(); // ���� �߰�!
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
                stamina -= staminaDrainRate * Time.deltaTime;
                if (stamina <= 0.01f)
                {
                    stamina = 0f;
                    moveMode = MoveMode.Exhausted;
                    modeSwitchTimer = Random.Range(.2f, 1.0f); // �� ���� �ð�
                }
                if (stamina >= 0.3f && Random.value < 0.02f)
                {
                    moveMode = MoveMode.Walk;
                }
                break;

            case MoveMode.Walk:
                stamina += staminaRegenRate * Time.deltaTime;
                stamina = Mathf.Clamp01(stamina);

                // �ణ�� ���������� �޸��� ����
                if (stamina >= 0.3f && Random.value < 0.02f)
                {
                    moveMode = MoveMode.Run;
                }
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
}

