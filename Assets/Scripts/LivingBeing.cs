using UnityEngine;

public class LivingBeing : MonoBehaviour
{
    [Header("Living Being Settings")]
    [SerializeField] protected float moveSpeed = 1f;

    protected Vector3 moveDirection;

    public virtual void Move(Vector3 direction)
    {
        moveDirection = direction;
        transform.position += moveDirection * moveSpeed * Time.deltaTime;
    }
}
