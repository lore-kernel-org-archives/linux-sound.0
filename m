Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010007.outbound.protection.outlook.com [52.101.228.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4A82475F7
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 00:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786064087; cv=fail; b=Sa0pUepUjEevAFZzVLle6X4bXtcG1xJ+v+2b99t2qEzYeXISt3h4wyiGZsR4omhjX0ck2HZbDFs/t0BBGg3ZmF2QK2E2CNfzX/xHQSSERCVbYWTYrTRWPdfbFg9tKmvKoKtRQ+vJGEJSuOgwXeHnKyh80KvBOi+LmBJogQ3Ipes=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786064087; c=relaxed/simple;
	bh=2jznu7QIZiO4NsD8pziTepENw4yS9QU2jOPgjB8Co1I=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=QFdW4IwsoDOnkKx/6MHVL5Ya0pF34ju3spA4jsHBV1v/rWtDNiHDCA9ZJAvDe1hSUlQltUp5ccRXsvFEp2TWBk4c9K0M4lnyee+JbGl+pKxzytuKGfMBJ4oVycHMIgkHrX3WXQPgKgvXvGuLMmmVBXoLcC/Uoq+8BXiXluYOp/0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=coQXszzU; arc=fail smtp.client-ip=52.101.228.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="coQXszzU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FTdb+2qD4edBho4ZBrWaIZSxzXF1LF+u7nzmtgi7hZGthQxgqtNsajYyZpqdUQJXE5dY5tkWI7lpe5RzGfv9xqwBznEaxhmD7Pp288Mlczbdo48lY3sXWBHc4w034lKElIav4yqzI7m8a5fB4K9AVntd8jt+6MABOaePwjQYCUHK7ab/fMc7U9MfornD69YWKcpC6Tb4nDd68ahdMuzCIO/v2BZ/4kT7f+v5PZ9a1853176pS/1Wuw/s1GOsr6rV/IJPqfDimjbdnyLXjxXYcGdlVLGm7VDp6cXMuBlBsvlVJNF2mFoD9VEzmdVN5Ike9Thboctf55T5AOh+H8u/vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w2QPMXOOFSZK4tsQyCXfFC7+AhQEnaxnIw6Ttn68Zhs=;
 b=fGNlBMVeTNUug0T/AqvLiDr4Q8U/ztFZe+ZqB3+89R3kSgwSVh1pYhYwLug72eZOvMn0eosrg1g/NdC3QXEm8+t8kunC4VQClzYPVLDS5+4wnrGkSTYnf6mk031A1fGZ2uwd6wMKBtseCrXabO9EoyjwzntkYDCJ++/R2yLi71abbWvQCk9ZL/ih2llh3HerxfTCTxZRtAOVTLQ1rNdmqbg0DX0+4jo1BiwJlCNf40mFaa8Wlw+xhzhfR7kNabdroNIeGARP+kfrS9HuOTTtHsRpyU0iig8k31Ib95SluSPU9HJwcvtTqYMJq94WefGHu5r+5ISkMaaL3Smbqp+ceg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w2QPMXOOFSZK4tsQyCXfFC7+AhQEnaxnIw6Ttn68Zhs=;
 b=coQXszzU9tdrUGEhQCFN81+cisHXoBxSXM3LtzgStR8lNSe4bFZSL+jV7HROuss19AaWLg8WU8rBTff8rC79o0BwCvFu2r8iOeXRNVSAlUzfH41yy/KRzL4J2d+QSK+LYcxeutcgoV1yrCOFYqWBfC2WiN6G1ZIy5IDlRawKDSs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS7PR01MB14460.jpnprd01.prod.outlook.com (2603:1096:604:38d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 00:54:41 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 00:54:41 +0000
Message-ID: <87jyq2u4vj.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Support Opensource <support.opensource@diasemi.com>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH v2 16/44] ASoC: codecs: da*: use .auto_selectable_formats
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
In-Reply-To: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
References: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 7 Aug 2026 00:54:41 +0000
X-ClientProxiedBy: TYWPR01CA0009.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::14) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS7PR01MB14460:EE_
X-MS-Office365-Filtering-Correlation-Id: 037900f8-66bb-4cd7-6059-08def41e76bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|366016|1800799024|376014|11063799006|56012099006|10067099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	PH1Wa5SUGdrvQl79DU0dEyMCymbnue7Kn8xjGQJYhEEfKu0FHNMSVgmoWspDM8FfWr9krnuXG76FwBKX4c9I4hQk1mL/59UFOG8zlkwbrxOlgnBpLq62DFxq10ZmtJApfiynwmtF4hvFEu+0QlwpFXPhymT57sZm4bwP4CzTRXtNwtF6KKIObLZ/axO7kBip6+ILEDozBrrUvUw0XLhPVhuuY0iYkRqEVEOfsbUpE0DyN4/MTmtSE8YxiwGSdW5lNtwjeL9uLx55JGsEwvhgpT0ljF9djIWZ1qDI96QJXvcKGE9k/Ww0BDqYJaX72EXe6dUk6AAdcIh85pZP9eri8W43NuPP068x4ZFCN8PGRMZvGtdo3jdjRtniW3WOZz3kP0DfG7TWiQqLm4TMhAXNMCpJ26MRUn05Srufpo/fnMQb368JU1vYeSWYXFRzgOgT0cBqk+cMKrLLl2VNe4Vu+T+cCZum8aACd9n8Iwo99PLzKYjEzVGLDpIvHQG42kScfokGhfQ4TK7DF/9HxImxWKrS7oZeZsiC77omDJwkh2rYb/V0ev0CsBonZr2l3V+2tXoh0+sHvrz8iHOxrXSam713RAnYVslCtLMuBM5JWsD2EMoHgqYWLOAcgtSfusrx013RzDLWpK7zidXn/C3mnzFkLC62LzqdqoYcgGHJqX+HSPfWLfJFWDFUUQs4B6z0qF1Dt4wapGJ3NqDUY4znuBut+OaOzWC5I2xyGGwhzyw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(366016)(1800799024)(376014)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OUhORHBCnl4RXv9YFnt7+UjssiZ58Q0ERkCw1fQhP3HdONF1Hj0azwBb7R78?=
 =?us-ascii?Q?VF2UFC5ULuSZDWyXSDpSY6BSftFjeH+jOcx84tL2O4gBTZM3GcbpzpDPvNpX?=
 =?us-ascii?Q?lqvXM5d+Yr5p14qPt7uslloKrHKMUK3IwHb35wJn52NJberlL+RiAEn/+pf6?=
 =?us-ascii?Q?wCLrdjaEX1qMOe/9v34lDKxmQYGtmluerciF1PLkRaijkXPXpOZXfhEjnItg?=
 =?us-ascii?Q?i0Gs9T444xuN7RQBLblHVFz4pXxZ+ubmtNi7S9/iTI0f+6D9ziyrUSCRJgJg?=
 =?us-ascii?Q?z/pYnyn/mdIUajAlv7mF6f0OBwcZ5fJuncl7Z1Mzi6KYdCfGffub2cKG/8QL?=
 =?us-ascii?Q?EClY9FTdSddFqvVJ/CgeJmaiPmaaq2ynHdIdDDbjuRDFqySiCsv3NB3CyPNX?=
 =?us-ascii?Q?uJTZ3bXbP41/Kujd6Rw091srki15q80seiCNv6X/iCT3Yb/tsAWduSBJuzF+?=
 =?us-ascii?Q?KV361pUs7029px8MIB1oFmOu6Y/ddyd2jHYbmawbQzxrRvjvrvqyLGBC7sWJ?=
 =?us-ascii?Q?siLW6404JnzyKbmxuX444XIOr1fLJbfixsWmCsl8j3cRRm/SWFKjVMzOKf5Q?=
 =?us-ascii?Q?eTD+jBvRO2vkG/qNC8o9wFZ7YyS1K4b7Su7vNQqCLfcsbPLWZ24r+1rcjdgN?=
 =?us-ascii?Q?+fXQIZspGGOAZYT3Vj8sTA348ERKMOpqtCcWACqfVNl9UPLRwLjRUfFSzPmH?=
 =?us-ascii?Q?5EDWeUvy4DwVS5rAHbrSwRD5tJt3GL+70E/HakVJRGaPJNX+D9qHE4LyCFOO?=
 =?us-ascii?Q?ALj/61lap5G7HvcKbEmM00wEInq3JuajbzUNIVnK2TT6P7x77A//ul+WuxAX?=
 =?us-ascii?Q?o+Gv2xXBT8rTQn6C7+Y/ahBj2bErXUNrrP5pd8ESMbJC3usQxfnViv4KrYdp?=
 =?us-ascii?Q?IYmto15Aq3WXAlMkG7MWpoQHPp6ffFQlVPdopr+ILZ0B+uB4InE2SsxXrztz?=
 =?us-ascii?Q?bOvxL/LU6DJWIO0d3E8rc45r0QfTuXjrwPPnEmoeC6JssOFEIw70PqyrOUfc?=
 =?us-ascii?Q?MQr+xUK5coK2XoW1/cHAhUAlYSohcwnOKsgGkz8Pe/7e1WCnqSqIhoYqbnuj?=
 =?us-ascii?Q?7Qbvi52QdIGTNY59j+3t1ZMq6lDZh6yM4QvXFVrpaPfILjNJEilNOAytkXhX?=
 =?us-ascii?Q?vbx/f5yyZT48KhRdBtTBB67ekDUINezo746bZ6ByTF5h8Gqgmfo5ET4wD587?=
 =?us-ascii?Q?2EXa+8jn7Zgtn60C69FiKH5WWQOvoZC9y3zEcg7pjgF7S+Efy/LTM33ZG1S7?=
 =?us-ascii?Q?fsaFLdYcSCFjGBzva3uRUvxwCb3YIGgXw7s3fafeSMfjNZ0fV3xZDhqZmQkw?=
 =?us-ascii?Q?ZUlSYjfL6moogUOTNMHe0o4f7QlL+kfisHdBEFxZaeC57UBKH0HmBpPMM0Wu?=
 =?us-ascii?Q?2Wqb5HpzPZBiY8oBFpUHZ96QIBBwuL82a/6COZiaqlBkY3ihEkbWwFj0p13s?=
 =?us-ascii?Q?GvUvy0gJif6Qbg5pHyl4klNl+BFK5RlJlPuT/PhT4L9+4+4SQnCQE8sI4UPm?=
 =?us-ascii?Q?TmLx7dPDx1ZXrJA8cnWF3MdXzlR0FLWhENa02Q3rZF8p4/7gUQI6cUNZiUq8?=
 =?us-ascii?Q?PrrV/EAJeUS6Fs3SjIYO17QS+7lHN5uRv/oNFwZSqBFNxM6RLkpVhKqAnxT8?=
 =?us-ascii?Q?xdQP+XbjTC7SsIxUMzwPpcz3izvN9IOWy/NqhdhWZQM8PkLt8pGRXRshK8bU?=
 =?us-ascii?Q?Z8hn55VpIfKN1pwiXpjknw8yko4ubjLW7VMLlHLAMkOlb18nLC0xrElqgI+D?=
 =?us-ascii?Q?93bSjZu8W8sEBMQ/O+QTnknw2UlknOh7RgOPBNMClFMkfv4+CUS7?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 037900f8-66bb-4cd7-6059-08def41e76bb
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 00:54:41.2537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PhwdiSaiV9qoOnrZsXU8TtWw2frgIhixMCMmCQIQU11ooAKmh2ntHFbxdKiYWmHWWEGOhFxJsvhlrUGizkgyfoiAmlfpNa+WkPNeiB6MWZSv69yQK2tE3GofOq0UCoqr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14460

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

