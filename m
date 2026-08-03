Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010014.outbound.protection.outlook.com [52.101.229.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD54030674B
	for <linux-sound@vger.kernel.org>; Mon,  3 Aug 2026 01:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785722127; cv=fail; b=IX70PdFx/JtINN/rIpdUaL9qz5RtzCM5GRTM9bK0jCwesJHZcPkpeHw0k4/UybtbMZ79WGJ+GHXfbew2GQd+zWB1wNa+aI0V96byRrkn3krZrezZnihO3lVSdACfPzOV8e0ANUqHn31i2bDtP4ptpRA3GM5OaJMkYnxGGkkWqtM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785722127; c=relaxed/simple;
	bh=+9CoSVn+ehRBf4oB6AGpHy++nrujklU0DqvuoQOpRa4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=RiRv/7jLw6nE++SiAU01zNZ+gzll74D8Mbg/97yKumALN1ue+Vl9usA81bcuEEdnuJYHv4OyT7d7yPWfuoh09vd+fK5KHVmApxeaJ9P8YqfmQnT1nEptGWzWiwhGcLoNoZm/55eFmLhH1Ofb7cbsL/EYuQ6qV85Yo/QSXorSetQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=UvIdNSkC; arc=fail smtp.client-ip=52.101.229.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="UvIdNSkC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cdiXNmDz7Sfunvc5VWzN7tDT5Glps8GnuQMNrKqijr8U/3/VsMgIks7+4N4gf/ky3/Tp6stAIstMF2RI5rGcd2aONgsN+0PCBUCyVA/ztxxaJvMufMJdnPdalvFtJoyjjMmMrJqhmVO8ni9JWrITbM/Ihd7Bn1KaQrbuLFnHcwV/2ZG+2mlLDC2Tt5HXPZ2/zz7+9boYVYzu/tPSfwTeRmtsks5Ba7bFCgS7TCzr+DG84EFRjA3WotDUMCk4i765yTF924y1u58+wXGmuYPSdJkKzypOwt697+xa1oqnOenxzmvUBG8tsHeqbcAogIgzj9nyvhaIGZFZkzOy3PgcPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=75vgf5qglhH2dvf2iXVzgXv+8sDw+srHEyZarVBt61w=;
 b=lwVQ/38NqDsZg8hHicoizGxU7E9Nv1NpRd0J+jjcxtekpVRlMhXzt4yrBVtNoJzKvtipYHGIy8imcXih3CJpUeBA01Fz5KUsGSdYERfSwsJ/aEsgC489slJU90yoFcPcEwVe8+x5bLEBGa7KnP87BZhoJ2KEzI8NMWRlDgzjKdY/UZx7F33GhMKX/muHwaMJSSHxTDHTJORSagWQoh2iLjZW6+JuzRJP8+rjwQgJjEOQcVuJUoMUmXT7PmGc2OkZIeb/MxLVAeH1Ze+gJM+HaduIun8On64UqIL+8cSEutcET8ayn2hFoGvpzRyFZAZwsLh+Ha0ZnL9GTE9HQas6tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=75vgf5qglhH2dvf2iXVzgXv+8sDw+srHEyZarVBt61w=;
 b=UvIdNSkC+JzJcT9caDJiZAzPod1iDdNlC1ovs1tnrihAwfwDq+GM9FmUH1pyQKCxKxhrT7lchQtW+PdXRyUUPdYvUNvLtWco2My2j83FEZMr8kF5rhxKJ9WxeCcdE6th29t7CR5+lft1Ncl9yqzsJeNratdbndJDWzCAyUu6ccA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY4PR01MB15074.jpnprd01.prod.outlook.com (2603:1096:405:281::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 01:55:23 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 01:55:23 +0000
Message-ID: <87y0eormr9.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 1/4] ASoC: renesas: enable COMPILE_TEST for Migo-R / SIU
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87zez4rmrq.wl-kuninori.morimoto.gx@renesas.com>
References: <87zez4rmrq.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 3 Aug 2026 01:55:22 +0000
X-ClientProxiedBy: TYCP286CA0089.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::16) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY4PR01MB15074:EE_
X-MS-Office365-Filtering-Correlation-Id: ca45df8c-33da-46d0-6596-08def10247c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|23010399003|366016|38350700014|18002099003|22082099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	Rzu98Ncxb2JSexxNL2nTXUz/xaROebH8oVh1mW2xkXrgqPs85kqk6XuRkCIZ3oSbWsjUAUxxjS7ppiWmynONPeV6RZEK0DQYJkGIU61a4fH4QbX7O5rtb6GvLlCwEN88ZOzKCgshBtJFM//9wJ+dqEX+2z1Z6Dw0IqfZ72/ykcFk/fFXzS/Gd1w1P2vG5W8jY0G9c3+mxLwUEtWJJ6UmhYMTZEgCVVB8kl/vIlQYNpYxAn/iPMyvPSkrUZB0HPCmZimrZw3eYzvoiSG7o8kcrHmF+yeiAtoSsmIXvVpOMpDvpEw8NxLZyEh2uPwGvgK3bcCPtJQhgQl3xwFz31oNr6loPt9A0g9z/1g+HuQyY0qtkMVbYNgH4X8mh8TOT9NowC7FBJfD1U6ySw2uGnhNirUbPqtpLlN4E2OtxluZwsyr/xC3EBVtK93dIHsyzLZXySb+1BwoFpjPh66TFFRezLghRpO/QWTV4tFVoUQ39RaXhZeQ6iniNyTvaq/N8IhUkwS9L2TnMds+baRFNH3oETfxQ00VNgtynk+eiI3HuCVyMmYgeDCxrneh9zgT89P64APB++b6GkzRPRXqCGtnkI7EASeNQ03vnEPrUGjNtlXMcvV3E3OVAvsKb8nYQU+VqzK2Ijy/bAu7hec4bc+CaiTNMyAkVNgl2nahkaVLuZk16DwN1TM8/wMDxpSSiMZ59+l5xx6A/qoowhPhZ1nmCzqiClq7OVVmGGM+/tjm/EM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(23010399003)(366016)(38350700014)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Mj6IKrqIHPkeOiWH/pBK0Jm2UO2Dnj+GdPp4QBfvCBKFGnIanQO5WpT2UX6O?=
 =?us-ascii?Q?fUpMcVfAa6lvo2//3pDzmjp2+dWBcB1ddxgipCpmNTbPmQpGTwqedAnHhTdM?=
 =?us-ascii?Q?fpkj1t3/1i8PsBQiQE3qPGwC7AfAC0vQDxxVzwL/rj6lL+5r1kWwsKlAo7gQ?=
 =?us-ascii?Q?f03jzlVID1tgPEwW2X1Aht4gMbRVUgVECAkRirJ3qK7F0UmwZ0Mhv89GIGzZ?=
 =?us-ascii?Q?zgHxt/fgWB86ah0sfsBUYWv7cBAtw1/VDVt+cYc9R2+V1I8TJ+sxqKCLUS6i?=
 =?us-ascii?Q?ONf8U+PBTQptJ1EEvEaXg7vAvNg3HEuPqlHiSVG43Vgs4Z708Z/HKLSC+OfH?=
 =?us-ascii?Q?hK/Cpngw+t7LcXrIcBGRiN5xsPbbvUbSWLdT9at6GWKtFSNURKVW99URAye0?=
 =?us-ascii?Q?Vw9o//3e9phPjntrQvVMfYN26kscLXV3A+houYSkCtj0de6fE6EqMDXbNCRB?=
 =?us-ascii?Q?CgJgM+Q19bdv8slMpVEG1OGemlhvQhGaUNoC+8xQyQKe6XFb9WesgXa7l4G6?=
 =?us-ascii?Q?auw30SE3QF/DX8ybJirnZrQll+W77hKwpezkd0e5/Xv4LQ3JIaRNWusYo2KI?=
 =?us-ascii?Q?yQ7E6gIo61lnjBI/deWiCdovPSw3sQM7Llp6gKBs2mYRYel9P0DA/O1S+bts?=
 =?us-ascii?Q?D/eZpSWMGfLJ0xLEcDUDwJCCf6nFHpKhzlL+yE78LwpO7jB00/6ydoopBM9q?=
 =?us-ascii?Q?g/sCpC8mdIuD/Y5Sjo8wR4HTqudfrAD+kTewzhBiLD1icfMosgMLfUnFnCpC?=
 =?us-ascii?Q?Ob36aqTQ4vxYYLQ8M3bpDhJd4j681T+aca/xkNlI1JHYEMeNDDQfHAJhXMus?=
 =?us-ascii?Q?dtVY6wVfChumJ5YxhMmmzPWe59cunIrL9zRiSSL53GQLaIXE+Rw5oslNw97C?=
 =?us-ascii?Q?1p0ajUV+R4yrSx/dPwWfLSIHvH4PI7eRKdsfNaxYx2HG+/s2DNXrFLGlNyUd?=
 =?us-ascii?Q?mfJbA+F3oR/vtx1n1OMz8HOb9M0gVi6TZO74llcU1k072hhUiaf3Mki3JKsg?=
 =?us-ascii?Q?Xd/kn1sjN4lvb6Or+bowz2wWxPn/uYZIDEJOzsdTxOdva/YKz+JQm6hzWM/A?=
 =?us-ascii?Q?Rw1walAU/b0CMftJjT37FUKMYsth8bGVlD+Crw9/FNOqbKRBSgA3fkDhF026?=
 =?us-ascii?Q?M5jVR3q7OKTiu9/THoU9YROtnUsyPoYhesYcX9nUS8JUD7ysPExmd1DHCZth?=
 =?us-ascii?Q?91IatW86R4q5B/k6YYeM6utDeUOkZbVW1IrrCiYIneCumCV4cGkCiPBSYMJh?=
 =?us-ascii?Q?KX7XeZlptaaSL45Wdnf+0uaJX1hfn0QLGogwlLxe5C8omCFmxKRGouRx+TY2?=
 =?us-ascii?Q?w13cjJrURnplZ4F7MpmJ//3v/rBbFENmLnmeOOTOg3BPGmQQe0P4RHqFNz/G?=
 =?us-ascii?Q?M3N1L31Xy/Fi1BUaiOtn6TdID/TZRZ8lub8qZ8lw3+HZ6Zirqn8hFlC7hBue?=
 =?us-ascii?Q?lGHU7ux8PYqX2wJZlzSQH3vUahAuanvzcqbeDeCm7/tFpuAa/yStcL5DJMh2?=
 =?us-ascii?Q?CIHnn8HYDGMOOUyAu1AnrwGLxyZ51hq1FJDneDjcoHNGfw6Ti2aO1gE4Wx2j?=
 =?us-ascii?Q?/av4cQTVo8rivg0lymAje25Gf/2Vf6ffux+ALTkZRw/sq3kmD/5dYdh3vEyP?=
 =?us-ascii?Q?5b802bciq/f4exx8pAV29VktE0CeTedInPrBj+6y2ZYsKHF5AKY64jHW/K9+?=
 =?us-ascii?Q?imoQ3wenZISc3POjf0Tk3/a8kP5P3TDopIO/X6M7CN6azRjXA3B2uIkYRchK?=
 =?us-ascii?Q?foksvFGZ8nq/o6uRTk5JKQ+d4MoKsio=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca45df8c-33da-46d0-6596-08def10247c2
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 01:55:23.0639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JIzbnFYf/Pr8a/EKfGEHwq54g2X8OYaC3Wd6teAeYdxJns/vbvYXq5GVUt9/iFOYqIIqGadh+/pmNQghGKIXzFIOf1o3nH81WHPgSz878eQoxAdP8asvrybR35XjIHY0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15074

Migo-R / SIU are not compiled with COMPILE_TEST, and there is no defconfig
which selects them. So it is easy to be overlooked for compile test and/or
ASoC updating.

One of the reason is its complex depends / select.

SND_SOC_SH4_SIU doesn't have tristate title, which means it needs to be
selected from other CONFIG, and SND_SIU_MIGOR is it. And then, MIGOR /
SIU has many duplicated and complex dependencies.

Let's cleanup them and enable COMPILE_TEST when it was for
SuperH / SH-Mobile.

And remove #include <cpu/sh7722.h> which is not used, but be hinder for
compile test.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/renesas/Kconfig | 8 +++-----
 sound/soc/renesas/migor.c | 2 --
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/renesas/Kconfig b/sound/soc/renesas/Kconfig
index 6520217e7407e..b7a91e44c2754 100644
--- a/sound/soc/renesas/Kconfig
+++ b/sound/soc/renesas/Kconfig
@@ -30,10 +30,6 @@ config SND_SOC_SH4_FSI
 
 config SND_SOC_SH4_SIU
 	tristate
-	depends on ARCH_SHMOBILE && HAVE_CLK
-	depends on DMADEVICES
-	select DMA_ENGINE
-	select SH_DMAE
 	select FW_LOADER
 
 config SND_SOC_RCAR
@@ -75,7 +71,9 @@ config SND_SH7760_AC97
 
 config SND_SIU_MIGOR
 	tristate "SIU sound support on Migo-R"
-	depends on SH_MIGOR && I2C && DMADEVICES
+	depends on SUPERH || ARCH_SHMOBILE
+	depends on I2C
+	depends on (SH_MIGOR && SH_DMAE) || COMPILE_TEST
 	select SND_SOC_SH4_SIU
 	select SND_SOC_WM8978
 	help
diff --git a/sound/soc/renesas/migor.c b/sound/soc/renesas/migor.c
index 45fc594d331b0..ccb48e653eaa5 100644
--- a/sound/soc/renesas/migor.c
+++ b/sound/soc/renesas/migor.c
@@ -11,8 +11,6 @@
 
 #include <asm/clock.h>
 
-#include <cpu/sh7722.h>
-
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/soc.h>
-- 
2.53.0

