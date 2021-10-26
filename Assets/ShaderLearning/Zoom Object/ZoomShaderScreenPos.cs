using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ZoomShaderScreenPos : MonoBehaviour
{
    public Material mat_ZoomShader;

    void Update()
    {
        Vector2 screenPixels = Camera.main.WorldToScreenPoint(transform.position);
        screenPixels = new Vector2(screenPixels.x / Screen.width, screenPixels.y / Screen.height);

        mat_ZoomShader.SetVector("_ObjectScreenPos", screenPixels);
    }
}
