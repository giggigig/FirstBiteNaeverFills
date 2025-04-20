using UnityEngine;

public class LevelManager : MonoBehaviour
{
    public static LevelManager Instance;
    public int level = 1;
    public int exp = 0;
    public int expToNext = 10;

    void Awake() => Instance = this;

    public void AddExperience(int amount)
    {
        exp += amount;
        if (exp >= expToNext)
        {
            exp -= expToNext;
            level++;
            expToNext += 5;
            BuffSystem.Instance.ApplyLevelBuff(level);
        }
    }
}
