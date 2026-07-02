Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010051.outbound.protection.outlook.com [52.101.228.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48449632
	for <linux-sound@vger.kernel.org>; Thu,  2 Jul 2026 01:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782956759; cv=fail; b=RTb1HVn2Xh4JHv2avgF1v2HNZ16+Yloc520Mrfa3GXhLdxRRmA3rq+4fY4e0jFrMxrNCgbRB+0owVC5CnHEl+IemqHo7CougBx6Im2+o7gZ2x0phs+eOPxMTE0JZuVPklitqA85ZkHnc8TXB2kiPUmOFi56sfBNvMuISLCHbC+c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782956759; c=relaxed/simple;
	bh=wFMcOcLKq/uGsiTPUxnpQ5MXSjLEAlh3ZahJUHMPq3M=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=NOZ9a/a0osKWP2zZugVePsBs+28VtWY5FeJftT4Y+EDzHkqANJH4O20n5LJYl66R7lMb4Xw6TXrsNKJpw5aVBTz3PLEtFMina1LtnrmXvahoG4AN6LhSbHIwK6NFz2sdsYoAiO62Mg2+KWIO9gz7X/6NjQgtWCAMcliEr3dSgn4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=fPSWXAuM; arc=fail smtp.client-ip=52.101.228.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="fPSWXAuM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v8uXwhdcveXAPVpjHHT+i59h7Wg/keTOUm4O/KUDCP3R007lx6hgcQ8htwPmASocetWIUVmb5lLJl3GsV++Frt6coKFt3+KSZXGZqZlUY4kcrXWXz1fUFvy2JCC2MF1vyN14A7ysnXd7bD6iyEBbUC+XbrOh7Scw89llR48zE5eWBYCZ+FlAwTkuRcNFdOsS4xISM8npABu5ZahmSzC6/IqpjSIKAgL2HA0V9PQ2StquYwebk1RrPCyZE+ieoQJ8oNXiv7y1K3aHts2BCPUr2qwk5cNhc0Hs9mdXXM0xVmxAAJimzg5MOdwhhCzcONDD33eW46qHC2fpeP8vmyXeYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eKNzLqd0qGlfNmD/c0KTq1lDPKss73NS4tcZxkWiKzA=;
 b=pwTaf2IYmx/luYlQ9zG5JXjrqVb637idFOiQwWjUDKu011OOCRIfQ5jKYkoArg7GIhqggnK9CEnfvxhqY+7v1PXybaX58n1+/tyS2N0EoamT2qQjZhHwl8Sxbmz8T+teFPpXmM1iK+R2231e063EwwhoxW1tzYJaN/cAd9+WnLLJnuGURAX1ZrQ7EEEoK3j7IMKgm7PpfW440exfBoxTofcl72uv0ywvEDFek054eROnLqR1ZYWexIE1z7kC8iN/RfzbnF0Eo0p0knu22oETQpWbn/twXPi0F9Y7+Lm/+XMqvcbTTyCSL5OXdxzmsjjnkA3CcNM+6pdV+I+EzgKFJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eKNzLqd0qGlfNmD/c0KTq1lDPKss73NS4tcZxkWiKzA=;
 b=fPSWXAuMLUDb1yVtIQfN4+Cb9sE9dQk1avyUnG9iXPnbXpc/paruT1y833R6+4qhx1MEmvH+vFSMirnEyLdXfq+po1IjTdWa/18PTq3HmNIy0NYj0lpdA75oXPKqktncPvM6VFKu4sSAvqVKHJ53r9E/jKqiw+cOvq4hNptGyBc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com (2603:1096:604:235::9)
 by TYYPR01MB16053.jpnprd01.prod.outlook.com (2603:1096:405:2e0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Thu, 2 Jul
 2026 01:45:55 +0000
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834]) by OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834%5]) with mapi id 15.21.0181.008; Thu, 2 Jul 2026
 01:45:55 +0000
Message-ID: <874iiixiy5.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 10/12] ASoC: audio-graph-card2: tidyup simple_util_parse_xxx() in audio_graph2_parse_of()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87ik6yxj0t.wl-kuninori.morimoto.gx@renesas.com>
References: <87ik6yxj0t.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 2 Jul 2026 01:45:55 +0000
X-ClientProxiedBy: TY4PR01CA0083.jpnprd01.prod.outlook.com
 (2603:1096:405:36c::13) To OSRPR01MB11811.jpnprd01.prod.outlook.com
 (2603:1096:604:235::9)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSRPR01MB11811:EE_|TYYPR01MB16053:EE_
X-MS-Office365-Filtering-Correlation-Id: f2ca54d5-3416-4e55-964d-08ded7dba81b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|52116014|376014|56012099006|11063799006|38350700014|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	hTB5ZN1XGahTJAVW06npooVLkzc7POWdrEf54z/12/OGqfZ+sivHKH67rJxAfvODvOVSgugj1vHm1dnYKFNVRXXhh8E0hvEHc/dALY9AD9fwtff2If7R+oL8m7wX7YBtgFvP+HlOtZhjtdemTLeURq1pg8Vp8m3ZaqsQglBCY+IIa1e4lTmzEeK5Ju5zF0wxwjJWUwEctJGCaKm8KL4heLQVAi2pRszkvurBpHCGz25VHUx08rIwYTBieaFq2lYP7V0GXH8WKa+xq0Abwh7mW+XgSKSEMUjd/4jiAT/Sk8N7IvqbjHejXimWuMwUpZGrEoSRa9o897wXfeZ2juv6mIc01vfXxVB63OAai/wyJB44tENNWvENRTj0PrFsfuNahMcrXl8KkkjpIy3w0o0sRq4jFMlm4EINneMgkMJFxUXBf639uyYMCaLUwk1jt6cW636+W6tj2Fk/9csw22csBNC+GPZ7u8wCLIlbFE/qOSXIEhTNGcNyKEbQ5DfFCdyiXvlUf1mRd6tmI7FifWVSTrpdLXPg6A9jpMmVECOAvYK0e/kHtn8fyggGdxRufnjo+VHXXpLTWMhv1MHXwJSPPi4enUC0zU4ZUaAk0K8gDxofmFM41WZtgHwxDWzZkZeoqaz6pg7Jv3ZbZB4bgGKQq5c12/+Vbsv9eNHmpRt46dIqpHIm/NyWDBWbwiJ0jU/Ur7uWmbmGHEjMAi7k7SzuvBvMEUeoikF7k4bWU1N7u1k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11811.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(52116014)(376014)(56012099006)(11063799006)(38350700014)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lWeq/hVEV99Tc/EdsPAMvxIgTGaAGtNNvIltvFaJp/nXHf8fK13kVTP2Udn4?=
 =?us-ascii?Q?MAGBSaP8FXEfmpMuNkzY/ChpcwptpqPE/48dA97N81JNODDbTil8dfn/hYbk?=
 =?us-ascii?Q?gWB0b1qlkg+eZDKK7kkjiZg+Z9Wh2WSZAbi4ASWLMLppW2g+ftJv5rDEfYNk?=
 =?us-ascii?Q?spnz4AN+o1lHeB/atvFNtSTbNPtXIdfynjHYchjkjWACRAKY92XRRZXMTuIL?=
 =?us-ascii?Q?Kq2T2CuMNVHXNUPVvOpk13RseBRNWkMcGXdlTRd8Z8HkhYgfxSDDAkdmAP2i?=
 =?us-ascii?Q?dJ04wIE6t83iQiAyp20hMwMvili3pixCjRGQ1/UO1g0qD8NcQp9ve1YZ8xKx?=
 =?us-ascii?Q?dYKyMLIJcJ0GsnZyZcnky0NaUBeSm/yWa7s9MAyXR1iqEPvDm3zYlJwPRrAx?=
 =?us-ascii?Q?t6LsQaExj1rL1KauDvAjCAen3tI0Cr44MldgVUSKHVsD2YGjrk2OMs8T5GI3?=
 =?us-ascii?Q?OFJ2pEs41BEB/aqCOUjpancXA0QEF4sh7doFfjYIP6C+lXk1G6x4qexjraAj?=
 =?us-ascii?Q?K82++hBijefw4LCuf3+/BGtUXNfjmHCcfezInqcwLH1bi6BRDKbgqus0LySw?=
 =?us-ascii?Q?k0Z38r3HeYR19B6yu2ZQNQ+518/QQ1ZAdypKi9GTueUJ1N20FJRFI9zfTTi4?=
 =?us-ascii?Q?uvm5oDWi3q0aou8OzG0yHmam/Ml2vYbXdXT8A9LRuzoJbuZKSPT9WS7cKQNH?=
 =?us-ascii?Q?AAhL7i2olaz62Yjwx9zpa2eReoPZnXPN+8JVRnfv8jYILqhIc6eg3F/T9tcC?=
 =?us-ascii?Q?8AbggN8VJwPasiNgjWjeoSj7ucHNGop4vJZU46wOE/0R88jyIQPEVYlVRZ71?=
 =?us-ascii?Q?TKB+DHwMbLDyUy3vzihyL8Vfmab2CYkko24rG1NfLwYcEgEhOEcQcpGPKQgu?=
 =?us-ascii?Q?rgxgnJY+2AF+1oNqPOZ6/P6H4wEWeTNkpeoN4MGUN4Jm29pootZ4fcCZdtOp?=
 =?us-ascii?Q?bk9ucPnWQZuKMuxeOan91kKAXuaS9tGEXgZKwzZCVaKPtoBhPvebosfq6dUN?=
 =?us-ascii?Q?I6VMIrVs3AAVdtdIJErAzF8m0A/E+gxc+Qbs3tlyLzS1aB49+VGd8xhFpF8P?=
 =?us-ascii?Q?NQgmLaq3725iWzwEAZrE4WgJ+pTvGy09KHM5oR9m/3GueGTjeqlhtVWODzD5?=
 =?us-ascii?Q?vTLy92UEu92uqXkPNtQwdSCB5Yc6nnIyCKKPy1vDijNocQ3Wr4+Xs4Gq8KUZ?=
 =?us-ascii?Q?/OQZcKbYWZ+AJKsOlDKSoSBzW2SgStgmo4b1FlIewwrN9f601jHGQgiqSy6f?=
 =?us-ascii?Q?M+QH7Ohbvd2n/aUO9jsRSI1SAPQverQqHQINEmmz5O7tHTZ3v4Zk05Cfm7ys?=
 =?us-ascii?Q?vouc7gCMZf3gUckAiUllKPYoeVK9d/lFMamOo7UtgQfGF5f+Lo0iiy5oJRYa?=
 =?us-ascii?Q?1TgeKLm5QM2UstGdvq3Y8277c+NtYquKii+WunpX3me28lgSJitUZZk/sOgV?=
 =?us-ascii?Q?tfg+pLt20LsB7r3KNJbmtBgZn28qiPAOr4YJxdNXTxw/oQwq+QQpK4WKvlEA?=
 =?us-ascii?Q?eEo55a5qRsDd8kksRWYEkDB++gjeg/Q/7On2++HtqMYYTXIFr8aqBOGxvuYx?=
 =?us-ascii?Q?N27T5sI65Wj7Mt/f6rTKNwqJm7IcHKDUOdoqK3g3tcwe6mey2Y+4nyAUXWxW?=
 =?us-ascii?Q?UuVzlvgehMxlj6iupbzr88PRrjF1QKGOeslz5BJYs6pYpDVQhstdizgf6y9U?=
 =?us-ascii?Q?stkxd1HmMxxpb/WTNuVr9dBJrzWemfftvXRJgBYJYYF41VYxehaboWGbMbVv?=
 =?us-ascii?Q?HkgdhlDOOPTqhbX0FxPtxM6jHi8mgvB0rto2YTfjW45Nvs91695n?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2ca54d5-3416-4e55-964d-08ded7dba81b
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11811.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 01:45:55.2612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3nR6GLpcHz8/nowxey+EDalwV1sJxWojj8IVBCrsa0KYGhR0zV9P+PKzc6f9r0Sf2aKgBiY2NWDVWPkJb8rJ2nDjIY2lcIGO5kDcpE9Px7ykiYpqJE6ieFCQZNKOiecr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB16053

audio_graph2_parse_of() calls simple_util_parse_xxx(), but are random.
Let's gather them all in one place.

Let's keep same style with simple-card/audio-graph-card.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card2.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 4dee282766718..9ef7373a6ca63 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -1344,12 +1344,16 @@ int audio_graph2_parse_of(struct simple_util_priv *priv, struct device *dev,
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
 
@@ -1363,10 +1367,6 @@ int audio_graph2_parse_of(struct simple_util_priv *priv, struct device *dev,
 
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

