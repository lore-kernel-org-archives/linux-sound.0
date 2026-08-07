Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011031.outbound.protection.outlook.com [40.107.74.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49E625D215
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 00:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786064210; cv=fail; b=UpUyex6Npa9crPdMg4nE+LXQ86D1gJYM4oi71oQacYCMfUZWFPeIStbzWvN4t9Flvss3C/ItKi9H+NcBp9qmg7bx4gx8YnRwH5rkIJFnT769GbkOTBGzGO8XViJQd2cr5V/Sz2jL/hAWch8QZNzTsl7xdJ+M5K8afdsfLQWuQQg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786064210; c=relaxed/simple;
	bh=V3i1IFBnDRufSNFFZn0m7JcchwbQGAo8X4fxxFlhMR4=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=VhQs1OETW1IduZkLih+349nqBYS0ew+eU00ngosaWtDOoruocdfyjCzfOTIcbhnzrqj7MjOHyb2P9Mxsa/rSNV62VFHIsXaUVGNEsUpIjGf08M1pmIVAKQ3TO8CF3yJwL9VLyMJ7CY8vraWH9j+94MmwalYFyhLD9LNsTkL0dK0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=pi0QR3Cp; arc=fail smtp.client-ip=40.107.74.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="pi0QR3Cp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r1OSQrr3Ctnvh1YQgxbP0AF/XHuuvkw/41LsLwxrt+rJv+T8kDarI9GhUcY1TSItTnEjO0zB5uMEO/ZcTQAP7BDV4lxi6yrEs+Al6FnXaa3GP5tsNmgKBLxlSaw7zRyhoE1hylyR9Sgf1D4fJrpHSRTMT5hqL8XjSHwoiBWNKK+PHNRbULF1PKB1xYk8tmwOINs4wRGDWRzrdluwraqLtUjV7wjnxeLMmccKiOP7sQ8k7gB7We43W4kn+U4P2bhLRh+dRJot2Arxk+COxdpUSLDLSx7Ryk/GWgjXRTY+CRVb59bGwGAUr/6WT4pnUXo1k3OZG1WxpPBv/fRmUXFvtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uKIdWIpVKi9oLn+9cjgJ1IjPA7d0MXGIcRDQA25sOWY=;
 b=SvRLmCyQ6x72kkrFBEGOdMLXb9q2/P1Rgc/Jxt8rmStVu2gpHkTvijfWRwtjOG+ohPa/mcuEcb7O0U4YSB57YAh5AeNiBioYbXfWoSzg2j+ion0pjLFloXB7OuhoHviIZSFlW40YwLo6JKupvHvhEgaQ1wWzjxFa6IGbyGti9EPek7FLwXMTigwtO1U4J/KhNdqTceLngCs+xWMOv6r5cWXsHNqWEhdVXoHcXbSswFyuSszWORZpTRSlg6DhAP2MZ5XWCEuc5tW7NXb7agPw6j5ruv0NuThah40RkzMkObfclCgsLWhxN2rVE0AnZfI4zBSVsa/IKxFdB3Yhw8Y87Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uKIdWIpVKi9oLn+9cjgJ1IjPA7d0MXGIcRDQA25sOWY=;
 b=pi0QR3CpYWGYkqYDQK0TOBM4T9WNtEhqpW7h7jeE+0VgZN9cbnKXk4i9u2oC/vElyxT6OIWk1TgbuXmBXXb2mr0Qa0XM3xaDjL6Gq9FOYwxckmq6LVj5pOZpem0wD/0JwHSbLj3Rcmkq273iHuPBx5j+t4XvLWFDW0+TflMdAFU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS7PR01MB14460.jpnprd01.prod.outlook.com (2603:1096:604:38d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 00:55:42 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 00:55:41 +0000
Message-ID: <875x1mu4tv.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Jaroslav Kysela
 <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, =?ISO-8859-1?Q?=22Uw?=
 =?ISO-8859-1?Q?e_Kleine-K=C3=B6nig_=28The_Capable_Hub=29=22?=
 <u.kleine-koenig@baylibre.com>
Cc: linux-sound@vger.kernel.org, =?ISO-8859-1?Q?=22Uwe_Kleine-K=C3=B6nig_?=
 =?ISO-8859-1?Q?=28The_Capable_Hub=29=22?= <u.kleine-koenig@baylibre.com>
Subject: [PATCH v2 26/44] ASoC: codecs: nau*: use .auto_selectable_formats
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
In-Reply-To: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
References: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 7 Aug 2026 00:55:40 +0000
X-ClientProxiedBy: TYCP286CA0008.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::15) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS7PR01MB14460:EE_
X-MS-Office365-Filtering-Correlation-Id: b0122175-d078-47f5-c90d-08def41e9a4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|366016|1800799024|376014|11063799006|56012099006|10067099003|6133799003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	P0tIfyMnwugWkz0P7vpePD2SHTrW3xNU3TWXpt1s7Zn2JjoXfgjrb9MGeK41uqds0Jnsd5KgMOQ4naRpTNCOBzOuZ7SYrUIMtZzVCC+WUL/sY9zuIAt4ZFqJPqpXBY0DABUJB6AgrkzDxgg3t8670ecEQmP7lZe+h+POi2gRwYaQcAEulgjY9V6ncg6JwWwxiTUMkNieYglvAtxfx1O87X+NMLnYPNeavvNiK2pSoCdJxNgcBBV4OSeEUTsXSF/zY3AQYmrUFkYTxyu/08DXzZDgqzhzpVEeulqo9I6BbS3aAmaLuqMfjIFHWHhyeCFh+e2lwrcRD33r0CalDl+LK/nUeHsABPV7vrQcCqX8LJxXoV01YqaZy9XXmYZN2eiRmICvdFG3s/htp4YJjd1YNcg5bSArkd6tBoluqIx/3iD16pTyvxn+YWZQf5Q+0EJehs3Gwe5iFc11quxdtIBbqiMP41Kw4TxaNqXyrSWkjmDqHprexOd+ljVmMCl2cUIDaicoZhC8p2SzmViD+BCsvH+KuMVnL6y6AY5ng0wVn5wiuLgTi8K6iS1bTDyPGQuxY18o+/Tw+QF2T63/uFnOigj/ePzOkqFC6T6ugEqlD4J9Rr6wONOJtN8pRQP97xN40C/p/YR46xipT4mBr8oji2mVyAJIjFk9wV3aLFr3c268kP4674NsnsdbioDrJ/3h2Gfz6EHQmn+KuF6IZl6yzDbQO6Pv6NK/T7zt4fCJkEw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(366016)(1800799024)(376014)(11063799006)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9F2GGWsK+qiCfc1SrgsCi4mz5oKN2GRAVTVBuzAU8R2U20ai4xtWBEDcsEY/?=
 =?us-ascii?Q?DDNzPahmlPAItfx0HjTWMs8AeZpm1cUFqo6zc55ZwFAZRfMHioMEhRRXeHNF?=
 =?us-ascii?Q?VjaKNVDJWKmtRjwusr2UcW1wdt373bLM2K/b+994u55kHR+MaeXbseWMeEbU?=
 =?us-ascii?Q?B9riL+csZbaJ+MnkD2yyzg4x1M2c6ft03FNn0MTY9n/+mQAWgccPKsmVXEBO?=
 =?us-ascii?Q?alhht9AYBT2piiSnIeJTOZ7SWjOf1QO5scPv731fPcfqKT75/b9kC7uFi4cy?=
 =?us-ascii?Q?oq8d6UP8Vf1o/KTrTS5jXdGxDXHSaZDWz5mmlTCPnY3x86Mqew7/D1QTmwW2?=
 =?us-ascii?Q?O+BY+E4T9msFEHQQnFBowUo0MuyvglDqoTchx9kuBTZbxpBSiemcfHoxeGii?=
 =?us-ascii?Q?4RcdbFnS1SW4ES8Juaefs3CcV+JW1BbKvJ10cZC3OJ1VPEPXfbIS7Umbxw7T?=
 =?us-ascii?Q?c6+abKRkDZBBdzwj+Fk5LXmZo39Un8LUrb2IWmziSmfOP5q5BX2cekMijzti?=
 =?us-ascii?Q?8wJTjyuntVIwT2KBmWZdFfN9kqjoV8eVdzCyOM8XxDXhpR7E34sXyilo0eU+?=
 =?us-ascii?Q?K/2ekeK42NSuzj9RlNusF4kTjniF9Ruh4nuqE+zIl+AopRmlii0Zzhn+j0Ag?=
 =?us-ascii?Q?7Vt7FbMGmWULFWJk2HTrOEjwq6Ffq35ABcBaS3n5savLawruKVhgX32Y5hVb?=
 =?us-ascii?Q?QJYN9Lj0cOhPBewmtXXebOICnICuTfDfpG+Hfq4cZM4BP3Gh9KqO2lD+1gkL?=
 =?us-ascii?Q?LMnzWzgUB+ph51yAKgo40AWyPKaXFWZ0040lkG5YO9AvxF8uwgromz5oOXTj?=
 =?us-ascii?Q?oFQEHoROTkE0vj+5vtpTyFOxuU725FTKl1H+mH5Ma6MY2T4/kObmmdXUSMd9?=
 =?us-ascii?Q?tt4aUUuoyE6mCCPwHnMm1TwF8P/wd0WOGgZJ4J4zqMe75rJQcSFfDPa9N7TF?=
 =?us-ascii?Q?8W6KqemHwDK3ow9r/gwVuuMg35fUzmqQT4nhtilpiFI5wH68qe0jdUpVSYp9?=
 =?us-ascii?Q?MASEnsWdVnQ8n+doXSDqL1Du6ONYiRJrG3/CHFm+Eh9VZvywZVOisIRkun9C?=
 =?us-ascii?Q?t4EPpriawbB9GZtZV/Cgdx0dUZbxKuqp/ISdT2f8w/BYzf7duQkCzfOQtQ+B?=
 =?us-ascii?Q?PhtbdlMk4azIFhEGdrkxEbg/KofjMuaaqNr378MPJPkIMv+Eg+JFA6TwRXZh?=
 =?us-ascii?Q?PbeO31UWyIXf/+qO2T6dNakaW83hmc7Cgxlh2c6JDP3SIegZtguFUafxMXy0?=
 =?us-ascii?Q?hJcG/QmDGqF050XuDMLhVVkesvq4k1W+xVXG0MnTLqS/KutW1zjT550qq4wX?=
 =?us-ascii?Q?BdIhfB9Yz1qxAAytue/6vBVXc3Wkn+9rgUNlMxvbWz2owcH9WDAqnMRG8cff?=
 =?us-ascii?Q?V48P4wAQ/HZ667YLt9vhhuxeZQGA32A7DZuk2j4Zsx0SJ85yOL4CnarUP4Wm?=
 =?us-ascii?Q?pWSArKJ6VijDpZmTz016JezejJxJAY7xCG2GSJYQDwP62Cnt+0W+I7B2ttTN?=
 =?us-ascii?Q?APd4tuESsqN772kBr2KMOKP+E8zfdUHBeJQycq3LDJWn1Wn6nwGOifkATUy+?=
 =?us-ascii?Q?hJVSQLi3wRSEy5+lDgFDSw0aIFXKHRm3PsjNxCyyMEEo4V9Rzz0OBJPhQFkI?=
 =?us-ascii?Q?zY5bPwDelJhxpAwG5Ph9j7mo9RfiiFsso0ng3hTYTBYdSm3xzO21ly0CQbHa?=
 =?us-ascii?Q?qvvFdCopwvmMda2Tj7i/mpRKczIWg9ofloZoW2AB25af6y0FWOu5yTnOEpu5?=
 =?us-ascii?Q?1R0svTlWiBDXG2OESJIwSPfBL915QQc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0122175-d078-47f5-c90d-08def41e9a4e
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 00:55:40.9368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mnY5d+pQj5BMkvMda7JTUp8a8LKJ9UYvP4TFNug84svy8D51q4XrmDRF4cA0T/88pJVnE18AvUZKNbYziThlthazisqj/PmdsoIlKlVzLrqiwaHflVsIRGciys+I4nLF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14460

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/nau8325.c | 11 +++++++++++
 sound/soc/codecs/nau8540.c | 11 +++++++++++
 sound/soc/codecs/nau8810.c | 12 ++++++++++++
 sound/soc/codecs/nau8821.c | 11 +++++++++++
 sound/soc/codecs/nau8822.c | 12 ++++++++++++
 sound/soc/codecs/nau8824.c | 11 +++++++++++
 sound/soc/codecs/nau8825.c | 11 +++++++++++
 7 files changed, 79 insertions(+)

diff --git a/sound/soc/codecs/nau8325.c b/sound/soc/codecs/nau8325.c
index 236d94c29c249..2c95ed00a681f 100644
--- a/sound/soc/codecs/nau8325.c
+++ b/sound/soc/codecs/nau8325.c
@@ -628,10 +628,21 @@ static const struct snd_soc_component_driver nau8325_component_driver = {
 	.num_dapm_routes = ARRAY_SIZE(nau8325_dapm_routes),
 };
 
+static const u64 nau8325_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops nau8325_dai_ops = {
 	.startup = nau8325_dai_startup,
 	.hw_params = nau8325_hw_params,
 	.set_fmt = nau8325_set_fmt,
+	.auto_selectable_formats = &nau8325_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 #define NAU8325_RATES SNDRV_PCM_RATE_8000_96000
diff --git a/sound/soc/codecs/nau8540.c b/sound/soc/codecs/nau8540.c
index fefbd5722c004..a939f4b7bb250 100644
--- a/sound/soc/codecs/nau8540.c
+++ b/sound/soc/codecs/nau8540.c
@@ -623,12 +623,23 @@ static int nau8540_dai_trigger(struct snd_pcm_substream *substream,
 	return ret;
 }
 
+static const u64 nau8540_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops nau8540_dai_ops = {
 	.startup = nau8540_dai_startup,
 	.hw_params = nau8540_hw_params,
 	.set_fmt = nau8540_set_fmt,
 	.set_tdm_slot = nau8540_set_tdm_slot,
 	.trigger = nau8540_dai_trigger,
+	.auto_selectable_formats = &nau8540_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 #define NAU8540_RATES SNDRV_PCM_RATE_8000_48000
diff --git a/sound/soc/codecs/nau8810.c b/sound/soc/codecs/nau8810.c
index a050387dd485f..eb3e93380678c 100644
--- a/sound/soc/codecs/nau8810.c
+++ b/sound/soc/codecs/nau8810.c
@@ -817,11 +817,23 @@ static int nau8810_set_bias_level(struct snd_soc_component *component,
 #define NAU8810_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 	SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 nau8810_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops nau8810_ops = {
 	.hw_params = nau8810_pcm_hw_params,
 	.set_fmt = nau8810_set_dai_fmt,
 	.set_sysclk = nau8810_set_sysclk,
 	.set_pll = nau8810_set_pll,
+	.auto_selectable_formats = &nau8810_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver nau8810_dai = {
diff --git a/sound/soc/codecs/nau8821.c b/sound/soc/codecs/nau8821.c
index c45c5b864ea4b..ecadbaee10379 100644
--- a/sound/soc/codecs/nau8821.c
+++ b/sound/soc/codecs/nau8821.c
@@ -981,11 +981,22 @@ static int nau8821_digital_mute(struct snd_soc_dai *dai, int mute,
 		NAU8821_R31_MUTE_CTRL, NAU8821_DAC_SOFT_MUTE, val);
 }
 
+static const u64 nau8821_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops nau8821_dai_ops = {
 	.startup = nau8821_dai_startup,
 	.hw_params = nau8821_hw_params,
 	.set_fmt = nau8821_set_dai_fmt,
 	.mute_stream = nau8821_digital_mute,
+	.auto_selectable_formats = &nau8821_selectable_formats,
+	.num_auto_selectable_formats = 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/nau8822.c b/sound/soc/codecs/nau8822.c
index 830164e991a79..20913d9f7be97 100644
--- a/sound/soc/codecs/nau8822.c
+++ b/sound/soc/codecs/nau8822.c
@@ -1026,12 +1026,24 @@ static int nau8822_set_bias_level(struct snd_soc_component *component,
 #define NAU8822_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 	SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 nau8822_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops nau8822_dai_ops = {
 	.hw_params	= nau8822_hw_params,
 	.mute_stream	= nau8822_mute,
 	.set_fmt	= nau8822_set_dai_fmt,
 	.set_sysclk	= nau8822_set_dai_sysclk,
 	.set_pll	= nau8822_set_pll,
+	.auto_selectable_formats	= &nau8822_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/nau8824.c b/sound/soc/codecs/nau8824.c
index 426a488ff2a34..853eb9472af92 100644
--- a/sound/soc/codecs/nau8824.c
+++ b/sound/soc/codecs/nau8824.c
@@ -1580,11 +1580,22 @@ static const struct snd_soc_component_driver nau8824_component_driver = {
 	.endianness		= 1,
 };
 
+static const u64 nau8824_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops nau8824_dai_ops = {
 	.startup = nau8824_dai_startup,
 	.hw_params = nau8824_hw_params,
 	.set_fmt = nau8824_set_fmt,
 	.set_tdm_slot = nau8824_set_tdm_slot,
+	.auto_selectable_formats = &nau8824_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 #define NAU8824_RATES SNDRV_PCM_RATE_8000_192000
diff --git a/sound/soc/codecs/nau8825.c b/sound/soc/codecs/nau8825.c
index ae83b778bf935..5165aeba4b675 100644
--- a/sound/soc/codecs/nau8825.c
+++ b/sound/soc/codecs/nau8825.c
@@ -1507,11 +1507,22 @@ static int nau8825_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
 	return 0;
 }
 
+static const u64 nau8825_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops nau8825_dai_ops = {
 	.startup	= nau8825_dai_startup,
 	.hw_params	= nau8825_hw_params,
 	.set_fmt	= nau8825_set_dai_fmt,
 	.set_tdm_slot	= nau8825_set_tdm_slot,
+	.auto_selectable_formats	= &nau8825_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 #define NAU8825_RATES	SNDRV_PCM_RATE_8000_192000
-- 
2.53.0

