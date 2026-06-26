Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011042.outbound.protection.outlook.com [40.107.74.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B50B3D6CDE
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 06:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782455294; cv=fail; b=TfaJsBYX0ksf6UYZASboBfUfTxMPCR+giLsYoheBXC2GA3rRkMtEimnbsBk0flhBVWsx0CVhM5n4rVUZ0TIZb+RXox3ztoViANZFw+9yj35TiAnJvFs9IoYLT0Bdbxs8C2EU5GFpmYEFa9vKERbh0JVdobTIksfWuKTky2VO8b8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782455294; c=relaxed/simple;
	bh=bf5tz7eQVIOC4/PzWFGYMicH/WJxRKwV9zieWSXcieI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=aPKf93qkmd4BfanFaGVIjcgktDpDB5DlgjofPBgbPag59q1ufjOEMu7CJMThCJ6oTgtqb0KDlHKcp1VnzAfJYAR2vphSbfd2cm5e4mmjw6FEnahiad1soq52GWBS2aNZ08O2uA54lkntgP5ikIsvHkwvMlDybK6msysjmOuBxO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=gd7goOE8; arc=fail smtp.client-ip=40.107.74.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="gd7goOE8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MnSBo0ltXu/3BmX7AisqPhcSjMoaGwYUcxWmx0OCYgSsKymPl5tpKeN3tDDA1tslAPZN2jtq1evXpQRLlqkTkRIlBKBTWM+/zCHr1u+566xjG36mS3ShShTUv+xMdB/X6zbcucN0cfnqfae8HyK25Sssh1hDZ7Q+B/TUrxSSxQmFUnZaYQPDKKQ7tFoh0NUb7CTeYRnS4qXrDe9h43RKB9ScV8OdrhWKFVr6GxgaVjmAVXASwOEFfHijn7L/R/OFX2Bu5EGY2ao41O8E/qZLpA/YHtG+m3PWQGRmrA5eZRtlwgFzRX399qbQ5ENBtRhSrTMlYZXlX6HodAtFAbMSrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AiSqZ2Zv2UyjqwN6nN3comwn7KWxiMBOkYRmLwZeD8w=;
 b=se4X9AlzxL+R4M2Aa9qoazo37hTwF174D62+CH0/ECQfiYje9N6mvl6MmBH63dr3XgYmAR0GptIa9vztknHqfZ/ys9i6lHCqIRyKqmXbKMbPQfrsTHuBcpKy9NC6GLet81NRXXAN/lcoVipR9QIiyLWD1cHg8VNZEQdc4b7Slld0Cq5V25bMobjlQrZ2FglxBuobaQwR33tjgL13953XtCLxl1L7IsUDOz2FmxogAHkn5mtisaj8nzX3CzLnOGCqUGU4Y0LL0WfE1W0GYMZCMPZoScfVqEzkTmJImnoy3I9ZIZa0fzOMYFe9zTxkd3VaJl6O6N5wJmdfZybfT0uByA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AiSqZ2Zv2UyjqwN6nN3comwn7KWxiMBOkYRmLwZeD8w=;
 b=gd7goOE8QvfOiY5KqUrBOcrZr/NWoNDvGUfW6JiVY6KIotPTgF8RtiDy2gicpsOJDSZv7ngISlogwsrMvYQOLUe0j88QaMl8ub2wEca0ryv3iBtjJfSxaJ2Lkzjtj1XuKK1lKxYbNI04l98W+iY/24NirKb3Vwtf9BBE1CUlG7k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS9PR01MB15751.jpnprd01.prod.outlook.com (2603:1096:604:3bd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Fri, 26 Jun
 2026 06:28:10 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0159.015; Fri, 26 Jun 2026
 06:28:10 +0000
Message-ID: <8733y9eryd.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 03/12] ASoC: audio-graph-card2: Tidyup audio_graph2_parse_of() around error
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <877bnlerz1.wl-kuninori.morimoto.gx@renesas.com>
References: <877bnlerz1.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 26 Jun 2026 06:28:10 +0000
X-ClientProxiedBy: TY4P286CA0123.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37c::13) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS9PR01MB15751:EE_
X-MS-Office365-Filtering-Correlation-Id: 66f7e66a-0972-455a-38b7-08ded34c17c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|38350700014|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	3iQm5vwJ5o0oo2zbouQqWlw6hpTLIlyeoJvEHx7pqnVcK32o+cMPjJY+7WFW1Tg2U968Ut6P4mCjdeJ4WMF1steNAW8neQrLdGvKBO2CdB40jw2plRangVh6ln8QNS9AaRVItPXc0wGjxjQ7Riys5+w9bGi+iIevO/f0agmGC9ChdyqjsumhQW6x7qdUasA2PNNvNiKzdGdjrq2KRSwyAQFJPzSCWFOw+/QCzH8vglwTbwjJMZHsOc5A84nJ84M3brOx+5iAY/jVuo3pwfjTBcN0PqSSQSogSerSEIzg7k05BfPyPLvN2Pd6oFM0QkXbteWtc3W3PadGfE/1Y94mzd0uQoSD0mr2cDnkfBllqStc2P4/2sJlj1IgaRwVKNANXqOnGUzi2SmG+SDpvkL0HVP83+1ARsOMIAwN10V71JUCKALtfIyWN7WBXa45jHuCF3jpUaenTq2idcHRc5kKHS5hxb/0B4153+jxLP5pEnSJMENRCiqO5hucdJxL+crPYhV4JkaADBFhrc90FnbkbzMiSr8CiPSipdSLVoT+FDRAucMmIqUQf6rLh0MCjQEfUAIRjzqTjaT7G3n0UZr9h9EE0zMgoCUx7EcH0HwgjpZKv05LQUURkEscBXxTkWOo/69qq+7szp8h91YFL1a7n7ilJb0QYNAco5IjOHUElchSRext+u8u3OuLEGDsD/26AASt8jr0jjGPGdQmJmuPAlIrP+HyzHvr/LF+qZiTDVQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(38350700014)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hutsyaNYfnjfZ/nM0qHBVZPTTEtmOjGkFYeJQyCez1UJl/5CqG/gP2IRyLRF?=
 =?us-ascii?Q?inmL/iW9yHBeVa26PEA4Q2nsd9NCrRyngIgmzh7wsS4AwEHUAPD6sLSinT/Y?=
 =?us-ascii?Q?oDgHraY1Kin02FpFdwJf4x06ttnhlOTieQ7+ltUoqrpqrXWHHJke4YvqSqy/?=
 =?us-ascii?Q?hvWiItr5s89DxsN8NrS5KLaMgQvMs6zJmXDmMdYWN+cgzkJeoHAqLn/5Bojf?=
 =?us-ascii?Q?nk5xp56+wh1B1lYltlfSABWWzlIUgACau7BFamMVrPT/CLvSwbaZKomJQ8BZ?=
 =?us-ascii?Q?hpL9jt06xRWXrO91B15BpYkbk6Ik4tp9qQTtXos1Z8lOTiKemEZk1xSRfUhB?=
 =?us-ascii?Q?f7E7YYrG1ItIWhzo8IL5col2FuKx1BxDSkBmj3zaaq/8zLgn7EN1mswZu4Uj?=
 =?us-ascii?Q?apux4Zr+GltXqPQ5cjVUKmJOBRIXZY6xONphKH/Hr5YL+uH+82J3PDhwJmHx?=
 =?us-ascii?Q?A2KMSPiZDttJWZ9I/de/ZEKAiQ/JpEZ5RmXkkaJ9VOzq7jOKNO79Js089A3A?=
 =?us-ascii?Q?l0/gwz/zVthxFVw0+Gs4vefSRoQLTUfWHHgkI0oYzHwC+YtvO0jVWnRoEsiC?=
 =?us-ascii?Q?8BzvafGRMEsPsVs7hDs5WBA2v+5W/q2tZ6ociDr7Eo6d4RPTMd1qAIfQ3UBi?=
 =?us-ascii?Q?4QdqceJmGaso9zleTgtgK2WfROYUD7WYlKUhmhvapchHeGUOzknmiPSRgvNW?=
 =?us-ascii?Q?h1KBU5B6AK3hHanre3+RYINbUq7VDOFE2wOzmuLtCppy8m9MJC+jkzWWlfag?=
 =?us-ascii?Q?/JfY/xCJzgFt4U2x0YNZ8SQErJ/P4twTw+wmibyWpY1Qrpy/VYjET/OJbQ81?=
 =?us-ascii?Q?BAZJsyyttyXqMFrEXIrWAFjQzDxagiT4PqyymvBIHFodnMGacxGUD2rbzuzA?=
 =?us-ascii?Q?QamPal9wXSIwTvTW3vNDqAMGMF04te8qhNx3/ubXZZdnVaB/5MKt1JUPQJCu?=
 =?us-ascii?Q?fKt7zjxSDFCRDPI2mNuYjANNY09VvNErC2fBFlsuP2yM57tgLJHxABaciNFC?=
 =?us-ascii?Q?d3DQZXdOCPadbUe1GwZcb8bt/tzEQ1kJ6XVWHVlXOVyx8AdvCT/LdMQV8WXC?=
 =?us-ascii?Q?Q2w5LUGuH+uJAkY+5cvm63FjD9pfTLfdbiHlTEwuK7ukedLmqzBml+3LJQfs?=
 =?us-ascii?Q?B5eYbYRBq0W7lISz3zTalxxFOFCGG5tzute3ACgW0p8RNkiYtaNwy5NivQEc?=
 =?us-ascii?Q?1AB+K+x3FtDUJ6nCyNQKyoXqvFdmblso/81BAj9KEK3n9AkoYHeWjLfnDSih?=
 =?us-ascii?Q?5qosOXnCb9q6Xw9oWw7yRvW/s2jSgxXp4Ei4IEBiuEwMsmhRFjtK31GjkAJP?=
 =?us-ascii?Q?XAIIyzlHyqPisWo2j7GSweHdgUVJj1XqghaJ4Iz6+7EMAuKV628bc55JE53Q?=
 =?us-ascii?Q?95e3fYydtUyS543jwjz5F88S/8+O7iZDEYtDKaDzxHYgMNPPs45pA78mwTsy?=
 =?us-ascii?Q?yqvyWPKjZFk28hUWF763k9TWBVzznbKIvdM7XaarCW7oBfq5BzK+MTXtYhAq?=
 =?us-ascii?Q?WpXKrDxkQs++0X9e04am7nJHn1FbIqVz/XICa4n9u7r27DYW08nOJ8YeVeLA?=
 =?us-ascii?Q?+oglo4OHnKH+ZQT+wOC9SPbzg/dKKZZiMistLUD9RAlzCU7O+rTCvQ/eAfW8?=
 =?us-ascii?Q?HIHiIs7ppVUg9tGDmnb4fCz1wgRUwZZlSea7TH6ns5CKL43B3MJgBHTr3tFz?=
 =?us-ascii?Q?XPPOsFrzHDuFeNpKgV4y1vXE5UMAe4KmbpOQMC96PMa/7UlLfg+z/PzPt+pW?=
 =?us-ascii?Q?R1rLocOCJilL0Osx9OXDzyHkICpG4Kh3OGoxVdcjY285yj0uYACv?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66f7e66a-0972-455a-38b7-08ded34c17c7
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 06:28:10.4050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x+2ciyvcwHAr1a1vE6l6D03eu9GB2xSEW4zzCS4VfUsRwB3NKcbecxkgQcDplod4nNUU0TtyXS2ZoTSTTJdLwoxNvE3/LP+AZEQ1qVR2BWqahWVZ6tF0Bf7EiHb+Ogbb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15751

audio_graph2_parse_of() have not been calling
simple_util_clean_reference(). Call it.

And it is already calling dev_err_probe() in error case, no need to
call graph_ret() in success case. Tidyup it.

Let's keep same style with simple-card/audio-graph-card.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card2.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 6894bb936cfd2..810d404c1f696 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -1315,11 +1315,11 @@ int audio_graph2_parse_of(struct simple_util_priv *priv, struct device *dev,
 			  struct graph2_custom_hooks *hooks)
 {
 	struct snd_soc_card *card = simple_priv_to_card(priv);
-	int ret;
+	int ret = -ENOMEM;
 
 	struct link_info *li __free(kfree) = kzalloc_obj(*li);
 	if (!li)
-		return -ENOMEM;
+		goto end;
 
 	card->probe	= graph_util_card_probe;
 	card->owner	= THIS_MODULE;
@@ -1328,33 +1328,33 @@ int audio_graph2_parse_of(struct simple_util_priv *priv, struct device *dev,
 	if ((hooks) && (hooks)->hook_pre) {
 		ret = (hooks)->hook_pre(priv);
 		if (ret < 0)
-			goto err;
+			goto end;
 	}
 
 	ret = graph_for_each_link(priv, hooks, li, graph_count);
 	if (!li->link)
 		ret = -EINVAL;
 	if (ret < 0)
-		goto err;
+		goto end;
 
 	ret = simple_util_init_priv(priv, li);
 	if (ret < 0)
-		goto err;
+		goto end;
 
 	priv->pa_gpio = devm_gpiod_get_optional(dev, "pa", GPIOD_OUT_LOW);
 	if (IS_ERR(priv->pa_gpio)) {
 		ret = PTR_ERR(priv->pa_gpio);
 		dev_err(dev, "failed to get amplifier gpio: %d\n", ret);
-		goto err;
+		goto end;
 	}
 
 	ret = simple_util_parse_widgets(card, NULL);
 	if (ret < 0)
-		goto err;
+		goto end;
 
 	ret = simple_util_parse_routing(card, NULL);
 	if (ret < 0)
-		goto err;
+		goto end;
 
 	memset(li, 0, sizeof(*li));
 	ret = graph_for_each_link(priv, hooks, li, graph_link);
@@ -1381,9 +1381,11 @@ int audio_graph2_parse_of(struct simple_util_priv *priv, struct device *dev,
 
 	ret = devm_snd_soc_register_card(dev, card);
 err:
-	if (ret < 0)
-		dev_err_probe(dev, ret, "parse error\n");
-
+	if (ret < 0) {
+		simple_util_clean_reference(card);
+		return dev_err_probe(dev, ret, "parse error\n");
+	}
+end:
 	return graph_ret(priv, ret);
 }
 EXPORT_SYMBOL_GPL(audio_graph2_parse_of);
-- 
2.53.0

