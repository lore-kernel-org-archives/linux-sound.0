Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011052.outbound.protection.outlook.com [40.107.74.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4B41CD2C
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 00:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786063996; cv=fail; b=huwf550fgB1Y6BZurqpbP9ICCPI9TXE1m/EsKeyJDz+/53uoVH4qUD7X3voQzpt4BqQLp9dy8BNNa/y2elUOsnHkvVuDOxFgGkqPWW5RczML+iwrpaqVLmu6+HiOw2j1ikp4/ji3PIcLZPaVEsBV0nJnFT3cGeP8lQRySo3Rsdw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786063996; c=relaxed/simple;
	bh=+K6vdmmaXNP7JlYCyHMJhjyM5G0FiHmfmmsWjoJ8xjc=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=tIHcbEPu4AbV4HDWtKTC68/UnJ0x6tVqG/g/5xepX+ZC01vuT4XAoXqtu8CnsGtk0INCGdAYx6fEWEjWL8l1O1PnziYqzmLlopYWpYTGi9kyvwPG6FXXIxoCY8z6zGQhj4svMgrheb4d85CDmIn1quZqBsX+L4SnPmsre0nuaUk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=H/+s6c4c; arc=fail smtp.client-ip=40.107.74.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="H/+s6c4c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g/MgKOC9mgJR+JfZE4TgizfA1H67tQ6tIStJeqkpaqGnyKDqgXa/BUzIJzLbrxqZYqOzGCpHHg5rGJPcdjxMV6b7/ys7aXwzJkFJd748F6vmvSXr1ZbtT0OEmqXUrhZQ1mv4ZgWKFEbTrApheRJTtn7DA0qbeyEdAne375P/dH9sb3rkmQ/Q74pHMPTQ6K/Ck6ihZaeRw15xWyTpULxVgsUqC7rWrhQv8CoMjQFXPDPZJ66t6o9QjRjBDBaelUqM/C8HCFtyRsj9C1T7Arstke1Wskn4GDfwR/cR2wNnwrr3qae1JSYQadscDmA0ARa+R3OBFXBJyF/G/FGLexsw2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H+mSa5E9X6Q1BN29PZNcdNl+dlZfJwWKIFf9nd2l55I=;
 b=aq3TD++hwdMXhM/EpIvgDQUXFpJ7InTB/naOfcTisIkJCjhBGdlpQK7h7zHBYVxEAAraz11dyfU9I/15rLIIk1iBfWs6tXhrcdob+0vk3oucUYx86Fuhb808VCPzuX+rHtSWCMbmIMWdyPNVa7hMf/CQooZ+jr7ctQ0fqKn+OtJtKt4foa9lXvRon5hOZSQDGgcrBAD5OR8StDurgHMoeWFuqHZpUTbGcafWSPFsI0JRUouf2oFQplIaufl5Ucol6bJjriRQZ9mNwtK6Yx9A/7ZTn88nyznrpQvF4DKISePDqIyYv1uL7PKb3Jc4U3JddkQ+A05qoP2z5Y4U16wRyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H+mSa5E9X6Q1BN29PZNcdNl+dlZfJwWKIFf9nd2l55I=;
 b=H/+s6c4cFfA8oT8x3jl4xPhvWAcerXJUVPK2ukGLh9TTLPER39+33bPQ6Wwklo6dXf0S3C2ppTQtIXCkwNn2pQElngOO0rHu0PqMBCNZ9utBckkifBTbGmkxRBE0+m/gZE8qkHqYtqPkRLiSMy0W0zJzXhj9RcOCY8tWYeQsmeo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYTPR01MB11044.jpnprd01.prod.outlook.com (2603:1096:400:3a1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 00:53:12 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 00:53:11 +0000
Message-ID: <871pcavjig.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Lars-Peter Clausen <lars@metafoo.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 =?ISO-8859-1?Q?=22Nuno_S=C3=A1=22?= <nuno.sa@analog.com>, Takashi Iwai
 <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH v2 04/44] ASoC: codecs: adau*: use .auto_selectable_formats
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
In-Reply-To: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
References: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 7 Aug 2026 00:53:11 +0000
X-ClientProxiedBy: TY4P286CA0140.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37f::7) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYTPR01MB11044:EE_
X-MS-Office365-Filtering-Correlation-Id: 04d2dd5b-4c79-4c6f-516d-08def41e4168
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|23010399003|376014|1800799024|366016|38350700014|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Y0veqkWozAMid84dfFwi4GJVL7Nn/j1+m2rk7DrdFMD2dsvTjlJM/LVC5VjChZBX3MSybXk2deXmDKoGm7vTjHmHjp4a5KBNEQFtNX1o0109x/hID++xPev1afYMbbsXbdtbOFd/f1WTyTIkclwPV8F+Dj31G3VnJYw6EF46ds1BVl8LA3AGrXuKfwh520nZ0+WRL1/OYQLQXakwHAB31sKI0naQUDk4nW7eM0F0jkh8GJNkNUW+v1mkw5HEtCvB7MWDcraNkhg5EXYPn9Y1VBZF1HNYgacdvP3/WRgkU3yaHN/r6+DScldSX/WMZzJpR3xyUr8xIFk1GzRg7Lg7uYGZ/wiZlvPs7oJ4ltF1y6miJUy5E7jK/4FVfO01egaU2uvVCt5I9gGMPrYxFQOVaFmfsi00qaZhlTTqk+mu1MMaLzJVre1Sq5wRzv3E5TizxGt6UTvUa1JPoMT4jL65pCsxElvaOrVJws9Q3RJ1SelmxwXKa9memcjW5Uv2XsqCrd8Vo2o+3eLciHmIoiQ78bxf1A2idWvX6sD7O3kXZPPhD3uW6K1xSokjdoeKAonHPPAX5Z5Cd+m5N8BnFl6SrjvvfiSc2SGSpQqGC1mVjCsuTCyvtuUtlyL41VVJW/r9qox6Hl1/d6ZgrkBZWlC+iJ8lq2jEalWXQZrSbSJtCdKXRUk0vadP59PjUGjzKxESKI4YFm+4nGt7HysvTPinQkZx02PGNysBrNJKSjayFu0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(23010399003)(376014)(1800799024)(366016)(38350700014)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IzL0l3k+/PiWPtUDjHjZZi6HfmTxwcF2ZZ4dM8hDHEvrrQorsNH3hhmLIaPk?=
 =?us-ascii?Q?9dq/I4buGzsxFRZ6M674g4H8cHj/Kudp8YGsvlkGfEz7ufRfAyTxUeSMkj7k?=
 =?us-ascii?Q?I8AnyOsst0xzB918vQz/w4GmPeM4WuM+prwxllWcRgxBLGg3kOW50K6KBaiv?=
 =?us-ascii?Q?6KP0Z4nAofGOVKCaxObAWJSvddp2c18bFQ0RLKvHbZuDz9GPS/ioA2OcKder?=
 =?us-ascii?Q?SK8a8odihFTVqLyjTRrY9aolbbx7oZryuc6yVD4JcF6lWxqw2cv0947Bkpes?=
 =?us-ascii?Q?b3TOaaF7XZOhMeud7hWz72aG32r7ym943cXlt0W1WDIGlY0MQFfUicDnrI6A?=
 =?us-ascii?Q?Qz58GpQdaUZcih5VpYDow2OqB3I6dD/p6BKy9sqfjWCrLubC9v4qmdNVIcNw?=
 =?us-ascii?Q?eBFDp/U1GOo6tAc3yIrEGXdHsM5lSF5LnPIXn5zB/E+YCc+kgBRVkbkjfc6i?=
 =?us-ascii?Q?BBjLNrM487fAtoOQQeaNEwuAChOBYHCxpOOpIxQPSk150AWGCBGsXmYy/m8S?=
 =?us-ascii?Q?N0UYxoEvSS1RDyB7ovhUUyWyHx6puBlR3zpBp7PYF26CCsZWTenZUfNXesco?=
 =?us-ascii?Q?E5twhqe0UAwW5kGO7ZTkJPvP9ZgBkYXkzZcIR5RLrsBvX3AdbUolPOviqQsS?=
 =?us-ascii?Q?SRnF0Dt+711HrI4habj5xtO+gyNqif1cVMkbQDrITHHAUUvT2Jk8kaqFx/5s?=
 =?us-ascii?Q?WQAG/ktzmMdrujqFewP5dKF4sSZRyXiIV1csqwpTSj3F2qlDvEM/2XX8bnoJ?=
 =?us-ascii?Q?2NG3T4UDfxV2QDhpj7Z8VEuEwmzJazu1emJSsOHapBGgtNV2nFjELmE1R2ju?=
 =?us-ascii?Q?YyaTZinNm8IhCPNdJWt4mmsR+bUunbp0WLPaiRp0CF8o5QYM0N2gyQCwuh3t?=
 =?us-ascii?Q?8UncYyV3RovaHMQWf3PlYNg90vOMdya0d8l2lF+rOOwVmTGsUqU5RM/a+/UA?=
 =?us-ascii?Q?SUtumAxrOv0kbTKRGGXMzY22N1YalX0SkGbX4Xag+Pa1wHh2X3BplZa9eO6c?=
 =?us-ascii?Q?i/YsHkt4VxVmBmrsdas/w28FbrFAO0yUz+ZlH6jPjG8XmOK9p/j3gFmkEkXJ?=
 =?us-ascii?Q?h9qwL3UllqR+/rWs1NsOOvfW9JvOgJ/8OFVlMsplvEUliMyybDpODJlLZfB3?=
 =?us-ascii?Q?kVEEnWl0YmNHhsUtefcz7Wg741gR+SLv2CYP6D4dbr92dVwwDvOOTDnN37Ub?=
 =?us-ascii?Q?ulVugfCFS1NkP2tElUhcPi1rHF0W206Gbrz8pVRwaeN5icQe3c4t6ZjwvRit?=
 =?us-ascii?Q?I2xUM0Dw6UTCbKchRfZz5oXlDWNOXBmihXiJrpHJsyMd9wk4k8QsJ4jDgZ4y?=
 =?us-ascii?Q?sZoJYc7CTWimtTr5nCLclhSrS4yWRSuXVcAjuSQEW/kuDfaaTJgZrhvajjdr?=
 =?us-ascii?Q?+gkUprnUcaPvMn4TNEt+RztDn9oTcl7LYq4hVRnFh0Hx3Fx/ImCmxeLY/Jj0?=
 =?us-ascii?Q?eTz7J1BKxaGQNqPqfl/ONwMOngJcWnmJ45pHf5+F+jLErL6/0W+drWB1x0mr?=
 =?us-ascii?Q?jKOZbj/Vj5uli8iHr3WgNvzr6I7zTRt0wQGvipJIf/OZcK4REMqINGQLBkCQ?=
 =?us-ascii?Q?OPwe7/7CDFBDAh5YzW5ZvFfwHJy5pIDz+c4NihgneO6pvT2TUkiuY9kp7Ojw?=
 =?us-ascii?Q?Xb1bXnTC2QvynmWVH6tm+BptJf9KvqwtR3D6lPU9rkX9GDK+I/Yn8SLxiF6u?=
 =?us-ascii?Q?WVhUGxdcJjvy45wHLtbuAZnXZtnJONn9gKlGQ7IpQSi5lLUcbXz0jJWkzBk5?=
 =?us-ascii?Q?pCWpPgDk0+ZAaSJvdc8iU79sjtkSrEo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04d2dd5b-4c79-4c6f-516d-08def41e4168
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 00:53:11.8543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SDL0AH31ZR+dHvJsDBoPdZMvy6xb4K5oGBl9zJIrymz2c/NFUP6cDwnKye/oJzhtlvCwDT/yA0nM5wn9rnX1h0JxtExJWaFg+uX12I04VjqNET44o2DRnzSkDuyTEduR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYTPR01MB11044

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

