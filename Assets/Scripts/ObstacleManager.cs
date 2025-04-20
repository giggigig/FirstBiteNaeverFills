using UnityEngine;

public class ObstacleManager : MonoBehaviour
{
    public GameObject obstaclePrefab;
    public float spawnInterval = 10f;
    public Vector3 areaMin, areaMax;

    void Start()
    {
        InvokeRepeating(nameof(SpawnObstacle), 3f, spawnInterval);
    }

    void SpawnObstacle()
    {
        Vector3 pos = new Vector3(
            Random.Range(areaMin.x, areaMax.x),
            0f,
            Random.Range(areaMin.z, areaMax.z)
        );

        Instantiate(obstaclePrefab, pos, Quaternion.identity);
    }
}
