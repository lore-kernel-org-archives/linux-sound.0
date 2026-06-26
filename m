Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010013.outbound.protection.outlook.com [52.101.229.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855EC3D6CDE
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 06:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782455285; cv=fail; b=BnXT4jB4v5/dR5Twf/ILrtLyrQV9c39zjFAWM2hGXOU1DEgpMtlS1s8dHwYk5YY3e/9akxz2v8RK+LUbniQJZpKYlfWkWW0uEgOsgaZIucQnukmueIBVR8C7iQ0rLH5fFGLoXdewglL61IVq3BMEV+KA1O7U0pEYNxzuWrfSTKE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782455285; c=relaxed/simple;
	bh=+YysZi7bhNEm10X/CSnyAbWJtTMUxunMggbgErnJ7Fg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=FVC9SsXNq//RK1oSMdTxdt8myAr1b3UeuQVtVRhdo/cYlpXGWf5rih5Dec7qMixm0B+UMmOaL3CdSQOu2xDu1fvYH7vb19yP+gbJRBPVGGGN8AUI96cbISxumtfGfmt1wLVdJxuvAWhNxlDRBIGbAsfsGr5vmQvjI/OV40MgsPo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Is5cP5vF; arc=fail smtp.client-ip=52.101.229.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Is5cP5vF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y5vRP+ElZ8Rpsvxjo2kWukGeY/scTKn7w8cifjIj9AE+uMGtAAkzOOfsgUjEASSfRQV5xkkGlIfQjsMIqFsT6fY1PWxhm5QZJt53YOz8WaB5TIULryNmBH0JpUTdodPRTu+Hy+GvPoyyqZskUSXwG+fZBBuw5NRcOgJ65qAfTGdzhxDaL15YqCuUvGQz9C+UX9nSUdHyqlxbGKiVlEyiuO49+CEdzSPkq4pEoZidoW7/gRwLayrh9q5rYFF4set/lr8W06ywSGV6eIenIMz9V16b44A9biNDFgLWtDGFOElY5LhiB3oWkxIyyUioAZtOayNolD/znqPk/mTi3UJ6Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hhYrqkP4rrRL1lMlMW+wIDTQ6MCXO0epNTzsYxXV1l0=;
 b=YfeS/J58YSp1UcoJ6Iw0R23+HCm4FQDwrGc4AlA6p81/dwHaCTKu+OlvYARfJP+75Sln++KKH9pgEXAdq98DKMTVJNBdjkeMUol6ZHKErgeCMwl9hBYHLTE689NH1CMilZWYJ0izYpY+crFlsRePpngCMP5iiBF8sjTQu2yDku3tVH58498/7BjBYGfghWu0nFCihXaUE5rcR0wgxDXbTxk1wgUXZpE4wQv9jkxh+698d7qKbqSjNFJRYaeKXEnv8g0Rim0BzDZFe0JtWiPpnENkI06KiW5i3pOwqGRlkbP/RhP7u9eRzikNpGTd8DQkxRTzWRD36+zZ2zIZN4cYVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hhYrqkP4rrRL1lMlMW+wIDTQ6MCXO0epNTzsYxXV1l0=;
 b=Is5cP5vFip/exlPyfCNcW0LAiv0UOOt5RoFbyM3+rGQmukBkB9GtW7JL7W+4w+4ume92agIO2/oTubDwek93/Lw43NmxsCwqZmwht3++vzTh8mqJzZ4qmnun+nHxHJKFUh1bVjcUV570tuAu+9sRL3sMHfwr8Nyd8TsRs5jAHUQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS9PR01MB15751.jpnprd01.prod.outlook.com (2603:1096:604:3bd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Fri, 26 Jun
 2026 06:28:02 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0159.015; Fri, 26 Jun 2026
 06:28:02 +0000
Message-ID: <875x35erym.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 01/12] ASoC: simple-card: move simple_parse_of()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <877bnlerz1.wl-kuninori.morimoto.gx@renesas.com>
References: <877bnlerz1.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 26 Jun 2026 06:28:01 +0000
X-ClientProxiedBy: TYCP286CA0291.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::13) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS9PR01MB15751:EE_
X-MS-Office365-Filtering-Correlation-Id: f4faf7a3-bb99-4489-bd12-08ded34c126b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|38350700014|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	L78PtaaQCO6UKwId6NfRt9npBkKocAr5LfsnM8wGgAg/i+thduZ8ivNgFUkpxlS3XyYd/ag1Uu7NXiIdNeh0feesTxT+kEZPBrGdAkO2xxXDPdvymdph7BqIZWnQtS3msfk3rNbsCmaGDyV50Q/mH/q591IIbi2+LK+UEUcqeQFOFt135m/YeOMmKcwbwT3LjV3Lt9f8WvViB6BRLaPSjiWL8o5qAwH/n1A79EpPOVlRz9kd3tpWJJCjnfn9fZ4kZA9VkEnTx+Q4Y7FnNmexO+7gO0BYUjAcpist+QKjf0LtSVC2I3YitPWxiM3IL4rW9AFuJD497Xdb3DzMzElvAVFWlv9BVT8ieNnSPxuj0yLM8WQIie5Ktw3Iz7chmKGoThJpdz+MLPGph0mrkHheIQHqE3NLAa2XiRWMS/GQ/M92LPzf+I++Xz2x8oiU4CvRfI5R5UokgFXWaFdqtP+C/F1KQtn5pvrKL/4+HTT1/jJoWuSAHN17updPgs5iVgtY30HpdtbLQmIdZJ9loaV+/brfBHnl84zoyS/DL3ch/4lIl0PVDxrlbhAViE9/Ehxn2/Wq9prwrAdMMhIwIErSqKv60Eexb/LeFDKaXEgcvHr57zku5FsQifBVlaz0IoRsSx3EoGOMtTH3QI5yeAV7exJ3VJKoCPPHp9JRONygKWwbGxFwHv5mY6bc/i3NPs+dBKRZ7qXGTYVUKjShiSPADBV36lBnkqhs1FbzZfft4eU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(38350700014)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WOfvBYeHtqzkacU4xO4qovjP6QdmTSQvbZasdM+6yB4KIgl7dBxRW5UjUdUD?=
 =?us-ascii?Q?lcgL0Uol+GK0rfqkLjeSlJn37k8jjHy+cOmGeNLUgW+4DPK39zTMl1a+yLGC?=
 =?us-ascii?Q?u7IvUbYGke4IQT1eieGT76g4D5mk4fO/W4BJW03BiqHQQKSvcPDp5Jxe9AIv?=
 =?us-ascii?Q?UQwU7vrL0/gTAKJmuA2YKG1XMXLRlfXKbIxev2yEIWtwkRuzQgEqOBjkkbkJ?=
 =?us-ascii?Q?zsxaeoFkDgehuf6P3fHPlrFtlO4rhUDXBuUSND1SOIkFe2ma+tNh7Kc6IpFq?=
 =?us-ascii?Q?+AT9v9iO1jVOUVEfL/AhGidUT1FYA1dSlFgOqJx3fkXHIPPJ3I9myPRlVhpV?=
 =?us-ascii?Q?hICKR7HhD5+cMLGG3Ub36BXdDftK+Z+ae9jm6+sVCg6Y6Umt1ZaVtxFpAi9A?=
 =?us-ascii?Q?V7lebPctPoAlUbv/LOLFQ5kgv/ODw6Q+5Gi+DzHjjsulZKOIuJJM8VZd3zlV?=
 =?us-ascii?Q?znYFgfkk7oXdlaoEwucQeZXoZxr8p1ddjogscPwzsL0C1EuIGoKpLCp5GXVg?=
 =?us-ascii?Q?RFK8B13xs4+c23R+/s6VgL1kYF9hzwezFOzv1JpL6iOgcx0mUZCMNQZnH4Ka?=
 =?us-ascii?Q?wwrZn5tJIgwsTZ+yga+m3AYJ8CvFfvG8KY1++ZQz4TlHsHWvFgV69jP1PD8W?=
 =?us-ascii?Q?150DhSP6PGo7uvQpDpM7ukm/o86hLxHeOzjg97QvB3nhj7ac2Sj8E9aR7SuD?=
 =?us-ascii?Q?sA/gZxH1reSQIHQvReC8SIn6prO+GBoJzNzVEtGChw3SuacNztPtm9oRiMwD?=
 =?us-ascii?Q?2VCW6uKy/T/ZoefyCFw7IZ5Owbo/i0Cnb9o2NrJAcB2+FlHnS1gKRCEJ8e5e?=
 =?us-ascii?Q?qPoVFETEMajF6dFer4xmG459oFeR+IFVw64wuqX+UYyQ8yoqdUk63sWaNi19?=
 =?us-ascii?Q?aSxj2oUEwJ88y3YDjI+NySaVVWU/uaKdToDsbqWybGJ4mm6R+5BVwzYgwPqs?=
 =?us-ascii?Q?xfRxGWXbvimp4QNJ0DeOwibJnWkdAzWDEHr1DCnHHB5BTTrbIMq/GR/Ks626?=
 =?us-ascii?Q?3zXxZk0MKFZ9KBg5o3x+JBZB4NbHyFKjXeczNFP7U2OSI+zSRFiogs2fLs4j?=
 =?us-ascii?Q?3sUq52irllxBDasZKe4deDsLh2qyBANZam7N1Pz1d86wD5b7vPWkvVCBeHaI?=
 =?us-ascii?Q?4wteeqcM8+Wa68ORSefQrXVTO2CTwAzQJNnX/zglcMRe+e59vygqAx5ppmv/?=
 =?us-ascii?Q?MmLkS3pY53wIDnWXyO2NQKPSOaDPmIY4gWcOxJiqfg+HLeDXiIEOPN8y6NrD?=
 =?us-ascii?Q?MrC565CQbR5/nJTXpROiV9zUyy77SWZ8pqsF2YikBUY122B8SHSSKpFX4BTw?=
 =?us-ascii?Q?F8Qskp+vKryZqkgKntjC0nI2sJ+nzIfhxs50VfTOggwRRYVM6CA/ItB3ID9b?=
 =?us-ascii?Q?RKALnxBA5VtZASqkiqyfsY2A6KXLGJIv7ZzzV2y0V1llUL3QUDf5ktSxScpR?=
 =?us-ascii?Q?kOZH2OCQWQtwwzWXUQ9dvCOdjWud4REZGtUNg4TU74JKwQVhYKeK/EIKJ4Ug?=
 =?us-ascii?Q?0Xe7ftE6nYOajqWmLTzt1knZPGBKM8JgNUrSP9KQQEDQ/VevE4oChf4CRH/C?=
 =?us-ascii?Q?k2Ba9Nsrn4l0zpIC6mnjexl+Z1jz6fdfVa9W09Gimi7Mxd25uq8syY4Pkhrg?=
 =?us-ascii?Q?qv4yXO6L1G9nQPonTGZ2PQFFUoHG2g6u2FVhWarzcMR09ygGDRA2DVaLN6+0?=
 =?us-ascii?Q?SJmPR/kSaJGJd/Lx74UIOn5o7CfczJ51cS3dCmOPpuoLb4neOQDjFxWFCvmN?=
 =?us-ascii?Q?TC2qQGF/tntxdyUATLC9ru/6w8mzJZBM3MAfzx5F7OTN0MhyKSrg?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4faf7a3-bb99-4489-bd12-08ded34c126b
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 06:28:01.4260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZlvraK630h5jMCTDzCF93Vpg/sHZZOrkJ3CRRQaeqDOWpEafSIBvV/Dkk1SstEWdTVJfbcFM5hKB1GSfFZBhrhkSYZYbD4yGJQCg4pvYruWvg2owAnQYbMlixv3QJrN/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15751

Move simple_parse_of() position. No functional change.
This is preparation for code cleanup.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/simple-card.c | 76 ++++++++++++++++-----------------
 1 file changed, 38 insertions(+), 38 deletions(-)

diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index b4957e0252113..456b7ebeb068f 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -517,44 +517,6 @@ static int simple_populate_aux(struct simple_util_priv *priv)
 	return simple_ret(priv, ret);
 }
 
-static int simple_parse_of(struct simple_util_priv *priv, struct link_info *li)
-{
-	struct snd_soc_card *card = simple_priv_to_card(priv);
-	int ret;
-
-	ret = simple_util_parse_widgets(card, PREFIX);
-	if (ret < 0)
-		goto end;
-
-	ret = simple_util_parse_routing(card, PREFIX);
-	if (ret < 0)
-		goto end;
-
-	ret = simple_util_parse_pin_switches(card, PREFIX);
-	if (ret < 0)
-		goto end;
-
-	/* Single/Muti DAI link(s) & New style of DT node */
-	memset(li, 0, sizeof(*li));
-	ret = simple_for_each_link(priv, li,
-				   simple_dai_link_of,
-				   simple_dai_link_of_dpcm);
-	if (ret < 0)
-		goto end;
-
-	ret = simple_util_parse_card_name(priv, PREFIX);
-	if (ret < 0)
-		goto end;
-
-	ret = simple_populate_aux(priv);
-	if (ret < 0)
-		goto end;
-
-	ret = snd_soc_of_parse_aux_devs(card, PREFIX "aux-devs");
-end:
-	return simple_ret(priv, ret);
-}
-
 static int simple_count_noml(struct simple_util_priv *priv,
 			     struct device_node *np,
 			     struct device_node *codec,
@@ -704,6 +666,44 @@ static int simple_soc_probe(struct snd_soc_card *card)
 	return simple_ret(priv, ret);
 }
 
+static int simple_parse_of(struct simple_util_priv *priv, struct link_info *li)
+{
+	struct snd_soc_card *card = simple_priv_to_card(priv);
+	int ret;
+
+	ret = simple_util_parse_widgets(card, PREFIX);
+	if (ret < 0)
+		goto end;
+
+	ret = simple_util_parse_routing(card, PREFIX);
+	if (ret < 0)
+		goto end;
+
+	ret = simple_util_parse_pin_switches(card, PREFIX);
+	if (ret < 0)
+		goto end;
+
+	/* Single/Muti DAI link(s) & New style of DT node */
+	memset(li, 0, sizeof(*li));
+	ret = simple_for_each_link(priv, li,
+				   simple_dai_link_of,
+				   simple_dai_link_of_dpcm);
+	if (ret < 0)
+		goto end;
+
+	ret = simple_util_parse_card_name(priv, PREFIX);
+	if (ret < 0)
+		goto end;
+
+	ret = simple_populate_aux(priv);
+	if (ret < 0)
+		goto end;
+
+	ret = snd_soc_of_parse_aux_devs(card, PREFIX "aux-devs");
+end:
+	return simple_ret(priv, ret);
+}
+
 static int simple_probe(struct platform_device *pdev)
 {
 	struct simple_util_priv *priv;
-- 
2.53.0

