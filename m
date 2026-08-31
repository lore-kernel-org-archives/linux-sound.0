Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010007.outbound.protection.outlook.com [52.101.228.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB583C4555
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 05:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788152953; cv=fail; b=nAo8q8/JGWf82tTfqpb985U0TuPXr1KQNw+FUArQoOy5dffO6W6lVBAJRpeekls1UW/pWB8UNrW0MiiXja5GASqusmypvPcbPCk7yjfjkEEDyEXkw4SD3F9pnDDQqBobFf1ou5a0m+e6dHZv1nQ+RM2dVzeEZPJPJppcG5cD1Lo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788152953; c=relaxed/simple;
	bh=0ErvWMB6PHSPLTWqaWutNespuKHuJEcAINYXUfmw7yY=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=FSZNdC040qSHSQQhPeqkP4cJgEjoNaQ0/H08pNQfpinWH+DO/6N0qH/62cksjD1JHoaYH11DDZ90pc3zQLvlCnepgr94sXwILixYxxZ0RvK/kjXblgxvWH3BOSxgbA1KrZ8V6d2r0o500GDcRkHzRUDCZXkfXV4FZBXHBlB2X3k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=bj1rJky8; arc=fail smtp.client-ip=52.101.228.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="bj1rJky8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J1LDdtkB96s7jsqtZ5+SBV5RxokBHoOJ5U7rK/2EbjF7eaKq+Mp8bfskrBbGSKt6y+v6Jh0AchwdhJaYMMGlp/PlMnSSN764TZMujKUUsSl1ATB59UdpQs8B2wkvIqwI9msKtnev7zYktsEl7X9oZsefa3JKDXdFbTcHJ+s4UKTqi+/GTHXXiE8v4tQUg5DPZfYhAPxFhHSrBztDOzwHcqW20Ybk1zEyr/9lv4MYcr+X8SQreEjbzJEvaGycWtYmtCHPLUQJPnfW/NTOnjWQwsz3PWBLabZNUg5JJo5Qk0R0WYvFYm8ZIZTvrgPOIiUrz6BkG+5RP2zFC+ra40K1HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r7ghf0OXSFOMYYwTUTYaqRfaFsUolfWBFHLxz9XrQ00=;
 b=g4j/IuTPEtsip8drSr7AH7GvMkzTBsN6kYWYzRAQdMmdlAAAzYW4a3fO8sCBsgHPdln2EtcxVAd66IuC+IE+weamm+UvRWjOMffQXfYbgREttOHG4saHW81LyXu37vKjt3BaziLy8XiBhbD1bC5wRpHbGb0GsEtalVZcLu5WBvzFE/re0tsdGBaOsdovq3lcsyaJ3pMwkZw7WzPp7J5py1IdgOf+6VuXUSfg1hBUdNoSQxeR+aJ17QiolQh8erCGAkPDfM3kJuLRYrkr+YvnQxfYCCg7/FlY4ziUAlZP9lvCM0NLvmMHRhtdG6WbVnyGDqpqU85lOU4v/2mW6zExHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r7ghf0OXSFOMYYwTUTYaqRfaFsUolfWBFHLxz9XrQ00=;
 b=bj1rJky8L/IfSfBdH440sSotiUDB1Sg7XZWpPu/+QQ+JCQUz2T2VEplc+I4WUR5II8Bq8173dycNIs9YBEFWyIxO7Yz1krIw4uiVWHH5/8LwkeeWGxcW2W4BylcQxkKTpslvG0fdM6IymAdlL47otU2VObCwn4REUOxvrO9ddu0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by TYYPR01MB12794.jpnprd01.prod.outlook.com
 (2603:1096:405:15c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 05:09:09 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 05:09:09 +0000
Message-ID: <87ecfeub9m.wl-kuninori.morimoto.gx@renesas.com>
To: Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>, Kevin
 Cernekee <cernekee@chromium.org>, Kevin Lu <kevin-lu@ti.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sen Wang
 <sen@ti.com>, Shenghao Ding <shenghao-ding@ti.com>, Takashi Iwai
 <tiwai@suse.com>, =?ISO-8859-1?Q?=22Uwe_Kleine-K=F6nig_=28The_Capable_Hub?=
 =?ISO-8859-1?Q?=29=22?= <u.kleine-koenig@baylibre.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 32/39] ASoC: codecs: tas*: use .auto_selectable_formats
In-Reply-To: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
References: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 31 Aug 2026 05:09:09 +0000
X-ClientProxiedBy: TY4PR01CA0084.jpnprd01.prod.outlook.com
 (2603:1096:405:36c::11) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|TYYPR01MB12794:EE_
X-MS-Office365-Filtering-Correlation-Id: 2086cd7a-fb0c-4d88-10bd-08df071dfd4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|52116014|7416014|376014|10067099003|22082099003|56012099006|11063799006|18002099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	PkeX6VVpu01MAhisvHAMK++3nTnnb8Net2eDxtY2PKxavfOML1vDvK3I/rWlsQeiMoKAR7MWWBRBxQJ1vMlyXXT4ibL8lMoAntUeomjcOpTWlM4vvOfH4yuWsBxZSi2glC+cLaBq09QlKTPQXT+badVdKPigkLTbztkGQxgkuTK3dwJAxDPH6doi1NC0FFZnFCKvGdhi2idgiKrBE4JGtBMEnmx5IEZ/IlTiL4aQRcWc9giKlYrmb+8MSL5hTWbCYr4LCj1G1etVv0Egrf9wUzoXrTNl3FfvTv7s6LEHqecm8+cehpZWQzDQDvrNzYX0HiuzwTGa47DecqK7+CJKcRawQV1CJUzuaCa+A/DtPMgYQfxipAFMPJdr2vjEY6aJs4SiDMaVuWFhvXnxNgvFI7QFO3jXO15g/i5tj9LsXgiUbM9VvQv9VVpBIaXgjf3EvJCdDzxchT1p4FlFMPO+tVN8bo1u3UyCQktmBIWvNt5HPnvKmcytGvSydVXJtZ6IYmmemEVCQB/JS0hZd0lxvav7RGgAqWGk9Nch9DBd/GkPnPi8+BeDSi6dnhQEOrqgBB7H85JiZMhC0zuNG83VmkG3nMCfUdt+YpZn2PYfwpE3jh/Obigma72gYMaOKRROsGytfG2wJ8hObc0PVdCyCC+JeMkbNTQjQscmXxumiOQg5hGvBNVeL2GwyjqAxErHtjGZCIH3MiAjpSWZJ49PzBpa4nUvpB//bJMOBihXKcGjrtPkhnRLItdLYcUQzG+P
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(52116014)(7416014)(376014)(10067099003)(22082099003)(56012099006)(11063799006)(18002099003)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5mClkZO1uxoyMvCsYzJeiY87D/6TvoGdHyZNmEvk7iKoHxyxq4IHicKAIjzc?=
 =?us-ascii?Q?1qmxt5q8jrKkbj6IKwEQ+aQ81uvMH6zvvAT2nNYvccLe5nmF7Il5quO0Pj6g?=
 =?us-ascii?Q?rj1psFSm/pgWUTIyawkRXYjxFCzvTpmTntEXdZ1p67fDpCL2mt1ISfYUEHI4?=
 =?us-ascii?Q?TTKyUZjuDZ4P7vd1J2kyy+7dxJmNksPRzTr5R5Dunae0DFzGYLza24Dt0hRM?=
 =?us-ascii?Q?3VsIMpFsAMPibhfK5dWlB+2qHwU1YCclE9NRkiZOZ1NURI2sXwuIHtfGXwKC?=
 =?us-ascii?Q?EsSPw1S6+JcU+JrwqOHTCNSsZCw3xT3DxcN95uVMBngWLGzJjrQuXkr4dUCX?=
 =?us-ascii?Q?bOtAVoqUSihM2eQobuoaQoC4nHEiNXXNtVkdQlVHWt/Pvj6tXlDybkg3kMn3?=
 =?us-ascii?Q?qPMq/bjxfi/JrIa5DTTzEf27MXAG+iA9+rRMm067ZwEsWbZlje7sblenG5U8?=
 =?us-ascii?Q?Hg3Q11VYE8heuPKMW6VCU1SzVPN7hvfLwoAIL7/UK6guPcktZAoItTTIlIDz?=
 =?us-ascii?Q?DjHfrchqQ3+zw/W7b5pPBrswU3nM1z6Yzya52wla6AdEnIgThZ7YHffqMq+N?=
 =?us-ascii?Q?/h9yD4RiAH9GSe+ohQwK+MOQeVRIwJ1xexshCIwpkIsPQeOJs3aAQWifFEVl?=
 =?us-ascii?Q?bF4B0WORGPt7bj2AwbVerS4ko4tCw8bUDn30+iO6HFfIKB6HAEf0jV6nSt0I?=
 =?us-ascii?Q?q1tcS0pIFiX9VZgpNMRvlVl0i+fcl+i0p/KsvtKHQIm0Izt13BRm0A4h6Xt3?=
 =?us-ascii?Q?/d2XR4JaVp7heAlgplGc187rNAD70iu+8K5bNRP+P//l9PshEt3Exlxnf8Eq?=
 =?us-ascii?Q?iymTd5H1uTknODfzEI6Mw7aM/0f2cn/dbAfkxcq+68lCl4fpQQRpJJle7ycm?=
 =?us-ascii?Q?pIDxReQFTXK/mfbqLLxrZmyOlgwbhCZUChVOYdc2eoKCYbWW6OLhsD0Svezs?=
 =?us-ascii?Q?aXUIyYTTNpWhKZhFf6T0gei47hlxwBjukWZZ62tS+vKilaFw9sFKTO586tSn?=
 =?us-ascii?Q?OeTGvvaeXCnscCev1RdNQpDUFT9ipKPxnGiX9RROsPfdiXdxTY8Ap12QC7sG?=
 =?us-ascii?Q?GGxV0tX1yp8OHuCXTxGgLdeh7DUZRjYbnK2rrdAx3KeQqCWa3Qzi3TzlGSBb?=
 =?us-ascii?Q?WoZIKYSBFefKaW9PGe3Iiwrevw3uXBRgKJPBsKNN0TRa7/UPwFvZlp3BzPbS?=
 =?us-ascii?Q?3NQMC6bzFsjj/h6v5YuPZZQP0e91BD8qa9pOfgE8AbfYa55MvHP7AOugnhKc?=
 =?us-ascii?Q?6fZyux7P5lRlDQ3p5/t9PLuAGDDyqEKxsYLOCTp3Zt/haAXCER5FJTDTzWE+?=
 =?us-ascii?Q?Qy4AhcTQ56aa6H6Aj1ITvJAMefECaVpXb38KmnF3tSlJGFO6gxdTTB6CQIGp?=
 =?us-ascii?Q?YKZixccBU81RW8uE6DFHPh+BTFVoyB6TZ3tbWBlHTAm7g0gPXGHmC3PZJHS9?=
 =?us-ascii?Q?0svmKF2B+oAT7ePW3FtiEHqTdDvXh5NO9EMUDv/kI4KVHsk+9CPirAgkAx/l?=
 =?us-ascii?Q?NmkhrbtEsKkppdNluBp4mMMxqkicibEs2yQqTYS3TkUTaW58dja6Bgafjsvt?=
 =?us-ascii?Q?3KoC1uE8ejfx5psqx8QE/HTl277y3mz51AdFa1svqrwWt7+GvbLPhTykAvMT?=
 =?us-ascii?Q?NJVoG4B/0Eox5tPEIOnMEthoacdb1D0clFpH8AjAuUUnuaCfuTpHDZWTqMUf?=
 =?us-ascii?Q?0px3ithiXcot6OsZLpdoUmknqQdVjtD9bpktbgK347lF+SL9MHrwdDkTlypl?=
 =?us-ascii?Q?zY2qwPbRk0+Q0z43FB8HeH6OC4ReYqE6raAYMQHxXT2Lqo6XQgkp?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2086cd7a-fb0c-4d88-10bd-08df071dfd4d
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 05:09:09.5922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gq7xFNEeQDvBkEHjKvd+rQX2/PHkZlRO5XcUz39GsNhVZUejnz8O43gzHIU/RxvsR1Yx+Y1IYT8M+/RG+h5PN76CFp/l6LEjqeNfOtZzH9GUghbeLdL6xcsue4uAn0qt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12794

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/tas2552.c | 14 ++++++++++++++
 sound/soc/codecs/tas2562.c | 10 ++++++++++
 sound/soc/codecs/tas2764.c | 12 ++++++++++++
 sound/soc/codecs/tas2770.c | 12 ++++++++++++
 sound/soc/codecs/tas2780.c | 10 ++++++++++
 sound/soc/codecs/tas5086.c |  7 +++++++
 sound/soc/codecs/tas571x.c |  7 +++++++
 sound/soc/codecs/tas5720.c |  9 +++++++++
 sound/soc/codecs/tas6424.c |  9 +++++++++
 9 files changed, 90 insertions(+)

diff --git a/sound/soc/codecs/tas2552.c b/sound/soc/codecs/tas2552.c
index be2c9a0fa529e..beb5654ac4b41 100644
--- a/sound/soc/codecs/tas2552.c
+++ b/sound/soc/codecs/tas2552.c
@@ -518,6 +518,18 @@ static const struct dev_pm_ops tas2552_pm = {
 	RUNTIME_PM_OPS(tas2552_runtime_suspend, tas2552_runtime_resume, NULL)
 };
 
+static const u64 tas2552_selectable_formats[] = {
+	/* Hi Priority */
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF,
+	/* Low Priority */
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF,
+};
+
 static const struct snd_soc_dai_ops tas2552_speaker_dai_ops = {
 	.hw_params	= tas2552_hw_params,
 	.prepare	= tas2552_prepare,
@@ -525,6 +537,8 @@ static const struct snd_soc_dai_ops tas2552_speaker_dai_ops = {
 	.set_fmt	= tas2552_set_dai_fmt,
 	.set_tdm_slot	= tas2552_set_dai_tdm_slot,
 	.mute_stream	= tas2552_mute,
+	.auto_selectable_formats	= tas2552_selectable_formats,
+	.num_auto_selectable_formats	= ARRAY_SIZE(tas2552_selectable_formats),
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/tas2562.c b/sound/soc/codecs/tas2562.c
index 0b8644ad74f13..1fe17b0895fcd 100644
--- a/sound/soc/codecs/tas2562.c
+++ b/sound/soc/codecs/tas2562.c
@@ -604,11 +604,21 @@ static const struct snd_soc_component_driver soc_component_dev_tas2562 = {
 	.endianness		= 1,
 };
 
+static const u64 tas2562_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops tas2562_speaker_dai_ops = {
 	.hw_params	= tas2562_hw_params,
 	.set_fmt	= tas2562_set_dai_fmt,
 	.set_tdm_slot	= tas2562_set_dai_tdm_slot,
 	.mute_stream	= tas2562_mute,
+	.auto_selectable_formats	= &tas2562_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index f9c65c9f6d0a4..44ac55f84beba 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -602,6 +602,16 @@ static int tas2764_set_bclk_ratio(struct snd_soc_dai *dai, unsigned int ratio)
 	return tas2764_write_sdout_idle_mask(tas2764, tas2764->idle_slot_config.tx_mask);
 }
 
+static const u64 tas2764_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops tas2764_dai_ops = {
 	.mute_stream = tas2764_mute,
 	.hw_params  = tas2764_hw_params,
@@ -609,6 +619,8 @@ static const struct snd_soc_dai_ops tas2764_dai_ops = {
 	.set_bclk_ratio = tas2764_set_bclk_ratio,
 	.set_tdm_slot = tas2764_set_dai_tdm_slot,
 	.set_tdm_idle = tas2764_set_dai_tdm_idle,
+	.auto_selectable_formats	= &tas2764_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index e79754edac5ca..59912ed9f4a5f 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -566,12 +566,24 @@ static int tas2770_set_dai_tdm_idle(struct snd_soc_dai *dai,
 	return 0;
 }
 
+static const u64 tas2770_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops tas2770_dai_ops = {
 	.mute_stream = tas2770_mute,
 	.hw_params  = tas2770_hw_params,
 	.set_fmt    = tas2770_set_fmt,
 	.set_tdm_slot = tas2770_set_dai_tdm_slot,
 	.set_tdm_idle = tas2770_set_dai_tdm_idle,
+	.auto_selectable_formats	= &tas2770_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/tas2780.c b/sound/soc/codecs/tas2780.c
index f1fce4305fa11..991d0c0efee2d 100644
--- a/sound/soc/codecs/tas2780.c
+++ b/sound/soc/codecs/tas2780.c
@@ -441,11 +441,21 @@ static int tas2780_set_dai_tdm_slot(struct snd_soc_dai *dai,
 	return ret;
 }
 
+static const u64 tas2780_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops tas2780_dai_ops = {
 	.mute_stream = tas2780_mute,
 	.hw_params  = tas2780_hw_params,
 	.set_fmt    = tas2780_set_fmt,
 	.set_tdm_slot = tas2780_set_dai_tdm_slot,
+	.auto_selectable_formats	= &tas2780_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/tas5086.c b/sound/soc/codecs/tas5086.c
index 4d1c122c8f04f..1ab82ef1c41d2 100644
--- a/sound/soc/codecs/tas5086.c
+++ b/sound/soc/codecs/tas5086.c
@@ -743,11 +743,18 @@ static const struct snd_soc_dapm_route tas5086_dapm_routes[] = {
 
 };
 
+static const u64 tas5086_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops tas5086_dai_ops = {
 	.hw_params	= tas5086_hw_params,
 	.set_sysclk	= tas5086_set_dai_sysclk,
 	.set_fmt	= tas5086_set_dai_fmt,
 	.mute_stream	= tas5086_mute_stream,
+	.auto_selectable_formats	= &tas5086_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver tas5086_dai = {
diff --git a/sound/soc/codecs/tas571x.c b/sound/soc/codecs/tas571x.c
index 8b5f9accf1207..5e2560347461c 100644
--- a/sound/soc/codecs/tas571x.c
+++ b/sound/soc/codecs/tas571x.c
@@ -352,10 +352,17 @@ static int tas571x_set_bias_level(struct snd_soc_component *component,
 	return 0;
 }
 
+static const u64 tas571x_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops tas571x_dai_ops = {
 	.set_fmt	= tas571x_set_dai_fmt,
 	.hw_params	= tas571x_hw_params,
 	.mute_stream	= tas571x_mute,
+	.auto_selectable_formats	= &tas571x_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/tas5720.c b/sound/soc/codecs/tas5720.c
index 0bbcfaadf3f2a..2539a097e743a 100644
--- a/sound/soc/codecs/tas5720.c
+++ b/sound/soc/codecs/tas5720.c
@@ -682,11 +682,20 @@ static const struct snd_soc_component_driver soc_component_dev_tas5722 = {
 #define TAS5720_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S18_3LE |\
 			 SNDRV_PCM_FMTBIT_S20_3LE | SNDRV_PCM_FMTBIT_S24_LE)
 
+static const u64 tas5720_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF;
+
 static const struct snd_soc_dai_ops tas5720_speaker_dai_ops = {
 	.hw_params	= tas5720_hw_params,
 	.set_fmt	= tas5720_set_dai_fmt,
 	.set_tdm_slot	= tas5720_set_dai_tdm_slot,
 	.mute_stream	= tas5720_mute,
+	.auto_selectable_formats	= &tas5720_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/tas6424.c b/sound/soc/codecs/tas6424.c
index f5d50f8a1cfb9..2718183e864c3 100644
--- a/sound/soc/codecs/tas6424.c
+++ b/sound/soc/codecs/tas6424.c
@@ -378,11 +378,20 @@ static const struct snd_soc_component_driver soc_codec_dev_tas6424 = {
 	.endianness		= 1,
 };
 
+static const u64 tas6424_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF;
+
 static const struct snd_soc_dai_ops tas6424_speaker_dai_ops = {
 	.hw_params	= tas6424_hw_params,
 	.set_fmt	= tas6424_set_dai_fmt,
 	.set_tdm_slot	= tas6424_set_dai_tdm_slot,
 	.mute_stream	= tas6424_mute,
+	.auto_selectable_formats	= &tas6424_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
-- 
2.53.0

