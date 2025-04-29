using UnityEngine;

[CreateAssetMenu(fileName = "NewFairyData", menuName = "Scriptable Objects/FairyData")]
public class FairyData : ScriptableObject
{
    public string fairyName;
    public FairyType fairyType;
    public float baseMoveSpeed;
    public Material fairyMat;
    public ParticleSystem specialEffectPrefab; // (선택) 레어 요정 전용 이펙트
    public bool isRare;
}
