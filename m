Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010026.outbound.protection.outlook.com [52.101.228.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E1D3D7D9B
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 06:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782455321; cv=fail; b=ougEiftFDLzlslTOcAmFHPiFLUywnIa+81m1HlY3RJREV8vlW1hL06U2MW6rt9OWBg94ZeWC8W0DVJtLl7SBISJ6PwySetvUEbevkab4unbpwxlOHvU8AFF+B2ByweYYLhFxSNJJ6W8FfhMkbUGtDJGxOz6ieUaoDt38g29ObQo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782455321; c=relaxed/simple;
	bh=3sKgMVlyGaoeRDH2w9h/3qk4JOaDgXtPgm0ORjHnQoM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=tNNq5LcWxbR3oLNbrpbCIUTsk0emlORy6FiuQo8YplC5KrWeUEVJDHGz5+n/sJK9gyLP8q1nEuJAVomacdg+lhvG1dfgcJJc0jc5j9PFsNJGiGBhCmUAMPPHZLkxBadNzV2X0nT1iQZJschvC5i8KO89exm27dMnjTpQDNghXW0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=RWbJqXaA; arc=fail smtp.client-ip=52.101.228.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="RWbJqXaA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k8MSAy1wTa2Q+qW6Rdduz4TDilXz8wh2TrrjXbiEH0/qE9Hfq8sEAJuCELmhWjh0LP/jj9EEyfEFKks3XGjEoVURtUelosMQkussgebPEiNUOakuV0GXqwK/HVYps8m+d7zPsKDooLqfwfsBWi35oP0JTEsrjPETo6h6UxtXGk4gyRmKyHgR+4Joa154VFDO4RfcOV3/4/C/WEmQVlndTVLOjaWgtCo8qhicTfOI0msZbFf3vjc37WqLDnxpEGSPDcWnl7DXf56Xy423Eo8xSRFP1l0NKePQk8vYQGtKziwmEqzoDnUFWx0HEokzXLaUoD4eHrqYG41KK8tuBPKrag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mkBOVaQcWHh2qpEwqkLBAeG5Hyo/zxGDgC0eVdmUvdA=;
 b=gwgRt1LUIquEu0nmmnjNVfKqY5nmW0HjN6QwZvHqYO6Wzefx6IIx3Y2mXPSzs+ulkfhoamenEMa9DgrGqgUXcDOohFB1Bxgg2aFq6EDF/4ZHkfSGS2XRwRTAFiTQ5oaMUNdhLbwhgj1XGqB/fgE73Vy0NeB1E7fClTZpHXGV675V76TJUupWOwfcK3bcsFYubdJqbRcyu+SxbzFuEMk7kxQgXNncYwTRTwf/Eg0sInZEI/767aS2kZAYs7SXXUyrXe2EDKy044WP/OqI2VLVIyBfl3kdOKynjUqqYeZzx1ZNhYUEFk5pNd7ZE/NiSuJc5l5UBBChMQyp4ZoQqiFDGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mkBOVaQcWHh2qpEwqkLBAeG5Hyo/zxGDgC0eVdmUvdA=;
 b=RWbJqXaAnDQKDR5lqwnBwpZwXy6P2DQhXrjr5lvFq08sSDn4TOCYJLO07hLpFE+tQw2RWShsI2yULP33+37UCWXNCPaDqNL1Fkp+GVthF8X832EnAE9pnszfa2ET8lAb/jQANY9zzsBD8IJxjmHsINhxhS/HPxnXvtU77idoPEM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS9PR01MB15751.jpnprd01.prod.outlook.com (2603:1096:604:3bd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Fri, 26 Jun
 2026 06:28:38 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0159.015; Fri, 26 Jun 2026
 06:28:38 +0000
Message-ID: <87se69ddd5.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 10/12] ASoC: audio-graph-card2: tidyup simple_util_parse_xxx() in audio_graph2_parse_of()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <877bnlerz1.wl-kuninori.morimoto.gx@renesas.com>
References: <877bnlerz1.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 26 Jun 2026 06:28:38 +0000
X-ClientProxiedBy: TYCP286CA0137.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::15) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS9PR01MB15751:EE_
X-MS-Office365-Filtering-Correlation-Id: 45e408c5-3db7-4b29-aeb1-08ded34c2873
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|38350700014|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	S4yOteNlABcB3BawIsiuzmBAHoujg7Pnq6KHyvWPPLUUykLp5Qlr65yiHv74U02ELsuqy9iR+ZUFaaw+6dhOXAmwrLsBwRahOlRnjrcUJov/iCWr1VjzhF9CZYDCqHDzHp96ij6NBDpkLNMX3dap+0TX4B+B5srAucxAFNmVX4k12ioOdXp86nuiZsIMBnhhAE6bH9t9OlJSdRSNjoXmPjXBjV7Yoq7W4U8Q4u1yyyrcAXcPvLKXkN53/E9m0Z9OLC5RpO/qVgctbH+oBHXaQQkcNQHuczfvGYXakileZX+7BB9qWBsb62Zj3AK68BZmniz+qOAZ1kufZy8g6hMGUUXXlLIONXiWtUux4a/b5vpYQHBfm+aH8IuvCSElxvHi82Upunke5B2G+hZcG8/n0qyQUZZpjlr4DWmHxQ6GAJk6QVz2QDbyN8E0ZWxowBR83VsrYLlQ8RJmA8QGcQipUEuPAaj9a9jphwhQMQGYcUTJ6mL+0HiCZLIR3DK0zN+9btG04jwBmrAjjIJFGCquZWXiqNEFu6lPNymbgL7cQdi9NkOyBaUdjkJAd7x+whh922EVsnBnZ5H3hLv+izeWqg3Cfe6GfkDWlZ/u/sWdyC0LeZ73eLxz51z6P0PZ2vyYR9Wc/t+kVxeYVyKgzv0Fa41vYGM/oGQtLVitEGqHoGezoZMUAMlsHGBMiXlEd7NMALEH3GGGwBFm0iVrpuQ0cNhtwrUEeMlxjjJioNAbmM8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(38350700014)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EbzrJ1V8SQEDGTqnpV3xOahukExFXIaJOwzc9q+QxR7jUt3NEv6MRyvqroBd?=
 =?us-ascii?Q?uqwj0l+ZBJ9MGpdqKYAxJiKpb5dpQiXvLhCRTuSMHr8RDmgVXGfg4rKo+P3f?=
 =?us-ascii?Q?A9cY/+/Gz1k5hlWdd14sbC2fE/VC+3f5ohN0f9hRQkY0rJOF9fiPXNVgDvij?=
 =?us-ascii?Q?ie7gCUCqhttpyR5OBQZ8CR9wcyKFUz3CMhNqeRhlOmQSRg7J0ETfzoUOIBp1?=
 =?us-ascii?Q?0raOq5+Fi+VKxZgFelHiDKTdQBe1i8IclDzr0RRmOu0PO6XHPBH/zYjxzziL?=
 =?us-ascii?Q?PnfMDAuxIBGGFEbPXYygAuDqWQ8WHnYiVTcyEHt8DPvcLfHMM/tU5faWdG7T?=
 =?us-ascii?Q?ESQpZ52is0h2nXkVf9pgc2uoxxmZXs4PJvgNmT8nHk9WYqr0m4A5fb+2dEt+?=
 =?us-ascii?Q?7KfCJNYv0IsvmDZrWm8zP3tGbiMUeKLfXTEDoGttIe5zsjAtzB0RggAqCjk5?=
 =?us-ascii?Q?T2vE0UO19M1V6iOyx2Ig8Fje8cHytDeSZNLVxdT9U9XwLFuYjnMSjpsGvs8L?=
 =?us-ascii?Q?/9wVFliUurE60i2kqpq8o88YWdvhc9ft7eVHE0ORzRTeKhNSpBqjQIZfNs95?=
 =?us-ascii?Q?M8g0FMGlsWZ/EQRH5GnEaQB4U4kkTeJs87mGn4Juntl5X904Hv3FUSStxZBs?=
 =?us-ascii?Q?2zprKKeTsYSHY+TcGb8iNwYtXnTUOdmgV9ZfzXdZg+H86PdULngfDOtC70Kr?=
 =?us-ascii?Q?6wm6og27yIB4KoqtF5UpN+B+r/O8RlITx9K6chvKAGzHUTkNi+1HXFxW35ma?=
 =?us-ascii?Q?2fv2f8AC4NMPRtdHdeRsck31YN1ICoJ7R3RpLGdajN/Q14ONh+uJDTmu/Cnp?=
 =?us-ascii?Q?9CnIGxZzETYscNQUZaWwTf0rmWlFPw8aHDtKk/Kdtfb90CBwfmXDQnkihVQi?=
 =?us-ascii?Q?ZOjIs23S+i55aoCws+oGXlfByDiOaNgMPsmz6itPQG6SJIaVl60fbxHr57Eq?=
 =?us-ascii?Q?/HRzALmAGkYO0bz+c+GTHyISl/Jn7TQ6VP+ZU7AERSsSJmgG1AgoMg6tNvWJ?=
 =?us-ascii?Q?00DGFnBpe/ka8wW8AKIjZcxIsVuNaX//lYM8tq60WMhS4NDCdlDjkmedSrh0?=
 =?us-ascii?Q?7XT6nu5KgbJQY04GKJjfcnqZip5iwnccBivRwUBFGHBzqnA21rksD76Andb1?=
 =?us-ascii?Q?lxJI2dDrkamJqXfMJ0EM28b0djWgGwGIbQUZKTsT1MYnZMqqNcwaWB/2xGL1?=
 =?us-ascii?Q?FW4nxDx/W0O7rVj9iegsvMQ9p/AEMFQNlMjOhqyoXrLz9Q5WgVCv9OcV1Yv+?=
 =?us-ascii?Q?C3SdIiOcMkIbGy36aG7SxAxKFQ+K7jR2ZslZ+JZEU8YLh4DXa/oLiin98DbC?=
 =?us-ascii?Q?pfy86XwZCBbX45i7tA07HgahWL6mjdm5m9CGhSKUTSf7ukoj0f9bqlxaUC3+?=
 =?us-ascii?Q?3IEviTtGk59HukYuwogtmc72TMF3xDT1I+H59Jq45YXHNYS5nzZnGNOtb31Y?=
 =?us-ascii?Q?UC3oLxFlCR4iFl4Ovd6K/oL4jhIl5CcJMDF4n0eJP1s9IfwRZn/Lck+iQS4o?=
 =?us-ascii?Q?PJOXs5BjaVSvvmnayepXuXUeL/cYSfdJsIk1qOkAlW2n1KL4EWn3bSUiyIku?=
 =?us-ascii?Q?QU6sjWzPVXFXShKY1lVqJhAzVMYkiC2TM2ci8Q4v8cdP6XtelIJQYksX0Ayo?=
 =?us-ascii?Q?z/pyCqxJVswvT19lmgHeArzIDhK2RvwUJek3ItCU0eDlFM3PyK4sC/u2URX1?=
 =?us-ascii?Q?0mM0fmiF3F3WEuv0//G1d8AtR+6YBKxhzOUl8p2pFknYhQFhctjoiye74hi9?=
 =?us-ascii?Q?f7a3Iecjw74PyL4LrYwf2z4O+mdGfiC4jzh1ztAUnrjUs+8x9lH5?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45e408c5-3db7-4b29-aeb1-08ded34c2873
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 06:28:38.4591
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MtFFYLH4o6sJ0POFoBja7J+9GdeWbQV1txWLABinDGUSI5kODuerETamrDNkJ5rZw6aMUXWPtPn1wiMQaxzvfupDERhy5xJ5Q5jai4ZxMYbDrX7F9PZxYmLlZX4/3xUP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15751

audio_graph2_parse_of() calls simple_util_parse_xxx(), but are random.
Let's gather them all in one place.

Let's keep same style with simple-card/audio-graph-card.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card2.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 9c5fff368e39d..064a4410ea694 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -1356,12 +1356,16 @@ int audio_graph2_parse_of(struct simple_util_priv *priv, struct device *dev,
 	if (ret < 0)
 		goto end;
 
-	memset(li, 0, sizeof(*li));
-	ret = graph_for_each_link(priv, hooks, li, graph_link);
+	ret = simple_util_parse_card_name(priv, NULL);
 	if (ret < 0)
 		goto err;
 
-	ret = simple_util_parse_card_name(priv, NULL);
+	ret = simple_util_parse_aux_devs(priv, NULL);
+	if (ret < 0)
+		goto err;
+
+	memset(li, 0, sizeof(*li));
+	ret = graph_for_each_link(priv, hooks, li, graph_link);
 	if (ret < 0)
 		goto err;
 
@@ -1375,10 +1379,6 @@ int audio_graph2_parse_of(struct simple_util_priv *priv, struct device *dev,
 
 	simple_util_debug_info(priv);
 
-	ret = simple_util_parse_aux_devs(priv, NULL);
-	if (ret < 0)
-		goto err;
-
 	ret = devm_snd_soc_register_card(dev, card);
 err:
 	if (ret < 0) {
-- 
2.53.0

