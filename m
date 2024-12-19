Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2085.outbound.protection.outlook.com [40.107.223.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6090C216E0E;
	Thu, 19 Dec 2024 05:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734587484; cv=fail; b=Qt07pDS82xYvzorVUJdDwieFBR4KV6amla9y1aC/nIj0I7opLrZzw4ry5O+eK0GR/2EZulTT4LxBCcnVP/qLR75qUp+S7g4PzEnVzBV+v1YIvRdwEDO7rcdg+sz0e4Du0mWiGB07gF9YcGlQWjxHAeopKi16cOkVMw5D82z1PEQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734587484; c=relaxed/simple;
	bh=8zfMggSaGPgVOluTTFEYBg25lnFXl/2ApMT5XwS1o04=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BCF6iXZlcR5t1+1I1s3orQm4e2jgkDHdnvgTooyIaRy2U0H8u0hsAaRlc5/KPTIJAcMCjb+cfUPTlKk4h7qdgKM79uoIod548t1/W0OIvEY/CTyQDXb744osLbuc3S8n0A91N1Jdbjj8uPKPnMilfaaRX0cy+jnfBsVPJfSJKjE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2h7VyBFf; arc=fail smtp.client-ip=40.107.223.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2h7VyBFf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yD1FAu14qNel3ILYXfWIxkfkHmygXWH7bMvSqsBS9pXkJGWfAD9Elc6vkX8fEmVRrxANXJGJ+XmQX0l1w8aZIJOUkF951KY4yM6kmwi6XoevPvnCjR1BjJSqhsSfXgvZrtPGDWKWlNEK4XRsCy87H6WqPVksaI4xDHmHEkuF9HfJwTmYbXAcRIkwC/IjmoRF81EDSS8iy8tS+xt0i7yI0o7h4dErnFernS6K1qKf7Il1uNwF/fy+U26DyCIe51g5d2/XKjcD0mzw7Y/A8JZJRiXpv1NsREbUhaST+pi2QhfAGkCiJj1hWaA73y9/RzLk67VFu976pVp89ApLExdM2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N0mHmi3x2XfPwnw1peF6G77Qs3/Zm4UCQI8CCkVrF5s=;
 b=DU9w5uMSbGJv0IhapbkPQj+c9ad7T4/xME7PZCH21t33vjyepGbMItMdBbynPpBfQZTjoAe0OW6vCRT/ldiYX5L5ah5/WQTJGnld6zUHBhK/mIySag43QPNK3TlzV4TU3+ZvoupG2tg6PK9ApELKQ3dOfHxrzrxx8+9DkK8R6sML0thOps30iurP6Rekzcm7qEL7l6ABZIE3nogrxAbVkGqsLibe1ylXQyuN0h/hKiYDcbFutPGvaTz1r03dVdfStZ3vLIkL/DOg5u78WJPlqdTHYPZUkVJO7gn65b4P+xNoizq3ime+EoNcGeO1EISce7hWNXcqgFg9RAzDVg4iqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N0mHmi3x2XfPwnw1peF6G77Qs3/Zm4UCQI8CCkVrF5s=;
 b=2h7VyBFfUpn9bKIo8cfXFr7mJhVE7ylKdoqW/3padYdl0ESVgY7LgflxwnW+tvQ2g5YyPL+5FXYZwiwB9ELko1j/gMmH6Jv9tlkjOTKKMTaA9oLddeplsfvRw8YoEH71u1GoUJZUeBv7CVXa42uluzgU6Uexk6oIjTvPFJDqMP0=
Received: from CH5P222CA0012.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::7)
 by DM4PR12MB6010.namprd12.prod.outlook.com (2603:10b6:8:6a::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8272.13; Thu, 19 Dec 2024 05:51:19 +0000
Received: from CH1PEPF0000AD7D.namprd04.prod.outlook.com
 (2603:10b6:610:1ee:cafe::f0) by CH5P222CA0012.outlook.office365.com
 (2603:10b6:610:1ee::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.23 via Frontend Transport; Thu,
 19 Dec 2024 05:51:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7D.mail.protection.outlook.com (10.167.244.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Thu, 19 Dec 2024 05:51:19 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Dec 2024 23:51:15 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Mario.Limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 09/21] ASoC: amd: acp70: add acp soundwire dma driver
Date: Thu, 19 Dec 2024 11:18:45 +0530
Message-ID: <20241219054857.2070420-10-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241219054857.2070420-1-Vijendar.Mukunda@amd.com>
References: <20241219054857.2070420-1-Vijendar.Mukunda@amd.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7D:EE_|DM4PR12MB6010:EE_
X-MS-Office365-Filtering-Correlation-Id: 5be47e3c-f03a-44b3-d344-08dd1ff1291c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oEyTecldwIsnC0dV6xnmaesb/Ov3UpKA2I2b7AqZd4TEbA7Q527VnIp5/i7W?=
 =?us-ascii?Q?z7iuG+jUph6NoPetqiuUreRVvwq0s0n/7OOtkibnTB0jJ5Cg9xYuTSh/uUQm?=
 =?us-ascii?Q?m9VjIZ61Faaz4MrZ1zYnjMx59Nydv36jcB0RsNjkobk6Q3ZqMvLcFnCo/0WA?=
 =?us-ascii?Q?kK+Jbf4cJQLYU1vccfSa1qidPbhM3+HN0PV41Kug0gURHXfQZCuLaDuPssA+?=
 =?us-ascii?Q?OXeRAhYnlN7HeVcrRmoz7l1kSe8hKxYz+p4JqB/DgMwRT/szroCoaJcxhezg?=
 =?us-ascii?Q?8o+2xsscJKRoddbe7DIUjIGLhGroH8Q3lzRzL6cHXKc00A18/d2Y7QNdCYQW?=
 =?us-ascii?Q?RoOAOBtRReZHq27izXwPqTLHdyv8WdwmwPTtXZXYA2uyARlA0gphfgD7Oyip?=
 =?us-ascii?Q?6T2H392BuXcwt/wP/OQWBPP2s+ICfqCnUmnWS+c7HTu9AmqdNFpwtmtvNtrc?=
 =?us-ascii?Q?RmW7hF9EvlUCbSFVvrnOtatJh5XNftb91W/xhZ/UUvUwYcTXzNOB5P9JHHb3?=
 =?us-ascii?Q?nBQ7DcaSlrjGaRRh6d33qKVO9Rtv4ihYAN5LxD/z/k3bIe6jfblly0oiO7ZM?=
 =?us-ascii?Q?NZySN67vcYU6f+3fvSeE2rxT4Mkd9OLsX6ajFHZ/DSqshFKWMifin2jLbNib?=
 =?us-ascii?Q?9g4NFLqAxVD+GDd++iP5Zjc2EOT555Lk/gEgVfgeShncxbnpi3NInlRKgZZt?=
 =?us-ascii?Q?+Y0GMrYK4JOsTog45T8hVM7W7C23k7n88uHNpx5+5IUVtNIqF7yp2l2HXkkq?=
 =?us-ascii?Q?tO1bQnkYyaLJqWKygDrG+7U3jyJpWGAfkQ5Uf9e0ZR+rGBi1AoTGSZeV/ObN?=
 =?us-ascii?Q?MrFdCeOMqhQL5SUSLlc9lapMehkYmAw0rFweXaWj6+SEBVCDI7CI16hVYoRx?=
 =?us-ascii?Q?C5fa51mA4HK4AWng/jLPadYAvjNt05GuQZY4AyA0SPliFB0PJLSwgWtUjdNq?=
 =?us-ascii?Q?QhJwV73C+uEjaEo1i2UTxXIp0zMLxMjQXAPwwG1GmQlxJFu8sf3DVzOvpi/3?=
 =?us-ascii?Q?kXlOqwXvvGFYvDX4ZEHhX/YjkpPlxLvGNtp51KMnVKRsA3LjP5IatppCDJU4?=
 =?us-ascii?Q?lFEEYT2N3uFO4aRK2taWtH5zlahqbZ85VqW/QyIebNFayRgyrHb9FsDPZerb?=
 =?us-ascii?Q?9wfta7elKTztAiNombEowvAUx5pCjzJTGwW0PEssWjphrD87r8OJ+b8I8naG?=
 =?us-ascii?Q?Tu92fmOEc0X+D3hTE/FVMUiEgLIRcbKafLI17fZTgBzLaM8enHgi4mf8mN3T?=
 =?us-ascii?Q?7ZMuKffyQfAUnQHtbbyizGR81AYd4BpoKrgAVYhcP4iXyv23Lx4+tSz0DfzQ?=
 =?us-ascii?Q?oJpebOJK8/h5VnHd+XUZdDvejA9kKRgHUAK+ZjpHGcJM3b62i94sn0pcjIZT?=
 =?us-ascii?Q?PVsXV89aZB4+PpTJefJJVnQlUKXl0G30XdHbL0ONa8bGyKXs6rh/71M1pjBA?=
 =?us-ascii?Q?MtT1B7a/RZXyhNwfNmtEQbi27DBCiSFVjr0cqQ5Fs8GHqYufeKdmFA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 05:51:19.3031
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5be47e3c-f03a-44b3-d344-08dd1ff1291c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6010

SoundWire DMA platform driver binds to the platform device created by ACP
PCI device. SoundWire DMA driver registers ALSA DMA component with ASoC
framework. Add common SoundWire dma driver for ACP7.0 and ACP7.1 platforms.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp70/Makefile        |  2 +
 sound/soc/amd/acp70/acp70-sdw-dma.c | 74 +++++++++++++++++++++++++++++
 sound/soc/amd/acp70/acp70.h         |  5 ++
 3 files changed, 81 insertions(+)
 create mode 100644 sound/soc/amd/acp70/acp70-sdw-dma.c

diff --git a/sound/soc/amd/acp70/Makefile b/sound/soc/amd/acp70/Makefile
index 778bdf268731..f3e47635558b 100644
--- a/sound/soc/amd/acp70/Makefile
+++ b/sound/soc/amd/acp70/Makefile
@@ -2,6 +2,8 @@
 # ACP 7.0 platform Support
 snd-pci-acp70-y := pci-acp70.o
 snd-acp70-pdm-dma-y := acp70-pdm-dma.o
+snd-acp70-sdw-dma-y := acp70-sdw-dma.o
 
 obj-$(CONFIG_SND_SOC_AMD_ACP70) += snd-pci-acp70.o
 obj-$(CONFIG_SND_SOC_AMD_ACP70) += snd-acp70-pdm-dma.o
+obj-$(CONFIG_SND_SOC_AMD_ACP70) += snd-acp70-sdw-dma.o
diff --git a/sound/soc/amd/acp70/acp70-sdw-dma.c b/sound/soc/amd/acp70/acp70-sdw-dma.c
new file mode 100644
index 000000000000..6d748b295cb0
--- /dev/null
+++ b/sound/soc/amd/acp70/acp70-sdw-dma.c
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * AMD ALSA SoC common SoundWire DMA Driver for ACP 7.0 and
+ * ACP 7.1 platforms.
+ *
+ * Copyright 2024 Advanced Micro Devices, Inc.
+ */
+
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/soc-dai.h>
+#include <linux/soundwire/sdw_amd.h>
+#include "acp70.h"
+
+#define DRV_NAME "amd_acp70_sdw_dma"
+
+static const struct snd_soc_component_driver acp70_sdw_component = {
+	.name		= DRV_NAME,
+	.use_dai_pcm_id = true,
+};
+
+static int acp70_sdw_platform_probe(struct platform_device *pdev)
+{
+	struct resource *res;
+	struct sdw_dma_dev_data *sdw_data;
+	struct acp70_dev_data *acp_data;
+	struct device *parent;
+	int status;
+
+	parent = pdev->dev.parent;
+	acp_data = dev_get_drvdata(parent);
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		dev_err(&pdev->dev, "IORESOURCE_MEM FAILED\n");
+		return -ENODEV;
+	}
+
+	sdw_data = devm_kzalloc(&pdev->dev, sizeof(*sdw_data), GFP_KERNEL);
+	if (!sdw_data)
+		return -ENOMEM;
+
+	sdw_data->acp_base = devm_ioremap(&pdev->dev, res->start, resource_size(res));
+	if (!sdw_data->acp_base)
+		return -ENOMEM;
+
+	sdw_data->acp_lock = &acp_data->acp_lock;
+	dev_set_drvdata(&pdev->dev, sdw_data);
+	status = devm_snd_soc_register_component(&pdev->dev,
+						 &acp70_sdw_component,
+						 NULL, 0);
+	if (status) {
+		dev_err(&pdev->dev, "Fail to register sdw dma component\n");
+		return status;
+	}
+	return 0;
+}
+
+static struct platform_driver acp70_sdw_dma_driver = {
+	.probe = acp70_sdw_platform_probe,
+	.driver = {
+		.name = "amd_acp70_sdw_dma",
+	},
+};
+
+module_platform_driver(acp70_sdw_dma_driver);
+
+MODULE_AUTHOR("Vijendar.Mukunda@amd.com");
+MODULE_DESCRIPTION("AMD ACP7.0 SDW DMA Driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:" DRV_NAME);
diff --git a/sound/soc/amd/acp70/acp70.h b/sound/soc/amd/acp70/acp70.h
index d6c99d43ed4f..c707c10c4be4 100644
--- a/sound/soc/amd/acp70/acp70.h
+++ b/sound/soc/amd/acp70/acp70.h
@@ -97,6 +97,11 @@ struct pdm_dev_data {
 	struct snd_pcm_substream *capture_stream;
 };
 
+struct sdw_dma_dev_data {
+	void __iomem *acp_base;
+	struct mutex *acp_lock; /* used to protect acp common register access */
+};
+
 /**
  * struct acp70_dev_data - acp pci driver context
  * @acp70_base: acp mmio base
-- 
2.34.1

