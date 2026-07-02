Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011013.outbound.protection.outlook.com [40.107.74.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335F82D7D59
	for <linux-sound@vger.kernel.org>; Thu,  2 Jul 2026 01:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782956717; cv=fail; b=OqOwiLth3LCYjp/75DfaRGDOh+HiWKbX0k8taSgrwx8fc+fpMtMUWn8eTZ5WGsAX1dPeA7d4SQx6kwtSFL6SP7JQt+PKK+IMyQnyav1eAbFuNgiZYJ74PXJ+oFNvh03FEWFUa90Du653O4Y+NPct0oVMJh45XtTUv6+8Ml3cGdI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782956717; c=relaxed/simple;
	bh=Nhirs5uvW3ak4TqU3Uq2xaw7fiEA+2SNPRYdYn4jmy8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=q2d4aT+g6hwcOlIwDl49oPmtJBTBfayBHWIxzrc6VL7ZJ8RrDqlP3EtrvC2Rzu3Akoi2TJ1dZZysNNtnQ68pvPh9kwLmH0cIMr/5oE6XDk3Nk1lQLz6TDenrrrs9kYxl045LdZVW8Ou0/dQb2Xh7C76VzR7uEJ/0Hjhdv3HI1BA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=nz5mFpOo; arc=fail smtp.client-ip=40.107.74.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="nz5mFpOo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XVt/e0pm18oxzqO8qmVTmfhfixG75NZwGzIIZQqBqHC+U80TxXJmu3YDsKonkWnkxTyvBy24LOKiz1s8JNikk72IL3mn2TkT7AghUhG6wPPtFZh0oeo2hWhL4cvEjPlnlGn1zaZhWMICYM5M1oxNqrjUWK6MJKzBtq+rF7TufMwNBtT3sOv/MTASIJ7E7J56CWELXP+PWtu/BmJMoHtet376HCmhFOi9PBLUBRm88Q4snqPZcFHU4FLUG76xeM9g4ArL6gGWtQ61F2bLxkKwYK59ty3XUO3EXmcqywPbW59+vwh3WBsBg3lBn/KdFs4MIcyjIpHZntXxyKxyVutPbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wXPUGXet6hCBoLNeNFS8Qxp74ewyaJZ+Q/JZOJeHGv4=;
 b=qVF6QKY3QvPj5VBkkI/eumiXqm5ubBtxcfJu4ugUepI02St4odJ0ESs7hXLfcewGPUNNO8UK+AQJvGRULC+Q2qLSzslFFRSK96sg2XOkeTR5/At8HhLWK8hQ3MFi/8ai1xq59uAEpl1NLSJkAI368d1TJFbYxKnf4rb0ZzECPJjPIuYz9DtPtXR5ArGjsSizW3VByaeQWhEh7evrWEb1ig4vMOTfSYwO+ANeFoqlc576TSSJ/z3URGmXmSL2JMwbxLzmHVovPP5gLS2JNA6EBxr2XFRZG19PfqHPSo/B/FLjVfjntI3YyPoecfiBAGXk3GZH4MEe3hiuZsSFZ1L1Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wXPUGXet6hCBoLNeNFS8Qxp74ewyaJZ+Q/JZOJeHGv4=;
 b=nz5mFpOoTsXr8Yfyo67Vuyy2stYXxz6ZQ1dep7MmvnbbeLnRsxo4ZLACe36vX2tkNkqh5CNl12VTwDHge+T0m4N5ylF86e/o1QzZFeMMRT0J6sZ2Mruv55UyuJH5nR0qyi0PY3bKGA3BCAfG/dNxfHqqdLi2VP8bHyYg5uz8BlU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com (2603:1096:604:235::9)
 by TYRPR01MB15951.jpnprd01.prod.outlook.com (2603:1096:405:2cc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Thu, 2 Jul 2026
 01:45:14 +0000
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834]) by OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834%5]) with mapi id 15.21.0181.008; Thu, 2 Jul 2026
 01:45:14 +0000
Message-ID: <87bjcqxiza.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 05/12] ASoC: simple_card_utils: add simple_util_parse_property()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87ik6yxj0t.wl-kuninori.morimoto.gx@renesas.com>
References: <87ik6yxj0t.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 2 Jul 2026 01:45:14 +0000
X-ClientProxiedBy: TY4P286CA0127.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37f::15) To OSRPR01MB11811.jpnprd01.prod.outlook.com
 (2603:1096:604:235::9)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSRPR01MB11811:EE_|TYRPR01MB15951:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d1fdd09-bd9f-48fb-cfe7-08ded7db8fb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|23010399003|366016|38350700014|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	NIqzqa3A2QuSSCGD5y2uz7JqeDruCq9BcmbGazr8HCd2xqTQ6P0/qOY7LUGS2oQ5yVJr9fKvZHYkGQ5f7oYjLZ0SRZLeEjyM6QR/UESOOGmrJkrPWVgT1yCrY71quiiTDwEye3/rKrYNzC2g3bm8IC98bXNzfDzoY6xavlFc7wvmKGy+ZQXGvVqa0powyMfhhRVSPfg+lP2dXKdtbIIHWzvKnN+1/GfJEMLePehfg557MCjjkuIWwoMY28WfneOauWlIWsfRpLf7OfFRFSMm5028eW3NlZkSdOdm+b7HPMDYWwbI9c5LyOjopoqE6QWdxthuzMOk3KOyWsp56SoNBKNjVdF4DWGOp2hz1NtmqQ9ak9cwZj9fUXtayg5+35y/j9UOxJOdR7Ai7rBMVxBeJHBcbp3myzIJ7OC7rPAIyzZ6n2wrZjugt2oCXjnSATnARe3+I6Fl+QpiNwma6Srn+FimP0mFhN6Ya/jF9GNNrc14XEYKndV2h4JFO6BJDUmr1WkQx0juItkdjGJfCo7Dk4bRSeEelFbc+pLKjHeHMxC4r1U/FLCb0cnhB+6fHzPg+v+zJdzr4Q41LawiC5QIuzQUSI2RvcTkR2EEm2pCSMGXBjnSegAPHM5ebZ620pDQSKDlOLCVXpuBbMdNgdWzzU6HuPoM8tqNu64FCAXCBgmq2DtfFJuaUmicI0RVQ24QhxdGYWs6Eww+GgSMwT3bSG6HIEiSXkd4ARFtTGIKsrc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11811.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(23010399003)(366016)(38350700014)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dFNAGn+GikqwQAIEUj6MWEA2pZKy/EnPOhlzHuyYeX/qyNraCXhyhovMJwLs?=
 =?us-ascii?Q?16JqgtUAh6W7SjR40ngcuuB5rOJz6qbfsZ28WhqJa5RzmhiE3lp1fQBq8B/2?=
 =?us-ascii?Q?wP6CCFyDM+k7/gdg5cbNYP7PQg2VC1wfLZ387ANOrYDrX1mznRiRaFWeesv+?=
 =?us-ascii?Q?XH2MOC92m1tBp/LM4X2eWYBg/Z8Ki8kqGvg7YHsUZJEdKyYtYwTtckJcJQYg?=
 =?us-ascii?Q?v6A/RPqY9Y2/EP9vqJk2274Ti8rORNK2JsKUibURHE4qWo7QbWfBZXZiEi4M?=
 =?us-ascii?Q?eN9vjGW6GA+1+qCoSxbQgLlReBggo9Y2m9Ol8vws7wU2bX21qHHlwYQLKXKA?=
 =?us-ascii?Q?mDXJPpvRk/4Qck6u+cwsukj5lWIvBR1W/ly6tSYPtxrxWLLmT+35FxMBCPHH?=
 =?us-ascii?Q?0xbeGsGDBp9KleH1HKxXNTD4guWv6ZViik0rNGqbbVcQUeQAhXbKTofSMNaV?=
 =?us-ascii?Q?3/t2HWuTv+v27riX3DTjodht5EK10nmIlXIswWcdtLkAGW27da2t3T5ywQI3?=
 =?us-ascii?Q?a4yX8GL7WdWf9+IBL+X4VGAU378A3BrDM4hXQbjf8a48oPo3OOoObSuIS8O+?=
 =?us-ascii?Q?n8PID7ouWFS4l9Ev0S7Tqb63XY6K9/cx3BzsRc5IEcDVOFWyIxgd7NnQS7TH?=
 =?us-ascii?Q?ZARji8DZAO4EiSJbnsV1tB9CeADD8CVoj1HH6HrCXw45W6k01mPgRP6CEopV?=
 =?us-ascii?Q?M/wOMQEYipPnZfHDyX202H2mJVA7KqlBPYeHPvRRZ9f2WDX0bbMwgCqmmBAb?=
 =?us-ascii?Q?5leZwjSVyh+Uol5RJWMrF7H/C+vh/TZgs8vJyQwUUlQ7KZqRAnDgRq9Cf6R/?=
 =?us-ascii?Q?BvEas5EDfgrHLK1+jfHsFjbC1HYJFCZsKpBKQftKZeBr6FVGXCyzNfiSYTCf?=
 =?us-ascii?Q?pHnkamfi++rrxhixhNwQ3wgsszbtE5gJLdQaLJfZGAVN27uYk6wBp0ZHvJ9x?=
 =?us-ascii?Q?L90k1pJOCNpLyClWR31+TtTfWuKs73gMbVjhPBl7QEtPuH1DNcmNYAd5Lkkc?=
 =?us-ascii?Q?We3eOjD0li/G8RFMHO2m1BqF56KQG1NvcHqd/mmQEtMtak4egqJowsDy0wqk?=
 =?us-ascii?Q?Ct+VaLGnwG689IRIXypquMbQCmk+5ovW9NXRqg1JLXHlN/+msrnfQwJUvI44?=
 =?us-ascii?Q?GZ34ihI0udGS9M0EST8C9m9PGOk63g8EZnm2TUQpJvUHC4Ai/+TRJ0TtziuM?=
 =?us-ascii?Q?InLia644saASLv7ahIAt61crMMiOhi9ISfAxwSitWlvlIAyHW/uKpowpj7cG?=
 =?us-ascii?Q?n3FhPZkCrHzCuYfXe+6WsWD6l6mr0aNDD7OoZobi8G91voLy9Z/lsVidW2kY?=
 =?us-ascii?Q?GVYByHDdsbu4LIyjizKYjAucBRKS8dF1vEKJBfgd73+Jia5XhCeMdYprILxj?=
 =?us-ascii?Q?70/e/aUekz4n0CBW67U9/eBbnGQbF6rhdlHr6D29JQrGGfhL3FxkjAD8docA?=
 =?us-ascii?Q?APjbzsMXgtvLfkWI13KFdAg9ZtDjfsi2tvkBYNQl9I/Rksr8y+ey4H9r7OVO?=
 =?us-ascii?Q?173dXC3Sh0Wh9vfD36NNiGALfRGA/OjBPbgj3+vtrkLe6NhKCB+22MJnSr0Y?=
 =?us-ascii?Q?SAOXhO667yvVkE+WOU+ihfbbEM05v0GK17qk7tJaHGXRvP2mmrbtOJ6wvkEC?=
 =?us-ascii?Q?LKnXKP/ifCI99u1fVQwrMfGld0+HOVELELQnrDtfNslwjkiAawetr5mtuTYQ?=
 =?us-ascii?Q?H2zPYADKcgDKd+1pr2ovkqn9Y5rL8X/in1Ry+febllzi0BYuCISBjIUaYWUE?=
 =?us-ascii?Q?8wP6abxbUsX76rJP/cGeMz8RbmbHvDYgMfdC2RF7JKwIs6oF4eXp?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d1fdd09-bd9f-48fb-cfe7-08ded7db8fb9
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11811.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 01:45:14.3540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UODSdQdYbOWOsl6SoJoHavZPzTSDsXaro31w2lMRYfHnQXlX+mq51BzYJp+KXZLu7B1pMHbHZ3XUKhNXAQgnq36FTi8bLIv7q2NDOaLOa8aymkx4za+ILnub8sUdnCIH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15951

We have simple_util_parse_{routing/widgets/pin_switches}().
These are doing almost same things, but has each own implementation.
Les't adds new simple_util_parse_property() and share the code.

To be more easy cleanup later, change the required parameter from
"card" to "priv".

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/simple_card_utils.h     | 27 +++++++---
 sound/soc/generic/audio-graph-card.c  |  4 +-
 sound/soc/generic/audio-graph-card2.c |  4 +-
 sound/soc/generic/simple-card-utils.c | 72 ++++++++-------------------
 sound/soc/generic/simple-card.c       |  6 +--
 5 files changed, 49 insertions(+), 64 deletions(-)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index 915e6ae5f68d7..dfa1b5fb7aa87 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -189,12 +189,27 @@ bool simple_util_is_convert_required(const struct simple_util_data *data);
 
 int simple_util_get_sample_fmt(struct simple_util_data *data);
 
-int simple_util_parse_routing(struct snd_soc_card *card,
-				      char *prefix);
-int simple_util_parse_widgets(struct snd_soc_card *card,
-				      char *prefix);
-int simple_util_parse_pin_switches(struct snd_soc_card *card,
-				   char *prefix);
+int simple_util_parse_property(struct simple_util_priv *priv,
+			       int (*func)(struct snd_soc_card *card, const char *propname),
+			       char *prefix, char *property);
+static inline int simple_util_parse_routing(struct simple_util_priv *priv, char *prefix)
+{
+	return simple_util_parse_property(priv, snd_soc_of_parse_audio_routing,
+					  prefix, "routing");
+}
+
+static inline int simple_util_parse_widgets(struct simple_util_priv *priv, char *prefix)
+{
+	return simple_util_parse_property(priv, snd_soc_of_parse_audio_simple_widgets,
+					  prefix, "widgets");
+}
+
+static inline int simple_util_parse_pin_switches(struct simple_util_priv *priv, char *prefix)
+{
+	return simple_util_parse_property(priv, snd_soc_of_parse_pin_switches,
+					  prefix, "pin-switches");
+}
+
 
 int simple_util_init_jack(struct snd_soc_card *card,
 			       struct simple_util_jack *sjack,
diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 42e1b77fa65e7..273b0c82ebea4 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -579,11 +579,11 @@ int audio_graph_parse_of(struct simple_util_priv *priv, struct device *dev)
 		goto end;
 	}
 
-	ret = simple_util_parse_widgets(card, NULL);
+	ret = simple_util_parse_widgets(priv, NULL);
 	if (ret < 0)
 		goto end;
 
-	ret = simple_util_parse_routing(card, NULL);
+	ret = simple_util_parse_routing(priv, NULL);
 	if (ret < 0)
 		goto end;
 
diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index c5ada1f838812..b4ae9bb860a14 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -1336,11 +1336,11 @@ int audio_graph2_parse_of(struct simple_util_priv *priv, struct device *dev,
 		goto end;
 	}
 
-	ret = simple_util_parse_widgets(card, NULL);
+	ret = simple_util_parse_widgets(priv, NULL);
 	if (ret < 0)
 		goto end;
 
-	ret = simple_util_parse_routing(card, NULL);
+	ret = simple_util_parse_routing(priv, NULL);
 	if (ret < 0)
 		goto end;
 
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index e5cb602fd2487..522dd1e3c96a2 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -216,6 +216,27 @@ int simple_util_set_dailink_name(struct simple_util_priv *priv,
 }
 EXPORT_SYMBOL_GPL(simple_util_set_dailink_name);
 
+int simple_util_parse_property(struct simple_util_priv *priv,
+			       int (*func)(struct snd_soc_card *card, const char *propname),
+			       char *prefix, char *property)
+{
+	struct snd_soc_card *card = simple_priv_to_card(priv);
+	struct device_node *node = card->dev->of_node;
+	char prop[128];
+
+	if (!prefix)
+		prefix = "";
+
+	snprintf(prop, sizeof(prop), "%s%s", prefix, property);
+
+	/* no property is not error */
+	if (!of_property_present(node, prop))
+		return 0;
+
+	return func(card, prop);
+}
+EXPORT_SYMBOL_GPL(simple_util_parse_property);
+
 int simple_util_parse_card_name(struct simple_util_priv *priv,
 				char *prefix)
 {
@@ -747,57 +768,6 @@ void simple_util_clean_reference(struct snd_soc_card *card)
 }
 EXPORT_SYMBOL_GPL(simple_util_clean_reference);
 
-int simple_util_parse_routing(struct snd_soc_card *card,
-			      char *prefix)
-{
-	struct device_node *node = card->dev->of_node;
-	char prop[128];
-
-	if (!prefix)
-		prefix = "";
-
-	snprintf(prop, sizeof(prop), "%s%s", prefix, "routing");
-
-	if (!of_property_present(node, prop))
-		return 0;
-
-	return snd_soc_of_parse_audio_routing(card, prop);
-}
-EXPORT_SYMBOL_GPL(simple_util_parse_routing);
-
-int simple_util_parse_widgets(struct snd_soc_card *card,
-			      char *prefix)
-{
-	struct device_node *node = card->dev->of_node;
-	char prop[128];
-
-	if (!prefix)
-		prefix = "";
-
-	snprintf(prop, sizeof(prop), "%s%s", prefix, "widgets");
-
-	if (of_property_present(node, prop))
-		return snd_soc_of_parse_audio_simple_widgets(card, prop);
-
-	/* no widgets is not error */
-	return 0;
-}
-EXPORT_SYMBOL_GPL(simple_util_parse_widgets);
-
-int simple_util_parse_pin_switches(struct snd_soc_card *card,
-				   char *prefix)
-{
-	char prop[128];
-
-	if (!prefix)
-		prefix = "";
-
-	snprintf(prop, sizeof(prop), "%s%s", prefix, "pin-switches");
-
-	return snd_soc_of_parse_pin_switches(card, prop);
-}
-EXPORT_SYMBOL_GPL(simple_util_parse_pin_switches);
-
 int simple_util_init_jack(struct snd_soc_card *card,
 			  struct simple_util_jack *sjack,
 			  int is_hp, char *prefix,
diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 20e6edd1d7d39..6e432733649fe 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -692,15 +692,15 @@ static int simple_parse_of(struct simple_util_priv *priv)
 	if (ret < 0)
 		goto end;
 
-	ret = simple_util_parse_widgets(card, PREFIX);
+	ret = simple_util_parse_widgets(priv, PREFIX);
 	if (ret < 0)
 		goto end;
 
-	ret = simple_util_parse_routing(card, PREFIX);
+	ret = simple_util_parse_routing(priv, PREFIX);
 	if (ret < 0)
 		goto end;
 
-	ret = simple_util_parse_pin_switches(card, PREFIX);
+	ret = simple_util_parse_pin_switches(priv, PREFIX);
 	if (ret < 0)
 		goto end;
 
-- 
2.53.0

