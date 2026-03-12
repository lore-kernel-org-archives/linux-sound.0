Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010012.outbound.protection.outlook.com [52.101.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BE93264FE
	for <linux-sound@vger.kernel.org>; Thu, 12 Mar 2026 00:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773274561; cv=fail; b=GH14ysY7TzRUNwiNdMWygCGP3ZKFBrNItgWX2uczh703TjBdXq9up8aotW/x+nPtWBqYegFdmVWCVsXj5HcMo7YKnie4wiHtfCCdHidqpFZJ1+fnmL/UCLv1roKC95sQaiWr9g9Mf0n+8sG4w5osZaMvoSaw9mrx0r2PhV9IrMw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773274561; c=relaxed/simple;
	bh=AUYNDLAUspk1CQf9WjRLIjODd9+p6AnoqwTPAOObcgo=;
	h=Message-ID:From:To:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=kH0jAPAYAC5u7+vKfyWha45pU6fAlLKX2L9PDm2ZpU18FMlHSygqhQdUMAL9Aao1jbegrXxssoyrcNHBmJI26vLtU1g3IVdtOMwqDfOQJblI/+cZu5o0v7akQ/Oa0Fw0Tcj7MZq1AXBaVFvNTHlSzBz+EJ5hGe4NGIzX4LZ/Wdw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=gIkgHjOc; arc=fail smtp.client-ip=52.101.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="gIkgHjOc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IeWbZyZU/+GiY8lIzB346bDbZgKOUjVuGToMQVo3tnJIjwcQjnRwFgWLX1BqAJGWk5Wb3P2GknBE+c2l24mNKFryXK76wrCL3UcD+2MUeyoxEpOCs3KS3olsYZE7TYAF9xxnKTfuHzG6+onMB31l1pYIvR/NkPkVBsbI7NDRjpk8LtEZLbz8SGEkwlbBcucggio4mQtmur2fvDOOS21Tfiw8hJKq4FPkNtLbmzc/g+t/9/OoYl7P41u6akBlPPcrwCb2lFmtrZ3cy9uiFkeh/ejyfLtFuyjnDl15CA1qgYKQCK8g4LAAZZ63bHkamjU/knm0G219oUGImS7K5UjKiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=paE5Wqt7j2FK4Y70FRUHOa20lDIPgryhbDO7NPe7yhc=;
 b=tanmKFtZfBt5vQvcT04pVayox2W9+WX8hmh81b16mI44e+eFO40TpjRsi+g2zSrtWLaDsjZNAiERQb4vCvR05r1eoTCTBcOJqYhHlt+eH93IJLNwXczigPweUGq8I/4raCvGFkJkWzomXUlIXTg61kE5Fy65sdx0cty+x6yK+W0WuAJEPy2mfrf05GR2Zw/uksPnfWWTnykI3ZxXiytD4YLziCoBPCv3hQxDWtgbvXXQWl+vVC2Rpi4/ut4R6dy43Ae685eVr6yyU8jjmrZwxj5iCX+A2TPTZ1Tb8eM7dYn40i2HN7wJYY9/uXqr5MZBlKqlqVFZTGJTGdvLSYjlWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=paE5Wqt7j2FK4Y70FRUHOa20lDIPgryhbDO7NPe7yhc=;
 b=gIkgHjOcteXNnMuMETQk4Us51pDgs6N53HTtf45o8T36Q2f9YmQs2eEsRlMcNWnT/58yYXdjSuKw/ue2qttLtocPCLfLBmi2242kIWMUokeCDn7DVUnjYCmFL4O49MK/jBnEBO8gPR42++IiBOTd1cSCR3ox+5jINkKLRTHM4jw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by TY4PR01MB17568.jpnprd01.prod.outlook.com (2603:1096:405:34e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Thu, 12 Mar
 2026 00:15:51 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 00:15:55 +0000
Message-ID: <874imlzyv8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Jonathan Hunter <jonathanh@nvidia.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sheetal
	<sheetal@nvidia.com>, Takashi Iwai <tiwai@suse.com>, Thierry Reding
	<thierry.reding@gmail.com>, <linux-sound@vger.kernel.org>, Jaroslav Kysela
	<perex@perex.cz>, Jonathan Hunter <jonathanh@nvidia.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sheetal
	<sheetal@nvidia.com>, Takashi Iwai <tiwai@suse.com>, Thierry Reding
	<thierry.reding@gmail.com>, <linux-sound@vger.kernel.org>
Subject: [PATCH 4/4] ASoC: soc-component: remove component->val_bytes
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
In-Reply-To: <87a4wdzyxf.wl-kuninori.morimoto.gx@renesas.com>
References: <87a4wdzyxf.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 12 Mar 2026 00:15:55 +0000
X-ClientProxiedBy: OS3P286CA0077.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:201::20) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|TY4PR01MB17568:EE_
X-MS-Office365-Filtering-Correlation-Id: 284d736f-89d2-493d-c3b9-08de7fcc8796
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|921020|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	hyZm8GV/T1q6zJHJy6tpK2hScqm00zxM8Ow6MaTxfvbk/Kzs6jaoIoH19/KUlAgoX3yOy7ckLCSJuoMslPNItGTCFXwYzAxocdIbdrwUAFbEKKcbskVktkht2VZfA4NBKoNZbavMk4sYFACiKYVQS0uuFSYboX68ka/yw2M4476oGAQypEtdSpI5arUZFs0wq9bA7IHPZvbv1n67Au1r8lQRjbTt1FgxR02OV7rtnTzD/rrxWlMivL1dvYQgYZZF4F3I0eoCG23aAj6r8lagRXyaZEuSeQ7vUXM+AMHuOXEmgondPHRXNNO4Is1KAC7+yNLupuKY0wNbc5Ic/U8HN61lpBD5OReys0YW1Y8V2mYTt9/tmvVfe8VmzBtM7Uxm9zbZFIhK7x9UwQKnaKSAg7iOZxqol9Z7DAZjTjPtLPyFgl9uy4vV737HoeJVl/uUbcapTtptKp/dKZ/Agaitx7/3kx/BboNa7dpjwAPDPnoC9EKemtkZP7LzCxd9bvT745svVxPnxYJDOZvbS+qtyoCl0uz00/ilzZh0TZy71W661OAih/1XfEBz1RbRvOHp7LGIHsDIqEFH/4n6qWtpvRs+4ze5E/b0vHl38fwQ0QiR/DwlFTT24KaaxoT9Z/p3GA6d4zkH3GhSH6psiDN96Z/sDI6XkPS24jD+/Ec73rfaISzR4vy3qZ9QH7d1dSs70kL/jFOn1bXIrL5FCTOYF2zpk8iH6DF3Nk1zNvXXa36QDa7PYGorNMW1YG0n5sCtV7h6uhVfZw/ErP0KN4h4rD+QJqJQQLzsLggo5pLnLuAx+WbwtPATyPa5LsqVtDtd
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(921020)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1ewQsf6f/BqGa5HRXeiyD8Jw8WEYFc007vjT2RYO5vZ7ppjtq16bkJ6xuv7v?=
 =?us-ascii?Q?BlLhmYUKdc4ulPRiXKKwBITMfXo6GN0qPEczjPOAnCaMLYv2D6TSUe2Hgb4G?=
 =?us-ascii?Q?MTfYOr/w6AS6uf57ClLQpnMW7j2V1RCscIdHuqiMdFvhmvAGrr5DUP9V3aIU?=
 =?us-ascii?Q?w1jEjANLdGXSFh7Rmu36rfCeA8W6qVX+p6kQJsVzhGWDA1sZyCdqTHXTPyr5?=
 =?us-ascii?Q?Mgv3Jsc4fQIFMMGIM5fTuL24pzRsvXrBUv163zXalZBGkaqU9PrbYa69VkOs?=
 =?us-ascii?Q?ybtvs8pxcTEOIPhrAmPFWjyUt+2tzGb1wVF8qFFifGNdEqhi6fIlGEjLkik5?=
 =?us-ascii?Q?oGLsA0jY9KI0qPXypznwMOMhm/9JKNUxgjXi+MSgrYP7cMxmiA9XRPqU4AUY?=
 =?us-ascii?Q?vwH+wPGjkH+QMwNmwgalXqEPy+RhLlWwOY1RSGzg1LeChBip5xIUyRkuyaU7?=
 =?us-ascii?Q?i2C6UUnmXgMOURxWWgmoxFlOSQ69y1ycB87cxbMKMUsNCEO99xBH5MHKWlOo?=
 =?us-ascii?Q?ctMcVxQ0pv0RMT6KRDiNm3MIrsn74yTmc9xLUnl4dhhMShuxCguGLH3JQYPv?=
 =?us-ascii?Q?EeyIRHiSktjJCC8JTn1T+rGqBSxDTRB/eyYSpzHrHRylCO2PCZdP1XS7vhhP?=
 =?us-ascii?Q?00rr1iXIOBBGOwTQSnVnMXiiz7Yuc1t1a5egJ4O/yelM3c8WXaGPbotZH+r1?=
 =?us-ascii?Q?6J26q47VN0ICUTVpFxXhxGEZUZYjXVInzbjkxPeosef+iLE1RuIMwJ4DHk+v?=
 =?us-ascii?Q?6rlxH/vsdzqrhqbHNaI1JvicTQHhWlM+hG667NnOtieMNOQcFQrgPBYH2xgE?=
 =?us-ascii?Q?3DrmEjKNQ92mjdle4wJFU/vn+eJKcxpZaUB9bEuUahZb+rjXwa9gW1CwrOzX?=
 =?us-ascii?Q?tU6SB1LNmI/dVS/qFYqB2+Fzh8KPPVL0cmlt8Q3188j0cfj7pqnR+oyctj/l?=
 =?us-ascii?Q?vllgnIr31TBfIa0l1QZatUupn7rOxka3rN0JqkZgoMqCEPTVjixgDe61ujY+?=
 =?us-ascii?Q?ph0koLSrw/3KwyM9FdQ19rGxxLk8wLUFVN3kof1Jk+pvx6NJgleuNjMuGhLH?=
 =?us-ascii?Q?F+9s39warQPurFx2pexS6KU8Po7EVoxlIwsw01/h4qU4rls+3jK+pgqjAlDN?=
 =?us-ascii?Q?RSMtYjwVAMsL5NRubmvSutcNV9yUbc4batTyBIGoahNef5YebvjmGDkiG5/W?=
 =?us-ascii?Q?kfPancYOTfgUkGlZvmiGTsGNwa0sh4FMXBDCyLl+jCkGAyA11D4yc5mz2KIM?=
 =?us-ascii?Q?u7atExTFBa/BJ06u5kI9+IuteFmuSlAWTkPm8+7AluphcGSnWxWuU/vlIbTL?=
 =?us-ascii?Q?guXdQTWmOoelV75uLf2sPvVMGdZVGASgq+6uT+YL31SO4Tl37HKqVh22Jwsg?=
 =?us-ascii?Q?iJE4zDSTqnN0qZkldKr1u8IeZ3VHHthx/GZt7fxIMOA/j4rkSr82gEUXR2i0?=
 =?us-ascii?Q?M32In321xc3hkkdEXxwansXPNPbIICqVKAXpQGNej0kXboifxaGSiUHAPx/j?=
 =?us-ascii?Q?qOqtIzV9CrR5LWJ/tgTnkB9L5a5l1f6f1NiY4awaCpgit709FKmof4QxC/ru?=
 =?us-ascii?Q?BILNqSetNoJSfr6An9moxYfv5oqEHmkLfazeeanlWiPIq/4hWM9PUNN6yEcm?=
 =?us-ascii?Q?gMwbBKi8Y8NqbJ5LeaeOu8NRI+Iwe5G1CyCpMZe0GofuzFZ4lZrmMlTvokk6?=
 =?us-ascii?Q?eQVRZHfSnm3NutCgTjS/IxzWqu3oL2CRfpA3ncy0AtHNu71TEuHj4Eu8dXQx?=
 =?us-ascii?Q?c6UMlwsmnm5dYLm10sMaGpSJcOyIM5eKi2SoOGWnkB5nvV8udRMt?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 284d736f-89d2-493d-c3b9-08de7fcc8796
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 00:15:55.9127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: imQVPu2ww1pF6ZLQvEKZDVNe2dyomzbSidFS2qf0b9+u4AXGRXox8EmA/Od+Nm1fdXriUy7GUqvu49DS5ZvLhpCSwjBeosGuqGc3TKGbVxLE/4j5laAXQMqk1UGkx930
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB17568

component has component->val_bytes which is set via
snd_soc_component_setup_regmap(). But it can be calculated via
component->regmap. No need to keep it as component->val_bytes.

No one is using component->val_bytes. Remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h |  2 --
 sound/soc/soc-component.c     | 10 ----------
 sound/soc/soc-core.c          |  2 --
 3 files changed, 14 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index c08922290cf1a..65dc540246aa2 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -224,7 +224,6 @@ struct snd_soc_component {
 	int num_dai;
 
 	struct regmap *regmap;
-	int val_bytes;
 
 	struct mutex io_mutex;
 
@@ -328,7 +327,6 @@ int snd_soc_component_set_bias_level(struct snd_soc_component *component,
 				     enum snd_soc_bias_level level);
 
 int snd_soc_component_regmap_val_bytes(struct snd_soc_component *component);
-void snd_soc_component_setup_regmap(struct snd_soc_component *component);
 #ifdef CONFIG_REGMAP
 void snd_soc_component_init_regmap(struct snd_soc_component *component,
 				   struct regmap *regmap);
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 9dc2cbdc2dda7..2eaad5db21300 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -342,15 +342,6 @@ int snd_soc_component_of_xlate_dai_name(struct snd_soc_component *component,
 	return -ENOTSUPP;
 }
 
-void snd_soc_component_setup_regmap(struct snd_soc_component *component)
-{
-	int val_bytes = regmap_get_val_bytes(component->regmap);
-
-	/* Errors are legitimate for non-integer byte multiples */
-	if (val_bytes > 0)
-		component->val_bytes = val_bytes;
-}
-
 int snd_soc_component_regmap_val_bytes(struct snd_soc_component *component)
 {
 	int val_bytes;
@@ -385,7 +376,6 @@ void snd_soc_component_init_regmap(struct snd_soc_component *component,
 				   struct regmap *regmap)
 {
 	component->regmap = regmap;
-	snd_soc_component_setup_regmap(component);
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_init_regmap);
 
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index e70bf22db5c91..1a744ad237c9d 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2901,8 +2901,6 @@ int snd_soc_add_component(struct snd_soc_component *component,
 		if (!component->regmap)
 			component->regmap = dev_get_regmap(component->dev,
 							   NULL);
-		if (component->regmap)
-			snd_soc_component_setup_regmap(component);
 	}
 
 	/* see for_each_component */
-- 
2.43.0

