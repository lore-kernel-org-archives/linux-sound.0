Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011000.outbound.protection.outlook.com [52.101.125.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135D133F8CA
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 02:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785466005; cv=fail; b=R8imoqK+6FhIsgmF3KGB8MR4dV1my5+QqFzXg8TVdglYwiBXVJNX161UdE856tMrIuPrtUqJZ7tganrFjkAqSHSBR+N4CEBZ41FXs5866s88+Met2qKt/2z+e7Wk7aohTm0oag7Kier7WDk9n/beMrPWyt7+4M7HfkhUNev+j1I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785466005; c=relaxed/simple;
	bh=AivgBLpJUg8coHw2UikNzQZj6vlw7gkj8nDpMUbb6r0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=MYvmjhycRRPjalZXRsMKuNa43zsh3Q39pnIfGNCsb+F8PNgyvg3smRGgcZzLkXOfVIid39Lx7veJ5V808OKElDZr/ijxHKa3hdl5RfUt9a7AZcGuvW14WauhRDxKx+oLLjFI/QlL8rtqwkrfzzhnCJgRnFO6Q2tlbD5z4qH+P8o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=bj7mkkBc; arc=fail smtp.client-ip=52.101.125.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="bj7mkkBc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B2mgbbGE7WXe2/f11HWwgKfW8aRdhQt6q8JduUVEfeKElI/U5WuBb+lzHF09R1OwzcaP2H4qe2ra6d6GOCBl+GDHRWC0qhLmDGTkoqGmMCqmdLaWmOTGWoy07a1x7Xj+y/IR9Z0478++V9Yb7c5KMDH6GSX9EBKdvX3NoDndxNStiPdZBLLa7rJAZyEbbEx6G4TQcqiBLtXfg6bhx1op82+3Wpf8AqNjQW4k6tQ6HNeAfjP1MQP51VJngEac1pmCyYBZ53DiiRhQgS+nNReiSQHbrKsrUwHh1FvwYpUeuFg+Gh/TqLSnucOeU2lA3+qNDnpIu3+c6UDF5TvfExyZEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AYsb7c5xkTb5jMaQnq1XimExs1BaKcVdh2M3maeyqyg=;
 b=UGkbuu98v/metWeP29TNHRo3Ft2GpxJZLi/SIhjTAO0JaKq5nDH8Uu6ga1Z+kkdwZpH00VSWWUSIfC+1M01C5pPYQS9YxRQ8/Px+bjsxzC2O+yRl/mlUS8K607VQr1XQqRPs4wY14oHQLqxghLnr1U7n6waWDHnZLPuBZPP8RmVpi5Afsp38Ftp2FeiYkP7BUKrP5//wk+rJILJkCWZ2mFa49b32/ofUGDe8hSJPr47ouEBznc4kzt2tpP2BjNLq6cgO+ShQWTcz+7X76b9w+QolBezMVbfZmw9X117FoN9tbmJWJnVCXxryKg+OGZsC2GSIP6X8JIMXVL84WbaMLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AYsb7c5xkTb5jMaQnq1XimExs1BaKcVdh2M3maeyqyg=;
 b=bj7mkkBcds8RmUHAAnVbopuqIcYNKYjUfp+DQTpoofrPwp4l1lJriQQW2wmaCH55sDlPBYzK/oR9yWDCIc8v0U4eyHJyAkMYQI+BV8EF6/3mAqKNjaikFXKqshdsEF167sOmwP1tmaoRRoT5AnTHqN5xPFvglexQo3Bqq4n3cuk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSZPR01MB6816.jpnprd01.prod.outlook.com (2603:1096:604:13b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 02:46:36 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 02:46:35 +0000
Message-ID: <87ik5vswok.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/4] ASoC: renesas: enable COMPILE_TEST for Migo-R / SIU
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87jyqbswp0.wl-kuninori.morimoto.gx@renesas.com>
References: <87jyqbswp0.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 31 Jul 2026 02:46:35 +0000
X-ClientProxiedBy: TYCPR01CA0150.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::19) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSZPR01MB6816:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b58ab73-2c46-4ce6-feac-08deeeadf008
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|52116014|10067099003|11063799006|56012099006|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	VoVTJRZvrPyq2lyw0WMMpBl5c6kpPxX4ruEH3n/SaZumoxOwmQUelsqZvAE49AC+dAPhDb5X1wlRku+vK4MIi1bovyAV3IfXkmznuyE4VUetqYouQRzBX1eeGq/52MeMtqo5ZEL3rBMZIrq6pOv4W4P0drkjT13Btbbr5UsDm+evBrN4xpWycMzCrsdWh/NW5sGLnAsru2YX1PoeLxIIuUTUDjVcyX0RC6/7vV93AnRrXK9hjVyqf/N8OI5fzSDa3Ge7ajGYXBGiNKX0idZtsZCv9Z9E+K+zKg/T5DuI4YRuPAOOYPMgu34jhGiKzrQSQn8Y0bNPWD4hyyZm/CZ6xd9s9m2awlsO2CEdNMjbgVgQVn/Jm2X73BFLYL4a4xZJMR8lkR/t34ak4vEiD92x3iZXhcVpSaRSvjz/TTah/nrmo3uaZnh3YKEYxSAHAjXWUkbpO8qfJBITuoD5s0dXYdKZ7+N5yD1ZT3hI44ZnHH8wexPCBL2w3XJOvbNKZy/pMYxkdDWldSdk+0deKTTT05uprUwZugju5QY0VD835RfijVuJpCRbowxubw7dqA1Gl/bK2ucZgCH4zTTCRXGamYR1xhv/DKZRywS4nuJwRnkDwX5CFr08a070RMak5hhup70WLq2p7t2coTVLXLTxRk30MX5BdAl9iiF/UzP7GtNSNGJnyCrTdF2XQTvLaQIEAHCy8YM3HbfgkwaDFbHuzw0I336KmGZ2CSeWwKuqHdA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(52116014)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eS8Bj0RdPPRA5WNiPuRemHlcdlTN+cfjF7O4lr/cLuZ1HTnCCiAtGp83hGa2?=
 =?us-ascii?Q?kDVgIG1RmEidOLWgzv+vR9kFEoo8EWs4aLolrZ4YUWfSY8CKcarimz+ILUR8?=
 =?us-ascii?Q?aVoyAfSNJ+Mt6Bvx4nfToUeBqb8LdZck4crvdCbOot4fjJGGwKF948MtYOG5?=
 =?us-ascii?Q?v5WwIuouNK8s062gUkDebgBqQmEtQ2OroMwOcDGXfpPmU8ObuqeSiFLv/tmZ?=
 =?us-ascii?Q?l4s9uMYCChPqs3ApuSXElRajN+Cl9Z/NZ5kSNnTmJhWtPiAzmuwcXAchybVS?=
 =?us-ascii?Q?yOw6noVbLmKl7M7rFPQUSz12qV3rz/xsdNjmAfQbejGiCHSySePuZD2SYMns?=
 =?us-ascii?Q?ZOz6zQqY3SZmUgSd0vm3ZXK8RReiiE3wClY/mNm4UqVKRjCXhf2ynTWIzPSY?=
 =?us-ascii?Q?fsjgV9aeom2gnsb1QFqtoQ1dt0LfKQZYdmjspPtbC/KzSyEkm8tYwB//wnGr?=
 =?us-ascii?Q?Y9ukCkGg5kiYua85rLU/txavXgeEm2IkLw0+9qXM1Bxlz8PztPIBQnsD/C5i?=
 =?us-ascii?Q?VA0Ebd1B4tbPGknjc8IBXQQjSy57MN2Q4CepR2lOZMRoS+8KP6DiwDntEo+D?=
 =?us-ascii?Q?ypT6GAdjcHbY7kGKvirtSzQUNvdWMuehY63YkaZsCTd85UGCCnjNo/mbC0O+?=
 =?us-ascii?Q?ImBIuG8OBkwG6nHaAmvaND+ARGxE6m84VYbZgEz5u4FsVeqBcW+5ln22MdET?=
 =?us-ascii?Q?+SK/Nn1TWzYo4U7ojmuszfrUj4dGYCu7pQutuw3tXADPXoA+n5DnvvnD+jDq?=
 =?us-ascii?Q?WVORzFNB9uvCyXRrq8ZrcaTG8PBBe1i7FOB5x9iaeRGD08fayVQ2i4kFGpI0?=
 =?us-ascii?Q?/6MTg30L+YccZLFh2YSBmZXEWHieHwqnhxiNgcvp1lw8103iEj+aXxVigw+U?=
 =?us-ascii?Q?pXOLk9Dj1/f5C2yUuh1aT9sHdJuRy9J6iFR9KBSTdOYi3rE49Gq+HJxFtkk+?=
 =?us-ascii?Q?1KxzbnGCgRLqAb3WLvlEe3vn1Y4AwYxg3nJvg1PjOuEH7QYxybmH5JzTzw0n?=
 =?us-ascii?Q?KDPfKZxJ/yZm4KVtw04o7YpiSerSxS9MIAdkj/cr88hwwoNC60xSjcixskuf?=
 =?us-ascii?Q?2/wSnD1pZYIwdPqn/iAqaBM48HaXrlsn5ZjW68FPGKAyDm/RyV6frWfHlIbM?=
 =?us-ascii?Q?B1DKWh1Wcckpv68u82lC8Ztu2ukrJGl3oW0gjQqfLmVIT18hFpPXrbzUrFKY?=
 =?us-ascii?Q?DxRTd0vAKOKeWWyo/blo/+y/xXi58cYLc4KZHS1jAgCP31wlekG6uL/oMnPA?=
 =?us-ascii?Q?avMsICgoy94IEcqYvoQxBa1Jiw7/4oMRw8LQS/NklYmxX1vKxNRpKhZhSG9p?=
 =?us-ascii?Q?X6A43rn1aEnKfXYDNIpwjYBxMV9QknLNg1Hw092MjYTuOXTBuSYtMuUna9Xt?=
 =?us-ascii?Q?tRy0J7vEFh22s6x8JLw+pKE67PZa0LWfX7TvDzBlVa+L2hw5LjgqEXST98Vc?=
 =?us-ascii?Q?LNyVaA0v9WbVuAM7V1cawSRO3Xjxs2IJWdmk10TFGhkBUJL1gUPaIx9nWwwz?=
 =?us-ascii?Q?pph4kBzrpeH/KrNiTm9ZJ4KhWP+MaoY3YCkm5DQhVphCxJBIvduzYLBH3ZQc?=
 =?us-ascii?Q?yzAX1Lqww9njqU8Pr7PmfwIUDmXIkUtivnxQgzwhneRert2BafIm0+/Q3ojE?=
 =?us-ascii?Q?zMoP1EJ0OFhKwdpFz6a1TGfAJSjb+GW57Y5lT5/Fo/GHV26hTaEvv2XUu+GQ?=
 =?us-ascii?Q?jzt0WIU8yfu9/HFtMRuEMFAXC+tdaGuokQD8toHg3CGiUn7Q59TLten9Bqpc?=
 =?us-ascii?Q?Av6Y5WrKjbi47W4Kj/OBPF6vFRU/qyU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b58ab73-2c46-4ce6-feac-08deeeadf008
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 02:46:35.8605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OdudOdwjKBR3UuUpur3BraL2X4+V3iO4T6w0g7QYLknMzoMP/khzsR23apmwPrTancqQFsbBmqun1zywJ19yWucIJkfBmEwEEYs9ZUdXpDxi5SPsJaCZXvKYa7wE8zT0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6816

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
 sound/soc/renesas/Kconfig | 7 ++-----
 sound/soc/renesas/migor.c | 2 --
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/sound/soc/renesas/Kconfig b/sound/soc/renesas/Kconfig
index 6520217e7407e..34f12a34d514c 100644
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
@@ -75,7 +71,8 @@ config SND_SH7760_AC97
 
 config SND_SIU_MIGOR
 	tristate "SIU sound support on Migo-R"
-	depends on SH_MIGOR && I2C && DMADEVICES
+	depends on SUPERH || ARCH_RENESAS
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

