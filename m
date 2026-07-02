Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011037.outbound.protection.outlook.com [40.107.74.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86BE2DCC1C
	for <linux-sound@vger.kernel.org>; Thu,  2 Jul 2026 01:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782956731; cv=fail; b=DURjCPvZK7R3n/ma5q1c9MSYstyud3izReNRSLodCI0yGAf/vUZYxXaTx6Z4BUK83oyX8sMeM2MbHb4HvvjFaB+TR++6O1EdhJ1kUig4vL6SKgYAS2DXYCcm6i7CdevEwTzBnzZBkb0B2ixRznjgqR/LgwS/KivBE16U44Re4T8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782956731; c=relaxed/simple;
	bh=rq5TMOKfiLLv1xf4EDTVzkpjqaXFZoehxy0mVkYZg2M=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=etDBa6AmMHeb0VgscnpGwFkxF0uiYvIwMjHpXbXfpzMwvj5vL6fGdyT4dgT29qEQOBV4tjcFpI6G2e/mMVllPPoXUT768oOMdIUUHSQ4W+7hCmrRSB3F7JH2dBjGOCPAmtKMjwQW4B8QCpK8kyLXmgbRjdMPXzDcUt7SpqWQnJQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=KVjwDRMK; arc=fail smtp.client-ip=40.107.74.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="KVjwDRMK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rIksh410eoMx0gB8JNEXly+eePrURv7weQvDq3tG7P1mM1LOyzezawT/qcMSaXORzBNs5bbmj0DN0QwWqKJE1bfIOPBiDxVZ6oUKzSub/q7v+Cou8fwAFdpzkkWoqTUPMJNMvK71Pzj9a9UdbBqBUs7+yOCm1yJbkLUih1V03A5PScTARUgm6if8BX7H+WutJlhgM3h91BhhhjhERS0a3gFcTTSsXvlk3lxIGqgL+L0k2mgjAzyu6Eo83U7q5bJHt+MQlpdKXM503sf4wLa0Y7vb/bd9VVVT4lhPaaJ4XMve3z8raYrvp2s3ROnJ0Mf92ekrLQzzwWCxvM7oHtT6fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JImmaTU8nm3+nrVnOjhZdtkICFgfOAsuT0CeCnafk2M=;
 b=TcscJ0mL+rBBwthpNzrIbHFxqDZljfLWiZvzouChVUJgueITHQV4ku4YnZ4b9hvB2/ElrQOJ2+VRzi/Jc65WUX7lSHWDD/9ltGQYZdDY0EIsxB+zN3DVENqNZJ1v/L+CUTu8v0xybbwQ8GwzNLWArD7VCkUujEgiwdylc86JnQHIdnjkEfP5dBN5t487bUfu3ji5Zne/Uo0BhJQG/KLvMJjcVQtqo5NCvWSOncfRcvx1TToRKBx2LB9ltJTIEPAbwS4euogFpZakFdx8rl8TBOYRqKsPWawqFFI3KIfo/HFW1ggmop0HhEH/6MwTWCiUK1tTYQ6CYm0sax2UrocNmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JImmaTU8nm3+nrVnOjhZdtkICFgfOAsuT0CeCnafk2M=;
 b=KVjwDRMKUKh8EmLObnPXM3BQ1oVzt9uN1QnTPeMWbm8UEYIk+fPDJUJwhEvBbOt0YyfAGY+3LHs5RomgrJ/EqoVtSDZq1q1/NcfJ/7MDB1znFcJdjZIdH1b2zBo6wtjUOpatCxReK6FjW3pi+HZ4DkF+8ntN6husmrZjfREWtlU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com (2603:1096:604:235::9)
 by TYRPR01MB15951.jpnprd01.prod.outlook.com (2603:1096:405:2cc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Thu, 2 Jul 2026
 01:45:24 +0000
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834]) by OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834%5]) with mapi id 15.21.0181.008; Thu, 2 Jul 2026
 01:45:24 +0000
Message-ID: <87a4saxiz0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 06/12] ASoC: simple-card: tidyup simple_util_parse_card_name()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87ik6yxj0t.wl-kuninori.morimoto.gx@renesas.com>
References: <87ik6yxj0t.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 2 Jul 2026 01:45:23 +0000
X-ClientProxiedBy: TY6PR01CA0024.jpnprd01.prod.outlook.com
 (2603:1096:405:3bb::8) To OSRPR01MB11811.jpnprd01.prod.outlook.com
 (2603:1096:604:235::9)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSRPR01MB11811:EE_|TYRPR01MB15951:EE_
X-MS-Office365-Filtering-Correlation-Id: 527e42f5-dbf0-4cd1-8d2c-08ded7db956a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|23010399003|366016|38350700014|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	PbVUwwOQ/3E/EMXKwlnuTpKScA0pRtb+UXyo6J1HSyPnZ1nZLYsKViyiRYz92LEq3conZGgqpse2Nk7+kwKBqBTVka3n5dJAjjoo4HhFN2S7Br+1+wsw0yksGLynGmaHx3/1Zot+l9RTTEKa1EUvPht/XP5Bdu7nCkENGansvSSO/QXZzokdGrNceUp+sSmww+gKEg49pqXfxCosOAz5ZEq/uDBIM8+jVjvh83uF/SGtNkF4TAXFOB4NQAan5RoKBq1n7ggXO917Kn6lKuqwjY29v2wFXBWmJmmSNKGOvwoAzoxQ5zFBZ+gnoemqCQxSsbXacmsSfeNBsSCzYvY3NxDLXJgYmy4w0TNtHiATd4AEfOsKcngpe3iUt4I7+Fn4PLrmiAZnSxd+NPOaoOG8EY2xCVxQuj78VRUjnNnkNVJ3o/ss3JJ9C/AKXwDxI8o/d6HQbYsKgTFm6sSKzoYyZjOFmbhHePB4yDcqe2K1BIvvhUrGumIfCGmZtNxoQ9FGjqck5ndd+igLBjCEu3KXgns8kGN12ybWKOvAbGonmhGNpTlRxSStU9YOBC9RkiEpwTpziwh2ezzP3OAOGjlPCWXjJDCLR/pcz0/M9vkm5Cc/iOwdl29/gH03t5P6yysRd4oEjQSJoO8UJ1GjB4zDy8aWpkXhpXlJnEphUDnibcgP6j0Lja/tKnLUrokq3zH18MHT9I+y3qCFhZXh0rQB4OtXoP+rtr+K6hwS/syjg38=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11811.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(23010399003)(366016)(38350700014)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dbAjat4WwZJvmEb/EyjpcHinmQfonwaOLxjl2PNG1+ivfJ3Rkqqo7GgerKOQ?=
 =?us-ascii?Q?UckDUeLsr76/nvUeIUd1oZmFdniPDst7rmuKkMvpHKGaP6GzgZyaw4ALPP0d?=
 =?us-ascii?Q?RYv4nsyKIgxyIbAw/hYI2x17n/t8KnqNxx27ChOBHkXw8zr7ZaDEuOD8KPpd?=
 =?us-ascii?Q?zVqM7GdDRTuGCZpb/2lauxgWRVOk+oILkUfyK/3EDEA0cryJWkTH+yDyCbTO?=
 =?us-ascii?Q?i+fS9/PQq60yBhB1858cCk3Eq/UJ9OQ8IVLygAZyd4k+cWQtxpPX67I81J7l?=
 =?us-ascii?Q?Lbji6FbR9seOKLw5WF44gvRC2mxqV1zr8MMUWaKVzq7OY/M9FjaKJTO8WSdj?=
 =?us-ascii?Q?dyNBPadg1F96j3CYbpL/RTQYhMksdU43xmSjcncT+k7lXkmJ0/xYlkPPGMx2?=
 =?us-ascii?Q?lQ3o4uX85utjxXg5+nDt8EU5UCFlo+ylNGFDbYAEf0NCKcNKhqqxtZ3RZyRg?=
 =?us-ascii?Q?J9IQMuV/LKkWYGtJEg1nN1AvV0LyfWLKYxoKcYD6aBBgOrC3gIHVkkRmzFyt?=
 =?us-ascii?Q?mLa3HNPmdQwhLdJCbnaqVHbBO4wWEPSFvzy9Mt8lsK8vQT5vYNsylhGY4rJ9?=
 =?us-ascii?Q?6E4aN3WI0bNXst7uFr3GKEmmLm+ae0dAuMu8midQHnOLxikCm0hDsFt6/DnM?=
 =?us-ascii?Q?msU0whXboLpoQFh+bLKGCdbWZSL5AA5LvJtRt9Hip9I0I1tAGzfbR4z+bXaj?=
 =?us-ascii?Q?MschUwhk/92VxY0G0QXibYsq6fqa11p4Jrw2Wy2AypgbzJc9/Q5wmFWTvEvz?=
 =?us-ascii?Q?0kE5Bbu6ypkpErMT+Qe1Ru1yImYzaLndbpbJq1tZP5uXIRm4OphL02M0W/Gs?=
 =?us-ascii?Q?4ywSEtOGoz4i5P1KRrtbHgth8iI6grv6VoFxKDS68VJ9KVRZlE55m4bmfniS?=
 =?us-ascii?Q?lRUifuzjkqKky56YWpqcopAslXHxyjO9iEm64S2wAK2krgAAQlt2Tb2GTSBT?=
 =?us-ascii?Q?7gkza7h2Mc5EZxXHBwkRRpAC0OpWTRiVUENWIxsYAJXu4XcApYkGAnk893Z5?=
 =?us-ascii?Q?8vytnrKi4UJYdL5yJybO9EyOyRRG8/hGA4vQhgtxiJVS/KSb+yewqkBWjhvX?=
 =?us-ascii?Q?t/4gDSYgHJbA3oLwknV79sCXgQNKBFAL1aERbDNmob79Z+iOi58skZwKfHT6?=
 =?us-ascii?Q?+ergn2+gw+kMZxPqNJAyF1JJqN4xwn0ig8NA+seKS7v8PaP/l8i3b8t97zTh?=
 =?us-ascii?Q?/yaeoagMs/+6HTWjhOtNVJDDBG46UeFBKoVYMgoUbxoeOovXRE3ad5U+Lfj8?=
 =?us-ascii?Q?rPnDKQiOOz5WvgUCr3BO7wJQ/vvmNjKf0BgzkU1RXtDvjokRYhURljks8ysZ?=
 =?us-ascii?Q?JvemORNx1S0UQpNmUE6lroLNyz9TQsddj09rEYMLoPG35KoNDVde4N3c1lIk?=
 =?us-ascii?Q?z70S1BbNM8pj5OK/w2EnFJnvg+6VdGa2MKnbvMM7BshIXQtOYqpXz6PLIXu0?=
 =?us-ascii?Q?XqESPp3bld4F4xl2BWGVhO/0F9+gO0Oodfh6wJeV6CwX2SyUSSLIsULSsoz2?=
 =?us-ascii?Q?tEuBzVYdgx1hP3+BijUtK3s/kNHpI6NWQRgyHf/e/WYki7Taz3uOIkSuVwdC?=
 =?us-ascii?Q?eKPwL6NRR8+PC/cYbSqepEyn1bau8gxbArMd06Qt+dwsxpQgzO9gZOcJK14O?=
 =?us-ascii?Q?oTeh06zE1DY3mshhAowXD3xtRcpYS+2F5uMeg0b+waZyVnmbPhj97uQNZdqs?=
 =?us-ascii?Q?1lUffw8uqhDuWRlZsXJdl/56juR84/0CtuyS2GbocvEgVM+E5F16iCHhlu3i?=
 =?us-ascii?Q?/y2U983F7QO5QhBJ3jMFuYdzavRQhcNTdEho076Fr8cxLEEYrLhi?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 527e42f5-dbf0-4cd1-8d2c-08ded7db956a
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11811.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 01:45:23.9394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SCSXuIj0ssp4F2Q5TT5stpy5qVferibMjjGXRaJfdi/16bYnHuqiOgp+v78EuXhCW8osV3eUZEqYE51A5cXkHaiTnNZtzI/hQkuvwYjvqOlpitXgLa9fI9WBszvwHB09
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15951

We can re-use simple_util_parse_property() in
simple_util_parse_card_name(). Do it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/simple-card-utils.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 522dd1e3c96a2..b2212629ec507 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -243,16 +243,12 @@ int simple_util_parse_card_name(struct simple_util_priv *priv,
 	struct snd_soc_card *card = simple_priv_to_card(priv);
 	int ret;
 
-	if (!prefix)
-		prefix = "";
-
 	/* Parse the card name from DT */
-	ret = snd_soc_of_parse_card_name(card, "label");
+	ret = simple_util_parse_property(priv, snd_soc_of_parse_card_name,
+					 NULL, "label");
 	if (ret < 0 || !card->name) {
-		char prop[128];
-
-		snprintf(prop, sizeof(prop), "%sname", prefix);
-		ret = snd_soc_of_parse_card_name(card, prop);
+		ret = simple_util_parse_property(priv, snd_soc_of_parse_card_name,
+						 prefix, "name");
 		if (ret < 0)
 			goto end;
 	}
-- 
2.53.0

