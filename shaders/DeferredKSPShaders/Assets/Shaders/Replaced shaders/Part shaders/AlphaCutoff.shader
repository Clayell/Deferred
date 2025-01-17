﻿Shader "KSP/Alpha/Cutoff"
{    
    Properties 
    {
        _MainTex("Color Map", 2D) = "gray" {}
        _Color ("Part Color", Color) = (1.0, 1.0, 1.0, 1.0)
        _Cutoff("Alpha cutoff", Range(0,1)) = 0.5
        [PerRendererData]_RimFalloff("Rim Falloff", Range(0.0, 10.0) ) = 0.1
        [PerRendererData]_RimColor("Rim Color", Color) = (0.0, 0.0, 0.0, 0.0)
        [PerRendererData]_TemperatureColor("Temperature Color", Color) = (0.0, 0.0, 0.0, 0.0)
        [PerRendererData]_BurnColor ("Burn Color", Color) = (1.0, 1.0, 1.0, 1.0)
        [PerRendererData]_Opacity("_Opacity", Range(0.0,1.0)) = 1.0
    }

    SubShader 
    {
        Tags { "Queue" = "AlphaTest" "RenderType" = "TransparentCutout" }

        Stencil
        {
            Ref 1
            Comp Always
            Pass Replace
        }

        CGPROGRAM

        #define IGNORE_VERTEX_COLOR_ON
        #define CUTOUT_ON

        #include "../ReplacementShader.cginc" //exclude_path:forward
		#pragma surface DeferredSpecularReplacementShader StandardSpecular 
        #pragma target 3.0

        ENDCG
    }
    Fallback "Standard"
}