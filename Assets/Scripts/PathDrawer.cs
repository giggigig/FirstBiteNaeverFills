using System.Collections.Generic;
using UnityEngine;
using System.Linq;
using static GameManager;
using UnityEngine.InputSystem;

public class PathDrawer : MonoBehaviour
{
    public enum PointType { A, B }
    public class PathPoint : MonoBehaviour
    {
        public PointType pointType;
    }
[SerializeField] private MeshRenderer startPointRenderer;
[SerializeField] private MeshRenderer endPointRenderer;
    [SerializeField] private LayerMask drawingSurfaceMask;

    public LineRenderer mainLineRenderer;
    public LineRenderer previewLineRenderer;
    public List<Vector3> drawnPath = new ();

    public Vector3 pointOffset = Vector3.up * .1f;

    private bool touchedStartPoint = false;
    private bool touchedEndPoint = false;
    private Vector3 mouseDownWorldPos;
    private Vector3 mouseUpWorldPos;

   // [SerializeField] private GameObject pathDrawingButtonUI; // 버튼 연결
    private bool isPathDrawingMode = false; // 현재 토글 상태

    public void SetPathDrawMode()
    {
        isPathDrawingMode = isPathDrawingMode ? false : true; // 토글 상태 반전
    }
    void Awake()
    {
        mainLineRenderer = GetComponent<LineRenderer>();
    }
    void Start()
    {
        mainLineRenderer.useWorldSpace = true;
        mainLineRenderer.widthMultiplier = 2f;

        previewLineRenderer.useWorldSpace = true;
        previewLineRenderer.widthMultiplier = 2f;

        // 머티리얼 설정
        // lineRenderer.material = new Material(Shader.Find("Sprites/Default"));
        previewLineRenderer.startColor = Color.green;
        previewLineRenderer.endColor = Color.green;
    }
    void Update()
    {
        if (!isPathDrawingMode) return;

        if (Mouse.current.leftButton.wasPressedThisFrame)
        {
            mouseDownWorldPos = Mouse.current.position.ReadValue();
            // 마우스 누를 때 스타트/엔드 포인트 체크
            bool touchedStartNow = CheckStartPoint();
            bool touchedEndNow = CheckEndPoint();

            // 각각 true이면 true 저장
            if (touchedStartNow) touchedStartPoint = true;
            if (touchedEndNow) touchedEndPoint = true;


            UpdatePreviewLine(); // 초기화
        }
        if (Mouse.current.leftButton.isPressed)
        {
            Vector3 worldPos = GetMouseWorldPosition();
            if (drawnPath.Count == 0 || Vector3.Distance(drawnPath[^1], worldPos) > 0.2f)
            {
                drawnPath.Add(worldPos+ pointOffset);
                UpdatePreviewLine();
            }
        }

        SetPointFeedback(CheckStartPoint(), CheckEndPoint());

        if (Mouse.current.leftButton.wasReleasedThisFrame) {

            // 마우스 떼면서 추가로 스타트/엔드 체크
            bool touchedStartNow = CheckStartPoint();
            bool touchedEndNow = CheckEndPoint();

            if (touchedStartNow) touchedStartPoint = true;
            if (touchedEndNow) touchedEndPoint = true;

            if (touchedStartPoint && touchedEndPoint)
            {
                var sorted = GetDirectionSortedPath();

                GameManager.Instance.StoreLatestPath(sorted);
                GameManager.Instance.UpdatePathForAllFairies(sorted);

                GameManager.Instance.CalculateAndDisplayAverageTravelTime(sorted); //

                ApplyToMainLine();
                if (!GameManager.Instance.isStarting)
                {
                    GameManager.Instance.SendFairiesToResource();
                    GameManager.Instance.isStarting = true;
                }
            }
            else
            {
                Debug.Log("무효 경로! previewLineRenderer  제거");
            }

            ClearPreviewLine();
            touchedStartPoint = false;
            touchedEndPoint = false;
        }
    }
    /// <summary>
    /// 공용 raycast함수
    /// </summary>
    /// <param name="hitPoint"></param>
    /// <returns></returns>
    private bool RaycastToSurface(out Vector3 hitPoint)
    {
        Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
        if (Physics.Raycast(ray, out RaycastHit hit, 100f, drawingSurfaceMask))
        {
            hitPoint = hit.point;
            return true;
        }
        hitPoint = Vector3.zero;
        return false;
    }

    public void TogglePathDrawing()
    {
        isPathDrawingMode = !isPathDrawingMode;
        Debug.Log($"Path Drawing Mode: {(isPathDrawingMode ? "ON" : "OFF")}");
    }
    public List<Vector3> GetPath() => drawnPath;


    public List<Vector3> GetLatestPath()
    {
        return new List<Vector3>(drawnPath);
    }

    public List<Vector3> GetDirectionSortedPath()
    {
        if (drawnPath.Count < 2) return drawnPath;

        Vector3 start = drawnPath[0];
        Vector3 end = drawnPath[^1];

        Vector3 resourcePos = ResourceManager.Instance.GetClosestResource(start).transform.position ;
        Vector3 deliveryPos = GameManager.Instance.GetDeliveryPoint().transform.position;

        float distToA = Vector3.Distance(start, resourcePos);
        float distToB = Vector3.Distance(start, deliveryPos);

        // 만약 시작점이 B에 더 가까우면 → 경로 뒤집기
        if (distToB > distToA)
        {
            drawnPath.Reverse();
        }

        return new List<Vector3>(drawnPath);
    }


    Vector3 GetMouseWorldPosition()
    {
        Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
        if (Physics.Raycast(ray, out RaycastHit hitInfo, 100f, drawingSurfaceMask))
        {
            return hitInfo.point;
        }
        return Vector3.zero;
    }
    bool CheckStartPoint()
    {
        Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
        return Physics.Raycast(ray, out RaycastHit hit, 100f) && hit.collider.CompareTag("ResourcePoint");
    }

    bool CheckEndPoint()
    {
        Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
        return Physics.Raycast(ray, out RaycastHit hit, 100f) && hit.collider.CompareTag("DeliveryPoint");
    }

    void UpdatePreviewLine()
    {
        previewLineRenderer.positionCount = drawnPath.Count;
        previewLineRenderer.SetPositions(drawnPath.ToArray());
    }

    void ClearPreviewLine()
    {
        drawnPath.Clear();
        previewLineRenderer.positionCount = 0;
    }

    void ApplyToMainLine()
    {
        mainLineRenderer.positionCount = drawnPath.Count;
        mainLineRenderer.SetPositions(drawnPath.ToArray());
    }

    private void SetPointFeedback(bool isStartValid, bool isEndValid) {
    startPointRenderer.material.color = isStartValid ? Color.green : Color.white;
    endPointRenderer.material.color = isEndValid ? Color.green : Color.white;
    }
}
