Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011057.outbound.protection.outlook.com [52.101.125.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75992DCBEC
	for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 01:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789350222; cv=fail; b=beU24wsxkl7xTgDAeER/9TkGIxIaoj1yrMrvYOTrIR57LBawpatoLgqc1Gws5/q4+AOudH37d8kX4/knJm6sG+UshElVZgzGuQq4HOs2ipnmDg+9gslGG/c35vw0hYDRfsySmbso5BVyaVtM57rlF1JTB89zZM/SvDvjFCBHkRo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789350222; c=relaxed/simple;
	bh=KpwDX2qRES4XnGerd1mjiVMeBNsdLt286Hb7Ew2WJFU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=DXqoE+gaFd75PvORDuC061ZSfdkuynCGjUiuDS1Khn6Qznk1v+YHfF0Kieka8pUytX/XAJi0xlTV7/VVv09a9XC1vtXeBwJYB+CxiqP3w+n3gkX9x3xquO+wFwaXM1u7o+2SqPiJqcCb7FrX3PJHnHKKlEH4EJZYl1peQdFeC9Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=XWH3EJEo; arc=fail smtp.client-ip=52.101.125.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="XWH3EJEo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fJ0/UJsIQbAlxLWxJCRPGRd5OO8Ik8ItrtXwkhxzNg/amHV39hgUBGoqN1eEQwijKJN+auGKNBOvsDFa4J2iIfA7Q0GqwDvgtQnHl0QLlBRrRPlKFJat4sCmp9QQ3X+J0fvg/iEDtesLDpoJ2jn8zYSddPaLk0/jrDd3lMFTbd4hAP2Godt4+fNZePCqyUWHRcmau+mlNNjHgWSH4l9O45nJZjehaYdphpNdGCCOLCeziYw8WuGTY82Dzezirak7svQrO6KX8GdbjRL93sXHDYLchGZlwThcyYfOA0WLds93aAO5H2QC4SOwgYhXhUQA5E9X/T+5fNJVhvp37R4f1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=forTePu89eqJOeK9hCF4tpf9JqGF9YRJOV4cQmSAjpY=;
 b=D01CORLqiewOfjf1zZvPNjMrsLsEHzIX93b8sFZE5t8GH1E8jicFaZbsM/hGt0MhFheeuJBqatxm09FhMIRQ/hS/elLlwRrr6jXpJ4l0FjGM2QvVRtqsUZUtdbBk1nvJ04xlRdlVza506R8DM+5H1jCZSiuyrAuPPJEQVlum7h8CEC5m6Tmywi/jYH8gx2SouOaC0pHGe2l7Wuh7Uo+5ChfyqgYpGM33+XQLsTQOUQETyBLYt0ltxopOOVoLQvUK0lm1XVXxB8IJdGwAfUzX2WfcjjQNXwvVrldqmnKPCa+0Zz5GuYtnKlokmteLY1lA/8kachFFq5ONWxbyBuHd4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=forTePu89eqJOeK9hCF4tpf9JqGF9YRJOV4cQmSAjpY=;
 b=XWH3EJEo2zCcmkfV5YV9M6XxKVnIbXUz/WGD49mlkmFvuIxTx/KqZVsctx+71QxxmqxMB15Ws+astvpeySmZh4Cbu/iR1N3xr0wCsVOtWsaBf7X2DZMVy/VAVVkkeNR8711ewZoBBzIiBkdGNCE0/uhpSNi0U6lwiuEvVdDt+/Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by TY7PR01MB17747.jpnprd01.prod.outlook.com
 (2603:1096:405:38d::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 01:43:39 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 01:43:38 +0000
Message-ID: <87mrtkli9h.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 03/10] ASoC: soc-dai: add snd_soc_dai_to_driver()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87qziwliaj.wl-kuninori.morimoto.gx@renesas.com>
References: <87qziwliaj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 14 Sep 2026 01:43:38 +0000
X-ClientProxiedBy: TYCPR01CA0143.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::15) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|TY7PR01MB17747:EE_
X-MS-Office365-Filtering-Correlation-Id: 169cd2a0-49dd-4f8d-c774-08df12019962
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|23010399003|1800799024|366016|38350700014|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	voiHIqsXBg8XNfOtV3WNRCBDB0QbHTnBDlHIH5S7LzOlWmqNZmdg52dvK1dpTMIma2Tsz/QBGoMlLR+NVFjo7cdXO6B0CPyh82pvAU8cFdjhhtXbh2Aw9iuM3DLuvNgvgmmg8qhQGdRccnE+j+WzHUPLytBHkeiAjJlBKNBbluOreoCqVjl9Zgk+0vOmW/M7NX3+eOsstV8V6vKDhzpHt/PzhHVg/OXSTVwvADUNwDjZSt+5LODf+kUigaiZ4m9s/6rTQlueh4JnhnQsXlP9Y91rh8CJumbuuapBgE1UtZyuWZc7K3iHAe/mVvvCxoO5fRcJaAEjZtVrQRB4TxLIhdoC3GbCAXjmtWV5J0CtEUIEHP+DlP0RwXofqRlVw0yfzX2+HJ6JyDG8nKr25zohRzNh959oUDv1gyQGnqCuOCOXsxpeBWh5atACWl7+6rNUs3uAOGMc9Y8/3HxzxuVi/GCUpfkamd/eEpmnRNsnoRxZOOPngHWczhVezg6tXYZnXSeaRkjGRBzC15KCEycJBeXnv/1ShNLy3FWF5wKnQSTCKVX+cb3N5KYTzcCYFiLUYXA4CWkwjqREAXrZsHRF6nCX8C6ZpOa8hB1f4jm0Dup8a+EknxK7hoB6OabA0Dv1W1jgbj3loVAiM+3C8/DbCVAaU2MNBiK4UOwnkH2wh6BHT5ATajG4lnSlZLUPERaVhA7MKPvFQkMtDEpo8TrYaQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(23010399003)(1800799024)(366016)(38350700014)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FrSAa/9wH27N3yeXSiLzmEr7it29StYIPQKdNQJMy0giOc4WPnuelfn/SpRU?=
 =?us-ascii?Q?/8DCQI9hQ+A7IeZ3pz+71ZMZy/aUf+wrxcuORcAcvAi9IkAMMzsv+wZyPOR+?=
 =?us-ascii?Q?pi9YQtKI92hCBQobV0QT2Jk46TdE1Dyipyt7zspqEXeCvpE2pkHJdbHlAjKy?=
 =?us-ascii?Q?DyypBkO9SdtyhJcH32sST8r2veFo79E9U63PjWqmkR2yMnXMmGHSWNFAxhyD?=
 =?us-ascii?Q?jyG3ThB64UImGqRJo5QUpKSDkoE5nG+ZsBcDMLMBUefA1w/2JnW8FPwnqnvZ?=
 =?us-ascii?Q?HC5I2Y2m0auyniA8Ywrr/zsywLW1xQJavf/F7NK2jjdzVuxJFxqIpy6LS23D?=
 =?us-ascii?Q?qNZAiLZd5KiNghS5gIlT7y0ZI5mz8gXKwGS0bTBCFraKxdFu1iC5O+5qWwCh?=
 =?us-ascii?Q?LF8rLg+geNO/zkkNMJrtIEvzv0VNmMFWUvvOtPB0kWSKcuKr9yhhjkwscOR8?=
 =?us-ascii?Q?TnXsxGdtp+UjfmHJDILmCdVgcrT7Y4QRPLpVFO/obp5kpz043FwmhkMwJymp?=
 =?us-ascii?Q?t5ecWi5eBsZhTPq2tlSWbQezQy+ArrLeCN/wDb/r02UfJOzz82QQb67Ssetq?=
 =?us-ascii?Q?gQOudbZ3Yk36k/SNIfjCDRyX9KZo5HhdVyfSyFLhR1cylkLTocn+hImdeydX?=
 =?us-ascii?Q?4et3gR0akiAbILCWb44L/xh2FWWOTgkQ01g1AxF1ojWGed5OlFVGjVKCm7Ee?=
 =?us-ascii?Q?W6Qtt40fYj5aNq22eZbEoO3pckBXUIID1DtkkFAD6EBCaedrwR9MB12xRRoD?=
 =?us-ascii?Q?0FLigkmI4k5Leb22CC9XBgrq7oLgEX7nGcSQ7YqU7e0P9vXLopuqP4LluoS8?=
 =?us-ascii?Q?YOCqY8uXz3WEaEzb5o+5Qj13DPhfCczJ6HAckE1AP+KqV/6Ed87Tncn2u2yd?=
 =?us-ascii?Q?rAxL/tMTMr5MfVUPvC9t5DDvpKwcNVhve7EX3ABpYFN770juRebz6A8KS2ek?=
 =?us-ascii?Q?G4monG+kkjhsW0MmZyPIetVFOvCaO8vOLBZtdvXpBm+21v3BWsCiUtstRPNG?=
 =?us-ascii?Q?dLLohQ5RCiJn/fLEanMY4GcGVljlE0t4b3DKtAWTn2tIl/iK7M61IkUk8w83?=
 =?us-ascii?Q?aY4DiFfZmtYj5C4jbSHquy+zCysPlMDsWIvtHmsywKv7ZXZAzetnd1GAokCK?=
 =?us-ascii?Q?apdP/atmR7ZC9EnpL0poeDFD63AmhDm1Gtl7KNOFSQsqoH2Sq4DA7OtAa/pk?=
 =?us-ascii?Q?o12g9cFKoJXUEaUuvZRSFAOlB09lRz8x2lJFAp2oVpMgqcP1L2Z5hqU+tduj?=
 =?us-ascii?Q?QdGXa5CC1yMMan7LNSk8B/rwaAOM3H19VwOrDGjyV4iIG5K51QEfj3DSEpwc?=
 =?us-ascii?Q?69ldmBLh+DCBhPs9HxvmCXep3D+SUyfF3lHG3borGwn0OkkxW3M4BNbajn+2?=
 =?us-ascii?Q?bfHR4YPLLUbVCojcRXBhZhBNIkFm40hUcWk0eT6biAhWZkhJ6DaRYdnMxYgz?=
 =?us-ascii?Q?2vJXVA/Kw4wgkmUewy7yzEbVa1wbOI7/ua/xzWySjxlY45dnyqkF26Kzyl6T?=
 =?us-ascii?Q?cPhVvWa3lsFLfGeEfP3PPLs0JxvnqwvgHtiqQIX3TAplWGGco0CfUarvYgTe?=
 =?us-ascii?Q?kwIIyrQDtxA4taV1HhVXWPzHrcWHS8pO3+HF4wv1PSbtXFCkBdUNeoNEl3xJ?=
 =?us-ascii?Q?DEQyhLpRM72B2ADwOXDrbrAfLlSsV/HWH3i6TJ3GUV67y8D3PPhSj5XDlhW2?=
 =?us-ascii?Q?H3xsTG08M2zPG1fiT4MHAW2rzW/FxOtlJPMRqYexVAy/uTS9vzI/fm4mKlmI?=
 =?us-ascii?Q?Ypns/JB1JYtAyUucLP5lju3P5twjLRMyMfRcg4rPy/RD2wZ9tDwj?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 169cd2a0-49dd-4f8d-c774-08df12019962
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 01:43:38.8408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WcDk/ZBwl3oqVW15Vzj4FNjhAqUs1GSm29q4nvGBpYtQ7twhh7ecotd06raprnnSl5qtTiVzz89MlkYXWv/+eH1n1MevVDCexN/zmIpbI2V1sskBGilfvW0uX4t/v49+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB17747

DAI parameter will be capsuled soon, will be not enable to access from
each drivers. add snd_soc_dai_to_driver() to get driver from DAI.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dai.h | 1 +
 sound/soc/soc-dai.c     | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 7f8a64db0dc7f..375a8674d1452 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -213,6 +213,7 @@ int snd_soc_dai_get_channel_map(const struct snd_soc_dai *dai,
 		unsigned int *rx_num, unsigned int *rx_slot);
 
 struct snd_soc_component *snd_soc_dai_to_component(const struct snd_soc_dai *dai);
+struct snd_soc_dai_driver *snd_soc_dai_to_driver(const struct snd_soc_dai *dai);
 int snd_soc_dai_is_dummy(const struct snd_soc_dai *dai);
 int snd_soc_dai_add_controls(struct snd_soc_dai *dai,
 			     const struct snd_kcontrol_new *controls, int num_controls);
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 2027e6b6aca18..3254b14c1eb76 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -26,6 +26,12 @@ struct snd_soc_component *snd_soc_dai_to_component(const struct snd_soc_dai *dai
 }
 EXPORT_SYMBOL_GPL(snd_soc_dai_to_component);
 
+struct snd_soc_dai_driver *snd_soc_dai_to_driver(const struct snd_soc_dai *dai)
+{
+	return dai->driver;
+}
+EXPORT_SYMBOL_GPL(snd_soc_dai_to_driver);
+
 /*
  * We might want to check substream by using list.
  * In such case, we can update these macros.
-- 
2.53.0

