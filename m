Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011067.outbound.protection.outlook.com [40.107.74.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2F8248F7C
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 00:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786064164; cv=fail; b=YzFz/VvRIMNaJmsB5jkLl/hKOtMZQOehs6CYmDM2DAByQgSxTi29qyKaPhLi7Fs4k79CaBYN+6DhztygVXLN9QnqL4SlC1yB9HiwKl7bc6zSo8dG2/rjGyCu1OHOqM+thpDVrrA5VWDj6SKWU7sabRyePBJmEgMQsfjWH17nGj0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786064164; c=relaxed/simple;
	bh=88BEofkgh1ur2UTC4YJgUfLPHTwCAJg34ySfKR4exgQ=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=p2jIQ7SSytfx12ntJPCugCkcFr9WU8PL4/2FEKCNc5WHOjU2z0dMah6nlInERMHjAP0XOG1jRGuzCsjj6PTLrqV8Edss+R1n6V4RTWzssTk/noXx1tgX77kzw+LMvCHFKt7mBbdDTILp3bCvgSvWvGle1FPJ5QZpPambmefc5t0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ZRO7l5aF; arc=fail smtp.client-ip=40.107.74.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ZRO7l5aF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PrIgS0NjbWXBa1TNFyU1DTchj/ynjb+ZKSjgNxFmy4EW2oBdFNQtLLPfZ65cE7Efvsoeb38CwW8eS5iVEv/3JFz1NSczMZ1PUBxXxDSM9B39/yThFuNi55UurC/mApQDM4u2pOEXAQVJX7jRWJFQMw3RFKnrxRhtjxZHYx4grSz3TbU9YDFZ5wSY+cIvpNffJ6Ykqmj96sj1p1t4fU3ixwyB0USRUJGjyyHGD3lwhvC+OOZG2PbjU9xC//ujdasd5HMnDXqjvGzUdeLxTHlYv2i2aHnOr8CC2kiyoEXjayCtM4Ueywbvp64P+EgpjK/xhjTUh49UcMWZ7XSiK2/8gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V/Knvuz1AHEPIlnnQuflTVusPuI0bYtPKKjrnz/SLB0=;
 b=p+pxkFc2VM5fIAFinTCS9PKGdnUkETmrxs7cYQNYl/n+LC0QatBblIBtb4db3t/pDaBxP2P63G8hpJUCXLB1mc4TVPNgyYd11t4rVsmtBdj6q8Rtx5X4bc8GuMnE/nLBBTv2+sWm3I0bf7zD/rl9fNPcwSyv0MP5n9F+HYY+Pf6kgTCcrGaC50I9wsmoEFGMH/i1c5EUG5oy1rrvuMo1VzTDaxfbI9a3JKg/0BWbheuAUEWlSBt3pU+IELx73Sr0b3Km0uIFy3tk6ZHKZQHi+I8Dg4YJn9VAOzTxtCQYuCNfOVYeUdtG03M8AGWTx3ICaFTYNsKxNkdjj+nnGi7eMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V/Knvuz1AHEPIlnnQuflTVusPuI0bYtPKKjrnz/SLB0=;
 b=ZRO7l5aF//9Mjnhjq6KacDM7nxUp7NbvND9AI6R5k63HcIFHvxQhB6G5vpQyjRyeukhegvFMN/+PzDOVAtcDPKfnYg3kACoUo8gx646DO1m5zRQO05C7yfyUUovvNsS5eRuOyOhAjVAA7HPkYYxkpehb2EGg57QVlflyOpanSp4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB6638.jpnprd01.prod.outlook.com (2603:1096:400:9b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 00:55:59 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 00:55:59 +0000
Message-ID: <871pcau4td.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Oder Chiou <oder_chiou@realtek.com>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH v2 29/44] ASoC: codecs: rtq912*: use .auto_selectable_formats
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
In-Reply-To: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
References: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 7 Aug 2026 00:55:59 +0000
X-ClientProxiedBy: TY4P286CA0036.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b2::17) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB6638:EE_
X-MS-Office365-Filtering-Correlation-Id: b3ae53e0-1d39-420d-4113-08def41ea533
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|23010399003|366016|1800799024|38350700014|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	3jcZlO5T/I8/OpBm9cq0KFvjh5wgEYwGZVHGTlHinbp/r1gAPQten4C398e9kovZdd2qoXGq4ov4KOj2QZnJHo8j89DbcQKuKbQ7usju7KP6/6zB/R0bQVXjvGbaNnVR9fZL4fuxdswEbbxiHrcXI6dAuTHcdxdizNNTdMlhISVaxMNQQ4Kmg/uOwJtBqfcEGI+txHdZlSQAKMl2kMJZu1PW7s+N7SxdZ99edtojfg9XCR/wj2C4XcrDvy+Y79zFHxBHD/vhPQjJiMV0brsAtQ655m457NNMkslx4ejo90xap2TNn+C7cEEGd/8G4t1HPHZYeuOaZUqZeTuqwPFdcgdkga40uTXfux6jIjisSGZ/6FDtzaF4V1Rak1RMjVB9KL12LviqEL96s+BCXhZrLxmATyULmez22N34SeUvR46Nz3Ooh4MLmbt9/6Irfq0yqkFghZCVHQhbwpmB4iYKe3OMd8VBh9qgDm0KvQh6cR4/P4HKS9kk7w2kXk2W1qy3yV2mxJW1/grxqs34vcy3qFISC3XNJ0rZcLTrQGS23/9u8PKt5jqX61W/onCP2IiENleiVQAxlV3SrWd7C/Luac5bWxYSVxm5K2K/Pp42DziY8/jdtc+nPPfKERMYpgsrjy136lDhVTtMqTLqTwkZSKRLmgtxOIoVvOfO21SIQqmDxXXJ5QXKqzraGUZ25y5cqRhiE0XdArdmsH3/ryAy3K8dDxcfjG7JIHvF6Nc5Ckg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(23010399003)(366016)(1800799024)(38350700014)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ou8ryXNF6RvrsxrV+i+/qDP6dZCgCv5VeUs1puCIqdxn1+xddwgD+aTD8unp?=
 =?us-ascii?Q?o5aL54J7idBU44dzmcmGdIi2bBt2opbdeXhCwlF/nI/dD6c1SZuJHp50hPRY?=
 =?us-ascii?Q?9cyHijVVkzNTHk313X4qDs2P+glR3tcJY9W+Yp3nmH7zaSG/U+rT9+ZLoitX?=
 =?us-ascii?Q?EY8J6zW1He5GHD3dHdF64JJhCxsscbmQsp4D+AzqybBCnVXqC7SRZP6ey3d9?=
 =?us-ascii?Q?1lfR3SMZAM+EBEruXGlybSxvMTZ5jtLrxc7BA3svLnD9SyDUv5xCOddDtbmc?=
 =?us-ascii?Q?3CKjwh9Wu1GLfPqecj8q6znMZxu0ZaaKO6HCdTnxvrfwoPqzS9PzEcSRh5Zn?=
 =?us-ascii?Q?V9hYwmXXN38INLulZyTCKreik2OdYKN2Yvjm5NE1lkGgz5b02VZEIQlf1fAs?=
 =?us-ascii?Q?FDe1DFRUu/q5hGafZUSMc1MSLcBJyggd/2PEOOlqqW1DNYTYD37IjGfycUfr?=
 =?us-ascii?Q?l3qRFN3Vc+c796zlbRwyIWGFDHbFKs6yItD1rKLHyaqWe3Ok/OAzZ2PQEpNj?=
 =?us-ascii?Q?UOpnRWhcgZuZWpyCtqsSJA46p6T4uwg5uhCZqlDgJtQJUTcb2cpXaDIZ0/76?=
 =?us-ascii?Q?tJsAQpB9cCiEsUNZBsy40nRm1wYq/OTKpz/YS/8W6fyW9tRkjoG/Plln5IfO?=
 =?us-ascii?Q?N6p2ZgdZzR9sHVro4MEFZqVHCTxQRIHp4oEl/9xZL4pV7Q9dNdJG9mFsNq2N?=
 =?us-ascii?Q?mQxYnu3p1b00egaVs/QW/dHEXoYQKLeEAWbksnhhpchnXaWBTnt/O8rE2Izq?=
 =?us-ascii?Q?n7FemrpjdQhQYVKtsZEezTKSajpC3vF6ivsX/AdJn43rB8EeO0KXI30xEvVS?=
 =?us-ascii?Q?VzaTyaR1PYRWnRQDG6f3t+t8BDheTvs1gbBi2qGAM//kNUq+YTfyv7LmDhcm?=
 =?us-ascii?Q?/K3iM6LU8fCPs1X7JKTmWihZp9X4aaIxZ0jt3yn9oRKv/MFcNkGqM2gJsCOO?=
 =?us-ascii?Q?8fmnvOSTngvM+S8rpFuRzLXyL9thtqSVQhBzKzgyqdwl8FH92YGFY3WHkslY?=
 =?us-ascii?Q?dXEYR1o0rhOxFg5dPcTKNYjeGsKgjluNpRNp4qbfNXQNzS3vOvMCnYh5WwRI?=
 =?us-ascii?Q?td/vLocric8g8y9Oab2VTLTu/P++9QdmgbVjkNS3QRq0cElgQr/hHnZIl6jV?=
 =?us-ascii?Q?PLARWjjRARB5Ux7FL+MoQigCmIsPOAqpBxKn3vvSU+C7HkJ2dCzKbspGTm/j?=
 =?us-ascii?Q?IW2FwHiNR8U85FhYa9LxTNTJzW5xMpqUE9cAqweOGMFX8O1O53SlW355N4Ff?=
 =?us-ascii?Q?xS4RXr1RLKLrRhDEYgL//VSqE9o5QAUGTIMv6uWHXtrhj5O//3VulOCC8nq5?=
 =?us-ascii?Q?bmnl6hYmCnHrL9wvPGcULDREVrmAbMcwGK1xMB1OAHflLV88JBC6saRNmrXG?=
 =?us-ascii?Q?+WISi5PatZClyeGXkhCkG+ZGKM4LTI4/mH5sTOV3M55BMVbET7XJ0UrFojSB?=
 =?us-ascii?Q?NRc2m5pb/bUI40Ad6xPzkTyJDN5MlNHyvIGJu/l6hd1dL0MuZlJjtN6+ZJDf?=
 =?us-ascii?Q?VU8jVLJVvOxiVzougNIarLR3SKxfupSWEpnwJ0FUb3+Sisf/RcDGTP5T1mWw?=
 =?us-ascii?Q?cm/ZUBuSY/R+y/xGnBObEePCpQlgYgeErckyGbeZTgSxi8ASbKpV6vJISw80?=
 =?us-ascii?Q?VUN10yrdUrTYHmQcn5gugUm3Y4PkWonFjt35bCE6+K/a3eka2scU6wQ73NMV?=
 =?us-ascii?Q?Eh34/0QX6BnuvsWl3bm0BBtdgVHriztXfT325cWSwqZIpPM6HvdtGLLXLJ8w?=
 =?us-ascii?Q?UBS/pYPqX28U5hFxJDipHFchjPo5IV8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3ae53e0-1d39-420d-4113-08def41ea533
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 00:55:59.2210
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ok/Cw5k5RAeKc9fjK7spbOnnO+6K3OYi8D+2GL+AbLIz08U84dzawy2pxnyYOEWM3c1gc77mQSRmvX78LcyitqdyjaCodepR7inoUwZhvd6jikpq0x8iVZLuuZf1JNr6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6638

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/rtq9124.c | 9 +++++++++
 sound/soc/codecs/rtq9128.c | 9 +++++++++
 2 files changed, 18 insertions(+)

diff --git a/sound/soc/codecs/rtq9124.c b/sound/soc/codecs/rtq9124.c
index 2a041894bc0c9..cc1c68752fde4 100644
--- a/sound/soc/codecs/rtq9124.c
+++ b/sound/soc/codecs/rtq9124.c
@@ -286,10 +286,19 @@ static int rtq9124_dai_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static const u64 rtq9124_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
+
 static const struct snd_soc_dai_ops rtq9124_dai_ops = {
 	.set_fmt	= rtq9124_dai_set_format,
 	.set_tdm_slot	= rtq9124_dai_set_tdm_slot,
 	.hw_params	= rtq9124_dai_hw_params,
+	.auto_selectable_formats	= &rtq9124_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver rtq9124_dai_driver = {
diff --git a/sound/soc/codecs/rtq9128.c b/sound/soc/codecs/rtq9128.c
index 573200e5062f5..9567e90c0b62a 100644
--- a/sound/soc/codecs/rtq9128.c
+++ b/sound/soc/codecs/rtq9128.c
@@ -727,11 +727,20 @@ static int rtq9128_dai_mute_stream(struct snd_soc_dai *dai, int mute, int stream
 	return ret < 0 ? ret : 0;
 }
 
+static const u64 rtq9128_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
+
 static const struct snd_soc_dai_ops rtq9128_dai_ops = {
 	.set_fmt = rtq9128_dai_set_fmt,
 	.set_tdm_slot = rtq9128_dai_set_tdm_slot,
 	.hw_params = rtq9128_dai_hw_params,
 	.mute_stream = rtq9128_dai_mute_stream,
+	.auto_selectable_formats	= &rtq9128_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
-- 
2.53.0

