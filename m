Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011048.outbound.protection.outlook.com [52.101.70.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231DD3081D7;
	Tue, 17 Mar 2026 03:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773718723; cv=fail; b=ms8SHXSgfrEfhP8DzNAmnlpCT2HbQR/XVOUXSV9m95u7w2jv0kGp17pFVUE9KuoqBD+dJJuA+hv2LJsJ03PoC1oFL4A4hcKZmNQTJrfT6+KBRSMCFEWiNYijhZRoshtOLVosulVv0FKbR/9Z/js4NU5SI8ZOFGwqmDWZgcRApPA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773718723; c=relaxed/simple;
	bh=no/EJ7Hdf+1sU0IXI0YrIHKxImuxNNYaKtfcbYHBBEg=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GK6Eke8V3c0VXE3UZ3S/4Suhw2hPaG0G1UYi4yAmXLp9Hf+4Q2vxuijkj7IsEUyVu9WS4mEn/S8iUI2+KsRM06cNllLxc3wjHD3tdcMOrTu+8axyiPASTiXz88vHk/Rdugb8wtMVrJU2cd9lw3M5eexYsIaDQUTq9pOdKXv8VJ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HWrRcVPQ; arc=fail smtp.client-ip=52.101.70.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="HWrRcVPQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H3atxctsrHmCvI5Ze92li9IoJ4uoZZdR1TiVyYWckTNJ1K5xFzLR8XbjfcZnu3MrXbynS4Wi28PiFSZfAAPQKpUhzVLLOM2c4Vv2asPr5y7Ay7eWLRATrVGKL14dVEEdOzsM0roB/TGF+2gLLNA6sHCfORjhnysAxyhsJyjlwtUZL7vrvnElECVld/6Hl1mCNOoP7aK+n6gfCxV4bbXLLPEWH0o2DpOFJrh+fOTKxRWGoYmhocDZwWt4ZkwwDFU5iihXbI2T4aaiCV8viO+ldRY4AyGg2RGIJhB3Q4mXj+67kBI2GxLH2qFFVcJTj7RU3lJlG4a3vk9awTDJp3mnNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RH3F3X2cJjr6T/IpDyyduprlhGg/YR03OQDBO2kCPQA=;
 b=p8mX6LOT/Sr1iGSNudyUeInB66/gMGx6btWa+dD6XLorg5emfPl9hbFAfdiZJS77TpK6fzIDEGBPExzyYKdOq8vHbaCn2AvCY2EV9FVQSoobKFbr102FrXweinY4KrROkp885mW33L9tRJ/tBcciIrqcdlr+Fw2rKMUr/CPd1Iy72tiQMts5EGhOPCl0tC8eG1CD0PgXoLKoGMQYgKPhp7MqONMi14AJAyNvSq9S81DZmG/rvGho3iLk3j2Dkusz4EnKfvsIi0wJR+pfxPd5wukLROTUkzrA4CRi53UMfFVGBgt/sAdDNK8OvT+nJ/IbNVuXhDn2MenvU9maDPPTEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RH3F3X2cJjr6T/IpDyyduprlhGg/YR03OQDBO2kCPQA=;
 b=HWrRcVPQ9Tj1z+DAZTc2DQ/U8pOoMwImVLm7hWACEHdWTg04r5rHzR4x08bs68kWn2VgKcEtiDQtCLD3ESUkKdWTTW6fR4vGZRf99iZJTEKOw/yAc5sLv4ve0G/vxJQiBAhFoBAcc2oYXUfz5Hrl0k1BXoTx+moCmsIWJE7PclxuBJOKq/C5gV/pAMEBwr7y+Xu1Cuk1eG0q1aC0ommByJmIjSQpoMCPo1WTqhwYgUs9gymVC5YjTq73wYy6htLU/Kxz6w1FUDRPempbqDZxhiISfUFwREdQ8DyBkTgvQsw3PzTVtsmX0i23gzvjQQJV9PMwykrimAwhKwIGIdLd1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by PA4PR04MB9565.eurprd04.prod.outlook.com (2603:10a6:102:26b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Tue, 17 Mar
 2026 03:38:32 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%4]) with mapi id 15.20.9700.025; Tue, 17 Mar 2026
 03:38:39 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: broonie@kernel.org,
	kuninori.morimoto.gx@renesas.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	shengjiu.wang@nxp.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alexander.stein@ew.tq-group.com
Subject: [PATCH v2 1/2] ASoC: simple-card-utils: Check value of is_playback_only and is_capture_only
Date: Tue, 17 Mar 2026 11:39:51 +0800
Message-Id: <20260317033952.462209-2-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260317033952.462209-1-shengjiu.wang@nxp.com>
References: <20260317033952.462209-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0016.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::20) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|PA4PR04MB9565:EE_
X-MS-Office365-Filtering-Correlation-Id: 74e2ef43-4827-4e3c-4c29-08de83d6ad96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|19092799006|1800799024|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	E7tM1PWaf7+rV6aN2YVwjpMOVOjcZSz9zWdcBdjnLmOTKgkfnvBj4Z1kNHuQSwqZR/4OtgM4Q8PlX4A7p1sPiO+vNdxK84sUEANIYDbNlrdtONG8WqCj/u+8dEOPFRB4bYdp1kmwjXDYg1LxNjWN6yCysJoUD36twcbYLnhI94sKznWzL0AkAuH4BuznxG/fxN9TnoJkVmYb+xL38FIPEpxmxaA69ArxPTFZm/gbSVRafr7Ll4BWckKRmdG90fllCRBCiMUlg+60YXePlzSKwu37SiVoNrpF8qLOXtMjm6Xd8fz3a4fNV6zYXFS/MmXQGeWCIJHV91iIIMIvYTZQ007IV8tJJKo+EglR8arcx3X4MAN/dCyQix+nLBwOVIjNaBqrmC96UVIO+cIw46tAUC9sXMM5EflBjDeGgItTBrckJ9dqG3LZJf2fSDbU9TT1MVuDRygELxFAsB0pN8gv/mMNfLi5zUE2pRXOV3bMvQfhkQZ/hhypw0GPYr70fOut+diV/95rKY0GaG6BlwFC2UI7aaegJ7XGNRM5awOUAdrdB1qCl7AvsQf0Odi+0ADe7Lou7qT7uzTuAY68QKhIj1k1a0we+5HJ65sMtZg9qzA0wsv4uFlUkBeBMBZihfvPJVTuSpgcIaC6x9LbesSk/fpzi3J+HX4BDUWGSHxIGmlVnjL4vBTcd4Acx70/9zgCYS/27kOaVvZOhiW3zl9dVqsxb4069x54z8W4GXRZIYs/Tx5ZS6p+wl8zzvAGKcwM65UWXqQt5tw4g0MrinXH7DqU7mCzjyxPPQqdqpl60zM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(19092799006)(1800799024)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?z1axDZSGatEpt0mAfR9tK7x+mdc//tdfjluW2N7TEBA8kb5IQkfHTdLk9ZsE?=
 =?us-ascii?Q?QdcdZMBNrRXzvT7YxcAef2XF0njUnfuY26l33puyx/Nbm2uEND4YzTbXCBad?=
 =?us-ascii?Q?iPWCEFfKG56lSsJe0CqHfCqiv0RfR1iAtJd8UpsLpbp0ZjUTktGguIyQQPmZ?=
 =?us-ascii?Q?KkeagJnnWC/vdbS6ce9OSYBM11DGE+2ej4dX43Z5X84xfYeOOpsFw/gF/fed?=
 =?us-ascii?Q?KdX2Txv/ZiUhcMMpA5XWmRthio9gQaVUky+qh58ZmVkHBpULdJWVr/95vUGH?=
 =?us-ascii?Q?BYmXdfMc9ZDhFP+gcu56PQVhFlGI8sHsd5EJkT2AlAJgjlx5Yet2Tpl/tj/P?=
 =?us-ascii?Q?xx4s7w869rJu24+VNH9OdZPGbzHd3IjHuKX7duvK6A1lu/X+lP+GnLtzkrBG?=
 =?us-ascii?Q?EDvGongmvWlatM707WFzs8CidVsS3SEArJn8y2EK+PUYwqZa1ddJc0fYrsAG?=
 =?us-ascii?Q?+VGp9Zh4xkela0rOgDV2Zq7S0QuHm46bVZQtY2VJyJHo9bpTzCgYv5nkbXgS?=
 =?us-ascii?Q?+M9LPr7V9DxbykPoKuRkvF2/Mpscow0jmktccfLYKaqzMjTB+x/6FzmYx9Tw?=
 =?us-ascii?Q?OeFeC4hLRV1LQEj8hMGow6kfXn3W1izA/1dVJh6rcIZqKOg4JaeiNxQ6Anh8?=
 =?us-ascii?Q?f33/D9MNNZHUbuAlBZYAV7SyOl7H2ej95RsTh0CJtIB708fwjrPyB+5KWe0w?=
 =?us-ascii?Q?mB3mpRfwkqC6Vq8zXgCAQMj7LpeDVrcRb8K9s9Ht8rDM9CTGkROej7L+ni6W?=
 =?us-ascii?Q?8nNvbnQ0LT94YqDa31VKdqUgNAZc9QPFY/O0Uml8hp294Jx920HvqfKobGj0?=
 =?us-ascii?Q?3kWL1DxJ6eAzReb52/7qg0+vGZT4cCPjCe2jUQSdUndfIBja95njYL20ArlF?=
 =?us-ascii?Q?lmrH74a3PAX+skGdFSo3IASh4aUvyf50T1q476N2hkk+tQWO/wSIM23UsaBh?=
 =?us-ascii?Q?6YYOsp27fqIM8UgTkpJMPjWN4hEKHGy8iNprImKd1UBVhk0Dh/5m4oHz6+bD?=
 =?us-ascii?Q?NuiezAnai8+OTvlWmg7Tkpw6O/cItUsroCQPZ2piLBqeYqdPwNR37PUEDiCV?=
 =?us-ascii?Q?KCSNThQ0/wbVCZsYIpBEbqMTdo21SunX+QuVQHUP9tGIpUa+sRoQbKpIOYFA?=
 =?us-ascii?Q?37jT7/L7uZOihgPfQdaThKjdhVjZnsqKrX5iKR1aNc5AnaAZWF0Oq9oNxJyi?=
 =?us-ascii?Q?tr+x+B8jHJIgRQGUXWRi+RPWrZNsZMepD1MJX/yPwuPhzuedk5w0fEbYXe2F?=
 =?us-ascii?Q?YA6xe6NFqtmx5shPnv9/osiKozPrt4+iE9bclKBjUl2OWdVWjlOceX7sX66q?=
 =?us-ascii?Q?w4/TeovBwTDrTEaeLxuiJrt/QzTEIs06Ojiho2aT3T24eijoOwRK3cAg+3dB?=
 =?us-ascii?Q?VDW0KUQcfAXHBqwMETVS4G/LEVRXDKXQYMuYR8Q0pF1NZ1y8GzO9KWlfZwkc?=
 =?us-ascii?Q?GfR9FMCiKvtqPP5TTX6HIig9FCUmhKdaTFt2rl7z4ChIYAqhiaNjyzKIpDmU?=
 =?us-ascii?Q?sp9k/X+dgigAPOHawA3Nbrfb7IV5xNtny3RuEtwBt4A89LMxLdEF89Oy4xzn?=
 =?us-ascii?Q?hiQmPBDYx3c8QusILoYfIEC90uLp8WpWuIJ4AVk68EndQXQ0bDnDcNZaPSWq?=
 =?us-ascii?Q?ZCeDdB7YInAjAKMameE/5p3RjeCYJu4H8tOcsB/47SlkKTfLCD1LLdsFcYEH?=
 =?us-ascii?Q?2Pj43s1SNyIoYhKqt8TDOdpsry7rvTto+FQvk/Hw1DyyX7ITI8uNpmy7BHE8?=
 =?us-ascii?Q?tqBcJS8FWw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74e2ef43-4827-4e3c-4c29-08de83d6ad96
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 03:38:39.2879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ItGxqar7vV1hNzOvF8sfXws+oPfLmvrcC7sOeKnlumNm0EbTEoBQMIX8g5uyqdWkAmpfzdyC7dm5l7sZ5Q+/rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9565

The audio-graph-card2 gets the value of 'playback-only' and
'capture_only' property in below sequence, if there is 'playback_only' or
'capture_only' property in port_cpu and port_codec nodes, but no these
properties in ep_cpu and ep_codec nodes, the value of playback_only and
capture_only will be flushed to zero in the end.

graph_util_parse_link_direction(lnk,            &playback_only, &capture_only);
graph_util_parse_link_direction(ports_cpu,      &playback_only, &capture_only);
graph_util_parse_link_direction(ports_codec,    &playback_only, &capture_only);
graph_util_parse_link_direction(port_cpu,       &playback_only, &capture_only);
graph_util_parse_link_direction(port_codec,     &playback_only, &capture_only);
graph_util_parse_link_direction(ep_cpu,         &playback_only, &capture_only);
graph_util_parse_link_direction(ep_codec,       &playback_only, &capture_only);

So check the value of is_playback_only and is_capture_only in
graph_util_parse_link_direction() function, if they are true, then rewrite
the values, and no need to check the np variable as
of_property_read_bool() will ignore if it was NULL.

Fixes: 3cc393d2232e ("ASoC: simple-card-utils: Fix pointer check in graph_util_parse_link_direction")
Fixes: 22a507d7680f ("ASoC: simple-card-utils: Check device node before overwrite direction")
Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/generic/simple-card-utils.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 3115e1f37c0c..4cf3a5395763 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -1202,9 +1202,9 @@ void graph_util_parse_link_direction(struct device_node *np,
 	bool is_playback_only = of_property_read_bool(np, "playback-only");
 	bool is_capture_only  = of_property_read_bool(np, "capture-only");
 
-	if (np && playback_only)
+	if (playback_only && is_playback_only)
 		*playback_only = is_playback_only;
-	if (np && capture_only)
+	if (capture_only && is_capture_only)
 		*capture_only = is_capture_only;
 }
 EXPORT_SYMBOL_GPL(graph_util_parse_link_direction);
-- 
2.34.1

