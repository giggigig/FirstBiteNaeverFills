// Amplify Shader Editor - Visual Shader Editing Tool
// Copyright (c) Amplify Creations, Lda <info@amplify.pt>
using UnityEditor;

namespace AmplifyShaderEditor
{
	public class TemplateMenuItems
	{
		[MenuItem( "Assets/Create/Amplify Shader/Legacy/Unlit", false, 85 )]
		public static void ApplyTemplateLegacyUnlit()
		{
			AmplifyShaderEditorWindow.CreateConfirmationTemplateShader( "0770190933193b94aaa3065e307002fa" );
		}
		[MenuItem( "Assets/Create/Amplify Shader/Legacy/Post Process", false, 85 )]
		public static void ApplyTemplateLegacyPostProcess()
		{
			AmplifyShaderEditorWindow.CreateConfirmationTemplateShader( "c71b220b631b6344493ea3cf87110c93" );
		}
		[MenuItem( "Assets/Create/Amplify Shader/Deprecated/Legacy/Default Unlit", false, 85 )]
		public static void ApplyTemplateDeprecatedLegacyDefaultUnlit()
		{
			AmplifyShaderEditorWindow.CreateConfirmationTemplateShader( "6e114a916ca3e4b4bb51972669d463bf" );
		}
		[MenuItem( "Assets/Create/Amplify Shader/Legacy/Default UI", false, 85 )]
		public static void ApplyTemplateLegacyDefaultUI()
		{
			AmplifyShaderEditorWindow.CreateConfirmationTemplateShader( "5056123faa0c79b47ab6ad7e8bf059a4" );
		}
		[MenuItem( "Assets/Create/Amplify Shader/Legacy/Unlit Lightmap", false, 85 )]
		public static void ApplyTemplateLegacyUnlitLightmap()
		{
			AmplifyShaderEditorWindow.CreateConfirmationTemplateShader( "899e609c083c74c4ca567477c39edef0" );
		}
		[MenuItem( "Assets/Create/Amplify Shader/Legacy/Default Sprites", false, 85 )]
		public static void ApplyTemplateLegacyDefaultSprites()
		{
			AmplifyShaderEditorWindow.CreateConfirmationTemplateShader( "0f8ba0101102bb14ebf021ddadce9b49" );
		}
		[MenuItem( "Assets/Create/Amplify Shader/Legacy/Particles Alpha Blended", false, 85 )]
		public static void ApplyTemplateLegacyParticlesAlphaBlended()
		{
			AmplifyShaderEditorWindow.CreateConfirmationTemplateShader( "0b6a9f8b4f707c74ca64c0be8e590de0" );
		}
		[MenuItem( "Assets/Create/Amplify Shader/Legacy/Multi Pass Unlit", false, 85 )]
		public static void ApplyTemplateLegacyMultiPassUnlit()
		{
			AmplifyShaderEditorWindow.CreateConfirmationTemplateShader( "e1de45c0d41f68c41b2cc20c8b9c05ef" );
		}
		[MenuItem( "Assets/Create/Amplify Shader/Particles Alpha Blended + TEXCOORD1", false, 85 )]
		public static void ApplyTemplateParticlesAlphaBlendedTEXCOORD1()
		{
			AmplifyShaderEditorWindow.CreateConfirmationTemplateShader( "39608c403216c2545817cb3fb95a1410" );
		}
		[MenuItem( "Assets/Create/Amplify Shader/Particles Alpha Blended Textureless", false, 85 )]
		public static void ApplyTemplateParticlesAlphaBlendedTextureless()
		{
			AmplifyShaderEditorWindow.CreateConfirmationTemplateShader( "0e84dec801abe9344801a4c455580029" );
		}
		[MenuItem( "Assets/Create/Amplify Shader/Particles Anim Alpha Blended + MV Tex", false, 85 )]
		public static void ApplyTemplateParticlesAnimAlphaBlendedMVTex()
		{
			AmplifyShaderEditorWindow.CreateConfirmationTemplateShader( "7f168dab9088a6842a89d1cb6141f4e8" );
		}
		[MenuItem( "Assets/Create/Amplify Shader/Templates/DissolveLit", false, 85 )]
		public static void ApplyTemplateTemplatesDissolveLit()
		{
			AmplifyShaderEditorWindow.CreateConfirmationTemplateShader( "fe1817cf5d63d324e99b8a8494861098" );
		}
		[MenuItem( "Assets/Create/Amplify Shader/Legacy/Lit", false, 85 )]
		public static void ApplyTemplateLegacyLit()
		{
			AmplifyShaderEditorWindow.CreateConfirmationTemplateShader( "ed95fe726fd7b4644bb42f4d1ddd2bcd" );
		}
		[MenuItem( "Assets/Create/Amplify Shader/Templates/Legacy/Particles Alpha Blended HDR", false, 85 )]
		public static void ApplyTemplateTemplatesLegacyParticlesAlphaBlendedHDR()
		{
			AmplifyShaderEditorWindow.CreateConfirmationTemplateShader( "7b929323b083b6940a936f5d14aa4b54" );
		}
		[MenuItem( "Assets/Create/Amplify Shader/Templates/Particle Aura Decal RadialUV", false, 85 )]
		public static void ApplyTemplateTemplatesParticleAuraDecalRadialUV()
		{
			AmplifyShaderEditorWindow.CreateConfirmationTemplateShader( "fec7065fe987e3948a096e84ec27fc90" );
		}
		[MenuItem( "Assets/Create/Amplify Shader/Templates/Particle Aura Decal", false, 85 )]
		public static void ApplyTemplateTemplatesParticleAuraDecal()
		{
			AmplifyShaderEditorWindow.CreateConfirmationTemplateShader( "442d50b12d974b14b92f45d4820a90e3" );
		}
		[MenuItem( "Assets/Create/Amplify Shader/Templates/Particle Aura", false, 85 )]
		public static void ApplyTemplateTemplatesParticleAura()
		{
			AmplifyShaderEditorWindow.CreateConfirmationTemplateShader( "fc1c7ceb25b24054483c59637f5a1680" );
		}
	}
}
