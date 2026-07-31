Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazhn15011015.outbound.protection.outlook.com [52.102.194.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6736C33D6E6
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 02:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.194.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785466013; cv=fail; b=ht4INGvNIIJcQT0RsKCMVfCG3GVJM0jT5Z8Kb6yNqdSKdAwm0+hfxmGSBTxqVO3THYsTA4hd4KRRL9z773DP+Vs0EBCjsYLsEcGhOG5ZwduUGr+V3sR9bjXWHT+HtiHn2O2rqVQs9dD3+FEUfOORVHY4d1avdvgT6w1cLS6I3m8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785466013; c=relaxed/simple;
	bh=W23oCxxxoNirfkdn4Pp8lyRasOidW6gjRFaBFlrMxRw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=HicivFfMsnUghOAqhQkjloJ+cXAW5+T5CgHBqKpholeiCLIkf+IESTtqT9b5j3GnvLkSsfxB6+ipZgPQIoURWTVDH2S1s10108j4h+7e4JueA65vnop9JVuyh5BPspH7Kg+oH600v932Zcia7u5uEWsV2tbWDrdR980XlNnbSqI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=phmE7VYx; arc=fail smtp.client-ip=52.102.194.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="phmE7VYx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UAcVO7N5nZkdP7MQx8fEw1uaLw2Td1PA3m2JDtY4Q5GCARGXR5ETMZrak7Hwq/5qpPVbgILd8P3zbFRJ/my+rC4PJUaxHC3e3nT7piLNzQuTLT6v4vFXoyutgasNUikaUu3/t+dDLU/hLBsI3CmCOwEIWRn+hFsUbxA4XTBG3s81pnZmxP/5mmHW/zihllrUfP+GaiuQuUycU16W8PN0IVJOh7WmcY1nIMEZPqW0XNK7ZcHeltgPRguo+l8neaocXbeZ/xs16ihj6wNjAu4nUdlBdaKqmR17bbHluhJ2OdoulIuqAVeCvKsaAa1BqiKb8+DrPMpKO1KYroNWk16JRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bwc3VEp19GmV6g+MNNvD2oi/qRpjrme/q0fjmI0mBY0=;
 b=i6EWBWU79pf8gkVMMvxbjtrFZZTMmMG+ZQhVOdPkmNv0LCDXhx9AtO9611JP/PX6KNgMTMYegdfp98Tb04+9wcr0DL/U/5WgJUGwsURlaqeIfY3MzutXYefIzXyzZOcygClaXEIGgeb9JpVqjHELTAbztdMnzO5jPs2jyFkzT7kKa7a5IQYYvWuxtiD/ka5p9GrKXI7i1svRdvQng40IhbxU4LOAvHduMlC5NBfME4Y4lNBJS3KvyckPJCR3L3Lm2292y8gKA9BTNLaSy+JTlBxHa2ZYpp0OL3WmEXQYfriyixw6TSFO1A3ecQqBrduTQjUhPHRN7/tExw8xrrgMew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bwc3VEp19GmV6g+MNNvD2oi/qRpjrme/q0fjmI0mBY0=;
 b=phmE7VYx/N3UGE/ZtFJD0vWjKpe3tRBJyXfLTSDNELH0dddy524cM9vUOKFn23Ty7nvOaXB9skV/hAINSrVZAgQs8S91cQYbyfh0SqgYWks4yGbQTeZ7/fq9nLLUOPPMr+X7N0LLsRGqoDb6ly7hDuQPMbPGJvHQ8ac5bdEkpLI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSZPR01MB6816.jpnprd01.prod.outlook.com (2603:1096:604:13b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 02:46:48 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 02:46:48 +0000
Message-ID: <87ecgjswo7.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 4/4] ASoC: renesas: remove ssi.c
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87jyqbswp0.wl-kuninori.morimoto.gx@renesas.com>
References: <87jyqbswp0.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 31 Jul 2026 02:46:48 +0000
X-ClientProxiedBy: TYCP286CA0282.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::9) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSZPR01MB6816:EE_
X-MS-Office365-Filtering-Correlation-Id: f868978c-0895-464e-2b6a-08deeeadf7b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|52116014|10067099003|11063799006|6133799003|56012099006|3023799007|18002099003|22082099003|38350700014|14759085003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MVPE6Mx2Xka5hb8K7CIYwxUBSi58n5E+iC2tK7NeBhxHvnCfPM80lBbSm/Tq?=
 =?us-ascii?Q?TfLDN5Xx2AndKjF+arIfQXXGJYPYunr0cSwzHbxf/QTgNzgzvRu19VBS0bzK?=
 =?us-ascii?Q?so+BHlVSHm5lqbNcp7SMMDOIMdm0AWL5S6psxXfc//cLvbMinanKjcgz9ivV?=
 =?us-ascii?Q?JdDGvgksfQ7l08cWF+QTIgF22Ob4ufKpFwqzwldl5F4ZOtQYvWLdlIhFZzkW?=
 =?us-ascii?Q?sN7zdjr/XmS5L1hLtAA2Wrwuy7AxfkPH3kSE9DR5MzyamcYWaSv7XeRglX5M?=
 =?us-ascii?Q?/ZtOyTurVK3+UlEx2gpTrG/TX9l/NArB7IH123bT4YaVEHe3/lm+om+J+Ciw?=
 =?us-ascii?Q?vYi5AQzADcm58RTXPV4IMQ56K53n3+Kk9dg8fpkP7J9ePhATibzRS57bgeYm?=
 =?us-ascii?Q?C29kNrKaCt68hF/Mzr4L9fx2Dzk6ybvSuk1+BT52TOLCqUQ6y2pShl2+pao7?=
 =?us-ascii?Q?EhDtuaCma6OJtYUMJpMU+MmFq72wWfNQCKVhRxMLEy+lF5+QPIC4lWr1MI9T?=
 =?us-ascii?Q?DY6795D+OXlboJfCczx109LdsAiV80FzeDOSMiNxF24cEn/+UQUB60CjRK0L?=
 =?us-ascii?Q?FJldBRwPxiXGCP37UVqJTPGCI+9rvVmUCmueSokVp08VKn9GRn9E/bTuwqdh?=
 =?us-ascii?Q?fOC6HIDkb5PAvHhfT/R8zCGr+CUxpCNbLvLWRb2k2gFwL3/QjGeCKoBSbcBG?=
 =?us-ascii?Q?nHWrEiyfiDXjqx5C7GUnv4S6fts9EH5ZXJGvRn81CMb3qqBOel4TsWchibbr?=
 =?us-ascii?Q?qrR5iGmXzonp2kGi65k7UPxBVJlWGDamsyF2C1vtMEEn7I8R/Lnd3CTuhXgk?=
 =?us-ascii?Q?BUaf7T3R9KImskgdUigxaq8zIGc/p2ZEBgE8SVwCVsrc+xZrdPvz1SvmTn1b?=
 =?us-ascii?Q?9RIM7/VcMPypIoa5ZxmmzGNwzLDzk7ipBojTcytm0v77ML2Y0NS4+Z1Og1l7?=
 =?us-ascii?Q?ek04GGBovL9SvpkiTe1rorTVClJuiu+0G7nF7lUzy5OmDCSggFRYkR6zXvHG?=
 =?us-ascii?Q?qBqu1Zu3q7Z9Mg2KC1fSrYT6yXqASSnYLC/2O35SZE9diT9OxK1/dtBaVqsi?=
 =?us-ascii?Q?AlejZLKxvovGvh9u8XuBphy1kVps9gZbm1L2ksJfn25bGt5VXf0QUuE3FARs?=
 =?us-ascii?Q?g9vhIMOSa47MKE+kPnpQzYb5g+XXfgQO3jXBx+rIfVnnTtTV3kkHRcaWOq94?=
 =?us-ascii?Q?5IhL8s8BWXZieoAM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:5;SRV:;IPV:NLI;SFV:SPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:OSPM;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(52116014)(10067099003)(11063799006)(6133799003)(56012099006)(3023799007)(18002099003)(22082099003)(38350700014)(14759085003);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vHry1nI/axmlzRhHF26Xb4fd8sFHw2tKUxdrvrw1Z3Y1W2UyzaLjxdR3eav+?=
 =?us-ascii?Q?2cCrbksg7g6/NXX6XZ4YT/vTbduckamexL3D6/oyt6x5aOkNwRc6o2JiDOkm?=
 =?us-ascii?Q?/Jvjyxv2ymnTwLrjSPXlggvbnNDBx3iKMhfJvoH61Y1YyVJnrQK4dpifpI73?=
 =?us-ascii?Q?oqHBZrfOV2Xx7VZv0OxFx3hejcQNb9WYpXAzuAsT341VsrY7/oGv1zMU/BLQ?=
 =?us-ascii?Q?IPKi4o4UOZp/Zx3UbFJNHfFwvRFuO42QbKT6k4DAiSZOgGkO5y4hDbMcMMHg?=
 =?us-ascii?Q?2GtgnrBlqebEKvIS0uO/Td3+STeqda8s16reKgYbu3wZm+g7Lz3emtkQaAtW?=
 =?us-ascii?Q?bTFfYOUXCsMTqbASwUkUQfqa0tJuMY661Yh8L0QKKl8rscZh7N8vYerQScoe?=
 =?us-ascii?Q?MpV+pk7eoKCUaVCwdF3i5A4s11HiciSKJtixCe4+XyCqoowq0wzSLBSEJMog?=
 =?us-ascii?Q?GIn1YCE6g8NAaJugNQzo0xPdl8tgYVqw5QUFceV7NqaNWI6417A9IDFLrfcG?=
 =?us-ascii?Q?gVbkfSwE3dz8Dex1cCCPug434thkpOSYvFQynbvYeqrxdQeZplMcLpEQoZCS?=
 =?us-ascii?Q?FKB/A8nhBcB0HezDEu+hgJkPWax52BIDaFewmKQgcv/fEHOmIaZsPEo9LhwU?=
 =?us-ascii?Q?xgTUrT+y5X7hg/pn5NgNQ1+9f8KXUXx6ZQc/kJInpz/9kCUn50W6HhfvE042?=
 =?us-ascii?Q?/3CqWhRXvsXMRm7M1KvapMsAXQTVc2u2yD3yRuJn8OSP+mW4+gBaLtSmbqiG?=
 =?us-ascii?Q?0cJNfjaonk3UbnWyHjZxQKuqi1TIBfr7/tLzYrXnK69vwEPG8j3HTPV6vxox?=
 =?us-ascii?Q?PoJvt+ZbXj/R18xtM1ZHC28hHdDpOZUdDb9BG5dB1PFlxYznT3tUB0N+KEzr?=
 =?us-ascii?Q?AcPYUOvqOwbTvhZ7cyx/jw/oCRWuuP4OE4kHb0nMSD3oN26spWUrrxJwTGEk?=
 =?us-ascii?Q?Pb1tkeFHgykEULCN2NPMaAkPhZGpR+tgz2y52ksWQJo3H1qCnKUGga+8q0/0?=
 =?us-ascii?Q?mG9vKA8m3G03TpCLuRe57Iw7v6ybyD9dME1deON+MzR4c6sGJqjsqIYC65Tu?=
 =?us-ascii?Q?ZXzZWY8UBFmeXub2NjU5jyPQdfvuKfwQle3dLO6dChetRIB1kNwzQPdzXAM+?=
 =?us-ascii?Q?X73S7+G9uvgSQYlbem8JFVvjupJ18VsLDqqupFhSGaYgvU1P637sfoeHkPqJ?=
 =?us-ascii?Q?Fv1xs2g9Ha66YCwAW4hd1EdzcBDNUwE8gn7buJNvr6tbmgRz+abSMiikSK76?=
 =?us-ascii?Q?B75ijcXj+0MB8sPjlr5AhMaZ6b6CDkUMYxUFZdN1U3qj1SKLA7iVCCyxCXIa?=
 =?us-ascii?Q?PNEg1em8Zxfbpz54aWWEljpzbT9TcI7JdRgHuQqu676sB+9iSp7vokdMfkLj?=
 =?us-ascii?Q?AyC2frtFagzhUubIFYGTHE4EF9iAcpPdfMheqP8s/SdO0o57UhU2vp4XZ68f?=
 =?us-ascii?Q?6kKClgaa7JSTnQLoYIFxspVTxfGhTd0xIr2GaRl+jhhGZsQI0U0aK/h6yWpy?=
 =?us-ascii?Q?nnaZGH/5dwv+6D5SpKgyJUHvV9Oe9cDQLMvTDQ/N2vmNQoImW81lLgkYomif?=
 =?us-ascii?Q?3IVcFzOZmUsNtsYk6H3F+H8oj2uRPGvyn0FEYUNQAT153VZ+w4V+y/s0zzac?=
 =?us-ascii?Q?6IX54/4mVsyPORSRufgGq5FIA5r2fAdxkd456jTUmcp8JVVjn4MEHSJ/s6hP?=
 =?us-ascii?Q?YL7bblnmPDZ/Vvxeq7qvqw5jP7jmziaB95lRV9R29hOLPoJwOWpcjzHrggRe?=
 =?us-ascii?Q?leDz21rxSMTkVU/A9B35F44NjyAnIlJ2kEXBoYzJ6ZaEw6HO6ii0KcKcEWN8?=
X-MS-Exchange-AntiSpam-MessageData-1:
	srzIkuU8OHYpFAh288MSFnBg7aS5gf0//JMxV/Z7c/DDTNmvED3WQ/+hRQRqr96Tiif6oWe+LmlMdQscJfb0qqKh01HGeDYXSSb5EtKmJvIvGYkS9UaTa+Ye
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f868978c-0895-464e-2b6a-08deeeadf7b3
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 02:46:48.6577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MzMkleyHv3AmyD7RsCJ3Q+Xx/JdkoMxHCoX5QY/QQK4Ne6p0wZvytZHnsGRUU5xo7Vs0w+dJZy0qZwHvrj+hj36AI+MQ6Yx7XKeuM8bjq1oobCHpBQ62nqVyFB5gkPoF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6816

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
index 8b04a42c82c3f..22f9b4740b7d8 100644
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

