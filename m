Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011065.outbound.protection.outlook.com [52.101.125.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D043EFD2D
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 01:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784595629; cv=fail; b=mojID//Da4usrGzv1+ws1l8G6DttbHDC6C5Xq3PE52DY4EfGbxcsFOwAKkyCIgq9rCaGQBQbYEGyQEO6JUyNd720h+J7vCM5OzLpJNgucPyO5qE84z5jk7wVjXzfAN10WDcYHCRaDgW1WiJpl7L/adnORDsGs+1VayjGvZiZ15k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784595629; c=relaxed/simple;
	bh=Ke73rEoZ231xrGFVQMuPp0OPtBvAHT5/yRPLbSMA5RM=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=P9G5kSCyeBqG7rVeVZbxLbVW/47zBXkmvRvCet6o/Cc5GPt3WXt8TsSkRggUv5U8i2sCC072k91sFPgZAZqF3znXG2YqKHySgpETJ5p5f6KPIscdh99rTHOZBgfme3hB2m8K9zLZSE5nWoTuhTsvRLPoCdaQuTJcWyjY94II4lI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=fKJfJFNL; arc=fail smtp.client-ip=52.101.125.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="fKJfJFNL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v0fC5ousKQJp8kmSpkgUJwWWO8HfvtTwEo4b1TCvGYUupXmcR/b7YOM1CIXXgZwJFl5/6GfQtUw96rk+LSkhZWJyGrCYEwrXnccJ3CnDvMCa5R7D8OafO8VoSqFqn4Y2J3Jz2H8EveGxFftfQIBbdkNToZvpSlZokFA5LWmFRO36gxchJaGo8BE9/cvriIScF6b67vMJMCs+46JQRbsolVwI4CQbxNxIcLxHeiuBwcPATX7rmZjX/6BxVYsEp40rh7+bx6MrGjnslxCqHBApk+Qrj5rCxG6GV+oxu4Gk1BxNUNtfBv8PeFMHaTUNNu4XO749XqjkEEVTgiTI/gPhTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N58aP0s8yDnWFviY0sOhZnd1vxiappgvSpr87UHRRsI=;
 b=qoY7zXrE8BQjjmmVWp3TU5I3QjhuogK+aOkcja+otxqf3OqsSAzcoqrN2gjnoef7R69TLEBLLgQ+KezLTmZKzh3CU7W9j2SYmyQoFGKDecwsxtKld6NYz2gpQKXGKhReNtYfSpSPABWPCpYayWzwrcZQr0nRnHTSHWL5244+4L1OuoT0L4Hb0g/JgcByvFNb7rupAnkrJfotA73vQZ+du+Wu/lAcFjceOyo4fYVSJm3s001oIBR3kItnZFLj6NQ2S5hYb8v7HV3LpM0Dc2cNNARNRN3gXK2AOn67FR/sYmD6/8wPLmqdLEj84JCN2T4wT8Vu7SJSi0FcI9K4IehJhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N58aP0s8yDnWFviY0sOhZnd1vxiappgvSpr87UHRRsI=;
 b=fKJfJFNLKEanP0PDiqw1neOwJkrVTMijL38GjO9Ew17OHS91snZEr735mJL8Btenhis52iLFHysmOm8lo2WPyQmuT5yFFrTA1exax+uRMpHiGQVop4qma0bazocyLLstJTAn6nH59+/xVhVqxxqtjYxpwxo/dginQwAR93pfbuo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSCPR01MB15382.jpnprd01.prod.outlook.com (2603:1096:604:3a6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 01:00:23 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 01:00:23 +0000
Message-ID: <87wlupjgwp.wl-kuninori.morimoto.gx@renesas.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 2/5] ASoC: atmel: use .auto_selectable_formats
In-Reply-To: <87zezljgxy.wl-kuninori.morimoto.gx@renesas.com>
References: <87zezljgxy.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 21 Jul 2026 01:00:23 +0000
X-ClientProxiedBy: TY4P301CA0064.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36a::16) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSCPR01MB15382:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cda29ca-b112-4405-41a7-08dee6c3719d
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|52116014|1800799024|366016|11063799006|56012099006|10067099003|6133799003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	Ly6UAOCar8jjqgh4yqUBxFQUbdRHku5PXHufOM7UMrjoBTGh3sPJwDHe8tp1av5gQW9cThWM3hjrpXMUDS5WDXqakXlMNDwJbehpxqsZQpkcei/gwsZYwV9Z2qnc/nn9K8DvoKghSYtd0OvgXJDvIFpIynlkVdkMMcqUZTtcJWRRW/mvK2e0MG2XytbZG2k/msJJ0ni3HI2dvYu4vj1NCXf5WKK8UtV5EnbndjqGuKMQIUoBZEnM52nki93Zkk8tzcO2hllRo5xB5AXuWDjzcYCfVtKmIY+nPTvSVKlBLAT9F9GbHulnWdtqfaV+ezC2kklP62eqox2LGPOuFqMFLAehN4JaMx92aGh8b5gzmwlpwj1k1LuMjOhueiqn5f8Fc8Q2IxYTMArcO0tXH0Dw5WvXkMYvIL+btxbp3n7FWwQs8Dt77LtFBFXP9y/FyJAuajM0LADFF0WkVo3s4xwZgRGPMyR4WAqMVAqojfoWlBK1ATxWBvGQzaffihxLnuNF8buJTkaDWgXduvbm8SZ3O0prWM13IbP6dq5d1uauaDa5K0LQTqitdRSxkUnjgf8TXAZGCZ9kwW7J4j0pLMvlnqqUXIboHKhbLoi2CG6lZxxSWJSuzcloMNbOf9lfY8rqE8iGLrPJ4Es/T4aTWnsGMaRv1qAeeIaMRolkKjP+OQMQEGi5eJL6Rpo+YoX4hrGkCqqHuh9SAJVgsyUyZS88p7fF5f4U0i+p6cs8Ov7fmeg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(1800799024)(366016)(11063799006)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Og+3DTM4xKerjtmN4M3AuQfy85rjjiAg8s40+wafhWZ7Ymg2vgVa7oQM31ae?=
 =?us-ascii?Q?chb5fH2MM89FgHE4BA4vGQ6bhXkiBAR6SwoDjWRYdoZ8LiyZZ0nBhuDWtDlC?=
 =?us-ascii?Q?/QukIGO4e+XVpf0w3MMOnCK+LL1Ge5oN4csmKx/cFNQd9xQwRN8RJ3srarsS?=
 =?us-ascii?Q?J9d3x8D9B3/5PgO9gxGlkkcUVEONKRqdVoQ4fQES1Vgdmd00snDmhIEzDzgc?=
 =?us-ascii?Q?MlDvKqTN6iyK1ikdMZIvruCrtwHV1bSLdswCqdQDjOa0b/XEtgYtjTPiGC5g?=
 =?us-ascii?Q?15kYcjWDKpWbg6EWulfYtqVFjA1ZQgmwiGUqo0jzpZKEhXlm2KRBkAfulfN0?=
 =?us-ascii?Q?zMAE260dkfgGstFuM2VZ9sceHFzbr66kLkyvB1Dll2EcuaMknG/Z65QtTYWh?=
 =?us-ascii?Q?j0wJ8cSu/BKQQ1doxNBmM8EEG0HTIsYwG5dS/84Tpm02p8F1EKUuTY9zM4Vx?=
 =?us-ascii?Q?KmxrztA3yuGxdugAcb7Ihxj6MgXtB4kk0W9q+OUuyBS58wQdjU4BAcbPzZ0Z?=
 =?us-ascii?Q?e0qUHPGDKPDeDnVfdgKvHcjWI3KPsNNPMbIR9NN2qThYWPBrUL50DLK6KoE+?=
 =?us-ascii?Q?wlZ8feFKLCB72+bKnIUULnZjzVWzr209IF9qxxle8ndIuYi6lmvh4YaLguNn?=
 =?us-ascii?Q?XrtBjWtC6SLOe2oCTcTRV+yzx+J1OC9lv9HMDpTwHLY8eTMfA1gVq0y48+NO?=
 =?us-ascii?Q?FCqFUq1swqtGhNg9WIggpBzyjhY58aWwduu+czCM5porkHoCTFyJhuUbUhjR?=
 =?us-ascii?Q?ENPXQI2TNxbDrxCydhyW3QwnOHD4yW6jGDNj3NunSFIwYJ0D4Z2jdD3ar2w9?=
 =?us-ascii?Q?npr2JUWZHKWx7bW+Or/ot84nBMYDo/RRO9eohLyLera26SCTuNumnemBnys8?=
 =?us-ascii?Q?y4d4yUb1virp0Kc39rb+U51WjUoiZki9H7cS/xX41bynoKrdBAar6ZG4g6SE?=
 =?us-ascii?Q?OB/NBorZXbCAEHYwJNInMVYlfYCJfvDjDDccW30EQwP0L7lW2n07xLfKRcSq?=
 =?us-ascii?Q?31geHwaBwYdKQdtAGWqOiSD4XyEiBZh+TdBRVLmL0nL35NJvgx6rTIcDn5k2?=
 =?us-ascii?Q?2aia25lRsIApK1aSVWNjS/BkcJV9w7VP7iLwBOYkRkVBqW9nPp7sV2DoKqRQ?=
 =?us-ascii?Q?865cptlw3RwXXIyqeAuC0OblI6wggIafjRzbi5sQshrb3/V9KKBIvgnRCFnR?=
 =?us-ascii?Q?LLDAZ3TKy2k0H1LeaWbBxZauGrpgiYHZaTb8MamG4B48BLpbMEDC8xH1GC0u?=
 =?us-ascii?Q?VKAmclK5lSXN8TjElifgSGaNR/nNzn8ew+NB+MlEM9PYtJjMUavU9IlAx6mq?=
 =?us-ascii?Q?Hel7MWhx+JfnJDWsv5l3cZNx4gr9gRPp4bouE2wA805cCXnD8tRHr1S+DpSE?=
 =?us-ascii?Q?TbNSJZHX+A6mGzX43HcaQU+trv1P1AjscWdcSVxTcahxoFCxh/4Z5+OZksVR?=
 =?us-ascii?Q?FIsZOjIZPAPesrAtO3naatCQub3pcTMRmbBY6ek+TjbJLZ/SRRt8yCovTHKQ?=
 =?us-ascii?Q?Bv16DhkbuGtM2SDnxRdX4Fe3uYoBFDMMq6H3NNBAWvUB/rDLd+eWOLA5kgwm?=
 =?us-ascii?Q?OY1YfVyBhH0XCuY+rmDMDsgL803eJmYTbyrdGF9KX/B0KlnO/HRuXGEA9S3H?=
 =?us-ascii?Q?kPilbFmLkYi8hZUYiKNAiqp3mG3rU3sO71m/ovb7BympE0z7HdeYKX6KcwUG?=
 =?us-ascii?Q?rAKc2h5maDwRMrwEMxkDWl5rdeflpMh8kXpmaicrpBSRUACrAxj/FAjvAJXv?=
 =?us-ascii?Q?osnB52Iwljq7PePlrA3C2clzOsQRNA8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cda29ca-b112-4405-41a7-08dee6c3719d
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 01:00:23.4100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M89GFHAfYrgsEOSNeWhW/TnhIjlqmpEGG/Sxk7nnNb+k3YY+Y7j4JQ0ECbdFLGnCawF+ZfO/oGnHX6J5KIN6FUPE+EDOgSfHFP5alk+wWodgcEOTeQOKB+VwSiAjkEDl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB15382

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/atmel/atmel-i2s.c     | 4 ++++
 sound/soc/atmel/atmel_ssc_dai.c | 7 +++++++
 sound/soc/atmel/mchp-i2s-mcc.c  | 9 +++++++++
 sound/soc/atmel/mchp-pdmc.c     | 4 ++++
 4 files changed, 24 insertions(+)

diff --git a/sound/soc/atmel/atmel-i2s.c b/sound/soc/atmel/atmel-i2s.c
index 762199faf872e..d9ad262ec44de 100644
--- a/sound/soc/atmel/atmel-i2s.c
+++ b/sound/soc/atmel/atmel-i2s.c
@@ -540,12 +540,16 @@ static int atmel_i2s_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const u64 atmel_i2s_selectable_formats = SND_SOC_POSSIBLE_DAIFMT_I2S;
+
 static const struct snd_soc_dai_ops atmel_i2s_dai_ops = {
 	.probe		= atmel_i2s_dai_probe,
 	.prepare	= atmel_i2s_prepare,
 	.trigger	= atmel_i2s_trigger,
 	.hw_params	= atmel_i2s_hw_params,
 	.set_fmt	= atmel_i2s_set_dai_fmt,
+	.auto_selectable_formats	= &atmel_i2s_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver atmel_i2s_dai = {
diff --git a/sound/soc/atmel/atmel_ssc_dai.c b/sound/soc/atmel/atmel_ssc_dai.c
index 89098f41679c0..f4f886bf678d2 100644
--- a/sound/soc/atmel/atmel_ssc_dai.c
+++ b/sound/soc/atmel/atmel_ssc_dai.c
@@ -825,6 +825,11 @@ static int atmel_ssc_resume(struct snd_soc_component *component)
 #define ATMEL_SSC_FORMATS (SNDRV_PCM_FMTBIT_S8     | SNDRV_PCM_FMTBIT_S16_LE |\
 			   SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 atmel_ssc_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A;
+
 static const struct snd_soc_dai_ops atmel_ssc_dai_ops = {
 	.startup	= atmel_ssc_startup,
 	.shutdown	= atmel_ssc_shutdown,
@@ -833,6 +838,8 @@ static const struct snd_soc_dai_ops atmel_ssc_dai_ops = {
 	.hw_params	= atmel_ssc_hw_params,
 	.set_fmt	= atmel_ssc_set_dai_fmt,
 	.set_clkdiv	= atmel_ssc_set_dai_clkdiv,
+	.auto_selectable_formats	= &atmel_ssc_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver atmel_ssc_dai = {
diff --git a/sound/soc/atmel/mchp-i2s-mcc.c b/sound/soc/atmel/mchp-i2s-mcc.c
index 17d138bb90648..a832dee73ac78 100644
--- a/sound/soc/atmel/mchp-i2s-mcc.c
+++ b/sound/soc/atmel/mchp-i2s-mcc.c
@@ -912,6 +912,13 @@ static int mchp_i2s_mcc_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const u64 mchp_i2s_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_GATED	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF;
+
 static const struct snd_soc_dai_ops mchp_i2s_mcc_dai_ops = {
 	.probe		= mchp_i2s_mcc_dai_probe,
 	.set_sysclk	= mchp_i2s_mcc_set_sysclk,
@@ -922,6 +929,8 @@ static const struct snd_soc_dai_ops mchp_i2s_mcc_dai_ops = {
 	.hw_free	= mchp_i2s_mcc_hw_free,
 	.set_fmt	= mchp_i2s_mcc_set_dai_fmt,
 	.set_tdm_slot	= mchp_i2s_mcc_set_dai_tdm_slot,
+	.auto_selectable_formats	= &mchp_i2s_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 #define MCHP_I2SMCC_RATES              SNDRV_PCM_RATE_8000_192000
diff --git a/sound/soc/atmel/mchp-pdmc.c b/sound/soc/atmel/mchp-pdmc.c
index ec7233ce1f78b..a6a9b5e6cd95e 100644
--- a/sound/soc/atmel/mchp-pdmc.c
+++ b/sound/soc/atmel/mchp-pdmc.c
@@ -741,6 +741,8 @@ static int mchp_pdmc_pcm_new(struct snd_soc_pcm_runtime *rtd,
 	return ret;
 }
 
+static const u64 mchp_selectable_formats = SND_SOC_POSSIBLE_DAIFMT_PDM;
+
 static const struct snd_soc_dai_ops mchp_pdmc_dai_ops = {
 	.probe		= mchp_pdmc_dai_probe,
 	.set_fmt	= mchp_pdmc_set_fmt,
@@ -748,6 +750,8 @@ static const struct snd_soc_dai_ops mchp_pdmc_dai_ops = {
 	.hw_params	= mchp_pdmc_hw_params,
 	.trigger	= mchp_pdmc_trigger,
 	.pcm_new	= &mchp_pdmc_pcm_new,
+	.auto_selectable_formats	= &mchp_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver mchp_pdmc_dai = {
-- 
2.53.0

