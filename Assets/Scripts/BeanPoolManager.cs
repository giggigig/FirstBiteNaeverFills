using System.Collections.Generic;
using UnityEngine;

public class BeanPoolManager : MonoBehaviour
{
    public static BeanPoolManager Instance;

    public GameObject beanPrefab;
    public int initialSize = 30;

    private Queue<GameObject> pool = new Queue<GameObject>();

    private void Awake()
    {
        Instance = this;

        for (int i = 0; i < initialSize; i++)
        {
            var obj = Instantiate(beanPrefab);
            obj.SetActive(false);
            pool.Enqueue(obj);
        }
    }

    public GameObject GetBean(Vector3 position)
    {
        GameObject bean = pool.Count > 0 ? pool.Dequeue() : Instantiate(beanPrefab);
        bean.transform.position = position;
        bean.SetActive(true);
        return bean;
    }

    public void ReturnBean(GameObject bean)
    {
        var b = bean.GetComponent<Bean>();
        if (b != null) b.hasDelivered = false;

        bean.SetActive(false);
        pool.Enqueue(bean);
    }
}
