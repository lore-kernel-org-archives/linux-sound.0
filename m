Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022110.outbound.protection.outlook.com [52.101.126.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370C628727B;
	Tue,  2 Dec 2025 11:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764675102; cv=fail; b=HGYOi8hk92vTaknlAyf1IfH1qyU0zVSkq/g/Q2phgNqDVuHuPPioYKa+TC7XsayUbqINKD9tv/ApYbbebkzPNbOW+bhepHU5v/Us5oINHfr3HVOURxuHN4drnO0xJhVqtykiB1lLJ1QHD8fhAJc++6qMgKoBL9FgSruigCZ/wag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764675102; c=relaxed/simple;
	bh=QdYFzYKiLqwSpEP3ES1Dn1p/flDP68qdHkfj4yQdgpo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ke8eKGI9RaRYTMAfWoyltKvP7ArVHyRa15mOVu1jZ5BLUCK2u4iqgFrmrq9yJ1usEyXVeV5yca6dOHskPq+vCn8Ke5E4ofrs9X3eRJd2/Jl0tF8yk00mM8S+sCG0zZNAzMOgqtfxeeKiHHaHsmxqfKW22EGwzkSMi5cvN1Bs4m8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cGuRck0r9UYFPp/X729HunvzLrCVOtDILLGJHVYR/ZAwPxgoF1l4b1F8+A2Pm6ONQFBCV8nH5qIVhc49TKrceYtuvCFqLQ7e6ZItLR6uXdRSj4XdcrAoFuy/xC8Iia/atXsEN2aVU3iOSRjs6qeZX5LP3ITbAL4Y9LKpZyG5eJam/T7GTCu7h0PJNynoOp2T6qBN97nd+iBv1NNWUpLWE0sd1U3KZFanY1D01qecyV6LhMZrNzL06AWSzlNkSIK3sjrqwuY7Upm6m8RNgeUZ4d1e087UaAHqdLetahIRqmDJvSm62nPVgerbXvnnbS6rOWx6m9HBQpi06ckcHGcJjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vR1dpsCWigqejW7CwehG3I/qYkvp8KPZ+RtFrpL1UtE=;
 b=MB0TbVzD+P8RD0VwyVe2JSTVqZFiS9VxHzSg+DfRevkIqwydbeMDxu+Owe+WnwjcyBG5JQKsDL++k9Cl1j1mcAwoyjK4G+RW3baenMJCFtgekFANv076yw4OrdIS5Hw0P21DPMd+EdqiXXViVAwB86boUVNWq4tfrUn81CVvdi4pSClDiKvyP9wd0ZhO8MteEU1TaeSVzR6vKpCGG96L2pLT5h3meQiYJIazYmEVODkD2vLOgA3EjOSOo8fvHdZSZtNO6PCN+YrUHc1aZQ55Si9aQF61d36GWXwukLsuyT5Dy+M/yeV7HYzI8z1zjwkfsGwut7g2m66pN1EAzBQkjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SGBP274CA0003.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::15) by
 KL1PR06MB6908.apcprd06.prod.outlook.com (2603:1096:820:127::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 11:31:36 +0000
Received: from SG2PEPF000B66CF.apcprd03.prod.outlook.com
 (2603:1096:4:b0:cafe::c6) by SGBP274CA0003.outlook.office365.com
 (2603:1096:4:b0::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Tue,
 2 Dec 2025 11:31:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CF.mail.protection.outlook.com (10.167.240.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Tue, 2 Dec 2025 11:31:35 +0000
Received: from localhost.localdomain (unknown [172.18.64.15])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id D8D3C4143A8D;
	Tue,  2 Dec 2025 19:31:34 +0800 (CST)
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
Subject: [PATCH v4 3/3] ALSA: hda: add CIX IPBLOQ HDA controller support
Date: Tue,  2 Dec 2025 19:31:31 +0800
Message-ID: <20251202113132.1094291-4-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251202113132.1094291-1-joakim.zhang@cixtech.com>
References: <20251202113132.1094291-1-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CF:EE_|KL1PR06MB6908:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6de27bf3-3ddf-44b2-bc33-08de31965a26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bhpSPUO+9A9GVdhlKV8k1+TzHtmpFdnhz+SKh+K9x3pOy0B2gls7ELOzrESF?=
 =?us-ascii?Q?neecSbe6sqWGjetHmKwPoGPK+bBjgVkhkDqxueHBFJblAbQAbdZu8L2CTkuy?=
 =?us-ascii?Q?ynUrHaPUZfewa8t2enibSxlNnJpTS30t3ZVwxrze008y7IcbFL0nus85C2xT?=
 =?us-ascii?Q?pUZ/zinVtS87ZQS2hD8mn4l+yzkez1f++LUa1cnwDvI5nJ1GOwlshteMt/ot?=
 =?us-ascii?Q?Gu1QJ1ZDv3F7zLm9tC2Oh1DhJciw7Ajbe+J0JFQ33M7j4UyMN0RXY6XAr3cK?=
 =?us-ascii?Q?hZDculDzGrQNZLbzZ2vmss6xjbSdfOsQfcYpSQvGFssiy5NeskgHXGbfcv+7?=
 =?us-ascii?Q?3kWa4XEqSHmFzpEqqSpAIPGkx1S43nh/ShxHnDJZvr+AYFaCvkiJttutniA/?=
 =?us-ascii?Q?/gSm8Uc4o0ss6DuD2/0/OHJK5En8oTzlkotvK7PDoNh89u9jLVWXxHwMZB8F?=
 =?us-ascii?Q?84PxfEQm3mg8Sx9SGgaiI8ve11Eo+r2UaHveo/8axPd3UOqqRw+fBSN8tvEi?=
 =?us-ascii?Q?5wZrXyBnFusUdZzGonF/Mk9t+c2JPGOl724QUNqeRqxnW5J33o/VU1mYBxAx?=
 =?us-ascii?Q?PJ3gkgok40HUhXnosA645jFdkjkZxGZj778FqyVitOqKC9BnDro2mdPCqtkw?=
 =?us-ascii?Q?etwl40jL4phJrSQGym8f/T0JmgG9/haYItBdDMMm5YQ6UplkqYjlwLyEeDxV?=
 =?us-ascii?Q?eaMwCr2JmRzyp+wI5oZcm7n4i5wyYohbHwuVOqOyWfkEgZ/8/ZjQ2k2wNTwt?=
 =?us-ascii?Q?zfjUMMSvqq+EKcz1G0P+BJfjRfwAHvfI76yneUpNIHeFC2+C+9bYgRI2fR4Q?=
 =?us-ascii?Q?8pPvvHCu0ycEfZemSpiegPUIFjbxezREmDfv+Gkol4GG/KWXJVGvSbx5Cs2r?=
 =?us-ascii?Q?EzzycVfIyJ8G5YQG5EWLmq3Sbh4ZCH90eXfP9bhZrJeBQIwHNn5wnMce8vcu?=
 =?us-ascii?Q?W5rWORQTlaVSeN4tRfI7oPUHG2bAES1b5QYVy6Sacj4Z/AAqa3XOUQ4fcKnt?=
 =?us-ascii?Q?iSL9bc4446m/9thd/aoJuE/18/Y2bIXf/ZlLYWNFSB3SSLd8JT3iIDG62rEh?=
 =?us-ascii?Q?mygFu3kKUlQHzaj59Kt2IjPGlYUKweeh0znxem4mgcsJTXTHfHUVj1uSRNwM?=
 =?us-ascii?Q?T6ltRf8cH/uxrm2vXiOEPRC5rhk7M/WXTzP6i04EmqmffhowuHPeBFRsVFyM?=
 =?us-ascii?Q?5NGu3pDkKejbHMTaG38vNq+2h2bTpEMVY+dc+okl1O7b/xP3A5wtfB0VMcyv?=
 =?us-ascii?Q?1cd/iPz4tErIjntCibZizmYnrxvFzGJjzNqngZ31xFZ6CBBqc7YWoO0sECWo?=
 =?us-ascii?Q?q8b8aU9ZyMHBbMb8LF0D6Rncy/pVsppNsTZpiwK3i63djKscF3V8v/r93V/K?=
 =?us-ascii?Q?ClHIzdPc+irbKTbjf5PCjbWdroyxLzWpa56SUS9trlHJiHcCy8zEuVH3VQiL?=
 =?us-ascii?Q?KOWIuuVuIGrtAYpwM9kNlCbDgL/yiIw/93kWyYy/Z5r6nlF8ChFwUO8S64uZ?=
 =?us-ascii?Q?IVWnPISbgXyf8XuRlfvPgAmV3/xf1+trNQi55Kytyb6Uod5OXN6RTnW/1EmN?=
 =?us-ascii?Q?ftxllXMy2xw3ABejSao=3D?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 11:31:35.6902
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6de27bf3-3ddf-44b2-bc33-08de31965a26
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CF.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6908

From: Joakim Zhang <joakim.zhang@cixtech.com>

Add CIX IPBLOQ HDA controller support, which is integrated into
CIX SKY1 audio subsystem. HDA controller supports 64bit, but the
audio subsystem can only 32bit transaction. Use jack polling mode
as there is a hardware issue, lead to interrupt strom if the RIRB
interrupt enabled. Host and hdac has different view of memory, so
need do dma address translation.

Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
---
 sound/hda/controllers/Kconfig      |  14 +
 sound/hda/controllers/Makefile     |   2 +
 sound/hda/controllers/cix-ipbloq.c | 438 +++++++++++++++++++++++++++++
 3 files changed, 454 insertions(+)
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
index 000000000000..28158e5f0e16
--- /dev/null
+++ b/sound/hda/controllers/cix-ipbloq.c
@@ -0,0 +1,438 @@
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
+#define CIX_IPBLOQ_SKY1_ADDR_HOST_TO_HDAC_OFFSET	(-0x90000000ULL)
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
+	sname = of_get_property(pdev->dev.of_node, "model", NULL);
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
+	chip->bus.core.dma_stop_delay = 100;
+	chip->bus.core.addr_offset = (dma_addr_t)CIX_IPBLOQ_SKY1_ADDR_HOST_TO_HDAC_OFFSET;
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
+static int cix_ipbloq_hda_suspend(struct device *dev)
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
+static int cix_ipbloq_hda_resume(struct device *dev)
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
+static int cix_ipbloq_hda_runtime_suspend(struct device *dev)
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
+static int cix_ipbloq_hda_runtime_resume(struct device *dev)
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

