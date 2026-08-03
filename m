Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazhn15011020.outbound.protection.outlook.com [52.102.171.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2A7306D3F
	for <linux-sound@vger.kernel.org>; Mon,  3 Aug 2026 01:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.171.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785722148; cv=fail; b=APbDLy7BQcZDlN+GWAdQVgTMWIiOF9+TeiyjYh5n51BEJNA1j7MSFfRHQZnv0r3hmDJEN5mQBrO5CDkKieeXlwMlfkv+dX4Oq/dxA/8KgZ2lLyn6GCJn+5n24kFQ4NiQzYiZgPHlVsmmnJV+KMiz8zFor0EapxOCseEnSE9UGDo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785722148; c=relaxed/simple;
	bh=t665bJDFi2AJaRU4CwWQx0G2MgUNymZTte1BPw5zB5Y=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=n60GXmx1Xh4hNYp1FRpt5cv1XnwhaAfnP6OoVBOyxuksd1//aEPShFsxRdoWB6DHRuvlVb29I/FRFXs3hfbWR0GSRnLKB/Wgfd9rsnGBsYezfJx1QpHGutJqNilvLuKGIwJ6qste4/OPlq0H2hmzl63T7AHfkh3q7mOMTZPDO+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=fcj68Rae; arc=fail smtp.client-ip=52.102.171.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="fcj68Rae"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YF4eC+vyW9NhKonBTOVI/vVYyT+b6dC4tX5b3lGWlexWScf1CDPsJsV7mZfxwHkRDtL30SbYwRiAZZHCAh3+ZODC9lQ1H96OFJCw5mMygAE+qHy1IEPcp0WjERK9Ho26VsTC/0AuyS6zYp2DbkrPcdSIJCL/3F/UVG82GcvEMTUihvDZjKbwLkvpaD5ll1MP/4zsW8OODQUgcX/hhKqVNbv8jyT5IdhMLaafLWFNu8iMdYoFZB6SugSD4VMkQOFa3lmjdlwqE96oh/6XGFKryAR0KZUqtSLaKdZ/wwxRbZ4xOTOHQznt2nvZv7HS5jH7sVWmsYtVc4j6n2FFZ4pTVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LpmUAToZWRnjhksGkzu2vLLvPNNcM56MMprZ1ZR85Pw=;
 b=X6rDt3goNCU6CaocwnsA4bqOLCT7+bzi42yqyTauBPaso3NHgIVzlkuqv6ln2ZpTTzxx8FXVFpbcvF6t2KQYGrVrJCECyojl7m8K48MjHxjLlrGorbs8nkmEI47vi27bI1RxaXBGokL9WxPbFebDZpj8dFmbmLwIkMpz9dd3Pqc+epjF9ECUvAG47rtdjXU4FM3s8q9zQ5FQRLVoe7LTHscusyc5CSZxKrBdvf+QWZBNT1ihUWbIef0528fRgj8FBKjsukXRj7/kl7JiuNzgiDZYtF3SCg9M7K6LZMDq1PWw91WWSW2gsjq7SNsOEiRNuRyjJZwsWqe0v84jqiQ+tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LpmUAToZWRnjhksGkzu2vLLvPNNcM56MMprZ1ZR85Pw=;
 b=fcj68RaeFbbziDBnGVShN0lWkxKp+wSHD6iY4/OH2jOjS4bNY+kwxg9UPiCnsyo/EQW1ECWhi0UfV1T/eQrdanRyWshB2uB80J5XiNgqfndOtvb/1nNIi2WNBadPTxsNiQC4HVke/OKuZ3zKGgeYpkg+X8acwvvX7z40TlWN0RA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYWPR01MB11861.jpnprd01.prod.outlook.com (2603:1096:400:3fb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 01:55:39 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 01:55:39 +0000
Message-ID: <87tspcrmqt.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 4/4] ASoC: renesas: remove ssi.c
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87zez4rmrq.wl-kuninori.morimoto.gx@renesas.com>
References: <87zez4rmrq.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 3 Aug 2026 01:55:39 +0000
X-ClientProxiedBy: TY4P301CA0085.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37a::15) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYWPR01MB11861:EE_
X-MS-Office365-Filtering-Correlation-Id: 50c40d05-1163-467a-18b7-08def102515e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|23010399003|366016|22082099003|18002099003|38350700014|6133799003|3023799007|56012099006|11063799006|10067099003|14759085003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?b01qs5953pRZY4IDsJWmyV/uPit8NCxvKIqsJdndidvxdDlr8VYDswpQwtwk?=
 =?us-ascii?Q?YeJll3X9tnpFnj2r88lLVYv9ayPaty3vMf44IOf/L81a4xtsx1xy8GLgdvqC?=
 =?us-ascii?Q?7HeopnEqyijfF0UJzEBMAMQzSC/ESuBh4iuZW+mRz7l5qyKt/S2XyA+2nc4d?=
 =?us-ascii?Q?evaRlu5lYLuspuabLdNUVvitBjem4bF5pA9wOlpgw+KX00w0XSrT8jiOhHv6?=
 =?us-ascii?Q?X7PMLRKSxm1Vy/WVphIsY5Nu1IRMD+aTqhZFt73gAi+jD4o+VX/Jqha1Ny11?=
 =?us-ascii?Q?tMl1Q+zz1X+1HoVp18BBHDgbYTZmg4h7KMUp8e6xh9pxYrDK/9cStmVqAqbH?=
 =?us-ascii?Q?OLUARskzA9fv/2PymYkBUTVUxeGHjynX9WaryfDVlliWWwcJB3HzTi2ick/0?=
 =?us-ascii?Q?6TtVvJHzVHP3mlswqWhyPkm3CDeDwkBdrY9u98TZZjDUzxPQkxsAP+5syNys?=
 =?us-ascii?Q?whsjZhUirdUyMK4HqiTjFOITlWCTXm8mPXk8hbiX49bQIvqwF2RunmQ1hLfX?=
 =?us-ascii?Q?2Z2e9PV9ujy6kofPgFWDtXc2jCtcUWYCTcFNTjx5C8fOagrBgYFTTY0ajdRQ?=
 =?us-ascii?Q?YBKpuT2GfQN1VnIQIVjTXCaJzom2GjkJvQTep6VMfRt9DRoRvl9zEr6d1pr2?=
 =?us-ascii?Q?4UT8TjtJlKZCnZZ+3mg2e1nTxXLtxh5Edx+c7hsotlzm3SwA/5AizGU2cWYm?=
 =?us-ascii?Q?Pb1fUdrUvyzQdy4r+CSNJxLzuQNhqAhvfVbqDu7e+dYbEBzUldARwxySBqk5?=
 =?us-ascii?Q?1SRFtKw29oSAVheTuqKl4lpBmGJaQEmabOeoocLnFksHFXaAYJ+Cu9wTzlqu?=
 =?us-ascii?Q?aM7jYZD1nu6P1UX69UZQu3lZGPF1dh0yl97eDQUQHaXVWyJYc8ZNvjm1eYRK?=
 =?us-ascii?Q?MeuGcwD/6MqUHX6euNcQT21R9zOBdCxKUUTNsDXVxUsXQkrm0HDLCgSmRHXW?=
 =?us-ascii?Q?CC1RciQPXvboEppUBU+R5e+wIW9IorKw/1ZnIL2dFS2asj51pWMwh26ANFn7?=
 =?us-ascii?Q?Z3x0sewy1VDu64c1L3+wWn1gCpRG+ioSLwKypLwJnNRKJldHihChQUbbAdHo?=
 =?us-ascii?Q?RnzIXDuVYC7/Fng9sy9DpULoPZBKtwRaQqa0ILkFX+B2qVQSoRL6DFXfMhfc?=
 =?us-ascii?Q?Se7G+kG+iL2ZIqJ+Y8BKSkpGAgS9SySnjS7TiRO09ttGd2vyW4DqsO6v8P3L?=
 =?us-ascii?Q?428ZdzpapWq78gsx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:5;SRV:;IPV:NLI;SFV:SPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:OSPM;SFS:(13230040)(52116014)(376014)(1800799024)(23010399003)(366016)(22082099003)(18002099003)(38350700014)(6133799003)(3023799007)(56012099006)(11063799006)(10067099003)(14759085003);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IjRBW+UhiWtEOfA4X3xB5YUo4dK467qJDnYDwx7CiZN+x1ICkMeYT01jR5Ay?=
 =?us-ascii?Q?OScrajjVEK8DhWDJIzKeD4ckmMAf4BJFt7zM1KtAqQP9V4uEveoXGzUcG7jM?=
 =?us-ascii?Q?raeNtjtfK59jVNBDnjoJjfGuP0jxyCXIOq66F+armvrCIjVw2EHeK0rwtCyp?=
 =?us-ascii?Q?fwr1CjwWOK30Nuq7UmFDLXH1GHy2cbxWICKFhQNFlZ8xVQ1WCIt4jvEQPUtF?=
 =?us-ascii?Q?J2O/Ne0rMnzsFUDo/tIbbkL6T18vNhymC9KtogMsIcrZHQK7iHuNl2yW/HDn?=
 =?us-ascii?Q?tLynHwial/v2b5MjiiowbfyXh3+wwnzr9Yjz9wPdqA6vhn1zWmcOmDuNR1ar?=
 =?us-ascii?Q?9qUnJ1KLiM5YWrQv6SuDekiWAER932H0dWuKrlTTgI1qmGutp/FfP0+yIbLK?=
 =?us-ascii?Q?kNYKrr1rCqq/WKbW1CVKxcGhD+bFQUC4iwXzfCJhbamaEVS3G2n8pfk2XTFc?=
 =?us-ascii?Q?9xMyuM7lrLLGRAa293zKeckmXr54KzRYbcTP6vIwK2uDYzmmNpK8GUsbNUwx?=
 =?us-ascii?Q?abXNJPnmDfI3kH4E9NuqZD+C+Hjhk8C4B8KElz5wf9XoDOgH9Zdl/gkeVG3V?=
 =?us-ascii?Q?CDBY2na7p3/98CC1yv4fB0H36YlfbVXvhLpYT9+HYsKg8vuGqMU7GOn1BhIX?=
 =?us-ascii?Q?L2HAZgmcmMztE9RdLS4F942Qtd4V86QX/LJBmz2AGEM3Pq2I+s9xZQGj5LIF?=
 =?us-ascii?Q?hPk8irQMkMnSt7O0Sc/m0Ul4/1Ja0dH/sEgsaq3zxQdSREpFj16etwog7ON5?=
 =?us-ascii?Q?itoTRyXexnUYPTl6QbWYPDD6H8Nx4LJbwkZg3lVt43d8Ck0GVzYpyLG1S8Lp?=
 =?us-ascii?Q?74J28h9uUZNMMDyIhpqnD9sSn3TOQJ9R8WkY2Iz/S2rOq5t8I7PXKryDBkdv?=
 =?us-ascii?Q?YD7GL8jOHfZHeRfYl6U18uILrYAODDTOwL+5+aCDAlFwndb1kLs7Ka9hNAL8?=
 =?us-ascii?Q?euf/iq6NTN458Mbc2TtH5KQaiWwSbuFWBtmnifxyQftu0RCOUrYW1emFAQ10?=
 =?us-ascii?Q?9ULB7UqQ+3F5ph5OvhYJLEuuj1UjPK7EL/czNewSoK7jqsMdW7co2x6vHUtT?=
 =?us-ascii?Q?ZhTV+f1ezSB1waLoYOawRf8/NX7b8B6CqZw+JXLZK0uv/Uq3roCM08BG/gHV?=
 =?us-ascii?Q?TLBfY+pmWGtbRFbO3sJxMVJt23Ox62NahR0fuJ58JnqxMs9qmXienGSsshNf?=
 =?us-ascii?Q?zj87SLZB3ZWMbGYEeINJG195CnteAbTDjazjBO2GBf3jXloDFAySutnBy8JF?=
 =?us-ascii?Q?htolCtL8adoSETkoIf7vd5zwtA78P4bb4xcdHgT5Zi/k1Me/yHZgX21DzmiY?=
 =?us-ascii?Q?ytgisDAi2lSuxPtSZBu3ZJsDGEaLknlCrK7h+uDvrozzz94PqzRCo0LgA7YR?=
 =?us-ascii?Q?3SZ1FF6P6D6tT3AXQbDeXlBiRlhlEFGy6BBuzisXna3QPjR6FKkQH2fFvus6?=
 =?us-ascii?Q?JydmNfd3UgHP80enh2shf4QYX1HPgEHP93AFYwWfjOxqqdsbKoKnU8EdVsi8?=
 =?us-ascii?Q?eAwkShY8QkKzsoLdNgXxJF0fIY31wj0fwCq2SUT+T8kLhGGIZtyyjvjGIVed?=
 =?us-ascii?Q?51QfUseBkLRD2Z0g/AQXoIOP/rxu3RLsVphqX3+tspTCBWAqrs4KUoYHVDc2?=
 =?us-ascii?Q?FTEArVgDnmy7LLlPQha4gbUR2o2W95PbtHFTNz1XvwPdsP/5lG2L/Vul445d?=
 =?us-ascii?Q?4/NZ0m1SB92RXxg3zrOjR853U/afNy49lZ47e8cDxACQhLMkmYReTr/lAR/6?=
 =?us-ascii?Q?EffnKmOsfm1mBlbV1M5KiD+baYRscXjbS6WVGGxDAvmXQb/XL/+mtsGEs/eH?=
X-MS-Exchange-AntiSpam-MessageData-1:
	UuXNbWhnPzD2iDI+2QtRqMH0wbGn3PtxKTmrFYyG1/7KJ2N9MNA5L/lLZx8/1sP/P+Vhl4/RbC8Vlt6LUa5RXxdgN4idsHkAkDsbUlIOw7tftjcZhXy+2SIG
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50c40d05-1163-467a-18b7-08def102515e
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 01:55:39.1832
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +KXP+3cYH7LRrME96S6H1AJLqlNa3C+td0c4MGt+bd5Udea5Zd4JKeQbMmCPr4LV9so9PhVo+haQ5VxVOBxYoMxlBEtp7RBp3sBqNElMzN+eHtUWyAuRinRZfsASdN29
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11861

ssi.c had added in 2007, but has been not used, because it has no tristate
tile. Which means it needs to be selected from other CONFIG. But no CONFIG
is selecting it during this 20 years.

	config SND_SOC_SH4_SSI
=>		tristate

Renesas R-Car has SSI (above is for Renesas SuperH) (I guess originally
these are same device), but is now supported by rsnd driver with some other
peripherals.

ssi.c has had a few updates so far, but they are only mechanical changes.
I think no one have been using it, because I got compile error when I hack
the Kconfig and compile it. The error is easy to fix, but I don't think it
has worth doing. This kind of driver makes maintenance difficult. Because
we are now using git, it is easy to get it back if needed. Let's move it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/renesas/Kconfig  |   3 -
 sound/soc/renesas/Makefile |   2 -
 sound/soc/renesas/ssi.c    | 403 -------------------------------------
 3 files changed, 408 deletions(-)
 delete mode 100644 sound/soc/renesas/ssi.c

diff --git a/sound/soc/renesas/Kconfig b/sound/soc/renesas/Kconfig
index 7b00c6a73687f..4cbd0ee31a1e7 100644
--- a/sound/soc/renesas/Kconfig
+++ b/sound/soc/renesas/Kconfig
@@ -19,9 +19,6 @@ config SND_SOC_SH4_HAC
 	select AC97_BUS
 	select SND_SOC_AC97_BUS
 
-config SND_SOC_SH4_SSI
-	tristate
-
 config SND_SOC_SH4_FSI
 	tristate "SH4 FSI support"
 	depends on SUPERH || COMMON_CLK
diff --git a/sound/soc/renesas/Makefile b/sound/soc/renesas/Makefile
index f0e19cbd1581b..fa2c258460f99 100644
--- a/sound/soc/renesas/Makefile
+++ b/sound/soc/renesas/Makefile
@@ -5,11 +5,9 @@ obj-$(CONFIG_SND_SOC_PCM_SH7760)	+= snd-soc-dma-sh7760.o
 
 ## audio units found on some SH-4
 snd-soc-hac-y		:= hac.o
-snd-soc-ssi-y		:= ssi.o
 snd-soc-fsi-y		:= fsi.o
 snd-soc-siu-y		:= siu_pcm.o siu_dai.o
 obj-$(CONFIG_SND_SOC_SH4_HAC)	+= snd-soc-hac.o
-obj-$(CONFIG_SND_SOC_SH4_SSI)	+= snd-soc-ssi.o
 obj-$(CONFIG_SND_SOC_SH4_FSI)	+= snd-soc-fsi.o
 obj-$(CONFIG_SND_SOC_SH4_SIU)	+= snd-soc-siu.o
 
diff --git a/sound/soc/renesas/ssi.c b/sound/soc/renesas/ssi.c
deleted file mode 100644
index 96cf523c22734..0000000000000
--- a/sound/soc/renesas/ssi.c
+++ /dev/null
@@ -1,403 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-//
-// Serial Sound Interface (I2S) support for SH7760/SH7780
-//
-// Copyright (c) 2007 Manuel Lauss <mano@roarinelk.homelinux.net>
-//
-// dont forget to set IPSEL/OMSEL register bits (in your board code) to
-// enable SSI output pins!
-
-/*
- * LIMITATIONS:
- *	The SSI unit has only one physical data line, so full duplex is
- *	impossible.  This can be remedied  on the  SH7760 by  using the
- *	other SSI unit for recording; however the SH7780 has only 1 SSI
- *	unit, and its pins are shared with the AC97 unit,  among others.
- *
- * FEATURES:
- *	The SSI features "compressed mode": in this mode it continuously
- *	streams PCM data over the I2S lines and uses LRCK as a handshake
- *	signal.  Can be used to send compressed data (AC3/DTS) to a DSP.
- *	The number of bits sent over the wire in a frame can be adjusted
- *	and can be independent from the actual sample bit depth. This is
- *	useful to support TDM mode codecs like the AD1939 which have a
- *	fixed TDM slot size, regardless of sample resolution.
- */
-
-#include <linux/init.h>
-#include <linux/module.h>
-#include <linux/platform_device.h>
-#include <sound/core.h>
-#include <sound/pcm.h>
-#include <sound/initval.h>
-#include <sound/soc.h>
-#include <asm/io.h>
-
-#define SSICR	0x00
-#define SSISR	0x04
-
-#define CR_DMAEN	(1 << 28)
-#define CR_CHNL_SHIFT	22
-#define CR_CHNL_MASK	(3 << CR_CHNL_SHIFT)
-#define CR_DWL_SHIFT	19
-#define CR_DWL_MASK	(7 << CR_DWL_SHIFT)
-#define CR_SWL_SHIFT	16
-#define CR_SWL_MASK	(7 << CR_SWL_SHIFT)
-#define CR_SCK_MASTER	(1 << 15)	/* bitclock master bit */
-#define CR_SWS_MASTER	(1 << 14)	/* wordselect master bit */
-#define CR_SCKP		(1 << 13)	/* I2Sclock polarity */
-#define CR_SWSP		(1 << 12)	/* LRCK polarity */
-#define CR_SPDP		(1 << 11)
-#define CR_SDTA		(1 << 10)	/* i2s alignment (msb/lsb) */
-#define CR_PDTA		(1 << 9)	/* fifo data alignment */
-#define CR_DEL		(1 << 8)	/* delay data by 1 i2sclk */
-#define CR_BREN		(1 << 7)	/* clock gating in burst mode */
-#define CR_CKDIV_SHIFT	4
-#define CR_CKDIV_MASK	(7 << CR_CKDIV_SHIFT)	/* bitclock divider */
-#define CR_MUTE		(1 << 3)	/* SSI mute */
-#define CR_CPEN		(1 << 2)	/* compressed mode */
-#define CR_TRMD		(1 << 1)	/* transmit/receive select */
-#define CR_EN		(1 << 0)	/* enable SSI */
-
-#define SSIREG(reg)	(*(unsigned long *)(ssi->mmio + (reg)))
-
-struct ssi_priv {
-	unsigned long mmio;
-	unsigned long sysclk;
-	int inuse;
-} ssi_cpu_data[] = {
-#if defined(CONFIG_CPU_SUBTYPE_SH7760)
-	{
-		.mmio	= 0xFE680000,
-	},
-	{
-		.mmio	= 0xFE690000,
-	},
-#elif defined(CONFIG_CPU_SUBTYPE_SH7780)
-	{
-		.mmio	= 0xFFE70000,
-	},
-#else
-#error "Unsupported SuperH SoC"
-#endif
-};
-
-/*
- * track usage of the SSI; it is simplex-only so prevent attempts of
- * concurrent playback + capture. FIXME: any locking required?
- */
-static int ssi_startup(struct snd_pcm_substream *substream,
-		       struct snd_soc_dai *dai)
-{
-	struct ssi_priv *ssi = &ssi_cpu_data[dai->id];
-	if (ssi->inuse) {
-		pr_debug("ssi: already in use!\n");
-		return -EBUSY;
-	} else
-		ssi->inuse = 1;
-	return 0;
-}
-
-static void ssi_shutdown(struct snd_pcm_substream *substream,
-			 struct snd_soc_dai *dai)
-{
-	struct ssi_priv *ssi = &ssi_cpu_data[dai->id];
-
-	ssi->inuse = 0;
-}
-
-static int ssi_trigger(struct snd_pcm_substream *substream, int cmd,
-		       struct snd_soc_dai *dai)
-{
-	struct ssi_priv *ssi = &ssi_cpu_data[dai->id];
-
-	switch (cmd) {
-	case SNDRV_PCM_TRIGGER_START:
-		SSIREG(SSICR) |= CR_DMAEN | CR_EN;
-		break;
-	case SNDRV_PCM_TRIGGER_STOP:
-		SSIREG(SSICR) &= ~(CR_DMAEN | CR_EN);
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
-static int ssi_hw_params(struct snd_pcm_substream *substream,
-			 struct snd_pcm_hw_params *params,
-			 struct snd_soc_dai *dai)
-{
-	struct ssi_priv *ssi = &ssi_cpu_data[dai->id];
-	unsigned long ssicr = SSIREG(SSICR);
-	unsigned int bits, channels, swl, recv, i;
-
-	channels = params_channels(params);
-	bits = params->msbits;
-	recv = (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) ? 0 : 1;
-
-	pr_debug("ssi_hw_params() enter\nssicr was    %08lx\n", ssicr);
-	pr_debug("bits: %u channels: %u\n", bits, channels);
-
-	ssicr &= ~(CR_TRMD | CR_CHNL_MASK | CR_DWL_MASK | CR_PDTA |
-		   CR_SWL_MASK);
-
-	/* direction (send/receive) */
-	if (!recv)
-		ssicr |= CR_TRMD;	/* transmit */
-
-	/* channels */
-	if ((channels < 2) || (channels > 8) || (channels & 1)) {
-		pr_debug("ssi: invalid number of channels\n");
-		return -EINVAL;
-	}
-	ssicr |= ((channels >> 1) - 1) << CR_CHNL_SHIFT;
-
-	/* DATA WORD LENGTH (DWL): databits in audio sample */
-	i = 0;
-	switch (bits) {
-	case 32: ++i;
-	case 24: ++i;
-	case 22: ++i;
-	case 20: ++i;
-	case 18: ++i;
-	case 16: ++i;
-		 ssicr |= i << CR_DWL_SHIFT;
-	case 8:	 break;
-	default:
-		pr_debug("ssi: invalid sample width\n");
-		return -EINVAL;
-	}
-
-	/*
-	 * SYSTEM WORD LENGTH: size in bits of half a frame over the I2S
-	 * wires. This is usually bits_per_sample x channels/2;  i.e. in
-	 * Stereo mode  the SWL equals DWL.  SWL can  be bigger than the
-	 * product of (channels_per_slot x samplebits), e.g.  for codecs
-	 * like the AD1939 which  only accept 32bit wide TDM slots.  For
-	 * "standard" I2S operation we set SWL = chans / 2 * DWL here.
-	 * Waiting for ASoC to get TDM support ;-)
-	 */
-	if ((bits > 16) && (bits <= 24)) {
-		bits = 24;	/* these are padded by the SSI */
-		/*ssicr |= CR_PDTA;*/ /* cpu/data endianness ? */
-	}
-	i = 0;
-	swl = (bits * channels) / 2;
-	switch (swl) {
-	case 256: ++i;
-	case 128: ++i;
-	case 64:  ++i;
-	case 48:  ++i;
-	case 32:  ++i;
-	case 16:  ++i;
-		  ssicr |= i << CR_SWL_SHIFT;
-	case 8:   break;
-	default:
-		pr_debug("ssi: invalid system word length computed\n");
-		return -EINVAL;
-	}
-
-	SSIREG(SSICR) = ssicr;
-
-	pr_debug("ssi_hw_params() leave\nssicr is now %08lx\n", ssicr);
-	return 0;
-}
-
-static int ssi_set_sysclk(struct snd_soc_dai *cpu_dai, int clk_id,
-			  unsigned int freq, int dir)
-{
-	struct ssi_priv *ssi = &ssi_cpu_data[cpu_dai->id];
-
-	ssi->sysclk = freq;
-
-	return 0;
-}
-
-/*
- * This divider is used to generate the SSI_SCK (I2S bitclock) from the
- * clock at the HAC_BIT_CLK ("oversampling clock") pin.
- */
-static int ssi_set_clkdiv(struct snd_soc_dai *dai, int did, int div)
-{
-	struct ssi_priv *ssi = &ssi_cpu_data[dai->id];
-	unsigned long ssicr;
-	int i;
-
-	i = 0;
-	ssicr = SSIREG(SSICR) & ~CR_CKDIV_MASK;
-	switch (div) {
-	case 16: ++i;
-	case 8:  ++i;
-	case 4:  ++i;
-	case 2:  ++i;
-		 SSIREG(SSICR) = ssicr | (i << CR_CKDIV_SHIFT);
-	case 1:  break;
-	default:
-		pr_debug("ssi: invalid sck divider %d\n", div);
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
-static int ssi_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
-{
-	struct ssi_priv *ssi = &ssi_cpu_data[dai->id];
-	unsigned long ssicr = SSIREG(SSICR);
-
-	pr_debug("ssi_set_fmt()\nssicr was    0x%08lx\n", ssicr);
-
-	ssicr &= ~(CR_DEL | CR_PDTA | CR_BREN | CR_SWSP | CR_SCKP |
-		   CR_SWS_MASTER | CR_SCK_MASTER);
-
-	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
-	case SND_SOC_DAIFMT_I2S:
-		break;
-	case SND_SOC_DAIFMT_RIGHT_J:
-		ssicr |= CR_DEL | CR_PDTA;
-		break;
-	case SND_SOC_DAIFMT_LEFT_J:
-		ssicr |= CR_DEL;
-		break;
-	default:
-		pr_debug("ssi: unsupported format\n");
-		return -EINVAL;
-	}
-
-	switch (fmt & SND_SOC_DAIFMT_CLOCK_MASK) {
-	case SND_SOC_DAIFMT_CONT:
-		break;
-	case SND_SOC_DAIFMT_GATED:
-		ssicr |= CR_BREN;
-		break;
-	}
-
-	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
-	case SND_SOC_DAIFMT_NB_NF:
-		ssicr |= CR_SCKP;	/* sample data at low clkedge */
-		break;
-	case SND_SOC_DAIFMT_NB_IF:
-		ssicr |= CR_SCKP | CR_SWSP;
-		break;
-	case SND_SOC_DAIFMT_IB_NF:
-		break;
-	case SND_SOC_DAIFMT_IB_IF:
-		ssicr |= CR_SWSP;	/* word select starts low */
-		break;
-	default:
-		pr_debug("ssi: invalid inversion\n");
-		return -EINVAL;
-	}
-
-	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
-	case SND_SOC_DAIFMT_BC_FC:
-		break;
-	case SND_SOC_DAIFMT_BP_FC:
-		ssicr |= CR_SCK_MASTER;
-		break;
-	case SND_SOC_DAIFMT_BC_FP:
-		ssicr |= CR_SWS_MASTER;
-		break;
-	case SND_SOC_DAIFMT_BP_FP:
-		ssicr |= CR_SWS_MASTER | CR_SCK_MASTER;
-		break;
-	default:
-		pr_debug("ssi: invalid master/secondary configuration\n");
-		return -EINVAL;
-	}
-
-	SSIREG(SSICR) = ssicr;
-	pr_debug("ssi_set_fmt() leave\nssicr is now 0x%08lx\n", ssicr);
-
-	return 0;
-}
-
-/* the SSI depends on an external clocksource (at HAC_BIT_CLK) even in
- * Master mode,  so really this is board specific;  the SSI can do any
- * rate with the right bitclk and divider settings.
- */
-#define SSI_RATES	\
-	SNDRV_PCM_RATE_8000_192000
-
-/* the SSI can do 8-32 bit samples, with 8 possible channels */
-#define SSI_FMTS	\
-	(SNDRV_PCM_FMTBIT_S8      | SNDRV_PCM_FMTBIT_U8      |	\
-	 SNDRV_PCM_FMTBIT_S16_LE  | SNDRV_PCM_FMTBIT_U16_LE  |	\
-	 SNDRV_PCM_FMTBIT_S20_3LE | SNDRV_PCM_FMTBIT_U20_3LE |	\
-	 SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_U24_3LE |	\
-	 SNDRV_PCM_FMTBIT_S32_LE  | SNDRV_PCM_FMTBIT_U32_LE)
-
-static const struct snd_soc_dai_ops ssi_dai_ops = {
-	.startup	= ssi_startup,
-	.shutdown	= ssi_shutdown,
-	.trigger	= ssi_trigger,
-	.hw_params	= ssi_hw_params,
-	.set_sysclk	= ssi_set_sysclk,
-	.set_clkdiv	= ssi_set_clkdiv,
-	.set_fmt	= ssi_set_fmt,
-};
-
-static struct snd_soc_dai_driver sh4_ssi_dai[] = {
-{
-	.name			= "ssi-dai.0",
-	.playback = {
-		.rates		= SSI_RATES,
-		.formats	= SSI_FMTS,
-		.channels_min	= 2,
-		.channels_max	= 8,
-	},
-	.capture = {
-		.rates		= SSI_RATES,
-		.formats	= SSI_FMTS,
-		.channels_min	= 2,
-		.channels_max	= 8,
-	},
-	.ops = &ssi_dai_ops,
-},
-#ifdef CONFIG_CPU_SUBTYPE_SH7760
-{
-	.name			= "ssi-dai.1",
-	.playback = {
-		.rates		= SSI_RATES,
-		.formats	= SSI_FMTS,
-		.channels_min	= 2,
-		.channels_max	= 8,
-	},
-	.capture = {
-		.rates		= SSI_RATES,
-		.formats	= SSI_FMTS,
-		.channels_min	= 2,
-		.channels_max	= 8,
-	},
-	.ops = &ssi_dai_ops,
-},
-#endif
-};
-
-static const struct snd_soc_component_driver sh4_ssi_component = {
-	.name			= "sh4-ssi",
-	.legacy_dai_naming	= 1,
-};
-
-static int sh4_soc_dai_probe(struct platform_device *pdev)
-{
-	return devm_snd_soc_register_component(&pdev->dev, &sh4_ssi_component,
-					       sh4_ssi_dai,
-					       ARRAY_SIZE(sh4_ssi_dai));
-}
-
-static struct platform_driver sh4_ssi_driver = {
-	.driver = {
-			.name = "sh4-ssi-dai",
-	},
-
-	.probe = sh4_soc_dai_probe,
-};
-
-module_platform_driver(sh4_ssi_driver);
-
-MODULE_LICENSE("GPL v2");
-MODULE_DESCRIPTION("SuperH onchip SSI (I2S) audio driver");
-MODULE_AUTHOR("Manuel Lauss <mano@roarinelk.homelinux.net>");
-- 
2.53.0

