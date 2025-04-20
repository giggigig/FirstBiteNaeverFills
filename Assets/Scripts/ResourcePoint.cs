using UnityEngine;

public class ResourcePoint : MonoBehaviour
{
    public GameObject beanPrefab;

    public GameObject SpawnBean()
    {
        return Instantiate(beanPrefab, transform.position, Quaternion.identity);
    }
}