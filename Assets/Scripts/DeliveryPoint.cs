using UnityEngine;

public class DeliveryPoint : MonoBehaviour
{
    public Transform dropOffset;

    public void ReceiveBean(GameObject bean)
    {
        bean.transform.SetParent(null);
        bean.transform.position = dropOffset.position; // �ð������� �������� ��ġ
        Destroy(bean, 0.5f); // �� ������� ���� (����)
        Debug.Log("�� ��� �Ϸ�!");
    }
}
