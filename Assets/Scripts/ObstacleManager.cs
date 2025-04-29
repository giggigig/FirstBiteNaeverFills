using System.Collections.Generic;
using UnityEngine;

public class ObstacleManager : MonoBehaviour
{
    public GameObject obstaclePrefab;
    public int maxObstacleCount = 10;
    public float spawnInterval = 10f;
    public Vector3 areaMin, areaMax;
    int currentCount = 0;

    private List<GameObject> spawnedObstacles = new List<GameObject>();

    void Start()
    {
        InvokeRepeating(nameof(SpawnObstacle), 3f, spawnInterval);
    }

    void SpawnObstacle()
    {
        if (spawnedObstacles.Count >= maxObstacleCount)
        {
            return; // 최대 수 초과 시 생성 중단
        }
        Vector3 pos = new Vector3(
            Random.Range(areaMin.x, areaMax.x),
            0f,
            Random.Range(areaMin.z, areaMax.z)
        );
        GameObject obstacle = Instantiate(obstaclePrefab, pos, Quaternion.identity);
        spawnedObstacles.Add(obstacle);
    }

    private void OnDrawGizmos()
    {
        Gizmos.DrawWireCube(areaMin, areaMax - areaMin);
    }
}

