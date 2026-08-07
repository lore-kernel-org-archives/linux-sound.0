Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011017.outbound.protection.outlook.com [52.101.125.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668A61CD2C
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 00:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786064010; cv=fail; b=ohbyoj5OWi+Gg/yGaQrQylbPWpeVKTQA+zwGh8EF8krtJk/TkENS/4VMIUDQLgvQqVtqj0nNQLIRNAGeuGGiJUh2Uh0gAc+piJAvrkg7kUstYDZ5jjOg5XYUOWjZFjRJu+jrKsXKF+6ykg6+930M0wRA69RTU4Y6ECmRFd+1cTQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786064010; c=relaxed/simple;
	bh=qCpyvF0LxQHFsUF2YADJUkHyPppXH5QGXtAaq3TYtSs=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=uKJY8g54dqyZVnvnzoxjshzzdM7NZw3vICwqsZxHHSWjDC/dz3nhvLAzdWUhPREOpvbdgV9UN5NZOx11mHwdI6k2qjkWKxadr5oJ7SSySjumGB2Jyv//TdWOcWpZlQtE4CBcmFgmuswGuwdugYCF8KSSQO73NNvFz7sVfOjqyvM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=dFHATrVP; arc=fail smtp.client-ip=52.101.125.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="dFHATrVP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oVgVps6ZVhUuplexVb2oRnaC6Ab/TNk4Tp9Zs+jhWhc8s9CgHiNq18vFECB6fO2W01+n8CCNns7mi/RTuHsJaD9jvGRdqqI8VUeYHpJxd3oiGIdwiRiajFVuSEE4qLLgYIpW6OMDjgMEN2/SkolN8U+eHV0TJxrFidqD8WrbZFpXCkszpzBvs5qCV8fA9g2b/LCZoqVW3QyBbWugNuoIqm/Nyym1rxeK0YGFn/C4H+08B7HC5hPTVjyIla16m3PgEOvgXtWoVVHMvp/tWyVDhIgawWO5IhTv3L0HJsrpi9olNHmYz2LJnfQN//msHQ11pSrCQwS4JBTccx950GE8sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ieWVW20yry4PMwO1l1NVpYHurQcSNRxEz65TWaZCscg=;
 b=qqX8mLgGyrKAHH0HzM5lVIvXanTUoSohH1mbPqUR7Ke+85ywxZ8UZMN2q+ckJ6CWGQdempD9xNwJvKRJtP2XO43RkDBbKkBR42ow6G7UnW6Xf7w5kBklt+vLBBOfWl7dAXMnXI1sYy0V9P8LhamESOYXjSt+CdMOvQGtLi0OOSKv5cyiswSBe0APgemYy1Q59NoI6JZvbvG1eR7+RgoVj0KUjBGcgMa3J9WTu8cU6SZ/9v1OS2PR+y8ZKLfKPtCte1FUFLFBrTmf35mARWYoizleERRfoV/apW2WVhMM+/h4yZhyAmkdjWms8HDxZ8iM3ytMUUE5gycPAYlgO+XsZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ieWVW20yry4PMwO1l1NVpYHurQcSNRxEz65TWaZCscg=;
 b=dFHATrVPy7usKy3322O5I10C0uDqCzAD3CxHQqX78NPRP890PfIrIXUHo7eZjwvetF7y/xkMMXmSttLDgDneZZ5eD6/4PTAZjYHCSQ9aXWn0K+cDkEcTFOgK5hyui9zWm/XpKD1gMBpEBEeomf+nzRGpr3h4TW6YuSrFlM7zCd0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYTPR01MB11044.jpnprd01.prod.outlook.com (2603:1096:400:3a1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 00:53:27 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 00:53:27 +0000
Message-ID: <87y0eiu4xl.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Takashi Iwai <tiwai@suse.com>, =?ISO-8859-1?Q?=22Uwe_Kleine-K=C3=B6nig_?=
 =?ISO-8859-1?Q?=28The_Capable_Hub=29=22?= <u.kleine-koenig@baylibre.com>
Cc: linux-sound@vger.kernel.org, =?ISO-8859-1?Q?=22Uwe_Kleine-K=C3=B6nig_?=
 =?ISO-8859-1?Q?=28The_Capable_Hub=29=22?= <u.kleine-koenig@baylibre.com>
Subject: [PATCH v2 06/44] ASoC: codecs: ak4*: use .auto_selectable_formats
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
In-Reply-To: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
References: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 7 Aug 2026 00:53:26 +0000
X-ClientProxiedBy: TYCP301CA0086.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::12) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYTPR01MB11044:EE_
X-MS-Office365-Filtering-Correlation-Id: 21ebe41d-47b4-4a1a-c58d-08def41e4a70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|23010399003|376014|1800799024|366016|38350700014|10067099003|11063799006|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	tOVCd56lYC4y4XEpdBTtxXOHOrnxvYDGbI3cQOxv3gpwT1uECjRu0AjA9MEeC0t7zzFhyRDrhGDdUq288X+Grg04A1op5MLsmAmNRKfDq58Gzb91isR79so5lh9tJJpRtQ87ZTIp0rYJnKHkKG24sXq9tZ0yniaJ5ej+xizRRCVCBAQzt+FS8mHOijgcBXgaLalHIILv/S7oVJaQAffIvt+JaW/4CbQ7TjS/v05WW65CK/NkbWRrUIivHlJmTBZxEBpY68HC+r/6BtqMHlqWRcC9QV6qws1nWkEkwP/YV1nhy2actfVEqUv4774CGLCDwOtyBdGJHwHyQFy7AkY4+MKstcrSeZXYWABBDpsLcmYbm1hIR8XdX+h/A8KVUoHCDnCjd0gdA9A2nFDyDMloQQLjCAUhDp8Gn6JIEC46xnm+LL+9xVIdJj2j22++OFOS/isfdZ2aCafLYvLeSNtqz0DtMa2OPpgggFZeHPNH4fgJJ6qAoMvs2Ioe4gpB0OCRqN3+ZT87/qmHGmhQIabwLQAcz4V56mNnBCoXFH7nIliU8arLLuTZMF2EbHv7Fvgpk80a/HztJ+sRhawJYGNMcvMbjrKakmjJWBVI3RzcOB5O9eYdD4HFLPBSiJPOnBfNZatSKzVyK7OPLsCValvhloEGNO9CG5S3m3SEhc9h3i5mzaCNHdNxqONkujLbMLDQZyyMgsQtXsu5gvms7D9IYOJz3H+y1t2oVuH8vce+Hrk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(23010399003)(376014)(1800799024)(366016)(38350700014)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kd7N5KmBThij3K2IJ+Ifb2F9wFdvbEJFGzbUbc/WdfG0NkirhnlCGtzVds2y?=
 =?us-ascii?Q?xpCUIjNooCn5axnsByN4PyrfhtlXMsZn2ZesrKtB/dFAZmTBrXFPAPn1ART6?=
 =?us-ascii?Q?BIP5c337onReEZ4qh6z83c62sWHPDxRcISPCAttA4pW4IJrJjcEYrEqSF0cn?=
 =?us-ascii?Q?opqH+T2+SiNQxSMtJi9et1VBKIBazK4lEwFL9deiFW6sdoc94/ZeCjawvb2K?=
 =?us-ascii?Q?Y0Gtq4Y4JiU9ARlPzt6AwhwAwniFMpB4l456WE4YUWoGWOrwjfrG42OHK1SU?=
 =?us-ascii?Q?nYLQyycZt8joaijplgw6beaShh3kPrJ9uKL1l+Wo6a2FcA9BkY8RMAFkI1xy?=
 =?us-ascii?Q?rOGOmwKWRK/AVfMOTJFrL4ZsWNvbPjHWEIjkNJzSJUoUKZxn/OlE0PZoRt0i?=
 =?us-ascii?Q?dicEbsYD4HMeiqELhx2L0mP20xYRQ8AQuzDCzVj2uYzZ7IPDhvk21G3YKjgg?=
 =?us-ascii?Q?b08AS++Ykme0wVQRLutpCDSDqFxsU9MGHwa/IK8y7eLStEA0BeGvkKGDQuGD?=
 =?us-ascii?Q?py6yEX1kKnsyVFkHZqwQwnXZY0CUhC5C5HyZ3zusyHAUzOWuiuvQ49xSw8rO?=
 =?us-ascii?Q?f9bHUwucsOWzMFlcgMpxdorsnw3kb1YPDf713Fdd++VC95u4LgyIDByFroCW?=
 =?us-ascii?Q?r2TrHPBnnXa0UVrpTVEUHZHVSqSwgXaXDEwB5JzUN4+Ywl2sQp6TtWxEe1w+?=
 =?us-ascii?Q?HkWjugkIMC9M4L3y3Yt4fHGtdAaiOSPpfljU8kpbk0dhE10/446WMw2GGv48?=
 =?us-ascii?Q?BTHHTKpbNgoLSpBaaYeWWuxOPaNWimuQEbO/DB3PtdC78mOgGzhPWK/vgFwX?=
 =?us-ascii?Q?tH6APlKP6HcY74bTaqJOybh80ytt+8Lsir4+Z3r6qnV5owKNDNGvfjHDbzdf?=
 =?us-ascii?Q?WROlYoguirEuA4xC0wJ8UaRxQ5e3LOsVkaI57qeMjQYJ7S/lMGKkvqoM2yBQ?=
 =?us-ascii?Q?OfGM37/i43hAr4euGoq6wJK9p944xWAH3yDXuRtzZKMG8uzm3leLfYwbEMTY?=
 =?us-ascii?Q?HzaETGx4lLyvAwr2W/z5HfsIBNiJmNQSrwwGBPQZuZDrVVLrpFv217QKR0BL?=
 =?us-ascii?Q?bJCS4sE2L2A2+AMQOwCKUYAv8T1g7zdzvTcR95ZNhplI9WjtgU/AkWf4z101?=
 =?us-ascii?Q?qEMKET4hDg7E9bfeS1em81n8GwAGHpuFkGH71fpphTdJ6t08TxOvX030i9VU?=
 =?us-ascii?Q?+LqNC+YAm/8rPeXLCxePJszr6K+xwOIUS3+D9nl49ZKg1LXp47vwYNC7CTN2?=
 =?us-ascii?Q?rn/v7YHsWucQD75yqk6PECW8pLRcEtaTmSLLnWk/J5Xg9Wza4GHRvz6W0VNz?=
 =?us-ascii?Q?LUQ8LOeyFW1R3v4mA6GUICySVNs0K3Qv7LzqTg1BcXoVb96G758PqltySZ5d?=
 =?us-ascii?Q?rnzVAO6cu+nXFIHeZyTTRrKRgsqhjxiwyvP9STuHqfp4yukGS2YwxRHtBTZx?=
 =?us-ascii?Q?yn+em/z2/3Rdj30cCMvX/fqIA5hpKSAXrcClqgmpnl3zkfuwojyTv7ILfMHc?=
 =?us-ascii?Q?H9xSVIzVwAn9WXNiHKbG5ocwMKXwDfRaW7IXo5j+7P1++o0Ln+5GR3azrKFz?=
 =?us-ascii?Q?UKr3TIgm2qArtEWLkOkQMejxIemEvvhvMcrSVBcjsLRXtFUM3wwNBo4W3drg?=
 =?us-ascii?Q?HCO17B35z8EsDq2sPHkT0f9aY31mfTYuBydF35UMLMcE/F4wE2Uw0n1dcL2L?=
 =?us-ascii?Q?yNiywqt7VTs5TfVIouBd5nR/Pz0XZPlEJ/GhTX4FoPDbbAIZjhqxHBIEeQZ4?=
 =?us-ascii?Q?3xG4eeCFkZHwM/BmBtLbpvbtRj6xyPg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21ebe41d-47b4-4a1a-c58d-08def41e4a70
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 00:53:26.9960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vMh0EDpcyus02g5w7PuN2jVI/Y+v2gxI7dr65+FLAW/y2BYDcf8bnoDStEq54KDw/WKN1clB8LhQfdgyXId4SDq4pVHG4VJEhUPrUkR3KDXK8SzPxvcObyjR53CrDUZx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYTPR01MB11044

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/ak4104.c | 7 +++++++
 sound/soc/codecs/ak4118.c | 7 +++++++
 sound/soc/codecs/ak4458.c | 9 +++++++++
 sound/soc/codecs/ak4535.c | 6 ++++++
 sound/soc/codecs/ak4642.c | 6 ++++++
 sound/soc/codecs/ak4671.c | 7 +++++++
 6 files changed, 42 insertions(+)

diff --git a/sound/soc/codecs/ak4104.c b/sound/soc/codecs/ak4104.c
index 6ea7cb78cd445..5ebc3afccccf6 100644
--- a/sound/soc/codecs/ak4104.c
+++ b/sound/soc/codecs/ak4104.c
@@ -147,9 +147,16 @@ static int ak4104_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static const u64 ak4101_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops ak4101_dai_ops = {
 	.hw_params = ak4104_hw_params,
 	.set_fmt = ak4104_set_dai_fmt,
+	.auto_selectable_formats = &ak4101_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver ak4104_dai = {
diff --git a/sound/soc/codecs/ak4118.c b/sound/soc/codecs/ak4118.c
index 03dadba0b038f..2b96b82d4e40a 100644
--- a/sound/soc/codecs/ak4118.c
+++ b/sound/soc/codecs/ak4118.c
@@ -236,9 +236,16 @@ static int ak4118_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+/* NOTE: Common formats only are auto detected */
+static const u64 ak4118_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops ak4118_dai_ops = {
 	.hw_params = ak4118_hw_params,
 	.set_fmt   = ak4118_set_dai_fmt,
+	.auto_selectable_formats	= &ak4118_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver ak4118_dai = {
diff --git a/sound/soc/codecs/ak4458.c b/sound/soc/codecs/ak4458.c
index f81cd8cebdd89..a74be99e877dd 100644
--- a/sound/soc/codecs/ak4458.c
+++ b/sound/soc/codecs/ak4458.c
@@ -591,12 +591,21 @@ static int ak4458_startup(struct snd_pcm_substream *substream,
 					  &ak4458_rate_constraints);
 }
 
+static const u64 ak4458_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_PDM;
+
 static const struct snd_soc_dai_ops ak4458_dai_ops = {
 	.startup        = ak4458_startup,
 	.hw_params	= ak4458_hw_params,
 	.set_fmt	= ak4458_set_dai_fmt,
 	.mute_stream	= ak4458_set_dai_mute,
 	.set_tdm_slot	= ak4458_set_tdm_slot,
+	.auto_selectable_formats	= &ak4458_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/ak4535.c b/sound/soc/codecs/ak4535.c
index 37555674cd157..6cabad4c9f74c 100644
--- a/sound/soc/codecs/ak4535.c
+++ b/sound/soc/codecs/ak4535.c
@@ -346,11 +346,17 @@ static int ak4535_set_bias_level(struct snd_soc_component *component,
 		SNDRV_PCM_RATE_16000 | SNDRV_PCM_RATE_22050 |\
 		SNDRV_PCM_RATE_44100 | SNDRV_PCM_RATE_48000)
 
+static const u64 ak4535_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops ak4535_dai_ops = {
 	.hw_params	= ak4535_hw_params,
 	.set_fmt	= ak4535_set_dai_fmt,
 	.mute_stream	= ak4535_mute,
 	.set_sysclk	= ak4535_set_dai_sysclk,
+	.auto_selectable_formats	= &ak4535_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/ak4642.c b/sound/soc/codecs/ak4642.c
index 08ec2035b2705..e5266f94fb006 100644
--- a/sound/soc/codecs/ak4642.c
+++ b/sound/soc/codecs/ak4642.c
@@ -493,12 +493,18 @@ static int ak4642_set_bias_level(struct snd_soc_component *component,
 	return 0;
 }
 
+static const u64 ak4642_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops ak4642_dai_ops = {
 	.startup	= ak4642_dai_startup,
 	.shutdown	= ak4642_dai_shutdown,
 	.set_sysclk	= ak4642_dai_set_sysclk,
 	.set_fmt	= ak4642_dai_set_fmt,
 	.hw_params	= ak4642_dai_hw_params,
+	.auto_selectable_formats	= &ak4642_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver ak4642_dai = {
diff --git a/sound/soc/codecs/ak4671.c b/sound/soc/codecs/ak4671.c
index aac54e9d54ee7..1d804f03a21d8 100644
--- a/sound/soc/codecs/ak4671.c
+++ b/sound/soc/codecs/ak4671.c
@@ -582,10 +582,17 @@ static int ak4671_set_bias_level(struct snd_soc_component *component,
 
 #define AK4671_FORMATS		SNDRV_PCM_FMTBIT_S16_LE
 
+static const u64 ak4671_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A;
+
 static const struct snd_soc_dai_ops ak4671_dai_ops = {
 	.hw_params	= ak4671_hw_params,
 	.set_sysclk	= ak4671_set_dai_sysclk,
 	.set_fmt	= ak4671_set_dai_fmt,
+	.auto_selectable_formats	= &ak4671_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver ak4671_dai = {
-- 
2.53.0

