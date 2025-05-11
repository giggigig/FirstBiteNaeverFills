using UnityEngine;
using UnityEngine.InputSystem;

public class FairyGrabbable : MonoBehaviour
{
    private BaseFairy fairy;
    private Camera cam;
    private bool isGrabbed = false;
    private Vector3 grabOffset;

    private void Awake()
    {
        fairy = GetComponent<BaseFairy>();
        cam = Camera.main;
    }
    private void Update()
    {
        if (!PathDrawer.Instance.IsPathDrawingMode() && Mouse.current.leftButton.wasPressedThisFrame)
        {
            Ray ray = Camera.main.ScreenPointToRay(Mouse.current.position.ReadValue());

            if (Physics.Raycast(ray, out RaycastHit hit, 100f))
            {
                if (hit.collider.gameObject == this.gameObject)
                {
                    //Debug.Log("[FairyGrabbable] Input System 방식으로 Grab 감지됨!");

                    grabOffset = transform.position - hit.point;
                    isGrabbed = true;
                    fairy.SetGrabbed(true);
                }
            }
        }

        if (isGrabbed)
        {
            Ray ray = Camera.main.ScreenPointToRay(Mouse.current.position.ReadValue());
            if (Physics.Raycast(ray, out RaycastHit hit, 100f, LayerMask.GetMask("Drawable")))
            {
                Vector3 targetPos = hit.point + grabOffset;
                targetPos.y = 1f;

                //Debug.Log($"[GRAB] from: {transform.position}, to: {targetPos}");

                if (TryGetComponent(out Rigidbody rb))
                    rb.MovePosition(Vector3.Lerp(transform.position, targetPos, Time.deltaTime * 10f));
                else
                    transform.position = Vector3.Lerp(transform.position, targetPos, Time.deltaTime * 10f);

                //  카메라 방향을 향하게 회전
                Vector3 toCamera = cam.transform.position - transform.position;
                toCamera.y = 0f;
                if (toCamera != Vector3.zero)
                {
                    Quaternion targetRotation = Quaternion.LookRotation(toCamera);
                    transform.rotation = Quaternion.Slerp(transform.rotation, targetRotation, Time.deltaTime * 10f);
                }
            }

            if (Mouse.current.leftButton.wasReleasedThisFrame)
            {
                isGrabbed = false;
                fairy.SetGrabbed(false);
                fairy.ResumeAfterGrab();
                Vector3 dropPos = new Vector3(transform.position.x, 0f, transform.position.z);
                transform.position = dropPos;
                //Debug.Log("[FairyGrabbable] 요정 놓음");
            }
        }
    }
}
