Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023087.outbound.protection.outlook.com [40.107.44.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F1B253F05;
	Thu, 27 Nov 2025 09:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764236599; cv=fail; b=I0h6xciKtJk0jq85KrxCoy35k7An7EMVs+2ZusjuFiaIXFbW+9Uxcg5xPd72/TixZv33p9i88jXKZf99E/SonD4DMsGAuxPqZpAAbGpu2ih99CpbEM7rjQfJ11rUTeqpZmVFGH59sqvrDm5t07YVOQDK/ND6cfpyW9F5MjDzhBs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764236599; c=relaxed/simple;
	bh=/kAU9Hf+T9amWFGW6Gdb/xUixkjiUL/lDx05b1pJVV8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aOlSIIl92QE3K7v3W2QZPfIVmQKEDhts9bc4KTqIopRWeTNdPU4UYhR0Yk9U+8kpU0Eci86xnTd+MjYeEt0LqFFWIp4K7iGrmiw8urG0kZ7SFFIqQRTSE96qRMjMgFKc5uGICbLwB9aPEdqj+e/vXNuf2hiTiby/pFOKWnuGTnY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HEz/AguuL97yLtJSFWldxLcpPrKE/4PyoWIqgUbU7zXfAK7gIszfar+Cc7Ov5gjN5p0M73ETcQtGfP5kpfxv1JwdQJyr6+ewMmTsSohXKv63Qs9ThKli1gMy6VSRHA3OPJvYFj2RuGsCHZXUGDNsmzl2hCaKi4pYRqE5YJnWSN/6yWYZW/boJhhQh+XlXXQ0sXTWXBYUi9YG/hJoO8KiB5Rm1QZp7xmQ0wE/NWnlM45tAr81gCKqeSM5dSIy7AsMm4xFtssd/60QC9XoeY960fWONYOI7CF2o+s044XxOVgJEfzM9t4Rhkn/nHJmYD6LBpVfAv2MrJXyNuoqNhg7kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AOlex7AKMtuU17+HhZ5pgW3uaqnb0h5Oy8CT2LAkedc=;
 b=ZgBCX8l5cfIKcD8kFjxzcnIDz7Kd6F47Gl/Dm9tPynTsmgxN6+Cf5ZYJNbyrEf0UrHsWlacorDpGx2FRHcF5XP5Sq0P2OY44tvBkgTf2Tk6rnLd6OR6SPn/ZpVi7xeckpyB9jU8Le4eLrZg2hS3ABETARFmLvbtxux2fQoKFUhCxewsQHCc80lDpQnXCbe1VuF+KKYKKU0yVfblOoOSCfjzgg3rqx9P9DPv8LqUpDjUSmbHwMQNAa3N2uGo1cWs///cBgTQ5N8LACaY2OZmzogY7ZrZTFTwin7kU/b0dYziBOTjswM1njBPMEgf25dC7aYYK6OFA+cUDU1VYChwfHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR01CA0066.apcprd01.prod.exchangelabs.com
 (2603:1096:300:57::30) by JH0PR06MB7235.apcprd06.prod.outlook.com
 (2603:1096:990:97::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Thu, 27 Nov
 2025 09:43:11 +0000
Received: from OSA0EPF000000CD.apcprd02.prod.outlook.com
 (2603:1096:300:57:cafe::9a) by PS2PR01CA0066.outlook.office365.com
 (2603:1096:300:57::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.13 via Frontend Transport; Thu,
 27 Nov 2025 09:43:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CD.mail.protection.outlook.com (10.167.240.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Thu, 27 Nov 2025 09:43:10 +0000
Received: from localhost.localdomain (unknown [172.18.64.15])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id C8DD840A5BFA;
	Thu, 27 Nov 2025 17:43:09 +0800 (CST)
From: joakim.zhang@cixtech.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: cix-kernel-upstream@cixtech.com,
	Joakim Zhang <joakim.zhang@cixtech.com>
Subject: [PATCH v2 4/4] ALSA: hda: add CIX IPBLOQ HDA controller support
Date: Thu, 27 Nov 2025 17:43:01 +0800
Message-ID: <20251127094301.4107982-5-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251127094301.4107982-1-joakim.zhang@cixtech.com>
References: <20251127094301.4107982-1-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CD:EE_|JH0PR06MB7235:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 96fa64da-2982-4da4-3a2b-08de2d9960b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yQr/2TUJZAX18jyZq0QIjpk1/oL18c+MOrhIxJ8ApPr4H4eNIgSEm9VbR7fM?=
 =?us-ascii?Q?IcdNOx2ZWY1teqfcbWuKPeFdbv5WWa/3u0zwKOLWY6vR9rllw8+vu283k5Ao?=
 =?us-ascii?Q?wZV+PEbBX+F7RJchpJ2J46th3IrZJq/qz/0jd2bDmbXvnPSuz1jFDiZJLHpm?=
 =?us-ascii?Q?n3x/ArutDQ6UCLTO95X0Ep+07x0xJKCxW1yvUm1dh+4kMPZjUH3jQXyoEZoE?=
 =?us-ascii?Q?K7PiPq3qHmCn+UipDXXxUgqUF7Kgp8Gm6Csxx24Zqx/hZBdzmYDtsXW+4eO+?=
 =?us-ascii?Q?hMazBhOPKvVFlNwLZmwsDkZOa+1MYiHJSUZP7JNI/s/RYqxq9FqsicQdPwCg?=
 =?us-ascii?Q?4cvarQDo+JXYWhJjD2JAo+1KbAEKVzheyNLZvD+dhvc4lxqPVIw48iLSTvCk?=
 =?us-ascii?Q?a98A4b/0rm2tw0wvA7F+uV6GQI3CfizBAUmaKL7PvNyQN8dBKvs4QZd9UEdY?=
 =?us-ascii?Q?/K7g6NDa0NA0YITQNtHAabhBBPMNlNRSPA6U9teqXZvd4o6tIyvqhtnBuyjG?=
 =?us-ascii?Q?ln+Rl15lDPsK+H6wg7VXCteHVlpLuhoa+za1pmWRKuwVA3+Bnpdt96Dbk3pz?=
 =?us-ascii?Q?XFT0YlqhKNKePDo0wfDiZToqYYZdF1Q7xFdpMKr/cjeiYBwBq5bjz+lPA4ES?=
 =?us-ascii?Q?tZSeQswl0E5PmQSwvgmyprh5G3pIyhy6d5q5PYxy3+t4z0H91A/E4PGKKNDi?=
 =?us-ascii?Q?xmYoFQ5XlB3a6VipqC1li7srLIBW2UuHF2cSAA6XIfGJnM1CnFNkwgKuMVOQ?=
 =?us-ascii?Q?+BrxudfERMNrzv12VpWa2JqhhYQx6Sf2+E1bOI+sep37Hd0vtu7ag7Y0Clfq?=
 =?us-ascii?Q?j5avLDpR/IRAd1JBzQHUwRxD5NqXjRyJmCkC0vyNVrBCZ2pvBixeJgHNIe51?=
 =?us-ascii?Q?wrzXs4IwJ7O8wH+RwD7xhwa97Qz7H8mS8n66pDK0eHwxGI+wuzAxku9Bzxjj?=
 =?us-ascii?Q?Dggl8O5e7EeXfhOql5bhHsEUxaeKOawgP5uPv8/W+OwmNV2kFSBwkfpMhsSJ?=
 =?us-ascii?Q?0Ex0xDemdMaXq/1bFzYm8IFG89Pl9Uco0Oxamq5cwkkYzHlUiggWRHzQAxe2?=
 =?us-ascii?Q?01GWRfrUgfiw7ga+AjJo5ZZIroHkSTjpRYOPsk7pEdJP+LwaelFmI55UxIDD?=
 =?us-ascii?Q?JhGV3FT5LLjWIg/P8okLHqzUDO9i8A3tmbx18nG6ToxF+Iaigp2C7wWSQZQ+?=
 =?us-ascii?Q?14ON8eQ/6hWC5NxernCtRQ2/k6L95GY53jyAOXzeQpGCatHoO4vIwb8VZhqv?=
 =?us-ascii?Q?il3Ob5o0pgfWR4LwEDuCTJKkcb4npcxVyAViRhHoIY19NDCv97FsdRaHSo0D?=
 =?us-ascii?Q?qrLcGE7aUliisJHQ30+9ZTsTFhkvzX3jqnuT8aOADcE7hBQCI+4yNSjgl33l?=
 =?us-ascii?Q?qR5MBlLKwOmoHxsKntLjkDiQvoZUnmm4pNc0Mq8c+0mc+Fg7GtNUnEzWNZqz?=
 =?us-ascii?Q?5icfMjm0/JMRA9pBdpKz65zO2u+ynYISDhrksm+nmVYFCziHA3Z53IGjYivx?=
 =?us-ascii?Q?LD7S5vpfDlt7mr7guVM6EjtiXc7ypvr7lR6I72123c6ueB5tbEJlwZlhewym?=
 =?us-ascii?Q?wNr6Mu4Z0nX55gVD7xA=3D?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 09:43:10.6628
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96fa64da-2982-4da4-3a2b-08de2d9960b2
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000CD.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB7235

From: Joakim Zhang <joakim.zhang@cixtech.com>

 - add CIX IPBLOQ HDA controller support

Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
---
 sound/hda/controllers/Kconfig      |  14 +
 sound/hda/controllers/Makefile     |   2 +
 sound/hda/controllers/cix-ipbloq.c | 452 +++++++++++++++++++++++++++++
 3 files changed, 468 insertions(+)
 create mode 100644 sound/hda/controllers/cix-ipbloq.c

diff --git a/sound/hda/controllers/Kconfig b/sound/hda/controllers/Kconfig
index 34721f50b055..72855f2df451 100644
--- a/sound/hda/controllers/Kconfig
+++ b/sound/hda/controllers/Kconfig
@@ -30,6 +30,20 @@ config SND_HDA_TEGRA
 	  To compile this driver as a module, choose M here: the module
 	  will be called snd-hda-tegra.
 
+config SND_HDA_CIX_IPBLOQ
+	tristate "CIX IPBLOQ HD Audio"
+	depends on ARCH_CIX || COMPILE_TEST
+	select SND_HDA
+	select SND_HDA_ALIGNED_MMIO
+	help
+	  Say Y here to support the HDA controller present in CIX SoCs
+
+	  This options enables support for the HD Audio controller
+	  present in some CIX SoCs.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called snd-hda-cix-ipbloq.
+
 config SND_HDA_ACPI
 	tristate "HD Audio ACPI"
 	depends on ACPI
diff --git a/sound/hda/controllers/Makefile b/sound/hda/controllers/Makefile
index a4bcd055e9ae..8967b6771d90 100644
--- a/sound/hda/controllers/Makefile
+++ b/sound/hda/controllers/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 snd-hda-intel-y := intel.o
 snd-hda-tegra-y := tegra.o
+snd-hda-cix-ipbloq-y := cix-ipbloq.o
 snd-hda-acpi-y := acpi.o
 
 subdir-ccflags-y += -I$(src)/../common
@@ -10,4 +11,5 @@ CFLAGS_intel.o := -I$(src)
 
 obj-$(CONFIG_SND_HDA_INTEL) += snd-hda-intel.o
 obj-$(CONFIG_SND_HDA_TEGRA) += snd-hda-tegra.o
+obj-$(CONFIG_SND_HDA_CIX_IPBLOQ) += snd-hda-cix-ipbloq.o
 obj-$(CONFIG_SND_HDA_ACPI) += snd-hda-acpi.o
diff --git a/sound/hda/controllers/cix-ipbloq.c b/sound/hda/controllers/cix-ipbloq.c
new file mode 100644
index 000000000000..1c6b7011f0cd
--- /dev/null
+++ b/sound/hda/controllers/cix-ipbloq.c
@@ -0,0 +1,452 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright 2025 Cix Technology Group Co., Ltd.
+
+#include <linux/clk.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/reset.h>
+#include <linux/string.h>
+
+#include <sound/hda_codec.h>
+#include "hda_controller.h"
+
+#define CIX_IPBLOQ_JACKPOLL_DEFAULT_TIME_MS		1000
+#define CIX_IPBLOQ_POWER_SAVE_DEFAULT_TIME_MS		100
+
+#define CIX_IPBLOQ_SKY1_ADDR_HOST_TO_HDAC_OFFSET	0x90000000
+
+struct cix_ipbloq_hda {
+	struct azx chip;
+	struct device *dev;
+	void __iomem *regs;
+
+	struct reset_control_bulk_data resets[1];
+	struct clk_bulk_data clocks[2];
+	unsigned int nresets;
+	unsigned int nclocks;
+};
+
+static const struct hda_controller_ops cix_ipbloq_hda_ops;
+
+static dma_addr_t cix_ipbloq_hda_addr_host_to_hdac(struct hdac_bus *bus,
+						   dma_addr_t addr);
+
+static const struct hdac_bus_ops cix_ipbloq_bus_core_ops = {
+	.command = azx_send_cmd,
+	.get_response = azx_get_response,
+	.addr_host_to_hdac = cix_ipbloq_hda_addr_host_to_hdac,
+};
+
+static dma_addr_t cix_ipbloq_hda_addr_host_to_hdac(struct hdac_bus *bus,
+						   dma_addr_t addr)
+{
+	return addr - CIX_IPBLOQ_SKY1_ADDR_HOST_TO_HDAC_OFFSET;
+}
+
+static int cix_ipbloq_hda_dev_disconnect(struct snd_device *device)
+{
+	struct azx *chip = device->device_data;
+
+	chip->bus.shutdown = 1;
+
+	return 0;
+}
+
+static int cix_ipbloq_hda_dev_free(struct snd_device *device)
+{
+	struct azx *chip = device->device_data;
+
+	if (azx_bus(chip)->chip_init) {
+		azx_stop_all_streams(chip);
+		azx_stop_chip(chip);
+	}
+
+	azx_free_stream_pages(chip);
+	azx_free_streams(chip);
+	snd_hdac_bus_exit(azx_bus(chip));
+
+	return 0;
+}
+
+static int cix_ipbloq_hda_probe_codec(struct cix_ipbloq_hda *hda)
+{
+	struct azx *chip = &hda->chip;
+	struct hdac_bus *bus = azx_bus(chip);
+	int err;
+
+	to_hda_bus(bus)->bus_probing = 1;
+
+	/* create codec instances */
+	err = azx_probe_codecs(chip, 8);
+	if (err < 0) {
+		dev_err(hda->dev, "probe codecs failed: %d\n", err);
+		return err;
+	}
+
+	err = azx_codec_configure(chip);
+	if (err < 0) {
+		dev_err(hda->dev, "codec configure failed: %d\n", err);
+		return err;
+	}
+
+	err = snd_card_register(chip->card);
+	if (err < 0) {
+		dev_err(hda->dev, "card register failed: %d\n", err);
+		return err;
+	}
+
+	chip->running = 1;
+
+	to_hda_bus(bus)->bus_probing = 0;
+
+	snd_hda_set_power_save(&chip->bus, CIX_IPBLOQ_POWER_SAVE_DEFAULT_TIME_MS);
+
+	return 0;
+}
+
+static int cix_ipbloq_hda_init(struct cix_ipbloq_hda *hda,
+			       struct azx *chip,
+			       struct platform_device *pdev)
+{
+	const char *sname = NULL, *drv_name = "cix-ipbloq-hda";
+	struct hdac_bus *bus = azx_bus(chip);
+	struct snd_card *card = chip->card;
+	struct resource *res;
+	unsigned short gcap;
+	int irq_id, err;
+
+	hda->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(hda->regs)) {
+		dev_err(hda->dev, "failed to get and ioremap resource\n");
+		return PTR_ERR(hda->regs);
+	}
+	bus->remap_addr = hda->regs;
+	bus->addr = res->start;
+
+	irq_id = platform_get_irq(pdev, 0);
+	if (irq_id < 0) {
+		dev_err(hda->dev, "failed to get the irq, err = %d\n", irq_id);
+		return irq_id;
+	}
+
+	err = devm_request_irq(hda->dev, irq_id, azx_interrupt,
+			       0, KBUILD_MODNAME, chip);
+	if (err < 0)
+		return dev_err_probe(hda->dev, err,
+				     "unable to request IRQ %d : err = %d\n", irq_id, err);
+	bus->irq = irq_id;
+	card->sync_irq = bus->irq;
+
+	gcap = azx_readw(chip, GCAP);
+	chip->capture_streams = (gcap >> 8) & 0x0f;
+	chip->playback_streams = (gcap >> 12) & 0x0f;
+	chip->capture_index_offset = 0;
+	chip->playback_index_offset = chip->capture_streams;
+	chip->num_streams = chip->playback_streams + chip->capture_streams;
+
+	/* initialize streams */
+	err = azx_init_streams(chip);
+	if (err < 0) {
+		dev_err(hda->dev, "failed to initialize streams: %d\n", err);
+		return err;
+	}
+
+	err = azx_alloc_stream_pages(chip);
+	if (err < 0) {
+		dev_err(hda->dev, "failed to allocate stream pages: %d\n", err);
+		return err;
+	}
+
+	/* initialize chip */
+	azx_init_chip(chip, 1);
+
+	/* codec detection */
+	if (!bus->codec_mask) {
+		dev_err(hda->dev, "no codecs found\n");
+		return -ENODEV;
+	}
+	dev_dbg(card->dev, "codec detection mask = 0x%lx\n", bus->codec_mask);
+
+	/* driver name */
+	strscpy(card->driver, drv_name, sizeof(card->driver));
+
+	/* shortname for card */
+	sname = of_get_property(pdev->dev.of_node, "cix,model", NULL);
+	if (!sname)
+		sname = drv_name;
+	if (strlen(sname) > sizeof(card->shortname))
+		dev_dbg(card->dev, "truncating shortname for card\n");
+	strscpy(card->shortname, sname, sizeof(card->shortname));
+
+	/* longname for card */
+	snprintf(card->longname, sizeof(card->longname),
+		 "%s at 0x%lx irq %i",
+		 card->shortname, bus->addr, bus->irq);
+
+	return 0;
+}
+
+static int cix_ipbloq_hda_create(struct cix_ipbloq_hda *hda,
+				 struct snd_card *card,
+				 unsigned int driver_caps)
+{
+	static const struct snd_device_ops ops = {
+		.dev_disconnect = cix_ipbloq_hda_dev_disconnect,
+		.dev_free = cix_ipbloq_hda_dev_free,
+	};
+	struct azx *chip;
+	int err;
+
+	chip = &hda->chip;
+	chip->card = card;
+	chip->ops = &cix_ipbloq_hda_ops;
+	chip->driver_caps = driver_caps;
+	chip->driver_type = driver_caps & 0xff;
+	chip->dev_index = 0;
+	chip->single_cmd = 0;
+	chip->codec_probe_mask = -1;
+	chip->align_buffer_size = 1;
+	chip->jackpoll_interval = msecs_to_jiffies(CIX_IPBLOQ_JACKPOLL_DEFAULT_TIME_MS);
+	mutex_init(&chip->open_mutex);
+	INIT_LIST_HEAD(&chip->pcm_list);
+
+	/*
+	 * HD-audio controllers appear pretty inaccurate about the update-IRQ timing.
+	 * The IRQ is issued before actually the data is processed. So use stream
+	 * link position by default instead of dma position buffer.
+	 */
+	chip->get_position[0] = chip->get_position[1] = azx_get_pos_lpib;
+
+	err = azx_bus_init(chip, NULL, &cix_ipbloq_bus_core_ops);
+	if (err < 0) {
+		dev_err(hda->dev, "failed to init bus, err = %d\n", err);
+		return err;
+	}
+
+	/* RIRBSTS.RINTFL cannot be cleared, cause interrupt storm */
+	chip->bus.core.polling_mode = 1;
+	chip->bus.core.not_use_interrupts = 1;
+
+	chip->bus.core.aligned_mmio = 1;
+	chip->bus.core.dma_stop_delay = 100;
+
+	chip->bus.jackpoll_in_suspend = 1;
+
+	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
+	if (err < 0) {
+		dev_err(card->dev, "failed to create device, err = %d\n", err);
+		return err;
+	}
+
+	return 0;
+}
+
+static int cix_ipbloq_hda_probe(struct platform_device *pdev)
+{
+	const unsigned int driver_flags = AZX_DCAPS_PM_RUNTIME;
+	struct cix_ipbloq_hda *hda;
+	struct snd_card *card;
+	struct azx *chip;
+	int err;
+
+	hda = devm_kzalloc(&pdev->dev, sizeof(*hda), GFP_KERNEL);
+	if (!hda)
+		return -ENOMEM;
+	hda->dev = &pdev->dev;
+
+	hda->resets[hda->nresets++].id = "hda";
+	err = devm_reset_control_bulk_get_exclusive(hda->dev, hda->nresets,
+						    hda->resets);
+	if (err < 0)
+		return dev_err_probe(hda->dev, err, "failed to get reset, err = %d\n", err);
+
+	hda->clocks[hda->nclocks++].id = "sysclk";
+	hda->clocks[hda->nclocks++].id = "clk48m";
+	err = devm_clk_bulk_get(hda->dev, hda->nclocks, hda->clocks);
+	if (err < 0)
+		return dev_err_probe(hda->dev, err, "failed to get clk, err = %d\n", err);
+
+	dma_set_mask_and_coherent(hda->dev, DMA_BIT_MASK(32));
+
+	err = of_reserved_mem_device_init(hda->dev);
+	if (err < 0 && err != -ENODEV) {
+		dev_err(hda->dev,
+			"failed to init reserved mem for DMA, err = %d\n", err);
+		return err;
+	}
+
+	err = snd_card_new(hda->dev, SNDRV_DEFAULT_IDX1, SNDRV_DEFAULT_STR1,
+			   THIS_MODULE, 0, &card);
+	if (err < 0)
+		return dev_err_probe(hda->dev, err, "failed to crate card, err = %d\n", err);
+
+	err = cix_ipbloq_hda_create(hda, card, driver_flags);
+	if (err < 0)
+		goto out_free_card;
+
+	chip = &hda->chip;
+	card->private_data = chip;
+	dev_set_drvdata(hda->dev, card);
+
+	pm_runtime_enable(hda->dev);
+	if (!azx_has_pm_runtime(chip))
+		pm_runtime_forbid(hda->dev);
+
+	err = pm_runtime_resume_and_get(hda->dev);
+	if (err < 0) {
+		dev_err(hda->dev, "runtime resume and get failed, err = %d\n", err);
+		goto out_free_device;
+	}
+
+	err = cix_ipbloq_hda_init(hda, chip, pdev);
+	if (err < 0)
+		goto out_free_device;
+
+	err = cix_ipbloq_hda_probe_codec(hda);
+	if (err < 0)
+		goto out_free_device;
+
+	pm_runtime_put(hda->dev);
+
+	return 0;
+
+out_free_device:
+	snd_device_free(card, chip);
+out_free_card:
+	snd_card_free(card);
+
+	return err;
+}
+
+static void cix_ipbloq_hda_remove(struct platform_device *pdev)
+{
+	struct snd_card *card = dev_get_drvdata(&pdev->dev);
+	struct azx *chip = card->private_data;
+
+	snd_device_free(card, chip);
+	snd_card_free(card);
+
+	pm_runtime_disable(&pdev->dev);
+}
+
+static void cix_ipbloq_hda_shutdown(struct platform_device *pdev)
+{
+	struct snd_card *card = dev_get_drvdata(&pdev->dev);
+	struct azx *chip;
+
+	if (!card)
+		return;
+
+	chip = card->private_data;
+	if (chip && chip->running)
+		azx_stop_chip(chip);
+}
+
+static int __maybe_unused cix_ipbloq_hda_suspend(struct device *dev)
+{
+	struct snd_card *card = dev_get_drvdata(dev);
+	int rc;
+
+	rc = pm_runtime_force_suspend(dev);
+	if (rc < 0)
+		return rc;
+	snd_power_change_state(card, SNDRV_CTL_POWER_D3cold);
+
+	return 0;
+}
+
+static int __maybe_unused cix_ipbloq_hda_resume(struct device *dev)
+{
+	struct snd_card *card = dev_get_drvdata(dev);
+	int rc;
+
+	rc = pm_runtime_force_resume(dev);
+	if (rc < 0)
+		return rc;
+	snd_power_change_state(card, SNDRV_CTL_POWER_D0);
+
+	return 0;
+}
+
+static int __maybe_unused cix_ipbloq_hda_runtime_suspend(struct device *dev)
+{
+	struct snd_card *card = dev_get_drvdata(dev);
+	struct azx *chip = card->private_data;
+	struct cix_ipbloq_hda *hda = container_of(chip, struct cix_ipbloq_hda, chip);
+
+	if (chip && chip->running) {
+		azx_stop_chip(chip);
+		azx_enter_link_reset(chip);
+	}
+
+	clk_bulk_disable_unprepare(hda->nclocks, hda->clocks);
+
+	return 0;
+}
+
+static int __maybe_unused cix_ipbloq_hda_runtime_resume(struct device *dev)
+{
+	struct snd_card *card = dev_get_drvdata(dev);
+	struct azx *chip = card->private_data;
+	struct cix_ipbloq_hda *hda = container_of(chip, struct cix_ipbloq_hda, chip);
+	int rc;
+
+	rc = clk_bulk_prepare_enable(hda->nclocks, hda->clocks);
+	if (rc) {
+		dev_err(dev, "failed to enable clk bulk, rc: %d\n", rc);
+		return rc;
+	}
+
+	rc = reset_control_bulk_assert(hda->nresets, hda->resets);
+	if (rc) {
+		dev_err(dev, "failed to assert reset bulk, rc: %d\n", rc);
+		return rc;
+	}
+
+	rc = reset_control_bulk_deassert(hda->nresets, hda->resets);
+	if (rc) {
+		dev_err(dev, "failed to deassert reset bulk, rc: %d\n", rc);
+		return rc;
+	}
+
+	if (chip && chip->running)
+		azx_init_chip(chip, 1);
+
+	return 0;
+}
+
+static const struct dev_pm_ops cix_ipbloq_hda_pm = {
+	SET_SYSTEM_SLEEP_PM_OPS(cix_ipbloq_hda_suspend,
+				cix_ipbloq_hda_resume)
+	SET_RUNTIME_PM_OPS(cix_ipbloq_hda_runtime_suspend,
+			   cix_ipbloq_hda_runtime_resume, NULL)
+};
+
+static const struct of_device_id cix_ipbloq_hda_match[] = {
+	{ .compatible = "cix,ipbloq-hda" },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, cix_ipbloq_hda_match);
+
+static struct platform_driver cix_ipbloq_hda_driver = {
+	.driver = {
+		.name = "cix-ipbloq-hda",
+		.pm = &cix_ipbloq_hda_pm,
+		.of_match_table = cix_ipbloq_hda_match,
+	},
+	.probe = cix_ipbloq_hda_probe,
+	.remove = cix_ipbloq_hda_remove,
+	.shutdown = cix_ipbloq_hda_shutdown,
+};
+module_platform_driver(cix_ipbloq_hda_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("CIX IPBLOQ HDA bus driver");
+MODULE_AUTHOR("Joakim Zhang <joakim.zhang@cixtech.com>");
-- 
2.49.0

