Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011007.outbound.protection.outlook.com [40.107.74.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB903546C4
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 05:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788152828; cv=fail; b=KD26EUO+8CH6zWxH2creEMqU8X8begkml9FbCwzbyeeIb+q2BudSyzSnnZVy0ZmyRmWhPByesPYB8nfp3n/hslyjICUcfFw/zTnDj7Fn/5d+YQClI/MwYv7oAdLfFkLqAKznKFUvu5fi2Y3h2M0UITn7EHVFGm5+3B5aIikwVLU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788152828; c=relaxed/simple;
	bh=qCpyvF0LxQHFsUF2YADJUkHyPppXH5QGXtAaq3TYtSs=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=IKdEf2Tv2Vvx0fEeakYdc3ppvz0CPeP4106rt8Lw+6y/uIiPx6tZfSvodxSlXrceSJ7YDoT+DTiG6PMQIwx9DppMHEOupg3vVmK1XY4iBKRvMRl6rf0jiIljnSa+ok59e8kbx9WBi31qL1KyzGJ1Dq0PlsEsoa2U0KRn3kUcd44=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=bYStM/rd; arc=fail smtp.client-ip=40.107.74.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="bYStM/rd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xNITYHkL35f2bXXHvFEIg6yVBefkGiDnsEO0g+YS+M1B2pN173BYjBK2YctYNWzWbcREPDDFt3IlksYCoAQ6qQGmj0NywJ8LaNwwOkhSr/6RjaqaIAOWSdkDPAbdWUqYJ121/0WZo599/4C+yf8HcK0/sECoUYTUVfjw7wBlPAbPNumEYouj+OGSbYUxEBD4dEzQh8M1pIeHFaMMkY5UK9jVy60nOj3IuDaoQ8SBVsAni+QvOtilGsCOoT2miZ5qvV2j+pjYTfzsFWAKA5Gh0yi6JISOWU02VX3dVHhkuEWTFQbAZyrdpkEw/mkrK2OuTv8zr3X2B3OS7nGfPzMa9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ieWVW20yry4PMwO1l1NVpYHurQcSNRxEz65TWaZCscg=;
 b=r3vncdLT2bwvyHaUrG+7mXHzVdXt5Am4lBWcE++9oFbGPYDI5ZWsAre/7RZeNagEcdVGFcKS57jHeUhyXNY1hlXOUv/vHUbiqV6VHkuslLUYdM9tXifB0lWrcQfH/3x8MedIu6jMKbhgI813pVCI3BM5hWJQMEmkJyB37RS7VmVaQdgzw+We42dnZEphgK+LjQhtH52RwnZByHjjVVCvWTqZR9exWhbea30poxD9lVg3H856mNnG5FSjtKdAfKM9jQxRN6Q0eFCk5wOsK7CmW97uQqL5Bd6GecWY/4ax61csWuyqee/iqC7L0bH0Gk1r19Y6vqezB1STlUZFvg7/mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ieWVW20yry4PMwO1l1NVpYHurQcSNRxEz65TWaZCscg=;
 b=bYStM/rdHacFwEEGz83PMxtAv6gRw1DoCWXgKImdjexZ6txL+j0CcT+e4BVW5yUR3+fIgzcwzwUp8lQODv8dw9T1zu+9OBNqcAwSSaNO5pPPwEvFpxLxZ7YBR3ZBHOFRxuyj/tVEXiAaaX91gjHNTAqxpZhYclU3lQoeDF0U2Ww=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by TYRPR01MB13019.jpnprd01.prod.outlook.com
 (2603:1096:405:1c7::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 05:07:04 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 05:07:04 +0000
Message-ID: <87ik4qvpxk.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Takashi Iwai <tiwai@suse.com>, =?ISO-8859-1?Q?=22Uwe_Kleine-K=F6nig_=28Th?=
 =?ISO-8859-1?Q?e_Capable_Hub=29=22?= <u.kleine-koenig@baylibre.com>
Cc: linux-sound@vger.kernel.org,
 "Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= (The Capable Hub)" <u.kleine-koenig@baylibre.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 04/39] ASoC: codecs: ak4*: use .auto_selectable_formats
In-Reply-To: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
References: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 31 Aug 2026 05:07:03 +0000
X-ClientProxiedBy: TY6PR01CA0028.jpnprd01.prod.outlook.com
 (2603:1096:405:3bb::13) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|TYRPR01MB13019:EE_
X-MS-Office365-Filtering-Correlation-Id: c69b3a08-e55e-42c0-1b47-08df071db271
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|23010399003|18002099003|22082099003|56012099006|3023799007|11063799006|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	dGNdEsDHGHMIMEhl88a9JF3KgbaDDvZiDmQZNEVBJyaCvRAI7BcvQ32c4VvsPRgLAPOZf00MCs0rZsKc9mcuWSwjU3dwEj/sqyYoLylb1zwOjk437N9R6bHG72pQ0/I3lwpKosKK6o2r4rPdv2MA/mbpHqbf+y0DXK32xl1X5kw3xJ4Wnqy14sXCFqC5zsQHDthC13gGHV5g+JDkwB2Hk2VFvgqRNs7fswGXKiq3jgc/Oi5BSoSZ2c1UWJSyx1GMkIpGUNZbA9UobvNdxGPj+mYhkpZOfwFdYNHa1PwQaOnVcI9XurVqOTmXWjqkd97u0GfsmNHtW09L7fhARD0UZ5vZ0c1hF5PmW876RpJ/93dXHSOfdhW+NJ2Q2HSGxZ9DSvpThXpPMv4ZDY1pvErtGQ2/ksR7gIprnyswtUqlhuuSzMbBirSDbIjENTTYmoa0RQeEnWTpZsQaHWwYTyLVoy46Aw2PX0UYj3Vo5Wj7ZoayCfbnb5XXOqqTfQNWdgFn0bLm8bafJjAW/uuOPmB56Q9xC6V8XbbnVnPzrNV43anFuNIIDGOEZb88dEEjYo+B14V4uHUOnn+IAI/a6Qslr+vfhOZJ5ft/8IAJ0t3J/fwQxiNs7b8RHR1RQySjr5iU+QAViyyCc7vfYdckz6DESTWowBcArHHP/ed95M4MHdddoocmdd0IoQDzicJRJv8RRSHgQa2wpuVIrS4B5BFx7hYErWT5LjuYV66EL00HJGo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(3023799007)(11063799006)(10067099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3lYeYp4UqPG7NkmQUrr9urzNFA0gukGdKJofgMitoYrYpzWJ4BBF++zhTU6k?=
 =?us-ascii?Q?UQPnkd5TMbuKOYTjd8YkY/IglzxGyInCqQXIpayJRQZgdKerpOgH5xlq7yu8?=
 =?us-ascii?Q?yv+2OwApOiDVKByg45/vMawbmPiTMC5Gg3pEpWAzO9D7S+/lJasvB0jHIl3W?=
 =?us-ascii?Q?DZGKgxrjVJs0WD0oKM2DvXqTiF6rvgnrg4/2aRk2qyPxMUpnZ6yISe+k5vtK?=
 =?us-ascii?Q?KedwGIdb6HsDmCAeaGWG+mVNppYuaJw8FrqbeLpe2HCagNR8quIpdXsA/Xey?=
 =?us-ascii?Q?QxuvRsDc42Ozz7KgrSmWpFOyeCAZOB6i59qoHv6KQs/t+zJv4jIbW7GBwn9g?=
 =?us-ascii?Q?KOBWNCkwwKila3OiPOO30rT7IwrVX4klK+9QDONGyxtf0x9Rja5lO0u+YOMM?=
 =?us-ascii?Q?N+aRgjPoFHnFpnERfQABOCs0MHn7YogjTxGmNnWI9oD2zVYqYG1NllFvo0jz?=
 =?us-ascii?Q?6zCcGPaGxouDff4OoaEY6+FM5ZOs4tEHwi/V20UlsgfjiFqFOqQi35z3cAVM?=
 =?us-ascii?Q?zV4QaneeBvOM9YR6dDcVstifYAXwCST2cPxQ97o9pVfTAAyJNX++TXYUMcMQ?=
 =?us-ascii?Q?21eXgCTFYQACwPtXC00ArB4NylfjZ+Cgr5cbRTCdqP/bVvgc5tmXbuBP72pF?=
 =?us-ascii?Q?Fe1vGawSNEsJP3dMqk7x5xp3bIg+CwGi5ASaNh+2XSI5W8b66VkxlYcu6Gli?=
 =?us-ascii?Q?sl2QtszMc8YgvsqSB4Z9xflX8mAXsEquokXCezJhITx+VYF/uO3VBAOUK/eJ?=
 =?us-ascii?Q?sMHqWu1WnU8iAORZ12JyKwcZhkXjIDmLbxh5aZsTLk0gd9YETDe0+6xDgVCY?=
 =?us-ascii?Q?iNOBpdfKe2OSpbG5Di3tnXrbYUWkR5+fDf7Sy5/Y7hgeKmwPdiyRqLWN/Yy0?=
 =?us-ascii?Q?lgSxmWwFae/2n7tBu1ai5ORQU4Ufxyhpxi035uNKRte2EdTes4eKCRMEUMmg?=
 =?us-ascii?Q?itv2yfHrZ401wlJzvFd4jVu0PGtjlhz0yHbbcePCstpC4PeexUB7TtM7Jg51?=
 =?us-ascii?Q?FJspT4Jyq6krYKAgj5WHZN4/qEHqDwHKe/ddjl9I1auqhozv1xNj4i6w4oY5?=
 =?us-ascii?Q?t+1aJTakQedCwfpbH+08KZp9+lWATz5rm27Hwf6N4LHT8S0oz72FULmUWvG2?=
 =?us-ascii?Q?VP3YFtUe41lUyA6k6ftzzAw3Cig8Ks/2f9DJnU4YJCe+LLhnoc7WvaNU4hdU?=
 =?us-ascii?Q?If5RLVBWwgmXKaa6cNXLA2kQgu3xmThvPE4N1rCG5m5T5sYGwKGNMkR4J4R9?=
 =?us-ascii?Q?gMPcz4y6Z4GJ/uYvFNi91L2tMTZBJQVAzk6HHRN/KZp04NJYq8gs9zcBkUia?=
 =?us-ascii?Q?p60ucVsj8RugU2WjbX3mU2dIX5Spay+fdpGUW/1OBCbSzS7Yvwxw3pNS7P3h?=
 =?us-ascii?Q?ZgB3Estr4faEfPMtBvSxlzJkhfiJmO6Pq7Z7XknzJ003gn7XljQ9rtXYZYGt?=
 =?us-ascii?Q?sNciCuooQsbM9TrjdRpLcG1OrvRG61e4Bg4uKMvZEKPfoxgVFcdYcXLtlZsD?=
 =?us-ascii?Q?6Rtffy93dUTnrmKAPNMGsN710cLs7V3MFsoct+ay4yhHrTfhlNCWOy529tWM?=
 =?us-ascii?Q?eiNZGR+M+eLcYYh5QbciECjQuCYs5VY5x51IOAgtocQ/raXt7pScnB1ujSSJ?=
 =?us-ascii?Q?js8Pb8m3cccsFcxr8CX08T9nGoJ6tzfoxkbtW6rW1vCzPWFrBJPSb39kvnTw?=
 =?us-ascii?Q?RCv77wiWf5aCazDeWpu4r+uvVbIng6aCLi8lH725Y0obI12YyzsQb4waWykc?=
 =?us-ascii?Q?OFXiWqMKRZfF9RD4UHgofefol9KjE+Df+u8gYvHTdF0iE/oQq5/V?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c69b3a08-e55e-42c0-1b47-08df071db271
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 05:07:04.0744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lPRhvch6ZYvW1HcFVlGjXzmttOETCd98tuwYfcPn6m7oQUL6G3cWDL6MaA0t3tqQuF61uZNQuewL6Q9+wcn0y43c00Y0C56QhzxF9zB4dbFRKjAfJO1Q3nEc9a310mrz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13019

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

