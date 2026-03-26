Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013021.outbound.protection.outlook.com [40.107.201.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B65B3A6416;
	Thu, 26 Mar 2026 18:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774549080; cv=fail; b=PJVJ7LO2In9QUZ351hH4cn0R38GOy9bU9BeVso7v3e3vzooLdVCucfgDhh8+xCbjqvcJbKgzBCN9c+MqKX+KvO1Nh5JPuE8IX/m2czmSyzksKf8FwZcKE/lb7n25DlRRixHxmSN9Uj+M6AyGL2MBy1q5KqZ/50rcIysdQeqYji4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774549080; c=relaxed/simple;
	bh=vRhkjaFNphc2M2TpQiEllWK2oZEKRbNwFRI4mG8KgVo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Gjypb7tjzqUHxyBQQDE4R9L9yQb+Z3ewxTTV2VoaMS3v+jAIPeJwF8dLcGOF6BcshqKv7XPu7Uf4H70rWgo6cNwUDcuaffjr6XlEDJcNwoDBWPwSQhhYrSE5pG6AV9M2BX+aO8fdiKyCcQxoTi57+6/SnqHgeAPYJPtUeJi/rXM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ME8lsG4f; arc=fail smtp.client-ip=40.107.201.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ME8lsG4f"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sgA3gzEI28dAVGoBeuyjfHT+BNy2aPzRe63HkdRISxKUknRNk3MASG0Y+yxSN62rifvfOSelrGkgFhaldSDS0g1D810qY+V0BrREIAZOjLn5D5BBm3weULZdi82YNxZF2B8g41s46x2iXzOjWTWc06hWw+32DHRhgPSumdEnJY/GHLjvqHcknWEiC9zmI/8NuSkSGdw5RxzP8v9+n1jh4GpQio3p6TWS+TxxTJEvG7JetW5bS0awne2IDbjtS/h2t8kqU9sELwJcmrWoeGrqDOex2/vDF8h45t6SlcUU6MR4R7+kXnUrvput2Rers/n+4hMwexH4bHd+LaVM0EqsUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8fMXgi9+p7GPbr4A5tJObQxwVxntfWg84VCf5dpvDWg=;
 b=XZG1h2WA8LJ5lmuS/w+xK25SueU/sW3imgZzeV5ZncUkjunVyRQyg2dUPihrfIU31ImjasD9EK3/sCz4SyibWxMUoxX2rwc0+gWc5ys0J9lOcgymPziwItXTWJsnvlAeeSUcHZr3gVcAaymhEaYvLo5pd32oG+CjzS56j6lI0sldLlxQxpI0vCUI18W/x7Pkfe6lgYKKqM3EywhfZiyF9eTZbqAZHLdEs9I4vj4337nWINxkZJTqk6aI8KLKYL9EFH8EghoO8F+y+Ks3/ZSU8QFO3UTanNmlLeqH1ESt32fiUKed9LWqbB4JETChKbmfSyDwc6DvSN/FuahyZ+ZGDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=linux.dev smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8fMXgi9+p7GPbr4A5tJObQxwVxntfWg84VCf5dpvDWg=;
 b=ME8lsG4fyLTRCKUkpbSCmxr1IXLgu9YNvFm/VML4NmBOn1xYdGouYv8IYY2yhrIWbPfCErwVyMMyX0Y/WStWQJ/rsLdeuX51PxTC05ckTnkNL/2ARbVa4dv8sX67aQxBslza3oQDG3UXGA5J+MqG4sIKMKpMmN3A4OUlHbrhDSQ=
Received: from MN2PR01CA0058.prod.exchangelabs.com (2603:10b6:208:23f::27) by
 CH2PR10MB4296.namprd10.prod.outlook.com (2603:10b6:610:7a::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.20; Thu, 26 Mar 2026 18:17:46 +0000
Received: from BN3PEPF0000B06D.namprd21.prod.outlook.com
 (2603:10b6:208:23f:cafe::47) by MN2PR01CA0058.outlook.office365.com
 (2603:10b6:208:23f::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.32 via Frontend Transport; Thu,
 26 Mar 2026 18:17:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF0000B06D.mail.protection.outlook.com (10.167.243.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.0 via Frontend Transport; Thu, 26 Mar 2026 18:17:44 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 13:17:42 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 13:17:42 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Mar 2026 13:17:42 -0500
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62QIHU8Z2094511;
	Thu, 26 Mar 2026 13:17:37 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <broonie@kernel.org>,
	<ckeepax@opensource.cirrus.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <cezary.rojewski@intel.com>,
	<peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
	<ranjani.sridharan@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <baojun.xu@ti.com>, <shenghao-ding@ti.com>,
	<sandeepk@ti.com>, <v-hampiholi@ti.com>, Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v2 2/4] ASoC: tac5xx2-sdw: add soundwire based codec driver
Date: Thu, 26 Mar 2026 23:47:10 +0530
Message-ID: <20260326181712.2274-2-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20260326181712.2274-1-niranjan.hy@ti.com>
References: <20260326181712.2274-1-niranjan.hy@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06D:EE_|CH2PR10MB4296:EE_
X-MS-Office365-Filtering-Correlation-Id: 80f7dc76-d0e5-44c6-6a1d-08de8b63fa40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|7416014|376014|13003099007|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	+V+2WE2VZbeGKU04noeASmcHcR/TgZas9o9ADOen36os465mx+CtMk/WVxfxd5k/TWjqH0wbmGaYvZZsaA4YvkJteN2kdwO0qtb1ZzTVMq/uPMk2hMfCbVb32Wdk4t9WEHM3PD0cwyjD+5SoAq56ijjvYE7mDcwluWYNYPazHDL3gAcRSPbdze3O7RwUrn9c5BLHHwOi3unXZZyygoJvS9L64fGUrnk2IocfDJ1zFJAsZlrEoLrOqjabWBqYUA9JpSaZDjArhYpfuGVqpRaeX1BR9/cNoiRePbdGyVgdXZy4HYGtvsu3sbYYFSJW9js8U+tCOhSuWFUFPylDj5BKU1voblYjU0YEL+l/X97GIdYMuTsBLEx3LVeF+relGllN0kXGgBQIEc64M0ST3NEfsA7ojNstu4yGOaCpyX9pK62bF9HJtPMZAthGUhx/95A/4dDus+pD8Jk5bXXFBNu2YmTf3tKN6pE4XcwXxrry4zuiriqO7VSyddqBO8z78/swyIaUOaoY+UQiWWHhnLgozoIiF6JkjH3ONygoh/CxH0xKFGfluWEIA/j89yllJ0yA9A230RYrIRO8sy7t7RDM/JuxgqirAM5XMIPC22Nl1jLtQFDJjh52LSVNtcLrSsW7Vzptllh4v1QCcQ8eSSoKfMWhXzHaIUyTGcNIqXMxGJAJt5QyGM23yXWocjuU17tc0lordEpAQRCd8iKbrStYzQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(7416014)(376014)(13003099007)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	E5TGPmhPIBS6hWOecJxsTrFbTjG6sNvoYXBmemE9VNCFe3BH77FNDx1m3LjtYLuGc4hO85YKFra1+XcdcRPrunO6Pb5mpspqPBPizZUYPN83C3xvhrichYRSqM8Z7tPkgu7eZBO/1wZO35t3btS+C4XCZOhbJCIrCyFqd14g9K59iyP528ngW99OL0o9H8EHhPlg2EpnnG0tzvJVpMYYzf3eYBQka+5FibXSjsCSyd8RthGwWSc3fPabIJXczT0I1YKRJF2nxbUllwuO0HPL+67Gk5OqnUzEbsV/D+bG+GM+SsQmD2XpGBbLGQBSmRGlsCEZuqyWRvixzYTlbL0v8s/2YCuV5gz40fwd8iRjwuwZ6evJhghjGmv/Aq8Fgvg4pEVKskU54G8gEopdCoG/Y7SG8Hv6LynrOTJmbjoa0129/6EY8E5woA6JIRy1LYtH
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 18:17:44.8503
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80f7dc76-d0e5-44c6-6a1d-08de8b63fa40
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4296

Add codec driver for tac5xx2 family of devices.
This includes the support for
  1. tac5572 - DAC, PDM, UAJ and HID
  2. tas2883 - Amplifier with DSP
  3. tac5672 - Similar to tac5572 with feedback
  4. tac5682 - Similar to tac5672 with Amplifier DSP.

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
---
v2:
- Define and use consistent macros for register access to improve code
  readability and maintainability
- Replace complex event handlers with simpler DAPM widget implementations
  using direct register control for muting/unmuting and enabling/disabling
  components
- Replace custom volume controls with standard Q7.8 controls from the
  SDCA framework
- Fix PDE power state transitions with proper verification of actual power state
- Combine separate locks into a single ops\_lock to protect both firmware
  operations and power state transitions
- Clean up interrupt handling by removing unnecessary register accesses
- Fix headset microphone control by using the correct mono channel value
- Add comments to clarify firmware handling and critical sections
---
 sound/soc/codecs/Kconfig       |   11 +
 sound/soc/codecs/Makefile      |    2 +
 sound/soc/codecs/tac5xx2-sdw.c | 2151 ++++++++++++++++++++++++++++++++
 sound/soc/codecs/tac5xx2.h     |  259 ++++
 4 files changed, 2423 insertions(+)
 create mode 100644 sound/soc/codecs/tac5xx2-sdw.c
 create mode 100644 sound/soc/codecs/tac5xx2.h

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index ca3e47db126e3..4a962193301fe 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -264,6 +264,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_STA529
 	imply SND_SOC_STAC9766
 	imply SND_SOC_STI_SAS
+	imply SND_SOC_TAC5XX2_SDW
 	imply SND_SOC_TAS2552
 	imply SND_SOC_TAS2562
 	imply SND_SOC_TAS2764
@@ -2139,6 +2140,16 @@ config SND_SOC_STAC9766
 config SND_SOC_STI_SAS
 	tristate "codec Audio support for STI SAS codec"
 
+config SND_SOC_TAC5XX2_SDW
+	tristate "Texas Instruments TAC5XX2 SoundWire Smart Amplifier"
+	depends on SOUNDWIRE
+	depends on SND_SOC_SDCA
+	help
+	  This option enables support for Texas Instruments TAC5XX2 family
+	  of SoundWire Smart Amplifiers. This includes TAC5572, TAC5672,
+	  TAC568 and TAS2883. To compile this driver as a module, choose
+	  M here: the module will be called snd-soc-tac5xx2.
+
 config SND_SOC_TAS2552
 	tristate "Texas Instruments TAS2552 Mono Audio amplifier"
 	depends on I2C
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 172861d17cfd0..f64e75dd2f35d 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -313,6 +313,7 @@ snd-soc-sta350-y := sta350.o
 snd-soc-sta529-y := sta529.o
 snd-soc-stac9766-y := stac9766.o
 snd-soc-sti-sas-y := sti-sas.o
+snd-soc-tac5xx2-sdw-y := tac5xx2-sdw.o
 snd-soc-tas5086-y := tas5086.o
 snd-soc-tas571x-y := tas571x.o
 snd-soc-tas5720-y := tas5720.o
@@ -746,6 +747,7 @@ obj-$(CONFIG_SND_SOC_STA350)   += snd-soc-sta350.o
 obj-$(CONFIG_SND_SOC_STA529)   += snd-soc-sta529.o
 obj-$(CONFIG_SND_SOC_STAC9766)	+= snd-soc-stac9766.o
 obj-$(CONFIG_SND_SOC_STI_SAS)	+= snd-soc-sti-sas.o
+obj-$(CONFIG_SND_SOC_TAC5XX2_SDW)	+= snd-soc-tac5xx2-sdw.o
 obj-$(CONFIG_SND_SOC_TAS2552)	+= snd-soc-tas2552.o
 obj-$(CONFIG_SND_SOC_TAS2562)	+= snd-soc-tas2562.o
 obj-$(CONFIG_SND_SOC_TAS2764)	+= snd-soc-tas2764.o
diff --git a/sound/soc/codecs/tac5xx2-sdw.c b/sound/soc/codecs/tac5xx2-sdw.c
new file mode 100644
index 0000000000000..fdca52a829bfd
--- /dev/null
+++ b/sound/soc/codecs/tac5xx2-sdw.c
@@ -0,0 +1,2151 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// ALSA SoC Texas Instruments TAC5XX2 Audio Smart Amplifier
+//
+// Copyright (C) 2025 Texas Instruments Incorporated
+// https://www.ti.com
+//
+// Author: Niranjan H Y <niranjan.hy@ti.com>
+
+#include <linux/err.h>
+#include <linux/firmware.h>
+#include <linux/init.h>
+#include <linux/module.h>
+#include <sound/pcm_params.h>
+#include <linux/pm.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_registers.h>
+#include <linux/soundwire/sdw_type.h>
+#include <linux/pci.h>
+#include <sound/sdw.h>
+#include <sound/soc.h>
+#include <sound/tlv.h>
+#include <sound/sdca_function.h>
+#include <sound/sdca_regmap.h>
+#include <sound/jack.h>
+#include <linux/unaligned.h>
+
+#include "tac5xx2.h"
+#include <sound/sdca_asoc.h>
+
+#define TAC5XX2_PROBE_TIMEOUT_MS 3000
+
+#define TAC5XX2_DEVICE_RATES (SNDRV_PCM_RATE_44100 | \
+			      SNDRV_PCM_RATE_48000 | \
+			      SNDRV_PCM_RATE_96000 | \
+			      SNDRV_PCM_RATE_88200)
+#define TAC5XX2_DEVICE_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | \
+				SNDRV_PCM_FMTBIT_S24_LE | \
+				SNDRV_PCM_FMTBIT_S32_LE)
+/* Define channel constants */
+#define TAC_CHANNEL_LEFT	1
+#define TAC_CHANNEL_RIGHT	2
+#define TAC_JACK_MONO_CS	2
+
+#define TAC_MUTE_REG(func, fu, ch) \
+	SDW_SDCA_CTL(TAC_FUNCTION_ID_##func, TAC_SDCA_ENT_##fu, \
+		     TAC_SDCA_CHANNEL_MUTE, TAC_CHANNEL_##ch)
+#define TAC_USAGE_REG(func, ent) \
+	SDW_SDCA_CTL(TAC_FUNCTION_ID_##func, TAC_SDCA_ENT_##ent, \
+		     TAC_SDCA_CTL_USAGE, 0)
+#define TAC_XU_BYPASS_REG(func, xu)                        \
+	SDW_SDCA_CTL(TAC_FUNCTION_ID_##func, TAC_SDCA_ENT_##xu, \
+			TAC_SDCA_CTL_XU_BYPASS, 0)
+
+/* mute registers */
+#define FU21_L_MUTE_REG  TAC_MUTE_REG(SA, FU21, LEFT)
+#define FU21_R_MUTE_REG  TAC_MUTE_REG(SA, FU21, RIGHT)
+#define FU23_L_MUTE_REG  TAC_MUTE_REG(SA, FU23, LEFT)
+#define FU23_R_MUTE_REG  TAC_MUTE_REG(SA, FU23, RIGHT)
+#define FU26_MUTE_REG    TAC_MUTE_REG(SA, FU26, LEFT)
+#define FU11_L_MUTE_REG  TAC_MUTE_REG(SM, FU11, LEFT)
+#define FU11_R_MUTE_REG  TAC_MUTE_REG(SM, FU11, RIGHT)
+#define FU113_L_MUTE_REG TAC_MUTE_REG(SM, FU113, LEFT)
+#define FU113_R_MUTE_REG TAC_MUTE_REG(SM, FU113, RIGHT)
+#define FU41_L_MUTE_REG  TAC_MUTE_REG(UAJ, FU41, LEFT)
+#define FU41_R_MUTE_REG  TAC_MUTE_REG(UAJ, FU41, RIGHT)
+#define FU36_MUTE_REG    TAC_MUTE_REG(UAJ, FU36, RIGHT)
+
+/* it/ot usage */
+#define IT11_USAGE_REG  TAC_USAGE_REG(SM, IT11)
+#define IT41_USAGE_REG  TAC_USAGE_REG(UAJ, IT41)
+#define IT33_USAGE_REG  TAC_USAGE_REG(UAJ, IT33)
+#define OT113_USAGE_REG TAC_USAGE_REG(SM, OT113)
+#define OT45_USAGE_REG TAC_USAGE_REG(UAJ, OT45)
+#define OT36_USAGE_REG TAC_USAGE_REG(UAJ, OT36)
+
+/* xu bypass */
+#define XU12_BYPASS_REG TAC_XU_BYPASS_REG(SM, XU12)
+#define XU42_BYPASS_REG TAC_XU_BYPASS_REG(UAJ, XU42)
+
+#define TAC_DSP_ALGO_STATUS		TAC_REG_SDW(0, 3, 12)
+#define TAC_DSP_ALGO_STATUS_RUNNING	0x20
+#define TAC_FW_HDR_SIZE		4
+#define TAC_FW_FILE_HDR	 20
+#define TAC_MAX_FW_CHUNKS 512
+
+struct tac_fw_hdr {
+	u32 size;
+	u32 version_offset;
+	u32 plt_id;
+	u32 ppc3_ver;
+	u32 timestamp;
+	u8 ddc_name[64];
+};
+
+/* Firmware file/chunk structure */
+struct tac_fw_file {
+	u32 vendor_id;
+	u32 file_id;
+	u32 version;
+	u32 length;
+	u32 dest_addr;
+	u8 *fw_data;
+};
+
+/* TLV for volume control */
+static const DECLARE_TLV_DB_SCALE(tac5xx2_amp_tlv, 0, 50, 0);
+static const DECLARE_TLV_DB_SCALE(tac5xx2_dvc_tlv, -7200, 50, 0);
+
+/* Q7.8 volume control parameters: range -72dB to +6dB, step 0.5dB */
+#define TAC_DVC_STEP		128	/* 0.5 dB in Q7.8 format */
+#define TAC_DVC_MIN		(-144)	/* -72 dB / 0.5 dB step */
+#define TAC_DVC_MAX		12	/* +6 dB / 0.5 dB step */
+
+#define SOC_SINGLE_Q78_TLV(xname, xreg, tlv_array) { \
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, \
+	.name = xname, \
+	.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ | SNDRV_CTL_ELEM_ACCESS_READWRITE, \
+	.tlv.p = (tlv_array), \
+	.info = snd_soc_info_volsw, .get = q78_get_volsw, .put = q78_put_volsw, \
+	.private_value = (unsigned long)&(struct soc_mixer_control) { \
+		.reg = (xreg), .rreg = (xreg), \
+		.min = TAC_DVC_MIN, .max = TAC_DVC_MAX, \
+		.platform_max = TAC_DVC_MAX - TAC_DVC_MIN, .shift = TAC_DVC_STEP, \
+		.sign_bit = 15 \
+	} \
+}
+
+struct tac5xx2_prv {
+	struct snd_soc_component *component;
+	struct sdw_slave *sdw_peripheral;
+	struct sdca_function_data *sa_func_data;
+	struct sdca_function_data *sm_func_data;
+	struct sdca_function_data *uaj_func_data;
+	struct sdca_function_data *hid_func_data;
+	enum sdw_slave_status status;
+	/* Lock for firmware download and PDE state transitions.
+	 * Serializes FW caching/download and DAPM-driven power
+	 * state changes to prevent PDE operations during firmware load.
+	 */
+	struct mutex pde_lock;
+	struct regmap *regmap;
+	struct device *dev;
+	bool hw_init;
+	bool first_hw_init;
+	u32 part_id;
+	unsigned int cx11_value;
+	struct snd_soc_jack *hs_jack;
+	int jack_type;
+	 /* Custom fw binary. UMP File Download is not used. */
+	const u8 *fw_data;
+	size_t fw_size;
+	bool fw_cached;
+	bool fw_dl_success;
+	u8 fw_binaryname[64];
+};
+
+static const struct reg_default tac_reg_default[] = {
+	{TAC_SW_RESET, 0x0},
+	{TAC_SLEEP_MODEZ, 0x0},
+	{TAC_FEATURE_PDZ, 0x0},
+	{TAC_TX_CH_EN, 0xf0},
+	{TAC_REG_SDW(0, 0, 0x5), 0xcf},
+	{TAC_REG_SDW(0, 0, 0x6), 0xa},
+	{TAC_REG_SDW(0, 0, 0x7), 0x0},
+	{TAC_REG_SDW(0, 0, 0x8), 0xfe},
+	{TAC_REG_SDW(0, 0, 0x9), 0x9},
+	{TAC_REG_SDW(0, 0, 0xa), 0x28},
+	{TAC_REG_SDW(0, 0, 0xb), 0x1},
+	{TAC_REG_SDW(0, 0, 0xc), 0x11},
+	{TAC_REG_SDW(0, 0, 0xd), 0x11},
+	{TAC_REG_SDW(0, 0, 0xe), 0x61},
+	{TAC_REG_SDW(0, 0, 0xf), 0x0},
+	{TAC_REG_SDW(0, 0, 0x10), 0x50},
+	{TAC_REG_SDW(0, 0, 0x11), 0x70},
+	{TAC_REG_SDW(0, 0, 0x12), 0x60},
+	{TAC_REG_SDW(0, 0, 0x13), 0x28},
+	{TAC_REG_SDW(0, 0, 0x14), 0x0},
+	{TAC_REG_SDW(0, 0, 0x15), 0x18},
+	{TAC_REG_SDW(0, 0, 0x16), 0x20},
+	{TAC_REG_SDW(0, 0, 0x17), 0x0},
+	{TAC_REG_SDW(0, 0, 0x18), 0x18},
+	{TAC_REG_SDW(0, 0, 0x19), 0x54},
+	{TAC_REG_SDW(0, 0, 0x1a), 0x8},
+	{TAC_REG_SDW(0, 0, 0x1b), 0x0},
+	{TAC_REG_SDW(0, 0, 0x1c), 0x30},
+	{TAC_REG_SDW(0, 0, 0x1d), 0x0},
+	{TAC_REG_SDW(0, 0, 0x1e), 0x0},
+	{TAC_REG_SDW(0, 0, 0x1f), 0x0},
+	{TAC_REG_SDW(0, 0, 0x20), 0x0},
+	{TAC_REG_SDW(0, 0, 0x21), 0x20},
+	{TAC_REG_SDW(0, 0, 0x22), 0x21},
+	{TAC_REG_SDW(0, 0, 0x23), 0x22},
+	{TAC_REG_SDW(0, 0, 0x24), 0x23},
+	{TAC_REG_SDW(0, 0, 0x25), 0x4},
+	{TAC_REG_SDW(0, 0, 0x26), 0x5},
+	{TAC_REG_SDW(0, 0, 0x27), 0x6},
+	{TAC_REG_SDW(0, 0, 0x28), 0x7},
+	{TAC_REG_SDW(0, 0, 0x29), 0x0},
+	{TAC_REG_SDW(0, 0, 0x2a), 0x0},
+	{TAC_REG_SDW(0, 0, 0x2b), 0x0},
+	{TAC_REG_SDW(0, 0, 0x2c), 0x20},
+	{TAC_REG_SDW(0, 0, 0x2d), 0x21},
+	{TAC_REG_SDW(0, 0, 0x2e), 0x2},
+	{TAC_REG_SDW(0, 0, 0x2f), 0x3},
+	{TAC_REG_SDW(0, 0, 0x30), 0x4},
+	{TAC_REG_SDW(0, 0, 0x31), 0x5},
+	{TAC_REG_SDW(0, 0, 0x32), 0x6},
+	{TAC_REG_SDW(0, 0, 0x33), 0x7},
+	{TAC_REG_SDW(0, 0, 0x34), 0x0},
+	{TAC_REG_SDW(0, 0, 0x35), 0x90},
+	{TAC_REG_SDW(0, 0, 0x36), 0x80},
+	{TAC_REG_SDW(0, 0, 0x37), 0x0},
+	{TAC_REG_SDW(0, 0, 0x39), 0x0},
+	{TAC_REG_SDW(0, 0, 0x3a), 0x90},
+	{TAC_REG_SDW(0, 0, 0x3b), 0x80},
+	{TAC_REG_SDW(0, 0, 0x3c), 0x0},
+	{TAC_REG_SDW(0, 0, 0x3e), 0x0},
+	{TAC_REG_SDW(0, 0, 0x3f), 0x90},
+	{TAC_REG_SDW(0, 0, 0x40), 0x80},
+	{TAC_REG_SDW(0, 0, 0x41), 0x0},
+	{TAC_REG_SDW(0, 0, 0x43), 0x90},
+	{TAC_REG_SDW(0, 0, 0x44), 0x80},
+	{TAC_REG_SDW(0, 0, 0x45), 0x0},
+	{TAC_REG_SDW(0, 0, 0x47), 0x90},
+	{TAC_REG_SDW(0, 0, 0x48), 0x80},
+	{TAC_REG_SDW(0, 0, 0x49), 0x0},
+	{TAC_REG_SDW(0, 0, 0x4b), 0x90},
+	{TAC_REG_SDW(0, 0, 0x4c), 0x80},
+	{TAC_REG_SDW(0, 0, 0x4d), 0x0},
+	{TAC_REG_SDW(0, 0, 0x4f), 0x31},
+	{TAC_REG_SDW(0, 0, 0x50), 0x0},
+	{TAC_REG_SDW(0, 0, 0x51), 0x0},
+	{TAC_REG_SDW(0, 0, 0x52), 0x90},
+	{TAC_REG_SDW(0, 0, 0x53), 0x80},
+	{TAC_REG_SDW(0, 0, 0x55), 0x90},
+	{TAC_REG_SDW(0, 0, 0x56), 0x80},
+	{TAC_REG_SDW(0, 0, 0x58), 0x90},
+	{TAC_REG_SDW(0, 0, 0x59), 0x80},
+	{TAC_REG_SDW(0, 0, 0x5b), 0x90},
+	{TAC_REG_SDW(0, 0, 0x5c), 0x80},
+	{TAC_REG_SDW(0, 0, 0x5e), 0x8},
+	{TAC_REG_SDW(0, 0, 0x5f), 0x8},
+	{TAC_REG_SDW(0, 0, 0x60), 0x0},
+	{TAC_REG_SDW(0, 0, 0x61), 0x0},
+	{TAC_REG_SDW(0, 0, 0x62), 0xff},
+	{TAC_REG_SDW(0, 0, 0x63), 0xc0},
+	{TAC_REG_SDW(0, 0, 0x64), 0x5},
+	{TAC_REG_SDW(0, 0, 0x65), 0x3},
+	{TAC_REG_SDW(0, 0, 0x66), 0x0},
+	{TAC_REG_SDW(0, 0, 0x67), 0x0},
+	{TAC_REG_SDW(0, 0, 0x68), 0x0},
+	{TAC_REG_SDW(0, 0, 0x69), 0x8},
+	{TAC_REG_SDW(0, 0, 0x6a), 0x0},
+	{TAC_REG_SDW(0, 0, 0x6b), 0xa0},
+	{TAC_REG_SDW(0, 0, 0x6c), 0x18},
+	{TAC_REG_SDW(0, 0, 0x6d), 0x18},
+	{TAC_REG_SDW(0, 0, 0x6e), 0x18},
+	{TAC_REG_SDW(0, 0, 0x6f), 0x18},
+	{TAC_REG_SDW(0, 0, 0x70), 0x88},
+	{TAC_REG_SDW(0, 0, 0x71), 0xff},
+	{TAC_REG_SDW(0, 0, 0x72), 0x0},
+	{TAC_REG_SDW(0, 0, 0x73), 0x31},
+	{TAC_REG_SDW(0, 0, 0x74), 0xc0},
+	{TAC_REG_SDW(0, 0, 0x75), 0x0},
+	{TAC_REG_SDW(0, 0, 0x76), 0x0},
+	{TAC_REG_SDW(0, 0, 0x77), 0x0},
+	{TAC_REG_SDW(0, 0, 0x78), 0x0},
+	{TAC_REG_SDW(0, 0, 0x7b), 0x0},
+	{TAC_REG_SDW(0, 0, 0x7c), 0xd0},
+	{TAC_REG_SDW(0, 0, 0x7d), 0x0},
+	{TAC_REG_SDW(0, 0, 0x7e), 0x0},
+	{TAC_REG_SDW(0, 1, 0x1), 0x0},
+	{TAC_REG_SDW(0, 1, 0x2), 0x0},
+	{TAC_REG_SDW(0, 1, 0x3), 0x0},
+	{TAC_REG_SDW(0, 1, 0x4), 0x4},
+	{TAC_REG_SDW(0, 1, 0x5), 0x0},
+	{TAC_REG_SDW(0, 1, 0x6), 0x0},
+	{TAC_REG_SDW(0, 1, 0x7), 0x0},
+	{TAC_REG_SDW(0, 1, 0x8), 0x0},
+	{TAC_REG_SDW(0, 1, 0x9), 0x0},
+	{TAC_REG_SDW(0, 1, 0xa), 0x0},
+	{TAC_REG_SDW(0, 1, 0xb), 0x1},
+	{TAC_REG_SDW(0, 1, 0xc), 0x0},
+	{TAC_REG_SDW(0, 1, 0xd), 0x0},
+	{TAC_REG_SDW(0, 1, 0xe), 0x0},
+	{TAC_REG_SDW(0, 1, 0xf), 0x8},
+	{TAC_REG_SDW(0, 1, 0x10), 0x0},
+	{TAC_REG_SDW(0, 1, 0x11), 0x0},
+	{TAC_REG_SDW(0, 1, 0x12), 0x1},
+	{TAC_REG_SDW(0, 1, 0x13), 0x0},
+	{TAC_REG_SDW(0, 1, 0x14), 0x0},
+	{TAC_REG_SDW(0, 1, 0x15), 0x0},
+	{TAC_REG_SDW(0, 1, 0x16), 0x0},
+	{TAC_REG_SDW(0, 1, 0x17), 0x0},
+	{TAC_REG_SDW(0, 1, 0x18), 0x0},
+	{TAC_REG_SDW(0, 1, 0x19), 0x0},
+	{TAC_REG_SDW(0, 1, 0x1a), 0x0},
+	{TAC_REG_SDW(0, 1, 0x1b), 0x0},
+	{TAC_REG_SDW(0, 1, 0x1c), 0x0},
+	{TAC_REG_SDW(0, 1, 0x1d), 0x0},
+	{TAC_REG_SDW(0, 1, 0x1e), 0x2},
+	{TAC_REG_SDW(0, 1, 0x1f), 0x8},
+	{TAC_REG_SDW(0, 1, 0x20), 0x9},
+	{TAC_REG_SDW(0, 1, 0x21), 0xa},
+	{TAC_REG_SDW(0, 1, 0x22), 0xb},
+	{TAC_REG_SDW(0, 1, 0x23), 0xc},
+	{TAC_REG_SDW(0, 1, 0x24), 0xd},
+	{TAC_REG_SDW(0, 1, 0x25), 0xe},
+	{TAC_REG_SDW(0, 1, 0x26), 0xf},
+	{TAC_REG_SDW(0, 1, 0x27), 0x8},
+	{TAC_REG_SDW(0, 1, 0x28), 0x9},
+	{TAC_REG_SDW(0, 1, 0x29), 0xa},
+	{TAC_REG_SDW(0, 1, 0x2a), 0xb},
+	{TAC_REG_SDW(0, 1, 0x2b), 0xc},
+	{TAC_REG_SDW(0, 1, 0x2c), 0xd},
+	{TAC_REG_SDW(0, 1, 0x2d), 0xe},
+	{TAC_REG_SDW(0, 1, 0x2e), 0xf},
+	{TAC_REG_SDW(0, 1, 0x2f), 0x0},
+	{TAC_REG_SDW(0, 1, 0x30), 0x0},
+	{TAC_REG_SDW(0, 1, 0x31), 0x0},
+	{TAC_REG_SDW(0, 1, 0x32), 0x0},
+	{TAC_REG_SDW(0, 1, 0x33), 0x0},
+	{TAC_REG_SDW(0, 1, 0x34), 0x0},
+	{TAC_REG_SDW(0, 1, 0x35), 0x0},
+	{TAC_REG_SDW(0, 1, 0x36), 0x0},
+	{TAC_REG_SDW(0, 1, 0x37), 0x0},
+	{TAC_REG_SDW(0, 1, 0x38), 0x98},
+	{TAC_REG_SDW(0, 1, 0x39), 0x0},
+	{TAC_REG_SDW(0, 1, 0x3a), 0x0},
+	{TAC_REG_SDW(0, 1, 0x3b), 0x0},
+	{TAC_REG_SDW(0, 1, 0x3c), 0x1},
+	{TAC_REG_SDW(0, 1, 0x3d), 0x2},
+	{TAC_REG_SDW(0, 1, 0x3e), 0x3},
+	{TAC_REG_SDW(0, 1, 0x3f), 0x4},
+	{TAC_REG_SDW(0, 1, 0x40), 0x5},
+	{TAC_REG_SDW(0, 1, 0x41), 0x6},
+	{TAC_REG_SDW(0, 1, 0x42), 0x7},
+	{TAC_REG_SDW(0, 1, 0x43), 0x0},
+	{TAC_REG_SDW(0, 1, 0x44), 0x0},
+	{TAC_REG_SDW(0, 1, 0x45), 0x1},
+	{TAC_REG_SDW(0, 1, 0x46), 0x2},
+	{TAC_REG_SDW(0, 1, 0x47), 0x3},
+	{TAC_REG_SDW(0, 1, 0x48), 0x4},
+	{TAC_REG_SDW(0, 1, 0x49), 0x5},
+	{TAC_REG_SDW(0, 1, 0x4a), 0x6},
+	{TAC_REG_SDW(0, 1, 0x4b), 0x7},
+	{TAC_REG_SDW(0, 1, 0x4c), 0x98},
+	{TAC_REG_SDW(0, 1, 0x4d), 0x0},
+	{TAC_REG_SDW(0, 1, 0x4e), 0x0},
+	{TAC_REG_SDW(0, 1, 0x4f), 0x0},
+	{TAC_REG_SDW(0, 1, 0x50), 0x1},
+	{TAC_REG_SDW(0, 1, 0x51), 0x2},
+	{TAC_REG_SDW(0, 1, 0x52), 0x3},
+	{TAC_REG_SDW(0, 1, 0x53), 0x4},
+	{TAC_REG_SDW(0, 1, 0x54), 0x5},
+	{TAC_REG_SDW(0, 1, 0x55), 0x6},
+	{TAC_REG_SDW(0, 1, 0x56), 0x7},
+	{TAC_REG_SDW(0, 1, 0x57), 0x0},
+	{TAC_REG_SDW(0, 1, 0x58), 0x0},
+	{TAC_REG_SDW(0, 1, 0x59), 0x1},
+	{TAC_REG_SDW(0, 1, 0x5a), 0x2},
+	{TAC_REG_SDW(0, 1, 0x5b), 0x3},
+	{TAC_REG_SDW(0, 1, 0x5c), 0x4},
+	{TAC_REG_SDW(0, 1, 0x5d), 0x5},
+	{TAC_REG_SDW(0, 1, 0x5e), 0x6},
+	{TAC_REG_SDW(0, 1, 0x5f), 0x7},
+	{TAC_REG_SDW(0, 1, 0x60), 0x98},
+	{TAC_REG_SDW(0, 1, 0x61), 0x0},
+	{TAC_REG_SDW(0, 1, 0x62), 0x0},
+	{TAC_REG_SDW(0, 1, 0x63), 0x0},
+	{TAC_REG_SDW(0, 1, 0x64), 0x1},
+	{TAC_REG_SDW(0, 1, 0x65), 0x2},
+	{TAC_REG_SDW(0, 1, 0x66), 0x3},
+	{TAC_REG_SDW(0, 1, 0x67), 0x4},
+	{TAC_REG_SDW(0, 1, 0x68), 0x5},
+	{TAC_REG_SDW(0, 1, 0x69), 0x6},
+	{TAC_REG_SDW(0, 1, 0x6a), 0x7},
+	{TAC_REG_SDW(0, 1, 0x6b), 0x0},
+	{TAC_REG_SDW(0, 1, 0x6c), 0x0},
+	{TAC_REG_SDW(0, 1, 0x6d), 0x1},
+	{TAC_REG_SDW(0, 1, 0x6e), 0x2},
+	{TAC_REG_SDW(0, 1, 0x6f), 0x3},
+	{TAC_REG_SDW(0, 1, 0x70), 0x4},
+	{TAC_REG_SDW(0, 1, 0x71), 0x5},
+	{TAC_REG_SDW(0, 1, 0x72), 0x6},
+	{TAC_REG_SDW(0, 1, 0x73), 0x7},
+};
+
+static const struct reg_sequence tac_spk_seq[] = {
+	REG_SEQ0(SDW_SDCA_CTL(TAC_FUNCTION_ID_SA, TAC_SDCA_ENT_FU21,
+			      TAC_SDCA_CHANNEL_GAIN, TAC_CHANNEL_LEFT), 0),
+	REG_SEQ0(SDW_SDCA_CTL(TAC_FUNCTION_ID_SA, TAC_SDCA_ENT_FU21,
+			      TAC_SDCA_CHANNEL_GAIN, TAC_CHANNEL_RIGHT), 0),
+	REG_SEQ0(SDW_SDCA_CTL(TAC_FUNCTION_ID_SA, TAC_SDCA_ENT_FU23,
+			      TAC_SDCA_CHANNEL_GAIN, TAC_CHANNEL_LEFT), 0),
+	REG_SEQ0(SDW_SDCA_CTL(TAC_FUNCTION_ID_SA, TAC_SDCA_ENT_FU23,
+			      TAC_SDCA_CHANNEL_GAIN, TAC_CHANNEL_RIGHT), 0),
+	REG_SEQ0(TAC_AMP_LVL_CFG0, 8),
+	REG_SEQ0(TAC_AMP_LVL_CFG1, 8),
+};
+
+static const struct reg_sequence tac_sm_seq[] = {
+	REG_SEQ0(SDW_SDCA_CTL(TAC_FUNCTION_ID_SM, TAC_SDCA_ENT_FU113,
+			      TAC_SDCA_CHANNEL_GAIN, TAC_CHANNEL_LEFT), 0),
+	REG_SEQ0(SDW_SDCA_CTL(TAC_FUNCTION_ID_SM, TAC_SDCA_ENT_FU113,
+			      TAC_SDCA_CHANNEL_GAIN, TAC_CHANNEL_RIGHT), 0),
+	REG_SEQ0(SDW_SDCA_CTL(TAC_FUNCTION_ID_SM, TAC_SDCA_ENT_FU11,
+			      TAC_SDCA_CHANNEL_GAIN, TAC_CHANNEL_LEFT), 0),
+	REG_SEQ0(SDW_SDCA_CTL(TAC_FUNCTION_ID_SM, TAC_SDCA_ENT_FU11,
+			      TAC_SDCA_CHANNEL_GAIN, TAC_CHANNEL_RIGHT), 0),
+};
+
+static const struct reg_sequence tac_uaj_seq[] = {
+	REG_SEQ0(SDW_SDCA_CTL(TAC_FUNCTION_ID_UAJ, TAC_SDCA_ENT_FU41,
+			      TAC_SDCA_CHANNEL_GAIN, TAC_CHANNEL_LEFT), 0),
+	REG_SEQ0(SDW_SDCA_CTL(TAC_FUNCTION_ID_UAJ, TAC_SDCA_ENT_FU41,
+			      TAC_SDCA_CHANNEL_GAIN, TAC_CHANNEL_RIGHT), 0),
+	REG_SEQ0(SDW_SDCA_CTL(TAC_FUNCTION_ID_UAJ, TAC_SDCA_ENT_FU36,
+			      TAC_SDCA_CHANNEL_GAIN, TAC_JACK_MONO_CS), 0),
+};
+
+static bool tac_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case TAC_REG_SDW(0, 0, 1) ... TAC_REG_SDW(0, 0, 5):
+	case TAC_REG_SDW(0, 2, 1) ... TAC_REG_SDW(0, 2, 6):
+	case TAC_REG_SDW(0, 2, 24) ... TAC_REG_SDW(0, 2, 55):
+	case SDW_SDCA_CTL(TAC_FUNCTION_ID_HID, TAC_SDCA_ENT_HID1,
+			  TAC_SDCA_CTL_HIDTX_CURRENT_OWNER, 0):
+	case SDW_SDCA_CTL(TAC_FUNCTION_ID_HID, TAC_SDCA_ENT_HID1,
+			  TAC_SDCA_CTL_HIDTX_MESSAGE_OFFSET, 0):
+	case SDW_SDCA_CTL(TAC_FUNCTION_ID_UAJ, TAC_SDCA_ENT_GE35,
+			  TAC_SDCA_CTL_DET_MODE, 0):
+	case SDW_SDCA_CTL(TAC_FUNCTION_ID_SA, TAC_SDCA_ENT_PDE23,
+			  TAC_SDCA_REQUESTED_PS, 0):
+	case SDW_SDCA_CTL(TAC_FUNCTION_ID_SM, TAC_SDCA_ENT_PDE11,
+			  TAC_SDCA_REQUESTED_PS, 0):
+	case SDW_SDCA_CTL(TAC_FUNCTION_ID_UAJ, TAC_SDCA_ENT_PDE47,
+			  TAC_SDCA_REQUESTED_PS, 0):
+	case SDW_SDCA_CTL(TAC_FUNCTION_ID_UAJ, TAC_SDCA_ENT_PDE34,
+			  TAC_SDCA_REQUESTED_PS, 0):
+	case SDW_SDCA_CTL(TAC_FUNCTION_ID_SA, TAC_SDCA_ENT_PDE23,
+			  TAC_SDCA_ACTUAL_PS, 0):
+	case SDW_SDCA_CTL(TAC_FUNCTION_ID_SM, TAC_SDCA_ENT_PDE11,
+			  TAC_SDCA_ACTUAL_PS, 0):
+	case SDW_SDCA_CTL(TAC_FUNCTION_ID_UAJ, TAC_SDCA_ENT_PDE47,
+			  TAC_SDCA_ACTUAL_PS, 0):
+	case SDW_SDCA_CTL(TAC_FUNCTION_ID_UAJ, TAC_SDCA_ENT_PDE34,
+			  TAC_SDCA_ACTUAL_PS, 0):
+	case SDW_SCP_SDCA_INT1:
+	case SDW_SCP_SDCA_INT2:
+	case SDW_SCP_SDCA_INT3:
+	case SDW_SCP_SDCA_INT4:
+	case SDW_SDCA_CTL(1, 0, 0x10, 0):
+	case SDW_SDCA_CTL(2, 0, 0x10, 0):
+	case SDW_SDCA_CTL(3, 0, 0x10, 0):
+	case SDW_SDCA_CTL(4, 0, 0x1, 0):
+	case 0x44007F80 ... 0x44007F87:
+	case TAC_DSP_ALGO_STATUS:	/* DSP algo status - always read from HW */
+		return true;
+	default:
+		break;
+	}
+
+	return false;
+}
+
+static int tac_sdca_mbq_size(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case SDW_SDCA_CTL(TAC_FUNCTION_ID_SA, TAC_SDCA_ENT_FU21,
+			  TAC_SDCA_CHANNEL_VOLUME, TAC_CHANNEL_LEFT):
+	case SDW_SDCA_CTL(TAC_FUNCTION_ID_SA, TAC_SDCA_ENT_FU21,
+			  TAC_SDCA_CHANNEL_VOLUME, TAC_CHANNEL_RIGHT):
+	case SDW_SDCA_CTL(TAC_FUNCTION_ID_SA, TAC_SDCA_ENT_FU23,
+			  TAC_SDCA_CHANNEL_GAIN, TAC_CHANNEL_LEFT):
+	case SDW_SDCA_CTL(TAC_FUNCTION_ID_SA, TAC_SDCA_ENT_FU23,
+			  TAC_SDCA_CHANNEL_GAIN, TAC_CHANNEL_RIGHT):
+	case SDW_SDCA_CTL(TAC_FUNCTION_ID_SA, TAC_SDCA_ENT_FU23,
+			  TAC_SDCA_MASTER_GAIN, 0):
+	case SDW_SDCA_CTL(TAC_FUNCTION_ID_SM, TAC_SDCA_ENT_FU113,
+			  TAC_SDCA_CHANNEL_GAIN, TAC_CHANNEL_LEFT):
+	case SDW_SDCA_CTL(TAC_FUNCTION_ID_SM, TAC_SDCA_ENT_FU113,
+			  TAC_SDCA_CHANNEL_GAIN, TAC_CHANNEL_RIGHT):
+	case SDW_SDCA_CTL(TAC_FUNCTION_ID_SM, TAC_SDCA_ENT_FU11,
+			  TAC_SDCA_CHANNEL_GAIN, TAC_CHANNEL_LEFT):
+	case SDW_SDCA_CTL(TAC_FUNCTION_ID_SM, TAC_SDCA_ENT_FU11,
+			  TAC_SDCA_CHANNEL_GAIN, TAC_CHANNEL_RIGHT):
+	case SDW_SDCA_CTL(TAC_FUNCTION_ID_UAJ, TAC_SDCA_ENT_FU41,
+			  TAC_SDCA_CHANNEL_GAIN, TAC_CHANNEL_LEFT):
+	case SDW_SDCA_CTL(TAC_FUNCTION_ID_UAJ, TAC_SDCA_ENT_FU41,
+			  TAC_SDCA_CHANNEL_GAIN, TAC_CHANNEL_RIGHT):
+	case SDW_SDCA_CTL(TAC_FUNCTION_ID_UAJ, TAC_SDCA_ENT_FU36,
+			  TAC_SDCA_CHANNEL_GAIN, TAC_JACK_MONO_CS):
+		return 2;
+
+	default:
+		return 1;
+	}
+}
+
+static const struct regmap_sdw_mbq_cfg tac_mbq_cfg = {
+	.mbq_size = tac_sdca_mbq_size,
+};
+
+static const struct regmap_config tac_regmap = {
+	.reg_bits = 32,
+	.val_bits = 16, /* mbq support */
+	.reg_defaults = tac_reg_default,
+	.num_reg_defaults = ARRAY_SIZE(tac_reg_default),
+	.max_register = 0x47FFFFFF,
+	.cache_type = REGCACHE_MAPLE,
+	.volatile_reg = tac_volatile_reg,
+	.use_single_read = true,
+	.use_single_write = true,
+};
+
+/* Check if device has DSP algo that needs status monitoring */
+static bool tac_has_dsp_algo(struct tac5xx2_prv *tac_dev)
+{
+	switch (tac_dev->part_id) {
+	case 0x5682:
+	case 0x2883:
+		return true;
+	default:
+		return false;
+	}
+}
+
+/* Check if device has UAJ (Universal Audio Jack) support */
+static bool tac_has_uaj_support(struct tac5xx2_prv *tac_dev)
+{
+	return tac_dev->uaj_func_data;
+}
+
+/* Forward declaration for headset detection */
+static int tac5xx2_sdca_headset_detect(struct tac5xx2_prv *tac_dev);
+
+/* Define CX11 mux options */
+static const char *const tac_cx11_mux_texts[] = {"CS:18", "CS:11"};
+static const struct soc_enum tac_cx11_mux_enum =
+	SOC_ENUM_SINGLE(SND_SOC_NOPM, 0, ARRAY_SIZE(tac_cx11_mux_texts),
+			tac_cx11_mux_texts);
+
+static int tac_cx11_get(struct snd_kcontrol *kcontrol,
+			struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component;
+	struct tac5xx2_prv *tac_dev;
+
+	ucontrol->value.enumerated.item[0] = 1; /* Default to DC:1 */
+
+	if (!kcontrol || !kcontrol->private_data)
+		return 0;
+
+	component = snd_kcontrol_chip(kcontrol);
+	if (!component)
+		return 0;
+
+	tac_dev = snd_soc_component_get_drvdata(component);
+	if (!tac_dev)
+		return 0;
+
+	ucontrol->value.enumerated.item[0] = tac_dev->cx11_value;
+
+	return 0;
+}
+
+static int tac_cx11_put(struct snd_kcontrol *kcontrol,
+			struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component;
+	struct tac5xx2_prv *tac_dev;
+	unsigned int val;
+	int ret;
+
+	val = ucontrol->value.enumerated.item[0];
+
+	if (val >= ARRAY_SIZE(tac_cx11_mux_texts))
+		return -EINVAL;
+
+	component = snd_kcontrol_chip(kcontrol);
+	if (!component)
+		return -ENODEV;
+
+	tac_dev = snd_soc_component_get_drvdata(component);
+	if (!tac_dev || !tac_dev->sdw_peripheral || !tac_dev->hw_init) {
+		dev_err(component->dev, "failed to get driver data for cx put");
+		return -ENODEV;
+	}
+
+	if (tac_dev->cx11_value == val) {
+		dev_dbg(tac_dev->dev, "cx put, same value");
+		return 0; /* No change */
+	}
+
+	tac_dev->cx11_value = val;
+
+	ret = regmap_write(tac_dev->regmap,
+			   SDW_SDCA_CTL(TAC_FUNCTION_ID_SM, TAC_SDCA_ENT_CX11,
+					TAC_SDCA_CTL_CX_CLK_SEL, 0),
+			   val);
+	if (ret) {
+		dev_dbg(tac_dev->dev, "cx put failed");
+		return -EIO;
+	}
+
+	return 1;
+}
+
+/* Volume controls for mic, hp and mic cap */
+
+static const struct snd_kcontrol_new tac5xx2_snd_controls[] = {
+	SOC_SINGLE_RANGE_TLV("Left Amp Volume", TAC_AMP_LVL_CFG0, 2, 0, 44, 1,
+			     tac5xx2_amp_tlv),
+	SOC_SINGLE_RANGE_TLV("Right Amp Volume", TAC_AMP_LVL_CFG1, 2, 0, 44, 1,
+			     tac5xx2_amp_tlv),
+	SOC_SINGLE_Q78_TLV("Left DMIC Capture Volume",
+			   SDW_SDCA_CTL(TAC_FUNCTION_ID_SM, TAC_SDCA_ENT_FU113,
+					TAC_SDCA_CHANNEL_GAIN, TAC_CHANNEL_LEFT),
+			   tac5xx2_dvc_tlv),
+	SOC_SINGLE_Q78_TLV("Right DMIC Capture Volume",
+			   SDW_SDCA_CTL(TAC_FUNCTION_ID_SM, TAC_SDCA_ENT_FU113,
+					TAC_SDCA_CHANNEL_GAIN, TAC_CHANNEL_RIGHT),
+			   tac5xx2_dvc_tlv),
+	SOC_SINGLE_Q78_TLV("Left Speaker Volume",
+			   SDW_SDCA_CTL(TAC_FUNCTION_ID_SA, TAC_SDCA_ENT_FU21,
+					TAC_SDCA_CHANNEL_GAIN, TAC_CHANNEL_LEFT),
+			   tac5xx2_dvc_tlv),
+	SOC_SINGLE_Q78_TLV("Right Speaker Volume",
+			   SDW_SDCA_CTL(TAC_FUNCTION_ID_SA, TAC_SDCA_ENT_FU21,
+					TAC_SDCA_CHANNEL_GAIN, TAC_CHANNEL_RIGHT),
+			   tac5xx2_dvc_tlv),
+	SOC_DAPM_ENUM_EXT("CX11 CS Select", tac_cx11_mux_enum, tac_cx11_get,
+			  tac_cx11_put),
+};
+
+static const struct snd_kcontrol_new tac_uaj_controls[] = {
+	SOC_SINGLE_Q78_TLV("Left UAJ Volume",
+			   SDW_SDCA_CTL(TAC_FUNCTION_ID_UAJ, TAC_SDCA_ENT_FU41,
+					TAC_SDCA_CHANNEL_GAIN, TAC_CHANNEL_LEFT),
+			  tac5xx2_dvc_tlv),
+	SOC_SINGLE_Q78_TLV("Right UAJ Volume",
+			   SDW_SDCA_CTL(TAC_FUNCTION_ID_UAJ, TAC_SDCA_ENT_FU41,
+					TAC_SDCA_CHANNEL_GAIN, TAC_CHANNEL_RIGHT),
+			  tac5xx2_dvc_tlv),
+	SOC_SINGLE_Q78_TLV("UAJ Capture Volume",
+			   SDW_SDCA_CTL(TAC_FUNCTION_ID_UAJ, TAC_SDCA_ENT_FU36,
+					TAC_SDCA_CHANNEL_GAIN, TAC_JACK_MONO_CS),
+			  tac5xx2_dvc_tlv),
+};
+
+static const struct snd_soc_dapm_widget tac5xx2_common_widgets[] = {
+	/* Port 1: Speaker Playback Path */
+	SND_SOC_DAPM_AIF_IN("AIF1 Playback", "DP1 Speaker Playback", 0,
+			    SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_PGA("FU21_L", FU21_L_MUTE_REG, 0, 1, NULL, 0),
+	SND_SOC_DAPM_PGA("FU21_R", FU21_R_MUTE_REG, 0, 1, NULL, 0),
+	SND_SOC_DAPM_PGA("FU23_L", FU23_L_MUTE_REG, 0, 1, NULL, 0),
+	SND_SOC_DAPM_PGA("FU23_R", FU23_R_MUTE_REG, 0, 1, NULL, 0),
+	SND_SOC_DAPM_OUTPUT("SPK_L"),
+	SND_SOC_DAPM_OUTPUT("SPK_R"),
+
+	/* Port 3: Smart Mic (DMIC) Capture Path */
+	SND_SOC_DAPM_AIF_OUT("AIF3 Capture", "DP3 Mic Capture", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_INPUT("DMIC_L"),
+	SND_SOC_DAPM_INPUT("DMIC_R"),
+	SND_SOC_DAPM_PGA("IT11", IT11_USAGE_REG, 0, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("CS11", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("CS18", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("CS113", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_PGA("FU11_L", FU11_L_MUTE_REG, 0, 1, NULL, 0),
+	SND_SOC_DAPM_PGA("FU11_R", FU11_R_MUTE_REG, 0, 1, NULL, 0),
+	SND_SOC_DAPM_PGA("PPU11", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_PGA("XU12", XU12_BYPASS_REG, 0, 0, NULL, 0),
+	SND_SOC_DAPM_PGA("FU113_L", FU113_L_MUTE_REG, 0, 1, NULL, 0),
+	SND_SOC_DAPM_PGA("FU113_R", FU113_R_MUTE_REG, 0, 1, NULL, 0),
+	SND_SOC_DAPM_PGA("OT113", OT113_USAGE_REG, 0, 0, NULL, 0),
+};
+
+static const struct snd_soc_dapm_widget tac_uaj_widgets[] = {
+	/* Port 4: UAJ (Headphone) Playback Path */
+	SND_SOC_DAPM_AIF_IN("AIF4 Playback", "DP4 UAJ Speaker Playback", 0,
+			    SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_PGA("IT41", IT41_USAGE_REG, 0, 0, NULL, 0),
+	SND_SOC_DAPM_PGA("FU41_L", FU41_L_MUTE_REG, 0, 1, NULL, 0),
+	SND_SOC_DAPM_PGA("FU41_R", FU41_R_MUTE_REG, 0, 1, NULL, 0),
+	SND_SOC_DAPM_PGA("XU42", XU42_BYPASS_REG, 0, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("CS41", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_DAC("OT45", "DP4 UAJ Speaker Playback", OT45_USAGE_REG, 0, 0),
+	SND_SOC_DAPM_OUTPUT("HP_L"),
+	SND_SOC_DAPM_OUTPUT("HP_R"),
+
+	/* Port 7: UAJ (Headset Mic) Capture Path */
+	SND_SOC_DAPM_AIF_OUT("AIF7 Capture", "DP7 UAJ Mic Capture", 0,
+			     SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_INPUT("UAJ_MIC"),
+	SND_SOC_DAPM_ADC("IT33", "DP7 UAJ Mic Capture", IT33_USAGE_REG, 0, 0),
+	SND_SOC_DAPM_PGA("FU36", FU36_MUTE_REG, 0, 1, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("CS36", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_PGA("OT36", OT36_USAGE_REG, 0, 0, NULL, 0),
+};
+
+static const struct snd_soc_dapm_route tac5xx2_common_routes[] = {
+	/* Speaker Playback Path */
+	{"FU21_L", NULL, "AIF1 Playback"},
+	{"FU21_R", NULL, "AIF1 Playback"},
+
+	{"FU23_L", NULL, "FU21_L"},
+	{"FU23_R", NULL, "FU21_R"},
+
+	{"SPK_L", NULL, "FU23_L"},
+	{"SPK_R", NULL, "FU23_R"},
+
+	/* Smart Mic DAPM Routes */
+	{"IT11", NULL, "DMIC_L"},
+	{"IT11", NULL, "DMIC_R"},
+	{"IT11", NULL, "CS11"},
+	{"IT11", NULL, "CS18"},
+	{"FU11_L", NULL, "IT11"},
+	{"FU11_R", NULL, "IT11"},
+	{"PPU11", NULL, "FU11_L"},
+	{"PPU11", NULL, "FU11_R"},
+	{"XU12", NULL, "PPU11"},
+	{"FU113_L", NULL, "XU12"},
+	{"FU113_R", NULL, "XU12"},
+	{"FU113_L", NULL, "CS113"},
+	{"FU113_R", NULL, "CS113"},
+	{"OT113", NULL, "FU113_L"},
+	{"OT113", NULL, "FU113_R"},
+	{"OT113", NULL, "CS113"},
+	{"AIF3 Capture", NULL, "OT113"},
+};
+
+static const struct snd_soc_dapm_route tac_uaj_routes[] = {
+	/* UAJ Playback routes */
+	{"IT41", NULL, "AIF4 Playback"},
+	{"IT41", NULL, "CS41"},
+	{"FU41_L", NULL, "IT41"},
+	{"FU41_R", NULL, "IT41"},
+	{"XU42", NULL, "FU41_L"},
+	{"XU42", NULL, "FU41_R"},
+	{"OT45", NULL, "XU42"},
+	{"OT45", NULL, "CS41"},
+	{"HP_L", NULL, "OT45"},
+	{"HP_R", NULL, "OT45"},
+
+	/* UAJ Capture routes */
+	{"IT33", NULL, "UAJ_MIC"},
+	{"IT33", NULL, "CS36"},
+	{"FU36", NULL, "IT33"},
+	{"OT36", NULL, "FU36"},
+	{"OT36", NULL, "CS36"},
+	{"AIF7 Capture", NULL, "OT36"},
+};
+
+static s32 tac_set_sdw_stream(struct snd_soc_dai *dai,
+			      void *sdw_stream, s32 direction)
+{
+	if (sdw_stream)
+		snd_soc_dai_dma_data_set(dai, direction, sdw_stream);
+
+	return 0;
+}
+
+static void tac_sdw_shutdown(struct snd_pcm_substream *substream,
+			     struct snd_soc_dai *dai)
+{
+	snd_soc_dai_set_dma_data(dai, substream, NULL);
+}
+
+static int tac_clear_latch(struct tac5xx2_prv *priv)
+{
+	int ret;
+
+	ret = regmap_write(priv->regmap, TAC_INT_CFG, 0X00);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(priv->regmap, TAC_INT_CFG,
+				 TAC_INT_CFG_CLR_REG, TAC_INT_CFG_CLR_REG);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(priv->regmap, TAC_INT_CFG, 0X00);
+	return ret;
+}
+
+static int tac_sdw_hw_params(struct snd_pcm_substream *substream,
+			     struct snd_pcm_hw_params *params,
+			     struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct tac5xx2_prv *tac_dev = snd_soc_component_get_drvdata(component);
+	struct sdw_stream_config stream_config = {0};
+	struct sdw_port_config port_config = {0};
+	struct sdw_stream_runtime *sdw_stream;
+	struct sdw_slave *sdw_peripheral = tac_dev->sdw_peripheral;
+	unsigned long time;
+	int ret, retry;
+	int function_id;
+	int pde_entity;
+	int port_num;
+	unsigned int actual_ps = 3; /* off */
+	u8 sample_rate_idx = 0;
+
+	time = wait_for_completion_timeout(&sdw_peripheral->initialization_complete,
+					   msecs_to_jiffies(TAC5XX2_PROBE_TIMEOUT_MS));
+	if (!time) {
+		dev_warn(tac_dev->dev, "%s: hw initialization timeout\n", __func__);
+		return -ETIMEDOUT;
+	}
+	if (!tac_dev->hw_init) {
+		dev_err(tac_dev->dev,
+			"error: operation without hw initialization");
+		return -EINVAL;
+	}
+
+	sdw_stream = snd_soc_dai_get_dma_data(dai, substream);
+	if (!sdw_stream) {
+		dev_err(tac_dev->dev, "failed to get dma data");
+		return -EINVAL;
+	}
+
+	ret = tac_clear_latch(tac_dev);
+	if (ret)
+		dev_warn(tac_dev->dev, "clear latch failed, err=%d", ret);
+
+	if (dai->id == TAC5XX2_DMIC) {
+		function_id = TAC_FUNCTION_ID_SM;
+		pde_entity = TAC_SDCA_ENT_PDE11;
+		port_num = TAC_SDW_PORT_NUM_DMIC;
+	} else if (dai->id == TAC5XX2_UAJ) {
+		function_id = TAC_FUNCTION_ID_UAJ;
+		pde_entity = substream->stream == SNDRV_PCM_STREAM_PLAYBACK ?
+				TAC_SDCA_ENT_PDE47 : TAC_SDCA_ENT_PDE34;
+		port_num = substream->stream == SNDRV_PCM_STREAM_PLAYBACK ?
+				TAC_SDW_PORT_NUM_UAJ_PLAYBACK :
+				TAC_SDW_PORT_NUM_UAJ_CAPTURE;
+		/* Detect and set jack type for UAJ path before playback.
+		 * This is required as jack is not triggering interrupt
+		 * when the device is in suspended mode.
+		 */
+		tac5xx2_sdca_headset_detect(tac_dev);
+	} else if (dai->id == TAC5XX2_SPK) {
+		function_id = TAC_FUNCTION_ID_SA;
+		pde_entity = TAC_SDCA_ENT_PDE23;
+		port_num = substream->stream == SNDRV_PCM_STREAM_PLAYBACK ?
+				TAC_SDW_PORT_NUM_SPK_PLAYBACK :
+				TAC_SDW_PORT_NUM_SPK_CAPTURE;
+	} else {
+		dev_err(tac_dev->dev, "Invalid dai id: %d", dai->id);
+		return -EINVAL;
+	}
+
+	ret = regmap_write(tac_dev->regmap, SDW_SDCA_CTL(function_id, pde_entity,
+							 TAC_SDCA_REQUESTED_PS, 0),
+			   0x03);
+
+	snd_sdw_params_to_config(substream, params, &stream_config, &port_config);
+	port_config.num = port_num;
+	ret = sdw_stream_add_slave(sdw_peripheral, &stream_config,
+				   &port_config, 1, sdw_stream);
+	if (ret)
+		dev_err(dai->dev,
+			"Unable to configure port %d: %d\n", port_num, ret);
+
+	switch (params_rate(params)) {
+	case 48000:
+		sample_rate_idx = 0x01;
+		break;
+	case 44100:
+		sample_rate_idx = 0x02;
+		break;
+	case 96000:
+		sample_rate_idx = 0x03;
+		break;
+	case 88200:
+		sample_rate_idx = 0x04;
+		break;
+	default:
+		dev_err(tac_dev->dev, "Unsupported sample rate: %d Hz",
+			params_rate(params));
+		return -EINVAL;
+	}
+
+	if (function_id == TAC_FUNCTION_ID_SM) {
+		ret = regmap_write(tac_dev->regmap,
+				   SDW_SDCA_CTL(function_id, TAC_SDCA_ENT_PPU11,
+						TAC_SDCA_CTL_PPU_POSTURE_NUM, 0),
+				      0);
+		if (ret) {
+			dev_err(tac_dev->dev, "Failed to set PPU11: %d", ret);
+			return ret;
+		}
+
+		ret = regmap_write(tac_dev->regmap,
+				   SDW_SDCA_CTL(function_id, TAC_SDCA_ENT_CS113,
+						TAC_SDCA_CTL_CS_SAMP_RATE_IDX, 0),
+				sample_rate_idx);
+		if (ret) {
+			dev_err(tac_dev->dev, "Failed to set CS113 sample rate: %d", ret);
+			return ret;
+		}
+
+		if (tac_dev->cx11_value) {
+			ret = regmap_write(tac_dev->regmap,
+					   SDW_SDCA_CTL(function_id, TAC_SDCA_ENT_CS11,
+							TAC_SDCA_CTL_CS_SAMP_RATE_IDX, 0),
+					sample_rate_idx);
+		} else {
+			ret = regmap_write(tac_dev->regmap,
+					   SDW_SDCA_CTL(function_id, TAC_SDCA_ENT_CS18,
+							TAC_SDCA_CTL_CS_SAMP_RATE_IDX, 0),
+					sample_rate_idx);
+		}
+		if (ret) {
+			dev_err(tac_dev->dev, "Failed to set %s sample rate: %d",
+				tac_dev->cx11_value ? "CS11" : "CS18", ret);
+			return ret;
+		}
+	} else if (function_id == TAC_FUNCTION_ID_UAJ) {
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+			ret = regmap_write(tac_dev->regmap,
+					   SDW_SDCA_CTL(function_id, TAC_SDCA_ENT_CS41,
+							TAC_SDCA_CTL_CS_SAMP_RATE_IDX, 0),
+					sample_rate_idx);
+			if (ret) {
+				dev_err(tac_dev->dev, "Failed to set CS41 sample rate: %d", ret);
+				return ret;
+			}
+		} else {
+			ret = regmap_write(tac_dev->regmap,
+					   SDW_SDCA_CTL(function_id, TAC_SDCA_ENT_CS36,
+							TAC_SDCA_CTL_CS_SAMP_RATE_IDX, 0),
+					sample_rate_idx);
+			if (ret) {
+				dev_err(tac_dev->dev, "Failed to set CS36 sample rate: %d", ret);
+				return ret;
+			}
+		}
+	}
+
+	mutex_lock(&tac_dev->pde_lock);
+	retry = 3;
+	/* make sure that power transition write is successful, before checking atual ps */
+	do {
+		ret = regmap_write(tac_dev->regmap, SDW_SDCA_CTL(function_id, pde_entity,
+								 TAC_SDCA_REQUESTED_PS, 0),
+				0x00);
+		if (!ret)
+			break;
+
+		dev_err(tac_dev->dev, "requested PS write err=%d, retry=%d", ret, retry);
+		usleep_range(1000, 1200);
+	} while (retry--);
+
+	retry = 3;
+	do {
+		ret = regmap_read(tac_dev->regmap, SDW_SDCA_CTL(function_id, pde_entity,
+								TAC_SDCA_ACTUAL_PS, 0),
+				  &actual_ps);
+		if (ret) {
+			dev_err(tac_dev->dev, "read actual PS err=%d: retry=%d", ret, retry);
+			continue;
+		}
+
+		if (!actual_ps)
+			break;
+
+		if (retry)
+			usleep_range(1000, 1200);
+	} while (retry--);
+
+	if (actual_ps != 0x00)
+		dev_warn(tac_dev->dev, "err PDE transition to D0: PS=0x%x\n",
+			 actual_ps);
+	mutex_unlock(&tac_dev->pde_lock);
+
+	return 0;
+}
+
+static s32 tac_sdw_pcm_hw_free(struct snd_pcm_substream *substream,
+			       struct snd_soc_dai *dai)
+{
+	s32 ret;
+	struct snd_soc_component *component = dai->component;
+	struct tac5xx2_prv *tac_dev =
+		snd_soc_component_get_drvdata(component);
+	struct sdw_stream_runtime *sdw_stream =
+		snd_soc_dai_get_dma_data(dai, substream);
+	int pde_entity, function_id;
+
+	sdw_stream_remove_slave(tac_dev->sdw_peripheral, sdw_stream);
+
+	if (dai->id == TAC5XX2_DMIC) {
+		pde_entity = TAC_SDCA_ENT_PDE11;
+		function_id = TAC_FUNCTION_ID_SM;
+	} else if (dai->id == TAC5XX2_UAJ) {
+		function_id = TAC_FUNCTION_ID_UAJ;
+		pde_entity = substream->stream == SNDRV_PCM_STREAM_PLAYBACK ?
+				TAC_SDCA_ENT_PDE47 : TAC_SDCA_ENT_PDE34;
+	} else {
+		function_id = TAC_FUNCTION_ID_SA;
+		pde_entity = TAC_SDCA_ENT_PDE23;
+	}
+	mutex_lock(&tac_dev->pde_lock);
+	ret = regmap_write(tac_dev->regmap,
+			   SDW_SDCA_CTL(function_id, pde_entity, 0x01, 0),
+			   0x03);
+	mutex_unlock(&tac_dev->pde_lock);
+
+	return ret;
+}
+
+static const struct snd_soc_dai_ops tac_dai_ops = {
+	.hw_params = tac_sdw_hw_params,
+	.hw_free = tac_sdw_pcm_hw_free,
+	.set_stream = tac_set_sdw_stream,
+	.shutdown = tac_sdw_shutdown,
+};
+
+static int tac5xx2_sdca_btn_type(unsigned char *buffer, struct tac5xx2_prv *tac_dev)
+{
+	if (*buffer == 1) /* play pause */
+		return SND_JACK_BTN_0;
+	else if (*buffer == 10) /* vol down */
+		return SND_JACK_BTN_3;
+	else if (*buffer == 8) /* vol up */
+		return SND_JACK_BTN_2;
+	else if (*buffer == 4) /* long press*/
+		return SND_JACK_BTN_1;
+	else if ((*buffer == 2) || (*buffer == 32)) /* next song */
+		return SND_JACK_BTN_4;
+	else
+		return 0;
+}
+
+static int tac5xx2_sdca_button_detect(struct tac5xx2_prv *tac_dev)
+{
+	unsigned int btn_type, offset, idx;
+	int ret, value, owner;
+	u8 buf[2];
+
+	ret = regmap_read(tac_dev->regmap,
+			  SDW_SDCA_CTL(TAC_FUNCTION_ID_HID, TAC_SDCA_ENT_HID1,
+				       TAC_SDCA_CTL_HIDTX_CURRENT_OWNER, 0), &owner);
+	if (ret) {
+		dev_err(tac_dev->dev,
+			"Failed to read current UMP message owner 0x%x", ret);
+		return ret;
+	}
+
+	if (owner == 1) {
+		dev_dbg(tac_dev->dev, "current owner is host, skipping..");
+		return 0;
+	}
+
+	ret = regmap_read(tac_dev->regmap,
+			  SDW_SDCA_CTL(TAC_FUNCTION_ID_HID, TAC_SDCA_ENT_HID1,
+				       TAC_SDCA_CTL_HIDTX_MESSAGE_OFFSET, 0), &value);
+	if (ret) {
+		dev_err(tac_dev->dev,
+			"Failed to read current UMP message offset: %d", ret);
+		goto end_btn_det;
+	}
+
+	dev_dbg(tac_dev->dev, "btn_ message offset = %x", value);
+	offset = value;
+
+	for (idx = 0; idx < sizeof(buf); idx++) {
+		ret = regmap_read(tac_dev->regmap,
+				  TAC_BUF_ADDR_HID1 + offset + idx, &value);
+		if (ret) {
+			dev_err(tac_dev->dev,
+				"Failed to read HID buffer: %d", ret);
+			goto end_btn_det;
+		}
+		buf[idx] = value & 0xff;
+	}
+
+	if (buf[0] == 0x1) {
+		btn_type = tac5xx2_sdca_btn_type(&buf[1], tac_dev);
+		ret = btn_type;
+	}
+
+end_btn_det:
+	if (!owner)
+		regmap_write(tac_dev->regmap,
+			     SDW_SDCA_CTL(TAC_FUNCTION_ID_HID, TAC_SDCA_ENT_HID1,
+					  TAC_SDCA_CTL_HIDTX_CURRENT_OWNER, 0), 0x01);
+
+	return ret;
+}
+
+static int tac5xx2_sdca_headset_detect(struct tac5xx2_prv *tac_dev)
+{
+	int val, ret;
+
+	if (!tac_has_uaj_support(tac_dev))
+		return 0;
+
+	ret = regmap_read(tac_dev->regmap,
+			  SDW_SDCA_CTL(TAC_FUNCTION_ID_UAJ, TAC_SDCA_ENT_GE35,
+				       TAC_SDCA_CTL_DET_MODE, 0), &val);
+	if (ret) {
+		dev_err(tac_dev->dev, "Failed to read the detect mode");
+		return ret;
+	}
+
+	switch (val) {
+	case 3:
+		tac_dev->jack_type = SND_JACK_LINEOUT;
+		break;
+	case 4:
+		tac_dev->jack_type = SND_JACK_MICROPHONE;
+		break;
+	case 5:
+		tac_dev->jack_type = SND_JACK_HEADPHONE;
+		break;
+	case 6:
+		tac_dev->jack_type = SND_JACK_HEADSET;
+		break;
+	case 7:
+		tac_dev->jack_type = SND_JACK_LINEIN;
+		break;
+	case 0:
+	default:
+		tac_dev->jack_type = 0;
+		break;
+	}
+
+	ret = regmap_write(tac_dev->regmap,
+			   SDW_SDCA_CTL(TAC_FUNCTION_ID_UAJ, TAC_SDCA_ENT_GE35,
+					TAC_SDCA_CTL_SEL_MODE, 0), val);
+	if (ret)
+		dev_err(tac_dev->dev, "Failed to update the jack type to device");
+
+	return 0;
+}
+
+static int tac5xx2_set_jack(struct snd_soc_component *component,
+			    struct snd_soc_jack *hs_jack, void *data)
+{
+	struct tac5xx2_prv *tac_dev = snd_soc_component_get_drvdata(component);
+	int ret;
+
+	if (!tac_has_uaj_support(tac_dev))
+		return 0;
+
+	tac_dev->hs_jack = hs_jack;
+	if (!tac_dev->hw_init) {
+		dev_err(tac_dev->dev, "jack init failed, hw not initialized");
+		return 0;
+	}
+
+	ret = regmap_write(tac_dev->regmap, SDW_SCP_SDCA_INTMASK2,
+			   SDW_SCP_SDCA_INTMASK_SDCA_11);
+	if (ret)
+		dev_warn(tac_dev->dev,
+			 "Failed to register jack detection interrupt");
+
+	ret = regmap_write(tac_dev->regmap, SDW_SCP_SDCA_INTMASK3,
+			   SDW_SCP_SDCA_INTMASK_SDCA_16);
+	if (ret)
+		dev_warn(tac_dev->dev,
+			 "Failed to register for button detect interrupt");
+
+	return ret;
+}
+
+static int tac_interrupt_callback(struct sdw_slave *slave,
+				  struct sdw_slave_intr_status *status)
+{
+	struct tac5xx2_prv *tac_dev = dev_get_drvdata(&slave->dev);
+	struct device *dev = &slave->dev;
+	int ret = 0;
+	int btn_type = 0;
+	unsigned int sdca_int3;
+
+	if (status->control_port) {
+		if (status->control_port & SDW_SCP_INT1_PARITY)
+			dev_warn(dev, "SCP: Parity error interrupt");
+		if (status->control_port & SDW_SCP_INT1_BUS_CLASH)
+			dev_warn(dev, "SCP: Bus clash interrupt");
+	}
+
+	ret = regmap_read(tac_dev->regmap, SDW_SCP_SDCA_INT3, &sdca_int3);
+	if (ret) {
+		dev_err(dev, "Failed to read SDCA_INT3: %d", ret);
+		return ret;
+	}
+
+	dev_dbg(dev, "SDCA_INT3: 0x%02x", sdca_int3);
+	ret = tac5xx2_sdca_headset_detect(tac_dev);
+	if (ret < 0)
+		goto clear;
+
+	btn_type = tac5xx2_sdca_button_detect(tac_dev);
+	if (btn_type < 0)
+		btn_type = 0;
+
+	if (tac_dev->jack_type == 0)
+		btn_type = 0;
+
+	dev_dbg(tac_dev->dev, "in %s, jack_type=%d\n", __func__, tac_dev->jack_type);
+	dev_dbg(tac_dev->dev, "in %s, btn_type=0x%x\n", __func__, btn_type);
+
+	if (!tac_dev->hs_jack)
+		goto clear;
+
+	snd_soc_jack_report(tac_dev->hs_jack, tac_dev->jack_type | btn_type,
+			    SND_JACK_HEADSET | SND_JACK_BTN_0 |
+				SND_JACK_BTN_1 | SND_JACK_BTN_2 |
+				SND_JACK_BTN_3 | SND_JACK_BTN_4);
+
+clear:
+	/* clear hid interrupt */
+	ret = regmap_write(tac_dev->regmap, SDW_SCP_SDCA_INT3, sdca_int3);
+	if (ret)
+		dev_dbg(tac_dev->dev, "Failed to clear SDW_SCP_SDCA_INT3");
+	return ret;
+}
+
+static struct snd_soc_dai_driver tac5572_dai_driver[] = {
+	{
+		.name = "tac5xx2-aif1",
+		.id = TAC5XX2_SPK,
+		.playback = {
+			.stream_name = "DP1 Speaker Playback",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = TAC5XX2_DEVICE_RATES,
+			.formats = TAC5XX2_DEVICE_FORMATS,
+		},
+		.ops = &tac_dai_ops,
+	},
+	{
+		.name = "tac5xx2-aif2",
+		.id = TAC5XX2_DMIC,
+		.capture = {
+			.stream_name = "DP3 Mic Capture",
+			.channels_min = 1,
+			.channels_max = 4,
+			.rates = TAC5XX2_DEVICE_RATES,
+			.formats = TAC5XX2_DEVICE_FORMATS,
+		},
+		.ops = &tac_dai_ops,
+	},
+	{
+		.name = "tac5xx2-aif3",
+		.id = TAC5XX2_UAJ,
+		.playback = {
+			.stream_name = "DP4 UAJ Speaker Playback",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = TAC5XX2_DEVICE_RATES,
+			.formats = TAC5XX2_DEVICE_FORMATS,
+		},
+		.capture = {
+			.stream_name = "DP7 UAJ Mic Capture",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = TAC5XX2_DEVICE_RATES,
+			.formats = TAC5XX2_DEVICE_FORMATS,
+		},
+		.ops = &tac_dai_ops,
+	},
+};
+
+static struct snd_soc_dai_driver tac5672_dai_driver[] = {
+	{
+		.name = "tac5xx2-aif1",
+		.id = TAC5XX2_SPK,
+		.playback = {
+			.stream_name = "DP1 Speaker Playback",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = TAC5XX2_DEVICE_RATES,
+			.formats = TAC5XX2_DEVICE_FORMATS,
+		},
+		.capture = {
+			.stream_name = "DP8 IV Sense Capture",
+			.channels_min = 1,
+			.channels_max = 4,
+			.rates = TAC5XX2_DEVICE_RATES,
+			.formats = TAC5XX2_DEVICE_FORMATS,
+		},
+		.ops = &tac_dai_ops,
+		.symmetric_rate = 1,
+	},
+	{
+		.name = "tac5xx2-aif2",
+		.id = TAC5XX2_DMIC,
+		.capture = {
+			.stream_name = "DP3 Mic Capture",
+			.channels_min = 1,
+			.channels_max = 4,
+			.rates = TAC5XX2_DEVICE_RATES,
+			.formats = TAC5XX2_DEVICE_FORMATS,
+		},
+		.ops = &tac_dai_ops,
+	},
+	{
+		.name = "tac5xx2-aif3",
+		.id = TAC5XX2_UAJ,
+		.playback = {
+			.stream_name = "DP4 UAJ Speaker Playback",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = TAC5XX2_DEVICE_RATES,
+			.formats = TAC5XX2_DEVICE_FORMATS,
+		},
+		.capture = {
+			.stream_name = "DP7 UAJ Mic Capture",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = TAC5XX2_DEVICE_RATES,
+			.formats = TAC5XX2_DEVICE_FORMATS,
+		},
+		.ops = &tac_dai_ops,
+	},
+};
+
+static struct snd_soc_dai_driver tac5682_dai_driver[] = {
+	{
+		.name = "tac5xx2-aif1",
+		.id = TAC5XX2_SPK,
+		.playback = {
+			.stream_name = "DP1 Speaker Playback",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = TAC5XX2_DEVICE_RATES,
+			.formats = TAC5XX2_DEVICE_FORMATS,
+		},
+		.capture = {
+			.stream_name = "DP2 Echo Reference Capture",
+			.channels_min = 1,
+			.channels_max = 4,
+			.rates = TAC5XX2_DEVICE_RATES,
+			.formats = TAC5XX2_DEVICE_FORMATS,
+		},
+		.ops = &tac_dai_ops,
+		.symmetric_rate = 1,
+	},
+	{
+		.name = "tac5xx2-aif2",
+		.id = TAC5XX2_DMIC,
+		.capture = {
+			.stream_name = "DP3 Mic Capture",
+			.channels_min = 1,
+			.channels_max = 4,
+			.rates = TAC5XX2_DEVICE_RATES,
+			.formats = TAC5XX2_DEVICE_FORMATS,
+		},
+		.ops = &tac_dai_ops,
+	},
+	{
+		.name = "tac5xx2-aif3",
+		.id = TAC5XX2_UAJ,
+		.playback = {
+			.stream_name = "DP4 UAJ Speaker Playback",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = TAC5XX2_DEVICE_RATES,
+			.formats = TAC5XX2_DEVICE_FORMATS,
+		},
+		.capture = {
+			.stream_name = "DP7 UAJ Mic Capture",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = TAC5XX2_DEVICE_RATES,
+			.formats = TAC5XX2_DEVICE_FORMATS,
+		},
+		.ops = &tac_dai_ops,
+	},
+};
+
+static struct snd_soc_dai_driver tas2883_dai_driver[] = {
+	{
+		.name = "tac5xx2-aif1",
+		.id = TAC5XX2_SPK,
+		.playback = {
+			.stream_name = "DP1 Speaker Playback",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = TAC5XX2_DEVICE_RATES,
+			.formats = TAC5XX2_DEVICE_FORMATS,
+		},
+		.ops = &tac_dai_ops,
+		.symmetric_rate = 1,
+	},
+	{
+		.name = "tac5xx2-aif2",
+		.id = TAC5XX2_DMIC,
+		.capture = {
+			.stream_name = "DP3 Mic Capture",
+			.channels_min = 1,
+			.channels_max = 4,
+			.rates = TAC5XX2_DEVICE_RATES,
+			.formats = TAC5XX2_DEVICE_FORMATS,
+		},
+		.ops = &tac_dai_ops,
+	},
+};
+
+static s32 tac_component_probe(struct snd_soc_component *component)
+{
+	struct tac5xx2_prv *tac_dev =
+		snd_soc_component_get_drvdata(component);
+	struct device *dev = tac_dev->dev;
+	struct sdw_slave *slave = tac_dev->sdw_peripheral;
+	unsigned long time;
+	int ret;
+
+	/* Wait for SoundWire hw initialization to complete */
+	time = wait_for_completion_timeout(&slave->initialization_complete,
+					   msecs_to_jiffies(TAC5XX2_PROBE_TIMEOUT_MS));
+	if (!time) {
+		dev_warn(dev, "%s: hw initialization timeout\n", __func__);
+		return -ETIMEDOUT;
+	}
+
+	if (!tac_has_uaj_support(tac_dev))
+		goto done_comp_probe;
+
+	ret = snd_soc_dapm_new_controls(snd_soc_component_to_dapm(component),
+					tac_uaj_widgets,
+					ARRAY_SIZE(tac_uaj_widgets));
+	if (ret) {
+		dev_err(component->dev, "Failed to add UAJ widgets: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_dapm_add_routes(snd_soc_component_to_dapm(component),
+				      tac_uaj_routes, ARRAY_SIZE(tac_uaj_routes));
+	if (ret) {
+		dev_err(component->dev, "Failed to add UAJ routes: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_add_component_controls(component, tac_uaj_controls,
+					     ARRAY_SIZE(tac_uaj_controls));
+	if (ret) {
+		dev_err(dev, "Failed to add UAJ controls: %d\n", ret);
+			return ret;
+	}
+
+done_comp_probe:
+	tac_dev->component = component;
+	return 0;
+}
+
+static void tac_component_remove(struct snd_soc_component *codec)
+{
+	struct tac5xx2_prv *tac_dev = snd_soc_component_get_drvdata(codec);
+
+	tac_dev->component = NULL;
+}
+
+static const struct snd_soc_component_driver soc_codec_driver_tacdevice = {
+	.probe = tac_component_probe,
+	.remove = tac_component_remove,
+	.controls = tac5xx2_snd_controls,
+	.num_controls = ARRAY_SIZE(tac5xx2_snd_controls),
+	.dapm_widgets = tac5xx2_common_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(tac5xx2_common_widgets),
+	.dapm_routes = tac5xx2_common_routes,
+	.num_dapm_routes = ARRAY_SIZE(tac5xx2_common_routes),
+	.idle_bias_on = 0,
+	.endianness = 1,
+	.set_jack = tac5xx2_set_jack,
+};
+
+static s32 tac_init(struct tac5xx2_prv *tac_dev)
+{
+	s32 ret;
+	struct snd_soc_dai_driver *dai_drv;
+	int num_dais;
+
+	dev_set_drvdata(tac_dev->dev, tac_dev);
+
+	switch (tac_dev->part_id) {
+	case 0x5572:
+		dai_drv = tac5572_dai_driver;
+		num_dais = ARRAY_SIZE(tac5572_dai_driver);
+		break;
+	case 0x5672:
+		dai_drv = tac5672_dai_driver;
+		num_dais = ARRAY_SIZE(tac5672_dai_driver);
+		break;
+	case 0x5682:
+		dai_drv = tac5682_dai_driver;
+		num_dais = ARRAY_SIZE(tac5682_dai_driver);
+		break;
+	case 0x2883:
+		dai_drv = tas2883_dai_driver;
+		num_dais = ARRAY_SIZE(tas2883_dai_driver);
+		break;
+	default:
+		dev_err(tac_dev->dev, "Unsupported device: 0x%x\n",
+			tac_dev->part_id);
+		return -EINVAL;
+	}
+
+	ret = devm_snd_soc_register_component(tac_dev->dev,
+					      &soc_codec_driver_tacdevice,
+					      dai_drv, num_dais);
+	if (ret) {
+		dev_err(tac_dev->dev, "%s: codec register error:%d.\n",
+			__func__, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static s32 tac5xx2_sdca_dev_suspend(struct device *dev)
+{
+	struct tac5xx2_prv *tac_dev = dev_get_drvdata(dev);
+
+	if (!tac_dev->hw_init)
+		return 0;
+
+	regcache_cache_only(tac_dev->regmap, true);
+	return 0;
+}
+
+static s32 tac5xx2_sdca_dev_system_suspend(struct device *dev)
+{
+	return tac5xx2_sdca_dev_suspend(dev);
+}
+
+static s32 tac5xx2_sdca_dev_resume(struct device *dev)
+{
+	struct sdw_slave *slave = dev_to_sdw_dev(dev);
+	struct tac5xx2_prv *tac_dev = dev_get_drvdata(dev);
+	unsigned long t;
+	int ret;
+
+	if (!tac_dev->hw_init || !tac_dev->first_hw_init) {
+		dev_dbg(dev, "Device not initialized yet, skipping resume sync\n");
+		return 0;
+	}
+
+	if (!slave->unattach_request)
+		goto regmap_sync;
+
+	t = wait_for_completion_timeout(&slave->initialization_complete,
+					msecs_to_jiffies(TAC5XX2_PROBE_TIMEOUT_MS));
+	if (!t) {
+		dev_err(&slave->dev, "resume: initialization timed out\n");
+		sdw_show_ping_status(slave->bus, true);
+		return -ETIMEDOUT;
+	}
+	slave->unattach_request = 0;
+
+regmap_sync:
+	regcache_cache_only(tac_dev->regmap, false);
+	regcache_mark_dirty(tac_dev->regmap);
+	ret = regcache_sync(tac_dev->regmap);
+	if (ret < 0)
+		dev_warn(dev, "Failed to sync regcache: %d\n", ret);
+
+	return 0;
+}
+
+static const struct dev_pm_ops tac5xx2_sdca_pm = {
+	SYSTEM_SLEEP_PM_OPS(tac5xx2_sdca_dev_system_suspend, tac5xx2_sdca_dev_resume)
+	RUNTIME_PM_OPS(tac5xx2_sdca_dev_suspend, tac5xx2_sdca_dev_resume, NULL)
+};
+
+static s32 tac_load_and_cache_firmware(struct tac5xx2_prv *tac_dev)
+{
+	const struct firmware *fmw = NULL;
+	const char *fw_name_used = NULL;
+	s32 ret = 0;
+	u8 *cached_data = NULL;
+
+	mutex_lock(&tac_dev->pde_lock);
+	ret = request_firmware(&fmw, tac_dev->fw_binaryname, tac_dev->dev);
+	if (ret || !fmw) {
+		dev_err(tac_dev->dev,
+			"Failed to read fw binary %s, err=%d\n",
+			tac_dev->fw_binaryname, ret);
+		mutex_unlock(&tac_dev->pde_lock);
+		return -EINVAL;
+	}
+
+	if (!fmw->data || fmw->size == 0) {
+		dev_err(tac_dev->dev, "fw file: %s is empty or invalid\n",
+			tac_dev->fw_binaryname);
+		ret = -EINVAL;
+		goto out;
+	}
+
+	fw_name_used = tac_dev->fw_binaryname;
+
+	cached_data = devm_kmemdup(tac_dev->dev, fmw->data, fmw->size, GFP_KERNEL);
+	if (!cached_data) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	tac_dev->fw_data = cached_data;
+	tac_dev->fw_size = fmw->size;
+	tac_dev->fw_cached = true;
+
+	dev_dbg(tac_dev->dev, "fw file: %s cached successfully, size=%zu\n",
+		fw_name_used, tac_dev->fw_size);
+
+out:
+	release_firmware(fmw);
+	mutex_unlock(&tac_dev->pde_lock);
+
+	return ret;
+}
+
+static s32 tac_fw_read_hdr(const u8 *data, struct tac_fw_hdr *hdr)
+{
+	hdr->size = get_unaligned_le32(data);
+
+	return TAC_FW_HDR_SIZE;
+}
+
+static s32 tac_fw_get_next_file(const u8 *data, struct tac_fw_file *file)
+{
+	file->vendor_id = get_unaligned_le32(&data[0]);
+	file->file_id = get_unaligned_le32(&data[4]);
+	file->version = get_unaligned_le32(&data[8]);
+	file->length = get_unaligned_le32(&data[12]);
+	file->dest_addr = get_unaligned_le32(&data[16]);
+	file->fw_data = (u8 *)&data[20];
+
+	return file->length + sizeof(u32) * 5;
+}
+
+static s32 tac_download(struct tac5xx2_prv *tac_dev,
+			struct tac_fw_file *files, int num_files)
+{
+	s32 ret = 0;
+	u32 i;
+
+	for (i = 0; i < num_files; i++) {
+		ret = sdw_nwrite_no_pm(tac_dev->sdw_peripheral, files[i].dest_addr,
+				       files[i].length, files[i].fw_data);
+		if (ret < 0) {
+			dev_err(tac_dev->dev,
+				"FW write failed at addr 0x%x: %d\n",
+				files[i].dest_addr, ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+/*
+ * tac5xx2 uses custom firmware binary fw.
+ * This is not using UMP File Download.
+ */
+static s32 tac_download_fw_to_hw(struct tac5xx2_prv *tac_dev)
+{
+	const u8 *buf = NULL;
+	struct tac_fw_hdr *hdr = NULL;
+	struct tac_fw_file *files = NULL;
+	size_t img_sz;
+	s32 ret = 0, num_files = 0;
+	s32 offset = 0;
+
+	mutex_lock(&tac_dev->pde_lock);
+
+	if (!tac_dev->fw_cached || !tac_dev->fw_data) {
+		dev_err(tac_dev->dev, "No cached firmware available\n");
+		mutex_unlock(&tac_dev->pde_lock);
+		return -EINVAL;
+	}
+
+	hdr = kzalloc(sizeof(*hdr), GFP_KERNEL);
+	files = kcalloc(TAC_MAX_FW_CHUNKS, sizeof(*files), GFP_KERNEL);
+	if (!files || !hdr) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	buf = tac_dev->fw_data;
+	img_sz = tac_dev->fw_size;
+
+	dev_dbg(tac_dev->dev, "Downloading cached firmware to HW, size=%zu\n", img_sz);
+
+	offset += tac_fw_read_hdr(buf, hdr);
+	if (hdr->size != img_sz) {
+		ret = -EINVAL;
+		dev_err(tac_dev->dev, "firmware size mismatch: hdr=%u, actual=%zu\n",
+			hdr->size, img_sz);
+		goto out;
+	}
+
+	if (img_sz < TAC_FW_HDR_SIZE) {
+		ret = -EINVAL;
+		dev_err(tac_dev->dev, "firmware size too small: %zu\n", img_sz);
+		goto out;
+	}
+
+	while (offset < img_sz && num_files < TAC_MAX_FW_CHUNKS) {
+		if (offset + 20 > img_sz) {
+			dev_warn(tac_dev->dev, "Incomplete block header at offset %d\n",
+				 offset);
+			break;
+		}
+		offset += tac_fw_get_next_file(&buf[offset], &files[num_files]);
+		num_files++;
+	}
+
+	if (num_files == 0) {
+		dev_err(tac_dev->dev, "firmware with no files\n");
+		ret = -EINVAL;
+		goto out;
+	}
+
+	ret = tac_download(tac_dev, files, num_files);
+	if (ret < 0) {
+		dev_err(tac_dev->dev, "Firmware download failed: %d\n", ret);
+		goto out;
+	}
+
+	dev_dbg(tac_dev->dev, "Firmware download complete: %d chunks\n", num_files);
+	tac_dev->fw_dl_success = true;
+
+out:
+	kfree(hdr);
+	kfree(files);
+	mutex_unlock(&tac_dev->pde_lock);
+
+	return ret;
+}
+
+#if IS_ENABLED(CONFIG_PCI)
+static struct pci_dev *tac_get_pci_dev(struct sdw_slave *peripheral)
+{
+	struct device *dev = &peripheral->dev;
+
+	for (; dev; dev = dev->parent) {
+		if (dev->bus == &pci_bus_type)
+			return to_pci_dev(dev);
+	}
+
+	return NULL;
+}
+#else
+static struct pci_dev *tac_get_pci_dev(struct sdw_slave *peripheral)
+{
+	return NULL;
+}
+#endif
+
+static void tac_generate_fw_name(struct sdw_slave *slave, char *name, size_t size)
+{
+	struct sdw_bus *bus = slave->bus;
+	u16 part_id = slave->id.part_id;
+	u8 unique_id = slave->id.unique_id;
+#if IS_ENABLED(CONFIG_PCI)
+	struct pci_dev *pci = tac_get_pci_dev(slave);
+
+	if (pci) {
+		scnprintf(name, size, "%04X-%1X-%1X.bin",
+			  pci->subsystem_device, bus->link_id, unique_id);
+		return;
+	}
+#endif
+	/* Default firmware name based on part ID */
+	scnprintf(name, size, "%s%04x-%1X-%1X.bin",
+		  part_id == 0x2883 ? "tas" : "tac",
+		  part_id, bus->link_id, unique_id);
+}
+
+static s32 tac_io_init(struct device *dev, struct sdw_slave *slave, bool first)
+{
+	struct tac5xx2_prv *tac_dev = dev_get_drvdata(dev);
+	s32 ret = 0;
+
+	if (tac_dev->hw_init) {
+		dev_dbg(dev, "early return hw_init already done..");
+		return 0;
+	}
+
+	if (tac_has_dsp_algo(tac_dev)) {
+		tac_generate_fw_name(slave, tac_dev->fw_binaryname,
+				     sizeof(tac_dev->fw_binaryname));
+
+		if (!tac_dev->fw_cached) {
+			ret = tac_load_and_cache_firmware(tac_dev);
+			if (ret)
+				dev_dbg(dev, "failed to load fw: %d, use rom mode\n", ret);
+		}
+
+		if (tac_dev->fw_cached) {
+			ret = tac_download_fw_to_hw(tac_dev);
+			if (ret) {
+				dev_err(dev, "FW download failed, fw: %d\n", ret);
+				goto io_init_err;
+			}
+		}
+	}
+
+	if (tac_dev->sa_func_data) {
+		ret = sdca_regmap_write_init(dev, tac_dev->regmap,
+					     tac_dev->sa_func_data);
+		if (ret) {
+			dev_err(dev, "smartamp init table update failed\n");
+			goto io_init_err;
+		} else {
+			dev_dbg(dev, "smartamp init done\n");
+		}
+
+		if (first) {
+			ret = regmap_multi_reg_write(tac_dev->regmap, tac_spk_seq,
+						     ARRAY_SIZE(tac_spk_seq));
+			if (ret) {
+				dev_err(dev, "init writes failed, err=%d", ret);
+				goto io_init_err;
+			}
+		}
+	}
+
+	if (tac_dev->sm_func_data) {
+		ret = sdca_regmap_write_init(dev, tac_dev->regmap,
+					     tac_dev->sm_func_data);
+		if (ret) {
+			dev_err(dev, "smartmic init table update failed\n");
+			goto io_init_err;
+		} else {
+			dev_dbg(dev, "smartmic init done\n");
+		}
+
+		if (first) {
+			/* Set default value to CS:11 */
+			tac_dev->cx11_value = 1;
+			regmap_write(tac_dev->regmap,
+				     SDW_SDCA_CTL(TAC_FUNCTION_ID_SM,
+						  TAC_SDCA_ENT_CX11,
+							TAC_SDCA_CTL_CX_CLK_SEL, 0),
+					tac_dev->cx11_value);
+
+			ret = regmap_multi_reg_write(tac_dev->regmap, tac_sm_seq,
+						     ARRAY_SIZE(tac_sm_seq));
+			if (ret) {
+				dev_err(tac_dev->dev,
+					"init writes failed, err=%d", ret);
+				goto io_init_err;
+			}
+		}
+	}
+
+	if (tac_dev->uaj_func_data) {
+		ret = sdca_regmap_write_init(dev, tac_dev->regmap,
+					     tac_dev->uaj_func_data);
+		if (ret) {
+			dev_err(dev, "uaj init table update failed\n");
+			goto io_init_err;
+		} else {
+			dev_dbg(dev, "uaj init done\n");
+		}
+
+		if (first) {
+			ret = regmap_multi_reg_write(tac_dev->regmap, tac_uaj_seq,
+						     ARRAY_SIZE(tac_uaj_seq));
+			if (ret) {
+				dev_err(tac_dev->dev,
+					"init writes failed, err=%d", ret);
+				goto io_init_err;
+			}
+		}
+	}
+
+	if (tac_dev->hid_func_data) {
+		ret = sdca_regmap_write_init(dev, tac_dev->regmap,
+					     tac_dev->hid_func_data);
+		if (ret) {
+			dev_err(dev, "hid init table update failed\n");
+			goto io_init_err;
+		} else {
+			dev_dbg(dev, "hid init done\n");
+		}
+
+		/* register for interrupts */
+		ret = regmap_write(tac_dev->regmap, SDW_SCP_SDCA_INTMASK2,
+				   SDW_SCP_SDCA_INTMASK_SDCA_11);
+		if (ret)
+			dev_err(dev, "Failed to register jack detection interrupt");
+
+		ret = regmap_write(tac_dev->regmap, SDW_SCP_SDCA_INTMASK3,
+				   SDW_SCP_SDCA_INTMASK_SDCA_16);
+		if (ret)
+			dev_err(dev, "Failed to register for button detect interrupt");
+	}
+
+	tac_dev->hw_init = true;
+
+	return 0;
+
+io_init_err:
+	dev_err(dev, "init writes failed, err=%d", ret);
+	return ret;
+}
+
+static int tac_update_status(struct sdw_slave *slave,
+			     enum sdw_slave_status status)
+{
+	int ret;
+	bool first = false;
+	struct tac5xx2_prv *tac_dev = dev_get_drvdata(&slave->dev);
+	struct device *dev = &slave->dev;
+
+	tac_dev->status = status;
+	if (status == SDW_SLAVE_UNATTACHED) {
+		tac_dev->hw_init = false;
+		tac_dev->fw_dl_success = false;
+	}
+
+	if (tac_dev->hw_init || tac_dev->status != SDW_SLAVE_ATTACHED) {
+		dev_dbg(dev, "%s: early return, hw_init=%d, status=%d",
+			__func__, tac_dev->hw_init, tac_dev->status);
+		return 0;
+	}
+
+	if (!tac_dev->first_hw_init) {
+		pm_runtime_set_autosuspend_delay(tac_dev->dev, 3000);
+		pm_runtime_use_autosuspend(tac_dev->dev);
+		pm_runtime_mark_last_busy(tac_dev->dev);
+		pm_runtime_set_active(tac_dev->dev);
+		pm_runtime_enable(tac_dev->dev);
+		tac_dev->first_hw_init = true;
+		first = true;
+	}
+
+	pm_runtime_get_noresume(tac_dev->dev);
+
+	regcache_mark_dirty(tac_dev->regmap);
+	regcache_cache_only(tac_dev->regmap, false);
+	ret = tac_io_init(&slave->dev, slave, first);
+	if (ret) {
+		dev_err(dev, "Device initialization failed: %d\n", ret);
+		goto err_out;
+	}
+
+	ret = regcache_sync(tac_dev->regmap);
+	if (ret)
+		dev_warn(dev, "Failed to sync regcache after init: %d\n", ret);
+
+err_out:
+	pm_runtime_mark_last_busy(tac_dev->dev);
+	pm_runtime_put_autosuspend(tac_dev->dev);
+
+	return ret;
+}
+
+static int tac5xx2_sdw_clk_stop(struct sdw_slave *peripheral,
+				enum sdw_clk_stop_mode mode,
+				enum sdw_clk_stop_type type)
+{
+	struct tac5xx2_prv *tac_dev = dev_get_drvdata(&peripheral->dev);
+
+	dev_dbg(tac_dev->dev, "%s: mode:%d type:%d", __func__, mode, type);
+	return 0;
+}
+
+static int tac5xx2_sdw_read_prop(struct sdw_slave *peripheral)
+{
+	struct device *dev = &peripheral->dev;
+	int ret;
+
+	ret = sdw_slave_read_prop(peripheral);
+	if (ret) {
+		dev_err(dev, "sdw_slave_read_prop failed: %d", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int tac_port_prep(struct sdw_slave *slave, struct sdw_prepare_ch *prep_ch,
+			 enum sdw_port_prep_ops pre_ops)
+{
+	struct device *dev = &slave->dev;
+	struct tac5xx2_prv *tac_dev = dev_get_drvdata(dev);
+	unsigned int val;
+	int ret;
+
+	if (pre_ops != SDW_OPS_PORT_POST_PREP)
+		return 0;
+
+	if (!tac_dev->fw_dl_success)
+		return 0;
+
+	ret = regmap_read(tac_dev->regmap, TAC_DSP_ALGO_STATUS, &val);
+	if (ret) {
+		dev_err(dev, "Failed to read algo status: %d\n", ret);
+		return ret;
+	}
+
+	if (val != TAC_DSP_ALGO_STATUS_RUNNING) {
+		dev_dbg(dev, "Algo not running (0x%02x), re-enabling\n", val);
+		ret = regmap_write(tac_dev->regmap, TAC_DSP_ALGO_STATUS,
+				   TAC_DSP_ALGO_STATUS_RUNNING);
+		if (ret) {
+			dev_err(dev, "Failed to re-enable algo: %d\n", ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static const struct sdw_slave_ops tac_sdw_ops = {
+	.read_prop = tac5xx2_sdw_read_prop,
+	.update_status = tac_update_status,
+	.interrupt_callback = tac_interrupt_callback,
+	.clk_stop = tac5xx2_sdw_clk_stop,
+	.port_prep = tac_port_prep,
+};
+
+static void tac_remove(struct tac5xx2_prv *tac_dev)
+{
+	snd_soc_unregister_component(tac_dev->dev);
+}
+
+static s32 tac_sdw_probe(struct sdw_slave *peripheral,
+			 const struct sdw_device_id *id)
+{
+	struct regmap *regmap;
+	struct device *dev = &peripheral->dev;
+	struct tac5xx2_prv *tac_dev;
+	struct sdca_function_data *function_data = NULL;
+	int ret, i;
+
+	tac_dev = devm_kzalloc(dev, sizeof(*tac_dev), GFP_KERNEL);
+	if (!tac_dev)
+		return dev_err_probe(dev, -ENOMEM,
+				     "Failed devm_kzalloc");
+
+	if (peripheral->sdca_data.num_functions > 0) {
+		dev_dbg(dev, "SDCA functions found: %d",
+			peripheral->sdca_data.num_functions);
+
+		for (i = 0; i < peripheral->sdca_data.num_functions; i++) {
+			struct sdca_function_data **func_ptr;
+			const char *func_name;
+
+			switch (peripheral->sdca_data.function[i].type) {
+			case SDCA_FUNCTION_TYPE_SMART_AMP:
+				func_ptr = &tac_dev->sa_func_data;
+				func_name = "smartamp";
+				break;
+			case SDCA_FUNCTION_TYPE_SMART_MIC:
+				func_ptr = &tac_dev->sm_func_data;
+				func_name = "smartmic";
+				break;
+			case SDCA_FUNCTION_TYPE_UAJ:
+				func_ptr = &tac_dev->uaj_func_data;
+				func_name = "uaj";
+				break;
+			case SDCA_FUNCTION_TYPE_HID:
+				func_ptr = &tac_dev->hid_func_data;
+				func_name = "hid";
+				break;
+			default:
+				continue;
+			}
+
+			function_data = devm_kzalloc(dev, sizeof(*function_data),
+						     GFP_KERNEL);
+			if (!function_data)
+				return dev_err_probe(dev, -ENOMEM,
+						     "failed to allocate %s function data",
+						     func_name);
+
+			ret = sdca_parse_function(dev, peripheral,
+						  &peripheral->sdca_data.function[i],
+						  function_data);
+			if (!ret)
+				*func_ptr = function_data;
+			else
+				devm_kfree(dev, function_data);
+		}
+	}
+
+	dev_dbg(dev, "SDCA functions enabled: SA=%s SM=%s UAJ=%s HID=%s",
+		tac_dev->sa_func_data ? "yes" : "no",
+		tac_dev->sm_func_data ? "yes" : "no",
+		tac_dev->uaj_func_data ? "yes" : "no",
+		tac_dev->hid_func_data ? "yes" : "no");
+
+	tac_dev->dev = dev;
+	tac_dev->sdw_peripheral = peripheral;
+	tac_dev->hw_init = false;
+	tac_dev->first_hw_init = false;
+	mutex_init(&tac_dev->pde_lock);
+	tac_dev->part_id = id->part_id;
+	dev_set_drvdata(dev, tac_dev);
+
+	regmap = devm_regmap_init_sdw_mbq_cfg(&peripheral->dev, peripheral,
+					      &tac_regmap, &tac_mbq_cfg);
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap),
+				     "Failed devm_regmap_init_sdw\n");
+
+	regcache_cache_only(regmap, true);
+	tac_dev->regmap = regmap;
+	tac_dev->jack_type = 0;
+
+	return tac_init(tac_dev);
+}
+
+static void tac_sdw_remove(struct sdw_slave *peripheral)
+{
+	struct tac5xx2_prv *tac_dev = dev_get_drvdata(&peripheral->dev);
+
+	tac_remove(tac_dev);
+	mutex_destroy(&tac_dev->pde_lock);
+	dev_set_drvdata(&peripheral->dev, NULL);
+}
+
+static const struct sdw_device_id tac_sdw_id[] = {
+	SDW_SLAVE_ENTRY(0x0102, 0x5572, 0),
+	SDW_SLAVE_ENTRY(0x0102, 0x5672, 0),
+	SDW_SLAVE_ENTRY(0x0102, 0x5682, 0),
+	SDW_SLAVE_ENTRY(0x0102, 0x2883, 0),
+	{},
+};
+MODULE_DEVICE_TABLE(sdw, tac_sdw_id);
+
+static struct sdw_driver tac_sdw_driver = {
+	.driver = {
+		.name = "slave-tac5xx2",
+		.pm = pm_ptr(&tac5xx2_sdca_pm),
+	},
+	.probe = tac_sdw_probe,
+	.remove = tac_sdw_remove,
+	.ops = &tac_sdw_ops,
+	.id_table = tac_sdw_id,
+};
+module_sdw_driver(tac_sdw_driver);
+
+MODULE_IMPORT_NS("SND_SOC_SDCA");
+MODULE_AUTHOR("Texas Instruments Inc.");
+MODULE_DESCRIPTION("ASoC TAC5XX2 SoundWire Driver");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/tac5xx2.h b/sound/soc/codecs/tac5xx2.h
new file mode 100644
index 0000000000000..eed8e6cf3498b
--- /dev/null
+++ b/sound/soc/codecs/tac5xx2.h
@@ -0,0 +1,259 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * ALSA SoC Texas Instruments TAC5XX2 Audio Smart Amplifier
+ *
+ * Copyright (C) 2025 Texas Instruments Incorporated
+ * https://www.ti.com
+ *
+ * This the header file for TAC5XX2 family of devices
+ * which includes TAC5572, TAC5672, TAC5682 and TAS2883
+ *
+ * Author: Niranjan H Y <niranjanhy@ti.com>
+ */
+#ifndef __RGL_TAC5XX2_H__
+#define __RGL_TAC5XX2_H__
+
+/* for soundwire */
+#define TAC_REG_SDW(book, page, reg) (((book) * 256 * 128) + \
+				      0x3000000 + ((page) * 128) + (reg))
+
+/* page 0 registers */
+#define TAC_SW_RESET		TAC_REG_SDW(0, 0, 1)
+#define TAC_SLEEP_MODEZ		TAC_REG_SDW(0, 0, 2)
+#define TAC_FEATURE_PDZ		TAC_REG_SDW(0, 0, 3)
+#define TAC_TX_CH_EN		TAC_REG_SDW(0, 0, 4)
+#define TAC_RX_CH_PD		TAC_REG_SDW(0, 0, 5)
+#define TAC_SHDNZ_CFG		TAC_REG_SDW(0, 0, 6)
+#define TAC_MISC_CFG0		TAC_REG_SDW(0, 0, 7)
+#define TAC_MISC_CFG1		TAC_REG_SDW(0, 0, 8)
+#define TAC_GPIO1_CFG0		TAC_REG_SDW(0, 0, 9)
+#define TAC_GPIO2_CFG0		TAC_REG_SDW(0, 0, 10)
+#define TAC_GPIO3_CFG0		TAC_REG_SDW(0, 0, 11)
+#define TAC_GPIO4_CFG0		TAC_REG_SDW(0, 0, 12)
+#define TAC_GPIO5_CFG0		TAC_REG_SDW(0, 0, 13)
+#define TAC_GPIO6_CFG0		TAC_REG_SDW(0, 0, 14)
+#define TAC_INTF_CFG1		TAC_REG_SDW(0, 0, 15)
+#define TAC_INTF_CFG5		TAC_REG_SDW(0, 0, 16)
+#define TAC_PASI_BCLK_CFG0	TAC_REG_SDW(0, 0, 17)
+#define TAC_PASI_FSYNC_CFG0	TAC_REG_SDW(0, 0, 18)
+#define TAC_PASI_DIN1_CFG0	TAC_REG_SDW(0, 0, 19)
+#define TAC_PASI_DIN2_CFG0	TAC_REG_SDW(0, 0, 20)
+#define TAC_PDM_DIN1_CFG0	TAC_REG_SDW(0, 0, 21)
+#define TAC_PDM_DIN2_CFG0	TAC_REG_SDW(0, 0, 22)
+#define TAC_MCLK_SEL		TAC_REG_SDW(0, 0, 23)
+#define TAC_I2C2_CFG0		TAC_REG_SDW(0, 0, 24)
+#define TAC_SDW_IO_CFG0		TAC_REG_SDW(0, 0, 25)
+#define TAC_SDW_CLK_CFG0	TAC_REG_SDW(0, 0, 26)
+#define TAC_PASI_CFG0		TAC_REG_SDW(0, 0, 27)
+#define TAC_PASI_CFG1		TAC_REG_SDW(0, 0, 28)
+#define TAC_PASI_TX_CFG0	TAC_REG_SDW(0, 0, 29)
+#define TAC_PASI_TX_CFG1	TAC_REG_SDW(0, 0, 30)
+#define TAC_PASI_TX_CFG2	TAC_REG_SDW(0, 0, 31)
+#define TAC_PASI_TX_CFG3	TAC_REG_SDW(0, 0, 32)
+#define TAC_PASI_TX_CH1_CFG0	TAC_REG_SDW(0, 0, 33)
+#define TAC_PASI_TX_CH2_CFG0	TAC_REG_SDW(0, 0, 34)
+#define TAC_PASI_TX_CH3_CFG0	TAC_REG_SDW(0, 0, 35)
+#define TAC_PASI_TX_CH4_CFG0	TAC_REG_SDW(0, 0, 36)
+#define TAC_PASI_TX_CH5_CFG0	TAC_REG_SDW(0, 0, 37)
+#define TAC_PASI_TX_CH6_CFG0	TAC_REG_SDW(0, 0, 38)
+#define TAC_PASI_TX_CH7_CFG0	TAC_REG_SDW(0, 0, 39)
+#define TAC_PASI_TX_CH8_CFG0	TAC_REG_SDW(0, 0, 40)
+#define TAC_PASI_RX_CFG0	TAC_REG_SDW(0, 0, 41)
+#define TAC_PASI_RX_CFG1	TAC_REG_SDW(0, 0, 42)
+#define TAC_PASI_RX_CFG2	TAC_REG_SDW(0, 0, 43)
+#define TAC_PASI_RX_CH1_CFG0	TAC_REG_SDW(0, 0, 44)
+#define TAC_PASI_RX_CH2_CFG0	TAC_REG_SDW(0, 0, 45)
+#define TAC_PASI_RX_CH3_CFG0	TAC_REG_SDW(0, 0, 46)
+#define TAC_PASI_RX_CH4_CFG0	TAC_REG_SDW(0, 0, 47)
+#define TAC_PASI_RX_CH5_CFG0	TAC_REG_SDW(0, 0, 48)
+#define TAC_PASI_RX_CH6_CFG0	TAC_REG_SDW(0, 0, 49)
+#define TAC_PASI_RX_CH7_CFG0	TAC_REG_SDW(0, 0, 50)
+#define TAC_PASI_RX_CH8_CFG0	TAC_REG_SDW(0, 0, 51)
+#define TAC_ADC_CH1_CFG0	TAC_REG_SDW(0, 0, 52)
+#define TAC_ADC_DVOL_CFG0	TAC_REG_SDW(0, 0, 53)
+#define TAC_ADC_CH1_FGAIN	TAC_REG_SDW(0, 0, 54)
+#define TAC_ADC_CH1_CFG1	TAC_REG_SDW(0, 0, 55)
+#define TAC_ADC_CH2_CFG0	TAC_REG_SDW(0, 0, 57)
+#define TAC_ADC_DVOL_CFG1	TAC_REG_SDW(0, 0, 58)
+#define TAC_ADC_CH2_FGAIN	TAC_REG_SDW(0, 0, 59)
+#define TAC_ADC_CH2_CFG1	TAC_REG_SDW(0, 0, 60)
+#define TAC_ADC_CFG1		TAC_REG_SDW(0, 0, 62)
+#define TAC_PDM_CH1_DVOL	TAC_REG_SDW(0, 0, 63)
+#define TAC_PDM_CH1_FGAIN	TAC_REG_SDW(0, 0, 64)
+#define TAC_PDM_CH1_CFG0	TAC_REG_SDW(0, 0, 65)
+#define TAC_PDM_CH2_DVOL	TAC_REG_SDW(0, 0, 67)
+#define TAC_PDM_CH2_FGAIN	TAC_REG_SDW(0, 0, 68)
+#define TAC_PDM_CH2_CFG2	TAC_REG_SDW(0, 0, 69)
+#define TAC_PDM_CH3_DVOL	TAC_REG_SDW(0, 0, 71)
+#define TAC_PDM_CH3_FGAIN	TAC_REG_SDW(0, 0, 72)
+#define TAC_PDM_CH3_CFG0	TAC_REG_SDW(0, 0, 73)
+#define TAC_PDM_CH4_DVOL	TAC_REG_SDW(0, 0, 75)
+#define TAC_PDM_CH4_FGAIN	TAC_REG_SDW(0, 0, 76)
+#define TAC_PDM_CH4_CFG0	TAC_REG_SDW(0, 0, 77)
+#define TAC_MICBIAS_CFG0	TAC_REG_SDW(0, 0, 79)
+#define TAC_MICPREAMP_CFG	TAC_REG_SDW(0, 0, 80)
+#define TAC_MICBIAS_CFG1	TAC_REG_SDW(0, 0, 81)
+#define TAC_CLASSD_CH1_DVOL	TAC_REG_SDW(0, 0, 82)
+#define TAC_CLASSD_CH1_FGAIN	TAC_REG_SDW(0, 0, 83)
+#define TAC_CLASSD_CH2_DVOL	TAC_REG_SDW(0, 0, 85)
+#define TAC_CLASSD_CH2_FGAIN	TAC_REG_SDW(0, 0, 86)
+#define TAC_GCHP_CH1_DVOL	TAC_REG_SDW(0, 0, 88)
+#define TAC_GCHP_CH1_FGAIN	TAC_REG_SDW(0, 0, 89)
+#define TAC_GCHP_CH2_DVOL	TAC_REG_SDW(0, 0, 91)
+#define TAC_GCHP_CH2_FGAIN	TAC_REG_SDW(0, 0, 92)
+#define TAC_AMP_LVL_CFG0	TAC_REG_SDW(0, 0, 94)
+#define TAC_AMP_LVL_CFG1	TAC_REG_SDW(0, 0, 95)
+#define TAC_AMP_LVL_CFG2	TAC_REG_SDW(0, 0, 96)
+#define TAC_AMP_LVL_CFG3	TAC_REG_SDW(0, 0, 97)
+#define TAC_EFF_MODE_CFG0	TAC_REG_SDW(0, 0, 98)
+#define TAC_EFF_MODE_CFG1	TAC_REG_SDW(0, 0, 99)
+#define TAC_CLASSD_CFG0		TAC_REG_SDW(0, 0, 100)
+#define TAC_CLASSD_CFG1		TAC_REG_SDW(0, 0, 101)
+#define TAC_CLASSD_CFG3		TAC_REG_SDW(0, 0, 102)
+#define TAC_CLASSD_CFG4		TAC_REG_SDW(0, 0, 103)
+#define TAC_CLASSD_CFG5		TAC_REG_SDW(0, 0, 104)
+#define TAC_CLASSD_CFG6		TAC_REG_SDW(0, 0, 105)
+#define TAC_CLASSD_CFG8		TAC_REG_SDW(0, 0, 106)
+#define TAC_ISNS_CFG		TAC_REG_SDW(0, 0, 107)
+#define TAC_DSP_CFG0		TAC_REG_SDW(0, 0, 108)
+#define TAC_DSP_CFG1		TAC_REG_SDW(0, 0, 109)
+#define TAC_DSP_CFG2		TAC_REG_SDW(0, 0, 110)
+#define TAC_DSP_CFG3		TAC_REG_SDW(0, 0, 111)
+#define TAC_JACK_DET_CFG1	TAC_REG_SDW(0, 0, 112)
+#define TAC_JACK_DET_CFG2	TAC_REG_SDW(0, 0, 113)
+#define TAC_JACK_DET_CFG3	TAC_REG_SDW(0, 0, 114)
+#define TAC_JACK_DET_CFG4	TAC_REG_SDW(0, 0, 115)
+#define TAC_JACK_DET_CFG7	TAC_REG_SDW(0, 0, 116)
+#define TAC_UJ_IMPEDANCE_L	TAC_REG_SDW(0, 0, 117)
+#define TAC_UJ_IMPEDANCE_R	TAC_REG_SDW(0, 0, 118)
+#define UJ_IMPEDANCE_L		TAC_REG_SDW(0, 0, 119)
+#define UJ_IMPEDANCE_R		TAC_REG_SDW(0, 0, 120)
+#define TAC_GP_ANA_STS		TAC_REG_SDW(0, 0, 123)
+#define TAC_DEV_ID		TAC_REG_SDW(0, 0, 124)
+#define TAC_REV_ID		TAC_REG_SDW(0, 0, 125)
+#define TAC_I2C_CKSUM		TAC_REG_SDW(0, 0, 126)
+#define TAC_BOOK		TAC_REG_SDW(0, 0, 127)
+
+#define TAC_INT_CFG		TAC_REG_SDW(0, 2, 1)
+#define TAC_INT_CFG_CLR_REG	BIT(3)
+
+/* smartamp function */
+#define TAC_FUNCTION_ID_SA	0x1
+
+#define TAC_SDCA_ENT_ENT0	0x0
+#define TAC_SDCA_ENT_PPU21	0x1
+#define TAC_SDCA_ENT_FU21	0x2
+#define TAC_SDCA_ENT_FU26	0x3
+#define TAC_SDCA_ENT_XU22	0x4
+#define TAC_SDCA_ENT_CS24	0x5
+#define TAC_SDCA_ENT_CS21	0x6
+#define TAC_SDCA_ENT_CS25	0x7
+#define TAC_SDCA_ENT_CS26	0x8
+#define TAC_SDCA_ENT_CS28	0x9
+#define TAC_SDCA_ENT_PPU26	0xa
+#define TAC_SDCA_ENT_FU23	0xb
+#define TAC_SDCA_ENT_PDE23	0xc
+#define TAC_SDCA_ENT_TG23	0x12
+#define TAC_SDCA_ENT_IT21	0x13
+#define TAC_SDCA_ENT_IT29	0x14
+#define TAC_SDCA_ENT_IT26	0x15
+#define TAC_SDCA_ENT_IT28	0x16
+#define TAC_SDCA_ENT_OT24	0x17
+#define TAC_SDCA_ENT_OT23	0x18
+#define TAC_SDCA_ENT_OT25	0x19
+#define TAC_SDCA_ENT_OT28	0x1a
+#define TAC_SDCA_ENT_OT27	0x1c
+#define TAC_SDCA_ENT_SPE199	0x21
+#define TAC_SDCA_ENT_OT20	0x24
+#define TAC_SDCA_ENT_FU27	0x26
+#define TAC_SDCA_ENT_FU20	0x27
+#define TAC_SDCA_ENT_PDE24	0x2e
+#define TAC_SDCA_ENT_PDE27	0x2f
+#define TAC_SDCA_ENT_PDE28	0x30
+#define TAC_SDCA_ENT_PDE20	0x31
+#define TAC_SDCA_ENT_SAPU29	0x35
+
+/* Control selector definitions */
+#define TAC_SDCA_MASTER_GAIN	0x0B
+#define TAC_SDCA_MASTER_MUTE	0x01
+#define TAC_SDCA_CHANNEL_MUTE	0x01
+#define TAC_SDCA_CHANNEL_GAIN	0x02
+#define TAC_SDCA_POSTURENUMBER	0x10
+#define TAC_SDCA_REQUESTED_PS	0x01
+#define TAC_SDCA_ACTUAL_PS	0x10
+#define TAC_SDCA_CHANNEL_VOLUME	0x02
+
+/* 2. smart mic function */
+#define TAC_FUNCTION_ID_SM	0x2
+
+#define TAC_SDCA_ENT_IT11   0x1
+#define TAC_SDCA_ENT_OT113	0x2
+#define TAC_SDCA_ENT_CS11	0x3
+#define TAC_SDCA_ENT_CS18	0x4
+#define TAC_SDCA_ENT_FU113	0x5
+#define TAC_SDCA_ENT_FU13	0x6
+#define TAC_SDCA_ENT_FU11	0x8
+#define TAC_SDCA_ENT_XU12	0xa
+#define TAC_SDCA_ENT_CS113	0xc
+#define TAC_SDCA_ENT_CX11	0xf
+#define TAC_SDCA_ENT_PDE11	0x12
+#define TAC_SDCA_ENT_PPU11	0x9
+
+/* controls */
+#define TAC_SDCA_CTL_USAGE	0x04
+#define TAC_SDCA_CTL_IT_CLUSTER	0x10
+#define TAC_SDCA_CTL_OT_DP_SEL	0x11
+#define TAC_SDCA_CTL_XU_BYPASS	0x01
+/* cx */
+#define TAC_SDCA_CTL_CX_CLK_SEL		0x01
+/* cs */
+#define TAC_SDCA_CTL_CS_CLKVLD		0x02
+#define TAC_SDCA_CTL_CS_SAMP_RATE_IDX	0x10
+/* cs113 end */
+/* ppu */
+#define TAC_SDCA_CTL_PPU_POSTURE_NUM	0x10
+
+/* 3. UAJ function */
+#define TAC_FUNCTION_ID_UAJ	0x3
+#define TAC_SDCA_ENT_PDE47	0x35
+#define TAC_SDCA_ENT_PDE34	0x32
+#define TAC_SDCA_ENT_FU41	0x26 /* user */
+#define TAC_SDCA_ENT_IT41	0x07
+#define TAC_SDCA_ENT_XU42	0x2C
+#define TAC_SDCA_ENT_CS41	0x30
+#define TAC_SDCA_ENT_OT45	0x0E
+#define TAC_SDCA_ENT_IT33	0x03
+#define TAC_SDCA_ENT_OT36	0x0A
+#define TAC_SDCA_ENT_FU36	0x28
+#define TAC_SDCA_ENT_CS36	0x2E
+#define TAC_SDCA_ENT_GE35	0x3B /* 59 */
+
+#define TAC_SDCA_CTL_SEL_MODE	0x1
+#define TAC_SDCA_CTL_DET_MODE	0x2
+
+/* 4. HID function */
+#define TAC_FUNCTION_ID_HID	0x4
+#define TAC_SDCA_ENT_HID1	0x1
+/* HID Control Selectors */
+#define TAC_SDCA_CTL_HIDTX_CURRENT_OWNER	0x10
+#define TAC_SDCA_CTL_HIDTX_MESSAGE_OFFSET	0x12
+#define TAC_SDCA_CTL_HIDTX_MESSAGE_LENGTH	0x13
+#define TAC_SDCA_CTL_DETECTED_MODE	0x10
+#define TAC_SDCA_CTL_SELECTED_MODE	0x11
+
+#define TAC_BUF_ADDR_HID1	0x44007F80
+
+/* DAI interfaces */
+#define TAC5XX2_SPK	0
+#define TAC5XX2_DMIC	2
+#define TAC5XX2_UAJ	3
+
+/* Port numbers for DAIs */
+#define TAC_SDW_PORT_NUM_SPK_PLAYBACK	1
+#define TAC_SDW_PORT_NUM_SPK_CAPTURE	2
+#define TAC_SDW_PORT_NUM_DMIC		3
+#define TAC_SDW_PORT_NUM_UAJ_PLAYBACK	4
+#define TAC_SDW_PORT_NUM_UAJ_CAPTURE	7
+#define TAC_SDW_PORT_NUM_IV_SENSE	8
+
+#endif
-- 
2.34.1

