Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011029.outbound.protection.outlook.com [52.101.125.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985C942AA1
	for <linux-sound@vger.kernel.org>; Tue, 17 Dec 2024 01:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734400120; cv=fail; b=GxCneQRbaihrgIH0SLvjvRRx/tx3RbWr2VHTdX9AfyNDMcuppQbrH7SJaDWer7S3kwA7B9EsJhu2JhUa0pNv6LT3SOdzkHRk6fsM30vCqgEWy97Cu2AFThLrZzK2aYSyWm68/eLq4uHPMeI4+KLnXQRwrcVpD5az+x+a1vNKa9A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734400120; c=relaxed/simple;
	bh=tGcFxxdLtL9v/FocUqoOF+0WgyRgMs3IoGhbzcBshD4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=b2pvLHGJSlr0tq3zMDwprjMW1dfbe+Q4kzsts/gmkhci4wefa+n49YiKUtw3m8aE8tkrsm8XzTnWutLM8KzOBIBoLSkCXD2sGiTyCsvdH6F7c+apQJSBdrCn2PuE2rEQuG1np1YPVz/W/zROo0UP8P0FbIn5chzL6PLfjEkfbic=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=edHiuPCa; arc=fail smtp.client-ip=52.101.125.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="edHiuPCa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dLOxtINY9J6vnCzDZvI+jpIksSdQLV/PW1E++czIfem24/l8veusiHc/rlFq4aB6RG382AAoL0og56A+Sk8HVRrqez54AkG9bRyZXguuI/jQHzOGPnUMehkgCcLqlSfYzanvE/4j0GXFC3cRf8QvWw20fHJlyLZIkyUO0tZR1oahQggaY0pY0Yo0sBJ6rlo6apwkSof4U0icMX6t99TASa0ggH74+5H0rWb5P/FRESDoSuCsCnFqAG+9Z6GovTsvLqqosEO6RpK5N3wDsnpMZDSl7pBeg1Hc+jxywlHk7k/jBP1bKmne08HUdfwlbBf00K6c/jX1K6D0NbMyj6JPYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0zUoAJeE3+6qnE+y8FzuZc7ykrl2IL9PBgyEkfxctoM=;
 b=fzVNwZ1oNLqYLu49rKI/j1dwLMCHov0v664DJyEm2D++XhKE2kDQHM34QPUVNPRwKU0OFw1sJaMM9kQY7PcdeRNuIjnYkeP7ffvg9eJOW4qLhS7vkXv0pBLRCdNDgHvTmNfjjek29zt3hjcW2aFNnYXZQdZp6VwpKunlPIfgpuSxp2I5rU+hBKq6uvf90PZzxzrAQzXe+7e+wCQIDt2qjg/8lPqClZjv5fQf/zEdzYP5ScaezXFeR98TpceY5RG3uCKsqunuhOTCUQTNf+22pE82f9pebUbAONVbykSws4ZTcCGzvZKndB0VE7gAJT/IBOM5jb+4KY1rdAZcO3sD3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0zUoAJeE3+6qnE+y8FzuZc7ykrl2IL9PBgyEkfxctoM=;
 b=edHiuPCa37jAcma43vIH6Yc1DAr7Q8H7igG3vmsyaz7wP+nzrMtk70mw67GPEeUDqN7ykVqMCfR7LNbZ9PpDuiSVilAEP4rLb1Ilbg8aupCYdjFHekcE510OcRl1Ym93WqicM+KbvJBeTZgKrYMHyFRgbV8dSvArGf/cq6i3q44=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB9279.jpnprd01.prod.outlook.com
 (2603:1096:400:1a2::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Tue, 17 Dec
 2024 01:48:35 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 01:48:35 +0000
Message-ID: <87zfkvm64s.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/6] ASoC: audio-graph-card: use __free(device_node) for device node
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Stephen Gordon <gordoste@iinet.net.au>
In-Reply-To: <8734innkpy.wl-kuninori.morimoto.gx@renesas.com>
References: <8734innkpy.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 17 Dec 2024 01:48:35 +0000
X-ClientProxiedBy: TYCP286CA0148.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB9279:EE_
X-MS-Office365-Filtering-Correlation-Id: 1528fddb-2387-49a5-8f4c-08dd1e3ceba2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oc0kAyYkfC3d5oBlyk3rds4F47j7F3+d2hWPJNiEuG5vGuO8vRm2SqvyR9/S?=
 =?us-ascii?Q?09Av6fl1QwiPulwJzI48Nc3QGGWp+hFdz1AUCxWNNy9T3XAxmzlMpXVYBRrv?=
 =?us-ascii?Q?Qv7Pe6EuAguVZ5IFd37c3gQ0ImiFO8xVyWS1/Kq3a1WKmZD9Nxdz7PnLSwlH?=
 =?us-ascii?Q?rR986kSPtZW+dN/0jl06qNmxnASLK4ef1/DXTznFXX2r0Ar2EdVz1Dve/eIG?=
 =?us-ascii?Q?x/iGd5V63+z29yCLcAJAoqx6x/Hr0iUedIssRvfeDPyjot/or2iff90XVQR8?=
 =?us-ascii?Q?4vQ8dFz76WADJyr5rBazmDFrquMOMKItcU+tlqB+vGTJsvJjt+h/bq2NnGqF?=
 =?us-ascii?Q?HG2bxutT9NTBHEwg6mPnBajmgsMcFYK/2hzhzby/1vSqWhggIrjjXpDq1Iqa?=
 =?us-ascii?Q?u81Jft4nhzx34S6OMJgmM442TZROvEysR0sEo21U9m/Rzcf/hJDq7htBeB/O?=
 =?us-ascii?Q?v8fkUnP6VeXQfI+iH7tBnL6RESAwMNCuhy7pjfsFZrazUnM4FZRrCdxe65y+?=
 =?us-ascii?Q?o03EurFjLygtMGHfyAbnlv7lNhJGIWUk580xNEPg+kBSTFJjQhaU1fk1jguU?=
 =?us-ascii?Q?YVumxsBoCDG67YjIgQuzRdKflmcWlrFOsB2QUKBQZymSnBZL68k8tEg919rh?=
 =?us-ascii?Q?lkKdoSaBd7DYxoD7gVRBM4aegoGLap154obzVX4zcByYqA4TDngT5qYH0aq4?=
 =?us-ascii?Q?VYKUbh/csbargZHpD3uvBU2RConZ+qiGuSGutUN2bPCg114JuEY1Uxe3qSgy?=
 =?us-ascii?Q?M6fiBjCnS5naSa+GI3X7HPORBQL12KkIB7E+6FeZw2wk9yPNItWTRWyBaCaL?=
 =?us-ascii?Q?WgnLZw61wgtLM2Uz2RNvsuxedoHZvPyZM5obWUa5BCyPAq4K33Re8U8C6lV1?=
 =?us-ascii?Q?dRwM7zChO2quIpuTy/BMZf7e8Na9FyhR2K0gT1wuDdPuXNkfVFOpjaQ9BEri?=
 =?us-ascii?Q?m0fzjdmwP30EE3SEg0XI4A0KUUixWt7WMIrOty+nmEQxzfN3IJ9osdfEt/AL?=
 =?us-ascii?Q?wb3l0Y8CPNgt4MmjnqYWOqK6jUNWvHfglQz4rzSnMXLlZ88hXNzdUDm2BI5i?=
 =?us-ascii?Q?TlLGMa5DNKdOPfpn0Fkqe9AIdtDRiZXs6PA31tUwGfkINQDFNJvmTQR2oKht?=
 =?us-ascii?Q?0saWNCr3pMrOseqyDYooR9hF87Hn4qQWSyfRVrM5iGHlc1nUETu2I2m9GpcF?=
 =?us-ascii?Q?RCNOR0M6fACF0Bjq1E1mSXXzwnH/Zgq5EiWSBuX82CEtRc8D539mHv/S9Mda?=
 =?us-ascii?Q?qacQqvLD1y2AV3WIcQvmlg7ixDVplls8RO9IvSSLZeugfmS6RB3HEueCSapU?=
 =?us-ascii?Q?XONHb/uSH9f4qmCWth8DtKRlHtUjUJpEeY6A155t/QKJl0ZRKmneX8MY0Mmu?=
 =?us-ascii?Q?Vi5AIMeevj3P91AHKHhmPB357eulIGkH2j3vaGZG4uWjujLoijromCMfn7wR?=
 =?us-ascii?Q?umVVb6esfSOlZ3KuVTeYvbTmhnysUn5u?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Vj2gCqJIrxX13E3OXCwyDz0HIJrPbYfi7oPXHzgrxs4dKtUuKXnHwDpwGhko?=
 =?us-ascii?Q?RIsQ6dUJhkHGRWbrSYc5zFgi2pgfnY6YreSv8q1RffP7YoWC+C0YJJW1frEn?=
 =?us-ascii?Q?YtQSY6+le0iHzlaCSM3Hs8ARYMIMjJFivVi6AENQc6NW1lNrXxzFP2CSI5Te?=
 =?us-ascii?Q?ALnMsuvjXMEMKwKZ8+GWRWj0bK1QLtANM9YSf/5a8UKh3RB/s2u0i07ZPYdm?=
 =?us-ascii?Q?2LoCHvqrUbj4Mf1hBHaKHSPU3CxRNiVoEVCCb71CXDd9OQxSuJVkNKSaIhk9?=
 =?us-ascii?Q?/CZzNkzqtCbt7iZgEUznAIMcwEY7p7cLJoW9ZvPL+qvRJmOIEq7BKnM6KfKA?=
 =?us-ascii?Q?M3v47+0ss24lsh6StNwKHii1wGkMeWrB0xwLm2m44WPpQeqCQAy43PQYHNVA?=
 =?us-ascii?Q?U1nY0S1OKCV/oUfHn+8XzQ9+DXOat71qpoRFEOQD+3MBIYUcmroPDNTvWSn1?=
 =?us-ascii?Q?YLGJQu9qaYleL7NbRe6ukKmu4koHXxQ5cNmTJGiFHkbm5GrpKErcji1JJNX3?=
 =?us-ascii?Q?RuxtOog29l5aEOsDD3PGBGsOdcCNoQ9JZCYTZ3+Do/aJaAJOe4++6qQgGXj6?=
 =?us-ascii?Q?cWUf78sMM9zUa0IBXelNqXJYfeKVm+sZOTkc/ddjcksdwdI3FaVtQxJXBSeC?=
 =?us-ascii?Q?8KxIWbF/mP4Es9VV2eXnCFburUvEFpqe1ghaQ1RuMglkrjwTwfdEbfzWSOuT?=
 =?us-ascii?Q?yUYuIY8JXCZMVn5e5UbcwDwcHbEiTLnE2qOLK2ypV2HgI46qVl0S9/IkU4QU?=
 =?us-ascii?Q?t0lGJBnzJu2oZPIRQXqcfMWuvnV8mBkHHx4begNHZ+jcxubX4EkpmFnVoqVF?=
 =?us-ascii?Q?J9Lok/HIKOyDhZ1QvMT1rqxCZ8CENCa/yQ1fnURkkSez2NmFE+11Jf1yvYH0?=
 =?us-ascii?Q?0urzCGV+ymDFbFxS+rKb8lumKmHU5t6RnoKIUm+U/ZNhDwbxl3BzyGeoEC1n?=
 =?us-ascii?Q?95sj9j86A0XjyXZYJQCAizUP6dNNfAP/FC9EfQs7jqp3x8SfvH1HnYg5y/BD?=
 =?us-ascii?Q?rlxF+b/P5s8LIKjIWT5vvLm9V+ZSfiW5jn9WYMBuTsheLUDBKDLUH1me4Eyf?=
 =?us-ascii?Q?+bcxwLmJFwxc0V7q1jEwshWdQ/QBM5A4qwZPPWRSmovzlh7VeD8rvVx2hi8t?=
 =?us-ascii?Q?xQwISjKXa29iqgUOxCfIESTx5AzModIIksDe/5P/IdvFc4GQV7p4w6Lht611?=
 =?us-ascii?Q?XtXSnUFrYmPHWJmZknDmKCQa00wqeVGnKc7XR5vA1XJzSkWVoxe6WT6e7yAZ?=
 =?us-ascii?Q?cod+/TyGr4lnHVhiDreEUhnFYSqWdA6UM7nUGyJxc0VQWSVEUgVTMGL1L/rm?=
 =?us-ascii?Q?fThjEoa/RMQ1reaVRkUJZkHITPHzpamLl+N0POGBt0x6oDwtzwOLjsyBGZ7+?=
 =?us-ascii?Q?c6XxI+kC6vSsnRlnjPPSFBXRtFmCAvC/rKWSWhYzJRZFkIfBIWZClndMWvAb?=
 =?us-ascii?Q?JyD7CrAXZoTIrS7dUFxHEf3Hr708Pq300P+9vjW2oCRT/rr307o0mHbtlAra?=
 =?us-ascii?Q?JtYZrQ+zZQT8h2RCgkCRGIr31M2W7nxznpx7n9JY5HVRF64GNI04hwH33167?=
 =?us-ascii?Q?tnZBQxeAt6gjG+JE713sKBRSD/3pIqM5Wf0I2klB1nzTcULp4g34DTEjkA2n?=
 =?us-ascii?Q?wWAHfbPlocE+T6C0kXw9YY0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1528fddb-2387-49a5-8f4c-08dd1e3ceba2
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 01:48:35.7712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R7PNuH/Y0+ew1cGvE/8P46fDVSQIldbXLMZ3i2pYBCNi/CYS9jrr80fvCw9VLAHgr18tWFa0b/+2SRuT1vLt8XHzl1XdK8fA7htVlIqT5Xpw3W0WVfS3aJwF/8sRuf6Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9279

audio-graph-card handles many type of device_node, thus need to
use of_node_put() in many place. Let's use __free(device_node)
and avoid it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card.c | 48 ++++++++--------------------
 1 file changed, 14 insertions(+), 34 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 7655425a3deb1..7c422535b01a2 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -81,18 +81,14 @@ static void graph_parse_convert(struct device *dev,
 				struct simple_util_data *adata)
 {
 	struct device_node *top = dev->of_node;
-	struct device_node *port = ep_to_port(ep);
-	struct device_node *ports = port_to_ports(port);
-	struct device_node *node = of_graph_get_port_parent(ep);
+	struct device_node *port  __free(device_node) = ep_to_port(ep);
+	struct device_node *ports __free(device_node) = port_to_ports(port);
+	struct device_node *node  __free(device_node) = of_graph_get_port_parent(ep);
 
 	simple_util_parse_convert(top,   NULL,   adata);
 	simple_util_parse_convert(ports, NULL,   adata);
 	simple_util_parse_convert(port,  NULL,   adata);
 	simple_util_parse_convert(ep,    NULL,   adata);
-
-	of_node_put(port);
-	of_node_put(ports);
-	of_node_put(node);
 }
 
 static int graph_parse_node(struct simple_util_priv *priv,
@@ -140,10 +136,10 @@ static int graph_link_init(struct simple_util_priv *priv,
 	struct device_node *top = dev->of_node;
 	struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
 	struct simple_dai_props *dai_props = simple_priv_to_props(priv, li->link);
-	struct device_node *port_cpu = ep_to_port(ep_cpu);
-	struct device_node *port_codec = ep_to_port(ep_codec);
-	struct device_node *ports_cpu = port_to_ports(port_cpu);
-	struct device_node *ports_codec = port_to_ports(port_codec);
+	struct device_node *port_cpu    __free(device_node) = ep_to_port(ep_cpu);
+	struct device_node *port_codec  __free(device_node) = ep_to_port(ep_codec);
+	struct device_node *ports_cpu   __free(device_node) = port_to_ports(port_cpu);
+	struct device_node *ports_codec __free(device_node) = port_to_ports(port_codec);
 	enum snd_soc_trigger_order trigger_start = SND_SOC_TRIGGER_ORDER_DEFAULT;
 	enum snd_soc_trigger_order trigger_stop  = SND_SOC_TRIGGER_ORDER_DEFAULT;
 	bool playback_only = 0, capture_only = 0;
@@ -152,7 +148,7 @@ static int graph_link_init(struct simple_util_priv *priv,
 	ret = simple_util_parse_daifmt(dev, ep_cpu, ep_codec,
 				       NULL, &dai_link->dai_fmt);
 	if (ret < 0)
-		goto init_end;
+		return ret;
 
 	graph_util_parse_link_direction(top,		&playback_only, &capture_only);
 	graph_util_parse_link_direction(port_cpu,	&playback_only, &capture_only);
@@ -187,14 +183,7 @@ static int graph_link_init(struct simple_util_priv *priv,
 	if (priv->ops)
 		dai_link->ops	= priv->ops;
 
-	ret = simple_util_set_dailink_name(dev, dai_link, name);
-init_end:
-	of_node_put(ports_cpu);
-	of_node_put(ports_codec);
-	of_node_put(port_cpu);
-	of_node_put(port_codec);
-
-	return ret;
+	return simple_util_set_dailink_name(dev, dai_link, name);
 }
 
 static int graph_dai_link_of_dpcm(struct simple_util_priv *priv,
@@ -250,8 +239,6 @@ static int graph_dai_link_of_dpcm(struct simple_util_priv *priv,
 	} else {
 		struct snd_soc_codec_conf *cconf = simple_props_to_codec_conf(dai_props, 0);
 		struct snd_soc_dai_link_component *codecs = snd_soc_link_to_codec(dai_link, 0);
-		struct device_node *port;
-		struct device_node *ports;
 
 		/* CPU is dummy */
 
@@ -267,14 +254,12 @@ static int graph_dai_link_of_dpcm(struct simple_util_priv *priv,
 			 "be.%pOFP.%s", codecs->of_node, codecs->dai_name);
 
 		/* check "prefix" from top node */
-		port  = ep_to_port(ep);
-		ports = port_to_ports(port);
+		struct device_node *port  __free(device_node) = ep_to_port(ep);
+		struct device_node *ports __free(device_node) = port_to_ports(port);
+
 		snd_soc_of_parse_node_prefix(top,   cconf, codecs->of_node, "prefix");
 		snd_soc_of_parse_node_prefix(ports, cconf, codecs->of_node, "prefix");
 		snd_soc_of_parse_node_prefix(port,  cconf, codecs->of_node, "prefix");
-
-		of_node_put(ports);
-		of_node_put(port);
 	}
 
 	graph_parse_convert(dev, ep, &dai_props->adata);
@@ -361,8 +346,6 @@ static int __graph_for_each_link(struct simple_util_priv *priv,
 	struct device *dev = simple_priv_to_dev(priv);
 	struct device_node *node = dev->of_node;
 	struct device_node *cpu_port;
-	struct device_node *codec_ep;
-	struct device_node *codec_port;
 	struct device_node *codec_port_old = NULL;
 	struct simple_util_data adata;
 	int rc, ret = 0;
@@ -374,8 +357,8 @@ static int __graph_for_each_link(struct simple_util_priv *priv,
 		/* loop for all CPU endpoint */
 		for_each_of_graph_port_endpoint(cpu_port, cpu_ep) {
 			/* get codec */
-			codec_ep = of_graph_get_remote_endpoint(cpu_ep);
-			codec_port = ep_to_port(codec_ep);
+			struct device_node *codec_ep   __free(device_node) = of_graph_get_remote_endpoint(cpu_ep);
+			struct device_node *codec_port __free(device_node) = ep_to_port(codec_ep);
 
 			/* get convert-xxx property */
 			memset(&adata, 0, sizeof(adata));
@@ -399,9 +382,6 @@ static int __graph_for_each_link(struct simple_util_priv *priv,
 					ret = func_noml(priv, cpu_ep, codec_ep, li);
 			}
 
-			of_node_put(codec_ep);
-			of_node_put(codec_port);
-
 			if (ret < 0)
 				return ret;
 
-- 
2.43.0

