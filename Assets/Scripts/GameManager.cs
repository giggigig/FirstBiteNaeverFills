using System.Collections.Generic;
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
    public PathDrawer pathDrawer; // 직접 연결도 가능
    private List<Vector3> latestPath;

    public bool isStarting = false; // 게임 시작 여부

    public DeliveryPointManager deliveryPointManager; 

    void Awake()
    {
        if (Instance == null) Instance = this;
        else Destroy(gameObject);
    }
    void Start()
    {
        fairies = new List<Fairy>(FindObjectsByType<Fairy>(FindObjectsSortMode.None));
        Debug.Log($"[GameManager] 요정 수: {fairies.Count}");
    }
    public void AssignPathToAllFairies(List<Vector3> path, TaskType task)
    {
        foreach (var fairy in fairies)
        {
            fairy.SetPath(path, task == TaskType.MoveToResource);
        }
    }

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
    public void SendFairiesToTarget()
    {
        foreach (var fairy in fairies)
            fairy.SetPath(latestPath, false);
    }

    public DeliveryPoint GetDeliveryPoint()
    {
        return deliveryPointManager.deliveryPoint;
    }

    public void UpdatePathForAllFairies(List<Vector3> path)
    {
        foreach (var fairy in fairies)
        {
            bool toResource = fairy.IsGoingToResource();
            fairy.SetPath(path, toResource);
        }
    }
}
