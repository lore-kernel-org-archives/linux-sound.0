Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011030.outbound.protection.outlook.com [52.101.125.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B7F2566F4
	for <linux-sound@vger.kernel.org>; Tue,  8 Apr 2025 23:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744155084; cv=fail; b=d+JuzFTCpswbj9Gqoz7qudJi4hTcrWS7Za71ZDAdVYSECFjuh2zOIoqQRJ4Fu2jCT1/aFYnHjntynBr1NpoYi4fE0zCARAUoNFm4quBQ6fkFLramujECJn6C/nSPVVVi2Nb8QjMFe1DgqEK6JFhLO5BL7s3mLxe9f7rGuoVuXLw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744155084; c=relaxed/simple;
	bh=/DSIpo8TmGSEofnvXEeY6AU6i3TbINEugFSNgCRVAYc=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=mSkt4Kt/JBFXkI8oGlCmSCdJRTkMikQof7ucSWKbKxLQR/SsxtwgxODKelHBiv8rb4RwnUPQvarBSNqIncRU+okOiTGRywK7kHEuO32al8HjSZPDkcL6aOOIHQa7AR2kegq2mS0MxVW7FIX/jFffCBCmKf9fQXcE9lQrFK4Xi/I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=iCRt57lW; arc=fail smtp.client-ip=52.101.125.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="iCRt57lW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LLyVRPvCefyJi2cYdxAR0Tj7Rjsj5fAjIGoEIHhD5RqOM+XBns26Xp+PjlNjjbKhv+qTiK4BFWapDt9amZATWYgjw1/5aoOW8VV3+yqjT86WcOtRsuZv1VNqwrFdU8GXfo9DG/p6YUF+r0IcD8dO1OEx29Hgq9N6ruELsyCd8MgBkeymCLXt4+7nQ5iRZDBmxclojnS6JezEdxLU+i1ngyDnAOtJDzWXpk5NiaMEDpN3UaRqzoDsE8FcWpvfnsNkwqDjfAdfwVjrQOZKXG+tOR/GIdVm6jnGhQbWoAPyNoLscETfBkK5UAH5kEgGv2FyygI0alJDf5KLKSI/HhvkmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=20KcE/U5pzt8ZmS1WCeOfV/5WdCpFVfKjiZqmhf2VfQ=;
 b=cww7S423mk/aD8UrILlUUzt7nLO09K335xFtbDJC69qiJ+AuuaGsH0y3l3LaQWTc8h12zNaXPARiQTP3q+0A3zYMU7/vu68pODoOlxIEtHVkLNEQD2KzgcoKjfOD7TEa2Ls55sW4dPmDlRTWcejK+DHXxh9vIm0llf3OyBBl/bQ0jx3/vNmbQ4a1w4pPrBuE5MB56gdIXatp+bBrXCShOl6pivRu8Tmdg0/3z/8r3AvHFwU6oN9cHziJNBjA42//z8Bha4SeiNxL9W479gU0BQavO7GTTBwbuTsFmfb1xmKIl560tZntV9qxy0yx7cq/cPZSRue0WSFIk1NcF1PLXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=20KcE/U5pzt8ZmS1WCeOfV/5WdCpFVfKjiZqmhf2VfQ=;
 b=iCRt57lW+VI6VkYnPtyXKWa+DcgchZEiGb2dCaxLUgAuQo/f2XLqf8afkn8RJDFck4fPsxaa++wv3IqYbv4iXZSZAOiteeAs8Q2Ab6Q0gwgZ7ta7T6CdoUewzveM+wIfjk9m0FMxWi/7ay1pI+pPig/Pg8FT2Dzg+xdASxMSlYc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB11059.jpnprd01.prod.outlook.com
 (2603:1096:400:3ae::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Tue, 8 Apr
 2025 23:31:16 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 23:31:16 +0000
Message-ID: <878qoab58c.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: simple-card-utils: fixup dlc->xxx handling for error case
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 8 Apr 2025 23:31:16 +0000
X-ClientProxiedBy: TYAPR01CA0049.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB11059:EE_
X-MS-Office365-Filtering-Correlation-Id: 51ca9302-f925-48e8-ef9b-08dd76f57520
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9JOtO154dISsolQ3Ol7xBVZRO3VPbBu77U7Y7fcDA6sjx6p5CU84NXy7KGcw?=
 =?us-ascii?Q?O+z3QnwBI+hMBcpjyZVM+DN9GlKxLpVwJaibOb982Dtr4ivPHwIrFEdrvM6n?=
 =?us-ascii?Q?vtsxsAHOvVSYglapMhU+zjwX4/8K+fjzX2zS1X9Ac4OAhCHDZPjt6ZAjVQhk?=
 =?us-ascii?Q?dLAymFZWPaRYd4Q+e3A7Rka36IDpJJUGDQgbEIPYPeICPuu5hP+Q9FLZqxCB?=
 =?us-ascii?Q?QP4KG+RTwCXGUOHgp+O9nG7f2Avz7LvF61NE+k9+7eGWCQTVCIlpowdvSypu?=
 =?us-ascii?Q?hL+n7S4g9z/YxHMXLeYYlY/UVRX8HIZEClL+qs8umVdOa7bRpIcHWRAlIXVf?=
 =?us-ascii?Q?oCTjPeMSr4UxmwRFRfLOAEqLy5zoKN90VV1Jz/bSCCg/Q9gkVcFWwNc5MAfY?=
 =?us-ascii?Q?my//ByOLfdebLu7BOSl+pHzorFrrLfwDz3M9fDnk1rI5STn1cE4HK0e2Wz8V?=
 =?us-ascii?Q?nVyyj5pbLejSspu8F1UqfR3Y9Kaf2llMPsgPkKGaPvbb57PJHuut6NTvCGwC?=
 =?us-ascii?Q?0OmWosmq+dI0Q5HIjLXcQDssXpyJiteKm7vpwHkP5HS/zVpcHiOe/I+2VopX?=
 =?us-ascii?Q?A40zFU2s5IhB49qc3npk+PWUA5Syx3vvHVztWp93iJCD/xDmfvIlbqCzms1J?=
 =?us-ascii?Q?BprgaiVJ3WA0/YDEQLfvCk47wjd2okxR9njgWYaWw5NrmDwSeIz+ZhjZZUn1?=
 =?us-ascii?Q?3bFCezU3Sg7YveE6cc2mMA7ZtVf7v8CLWZEjYDgXMWue1u6PdrtXE+MO4ANu?=
 =?us-ascii?Q?QSbkluZS6wxrfw4d5M2Dj3G+YDVxrUXcIITQ64tfg24qzZF+X6h29kYfC81U?=
 =?us-ascii?Q?piZTB3yoSgFrKSQlgK3nFzRsQkhYpu+kLZB5cHjTed7yAh3qfwgITxy1kpp9?=
 =?us-ascii?Q?3hTnTRkEyUlOI0Y/MCTkh5Zgg48Oq5sg8Aw106mrJWnoshyxrIjbjewOJcS7?=
 =?us-ascii?Q?ijXZSUUL9jD3Pr/Ddzm64y81hIiz7vnXl2kLGr6FYK3XMdmYBIjrRsqQZUkI?=
 =?us-ascii?Q?RqvHe7w80KYabgpex1qR8qyx8db7MmXfLWJCzgYOyACGL2O+mzOI7OKTfTYi?=
 =?us-ascii?Q?RvK+wYa06xG6KLeaGS45BrF3RiLeksf2mWNG42JyYjHlor7BsVMT1kbBVS3k?=
 =?us-ascii?Q?d0PSDqQFfAQFCdzYNLEImpxUKoZIlqehrHQnHN0hKXbPanPyGe11yfLCbuk0?=
 =?us-ascii?Q?SIYquPAzsBvMsQgEaQ1UiLyLhvvEmvQ9UIV6pdszQRgkJGTBAGykY8SNFFBm?=
 =?us-ascii?Q?lsHVbhq6DO7RoxAca+a9z7AlfqVdGbpoQjzq8KlcWEOcyJ82WcK2ddtqtXdn?=
 =?us-ascii?Q?ClD9rC4zgBPqA9miXDCiwzFZh8HzUSYAsvcLqqORx+qkSyLRZ8Zz4rMKLoBG?=
 =?us-ascii?Q?t0JdCyUtS83xy6iSl9+k4b8dc0upRDzhbkhycO0UMDt2Lyqqx/kxoPlMwN7S?=
 =?us-ascii?Q?sriWxuO0nmS8qGqvF8sOw3D5iPznQ8lM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BDGpVIKCqs8+D0R3dzfczNg9uDXZ5DsrTt1Q7nqXZTTgs6yMvVfABUAuaz7Z?=
 =?us-ascii?Q?nkmebFirwW460i2kjOWoD8A/q5oeI8TPBFQNsWSgfw0/szeBMpeaXmbAq76A?=
 =?us-ascii?Q?YLMQXEfgHrXNHVpp2m2R649JAPyYyGzZv9VpeyE0fcww7olNvxIyNumRr570?=
 =?us-ascii?Q?y22HFSxjvgKTwaqkHalh7wEW7ORhHAHwa2fav6K3rhbIYZs2JAA2XppjxYnR?=
 =?us-ascii?Q?7NRCmWXr9stDNUfISlrU3d8+C0LPC6b94tWA46xKYTeGfiaZkh5uxWi2bnrl?=
 =?us-ascii?Q?h0Y7zvDdql1Ec+klrTQwmftdsG/GS6TukXz39kLxAjIALKXE8dFvck4HXZ+m?=
 =?us-ascii?Q?RqE21vKWGMblf5EZSihCYZvseXe2204SdXJQ6yV8GO+Q3I9QnRBiie+dmMGy?=
 =?us-ascii?Q?1lqAlGwxRk+mZrASr6twwGL073WygdYG+6PEE086V0Oj0epZ+Oi0Xn5f+Zyk?=
 =?us-ascii?Q?2c94FYU2S0HtArEEYfRq+zHDRvBsCQxpzihar2cV9g0O5FmPpH3JOasPKjzb?=
 =?us-ascii?Q?Eman6MxUcZPVNezt7wDnptabM19MeQ3Q/uVStOWc4KSfcTkg1fTvSUK3dlah?=
 =?us-ascii?Q?W43rGeyBst3bE3Dcg2RNLLUSjIc5eouVhbPaUmvAp0KO6iD081jnN1RlSgdn?=
 =?us-ascii?Q?f5kQ9Nx62mA+QjhWlWSyhiRKrahCo67fu7iW450sVJQnYi+DHsV1xk1/tHWW?=
 =?us-ascii?Q?ybiYTshpT60uuGMcrkpmgR/EA0iwNfSRwuA0ygoXXxV8hX1ihFk7sc2Ti9Os?=
 =?us-ascii?Q?5fefkvYfdcEceYLSKDaesNyaKDtoEG/U8Bx5qSfK09xC0wD1P0oc32lUf7WZ?=
 =?us-ascii?Q?QNi8uTPx+dGnemLK7vBSn0bod22RrCk/RlpE5QFjWYDZR/GMWtpmVMNBeOq2?=
 =?us-ascii?Q?ZrhOfIZAT++VymxHbUQg8mAwR7LtvLY1/jWHHtQUniV4sGZRaVAMKRl4YP+D?=
 =?us-ascii?Q?YkR0AvND9jOqWGOddEO7TbdqfGrOFZo4MMTH9KZLnTpqhRGU7KZjAlIGIfUJ?=
 =?us-ascii?Q?mQBApzACXCu/yY2VljIOKS1uYfvMXdmV4mY4bzjtSlm2aAbA3t41GiPxylRE?=
 =?us-ascii?Q?jrGZjBPsUps8Y11XleoUbquzMN/xyPR1JWxV+6kcwNcjMmYO78iJ7TLMIX2P?=
 =?us-ascii?Q?uA6OZnrfJTzEfeIjNAu56vOVNH8MTmlnTdPXA5MMJEh0QFHNuLIizyzGkQjx?=
 =?us-ascii?Q?JGe7eHyQYLhcinlXGVqfVW0HP0NXS7iftq+VnkjT5PScXgOIDw2/ZkfY4uYM?=
 =?us-ascii?Q?pkPTtS8K5nINt2o2nc2Q3MwO9NS1IGQDe/9W3+evFhGNbbfR8ZPZabSzGija?=
 =?us-ascii?Q?kRYGhY9gjDqww+3e4ZjC4dPTxhDqAphHa9triYuZfkSib0pevW6VFxwG782T?=
 =?us-ascii?Q?XgZbs/PAOBUT+19J1HPD+TTCssYlDOlHt8h8eISl/Fsk4NL6JeBlyGZbdg7K?=
 =?us-ascii?Q?qaIkgCG7Goxz3htUL4nJVxXJm+VXdEkKPJ71+8epQgAicALNYV+/jGCr7CJy?=
 =?us-ascii?Q?2uHD6GvQGEppineq8/+hdcze2d5HuA0+gYKhSiys18S7pamFq8QLG/bm+YZw?=
 =?us-ascii?Q?gPk8Occr5CKKbvqzdr4UcFGFn+GqGonamZyPSZm35qqIYacsPpySaxqETOQ6?=
 =?us-ascii?Q?JNeb1U169aKngdI1LclwwDc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51ca9302-f925-48e8-ef9b-08dd76f57520
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 23:31:16.1818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GZ7gjltMr8lc2KAfMNk/cQKN0BJdEe4MKAV5rO8s1Gy09K8raRmjsDa15D2SdR8SQk7QTvF/ABurnYk9Y6Mias48+1MgsjbJi0aIevt0+qol8NAXUzwTe/j6+fpxD5gO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11059

Current graph_util_parse_dai() has 2 issue for dlc->xxx handling.

1) dlc->xxx might be filled if snd_soc_get_dai_via_args() (A) works.
   In such case it will fill dlc->xxx first (B), and detect error
   after that (C). We need to fill dlc->xxx in success case only.

(A)	dai = snd_soc_get_dai_via_args(&args);
	if (dai) {
		ret = -ENOMEM;
 ^		dlc->of_node  = ...
(B)		dlc->dai_name = ...
 v		dlc->dai_args = ...
(C)		if (!dlc->dai_args)
			goto end;
		...
	}

2) graph_util_parse_dai() itself has 2 patterns (X)(Y) to fill dlc->xxx.
   Both case, we need to call of_node_put(node) (Z) in error case, but we
   are calling it only in (Y) case.

	int graph_util_parse_dai(...)
	{
		...
		dai = snd_soc_get_dai_via_args(&args);
		if (dai) {
			...
 ^			dlc->of_node  = ...
(X)			dlc->dai_name = ...
 v			dlc->dai_args = ...
			...
		}
		...
(Y)		ret = snd_soc_get_dlc(&args, dlc);
		if (ret < 0) {
(Z)			of_node_put(node);
			...
		}
		...
	}

This patch fixup both case. Make it easy to understand, update
lavel "end" to "err", too.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/simple-card-utils.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index a1ccc300e68c..a26487dca764 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -1119,12 +1119,16 @@ int graph_util_parse_dai(struct simple_util_priv *priv, struct device_node *ep,
 	args.np = ep;
 	dai = snd_soc_get_dai_via_args(&args);
 	if (dai) {
+		const char *dai_name = snd_soc_dai_name_get(dai);
+		const struct of_phandle_args *dai_args = snd_soc_copy_dai_args(dev, &args);
+
 		ret = -ENOMEM;
+		if (!dai_args)
+			goto err;
+
 		dlc->of_node  = node;
-		dlc->dai_name = snd_soc_dai_name_get(dai);
-		dlc->dai_args = snd_soc_copy_dai_args(dev, &args);
-		if (!dlc->dai_args)
-			goto end;
+		dlc->dai_name = dai_name;
+		dlc->dai_args = dai_args;
 
 		goto parse_dai_end;
 	}
@@ -1154,16 +1158,17 @@ int graph_util_parse_dai(struct simple_util_priv *priv, struct device_node *ep,
 	 *    if he unbinded CPU or Codec.
 	 */
 	ret = snd_soc_get_dlc(&args, dlc);
-	if (ret < 0) {
-		of_node_put(node);
-		goto end;
-	}
+	if (ret < 0)
+		goto err;
 
 parse_dai_end:
 	if (is_single_link)
 		*is_single_link = of_graph_get_endpoint_count(node) == 1;
 	ret = 0;
-end:
+err:
+	if (ret < 0)
+		of_node_put(node);
+
 	return simple_ret(priv, ret);
 }
 EXPORT_SYMBOL_GPL(graph_util_parse_dai);
-- 
2.43.0

