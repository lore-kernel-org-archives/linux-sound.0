Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010021.outbound.protection.outlook.com [52.101.228.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16BC02DF128
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 05:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788152823; cv=fail; b=dQyllf6iBktmlmVBY242zVDA+Q/ihSLCE0chIlPijyZ2ZAs+bzc5BH85zyjVqxbGLn4QJXjoXNfcdD3wMAs42eG9Q3z2TD+SKvZdF+2EpKbT+h/L0V3WpZklMxJVs1q2W9PG48HctE8wg9vAiqLuqTpHJV5bnyW+GdMC5vecwao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788152823; c=relaxed/simple;
	bh=+K6vdmmaXNP7JlYCyHMJhjyM5G0FiHmfmmsWjoJ8xjc=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=UE7+rxEei8cRjmGBr17jqVaxiFKhSa6uRcB4Ntfenpdr9WyrDxGk9p+XUXLV40pqtuyMCoX7vI3MYHlbIn8LjlRLADp6XgBSoZ3CVVScHyJOpL7rkOUuYD8SmDVHJtxM4JrmtaQVEROKuRbK/+GU1HJ5plHZsDJ96xf5dd03VxM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=avxsWebH; arc=fail smtp.client-ip=52.101.228.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="avxsWebH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SGLZVnNRHJLjxXFJKz274pxYf8cyGQQFHRPGa6+IQMQOl6bCJWNZkuCmRt+uDEkz/CL2YE6ANlR0o2dzGHFcObbLFXRMrIS+akiP0k3dkO5S20+HGdZGrAIjVsOTmLEGlAuMT+r8r2cRupvgvJIIAaAFkOuxbvChVZIvHwmhlZQXLYi+BC9BTH8ezR/E7E1DSeoO4Ckh53/DV2LLJopgMQGAKbCnshcXbeQwjCaxuRlT/kNUdRASbcaYEwG4swN7n655B+3D4yN+DqTMMD+HdlmLn3WGztJ4/DHkkHe64E6jmNz3eKMXksrHKA6d8k5lMHn+fYTY/L4T6FHeMaNA7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H+mSa5E9X6Q1BN29PZNcdNl+dlZfJwWKIFf9nd2l55I=;
 b=K+zxWMP8x0JIbDX2sULoYcjVtMxg89PR6FhXw8pLqksJFwjqKOkaHATiAnoa9BUZKdui8WdVFX4g7ZpJk7KBgEQkTt/PfX3kt/jkt0Bx93JV6zrotgOhcbL+eBNKFhvSa0Va51vdIKTVJkRQIE9xD7jegVuQLq3wGA+HIW7v9+ySApsbErec96Dcy7YTHOCRysSXR2oeEfINCiFGLRWwAZRt7iErYZ/3iLznYNjky9fAp56ZSeR3l9hYGKpO3ngMJg3EnNqv9VPlCbIl0Ic3x9IE7j1VOYH8XQNI85GsmnnDebs8P7tWEPuL0mlSuFdH+tZ3o3abjBvWsA1TwdOSIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H+mSa5E9X6Q1BN29PZNcdNl+dlZfJwWKIFf9nd2l55I=;
 b=avxsWebHeLY4bD1K+8izJH8gigG4FcH0Sf6nmBojKc9UIxfguRqv5dwD/gQ5RzGSBU1+cZB3sTZZde5XL7Xijrcq7ziy4Xf7VgSOF7yPcScFOjFj77t/XBvZKSQ93ZhcWc1P7/kOSzLfm8fWdyg9ecF8Xh6dniJM14XZpKqTBJY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by OS3PR01MB9785.jpnprd01.prod.outlook.com
 (2603:1096:604:1eb::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 05:07:00 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 05:07:00 +0000
Message-ID: <87jyp6vpxo.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Lars-Peter Clausen <lars@metafoo.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 =?ISO-8859-1?Q?=22Nuno_S=E1=22?= <nuno.sa@analog.com>, Takashi Iwai
 <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 03/39] ASoC: codecs: adau*: use .auto_selectable_formats
In-Reply-To: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
References: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 31 Aug 2026 05:06:59 +0000
X-ClientProxiedBy: TYCP286CA0238.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::11) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|OS3PR01MB9785:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d6faa45-75ff-470c-fb35-08df071db002
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|52116014|18002099003|22082099003|56012099006|11063799006|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	3N6Z01L7CyhfH9ecAuQKv2yWoL7g2W97Q0JnSSGT2LgxIQDe4zmIkJAUOD6KVTay7ys7yW9+Q28FfMhRCXEzTVRQn87Vf+AYkA+6idsW/fFPpL6heOGeTtgbW5AQUfCAwj8lv0hCYwkf4uA0FVs0RA7KYIA7Cs6dXlsu5NiKM7eRzySNqJuNYGZ9jxa2GNDYmZWutiaskuyL86+/TRaCY0aJEbzjKARCzTYEahnqmfCx57KNWMqpbdr7Nn4cScKN/wKTLewOlhkhZQS02UsLW+6NUz2a32sIWDo9zg9ei3C5r1hRKKf6pnSGSPKY/Yh/5e+fC10tU/0uLxu55/xN0XfHnp1vh0Nt3AqaRb9KWdA7omVraQ3t9gEUdkmWpomWyoefHzrBcgwRxGECRGe3HASfthw/622fEAvxpUmtVFL6X00og4mK1tb0+qR8KrchUhcLNeHbBggbwQsXv4Tnavw2W+NnYV5m7ON44rNDp66aWSXtX3SOWprjML0gvcjdW+mYUf89FM05BG0jBPsWzgA9imESCB5nSJESlFBu7Amzr8D4MaSWDc4SLTeqeanHuUdeidJL3YbxxhGXg/o9/fePk6NP4uvzkboUam5GTDZNVFEoVs077TysTviZJ4Fr4gsAd2V7oJU4uba3WOnaXN8om2hQsSZa0pucKQUz3RR/Cb0Lx37dJ8BJGSPhEYxjXo+cTJsKZrlduBxuR+ce8QSN8JKgk+rdXqU0HyUZjsw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(52116014)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GnmPLw1PpoiJmc3b3QWRITqGZeFOUcrGmih23UcH8yHsOSqsQxXzywgjI/Dl?=
 =?us-ascii?Q?C74mcUVtMLHx06F9mja6hdQEtzoACf3nVLO5hfgPDBBkv9R9QtKprPcMKC94?=
 =?us-ascii?Q?EcZ13xNpa0KfHSjLvXQi3YxoUzYVDxUMSCgkbejHUJ/Vb4U7BTc5WxPM/J4r?=
 =?us-ascii?Q?136OQca95qalSit8fvt1fAMhcAsWsTQk4n7yOGHn0x485A2rWDtp/b7Wh60r?=
 =?us-ascii?Q?E9lYYmlCVvaBKVYHkuk4Wd3NMkjM47LNHgVkhv78xDY7gRDtY4kDRcr/ytOV?=
 =?us-ascii?Q?BCRoc7sZtnnODSMUqPdXoEL/N6QS5uXjVR9Jeg/18eFlA6GQrFETK6EWUGKt?=
 =?us-ascii?Q?1FNb9Hm8i+qZ/RHmNSRk5m28MKmXS3DiDPLmHUoLJZxPBmw6yjJBP8h6WdIj?=
 =?us-ascii?Q?E/61oYq3y3neYBn1ZtzfmwA4Rx1btlWT09jsNtCuzDTyLKLPbNZYbgwZ3Qoc?=
 =?us-ascii?Q?XJxFxxS7YFwkJy7zo1NGHWeIpYUdZg9PZpJRKkJUt3GVvHicsmE4v4Wbos7X?=
 =?us-ascii?Q?MxGnImoAc7Wn50jh2795MMaa62VwbVpWqXpMkfPK2/6IhtFaIlg2REMbgfhj?=
 =?us-ascii?Q?HaTRwY6tawDuvzGdy0sBJM3kA7MjcO9U4czlhcvh9VO1z8DGptuHYOJJDgCU?=
 =?us-ascii?Q?lnyqn5/Yhku4Sz5bF0ZDL1u3VMgONbtzEKPUo1CnXNDnEvd8NJ+ex/GB6YgC?=
 =?us-ascii?Q?fp9jfTWwK0nzrT8ZgfkKNBmJlwb6iMDGnIsqDIRH8gCGZDpvBQ2NYhF0A/VK?=
 =?us-ascii?Q?jNwAVgEWnSSMpwucgKfHxlm6HTjsnkP8ULmTTa0e6mBxfoPFJIPej1dx2gCP?=
 =?us-ascii?Q?2XY62eO3CYATG2zLuWy5c1Ov2UT06DCXf9UwrkSQd5r1pK7utQQIz2e8vyEE?=
 =?us-ascii?Q?wQBcy9Eavnbt/M6WKZX912WyfRWD/VCT9S95a8mDnU1QU7yOVGg5fhvdhEGb?=
 =?us-ascii?Q?U2OrSR1LS5HCmuh7bmkoFrSMuC8x4lJytpYUeaaZQ0GDP2DIMwjpFnYB4NGx?=
 =?us-ascii?Q?T0Y1MPFu4VRARdZ/QmScWGPRfGUbrB545STDJMsCTaxxYNjw3NxhpoPWGogG?=
 =?us-ascii?Q?yL5/umtyKAdreuHRDcte6G1dKHOUZZPBAdj2caJlMIKIoACYQLhwvNynAfIf?=
 =?us-ascii?Q?3QcTN9HGmqe7ae1ThdXElNpLfH0AvIpKXmXC3g5LgP/fug/29Bcls4ppouHb?=
 =?us-ascii?Q?Pm9+vH4m849M7ko39jWBXzVbcDPd2kaY8dcxQJM+ZabICWj6KyP9UxMNe427?=
 =?us-ascii?Q?StphCq7ocnfIX73sUWAgDoBnJOEAzBm/PiCw5NCMDVtsf9sbAPCwEhWBqdcs?=
 =?us-ascii?Q?4hyWY/R8inFwFuCHdSo1mV0YSNVkn2Vv7U8MGyV+LeOQbEQdfGQvLa77kC67?=
 =?us-ascii?Q?8km5hvVB/1c0BGw8GSajauU9mVVK+fZYWi0NsVvrnzwKF6qUdrigf07Tdffx?=
 =?us-ascii?Q?AIurtNeDcwL+zj52h+GA0kvdm8+5K5HW650oNjhT4cqgZ5dt393LH4Dgxxs4?=
 =?us-ascii?Q?Xh9/r/fUFJ6onEC6lcyYQf1g3wqORHnu7XuecHDYF0z0EZhhSIIjJe1U2zJV?=
 =?us-ascii?Q?tFs24tI/iyHI7k5hN+S4nu2nHfmtJ8UAnmcLsP9NRcZkDAuOSVFY31SzCxXw?=
 =?us-ascii?Q?fxexbKH1E4r9UWBDliE1lSiQ2ojGOnT5idAd887kBXSxTuVURlDVVTWxK9Bk?=
 =?us-ascii?Q?O96mj9cVY/k7G7G0ciUzcdMoNNd2Ya38l6yXxCamaNf2XpaCachjxZYigNoc?=
 =?us-ascii?Q?Thhe4bGYhyUeefCXhJg2S0j3joGFNvm7EA3pMVvJPyYbB3a883IZ?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d6faa45-75ff-470c-fb35-08df071db002
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 05:07:00.0257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RLjbDbHEsthbIB9iCcYFx2xMB7FjzplqYHSfx6qRkZ5G8BtKCy3rCQZb9AaJxNxPecs8gKBtSEBlLKSWJtg4oHY21N3xQxNzY1UtxIZwHhOogK2iQc4WuOx2z41rV5UU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9785

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/adau1372.c | 12 ++++++++++++
 sound/soc/codecs/adau1373.c | 12 ++++++++++++
 sound/soc/codecs/adau1701.c | 11 +++++++++++
 sound/soc/codecs/adau17x1.c | 13 +++++++++++++
 sound/soc/codecs/adau1977.c | 13 +++++++++++++
 sound/soc/codecs/adau7118.c | 12 ++++++++++++
 6 files changed, 73 insertions(+)

diff --git a/sound/soc/codecs/adau1372.c b/sound/soc/codecs/adau1372.c
index cc174ec3a1f82..0830d7d2dd7c5 100644
--- a/sound/soc/codecs/adau1372.c
+++ b/sound/soc/codecs/adau1372.c
@@ -881,12 +881,24 @@ static const struct snd_soc_component_driver adau1372_driver = {
 	.endianness = 1,
 };
 
+static const u64 adau1372_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops adau1372_dai_ops = {
 	.set_fmt = adau1372_set_dai_fmt,
 	.set_tdm_slot = adau1372_set_tdm_slot,
 	.set_tristate = adau1372_set_tristate,
 	.hw_params = adau1372_hw_params,
 	.startup = adau1372_startup,
+	.auto_selectable_formats = &adau1372_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 #define ADAU1372_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | \
diff --git a/sound/soc/codecs/adau1373.c b/sound/soc/codecs/adau1373.c
index 5dd961b233ce9..aa7d3a4b9f588 100644
--- a/sound/soc/codecs/adau1373.c
+++ b/sound/soc/codecs/adau1373.c
@@ -1196,10 +1196,22 @@ static int adau1373_set_dai_sysclk(struct snd_soc_dai *dai,
 	return 0;
 }
 
+static const u64 adau1373_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops adau1373_dai_ops = {
 	.hw_params	= adau1373_hw_params,
 	.set_sysclk	= adau1373_set_dai_sysclk,
 	.set_fmt	= adau1373_set_dai_fmt,
+	.auto_selectable_formats	= &adau1373_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 #define ADAU1373_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
diff --git a/sound/soc/codecs/adau1701.c b/sound/soc/codecs/adau1701.c
index 329ab01b62c00..505d52c636278 100644
--- a/sound/soc/codecs/adau1701.c
+++ b/sound/soc/codecs/adau1701.c
@@ -627,11 +627,22 @@ static int adau1701_startup(struct snd_pcm_substream *substream,
 #define ADAU1701_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 	SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 adau1701_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops adau1701_dai_ops = {
 	.set_fmt	= adau1701_set_dai_fmt,
 	.hw_params	= adau1701_hw_params,
 	.mute_stream	= adau1701_mute_stream,
 	.startup	= adau1701_startup,
+	.auto_selectable_formats	= &adau1701_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/adau17x1.c b/sound/soc/codecs/adau17x1.c
index 26d7eb437ad18..45ac226b2f1bc 100644
--- a/sound/soc/codecs/adau17x1.c
+++ b/sound/soc/codecs/adau17x1.c
@@ -776,6 +776,17 @@ static int adau17x1_startup(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static const u64 adau17x1_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 const struct snd_soc_dai_ops adau17x1_dai_ops = {
 	.hw_params	= adau17x1_hw_params,
 	.set_sysclk	= adau17x1_set_dai_sysclk,
@@ -783,6 +794,8 @@ const struct snd_soc_dai_ops adau17x1_dai_ops = {
 	.set_pll	= adau17x1_set_dai_pll,
 	.set_tdm_slot	= adau17x1_set_dai_tdm_slot,
 	.startup	= adau17x1_startup,
+	.auto_selectable_formats	= &adau17x1_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 EXPORT_SYMBOL_GPL(adau17x1_dai_ops);
 
diff --git a/sound/soc/codecs/adau1977.c b/sound/soc/codecs/adau1977.c
index b42f35b1a6036..b9d9853934216 100644
--- a/sound/soc/codecs/adau1977.c
+++ b/sound/soc/codecs/adau1977.c
@@ -741,6 +741,17 @@ static int adau1977_set_tristate(struct snd_soc_dai *dai, int tristate)
 		ADAU1977_SAI_OVERTEMP_DRV_HIZ, val);
 }
 
+static const u64 adau1977_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops adau1977_dai_ops = {
 	.startup	= adau1977_startup,
 	.hw_params	= adau1977_hw_params,
@@ -748,6 +759,8 @@ static const struct snd_soc_dai_ops adau1977_dai_ops = {
 	.set_fmt	= adau1977_set_dai_fmt,
 	.set_tdm_slot	= adau1977_set_tdm_slot,
 	.set_tristate	= adau1977_set_tristate,
+	.auto_selectable_formats	= &adau1977_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver adau1977_dai = {
diff --git a/sound/soc/codecs/adau7118.c b/sound/soc/codecs/adau7118.c
index 5ddea63a6612c..9749299bc7f2a 100644
--- a/sound/soc/codecs/adau7118.c
+++ b/sound/soc/codecs/adau7118.c
@@ -418,12 +418,24 @@ static int adau7118_component_probe(struct snd_soc_component *component)
 	return ret;
 }
 
+static const u64 adau7118_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops adau7118_ops = {
 	.hw_params = adau7118_hw_params,
 	.set_channel_map = adau7118_set_channel_map,
 	.set_fmt = adau7118_set_fmt,
 	.set_tdm_slot = adau7118_set_tdm_slot,
 	.set_tristate = adau7118_set_tristate,
+	.auto_selectable_formats = &adau7118_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver adau7118_dai = {
-- 
2.53.0

