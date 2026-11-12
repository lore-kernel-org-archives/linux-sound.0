Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794443498;
	b=In2Exf5IxNcFqZ04kfImdIFS9Cbwl3U6Tujl6yx7Y+ADFkXdZTeeEmGjS4ulunVcTgzx
	 G4m4+cjW+2swg1GR+C/Ec9l3SDxS2pzr98mLaZRvHszkYMJjioFYxRzByOVS3Fb4jzZGT
	 JkhVwN6vu+lVN9K0dexkp7pkYRnsSnn3DS5JgTuMefR5tUUi25v3QzyEqfUreoh30qzDn
	 8XJVT69+f7HdYjq7oV4MQQNfaYca4crzA6L7fzKWNIcULRqqGxJaDUCdtvsaOVp3YzsTz
	 Dsn/VHZWCOVpm8z7E3exm8fBafqTv+h3o1FqNEBOT8S0PtYPK+0LqehvHSWS7zLzK+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794443498;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:From:
	 Subject:User-Agent:To:Cc:In-Reply-To:References:Content-Type:Date:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=e/jl+r9zaZXNppaFCZcxgKtcH3LJK2EJQx06eAtjMjY=;
	b=WbvvMs7aiaZzHrnzaIsdlI0GQWAaV2lO4WrGXl0Yxu0DfUw5uQMMQ8S75SfiNGBtJU3+
	 49ZFJVW8kWPHk+eo2bROoin3pScK6MPeeoyF2zXnbTrEOoLj8Drh4gLVVRfxJnP5SNvpN
	 SnUcwh0A4fTclpAwUENgsd44LiZUJaDCR+Z/b4yqLCU3O16IJa4cquDlmF7r7AnH4q0Ko
	 nnn9DDCqHBH9B0xaHY1d+aDZsLgdt3/fzP/DSsnx0sad8YS41woWmJuiipUqG/5gPpBnB
	 NwXrNmXRJtc1JHWuMmS/xheRpzhuxHJcD5tYh70AXenMzwAULfqvGlSWCxBtyQs8z/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=OQDLf5z0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.46
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011046.outbound.protection.outlook.com [52.101.125.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA267606A321
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 00:31:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA267606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=OQDLf5z0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SKUQSp0ROisPo4dl/Ano4X8Fo0/mvhjLnakgblA5FA/J9wwM/t9BBhR/f5VdsIuz43wNCrX6xoQgg/S1d4LatMAL4gpdvyozSwxU+BEylUse3cQbQ+M7Lg09gLQQl2s518e674oP49jomlaCeGlaWf7xrgaGoX5mZIoLK+zGLjvK3IwduXUm71670dwQGQas0HtjSOb5t6EfjmJLm9PshPvtQyZczt+Xq3bWg5hYlas1Zz2FGNuEZnQ89fEDbVU8gU0ST4DTHsvzCrfR95N20fwB9cD19J9Ukfv13fA/G2B/wsdJrANzH3/koLmA5bpopwHNQDtTiAQH/TTf5qsxmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e/jl+r9zaZXNppaFCZcxgKtcH3LJK2EJQx06eAtjMjY=;
 b=dFXwEA/wYjGp+JcAmvfUc07ba8wJvBfU/e9o0G6GWKj7oSxNt1ASGWY4V7I7MUOs+cT2opr7uYUVvQH/5W5XLWVjDgqYigBKfSR0w/inl/KQB3PvhMITMO97nYyjwpyrd9KrR3tDQ9dQJotj9tlSxVt/LZ3bNrr4Q8wlpN+Av7ykRlA8ndFpJjrOeyqJkJYoaQ/BBtXSt/wM0Si+cRIqYVrS2Eyr3syx7o3G6gr4RCtg4ZgWbKUsfwKrCcSJfE3DFWcukvwuxOq2q0DnufAaE1IPiJ8oLrzZ1TTOhHUyFxMEu8lTgXV6oPwmdMG3qWtrlXUw+fI4mmI2plsQQ7ZmmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e/jl+r9zaZXNppaFCZcxgKtcH3LJK2EJQx06eAtjMjY=;
 b=OQDLf5z07uk439RabcLT+mFe4CR87QiRUEelomnuRk8/CILrDRNQIw8fYdUpSgD6Q+388sff8cBiF2RkhDbIchEQdhc9tKYeEqUaZFAoKdxHznjOHpMegpRY2T2fYmXTC1TMjRW9z14cctg3bMJJh1kZpWKBikGz9bccimvR/+s=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by TYCPR01MB6867.jpnprd01.prod.outlook.com (2603:1096:400:b6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 00:31:35 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%6]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 00:31:35 +0000
Message-ID: <87qzgq28m0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 06/27] ASoC: soc-core: move snd_soc_del_component_unlocked()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
In-Reply-To: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
References: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 12 Nov 2026 00:31:35 +0000
X-ClientProxiedBy: TYCP286CA0142.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::18) To TYYPR01MB15175.jpnprd01.prod.outlook.com
 (2603:1096:405:27d::8)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB15175:EE_|TYCPR01MB6867:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c509410-ca3d-4d8c-a461-08df40544ee4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|18002099003|22082099003|261009223027099003|11063799006|56012099006|261102130727099003|261028144727099003|261102123227099003|261026121527099003|261026140227099003|261022105027099003|261021121427099003|261021123027099003|38350700014|10067099003;
X-Microsoft-Antispam-Message-Info:
	1PLb2kvby+okiAs9gB32mVHmyaeGXBbj4Me5AguHzavZoQnP8ClYsjPABmHwAqsjt1bgcP2duydG0w/ccZxWg5jkNmiKhIRtbMJkO7OWuSPGMeLyRtez/nwgoxMTvjgaH/1ST34QfBrO9u4Fq7efG0Yi/V63YsPXLXB/gPZqwWrWrd9PZPpvned6VUISwiZ5car26az1iC2oPzzHJIa5SftFqxHdrOzca78hUdFM8fXIrqaAhaqPSrNccopikoCVJUHFDAOFT//nbr+G6GTj1ORMsbHN/d9iiG9hmypRXNvORUX2i7r6m5jY5wK78Tk9ReDEm+ALZN4esf0o3x7PUf/eRVfBqu8HE8yo4YOEuc9my1MWAC3yRU8NsGAJ6HiFusd6OsvyiT7lJCaDjnFuud4ha0kmkomMX3Z7a5Wiafams4jHBOvPpf3fQaeuKse7JgLCNShzdc5Xp+NC4c//rm9BEM/UE1k1Wvm/d41nCIe7p0QHPDuwIbRHrvEmGwFDV/DtiEafl+eVh+mirjBhyCXgtoJELDfz8m39OiOf6KtbHnavV3doLnPoe/EJYR5Me5ShswWkqfc6UkCyraNO1QCT8hEzsSd+mC29BHFf3RMBxVChlCsVAnsZ2rQKL/w0TJqSeDv/iH+z8euL6cXlCZ4YdcN3UK+MgaN8n4bJqUtd8nCxWlks3V4rT0GtFPWmDvuNMowhLI4I7vcFZfL5+Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(18002099003)(22082099003)(261009223027099003)(11063799006)(56012099006)(261102130727099003)(261028144727099003)(261102123227099003)(261026121527099003)(261026140227099003)(261022105027099003)(261021121427099003)(261021123027099003)(38350700014)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uoIsLpRpcG6dp6mXyRO+84gOLNMQ6eh2d+FRdDkkr3Wnmb+j0LM0UADKvkIy?=
 =?us-ascii?Q?s6l/nEfqcNkdXDwaWKourLGsD67livLQ22RinN7Y2DVQuUifpMj7+ponL9tN?=
 =?us-ascii?Q?NYf/3G5RErfNbxUj4zYdekTjFxAE3o3smR5AWM3P+uPwDd3OO7nJ8KKLVT0B?=
 =?us-ascii?Q?X+x7mFgc+2w02vXYNL0gRtGTlahLYfLsV65GduvAjIdTIrFNdE4fRS6KAFW3?=
 =?us-ascii?Q?k6LbvEqVQd4h/cSJKQgnYl16ei665m68p9n7kJkJ3OfL3orwSIkOT3zEOeuq?=
 =?us-ascii?Q?nuYUfT24Uogzi28UJ9+gBg0M0gzrsU3qHWTxIf7A/qjXnmZ91e1hpOwBWmfY?=
 =?us-ascii?Q?dj675DaZZp+ZMjolW7zic7vJgj6TgdFxbUsPijxBvfFy0uzpnwyetYS0+bia?=
 =?us-ascii?Q?Kza1PrW95gOyLXptLLK7+qCMWRFukhXthKRWEXFF7Qrlxs+xak+/lAM4Zvrm?=
 =?us-ascii?Q?kBSexZXQCM2la6lDCOo4SoLLq05LL9ec0Ml6zDgVFT2/XEmKJE+EUDT0kNqu?=
 =?us-ascii?Q?VTIrcfLzspVk8lgXy3h++HLuaZLSDEY+5ooKGyey64Ia/3f48NPPytLnBFVt?=
 =?us-ascii?Q?BS0fWFQAspQtkThlmfToCCRz/9Ytjs/JeWnDb+4t17xBYhbtK2NECJOmWF9y?=
 =?us-ascii?Q?mNAwcJYy/L2j1PPbrF/5DE+kZLj+5GaXMZMgPfpLLfUo8ggMCjohRsSd9dZS?=
 =?us-ascii?Q?J7WvRBgpMscy9wmHIhUgeIPD7DXHoGkMerHUlkKGnH+FxWoUdRp9j+aT15LQ?=
 =?us-ascii?Q?ty2W9t9K0cJ6nhLWfvUIFDAnorvVOcB3kYcNOMFjmCmFawS6AGyd1+qjXizM?=
 =?us-ascii?Q?7/KQcU1rDHOPjjoPs33K9t2KbSDK9QOpmp+EUbs5rrMsuC2k6638muvEOSBB?=
 =?us-ascii?Q?16twk5dJMAkAprOJaRblJ4Ui1OX3zorF8qCnyGUfrd2Jyo1sIdGAa+2Fj1+s?=
 =?us-ascii?Q?02fgsxLm1tssrVPK7nA/lzP0cpugMYDgmcZzwA2gSCG/l0f4NEFzejvn6gkk?=
 =?us-ascii?Q?dUcXRDZfjrytDpb+fxlmLM5oHN9FRBfP34a6Sssiakgmd1XA0CUo/8cr1H/o?=
 =?us-ascii?Q?LQr7zznUtmhq5so9DWP+ryWQapYT52z1GqqAOSEtGd4BFyvPD2SIfHY4NhKT?=
 =?us-ascii?Q?Mn6YsxudyG7Qzm/rSKjkzxHe8mNc0g6Vqm2D0CEdcusot76kk9CqyPXsLJYx?=
 =?us-ascii?Q?lav2V5Nsj84xFSoqqmz7a26tUf7+2ZMVJoJDBKx5ntzGNE/+Ftrrk8vrc8Y7?=
 =?us-ascii?Q?Ekycd2ZhdY/u3pwKbcUxr2QBapbPLt1rXgkGQABlKWjewK7u2BKz90et8yzK?=
 =?us-ascii?Q?nVwpJMlbet0ElQYC0e2zd3b9rK/1mIw2usgIJiv4mdesdnUfuYv3VyTNCBWB?=
 =?us-ascii?Q?4CmlCelI3Idx1AgBV7EKth+bt9xFLJI7vf9DQVvYpqyIEXb9j+Zb0UFZiL0E?=
 =?us-ascii?Q?VnnhlJm1YiM/ekKAgDuk4R1VVzZWDojr3pZKs4RmkhBtJLuU0u9oiJOYuYVA?=
 =?us-ascii?Q?dxQ4xBQA2vU2ldaPE00IU+h5+I4fyNMXsNj/n5XstSguEWNIM75/DGNBDvY0?=
 =?us-ascii?Q?tcrbbSTL2ztBpMoiPf9yvY4iPhsdXu6GV+1AfrOkL2GKfMNu0woZwKT35YhX?=
 =?us-ascii?Q?ArX6dB1IZ+e5wwNgtNxSNSWL2BSRY9EhT/wFeUWeAj1xHeTxeDQ4vAk4PZWd?=
 =?us-ascii?Q?mQ2cmFkppR9OjWY7y0RrG8u1Zf8EdLFojXbo/T75DRfayA9+0THkPYl8BLa7?=
 =?us-ascii?Q?CvHBJImqjOpveD0g3XRlVI29w7A9yrVktotDIE/QJoLj6kB9raxY?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c509410-ca3d-4d8c-a461-08df40544ee4
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 00:31:35.6518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NDZPPkViL5IHJXruowaltbHEegcwc9Eu5Fr85Z5RjgFDwKYgxQMa26q84ka5Mua+H6ey5M8PdxetXmWPSsW9VBJFswoKgSSADqrQgsYq312ZEPcQzEMUcN6Jhop6+JaI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6867

No functional change, just for preparation for cleanup.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-core.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index ac72d9357840a..ebad67d6f898a 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1456,18 +1456,6 @@ static void convert_endianness_formats(struct snd_soc_pcm_stream *stream)
 			stream->formats |= endianness_format_map[i];
 }
 
-static void snd_soc_del_component_unlocked(struct snd_soc_component *component)
-{
-	struct snd_soc_card *card = component->card;
-
-	snd_soc_unregister_dais(component);
-
-	if (card)
-		snd_soc_card_unbind(card, true);
-
-	list_del(&component->list);
-}
-
 struct snd_soc_component *snd_soc_component_new(struct device *dev, const char *name,
 						const struct snd_soc_component_driver *driver)
 {
@@ -1504,6 +1492,18 @@ struct snd_soc_component *snd_soc_component_new(struct device *dev, const char *
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_new);
 
+static void snd_soc_del_component_unlocked(struct snd_soc_component *component)
+{
+	struct snd_soc_card *card = component->card;
+
+	snd_soc_unregister_dais(component);
+
+	if (card)
+		snd_soc_card_unbind(card, true);
+
+	list_del(&component->list);
+}
+
 int snd_soc_component_register(struct snd_soc_component *component,
 			       struct snd_soc_dai_driver *dai_drv,
 			       int num_dai)
-- 
2.53.0

