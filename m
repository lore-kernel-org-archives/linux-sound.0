Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011041.outbound.protection.outlook.com [52.101.125.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644A31D6DBB
	for <linux-sound@vger.kernel.org>; Mon,  3 Feb 2025 06:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738563681; cv=fail; b=u4URabOVheaxqCuYBnZkPool7c8/q20yIi65qlZCS1bUmpEenITpZRM9y8OAEBMAIGdg3FLBgfIGmmN47xpxP9DDMFaZQkEkLPJH+UHDms555VCLa/YbWzntiT2ZhTS3P0435ytXFgAn2H3tfehCFt2QCh85wcNOA5tKd2stz9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738563681; c=relaxed/simple;
	bh=IVGnLprdo0zGKCi1LJIPIKnCNfZMYIIQLgf649tKQBM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ZDPHLsYnKDHsr8y3zZE8mRUr8F9Qm43al8Tj4LbXwYpDM8sFLD+DcXSM6AvJaGCehyaZhsXfw+Jqn81gNrUTHrxgoWQ1QNgk4QDW4hG4731n6ySm9yh2VYQPxSwAqmQ6939ykpeXEpjqxSexGN8a5bI4nXQ6q8mPB/tFryIUtQc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Gm4ZNJ6j; arc=fail smtp.client-ip=52.101.125.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Gm4ZNJ6j"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hFc2U8sT8NU970Sf12d5AQINZxUA6s71lhYrwDTspVxt/AmHde+FA6++yjPrKtYKC5izVXNP/rNMTOGAPB1iSKhorFdkSwJU+hqNIWpzmY3BI2BPnZ3Q5pZWXC4XkrhTVaNZChKYBOe14i3JaabjW856+7mQDjQ7fHVyj5i1My+9F4WJ+V/kWcNOR8e8Cw68g4/yXwB60jpZQrIqanSEdBQvumgVBdwr3lAbOsAuQZgwI4nLLJc/s63Od9JZDL9cRdNvR0ES1lTwsTV6IwwBILHqAxLAz3QwEeILkhuWL0UkM0pMl4/zQ1jLnh0d7pij+r3iIwyOQmAMqu0Qto9q8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vTz+vqdbADRFQolMei7rN2GF79qipJy6VvBA0f6lK+w=;
 b=HQjxcG8deoMylYoz9qmJZPRIOCgW60k7i2GKKspsHDegE43H7+OCk12lUTLOsMbOLGZ31vPjC2hI1jqPoUyFVCFS0DwtUluJjP6oUysL9Hgg7+uqkZD2uYFiVGNX6Y/Ns1PhV+S92Rrrs/DqFF/S8WxB/v5LvIHz+aYYuPXD7MecoFBe0x9aUQWEFgAln84YPWjwZZ0BC2buT+3cx7iYgNPR1KPFhG9L59Gq7e9coU3fvJkpZhzEP3sF5gkWApLkHChOhMXh98jfl86I/7l6Nfxo7BrfzkqNzw4js4O49Ct9O7Ks5bNMrlSzCih+rl/f7IzxSIKSHRWICjIc8ipi5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vTz+vqdbADRFQolMei7rN2GF79qipJy6VvBA0f6lK+w=;
 b=Gm4ZNJ6j7n+4Slkj73gc2wdd2FpfgNkJjeEuPGTrR3pYJaJaQO/sak+K/ydBtD5i6frE1o2BV1kTTXZEuarFVL/m9FmXMtn9rcRO6Z4YHNVP6rZYcxDyrOfXHodSALGOoHDxAdjmJp07eWxjulmRu9A2lBTCm52gXvGCGH8CTGo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB11036.jpnprd01.prod.outlook.com
 (2603:1096:400:3ad::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Mon, 3 Feb
 2025 06:21:17 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8398.025; Mon, 3 Feb 2025
 06:21:17 +0000
Message-ID: <87v7trr1k2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 5/6] ASoC: audio-graph-card: use snd_soc_ret()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <8734gvsg5i.wl-kuninori.morimoto.gx@renesas.com>
References: <8734gvsg5i.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 3 Feb 2025 06:21:17 +0000
X-ClientProxiedBy: TYCP286CA0274.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB11036:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f20c8d1-22b7-4204-9483-08dd441af805
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2pkNXPbMAvPsT3Vxrfuwjx0YcVGOUxmRhg5ryEGAXM41yPMwp1rUNpCTlYeL?=
 =?us-ascii?Q?9qIP+7WMb9TMWLdzZiQY7oPwJTxEulgLvetXmCMyHZbUsm0tAitiqdB7N/G+?=
 =?us-ascii?Q?l7r+ZJcE+gN6SqBfcAbZydNunvmFiohGDgqNGSm+YiraViKm0mHMsgJBrgXt?=
 =?us-ascii?Q?te535NkI/1Wdsh7etn7kn+Dcg01RsfrVF6hhbJMeS9S3V5VGyfV/hTErNc3X?=
 =?us-ascii?Q?Aa0IRfEqkBjNt028RsL7ah5/2MHqExC2qY+ueZk2OL3w9+KLUc4pjF4957hM?=
 =?us-ascii?Q?h45IYzr1ri/CnM1LCb+3LX52bX9nu8s9knnzmwUsiEmUViqb8J1LDa/iqyaQ?=
 =?us-ascii?Q?ZssvtcRlQN8eWv+pfF2memFfoYE3Gi7RGuev6YK8+lXHe5V/PDh1aOinIWZM?=
 =?us-ascii?Q?GkHiSkganqtW1EDin9RrkN9y5mVOTwUA50IQjQBJi8UFxUVRzjKVMVay8FnG?=
 =?us-ascii?Q?tQS5rbM+Rb8MJws8K/DCR3vg3VjR/dRHxx8AUUo/TGA2SNrUtKU1oHqCmebF?=
 =?us-ascii?Q?m6exrmNDyJNC7dapOyJDtAdjU0M4IF+PgHfXFMQJETPhNWOVWYYIHFB4x/mu?=
 =?us-ascii?Q?CqJxMGV08s1KlulQ4/2ZGLkRmUmYE8GVbfCZkdrOyz0gamKXT5O1U0IDR/Iq?=
 =?us-ascii?Q?3s5vKJrfsh8zQOi57LXTVj1KwO0mOhSRzrvTwaaDomFAB/V7IpqcKuDqnxGa?=
 =?us-ascii?Q?NEdLGA/dF0f/35zodX3NN1R/Rdrpyv/NnSX31loRHbq0T7XU3HBAqLsrIptm?=
 =?us-ascii?Q?XRyH2etpgqs4hBaZecdi1e3Ik9QdgN8xDSw4TCODGz5rzmwx2o3hncLc5ezK?=
 =?us-ascii?Q?y6NFqL4XsmV0hBbd3bj3U7XkTsUdSZAxLfdW9Vgc/1G1gQRFi3u5KjIjK4s/?=
 =?us-ascii?Q?HT0WPRnoCmpE12aECIj20v4CpwB2EIUPtcl2YcYVYsJ3Q12MOzEUwM/vqm5n?=
 =?us-ascii?Q?ch+5sRLQ6DjgP5fgHcH66poxHNJ0t+8r2kIgHSJY+uEXXSP7G5rugsdoGyYt?=
 =?us-ascii?Q?iaYmVOxV2hvTEpsWitp919my7vHIZ0A418iy3Djgd4QIKYQcx7jBjWLluLJF?=
 =?us-ascii?Q?MN3L7gihG0fphqT5CTUmcJVEZiyUpWlE1A7IVdR8XXy+lzPor9sGQ5zHavq/?=
 =?us-ascii?Q?k0izj/EfCM1YEW0rj1mO4N30OmaCt8bAYM+pITsjKtnXOmPhjrBXHiAiMP+g?=
 =?us-ascii?Q?gxJkZnOXpi/PWpGLj2QvN/HF60EjBFYWUjD4HSP+Ijiu069bPC8oqO86gj/d?=
 =?us-ascii?Q?eTKiNMDL1upr46cfwR793kXSdL+YsfdSbB7Eqw840xoebL/pdSpFtuVB12hZ?=
 =?us-ascii?Q?Z/JJ0Nn2N2+TjMSDaM0ITkBAWVnl/V74NB5GTivFWwoEZtvSZxYmIpZ9Z45z?=
 =?us-ascii?Q?VJWTwJ8wDaSigs4zTEYYmmw5CWdzAHybfXICIfpvIZkR8WzloTN31w8OKLkN?=
 =?us-ascii?Q?BnWNPM9zmdNU3j7k3wA3SNgV3UAKwKCJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/4dkqhZc3zQYY5z9xpbaOeoSFkLJ/tvlqk1LNSY2N1jXc5fANU+yozCD7yj5?=
 =?us-ascii?Q?cfaHqzU2p3HbNZWVMPSutHe11oy0rVOwKEpRBjpvlO0PmHjdTWY0WCG+1+Gl?=
 =?us-ascii?Q?2YHpCKEth96MsQ6V5igDpm4HdXCJjkcLEDQ9wWtB7pSIOMXJN0BAjzeabBLN?=
 =?us-ascii?Q?urPp/xue+AHQ/LsmLVK6ZHnTycVJmb6xybi7cF8d3zWLPfFDkF75r3k/UiuQ?=
 =?us-ascii?Q?xhOMTKYWh8ZWrxDtL5OjLFQyrgdqigqnKtSrt7acb91zMPkCVj9PtbLjSPQA?=
 =?us-ascii?Q?kCn6Y7t2EGI4o/RgIYvYlHBQxD3xKrVxcHdisau4dbTZ7S5QdRmSlSjTefFX?=
 =?us-ascii?Q?LcH2tlE31GRaO0WzOpj50KVlFCFkR5L6lTWbtjsuUU4Od3bg7S3AvGr09dTe?=
 =?us-ascii?Q?pmZMuarZf3X2Iw+CsvWI8+j9XZRikBk+VSpcMZZN4oxm1ZFYL4ffkJhlaORD?=
 =?us-ascii?Q?j75y59eTYQVhLx1bzetpNfpcmqbQ+kAbtcMoJdH7DYA+Gg6h/mZ5A0D1uiWM?=
 =?us-ascii?Q?ugvfd2Qn1zURqqZSvRJvoOducAnkgJdC5GKrsNXY3Irt6beEB11l7vOkXYCl?=
 =?us-ascii?Q?JZP4NmQ5bvPNnyK+Qd+D2e57sViJ+R0KpSeQAQyobk0DafAEusdLEgGkOubF?=
 =?us-ascii?Q?SZDcmPFC2DCqK50MR1tyf97+pTWm8qQjMXbMdz6O3JSXCLJ5VztgYqwu8XpP?=
 =?us-ascii?Q?EcS7H12XE/lhAL/TELSENKtlOnjU7imEZUqpDDftSWpzR6DrhZThNcUBM4q4?=
 =?us-ascii?Q?fpltRwtF+UK8YnWkbiVJ8eeKbtF7chY9vv0mAg5TKNRLyau6Tj/K5x3lUggM?=
 =?us-ascii?Q?9ygcFuC4O2J8qD8Hh4yMkBKK0npaLNYB0ExuYHGt8FpHvDjlPvq/Ot1PdQQ2?=
 =?us-ascii?Q?itiYCObvWbJncFvDCGWMkEIiEnrBrjSaeZjjM4YcuMoI/L3rJPsYUUUyjwxq?=
 =?us-ascii?Q?1FxpI2gpYE8adBpVn8NPMHph2TwSlp8Oj2Vt1n+tCrb1KTe2DqoSk5gtZyPN?=
 =?us-ascii?Q?ruplUi1IVF2jZ1i85R66pFetIbe/2dZ486W6v6Kxx93BofCvO9y4UnS7NYuP?=
 =?us-ascii?Q?CrtvAQ1MGTFHiZhwDGAwz85RWat2iNfk41XGxc2R4r4r9jqGd5rrgFhR2fdO?=
 =?us-ascii?Q?FqSrXbDnQ09RxEGGQPiGmqObX1M5fak+Mv9t8MHWvDThZyCL8YdZ6JZXU5w9?=
 =?us-ascii?Q?QYsUAPgL761zdyNEg1WyNpQZUkntNrel/npLRPmHqNGmDNccbPCG83ktHQU8?=
 =?us-ascii?Q?LVfW0eqDUR1yJGqrfu0xCVtm4KFX9shaAgIBsj76Wat4FMGOZMVIDQDuohBS?=
 =?us-ascii?Q?dkz+rPCW5xc1CAb2CxwmN+ja0z/n5pEzfe1jTJStskyWfccvzQt8CAHPLCPp?=
 =?us-ascii?Q?j89s0Als8Z65ZscgmqkjKC2hkG1NeOpOK8/XxeEsnaoJj31+VbLakKC9CnbJ?=
 =?us-ascii?Q?wbsUgdO6GJooJ1acn0KvriEBnIZpdpETk+0RjHR3xDkEsyN4fQIAUvXGxybN?=
 =?us-ascii?Q?wn4oXpppwm/qF1EFrGR+2tQzcwULqm8tzhAZnYjL+G/+jmaThsgwG1edRAYR?=
 =?us-ascii?Q?aZ62PLrcAa9A36n4nlD4Ttb9NVOQELYPzEvfBIQt56fyYoZp5tKIm22JN5R5?=
 =?us-ascii?Q?Nbx9FUg0le/VghToTrOtako=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f20c8d1-22b7-4204-9483-08dd441af805
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 06:21:17.8367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZU4asHCYkAnsyWr2AxjNYPuJaETnjgQm8ApECzgyz/xaBlWbZM7mVMgq5/QANNVjoJvNPBr3xm+/SM5JS11heEXBmKrqq7GmhkViwTQHw/ZeoUwZP4QvB5pqdjj/TKqu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11036

We can use snd_soc_ret() to indicate error message when return.
Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card.c | 93 +++++++++++++++-------------
 1 file changed, 50 insertions(+), 43 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index bd7ebbec0fc9c..a8a3bad3df00d 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -20,6 +20,13 @@
 
 #define DPCM_SELECTABLE 1
 
+#define graph_ret(priv, ret) _graph_ret(priv, __func__, ret)
+static inline int _graph_ret(struct simple_util_priv *priv,
+			     const char *func, int ret)
+{
+	return snd_soc_ret(simple_priv_to_dev(priv), ret, "at %s()\n", func);
+}
+
 #define ep_to_port(ep)	of_get_parent(ep)
 static struct device_node *port_to_ports(struct device_node *port)
 {
@@ -113,17 +120,15 @@ static int graph_parse_node(struct simple_util_priv *priv,
 
 	ret = graph_util_parse_dai(priv, ep, dlc, cpu);
 	if (ret < 0)
-		return ret;
+		goto end;
 
 	ret = simple_util_parse_tdm(ep, dai);
 	if (ret < 0)
-		return ret;
+		goto end;
 
 	ret = simple_util_parse_clk(dev, ep, dai, dlc);
-	if (ret < 0)
-		return ret;
-
-	return 0;
+end:
+	return graph_ret(priv, ret);
 }
 
 static int graph_link_init(struct simple_util_priv *priv,
@@ -148,7 +153,7 @@ static int graph_link_init(struct simple_util_priv *priv,
 	ret = simple_util_parse_daifmt(dev, ep_cpu, ep_codec,
 				       NULL, &dai_link->dai_fmt);
 	if (ret < 0)
-		return ret;
+		goto end;
 
 	graph_util_parse_link_direction(top,		&playback_only, &capture_only);
 	graph_util_parse_link_direction(port_cpu,	&playback_only, &capture_only);
@@ -183,7 +188,9 @@ static int graph_link_init(struct simple_util_priv *priv,
 	if (priv->ops)
 		dai_link->ops	= priv->ops;
 
-	return simple_util_set_dailink_name(priv, dai_link, name);
+	ret = simple_util_set_dailink_name(priv, dai_link, name);
+end:
+	return graph_ret(priv, ret);
 }
 
 static int graph_dai_link_of_dpcm(struct simple_util_priv *priv,
@@ -215,7 +222,7 @@ static int graph_dai_link_of_dpcm(struct simple_util_priv *priv,
 
 		ret = graph_parse_node(priv, cpu_ep, li, &is_single_links);
 		if (ret)
-			return ret;
+			goto end;
 
 		snprintf(dai_name, sizeof(dai_name),
 			 "fe.%pOFP.%s", cpus->of_node, cpus->dai_name);
@@ -248,7 +255,7 @@ static int graph_dai_link_of_dpcm(struct simple_util_priv *priv,
 
 		ret = graph_parse_node(priv, codec_ep, li, NULL);
 		if (ret < 0)
-			return ret;
+			goto end;
 
 		snprintf(dai_name, sizeof(dai_name),
 			 "be.%pOFP.%s", codecs->of_node, codecs->dai_name);
@@ -267,8 +274,8 @@ static int graph_dai_link_of_dpcm(struct simple_util_priv *priv,
 	ret = graph_link_init(priv, cpu_ep, codec_ep, li, dai_name);
 
 	li->link++;
-
-	return ret;
+end:
+	return graph_ret(priv, ret);
 }
 
 static int graph_dai_link_of(struct simple_util_priv *priv,
@@ -288,11 +295,11 @@ static int graph_dai_link_of(struct simple_util_priv *priv,
 
 	ret = graph_parse_node(priv, cpu_ep, li, &is_single_links);
 	if (ret < 0)
-		return ret;
+		goto end;
 
 	ret = graph_parse_node(priv, codec_ep, li, NULL);
 	if (ret < 0)
-		return ret;
+		goto end;
 
 	snprintf(dai_name, sizeof(dai_name),
 		 "%s-%s", cpus->dai_name, codecs->dai_name);
@@ -302,11 +309,11 @@ static int graph_dai_link_of(struct simple_util_priv *priv,
 
 	ret = graph_link_init(priv, cpu_ep, codec_ep, li, dai_name);
 	if (ret < 0)
-		return ret;
+		goto end;
 
 	li->link++;
-
-	return 0;
+end:
+	return graph_ret(priv, ret);
 }
 
 static inline bool parse_as_dpcm_link(struct simple_util_priv *priv,
@@ -383,13 +390,13 @@ static int __graph_for_each_link(struct simple_util_priv *priv,
 			}
 
 			if (ret < 0)
-				return ret;
+				goto end;
 
 			codec_port_old = codec_port;
 		}
 	}
-
-	return 0;
+end:
+	return graph_ret(priv, ret);
 }
 
 static int graph_for_each_link(struct simple_util_priv *priv,
@@ -422,7 +429,7 @@ static int graph_for_each_link(struct simple_util_priv *priv,
 			break;
 	}
 
-	return ret;
+	return graph_ret(priv, ret);
 }
 
 static int graph_count_noml(struct simple_util_priv *priv,
@@ -431,11 +438,10 @@ static int graph_count_noml(struct simple_util_priv *priv,
 			    struct link_info *li)
 {
 	struct device *dev = simple_priv_to_dev(priv);
+	int ret = -EINVAL;
 
-	if (li->link >= SNDRV_MAX_LINKS) {
-		dev_err(dev, "too many links\n");
-		return -EINVAL;
-	}
+	if (li->link >= SNDRV_MAX_LINKS)
+		goto end;
 
 	/*
 	 * DON'T REMOVE platforms
@@ -450,8 +456,9 @@ static int graph_count_noml(struct simple_util_priv *priv,
 	li->link += 1; /* 1xCPU-Codec */
 
 	dev_dbg(dev, "Count As Normal\n");
-
-	return 0;
+	ret = 0;
+end:
+	return graph_ret(priv, ret);
 }
 
 static int graph_count_dpcm(struct simple_util_priv *priv,
@@ -460,11 +467,10 @@ static int graph_count_dpcm(struct simple_util_priv *priv,
 			    struct link_info *li)
 {
 	struct device *dev = simple_priv_to_dev(priv);
+	int ret = -EINVAL;
 
-	if (li->link >= SNDRV_MAX_LINKS) {
-		dev_err(dev, "too many links\n");
-		return -EINVAL;
-	}
+	if (li->link >= SNDRV_MAX_LINKS)
+		goto end;
 
 	if (li->cpu) {
 		/*
@@ -483,8 +489,9 @@ static int graph_count_dpcm(struct simple_util_priv *priv,
 	}
 
 	dev_dbg(dev, "Count As DPCM\n");
-
-	return 0;
+	ret = 0;
+end:
+	return graph_ret(priv, ret);
 }
 
 static int graph_get_dais_count(struct simple_util_priv *priv,
@@ -544,40 +551,41 @@ static int graph_get_dais_count(struct simple_util_priv *priv,
 int audio_graph_parse_of(struct simple_util_priv *priv, struct device *dev)
 {
 	struct snd_soc_card *card = simple_priv_to_card(priv);
-	int ret;
+	int ret = -ENOMEM;
 
 	struct link_info *li __free(kfree) = kzalloc(sizeof(*li), GFP_KERNEL);
 	if (!li)
-		return -ENOMEM;
+		goto end;
 
 	card->owner = THIS_MODULE;
 	card->dev = dev;
 
 	ret = graph_get_dais_count(priv, li);
 	if (ret < 0)
-		return ret;
+		goto end;
 
+	ret = -EINVAL;
 	if (!li->link)
-		return -EINVAL;
+		goto end;
 
 	ret = simple_util_init_priv(priv, li);
 	if (ret < 0)
-		return ret;
+		goto end;
 
 	priv->pa_gpio = devm_gpiod_get_optional(dev, "pa", GPIOD_OUT_LOW);
 	if (IS_ERR(priv->pa_gpio)) {
 		ret = PTR_ERR(priv->pa_gpio);
 		dev_err(dev, "failed to get amplifier gpio: %d\n", ret);
-		return ret;
+		goto end;
 	}
 
 	ret = simple_util_parse_widgets(card, NULL);
 	if (ret < 0)
-		return ret;
+		goto end;
 
 	ret = simple_util_parse_routing(card, NULL);
 	if (ret < 0)
-		return ret;
+		goto end;
 
 	memset(li, 0, sizeof(*li));
 	ret = graph_for_each_link(priv, li,
@@ -599,10 +607,9 @@ int audio_graph_parse_of(struct simple_util_priv *priv, struct device *dev)
 		goto err;
 
 	return 0;
-
 err:
 	simple_util_clean_reference(card);
-
+end:
 	return dev_err_probe(dev, ret, "parse error\n");
 }
 EXPORT_SYMBOL_GPL(audio_graph_parse_of);
-- 
2.43.0

