Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010068.outbound.protection.outlook.com [52.101.228.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657481F3BAC
	for <linux-sound@vger.kernel.org>; Thu,  2 Jul 2026 01:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782956766; cv=fail; b=HDi1gByBzLy2ptxzSBMnFVhCeaDg7G8ybXEW6LCcdLMIk4wCSsvYw5jvVWmMib4ZEAKGwJr+1W7CXXMRsWzBTxYmQz6mU4Ce77OLYpgqBihs1oixujNzeIbpVtvsFxQqmU+lHyke0VGaAeb0ybKWxYe+VCY8TTi7PCFfY/Tpsjg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782956766; c=relaxed/simple;
	bh=cARCg13jeFecxdYatqi6RtiOH8qjL+BXHimLe5Psph8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=BmIwfreOopnGkeC6XXTuBojdAawpDdqhAt4GfNnNw9oIwTr2a2sE66Yb3yDqFZ6Ik+q9AVb2pqdiIcyNpbc5RQuVEsTNaJdhFYh8W9Ra+kKsUsh3HLWDb9g+GcIB9gZTg7crowvgGbufk3sqz3YAw3q2w5E/eLdONDGeZ6iypc0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=jMWCn0U5; arc=fail smtp.client-ip=52.101.228.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="jMWCn0U5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NtIOztz86a8k8bk2TSgrbfpSx6+3jGdIukTIXHJSHrZuIulfxUbGBzg+TdWI1wG1xvfauV8yfcDSuek6fOwep/kd/AjBnryMVgzNE3xb3gtPfooZBm95mjpoSCpsYobwK5YlgVASSAxch7KbIfmVwmK+4x6mpCEOzOCPtzN49UVhYL7GNktbiM5YaD8M9ozdGM/kcjsZYnbozBhAzWwv02jtLNrhyOKfJ+H2AXHAEk/0DHy45EKOSnheKjiWIDzxh7++TMQ/EYzTOZKWKVF4Y73yQ8G/ykTTbwASFm9MzSc2DWDyBq5nsFWmQb48dXP40fFgjPi+sGmhKZ1Ulk3qig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=suFnFLXm4b+0NhbsL3mKkyBMSADswdKhofqsfyuR0aA=;
 b=dBUnOhv6/cxNJwjeYFfdmHGDKeWodc6yRVUGHQz9t8UZ3LnC57hxUWZqKyMFqrLXW0CN/KLTK31h2LBelTtTKCiNS12JmatqiV/XIn7jM4CyPnnf9TanZd659J7lKiJTXK0aQF5mjEY9dcXsO7EAO7hgj0jjzZSNl3/7j0OdsVGZhNL/qwEqI4rAg0X87en8ktpJK3cMQBC0NnnG5nEKEgBYYlXXtsw2bY0hBufgkRmpW7jkys9qFWw0qlHv+7sa1F34dl0AiEMEzdGLTBoeNfXFg2khTbq69J7ouNgpJMYhVlIeAeL2hjuHjfu4mrO+Cjszc9XSMEFpKVB1BJUG6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=suFnFLXm4b+0NhbsL3mKkyBMSADswdKhofqsfyuR0aA=;
 b=jMWCn0U53Je5GxMZinEpdaKIJ4vx2CZTTJCec0jtf9uTsKDq41yW4FzRWh8Wbm+3f6yoQpRJ4VinXv7lxldGgBAV1lD9/nDsbeJRhKw5ojitxgKTxn3czSR4zfnOCxg83Vcw1p2dGiIHfyjnq1jJ9H+G/Q1l7P2NusdrF2uVPRs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com (2603:1096:604:235::9)
 by TYYPR01MB16053.jpnprd01.prod.outlook.com (2603:1096:405:2e0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Thu, 2 Jul
 2026 01:46:02 +0000
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834]) by OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834%5]) with mapi id 15.21.0181.008; Thu, 2 Jul 2026
 01:46:02 +0000
Message-ID: <8733y2xixy.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 11/12] ASoC: simple-card-utils: tidyup simple_util_init_aux_jacks()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87ik6yxj0t.wl-kuninori.morimoto.gx@renesas.com>
References: <87ik6yxj0t.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 2 Jul 2026 01:46:02 +0000
X-ClientProxiedBy: TY4PR01CA0085.jpnprd01.prod.outlook.com
 (2603:1096:405:36c::8) To OSRPR01MB11811.jpnprd01.prod.outlook.com
 (2603:1096:604:235::9)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSRPR01MB11811:EE_|TYYPR01MB16053:EE_
X-MS-Office365-Filtering-Correlation-Id: e01448a9-1142-480e-799a-08ded7dbac67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|52116014|376014|56012099006|11063799006|38350700014|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	zwLdSqgK3ir1T1XieHPH0aywsnmJ4NEcnqrkb39C+hAHB68drXvAJgvYuzuMpVnGKfAHj1QxNJZXw4YLlHo4GlLG9xA70UGk11GXF9DMwtiRPvXWiMb7uHibcrxOMulp19p0Qiu/8IDeTHtKPZ6Mxuuo72nBFTLVQQGh2zrbqVH21gNKUOKyY401JiAQOSNUmCoOmt5v4pN5Zm+assuU585M/g4I3pnxMkI6lLKUXa3APOJhjTkOkTYExphFi5S1dicOAc34oOAf3RO31xOmSSYr/WHaN6q+uBeUQmazzY1yD/iiaTy7xnChH+e5nEQJXCgftseZRolpS0sMmiwqK3LxidzJFaIb8wd/i7AnGw8B2Bx6g7NLbDPMLduM2Q6LunxiJggs6MZvHIRL5mvseyDnBTgv05isSHdldwkPeg3incKrEF77kTm/lG9LhdwvXb8hfUgD363KJ9Wb7CDRUH3fOQGinZB7RC7MnZhsHD/pX2eiXZ1hCHcwGH2wxLVJmXivY8QSXRLNBTtxQATZq/nc5hd1qoTGJpz4KIqB0DEgAMKzDbBhAlx/fJxqRvLZUKfVFvhb7v1GpQ3QhwluvAaErUlSA31G1yPksnU7HUN4hcNEpiw4YlbAtCOf5v6e3ncSDO40QttjCNt7kIlA2GnznPyK83/86/z6xoHFZO8O+1EMDi2sgNDJlzlWW+eROl/amsYIBurIfleL5fmCuRlOO5ZDwC1tI03s4g+qugw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11811.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(52116014)(376014)(56012099006)(11063799006)(38350700014)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FpLZ1KbsOq4RqrxoEzjZYyVyiyLmFKGy1NayOwmOOGSkHFFhv9ryLMUKFSBN?=
 =?us-ascii?Q?e9IF17U+H0crXxWaMlV4rct5Vogg2jrP6CIbrH0fyd2BxTynCMT5I0/f2qxJ?=
 =?us-ascii?Q?0sVIeLMb5qz/3zErrerjNMRU2vO2KCPfhb89zST1ZWwDX6OAtWB77jVpAJoa?=
 =?us-ascii?Q?IGFZbPEBsAYzyMWZmqgcek7VHaA3V2gwbM5ijiHuJZ71BXCVFfs5cuGY5WL/?=
 =?us-ascii?Q?RHTOUswPST4UNx6fWJI1XIm1AeJvsj5f9pwAojC8M9r0IGODdJF+DDPs7SdT?=
 =?us-ascii?Q?Nfo/pDfjdJxCO/ldLK4z+bl8u0ZCxtheKfreodTg//5vxFHvy0mACZSbq6po?=
 =?us-ascii?Q?fzNC/+J/eggfkxsnTQqfPUr9Z242thvR4b0nWzH9mGpWB7OLSYHDOXlK8pkN?=
 =?us-ascii?Q?Celmbk++zDGQCofohopfOUW1n0+N/SaDw79SQiJJa1Wqs1T5W5YnMkZw2umr?=
 =?us-ascii?Q?PGzatvQ5MYxgK2aiNAaQXhFiAfIuY6IcZmVlpzidIpL0rpfxLpYlGSdLlP68?=
 =?us-ascii?Q?cJgKwIH+Wbr7hE1dk7Pmykul3OMzMXUE3unEn2fy9WjU/HmyEyfGPEOWix8i?=
 =?us-ascii?Q?/zmCLClxJpOGI+444vD0nAe9iSzPblH/asf66EKEl8f86rnL/FELLbF+rwUv?=
 =?us-ascii?Q?pWMqFEhL6xCGolmKIrxm3x8Drw05iuUvZDp7dx+n3j6Um2reTvRsYY5Y57oH?=
 =?us-ascii?Q?uXHy8hFe4isOuXSe1QY6V39Y3YnCKraDwt/ajq7lobfsFaXDMAiccImwTqOM?=
 =?us-ascii?Q?iNDJHpmg5VL53bKi26wNBJIO3Rfx6Y4Juhp2PaF6mMNLzzqK9E/XHLOBb7Py?=
 =?us-ascii?Q?IoV3O1V1DtwtYQZgbH4zByvnnj544x8CuV6bzivtUCBg0l12TZats5zh3/9H?=
 =?us-ascii?Q?W9KWLfW3hzuhCzbvR43VOQJoQHePfC1VqxYIKwDjLdFbGTzyt2UgsYabBJeD?=
 =?us-ascii?Q?I9AoDGrV9NMMmmUNhQ/ahLlE1nd2ZV7z2k9Rwo8J2JvhAijntz/iDMkzb3hf?=
 =?us-ascii?Q?Xcbz8A4P2l8ZzqibuHi30o7f35W1g5ndxR9364cvnybwGVZqDJvI4BnzguGF?=
 =?us-ascii?Q?zu7BEVtvVLhWTBLklkhneioAEegkN0e3fTsjX4Oljsl0njRpl+ENgDF299Jo?=
 =?us-ascii?Q?U6TWQwLVkaAXpcM0kSPOs/93wN8xhaBN+iLs9CFtmGasj6ywmh3vX/Lz7oDU?=
 =?us-ascii?Q?eINn0n6V2QRFTOAgqsHlx+pwFsnKhs23t5SLXbfRdb2ZD+gpxjprD6oHjWej?=
 =?us-ascii?Q?4DC5nBlhuOvHUr1mwA1+RtLzVLzumZohG8X5mH8zauYcweYM2Dbi2b0RPNzd?=
 =?us-ascii?Q?H2gFZAfCUP3UCjaPjVoES5d79rCPB7xQmTA7J3pTad/5Yq3oT7HIDCC+S4Ue?=
 =?us-ascii?Q?jTBoGNNZLlcSgy3p8XhgJazYSASGdFrXI2a21EchIcaYVtzFPfuq9fu8JCyi?=
 =?us-ascii?Q?e2sHPHvx9WYHNRnaqjfWBnc8H0vYKt8mtangeGkizkexclFBXR1sypgbBvMp?=
 =?us-ascii?Q?kcVRiXwHB3wkcGThdcRKircrgqZkQu1PUPzclTmLfla4PbJmBImIPcJXwevp?=
 =?us-ascii?Q?4YSuoSabnioJYlbJYlEKoRCGMnWdKLZT2WmXXahf0/r94kH5m0Miy0fGcfCb?=
 =?us-ascii?Q?Hn5RalBMTxuRCXJiwQJcg0bF0kSqoYViD/UJvqpdVoc9lFU7FjqGpf/Sc9yu?=
 =?us-ascii?Q?qy25+i5ZPvnO7dyZLJhtm4tVVz72FfHPJPo6rpCeszHBJ6mew9qZ2BoRQxo2?=
 =?us-ascii?Q?xaXHy5kx0owqb5GgHsPMP6MctOEMZBXRYH7n/wd3dYkk072paEj6?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e01448a9-1142-480e-799a-08ded7dbac67
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11811.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 01:46:02.5287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UEdbu0caU6g6d5komT0a/AsSpCzpWIrWzR7n5h3gs7hivl9KU82CB5PX9bKSn65j0a4zonvLR8WpivlLyZ7pkKFLz25vklBCIJ1R13s5ZjxRH4QpE8I2/BzejepWMpdd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB16053

Current code makes old style / new style conversion difficult.
To make future conversions easier to understand, this patch clean up the
code a little. but no functional change.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/simple_card_utils.h     | 3 +--
 sound/soc/generic/simple-card-utils.c | 4 ++--
 sound/soc/generic/simple-card.c       | 2 +-
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index ff9747c6aa49c..5e2e91578bf54 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -219,8 +219,7 @@ static inline int simple_util_parse_aux_devs(struct simple_util_priv *priv, char
 int simple_util_init_jack(struct snd_soc_card *card,
 			       struct simple_util_jack *sjack,
 			       int is_hp, char *prefix, char *pin);
-int simple_util_init_aux_jacks(struct simple_util_priv *priv,
-				char *prefix);
+int simple_util_init_aux_jacks(struct snd_soc_card *card, char *prefix);
 int simple_util_init_priv(struct simple_util_priv *priv,
 			       struct link_info *li);
 void simple_util_remove(struct platform_device *pdev);
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index b2212629ec507..41e2252064d78 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -820,9 +820,9 @@ int simple_util_init_jack(struct snd_soc_card *card,
 }
 EXPORT_SYMBOL_GPL(simple_util_init_jack);
 
-int simple_util_init_aux_jacks(struct simple_util_priv *priv, char *prefix)
+int simple_util_init_aux_jacks(struct snd_soc_card *card, char *prefix)
 {
-	struct snd_soc_card *card = simple_priv_to_card(priv);
+	struct simple_util_priv *priv = snd_soc_card_get_drvdata(card);
 	struct snd_soc_component *component;
 	int found_jack_index = 0;
 	int type = 0;
diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index a67f4aad01883..49289cd655ea2 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -661,7 +661,7 @@ static int simple_soc_probe(struct snd_soc_card *card)
 	if (ret < 0)
 		goto end;
 
-	ret = simple_util_init_aux_jacks(priv, PREFIX);
+	ret = simple_util_init_aux_jacks(card, PREFIX);
 end:
 	return simple_ret(priv, ret);
 }
-- 
2.53.0

