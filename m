Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010012.outbound.protection.outlook.com [52.101.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB8A3234
	for <linux-sound@vger.kernel.org>; Wed,  5 Feb 2025 00:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738714596; cv=fail; b=eKbORNnbArzG2+zEJ5/nkWCVgkfrOVuPPZoP0UaGuTeXb1+kEw3JM1Pa1i94LjbbEPDnBXhVA2wBliYxY981lf7V0JgheNkL25QFr6D989srGcEgwSLkQx0sq6lqYAVXLDjnPwEdGa9DBkVYdL5jk6NjkM/GktWDOO95mzJiAsU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738714596; c=relaxed/simple;
	bh=IVGnLprdo0zGKCi1LJIPIKnCNfZMYIIQLgf649tKQBM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Yoh0zSWHvzzda1ACQNX0/UyqMOgILj2LoDfwvaZZZo0noNz2YLq/HK+hwxH46Q+jqd7KvXEYe5mF6+Nc0o9tZvXHUVvbTzfTZO3yyl+63L4pGBJsajpmCy1+RRXg3cgvh5UAWXfJsO5Jddi8KvWnOu0CaVIS+8cZkXbOCVBojyg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ZzU293xY; arc=fail smtp.client-ip=52.101.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ZzU293xY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cio/l5XUrVJJ0rV8hGrSqTAh181ScO59t5uAdT7cCfV1Bp7rQqpBCkj/8PqmZKyArLAdjv9WX0TZ+nBUUzolZLlcBEWmne7fYfiuA+XnJ8j3aXoWagWxZeewdZxYNfZsm1KzI976EYeeJO4uCPl5vcQ62e6gVYxmi8uZ5D9x+VfWAlDKSxNhPyO2uhtfp9+FnHU3EE0DssM8vZYNbPvb/AiCoS4+oIb9NGnFjD2VZst9WZWoFpx8bfDbRnn3TXtk4wQbNJAtlxEpd6SKJZs9rA5XKJIfbn7AGyNzqeSvIEUaaRIstQuYc9vspcSyvrEJe6eTXg/JeHICyawg+l5c3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vTz+vqdbADRFQolMei7rN2GF79qipJy6VvBA0f6lK+w=;
 b=ZZ3uLuxJRcZSLOX11f/EHspEKBNOa7lGFB+S0IAIXZqcxRSe7I8ROmwwnZF2Totb7gdG3anPAONVqxJB6qdU03L47VgMSei+bKYdTB+CG/21zN8cm+WWmMI4bK9q3e9D0+qXQc1OvFkHRunksv4XOS3gy2BIPds2fMTskgjLvi0+n6EH8egjsWvlxU543kc9CCax0Gn03GD6KnW6gDQSlh+7wV9Pt2uKsTGnsUkmUBfPHEWus3nYLDY0gJQFObEBG3+XWHjNtrs0OLreoQ9PRcxBTj/4Z1Id3CfvdhHV+uSwtNvifUczQ6JVhLeWy+WZdLy7dUFjExA6XTRvjRUeRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vTz+vqdbADRFQolMei7rN2GF79qipJy6VvBA0f6lK+w=;
 b=ZzU293xYikG+kwkB9Iq0+vnB68q8tMXUAiUQp3v8T/Q7WibLeZa1pK9/JGPAM0BjZr8ZsgGzBMBe7LHODn+8Cra08WbJ7TaKJCUTS42NbSc+ZVEyBY2E61BB3VCwXC279q9hEKBoRGk9Be/ZFRvVEYPXdtXnISY90qWekihBdjU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB12774.jpnprd01.prod.outlook.com
 (2603:1096:405:1b3::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Wed, 5 Feb
 2025 00:16:31 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8422.009; Wed, 5 Feb 2025
 00:16:31 +0000
Message-ID: <878qql2qlc.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 6/7] ASoC: audio-graph-card: use snd_soc_ret()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87h6592qq3.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6592qq3.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 5 Feb 2025 00:16:31 +0000
X-ClientProxiedBy: TYAPR01CA0182.jpnprd01.prod.outlook.com
 (2603:1096:404:ba::26) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB12774:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f0882e5-a25e-423e-1c95-08dd457a57d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4njskG8Y+ixef5yhnfvtFUa2340vNtr+KfTBFSBC2ndAzCclQFSWCgFGtqiM?=
 =?us-ascii?Q?GKeBkN/yXLQxzgDLMV2hpi1KDHLfjAlOBkoX7oH1xYJOV5c9d4tOl/7LxAkX?=
 =?us-ascii?Q?4m+NtZWYM+ivP7MyGCUkSRMn2CzgYy7tpXLa29xm6RjMTkLCY9bP25LZ5nXT?=
 =?us-ascii?Q?2f9bxQeFi7tYGa+2ZBrkzukyqgU+xC8er+xzyONlhGqgidEa6mBdr4ARqKJO?=
 =?us-ascii?Q?mLRRJDb7SP7T0Fw57R3BquHEB4cbKDrHGbKa8KrnpYjjMwbZOOmkrzxxZrAW?=
 =?us-ascii?Q?TYqglclsNIQd12IfS9tsBrSH0BqXnRyLg7vX88qe4CZzY8saDsqcEzM1fcoU?=
 =?us-ascii?Q?+HCJQ1e1qOeVAYBNzfSRVa3DAWYtGAGVUAnv7MqV69UitYPfBzzd9vKf4oqH?=
 =?us-ascii?Q?UBJefrqAbc94pK4JW5yBDjbcGpxOLpgYJ6+gkMY1mJ3dcZHsEDTEPdDltfxH?=
 =?us-ascii?Q?uOujghvsTrhu5dO+3w5M7Ah/yG4euj7V1WyKKfO8he7zt3baOUo8aw42awSo?=
 =?us-ascii?Q?BxsZDn1yGmfjsEvVrkc7D5f0VYPMMnMb77T/jnf7FyJFEgnWUQS1iN0NA/6/?=
 =?us-ascii?Q?lHBute2g/Z9w8SOxpcQRYvOoN43kTyqVT48GzKc/3m88ONSU1LzcAxeier71?=
 =?us-ascii?Q?9C3UwHF1/2PsbSiBQI6FNVijaiHGI1Q+X+dHOAMIMWTUjf71hG/jWYHo7eoO?=
 =?us-ascii?Q?Rt+L8+A3gqqX7kAScyZdeCMW4v0NBbNSigO1KDcOiS5OdOFta86vzvGSneMz?=
 =?us-ascii?Q?8bqoBrv/BuCEmWjXgqYdJW1967cf9+ZUBnacnSSNHAXNQaiHmI4jgPXxtxid?=
 =?us-ascii?Q?tdoStAV8q9jweF73kQBebu1wx7PAJUlwQY4shVYYW5ilZerk6wg0bcAp1J/Y?=
 =?us-ascii?Q?WQuXqd2siTO1rntd5br/e4KM7yD0A+r0OvWycgTGlW8hBJqUZ1HTfNPFNDkb?=
 =?us-ascii?Q?Zw6SWCArZIVxgZK+kLVzYJI61w+HYQ/nNUV3yuhkm3vmRLWCvYs5Q5SDI9LU?=
 =?us-ascii?Q?3YO0EIJA7idJ+DKkmNIXIWLjGwZpKADGOZ6tJouYJdyHLs2/i0ADJC9XKPpU?=
 =?us-ascii?Q?Yjvvx33XERkkSar3qi7QRjiaaMkqsT1m5VZ5ewgfMt0UZP353yz6jJlTimls?=
 =?us-ascii?Q?lf3i6ZL7PzL6wG1Gqzy0EKStDOLV6OzWdDbgtXjNoLbQ10qYsZT0rD9LyMx6?=
 =?us-ascii?Q?NkbYh8we4zToUAvm+J7BTdidQLVG1fp6FgdS6MUPTh98ge2p5WgncVz99Wgg?=
 =?us-ascii?Q?SP07nlw/qn3o+KsUugw3TcFa4Imaa+wmhdxFkDG65P+NmX9aXlw/12ryCt+K?=
 =?us-ascii?Q?hRo6NrpXLJGS6jRHw7vLQpgio3xTNfI4O0qcJHsaOiWOhSgABb9bfX4Rhble?=
 =?us-ascii?Q?n7nvttu3hWDncqC1mRVYaEkdNAc+oIU7R2OZaDHXbrxFMnp25vVakso3TENR?=
 =?us-ascii?Q?KPYDC6OWZFxkQUxH5UkaJMlBJ0AhAq98?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ymAq9daJ9IE7MySvU9jUM7zwm12f1+K7lFQnD8LCEkHWwM1nojSugrnJbg0t?=
 =?us-ascii?Q?LnZ6JaiCzbuJdxLQ7I7Los4zG2ud5L4RWs607/NZKApNWaIWywzlBbWxC0f0?=
 =?us-ascii?Q?fuHo3fTMfBecPgu8HT0CuQ2VXNCCkRmJeVkmxJxqQu043DJy8kiBqO9xKAIM?=
 =?us-ascii?Q?7nGKw6ZgSezj+OE87eTjtp9Druqj6xV64XUG0boYQ44+s8XveVbP6qAQscfq?=
 =?us-ascii?Q?1h6gVnUi8bX6VQCpD74M8DzHVlml2xhxhXS4CP1Yv4cB5A9j2fvxwghvqgBP?=
 =?us-ascii?Q?CGK/mhVOzxK4LXRSIGKV/imlvmZLWnPfXUIa+/nSfTbY0VTpxlxRogzJ2Cvj?=
 =?us-ascii?Q?MAWVpBJc1S4XmgCcJHg23FNQScZKa/UZvXzrDI9cR6RiH/8rehlPZEjVwRIn?=
 =?us-ascii?Q?pERCt0efoQ9Swm4SmgPf4rsvIhheDZZR6fsEaL1h5GURIQ35bEXMZIVvl0Ie?=
 =?us-ascii?Q?l9Fl4LtbvQhi17BuC2Xu73HZNnNe6YJmGJs8DNTQXEQavfI2Fq6XKdGoV0/y?=
 =?us-ascii?Q?nPtqKInBVZGrxPHOwTtady+2WX7+yOrjz63B/3Dv6RYnt0V/CEvrFqnZSrwZ?=
 =?us-ascii?Q?xkwgczhHaJPTxbQiImg6D0fDIz/aWZwBTx+cgBJdMWOuNDBNulVHxNyTxR+u?=
 =?us-ascii?Q?eBUypwOrJ6Y6BE0qQ/+gV8Q1U2UeE0UZCCX0zzfZTUNLERrzAmBXwI8oT+8Q?=
 =?us-ascii?Q?GF/Y6/xrrTqw640Y8Odg+g75K5mIA21Esr/IfldTAZe3D1npZ9MfhU9/IEpz?=
 =?us-ascii?Q?QM+eZnMggcKzQ8QD17f45JNH2MdBkToa6zhmz+C0MWk5JxfVUMrmOq/3RURl?=
 =?us-ascii?Q?uINlo2uaTzwmmKpRX/q6Bj2riDR/meu6lgc4PLbmhwMwQNwNm1+uapeldPGJ?=
 =?us-ascii?Q?jrL3Q7E3OJxbU45vdO87iPeKkLyhQ2T+GIGJMXuz+dynLTQDl04prRJsg3XV?=
 =?us-ascii?Q?1H6K3p1IRTORRvC/jblD2eQNLTiOxKmvGhW6RqMb08KnqSvWZlEYq/al1QC5?=
 =?us-ascii?Q?FxfPN4DqmOKdV1b6vSuQj7jrss10I6PRw1zoEIEY7iRvnaoZH2AhXUbJItXu?=
 =?us-ascii?Q?LRlbIGsbZAKaphl5T3hAqnQ+1Rh/3C9cvvZH7BMWzorysBc+s6l0Sz+L9yvr?=
 =?us-ascii?Q?5GNaBSCDDPxqA5hFTYRv40gE73M2AobsFMXQwfbrd3PgrbHTL1lPxWBttbXd?=
 =?us-ascii?Q?gABpAdXHNsLOlZEuJjc0XXfuloY4/dB9ZeRV45nLo0/McJRjR42Cu+Y9CyUI?=
 =?us-ascii?Q?ABtJZfVKs41Y72fOn9wo0SKUa6rl13O7RVdo28DguFCWUdHfsQMZqgwSmjBI?=
 =?us-ascii?Q?va1UHFtEvKCpQ1xBV8W5WM8gkIKUkD2CvDClkB9rClAic0Mw17VCs+rVaek/?=
 =?us-ascii?Q?VAmr6ktiQ4jI91SafeIoJ5073IoXqAv0CaxrIHULTB4+5eBjxyygZTG3sDuX?=
 =?us-ascii?Q?D+e81h/blSTE6wtwPAZoup9Zj65Yy+xyGc1P21Xb1Px8KtTdgbfge4gStmo/?=
 =?us-ascii?Q?6VEmdHQ9G9aQLO9RuIaT+cY63P/yFY9yZn5z8a+/efj4NmtJRnfqiE/+F1Jj?=
 =?us-ascii?Q?EuWdKLyMVRs9BBAphdvvzIfrFwF3UAo6r4NZWKtCu6XAB/jA420QFrvLpWiV?=
 =?us-ascii?Q?XVDDZibaFI6B3xgjxbby4Wo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f0882e5-a25e-423e-1c95-08dd457a57d2
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 00:16:31.8943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GgZNjPZfo1WsvdDBfHLr4bxdUQmUu2Xl3Nc04iM9qCYI6BzXLw6UDzGAxdddHP8InAgRwZylJ2sbKXKMHtN93s7fxwWzs3jKQnWwhttpdn7BGmCZT8+B8w4nYt04LtkI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12774

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

