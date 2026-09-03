Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011049.outbound.protection.outlook.com [40.107.74.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2993016FB
	for <linux-sound@vger.kernel.org>; Thu,  3 Sep 2026 01:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788398079; cv=fail; b=CuOv960e0X6OCspWPrwnyHAbI0sq7fPGtoFZAwcPxArWf68JrfNDKmGPm48ldR393mPh0XDI33PHKP46SJG9VkZ2wDGFJ3XJqjF8bDgzFwg+6EssgBpeb3A11DIYweCHEm90fKM/Y37gB1UAMuofjRZHLMkrbB1Ryzta89hXxEo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788398079; c=relaxed/simple;
	bh=9v1ik6jFXwQQY6+KBxqbrJir6TZKLmaZ9o041vwoIOw=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=TM7lg8DEd/kO1MdBAi2FZ7FdBE3mAaXpXpxUmYA75Wcm188UuvW7NwyIBpSNdfeiTFzVqg7aziEjIA5u7HGLO2lF2Fn4oVYJ0rsFd9k/d82ow/ETnIzXjQeW74Vu81ab1kM578xp6sjacPTbWoN3LH7Le9rDRQNeruncWoQP8G8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=mVJcQcEK; arc=fail smtp.client-ip=40.107.74.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="mVJcQcEK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kg0e4kL+h5EivzVzgA57TwmRN0KdNV4k4Rp5LsH0DXROqsYE5zLWrs3T1F4FznD2VfW3kHUFh9NcTyi6LIf0FpnmrWJ73O4vRmV5ADFpbUfG4dN+lZ5IunXyKVkzWzQ8zzmNMPsszBuO6RJIeVJByb9kmSuhwUoErCuEK1aVuYoOZeFUzPKfayRDmWNtl2NtQ8xulnKAdPlF2sAnx3sf7bb/8Zwx6PVKsX2T+9m+f2al8wKg2wIt8bW95KouH95JUizXAVMyeuyW2IagdqYVsxktsQ/VgSOQ6QWGlF4k93jtnZK+EhqX2jEgkSfTN4m8CDTX3m2e0mzE5YEbmmDA7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jefy4u0ShujcgfnywnZsaUHTbOCFYi20IU4tc2dhcGU=;
 b=ho/2d4/0HfslolvHv3dcjyRa8COF6zor0teIPCQgs40vrUh3x+wm7/KWE4HXCA/XAXf4PnXHvlDUyHyrBH9GV0kgKtj/In81zaPoQ8AA+7QEsqVlJPbfiNYGcebxdNm1huSGFUd0Vl/rdZveLQZOuu2DI0TddIyQYBger+fK1aQ6x6473UiJUB/i++ilKt2qfD3PNfgxh7UP7jULO2aqCbXv6wTTrzVUBvjvqSeWgoDgyLeHlyGb7AF01+Q1KL1aO9cB7A44g45m4EHp3GjPFBFgy0XgvhoGjZTpx7YKvAVrtz14afngmkPmIPLsUvix+nQD8IH+9Ds5bkGszBfOcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jefy4u0ShujcgfnywnZsaUHTbOCFYi20IU4tc2dhcGU=;
 b=mVJcQcEK5sU60t4tT8xrAB+RywhO0OiAaMDCkGV1jIiRFKrFmihN4oSj7+BFL/eClGmESccQre5/HAlYFebAoCjgr04kp9FdbJ+wNWrw+q1/PGMcWXQNHAzk1m1l8ESZonby4VItq/75fI8I3NTmRexQr6sGV2rL6xJKLCowi20=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by TYWPR01MB7169.jpnprd01.prod.outlook.com
 (2603:1096:400:c7::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 01:14:35 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 01:14:35 +0000
Message-ID: <87a4pzyw3o.wl-kuninori.morimoto.gx@renesas.com>
To: Jarkko Nikula <jarkko.nikula@bitmer.com>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sen Wang <sen@ti.com>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 18/21] ASoC: ti: use .auto_selectable_formats
In-Reply-To: <87zexzyw5v.wl-kuninori.morimoto.gx@renesas.com>
References: <87zexzyw5v.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 3 Sep 2026 01:14:35 +0000
X-ClientProxiedBy: TYCP286CA0208.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::18) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|TYWPR01MB7169:EE_
X-MS-Office365-Filtering-Correlation-Id: beef983f-7666-4f0f-caeb-08df0958b7cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|23010399003|366016|38350700014|56012099006|10067099003|18002099003|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info:
	jqIAACSs6ttlvSH1RmvJ4Tl45QSQI7Cr92HpM2XXBXwVnOG1k9+dm+aU9NEcTRweCEv6xPRePutKDQvqpgv/SOl5zBaatozekn64qLar4SIdOxTnIpycx9pO3BHKRrWueTe98drj+IB5lteqACvy4q9k3fJ72whY7iGdH8gwfFJOiK5+V95AY/JCZjYaqllSNKEGYe+VqZkuoH28aLRYx8B/J3dSP0eEeL5tUqtVc0hOPJHTOXOD4jsf58wX1NTjj7Wh3V93ACof20a4cHav3Ubn7UiVDXNqiihcsDTHsyVlTIcCz+AExWIOR5ov0PD/O4C6ABWPmwnJc6qoW1V57V8Y1RAHMBN2x7kfnwEgqMmiITuFVbM5u9aYfGuaoOBwyaTFKTRnYlYKM8mIAjpw2wmL3cmYvV5qR8xh13aYDhlINUUGcJhubEk1ZPBdPapIg8I/X0AqxP6fMTXRGOMrjPF8rAPeK3dlSiLVjcDpRLJe1eXLO7kNY6OSjYHyyCfvddeXm8ZhRvPpsyENZI4btnAyInkkOXt66pA7pVKtHtcTA3MXuKcVLhzzHGeg6mcbv+cAst7+ppLbO8zEMQggYPagkrY+DIHCQx7phUfSqw+o8kv9SW0XMkdQgDTstm0N3SvEWEOsRdvYwzfyQuOtc380rwNkHKBlUaZPlx72yU/c+hah7n+gsxapkGBHuCJuRcgEhCK+mWL+ZkkGo0Io0Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(23010399003)(366016)(38350700014)(56012099006)(10067099003)(18002099003)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DI0E3zCnr4P75qm1AEIyOZcnmqFP6f1W2T1w1igcKYykUaFDLtruWZvCSqeU?=
 =?us-ascii?Q?faZwxki3ABK+XUkmPUDoLIAsWTg1tElEtrkyB+1+dN3xolyRH/qW4L6MDyvA?=
 =?us-ascii?Q?0yrb1OhKZepYHTBfSrv9Fy9S5QNQ+lPb/GRoLVeEmSLI+aRFSpnAYBdH7NHb?=
 =?us-ascii?Q?sufOac956itExJ7BZfFUfNWJ/z9tAVWEzCbu9cYBTx5JZDdmoTKd9FMGLiK5?=
 =?us-ascii?Q?uY1dheSYXPg+EKNMi2hVirdq8pVRxOmBN+1l25NrxjM1ueseWTIvxs/sEWfE?=
 =?us-ascii?Q?UC5uhS3n7L08UiVxSWHTiPSKgP2azjn6YMYogy059HBs5IbQ1BqUajImo9Nz?=
 =?us-ascii?Q?KdMBmpKQK3yFXRHpFE4R8XaBtyrH72s7tvzmKsc5GBMJj9kcJCo+1HoSyQL8?=
 =?us-ascii?Q?dKGRLKkvzPq8GOWOHkcYtPO+bX/UQ5yAMsTOTCv+4KP2FhNdrJWBf5QSNrpY?=
 =?us-ascii?Q?sUId9y8ViQp1nbPZ4pOVNpoUHqM+y3GCbLtwkW1JFyp8lsusZ4WZOMAQ356W?=
 =?us-ascii?Q?ppPniCZ0SqOxU2lQiFC5VR3BnnNvQUIdsXszlfEtZ5MQsdkmsttaqWZckvXo?=
 =?us-ascii?Q?M9hwhWn8tRzlrc8kKn2AZhvIHdHok58ed7bJZkZUENMaxD9y8Hhi0zHwA4GS?=
 =?us-ascii?Q?5n3HZKSZrg6/LmrjEKdHx+1+tiWsLW5SV2JqpyCtRmRYbrxU6k+jh27I+pu7?=
 =?us-ascii?Q?6Vx03qbe6R9vwMDWLhAkJb1F4V0Zyw5xdM6c6fgXciA0UaUnwENCM71P7wtW?=
 =?us-ascii?Q?oTuY58wUrNCdbEFUIqK3cdNF4LnI69StZoNCQCoy9pbEbzsdxQ1vtV66mnl3?=
 =?us-ascii?Q?Kg5T9OLnwOKF5yVYwLtOyWphx7ZG6RpuTjBHKN+u+QDQdn64i+n1Y1npXCT1?=
 =?us-ascii?Q?QqUNOQ3ORuF5J6CFrj2OWrJ0oHdkHM6Cye/ZCsdOR97bio+/3tNS7nkFVH/U?=
 =?us-ascii?Q?1TztrBxBU77cI6kz/XakWB1Mw3RAQLxne7QiwEXysSivT2UrILkTfuxxD7pl?=
 =?us-ascii?Q?dmmIJ3RBGt3vWXRfSWvwMHE+1r8S/vRHLfk1k07V/2i3m0HV2XIRc4VD9gQG?=
 =?us-ascii?Q?Gc0xmM7O2jnXRtQbKPFm4s4uG03b9uWcNwOMwVbKpRq8Tqm6SauM1Pu8Jfpm?=
 =?us-ascii?Q?wz+OgF0ZAhKBEgxyAYx4F2Y65hGlPBelkYscFW5kUw+Wd9bWVC6JxGOiqzF2?=
 =?us-ascii?Q?GKZEEVo8UZ+pvNOKSd6bBQkdE9mTc8zQJfOS+Ei05tCiExvskhoeqyJW1ufB?=
 =?us-ascii?Q?NNnUodqEJPf7oynU/rjwyxqY/dqEOahoclKvwEJQnMu29ZNTJRRVTtUSGKhG?=
 =?us-ascii?Q?jNmhrJSmQikRBODFF29s3zGNcLZUvrj1YhivJvERVSTiBOfIXNTQv/mQEpuX?=
 =?us-ascii?Q?mJeAc/zSCvvhHXadwYASXdgM9qc6wwD0IwVjAQGsGQTjxl0V8PoLLlsjcl2R?=
 =?us-ascii?Q?ucLC1MTcN+cyhFeT+I9B9HW/3kU6dQqqdy+g/l0Xi30xuEroVe3ObGx3HLqz?=
 =?us-ascii?Q?zwnW0CGigeqy/aHUlbkfOhcRSUAZPU25D/eTsH17lPhza121N7UQNgLbdRqZ?=
 =?us-ascii?Q?i8FBGIyReoIic5zDmoNguzXWR2PI6ooO9NZTDmOV9Zu+kgO3gQatXH0VR/9h?=
 =?us-ascii?Q?I5esP32DnMEjy9sS48y18igzR7o7axtPdZxx/mnPJPP1DO0aiEQ0owx+5wDK?=
 =?us-ascii?Q?nlsfQ6fmg4T//p3IvzzRKBTiOYyp+Bw8/nwCg/2OsavRojXseKNvGYa4+ZmQ?=
 =?us-ascii?Q?sNrU52x/2NKiuGTb8zehqfOamxT6cF9+XR6u43F/nqGX5tFkldAp?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: beef983f-7666-4f0f-caeb-08df0958b7cb
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 01:14:35.6580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2n0pxxkMo5i7ecPjc0pGHgl4s62ZgZHxItvC+ybV2bxmjK9B/fgNdll3PYmLAqEqhhfr2h1o8UzBQdH2cOqEQZP+Vi3u6Dg3FLknkEFbV1j05j1nnVgLy1mwcjUv6y/H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB7169

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/ti/davinci-i2s.c   | 14 +++++++++++++-
 sound/soc/ti/davinci-mcasp.c | 14 ++++++++++++++
 sound/soc/ti/omap-mcbsp.c    | 12 ++++++++++++
 3 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/sound/soc/ti/davinci-i2s.c b/sound/soc/ti/davinci-i2s.c
index 059967f0e632c..ec7eb2f19b6fc 100644
--- a/sound/soc/ti/davinci-i2s.c
+++ b/sound/soc/ti/davinci-i2s.c
@@ -743,6 +743,17 @@ static int davinci_i2s_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const u64 davinci_i2s_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_CONT	|
+	SND_SOC_POSSIBLE_DAIFMT_GATED	|
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops davinci_i2s_dai_ops = {
 	.probe		= davinci_i2s_dai_probe,
 	.shutdown	= davinci_i2s_shutdown,
@@ -752,7 +763,8 @@ static const struct snd_soc_dai_ops davinci_i2s_dai_ops = {
 	.set_fmt	= davinci_i2s_set_dai_fmt,
 	.set_clkdiv	= davinci_i2s_dai_set_clkdiv,
 	.set_tdm_slot   = davinci_i2s_set_tdm_slot,
-
+	.auto_selectable_formats	= &davinci_i2s_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver davinci_i2s_dai = {
diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index 79239131b6598..ad9e194a3d0d1 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -1993,6 +1993,18 @@ static int davinci_mcasp_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const u64 davinci_mcasp_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_AC97	|
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF;
+
 static const struct snd_soc_dai_ops davinci_mcasp_dai_ops = {
 	.probe		= davinci_mcasp_dai_probe,
 	.startup	= davinci_mcasp_startup,
@@ -2004,6 +2016,8 @@ static const struct snd_soc_dai_ops davinci_mcasp_dai_ops = {
 	.set_clkdiv	= davinci_mcasp_set_clkdiv,
 	.set_sysclk	= davinci_mcasp_set_sysclk,
 	.set_tdm_slot	= davinci_mcasp_set_tdm_slot,
+	.auto_selectable_formats	= &davinci_mcasp_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 #define DAVINCI_MCASP_RATES	SNDRV_PCM_RATE_8000_192000
diff --git a/sound/soc/ti/omap-mcbsp.c b/sound/soc/ti/omap-mcbsp.c
index 26af616c33f51..5734388a4e4b1 100644
--- a/sound/soc/ti/omap-mcbsp.c
+++ b/sound/soc/ti/omap-mcbsp.c
@@ -1269,6 +1269,16 @@ static int omap_mcbsp_remove(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const u64 mcbsp_mcbsp_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops mcbsp_dai_ops = {
 	.probe		= omap_mcbsp_probe,
 	.remove		= omap_mcbsp_remove,
@@ -1281,6 +1291,8 @@ static const struct snd_soc_dai_ops mcbsp_dai_ops = {
 	.set_fmt	= omap_mcbsp_dai_set_dai_fmt,
 	.set_clkdiv	= omap_mcbsp_dai_set_clkdiv,
 	.set_sysclk	= omap_mcbsp_dai_set_dai_sysclk,
+	.auto_selectable_formats	= &mcbsp_mcbsp_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver omap_mcbsp_dai = {
-- 
2.53.0

