using UnityEngine;

public class BuffSystem : MonoBehaviour
{
    public static BuffSystem Instance;
    void Awake() => Instance = this;

    public void ApplyLevelBuff(int level)
    {
        // 예시: 요정 추가, 속도 상승, 더 큰 콩 운반 가능 등
        Debug.Log("Level up! Buff applied: " + level);
    }
}
