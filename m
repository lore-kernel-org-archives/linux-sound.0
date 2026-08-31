Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010028.outbound.protection.outlook.com [52.101.228.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0384F3B42F1
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 06:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788158306; cv=fail; b=Bw9B0SStwfGtuR4DUS387Wo/03XGJs5xdWn95R8Hhowt1p+C9eXT65Qt4CWbKnA50ARbyXGgt/T3uY16Nn5QtPKn4gkGCFPmtHyCskwoBWHgXTaMC8hwwiYE1UeHKpGPULR5rQ5TIfSvhUtJw5IBDj/RSXxCMjbInEdksIL+2HA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788158306; c=relaxed/simple;
	bh=hQZEfDceLecFg3dZU/XONKbJdXC2p2T7MTd+axk9b8I=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=F76fec368NtJB//ZKwc9kF8FquTvsgaHWIpAw0ISRuUKS84WMG/S3YiUmbaC9RPo99YXqGStCc8YHDvahpAez52MNWarOXyGSSVtRgONAUlu9D2vz6ZyWVLwcoStNl5YskgEp66b9azmKuoSEK2PUGxOrplRzRfwNMn21SWsGj8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=bLJ4s51Z; arc=fail smtp.client-ip=52.101.228.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="bLJ4s51Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iOaIHZgdm+5HUXUXuSTMUD0SFwWGtMWb/X9XFDDbNxREcVkOxN4vlFadNEqrQ8H3es4Jyml1RYlbhIc6hiT4hNXPgeFBSK2jGnJvPNgG9g+pZRQn+ev4y7CnBhoJIljM4HAD7FK0NMbU91cX3qstpJZ4ScGocbD6UFi3SrikxyLCKqdcZyHgL/q8YNlkcVPaeqMPMNat8vEK9onBLVdoZjd4qgWwKc9legHoN+Rd7Figt8uATwzpoRcNyGHIY9unKZt3fQQcFvbv3/tzyPyNVA6hz5qHTbkZj6lM/LBCaUVFjCGKQBMSzcq14ixBZTh7qUwGhLtTMD2nvDgj09K3Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Hb3fb50vY9IhFdot9BQC1AgbIzEg2Zj5KdfdZB2ErY=;
 b=OClQ+J1eDdR3T35IjLdDcFWHX6su0sRxFHf3GMhtQUzsXOcymfA3gNB4i+vaknipUnHfYGX7S+RZD0LSdTrZECYuu7HhoQu3L8/GqOxuM/P1CM8IAvIZtTp+aPPtV1Bb15y3mysWswkBBk9RepJ6OEUsvlgbkHNeqdFuaeWw/Y+3F7XRvCTEJGHWmxsLtuMnK0q3as2X2RvIJ9ikbKtcxtxB2vNpOHQe+KHA0GITkfw/d8TDizzi55jrYpQVtGIZ1AFJ0T8b+99VhYicXpCpQRuv5x50lI8O6QvpraYo3j8fuN/2DSNTaM9Bom8OVEQ7Q2hgBb1B9kYDdfqNdWmHrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Hb3fb50vY9IhFdot9BQC1AgbIzEg2Zj5KdfdZB2ErY=;
 b=bLJ4s51ZP7ATO9UCoHJ/hzmc92NZXGyr+mXS16/MG46F2S5sjpkpg7ZaZWjd9Tu2N0bZpj5NW+HORqv1lwLJFQVO640txsr3Vd3OGjgfzpo6BD+1N5TTY9j7TwOU9avRUAiLnas30s4K/TC25Zu2dTJwOsgvhlZI/L3GkPy4WEU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by OS7PR01MB17278.jpnprd01.prod.outlook.com
 (2603:1096:604:424::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 06:38:23 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 06:38:23 +0000
Message-ID: <87v78qsskh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 05/14] ASoC: soc-dai: move snd_soc_is_matching_dai()
To: Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Vinod Koul <vkoul@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <8733vuu75t.wl-kuninori.morimoto.gx@renesas.com>
References: <8733vuu75t.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 31 Aug 2026 06:38:22 +0000
X-ClientProxiedBy: TY4P286CA0087.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:369::15) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|OS7PR01MB17278:EE_
X-MS-Office365-Filtering-Correlation-Id: 293689ff-e70c-49cd-3ffe-08df072a7435
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|23010399003|366016|38350700014|10067099003|56012099006|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	jgW430XzIh04RAFdSOaG0mw1yvbcVp72P+QT3HFE2jLYdCAIiB+PabkxK260jjKv5hPUL6tbgoyZgyVbTsRTF3zVS7tf5XFJhuVjXkt8ZPwqRmdT71szAYJOZqq53s7KvyU3WhVKdl3VmTkUHwEoWzaprkAQ4Zt1KYvZHVlP1Sw3Wi2KACECJ5sC7xEcsRsFhj+gaPHBK8piowgwgMamDBf+47a7C8HRShrrtCyzKJJbpKXIBf0N1P/XZ3DTxgSMHVVJQhNVWPrAtrIQSrJi2lPlsQk9OY/zyKF2f9odjcYc8PmlsN7PXCptzaIWUkpEuxQZUrcCJeUWfbXYr/qLFCoQNIJLr4y4nNDDxTNRPVEGV15cj9T1nxoKbjNJmxl66hNfZWCqLayevVToIblQ626PtX60LZjRYh6dD8LxBzqSURzvHB7JTYWgyabA3o4PFtxjKf+rwR2cypPVmkQSWL4lb07lDS7gLQIrNpfKfN3fOchlrKl+OXKX9f079RGswLW5IfnDqrU23dtqfcZVp8z+XUtUfJm9yjMqHyFYukJgwX7ra2YFitDEa4JX9ZxBc1x655Do0mMg6n1GNqmPuE3Ao4Fr81xYjTMjX/EMJm5DVpnYXZfqyMm9klKSds+YNo246MSmIMXOS7FcM67kempBPx6nvtNA7DOdN+/wgip2gbRST96nHZV6BFvL9efgqp1IPaRtQkB9gOyYUxABhvlB01uX01YJrEVFgoV3mjQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(23010399003)(366016)(38350700014)(10067099003)(56012099006)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?37Rllc6eMXIGqYrg1EG8xNUTwFm7gMvKjHjPvv7riKiUhgrp1sBUf+8cBwbt?=
 =?us-ascii?Q?5PMK4OoXf/J8NUmlZPHVfBjhE0d9BsulkO0OIzQv+ARIdDQvY+2Q+ry0Ka15?=
 =?us-ascii?Q?rjHbUEt1gSQivA0Q2zKD/iaOb4yMPmTR6aMkYcZTGdRiegibiZsH3wMHn/R9?=
 =?us-ascii?Q?qSU05vS9uzLiy57YSUP6JolRbks2POWDaqSwpqi1Jqdra5vXrFNNi6y+sC95?=
 =?us-ascii?Q?L6P/eLEG6bGg7J4iBhGQuC7C6QX+ss/VAfJgWRGHgL6ZpeWGMviJ8OnCmuEz?=
 =?us-ascii?Q?uw3wqN5k8pUtEn6FE0uqbvSNKQmw05GZJOriA/Jhr2Dk3ABAeVjFOnQzL/KI?=
 =?us-ascii?Q?A5KrbIpOr384sVHwIdyJ4fk+QCSwyDOvrtIO9Xvhxv4jDEIyIbVNmIrQfBg7?=
 =?us-ascii?Q?bmWVgFlRDvE/oJyhuijQbK5s/ryTODavShe4nluRyBBPX+/65SEVPGboZscZ?=
 =?us-ascii?Q?wnWy+QMgn2x5lrGuYkqGVnsZRZjNKc3NEZmnqPemJzijTS15O0+ppi23D+zr?=
 =?us-ascii?Q?OVTlC4bpYwW77g22KTVnCef7cCfrkysHXsjGO/CBLqEY2xtkE8ikKFWcwZtX?=
 =?us-ascii?Q?cUqQen5yaslLmdZI9mtz+MgBMMKBGn5pZWP1AQdeZ5dn2d2dx7DWvlrR6MVf?=
 =?us-ascii?Q?ckgS4fvAnG6AIpLy4FS0XmpiswHxNJptOGawIA1Rruj0ZhZoiss1Bcl6G6BA?=
 =?us-ascii?Q?xqaB+JZKd7J6gsXjUTqBxSPSInodDRwxohEZCRnztlnVWOC/hDrMG5bhH4hK?=
 =?us-ascii?Q?O03F1It4i06qC/22+hGL4ukNT13v4ZcjbP9NrJ6Cr2lA8C5ujArwlO+oSoeK?=
 =?us-ascii?Q?bynePSWMhYBbd79WB+E2H2oF079X8uXpgYhYM3sZNUxDLq5+Y10N+I2AoEn4?=
 =?us-ascii?Q?JDOhtO490ZO2QYIgwSHQjds86DGsVvl61+t4r7exmGA1i8EiaOUHL3d2P0eq?=
 =?us-ascii?Q?YSNwRnSVllkE4IfPRAIAZBFTkDvBiHgl1SCFy1B161p6sVAn3KpBa0Cyt0op?=
 =?us-ascii?Q?XeIE5LA/+dOMU6jLTJoyfYK7LFXxsdewydMFYm22dvCy7I3KLr5muidZIBtm?=
 =?us-ascii?Q?bkO23OjAlDzsZ7D/UVlGZF3wmiF1wqaxw9xhZ8IqGDRZVxyp/lBKsgoSFZH5?=
 =?us-ascii?Q?rySTXu57uV9m72txRLOwxOpefDLmtcL9zs0EEnczMY8TGaP3WyDbBqchPRs/?=
 =?us-ascii?Q?RPGo0bjDU63UdMcq+6afM2KW7fNzMy0Ixr6S18WW20BGMXr4E6oGLELUKOS/?=
 =?us-ascii?Q?hq3fRKxpqW/ckNKTKe0ipZt+cmmLtTK2l5IQStsCMDSC8LjQoQcliNZWGxHW?=
 =?us-ascii?Q?1Mf88+FwW7SI3rf7c3ggrIRZKNVFHGlIv/L0d0yEn+R6l9yftfogWeAt1Skh?=
 =?us-ascii?Q?5IXdH5mx8kORXr7s00iSi/WJd5NG3dRyfspJm0YNRZ4JMXe9z6NpT2/kbRwP?=
 =?us-ascii?Q?g3//V2ABsSIjfYLIbujIEG7w/CzpY28UGD1RMn8qHXVInh3ujlNDQaX1gUFX?=
 =?us-ascii?Q?TAQEADNI6k2DXZ8zgqGXqJn0c7f5fUaRtogwts3K6tNTysyGMcYU20NDHDlv?=
 =?us-ascii?Q?1NAGrIb/EpmI3glwYAWjJac0Logc5wxfGiYZ2gY0vHRkmXy5YHEJpgLRWsUC?=
 =?us-ascii?Q?AmU3Pwgs1xaZ1rbc1xURgocTUs2oaX/K45Euoym08rxCbQ2aUQlwz8YuGOS6?=
 =?us-ascii?Q?azBaXW6qitirU8Tkt/L+bFcu2tK8Js7GhiQPio9eRgveAttcksmi5jyYe/Sk?=
 =?us-ascii?Q?bA8CQHDJ2aYpOQ5OwNC89Urn3BVbWb+tviNFsiQDrdazBmG7i1ON?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 293689ff-e70c-49cd-3ffe-08df072a7435
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 06:38:23.0893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d/uoUc6JrB6yFUGbYC7JWe30PcHpTzzuUCSRjAy4MS8/vnsXl7m9GYszVM/cwqpgShnWyXX2ZCn7HeRszr+UvbyjtyAMLVWlyKX4g8H8QryTYPeG8uMgZZ59gVYY0HOC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB17278

snd_soc_is_matching_dai() is DAI related function.
And its parameter will be capsuled soon, will be not enable to access from
soc-core.c. Move it to soc-dai.c

It renames function name
-	snd_soc_is_matching_dai()
+	snd_soc_dai_matches_dlc()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dai.h |  2 ++
 sound/soc/soc-core.c    | 32 ++------------------------------
 sound/soc/soc-dai.c     | 30 +++++++++++++++++++++++++++++-
 3 files changed, 33 insertions(+), 31 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index e2d995bb1c788..dd6ac8ac41304 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -280,6 +280,8 @@ int snd_soc_dai_compr_get_metadata(struct snd_soc_dai *dai,
 
 int snd_soc_dai_matches_args(const struct snd_soc_dai *dai,
 			     const struct of_phandle_args *args2);
+int snd_soc_dai_matches_dlc(struct snd_soc_dai *dai,
+			    const struct snd_soc_dai_link_component *dlc);
 const char *snd_soc_dai_name(const struct snd_soc_dai *dai);
 
 struct snd_soc_dai_ops {
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 9d67db679336c..7d8b1103f40fd 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -248,34 +248,6 @@ static inline int snd_soc_dlc_dai_is_empty(struct snd_soc_dai_link_component *dl
 	return !(dlc->dai_args || dlc->dai_name);
 }
 
-static int snd_soc_is_matching_dai(const struct snd_soc_dai_link_component *dlc,
-				   struct snd_soc_dai *dai)
-{
-	if (!dlc)
-		return 0;
-
-	if (dlc->dai_args)
-		return snd_soc_dai_matches_args(dai, dlc->dai_args);
-
-	if (!dlc->dai_name)
-		return 1;
-
-	/* see snd_soc_dai_name() */
-
-	if (dai->driver->name &&
-	    strcmp(dlc->dai_name, dai->driver->name) == 0)
-		return 1;
-
-	if (strcmp(dlc->dai_name, dai->name) == 0)
-		return 1;
-
-	if (dai->component->name &&
-	    strcmp(dlc->dai_name, dai->component->name) == 0)
-		return 1;
-
-	return 0;
-}
-
 static int snd_soc_rtd_add_component(struct snd_soc_pcm_runtime *rtd,
 				     struct snd_soc_component *component)
 {
@@ -837,7 +809,7 @@ static int snd_soc_is_matching_component(
 		struct snd_soc_dai *dai;
 
 		for_each_component_dais(component, dai)
-			if (snd_soc_is_matching_dai(dlc, dai))
+			if (snd_soc_dai_matches_dlc(dai, dlc))
 				return 1;
 		return 0;
 	}
@@ -897,7 +869,7 @@ struct snd_soc_dai *snd_soc_find_dai(
 	for_each_component(component)
 		if (snd_soc_is_matching_component(dlc, component))
 			for_each_component_dais(component, dai)
-				if (snd_soc_is_matching_dai(dlc, dai))
+				if (snd_soc_dai_matches_dlc(dai, dlc))
 					return dai;
 
 	return NULL;
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index ac815aa212d3d..d22815656d149 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -1028,9 +1028,37 @@ int snd_soc_dai_matches_args(const struct snd_soc_dai *dai,
 	return 1;
 }
 
+int snd_soc_dai_matches_dlc(struct snd_soc_dai *dai,
+			    const struct snd_soc_dai_link_component *dlc)
+{
+	if (!dlc)
+		return 0;
+
+	if (dlc->dai_args)
+		return snd_soc_dai_matches_args(dai, dlc->dai_args);
+
+	if (!dlc->dai_name)
+		return 1;
+
+	/* see snd_soc_dai_name() */
+
+	if (dai->driver->name &&
+	    strcmp(dlc->dai_name, dai->driver->name) == 0)
+		return 1;
+
+	if (strcmp(dlc->dai_name, dai->name) == 0)
+		return 1;
+
+	if (dai->component->name &&
+	    strcmp(dlc->dai_name, dai->component->name) == 0)
+		return 1;
+
+	return 0;
+}
+
 const char *snd_soc_dai_name(const struct snd_soc_dai *dai)
 {
-	/* see snd_soc_is_matching_dai() */
+	/* see snd_soc_dai_matches_dlc() */
 	if (dai->driver->name)
 		return dai->driver->name;
 
-- 
2.53.0

