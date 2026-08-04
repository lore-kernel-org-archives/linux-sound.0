Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011022.outbound.protection.outlook.com [52.101.125.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF778386455
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 00:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785804234; cv=fail; b=PoXSMLg89WB8Q/U1c6C/WqtylHK6uaLZFe+q+oExSuMQvX+6bILCdkdFKAK3j1ftMVNn/vbPf3RLD7RdSuabXSpfwel91eMRJ3kWHwFuROMAmjO3Bsh5gpudCcnrmT9975r3IEXXF75p8RvZtmEZrCfIaQNdXyKOE1nil7SJVjM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785804234; c=relaxed/simple;
	bh=IKjshXzhuQYk2HenkX5TBX7jPStWvIeSRCQ+3zfDlH8=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=cTW6QsK6+Mu8y29wF2dNSWikjuWFvub1aBHnWKraKuRL2C01+2YcmXg3i0g9DqKufRWEwbNxcZv6fVGFLr7wcg+b5I49ItwnqOprOozT7WOvnFHjwBDmLWEcoE6YK3HH5QuN77F+Dttd9Q55FlO/GVucOkgBRcCnyBIyZqCPfws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=UMN00w7D; arc=fail smtp.client-ip=52.101.125.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="UMN00w7D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i6HTDmGBiVJgAbiP2wHIa7T/OvKh2zjOnJM8kjpnm/5KGia4V7pEJabSl90tyJ7+8DqeT5tQXaCJmn6n1g8A0yCBFtUZ6LLo26zVSFM3JJywvG59womrOP8JO84WxLgZe63Dgkg0eZHa0Lrd8dOSiomniK9BcMKZBVZsuGBCdy+orCZ7ox4NxtO7FctC2w6dLjZtdL7wnSnw3Eos5pXFyqFV7XLSS80W6AffG3zk3INJkmvD9iygtR4xcX86ws9criDXRx/Zhf+ud2JL7P+WWsKhMnzayryT84sS8DnRYpJzlkvbzAPKDZ6FcOyEWV7FOUh//uIGY2OKIUvZEWVnog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iQu+9SiWDgk31zCLYLyRx00uBeCx2VTNN0uqD6xtQQ4=;
 b=k/xVnW8MF/eaZ93innx4tbc9njFBNescFlercjd5cBiiYQHI+z1yUUh3lpw4ku8xgwkPdeAelIwL2je6vcNo1eIaw9UHTJsg+5f4z3HdMmkDKGqKtetFCB9lcPerrB9HH7ni+9d9I3Ml/mz6og7j+lcOujRS4pycw3r72jDx7JsCLjhmyMSX5L+0n3ZLhAZy6HcIy1qzZg2quIwx7UslRvLwJUIqu6ezty7mhRBJFe0GitZl9LKWxlRSsyIiUJHHdDMcbSYZxm4q7dySXyWidXmcGrl1K9RAbEuWsi9UvXqKHFFixynAG6BfOXvxbQnQSX+a/EUBzezYfjlUZ4IEyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iQu+9SiWDgk31zCLYLyRx00uBeCx2VTNN0uqD6xtQQ4=;
 b=UMN00w7DlDJryftCOSa2X+AncULMzlMMWLNkPBsAF5O4gKSB6BWMzUG63wLzOtx9kkaZC6mmoGlaNn3b8c3NnuGmnhihteEQF13yDNZzHQE5x7GjjGsTV3LFsm3iPSv2+JJ1XxP9jswsJZxYRYmqZZGl20xagncV1jQobnW/2CQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB18293.jpnprd01.prod.outlook.com (2603:1096:405:3ef::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 00:43:51 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 00:43:50 +0000
Message-ID: <87se4uvho9.wl-kuninori.morimoto.gx@renesas.com>
To: Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>, Kevin Lu <kevin-lu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sen Wang <sen@ti.com>, Shenghao Ding <shenghao-ding@ti.com>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 39/44] ASoC: codecs: tlv320*: use .auto_selectable_formats
In-Reply-To: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
References: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 4 Aug 2026 00:43:50 +0000
X-ClientProxiedBy: TY6P286CA0011.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b8::9) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB18293:EE_
X-MS-Office365-Filtering-Correlation-Id: 15066e2b-6beb-48df-9214-08def1c173ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|376014|1800799024|366016|38350700014|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	3y8epkPCUmPsgTChgB7xG962jIX0BWoF/IemN/dxkFUc0DvK8u7/cJaKoV0FDbEQZS6IR7TR1i2ZH9ALMI8Lp094+d4K/2/+r0fGb9brnqboh1ZiMx8+TvQy5jyTMWn8FNa/sSAoQpz7/r5fXIYWifcwOiFuc2zjrTHOteOOWRsv7RDLaCtgzAyDX8VD5isJvIo9HQIRZLV76YcqXq/RBzlztf/m3RzIDUw21f+95VSMJahtLVq2r88ysK/mW3GvfJuzOpZoQadA3p2YBcvz0Cp2Pwm3UGULOJmeNvvFbPpCoddxgTfTbdNaayGXEJWMAt3GK7LPvw7BepDMFiN3yZIjEFA50EJDzhiUeNEFc8qvflThuF48fbBIAwG1MsmSE9aEajDi9nyoNlbSjw3r/AQivc6DaUyWCAk3lMC5s0l/4TUswyjKf/jijDNb7r+PPMdDIezGREkSHxs6TBlO+Y9A3fXn3WJ3sDDIzLqVW1ybuc1mVdrcRBK6LZuDNmjtZe8f4xtX841eLzOr1tc3wH8k6FXWxLubuj7WWuEU8zipDi5aptzpH86c05pqFLdmgGXGpLGKIeao5UhsIjagPo5KEfRzO6ba2HzdCtYuicttaBF1mTb+c28a1Vst7gUyzNZOaz3gFJ3GpPmikjeKVwx3kXyhjfFxHJgM48LkCg/IiFSdkuBCIjnVxjeZFbHYyuDUTVzzWjLV0WkeToVWVQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(376014)(1800799024)(366016)(38350700014)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LIjyl1rtYTXHZ15iQKEbYx6a7WIb2ifUH1d21QCSo/UJg7KUyzzycu/Eoylk?=
 =?us-ascii?Q?eJ70tjNOn/emEsRI7YH2218vkJe6qhG/1TOzYrH3Ajnr8ce0v09biErXHTRW?=
 =?us-ascii?Q?InnwGms3XkPq0xQlQjqoOkJg5qBjsq6xdzU1zS8LBD/dHI4Vzbs52ShZVfzZ?=
 =?us-ascii?Q?LuXl6/JkTGi9Xa0HrSQNX+b6aU/HsoRf2amtgllZbH8Md4a0isgcQTkzA4De?=
 =?us-ascii?Q?/UitK+KNYTc4Cn0rGfH8UKWtIh9CA7P3cvWbY5IXxTAvrO+9SFk5yswgmjhq?=
 =?us-ascii?Q?AgJpCcaEXTPSEItCYdWm9jIbD+EHXylY8rYdaNn3dT9e2oLyPsXBsJIi6aFe?=
 =?us-ascii?Q?prAoF/pLroFyioBuW8FdbqAoV6vQA9if4qg+NwDeclLPf8GDh44QcduFTxaP?=
 =?us-ascii?Q?KNnMOj69CNmf52sVj4ro1lrJG/MTGC4BL3e1mHXEApiPh1/45zsDxbqeesty?=
 =?us-ascii?Q?3zb9d68oL8NhdMNF8lsm5CS+UoyCcX8/oKZ6Wps0Mf0kUvQCPPZV/Cnxlj5S?=
 =?us-ascii?Q?uAw7dvXocE7WUA+3EgqlJIq889CVlJ+fvgE0EzJzaZ1FLF6bt8DC78n5mDDd?=
 =?us-ascii?Q?UIEw+NikIgN1ooj0Ix/HUox75GdP1hjX21bLYd6nnuOLxzLVPj5FVWvomQ0H?=
 =?us-ascii?Q?6UXrctZbBorQJRx+pXT08RhAfo3ECrXBZ2bEdEaKCZdlfB1DPoxw9jwpTKZe?=
 =?us-ascii?Q?wBGzmKkehA8zfavyJgrq0FQ1EC0v6WH8spAhtSCyM1oBODRLpmSkabi6VUam?=
 =?us-ascii?Q?45+Nv75/bddnR4zyzcxIhtsEKhqE6xUe5fYM4DSwBYA5vCHpM9ir59C1w3JW?=
 =?us-ascii?Q?GYQuKbKPS48k7d4oZ4DLdNRdWqhBBDamJ8PiDf4MUzgCoJ/CohZTCvFnBvMD?=
 =?us-ascii?Q?azmeKN2TesRDfQisGB4744TyQlILTWVvxFglJ+XlZFfdNWO3Sv5hdUlxZa6M?=
 =?us-ascii?Q?mKKE+Z6lRFgx3JwTYPpI132kFAXHwjmVP8asSjQ/lhbZ4HxN2HfhSt1OcF+U?=
 =?us-ascii?Q?U9ausB5iwVZALjFcCV4fz5cDu/p1wI9gvEO0c9W6Y9ZEU8i1gQ3QUaFOzGlS?=
 =?us-ascii?Q?RXSJwlyZQUc/yhsBqleafzzitW5KGG5iYmiIy74XMRhgUZuh/KSDeRSWeea0?=
 =?us-ascii?Q?ozUASxV19wxU4bB0k0psF6+qymcTSQSPLd731v4+E4e8/SMfuKBNH9IU6cKW?=
 =?us-ascii?Q?ZOXxeXAwdqSWu8PxV2hZ67jQuDBcPbt3AflSy4IEtAquAmxCn/LgkxTHG+YE?=
 =?us-ascii?Q?3ojrUtDkpmSk8b/oXPz65h7pQ4T9mFuvAbZkUTa/LfLwPiol1q2d71d5TgDm?=
 =?us-ascii?Q?tD2pSylElVdjLkxa3epwuTFwbxdH6o+R3+qRlsXPJ9bIN6A+vFiBBbADuq20?=
 =?us-ascii?Q?oGdHKpPFDRVOOkyyz/plM/yRUXKMTrMvPc6QyVN/00A3TnPEe6PsBGmNmIou?=
 =?us-ascii?Q?8hh/a30EiGDtsq2tmpahoxknxmVvjaO/a55gCWvQOgEydq1ePy1TLJoCz3d1?=
 =?us-ascii?Q?RH3Iyi2psMHrBov/lOAb77W1IL8zutgShcbqBlxdHYAWzvyT8xMltwhFAwTS?=
 =?us-ascii?Q?B9z07vlzodObJJrMi755saI2r3yCYZmeD2xF6b0kQMOPbQWvefhDifin7V2X?=
 =?us-ascii?Q?lPU6pqNhmwMPlR202kVHufulBUwVssh6d4P/tZh4L6oE/lfkuwlLKe/QxF4I?=
 =?us-ascii?Q?Afif7x2S2XQEaD6pg52+gp9JZgktHiA7WbwYtJag/Y6CtBD3hbx2X76Cn3JE?=
 =?us-ascii?Q?mCjWfSx+SQquwZ1kvOy0WRbQaEeMSR4/cuH5dRRHsZpG4nv7I55T?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15066e2b-6beb-48df-9214-08def1c173ba
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 00:43:50.8267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kj2anQ4YY9ZIYSM1YbfV+s23T8P1+OjwJpYn4OPiF33MqH/BgrI0/JYP5eEd9N344re8aqH9a3QktC6IXs8LodKvfOH8kL2VxHSVRvxUeLZlzbQNMLv/gmiREpTf7MqC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB18293

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
index 1d2e0ea6d4fed..a39bbad5023b1 100644
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

