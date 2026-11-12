Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794443491;
	b=BBpXikjGilfItOyRPHzwnKk7ed4nVixgajO7ue3x3ymgYPSnbzYObUAOGvfisn839ZR7
	 ljHf1ogw0h90/+++3NDZYYlct654J3oFHQq++cfmYR+StKag9z+jxr2y+XWy50KZopEZc
	 6vx2+2ktghsBcofAIntiTo0YqtfoDaTu5atWzVhUQpyLvBNZxtMNGv8UC2i+f6iy2bNta
	 Je3YTznBmMvoArxLAMVhll+CmPad0/WdxtSa0YwhAzAOCG1DQhTWVTnzS5wjBLGmh/6kT
	 F2uS0dntMDoJgX8k4LAblldEBz36VgSo6jlLyZQ+uVxLTM1j8CzEAw5C/cfwrNj8gfw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794443491;
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
	bh=lR2KKV3rnNEtVtv7lKCX61DHKUXYlrjVt0bLS9+f7dk=;
	b=TL2RF6x/S6jm2E0wl/GdV4L6uCyAki1XwMY5r7idVWyMoMjoT9DPbdTOq227zLcbpBW+
	 /FcfCZ/min3IOp6qw0R2HLhNFMDgwdi/XX1P3J/FEwSIDXX2QDn+ZTePgti+FLOE0avkV
	 EATvs0mphrJmUoUDU8yo+kTVdCI1K+ssnFE8gKw8x7OT+5GqSYsRrg4hLp5ZySvQmSsWN
	 82z1FvxEvsm0YpS5XcDsRTZt131osugWknUmDnb4s90js4Z39kpqaIU7cnvPMP8DSr6aq
	 JJdtcrv7tbTMv58hMunrlr5MpDwoWytUpMLYeKFU1VbdGs8hwlEYzG8v3QZjnyi8e/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=RN1oVvG7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.46
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011046.outbound.protection.outlook.com [40.107.74.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B301606A31C
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 00:31:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B301606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=RN1oVvG7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a/EDX7fkGT8GMJGWz89iR2QXI6LyevkJgp7/aeYBIoPZi388HqKDRSxCaUbzsnspgIDVQGZaHQLL97za2RB5qKXY+F65CAij+sNHuWv2PTSg5PT+4qdSercUSeUWOReUvzkn/+z8YsLFKcunyoryMU3nuttZV81W+/JylC8V94+HLSq9wHrTbqU2azP71nPn4Kq8EkKhGoPiJ4XnstoAz9IRR2XykiRsrm10V6KiBQn0QmgZ7pOxeHQV7QtNOdlNyLOBmeo2jLAb4G5UJx9WJRtiYClkqCE6dAwMFbFq1XZO3FWLX5mqyLPVS1cCr/MmXKsvYzjFPTlHaGQAog7zwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lR2KKV3rnNEtVtv7lKCX61DHKUXYlrjVt0bLS9+f7dk=;
 b=DiHcYsQfdDi1Xk+zCJbkwuXgk4/Q/esGvJzyoWCayFOyuq1+BYDJppJIkb+SwxBAPbiexwZA74jBZnd6Ua2xHsAPlObn7wxG9McnWQjn5oxTPAp0BSMGM6ISOkRBLKuMQDkZ6zIfLGsYQT/6sqm7fqKd0UB9/fkoEBCmdc889YsDx7sJ9CuzBQHjZ/dflXQwinEzqoZ/+BKCb17laNHC29fYDHm3FWIRuq13cbAGdnJwn1TkkGRM5aIs1IR7erd1ndF6PE1phCoq4ovYuXtiHYiYZtQLA/D6Z+9GwK0PD5OgCQ9V2JS7rqFw184/nbA1egev1uk/XRfA8Xsfh6VC3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lR2KKV3rnNEtVtv7lKCX61DHKUXYlrjVt0bLS9+f7dk=;
 b=RN1oVvG7orXsUq8VhjApNUs6vKlEOE/4DkPD0zOccvG+ML1gOaTbWWQh1KXAxDErS/mMQnwcwPDN9vgn+hPqmI5yOtXH/ewX+/JVaM7Zds2ez0U3pnlT3roivevDnZ4AxjpR6E3GvOnrO16wBhQ6Gzu6uql/PU8biyL3HLKUgDQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by TYCPR01MB6867.jpnprd01.prod.outlook.com (2603:1096:400:b6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 00:31:28 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%6]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 00:31:28 +0000
Message-ID: <87se1628m8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 05/27] ASoC: soc-component: align snd_soc_component_{regmap/regcache}_xxx() functions
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
In-Reply-To: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
References: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 12 Nov 2026 00:31:28 +0000
X-ClientProxiedBy: TYCP301CA0064.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::16) To TYYPR01MB15175.jpnprd01.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: TYYPR01MB15175:EE_|TYCPR01MB6867:EE_
X-MS-Office365-Filtering-Correlation-Id: 6385fc59-9bbe-4ea2-cb35-08df40544a9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|18002099003|22082099003|261009223027099003|11063799006|56012099006|261102130727099003|261028144727099003|261102123227099003|261026121527099003|261026140227099003|261022105027099003|261021121427099003|261021123027099003|261022075727099003|38350700014|10067099003;
X-Microsoft-Antispam-Message-Info:
	Y+Vax/ZNhsQAXq6Ui3P2G+FyCHylo348rQmUpZLfinLwX1X0r+aRu97etIGoFfSfadVJw5vvzeb9yAa2KZf07UiULT9PUjSWCoOerV/4uFqTsznBZRtOceM+GEk8n8mmbSUU32iStkckUY0D1VZqpxCT6u5daiqNAYfaAqjplauFbEM9X8zyUmdtJthCzTbbE+iTyMMOZ+yGiK8olvt2OaahnK+jzchop3TtEj7knmjwfMxiDhFgCVYfn/sAuQYLRN3gh/H2xSIMWN8C/LDUztYBwGuaNMNG2I0z8ZU+esdEqqhDb6cpDKvYODifmIjNiYRWxlykMrrZdvxko/aEjTzD7P5wlyNOVsHNgWDilBMQBFXppIWo0mOIaxuIhZ0j1RCDYZrvGScibht1o696tSVH6Z6oj2+LVXqNq/VB4Gw9vWfcACYTBUPAlvB10RS2n/ZFtQWWWWIT9ix6bJpZ7stYzMah32XT8dWhaLUinULo2xoez5b+4DOIg3IFC10HtXRCvu2NHgFNtKPu9B368waBVrIFEebtQL9twtlXnJ7sjeiC88XF/4Xoa3evZhrVNChqkUuHCoh3zEDqEpCu4GN261dzQBpRBnlDo73I0LLiwhCjXJzbeAE8A0z8pgqsQoh/StshRo59bdxMj0sZ7VLm0fikdK0PUcKYOdR7RigGgYZOpQtOyuVxsLN6FI9w7kbP0LiQmcTfOe6k2b4RZaHC6ZyA+4KLpCoDHbTIVHY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(18002099003)(22082099003)(261009223027099003)(11063799006)(56012099006)(261102130727099003)(261028144727099003)(261102123227099003)(261026121527099003)(261026140227099003)(261022105027099003)(261021121427099003)(261021123027099003)(261022075727099003)(38350700014)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Wo96cJAnsBeHC1S6jFzddT/zytvhHHOpnYafo77DNnK72PYtSqNyQu5mKQ4z?=
 =?us-ascii?Q?DIKD1zP7KNJKiA/ItCCYKhYE3OHls7MvRD4SPcv7jK2awPBH6Frknw8s7C5r?=
 =?us-ascii?Q?r6MHf/mKUqYRmhIopSXCKE9irAOD1zWV+Na7gkkfdkij1q2QPhGk5/HBW3E/?=
 =?us-ascii?Q?kJZ3sXOXMtR4TvMhj4VzWh+SGw+NANFYepELNj1rCU31Av95Gf9g6jJU8d27?=
 =?us-ascii?Q?QXBjEcN4uNR1zmg4MvWTdgcAK2TlT8H0KQZVGlJ59w+QiGlegLhzgTjdK8He?=
 =?us-ascii?Q?maafI/F9BpFXSq47FTsSzwJw2/Aokv3K3XCjBByU1rF4uK5hZ9gEZlgDooCG?=
 =?us-ascii?Q?5A5SzBUoeiz/PUmKaRcjX7u1ECYqY4buBaatqhs8RLfYVKsWQnaeq5A3Qoay?=
 =?us-ascii?Q?fXijeCCb5MzsyFDnf6Nc0hb/JMUwbG/5dcywaSwc0gQqvX62f2NwuemsZnYX?=
 =?us-ascii?Q?3QOtyrVOuUjouNBEHBWkaWaOrH7azIcLNHjSH+Ajwppfs/IsfAaxo9wkfUZQ?=
 =?us-ascii?Q?YCUIK/zlBJgrpaRep16GOB2msjznb1GaJRm5J2q7FJvmzMGu1Svh4R8Z6iYj?=
 =?us-ascii?Q?vIrlWnnC5JaVU6EC8OsJVlq9rXdACCsL0j5PuT2RZ07xRA2Bmb3deb8ma4s1?=
 =?us-ascii?Q?/89YrPO9F+AFDd2xgEzAp6IiCnjCk47Fwqxdrgb3AIOqMlguknnSxmyLSFpq?=
 =?us-ascii?Q?Hl9BHwhjfFTQe8EMJXSauaEHQXTHdjUOwjjaSyPpsbTfg+Lzbp/VqPGSstTy?=
 =?us-ascii?Q?Qu17XtoieQC/+nNMAWECzA6U7gxGlhCR/wzYdaQJ1V6EUwZ6CTfGGpIclAkW?=
 =?us-ascii?Q?2vtjZjAe0NfTtAXfoFkH+xmGdXoRk7xC9hQb6/6Z3E3I+LQ3FUX7wVPrbadn?=
 =?us-ascii?Q?VoJ06wRF7ozvfmHGz3QSxzU2w9DO1CPu+6z6lsgbIlg7YIFXmR4nx8Fxi2aR?=
 =?us-ascii?Q?7KaGenAOPNSFzP+QO0GyP79sudmeV8Qro3jN72Ov7dJC3A/qaCcZnN1ckmcd?=
 =?us-ascii?Q?PjH64nlRf4A8vl0kFc8JTZKhyPqJ2eb/c6Haj/VM3ngZiW/SLggro+3rq03D?=
 =?us-ascii?Q?wnIlcSY+Qxdog8r+L/puImriQG1HKJ9HGzb8jYAqVYTumsO+MrsqTbI/rZaQ?=
 =?us-ascii?Q?xdhs/jhfQ+ll0+rduc1VTIw2pf7k2pRWxfeC1n+ud5oRdat0npymHg+8g9Ye?=
 =?us-ascii?Q?CnT3R7G+NPTyTcRFvPQm0aFqtQDhlmGbI5WIVoq/xdSB1m1gJbldZI8JQ2ik?=
 =?us-ascii?Q?h1GnJ/mNd1J1bfjqZD+EZv4QA8ri2PSqitT5OsAe5hrzGB+uGL5lgyNmPJ6x?=
 =?us-ascii?Q?RNVmRELCPIhLQoQiJXvmmqNmDkWX3AdqeML/xwVyvROzThgJ5Q/AqhTA27d0?=
 =?us-ascii?Q?Zx9W8/Ei2bQR0uZ2Vwys8tkYpXPvDgb11eSKjc3Fg/elCF3f6j+briXBhI64?=
 =?us-ascii?Q?5cDD1i+GhUyyc8It51McV/PE/mkbiO4HxldKZl+x4GtVAMjgJlo8H6dzBeaF?=
 =?us-ascii?Q?AdMcwRBgXaGwqMn7sLIsqfnSDU6FNx8jfvXZkWGZbTODLwLl3vzOK7Q6+L4w?=
 =?us-ascii?Q?TRQmIYvBYWhclddP6s25i/ByFc6pc5oP4WTr2nxpkS1EzgphqgiO8RmnRjqi?=
 =?us-ascii?Q?lim07wShYL5u5Tz7CwntA+CQtXz8ulIibSvNtMGBPmDpNNB8cHsQGnbK5plH?=
 =?us-ascii?Q?m25H5I5I4mTmS4MhQxwJQfwluClNvFPI/QXRb1hsaRG+l6Mv4Nd1wfbBbXJe?=
 =?us-ascii?Q?DGkCGZ6SOKj9Gegf2YtW8dlrU5tRFfg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6385fc59-9bbe-4ea2-cb35-08df40544a9e
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 00:31:28.5289
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +vugQQHx5fUlpYiqqja6No/nZlc6B+HOUHvY26RsQ8dsInC/+5vJnVrB6RFojuFMnMkBk1nxx6hw2u2ynqzhiYBvAYBhG/N/JmC0HGv6kd+7M6j6u9ykzRuPk8SRw/iV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6867

Current soc-component.c has snd_soc_component_{regmap/regcache}_xxx(),
but are located randumly. Let's align them.
No functional changes.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h |  6 +--
 sound/soc/soc-component.c     | 92 +++++++++++++++++------------------
 2 files changed, 49 insertions(+), 49 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index d4fe3e02347eb..7476923c60d0d 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -333,14 +333,14 @@ int snd_soc_component_stream_event(struct snd_soc_component *component,
 int snd_soc_component_set_bias_level(struct snd_soc_component *component,
 				     enum snd_soc_bias_level level);
 
-int snd_soc_component_regmap_get_val_bytes(struct snd_soc_component *component);
-void snd_soc_component_regmap_async_complete(struct snd_soc_component *component);
-int snd_soc_component_regcache_sync(struct snd_soc_component *component);
 #ifdef CONFIG_REGMAP
 void snd_soc_component_regmap_init(struct snd_soc_component *component,
 				   struct regmap *regmap);
 void snd_soc_component_regmap_exit(struct snd_soc_component *component);
 #endif
+int snd_soc_component_regmap_get_val_bytes(struct snd_soc_component *component);
+void snd_soc_component_regmap_async_complete(struct snd_soc_component *component);
+int snd_soc_component_regcache_sync(struct snd_soc_component *component);
 
 int snd_soc_component_fixup_controls(struct snd_soc_component *component);
 int snd_soc_component_add_controls(struct snd_soc_component *component,
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 2979d2b79ed13..7e565da045b60 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -386,52 +386,6 @@ int snd_soc_component_of_xlate_dai_name(struct snd_soc_component *component,
 	return -ENOTSUPP;
 }
 
-int snd_soc_component_regmap_get_val_bytes(struct snd_soc_component *component)
-{
-	int val_bytes;
-
-	/* Errors are legitimate for non-integer byte multiples */
-
-	if (!component->regmap)
-		return 0;
-
-	val_bytes = regmap_get_val_bytes(component->regmap);
-	if (val_bytes < 0)
-		return 0;
-
-	return val_bytes;
-}
-EXPORT_SYMBOL_GPL(snd_soc_component_regmap_get_val_bytes);
-
-/**
- * snd_soc_component_regcache_sync() - Sync the register cache with the hardware
- * @component: COMPONENT to sync
- *
- * Note: This function will call regcache_sync()
- */
-int snd_soc_component_regcache_sync(struct snd_soc_component *component)
-{
-	if (!component->regmap)
-		return 0;
-
-	return regcache_sync(component->regmap);
-}
-EXPORT_SYMBOL_GPL(snd_soc_component_regcache_sync);
-
-/**
- * snd_soc_component_regmap_async_complete() - Ensure asynchronous I/O has completed
- * @component: Component for which to wait
- *
- * This function blocks until all asynchronous I/O which has previously been
- * scheduled using snd_soc_component_update_bits_async() has completed.
- */
-void snd_soc_component_regmap_async_complete(struct snd_soc_component *component)
-{
-	if (component->regmap)
-		regmap_async_complete(component->regmap);
-}
-EXPORT_SYMBOL_GPL(snd_soc_component_regmap_async_complete);
-
 #ifdef CONFIG_REGMAP
 
 /**
@@ -472,6 +426,52 @@ EXPORT_SYMBOL_GPL(snd_soc_component_regmap_exit);
 
 #endif
 
+int snd_soc_component_regmap_get_val_bytes(struct snd_soc_component *component)
+{
+	int val_bytes;
+
+	/* Errors are legitimate for non-integer byte multiples */
+
+	if (!component->regmap)
+		return 0;
+
+	val_bytes = regmap_get_val_bytes(component->regmap);
+	if (val_bytes < 0)
+		return 0;
+
+	return val_bytes;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_regmap_get_val_bytes);
+
+/**
+ * snd_soc_component_regmap_async_complete() - Ensure asynchronous I/O has completed
+ * @component: Component for which to wait
+ *
+ * This function blocks until all asynchronous I/O which has previously been
+ * scheduled using snd_soc_component_update_bits_async() has completed.
+ */
+void snd_soc_component_regmap_async_complete(struct snd_soc_component *component)
+{
+	if (component->regmap)
+		regmap_async_complete(component->regmap);
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_regmap_async_complete);
+
+/**
+ * snd_soc_component_regcache_sync() - Sync the register cache with the hardware
+ * @component: COMPONENT to sync
+ *
+ * Note: This function will call regcache_sync()
+ */
+int snd_soc_component_regcache_sync(struct snd_soc_component *component)
+{
+	if (!component->regmap)
+		return 0;
+
+	return regcache_sync(component->regmap);
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_regcache_sync);
+
 int snd_soc_component_compr_open(struct snd_soc_component *component,
 				 struct snd_compr_stream *cstream)
 {
-- 
2.53.0

