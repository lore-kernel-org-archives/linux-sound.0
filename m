Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011003.outbound.protection.outlook.com [40.107.74.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1565E3C4555
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 05:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788152874; cv=fail; b=ReG2gJAp9GIgMCd6hsQ0X+wIy602bcMT4eTQ4hT0TVdKTISPyF9T7TiuGyhAvy3fNdBQQ+NDy6XPXXZH14vzNDLoxyxcO3KrhLxFB9Zd7JhvPTpfZYm3XTFkG2ALnFEaET2EvZ2bKEB1f0tqHHYMz5K1fkJD35O2xFpG4CGFwWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788152874; c=relaxed/simple;
	bh=ybQjief0WtJuY/2c6nwBOrPprT6YiT1eNUZxo9NC6jM=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=aAw4lqf/B5yOWIODPLKrF9QrBIKk71Cbvg+SgKbeCdq4py5csVMcAU/9ndeJ4qY/Lm3mepuL2hZjEYT3EaSu2ec+0zYfYJzcqfclnPaomBZYJkZcnA11ShzSnVoGQp9U5h17LxiUOWRv9EvGM2DzyHJ2wY07YS3us8Y7+jAxvlo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=kVUN+dwy; arc=fail smtp.client-ip=40.107.74.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="kVUN+dwy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=itJdoDANTCGr76KiThOJwO0cMIpKeHfrInanMPH47+IAjRZcFzC9OCZLFKElTcVgZRB/bkuBM74wgQ9EzKAYY44jTngpvqsBUOxVm8HOICl7lhxlRA+x+ZtUE67suNOFmJ2qYoK9mcS+CQQbxQhIWT/SR7EupWW06C2NFAMZu8RqNoiHK04AbRAegvCstjAze+dGp519ORTHYYXBlKXoA00EzL+fkFaNupTh0MEIlYuloYxZINWhOzh8unaaBi0Arohh9Ma999/x3SWI5YYGMTmjzwqMgoSLV3xrDgFpROQ30cHsRyNC2i0HIf6525tl4LDmnF1dE9JdhuOP8/exgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2u7QT0bgsJu3MEIG37HTHlGzL6F3wL6hLumakAuNDV0=;
 b=c2+HTLA2L8xqy+bKhaXOzwBhlYHaHsynBIqytg72XkeELKfMsyi4ZIwY/CMkDZ3uzu89rwUNsfNzBjbvMt6bLel/s4qawW5fLgFI5cQ6CNXcQswrZBgULMoIDyrfq5p8OSp2mTQcS/qJN1g2e+kRL5q0aEq53kt4H3VaLnXuJkTFQmQTW25XSPgrfUtfVFbo0vKUrzWi6x21YDm1kRrY2B1NhV9hv/xER80k6PIeIiJVcKrltc5BCJh9fBmBeZlirV1j3qX6vkTxaRDocFl+B4U9SRWkdwlcTeB7Bxh7C/WwufT3Ck8yHRK1Lx+o8P3JBRnWuhOmmBEZQLT7kkUDUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2u7QT0bgsJu3MEIG37HTHlGzL6F3wL6hLumakAuNDV0=;
 b=kVUN+dwymfmfFfmC/rjnEuAVPFBsY0xjAFByFzeBN2ZD6Qyo/ZoL+RWDYkqTguvP5RRm659FsknwI6ve2nREFyMXZ+wd1ub+MGYCUkPR8HAZL2eBPhDGqkz6NGOxGrtLHqCvee7yYbpMEOiveMd0/e6U1gVV98ZBZKl44jY3seI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by TYRPR01MB13019.jpnprd01.prod.outlook.com
 (2603:1096:405:1c7::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 05:07:51 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 05:07:51 +0000
Message-ID: <874igavpw8.wl-kuninori.morimoto.gx@renesas.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>, bui duc phuc <phucduc.bui@gmail.com>, Hsieh Hung-En <hungen3108@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, Zhang Yi <zhangyi@everest-semi.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 14/39] ASoC: codecs: es*: use .auto_selectable_formats
In-Reply-To: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
References: <87o6eivpyd.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 31 Aug 2026 05:07:51 +0000
X-ClientProxiedBy: TYCP301CA0022.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::7) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|TYRPR01MB13019:EE_
X-MS-Office365-Filtering-Correlation-Id: c0cde98d-94dd-4d2a-4395-08df071dced7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|23010399003|18002099003|22082099003|56012099006|11063799006|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	37rYg0W3DVk8ba9J8SaVePKkbNrPX/+W3fYFsN6Fcqi+WxzKHGOt8P84+LY7910Gj9+F+kH0+620B1cgEK7cXKOO9unpkyM0hb4NeCmWdYCtFCAx+hbjMyjVVr0sbkrX70NEmd6OJXR7qfUSYgOCqvflf+MugFjwoPH9ROzKkyA6Zppy/LGBLKQDqZrskisswVl4T1VuoN+zJVf2GLCTQ2bIbx0TH8XJZVik8P7CIzgRs3ST1zaW2qdivc4FFle5tnJyGAUz16fNh+4B5FpexOPZymTtjFWt4RiA5eAKh0Ssac2cvV0HcQWTP7q901GcB8uvJK/scZoujV7VVpNl+SGUXOUd+Dy8DYvkwjU7uXOzN86rswqaO5KrbALgqVP2AIOyjBhqRSwCaoMylxBcFfKQSvAhcmuWahgvk5Om/wq2m3sJJbw459/DJ1H90HwQ5FPuYUwhAvMBaXuXMLW1fw7TJxRfk3MD/n++nJ14qeuiHMS2LaxWwdiupfqeKvVAUKkfpDuXZKiqbam2FoIE1N4fYxFICB1K2QEvnxYkTwcyUce2LhL3v3nw1fjGgWMDPb3w1Jjca2o1fw71yNNvJqNnNMYz9h9VbcjXJtsGAexaoCsnCzqtBw0JUXoB3Qqd73jNo53dVIJYYtx74scrXlZQEOuvxKQKNafC3ISgmhYNKixYIwacIxFb5cUxPhPom62xYdDZ8Rl2sk9GjmujSaqllYn8OoAg9RFXf/iikP0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?C8mZVP7Ezgffi72WJ5pQOrgWdGOgAcklRxZdc7eqxxYUq/waQg/AMuafHV6T?=
 =?us-ascii?Q?XajMcRTKLMtHl9ZdfcwxMrkGE72n+icG8HkWuKuN7BfLH160nreVHnTj+1RY?=
 =?us-ascii?Q?NIAPpuag1dXJ3tqEZP8hvrfehklw/YBfWLbTjH1phCpTUe/lo6OxPl1abFzn?=
 =?us-ascii?Q?1ZAXXjWOcUTtqWUw7b19ByYhVSC3BUyLSQ5FJgHdzBudMTFNTLolQ0Vu7d8c?=
 =?us-ascii?Q?/xtpi4cBqTvBXS/yCX1eayRJHN/PXEoOxvdIuMnjzpEEXgyHbeNK6fu4lRVJ?=
 =?us-ascii?Q?6zSRAEZXVocRXThcGAotvjGSwVAz4kYwp02tvBlR7HUOYeCbS0JIxRheUadT?=
 =?us-ascii?Q?tV3BZsyGxGWol4SjLG4isr9TS5cdZkrIcPIbpHMkeu+t0KS/LD++yc2+F93D?=
 =?us-ascii?Q?d6dMUV/P39RcFTvrKixqB1idv5Retl9qQHA/fgzjQUsLGri+YO8wpdiauZlM?=
 =?us-ascii?Q?kA8cxOFXlmqOrS5ukl1kPdU4goIhJcqeUPHRD7dX9iYMU2KHZh5lKHQymEJH?=
 =?us-ascii?Q?W6e9fxzi/BQ2HTHdNo5fS1R3oshiRQvxFFc0Z2PlHEKUhTJEXWBxthyGIwis?=
 =?us-ascii?Q?Ep4ROm5JLAaLoyqsjKjncyYevPPoHxsGej9bLD4zfcq+b7tiodUu61qOU4Ck?=
 =?us-ascii?Q?CAPe9XMCITKiFm4lfP+WndXn2k+qzXnwIX3sItvIaMFd3+hpJd/d0fNURpRq?=
 =?us-ascii?Q?GLVLwPlMmEDxcFlWZAT4XCbqe/gnIyvg6gKYHwfnOyYdw6Ob1VTOSBR8/rSl?=
 =?us-ascii?Q?RoFmANbCH36pdwEcSa62p+iPzKpODq5fK1VAlesfJjr0lXZE3Qb5hnP2EtXD?=
 =?us-ascii?Q?uMKfPVWRnDqIXZXeaqQA1z+TARaEeY4PbYgkrP3960+13HDu03QjRUYMyDTW?=
 =?us-ascii?Q?9jWrNycTVLq4MxyYovUQmFnbljfQIZ/mE7xG6P9BqrF/G9l+rSuLnnjuENCs?=
 =?us-ascii?Q?wfdoUnVsGcxGV+8aveV7Szi0xXxiSC9ar5Tj4ACTNYO7r1CSVw1O1XC8po17?=
 =?us-ascii?Q?rFyydUIVJsbYsc5JI5trR6O3+72z0noDhpVNZ9Cr47yo2g+4Do7sJSQhM680?=
 =?us-ascii?Q?kWwcRSi93uW61qBhB3QrDDBLMYpBCgYuBF5XNN/e9aI7zrsjfziKpnu74bIs?=
 =?us-ascii?Q?rhFZ542Szt8PzJp5+GW6mqaf10nFuE6wrdB314NjUnZ8x2zpksieQqKMs1Gx?=
 =?us-ascii?Q?Ub9xQ17ETQoI3tujMi+RbHcSeumhA3EicWYUAx9IhHNA0oz/TBvHL/oJsTnz?=
 =?us-ascii?Q?ZZelCMRg0MRpZSCNxy7cec820acrni8bQZcF62QJnYU4TfuqXZQFcrmv2Uj2?=
 =?us-ascii?Q?4q+Vo49ZF5CGlnplUn/RnLS8unLqiU1wMJCOLUph8fBR9t9Vuaje3Kj4J/Zm?=
 =?us-ascii?Q?URp48RnUywmKWnS7MCdAuiNfuE4PD/xMOY4fJi/vTiKGoDpEq2O8cpiQcu4U?=
 =?us-ascii?Q?46X6GrZMzD8y2i7WARn0EAusjv36s5N1emCMWfc3itlmesemJtXGEBpFq9WQ?=
 =?us-ascii?Q?i8/OZHIzGfUn2363Et6xQ5ppmilZ7OR5n0ixJkzqajqfSq2Sv0KmQ2XLQ/qU?=
 =?us-ascii?Q?Ef1KWMR8/K5nkscyFOq0LdN99gL/SILvoTBw0tV0789Ikl6bQTE5vRofeQRS?=
 =?us-ascii?Q?nj6FWqbPyVGRyXE1MxsQVL+tcBLGSdIG9gf/mmYsEOIHO7PGpsEuZqwhNyfq?=
 =?us-ascii?Q?DJubAx4w3DnlB8Oa3Z5rRu2bQxjZzfm6XI307kr1xrkxqWP2XLDUmU3239Z8?=
 =?us-ascii?Q?QrjZMfAJE9z+z/zYSr9Ns3gK2U798Hhgb7jCqKKUCC4X1jeSOyqb?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0cde98d-94dd-4d2a-4395-08df071dced7
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 05:07:51.7134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 11G2TYfY246Zn9PfwGBLiCx+4MX6WmHWlNG7Kh7bOKrbS74+96Ow1EVZRLSLADtNsc+YI+G+CWZMI6kQWKGzTiYN33ghyMofiE4Dz288e89rXuQGoyy5h2ezGQ9Jw+wb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13019

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/es7134.c |  6 ++++++
 sound/soc/codecs/es7241.c |  7 +++++++
 sound/soc/codecs/es8311.c | 17 +++++++++++++++++
 sound/soc/codecs/es8316.c |  9 +++++++++
 sound/soc/codecs/es8323.c | 13 +++++++++++++
 sound/soc/codecs/es8326.c |  9 +++++++++
 sound/soc/codecs/es8328.c |  7 +++++++
 sound/soc/codecs/es8375.c | 12 ++++++++++++
 sound/soc/codecs/es8389.c |  9 +++++++++
 9 files changed, 89 insertions(+)

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
index 6fe3ae41afbd5..e46b85f11d57e 100644
--- a/sound/soc/codecs/es8311.c
+++ b/sound/soc/codecs/es8311.c
@@ -800,12 +800,29 @@ static int es8311_set_bias_level(struct snd_soc_component *component,
 	return 0;
 }
 
+static const u64 es8311_selectable_formats[] = {
+	/* Hi Priority */
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
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
index 24ec8b211cdba..59399476b9d79 100644
--- a/sound/soc/codecs/es8316.c
+++ b/sound/soc/codecs/es8316.c
@@ -566,12 +566,21 @@ static int es8316_mute(struct snd_soc_dai *dai, int mute, int direction)
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

