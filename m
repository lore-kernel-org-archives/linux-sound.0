Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011014.outbound.protection.outlook.com [52.101.125.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C3B220F2A
	for <linux-sound@vger.kernel.org>; Thu,  2 Jul 2026 01:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782956737; cv=fail; b=ELyIR0nICQjyN59nt4AX5f8h8uIFPcKWEfLi5uVQfB74KxECpnlwWSvOzFPGWmwgWYmSS0Z6FU7mGauQAcpEpxLuEUt891i6gsyue5qwjm3KxYQXT+QOmGp2I9lHpmq4O7j0O69MTOJIplZVXadWNZiKMBsCemXEdXpLg9tyvzc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782956737; c=relaxed/simple;
	bh=kj05pL8Lu1ZH0s++nvj57jMt1YNV+axB6u2FgPfX2mI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=V5+iVZd7NV109sJLmekHPO/Rfub6uXQ0OstZ5J7wVa55f7Dk6WaWg8n3J0jhBO7RmzQ4h9oZXgSZVV7yt0SY+7Gbconq3icNex2Lu/dKZOwvVetkvhm/pl96428G7nyxMDrne+MiaVOb6ZmH8tOSDNLppD8KEVt8JaJq5zlWjCE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=QNgBphJK; arc=fail smtp.client-ip=52.101.125.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="QNgBphJK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A5XcKYBw2AB+QeZz2SHk29a0zOu+mlGvKEStgFZsn/ZmWoOKxAUNe+waDVLDvBtMZOu9AXO1/aahmRcF0UQWbsux3WUwIbV98Q6wnSpIrTIdt2/jQ/tVzZ/CwfvVSAEX6jt8PG+rmFVpcRHcBagPl+zbcuNbQUODP8H+repdCOGj6gjzTWyB41n94buUqwD1yz22KXiojfwRzeLrQiPsAPNpGrkUk2rAI2uvQK/XJt15dSZtcMCA+FqHvd+kxbV/uKytzDQc38S5iPL/JJTl1JdP2nS4fFb7H0awU4WPNac4h8vt4eXVP9HP04hNQke47jga9d1aQdu0FYUfVUN9Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aThGNho/PlIhKZG6HIgFRHUfNT7DMVY5s51zqENhEj8=;
 b=glJb2p8fgDi9gd7XOeo+jiMrEWG/zTjxOdGv2qMMG/ZgRxb+UNGaJlUr2V6yfa/bEjakhEsF0RQmbcLxUmA1fh2qTR/yVz0sQ7Vjr3tiUw4oJFLobZi5ocwEyEm6fs13KWYG/998ggF6as9+7t4U0n4N7cXqiRhhzgkIYTJ8YQEQirkaofecKFnzvv/nyWNTuXqgT6zRPL08JtU9zoIhvJLNYq4QMDFlXsQ+fiHUATRT1ASq1DYb4to5TNIiUno6CqQOBwReoasFzfxX81VX5jqr3zUcIfHj4Bec84JZ4afLd83hLhKPRmLML3MDeo2h71UqCCf2MpZiRUbSorTQDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aThGNho/PlIhKZG6HIgFRHUfNT7DMVY5s51zqENhEj8=;
 b=QNgBphJKKYNe4PbJtD+CN0K5Viit/7mCYXo7Vh2zgSwk9pdzZo+0BL+8/7AOKuXRLDknP2dU58n4nxJfZxT/oLVSs1fcjx5j6z5s/FW5EDwYY6nFv3k0J5nH6FVJs+43s5Ox7b3ZncktFF0UOPKxvpGYX5e5Riv2185B+vCbrVE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com (2603:1096:604:235::9)
 by TYYPR01MB16053.jpnprd01.prod.outlook.com (2603:1096:405:2e0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Thu, 2 Jul
 2026 01:45:33 +0000
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834]) by OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834%5]) with mapi id 15.21.0181.008; Thu, 2 Jul 2026
 01:45:33 +0000
Message-ID: <878q7uxiyr.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 07/12] ASoC: simple_card_utils: add simple_util_parse_aux_devs()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87ik6yxj0t.wl-kuninori.morimoto.gx@renesas.com>
References: <87ik6yxj0t.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 2 Jul 2026 01:45:32 +0000
X-ClientProxiedBy: TYCP286CA0062.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::7) To OSRPR01MB11811.jpnprd01.prod.outlook.com
 (2603:1096:604:235::9)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSRPR01MB11811:EE_|TYYPR01MB16053:EE_
X-MS-Office365-Filtering-Correlation-Id: 659e5afd-297f-43d7-554a-08ded7db9aed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|52116014|376014|56012099006|11063799006|38350700014|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	49C+4fWQ2QKD447WtqWI4iv5yLHCtO45Q/VXcYA2yuRA3AOb9vP5kWU9QBLO6dT7cjBKUzcvR5vAYnqkPAwhGq/SQgO4YOfeUEUUcsKS/CYHzY9ZSnz61IvKFdDL6uIxy6zeDWNMmzbll2j9J+2jHE6CAtn4hqz6e5K7D8rRwMSCc5EIfLG6m3SuZxFSNbD/ZgIEVK1qhHYBD98Pb+KWgOOanWbM5OdBokD60bucvSMLyzeGaDNX1evmADSCl1dnjf99NWcRvgi9ae+PN57HqYMVBRHqbblytLPdaAuPoDUnG2qlY+raOmIsgpS4MA5s0dCKWiAYHLPfFOXexvIis6xfDqe2VmkX8j6Nb8g0rGnaqnF69tn5ePrU9hd/TjNOR1VBjTHaIJhgWOFYtyr8IgA0x56MofOKaK8wXTvd2UKfABNunRDJBekjxxmxLwxjJhH6XzovdxrOqE4ne95wTJPKWgiFnLaEXSwctcxRDmvag3OlNQ8GBCDxq7iILJ5YU2rGa+67G5KU+N8rTjhA52fXefFsxB47tvsC70q5nuWGuwv/1whRJCyjJy5mDyxGcIYdScmL3hgDMqwAZ9iIqdFNSwajMjIAXLpbS5D1ayuUkYeRhubbWP7ketRMLSNcirIwaUsjGgEnBa5GrDkzlat9cISlEAs75YXrfSYvYSPKAWsX61McrEC9wYz/GgO72Zwdq+DXtsdeZGfnc50bbZ6U4v9JWS0NTTlxbjvVVSA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11811.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(52116014)(376014)(56012099006)(11063799006)(38350700014)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8r7n34C+h1EYKbcKbhdAisjwKRVHpUzXIjQzP0xH5a7hryF7RvzML/2S2pHL?=
 =?us-ascii?Q?ZQk580eVN6Ec6YUIIqfck/Of0hVLPHP1NkIoB+135lRMY7GUaoO5BbWiHjEE?=
 =?us-ascii?Q?i+UhExb7M913KPkF+hv8KyNgpgi000ln7yISh+2g1NkZDfhxIzqHZxJuozgX?=
 =?us-ascii?Q?8JOc0G2PwgQeb/taEHpIAlULR9goP0712sbH8g2rznNKM7nFPk97V11CtDH9?=
 =?us-ascii?Q?3YLUciq8mGKMtpBDXdJq34dTt+4P5JPr36ezvc8aGC7wceOUeCVzdrW547z5?=
 =?us-ascii?Q?j/YN6z0umPPq3CJYAdxBAvjVVretvorFNdgg7wWXhvtk9bRNs2y8eklsdq/b?=
 =?us-ascii?Q?66e808/zjrntjZ/Qeifp6KMpZ1BZCMfWZsBbLmSl36n+A9CjtMqya1V9UIrh?=
 =?us-ascii?Q?vmLYDK7OSm6py5EVv67p5rRtl6bLtXRNDMxGK4bGhKZupAUmum3cHUa9XzUo?=
 =?us-ascii?Q?V2QqMjnGxLc6GhrVRjbYl7JxittM9OL/T97GUXWNrumqj4AlDWjXUbGm+Vo6?=
 =?us-ascii?Q?SwMAGggbL71V7h6fdyWaIljbjG8u9Iytk7LmFMhHKNxj9huvGk59toV9M0/H?=
 =?us-ascii?Q?XNU1tF04DSms5APOkQj5bDNNzTPJBpO0Sc1mpVT8H3Rj+IYfUTnDQWrASy1v?=
 =?us-ascii?Q?j5/yl7zsxDdfgO2BJvgkNg9qkYayGQ6Z3qbtY6yroTw/ic/pkgvcIl9xBCb1?=
 =?us-ascii?Q?JkQsjOOn6qjZIWqm9dPTwLhtSgANqy3StWbrTkSlczqc4/saIVK3gB7jbjAq?=
 =?us-ascii?Q?NeF6kONF4CHFbn6hNmuErxZ1TE9Tny0SkiYcZgwYW5xF2G5e506YMTB6p9Hu?=
 =?us-ascii?Q?B0YAXLIH4QExQ8VCQtUrBhYbB2tsEUWdbTdsTImsQyv0N9G6jzd7Xnj5a/D0?=
 =?us-ascii?Q?TS09zqyrVlqnDJ44+PVlbqbIP/dN6IvM0TNjhEOyfBZx0jXMaQBwlCCcv0a1?=
 =?us-ascii?Q?SSLirSlGlp/qTUUrJE0b8vmpE0R4tGXarAVAZT8Uqnk7T9SgLsbMZrjTEnMT?=
 =?us-ascii?Q?5jkxeZbnzkJNebH/xqGZ0vtdU71KARUcBt5MM7z4VtS5wLy6XfPMhpk/rTm/?=
 =?us-ascii?Q?rQOyhUeDBO1/IBR5cqCoaFwMiccBfmitvgD5uod06KNjuSIlqV4lK1JJahui?=
 =?us-ascii?Q?WfmCCy5c9KQoisc1+BPezklgmONqPtLdpXqHXN1gLF830hWeu7/aMN70BcIc?=
 =?us-ascii?Q?QMTkyjlT/wHie6Rnc/JidTqYOne3DTk9GYatx8HVrZ+C0Q60GVM3tAnYUJMc?=
 =?us-ascii?Q?TeLUefvH3NbzM+XPfh/dIdC7PY3Bl8sm+cFAnezqAwBjkkVazXRx0B6TY1MZ?=
 =?us-ascii?Q?y6ehzszVEsQ5qCo3yXDNE6Zy5w+vualqgKywfLj6pAOSBbtlBn5kHri44aBS?=
 =?us-ascii?Q?1Adr6Rjp9ZGb2k2+OASbtxy0tRLvCFseUY7ZlAZIJmmahlxN+gKmypD7re7F?=
 =?us-ascii?Q?ebXRA6pyMymARltTxCUhcT90IlyPbutGrDXDt9aRvttkOD8xFb8tLjhoj0gH?=
 =?us-ascii?Q?OU3OuKlnOx4E451hPl4DoWeFQDR11rElf1gEuFOvGpVetvWKvalx52QGPaHF?=
 =?us-ascii?Q?0rkhO+ppKYSJMfCBtLl7u9rrKobc4matd+6QSX167ekE/Lwa/1ErHwS0LEr2?=
 =?us-ascii?Q?Q4zCA+qheS0e+RXUz5HtxHJILrnYsd0nLS/IG99N4JLQkxOZ0Q/BjCcYVN7r?=
 =?us-ascii?Q?PuGwfAQ8GXSnDKHNAVyUeYCGpMPToRz1kF6BcXSF55zpfYSJccgF+3Ck/VM2?=
 =?us-ascii?Q?p6X4AgCYjB6lxLZM1Qamcx7+OcsAHS3SVWDHTLZjOgqwiBehLOMv?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 659e5afd-297f-43d7-554a-08ded7db9aed
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11811.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 01:45:33.1905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iGlHxkYzaCUt/3sGA2aOj61eZdWE6bTxZQzraKdRppMyKl5E3d593YonOgetr8UWgBUmhpFkzLeBD2dKgrNgHItTuwZqGxH0AjIpIQ9vyTK35X273EcInWIAKrMTb2O3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB16053

We are using snd_soc_of_parse_aux_devs() directly, but can use
simple_util_parse_property(). use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/simple_card_utils.h     | 5 +++++
 sound/soc/generic/audio-graph-card2.c | 2 +-
 sound/soc/generic/simple-card.c       | 2 +-
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index dfa1b5fb7aa87..ff9747c6aa49c 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -210,6 +210,11 @@ static inline int simple_util_parse_pin_switches(struct simple_util_priv *priv,
 					  prefix, "pin-switches");
 }
 
+static inline int simple_util_parse_aux_devs(struct simple_util_priv *priv, char *prefix)
+{
+	return simple_util_parse_property(priv, snd_soc_of_parse_aux_devs,
+					  prefix, "aux-devs");
+}
 
 int simple_util_init_jack(struct snd_soc_card *card,
 			       struct simple_util_jack *sjack,
diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index b4ae9bb860a14..4dee282766718 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -1363,7 +1363,7 @@ int audio_graph2_parse_of(struct simple_util_priv *priv, struct device *dev,
 
 	simple_util_debug_info(priv);
 
-	ret = snd_soc_of_parse_aux_devs(card, "aux-devs");
+	ret = simple_util_parse_aux_devs(priv, NULL);
 	if (ret < 0)
 		goto err;
 
diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 6e432733649fe..4dd05e7262136 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -720,7 +720,7 @@ static int simple_parse_of(struct simple_util_priv *priv)
 	if (ret < 0)
 		goto err;
 
-	ret = snd_soc_of_parse_aux_devs(card, PREFIX "aux-devs");
+	ret = simple_util_parse_aux_devs(priv, PREFIX);
 	if (ret < 0)
 		goto err;
 
-- 
2.53.0

