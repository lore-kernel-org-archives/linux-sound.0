Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011070.outbound.protection.outlook.com [40.107.74.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCAD37F8C7
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 00:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785804076; cv=fail; b=hPPdwl1hdqErcsxLd8afc4QBRAU9MKgjL2L4MTRmDhO7nZhcm/kdPDnsezneRWkN9OqXkidtt1yFUTLJ+5IdKRq9gW+YaP5i+OO4Os0iYeD9EYdy/77gQCrMEG4sNQ5oX9mkWNkhFdAkZEjIOMKUgckUl57v3U/W9cNec1d3Sl0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785804076; c=relaxed/simple;
	bh=qCpyvF0LxQHFsUF2YADJUkHyPppXH5QGXtAaq3TYtSs=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=IhHx9X6oaUJ/ZWzfd8iqESXftJw3qHycIyCCn/N9YhKMuqWCeZu82zLUTXPvbZUxFaQkmiUS1trqIK7wk5lmcD1WsShRzIwjwsyy5pW2GfZSKI9wzVh/aMmZn2DMQePih4Uq7pkWgK5iq26lbNAF+yADtzrHblFEq8Oe9ZmTTtg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=kmDHWYLb; arc=fail smtp.client-ip=40.107.74.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="kmDHWYLb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iMaRzzNT7GTyQOCqVbtUqfqzPR6Af3qOhzlIl3+5XdmGpNpRrWZNhF6D2C5oA+dYfgDbdL3xfKaOZd0anSuPZNOSY/34s7tYkBw3Ap1HMVMZc+TcsYu7vREQ1QT5vK0vXv2Gtr4kV5YeqqO4oMQIAD8XPsSkKz4vmZctKxtohC5dlfUv5gyyEhgxv6E5hwRdwjvDSbqgpOfE0hNJMF8kji0EA3lLRBDyP6BMurjsZVqJwZgpsan08Uk6ECbiyAPROuY/50m2KbFn60GbAuEUzk6U2Fr+HcupNzYKFrDCBzckBMaPxRHv/Vy7zhsxX05W8LXm/A/rvtUQUBb86TKAyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ieWVW20yry4PMwO1l1NVpYHurQcSNRxEz65TWaZCscg=;
 b=Blj0fNB9ArCvimBH1ewjBXpPMnTFQ6T+shn9k1yUbVwXS33+0iVOxOo0Jh3gKisbBCWImFmvzZ35BPRSycJwvdsmv0HPWmCnRGldX03uPsu+ZeYXEtPYJRGR8+4Z8iwdqL7UWGeNslwJ+Z/QSUkyJJf93mfjxdFREy48zI12xp/v0noXEis8t97O7UgCfINATkDbvB8zSKRu3CsJ5YGYGMC4gsJsQ94FW1YSQXzhRWlbKjVRXfav1cqr/dgJZrwEf1zqw4DZaqHyPPqTvVrEeP0/vKP9jnfSJ7vedcbrFrManmAk4TcPOPuqdXx9efpzrsodMfKTmgawS0LwCq43rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ieWVW20yry4PMwO1l1NVpYHurQcSNRxEz65TWaZCscg=;
 b=kmDHWYLbXikjbW3CKHf1PIn4/Y7a+yDJuvIuk+VzOlDIbLpBpbFPjDPpafA3tYySESMvea6CEku7bJ7urDORcyo9Or+RtU7dB5JlgHsCYCk7z2hbty9g7N5S1h4yH5Qpf1TkPFY+uUGGeqkglyF2nU9y7HxYZv7aP8aXWFuKf1M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSOPR01MB12264.jpnprd01.prod.outlook.com (2603:1096:604:2d9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 00:41:00 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 00:41:00 +0000
Message-ID: <874ihayaxw.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Takashi Iwai <tiwai@suse.com>, =?ISO-8859-1?Q?=22Uwe_Kleine-K=F6nig_=28Th?=
 =?ISO-8859-1?Q?e_Capable_Hub=29=22?= <u.kleine-koenig@baylibre.com>
Cc: linux-sound@vger.kernel.org,
 "Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= (The Capable Hub)" <u.kleine-koenig@baylibre.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 06/44] ASoC: codecs: ak4*: use .auto_selectable_formats
In-Reply-To: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
References: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 4 Aug 2026 00:40:59 +0000
X-ClientProxiedBy: TY4P286CA0086.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:369::16) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSOPR01MB12264:EE_
X-MS-Office365-Filtering-Correlation-Id: 12f96afe-c480-4a3a-ae56-08def1c10dfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|52116014|366016|1800799024|38350700014|11063799006|56012099006|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	CMjrr3nFw52nGiGCu0vKym+7vXzLsXzi0AqGMs5szD329yV5Mx7CMkRoaD9UK7UJLjY+QXzwC+HlF50fM6t+B/ohu+J3/zQchUwRD0vBent7Q65BHDtm9jGuBJpY0zUKpc6xw0IZaUnLBV/ZXOMHKTPi4n8WKGMFOHR6auop7Hpl2OuR4cgG0p0Fgu8Y8uyMhwPCa0dTSqHtC1zy/DOliZxhpDE5CAwaqyNOhun+Xtjt8OsHHE7QqrG6PzJ6MFxI8j2Zgf7sTmEm7B7tV96fw5O0AzvM9Vhze9qwftFavfRudzSJjGQ7vFuzX+agyPswyxKE3dVSoYs2XUqN8Z9XtFTuKKQwoICB7LXTPRSqbfywGXZe7O/DqXlPcKU/jg6Yf7ev82d/NZnHNLOMs0LvpDA4x+G8EvU7xN4Ka5GfzRdNlRXMbttCzKk2B20XbsgI6k853sn4nkSV+V32COGvN6C+p0HIC2v/BDtLdEHXShCjfzXWTmIWUqPTIhAddFUSjLC3CkF7GXaAqQ3ZCP8l9S1iWkRoly/ECfpwI01nYg0t/owfmVZmQPfwKX8QgIVcTNkkzhiMQXgv+lByYMjz/2SReD9CQK6U6yj8iKQBPeWwCO7Pbtqw+yRNpf9cI4MEd9v32eMkrYysm31CPiRbnm25hhBrNO/2+UtagCvuqBHihJlfZNuYXusrISt+k4KEfftsGp24AiSndiQ3rj45ULmINEIRfXcYLyWIiaLx4kg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(366016)(1800799024)(38350700014)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4oCoTcnARFCe/4PKgJr2IdXnNfuFuigh79L4V5bJ+YZ3rz4te5URzmJBVSe+?=
 =?us-ascii?Q?xvIhHlqC9OIR2r4bepsUjyEuntbxE/FhvNVh7TG/odUy/x1BV8VixXLj9RIq?=
 =?us-ascii?Q?QAI/izZOrBNxzgFjs6ee5texZ+8Zf0oGr6wIynEgbXFLlTyU+y9d6oAjNfd5?=
 =?us-ascii?Q?p6re6oSoq71BJTHWYE4dEX49ZKJGTtf4nzfM2G/VEIk9PA5xAb3CpQZJKUqf?=
 =?us-ascii?Q?uyXkqUaWmbmM6WTgzNmtjqJfuNxAZO8rtEDcuujM/26u9AMN/ompwR/ZpCch?=
 =?us-ascii?Q?kqPv9k8O/BgheuiXpkDq3EXGMm/D+JoyaIZkbydszvnf8maIvgPE+0uoJdKm?=
 =?us-ascii?Q?/ZvkpgyfmbhOOuPowMLVkipkBsfiAtJPwiUyy/PT6QyIZUwmspaLL7z8TuS/?=
 =?us-ascii?Q?EFv96o5BYRzPzatGwPisOZrOjETXc6FRHXEXg1BBEO+5DdAI/BluXr7xlwV8?=
 =?us-ascii?Q?rmXyQ4p0XZSWZJTZEjr30+kKx38IzfXa1/f0UvPFRmEf0RSKTdn43aVxUbYY?=
 =?us-ascii?Q?N7sGsi9cXAInksoopUcS4B41lKWQuRsS8PlwlFbSIoeuVEvmo1iGSASKDH5v?=
 =?us-ascii?Q?B24W3COqUoad6Qs4LTEaGSXInlyq+Cn/zevNw1t1TtmjbylTKOVh6Ot5pH1F?=
 =?us-ascii?Q?dCIxJfquVIMxxckuGoIgjM9brBorm5ocaTk85dBL/23S7rEnQ1KZ3lwP4M2/?=
 =?us-ascii?Q?hZOxU20G+NBqVRNx3+6ON4JxNlKQwFg6AMcERCBOBzaH5XDhwIURAR+CbUTd?=
 =?us-ascii?Q?mPI5NWHNnFTSZOjVNyWIkcQKnIZXMo7YtvwXvm0n02uikXN2JnpXgwC9eX8b?=
 =?us-ascii?Q?+fhAPtq4mUvU/iEazEV5Xr4PXK43Yuo4Ame3JX5bkQO+3pDPpVaG4/2QJrT9?=
 =?us-ascii?Q?JYTfCjsAmqstSejRJoivqZafs08+b2yP1Ry9zlOTmdspkTc5BeuNtYbcN2Xy?=
 =?us-ascii?Q?sA5xDAZFSLUMd5ReqY4IbyEmGSHvajNwnYarSMQzFc0qoBUVYfC+w72/xLnN?=
 =?us-ascii?Q?wi/6AcShjTjtY3UpvRIMbthT4SR5tf0IH+0WEd0+h3Sj0+oZRDIWvLPTksII?=
 =?us-ascii?Q?2RIVeeiPQJR725L9gKOS9CJQcbgQ5hYyhPdNnwtpPadsQ4F0RhRA34bTnIs4?=
 =?us-ascii?Q?kLnzPSkJMQSk9vFh1f3dNRS37WZFA4iB2/zOE2u06DI53ZkB+KDvpEKGQb+4?=
 =?us-ascii?Q?TYA64TuVlQH4lggu/d408iQ7Szpwd3XHsvFe8eZQDTBXtLqLdQKw0V4nT8HV?=
 =?us-ascii?Q?74GFrKic5KBaa9MStyQlXOJ5kiuZa6SVWgrHZU2Qb65a9/JOYJnPBy77o0eU?=
 =?us-ascii?Q?01FImBM2FaFGfEdGpq9gebvu4S063qGVTqlRreL4UtefHVUXuMBVwhGwzB13?=
 =?us-ascii?Q?Mz1ct6ovYv+SaSOL+XbOAbJ65cMfcdO/YqNDhTgJr/02VykrpijhZ+gAJGa+?=
 =?us-ascii?Q?Zwl8Wj93SC8q9ErmFG0QvGkAbJIKj8lGIaq5rt8yO1msbnYY4Q6uCqJhu/ld?=
 =?us-ascii?Q?iKNl1IOzge1Ai1mD5AN8sbXfG7iBrUGmpB4AxAMbq6MOIpqi0085xaPK3Bh5?=
 =?us-ascii?Q?UQEnU0lo5tk6JZYA4T3gYg32FQZ1xw6q036KdggVwVM+HTibrzZ6OJkjZwfK?=
 =?us-ascii?Q?qexBMuYggVdRACCJ9B8ZSKVfYa6pmDmKtV2iwPOhZ/13qjYRmQN2BQ7ZYhIc?=
 =?us-ascii?Q?kxtyNghqdpx4Zl3wX/uNLtf3jzAq6PVwYVqM9tjEQO4o+4/y0TMeCdJCwBnb?=
 =?us-ascii?Q?N8IqLI7lGjDIvF0bpJEjzyBzaOz54vpwcuO/48eyGdJGZoH/YEi2?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12f96afe-c480-4a3a-ae56-08def1c10dfe
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 00:41:00.0132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v1qohuyL+TsQrxIibGZ3yO68lTKyt4KOdMvLSvV1pId2bCn4GFtrgElzTiNkYi9TxxrwtJ5WsjOqe+qdCdJZ8pzMBQ7C3UeUNEbfIKeh/qvd+YUsK1oeUHAzMLdwI06e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOPR01MB12264

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

