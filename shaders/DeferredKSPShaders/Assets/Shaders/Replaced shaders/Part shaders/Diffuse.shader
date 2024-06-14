Shader "KSP/Diffuse"
{
    Properties 
    {
        _MainTex("Color Map", 2D) = "gray" {}
        _Shininess ("Shininess", Range (0.0, 1.0)) = 0.5
        _Color ("Part Color", Color) = (1.0, 1.0, 1.0, 1.0)
        _SpecColor ("Specular Color", Color) = (0.5, 0.5, 0.5, 1.0)
        _EmissiveColor("Emissive Color", Color) = (0.0, 0.0, 0.0, 1.0)
        [PerRendererData]_RimFalloff("Rim Falloff", Range(0.0, 10.0) ) = 0.1
        [PerRendererData]_RimColor("Rim Color", Color) = (0.0, 0.0, 0.0, 0.0)
        [PerRendererData]_TemperatureColor("Temperature Color", Color) = (0.0, 0.0, 0.0, 0.0)
        [PerRendererData]_BurnColor ("Burn Color", Color) = (1.0, 1.0, 1.0, 1.0)
    }
    SubShader 
    {
        Tags { "RenderType"="Opaque" }

        Stencil
        {
            Ref 8
            Comp Always
            Pass Replace
        }

        CGPROGRAM
        #include "../ReplacementShader.cginc"
		#pragma surface DeferredSpecularReplacementShader StandardSpecular
        #pragma target 3.0

        ENDCG
    }
    Fallback "Standard"
}