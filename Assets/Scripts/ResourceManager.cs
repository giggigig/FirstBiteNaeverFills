using System.Collections.Generic;
using UnityEngine;

public class ResourceManager : MonoBehaviour
{
    public static ResourceManager Instance;

    public List<ResourcePoint> resourcePoints = new();

    void Awake()
    {
        if (Instance == null) Instance = this;
        else Destroy(gameObject);
    }
    void Start()
    {
        ResourcePoint[] pointsInScene = FindObjectsByType<ResourcePoint>(FindObjectsSortMode.None);
        resourcePoints = new List<ResourcePoint>(pointsInScene);
    }

    public ResourcePoint GetClosestResource(Vector3 position)
    {
        float shortest = float.MaxValue;
        ResourcePoint closest = null;

        foreach (var rp in resourcePoints)
        {
            float dist = Vector3.Distance(position, rp.transform.position);
            if (dist < shortest)
            {
                shortest = dist;
                closest = rp;
            }
        }

        return closest;
    }

    public GameObject RequestBeanFromClosest(Vector3 fromPosition)
    {
        var point = GetClosestResource(fromPosition);
        return point != null ? point.SpawnBean() : null;
    }
}