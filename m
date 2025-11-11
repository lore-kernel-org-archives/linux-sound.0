Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011044.outbound.protection.outlook.com [52.101.125.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C9F220F5E
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821216; cv=fail; b=hnMmkA+QVK5KfBX5Gyich4eGVJvnMe2Ue7dEJA804cHk2FbiLJo0HdgjPY++1ipSo1AfgNmzXE8gBobeyeh4V6gk8o9mbL6OVCGrZpCIk/xltIyGvrzuyX3srQgO5GZMVWeBgoQlIypJt8/oL32n0UrhulSha55/7jkK721CRTw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821216; c=relaxed/simple;
	bh=g5UcIDzTwTxhT2nLL1hpbalNaiwbk9/aZnDmpB9xXPc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=uVqYSPb3f858r1PBW13fPVJX4vB2WqLrTtbF4Ut3W/JAMa3PDL5PhKOsdotC6rIKz96X4wdccPalhS+z6nIeLWv/Af7BGpwXWFxw/9XKhUGQQbHLGpCFxiTNJESUEsK1uKg98/xPqIjZQzntb3CINeLx82M5RseYx4xlIpB33YA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=pyfEJHkv; arc=fail smtp.client-ip=52.101.125.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="pyfEJHkv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NNfcX0mUqcju5OS1o/CqAVPd6gVdZ109t9Vk2CX0St0eOKjji5bRqsPz60jHvaGx7ZCYTzyutITSiysZooFLCjDW2oZ0pvjSL0W37yucEfRjfDlM0MoYqHB9gnzzx3jS1pDO0HjtoyjiEX3aePV2ITwsWYGlPqAfmUnlNtXNYWaYnkC/H1+lczIF6eMEeOkn5cjeS/q4WBy3iJ3sjYC9JhGvBbE5NyI3pJzJxHTVpzwdEnUcikiHiYOtPDPugXaQTUXFi26m0Taj/jPMOpHlaerFHekCxlSAxA40qx5M0ad6MGXcjIGx39AN5r2i+fSXFQQIJra6GMxfP+YLKM2V8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YBk/bVve6+E04fjW2/9AEKokJZn/+LIqJBMDsw/IL6s=;
 b=k7hol5HZBd1TkxCuAR6xjc/PHQrIrJPQshjfZxWG1Cx7KSA3utRIh3h3Nus/wo7gogjxsmv4Wlxh349OEho+afYwV4OvdsPs3icSvbrPsVzNsiC3Dx28TbUSJxv4Z96jUWuOOYoQlEQd7anLHh+RMM6yd6mBZgpYNdYgkZRaiKBCPt6vsMKkJo85WVULi8LKFlpIIzIjUX99NcprRLvran6XPO0+HbC3mo8tA7lcG2onob1o0VGDUh5hqL0IzrPAMplobFWNKrb32Ild6n3Z3gAM1JQEZcIRe5d9BwXFVkZ092sQA0RGp5Z5Got+QHcLdAuPq18GC4Zw55SX+wpXzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YBk/bVve6+E04fjW2/9AEKokJZn/+LIqJBMDsw/IL6s=;
 b=pyfEJHkvEpH9kfhOHNx7b9NznxLcUs0HAQQvshklaX4MQ0GpsuaRIIY+ggRMNMl/WKHjFZg88MlP0B3K/yrywklV0ToDkDVDTsdtAoeA/U7/cHuMaqlNNKNK6sydTpMMgNABUgbzXDfZEJWocQnWcT31uY5WCi2LzXVt9n8908c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB7149.jpnprd01.prod.outlook.com
 (2603:1096:604:137::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:33:32 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:33:32 +0000
Message-ID: <877bvxwgpw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 228/292] ASoC: mediatek: mt8186-mt6366-common: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:33:32 +0000
X-ClientProxiedBy: TYCP286CA0132.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB7149:EE_
X-MS-Office365-Filtering-Correlation-Id: e023e927-b7e0-4250-bca7-08de20b9f15d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3Mjp/Arjx7pyYK3yUkLewFwNi3pG62EVJqZGU977WFALtZ/2+1k6SbPBBbfG?=
 =?us-ascii?Q?CxjTOuazMdY54VOdseABuyf7RiwlbClufSr9X78keqNTebOziggZB387lTAu?=
 =?us-ascii?Q?wzCw6CJTRmrVLAqhIo/pmYvWrdcrIHpYPngPHw5Dfm9egBAvaF8HvpuShrNB?=
 =?us-ascii?Q?UZkggr605UOk3CNHTlsaKzGAqozf12n8koxVdXHN6EvS5VRszynNAF14YWg/?=
 =?us-ascii?Q?+cCskq7+zBLzY0u7asb4F13Y2HM7yigMtyPj9ax5OKcPf7mnqaFALCO2Phi2?=
 =?us-ascii?Q?/r+EjF8122KWoQFwHwAX4NECDmuSuo8mRuFGp99Z9bs4X8fX7SMQilPo/gfe?=
 =?us-ascii?Q?H13CHenswLnd0n132vC1nveokVmAqNmnfRiFDFVlZ2G9q/+kNN04aJDyrb3M?=
 =?us-ascii?Q?bBajQk2MnEZvQX5pJcT9oRgAwdC/1P2/x2PRehYXZiyQhXIRqEF2DWzxbNPI?=
 =?us-ascii?Q?QaftfGMYOB1ctm8E613IaKbsua8a1XTZBPdVmr7L+25r9xAeL71A+axgmQmm?=
 =?us-ascii?Q?pbCDdb4FbNBE7kdCVtoy+fNF5hTA1lmf7cvx3BfdgpvJgFHkk6xNF19HwKsK?=
 =?us-ascii?Q?xBUwUD2VPQjqUgfOgXvYUQqELQPFMTGkEaXcOh98jLLv4Br5bcKCfgJnEYwf?=
 =?us-ascii?Q?8mLMnUIzNq/k07Ae/OtdplItVNdgTuuT1XKnA+MBbcLeWSX0h39IXJsnGf+X?=
 =?us-ascii?Q?WOZtJxfGTczUlwtdNCDxISn+9UDP6q5ForCO/8rEM1e4j/c/mVokqOLKllKm?=
 =?us-ascii?Q?/QArtZ5xAMQAy/mWpQWRaZK96K7ecEetMQDHsH+yv/ILeYm/d1NYhFQB+pmB?=
 =?us-ascii?Q?ev1l2H2Lr814fIXN3OsljP1GTig3f7wd+akR5rHziyrANBoHNhJeRctPPbKk?=
 =?us-ascii?Q?Uw4n8uOF7KQbKI4znhnlEioD9+blAGIAa4L+As6624x01HtQi9ndXaFMwt59?=
 =?us-ascii?Q?F5phjdJoVXPRCHBpGkBffg0SoUhGY3pvDI1DGJIOpcESJaaNMkNe43sYH8F6?=
 =?us-ascii?Q?8n66OrkowxGEIjFBFV7UGvakVFXU3Hbg9jOv7puPVvhtHpQcawjJdP8jjGgX?=
 =?us-ascii?Q?7CrXP3To2DlPJV8mMKCAq8U5JMYYpxkm54k5GtnC0X968RuYzyKR73bbAekN?=
 =?us-ascii?Q?ckSCb5SlvTZS+4QJRNDSbbrXnhJiaOkOgC82hz+KMW2LarptZKYdTK1dEPTW?=
 =?us-ascii?Q?1AXcQuvyg1vkTmoYJ9MId78qDTXMoFOTYhCpI6ZbEcGvHK76aVfkGXbCUBym?=
 =?us-ascii?Q?ejYXtEHkH45phEWRGJL2EkTuVLCrvMEaYuip9ScLNYU4Nri2z7wJ03w3kE1J?=
 =?us-ascii?Q?HXACu6u9COEwI/GDRU87io8zS4+u+/qM+kJV7LmEwRH4Xw1C6EMmlFWE+fuA?=
 =?us-ascii?Q?+/ynpRq78sfKXoTbxrw1Q7dUJsTBv5kpO5+ySObGU9EWdcpHVIdNhTZ9S1cG?=
 =?us-ascii?Q?e2lP+CKCdit6u5sqEQavaaraFTe6+lmxt+HpPwTQPvK9XByzuKCcKgTbOzlC?=
 =?us-ascii?Q?g6GFLiXcAbEcwZTjaq2hHxK2FNeZXnjCqwbS?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uyx7ftUOsPJv//1C9gAVd4L9aJtWAD8sa2E2fheeo/VOu12xxCr6Ca/DsolN?=
 =?us-ascii?Q?bAcG4zm76wi8Ku4suphxsYLlcr47bRVGM5Tv/Gx7cZwxZJne5LDPEnLJlZCh?=
 =?us-ascii?Q?p4AZ81BsrMBW1W2myF/cpgEEj+KzTJ7grpzaOmCJkYbAj8HPho0Wpc2edENY?=
 =?us-ascii?Q?rAfNlnGtb9Z9OhghSmOjN1V3zpXryJuyeXunu7tNi9KOALAJN1hbU2D+6r9m?=
 =?us-ascii?Q?JDkvca4gnkSRM5EpVE5WFLIPr77dJ11T2CNCWQA1ECZo0zuJrUttudWVqOr8?=
 =?us-ascii?Q?y+93MG48q7YH95ppqWvwBjGjdfy2vRV+dhF8yC0y2xwA/tRW479+XiW7jDjv?=
 =?us-ascii?Q?xczW8MM+EL69fescQZVN3ylo6tB/XbSMVrMT/2wqJdZiMK0OYcNWDLC6mA6N?=
 =?us-ascii?Q?F2Rll1nfKoWkWHE+/xCG72CfEPqnyAqfFie6l+LbJrUg9Z5soFduzsV9sjSg?=
 =?us-ascii?Q?MQAeO/rKFmcQ0IUYEg5g8tMEtkSxs0fp0eicfOjnJEn5PSFbjFQoZ+XxTRXV?=
 =?us-ascii?Q?JhO+MB14fDtYsdYXiJUf+jcDJLJlRli45gh7wXg6tNUCJDl8RhKm5n6PqsNO?=
 =?us-ascii?Q?mAKzfy7YKpDbAwRChg5OMzeiwTYyZiMNenHxRUjhJsMabUK1KH+vJyK4QbUp?=
 =?us-ascii?Q?fDcaVc+Cb70zDGCwo/M7HV1XD3CSmBRRE0Jc4n25r5VPfriaO1cvaf55Pljl?=
 =?us-ascii?Q?wvMJ1QS4t/k52Nh3Hk3gJ2/UoiMNTOyIuu1QJ/lHTJRIrkMCiOwriBNx+05c?=
 =?us-ascii?Q?etISazSPb2y0jNR9xRJrqW66MwWJSz6XE32CdQYhD4f0ng0mqy9HJOPXzcFT?=
 =?us-ascii?Q?1pvD8wVHulISwQKY/32NQqezL2k+1f/2J8WmWFBoZt22JFuAUjt44fO8grs1?=
 =?us-ascii?Q?WE9Nmh9Oa7siKS3AiMzbNpLTBUo+Ws8XOasVKUk9Gc+1g7NjhHtQMSR30hLx?=
 =?us-ascii?Q?suPfyGGIboJlts3+WnmDxT1ffzTpcA9qBrCCsnOvFJjvv1wD1paa/giGmXFV?=
 =?us-ascii?Q?PAxw+uxtLsN1zBP8Zp3Uo8ThX7DWH6nZ7p4MnDXKIE43ZwrOIhwWo38Yxkzn?=
 =?us-ascii?Q?tW6X0o0eIItWFMeusk7yLbenh5fASo2ufLlfSIBzlHpOCF5wv2mS4OwlQ/Ai?=
 =?us-ascii?Q?tIA77SFVPBmTBWTce2S2e0wTz7ds7uaxYemLRac3hDd8pTqMmekJlMRALl0N?=
 =?us-ascii?Q?hOCtaPS/LGNH0fG4XD1v70Og/L7tuVXnH46Yt75ePm+T+rgQfkKQo0elJMXm?=
 =?us-ascii?Q?3Ua7PW17jxTBGcnQgUYUGDfG/an4KEAMmR/cwZF/qEbqjzBvgPbPe4JVJEeW?=
 =?us-ascii?Q?w35i7mOop+Qhq0+jJf15/8rK3tXtb72PbfmTG10vEWH7iBH81rD77Eye9z9I?=
 =?us-ascii?Q?aslqVcJ3fGFIbizJgqz4iNFUo2u4Zp6i1sqTmspdy6ydq0vk2Yr50rFabnuK?=
 =?us-ascii?Q?JtrgroWM7fINEbAIoVeKZ4IQOAwufmyxGBF32PGmEbrBXd4v2JLK5UFQtLli?=
 =?us-ascii?Q?F0XQ0OnRv0L8bwuDrblNV+eh2tfbmj4oP2st3C88ThWl/dC05sR537/TOnoq?=
 =?us-ascii?Q?Tq0aI++Ipp4siHpw36Hnh6iXKLJ3wozJRHSCQpmsApaPdxZ/nlhHJY8swIX1?=
 =?us-ascii?Q?amBQUHN6qvSz7Q0YfznFMTY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e023e927-b7e0-4250-bca7-08de20b9f15d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:33:32.4827
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zTYFExnJTSAb/q3fsO3KMtuqehiyMRph068A4wi4kLqPV1pZ4pMzq2bded5iaT5Rm6vlrSODyCcM9fqV5RvyWYbNleXPEVJb+VbKF4Bk2dpbHLsiohFGMM7ADcIz4Cdr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7149

This patch converts below functions.

dapm->dev					-> snd_soc_dapm_to_dev()
dapm->card					-> snd_soc_dapm_to_card()
dapm->component					-> snd_soc_dapm_to_component()

dapm_kcontrol_get_value()			-> snd_soc_dapm_kcontrol_get_value()

snd_soc_component_enable_pin()			-> snd_soc_dapm_enable_pin()
snd_soc_component_enable_pin_unlocked()		-> snd_soc_dapm_enable_pin_unlocked()
snd_soc_component_disable_pin()			-> snd_soc_dapm_disable_pin()
snd_soc_component_disable_pin_unlocked()	-> snd_soc_dapm_disable_pin_unlocked()
snd_soc_component_nc_pin()			-> snd_soc_dapm_nc_pin()
snd_soc_component_nc_pin_unlocked()		-> snd_soc_dapm_nc_pin_unlocked()
snd_soc_component_get_pin_status()		-> snd_soc_dapm_get_pin_status()
snd_soc_component_force_enable_pin()		-> snd_soc_dapm_force_enable_pin()
snd_soc_component_force_enable_pin_unlocked()	-> snd_soc_dapm_force_enable_pin_unlocked()
snd_soc_component_force_bias_level()		-> snd_soc_dapm_force_bias_level()
snd_soc_component_get_bias_level()		-> snd_soc_dapm_get_bias_level()
snd_soc_component_init_bias_level()		-> snd_soc_dapm_init_bias_level()
snd_soc_component_get_dapm()			-> snd_soc_component_to_dapm()

snd_soc_dapm_kcontrol_component()		-> snd_soc_dapm_kcontrol_to_component()
snd_soc_dapm_kcontrol_widget()			-> snd_soc_dapm_kcontrol_to_widget()
snd_soc_dapm_kcontrol_dapm()			-> snd_soc_dapm_kcontrol_to_dapm()
snd_soc_dapm_np_pin()				-> snd_soc_dapm_disable_pin()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/mediatek/mt8186/mt8186-mt6366-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-common.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-common.c
index fa08eb0654d88..e325d216c0089 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366-common.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-common.c
@@ -21,7 +21,7 @@ int mt8186_mt6366_init(struct snd_soc_pcm_runtime *rtd)
 		snd_soc_rtd_to_codec(rtd, 0)->component;
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt_afe);
 	struct mt8186_afe_private *afe_priv = afe->platform_priv;
-	struct snd_soc_dapm_context *dapm = &rtd->card->dapm;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(rtd->card);
 	int ret;
 
 	/* set mtkaif protocol */
-- 
2.43.0

