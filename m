Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011032.outbound.protection.outlook.com [40.107.74.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2634737F8CA
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 00:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785804111; cv=fail; b=rfJjlCLkeGrpHRN+u6yEIBgTwMfrJiKYh3ta1wDvupREjNZ/Hqk2kRgBoiXaPU8RI7qFfHFyWDrH3I0LojJQyOidjN4bqRiJMHBYJ6hnh2nixP/xtudqmvBtjtSb3G/rcNXJ6W5KIZ1QxklY9ChQM3rOc/deyV9Kisw221dxhAQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785804111; c=relaxed/simple;
	bh=2jznu7QIZiO4NsD8pziTepENw4yS9QU2jOPgjB8Co1I=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=T/PbAyq0iLvoKhX3geTkoMdl8Rp1Gq42glsBTri0nDANxfiQwnmN0ykcHXZN0HzepwLNWC/rToD5OpzoV74UwFAk252PjUUW7cUwoI6NsWG+l2mzdSg24jJ5OJGpe5s5bbjfkV6hyaaErTwH+lPkbTRLMZ/QocJMttn86YRAFzI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=dWGbiRyh; arc=fail smtp.client-ip=40.107.74.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="dWGbiRyh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hvqaUhAjZS8UnYqtAqTc2xD+bdC96h1sHBFg02ROW2c/SjxqgzDp3ctnuUSDsQRzx14w96/u9JTJqa9kPSv3PyOeK4Gzh20EMjb34Dtzupwcid+l6bA+napdEUaDJhIG2x625ISCCzH06sq4dWTz8gWICor8XroHnj8wvhA/DvIUTHIEF+BtpEudRSqb+/D1jgpM190sHSUEo37hnZZThBi0q9iv7sVVrNzO5Zvt1Ql7rs5q7F6hoWXNPYgxLW+tyoovz95t0re/VJbPh2s6KH9jpFmrRQgKradKhl8j5Zhmd3/32VvoyPLfz14f9gXrQwVBGmIQ0X16+jMmsNiqGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w2QPMXOOFSZK4tsQyCXfFC7+AhQEnaxnIw6Ttn68Zhs=;
 b=yukBiX0O1uVaLKiW8PjEUW65cok1puzjjKo+YphZXPL2gaNHvTOUmOPYa6FQM66lBIpo/+4QWTNDaPr2gs9+I9V3g6QLZXZk/ppr7Uyi1Vy7EqjO5euyavCNERObw7rBXBTfiXKZzwHeTgde8L/fKVOU4mx/uMULXmZ3WzlaRsSXyjF7rwggA85KudNaZNTNmMuNeblUp9rdrijkh/XI8bNe5wVTQAlqPLm8KfQHCaqgWy/k4eL1BFWMAQZO128wgiOZiRcPCM1uIbcAxbUmwHPLOssxgbUpPKjxyGBXvGffSy7Tqp1qNtOnGwsbsfPM1nLfqgBAWDeBtpG+ZKnREg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w2QPMXOOFSZK4tsQyCXfFC7+AhQEnaxnIw6Ttn68Zhs=;
 b=dWGbiRyhsQUFkTba6Xd7oi9Acl6zRSIgktsKdEGtCe0Crx/AeAXTBPCb6qKlN3Xe/h+omIumGJMYHFnyZaP578j/wWSV1dHixsYEwnz1o9gnvaQKUOEBEOSJ5jW9LH00B7fcIhag23wsOZRv98+xWiKV0RZXjC2jGAml6xa5f4U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYRPR01MB15651.jpnprd01.prod.outlook.com (2603:1096:405:285::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 00:41:48 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 00:41:47 +0000
Message-ID: <87pkzywwc5.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Support Opensource <support.opensource@diasemi.com>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 16/44] ASoC: codecs: da*: use .auto_selectable_formats
In-Reply-To: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
References: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 4 Aug 2026 00:41:47 +0000
X-ClientProxiedBy: TYCP301CA0050.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::14) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYRPR01MB15651:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ddda6d7-54aa-49fa-81e7-08def1c12a86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|38350700014|18002099003|22082099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	s4tXoaf3KFJIq7WQlcaUTEbuxJVeeile9fymWLNIx3kttog8q12rQRrrGd/w7qTBASi90Ma7iaTvNUn8lp9K/CC/0fplI3qSFojO7OfbfZkjiNw0UK5f7ghEnw0L+97zFoA4mNMeLIfK9YBofihhm9xsByGK6LHUcxMlWhkw63oZ8kpl6IXyiiyNHanKAjedFtU2qs+3Ac6NHavWLtO3q6/d7N5vqxng+dMmdjfXjq7m/Iz2bbCpdp7Ew/silQqAS/RZbYy0zLTFU1bkaMyu80Ufppd86ysTk0iEeTU2WUwOz8gIbUVoq39O8ZfgVvLkKlFdTYolxgIlK4TroTWB5reXoEo5dxnpCysYHB68r+/CV2iLFarMPhrsWnw0+tkU7cNE3sCBEaKT0g/l9hKkZa7DnqCyUvsDgORMFC8R6r3NNLARGXvhPsJTXx5AYqJmzZpPj4vkSfEZ5NRPjSuQMfyG7B9qRTYVaCXc1EJwA3kla9bnz97w2fT9AncrsFLk38dTd6H+bhYt8hf+mbLw7IrK7uoIOi4mw7nzeSgLHsmvm3b/Z6TqjTsja3wYzAsObIHgzv8pUqnogP5WOemM0dQWknpURpol9sL1PmemTHbTSMndOYnvCjtNGT4nAC5Z32L+zbrRul/P77avA8XYM+R9q0ahK1x9gbsNYHzu9/bLJ4VE07VcjqzEvJi+mciMb39X8TfWOKV86HKL5Nc3G+QkEE9IKCFYsVQRB9iLngA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(38350700014)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0DpRDK7Pm+kyIsm/TtYDqLYZGmMjVGPZfF8hX9h1INa5WlD0xoAzWAkGLecc?=
 =?us-ascii?Q?ZNXyP+Osn68fnS8VNjM7DopvktJnDghqAvBpiOFTwtNeCFxn+Efj9bJStnZc?=
 =?us-ascii?Q?5tCsxfzd0w+E/MPyKQbLl5twV2aKIqkRJPTOKtIHG4JAGKAOX4cH9TwL84wc?=
 =?us-ascii?Q?Hsg4HbMwY2GPZSIR35GeJjAA6DEi9+uQe03BDc15pmIPuyaD/3/2dGalxLiY?=
 =?us-ascii?Q?N1BVUHfzgQRDN28huIVy58E8umUEeoZTc+a8893XS6mXb6tHgV+SpwoOtBOC?=
 =?us-ascii?Q?Ow0uxBWfxI5iRFWQO8SPYc8NbJPoZdgZTSiWrlOW+CBJDzVWutPDFA5SQ76G?=
 =?us-ascii?Q?qCB9kXgmX56wvZCZhEPJjcgbLoI0SoJ/8JSRXiEawUIVPRetLreeJi65l6dw?=
 =?us-ascii?Q?ENPRKzdd6PeWCsSrWH/cX9upMkuaZREq8CUmzJtPBqZAI4VynFDrR4aC8c2U?=
 =?us-ascii?Q?OHGGjLnovHLAqDNVOBXmYoijHqKjkhwEpFgTii+2EMV+Ky276MXQ+eBtGGlA?=
 =?us-ascii?Q?xEiCb3u+qeV4VTFbWaxb38Ls2kMzX8SAbmUc7hBQYTW66cslKBUNjReje+gR?=
 =?us-ascii?Q?xFSdv2K1GM/yUjrFsE3gme4WnUwj0NenYXx6ny5RSeZEUW6+zb1Y2HMERNux?=
 =?us-ascii?Q?gMuaDLkgbqF2dYuXQxvEpc+m4SUFcNsCHLcgA4Rji7x5Fc6Aa145HmI3Jm1w?=
 =?us-ascii?Q?MaMA1F/iohjbh10d1j8jUPPwWiGGMGWMSSXslJlhpuQagdCTSGupmT2h559d?=
 =?us-ascii?Q?l0iKM07kmZLkScYDyA2IxeKpz2tkD+xNX5CIHYgELYzlnOpDE7mUclsO0jGR?=
 =?us-ascii?Q?EC8Vg19N7OQ9R81he7z01oxu6EcrfTkzi3NAmK8q0Vrkzsbi01Cbi3nKEUWy?=
 =?us-ascii?Q?kC32bczLun1vZUtf9vFUB+9/6jxIkqR0UXyVb+IQTf5ekfgYY4KbwpN88a0n?=
 =?us-ascii?Q?sp0L1wbhEgYlOHuOf7nSqTZYNSGPuhkkYJo9B2XJIh99xhh3vhMp2Jqk5L2c?=
 =?us-ascii?Q?+DultzQeYhtLs/ZINVw2BCAJbP0ynXFg9WDkCUIMMvnziHxDnF2/ojASPnO0?=
 =?us-ascii?Q?Y0tRqsw1Zz0e1xS7jOcnX7iaO8+sJtM35T0N8chH9RDDYPD1suszAKdR4eOl?=
 =?us-ascii?Q?43nt5t/dXBm6G0Xss5fApG23HvCBW3QoBRrQ9DEbdSZdztOgcVwhTkfhCSNM?=
 =?us-ascii?Q?/8EtTIEC6vZhOVh5rd5RAdT8p11/Rp/0Sr7Hg5XbyD1yP7khYPYZKZbFeaMm?=
 =?us-ascii?Q?VwitRDZ75joLi26Ro27mttA7GxGkDlT/S8QPWXq31uCAfN5SEITemx2J4r4u?=
 =?us-ascii?Q?Swaq6ewIdAbrpDb27Lkn3KLBsfF/qLnK29G/2PCPA6XnUlGiUDWsWahL57p/?=
 =?us-ascii?Q?zJhUTsxDAJQ4LxSjXFEJK7tvkq71l8RGZlHHXjrmDntUP4cuJZLXh2GoUsa9?=
 =?us-ascii?Q?82dTLnJJEurzSPgQSHNoAWy3SaWJ0LsP2Z/0tzqbQP2De8DIKEYe3AyFKGAW?=
 =?us-ascii?Q?97jy8HfJuTaLTuDGkaqea47GmwhYcsYx+gOEVh0rwLzHPVjenABCXIXsj/kH?=
 =?us-ascii?Q?orTDIHhhO0byeGhQ0FYVCk85qGsfVF0ginE5H2v2gDuHuK4k8LPp19dWQ4qh?=
 =?us-ascii?Q?fOKii9PGL8ZfUEkWppLc6IwGJm1j0Jr4OSO3l5u2YK4KFF0QaX5Q8khg6O3I?=
 =?us-ascii?Q?VegBHA5IvEzU6vDv4VPVx36B/DUzu6NmEG4NWQ+LX7nch8HZ1J2Lq5vNLKFZ?=
 =?us-ascii?Q?UX4JP2ujILq/Hjyqb8SjRp6t9h8s47jWgPwT6JNq5lW1xvuIUyK6?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ddda6d7-54aa-49fa-81e7-08def1c12a86
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 00:41:47.8728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Io1P4BmB+KoUzE4s4CrDTJbRBOVNHFECrF88hl0w4vJOqNHAkAq2a3YEQ6o05zzTN1lyojgHcZ5k23dqL4ytdSLJCKydoIcTFvkY3VsEkeHwRUqOpS04hyepEB2gzg2s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15651

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/da7210.c |  7 +++++++
 sound/soc/codecs/da7218.c | 12 ++++++++++++
 sound/soc/codecs/da7219.c | 12 ++++++++++++
 sound/soc/codecs/da732x.c | 17 +++++++++++++++++
 sound/soc/codecs/da9055.c |  8 ++++++++
 5 files changed, 56 insertions(+)

diff --git a/sound/soc/codecs/da7210.c b/sound/soc/codecs/da7210.c
index 4df1a25e318b6..597510de561a6 100644
--- a/sound/soc/codecs/da7210.c
+++ b/sound/soc/codecs/da7210.c
@@ -1030,6 +1030,11 @@ static int da7210_set_dai_pll(struct snd_soc_dai *codec_dai, int pll_id,
 	return -EINVAL;
 }
 
+static const u64 da7210_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 /* DAI operations */
 static const struct snd_soc_dai_ops da7210_dai_ops = {
 	.hw_params	= da7210_hw_params,
@@ -1037,6 +1042,8 @@ static const struct snd_soc_dai_ops da7210_dai_ops = {
 	.set_sysclk	= da7210_set_dai_sysclk,
 	.set_pll	= da7210_set_dai_pll,
 	.mute_stream	= da7210_mute,
+	.auto_selectable_formats        = &da7210_selectable_formats,
+	.num_auto_selectable_formats    = 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/da7218.c b/sound/soc/codecs/da7218.c
index 93bd045ed8701..361daf14152e2 100644
--- a/sound/soc/codecs/da7218.c
+++ b/sound/soc/codecs/da7218.c
@@ -2166,12 +2166,24 @@ static int da7218_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static const u64 da7218_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops da7218_dai_ops = {
 	.hw_params	= da7218_hw_params,
 	.set_sysclk	= da7218_set_dai_sysclk,
 	.set_pll	= da7218_set_dai_pll,
 	.set_fmt	= da7218_set_dai_fmt,
 	.set_tdm_slot	= da7218_set_dai_tdm_slot,
+	.auto_selectable_formats        = &da7218_selectable_formats,
+	.num_auto_selectable_formats    = 1,
 };
 
 #define DA7218_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
index f6d371e935495..673285c3213b2 100644
--- a/sound/soc/codecs/da7219.c
+++ b/sound/soc/codecs/da7219.c
@@ -1643,12 +1643,24 @@ static int da7219_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static const u64 da7219_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops da7219_dai_ops = {
 	.hw_params	= da7219_hw_params,
 	.set_sysclk	= da7219_set_dai_sysclk,
 	.set_pll	= da7219_set_dai_pll,
 	.set_fmt	= da7219_set_dai_fmt,
 	.set_tdm_slot	= da7219_set_dai_tdm_slot,
+	.auto_selectable_formats        = &da7219_selectable_formats,
+	.num_auto_selectable_formats    = 1,
 };
 
 #define DA7219_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
diff --git a/sound/soc/codecs/da732x.c b/sound/soc/codecs/da732x.c
index 12d1ac98461e4..c9b6172ac0a1d 100644
--- a/sound/soc/codecs/da732x.c
+++ b/sound/soc/codecs/da732x.c
@@ -1188,10 +1188,27 @@ static int da732x_set_dai_sysclk(struct snd_soc_dai *dai, int clk_id,
 #define	DA732X_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 da732x_selectable_formats[] = {
+	/* Hi Priority */
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF,
+	/* Low Priority */
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF,
+};
+
 static const struct snd_soc_dai_ops da732x_dai_ops = {
 	.hw_params	= da732x_hw_params,
 	.set_fmt	= da732x_set_dai_fmt,
 	.set_sysclk	= da732x_set_dai_sysclk,
+	.auto_selectable_formats	= da732x_selectable_formats,
+	.num_auto_selectable_formats	= ARRAY_SIZE(da732x_selectable_formats),
 };
 
 static struct snd_soc_dai_driver da732x_dai[] = {
diff --git a/sound/soc/codecs/da9055.c b/sound/soc/codecs/da9055.c
index a88c135331457..faff1535ab12a 100644
--- a/sound/soc/codecs/da9055.c
+++ b/sound/soc/codecs/da9055.c
@@ -1317,6 +1317,12 @@ static int da9055_set_dai_pll(struct snd_soc_dai *codec_dai, int pll_id,
 	return -EINVAL;
 }
 
+static const u64 da9055_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A;
+
 /* DAI operations */
 static const struct snd_soc_dai_ops da9055_dai_ops = {
 	.hw_params	= da9055_hw_params,
@@ -1324,6 +1330,8 @@ static const struct snd_soc_dai_ops da9055_dai_ops = {
 	.set_sysclk	= da9055_set_dai_sysclk,
 	.set_pll	= da9055_set_dai_pll,
 	.mute_stream	= da9055_mute,
+	.auto_selectable_formats	= &da9055_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
-- 
2.53.0

