Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011061.outbound.protection.outlook.com [52.101.125.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3C21F3BAC
	for <linux-sound@vger.kernel.org>; Thu,  2 Jul 2026 01:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782956774; cv=fail; b=HC9V5Ew0G45VGqxo6F1dKG40dToJRaNsmCoMYN9urUEDywKkdv0pdPDnzF6miGkg7otbOK1+hhy0bXchzCnzkKMjteRamRdl2np9SzdSdzVYqQVCj+0tJOWdxuV5MqVsinJeIafwPoGeJkIMk6YKUVe+/kdHWc+H7UBN0hNycJM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782956774; c=relaxed/simple;
	bh=6wyXmDvhXse6RPogUw4utRNLb0s7dXEpSCO56Ak9vN4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=kpjlFwC8Y3yyYF5/PnW+0TyDvNrjegqxVdIYsd/YejKMvLR/wDud8l6FuTe0DPogBHtaJq6HEfUf7d8SgF2koUpsMoDHk/kaTdcaCeDP82DdqpClSRhtIBF4zqvY1sDf8nz3HBQninmxSQNynweXuqB/XoA9HU/pwJexV6/dD5Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=oxIOaOLX; arc=fail smtp.client-ip=52.101.125.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="oxIOaOLX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IvqWxqCPpn1AU9aP29nexJ63d9rZ1wml/wAdF8d8lT2vFLyTcu722DmONJti80Nyjje3earlqTw/8vXQIaHMQtSWVjl/NGtyySVH2SYBTKtUbtu9bYulaPZoEdy3Y0+FmGKzKRmpyDMrSQVYY/F/D61wTT8sFPMYe1nYT9qE2TB1mucF2eE1RdmzIclEqasjfEPy6UOkCu3YItFqqMUgrZxNUKO8ZVMxNmHRAbtaMFPfWc/vTIbF7QSYAW8L0w6GW+jLoP0sO4Wx4/g8N62CES7RXxmO9LbAZ/SsmgZpJXMDbINrd/Ty6MvaKCB3tcTZPN9rhgEdBzrQpcNBIZLAAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MAhLH9SSCHD38DmBX+3a//tVSJpZfBQyPWTOpGUx7VM=;
 b=QEPQ9ux0LjXVW2jt3LZ92FLGreK0a1fg2Hy5oO4yg3/tYDr6XRH/HyFNdpAmUZNfIgg4ICbBSvBzNv1/9fbs5kW3sOaldgQJnb+vxX3ylXOG486VAQgEFH5XQs9eJM9elxyQVliKpbO6zu6mkGAxGGQCugMq2AgrPrmTMJRZrdUHowaMaQLcFWcfvnTsctgm4Ii2ct7v5gp3+K7rRY3X5ihysNRiTRa4TuJBwm6AA2LWIN2ZzjAScIxjzU2yc6TP4VCPrXG0U+elXfviH+7HptanwWI2WULYdENHvyNO26sNiL090pUhOsCqkpW2NYMZmVnZRVohuNqYiGzi6qAeUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MAhLH9SSCHD38DmBX+3a//tVSJpZfBQyPWTOpGUx7VM=;
 b=oxIOaOLXPCGxAzL4RYF7XJCxxT4giLiYnzcKa90xUsrwwE8bQdEeiHFSMe7GleRP01nuKvy1UiJXGxdg0UgVY58tJXBLIaX4Qcp6w79E3JDAYDkRZ5AemAQ1zDmufVN4o/ejRBB9ISn5k3dExIwTB3E2GrRY2+RAnKOmV67+BN4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com (2603:1096:604:235::9)
 by TYYPR01MB16053.jpnprd01.prod.outlook.com (2603:1096:405:2e0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Thu, 2 Jul
 2026 01:46:11 +0000
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834]) by OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834%5]) with mapi id 15.21.0181.008; Thu, 2 Jul 2026
 01:46:11 +0000
Message-ID: <871pdmxixq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 12/12] ASoC: simple-card-utils: tidyup simple_util_clean_reference()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87ik6yxj0t.wl-kuninori.morimoto.gx@renesas.com>
References: <87ik6yxj0t.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 2 Jul 2026 01:46:09 +0000
X-ClientProxiedBy: TY4PR01CA0056.jpnprd01.prod.outlook.com
 (2603:1096:405:372::15) To OSRPR01MB11811.jpnprd01.prod.outlook.com
 (2603:1096:604:235::9)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSRPR01MB11811:EE_|TYYPR01MB16053:EE_
X-MS-Office365-Filtering-Correlation-Id: 02bba2d1-8f89-4927-dccd-08ded7dbb0f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|52116014|376014|56012099006|11063799006|38350700014|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	7yszdyqFbXNlI2Vrbvj8jE61VN7u/GpHSTmTH/f/X0WxeehwAPbP3B4hEv+097S1Oa/bDN/ooX2qX6xfIFePCFWQxI3HW/NuZXasCZA7fiqtqs28hUUguzwD21LLSOsUgJwe7legIymlWofM5cq4kAIgZpLs8cKxeNVihVlv4Z/fIA4YOKjd/y0mnQXeVLEWYgBtq2svfTdhzsvjpOPl5VR4CfuVxNheqRnkrQMi8hrX7WlL6XPmp7StI9BN5VRb6EFnmEnEWEs5Wo1gtAI3ZLIjxvTcmKV9Z5KsmjT0nfS3KisjpAGnAgli6D+sjAj+IDNiQm5k+32Helqen7P0LZmHO6FZ3WyuW9oLG6aGfHOgZRMOBY5AroOLlfLUWdaTOfEX3wuaC2BgSyynksWRQvkLz6YIHynJ8WTidYUhaHHroSiNqqzAq61sl9o7CPp8C/q4LPdKwScpN1Y7v9Uw+F+Up3b4Uopvh4Q2bIp1bcw0Yf3fvpHr88Eo3Lez1MH0Jbl3XSAQVcJpJu4ZUSH59+54fnKB0IphBZ9ILYUpqPK6hqsHx7IIXprmCoQjo6gMXe4/1EPeUa64Bq7bAPSDVkxOksl1lJhpAQuRhKAPmfl3JPNmg+yrtxaoFlgQpuWsNPHGoXskrBEcc74DFf4ypYAES8FeFNOHZVKX6T5LjDPMzBi2kyA+cEB+TXsH6FaQ6VzjDo9ZoXjhzTOrNnxWD1C+hhQ4Jqm4NT2iS0qCT4U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11811.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(52116014)(376014)(56012099006)(11063799006)(38350700014)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?h2WK+whRDDQeQwTClJ82qIhB1c61b/EihrU8FhxgMDw4QHdAioTuGrwPiZHi?=
 =?us-ascii?Q?uWyyV0L2uFkrAZL3mOAxu4LdcCGnfstkXQ0MDM/PvJyV3EHX1XkXrDC4iJil?=
 =?us-ascii?Q?cQpCGO6mSCvx7ycMRvoyYgrwNfhSh+6evRyMRjAraoLeBSBtCmd5/RB7Wvz3?=
 =?us-ascii?Q?OKdy/DqR1BZ8W9P3wsE5NKEZKTHO3nETa05NosZdY0pwZMYFtOi4sqKFBf2z?=
 =?us-ascii?Q?pRv8UHeVX25JHPg2l8i/g7FDdwOmDd6U7lkSnX0Tclrhr/2pKR3sgPSQOYzJ?=
 =?us-ascii?Q?+0HHNKpPGwXt+lLxVQ41kRxugpCcSAQMmscSBNUOSK1LHQWQerfgkskQ2Cno?=
 =?us-ascii?Q?lhutaHPFEELKGg51HPO2xsKFgngSMqBsxuKppZ4+mKY3rAcyVcu+JbWrjYok?=
 =?us-ascii?Q?R3CXfmyt/ikw2q+ZC0TGGxgi/vuT0HVychLdpTgOipVghA7aazuMp0m/rJ08?=
 =?us-ascii?Q?+/do11YmrPSGaqSJiPins3d0UMQ5ptT4OZm8UyBq7da/i4sOvI9b/i5SGvhy?=
 =?us-ascii?Q?3/+ZpW5c1b6CMa2JVXnG0cZVmO2vgKixCsHe41INqcg1eGZ57Kg+/0m3pJt6?=
 =?us-ascii?Q?UAGevam69NDH7lc0dE2rW3MMqo6Fmgs7ODHTPK8rhPcy/h9IY77Fm1uZIA4j?=
 =?us-ascii?Q?+RGj1t+os30wSnlUEXV0JFJD9bcXvhiDMu+MeknCwVXvxb8aQUKfhk0Uj3WE?=
 =?us-ascii?Q?XEcfG4w/IC4cqonNXoz4rON9fas1QryRIqJAvIf1EBou4KEMHbmdivVx3+LS?=
 =?us-ascii?Q?v3FbOyPn9OCK97mf+JPZ9D+A4fPQd1lX4AUF6al645sWV32uUdmio5ZJlMP1?=
 =?us-ascii?Q?JrHj3RTWJ7IIgiCc6M3YydNmieryotR7DJzvG5L2v9Ef1n/2WQyshjWGeBw3?=
 =?us-ascii?Q?rhHdq/VOp+HZqzaZDPjcgoIZZSPUw+fDh2ioD/+AVfG8cN8nJ2LWPL9Tp+LT?=
 =?us-ascii?Q?wHAhbnSYL3thMNtoSysp0Ci724hX0aunralfY7wFaGWS+EOHmRbD/9ZbEKFm?=
 =?us-ascii?Q?WEJO4y1TOk5k1pPBtBPWl1l9ZDmqjO/tn3y30gRpd5nSAYVFNUBR6Vat1iy2?=
 =?us-ascii?Q?tUyQi4VVPQEUFpSmLtlEADe30mIiHSZPfuGPJMgStQBLEzm6BoEHQP95yWvw?=
 =?us-ascii?Q?vXUsIfp41hugJ7oJS5GlIyqIcUxsHHItIA+ZN0gt2YyOpwzkJJ3PiD0F1U1z?=
 =?us-ascii?Q?m1rBt/v+KdGfDPZS/5jgfZwk0QMIFE4e53w6dmB0D9hTOUOtadeGExcFp4kR?=
 =?us-ascii?Q?qHRn1hLVgbiYelbygikdnfnwM4utziTW83se5ZIh2t5iawzyzSgXTz6bkKd9?=
 =?us-ascii?Q?j2VA0EqNsnPGN+qCskmS9RACZBDqGkTdwx87bwzzbr/qsd1vBFbYDYnAn59z?=
 =?us-ascii?Q?YUR/a0hmpVEhf/IF9G+WMxXzir4FfQPas6yK5jCaHFY/aPyjzZaokfYyzk+J?=
 =?us-ascii?Q?4yu1QV1z4SIP2qY4SuE92+7UCpQGgp95AEQiJJeU8awKDJnVCPGOsRS2vYrq?=
 =?us-ascii?Q?keYuJKFIaWuwLvAZ3kK3nTB/8mIUCWHommbiz0/Z9HH4M+ec3lfAGntDzomQ?=
 =?us-ascii?Q?dvJtRu8xzUNvJfjIunk+KWnUx3wT66MFsNuswMLBlWPhzqm3hTxV4MGpaGsY?=
 =?us-ascii?Q?UgbgCk7r107AFl76ggqMwXnpklFibRRjBxLn/oPkZlJ4VvZOn7F1ALcYYeIm?=
 =?us-ascii?Q?oKTFIczp5zNv1zBXHKjssPjZIGDQFZBTaOv28vQHt/s7KNUr+E1z/XOFJvPk?=
 =?us-ascii?Q?m+g3avh3SRxX+o+5KXTMk4waCUl+a6tlr2za1gBugDlmOmo6CeAz?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02bba2d1-8f89-4927-dccd-08ded7dbb0f3
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11811.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 01:46:10.9474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: okEbTiCrKc02o3glNtoxj5qRHTxIbE1WxVlje2pUbdARIhqqc80euFBD9RPekDK8nitCVV72PhKwTDB+HNU6h5z2S2Z402InZ4AbsPzET+ayhFH3ObvmWPVyTVfZGMLq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB16053

Current code makes old style / new style conversion difficult.
To make future conversions easier to understand, this patch clean up the
code a little. but no functional change.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/simple_card_utils.h     | 2 +-
 sound/soc/generic/audio-graph-card.c  | 2 +-
 sound/soc/generic/audio-graph-card2.c | 2 +-
 sound/soc/generic/simple-card-utils.c | 6 ++++--
 sound/soc/generic/simple-card.c       | 2 +-
 5 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index 5e2e91578bf54..bd8c3a0335773 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -181,7 +181,7 @@ void simple_util_canonicalize_platform(struct snd_soc_dai_link_component *platfo
 void simple_util_canonicalize_cpu(struct snd_soc_dai_link_component *cpus,
 				  int is_single_links);
 
-void simple_util_clean_reference(struct snd_soc_card *card);
+void simple_util_clean_reference(struct simple_util_priv *priv);
 
 void simple_util_parse_convert(struct device_node *np, char *prefix,
 			       struct simple_util_data *data);
diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index f5e36c777ac63..73ea562ce52b3 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -605,7 +605,7 @@ int audio_graph_parse_of(struct simple_util_priv *priv, struct device *dev)
 	ret = devm_snd_soc_register_card(dev, card);
 err:
 	if (ret < 0) {
-		simple_util_clean_reference(card);
+		simple_util_clean_reference(priv);
 		return dev_err_probe(dev, ret, "parse error\n");
 	}
 end:
diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 9ef7373a6ca63..e3e92025b317a 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -1370,7 +1370,7 @@ int audio_graph2_parse_of(struct simple_util_priv *priv, struct device *dev,
 	ret = devm_snd_soc_register_card(dev, card);
 err:
 	if (ret < 0) {
-		simple_util_clean_reference(card);
+		simple_util_clean_reference(priv);
 		return dev_err_probe(dev, ret, "parse error\n");
 	}
 end:
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 41e2252064d78..30866a8495fbd 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -748,11 +748,12 @@ void simple_util_canonicalize_cpu(struct snd_soc_dai_link_component *cpus,
 }
 EXPORT_SYMBOL_GPL(simple_util_canonicalize_cpu);
 
-void simple_util_clean_reference(struct snd_soc_card *card)
+void simple_util_clean_reference(struct simple_util_priv *priv)
 {
 	struct snd_soc_dai_link *dai_link;
 	struct snd_soc_dai_link_component *cpu;
 	struct snd_soc_dai_link_component *codec;
+	struct snd_soc_card *card = simple_priv_to_card(priv);
 	int i, j;
 
 	for_each_card_prelinks(card, i, dai_link) {
@@ -992,8 +993,9 @@ EXPORT_SYMBOL_GPL(simple_util_init_priv);
 void simple_util_remove(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
+	struct simple_util_priv *priv = snd_soc_card_get_drvdata(card);
 
-	simple_util_clean_reference(card);
+	simple_util_clean_reference(priv);
 }
 EXPORT_SYMBOL_GPL(simple_util_remove);
 
diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 49289cd655ea2..abfbc9fd7c6d4 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -731,7 +731,7 @@ static int simple_parse_of(struct simple_util_priv *priv)
 	ret = devm_snd_soc_register_card(dev, card);
 err:
 	if (ret < 0) {
-		simple_util_clean_reference(card);
+		simple_util_clean_reference(priv);
 		return dev_err_probe(dev, ret, "parse error\n");
 	}
 end:
-- 
2.53.0

