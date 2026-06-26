Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011034.outbound.protection.outlook.com [52.101.125.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B7D3D7D9F
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 06:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782455306; cv=fail; b=U/j25Vwt1Nj45Xq1S+naL9UnRPUWms3723QTV4xUyNoA2O4wYNOFmSdgw9m2FoUmCGYI6BunVcaXJNzFnTZzORmBKR4APmeDw7Shh0iyqqzpSmo6fnc3dMAHoL4tFdPX27FBaqxRiVISwCU5aNBXJHR8/7TbF2MpopRbykezNoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782455306; c=relaxed/simple;
	bh=U3MO8Ai5jbknW9owW0uQzwze6eEL68M69/9fDyj51gw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=StxfJAZyl4o4LtIarUumJswEKfm0uv6uMzG8C6pw4uOOBME3H4kB1hUYEdquZfK0iMgSdV/iy3vdRIGc8hjdq6gb6sF3qhsjoO45L63FZEm7vkhGMe5kBlpI1wceu6bMwgIPc1mQvik1QSfnyQ9ht3G9pNFM0k8g7UL0Nwf4VjQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=aZJAo2sC; arc=fail smtp.client-ip=52.101.125.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="aZJAo2sC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oOrLeJD8t/+izPRt5JdWr0eU6SA88V5BzLIKlFccnNqgE4nEfO/pDTMo8Ydwwmnlz2qAerzNWuDZloF768LnpX55WUeOGX/NyM/zulZsd3sE9Gev6bQnvAUUioDsmSacGDy2VDF0lDlrf60t/oZBHtdE+ZWZ8tFTO0SuLq8es65jXXsgLf99FK9poY/eEujcFMgbCLRmE+K5u9ay79rufdH+KRBwSB9msu14VeENckHI6lM33wBvupbmDPNF27xohEdvifNLLYVdKQIGzQcOgcKCW+S5W0IZK0n5FklxEsYdTeBEwt91PsGJ/O7SeOkuSQZAkz2v0nTG7g04FnVYnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cAwGp0gYK8bNzv6aOVnvtfF0gjOifnfaEBqrj3TWbAQ=;
 b=hYxJKUP5ga8LeDf/ZfUnnt/d0UMGdFppU2JX6leFJN67EUr0KiDhZ3p9yrg+ny+UBRDlji2+e1GZGrqKpx7F4kBct9tsIBocUGoMa0k0YgnJOJ26ZOvo7SSJlmRritqJhG/rl5hqv+HdD97XpYMSFKqY6Ub861y3yCPkH8GyIeHf7xgGFdVB4YY+qtl/82Oe+NmOp2lcPQanmShEZ8GiB95/nWF0z6CKrZgOloVRWpJcK3YzNDHVCMTRnWvx0pJERNUEXbRxPRHTYexRD2BLODkY6v6GZaNNlGpwVagX4tRBmIr9FBNBcrJlEWopzqfNGw6t7XZd9/czYDG2mrIVCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cAwGp0gYK8bNzv6aOVnvtfF0gjOifnfaEBqrj3TWbAQ=;
 b=aZJAo2sCZpbNGUK0e0uHSaHXfqiSIh2UXWxzRt2M/Y1Ti4093HTUyLnoipfR+l73KjoUvqxypfZxJmhIpW7N96i2ofQzifXPL3Z1qbqKB9IGV1/SvTcxlYAzxU6K2NWeOcnPD17XFsI2b3gCBvRPcRHJzYnD5fs031QAHWLvqXs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS9PR01MB15751.jpnprd01.prod.outlook.com (2603:1096:604:3bd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Fri, 26 Jun
 2026 06:28:22 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0159.015; Fri, 26 Jun 2026
 06:28:22 +0000
Message-ID: <87y0g1dddl.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 06/12] ASoC: simple-card: tidyup simple_util_parse_card_name()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <877bnlerz1.wl-kuninori.morimoto.gx@renesas.com>
References: <877bnlerz1.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 26 Jun 2026 06:28:22 +0000
X-ClientProxiedBy: TYCP286CA0271.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::16) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS9PR01MB15751:EE_
X-MS-Office365-Filtering-Correlation-Id: acee0216-6249-495f-eb23-08ded34c1f16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|38350700014|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	f6PZq3PrGKvZEF4bXokQeJnlCNxELQY254uvPPYGqpJW8P3j1JnN8ObVAnX25d7mNahlxv4vsjSGTId71s03TIf7V4AjXHUUb/CZ/IcPjZxe1ip1CToyyofH4FZZr7QQ3VDIStsdtXm5zUIBKd6a5BVbXtrRt7ug7gpEoDZ1ulOGRYkw2AWvpsJMWzKTR0VL9s9CkrTqcy4rIEowGPbIetRgljenS6Aij0XY2+prR0a6r58PJxJh2ZtreexUKXYg0iaSKJ6L17GlvZuWSwQNtEY3sxddq2+9cTpQJqz/tGeTtKN5VDB+1j+2l4r2wj3B86CLy1yAXvndhRzG/jQ7F9bogCphLAE8rjO+fBCPFPHM49sUedzbMepae3YCvwO655CpFJrP4lMoYZ5hxfHw67yjElodyE4CRajUvu+y+DKNcgVZSP44vd8/+FykRU7YXYcZMP2w7oXKDDL7CdITLNAPxk6jMs+euq47024/Btt4VpjMYfS6uMrTAwHNaaoUApOBWTa0H+QhP5wiP+HbclEBte2fbep1go9+dErwcHlM8ZJu2etQMNk7555u0qMuk2Jo6i/3Rf0jIG9V0h+UqbY+n2xVPF06F+BvHIQ4/slyIhIs7w410W/jJWqqshi4NWVBPhI6Rnl//HCFCH9snsHaDk6hSjMakAzcPO5g8e1Y5X+gmkXZd0Gre0DjXsSFKaNVJdY4WKF8d/+2sTik/dg4S6RbLKbVKiThea3x61k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(38350700014)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AdtNCahUyUDAUXX7YHtasQhrjtS9MiUkEp4jC0UGbOh/ZhdrfVEHLZEsz+TA?=
 =?us-ascii?Q?9rKiXPkhXMrguJ1uc1CR5xbkS/LeTEBINgcK7IqAMpLyKrgz4LnsbPXsde9z?=
 =?us-ascii?Q?dBENtvIAqkj+Y4Abqb51eQh2Kr5THg+K+CSiareOmk7ciDYGtCaokd10RFy5?=
 =?us-ascii?Q?3sOMMq1K81ywyWEiza/hFfY0GQ455l91dUPbOOFvLi2p9QGmL7o5w8vMV0M3?=
 =?us-ascii?Q?qP6jgIEZTjOxUUQnYofTwEEF4OORNi6ShSa/menmYdy9wNELwzyT919qHiJm?=
 =?us-ascii?Q?bx1b1oeTXkgG/Ecengl4juXhivpw69hBWcoib5NT2nf3L4U0zdkh+9pIYqAK?=
 =?us-ascii?Q?GU6bK2bAdipZVemYyMZSy2qKBSLQEHWtD7r3KU9jz3Q5lH4kl4vsOr6NDrqO?=
 =?us-ascii?Q?KwkkC2BaKeK68nXdfq/MY8hrB9E6lrYP9jOiDMzsXeTlK+VuBnRnj7tsY8MN?=
 =?us-ascii?Q?UXyl12Mk8bAFpQ+kbh2LMfIc2Y+77O/SQnvpR/6+qQzS8OZePzU9uHL90y6E?=
 =?us-ascii?Q?WnyYb7bErLbxw+nNw8zUwdem+j2j9pQhRFfXrQ0bUQBhGdKoQVnRxawcL9Sb?=
 =?us-ascii?Q?9u26YJReuv8P1lCi5vRlOSMA1ZwjYdUS/u2oba5UAcFHvTt2vydSnIFiiLYf?=
 =?us-ascii?Q?4iOhhzqJB0OMcf81AID/0deVT/JTw5E1ZgW1EbTdTBpxbrYKqEitPI7sNgUD?=
 =?us-ascii?Q?SukD4sl5ScL2WN0IjNCPM61TA7DFcAqaHyqnXr18ODbIUCd/TN2Us+IhT2Wb?=
 =?us-ascii?Q?mCTBMEfhGk97Klvc2dvyQkGIIn2tkALFE7n5oXAWY4fa/TWhCsZdRuWP0nVH?=
 =?us-ascii?Q?ssqNtr63xFctTKukANx9CgXGtrq8MlAmXq8mBhZArXLMJYOX1rYost77o9YM?=
 =?us-ascii?Q?ECUZFmwOccxVV/QJZGmIyOG79wuKkUMNnYgRoW4y15AFDwStLldkiyWTlO+I?=
 =?us-ascii?Q?x+zLq2z2nseEk3OOVR5jpIksQHGp5Ocf5ysNqlQNV+01DNEA0VC8AZxG+IDo?=
 =?us-ascii?Q?OQg66VD53vb4m/vQWU9RnzEcwLUxxAYnP7hnxcvWgvCGRcGlx3O8yWo0tT/c?=
 =?us-ascii?Q?L+hL25i/DQMAjgIFbg5dTnaHForrEAJv0ZBKTaCY1OD3KuylOZBZNlj4Ypgq?=
 =?us-ascii?Q?DaSU9+gMDoN1sOcNZxtN83gqi088nPfDdgc2n57VPA2RP104NOfy8JwO5Gek?=
 =?us-ascii?Q?NStZzdD/POdrs38bMympZNrXgavMtNEMaPWQYlvIv+wCqbYCPzCbYpX4oi2M?=
 =?us-ascii?Q?Dxwc7j8dUbiFAHmWE92796HO39uuT/Ckt9bUQQ7qQb7sI1QQdnqblMJ7LLvV?=
 =?us-ascii?Q?gPpk9ZdW+xt4gDZTCAEls+OpBrk7w+qvNeAsoQyOOPTKjTIp+jztG9yxJ9IB?=
 =?us-ascii?Q?dJYop1gePBEFYOkY5LMIL9C0aQBPzzZ1n1F4WKcfWC0l/fyZIo0pcCOruvM7?=
 =?us-ascii?Q?jTjH8KAyc7szpoaBVuI6Tsa4Ey3wFjnoD2G/wOKQbhY/wLTkfWGcuEGUBYw/?=
 =?us-ascii?Q?XUDsJa423bFzt20XdzZdH0IbTD167G0yxgG5DG8ZyHNdjFqlupnQcyoOrja+?=
 =?us-ascii?Q?xoD0DedoJ5xi0hpVlOw4rHiv+j36fyKVBYEuTrh/TxZpNfstY7m1o/Uai86l?=
 =?us-ascii?Q?w5pc5bYrklgHjLIcyiwgT2IoPftwUDE8D2WR6Tr1ymHLqXmC45+mMsqEkuZY?=
 =?us-ascii?Q?NKrkQjoCiCncqNESeUlmBBCyKt3zP20xncyGTTRvCCnNhzSIlAtK6ezPz3q0?=
 =?us-ascii?Q?+kjlao9jw+cUelW3L2JLPqaaqE1eWtuu8tdSucbfglsQ8loSw2yF?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acee0216-6249-495f-eb23-08ded34c1f16
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 06:28:22.6940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6JmJ9VrVPuirfdmuT4GaXBZG09jLOf8Zt6duZF0CpedGySJbkkdYPlaLz1gvfapcTcdAa8bin6bB9KhALO/BLF/KkPPNrllxcGkMnVYk3lnDpv7PX/jq5NFvm4QvJpsd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15751

We can re-use simple_util_parse_property() in
simple_util_parse_card_name(). Do it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/simple-card-utils.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 522dd1e3c96a2..4630a9b87d810 100644
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
+					 prefix, "label");
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

