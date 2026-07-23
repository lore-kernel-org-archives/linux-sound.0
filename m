Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011055.outbound.protection.outlook.com [52.101.125.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E6D377574
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 04:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784779970; cv=fail; b=sUbxFo1pXAH6GtXRnc1LBQtwa/sKp3J3pvyWvxjXfe/AiLAXbwSz3XeTl7h6PWt/6afxX4Vh/B8/0LQtl8MWv1ousevxtWO5sY6XH5uj1kGWBCQJ8Wdkla/8Mjk3QiV2RafW87kOVnHY+b/fA89HJa1TvaqFhUYbRAoWrNny4xg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784779970; c=relaxed/simple;
	bh=XWclXpi5J42jSJ3XinWdLD7xztMexfSVC1w30yYPVHM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=B0eHjJPuZ2JbWs8i68lg2qFCOiqLm78UCCGxVfoeVu0/oXjC2bkM77I/h38urWhdq7P3dZfgroMLXLGkGURRXTzQMTmxQcT36fr/S/qak0tyBvShRkqGzqAkPGaB29XWZWoF//QTLM8xd+E9EWuJqJb30wn6fIgD0X/lAMDW8NU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=SEziikUA; arc=fail smtp.client-ip=52.101.125.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="SEziikUA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nScgLPgWxIsWLP9nMegzEmK8dixeLiMN2ugKB3zgrcHkX3Ara1wTw5wqv8X83NNPl9HP/TMPr7Dz1yxGwL1P2lEBJT6Ob9UxANWyO3+g2ih10+t1fZYdH5xTgYlSnfmXjmGr8QczHxVNERts5OnOiSoviaYZo/GwKA3qmluMWpiSKOMLrbYPGKTzx9Lcifw+ocSF9I7svcSpRXRIeKM6I793CP3BFHBTT3dJ5xReqYSd/bBNjJrOPoagm3FBR4V/MbuipIeXwvsv4bn0RK2voqiGSJzw1dK24QwdNQUcGaHwzqMKfsxRcmrfmduP6kQo7ZL+YQeWK/FV4dkrrS2Qkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8E+SmiwmE1fL+DbPUzwcvAZcnFabGPfm/3oAC8F/QFM=;
 b=MfvWRs2KjIinCJcADiyDmbd8Rpe8aB9Ry854oJe7T2B5wUxGKx9O7gK/MEudVDXVdRboxcOFpDGkl2dOwrziQQQp4lcxD7jtdkVsZ2YwjycUPcnVwM3LrJr8D2C7VHmo6vHFPVDR8lcMAD8zJvONHHlOlTtTsNI/5zImO5OTA6zsdhr3KlrL1KxhfTpUx38YnAiRxDct8uwHJWNw7+LMaWoP/Ao+1mIBxp3Le0EmNjO0FsPRvKAm2sG23NebY8tI3pi8/fK70BNKytXmJpwjlV4eVl1bH7xHX5xXWgWIViU3YYOyggGmI9lPgIUREdN+mwkrTLGyXpxEdKCA7Eut+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8E+SmiwmE1fL+DbPUzwcvAZcnFabGPfm/3oAC8F/QFM=;
 b=SEziikUAkEU6jDRk5LL0XKrTeJzoBih2aT5ga897piDZIpKujbQ4TBmeRfTvZLI/7vcEc/zAASqUtqZDMg4o9J3cTwcHuvQY5n70RDJ5WNnI71u+b4GZE7yXXfnhIYfTxTltQse1wU6OuG33BNFsu+d4cF1tqUCCZ+GOXq7rjZA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSZPR01MB9329.jpnprd01.prod.outlook.com (2603:1096:604:1d7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 04:12:00 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 04:11:59 +0000
Message-ID: <877bmmtkds.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 3/3] ASoC: meson: meson-card-utils: tidyup not to use card->dev
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Jaroslav Kysela <perex@perex.cz>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87bjbytkej.wl-kuninori.morimoto.gx@renesas.com>
References: <87bjbytkej.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 23 Jul 2026 04:11:59 +0000
X-ClientProxiedBy: TY4PR01CA0046.jpnprd01.prod.outlook.com
 (2603:1096:405:372::18) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSZPR01MB9329:EE_
X-MS-Office365-Filtering-Correlation-Id: 28e5cb55-540d-4e05-999c-08dee8708aea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|23010399003|376014|1800799024|366016|38350700014|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	H3B7CNqUTWM23krowLzuIQS4ImyRRi8myCT8tE+enrgg4Csc7g2bcabJqsqiIIKBUmUb8D+hrq7KHlrQHYtznbPRG+hjjeGE/D0zrPXsBF4S7U9R0bWyOofOqDaJjK1zfrmUG1I3shR2m0JF/uPfU4wGriqghjVRlsjBA1cdeKLtuJzdW8lSN5hVZoqhQPBhMW9TauKJXkfDJw01LJjAwVeIfr9AH1jBpipISDl58cNlARnx7O7GZjH9ISRU+xHLF09bh+K94ldTHCA1qg8Tav2oi/akt/wAMGKRIwVcvPwme8Axg6gIZWKTouU5PZTPDKJbdyqKauGIuodDqBuR0cALomrrCqoJjaJ/pJw9komizvuTsmaDVzUYfZNe0LOPFRgeDfFRcihIHyxxuEJRjJ336Lp3+Bb71d5XGMfKSAOKq8+fduCTSZikIgoA633EmTxbGNDJK/8PzYJ7N7T2WZiH+dgDCfjUpsZeILlKaokV5C/uUTuATxQmXm+hyIlXev0nivVaoQkHgBPW78ceTwkArwdbXyieCf5oubYn2F9E9s9icoJjkVXnbPwBjcxHa13qqjCfqTy6NRkiJsCNDZEqIVjJrYe7o2hgjMFxFupp5Vn8R125kNaiJmky4XziEEaZLRk03JOV5PgDPFmNDdXaaPZt6jOMjtYp03o2Y+2fhhHGFaQUZUiUkk5xVUKPjH7W6jGm43YOX0QFK5MtAt4XNBfTwhAA2UTkyL01Zc4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(23010399003)(376014)(1800799024)(366016)(38350700014)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NAJzwOjAQowuCqBJEqsjCJMPpYEyjswugbFYVb/NwIJnnQyc0fwIBLyeInOl?=
 =?us-ascii?Q?+2X0FD4IcIcIQq9cf+vyWQZGs1XR2ws5bo4B7zqcgukutVUIDAk5nbMPseH0?=
 =?us-ascii?Q?dyqn7BCFKoVLex46hKonwQrx8WSnNLZ+t4Fwv4oE780+/ujHzXE2g/+ciYAL?=
 =?us-ascii?Q?XDflPAMq9SkYzpsjdBp19qB1EyGGhnO0BFvY/Vq0gbyZgjrFnmFAbjiEpucy?=
 =?us-ascii?Q?ZjZH3lhRpMcVV9xGzm9NyhCNJxn0r0kTDSJ0VYBqDIs9CSLsMfTlZIMPVAiX?=
 =?us-ascii?Q?GLasbpzHPBndnpjCvDiQPf15X6/17ChH0NU1WdEHTjDsImNEtSzuI3pZzDJQ?=
 =?us-ascii?Q?oRPQRMnB8h0PiXD+t/CysZBvQtGwxcy2VCoS4qqnZGKz+Iub1QldaW/tFyGo?=
 =?us-ascii?Q?iO0nAe1/YyVq5Uv6BWWwYW/MC98/Ndye5gf/wcCJqUhsZRRHP5ENI3YjqteH?=
 =?us-ascii?Q?RjIWSrhFp+yVrzNNWQEaNrxAHzjpggq44lr8Kvbg47kky0sWz0aNKA9YdKOY?=
 =?us-ascii?Q?MS0wwveV0OkaIdalzU09gPfZeYUytqVQlxnvhsEaEsHbjSgnvI7lvDxiZLHA?=
 =?us-ascii?Q?1JBPOTS0ZyZ+ql0V1LF7V3hv+qrFdavxy9fTDzUdlZYGqRyrqwNFVHnzIOep?=
 =?us-ascii?Q?gPsP/L2MADqAp5PdvOq/XNu+R6moadSqy7Qm2NGfeicFkFPIgfUV86V6PL91?=
 =?us-ascii?Q?cSf+Yrfzrr34+1VEOdDiR55D0aMMhhyoEj6IF1K8QCJXMyP4TvAHY91z+IXo?=
 =?us-ascii?Q?Z6O5KmPjr2AfD2qR9rwdJsTuOuZo2qlkM1xRnPSVuUTHOLSg50pEQ5/GGu9L?=
 =?us-ascii?Q?qcwXt12GS/z5WO4wyfyKyypZq7F7JGu/8qt1yA2DP9EFSUa+eE3/wSkAOEry?=
 =?us-ascii?Q?+rMWPVWUnYsYPKGo0rV3rkHmbbHd0e/O6qYE+c0NmYHNR3d7I9QOSWmdxX9U?=
 =?us-ascii?Q?qkCr6rq7vCSUWAS4JJ6PJ9IGAl9cVPobMS4n9Zxt2Lb2udOFITwGCbitA5+s?=
 =?us-ascii?Q?ew38NknOLsT5aFg360k1vydpw5irQHG+etc+59q9Z0kXvJxqyReGZt4t7nLd?=
 =?us-ascii?Q?NarIO36O5RdqEu+ngzzj4AZ7WE4G811sG607jLEVEnL1FhPo3aQ7+6pj4il4?=
 =?us-ascii?Q?8i4bnK5h314ON0sMWP11ooCxXE4wTSalQcFuGEPSTPqdmIssI6mMThxjsHU/?=
 =?us-ascii?Q?XylzHp8ChIEPi3vM3GUNXe97WCscStSgJRNSrjswPRznRqU1BVpKrHzD4XSg?=
 =?us-ascii?Q?TMdxEU6NojPb2EXuZKOhF1A+N7IjfBgCxOXDcVs0sS6JGAO/vhq0th9VO0t2?=
 =?us-ascii?Q?RYV1tw6iS7mYloOA9xc2lblZwq87rZxK06kEfnhULCoCyS5kx9wDLHYJQCzB?=
 =?us-ascii?Q?5nJIWpQuzLT/S4R2Zj2w0lASYbHFZ7gU7U2r9bz+F9OwSC7LycSP1JGXYt8k?=
 =?us-ascii?Q?siPt4138g/dSaVxfIqBcdFVJ2cL5uI1CQld6cCvlViyLyvFxN3worAsiA9SO?=
 =?us-ascii?Q?DHavfgn6g7Cexz1pDnq2kv4Bcv9EXI0iIZRISjFq+oKIv5Wf39ZYsNZLpIZe?=
 =?us-ascii?Q?s7pamRUbqx3T7mIX7eQ6/EuyLlCm4oRcYXOLaAjZVGbsB317vI0+Mm77mCsT?=
 =?us-ascii?Q?I5mSdESXtnXobQ/OdezYI4uEb9iGEuuiefKAOnrgfRnivitWPWiJtsseNrVV?=
 =?us-ascii?Q?iwXIKkb64lOHJV1KmkBvNZYCG4Sd24Xz+d8cVjM7MtQGYgkFSJ6AWqr6yEuq?=
 =?us-ascii?Q?yDVj9YhVU3AStMiNzwViNh3Q2NJNCM4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28e5cb55-540d-4e05-999c-08dee8708aea
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 04:11:59.8996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hryLyINFGbZp3wlBxFTqTKk46M3upQpAtVQ9m1MOfB+1HGcNAtSjOgrXMMpuJdIjFg+q5fDSTuDn0mjVdR1+FQXhhAt4k11VyXCwfRPGeWegR8NwtToBTPF1ywPzegw3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9329

struct snd_soc_card will be capsuled soon, its member will not be
able to access from non soc-card.c.

To reduce the difference during conversion, replace dev.

	- card->dev, ...
	+ dev, ...

No functional change, but is preparation for Card capsuling.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/meson/meson-card-utils.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
index 8617a4661a339..f2796dc84fa55 100644
--- a/sound/soc/meson/meson-card-utils.c
+++ b/sound/soc/meson/meson-card-utils.c
@@ -71,6 +71,7 @@ int meson_card_parse_dai(struct snd_soc_card *card,
 			 struct device_node *node,
 			 struct snd_soc_dai_link_component *dlc)
 {
+	struct device *dev = card->dev;
 	int ret;
 
 	if (!dlc || !node)
@@ -78,7 +79,7 @@ int meson_card_parse_dai(struct snd_soc_card *card,
 
 	ret = snd_soc_of_get_dlc(node, NULL, dlc, 0);
 	if (ret)
-		return dev_err_probe(card->dev, ret, "can't parse dai\n");
+		return dev_err_probe(dev, ret, "can't parse dai\n");
 
 	return ret;
 }
@@ -89,7 +90,8 @@ static int meson_card_set_link_name(struct snd_soc_card *card,
 				    struct device_node *node,
 				    const char *prefix)
 {
-	char *name = devm_kasprintf(card->dev, GFP_KERNEL, "%s.%s",
+	struct device *dev = card->dev;
+	char *name = devm_kasprintf(dev, GFP_KERNEL, "%s.%s",
 				    prefix, node->full_name);
 	if (!name)
 		return -ENOMEM;
@@ -132,16 +134,17 @@ int meson_card_set_be_link(struct snd_soc_card *card,
 			   struct device_node *node)
 {
 	struct snd_soc_dai_link_component *codec;
+	struct device *dev = card->dev;
 	int ret, num_codecs;
 
 	num_codecs = of_get_child_count(node);
 	if (!num_codecs) {
-		dev_err(card->dev, "be link %s has no codec\n",
+		dev_err(dev, "be link %s has no codec\n",
 			node->full_name);
 		return -EINVAL;
 	}
 
-	codec = devm_kcalloc(card->dev, num_codecs, sizeof(*codec), GFP_KERNEL);
+	codec = devm_kcalloc(dev, num_codecs, sizeof(*codec), GFP_KERNEL);
 	if (!codec)
 		return -ENOMEM;
 
@@ -158,7 +161,7 @@ int meson_card_set_be_link(struct snd_soc_card *card,
 
 	ret = meson_card_set_link_name(card, link, node, "be");
 	if (ret)
-		dev_err(card->dev, "error setting %pOFn link name\n", node);
+		dev_err(dev, "error setting %pOFn link name\n", node);
 
 	return ret;
 }
@@ -189,12 +192,13 @@ EXPORT_SYMBOL_GPL(meson_card_set_fe_link);
 static int meson_card_add_links(struct snd_soc_card *card)
 {
 	struct meson_card *priv = snd_soc_card_get_drvdata(card);
-	struct device_node *node = card->dev->of_node;
+	struct device *dev = card->dev;
+	struct device_node *node = dev->of_node;
 	int num, i, ret;
 
 	num = of_get_child_count(node);
 	if (!num) {
-		dev_err(card->dev, "card has no links\n");
+		dev_err(dev, "card has no links\n");
 		return -EINVAL;
 	}
 
@@ -219,8 +223,10 @@ static int meson_card_parse_of_optional(struct snd_soc_card *card,
 					int (*func)(struct snd_soc_card *c,
 						    const char *p))
 {
+	struct device *dev = card->dev;
+
 	/* If property is not provided, don't fail ... */
-	if (!of_property_present(card->dev->of_node, propname))
+	if (!of_property_present(dev->of_node, propname))
 		return 0;
 
 	/* ... but do fail if it is provided and the parsing fails */
-- 
2.53.0

