Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011019.outbound.protection.outlook.com [40.107.74.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C621CD2C
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 00:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786063986; cv=fail; b=Jz0VGRAuAor5ag+Ws6xUR63yNuEYiPAoprphPgv5RiCb5k0EqELE66KDmvBwgUDqL3C6W0pqy6VGviMAkdR6Nu9t5dPsniiFmQBGFoaNY6t81ojcKM8RAJk9KwTwBtnmBCHPEU6CGuI0onMtqC3c4tfbg1htcs3KOh+ssW2BvxA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786063986; c=relaxed/simple;
	bh=qhlUkQh22Hr+S+oHpolK7MfNWlOBhkYckaOi4J+Sk18=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=n1hTEe9TqvvtMkciKSIlJAS/zy7IWtv7K792t+oJ73Poa2GJvF/TK7x+K8gW3hIUV2sdga6mwTT42gIV9IZm7+GHdnPX/kdyOqKuzz189xVrcnR2+U27ngZoW+PQc34Kkt4o20C4Xoy6WYzoQKqb4GVMeFIlD/s3wMuiUjKb1Sk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=iPvEvR/R; arc=fail smtp.client-ip=40.107.74.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="iPvEvR/R"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XDaPvzztiyIZuYHkfUs3sprPx+iIRjOyNDBhLOfvMxOOUbIiWoLL5uAGp2v61oWzGrNw6mrkVIA+kvOCeKe2LLerMYnRUTJ/55GpvJ6lGxjprhwK3WeFZPluEk27ua4R5gmdhIy9vz4jwv50wK+olUAgQAJzDPzR7pustUlwAsYfoQAv5aLAZGyf2pMUVSZdPgO/6z3Jw9zbowUZIANWQ+m9mOzjNO4lSpg1l2G90ojvSWUwiU/RBi/kcf0buUgEbp+bmRmszF8ToesDS2nfe6sG1PjG2aOoVcOsF5Mb5I9ODrBf8pPI6rBa3gd3Au1UUA4cKJHZ+USqCz6pNsUkVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Wq4B3C8SONeoK20bTARxUC89uOYYGER3xuTsEA2QSU=;
 b=eX+S6GsRyufqS2h4eqLI/RBLKUU07IxnLXxMpcNI9Xn3FRXxPuXeiYCdoEa5lricwVhPTBHCniuYztYJXUA6OID+08l65BtVDzWYdY9cgEr6HTvuq30P8cxKAcCWJv+bBtvoiryZGWFg3+sk6UYxipWnKm5c5pmKDZWn5SUk7jOd2bi0KlO6XwCQaBtjrsCN5BByTIvK7TrJwWHm7LR7BkxjqTeSvfEALipCPOdEpWB9U4ECI6UUYBKPradF3vKwQ3i6IO4tecw/WJay+60bsMwlpVR6f9VvS7i3rgBoW8kDS1lrr/dGs9vPWQZQqYluBrpQyhYCBhzTG+rRg3Jtsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Wq4B3C8SONeoK20bTARxUC89uOYYGER3xuTsEA2QSU=;
 b=iPvEvR/RBs03hag37qtHXCJVTkR7riK0a9/nZ1uhkub9AiPEg1Q4DY/glIb+vrMGvIosyDH0g1/SvMdSHyoNnw31stkfxEFh0e4D4k5EnO3MUAA0a7nMUiyowoRVCPVyeHxW1TyAyDvPZSjrVlG56EWmcIF3FH5XqKhTiJbb9b0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYTPR01MB11044.jpnprd01.prod.outlook.com (2603:1096:400:3a1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 00:53:03 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 00:53:02 +0000
Message-ID: <8733wqvjip.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 =?ISO-8859-1?Q?=22Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29=22?=
 <u.kleine-koenig@baylibre.com>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH v2 03/44] ASoC: codecs: ab8500: use .auto_selectable_formats
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
In-Reply-To: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
References: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 7 Aug 2026 00:53:02 +0000
X-ClientProxiedBy: TYCP286CA0224.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::8) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYTPR01MB11044:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cdee398-6035-4f7f-4e59-08def41e3bfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|23010399003|376014|1800799024|366016|38350700014|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	jl7BHUyh+g/3QPBUHR+iDV9jPuKFKcc7xU8jSwmacryb9sqo3BgzZZmq6IQDBRl7chB7XHMFfjCvK62qZsU9YXWQWymGlgRHEmAgWJaRFEf2f9s5ko2O2xbLW9pu3Fs2aCg8DkO1h7SRIIbLYu+pxjhsNc/cYTbydVPmZC11ryndaSgCfwde0RaH4J9lmWkCyIVwIeXBaPP30LqXqnRRl1h0EueiAGtmx47oDDkKddViX4FzAMHN5YV48eMHw1YNcT8PWrzel6L4u3NxZDVkZmFb386fC8G7ze2W8kDu1Df+3RkKXwvXa0cluRzDScCl9PdYJkW/7zWpLLNtSenr5HvjAF/VV/M5pD3sTiJ54BlIuzj8WGjDYJ5Xhxye4HHo1BMjXhgKfLmLX6bIOVBshJrtq6QJoukQznNb84z/cuyFsGe49taCrhMtnGQQj8my+pYqVGWN+Rw9usOzNDWPJSJdqmljwetnfSFwgHKyhqiAimIdTYo7YUgF+W1aOmNtsIq45lkZsb83Y+rA6b3lq7EoTgVQa4Fur5eeJdCwBVqdzjYCis5RJVk1l1ygALAYg135IQU4hBjGBz51FJrmvJ+8EatMNdX+Y0iFYpwVaPQCqXixdjIKWPyEFq9vGlgchVdh/c1XzTzo3kT2gNcmxhfAZWGEay9zrM7YgXGfsRT+iu4SPXnqiLM3lS+9x6XFp5N8ZWJNGT+jbmXu7dSTutNrULQXCf0hHerwzTaXxoo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(23010399003)(376014)(1800799024)(366016)(38350700014)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5vsg3Qoq6iQURrY7uKQWU12zhR6NqI6JRRxTK039IxJRdwAOI//YfBbeq5GY?=
 =?us-ascii?Q?YbpULaonWrBCzbLoQPSYwS5y5Ec7vE8/+NBz2SmHtO8fZuA3honNaRQ9AYwT?=
 =?us-ascii?Q?zvcJQPNGNrRN/Qbb4DGHBOB0NfLRvv2LlGc42R00Dttn8E0vW6xuLH84PEtx?=
 =?us-ascii?Q?7gNvaX9fCKH2bg5HBWNb1JT3RojgZtkcaTysoZxBBX1t2NPul97Ws4f4mzn2?=
 =?us-ascii?Q?KbQWoD6iYSSvxn0bc9QZfyt3DKOuAx+NgH5qlv+fX6T4I3YQTVOFjpihgQU7?=
 =?us-ascii?Q?fG78R7ajRwcDOBCCIpVq2tWnHr98fyp8Lqo1fP6Lyo/SAdmda4yU2fb2YqJC?=
 =?us-ascii?Q?XBN/HtS2KXRTkVoun6djX12l4H1VAQidIfoBqlYvHNKrCSQ0ivuYvqZRoXuX?=
 =?us-ascii?Q?equ03a0diFYYcPwagiGb4Fk52sicGPIOutOOeeE/FLWxmC8/yyATQIDM0oC5?=
 =?us-ascii?Q?EGkh/UsFENPgQtfIw1bovZdeuUkHlcLFq44UhFJEWWbOfKS7Ag6B6bep/Rnc?=
 =?us-ascii?Q?rAUfgmMqeh3gIVSZn8xsrO23sQcsp6rh4IyPeViYsYDQT6Mr3QVVAQP6nYLS?=
 =?us-ascii?Q?W+4/x6FUruoEo8jxeQI5jvjl96J3r05CJSdTK1Ly972g7o0RUsuWR1ddSpdL?=
 =?us-ascii?Q?FXkJWu41ALQ0yCI/PXTYHfuB8LeIy0dKvN9earxIHcx+h7NZTfdYi+wSGVjh?=
 =?us-ascii?Q?nCX03NyVMK3PsRJMHjIWRE58X3eeeXn+qkd3W0WmKp8Uv1Qnmn25zha/g0mc?=
 =?us-ascii?Q?xoG3lGQiD1deHF88pncogFXcMaXKCR1bGMStdjlmMQkFLMRl1GuuDmFEBRFO?=
 =?us-ascii?Q?Bw4VOcwmdZqeEaqILjpvYGPtNTFVKPLAtimbQRc81iIStG+tspYuJNptYu9o?=
 =?us-ascii?Q?+IzsbpZPkuV4OVfZ0cDN6jGIgxX6Tnrf4i1jzUYveenoOBMcGq1+8Pr8NIge?=
 =?us-ascii?Q?cwnn7FsPPEL5EQhY5W3v/FLSgsn7SiwcXvlVsxSeAZd3XQrRFcrgurkrEhjc?=
 =?us-ascii?Q?WU6pql4Wp+hyPwgmAgj5ck88dZk7sskscgnTNUP3R0XG4rsIF3k0UJjIljrK?=
 =?us-ascii?Q?mjZfibebsBlxvWD9sbSe2h24Q3KhPLLpNtrqRiLsH2gq/nURt/lOWEOEa44Y?=
 =?us-ascii?Q?l69x9/yUnxtOMErOf1jDwJGb0UkG8TyPj7VI8f5oCIFdRFS3P/VKEv98TiZr?=
 =?us-ascii?Q?2qTeQqDvK1x84js4ZVUdBH8XL2OdJXHF1TiqMrWqj1dbp6NgYziYhPRve7/x?=
 =?us-ascii?Q?8XYo2MOKCmAF5oStvX9Dpg6xqPVA+fVqTxWz0nDRNNhGFO+d9/Iq4ZFYajoa?=
 =?us-ascii?Q?0XXyef8L1FJv0uSNU82+9mwwLZXwZDqvzLF+3FnTFNK5goVFAW1vpEYkt1cJ?=
 =?us-ascii?Q?vXeMIQtBFRWCesTynMTElvAkFi/u8uYcowCIemUdK8jg7g/12/x+VOBkNbX1?=
 =?us-ascii?Q?mb6QAdQC5i/fcy7aVk3bMOyF22G8wcaUUZ1AWZE4T1NeeVLpNu0HknSiKYU1?=
 =?us-ascii?Q?93Z0wG54Lgtz3oIB99UDvAiKWZQxMPKHlmIpU1QGFetvkrj2Qv2wx9ch/PFG?=
 =?us-ascii?Q?OlIPQ0Ja9OhAdH6MWuBzJajhwHJoS6XaDm2yetROXY8v9HrL5j11HaGIYoBs?=
 =?us-ascii?Q?2NAXYbCaS6D12V72uY0i9QwvT584IyruMUA0LnfK/ZEqgCBBw2+2/Yw8UtUP?=
 =?us-ascii?Q?6zTJlh6RuyYxwPXnAVv942AJU91Z+LS+0OBB62HQclBezuQfblrZNY0j8oQh?=
 =?us-ascii?Q?gAZPU1geRg9lmVKUR0maP0mPPbHCjr4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cdee398-6035-4f7f-4e59-08def41e3bfb
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 00:53:02.8142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xt3AGePoLAJw+lUYTXV/Tsp+r9u3ucfzYKtWyXOME6tUiI2SOkF2FlDrw1ELBEFirOpzaURcjBEZzRQtDKjlBKsNsr/dQ7iU+tpMKtZW/I/SW/vrGXvMNUTD5m5r9v7C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYTPR01MB11044

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/ab8500-codec.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/soc/codecs/ab8500-codec.c b/sound/soc/codecs/ab8500-codec.c
index 2cf96cbdd294b..e315638499b69 100644
--- a/sound/soc/codecs/ab8500-codec.c
+++ b/sound/soc/codecs/ab8500-codec.c
@@ -2079,9 +2079,22 @@ static int ab8500_codec_set_dai_tdm_slot(struct snd_soc_dai *dai,
 	return 0;
 }
 
+static const u64 ab8500_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_GATED	|
+	SND_SOC_POSSIBLE_DAIFMT_CONT	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops ab8500_codec_ops = {
 	.set_fmt = ab8500_codec_set_dai_fmt,
 	.set_tdm_slot = ab8500_codec_set_dai_tdm_slot,
+	.auto_selectable_formats = &ab8500_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver ab8500_codec_dai[] = {
-- 
2.53.0

