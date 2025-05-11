using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DeliveryPoint : MonoBehaviour
{
    public int currentBeans = 0;
    public int beansToEat = 50;

    private List<GameObject> beansInSpoon = new List<GameObject>();

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Bean"))
        {
            Bean bean = other.GetComponent<Bean>();
            if (bean != null && !bean.hasDelivered)
            {
                bean.hasDelivered = true;

                currentBeans++;
                LevelManager.Instance.AddScore(1);
                beansInSpoon.Add(other.gameObject);

                Debug.Log($"🍚 콩 추가됨 ({currentBeans}/{beansToEat})");

                if (currentBeans >= beansToEat)
                {
                    StartCoroutine(EatBeansRoutine());
                }
            }
        }
    }


    private IEnumerator EatBeansRoutine()
    {
        Debug.Log("🥄거인이 한 스푼 먹습니다!");

        yield return new WaitForSeconds(0.5f); // 연출 타이밍용

        foreach (var bean in beansInSpoon)
        {
            // 이펙트나 축소 애니메이션 줄 수 있음
            BeanPoolManager.Instance.ReturnBean(bean);
        }

        beansInSpoon.Clear();
        currentBeans = 0;

       // LevelManager.Instance.LevelUp();
    }
}
