Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011023.outbound.protection.outlook.com [52.101.125.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF593D7D86
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 06:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782455303; cv=fail; b=i85b8ThkszDD/zFacVOp9S+W/BmKJP06mnUr1WbV/uRDm7vLM8j80Hmu02GS+ZG23MomHd8ym6u/uHq/VGelWy24CsPMmTMaXld311Z5VxjG8OZD1o0bOF9rxpiu5wOeTGmP1tM8qbfncyfz68tq4EucfqG+58Mm9j+vuAugEmM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782455303; c=relaxed/simple;
	bh=q79heHvToEgpx9qehpkaI4cUDtPN8kECgVjsaTaj4wM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=IkSCV4uJR9ou8GwQ+6yI+JC+cRySLQtsj6hbJ0FcaEMtytfRRUAK8IUC4Nydf845bphpe3fghN9q/p4FXc4ZRG8euff5jnTsMS06PkT0zlV0Nu0kQSs8DJVqajCJSzCHMRo5TnEdbIKD1wFpxfFh2XERb2P8c98qZ6GzCBJHRGo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=AtGAiWG/; arc=fail smtp.client-ip=52.101.125.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="AtGAiWG/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WHOOYOL5J+2sQCW6Lj6W12dkxt6oVuzM49omhG7XCvb/TsforwmY3pSMw3thRae427Tz4HUGXLZjo3TGvK0Z8j3jEOLYs3gLga/Lsh3gDazcFnx4KGdqE+rkx28b49uITRxE41mBBD4zJaFk7EkxNnhAGWV7H66tGBlZCCdY8V8QL32VglD2mJyHPSoKmQk+LIPBU7bViznZUSXX02a3XKm8itoDQN0DcHTvjGwtZCfHY/hJyOUsIWysy1dhKiVKHwfgk5W2ZsejcEkdfdBZwPvfxOUJGFdEpSpX8WVf5qy80/I8oeKJt5dh0GncOKy2ROIW1Zov5ZCiW7gzO7DKhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4kEr3+6jtvoKV08zErYsFLkx9zkzjZqbQcobo8bJFOs=;
 b=KiufUxtrA63FOjdl/Jj3BuFdBQVuQxLZ3FTGgE8eyZDxcL41MHX6UcQ/gV6Twyeo0Y2U1HUUpbQwvnPH7HDFiAPJANQvqEI40GdzJBljQ8dp3zXF8gxn1u93gNJdQu7BLmah3/KPbvHqmHQ/a+Xn1YYcbWpDiEaU4wXNXXf6raxTcCnNTGLxOmFbgEQRvIY2gQA68J/LLcqyyQdWsBj+EVuma5Zhhy4G1GDH7AiK/Y1ZXJE4QkHlS/mpExHtK7k7nqD9q4WfoGtHL+Zy+dEJTIq7mG0T9asO78FwkqyH9cLOE9C3U6OT5B5elU1EHEKmA4Y1ldAoXsRGACpTRgPbgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4kEr3+6jtvoKV08zErYsFLkx9zkzjZqbQcobo8bJFOs=;
 b=AtGAiWG/xnUPSTLMoQp0SvwAkNBp+mrBuFdfzkl1uALPwPiyTVi2vBRHLZ97NaYh6DOhf71bEI8MEovSXVmmYX/iPcO/FUad86V9k3gB2B9qDfMCoRe2FC1EPAdXG/Q9OvLLDpBofr9BnGGgAwDceNmXu6B0vYMYvW98itKnxno=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS9PR01MB15751.jpnprd01.prod.outlook.com (2603:1096:604:3bd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Fri, 26 Jun
 2026 06:28:19 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0159.015; Fri, 26 Jun 2026
 06:28:18 +0000
Message-ID: <87zf0hdddp.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 05/12] ASoC: simple_card_utils: add simple_util_parse_property()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <877bnlerz1.wl-kuninori.morimoto.gx@renesas.com>
References: <877bnlerz1.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 26 Jun 2026 06:28:18 +0000
X-ClientProxiedBy: TY4P286CA0121.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37c::10) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS9PR01MB15751:EE_
X-MS-Office365-Filtering-Correlation-Id: 1780e5a5-5072-4427-015e-08ded34c1cd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|38350700014|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	edzFZVprt7gpOoigsvf6kJluQhRiG4HCmgjklTuRE0xtHeJmLxaFu8Xf+vZLQJnkgXrpx959q+21vcAActezglGgsM9tpnShJxuaCfBHhEJyEBE4Y+qimXhwuPUsnWiKbIIoS1h8GrhSEBy9ORYglNDNnW4TyMHpMTQLupjsq3XDetBLzfzsZt+9D//CTfG4SEjraNeY+B2qR1YsB/IAmnWpn93kjoHRFc6bNY/15pz7qJZHWx0oNU0JX2rmaLnTasmWX/XygHH5TNj2jU1TnxiF0DEROWT8qq3dq3eUuf8PiyL+CtC4C3/FSxuRlwyfG0jYptlYAlm42nJW7aKkLHt1m+hjAC1IWthuTWotNssvrl/hdRETQc7uxQVmELG9nzgQHRJ18/274y50kiMsXrkH26lNYwS1u4Sd2TmV5jrpEfIP+RDJG/C1yddIVjz5z+D3ToMKGwgaTYxfBkkPpL6qoEvvbR1hdXwl1h3E88C+XXxJDss3Z6px0Zfeu8SS00KM2rQUuWZjWE8tPTA7VvWTjblJOuoB3CHkusKq7v6d9hiNFPCsw8FmDXEcxo4yPqwpMNmWe/qB2lMIwK/R8lruyTsqppgvpvqzzH1mzuCW/n/LFDX0/wuAR1/kaWWmEl9/hHAy2+vu5mehuUsVao56ZaZ8SCEYgABiJuVzkLTgXyzBYCtxxyHwucDrzaCOZSj7ywfbO8VJoC6ZJr6ybzaiNZBUdCSZ2+ttjzKoxH0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(38350700014)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Qlvea8pIA20Jdp9dgJ1x5TV2tqrnJwJORyMlv2+fUneNB1Y5X0PKG8NeG5cY?=
 =?us-ascii?Q?+eB8tzIgRCETQtrCSDzkcUAT5/jCTS2eTdn+W63owpGKxmQ3q29ih/tsMvga?=
 =?us-ascii?Q?k/eNnbpfRiQOlqdHLHLBX6F9/9vYmNsypBzddr9BJrOx1acUaOj+CuvThyFK?=
 =?us-ascii?Q?2uU4gl9qmfzCkcnXacjQeRlmlbzXaxLZk79WKR0RM4VLbkbxTrqhqCSNhD2m?=
 =?us-ascii?Q?0+y6tYJoNXnxOzkNVFYLya9FijPkXrRKvCDCzHqlWDZkt5oKOjFpX0CCfWPl?=
 =?us-ascii?Q?Qdn7Xt+xMltYN5KsMBklGwb6jsiTPChnEUYENYlbjvCYaM9bTbRrkL58ZEFa?=
 =?us-ascii?Q?5MXm1sm/5QZYXGK37RxgzG+yk2oAss/hQpCY90fbnad/Ah3UH7FeX0mJ3zOy?=
 =?us-ascii?Q?CJVNFccU+s+DgDZQjI3GlvRpEq2L9EFd0lO4wuXSiGakTZSjFbRTtLYYB3W4?=
 =?us-ascii?Q?e8qT29/Gxvdfyr8KXCkTv0Q5gwrIDNdDyABjsxg1pREDNVLNBXoqE8pYAxv8?=
 =?us-ascii?Q?xk6B+lSzVfgGNFYD05E5y+yDCKqT55p83mBIcbbhh7IWg1eTqXANZx7hCwTx?=
 =?us-ascii?Q?VdxYms/OF8Og3DBdFiBLmVmc2Z6ejweZ6C9PI8DEXYmPPtFmjpIGKo9zPlqs?=
 =?us-ascii?Q?eeFKOQNL1MXD2rWKoI9OR7SdPk9Jqrr6Y9dE6XZui3SlYY8XT+UeXlVcPp/u?=
 =?us-ascii?Q?6Z2q0btHfXEikV5a7pj5J5fX3KwxFT4ukmeEsMrgC7+Ju+kWI1n83VlqhWHd?=
 =?us-ascii?Q?/w6I8oNiUFTOCP4nc/t1nmcD30omxWl1jzPayGtGl2ybfI+ifu+qHTYvmElc?=
 =?us-ascii?Q?OTb4jOuiUkE6Dh26WH/PXt95RXbhLQNgBw+tbnTAqmsrgj+PvsZ0vqQymFQB?=
 =?us-ascii?Q?93MIzgy5wSbLmg7T1mIZ5D7xd0p20arnK/YbBw+pmbXaLg5iCwB1x7LXqUYF?=
 =?us-ascii?Q?mNrZx9bt671iL+ZmytPIkDltaJwZgv9aL6gjYWOCdzpt6fbTF0BoSzklSs7I?=
 =?us-ascii?Q?CN7jeFRagi2exQC3mVPaA7kFEKM034h00TFQ9rlTbwseyfT9TCfodAYZyhVj?=
 =?us-ascii?Q?gdZ+a6P8SG5lOTeO23EEV3EjtU0Am/AHS94uSUUPgScHyauCRzy+54XJMSFr?=
 =?us-ascii?Q?YvseT7hRhcM6029iF0Wb+D6a+f20XhgJ4JIC8m5EsGQ6UClRSz9hQLgwMMJ9?=
 =?us-ascii?Q?vVF9S87hUKyAin+LEPT6AvEN95gJrkZga05c6bu4zX+JMXQqIy1NOWmkoB8l?=
 =?us-ascii?Q?h9korN9RZ+I0ecrHDS+GCr0hzUh0Tv0pKczkMRrpcHvuPqgsj0VRc5Cri6KM?=
 =?us-ascii?Q?CyKEWHjrsKLnQnRjdZNtvzNamPGCmRD6kLZBgvxvL7S1FTufqPMV5INvQ920?=
 =?us-ascii?Q?xXNPKU1wsupLblWkbLucBg/cHZLLAbd/HXnWVqgC9jBI/poewN7c7jz8gOlf?=
 =?us-ascii?Q?0rJUO2rKLmK4SmI0YX+4PdujLf+1k3ieyQq8tp3QO8/5dOl1l7pLBd+D4ODy?=
 =?us-ascii?Q?UdrHOaaGbAY0cHgcPZKp24Dg9jIEvHhXUe0OpuTmIQeW5QwYTpNzld8aN7pO?=
 =?us-ascii?Q?mzIKiu458QnxtDD3RIkWdL1G2gvDkK9JXWznCTDp0JJuOLTuPfMijzMGOu/v?=
 =?us-ascii?Q?lpW2OqJxqJc4frb9NkH942o1IHVcLYcgcI1DwP3TkZXaNT38B6W7HD8VRFw5?=
 =?us-ascii?Q?6aMJZXMil1BigfZ0WJ+1HwL0KH5MD7pU+AeTIGD7PcNk7bzB3j/DsCkWigAt?=
 =?us-ascii?Q?q6rLTIxHqi/72BxQOPfcuLzBSuSO3+uU7tgt930S660CJRpurr2X?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1780e5a5-5072-4427-015e-08ded34c1cd0
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 06:28:18.8711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7DvVnD8Qnp8+TeQaULNM67m0WS27iefeWJ4ENVV0Cv10LTVFhvg26EagY3F8cth0jyUIM28p8pllLAYpfejtFwLgRuSaw8lgVxuhz/FoX5VWQj2fN7wftCxg08sIfDOZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15751

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
index 810d404c1f696..7daff3b54e052 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -1348,11 +1348,11 @@ int audio_graph2_parse_of(struct simple_util_priv *priv, struct device *dev,
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

