Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011059.outbound.protection.outlook.com [52.101.125.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746C624BBEE
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 00:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786064112; cv=fail; b=PF3zbC+2oMbt0D+3cX3uGlRIxbU2stNHug1HbOjAZv18HbxmsdCh2Zk7jVNDGBJkIfJn2MOTOfvzalBMorNstmk8nnHHrbkY3x1qQDcMRcWgpidCnjtm9J7BpkzNdEOzQ5w6EK/r5KcrrvH7xu5Immv7ZI1Y9/zZtQ9erIIRv9s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786064112; c=relaxed/simple;
	bh=V4uC659U8yTCo5pcB+9fANMwLRt/nm8G8jLjcFfmatQ=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ku6oKPDh3yFusZucoZYMWHQtSC2cwVrRFwLKosl6yYc2HIMQRPqu39stCNvW6VkQolbvkTLSYizfqq85cguub+BLMlJKf+rwXdI47tFXIngqQ1woVnnZwY5LiyTEFTZ6iF2h7zPuyvCYSw3/cj/Lh85/zq88xCk3+EQrFWmJBUI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=CVUHxRrF; arc=fail smtp.client-ip=52.101.125.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="CVUHxRrF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hOy0+18HyF4okVTTDfVIVr/jE5Nkd/riER5+7SlG14Y6L45+qT+JarTA0fiFbtitDWDjJKdBn4sGBxGyKOljC9I9hKwHY6Y5I5dxh83CernfBtW4BOTvUAGJLjVMicDuYRC8hgv5DpQX+1Y/LmDdD9yLibTKEtxcTMlRuRGDsMhHicj4YQTXdSwdqeD5IacEsT289pVz92FU3Wa1GHdzwGkDmdMC8LO3tPSAoTfCIJc+FbRzuJpOZ8hk2drQxC/aJJYi7Vol9hzwUQGrR3F7aKs1cuXpCZ4njqc0FjBzxV4riCQzKqp+h0tutSyT3p93ibDXcBNsmWfCZcs4oqFudg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E085A2ZJ76weGQI4Xx/6SHUYMzko+qZ/tWuIehppRfw=;
 b=YG4RVNWFLnDNE2P/pm5zHtga7xp8M3POppToT8vTOCKOqZ07Ld10O/sm2TDgn2u1gOeoWm74djDHLmEy9bhoBlkj+feP3BssgKAQPBxLTA6/4XEKUqoVM3j+N11pn11M3Xzs4DHCghXjnaEXEKOrOjisYaDzLo5gkJmuuEMsq2LBYf5c2lspSg0fw4UgkVFCzz/vSe+1zfyz10BerPL9jjIVy69NFGLaEz287+3IDDm1sGKTePvIVts1Xvd/7J1jX2DhJo1KUUOOqAF5H9OjeA97RkazzCBZemhzMCDXaiKXUGf5HJC/tKyn+NEtoZx9E/S7sj9mVXByQvueqQHvGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E085A2ZJ76weGQI4Xx/6SHUYMzko+qZ/tWuIehppRfw=;
 b=CVUHxRrFuLC+fbaJzj6UIyp3BV7IGSYNjTBaVUd1TDux+z3d+vbcUG9UfJiXTdwOQRYki/wqbIwKf8T7kr8znEgPF4v+apAJOSuSvd8sdEzhD3sqpqkFDthUnNyf9UkITPuL23OeXqt17cVVysbSapgTyCXpwflnuvy3uG//YGE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS7PR01MB14460.jpnprd01.prod.outlook.com (2603:1096:604:38d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 00:54:59 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 00:54:59 +0000
Message-ID: <87ecgau4v0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, M R Swami Reddy <mr.swami.reddy@ti.com>, Takashi Iwai <tiwai@suse.com>, Vishwas A Deshpande <vishwas.a.deshpande@ti.com>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH v2 20/44] ASoC: codecs: lm49453: use .auto_selectable_formats
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
In-Reply-To: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
References: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 7 Aug 2026 00:54:59 +0000
X-ClientProxiedBy: TY4PR01CA0045.jpnprd01.prod.outlook.com
 (2603:1096:405:372::16) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS7PR01MB14460:EE_
X-MS-Office365-Filtering-Correlation-Id: eb13b9c4-e602-41f5-a5cb-08def41e81bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|366016|1800799024|376014|11063799006|56012099006|10067099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	RNEWv30QhBe1CQvg3OCzWdVIXJm6TqdvfK2VGSNbBzJvzejvy8hV6BNDW4pTeB3A6SeJ684w5mvz8hzdUjYMxLfTV8LoO/nCu65oO7+3Kzl10szpAF2vZ3+QleCQ+K7BwcbXy7c2ucnElIAtLBYhlvyxu2vC6MuhnAXdw60Q+9E1D5GLCC2TLDfMknBhdSVxbAS7Up8mbDveFo+z0kmGyTACjawcfietayMOIkwOsVIG1dZDufX7VAj0wpuLcfYw2RYf/CzMsbDMUE3dkAsnHtXDP54T5yGmrThF1zC6b9cnlNVRHKH9PXkPytEnUf/tfW8FJyt50d4Y0UuNc3bbZ1y+gvfx5Vq8dKypbW5/0GFxAukyylNtDxfWcrab2YudedepAa6wufcjJv/I+zRfm7Wpq/p8PU22pk14X+KpWROwz42qyls17vzSL0hcXwPERQ923ik6yi0MbtRYS6zGqvxsdlK+rFKlr7SH15oTB0s4O6UU92lSYDmT53WiqAA21GcIpwxCHd6iU6xxC/hoaZR2w0D8GYqDalCeyr7lHvsmb1llrHpRZv0MvilTHEBIGAQlD4O2bRfxA/Al13ADygk6VcVVZRiO5sw4VOnsM/af2yRbcUn3Fi2PiMsYADcbLCkjaQajVS9G1O1d+ScnI39wXizZU3j66gsPynu1lXfwjdwNswfJ7uhoOH5E0W7u0HZyHRttUVZAKEynhY4omv3DwUAB0nUYg/7nK8NHzUY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(366016)(1800799024)(376014)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AEhlegVAC00cfGhgaWkLrDRqXYB+kQvmHnpkxgIt44C3yZ+E3NPKbPtDmCS5?=
 =?us-ascii?Q?kfcN9FkIU0/jJVfuQPAopQBOA0jtuv3XImotAA9bVsf96WtkDgBZ9Gd4GdHW?=
 =?us-ascii?Q?YENTkKsi7zrIzQvxaHiOb0uza31Vu8qRSWKQ6XPw/WbyAx8mceys5W9z7G58?=
 =?us-ascii?Q?QGUNaN3lSWuGoXQ9rQiLvHBHvdxYZw5jpsJvM+qpSFqaCl5GcBd0kyI5pyd3?=
 =?us-ascii?Q?4DrlHX4Ol3V+4pdiMVEprJRt+e34jybAbK4Lx+P+YHZRxYHi4+LCjawot/Ln?=
 =?us-ascii?Q?x6AfbeoWFvXlnA1l1yksP/KAaVp1QT7Wyt9Om0ZqwVDPCuV6chAV/cDSuH0A?=
 =?us-ascii?Q?ftO03Lub8TpMktAfqs79qhEQmAWcOD3P+Onu1ATJkYFybPPFUna444AlLlAJ?=
 =?us-ascii?Q?5b3bq6QI49T0VviT2R648YvVvEvjsVndrsVKLo8eMSvVtl3GPJZ3Snu5GPhU?=
 =?us-ascii?Q?blmk7OFzQr+y2hmeuYS4hA58kFjNpcpBVpR5WEsF5lgFr5a6sd9DpUWAJMbv?=
 =?us-ascii?Q?NNQJ3s9Wsuc3DV1wjqU53DeQAqbwR/RaCngnlgI1i1GhGLqiJtKfLTz3GWOD?=
 =?us-ascii?Q?78RjXUCtJ/fNV6VbXb9wfO85YgFLrdfgp9Kk5nx5bJh3y9vxzU5E/tr71u0X?=
 =?us-ascii?Q?Ppa/aJ//1+ZKyE3+sf96fg8FMmPu5wC9FlhEcxPrL7LlJeWpdqQYIGdJABS0?=
 =?us-ascii?Q?saDPwO1H+4Kf/UizBGFUHuAsypWvy/IY4L1jjmUnukONH5Q5oj4KiUFyRFZd?=
 =?us-ascii?Q?0zEezEcTRAtcn2QtP9oaBsG/aWkm3+/gx1tD4XENeRXmvWizLHYTJbol1wr+?=
 =?us-ascii?Q?yFX7pl7Q6ClRo3jQjxpEdD2xdJrIpiAlkREyxLzxYLn3auEpVlvqssdlNp+c?=
 =?us-ascii?Q?2hI4liLDBmOBnF0KiQpKbwMU5MhykdkEDA6WfTVjNE4FObmi7P0jsveQlJYe?=
 =?us-ascii?Q?h1SEYTfJR6GG0DWr3ItOOawe+JbGHVrhsDgyw2LzcjhA2IQEE3nBKRd3Vo7n?=
 =?us-ascii?Q?ctoOucLaYrfPw4fRKzrjsRNJkNn1OQOWODHwTrhlEx0gp71yIxOnWZP+mSTk?=
 =?us-ascii?Q?pMQ7Tov8GAq3HQF3FdQAFW/7etbTUZdp4K22PBbprL0JXLnpQ5kfiDGPAF1W?=
 =?us-ascii?Q?s+8vayFhy2XF+0anR7kiTcv5Jdcd1GofLxwcA/oY+UHEYrXq9tFs6/Z4pjdK?=
 =?us-ascii?Q?C+rz3hKNXDRKULDogIYBXIVeGaJiAopFPj51abQYq1/TmfM54opczLjEYWi6?=
 =?us-ascii?Q?p0e8N1qArfw+oFRuvUzb3GkoBtsrq6wvIgU2Y/aOKUHBr+j14RmH815X0j19?=
 =?us-ascii?Q?8c6qCmKL5PtAsDg6PsUAVbXxcgXCgu19RE4MDy/mHRNDM8Rc9Hm375rkAzpt?=
 =?us-ascii?Q?W1n336ax2ucg1oSUXwMS9dN4+4Drx2Rh81y7mJgaXxCnyjEdTNCNP7a8oNKr?=
 =?us-ascii?Q?xsIroYkAHNuthx7Er3X/5ON6huukI5/SELbKP0ECJ+8owzSykvE56QXSHRvd?=
 =?us-ascii?Q?/MoOZxF15BK3yZ7RxkQcmrHUvucB2c3jI6qJ5z7wRXmnEZbEkpDsqSA+M2PP?=
 =?us-ascii?Q?f44SoROk7H4XwE93ZWJxv4WCtpebJyj9G624gz0/123l7buy4pIJ8H3fKguq?=
 =?us-ascii?Q?kEFcTuluaqEI6yqdnMv3NVlHOXZjOZV4ufuwlhKXK1KvEbUHx4wa5rtp4rXo?=
 =?us-ascii?Q?HBU0ROzTtYL/65OLxlvoejR6HZTYaNdEu2TQjHjq80Wmfm2HkPr2sshaaOhX?=
 =?us-ascii?Q?HH9KwiLrDZD2KBbfyneOd8s5KxaUoZpvtIvGe2cEVENXWPGKOoiS?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb13b9c4-e602-41f5-a5cb-08def41e81bc
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 00:54:59.7543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EwnK1GSIQbhwGz/WhogyDeB77q7oXckNecm8CFeHKMIoYMUnflVWlCYpqErPyMIX7BPtDUiM5SiuyEPXIde7/YFT8kPloCZSW9fuT8E6IZMoz7b2tpARY1BP0Xzx+icM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14460

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/lm49453.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/sound/soc/codecs/lm49453.c b/sound/soc/codecs/lm49453.c
index 6e2e292d143bb..991555bec712a 100644
--- a/sound/soc/codecs/lm49453.c
+++ b/sound/soc/codecs/lm49453.c
@@ -1283,11 +1283,18 @@ static int lm49453_set_bias_level(struct snd_soc_component *component,
 #define LM49453_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 			 SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 lm49453_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
+
 static const struct snd_soc_dai_ops lm49453_headset_dai_ops = {
 	.hw_params	= lm49453_hw_params,
 	.set_sysclk	= lm49453_set_dai_sysclk,
 	.set_fmt	= lm49453_set_dai_fmt,
 	.mute_stream	= lm49453_hp_mute,
+	.auto_selectable_formats	= &lm49453_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
@@ -1296,6 +1303,8 @@ static const struct snd_soc_dai_ops lm49453_speaker_dai_ops = {
 	.set_sysclk	= lm49453_set_dai_sysclk,
 	.set_fmt	= lm49453_set_dai_fmt,
 	.mute_stream	= lm49453_ls_mute,
+	.auto_selectable_formats	= &lm49453_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
@@ -1304,6 +1313,8 @@ static const struct snd_soc_dai_ops lm49453_haptic_dai_ops = {
 	.set_sysclk	= lm49453_set_dai_sysclk,
 	.set_fmt	= lm49453_set_dai_fmt,
 	.mute_stream	= lm49453_ha_mute,
+	.auto_selectable_formats	= &lm49453_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
@@ -1312,6 +1323,8 @@ static const struct snd_soc_dai_ops lm49453_ep_dai_ops = {
 	.set_sysclk	= lm49453_set_dai_sysclk,
 	.set_fmt	= lm49453_set_dai_fmt,
 	.mute_stream	= lm49453_ep_mute,
+	.auto_selectable_formats	= &lm49453_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
@@ -1320,6 +1333,8 @@ static const struct snd_soc_dai_ops lm49453_lineout_dai_ops = {
 	.set_sysclk	= lm49453_set_dai_sysclk,
 	.set_fmt	= lm49453_set_dai_fmt,
 	.mute_stream	= lm49453_lo_mute,
+	.auto_selectable_formats	= &lm49453_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
-- 
2.53.0

