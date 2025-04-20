using UnityEngine;

public class DeliveryPoint : MonoBehaviour
{
    public Transform dropOffset;

    public void ReceiveBean(GameObject bean)
    {
        bean.transform.SetParent(null);
        bean.transform.position = dropOffset.position; // 시각적으로 내려놓는 위치
        Destroy(bean, 0.5f); // 콩 사라지는 연출 (선택)
        Debug.Log("콩 배달 완료!");
    }
}
