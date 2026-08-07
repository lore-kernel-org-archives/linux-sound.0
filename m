Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011064.outbound.protection.outlook.com [40.107.74.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63161CD2C
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 00:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786064063; cv=fail; b=ja87AVcaNiZaWfuTwWDd+CCDO08JlX7hrJVI0ttL+EEFwhRTnODSjQFzs+AYcjAPN4e05Eh0rUMzh/hPmwNGaCbylc/CRMSTwQbg1ab+VZjsMPFWBNjTbyNyYu0ycXuoD6STSpdP9Rp+/gjkbpzAU4ljm4lEMG7I8/qI2drfp88=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786064063; c=relaxed/simple;
	bh=lG43ea8WzMv8/grjILphyu2QfWIwv1Vv1uL7xG4hSRw=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=TGnbbvMcENxkAt4LRjXBica5zMrtJ+IIR1l32sPZZhHn84ah0Y2PNFKvnwC02t62jd4WH1xsQedzRwJZNANnho6FvBx3t5hBLoJlLvN+Xt/7tk4eFAfZ2R24xmYFORl4In0xL+6BI8zrS6zpM8mDXR8POBOD+lsTmAateCnpFdA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=EQNoqVKX; arc=fail smtp.client-ip=40.107.74.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="EQNoqVKX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G1VTzSONcJQMNXa714ElR5GxCMRsJlMikjiMAaCeB7wXScGlPl/WGjzY6eKP99aomrP3XtjhkKWBsjQO7FbfzAJ41X8a05w0l65M1S9Z/1ftPAhLf+W9OaXdzQIWMn28dHl+mU52Amu6DJHcyoU9FhopvVeiuQPYCuqqr+og4CmsZyEUyr4+nOJidEYwBuue+0KeVveyGcpQCd0hICO86rFFstLsALzgzYz9k7e5U0Ygs8v9aakMEFSChQ0zwcr2OHhtIqOt5D7+AkQB6y0/3pTJY81wuUBiX16rD3coTkPfaVdNjySUjy/qa1VTsidoRKBNTm8sF8vKi//TWpFtkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qKmDDiMIM9FE4bLAeHZP5aL52kA+QZcdw+tKu0tBIkU=;
 b=ZASy1I2nzyNjc1C/bmJB0oz/wpjFda6x8dZnNtg32HwXmiUjjmVfAxRW+5CailPjun1dlir0yAvGWrs1SEMCWpXnIoqsmKxzRhWsv/T52WWAZtKDGYIfjt8D/QCVeN+isCMae2sjeLVvMkY9ooMVUawluzGC3S3mtCqpvruF7tPnTK/OL/qaLPj8JI5HKMOc/6Z6tqzuLzFjBO/Ow3yl7ntZ7dC2Ck/A8k/MpDxuYy5dsyvQNGW/wptEttyKa1SuRAOn4o0zJPpkNEvf5NuIpET8RhwjdpIEysaKKWyJbW0haRkjNoxNvQO66avln7bFamF7JXefApR+nRMNJri7fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qKmDDiMIM9FE4bLAeHZP5aL52kA+QZcdw+tKu0tBIkU=;
 b=EQNoqVKXAeTv//97016i2ACQK+/suzIuuOQ3yt+cpnWbCr9TjyMVkRR/F4UVOPzqhlEk9ilfmWDWFoZU3y8aK8fxw+odurFMEsa62/ROhDvRNQtz1cedhFucczsWuD5v64qcIhUD13VnaxTE/wG51fORwV7MGoLeZaz5RzOyNY0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYTPR01MB11044.jpnprd01.prod.outlook.com (2603:1096:400:3a1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 00:54:19 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 00:54:19 +0000
Message-ID: <87o6feu4w4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Ben Bright <ben.bright@cirrus.com>, David Rhodes
 <david.rhodes@cirrus.com>, Fred Treven <fred.treven@cirrus.com>, James
 Ogletree <jogletre@opensource.cirrus.com>, Jaroslav Kysela
 <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, =?ISO-8859-1?Q?=22Martin_Povi=C5=A1er=22?=
 <povik+lin@cutebit.org>, Richard Fitzgerald <rf@opensource.cirrus.com>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH v2 13/44] ASoC: codecs: cs42*: use .auto_selectable_formats
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
In-Reply-To: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
References: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 7 Aug 2026 00:54:19 +0000
X-ClientProxiedBy: TYCP286CA0366.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::6) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYTPR01MB11044:EE_
X-MS-Office365-Filtering-Correlation-Id: 623174e3-091b-484f-3201-08def41e69bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|23010399003|376014|7416014|1800799024|366016|921020|38350700014|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	1dimKPYT96fChVdVqhPiX8mADZ27w6SjWF509YuX3DxiPbxFbuUahCQT7RJ68SDL7ruMy8hyZ6FmNFLxUN/bpsCqByBNyIh8S/oCpdHjvSlOvBrZvTxazB3kmuJt6BHz3hmFEWjTBGr/l01RDmZ68NDU8mW8zVlSn0NmsJO4g9tekpTn5x/blCI89nOaaZQvPnizDuc4JQe2799CnCqxtHCzRNY1m1Hz+eyL021Jn2etLloUVTRhKd5zOcyUPEGc1Rd6LQ6N/x64wqCUoCFhaB0G2EzpPqD/3aB64Azst8dhznlIF/PDbL1E/cZzRZjHRLi8JiHESib1bdYwiwQg/bBnN7f70qCDwWksVPrv/Wer0cR5WJ+WG+ArwHQAhiCr2bTSuROaCk2YVhq4fwU2fUz3RzAernSVzV9Kg1mbA2BjOROTNFcpbK3n6QvClqvy9RJ7JexrNR8Gum3IFvaSubFjJzREE0RXdZdIYdqv+62EaM8Lpy/fEplrSYz5G4oGkMMhJVbleHcf7iNDDqY7VaBSSRItahTSRja3Gf0CBLLEysxGTunHFKd3vj+Lau/BBn8IaiKtFuKKrF9GSV8/ytPWd6WI1W9JA2HhELXyV347Zn2BYaMH+z7Li3V728mDWP5Bk5NXniaPnNGtLbEr69eYVE8hUk48PIjcEEM9SxyeX/nIlwhJfeH2pufpG2q2D1iD/2R2WIvBBtjjAqsJvIGHjOYJYpEOr0bRIS3R9Wk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(23010399003)(376014)(7416014)(1800799024)(366016)(921020)(38350700014)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Vy0n2eRH37DhjXZDrJ2qJOLlR+m3CpzbyeZf104yPtGPtIJORyP2RiInPCjC?=
 =?us-ascii?Q?orFRzOV/sqelk+a9Pf30ZTZZCqUn0M8bZWj3uuDKJsIVUeB0FS+8HZStBuEE?=
 =?us-ascii?Q?jhj+0cMR8xK1Rz4Z2Ah2RyZaAoCdZe31HOXgmVXlhGI/4FxcDXphVqYEbwnM?=
 =?us-ascii?Q?eBMwnZPDucSwtUvuFLHijx3v2MFMYn22EsycEV+LGmQT1P0QiVRATlg+lDGd?=
 =?us-ascii?Q?SJ4d8zHkyOZeXELrH8Yg4nMFP/w9K1gEYhIR3P7O3uQtTrVO19UmqLBtvAEx?=
 =?us-ascii?Q?TgZE9XSChrTk12lNPAer+M+vRhGx50r1FtNZUnUr3g8EL7nmhfA2cFIGwtMw?=
 =?us-ascii?Q?WRHWY1kF4lLS6sYpeKxKhIti8MRWBbUZ5kDnZEkm79jEMtDgtsFL3OIksulE?=
 =?us-ascii?Q?L4bSKatpy4at+i70BLjm1XK6DGXNIffmP9PgG/bSTD6icoz4eMhJhS14o5YH?=
 =?us-ascii?Q?Yz3llA4Fln0JIzJPaIdt8Z8c8MKQiTAbGQKeMWHzKgGB4gTiafpMyLTZd9GC?=
 =?us-ascii?Q?A20tQcBo5uVpKG0qGWEjXfLfVIMCWREmHpDpBgw7a/Nk8yUKcw2ZJQrFLHdy?=
 =?us-ascii?Q?zWCinHk3qr+M8tU0VmlinUR9pMeoZPWRrBY5CPx/NWvvMBLCnOjn63PT0z3Z?=
 =?us-ascii?Q?6GOBPj6vC/MB5jphbxoPuiSQCuUBU+WNvhclWN7ywRozCzLesU2hxmL/ha2R?=
 =?us-ascii?Q?trHQhTi1fDkBL0o+T098gWgpKqrYZlvV6cATwmHIy1yH2NCFlhIj4JSMBgo0?=
 =?us-ascii?Q?xxhubGhiX4VGwzjFTynADs1cbO7EPywdmamkI/kpjZCPbpQ04Upk6G3RXLeJ?=
 =?us-ascii?Q?9IwctpkhlTRw/HGsS28ptByLHo3sizIL4FlKVuUDXyRz6eSChxzLObb6N0sQ?=
 =?us-ascii?Q?PkoOekNTnjr1OfppJtUygbNr5aap2Mgtk6F3wUz1Kqf2pjn3lV7WJeOyckpg?=
 =?us-ascii?Q?HdMxHDNVHIyYiqlz1ApE0uCEAhEyhWC3AIhJhlchFpaHsWNvbXjIcsR1z+t2?=
 =?us-ascii?Q?0HqJh39/cg0Eemx+vMPsTrfZJkKBQ1csY6vRwXqAnBwcx52ltv8H3/FeEL8/?=
 =?us-ascii?Q?WgcrRdqp579xScD5MnZs/g7fjrtMbAUSLimMsSiaGuBCP/++eBRopzhPCC0/?=
 =?us-ascii?Q?7vPwDoXOGGSwDQ9d9042JL/UYt8qg7DHRRPDY22iIkd4xFeTQ6y8TSXknYH4?=
 =?us-ascii?Q?cjSj1p6pDxdlGzC0cD2dyXrqBCMQ/nhpwhO81ZT04BgRalKmWMHONfJ0P6za?=
 =?us-ascii?Q?/IojAdbkoQlZJk7cK7+ndLc5jDUuJWAIQeghAZsa6BivE7MfVWWlMpEYnVGa?=
 =?us-ascii?Q?8pomt5uRM4KAT51rvQJ7mjQhVgVcTSnpqmNz7DM8ulpHbyfRdYYWnd0o3r3M?=
 =?us-ascii?Q?blk7+eZsvSS2iPIldpK/BjzWg0skaiJaouWIgO9VNsmpp3Q+l1a5axRsOSre?=
 =?us-ascii?Q?f5/jqdCDFYVHAl/2onzcbnao98bKz67oAorwrGO+IKcYS0ieeI3pzMhAshWW?=
 =?us-ascii?Q?AXTuVPBON1VZznrNQscX/OOUaJTsrFA2nsEMk0yN4HQejLJfvMhxWIpDIigp?=
 =?us-ascii?Q?HTGUJotYO3xXUFw+nOf2v/iMEi6ilClujzqty7XaAbdf5NDCYGHIyJVmy+ul?=
 =?us-ascii?Q?PqDsfTw/NFF1ZncjQjsXIbNI5TIRaon9OHm1G6FXkhgwP2rFUn6+JqhxnoHV?=
 =?us-ascii?Q?/sGyZOVkZ2QNutrXnKMGoa3zCMR7n/A7w8giwHnzeY56jDhhh4tW7fps50gv?=
 =?us-ascii?Q?0pBYZpwbkQQPimt3a72YPT6zXAHyPajEL6nDEQZf1L1Fj3avLWEK?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 623174e3-091b-484f-3201-08def41e69bc
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 00:54:19.4747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /xHd0TNTY7qbyMtaTvFCjyio0uOlStUCmCvyCOL/eRVQqWOeTlDtyN/KbJgDubQc7tczrgAD62v6EGTQJTePNezYJ5bd6zJTlbNmxbOmunD8z05gv+T4nI3dSA0mS96r
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYTPR01MB11044

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/cs40l50-codec.c |  9 +++++++++
 sound/soc/codecs/cs4234.c        |  9 +++++++++
 sound/soc/codecs/cs4265.c        | 12 ++++++++++++
 sound/soc/codecs/cs4270.c        |  6 ++++++
 sound/soc/codecs/cs4271.c        |  6 ++++++
 sound/soc/codecs/cs42l42.c       |  9 +++++++++
 sound/soc/codecs/cs42l43.c       | 12 ++++++++++++
 sound/soc/codecs/cs42l51.c       |  7 +++++++
 sound/soc/codecs/cs42l52.c       | 13 +++++++++++++
 sound/soc/codecs/cs42l56.c       |  8 ++++++++
 sound/soc/codecs/cs42l73.c       |  7 +++++++
 sound/soc/codecs/cs42l84.c       |  6 ++++++
 sound/soc/codecs/cs42xx8.c       |  8 ++++++++
 sound/soc/codecs/cs43130.c       | 14 ++++++++++++++
 sound/soc/codecs/cs4341.c        |  8 ++++++++
 sound/soc/codecs/cs4349.c        | 12 ++++++++++++
 sound/soc/codecs/cs48l32.c       | 16 ++++++++++++++++
 17 files changed, 162 insertions(+)

diff --git a/sound/soc/codecs/cs40l50-codec.c b/sound/soc/codecs/cs40l50-codec.c
index 6763671630676..698aa59194f4b 100644
--- a/sound/soc/codecs/cs40l50-codec.c
+++ b/sound/soc/codecs/cs40l50-codec.c
@@ -233,10 +233,19 @@ static int cs40l50_set_dai_bclk_ratio(struct snd_soc_dai *dai, unsigned int rati
 	return 0;
 }
 
+static const u64 cs40l50_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops cs40l50_dai_ops = {
 	.set_fmt = cs40l50_set_dai_fmt,
 	.set_bclk_ratio = cs40l50_set_dai_bclk_ratio,
 	.hw_params = cs40l50_hw_params,
+	.auto_selectable_formats = &cs40l50_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver cs40l50_dai[] = {
diff --git a/sound/soc/codecs/cs4234.c b/sound/soc/codecs/cs4234.c
index a889fbd519a86..a6ead1ee37081 100644
--- a/sound/soc/codecs/cs4234.c
+++ b/sound/soc/codecs/cs4234.c
@@ -560,11 +560,20 @@ static int cs4234_dai_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask
 	return 0;
 }
 
+static const u64 cs4234_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops cs4234_dai_ops = {
 	.set_fmt	= cs4234_dai_set_fmt,
 	.hw_params	= cs4234_dai_hw_params,
 	.startup	= cs4234_dai_startup,
 	.set_tdm_slot	= cs4234_dai_set_tdm_slot,
+	.auto_selectable_formats	= &cs4234_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver cs4234_dai[] = {
diff --git a/sound/soc/codecs/cs4265.c b/sound/soc/codecs/cs4265.c
index 286d5ca298541..3f8bd8348db41 100644
--- a/sound/soc/codecs/cs4265.c
+++ b/sound/soc/codecs/cs4265.c
@@ -495,11 +495,23 @@ static int cs4265_set_bias_level(struct snd_soc_component *component,
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_U24_LE | \
 			SNDRV_PCM_FMTBIT_S32_LE | SNDRV_PCM_FMTBIT_U32_LE)
 
+/*
+ * NOTE
+ *
+ * auto_select doesn't include _RIGHT_J, because capture can't use it
+ * (= cs4265_pcm_hw_params()). It can be selected via Card directly if needed.
+ */
+static const u64 cs4265_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops cs4265_ops = {
 	.hw_params	= cs4265_pcm_hw_params,
 	.mute_stream	= cs4265_mute,
 	.set_fmt	= cs4265_set_fmt,
 	.set_sysclk	= cs4265_set_sysclk,
+	.auto_selectable_formats	= &cs4265_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/cs4270.c b/sound/soc/codecs/cs4270.c
index 47b2f903a32c4..aa3bbb9519451 100644
--- a/sound/soc/codecs/cs4270.c
+++ b/sound/soc/codecs/cs4270.c
@@ -456,11 +456,17 @@ static const struct snd_kcontrol_new cs4270_snd_controls[] = {
 		snd_soc_get_volsw, cs4270_soc_put_mute),
 };
 
+static const u64 cs4270_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops cs4270_dai_ops = {
 	.hw_params	= cs4270_hw_params,
 	.set_sysclk	= cs4270_set_dai_sysclk,
 	.set_fmt	= cs4270_set_dai_fmt,
 	.mute_stream	= cs4270_dai_mute,
+	.auto_selectable_formats	= &cs4270_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/cs4271.c b/sound/soc/codecs/cs4271.c
index d8cdd37e9112b..398d8c24a9ce2 100644
--- a/sound/soc/codecs/cs4271.c
+++ b/sound/soc/codecs/cs4271.c
@@ -455,11 +455,17 @@ static const struct snd_kcontrol_new cs4271_snd_controls[] = {
 		7, 1, 1),
 };
 
+static const u64 cs4271_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops cs4271_dai_ops = {
 	.hw_params	= cs4271_hw_params,
 	.set_sysclk	= cs4271_set_dai_sysclk,
 	.set_fmt	= cs4271_set_dai_fmt,
 	.mute_stream	= cs4271_mute_stream,
+	.auto_selectable_formats	= &cs4271_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver cs4271_dai = {
diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index fadf688606014..9e40c03ada4e8 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -1122,6 +1122,13 @@ EXPORT_SYMBOL_NS_GPL(cs42l42_mute_stream, "SND_SOC_CS42L42_CORE");
 			 SNDRV_PCM_FMTBIT_S24_LE |\
 			 SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 cs42l42_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops cs42l42_ops = {
 	.startup	= cs42l42_dai_startup,
 	.hw_params	= cs42l42_pcm_hw_params,
@@ -1129,6 +1136,8 @@ static const struct snd_soc_dai_ops cs42l42_ops = {
 	.set_sysclk	= cs42l42_set_sysclk,
 	.set_bclk_ratio	= cs42l42_set_bclk_ratio,
 	.mute_stream	= cs42l42_mute_stream,
+	.auto_selectable_formats	= &cs42l42_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 struct snd_soc_dai_driver cs42l42_dai = {
diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index 1b817e1a6ea5e..b6238f89c789c 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -671,6 +671,16 @@ static int cs42l43_dai_remove(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const u64 cs42l43_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops cs42l43_asp_ops = {
 	.probe		= cs42l43_dai_probe,
 	.remove		= cs42l43_dai_remove,
@@ -678,6 +688,8 @@ static const struct snd_soc_dai_ops cs42l43_asp_ops = {
 	.hw_params	= cs42l43_asp_hw_params,
 	.set_fmt	= cs42l43_asp_set_fmt,
 	.set_tdm_slot	= cs42l43_asp_set_tdm_slot,
+	.auto_selectable_formats	= &cs42l43_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static int cs42l43_sdw_hw_params(struct snd_pcm_substream *substream,
diff --git a/sound/soc/codecs/cs42l51.c b/sound/soc/codecs/cs42l51.c
index 0519affe0ed8d..4b964c7133982 100644
--- a/sound/soc/codecs/cs42l51.c
+++ b/sound/soc/codecs/cs42l51.c
@@ -533,11 +533,18 @@ static int cs42l51_of_xlate_dai_id(struct snd_soc_component *component,
 	return 0;
 }
 
+static const u64 cs42l51_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops cs42l51_dai_ops = {
 	.hw_params      = cs42l51_hw_params,
 	.set_sysclk     = cs42l51_set_dai_sysclk,
 	.set_fmt        = cs42l51_set_dai_fmt,
 	.mute_stream    = cs42l51_dai_mute,
+	.auto_selectable_formats	= &cs42l51_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/cs42l52.c b/sound/soc/codecs/cs42l52.c
index 9d6bcfbbf0b20..10760816a5f91 100644
--- a/sound/soc/codecs/cs42l52.c
+++ b/sound/soc/codecs/cs42l52.c
@@ -883,11 +883,24 @@ static int cs42l52_set_bias_level(struct snd_soc_component *component,
 			SNDRV_PCM_FMTBIT_S20_3LE | SNDRV_PCM_FMTBIT_U20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_U24_LE)
 
+static const u64 cs42l52_selectable_formats =
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
 static const struct snd_soc_dai_ops cs42l52_ops = {
 	.hw_params	= cs42l52_pcm_hw_params,
 	.mute_stream	= cs42l52_mute,
 	.set_fmt	= cs42l52_set_fmt,
 	.set_sysclk	= cs42l52_set_sysclk,
+	.auto_selectable_formats	= &cs42l52_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/cs42l56.c b/sound/soc/codecs/cs42l56.c
index 4d9a22a1029c6..9c6448ebb2cf3 100644
--- a/sound/soc/codecs/cs42l56.c
+++ b/sound/soc/codecs/cs42l56.c
@@ -960,11 +960,19 @@ static int cs42l56_set_bias_level(struct snd_soc_component *component,
 			SNDRV_PCM_FMTBIT_S32_LE)
 
 
+static const u64 cs42l56_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops cs42l56_ops = {
 	.hw_params	= cs42l56_pcm_hw_params,
 	.mute_stream	= cs42l56_mute,
 	.set_fmt	= cs42l56_set_dai_fmt,
 	.set_sysclk	= cs42l56_set_sysclk,
+	.auto_selectable_formats	= &cs42l56_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/cs42l73.c b/sound/soc/codecs/cs42l73.c
index 6ddc6549492af..72076ccf4570e 100644
--- a/sound/soc/codecs/cs42l73.c
+++ b/sound/soc/codecs/cs42l73.c
@@ -1163,12 +1163,19 @@ static int cs42l73_pcm_startup(struct snd_pcm_substream *substream,
 #define CS42L73_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 	SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 cs42l73_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
+
 static const struct snd_soc_dai_ops cs42l73_ops = {
 	.startup = cs42l73_pcm_startup,
 	.hw_params = cs42l73_pcm_hw_params,
 	.set_fmt = cs42l73_set_dai_fmt,
 	.set_sysclk = cs42l73_set_sysclk,
 	.set_tristate = cs42l73_set_tristate,
+	.auto_selectable_formats = &cs42l73_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver cs42l73_dai[] = {
diff --git a/sound/soc/codecs/cs42l84.c b/sound/soc/codecs/cs42l84.c
index 36533a13319d4..b14775eaccf64 100644
--- a/sound/soc/codecs/cs42l84.c
+++ b/sound/soc/codecs/cs42l84.c
@@ -663,11 +663,17 @@ static int cs42l84_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 	return 0;
 }
 
+static const u64 cs42l84_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops cs42l84_ops = {
 	.hw_params	= cs42l84_pcm_hw_params,
 	.set_fmt	= cs42l84_set_dai_fmt,
 	.set_sysclk	= cs42l84_set_sysclk,
 	.mute_stream	= cs42l84_mute_stream,
+	.auto_selectable_formats	= &cs42l84_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 #define CS42L84_FORMATS (SNDRV_PCM_FMTBIT_S16_LE |\
diff --git a/sound/soc/codecs/cs42xx8.c b/sound/soc/codecs/cs42xx8.c
index 5b689549c74ed..fb9f4aff6bd84 100644
--- a/sound/soc/codecs/cs42xx8.c
+++ b/sound/soc/codecs/cs42xx8.c
@@ -393,12 +393,20 @@ static int cs42xx8_mute(struct snd_soc_dai *dai, int mute, int direction)
 	return 0;
 }
 
+static const u64 cs42xx8_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A;
+
 static const struct snd_soc_dai_ops cs42xx8_dai_ops = {
 	.set_fmt	= cs42xx8_set_dai_fmt,
 	.set_sysclk	= cs42xx8_set_dai_sysclk,
 	.hw_params	= cs42xx8_hw_params,
 	.hw_free	= cs42xx8_hw_free,
 	.mute_stream	= cs42xx8_mute,
+	.auto_selectable_formats	= &cs42xx8_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/cs43130.c b/sound/soc/codecs/cs43130.c
index 48d88dad4ceb0..7bbb2e83a1ffc 100644
--- a/sound/soc/codecs/cs43130.c
+++ b/sound/soc/codecs/cs43130.c
@@ -1609,12 +1609,24 @@ static int cs43130_set_sysclk(struct snd_soc_dai *codec_dai,
 	return 0;
 }
 
+static const u64 cs43130_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops cs43130_pcm_ops = {
 	.startup	= cs43130_pcm_startup,
 	.hw_params	= cs43130_hw_params,
 	.hw_free	= cs43130_hw_free,
 	.set_sysclk	= cs43130_set_sysclk,
 	.set_fmt	= cs43130_pcm_set_fmt,
+	.auto_selectable_formats	= &cs43130_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_dai_ops cs43130_dop_ops = {
@@ -1623,6 +1635,8 @@ static const struct snd_soc_dai_ops cs43130_dop_ops = {
 	.hw_free	= cs43130_hw_free,
 	.set_sysclk	= cs43130_set_sysclk,
 	.set_fmt	= cs43130_pcm_set_fmt,
+	.auto_selectable_formats	= &cs43130_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_dai_ops cs43130_dsd_ops = {
diff --git a/sound/soc/codecs/cs4341.c b/sound/soc/codecs/cs4341.c
index a44e6b3c298e7..74544c58a4159 100644
--- a/sound/soc/codecs/cs4341.c
+++ b/sound/soc/codecs/cs4341.c
@@ -171,10 +171,18 @@ static const struct snd_kcontrol_new cs4341_controls[] = {
 	SOC_SINGLE("Popguard Transient Switch", CS4341_REG_MODE2, 1, 1, 0),
 };
 
+static const u64 cs4341_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF;
+
 static const struct snd_soc_dai_ops cs4341_dai_ops = {
 	.set_fmt	= cs4341_set_fmt,
 	.hw_params	= cs4341_hw_params,
 	.mute_stream	= cs4341_mute,
+	.auto_selectable_formats	= &cs4341_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/cs4349.c b/sound/soc/codecs/cs4349.c
index 9a7f701757174..28320951e3090 100644
--- a/sound/soc/codecs/cs4349.c
+++ b/sound/soc/codecs/cs4349.c
@@ -228,10 +228,22 @@ static const struct snd_soc_dapm_route cs4349_routes[] = {
 
 #define CS4349_PCM_RATES SNDRV_PCM_RATE_8000_192000
 
+/*
+ * NOTE
+ *
+ * auto_select doesn't include _RIGHT_J, because 32bit width can't use it
+ * (= cs4349_pcm_hw_params()). It can be selected via Card directly if needed.
+ */
+static const u64 cs4349_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops cs4349_dai_ops = {
 	.hw_params	= cs4349_pcm_hw_params,
 	.set_fmt	= cs4349_set_dai_fmt,
 	.mute_stream	= cs4349_mute,
+	.auto_selectable_formats	= &cs4349_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/cs48l32.c b/sound/soc/codecs/cs48l32.c
index a9967771124e5..7e2bbb828112d 100644
--- a/sound/soc/codecs/cs48l32.c
+++ b/sound/soc/codecs/cs48l32.c
@@ -2361,6 +2361,20 @@ static int cs48l32_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
 	return 0;
 }
 
+/*
+ * NOTE
+ *
+ * auto_select doesn't include _DSP_B / _LEFT_J, because it can't be clock consumer
+ * (= cs48l32_set_fmt()). It can be selected via Card directly if needed.
+ */
+static const u64 cs48l32_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops cs48l32_dai_ops = {
 	.probe = &cs48l32_asp_dai_probe,
 	.startup = &cs48l32_startup,
@@ -2368,6 +2382,8 @@ static const struct snd_soc_dai_ops cs48l32_dai_ops = {
 	.set_tdm_slot = &cs48l32_set_tdm_slot,
 	.hw_params = &cs48l32_hw_params,
 	.set_sysclk = &cs48l32_dai_set_sysclk,
+	.auto_selectable_formats = &cs48l32_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static int cs48l32_sysclk_ev(struct snd_soc_dapm_widget *w,
-- 
2.53.0

