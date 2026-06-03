Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013045.outbound.protection.outlook.com [52.101.72.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC1B380FE5;
	Wed,  3 Jun 2026 09:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780480268; cv=fail; b=Rg3q9mv4C/KVMVeB2q/80GPVIv3hSGF4NvgrAw+AWShdWEqiNuqGzRusb86xj+gg+be3OKOBNrXWCklFQ0I6gROr2TAsOSZWHrhhW9mPeYeC8vEsrkj4/rI9kI+qYXncjB2lYZ0Es55YmNRfNQz9bUNhPzUwVnPtSvKEdsUzZRw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780480268; c=relaxed/simple;
	bh=QrxJpjBe6d+3hsVycFyxLJWQxZp/2z50xl8J9hBouRI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WZDKkwpiVIArFZ14isaIsLTWVO7dUFUTdLAGb5afN88knmAL5hpWGwz6DNCmDLld9ZmJcflUdyHoaJ1TFNTUu3P4SWGehcRx52/bf8ET5C9051sn2bbz9FuEM4WwNNReUifZefNh1kHmP6LOJ29+xa6hr/XLvOw8SGbrlfglrqI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=RZ8PA3fu; arc=fail smtp.client-ip=52.101.72.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="RZ8PA3fu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ljry7gBcZ+SkGr46Fo2VQg/0r73IT80bog8ZcVrnkT5p9BIIBrsr+rE4+UwvEHeDvM1ylox/68E8hYivJoyaeYDb2sY8osfupPi9JroYt1dl8D9MSGMIPPLmQPiAXBygoID9eTn1HAKbxsJt+tQXCfihpsyr5EwBtSaDtGfmKwnV6NqGYDcLxbXQD6KUKwkxDAG5PqRBnDHIVRJJjkxawfpQiUi1ulNBq/sCy1LpNlfgRV8xB3lY4AiqIhDVq/cD7kMPN8j//JPPZ66r/G61daPWBBBA08FTe/6mN/eTH0e0VM6Sv3Ambo/NG/eGr3Stf/lkD3k4HNXwcROLZZMo4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=st625ikZ5wG6A4Bah4EuUfY7bgA0iX8UNgzwTY9vjHM=;
 b=co6sKPVBBrzFRm5FqVHcrj1+vXwd5cCN7HwOgWGv+XHK+L66I83eJTDWG1BJHXLGwM4KXzRmE65TX45QXwyjB907lc5IJRc+TpMXWWpIv0S56xztWIN6yrWjlP1mUpD8wPYtVRFU/skpa/FOK2FUE+l7yjmbZX8VF/iYyiJ9WF2Pg84Mr7gvikmvVvuWNgOtIwT/tnTPpAtTms+2Vj/Nis8bRyB4+PLJLsBek9z/wD3/8hihl1VAUBjKczVQFWmcEi94YQcfK8lYn/7+FwClNTzzePWUaZ3F5j42+9j/iJoKIDcjO7Z9k8wav6EIwMsscilUTFcR7GrnSegxxloQRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=st625ikZ5wG6A4Bah4EuUfY7bgA0iX8UNgzwTY9vjHM=;
 b=RZ8PA3fup3A1rvwGU0FIqO9O3yQPq382V3+U+ztdS4V1uidKfxkr0hhPEpMn4NHzLdgrE98eU77ClRSsWyXCWYIbH/c1HbpWH3M5t6RrpLKCfSeyQZtJ3++c5tshqYSpbZ95hSdKrQfjkRswvoXQn0l63gLC6nxYujEjVCL7MxC38YazAg6ERwKcmnDqJRHMfAYMiXjhj9sksjgBm1Wv5ZS9Gj8MdDMEKgcasfRIpYZ8K2XPuKPwgwZ4OMypThZTOLyMU+kE0er4e1N7FKvyIvZRpblXBkHM9XP7X+jEk06WR+m53Zsg/wJjx9qbHC1o9JrtkyyKM5btWy6iA6w2Eg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AM9PR04MB8258.eurprd04.prod.outlook.com
 (2603:10a6:20b:3e2::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 09:51:04 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 09:51:03 +0000
From: chancel.liu@oss.nxp.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	david.rhodes@cirrus.com,
	rf@opensource.cirrus.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: [PATCH v2 2/2] ASoC: cs42xx8: Add SPI bus support for CS42448/CS42888 codec
Date: Wed,  3 Jun 2026 18:50:41 +0900
Message-ID: <20260603095041.3906558-3-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260603095041.3906558-1-chancel.liu@oss.nxp.com>
References: <20260601080224.1410292-1-chancel.liu@oss.nxp.com>
 <20260603095041.3906558-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0202.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c3::15) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AM9PR04MB8258:EE_
X-MS-Office365-Filtering-Correlation-Id: f5b0ba0b-7114-4c13-b9cb-08dec155a02a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|19092799006|18002099003|22082099003|4143699003|5023799004|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	FCsCFEyHC0Du8VCdve74tkKJhnxW0UDSx54/MiGWKLY1qNXKEgPbQMESbeueW92dLjggWT3mCNshruKt/m5I5klVbxQhz6nzbadvRpg1JpzBF62fiq0q6JXCm6xSxxu5ErDaGlahHyKIOyl4ZJUbNF2ns1IxqsirzGL/clNJgt0AZLJgVS3G43QHhlj9cZKBgdBoozUzsiyNq95czlGWJLK6WI9o2egyGVaeLHN9XJ69d6Ts9mbpO9WyF8ZLrzx34J83j7sIbnb+RR66u4BwbkhOlRuGNzNnVvkmZKGp6kqSfQVmnBk7teD6PW1UWydjxVWc5Og0j58B5PB1Ol1fBxVSbRJtE4YMms+s6zkpHiU1itpnWHOnOdhKvTHRwVkdIMzUpv7HQ91v27uDulXqc/uCFCK3KTShGB9YVSkeNGoRZ9hm1qUt6+6YyMJl8T50iegXccPA0KbG013HGsDh/rTQBZkS6e8jx03CID3AMUUT1QqiCpnoZWJRWP7wSRqqFRAPEb098EwhtK5ku7YOfkvGsKpLaqOTm32/o6Gi2cbze4lw+jUxnYdC1Vb8nXoKXP0SpDc/LfYQpKEYxzDLfg8Mnn2uTn0k8vgU/Daz0v6X8ht6i273gKh6pSrFFxq8hJmMGF14deZjhvFoWY/NsZaEHk8KZcnjrOZ/q+wEuJ/hYBvGg1s8/0YBkyAphTfR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(19092799006)(18002099003)(22082099003)(4143699003)(5023799004)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vVg4QvStmBadVAt3cfyWZSGHcUdjc3Islqbfelgo6zayA9+zYdczxRdo7TOx?=
 =?us-ascii?Q?11+oDP8gb3npFqMslgtDo8/V0aiMXUWg5Lh/vPkHvV8WqdnMSgqQyRhN6sFf?=
 =?us-ascii?Q?Tm8533tLvf0VAkRg9LATSBn06kle0RoII2za2EMJDRar6aJQHp75hSFGsdDv?=
 =?us-ascii?Q?cxF85qA29A8SMBp+tX1nMOhnw5IZXCgVf+7gsSXJ7/bWM/y9CstRyb9UU6DY?=
 =?us-ascii?Q?v+8bivjkOmtMpdxJ5hTNet0+Z0JH+uxkf4hWVyzUR6TpkyQiu06yiLDAiWHY?=
 =?us-ascii?Q?rgWMhj9NhZ7VWrfAvqQQ85MW6gKDYWh8MkMBPsDNxbA12ZmHwwiVyUq0ukMH?=
 =?us-ascii?Q?EOFVzX9vv1/TDMbA5O8euIt2ssVxALgK6vTcifDGw1dII7LHi2xhKsbaqh1v?=
 =?us-ascii?Q?2Ibug/pLVMvx6GoVFHoSUC+n2YHgxRpsnNDyrkYvmBhvVdmj185P6iNXO00e?=
 =?us-ascii?Q?EDGgRqF3qh5NcFCJU+cKPkAN+kZJRt8hkGXycJG7AwTT3eitcr7bEtt2HBFu?=
 =?us-ascii?Q?1/NPagF+kTz/RnHD7zMugbFWHs81QjcbmhfBgVa/jTobqE1bmo0lGTrs8zqj?=
 =?us-ascii?Q?uPBri2MpZlCt0t/1sEv5oUztC5iWNGvdlPiPGsBOu4kIMEP3uN2pGTPBc9lf?=
 =?us-ascii?Q?lrLCWR4XrjXl04ZX6ogRFEtwv+s6mE7jDFMTqM7l+hyl8E0gJ02bgTuYkSmC?=
 =?us-ascii?Q?/LP+btPwzPVjFb+2TiYcO7JONL7EfSBCrUPPX26QgultsNZ3R486tEHp7N/6?=
 =?us-ascii?Q?G20QXcQdkQLrhHBar9HuYOb2zrayZOIFulzRkS1MIbSn0JsDAIhqtXuQxjis?=
 =?us-ascii?Q?rd9ZkrZ4OQUIEsieIgKCRbllg7foc7qbroyF3gwMljcWfzgMXieBDH61Gkzp?=
 =?us-ascii?Q?PJwjoWGCyNdAxbxBHLthhN7m6LrGJwlpcVtmrLjlgY0ljUMWE+x1/2MMnsc4?=
 =?us-ascii?Q?oxc9A9t+LqQ2JW5vA+IChhppz/EC1yW/r2rSAM53DiggqJFjJgh/cEZ2vZfM?=
 =?us-ascii?Q?3xcEbKu2RSwsyVPHZ5NwLN2mkTGAX4kreKIBu0LQcBRAohVZsDMAfjEH4y2W?=
 =?us-ascii?Q?1D7S3wFBwwmGNMSsGB89UK3a8CSC14m11CDrvc+LJBZPDHW/3MwfOY1s8jAr?=
 =?us-ascii?Q?pC8p+JNYwWd1Sy1nwBz5UjFh5RsTFlstUqv3hk+oE7Ssrsnk9KC0zW9eBfot?=
 =?us-ascii?Q?9K0QucP0og/RNO2HCqY+LmXXoPanVZa9l5i8QpWsPyDYv8L/zcZMWY5QJvm5?=
 =?us-ascii?Q?tvTygAp/e8pEoyh5WDYHAhzlicra2G/POcuNSXpTJIR37v3D9ARIx27FuR6Q?=
 =?us-ascii?Q?mslUbyxvCf7nDTB+D2EgujIhhAXSNJ84fxpUCfBY9vQDWdp3mAM1hY7zXxIs?=
 =?us-ascii?Q?iQhGlHYZnBG0ieI+98mRjm/dpEuo2sEiOYsb/yzd2hFUkNNSLNjSqKEC7bAf?=
 =?us-ascii?Q?orI6JnLeGvg30XkU0AEHWQGakMdGqHWJUvBEupQW5YVOPppbTBMEHCkJduJ2?=
 =?us-ascii?Q?pjDxjYEZfmm58YW3ErdvGyutKUd1MQ8LAxNPlYSGGhZBTQr10XCcX7SkvVxJ?=
 =?us-ascii?Q?M/giOKeQdxUgUhWVHNMIlSSarUFMS3QiRUaY8VBlYM0XGs1dH34zPqAaeq7R?=
 =?us-ascii?Q?zuDhkLuWtGOtuz+5xTGokeowhoneLhvuA13ejXd95WUGdgK60J4H5g0B2t4d?=
 =?us-ascii?Q?jRURKbpR7tn10nglk7A2fpOSRwOpcngn704Mb2sZymIX6c7yx4U2wrUT2M2F?=
 =?us-ascii?Q?ykOWOrp+QXq8wWlu49Bt7ZceFmBDPmrXELoPhnw9+5rVRg/Nu2e3?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5b0ba0b-7114-4c13-b9cb-08dec155a02a
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 09:51:03.8372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g1DvF8VwTKwafak+6ZlAtSYdtKPhcFM83LGt8Nb1RAvQXTKuENEvf1OTeGRt5jPUTbx4qyu/4E1M+F8olFfN5OZDXxAAv24sEY7/mv6erPZJdGS5I8j+bGv4tL7rwVDB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8258

From: Chancel Liu <chancel.liu@nxp.com>

The existing cs42xx8 driver only supported I2C control interface.
Add SPI bus support for the Cirrus Logic CS42448/CS42888 Audio CODEC.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/codecs/Kconfig       |   7 +++
 sound/soc/codecs/Makefile      |   2 +
 sound/soc/codecs/cs42xx8-spi.c | 104 +++++++++++++++++++++++++++++++++
 sound/soc/codecs/cs42xx8.c     |   3 +
 4 files changed, 116 insertions(+)
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
index 000000000000..b86fe2fe771e
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
+ * the low byte. Currently INCR (MAP bit[7]) is not set and use_single_read/write
+ * are enabled. This produces the correct 3-byte on-wire frame without any
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
diff --git a/sound/soc/codecs/cs42xx8.c b/sound/soc/codecs/cs42xx8.c
index 12fe9b3e2525..5b689549c74e 100644
--- a/sound/soc/codecs/cs42xx8.c
+++ b/sound/soc/codecs/cs42xx8.c
@@ -478,6 +478,9 @@ const struct regmap_config cs42xx8_regmap_config = {
 	.volatile_reg = cs42xx8_volatile_register,
 	.writeable_reg = cs42xx8_writeable_register,
 	.cache_type = REGCACHE_MAPLE,
+	.reg_format_endian  = REGMAP_ENDIAN_BIG,
+	.use_single_read = true,
+	.use_single_write = true,
 };
 EXPORT_SYMBOL_GPL(cs42xx8_regmap_config);
 
-- 
2.50.1

