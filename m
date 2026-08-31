Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011003.outbound.protection.outlook.com [40.107.74.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543123C6A5C
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 05:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788152872; cv=fail; b=qPAw1GOQ1cEmOgD3mci9ODBmeU0kVx15+pMyOA91fPqLa1XncQDcNTkDfKSxjsyg2LTiv86pgR6+E95oYL+0AsxCUc5L2QXHs+PSnZAjxgMR8eSs0p7kOcpIAciNamIIzwcwEPRpjBS5+xWmu8hj03gBOuq87UUyfB6cMzvNVII=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788152872; c=relaxed/simple;
	bh=2jznu7QIZiO4NsD8pziTepENw4yS9QU2jOPgjB8Co1I=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=RQXOHZXlotNL2GI/6B0CcJxShQQ8no/cTipFKUWy2GikZ3n8ZFSx0yedBWuHjVjGpJcJjIit8wNKtcnCzqf513+TalFsiLrPPoJOlnKfWxivFwZesHhaO65Tt7z9Rexc+9/mDGHX99xbC84A4zga1rSAskXIYp2pVEABo8vMgiM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=OGF8/S9G; arc=fail smtp.client-ip=40.107.74.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="OGF8/S9G"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UkxWFLKLON99l2eNaSWxFHgI/kklxxjLQn+0M7MVldvalhiEdP2BmAnYWHG5M9Q+E/Grt+MA3LHyZg/9jTCMF6KC0vhOavIDhxUj2k1qvwqbjjsShda2b3qLFER/dK1dpZTaLUvL9jlBMh/5j0yIeG+kI8Zl0EotSgHRuCiTQZx9XMsbCARMBEYkwsYLY4LzoMi1FLT9wHaV4wcXk283lsORyhwIURuXrvZfqPbo9VmY5vl+3O0lNXaHri9CodWurE8nq/TldLJW3n8fAYSjtedY9VcjRlwCl/smdXXJe135Xj8aWUQyxJcVBKIH5VpIJwH8dS9cIn2eT3spbPNIhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w2QPMXOOFSZK4tsQyCXfFC7+AhQEnaxnIw6Ttn68Zhs=;
 b=K58pCn3k67UrwtjZmM/Nn3D7TlXPi1Zf1ze6fWuXgVkTD8Dtb7F/hXNMDpaVrHHTY7hSDbre8gWJ2KIMwDyuUFrGXyV10dunU6cry2xhPqR78nI0Tm02PufDe4MznAjeDTS6Nh3YDNH8EUYsvuf2QUDUh8vs6DXgIcX5r3cFWI7215TPdSDOaV+6JrD2ESd7fLbMPMnPg2bvQGHK/FaxcDkdTQ12L4YKXlAyeog/57yfAV2NsjvszDO72gDPQLxf5x3v/NCjQpzHi0uYBn14H5j7ubJNn+l9Uo1KyqFnX92ZfbBKuPUtWT2J7C3IZGrNUUIwowxh2KNqOPnGtabvkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w2QPMXOOFSZK4tsQyCXfFC7+AhQEnaxnIw6Ttn68Zhs=;
 b=OGF8/S9GD0zdKK1vG4IKCDgZ/bw+HHWRMOsMW2y9GyYwWXEAPjfw+ePn93hjnwRj8+o2aDXid6cbVsFOJliHbrrcttyaqvoxJjw3KJ+3lLFv1yBge3l04dAPD4NlaXOGqJyMdhL7+fIaHe2DAu8QTdEbj4BGkTiJGPxmNvp5DGU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by TYRPR01MB13019.jpnprd01.prod.outlook.com
 (2603:1096:405:1c7::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 05:07:48 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 05:07:48 +0000
Message-ID: <875x0qvpwc.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Support Opensource <support.opensource@diasemi.com>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 13/39] ASoC: codecs: da*: use .auto_selectable_formats
In-Reply-To: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
References: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 31 Aug 2026 05:07:47 +0000
X-ClientProxiedBy: TY4PR01CA0106.jpnprd01.prod.outlook.com
 (2603:1096:405:378::13) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|TYRPR01MB13019:EE_
X-MS-Office365-Filtering-Correlation-Id: 792ec890-5c72-46f6-b73e-08df071dcc78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|23010399003|18002099003|22082099003|56012099006|11063799006|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	oaXONkYObE+wxM4arVb0EOM0/Zuwr0Iyk9rF15XSt4lka+jq8gMaGFssXY+iW62rwnTuw8WCQ7XjKMU0hQgGrvUniLtM/f2bNcQ2I1ISHk5F26qtRtXFsTfBMl5GGqYZeFj7os4R9T9U0sj7UAi+QrMPLdFagfy7y4jUWuVRiwDKBCravkhBfd1nzBeKIOCGSR9w4mNqn8qFXohkKsyySRMTxxPKojtD5Kpu49P0P3OYkSDL3g/j0stc8l/wrfTeuDEjbYslwqSJ7Z6MmWKmYE1rWVQWwTl2yo4cKJpYX+s0Jq3Eouvl7wCd5POE7h70RJzLIOrWjssbGmCAoCCyRiGlbAoXOJtbl6E87VxFnq1+lNkOYjvzP/aAvRJzXwfboer6PGKTVv88kX5+SFT6ulUZp4ROmNYMBG7LzoNIo4eVqn0eVEVjnteBH1xb8IgKen1jyIT7w6zx5JiVdajwIuUH7Flfqd0SwQ/3lSZjgpQ02Yun9VxtAMUM/1XOPXPHnEelLlLNhEoS123ENwxrbT9nTcVB7nUCFcH60U8UNbjg9i5hrMxqtESi8lkMAQxVMMu2iPVlDCJKeaFxr5BQcMVM7gZwIwMOXed4uRZncqazeH2BYZg7qUMrI915UNdczRJEwKyX7TGOrLuZ7t8kPUciZqTp32TCbR/WCutVNeVkhakxLl3Z9EUgIm9HvBTLWziN4lOcJoNHrsGRtq7BvZRdAYX2snnRa7wW/QufEE4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BSncwX6zw+Auj0pECMVmFKw0pJybM+wAWmzqvSUCC0fNT2jPRavmmubwjE9Z?=
 =?us-ascii?Q?+VG/4uE6fFxg8nrcH4SeFt47qYUi+/wyHJmL5lNw30WaCLFBlcdV6AFbGAsC?=
 =?us-ascii?Q?dK1CzlyKmp+2E4dihb4VWphvoD032JbHQR2lJ2nn4g5UE5oU65Y+tN0mumr2?=
 =?us-ascii?Q?oIoT98oEqx2x0e9Oncc0dq96LgM0IxT0hBnFfD9BFUOH9wCPPh7I3VcsQDB4?=
 =?us-ascii?Q?d4I0t9ZsWXQ6cNGLQI/AX+H2uzGa2dfr2RTkwUB3VpbbzkfUySvyqa8ZzdrJ?=
 =?us-ascii?Q?DziCPRJDWUJpRlhqpb4ZickzjMAMiloinyNnRot/W+I+JR5M5K7saxlTQCRT?=
 =?us-ascii?Q?dBLzEohIDiRRVmb6Kh76suwFd/WyeC+6OQLXTUznNfbd2eTlfD4dSPVlfjQP?=
 =?us-ascii?Q?ckZchyWUe/1s7IVPwshHJbZQ4IJvliy1F2WL2DLyPYhBKYUkqDyCypa/PCOE?=
 =?us-ascii?Q?ZRfLvGEQlu/YXsPtP5kI1TK6Wg5rE5FSxQokFqhI64+L1h9pREculeXSWWde?=
 =?us-ascii?Q?U3LPp7eAjZmR9AejxdJqQmYoxRmEoZ8I+5gaMX4dB+4XNJ1NgP0M/K1ZvBNC?=
 =?us-ascii?Q?9cMTwsxPYLIpubnVciQ75daKRlmRxGFF2xfHWvnkLrfe9huRgU3tVQA+dvwR?=
 =?us-ascii?Q?AWWUz8pvt2q7MDvc6CLO+52n/DdjANS2Hp5AK0COWb+PE25kEaMf+ezcRtK8?=
 =?us-ascii?Q?ea79zvChQfRmX9ut20F0lj8WjqAgYyrzkdls628qm5jwvHOyYb1CMgZb65Nf?=
 =?us-ascii?Q?bIlPlZczdtlg5ioy6tD7Wd1ocP6wmjKlQ2E49TzRqCm6r9qISIO9ddVRL2Os?=
 =?us-ascii?Q?s21KueW4rGwZnXDo/Xwkp1QfeUNk7n5DvZ016tFXg+gPVv6RDmqePPNY3joD?=
 =?us-ascii?Q?sUonzV0jxXW5s00yPkO5YOEfVR4Ose8jp3OJN1bztWkUSSKMGBEKRMuAMynS?=
 =?us-ascii?Q?uo/2iOEdFs0G3YMYMJVNZdeBW8us9RCxmgxATQHa5ys5GDbUso/OZ/QASOeF?=
 =?us-ascii?Q?FJnai7B2FCPtSMRqOEZE97B0CcGWU3+QvG19ngi7+3T3ScQFyHR980j/gL0N?=
 =?us-ascii?Q?53lFxrSc1Ceixz+ohttK87dSRIoM0w0J6tpw28lOw+zOxkJjDmyffDWs26yY?=
 =?us-ascii?Q?YmBbfMorlNMENMYXFTFQ5JEF4F0piw3aSsfAZ/KA7k/bFTAgtFqmV49avK9g?=
 =?us-ascii?Q?E3PhwgItozjrZ4uK5Og4gewQhPZPUHGHYSFdgkfmpTFrHUTGAr5GYzU9QQ1N?=
 =?us-ascii?Q?KYTver+xDPVj908w83IVrVfByUHHDiH8msIRwC2NsRi513Un5/INigW821Wv?=
 =?us-ascii?Q?yglZF48OU/4897Enc2U/HWK/uWvo/Wc2P7F//9euRa1GtckmCslRzczjX+49?=
 =?us-ascii?Q?n6wUGDAR5KgB72vXim5q4YXQM4tiJG79dHjW3Pxz26F+VFkzIA6DRPLImCR3?=
 =?us-ascii?Q?MVpF3fM0MVOF1GjlRV82L/ARZv/1V5sCPhlgfElOY9fj0wUneEZIQqxAzMdT?=
 =?us-ascii?Q?UcSXFs6PQzuy1kaetWcopjCoCngCkJHH6VmteLVAaFbP7HMgrNqmo/ah1Oua?=
 =?us-ascii?Q?QT98Y/+tSJwkzHIki6cQbvTPh0TCuuBYPOg6yWeqg+LYfRbZHVBj5m2/UDMU?=
 =?us-ascii?Q?EJwFHrd0PLUp7u+9EEb839lNXkI0VSrchLxN0uaEJ2EoerCt7fQr4nRuQZNG?=
 =?us-ascii?Q?qNP0R8t2txaxGJ3S43VW3B48G/oOPQiXz+hPhKY0X+O6WIMBbF2qD45bFT5i?=
 =?us-ascii?Q?xypcWg2uJ+RmAINvLzyprvQM6ht+j/kD5Ww41Zs3ZuM7rpPNIAYK?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 792ec890-5c72-46f6-b73e-08df071dcc78
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 05:07:47.7376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: InOaDEZEkaH6P4QJbJoxRuB/GfrKjGsV5v4QozwOfb+WeXD9mo2Qey0R7QBR1ep8z9S+FuuW4xCGE8JoxCK7DEWFjjc7ZmPwJrwYLFpgakFJu1Ia31M1o92u+Lb3EbnF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13019

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/da7210.c |  7 +++++++
 sound/soc/codecs/da7218.c | 12 ++++++++++++
 sound/soc/codecs/da7219.c | 12 ++++++++++++
 sound/soc/codecs/da732x.c | 17 +++++++++++++++++
 sound/soc/codecs/da9055.c |  8 ++++++++
 5 files changed, 56 insertions(+)

diff --git a/sound/soc/codecs/da7210.c b/sound/soc/codecs/da7210.c
index 4df1a25e318b6..597510de561a6 100644
--- a/sound/soc/codecs/da7210.c
+++ b/sound/soc/codecs/da7210.c
@@ -1030,6 +1030,11 @@ static int da7210_set_dai_pll(struct snd_soc_dai *codec_dai, int pll_id,
 	return -EINVAL;
 }
 
+static const u64 da7210_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 /* DAI operations */
 static const struct snd_soc_dai_ops da7210_dai_ops = {
 	.hw_params	= da7210_hw_params,
@@ -1037,6 +1042,8 @@ static const struct snd_soc_dai_ops da7210_dai_ops = {
 	.set_sysclk	= da7210_set_dai_sysclk,
 	.set_pll	= da7210_set_dai_pll,
 	.mute_stream	= da7210_mute,
+	.auto_selectable_formats        = &da7210_selectable_formats,
+	.num_auto_selectable_formats    = 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/da7218.c b/sound/soc/codecs/da7218.c
index 93bd045ed8701..361daf14152e2 100644
--- a/sound/soc/codecs/da7218.c
+++ b/sound/soc/codecs/da7218.c
@@ -2166,12 +2166,24 @@ static int da7218_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static const u64 da7218_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops da7218_dai_ops = {
 	.hw_params	= da7218_hw_params,
 	.set_sysclk	= da7218_set_dai_sysclk,
 	.set_pll	= da7218_set_dai_pll,
 	.set_fmt	= da7218_set_dai_fmt,
 	.set_tdm_slot	= da7218_set_dai_tdm_slot,
+	.auto_selectable_formats        = &da7218_selectable_formats,
+	.num_auto_selectable_formats    = 1,
 };
 
 #define DA7218_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
index f6d371e935495..673285c3213b2 100644
--- a/sound/soc/codecs/da7219.c
+++ b/sound/soc/codecs/da7219.c
@@ -1643,12 +1643,24 @@ static int da7219_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static const u64 da7219_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops da7219_dai_ops = {
 	.hw_params	= da7219_hw_params,
 	.set_sysclk	= da7219_set_dai_sysclk,
 	.set_pll	= da7219_set_dai_pll,
 	.set_fmt	= da7219_set_dai_fmt,
 	.set_tdm_slot	= da7219_set_dai_tdm_slot,
+	.auto_selectable_formats        = &da7219_selectable_formats,
+	.num_auto_selectable_formats    = 1,
 };
 
 #define DA7219_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
diff --git a/sound/soc/codecs/da732x.c b/sound/soc/codecs/da732x.c
index 12d1ac98461e4..c9b6172ac0a1d 100644
--- a/sound/soc/codecs/da732x.c
+++ b/sound/soc/codecs/da732x.c
@@ -1188,10 +1188,27 @@ static int da732x_set_dai_sysclk(struct snd_soc_dai *dai, int clk_id,
 #define	DA732X_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 da732x_selectable_formats[] = {
+	/* Hi Priority */
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF,
+	/* Low Priority */
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF,
+};
+
 static const struct snd_soc_dai_ops da732x_dai_ops = {
 	.hw_params	= da732x_hw_params,
 	.set_fmt	= da732x_set_dai_fmt,
 	.set_sysclk	= da732x_set_dai_sysclk,
+	.auto_selectable_formats	= da732x_selectable_formats,
+	.num_auto_selectable_formats	= ARRAY_SIZE(da732x_selectable_formats),
 };
 
 static struct snd_soc_dai_driver da732x_dai[] = {
diff --git a/sound/soc/codecs/da9055.c b/sound/soc/codecs/da9055.c
index a88c135331457..faff1535ab12a 100644
--- a/sound/soc/codecs/da9055.c
+++ b/sound/soc/codecs/da9055.c
@@ -1317,6 +1317,12 @@ static int da9055_set_dai_pll(struct snd_soc_dai *codec_dai, int pll_id,
 	return -EINVAL;
 }
 
+static const u64 da9055_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A;
+
 /* DAI operations */
 static const struct snd_soc_dai_ops da9055_dai_ops = {
 	.hw_params	= da9055_hw_params,
@@ -1324,6 +1330,8 @@ static const struct snd_soc_dai_ops da9055_dai_ops = {
 	.set_sysclk	= da9055_set_dai_sysclk,
 	.set_pll	= da9055_set_dai_pll,
 	.mute_stream	= da9055_mute,
+	.auto_selectable_formats	= &da9055_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
-- 
2.53.0

