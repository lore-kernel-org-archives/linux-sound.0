Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010068.outbound.protection.outlook.com [52.101.228.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C0D3B05BF
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 05:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788152837; cv=fail; b=X1jiXDckGeJiZvUYSyp9SFyNT0IZ7DkoKc4BCJ2UakWXIF1e74q9Co4zLVN4VcrO88wR7UmnSOYRYWcsjt3ycXQN9FSv6OuRPwqZvEhltVK9V0crYgWJn0x7RWKXEeAI9gYUPRsb9ToSrdqUAtOGsZ86SQu0GFiByxT1Tbe/FzI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788152837; c=relaxed/simple;
	bh=LAZhXE4mYEfHlJj20TIaE1hXyQHb+VH/yoF9NEIG5dI=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=GEH7zl1JHcuJSSX3vezA1nJs5by1LfkgBwvORQlLgqOhdnRqeP5COhEVmp26DZNwa0FBX9cK1yfTCzkWYxtNIij4G9svxtBYTVOdIBkJJgOYr4/Ai9/zm7WNnAT6DNLy0COu+kldLKkFT3n0fPCvHlk9m1pIeEvEYFjYPKrRWxk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ifaArSl1; arc=fail smtp.client-ip=52.101.228.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ifaArSl1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ymxkdi3IZjtzBZRr3oFBvFE7MLbr4gacJ/JzrvRZ6lxxd00vldBBOO+KDNHwiYOrMXIRiHkwttFdJioi+/ZdsR54rJDAxONigxSU4K0cgWGVQAyERjG5GyXhnfz5TCMvDpbpD6dpASeF4AJ/KofK89kfKuJaCGzXUKfGkVSwbkqxnN0rnYqX50Is7erML8cum+2SkQOs4dyIQ+lQZuXzGPWCz9TvtOyX1hXMi/YZ2viOKTx/+OndQcuFOQmDDhbl4FS3SXB1HbmcZZYiI4qf+azynxaI3JrJKyrRF1afEwaycUPeBAVSzho8uRaVsq4knbzJMGnFqJDW6boVWytFWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FjTJGNhEtRo3+zGQfkWLuTcBg1lD27Suql9M9mXZvVQ=;
 b=T/jgBO6vODARcyUPDpAEB0SLVj59tQOT201emViQBMwcph8pVWBMlmNRvgaZMQMrUxU/u5pep/PCD6xhnBO0PXYapADvcjn1SVNuB/2CjunAGu8qVwxyQlZ240gYLRq2mWeF+L3q2KmvfxdiqG6gIs9uwCTf23vwoPL20HzYfU/BxD3VDejeqCNueJdAv6zl+q7RkTFhxWDM0bzUcvChwX0gJhQS07yBeeeVpTIiYmhetEWA9VW3r0PIZGlLRHcAOJTz9Y5bIxIXC1g9WSdp9mo6HoaaMPS5ldIZqcZipTQhoQm3JouMCsCD8axik56NbR4mPNvxLTXKyscfXC68Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FjTJGNhEtRo3+zGQfkWLuTcBg1lD27Suql9M9mXZvVQ=;
 b=ifaArSl13QjUefqFtQpZ33HuUE0iQSNzeQyccKlmPU6yrM+f0X8JpIsjQIsT+5cCH3/qCqJ3W8wQJgbXKEz3xw9LYkjjYweEKYhQ6Mptr4TH1qoFegHslqChyFCKtUNASNd5JasVGHZ/FktIJCCqKBn54dZyevLvXK+opVaDnvk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by OS3PR01MB9785.jpnprd01.prod.outlook.com
 (2603:1096:604:1eb::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 05:07:12 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 05:07:12 +0000
Message-ID: <87fqzuvpxc.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 =?ISO-8859-1?Q?=22Uwe_Kleine-K=F6nig_=28The_Capable_Hub=29=22?=
 <u.kleine-koenig@baylibre.com>
Cc: linux-sound@vger.kernel.org,
 "Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= (The Capable Hub)" <u.kleine-koenig@baylibre.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 06/39] ASoC: codecs: alc56*: use .auto_selectable_formats
In-Reply-To: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
References: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 31 Aug 2026 05:07:11 +0000
X-ClientProxiedBy: TY4P301CA0095.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37a::17) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|OS3PR01MB9785:EE_
X-MS-Office365-Filtering-Correlation-Id: 53230764-e88e-4f55-a79d-08df071db747
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|52116014|18002099003|22082099003|56012099006|11063799006|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	xwfNSaaZbWspw+5wtYNsUbleW6TPg1BeSNXYSmZ9JJHJ2W1ZXEjMhqz8esBdjB2LKd0aAbaCNGNg97Oe1BdVKsK/v/yhgjePUiHn4epfUt5ZtpLMwnhOAVLrNGoIObAmpNyVyT5+MtfIaUkF+nprs1Ir57J0nMC1dQGXp577DW3lBQahMWzGRcItyg07ZZgfOeifjgJetxtXmMbMfRFnnUlkFi/mCDSUjF8826L3jHYrA6H59oyQ+3Wqrsfl8iRNHN1X43ANEIuhoT8yIS0PfF+4aYRrsD43xyv1LVIKuztRGuFiJioYRaYFApDXcZDNFpYOBi8IxuuNcaEwgHw9WfiiaidzFnVP6IZu5zMfcowh9OAeDZcvWfFUghxOKzmvdvMAzeQC2iMgVHQROV7nGPkdQCQ/yN0cS1FQ9bWQcG11L2AOwZcp7Ep3X4t5aJR3ZcHOZvmlfkCZ90mu1eDRyOrSDYuU1sITzoRI+1zPJsMU+n+oQWZ12+3J7K0rpLRWi//HtSB3bOR2AEDDOCnRkAlf9k7G45GRLds5CYuH3NR48g07uTpRblAzcU9re6jXt/zMD5ag61SX/ZR9nlEpo0JZDTguDqF96IzNI1rAblnhJK6q+rjg0C+0ibAIqgbH5Radu6B7XYPxE9xdi+TFYnMymfWn/ZF4hf2sU3jw600vKKAc9Wp5ALGT9RiHBNsc0PECuyga73bwjjADb1DGx8iv8/sMBQtkTTz/AQgEi8I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(52116014)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WI4rtFW8tCZsAQsoJ3n9MJL79i3LenwxzHpCTOOKrA/htsMrcK6U9U+CWHan?=
 =?us-ascii?Q?aW3kURUlpEM5D2iP5m8+pG7vCAP3b+ozw84T4tH8590b2zenGzE9KqPmSNIO?=
 =?us-ascii?Q?Nl1N9MUnudmNpuAi2YTdnNnJpofEjYXsKqBVxO52TfoaSNSxn9Mm+GOS8zAv?=
 =?us-ascii?Q?PD+IT8wwNb6H2li/h9buR6rwdpJOlTnoOC7v2MC/J9yRNofUWrBdxzl5zzPm?=
 =?us-ascii?Q?hDbgmenUBEEBS9gF0y60qspLtbp+ho1BLNaBnwb5VcVTHWn6fW/1v9/QG1Up?=
 =?us-ascii?Q?Jqr/2Yw9bLlNrci2voQcWQ6tspHFp4fpVjwlP6J8567OiTrm5y7zlfqtRFNi?=
 =?us-ascii?Q?Z5lJvJNb6GBoKMOrZGxT6xB+8/ewbEC+MytDMNClEOuCFLuwj5J4ehSQvBXf?=
 =?us-ascii?Q?+EHjwBAHelhzQEQ1E77IAE+DN7vIMpqncakgnjEKU1qw9LdmYc39t7DEJte7?=
 =?us-ascii?Q?YAl9H1MvIYwxBZB684T7q5G+lJVmk5sTmWiw150aB5gp//hjG9PaQFL+CH4q?=
 =?us-ascii?Q?RuBecI3RnfZTAwj5S5kvArHy6a9NvQA4POSur+S28Il+AeSrCWQrM8HbNot6?=
 =?us-ascii?Q?3b6SceJgM8Ph69+LdyyafDTVurZOON8lpOLERfGafZSZFeNEAaRZVc7fo8X5?=
 =?us-ascii?Q?iKDXA5aCwz7p9k8jg4LEeR20CApGLyqyIc6nv/M6uJDWooh8sMBKTdlZ/wKB?=
 =?us-ascii?Q?tYRNQT4UePxAB8Tmg6PFun5cunQhj+MgwnInmun5QJv2OzDWqqspeVzSvBJK?=
 =?us-ascii?Q?Rmj4nQy07FZUu4nL3jXAihIE8DNlD422Iw345jYmOk+wkOw68onPU7Q9krXi?=
 =?us-ascii?Q?QePpW8/jh8UoDQnFkiAeFDmaKmrFoodbscws2cHncTk46TisIxWmjVAygZRI?=
 =?us-ascii?Q?WAU5PzivMEzxY+cpKPgSDYOuAME6ruV3rb3+U1B44nz1Q5YRoAXTYbNGQ9ah?=
 =?us-ascii?Q?MQrX2OiJR2rn9N7XEaWJxKe6LgguVRmXSxscElxpnPBYXr1K3oZKdpIfUkcC?=
 =?us-ascii?Q?Jchc3N8dvzg9PUvT6LM7pptzn2HUE7ZZxNBkPQJrH8Jlb+y8B/DEoZa1L3XA?=
 =?us-ascii?Q?nHAGLvgpZASs0vbA5PNDkct6Y40ePnWpeFTb0tFObBHtMuZtiYrcmniHRGPG?=
 =?us-ascii?Q?R+vEqFxJfJzPGG4AhHS4YuSsvK6fxt0V+1+5VqlA4P4nd/Hd4ZgknuxMFz8q?=
 =?us-ascii?Q?krdmHrTjMs23NlxFMU8A110Q18I2A7pMO+9l+L+JHyzsQ34V2KEaQoVMXw8w?=
 =?us-ascii?Q?uYJ/Y2hGwd/1jYPSPNjHG+PHNBgMsW7lhoZZCGgSB5DfUJ/zmPRk8oGTV8cv?=
 =?us-ascii?Q?J0bZb9CwsMsiH9uPRGFJxA5oU2S9GXXVF5Gh5p4BweUUclvkCnVOi+xojUYe?=
 =?us-ascii?Q?14yARaLbfSMmNN48ERGJRkG6UiieXZoKARGvN5ZgxFQZ/rExOi+jtPCYXDky?=
 =?us-ascii?Q?A0SZXpGKh8R0UCZPJE2RlIjtk7DLXbWVrHDhekoHBGEQneRlVjMZlC+DYsoS?=
 =?us-ascii?Q?xgWN8McdDY1pnzWDHF6MeNhvc2hpd3uLxh2jDsjbLQFbUja0JldLkbtM3wZc?=
 =?us-ascii?Q?CNxbGAIRYnrrE3Rji4RuiQQmxhf4CD0sTy06hd4kSFbWO9IN2/rEDrOYAeI0?=
 =?us-ascii?Q?kVFxY8mQ4/SS6E7gqz28+meOBl0dOHihIZNfUH4P61dZ9JpXPRMciNWnzCgc?=
 =?us-ascii?Q?e9M58KKVElVHERUUq5WDdmuO4F+cbtoOnaoILMGjo/CXwtYoSbCVvZg0pFcN?=
 =?us-ascii?Q?6FQvJ5+p+DD4EVIShISAqRCRhY156mC2ET67cM3/JVe3LQ4KPM8l?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53230764-e88e-4f55-a79d-08df071db747
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 05:07:12.5005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pbNxfnJxP7bRZM7g2j8cW2e9ubX7XqVNZlNZSdGqvxsCGLA/XF6n0rl9y/PiKIyDjORnadZjam2CuUU9NC+zJa8kHLMQzxynkFNA3vg7QeBBcecZZqwnq/abu+gRGMzP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9785

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/alc5623.c | 11 +++++++++++
 sound/soc/codecs/alc5632.c | 13 +++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/sound/soc/codecs/alc5623.c b/sound/soc/codecs/alc5623.c
index f5a666c493615..96bb1d5927729 100644
--- a/sound/soc/codecs/alc5623.c
+++ b/sound/soc/codecs/alc5623.c
@@ -822,12 +822,23 @@ static int alc5623_set_bias_level(struct snd_soc_component *component,
 			| SNDRV_PCM_FMTBIT_S24_LE \
 			| SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 alc5623_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops alc5623_dai_ops = {
 		.hw_params = alc5623_pcm_hw_params,
 		.mute_stream = alc5623_mute,
 		.set_fmt = alc5623_set_dai_fmt,
 		.set_sysclk = alc5623_set_dai_sysclk,
 		.set_pll = alc5623_set_dai_pll,
+		.auto_selectable_formats = &alc5623_selectable_formats,
+		.num_auto_selectable_formats = 1,
 		.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/alc5632.c b/sound/soc/codecs/alc5632.c
index 2fd3dd7ef8b34..a5e95f3fc2474 100644
--- a/sound/soc/codecs/alc5632.c
+++ b/sound/soc/codecs/alc5632.c
@@ -1003,12 +1003,25 @@ static int alc5632_set_bias_level(struct snd_soc_component *component,
 			| SNDRV_PCM_FMTBIT_S24_LE \
 			| SNDRV_PCM_FMTBIT_S32_LE)
 
+
+static const u64 alc5632_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops alc5632_dai_ops = {
 		.hw_params = alc5632_pcm_hw_params,
 		.mute_stream = alc5632_mute,
 		.set_fmt = alc5632_set_dai_fmt,
 		.set_sysclk = alc5632_set_dai_sysclk,
 		.set_pll = alc5632_set_dai_pll,
+		.auto_selectable_formats = &alc5632_selectable_formats,
+		.num_auto_selectable_formats = 1,
 		.no_capture_mute = 1,
 };
 
-- 
2.53.0

