using UnityEngine;

public class BuffSystem : MonoBehaviour
{
    public static BuffSystem Instance;
    void Awake() => Instance = this;

    public void ApplyLevelBuff(int level)
    {
        // ����: ���� �߰�, �ӵ� ���, �� ū �� ��� ���� ��
        Debug.Log("Level up! Buff applied: " + level);
    }
}
