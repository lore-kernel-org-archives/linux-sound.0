Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010036.outbound.protection.outlook.com [52.101.228.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3532749C1
	for <linux-sound@vger.kernel.org>; Thu,  2 Jul 2026 01:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782956701; cv=fail; b=gryFKwGdSdFYa7upCdPMHz7fpzIkI1nimCA1qzCDBu/YYf4CxVLvTjWV5eQ3WyJUxTTMhVS/tKLih99hTjLk04xnOYFvR5jpHGxKJnWmMcDRooQeSNimTdC4PFatPXF+o6iBtJloh3wCtZ5BluVmZtm97qvnnUosI7esq7EgxIY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782956701; c=relaxed/simple;
	bh=Lbs1lQDWOWwWUo3TBAqIMS4VbyENrRYO+JdyhbiqAE0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=VOy6dV2XDqohJzqeiC399FRvM6msjVIjjRuzZlNAqKgjDO99GLIRbAcK7a15uowDyILqQXBDMiT1ZpkPyFUAGCjjgV35CY3SPDacFBZaRJVNnV0AVhW5uQA9FoEQL3dbhilT/VY/7Cd/ATfKWbbILCBhY2CzHw8GVD2L39WK0eA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=NpaiDOOL; arc=fail smtp.client-ip=52.101.228.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="NpaiDOOL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jcINvooG/8oD4Llo0ZV6hLiZRdvFNmmaM+2DJOhKEUfjaNBhONaKaZMxX8CVPhJ5AdaQkFqXCz48u6bM7K2FwsXtVoawjIcYjsqHQC5Gql/F+i24qqzmb2/dztzmk1zP/DeZbUTIi6nlo2SCtEEWdTbadA/GxPxtHdqwwml9B78NEgRggNeiZSurb1TYRkKPe9v0MGFGc2+s3qEYGkRCi+/FOFwkBvsGH02k/5qhm6CdJ9UKlTnZo0aK6/RfTJb718VAMo7zewDRb+q7D91n3kFLZPLdTmwJFVyHrRk49uvNsNeSAJYe93kj9X2n8R8enyf76z40l6u3KedTrV3kDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7hTiEmXx9/KCVM7XFiz2EKP6mu4jTPphjDZZBGDF/ro=;
 b=yiyxxkTBO17fnX/lLckPMWezVoEmvcDZLhJPrzeorvz+yyjWeKl+Phwr77OnL2Pr41FSlikfzOXJLDMzMovFjLLaEcifp+NJdYMl3EZRJjNP9Bp2VvT/CIO82tCkrVlAZ/q6vhXwto/sWXbxaHrQ0vM0xYfY/yWSt41Cc4xx6t+NP0gQKCsyB8s23wVSrGJrsfWuvtC/5eL5u/y+a8RCJ38G7HgE3JAv2sjwpJ5+rsGXVLh/W919qkxPgLjfKvCTkSLOfo+hfcdL+mgexBX0xUmetg6ukypdMPC+3pfBOJV18nVlm93C97vqdXYB+xMtKcNB9BoBdGXbTTiMnsEtKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7hTiEmXx9/KCVM7XFiz2EKP6mu4jTPphjDZZBGDF/ro=;
 b=NpaiDOOLLxKdPdZMuAWjYP/b32uuWXmvuVvUyKDJxs+2ieZaFR2Sb3p8zHHNm79edydUukjMbQ6HUl+xBYZx2l/x4pULQigX1RpERexFJq1OR5o27BbiCND9YdbjXfhVei+g9PAdVeR4A70H1jIAtokCLdg3R0Y1h5SH5vTp6OU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com (2603:1096:604:235::9)
 by TYRPR01MB15951.jpnprd01.prod.outlook.com (2603:1096:405:2cc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Thu, 2 Jul 2026
 01:44:58 +0000
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834]) by OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834%5]) with mapi id 15.21.0181.008; Thu, 2 Jul 2026
 01:44:57 +0000
Message-ID: <87echmxizq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 03/12] ASoC: audio-graph-card2: Tidyup audio_graph2_parse_of() around error
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87ik6yxj0t.wl-kuninori.morimoto.gx@renesas.com>
References: <87ik6yxj0t.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 2 Jul 2026 01:44:57 +0000
X-ClientProxiedBy: TYCP301CA0006.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::15) To OSRPR01MB11811.jpnprd01.prod.outlook.com
 (2603:1096:604:235::9)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSRPR01MB11811:EE_|TYRPR01MB15951:EE_
X-MS-Office365-Filtering-Correlation-Id: 229f86d8-b047-4fd9-a816-08ded7db85e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|23010399003|366016|38350700014|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	sKu3qwk7mfp3mmx6B1/pLbT2xUA3G40srYsJ2T5TwssbMblq7nIL80hu4Oe2qflTbA1wBGd2Tvyj9YEowuSjACr99TvqhkJ7fE23YMhS7WA5v2CLD2wokRejFe15bZc35YFsLMLV1AacW4umiL4kFXevbYwJyJrvG6sXG7S4HcYfEVQ8o/b4DxEg1fEPd9mhW+J8yMwKCCVDWWwLXBMoSzaMnW2qYLEo25ZKXKeUrSphZgwlXj9jD/d5Fl2mY63P+iQwG87y4B5UG35+/JcO9xRc2Br8qiyOSfdsELwOeVxNnnTg9H6+n18ILWhwLCHik5r12vW53biJ/Rb7a+oQvmKHU94u7Vp0vQToolnwGHCGSOIh4oZihFQDSg7Kr1kdlyUTlGG5n8OiTXOGIogdy7oJDCmr2RXTjTpIjFrAGhaJ0Ff/AThn8UDRhhJKJTmoG9mcMhYxtc5wHBZTb8+l6lSTN/c4VLXRRUUhd2WMvczIeegzMzwOFWzYwj4qsX/v+fdHONZiNbfmJ0S9MCwb6raw6j8vwRQhGJ7gEYy4lhb0R2ggrs7zc6K6+Jat7tCNEJuaSW1BrChdeaoQ4kh/OJtrhK4ixC2rixoA82BT6COtkitpGVYcbDWENSTjdRDXXpcz8lG7BanXSn38Y5AGnyDQJ3/jA0Wd5NSaUMy3bIDlzk7yUR/iaViBddirAwygh9k/0Wytr7bldwiHU8SJHytV9ejO+Od6i9kNzOjaWQc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11811.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(23010399003)(366016)(38350700014)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lEvyrGvSg0ub/WHA+3fNlOqS/7fMPWKetgUhkhPq4BmoTQs2wFOUMWRyM/fy?=
 =?us-ascii?Q?0QkRbrDj81DqHE072CqjRhHsyeROmuh7rjGOeKdir+VA/VIuUa7WeK8ej1N6?=
 =?us-ascii?Q?v5h4lYc8JuOOWsFQQzZZnQB4y3J4jsNa1YOiAFLMsdVQHgkXS+peqC8UGN5m?=
 =?us-ascii?Q?J5vjt5/oZcIFCssXPsndRQizddas5cogOdyQUQmn2Gn7S4nyPV1xbCEYBJfv?=
 =?us-ascii?Q?hQXWKyXak5YjP+8Dxm4Pf4atBzk8cyg79O0qRd9VPAHkg1vSIH0kpaEd1cfI?=
 =?us-ascii?Q?F+mvcoLpHnvJprHP0EZN8+znxM8RCj7o7itaeh/reiTalSUu/LVANijlQqF/?=
 =?us-ascii?Q?ezpihW+wZqdJkIdF640IDy7aI9Cn0lojIJQXBulbOsLa594NNNbkGmpvfJqt?=
 =?us-ascii?Q?nX9RtiFs+BGZdGE0OQSchyWlO7HGOtN3VC8cAfmyncZsicFKVV2+5HejszEs?=
 =?us-ascii?Q?ksjbLNz7dyTDyr9akGC0Z5OS/P9xZPYcPf9H61i5Vf7P2FODFcp5LGCL/qAO?=
 =?us-ascii?Q?res59YcgIIZv/hwI/z7S6EaZa+koWDCP+3U2MYi+NpG2zSB/vluTjOk9aJQX?=
 =?us-ascii?Q?3KJpXekDSLpwPLwo4jcm/UCEj65VZwnG7Gw+9iBuyVYGDGYwA5JkQ8k/BsN7?=
 =?us-ascii?Q?a9/uL7gu6OhNw1o2C8IWYtUF/5mqf/FXfKa1sHsngjs/7v2to29ey6fOD3AP?=
 =?us-ascii?Q?umsp5UDL0MHXEopXJgqiZEupDElAq8A7ONrWrmJBZhG6PnRoIB5Av5yaRC9o?=
 =?us-ascii?Q?MOGPIVi3hn4CbeiyhuPxZfIu64zfaz/x097p9bj8/5aH6B2MzAeOIhMBbsM8?=
 =?us-ascii?Q?yzhmXSGufP7Xd8GoY7AamGgl6gYMKNPUMYeTyeSOI57R1gCfnsDAUhc7R592?=
 =?us-ascii?Q?wFoR4AC8wx2MhixnbFpVxF9t4kG/1SAZNSXji6q9m1BIPujbLI9mcRvkdt4o?=
 =?us-ascii?Q?USNrs5EJ6MN2/6L8DRLEBVkPxtghwbysyABv0ADqjaJUv/mG68zyEFf0lpCx?=
 =?us-ascii?Q?7BLVth3TMOQ7ZI9Lu4aaBU3uFz/CoBH8zkrSftFzbFl3Qk1u+sD3VoMfn6lS?=
 =?us-ascii?Q?F8kU2I4mVcZzN6Yd/7CGRmphN6dQDNO80AuncC+3KMYeSc2uUKAb4e7FJ9/+?=
 =?us-ascii?Q?o/BwVo67uBDqYB4mGFsu6ukU6Qn4qDBi29Uxjjkcv41i+dy5u/sDfKyOVoZ+?=
 =?us-ascii?Q?6tdGVLU4kZFuyb48lxSctmK1RTXlm1gOIK2jDzVX7EWSoH3tfKv91OQAV388?=
 =?us-ascii?Q?a3IqPmkNWGpg/ee0Du59H/Vv74YKsPz43mUPN4sKu15KQEebs54/8KmIO51R?=
 =?us-ascii?Q?qMv+Jfn3+JVpS1WtT8qkfNunGlp/l3fPhPvwXIHa8wQFSDqa5iNI3r6hFbN8?=
 =?us-ascii?Q?vqeUsvugtrR/TZjNtx4PjxuUYdnqeTmtTMEtgReOwyXEMhrISH15oSSrZTiH?=
 =?us-ascii?Q?BNRee3GwE84lj00aSYcOOeArgc0+V0w/2S9PUXV54Wq/lW+675h3TTrLXemu?=
 =?us-ascii?Q?Yirdnc9BRmbgBrBmm1chLl6LSYdKX7c3kWhubXie7oSpj49iFLonqkjpDxLg?=
 =?us-ascii?Q?ki/FHnUqClIKeflTtoPCMIo99jgbkQcfepsY/7wZ+po+e7gGfzrcASdigFN9?=
 =?us-ascii?Q?OMZuutEd/nVmT25B+5Q0zjQU6pxc8XDYfyCXTwqC9TflSHsTOPiwBP6dxxvM?=
 =?us-ascii?Q?Akys/Np/R8gtAg6aTGg8qOTz7GmdK8OkSkorXZQ5miHWNaMvufPdum0NjbEZ?=
 =?us-ascii?Q?AyvotHuVb/65iXWJgd2NJWYdSQ6MwCqGDHNCfIwWDeSD5f1CnISK?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 229f86d8-b047-4fd9-a816-08ded7db85e9
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11811.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 01:44:57.9056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ssAWRyKugaRITSf4EsdN091ixSWIhBxsjxqI4KI4fgxfzRjFIBicvS4b7gURmzLCfjwJB01PWNg3yd65kORd7Nj+WcYOnJJH+FLypEuG5x0Os9Y/SCGC2O1Cnx6rAsX6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15951

audio_graph2_parse_of() have not been calling
simple_util_clean_reference(). Call it.

And it is already calling dev_err_probe() in error case, no need to
call graph_ret() in success case. Tidyup it.

Let's keep same style with simple-card/audio-graph-card.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card2.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 0202ed0ee78e8..c5ada1f838812 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -1303,11 +1303,11 @@ int audio_graph2_parse_of(struct simple_util_priv *priv, struct device *dev,
 			  struct graph2_custom_hooks *hooks)
 {
 	struct snd_soc_card *card = simple_priv_to_card(priv);
-	int ret;
+	int ret = -ENOMEM;
 
 	struct link_info *li __free(kfree) = kzalloc_obj(*li);
 	if (!li)
-		return -ENOMEM;
+		goto end;
 
 	card->probe	= graph_util_card_probe;
 	card->owner	= THIS_MODULE;
@@ -1316,33 +1316,33 @@ int audio_graph2_parse_of(struct simple_util_priv *priv, struct device *dev,
 	if ((hooks) && (hooks)->hook_pre) {
 		ret = (hooks)->hook_pre(priv);
 		if (ret < 0)
-			goto err;
+			goto end;
 	}
 
 	ret = graph_for_each_link(priv, hooks, li, graph_count);
 	if (!li->link)
 		ret = -EINVAL;
 	if (ret < 0)
-		goto err;
+		goto end;
 
 	ret = simple_util_init_priv(priv, li);
 	if (ret < 0)
-		goto err;
+		goto end;
 
 	priv->pa_gpio = devm_gpiod_get_optional(dev, "pa", GPIOD_OUT_LOW);
 	if (IS_ERR(priv->pa_gpio)) {
 		ret = PTR_ERR(priv->pa_gpio);
 		dev_err(dev, "failed to get amplifier gpio: %d\n", ret);
-		goto err;
+		goto end;
 	}
 
 	ret = simple_util_parse_widgets(card, NULL);
 	if (ret < 0)
-		goto err;
+		goto end;
 
 	ret = simple_util_parse_routing(card, NULL);
 	if (ret < 0)
-		goto err;
+		goto end;
 
 	memset(li, 0, sizeof(*li));
 	ret = graph_for_each_link(priv, hooks, li, graph_link);
@@ -1369,9 +1369,11 @@ int audio_graph2_parse_of(struct simple_util_priv *priv, struct device *dev,
 
 	ret = devm_snd_soc_register_card(dev, card);
 err:
-	if (ret < 0)
-		dev_err_probe(dev, ret, "parse error\n");
-
+	if (ret < 0) {
+		simple_util_clean_reference(card);
+		return dev_err_probe(dev, ret, "parse error\n");
+	}
+end:
 	return graph_ret(priv, ret);
 }
 EXPORT_SYMBOL_GPL(audio_graph2_parse_of);
-- 
2.53.0

