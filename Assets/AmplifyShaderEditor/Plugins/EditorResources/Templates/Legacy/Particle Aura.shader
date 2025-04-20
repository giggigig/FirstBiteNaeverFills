Shader /*ase_name*/ "Hidden/Templates/Particle Aura" /*end*/
{
	Properties
	{
		[Header(Aura usage properties)][Space][KeywordEnum(Pixel, Vertex)] _UsageStage("Stage", Float) = 0
		[KeywordEnum(None, Light, Fog, Both)] _UsageType("Type", Float) = 2
		_LightingFactor("Lighting Factor", Float) = 1

		/*ase_props*/
		[Toggle(_USESOFTPARTICLES_ON)] _UseSoftParticles("Use Soft Particles", Float) = 1
		_InvFade("Soft Particles Factor", Range(0.01,3.0)) = 1.0
		[Enum(Cull Off,0, Cull Front,1, Cull Back,2)] _CullMode("Culling", Float) = 0
	}


	Category 
	{
		SubShader
		{
			Tags{ "Queue" = "Transparent" "IgnoreProjector" = "True" "RenderType" = "Transparent" "PreviewType" = "Plane" }
			Blend SrcAlpha OneMinusSrcAlpha
			ColorMask RGB
			Cull[_CullMode]
			Lighting Off 
			ZWrite Off
			ZTest LEqual
			/*ase_pass*/
			Pass {
			
				CGPROGRAM
				#ifndef UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX
				#define UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input)
				#endif
				
				#pragma vertex vert
				#pragma fragment frag
				#pragma target 2.0
				#pragma multi_compile_instancing
				#pragma multi_compile_particles
				#pragma multi_compile_fog
				#pragma shader_feature_local _USESOFTPARTICLES_ON
				#pragma shader_feature_local _USAGESTAGE_VERTEX _USAGESTAGE_PIXEL
				#pragma shader_feature_local _USAGETYPE_NONE _USAGETYPE_LIGHT _USAGETYPE_FOG _USAGETYPE_BOTH
				#pragma multi_compile _ AURA
				#pragma multi_compile _ AURA_USE_DITHERING
				#pragma multi_compile _ AURA_USE_CUBIC_FILTERING
				#pragma multi_compile _ AURA_DISPLAY_VOLUMETRIC_LIGHTING_ONLY

				/*ase_pragma*/

				#include "UnityCG.cginc"
				#include "Assets/5. ExternalAssets/Effect/Aura 2/Core/Code/Shaders/Includes/AuraUsageCustom.cginc"

				struct appdata_t 
				{
					float4 vertex : POSITION;
					fixed4 color : COLOR;
					float4 texcoord : TEXCOORD0;
					UNITY_VERTEX_INPUT_INSTANCE_ID
					/*ase_vdata:p=p;uv0=tc0;c=c*/
				};

				struct v2f 
				{
					float4 vertex : SV_POSITION;
					fixed4 color : COLOR;
					float4 texcoord : TEXCOORD0;
					UNITY_FOG_COORDS(1)
					#if defined(SOFTPARTICLES_ON) && defined(_USESOFTPARTICLES_ON) || defined(AURA)
					float4 projPos : TEXCOORD2;
					#endif
					#if defined(AURA) && defined(_USAGESTAGE_VERTEX)
					#if defined(_USAGETYPE_LIGHT) || defined(_USAGETYPE_BOTH)
					float3 auraLightingValue : TEXCOORD3;
					#endif
					#if defined(_USAGETYPE_FOG) || defined(_USAGETYPE_BOTH)
					float4 auraFogValue : TEXCOORD4;
					#endif
					#endif
					UNITY_VERTEX_OUTPUT_STEREO
					UNITY_VERTEX_INPUT_INSTANCE_ID
					/*ase_interp(5,):sp=sp.xyzw;uv0=tc0;c=c*/
				};
				
				
				#if UNITY_VERSION >= 560
				UNITY_DECLARE_DEPTH_TEXTURE( _CameraDepthTexture );
				#else
				uniform sampler2D_float _CameraDepthTexture;
				#endif

				//Don't delete this comment
				// uniform sampler2D_float _CameraDepthTexture;

				uniform float _LightingFactor;
				uniform float _InvFade;
				/*ase_globals*/

				v2f vert ( appdata_t v /*ase_vert_input*/ )
				{
					v2f o;
					UNITY_SETUP_INSTANCE_ID(v);
					UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
					UNITY_TRANSFER_INSTANCE_ID(v, o);
					/*ase_vert_code:v=appdata_t;o=v2f*/

					v.vertex.xyz += /*ase_vert_out:Offset;Float3*/ float3( 0, 0, 0 ) /*end*/;
					o.vertex = UnityObjectToClipPos(v.vertex);
					#if defined(SOFTPARTICLES_ON) && defined(_USESOFTPARTICLES_ON) || defined(AURA)
					o.projPos = ComputeScreenPos(o.vertex);
					COMPUTE_EYEDEPTH(o.projPos.z);
					#if defined(AURA)
						#if defined(_USAGESTAGE_VERTEX)
							float3 frustumSpacePosition = float3(o.projPos.xy / o.projPos.w, o.projPos.z);
							#if defined(_USAGETYPE_LIGHT) || defined(_USAGETYPE_BOTH)
								o.auraLightingValue = Aura2_GetData_Dithering(frustumSpacePosition);
							#endif
							#if defined(_USAGETYPE_FOG) || defined(_USAGETYPE_BOTH)
								o.auraFogValue = Aura2_GetFogValue_Dithering(frustumSpacePosition);
							#endif
						#endif
					#endif
					#endif
					o.color = v.color;
					o.texcoord = v.texcoord;
					UNITY_TRANSFER_FOG(o,o.vertex);
					return o;
				}

				fixed4 frag ( v2f i /*ase_frag_input*/ ) : SV_Target
				{
					UNITY_SETUP_INSTANCE_ID(i);
					UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( i );
					
					#if defined(SOFTPARTICLES_ON) && defined(_USESOFTPARTICLES_ON)
						float sceneZ = LinearEyeDepth (SAMPLE_DEPTH_TEXTURE_PROJ(_CameraDepthTexture, UNITY_PROJ_COORD(i.projPos)));
						float partZ = i.projPos.z;
						float fade = saturate (_InvFade * (sceneZ-partZ));
						i.color.a *= fade;
					#endif

					/*ase_frag_code:i=v2f*/

					fixed4 col = /*ase_frag_out:Color;Float4*/float4(1,1,1,1)/*end*/;
					col.a = saturate(col.a);

					#if defined(AURA)
						float3 frustumSpacePosition = float3(i.projPos.xy / i.projPos.w, i.projPos.z);
					    #if defined(_USAGETYPE_LIGHT) || defined(_USAGETYPE_BOTH)
							#if defined(_USAGESTAGE_PIXEL)	
								Aura2_ApplyLighting(col.xyz, frustumSpacePosition, _LightingFactor);
							#elif defined(_USAGESTAGE_VERTEX)
								Aura2_ApplyLighting_Final(col.xyz, _LightingFactor, i.auraLightingValue);
							#endif
					    #endif
					    #if defined(_USAGETYPE_FOG) || defined(_USAGETYPE_BOTH)
							#if defined(AURA_DISPLAY_VOLUMETRIC_LIGHTING_ONLY)
								col.xyz = float3(0.0f,0.0f,0.0f);
							#endif
								
							#if defined(_USAGESTAGE_PIXEL)	
								Aura2_ApplyFog(col, frustumSpacePosition);
							#elif defined(_USAGESTAGE_VERTEX)
								Aura2_ApplyFog_Final(col, i.auraFogValue);
							#endif
					    #endif
					#endif
								
					#if defined(_ADDITIVE) || defined(_DSTBLEND_ONE)
					UNITY_APPLY_FOG_COLOR(i.fogCoord, col, fixed4(0, 0, 0, 0));
					#else
					UNITY_APPLY_FOG(i.fogCoord, col);
					#endif
					return col;
				}
				ENDCG 
			}
		}	
	}
	CustomEditor "ASEMaterialInspector"
}
