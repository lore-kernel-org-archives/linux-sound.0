Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011053.outbound.protection.outlook.com [52.101.125.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A6F42A9B
	for <linux-sound@vger.kernel.org>; Mon,  3 Feb 2025 06:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738563677; cv=fail; b=uFFuGm8eIqoRUy/P7LkOT1zgfU2eDOgsF7Ea6wbBUikfTda//3NlWfNB1/LQdvcWU7fB0HHMJldebnD9UvaE3yA4++96rlovIEh0Fvi//Zg8/ZGvlb6oHNgXOUeGB8FOLflOJw2uRtZHHr8vI1/MdiYNXikyT0GHhFpX3ZqXLEo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738563677; c=relaxed/simple;
	bh=bklo2Cy6XasKkCBkTFuljKlqVcGEZ3Pm7Z5W2Cn2Q0M=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=nhTePBIjABMgQAmDshbQ1l6oUkyxZSvnzTXJt08XwS6v3ucdggnmncQa64C/vNU5HzQL0lqu4RZxxq4tFRvBOHG9VBltoS849A+oRJIHJJXZJQxCIw0r4KWiYFfR4UsCyLESB1JkIw7gFtwv8KQPjHTrZuqqnUqx9xVYWC2ieoI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=gDtYHlcX; arc=fail smtp.client-ip=52.101.125.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="gDtYHlcX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RxDyaKaoynjo98Zxzrd+drqWEbc/XJ/V+a9zABDoAOcPRr7fRcfYr6WgyfEB2g+wr3y891bHFlSIQpWURzJvOwvIgl3KOk1tq3zfe3Rge8NYDTExmDRnCNUEQjYegvYnph6VS4a9wbIFWZG3gASsGpGUNd7m3CmgU7P/feLk/wHZzmkmvylBbl4y+orPqpEADG3IgAzUB/6DBAh3TiBAGucrLRlVK1LNnKG1ZE7iZfOGNC++wgcwa1wRYDUS4ACynva+7sj7tVT/bCI0kyo3KtF8f0g+SYdgZTDSMkAtzP1Bu0TIUVuP2bBU6YjZRFVoLfNd3KSu5KCoZs9A+89Otg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PasvSKpzQQExdlIwY0+XHI8GSwUwRkhp+ceZjXyL9fM=;
 b=PXFs8RGWIrP2hLlMe6dK+NRGuquLVCKxp7RS6+vHEY5/+rNbjn7e3cdOhyHw1SdXVGXfiLIMuzPTuhYFB3G1aONpPJ6P031pfcPIH66YSPaGnXYeFVpFEAJ4DMCQSObLUovwTWR7aUeOKp3aoZwXb2cI8JBW7jlfKxeZZKsJvyodxM1y1i696QIMYAAS4k+Xl+0FUuDBLBdVmwwG2IM3NHIbzC9k2rQ9DStVERP7J2zMDleFmTfVIu6HhWhQHcgpB+LuRMXmApbzwKywPEEO72IHZ22x0gReKrcrYBRkzrB5fflRtm3PEdqzpOQ3M6e0ecJ4rTcsfWzIZLPnmajxZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PasvSKpzQQExdlIwY0+XHI8GSwUwRkhp+ceZjXyL9fM=;
 b=gDtYHlcXqRFxnkEKBZd3CI+6p9ULwAetYimFk4oCvzr0HeJq5dTf12HI93MINx5wf9YLD6evXSrTn1SOUmaq0Kz95M8bF33UUMTwacEQ1s8pIuA5b38XzqKBB0sIKQMB3+/GFHOQTi8b/qVYbA/GhW4H+x+MefDbcLWNoXo3w8Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB11036.jpnprd01.prod.outlook.com
 (2603:1096:400:3ad::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Mon, 3 Feb
 2025 06:21:13 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8398.025; Mon, 3 Feb 2025
 06:21:13 +0000
Message-ID: <87wme7r1k7.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 4/6] ASoC: simple-card-utils: use snd_soc_ret()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <8734gvsg5i.wl-kuninori.morimoto.gx@renesas.com>
References: <8734gvsg5i.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 3 Feb 2025 06:21:12 +0000
X-ClientProxiedBy: TYCP286CA0184.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB11036:EE_
X-MS-Office365-Filtering-Correlation-Id: c957e2e5-7b3c-4d31-340d-08dd441af52f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WoVHCWmuhXvICoiaMZMulUsS2w1g4gy4wzeraglr9NnmxCAwaw9idXP8/+cN?=
 =?us-ascii?Q?XBMfDt7xt6YAW4K4QYWU1v8XHyLC4w7CkjqJorIcX4WFFY0I8NAPgEPj+Rn1?=
 =?us-ascii?Q?RObaOhNZB3KavQ1NNwfdfaEHO2EH7j8McQuC2ND4vphe7AEgFtnLev0EKBOw?=
 =?us-ascii?Q?SI0u+ndOO0IcPQZD2lu22QhUgdEKLNTNrhHuB6MmAvTDGetwKSX3/1DF5xNA?=
 =?us-ascii?Q?0IOBIQhau/7yqwe0PLH+lwxLMzvlqrOYG07DVBaDJMo/rYPNBahTA3hIHMOK?=
 =?us-ascii?Q?yOrFuhAt8VydeW4EwEgfZU44pNYYS+gtrtHNAUh0MzWLei6/LTFB7kCgSfgh?=
 =?us-ascii?Q?n5gHfu4TFs5e1S4IpFwS3jMmPdMJqZAI3H+aBMJPJPbz2zBISD1zCKA4aR8V?=
 =?us-ascii?Q?kvjDnVr3lKWRFWKxw15Cv72MHKf93hIzQNU1N8Je6PEw1qbmrOELU3vkNKFY?=
 =?us-ascii?Q?dqqCxghXE/RBWO09teLLwS9oORlR8+39T4YlDq/FLbD0e0tBD+kXi0z02/Mn?=
 =?us-ascii?Q?+XGNKSxq7YQ/CzCcGPUkcRTLeBU8/Z759J6NEV8CS8VRzIMgYv65QZ9E5pHL?=
 =?us-ascii?Q?NAtXdyxmqghFsEaOWOkgn+thqRDB11lG4rwHUkZLWBWE9zHBQFhHv2EFdhjj?=
 =?us-ascii?Q?hResFLsBcf3DwSJD+fh7MdiL3QrwCoknW6euSF0w6QS1GjqAoo3qaPkbVlPQ?=
 =?us-ascii?Q?KUwXsgQtANYZfTaYxktZBnn74nyzJOTvfK5IzfXPf89QzI/vsy5S9qYseqJO?=
 =?us-ascii?Q?AjxldnfN+FNlxIHMIh/QbiZN6va5bSjF6BoMIZ5yZ/eupMpE3I/bFh9FubRk?=
 =?us-ascii?Q?N9BDiETpDmQK0uDjCangHFvHAfAZDITKitYA/Mgp8qVkq/1uw1I5ZiJjUxEo?=
 =?us-ascii?Q?deFSbogP0H8mQRfQ9o7UmZZ4Oh3pBwbvedGbuBEtJBOzIR+r8ddPxpqV5aRJ?=
 =?us-ascii?Q?cD9rDNKHgEbAGyUC2saMeekjEH5I1IbOU08EfhJ0S/XFsau1Yf15z5brxLaC?=
 =?us-ascii?Q?bZbF2XakN8BEK7g88DQ+In0jTmTP6Gb+qpSAePfkCBdnaX76EhOpFga12Jos?=
 =?us-ascii?Q?1r2ejlAx11knpoHp1+cRdPSJVSnhwdWMIf+Zi7/NRBsL26BzcV+XBGruI55e?=
 =?us-ascii?Q?xZjKfPpKEF7dUxwvNYQl2Z6qz2SFXU6YU+Z8CnyXw19o+sOf9adXTPSmJsVi?=
 =?us-ascii?Q?SadASI7yTzH3f0VnFZigQotLd7CJTJ9WxV8+ZON2H9d10V/HSOeLShx4/EBq?=
 =?us-ascii?Q?AeHTFT4Xd/v9KVdazfbvwZGCKLxKq8vZJvixwmPCU2WBpupzN6032S6t4rsy?=
 =?us-ascii?Q?Qw+ipQqQFoWdIEMM/jY0K1PQlc+cxXaxLexykneDNUlLYfb+vEgip94QtgCY?=
 =?us-ascii?Q?RdpbbobYelRs7S9H7+Cngz7zkyt50v5L9eys508659gZi62eirHzIF5FUHAo?=
 =?us-ascii?Q?/UmN50M8XKdnlxcXz74+4w4Z8HNu/46m?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DA8WTt/+mj5JR6gYjhmvxCwLdFODixN8vuFE7ShNWBFdb2Pd49egSk+6w8wn?=
 =?us-ascii?Q?qf/QdMsWusakMWQqR7DFaaq4WJWPbNAmHeq+yyGj2jluBDDOrNCqb3VaYMGx?=
 =?us-ascii?Q?0JvQNt1jVv3gzwgxioUEgEKs953UNo/lhWHbSQQ5D5xRyLgqUVPK44sTXMk/?=
 =?us-ascii?Q?2qxgu9IHvKZNBVSuZ9VPCP6vbC8Rsp8b3YHIGCwKuRRwX2qNUE80FaMaJDMi?=
 =?us-ascii?Q?9zA9rxZ2B26K29pYGdQ+fmgSxMlhhJaBc42oRhJuFytHeuGxiMVKXggNjsvC?=
 =?us-ascii?Q?nmpBPsYpphQG9JebTea07JWiRFeknx73gFF3WYBG8TFlkAtvJS2RgcqwU+OW?=
 =?us-ascii?Q?0xPRSE4ug+9JVd3I2SL3JwpClSIRFOcoawZ82j5jqlNFO4dHrGp+x+ZHzfsh?=
 =?us-ascii?Q?gaOh9AL7K8uXhg+koFgPBFXE/A95P8dFtkc9mEHQk27l0cJKMurL5v1s5lHG?=
 =?us-ascii?Q?9WbWYt5BQmrVltFcsfWasJNvsSocmTrwRRTI0iNRfq038NFAgkbYmVzEtdOD?=
 =?us-ascii?Q?qBn1tBnv6NPvhEzn7leSfhUVoSLALb8sxe4yLcY1/m6iiWtWh1m+ZoJjM7ih?=
 =?us-ascii?Q?iQLzZrgsiislkVyVvSVu+dRV+Bry7M3ByDZxUsqeBXbkH2hbTzSnQA7ZveL0?=
 =?us-ascii?Q?YdaWMmUbQMjx4YMBdfgvVCeOGR91hl8qqEAMzjrtkwyhk9UdOcEwbuNw8N/7?=
 =?us-ascii?Q?vnV7rW90H+Obm/uisyj3Ll/oF9PVDBxuRvUh0ZtSi/D7MQn/Z95UvtOZLhW8?=
 =?us-ascii?Q?BdfoKZPTRKcKZVK+JgvhoQLh6ANsgWHWsbvqEDbJASdr+Cn2Jvfe74F5Jy18?=
 =?us-ascii?Q?KCvLx/keiZ/uzzRnuySc8kLuN/MOKv9ZYnmWyMAzFM7PPTynZBVwykucp9Ho?=
 =?us-ascii?Q?hlSxIX4C8lN2kipXtNWB/mEo+B9WXRgBZKXidCDduH4IcGX3yKMyVTbY6xhq?=
 =?us-ascii?Q?3mh5YmbUISkUqyu0DO3IpQZYJ/9JUsRqlPlkC66VC6Z04sdZGlBGGgcujGIC?=
 =?us-ascii?Q?bJagG1somDyDa9pL2Wp9t2GWJSvsIbcsHztq8JUGtwsw8IbnIyofg2+qfEs5?=
 =?us-ascii?Q?ktWjDYaNDGLzQVzPJhYjtHid2OI5Tj47Em1JF6wCqzm4XbOt9BD3twwZEgM1?=
 =?us-ascii?Q?tEHVLzoo5xxsHHK/B9BcQ8jtZAOlen/K0pAReUh8ZCx++pymntPp0pKsfTu4?=
 =?us-ascii?Q?jkkc5sqNG01+9bWkjFCZMZWkUxp4tNARgS4K8O1g3cFj7YP61LbKOnJhgnN5?=
 =?us-ascii?Q?4LPYFI/A4t5lDZ/n/KHxGUBI/CKIGkio0wPyLS3+6JX/jKmm+5K26eYsC5dr?=
 =?us-ascii?Q?U1AzrdTGTkKWEQMB+WLjInd4DA8XDwH5TvHv0sMBWMi8KGjR/12nbx4GVp8t?=
 =?us-ascii?Q?rlVVxNEgvFfNvnGB0e9ClLJjYAl2uwMTAXk5DbHm31CzGfsco/lUjGLy5tBt?=
 =?us-ascii?Q?yGmuho9Lm595fkw8ppR8w4TgUs6aTqn7k9hO/lggj82GU9H6WwkW3TS+AZO8?=
 =?us-ascii?Q?uLlUwPTcp9IlPj3hyxLJGSetjN4tFt2SmcKcNru3m7oEf+//MSiqUxcEUN6O?=
 =?us-ascii?Q?Z2MoGJHAG3wipaeW4xxqXj1aDezeR889tMRIrjssyE+Yh+Btw+RaMwKduaHC?=
 =?us-ascii?Q?l8R875LkYG2NWVnDhILb43Q=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c957e2e5-7b3c-4d31-340d-08dd441af52f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 06:21:13.0698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /GnqHWDg4PrphV8nxqCaA/6/K2qlChN27Xod1w6GKr9n8xldn1zUUPWnEKZxOSKuj/FZNjyeKm8E8rUuBVGTj9vSaAkvn3apxwg6Q6bxgVLvnMvkYAmoM52lxfUZPuRr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11036

We can use snd_soc_ret() to indicate error message when return.
Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/simple_card_utils.h     |   8 +-
 sound/soc/generic/audio-graph-card.c  |   6 +-
 sound/soc/generic/audio-graph-card2.c |  14 +--
 sound/soc/generic/simple-card-utils.c | 170 +++++++++++++++-----------
 sound/soc/generic/simple-card.c       |   4 +-
 5 files changed, 115 insertions(+), 87 deletions(-)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index 892f70532363e..69a9c9c4d0e9c 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -142,14 +142,14 @@ int simple_util_parse_daifmt(struct device *dev,
 			     struct device_node *codec,
 			     char *prefix,
 			     unsigned int *retfmt);
-int simple_util_parse_tdm_width_map(struct device *dev, struct device_node *np,
+int simple_util_parse_tdm_width_map(struct simple_util_priv *priv, struct device_node *np,
 				    struct simple_util_dai *dai);
 
 __printf(3, 4)
-int simple_util_set_dailink_name(struct device *dev,
+int simple_util_set_dailink_name(struct simple_util_priv *priv,
 				 struct snd_soc_dai_link *dai_link,
 				 const char *fmt, ...);
-int simple_util_parse_card_name(struct snd_soc_card *card,
+int simple_util_parse_card_name(struct simple_util_priv *priv,
 				char *prefix);
 
 int simple_util_parse_clk(struct device *dev,
@@ -201,7 +201,7 @@ void simple_util_remove(struct platform_device *pdev);
 
 int graph_util_card_probe(struct snd_soc_card *card);
 int graph_util_is_ports0(struct device_node *port);
-int graph_util_parse_dai(struct device *dev, struct device_node *ep,
+int graph_util_parse_dai(struct simple_util_priv *priv, struct device_node *ep,
 			 struct snd_soc_dai_link_component *dlc, int *is_single_link);
 
 void graph_util_parse_link_direction(struct device_node *np,
diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 7c422535b01a2..bd7ebbec0fc9c 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -111,7 +111,7 @@ static int graph_parse_node(struct simple_util_priv *priv,
 		dai = simple_props_to_dai_codec(dai_props, 0);
 	}
 
-	ret = graph_util_parse_dai(dev, ep, dlc, cpu);
+	ret = graph_util_parse_dai(priv, ep, dlc, cpu);
 	if (ret < 0)
 		return ret;
 
@@ -183,7 +183,7 @@ static int graph_link_init(struct simple_util_priv *priv,
 	if (priv->ops)
 		dai_link->ops	= priv->ops;
 
-	return simple_util_set_dailink_name(dev, dai_link, name);
+	return simple_util_set_dailink_name(priv, dai_link, name);
 }
 
 static int graph_dai_link_of_dpcm(struct simple_util_priv *priv,
@@ -586,7 +586,7 @@ int audio_graph_parse_of(struct simple_util_priv *priv, struct device *dev)
 	if (ret < 0)
 		goto err;
 
-	ret = simple_util_parse_card_name(card, NULL);
+	ret = simple_util_parse_card_name(priv, NULL);
 	if (ret < 0)
 		goto err;
 
diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index ee94b256b7707..945a16e6d6919 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -409,7 +409,7 @@ static int __graph_parse_node(struct simple_util_priv *priv,
 		dai = simple_props_to_dai_codec(dai_props, idx);
 	}
 
-	ret = graph_util_parse_dai(dev, ep, dlc, &is_single_links);
+	ret = graph_util_parse_dai(priv, ep, dlc, &is_single_links);
 	if (ret < 0)
 		return ret;
 
@@ -417,7 +417,7 @@ static int __graph_parse_node(struct simple_util_priv *priv,
 	if (ret < 0)
 		return ret;
 
-	ret = simple_util_parse_tdm_width_map(dev, ep, dai);
+	ret = simple_util_parse_tdm_width_map(priv, ep, dai);
 	if (ret < 0)
 		return ret;
 
@@ -443,22 +443,22 @@ static int __graph_parse_node(struct simple_util_priv *priv,
 		case GRAPH_NORMAL:
 			/* run is_cpu only. see audio_graph2_link_normal() */
 			if (is_cpu)
-				simple_util_set_dailink_name(dev, dai_link, "%s%s-%s%s",
+				simple_util_set_dailink_name(priv, dai_link, "%s%s-%s%s",
 							       cpus->dai_name,   cpu_multi,
 							     codecs->dai_name, codec_multi);
 			break;
 		case GRAPH_DPCM:
 			if (is_cpu)
-				simple_util_set_dailink_name(dev, dai_link, "fe.%pOFP.%s%s",
+				simple_util_set_dailink_name(priv, dai_link, "fe.%pOFP.%s%s",
 						cpus->of_node, cpus->dai_name, cpu_multi);
 			else
-				simple_util_set_dailink_name(dev, dai_link, "be.%pOFP.%s%s",
+				simple_util_set_dailink_name(priv, dai_link, "be.%pOFP.%s%s",
 						codecs->of_node, codecs->dai_name, codec_multi);
 			break;
 		case GRAPH_C2C:
 			/* run is_cpu only. see audio_graph2_link_c2c() */
 			if (is_cpu)
-				simple_util_set_dailink_name(dev, dai_link, "c2c.%s%s-%s%s",
+				simple_util_set_dailink_name(priv, dai_link, "c2c.%s%s-%s%s",
 							     cpus->dai_name,   cpu_multi,
 							     codecs->dai_name, codec_multi);
 			break;
@@ -1332,7 +1332,7 @@ int audio_graph2_parse_of(struct simple_util_priv *priv, struct device *dev,
 	if (ret < 0)
 		goto err;
 
-	ret = simple_util_parse_card_name(card, NULL);
+	ret = simple_util_parse_card_name(priv, NULL);
 	if (ret < 0)
 		goto err;
 
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index dd414634b4ac7..eec6b8b5c4d8b 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -15,6 +15,13 @@
 #include <sound/pcm_params.h>
 #include <sound/simple_card_utils.h>
 
+#define simple_ret(priv, ret) _simple_ret(priv, __func__, ret)
+static inline int _simple_ret(struct simple_util_priv *priv,
+			      const char *func, int ret)
+{
+	return snd_soc_ret(simple_priv_to_dev(priv), ret, "at %s()\n", func);
+}
+
 int simple_util_get_sample_fmt(struct simple_util_data *data)
 {
 	int i;
@@ -133,33 +140,42 @@ int simple_util_parse_daifmt(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(simple_util_parse_daifmt);
 
-int simple_util_parse_tdm_width_map(struct device *dev, struct device_node *np,
+int simple_util_parse_tdm_width_map(struct simple_util_priv *priv, struct device_node *np,
 				    struct simple_util_dai *dai)
 {
+	struct device *dev = simple_priv_to_dev(priv);
 	int n, i, ret;
 	u32 *p;
 
+	/*
+	 * NOTE
+	 *
+	 * Clang doesn't allow to use "goto end" before calling __free(),
+	 * because it bypasses the initialization. Use simple_ret() directly.
+	 */
+
 	n = of_property_count_elems_of_size(np, "dai-tdm-slot-width-map", sizeof(u32));
 	if (n <= 0)
 		return 0;
+
 	if (n % 3) {
 		dev_err(dev, "Invalid number of cells for dai-tdm-slot-width-map\n");
-		return -EINVAL;
+		return simple_ret(priv, -EINVAL); /* see NOTE */
 	}
 
+	ret = -ENOMEM;
 	dai->tdm_width_map = devm_kcalloc(dev, n, sizeof(*dai->tdm_width_map), GFP_KERNEL);
 	if (!dai->tdm_width_map)
-		return -ENOMEM;
+		return simple_ret(priv, ret); /* see NOTE */
 
-	u32 *array_values __free(kfree) = kcalloc(n, sizeof(*array_values),
-						  GFP_KERNEL);
+	u32 *array_values __free(kfree) = kcalloc(n, sizeof(*array_values), GFP_KERNEL);
 	if (!array_values)
-		return -ENOMEM;
+		goto end;
 
 	ret = of_property_read_u32_array(np, "dai-tdm-slot-width-map", array_values, n);
 	if (ret < 0) {
 		dev_err(dev, "Could not read dai-tdm-slot-width-map: %d\n", ret);
-		return ret;
+		goto end;
 	}
 
 	p = array_values;
@@ -170,15 +186,17 @@ int simple_util_parse_tdm_width_map(struct device *dev, struct device_node *np,
 	}
 
 	dai->n_tdm_widths = i;
-
-	return 0;
+	ret = 0;
+end:
+	return simple_ret(priv, ret);
 }
 EXPORT_SYMBOL_GPL(simple_util_parse_tdm_width_map);
 
-int simple_util_set_dailink_name(struct device *dev,
+int simple_util_set_dailink_name(struct simple_util_priv *priv,
 				 struct snd_soc_dai_link *dai_link,
 				 const char *fmt, ...)
 {
+	struct device *dev = simple_priv_to_dev(priv);
 	va_list ap;
 	char *name = NULL;
 	int ret = -ENOMEM;
@@ -194,13 +212,14 @@ int simple_util_set_dailink_name(struct device *dev,
 		dai_link->stream_name	= name;
 	}
 
-	return ret;
+	return simple_ret(priv, ret);
 }
 EXPORT_SYMBOL_GPL(simple_util_set_dailink_name);
 
-int simple_util_parse_card_name(struct snd_soc_card *card,
+int simple_util_parse_card_name(struct simple_util_priv *priv,
 				char *prefix)
 {
+	struct snd_soc_card *card = simple_priv_to_card(priv);
 	int ret;
 
 	if (!prefix)
@@ -214,13 +233,13 @@ int simple_util_parse_card_name(struct snd_soc_card *card,
 		snprintf(prop, sizeof(prop), "%sname", prefix);
 		ret = snd_soc_of_parse_card_name(card, prop);
 		if (ret < 0)
-			return ret;
+			goto end;
 	}
 
 	if (!card->name && card->dai_link)
 		card->name = card->dai_link->name;
-
-	return 0;
+end:
+	return simple_ret(priv, ret);
 }
 EXPORT_SYMBOL_GPL(simple_util_parse_card_name);
 
@@ -348,7 +367,8 @@ int simple_util_startup(struct snd_pcm_substream *substream)
 			break;
 		simple_clk_disable(dai);
 	}
-	return ret;
+
+	return simple_ret(priv, ret);
 }
 EXPORT_SYMBOL_GPL(simple_util_startup);
 
@@ -379,16 +399,19 @@ void simple_util_shutdown(struct snd_pcm_substream *substream)
 }
 EXPORT_SYMBOL_GPL(simple_util_shutdown);
 
-static int simple_set_clk_rate(struct device *dev,
-				    struct simple_util_dai *simple_dai,
-				    unsigned long rate)
+static int simple_set_clk_rate(struct simple_util_priv *priv,
+			       struct simple_util_dai *simple_dai,
+			       unsigned long rate)
 {
+	struct device *dev = simple_priv_to_dev(priv);
+	int ret = -EINVAL;
+
 	if (!simple_dai)
 		return 0;
 
 	if (simple_dai->clk_fixed && rate != simple_dai->sysclk) {
 		dev_err(dev, "dai %s invalid clock rate %lu\n", simple_dai->name, rate);
-		return -EINVAL;
+		goto end;
 	}
 
 	if (!simple_dai->clk)
@@ -397,12 +420,15 @@ static int simple_set_clk_rate(struct device *dev,
 	if (clk_get_rate(simple_dai->clk) == rate)
 		return 0;
 
-	return clk_set_rate(simple_dai->clk, rate);
+	ret = clk_set_rate(simple_dai->clk, rate);
+end:
+	return simple_ret(priv, ret);
 }
 
-static int simple_set_tdm(struct snd_soc_dai *dai,
-				struct simple_util_dai *simple_dai,
-				struct snd_pcm_hw_params *params)
+static int simple_set_tdm(struct simple_util_priv *priv,
+			  struct snd_soc_dai *dai,
+			  struct simple_util_dai *simple_dai,
+			  struct snd_pcm_hw_params *params)
 {
 	int sample_bits = params_width(params);
 	int slot_width, slot_count;
@@ -430,12 +456,8 @@ static int simple_set_tdm(struct snd_soc_dai *dai,
 				       simple_dai->rx_slot_mask,
 				       slot_count,
 				       slot_width);
-	if (ret && ret != -ENOTSUPP) {
-		dev_err(dai->dev, "simple-card: set_tdm_slot error: %d\n", ret);
-		return ret;
-	}
 
-	return 0;
+	return simple_ret(priv, ret);
 }
 
 int simple_util_hw_params(struct snd_pcm_substream *substream,
@@ -457,15 +479,15 @@ int simple_util_hw_params(struct snd_pcm_substream *substream,
 		mclk = params_rate(params) * mclk_fs;
 
 		for_each_prop_dai_codec(props, i, pdai) {
-			ret = simple_set_clk_rate(rtd->dev, pdai, mclk);
+			ret = simple_set_clk_rate(priv, pdai, mclk);
 			if (ret < 0)
-				return ret;
+				goto end;
 		}
 
 		for_each_prop_dai_cpu(props, i, pdai) {
-			ret = simple_set_clk_rate(rtd->dev, pdai, mclk);
+			ret = simple_set_clk_rate(priv, pdai, mclk);
 			if (ret < 0)
-				return ret;
+				goto end;
 		}
 
 		/* Ensure sysclk is set on all components in case any
@@ -476,39 +498,40 @@ int simple_util_hw_params(struct snd_pcm_substream *substream,
 			ret = snd_soc_component_set_sysclk(component, 0, 0,
 							   mclk, SND_SOC_CLOCK_IN);
 			if (ret && ret != -ENOTSUPP)
-				return ret;
+				goto end;
 		}
 
 		for_each_rtd_codec_dais(rtd, i, sdai) {
 			pdai = simple_props_to_dai_codec(props, i);
 			ret = snd_soc_dai_set_sysclk(sdai, 0, mclk, pdai->clk_direction);
 			if (ret && ret != -ENOTSUPP)
-				return ret;
+				goto end;
 		}
 
 		for_each_rtd_cpu_dais(rtd, i, sdai) {
 			pdai = simple_props_to_dai_cpu(props, i);
 			ret = snd_soc_dai_set_sysclk(sdai, 0, mclk, pdai->clk_direction);
 			if (ret && ret != -ENOTSUPP)
-				return ret;
+				goto end;
 		}
 	}
 
 	for_each_prop_dai_codec(props, i, pdai) {
 		sdai = snd_soc_rtd_to_codec(rtd, i);
-		ret = simple_set_tdm(sdai, pdai, params);
+		ret = simple_set_tdm(priv, sdai, pdai, params);
 		if (ret < 0)
-			return ret;
+			goto end;
 	}
 
 	for_each_prop_dai_cpu(props, i, pdai) {
 		sdai = snd_soc_rtd_to_cpu(rtd, i);
-		ret = simple_set_tdm(sdai, pdai, params);
+		ret = simple_set_tdm(priv, sdai, pdai, params);
 		if (ret < 0)
-			return ret;
+			goto end;
 	}
-
-	return 0;
+	ret = 0;
+end:
+	return simple_ret(priv, ret);
 }
 EXPORT_SYMBOL_GPL(simple_util_hw_params);
 
@@ -536,7 +559,8 @@ int simple_util_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 }
 EXPORT_SYMBOL_GPL(simple_util_be_hw_params_fixup);
 
-static int simple_init_dai(struct snd_soc_dai *dai, struct simple_util_dai *simple_dai)
+static int simple_init_dai(struct simple_util_priv *priv,
+			   struct snd_soc_dai *dai, struct simple_util_dai *simple_dai)
 {
 	int ret;
 
@@ -548,7 +572,7 @@ static int simple_init_dai(struct snd_soc_dai *dai, struct simple_util_dai *simp
 					     simple_dai->clk_direction);
 		if (ret && ret != -ENOTSUPP) {
 			dev_err(dai->dev, "simple-card: set_sysclk error\n");
-			return ret;
+			goto end;
 		}
 	}
 
@@ -560,11 +584,12 @@ static int simple_init_dai(struct snd_soc_dai *dai, struct simple_util_dai *simp
 					       simple_dai->slot_width);
 		if (ret && ret != -ENOTSUPP) {
 			dev_err(dai->dev, "simple-card: set_tdm_slot error\n");
-			return ret;
+			goto end;
 		}
 	}
-
-	return 0;
+	ret = 0;
+end:
+	return simple_ret(priv, ret);
 }
 
 static inline int simple_component_is_codec(struct snd_soc_component *component)
@@ -572,7 +597,8 @@ static inline int simple_component_is_codec(struct snd_soc_component *component)
 	return component->driver->endianness;
 }
 
-static int simple_init_for_codec2codec(struct snd_soc_pcm_runtime *rtd,
+static int simple_init_for_codec2codec(struct simple_util_priv *priv,
+				       struct snd_soc_pcm_runtime *rtd,
 				       struct simple_dai_props *dai_props)
 {
 	struct snd_soc_dai_link *dai_link = rtd->dai_link;
@@ -604,12 +630,13 @@ static int simple_init_for_codec2codec(struct snd_soc_pcm_runtime *rtd,
 
 	if (ret < 0) {
 		dev_err(rtd->dev, "simple-card: no valid dai_link params\n");
-		return ret;
+		goto end;
 	}
 
+	ret = -ENOMEM;
 	c2c_params = devm_kzalloc(rtd->dev, sizeof(*c2c_params), GFP_KERNEL);
 	if (!c2c_params)
-		return -ENOMEM;
+		goto end;
 
 	c2c_params->formats		= hw.formats;
 	c2c_params->rates		= hw.rates;
@@ -621,7 +648,9 @@ static int simple_init_for_codec2codec(struct snd_soc_pcm_runtime *rtd,
 	dai_link->c2c_params		= c2c_params;
 	dai_link->num_c2c_params	= 1;
 
-	return 0;
+	ret = 0;
+end:
+	return simple_ret(priv, ret);
 }
 
 int simple_util_dai_init(struct snd_soc_pcm_runtime *rtd)
@@ -632,21 +661,19 @@ int simple_util_dai_init(struct snd_soc_pcm_runtime *rtd)
 	int i, ret;
 
 	for_each_prop_dai_codec(props, i, dai) {
-		ret = simple_init_dai(snd_soc_rtd_to_codec(rtd, i), dai);
+		ret = simple_init_dai(priv, snd_soc_rtd_to_codec(rtd, i), dai);
 		if (ret < 0)
-			return ret;
+			goto end;
 	}
 	for_each_prop_dai_cpu(props, i, dai) {
-		ret = simple_init_dai(snd_soc_rtd_to_cpu(rtd, i), dai);
+		ret = simple_init_dai(priv, snd_soc_rtd_to_cpu(rtd, i), dai);
 		if (ret < 0)
-			return ret;
+			goto end;
 	}
 
-	ret = simple_init_for_codec2codec(rtd, props);
-	if (ret < 0)
-		return ret;
-
-	return 0;
+	ret = simple_init_for_codec2codec(priv, rtd, props);
+end:
+	return simple_ret(priv, ret);
 }
 EXPORT_SYMBOL_GPL(simple_util_dai_init);
 
@@ -831,7 +858,7 @@ int simple_util_init_aux_jacks(struct simple_util_priv *priv, char *prefix)
 	priv->aux_jacks = devm_kcalloc(card->dev, num,
 				       sizeof(struct snd_soc_jack), GFP_KERNEL);
 	if (!priv->aux_jacks)
-		return -ENOMEM;
+		return simple_ret(priv, -ENOMEM);
 
 	for_each_card_auxs(card, component) {
 		char id[128];
@@ -992,13 +1019,11 @@ int graph_util_card_probe(struct snd_soc_card *card)
 
 	ret = simple_util_init_hp(card, &priv->hp_jack, NULL);
 	if (ret < 0)
-		return ret;
+		goto end;
 
 	ret = simple_util_init_mic(card, &priv->mic_jack, NULL);
-	if (ret < 0)
-		return ret;
-
-	return 0;
+end:
+	return simple_ret(priv, ret);
 }
 EXPORT_SYMBOL_GPL(graph_util_card_probe);
 
@@ -1074,9 +1099,10 @@ static int graph_get_dai_id(struct device_node *ep)
 	return id;
 }
 
-int graph_util_parse_dai(struct device *dev, struct device_node *ep,
+int graph_util_parse_dai(struct simple_util_priv *priv, struct device_node *ep,
 			 struct snd_soc_dai_link_component *dlc, int *is_single_link)
 {
+	struct device *dev = simple_priv_to_dev(priv);
 	struct of_phandle_args args = {};
 	struct snd_soc_dai *dai;
 	int ret;
@@ -1092,10 +1118,11 @@ int graph_util_parse_dai(struct device *dev, struct device_node *ep,
 	args.np = ep;
 	dai = snd_soc_get_dai_via_args(&args);
 	if (dai) {
+		ret = -ENOMEM;
 		dlc->dai_name = snd_soc_dai_name_get(dai);
 		dlc->dai_args = snd_soc_copy_dai_args(dev, &args);
 		if (!dlc->dai_args)
-			return -ENOMEM;
+			goto end;
 
 		goto parse_dai_end;
 	}
@@ -1126,13 +1153,14 @@ int graph_util_parse_dai(struct device *dev, struct device_node *ep,
 	 */
 	ret = snd_soc_get_dlc(&args, dlc);
 	if (ret < 0)
-		return ret;
+		goto end;
 
 parse_dai_end:
 	if (is_single_link)
 		*is_single_link = of_graph_get_endpoint_count(node) == 1;
-
-	return 0;
+	ret = 0;
+end:
+	return simple_ret(priv, ret);
 }
 EXPORT_SYMBOL_GPL(graph_util_parse_dai);
 
diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 004fda4504c42..5af6d1b308f23 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -223,7 +223,7 @@ static int simple_link_init(struct simple_util_priv *priv,
 	dai_link->init			= simple_util_dai_init;
 	dai_link->ops			= &simple_ops;
 
-	ret = simple_util_set_dailink_name(dev, dai_link, name);
+	ret = simple_util_set_dailink_name(priv, dai_link, name);
 end:
 	return simple_ret(priv, ret);
 }
@@ -544,7 +544,7 @@ static int simple_parse_of(struct simple_util_priv *priv, struct link_info *li)
 	if (ret < 0)
 		goto end;
 
-	ret = simple_util_parse_card_name(card, PREFIX);
+	ret = simple_util_parse_card_name(priv, PREFIX);
 	if (ret < 0)
 		goto end;
 
-- 
2.43.0

