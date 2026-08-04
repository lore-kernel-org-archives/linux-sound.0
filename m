Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011007.outbound.protection.outlook.com [40.107.74.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1302337F326
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 00:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785804102; cv=fail; b=kkCfx1ktUdxleTqgo74tT4qdAIDfQVx28zh/ep8JUbiCDFXyfqteCV+v5rBEWWtPqV+gzvTQLFJNFSt60NRVj1I3Pr05MDq1lONPFU9NGdDZxt32TP7FN5ehmnuXcbqHCqO10038oLIAyCIpN7pEOF9iltOUXI+z+FH4PbdYBAc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785804102; c=relaxed/simple;
	bh=MdRQhNl4giwH2PcDllVuc/FOlOIjyheJVNO8rvbex5Y=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=B0hw2TU2tyhJDijhd3iMRAgKZo+3rlPObUJxrRa5BPC4o2qDpAdLVXapsRRW+0Kj8m5qWA487/bEcUJGwkOSwH5rBPAQDNzzqABvh04p/oF6TlH2jwWGyZ9AZN7JSukSr9b+2YuVws6XqGq1CHe6CGsoo4imYZIwt3Xl9+J5VFc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=kkPBvnjA; arc=fail smtp.client-ip=40.107.74.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="kkPBvnjA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FgvRdo+Ia0gNRtZq4p4gA7dDcgtf1iOZ7PQTX5UagxRMP6KLnimg+AowQtujLKnRiM/7i5Wrys47EJVOVv6VgIo6JKQYFFgF4aCT4HzXkiO6epUqd1/ognb+rDdZ/OIZ6xVktBtUOheQx9VtfbHRchMunEd2aYAXyvnFUhfwqOMORj6xU1R7CZVXUoX0Z9jPj3gH0Jt0g6HZ/b298c7M/Bo8BqMlh/O90XgvIqTw2Qs2dghREjNr438I2iaOby8B1nGhy7SoZbck1l1RNnbfyXcyUSdB4jngg38cczz8kf2Vp17VYaSjJiXCnLcpKCUqlDjN86egr44pPYEAgyapQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uzTf7Qdu/uoxLLVc2VGS4vdcP+x9oClzAedZujygHmQ=;
 b=mJjXFwaeOerJnxlnI6f9AlLiAwDx/T6zTICo0hnFt71oAnfKJ0UjmQ3wuTaTYMjgWJ9fxsGIWb0j97FlMrTQo1EQumJDMefBhnl45isVIr9ABPNGrdAEgMRb/2E0kU23ukZfKMZwVuykQmha4Vsq+D/QQGkStWQnK1cLn7zj6z+tWMAU4Yrd4MtXbcRdkDx8nH0LPi1ahJixTyDIA4etydcf14bC27ddUfgSSIeaQJqf0tJ3ljbtCX7Ka3CipbjQS1g5hyzuL5/AFhGG9K3IWdEWzDkzMuvbgygJWVXORJ8GLQllECc6k1d9NvzKlxuUbomTHYv9z2yMu4jNoLEwUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uzTf7Qdu/uoxLLVc2VGS4vdcP+x9oClzAedZujygHmQ=;
 b=kkPBvnjA+xPboOpw9EzRbfwX17et4yDIGfaX+GjKkY7+8W2KbMgMQ6fXoF4O3Wt5iLjcLu4K4aRipXYJZorDTUN4BHa6hiBWEZNi+HcFABiC6xu77VdfkjLB3FbCHOa/Lvu7nhGIsD1a7JgfU/9hLwjKYSHaGrTyXECNEpiKCOA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYRPR01MB15651.jpnprd01.prod.outlook.com (2603:1096:405:285::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 00:41:33 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 00:41:33 +0000
Message-ID: <87tspawwci.wl-kuninori.morimoto.gx@renesas.com>
To: Ben Bright <ben.bright@cirrus.com>, David Rhodes
 <david.rhodes@cirrus.com>, Fred Treven <fred.treven@cirrus.com>, James
 Ogletree <jogletre@opensource.cirrus.com>, Jaroslav Kysela
 <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, =?ISO-8859-2?Q?=22Martin_Povi=B9er=22?=
 <povik+lin@cutebit.org>, Richard Fitzgerald <rf@opensource.cirrus.com>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 13/44] ASoC: codecs: cs42*: use .auto_selectable_formats
In-Reply-To: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
References: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 4 Aug 2026 00:41:33 +0000
X-ClientProxiedBy: TY4P286CA0045.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36e::12) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYRPR01MB15651:EE_
X-MS-Office365-Filtering-Correlation-Id: 96de6c67-c1af-41ba-9d84-08def1c1221c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|23010399003|921020|38350700014|18002099003|22082099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	VV15FzS1auIXsdzhM45wIMCVqJ5MXPhoAiBRPmJQmzV4h2iO4+daOLh5aca5rTTLojPU/n8KXmpDTrITpDCbEL5GKKv1dO0Mg+fwWCwN4sJRb9/LALes7V1VPUxUn2/WBsNWSPyGmbrr1lkCFhZHSQlsRvvqgUySoyd5m2q4+PDMt+OMWCD2SCxt094lDU4q7Ls6xcvOfP01M9kxjeusB0t892lIu4K9RGVGMMYzHdxdKV8FSeSnjuFcxEbI/2dB9L+hppYxe3Ufi6m9yNGzbMOO46Mr+ARaa2d2B4NcRFDaBALjttnaKHIh9MjcVHTLBSGGi0T7mdVXEsuW/L30e9SV9m4Ve+izeioyCS0pL3HjgYt4cGbSm9lkpnkZYtqgWV1mW7gsBGaEHaQR1hN4fjL3W0l6sVnbzeGMqPjoCbh70eVMB6/uJvGHa5zXOHRAEsOYxoM5cgmfNju/TnmxplIrMohM4PzvQgiFmBuTF8xRWNU7P09C4uyX0Pdghf3PPfSPc4Aj3kHvqmdRE9A/XEZ1bmOR1gfnN3f/oOyKNc9ztKcT13jMLv5iqniH+7VC5cA+YJnRWGuL+jy0k91aGMwHuyR5sKt1jhuB3qoV+XPi2JXjg4TUtyLgCHwRGaocM6v+Qef6Ie0zqcybym8Xm6soIMYTZVxtPQUxWgBvRTR3cnOO6/iR1g9Omw391KFNVL2pFfhk4tobJwKRQdQyORtPC0Gt5U84U9VZt5LUWxs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(23010399003)(921020)(38350700014)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/RKSTzW2TKMG7pU4HU8ybSmxRwIwAFGvvixIrWBDn3TynU9dcL7B5v1kd2nJ?=
 =?us-ascii?Q?zfnvI700ur72A5HZ+ChX/L9slBWjFw4SlByZPhZ2Y9OQMQff0x44vXmK90Pr?=
 =?us-ascii?Q?HTsDM/LlSnTEWAP6H7/yupevznUBmulJHHwzm6gFJvXrHkkliL2iKPwQo/6G?=
 =?us-ascii?Q?7m2xtYa7CaQEf4JPqa/X7H2+mfTtb6iZHybXBwl7y0VnUwKqPFXWv1RcO/a8?=
 =?us-ascii?Q?F1j5ZvUW7dN4X/tMKcO8QAlx4sC1RppEI+eQbVOGTjzIS0sEjlhIWMhLYJiF?=
 =?us-ascii?Q?0i43DEv16Iu8LsT3YykbXao8b0vc93yibeKuX212x8XIRiG9lAUabarj3FrD?=
 =?us-ascii?Q?YhvjLrpCaGIIfkBPlXtlY9BtE/2zrQ/a1fcJCJnzPdG0s/oCwXMeU4L9z9Tt?=
 =?us-ascii?Q?OmW5+IQe2WDSPckOjK0HKMmVeO31P0NabQELB2bkOKLhtDbfXiQdu3wwOB4m?=
 =?us-ascii?Q?3ByCeYHf+ugLj5RfnbqqHId5V0KbJ77t86lMJHakkK10CfDO9VyUoHHUtnxW?=
 =?us-ascii?Q?LBLOfjCAIqOcB7+RsPrHAP6N9Q08QDy9e2pvRuSI1BMGvTipsz+PmJzwjkUC?=
 =?us-ascii?Q?jcUBJCpDJ0oja/bKluHJX69Mm+BT6ZBgAxEQgf69BzcjyD9uvGLerwu8e0C2?=
 =?us-ascii?Q?DCe8v845vTPCBcBQUhCEtizGtU5t03VFbuuCzujk1ZoqxQF0tpfYacLhe9R0?=
 =?us-ascii?Q?d60tqrO2IPsXGdvDEE//040wos+oJSwysc2uxyuC+bGfuj+lxFDSPvjvo46E?=
 =?us-ascii?Q?XSYEMVmoDx8nkxSWPu0YjPTLGfbY8DZLRnWHN3s/Ko1dU+2B7g0vyMeAHzLZ?=
 =?us-ascii?Q?b1rAAIKzUXOkEqdaImCL9qP6gIHYeLJmKS1yilito9QRIyLtKZEKi1UWb6td?=
 =?us-ascii?Q?xQeGkR3+ZXSet8KD5okKpJTuGPCoOcZD2HbLKSWGA0OLDJzL2yhHyFiEbcxb?=
 =?us-ascii?Q?VknHP0JCCpPCiDt19r/O6gOw6L68QkHbGGzdOVet+qxmF3XlCc1s/v3creV5?=
 =?us-ascii?Q?QX4sYgnkippupMStRWQ9LcW+uHgtJXV5KJzOBzscFlzMWcRkcY8N3TY3doyY?=
 =?us-ascii?Q?zGFcOVH5/5Fogo1qQ2VQrr1Xn/Na+Kt57gTb8Z1ipNr9ekKFtsJRvbzoLbjq?=
 =?us-ascii?Q?BZxHyaZNVNcIe3gdryEWqcHlw2oC/a5QPb5JGBY7iRtAn99SyjxW7Y/zteJm?=
 =?us-ascii?Q?5ND0QErl8uqd1KOzHtMIehO+br4gR2q8rDH/l+0l8I0vo0H5t2oOXhWXhqSG?=
 =?us-ascii?Q?yV/P17Qq31uT8z4H/bsCRzkza9IFyQH2Z72BfEzl1r/XLLYeLIVFLUscwTfQ?=
 =?us-ascii?Q?xnd3JW1St6GI8jx62rg6ITjdYG3+0clhMAaxcM9LcR5NYFPJmse/Pf6wXK9V?=
 =?us-ascii?Q?HITRPwg7bBWOU5vIDu3E+09NjB+XDjKiMAWXvnfJ88MeUdm2eDBtJCrnqgTC?=
 =?us-ascii?Q?mVNRPUz80Cw8bJJafasN4LJ+WzEg9H5tucQR/BUIlK4sa/oZWtBqWcYDcsnt?=
 =?us-ascii?Q?UyhaEbV1q4f96JnoJXv4SuczLl7UsY7WcFahEHD+KuWfESTWS47i6zhqqIJe?=
 =?us-ascii?Q?Nn/Eie51jhtzMLsX+Ih3c5LBEDbog4OfpAnAU9k8FWUxSguzrNXxuYtqWjmJ?=
 =?us-ascii?Q?/t52BCxloTCQH7vAMAPTMVlf7sCQ9Ek5WQWfihhdeL0dgy5eISRA4VFpimch?=
 =?us-ascii?Q?yzydicwT2MrfnQ1RbMP9FE38P79FV113+JN/VuD1hLApTXxd+Q/vCWe8Pnvk?=
 =?us-ascii?Q?d5tZlrLjDrLWcIC9hmxreD4szLFwRIeB6braIhAJF/RBgBK5ygzM?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96de6c67-c1af-41ba-9d84-08def1c1221c
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 00:41:33.8135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mKkjnv6nTjxh39jwLlpZGt8LoNNAoysWA6g3lxjsaPVxKsfVzyGjth8zD1tZl+qhcghWyplmc+FdE00xd41qGmn2qXFslaMhLZ+vuKHEZmBH6KHmiAWjxQosuHXFGa5L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15651

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/cs40l50-codec.c |  9 +++++++++
 sound/soc/codecs/cs4234.c        |  9 +++++++++
 sound/soc/codecs/cs4265.c        |  7 +++++++
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
 sound/soc/codecs/cs4349.c        |  7 +++++++
 sound/soc/codecs/cs48l32.c       | 12 ++++++++++++
 17 files changed, 148 insertions(+)

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
index 286d5ca298541..019f7333e75fd 100644
--- a/sound/soc/codecs/cs4265.c
+++ b/sound/soc/codecs/cs4265.c
@@ -495,11 +495,18 @@ static int cs4265_set_bias_level(struct snd_soc_component *component,
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_U24_LE | \
 			SNDRV_PCM_FMTBIT_S32_LE | SNDRV_PCM_FMTBIT_U32_LE)
 
+static const u64 cs4265_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
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
index 9a7f701757174..7ed89c1388f0a 100644
--- a/sound/soc/codecs/cs4349.c
+++ b/sound/soc/codecs/cs4349.c
@@ -228,10 +228,17 @@ static const struct snd_soc_dapm_route cs4349_routes[] = {
 
 #define CS4349_PCM_RATES SNDRV_PCM_RATE_8000_192000
 
+static const u64 cs4349_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
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
index a9967771124e5..6ebf35572c93f 100644
--- a/sound/soc/codecs/cs48l32.c
+++ b/sound/soc/codecs/cs48l32.c
@@ -2361,6 +2361,16 @@ static int cs48l32_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
 	return 0;
 }
 
+static const u64 cs48l32_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops cs48l32_dai_ops = {
 	.probe = &cs48l32_asp_dai_probe,
 	.startup = &cs48l32_startup,
@@ -2368,6 +2378,8 @@ static const struct snd_soc_dai_ops cs48l32_dai_ops = {
 	.set_tdm_slot = &cs48l32_set_tdm_slot,
 	.hw_params = &cs48l32_hw_params,
 	.set_sysclk = &cs48l32_dai_set_sysclk,
+	.auto_selectable_formats = &cs48l32_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static int cs48l32_sysclk_ev(struct snd_soc_dapm_widget *w,
-- 
2.53.0

