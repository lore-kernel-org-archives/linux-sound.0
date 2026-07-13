Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011043.outbound.protection.outlook.com [40.107.74.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADBD2CCC5
	for <linux-sound@vger.kernel.org>; Mon, 13 Jul 2026 00:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783902450; cv=fail; b=UOc7NzRGjBScIiFJ1pYmk6L21FsGkHhBmctT19Tn0dxQaGxIsqUr/LXCB8+h2pQWTMJrF/RMuPJHlmfTawz5Csq3xesWgJr6AJyfaRndTTjf2FryMpk1ou83D2VotndZ69yJsKDFN3wT0V1m3tC5Mq4V3k/SYXC3KoKVjGiEJDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783902450; c=relaxed/simple;
	bh=KHpHBx4NLE6RQDv6MQldyNCL2xRlcC+UB5oafL+BaRA=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=lW50/OHyvTUik+MymDmLWi9a4hwAD87QcMB8OfxSwZawOpHtTNj8JD8UIqcvOcUsgWgdFZuTu5b2T7L15D6riDmfkP8e/cC/PLhSpCQhboYRsx0WOMKFW7pjWj8yBwoRh9v++Q27iGIIvRTv6GJXI/i0WXovKTLOj+Z5HXWFG/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ALG9RmTU; arc=fail smtp.client-ip=40.107.74.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ALG9RmTU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ana6Tx8VapaWdckt5i4lgn58v8atIFYkmgsFcOF1Kx2HkiBMKDqfgyRD65MKaXuMCw/mQLwIyglCMGgNJo+1RMUJAjuxbBsNHJekI3S60XU/gtejjld15cRxMHxPn0yUAFOWWVJZhvYcxQ8TdQlJldxKFXRIqx97w6/gn8g1uf5zNhYDker1KrNlwBXJXBlEBiHdLaWZ3KtTHHqaEaFdlkUV8+mdyXYNKYWAS/qQqasXKw+OQx4Bb66/5ENrpxmNa7w6EDNU2ndTIKwSzYHpvBTNyBWBjA0GSJkv/RvtIEVa6mve5/BLO6/q0rbILoaQa8nq1KlPX9+sLPyrPhxW7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A2CEgrABOfuZGQxpMWmvnaAh9ljk3OSGPhBgnK/xmYI=;
 b=eOMEjo9EvekIWabSMQpHUFhp3/Bv2kkdBJRO9VVeUjI8lpCsa7cCjuStlDcrs9c5Y7qO+kUVN/UbCJCfos5BLDP3jHRdfilPb9hH5khxWQbNoNkhpFRdTy2tXyEs/8yrRZ+LFkJcLPcWILo3+B+LdvVvi1q0LKu/mVFRcPmm7xNkB1CRPyLkIjXIbQ7CpE61/J3nBjFdJtHd3zoX+he868sUDVOnh8y99qkD5XzxsLT0nXevdFDlQU+BijOXYf4Qhg+bxWCKBhyvbbVE2G5W5sa/CDDP1PAGwkyfUHsHvch3seeeM32FOAlIrdOuRaqwQHk94y/9O79AjVqEpqHUjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A2CEgrABOfuZGQxpMWmvnaAh9ljk3OSGPhBgnK/xmYI=;
 b=ALG9RmTU1Vz5cXo1W786/Z9cV2I8veSjaECrc6XjSf2FyqUlRXO7h0QuEUpdalN1+QLwLcMu+vNjFnjRiC9U5j7zTv4D1so0JOnbXUKRWviCVWOmgBwiMX7ZhnoPae3unRfO8fW8OecwNIXLZohQm1n+BxPmkQKa3jNpycpuA6w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS9PR01MB13304.jpnprd01.prod.outlook.com (2603:1096:604:30d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Mon, 13 Jul
 2026 00:27:26 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0202.014; Mon, 13 Jul 2026
 00:27:26 +0000
Message-ID: <87ldbf20pe.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 3/5] ASoC: au1x: use .auto_selectable_formats
In-Reply-To: <87pl0r20qo.wl-kuninori.morimoto.gx@renesas.com>
References: <87pl0r20qo.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 13 Jul 2026 00:27:26 +0000
X-ClientProxiedBy: TY6P301CA0023.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:3bf::15) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS9PR01MB13304:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bf2f1c7-1ffa-476a-b0cf-08dee07583ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|52116014|1800799024|56012099006|11063799006|6133799003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	y/8CQbMvHGeOU5X5OZ4j4NfyFIz1L/KHuKbi86WSmeG0XxqjzVhA5vhlUqekk3fh9hRFckIDG6KQ2WNaI/DhxVrxCwSP5eA5NL4CWIyF67J8MGEzOpLiFwLw6qFaDTcavzNpgUQQfGmdmUb1EPaxvQT5Q3IOe/7CTHDPtwUMSwGdgtEn8D23yOoeBpdfDUjMDHLh5iUlw/gwzGzhnMnbtKOp1/c8Ah9u9kPr0Mff/wl7vU35ucKfv6r5cxl4/GsLvg85cTltNnMyIeR57CQLRELed94krTmugp6HAuDK9GtZSSaChwO3qpep0KBKkY1WaN4ZWeAISpkDiytnMTHNijsKx8a17Gpfn2BNHelMI0lY015naAv2Xir/377LcOmQzZzyjPwrLbF3Y1ae4mY4Fsis1CELTws92io0gxlJzaczKWDhPBgLYekLFeGrKZABJEECYlJM6LU7sVK0QIhw6t7wlqZxjH0YWvWC7ZX/H04tRPJjCH5sz73oBxrznJT3oLk8bVRFaXXF2ZM8z7G1jxJzhnUOj+BWrIzydyFjnbirTHg/+sbt1dXRFix7ap3mwYpuuQPKEveIjl/rTky5+zmi12n9W1wa0rsIwjU1BdOD4fgWm5wzzJlTlQ1sc9CF1YelWxppUmSI5OGCPaO0p++XEIFCMYXbIdTZntvOHZNzNSD1JXfcomKT88eTKV4g9ALHkScQ01nSvTvotIZ0LkTPmzByOQeShZx6nM10XHE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(52116014)(1800799024)(56012099006)(11063799006)(6133799003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5NmkqUlzayL5mBq1cnnv4OT5ntf+nuUjaXYhs6UvCeK1QoiiCRqkkFUr5VO8?=
 =?us-ascii?Q?z++6AlSePWXDksfS2oejSZz8wOb6J3x7jr/VyVgB6G5Q0qz6gn4POM3I0mWJ?=
 =?us-ascii?Q?Yjjqlay6ouWz/NDCE+YjwVuQqk/LBDwH7nzCqugDs5+E/HocM7B6AIMUZvVb?=
 =?us-ascii?Q?8RI3ZEfUuZbj8p5ZG+9DZG1vvRs1AXJeIMaSBd5+l+G8YB1Jd7IdlZ3iBS52?=
 =?us-ascii?Q?awUXQHwlBTIBdFEZbsnk2KsTTeNfc7rFokpm/0U7DVNHu29L1+ZOAmXtwytM?=
 =?us-ascii?Q?cpk7bxWa2a1Q3xz7GwUYvL8TA9iy08Ddf6UovAsPvT9BYIP3vwGSCcsJR3mm?=
 =?us-ascii?Q?CouFW/Fj1uj74BvqHuLBGMyaYwPQgwWTItfX8rVA1Us+NK8XPRBeKMvzaG7F?=
 =?us-ascii?Q?BAYgU/wdR+n4KpzQ5/AtGZdJImNYlbrfhieTV/HQjEO1wSnbmIMlqMfFUiyB?=
 =?us-ascii?Q?cL2SxeBEaM+uaZdTS3MVZ1K4iohZ5/FuPCD+/o078hq03ZE3TlcDGfwbFi4Y?=
 =?us-ascii?Q?iGvqstLAYsoARMrrIDP4EIbwJCRY20XSCGm1oVL/sRrVHoIK+ooDGLHmUHB8?=
 =?us-ascii?Q?VmiXUYfdqzYGoZm07qj4dKLLM1744Sox2wJiwIz51MCLPIJFZicg7b1LlDUJ?=
 =?us-ascii?Q?LA6mHejh0klv4OxOnfUkrGXEU0lkbICZ2d7cQGWgB/bfhb6erLYSbeJ+/M9x?=
 =?us-ascii?Q?bRBpb4/VZWmwsw10fYqo0CNGa+/CWfUBHBdUXt9xlu2G1l77y8zwc9+XA+9y?=
 =?us-ascii?Q?shNSNUnEnkuXGIkXr1BQamyVMRUz+0HdIlDYg8Ehp9oKPXw8trVl2tMvUwee?=
 =?us-ascii?Q?Z6NKf87en2d36SMBLULYiJR7da5LTgbvHesE8jRVqHXhYKarEowXjJeTIi+J?=
 =?us-ascii?Q?0AO1oEeQK7VX+/d+svI8fNOUH9WCsda4t7wINs6lCYEr7oVVELxZfPfh/3Dn?=
 =?us-ascii?Q?zDgMC8YWzC1WxVkNiGPhC2PXhGcy4z2/VmxsXSQ9KnZ89GzwBvKIrY27q+Ay?=
 =?us-ascii?Q?NiEOEICS5maXfDiCsFZAg9rLNNX79UVrYNmwj2YWMnP/Fq7B2aMGtqueXEhr?=
 =?us-ascii?Q?OQm84MjsnXWeZ/aBZ4lvNMMVQANupuHrPAEWLdHRMgyl2a3L7cMrsKEeS7JV?=
 =?us-ascii?Q?Ef6UdW14NbzMKIyIZEkEPTwVC+N4DJ56fmp9cFGe6eKcuxCibvki0qVYv0Zt?=
 =?us-ascii?Q?7Tf/2x6knRsRsbZ6Vgp5fwO4s84+XeRgTL09Fufnylg1z3jiHGPBwrfW4A/Q?=
 =?us-ascii?Q?nQu5KARdTLyX8L27nciqpGjEyDy1FKLkag3xrZ3teG5qKwm5cqD280WqFL9T?=
 =?us-ascii?Q?zNBImq3RzegF/wh88sXddHJf+YO36nN1ahBd+aKIKxVBeg4Lo2O6gOSLN2VW?=
 =?us-ascii?Q?J3RLQ3uyudE3juLiHmHq2OpJw28Y5gie7BsR1HJH3OO+NC/b1E+FtxYcaRbX?=
 =?us-ascii?Q?yrF7iy3T55kUgJJ2SQ6L0KvMaGjXSHwGHy14oiOMQHV9WdjbMtbrF1+MDd4/?=
 =?us-ascii?Q?TSv8YnD61ol1zj6NefyHdgQu/dc6VPsYKDqNcMj9Zsqsk2Ysz0NihZMslpXA?=
 =?us-ascii?Q?mDwLLbcnFLtF7ruPZ9oAginJR7cbfk7+5u5LEVAiGfhREB3qYSVgJWmL2dkh?=
 =?us-ascii?Q?qgQv8RR/f34F5End+RjWpozBUczwqufls3X6qR3XsMubeQmNqS2ehJLq7AWX?=
 =?us-ascii?Q?LugWaN0mp5FJtt/Q/4v3fBB8P1ChjeNt9bK2O0Ix9xkPVN4Di+Ds50GWPAGy?=
 =?us-ascii?Q?Li41bNFcdynaKTiJU34IhkzW7Q8woDs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bf2f1c7-1ffa-476a-b0cf-08dee07583ef
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 00:27:26.4049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1H+fqe9dlJlAVOg6GGxwztsmgyP+UV4kUDA6l6Go8gFpyr8Y7LkNZJCvgBSv/sDP9XQcnrnsSVZ63WNwCg5B6ZnWc3usa4ASO4GKDztsmghWhrxXVY56ePiuo9WmmKpZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB13304

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/au1x/i2sc.c    | 11 +++++++++++
 sound/soc/au1x/psc-i2s.c | 11 +++++++++++
 2 files changed, 22 insertions(+)

diff --git a/sound/soc/au1x/i2sc.c b/sound/soc/au1x/i2sc.c
index 57735004f4166..0e9c7eef9ee84 100644
--- a/sound/soc/au1x/i2sc.c
+++ b/sound/soc/au1x/i2sc.c
@@ -202,11 +202,22 @@ static int au1xi2s_startup(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static const u64 au1xi2s_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops au1xi2s_dai_ops = {
 	.startup	= au1xi2s_startup,
 	.trigger	= au1xi2s_trigger,
 	.hw_params	= au1xi2s_hw_params,
 	.set_fmt	= au1xi2s_set_fmt,
+	.auto_selectable_formats	= &au1xi2s_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver au1xi2s_dai_driver = {
diff --git a/sound/soc/au1x/psc-i2s.c b/sound/soc/au1x/psc-i2s.c
index bf59105fcb7a6..72aa5177147f7 100644
--- a/sound/soc/au1x/psc-i2s.c
+++ b/sound/soc/au1x/psc-i2s.c
@@ -262,11 +262,22 @@ static int au1xpsc_i2s_startup(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static const u64 au1xpsc_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops au1xpsc_i2s_dai_ops = {
 	.startup	= au1xpsc_i2s_startup,
 	.trigger	= au1xpsc_i2s_trigger,
 	.hw_params	= au1xpsc_i2s_hw_params,
 	.set_fmt	= au1xpsc_i2s_set_fmt,
+	.auto_selectable_formats	= &au1xpsc_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_dai_driver au1xpsc_i2s_dai_template = {
-- 
2.53.0

