Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013044.outbound.protection.outlook.com [40.107.159.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F8F385535;
	Mon,  1 Jun 2026 08:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780300958; cv=fail; b=hVPUrgsse3mXIgKeIr3uucTojjFp1dxSsVEH+zLroXtEGGELklSK28dCb/w3dqUgUJT8IsEHJiL4QUN04YDDosgkaW7qJHJwLAMBbb4+Mr8v8eIoY6+9jWowXZXDcJJHQOQrqAUDcU5g9XU3scAely4ElXNI0MlA6bBHd8ZJgTQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780300958; c=relaxed/simple;
	bh=3t3ythzjE6CMh65F+DZuMDL0CF2Q3yi7beJQzio0uEU=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=igFhvesDwevC1zDU493lEY+HsbV9KaLA4WJr4+mX+S+vyKcASuoazhTvvWZdWoAnRBBbka4FDbHtfh4qOvNXNBAKxKtROKLT2EF+BQLEiUQj6jaLrk0tCse88mHEoD8HZ6w9v0DrQ5E0nrzGDUK/T/hm0CG/5Y36NjpHUP55GVQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ur0bOui7; arc=fail smtp.client-ip=40.107.159.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ur0bOui7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I8ou9Xbj3vzzSjTcA4T9+nooHXeuGH33J0XU2H00dQbSR4Bj5PvyiDl9Fe6cQ2Z+gpSU02Qn4PneS10Gx5JAL7LM6/+T1M1dBbVfUFI+Kwchyf/4UN2PzCaGn3sEVVh6mAQUTVfHj5OPwUPcMLTrie+FyW0+9SVOymQyC+apAMJZIScJM5VXeoMxZiuRSFgrAwIa9j7ICyJJyZJPzZxOfDQYFqyjbLOtX9sGPyiiyzqg+FZLO4KeVKIeh8waDfGkuUblFGgNsoOMTaJRQfHwCE1Ob7SANPFdoimhlhmB215hA2Gt7vvPQQY+f05jOwA+GAVkF+vNY3oQY/MzWPFCPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GmDwkkNjK3/Ct1bjFj2dqPWt8gYXWoykvZT/QRJUS7g=;
 b=Bq8p58aYJCsspfDB1UOYYNdj5L+h3SWnrg1MUzq7KAdSkP4PcfQBf51K2UdXxfui0K7+GrxEvguKg26D7AcGufJ9fXDmI1rTq6kLnPvCoTAn0OiYl1eiTr4mCfUDhzT84LVQLRtUvytOLHHLZxfbgzLK6SLN9ObuIC0eKteC4ChmSwt05CN24vgQxV4eBlkMSurGdPHuahCFjA8yTzXsD7k/o8Q/bq7gc8Wvmf+lsomCudHdEfunq703B/OgesSC2LzDyTjK67HNPEFqKrJM5xY5QSeLbq2PM2h/m55Awyk+fKz0V0T9SootzfDD/lcSxkMom7jgwyUU+I1Hk2rwCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GmDwkkNjK3/Ct1bjFj2dqPWt8gYXWoykvZT/QRJUS7g=;
 b=ur0bOui7n3exRaEQQdXwwkgo0CokIbkRagu3m+s0f7rt2E5f7efzLtTcusZoUVnremkRVaYSUcBizr3towv11z19Vq9ygqfL5jWP6JDC9wxrj6JLpJYsL9qbDXVqMKUVKeZj3Of3se5eZ2oOdbL44NiGmf4tGSgUWdpY4K8HwjGg6S/v40znuRQVlxCsrU6nXPDpuwx7VINetFFKKOKaAjFJXAXKlck8FCnGblqH5NTwcCqgioB+NJNaAwvWXjdjWNwNUA/HIx7jWjKuQTC4HLcEN8bmE3i5cmKkZnDPSGKvUweILP7l851RLeYMDtRp+X9ezXZ1Aw3FAZ4E/eIHqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AS8PR04MB8882.eurprd04.prod.outlook.com
 (2603:10a6:20b:42d::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Mon, 1 Jun
 2026 08:02:33 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 08:02:33 +0000
From: chancel.liu@oss.nxp.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	david.rhodes@cirrus.com,
	rf@opensource.cirrus.com
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: [PATCH] ASoC: cs42xx8: Add SPI bus support for CS42448/CS42888 codec
Date: Mon,  1 Jun 2026 17:02:24 +0900
Message-ID: <20260601080224.1410292-1-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0099.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:3::14) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AS8PR04MB8882:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bf7e844-d5aa-4983-4174-08debfb42293
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|376014|366016|56012099006|18002099003|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info:
	4MCdSM9bQg7oRzvSqFT3ZXcPBlik3ud1wH/6hAmq9u/gdGn14Cwe/J+S5MNC3VLN5h7jau52KJ9ZXEAfHaBspUWAJfzTQJMU1jRtfq1WG47qa+HlAHBLet6xgh442lr5yWtwOXThhUB8s902O95ptAf50QsdOHi/2w7aQWScQ3Wvb//hXlDV7EFLbT1mkTfDEKs/dxOxdSt8Fr3aPHduieK+r5DbaMy7y5e+25dXQDg9zZ5/11UwFPzOlPE6DmyRPmlndcZehqRbJfIDvZ3DrwJrpjUslZIQp/Nqt1G/91X8HAJg/q2AM45YiyzrgV9ROH3pkJEz657OPADIl/5q68uhO88yEY1UXPGU8p13LdyPOyqT5b9VfDEl05Xq7I5I5FM+oxxUFyRwo9auMwmCTCJdFTljNuIvQ3bkeGh/V5wy6rcQjcN+4o0Wqc9QAdTS1fJkkzGxlDa2S7zBRbdaZvPdbNWwMRvg/VNWK74zrQliY2538z82YZLrvgQHnqEUGI0BjSrH7JNTALVh1e7Zj2nj28c/ETyu4GCw/iKkSwZcSN97MO/t19PAQzZ9SYW9bsLfkctBebPKz5vSuFEFYj1I2L3EElDCR292i7XtrQZbFBUafRNtdjVTg2TLT1O1Sl837+3sX4NnWu/BZx41CgXQozrtZV+WFhDshNO4PaLbpb0yLUEDfDQSUvnCgypBHY79GJempFL/sfZXEu9RPQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(366016)(56012099006)(18002099003)(11063799006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/OoC5ADvK/ubaSEPJSzYyv+ecKqOHyzWB3gIvdaL6zRW6cNT3xHB1ouIletP?=
 =?us-ascii?Q?X0zVz2en9EYDHOSvi9tm2cLkYukXwRa1iQI4cvIT+/0/28vvecXOi8SgQdHu?=
 =?us-ascii?Q?8r6Ai/nACIJYhWExrc1FzNBuZIXY+4q3nZbtFlfnzQSZ4YC1w7Awa3Vfww1H?=
 =?us-ascii?Q?wGUujaUiUdiHSx9OJw/rUTiBqrgbu3NsI5R96hto7uVIfn99DWqr4P2ka9pk?=
 =?us-ascii?Q?5+S2V7sZx/HMqHsnJ5RtEQvAFEOf2fyQ0IHOD5bIS7RYl3pg4NngeWzNPV4f?=
 =?us-ascii?Q?/HRfDdGMnv5qjmsg2yk7i1N1CfW6w/QsX4h6CvuLYwN4pJbnbxL+O6EDQs7K?=
 =?us-ascii?Q?iI8UmSGb9n7ZfoPhGGb82t0WtKucieJTvsg3uq0PDD8Ls1F3nesSS8ROfHx9?=
 =?us-ascii?Q?efeK9jnhD23ng4Ttok80LVuLoQVFz85UXH/Iq4INJbNa0SB/zG/lAbsex4gA?=
 =?us-ascii?Q?baVRF2je8SFFGdWk1Wsh8qmJFP8ef+QjfIp2wfRf7BwO+dfrQsEawCUcR7aq?=
 =?us-ascii?Q?/cmsKOBIp91pQQRiv0UcVmR1kmXKtOp7lxc2TzLbUIoUpDphsv2XIwpw0oqz?=
 =?us-ascii?Q?r+F4HuJ7XF+pRoqjm/+TxcxeYqUJL/iGv+2i4s/hWVzSUVSRGh7zAmBxtDo1?=
 =?us-ascii?Q?c7ijMzIhWmTFMbn+IMoT2/Xnf/dVVmOBLPWNNQI3k8QJEI1cZzPNSoWZxaMo?=
 =?us-ascii?Q?/7EinUSf+qGrfIErD/dV6khCn1ZJ7g5oVLyL9TUGCuoni7/vjqd5iYhCX3VY?=
 =?us-ascii?Q?RKf6nZ43PEYml6eeyI1H+f+kFF6b/ZMPWaU1vo+0Ve7nbTGyWasc0Q66jYoO?=
 =?us-ascii?Q?h9vHh3E+9DMqEkPLpFOPmizEo7Te5MHYRfEEdUN7lEooeJCjCGhzCcOG+0ou?=
 =?us-ascii?Q?WJRSXo3NON00YLGo6S/MEw/3MQg2hruTULLIpxOUh8qRwCt4XtOeyU0kW107?=
 =?us-ascii?Q?x7hR/hFeEQ4726QjYhP3bjEt/MFbI90nnSYAcRA59/CjiFk+gYLwZmf0BXoP?=
 =?us-ascii?Q?nHkOMpaFGCZlkZrazpct5bz2nhYoDxophmYdP1I9pz2J7aH3Kf2wuOKsLxUO?=
 =?us-ascii?Q?GrWIiqxjyLjeokWHkeSkdDIGPznAe+IbWQ/iPfHW9UIklxC3UiPcMiZAaz6N?=
 =?us-ascii?Q?NmkU0wXr3aV/3B/3+a9BCllftQ2XthfWoOw+CeuXAIknVtOwCGalNry0SoaH?=
 =?us-ascii?Q?YzUO0rSETWbLNEtbDOnZLS9ilQ2WA+7oP2xTdS3UMPrq6b/dXJK9+3UDYZEE?=
 =?us-ascii?Q?s9JjSP6jwuRo8AfWrlBF08kJzPfWlRG9Jz+Stywrve5EOHVWLSY2Q6/SEWAX?=
 =?us-ascii?Q?r4Yv4wCa1XubwpEPHe9NxI7Q2dHJzyzcNBwOK2TF+fQgg2695MmHdF8cpqzn?=
 =?us-ascii?Q?WE4KOve6bVu+Oe70B4laRYrTNb7D6bmF2TG+Ixdj45d0qU1O08S2AOvkuE8u?=
 =?us-ascii?Q?DHLbLhwZlTy64KudBRU0qef0BsD/YH2gwT+a//kicBF5+347sg0JBliCBNYK?=
 =?us-ascii?Q?H9Lhs5CoojhiyZ5BNowv6Vtd56kIG5Q284qGtwcLaFAT3W/9E+h+B/n0EpCG?=
 =?us-ascii?Q?uiKX7cq3vMqqcMGBSM06uS8eEwTAZ616Kwc+nfxSFlr275MtRU/NOoptdQH0?=
 =?us-ascii?Q?VYWkXIvAmPQPvVPUH+tL0OMJYRND7/poAYG7taLwCv2dqpiOrUtMg4NRcMza?=
 =?us-ascii?Q?+lO/WzcWAN+NPDyuK4/EuwODEShKjQp8X1ROW7/tWMugNdNQDfMz6VeY/gKE?=
 =?us-ascii?Q?M4b5yK8yNkpdDAyS53GkBf6lGB0P9vu0MOCrNPyPpuCjsVA6CEV5?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bf7e844-d5aa-4983-4174-08debfb42293
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 08:02:33.3233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T4M5HX7rr4TObpb/OKseWpukUgJfl9/g02BhZytCUKjnfMac/BFlpJJ2wRuwEyY6HyLNIfUrXVRFQ46fmSNBwXz2HebWkDW97m66HCj3rY3XAc2EPcge2U52mDgdRD1Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8882

From: Chancel Liu <chancel.liu@nxp.com>

The existing cs42xx8 driver only supported I2C control interface.
Add SPI bus support for the Cirrus Logic CS42448/CS42888 Audio CODEC.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/codecs/Kconfig       |   7 +++
 sound/soc/codecs/Makefile      |   2 +
 sound/soc/codecs/cs42xx8-spi.c | 104 +++++++++++++++++++++++++++++++++
 3 files changed, 113 insertions(+)
 create mode 100644 sound/soc/codecs/cs42xx8-spi.c

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index a7c61f7c7f4c..ae36f663a5ef 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -93,6 +93,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_CS4271_I2C
 	imply SND_SOC_CS4271_SPI
 	imply SND_SOC_CS42XX8_I2C
+	imply SND_SOC_CS42XX8_SPI
 	imply SND_SOC_CS43130
 	imply SND_SOC_CS4341
 	imply SND_SOC_CS4349
@@ -1077,6 +1078,12 @@ config SND_SOC_CS4271_SPI
 config SND_SOC_CS42XX8
 	tristate
 
+config SND_SOC_CS42XX8_SPI
+	tristate "Cirrus Logic CS42448/CS42888 CODEC (SPI)"
+	depends on SPI_MASTER
+	select SND_SOC_CS42XX8
+	select REGMAP_SPI
+
 config SND_SOC_CS42XX8_I2C
 	tristate "Cirrus Logic CS42448/CS42888 CODEC (I2C)"
 	depends on I2C
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 73315d017c57..aa0396e5b575 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -103,6 +103,7 @@ snd-soc-cs4271-i2c-y := cs4271-i2c.o
 snd-soc-cs4271-spi-y := cs4271-spi.o
 snd-soc-cs42xx8-y := cs42xx8.o
 snd-soc-cs42xx8-i2c-y := cs42xx8-i2c.o
+snd-soc-cs42xx8-spi-y := cs42xx8-spi.o
 snd-soc-cs43130-y := cs43130.o
 snd-soc-cs4341-y := cs4341.o
 snd-soc-cs4349-y := cs4349.o
@@ -543,6 +544,7 @@ obj-$(CONFIG_SND_SOC_CS4271_I2C)	+= snd-soc-cs4271-i2c.o
 obj-$(CONFIG_SND_SOC_CS4271_SPI)	+= snd-soc-cs4271-spi.o
 obj-$(CONFIG_SND_SOC_CS42XX8)	+= snd-soc-cs42xx8.o
 obj-$(CONFIG_SND_SOC_CS42XX8_I2C) += snd-soc-cs42xx8-i2c.o
+obj-$(CONFIG_SND_SOC_CS42XX8_SPI) += snd-soc-cs42xx8-spi.o
 obj-$(CONFIG_SND_SOC_CS43130)   += snd-soc-cs43130.o
 obj-$(CONFIG_SND_SOC_CS4341)	+= snd-soc-cs4341.o
 obj-$(CONFIG_SND_SOC_CS4349)	+= snd-soc-cs4349.o
diff --git a/sound/soc/codecs/cs42xx8-spi.c b/sound/soc/codecs/cs42xx8-spi.c
new file mode 100644
index 000000000000..d092cad02b61
--- /dev/null
+++ b/sound/soc/codecs/cs42xx8-spi.c
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Cirrus Logic CS42448/CS42888 Audio CODEC DAI SPI driver
+ *
+ * Copyright 2026 NXP
+ *
+ */
+
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/spi/spi.h>
+#include <sound/soc.h>
+
+#include "cs42xx8.h"
+
+/*
+ * CS42448/CS42888 SPI register access (from datasheet Figure 23):
+ *
+ * The SPI frame is 3 bytes:
+ *   Byte 0: chip address [7:1] = 1001111, bit[0] = R/W (0=write, 1=read)
+ *           Write: 0x9E,  Read: 0x9F
+ *   Byte 1: MAP - Memory Address Pointer
+ *           bit[7] = INCR (auto-increment for burst), bits[6:0] = address
+ *   Byte 2: data byte
+ *
+ * We configure reg_bits=16 so that regmap treats the address field as 2 bytes
+ * (big-endian). The chip address byte (0x9E/0x9F) is placed in the high byte
+ * via write_flag_mask / read_flag_mask, and the MAP register address occupies
+ * the low byte. This produces the correct 3-byte on-wire frame without any
+ * custom bus implementation:
+ *
+ *   write: [0x9E, MAP_addr, data]
+ *   read:  [0x9F, MAP_addr] -> [data]
+ */
+
+static int cs42xx8_spi_probe(struct spi_device *spi)
+{
+	struct cs42xx8_driver_data *drvdata;
+	struct regmap_config config;
+	int ret;
+
+	drvdata = (struct cs42xx8_driver_data *)spi_get_device_match_data(spi);
+	if (!drvdata)
+		return dev_err_probe(&spi->dev, -EINVAL,
+				     "failed to find driver data\n");
+
+	config = cs42xx8_regmap_config;
+	/*
+	 * reg_bits=16 makes regmap send a 2-byte address field (big-endian).
+	 * write_flag_mask/read_flag_mask are OR'd into that address field:
+	 */
+	config.reg_bits           = 16;
+	config.write_flag_mask    = 0x9E;
+	config.read_flag_mask     = 0x9F;
+	config.reg_format_endian  = REGMAP_ENDIAN_BIG;
+
+	ret = cs42xx8_probe(&spi->dev,
+			    devm_regmap_init_spi(spi, &config), drvdata);
+	if (ret)
+		return ret;
+
+	pm_runtime_enable(&spi->dev);
+	pm_request_idle(&spi->dev);
+
+	return 0;
+}
+
+static void cs42xx8_spi_remove(struct spi_device *spi)
+{
+	pm_runtime_disable(&spi->dev);
+}
+
+static const struct of_device_id cs42xx8_of_match[] = {
+	{ .compatible = "cirrus,cs42448", .data = &cs42448_data, },
+	{ .compatible = "cirrus,cs42888", .data = &cs42888_data, },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, cs42xx8_of_match);
+
+static const struct spi_device_id cs42xx8_spi_id[] = {
+	{ .name = "cs42448", .driver_data = (kernel_ulong_t)&cs42448_data },
+	{ .name = "cs42888", .driver_data = (kernel_ulong_t)&cs42888_data },
+	{ }
+};
+MODULE_DEVICE_TABLE(spi, cs42xx8_spi_id);
+
+static struct spi_driver cs42xx8_spi_driver = {
+	.driver = {
+		.name = "cs42xx8",
+		.pm = pm_ptr(&cs42xx8_pm),
+		.of_match_table = cs42xx8_of_match,
+	},
+	.probe = cs42xx8_spi_probe,
+	.remove = cs42xx8_spi_remove,
+	.id_table = cs42xx8_spi_id,
+};
+
+module_spi_driver(cs42xx8_spi_driver);
+
+MODULE_DESCRIPTION("Cirrus Logic CS42448/CS42888 ALSA SoC Codec SPI Driver");
+MODULE_AUTHOR("Chancel Liu <chancel.liu@nxp.com>");
+MODULE_LICENSE("GPL");
-- 
2.50.1

