Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011066.outbound.protection.outlook.com [40.107.74.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948D01CD2C
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 00:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786064058; cv=fail; b=LtPYPNhkUafwi2AH2CCz1s5jQ27Ibd9lCwKd5QUfFxnC3jzOdZztEtnlZkkEbYlKWbQXm4hLo5inV6/Crv7TcCDhAwCYbgwZ3PZartg/TPoUg3CRs75ojSojCTr+fRNMMHf6EGC1uAq/kK03jy2wp3j345Z2/3Fx7DigWJt9UAQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786064058; c=relaxed/simple;
	bh=e3SY1Zf3o2FpE/MlSpcYhb2WpRBOdGsaXdbISWB5vG8=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=CT/caF4XthlYD46U/sm56php8WlF4thz5xbHE7PFiM/oDlYppe4GRjcoYxsl3YDt+zbNI4s6wOpaajJBXppBcKCk5fPTzZMNlJxiJx7tBqsn7XWHMyH6rNnYdM6cXtn02lg+6AGGNSjVjub4JypY6mDQQnJrofYOpYuh8aUS3S0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=YtwASQqo; arc=fail smtp.client-ip=40.107.74.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="YtwASQqo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lA94dlvtsPj8ZklendFvHXYnMCDLV8ckxfD1Sf6q7jTYNoxxZPlHvpSxXTyEp406lJmCSuWhul0ppy1purSyXXBZtyCBed+EiKcZEomBxZrQ2tK3lAPSubb22uI8NQUmbYWQxWehCkGrrcGrSYVvgiv0+IDX0VR7lak/GZY+qhbhZ7nbo+HzWdL86dRmJG9qkrRxOs1ddb72CrSdupwbXIVPHD5LLHvshIikmAUByQZVjRz6HrClW9tSK6jbl5SpaRyLCJZavuI4D17wEoVu3t/sr1Oim2UCo2huX8fI/hiqJI7+MTom+cH4+z2sVHe+uXPairb46KdYfdST4E3ZVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QeF5gPbWnETFVW+DL6Bw8lrE33fITTrPNHoxjPrWGAU=;
 b=H8DHzIduib8PovZSAuCk1D5MsqnoBYO/hGZ99WRztuLOdDK2k7V/zsQ2ku1KdAAa2ugef0odWCekitGUVFqR+76IeEVezJ3cANKJ/Z9cqbMQo1CRhuBNL6eivLr2riigQ3IXfm3CRf2zgKZI3/FejdlReoqaPCNtrlcF6osVfANE2TrBMxzKWK25jKqql+dFVUCxRrE1u17/I0eeH3rKmT/b/a/VV5Pf8Wa1IgoPF6UgkCdoP9nWX55ADolafJK6UQlUoUoZQiX9AlIdLB/oaCYrPVCY+SFvG4pDbZyZ/jX0atcOjs5A08XkhMtkKzXY50bkwbErJ1eLiZ6Nj7v1Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QeF5gPbWnETFVW+DL6Bw8lrE33fITTrPNHoxjPrWGAU=;
 b=YtwASQqoCx+WirtQrcClsxrTuSuEGlIVBNsNyaAINAQRGrNCNKRMhs5GzheqXFOUMuwhGmqjL0QteYouHlS5X5CWa0vQ/17RikglDYCHSPYo3DWXkdxthub674v7qwpAP1Rx8wesW0VzZjt7uo73Xn9XW/pjNUmctKVJxwR5Ovc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYTPR01MB11044.jpnprd01.prod.outlook.com (2603:1096:400:3a1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 00:54:14 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 00:54:14 +0000
Message-ID: <87pkzuu4wa.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: David Rhodes <david.rhodes@cirrus.com>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Richard Fitzgerald <rf@opensource.cirrus.com>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH v2 12/44] ASoC: codecs: cs35l*: use .auto_selectable_formats
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
In-Reply-To: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
References: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 7 Aug 2026 00:54:13 +0000
X-ClientProxiedBy: TYCP286CA0056.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::17) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYTPR01MB11044:EE_
X-MS-Office365-Filtering-Correlation-Id: 59a87b73-0f05-4283-5cb4-08def41e668b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|23010399003|376014|1800799024|366016|38350700014|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Q81KYJeByPjVlL1w6AFFux7ZeMGUoF8fkX5vF19f3/WtViuCVeUaK80ramPdAgR7peXvRTw6ovhr/UsF7fOHP21VLdMpt31whOkk9aSqrAiZo8UqzgauTss5HB2MkL+7AAIOhNlHsCAYIn4PEzCLrA5peNVaFYSeeAmQKiXUiZ1zsMySMwbFAmdGZpsgJTsfJ+kHMYPPt5TshAHkGbuT5dlGRz6OwTL9Pq8qohX+o74+1Ch2CxQ6OMecpXy+Q/sHc0t96vUHqz9PTvqz2+6z4O7PTaUpTYK6l4pWBb39jnwlsnY0F27+grhgWPC/qWJapKMxs0lYeX2j4lNyQtKz7Gh8PtOn7lmmcqbBhMSyk5qcYqC/eIslkdP9HSbevCtGZsrBtv/oQcMHR08HtvH4UJNSsTEQc/wfKaxqpSbkmBL98vomyT/a57jtKVor/j1O0rt94TvNelTfV0QieLr8X82dnlRZ1VsxMPxNnc5YTpKZ3ueLG8/apfpxW0Am/uE6Txs9QEa2ycXrzrMS1zFrFyVfaxj/LRFdn2fl+VuKm3ICc4tJXoMgyRf67bM79al1i0G6upsCNDa1CeijKEK2RFMlafcMebT/orCK+OqWploeTQj5keC3XsSeJ61R5354sTdH7++5qa765Yl7Dke1Ao6hBOMyQ1to3EBuazbzzd+I1es/Udsp4uVnljZtZQnhl4jYf6/kfG1JJRRfHzQrsMdVOZR/ZkFHYotixXpAujM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(23010399003)(376014)(1800799024)(366016)(38350700014)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sdQ4iTK6qn5RRDl2Z6+BqZbpO5uRhp/oL6A8kcR6bz7fIQMvQH0TReOO8fog?=
 =?us-ascii?Q?YJUCRjiZEyEy0d60jespjck1gR6GTZSsDbbUFliUtClFXm7uvNuEx5exEETN?=
 =?us-ascii?Q?cTx+ddhJuLEyTD7SpBl7VBn8auizxiKY6e5gPUVjPoMNH7RqWn8YkDZra73Z?=
 =?us-ascii?Q?oTCfyFYhBG07GBptf2/6Kd8aLIEbclKfzoJOV2b5yKKck62B+1x+ZSsFGauK?=
 =?us-ascii?Q?Au/IVgZzCp2vn0EcF+hj63ydlntLSpOklhYFOYkvXc6h6Swt2VYPzNW2l13k?=
 =?us-ascii?Q?VhLaNaRkTA9YOnCHVX0OriG5wXMepOEDoXtox5nTMGpV2Av8aHo8wEOyia+X?=
 =?us-ascii?Q?owfoVxWVdLeqtu9qcKcgglzlLUafuMw3csduMi4yYeSjpRJ+NB3idRrEB3Ie?=
 =?us-ascii?Q?/Y9zwvAhecGguE7Bo5pLMMC3/SAys9MhtTIhBj6gOgY5+rRv9r+ZWTOC2/6S?=
 =?us-ascii?Q?viIBatTJ+EUMIIxVrFLiGrqCu2wKLu+i26jsfAfKKYcyyNHTZC9Q4YmbmU5m?=
 =?us-ascii?Q?beVJlqdlLZ3btU/cBdT6rbQ5oUN8RnJ7Dcm+xOxLIpKtof9mdXB7CMmq1mXR?=
 =?us-ascii?Q?zWdOl6fLmnxFzqjVsByhlRlBvEJZA46eSv6v9MZnTochfhxXO2q9+Bpu7g3t?=
 =?us-ascii?Q?1k83aTZ+VgX9xCt5ADocX9ZjadAhPwaz2fbKzQ9GNBwdilauOrW/GQvHumb2?=
 =?us-ascii?Q?OKwf92h9IHU/dOYHbCZvNUfoqFR3whJfrhWEUqMx/PxTGDv0j+sE+7X3UNKP?=
 =?us-ascii?Q?JUIhafueZKjqcRw7ReD5afOwFItO5RXARh+f11gl34hyUqtZPW4BMrloe9GZ?=
 =?us-ascii?Q?F/lhssrVLL1n6NCBoVU54usRQPSzWgPzIxPbDqetTjg4hEo9a6vJqnLKUp/+?=
 =?us-ascii?Q?HyuSxaAgs5tAd0Ej8XGg63hp1XFvGiN8GKPODcJvcD+xFI6Q6bz/nOnhKJyb?=
 =?us-ascii?Q?EOutmISaWVOPUxmvpZX4qPuHsfwnEB4ExGec8yKtRmanKaaIVQYvK+OGNdYb?=
 =?us-ascii?Q?/hw3gzhuScZdQr2EmYg0toeu06gS0toLLk0Uo/d3QrIEk7P3KVB0KHTnp6ll?=
 =?us-ascii?Q?DHtI1xw4gEpAwG5oYcvpM2jyTqqQ7dVU2zLob+E63tNFn+aoGmc/NK6Ayg5h?=
 =?us-ascii?Q?e2rJgSAcBDlXizoOS5AIfOKQPxe3nNzYbBwm2EyBgkR8jCWCeXQTEzG5cpmK?=
 =?us-ascii?Q?Wi8yEPbhCjLMzuC/nCHeHkMDPiHAeuFXW1rynn+iA8l1Fq43er3Qq969O8SD?=
 =?us-ascii?Q?V4sCj5EJmwPgay11WSlqEHGBPtngF/LI/WOxCMSaUTBXHmdw8+8nLIjqN3Fx?=
 =?us-ascii?Q?htWEM9nS46R7FyVBiPqyeZbqE1AEHOFnbUBr29oTNsbWcUXSBre85sF0CWKG?=
 =?us-ascii?Q?TNTCOELSk8XKIc6PD1ccska7srpfXAYrt8t0+Lz4Olbu9MhMO2AcIGlK1Am5?=
 =?us-ascii?Q?04peT5qR20j+QuovS2R8U0Qrjoa2sVLJRKq+WyLTMlKzs0UXn5qixvSbOsQ5?=
 =?us-ascii?Q?W4ikINypyWkDKh0yjdjMcptSGv50ErYWeczy5PBnZp7B1g3oWOtjBNSQJc5+?=
 =?us-ascii?Q?oXu+5CyroZZcHyZ+NBlPAzYtB4MwXv+j4k7SiHn2w7Z4LxG7vI/4JZk52whC?=
 =?us-ascii?Q?1KJoJo98HR2V8AKp/0YvLC0ocMk8Lp13ohOcCgyb1onrez9CiGGu0Q2HSX0I?=
 =?us-ascii?Q?q+GM9SqaNjsFUEGIHOjKXuGaDSQMgQDKMmssKs06GIGVInuUi4eFUS8cyMQy?=
 =?us-ascii?Q?AeDQWfgYAF6fC2lg6MRo/g0hiOv/SEN78VVldzinlYW9tdfp72az?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59a87b73-0f05-4283-5cb4-08def41e668b
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 00:54:14.1553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zXJXIEI7EYDZg4QjxaermH2CaX8RSZBmqW+CA1X8MtuCpF7DQzjQvJodGvG2O/3Vdyr5b0ITC/GKoMbwBDkkjz/wsMgRATXbscD0jDbRyAfncrQldLx5BBWnmOR9iBHz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYTPR01MB11044

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/cs35l33.c |  6 ++++++
 sound/soc/codecs/cs35l35.c |  7 +++++++
 sound/soc/codecs/cs35l36.c | 12 ++++++++++++
 sound/soc/codecs/cs35l41.c | 10 ++++++++++
 sound/soc/codecs/cs35l45.c | 10 ++++++++++
 sound/soc/codecs/cs35l56.c | 10 ++++++++++
 6 files changed, 55 insertions(+)

diff --git a/sound/soc/codecs/cs35l33.c b/sound/soc/codecs/cs35l33.c
index e217da124549a..d0f9231f5e442 100644
--- a/sound/soc/codecs/cs35l33.c
+++ b/sound/soc/codecs/cs35l33.c
@@ -663,12 +663,18 @@ static int cs35l33_component_set_sysclk(struct snd_soc_component *component,
 	return 0;
 }
 
+static const u64 cs35l33_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A;
+
 static const struct snd_soc_dai_ops cs35l33_ops = {
 	.startup = cs35l33_pcm_startup,
 	.set_tristate = cs35l33_set_tristate,
 	.set_fmt = cs35l33_set_dai_fmt,
 	.hw_params = cs35l33_pcm_hw_params,
 	.set_tdm_slot = cs35l33_set_tdm_slot,
+	.auto_selectable_formats = &cs35l33_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver cs35l33_dai = {
diff --git a/sound/soc/codecs/cs35l35.c b/sound/soc/codecs/cs35l35.c
index b2439ec3c19fb..302d838f4c440 100644
--- a/sound/soc/codecs/cs35l35.c
+++ b/sound/soc/codecs/cs35l35.c
@@ -657,17 +657,24 @@ static int cs35l35_dai_set_sysclk(struct snd_soc_dai *dai,
 	return 0;
 }
 
+static const u64 cs35l35_selectable_formats_i2s = SND_SOC_POSSIBLE_DAIFMT_I2S;
+static const u64 cs35l35_selectable_formats_pdm = SND_SOC_POSSIBLE_DAIFMT_PDM;
+
 static const struct snd_soc_dai_ops cs35l35_ops = {
 	.startup = cs35l35_pcm_startup,
 	.set_fmt = cs35l35_set_dai_fmt,
 	.hw_params = cs35l35_hw_params,
 	.set_sysclk = cs35l35_dai_set_sysclk,
+	.auto_selectable_formats = &cs35l35_selectable_formats_i2s,
+	.num_auto_selectable_formats = 1,
 };
 
 static const struct snd_soc_dai_ops cs35l35_pdm_ops = {
 	.startup = cs35l35_pdm_startup,
 	.set_fmt = cs35l35_set_dai_fmt,
 	.hw_params = cs35l35_hw_params,
+	.auto_selectable_formats	= &cs35l35_selectable_formats_pdm,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver cs35l35_dai[] = {
diff --git a/sound/soc/codecs/cs35l36.c b/sound/soc/codecs/cs35l36.c
index 89645327945f1..170588be4dbe3 100644
--- a/sound/soc/codecs/cs35l36.c
+++ b/sound/soc/codecs/cs35l36.c
@@ -947,10 +947,22 @@ static const struct cs35l36_pll_config *cs35l36_get_clk_config(
 	return NULL;
 }
 
+static const u64 cs35l36_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_GATED	|
+	SND_SOC_POSSIBLE_DAIFMT_CONT	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops cs35l36_ops = {
 	.set_fmt = cs35l36_set_dai_fmt,
 	.hw_params = cs35l36_pcm_hw_params,
 	.set_sysclk = cs35l36_dai_set_sysclk,
+	.auto_selectable_formats = &cs35l36_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 #define CS35L36_RATES (		    \
diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index b2a076706c796..d286025183f46 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -953,11 +953,21 @@ static void cs35l41_component_remove(struct snd_soc_component *component)
 	wm_adsp2_component_remove(&cs35l41->dsp, component);
 }
 
+static const u64 cs35l41_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops cs35l41_ops = {
 	.set_fmt = cs35l41_set_dai_fmt,
 	.hw_params = cs35l41_pcm_hw_params,
 	.set_sysclk = cs35l41_dai_set_sysclk,
 	.set_channel_map = cs35l41_set_channel_map,
+	.auto_selectable_formats = &cs35l41_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 #define CS35L41_RATES (		    \
diff --git a/sound/soc/codecs/cs35l45.c b/sound/soc/codecs/cs35l45.c
index a032bb23b4ac7..25a9eb916fa39 100644
--- a/sound/soc/codecs/cs35l45.c
+++ b/sound/soc/codecs/cs35l45.c
@@ -846,12 +846,22 @@ static int cs35l45_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 	return 0;
 }
 
+static const u64 cs35l45_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops cs35l45_asp_dai_ops = {
 	.set_fmt = cs35l45_asp_set_fmt,
 	.hw_params = cs35l45_asp_hw_params,
 	.set_tdm_slot = cs35l45_asp_set_tdm_slot,
 	.set_sysclk = cs35l45_asp_set_sysclk,
 	.mute_stream = cs35l45_mute_stream,
+	.auto_selectable_formats	= &cs35l45_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver cs35l45_dai[] = {
diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 0b7b080939a18..ec3b6621dc614 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -603,12 +603,22 @@ static int cs35l56_asp_dai_set_sysclk(struct snd_soc_dai *dai,
 	return 0;
 }
 
+static const u64 cs35l56_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops cs35l56_ops = {
 	.probe = cs35l56_asp_dai_probe,
 	.set_fmt = cs35l56_asp_dai_set_fmt,
 	.set_tdm_slot = cs35l56_asp_dai_set_tdm_slot,
 	.hw_params = cs35l56_asp_dai_hw_params,
 	.set_sysclk = cs35l56_asp_dai_set_sysclk,
+	.auto_selectable_formats = &cs35l56_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static void cs35l56_sdw_dai_shutdown(struct snd_pcm_substream *substream,
-- 
2.53.0

