using System.Collections.Generic;
using TMPro;
using UnityEngine;

public class GameManager : MonoBehaviour
{
    public enum TaskType
    {
        MoveToResource,
        MoveToTarget
    }
    public static GameManager Instance;

    public List<Fairy> fairies = new List<Fairy>(); // 요정 여러 명 관리 가능
    [SerializeField] private int fairyCount = 0;

    public PathDrawer pathDrawer; // 직접 연결도 가능
    private List<Vector3> latestPath;

    public bool isStarting = false; // 게임 시작 여부

    public DeliveryPointManager deliveryPointManager;

    [Header("SpawnFairy")]
    [SerializeField] private float spawnInterval = 10f;
    private float spawnTimer = 0f;
    [SerializeField] private int maxFairyCount = 10;
    public GameObject fairyPrefab;
    public Transform fairySpawnArea;
    [SerializeField] private List<FairyData> fairyDatas; // 요정 데이터 목록

    [Header("UI")]
    public TextMeshProUGUI averageTimeText; // UI 연결
    [SerializeField] private TextMeshProUGUI fairyCountText; // UI 연결


    void Awake()
    {
        if (Instance == null) Instance = this;
        else Destroy(gameObject);

        LoadFairyDatas();
    }
    void Start()
    {
        fairies = new List<Fairy>(FindObjectsByType<Fairy>(FindObjectsSortMode.None));
        Debug.Log($"[GameManager] 요정 수: {fairies.Count}");
    }

    private void Update()
    {
        AutoSpawnFairy();
    }
    /*사용x
    public void AssignPathToAllFairies(List<Vector3> path, TaskType task)
    {
        foreach (var fairy in fairies)
        {
            // fairy.SetPath(path, task == TaskType.MoveToResource);

            List<Vector3> noisyPath = new List<Vector3>();
            foreach (var point in path)
            {
                Vector3 offset = new Vector3(
                    Random.Range(-10f, 10f),
                    0,
                    Random.Range(-10f, 10f)
                );
                noisyPath.Add(point + offset);
            }
            fairy.SetPath(noisyPath, task == TaskType.MoveToResource);
        }
    }
    */
    public void StoreLatestPath(List<Vector3> path)
    {
        latestPath = path;
    }
    public List<Vector3> GetLatestPath() => latestPath;

    public void SendFairiesToResource()
    {
        if (latestPath == null || latestPath.Count == 0) return;

        foreach (var fairy in fairies)
        {
            fairy.SetPath(latestPath, true);
        }
    }

    public DeliveryPoint GetDeliveryPoint()
    {
        return deliveryPointManager.deliveryPoint;
    }
    public void SendFairiesToTarget()
    {
        foreach (var fairy in fairies)
            fairy.SetPath(latestPath, false);
    }

    public void UpdatePathForAllFairies(List<Vector3> path)
    {
        foreach (var fairy in fairies)
        {
            bool toResource = fairy.IsGoingToResource();
            fairy.SetPath(path, toResource);
        }
    }
    private void AutoSpawnFairy()
    {
        spawnTimer += Time.deltaTime;

        if (spawnTimer >= spawnInterval)
        {
            spawnTimer = 0f;

            if (fairies.Count < maxFairyCount)
            {
                AddFairy();
                Debug.Log($"[GameManager] 요정 추가됨! 현재 수: {fairies.Count}/{maxFairyCount}");
            }
        }
    }
    public void IncreaseFairyMaxCount(int amount)
    {
        maxFairyCount += amount;
        Debug.Log($"[GameManager] 요정 MaxCount 증가! 새로운 MaxCount: {maxFairyCount}");
    }
    public void AddFairy()
    {
        if (fairyDatas == null || fairyDatas.Count == 0)
        {
            Debug.LogWarning("요정 데이터가 없습니다!");
            return;
        }

        // 1. 랜덤 요정 선택
        FairyData selectedData = PickRandomFairyData();

        // 2. 요정 생성
        Vector3 spawnPos = fairySpawnArea != null
            ? fairySpawnArea.position + new Vector3(Random.Range(-1f, 1f), 0f, Random.Range(-1f, 1f))
            : Vector3.zero;

        GameObject fairyObj = Instantiate(fairyPrefab, spawnPos, Quaternion.identity);

        // 3. 요정 초기화
        Fairy fairy = fairyObj.GetComponent<Fairy>();
        if (fairy != null)
        {
            fairy.Initialize(selectedData);
            fairies.Add(fairy);
            fairy.SetPath(latestPath, true); // 기존 패스 따라가기
        }
        fairyCount++;
        UpdateFairyCountUI();
    }

    private void UpdateFairyCountUI()
    {
        fairyCountText.text = $"fairyCount: {fairyCount}";
    }

    private FairyData PickRandomFairyData()
    {
        // 나중에 레어 확률 조정 가능 (예: 5% 확률로 레어 뽑기)
        float rareChance = 0.3f; // 10%

        List<FairyData> candidates = new List<FairyData>();

        if (Random.value < rareChance)
        {
            candidates = fairyDatas.FindAll(f => f.isRare);
        }
        else
        {
            candidates = fairyDatas.FindAll(f => !f.isRare);
        }

        if (candidates.Count == 0)
        {
            candidates = fairyDatas; // 예외처리
        }

        return candidates[Random.Range(0, candidates.Count)];
    }

    /// <summary>
    /// 요정의 평균 이동 시간을 계산하고 UI에 표시합니다.
    /// </summary>
    /// <param name="path"></param>
    public void CalculateAndDisplayAverageTravelTime(List<Vector3> path)
    {
        if (path == null || path.Count < 2) return;

        float distance = 0f;
        for (int i = 1; i < path.Count; i++)
        {
            distance += Vector3.Distance(path[i - 1], path[i]);
        }

        float roundTripDistance = distance * 2f;

        float totalTime = 0f;
        int count = 0;

        foreach (var fairy in fairies)
        {
            float speed = fairy.GetCurrentMoveSpeed();
            if (speed > 0f)
            {
                float travelTime = roundTripDistance / speed;
                totalTime += travelTime;
                count++;
            }
        }

        if (count > 0)
        {
            float averageTime = totalTime / count;
            averageTimeText.text = $"average dueration time: {averageTime:F1}sec";

            //  시간에 따라 색상 변경
            if (averageTime > 50f)
            {
                averageTimeText.color = Color.red;
            }
            else if (averageTime > 30f)
            {
                averageTimeText.color = Color.yellow;
            }
            else
            {
                averageTimeText.color = Color.green;
            }
        }
    }
    private void LoadFairyDatas()
    {
        fairyDatas = new List<FairyData>();

        // Resources 폴더 안에 있는 경우
        fairyDatas.AddRange(Resources.LoadAll<FairyData>("ScriptableObjects/Fairys"));

        /* 만약 직접 AssetDatabase 사용해서 에디터에서 불러오려면
        
#if UNITY_EDITOR
        string[] guids = UnityEditor.AssetDatabase.FindAssets("t:FairyData", new[] { "Assets/ScriptableObjects/Fairys" });
        foreach (string guid in guids)
        {
            string path = UnityEditor.AssetDatabase.GUIDToAssetPath(guid);
            FairyData data = UnityEditor.AssetDatabase.LoadAssetAtPath<FairyData>(path);
            if (data != null)
            {
                fairyDatas.Add(data);
            }
        }
#endif
        */
    }
}
