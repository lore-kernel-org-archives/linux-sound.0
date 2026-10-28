Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.57
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793156640;
	b=iJtrU4cF77J2E7KbmbBXPuotdXHEq8uKmxGC8jd7u1+7ZzoMRTZJSBSpP9NCzJGjZW73
	 XuqexbsWUQvGUA1LdpAh5OnlZZfI8+YFUQnefZWz/KJ/07D3NUTzeKwontMFbcLIK0WRD
	 6o4AVYOcN8lehE1jjMCNFRTj0TCYsCrkwuijdHW/qKneCcwJUbQchG8B6xvS8aqpITyd7
	 IDcspnR8k5FAM4Z56v03u1JsyNr37RPuqkuTqvTUvTbZuCCQGFzianFAgCUTerJboOL8a
	 YCOyNEklT6+bcx+l2FdfSuX6K0W1iA9UwWsCAWhQ/QQFxhV6/08nIa6Aa199kqX4oWQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793156640;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:From:
	 Subject:User-Agent:To:Cc:In-Reply-To:References:Content-Type:Date:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=lLeNWElfrErBGKGazwZWkZE9bsjqmoihrSMo40qrzNk=;
	b=TVXX1zFlG66dAvEyBO51nP7lPo1wBD9WvKMc0uJX+OaXQ6kVYxTI+4awvx53dUVd7s5V
	 +bizUJgFml4t6mPOs3oa8KDMIUQux2BnuAdvNsMkF6kLPSkrFwc5f+zA2zjKMNAqUS12r
	 zZwexDrnB3zPi4YeqC8bbb/CSQgk1dkpWx/cLnKOsa66df1H6DEKN+5cymDKXZZTXtcxH
	 PTwzai5JErohH7/GNpxAqXHB0mhoiWw7c3TZNyYdJ4UhxjAKNmGGHVefkv7O2EAVU49bj
	 3+lCVgbmHdoBjgltmyIk/7vSoE5YI9zyin8EWMb7qLuR84yYwzjEuds5eucj5wmOC+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=Pw7dEDFs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.57
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010057.outbound.protection.outlook.com [52.101.229.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817D8606A31D
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 03:03:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 817D8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=Pw7dEDFs
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hhp50umzZI+IU/kHwGDephNlmreHxuYWfnxj3PWDuUuY1078JINNsEVnFWzYKgVDQqiVPKl31bbbm7trMkC4Js/IkzVBs4un0gWRqGaerMv7Zs8XRJKqG9rpasaYdTNzLfzKE8WDmPtPgKbg1OTMKJw+1S9D6uNBt4MVCEeLqvyIF2z8Ghi08xG7QtzWzM2rsA7l7FTsk3UkBRuaoPGu2jEtFPssW8yP59Hm9Qvg0fB615ctm+JZu7lWrkIPKuY8ERtEIGDHHQ5rXtYmJ2lTMwqc0lYBZ5KuKBwj4OMO3L6AsjhthTdxhLQH5oxopvh8TMKVMYZGRqINFPSFSveS3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lLeNWElfrErBGKGazwZWkZE9bsjqmoihrSMo40qrzNk=;
 b=vpDHBnPPV06ep+CgpMXBGWNIV9twkYOLG2XeoLjupfkhbeqOCioTuqmluPySF/ecdsXr9iRu4wZIylCD/EBpQl3hnJpBV/Aa3ogdDEcHE67wvpAg0sDhpmYCDpP8Za5XkwDIgTeinlwpmgNMcfndQa/BeuzUKTKXlUEwoih+H5kb1vue5eh4/j8t43T0jU9KC99BxOibpilnGfuXOBEqslifA5aAEfjajGsUXqyCIiMIsAvmCiPAHDuaAFA4JGWiJBgWI1cNQcEYAZDOd8x0F68UCLIe1BjrIJ9jEhVv8ktxgC+GCe2JM2tw5ww+w/TmEyRnfv/dQTZeBQ3ZwXbwgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lLeNWElfrErBGKGazwZWkZE9bsjqmoihrSMo40qrzNk=;
 b=Pw7dEDFs7whgXALTW61MX12s49NeZYk6zV2mKBelOeGU3vTgfnYVbJwMnF6AEaPCscMbiA+DBGgcYpHru9jMB3Es5Y+g9Nj68liIndKMzKJA55mR3hYnPyvk7s0y8MZQtszcdxdZ0Ug3BnNUxClPJE52UGAxIEwz+VRTxm5Drt8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by TYYPR01MB6650.jpnprd01.prod.outlook.com (2603:1096:400:e3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 03:03:57 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%3]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 03:03:57 +0000
Message-ID: <87qzhasezm.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 14/15] ASoC: soc-card: make unbind_card_list static
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87bj8etuj5.wl-kuninori.morimoto.gx@renesas.com>
References: <87bj8etuj5.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 28 Oct 2026 03:03:57 +0000
X-ClientProxiedBy: TYCP286CA0140.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::14) To TYYPR01MB15175.jpnprd01.prod.outlook.com
 (2603:1096:405:27d::8)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB15175:EE_|TYYPR01MB6650:EE_
X-MS-Office365-Filtering-Correlation-Id: 4866e83d-1449-46a2-0669-08df34a01bb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|52116014|376014|261009223027099003|261021121427099003|261021123027099003|261022105027099003|56012099006|10067099003|261026140227099003|18002099003|22082099003|38350700014|11063799006;
X-Microsoft-Antispam-Message-Info:
	xDe6wf/O0u2wnwMg+nd7FRSV37hST0bbJylMQDv2RFPoAya+X7yOWZH4ICeAQIUEb1PZx4defAIIAhyeFHrTiyHQDl19fdNQaemTZCx1p52CRPlPH0enQMHXR40TdV4Dgxi+HfUdHG6ApjMW6GhNsy8uxzt6nGYtPxqdBjL+DtBalCKon2Iqjhl6w+1fwY5rTPg3i+zqJfhR38Zoh1whIxKxBzqZX4xm4/njudfo9/EiNvQkk6bRLoKW75i0EsJGSqbvkFedkZqmNV9C278+NAEWjb5ajrjo+Kq0e4WSi+p9cN6wnCboRkAFgkB2KBQofdP0ng5snBqCeXZRmx2REU9QXUFt24fCT3xNGCys9bPBZRX31QsSJWutWxdE/5/ViuQ69xHsqgSYODruK/V6BIyGc7w0YuCa7WOEwMGznNx2D6aYGWFFht8zv1ZS62LuYgrkCBgrTAVvHbTsf1RaG2aSCRNhHWKJa5PxP1BH6fWXtO0ze0yVg9mY2wtnK6gqlEr/SBr5L4BzigCuInae4f3z3pXSX2ABdpuizre7Mw1O0Y/2CRBEfD9JGMBawV2aMEVC+2s+E45ZHYic0y9ZH/MXfO5kRY/wE5AsSeO9r3DntfJQZqgrzq7enryNNhcEjmpbcVjfCVoYhklgVUjeuZTl1KtvlLVrTD8NgHa+mayXimPvf9iXYXJEdheTgZiVu2FuPePWiDKiaAigIraiUwqPMFKq6cXbpP/twA5gBG8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(52116014)(376014)(261009223027099003)(261021121427099003)(261021123027099003)(261022105027099003)(56012099006)(10067099003)(261026140227099003)(18002099003)(22082099003)(38350700014)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DqRdDXbn3uYcKxZ6gp40iMFophCxKPIA2dQxhKLWkEV7PVbEns+Dbw0pNXlo?=
 =?us-ascii?Q?qDCXRKnFLpCeq5ActIbwdHtGREZrMiFSQTvZFWL0zGfPOaRtSBgALoMAWl7e?=
 =?us-ascii?Q?Zz9781bbiDB68xiH7pKzAJnjiVl+mDi2lDEtvlLUPbl+gksjR+7v55Gxp485?=
 =?us-ascii?Q?uRlGBU8XcViZzUUCf0QXqCezDmu15hBJkLMGZhMcv0e0HC30J8JGSxu1xsDx?=
 =?us-ascii?Q?x83D4YWk20E7w9gjkhzHj0fCgSDUuMwGMxsYO4rsUbMJvZnDgiyejXhFg3Dc?=
 =?us-ascii?Q?8kbtnvQJS20Pd0yRWbJPtFaudbFejyCEhjbhklqZTEphUZ9785zrKoJF4Ges?=
 =?us-ascii?Q?4y1RPB9+5cR1C34GgCvgW+QEI5ZK/X5IxsB5BpfIjoke6OuNbJLc0yr9u3Hz?=
 =?us-ascii?Q?wy9BgHH0dLR+yQuFccsrBmUCzmmHY5c4hWUcDT9P5QxEbs12z+3gUh+HKyPh?=
 =?us-ascii?Q?/pZa7Yfj8PN8i5twlS0cY0Pn+7AvlsB9/SmcD1VdOECRLew/xA8Q6dJuK9WK?=
 =?us-ascii?Q?Gc6a6SzLVt1L2ze5rxAx1o4gnAVUlyORkPezQJXCGfX+Ml9lMdh9KCJSWzBB?=
 =?us-ascii?Q?qb3tvOQa0m2zy/A9Ry1i0Pnn479e6T1HgaB+4nFgbuwMUVCieNnTTMhoATpD?=
 =?us-ascii?Q?oN2PbtYz/klRW4j4c7/z5yck0SY3pmPnhkFuP9HN1QVwWyweBmhskzITUQfq?=
 =?us-ascii?Q?RwHSl0FRfXEYJ28ALXqz/6KwacCyYyGz8pVWlAHR85gnu8x3UbIU3amULriZ?=
 =?us-ascii?Q?ZzHCJBtpDDadwLaWSXU07fSQMWw8z8XPnfBcXwPNVmyDkCImIMHig6/5AOYc?=
 =?us-ascii?Q?SvZFTLjUfgZsVKRU9P+WCs3mRFknjy4XK3/ZQ+cY41nLil3sjQg38MEKTghU?=
 =?us-ascii?Q?2vtUejHV8lRD9sNicLTy7ERDjsSfk1qng/fPRE0Jd0HpTZ2iSzBBoQLLbopH?=
 =?us-ascii?Q?evwQVVF1eTfXK6LeMeVBXCz7fuQ2V3uU/T7L8HN3q1Mc2yCrGFiDEpeFNClM?=
 =?us-ascii?Q?0eQ2ybL+rrP1biR5debug4zYoF+tn8QCJm6kTzuV2YxMuwOqjaFnhAKGPiwy?=
 =?us-ascii?Q?OB5oMunJiVUVXIdTy9+8bOZFUdCqpwEHpEzp51ZuY/cJBwoBpEYvA0s61abT?=
 =?us-ascii?Q?aFyNo8AQg9268Y2AjL/hh28YSyeIkpsXUWxuAydtn/UWE9ifxniqphG5G05a?=
 =?us-ascii?Q?Q6okT9hL0z5oNj0tvvwAqYqfNrCiexYuzRgQezaHGDLcPLa18Q0iDN7i1NHP?=
 =?us-ascii?Q?oZZ2DESFNWzfOqaZYN5NL00MSBTEwS1o9jLiFan8EAUb2h35KIB+3i6eaC9F?=
 =?us-ascii?Q?/QYLYKEeJj8qHmm22PSijGidYBtYMij52qJEtgJv2O/0tLws9IyYotTDqrW9?=
 =?us-ascii?Q?RndY0mb7mz3DIQ+r10FeqbDFe8vMAaNf0m40ulFObWfF0bU5BnLbRcuNc+wx?=
 =?us-ascii?Q?lsJN21mHzcHw8HLjzyg/pMzc+Dz6emrrfCSrOsULTIxGZuFdjGYzujedbIIr?=
 =?us-ascii?Q?nbCDk5dRPQfM2LgyWUU5VzygfRKMnvYVkHvUbAEoLzMSpWXz9mI1rYX9a4pf?=
 =?us-ascii?Q?CXWzgzimdtLIlauByJmpxp5xEc8CwvZPRwqqia2J+tcMS4TsHpX4IgMkobRH?=
 =?us-ascii?Q?BorPn6W3oQyhNvZY5e+NraXSoRWhIOmIjU9ZvRSQ7sLL5nM2P6GN4T5XGULJ?=
 =?us-ascii?Q?GejDdFaqnvgjkWRh/UjeW4ciYe3NEsxJBE4o6dClRulnaprD7OfsFkDw5lnG?=
 =?us-ascii?Q?NxRqjzDDmed25b5swS8ffPVOL/ZUwun5bMlcxMOIWpdm6GH7eu5s?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4866e83d-1449-46a2-0669-08df34a01bb3
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 03:03:57.5526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zWbacigs53P2l3RerCY2hegvK0avfDzheHjaffGoRP3l4XxYf+8HAh0m2hviLo2BH8wnrAU4+jP1NwBF5iw7y0h7tV3M3hyIDUn+UMKlp97+c8YzWYrsV5W2UxdylI3p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB6650

struct snd_soc_card will be capsuled soon, its member will not be
able to access from non soc-card.c.

Update snd_soc_card_unbind() and makes unbind_card_list static in
soc-card.c

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-card.c     | 10 ++++++++--
 sound/soc/soc-core.c     | 12 +++---------
 sound/soc/soc-internal.h |  3 +--
 3 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/sound/soc/soc-card.c b/sound/soc/soc-card.c
index f6ff99bf8a601..959b56be0eedf 100644
--- a/sound/soc/soc-card.c
+++ b/sound/soc/soc-card.c
@@ -17,7 +17,7 @@
 #include <sound/jack.h>
 #include "soc-internal.h"
 
-LIST_HEAD(unbind_card_list);
+static LIST_HEAD(unbind_card_list);
 
 #define soc_card_ret(dai, ret) _soc_card_ret(dai, __func__, ret)
 static inline int _soc_card_ret(struct snd_soc_card *card,
@@ -892,7 +892,7 @@ static void snd_soc_remove_device_links(struct snd_soc_card *card)
 	}
 }
 
-void snd_soc_card_unbind(struct snd_soc_card *card)
+void snd_soc_card_unbind(struct snd_soc_card *card, bool reuse)
 {
 	if (snd_soc_card_is_instantiated(card)) {
 		card->instantiated = false;
@@ -900,7 +900,13 @@ void snd_soc_card_unbind(struct snd_soc_card *card)
 		snd_soc_remove_device_links(card);
 
 		snd_soc_card_cleanup_resources(card);
+
+		if (reuse)
+			list_add(&card->list, &unbind_card_list);
 	}
+
+	if (!reuse)
+		list_del(&card->list);
 }
 
 static int snd_soc_card_bind(struct snd_soc_card *card)
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index fd46906cbca96..ba02f244f7954 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1246,8 +1246,7 @@ void snd_soc_unregister_card(struct snd_soc_card *card)
 {
 	guard(mutex)(&client_mutex);
 
-	snd_soc_card_unbind(card);
-	list_del(&card->list);
+	snd_soc_card_unbind(card, false);
 
 	dev_dbg(card->dev, "ASoC: Unregistered card '%s'\n", card->name);
 }
@@ -1401,16 +1400,11 @@ static void convert_endianness_formats(struct snd_soc_pcm_stream *stream)
 static void snd_soc_del_component_unlocked(struct snd_soc_component *component)
 {
 	struct snd_soc_card *card = component->card;
-	bool instantiated;
 
 	snd_soc_unregister_dais(component);
 
-	if (card) {
-		instantiated = card->instantiated;
-		snd_soc_card_unbind(card);
-		if (instantiated)
-			list_add(&card->list, &unbind_card_list);
-	}
+	if (card)
+		snd_soc_card_unbind(card, true);
 
 	list_del(&component->list);
 }
diff --git a/sound/soc/soc-internal.h b/sound/soc/soc-internal.h
index ccd6a7baa4f3f..255e06466e925 100644
--- a/sound/soc/soc-internal.h
+++ b/sound/soc/soc-internal.h
@@ -17,7 +17,6 @@
  * REMOVE ME
  * Temporary definition
  */
-extern struct list_head unbind_card_list;
 void snd_soc_card_debugfs_init(struct snd_soc_card *card);
 void snd_soc_card_debugfs_cleanup(struct snd_soc_card *card);
 void snd_soc_card_resume_init(struct snd_soc_card *card);
@@ -54,7 +53,7 @@ void snd_soc_dapm_suspend_resume(struct snd_soc_card *card, int event);
 /*
  * In soc-card
  */
-void snd_soc_card_unbind(struct snd_soc_card *card);
+void snd_soc_card_unbind(struct snd_soc_card *card, bool reuse);
 void snd_soc_card_rebind(void);
 int snd_soc_card_bind_call(struct snd_soc_card *card);
 
-- 
2.53.0

