Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011020.outbound.protection.outlook.com [40.107.74.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD6D3D811E
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 06:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782455317; cv=fail; b=bpLUB4CHGBkAmmYMHZwxztzQfr2SrfuxUFx+IVOZdIW5ImZZ5/ZrQzbZ4VC9GzKasb7h9GNHxCkAXXMhhyAxkzOW7sOI2OsWse55qjBDaXHSmaizdEVZT7doqpkjzfar+A1wvpl+BCJaisXlPK97Tmfqo4VjxXPo6XR36iM7O+w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782455317; c=relaxed/simple;
	bh=YysTjJxvYgAQFtFmgCg7eC09JF6TluFIkYvMJIX7578=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Wudo+RGxzTjP2lWseKcoVpOKkbEA42aW9oep9ZPD7vKIY9fRwGxmcKE/z1m3n9aRvp4kPlTQ///FAuiu9PFflv17uJqIiPgkmzfhslkgmvs0pbhJU0zdEGkiVv7WfEWYOD9lz/7mftSmPEoMeW2q4BCaW3Ph/rpuSEJwUHvIN70=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=AQOWOJIU; arc=fail smtp.client-ip=40.107.74.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="AQOWOJIU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LMjcPL25o5VioC2j4E4oeZxchU9zS2BRpe3G6ySIGZD8Yk7xVXW6mdEdcnvd0NyKBqQuuLi2yv/SUBR0y+0EHsDk8PirpIaXkCmGW8LWMbngi2DZS+c51X1hf1tFCwI5N5aoWC7HQEVLgTXe1ddzHPUCXJiKEOBdMPXxdj5HdU9mGjDXKRw1RStMILT7uFOs9fEfywK4UB8g+pXd3ehZuK2vZsnqPhinWykhX3bx3Z2UQaCqc1fyoW3czMgk6M9pFZWHNpXgBfwwLrwpcuiQjCFcaY+rgqxSoQYqCh+rOvzYQoFZyVXW7Y4jZoHaAXYsKCNdsE5WIjdU814b+vSH/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tu2fZYym4ZhQIpiHTaAIvHp1JExKqbYdvBD4rJB5i5k=;
 b=kUH8K7djn1hp5mbGfvpgkcFBkJfjr4dbPbfzploWqaSf1ShudLMsRaFiX7fNRMmC038mQbPF2Q9HeVsEBI9YVGtJh0z4+OoIMHWj2+So7geAdI9GHbvIZljGfMCB1fz3m/tPh8wTTI0xmLMS4LfyP26R+1vQamSmOVYRSHhD+IPuKnNT0rg1n3IZdVw5Afatr4s6CdjmIeuSbUIL3nhcuDdb1BureIcKJyf+BQ3g67QNOZfNwwJYc09yh4TGhyq7G6f0NDAuKkU7bOJCjLGs+wz7YlaEUdrf4uFSzArXIzz0R6bnogCoUM7AkcrW/22JesfqeUiBc9P4cOgbTHH5TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tu2fZYym4ZhQIpiHTaAIvHp1JExKqbYdvBD4rJB5i5k=;
 b=AQOWOJIUszkYbFZyG5hVUnoT+wojYPhp2oXBLzm1PgxIhN27qD1iJQUd7FRvP9grf1md8M/Ms2vS25Z3OUFxVaH9FN4nGmH3kN8zYXBu9m2/BdzB1VIwth1xcYbe2UMYf3maVaZuP+bBxsumupg4y+e0UZVpjkbLnNZX/qixIXg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS9PR01MB15751.jpnprd01.prod.outlook.com (2603:1096:604:3bd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Fri, 26 Jun
 2026 06:28:33 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0159.015; Fri, 26 Jun 2026
 06:28:33 +0000
Message-ID: <87tsqpddda.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 09/12] ASoC: audio-graph-card: tidyup simple_util_parse_xxx() in audio_graph_parse_of()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <877bnlerz1.wl-kuninori.morimoto.gx@renesas.com>
References: <877bnlerz1.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 26 Jun 2026 06:28:33 +0000
X-ClientProxiedBy: TY4P286CA0114.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37c::12) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS9PR01MB15751:EE_
X-MS-Office365-Filtering-Correlation-Id: af6fb47f-57fc-4c5d-450f-08ded34c25b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|38350700014|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	rB3+2wp1m/2Jj/B0rMmdJQTG0jrqcKiDbdNtqnAFOYMCbdvgFojQLaJWG7r09ZV1/Y0KgQS4x2XvQmcRwZ5TP5GMW9Nw/1Xh31YanmFVXpkh9chrUiw1go0r0Usv/qEDvAhSpfyA8uHG+2TMuTfAj43ShZxjBHUNOyuwavKhRN2Mn0RLegtH/LpujMLrH8idlD6u3D2JlEox+TZn0xJcxxkQAh19K/K6hFJ+M8eI8VtlLj3pjyKVwuTtJoDVIaumA4ITuDgYO7jmG0MXCEdLIw2c/P3rlWCgEjNNmVPKMSCslmlcsUUQWDEb7OuUZC4pR0HTeWTAvpHlYK1aIJ2PjQxkRcLYlyGj+LC0mVouEEsadmOTooBAT1WjP63gUhPorB6kn0YTMgR3yI8HnLl/OvR92IiYyuzCo1M/NBegigH8Zuj3LhuFRyaF6SdMivQnskoZFjjUdZarFPXzGrymMDSwwB+72M4Dz076GGogej4X20E0azRTPihl4l7MPhWxLnptnPAiCLldOrjkxz4pq1WZCsLY17LNoHMfv4I4pHBv/DsqADc4yZ3PEVoZMnpCEsI3kQI1djWrHmw7slV8wXB4mAZXNNV+Aq6xcvTUnSiEsKNTjJ9aRNLhfrs2Fh/5T2Ol/Se/ot0yu+G9MncJqcbft0n6eQxUEmDQ8cDZU66XoUKA0UYTwyHg4ZGGpmGJ5VA9EbWUwGcvFfI9MClC7s9vDg9wtVCc61e9RCJbZRo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(38350700014)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ggUUcggPzVQ40NuhB4q2cmnZOPCOtSx/YSt+sPDEdaWP67n/bKnij6HnR02s?=
 =?us-ascii?Q?CuM9MrNmkrZLga4KMc8VMA47DNx1OzFjKj+WOtSA7lug3Wy8zKRlwkiad3Zb?=
 =?us-ascii?Q?9qn6U32dlQsSA7rtwQYSGP4jbbvGvD34Q7oz/mBFbGuVHoXp+A8DRyaOu5KR?=
 =?us-ascii?Q?FYW5B6I7Zt6p1sNeQJy2Nn6GJp5VWD/+jtIjqJC+6/eYFDT4jxlnUK7yT46i?=
 =?us-ascii?Q?WWuehmczXGj4ygBotPS3TSCxCAzqMVHH21SF72JkpI1HwrMypAHZkroLPhDC?=
 =?us-ascii?Q?x/F/5xqFWsvrakPNhw7yClPVYnp82p9w28totF6aXys9SMJ2DdzLbRbyRr8O?=
 =?us-ascii?Q?Mvb4MsjMYmPq/I2DMiKutoQlz2L1YUIwgSSAd0Mtgs0aaMIEIXW5m9IYNhAG?=
 =?us-ascii?Q?EW4uGAWAw0tO0GOUnpuGXDnjsnA0SWiP+vPZXwq0oLTwB40dOM5L24vm296p?=
 =?us-ascii?Q?RfZ5gcFRsrrmOAT2hqqcRyX5qoCs/kAoDi0Q+0WTw+PH4wr/aKkfRQe9OKKh?=
 =?us-ascii?Q?uYrjNkAnKJhtPHARAQAPdaLgmVS/54YAqoJMKSiwEd1oLTq2nsB6z3/VWN2e?=
 =?us-ascii?Q?BTCGXLeZ4OCFZbAp/0f/XHmSic1DMNghpW1Qf6G5V+hdtkaMQE+EzQDIm7Gw?=
 =?us-ascii?Q?ZDlVu5qWYPMsQaSJ7DiEkc7SeBsTv6+GOgx4LrNFAdL8MHa1ckNy1YoEgrVo?=
 =?us-ascii?Q?RnIgBESHrVPBIw2PHWhw4yg8yBQhci2Qo93YzfWCUUl0p1L/bFiGcNXaf+rP?=
 =?us-ascii?Q?VQkj1on2ENOTK8v4Mr8v14OyKCNPbm7PCyPqEXKfPToDtYrlLxnC9Oo+iFx7?=
 =?us-ascii?Q?nYoYa5ePzsygijJWktQwH8V8irDhP32UNjNIXsv6CmX9/OK/XQZ9ldFoMG7i?=
 =?us-ascii?Q?0d07Ot4kmoNwt4480UFiIRl1885SEVjQ7y1QwiFQ8xUA1a/LYn686LYG4w31?=
 =?us-ascii?Q?AKz9V3aVHm5lk/wtR3yTysXN9zrDcA1BonDUxWBj5X2YJbKfyWK00EJzfKEv?=
 =?us-ascii?Q?EtgpIelA0QBDc1IN6RZ8T5K1VGNtNkxYbQGFOFRdDtowvdLjWGaEFhfl7cwH?=
 =?us-ascii?Q?M1+/hwPy/xGZ2GreGw7LywD/uaujTQHvYOft/DfTgo63a0+lm2ZSro89VAdF?=
 =?us-ascii?Q?HdkT/dKagQebe3Z7wgd444W5IWFb+ty0eI5gtufhQ4FxDKIN2f9KODY67+eu?=
 =?us-ascii?Q?orb/hfzbukNIX2TTz8dTu/IkoedoADkmND6hMliRi/WKfTElN9vJvMGa3g0Q?=
 =?us-ascii?Q?Le5GmiJ/2WFUkmA8eCC3ufs51JagZUsqi5E5O6uI/yvi3FJ1fWAroHeyNgts?=
 =?us-ascii?Q?ejzva5ZKrJ0aTxhEvxLzbvqAiMjAVaIv2qEhoBgMVuohqjDM7ZZy/bB5Wt7n?=
 =?us-ascii?Q?IZb9Nt6xsZ7qsJDemSh/oHjDlX3yRPo1RDO/n7uad2VZMuuJb+5e6PFUQIw+?=
 =?us-ascii?Q?n8j3MeXR0/pk1YWwh4B1Arq0TO7rGjID1iZjLlhGC7K9UKyVHQO6q47zGUym?=
 =?us-ascii?Q?arIxAUUsyVEMth1nU/LFeoa9nwRw3K4djO+PV5UpW+1S/LGPJ72uQLaAvrMM?=
 =?us-ascii?Q?CEwA6cO36THDLONZS06EvbhN/vbBxOM7ute3bBvpgHx7ADWcq5nx2kuJTnFJ?=
 =?us-ascii?Q?JH9rh1GKgEMRgSlo/yW0R3/CB3tuZ/CLt47GF1X5VzF94r0CRPYBD3QA8vUi?=
 =?us-ascii?Q?P3o3KpCbzCftEGdl4iwP1n6uWfEFj6e/3p+5zR3GkexRHeaFydAMP3pbV0zl?=
 =?us-ascii?Q?V3Duk6NK6hZ+ckozCqbsbFMfDzlKD+c1THPD8Y+dO5MPDG43LQyJ?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af6fb47f-57fc-4c5d-450f-08ded34c25b2
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 06:28:33.7602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: neFKrjnaueZUAMh41MJBCsSy6pplpkRZmPmOHhRpQgTXLczucw9hPaQcpqu0uDpW5mJG94U9xmPZJV14pO3k9+IvRJJzWuSEaH3cMRKgavjYjPlfG1qu00HBzEFmYSn+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15751

audio_graph_parse_of() calls simple_util_parse_xxx(), but are random.
Let's gather them all in one place.

Let's keep same style with simple-card/audio-graph-card2.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 273b0c82ebea4..f5e36c777ac63 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -587,6 +587,10 @@ int audio_graph_parse_of(struct simple_util_priv *priv, struct device *dev)
 	if (ret < 0)
 		goto end;
 
+	ret = simple_util_parse_card_name(priv, NULL);
+	if (ret < 0)
+		goto err;
+
 	memset(li, 0, sizeof(*li));
 	ret = graph_for_each_link(priv, li,
 				  graph_dai_link_of,
@@ -594,10 +598,6 @@ int audio_graph_parse_of(struct simple_util_priv *priv, struct device *dev)
 	if (ret < 0)
 		goto err;
 
-	ret = simple_util_parse_card_name(priv, NULL);
-	if (ret < 0)
-		goto err;
-
 	snd_soc_card_set_drvdata(card, priv);
 
 	simple_util_debug_info(priv);
-- 
2.53.0

