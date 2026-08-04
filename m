Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011070.outbound.protection.outlook.com [40.107.74.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEF13803C5
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 00:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785804078; cv=fail; b=obZLQt3St/z9CdatshSIYTWiaWeY6BXNb2gzAzBECf5YLL3yKQ7/RJ+9AOuhVPLQw05NghnKzropwgi/pTP+iLBhfLpqPCHCR0G8yeJ99XASn8DBKyLUByDhGIk7BjkKDlUioENuvzhPaK3GGFYa9yLi8ZyJX/0VJkjtjtlCDW8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785804078; c=relaxed/simple;
	bh=rBflxS9kV+1PTBdhx0sPi+2GnJuCFXf3hA8FnYzd6bk=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=MzgX/XjUbvXe1KIPKBtHU/SSWMImDV8OPzTe+GA55AAeq3NaJWS5Q5DzSHMlPhpyLZ/cJEFvph76Mtgf0neskc6ButKJXPsMl8tSCCj45IUd9GL9VOXRRS7BY7rfw3+YP12Khm86it1L4qB4KFRpTA3jZ31uIZJtypVGoSwRomo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Z/VkJ5JU; arc=fail smtp.client-ip=40.107.74.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Z/VkJ5JU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GVDx6hHWADfRoGaASU1fvp+EThHdfZrT752tzWi8BU3LY9GFj30PCKmoF9OSyX1r5XFmL8R+H9iZi4T5Yf3FkV4VCIdZ7I+G1L3yMet7VdwhtOWd+8ZzzqQgSU7vWCwaOrLptr6Dbr6uiusVUwoMG6nNxiJSMlxQvbrVnAPT1KddO+4xdUBdJ92+WtMARbstdaItJ/r4PukSXdbOVKi6ZwUwsnkJ/8macgszRXL7/EYSTifc1FNW0IZ1oFY1t+zeKbRPM+8NS6X+OPTfu7pNFRmgY9RmFbUN6fj6JcljNTThm7b5KHdTdUomGRLSkKfKdfTSdT0o/MaK0XjLODXVLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I7Ts44zNdc9hzWUoe9aiNRFCL0M3SnOyj2jyAWiXiUk=;
 b=EXvPbXbn4xgOz8A9ITVwG+Jol7Sa+1pDOXkd27aAS0/7oDkPJtoSWwDKob/wupsGS1Cdc8j+InS3m0MXl+yBZuW4XafQOeoj5882NQrVYNpOcEuDuFKUfy3B30EXF7RWIc/40yuxT0G8QOEgECwFt9vZh13+wgbGVZe3afzuw3l7EPeWru8pBjbbQQwJrkmanqmsFcWX3bxPYg+v0VepDDwhdhNd4aBbQU1oH1PD7pkHpuZswZkcSNOcoATlPmQbe2JqZZj8HGlusVsJvnpiLltw/FC7TO2R7onBLFQm7UGHBmh2SF0FoBswmkzTkQRWNVAZA9n/xhetqvYQTeIYjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I7Ts44zNdc9hzWUoe9aiNRFCL0M3SnOyj2jyAWiXiUk=;
 b=Z/VkJ5JUjAB0IebBK/G5EFEOGoLVKXV0kiOxR+shnYTngbNC1S2jL3no4RItMn8sMAb3+0qq1ob7Qk+PYq4DFe69tg7YvTNeHNMHvQiTvOoiMdFCkp59TaGo7ZZmUMaAEc3g088PRCP5kXE3r8KUuhJ58gyoyV3I6ylt1A8oiUw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSOPR01MB12264.jpnprd01.prod.outlook.com (2603:1096:604:2d9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 00:41:05 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 00:41:04 +0000
Message-ID: <8733wuyaxr.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 07/44] ASoC: codecs: ak5*: use .auto_selectable_formats
In-Reply-To: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
References: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 4 Aug 2026 00:41:04 +0000
X-ClientProxiedBy: TYCP286CA0349.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::18) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSOPR01MB12264:EE_
X-MS-Office365-Filtering-Correlation-Id: b86531a5-fa2c-4285-f267-08def1c110de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|52116014|366016|1800799024|38350700014|11063799006|56012099006|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	mhg/eGJUE+vp8sy5barwaz+8B4eTzXhmFjTFs/j4kTRLYJ7wqRFO6lbg5OP8xyC6olEFG9F0qES0MWe/+Gps0PYqzVkzWG1ji5clFRJzGJTNpSo4TeMhzZKYcoy2IObE18ZgRTtUNktvMFsrYjxt1XVEBgqzDmpLNHDgonhkzxb1NNpsGlHRkb+DYDh3NtjZOW1EUk+2ERWtgQv+oQdJCQTxkPkzpD4CFL2kQ7YmziB96BrZeUF77gFWk9cSg0PZitsvlWpNQWQ2gHFmCSHLaaxK6y7uJbRM0HXzRgh8M53wmf072fb9LWPVIfXvDWQBjHW/C1zpRT+vdnBsfWOnoE23xxrOojQevHHWOr3CaOq8iPR/6eCk7QuzqFgr+Lib7GAUVPJfYC5fjp3i00NxUXxygx4SjVC000hdso7OY0MhCVtHibe9Wnk992VqSBYJNCIkdI7ofTc//zmypjEhX7bzBKcp32ZhanXNfCy5EiE6KfX1CwKDlv1poHusSBWkZ6iq6XntIZmg2QiX/Tku34cmm/LWfLfRtexfk5jv5K8viTF7Dv38xkdcvFW8MWA5QHBhN3d6vv31l/IVQCK4TG/n0LJYMl39TJK7VoXsN9BdpHRtTSX2q/zEBeH46zjiWc5u8LiSYyqhmutNl+MQYK018pagTzarzQ4QkmTxMaJeMluW+4EvFLwLZsVHXELr5dwy93jdWucLT3dNSReWD0vK9LzR2rvRauMvG83bcUU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(366016)(1800799024)(38350700014)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6O8a72FG//+K7ojS8GawLXDJJBiYdclZ90Wx2X3W65CZ/hZFPZRXKMF/8oq4?=
 =?us-ascii?Q?UnQzon314nRJxK1bSVyfjAOpaO2AHVUFq9MUnjci9xALs1mBMFQLXsetxZgS?=
 =?us-ascii?Q?u1UrZOMYP6caBWFNP/M0aCwitgxS2TPIzxUt/WRjTxkN6FIKLNgBAcgJ7uhJ?=
 =?us-ascii?Q?NvCast6P75Y9AIM06dwL9d1k0SCpV2aievPoGULFNXDWYqtPcLNlPhoTvWX+?=
 =?us-ascii?Q?smk6fWANsQWQdwYwjEYD4SDqbbyLzcVc/qN1rJ92Cs48DI42vMEvW7GRb2FD?=
 =?us-ascii?Q?Ua+GOCXYtAzB1w0uGsgcRWFCkxLlCSmTfw8SibD07Zv0h2rx9GgfSe74IkuB?=
 =?us-ascii?Q?MEkXxPmZn+V5OjgsJlVSiWPQue0yuwVXIAgtM69CSIWsVdagdtS37tbpuSgK?=
 =?us-ascii?Q?ljYddFT6cIopTNkjYJPYa/Qj9q4p1jgo9Zb1RTfgnMI9uDVyxt1CeRTbTSWy?=
 =?us-ascii?Q?OkuFJ/5bqmtzsHEpmjUW0OeQ8y5RbebljzplrHHwCnH6yH740mYyQj8/fgOW?=
 =?us-ascii?Q?m1o92cJWUVzxtkGin130mp4L0jdEi/I9MnozMsk4D9NUAxdLyNq0UgWVUtcP?=
 =?us-ascii?Q?PDoK9Q0hRWZIwzQVVgPpl4vBaiboTckz02ezAMEAdFxwm7J+IL9tFf/5cV9x?=
 =?us-ascii?Q?Sq1tnvIGG+C+qv6r2h7oBx+rHiZQ/CbB1TtJNl4Ykmu9tOfArw1y3xqoCB+z?=
 =?us-ascii?Q?Z3LTUIm+0vbYkotRcRPm8JN15ZEIpVBOmfINbjvdliTDEqoOYAox/qsvS+Dv?=
 =?us-ascii?Q?fXh4CWr111E/7dFpLiOJGL5GOoX5sVJBNUvwTzApkRNzdB0EwIB+PzA6D9U0?=
 =?us-ascii?Q?QSpHYE5S7113ADviQc5ae9RR2zW9FSQYg9QIkyq0yWvh0B5ZbJYvZseM8NIw?=
 =?us-ascii?Q?Nlp1485ytlgaTVULy6EYRSn90Oks6GJO9D+EENukbuVpiDevkfL+plrkmBo8?=
 =?us-ascii?Q?DT0SIQGqFWrZ7u1FP0vtr8/GcR17p0s4GDz7ZuFa8Rmho+bre8AgfdQ5eZOm?=
 =?us-ascii?Q?IhNxnLmFssRADz3QRcoeaOK+fX9Bg3Kd9lhoiQe4dL0NLD9oAujfhP2Npu3p?=
 =?us-ascii?Q?QASSSbw0LBJABD5pCIO1M7N9gKc4cdIOI9J0/Aa0VskXQsU78R5UNA3HA0V6?=
 =?us-ascii?Q?m3Op87hiWgH9ldpc8CLBVIqkVqMnxne4rX2Ux0G1TJqLKOxdNewNb9qkZxwH?=
 =?us-ascii?Q?uIqMkNjYZ6oFGstLVYIyZ9vtF9k1OTeTs9BILWivaO2Q5hwVhbTRj1m558iM?=
 =?us-ascii?Q?IVSYFSbVgYzOOzXAc5faglTgOB2pZODPfzkzanV4O+D2aEyTgLpzZVlzYoG2?=
 =?us-ascii?Q?LerzVaZDuLmxpHVbYI3NHYrePykto/FUDonBzqcOU453df/HWNcYo+bK9PEf?=
 =?us-ascii?Q?H472osKVhb0yuMMbzXhdAbJiN+avSpYgDjxfJX/UJqvtqWO8KOSh/mIudmPP?=
 =?us-ascii?Q?kVNYu9yQZ1AKy7NNNkE2vDOMKKg1BEFeOItN4UzwAC4t1kHIfFuFIrZuIstG?=
 =?us-ascii?Q?QKZ+WiTNWeDFnCEDGnzBwI5SJP/caZ7Lu3Dr5f1/W66MRzmUfto4Lf1z/f4a?=
 =?us-ascii?Q?DrGkrk3HtDPAk9H8OZU684KzGV5JJKus32YI+/8hxhPD1EYc+KwRgyJcDLXn?=
 =?us-ascii?Q?6W8VyelodRLczgmYZMrQcuYVYxmOo9C9/EUc/SIsMUOslzkRRrfsgxvEj2HJ?=
 =?us-ascii?Q?SFWWPs7GzRPOZ74FpyDWlxi1vuIvrEzBsMjo8y7u6C4lKyx84ZovIXXZIrSK?=
 =?us-ascii?Q?Tu8JQqewdY7R10yrY/aXb2eafd/XxhSwuCSMVHigpAPlqQdxPdnB?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b86531a5-fa2c-4285-f267-08def1c110de
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 00:41:04.8751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SMOuoMuyd8DOtGB+OmPIbx5cuaoM8p2H6DKPfRIi4ZV6/fg2nHm3zRYh/+8MZDMnYaG/HcUBYr2wzaKkFPGpPoXQeJ/EWk5KLoG+cx5esjdtlbXvQGdWN/Ok0PCmN2fr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOPR01MB12264

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/ak5386.c | 6 ++++++
 sound/soc/codecs/ak5558.c | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/sound/soc/codecs/ak5386.c b/sound/soc/codecs/ak5386.c
index 6525d50b7ab20..933ca90b7e287 100644
--- a/sound/soc/codecs/ak5386.c
+++ b/sound/soc/codecs/ak5386.c
@@ -128,10 +128,16 @@ static int ak5386_hw_free(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static const u64 ak5386_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops ak5386_dai_ops = {
 	.set_fmt	= ak5386_set_dai_fmt,
 	.hw_params	= ak5386_hw_params,
 	.hw_free	= ak5386_hw_free,
+	.auto_selectable_formats	= &ak5386_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver ak5386_dai = {
diff --git a/sound/soc/codecs/ak5558.c b/sound/soc/codecs/ak5558.c
index 691db6565c20d..0c9cdf9a53bb4 100644
--- a/sound/soc/codecs/ak5558.c
+++ b/sound/soc/codecs/ak5558.c
@@ -285,12 +285,19 @@ static int ak5558_startup(struct snd_pcm_substream *substream,
 					  &ak5558_rate_constraints);
 }
 
+static const u64 ak5558_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
+
 static const struct snd_soc_dai_ops ak5558_dai_ops = {
 	.startup        = ak5558_startup,
 	.hw_params	= ak5558_hw_params,
 
 	.set_fmt	= ak5558_set_dai_fmt,
 	.set_tdm_slot   = ak5558_set_tdm_slot,
+	.auto_selectable_formats	= &ak5558_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver ak5558_dai = {
-- 
2.53.0

