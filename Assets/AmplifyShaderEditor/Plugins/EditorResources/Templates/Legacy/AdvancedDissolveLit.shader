Shader /*ase_name*/ "Templates/DissolveLit" /*end*/
{
	Properties 
  {
		_MainTex("MainTex", 2D) = "white" {}
		/*ase_props*/
		//_TransmissionShadow( "Transmission Shadow", Range( 0, 1 ) ) = 0.5
		//_TransStrength( "Trans Strength", Range( 0, 50 ) ) = 1
		//_TransNormal( "Trans Normal Distortion", Range( 0, 1 ) ) = 0.5
		//_TransScattering( "Trans Scattering", Range( 1, 50 ) ) = 2
		//_TransDirect( "Trans Direct", Range( 0, 1 ) ) = 0.9
		//_TransAmbient( "Trans Ambient", Range( 0, 1 ) ) = 0.1
		//_TransShadow( "Trans Shadow", Range( 0, 1 ) ) = 0.5
		//_TessPhongStrength( "Tess Phong Strength", Range( 0, 1 ) ) = 0.5
		//_TessValue( "Tess Max Tessellation", Range( 1, 32 ) ) = 16
		//_TessMin( "Tess Min Distance", Float ) = 10
		//_TessMax( "Tess Max Distance", Float ) = 25
		//_TessEdgeLength ( "Tess Edge length", Range( 2, 50 ) ) = 16
		//_TessMaxDisp( "Tess Max Displacement", Float ) = 25
		//_SpecularHighlights("Specular Highlights", Float) = 1.0
		//_GlossyReflections("Reflections", Float) = 1.0

		//Advanced Dissolve
		[HideInInspector] _DissolveCutoff("Dissolve", Range(0,1)) = 0.25

		//Mask
		[HideInInspector][KeywordEnum(None, XYZ Axis)]  _AdditionalDissolveMask("Mask", Float) = 0
		[HideInInspector]								_AdditionalDissolveMaskInvert("Invert", Float) = 1
		//[HideInInspector][KeywordEnum(None, Box, Cone)]  _DissolveMask("Mask", Float) = 0
		[HideInInspector][KeywordEnum(None, Plane, Plane, Box, Box, Cone, Cone)]  _DissolveMask("Mask", Float) = 0
		[HideInInspector][Enum(X,0,Y,1,Z,2)]                                                _DissolveMaskAxis("Axis", Float) = 0
		[HideInInspector][Enum(World,0,Local,1)]                                            _DissolveMaskSpace("Space", Float) = 0
		[HideInInspector]																   _DissolveMaskOffset("Offset", Float) = 0
		[HideInInspector]																   _DissolveMaskInvert("Invert", Float) = 1
		[HideInInspector][KeywordEnum(One, Two, Three, Four)]							   _DissolveMaskCount("Count", Float) = 0

		[HideInInspector]  _DissolveMaskPosition("", Vector) = (0,0,0,0)
		[HideInInspector]  _DissolveMaskNormal("", Vector) = (1,0,0,0)
		[HideInInspector]  _DissolveMaskRadius("", Float) = 1

		//Alpha Source
		[HideInInspector][KeywordEnum(Main Map Alpha, Custom Map, Two Custom Maps, Three Custom Maps)] _DissolveAlphaSource("Alpha Source", Float) = 0
		[HideInInspector] _DissolveMap1("", 2D) = "white" { }
		[HideInInspector][UVScroll] _DissolveMap1_Scroll("", Vector) = (0,0,0,0)
		[HideInInspector] _DissolveMap1Intensity("", Range(0, 1)) = 1
		[HideInInspector][Enum(Red, 0, Green, 1, Blue, 2, Alpha, 3)] _DissolveMap1Channel("", INT) = 3
		[HideInInspector] _DissolveMap2("", 2D) = "white" { }
		[HideInInspector][UVScroll] _DissolveMap2_Scroll("", Vector) = (0,0,0,0)
		[HideInInspector] _DissolveMap2Intensity("", Range(0, 1)) = 1
		[HideInInspector][Enum(Red, 0, Green, 1, Blue, 2, Alpha, 3)] _DissolveMap2Channel("", INT) = 3
		[HideInInspector] _DissolveMap3("", 2D) = "white" { }
		[HideInInspector][UVScroll] _DissolveMap3_Scroll("", Vector) = (0,0,0,0)
		[HideInInspector] _DissolveMap3Intensity("", Range(0, 1)) = 1
		[HideInInspector][Enum(Red, 0, Green, 1, Blue, 2, Alpha, 3)] _DissolveMap3Channel("", INT) = 3

		[HideInInspector][Enum(Multiply, 0, Add, 1)]  _DissolveSourceAlphaTexturesBlend("Texture Blend", Float) = 0
		[HideInInspector]							  _DissolveNoiseStrength("Noise", Float) = 0.1
		[HideInInspector][Enum(UV0,0,UV1,1)]          _DissolveAlphaSourceTexturesUVSet("UV Set", Float) = 0

		[HideInInspector][KeywordEnum(Normal, Triplanar, Screen Space)] _DissolveMappingType("Triplanar", Float) = 0
		[HideInInspector][Enum(World,0,Local,1)]                        _DissolveTriplanarMappingSpace("Mapping", Float) = 0
		[HideInInspector]                                               _DissolveMainMapTiling("", FLOAT) = 1

		//Edge
		[HideInInspector]                                       _DissolveEdgeWidth("Edge Size", Range(0,1)) = 0.25
		[HideInInspector][Enum(Cutout Source,0,Main Map,1)]     _DissolveEdgeDistortionSource("Distortion Source", Float) = 0
		[HideInInspector]                                       _DissolveEdgeDistortionStrength("Distortion Strength", Range(0, 2)) = 0

		//Color
		[HideInInspector]                _DissolveEdgeColor("Edge Color", Color) = (0,1,0,1)
		[HideInInspector][PositiveFloat] _DissolveEdgeColorIntensity("Intensity", FLOAT) = 0
		[HideInInspector][Enum(Solid,0,Smooth,1, Smooth Squared,2)]      _DissolveEdgeShape("Shape", INT) = 0

		[HideInInspector][KeywordEnum(None, Gradient, Main Map, Custom)] _DissolveEdgeTextureSource("", Float) = 0
		[HideInInspector][NoScaleOffset]								 _DissolveEdgeTexture("Edge Texture", 2D) = "white" { }
		[HideInInspector][Toggle]										 _DissolveEdgeTextureReverse("Reverse", FLOAT) = 0
		[HideInInspector]												 _DissolveEdgeTexturePhaseOffset("Offset", FLOAT) = 0
		[HideInInspector]												 _DissolveEdgeTextureAlphaOffset("Offset", Range(-1, 1)) = 0
		[HideInInspector]												 _DissolveEdgeTextureMipmap("", Range(0, 10)) = 1
		[HideInInspector][Toggle]										 _DissolveEdgeTextureIsDynamic("", Float) = 0

		[HideInInspector][PositiveFloat] _DissolveGIMultiplier("GI Strength", Float) = 1

		//Global
		[HideInInspector][KeywordEnum(None, Mask Only, Mask And Edge, All)] _DissolveGlobalControl("Global Controll", Float) = 0

		//Meta
		[HideInInspector] _Dissolve_ObjectWorldPos("", Vector) = (0,0,0,0)
	}
	
	SubShader
	{
		/*ase_subshader_options:Name=Additional Options
			Option:Workflow,InvertActionOnDeselection:Specular,Metallic:Metallic
				Metallic:ShowPort:Metallic
				Specular:ShowPort:Specular
				Specular:SetDefine:_SPECULAR_SETUP 1
			Option:Surface:Opaque,Transparent:Opaque
				Opaque:SetPropertyOnSubShader:RenderType,Opaque
				Opaque:SetPropertyOnSubShader:RenderQueue,Geometry
				Opaque:SetPropertyOnSubShader:ZWrite,On
				Opaque:HideOption:  Blend
				Opaque:HideOption:  Dither Shadows
				Opaque:HideOption:  Refraction Model
				Transparent:SetPropertyOnSubShader:RenderType,Transparent
				Transparent:SetPropertyOnSubShader:RenderQueue,Transparent
				Transparent:SetPropertyOnSubShader:ZWrite,Off
				Transparent:ShowOption:  Blend
				Transparent:ShowOption:  Dither Shadows
				Transparent:ShowOption:  Refraction Model
			Option:  Blend:Alpha,Premultiply,Additive,Multiply,Translucent,Custom:Alpha
				Alpha:SetPropertyOnPass:ForwardBase:BlendRGB,SrcAlpha,OneMinusSrcAlpha
				Alpha:SetPropertyOnPass:ForwardAdd:BlendRGB,SrcAlpha,One
				Alpha:SetDefine:_ALPHABLEND_ON 1
				Premultiply:SetPropertyOnPass:ForwardBase:BlendRGB,One,OneMinusSrcAlpha
				disable,Premultiply,Additive,Multiply,Translucent,Custom:SetPropertyOnPass:ForwardAdd:BlendRGB,One,One
				Premultiply:SetDefine:_ALPHAPREMULTIPLY_ON 1
				Additive:SetPropertyOnPass:ForwardBase:BlendRGB,One,One
				Multiply:SetPropertyOnPass:ForwardBase:BlendRGB,DstColor,Zero
				disable,Premultiply,Additive,Multiply,Translucent,Custom:RemoveDefine:_ALPHABLEND_ON 1
				disable,Alpha,Additive,Multiply,Translucent,Custom:RemoveDefine:_ALPHAPREMULTIPLY_ON 1
				disable,Translucent:SetPropertyOnPass:ForwardBase:BlendRGB,One,Zero
			Option:  Refraction Model:None:None
				None,disable:HidePort:ForwardBase:Refraction Index
				None,disable:HidePort:ForwardBase:Refraction Color
				None,disable:RemoveDefine:_REFRACTION_ASE 1
				None,disable:RemoveDefine:ASE_NEEDS_FRAG_SCREEN_POSITION
				Legacy:ShowPort:ForwardBase:Refraction Index
				Legacy:ShowPort:ForwardBase:Refraction Color
				Legacy:SetDefine:_REFRACTION_ASE 1
				Legacy:SetDefine:ASE_NEEDS_FRAG_SCREEN_POSITION
			Option:  Dither Shadows:false,true:true
				true:SetDefine:UNITY_STANDARD_USE_DITHER_MASK 1
				false,disable:RemoveDefine:UNITY_STANDARD_USE_DITHER_MASK 1
			Option:Two Sided:On,Cull Back,Cull Front:Cull Back
				On:SetPropertyOnSubShader:CullMode,Off
				Cull Back:SetPropertyOnSubShader:CullMode,Back
				Cull Front:SetPropertyOnSubShader:CullMode,Front
			Option:Deferred Pass:false,true:true
				true:IncludePass:Deferred
				false:ExcludePass:Deferred
			Option:Transmission:false,true:false
				false:RemoveDefine:_TRANSMISSION_ASE 1
				false:HidePort:ForwardBase:Transmission
				false:HideOption:  Transmission Shadow
				true:SetDefine:_TRANSMISSION_ASE 1
				true:ShowPort:ForwardBase:Transmission
				true:ShowOption:  Transmission Shadow
				true:SetOption:Deferred Pass,0
			Field:  Transmission Shadow:Float:0.5:0:1:_TransmissionShadow
				Change:SetMaterialProperty:_TransmissionShadow
				Change:SetShaderProperty:_TransmissionShadow,_TransmissionShadow( "Transmission Shadow", Range( 0, 1 ) ) = 0.5
				Inline,disable:SetShaderProperty:_TransmissionShadow,//_TransmissionShadow( "Transmission Shadow", Range( 0, 1 ) ) = 0.5
			Option:Translucency:false,true:false
				false:RemoveDefine:_TRANSLUCENCY_ASE 1
				false:HidePort:ForwardBase:Translucency
				false:HideOption:  Translucency Strength
				false:HideOption:  Normal Distortion
				false:HideOption:  Scattering
				false:HideOption:  Direct
				false:HideOption:  Ambient
				false:HideOption:  Shadow
				true:SetDefine:_TRANSLUCENCY_ASE 1
				true:ShowPort:ForwardBase:Translucency
				true:ShowOption:  Translucency Strength
				true:ShowOption:  Normal Distortion
				true:ShowOption:  Scattering
				true:ShowOption:  Direct
				true:ShowOption:  Ambient
				true:ShowOption:  Shadow
				true:SetOption:Deferred Pass,0
			Field:  Translucency Strength:Float:1:0:50:_TransStrength
				Change:SetMaterialProperty:_TransStrength
				Change:SetShaderProperty:_TransStrength,_TransStrength( "Strength", Range( 0, 50 ) ) = 1
				Inline,disable:SetShaderProperty:_TransStrength,//_TransStrength( "Strength", Range( 0, 50 ) ) = 1
			Field:  Normal Distortion:Float:0.5:0:1:_TransNormal
				Change:SetMaterialProperty:_TransNormal
				Change:SetShaderProperty:_TransNormal,_TransNormal( "Normal Distortion", Range( 0, 1 ) ) = 0.5
				Inline,disable:SetShaderProperty:_TransNormal,//_TransNormal( "Normal Distortion", Range( 0, 1 ) ) = 0.5
			Field:  Scattering:Float:2:1:50:_TransScattering
				Change:SetMaterialProperty:_TransScattering
				Change:SetShaderProperty:_TransScattering,_TransScattering( "Scattering", Range( 1, 50 ) ) = 2
				Inline,disable:SetShaderProperty:_TransScattering,//_TransScattering( "Scattering", Range( 1, 50 ) ) = 2
			Field:  Direct:Float:0.9:0:1:_TransDirect
				Change:SetMaterialProperty:_TransDirect
				Change:SetShaderProperty:_TransDirect,_TransDirect( "Direct", Range( 0, 1 ) ) = 0.9
				Inline,disable:SetShaderProperty:_TransDirect,//_TransDirect( "Direct", Range( 0, 1 ) ) = 0.9
			Field:  Ambient:Float:0.1:0:1:_TransAmbient
				Change:SetMaterialProperty:_TransAmbient
				Change:SetShaderProperty:_TransAmbient,_TransAmbient( "Ambient", Range( 0, 1 ) ) = 0.1
				Inline,disable:SetShaderProperty:_TransAmbient,//_TransAmbient( "Ambient", Range( 0, 1 ) ) = 0.1
			Field:  Shadow:Float:0.5:0:1:_TransShadow
				Change:SetMaterialProperty:_TransShadow
				Change:SetShaderProperty:_TransShadow,_TransShadow( "Shadow", Range( 0, 1 ) ) = 0.5
				Inline,disable:SetShaderProperty:_TransShadow,//_TransShadow( "Shadow", Range( 0, 1 ) ) = 0.5
			Option:Cast Shadows:false,true:true
				true:IncludePass:ShadowCaster
				false,disable:ExcludePass:ShadowCaster
				true:ShowOption:  Use Shadow Threshold
				false:HideOption:  Use Shadow Threshold
			Option:  Use Shadow Threshold:false,true:false
				true:ShowPort:ForwardBase:Alpha Clip Threshold Shadow
				false,disable:HidePort:ForwardBase:Alpha Clip Threshold Shadow
			Option:Receive Shadows:false,true:true
				true:SetDefine:ASE_NEEDS_FRAG_SHADOWCOORDS
				false:RemoveDefine:ASE_NEEDS_FRAG_SHADOWCOORDS
			Option:GPU Instancing:false,true:true
				true:SetDefine:pragma multi_compile_instancing
				false:RemoveDefine:pragma multi_compile_instancing
			Option:LOD CrossFade:false,true:true
				true:SetDefine:pragma multi_compile __ LOD_FADE_CROSSFADE
				false:RemoveDefine:pragma multi_compile __ LOD_FADE_CROSSFADE
			Option:Built-in Fog:false,true:true
				true:SetDefine:pragma multi_compile_fog
				false:RemoveDefine:pragma multi_compile_fog
				true:SetDefine:ASE_FOG 1
				false:RemoveDefine:ASE_FOG 1
			Option:Ambient Light:false,true:true
				true:RemoveDefine:ASE_NO_AMBIENT 1
				false:SetDefine:ASE_NO_AMBIENT 1
			Option:Meta Pass:false,true:true
				true:IncludePass:Meta
				false,disable:ExcludePass:Meta
			Option:Add Pass:false,true:true
				true:IncludePass:ForwardAdd
				false,disable:ExcludePass:ForwardAdd
			Option:Override Baked GI:false,true:false
				true:ShowPort:ForwardBase:Baked GI
				false:HidePort:ForwardBase:Baked GI
				true:SetDefine:ASE_BAKEDGI 1
				false:RemoveDefine:ASE_BAKEDGI 1
			Option:Extra Pre Pass:false,true:false
				true:IncludePass:ExtraPrePass
				false,disable:ExcludePass:ExtraPrePass
			Option:Tessellation:false,true:false
				true:SetDefine:TESSELLATION_ON 1
				true:SetDefine:pragma require tessellation tessHW
				true:SetDefine:pragma hull HullFunction
				true:SetDefine:pragma domain DomainFunction
				true:ShowOption:  Phong
				true:ShowOption:  Type
				false,disable:RemoveDefine:TESSELLATION_ON 1
				false,disable:RemoveDefine:pragma require tessellation tessHW
				false,disable:RemoveDefine:pragma hull HullFunction
				false,disable:RemoveDefine:pragma domain DomainFunction
				false,disable:HideOption:  Phong
				false,disable:HideOption:  Type
			Option:  Phong:false,true:false
				true:SetDefine:ASE_PHONG_TESSELLATION
				false,disable:RemoveDefine:ASE_PHONG_TESSELLATION
				true:ShowOption:  Strength
				false,disable:HideOption:  Strength
			Field:  Strength:Float:0.5:0:1:_TessPhongStrength
				Change:SetMaterialProperty:_TessPhongStrength
				Change:SetShaderProperty:_TessPhongStrength,_TessPhongStrength( "Phong Tess Strength", Range( 0, 1 ) ) = 0.5
				Inline,disable:SetShaderProperty:_TessPhongStrength,//_TessPhongStrength( "Phong Tess Strength", Range( 0, 1 ) ) = 0.5
			Option:  Type:Fixed,Distance Based,Edge Length,Edge Length Cull:Fixed
				Fixed:SetDefine:ASE_FIXED_TESSELLATION
				Fixed,Distance Based:ShowOption:  Tess
				Distance Based:SetDefine:ASE_DISTANCE_TESSELLATION
				Distance Based:ShowOption:  Min
				Distance Based:ShowOption:  Max
				Edge Length:SetDefine:ASE_LENGTH_TESSELLATION
				Edge Length,Edge Length Cull:ShowOption:  Edge Length
				Edge Length Cull:SetDefine:ASE_LENGTH_CULL_TESSELLATION
				Edge Length Cull:ShowOption:  Max Displacement
				disable,Distance Based,Edge Length,Edge Length Cull:RemoveDefine:ASE_FIXED_TESSELLATION
				disable,Fixed,Edge Length,Edge Length Cull:RemoveDefine:ASE_DISTANCE_TESSELLATION
				disable,Fixed,Distance Based,Edge Length Cull:RemoveDefine:ASE_LENGTH_TESSELLATION
				disable,Fixed,Distance Based,Edge Length:RemoveDefine:ASE_LENGTH_CULL_TESSELLATION
				disable,Edge Length,Edge Length Cull:HideOption:  Tess
				disable,Fixed,Edge Length,Edge Length Cull:HideOption:  Min
				disable,Fixed,Edge Length,Edge Length Cull:HideOption:  Max
				disable,Fixed,Distance Based:HideOption:  Edge Length
				disable,Fixed,Distance Based,Edge Length:HideOption:  Max Displacement
			Field:  Tess:Float:16:1:32:_TessValue
				Change:SetMaterialProperty:_TessValue
				Change:SetShaderProperty:_TessValue,_TessValue( "Max Tessellation", Range( 1, 32 ) ) = 16
				Inline,disable:SetShaderProperty:_TessValue,//_TessValue( "Max Tessellation", Range( 1, 32 ) ) = 16
			Field:  Min:Float:10:_TessMin
				Change:SetMaterialProperty:_TessMin
				Change:SetShaderProperty:_TessMin,_TessMin( "Tess Min Distance", Float ) = 10
				Inline,disable:SetShaderProperty:_TessMin,//_TessMin( "Tess Min Distance", Float ) = 10
			Field:  Max:Float:25:_TessMax
				Change:SetMaterialProperty:_TessMax
				Change:SetShaderProperty:_TessMax,_TessMax( "Tess Max Distance", Float ) = 25
				Inline,disable:SetShaderProperty:_TessMax,//_TessMax( "Tess Max Distance", Float ) = 25
			Field:  Edge Length:Float:16:2:50:_TessEdgeLength
				Change:SetMaterialProperty:_TessEdgeLength
				Change:SetShaderProperty:_TessEdgeLength,_TessEdgeLength ( "Edge length", Range( 2, 50 ) ) = 16
				Inline,disable:SetShaderProperty:_TessEdgeLength,//_TessEdgeLength ( "Edge length", Range( 2, 50 ) ) = 16
			Field:  Max Displacement:Float:25:_TessMaxDisp
				Change:SetMaterialProperty:_TessMaxDisp
				Change:SetShaderProperty:_TessMaxDisp,_TessMaxDisp( "Max Displacement", Float ) = 25
				Inline,disable:SetShaderProperty:_TessMaxDisp,//_TessMaxDisp( "Max Displacement", Float ) = 25
			Option:Fwd Specular Highlights Toggle:false,true:false
				true:SetShaderProperty:_SpecularHighlights,[ToggleOff] _SpecularHighlights("Specular Highlights", Float) = 1.0
				false:SetShaderProperty:_SpecularHighlights,//[ToggleOff] _SpecularHighlights("Specular Highlights", Float) = 1.0
				true:SetDefine:pragma shader_feature _SPECULARHIGHLIGHTS_OFF
				false:RemoveDefine:pragma shader_feature _SPECULARHIGHLIGHTS_OFF
			Option:Fwd Reflections Toggle:false,true:false
				true:SetShaderProperty:_GlossyReflections,[ToggleOff] _GlossyReflections("Reflections", Float) = 1.0
				false:SetShaderProperty:_GlossyReflections,//[ToggleOff] _GlossyReflections("Reflections", Float) = 1.0
				true:SetDefine:pragma shader_feature _GLOSSYREFLECTIONS_OFF
				false:RemoveDefine:pragma shader_feature _GLOSSYREFLECTIONS_OFF
			Option:Disable Batching:False,True,LOD Fading:False
				False:SetPropertyOnSubShader:DisableBatching,False
				True:SetPropertyOnSubShader:DisableBatching,True
				LOD Fading:SetPropertyOnSubShader:DisableBatching,LODFading
			Option:Vertex Position,InvertActionOnDeselection:Absolute,Relative:Relative
				Absolute:SetDefine:ASE_ABSOLUTE_VERTEX_POS 1
				Absolute:SetPortName:ForwardBase:15,Vertex Position
				Relative:SetPortName:ForwardBase:15,Vertex Offset
				Absolute:SetPortName:ExtraPrePass:3,Vertex Position
				Relative:SetPortName:ExtraPrePass:3,Vertex Offset
			Port:ForwardBase:Alpha Clip Threshold
				On:SetDefine:_ALPHATEST_ON 1
			Port:ForwardBase:Alpha Clip Threshold Shadow
				On:SetDefine:_ALPHATEST_SHADOW_ON 1
		*/
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "DisableBatching" = "False" }
		LOD 0

		Cull Back
		AlphaToMask Off
		ZWrite On
		ZTest LEqual
		ColorMask RGBA
		/*ase_stencil*/
		/*ase_all_modules*/

		CGINCLUDE
		#pragma target 3.0
		sampler2D _MainTex;
		float4 _MainTex_ST;

		float4 FixedTess( float tessValue )
		{
			return tessValue;
		}
		
		float CalcDistanceTessFactor (float4 vertex, float minDist, float maxDist, float tess, float4x4 o2w, float3 cameraPos )
		{
			float3 wpos = mul(o2w,vertex).xyz;
			float dist = distance (wpos, cameraPos);
			float f = clamp(1.0 - (dist - minDist) / (maxDist - minDist), 0.01, 1.0) * tess;
			return f;
		}

		float4 CalcTriEdgeTessFactors (float3 triVertexFactors)
		{
			float4 tess;
			tess.x = 0.5 * (triVertexFactors.y + triVertexFactors.z);
			tess.y = 0.5 * (triVertexFactors.x + triVertexFactors.z);
			tess.z = 0.5 * (triVertexFactors.x + triVertexFactors.y);
			tess.w = (triVertexFactors.x + triVertexFactors.y + triVertexFactors.z) / 3.0f;
			return tess;
		}

		float CalcEdgeTessFactor (float3 wpos0, float3 wpos1, float edgeLen, float3 cameraPos, float4 scParams )
		{
			float dist = distance (0.5 * (wpos0+wpos1), cameraPos);
			float len = distance(wpos0, wpos1);
			float f = max(len * scParams.y / (edgeLen * dist), 1.0);
			return f;
		}

		float DistanceFromPlane (float3 pos, float4 plane)
		{
			float d = dot (float4(pos,1.0f), plane);
			return d;
		}

		bool WorldViewFrustumCull (float3 wpos0, float3 wpos1, float3 wpos2, float cullEps, float4 planes[6] )
		{
			float4 planeTest;
			planeTest.x = (( DistanceFromPlane(wpos0, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[0]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.y = (( DistanceFromPlane(wpos0, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[1]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.z = (( DistanceFromPlane(wpos0, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[2]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.w = (( DistanceFromPlane(wpos0, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[3]) > -cullEps) ? 1.0f : 0.0f );
			return !all (planeTest);
		}

		float4 DistanceBasedTess( float4 v0, float4 v1, float4 v2, float tess, float minDist, float maxDist, float4x4 o2w, float3 cameraPos )
		{
			float3 f;
			f.x = CalcDistanceTessFactor (v0,minDist,maxDist,tess,o2w,cameraPos);
			f.y = CalcDistanceTessFactor (v1,minDist,maxDist,tess,o2w,cameraPos);
			f.z = CalcDistanceTessFactor (v2,minDist,maxDist,tess,o2w,cameraPos);

			return CalcTriEdgeTessFactors (f);
		}

		float4 EdgeLengthBasedTess( float4 v0, float4 v1, float4 v2, float edgeLength, float4x4 o2w, float3 cameraPos, float4 scParams )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;
			tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
			tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
			tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
			tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			return tess;
		}

		float4 EdgeLengthBasedTessCull( float4 v0, float4 v1, float4 v2, float edgeLength, float maxDisplacement, float4x4 o2w, float3 cameraPos, float4 scParams, float4 planes[6] )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;

			if (WorldViewFrustumCull(pos0, pos1, pos2, maxDisplacement, planes))
			{
				tess = 0.0f;
			}
			else
			{
				tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
				tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
				tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
				tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			}
			return tess;
		}
		ENDCG

		/*ase_pass*/
		Pass
		{
			Name "ExtraPrePass"
			Tags { "LightMode" = "ForwardBase" }
			
			Blend One Zero
			Cull Back
			ZWrite On
			ZTest LEqual
			Offset 0,0
			ColorMask RGBA
			/*ase_stencil*/

			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma multi_compile_fwdbase
			#ifndef UNITY_PASS_FORWARDBASE
				#define UNITY_PASS_FORWARDBASE
			#endif
			#include "HLSLSupport.cginc"
			#ifndef UNITY_INSTANCED_LOD_FADE
				#define UNITY_INSTANCED_LOD_FADE
			#endif
			#ifndef UNITY_INSTANCED_SH
				#define UNITY_INSTANCED_SH
			#endif
			#ifndef UNITY_INSTANCED_LIGHTMAPSTS
				#define UNITY_INSTANCED_LIGHTMAPSTS
			#endif
			#include "UnityShaderVariables.cginc"
			#include "UnityCG.cginc"
			#include "Lighting.cginc"
			#include "UnityPBSLighting.cginc"
			#include "AutoLight.cginc"			
			
			/*ase_pragma*/
			struct appdata {
				float4 vertex : POSITION;
				float4 tangent : TANGENT;
				float3 normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				/*ase_vdata:p=p;t=t;n=n;uv1=tc1.xyzw;uv2=tc2.xyzw*/
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
			
			struct v2f {
				#if UNITY_VERSION >= 201810
					UNITY_POSITION(pos);
				#else
					float4 pos : SV_POSITION;
				#endif
				#if defined(UNITY_HALF_PRECISION_FRAGMENT_SHADER_REGISTERS) && UNITY_VERSION >= 201810 && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					UNITY_LIGHTING_COORDS(2,3)
				#elif defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if UNITY_VERSION >= 201710
						UNITY_SHADOW_COORDS(2)
					#else
						SHADOW_COORDS(2)
					#endif
				#endif
				#ifdef ASE_FOG
					UNITY_FOG_COORDS(4)
				#endif
				float4 tSpace0 : TEXCOORD5;
				float4 tSpace1 : TEXCOORD6;
				float4 tSpace2 : TEXCOORD7;
				/*ase_interp(8,):sp=sp.xyzw;sc=tc2;wn.xyz=tc5.xyz;wt.xyz=tc6.xyz;wbt.xyz=tc7.xyz;wp.x=tc5.w;wp.y=tc6.w;wp.z=tc7.w*/
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			/*ase_globals*/
	
			/*ase_funcs*/

			v2f VertexFunction (appdata v /*ase_vert_input*/ ) {
				UNITY_SETUP_INSTANCE_ID(v);
				v2f o;
				UNITY_INITIALIZE_OUTPUT(v2f,o);
				UNITY_TRANSFER_INSTANCE_ID(v,o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				/*ase_vert_code:v=appdata;o=v2f*/
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = /*ase_vert_out:Vertex Offset;Float3;3;-1;_VertexP*/defaultVertexValue/*end*/;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif
				v.vertex.w = 1;
				v.normal = /*ase_vert_out:Vertex Normal;Float3;4;-1;_VertexNormalP*/v.normal/*end*/;
				v.tangent = /*ase_vert_out:Vertex Tangent;Float4;5;-1;_VertexTangentP*/v.tangent/*end*/;

				o.pos = UnityObjectToClipPos(v.vertex);
				float3 worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
				fixed3 worldNormal = UnityObjectToWorldNormal(v.normal);
				fixed3 worldTangent = UnityObjectToWorldDir(v.tangent.xyz);
				fixed tangentSign = v.tangent.w * unity_WorldTransformParams.w;
				fixed3 worldBinormal = cross(worldNormal, worldTangent) * tangentSign;
				o.tSpace0 = float4(worldTangent.x, worldBinormal.x, worldNormal.x, worldPos.x);
				o.tSpace1 = float4(worldTangent.y, worldBinormal.y, worldNormal.y, worldPos.y);
				o.tSpace2 = float4(worldTangent.z, worldBinormal.z, worldNormal.z, worldPos.z);

				#if UNITY_VERSION >= 201810 && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					UNITY_TRANSFER_LIGHTING(o, v.texcoord1.xy);
				#elif defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if UNITY_VERSION >= 201710
						UNITY_TRANSFER_SHADOW(o, v.texcoord1.xy);
					#else
						TRANSFER_SHADOW(o);
					#endif
				#endif

				#ifdef ASE_FOG
					UNITY_TRANSFER_FOG(o,o.pos);
				#endif
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float4 tangent : TANGENT;
				float3 normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				/*ase_vcontrol*/
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( appdata v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.tangent = v.tangent;
				o.normal = v.normal;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				/*ase_control_code:v=appdata;o=VertexControl*/
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = /*ase_inline_begin*/_TessValue/*ase_inline_end*/; float tessMin = /*ase_inline_begin*/_TessMin/*ase_inline_end*/; float tessMax = /*ase_inline_begin*/_TessMax/*ase_inline_end*/;
				float edgeLength = /*ase_inline_begin*/_TessEdgeLength/*ase_inline_end*/; float tessMaxDisp = /*ase_inline_begin*/_TessMaxDisp/*ase_inline_end*/;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, UNITY_MATRIX_M, _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, UNITY_MATRIX_M, _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, UNITY_MATRIX_M, _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			v2f DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				appdata o = (appdata) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.tangent = patch[0].tangent * bary.x + patch[1].tangent * bary.y + patch[2].tangent * bary.z;
				o.normal = patch[0].normal * bary.x + patch[1].normal * bary.y + patch[2].normal * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				/*ase_domain_code:patch=VertexControl;o=appdata;bary=SV_DomainLocation*/
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].normal * (dot(o.vertex.xyz, patch[i].normal) - dot(patch[i].vertex.xyz, patch[i].normal));
				float phongStrength = /*ase_inline_begin*/_TessPhongStrength/*ase_inline_end*/;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			v2f vert ( appdata v )
			{
				return VertexFunction( v );
			}
			#endif
			
			fixed4 frag (v2f IN /*ase_frag_input*/
				#ifdef _DEPTHOFFSET_ON
				, out float outputDepth : SV_Depth
				#endif
				) : SV_Target 
			{
				UNITY_SETUP_INSTANCE_ID(IN);

				#ifdef LOD_FADE_CROSSFADE
					UNITY_APPLY_DITHER_CROSSFADE(IN.pos.xy);
				#endif

				#if defined(_SPECULAR_SETUP)
					SurfaceOutputStandardSpecular o = (SurfaceOutputStandardSpecular)0;
				#else
					SurfaceOutputStandard o = (SurfaceOutputStandard)0;
				#endif
				/*ase_local_var:wt*/float3 WorldTangent = float3(IN.tSpace0.x,IN.tSpace1.x,IN.tSpace2.x);
				/*ase_local_var:wbt*/float3 WorldBiTangent = float3(IN.tSpace0.y,IN.tSpace1.y,IN.tSpace2.y);
				/*ase_local_var:wn*/float3 WorldNormal = float3(IN.tSpace0.z,IN.tSpace1.z,IN.tSpace2.z);
				/*ase_local_var:wp*/float3 worldPos = float3(IN.tSpace0.w,IN.tSpace1.w,IN.tSpace2.w);
				/*ase_local_var:wvd*/float3 worldViewDir = normalize(UnityWorldSpaceViewDir(worldPos));
				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					UNITY_LIGHT_ATTENUATION(atten, IN, worldPos)
				#else
					/*ase_local_var:sc*/half atten = 1;
				#endif

				/*ase_frag_code:IN=v2f*/
				float3 Color = /*ase_frag_out:Color;Float3;0;-1;_ColorP*/fixed3( 0, 0, 0 )/*end*/;
				float Alpha = /*ase_frag_out:Alpha;Float;1;-1;_AlphaP*/1/*end*/;
				float AlphaClipThreshold = /*ase_frag_out:Alpha Clip Threshold;Float;2;-1;_AlphaClipP*/0.5/*end*/;

				float4 c = float4( Color, Alpha );

				#ifdef _ALPHATEST_ON
					clip( Alpha - AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
					outputDepth = IN.pos.z;
				#endif

				#ifdef ASE_FOG
					UNITY_APPLY_FOG(IN.fogCoord, c);
				#endif
				return c;
			}
			ENDCG
		}

		/*ase_pass*/
		Pass
		{
			/*ase_main_pass*/
			Name "ForwardBase"
			Tags { "LightMode" = "ForwardBase" }
			
			Blend One Zero

			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma multi_compile_fwdbase
			#ifndef UNITY_PASS_FORWARDBASE
				#define UNITY_PASS_FORWARDBASE
			#endif
			#include "HLSLSupport.cginc"
			#ifndef UNITY_INSTANCED_LOD_FADE
				#define UNITY_INSTANCED_LOD_FADE
			#endif
			#ifndef UNITY_INSTANCED_SH
				#define UNITY_INSTANCED_SH
			#endif
			#ifndef UNITY_INSTANCED_LIGHTMAPSTS
				#define UNITY_INSTANCED_LIGHTMAPSTS
			#endif
			#include "UnityShaderVariables.cginc"
			#include "UnityCG.cginc"
			#include "Lighting.cginc"
			#include "UnityPBSLighting.cginc"
			#include "AutoLight.cginc"

			#pragma shader_feature_local _ _DISSOLVEGLOBALCONTROL_MASK_ONLY _DISSOLVEGLOBALCONTROL_MASK_AND_EDGE _DISSOLVEGLOBALCONTROL_ALL
			#pragma shader_feature_local _ _DISSOLVEMAPPINGTYPE_TRIPLANAR _DISSOLVEMAPPINGTYPE_SCREEN_SPACE
			#pragma shader_feature_local _ _DISSOLVEALPHASOURCE_CUSTOM_MAP _DISSOLVEALPHASOURCE_TWO_CUSTOM_MAPS _DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS
			#pragma multi_compile_local _  _ADDITIONALDISSOLVEMASK_XYZ_AXIS
			#pragma multi_compile_local _  _DISSOLVEMASK_PLANE _DISSOLVEMASK_BOX _DISSOLVEMASK_CONE
			#pragma shader_feature_local _ _DISSOLVEEDGETEXTURESOURCE_GRADIENT _DISSOLVEEDGETEXTURESOURCE_MAIN_MAP _DISSOLVEEDGETEXTURESOURCE_CUSTOM
			#pragma shader_feature_local _ _DISSOLVEMASKCOUNT_TWO _DISSOLVEMASKCOUNT_THREE _DISSOLVEMASKCOUNT_FOUR

			#define DISSOLVE_LEGACY_RENDER_PIPELIN
			#define DISSOLVE_LEGACY_MAINTEX
			#define DISSOLVE_LEGACY_TEXTURE_SAMPLE

			//#ifdef true
		#ifdef DISSOLVE_LEGACY_TEXTURE_SAMPLE
			#define DECLARE_TEXTURE_2D(t) sampler2D t; uniform sampler2D t##_Global;
		#else
			#define DECLARE_TEXTURE_2D(t) TEXTURE2D(t); SAMPLER(sampler##t); uniform TEXTURE2D(t##_Global); SAMPLER(sampler##t##_Global);
		#endif


		float _DissolveCutoff;						uniform float _DissolveCutoff_Global;


		float _AdditionalDissolveMaskInvert;		uniform float _AdditionalDissolveMaskInvert_Global;
		float _DissolveMaskAxis;					uniform float _DissolveMaskAxis_Global;
		float _DissolveMaskSpace;					uniform float _DissolveMaskSpace_Global;
		float _DissolveMaskOffset;					uniform float _DissolveMaskOffset_Global;
		float _DissolveMaskInvert;					uniform float _DissolveMaskInvert_Global;

		float _DissolveEdgeWidth;					uniform float _DissolveEdgeWidth_Global;
		float4 _DissolveEdgeColor;					uniform float4 _DissolveEdgeColor_Global;
		float _DissolveGIMultiplier;				uniform float _DissolveGIMultiplier_Global;
		float _DissolveEdgeColorIntensity;			uniform float _DissolveEdgeColorIntensity_Global;
		float _DissolveEdgeShape;			        uniform float _DissolveEdgeShape_Global;

		float _DissolveEdgeDistortionSource;		uniform float _DissolveEdgeDistortionSource_Global;
		float _DissolveEdgeDistortionStrength;		uniform float _DissolveEdgeDistortionStrength_Global;

		float _DissolveMainMapTiling;				uniform float _DissolveMainMapTiling_Global;

		float _DissolveCombineWithMasterNodeAlpha;    uniform float _DissolveCombineWithMasterNodeAlpha_Global;
		float _DissolveCombineWithMasterNodeColor;    uniform float _DissolveCombineWithMasterNodeColor_Global;

		#if defined(_DISSOLVEEDGETEXTURESOURCE_GRADIENT) || defined(_DISSOLVEEDGETEXTURESOURCE_MAIN_MAP) || defined(_DISSOLVEEDGETEXTURESOURCE_CUSTOM)
			DECLARE_TEXTURE_2D(_DissolveEdgeTexture)

			float _DissolveEdgeTextureReverse;												uniform float _DissolveEdgeTextureReverse_Global;
			float _DissolveEdgeTexturePhaseOffset;											uniform float _DissolveEdgeTexturePhaseOffset_Global;
			float _DissolveEdgeTextureAlphaOffset;											uniform float _DissolveEdgeTextureAlphaOffset_Global;

			#if defined(_DISSOLVEEDGETEXTURESOURCE_GRADIENT)
				float _DissolveEdgeTextureIsDynamic;		uniform float _DissolveEdgeTextureIsDynamic_Global;
			#else
				float _DissolveEdgeTextureMipmap;           uniform float _DissolveEdgeTextureMipmap_Global;
			#endif
		#endif


		#if defined(_DISSOLVEALPHASOURCE_CUSTOM_MAP) || defined(_DISSOLVEALPHASOURCE_TWO_CUSTOM_MAPS) || defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)
			DECLARE_TEXTURE_2D(_DissolveMap1)

			float4 _DissolveMap1_ST;											uniform float4 _DissolveMap1_ST_Global;
			float3 _DissolveMap1_Scroll;										uniform float3 _DissolveMap1_Scroll_Global;
			float  _DissolveMap1Intensity;										uniform float  _DissolveMap1Intensity_Global;
			int    _DissolveMap1Channel;					                    uniform int    _DissolveMap1Channel_Global;
		#endif

		#if defined(_DISSOLVEALPHASOURCE_TWO_CUSTOM_MAPS) || defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)
			DECLARE_TEXTURE_2D(_DissolveMap2)

			float4 _DissolveMap2_ST;											uniform float4 _DissolveMap2_ST_Global;
			float3 _DissolveMap2_Scroll;										uniform float3 _DissolveMap2_Scroll_Global;
			float  _DissolveMap2Intensity;										uniform float  _DissolveMap2Intensity_Global;
			int    _DissolveMap2Channel;					                    uniform int    _DissolveMap2Channel_Global;
		#endif

		#if defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)
			DECLARE_TEXTURE_2D(_DissolveMap3)

			float4 _DissolveMap3_ST;											uniform float4 _DissolveMap3_ST_Global;
			float3 _DissolveMap3_Scroll;										uniform float3 _DissolveMap3_Scroll_Global;
			float  _DissolveMap3Intensity;										uniform float  _DissolveMap3Intensity_Global;
			int    _DissolveMap3Channel;					                    uniform int    _DissolveMap3Channel_Global;
		#endif  


		float _DissolveSourceAlphaTexturesBlend;		uniform float _DissolveSourceAlphaTexturesBlend_Global;
		float _DissolveAlphaSourceTexturesUVSet;		uniform float _DissolveAlphaSourceTexturesUVSet_Global;
		float _DissolveNoiseStrength;					uniform float _DissolveNoiseStrength_Global;

		float3 _DissolveMaskPosition;					uniform float3 _DissolveMaskPosition_Global;
		float3 _DissolveMaskNormal;						uniform float3 _DissolveMaskNormal_Global;
		float _DissolveMaskRadius;						uniform float  _DissolveMaskRadius_Global;
		float _DissolveMaskHeight;						uniform float _DissolveMaskHeight_Global;

		#if defined(_DISSOLVEMASKCOUNT_FOUR)

			float3 _DissolveMask2Position;				uniform float3 _DissolveMask2Position_Global;
			float3 _DissolveMask2Normal;				uniform float3 _DissolveMask2Normal_Global;
			float _DissolveMask2Radius;					uniform float  _DissolveMask2Radius_Global;
			float _DissolveMask2Height;					uniform float _DissolveMask2Height_Global;

			float3 _DissolveMask3Position;				uniform float3 _DissolveMask3Position_Global;
			float3 _DissolveMask3Normal;				uniform float3 _DissolveMask3Normal_Global;
			float _DissolveMask3Radius;					uniform float  _DissolveMask3Radius_Global;
			float _DissolveMask3Height;					uniform float _DissolveMask3Height_Global;

			float3 _DissolveMask4Position;				uniform float3 _DissolveMask4Position_Global;
			float3 _DissolveMask4Normal;				uniform float3 _DissolveMask4Normal_Global;
			float _DissolveMask4Radius;					uniform float  _DissolveMask4Radius_Global;
			float _DissolveMask4Height;					uniform float _DissolveMask4Height_Global;

			#if defined(_DISSOLVEMASK_BOX)
				float3 _DissolveMask2BoundsMin;			uniform float3 _DissolveMask2BoundsMin_Global;
				float3 _DissolveMask2BoundsMax;			uniform float3 _DissolveMask2BoundsMax_Global;
				float4x4 _DissolveMask2TRS;				uniform float4x4 _DissolveMask2TRS_Global;

				float3 _DissolveMask3BoundsMin;			uniform float3 _DissolveMask3BoundsMin_Global;
				float3 _DissolveMask3BoundsMax;			uniform float3 _DissolveMask3BoundsMax_Global;
				float4x4 _DissolveMask3TRS;				uniform float4x4 _DissolveMask3TRS_Global;

				float3 _DissolveMask4BoundsMin;			uniform float3 _DissolveMask4BoundsMin_Global;
				float3 _DissolveMask4BoundsMax;			uniform float3 _DissolveMask4BoundsMax_Global;
				float4x4 _DissolveMask4TRS;				uniform float4x4 _DissolveMask4TRS_Global;
			#endif

		#elif defined(_DISSOLVEMASKCOUNT_THREE)

			float3 _DissolveMask2Position;				uniform float3 _DissolveMask2Position_Global;
			float3 _DissolveMask2Normal;				uniform float3 _DissolveMask2Normal_Global;
			float _DissolveMask2Radius;					uniform float  _DissolveMask2Radius_Global;
			float _DissolveMask2Height;					uniform float _DissolveMask2Height_Global;

			float3 _DissolveMask3Position;				uniform float3 _DissolveMask3Position_Global;
			float3 _DissolveMask3Normal;				uniform float3 _DissolveMask3Normal_Global;
			float _DissolveMask3Radius;					uniform float  _DissolveMask3Radius_Global;
			float _DissolveMask3Height;					uniform float _DissolveMask3Height_Global;

			#if defined(_DISSOLVEMASK_BOX)
				float3 _DissolveMask2BoundsMin;			uniform float3 _DissolveMask2BoundsMin_Global;
				float3 _DissolveMask2BoundsMax;			uniform float3 _DissolveMask2BoundsMax_Global;
				float4x4 _DissolveMask2TRS;				uniform float4x4 _DissolveMask2TRS_Global;

				float3 _DissolveMask3BoundsMin;			uniform float3 _DissolveMask3BoundsMin_Global;
				float3 _DissolveMask3BoundsMax;			uniform float3 _DissolveMask3BoundsMax_Global;
				float4x4 _DissolveMask3TRS;				uniform float4x4 _DissolveMask3TRS_Global;
			#endif

		#elif defined(_DISSOLVEMASKCOUNT_TWO)

			float3 _DissolveMask2Position;				uniform float3 _DissolveMask2Position_Global;
			float3 _DissolveMask2Normal;				uniform float3 _DissolveMask2Normal_Global;
			float _DissolveMask2Radius;					uniform float  _DissolveMask2Radius_Global;
			float _DissolveMask2Height;					uniform float _DissolveMask2Height_Global;

			#if defined(_DISSOLVEMASK_BOX)
				float3 _DissolveMask2BoundsMin;			uniform float3 _DissolveMask2BoundsMin_Global;
				float3 _DissolveMask2BoundsMax;			uniform float3 _DissolveMask2BoundsMax_Global;
				float4x4 _DissolveMask2TRS;				uniform float4x4 _DissolveMask2TRS_Global;
			#endif

		#endif


		#if defined(_DISSOLVEMASK_BOX)
			float3 _DissolveMaskBoundsMin;				float3 _DissolveMaskBoundsMin_Global;
			float3 _DissolveMaskBoundsMax;				float3 _DissolveMaskBoundsMax_Global;
			float4x4 _DissolveMaskTRS;					float4x4 _DissolveMaskTRS_Global;
		#endif


		#ifdef _DISSOLVEMAPPINGTYPE_TRIPLANAR	
			float _DissolveTriplanarMappingSpace;		uniform float _DissolveTriplanarMappingSpace_Global;
		#endif


		float3 _Dissolve_ObjectWorldPos;

		const float3 const_zero = float3(0, 0, 0);


		#if defined(_DISSOLVEGLOBALCONTROL_MASK_ONLY)

		//Globals-----------------------------------------------------------------------
		#define VALUE_CUTOFF					_DissolveCutoff_Global

		#define VALUE_CUTOFF_AXIS				_DissolveMaskAxis_Global
		#define VALUE_MASK_SPACE				_DissolveMaskSpace_Global
		#define VALUE_MASK_OFFSET				_DissolveMaskOffset_Global
		#define VALUE_AXIS_INVERT				_DissolveMaskInvert_Global
		#define VALUE_ADDITIONAL_AXIS_INVERT	_AdditionalDissolveMaskInvert_Global

		#define VALUE_MASK_POSITION				_DissolveMaskPosition_Global
		#define VALUE_MASK_NORMAL			    _DissolveMaskNormal_Global
		#define VALUE_MASK_RADIUS		        _DissolveMaskRadius_Global
		#define VALUE_MASK_HEIGHT				_DissolveMaskHeight_Global

		#if defined(_DISSOLVEMASKCOUNT_FOUR)
			#define VALUE_MASK_2_POSITION			_DissolveMask2Position_Global
			#define VALUE_MASK_2_NORMAL				_DissolveMask2Normal_Global
			#define VALUE_MASK_2_RADIUS				_DissolveMask2Radius_Global
			#define VALUE_MASK_2_HEIGHT				_DissolveMask2Height_Global

			#define VALUE_MASK_3_POSITION			_DissolveMask3Position_Global
			#define VALUE_MASK_3_NORMAL				_DissolveMask3Normal_Global
			#define VALUE_MASK_3_RADIUS				_DissolveMask3Radius_Global
			#define VALUE_MASK_3_HEIGHT				_DissolveMask3Height_Global

			#define VALUE_MASK_4_POSITION			_DissolveMask4Position_Global
			#define VALUE_MASK_4_NORMAL				_DissolveMask4Normal_Global
			#define VALUE_MASK_4_RADIUS				_DissolveMask4Radius_Global
			#define VALUE_MASK_4_HEIGHT				_DissolveMask4Height_Global

			#if defined(_DISSOLVEMASK_BOX)
				#define VALUE_MASK_2_BOUNDS_MIN		_DissolveMask2BoundsMin_Global
				#define VALUE_MASK_2_BOUNDS_MAX		_DissolveMask2BoundsMax_Global
				#define VALUE_MASK_2_TRS			_DissolveMask2TRS_Global

				#define VALUE_MASK_3_BOUNDS_MIN		_DissolveMask3BoundsMin_Global
				#define VALUE_MASK_3_BOUNDS_MAX		_DissolveMask3BoundsMax_Global
				#define VALUE_MASK_3_TRS			_DissolveMask3TRS_Global

				#define VALUE_MASK_4_BOUNDS_MIN		_DissolveMask4BoundsMin_Global
				#define VALUE_MASK_4_BOUNDS_MAX		_DissolveMask4BoundsMax_Global
				#define VALUE_MASK_4_TRS			_DissolveMask4TRS_Global
			#endif
		#elif defined(_DISSOLVEMASKCOUNT_THREE)
			#define VALUE_MASK_2_POSITION			_DissolveMask2Position_Global
			#define VALUE_MASK_2_NORMAL				_DissolveMask2Normal_Global
			#define VALUE_MASK_2_RADIUS				_DissolveMask2Radius_Global
			#define VALUE_MASK_2_HEIGHT				_DissolveMask2Height_Global

			#define VALUE_MASK_3_POSITION			_DissolveMask3Position_Global
			#define VALUE_MASK_3_NORMAL				_DissolveMask3Normal_Global
			#define VALUE_MASK_3_RADIUS				_DissolveMask3Radius_Global
			#define VALUE_MASK_3_HEIGHT				_DissolveMask3Height_Global

			#if defined(_DISSOLVEMASK_BOX)
				#define VALUE_MASK_2_BOUNDS_MIN		_DissolveMask2BoundsMin_Global
				#define VALUE_MASK_2_BOUNDS_MAX		_DissolveMask2BoundsMax_Global
				#define VALUE_MASK_2_TRS			_DissolveMask2TRS_Global

				#define VALUE_MASK_3_BOUNDS_MIN		_DissolveMask3BoundsMin_Global
				#define VALUE_MASK_3_BOUNDS_MAX		_DissolveMask3BoundsMax_Global
				#define VALUE_MASK_3_TRS			_DissolveMask3TRS_Global
			#endif
		#elif defined(_DISSOLVEMASKCOUNT_TWO)
			#define VALUE_MASK_2_POSITION			_DissolveMask2Position_Global
			#define VALUE_MASK_2_NORMAL				_DissolveMask2Normal_Global
			#define VALUE_MASK_2_RADIUS				_DissolveMask2Radius_Global
			#define VALUE_MASK_2_HEIGHT				_DissolveMask2Height_Global

			#if defined(_DISSOLVEMASK_BOX)
				#define VALUE_MASK_2_BOUNDS_MIN		_DissolveMask2BoundsMin_Global
				#define VALUE_MASK_2_BOUNDS_MAX		_DissolveMask2BoundsMax_Global
				#define VALUE_MASK_2_TRS			_DissolveMask2TRS_Global
			#endif
		#endif


		#if defined(_DISSOLVEMASK_BOX)
			#define VALUE_MASK_BOUNDS_MIN			_DissolveMaskBoundsMin_Global
			#define VALUE_MASK_BOUNDS_MAX			_DissolveMaskBoundsMax_Global
			#define VALUE_MASK_TRS					_DissolveMaskTRS_Global
		#endif

		//Per material---------------------------------------------------------------------

		#define VALUE_MAIN_MAP_TILING				_DissolveMainMapTiling

		#if defined(_DISSOLVEALPHASOURCE_CUSTOM_MAP) || defined(_DISSOLVEALPHASOURCE_TWO_CUSTOM_MAPS) || defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)
			#define VALUE_MAP1						_DissolveMap1
			#define VALUE_MAP1_SAMPLER				sampler_DissolveMap1
			#define VALUE_MAP1_ST					_DissolveMap1_ST
			#define VALUE_MAP1_SCROLL				_DissolveMap1_Scroll
			#define VALUE_MAP1_INTENSITY			_DissolveMap1Intensity
			#define VALUE_MAP1_CHANNEL				_DissolveMap1Channel
		#endif

		#if defined(_DISSOLVEALPHASOURCE_TWO_CUSTOM_MAPS) || defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)
			#define VALUE_MAP2						_DissolveMap2
			#define VALUE_MAP2_SAMPLER				sampler_DissolveMap2
			#define VALUE_MAP2_ST					_DissolveMap2_ST
			#define VALUE_MAP2_SCROLL				_DissolveMap2_Scroll
			#define VALUE_MAP2_INTENSITY			_DissolveMap2Intensity
			#define VALUE_MAP2_CHANNEL				_DissolveMap2Channel
		#endif

		#if defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)
			#define VALUE_MAP3						_DissolveMap3
			#define VALUE_MAP3_SAMPLER				sampler_DissolveMap3
			#define VALUE_MAP3_ST					_DissolveMap3_ST
			#define VALUE_MAP3_SCROLL				_DissolveMap3_Scroll
			#define VALUE_MAP3_INTENSITY			_DissolveMap3Intensity
			#define VALUE_MAP3_CHANNEL				_DissolveMap3Channel
		#endif

		#define VALUE_EDGE_SIZE					_DissolveEdgeWidth
		#define VALUE_EDGE_COLOR				_DissolveEdgeColor
		#define VALUE_EDGE_DISTORTION_SOURCE    _DissolveEdgeDistortionSource
		#define VALUE_EDGE_DISTORTION			_DissolveEdgeDistortionStrength
		#define VALUE_EDGE_COLOR_INTENSITY		_DissolveEdgeColorIntensity
		#define VALUE_EDGE_SHAPE				_DissolveEdgeShape
		#define VALUE_GI_MULTIPLIER				_DissolveGIMultiplier


		#if defined(_DISSOLVEEDGETEXTURESOURCE_GRADIENT) || defined(_DISSOLVEEDGETEXTURESOURCE_MAIN_MAP) || defined(_DISSOLVEEDGETEXTURESOURCE_CUSTOM)

			#define VALUE_EDGE_TEXTURE					_DissolveEdgeTexture
			#define VALUE_EDGE_TEXTURE_SAMPLER          sampler_DissolveEdgeTexture
			#define VALUE_EDGE_TEXTURE_REVERSE			_DissolveEdgeTextureReverse
			#define VALUE_EDGE_TEXTURE_OFFSET			_DissolveEdgeTexturePhaseOffset
			#define VALUE_EDGETEXTUREALPHAOFFSET		_DissolveEdgeTextureAlphaOffset

			#if defined(_DISSOLVEEDGETEXTURESOURCE_GRADIENT)
				#define VALUE_EDGE_TEXTURE_IS_DYNAMIC	_DissolveEdgeTextureIsDynamic
			#else
				#define VALUE_EDGE_TEXTURE_MIPMAP       _DissolveEdgeTextureMipmap
			#endif
		#endif


		#define VALUE_ALPHATEXTUREBLEND			_DissolveSourceAlphaTexturesBlend
		#define VALUE_UVSET						_DissolveAlphaSourceTexturesUVSet
		#define VALUE_NOISE_STRENGTH			_DissolveNoiseStrength

		#ifdef _DISSOLVEMAPPINGTYPE_TRIPLANAR
			#define VALUE_TRIPLANARMAPPINGSPACE          _DissolveTriplanarMappingSpace
		#endif

		#define VALUE_COMBINE_WITH_MASTER_NODE_ALPHA     _DissolveCombineWithMasterNodeAlpha
		#define VALUE_COMBINE_WITH_MASTER_NODE_COLOR     _DissolveCombineWithMasterNodeColor

	#elif defined(_DISSOLVEGLOBALCONTROL_MASK_AND_EDGE)

		//Globals-----------------------------------------------------------------------
		#define VALUE_CUTOFF					_DissolveCutoff_Global

		#define VALUE_CUTOFF_AXIS				_DissolveMaskAxis_Global
		#define VALUE_MASK_SPACE				_DissolveMaskSpace_Global
		#define VALUE_MASK_OFFSET				_DissolveMaskOffset_Global
		#define VALUE_AXIS_INVERT				_DissolveMaskInvert_Global
		#define VALUE_ADDITIONAL_AXIS_INVERT	_AdditionalDissolveMaskInvert_Global

		#define VALUE_MASK_POSITION				_DissolveMaskPosition_Global
		#define VALUE_MASK_NORMAL				_DissolveMaskNormal_Global
		#define VALUE_MASK_RADIUS				_DissolveMaskRadius_Global
		#define VALUE_MASK_HEIGHT				_DissolveMaskHeight_Global

		#if defined(_DISSOLVEMASKCOUNT_FOUR)
			#define VALUE_MASK_2_POSITION			_DissolveMask2Position_Global
			#define VALUE_MASK_2_NORMAL				_DissolveMask2Normal_Global
			#define VALUE_MASK_2_RADIUS				_DissolveMask2Radius_Global
			#define VALUE_MASK_2_HEIGHT				_DissolveMask2Height_Global

			#define VALUE_MASK_3_POSITION			_DissolveMask3Position_Global
			#define VALUE_MASK_3_NORMAL				_DissolveMask3Normal_Global
			#define VALUE_MASK_3_RADIUS				_DissolveMask3Radius_Global
			#define VALUE_MASK_3_HEIGHT				_DissolveMask3Height_Global

			#define VALUE_MASK_4_POSITION			_DissolveMask4Position_Global
			#define VALUE_MASK_4_NORMAL				_DissolveMask4Normal_Global
			#define VALUE_MASK_4_RADIUS				_DissolveMask4Radius_Global
			#define VALUE_MASK_4_HEIGHT				_DissolveMask4Height_Global

			#if defined(_DISSOLVEMASK_BOX)
				#define VALUE_MASK_2_BOUNDS_MIN		_DissolveMask2BoundsMin_Global
				#define VALUE_MASK_2_BOUNDS_MAX		_DissolveMask2BoundsMax_Global
				#define VALUE_MASK_2_TRS			_DissolveMask2TRS_Global

				#define VALUE_MASK_3_BOUNDS_MIN		_DissolveMask3BoundsMin_Global
				#define VALUE_MASK_3_BOUNDS_MAX		_DissolveMask3BoundsMax_Global
				#define VALUE_MASK_3_TRS			_DissolveMask3TRS_Global

				#define VALUE_MASK_4_BOUNDS_MIN		_DissolveMask4BoundsMin_Global
				#define VALUE_MASK_4_BOUNDS_MAX		_DissolveMask4BoundsMax_Global
				#define VALUE_MASK_4_TRS			_DissolveMask4TRS_Global
			#endif
		#elif defined(_DISSOLVEMASKCOUNT_THREE)
			#define VALUE_MASK_2_POSITION			_DissolveMask2Position_Global
			#define VALUE_MASK_2_NORMAL				_DissolveMask2Normal_Global
			#define VALUE_MASK_2_RADIUS				_DissolveMask2Radius_Global
			#define VALUE_MASK_2_HEIGHT				_DissolveMask2Height_Global

			#define VALUE_MASK_3_POSITION			_DissolveMask3Position_Global
			#define VALUE_MASK_3_NORMAL				_DissolveMask3Normal_Global
			#define VALUE_MASK_3_RADIUS				_DissolveMask3Radius_Global
			#define VALUE_MASK_3_HEIGHT				_DissolveMask3Height_Global

			#if defined(_DISSOLVEMASK_BOX)
				#define VALUE_MASK_2_BOUNDS_MIN		_DissolveMask2BoundsMin_Global
				#define VALUE_MASK_2_BOUNDS_MAX		_DissolveMask2BoundsMax_Global
				#define VALUE_MASK_2_TRS			_DissolveMask2TRS_Global

				#define VALUE_MASK_3_BOUNDS_MIN		_DissolveMask3BoundsMin_Global
				#define VALUE_MASK_3_BOUNDS_MAX		_DissolveMask3BoundsMax_Global
				#define VALUE_MASK_3_TRS			_DissolveMask3TRS_Global
			#endif
		#elif defined(_DISSOLVEMASKCOUNT_TWO)
			#define VALUE_MASK_2_POSITION			_DissolveMask2Position_Global
			#define VALUE_MASK_2_NORMAL				_DissolveMask2Normal_Global
			#define VALUE_MASK_2_RADIUS				_DissolveMask2Radius_Global
			#define VALUE_MASK_2_HEIGHT				_DissolveMask2Height_Global

			#if defined(_DISSOLVEMASK_BOX)
				#define VALUE_MASK_2_BOUNDS_MIN			_DissolveMask2BoundsMin_Global
				#define VALUE_MASK_2_BOUNDS_MAX		_DissolveMask2BoundsMax_Global
				#define VALUE_MASK_2_TRS			_DissolveMask2TRS_Global
			#endif
		#endif


		#if defined(_DISSOLVEMASK_BOX)
			#define VALUE_MASK_BOUNDS_MIN		_DissolveMaskBoundsMin_Global
			#define VALUE_MASK_BOUNDS_MAX		_DissolveMaskBoundsMax_Global
			#define VALUE_MASK_TRS				_DissolveMaskTRS_Global
		#endif

		#define VALUE_EDGE_SIZE					_DissolveEdgeWidth_Global
		#define VALUE_EDGE_SHAPE				_DissolveEdgeShape_Global
		#define VALUE_EDGE_COLOR				_DissolveEdgeColor_Global
		#define VALUE_EDGE_COLOR_INTENSITY		_DissolveEdgeColorIntensity_Global
		#define VALUE_GI_MULTIPLIER				_DissolveGIMultiplier

		#if defined(_DISSOLVEEDGETEXTURESOURCE_GRADIENT) || defined(_DISSOLVEEDGETEXTURESOURCE_MAIN_MAP) || defined(_DISSOLVEEDGETEXTURESOURCE_CUSTOM)

			#define VALUE_EDGE_TEXTURE					_DissolveEdgeTexture_Global
			#define VALUE_EDGE_TEXTURE_SAMPLER          sampler_DissolveEdgeTexture_Global
			#define VALUE_EDGE_TEXTURE_REVERSE			_DissolveEdgeTextureReverse_Global
			#define VALUE_EDGE_TEXTURE_OFFSET			_DissolveEdgeTexturePhaseOffset_Global
			#define VALUE_EDGETEXTUREALPHAOFFSET		_DissolveEdgeTextureAlphaOffset_Global

			#if defined(_DISSOLVEEDGETEXTURESOURCE_GRADIENT)
				#define VALUE_EDGE_TEXTURE_IS_DYNAMIC	_DissolveEdgeTextureIsDynamic_Global
			#else
				#define VALUE_EDGE_TEXTURE_MIPMAP       _DissolveEdgeTextureMipmap_Global
			#endif
		#endif

		//Per material---------------------------------------------------------------------	

		#define VALUE_MAIN_MAP_TILING				_DissolveMainMapTiling

		#if defined(_DISSOLVEALPHASOURCE_CUSTOM_MAP) || defined(_DISSOLVEALPHASOURCE_TWO_CUSTOM_MAPS) || defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)
			#define VALUE_MAP1						_DissolveMap1
			#define VALUE_MAP1_SAMPLER				sampler_DissolveMap1
			#define VALUE_MAP1_ST					_DissolveMap1_ST
			#define VALUE_MAP1_SCROLL				_DissolveMap1_Scroll
			#define VALUE_MAP1_INTENSITY			_DissolveMap1Intensity
			#define VALUE_MAP1_CHANNEL				_DissolveMap1Channel
		#endif

		#if defined(_DISSOLVEALPHASOURCE_TWO_CUSTOM_MAPS) || defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)
			#define VALUE_MAP2						_DissolveMap2
			#define VALUE_MAP2_SAMPLER				sampler_DissolveMap2
			#define VALUE_MAP2_ST					_DissolveMap2_ST
			#define VALUE_MAP2_SCROLL				_DissolveMap2_Scroll
			#define VALUE_MAP2_INTENSITY			_DissolveMap2Intensity
			#define VALUE_MAP2_CHANNEL				_DissolveMap2Channel
		#endif

		#if defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)
			#define VALUE_MAP3						_DissolveMap3
			#define VALUE_MAP3_SAMPLER				sampler_DissolveMap3
			#define VALUE_MAP3_ST					_DissolveMap3_ST
			#define VALUE_MAP3_SCROLL				_DissolveMap3_Scroll
			#define VALUE_MAP3_INTENSITY			_DissolveMap3Intensity
			#define VALUE_MAP3_CHANNEL				_DissolveMap3Channel
		#endif


		#define VALUE_EDGE_DISTORTION_SOURCE   _DissolveEdgeDistortionSource
		#define VALUE_EDGE_DISTORTION			_DissolveEdgeDistortionStrength	


		#define VALUE_ALPHATEXTUREBLEND			_DissolveSourceAlphaTexturesBlend
		#define VALUE_UVSET						_DissolveAlphaSourceTexturesUVSet
		#define VALUE_NOISE_STRENGTH			_DissolveNoiseStrength

		#ifdef _DISSOLVEMAPPINGTYPE_TRIPLANAR
			#define VALUE_TRIPLANARMAPPINGSPACE          _DissolveTriplanarMappingSpace
		#endif

		#define VALUE_COMBINE_WITH_MASTER_NODE_ALPHA     _DissolveCombineWithMasterNodeAlpha
		#define VALUE_COMBINE_WITH_MASTER_NODE_COLOR     _DissolveCombineWithMasterNodeColor

	#elif defined(_DISSOLVEGLOBALCONTROL_ALL)

		#define VALUE_CUTOFF					_DissolveCutoff_Global

		#define VALUE_CUTOFF_AXIS				_DissolveMaskAxis_Global
		#define VALUE_MASK_SPACE				_DissolveMaskSpace_Global
		#define VALUE_MASK_OFFSET				_DissolveMaskOffset_Global
		#define VALUE_AXIS_INVERT				_DissolveMaskInvert_Global
		#define VALUE_ADDITIONAL_AXIS_INVERT	_AdditionalDissolveMaskInvert_Global

		#define VALUE_EDGE_SIZE					_DissolveEdgeWidth_Global
		#define VALUE_EDGE_COLOR				_DissolveEdgeColor_Global
		#define VALUE_EDGE_DISTORTION_SOURCE   _DissolveEdgeDistortionSource_Global
		#define VALUE_EDGE_DISTORTION			_DissolveEdgeDistortionStrength_Global
		#define VALUE_EDGE_COLOR_INTENSITY		_DissolveEdgeColorIntensity_Global
		#define VALUE_EDGE_SHAPE				_DissolveEdgeShape_Global
		#define VALUE_GI_MULTIPLIER				_DissolveGIMultiplier_Global


		#if defined(_DISSOLVEEDGETEXTURESOURCE_GRADIENT) || defined(_DISSOLVEEDGETEXTURESOURCE_MAIN_MAP) || defined(_DISSOLVEEDGETEXTURESOURCE_CUSTOM)

			#define VALUE_EDGE_TEXTURE					_DissolveEdgeTexture_Global
			#define VALUE_EDGE_TEXTURE_SAMPLER          sampler_DissolveEdgeTexture_Global
			#define VALUE_EDGE_TEXTURE_REVERSE			_DissolveEdgeTextureReverse_Global
			#define VALUE_EDGE_TEXTURE_OFFSET			_DissolveEdgeTexturePhaseOffset_Global
			#define VALUE_EDGETEXTUREALPHAOFFSET		_DissolveEdgeTextureAlphaOffset_Global

			#if defined(_DISSOLVEEDGETEXTURESOURCE_GRADIENT)
				#define VALUE_EDGE_TEXTURE_IS_DYNAMIC	_DissolveEdgeTextureIsDynamic_Global
			#else
				#define VALUE_EDGE_TEXTURE_MIPMAP       _DissolveEdgeTextureMipmap_Global
			#endif
		#endif


		#define VALUE_MAIN_MAP_TILING				_DissolveMainMapTiling_Global

		#if defined(_DISSOLVEALPHASOURCE_CUSTOM_MAP) || defined(_DISSOLVEALPHASOURCE_TWO_CUSTOM_MAPS) || defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)
			#define VALUE_MAP1						_DissolveMap1_Global
			#define VALUE_MAP1_SAMPLER				sampler_DissolveMap1_Global
			#define VALUE_MAP1_ST					_DissolveMap1_ST_Global
			#define VALUE_MAP1_SCROLL				_DissolveMap1_Scroll_Global
			#define VALUE_MAP1_INTENSITY			_DissolveMap1Intensity_Global
			#define VALUE_MAP1_CHANNEL				_DissolveMap1Channel_Global
		#endif

		#if defined(_DISSOLVEALPHASOURCE_TWO_CUSTOM_MAPS) || defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)
			#define VALUE_MAP2						_DissolveMap2_Global
			#define VALUE_MAP2_SAMPLER				sampler_DissolveMap2_Global
			#define VALUE_MAP2_ST					_DissolveMap2_ST_Global
			#define VALUE_MAP2_SCROLL				_DissolveMap2_Scroll_Global
			#define VALUE_MAP2_INTENSITY			_DissolveMap2Intensity_Global
			#define VALUE_MAP2_CHANNEL				_DissolveMap2Channel_Global
		#endif

		#if defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)
			#define VALUE_MAP3						_DissolveMap3_Global
			#define VALUE_MAP3_SAMPLER				sampler_DissolveMap3_Global
			#define VALUE_MAP3_ST					_DissolveMap3_ST_Global
			#define VALUE_MAP3_SCROLL				_DissolveMap3_Scroll_Global
			#define VALUE_MAP3_INTENSITY			_DissolveMap3Intensity_Global
			#define VALUE_MAP3_CHANNEL				_DissolveMap3Channel_Global
		#endif

		#define VALUE_ALPHATEXTUREBLEND			_DissolveSourceAlphaTexturesBlend_Global
		#define VALUE_UVSET						_DissolveAlphaSourceTexturesUVSet_Global
		#define VALUE_NOISE_STRENGTH			_DissolveNoiseStrength_Global

		#define VALUE_MASK_POSITION				_DissolveMaskPosition_Global
		#define VALUE_MASK_NORMAL				_DissolveMaskNormal_Global
		#define VALUE_MASK_RADIUS				_DissolveMaskRadius_Global
		#define VALUE_MASK_HEIGHT				_DissolveMaskHeight_Global

		#if defined(_DISSOLVEMASKCOUNT_FOUR)
			#define VALUE_MASK_2_POSITION			_DissolveMask2Position_Global
			#define VALUE_MASK_2_NORMAL				_DissolveMask2Normal_Global
			#define VALUE_MASK_2_RADIUS				_DissolveMask2Radius_Global
			#define VALUE_MASK_2_HEIGHT				_DissolveMask2Height_Global

			#define VALUE_MASK_3_POSITION			_DissolveMask3Position_Global
			#define VALUE_MASK_3_NORMAL				_DissolveMask3Normal_Global
			#define VALUE_MASK_3_RADIUS				_DissolveMask3Radius_Global
			#define VALUE_MASK_3_HEIGHT				_DissolveMask3Height_Global

			#define VALUE_MASK_4_POSITION			_DissolveMask4Position_Global
			#define VALUE_MASK_4_NORMAL				_DissolveMask4Normal_Global
			#define VALUE_MASK_4_RADIUS				_DissolveMask4Radius_Global
			#define VALUE_MASK_4_HEIGHT				_DissolveMask4Height_Global

			#if defined(_DISSOLVEMASK_BOX)
				#define VALUE_MASK_2_BOUNDS_MIN		_DissolveMask2BoundsMin_Global
				#define VALUE_MASK_2_BOUNDS_MAX		_DissolveMask2BoundsMax_Global
				#define VALUE_MASK_2_TRS			_DissolveMask2TRS_Global

				#define VALUE_MASK_3_BOUNDS_MIN		_DissolveMask3BoundsMin_Global
				#define VALUE_MASK_3_BOUNDS_MAX		_DissolveMask3BoundsMax_Global
				#define VALUE_MASK_3_TRS			_DissolveMask3TRS_Global

				#define VALUE_MASK_4_BOUNDS_MIN		_DissolveMask4BoundsMin_Global
				#define VALUE_MASK_4_BOUNDS_MAX		_DissolveMask4BoundsMax_Global
				#define VALUE_MASK_4_TRS			_DissolveMask4TRS_Global
			#endif
		#elif defined(_DISSOLVEMASKCOUNT_THREE)
			#define VALUE_MASK_2_POSITION			_DissolveMask2Position_Global
			#define VALUE_MASK_2_NORMAL				_DissolveMask2Normal_Global
			#define VALUE_MASK_2_RADIUS				_DissolveMask2Radius_Global
			#define VALUE_MASK_2_HEIGHT				_DissolveMask2Height_Global

			#define VALUE_MASK_3_POSITION			_DissolveMask3Position_Global
			#define VALUE_MASK_3_NORMAL				_DissolveMask3Normal_Global
			#define VALUE_MASK_3_RADIUS				_DissolveMask3Radius_Global
			#define VALUE_MASK_3_HEIGHT				_DissolveMask3Height_Global

			#if defined(_DISSOLVEMASK_BOX)
				#define VALUE_MASK_2_BOUNDS_MIN		_DissolveMask2BoundsMin_Global
				#define VALUE_MASK_2_BOUNDS_MAX		_DissolveMask2BoundsMax_Global
				#define VALUE_MASK_2_TRS			_DissolveMask2TRS_Global

				#define VALUE_MASK_3_BOUNDS_MIN		_DissolveMask3BoundsMin_Global
				#define VALUE_MASK_3_BOUNDS_MAX		_DissolveMask3BoundsMax_Global
				#define VALUE_MASK_3_TRS			_DissolveMask3TRS_Global
			#endif
		#elif defined(_DISSOLVEMASKCOUNT_TWO)
			#define VALUE_MASK_2_POSITION			_DissolveMask2Position_Global
			#define VALUE_MASK_2_NORMAL				_DissolveMask2Normal_Global
			#define VALUE_MASK_2_RADIUS				_DissolveMask2Radius_Global
			#define VALUE_MASK_2_HEIGHT				_DissolveMask2Height_Global

			#if defined(_DISSOLVEMASK_BOX)
				#define VALUE_MASK_2_BOUNDS_MIN		_DissolveMask2BoundsMin_Global
				#define VALUE_MASK_2_BOUNDS_MAX		_DissolveMask2BoundsMax_Global
				#define VALUE_MASK_2_TRS			_DissolveMask2TRS_Global
			#endif
		#endif


		#if defined(_DISSOLVEMASK_BOX)
			#define VALUE_MASK_BOUNDS_MIN		_DissolveMaskBoundsMin_Global
			#define VALUE_MASK_BOUNDS_MAX		_DissolveMaskBoundsMax_Global
			#define VALUE_MASK_TRS				_DissolveMaskTRS_Global
		#endif


		#ifdef _DISSOLVEMAPPINGTYPE_TRIPLANAR
			#define VALUE_TRIPLANARMAPPINGSPACE          _DissolveTriplanarMappingSpace_Global
		#endif

		#define VALUE_COMBINE_WITH_MASTER_NODE_ALPHA     _DissolveCombineWithMasterNodeAlpha_Global
		#define VALUE_COMBINE_WITH_MASTER_NODE_COLOR     _DissolveCombineWithMasterNodeColor_Global

	#else

		#define VALUE_CUTOFF					_DissolveCutoff

		#define VALUE_CUTOFF_AXIS				_DissolveMaskAxis
		#define VALUE_MASK_SPACE				_DissolveMaskSpace
		#define VALUE_MASK_OFFSET				_DissolveMaskOffset	
		#define VALUE_AXIS_INVERT				_DissolveMaskInvert
		#define VALUE_ADDITIONAL_AXIS_INVERT	_AdditionalDissolveMaskInvert

		#define VALUE_EDGE_SIZE					_DissolveEdgeWidth
		#define VALUE_EDGE_COLOR				_DissolveEdgeColor
		#define VALUE_EDGE_DISTORTION_SOURCE   _DissolveEdgeDistortionSource
		#define VALUE_EDGE_DISTORTION			_DissolveEdgeDistortionStrength
		#define VALUE_EDGE_COLOR_INTENSITY		_DissolveEdgeColorIntensity
		#define VALUE_EDGE_SHAPE				_DissolveEdgeShape
		#define VALUE_GI_MULTIPLIER				_DissolveGIMultiplier


		#if defined(_DISSOLVEEDGETEXTURESOURCE_GRADIENT) || defined(_DISSOLVEEDGETEXTURESOURCE_MAIN_MAP) || defined(_DISSOLVEEDGETEXTURESOURCE_CUSTOM)

			#define VALUE_EDGE_TEXTURE					_DissolveEdgeTexture
			#define VALUE_EDGE_TEXTURE_SAMPLER          sampler_DissolveEdgeTexture
			#define VALUE_EDGE_TEXTURE_REVERSE			_DissolveEdgeTextureReverse
			#define VALUE_EDGE_TEXTURE_OFFSET			_DissolveEdgeTexturePhaseOffset
			#define VALUE_EDGETEXTUREALPHAOFFSET		_DissolveEdgeTextureAlphaOffset

			#if defined(_DISSOLVEEDGETEXTURESOURCE_GRADIENT)
				#define VALUE_EDGE_TEXTURE_IS_DYNAMIC	_DissolveEdgeTextureIsDynamic
			#else
				#define VALUE_EDGE_TEXTURE_MIPMAP       _DissolveEdgeTextureMipmap
			#endif
		#endif


		#define VALUE_MAIN_MAP_TILING				_DissolveMainMapTiling

		#if defined(_DISSOLVEALPHASOURCE_CUSTOM_MAP) || defined(_DISSOLVEALPHASOURCE_TWO_CUSTOM_MAPS) || defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)
			#define VALUE_MAP1						_DissolveMap1
			#define VALUE_MAP1_SAMPLER				sampler_DissolveMap1
			#define VALUE_MAP1_ST					_DissolveMap1_ST
			#define VALUE_MAP1_SCROLL				_DissolveMap1_Scroll
			#define VALUE_MAP1_INTENSITY			_DissolveMap1Intensity
			#define VALUE_MAP1_CHANNEL				_DissolveMap1Channel
		#endif

		#if defined(_DISSOLVEALPHASOURCE_TWO_CUSTOM_MAPS) || defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)
			#define VALUE_MAP2						_DissolveMap2
			#define VALUE_MAP2_SAMPLER				sampler_DissolveMap2
			#define VALUE_MAP2_ST					_DissolveMap2_ST
			#define VALUE_MAP2_SCROLL				_DissolveMap2_Scroll
			#define VALUE_MAP2_INTENSITY			_DissolveMap2Intensity
			#define VALUE_MAP2_CHANNEL				_DissolveMap2Channel
		#endif

		#if defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)
			#define VALUE_MAP3						_DissolveMap3
			#define VALUE_MAP3_SAMPLER				sampler_DissolveMap3
			#define VALUE_MAP3_ST					_DissolveMap3_ST
			#define VALUE_MAP3_SCROLL				_DissolveMap3_Scroll
			#define VALUE_MAP3_INTENSITY			_DissolveMap3Intensity
			#define VALUE_MAP3_CHANNEL				_DissolveMap3Channel
		#endif

		#define VALUE_ALPHATEXTUREBLEND			_DissolveSourceAlphaTexturesBlend
		#define VALUE_UVSET						_DissolveAlphaSourceTexturesUVSet
		#define VALUE_NOISE_STRENGTH			_DissolveNoiseStrength

		#define VALUE_MASK_POSITION				_DissolveMaskPosition
		#define VALUE_MASK_NORMAL				_DissolveMaskNormal
		#define VALUE_MASK_RADIUS				_DissolveMaskRadius
		#define VALUE_MASK_HEIGHT				_DissolveMaskHeight

		#if defined(_DISSOLVEMASKCOUNT_FOUR)
			#define VALUE_MASK_2_POSITION			_DissolveMask2Position
			#define VALUE_MASK_2_NORMAL				_DissolveMask2Normal
			#define VALUE_MASK_2_RADIUS				_DissolveMask2Radius
			#define VALUE_MASK_2_HEIGHT				_DissolveMask2Height

			#define VALUE_MASK_3_POSITION			_DissolveMask3Position
			#define VALUE_MASK_3_NORMAL				_DissolveMask3Normal
			#define VALUE_MASK_3_RADIUS				_DissolveMask3Radius
			#define VALUE_MASK_3_HEIGHT				_DissolveMask3Height

			#define VALUE_MASK_4_POSITION			_DissolveMask4Position
			#define VALUE_MASK_4_NORMAL				_DissolveMask4Normal
			#define VALUE_MASK_4_RADIUS				_DissolveMask4Radius
			#define VALUE_MASK_4_HEIGHT				_DissolveMask4Height

			#if defined(_DISSOLVEMASK_BOX)
				#define VALUE_MASK_2_BOUNDS_MIN		_DissolveMask2BoundsMin
				#define VALUE_MASK_2_BOUNDS_MAX		_DissolveMask2BoundsMax
				#define VALUE_MASK_2_TRS			_DissolveMask2TRS

				#define VALUE_MASK_3_BOUNDS_MIN		_DissolveMask3BoundsMin
				#define VALUE_MASK_3_BOUNDS_MAX		_DissolveMask3BoundsMax
				#define VALUE_MASK_3_TRS			_DissolveMask3TRS

				#define VALUE_MASK_4_BOUNDS_MIN		_DissolveMask4BoundsMin
				#define VALUE_MASK_4_BOUNDS_MAX		_DissolveMask4BoundsMax
				#define VALUE_MASK_4_TRS			_DissolveMask4TRS
			#endif
		#elif defined(_DISSOLVEMASKCOUNT_THREE)
			#define VALUE_MASK_2_POSITION			_DissolveMask2Position
			#define VALUE_MASK_2_NORMAL				_DissolveMask2Normal
			#define VALUE_MASK_2_RADIUS				_DissolveMask2Radius
			#define VALUE_MASK_2_HEIGHT				_DissolveMask2Height

			#define VALUE_MASK_3_POSITION			_DissolveMask3Position
			#define VALUE_MASK_3_NORMAL				_DissolveMask3Normal
			#define VALUE_MASK_3_RADIUS				_DissolveMask3Radius
			#define VALUE_MASK_3_HEIGHT				_DissolveMask3Height

			#if defined(_DISSOLVEMASK_BOX)
				#define VALUE_MASK_2_BOUNDS_MIN		_DissolveMask2BoundsMin
				#define VALUE_MASK_2_BOUNDS_MAX		_DissolveMask2BoundsMax
				#define VALUE_MASK_2_TRS			_DissolveMask2TRS

				#define VALUE_MASK_3_BOUNDS_MIN		_DissolveMask3BoundsMin
				#define VALUE_MASK_3_BOUNDS_MAX		_DissolveMask3BoundsMax
				#define VALUE_MASK_3_TRS			_DissolveMask3TRS
			#endif
		#elif defined(_DISSOLVEMASKCOUNT_TWO)
			#define VALUE_MASK_2_POSITION			_DissolveMask2Position
			#define VALUE_MASK_2_NORMAL				_DissolveMask2Normal
			#define VALUE_MASK_2_RADIUS				_DissolveMask2Radius
			#define VALUE_MASK_2_HEIGHT				_DissolveMask2Height

			#if defined(_DISSOLVEMASK_BOX)
				#define VALUE_MASK_2_BOUNDS_MIN		_DissolveMask2BoundsMin
				#define VALUE_MASK_2_BOUNDS_MAX		_DissolveMask2BoundsMax
				#define VALUE_MASK_2_TRS			_DissolveMask2TRS
			#endif
		#endif


		#if defined(_DISSOLVEMASK_BOX)
			#define VALUE_MASK_BOUNDS_MIN		_DissolveMaskBoundsMin
			#define VALUE_MASK_BOUNDS_MAX		_DissolveMaskBoundsMax
			#define VALUE_MASK_TRS				_DissolveMaskTRS
		#endif

		#ifdef _DISSOLVEMAPPINGTYPE_TRIPLANAR
			#define VALUE_TRIPLANARMAPPINGSPACE          _DissolveTriplanarMappingSpace
		#endif

		#define VALUE_COMBINE_WITH_MASTER_NODE_ALPHA     _DissolveCombineWithMasterNodeAlpha
		#define VALUE_COMBINE_WITH_MASTER_NODE_COLOR     _DissolveCombineWithMasterNodeColor

	#endif

	#define TIME _Time.x

	#ifdef DISSOLVE_LEGACY_MAINTEX
		#define READ_MAINTEX(uv)               tex2D(_MainTex, (uv).xy)
		#define READ_MAINTEX_LOD(uv,m)         tex2Dlod(_MainTex, float4((uv).xy, 0, m))
	#else
		#ifdef DISSOLVE_SHADER_GRAPH
			#define READ_MAINTEX(uv)			   SAMPLE_TEXTURE2D(_MainTex, sampler_MainTex, (uv).xy)
			#define READ_MAINTEX_LOD(uv,m)		   SAMPLE_TEXTURE2D_LOD(_MainTex, sampler_MainTex, (uv).xy, m)
		#else
			#define READ_MAINTEX(uv)			   SAMPLE_TEXTURE2D(_BaseMap, sampler_BaseMap, (uv).xy)
			#define READ_MAINTEX_LOD(uv,m)		   SAMPLE_TEXTURE2D_LOD(_BaseMap, sampler_BaseMap, (uv).xy, m)
		#endif
	#endif


	#ifdef DISSOLVE_LEGACY_TEXTURE_SAMPLE
		#define READ_TEXTURE_2D(t,s,uv,i)        saturate(tex2D(t, (uv).xy) + (1 - i).xxxx)
		#define READ_TEXTURE_2D_LOD(t,s,uv,m)    tex2Dlod(t, float4((uv).xy, 0, m))
	#else
		#define READ_TEXTURE_2D(t,s,uv,i)        saturate(SAMPLE_TEXTURE2D(t, s, (uv).xy) + (1 - i).xxxx)
		#define READ_TEXTURE_2D_LOD(t,s,uv,m)    SAMPLE_TEXTURE2D_LOD(t, s, (uv).xy, m)
	#endif


	inline void DissolveVertex2Fragment(float4 positionCS, float2 vertexUV0, float2 vertexUV1, inout float4 dissolveMapUV)
	{
		dissolveMapUV = 0;

		#if defined(_DISSOLVEMAPPINGTYPE_SCREEN_SPACE)
			dissolveMapUV = ComputeScreenPos(positionCS);
		#else

			#if defined(_DISSOLVEALPHASOURCE_CUSTOM_MAP) || defined(_DISSOLVEALPHASOURCE_TWO_CUSTOM_MAPS) || defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)
				float2 texUV = VALUE_UVSET == 0 ? vertexUV0 : vertexUV1;

				dissolveMapUV = float4(texUV.xy, 0, 0);
			#endif
		#endif
	}

	#if defined(_DISSOLVEMASK_BOX)
	inline bool IsPointInsideRect(float3 vertex, float3 min, float3 max)
	{
		return ((vertex.x > min.x && vertex.x < max.x) && (vertex.y > min.y && vertex.y < max.y) && (vertex.z > min.z && vertex.z < max.z));
	}

	inline float EdgeIntersection(float p1, float e1, float p2, float e2)
	{
		return saturate(e2 - p1) + saturate(e1 - p2) + (e1 * e2);
	}
	#endif

	inline float ReadMaskValue(float3 vertexPos, float noise)
	{
		float cutout = -1;
		float axiscutout = 1;


		#if defined(_ADDITIONALDISSOLVEMASK_XYZ_AXIS)
			float3 tempPos = vertexPos;

			if (VALUE_MASK_SPACE > 0.5)
				tempPos = mul(unity_WorldToObject, float4(vertexPos, 1)).xyz;

			axiscutout = (tempPos - VALUE_MASK_OFFSET)[(int)VALUE_CUTOFF_AXIS] * VALUE_ADDITIONAL_AXIS_INVERT;

			axiscutout += noise;
			cutout = 1;
		#endif

		#if defined(_DISSOLVEMASK_PLANE)

			#if defined(_DISSOLVEMASKCOUNT_FOUR)

				float d1 = dot(VALUE_MASK_NORMAL, vertexPos - VALUE_MASK_POSITION);
				float d2 = dot(VALUE_MASK_2_NORMAL, vertexPos - VALUE_MASK_2_POSITION);
				float d3 = dot(VALUE_MASK_3_NORMAL, vertexPos - VALUE_MASK_3_POSITION);
				float d4 = dot(VALUE_MASK_4_NORMAL, vertexPos - VALUE_MASK_4_POSITION);

				if (VALUE_AXIS_INVERT > 0)
				{
					cutout = min(min(d1, d2), min(d3, d4));
				}
				else
				{
					cutout = max(max(-d1, -d2), max(-d3, -d4));
				}

				cutout += noise;

			#elif defined(_DISSOLVEMASKCOUNT_THREE)

				float d1 = dot(VALUE_MASK_NORMAL, vertexPos - VALUE_MASK_POSITION);
				float d2 = dot(VALUE_MASK_2_NORMAL, vertexPos - VALUE_MASK_2_POSITION);
				float d3 = dot(VALUE_MASK_3_NORMAL, vertexPos - VALUE_MASK_3_POSITION);

				if (VALUE_AXIS_INVERT > 0)
				{
					cutout = min(min(d1, d2), d3);
				}
				else
				{
					cutout = max(max(-d1, -d2), -d3);
				}

				cutout += noise;

			#elif defined(_DISSOLVEMASKCOUNT_TWO)

				float d1 = dot(VALUE_MASK_NORMAL, vertexPos - VALUE_MASK_POSITION);
				float d2 = dot(VALUE_MASK_2_NORMAL, vertexPos - VALUE_MASK_2_POSITION);

				if (VALUE_AXIS_INVERT > 0)
				{
					cutout = min(d1, d2);
				}
				else
				{
					cutout = max(-d1, -d2);
				}

				cutout += noise;

			#else
				cutout = dot(VALUE_MASK_NORMAL * VALUE_AXIS_INVERT, vertexPos - VALUE_MASK_POSITION);

				cutout += noise;
			#endif


		#elif defined(_DISSOLVEMASK_SPHERE)

			#if defined(_DISSOLVEMASKCOUNT_FOUR)

				float4 radius = float4(VALUE_MASK_RADIUS, VALUE_MASK_2_RADIUS, VALUE_MASK_3_RADIUS, VALUE_MASK_4_RADIUS);

				float4 n = noise * (radius < 1 ? radius : 1);

				float4 d = float4(distance(vertexPos, VALUE_MASK_POSITION), distance(vertexPos, VALUE_MASK_2_POSITION), distance(vertexPos, VALUE_MASK_3_POSITION), distance(vertexPos,			VALUE_MASK_4_POSITION));

				//radius += abs(noise) * (1 - VALUE_AXIS_INVERT * 2);
				radius -= noise;


				if (VALUE_AXIS_INVERT > 0)
				{
					float4 b = radius - min(d, radius);
					cutout = dot(b, 1);
				}
				else
				{
					float4 a = saturate(max(0, d - radius));

					a.xy = a.xz*a.yw;
					cutout = a.x * a.y;
				}

			#elif defined(_DISSOLVEMASKCOUNT_THREE)

				float3 radius = float3(VALUE_MASK_RADIUS, VALUE_MASK_2_RADIUS, VALUE_MASK_3_RADIUS);

				float3 n = noise * (radius < 1 ? radius : 1);

				float3 d = float3(distance(vertexPos, VALUE_MASK_POSITION), distance(vertexPos, VALUE_MASK_2_POSITION), distance(vertexPos, VALUE_MASK_3_POSITION));

				//radius += abs(noise) * (1 - VALUE_AXIS_INVERT * 2);
				radius -= noise;


				if (VALUE_AXIS_INVERT > 0)
				{
					float3 b = radius - min(d, radius);
					cutout = dot(b, 1);
				}
				else
				{
					float3 a = saturate(max(0, d - radius));
					cutout = a.x * a.y * a.z;
				}

			#elif defined(_DISSOLVEMASKCOUNT_TWO)


				float2 radius = float2(VALUE_MASK_RADIUS, VALUE_MASK_2_RADIUS);

				float2 n = noise * (radius < 1 ? radius : 1);

				float2 d = float2(distance(vertexPos, VALUE_MASK_POSITION), distance(vertexPos, VALUE_MASK_2_POSITION));

				//radius += abs(noise) * (1 - VALUE_AXIS_INVERT * 2);
				radius -= noise;


				if (VALUE_AXIS_INVERT > 0)
				{
					float2 b = radius - min(d, radius);
					cutout = dot(b, 1);
				}
				else
				{
					float2 a = saturate(max(0, d - radius));
					cutout = a.x * a.y;
				}

			#else

				float radius = VALUE_MASK_RADIUS;

				noise *= (radius < 1 ? radius : 1);

				float d = distance(vertexPos, VALUE_MASK_POSITION);

				//radius += abs(noise) * (1 - VALUE_AXIS_INVERT * 2);
				radius -= noise;

				if (VALUE_AXIS_INVERT > 0)
				{
					cutout = radius - min(d, radius);
				}
				else
				{
					cutout = max(0, d - radius);
				}

			#endif		

		#elif defined(_DISSOLVEMASK_BOX)

			float dissolveEdgeSize = VALUE_EDGE_SIZE;
			#ifdef UNITY_PASS_META
				dissolveEdgeSize *= VALUE_GI_MULTIPLIER;
			#endif


			#if defined(_DISSOLVEMASKCOUNT_FOUR)

				//1////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				float m_1 = 0;
				float e_1 = 0;

				float3 vertexInverseTransform = mul(VALUE_MASK_TRS, float4(vertexPos, 1)).xyz;

				float3 minval = VALUE_MASK_BOUNDS_MIN + noise;
				float3 maxval = VALUE_MASK_BOUNDS_MAX - noise;

				if (IsPointInsideRect(vertexInverseTransform, minval, maxval))
				{
					m_1 = 1;
					cutout = 1;
					//Edge Detect
					if (IsPointInsideRect(vertexInverseTransform, minval + dissolveEdgeSize, maxval - dissolveEdgeSize) == false)
					{
						e_1 = 1;
					}
				}


				//2////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				float m_2 = 0;
				float e_2 = 0;

				float3 vertexInverseTransform_2 = mul(VALUE_MASK_2_TRS, float4(vertexPos, 1)).xyz;

				float3 min_2 = VALUE_MASK_2_BOUNDS_MIN + noise;
				float3 max_2 = VALUE_MASK_2_BOUNDS_MAX - noise;

				if (IsPointInsideRect(vertexInverseTransform_2, min_2, max_2))
				{
					m_2 = 1;
					cutout = 1;
					//Edge Detect
					if (IsPointInsideRect(vertexInverseTransform_2, min_2 + dissolveEdgeSize, max_2 - dissolveEdgeSize) == false)
					{
						e_2 = 1;
					}
				}


				//3////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				float m_3 = 0;
				float e_3 = 0;

				float3 vertexInverseTransform_3 = mul(VALUE_MASK_3_TRS, float4(vertexPos, 1)).xyz;

				float3 min_3 = VALUE_MASK_3_BOUNDS_MIN + noise;
				float3 max_3 = VALUE_MASK_3_BOUNDS_MAX - noise;

				if (IsPointInsideRect(vertexInverseTransform_3, min_3, max_3))
				{
					m_3 = 1;
					cutout = 1;
					//Edge Detect
					if (IsPointInsideRect(vertexInverseTransform_3, min_3 + dissolveEdgeSize, max_3 - dissolveEdgeSize) == false)
					{
						e_3 = 1;
					}
				}


				//4////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				float m_4 = 0;
				float e_4 = 0;

				float3 vertexInverseTransform_4 = mul(VALUE_MASK_4_TRS, float4(vertexPos, 1)).xyz;

				float3 min_4 = VALUE_MASK_4_BOUNDS_MIN + noise;
				float3 max_4 = VALUE_MASK_4_BOUNDS_MAX - noise;

				if (IsPointInsideRect(vertexInverseTransform_4, min_4, max_4))
				{
					m_4 = 1;
					cutout = 1;
					//Edge Detect
					if (IsPointInsideRect(vertexInverseTransform_4, min_4 + dissolveEdgeSize, max_4 - dissolveEdgeSize) == false)
					{
						e_4 = 1;
					}
				}


				float E1 = EdgeIntersection(m_1, e_1, m_2, e_2);
				float E2 = EdgeIntersection(saturate(m_1 + m_2), E1, m_3, e_3);
				float E3 = EdgeIntersection(saturate(m_1 + m_2 + m_3), E2, m_4, e_4);

				cutout = E3 > 0.5 ? dissolveEdgeSize * 0.5 * VALUE_AXIS_INVERT : cutout;


				cutout *= VALUE_AXIS_INVERT;

			#elif defined(_DISSOLVEMASKCOUNT_THREE)

				//1////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				float m_1 = 0;
				float e_1 = 0;

				float3 vertexInverseTransform = mul(VALUE_MASK_TRS, float4(vertexPos, 1)).xyz;

				float3 minval = VALUE_MASK_BOUNDS_MIN + noise;
				float3 maxval = VALUE_MASK_BOUNDS_MAX - noise;

				if (IsPointInsideRect(vertexInverseTransform, minval, maxval))
				{
					m_1 = 1;
					cutout = 1;
					//Edge Detect
					if (IsPointInsideRect(vertexInverseTransform, minval + dissolveEdgeSize, maxval - dissolveEdgeSize) == false)
					{
						e_1 = 1;
					}
				}


				//2////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				float m_2 = 0;
				float e_2 = 0;

				float3 vertexInverseTransform_2 = mul(VALUE_MASK_2_TRS, float4(vertexPos, 1)).xyz;

				float3 min_2 = VALUE_MASK_2_BOUNDS_MIN + noise;
				float3 max_2 = VALUE_MASK_2_BOUNDS_MAX - noise;

				if (IsPointInsideRect(vertexInverseTransform_2, min_2, max_2))
				{
					m_2 = 1;
					cutout = 1;
					//Edge Detect
					if (IsPointInsideRect(vertexInverseTransform_2, min_2 + dissolveEdgeSize, max_2 - dissolveEdgeSize) == false)
					{
						e_2 = 1;
					}
				}


				//3////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				float m_3 = 0;
				float e_3 = 0;

				float3 vertexInverseTransform_3 = mul(VALUE_MASK_3_TRS, float4(vertexPos, 1)).xyz;

				float3 min_3 = VALUE_MASK_3_BOUNDS_MIN + noise;
				float3 max_3 = VALUE_MASK_3_BOUNDS_MAX - noise;

				if (IsPointInsideRect(vertexInverseTransform_3, min_3, max_3))
				{
					m_3 = 1;
					cutout = 1;
					//Edge Detect
					if (IsPointInsideRect(vertexInverseTransform_3, min_3 + dissolveEdgeSize, max_3 - dissolveEdgeSize) == false)
					{
						e_3 = 1;
					}
				}


				float E1 = EdgeIntersection(m_1, e_1, m_2, e_2);
				float E2 = EdgeIntersection(saturate(m_1 + m_2), E1, m_3, e_3);

				cutout = E2 > 0.5 ? dissolveEdgeSize * 0.5 * VALUE_AXIS_INVERT : cutout;


				cutout *= VALUE_AXIS_INVERT;

			#elif defined(_DISSOLVEMASKCOUNT_TWO)

				//1////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				float m_1 = 0;
				float e_1 = 0;

				float3 vertexInverseTransform = mul(VALUE_MASK_TRS, float4(vertexPos, 1)).xyz;

				float3 minval = VALUE_MASK_BOUNDS_MIN + noise;
				float3 maxval = VALUE_MASK_BOUNDS_MAX - noise;

				if (IsPointInsideRect(vertexInverseTransform, minval, maxval))
				{
					m_1 = 1;
					cutout = 1;
					//Edge Detect
					if (IsPointInsideRect(vertexInverseTransform, minval + dissolveEdgeSize, maxval - dissolveEdgeSize) == false)
					{
						e_1 = 1;
					}
				}


				//2////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				float m_2 = 0;
				float e_2 = 0;

				float3 vertexInverseTransform_2 = mul(VALUE_MASK_2_TRS, float4(vertexPos, 1)).xyz;

				float3 min_2 = VALUE_MASK_2_BOUNDS_MIN + noise;
				float3 max_2 = VALUE_MASK_2_BOUNDS_MAX - noise;

				if (IsPointInsideRect(vertexInverseTransform_2, min_2, max_2))
				{
					m_2 = 1;
					cutout = 1;
					//Edge Detect
					if (IsPointInsideRect(vertexInverseTransform_2, min_2 + dissolveEdgeSize, max_2 - dissolveEdgeSize) == false)
					{
						e_2 = 1;
					}
				}



				float E = EdgeIntersection(m_1, e_1, m_2, e_2);
				cutout = E > 0.5 ? dissolveEdgeSize * 0.5 * VALUE_AXIS_INVERT : cutout;


				cutout *= VALUE_AXIS_INVERT;

			#else

				float3 vertexInverseTransform = mul(VALUE_MASK_TRS, float4(vertexPos, 1)).xyz;

				float3 minval = VALUE_MASK_BOUNDS_MIN + noise;
				float3 maxval = VALUE_MASK_BOUNDS_MAX - noise;


				if (IsPointInsideRect(vertexInverseTransform, minval, maxval))
				{
					cutout = 1;

					//Edge Detect
					if (!IsPointInsideRect(vertexInverseTransform, minval + dissolveEdgeSize, maxval - dissolveEdgeSize))
					{
						cutout = dissolveEdgeSize * 0.5 * VALUE_AXIS_INVERT;
					}
				}

				cutout *= VALUE_AXIS_INVERT;

			#endif

		#elif defined(_DISSOLVEMASK_CYLINDER)

			#if defined(_DISSOLVEMASKCOUNT_FOUR)

			//1
			float3 p1_1 = VALUE_MASK_POSITION;
			float3 p1_2 = p1_1 + VALUE_MASK_NORMAL * VALUE_MASK_HEIGHT;

			float t1 = max(0, min(1, dot(vertexPos - p1_1, p1_2 - p1_1) / (VALUE_MASK_HEIGHT * VALUE_MASK_HEIGHT)));
			float3 projection1 = p1_1 + t1 * (p1_2 - p1_1);

			//2
			float3 p2_1 = VALUE_MASK_2_POSITION;
			float3 p2_2 = p2_1 + VALUE_MASK_2_NORMAL * VALUE_MASK_2_HEIGHT;

			float t2 = max(0, min(1, dot(vertexPos - p2_1, p2_2 - p2_1) / (VALUE_MASK_2_HEIGHT * VALUE_MASK_2_HEIGHT)));
			float3 projection2 = p2_1 + t2 * (p2_2 - p2_1);

			//3
			float3 p3_1 = VALUE_MASK_3_POSITION;
			float3 p3_2 = p3_1 + VALUE_MASK_3_NORMAL * VALUE_MASK_3_HEIGHT;

			float t3 = max(0, min(1, dot(vertexPos - p3_1, p3_2 - p3_1) / (VALUE_MASK_3_HEIGHT * VALUE_MASK_3_HEIGHT)));
			float3 projection3 = p3_1 + t3 * (p3_2 - p3_1);

			//4
			float3 p4_1 = VALUE_MASK_4_POSITION;
			float3 p4_2 = p4_1 + VALUE_MASK_4_NORMAL * VALUE_MASK_4_HEIGHT;

			float t4 = max(0, min(1, dot(vertexPos - p4_1, p4_2 - p4_1) / (VALUE_MASK_4_HEIGHT * VALUE_MASK_4_HEIGHT)));
			float3 projection4 = p4_1 + t4 * (p4_2 - p4_1);



			float4 d = float4(distance(vertexPos, projection1), distance(vertexPos, projection2), distance(vertexPos, projection3), distance(vertexPos, projection4));

			float4 radius = float4(VALUE_MASK_RADIUS, VALUE_MASK_2_RADIUS, VALUE_MASK_3_RADIUS, VALUE_MASK_4_RADIUS);

			float4 n = noise * (radius < 1 ? radius : 1);
			radius -= n;


			if (VALUE_AXIS_INVERT > 0)
			{
				float4 b = radius - min(d, radius);
				cutout = dot(b, 1);
			}
			else
			{
				float4 a = saturate(max(0, d - radius));

				a.xy = a.xz*a.yw;
				cutout = a.x * a.y;
			}

		#elif defined(_DISSOLVEMASKCOUNT_THREE)

			//1
			float3 p1_1 = VALUE_MASK_POSITION;
			float3 p1_2 = p1_1 + VALUE_MASK_NORMAL * VALUE_MASK_HEIGHT;

			float t1 = max(0, min(1, dot(vertexPos - p1_1, p1_2 - p1_1) / (VALUE_MASK_HEIGHT * VALUE_MASK_HEIGHT)));
			float3 projection1 = p1_1 + t1 * (p1_2 - p1_1);

			//2
			float3 p2_1 = VALUE_MASK_2_POSITION;
			float3 p2_2 = p2_1 + VALUE_MASK_2_NORMAL * VALUE_MASK_2_HEIGHT;

			float t2 = max(0, min(1, dot(vertexPos - p2_1, p2_2 - p2_1) / (VALUE_MASK_2_HEIGHT * VALUE_MASK_2_HEIGHT)));
			float3 projection2 = p2_1 + t2 * (p2_2 - p2_1);

			//3
			float3 p3_1 = VALUE_MASK_3_POSITION;
			float3 p3_2 = p3_1 + VALUE_MASK_3_NORMAL * VALUE_MASK_3_HEIGHT;

			float t3 = max(0, min(1, dot(vertexPos - p3_1, p3_2 - p3_1) / (VALUE_MASK_3_HEIGHT * VALUE_MASK_3_HEIGHT)));
			float3 projection3 = p3_1 + t3 * (p3_2 - p3_1);



			float3 d = float3(distance(vertexPos, projection1), distance(vertexPos, projection2), distance(vertexPos, projection3));

			float3 radius = float3(VALUE_MASK_RADIUS, VALUE_MASK_2_RADIUS, VALUE_MASK_3_RADIUS);

			float3 n = noise * (radius < 1 ? radius : 1);
			radius -= n;


			if (VALUE_AXIS_INVERT > 0)
			{
				float3 b = radius - min(d, radius);
				cutout = dot(b, 1);
			}
			else
			{
				float3 a = saturate(max(0, d - radius));
				cutout = a.x * a.y * a.z;
			}

		#elif defined(_DISSOLVEMASKCOUNT_TWO)

			//1
			float3 p1_1 = VALUE_MASK_POSITION;
			float3 p1_2 = p1_1 + VALUE_MASK_NORMAL * VALUE_MASK_HEIGHT;

			float t1 = max(0, min(1, dot(vertexPos - p1_1, p1_2 - p1_1) / (VALUE_MASK_HEIGHT * VALUE_MASK_HEIGHT)));
			float3 projection1 = p1_1 + t1 * (p1_2 - p1_1);

			//2
			float3 p2_1 = VALUE_MASK_2_POSITION;
			float3 p2_2 = p2_1 + VALUE_MASK_2_NORMAL * VALUE_MASK_2_HEIGHT;

			float t2 = max(0, min(1, dot(vertexPos - p2_1, p2_2 - p2_1) / (VALUE_MASK_2_HEIGHT * VALUE_MASK_2_HEIGHT)));
			float3 projection2 = p2_1 + t2 * (p2_2 - p2_1);



			float2 d = float2(distance(vertexPos, projection1), distance(vertexPos, projection2));

			float2 radius = float2(VALUE_MASK_RADIUS, VALUE_MASK_2_RADIUS);

			float2 n = noise * (radius < 1 ? radius : 1);
			radius -= n;


			if (VALUE_AXIS_INVERT > 0)
			{
				float2 b = radius - min(d, radius);
				cutout = dot(b, 1);
			}
			else
			{
				float2 a = saturate(max(0, d - radius));
				cutout = a.x * a.y;
			}
		#else
			float3 p1 = VALUE_MASK_POSITION;
			float3 p2 = p1 + VALUE_MASK_NORMAL * VALUE_MASK_HEIGHT;

			float t = max(0, min(1, dot(vertexPos - p1, p2 - p1) / (VALUE_MASK_HEIGHT * VALUE_MASK_HEIGHT)));
			float3 projection = p1 + t * (p2 - p1);

			float d = distance(vertexPos, projection);


			float radius = VALUE_MASK_RADIUS;
			noise *= (radius < 1 ? radius : 1);

			//radius += abs(noise) * (1 - VALUE_AXIS_INVERT * 2);
			radius -= noise;

			if (VALUE_AXIS_INVERT > 0)
			{
				cutout = radius - min(d, radius);
			}
			else
			{
				cutout = max(0, d - radius);
			}
		#endif
	#elif defined(_DISSOLVEMASK_CONE)

		#if defined(_DISSOLVEMASKCOUNT_FOUR)

			//1
			float3 p1_1 = VALUE_MASK_POSITION;
			float3 p1_2 = p1_1 + VALUE_MASK_NORMAL * VALUE_MASK_HEIGHT;

			float t1 = max(0, min(1, dot(vertexPos - p1_1, p1_2 - p1_1) / (VALUE_MASK_HEIGHT * VALUE_MASK_HEIGHT)));
			float3 projection1 = p1_1 + t1 * (p1_2 - p1_1);

			//2
			float3 p2_1 = VALUE_MASK_2_POSITION;
			float3 p2_2 = p2_1 + VALUE_MASK_2_NORMAL * VALUE_MASK_2_HEIGHT;

			float t2 = max(0, min(1, dot(vertexPos - p2_1, p2_2 - p2_1) / (VALUE_MASK_2_HEIGHT * VALUE_MASK_2_HEIGHT)));
			float3 projection2 = p2_1 + t2 * (p2_2 - p2_1);

			//3
			float3 p3_1 = VALUE_MASK_3_POSITION;
			float3 p3_2 = p3_1 + VALUE_MASK_3_NORMAL * VALUE_MASK_3_HEIGHT;

			float t3 = max(0, min(1, dot(vertexPos - p3_1, p3_2 - p3_1) / (VALUE_MASK_3_HEIGHT * VALUE_MASK_3_HEIGHT)));
			float3 projection3 = p3_1 + t3 * (p3_2 - p3_1);

			//4
			float3 p4_1 = VALUE_MASK_4_POSITION;
			float3 p4_2 = p4_1 + VALUE_MASK_4_NORMAL * VALUE_MASK_4_HEIGHT;

			float t4 = max(0, min(1, dot(vertexPos - p4_1, p4_2 - p4_1) / (VALUE_MASK_4_HEIGHT * VALUE_MASK_4_HEIGHT)));
			float3 projection4 = p4_1 + t4 * (p4_2 - p4_1);



			float4 d = float4(distance(vertexPos, projection1), distance(vertexPos, projection2), distance(vertexPos, projection3), distance(vertexPos, projection4));


			float4 radius = lerp(0, float4(VALUE_MASK_RADIUS, VALUE_MASK_2_RADIUS, VALUE_MASK_3_RADIUS, VALUE_MASK_4_RADIUS), float4(t1, t2, t3, t4));


			float4 n = noise * (radius < 1 ? radius : 1);
			radius -= n;

			if (VALUE_AXIS_INVERT > 0)
			{
				float4 b = radius - min(d, radius);
				cutout = dot(b, 1);
			}
			else
			{
				float4 a = saturate(max(0, d - radius));

				a.xy = a.xz*a.yw;
				cutout = a.x * a.y;
			}

		#elif defined(_DISSOLVEMASKCOUNT_THREE)

			//1
			float3 p1_1 = VALUE_MASK_POSITION;
			float3 p1_2 = p1_1 + VALUE_MASK_NORMAL * VALUE_MASK_HEIGHT;

			float t1 = max(0, min(1, dot(vertexPos - p1_1, p1_2 - p1_1) / (VALUE_MASK_HEIGHT * VALUE_MASK_HEIGHT)));
			float3 projection1 = p1_1 + t1 * (p1_2 - p1_1);

			//2
			float3 p2_1 = VALUE_MASK_2_POSITION;
			float3 p2_2 = p2_1 + VALUE_MASK_2_NORMAL * VALUE_MASK_2_HEIGHT;

			float t2 = max(0, min(1, dot(vertexPos - p2_1, p2_2 - p2_1) / (VALUE_MASK_2_HEIGHT * VALUE_MASK_2_HEIGHT)));
			float3 projection2 = p2_1 + t2 * (p2_2 - p2_1);

			//3
			float3 p3_1 = VALUE_MASK_3_POSITION;
			float3 p3_2 = p3_1 + VALUE_MASK_3_NORMAL * VALUE_MASK_3_HEIGHT;

			float t3 = max(0, min(1, dot(vertexPos - p3_1, p3_2 - p3_1) / (VALUE_MASK_3_HEIGHT * VALUE_MASK_3_HEIGHT)));
			float3 projection3 = p3_1 + t3 * (p3_2 - p3_1);


			float3 d = float3(distance(vertexPos, projection1), distance(vertexPos, projection2), distance(vertexPos, projection3));


			float3 radius = lerp(0, float3(VALUE_MASK_RADIUS, VALUE_MASK_2_RADIUS, VALUE_MASK_3_RADIUS), float3(t1, t2, t3));


			float3 n = noise * (radius < 1 ? radius : 1);
			radius -= n;

			if (VALUE_AXIS_INVERT > 0)
			{
				float3 b = radius - min(d, radius);
				cutout = dot(b, 1);
			}
			else
			{
				float3 a = saturate(max(0, d - radius));
				cutout = a.x * a.y * a.z;
			}

		#elif defined(_DISSOLVEMASKCOUNT_TWO)

			//1
			float3 p1_1 = VALUE_MASK_POSITION;
			float3 p1_2 = p1_1 + VALUE_MASK_NORMAL * VALUE_MASK_HEIGHT;

			float t1 = max(0, min(1, dot(vertexPos - p1_1, p1_2 - p1_1) / (VALUE_MASK_HEIGHT * VALUE_MASK_HEIGHT)));
			float3 projection1 = p1_1 + t1 * (p1_2 - p1_1);

			//2
			float3 p2_1 = VALUE_MASK_2_POSITION;
			float3 p2_2 = p2_1 + VALUE_MASK_2_NORMAL * VALUE_MASK_2_HEIGHT;

			float t2 = max(0, min(1, dot(vertexPos - p2_1, p2_2 - p2_1) / (VALUE_MASK_2_HEIGHT * VALUE_MASK_2_HEIGHT)));
			float3 projection2 = p2_1 + t2 * (p2_2 - p2_1);


			float2 d = float2(distance(vertexPos, projection1), distance(vertexPos, projection2));


			float2 radius = lerp(0, float2(VALUE_MASK_RADIUS, VALUE_MASK_2_RADIUS), float2(t1, t2));


			float2 n = noise * (radius < 1 ? radius : 1);
			radius -= n;

			if (VALUE_AXIS_INVERT > 0)
			{
				float2 b = radius - min(d, radius);
				cutout = dot(b, 1);
			}
			else
			{
				float2 a = saturate(max(0, d - radius));
				cutout = a.x * a.y;
			}

		#else
			float3 p1 = VALUE_MASK_POSITION;
			float3 p2 = p1 + VALUE_MASK_NORMAL * VALUE_MASK_HEIGHT;

			float t = max(0, min(1, dot(vertexPos - p1, p2 - p1) / (VALUE_MASK_HEIGHT * VALUE_MASK_HEIGHT)));
			float3 projection = p1 + t * (p2 - p1);

			float d = distance(vertexPos, projection);


			float radius = lerp(0, VALUE_MASK_RADIUS, t);
			noise *= (radius < 1 ? radius : 1);

			//radius += abs(noise) * (1 - VALUE_AXIS_INVERT * 2);
			radius -= noise;

			if (VALUE_AXIS_INVERT > 0)
			{
				cutout = radius - min(d, radius);
			}
			else
			{
				cutout = max(0, d - radius);
			}
		#endif

	#endif

	cutout = min(axiscutout, cutout);
	return (cutout > 0 ? cutout : -1);
}


inline float4 ReadDissolveAlpha(float2 mainTexUV, float4 dissolveMapUV, float3 vertexPos)
{
	float4 alphaSource = 1;


	#ifdef _DISSOLVEMAPPINGTYPE_SCREEN_SPACE
		float2 screenUV = dissolveMapUV.xy / dissolveMapUV.w;
		screenUV.y *= _ScreenParams.y / _ScreenParams.x;

		#ifdef DISSOLVE_LEGACY_RENDER_PIPELIN
			screenUV *= distance(_WorldSpaceCameraPos, mul(unity_ObjectToWorld, float4(0, 0, 0, 1)).xyz) * 0.1;
		#else
			screenUV *= distance(GetCameraPositionWS(), TransformObjectToWorld(float3(0, 0, 0)).xyz) * 0.1;
		#endif
	#endif


	#if defined(_DISSOLVEALPHASOURCE_CUSTOM_MAP)

		#ifdef _DISSOLVEMAPPINGTYPE_SCREEN_SPACE
			screenUV = screenUV * VALUE_MAP1_ST.xy + VALUE_MAP1_ST.zw + VALUE_MAP1_SCROLL.xy * TIME;

			alphaSource = READ_TEXTURE_2D(VALUE_MAP1, VALUE_MAP1_SAMPLER, screenUV, VALUE_MAP1_INTENSITY);
		#else
			float2 uv1 = dissolveMapUV.xy * VALUE_MAP1_ST.xy + VALUE_MAP1_ST.zw + VALUE_MAP1_SCROLL.xy * TIME;

			alphaSource = READ_TEXTURE_2D(VALUE_MAP1, VALUE_MAP1_SAMPLER, uv1, VALUE_MAP1_INTENSITY);
		#endif

		alphaSource.a = alphaSource[VALUE_MAP1_CHANNEL];

	#elif defined(_DISSOLVEALPHASOURCE_TWO_CUSTOM_MAPS)

		#ifdef _DISSOLVEMAPPINGTYPE_SCREEN_SPACE
			float2 uv1 = screenUV * VALUE_MAP1_ST.xy + VALUE_MAP1_ST.zw + VALUE_MAP1_SCROLL.xy * TIME;
			float2 uv2 = screenUV * VALUE_MAP2_ST.xy + VALUE_MAP2_ST.zw + VALUE_MAP2_SCROLL.xy * TIME;

			float4 t1 = READ_TEXTURE_2D(VALUE_MAP1, VALUE_MAP1_SAMPLER, uv1, VALUE_MAP1_INTENSITY);
			float4 t2 = READ_TEXTURE_2D(VALUE_MAP2, VALUE_MAP2_SAMPLER, uv2, VALUE_MAP2_INTENSITY);
		#else
			float2 uv1 = dissolveMapUV.xy * VALUE_MAP1_ST.xy + VALUE_MAP1_ST.zw + VALUE_MAP1_SCROLL.xy * TIME;
			float2 uv2 = dissolveMapUV.xy * VALUE_MAP2_ST.xy + VALUE_MAP2_ST.zw + VALUE_MAP2_SCROLL.xy * TIME;

			float4 t1 = READ_TEXTURE_2D(VALUE_MAP1, VALUE_MAP1_SAMPLER, uv1, VALUE_MAP1_INTENSITY);
			float4 t2 = READ_TEXTURE_2D(VALUE_MAP2, VALUE_MAP2_SAMPLER, uv2, VALUE_MAP2_INTENSITY);
		#endif

		t1.a = t1[VALUE_MAP1_CHANNEL];
		t2.a = t2[VALUE_MAP2_CHANNEL];

		alphaSource = lerp((t1 * t2), (t1 + t2) * 0.5, VALUE_ALPHATEXTUREBLEND);

	#elif defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)

		#ifdef _DISSOLVEMAPPINGTYPE_SCREEN_SPACE
			float2 uv1 = screenUV * VALUE_MAP1_ST.xy + VALUE_MAP1_ST.zw + VALUE_MAP1_SCROLL.xy * TIME;
			float2 uv2 = screenUV * VALUE_MAP2_ST.xy + VALUE_MAP2_ST.zw + VALUE_MAP2_SCROLL.xy * TIME;
			float2 uv3 = screenUV * VALUE_MAP3_ST.xy + VALUE_MAP3_ST.zw + VALUE_MAP3_SCROLL.xy * TIME;
		#else
			float2 uv1 = dissolveMapUV.xy * VALUE_MAP1_ST.xy + VALUE_MAP1_ST.zw + VALUE_MAP1_SCROLL.xy * TIME;
			float2 uv2 = dissolveMapUV.xy * VALUE_MAP2_ST.xy + VALUE_MAP2_ST.zw + VALUE_MAP2_SCROLL.xy * TIME;
			float2 uv3 = dissolveMapUV.xy * VALUE_MAP3_ST.xy + VALUE_MAP3_ST.zw + VALUE_MAP3_SCROLL.xy * TIME;
		#endif

		float4 t1 = READ_TEXTURE_2D(VALUE_MAP1, VALUE_MAP1_SAMPLER, uv1, VALUE_MAP1_INTENSITY);
		float4 t2 = READ_TEXTURE_2D(VALUE_MAP2, VALUE_MAP2_SAMPLER, uv2, VALUE_MAP2_INTENSITY);
		float4 t3 = READ_TEXTURE_2D(VALUE_MAP3, VALUE_MAP3_SAMPLER, uv3, VALUE_MAP3_INTENSITY);

		t1.a = t1[VALUE_MAP1_CHANNEL];
		t2.a = t2[VALUE_MAP2_CHANNEL];
		t3.a = t3[VALUE_MAP3_CHANNEL];

		alphaSource = lerp((t1 * t2 * t3), (t1 + t2 + t3) / 3.0, VALUE_ALPHATEXTUREBLEND);

	#else

		#ifdef _DISSOLVEMAPPINGTYPE_SCREEN_SPACE
			alphaSource = READ_MAINTEX(screenUV * VALUE_MAIN_MAP_TILING);
		#else
			alphaSource = READ_MAINTEX(mainTexUV * VALUE_MAIN_MAP_TILING);
		#endif

	#endif



	#if defined(_ADDITIONALDISSOLVEMASK_XYZ_AXIS) || defined(_DISSOLVEMASK_PLANE) || defined(_DISSOLVEMASK_SPHERE) || defined(_DISSOLVEMASK_BOX) || defined(_DISSOLVEMASK_CYLINDER) || defined		(_DISSOLVEMASK_CONE)

		float noise = ((alphaSource.a - 0.5) * 2) * VALUE_NOISE_STRENGTH;

		alphaSource.a = ReadMaskValue(vertexPos, noise);

	#endif	

	return alphaSource;
}




#ifdef _DISSOLVEMAPPINGTYPE_TRIPLANAR
	#if defined(_DISSOLVEALPHASOURCE_CUSTOM_MAP) || defined(_DISSOLVEALPHASOURCE_TWO_CUSTOM_MAPS) || defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)
		inline float4 ReadTriplanarTextureMap1(float3 coords, float3 blend)
		{
			coords = coords * VALUE_MAP1_ST.x * 0.1 + VALUE_MAP1_SCROLL.xyz * TIME;

			float4 cx = READ_TEXTURE_2D(VALUE_MAP1, VALUE_MAP1_SAMPLER, coords.yz, VALUE_MAP1_INTENSITY);
			float4 cy = READ_TEXTURE_2D(VALUE_MAP1, VALUE_MAP1_SAMPLER, coords.xz, VALUE_MAP1_INTENSITY);
			float4 cz = READ_TEXTURE_2D(VALUE_MAP1, VALUE_MAP1_SAMPLER, coords.xy, VALUE_MAP1_INTENSITY);

			cx.a = cx[VALUE_MAP1_CHANNEL];
			cy.a = cy[VALUE_MAP1_CHANNEL];
			cz.a = cz[VALUE_MAP1_CHANNEL];

			return (cx * blend.x + cy * blend.y + cz * blend.z);
		}
	#endif

	#if defined(_DISSOLVEALPHASOURCE_TWO_CUSTOM_MAPS) || defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)
		inline float4 ReadTriplanarTextureMap2(float3 coords, float3 blend)
		{
			coords = coords * VALUE_MAP2_ST.x * 0.1 + VALUE_MAP2_SCROLL.xyz * TIME;

			float4 cx = READ_TEXTURE_2D(VALUE_MAP2, VALUE_MAP2_SAMPLER, coords.yz, VALUE_MAP2_INTENSITY);
			float4 cy = READ_TEXTURE_2D(VALUE_MAP2, VALUE_MAP2_SAMPLER, coords.xz, VALUE_MAP2_INTENSITY);
			float4 cz = READ_TEXTURE_2D(VALUE_MAP2, VALUE_MAP2_SAMPLER, coords.xy, VALUE_MAP2_INTENSITY);

			cx.a = cx[VALUE_MAP2_CHANNEL];
			cy.a = cy[VALUE_MAP2_CHANNEL];
			cz.a = cz[VALUE_MAP2_CHANNEL];

			return (cx * blend.x + cy * blend.y + cz * blend.z);
		}
	#endif

	#ifdef _DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS
		inline float4 ReadTriplanarTextureMap3(float3 coords, float3 blend)
		{
			coords = coords * VALUE_MAP3_ST.x * 0.1 + VALUE_MAP3_SCROLL.xyz * TIME;

			float4 cx = READ_TEXTURE_2D(VALUE_MAP3, VALUE_MAP3_SAMPLER, coords.yz, VALUE_MAP3_INTENSITY);
			float4 cy = READ_TEXTURE_2D(VALUE_MAP3, VALUE_MAP3_SAMPLER, coords.xz, VALUE_MAP3_INTENSITY);
			float4 cz = READ_TEXTURE_2D(VALUE_MAP3, VALUE_MAP3_SAMPLER, coords.xy, VALUE_MAP3_INTENSITY);

			cx.a = cx[VALUE_MAP3_CHANNEL];
			cy.a = cy[VALUE_MAP3_CHANNEL];
			cz.a = cz[VALUE_MAP3_CHANNEL];

			return (cx * blend.x + cy * blend.y + cz * blend.z);
		}
	#endif

	inline float4 ReadTriplanarTextureMainMap(float3 coords, float3 blend)
	{
		float4 cx = READ_MAINTEX(coords.yz);
		float4 cy = READ_MAINTEX(coords.xz);
		float4 cz = READ_MAINTEX(coords.xy);

		return (cx * blend.x + cy * blend.y + cz * blend.z);
	}

	inline float4 ReadDissolveAlpha_Triplanar(float3 positionWS, float3 normalWS)
	{
		float3 positionOS = mul(unity_WorldToObject, float4(positionWS, 1)).xyz;
		float3 normal = mul(unity_WorldToObject, float4(normalWS, 0)).xyz;

		float3 vertexPos = lerp(positionWS, positionOS, VALUE_TRIPLANARMAPPINGSPACE);
		float3 vertexNorm = lerp(normalWS, normal, VALUE_TRIPLANARMAPPINGSPACE);

		float3 blend = abs(vertexNorm);
		blend /= max(dot(blend, 1.0), 0.000001);


		float4 alphaSource = 1;
		#if defined(_DISSOLVEALPHASOURCE_CUSTOM_MAP)

			alphaSource = ReadTriplanarTextureMap1(vertexPos, blend);

		#elif defined(_DISSOLVEALPHASOURCE_TWO_CUSTOM_MAPS)

			float4 t1 = ReadTriplanarTextureMap1(vertexPos, blend);
			float4 t2 = ReadTriplanarTextureMap2(vertexPos, blend);


			alphaSource = lerp((t1 * t2), (t1 + t2) * 0.5, VALUE_ALPHATEXTUREBLEND);

		#elif defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)

			float4 t1 = ReadTriplanarTextureMap1(vertexPos, blend);
			float4 t2 = ReadTriplanarTextureMap2(vertexPos, blend);
			float4 t3 = ReadTriplanarTextureMap3(vertexPos, blend);


			alphaSource = lerp((t1 * t2 * t3), (t1 + t2 + t3) / 3.0, VALUE_ALPHATEXTUREBLEND);

		#else		

			alphaSource = ReadTriplanarTextureMainMap(vertexPos * VALUE_MAIN_MAP_TILING * 0.1, blend).a;

		#endif



		#if defined(_ADDITIONALDISSOLVEMASK_XYZ_AXIS) || defined(_DISSOLVEMASK_PLANE) || defined(_DISSOLVEMASK_SPHERE) || defined(_DISSOLVEMASK_BOX) || defined(_DISSOLVEMASK_CYLINDER) || defined		(_DISSOLVEMASK_CONE)

			float noise = ((alphaSource.a - 0.5) * 2) * VALUE_NOISE_STRENGTH;

			alphaSource.a = ReadMaskValue(vertexPos, noise);

		#endif	


		return alphaSource;
	}
#endif

inline void DoDissolveClip(float4 alpha)
{
	#if defined(_ADDITIONALDISSOLVEMASK_XYZ_AXIS) || defined(_DISSOLVEMASK_PLANE) || defined(_DISSOLVEMASK_SPHERE) || defined(_DISSOLVEMASK_BOX) || defined(_DISSOLVEMASK_CYLINDER) || defined		(_DISSOLVEMASK_CONE)
		clip(alpha.a);
	#else
		clip(alpha.a - VALUE_CUTOFF * 1.01);
	#endif
}


float DoDissolveAlbedoEmission(float4 alpha, inout float3 albedo, inout float3 emission, inout float2 uv, float3 masterNodeColor)
{
	float retValue = 0;


	float dissolveEdgeSize = VALUE_EDGE_SIZE;


	#ifdef UNITY_PASS_META
		dissolveEdgeSize *= VALUE_GI_MULTIPLIER;
	#endif


	#if defined(_ADDITIONALDISSOLVEMASK_XYZ_AXIS) || defined(_DISSOLVEMASK_PLANE) || defined(_DISSOLVEMASK_SPHERE) || defined(_DISSOLVEMASK_BOX)  || defined(_DISSOLVEMASK_CYLINDER) || defined		(_DISSOLVEMASK_CONE)
		//Do nothing
	#else

		dissolveEdgeSize *= VALUE_CUTOFF < 0.1 ? (VALUE_CUTOFF * 10) : 1;

		alpha.a -= VALUE_CUTOFF;

	#endif	



	if (dissolveEdgeSize > 0 && dissolveEdgeSize > alpha.a)
	{
		float edgeGradient = saturate(alpha.a) * (1.0 / dissolveEdgeSize);


		float invertGradient = 1 - edgeGradient;
		uv += (lerp(alpha.rg, READ_MAINTEX(uv).rg, VALUE_EDGE_DISTORTION_SOURCE) - 0.5) * VALUE_EDGE_DISTORTION * invertGradient * invertGradient;

		float4 edgeColor = VALUE_EDGE_COLOR;



		float4 edgeTexture = 1;
		#if defined(_DISSOLVEEDGETEXTURESOURCE_MAIN_MAP)
		//#if (SHADER_TARGET < 30)
		//	edgeTexture = READ_MAINTEX(uv);
		//#else
			edgeTexture = READ_MAINTEX_LOD(uv, VALUE_EDGE_TEXTURE_MIPMAP);
			//#endif				

			edgeTexture.a = saturate(edgeTexture.a + VALUE_EDGETEXTUREALPHAOFFSET);

		#elif defined(_DISSOLVEEDGETEXTURESOURCE_GRADIENT) && !defined(_DISSOLVEMASK_BOX)

			float u = lerp(edgeGradient, 1 - edgeGradient, VALUE_EDGE_TEXTURE_REVERSE) + VALUE_EDGE_TEXTURE_OFFSET;

			edgeTexture = READ_TEXTURE_2D(VALUE_EDGE_TEXTURE, VALUE_EDGE_TEXTURE_SAMPLER, float2(lerp(u, VALUE_CUTOFF, VALUE_EDGE_TEXTURE_IS_DYNAMIC), 0.5), 1);

			edgeTexture.a = saturate(edgeTexture.a + VALUE_EDGETEXTUREALPHAOFFSET);

		#elif defined(_DISSOLVEEDGETEXTURESOURCE_CUSTOM)
		//#if (SHADER_TARGET < 30)
		//	edgeTexture = READ_TEXTURE_2D(VALUE_EDGE_TEXTURE, VALUE_EDGE_TEXTURE_SAMPLER, uv, 1);
		//#else
			edgeTexture = READ_TEXTURE_2D_LOD(VALUE_EDGE_TEXTURE, VALUE_EDGE_TEXTURE_SAMPLER, uv, VALUE_EDGE_TEXTURE_MIPMAP);
			//#endif

			edgeTexture.a = saturate(edgeTexture.a + VALUE_EDGETEXTUREALPHAOFFSET);
		#endif

		edgeColor *= edgeTexture;

		#ifdef DISSOLVE_SHADER_GRAPH
			edgeColor.rgb *= lerp(1, masterNodeColor.rgb, VALUE_COMBINE_WITH_MASTER_NODE_COLOR);
		#endif

			//Box mask always has solid edge
			#if !defined(_DISSOLVEMASK_BOX)
				float3 shape;
				shape.x = 1;
				shape.y = invertGradient;
				shape.z = invertGradient * invertGradient;

				edgeColor.a *= shape[(int)VALUE_EDGE_SHAPE];
			#endif




			albedo = edgeColor.rgb;


			#ifdef UNITY_PASS_META

				#if defined(_ADDITIONALDISSOLVEMASK_XYZ_AXIS) || defined(_DISSOLVEMASK_PLANE) || defined(_DISSOLVEMASK_SPHERE) || defined(_DISSOLVEMASK_BOX)  || defined(_DISSOLVEMASK_CYLINDER) ||		defined (_DISSOLVEMASK_CONE)

				#else
					edgeColor *= VALUE_CUTOFF >= 0.99 ? 0 : 1;
				#endif

				emission = edgeColor.rgb * (1 + VALUE_EDGE_COLOR_INTENSITY) * VALUE_GI_MULTIPLIER;
			#else
				emission = edgeColor.rgb * VALUE_EDGE_COLOR_INTENSITY;
			#endif


			retValue = saturate(edgeColor.a);
		}


		#ifdef UNITY_PASS_META
			if (alpha.a <= 0)
				emission = const_zero;
		#endif


		return retValue;
	}

	#ifdef DISSOLVE_LEGACY_RENDER_PIPELIN
	half4 DoOutputForward(half4 output, half alphaFromSurface)
	{
		#if defined(_ALPHABLEND_ON) || defined(_ALPHAPREMULTIPLY_ON)
			output.a = alphaFromSurface;
		#else
			UNITY_OPAQUE_ALPHA(output.a);
		#endif

		return output;
	}
	#endif




	#define ADVANCED_DISSOLVE_DATA(coord) float4 dissolveUV : TEXCOORD##coord;

	#ifdef _DISSOLVEMAPPINGTYPE_TRIPLANAR
		#define ADVANCED_DISSOLVE_INIT_DATA(positionCS, texcoord0, texcoord1, output) output.dissolveUV = 0;
	#else
		#define ADVANCED_DISSOLVE_INIT_DATA(positionCS, texcoord0, texcoord1, output) DissolveVertex2Fragment(positionCS, texcoord0.xy, texcoord1.xy, output.dissolveUV);
	#endif

	#ifdef DISSOLVE_SHADER_GRAPH
		float4 AdvancedDissolveGetAlpha(float2 texcoord1, float2 texcoord2, float3 positionWS, float3 normalWS, float fragmentAlpha)
		{
			#ifdef _DISSOLVEMAPPINGTYPE_TRIPLANAR
				float4 dissolveAlpha = ReadDissolveAlpha_Triplanar(positionWS, normalWS);
			#else

				#ifdef _DISSOLVEMAPPINGTYPE_SCREEN_SPACE
					float4 dissolveData = ComputeScreenPos(mul(GetWorldToHClipMatrix(), float4(positionWS.xyz, 1)), _ProjectionParams.x);
				#else
					float4 dissolveData = VALUE_UVSET == 0 ? float4(texcoord1.xy, 0, 0) : float4(texcoord2.xy, 0, 0);
				#endif		

				float4 dissolveAlpha = ReadDissolveAlpha(texcoord1, dissolveData, positionWS);

			#endif


			#if defined(_ADDITIONALDISSOLVEMASK_XYZ_AXIS) || defined(_DISSOLVEMASK_PLANE) || defined(_DISSOLVEMASK_SPHERE) || defined(_DISSOLVEMASK_BOX) || defined(_DISSOLVEMASK_CYLINDER) || defined		(_DISSOLVEMASK_CONE)
				dissolveAlpha.a -= lerp(0, fragmentAlpha, VALUE_COMBINE_WITH_MASTER_NODE_ALPHA);
			#else
				dissolveAlpha.a *= lerp(1, fragmentAlpha, VALUE_COMBINE_WITH_MASTER_NODE_ALPHA);
			#endif


			return dissolveAlpha;
		}
	#else
		float4 AdvancedDissolveGetAlpha(float2 texcoord0, float3 positionWS, float3 normalWS, float4 dissolveUV)
		{
			#ifdef _DISSOLVEMAPPINGTYPE_TRIPLANAR
				return ReadDissolveAlpha_Triplanar(positionWS, normalWS);
			#else
				return ReadDissolveAlpha(texcoord0, dissolveUV, positionWS);
			#endif
		}
	#endif

	struct DissolveStruct
	{
		float3 albedo;
		float3 emission;
		float blend;
	};

	DissolveStruct DissolveClip(float2 uv, float4 screenUV, float3 positionWS, float3 N)
	{
		DissolveStruct result = (DissolveStruct)0;
		float4 dissolveUV = 0;

		#if defined(_DISSOLVEMAPPINGTYPE_SCREEN_SPACE)
			dissolveUV = screenUV;
		#else
			#if defined(_DISSOLVEALPHASOURCE_CUSTOM_MAP) || defined(_DISSOLVEALPHASOURCE_TWO_CUSTOM_MAPS) || defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)
				dissolveUV = float4(uv, 0, 0);
			#endif
		#endif

		float2 time_uv = uv;
		time_uv.x = frac(time_uv.x + _Time.r);
		//dissolveUV.x = (dissolveUV.x + _Time.r);

		float4 alpha = AdvancedDissolveGetAlpha(time_uv, positionWS, N, dissolveUV);

		DoDissolveClip(alpha);

		result.blend = DoDissolveAlbedoEmission(alpha, result.albedo, result.emission, time_uv, 0);

		return result;
	}

	DissolveStruct DissolveClip(float4 uv, float4 screenUV, float3 positionWS, float3 N)
	{
		DissolveStruct result = (DissolveStruct)0;
		float4 dissolveUV = 0;

		#if defined(_DISSOLVEMAPPINGTYPE_SCREEN_SPACE)
			dissolveUV = screenUV;
		#else
			#if defined(_DISSOLVEALPHASOURCE_CUSTOM_MAP) || defined(_DISSOLVEALPHASOURCE_TWO_CUSTOM_MAPS) || defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)
				float2 texUV = VALUE_UVSET == 0 ? uv.xy : uv.wz;
				dissolveUV = float4(texUV.xy, 0, 0);
			#endif
		#endif

		float2 time_uv = uv;
		time_uv.x = frac(time_uv.x + _Time.r);
		//dissolveUV.x = (dissolveUV.x + _Time.r);

		float4 alpha = AdvancedDissolveGetAlpha(time_uv, positionWS, N, dissolveUV);

		DoDissolveClip(alpha);

		result.blend = DoDissolveAlbedoEmission(alpha, result.albedo, result.emission, time_uv, 0);

		return result;
	}
			//#endif

			/*ase_pragma*/
			struct appdata {
				float4 vertex : POSITION;
				float4 tangent : TANGENT;
				float3 normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				/*ase_vdata:p=p;t=t;n=n;uv1=tc1.xyzw;uv2=tc2.xyzw*/
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
			
			struct v2f {
				#if UNITY_VERSION >= 201810
					UNITY_POSITION(pos);
				#else
					float4 pos : SV_POSITION;
				#endif
				#if defined(LIGHTMAP_ON) || (!defined(LIGHTMAP_ON) && SHADER_TARGET >= 30)
					float4 lmap : TEXCOORD0;
				#endif
				#if !defined(LIGHTMAP_ON) && UNITY_SHOULD_SAMPLE_SH
					half3 sh : TEXCOORD1;
				#endif
				#if defined(UNITY_HALF_PRECISION_FRAGMENT_SHADER_REGISTERS) && UNITY_VERSION >= 201810 && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					UNITY_LIGHTING_COORDS(2,3)
				#elif defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if UNITY_VERSION >= 201710
						UNITY_SHADOW_COORDS(2)
					#else
						SHADOW_COORDS(2)
					#endif
				#endif
				#ifdef ASE_FOG
					UNITY_FOG_COORDS(4)
				#endif
				float4 tSpace0 : TEXCOORD5;
				float4 tSpace1 : TEXCOORD6;
				float4 tSpace2 : TEXCOORD7;
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
				float4 screenPos : TEXCOORD8;
				#endif
				/*ase_interp(9,):sp=sp.xyzw;sc=tc2;wn.xyz=tc5.xyz;wt.xyz=tc6.xyz;wbt.xyz=tc7.xyz;wp.x=tc5.w;wp.y=tc6.w;wp.z=tc7.w;spu=tc8*/
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			/*ase_globals*/
	
			/*ase_funcs*/

			v2f VertexFunction (appdata v /*ase_vert_input*/ ) {
				UNITY_SETUP_INSTANCE_ID(v);
				v2f o;
				UNITY_INITIALIZE_OUTPUT(v2f,o);
				UNITY_TRANSFER_INSTANCE_ID(v,o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				/*ase_vert_code:v=appdata;o=v2f*/
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = /*ase_vert_out:Vertex Offset;Float3;15;-1;_Vertex*/defaultVertexValue/*end*/;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif
				v.vertex.w = 1;
				v.normal = /*ase_vert_out:Vertex Normal;Float3;16;-1;_VertexNormal*/v.normal/*end*/;
				v.tangent = /*ase_vert_out:Vertex Tangent;Float4;17;-1;_VertexTangent*/v.tangent/*end*/;

				o.pos = UnityObjectToClipPos(v.vertex);
				float3 worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
				fixed3 worldNormal = UnityObjectToWorldNormal(v.normal);
				fixed3 worldTangent = UnityObjectToWorldDir(v.tangent.xyz);
				fixed tangentSign = v.tangent.w * unity_WorldTransformParams.w;
				fixed3 worldBinormal = cross(worldNormal, worldTangent) * tangentSign;
				o.tSpace0 = float4(worldTangent.x, worldBinormal.x, worldNormal.x, worldPos.x);
				o.tSpace1 = float4(worldTangent.y, worldBinormal.y, worldNormal.y, worldPos.y);
				o.tSpace2 = float4(worldTangent.z, worldBinormal.z, worldNormal.z, worldPos.z);

				#ifdef DYNAMICLIGHTMAP_ON
				o.lmap.zw = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
				#endif
				#ifdef LIGHTMAP_ON
				o.lmap.xy = v.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
				#endif

				#ifndef LIGHTMAP_ON
					#if UNITY_SHOULD_SAMPLE_SH && !UNITY_SAMPLE_FULL_SH_PER_PIXEL
						o.sh = 0;
						#ifdef VERTEXLIGHT_ON
						o.sh += Shade4PointLights (
							unity_4LightPosX0, unity_4LightPosY0, unity_4LightPosZ0,
							unity_LightColor[0].rgb, unity_LightColor[1].rgb, unity_LightColor[2].rgb, unity_LightColor[3].rgb,
							unity_4LightAtten0, worldPos, worldNormal);
						#endif
						o.sh = ShadeSHPerVertex (worldNormal, o.sh);
					#endif
				#endif

				#if UNITY_VERSION >= 201810 && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					UNITY_TRANSFER_LIGHTING(o, v.texcoord1.xy);
				#elif defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if UNITY_VERSION >= 201710
						UNITY_TRANSFER_SHADOW(o, v.texcoord1.xy);
					#else
						TRANSFER_SHADOW(o);
					#endif
				#endif

				#ifdef ASE_FOG
					UNITY_TRANSFER_FOG(o,o.pos);
				#endif
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
					o.screenPos = ComputeScreenPos(o.pos);
				#endif
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float4 tangent : TANGENT;
				float3 normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				/*ase_vcontrol*/
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( appdata v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.tangent = v.tangent;
				o.normal = v.normal;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				/*ase_control_code:v=appdata;o=VertexControl*/
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = /*ase_inline_begin*/_TessValue/*ase_inline_end*/; float tessMin = /*ase_inline_begin*/_TessMin/*ase_inline_end*/; float tessMax = /*ase_inline_begin*/_TessMax/*ase_inline_end*/;
				float edgeLength = /*ase_inline_begin*/_TessEdgeLength/*ase_inline_end*/; float tessMaxDisp = /*ase_inline_begin*/_TessMaxDisp/*ase_inline_end*/;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, UNITY_MATRIX_M, _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, UNITY_MATRIX_M, _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, UNITY_MATRIX_M, _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			v2f DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				appdata o = (appdata) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.tangent = patch[0].tangent * bary.x + patch[1].tangent * bary.y + patch[2].tangent * bary.z;
				o.normal = patch[0].normal * bary.x + patch[1].normal * bary.y + patch[2].normal * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				/*ase_domain_code:patch=VertexControl;o=appdata;bary=SV_DomainLocation*/
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].normal * (dot(o.vertex.xyz, patch[i].normal) - dot(patch[i].vertex.xyz, patch[i].normal));
				float phongStrength = /*ase_inline_begin*/_TessPhongStrength/*ase_inline_end*/;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			v2f vert ( appdata v )
			{
				return VertexFunction( v );
			}
			#endif
			
			fixed4 frag (v2f IN /*ase_frag_input*/
				#ifdef _DEPTHOFFSET_ON
				, out float outputDepth : SV_Depth
				#endif
				) : SV_Target 
			{
				UNITY_SETUP_INSTANCE_ID(IN);

				#ifdef LOD_FADE_CROSSFADE
					UNITY_APPLY_DITHER_CROSSFADE(IN.pos.xy);
				#endif

				#if defined(_SPECULAR_SETUP)
					SurfaceOutputStandardSpecular o = (SurfaceOutputStandardSpecular)0;
				#else
					SurfaceOutputStandard o = (SurfaceOutputStandard)0;
				#endif
				/*ase_local_var:wt*/float3 WorldTangent = float3(IN.tSpace0.x,IN.tSpace1.x,IN.tSpace2.x);
				/*ase_local_var:wbt*/float3 WorldBiTangent = float3(IN.tSpace0.y,IN.tSpace1.y,IN.tSpace2.y);
				/*ase_local_var:wn*/float3 WorldNormal = float3(IN.tSpace0.z,IN.tSpace1.z,IN.tSpace2.z);
				/*ase_local_var:wp*/float3 worldPos = float3(IN.tSpace0.w,IN.tSpace1.w,IN.tSpace2.w);
				/*ase_local_var:wvd*/float3 worldViewDir = normalize(UnityWorldSpaceViewDir(worldPos));
				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					UNITY_LIGHT_ATTENUATION(atten, IN, worldPos)
				#else
					/*ase_local_var:sc*/half atten = 1;
				#endif
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
				/*ase_local_var:spu*/float4 ScreenPos = IN.screenPos;
				#endif

				/*ase_frag_code:IN=v2f*/
				o.Albedo = /*ase_frag_out:Albedo;Float3;0;-1;_Albedo*/fixed3( 0.5, 0.5, 0.5 )/*end*/;
				o.Normal = /*ase_frag_out:Normal;Float3;1;-1;_Normal*/fixed3( 0, 0, 1 )/*end*/;
				o.Emission = /*ase_frag_out:Emission;Float3;2;-1;_Emission*/half3( 0, 0, 0 )/*end*/;
				#if defined(_SPECULAR_SETUP)
					o.Specular = /*ase_frag_out:Specular;Float3;3;-1;_Specular*/fixed3( 0, 0, 0 )/*end*/;
				#else
					o.Metallic = /*ase_frag_out:Metallic;Float;4;-1;_Metallic*/0/*end*/;
				#endif
				o.Smoothness = /*ase_frag_out:Smoothness;Float;5;-1;_Smoothness*/0/*end*/;
				o.Occlusion = /*ase_frag_out:Occlusion;Float;6;-1;_Occlusion*/1/*end*/;
				o.Alpha = /*ase_frag_out:Alpha;Float;7;-1;_Alpha*/1/*end*/;
				float AlphaClipThreshold = /*ase_frag_out:Alpha Clip Threshold;Float;8;-1;_AlphaClip*/0.5/*end*/;
				float AlphaClipThresholdShadow = /*ase_frag_out:Alpha Clip Threshold Shadow;Float;9;-1;_AlphaClipShadow*/0.5/*end*/;
				float3 BakedGI = /*ase_frag_out:Baked GI;Float3;10;-1;_BakedGI*/0/*end*/;
				float3 RefractionColor = /*ase_frag_out:Refraction Color;Float3;11;-1;_RefractionColor*/1/*end*/;
				float RefractionIndex = /*ase_frag_out:Refraction Index;Float;12;-1;_RefractionIndex*/1/*end*/;
				float3 Transmission = /*ase_frag_out:Transmission;Float3;13;-1;_Transmission*/1/*end*/;
				float3 Translucency = /*ase_frag_out:Translucency;Float3;14;-1;_Translucency*/1/*end*/;				

				#ifdef _ALPHATEST_ON
					clip( o.Alpha - AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
					outputDepth = IN.pos.z;
				#endif

				#ifndef USING_DIRECTIONAL_LIGHT
					fixed3 lightDir = normalize(UnityWorldSpaceLightDir(worldPos));
				#else
					fixed3 lightDir = _WorldSpaceLightPos0.xyz;
				#endif

				fixed4 c = 0;
				float3 worldN;
				worldN.x = dot(IN.tSpace0.xyz, o.Normal);
				worldN.y = dot(IN.tSpace1.xyz, o.Normal);
				worldN.z = dot(IN.tSpace2.xyz, o.Normal);
				worldN = normalize(worldN);
				o.Normal = worldN;

				DissolveStruct dissolve = DissolveClip(/*ase_frag_out:Texcoord;Float4;18;-1;_Texcoord*/fixed4(0,0,0,0)/*end*/, float4(0,0,0,0), worldPos, worldN);

				UnityGI gi;
				UNITY_INITIALIZE_OUTPUT(UnityGI, gi);
				gi.indirect.diffuse = 0;
				gi.indirect.specular = 0;
				gi.light.color = _LightColor0.rgb;
				gi.light.dir = lightDir;

				UnityGIInput giInput;
				UNITY_INITIALIZE_OUTPUT(UnityGIInput, giInput);
				giInput.light = gi.light;
				giInput.worldPos = worldPos;
				giInput.worldViewDir = worldViewDir;
				giInput.atten = atten;
				#if defined(LIGHTMAP_ON) || defined(DYNAMICLIGHTMAP_ON)
					giInput.lightmapUV = IN.lmap;
				#else
					giInput.lightmapUV = 0.0;
				#endif
				#if UNITY_SHOULD_SAMPLE_SH && !UNITY_SAMPLE_FULL_SH_PER_PIXEL
					giInput.ambient = IN.sh;
				#else
					giInput.ambient.rgb = 0.0;
				#endif
				giInput.probeHDR[0] = unity_SpecCube0_HDR;
				giInput.probeHDR[1] = unity_SpecCube1_HDR;
				#if defined(UNITY_SPECCUBE_BLENDING) || defined(UNITY_SPECCUBE_BOX_PROJECTION)
					giInput.boxMin[0] = unity_SpecCube0_BoxMin;
				#endif
				#ifdef UNITY_SPECCUBE_BOX_PROJECTION
					giInput.boxMax[0] = unity_SpecCube0_BoxMax;
					giInput.probePosition[0] = unity_SpecCube0_ProbePosition;
					giInput.boxMax[1] = unity_SpecCube1_BoxMax;
					giInput.boxMin[1] = unity_SpecCube1_BoxMin;
					giInput.probePosition[1] = unity_SpecCube1_ProbePosition;
				#endif
				
				#if defined(_SPECULAR_SETUP)
					LightingStandardSpecular_GI(o, giInput, gi);
				#else
					LightingStandard_GI( o, giInput, gi );
				#endif

				#ifdef ASE_BAKEDGI
					gi.indirect.diffuse = BakedGI;
				#endif

				#if UNITY_SHOULD_SAMPLE_SH && !defined(LIGHTMAP_ON) && defined(ASE_NO_AMBIENT)
					gi.indirect.diffuse = 0;
				#endif

				#if defined(_SPECULAR_SETUP)
					c += LightingStandardSpecular (o, worldViewDir, gi);
				#else
					c += LightingStandard( o, worldViewDir, gi );
				#endif
				
				#ifdef _TRANSMISSION_ASE
				{
					float shadow = /*ase_inline_begin*/_TransmissionShadow/*ase_inline_end*/;
					#ifdef DIRECTIONAL
						float3 lightAtten = lerp( _LightColor0.rgb, gi.light.color, shadow );
					#else
						float3 lightAtten = gi.light.color;
					#endif
					half3 transmission = max(0 , -dot(o.Normal, gi.light.dir)) * lightAtten * Transmission;
					c.rgb += o.Albedo * transmission;
				}
				#endif

				#ifdef _TRANSLUCENCY_ASE
				{
					float shadow = /*ase_inline_begin*/_TransShadow/*ase_inline_end*/;
					float normal = /*ase_inline_begin*/_TransNormal/*ase_inline_end*/;
					float scattering = /*ase_inline_begin*/_TransScattering/*ase_inline_end*/;
					float direct = /*ase_inline_begin*/_TransDirect/*ase_inline_end*/;
					float ambient = /*ase_inline_begin*/_TransAmbient/*ase_inline_end*/;
					float strength = /*ase_inline_begin*/_TransStrength/*ase_inline_end*/;

					#ifdef DIRECTIONAL
						float3 lightAtten = lerp( _LightColor0.rgb, gi.light.color, shadow );
					#else
						float3 lightAtten = gi.light.color;
					#endif
					half3 lightDir = gi.light.dir + o.Normal * normal;
					half transVdotL = pow( saturate( dot( worldViewDir, -lightDir ) ), scattering );
					half3 translucency = lightAtten * (transVdotL * direct + gi.indirect.diffuse * ambient) * Translucency;
					c.rgb += o.Albedo * translucency * strength;
				}
				#endif

				//#ifdef _REFRACTION_ASE
				//	float4 projScreenPos = ScreenPos / ScreenPos.w;
				//	float3 refractionOffset = ( RefractionIndex - 1.0 ) * mul( UNITY_MATRIX_V, WorldNormal ).xyz * ( 1.0 - dot( WorldNormal, WorldViewDirection ) );
				//	projScreenPos.xy += refractionOffset.xy;
				//	float3 refraction = UNITY_SAMPLE_SCREENSPACE_TEXTURE( _GrabTexture, projScreenPos ) * RefractionColor;
				//	color.rgb = lerp( refraction, color.rgb, color.a );
				//	color.a = 1;
				//#endif

				c.rgb += o.Emission;

				c.rgb = lerp(c.rgb, dissolve.albedo, dissolve.blend);
				c.rgb += lerp(float3(0, 0, 0), dissolve.emission, dissolve.blend);

				#ifdef ASE_FOG
					UNITY_APPLY_FOG(IN.fogCoord, c);
				#endif
				return c;
			}
			ENDCG
		}

		/*ase_pass*/
		Pass
		{
			/*ase_hide_pass*/
			Name "ForwardAdd"
			Tags { "LightMode"="ForwardAdd" }
			ZWrite Off
			Blend One One

			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma skip_variants INSTANCING_ON
			#pragma multi_compile_fwdadd_fullshadows
			#ifndef UNITY_PASS_FORWARDADD
				#define UNITY_PASS_FORWARDADD
			#endif
			#include "HLSLSupport.cginc"
			#if !defined( UNITY_INSTANCED_LOD_FADE )
				#define UNITY_INSTANCED_LOD_FADE
			#endif
			#if !defined( UNITY_INSTANCED_SH )
				#define UNITY_INSTANCED_SH
			#endif
			#if !defined( UNITY_INSTANCED_LIGHTMAPSTS )
				#define UNITY_INSTANCED_LIGHTMAPSTS
			#endif
			#include "UnityShaderVariables.cginc"
			#include "UnityCG.cginc"
			#include "Lighting.cginc"
			#include "UnityPBSLighting.cginc"
			#include "AutoLight.cginc"

			#pragma shader_feature_local _ _DISSOLVEGLOBALCONTROL_MASK_ONLY _DISSOLVEGLOBALCONTROL_MASK_AND_EDGE _DISSOLVEGLOBALCONTROL_ALL
			#pragma shader_feature_local _ _DISSOLVEMAPPINGTYPE_TRIPLANAR _DISSOLVEMAPPINGTYPE_SCREEN_SPACE
			#pragma shader_feature_local _ _DISSOLVEALPHASOURCE_CUSTOM_MAP _DISSOLVEALPHASOURCE_TWO_CUSTOM_MAPS _DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS
			#pragma multi_compile_local _  _ADDITIONALDISSOLVEMASK_XYZ_AXIS
			#pragma multi_compile_local _  _DISSOLVEMASK_PLANE _DISSOLVEMASK_BOX _DISSOLVEMASK_CONE
			#pragma shader_feature_local _ _DISSOLVEEDGETEXTURESOURCE_GRADIENT _DISSOLVEEDGETEXTURESOURCE_MAIN_MAP _DISSOLVEEDGETEXTURESOURCE_CUSTOM
			#pragma shader_feature_local _ _DISSOLVEMASKCOUNT_TWO _DISSOLVEMASKCOUNT_THREE _DISSOLVEMASKCOUNT_FOUR

			#define DISSOLVE_LEGACY_RENDER_PIPELIN
			#define DISSOLVE_LEGACY_MAINTEX
			#define DISSOLVE_LEGACY_TEXTURE_SAMPLE

		#ifdef DISSOLVE_LEGACY_TEXTURE_SAMPLE
			#define DECLARE_TEXTURE_2D(t) sampler2D t; uniform sampler2D t##_Global;
		#else
			#define DECLARE_TEXTURE_2D(t) TEXTURE2D(t); SAMPLER(sampler##t); uniform TEXTURE2D(t##_Global); SAMPLER(sampler##t##_Global);
		#endif


		float _DissolveCutoff;						uniform float _DissolveCutoff_Global;


		float _AdditionalDissolveMaskInvert;		uniform float _AdditionalDissolveMaskInvert_Global;
		float _DissolveMaskAxis;					uniform float _DissolveMaskAxis_Global;
		float _DissolveMaskSpace;					uniform float _DissolveMaskSpace_Global;
		float _DissolveMaskOffset;					uniform float _DissolveMaskOffset_Global;
		float _DissolveMaskInvert;					uniform float _DissolveMaskInvert_Global;

		float _DissolveEdgeWidth;					uniform float _DissolveEdgeWidth_Global;
		float4 _DissolveEdgeColor;					uniform float4 _DissolveEdgeColor_Global;
		float _DissolveGIMultiplier;				uniform float _DissolveGIMultiplier_Global;
		float _DissolveEdgeColorIntensity;			uniform float _DissolveEdgeColorIntensity_Global;
		float _DissolveEdgeShape;			        uniform float _DissolveEdgeShape_Global;

		float _DissolveEdgeDistortionSource;		uniform float _DissolveEdgeDistortionSource_Global;
		float _DissolveEdgeDistortionStrength;		uniform float _DissolveEdgeDistortionStrength_Global;

		float _DissolveMainMapTiling;				uniform float _DissolveMainMapTiling_Global;

		float _DissolveCombineWithMasterNodeAlpha;    uniform float _DissolveCombineWithMasterNodeAlpha_Global;
		float _DissolveCombineWithMasterNodeColor;    uniform float _DissolveCombineWithMasterNodeColor_Global;

		#if defined(_DISSOLVEEDGETEXTURESOURCE_GRADIENT) || defined(_DISSOLVEEDGETEXTURESOURCE_MAIN_MAP) || defined(_DISSOLVEEDGETEXTURESOURCE_CUSTOM)
			DECLARE_TEXTURE_2D(_DissolveEdgeTexture)

			float _DissolveEdgeTextureReverse;												uniform float _DissolveEdgeTextureReverse_Global;
			float _DissolveEdgeTexturePhaseOffset;											uniform float _DissolveEdgeTexturePhaseOffset_Global;
			float _DissolveEdgeTextureAlphaOffset;											uniform float _DissolveEdgeTextureAlphaOffset_Global;

			#if defined(_DISSOLVEEDGETEXTURESOURCE_GRADIENT)
				float _DissolveEdgeTextureIsDynamic;		uniform float _DissolveEdgeTextureIsDynamic_Global;
			#else
				float _DissolveEdgeTextureMipmap;           uniform float _DissolveEdgeTextureMipmap_Global;
			#endif
		#endif


		#if defined(_DISSOLVEALPHASOURCE_CUSTOM_MAP) || defined(_DISSOLVEALPHASOURCE_TWO_CUSTOM_MAPS) || defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)
			DECLARE_TEXTURE_2D(_DissolveMap1)

			float4 _DissolveMap1_ST;											uniform float4 _DissolveMap1_ST_Global;
			float3 _DissolveMap1_Scroll;										uniform float3 _DissolveMap1_Scroll_Global;
			float  _DissolveMap1Intensity;										uniform float  _DissolveMap1Intensity_Global;
			int    _DissolveMap1Channel;					                    uniform int    _DissolveMap1Channel_Global;
		#endif

		#if defined(_DISSOLVEALPHASOURCE_TWO_CUSTOM_MAPS) || defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)
			DECLARE_TEXTURE_2D(_DissolveMap2)

			float4 _DissolveMap2_ST;											uniform float4 _DissolveMap2_ST_Global;
			float3 _DissolveMap2_Scroll;										uniform float3 _DissolveMap2_Scroll_Global;
			float  _DissolveMap2Intensity;										uniform float  _DissolveMap2Intensity_Global;
			int    _DissolveMap2Channel;					                    uniform int    _DissolveMap2Channel_Global;
		#endif

		#if defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)
			DECLARE_TEXTURE_2D(_DissolveMap3)

			float4 _DissolveMap3_ST;											uniform float4 _DissolveMap3_ST_Global;
			float3 _DissolveMap3_Scroll;										uniform float3 _DissolveMap3_Scroll_Global;
			float  _DissolveMap3Intensity;										uniform float  _DissolveMap3Intensity_Global;
			int    _DissolveMap3Channel;					                    uniform int    _DissolveMap3Channel_Global;
		#endif  


		float _DissolveSourceAlphaTexturesBlend;		uniform float _DissolveSourceAlphaTexturesBlend_Global;
		float _DissolveAlphaSourceTexturesUVSet;		uniform float _DissolveAlphaSourceTexturesUVSet_Global;
		float _DissolveNoiseStrength;					uniform float _DissolveNoiseStrength_Global;

		float3 _DissolveMaskPosition;					uniform float3 _DissolveMaskPosition_Global;
		float3 _DissolveMaskNormal;						uniform float3 _DissolveMaskNormal_Global;
		float _DissolveMaskRadius;						uniform float  _DissolveMaskRadius_Global;
		float _DissolveMaskHeight;						uniform float _DissolveMaskHeight_Global;

		#if defined(_DISSOLVEMASKCOUNT_FOUR)

			float3 _DissolveMask2Position;				uniform float3 _DissolveMask2Position_Global;
			float3 _DissolveMask2Normal;				uniform float3 _DissolveMask2Normal_Global;
			float _DissolveMask2Radius;					uniform float  _DissolveMask2Radius_Global;
			float _DissolveMask2Height;					uniform float _DissolveMask2Height_Global;

			float3 _DissolveMask3Position;				uniform float3 _DissolveMask3Position_Global;
			float3 _DissolveMask3Normal;				uniform float3 _DissolveMask3Normal_Global;
			float _DissolveMask3Radius;					uniform float  _DissolveMask3Radius_Global;
			float _DissolveMask3Height;					uniform float _DissolveMask3Height_Global;

			float3 _DissolveMask4Position;				uniform float3 _DissolveMask4Position_Global;
			float3 _DissolveMask4Normal;				uniform float3 _DissolveMask4Normal_Global;
			float _DissolveMask4Radius;					uniform float  _DissolveMask4Radius_Global;
			float _DissolveMask4Height;					uniform float _DissolveMask4Height_Global;

			#if defined(_DISSOLVEMASK_BOX)
				float3 _DissolveMask2BoundsMin;			uniform float3 _DissolveMask2BoundsMin_Global;
				float3 _DissolveMask2BoundsMax;			uniform float3 _DissolveMask2BoundsMax_Global;
				float4x4 _DissolveMask2TRS;				uniform float4x4 _DissolveMask2TRS_Global;

				float3 _DissolveMask3BoundsMin;			uniform float3 _DissolveMask3BoundsMin_Global;
				float3 _DissolveMask3BoundsMax;			uniform float3 _DissolveMask3BoundsMax_Global;
				float4x4 _DissolveMask3TRS;				uniform float4x4 _DissolveMask3TRS_Global;

				float3 _DissolveMask4BoundsMin;			uniform float3 _DissolveMask4BoundsMin_Global;
				float3 _DissolveMask4BoundsMax;			uniform float3 _DissolveMask4BoundsMax_Global;
				float4x4 _DissolveMask4TRS;				uniform float4x4 _DissolveMask4TRS_Global;
			#endif

		#elif defined(_DISSOLVEMASKCOUNT_THREE)

			float3 _DissolveMask2Position;				uniform float3 _DissolveMask2Position_Global;
			float3 _DissolveMask2Normal;				uniform float3 _DissolveMask2Normal_Global;
			float _DissolveMask2Radius;					uniform float  _DissolveMask2Radius_Global;
			float _DissolveMask2Height;					uniform float _DissolveMask2Height_Global;

			float3 _DissolveMask3Position;				uniform float3 _DissolveMask3Position_Global;
			float3 _DissolveMask3Normal;				uniform float3 _DissolveMask3Normal_Global;
			float _DissolveMask3Radius;					uniform float  _DissolveMask3Radius_Global;
			float _DissolveMask3Height;					uniform float _DissolveMask3Height_Global;

			#if defined(_DISSOLVEMASK_BOX)
				float3 _DissolveMask2BoundsMin;			uniform float3 _DissolveMask2BoundsMin_Global;
				float3 _DissolveMask2BoundsMax;			uniform float3 _DissolveMask2BoundsMax_Global;
				float4x4 _DissolveMask2TRS;				uniform float4x4 _DissolveMask2TRS_Global;

				float3 _DissolveMask3BoundsMin;			uniform float3 _DissolveMask3BoundsMin_Global;
				float3 _DissolveMask3BoundsMax;			uniform float3 _DissolveMask3BoundsMax_Global;
				float4x4 _DissolveMask3TRS;				uniform float4x4 _DissolveMask3TRS_Global;
			#endif

		#elif defined(_DISSOLVEMASKCOUNT_TWO)

			float3 _DissolveMask2Position;				uniform float3 _DissolveMask2Position_Global;
			float3 _DissolveMask2Normal;				uniform float3 _DissolveMask2Normal_Global;
			float _DissolveMask2Radius;					uniform float  _DissolveMask2Radius_Global;
			float _DissolveMask2Height;					uniform float _DissolveMask2Height_Global;

			#if defined(_DISSOLVEMASK_BOX)
				float3 _DissolveMask2BoundsMin;			uniform float3 _DissolveMask2BoundsMin_Global;
				float3 _DissolveMask2BoundsMax;			uniform float3 _DissolveMask2BoundsMax_Global;
				float4x4 _DissolveMask2TRS;				uniform float4x4 _DissolveMask2TRS_Global;
			#endif

		#endif


		#if defined(_DISSOLVEMASK_BOX)
			float3 _DissolveMaskBoundsMin;				float3 _DissolveMaskBoundsMin_Global;
			float3 _DissolveMaskBoundsMax;				float3 _DissolveMaskBoundsMax_Global;
			float4x4 _DissolveMaskTRS;					float4x4 _DissolveMaskTRS_Global;
		#endif


		#ifdef _DISSOLVEMAPPINGTYPE_TRIPLANAR	
			float _DissolveTriplanarMappingSpace;		uniform float _DissolveTriplanarMappingSpace_Global;
		#endif


		float3 _Dissolve_ObjectWorldPos;

		const float3 const_zero = float3(0, 0, 0);


		#if defined(_DISSOLVEGLOBALCONTROL_MASK_ONLY)

		//Globals-----------------------------------------------------------------------
		#define VALUE_CUTOFF					_DissolveCutoff_Global

		#define VALUE_CUTOFF_AXIS				_DissolveMaskAxis_Global
		#define VALUE_MASK_SPACE				_DissolveMaskSpace_Global
		#define VALUE_MASK_OFFSET				_DissolveMaskOffset_Global
		#define VALUE_AXIS_INVERT				_DissolveMaskInvert_Global
		#define VALUE_ADDITIONAL_AXIS_INVERT	_AdditionalDissolveMaskInvert_Global

		#define VALUE_MASK_POSITION				_DissolveMaskPosition_Global
		#define VALUE_MASK_NORMAL			    _DissolveMaskNormal_Global
		#define VALUE_MASK_RADIUS		        _DissolveMaskRadius_Global
		#define VALUE_MASK_HEIGHT				_DissolveMaskHeight_Global

		#if defined(_DISSOLVEMASKCOUNT_FOUR)
			#define VALUE_MASK_2_POSITION			_DissolveMask2Position_Global
			#define VALUE_MASK_2_NORMAL				_DissolveMask2Normal_Global
			#define VALUE_MASK_2_RADIUS				_DissolveMask2Radius_Global
			#define VALUE_MASK_2_HEIGHT				_DissolveMask2Height_Global

			#define VALUE_MASK_3_POSITION			_DissolveMask3Position_Global
			#define VALUE_MASK_3_NORMAL				_DissolveMask3Normal_Global
			#define VALUE_MASK_3_RADIUS				_DissolveMask3Radius_Global
			#define VALUE_MASK_3_HEIGHT				_DissolveMask3Height_Global

			#define VALUE_MASK_4_POSITION			_DissolveMask4Position_Global
			#define VALUE_MASK_4_NORMAL				_DissolveMask4Normal_Global
			#define VALUE_MASK_4_RADIUS				_DissolveMask4Radius_Global
			#define VALUE_MASK_4_HEIGHT				_DissolveMask4Height_Global

			#if defined(_DISSOLVEMASK_BOX)
				#define VALUE_MASK_2_BOUNDS_MIN		_DissolveMask2BoundsMin_Global
				#define VALUE_MASK_2_BOUNDS_MAX		_DissolveMask2BoundsMax_Global
				#define VALUE_MASK_2_TRS			_DissolveMask2TRS_Global

				#define VALUE_MASK_3_BOUNDS_MIN		_DissolveMask3BoundsMin_Global
				#define VALUE_MASK_3_BOUNDS_MAX		_DissolveMask3BoundsMax_Global
				#define VALUE_MASK_3_TRS			_DissolveMask3TRS_Global

				#define VALUE_MASK_4_BOUNDS_MIN		_DissolveMask4BoundsMin_Global
				#define VALUE_MASK_4_BOUNDS_MAX		_DissolveMask4BoundsMax_Global
				#define VALUE_MASK_4_TRS			_DissolveMask4TRS_Global
			#endif
		#elif defined(_DISSOLVEMASKCOUNT_THREE)
			#define VALUE_MASK_2_POSITION			_DissolveMask2Position_Global
			#define VALUE_MASK_2_NORMAL				_DissolveMask2Normal_Global
			#define VALUE_MASK_2_RADIUS				_DissolveMask2Radius_Global
			#define VALUE_MASK_2_HEIGHT				_DissolveMask2Height_Global

			#define VALUE_MASK_3_POSITION			_DissolveMask3Position_Global
			#define VALUE_MASK_3_NORMAL				_DissolveMask3Normal_Global
			#define VALUE_MASK_3_RADIUS				_DissolveMask3Radius_Global
			#define VALUE_MASK_3_HEIGHT				_DissolveMask3Height_Global

			#if defined(_DISSOLVEMASK_BOX)
				#define VALUE_MASK_2_BOUNDS_MIN		_DissolveMask2BoundsMin_Global
				#define VALUE_MASK_2_BOUNDS_MAX		_DissolveMask2BoundsMax_Global
				#define VALUE_MASK_2_TRS			_DissolveMask2TRS_Global

				#define VALUE_MASK_3_BOUNDS_MIN		_DissolveMask3BoundsMin_Global
				#define VALUE_MASK_3_BOUNDS_MAX		_DissolveMask3BoundsMax_Global
				#define VALUE_MASK_3_TRS			_DissolveMask3TRS_Global
			#endif
		#elif defined(_DISSOLVEMASKCOUNT_TWO)
			#define VALUE_MASK_2_POSITION			_DissolveMask2Position_Global
			#define VALUE_MASK_2_NORMAL				_DissolveMask2Normal_Global
			#define VALUE_MASK_2_RADIUS				_DissolveMask2Radius_Global
			#define VALUE_MASK_2_HEIGHT				_DissolveMask2Height_Global

			#if defined(_DISSOLVEMASK_BOX)
				#define VALUE_MASK_2_BOUNDS_MIN		_DissolveMask2BoundsMin_Global
				#define VALUE_MASK_2_BOUNDS_MAX		_DissolveMask2BoundsMax_Global
				#define VALUE_MASK_2_TRS			_DissolveMask2TRS_Global
			#endif
		#endif


		#if defined(_DISSOLVEMASK_BOX)
			#define VALUE_MASK_BOUNDS_MIN			_DissolveMaskBoundsMin_Global
			#define VALUE_MASK_BOUNDS_MAX			_DissolveMaskBoundsMax_Global
			#define VALUE_MASK_TRS					_DissolveMaskTRS_Global
		#endif

		//Per material---------------------------------------------------------------------

		#define VALUE_MAIN_MAP_TILING				_DissolveMainMapTiling

		#if defined(_DISSOLVEALPHASOURCE_CUSTOM_MAP) || defined(_DISSOLVEALPHASOURCE_TWO_CUSTOM_MAPS) || defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)
			#define VALUE_MAP1						_DissolveMap1
			#define VALUE_MAP1_SAMPLER				sampler_DissolveMap1
			#define VALUE_MAP1_ST					_DissolveMap1_ST
			#define VALUE_MAP1_SCROLL				_DissolveMap1_Scroll
			#define VALUE_MAP1_INTENSITY			_DissolveMap1Intensity
			#define VALUE_MAP1_CHANNEL				_DissolveMap1Channel
		#endif

		#if defined(_DISSOLVEALPHASOURCE_TWO_CUSTOM_MAPS) || defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)
			#define VALUE_MAP2						_DissolveMap2
			#define VALUE_MAP2_SAMPLER				sampler_DissolveMap2
			#define VALUE_MAP2_ST					_DissolveMap2_ST
			#define VALUE_MAP2_SCROLL				_DissolveMap2_Scroll
			#define VALUE_MAP2_INTENSITY			_DissolveMap2Intensity
			#define VALUE_MAP2_CHANNEL				_DissolveMap2Channel
		#endif

		#if defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)
			#define VALUE_MAP3						_DissolveMap3
			#define VALUE_MAP3_SAMPLER				sampler_DissolveMap3
			#define VALUE_MAP3_ST					_DissolveMap3_ST
			#define VALUE_MAP3_SCROLL				_DissolveMap3_Scroll
			#define VALUE_MAP3_INTENSITY			_DissolveMap3Intensity
			#define VALUE_MAP3_CHANNEL				_DissolveMap3Channel
		#endif

		#define VALUE_EDGE_SIZE					_DissolveEdgeWidth
		#define VALUE_EDGE_COLOR				_DissolveEdgeColor
		#define VALUE_EDGE_DISTORTION_SOURCE    _DissolveEdgeDistortionSource
		#define VALUE_EDGE_DISTORTION			_DissolveEdgeDistortionStrength
		#define VALUE_EDGE_COLOR_INTENSITY		_DissolveEdgeColorIntensity
		#define VALUE_EDGE_SHAPE				_DissolveEdgeShape
		#define VALUE_GI_MULTIPLIER				_DissolveGIMultiplier


		#if defined(_DISSOLVEEDGETEXTURESOURCE_GRADIENT) || defined(_DISSOLVEEDGETEXTURESOURCE_MAIN_MAP) || defined(_DISSOLVEEDGETEXTURESOURCE_CUSTOM)

			#define VALUE_EDGE_TEXTURE					_DissolveEdgeTexture
			#define VALUE_EDGE_TEXTURE_SAMPLER          sampler_DissolveEdgeTexture
			#define VALUE_EDGE_TEXTURE_REVERSE			_DissolveEdgeTextureReverse
			#define VALUE_EDGE_TEXTURE_OFFSET			_DissolveEdgeTexturePhaseOffset
			#define VALUE_EDGETEXTUREALPHAOFFSET		_DissolveEdgeTextureAlphaOffset

			#if defined(_DISSOLVEEDGETEXTURESOURCE_GRADIENT)
				#define VALUE_EDGE_TEXTURE_IS_DYNAMIC	_DissolveEdgeTextureIsDynamic
			#else
				#define VALUE_EDGE_TEXTURE_MIPMAP       _DissolveEdgeTextureMipmap
			#endif
		#endif


		#define VALUE_ALPHATEXTUREBLEND			_DissolveSourceAlphaTexturesBlend
		#define VALUE_UVSET						_DissolveAlphaSourceTexturesUVSet
		#define VALUE_NOISE_STRENGTH			_DissolveNoiseStrength

		#ifdef _DISSOLVEMAPPINGTYPE_TRIPLANAR
			#define VALUE_TRIPLANARMAPPINGSPACE          _DissolveTriplanarMappingSpace
		#endif

		#define VALUE_COMBINE_WITH_MASTER_NODE_ALPHA     _DissolveCombineWithMasterNodeAlpha
		#define VALUE_COMBINE_WITH_MASTER_NODE_COLOR     _DissolveCombineWithMasterNodeColor

	#elif defined(_DISSOLVEGLOBALCONTROL_MASK_AND_EDGE)

		//Globals-----------------------------------------------------------------------
		#define VALUE_CUTOFF					_DissolveCutoff_Global

		#define VALUE_CUTOFF_AXIS				_DissolveMaskAxis_Global
		#define VALUE_MASK_SPACE				_DissolveMaskSpace_Global
		#define VALUE_MASK_OFFSET				_DissolveMaskOffset_Global
		#define VALUE_AXIS_INVERT				_DissolveMaskInvert_Global
		#define VALUE_ADDITIONAL_AXIS_INVERT	_AdditionalDissolveMaskInvert_Global

		#define VALUE_MASK_POSITION				_DissolveMaskPosition_Global
		#define VALUE_MASK_NORMAL				_DissolveMaskNormal_Global
		#define VALUE_MASK_RADIUS				_DissolveMaskRadius_Global
		#define VALUE_MASK_HEIGHT				_DissolveMaskHeight_Global

		#if defined(_DISSOLVEMASKCOUNT_FOUR)
			#define VALUE_MASK_2_POSITION			_DissolveMask2Position_Global
			#define VALUE_MASK_2_NORMAL				_DissolveMask2Normal_Global
			#define VALUE_MASK_2_RADIUS				_DissolveMask2Radius_Global
			#define VALUE_MASK_2_HEIGHT				_DissolveMask2Height_Global

			#define VALUE_MASK_3_POSITION			_DissolveMask3Position_Global
			#define VALUE_MASK_3_NORMAL				_DissolveMask3Normal_Global
			#define VALUE_MASK_3_RADIUS				_DissolveMask3Radius_Global
			#define VALUE_MASK_3_HEIGHT				_DissolveMask3Height_Global

			#define VALUE_MASK_4_POSITION			_DissolveMask4Position_Global
			#define VALUE_MASK_4_NORMAL				_DissolveMask4Normal_Global
			#define VALUE_MASK_4_RADIUS				_DissolveMask4Radius_Global
			#define VALUE_MASK_4_HEIGHT				_DissolveMask4Height_Global

			#if defined(_DISSOLVEMASK_BOX)
				#define VALUE_MASK_2_BOUNDS_MIN		_DissolveMask2BoundsMin_Global
				#define VALUE_MASK_2_BOUNDS_MAX		_DissolveMask2BoundsMax_Global
				#define VALUE_MASK_2_TRS			_DissolveMask2TRS_Global

				#define VALUE_MASK_3_BOUNDS_MIN		_DissolveMask3BoundsMin_Global
				#define VALUE_MASK_3_BOUNDS_MAX		_DissolveMask3BoundsMax_Global
				#define VALUE_MASK_3_TRS			_DissolveMask3TRS_Global

				#define VALUE_MASK_4_BOUNDS_MIN		_DissolveMask4BoundsMin_Global
				#define VALUE_MASK_4_BOUNDS_MAX		_DissolveMask4BoundsMax_Global
				#define VALUE_MASK_4_TRS			_DissolveMask4TRS_Global
			#endif
		#elif defined(_DISSOLVEMASKCOUNT_THREE)
			#define VALUE_MASK_2_POSITION			_DissolveMask2Position_Global
			#define VALUE_MASK_2_NORMAL				_DissolveMask2Normal_Global
			#define VALUE_MASK_2_RADIUS				_DissolveMask2Radius_Global
			#define VALUE_MASK_2_HEIGHT				_DissolveMask2Height_Global

			#define VALUE_MASK_3_POSITION			_DissolveMask3Position_Global
			#define VALUE_MASK_3_NORMAL				_DissolveMask3Normal_Global
			#define VALUE_MASK_3_RADIUS				_DissolveMask3Radius_Global
			#define VALUE_MASK_3_HEIGHT				_DissolveMask3Height_Global

			#if defined(_DISSOLVEMASK_BOX)
				#define VALUE_MASK_2_BOUNDS_MIN		_DissolveMask2BoundsMin_Global
				#define VALUE_MASK_2_BOUNDS_MAX		_DissolveMask2BoundsMax_Global
				#define VALUE_MASK_2_TRS			_DissolveMask2TRS_Global

				#define VALUE_MASK_3_BOUNDS_MIN		_DissolveMask3BoundsMin_Global
				#define VALUE_MASK_3_BOUNDS_MAX		_DissolveMask3BoundsMax_Global
				#define VALUE_MASK_3_TRS			_DissolveMask3TRS_Global
			#endif
		#elif defined(_DISSOLVEMASKCOUNT_TWO)
			#define VALUE_MASK_2_POSITION			_DissolveMask2Position_Global
			#define VALUE_MASK_2_NORMAL				_DissolveMask2Normal_Global
			#define VALUE_MASK_2_RADIUS				_DissolveMask2Radius_Global
			#define VALUE_MASK_2_HEIGHT				_DissolveMask2Height_Global

			#if defined(_DISSOLVEMASK_BOX)
				#define VALUE_MASK_2_BOUNDS_MIN			_DissolveMask2BoundsMin_Global
				#define VALUE_MASK_2_BOUNDS_MAX		_DissolveMask2BoundsMax_Global
				#define VALUE_MASK_2_TRS			_DissolveMask2TRS_Global
			#endif
		#endif


		#if defined(_DISSOLVEMASK_BOX)
			#define VALUE_MASK_BOUNDS_MIN		_DissolveMaskBoundsMin_Global
			#define VALUE_MASK_BOUNDS_MAX		_DissolveMaskBoundsMax_Global
			#define VALUE_MASK_TRS				_DissolveMaskTRS_Global
		#endif

		#define VALUE_EDGE_SIZE					_DissolveEdgeWidth_Global
		#define VALUE_EDGE_SHAPE				_DissolveEdgeShape_Global
		#define VALUE_EDGE_COLOR				_DissolveEdgeColor_Global
		#define VALUE_EDGE_COLOR_INTENSITY		_DissolveEdgeColorIntensity_Global
		#define VALUE_GI_MULTIPLIER				_DissolveGIMultiplier

		#if defined(_DISSOLVEEDGETEXTURESOURCE_GRADIENT) || defined(_DISSOLVEEDGETEXTURESOURCE_MAIN_MAP) || defined(_DISSOLVEEDGETEXTURESOURCE_CUSTOM)

			#define VALUE_EDGE_TEXTURE					_DissolveEdgeTexture_Global
			#define VALUE_EDGE_TEXTURE_SAMPLER          sampler_DissolveEdgeTexture_Global
			#define VALUE_EDGE_TEXTURE_REVERSE			_DissolveEdgeTextureReverse_Global
			#define VALUE_EDGE_TEXTURE_OFFSET			_DissolveEdgeTexturePhaseOffset_Global
			#define VALUE_EDGETEXTUREALPHAOFFSET		_DissolveEdgeTextureAlphaOffset_Global

			#if defined(_DISSOLVEEDGETEXTURESOURCE_GRADIENT)
				#define VALUE_EDGE_TEXTURE_IS_DYNAMIC	_DissolveEdgeTextureIsDynamic_Global
			#else
				#define VALUE_EDGE_TEXTURE_MIPMAP       _DissolveEdgeTextureMipmap_Global
			#endif
		#endif

		//Per material---------------------------------------------------------------------	

		#define VALUE_MAIN_MAP_TILING				_DissolveMainMapTiling

		#if defined(_DISSOLVEALPHASOURCE_CUSTOM_MAP) || defined(_DISSOLVEALPHASOURCE_TWO_CUSTOM_MAPS) || defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)
			#define VALUE_MAP1						_DissolveMap1
			#define VALUE_MAP1_SAMPLER				sampler_DissolveMap1
			#define VALUE_MAP1_ST					_DissolveMap1_ST
			#define VALUE_MAP1_SCROLL				_DissolveMap1_Scroll
			#define VALUE_MAP1_INTENSITY			_DissolveMap1Intensity
			#define VALUE_MAP1_CHANNEL				_DissolveMap1Channel
		#endif

		#if defined(_DISSOLVEALPHASOURCE_TWO_CUSTOM_MAPS) || defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)
			#define VALUE_MAP2						_DissolveMap2
			#define VALUE_MAP2_SAMPLER				sampler_DissolveMap2
			#define VALUE_MAP2_ST					_DissolveMap2_ST
			#define VALUE_MAP2_SCROLL				_DissolveMap2_Scroll
			#define VALUE_MAP2_INTENSITY			_DissolveMap2Intensity
			#define VALUE_MAP2_CHANNEL				_DissolveMap2Channel
		#endif

		#if defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)
			#define VALUE_MAP3						_DissolveMap3
			#define VALUE_MAP3_SAMPLER				sampler_DissolveMap3
			#define VALUE_MAP3_ST					_DissolveMap3_ST
			#define VALUE_MAP3_SCROLL				_DissolveMap3_Scroll
			#define VALUE_MAP3_INTENSITY			_DissolveMap3Intensity
			#define VALUE_MAP3_CHANNEL				_DissolveMap3Channel
		#endif


		#define VALUE_EDGE_DISTORTION_SOURCE   _DissolveEdgeDistortionSource
		#define VALUE_EDGE_DISTORTION			_DissolveEdgeDistortionStrength	


		#define VALUE_ALPHATEXTUREBLEND			_DissolveSourceAlphaTexturesBlend
		#define VALUE_UVSET						_DissolveAlphaSourceTexturesUVSet
		#define VALUE_NOISE_STRENGTH			_DissolveNoiseStrength

		#ifdef _DISSOLVEMAPPINGTYPE_TRIPLANAR
			#define VALUE_TRIPLANARMAPPINGSPACE          _DissolveTriplanarMappingSpace
		#endif

		#define VALUE_COMBINE_WITH_MASTER_NODE_ALPHA     _DissolveCombineWithMasterNodeAlpha
		#define VALUE_COMBINE_WITH_MASTER_NODE_COLOR     _DissolveCombineWithMasterNodeColor

	#elif defined(_DISSOLVEGLOBALCONTROL_ALL)

		#define VALUE_CUTOFF					_DissolveCutoff_Global

		#define VALUE_CUTOFF_AXIS				_DissolveMaskAxis_Global
		#define VALUE_MASK_SPACE				_DissolveMaskSpace_Global
		#define VALUE_MASK_OFFSET				_DissolveMaskOffset_Global
		#define VALUE_AXIS_INVERT				_DissolveMaskInvert_Global
		#define VALUE_ADDITIONAL_AXIS_INVERT	_AdditionalDissolveMaskInvert_Global

		#define VALUE_EDGE_SIZE					_DissolveEdgeWidth_Global
		#define VALUE_EDGE_COLOR				_DissolveEdgeColor_Global
		#define VALUE_EDGE_DISTORTION_SOURCE   _DissolveEdgeDistortionSource_Global
		#define VALUE_EDGE_DISTORTION			_DissolveEdgeDistortionStrength_Global
		#define VALUE_EDGE_COLOR_INTENSITY		_DissolveEdgeColorIntensity_Global
		#define VALUE_EDGE_SHAPE				_DissolveEdgeShape_Global
		#define VALUE_GI_MULTIPLIER				_DissolveGIMultiplier_Global


		#if defined(_DISSOLVEEDGETEXTURESOURCE_GRADIENT) || defined(_DISSOLVEEDGETEXTURESOURCE_MAIN_MAP) || defined(_DISSOLVEEDGETEXTURESOURCE_CUSTOM)

			#define VALUE_EDGE_TEXTURE					_DissolveEdgeTexture_Global
			#define VALUE_EDGE_TEXTURE_SAMPLER          sampler_DissolveEdgeTexture_Global
			#define VALUE_EDGE_TEXTURE_REVERSE			_DissolveEdgeTextureReverse_Global
			#define VALUE_EDGE_TEXTURE_OFFSET			_DissolveEdgeTexturePhaseOffset_Global
			#define VALUE_EDGETEXTUREALPHAOFFSET		_DissolveEdgeTextureAlphaOffset_Global

			#if defined(_DISSOLVEEDGETEXTURESOURCE_GRADIENT)
				#define VALUE_EDGE_TEXTURE_IS_DYNAMIC	_DissolveEdgeTextureIsDynamic_Global
			#else
				#define VALUE_EDGE_TEXTURE_MIPMAP       _DissolveEdgeTextureMipmap_Global
			#endif
		#endif


		#define VALUE_MAIN_MAP_TILING				_DissolveMainMapTiling_Global

		#if defined(_DISSOLVEALPHASOURCE_CUSTOM_MAP) || defined(_DISSOLVEALPHASOURCE_TWO_CUSTOM_MAPS) || defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)
			#define VALUE_MAP1						_DissolveMap1_Global
			#define VALUE_MAP1_SAMPLER				sampler_DissolveMap1_Global
			#define VALUE_MAP1_ST					_DissolveMap1_ST_Global
			#define VALUE_MAP1_SCROLL				_DissolveMap1_Scroll_Global
			#define VALUE_MAP1_INTENSITY			_DissolveMap1Intensity_Global
			#define VALUE_MAP1_CHANNEL				_DissolveMap1Channel_Global
		#endif

		#if defined(_DISSOLVEALPHASOURCE_TWO_CUSTOM_MAPS) || defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)
			#define VALUE_MAP2						_DissolveMap2_Global
			#define VALUE_MAP2_SAMPLER				sampler_DissolveMap2_Global
			#define VALUE_MAP2_ST					_DissolveMap2_ST_Global
			#define VALUE_MAP2_SCROLL				_DissolveMap2_Scroll_Global
			#define VALUE_MAP2_INTENSITY			_DissolveMap2Intensity_Global
			#define VALUE_MAP2_CHANNEL				_DissolveMap2Channel_Global
		#endif

		#if defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)
			#define VALUE_MAP3						_DissolveMap3_Global
			#define VALUE_MAP3_SAMPLER				sampler_DissolveMap3_Global
			#define VALUE_MAP3_ST					_DissolveMap3_ST_Global
			#define VALUE_MAP3_SCROLL				_DissolveMap3_Scroll_Global
			#define VALUE_MAP3_INTENSITY			_DissolveMap3Intensity_Global
			#define VALUE_MAP3_CHANNEL				_DissolveMap3Channel_Global
		#endif

		#define VALUE_ALPHATEXTUREBLEND			_DissolveSourceAlphaTexturesBlend_Global
		#define VALUE_UVSET						_DissolveAlphaSourceTexturesUVSet_Global
		#define VALUE_NOISE_STRENGTH			_DissolveNoiseStrength_Global

		#define VALUE_MASK_POSITION				_DissolveMaskPosition_Global
		#define VALUE_MASK_NORMAL				_DissolveMaskNormal_Global
		#define VALUE_MASK_RADIUS				_DissolveMaskRadius_Global
		#define VALUE_MASK_HEIGHT				_DissolveMaskHeight_Global

		#if defined(_DISSOLVEMASKCOUNT_FOUR)
			#define VALUE_MASK_2_POSITION			_DissolveMask2Position_Global
			#define VALUE_MASK_2_NORMAL				_DissolveMask2Normal_Global
			#define VALUE_MASK_2_RADIUS				_DissolveMask2Radius_Global
			#define VALUE_MASK_2_HEIGHT				_DissolveMask2Height_Global

			#define VALUE_MASK_3_POSITION			_DissolveMask3Position_Global
			#define VALUE_MASK_3_NORMAL				_DissolveMask3Normal_Global
			#define VALUE_MASK_3_RADIUS				_DissolveMask3Radius_Global
			#define VALUE_MASK_3_HEIGHT				_DissolveMask3Height_Global

			#define VALUE_MASK_4_POSITION			_DissolveMask4Position_Global
			#define VALUE_MASK_4_NORMAL				_DissolveMask4Normal_Global
			#define VALUE_MASK_4_RADIUS				_DissolveMask4Radius_Global
			#define VALUE_MASK_4_HEIGHT				_DissolveMask4Height_Global

			#if defined(_DISSOLVEMASK_BOX)
				#define VALUE_MASK_2_BOUNDS_MIN		_DissolveMask2BoundsMin_Global
				#define VALUE_MASK_2_BOUNDS_MAX		_DissolveMask2BoundsMax_Global
				#define VALUE_MASK_2_TRS			_DissolveMask2TRS_Global

				#define VALUE_MASK_3_BOUNDS_MIN		_DissolveMask3BoundsMin_Global
				#define VALUE_MASK_3_BOUNDS_MAX		_DissolveMask3BoundsMax_Global
				#define VALUE_MASK_3_TRS			_DissolveMask3TRS_Global

				#define VALUE_MASK_4_BOUNDS_MIN		_DissolveMask4BoundsMin_Global
				#define VALUE_MASK_4_BOUNDS_MAX		_DissolveMask4BoundsMax_Global
				#define VALUE_MASK_4_TRS			_DissolveMask4TRS_Global
			#endif
		#elif defined(_DISSOLVEMASKCOUNT_THREE)
			#define VALUE_MASK_2_POSITION			_DissolveMask2Position_Global
			#define VALUE_MASK_2_NORMAL				_DissolveMask2Normal_Global
			#define VALUE_MASK_2_RADIUS				_DissolveMask2Radius_Global
			#define VALUE_MASK_2_HEIGHT				_DissolveMask2Height_Global

			#define VALUE_MASK_3_POSITION			_DissolveMask3Position_Global
			#define VALUE_MASK_3_NORMAL				_DissolveMask3Normal_Global
			#define VALUE_MASK_3_RADIUS				_DissolveMask3Radius_Global
			#define VALUE_MASK_3_HEIGHT				_DissolveMask3Height_Global

			#if defined(_DISSOLVEMASK_BOX)
				#define VALUE_MASK_2_BOUNDS_MIN		_DissolveMask2BoundsMin_Global
				#define VALUE_MASK_2_BOUNDS_MAX		_DissolveMask2BoundsMax_Global
				#define VALUE_MASK_2_TRS			_DissolveMask2TRS_Global

				#define VALUE_MASK_3_BOUNDS_MIN		_DissolveMask3BoundsMin_Global
				#define VALUE_MASK_3_BOUNDS_MAX		_DissolveMask3BoundsMax_Global
				#define VALUE_MASK_3_TRS			_DissolveMask3TRS_Global
			#endif
		#elif defined(_DISSOLVEMASKCOUNT_TWO)
			#define VALUE_MASK_2_POSITION			_DissolveMask2Position_Global
			#define VALUE_MASK_2_NORMAL				_DissolveMask2Normal_Global
			#define VALUE_MASK_2_RADIUS				_DissolveMask2Radius_Global
			#define VALUE_MASK_2_HEIGHT				_DissolveMask2Height_Global

			#if defined(_DISSOLVEMASK_BOX)
				#define VALUE_MASK_2_BOUNDS_MIN		_DissolveMask2BoundsMin_Global
				#define VALUE_MASK_2_BOUNDS_MAX		_DissolveMask2BoundsMax_Global
				#define VALUE_MASK_2_TRS			_DissolveMask2TRS_Global
			#endif
		#endif


		#if defined(_DISSOLVEMASK_BOX)
			#define VALUE_MASK_BOUNDS_MIN		_DissolveMaskBoundsMin_Global
			#define VALUE_MASK_BOUNDS_MAX		_DissolveMaskBoundsMax_Global
			#define VALUE_MASK_TRS				_DissolveMaskTRS_Global
		#endif


		#ifdef _DISSOLVEMAPPINGTYPE_TRIPLANAR
			#define VALUE_TRIPLANARMAPPINGSPACE          _DissolveTriplanarMappingSpace_Global
		#endif

		#define VALUE_COMBINE_WITH_MASTER_NODE_ALPHA     _DissolveCombineWithMasterNodeAlpha_Global
		#define VALUE_COMBINE_WITH_MASTER_NODE_COLOR     _DissolveCombineWithMasterNodeColor_Global

	#else

		#define VALUE_CUTOFF					_DissolveCutoff

		#define VALUE_CUTOFF_AXIS				_DissolveMaskAxis
		#define VALUE_MASK_SPACE				_DissolveMaskSpace
		#define VALUE_MASK_OFFSET				_DissolveMaskOffset	
		#define VALUE_AXIS_INVERT				_DissolveMaskInvert
		#define VALUE_ADDITIONAL_AXIS_INVERT	_AdditionalDissolveMaskInvert

		#define VALUE_EDGE_SIZE					_DissolveEdgeWidth
		#define VALUE_EDGE_COLOR				_DissolveEdgeColor
		#define VALUE_EDGE_DISTORTION_SOURCE   _DissolveEdgeDistortionSource
		#define VALUE_EDGE_DISTORTION			_DissolveEdgeDistortionStrength
		#define VALUE_EDGE_COLOR_INTENSITY		_DissolveEdgeColorIntensity
		#define VALUE_EDGE_SHAPE				_DissolveEdgeShape
		#define VALUE_GI_MULTIPLIER				_DissolveGIMultiplier


		#if defined(_DISSOLVEEDGETEXTURESOURCE_GRADIENT) || defined(_DISSOLVEEDGETEXTURESOURCE_MAIN_MAP) || defined(_DISSOLVEEDGETEXTURESOURCE_CUSTOM)

			#define VALUE_EDGE_TEXTURE					_DissolveEdgeTexture
			#define VALUE_EDGE_TEXTURE_SAMPLER          sampler_DissolveEdgeTexture
			#define VALUE_EDGE_TEXTURE_REVERSE			_DissolveEdgeTextureReverse
			#define VALUE_EDGE_TEXTURE_OFFSET			_DissolveEdgeTexturePhaseOffset
			#define VALUE_EDGETEXTUREALPHAOFFSET		_DissolveEdgeTextureAlphaOffset

			#if defined(_DISSOLVEEDGETEXTURESOURCE_GRADIENT)
				#define VALUE_EDGE_TEXTURE_IS_DYNAMIC	_DissolveEdgeTextureIsDynamic
			#else
				#define VALUE_EDGE_TEXTURE_MIPMAP       _DissolveEdgeTextureMipmap
			#endif
		#endif


		#define VALUE_MAIN_MAP_TILING				_DissolveMainMapTiling

		#if defined(_DISSOLVEALPHASOURCE_CUSTOM_MAP) || defined(_DISSOLVEALPHASOURCE_TWO_CUSTOM_MAPS) || defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)
			#define VALUE_MAP1						_DissolveMap1
			#define VALUE_MAP1_SAMPLER				sampler_DissolveMap1
			#define VALUE_MAP1_ST					_DissolveMap1_ST
			#define VALUE_MAP1_SCROLL				_DissolveMap1_Scroll
			#define VALUE_MAP1_INTENSITY			_DissolveMap1Intensity
			#define VALUE_MAP1_CHANNEL				_DissolveMap1Channel
		#endif

		#if defined(_DISSOLVEALPHASOURCE_TWO_CUSTOM_MAPS) || defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)
			#define VALUE_MAP2						_DissolveMap2
			#define VALUE_MAP2_SAMPLER				sampler_DissolveMap2
			#define VALUE_MAP2_ST					_DissolveMap2_ST
			#define VALUE_MAP2_SCROLL				_DissolveMap2_Scroll
			#define VALUE_MAP2_INTENSITY			_DissolveMap2Intensity
			#define VALUE_MAP2_CHANNEL				_DissolveMap2Channel
		#endif

		#if defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)
			#define VALUE_MAP3						_DissolveMap3
			#define VALUE_MAP3_SAMPLER				sampler_DissolveMap3
			#define VALUE_MAP3_ST					_DissolveMap3_ST
			#define VALUE_MAP3_SCROLL				_DissolveMap3_Scroll
			#define VALUE_MAP3_INTENSITY			_DissolveMap3Intensity
			#define VALUE_MAP3_CHANNEL				_DissolveMap3Channel
		#endif

		#define VALUE_ALPHATEXTUREBLEND			_DissolveSourceAlphaTexturesBlend
		#define VALUE_UVSET						_DissolveAlphaSourceTexturesUVSet
		#define VALUE_NOISE_STRENGTH			_DissolveNoiseStrength

		#define VALUE_MASK_POSITION				_DissolveMaskPosition
		#define VALUE_MASK_NORMAL				_DissolveMaskNormal
		#define VALUE_MASK_RADIUS				_DissolveMaskRadius
		#define VALUE_MASK_HEIGHT				_DissolveMaskHeight

		#if defined(_DISSOLVEMASKCOUNT_FOUR)
			#define VALUE_MASK_2_POSITION			_DissolveMask2Position
			#define VALUE_MASK_2_NORMAL				_DissolveMask2Normal
			#define VALUE_MASK_2_RADIUS				_DissolveMask2Radius
			#define VALUE_MASK_2_HEIGHT				_DissolveMask2Height

			#define VALUE_MASK_3_POSITION			_DissolveMask3Position
			#define VALUE_MASK_3_NORMAL				_DissolveMask3Normal
			#define VALUE_MASK_3_RADIUS				_DissolveMask3Radius
			#define VALUE_MASK_3_HEIGHT				_DissolveMask3Height

			#define VALUE_MASK_4_POSITION			_DissolveMask4Position
			#define VALUE_MASK_4_NORMAL				_DissolveMask4Normal
			#define VALUE_MASK_4_RADIUS				_DissolveMask4Radius
			#define VALUE_MASK_4_HEIGHT				_DissolveMask4Height

			#if defined(_DISSOLVEMASK_BOX)
				#define VALUE_MASK_2_BOUNDS_MIN		_DissolveMask2BoundsMin
				#define VALUE_MASK_2_BOUNDS_MAX		_DissolveMask2BoundsMax
				#define VALUE_MASK_2_TRS			_DissolveMask2TRS

				#define VALUE_MASK_3_BOUNDS_MIN		_DissolveMask3BoundsMin
				#define VALUE_MASK_3_BOUNDS_MAX		_DissolveMask3BoundsMax
				#define VALUE_MASK_3_TRS			_DissolveMask3TRS

				#define VALUE_MASK_4_BOUNDS_MIN		_DissolveMask4BoundsMin
				#define VALUE_MASK_4_BOUNDS_MAX		_DissolveMask4BoundsMax
				#define VALUE_MASK_4_TRS			_DissolveMask4TRS
			#endif
		#elif defined(_DISSOLVEMASKCOUNT_THREE)
			#define VALUE_MASK_2_POSITION			_DissolveMask2Position
			#define VALUE_MASK_2_NORMAL				_DissolveMask2Normal
			#define VALUE_MASK_2_RADIUS				_DissolveMask2Radius
			#define VALUE_MASK_2_HEIGHT				_DissolveMask2Height

			#define VALUE_MASK_3_POSITION			_DissolveMask3Position
			#define VALUE_MASK_3_NORMAL				_DissolveMask3Normal
			#define VALUE_MASK_3_RADIUS				_DissolveMask3Radius
			#define VALUE_MASK_3_HEIGHT				_DissolveMask3Height

			#if defined(_DISSOLVEMASK_BOX)
				#define VALUE_MASK_2_BOUNDS_MIN		_DissolveMask2BoundsMin
				#define VALUE_MASK_2_BOUNDS_MAX		_DissolveMask2BoundsMax
				#define VALUE_MASK_2_TRS			_DissolveMask2TRS

				#define VALUE_MASK_3_BOUNDS_MIN		_DissolveMask3BoundsMin
				#define VALUE_MASK_3_BOUNDS_MAX		_DissolveMask3BoundsMax
				#define VALUE_MASK_3_TRS			_DissolveMask3TRS
			#endif
		#elif defined(_DISSOLVEMASKCOUNT_TWO)
			#define VALUE_MASK_2_POSITION			_DissolveMask2Position
			#define VALUE_MASK_2_NORMAL				_DissolveMask2Normal
			#define VALUE_MASK_2_RADIUS				_DissolveMask2Radius
			#define VALUE_MASK_2_HEIGHT				_DissolveMask2Height

			#if defined(_DISSOLVEMASK_BOX)
				#define VALUE_MASK_2_BOUNDS_MIN		_DissolveMask2BoundsMin
				#define VALUE_MASK_2_BOUNDS_MAX		_DissolveMask2BoundsMax
				#define VALUE_MASK_2_TRS			_DissolveMask2TRS
			#endif
		#endif


		#if defined(_DISSOLVEMASK_BOX)
			#define VALUE_MASK_BOUNDS_MIN		_DissolveMaskBoundsMin
			#define VALUE_MASK_BOUNDS_MAX		_DissolveMaskBoundsMax
			#define VALUE_MASK_TRS				_DissolveMaskTRS
		#endif

		#ifdef _DISSOLVEMAPPINGTYPE_TRIPLANAR
			#define VALUE_TRIPLANARMAPPINGSPACE          _DissolveTriplanarMappingSpace
		#endif

		#define VALUE_COMBINE_WITH_MASTER_NODE_ALPHA     _DissolveCombineWithMasterNodeAlpha
		#define VALUE_COMBINE_WITH_MASTER_NODE_COLOR     _DissolveCombineWithMasterNodeColor

	#endif

	#define TIME _Time.x

	#ifdef DISSOLVE_LEGACY_MAINTEX
		#define READ_MAINTEX(uv)               tex2D(_MainTex, (uv).xy)
		#define READ_MAINTEX_LOD(uv,m)         tex2Dlod(_MainTex, float4((uv).xy, 0, m))
	#else
		#ifdef DISSOLVE_SHADER_GRAPH
			#define READ_MAINTEX(uv)			   SAMPLE_TEXTURE2D(_MainTex, sampler_MainTex, (uv).xy)
			#define READ_MAINTEX_LOD(uv,m)		   SAMPLE_TEXTURE2D_LOD(_MainTex, sampler_MainTex, (uv).xy, m)
		#else
			#define READ_MAINTEX(uv)			   SAMPLE_TEXTURE2D(_BaseMap, sampler_BaseMap, (uv).xy)
			#define READ_MAINTEX_LOD(uv,m)		   SAMPLE_TEXTURE2D_LOD(_BaseMap, sampler_BaseMap, (uv).xy, m)
		#endif
	#endif


	#ifdef DISSOLVE_LEGACY_TEXTURE_SAMPLE
		#define READ_TEXTURE_2D(t,s,uv,i)        saturate(tex2D(t, (uv).xy) + (1 - i).xxxx)
		#define READ_TEXTURE_2D_LOD(t,s,uv,m)    tex2Dlod(t, float4((uv).xy, 0, m))
	#else
		#define READ_TEXTURE_2D(t,s,uv,i)        saturate(SAMPLE_TEXTURE2D(t, s, (uv).xy) + (1 - i).xxxx)
		#define READ_TEXTURE_2D_LOD(t,s,uv,m)    SAMPLE_TEXTURE2D_LOD(t, s, (uv).xy, m)
	#endif


	inline void DissolveVertex2Fragment(float4 positionCS, float2 vertexUV0, float2 vertexUV1, inout float4 dissolveMapUV)
	{
		dissolveMapUV = 0;

		#if defined(_DISSOLVEMAPPINGTYPE_SCREEN_SPACE)
			dissolveMapUV = ComputeScreenPos(positionCS);
		#else

			#if defined(_DISSOLVEALPHASOURCE_CUSTOM_MAP) || defined(_DISSOLVEALPHASOURCE_TWO_CUSTOM_MAPS) || defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)
				float2 texUV = VALUE_UVSET == 0 ? vertexUV0 : vertexUV1;

				dissolveMapUV = float4(texUV.xy, 0, 0);
			#endif
		#endif
	}

	#if defined(_DISSOLVEMASK_BOX)
	inline bool IsPointInsideRect(float3 vertex, float3 min, float3 max)
	{
		return ((vertex.x > min.x && vertex.x < max.x) && (vertex.y > min.y && vertex.y < max.y) && (vertex.z > min.z && vertex.z < max.z));
	}

	inline float EdgeIntersection(float p1, float e1, float p2, float e2)
	{
		return saturate(e2 - p1) + saturate(e1 - p2) + (e1 * e2);
	}
	#endif

	inline float ReadMaskValue(float3 vertexPos, float noise)
	{
		float cutout = -1;
		float axiscutout = 1;


		#if defined(_ADDITIONALDISSOLVEMASK_XYZ_AXIS)
			float3 tempPos = vertexPos;

			if (VALUE_MASK_SPACE > 0.5)
				tempPos = mul(unity_WorldToObject, float4(vertexPos, 1)).xyz;

			axiscutout = (tempPos - VALUE_MASK_OFFSET)[(int)VALUE_CUTOFF_AXIS] * VALUE_ADDITIONAL_AXIS_INVERT;

			axiscutout += noise;
			cutout = 1;
		#endif

		#if defined(_DISSOLVEMASK_PLANE)

			#if defined(_DISSOLVEMASKCOUNT_FOUR)

				float d1 = dot(VALUE_MASK_NORMAL, vertexPos - VALUE_MASK_POSITION);
				float d2 = dot(VALUE_MASK_2_NORMAL, vertexPos - VALUE_MASK_2_POSITION);
				float d3 = dot(VALUE_MASK_3_NORMAL, vertexPos - VALUE_MASK_3_POSITION);
				float d4 = dot(VALUE_MASK_4_NORMAL, vertexPos - VALUE_MASK_4_POSITION);

				if (VALUE_AXIS_INVERT > 0)
				{
					cutout = min(min(d1, d2), min(d3, d4));
				}
				else
				{
					cutout = max(max(-d1, -d2), max(-d3, -d4));
				}

				cutout += noise;

			#elif defined(_DISSOLVEMASKCOUNT_THREE)

				float d1 = dot(VALUE_MASK_NORMAL, vertexPos - VALUE_MASK_POSITION);
				float d2 = dot(VALUE_MASK_2_NORMAL, vertexPos - VALUE_MASK_2_POSITION);
				float d3 = dot(VALUE_MASK_3_NORMAL, vertexPos - VALUE_MASK_3_POSITION);

				if (VALUE_AXIS_INVERT > 0)
				{
					cutout = min(min(d1, d2), d3);
				}
				else
				{
					cutout = max(max(-d1, -d2), -d3);
				}

				cutout += noise;

			#elif defined(_DISSOLVEMASKCOUNT_TWO)

				float d1 = dot(VALUE_MASK_NORMAL, vertexPos - VALUE_MASK_POSITION);
				float d2 = dot(VALUE_MASK_2_NORMAL, vertexPos - VALUE_MASK_2_POSITION);

				if (VALUE_AXIS_INVERT > 0)
				{
					cutout = min(d1, d2);
				}
				else
				{
					cutout = max(-d1, -d2);
				}

				cutout += noise;

			#else
				cutout = dot(VALUE_MASK_NORMAL * VALUE_AXIS_INVERT, vertexPos - VALUE_MASK_POSITION);

				cutout += noise;
			#endif


		#elif defined(_DISSOLVEMASK_SPHERE)

			#if defined(_DISSOLVEMASKCOUNT_FOUR)

				float4 radius = float4(VALUE_MASK_RADIUS, VALUE_MASK_2_RADIUS, VALUE_MASK_3_RADIUS, VALUE_MASK_4_RADIUS);

				float4 n = noise * (radius < 1 ? radius : 1);

				float4 d = float4(distance(vertexPos, VALUE_MASK_POSITION), distance(vertexPos, VALUE_MASK_2_POSITION), distance(vertexPos, VALUE_MASK_3_POSITION), distance(vertexPos,			VALUE_MASK_4_POSITION));

				//radius += abs(noise) * (1 - VALUE_AXIS_INVERT * 2);
				radius -= noise;


				if (VALUE_AXIS_INVERT > 0)
				{
					float4 b = radius - min(d, radius);
					cutout = dot(b, 1);
				}
				else
				{
					float4 a = saturate(max(0, d - radius));

					a.xy = a.xz*a.yw;
					cutout = a.x * a.y;
				}

			#elif defined(_DISSOLVEMASKCOUNT_THREE)

				float3 radius = float3(VALUE_MASK_RADIUS, VALUE_MASK_2_RADIUS, VALUE_MASK_3_RADIUS);

				float3 n = noise * (radius < 1 ? radius : 1);

				float3 d = float3(distance(vertexPos, VALUE_MASK_POSITION), distance(vertexPos, VALUE_MASK_2_POSITION), distance(vertexPos, VALUE_MASK_3_POSITION));

				//radius += abs(noise) * (1 - VALUE_AXIS_INVERT * 2);
				radius -= noise;


				if (VALUE_AXIS_INVERT > 0)
				{
					float3 b = radius - min(d, radius);
					cutout = dot(b, 1);
				}
				else
				{
					float3 a = saturate(max(0, d - radius));
					cutout = a.x * a.y * a.z;
				}

			#elif defined(_DISSOLVEMASKCOUNT_TWO)


				float2 radius = float2(VALUE_MASK_RADIUS, VALUE_MASK_2_RADIUS);

				float2 n = noise * (radius < 1 ? radius : 1);

				float2 d = float2(distance(vertexPos, VALUE_MASK_POSITION), distance(vertexPos, VALUE_MASK_2_POSITION));

				//radius += abs(noise) * (1 - VALUE_AXIS_INVERT * 2);
				radius -= noise;


				if (VALUE_AXIS_INVERT > 0)
				{
					float2 b = radius - min(d, radius);
					cutout = dot(b, 1);
				}
				else
				{
					float2 a = saturate(max(0, d - radius));
					cutout = a.x * a.y;
				}

			#else

				float radius = VALUE_MASK_RADIUS;

				noise *= (radius < 1 ? radius : 1);

				float d = distance(vertexPos, VALUE_MASK_POSITION);

				//radius += abs(noise) * (1 - VALUE_AXIS_INVERT * 2);
				radius -= noise;

				if (VALUE_AXIS_INVERT > 0)
				{
					cutout = radius - min(d, radius);
				}
				else
				{
					cutout = max(0, d - radius);
				}

			#endif		

		#elif defined(_DISSOLVEMASK_BOX)

			float dissolveEdgeSize = VALUE_EDGE_SIZE;
			#ifdef UNITY_PASS_META
				dissolveEdgeSize *= VALUE_GI_MULTIPLIER;
			#endif


			#if defined(_DISSOLVEMASKCOUNT_FOUR)

				//1////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				float m_1 = 0;
				float e_1 = 0;

				float3 vertexInverseTransform = mul(VALUE_MASK_TRS, float4(vertexPos, 1)).xyz;

				float3 minval = VALUE_MASK_BOUNDS_MIN + noise;
				float3 maxval = VALUE_MASK_BOUNDS_MAX - noise;

				if (IsPointInsideRect(vertexInverseTransform, minval, maxval))
				{
					m_1 = 1;
					cutout = 1;
					//Edge Detect
					if (IsPointInsideRect(vertexInverseTransform, minval + dissolveEdgeSize, maxval - dissolveEdgeSize) == false)
					{
						e_1 = 1;
					}
				}


				//2////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				float m_2 = 0;
				float e_2 = 0;

				float3 vertexInverseTransform_2 = mul(VALUE_MASK_2_TRS, float4(vertexPos, 1)).xyz;

				float3 min_2 = VALUE_MASK_2_BOUNDS_MIN + noise;
				float3 max_2 = VALUE_MASK_2_BOUNDS_MAX - noise;

				if (IsPointInsideRect(vertexInverseTransform_2, min_2, max_2))
				{
					m_2 = 1;
					cutout = 1;
					//Edge Detect
					if (IsPointInsideRect(vertexInverseTransform_2, min_2 + dissolveEdgeSize, max_2 - dissolveEdgeSize) == false)
					{
						e_2 = 1;
					}
				}


				//3////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				float m_3 = 0;
				float e_3 = 0;

				float3 vertexInverseTransform_3 = mul(VALUE_MASK_3_TRS, float4(vertexPos, 1)).xyz;

				float3 min_3 = VALUE_MASK_3_BOUNDS_MIN + noise;
				float3 max_3 = VALUE_MASK_3_BOUNDS_MAX - noise;

				if (IsPointInsideRect(vertexInverseTransform_3, min_3, max_3))
				{
					m_3 = 1;
					cutout = 1;
					//Edge Detect
					if (IsPointInsideRect(vertexInverseTransform_3, min_3 + dissolveEdgeSize, max_3 - dissolveEdgeSize) == false)
					{
						e_3 = 1;
					}
				}


				//4////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				float m_4 = 0;
				float e_4 = 0;

				float3 vertexInverseTransform_4 = mul(VALUE_MASK_4_TRS, float4(vertexPos, 1)).xyz;

				float3 min_4 = VALUE_MASK_4_BOUNDS_MIN + noise;
				float3 max_4 = VALUE_MASK_4_BOUNDS_MAX - noise;

				if (IsPointInsideRect(vertexInverseTransform_4, min_4, max_4))
				{
					m_4 = 1;
					cutout = 1;
					//Edge Detect
					if (IsPointInsideRect(vertexInverseTransform_4, min_4 + dissolveEdgeSize, max_4 - dissolveEdgeSize) == false)
					{
						e_4 = 1;
					}
				}


				float E1 = EdgeIntersection(m_1, e_1, m_2, e_2);
				float E2 = EdgeIntersection(saturate(m_1 + m_2), E1, m_3, e_3);
				float E3 = EdgeIntersection(saturate(m_1 + m_2 + m_3), E2, m_4, e_4);

				cutout = E3 > 0.5 ? dissolveEdgeSize * 0.5 * VALUE_AXIS_INVERT : cutout;


				cutout *= VALUE_AXIS_INVERT;

			#elif defined(_DISSOLVEMASKCOUNT_THREE)

				//1////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				float m_1 = 0;
				float e_1 = 0;

				float3 vertexInverseTransform = mul(VALUE_MASK_TRS, float4(vertexPos, 1)).xyz;

				float3 minval = VALUE_MASK_BOUNDS_MIN + noise;
				float3 maxval = VALUE_MASK_BOUNDS_MAX - noise;

				if (IsPointInsideRect(vertexInverseTransform, minval, maxval))
				{
					m_1 = 1;
					cutout = 1;
					//Edge Detect
					if (IsPointInsideRect(vertexInverseTransform, minval + dissolveEdgeSize, maxval - dissolveEdgeSize) == false)
					{
						e_1 = 1;
					}
				}


				//2////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				float m_2 = 0;
				float e_2 = 0;

				float3 vertexInverseTransform_2 = mul(VALUE_MASK_2_TRS, float4(vertexPos, 1)).xyz;

				float3 min_2 = VALUE_MASK_2_BOUNDS_MIN + noise;
				float3 max_2 = VALUE_MASK_2_BOUNDS_MAX - noise;

				if (IsPointInsideRect(vertexInverseTransform_2, min_2, max_2))
				{
					m_2 = 1;
					cutout = 1;
					//Edge Detect
					if (IsPointInsideRect(vertexInverseTransform_2, min_2 + dissolveEdgeSize, max_2 - dissolveEdgeSize) == false)
					{
						e_2 = 1;
					}
				}


				//3////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				float m_3 = 0;
				float e_3 = 0;

				float3 vertexInverseTransform_3 = mul(VALUE_MASK_3_TRS, float4(vertexPos, 1)).xyz;

				float3 min_3 = VALUE_MASK_3_BOUNDS_MIN + noise;
				float3 max_3 = VALUE_MASK_3_BOUNDS_MAX - noise;

				if (IsPointInsideRect(vertexInverseTransform_3, min_3, max_3))
				{
					m_3 = 1;
					cutout = 1;
					//Edge Detect
					if (IsPointInsideRect(vertexInverseTransform_3, min_3 + dissolveEdgeSize, max_3 - dissolveEdgeSize) == false)
					{
						e_3 = 1;
					}
				}


				float E1 = EdgeIntersection(m_1, e_1, m_2, e_2);
				float E2 = EdgeIntersection(saturate(m_1 + m_2), E1, m_3, e_3);

				cutout = E2 > 0.5 ? dissolveEdgeSize * 0.5 * VALUE_AXIS_INVERT : cutout;


				cutout *= VALUE_AXIS_INVERT;

			#elif defined(_DISSOLVEMASKCOUNT_TWO)

				//1////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				float m_1 = 0;
				float e_1 = 0;

				float3 vertexInverseTransform = mul(VALUE_MASK_TRS, float4(vertexPos, 1)).xyz;

				float3 minval = VALUE_MASK_BOUNDS_MIN + noise;
				float3 maxval = VALUE_MASK_BOUNDS_MAX - noise;

				if (IsPointInsideRect(vertexInverseTransform, minval, maxval))
				{
					m_1 = 1;
					cutout = 1;
					//Edge Detect
					if (IsPointInsideRect(vertexInverseTransform, minval + dissolveEdgeSize, maxval - dissolveEdgeSize) == false)
					{
						e_1 = 1;
					}
				}


				//2////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				float m_2 = 0;
				float e_2 = 0;

				float3 vertexInverseTransform_2 = mul(VALUE_MASK_2_TRS, float4(vertexPos, 1)).xyz;

				float3 min_2 = VALUE_MASK_2_BOUNDS_MIN + noise;
				float3 max_2 = VALUE_MASK_2_BOUNDS_MAX - noise;

				if (IsPointInsideRect(vertexInverseTransform_2, min_2, max_2))
				{
					m_2 = 1;
					cutout = 1;
					//Edge Detect
					if (IsPointInsideRect(vertexInverseTransform_2, min_2 + dissolveEdgeSize, max_2 - dissolveEdgeSize) == false)
					{
						e_2 = 1;
					}
				}



				float E = EdgeIntersection(m_1, e_1, m_2, e_2);
				cutout = E > 0.5 ? dissolveEdgeSize * 0.5 * VALUE_AXIS_INVERT : cutout;


				cutout *= VALUE_AXIS_INVERT;

			#else

				float3 vertexInverseTransform = mul(VALUE_MASK_TRS, float4(vertexPos, 1)).xyz;

				float3 minval = VALUE_MASK_BOUNDS_MIN + noise;
				float3 maxval = VALUE_MASK_BOUNDS_MAX - noise;


				if (IsPointInsideRect(vertexInverseTransform, minval, maxval))
				{
					cutout = 1;

					//Edge Detect
					if (!IsPointInsideRect(vertexInverseTransform, minval + dissolveEdgeSize, maxval - dissolveEdgeSize))
					{
						cutout = dissolveEdgeSize * 0.5 * VALUE_AXIS_INVERT;
					}
				}

				cutout *= VALUE_AXIS_INVERT;

			#endif

		#elif defined(_DISSOLVEMASK_CYLINDER)

			#if defined(_DISSOLVEMASKCOUNT_FOUR)

			//1
			float3 p1_1 = VALUE_MASK_POSITION;
			float3 p1_2 = p1_1 + VALUE_MASK_NORMAL * VALUE_MASK_HEIGHT;

			float t1 = max(0, min(1, dot(vertexPos - p1_1, p1_2 - p1_1) / (VALUE_MASK_HEIGHT * VALUE_MASK_HEIGHT)));
			float3 projection1 = p1_1 + t1 * (p1_2 - p1_1);

			//2
			float3 p2_1 = VALUE_MASK_2_POSITION;
			float3 p2_2 = p2_1 + VALUE_MASK_2_NORMAL * VALUE_MASK_2_HEIGHT;

			float t2 = max(0, min(1, dot(vertexPos - p2_1, p2_2 - p2_1) / (VALUE_MASK_2_HEIGHT * VALUE_MASK_2_HEIGHT)));
			float3 projection2 = p2_1 + t2 * (p2_2 - p2_1);

			//3
			float3 p3_1 = VALUE_MASK_3_POSITION;
			float3 p3_2 = p3_1 + VALUE_MASK_3_NORMAL * VALUE_MASK_3_HEIGHT;

			float t3 = max(0, min(1, dot(vertexPos - p3_1, p3_2 - p3_1) / (VALUE_MASK_3_HEIGHT * VALUE_MASK_3_HEIGHT)));
			float3 projection3 = p3_1 + t3 * (p3_2 - p3_1);

			//4
			float3 p4_1 = VALUE_MASK_4_POSITION;
			float3 p4_2 = p4_1 + VALUE_MASK_4_NORMAL * VALUE_MASK_4_HEIGHT;

			float t4 = max(0, min(1, dot(vertexPos - p4_1, p4_2 - p4_1) / (VALUE_MASK_4_HEIGHT * VALUE_MASK_4_HEIGHT)));
			float3 projection4 = p4_1 + t4 * (p4_2 - p4_1);



			float4 d = float4(distance(vertexPos, projection1), distance(vertexPos, projection2), distance(vertexPos, projection3), distance(vertexPos, projection4));

			float4 radius = float4(VALUE_MASK_RADIUS, VALUE_MASK_2_RADIUS, VALUE_MASK_3_RADIUS, VALUE_MASK_4_RADIUS);

			float4 n = noise * (radius < 1 ? radius : 1);
			radius -= n;


			if (VALUE_AXIS_INVERT > 0)
			{
				float4 b = radius - min(d, radius);
				cutout = dot(b, 1);
			}
			else
			{
				float4 a = saturate(max(0, d - radius));

				a.xy = a.xz*a.yw;
				cutout = a.x * a.y;
			}

		#elif defined(_DISSOLVEMASKCOUNT_THREE)

			//1
			float3 p1_1 = VALUE_MASK_POSITION;
			float3 p1_2 = p1_1 + VALUE_MASK_NORMAL * VALUE_MASK_HEIGHT;

			float t1 = max(0, min(1, dot(vertexPos - p1_1, p1_2 - p1_1) / (VALUE_MASK_HEIGHT * VALUE_MASK_HEIGHT)));
			float3 projection1 = p1_1 + t1 * (p1_2 - p1_1);

			//2
			float3 p2_1 = VALUE_MASK_2_POSITION;
			float3 p2_2 = p2_1 + VALUE_MASK_2_NORMAL * VALUE_MASK_2_HEIGHT;

			float t2 = max(0, min(1, dot(vertexPos - p2_1, p2_2 - p2_1) / (VALUE_MASK_2_HEIGHT * VALUE_MASK_2_HEIGHT)));
			float3 projection2 = p2_1 + t2 * (p2_2 - p2_1);

			//3
			float3 p3_1 = VALUE_MASK_3_POSITION;
			float3 p3_2 = p3_1 + VALUE_MASK_3_NORMAL * VALUE_MASK_3_HEIGHT;

			float t3 = max(0, min(1, dot(vertexPos - p3_1, p3_2 - p3_1) / (VALUE_MASK_3_HEIGHT * VALUE_MASK_3_HEIGHT)));
			float3 projection3 = p3_1 + t3 * (p3_2 - p3_1);



			float3 d = float3(distance(vertexPos, projection1), distance(vertexPos, projection2), distance(vertexPos, projection3));

			float3 radius = float3(VALUE_MASK_RADIUS, VALUE_MASK_2_RADIUS, VALUE_MASK_3_RADIUS);

			float3 n = noise * (radius < 1 ? radius : 1);
			radius -= n;


			if (VALUE_AXIS_INVERT > 0)
			{
				float3 b = radius - min(d, radius);
				cutout = dot(b, 1);
			}
			else
			{
				float3 a = saturate(max(0, d - radius));
				cutout = a.x * a.y * a.z;
			}

		#elif defined(_DISSOLVEMASKCOUNT_TWO)

			//1
			float3 p1_1 = VALUE_MASK_POSITION;
			float3 p1_2 = p1_1 + VALUE_MASK_NORMAL * VALUE_MASK_HEIGHT;

			float t1 = max(0, min(1, dot(vertexPos - p1_1, p1_2 - p1_1) / (VALUE_MASK_HEIGHT * VALUE_MASK_HEIGHT)));
			float3 projection1 = p1_1 + t1 * (p1_2 - p1_1);

			//2
			float3 p2_1 = VALUE_MASK_2_POSITION;
			float3 p2_2 = p2_1 + VALUE_MASK_2_NORMAL * VALUE_MASK_2_HEIGHT;

			float t2 = max(0, min(1, dot(vertexPos - p2_1, p2_2 - p2_1) / (VALUE_MASK_2_HEIGHT * VALUE_MASK_2_HEIGHT)));
			float3 projection2 = p2_1 + t2 * (p2_2 - p2_1);



			float2 d = float2(distance(vertexPos, projection1), distance(vertexPos, projection2));

			float2 radius = float2(VALUE_MASK_RADIUS, VALUE_MASK_2_RADIUS);

			float2 n = noise * (radius < 1 ? radius : 1);
			radius -= n;


			if (VALUE_AXIS_INVERT > 0)
			{
				float2 b = radius - min(d, radius);
				cutout = dot(b, 1);
			}
			else
			{
				float2 a = saturate(max(0, d - radius));
				cutout = a.x * a.y;
			}
		#else
			float3 p1 = VALUE_MASK_POSITION;
			float3 p2 = p1 + VALUE_MASK_NORMAL * VALUE_MASK_HEIGHT;

			float t = max(0, min(1, dot(vertexPos - p1, p2 - p1) / (VALUE_MASK_HEIGHT * VALUE_MASK_HEIGHT)));
			float3 projection = p1 + t * (p2 - p1);

			float d = distance(vertexPos, projection);


			float radius = VALUE_MASK_RADIUS;
			noise *= (radius < 1 ? radius : 1);

			//radius += abs(noise) * (1 - VALUE_AXIS_INVERT * 2);
			radius -= noise;

			if (VALUE_AXIS_INVERT > 0)
			{
				cutout = radius - min(d, radius);
			}
			else
			{
				cutout = max(0, d - radius);
			}
		#endif
	#elif defined(_DISSOLVEMASK_CONE)

		#if defined(_DISSOLVEMASKCOUNT_FOUR)

			//1
			float3 p1_1 = VALUE_MASK_POSITION;
			float3 p1_2 = p1_1 + VALUE_MASK_NORMAL * VALUE_MASK_HEIGHT;

			float t1 = max(0, min(1, dot(vertexPos - p1_1, p1_2 - p1_1) / (VALUE_MASK_HEIGHT * VALUE_MASK_HEIGHT)));
			float3 projection1 = p1_1 + t1 * (p1_2 - p1_1);

			//2
			float3 p2_1 = VALUE_MASK_2_POSITION;
			float3 p2_2 = p2_1 + VALUE_MASK_2_NORMAL * VALUE_MASK_2_HEIGHT;

			float t2 = max(0, min(1, dot(vertexPos - p2_1, p2_2 - p2_1) / (VALUE_MASK_2_HEIGHT * VALUE_MASK_2_HEIGHT)));
			float3 projection2 = p2_1 + t2 * (p2_2 - p2_1);

			//3
			float3 p3_1 = VALUE_MASK_3_POSITION;
			float3 p3_2 = p3_1 + VALUE_MASK_3_NORMAL * VALUE_MASK_3_HEIGHT;

			float t3 = max(0, min(1, dot(vertexPos - p3_1, p3_2 - p3_1) / (VALUE_MASK_3_HEIGHT * VALUE_MASK_3_HEIGHT)));
			float3 projection3 = p3_1 + t3 * (p3_2 - p3_1);

			//4
			float3 p4_1 = VALUE_MASK_4_POSITION;
			float3 p4_2 = p4_1 + VALUE_MASK_4_NORMAL * VALUE_MASK_4_HEIGHT;

			float t4 = max(0, min(1, dot(vertexPos - p4_1, p4_2 - p4_1) / (VALUE_MASK_4_HEIGHT * VALUE_MASK_4_HEIGHT)));
			float3 projection4 = p4_1 + t4 * (p4_2 - p4_1);



			float4 d = float4(distance(vertexPos, projection1), distance(vertexPos, projection2), distance(vertexPos, projection3), distance(vertexPos, projection4));


			float4 radius = lerp(0, float4(VALUE_MASK_RADIUS, VALUE_MASK_2_RADIUS, VALUE_MASK_3_RADIUS, VALUE_MASK_4_RADIUS), float4(t1, t2, t3, t4));


			float4 n = noise * (radius < 1 ? radius : 1);
			radius -= n;

			if (VALUE_AXIS_INVERT > 0)
			{
				float4 b = radius - min(d, radius);
				cutout = dot(b, 1);
			}
			else
			{
				float4 a = saturate(max(0, d - radius));

				a.xy = a.xz*a.yw;
				cutout = a.x * a.y;
			}

		#elif defined(_DISSOLVEMASKCOUNT_THREE)

			//1
			float3 p1_1 = VALUE_MASK_POSITION;
			float3 p1_2 = p1_1 + VALUE_MASK_NORMAL * VALUE_MASK_HEIGHT;

			float t1 = max(0, min(1, dot(vertexPos - p1_1, p1_2 - p1_1) / (VALUE_MASK_HEIGHT * VALUE_MASK_HEIGHT)));
			float3 projection1 = p1_1 + t1 * (p1_2 - p1_1);

			//2
			float3 p2_1 = VALUE_MASK_2_POSITION;
			float3 p2_2 = p2_1 + VALUE_MASK_2_NORMAL * VALUE_MASK_2_HEIGHT;

			float t2 = max(0, min(1, dot(vertexPos - p2_1, p2_2 - p2_1) / (VALUE_MASK_2_HEIGHT * VALUE_MASK_2_HEIGHT)));
			float3 projection2 = p2_1 + t2 * (p2_2 - p2_1);

			//3
			float3 p3_1 = VALUE_MASK_3_POSITION;
			float3 p3_2 = p3_1 + VALUE_MASK_3_NORMAL * VALUE_MASK_3_HEIGHT;

			float t3 = max(0, min(1, dot(vertexPos - p3_1, p3_2 - p3_1) / (VALUE_MASK_3_HEIGHT * VALUE_MASK_3_HEIGHT)));
			float3 projection3 = p3_1 + t3 * (p3_2 - p3_1);


			float3 d = float3(distance(vertexPos, projection1), distance(vertexPos, projection2), distance(vertexPos, projection3));


			float3 radius = lerp(0, float3(VALUE_MASK_RADIUS, VALUE_MASK_2_RADIUS, VALUE_MASK_3_RADIUS), float3(t1, t2, t3));


			float3 n = noise * (radius < 1 ? radius : 1);
			radius -= n;

			if (VALUE_AXIS_INVERT > 0)
			{
				float3 b = radius - min(d, radius);
				cutout = dot(b, 1);
			}
			else
			{
				float3 a = saturate(max(0, d - radius));
				cutout = a.x * a.y * a.z;
			}

		#elif defined(_DISSOLVEMASKCOUNT_TWO)

			//1
			float3 p1_1 = VALUE_MASK_POSITION;
			float3 p1_2 = p1_1 + VALUE_MASK_NORMAL * VALUE_MASK_HEIGHT;

			float t1 = max(0, min(1, dot(vertexPos - p1_1, p1_2 - p1_1) / (VALUE_MASK_HEIGHT * VALUE_MASK_HEIGHT)));
			float3 projection1 = p1_1 + t1 * (p1_2 - p1_1);

			//2
			float3 p2_1 = VALUE_MASK_2_POSITION;
			float3 p2_2 = p2_1 + VALUE_MASK_2_NORMAL * VALUE_MASK_2_HEIGHT;

			float t2 = max(0, min(1, dot(vertexPos - p2_1, p2_2 - p2_1) / (VALUE_MASK_2_HEIGHT * VALUE_MASK_2_HEIGHT)));
			float3 projection2 = p2_1 + t2 * (p2_2 - p2_1);


			float2 d = float2(distance(vertexPos, projection1), distance(vertexPos, projection2));


			float2 radius = lerp(0, float2(VALUE_MASK_RADIUS, VALUE_MASK_2_RADIUS), float2(t1, t2));


			float2 n = noise * (radius < 1 ? radius : 1);
			radius -= n;

			if (VALUE_AXIS_INVERT > 0)
			{
				float2 b = radius - min(d, radius);
				cutout = dot(b, 1);
			}
			else
			{
				float2 a = saturate(max(0, d - radius));
				cutout = a.x * a.y;
			}

		#else
			float3 p1 = VALUE_MASK_POSITION;
			float3 p2 = p1 + VALUE_MASK_NORMAL * VALUE_MASK_HEIGHT;

			float t = max(0, min(1, dot(vertexPos - p1, p2 - p1) / (VALUE_MASK_HEIGHT * VALUE_MASK_HEIGHT)));
			float3 projection = p1 + t * (p2 - p1);

			float d = distance(vertexPos, projection);


			float radius = lerp(0, VALUE_MASK_RADIUS, t);
			noise *= (radius < 1 ? radius : 1);

			//radius += abs(noise) * (1 - VALUE_AXIS_INVERT * 2);
			radius -= noise;

			if (VALUE_AXIS_INVERT > 0)
			{
				cutout = radius - min(d, radius);
			}
			else
			{
				cutout = max(0, d - radius);
			}
		#endif

	#endif

	cutout = min(axiscutout, cutout);
	return (cutout > 0 ? cutout : -1);
}


inline float4 ReadDissolveAlpha(float2 mainTexUV, float4 dissolveMapUV, float3 vertexPos)
{
	float4 alphaSource = 1;


	#ifdef _DISSOLVEMAPPINGTYPE_SCREEN_SPACE
		float2 screenUV = dissolveMapUV.xy / dissolveMapUV.w;
		screenUV.y *= _ScreenParams.y / _ScreenParams.x;

		#ifdef DISSOLVE_LEGACY_RENDER_PIPELIN
			screenUV *= distance(_WorldSpaceCameraPos, mul(unity_ObjectToWorld, float4(0, 0, 0, 1)).xyz) * 0.1;
		#else
			screenUV *= distance(GetCameraPositionWS(), TransformObjectToWorld(float3(0, 0, 0)).xyz) * 0.1;
		#endif
	#endif


	#if defined(_DISSOLVEALPHASOURCE_CUSTOM_MAP)

		#ifdef _DISSOLVEMAPPINGTYPE_SCREEN_SPACE
			screenUV = screenUV * VALUE_MAP1_ST.xy + VALUE_MAP1_ST.zw + VALUE_MAP1_SCROLL.xy * TIME;

			alphaSource = READ_TEXTURE_2D(VALUE_MAP1, VALUE_MAP1_SAMPLER, screenUV, VALUE_MAP1_INTENSITY);
		#else
			float2 uv1 = dissolveMapUV.xy * VALUE_MAP1_ST.xy + VALUE_MAP1_ST.zw + VALUE_MAP1_SCROLL.xy * TIME;

			alphaSource = READ_TEXTURE_2D(VALUE_MAP1, VALUE_MAP1_SAMPLER, uv1, VALUE_MAP1_INTENSITY);
		#endif

		alphaSource.a = alphaSource[VALUE_MAP1_CHANNEL];

	#elif defined(_DISSOLVEALPHASOURCE_TWO_CUSTOM_MAPS)

		#ifdef _DISSOLVEMAPPINGTYPE_SCREEN_SPACE
			float2 uv1 = screenUV * VALUE_MAP1_ST.xy + VALUE_MAP1_ST.zw + VALUE_MAP1_SCROLL.xy * TIME;
			float2 uv2 = screenUV * VALUE_MAP2_ST.xy + VALUE_MAP2_ST.zw + VALUE_MAP2_SCROLL.xy * TIME;

			float4 t1 = READ_TEXTURE_2D(VALUE_MAP1, VALUE_MAP1_SAMPLER, uv1, VALUE_MAP1_INTENSITY);
			float4 t2 = READ_TEXTURE_2D(VALUE_MAP2, VALUE_MAP2_SAMPLER, uv2, VALUE_MAP2_INTENSITY);
		#else
			float2 uv1 = dissolveMapUV.xy * VALUE_MAP1_ST.xy + VALUE_MAP1_ST.zw + VALUE_MAP1_SCROLL.xy * TIME;
			float2 uv2 = dissolveMapUV.xy * VALUE_MAP2_ST.xy + VALUE_MAP2_ST.zw + VALUE_MAP2_SCROLL.xy * TIME;

			float4 t1 = READ_TEXTURE_2D(VALUE_MAP1, VALUE_MAP1_SAMPLER, uv1, VALUE_MAP1_INTENSITY);
			float4 t2 = READ_TEXTURE_2D(VALUE_MAP2, VALUE_MAP2_SAMPLER, uv2, VALUE_MAP2_INTENSITY);
		#endif

		t1.a = t1[VALUE_MAP1_CHANNEL];
		t2.a = t2[VALUE_MAP2_CHANNEL];

		alphaSource = lerp((t1 * t2), (t1 + t2) * 0.5, VALUE_ALPHATEXTUREBLEND);

	#elif defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)

		#ifdef _DISSOLVEMAPPINGTYPE_SCREEN_SPACE
			float2 uv1 = screenUV * VALUE_MAP1_ST.xy + VALUE_MAP1_ST.zw + VALUE_MAP1_SCROLL.xy * TIME;
			float2 uv2 = screenUV * VALUE_MAP2_ST.xy + VALUE_MAP2_ST.zw + VALUE_MAP2_SCROLL.xy * TIME;
			float2 uv3 = screenUV * VALUE_MAP3_ST.xy + VALUE_MAP3_ST.zw + VALUE_MAP3_SCROLL.xy * TIME;
		#else
			float2 uv1 = dissolveMapUV.xy * VALUE_MAP1_ST.xy + VALUE_MAP1_ST.zw + VALUE_MAP1_SCROLL.xy * TIME;
			float2 uv2 = dissolveMapUV.xy * VALUE_MAP2_ST.xy + VALUE_MAP2_ST.zw + VALUE_MAP2_SCROLL.xy * TIME;
			float2 uv3 = dissolveMapUV.xy * VALUE_MAP3_ST.xy + VALUE_MAP3_ST.zw + VALUE_MAP3_SCROLL.xy * TIME;
		#endif

		float4 t1 = READ_TEXTURE_2D(VALUE_MAP1, VALUE_MAP1_SAMPLER, uv1, VALUE_MAP1_INTENSITY);
		float4 t2 = READ_TEXTURE_2D(VALUE_MAP2, VALUE_MAP2_SAMPLER, uv2, VALUE_MAP2_INTENSITY);
		float4 t3 = READ_TEXTURE_2D(VALUE_MAP3, VALUE_MAP3_SAMPLER, uv3, VALUE_MAP3_INTENSITY);

		t1.a = t1[VALUE_MAP1_CHANNEL];
		t2.a = t2[VALUE_MAP2_CHANNEL];
		t3.a = t3[VALUE_MAP3_CHANNEL];

		alphaSource = lerp((t1 * t2 * t3), (t1 + t2 + t3) / 3.0, VALUE_ALPHATEXTUREBLEND);

	#else

		#ifdef _DISSOLVEMAPPINGTYPE_SCREEN_SPACE
			alphaSource = READ_MAINTEX(screenUV * VALUE_MAIN_MAP_TILING);
		#else
			alphaSource = READ_MAINTEX(mainTexUV * VALUE_MAIN_MAP_TILING);
		#endif

	#endif



	#if defined(_ADDITIONALDISSOLVEMASK_XYZ_AXIS) || defined(_DISSOLVEMASK_PLANE) || defined(_DISSOLVEMASK_SPHERE) || defined(_DISSOLVEMASK_BOX) || defined(_DISSOLVEMASK_CYLINDER) || defined		(_DISSOLVEMASK_CONE)

		float noise = ((alphaSource.a - 0.5) * 2) * VALUE_NOISE_STRENGTH;

		alphaSource.a = ReadMaskValue(vertexPos, noise);

	#endif	

	return alphaSource;
}




#ifdef _DISSOLVEMAPPINGTYPE_TRIPLANAR
	#if defined(_DISSOLVEALPHASOURCE_CUSTOM_MAP) || defined(_DISSOLVEALPHASOURCE_TWO_CUSTOM_MAPS) || defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)
		inline float4 ReadTriplanarTextureMap1(float3 coords, float3 blend)
		{
			coords = coords * VALUE_MAP1_ST.x * 0.1 + VALUE_MAP1_SCROLL.xyz * TIME;

			float4 cx = READ_TEXTURE_2D(VALUE_MAP1, VALUE_MAP1_SAMPLER, coords.yz, VALUE_MAP1_INTENSITY);
			float4 cy = READ_TEXTURE_2D(VALUE_MAP1, VALUE_MAP1_SAMPLER, coords.xz, VALUE_MAP1_INTENSITY);
			float4 cz = READ_TEXTURE_2D(VALUE_MAP1, VALUE_MAP1_SAMPLER, coords.xy, VALUE_MAP1_INTENSITY);

			cx.a = cx[VALUE_MAP1_CHANNEL];
			cy.a = cy[VALUE_MAP1_CHANNEL];
			cz.a = cz[VALUE_MAP1_CHANNEL];

			return (cx * blend.x + cy * blend.y + cz * blend.z);
		}
	#endif

	#if defined(_DISSOLVEALPHASOURCE_TWO_CUSTOM_MAPS) || defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)
		inline float4 ReadTriplanarTextureMap2(float3 coords, float3 blend)
		{
			coords = coords * VALUE_MAP2_ST.x * 0.1 + VALUE_MAP2_SCROLL.xyz * TIME;

			float4 cx = READ_TEXTURE_2D(VALUE_MAP2, VALUE_MAP2_SAMPLER, coords.yz, VALUE_MAP2_INTENSITY);
			float4 cy = READ_TEXTURE_2D(VALUE_MAP2, VALUE_MAP2_SAMPLER, coords.xz, VALUE_MAP2_INTENSITY);
			float4 cz = READ_TEXTURE_2D(VALUE_MAP2, VALUE_MAP2_SAMPLER, coords.xy, VALUE_MAP2_INTENSITY);

			cx.a = cx[VALUE_MAP2_CHANNEL];
			cy.a = cy[VALUE_MAP2_CHANNEL];
			cz.a = cz[VALUE_MAP2_CHANNEL];

			return (cx * blend.x + cy * blend.y + cz * blend.z);
		}
	#endif

	#ifdef _DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS
		inline float4 ReadTriplanarTextureMap3(float3 coords, float3 blend)
		{
			coords = coords * VALUE_MAP3_ST.x * 0.1 + VALUE_MAP3_SCROLL.xyz * TIME;

			float4 cx = READ_TEXTURE_2D(VALUE_MAP3, VALUE_MAP3_SAMPLER, coords.yz, VALUE_MAP3_INTENSITY);
			float4 cy = READ_TEXTURE_2D(VALUE_MAP3, VALUE_MAP3_SAMPLER, coords.xz, VALUE_MAP3_INTENSITY);
			float4 cz = READ_TEXTURE_2D(VALUE_MAP3, VALUE_MAP3_SAMPLER, coords.xy, VALUE_MAP3_INTENSITY);

			cx.a = cx[VALUE_MAP3_CHANNEL];
			cy.a = cy[VALUE_MAP3_CHANNEL];
			cz.a = cz[VALUE_MAP3_CHANNEL];

			return (cx * blend.x + cy * blend.y + cz * blend.z);
		}
	#endif

	inline float4 ReadTriplanarTextureMainMap(float3 coords, float3 blend)
	{
		float4 cx = READ_MAINTEX(coords.yz);
		float4 cy = READ_MAINTEX(coords.xz);
		float4 cz = READ_MAINTEX(coords.xy);

		return (cx * blend.x + cy * blend.y + cz * blend.z);
	}

	inline float4 ReadDissolveAlpha_Triplanar(float3 positionWS, float3 normalWS)
	{
		float3 positionOS = mul(unity_WorldToObject, float4(positionWS, 1)).xyz;
		float3 normal = mul(unity_WorldToObject, float4(normalWS, 0)).xyz;

		float3 vertexPos = lerp(positionWS, positionOS, VALUE_TRIPLANARMAPPINGSPACE);
		float3 vertexNorm = lerp(normalWS, normal, VALUE_TRIPLANARMAPPINGSPACE);

		float3 blend = abs(vertexNorm);
		blend /= max(dot(blend, 1.0), 0.000001);


		float4 alphaSource = 1;
		#if defined(_DISSOLVEALPHASOURCE_CUSTOM_MAP)

			alphaSource = ReadTriplanarTextureMap1(vertexPos, blend);

		#elif defined(_DISSOLVEALPHASOURCE_TWO_CUSTOM_MAPS)

			float4 t1 = ReadTriplanarTextureMap1(vertexPos, blend);
			float4 t2 = ReadTriplanarTextureMap2(vertexPos, blend);


			alphaSource = lerp((t1 * t2), (t1 + t2) * 0.5, VALUE_ALPHATEXTUREBLEND);

		#elif defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)

			float4 t1 = ReadTriplanarTextureMap1(vertexPos, blend);
			float4 t2 = ReadTriplanarTextureMap2(vertexPos, blend);
			float4 t3 = ReadTriplanarTextureMap3(vertexPos, blend);


			alphaSource = lerp((t1 * t2 * t3), (t1 + t2 + t3) / 3.0, VALUE_ALPHATEXTUREBLEND);

		#else		

			alphaSource = ReadTriplanarTextureMainMap(vertexPos * VALUE_MAIN_MAP_TILING * 0.1, blend).a;

		#endif



		#if defined(_ADDITIONALDISSOLVEMASK_XYZ_AXIS) || defined(_DISSOLVEMASK_PLANE) || defined(_DISSOLVEMASK_SPHERE) || defined(_DISSOLVEMASK_BOX) || defined(_DISSOLVEMASK_CYLINDER) || defined		(_DISSOLVEMASK_CONE)

			float noise = ((alphaSource.a - 0.5) * 2) * VALUE_NOISE_STRENGTH;

			alphaSource.a = ReadMaskValue(vertexPos, noise);

		#endif	


		return alphaSource;
	}
#endif

inline void DoDissolveClip(float4 alpha)
{
	#if defined(_ADDITIONALDISSOLVEMASK_XYZ_AXIS) || defined(_DISSOLVEMASK_PLANE) || defined(_DISSOLVEMASK_SPHERE) || defined(_DISSOLVEMASK_BOX) || defined(_DISSOLVEMASK_CYLINDER) || defined		(_DISSOLVEMASK_CONE)
		clip(alpha.a);
	#else
		clip(alpha.a - VALUE_CUTOFF * 1.01);
	#endif
}


float DoDissolveAlbedoEmission(float4 alpha, inout float3 albedo, inout float3 emission, inout float2 uv, float3 masterNodeColor)
{
	float retValue = 0;


	float dissolveEdgeSize = VALUE_EDGE_SIZE;


	#ifdef UNITY_PASS_META
		dissolveEdgeSize *= VALUE_GI_MULTIPLIER;
	#endif


	#if defined(_ADDITIONALDISSOLVEMASK_XYZ_AXIS) || defined(_DISSOLVEMASK_PLANE) || defined(_DISSOLVEMASK_SPHERE) || defined(_DISSOLVEMASK_BOX)  || defined(_DISSOLVEMASK_CYLINDER) || defined		(_DISSOLVEMASK_CONE)
		//Do nothing
	#else

		dissolveEdgeSize *= VALUE_CUTOFF < 0.1 ? (VALUE_CUTOFF * 10) : 1;

		alpha.a -= VALUE_CUTOFF;

	#endif	



	if (dissolveEdgeSize > 0 && dissolveEdgeSize > alpha.a)
	{
		float edgeGradient = saturate(alpha.a) * (1.0 / dissolveEdgeSize);


		float invertGradient = 1 - edgeGradient;
		uv += (lerp(alpha.rg, READ_MAINTEX(uv).rg, VALUE_EDGE_DISTORTION_SOURCE) - 0.5) * VALUE_EDGE_DISTORTION * invertGradient * invertGradient;

		float4 edgeColor = VALUE_EDGE_COLOR;



		float4 edgeTexture = 1;
		#if defined(_DISSOLVEEDGETEXTURESOURCE_MAIN_MAP)
		//#if (SHADER_TARGET < 30)
		//	edgeTexture = READ_MAINTEX(uv);
		//#else
			edgeTexture = READ_MAINTEX_LOD(uv, VALUE_EDGE_TEXTURE_MIPMAP);
			//#endif				

			edgeTexture.a = saturate(edgeTexture.a + VALUE_EDGETEXTUREALPHAOFFSET);

		#elif defined(_DISSOLVEEDGETEXTURESOURCE_GRADIENT) && !defined(_DISSOLVEMASK_BOX)

			float u = lerp(edgeGradient, 1 - edgeGradient, VALUE_EDGE_TEXTURE_REVERSE) + VALUE_EDGE_TEXTURE_OFFSET;

			edgeTexture = READ_TEXTURE_2D(VALUE_EDGE_TEXTURE, VALUE_EDGE_TEXTURE_SAMPLER, float2(lerp(u, VALUE_CUTOFF, VALUE_EDGE_TEXTURE_IS_DYNAMIC), 0.5), 1);

			edgeTexture.a = saturate(edgeTexture.a + VALUE_EDGETEXTUREALPHAOFFSET);

		#elif defined(_DISSOLVEEDGETEXTURESOURCE_CUSTOM)
		//#if (SHADER_TARGET < 30)
		//	edgeTexture = READ_TEXTURE_2D(VALUE_EDGE_TEXTURE, VALUE_EDGE_TEXTURE_SAMPLER, uv, 1);
		//#else
			edgeTexture = READ_TEXTURE_2D_LOD(VALUE_EDGE_TEXTURE, VALUE_EDGE_TEXTURE_SAMPLER, uv, VALUE_EDGE_TEXTURE_MIPMAP);
			//#endif

			edgeTexture.a = saturate(edgeTexture.a + VALUE_EDGETEXTUREALPHAOFFSET);
		#endif

		edgeColor *= edgeTexture;

		#ifdef DISSOLVE_SHADER_GRAPH
			edgeColor.rgb *= lerp(1, masterNodeColor.rgb, VALUE_COMBINE_WITH_MASTER_NODE_COLOR);
		#endif

			//Box mask always has solid edge
			#if !defined(_DISSOLVEMASK_BOX)
				float3 shape;
				shape.x = 1;
				shape.y = invertGradient;
				shape.z = invertGradient * invertGradient;

				edgeColor.a *= shape[(int)VALUE_EDGE_SHAPE];
			#endif




			albedo = edgeColor.rgb;


			#ifdef UNITY_PASS_META

				#if defined(_ADDITIONALDISSOLVEMASK_XYZ_AXIS) || defined(_DISSOLVEMASK_PLANE) || defined(_DISSOLVEMASK_SPHERE) || defined(_DISSOLVEMASK_BOX)  || defined(_DISSOLVEMASK_CYLINDER) ||		defined (_DISSOLVEMASK_CONE)

				#else
					edgeColor *= VALUE_CUTOFF >= 0.99 ? 0 : 1;
				#endif

				emission = edgeColor.rgb * (1 + VALUE_EDGE_COLOR_INTENSITY) * VALUE_GI_MULTIPLIER;
			#else
				emission = edgeColor.rgb * VALUE_EDGE_COLOR_INTENSITY;
			#endif


			retValue = saturate(edgeColor.a);
		}


		#ifdef UNITY_PASS_META
			if (alpha.a <= 0)
				emission = const_zero;
		#endif


		return retValue;
	}

	#ifdef DISSOLVE_LEGACY_RENDER_PIPELIN
	half4 DoOutputForward(half4 output, half alphaFromSurface)
	{
		#if defined(_ALPHABLEND_ON) || defined(_ALPHAPREMULTIPLY_ON)
			output.a = alphaFromSurface;
		#else
			UNITY_OPAQUE_ALPHA(output.a);
		#endif

		return output;
	}
	#endif




	#define ADVANCED_DISSOLVE_DATA(coord) float4 dissolveUV : TEXCOORD##coord;

	#ifdef _DISSOLVEMAPPINGTYPE_TRIPLANAR
		#define ADVANCED_DISSOLVE_INIT_DATA(positionCS, texcoord0, texcoord1, output) output.dissolveUV = 0;
	#else
		#define ADVANCED_DISSOLVE_INIT_DATA(positionCS, texcoord0, texcoord1, output) DissolveVertex2Fragment(positionCS, texcoord0.xy, texcoord1.xy, output.dissolveUV);
	#endif

	#ifdef DISSOLVE_SHADER_GRAPH
		float4 AdvancedDissolveGetAlpha(float2 texcoord1, float2 texcoord2, float3 positionWS, float3 normalWS, float fragmentAlpha)
		{
			#ifdef _DISSOLVEMAPPINGTYPE_TRIPLANAR
				float4 dissolveAlpha = ReadDissolveAlpha_Triplanar(positionWS, normalWS);
			#else

				#ifdef _DISSOLVEMAPPINGTYPE_SCREEN_SPACE
					float4 dissolveData = ComputeScreenPos(mul(GetWorldToHClipMatrix(), float4(positionWS.xyz, 1)), _ProjectionParams.x);
				#else
					float4 dissolveData = VALUE_UVSET == 0 ? float4(texcoord1.xy, 0, 0) : float4(texcoord2.xy, 0, 0);
				#endif		

				float4 dissolveAlpha = ReadDissolveAlpha(texcoord1, dissolveData, positionWS);

			#endif


			#if defined(_ADDITIONALDISSOLVEMASK_XYZ_AXIS) || defined(_DISSOLVEMASK_PLANE) || defined(_DISSOLVEMASK_SPHERE) || defined(_DISSOLVEMASK_BOX) || defined(_DISSOLVEMASK_CYLINDER) || defined		(_DISSOLVEMASK_CONE)
				dissolveAlpha.a -= lerp(0, fragmentAlpha, VALUE_COMBINE_WITH_MASTER_NODE_ALPHA);
			#else
				dissolveAlpha.a *= lerp(1, fragmentAlpha, VALUE_COMBINE_WITH_MASTER_NODE_ALPHA);
			#endif


			return dissolveAlpha;
		}
	#else
		float4 AdvancedDissolveGetAlpha(float2 texcoord0, float3 positionWS, float3 normalWS, float4 dissolveUV)
		{
			#ifdef _DISSOLVEMAPPINGTYPE_TRIPLANAR
				return ReadDissolveAlpha_Triplanar(positionWS, normalWS);
			#else
				return ReadDissolveAlpha(texcoord0, dissolveUV, positionWS);
			#endif
		}
	#endif

	struct DissolveStruct
	{
		float3 albedo;
		float3 emission;
		float blend;
	};

	DissolveStruct DissolveClip(float2 uv, float4 screenUV, float3 positionWS, float3 N)
	{
		DissolveStruct result = (DissolveStruct)0;
		float4 dissolveUV = 0;

		#if defined(_DISSOLVEMAPPINGTYPE_SCREEN_SPACE)
			dissolveUV = screenUV;
		#else
			#if defined(_DISSOLVEALPHASOURCE_CUSTOM_MAP) || defined(_DISSOLVEALPHASOURCE_TWO_CUSTOM_MAPS) || defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)
				dissolveUV = float4(uv, 0, 0);
			#endif
		#endif

		float2 time_uv = uv;
		time_uv.x = frac(time_uv.x + _Time.r);
		//dissolveUV.x = (dissolveUV.x + _Time.r);

		float4 alpha = AdvancedDissolveGetAlpha(time_uv, positionWS, N, dissolveUV);

		DoDissolveClip(alpha);

		result.blend = DoDissolveAlbedoEmission(alpha, result.albedo, result.emission, time_uv, 0);

		return result;
	}

	DissolveStruct DissolveClip(float4 uv, float4 screenUV, float3 positionWS, float3 N)
	{
		DissolveStruct result = (DissolveStruct)0;
		float4 dissolveUV = 0;

		#if defined(_DISSOLVEMAPPINGTYPE_SCREEN_SPACE)
			dissolveUV = screenUV;
		#else
			#if defined(_DISSOLVEALPHASOURCE_CUSTOM_MAP) || defined(_DISSOLVEALPHASOURCE_TWO_CUSTOM_MAPS) || defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)
				float2 texUV = VALUE_UVSET == 0 ? uv.xy : uv.wz;
				dissolveUV = float4(texUV.xy, 0, 0);
			#endif
		#endif

		float2 time_uv = uv;
		time_uv.x = frac(time_uv.x + _Time.r);
		//dissolveUV.x = (dissolveUV.x + _Time.r);

		float4 alpha = AdvancedDissolveGetAlpha(time_uv, positionWS, N, dissolveUV);

		DoDissolveClip(alpha);

		result.blend = DoDissolveAlbedoEmission(alpha, result.albedo, result.emission, time_uv, 0);

		return result;
	}

			/*ase_pragma*/
			struct appdata {
				float4 vertex : POSITION;
				float4 tangent : TANGENT;
				float3 normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				/*ase_vdata:p=p;t=t;n=n;uv1=tc1.xyzw;uv2=tc2.xyzw*/
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
			struct v2f {
				#if UNITY_VERSION >= 201810
					UNITY_POSITION(pos);
				#else
					float4 pos : SV_POSITION;
				#endif
				#if UNITY_VERSION >= 201810 && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					UNITY_LIGHTING_COORDS(1,2)
				#elif defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if UNITY_VERSION >= 201710
						UNITY_SHADOW_COORDS(1)
					#else
						SHADOW_COORDS(1)
					#endif
				#endif
				#ifdef ASE_FOG
					UNITY_FOG_COORDS(3)
				#endif
				float4 tSpace0 : TEXCOORD5;
				float4 tSpace1 : TEXCOORD6;
				float4 tSpace2 : TEXCOORD7;
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
				float4 screenPos : TEXCOORD8;
				#endif
				/*ase_interp(9,):sp=sp.xyzw;sc=tc1;wn.xyz=tc5.xyz;wt.xyz=tc6.xyz;wbt.xyz=tc7.xyz;wp.x=tc5.w;wp.y=tc6.w;wp.z=tc7.w;spu=tc8*/
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			/*ase_globals*/
	
			/*ase_funcs*/

			v2f VertexFunction (appdata v /*ase_vert_input*/ ) {
				UNITY_SETUP_INSTANCE_ID(v);
				v2f o;
				UNITY_INITIALIZE_OUTPUT(v2f,o);
				UNITY_TRANSFER_INSTANCE_ID(v,o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				/*ase_vert_code:v=appdata;o=v2f*/
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = /*ase_vert_out:Vertex Offset;Float3;11;-1;_Vertex*/defaultVertexValue/*end*/;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif
				v.vertex.w = 1;
				v.normal = /*ase_vert_out:Vertex Normal;Float3;12;-1;_VertexNormal*/v.normal/*end*/;
				v.tangent = /*ase_vert_out:Vertex Tangent;Float4;13;-1;_VertexTangent*/v.tangent/*end*/;

				o.pos = UnityObjectToClipPos(v.vertex);
				float3 worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
				fixed3 worldNormal = UnityObjectToWorldNormal(v.normal);
				fixed3 worldTangent = UnityObjectToWorldDir(v.tangent.xyz);
				fixed tangentSign = v.tangent.w * unity_WorldTransformParams.w;
				fixed3 worldBinormal = cross(worldNormal, worldTangent) * tangentSign;
				o.tSpace0 = float4(worldTangent.x, worldBinormal.x, worldNormal.x, worldPos.x);
				o.tSpace1 = float4(worldTangent.y, worldBinormal.y, worldNormal.y, worldPos.y);
				o.tSpace2 = float4(worldTangent.z, worldBinormal.z, worldNormal.z, worldPos.z);

				#if UNITY_VERSION >= 201810 && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					UNITY_TRANSFER_LIGHTING(o, v.texcoord1.xy);
				#elif defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if UNITY_VERSION >= 201710
						UNITY_TRANSFER_SHADOW(o, v.texcoord1.xy);
					#else
						TRANSFER_SHADOW(o);
					#endif
				#endif

				#ifdef ASE_FOG
					UNITY_TRANSFER_FOG(o,o.pos);
				#endif
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
					o.screenPos = ComputeScreenPos(o.pos);
				#endif
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float4 tangent : TANGENT;
				float3 normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				/*ase_vcontrol*/
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( appdata v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.tangent = v.tangent;
				o.normal = v.normal;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				/*ase_control_code:v=appdata;o=VertexControl*/
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = /*ase_inline_begin*/_TessValue/*ase_inline_end*/; float tessMin = /*ase_inline_begin*/_TessMin/*ase_inline_end*/; float tessMax = /*ase_inline_begin*/_TessMax/*ase_inline_end*/;
				float edgeLength = /*ase_inline_begin*/_TessEdgeLength/*ase_inline_end*/; float tessMaxDisp = /*ase_inline_begin*/_TessMaxDisp/*ase_inline_end*/;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, UNITY_MATRIX_M, _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, UNITY_MATRIX_M, _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, UNITY_MATRIX_M, _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			v2f DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				appdata o = (appdata) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.tangent = patch[0].tangent * bary.x + patch[1].tangent * bary.y + patch[2].tangent * bary.z;
				o.normal = patch[0].normal * bary.x + patch[1].normal * bary.y + patch[2].normal * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				/*ase_domain_code:patch=VertexControl;o=appdata;bary=SV_DomainLocation*/
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].normal * (dot(o.vertex.xyz, patch[i].normal) - dot(patch[i].vertex.xyz, patch[i].normal));
				float phongStrength = /*ase_inline_begin*/_TessPhongStrength/*ase_inline_end*/;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			v2f vert ( appdata v )
			{
				return VertexFunction( v );
			}
			#endif

			fixed4 frag ( v2f IN /*ase_frag_input*/
				#ifdef _DEPTHOFFSET_ON
				, out float outputDepth : SV_Depth
				#endif
				) : SV_Target 
			{
				UNITY_SETUP_INSTANCE_ID(IN);

				#ifdef LOD_FADE_CROSSFADE
					UNITY_APPLY_DITHER_CROSSFADE(IN.pos.xy);
				#endif

				#if defined(_SPECULAR_SETUP)
					SurfaceOutputStandardSpecular o = (SurfaceOutputStandardSpecular)0;
				#else
					SurfaceOutputStandard o = (SurfaceOutputStandard)0;
				#endif
				/*ase_local_var:wt*/float3 WorldTangent = float3(IN.tSpace0.x,IN.tSpace1.x,IN.tSpace2.x);
				/*ase_local_var:wbt*/float3 WorldBiTangent = float3(IN.tSpace0.y,IN.tSpace1.y,IN.tSpace2.y);
				/*ase_local_var:wn*/float3 WorldNormal = float3(IN.tSpace0.z,IN.tSpace1.z,IN.tSpace2.z);
				/*ase_local_var:wp*/float3 worldPos = float3(IN.tSpace0.w,IN.tSpace1.w,IN.tSpace2.w);
				/*ase_local_var:wvd*/float3 worldViewDir = normalize(UnityWorldSpaceViewDir(worldPos));
				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					UNITY_LIGHT_ATTENUATION(atten, IN, worldPos)
				#else
					/*ase_local_var:sc*/half atten = 1;
				#endif
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
				/*ase_local_var:spu*/float4 ScreenPos = IN.screenPos;
				#endif


				/*ase_frag_code:IN=v2f*/
				o.Albedo = /*ase_frag_out:Albedo;Float3;0;-1;_Albedo*/fixed3( 0.5, 0.5, 0.5 )/*end*/;
				o.Normal = /*ase_frag_out:Normal;Float3;1;-1;_Normal*/fixed3( 0, 0, 1 )/*end*/;
				o.Emission = /*ase_frag_out:Emission;Float3;2;-1;_Emission*/half3( 0, 0, 0 )/*end*/;
				#if defined(_SPECULAR_SETUP)
					o.Specular = /*ase_frag_out:Specular;Float3;3;-1;_Specular*/fixed3( 0, 0, 0 )/*end*/;
				#else
					o.Metallic = /*ase_frag_out:Metallic;Float;4;-1;_Metallic*/0/*end*/;
				#endif
				o.Smoothness = /*ase_frag_out:Smoothness;Float;5;-1;_Smoothness*/0/*end*/;
				o.Occlusion = /*ase_frag_out:Occlusion;Float;6;-1;_Occlusion*/1/*end*/;
				o.Alpha = /*ase_frag_out:Alpha;Float;7;-1;_Alpha*/1/*end*/;
				float AlphaClipThreshold = /*ase_frag_out:Alpha Clip Threshold;Float;8;-1;_AlphaClip*/0.5/*end*/;
				float3 Transmission = /*ase_frag_out:Transmission;Float3;9;-1;_Transmission*/1/*end*/;
				float3 Translucency = /*ase_frag_out:Translucency;Float3;10;-1;_Translucency*/1/*end*/;		

				#ifdef _ALPHATEST_ON
					clip( o.Alpha - AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
					outputDepth = IN.pos.z;
				#endif

				#ifndef USING_DIRECTIONAL_LIGHT
					fixed3 lightDir = normalize(UnityWorldSpaceLightDir(worldPos));
				#else
					fixed3 lightDir = _WorldSpaceLightPos0.xyz;
				#endif

				fixed4 c = 0;
				float3 worldN;
				worldN.x = dot(IN.tSpace0.xyz, o.Normal);
				worldN.y = dot(IN.tSpace1.xyz, o.Normal);
				worldN.z = dot(IN.tSpace2.xyz, o.Normal);
				worldN = normalize(worldN);
				o.Normal = worldN;

				DissolveStruct dissolve = DissolveClip(/*ase_frag_out:Texcoord;Float4;14;-1;_Texcoord*/fixed4(0, 0, 0, 0)/*end*/, float4(0, 0, 0, 0), worldPos, worldN);

				UnityGI gi;
				UNITY_INITIALIZE_OUTPUT(UnityGI, gi);
				gi.indirect.diffuse = 0;
				gi.indirect.specular = 0;
				gi.light.color = _LightColor0.rgb;
				gi.light.dir = lightDir;
				gi.light.color *= atten;

				#if defined(_SPECULAR_SETUP)
					c += LightingStandardSpecular( o, worldViewDir, gi );
				#else
					c += LightingStandard( o, worldViewDir, gi );
				#endif
				
				#ifdef _TRANSMISSION_ASE
				{
					float shadow = /*ase_inline_begin*/_TransmissionShadow/*ase_inline_end*/;
					#ifdef DIRECTIONAL
						float3 lightAtten = lerp( _LightColor0.rgb, gi.light.color, shadow );
					#else
						float3 lightAtten = gi.light.color;
					#endif
					half3 transmission = max(0 , -dot(o.Normal, gi.light.dir)) * lightAtten * Transmission;
					c.rgb += o.Albedo * transmission;
				}
				#endif

				#ifdef _TRANSLUCENCY_ASE
				{
					float shadow = /*ase_inline_begin*/_TransShadow/*ase_inline_end*/;
					float normal = /*ase_inline_begin*/_TransNormal/*ase_inline_end*/;
					float scattering = /*ase_inline_begin*/_TransScattering/*ase_inline_end*/;
					float direct = /*ase_inline_begin*/_TransDirect/*ase_inline_end*/;
					float ambient = /*ase_inline_begin*/_TransAmbient/*ase_inline_end*/;
					float strength = /*ase_inline_begin*/_TransStrength/*ase_inline_end*/;

					#ifdef DIRECTIONAL
						float3 lightAtten = lerp( _LightColor0.rgb, gi.light.color, shadow );
					#else
						float3 lightAtten = gi.light.color;
					#endif
					half3 lightDir = gi.light.dir + o.Normal * normal;
					half transVdotL = pow( saturate( dot( worldViewDir, -lightDir ) ), scattering );
					half3 translucency = lightAtten * (transVdotL * direct + gi.indirect.diffuse * ambient) * Translucency;
					c.rgb += o.Albedo * translucency * strength;
				}
				#endif

				//#ifdef _REFRACTION_ASE
				//	float4 projScreenPos = ScreenPos / ScreenPos.w;
				//	float3 refractionOffset = ( RefractionIndex - 1.0 ) * mul( UNITY_MATRIX_V, WorldNormal ).xyz * ( 1.0 - dot( WorldNormal, WorldViewDirection ) );
				//	projScreenPos.xy += refractionOffset.xy;
				//	float3 refraction = UNITY_SAMPLE_SCREENSPACE_TEXTURE( _GrabTexture, projScreenPos ) * RefractionColor;
				//	color.rgb = lerp( refraction, color.rgb, color.a );
				//	color.a = 1;
				//#endif

				#ifdef ASE_FOG
					UNITY_APPLY_FOG(IN.fogCoord, c);
				#endif
				return c;
			}
			ENDCG
		}

		/*ase_pass*/
		Pass
		{
			/*ase_hide_pass*/
			Name "Deferred"
			Tags { "LightMode"="Deferred" }

			AlphaToMask Off

			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma target 3.0
			#pragma exclude_renderers nomrt
			#pragma skip_variants FOG_LINEAR FOG_EXP FOG_EXP2
			#pragma multi_compile_prepassfinal
			#ifndef UNITY_PASS_DEFERRED
				#define UNITY_PASS_DEFERRED
			#endif
			#include "HLSLSupport.cginc"
			#if !defined( UNITY_INSTANCED_LOD_FADE )
				#define UNITY_INSTANCED_LOD_FADE
			#endif
			#if !defined( UNITY_INSTANCED_SH )
				#define UNITY_INSTANCED_SH
			#endif
			#if !defined( UNITY_INSTANCED_LIGHTMAPSTS )
				#define UNITY_INSTANCED_LIGHTMAPSTS
			#endif
			#include "UnityShaderVariables.cginc"
			#include "UnityCG.cginc"
			#include "Lighting.cginc"
			#include "UnityPBSLighting.cginc"

			#pragma shader_feature_local _ _DISSOLVEGLOBALCONTROL_MASK_ONLY _DISSOLVEGLOBALCONTROL_MASK_AND_EDGE _DISSOLVEGLOBALCONTROL_ALL
			#pragma shader_feature_local _ _DISSOLVEMAPPINGTYPE_TRIPLANAR _DISSOLVEMAPPINGTYPE_SCREEN_SPACE
			#pragma shader_feature_local _ _DISSOLVEALPHASOURCE_CUSTOM_MAP _DISSOLVEALPHASOURCE_TWO_CUSTOM_MAPS _DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS
			#pragma multi_compile_local _  _ADDITIONALDISSOLVEMASK_XYZ_AXIS
			#pragma multi_compile_local _  _DISSOLVEMASK_PLANE _DISSOLVEMASK_BOX _DISSOLVEMASK_CONE
			#pragma shader_feature_local _ _DISSOLVEEDGETEXTURESOURCE_GRADIENT _DISSOLVEEDGETEXTURESOURCE_MAIN_MAP _DISSOLVEEDGETEXTURESOURCE_CUSTOM
			#pragma shader_feature_local _ _DISSOLVEMASKCOUNT_TWO _DISSOLVEMASKCOUNT_THREE _DISSOLVEMASKCOUNT_FOUR

			#define DISSOLVE_LEGACY_RENDER_PIPELIN
			#define DISSOLVE_LEGACY_MAINTEX
			#define DISSOLVE_LEGACY_TEXTURE_SAMPLE

			/*ase_pragma*/
			struct appdata {
				float4 vertex : POSITION;
				float4 tangent : TANGENT;
				float3 normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				/*ase_vdata:p=p;t=t;n=n;uv1=tc1.xyzw;uv2=tc2.xyzw*/
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct v2f {
				#if UNITY_VERSION >= 201810
					UNITY_POSITION(pos);
				#else
					float4 pos : SV_POSITION;
				#endif
				float4 lmap : TEXCOORD2;
				#ifndef LIGHTMAP_ON
					#if UNITY_SHOULD_SAMPLE_SH && !UNITY_SAMPLE_FULL_SH_PER_PIXEL
						half3 sh : TEXCOORD3;
					#endif
				#else
					#ifdef DIRLIGHTMAP_OFF
						float4 lmapFadePos : TEXCOORD4;
					#endif
				#endif
				float4 tSpace0 : TEXCOORD5;
				float4 tSpace1 : TEXCOORD6;
				float4 tSpace2 : TEXCOORD7;
				/*ase_interp(8,):sp=sp.xyzw;wn.xyz=tc5.xyz;wt.xyz=tc6.xyz;wbt.xyz=tc7.xyz;wp.x=tc5.w;wp.y=tc6.w;wp.z=tc7.w*/
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			#ifdef LIGHTMAP_ON
			float4 unity_LightmapFade;
			#endif
			fixed4 unity_Ambient;
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			/*ase_globals*/
	
			/*ase_funcs*/

			v2f VertexFunction (appdata v /*ase_vert_input*/ ) {
				UNITY_SETUP_INSTANCE_ID(v);
				v2f o;
				UNITY_INITIALIZE_OUTPUT(v2f,o);
				UNITY_TRANSFER_INSTANCE_ID(v,o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				/*ase_vert_code:v=appdata;o=v2f*/
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = /*ase_vert_out:Vertex Offset;Float3;10;-1;_Vertex*/defaultVertexValue/*end*/;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif
				v.vertex.w = 1;
				v.normal = /*ase_vert_out:Vertex Normal;Float3;11;-1;_VertexNormal*/v.normal/*end*/;
				v.tangent = /*ase_vert_out:Vertex Tangent;Float4;12;-1;_VertexTangent*/v.tangent/*end*/;

				o.pos = UnityObjectToClipPos(v.vertex);
				float3 worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
				fixed3 worldNormal = UnityObjectToWorldNormal(v.normal);
				fixed3 worldTangent = UnityObjectToWorldDir(v.tangent.xyz);
				fixed tangentSign = v.tangent.w * unity_WorldTransformParams.w;
				fixed3 worldBinormal = cross(worldNormal, worldTangent) * tangentSign;
				o.tSpace0 = float4(worldTangent.x, worldBinormal.x, worldNormal.x, worldPos.x);
				o.tSpace1 = float4(worldTangent.y, worldBinormal.y, worldNormal.y, worldPos.y);
				o.tSpace2 = float4(worldTangent.z, worldBinormal.z, worldNormal.z, worldPos.z);

				#ifdef DYNAMICLIGHTMAP_ON
					o.lmap.zw = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
				#else
					o.lmap.zw = 0;
				#endif
				#ifdef LIGHTMAP_ON
					o.lmap.xy = v.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
					#ifdef DIRLIGHTMAP_OFF
						o.lmapFadePos.xyz = (mul(unity_ObjectToWorld, v.vertex).xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w;
						o.lmapFadePos.w = (-UnityObjectToViewPos(v.vertex).z) * (1.0 - unity_ShadowFadeCenterAndType.w);
					#endif
				#else
					o.lmap.xy = 0;
					#if UNITY_SHOULD_SAMPLE_SH && !UNITY_SAMPLE_FULL_SH_PER_PIXEL
						o.sh = 0;
						o.sh = ShadeSHPerVertex (worldNormal, o.sh);
					#endif
				#endif
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float4 tangent : TANGENT;
				float3 normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				/*ase_vcontrol*/
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( appdata v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.tangent = v.tangent;
				o.normal = v.normal;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				/*ase_control_code:v=appdata;o=VertexControl*/
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = /*ase_inline_begin*/_TessValue/*ase_inline_end*/; float tessMin = /*ase_inline_begin*/_TessMin/*ase_inline_end*/; float tessMax = /*ase_inline_begin*/_TessMax/*ase_inline_end*/;
				float edgeLength = /*ase_inline_begin*/_TessEdgeLength/*ase_inline_end*/; float tessMaxDisp = /*ase_inline_begin*/_TessMaxDisp/*ase_inline_end*/;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, UNITY_MATRIX_M, _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, UNITY_MATRIX_M, _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, UNITY_MATRIX_M, _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			v2f DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				appdata o = (appdata) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.tangent = patch[0].tangent * bary.x + patch[1].tangent * bary.y + patch[2].tangent * bary.z;
				o.normal = patch[0].normal * bary.x + patch[1].normal * bary.y + patch[2].normal * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				/*ase_domain_code:patch=VertexControl;o=appdata;bary=SV_DomainLocation*/
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].normal * (dot(o.vertex.xyz, patch[i].normal) - dot(patch[i].vertex.xyz, patch[i].normal));
				float phongStrength = /*ase_inline_begin*/_TessPhongStrength/*ase_inline_end*/;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			v2f vert ( appdata v )
			{
				return VertexFunction( v );
			}
			#endif

			void frag (v2f IN /*ase_frag_input*/
				, out half4 outGBuffer0 : SV_Target0
				, out half4 outGBuffer1 : SV_Target1
				, out half4 outGBuffer2 : SV_Target2
				, out half4 outEmission : SV_Target3
				#if defined(SHADOWS_SHADOWMASK) && (UNITY_ALLOWED_MRT_COUNT > 4)
				, out half4 outShadowMask : SV_Target4
				#endif
				#ifdef _DEPTHOFFSET_ON
				, out float outputDepth : SV_Depth
				#endif
			) 
			{
				UNITY_SETUP_INSTANCE_ID(IN);

				#ifdef LOD_FADE_CROSSFADE
					UNITY_APPLY_DITHER_CROSSFADE(IN.pos.xy);
				#endif

				#if defined(_SPECULAR_SETUP)
					SurfaceOutputStandardSpecular o = (SurfaceOutputStandardSpecular)0;
				#else
					SurfaceOutputStandard o = (SurfaceOutputStandard)0;
				#endif
				/*ase_local_var:wt*/float3 WorldTangent = float3(IN.tSpace0.x,IN.tSpace1.x,IN.tSpace2.x);
				/*ase_local_var:wbt*/float3 WorldBiTangent = float3(IN.tSpace0.y,IN.tSpace1.y,IN.tSpace2.y);
				/*ase_local_var:wn*/float3 WorldNormal = float3(IN.tSpace0.z,IN.tSpace1.z,IN.tSpace2.z);
				/*ase_local_var:wp*/float3 worldPos = float3(IN.tSpace0.w,IN.tSpace1.w,IN.tSpace2.w);
				/*ase_local_var:wvd*/float3 worldViewDir = normalize(UnityWorldSpaceViewDir(worldPos));
				/*ase_local_var:sc*/half atten = 1;

				/*ase_frag_code:IN=v2f*/
				o.Albedo = /*ase_frag_out:Albedo;Float3;0;-1;_Albedo*/fixed3( 0.5, 0.5, 0.5 )/*end*/;
				o.Normal = /*ase_frag_out:Normal;Float3;1;-1;_Normal*/fixed3( 0, 0, 1 )/*end*/;
				o.Emission = /*ase_frag_out:Emission;Float3;2;-1;_Emission*/half3( 0, 0, 0 )/*end*/;
				#if defined(_SPECULAR_SETUP)
					o.Specular = /*ase_frag_out:Specular;Float3;3;-1;_Specular*/fixed3( 0, 0, 0 )/*end*/;
				#else
					o.Metallic = /*ase_frag_out:Metallic;Float;4;-1;_Metallic*/0/*end*/;
				#endif
				o.Smoothness = /*ase_frag_out:Smoothness;Float;5;-1;_Smoothness*/0/*end*/;
				o.Occlusion = /*ase_frag_out:Occlusion;Float;6;-1;_Occlusion*/1/*end*/;
				o.Alpha = /*ase_frag_out:Alpha;Float;7;-1;_Alpha*/1/*end*/;
				float AlphaClipThreshold = /*ase_frag_out:Alpha Clip Threshold;Float;8;-1;_AlphaClip*/0.5/*end*/;
				float3 BakedGI = /*ase_frag_out:Baked GI;Float3;9;-1;_BakedGI*/0/*end*/;

				#ifdef _ALPHATEST_ON
					clip( o.Alpha - AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
					outputDepth = IN.pos.z;
				#endif

				#ifndef USING_DIRECTIONAL_LIGHT
					fixed3 lightDir = normalize(UnityWorldSpaceLightDir(worldPos));
				#else
					fixed3 lightDir = _WorldSpaceLightPos0.xyz;
				#endif

				float3 worldN;
				worldN.x = dot(IN.tSpace0.xyz, o.Normal);
				worldN.y = dot(IN.tSpace1.xyz, o.Normal);
				worldN.z = dot(IN.tSpace2.xyz, o.Normal);
				worldN = normalize(worldN);
				o.Normal = worldN;

				UnityGI gi;
				UNITY_INITIALIZE_OUTPUT(UnityGI, gi);
				gi.indirect.diffuse = 0;
				gi.indirect.specular = 0;
				gi.light.color = 0;
				gi.light.dir = half3(0,1,0);

				UnityGIInput giInput;
				UNITY_INITIALIZE_OUTPUT(UnityGIInput, giInput);
				giInput.light = gi.light;
				giInput.worldPos = worldPos;
				giInput.worldViewDir = worldViewDir;
				giInput.atten = atten;
				#if defined(LIGHTMAP_ON) || defined(DYNAMICLIGHTMAP_ON)
					giInput.lightmapUV = IN.lmap;
				#else
					giInput.lightmapUV = 0.0;
				#endif
				#if UNITY_SHOULD_SAMPLE_SH && !UNITY_SAMPLE_FULL_SH_PER_PIXEL
					giInput.ambient = IN.sh;
				#else
					giInput.ambient.rgb = 0.0;
				#endif
				giInput.probeHDR[0] = unity_SpecCube0_HDR;
				giInput.probeHDR[1] = unity_SpecCube1_HDR;
				#if defined(UNITY_SPECCUBE_BLENDING) || defined(UNITY_SPECCUBE_BOX_PROJECTION)
					giInput.boxMin[0] = unity_SpecCube0_BoxMin;
				#endif
				#ifdef UNITY_SPECCUBE_BOX_PROJECTION
					giInput.boxMax[0] = unity_SpecCube0_BoxMax;
					giInput.probePosition[0] = unity_SpecCube0_ProbePosition;
					giInput.boxMax[1] = unity_SpecCube1_BoxMax;
					giInput.boxMin[1] = unity_SpecCube1_BoxMin;
					giInput.probePosition[1] = unity_SpecCube1_ProbePosition;
				#endif

				#if defined(_SPECULAR_SETUP)
					LightingStandardSpecular_GI( o, giInput, gi );
				#else
					LightingStandard_GI( o, giInput, gi );
				#endif

				#ifdef ASE_BAKEDGI
					gi.indirect.diffuse = BakedGI;
				#endif

				#if UNITY_SHOULD_SAMPLE_SH && !defined(LIGHTMAP_ON) && defined(ASE_NO_AMBIENT)
					gi.indirect.diffuse = 0;
				#endif

				#if defined(_SPECULAR_SETUP)
					outEmission = LightingStandardSpecular_Deferred( o, worldViewDir, gi, outGBuffer0, outGBuffer1, outGBuffer2 );
				#else
					outEmission = LightingStandard_Deferred( o, worldViewDir, gi, outGBuffer0, outGBuffer1, outGBuffer2 );
				#endif

				#if defined(SHADOWS_SHADOWMASK) && (UNITY_ALLOWED_MRT_COUNT > 4)
					outShadowMask = UnityGetRawBakedOcclusions (IN.lmap.xy, float3(0, 0, 0));
				#endif
				#ifndef UNITY_HDR_ON
					outEmission.rgb = exp2(-outEmission.rgb);
				#endif
			}
			ENDCG
		}

		/*ase_pass*/
		Pass
		{
			/*ase_hide_pass*/
			Name "Meta"
			Tags { "LightMode"="Meta" }
			Cull Off

			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma skip_variants FOG_LINEAR FOG_EXP FOG_EXP2
			#pragma shader_feature_local EDITOR_VISUALIZATION
			#ifndef UNITY_PASS_META
				#define UNITY_PASS_META
			#endif
			#include "HLSLSupport.cginc"
			#if !defined( UNITY_INSTANCED_LOD_FADE )
				#define UNITY_INSTANCED_LOD_FADE
			#endif
			#if !defined( UNITY_INSTANCED_SH )
				#define UNITY_INSTANCED_SH
			#endif
			#if !defined( UNITY_INSTANCED_LIGHTMAPSTS )
				#define UNITY_INSTANCED_LIGHTMAPSTS
			#endif
			#include "UnityShaderVariables.cginc"
			#include "UnityCG.cginc"
			#include "Lighting.cginc"
			#include "UnityPBSLighting.cginc"
			#include "UnityMetaPass.cginc"
			
			/*ase_pragma*/
			struct appdata {
				float4 vertex : POSITION;
				float4 tangent : TANGENT;
				float3 normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				/*ase_vdata:p=p;t=t;n=n;uv1=tc1.xyzw;uv2=tc2.xyzw*/
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
			struct v2f {
				#if UNITY_VERSION >= 201810
					UNITY_POSITION(pos);
				#else
					float4 pos : SV_POSITION;
				#endif
				#ifdef EDITOR_VISUALIZATION
					float2 vizUV : TEXCOORD1;
					float4 lightCoord : TEXCOORD2;
				#endif
				/*ase_interp(3,):sp=sp.xyzw*/
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			/*ase_globals*/
	
			/*ase_funcs*/

			v2f VertexFunction (appdata v /*ase_vert_input*/ ) {
				UNITY_SETUP_INSTANCE_ID(v);
				v2f o;
				UNITY_INITIALIZE_OUTPUT(v2f,o);
				UNITY_TRANSFER_INSTANCE_ID(v,o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				/*ase_vert_code:v=appdata;o=v2f*/
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = /*ase_vert_out:Vertex Offset;Float3;4;-1;_Vertex*/defaultVertexValue/*end*/;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif
				v.vertex.w = 1;
				v.normal = /*ase_vert_out:Vertex Normal;Float3;5;-1;_VertexNormal*/v.normal/*end*/;
				v.tangent = /*ase_vert_out:Vertex Tangent;Float4;6;-1;_VertexTangent*/v.tangent/*end*/;

				#ifdef EDITOR_VISUALIZATION
					o.vizUV = 0;
					o.lightCoord = 0;
					if (unity_VisualizationMode == EDITORVIZ_TEXTURE)
						o.vizUV = UnityMetaVizUV(unity_EditorViz_UVIndex, v.texcoord.xy, v.texcoord1.xy, v.texcoord2.xy, unity_EditorViz_Texture_ST);
					else if (unity_VisualizationMode == EDITORVIZ_SHOWLIGHTMASK)
					{
						o.vizUV = v.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
						o.lightCoord = mul(unity_EditorViz_WorldToLight, mul(unity_ObjectToWorld, float4(v.vertex.xyz, 1)));
					}
				#endif

				o.pos = UnityMetaVertexPosition(v.vertex, v.texcoord1.xy, v.texcoord2.xy, unity_LightmapST, unity_DynamicLightmapST);

				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float4 tangent : TANGENT;
				float3 normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				/*ase_vcontrol*/
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( appdata v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.tangent = v.tangent;
				o.normal = v.normal;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				/*ase_control_code:v=appdata;o=VertexControl*/
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = /*ase_inline_begin*/_TessValue/*ase_inline_end*/; float tessMin = /*ase_inline_begin*/_TessMin/*ase_inline_end*/; float tessMax = /*ase_inline_begin*/_TessMax/*ase_inline_end*/;
				float edgeLength = /*ase_inline_begin*/_TessEdgeLength/*ase_inline_end*/; float tessMaxDisp = /*ase_inline_begin*/_TessMaxDisp/*ase_inline_end*/;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, UNITY_MATRIX_M, _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, UNITY_MATRIX_M, _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, UNITY_MATRIX_M, _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			v2f DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				appdata o = (appdata) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.tangent = patch[0].tangent * bary.x + patch[1].tangent * bary.y + patch[2].tangent * bary.z;
				o.normal = patch[0].normal * bary.x + patch[1].normal * bary.y + patch[2].normal * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				/*ase_domain_code:patch=VertexControl;o=appdata;bary=SV_DomainLocation*/
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].normal * (dot(o.vertex.xyz, patch[i].normal) - dot(patch[i].vertex.xyz, patch[i].normal));
				float phongStrength = /*ase_inline_begin*/_TessPhongStrength/*ase_inline_end*/;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			v2f vert ( appdata v )
			{
				return VertexFunction( v );
			}
			#endif

			fixed4 frag (v2f IN /*ase_frag_input*/
				#ifdef _DEPTHOFFSET_ON
				, out float outputDepth : SV_Depth
				#endif
				) : SV_Target 
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				
				#ifdef LOD_FADE_CROSSFADE
					UNITY_APPLY_DITHER_CROSSFADE(IN.pos.xy);
				#endif

				#if defined(_SPECULAR_SETUP)
					SurfaceOutputStandardSpecular o = (SurfaceOutputStandardSpecular)0;
				#else
					SurfaceOutputStandard o = (SurfaceOutputStandard)0;
				#endif
				
				/*ase_frag_code:IN=v2f*/
				o.Albedo = /*ase_frag_out:Albedo;Float3;0;-1;_Albedo*/fixed3( 0.5, 0.5, 0.5 )/*end*/;
				o.Normal = fixed3( 0, 0, 1 );
				o.Emission = /*ase_frag_out:Emission;Float3;1;-1;_Emission*/half3( 0, 0, 0 )/*end*/;
				o.Alpha = /*ase_frag_out:Alpha;Float;2;-1;_Alpha*/1/*end*/;
				float AlphaClipThreshold = /*ase_frag_out:Alpha Clip Threshold;Float;3;-1;_AlphaClip*/0.5/*end*/;

				#ifdef _ALPHATEST_ON
					clip( o.Alpha - AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
					outputDepth = IN.pos.z;
				#endif

				UnityMetaInput metaIN;
				UNITY_INITIALIZE_OUTPUT(UnityMetaInput, metaIN);
				metaIN.Albedo = o.Albedo;
				metaIN.Emission = o.Emission;
				#ifdef EDITOR_VISUALIZATION
					metaIN.VizUV = IN.vizUV;
					metaIN.LightCoord = IN.lightCoord;
				#endif
				return UnityMetaFragment(metaIN);
			}
			ENDCG
		}

		/*ase_pass*/
		Pass
		{
			/*ase_hide_pass*/
			Name "ShadowCaster"
			Tags { "LightMode"="ShadowCaster" }
			ZWrite On
			ZTest LEqual
			AlphaToMask Off

			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma skip_variants FOG_LINEAR FOG_EXP FOG_EXP2
			#pragma multi_compile_shadowcaster
			#ifndef UNITY_PASS_SHADOWCASTER
				#define UNITY_PASS_SHADOWCASTER
			#endif
			#include "HLSLSupport.cginc"
			#ifndef UNITY_INSTANCED_LOD_FADE
				#define UNITY_INSTANCED_LOD_FADE
			#endif
			#ifndef UNITY_INSTANCED_SH
				#define UNITY_INSTANCED_SH
			#endif
			#ifndef UNITY_INSTANCED_LIGHTMAPSTS
				#define UNITY_INSTANCED_LIGHTMAPSTS
			#endif
			#if ( SHADER_API_D3D11 || SHADER_API_GLCORE || SHADER_API_GLES || SHADER_API_GLES3 || SHADER_API_METAL || SHADER_API_VULKAN )
				#define CAN_SKIP_VPOS
			#endif
			#include "UnityShaderVariables.cginc"
			#include "UnityCG.cginc"
			#include "Lighting.cginc"
			#include "UnityPBSLighting.cginc"

			#pragma shader_feature_local _ _DISSOLVEGLOBALCONTROL_MASK_ONLY _DISSOLVEGLOBALCONTROL_MASK_AND_EDGE _DISSOLVEGLOBALCONTROL_ALL
			#pragma shader_feature_local _ _DISSOLVEMAPPINGTYPE_TRIPLANAR _DISSOLVEMAPPINGTYPE_SCREEN_SPACE
			#pragma shader_feature_local _ _DISSOLVEALPHASOURCE_CUSTOM_MAP _DISSOLVEALPHASOURCE_TWO_CUSTOM_MAPS _DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS
			#pragma multi_compile_local _  _ADDITIONALDISSOLVEMASK_XYZ_AXIS
			#pragma multi_compile_local _  _DISSOLVEMASK_PLANE _DISSOLVEMASK_BOX _DISSOLVEMASK_CONE
			#pragma shader_feature_local _ _DISSOLVEEDGETEXTURESOURCE_GRADIENT _DISSOLVEEDGETEXTURESOURCE_MAIN_MAP _DISSOLVEEDGETEXTURESOURCE_CUSTOM
			#pragma shader_feature_local _ _DISSOLVEMASKCOUNT_TWO _DISSOLVEMASKCOUNT_THREE _DISSOLVEMASKCOUNT_FOUR

			#define DISSOLVE_LEGACY_RENDER_PIPELIN
			#define DISSOLVE_LEGACY_MAINTEX
			#define DISSOLVE_LEGACY_TEXTURE_SAMPLE

		#ifdef DISSOLVE_LEGACY_TEXTURE_SAMPLE
			#define DECLARE_TEXTURE_2D(t) sampler2D t; uniform sampler2D t##_Global;
		#else
			#define DECLARE_TEXTURE_2D(t) TEXTURE2D(t); SAMPLER(sampler##t); uniform TEXTURE2D(t##_Global); SAMPLER(sampler##t##_Global);
		#endif


		float _DissolveCutoff;						uniform float _DissolveCutoff_Global;


		float _AdditionalDissolveMaskInvert;		uniform float _AdditionalDissolveMaskInvert_Global;
		float _DissolveMaskAxis;					uniform float _DissolveMaskAxis_Global;
		float _DissolveMaskSpace;					uniform float _DissolveMaskSpace_Global;
		float _DissolveMaskOffset;					uniform float _DissolveMaskOffset_Global;
		float _DissolveMaskInvert;					uniform float _DissolveMaskInvert_Global;

		float _DissolveEdgeWidth;					uniform float _DissolveEdgeWidth_Global;
		float4 _DissolveEdgeColor;					uniform float4 _DissolveEdgeColor_Global;
		float _DissolveGIMultiplier;				uniform float _DissolveGIMultiplier_Global;
		float _DissolveEdgeColorIntensity;			uniform float _DissolveEdgeColorIntensity_Global;
		float _DissolveEdgeShape;			        uniform float _DissolveEdgeShape_Global;

		float _DissolveEdgeDistortionSource;		uniform float _DissolveEdgeDistortionSource_Global;
		float _DissolveEdgeDistortionStrength;		uniform float _DissolveEdgeDistortionStrength_Global;

		float _DissolveMainMapTiling;				uniform float _DissolveMainMapTiling_Global;

		float _DissolveCombineWithMasterNodeAlpha;    uniform float _DissolveCombineWithMasterNodeAlpha_Global;
		float _DissolveCombineWithMasterNodeColor;    uniform float _DissolveCombineWithMasterNodeColor_Global;

		#if defined(_DISSOLVEEDGETEXTURESOURCE_GRADIENT) || defined(_DISSOLVEEDGETEXTURESOURCE_MAIN_MAP) || defined(_DISSOLVEEDGETEXTURESOURCE_CUSTOM)
			DECLARE_TEXTURE_2D(_DissolveEdgeTexture)

			float _DissolveEdgeTextureReverse;												uniform float _DissolveEdgeTextureReverse_Global;
			float _DissolveEdgeTexturePhaseOffset;											uniform float _DissolveEdgeTexturePhaseOffset_Global;
			float _DissolveEdgeTextureAlphaOffset;											uniform float _DissolveEdgeTextureAlphaOffset_Global;

			#if defined(_DISSOLVEEDGETEXTURESOURCE_GRADIENT)
				float _DissolveEdgeTextureIsDynamic;		uniform float _DissolveEdgeTextureIsDynamic_Global;
			#else
				float _DissolveEdgeTextureMipmap;           uniform float _DissolveEdgeTextureMipmap_Global;
			#endif
		#endif


		#if defined(_DISSOLVEALPHASOURCE_CUSTOM_MAP) || defined(_DISSOLVEALPHASOURCE_TWO_CUSTOM_MAPS) || defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)
			DECLARE_TEXTURE_2D(_DissolveMap1)

			float4 _DissolveMap1_ST;											uniform float4 _DissolveMap1_ST_Global;
			float3 _DissolveMap1_Scroll;										uniform float3 _DissolveMap1_Scroll_Global;
			float  _DissolveMap1Intensity;										uniform float  _DissolveMap1Intensity_Global;
			int    _DissolveMap1Channel;					                    uniform int    _DissolveMap1Channel_Global;
		#endif

		#if defined(_DISSOLVEALPHASOURCE_TWO_CUSTOM_MAPS) || defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)
			DECLARE_TEXTURE_2D(_DissolveMap2)

			float4 _DissolveMap2_ST;											uniform float4 _DissolveMap2_ST_Global;
			float3 _DissolveMap2_Scroll;										uniform float3 _DissolveMap2_Scroll_Global;
			float  _DissolveMap2Intensity;										uniform float  _DissolveMap2Intensity_Global;
			int    _DissolveMap2Channel;					                    uniform int    _DissolveMap2Channel_Global;
		#endif

		#if defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)
			DECLARE_TEXTURE_2D(_DissolveMap3)

			float4 _DissolveMap3_ST;											uniform float4 _DissolveMap3_ST_Global;
			float3 _DissolveMap3_Scroll;										uniform float3 _DissolveMap3_Scroll_Global;
			float  _DissolveMap3Intensity;										uniform float  _DissolveMap3Intensity_Global;
			int    _DissolveMap3Channel;					                    uniform int    _DissolveMap3Channel_Global;
		#endif  


		float _DissolveSourceAlphaTexturesBlend;		uniform float _DissolveSourceAlphaTexturesBlend_Global;
		float _DissolveAlphaSourceTexturesUVSet;		uniform float _DissolveAlphaSourceTexturesUVSet_Global;
		float _DissolveNoiseStrength;					uniform float _DissolveNoiseStrength_Global;

		float3 _DissolveMaskPosition;					uniform float3 _DissolveMaskPosition_Global;
		float3 _DissolveMaskNormal;						uniform float3 _DissolveMaskNormal_Global;
		float _DissolveMaskRadius;						uniform float  _DissolveMaskRadius_Global;
		float _DissolveMaskHeight;						uniform float _DissolveMaskHeight_Global;

		#if defined(_DISSOLVEMASKCOUNT_FOUR)

			float3 _DissolveMask2Position;				uniform float3 _DissolveMask2Position_Global;
			float3 _DissolveMask2Normal;				uniform float3 _DissolveMask2Normal_Global;
			float _DissolveMask2Radius;					uniform float  _DissolveMask2Radius_Global;
			float _DissolveMask2Height;					uniform float _DissolveMask2Height_Global;

			float3 _DissolveMask3Position;				uniform float3 _DissolveMask3Position_Global;
			float3 _DissolveMask3Normal;				uniform float3 _DissolveMask3Normal_Global;
			float _DissolveMask3Radius;					uniform float  _DissolveMask3Radius_Global;
			float _DissolveMask3Height;					uniform float _DissolveMask3Height_Global;

			float3 _DissolveMask4Position;				uniform float3 _DissolveMask4Position_Global;
			float3 _DissolveMask4Normal;				uniform float3 _DissolveMask4Normal_Global;
			float _DissolveMask4Radius;					uniform float  _DissolveMask4Radius_Global;
			float _DissolveMask4Height;					uniform float _DissolveMask4Height_Global;

			#if defined(_DISSOLVEMASK_BOX)
				float3 _DissolveMask2BoundsMin;			uniform float3 _DissolveMask2BoundsMin_Global;
				float3 _DissolveMask2BoundsMax;			uniform float3 _DissolveMask2BoundsMax_Global;
				float4x4 _DissolveMask2TRS;				uniform float4x4 _DissolveMask2TRS_Global;

				float3 _DissolveMask3BoundsMin;			uniform float3 _DissolveMask3BoundsMin_Global;
				float3 _DissolveMask3BoundsMax;			uniform float3 _DissolveMask3BoundsMax_Global;
				float4x4 _DissolveMask3TRS;				uniform float4x4 _DissolveMask3TRS_Global;

				float3 _DissolveMask4BoundsMin;			uniform float3 _DissolveMask4BoundsMin_Global;
				float3 _DissolveMask4BoundsMax;			uniform float3 _DissolveMask4BoundsMax_Global;
				float4x4 _DissolveMask4TRS;				uniform float4x4 _DissolveMask4TRS_Global;
			#endif

		#elif defined(_DISSOLVEMASKCOUNT_THREE)

			float3 _DissolveMask2Position;				uniform float3 _DissolveMask2Position_Global;
			float3 _DissolveMask2Normal;				uniform float3 _DissolveMask2Normal_Global;
			float _DissolveMask2Radius;					uniform float  _DissolveMask2Radius_Global;
			float _DissolveMask2Height;					uniform float _DissolveMask2Height_Global;

			float3 _DissolveMask3Position;				uniform float3 _DissolveMask3Position_Global;
			float3 _DissolveMask3Normal;				uniform float3 _DissolveMask3Normal_Global;
			float _DissolveMask3Radius;					uniform float  _DissolveMask3Radius_Global;
			float _DissolveMask3Height;					uniform float _DissolveMask3Height_Global;

			#if defined(_DISSOLVEMASK_BOX)
				float3 _DissolveMask2BoundsMin;			uniform float3 _DissolveMask2BoundsMin_Global;
				float3 _DissolveMask2BoundsMax;			uniform float3 _DissolveMask2BoundsMax_Global;
				float4x4 _DissolveMask2TRS;				uniform float4x4 _DissolveMask2TRS_Global;

				float3 _DissolveMask3BoundsMin;			uniform float3 _DissolveMask3BoundsMin_Global;
				float3 _DissolveMask3BoundsMax;			uniform float3 _DissolveMask3BoundsMax_Global;
				float4x4 _DissolveMask3TRS;				uniform float4x4 _DissolveMask3TRS_Global;
			#endif

		#elif defined(_DISSOLVEMASKCOUNT_TWO)

			float3 _DissolveMask2Position;				uniform float3 _DissolveMask2Position_Global;
			float3 _DissolveMask2Normal;				uniform float3 _DissolveMask2Normal_Global;
			float _DissolveMask2Radius;					uniform float  _DissolveMask2Radius_Global;
			float _DissolveMask2Height;					uniform float _DissolveMask2Height_Global;

			#if defined(_DISSOLVEMASK_BOX)
				float3 _DissolveMask2BoundsMin;			uniform float3 _DissolveMask2BoundsMin_Global;
				float3 _DissolveMask2BoundsMax;			uniform float3 _DissolveMask2BoundsMax_Global;
				float4x4 _DissolveMask2TRS;				uniform float4x4 _DissolveMask2TRS_Global;
			#endif

		#endif


		#if defined(_DISSOLVEMASK_BOX)
			float3 _DissolveMaskBoundsMin;				float3 _DissolveMaskBoundsMin_Global;
			float3 _DissolveMaskBoundsMax;				float3 _DissolveMaskBoundsMax_Global;
			float4x4 _DissolveMaskTRS;					float4x4 _DissolveMaskTRS_Global;
		#endif


		#ifdef _DISSOLVEMAPPINGTYPE_TRIPLANAR	
			float _DissolveTriplanarMappingSpace;		uniform float _DissolveTriplanarMappingSpace_Global;
		#endif


		float3 _Dissolve_ObjectWorldPos;

		const float3 const_zero = float3(0, 0, 0);


		#if defined(_DISSOLVEGLOBALCONTROL_MASK_ONLY)

		//Globals-----------------------------------------------------------------------
		#define VALUE_CUTOFF					_DissolveCutoff_Global

		#define VALUE_CUTOFF_AXIS				_DissolveMaskAxis_Global
		#define VALUE_MASK_SPACE				_DissolveMaskSpace_Global
		#define VALUE_MASK_OFFSET				_DissolveMaskOffset_Global
		#define VALUE_AXIS_INVERT				_DissolveMaskInvert_Global
		#define VALUE_ADDITIONAL_AXIS_INVERT	_AdditionalDissolveMaskInvert_Global

		#define VALUE_MASK_POSITION				_DissolveMaskPosition_Global
		#define VALUE_MASK_NORMAL			    _DissolveMaskNormal_Global
		#define VALUE_MASK_RADIUS		        _DissolveMaskRadius_Global
		#define VALUE_MASK_HEIGHT				_DissolveMaskHeight_Global

		#if defined(_DISSOLVEMASKCOUNT_FOUR)
			#define VALUE_MASK_2_POSITION			_DissolveMask2Position_Global
			#define VALUE_MASK_2_NORMAL				_DissolveMask2Normal_Global
			#define VALUE_MASK_2_RADIUS				_DissolveMask2Radius_Global
			#define VALUE_MASK_2_HEIGHT				_DissolveMask2Height_Global

			#define VALUE_MASK_3_POSITION			_DissolveMask3Position_Global
			#define VALUE_MASK_3_NORMAL				_DissolveMask3Normal_Global
			#define VALUE_MASK_3_RADIUS				_DissolveMask3Radius_Global
			#define VALUE_MASK_3_HEIGHT				_DissolveMask3Height_Global

			#define VALUE_MASK_4_POSITION			_DissolveMask4Position_Global
			#define VALUE_MASK_4_NORMAL				_DissolveMask4Normal_Global
			#define VALUE_MASK_4_RADIUS				_DissolveMask4Radius_Global
			#define VALUE_MASK_4_HEIGHT				_DissolveMask4Height_Global

			#if defined(_DISSOLVEMASK_BOX)
				#define VALUE_MASK_2_BOUNDS_MIN		_DissolveMask2BoundsMin_Global
				#define VALUE_MASK_2_BOUNDS_MAX		_DissolveMask2BoundsMax_Global
				#define VALUE_MASK_2_TRS			_DissolveMask2TRS_Global

				#define VALUE_MASK_3_BOUNDS_MIN		_DissolveMask3BoundsMin_Global
				#define VALUE_MASK_3_BOUNDS_MAX		_DissolveMask3BoundsMax_Global
				#define VALUE_MASK_3_TRS			_DissolveMask3TRS_Global

				#define VALUE_MASK_4_BOUNDS_MIN		_DissolveMask4BoundsMin_Global
				#define VALUE_MASK_4_BOUNDS_MAX		_DissolveMask4BoundsMax_Global
				#define VALUE_MASK_4_TRS			_DissolveMask4TRS_Global
			#endif
		#elif defined(_DISSOLVEMASKCOUNT_THREE)
			#define VALUE_MASK_2_POSITION			_DissolveMask2Position_Global
			#define VALUE_MASK_2_NORMAL				_DissolveMask2Normal_Global
			#define VALUE_MASK_2_RADIUS				_DissolveMask2Radius_Global
			#define VALUE_MASK_2_HEIGHT				_DissolveMask2Height_Global

			#define VALUE_MASK_3_POSITION			_DissolveMask3Position_Global
			#define VALUE_MASK_3_NORMAL				_DissolveMask3Normal_Global
			#define VALUE_MASK_3_RADIUS				_DissolveMask3Radius_Global
			#define VALUE_MASK_3_HEIGHT				_DissolveMask3Height_Global

			#if defined(_DISSOLVEMASK_BOX)
				#define VALUE_MASK_2_BOUNDS_MIN		_DissolveMask2BoundsMin_Global
				#define VALUE_MASK_2_BOUNDS_MAX		_DissolveMask2BoundsMax_Global
				#define VALUE_MASK_2_TRS			_DissolveMask2TRS_Global

				#define VALUE_MASK_3_BOUNDS_MIN		_DissolveMask3BoundsMin_Global
				#define VALUE_MASK_3_BOUNDS_MAX		_DissolveMask3BoundsMax_Global
				#define VALUE_MASK_3_TRS			_DissolveMask3TRS_Global
			#endif
		#elif defined(_DISSOLVEMASKCOUNT_TWO)
			#define VALUE_MASK_2_POSITION			_DissolveMask2Position_Global
			#define VALUE_MASK_2_NORMAL				_DissolveMask2Normal_Global
			#define VALUE_MASK_2_RADIUS				_DissolveMask2Radius_Global
			#define VALUE_MASK_2_HEIGHT				_DissolveMask2Height_Global

			#if defined(_DISSOLVEMASK_BOX)
				#define VALUE_MASK_2_BOUNDS_MIN		_DissolveMask2BoundsMin_Global
				#define VALUE_MASK_2_BOUNDS_MAX		_DissolveMask2BoundsMax_Global
				#define VALUE_MASK_2_TRS			_DissolveMask2TRS_Global
			#endif
		#endif


		#if defined(_DISSOLVEMASK_BOX)
			#define VALUE_MASK_BOUNDS_MIN			_DissolveMaskBoundsMin_Global
			#define VALUE_MASK_BOUNDS_MAX			_DissolveMaskBoundsMax_Global
			#define VALUE_MASK_TRS					_DissolveMaskTRS_Global
		#endif

		//Per material---------------------------------------------------------------------

		#define VALUE_MAIN_MAP_TILING				_DissolveMainMapTiling

		#if defined(_DISSOLVEALPHASOURCE_CUSTOM_MAP) || defined(_DISSOLVEALPHASOURCE_TWO_CUSTOM_MAPS) || defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)
			#define VALUE_MAP1						_DissolveMap1
			#define VALUE_MAP1_SAMPLER				sampler_DissolveMap1
			#define VALUE_MAP1_ST					_DissolveMap1_ST
			#define VALUE_MAP1_SCROLL				_DissolveMap1_Scroll
			#define VALUE_MAP1_INTENSITY			_DissolveMap1Intensity
			#define VALUE_MAP1_CHANNEL				_DissolveMap1Channel
		#endif

		#if defined(_DISSOLVEALPHASOURCE_TWO_CUSTOM_MAPS) || defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)
			#define VALUE_MAP2						_DissolveMap2
			#define VALUE_MAP2_SAMPLER				sampler_DissolveMap2
			#define VALUE_MAP2_ST					_DissolveMap2_ST
			#define VALUE_MAP2_SCROLL				_DissolveMap2_Scroll
			#define VALUE_MAP2_INTENSITY			_DissolveMap2Intensity
			#define VALUE_MAP2_CHANNEL				_DissolveMap2Channel
		#endif

		#if defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)
			#define VALUE_MAP3						_DissolveMap3
			#define VALUE_MAP3_SAMPLER				sampler_DissolveMap3
			#define VALUE_MAP3_ST					_DissolveMap3_ST
			#define VALUE_MAP3_SCROLL				_DissolveMap3_Scroll
			#define VALUE_MAP3_INTENSITY			_DissolveMap3Intensity
			#define VALUE_MAP3_CHANNEL				_DissolveMap3Channel
		#endif

		#define VALUE_EDGE_SIZE					_DissolveEdgeWidth
		#define VALUE_EDGE_COLOR				_DissolveEdgeColor
		#define VALUE_EDGE_DISTORTION_SOURCE    _DissolveEdgeDistortionSource
		#define VALUE_EDGE_DISTORTION			_DissolveEdgeDistortionStrength
		#define VALUE_EDGE_COLOR_INTENSITY		_DissolveEdgeColorIntensity
		#define VALUE_EDGE_SHAPE				_DissolveEdgeShape
		#define VALUE_GI_MULTIPLIER				_DissolveGIMultiplier


		#if defined(_DISSOLVEEDGETEXTURESOURCE_GRADIENT) || defined(_DISSOLVEEDGETEXTURESOURCE_MAIN_MAP) || defined(_DISSOLVEEDGETEXTURESOURCE_CUSTOM)

			#define VALUE_EDGE_TEXTURE					_DissolveEdgeTexture
			#define VALUE_EDGE_TEXTURE_SAMPLER          sampler_DissolveEdgeTexture
			#define VALUE_EDGE_TEXTURE_REVERSE			_DissolveEdgeTextureReverse
			#define VALUE_EDGE_TEXTURE_OFFSET			_DissolveEdgeTexturePhaseOffset
			#define VALUE_EDGETEXTUREALPHAOFFSET		_DissolveEdgeTextureAlphaOffset

			#if defined(_DISSOLVEEDGETEXTURESOURCE_GRADIENT)
				#define VALUE_EDGE_TEXTURE_IS_DYNAMIC	_DissolveEdgeTextureIsDynamic
			#else
				#define VALUE_EDGE_TEXTURE_MIPMAP       _DissolveEdgeTextureMipmap
			#endif
		#endif


		#define VALUE_ALPHATEXTUREBLEND			_DissolveSourceAlphaTexturesBlend
		#define VALUE_UVSET						_DissolveAlphaSourceTexturesUVSet
		#define VALUE_NOISE_STRENGTH			_DissolveNoiseStrength

		#ifdef _DISSOLVEMAPPINGTYPE_TRIPLANAR
			#define VALUE_TRIPLANARMAPPINGSPACE          _DissolveTriplanarMappingSpace
		#endif

		#define VALUE_COMBINE_WITH_MASTER_NODE_ALPHA     _DissolveCombineWithMasterNodeAlpha
		#define VALUE_COMBINE_WITH_MASTER_NODE_COLOR     _DissolveCombineWithMasterNodeColor

	#elif defined(_DISSOLVEGLOBALCONTROL_MASK_AND_EDGE)

		//Globals-----------------------------------------------------------------------
		#define VALUE_CUTOFF					_DissolveCutoff_Global

		#define VALUE_CUTOFF_AXIS				_DissolveMaskAxis_Global
		#define VALUE_MASK_SPACE				_DissolveMaskSpace_Global
		#define VALUE_MASK_OFFSET				_DissolveMaskOffset_Global
		#define VALUE_AXIS_INVERT				_DissolveMaskInvert_Global
		#define VALUE_ADDITIONAL_AXIS_INVERT	_AdditionalDissolveMaskInvert_Global

		#define VALUE_MASK_POSITION				_DissolveMaskPosition_Global
		#define VALUE_MASK_NORMAL				_DissolveMaskNormal_Global
		#define VALUE_MASK_RADIUS				_DissolveMaskRadius_Global
		#define VALUE_MASK_HEIGHT				_DissolveMaskHeight_Global

		#if defined(_DISSOLVEMASKCOUNT_FOUR)
			#define VALUE_MASK_2_POSITION			_DissolveMask2Position_Global
			#define VALUE_MASK_2_NORMAL				_DissolveMask2Normal_Global
			#define VALUE_MASK_2_RADIUS				_DissolveMask2Radius_Global
			#define VALUE_MASK_2_HEIGHT				_DissolveMask2Height_Global

			#define VALUE_MASK_3_POSITION			_DissolveMask3Position_Global
			#define VALUE_MASK_3_NORMAL				_DissolveMask3Normal_Global
			#define VALUE_MASK_3_RADIUS				_DissolveMask3Radius_Global
			#define VALUE_MASK_3_HEIGHT				_DissolveMask3Height_Global

			#define VALUE_MASK_4_POSITION			_DissolveMask4Position_Global
			#define VALUE_MASK_4_NORMAL				_DissolveMask4Normal_Global
			#define VALUE_MASK_4_RADIUS				_DissolveMask4Radius_Global
			#define VALUE_MASK_4_HEIGHT				_DissolveMask4Height_Global

			#if defined(_DISSOLVEMASK_BOX)
				#define VALUE_MASK_2_BOUNDS_MIN		_DissolveMask2BoundsMin_Global
				#define VALUE_MASK_2_BOUNDS_MAX		_DissolveMask2BoundsMax_Global
				#define VALUE_MASK_2_TRS			_DissolveMask2TRS_Global

				#define VALUE_MASK_3_BOUNDS_MIN		_DissolveMask3BoundsMin_Global
				#define VALUE_MASK_3_BOUNDS_MAX		_DissolveMask3BoundsMax_Global
				#define VALUE_MASK_3_TRS			_DissolveMask3TRS_Global

				#define VALUE_MASK_4_BOUNDS_MIN		_DissolveMask4BoundsMin_Global
				#define VALUE_MASK_4_BOUNDS_MAX		_DissolveMask4BoundsMax_Global
				#define VALUE_MASK_4_TRS			_DissolveMask4TRS_Global
			#endif
		#elif defined(_DISSOLVEMASKCOUNT_THREE)
			#define VALUE_MASK_2_POSITION			_DissolveMask2Position_Global
			#define VALUE_MASK_2_NORMAL				_DissolveMask2Normal_Global
			#define VALUE_MASK_2_RADIUS				_DissolveMask2Radius_Global
			#define VALUE_MASK_2_HEIGHT				_DissolveMask2Height_Global

			#define VALUE_MASK_3_POSITION			_DissolveMask3Position_Global
			#define VALUE_MASK_3_NORMAL				_DissolveMask3Normal_Global
			#define VALUE_MASK_3_RADIUS				_DissolveMask3Radius_Global
			#define VALUE_MASK_3_HEIGHT				_DissolveMask3Height_Global

			#if defined(_DISSOLVEMASK_BOX)
				#define VALUE_MASK_2_BOUNDS_MIN		_DissolveMask2BoundsMin_Global
				#define VALUE_MASK_2_BOUNDS_MAX		_DissolveMask2BoundsMax_Global
				#define VALUE_MASK_2_TRS			_DissolveMask2TRS_Global

				#define VALUE_MASK_3_BOUNDS_MIN		_DissolveMask3BoundsMin_Global
				#define VALUE_MASK_3_BOUNDS_MAX		_DissolveMask3BoundsMax_Global
				#define VALUE_MASK_3_TRS			_DissolveMask3TRS_Global
			#endif
		#elif defined(_DISSOLVEMASKCOUNT_TWO)
			#define VALUE_MASK_2_POSITION			_DissolveMask2Position_Global
			#define VALUE_MASK_2_NORMAL				_DissolveMask2Normal_Global
			#define VALUE_MASK_2_RADIUS				_DissolveMask2Radius_Global
			#define VALUE_MASK_2_HEIGHT				_DissolveMask2Height_Global

			#if defined(_DISSOLVEMASK_BOX)
				#define VALUE_MASK_2_BOUNDS_MIN			_DissolveMask2BoundsMin_Global
				#define VALUE_MASK_2_BOUNDS_MAX		_DissolveMask2BoundsMax_Global
				#define VALUE_MASK_2_TRS			_DissolveMask2TRS_Global
			#endif
		#endif


		#if defined(_DISSOLVEMASK_BOX)
			#define VALUE_MASK_BOUNDS_MIN		_DissolveMaskBoundsMin_Global
			#define VALUE_MASK_BOUNDS_MAX		_DissolveMaskBoundsMax_Global
			#define VALUE_MASK_TRS				_DissolveMaskTRS_Global
		#endif

		#define VALUE_EDGE_SIZE					_DissolveEdgeWidth_Global
		#define VALUE_EDGE_SHAPE				_DissolveEdgeShape_Global
		#define VALUE_EDGE_COLOR				_DissolveEdgeColor_Global
		#define VALUE_EDGE_COLOR_INTENSITY		_DissolveEdgeColorIntensity_Global
		#define VALUE_GI_MULTIPLIER				_DissolveGIMultiplier

		#if defined(_DISSOLVEEDGETEXTURESOURCE_GRADIENT) || defined(_DISSOLVEEDGETEXTURESOURCE_MAIN_MAP) || defined(_DISSOLVEEDGETEXTURESOURCE_CUSTOM)

			#define VALUE_EDGE_TEXTURE					_DissolveEdgeTexture_Global
			#define VALUE_EDGE_TEXTURE_SAMPLER          sampler_DissolveEdgeTexture_Global
			#define VALUE_EDGE_TEXTURE_REVERSE			_DissolveEdgeTextureReverse_Global
			#define VALUE_EDGE_TEXTURE_OFFSET			_DissolveEdgeTexturePhaseOffset_Global
			#define VALUE_EDGETEXTUREALPHAOFFSET		_DissolveEdgeTextureAlphaOffset_Global

			#if defined(_DISSOLVEEDGETEXTURESOURCE_GRADIENT)
				#define VALUE_EDGE_TEXTURE_IS_DYNAMIC	_DissolveEdgeTextureIsDynamic_Global
			#else
				#define VALUE_EDGE_TEXTURE_MIPMAP       _DissolveEdgeTextureMipmap_Global
			#endif
		#endif

		//Per material---------------------------------------------------------------------	

		#define VALUE_MAIN_MAP_TILING				_DissolveMainMapTiling

		#if defined(_DISSOLVEALPHASOURCE_CUSTOM_MAP) || defined(_DISSOLVEALPHASOURCE_TWO_CUSTOM_MAPS) || defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)
			#define VALUE_MAP1						_DissolveMap1
			#define VALUE_MAP1_SAMPLER				sampler_DissolveMap1
			#define VALUE_MAP1_ST					_DissolveMap1_ST
			#define VALUE_MAP1_SCROLL				_DissolveMap1_Scroll
			#define VALUE_MAP1_INTENSITY			_DissolveMap1Intensity
			#define VALUE_MAP1_CHANNEL				_DissolveMap1Channel
		#endif

		#if defined(_DISSOLVEALPHASOURCE_TWO_CUSTOM_MAPS) || defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)
			#define VALUE_MAP2						_DissolveMap2
			#define VALUE_MAP2_SAMPLER				sampler_DissolveMap2
			#define VALUE_MAP2_ST					_DissolveMap2_ST
			#define VALUE_MAP2_SCROLL				_DissolveMap2_Scroll
			#define VALUE_MAP2_INTENSITY			_DissolveMap2Intensity
			#define VALUE_MAP2_CHANNEL				_DissolveMap2Channel
		#endif

		#if defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)
			#define VALUE_MAP3						_DissolveMap3
			#define VALUE_MAP3_SAMPLER				sampler_DissolveMap3
			#define VALUE_MAP3_ST					_DissolveMap3_ST
			#define VALUE_MAP3_SCROLL				_DissolveMap3_Scroll
			#define VALUE_MAP3_INTENSITY			_DissolveMap3Intensity
			#define VALUE_MAP3_CHANNEL				_DissolveMap3Channel
		#endif


		#define VALUE_EDGE_DISTORTION_SOURCE   _DissolveEdgeDistortionSource
		#define VALUE_EDGE_DISTORTION			_DissolveEdgeDistortionStrength	


		#define VALUE_ALPHATEXTUREBLEND			_DissolveSourceAlphaTexturesBlend
		#define VALUE_UVSET						_DissolveAlphaSourceTexturesUVSet
		#define VALUE_NOISE_STRENGTH			_DissolveNoiseStrength

		#ifdef _DISSOLVEMAPPINGTYPE_TRIPLANAR
			#define VALUE_TRIPLANARMAPPINGSPACE          _DissolveTriplanarMappingSpace
		#endif

		#define VALUE_COMBINE_WITH_MASTER_NODE_ALPHA     _DissolveCombineWithMasterNodeAlpha
		#define VALUE_COMBINE_WITH_MASTER_NODE_COLOR     _DissolveCombineWithMasterNodeColor

	#elif defined(_DISSOLVEGLOBALCONTROL_ALL)

		#define VALUE_CUTOFF					_DissolveCutoff_Global

		#define VALUE_CUTOFF_AXIS				_DissolveMaskAxis_Global
		#define VALUE_MASK_SPACE				_DissolveMaskSpace_Global
		#define VALUE_MASK_OFFSET				_DissolveMaskOffset_Global
		#define VALUE_AXIS_INVERT				_DissolveMaskInvert_Global
		#define VALUE_ADDITIONAL_AXIS_INVERT	_AdditionalDissolveMaskInvert_Global

		#define VALUE_EDGE_SIZE					_DissolveEdgeWidth_Global
		#define VALUE_EDGE_COLOR				_DissolveEdgeColor_Global
		#define VALUE_EDGE_DISTORTION_SOURCE   _DissolveEdgeDistortionSource_Global
		#define VALUE_EDGE_DISTORTION			_DissolveEdgeDistortionStrength_Global
		#define VALUE_EDGE_COLOR_INTENSITY		_DissolveEdgeColorIntensity_Global
		#define VALUE_EDGE_SHAPE				_DissolveEdgeShape_Global
		#define VALUE_GI_MULTIPLIER				_DissolveGIMultiplier_Global


		#if defined(_DISSOLVEEDGETEXTURESOURCE_GRADIENT) || defined(_DISSOLVEEDGETEXTURESOURCE_MAIN_MAP) || defined(_DISSOLVEEDGETEXTURESOURCE_CUSTOM)

			#define VALUE_EDGE_TEXTURE					_DissolveEdgeTexture_Global
			#define VALUE_EDGE_TEXTURE_SAMPLER          sampler_DissolveEdgeTexture_Global
			#define VALUE_EDGE_TEXTURE_REVERSE			_DissolveEdgeTextureReverse_Global
			#define VALUE_EDGE_TEXTURE_OFFSET			_DissolveEdgeTexturePhaseOffset_Global
			#define VALUE_EDGETEXTUREALPHAOFFSET		_DissolveEdgeTextureAlphaOffset_Global

			#if defined(_DISSOLVEEDGETEXTURESOURCE_GRADIENT)
				#define VALUE_EDGE_TEXTURE_IS_DYNAMIC	_DissolveEdgeTextureIsDynamic_Global
			#else
				#define VALUE_EDGE_TEXTURE_MIPMAP       _DissolveEdgeTextureMipmap_Global
			#endif
		#endif


		#define VALUE_MAIN_MAP_TILING				_DissolveMainMapTiling_Global

		#if defined(_DISSOLVEALPHASOURCE_CUSTOM_MAP) || defined(_DISSOLVEALPHASOURCE_TWO_CUSTOM_MAPS) || defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)
			#define VALUE_MAP1						_DissolveMap1_Global
			#define VALUE_MAP1_SAMPLER				sampler_DissolveMap1_Global
			#define VALUE_MAP1_ST					_DissolveMap1_ST_Global
			#define VALUE_MAP1_SCROLL				_DissolveMap1_Scroll_Global
			#define VALUE_MAP1_INTENSITY			_DissolveMap1Intensity_Global
			#define VALUE_MAP1_CHANNEL				_DissolveMap1Channel_Global
		#endif

		#if defined(_DISSOLVEALPHASOURCE_TWO_CUSTOM_MAPS) || defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)
			#define VALUE_MAP2						_DissolveMap2_Global
			#define VALUE_MAP2_SAMPLER				sampler_DissolveMap2_Global
			#define VALUE_MAP2_ST					_DissolveMap2_ST_Global
			#define VALUE_MAP2_SCROLL				_DissolveMap2_Scroll_Global
			#define VALUE_MAP2_INTENSITY			_DissolveMap2Intensity_Global
			#define VALUE_MAP2_CHANNEL				_DissolveMap2Channel_Global
		#endif

		#if defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)
			#define VALUE_MAP3						_DissolveMap3_Global
			#define VALUE_MAP3_SAMPLER				sampler_DissolveMap3_Global
			#define VALUE_MAP3_ST					_DissolveMap3_ST_Global
			#define VALUE_MAP3_SCROLL				_DissolveMap3_Scroll_Global
			#define VALUE_MAP3_INTENSITY			_DissolveMap3Intensity_Global
			#define VALUE_MAP3_CHANNEL				_DissolveMap3Channel_Global
		#endif

		#define VALUE_ALPHATEXTUREBLEND			_DissolveSourceAlphaTexturesBlend_Global
		#define VALUE_UVSET						_DissolveAlphaSourceTexturesUVSet_Global
		#define VALUE_NOISE_STRENGTH			_DissolveNoiseStrength_Global

		#define VALUE_MASK_POSITION				_DissolveMaskPosition_Global
		#define VALUE_MASK_NORMAL				_DissolveMaskNormal_Global
		#define VALUE_MASK_RADIUS				_DissolveMaskRadius_Global
		#define VALUE_MASK_HEIGHT				_DissolveMaskHeight_Global

		#if defined(_DISSOLVEMASKCOUNT_FOUR)
			#define VALUE_MASK_2_POSITION			_DissolveMask2Position_Global
			#define VALUE_MASK_2_NORMAL				_DissolveMask2Normal_Global
			#define VALUE_MASK_2_RADIUS				_DissolveMask2Radius_Global
			#define VALUE_MASK_2_HEIGHT				_DissolveMask2Height_Global

			#define VALUE_MASK_3_POSITION			_DissolveMask3Position_Global
			#define VALUE_MASK_3_NORMAL				_DissolveMask3Normal_Global
			#define VALUE_MASK_3_RADIUS				_DissolveMask3Radius_Global
			#define VALUE_MASK_3_HEIGHT				_DissolveMask3Height_Global

			#define VALUE_MASK_4_POSITION			_DissolveMask4Position_Global
			#define VALUE_MASK_4_NORMAL				_DissolveMask4Normal_Global
			#define VALUE_MASK_4_RADIUS				_DissolveMask4Radius_Global
			#define VALUE_MASK_4_HEIGHT				_DissolveMask4Height_Global

			#if defined(_DISSOLVEMASK_BOX)
				#define VALUE_MASK_2_BOUNDS_MIN		_DissolveMask2BoundsMin_Global
				#define VALUE_MASK_2_BOUNDS_MAX		_DissolveMask2BoundsMax_Global
				#define VALUE_MASK_2_TRS			_DissolveMask2TRS_Global

				#define VALUE_MASK_3_BOUNDS_MIN		_DissolveMask3BoundsMin_Global
				#define VALUE_MASK_3_BOUNDS_MAX		_DissolveMask3BoundsMax_Global
				#define VALUE_MASK_3_TRS			_DissolveMask3TRS_Global

				#define VALUE_MASK_4_BOUNDS_MIN		_DissolveMask4BoundsMin_Global
				#define VALUE_MASK_4_BOUNDS_MAX		_DissolveMask4BoundsMax_Global
				#define VALUE_MASK_4_TRS			_DissolveMask4TRS_Global
			#endif
		#elif defined(_DISSOLVEMASKCOUNT_THREE)
			#define VALUE_MASK_2_POSITION			_DissolveMask2Position_Global
			#define VALUE_MASK_2_NORMAL				_DissolveMask2Normal_Global
			#define VALUE_MASK_2_RADIUS				_DissolveMask2Radius_Global
			#define VALUE_MASK_2_HEIGHT				_DissolveMask2Height_Global

			#define VALUE_MASK_3_POSITION			_DissolveMask3Position_Global
			#define VALUE_MASK_3_NORMAL				_DissolveMask3Normal_Global
			#define VALUE_MASK_3_RADIUS				_DissolveMask3Radius_Global
			#define VALUE_MASK_3_HEIGHT				_DissolveMask3Height_Global

			#if defined(_DISSOLVEMASK_BOX)
				#define VALUE_MASK_2_BOUNDS_MIN		_DissolveMask2BoundsMin_Global
				#define VALUE_MASK_2_BOUNDS_MAX		_DissolveMask2BoundsMax_Global
				#define VALUE_MASK_2_TRS			_DissolveMask2TRS_Global

				#define VALUE_MASK_3_BOUNDS_MIN		_DissolveMask3BoundsMin_Global
				#define VALUE_MASK_3_BOUNDS_MAX		_DissolveMask3BoundsMax_Global
				#define VALUE_MASK_3_TRS			_DissolveMask3TRS_Global
			#endif
		#elif defined(_DISSOLVEMASKCOUNT_TWO)
			#define VALUE_MASK_2_POSITION			_DissolveMask2Position_Global
			#define VALUE_MASK_2_NORMAL				_DissolveMask2Normal_Global
			#define VALUE_MASK_2_RADIUS				_DissolveMask2Radius_Global
			#define VALUE_MASK_2_HEIGHT				_DissolveMask2Height_Global

			#if defined(_DISSOLVEMASK_BOX)
				#define VALUE_MASK_2_BOUNDS_MIN		_DissolveMask2BoundsMin_Global
				#define VALUE_MASK_2_BOUNDS_MAX		_DissolveMask2BoundsMax_Global
				#define VALUE_MASK_2_TRS			_DissolveMask2TRS_Global
			#endif
		#endif


		#if defined(_DISSOLVEMASK_BOX)
			#define VALUE_MASK_BOUNDS_MIN		_DissolveMaskBoundsMin_Global
			#define VALUE_MASK_BOUNDS_MAX		_DissolveMaskBoundsMax_Global
			#define VALUE_MASK_TRS				_DissolveMaskTRS_Global
		#endif


		#ifdef _DISSOLVEMAPPINGTYPE_TRIPLANAR
			#define VALUE_TRIPLANARMAPPINGSPACE          _DissolveTriplanarMappingSpace_Global
		#endif

		#define VALUE_COMBINE_WITH_MASTER_NODE_ALPHA     _DissolveCombineWithMasterNodeAlpha_Global
		#define VALUE_COMBINE_WITH_MASTER_NODE_COLOR     _DissolveCombineWithMasterNodeColor_Global

	#else

		#define VALUE_CUTOFF					_DissolveCutoff

		#define VALUE_CUTOFF_AXIS				_DissolveMaskAxis
		#define VALUE_MASK_SPACE				_DissolveMaskSpace
		#define VALUE_MASK_OFFSET				_DissolveMaskOffset	
		#define VALUE_AXIS_INVERT				_DissolveMaskInvert
		#define VALUE_ADDITIONAL_AXIS_INVERT	_AdditionalDissolveMaskInvert

		#define VALUE_EDGE_SIZE					_DissolveEdgeWidth
		#define VALUE_EDGE_COLOR				_DissolveEdgeColor
		#define VALUE_EDGE_DISTORTION_SOURCE   _DissolveEdgeDistortionSource
		#define VALUE_EDGE_DISTORTION			_DissolveEdgeDistortionStrength
		#define VALUE_EDGE_COLOR_INTENSITY		_DissolveEdgeColorIntensity
		#define VALUE_EDGE_SHAPE				_DissolveEdgeShape
		#define VALUE_GI_MULTIPLIER				_DissolveGIMultiplier


		#if defined(_DISSOLVEEDGETEXTURESOURCE_GRADIENT) || defined(_DISSOLVEEDGETEXTURESOURCE_MAIN_MAP) || defined(_DISSOLVEEDGETEXTURESOURCE_CUSTOM)

			#define VALUE_EDGE_TEXTURE					_DissolveEdgeTexture
			#define VALUE_EDGE_TEXTURE_SAMPLER          sampler_DissolveEdgeTexture
			#define VALUE_EDGE_TEXTURE_REVERSE			_DissolveEdgeTextureReverse
			#define VALUE_EDGE_TEXTURE_OFFSET			_DissolveEdgeTexturePhaseOffset
			#define VALUE_EDGETEXTUREALPHAOFFSET		_DissolveEdgeTextureAlphaOffset

			#if defined(_DISSOLVEEDGETEXTURESOURCE_GRADIENT)
				#define VALUE_EDGE_TEXTURE_IS_DYNAMIC	_DissolveEdgeTextureIsDynamic
			#else
				#define VALUE_EDGE_TEXTURE_MIPMAP       _DissolveEdgeTextureMipmap
			#endif
		#endif


		#define VALUE_MAIN_MAP_TILING				_DissolveMainMapTiling

		#if defined(_DISSOLVEALPHASOURCE_CUSTOM_MAP) || defined(_DISSOLVEALPHASOURCE_TWO_CUSTOM_MAPS) || defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)
			#define VALUE_MAP1						_DissolveMap1
			#define VALUE_MAP1_SAMPLER				sampler_DissolveMap1
			#define VALUE_MAP1_ST					_DissolveMap1_ST
			#define VALUE_MAP1_SCROLL				_DissolveMap1_Scroll
			#define VALUE_MAP1_INTENSITY			_DissolveMap1Intensity
			#define VALUE_MAP1_CHANNEL				_DissolveMap1Channel
		#endif

		#if defined(_DISSOLVEALPHASOURCE_TWO_CUSTOM_MAPS) || defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)
			#define VALUE_MAP2						_DissolveMap2
			#define VALUE_MAP2_SAMPLER				sampler_DissolveMap2
			#define VALUE_MAP2_ST					_DissolveMap2_ST
			#define VALUE_MAP2_SCROLL				_DissolveMap2_Scroll
			#define VALUE_MAP2_INTENSITY			_DissolveMap2Intensity
			#define VALUE_MAP2_CHANNEL				_DissolveMap2Channel
		#endif

		#if defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)
			#define VALUE_MAP3						_DissolveMap3
			#define VALUE_MAP3_SAMPLER				sampler_DissolveMap3
			#define VALUE_MAP3_ST					_DissolveMap3_ST
			#define VALUE_MAP3_SCROLL				_DissolveMap3_Scroll
			#define VALUE_MAP3_INTENSITY			_DissolveMap3Intensity
			#define VALUE_MAP3_CHANNEL				_DissolveMap3Channel
		#endif

		#define VALUE_ALPHATEXTUREBLEND			_DissolveSourceAlphaTexturesBlend
		#define VALUE_UVSET						_DissolveAlphaSourceTexturesUVSet
		#define VALUE_NOISE_STRENGTH			_DissolveNoiseStrength

		#define VALUE_MASK_POSITION				_DissolveMaskPosition
		#define VALUE_MASK_NORMAL				_DissolveMaskNormal
		#define VALUE_MASK_RADIUS				_DissolveMaskRadius
		#define VALUE_MASK_HEIGHT				_DissolveMaskHeight

		#if defined(_DISSOLVEMASKCOUNT_FOUR)
			#define VALUE_MASK_2_POSITION			_DissolveMask2Position
			#define VALUE_MASK_2_NORMAL				_DissolveMask2Normal
			#define VALUE_MASK_2_RADIUS				_DissolveMask2Radius
			#define VALUE_MASK_2_HEIGHT				_DissolveMask2Height

			#define VALUE_MASK_3_POSITION			_DissolveMask3Position
			#define VALUE_MASK_3_NORMAL				_DissolveMask3Normal
			#define VALUE_MASK_3_RADIUS				_DissolveMask3Radius
			#define VALUE_MASK_3_HEIGHT				_DissolveMask3Height

			#define VALUE_MASK_4_POSITION			_DissolveMask4Position
			#define VALUE_MASK_4_NORMAL				_DissolveMask4Normal
			#define VALUE_MASK_4_RADIUS				_DissolveMask4Radius
			#define VALUE_MASK_4_HEIGHT				_DissolveMask4Height

			#if defined(_DISSOLVEMASK_BOX)
				#define VALUE_MASK_2_BOUNDS_MIN		_DissolveMask2BoundsMin
				#define VALUE_MASK_2_BOUNDS_MAX		_DissolveMask2BoundsMax
				#define VALUE_MASK_2_TRS			_DissolveMask2TRS

				#define VALUE_MASK_3_BOUNDS_MIN		_DissolveMask3BoundsMin
				#define VALUE_MASK_3_BOUNDS_MAX		_DissolveMask3BoundsMax
				#define VALUE_MASK_3_TRS			_DissolveMask3TRS

				#define VALUE_MASK_4_BOUNDS_MIN		_DissolveMask4BoundsMin
				#define VALUE_MASK_4_BOUNDS_MAX		_DissolveMask4BoundsMax
				#define VALUE_MASK_4_TRS			_DissolveMask4TRS
			#endif
		#elif defined(_DISSOLVEMASKCOUNT_THREE)
			#define VALUE_MASK_2_POSITION			_DissolveMask2Position
			#define VALUE_MASK_2_NORMAL				_DissolveMask2Normal
			#define VALUE_MASK_2_RADIUS				_DissolveMask2Radius
			#define VALUE_MASK_2_HEIGHT				_DissolveMask2Height

			#define VALUE_MASK_3_POSITION			_DissolveMask3Position
			#define VALUE_MASK_3_NORMAL				_DissolveMask3Normal
			#define VALUE_MASK_3_RADIUS				_DissolveMask3Radius
			#define VALUE_MASK_3_HEIGHT				_DissolveMask3Height

			#if defined(_DISSOLVEMASK_BOX)
				#define VALUE_MASK_2_BOUNDS_MIN		_DissolveMask2BoundsMin
				#define VALUE_MASK_2_BOUNDS_MAX		_DissolveMask2BoundsMax
				#define VALUE_MASK_2_TRS			_DissolveMask2TRS

				#define VALUE_MASK_3_BOUNDS_MIN		_DissolveMask3BoundsMin
				#define VALUE_MASK_3_BOUNDS_MAX		_DissolveMask3BoundsMax
				#define VALUE_MASK_3_TRS			_DissolveMask3TRS
			#endif
		#elif defined(_DISSOLVEMASKCOUNT_TWO)
			#define VALUE_MASK_2_POSITION			_DissolveMask2Position
			#define VALUE_MASK_2_NORMAL				_DissolveMask2Normal
			#define VALUE_MASK_2_RADIUS				_DissolveMask2Radius
			#define VALUE_MASK_2_HEIGHT				_DissolveMask2Height

			#if defined(_DISSOLVEMASK_BOX)
				#define VALUE_MASK_2_BOUNDS_MIN		_DissolveMask2BoundsMin
				#define VALUE_MASK_2_BOUNDS_MAX		_DissolveMask2BoundsMax
				#define VALUE_MASK_2_TRS			_DissolveMask2TRS
			#endif
		#endif


		#if defined(_DISSOLVEMASK_BOX)
			#define VALUE_MASK_BOUNDS_MIN		_DissolveMaskBoundsMin
			#define VALUE_MASK_BOUNDS_MAX		_DissolveMaskBoundsMax
			#define VALUE_MASK_TRS				_DissolveMaskTRS
		#endif

		#ifdef _DISSOLVEMAPPINGTYPE_TRIPLANAR
			#define VALUE_TRIPLANARMAPPINGSPACE          _DissolveTriplanarMappingSpace
		#endif

		#define VALUE_COMBINE_WITH_MASTER_NODE_ALPHA     _DissolveCombineWithMasterNodeAlpha
		#define VALUE_COMBINE_WITH_MASTER_NODE_COLOR     _DissolveCombineWithMasterNodeColor

	#endif

	#define TIME _Time.x

	#ifdef DISSOLVE_LEGACY_MAINTEX
		#define READ_MAINTEX(uv)               tex2D(_MainTex, (uv).xy)
		#define READ_MAINTEX_LOD(uv,m)         tex2Dlod(_MainTex, float4((uv).xy, 0, m))
	#else
		#ifdef DISSOLVE_SHADER_GRAPH
			#define READ_MAINTEX(uv)			   SAMPLE_TEXTURE2D(_MainTex, sampler_MainTex, (uv).xy)
			#define READ_MAINTEX_LOD(uv,m)		   SAMPLE_TEXTURE2D_LOD(_MainTex, sampler_MainTex, (uv).xy, m)
		#else
			#define READ_MAINTEX(uv)			   SAMPLE_TEXTURE2D(_BaseMap, sampler_BaseMap, (uv).xy)
			#define READ_MAINTEX_LOD(uv,m)		   SAMPLE_TEXTURE2D_LOD(_BaseMap, sampler_BaseMap, (uv).xy, m)
		#endif
	#endif


	#ifdef DISSOLVE_LEGACY_TEXTURE_SAMPLE
		#define READ_TEXTURE_2D(t,s,uv,i)        saturate(tex2D(t, (uv).xy) + (1 - i).xxxx)
		#define READ_TEXTURE_2D_LOD(t,s,uv,m)    tex2Dlod(t, float4((uv).xy, 0, m))
	#else
		#define READ_TEXTURE_2D(t,s,uv,i)        saturate(SAMPLE_TEXTURE2D(t, s, (uv).xy) + (1 - i).xxxx)
		#define READ_TEXTURE_2D_LOD(t,s,uv,m)    SAMPLE_TEXTURE2D_LOD(t, s, (uv).xy, m)
	#endif


	inline void DissolveVertex2Fragment(float4 positionCS, float2 vertexUV0, float2 vertexUV1, inout float4 dissolveMapUV)
	{
		dissolveMapUV = 0;

		#if defined(_DISSOLVEMAPPINGTYPE_SCREEN_SPACE)
			dissolveMapUV = ComputeScreenPos(positionCS);
		#else

			#if defined(_DISSOLVEALPHASOURCE_CUSTOM_MAP) || defined(_DISSOLVEALPHASOURCE_TWO_CUSTOM_MAPS) || defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)
				float2 texUV = VALUE_UVSET == 0 ? vertexUV0 : vertexUV1;

				dissolveMapUV = float4(texUV.xy, 0, 0);
			#endif
		#endif
	}

	#if defined(_DISSOLVEMASK_BOX)
	inline bool IsPointInsideRect(float3 vertex, float3 min, float3 max)
	{
		return ((vertex.x > min.x && vertex.x < max.x) && (vertex.y > min.y && vertex.y < max.y) && (vertex.z > min.z && vertex.z < max.z));
	}

	inline float EdgeIntersection(float p1, float e1, float p2, float e2)
	{
		return saturate(e2 - p1) + saturate(e1 - p2) + (e1 * e2);
	}
	#endif

	inline float ReadMaskValue(float3 vertexPos, float noise)
	{
		float cutout = -1;
		float axiscutout = 1;


		#if defined(_ADDITIONALDISSOLVEMASK_XYZ_AXIS)
			float3 tempPos = vertexPos;

			if (VALUE_MASK_SPACE > 0.5)
				tempPos = mul(unity_WorldToObject, float4(vertexPos, 1)).xyz;

			axiscutout = (tempPos - VALUE_MASK_OFFSET)[(int)VALUE_CUTOFF_AXIS] * VALUE_ADDITIONAL_AXIS_INVERT;

			axiscutout += noise;
			cutout = 1;
		#endif

		#if defined(_DISSOLVEMASK_PLANE)

			#if defined(_DISSOLVEMASKCOUNT_FOUR)

				float d1 = dot(VALUE_MASK_NORMAL, vertexPos - VALUE_MASK_POSITION);
				float d2 = dot(VALUE_MASK_2_NORMAL, vertexPos - VALUE_MASK_2_POSITION);
				float d3 = dot(VALUE_MASK_3_NORMAL, vertexPos - VALUE_MASK_3_POSITION);
				float d4 = dot(VALUE_MASK_4_NORMAL, vertexPos - VALUE_MASK_4_POSITION);

				if (VALUE_AXIS_INVERT > 0)
				{
					cutout = min(min(d1, d2), min(d3, d4));
				}
				else
				{
					cutout = max(max(-d1, -d2), max(-d3, -d4));
				}

				cutout += noise;

			#elif defined(_DISSOLVEMASKCOUNT_THREE)

				float d1 = dot(VALUE_MASK_NORMAL, vertexPos - VALUE_MASK_POSITION);
				float d2 = dot(VALUE_MASK_2_NORMAL, vertexPos - VALUE_MASK_2_POSITION);
				float d3 = dot(VALUE_MASK_3_NORMAL, vertexPos - VALUE_MASK_3_POSITION);

				if (VALUE_AXIS_INVERT > 0)
				{
					cutout = min(min(d1, d2), d3);
				}
				else
				{
					cutout = max(max(-d1, -d2), -d3);
				}

				cutout += noise;

			#elif defined(_DISSOLVEMASKCOUNT_TWO)

				float d1 = dot(VALUE_MASK_NORMAL, vertexPos - VALUE_MASK_POSITION);
				float d2 = dot(VALUE_MASK_2_NORMAL, vertexPos - VALUE_MASK_2_POSITION);

				if (VALUE_AXIS_INVERT > 0)
				{
					cutout = min(d1, d2);
				}
				else
				{
					cutout = max(-d1, -d2);
				}

				cutout += noise;

			#else
				cutout = dot(VALUE_MASK_NORMAL * VALUE_AXIS_INVERT, vertexPos - VALUE_MASK_POSITION);

				cutout += noise;
			#endif


		#elif defined(_DISSOLVEMASK_SPHERE)

			#if defined(_DISSOLVEMASKCOUNT_FOUR)

				float4 radius = float4(VALUE_MASK_RADIUS, VALUE_MASK_2_RADIUS, VALUE_MASK_3_RADIUS, VALUE_MASK_4_RADIUS);

				float4 n = noise * (radius < 1 ? radius : 1);

				float4 d = float4(distance(vertexPos, VALUE_MASK_POSITION), distance(vertexPos, VALUE_MASK_2_POSITION), distance(vertexPos, VALUE_MASK_3_POSITION), distance(vertexPos,			VALUE_MASK_4_POSITION));

				//radius += abs(noise) * (1 - VALUE_AXIS_INVERT * 2);
				radius -= noise;


				if (VALUE_AXIS_INVERT > 0)
				{
					float4 b = radius - min(d, radius);
					cutout = dot(b, 1);
				}
				else
				{
					float4 a = saturate(max(0, d - radius));

					a.xy = a.xz*a.yw;
					cutout = a.x * a.y;
				}

			#elif defined(_DISSOLVEMASKCOUNT_THREE)

				float3 radius = float3(VALUE_MASK_RADIUS, VALUE_MASK_2_RADIUS, VALUE_MASK_3_RADIUS);

				float3 n = noise * (radius < 1 ? radius : 1);

				float3 d = float3(distance(vertexPos, VALUE_MASK_POSITION), distance(vertexPos, VALUE_MASK_2_POSITION), distance(vertexPos, VALUE_MASK_3_POSITION));

				//radius += abs(noise) * (1 - VALUE_AXIS_INVERT * 2);
				radius -= noise;


				if (VALUE_AXIS_INVERT > 0)
				{
					float3 b = radius - min(d, radius);
					cutout = dot(b, 1);
				}
				else
				{
					float3 a = saturate(max(0, d - radius));
					cutout = a.x * a.y * a.z;
				}

			#elif defined(_DISSOLVEMASKCOUNT_TWO)


				float2 radius = float2(VALUE_MASK_RADIUS, VALUE_MASK_2_RADIUS);

				float2 n = noise * (radius < 1 ? radius : 1);

				float2 d = float2(distance(vertexPos, VALUE_MASK_POSITION), distance(vertexPos, VALUE_MASK_2_POSITION));

				//radius += abs(noise) * (1 - VALUE_AXIS_INVERT * 2);
				radius -= noise;


				if (VALUE_AXIS_INVERT > 0)
				{
					float2 b = radius - min(d, radius);
					cutout = dot(b, 1);
				}
				else
				{
					float2 a = saturate(max(0, d - radius));
					cutout = a.x * a.y;
				}

			#else

				float radius = VALUE_MASK_RADIUS;

				noise *= (radius < 1 ? radius : 1);

				float d = distance(vertexPos, VALUE_MASK_POSITION);

				//radius += abs(noise) * (1 - VALUE_AXIS_INVERT * 2);
				radius -= noise;

				if (VALUE_AXIS_INVERT > 0)
				{
					cutout = radius - min(d, radius);
				}
				else
				{
					cutout = max(0, d - radius);
				}

			#endif		

		#elif defined(_DISSOLVEMASK_BOX)

			float dissolveEdgeSize = VALUE_EDGE_SIZE;
			#ifdef UNITY_PASS_META
				dissolveEdgeSize *= VALUE_GI_MULTIPLIER;
			#endif


			#if defined(_DISSOLVEMASKCOUNT_FOUR)

				//1////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				float m_1 = 0;
				float e_1 = 0;

				float3 vertexInverseTransform = mul(VALUE_MASK_TRS, float4(vertexPos, 1)).xyz;

				float3 minval = VALUE_MASK_BOUNDS_MIN + noise;
				float3 maxval = VALUE_MASK_BOUNDS_MAX - noise;

				if (IsPointInsideRect(vertexInverseTransform, minval, maxval))
				{
					m_1 = 1;
					cutout = 1;
					//Edge Detect
					if (IsPointInsideRect(vertexInverseTransform, minval + dissolveEdgeSize, maxval - dissolveEdgeSize) == false)
					{
						e_1 = 1;
					}
				}


				//2////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				float m_2 = 0;
				float e_2 = 0;

				float3 vertexInverseTransform_2 = mul(VALUE_MASK_2_TRS, float4(vertexPos, 1)).xyz;

				float3 min_2 = VALUE_MASK_2_BOUNDS_MIN + noise;
				float3 max_2 = VALUE_MASK_2_BOUNDS_MAX - noise;

				if (IsPointInsideRect(vertexInverseTransform_2, min_2, max_2))
				{
					m_2 = 1;
					cutout = 1;
					//Edge Detect
					if (IsPointInsideRect(vertexInverseTransform_2, min_2 + dissolveEdgeSize, max_2 - dissolveEdgeSize) == false)
					{
						e_2 = 1;
					}
				}


				//3////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				float m_3 = 0;
				float e_3 = 0;

				float3 vertexInverseTransform_3 = mul(VALUE_MASK_3_TRS, float4(vertexPos, 1)).xyz;

				float3 min_3 = VALUE_MASK_3_BOUNDS_MIN + noise;
				float3 max_3 = VALUE_MASK_3_BOUNDS_MAX - noise;

				if (IsPointInsideRect(vertexInverseTransform_3, min_3, max_3))
				{
					m_3 = 1;
					cutout = 1;
					//Edge Detect
					if (IsPointInsideRect(vertexInverseTransform_3, min_3 + dissolveEdgeSize, max_3 - dissolveEdgeSize) == false)
					{
						e_3 = 1;
					}
				}


				//4////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				float m_4 = 0;
				float e_4 = 0;

				float3 vertexInverseTransform_4 = mul(VALUE_MASK_4_TRS, float4(vertexPos, 1)).xyz;

				float3 min_4 = VALUE_MASK_4_BOUNDS_MIN + noise;
				float3 max_4 = VALUE_MASK_4_BOUNDS_MAX - noise;

				if (IsPointInsideRect(vertexInverseTransform_4, min_4, max_4))
				{
					m_4 = 1;
					cutout = 1;
					//Edge Detect
					if (IsPointInsideRect(vertexInverseTransform_4, min_4 + dissolveEdgeSize, max_4 - dissolveEdgeSize) == false)
					{
						e_4 = 1;
					}
				}


				float E1 = EdgeIntersection(m_1, e_1, m_2, e_2);
				float E2 = EdgeIntersection(saturate(m_1 + m_2), E1, m_3, e_3);
				float E3 = EdgeIntersection(saturate(m_1 + m_2 + m_3), E2, m_4, e_4);

				cutout = E3 > 0.5 ? dissolveEdgeSize * 0.5 * VALUE_AXIS_INVERT : cutout;


				cutout *= VALUE_AXIS_INVERT;

			#elif defined(_DISSOLVEMASKCOUNT_THREE)

				//1////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				float m_1 = 0;
				float e_1 = 0;

				float3 vertexInverseTransform = mul(VALUE_MASK_TRS, float4(vertexPos, 1)).xyz;

				float3 minval = VALUE_MASK_BOUNDS_MIN + noise;
				float3 maxval = VALUE_MASK_BOUNDS_MAX - noise;

				if (IsPointInsideRect(vertexInverseTransform, minval, maxval))
				{
					m_1 = 1;
					cutout = 1;
					//Edge Detect
					if (IsPointInsideRect(vertexInverseTransform, minval + dissolveEdgeSize, maxval - dissolveEdgeSize) == false)
					{
						e_1 = 1;
					}
				}


				//2////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				float m_2 = 0;
				float e_2 = 0;

				float3 vertexInverseTransform_2 = mul(VALUE_MASK_2_TRS, float4(vertexPos, 1)).xyz;

				float3 min_2 = VALUE_MASK_2_BOUNDS_MIN + noise;
				float3 max_2 = VALUE_MASK_2_BOUNDS_MAX - noise;

				if (IsPointInsideRect(vertexInverseTransform_2, min_2, max_2))
				{
					m_2 = 1;
					cutout = 1;
					//Edge Detect
					if (IsPointInsideRect(vertexInverseTransform_2, min_2 + dissolveEdgeSize, max_2 - dissolveEdgeSize) == false)
					{
						e_2 = 1;
					}
				}


				//3////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				float m_3 = 0;
				float e_3 = 0;

				float3 vertexInverseTransform_3 = mul(VALUE_MASK_3_TRS, float4(vertexPos, 1)).xyz;

				float3 min_3 = VALUE_MASK_3_BOUNDS_MIN + noise;
				float3 max_3 = VALUE_MASK_3_BOUNDS_MAX - noise;

				if (IsPointInsideRect(vertexInverseTransform_3, min_3, max_3))
				{
					m_3 = 1;
					cutout = 1;
					//Edge Detect
					if (IsPointInsideRect(vertexInverseTransform_3, min_3 + dissolveEdgeSize, max_3 - dissolveEdgeSize) == false)
					{
						e_3 = 1;
					}
				}


				float E1 = EdgeIntersection(m_1, e_1, m_2, e_2);
				float E2 = EdgeIntersection(saturate(m_1 + m_2), E1, m_3, e_3);

				cutout = E2 > 0.5 ? dissolveEdgeSize * 0.5 * VALUE_AXIS_INVERT : cutout;


				cutout *= VALUE_AXIS_INVERT;

			#elif defined(_DISSOLVEMASKCOUNT_TWO)

				//1////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				float m_1 = 0;
				float e_1 = 0;

				float3 vertexInverseTransform = mul(VALUE_MASK_TRS, float4(vertexPos, 1)).xyz;

				float3 minval = VALUE_MASK_BOUNDS_MIN + noise;
				float3 maxval = VALUE_MASK_BOUNDS_MAX - noise;

				if (IsPointInsideRect(vertexInverseTransform, minval, maxval))
				{
					m_1 = 1;
					cutout = 1;
					//Edge Detect
					if (IsPointInsideRect(vertexInverseTransform, minval + dissolveEdgeSize, maxval - dissolveEdgeSize) == false)
					{
						e_1 = 1;
					}
				}


				//2////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				float m_2 = 0;
				float e_2 = 0;

				float3 vertexInverseTransform_2 = mul(VALUE_MASK_2_TRS, float4(vertexPos, 1)).xyz;

				float3 min_2 = VALUE_MASK_2_BOUNDS_MIN + noise;
				float3 max_2 = VALUE_MASK_2_BOUNDS_MAX - noise;

				if (IsPointInsideRect(vertexInverseTransform_2, min_2, max_2))
				{
					m_2 = 1;
					cutout = 1;
					//Edge Detect
					if (IsPointInsideRect(vertexInverseTransform_2, min_2 + dissolveEdgeSize, max_2 - dissolveEdgeSize) == false)
					{
						e_2 = 1;
					}
				}



				float E = EdgeIntersection(m_1, e_1, m_2, e_2);
				cutout = E > 0.5 ? dissolveEdgeSize * 0.5 * VALUE_AXIS_INVERT : cutout;


				cutout *= VALUE_AXIS_INVERT;

			#else

				float3 vertexInverseTransform = mul(VALUE_MASK_TRS, float4(vertexPos, 1)).xyz;

				float3 minval = VALUE_MASK_BOUNDS_MIN + noise;
				float3 maxval = VALUE_MASK_BOUNDS_MAX - noise;


				if (IsPointInsideRect(vertexInverseTransform, minval, maxval))
				{
					cutout = 1;

					//Edge Detect
					if (!IsPointInsideRect(vertexInverseTransform, minval + dissolveEdgeSize, maxval - dissolveEdgeSize))
					{
						cutout = dissolveEdgeSize * 0.5 * VALUE_AXIS_INVERT;
					}
				}

				cutout *= VALUE_AXIS_INVERT;

			#endif

		#elif defined(_DISSOLVEMASK_CYLINDER)

			#if defined(_DISSOLVEMASKCOUNT_FOUR)

			//1
			float3 p1_1 = VALUE_MASK_POSITION;
			float3 p1_2 = p1_1 + VALUE_MASK_NORMAL * VALUE_MASK_HEIGHT;

			float t1 = max(0, min(1, dot(vertexPos - p1_1, p1_2 - p1_1) / (VALUE_MASK_HEIGHT * VALUE_MASK_HEIGHT)));
			float3 projection1 = p1_1 + t1 * (p1_2 - p1_1);

			//2
			float3 p2_1 = VALUE_MASK_2_POSITION;
			float3 p2_2 = p2_1 + VALUE_MASK_2_NORMAL * VALUE_MASK_2_HEIGHT;

			float t2 = max(0, min(1, dot(vertexPos - p2_1, p2_2 - p2_1) / (VALUE_MASK_2_HEIGHT * VALUE_MASK_2_HEIGHT)));
			float3 projection2 = p2_1 + t2 * (p2_2 - p2_1);

			//3
			float3 p3_1 = VALUE_MASK_3_POSITION;
			float3 p3_2 = p3_1 + VALUE_MASK_3_NORMAL * VALUE_MASK_3_HEIGHT;

			float t3 = max(0, min(1, dot(vertexPos - p3_1, p3_2 - p3_1) / (VALUE_MASK_3_HEIGHT * VALUE_MASK_3_HEIGHT)));
			float3 projection3 = p3_1 + t3 * (p3_2 - p3_1);

			//4
			float3 p4_1 = VALUE_MASK_4_POSITION;
			float3 p4_2 = p4_1 + VALUE_MASK_4_NORMAL * VALUE_MASK_4_HEIGHT;

			float t4 = max(0, min(1, dot(vertexPos - p4_1, p4_2 - p4_1) / (VALUE_MASK_4_HEIGHT * VALUE_MASK_4_HEIGHT)));
			float3 projection4 = p4_1 + t4 * (p4_2 - p4_1);



			float4 d = float4(distance(vertexPos, projection1), distance(vertexPos, projection2), distance(vertexPos, projection3), distance(vertexPos, projection4));

			float4 radius = float4(VALUE_MASK_RADIUS, VALUE_MASK_2_RADIUS, VALUE_MASK_3_RADIUS, VALUE_MASK_4_RADIUS);

			float4 n = noise * (radius < 1 ? radius : 1);
			radius -= n;


			if (VALUE_AXIS_INVERT > 0)
			{
				float4 b = radius - min(d, radius);
				cutout = dot(b, 1);
			}
			else
			{
				float4 a = saturate(max(0, d - radius));

				a.xy = a.xz*a.yw;
				cutout = a.x * a.y;
			}

		#elif defined(_DISSOLVEMASKCOUNT_THREE)

			//1
			float3 p1_1 = VALUE_MASK_POSITION;
			float3 p1_2 = p1_1 + VALUE_MASK_NORMAL * VALUE_MASK_HEIGHT;

			float t1 = max(0, min(1, dot(vertexPos - p1_1, p1_2 - p1_1) / (VALUE_MASK_HEIGHT * VALUE_MASK_HEIGHT)));
			float3 projection1 = p1_1 + t1 * (p1_2 - p1_1);

			//2
			float3 p2_1 = VALUE_MASK_2_POSITION;
			float3 p2_2 = p2_1 + VALUE_MASK_2_NORMAL * VALUE_MASK_2_HEIGHT;

			float t2 = max(0, min(1, dot(vertexPos - p2_1, p2_2 - p2_1) / (VALUE_MASK_2_HEIGHT * VALUE_MASK_2_HEIGHT)));
			float3 projection2 = p2_1 + t2 * (p2_2 - p2_1);

			//3
			float3 p3_1 = VALUE_MASK_3_POSITION;
			float3 p3_2 = p3_1 + VALUE_MASK_3_NORMAL * VALUE_MASK_3_HEIGHT;

			float t3 = max(0, min(1, dot(vertexPos - p3_1, p3_2 - p3_1) / (VALUE_MASK_3_HEIGHT * VALUE_MASK_3_HEIGHT)));
			float3 projection3 = p3_1 + t3 * (p3_2 - p3_1);



			float3 d = float3(distance(vertexPos, projection1), distance(vertexPos, projection2), distance(vertexPos, projection3));

			float3 radius = float3(VALUE_MASK_RADIUS, VALUE_MASK_2_RADIUS, VALUE_MASK_3_RADIUS);

			float3 n = noise * (radius < 1 ? radius : 1);
			radius -= n;


			if (VALUE_AXIS_INVERT > 0)
			{
				float3 b = radius - min(d, radius);
				cutout = dot(b, 1);
			}
			else
			{
				float3 a = saturate(max(0, d - radius));
				cutout = a.x * a.y * a.z;
			}

		#elif defined(_DISSOLVEMASKCOUNT_TWO)

			//1
			float3 p1_1 = VALUE_MASK_POSITION;
			float3 p1_2 = p1_1 + VALUE_MASK_NORMAL * VALUE_MASK_HEIGHT;

			float t1 = max(0, min(1, dot(vertexPos - p1_1, p1_2 - p1_1) / (VALUE_MASK_HEIGHT * VALUE_MASK_HEIGHT)));
			float3 projection1 = p1_1 + t1 * (p1_2 - p1_1);

			//2
			float3 p2_1 = VALUE_MASK_2_POSITION;
			float3 p2_2 = p2_1 + VALUE_MASK_2_NORMAL * VALUE_MASK_2_HEIGHT;

			float t2 = max(0, min(1, dot(vertexPos - p2_1, p2_2 - p2_1) / (VALUE_MASK_2_HEIGHT * VALUE_MASK_2_HEIGHT)));
			float3 projection2 = p2_1 + t2 * (p2_2 - p2_1);



			float2 d = float2(distance(vertexPos, projection1), distance(vertexPos, projection2));

			float2 radius = float2(VALUE_MASK_RADIUS, VALUE_MASK_2_RADIUS);

			float2 n = noise * (radius < 1 ? radius : 1);
			radius -= n;


			if (VALUE_AXIS_INVERT > 0)
			{
				float2 b = radius - min(d, radius);
				cutout = dot(b, 1);
			}
			else
			{
				float2 a = saturate(max(0, d - radius));
				cutout = a.x * a.y;
			}
		#else
			float3 p1 = VALUE_MASK_POSITION;
			float3 p2 = p1 + VALUE_MASK_NORMAL * VALUE_MASK_HEIGHT;

			float t = max(0, min(1, dot(vertexPos - p1, p2 - p1) / (VALUE_MASK_HEIGHT * VALUE_MASK_HEIGHT)));
			float3 projection = p1 + t * (p2 - p1);

			float d = distance(vertexPos, projection);


			float radius = VALUE_MASK_RADIUS;
			noise *= (radius < 1 ? radius : 1);

			//radius += abs(noise) * (1 - VALUE_AXIS_INVERT * 2);
			radius -= noise;

			if (VALUE_AXIS_INVERT > 0)
			{
				cutout = radius - min(d, radius);
			}
			else
			{
				cutout = max(0, d - radius);
			}
		#endif
	#elif defined(_DISSOLVEMASK_CONE)

		#if defined(_DISSOLVEMASKCOUNT_FOUR)

			//1
			float3 p1_1 = VALUE_MASK_POSITION;
			float3 p1_2 = p1_1 + VALUE_MASK_NORMAL * VALUE_MASK_HEIGHT;

			float t1 = max(0, min(1, dot(vertexPos - p1_1, p1_2 - p1_1) / (VALUE_MASK_HEIGHT * VALUE_MASK_HEIGHT)));
			float3 projection1 = p1_1 + t1 * (p1_2 - p1_1);

			//2
			float3 p2_1 = VALUE_MASK_2_POSITION;
			float3 p2_2 = p2_1 + VALUE_MASK_2_NORMAL * VALUE_MASK_2_HEIGHT;

			float t2 = max(0, min(1, dot(vertexPos - p2_1, p2_2 - p2_1) / (VALUE_MASK_2_HEIGHT * VALUE_MASK_2_HEIGHT)));
			float3 projection2 = p2_1 + t2 * (p2_2 - p2_1);

			//3
			float3 p3_1 = VALUE_MASK_3_POSITION;
			float3 p3_2 = p3_1 + VALUE_MASK_3_NORMAL * VALUE_MASK_3_HEIGHT;

			float t3 = max(0, min(1, dot(vertexPos - p3_1, p3_2 - p3_1) / (VALUE_MASK_3_HEIGHT * VALUE_MASK_3_HEIGHT)));
			float3 projection3 = p3_1 + t3 * (p3_2 - p3_1);

			//4
			float3 p4_1 = VALUE_MASK_4_POSITION;
			float3 p4_2 = p4_1 + VALUE_MASK_4_NORMAL * VALUE_MASK_4_HEIGHT;

			float t4 = max(0, min(1, dot(vertexPos - p4_1, p4_2 - p4_1) / (VALUE_MASK_4_HEIGHT * VALUE_MASK_4_HEIGHT)));
			float3 projection4 = p4_1 + t4 * (p4_2 - p4_1);



			float4 d = float4(distance(vertexPos, projection1), distance(vertexPos, projection2), distance(vertexPos, projection3), distance(vertexPos, projection4));


			float4 radius = lerp(0, float4(VALUE_MASK_RADIUS, VALUE_MASK_2_RADIUS, VALUE_MASK_3_RADIUS, VALUE_MASK_4_RADIUS), float4(t1, t2, t3, t4));


			float4 n = noise * (radius < 1 ? radius : 1);
			radius -= n;

			if (VALUE_AXIS_INVERT > 0)
			{
				float4 b = radius - min(d, radius);
				cutout = dot(b, 1);
			}
			else
			{
				float4 a = saturate(max(0, d - radius));

				a.xy = a.xz*a.yw;
				cutout = a.x * a.y;
			}

		#elif defined(_DISSOLVEMASKCOUNT_THREE)

			//1
			float3 p1_1 = VALUE_MASK_POSITION;
			float3 p1_2 = p1_1 + VALUE_MASK_NORMAL * VALUE_MASK_HEIGHT;

			float t1 = max(0, min(1, dot(vertexPos - p1_1, p1_2 - p1_1) / (VALUE_MASK_HEIGHT * VALUE_MASK_HEIGHT)));
			float3 projection1 = p1_1 + t1 * (p1_2 - p1_1);

			//2
			float3 p2_1 = VALUE_MASK_2_POSITION;
			float3 p2_2 = p2_1 + VALUE_MASK_2_NORMAL * VALUE_MASK_2_HEIGHT;

			float t2 = max(0, min(1, dot(vertexPos - p2_1, p2_2 - p2_1) / (VALUE_MASK_2_HEIGHT * VALUE_MASK_2_HEIGHT)));
			float3 projection2 = p2_1 + t2 * (p2_2 - p2_1);

			//3
			float3 p3_1 = VALUE_MASK_3_POSITION;
			float3 p3_2 = p3_1 + VALUE_MASK_3_NORMAL * VALUE_MASK_3_HEIGHT;

			float t3 = max(0, min(1, dot(vertexPos - p3_1, p3_2 - p3_1) / (VALUE_MASK_3_HEIGHT * VALUE_MASK_3_HEIGHT)));
			float3 projection3 = p3_1 + t3 * (p3_2 - p3_1);


			float3 d = float3(distance(vertexPos, projection1), distance(vertexPos, projection2), distance(vertexPos, projection3));


			float3 radius = lerp(0, float3(VALUE_MASK_RADIUS, VALUE_MASK_2_RADIUS, VALUE_MASK_3_RADIUS), float3(t1, t2, t3));


			float3 n = noise * (radius < 1 ? radius : 1);
			radius -= n;

			if (VALUE_AXIS_INVERT > 0)
			{
				float3 b = radius - min(d, radius);
				cutout = dot(b, 1);
			}
			else
			{
				float3 a = saturate(max(0, d - radius));
				cutout = a.x * a.y * a.z;
			}

		#elif defined(_DISSOLVEMASKCOUNT_TWO)

			//1
			float3 p1_1 = VALUE_MASK_POSITION;
			float3 p1_2 = p1_1 + VALUE_MASK_NORMAL * VALUE_MASK_HEIGHT;

			float t1 = max(0, min(1, dot(vertexPos - p1_1, p1_2 - p1_1) / (VALUE_MASK_HEIGHT * VALUE_MASK_HEIGHT)));
			float3 projection1 = p1_1 + t1 * (p1_2 - p1_1);

			//2
			float3 p2_1 = VALUE_MASK_2_POSITION;
			float3 p2_2 = p2_1 + VALUE_MASK_2_NORMAL * VALUE_MASK_2_HEIGHT;

			float t2 = max(0, min(1, dot(vertexPos - p2_1, p2_2 - p2_1) / (VALUE_MASK_2_HEIGHT * VALUE_MASK_2_HEIGHT)));
			float3 projection2 = p2_1 + t2 * (p2_2 - p2_1);


			float2 d = float2(distance(vertexPos, projection1), distance(vertexPos, projection2));


			float2 radius = lerp(0, float2(VALUE_MASK_RADIUS, VALUE_MASK_2_RADIUS), float2(t1, t2));


			float2 n = noise * (radius < 1 ? radius : 1);
			radius -= n;

			if (VALUE_AXIS_INVERT > 0)
			{
				float2 b = radius - min(d, radius);
				cutout = dot(b, 1);
			}
			else
			{
				float2 a = saturate(max(0, d - radius));
				cutout = a.x * a.y;
			}

		#else
			float3 p1 = VALUE_MASK_POSITION;
			float3 p2 = p1 + VALUE_MASK_NORMAL * VALUE_MASK_HEIGHT;

			float t = max(0, min(1, dot(vertexPos - p1, p2 - p1) / (VALUE_MASK_HEIGHT * VALUE_MASK_HEIGHT)));
			float3 projection = p1 + t * (p2 - p1);

			float d = distance(vertexPos, projection);


			float radius = lerp(0, VALUE_MASK_RADIUS, t);
			noise *= (radius < 1 ? radius : 1);

			//radius += abs(noise) * (1 - VALUE_AXIS_INVERT * 2);
			radius -= noise;

			if (VALUE_AXIS_INVERT > 0)
			{
				cutout = radius - min(d, radius);
			}
			else
			{
				cutout = max(0, d - radius);
			}
		#endif

	#endif

	cutout = min(axiscutout, cutout);
	return (cutout > 0 ? cutout : -1);
}


inline float4 ReadDissolveAlpha(float2 mainTexUV, float4 dissolveMapUV, float3 vertexPos)
{
	float4 alphaSource = 1;


	#ifdef _DISSOLVEMAPPINGTYPE_SCREEN_SPACE
		float2 screenUV = dissolveMapUV.xy / dissolveMapUV.w;
		screenUV.y *= _ScreenParams.y / _ScreenParams.x;

		#ifdef DISSOLVE_LEGACY_RENDER_PIPELIN
			screenUV *= distance(_WorldSpaceCameraPos, mul(unity_ObjectToWorld, float4(0, 0, 0, 1)).xyz) * 0.1;
		#else
			screenUV *= distance(GetCameraPositionWS(), TransformObjectToWorld(float3(0, 0, 0)).xyz) * 0.1;
		#endif
	#endif


	#if defined(_DISSOLVEALPHASOURCE_CUSTOM_MAP)

		#ifdef _DISSOLVEMAPPINGTYPE_SCREEN_SPACE
			screenUV = screenUV * VALUE_MAP1_ST.xy + VALUE_MAP1_ST.zw + VALUE_MAP1_SCROLL.xy * TIME;

			alphaSource = READ_TEXTURE_2D(VALUE_MAP1, VALUE_MAP1_SAMPLER, screenUV, VALUE_MAP1_INTENSITY);
		#else
			float2 uv1 = dissolveMapUV.xy * VALUE_MAP1_ST.xy + VALUE_MAP1_ST.zw + VALUE_MAP1_SCROLL.xy * TIME;

			alphaSource = READ_TEXTURE_2D(VALUE_MAP1, VALUE_MAP1_SAMPLER, uv1, VALUE_MAP1_INTENSITY);
		#endif

		alphaSource.a = alphaSource[VALUE_MAP1_CHANNEL];

	#elif defined(_DISSOLVEALPHASOURCE_TWO_CUSTOM_MAPS)

		#ifdef _DISSOLVEMAPPINGTYPE_SCREEN_SPACE
			float2 uv1 = screenUV * VALUE_MAP1_ST.xy + VALUE_MAP1_ST.zw + VALUE_MAP1_SCROLL.xy * TIME;
			float2 uv2 = screenUV * VALUE_MAP2_ST.xy + VALUE_MAP2_ST.zw + VALUE_MAP2_SCROLL.xy * TIME;

			float4 t1 = READ_TEXTURE_2D(VALUE_MAP1, VALUE_MAP1_SAMPLER, uv1, VALUE_MAP1_INTENSITY);
			float4 t2 = READ_TEXTURE_2D(VALUE_MAP2, VALUE_MAP2_SAMPLER, uv2, VALUE_MAP2_INTENSITY);
		#else
			float2 uv1 = dissolveMapUV.xy * VALUE_MAP1_ST.xy + VALUE_MAP1_ST.zw + VALUE_MAP1_SCROLL.xy * TIME;
			float2 uv2 = dissolveMapUV.xy * VALUE_MAP2_ST.xy + VALUE_MAP2_ST.zw + VALUE_MAP2_SCROLL.xy * TIME;

			float4 t1 = READ_TEXTURE_2D(VALUE_MAP1, VALUE_MAP1_SAMPLER, uv1, VALUE_MAP1_INTENSITY);
			float4 t2 = READ_TEXTURE_2D(VALUE_MAP2, VALUE_MAP2_SAMPLER, uv2, VALUE_MAP2_INTENSITY);
		#endif

		t1.a = t1[VALUE_MAP1_CHANNEL];
		t2.a = t2[VALUE_MAP2_CHANNEL];

		alphaSource = lerp((t1 * t2), (t1 + t2) * 0.5, VALUE_ALPHATEXTUREBLEND);

	#elif defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)

		#ifdef _DISSOLVEMAPPINGTYPE_SCREEN_SPACE
			float2 uv1 = screenUV * VALUE_MAP1_ST.xy + VALUE_MAP1_ST.zw + VALUE_MAP1_SCROLL.xy * TIME;
			float2 uv2 = screenUV * VALUE_MAP2_ST.xy + VALUE_MAP2_ST.zw + VALUE_MAP2_SCROLL.xy * TIME;
			float2 uv3 = screenUV * VALUE_MAP3_ST.xy + VALUE_MAP3_ST.zw + VALUE_MAP3_SCROLL.xy * TIME;
		#else
			float2 uv1 = dissolveMapUV.xy * VALUE_MAP1_ST.xy + VALUE_MAP1_ST.zw + VALUE_MAP1_SCROLL.xy * TIME;
			float2 uv2 = dissolveMapUV.xy * VALUE_MAP2_ST.xy + VALUE_MAP2_ST.zw + VALUE_MAP2_SCROLL.xy * TIME;
			float2 uv3 = dissolveMapUV.xy * VALUE_MAP3_ST.xy + VALUE_MAP3_ST.zw + VALUE_MAP3_SCROLL.xy * TIME;
		#endif

		float4 t1 = READ_TEXTURE_2D(VALUE_MAP1, VALUE_MAP1_SAMPLER, uv1, VALUE_MAP1_INTENSITY);
		float4 t2 = READ_TEXTURE_2D(VALUE_MAP2, VALUE_MAP2_SAMPLER, uv2, VALUE_MAP2_INTENSITY);
		float4 t3 = READ_TEXTURE_2D(VALUE_MAP3, VALUE_MAP3_SAMPLER, uv3, VALUE_MAP3_INTENSITY);

		t1.a = t1[VALUE_MAP1_CHANNEL];
		t2.a = t2[VALUE_MAP2_CHANNEL];
		t3.a = t3[VALUE_MAP3_CHANNEL];

		alphaSource = lerp((t1 * t2 * t3), (t1 + t2 + t3) / 3.0, VALUE_ALPHATEXTUREBLEND);

	#else

		#ifdef _DISSOLVEMAPPINGTYPE_SCREEN_SPACE
			alphaSource = READ_MAINTEX(screenUV * VALUE_MAIN_MAP_TILING);
		#else
			alphaSource = READ_MAINTEX(mainTexUV * VALUE_MAIN_MAP_TILING);
		#endif

	#endif



	#if defined(_ADDITIONALDISSOLVEMASK_XYZ_AXIS) || defined(_DISSOLVEMASK_PLANE) || defined(_DISSOLVEMASK_SPHERE) || defined(_DISSOLVEMASK_BOX) || defined(_DISSOLVEMASK_CYLINDER) || defined		(_DISSOLVEMASK_CONE)

		float noise = ((alphaSource.a - 0.5) * 2) * VALUE_NOISE_STRENGTH;

		alphaSource.a = ReadMaskValue(vertexPos, noise);

	#endif	

	return alphaSource;
}




#ifdef _DISSOLVEMAPPINGTYPE_TRIPLANAR
	#if defined(_DISSOLVEALPHASOURCE_CUSTOM_MAP) || defined(_DISSOLVEALPHASOURCE_TWO_CUSTOM_MAPS) || defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)
		inline float4 ReadTriplanarTextureMap1(float3 coords, float3 blend)
		{
			coords = coords * VALUE_MAP1_ST.x * 0.1 + VALUE_MAP1_SCROLL.xyz * TIME;

			float4 cx = READ_TEXTURE_2D(VALUE_MAP1, VALUE_MAP1_SAMPLER, coords.yz, VALUE_MAP1_INTENSITY);
			float4 cy = READ_TEXTURE_2D(VALUE_MAP1, VALUE_MAP1_SAMPLER, coords.xz, VALUE_MAP1_INTENSITY);
			float4 cz = READ_TEXTURE_2D(VALUE_MAP1, VALUE_MAP1_SAMPLER, coords.xy, VALUE_MAP1_INTENSITY);

			cx.a = cx[VALUE_MAP1_CHANNEL];
			cy.a = cy[VALUE_MAP1_CHANNEL];
			cz.a = cz[VALUE_MAP1_CHANNEL];

			return (cx * blend.x + cy * blend.y + cz * blend.z);
		}
	#endif

	#if defined(_DISSOLVEALPHASOURCE_TWO_CUSTOM_MAPS) || defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)
		inline float4 ReadTriplanarTextureMap2(float3 coords, float3 blend)
		{
			coords = coords * VALUE_MAP2_ST.x * 0.1 + VALUE_MAP2_SCROLL.xyz * TIME;

			float4 cx = READ_TEXTURE_2D(VALUE_MAP2, VALUE_MAP2_SAMPLER, coords.yz, VALUE_MAP2_INTENSITY);
			float4 cy = READ_TEXTURE_2D(VALUE_MAP2, VALUE_MAP2_SAMPLER, coords.xz, VALUE_MAP2_INTENSITY);
			float4 cz = READ_TEXTURE_2D(VALUE_MAP2, VALUE_MAP2_SAMPLER, coords.xy, VALUE_MAP2_INTENSITY);

			cx.a = cx[VALUE_MAP2_CHANNEL];
			cy.a = cy[VALUE_MAP2_CHANNEL];
			cz.a = cz[VALUE_MAP2_CHANNEL];

			return (cx * blend.x + cy * blend.y + cz * blend.z);
		}
	#endif

	#ifdef _DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS
		inline float4 ReadTriplanarTextureMap3(float3 coords, float3 blend)
		{
			coords = coords * VALUE_MAP3_ST.x * 0.1 + VALUE_MAP3_SCROLL.xyz * TIME;

			float4 cx = READ_TEXTURE_2D(VALUE_MAP3, VALUE_MAP3_SAMPLER, coords.yz, VALUE_MAP3_INTENSITY);
			float4 cy = READ_TEXTURE_2D(VALUE_MAP3, VALUE_MAP3_SAMPLER, coords.xz, VALUE_MAP3_INTENSITY);
			float4 cz = READ_TEXTURE_2D(VALUE_MAP3, VALUE_MAP3_SAMPLER, coords.xy, VALUE_MAP3_INTENSITY);

			cx.a = cx[VALUE_MAP3_CHANNEL];
			cy.a = cy[VALUE_MAP3_CHANNEL];
			cz.a = cz[VALUE_MAP3_CHANNEL];

			return (cx * blend.x + cy * blend.y + cz * blend.z);
		}
	#endif

	inline float4 ReadTriplanarTextureMainMap(float3 coords, float3 blend)
	{
		float4 cx = READ_MAINTEX(coords.yz);
		float4 cy = READ_MAINTEX(coords.xz);
		float4 cz = READ_MAINTEX(coords.xy);

		return (cx * blend.x + cy * blend.y + cz * blend.z);
	}

	inline float4 ReadDissolveAlpha_Triplanar(float3 positionWS, float3 normalWS)
	{
		float3 positionOS = mul(unity_WorldToObject, float4(positionWS, 1)).xyz;
		float3 normal = mul(unity_WorldToObject, float4(normalWS, 0)).xyz;

		float3 vertexPos = lerp(positionWS, positionOS, VALUE_TRIPLANARMAPPINGSPACE);
		float3 vertexNorm = lerp(normalWS, normal, VALUE_TRIPLANARMAPPINGSPACE);

		float3 blend = abs(vertexNorm);
		blend /= max(dot(blend, 1.0), 0.000001);


		float4 alphaSource = 1;
		#if defined(_DISSOLVEALPHASOURCE_CUSTOM_MAP)

			alphaSource = ReadTriplanarTextureMap1(vertexPos, blend);

		#elif defined(_DISSOLVEALPHASOURCE_TWO_CUSTOM_MAPS)

			float4 t1 = ReadTriplanarTextureMap1(vertexPos, blend);
			float4 t2 = ReadTriplanarTextureMap2(vertexPos, blend);


			alphaSource = lerp((t1 * t2), (t1 + t2) * 0.5, VALUE_ALPHATEXTUREBLEND);

		#elif defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)

			float4 t1 = ReadTriplanarTextureMap1(vertexPos, blend);
			float4 t2 = ReadTriplanarTextureMap2(vertexPos, blend);
			float4 t3 = ReadTriplanarTextureMap3(vertexPos, blend);


			alphaSource = lerp((t1 * t2 * t3), (t1 + t2 + t3) / 3.0, VALUE_ALPHATEXTUREBLEND);

		#else		

			alphaSource = ReadTriplanarTextureMainMap(vertexPos * VALUE_MAIN_MAP_TILING * 0.1, blend).a;

		#endif



		#if defined(_ADDITIONALDISSOLVEMASK_XYZ_AXIS) || defined(_DISSOLVEMASK_PLANE) || defined(_DISSOLVEMASK_SPHERE) || defined(_DISSOLVEMASK_BOX) || defined(_DISSOLVEMASK_CYLINDER) || defined		(_DISSOLVEMASK_CONE)

			float noise = ((alphaSource.a - 0.5) * 2) * VALUE_NOISE_STRENGTH;

			alphaSource.a = ReadMaskValue(vertexPos, noise);

		#endif	


		return alphaSource;
	}
#endif

inline void DoDissolveClip(float4 alpha)
{
	#if defined(_ADDITIONALDISSOLVEMASK_XYZ_AXIS) || defined(_DISSOLVEMASK_PLANE) || defined(_DISSOLVEMASK_SPHERE) || defined(_DISSOLVEMASK_BOX) || defined(_DISSOLVEMASK_CYLINDER) || defined		(_DISSOLVEMASK_CONE)
		clip(alpha.a);
	#else
		clip(alpha.a - VALUE_CUTOFF * 1.01);
	#endif
}


float DoDissolveAlbedoEmission(float4 alpha, inout float3 albedo, inout float3 emission, inout float2 uv, float3 masterNodeColor)
{
	float retValue = 0;


	float dissolveEdgeSize = VALUE_EDGE_SIZE;


	#ifdef UNITY_PASS_META
		dissolveEdgeSize *= VALUE_GI_MULTIPLIER;
	#endif


	#if defined(_ADDITIONALDISSOLVEMASK_XYZ_AXIS) || defined(_DISSOLVEMASK_PLANE) || defined(_DISSOLVEMASK_SPHERE) || defined(_DISSOLVEMASK_BOX)  || defined(_DISSOLVEMASK_CYLINDER) || defined		(_DISSOLVEMASK_CONE)
		//Do nothing
	#else

		dissolveEdgeSize *= VALUE_CUTOFF < 0.1 ? (VALUE_CUTOFF * 10) : 1;

		alpha.a -= VALUE_CUTOFF;

	#endif	



	if (dissolveEdgeSize > 0 && dissolveEdgeSize > alpha.a)
	{
		float edgeGradient = saturate(alpha.a) * (1.0 / dissolveEdgeSize);


		float invertGradient = 1 - edgeGradient;
		uv += (lerp(alpha.rg, READ_MAINTEX(uv).rg, VALUE_EDGE_DISTORTION_SOURCE) - 0.5) * VALUE_EDGE_DISTORTION * invertGradient * invertGradient;

		float4 edgeColor = VALUE_EDGE_COLOR;



		float4 edgeTexture = 1;
		#if defined(_DISSOLVEEDGETEXTURESOURCE_MAIN_MAP)
		//#if (SHADER_TARGET < 30)
		//	edgeTexture = READ_MAINTEX(uv);
		//#else
			edgeTexture = READ_MAINTEX_LOD(uv, VALUE_EDGE_TEXTURE_MIPMAP);
			//#endif				

			edgeTexture.a = saturate(edgeTexture.a + VALUE_EDGETEXTUREALPHAOFFSET);

		#elif defined(_DISSOLVEEDGETEXTURESOURCE_GRADIENT) && !defined(_DISSOLVEMASK_BOX)

			float u = lerp(edgeGradient, 1 - edgeGradient, VALUE_EDGE_TEXTURE_REVERSE) + VALUE_EDGE_TEXTURE_OFFSET;

			edgeTexture = READ_TEXTURE_2D(VALUE_EDGE_TEXTURE, VALUE_EDGE_TEXTURE_SAMPLER, float2(lerp(u, VALUE_CUTOFF, VALUE_EDGE_TEXTURE_IS_DYNAMIC), 0.5), 1);

			edgeTexture.a = saturate(edgeTexture.a + VALUE_EDGETEXTUREALPHAOFFSET);

		#elif defined(_DISSOLVEEDGETEXTURESOURCE_CUSTOM)
		//#if (SHADER_TARGET < 30)
		//	edgeTexture = READ_TEXTURE_2D(VALUE_EDGE_TEXTURE, VALUE_EDGE_TEXTURE_SAMPLER, uv, 1);
		//#else
			edgeTexture = READ_TEXTURE_2D_LOD(VALUE_EDGE_TEXTURE, VALUE_EDGE_TEXTURE_SAMPLER, uv, VALUE_EDGE_TEXTURE_MIPMAP);
			//#endif

			edgeTexture.a = saturate(edgeTexture.a + VALUE_EDGETEXTUREALPHAOFFSET);
		#endif

		edgeColor *= edgeTexture;

		#ifdef DISSOLVE_SHADER_GRAPH
			edgeColor.rgb *= lerp(1, masterNodeColor.rgb, VALUE_COMBINE_WITH_MASTER_NODE_COLOR);
		#endif

			//Box mask always has solid edge
			#if !defined(_DISSOLVEMASK_BOX)
				float3 shape;
				shape.x = 1;
				shape.y = invertGradient;
				shape.z = invertGradient * invertGradient;

				edgeColor.a *= shape[(int)VALUE_EDGE_SHAPE];
			#endif




			albedo = edgeColor.rgb;


			#ifdef UNITY_PASS_META

				#if defined(_ADDITIONALDISSOLVEMASK_XYZ_AXIS) || defined(_DISSOLVEMASK_PLANE) || defined(_DISSOLVEMASK_SPHERE) || defined(_DISSOLVEMASK_BOX)  || defined(_DISSOLVEMASK_CYLINDER) ||		defined (_DISSOLVEMASK_CONE)

				#else
					edgeColor *= VALUE_CUTOFF >= 0.99 ? 0 : 1;
				#endif

				emission = edgeColor.rgb * (1 + VALUE_EDGE_COLOR_INTENSITY) * VALUE_GI_MULTIPLIER;
			#else
				emission = edgeColor.rgb * VALUE_EDGE_COLOR_INTENSITY;
			#endif


			retValue = saturate(edgeColor.a);
		}


		#ifdef UNITY_PASS_META
			if (alpha.a <= 0)
				emission = const_zero;
		#endif


		return retValue;
	}

	#ifdef DISSOLVE_LEGACY_RENDER_PIPELIN
	half4 DoOutputForward(half4 output, half alphaFromSurface)
	{
		#if defined(_ALPHABLEND_ON) || defined(_ALPHAPREMULTIPLY_ON)
			output.a = alphaFromSurface;
		#else
			UNITY_OPAQUE_ALPHA(output.a);
		#endif

		return output;
	}
	#endif




	#define ADVANCED_DISSOLVE_DATA(coord) float4 dissolveUV : TEXCOORD##coord;

	#ifdef _DISSOLVEMAPPINGTYPE_TRIPLANAR
		#define ADVANCED_DISSOLVE_INIT_DATA(positionCS, texcoord0, texcoord1, output) output.dissolveUV = 0;
	#else
		#define ADVANCED_DISSOLVE_INIT_DATA(positionCS, texcoord0, texcoord1, output) DissolveVertex2Fragment(positionCS, texcoord0.xy, texcoord1.xy, output.dissolveUV);
	#endif

	#ifdef DISSOLVE_SHADER_GRAPH
		float4 AdvancedDissolveGetAlpha(float2 texcoord1, float2 texcoord2, float3 positionWS, float3 normalWS, float fragmentAlpha)
		{
			#ifdef _DISSOLVEMAPPINGTYPE_TRIPLANAR
				float4 dissolveAlpha = ReadDissolveAlpha_Triplanar(positionWS, normalWS);
			#else

				#ifdef _DISSOLVEMAPPINGTYPE_SCREEN_SPACE
					float4 dissolveData = ComputeScreenPos(mul(GetWorldToHClipMatrix(), float4(positionWS.xyz, 1)), _ProjectionParams.x);
				#else
					float4 dissolveData = VALUE_UVSET == 0 ? float4(texcoord1.xy, 0, 0) : float4(texcoord2.xy, 0, 0);
				#endif		

				float4 dissolveAlpha = ReadDissolveAlpha(texcoord1, dissolveData, positionWS);

			#endif


			#if defined(_ADDITIONALDISSOLVEMASK_XYZ_AXIS) || defined(_DISSOLVEMASK_PLANE) || defined(_DISSOLVEMASK_SPHERE) || defined(_DISSOLVEMASK_BOX) || defined(_DISSOLVEMASK_CYLINDER) || defined		(_DISSOLVEMASK_CONE)
				dissolveAlpha.a -= lerp(0, fragmentAlpha, VALUE_COMBINE_WITH_MASTER_NODE_ALPHA);
			#else
				dissolveAlpha.a *= lerp(1, fragmentAlpha, VALUE_COMBINE_WITH_MASTER_NODE_ALPHA);
			#endif


			return dissolveAlpha;
		}
	#else
		float4 AdvancedDissolveGetAlpha(float2 texcoord0, float3 positionWS, float3 normalWS, float4 dissolveUV)
		{
			#ifdef _DISSOLVEMAPPINGTYPE_TRIPLANAR
				return ReadDissolveAlpha_Triplanar(positionWS, normalWS);
			#else
				return ReadDissolveAlpha(texcoord0, dissolveUV, positionWS);
			#endif
		}
	#endif

	struct DissolveStruct
	{
		float3 albedo;
		float3 emission;
		float blend;
	};

	DissolveStruct DissolveClip(float2 uv, float4 screenUV, float3 positionWS, float3 N)
	{
		DissolveStruct result = (DissolveStruct)0;
		float4 dissolveUV = 0;

		#if defined(_DISSOLVEMAPPINGTYPE_SCREEN_SPACE)
			dissolveUV = screenUV;
		#else
			#if defined(_DISSOLVEALPHASOURCE_CUSTOM_MAP) || defined(_DISSOLVEALPHASOURCE_TWO_CUSTOM_MAPS) || defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)
				dissolveUV = float4(uv, 0, 0);
			#endif
		#endif

		float2 time_uv = uv;
		time_uv.x = frac(time_uv.x + _Time.r);
		//dissolveUV.x = (dissolveUV.x + _Time.r);

		float4 alpha = AdvancedDissolveGetAlpha(time_uv, positionWS, N, dissolveUV);

		DoDissolveClip(alpha);

		result.blend = DoDissolveAlbedoEmission(alpha, result.albedo, result.emission, time_uv, 0);

		return result;
	}

	DissolveStruct DissolveClip(float4 uv, float4 screenUV, float3 positionWS, float3 N)
	{
		DissolveStruct result = (DissolveStruct)0;
		float4 dissolveUV = 0;

		#if defined(_DISSOLVEMAPPINGTYPE_SCREEN_SPACE)
			dissolveUV = screenUV;
		#else
			#if defined(_DISSOLVEALPHASOURCE_CUSTOM_MAP) || defined(_DISSOLVEALPHASOURCE_TWO_CUSTOM_MAPS) || defined(_DISSOLVEALPHASOURCE_THREE_CUSTOM_MAPS)
				float2 texUV = VALUE_UVSET == 0 ? uv.xy : uv.wz;
				dissolveUV = float4(texUV.xy, 0, 0);
			#endif
		#endif

		float2 time_uv = uv;
		time_uv.x = frac(time_uv.x + _Time.r);
		//dissolveUV.x = (dissolveUV.x + _Time.r);

		float4 alpha = AdvancedDissolveGetAlpha(time_uv, positionWS, N, dissolveUV);

		DoDissolveClip(alpha);

		result.blend = DoDissolveAlbedoEmission(alpha, result.albedo, result.emission, time_uv, 0);

		return result;
	}

			/*ase_pragma*/
			struct appdata {
				float4 vertex : POSITION;
				float4 tangent : TANGENT;
				float3 normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				/*ase_vdata:p=p;t=t;n=n;uv1=tc1.xyzw;uv2=tc2.xyzw*/
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct v2f {
				V2F_SHADOW_CASTER;
				/*ase_interp(2,):sp=sp.xyzw*/
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			#ifdef UNITY_STANDARD_USE_DITHER_MASK
				sampler3D _DitherMaskLOD;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			/*ase_globals*/
	
			/*ase_funcs*/

			v2f VertexFunction (appdata v /*ase_vert_input*/ ) {
				UNITY_SETUP_INSTANCE_ID(v);
				v2f o;
				UNITY_INITIALIZE_OUTPUT(v2f,o);
				UNITY_TRANSFER_INSTANCE_ID(v,o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				/*ase_vert_code:v=appdata;o=v2f*/
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = /*ase_vert_out:Vertex Offset;Float3;3;-1;_Vertex*/defaultVertexValue/*end*/;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif
				v.vertex.w = 1;
				v.normal = /*ase_vert_out:Vertex Normal;Float3;4;-1;_VertexNormal*/v.normal/*end*/;
				v.tangent = /*ase_vert_out:Vertex Tangent;Float4;5;-1;_VertexTangent*/v.tangent/*end*/;

				TRANSFER_SHADOW_CASTER_NORMALOFFSET(o)
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float4 tangent : TANGENT;
				float3 normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				/*ase_vcontrol*/
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( appdata v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.tangent = v.tangent;
				o.normal = v.normal;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				/*ase_control_code:v=appdata;o=VertexControl*/
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = /*ase_inline_begin*/_TessValue/*ase_inline_end*/; float tessMin = /*ase_inline_begin*/_TessMin/*ase_inline_end*/; float tessMax = /*ase_inline_begin*/_TessMax/*ase_inline_end*/;
				float edgeLength = /*ase_inline_begin*/_TessEdgeLength/*ase_inline_end*/; float tessMaxDisp = /*ase_inline_begin*/_TessMaxDisp/*ase_inline_end*/;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, UNITY_MATRIX_M, _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, UNITY_MATRIX_M, _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, UNITY_MATRIX_M, _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			v2f DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				appdata o = (appdata) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.tangent = patch[0].tangent * bary.x + patch[1].tangent * bary.y + patch[2].tangent * bary.z;
				o.normal = patch[0].normal * bary.x + patch[1].normal * bary.y + patch[2].normal * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				/*ase_domain_code:patch=VertexControl;o=appdata;bary=SV_DomainLocation*/
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].normal * (dot(o.vertex.xyz, patch[i].normal) - dot(patch[i].vertex.xyz, patch[i].normal));
				float phongStrength = /*ase_inline_begin*/_TessPhongStrength/*ase_inline_end*/;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			v2f vert ( appdata v )
			{
				return VertexFunction( v );
			}
			#endif

			fixed4 frag (v2f IN /*ase_frag_input*/
				#ifdef _DEPTHOFFSET_ON
				, out float outputDepth : SV_Depth
				#endif
				#if !defined( CAN_SKIP_VPOS )
				, UNITY_VPOS_TYPE vpos : VPOS
				#endif
				) : SV_Target 
			{
				UNITY_SETUP_INSTANCE_ID(IN);

				#ifdef LOD_FADE_CROSSFADE
					UNITY_APPLY_DITHER_CROSSFADE(IN.pos.xy);
				#endif

				#if defined(_SPECULAR_SETUP)
					SurfaceOutputStandardSpecular o = (SurfaceOutputStandardSpecular)0;
				#else
					SurfaceOutputStandard o = (SurfaceOutputStandard)0;
				#endif

				/*ase_frag_code:IN=v2f*/
				o.Normal = fixed3( 0, 0, 1 );
				o.Occlusion = 1;
				o.Alpha = /*ase_frag_out:Alpha;Float;0;-1;_Alpha*/1/*end*/;
				float AlphaClipThreshold = /*ase_frag_out:Alpha Clip Threshold;Float;1;-1;_AlphaClip*/0.5/*end*/;
				float AlphaClipThresholdShadow = /*ase_frag_out:Alpha Clip Threshold Shadow;Float;2;-1;_AlphaClipShadow*/0.5/*end*/;

				DissolveStruct dissolve = DissolveClip(/*ase_frag_out:Texcoord;Float4;6;-1;_Texcoord*/fixed4(0, 0, 0, 0)/*end*/, float4(0, 0, 0, 0), float3(0,0,0), float3(0,0,0));

				#ifdef _ALPHATEST_SHADOW_ON
					if (unity_LightShadowBias.z != 0.0)
						clip(o.Alpha - AlphaClipThresholdShadow);
					#ifdef _ALPHATEST_ON
					else
						clip(o.Alpha - AlphaClipThreshold);
					#endif
				#else
					#ifdef _ALPHATEST_ON
						clip(o.Alpha - AlphaClipThreshold);
					#endif
				#endif

				#if defined( CAN_SKIP_VPOS )
				float2 vpos = IN.pos;
				#endif

				#ifdef UNITY_STANDARD_USE_DITHER_MASK
					half alphaRef = tex3D(_DitherMaskLOD, float3(vpos.xy*0.25,o.Alpha*0.9375)).a;
					clip(alphaRef - 0.01);
				#endif

				#ifdef _DEPTHOFFSET_ON
					outputDepth = IN.pos.z;
				#endif

				SHADOW_CASTER_FRAGMENT(IN)
			}
			ENDCG
		}
		/*ase_pass_end*/
	}
	CustomEditor "ASEMaterialInspector"
}
