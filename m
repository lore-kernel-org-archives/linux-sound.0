Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011013.outbound.protection.outlook.com [40.107.74.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE33C37F8B6
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 00:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785804117; cv=fail; b=npkIoIf7LZ2a4svoJOjwN77a8pJRcyrtwpU8sCbMJY/Jo97LJT0Syz8vYMz7WSFAAGeqrQMAJxnH4Ixe6uLZxYrYSoDlsnu2M6BVUcZOS8dXJv0Vw2Qi3F8BOGw5bKTX5s5VUX5BzfmGq3M1Z/UvoIvj5eqXfNcny52COPo0+qQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785804117; c=relaxed/simple;
	bh=/q9kmsc4X56tmKxT0uz/wf7YCmVWeO0D8McPL3lsgEw=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=tXLnYRe8YHf3R/mgwx9uj46R3CgDyJDTe0So9dGZzWc7bzFjmB9VZflpzJSQ5e50ivu4bvPqSqK84J1kttS4PW56EW++l5GF/i+jRN7pg0t/eR4aqL3u8Ai59680WdKxfWMk5zwb9CLMoYMLEeWkniG1QTLMBK99nsvt35pJlB4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Xugdyqif; arc=fail smtp.client-ip=40.107.74.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Xugdyqif"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tj30n0zM2FZdU55omi7RTIQpA8Li4eWMPVboWWFU1tGCgIqcTJ81IH5F1S3k88VAfFG3Hjlp0aN+hxoWf9ZKFF3rjo1mmbK/r9f6OhfgyvTgik2M3maYULKSu6J0UzBW5D+P8t8mk6DSSEFQOjKp43uFucmzYRYNz/u3X2PPkzm0o92NqbBQrguGqKL82BoECEFxFHf0ak2rBam68/kUeTJxfPqXBjWizID1tw1zcAOM+4xSKK+A+rJ2ppbkWQdZncqmYg7FDzL2uQaQNe33E9UAWqSuEOWRNBB1fPznhsZQzFy9nOy79yxUqnQi+T9Yu4cwvHf5wWSxIgD4lPvXug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9krpdSrBAHnHBPS6QxrDLkRL6yExh0V/doJYueRXW8Y=;
 b=fldxRQ68fo5uIByaWagrsYKA/T9z6eMa7AxiXzSdFRZh2ebk+gsJDU+z/hmKGmYPijpxRNAK1Eppi7OmPJQhUqt8C6DbhbZz2HQGFjrmSHWUeL5qQ9TiovW1B86ITw5IEk0n4s0o85p/22arxCKpxAE/2DEvvyjxxs0jf+rW9PrS4uFxHPPozUdpi3OyDVU3K48NglYmhUiVSrt27kBhMdF8Ur13w9CHUs28FqsMpQ9ZzIIv2tGc6vrGNFFUdgQ9qSeHg+9Yr+Hi4fDD2VOJzuyrxy98r1JKZ4PveGjstH+ZcaG2A3nkhI6QVX+WPyR0aH6DRt4cJFmbrZZreL4brw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9krpdSrBAHnHBPS6QxrDLkRL6yExh0V/doJYueRXW8Y=;
 b=Xugdyqif0AQpgGyKM2Jgqr4HmLFmRB/2pUB8dHaRXlNGL8JHnCRiJNY8zJ5rRJ51K6liD1cdjLzH3COsbEf0GvHQWEiuaUadzOdCPSXwx5khdeRZMZB89I7zlaxOwY8CfXpGs7ZmoaV5Dz29IJ3PCaHxJwBG7m0KdKNs4BLlEms=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYRPR01MB15651.jpnprd01.prod.outlook.com (2603:1096:405:285::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 00:41:53 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 00:41:53 +0000
Message-ID: <87o6fiwwbz.wl-kuninori.morimoto.gx@renesas.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>, bui duc phuc <phucduc.bui@gmail.com>, Hsieh Hung-En <hungen3108@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, Zhang Yi <zhangyi@everest-semi.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 17/44] ASoC: codecs: es*: use .auto_selectable_formats
In-Reply-To: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
References: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 4 Aug 2026 00:41:53 +0000
X-ClientProxiedBy: TYCP301CA0051.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::16) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYRPR01MB15651:EE_
X-MS-Office365-Filtering-Correlation-Id: b4f091b7-85cd-4631-f897-08def1c12dd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|38350700014|18002099003|22082099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	fkh7d5mjOgVyRFLVVmfjqKxy82EF5N39rgyXmxWvnXiuNDN+ju62Y3XXrJj6v2GY3n3TNM7NOpm3lQQcXXEMu+KufQ+je6An5y+aE5tl+sORgjGUohtYGBSBOFtl7DSCAQuApM2Pn8I/9CPudZft0lGcctt6lkxtFsN4YulJ4ejzaicsLP1mnL6G4dmWYYPEhMqce1QD05ZJzlbgHtFOFiP9kJlarmcL2cTgtHT4xW43K37WtNid9nhCAyQ1CEm9yhp+Nv5d7iuBzFSQdH1catbWF6Az/N35IvsFN8o+6Gfj3+CwJOcdNn16TB7EG/xLNPGavuC+3swUsun4poAEuOM0PpMQEtO1tN2EhdtB2gJY11v95pzg2Zf/i7kzkSrzeVhIhP2/DAif0UmpDGsK66Zq7ft2D3xOAnJzPtUU16Fvcxa1la0ISxAMjkXUh3h054KD509rntIzuz4k8CFsm3KobvrEaZMgWGdbFgcyKXBHHSNt19NIrhPZnCeLgLf+ZD1uP5ygNKMmWJkldFJofsklTso474hBMCbcp+uGhdFGhXwFl6EZpUll46X/wVyKOxZnqvLQvYSo3L+pATEz4UJJiSUfs6YWslDrdAPOYVU/GxRfNXTSwCDhNAA06wCAdwGWBozhja/c6m/DpGyTgOC7him70s4NCsmBVFq3Ka/hMY/DUcUAmIZmScT+WvPJXpyE0j04caokQjGQVinQLiG8LePgq3MA6hCv+iy5Y7U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(38350700014)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hY9CXxK0HO+/jUN2IhqSQo6iLuIYBXuJRknStS4ec9k8XwoVhGpsHXlFNj3O?=
 =?us-ascii?Q?228FtYfqWP8R9Th50lTkITRMB4bGAlkgjVRp5Spa6RbCvm0xvsGNtZfu/U2V?=
 =?us-ascii?Q?hYajXkxvmLV2Y4jmSvq44Pck+1znsIRSsYj4aHpd+W9ru6YgSHT/2UPxyjS4?=
 =?us-ascii?Q?S9wu4nnD4T2gEo8EUOH3CgO8M9IItnhWJeGIRZELVx5P4BAj1JheQsFbq7IC?=
 =?us-ascii?Q?uZp6f8o29w2m59ImpPlcU/uBXo/nz0sLfYh4dPMM7kCmJXlR2uzlJ4QlnUPV?=
 =?us-ascii?Q?ogxeSwyPP8B/mX8glfSb0wkkFZduhjBVG75KoERYM43ZajhQbMLDXoPx+u5t?=
 =?us-ascii?Q?8O5jCZX5wfF99kd2Lc53VjvxyMT8H8TZ3aKMeGF1kE+Yhueqm8MXnkpmytwd?=
 =?us-ascii?Q?h+SjUH/z9JVLAZ7wdS9/15NcRJXfrqQkhwJO+FFp5YfxulXRbaJo9hycGfaa?=
 =?us-ascii?Q?au7+OP9LZapAXHDm7m505g2bSGvZ3d1XKZKO6huUeZ2yONJ8NIbyzNwRdsAM?=
 =?us-ascii?Q?wnzBdky5Hf5hfPtw4W0Ukgx3/bbLlm5IFWwNIQalmlPJmjTMmz+9KofaMVeg?=
 =?us-ascii?Q?1htEN5p466EXH4+uXIBX0ViYseEhEO0gyPEMq0Lg/tjq12qEO8m2j1BtfOGN?=
 =?us-ascii?Q?m7gMWBm7UjiRHboVDR52fXAMzT6Bs0ecQhbUXJC1Hb3nokcyAKUz07GI2KEK?=
 =?us-ascii?Q?XIVXiUK/v2Ee7j8CeWntC4mLNY/yOm0QstxdLNyvlJRFegeQIGGPZ9WkqgG+?=
 =?us-ascii?Q?vBkIcIHmCE/6VAJnB8GCFE8JIPK8SyXpLjgm2YRWCm/aP3CkS3Cdiq3syh2C?=
 =?us-ascii?Q?/dsq8ZzEEky+nRduOGbPolFv2DzgJ0KfGHde7qzfFCly/3oNvlnimj484aBG?=
 =?us-ascii?Q?0hQVt8cFCCTVJ51hvvmDK+bDRsn58KutSNs3A4aTsYBWYhNlzNuQf4rDl4t/?=
 =?us-ascii?Q?47e6Nm1IgDE+Kv0I3QUoat+1AOcZOmadGtGcj7y0nJ44ToYbuEV8VRgkpOx4?=
 =?us-ascii?Q?DqlG6YKHPxLAxLZ2xawr+XmSRekJrt1JqPnJYJpuka2fZN289nOhsRpaBCKc?=
 =?us-ascii?Q?eMeRWNrcv1yycGKFQn8Yl+rlcRBWlWMLxGFSQ6L0EYbW7QKfiFiTZ2XY/pgH?=
 =?us-ascii?Q?lTKM1g4LiRtXSkivPqICMN0xBuP2h5gpa9U1IwbpgNx46uS6g7qv+UZ5SVum?=
 =?us-ascii?Q?QL040lfBlRxYOYrh6g1cyEfTtnwy1EgbEBSxBFuMuqN3K+JabG8yuoorhZMK?=
 =?us-ascii?Q?cpNlkGud1eB3YwNzs5Qh0y/itVrCxLAsPawFfKlE3d3e3acmwm0MqcqiTvQ4?=
 =?us-ascii?Q?JBE+TBO5MECASyiZ2mWjwekATGw9YSM0VECJfVF9/trZEfA2u9odig33cGqx?=
 =?us-ascii?Q?lVEILiF8y/D9daVAAuPITMef2Is9L3d7d5DV1OySFJ/jfZ0oxYaCotd0+Xpg?=
 =?us-ascii?Q?nhcGXZ5DG8o8sCgU2lo64oSXhiX8Rqh9jHWPt5V72FIkaQm0I7miUXCQeW6k?=
 =?us-ascii?Q?kvI8bHI9BL6m8Q7OwIaYTRFJ6+DodsP6pbTlmohOWSLvLF8/5dHfnbDWDOrD?=
 =?us-ascii?Q?wSbXamnJafiKjg8LVWQxW1I8GeabOUGswSeEJIn9lZ2ToPkdJUEdW1P2OtXh?=
 =?us-ascii?Q?QzVY39LYnWnRXNdzE4WMuMTq8ZkCHIzv52UYokOaRMs3f/+XnlETF9ua5Cj/?=
 =?us-ascii?Q?Vn/sWzHY3IaSLqWTa2rrVDDmenaGcGlcfXR//YUgezjB0iGQoRoy6fwX6QEF?=
 =?us-ascii?Q?jYZE9L/rc9WF8ocw3yPHDeJtfwMZoThdayD5dqnIlD/mw1JjTMk0?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4f091b7-85cd-4631-f897-08def1c12dd7
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 00:41:53.4511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rehXDcSNBTVxN8dSSIiFHNPOqCVaW487+9WMM1ZPFHwj3MvK/JgDdRkeiURBQQU9tTUUKkzN+XmbqYdDjQR2oFAYPFFZ6pFm9bvOhEO7fnCunTObm1pAtTANwKVMLlDp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15651

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/es7134.c |  6 ++++++
 sound/soc/codecs/es7241.c |  7 +++++++
 sound/soc/codecs/es8311.c | 18 ++++++++++++++++++
 sound/soc/codecs/es8316.c |  9 +++++++++
 sound/soc/codecs/es8323.c | 13 +++++++++++++
 sound/soc/codecs/es8326.c |  9 +++++++++
 sound/soc/codecs/es8328.c |  7 +++++++
 sound/soc/codecs/es8375.c | 12 ++++++++++++
 sound/soc/codecs/es8389.c |  9 +++++++++
 9 files changed, 90 insertions(+)

diff --git a/sound/soc/codecs/es7134.c b/sound/soc/codecs/es7134.c
index 441df1523f1c9..e3e6142ca0288 100644
--- a/sound/soc/codecs/es7134.c
+++ b/sound/soc/codecs/es7134.c
@@ -130,10 +130,16 @@ static int es7134_component_probe(struct snd_soc_component *c)
 	return 0;
 }
 
+static const u64 es7134_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF;
+
 static const struct snd_soc_dai_ops es7134_dai_ops = {
 	.set_fmt	= es7134_set_fmt,
 	.hw_params	= es7134_hw_params,
 	.set_sysclk	= es7134_set_sysclk,
+	.auto_selectable_formats	= &es7134_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver es7134_dai = {
diff --git a/sound/soc/codecs/es7241.c b/sound/soc/codecs/es7241.c
index 339553cfbb48e..a0bd5386387d4 100644
--- a/sound/soc/codecs/es7241.c
+++ b/sound/soc/codecs/es7241.c
@@ -152,10 +152,17 @@ static int es7241_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	return 0;
 }
 
+static const u64 es7241_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF;
+
 static const struct snd_soc_dai_ops es7241_dai_ops = {
 	.set_fmt	= es7241_set_fmt,
 	.hw_params	= es7241_hw_params,
 	.set_sysclk	= es7241_set_sysclk,
+	.auto_selectable_formats	= &es7241_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver es7241_dai = {
diff --git a/sound/soc/codecs/es8311.c b/sound/soc/codecs/es8311.c
index 6fe3ae41afbd5..69289cb1d3180 100644
--- a/sound/soc/codecs/es8311.c
+++ b/sound/soc/codecs/es8311.c
@@ -800,12 +800,30 @@ static int es8311_set_bias_level(struct snd_soc_component *component,
 	return 0;
 }
 
+static const u64 es8311_selectable_formats[] = {
+	/* Hi Priority */
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF,
+	/* Low Priority */
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF,
+};
+
 static const struct snd_soc_dai_ops es8311_dai_ops = {
 	.startup = es8311_startup,
 	.hw_params = es8311_hw_params,
 	.mute_stream = es8311_mute,
 	.set_sysclk = es8311_set_sysclk,
 	.set_fmt = es8311_set_dai_fmt,
+	.auto_selectable_formats = es8311_selectable_formats,
+	.num_auto_selectable_formats = ARRAY_SIZE(es8311_selectable_formats),
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/es8316.c b/sound/soc/codecs/es8316.c
index 87f331868dc7f..026ac7649efc3 100644
--- a/sound/soc/codecs/es8316.c
+++ b/sound/soc/codecs/es8316.c
@@ -558,12 +558,21 @@ static int es8316_mute(struct snd_soc_dai *dai, int mute, int direction)
 #define ES8316_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 es8316_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops es8316_ops = {
 	.startup = es8316_pcm_startup,
 	.hw_params = es8316_pcm_hw_params,
 	.set_fmt = es8316_set_dai_fmt,
 	.set_sysclk = es8316_set_dai_sysclk,
 	.mute_stream = es8316_mute,
+	.auto_selectable_formats = &es8316_selectable_formats,
+	.num_auto_selectable_formats = 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/es8323.c b/sound/soc/codecs/es8323.c
index b926340256be5..12fcfe017ab2e 100644
--- a/sound/soc/codecs/es8323.c
+++ b/sound/soc/codecs/es8323.c
@@ -622,12 +622,25 @@ static int es8323_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 					     mute ? ES8323_DACCONTROL3_DACMUTE : 0);
 }
 
+static const u64 es8323_selectable_formats =
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
 static const struct snd_soc_dai_ops es8323_ops = {
 	.startup	= es8323_pcm_startup,
 	.hw_params	= es8323_pcm_hw_params,
 	.set_fmt	= es8323_set_dai_fmt,
 	.set_sysclk	= es8323_set_dai_sysclk,
 	.mute_stream	= es8323_mute_stream,
+	.auto_selectable_formats	= &es8323_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 #define ES8323_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index c5460589a88b8..74c0bceb0f9b4 100644
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -723,11 +723,20 @@ static int es8326_set_bias_level(struct snd_soc_component *codec,
 #define es8326_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 	SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 es8326_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
+
 static const struct snd_soc_dai_ops es8326_ops = {
 	.hw_params = es8326_pcm_hw_params,
 	.set_fmt = es8326_set_dai_fmt,
 	.set_sysclk = es8326_set_dai_sysclk,
 	.mute_stream = es8326_mute,
+	.auto_selectable_formats = &es8326_selectable_formats,
+	.num_auto_selectable_formats = 1,
 	.no_capture_mute = 0,
 };
 
diff --git a/sound/soc/codecs/es8328.c b/sound/soc/codecs/es8328.c
index aaa6646ad4c5e..7d52b5d9d0615 100644
--- a/sound/soc/codecs/es8328.c
+++ b/sound/soc/codecs/es8328.c
@@ -727,12 +727,19 @@ static int es8328_set_bias_level(struct snd_soc_component *component,
 	return 0;
 }
 
+static const u64 es8328_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops es8328_dai_ops = {
 	.startup	= es8328_startup,
 	.hw_params	= es8328_hw_params,
 	.mute_stream	= es8328_mute,
 	.set_sysclk	= es8328_set_sysclk,
 	.set_fmt	= es8328_set_dai_fmt,
+	.auto_selectable_formats	= &es8328_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/es8375.c b/sound/soc/codecs/es8375.c
index e8747bc24433f..bc21cf7e602d6 100644
--- a/sound/soc/codecs/es8375.c
+++ b/sound/soc/codecs/es8375.c
@@ -494,11 +494,23 @@ static int es8375_mute(struct snd_soc_dai *dai, int mute, int stream)
 #define es8375_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 		SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 es8375_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops es8375_ops = {
 	.hw_params = es8375_hw_params,
 	.mute_stream = es8375_mute,
 	.set_sysclk = es8375_set_sysclk,
 	.set_fmt = es8375_set_dai_fmt,
+	.auto_selectable_formats = &es8375_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver es8375_dai = {
diff --git a/sound/soc/codecs/es8389.c b/sound/soc/codecs/es8389.c
index 80efce3e0a22a..452e597d81d57 100644
--- a/sound/soc/codecs/es8389.c
+++ b/sound/soc/codecs/es8389.c
@@ -904,6 +904,13 @@ static int es8389_mute(struct snd_soc_dai *dai, int mute, int direction)
 #define es8389_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 		SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 es8389_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
+
 static const struct snd_soc_dai_ops es8389_ops = {
 	.hw_params = es8389_pcm_hw_params,
 	.hw_free = es8389_pcm_hw_free,
@@ -911,6 +918,8 @@ static const struct snd_soc_dai_ops es8389_ops = {
 	.set_sysclk = es8389_set_dai_sysclk,
 	.set_tdm_slot = es8389_set_tdm_slot,
 	.mute_stream = es8389_mute,
+	.auto_selectable_formats = &es8389_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver es8389_dai = {
-- 
2.53.0

