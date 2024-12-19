Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011042.outbound.protection.outlook.com [52.101.125.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70039320F
	for <linux-sound@vger.kernel.org>; Thu, 19 Dec 2024 00:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734568510; cv=fail; b=XGvvDHyQo/OWWDzPkcP/rgT3aM574q6eANwjiRFHl2T4QJyh+TBwA3kw75dIi9MYGi1ZnYhqFEMQjpQRhfAS6pg33btvKielbD6EhnRx1cU2HGARdW5V7zyMTv4Vj8J12fi/kDL6HxFmMz3+swTJiUREZyXf/caIf2yMF3Kvoeo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734568510; c=relaxed/simple;
	bh=QZps46uy4bae/jVj72rnoWFUeDi5wdPXkZlB1sAyApw=;
	h=Message-ID:In-Reply-To:References:To:From:Subject:Content-Type:
	 Date:MIME-Version; b=cNTabDp8XVYG/b+QcNi3yQiwEYl29pJhXWwZQo9CMrteUayVG8KWv3a955NnxAZ27zYav4U4ORlq2Db8NKqtM6DLd3XBSsJA0QsiMVUNuc6T+L15+nT1HzKLLy6qHjyorjpRbyGcGT9A/Xz4/89NFq+TDTDmboa5GwTRsPz7Iic=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=mihIMxCQ; arc=fail smtp.client-ip=52.101.125.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="mihIMxCQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KHNqd/lNTCf0sUIkfajYxVzg96yzNUTjnjD0UPFtmM4XX/aSUNQVu2xSg4A+1So6gGd/oeDFNWZPV4Wy08aU0Df3U704IACEQROMFMXn/Hk3HyaS81bpcRiRA3yjeyBfKxnHKhAO8FhKhVu5WyAthwt6hW+gphTAsC7sMZVheLwZtKjyrNiP1t8e6Nnc0RBOJEHwzu/4uVaLqZxGmD0mHPzbh5M7gndKaonn79iOMB8RhQofm8+fixza1v6JkeNIVPe7nd6kQ8zBmHFEa7lHZ/uF7gNVho1HHTLECGp57fAqIiEJmGFoxzifh9vDcyQM2Fdgc9K6dfVjCp4dRNOfzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yEm7puzF7AuSlG9k9cwM27p8dG0uOhogkq7oeNbEVwM=;
 b=OOzBCRwA+BOsnfUmPzoUhXE0rL2n9yHBThokGYKcI64DeJDy/cYTcpsSMVmJ+pwbp/0TDOSiGw/LXaSNRjCYMNtDeRhofSc5XZpeVU3BoDopuqtaKUJDZoctnnVIh4U0RQ7zHELw8z5iAZPXcwETaxMjhdoFze7jeukZiyMpND5XdLLdxifdnavHt+1GqzBiZefyUW0W3RuRa6AbAjl5vdDddMnT2wl1RD3KSmS60j7bYytNBQZNSBHaxHY6J6CxbrGQHtAd5VmQvE08Ou84nEiXnw8KszXwacmvUfCRViDvwjISLUzPfxdV7sMM7uSaKZbFwOKhZmN0qIUfAC1nQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yEm7puzF7AuSlG9k9cwM27p8dG0uOhogkq7oeNbEVwM=;
 b=mihIMxCQ1aepfjYgp25PGLZ64d2FSORd8c8IPmuuZp1k3+kXERaQiPNbUmObgM3ZjiVT6qVUN55+OlrMFBl0cU7DtpCWHshDT8z+WsIad5eRSmzUPDlyMVRpDjfUT+UZbKjRP/gcz37oeVc7E16w+vmjp8eJRDSW9JB4Qz8G/Rc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB14144.jpnprd01.prod.outlook.com
 (2603:1096:405:221::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 00:35:05 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 00:35:05 +0000
Message-ID: <87pllocxxi.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87r064cxym.wl-kuninori.morimoto.gx@renesas.com>
References: <87r064cxym.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 1/6] ASoC: audio-graph-card2: use __free(device_node) for device node
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 19 Dec 2024 00:35:05 +0000
X-ClientProxiedBy: TYWPR01CA0037.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB14144:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b6196e5-f658-4eac-5930-08dd1fc4fbbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VCyX1EFEAfaFEUgHVgqjoCOKoPNCVGnRGl/YXzklspTN89SYrN2KtCvhTRJQ?=
 =?us-ascii?Q?iqXYaB+842h1dbkMeQg0Ke0MqvLVcSWH/kilaAJDfMrW3bIhKzHTDXyWLk0f?=
 =?us-ascii?Q?UReLZ1kFTEsVI2XJFzr0176xUfHMBpallCkQdS1R0YClAWHU+eP+pe6pwBB1?=
 =?us-ascii?Q?2ClTOSJ++wTcoJu4+mNb5jOmYUkyfYmruREt39ph2AGtm+KY7Q0zCtTYGwCS?=
 =?us-ascii?Q?B/8sW/W4TsTmcq8I6c+PeYx5Fz+744LOWfxxTnBDmlBMmkZg8Os6820l7AKT?=
 =?us-ascii?Q?ntmjb1wAXF2APK1UB/u4k2ZeQNFT/aRtDL8QhVQy/aOSk98L8WTCeTDFfMdR?=
 =?us-ascii?Q?z8Qlc8PqKPFjjqVj4EFxHeBqHEaf1ylz/Ked1/wZX5+UbsJQZG7nFl96XFio?=
 =?us-ascii?Q?CMsItPeBSvXrhlUbc+drFEo3YdVKCwAoDfug8C4MRa40ns59DFO7cLOEuwkL?=
 =?us-ascii?Q?mn0zdqs0GVeUQ9UNPaxLfwZ+j24GHKB6Jil0Cc6MKlOkXQ9UAlC6UwqD8Man?=
 =?us-ascii?Q?e2vFISTY1N3JdEnTxRxud6b/zM+eh4eVq0CursUmRlBr75EAsngRqYtiFp9F?=
 =?us-ascii?Q?4m9aqjuApMt9FvigpQN0tXqbI0SOToZHYz/a77KNTq9Kl6pgB11p7lIv5ZK5?=
 =?us-ascii?Q?7G//cbFU4QNZtk6mpK6f8z7zosAAPXbv58h01D8esi8c2i8ECr6ECbiCDBvs?=
 =?us-ascii?Q?mmQ8Uy0/cvaloxWEUXJ/sjNPU9tHDNmekNd/346TD2UfsSabETvvLa5wYWLI?=
 =?us-ascii?Q?OAndSwGAnY5c5gzmLlF8EPB8XVEyLCi0FX/wz+w3rbl5nWsERouoYUb74adm?=
 =?us-ascii?Q?9XnPZUylEW6RHCe3+iN0+1Rv/0RTT9dp1OrGDwUGi0CCzB2Ito5HcAStRkda?=
 =?us-ascii?Q?mhqF8dwQDPKVp54Fuxp/Bxv8gid8loCutWPe4LUgjDWKp/UTdansjEjKULDl?=
 =?us-ascii?Q?JLFbCc1T6RvNHaK2UNeZEIb3VB45Hue6+jtHBtufI538Hp4/pep7N+m3DWwe?=
 =?us-ascii?Q?Wi8gMjlP8OwXbzWxKtPW2c81SX4vvNDMk4qP/VgWTNu2e2v8tuAvU94Dxd1i?=
 =?us-ascii?Q?RcmyBi5jZJYGKiHk1neR4k7l/KRvQ0+JmyEWaIpUYZANB+BkkKFwsSLZNuAn?=
 =?us-ascii?Q?aljT+33UM+c9zM02MwHWfk4aJRM0nN2x9u0BcNXF8Mn0mkQHFqS6QTqhpIv/?=
 =?us-ascii?Q?64gjfvA4/xDGZbPi1n8sNu4kzEUsaiYe5A0IGkY2OA2k0BrkrpdpqsXyZHhN?=
 =?us-ascii?Q?56LtZvGqq/qoNF3gbZDhio28LWKb5wXH3dLVK3gqxs816hsHrBjP1j3o3iIC?=
 =?us-ascii?Q?uu7ba76NbjJdfBWHIAcgg6A+p4uLtW8daeMfxd86giOI3r24efxvLDEqSz1d?=
 =?us-ascii?Q?Hlbcm114cVtTA3aaXWKJUBV6r7eJDYjxkMFYObHpXYNPI9IXdWhb/msxfvCq?=
 =?us-ascii?Q?EG0dcfZCnm8wA3WwPh5AE+wQ3FoY6nd4?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+5Lkg5Riw9JxAs52zWrbFbDEhtjIllpVJhzOGvxkyQ02+qI8gTvdHbcV8l0a?=
 =?us-ascii?Q?FVtoC/sLcD54eaqDjZll5gJ7ZnpvZBlzOhjB+A7GqscdjM3RRkMvqpcKja+C?=
 =?us-ascii?Q?nvooiqjv3sWRUSKwaXlVxRG9zPrzmk0DMq+58Ak6BzElXq2PKAt760Uk0mKF?=
 =?us-ascii?Q?cDq0SQgjlZMMR+40B08Qovq+EiJSzkeOzMsQbxkRvZfq3wwg9+2Qa95ztvGf?=
 =?us-ascii?Q?BmhSKhtc57IuAmvnaHCeIkKBkEiwoEQto2V+sD4SdQp9oiZI+f91LLMzqDkB?=
 =?us-ascii?Q?e1lqrFl3hb8HsElciOrNbyvaWuy0FKjtEf0WmdCimzybmKdpkDMWbcKVbHEm?=
 =?us-ascii?Q?y+TN3tUN23eJdydhWLijnp30kstRLGpmGdwlsL3K7YLH7DLMmerUqpKm6YRj?=
 =?us-ascii?Q?M2Sy913NNALUVNxnjCsnn4J02UFXooHBI4Zc/I1GfcdfIziXmuBE33GyNbdE?=
 =?us-ascii?Q?K5eUGxev0F3+Yp634fGKHMveXrUGutaUcbK3i6GTlJkAI7S/yFCz/7jecpkQ?=
 =?us-ascii?Q?+92qqUxLtQuNKC9aG9unU9R+Vys/SMdwNGTmOpdUtOUckZIC6f1HQhbe7xwB?=
 =?us-ascii?Q?QdBvPvIZne4xGunBN22KvBznGszsd3SKiQY4IlBGJ8RepuLZ0BDkDfwg9sEE?=
 =?us-ascii?Q?398hBXVbEMZDq0nfudbn6tCA/ojeatl1meOGB24Q7fyFdRzv2RanFa41ER1J?=
 =?us-ascii?Q?8k9vD8Y1VI7jcUTv8bNwmOBZgJe1lnn0U7PJiyouoGRpCnHvkZOCwwRhUhU7?=
 =?us-ascii?Q?9xWx76RYKccT83M696beTbpvUhnXueX77DyM2mkhFJWJpifCQg/SYQWkqVCw?=
 =?us-ascii?Q?z2jB383l5J3rMn05LuTeV7Ov9A/HiqtQM1oo9/vtU5s8sG83alTZey2cDuo+?=
 =?us-ascii?Q?4lysU4J12/uLMja1qCj/WbsJ7hqGltlzumU+G/Ai02+H2Kcq8w6NLWTS5ZUs?=
 =?us-ascii?Q?mev/YU9ZqlvByZnKXIknc1daX42pMq6pxGKqEccV2KqWjZ0TaY9VGkhsDryj?=
 =?us-ascii?Q?lpOYQV8waAT9psHmsa4ifQsmgI0vH1NwN5bTlrJoqEKtHK5NvEXbmn8RV/oi?=
 =?us-ascii?Q?6SG3QT+Y3lfTXTCb6hVmq3z8NWG0RMp2WGgC8AXwOjsumply2pasyEw36TuJ?=
 =?us-ascii?Q?LpJmuoJYZH7azTH0pUzXOIjnP3hChYv5ZcJetCx+pDVtdFDOKy+sCcerXVx5?=
 =?us-ascii?Q?1YggfXgNWvVlcQ+0VcAKdcqu5OmD3aStXF7z4BriMNxNzaZqSfM809jkVfos?=
 =?us-ascii?Q?Z6SX70eUBv63ObxOSsqc4MoMMYLAtfdvKaWRKTPzMEXtafnsnM4ThTTQ7BUy?=
 =?us-ascii?Q?IPURJPwqGxrlA6MXu4tsUiub4RfAnpLIfuwJIYhRGbKipOR/9+ejEzf7geSz?=
 =?us-ascii?Q?P/A+T9UJd+udwuNKEWFs4an0FNdyAkh3n5aOxKYna9UaRBpWrFZDCdd8zdYs?=
 =?us-ascii?Q?5eXUZrGq1I2WqfgKItC2vtmPmhjz4lBtuOakRPQh6KPWaHLTFj82v2TtKG8b?=
 =?us-ascii?Q?j8Mu05G9uUEJW5KNi6i2lkKZ36lfS0PBObolf1rGvbGy3yoo01Tm7oVOtJUt?=
 =?us-ascii?Q?YB7Mnr3gnMGlr5SejZJrabeslg/i5CRhxmZbiHk3yemXxXWUD3r0XSNxBzZI?=
 =?us-ascii?Q?7jr6Xt3ob/FFWbV/jlmuZ2I=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b6196e5-f658-4eac-5930-08dd1fc4fbbb
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 00:35:05.4885
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z1ancrwVfaPvEE538eMAtp3UtAfqZ2J/htVC0CkrZ/1Xw/P4mnrnR5JZJTPmlhU3xA5hvMnbsn7LhAaMn2k2N1p3VE1RuC8D+mtWHot8qJuAHNPEzxb5clwLNyL21477
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB14144

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

