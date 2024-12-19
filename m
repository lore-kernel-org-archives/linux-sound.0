Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010035.outbound.protection.outlook.com [52.101.228.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343C3320F
	for <linux-sound@vger.kernel.org>; Thu, 19 Dec 2024 00:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734568553; cv=fail; b=pidFm5/7xP0xnGD37AM2382WOSvIctZc+mSqqhW01IE13QHJviyqpGGy20x+Aqiw10QeJSvj9Pf06Hz4Yvp9+vNMHD9GeufqhaXWjDD9hkQIJLOTRCEVmaRaC3CSTZoIuXEJUm/ngBLjiadpbB8oQVxb7UjmnPreThKsU0ccEE8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734568553; c=relaxed/simple;
	bh=G9kaKzuDafMKVegT1VF2G1sj+JLPn4enRMfBvdtQCes=;
	h=Message-ID:In-Reply-To:References:To:From:Subject:Content-Type:
	 Date:MIME-Version; b=EzIfJIlbGe76JDccN7VRGxTnxWXFufhcdYC8gFKYrQyLmYCM1jbtloN1LhGSdag4XM3jY/GRbOwa8NH2FmkpMgof9yRu128LVa4eH9ZbiVPwgZNQdOj5kSX3D6Zn5SAR572+gZ3EpmRNHxSZww6oTUqeOtSTOWVTRNqDmrE3dvc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=bab2Yj8t; arc=fail smtp.client-ip=52.101.228.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="bab2Yj8t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TgfMsIsMlFaDJ3v4Zgy5Dj/A0TG5krm8AuwZ3xo7522oYz8S5UtnGiSC1g4CVzMViHBtbABSFr/aGGNUM13RIEHYbMHTuH1lXRchLNGisr3aon0T2pUKXxqKBzzFthUkvgrJPnT0gG9DBT+ETTPydsOykmH5ce04yKfIRC3BGYvYHrjqeEatRE8wTPgJdthJ2rvdtqeIq74+aDtC6b0JY7XpidhjFgf+r5Sb/OhdGEQNvXkwuwA8JL7COJCtKAin5fgzr1tWLh743+yQQRxXIT1FapeRfh2/nRxOLH6KJUKpGrD4VesbnddhPoPW6rv/cf4HoVzrpepLmqyRdIHmzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VWuUWjPiluTxqbXkK51L/VWZHbvqsuL4ztRIhfBst70=;
 b=o/6GfhX1XeACBX1ooORJzmWjUn/H76W0m8lX0P1d8v6Y8ALEbo8jo1GNj74kqovIGJ+UDtj3V8sWdW5zej66NRun6Z3U9IosDGEPR6NWucnU3SohjjShjOhBdgtddA89lF15E8ExyTXmfFCemilCXqP6w7O0mbu6PbAS7+2XhP1Q6xsyvx0WPJVby0EjqJU/t4wwN/XqzlizPcsFm/uZI6YxNLI0/SKZuSVKmp1Of48LV3XDvWCNM028U6HfxncvGSYV/0biuj6Eo8y+D29RJX7kGQalinN5FB6rCYc/WhTZ21bfoxsJ9xpUOtH8HE19v8jOaLMoZvqPWN6OlZKj2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VWuUWjPiluTxqbXkK51L/VWZHbvqsuL4ztRIhfBst70=;
 b=bab2Yj8tkBCpo7cge8zFGIdXFf89eHneig+l9UyxXzH7zELP6NjceuPmCj0snx+ShBJ+SOvXWxKO13LTBLe3/e3nCc/jOyh7W9SsRaHBAOL+i4mbxviATUWpKq1TACMkcpCuyScxLMHg0DmN/9Y1L2LUVgiT669Qkqx0ggcLR/0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB13794.jpnprd01.prod.outlook.com
 (2603:1096:604:36c::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Thu, 19 Dec
 2024 00:35:44 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 00:35:43 +0000
Message-ID: <87ikrgcxwg.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87r064cxym.wl-kuninori.morimoto.gx@renesas.com>
References: <87r064cxym.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 6/6] ASoC: audio-graph-card2: Use extra format on each DAI
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 19 Dec 2024 00:35:43 +0000
X-ClientProxiedBy: TYCPR01CA0193.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB13794:EE_
X-MS-Office365-Filtering-Correlation-Id: 447b0f76-4766-4e97-d8a7-08dd1fc51291
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PWQd5g4PSxWN0go6AUF7MhubgHkY52nfrfCEmS/8xVdb0f2rtsTOLX1z3yoo?=
 =?us-ascii?Q?37fAH4KNwWoloRWmDZLRJEn9o+uYJIPEqZq2iW5Ft5iUiPjsmm4q7q63EvUm?=
 =?us-ascii?Q?DLnIIjjjxuQOxFy8phVRppZCLKshdoJxxHHyDJ2pdzmOC4Q7JVaBIBmxmhbJ?=
 =?us-ascii?Q?UbTQgswX9uZxWgCAWRltnRov3bArrERBF6KjhNm2Rq25pdGZS9NUztY0hXYP?=
 =?us-ascii?Q?z/ylPA8dsrr7EPfodJm3MSX1zEF+DUC/mIP3UQAgxi+THnViyvJypl21xrlO?=
 =?us-ascii?Q?BD3r3aHIGNU6VJ7JrTVENO5GOopr8zyrCleOiKRgKQS0qAFq1wze7S66NTHC?=
 =?us-ascii?Q?IvXSXIyXLgOnuubGhNMO8WbCcPsCzYle3+hUakO9SUm+hd2lTKUQouTz1wHQ?=
 =?us-ascii?Q?Aft58wdR2GCRb4SIvPcgOgau+ohus4aEkNeAtbZy6vdO2v3tmNf3ddBkvbJy?=
 =?us-ascii?Q?Hv4vILltwdhSEc1oe+33l7bOJEzvMGomiNHUbNd/UdHlC6itC/j7WFSGNTj+?=
 =?us-ascii?Q?AgPu7uk9Ih+qs1YhjEyb0KRE+nvA+vgvxLomqbject527QB59Uyaxcla3p+u?=
 =?us-ascii?Q?46m/T+srilfoky8mSMapCWg+Bbd9zu7UJy1H7atee79C3u3OQjx7L5YpHrSP?=
 =?us-ascii?Q?VADuxO7/ywA/jIcete5awIgL0pwkq4M58i6wXgw2RuMK2ooc1z0O8Nuror40?=
 =?us-ascii?Q?1n+UDmt4JXf8HOqfZ8A0oVLhTtLx3gEyBbk7NbBI10ll1LEhzQArBFDiCTkP?=
 =?us-ascii?Q?SF7fa8/UpUx18kCNXK1t/V9M1yTvLbEocUQQMyI7yh5BUsd3XLI6UEhD7prp?=
 =?us-ascii?Q?DffQNooDDruJxLgP/LvmKvfVU5YC6KQIONzkmT4PCRCIwC2Aq4mT4lqKfWvn?=
 =?us-ascii?Q?z2pgIqAkDHuBk8zXEMYEmoLzqavoSR5tItY1gVyyfr99PkCzjZ+xH4ARFruY?=
 =?us-ascii?Q?Jlm2N3KuGMxUqt24bZl6PCuGVvWCXADSWz1qEFoCgPaBPNelSLAh4Kkh1WD2?=
 =?us-ascii?Q?LvjuGuRslineYR1DQtF+7g0lZsd8uVpzqCHjQxaEVwNiqzP+UJaBM1pqVLTv?=
 =?us-ascii?Q?uI8LUpUsld0P4eZHPlAVUO0nAzKKmuJi/20+my3zz7Xkx25YHi6IKWls4wL/?=
 =?us-ascii?Q?gp/gZTtF87QYWvLLIazn4anjoWBcVo6lWXuAt+tw5gh91c78lbM0PtWspjVg?=
 =?us-ascii?Q?vgx3P/CaLq1E0xY1rrP1rTPrjy5RN73Ck3q0wzEOHW/hVk2+2glmrjVJYrv0?=
 =?us-ascii?Q?B6dU8eZgd1opmfEL8laHGy/+FPhGYw96q/dNUqvlHh+b0CocUCQu3cwkDR7p?=
 =?us-ascii?Q?mbW5eCF7eCls3XpxteuZm8bPZEP+hNjIai44lfXXtzekKbGUhR0bjCvxusfQ?=
 =?us-ascii?Q?sGVBpzXUAjbJeXWsQpzdGSOOdSqiZG+Nf4rwwIeV0yZzhIVuwN+sTptAOZID?=
 =?us-ascii?Q?tqhGmu6UQIg2+/sNst3yfwfzDsyIBIr3?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dN5HQ2PG7tcr77lElJvb+sYrOrnQc6GKw4lVJqV3PZDqd++4LJGi8AjgVDIk?=
 =?us-ascii?Q?R8FdqAZEMAnSaLNhnjsyFEeBCRtRyJp7Jz1zwYfBYM18sa3jYp04IsCmCcAw?=
 =?us-ascii?Q?2bvdqj40AP7DQNNwG9GIC5eSaRZVI78r649XFaCmf7Jvrk7XQLu4eU/qAHdy?=
 =?us-ascii?Q?6OPKLFeA7Drh9N94CJKHdBk1VK/MmVCm4OGgU+RxiwvKa0jWPy9QRt6O0T9u?=
 =?us-ascii?Q?qiqk3qzYdilngRBe8XGoQc1tP2O6bEh+8+8knhJ+kqS88N59Bi+t1l8NnSW6?=
 =?us-ascii?Q?cJOgsBD46C52PR0ghnewUUpLGCuujRiorrMT58S8WD0p6NUz3Ue6s08rmkg0?=
 =?us-ascii?Q?WGZcTXAkhJOB26BfnMTkj2Z5S0pO9qQlPwqO0OJLwu0i1oadkEXF/TUTRGq9?=
 =?us-ascii?Q?fnQKHfkw/SrXZqxgVaat7UcH7d2qmnigpH34bqrKnPQoYw2gAd2FEDnYndal?=
 =?us-ascii?Q?7bh5PrhkMY5ZN98Y7ztrmux6dxOeEUr4UC3wAuwnaLVsUF3Mgqu/XayA8vUx?=
 =?us-ascii?Q?vN2oRA9SckYxT+0cMaiiMAPRwO6YJdemjPN/GqPA8wXCifyspNXYhYcvyG9e?=
 =?us-ascii?Q?4t70XgytbRpq5if5goqb/V6hIgvWqtmasxWfn1H2P3uaNp1E2nftNtrfOrgi?=
 =?us-ascii?Q?kJ1pQJjt/ZeqYFCNdBu4uZt0bKkdQzE31odzcUAa6bzYRIUNqAN9dIuoPBhp?=
 =?us-ascii?Q?+jI544zYwLbmMHxDwYFmJKvibFALc/DZ6DTiCgKLGV6ld/JBugPbOi7CU2lp?=
 =?us-ascii?Q?UTNBDFyN2UhjB25ASVqlE5snX5Nbv9UQI2wB83xm7UGUSisvk7QV//ojPfti?=
 =?us-ascii?Q?tc+dSTf9u6cw/zCUx0mSZ5yaqg3JYJmm2KnAGcBymX9LAd8s3UNsyP/jGGDL?=
 =?us-ascii?Q?4qyGKyCw2S7Ivagk7Hy07OyVA9hOfdqHWvxzed9AXFBofTxPBbktWmhsRLAw?=
 =?us-ascii?Q?phY1R7LssFQigNAcZZZKQCPIgM1fyAF/93DvljRfvkBmtFlpgjxzIcU7Df0h?=
 =?us-ascii?Q?UoYLfNV5duo+9mObjhNjsg7l7EFbftZrPOSRlDUxfKHJeZOB3sbMv7Tsr7dB?=
 =?us-ascii?Q?T7WQ595MKmox0uGJue4Y7hQqKIzt6iMrIlJ1A6lOX2gZv4wDE6T+j1LJiLeC?=
 =?us-ascii?Q?Ik+CanYqVEyTkL+QtXXQrSZYpSTEWaUwUC4VVIS/dUppN35RqwSY6g30X3iM?=
 =?us-ascii?Q?Ud/LfItHlw9mUpn0wXTDkriPMKPmA/vTjY93eTVmnAvevPJ2uQDmrrUQyIn8?=
 =?us-ascii?Q?lssMV97Ey/oWiZlIwaWtJgHZD3PQ0IMgOaUBzGOwjs5aQXv6zhSSftbzs1p8?=
 =?us-ascii?Q?n41SKq2GM3nkTuw09zVnoyBoxXc8PQMIH45v1xMrhdOyUEdNoI7fNNdLbpCt?=
 =?us-ascii?Q?dq9Yubf0SeK9Yk4Dr373JeeWWH5yJGWwaXXBsLDi+zwqdhwtdzOKWMulgJVJ?=
 =?us-ascii?Q?C8L/gzGBfPrUMvh6VxvEZ7kLPCispNaftNCeKg525Ej7nGiSu/mHkgUEdBNq?=
 =?us-ascii?Q?4dFDqhRxYr0+8ymcOHLL5AaTi4+NhJQleph9soM3pb0mvvB221E6G/o1YfBj?=
 =?us-ascii?Q?CqlSQb5/ZG60oHbKM7WAcuTUpFYbZCP9ygNgm+oTikfVBgSGVNQXNBhihus/?=
 =?us-ascii?Q?8UBWR7xIDN1nQWKaB5IfIGc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 447b0f76-4766-4e97-d8a7-08dd1fc51291
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 00:35:43.8023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wug6iXurN/76uBo7IFvEGTLzA+upoKXrwg/XTN2yzQb/Jiub0h7p9F1UQ8icR848Yk0yppo9VzzV6tB8cPlylGoCrDG+fBOqICn7bwhREhvNOOGmgGabyWzWN3RnVJJf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB13794

Current ASoC is using dai_link->dai_fmt to set DAI format for both
CPU/Codec. But because it is using same settings, and
SND_SOC_DAIFMT_CLOCK_PROVIDER is flipped for CPU, we can't set both
CPU/Codec as clock consumer, for example.

To solve this issue, this patch uses extra format for each DAI which can
keep compatibility with legacy system,

	1. SND_SOC_DAIFMT_FORMAT_MASK
	2. SND_SOC_DAIFMT_CLOCK
	3. SND_SOC_DAIFMT_INV
	4. SND_SOC_DAIFMT_CLOCK_PROVIDER

Legacy
	dai_fmt  includes 1, 2, 3, 4

New idea
	dai_fmt  includes 1, 2, 3
	ext_fmt  includes 4

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card2.c | 75 +++++++++++++++------------
 1 file changed, 43 insertions(+), 32 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index f4c825b56a7e1..2bf7b25e00ed2 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -658,8 +658,7 @@ static int graph_parse_node(struct simple_util_priv *priv,
 		return graph_parse_node_single(priv, gtype, port, li, is_cpu);
 }
 
-static void graph_parse_daifmt(struct device_node *node,
-			       unsigned int *daifmt, unsigned int *bit_frame)
+static void graph_parse_daifmt(struct device_node *node, unsigned int *daifmt)
 {
 	unsigned int fmt;
 
@@ -684,16 +683,6 @@ static void graph_parse_daifmt(struct device_node *node,
 	 * };
 	 */
 
-	/*
-	 * clock_provider:
-	 *
-	 * It can be judged it is provider
-	 * if (A) or (B) or (C) has bitclock-master / frame-master flag.
-	 *
-	 * use "or"
-	 */
-	*bit_frame |= snd_soc_daifmt_parse_clock_provider_as_bitmap(node, NULL);
-
 #define update_daifmt(name)					\
 	if (!(*daifmt & SND_SOC_DAIFMT_##name##_MASK) &&	\
 		 (fmt & SND_SOC_DAIFMT_##name##_MASK))		\
@@ -711,6 +700,17 @@ static void graph_parse_daifmt(struct device_node *node,
 	update_daifmt(INV);
 }
 
+static unsigned int graph_parse_bitframe(struct device_node *ep)
+{
+	struct device_node *port  __free(device_node) = ep_to_port(ep);
+	struct device_node *ports __free(device_node) = port_to_ports(port);
+
+	return	snd_soc_daifmt_clock_provider_from_bitmap(
+			snd_soc_daifmt_parse_clock_provider_as_bitmap(ep,    NULL) |
+			snd_soc_daifmt_parse_clock_provider_as_bitmap(port,  NULL) |
+			snd_soc_daifmt_parse_clock_provider_as_bitmap(ports, NULL));
+}
+
 static void graph_link_init(struct simple_util_priv *priv,
 			    struct device_node *lnk,
 			    struct device_node *port_cpu,
@@ -721,15 +721,18 @@ static void graph_link_init(struct simple_util_priv *priv,
 	struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
 	struct simple_dai_props *dai_props = simple_priv_to_props(priv, li->link);
 	struct device_node *ep_cpu, *ep_codec;
-	unsigned int daifmt = 0, daiclk = 0;
+	struct device_node *multi_cpu_ports = NULL, *multi_codec_ports = NULL;
+	struct snd_soc_dai_link_component *dlc;
+	unsigned int daifmt = 0;
 	bool playback_only = 0, capture_only = 0;
 	enum snd_soc_trigger_order trigger_start = SND_SOC_TRIGGER_ORDER_DEFAULT;
 	enum snd_soc_trigger_order trigger_stop  = SND_SOC_TRIGGER_ORDER_DEFAULT;
-	unsigned int bit_frame = 0;
+	int i;
 
 	of_node_get(port_cpu);
 	if (graph_lnk_is_multi(port_cpu)) {
-		ep_cpu = graph_get_next_multi_ep(&port_cpu);
+		multi_cpu_ports = port_cpu;
+		ep_cpu = graph_get_next_multi_ep(&multi_cpu_ports);
 		of_node_put(port_cpu);
 		port_cpu = ep_to_port(ep_cpu);
 	} else {
@@ -739,7 +742,8 @@ static void graph_link_init(struct simple_util_priv *priv,
 
 	of_node_get(port_codec);
 	if (graph_lnk_is_multi(port_codec)) {
-		ep_codec = graph_get_next_multi_ep(&port_codec);
+		multi_codec_ports = port_codec;
+		ep_codec = graph_get_next_multi_ep(&multi_codec_ports);
 		of_node_put(port_codec);
 		port_codec = ep_to_port(ep_codec);
 	} else {
@@ -747,13 +751,13 @@ static void graph_link_init(struct simple_util_priv *priv,
 	}
 	struct device_node *ports_codec __free(device_node) = port_to_ports(port_codec);
 
-	graph_parse_daifmt(ep_cpu,	&daifmt, &bit_frame);
-	graph_parse_daifmt(ep_codec,	&daifmt, &bit_frame);
-	graph_parse_daifmt(port_cpu,	&daifmt, &bit_frame);
-	graph_parse_daifmt(port_codec,	&daifmt, &bit_frame);
-	graph_parse_daifmt(ports_cpu,	&daifmt, &bit_frame);
-	graph_parse_daifmt(ports_codec,	&daifmt, &bit_frame);
-	graph_parse_daifmt(lnk,		&daifmt, &bit_frame);
+	graph_parse_daifmt(ep_cpu,	&daifmt);
+	graph_parse_daifmt(ep_codec,	&daifmt);
+	graph_parse_daifmt(port_cpu,	&daifmt);
+	graph_parse_daifmt(port_codec,	&daifmt);
+	graph_parse_daifmt(ports_cpu,	&daifmt);
+	graph_parse_daifmt(ports_codec,	&daifmt);
+	graph_parse_daifmt(lnk,		&daifmt);
 
 	graph_util_parse_link_direction(lnk,		&playback_only, &capture_only);
 	graph_util_parse_link_direction(ports_cpu,	&playback_only, &capture_only);
@@ -779,14 +783,21 @@ static void graph_link_init(struct simple_util_priv *priv,
 	graph_util_parse_trigger_order(priv, ep_cpu,		&trigger_start, &trigger_stop);
 	graph_util_parse_trigger_order(priv, ep_codec,		&trigger_start, &trigger_stop);
 
-	/*
-	 * convert bit_frame
-	 * We need to flip clock_provider if it was CPU node,
-	 * because it is Codec base.
-	 */
-	daiclk = snd_soc_daifmt_clock_provider_from_bitmap(bit_frame);
-	if (is_cpu_node)
-		daiclk = snd_soc_daifmt_clock_provider_flipped(daiclk);
+	for_each_link_cpus(dai_link, i, dlc) {
+		dlc->ext_fmt = graph_parse_bitframe(ep_cpu);
+
+		if (multi_cpu_ports)
+			ep_cpu = graph_get_next_multi_ep(&multi_cpu_ports);
+	}
+
+	for_each_link_codecs(dai_link, i, dlc) {
+		dlc->ext_fmt = graph_parse_bitframe(ep_codec);
+
+		if (multi_codec_ports)
+			ep_codec = graph_get_next_multi_ep(&multi_codec_ports);
+	}
+
+	/*** Don't use port_cpu / port_codec after here ***/
 
 	dai_link->playback_only	= playback_only;
 	dai_link->capture_only	= capture_only;
@@ -794,7 +805,7 @@ static void graph_link_init(struct simple_util_priv *priv,
 	dai_link->trigger_start	= trigger_start;
 	dai_link->trigger_stop	= trigger_stop;
 
-	dai_link->dai_fmt	= daifmt | daiclk;
+	dai_link->dai_fmt	= daifmt;
 	dai_link->init		= simple_util_dai_init;
 	dai_link->ops		= &graph_ops;
 	if (priv->ops)
-- 
2.43.0

