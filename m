Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023097.outbound.protection.outlook.com [40.107.44.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06C1355037;
	Thu, 30 Oct 2025 11:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761822663; cv=fail; b=B/LR3CvnAmM+ayFYYKm+ylZgQBqENJs7rgaY+HcPtYZRNiTQHu8wuiuGHSaVMbB8KpgLNX0IPgslxAbFZJU6fTTwENxwPt4hyToqmkeyDtND5lc79cVLRFmkjm9ZiZ591T7afIsM8+JQlZaL1s7/1Y6Cyd2DoLOl0Ikkn1B0nwQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761822663; c=relaxed/simple;
	bh=K1crpGRRAaKlzNNrPotHbtJ+JvhA4UB9fbgEBWeKTPY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n7feRHxVIlUhGDM0oAv8YX41NsPQx4itMS1BBuhaowEpsEAaUyy3YByfbTRNb19KGNyuQYceqmbh1n9B3Ni25C0bOgKFiEINL5mGJs8vSFVErCsVRq2yJG7Glmfg7qMVbEbcjHBMRUhykS7d/A1CwuMYcy5mygwEGMwwxqHsQmc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oSio+AdczbiMxYFl7g90O9vZ+hW86JnXaJptd2vqTMQCmn1QfhICJnofU4256KjLLoktXAdf3F00WvgTsB+QihS28cCCAxV4Q63hKvLDl4Mmr9vUHutCIj21oWLkvBdDgRvMl9mchjg52YLQN+ZsDksAd0MyeSJgdfjbI5fxvi66YbUjjFBbIp/+e9mprPeM3KiispCb2m/8eKryyxP8tA4op6ZMZVZUcdqdsFJVVSvq9wd4QHk2mlXipPhnl8OmXCVkmGZscBi7/9jn0nNf/HXq8RBZOqx5VL9c1lxZBBRpISKDpJ4H7u9F/qLW/y+QnRttsc0LW3NN4Pa9hKL2Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7IAnYBPIR5GG5etmJTcqd0sza0tQv4X0XOJeA31VKEk=;
 b=sTsMDT+rSWKH4kmDF8QYI/dKRJXHyCJYDxjs4mifFWDxcWB3zKKVkWtedOjwklLJ3DC8p8pJUzp2/3RifJjFWC9zRuSBBU+vnvmYoKEM0qKunWelnWo3yPKiSTg+mkumIxpVvgCz9cBz+uly1DBoHwuJHjBAjAh/0pZuG52oIParJrCTV39BLS8r09MxHpZccqPCLBYjXdwIIQtE5lovFSnqIyB8O6yBsE1pgxdrDKQvEOFYakXBoiNpgjUFoT9mvZpB4/nLJt2CCfo81cboSS1tgtOFXrpyy4jffIa851D6WJTkmVMtJV02IhwBxW45o8O99i+idHxGYWQ1b1tI+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR02CA0057.apcprd02.prod.outlook.com (2603:1096:300:5a::21)
 by TYZPR06MB5784.apcprd06.prod.outlook.com (2603:1096:400:268::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 11:10:56 +0000
Received: from OSA0EPF000000CB.apcprd02.prod.outlook.com
 (2603:1096:300:5a:cafe::e9) by PS2PR02CA0057.outlook.office365.com
 (2603:1096:300:5a::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.12 via Frontend Transport; Thu,
 30 Oct 2025 11:10:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CB.mail.protection.outlook.com (10.167.240.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 11:10:55 +0000
Received: from localhost.localdomain (unknown [172.18.64.15])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id A5A19400CA08;
	Thu, 30 Oct 2025 19:10:54 +0800 (CST)
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
Subject: [PATCH V1 3/3] ALSA: hda: add CIX IPBLOQ HDA controller support
Date: Thu, 30 Oct 2025 19:09:28 +0800
Message-ID: <20251030110928.1572703-4-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251030110928.1572703-1-joakim.zhang@cixtech.com>
References: <20251030110928.1572703-1-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CB:EE_|TYZPR06MB5784:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7a09114b-9c36-4861-9cea-08de17a4ff43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bms//0SpENHWU5bK8yHgiegL16Zuo1/bWiLQmqHlT6eLnyPiYo8VSRQrwfVp?=
 =?us-ascii?Q?IRHsWmDw9BaBTYiPfMDFpZ0AbTQp/I2HTgOqyfoUeY7Xm5dRMFsBGZbNlUWM?=
 =?us-ascii?Q?bxMUn6OtHnH10Kn5SSfQ6zjP3LFqqq6l/P/Gd+28UZApAu7RTBlQH43ZBf4t?=
 =?us-ascii?Q?VWEtk8I+KqzVq1W2bYrzey0xkfUnWAz5XTefQ1fglXqZkCYugkIm0svUzaLv?=
 =?us-ascii?Q?7oqTZ1IhTgJcw9vo+3yTWn3+NuQj+zN01OpYpf2IiGVp3+oakD+VvgnqYTzT?=
 =?us-ascii?Q?6eFc6KfzLJRlncu8w2ADSC+vcfqPPPabz/y+1S1MCnsYs940egHQxQaMq2O7?=
 =?us-ascii?Q?AFx0w1gvb8fobSixo+M3gOIie8eZcNjeUV5EJY2B2dAynQ1cYnHuTXVsTDAb?=
 =?us-ascii?Q?ReXnJBd8R5EWhLRHeKFpU6R9URx/kSkP4bvczBwt4m6OToqh5rTIHsrB309d?=
 =?us-ascii?Q?LEKvVq9L8sptUDXDnmTLjQkmI5ZY84kIk6lvkqDEGEMYDgOfDPxKyW004st1?=
 =?us-ascii?Q?cYaQxRjY3wcDVwDYLuQ1+jFhGBC0Rl+/koiI8T/APv/DdGe9y4sAXyc8kDWl?=
 =?us-ascii?Q?phZy0KZL+6q6yAMTjQ2aLsWPqHoiLTrbEZxTJZ0bLLdysPlfXR689DBRJmvm?=
 =?us-ascii?Q?V+SYKOCQzz9/gHcldi7SL0NTYrzEpFoZAaRiuLGWsp+1OMeThbVhDnnXQX6I?=
 =?us-ascii?Q?cAe8wWm8Ustsdn8To6I3X8AWSwzZdE0CWyf0EbECl7q29bc8H7VBw5CneJlF?=
 =?us-ascii?Q?94rkiUNYL5GJEDpgSiRtPDpOWzvh3yc//+m7BgMr467ciGjq73ae/vwcUsZ+?=
 =?us-ascii?Q?d4WuaVNGjXTbjnhB0sZnWbQU7pVGuCVreieDkxzL/qEQUc9y00ZctUdJbBxr?=
 =?us-ascii?Q?NZaMGvPg4H97AK+6waNjR4SbA2AtJGClsAhMkIbQ0GAVx+E0HaeIUd8b4MI9?=
 =?us-ascii?Q?yWjZRfX+lE6VmRRCc5nGKJihr3sb5FdEL+ZEinWJ6Uu+TPJbO3va1teeDW9U?=
 =?us-ascii?Q?0F5U/NFj/eH8+cy1E1lxI1LHZ3dGBH+sH8WenRMbLan+cWnlYP97vXvCkP9U?=
 =?us-ascii?Q?FAkbluxEQjHCDbbwWMWraE2P90z/K0Upz72ky+2ln1sRR/ixiicugiTa9Bk7?=
 =?us-ascii?Q?Zxq2benbZsCddehdRYERCHHE78ahDPYZ3WFP3EJK8t8NpBdmnjkQ0lLgHi4U?=
 =?us-ascii?Q?jMyWbIxg0vP2F6QtQYJxo7SrYHSBevqXBRihKFDEzWyVQpYL2iahuNdK97tk?=
 =?us-ascii?Q?yyabOZeqNPQO0AMuoaXLcoXEdU0A4kQoovwCAMjhiUZ8SUdbep5k5ZeO1Z2s?=
 =?us-ascii?Q?2ImvXaOwQs7K2A/A0rorvph4HmqyrTxVKv1XHaGT0Vkr67ULAvHmg72FE9ih?=
 =?us-ascii?Q?TJi9syMsM1u0d9r8PTCp3yCkGM29OPRT65tLW4VLOS5L9oX4w0XBJ3NBpSya?=
 =?us-ascii?Q?xRNLm9HrRTjseXT/rrrx/RWPSfxqsZUZyGAk+35blpQ3Pjfk2qD0R8e1CzQv?=
 =?us-ascii?Q?YfUaLFkS3QlBky0hqB8INJpFogF9LusTDz+fklvQmtv/454zvWfJACz8wvYP?=
 =?us-ascii?Q?B9x34XmFPokR9DDs4Co=3D?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 11:10:55.5701
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a09114b-9c36-4861-9cea-08de17a4ff43
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000CB.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5784

From: Joakim Zhang <joakim.zhang@cixtech.com>

This patch adds support for CIX IPBLOQ HDA controller

Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
---
 sound/hda/controllers/Kconfig      |  13 +
 sound/hda/controllers/Makefile     |   2 +
 sound/hda/controllers/cix-ipbloq.c | 470 +++++++++++++++++++++++++++++
 3 files changed, 485 insertions(+)
 create mode 100644 sound/hda/controllers/cix-ipbloq.c

diff --git a/sound/hda/controllers/Kconfig b/sound/hda/controllers/Kconfig
index 34721f50b055..c6b0666ef18c 100644
--- a/sound/hda/controllers/Kconfig
+++ b/sound/hda/controllers/Kconfig
@@ -30,6 +30,19 @@ config SND_HDA_TEGRA
 	  To compile this driver as a module, choose M here: the module
 	  will be called snd-hda-tegra.
 
+config SND_HDA_CIX_IPBLOQ
+	tristate "CIX IPBLOQ HD Audio"
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
index 000000000000..8f6c9ff09950
--- /dev/null
+++ b/sound/hda/controllers/cix-ipbloq.c
@@ -0,0 +1,470 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright 2025 Cix Technology Group Co., Ltd.
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/mfd/syscon.h>
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
+
+	struct work_struct probe_work;
+};
+
+static const struct hda_controller_ops cix_ipbloq_hda_ops;
+
+static dma_addr_t cix_ipbloq_hda_addr_host_to_hdac(struct hdac_bus *bus, dma_addr_t addr)
+{
+	dma_addr_t addr_adj;
+
+	addr_adj = addr - CIX_IPBLOQ_SKY1_ADDR_HOST_TO_HDAC_OFFSET;
+
+	return addr_adj;
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
+	struct cix_ipbloq_hda *hda = container_of(chip, struct cix_ipbloq_hda, chip);
+
+	cancel_work_sync(&hda->probe_work);
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
+static int cix_ipbloq_hda_init_chip(struct azx *chip, struct platform_device *pdev)
+{
+	struct cix_ipbloq_hda *hda = container_of(chip, struct cix_ipbloq_hda, chip);
+	struct hdac_bus *bus = azx_bus(chip);
+	struct resource *res;
+
+	hda->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(hda->regs)) {
+		dev_err(&pdev->dev, "failed to get and ioremap resource\n");
+		return PTR_ERR(hda->regs);
+	}
+
+	bus->remap_addr = hda->regs;
+	bus->addr = res->start;
+
+	return 0;
+}
+
+static int cix_ipbloq_hda_init(struct azx *chip, struct platform_device *pdev)
+{
+	struct hdac_bus *bus = azx_bus(chip);
+	struct snd_card *card = chip->card;
+	const char *sname = NULL, *drv_name = "cix-ipbloq-hda";
+	unsigned short gcap;
+	int irq_id, err;
+
+	err = cix_ipbloq_hda_init_chip(chip, pdev);
+	if (err)
+		return err;
+
+	irq_id = platform_get_irq(pdev, 0);
+	if (irq_id < 0) {
+		dev_err(&pdev->dev, "failed to get the irq\n");
+		return irq_id;
+	}
+
+	err = devm_request_irq(chip->card->dev, irq_id, azx_interrupt,
+			     IRQF_SHARED, KBUILD_MODNAME, chip);
+	if (err) {
+		dev_err(chip->card->dev,
+			"unable to request IRQ %d, disabling device\n",
+			irq_id);
+		return err;
+	}
+
+	bus->irq = irq_id;
+	bus->dma_stop_delay = 100;
+	card->sync_irq = bus->irq;
+
+	gcap = azx_readw(chip, GCAP);
+
+	chip->capture_streams = (gcap >> 8) & 0x0f;
+	chip->playback_streams = (gcap >> 12) & 0x0f;
+	chip->capture_index_offset = 0;
+	chip->playback_index_offset = chip->capture_streams;
+	chip->num_streams = chip->playback_streams + chip->capture_streams;
+
+	/* initialize streams */
+	err = azx_init_streams(chip);
+	if (err < 0) {
+		dev_err(card->dev, "failed to initialize streams: %d\n", err);
+		return err;
+	}
+
+	err = azx_alloc_stream_pages(chip);
+	if (err < 0) {
+		dev_err(card->dev, "failed to allocate stream pages: %d\n", err);
+		return err;
+	}
+
+	/* initialize chip */
+	azx_init_chip(chip, 1);
+
+	/* codec detection */
+	if (!bus->codec_mask) {
+		dev_err(card->dev, "no codecs found\n");
+		return -ENODEV;
+	}
+	dev_info(card->dev, "codec detection mask = 0x%lx\n", bus->codec_mask);
+
+	/* driver name */
+	strscpy(card->driver, drv_name, sizeof(card->driver));
+
+	/* shortname for card */
+	sname = of_get_property(pdev->dev.of_node, "cix,model", NULL);
+	if (!sname)
+		sname = drv_name;
+	if (strlen(sname) > sizeof(card->shortname))
+		dev_info(card->dev, "truncating shortname for card\n");
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
+static void cix_ipbloq_hda_probe_work(struct work_struct *work)
+{
+	struct cix_ipbloq_hda *hda = container_of(work, struct cix_ipbloq_hda, probe_work);
+	struct platform_device *pdev = to_platform_device(hda->dev);
+	struct azx *chip = &hda->chip;
+	struct hdac_bus *bus = azx_bus(chip);
+	int err;
+
+	err = pm_runtime_resume_and_get(hda->dev);
+	if (err < 0) {
+		dev_err(hda->dev, "pm_runtime_resume_and_get failed, err = %d\n", err);
+		return;
+	}
+
+	to_hda_bus(bus)->bus_probing = 1;
+
+	err = cix_ipbloq_hda_init(chip, pdev);
+	if (err < 0)
+		goto out_free;
+
+	/* create codec instances */
+	err = azx_probe_codecs(chip, 8);
+	if (err < 0)
+		goto out_free;
+
+	err = azx_codec_configure(chip);
+	if (err < 0)
+		goto out_free;
+
+	err = snd_card_register(chip->card);
+	if (err < 0)
+		goto out_free;
+
+	chip->running = 1;
+
+	to_hda_bus(bus)->bus_probing = 0;
+
+	snd_hda_set_power_save(&chip->bus, CIX_IPBLOQ_POWER_SAVE_DEFAULT_TIME_MS);
+
+	dev_info(hda->dev, "cix ipbloq hda probed\n");
+
+ out_free:
+	pm_runtime_put(hda->dev);
+	return; /* no error return from async probe */
+}
+
+static int cix_ipbloq_hda_create(struct snd_card *card,
+				 unsigned int driver_caps,
+				 struct cix_ipbloq_hda *hda)
+{
+	static const struct snd_device_ops ops = {
+		.dev_disconnect = cix_ipbloq_hda_dev_disconnect,
+		.dev_free = cix_ipbloq_hda_dev_free,
+	};
+	struct azx *chip;
+	int err;
+
+	chip = &hda->chip;
+
+	mutex_init(&chip->open_mutex);
+	chip->card = card;
+	chip->ops = &cix_ipbloq_hda_ops;
+	chip->driver_caps = driver_caps;
+	chip->driver_type = driver_caps & 0xff;
+	chip->dev_index = 0;
+	chip->single_cmd = 0;
+	chip->codec_probe_mask = -1;
+	chip->align_buffer_size = 1;
+	chip->jackpoll_interval = msecs_to_jiffies(CIX_IPBLOQ_JACKPOLL_DEFAULT_TIME_MS);
+	INIT_LIST_HEAD(&chip->pcm_list);
+
+	/*
+	 * HD-audio controllers appear pretty inaccurate about the update-IRQ timing.
+	 * The IRQ is issued before actually the data is processed. So use stream
+	 * link position by default instead of dma position buffer.
+	 */
+	chip->get_position[0] = chip->get_position[1] = azx_get_pos_lpib;
+
+	INIT_WORK(&hda->probe_work, cix_ipbloq_hda_probe_work);
+
+	err = azx_bus_init(chip, NULL);
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
+	chip->bus.jackpoll_in_suspend = 1;
+
+	/* host and hdac has different memory view */
+	chip->bus.core.addr_host_to_hdac = cix_ipbloq_hda_addr_host_to_hdac;
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
+	struct snd_card *card;
+	struct azx *chip;
+	struct cix_ipbloq_hda *hda;
+	int err;
+
+	hda = devm_kzalloc(&pdev->dev, sizeof(*hda), GFP_KERNEL);
+	if (!hda)
+		return -ENOMEM;
+
+	hda->dev = &pdev->dev;
+	chip = &hda->chip;
+
+	err = snd_card_new(&pdev->dev, SNDRV_DEFAULT_IDX1, SNDRV_DEFAULT_STR1,
+			   THIS_MODULE, 0, &card);
+	if (err < 0) {
+		dev_err(&pdev->dev, "failed to crate card, err = %d\n", err);
+		return err;
+	}
+
+	dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
+
+	err = of_reserved_mem_device_init(&pdev->dev);
+	if (err && err != -ENODEV) {
+		dev_err(&pdev->dev,
+			"failed to init reserved mem for DMA, err = %d\n", err);
+		goto out_free;
+	}
+
+	hda->resets[hda->nresets++].id = "hda";
+	err = devm_reset_control_bulk_get_exclusive(&pdev->dev, hda->nresets,
+						    hda->resets);
+	if (err) {
+		dev_err(&pdev->dev, "failed to get reset, err = %d\n", err);
+		goto out_free;
+	}
+
+	hda->clocks[hda->nclocks++].id = "sysclk";
+	hda->clocks[hda->nclocks++].id = "clk48m";
+	err = devm_clk_bulk_get(&pdev->dev, hda->nclocks, hda->clocks);
+	if (err < 0) {
+		dev_err(&pdev->dev, "failed to get clk, err = %d\n", err);
+		goto out_free;
+	}
+
+	err = cix_ipbloq_hda_create(card, driver_flags, hda);
+	if (err < 0)
+		goto out_free;
+	card->private_data = chip;
+
+	dev_set_drvdata(&pdev->dev, card);
+
+	pm_runtime_enable(hda->dev);
+	if (!azx_has_pm_runtime(chip))
+		pm_runtime_forbid(hda->dev);
+
+	schedule_work(&hda->probe_work);
+
+	return 0;
+
+out_free:
+	snd_card_free(card);
+	return err;
+}
+
+static void cix_ipbloq_hda_remove(struct platform_device *pdev)
+{
+	snd_card_free(dev_get_drvdata(&pdev->dev));
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
+	{ .compatible = "cix,sky1-ipbloq-hda" },
+	{},
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

