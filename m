Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011035.outbound.protection.outlook.com [52.101.125.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552BB49659
	for <linux-sound@vger.kernel.org>; Tue, 17 Dec 2024 01:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734400116; cv=fail; b=JnbJnjvIiKDKQ8q6BpqWrORYKmtW0BOuiihLfCuLaZAssYyKguE7xMbcH2Xn9+AryyahoKaMhl4U/yFytotLb/bTbKjf++1//b4X+HJ9fPOkjeZc1C2AKH1GHv2dvGcj/XOCWQPjGMs6msDU6ZXT+JwTnUK+IIGsgsCgC6wjy5Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734400116; c=relaxed/simple;
	bh=IcSAPPhyC4W6DxEAZI0beSzMymIgRmr7u1Kn3Nl2KI8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=jz2S5UY8/9gWqm2mRzkuMTfUVfIwaLgK+ewaMkaIgWpRKI2pYfDKngdT9JpO+uHX2xOnP4alOLFkIO8sXyU0MuhlyTklYSs65f2Fua7qPTGTsgS8BKJrVzwN8XWwTtySrzC3HdV7DYOggQNOKl/r7DAGQuDcQ75oMm+0Gx8GjRQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=IlsgAi7P; arc=fail smtp.client-ip=52.101.125.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="IlsgAi7P"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ct6dbv/gjTBvOtzaWrPGW4uLo8x9PaWCbCeWvVdPrXJ5v46ENiwkbnTwQcdPiBItuSKXeIXs+50V79JmGQRSGdYDH/Ymvp5BWGugBU2HOhoHoQs1CFPABZtPUnO6O87VrhUJtvlSmCW9gSJ45K8PC2/DTEtv/G04lYDEEFk/9I4oKdkd/30Vr4BsHcVzG0h1VYhB2NjKHrWJBTT7pwCNxUjNO6FG+GKErlrtBqLI8WJ/sb0Xxc4YgG0Pw+ACTE4HS3crhzxzrnMS4SvO1AAKBnkjRZD6W0wZitgCIKMwM8wUwd5EmpfEwzrPxH9BeV8o3qpEq7Z5mtNwpe2FautoFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hU4uuVVe7MacZTlGKHb1JPA4+aDtENIvdmuC3rwAA7Y=;
 b=F8q0Z9tM0aMS1ujmt3bNWFD/joTx/dylHYLnpnIfZzuKtblue+9wj0r6irqtjKbsqVhHr8HquI9ziGl22WiSNYTGYzF8cd/Y0LwNbTukiTvBVBBRQu+DK+RFswAsHur+oJRKv9B6RR8ECIdiY/91sDTGV26MpQ57SnrsR/9mRTJIMVdfIPr7TEfO+DopchqbWkq7Vrm1YAPP7+HwMpwV4ipsOypDdaDawoWgLfeySU9ZUTt5+Sw5/A3mMatA0IHAUosJTSpFzExZb+9xv0X88DhQ9/va1jvAok7p9vI+b6ael1kC2xoy/b0sbavZWIm00pZYN5OHiHqeZehHNjFfeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hU4uuVVe7MacZTlGKHb1JPA4+aDtENIvdmuC3rwAA7Y=;
 b=IlsgAi7PGndt7lhfyEOJ7MhWr2UoEOfitRZGrBHplVXcIlTdVmJmWMzLc7/kbgut0s8qIW3mPGZkSkhI3NZCIryTJnXmvOBR60R4RS/h7MgFaQrZG0dbuHoobik/AU5vajd60K7mek/gJpg5wIoqM413bYDNMKizxJtuQCd+6ZY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB9279.jpnprd01.prod.outlook.com
 (2603:1096:400:1a2::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Tue, 17 Dec
 2024 01:48:31 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 01:48:31 +0000
Message-ID: <871py7nkpc.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/6] ASoC: audio-graph-card2: use __free(device_node) for device node
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Stephen Gordon <gordoste@iinet.net.au>
In-Reply-To: <8734innkpy.wl-kuninori.morimoto.gx@renesas.com>
References: <8734innkpy.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 17 Dec 2024 01:48:31 +0000
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
X-MS-Office365-Filtering-Correlation-Id: 936494e6-dbb9-41b3-994b-08dd1e3ce91a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MlpseQp9egydorHiDZ/TbDh7BlZeQDKFOPUJttd61bNZRXDQxlYoYwXkoW7F?=
 =?us-ascii?Q?Hf0vntmAs52C6ENSzM0v/VROC/1FcRSv7nH8/sQHDK9CH9QUqxJsw+AXx2Bm?=
 =?us-ascii?Q?2wHtD+1UDSH6oCcHxtnyGDgFl+d9rIDDW61zbtRblcBhDnXoL9PMtQl6WbWS?=
 =?us-ascii?Q?5EukhAeD7AoBYQ7mIDiHwm8kkdLGFjR8x3fCgEsPTcmpFnPcPzQRxlDLGraJ?=
 =?us-ascii?Q?4wOMzflCKeYtsgsQ2rYwZ43S6Baqtcup0XDCAAZMeegWO+p6TqWK3lMGd3d1?=
 =?us-ascii?Q?jX/IKgEKvGQnWfnu8z/CXX0wATO45vhHmhn8CMz0UlSyS5vfrkqSQ1uNaaHh?=
 =?us-ascii?Q?3gg9RFqe0s4O1q+Xm4tFBzur/ffTggIPQ/chuwM4XedXGVzSRjjXIKttq9VZ?=
 =?us-ascii?Q?c9o2tKJfm8a1zG0XtsSQQ0Nck6dQB+jx1395owD7Y9RSlfAvnWqbuk5zGNY9?=
 =?us-ascii?Q?wxDoViO1a/6Qkhyr98V/h2cBewroWeTGGtsXBz1w1jT6wEeF4cX7BaPrG/on?=
 =?us-ascii?Q?P4m/SC9W8pWvfyxeTeH/gI2Xv90G0xKxU3jRwh/jKSAHOgB2ZziqIcn8r9Td?=
 =?us-ascii?Q?S/2SJj4G/6XpEiYXD71ZOrn31T8L6BdsjT3GWIC5QL+RtG2kjfoauB2YqY8o?=
 =?us-ascii?Q?f+e8ISZ09I7tQTquJ+zxxYff7hWqxyi3N8f8eOMGliXGCQMDo5EqiepnbN2W?=
 =?us-ascii?Q?r8QO41pyhdP/dPzUVai6A5PEuYjKYTgl1hI4Y2J8fzITKcRtQxRVWSmoNyrn?=
 =?us-ascii?Q?dIMjQHrpf7/xOffIDEoq/g/aj5Oa4HOA+YRipJceL6HR192P9+9/c6+BSx0n?=
 =?us-ascii?Q?HT69J1ZPWJdAgBzVMLCzhzYxvjnuEVO6Jy6QHN41WwhDLDt02VD3BmX0JwKo?=
 =?us-ascii?Q?QE4zWS4FCQB88Giyw/+7knI9rkE9jgguUtxqADCoXxFuRPvSZVrbsL2c4WPe?=
 =?us-ascii?Q?X6LR7mD3oHpJSFp3cGADSBE5X9YBn6pD0ZvrPZ8UqIA4sv7DtWzGqV/ZSvW2?=
 =?us-ascii?Q?F5elNERmvC1AgnZAIiYe4TVn/DfjpkyqIDFqYUBZtQJA1Sb81bp1bVtuRvjV?=
 =?us-ascii?Q?qbOcIeZUxG9sYoU6TTvhnzKl17MbY7C1EWH1LNphFJy0kn/uC/tE7pb9JXUJ?=
 =?us-ascii?Q?yQmmuTqVuYX2dbX1+rUOAjuqIXlNFNoDR5ssu7bjTglfrePLUqY2O2D5YOW7?=
 =?us-ascii?Q?7x5Fw8A6/D/i1JSWA5kaD6k+cB57SNQ9o3VK6YA6YFBk86PReJEzvrNyed4M?=
 =?us-ascii?Q?Q2XRrmZYRY5aLX+92N1spDfdtKchvVpH8AOWD2HEbdB0B/XH/1g+a6Ga3egT?=
 =?us-ascii?Q?R1H0U496zi1ISgjohkaR5UXwVfuxLz5pUNkbtWH78hrAjbzrQBZV0j7ScM7N?=
 =?us-ascii?Q?XlB8tY0TUh21NUrnd+BtROpPzP69pK1ocws+g7mFofVZzNpib4UVrjO7u5DZ?=
 =?us-ascii?Q?uuXBl7uf6+wHlPD8mGvbOg5cWpxAgclY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iMAVYhROh6DF/84evDl43nqh+/OnulZfOStU3BYJpiT4rdVBhSIVaHzzIteW?=
 =?us-ascii?Q?Ogt7TDVA//yj42bBAp2vgj/uQNpluRqM7fHdKKt74Y4t12mnHsKdpLciEfh0?=
 =?us-ascii?Q?Jl+EA9GLvedc13H80+g1mRWYdsCP9tfDdSrctOeH5nLk+lgSw9iBk4EboIFx?=
 =?us-ascii?Q?Xn3Q3CQ9u7fxbcTRZbngAVr8vl7+VFkXjD4LSQ6YbLqJfsbQmMXEU1eZ7w7r?=
 =?us-ascii?Q?w/ghKPjnv2r4VHWicpAyCb7OyOk61rf0x87PxXUedZdUOgl7q+Gdk+YK0jvH?=
 =?us-ascii?Q?z39l5MRiZhvLUB9IzY2NLyMQWKJd7vkTcVMyMIbNz1P1yYHmmI8OOqGI8sJn?=
 =?us-ascii?Q?aFEZbut0otvkrYFhqGn21f7+ACnzyQIejzchvOucklHAPWc7b79n4HIg4ZUy?=
 =?us-ascii?Q?KtCGAOXAmXbW/9RQzy786b660MsqV24bFccucig4oiQWISWFSYbqGX+tC4IY?=
 =?us-ascii?Q?TxidbWKGX4IdoN+SfvfMxSnUASRGu7YjcDEhTLqZXMzKgamxDwS1IJmIjJHQ?=
 =?us-ascii?Q?RDSpnezpR/UW9sdmn/xGW49QCdJXzGNjFb/HF0YXtJ0ki491JmaqJQcWhCDI?=
 =?us-ascii?Q?EPlnyCHGWkvi8OH+TvZAuW7cGdMzn2R1yRDNAlvP5bdocooXKmOVN902eSx2?=
 =?us-ascii?Q?BHYTPob8xkeBkbI/W//TG+Xca9tLQS7IKhuxJKDMFlNj9cqtwSFMPGSogw6O?=
 =?us-ascii?Q?zi0dCQxddHFHhRkvEWGPTwEtKoLu4ZDl+bnzc9nmPJH0fuf68jKuokem62SQ?=
 =?us-ascii?Q?RZUAZfPBZsZGDZpxMN1WAzAD/yh0yC6/fE02bvrqYmQDOEn5VuwejPGLl9L5?=
 =?us-ascii?Q?yz8fC9D+XkUpejlvFEbsPIHzeAX51d9x1GC51SmIkkogNw66YftyQZiZWItx?=
 =?us-ascii?Q?wkV7Lzw0obu6m0D9IB3bGY/qPjy97wNxkXFBe26IWR8nO8DpJQcu32GxFYt2?=
 =?us-ascii?Q?9SZIFhV00WpBXU1hXzBKCUxF2kNoCTZTnbyA3nS3FW7IwyY2b2jwQoxXogUa?=
 =?us-ascii?Q?01YkbjGd+lgPN5l7Ja6iw3Ysr2mGbEVg4/R+aZL0Jc6vV2TvI9vLG1B9+kIG?=
 =?us-ascii?Q?NW4T1UeUdOZCzL3HdyV9MPFybbR9x2UGBgWWtUc17pCsVBcVF+RUSZvtQ3pK?=
 =?us-ascii?Q?qHaxta3Dw91e1Jyz8EMMHyaNRaXX6XhJIcrL4ugsNNrSOjevDK55/TWQ4FfD?=
 =?us-ascii?Q?JVAdjN13RlG3tNUzZW68Dbi3/Qxohdfqs43BVZr4UX1Z9gjGmwGgklMnLzy1?=
 =?us-ascii?Q?dHvdRKvn8e8OKa8S8RpOSU+9vPLGgWXmNwrGZqitF07OOe0lo2kyWPd/xZkT?=
 =?us-ascii?Q?Fek0Bg4etnubdOCieSOhMrXhwxa6W/Km4hpSSVbSpdAJ07a53v+2woqi/Bo9?=
 =?us-ascii?Q?ml4tkCT+L81MTjm9t4hygXFV5+fQ2ek2AkuwCDAE+0m4/GvkMzPcxtQBL5Fe?=
 =?us-ascii?Q?tS1JuoARl4tiVS5v6XbQdwXfZwIHqT/OzWw/htz5MicciD8C30lz28hFjA0w?=
 =?us-ascii?Q?i0vEFQjzUEp5VfOCvpNNetNHJMp2eJpNNUTKhpU6PwTLjeVccSkWO2wa25FM?=
 =?us-ascii?Q?ypkngwUJGb+wV7U4i85Aqo/D6tVwZ/YdFVkMIUeWjaZ8LPmpa/zZDaurEZq2?=
 =?us-ascii?Q?a9ONB1S/TI+OFUhOiBjibfk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 936494e6-dbb9-41b3-994b-08dd1e3ce91a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 01:48:31.5002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S374eX1FPlYxTyTCvzp6hhKHFKW/Mlk1T1XII9XzoZh2Yg60kIKZNPng5T+hCoo/mlHevdjEs3nsQT7uAHDddU/9g7I5keUz6B+0bn7Ttt8t1gDpXCyWQ/EQlrPKb03+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9279

audio-graph-card2 handles many type of device_node, thus need to
use of_node_put() in many place. Let's use __free(device_node)
and avoid it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card2.c | 173 ++++++++------------------
 1 file changed, 54 insertions(+), 119 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 5280c1b20d85e..079ae8a7bfff8 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -333,8 +333,7 @@ static int graph_lnk_is_multi(struct device_node *lnk)
 
 static struct device_node *graph_get_next_multi_ep(struct device_node **port)
 {
-	struct device_node *ports = port_to_ports(*port);
-	struct device_node *ep = NULL;
+	struct device_node *ports __free(device_node) = port_to_ports(*port);
 	struct device_node *rep = NULL;
 
 	/*
@@ -354,13 +353,11 @@ static struct device_node *graph_get_next_multi_ep(struct device_node **port)
 	 */
 	*port = of_graph_get_next_port(ports, *port);
 	if (*port) {
-		ep  = of_graph_get_next_port_endpoint(*port, NULL);
+		struct device_node *ep __free(device_node) = of_graph_get_next_port_endpoint(*port, NULL);
+
 		rep = of_graph_get_remote_endpoint(ep);
 	}
 
-	of_node_put(ep);
-	of_node_put(ports);
-
 	return rep;
 }
 
@@ -373,16 +370,13 @@ static const struct snd_soc_ops graph_ops = {
 static void graph_parse_convert(struct device_node *ep,
 				struct simple_dai_props *props)
 {
-	struct device_node *port = ep_to_port(ep);
-	struct device_node *ports = port_to_ports(port);
+	struct device_node *port  __free(device_node) = ep_to_port(ep);
+	struct device_node *ports __free(device_node) = port_to_ports(port);
 	struct simple_util_data *adata = &props->adata;
 
 	simple_util_parse_convert(ports, NULL, adata);
 	simple_util_parse_convert(port, NULL, adata);
 	simple_util_parse_convert(ep,   NULL, adata);
-
-	of_node_put(port);
-	of_node_put(ports);
 }
 
 static int __graph_parse_node(struct simple_util_priv *priv,
@@ -471,14 +465,11 @@ static int __graph_parse_node(struct simple_util_priv *priv,
 	if (!is_cpu && gtype == GRAPH_DPCM) {
 		struct snd_soc_dai_link_component *codecs = snd_soc_link_to_codec(dai_link, idx);
 		struct snd_soc_codec_conf *cconf = simple_props_to_codec_conf(dai_props, idx);
-		struct device_node *rport  = ep_to_port(ep);
-		struct device_node *rports = port_to_ports(rport);
+		struct device_node *rport  __free(device_node) = ep_to_port(ep);
+		struct device_node *rports __free(device_node) = port_to_ports(rport);
 
 		snd_soc_of_parse_node_prefix(rports, cconf, codecs->of_node, "prefix");
 		snd_soc_of_parse_node_prefix(rport,  cconf, codecs->of_node, "prefix");
-
-		of_node_put(rport);
-		of_node_put(rports);
 	}
 
 	if (is_cpu) {
@@ -526,25 +517,21 @@ static int graph_parse_node_multi_nm(struct snd_soc_dai_link *dai_link,
 	 *	};
 	 * };
 	 */
-	struct device_node *mcpu_ep		= of_graph_get_next_port_endpoint(mcpu_port, NULL);
-	struct device_node *mcpu_ports		= port_to_ports(mcpu_port);
-	struct device_node *mcpu_port_top	= of_graph_get_next_port(mcpu_ports, NULL);
-	struct device_node *mcpu_ep_top		= of_graph_get_next_port_endpoint(mcpu_port_top, NULL);
-	struct device_node *mcodec_ep_top	= of_graph_get_remote_endpoint(mcpu_ep_top);
-	struct device_node *mcodec_port_top	= ep_to_port(mcodec_ep_top);
-	struct device_node *mcodec_ports	= port_to_ports(mcodec_port_top);
+	struct device_node *mcpu_ep		__free(device_node) = of_graph_get_next_port_endpoint(mcpu_port, NULL);
+	struct device_node *mcpu_ports		__free(device_node) = port_to_ports(mcpu_port);
+	struct device_node *mcpu_port_top	__free(device_node) = of_graph_get_next_port(mcpu_ports, NULL);
+	struct device_node *mcpu_ep_top		__free(device_node) = of_graph_get_next_port_endpoint(mcpu_port_top, NULL);
+	struct device_node *mcodec_ep_top	__free(device_node) = of_graph_get_remote_endpoint(mcpu_ep_top);
+	struct device_node *mcodec_port_top	__free(device_node) = ep_to_port(mcodec_ep_top);
+	struct device_node *mcodec_ports	__free(device_node) = port_to_ports(mcodec_port_top);
 	int nm_max = max(dai_link->num_cpus, dai_link->num_codecs);
 	int ret = 0;
 
-	if (cpu_idx > dai_link->num_cpus) {
-		ret = -EINVAL;
-		goto mcpu_err;
-	}
+	if (cpu_idx > dai_link->num_cpus)
+		return -EINVAL;
 
 	for_each_of_graph_port_endpoint(mcpu_port, mcpu_ep_n) {
-		struct device_node *mcodec_ep_n;
-		struct device_node *mcodec_port;
-		int codec_idx;
+		int codec_idx = 0;
 
 		/* ignore 1st ep which is for element */
 		if (mcpu_ep_n == mcpu_ep)
@@ -553,16 +540,13 @@ static int graph_parse_node_multi_nm(struct snd_soc_dai_link *dai_link,
 		if (*nm_idx > nm_max)
 			break;
 
-		mcodec_ep_n	= of_graph_get_remote_endpoint(mcpu_ep_n);
-		mcodec_port	= ep_to_port(mcodec_ep_n);
-
-		if (mcodec_ports != port_to_ports(mcodec_port)) {
-			ret = -EINVAL;
-			goto mcpu_err;
-		}
+		struct device_node *mcodec_ep_n __free(device_node) = of_graph_get_remote_endpoint(mcpu_ep_n);
+		struct device_node *mcodec_port __free(device_node) = ep_to_port(mcodec_ep_n);
 
-		codec_idx = 0;
 		ret = -EINVAL;
+		if (mcodec_ports != port_to_ports(mcodec_port))
+			break;
+
 		for_each_of_graph_port(mcodec_ports, mcodec_port_i) {
 
 			/* ignore 1st port which is for pair connection */
@@ -582,18 +566,9 @@ static int graph_parse_node_multi_nm(struct snd_soc_dai_link *dai_link,
 			}
 			codec_idx++;
 		}
-		of_node_put(mcodec_port);
-		of_node_put(mcodec_ep_n);
 		if (ret < 0)
 			break;
 	}
-mcpu_err:
-	of_node_put(mcpu_ep);
-	of_node_put(mcpu_port_top);
-	of_node_put(mcpu_ep_top);
-	of_node_put(mcodec_ep_top);
-	of_node_put(mcodec_port_top);
-	of_node_put(mcodec_ports);
 
 	return ret;
 }
@@ -605,7 +580,6 @@ static int graph_parse_node_multi(struct simple_util_priv *priv,
 {
 	struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
 	struct device *dev = simple_priv_to_dev(priv);
-	struct device_node *ep;
 	int ret = -ENOMEM;
 	int nm_idx = 0;
 	int nm_max = max(dai_link->num_cpus, dai_link->num_codecs);
@@ -640,12 +614,11 @@ static int graph_parse_node_multi(struct simple_util_priv *priv,
 		 *	};
 		 * };
 		 */
-		ep = graph_get_next_multi_ep(&port);
+		struct device_node *ep __free(device_node) = graph_get_next_multi_ep(&port);
 		if (!ep)
 			break;
 
 		ret = __graph_parse_node(priv, gtype, ep, li, is_cpu, idx);
-		of_node_put(ep);
 		if (ret < 0)
 			goto multi_err;
 
@@ -669,12 +642,9 @@ static int graph_parse_node_single(struct simple_util_priv *priv,
 				   struct device_node *port,
 				   struct link_info *li, int is_cpu)
 {
-	struct device_node *ep = of_graph_get_next_port_endpoint(port, NULL);
-	int ret = __graph_parse_node(priv, gtype, ep, li, is_cpu, 0);
-
-	of_node_put(ep);
+	struct device_node *ep __free(device_node) = of_graph_get_next_port_endpoint(port, NULL);
 
-	return ret;
+	return __graph_parse_node(priv, gtype, ep, li, is_cpu, 0);
 }
 
 static int graph_parse_node(struct simple_util_priv *priv,
@@ -751,7 +721,6 @@ static void graph_link_init(struct simple_util_priv *priv,
 	struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
 	struct simple_dai_props *dai_props = simple_priv_to_props(priv, li->link);
 	struct device_node *ep_cpu, *ep_codec;
-	struct device_node *ports_cpu, *ports_codec;
 	unsigned int daifmt = 0, daiclk = 0;
 	bool playback_only = 0, capture_only = 0;
 	enum snd_soc_trigger_order trigger_start = SND_SOC_TRIGGER_ORDER_DEFAULT;
@@ -766,7 +735,7 @@ static void graph_link_init(struct simple_util_priv *priv,
 	} else {
 		ep_cpu = of_graph_get_next_port_endpoint(port_cpu, NULL);
 	}
-	ports_cpu = port_to_ports(port_cpu);
+	struct device_node *ports_cpu __free(device_node) = port_to_ports(port_cpu);
 
 	of_node_get(port_codec);
 	if (graph_lnk_is_multi(port_codec)) {
@@ -776,8 +745,7 @@ static void graph_link_init(struct simple_util_priv *priv,
 	} else {
 		ep_codec = of_graph_get_next_port_endpoint(port_codec, NULL);
 	}
-	ports_codec = port_to_ports(port_codec);
-
+	struct device_node *ports_codec __free(device_node) = port_to_ports(port_codec);
 
 	graph_parse_daifmt(ep_cpu,	&daifmt, &bit_frame);
 	graph_parse_daifmt(ep_codec,	&daifmt, &bit_frame);
@@ -832,8 +800,6 @@ static void graph_link_init(struct simple_util_priv *priv,
 	if (priv->ops)
 		dai_link->ops	= priv->ops;
 
-	of_node_put(ports_cpu);
-	of_node_put(ports_codec);
 	of_node_put(port_cpu);
 	of_node_put(port_codec);
 	of_node_put(ep_cpu);
@@ -845,8 +811,8 @@ int audio_graph2_link_normal(struct simple_util_priv *priv,
 			     struct link_info *li)
 {
 	struct device_node *cpu_port = lnk;
-	struct device_node *cpu_ep = of_graph_get_next_port_endpoint(cpu_port, NULL);
-	struct device_node *codec_port = of_graph_get_remote_port(cpu_ep);
+	struct device_node *cpu_ep	__free(device_node) = of_graph_get_next_port_endpoint(cpu_port, NULL);
+	struct device_node *codec_port	__free(device_node) = of_graph_get_remote_port(cpu_ep);
 	int ret;
 
 	/*
@@ -856,19 +822,16 @@ int audio_graph2_link_normal(struct simple_util_priv *priv,
 	 */
 	ret = graph_parse_node(priv, GRAPH_NORMAL, codec_port, li, 0);
 	if (ret < 0)
-		goto err;
+		return ret;
 
 	/*
 	 * call CPU, and set DAI Name
 	 */
 	ret = graph_parse_node(priv, GRAPH_NORMAL, cpu_port, li, 1);
 	if (ret < 0)
-		goto err;
+		return ret;
 
 	graph_link_init(priv, lnk, cpu_port, codec_port, li, 1);
-err:
-	of_node_put(codec_port);
-	of_node_put(cpu_ep);
 
 	return ret;
 }
@@ -878,8 +841,8 @@ int audio_graph2_link_dpcm(struct simple_util_priv *priv,
 			   struct device_node *lnk,
 			   struct link_info *li)
 {
-	struct device_node *ep = of_graph_get_next_port_endpoint(lnk, NULL);
-	struct device_node *rep = of_graph_get_remote_endpoint(ep);
+	struct device_node *ep	__free(device_node) = of_graph_get_next_port_endpoint(lnk, NULL);
+	struct device_node *rep	__free(device_node) = of_graph_get_remote_endpoint(ep);
 	struct device_node *cpu_port = NULL;
 	struct device_node *codec_port = NULL;
 	struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
@@ -963,8 +926,6 @@ int audio_graph2_link_dpcm(struct simple_util_priv *priv,
 
 	graph_link_init(priv, lnk, cpu_port, codec_port, li, is_cpu);
 err:
-	of_node_put(ep);
-	of_node_put(rep);
 	of_node_put(cpu_port);
 	of_node_put(codec_port);
 
@@ -977,9 +938,9 @@ int audio_graph2_link_c2c(struct simple_util_priv *priv,
 			  struct link_info *li)
 {
 	struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
-	struct device_node *port0, *port1, *ports;
-	struct device_node *codec0_port, *codec1_port;
-	struct device_node *ep0, *ep1;
+	struct device_node *port0 = lnk;
+	struct device_node *ports __free(device_node) = port_to_ports(port0);
+	struct device_node *port1 __free(device_node) = of_graph_get_next_port(ports, port0);
 	u32 val = 0;
 	int ret = -EINVAL;
 
@@ -999,10 +960,6 @@ int audio_graph2_link_c2c(struct simple_util_priv *priv,
 	 *	};
 	 * };
 	 */
-	of_node_get(lnk);
-	port0 = lnk;
-	ports = port_to_ports(port0);
-	port1 = of_graph_get_next_port(ports, port0);
 
 	/*
 	 * Card2 can use original Codec2Codec settings if DT has.
@@ -1019,7 +976,7 @@ int audio_graph2_link_c2c(struct simple_util_priv *priv,
 
 		c2c_conf = devm_kzalloc(dev, sizeof(*c2c_conf), GFP_KERNEL);
 		if (!c2c_conf)
-			goto err1;
+			return ret;
 
 		c2c_conf->formats	= SNDRV_PCM_FMTBIT_S32_LE; /* update ME */
 		c2c_conf->rates		= SNDRV_PCM_RATE_8000_384000;
@@ -1032,11 +989,11 @@ int audio_graph2_link_c2c(struct simple_util_priv *priv,
 		dai_link->num_c2c_params	= 1;
 	}
 
-	ep0 = of_graph_get_next_port_endpoint(port0, NULL);
-	ep1 = of_graph_get_next_port_endpoint(port1, NULL);
+	struct device_node *ep0 __free(device_node) = of_graph_get_next_port_endpoint(port0, NULL);
+	struct device_node *ep1 __free(device_node) = of_graph_get_next_port_endpoint(port1, NULL);
 
-	codec0_port = of_graph_get_remote_port(ep0);
-	codec1_port = of_graph_get_remote_port(ep1);
+	struct device_node *codec0_port __free(device_node) = of_graph_get_remote_port(ep0);
+	struct device_node *codec1_port __free(device_node) = of_graph_get_remote_port(ep1);
 
 	/*
 	 * call Codec first.
@@ -1045,25 +1002,16 @@ int audio_graph2_link_c2c(struct simple_util_priv *priv,
 	 */
 	ret = graph_parse_node(priv, GRAPH_C2C, codec1_port, li, 0);
 	if (ret < 0)
-		goto err2;
+		return ret;
 
 	/*
 	 * call CPU, and set DAI Name
 	 */
 	ret = graph_parse_node(priv, GRAPH_C2C, codec0_port, li, 1);
 	if (ret < 0)
-		goto err2;
+		return ret;
 
 	graph_link_init(priv, lnk, codec0_port, codec1_port, li, 1);
-err2:
-	of_node_put(ep0);
-	of_node_put(ep1);
-	of_node_put(codec0_port);
-	of_node_put(codec1_port);
-err1:
-	of_node_put(ports);
-	of_node_put(port0);
-	of_node_put(port1);
 
 	return ret;
 }
@@ -1153,8 +1101,8 @@ static int graph_count_normal(struct simple_util_priv *priv,
 			      struct link_info *li)
 {
 	struct device_node *cpu_port = lnk;
-	struct device_node *cpu_ep = of_graph_get_next_port_endpoint(cpu_port, NULL);
-	struct device_node *codec_port = of_graph_get_remote_port(cpu_ep);
+	struct device_node *cpu_ep	__free(device_node) = of_graph_get_next_port_endpoint(cpu_port, NULL);
+	struct device_node *codec_port	__free(device_node) = of_graph_get_remote_port(cpu_ep);
 
 	/*
 	 *	CPU {
@@ -1171,9 +1119,6 @@ static int graph_count_normal(struct simple_util_priv *priv,
 
 	li->num[li->link].codecs	= graph_counter(codec_port);
 
-	of_node_put(cpu_ep);
-	of_node_put(codec_port);
-
 	return 0;
 }
 
@@ -1181,8 +1126,8 @@ static int graph_count_dpcm(struct simple_util_priv *priv,
 			    struct device_node *lnk,
 			    struct link_info *li)
 {
-	struct device_node *ep = of_graph_get_next_port_endpoint(lnk, NULL);
-	struct device_node *rport = of_graph_get_remote_port(ep);
+	struct device_node *ep		__free(device_node) = of_graph_get_next_port_endpoint(lnk, NULL);
+	struct device_node *rport	__free(device_node) = of_graph_get_remote_port(ep);
 
 	/*
 	 * dpcm {
@@ -1211,9 +1156,6 @@ static int graph_count_dpcm(struct simple_util_priv *priv,
 		li->num[li->link].codecs	= graph_counter(rport); /* BE */
 	}
 
-	of_node_put(ep);
-	of_node_put(rport);
-
 	return 0;
 }
 
@@ -1221,13 +1163,13 @@ static int graph_count_c2c(struct simple_util_priv *priv,
 			   struct device_node *lnk,
 			   struct link_info *li)
 {
-	struct device_node *ports = port_to_ports(lnk);
-	struct device_node *port0 = lnk;
-	struct device_node *port1 = of_graph_get_next_port(ports, of_node_get(port0));
-	struct device_node *ep0 = of_graph_get_next_port_endpoint(port0, NULL);
-	struct device_node *ep1 = of_graph_get_next_port_endpoint(port1, NULL);
-	struct device_node *codec0 = of_graph_get_remote_port(ep0);
-	struct device_node *codec1 = of_graph_get_remote_port(ep1);
+	struct device_node *ports	__free(device_node) = port_to_ports(lnk);
+	struct device_node *port0	= of_node_get(lnk);
+	struct device_node *port1	= of_node_get(of_graph_get_next_port(ports, of_node_get(port0)));
+	struct device_node *ep0		__free(device_node) = of_graph_get_next_port_endpoint(port0, NULL);
+	struct device_node *ep1		__free(device_node) = of_graph_get_next_port_endpoint(port1, NULL);
+	struct device_node *codec0	__free(device_node) = of_graph_get_remote_port(ep0);
+	struct device_node *codec1	__free(device_node) = of_graph_get_remote_port(ep1);
 
 	/*
 	 * codec2codec {
@@ -1247,13 +1189,6 @@ static int graph_count_c2c(struct simple_util_priv *priv,
 
 	li->num[li->link].codecs	= graph_counter(codec1);
 
-	of_node_put(ports);
-	of_node_put(port1);
-	of_node_put(ep0);
-	of_node_put(ep1);
-	of_node_put(codec0);
-	of_node_put(codec1);
-
 	return 0;
 }
 
-- 
2.43.0

