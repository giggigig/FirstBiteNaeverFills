using UnityEngine;

public class LevelManager : MonoBehaviour
{
    public static LevelManager Instance;
    [SerializeField] private int currentLevel = 1;
    [SerializeField] private int currentScore = 0;
    [SerializeField] private int[] levelThresholds = { 10, 30, 60, 100 }; // 점수 구간
    [SerializeField] private int maxFairyBonusPerLevel = 2;

    void Awake() => Instance = this;

    public void AddScore(int amount = 1)
    {
        currentScore += amount;
        UpdateScoreUI();
        CheckLevelUp();
    }
    private void CheckLevelUp()
    {
        if (currentLevel < levelThresholds.Length && currentScore >= levelThresholds[currentLevel - 1])
        {
            currentLevel++;
            Debug.Log($"레벨업! 현재 레벨: {currentLevel}");
            OnLevelUp();
        }
    }
    private void UpdateScoreUI()
    {
        // UI 업데이트 로직
        Debug.Log($"현재 점수: {currentScore}");
    }
    private void OnLevelUp()
    {
        GameManager.Instance.IncreaseFairyMaxCount(maxFairyBonusPerLevel);
        UpgradeEnvironment(currentLevel);
        UpgradeFairyAppearance(currentLevel);
       //layLevelUpEffect();
        //UpdateLevelUI();
    }

    [SerializeField] private Material[] skyboxMaterials; // 레벨별 스카이박스
    [SerializeField] private Light directionalLight; // 메인 조명

    private void UpgradeEnvironment(int level)
    {
        if (level - 1 < skyboxMaterials.Length)
        {
            RenderSettings.skybox = skyboxMaterials[level - 1];
        }
        directionalLight.intensity += 0.2f; // 점점 밝아짐 느낌
    }

    [SerializeField] private Material[] fairyMaterials; // 요정 스킨 모음

    private void UpgradeFairyAppearance(int level)
    {
        foreach (var fairy in GameManager.Instance.fairies)
        {
            if (level - 1 < fairyMaterials.Length)
            {
                fairy.GetComponentInChildren<Renderer>().material = fairyMaterials[level - 1];
            }
        }
    }
}


