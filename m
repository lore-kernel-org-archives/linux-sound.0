Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010029.outbound.protection.outlook.com [52.101.228.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB8E17C
	for <linux-sound@vger.kernel.org>; Mon,  6 Jan 2025 05:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736142552; cv=fail; b=PPYTekRD9UawL2M/F4gAsS4tl04lHyBPfGGwQTnTrHm3wuDEiAEu+DMh+Axy2Pll/n+smtjm2FHe0ror9tJiCyj6G4H6emWzW40iiNiSbUFC0gXwN4RfAryBuk4HaRkZfmxYghD3M9iB8CTt2BSj5cSOFnd/9MZHKZE/LBbx/0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736142552; c=relaxed/simple;
	bh=QZps46uy4bae/jVj72rnoWFUeDi5wdPXkZlB1sAyApw=;
	h=Message-ID:To:In-Reply-To:References:From:Subject:Content-Type:
	 Date:MIME-Version; b=bewu785UL5xrV0KCTwTdj36+QyZAuEkxNuBl1iLZ1EtyF84h93zu2i9lYvDm785duRC5vEuQrqY4HblvCN3EQCRslEkcDp3SbRd4Tcmvg3170D68N70UpBLUsJCZHcsWsdbN2HhAQz01KoFr8MVwC/W1jOWGXLCxD/JE24p4Ol0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=TkKGKSrL; arc=fail smtp.client-ip=52.101.228.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="TkKGKSrL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fUJVddaj4Jjk1tGGC8wL6NeOPSqzSrzKWTL7BMpzi6FCrem5T98nJKN6PDvQzsQAT54pAp1Ytl80BS8eyB64OCEFdLulFNI9ICQMaHEuB/XdBLNj1Apn7Q669f6mZZb/sVu5OO6AYjWhSyAkAnecDfR3ZwFqPALxdB6585Tj6Y8xbYud8CQnHgV8HLC7Rn6392r0iEjz/hY4OMikTL/EqXQphlKFJRGsTO1rKI7jm8kh7tIV2sqziHDeBIfcPYF/C8g7IhqE3zTK9HSvYy1LmFrpOjmqH4VZ8CICc+up5hP5LDyy7XsGvW7+UsgzZeKshXpaUiCkuD7ftxAauS8o+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yEm7puzF7AuSlG9k9cwM27p8dG0uOhogkq7oeNbEVwM=;
 b=ef2tW6wImWAN0H5tkoO86f+T1JDPjqVRmAN8MpYp7lQYShQc3x8Lm5ikXFW1W3M55XKE0ftGZqdKZOemdIbEwVLevKYqJ/MCl+DDw5o3yWj47UQvSYKy6osBKGoqVVCHSJEpfHdKg0aC1jTIYLCITnxshCpYlbzoMtmNT2ATvASOVBLS+YaL5+t9HR4+77ZCo3QdTZ1tUKZhcOlVDqsWavsOfk8Q3PHA67YgD9EnTgzfiHMiGaBhnWouo2SJsB6EK97B2XZYpDBuMJDqOHU39KS2uzV+/vCuPCk5+BYEUHcl6dn+Eds8pv4vIzjftZ4rh1xHSVTjIWOTT0o3vQmtDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yEm7puzF7AuSlG9k9cwM27p8dG0uOhogkq7oeNbEVwM=;
 b=TkKGKSrL5rKJRJjweeH+RQjsyZlvWtKuKKeGj/8D4QaLT46iBBO83Lh7My6FR4aIoIrj4t9d7M+0AIqWXztwx6P8Cb1ZI/PqXV3App10rbwFdge5h0dea0Yurz9eY9OVNfNWbXqwPUkX1AvdILu6ow48luaMKwVs+EqT37VGVeQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB6247.jpnprd01.prod.outlook.com
 (2603:1096:604:ed::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Mon, 6 Jan
 2025 05:49:07 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 05:49:07 +0000
Message-ID: <87y0zoo5kc.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Stephen Gordon <gordoste@iinet.net.au>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
In-Reply-To: <87zfk4o5l2.wl-kuninori.morimoto.gx@renesas.com>
References: <87zfk4o5l2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 1/7] ASoC: audio-graph-card2: use __free(device_node) for device node
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 6 Jan 2025 05:49:07 +0000
X-ClientProxiedBy: TYCP301CA0025.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB6247:EE_
X-MS-Office365-Filtering-Correlation-Id: b812b895-83ff-4705-86f7-08dd2e15d60b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eHle0GwSi0Qf+99zydvpGJPOhoWJSmpU74TUXVqdevISx3KwZykmV9nKgnAR?=
 =?us-ascii?Q?/mAzlxxvCQU5A4GV3CD14VY1nQ4lqzamBFmM5D0K8H4LH4ORwAVhdj3DMvDR?=
 =?us-ascii?Q?JQwh5EVm+Ufodu50k/q5MptWGuq1KQU10xeKex2LdV2hCtwtyhbSjcvVTSXO?=
 =?us-ascii?Q?0mnTn1ZcpkkwXMK7gSe8/knueAwQCt8vOtREW/pTE0CN32e0KxS0ir3HpyyN?=
 =?us-ascii?Q?DAXHcAl5EqvbOtd1QNeDeimsFmZ/b9cjyAv/s9m0eJppDhcRU24+wIAX2SoB?=
 =?us-ascii?Q?mi9mZQw+YWJSTgKFtLHd8JoyQ6LP6TWu4wVaHc2QPOuHzHnzHrrKAjOS3qKP?=
 =?us-ascii?Q?iOviaICgQunf5bb2c9OKcYTnwoUWRaNZzgqVLvG7cz15R1NnX/suQzZ9B8kN?=
 =?us-ascii?Q?8BUi3xDH5zi6GNev08Xtp2HEymgai1ACZGKYnH8OFcpKf/3YA8Mc+QlswZ0M?=
 =?us-ascii?Q?UTzwQ08/IOf48xXbYvLigntTgslYpmHZYCxJqhgwO7P96bDGf8ctkhtmRpU/?=
 =?us-ascii?Q?Qi2zl6zbhAEIyw3pZlmarlMW+trkIbvpTsSWDS92PKjcCU5EsFpor8mhGsJB?=
 =?us-ascii?Q?06R+TI2waCcG7P9R4iZnOktNl+90lbMxgHMiS4T1yszpWqzU7ilNel6qG1He?=
 =?us-ascii?Q?l6wnzh9Ys65XsDM+IkurEsQKnM7CkLGec1gOESTODoMaOp056F8MZJfM7wKU?=
 =?us-ascii?Q?FK8aLeiNHOvdX3Ve5FBOPM+VpQ3wV4BsKxURu6wffO8UVOuj1vboJYeeQx3R?=
 =?us-ascii?Q?llUDsbEvrwboeXJEUIaNgb3kYbVb6cCUu8WLw71Wk4b95oByLTAVqdRGyZbH?=
 =?us-ascii?Q?OOTkoRuxXMVBil4+cMtompAEG9Gt6Hr3Nk1dUTOkw5BDCGsbQV6C5IRBKBvA?=
 =?us-ascii?Q?atTcdk03GLOpP2IdnTTLdCP5HceTTbbYpy0kpgFgfcnesbmrHJ2wYSwqXTaS?=
 =?us-ascii?Q?25uWlofZQYARjzRRzixIUxmUu21Rpa5wtTSe/Q1dKlB8pA7nbu/Q2HGt0bGd?=
 =?us-ascii?Q?Y0C0X2M6u2S2/vMaxjxWkiTtMlZtVDXiREe99bSVh9SrShx7lqVEw4EVwBBd?=
 =?us-ascii?Q?eWegrHzYib6yeVClWbVVXd56rBmKphRzOMZTsdiWDDH1m01lYI/DJN2dk4Qs?=
 =?us-ascii?Q?NcQL3uDwAiMeMC2TFNh0JITKn0UK56+pAPaF9vkKU6XY0qZ/Fv4FwgPUkdP1?=
 =?us-ascii?Q?BFAglRgeXX/cW9Eoc5paC1sLfSr8nWNx7noVeOxGFclcgcvQIFiJsjhh5z8r?=
 =?us-ascii?Q?DdLnRqhG9PXMVlH3JPrBi6rm1WhDUX+wMJHgmqyl0/HoDGKO07GCq1xW1/Io?=
 =?us-ascii?Q?99fug6o6ShOTAqcrvI76steh84HkSH5snYKd93v0QXaVmdVU0VaHtCVvSNfg?=
 =?us-ascii?Q?ikyi07upoKtSe1TG1FdScYA3kzbcCxtbLciydLN+IjOI0rHs0AZhOrr6Snyx?=
 =?us-ascii?Q?WAw7Pcg2cJkOGmM9E4t61oY/cFTJIstb?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MK5doSlJNBJu0/ZkJVZD9ntUAlFogONhMZDpAD9aCBn1j2z9oUcSS49TlZjW?=
 =?us-ascii?Q?ZcchG97EXUVeZLTlYU4z4e1EZe4IhHqcmEJyJlKTbuymJ8mZsI684VY6vJsb?=
 =?us-ascii?Q?ZOOLejd+fBzPSYRFV0ndPtwaqT5RwoA+Brm1PsRV3JcouxQst6PdiYUVOuPA?=
 =?us-ascii?Q?49gP7+VRoVBueh5zr92zEalF2AGibivi//XpGRrsKOtP4pTDb4uEbphqRfVt?=
 =?us-ascii?Q?/8oRX2XD0mCDz846asF3nsgl02jAEmIe7UpbkKeJVCAS6E1ofOLU9IMr9xks?=
 =?us-ascii?Q?/Hu8oz0unM7cwB3j9q4yeD9e8rGskhWh3sNx59QVel4YGtvX4Empc6YJktoP?=
 =?us-ascii?Q?HH4jkaJ10e8OMvPu5IIafG5i8n70IK8r0d6fBSbzRK9AAgupIrGb1MVYgjuw?=
 =?us-ascii?Q?J8gV2NkKtD1j+fECG0O34sYu/B8FusqOIr3UUIt9qBuPtrdbqyTEEt5n89Yk?=
 =?us-ascii?Q?ut9m6FLMB7zYeISYhk7d7qJg/rSUINBk69rstm0k9blNfhEH66L0NLwtSjna?=
 =?us-ascii?Q?Dc4MfB8Su3wyPYXvbPemujZwOQUPHWw4fUlniEKkqURDhLwMhSuVkmhwKznk?=
 =?us-ascii?Q?H1CqbvsHEAN0j2oEbL+jCIRlRcpQonQeuKJtJnGJpRAI35fgcr1+8+qaOnQc?=
 =?us-ascii?Q?yiQGx5jCbCQZlVYCXA8vqogRq9dFQTVQmYZqphD53mXtJoxw3N5RVuHtvb+f?=
 =?us-ascii?Q?jjdjH/hjp5XjSjqrYCbMf02OOxAE1zv0qC0I+zP57gScTZ08q5z3e9xZaqaC?=
 =?us-ascii?Q?CfkkstBaR/casUZgeZxN0It380Zty+XczhnUG9rxg16zDtJ7iVu/dXn0DcxW?=
 =?us-ascii?Q?qIx9nnerwOLiXklrz7M8ZPuOWzeB/6/nce6dfLVxthqTEwrj90Yte0v9LXtw?=
 =?us-ascii?Q?+xMWd2xsouSQV2TpYAv0h+99jQ3ubAh4GgrYDk53qr2HjPRF8VpXq3Caw/EC?=
 =?us-ascii?Q?qd4FkvnBzegJ8pXFTlZD2v+oLLTk4xon6/r2C6SRTV7j5qavr+2DA84NEbEU?=
 =?us-ascii?Q?86n7P+9HxF4Zjz54wDbYqR9EWa0yOTRKdbmQGtxbpBmVWzB4NDWL/eXhYHPZ?=
 =?us-ascii?Q?WY4h/usHappa8UMEW4qD2HPDiiqvHm37vR/orpyopoMsnXHqHkZZGDmcN/GS?=
 =?us-ascii?Q?cUO72XZ/9OziithmpeJkUZU+U3DJfULdrV9QoOqlgahhKIUwT81a+FY09VYz?=
 =?us-ascii?Q?dOMypJcAdOAqSwrxfd8HJCd8jqRrD22B8I83+nZSLiwP/XSnTFokYvRMeswy?=
 =?us-ascii?Q?LJFJoMPHYX9z4cDbOFr7N/PF7SSRCLdKDaPv8rF0TRzWu49MI5Cer+CyKrCK?=
 =?us-ascii?Q?A/8GPVdt80PGAt1NhfJWor2/zd5my7AXJ041dH6AkvBfkq9kLuFEtWaf9yIN?=
 =?us-ascii?Q?GMmWLlhF16jiqhe7MUivhnJKkNadSRNBUiQtFUTEx3A78gV+OYU0hn/VCS7I?=
 =?us-ascii?Q?B/WVMp6oit/wLmKIsciAyZ490clcHs3+Q+wet3S+R1KJ9Bj/ipYIWShhNge3?=
 =?us-ascii?Q?RtDxLy8aiKB6O0snPeBqyx5IcFw0OE0o4BpIvyVEgGu5gN21tWtLkin2mpF4?=
 =?us-ascii?Q?6JjBA9Nr1FbpvIStPEzsRG7yJR0W48+CmhBSEZY45SecGLiNABu80gqdkJtp?=
 =?us-ascii?Q?Jy8m78RWpDbYshtJxQJKcI4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b812b895-83ff-4705-86f7-08dd2e15d60b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2025 05:49:07.7697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RgR1yJtaA6sirn9pM7h6X9L19KfLntTCswGZ2AHGT/eVxz2Xegzk55nhbGex+YJTMbjUin6Plkvgj0/687IaIbqpntOMNa/qRcjAryAIdgQFLxNb86F9BGRiMyjZb0qO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6247

audio-graph-card2 handles many type of device_node, thus need to
use of_node_put() in many place. Let's use __free(device_node)
and avoid it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card2.c | 173 ++++++++------------------
 1 file changed, 54 insertions(+), 119 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 1f5c4e8ff1b90..f4c825b56a7e1 100644
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

