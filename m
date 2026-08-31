Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011006.outbound.protection.outlook.com [40.107.74.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8301F3C4555
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 05:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788152961; cv=fail; b=OBxAskobv+CKA10aNP/jJ8aM093n7Ryvl+AqsBzvvpH5upQrODKGaE3U3PHQTQrWyVB5jQ+tzhJry3SYYxqF3GYbBVRtPWh5+odYFHihDXQehFdyoq4O8MzdPqwwhmKzWjQYQQulN4Ty29iZ0aLy7xpZUDK8V/8RTZEDArlIQV4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788152961; c=relaxed/simple;
	bh=IqxrdSW5orfY2TLpYqUvjIf4YzaUp1FJmjLZWg3F9Ko=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=MK4/tnrPHZ58hu3gNtwBNzPblAoPDu/mppXgpG9kkVxBPHBbCy0G2KHjlXSFEBi1OJ4awAkf1BUKdVdiIjsmliCcx36rb9O/DPxqCbgk80AfBQzTYmsnshtbQD97kz/QkMkeY2DNvC78929KLiflhCAgJ3vKiJPBQ/UP8SZYgp4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=BiuK15wC; arc=fail smtp.client-ip=40.107.74.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="BiuK15wC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zCyFvXDJHJTg+V2Hm79grus28aJP9cAwzZK39zRr06FV3X/ddYr/TRQkWWUq0m4tunsyEDcLMG+I0dKOg/L/GVCaY2ZSQXpTdDlKbEHF1S3ppZLPk3HeFDuBuHamfHBdlAH7ku54qyoAulA5iNZ1zpf1bvXq9jBY/T/ns5HXU29sgn+F6/wBnM/PjuSuOVi97VjgMEaABnTqpX5BPOR9POD01OC/GO8mZPP4Ax921M1H64JCdP145/PeUab6nrBaoXPyJBY7G/ujPto3fBeKsxAoYwCPcrGh6N1HKkwvUy3d7RZUU1ePpEQDoKSxnRo0gz3aSh7omyp6RZ33iL9jAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z/hWZY//gugh8fPJVY32FY2IIjAREFU1OaXnpWNDtco=;
 b=Ic12IuWpYE6Nd8dmdScF4GQV6tgrWpdAZvkwLJEhLH4fAb3EmxPmPbUI+bvqlYftJTon2ULwtJ+IaKAk41dnQ3mJip5CwtW3tlCNzLP/NiYJdDHZMToXCdVgp1Ui5xD9F8gjDEMpJutzSOzq8BDz7Zo1fEmDqhwAm+yz/5jD8GreTHfej9cHoRlPjcRtE0jOOI+LS+2X/muB+68sxvg7IdTSapMhUvnlLnQPAoNbyLTRHZ714PkvUS/yiQSJlMI5bIbG9EEbDp3uipsfFnmcEMAHUe3uiP9enpkh9/kcrmwoyxD2rL4TJUhHpkBOG2WfAXbd8AB7HLzhIeWpd5mEQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z/hWZY//gugh8fPJVY32FY2IIjAREFU1OaXnpWNDtco=;
 b=BiuK15wCB3es7HaRngp/Ox7zRehYdM6Kk1Cnw4HDoAL+vxitXk/Ys7QMArfjjZXl0iM21gMIujcN5SXhiK7LW0fFLHUkOPDHE7JoEp1uKGeXGIglM8ZTEpPpInm4NL30H8Jwbd0TIiOByWIPFYxo0WMxjzq/3N50SGg1MGgyZ+M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by TYYPR01MB12794.jpnprd01.prod.outlook.com
 (2603:1096:405:15c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 05:09:17 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 05:09:17 +0000
Message-ID: <87bjaiub9e.wl-kuninori.morimoto.gx@renesas.com>
To: Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>, Kevin Lu <kevin-lu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sen Wang <sen@ti.com>, Shenghao Ding <shenghao-ding@ti.com>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 34/39] ASoC: codecs: tlv320*: use .auto_selectable_formats
In-Reply-To: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
References: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 31 Aug 2026 05:09:17 +0000
X-ClientProxiedBy: TY4P301CA0041.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2be::15) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|TYYPR01MB12794:EE_
X-MS-Office365-Filtering-Correlation-Id: c2266777-d6e1-4e61-d6f4-08df071e01fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|52116014|376014|10067099003|22082099003|56012099006|11063799006|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	vlESBxV/GcPF54houXs4vlwzmiEEOUNzSiyGqgdcBok7Fk5oK2Vpv74JkuK6a2RiFTQqW6VSwWvnf4WgaZoYU1bhJKFNluVlkYyRwxEJzzN+XhxRRQ/EJMcGfS0FElRDqublXJrtYSwcS5zD9fXp9SpZDdpzci5SAYHzGr3Jp6mGLGzbipyjssNKa9bpTO2pP8vlxn3vZka7PuNFeBGAq7YmHKHHVu92gtmNO958lTShyeEju63LXdO/hXxXptVsZSqcjMC7yAPoPzse8g2e3FlaO/NUD/AU4clYvi8k4mbjE/RvuVP2MLKcQ8o6cqKQM5qdnrRVzU3NreVfWQAWy5mS0d1QTKNJ9NcU3VrgmOpTdmqKGavcQGJjBvQQn9TGECoeuqz6XrUtvefQwmytF3Zmnq5le/7UZow3ssnfYys6RphX3DLfexl7bHz7blJ7tOOp1zb3lR6nKFkd6Gkeu6LNhTqCSSutOdaYiMgNolryQ6PQAnz4Gwqx7+kodFJkKxZkAvY3tuUvAAbKGVCuKf1pnDUWTJk3fIZT2JPnTQCBwglnGPufx48ENdbphWTTIsnr3jIK06Bcu5E1Um6oFQ1hOCtvffQO3LeMeSRPhm9akNlLGJzNfawMsIy8nbjqOKjHHacrYmTCHKON2eqVnfnty3NbKfQ8QkspeFZiaxlmdpORtvv5Pm9aiKVsqwNCgD5wRhkK87lJdASjwVdiNw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(52116014)(376014)(10067099003)(22082099003)(56012099006)(11063799006)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TTTMPb7k84Ux2FIZrTzu9h8dj0RIEYCLjDJDXlLApMCz++KUQWNY5ibW7nJ5?=
 =?us-ascii?Q?MF/AapnvpnKabNxj9dPmtJMdOR0Lws0FDxsfgCFYH6E/JyEsSJ/nkegSwnXj?=
 =?us-ascii?Q?60WEbG9d1zMuTrtWBzROdCY1tb0CSRRmAiRzAUwU8ZvaSBFmZaWfYrkwW18+?=
 =?us-ascii?Q?p/cZaJKX4ilL6zma2UkvfH3QjfyGKH+HMECrizXWMQ63Ijlp/Ulmr00EfC8i?=
 =?us-ascii?Q?N6ap0OClJYM1RSFPeYb/97x2FmMFTOAU8JUrWrw7u99u8uouceT2qA7ae4jp?=
 =?us-ascii?Q?rfXW8PbcKNM1aM0jSV1ybT3mp7EyLVUh3CYyBRc3B22KwWW0sBGJNMm2v1OK?=
 =?us-ascii?Q?vbNRiG2Zz/yNTUh3ygqQYzRiv0VO5lDT2PhjRSbGWumYHxaKUy5w/rLtsGBN?=
 =?us-ascii?Q?nYytfCk17COdUnxQ5j0oJh01fKPVTvIrwtPSWT5803bvR7ZMrxffxaHTs1ar?=
 =?us-ascii?Q?ZGIV+EzK16YkX39KodvD8BfS+kUFadldkkEry4xCXMNsxLTg651IlV/Zjc5a?=
 =?us-ascii?Q?ETrRDsrCX5ad+ZgTLUgIrlRhrAlAZVjlfxIx8mxd7h4LmbbVtDtjDzD+bsZO?=
 =?us-ascii?Q?RhqnzX3o1KwTbB2TJHVKfke1lqTY1BZr9AAHMfLguXw7WYh54YEhfFGTtB5w?=
 =?us-ascii?Q?K2R8Eh2AJpIkKa/Xif3SxFud3i5vaoBBwNYzP0mr0fpJkd8401ZXRwq+pkN1?=
 =?us-ascii?Q?l7ZhLs6QxDwkcrbTwG0r/V4MvgpqmMpZS4LyqUgEyHRYEf+iZlI/v3vjaneh?=
 =?us-ascii?Q?qx7/4E/j5eQF9tw7m9f0oroELgZljzaYIdHMIwYTVOi5k3nDGkWSTl9ELMgo?=
 =?us-ascii?Q?85Z6Oz36dlNFGeVYg7JjF3P3mM2kv4rvypTbKrso5twOLm0k9nqGfhcWaoNy?=
 =?us-ascii?Q?txE9fLU75P50ipdLAPO+SWlfhcHJJwWSzzHRjbz44q0oou6GDNU4JQAjKvzf?=
 =?us-ascii?Q?uXtEFCVbV7LA5J4SRNx1W2Ko8kbZH0b6CrMrVhRQud3Yel+1NExVbWNEDHMO?=
 =?us-ascii?Q?U6zdwWbDTmisWbrz+wiQjyFgpDDMKjCYOHSnWN73HGSa3hw4LyIiDH+itNxt?=
 =?us-ascii?Q?F5nCmXBZrCg85H79Cwtb8E6K2fCWBWZalRBSJEp7yvCXHP4aCM3Ut50ReE6Z?=
 =?us-ascii?Q?I6k2DK4btC/1H7K/C8BZp/XckLDZGnBVlFSvhUw3OW4ghevv83Rgs1jdHCYD?=
 =?us-ascii?Q?2BKH2hTlXILbLnhyQWrWFbysfOCdGHw8ZZAk1u7bvIB+SaREmHM2+iF51PJD?=
 =?us-ascii?Q?a+MvrlTBwfxBNqA5DtnB/zGuv/TbqdDeBgu4S8VI7f7g1aHHtALbFKglof7S?=
 =?us-ascii?Q?/xZWXDH6//9KgzExAYprhyV9+uYbP32e0ooJ83ndU+bmTnNKyoBHgup96S6K?=
 =?us-ascii?Q?43sj5LYK2LuKDtOR35X7Cz76xFG5x7fYTpssAAwYM2PIEmtptyxLtCdTooGc?=
 =?us-ascii?Q?DnJRHf3n9ps8UMznHn/II5E6XlNa/k8eJ4IxcTJBWBdY3H+lDntIOy+P6nBJ?=
 =?us-ascii?Q?oEzK/UxT+5iyA5i88HIqqKMbhwHXD9FAVEScB8cBW2ZNR1hrDunNoyZDwfzm?=
 =?us-ascii?Q?tzqclECGXsGOAbKpesfx21KJjQnu1yHH7UvonXbYd5gNH5iYLYExqbrTZgWz?=
 =?us-ascii?Q?VkzLH3HLI8Ys9Pf03qoyUDg0uEsYWB4ucGbAM+gwPwTHhq8NbHjJIDF2aDux?=
 =?us-ascii?Q?00KuLakPkEQj54ZLMgnMVSW1pHqIGf/ZVRreA8mPBVZQJ1cV7lMYLHNZ6mY3?=
 =?us-ascii?Q?7e+WT7tSKP4gVnyRetVXZI1XWIdm66hdUZ5a426Egf/lvISKlaHI?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2266777-d6e1-4e61-d6f4-08df071e01fd
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 05:09:17.5069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: osoVT9GaafhzvI/ocRXJUEKfUmhDhkCVRCPczLjHu5WWdf57OoRYS/nKednNeK2JzUXh737737DIxLvOv3EK+TQBEEf4+hW+ptEatVCxA3tur65ceour6x0tVHKexDwD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12794

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/tlv320adc3xxx.c | 14 ++++++++++++++
 sound/soc/codecs/tlv320adcx140.c | 12 ++++++++++++
 sound/soc/codecs/tlv320aic23.c   |  9 +++++++++
 sound/soc/codecs/tlv320aic26.c   |  8 ++++++++
 sound/soc/codecs/tlv320aic31xx.c | 11 +++++++++++
 sound/soc/codecs/tlv320aic32x4.c |  8 ++++++++
 sound/soc/codecs/tlv320aic3x.c   | 14 ++++++++++++++
 sound/soc/codecs/tlv320dac33.c   |  8 ++++++++
 8 files changed, 84 insertions(+)

diff --git a/sound/soc/codecs/tlv320adc3xxx.c b/sound/soc/codecs/tlv320adc3xxx.c
index d7d958ecd8db5..528c444464824 100644
--- a/sound/soc/codecs/tlv320adc3xxx.c
+++ b/sound/soc/codecs/tlv320adc3xxx.c
@@ -1362,10 +1362,24 @@ static int adc3xxx_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 	return 0;
 }
 
+static const u64 adc3xxx_selectable_formats[] = {
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
 static const struct snd_soc_dai_ops adc3xxx_dai_ops = {
 	.hw_params	= adc3xxx_hw_params,
 	.set_sysclk	= adc3xxx_set_dai_sysclk,
 	.set_fmt	= adc3xxx_set_dai_fmt,
+	.auto_selectable_formats	= adc3xxx_selectable_formats,
+	.num_auto_selectable_formats	= ARRAY_SIZE(adc3xxx_selectable_formats),
 };
 
 static struct snd_soc_dai_driver adc3xxx_dai = {
diff --git a/sound/soc/codecs/tlv320adcx140.c b/sound/soc/codecs/tlv320adcx140.c
index 4eb9cea272760..c29584d77649b 100644
--- a/sound/soc/codecs/tlv320adcx140.c
+++ b/sound/soc/codecs/tlv320adcx140.c
@@ -916,10 +916,22 @@ static int adcx140_set_dai_tdm_slot(struct snd_soc_dai *codec_dai,
 	return 0;
 }
 
+static const u64 adcx140_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops adcx140_dai_ops = {
 	.hw_params	= adcx140_hw_params,
 	.set_fmt	= adcx140_set_dai_fmt,
 	.set_tdm_slot	= adcx140_set_dai_tdm_slot,
+	.auto_selectable_formats	= &adcx140_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static int adcx140_configure_gpo(struct adcx140_priv *adcx140)
diff --git a/sound/soc/codecs/tlv320aic23.c b/sound/soc/codecs/tlv320aic23.c
index 04ec8fb5c6e5b..f31ffa189580d 100644
--- a/sound/soc/codecs/tlv320aic23.c
+++ b/sound/soc/codecs/tlv320aic23.c
@@ -507,6 +507,13 @@ static int tlv320aic23_set_bias_level(struct snd_soc_component *component,
 #define AIC23_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			 SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 tlv320aic23_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
+
 static const struct snd_soc_dai_ops tlv320aic23_dai_ops = {
 	.prepare	= tlv320aic23_pcm_prepare,
 	.hw_params	= tlv320aic23_hw_params,
@@ -514,6 +521,8 @@ static const struct snd_soc_dai_ops tlv320aic23_dai_ops = {
 	.mute_stream	= tlv320aic23_mute,
 	.set_fmt	= tlv320aic23_set_dai_fmt,
 	.set_sysclk	= tlv320aic23_set_dai_sysclk,
+	.auto_selectable_formats	= &tlv320aic23_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/tlv320aic26.c b/sound/soc/codecs/tlv320aic26.c
index 84e954311c1b2..7dcc960a0b9e2 100644
--- a/sound/soc/codecs/tlv320aic26.c
+++ b/sound/soc/codecs/tlv320aic26.c
@@ -208,11 +208,19 @@ static int aic26_set_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 #define AIC26_FORMATS	(SNDRV_PCM_FMTBIT_S8     | SNDRV_PCM_FMTBIT_S16_BE |\
 			 SNDRV_PCM_FMTBIT_S24_BE | SNDRV_PCM_FMTBIT_S32_BE)
 
+static const u64 aic26_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A;
+
 static const struct snd_soc_dai_ops aic26_dai_ops = {
 	.hw_params	= aic26_hw_params,
 	.mute_stream	= aic26_mute,
 	.set_sysclk	= aic26_set_sysclk,
 	.set_fmt	= aic26_set_fmt,
+	.auto_selectable_formats	= &aic26_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/tlv320aic31xx.c b/sound/soc/codecs/tlv320aic31xx.c
index 43bcbc5449e1a..9770e041b9fd3 100644
--- a/sound/soc/codecs/tlv320aic31xx.c
+++ b/sound/soc/codecs/tlv320aic31xx.c
@@ -1422,11 +1422,22 @@ static const struct snd_soc_component_driver soc_codec_driver_aic31xx = {
 	.endianness		= 1,
 };
 
+static const u64 aic31xx_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
+
 static const struct snd_soc_dai_ops aic31xx_dai_ops = {
 	.hw_params	= aic31xx_hw_params,
 	.set_sysclk	= aic31xx_set_dai_sysclk,
 	.set_fmt	= aic31xx_set_dai_fmt,
 	.mute_stream	= aic31xx_dac_mute,
+	.auto_selectable_formats	= &aic31xx_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320aic32x4.c
index 9e0e4aa2b09c4..af4be5bee7237 100644
--- a/sound/soc/codecs/tlv320aic32x4.c
+++ b/sound/soc/codecs/tlv320aic32x4.c
@@ -916,11 +916,19 @@ static int aic32x4_set_bias_level(struct snd_soc_component *component,
 			 | SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S24_3LE \
 			 | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 aic32x4_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
 static const struct snd_soc_dai_ops aic32x4_ops = {
 	.hw_params = aic32x4_hw_params,
 	.mute_stream = aic32x4_mute,
 	.set_fmt = aic32x4_set_dai_fmt,
 	.set_sysclk = aic32x4_set_dai_sysclk,
+	.auto_selectable_formats	= &aic32x4_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/tlv320aic3x.c b/sound/soc/codecs/tlv320aic3x.c
index b38393a8130ff..c0f58cba8a993 100644
--- a/sound/soc/codecs/tlv320aic3x.c
+++ b/sound/soc/codecs/tlv320aic3x.c
@@ -1500,6 +1500,18 @@ static int aic3x_set_bias_level(struct snd_soc_component *component,
 			 SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_S24_LE | \
 			 SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 aic3x_selectable_formats[] = {
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
 static const struct snd_soc_dai_ops aic3x_dai_ops = {
 	.hw_params	= aic3x_hw_params,
 	.prepare	= aic3x_prepare,
@@ -1507,6 +1519,8 @@ static const struct snd_soc_dai_ops aic3x_dai_ops = {
 	.set_sysclk	= aic3x_set_dai_sysclk,
 	.set_fmt	= aic3x_set_dai_fmt,
 	.set_tdm_slot	= aic3x_set_dai_tdm_slot,
+	.auto_selectable_formats	= aic3x_selectable_formats,
+	.num_auto_selectable_formats	= ARRAY_SIZE(aic3x_selectable_formats),
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/tlv320dac33.c b/sound/soc/codecs/tlv320dac33.c
index 9bd2ddd8dacdc..55a95b62a6505 100644
--- a/sound/soc/codecs/tlv320dac33.c
+++ b/sound/soc/codecs/tlv320dac33.c
@@ -1435,6 +1435,12 @@ static const struct snd_soc_component_driver soc_component_dev_tlv320dac33 = {
 			 SNDRV_PCM_RATE_48000)
 #define DAC33_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 dac33_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A;
+
 static const struct snd_soc_dai_ops dac33_dai_ops = {
 	.startup	= dac33_startup,
 	.shutdown	= dac33_shutdown,
@@ -1443,6 +1449,8 @@ static const struct snd_soc_dai_ops dac33_dai_ops = {
 	.delay		= dac33_dai_delay,
 	.set_sysclk	= dac33_set_dai_sysclk,
 	.set_fmt	= dac33_set_dai_fmt,
+	.auto_selectable_formats	= &dac33_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver dac33_dai = {
-- 
2.53.0

