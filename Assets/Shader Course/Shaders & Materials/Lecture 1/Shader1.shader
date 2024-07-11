Shader "Unlit/Shader1"
{
    Properties
    {
        _MainTex("Texture" , 2D) = "white" {}
        _Value ("Value", Float) = 1.0
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            // make fog work
            #pragma multi_compile_fog

            #include "UnityCG.cginc"

            //automatically filled by unity
            struct MeshData //per-vertex mesh data
            {
                float4 vertex : POSITION; //vertex position
                float3 normals : NORMAL;
                float4 uv0 : TEXCOORD0; // uv diffuse/normal coordinate texture
                float4 uv1 : TEXCOORD1; // uv lightmap coordinate texture
            };

            struct Interpolators
            {
                float4 vertex : SV_POSITION;  // clip space position
                float2 uv0 : TEXCOORD;
            };

            sampler2D _MainTex;
            float4 _MainTex_ST;

            Interpolators vert (MeshData v)
            {
                Interpolators o;
                o.vertex = UnityObjectToClipPos(v.vertex); //local space to clip space
                o.uv0 = TRANSFORM_TEX(v.uv0, _MainTex);
                // UNITY_TRANSFER_FOG(o,o.vertex);
                return o;
            }

            // bool 0 to 1
            // int
            // float (32 bit float)
            // half (16 bit float)
            // fixed (lower precision) -1 to 1
            // float4 -> half4 -> fixed4
            // float4x4 -> half4x4 (C#: Matrix4x4)

            float4 frag (Interpolators i) : SV_Target
            {
                float4 myValue;

                float2 otherValue = myValue.gr;
                
                return float4(1, 0, 0, 1);
            }
            ENDCG
        }
    }
}
