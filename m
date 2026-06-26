Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010056.outbound.protection.outlook.com [52.101.229.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95193D7D9B
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 06:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782455354; cv=fail; b=rAH5BKpBrenqM9hXpWvIrPEkIqkVv5wihInnXlP/N69JvhQ7QLmCZyXZQR0uqp1zL5qTnhL7AogEVJWoqSzMcK2qofZeVZp+KkANhjx1+yvxJiKItDphOAZsLtyRwlMRb+dFCiKfXPgi36wOW4hw1uwPx7x3OACMs9tjKa0ype8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782455354; c=relaxed/simple;
	bh=6kXW0tESDhtMdaleGiSeVm0fvS79t8toBGt26YY4D/A=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=afee1DoNV85yXR8eHeN5br89Se98NK9JItsBDMCi43y24tf3j7oqI5eYn3Jm867diy1APOrG3zGbBsZRio8ZNDZgvFsiuIX4eMi+9dlU0NxdtPIAPnUeCCzgheoH2sImUVuIsZRfGAYkdIrzE8RACW6EMK299dQbNNXF3nvtMRk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=F7X6DLYW; arc=fail smtp.client-ip=52.101.229.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="F7X6DLYW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gKeiIyV8Y5zIesyVXFpz/5oZxQY6KzoAnTgsBFEMOpNoufhgtSIplEMwrjqI88X0d0jInVuFxtOGineUPbFrZNZ9ZX0OQ8zEl4yA97MfpQ+FIzv3wuCsjBZJYqomCT/ereGT+tyX5LQvHuLC6z0YDGnmotFh83ktK8YpwS/JASan4gJ5fJTSX+OCKgI+IVlVQK5g+c1q0I5TqmvXzQOBuLsPjg2Y6wmLV6EvDSLSDyaKg+Dsvmbyssk7gz7S0JQ/ImmPjjpodSz4GcO1Sb9viuiU4Ba85S3kjZwli+C8WLQoNoKp0O9WO/AfjJ4i03tNpb04oOcvNOnwXzU1oprPeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yigzCzn1ysIydty28ocix/GSiy7A+U9mUfjxj29Yxkw=;
 b=C0JX6kYHB639IUkq4L66A/7jWLFRniEbLM1WnmCWHvGzyRPG5GPpRloHtqH1KSR7UwqyRV5wHnmR+yRCSnDV3EiLl9aIgA31TlT4vdgfj9WjQx8ghIClFEMHVpmTWCxKo8mb9w1Tykqx5Zmg9hn/Pybpo8f9Os/g1nXE/a7M59UV4QDdXXdhb/cCkmiAy/1MWa7tNuVxAXl9bDs65sOeUzvOpIa5fZFOXYY6H2Ztw3PdPh5fmv411M9zFUv7EkdSTOPyWOmAEi3aiMg64jVeAtFjPhywuVUe/2EdP/Uz9g0waPdHZ2jAApf4pOOSHfqr2UaIUG38NcM882JAr8wyDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yigzCzn1ysIydty28ocix/GSiy7A+U9mUfjxj29Yxkw=;
 b=F7X6DLYWX0LwgQVcAgl9qSqfAeizrkubgKCVaARJlf4GYBj2Ar5jlVjnsWhaT6aIiP1Am+ooMxMQIGlrVMjZtLEIfk4KNnxxUm63oDBouMIFnn6TBw6lvLtjmgTJixQVS3Cf8FLKhTW5zokO6vhj9i9kcQ4mqqOSE7v1tnktnZg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS9PR01MB15751.jpnprd01.prod.outlook.com (2603:1096:604:3bd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Fri, 26 Jun
 2026 06:29:10 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0159.015; Fri, 26 Jun 2026
 06:29:10 +0000
Message-ID: <87pl1dddcl.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 12/12] ASoC: simple-card-utils: tidyup simple_util_clean_reference()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <877bnlerz1.wl-kuninori.morimoto.gx@renesas.com>
References: <877bnlerz1.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 26 Jun 2026 06:29:07 +0000
X-ClientProxiedBy: DU2PR04CA0012.eurprd04.prod.outlook.com
 (2603:10a6:10:3b::17) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS9PR01MB15751:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ab46d42-e8ef-4015-5e62-08ded34c3b81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|38350700014|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	vJHZowuCYrrxcR1z0svTOB4nopNLqkwmrn10GZeerAJW8QqxtUU5gNlyI95htZ63zeY9jm80u2DkUVnX50h3bx1am3OjBDBT/29aPELnSXPyuJoe7NYLTdxu1aY2T95EQeZeLXM/qCEf/xz0QV0jM3MCzUyOu/GQcWzW+3gSBMmVDbigMkReLSqbzeEfGY+E8ha5cAOWZK5JoK67RYD5Ed7TabhIJZ/WTnlolcKgt4xWk4YPQp21qDQHsIq4lEysb2yO2PuO3FYy6A6JDlzrOo8kACli+Yl9gKRNq6bU0VMlv05fYcWi1DJsgYnGCcZVja7xJCLD+OzDftoeOcDv/vutfcUQmUBsGAtvHYNlVLnIgwhtfrmEOrhByHFz/p7zm1VjhWyknlJnYyqIjUoTod4WOjQFQ6hTMQFGq+8IIPD6yQuz7/JmH04lGNOIwof+M70A7cdRYiYhm+GdDWp4vJ/8gT+MZ+4J+8U94IHrm6PZRdS2KUM8C2XIVTw1SuydnTaVQ4ADaD5Ui55IEaCqTuUXYVWcDXzbx8AQuPw5yPb0ZRLW2od9dlgiPwXQnCryQFw94VaHf42Tkf15Q/BciX35COViL+D5eqk5UZ34dFdZUAkRP86Drca+HWQeVg2vz5BfQZGUnueyarGLUq4Y+r5dtaUVH7ByPzgSFL2L3XT0pfWbIdQS2x59KdmIrX5njEsnmo15lGGwro8Nn9Au0CuxGhdg+E7E2m+1TUDIhEY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(38350700014)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ew+c9kc2BPclVSzI6E8H2yEKk4ZbQadEjkSi3MuGxRt3/jJh5YJ2m7L83zph?=
 =?us-ascii?Q?iWH1z1TIeM+GLML6j5lK/gOQY8mM8CZ+fXraWcESt8+CSnwQAn3/qfxDPgs2?=
 =?us-ascii?Q?deyZ555kiHEGLksFaUnQLK0kG656LhnSUGLDzsiW8Uxq4MbjPyIqqkC2IxZ5?=
 =?us-ascii?Q?4xmM4tjaO8FR7mNjqSze6xgNXiPop/nT8Ps3Iw4pFubiA/Ar7+3Yrr8amOFG?=
 =?us-ascii?Q?x85V+WEImopwjyx4L+i5b2nL1nVwjvOesx20WqM51GJhfT/wQ0gqJUe0/4w3?=
 =?us-ascii?Q?ECUuGkP9ji4HHvrOfQZcQDciawwPnkSsit5KL8ceeSsFYRzRUQ9SK5BYCRlF?=
 =?us-ascii?Q?e3viuuLOQnxx1aq64nQCNMRrVcl3QlxBLcuF0gqVzG14iC6Vx9ANWZQNDSEh?=
 =?us-ascii?Q?Jyn9IZhefl/eyTDdX1kYtaMLqqKev3H71tzAncVIn4KKlqxiovN1HNHTuwnK?=
 =?us-ascii?Q?LcIFyayHR51O/+HAy9lpIPjoekpzzO0JjVem6BvAstRzPhbkp/gZsPdqQnXD?=
 =?us-ascii?Q?XOyh/i8qYdPuE7/2yVmIjC/46RzqGBjblbcfc9/h7RQOyHn3OzX9iW3x16Dn?=
 =?us-ascii?Q?b5hRGKSTRz9Akfbloxm43PgDIF5GfF3mqbKBxvVFaVJtmS1YI1NOOgb5W7p3?=
 =?us-ascii?Q?qLmWEHYKeKY6CkLcHhU/TeCgtk0k2/qPduQoMxM7DVn1EdETkcLUjtr0I75x?=
 =?us-ascii?Q?/4xpIKCN2MXDVbiSJdgTQGLeJG65df8zDcigEwefGQ5lgZgiKilLUmZrv7Em?=
 =?us-ascii?Q?Q0OmO72tM+LwKC7KHqUy4tbdbtpQZfpvggk4R3IR0ucaF80PJ7/RWgwOMHah?=
 =?us-ascii?Q?G8jmTGUTXxv4g/ebBV50PJ6dq4qdzdxei10TgDLz8GY32+UJEncCokCuhLDH?=
 =?us-ascii?Q?9QE14Kn/pyYY6h/DonV1gmsdAJD3+IW1l27lFVRQxssW4xXlJNiBPT6Ywa1I?=
 =?us-ascii?Q?3co6f6NtTsX86CDqEc+IbIBFg34B2bOd1vMl+IGMGX5BDo6GNMkAYOpXzluq?=
 =?us-ascii?Q?TW/cwXmwYzc6oHylvXlOSUqpCY3TNJZz91oO84VLITEaRe7y/Vox1QveWHSp?=
 =?us-ascii?Q?U2j5Ktp6T4uxAixrgsVUyfnyH5jftezEzwk5bEdiQUgHqoOxuKGW4Huz719y?=
 =?us-ascii?Q?ek9D6o+HZRIh7zkrFmH3AJzD/s7TlCQ4MLdYuxZG5SVTiHYuNT1jRryDlqGA?=
 =?us-ascii?Q?veqM7958UgDtM/9YU5LaTVjSUfc3YCBcncyuIcFsA9MAXLNJI3PMhy/8R0BE?=
 =?us-ascii?Q?WUJrDs3tI6YrjpKH3reqwXxfDeDlgrm8UXJOk8Cl+rtDvo0onRc5mGCUOWyb?=
 =?us-ascii?Q?zUiNSx9H6S356dyQZw4U+NUWPI/cy0ISP1elEdCWisIjG+cFYHn+4EqjmRg8?=
 =?us-ascii?Q?vXzljQg/MpUffoVcvQNnX2Opz6husMNh39cghm3aEf5IN7fBeaqQ8L8u8CDw?=
 =?us-ascii?Q?RgvWXKauAsrUHCkBK1QTJ2qW8xWhrW0rNJNp7SMccvOoF9ucxWt6M966qOL3?=
 =?us-ascii?Q?pd42Y2em2YtEvVbcjxUHI3YQiwex1K4j+Hj6mopco5OTYEFROUDB5aX+0M6p?=
 =?us-ascii?Q?bHgn/y6GYK9CqTLLrpQIIWg2+j3kAihPtdZ+ieALdXxBuX4mdUHQylQxeiS0?=
 =?us-ascii?Q?CUz3gmVI+ITfhZtYA5+GUsHe4nAFErEwKgWilEtBjxuviZf2+b4To4w2lFpT?=
 =?us-ascii?Q?qcrsBN1IxdaORPItnkMbXha2PX8gfNXuWh1CpBIE+e2RR20DriK/JOEF8lwp?=
 =?us-ascii?Q?3lH1CGR/+xsRMqXUNbtXP8OENCusou/w3+kR1t0I+rwuEh77+PNU?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ab46d42-e8ef-4015-5e62-08ded34c3b81
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 06:29:10.6138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CAOyaMiUSaGzc68QQ2bi0ZSd8vtEnMIeokrKcRvcaLVzXeHZWED8Oou3MZZuV2nZbWbJMaztGrxwzoKy5w10WDXC+mPSN3XVQwmCwIFSwA06GZQMZzGsICX0xsJO6nLE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15751

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
index 064a4410ea694..5ace389c6277a 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -1382,7 +1382,7 @@ int audio_graph2_parse_of(struct simple_util_priv *priv, struct device *dev,
 	ret = devm_snd_soc_register_card(dev, card);
 err:
 	if (ret < 0) {
-		simple_util_clean_reference(card);
+		simple_util_clean_reference(priv);
 		return dev_err_probe(dev, ret, "parse error\n");
 	}
 end:
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 00f25fd0d3d5f..00f79963bff6c 100644
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

