Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794288220;
	b=xajqqoIelYz/CAQj9vRKFENTku+h88VsQIegSqYgoD0+LgvyRKXmapu1xlb8SehOoeHL
	 riDho7XT5Hr9WFpI6CWDqMUiw/CuWn+7x7N9BJa6m0FrW/C28u3l+CcUVIYmRZFWyK6mj
	 mwKZHGrBAiMoZCvK3RAsvFlY8+p3LNVH2Qgom03m+iNKpNuq0BMAZRcAp/7M5bwQy5Sum
	 kxecaLikW/Q4EWDG09eXguMilGwynjgSkSHG0o6SrjGayjHdRvQNXFcIYNoopQz37OVPz
	 QGPp2329FZ1URVMCcITUZ0peg4jCygYCj1eG5dtLr5xk1S8iF8+NGiqV3wPNIuStMZw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794288220;
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
	bh=hlURryOyNGNO3OHwMfLZ7ePsQgWyiAtFW1k3l1ze5Xc=;
	b=ebxDIkez+OddqLnSzjtyirEpeYg93d3rucyiNctRO/Ni55kmOMA5CgDUsyoTzGW+mt89
	 sbj2OLsLxfF4BlQ97HouRAQl4T5MLJ2jZz5hfkjvslqJ0rYtr/Plg9UaSGo7oujFmiuTW
	 pyXSvHDOmJmsTKE3ZEQWygRJJw2L6hgRsxONcg2PmJqZNCravzEeMrJImxj7J6gKIBT9X
	 XJlpEKB7S+oCDXOXO7ZBlBiB0CoxDgl7bymopz4T5vUOz6eM9emGFdanuj5AHaSB5Mv6B
	 c+SD2lCQvGRDFr73Jt7rlMZ6TIG4j3e8B6W3JRQYfqtmoyQFACvTewSn4a+gLekL17g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=TWd9vXSB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.14
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010014.outbound.protection.outlook.com [52.101.229.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31813606A32A
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 05:23:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31813606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=TWd9vXSB
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e+OaAtfchPO43eoThw5n8+7wNfAxAbAgWGSQ+1xE+xLPwotisxlLgN/nXS0lZsv1h+gjjy1WQxaRAkKzge0kXiAwLqT9C2P0XtBU3AFBZRXkKZ+K+v5CXnYsXtcjowFVtURKsOAHjvWhkBKdnr/zBXDmawUcc9QWBE1paGDF3E5ncl1A73XczZGamDxUVrxngF1GzeLrv4gCS+R+m6DkMtehvZpgEaXJuCITdaAZYcQzFqDLxZPxGGC/D8ns0U+UlFddE+hfnNQVcluEsrDebWqMOOdlwnMh/uBgUmJzdt3yKm4dgUGOfbNoCEP7r/wWoUFByMWoISCd+UVNDkGQLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hlURryOyNGNO3OHwMfLZ7ePsQgWyiAtFW1k3l1ze5Xc=;
 b=gGfsjYO9sn/8j7gkXJFuZsZX7CNryQc+kVLXblk+KDubEH4BZBvBXWXUYF39usyAtWiE6qP7rEnCeFjahZFaLbMi37vIbwyAxfdJK6Ow60nUMAoBB/LGRgKsPWGjYflL4/Aj7yQ1vKgzC2IJ40Y0VneR7fEb1nPr9BiFXCSldlZ4C6monmXdGwxK2Qh/Jquc6evs7a2mB4oxVQ6lLLgFS+JywugZdIuW1vvY7Fvr3ZtPWsD3l10suPEjz18o2TdXmgnQ93IqggyYApGYqRqxM6V13qQm6NHDD/tgRiOJX+erQfkCNYeA6z5fIDE3UUlMJdhtqSDNOIEpr1XqhNwdiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hlURryOyNGNO3OHwMfLZ7ePsQgWyiAtFW1k3l1ze5Xc=;
 b=TWd9vXSBVfCO0iHQVpr7sTDU6zQP+mjXr6VBLwHqIgj7RAFKhF7DpNUlsKTl0E4paVUhSDVS0Rc8tVZ5UsdaiAKnqXlzyMDmGAvATHVgnshWwaD80f74cr9XX1P0hWKfNFrvUS6RlqlOsYzuSTFLuGUmwspusRUQIh6G1SI0+Vs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by OSCPR01MB12483.jpnprd01.prod.outlook.com (2603:1096:604:32b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 05:23:38 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%6]) with mapi id 15.21.0592.012; Tue, 10 Nov 2026
 05:23:38 +0000
Message-ID: <875wy5ntt2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 02/20] ASoC: soc-component: rename snd_soc_component_{init/exit}_regmap() to snd_soc_component_regmap_{init/exit}()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <878q31nttj.wl-kuninori.morimoto.gx@renesas.com>
References: <878q31nttj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Nov 2026 05:23:38 +0000
X-ClientProxiedBy: OS7PR01CA0312.jpnprd01.prod.outlook.com
 (2603:1096:604:26f::10) To TYYPR01MB15175.jpnprd01.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: TYYPR01MB15175:EE_|OSCPR01MB12483:EE_
X-MS-Office365-Filtering-Correlation-Id: 77e9f193-4c55-470a-4538-08df3eeac671
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|52116014|366016|18002099003|22082099003|6133799003|10067099003|11063799006|261102130727099003|261102123227099003|261026121527099003|261009223027099003|56012099006|261021123027099003|261021121427099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	gvdnfNXDyIdJUUtvnm0iojUte6LyUUP/kMQz0OKUt81Wqki/CZR5UQDwmTq3SA/8XUlDpfu5Nzb1jiDUoGttP79t7STuoCgxZt3R/c19FEJpJRXqU4jZi5+bcF2HYGLu6dsFh28rgDsnAnb37TljJzpr7C+leFbmxRV8BpZr8bESEreQb5R0GOGyPyGgvDCRSJNaJ1YkEjjH2hCxm5RyOR7EL6knn9iVLRc7o9cRkaTFkDea2ka61Hpnrt5eURf1Vo+QjNDart/H1ItIR/zcfXFQZ4rv4ywLvfljs3RVHal5V8fJ/KQr2q/rywxorhCdLrqpl853qPZ+mspqbVXTApvmeK9q2YF+Uxsu+DQNZLz38GeEvBOXVgV58TNK5GSRBup5pWnijukrzg81y5JPQArDon5SHYqBF1QMht33UETwYb8HGFNbs93bOE64AxAHvKOBkBK36WJG7gk4WK06N3XVT12ttqkNvIfSdJ+k9SmlK2YX2V3b9wtNDR4QWSLRh+WWXGOgZ78drifdYRXwrEhYAtwtaBJsxePtjVFVb4B8Ytjiphw++i7yGfFRuq7zseU5vhAIPJuFIjLUKUejafnnZn0bwKNxTVV/t2bKxXWMGMtZkmLiaKdOIGh5oCiWVkjOVwlDzDD5PpNg0IgT1mjUWzHZXDjRH0ImDYD5YbgTQLXsZdsfISBBuxeRmYId8AcxmFlqpRu6hjKxPlpMHduhsJuGKPIa0LW6fM1evuM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(52116014)(366016)(18002099003)(22082099003)(6133799003)(10067099003)(11063799006)(261102130727099003)(261102123227099003)(261026121527099003)(261009223027099003)(56012099006)(261021123027099003)(261021121427099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jIbyzrmTOj2pce9JJUfu0FmC5sM4nzBPkJHZkdS016j78bOj7sfcr13OElGU?=
 =?us-ascii?Q?LihugdeV8KkX+iCWaQUAojU+tyLYAjOVr58Kve7luwED9mddj5MCrTUnJHZW?=
 =?us-ascii?Q?bcqMiiapLgSk0c1/L4ezOdg0rIiB1cHeyHOxj+V/N6CllvFBk/5FBwNycVL/?=
 =?us-ascii?Q?phgsP1y+KSyWy2lHFW8tN+nJxVBu8Nu5eYlGEWMYK7/HmGU5Xgt+lTmiQ4c3?=
 =?us-ascii?Q?HL2A2WeeMY4Xs9SZsz90wG06MG8X8e+Y4yT/+o8xQKv74rI8hKcPkGt3BjDl?=
 =?us-ascii?Q?g9rKdF+DGRuq4u16nnPiEfoJEfvgFACfvDlTvYsr2HjSCrQWtJjFyMgnMwgk?=
 =?us-ascii?Q?yy09ITezg8B8eDHl1ftx3ZEeoEzk7JbPiv2uPvk3A83Cp7lG3XvM20GRXJ+l?=
 =?us-ascii?Q?gl+G2L2Ythgf0vL5Y7Lyu4k5Yun6MBOK919VdaXMP7+dw78R23csBydvLroU?=
 =?us-ascii?Q?3QeVZ0O3rzCzNo3b/47PrMRBJ/fT8lIZ1PPw9xIv0ZzPVUtEUxTCnIH1fLO+?=
 =?us-ascii?Q?XZIrHZOaOKD42DOzDbyDvBYqV2Df8/UHWllg/xb4PzFSRWqc22YeqS4BjsLz?=
 =?us-ascii?Q?3mlmtFcoL1m20OuV4nKo0wC2hEizi95tP+Ymwjxcwd+VBYSQDJTsS6GQtjDr?=
 =?us-ascii?Q?onb2j3uZlB4fvbfj1zbqwJniAksaf+0tYvsDNWUtttUGy7uLXkxWCw3gxcdk?=
 =?us-ascii?Q?Te242KJBwk3VN4Plgioc0v7u/o9ZkZhqg/7dtnw2neVXlZ9cVM2W/EldY9GO?=
 =?us-ascii?Q?KqUuX/HfKvM+dVd/cHAAchjjlzlLX6tRkmqOFkpPvOwWEiJ2mTwKd2OcX4G7?=
 =?us-ascii?Q?o9uKTmI4PUrJYXMeAkTbD6KxsFoDrKiaOKilb3CeumGSiCdc5zE7LCx/LKW1?=
 =?us-ascii?Q?XRmwgjWkqtVV6j6lkAl+WxW6CsbY+a6K+vrJWIOc90BG7mrcJewBeg+3bPMS?=
 =?us-ascii?Q?Kxc+TcCgrE6A+89WQtnbRgKq1zEINR9SokOlaynUgfj9sqGmlHsX7eFZyDHM?=
 =?us-ascii?Q?RvzIt5NDJbeThLW5JgbeMdAI3w2OQYiUI1W9v6kU0bI2QDfb1sM7PrcYICmp?=
 =?us-ascii?Q?DwT2iFovdEpfWzlb55ZHyCjX1CpXPURF+dpFtG8tBkT8r4rs5ysk2MUZJZ5F?=
 =?us-ascii?Q?Uk/bqBrWb1rDd4Qnv//jz5hASjZKhv+8joR0ewK4Q9MV1DA7Ktkybw4KQMz1?=
 =?us-ascii?Q?n0QBOZx8b8HMVwl/PjlW/MXU1t6rFQEWhyADJ/cpD+8ckDzMM4PGbCPdeTXF?=
 =?us-ascii?Q?ly0r1dF5mBFPgyq7JT7g2UOOuh1gBO7Zb8rrH1J262qsH5begkgppaMFMnrF?=
 =?us-ascii?Q?+uwzwkGa5EWCiuZYwKyCIauNnRBB0LFk7SL0hG69+8FIrcDGDXB4tKTrrzXz?=
 =?us-ascii?Q?GQAqcnIZRGudhqv2KmyIcsgWMLvLcO2YO71C76Hr/HDhMUGHh+0iUPf1ScyN?=
 =?us-ascii?Q?LCWgK50yPCQouskInkGbV9tl/JRKxBT+iykw2Flm+PZPcZmNfv/xCdGV/iHi?=
 =?us-ascii?Q?T7/sA0a+U3/8UN7rW45WJB+uiBtms/HfVdEeRKNka1h+nIkEcmYWakLc1vSq?=
 =?us-ascii?Q?pGgP8/GbiRr963jgWJgKW2TnHAeW7z304BG/qrL4ay9PR6WNeg++RoUgcWIa?=
 =?us-ascii?Q?DNOaG9vQ//Je5uTLZSEMcvfS/KoH4vzxW7nesyTlalnPG3n0A5Nt1aUFtXPC?=
 =?us-ascii?Q?oS+5wEouDnXeLR1Tuzl0kafuzQWzUKFO7a335Mgra1/r+3kxCJCG8AdINvRS?=
 =?us-ascii?Q?ha5Hfizvwx9DrVzTqIzTbT2hOouGJQc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77e9f193-4c55-470a-4538-08df3eeac671
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 05:23:38.4016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0duPEMJtu58Inbk18MwrBbHoo3zPL2hEiDNKazrxRAOx6EBdvg1RbLf2g8HqqdTqyFGP0uCccLUnI2PqkskkKNZuskXlqIzv1cNOufzfnxCG0Sm3kum0HaLnifoM7V1L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12483

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

We already have snd_soc_component_regmap_xxx() functions.
Let's standardize the function names.
	- snd_soc_component_{init/exit}_regmap()
	+ snd_soc_component_regmap_{init/exit}()

And no need to have CONFIG_REGMAP, remove #if-#endif

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h | 10 +++++-----
 sound/soc/soc-component.c     | 16 ++++++----------
 2 files changed, 11 insertions(+), 15 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 73d66c9766944..0d565b6c1f611 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -333,14 +333,12 @@ int snd_soc_component_stream_event(struct snd_soc_component *component,
 int snd_soc_component_set_bias_level(struct snd_soc_component *component,
 				     enum snd_soc_bias_level level);
 
+void snd_soc_component_regmap_init(struct snd_soc_component *component,
+				   struct regmap *regmap);
+void snd_soc_component_regmap_exit(struct snd_soc_component *component);
 int snd_soc_component_regmap_val_bytes(struct snd_soc_component *component);
 int snd_soc_component_regmap_cache_sync(struct snd_soc_component *component);
 void snd_soc_component_regmap_async_complete(struct snd_soc_component *component);
-#ifdef CONFIG_REGMAP
-void snd_soc_component_init_regmap(struct snd_soc_component *component,
-				   struct regmap *regmap);
-void snd_soc_component_exit_regmap(struct snd_soc_component *component);
-#endif
 
 int snd_soc_component_fixup_controls(struct snd_soc_component *component);
 int snd_soc_component_add_controls(struct snd_soc_component *component,
@@ -445,6 +443,8 @@ void snd_soc_pcm_component_delay(struct snd_pcm_substream *substream,
 				 snd_pcm_sframes_t *cpu_delay, snd_pcm_sframes_t *codec_delay);
 
 /* REMOVE ME */
+#define snd_soc_component_init_regmap			snd_soc_component_regmap_init
+#define snd_soc_component_exit_regmap			snd_soc_component_regmap_exit
 #define snd_soc_component_cache_sync			snd_soc_component_regmap_cache_sync
 #define snd_soc_component_async_complete		snd_soc_component_regmap_async_complete
 #define snd_soc_lookup_component_nolocked		snd_soc_component_lookup_nolock
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index a6e280c798f3d..6dad994009bdb 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -432,10 +432,8 @@ void snd_soc_component_regmap_async_complete(struct snd_soc_component *component
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_regmap_async_complete);
 
-#ifdef CONFIG_REGMAP
-
 /**
- * snd_soc_component_init_regmap() - Initialize regmap instance for the
+ * snd_soc_component_regmap_init() - Initialize regmap instance for the
  *                                   component
  * @component: The component for which to initialize the regmap instance
  * @regmap: The regmap instance that should be used by the component
@@ -445,15 +443,15 @@ EXPORT_SYMBOL_GPL(snd_soc_component_regmap_async_complete);
  * yet ready when the component is registered. The function must also be called
  * before the first IO attempt of the component.
  */
-void snd_soc_component_init_regmap(struct snd_soc_component *component,
+void snd_soc_component_regmap_init(struct snd_soc_component *component,
 				   struct regmap *regmap)
 {
 	component->regmap = regmap;
 }
-EXPORT_SYMBOL_GPL(snd_soc_component_init_regmap);
+EXPORT_SYMBOL_GPL(snd_soc_component_regmap_init);
 
 /**
- * snd_soc_component_exit_regmap() - De-initialize regmap instance for the
+ * snd_soc_component_regmap_exit() - De-initialize regmap instance for the
  *                                   component
  * @component: The component for which to de-initialize the regmap instance
  *
@@ -463,14 +461,12 @@ EXPORT_SYMBOL_GPL(snd_soc_component_init_regmap);
  * This function should only be used if snd_soc_component_init_regmap() was used
  * to initialize the regmap instance.
  */
-void snd_soc_component_exit_regmap(struct snd_soc_component *component)
+void snd_soc_component_regmap_exit(struct snd_soc_component *component)
 {
 	regmap_exit(component->regmap);
 	component->regmap = NULL;
 }
-EXPORT_SYMBOL_GPL(snd_soc_component_exit_regmap);
-
-#endif
+EXPORT_SYMBOL_GPL(snd_soc_component_regmap_exit);
 
 int snd_soc_component_compr_open(struct snd_soc_component *component,
 				 struct snd_compr_stream *cstream)
-- 
2.53.0

