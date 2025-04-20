using UnityEngine;

public class DeliveryPointManager : MonoBehaviour
{
    public static DeliveryPointManager Instance;
    public DeliveryPoint deliveryPoint;

    void Awake() => Instance = this;
}
