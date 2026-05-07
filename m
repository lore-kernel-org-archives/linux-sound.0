Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011053.outbound.protection.outlook.com [40.107.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DBF38AC97;
	Thu,  7 May 2026 18:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778177606; cv=fail; b=VsZnnJNmW2ppNYj2eJDUnAtuWiEB2i8wS01e27SJfjVt1bM6GuCHx8oJ9LbKjod9nHjftK9OLfoick/qqRrqN63Os8aq3My8VHypw/x8FecYyju9OYGsKFkBOl9ijM0XtSSQTPl333SNZ0RneiHwrszBaPSJOnyj1p4SmT97V6s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778177606; c=relaxed/simple;
	bh=jnWVB4bNgyR0cV7tQLH7bqjB+JjdakjMjG5S6rK6WsQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OycjtrmnfzUVRWJq4jlwXkj76oOvWTQSYpLLtNJ3XrWAoXoams481SrO8t/ONvCdqtvMnBcWF47KsRGvIG9D/zy8Ll0rhIJSHFdHKGwvZOBywtDqR8CZ5l3hy69iXaJb3Nj+ZBfv+HMOnJoOIENoVOosQPfXfRn6NujaRX8Dtlo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=oSF6lVel; arc=fail smtp.client-ip=40.107.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="oSF6lVel"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B5h80rXWc3L4zYsJJTZJeJ5H0A4Ci1YXljkgjNQBO9oMm8Hm3IeQqz3Z5mPVHrNK2cJzlEGTC0AiLllHGJP6SUrfuQfnYf5fXVrIfe+xp2HMgTeQAsHXT30dHiJ4Zohv/1Ygrj0qWtGF/Eh9Vfk64wBC6xkvqEi7E0UbCfQo/NTPCLW6e4fmmDfVQ0MKfuLlshMvT6cNCcxjzBVYfkzNINajEd+84kve3Kmlk+2pHl2jK6P3gOcGduBH0nyQ0XgVCxgSpzjYbjmI2U2vo47cnN7iyO5ajogM/ggwTv0zlMZS3Wku0zpW4RGSaQstMaB3n2QA2FPkBP8oHT2DNaiTSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kmBDCpz+2GGolVleYO9I7ShHNtogIaJhZ/VVkslAgjM=;
 b=ihFLOy9gwHZ/PgL3cWnLZABobMMjBY0rBLOCua3Vv4TkbrpiFzwZCiNOMfpoV34R4KUkPY7F5LthdT8tRWcu95rdGXtwSyEl6YxnB6AMGrJpWY2MAOW0uhlLLpKmiLJCVxR9uVq8TSnyHFDZOchKVQOFN+QY3BPy0s3E0pKyC6Lx+vngmohlsd0qjgs+3Abfg6/waxiiwDeFy77IFJNaLuknVMA629m+aDsaJI+A90pqE5siOxLwXW40uiYEwJlhjPzqQXXCHL8HxTYhjllKH/hlqgJeXd6WbARN6rNOZ2/Zo6tpR3M7zffi6rLA4A7pmvskvg9PBQaQeQrNxojWNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kmBDCpz+2GGolVleYO9I7ShHNtogIaJhZ/VVkslAgjM=;
 b=oSF6lVelvKx4lAAz+qRjRrASG1BBrxd175N6al9PdItnqUrzjxXzzlStb5oR7i/n63HR2+bYr6IDt77mwI51fv0SZMSv6ANJlduJD2OPFURoFLszy2kBjPNGRiVJ+kXjT+ZCA/b9/HXvR+YPsipsOyxg2dIA3tGIjpaDvZgfmoc=
Received: from MN0PR02CA0023.namprd02.prod.outlook.com (2603:10b6:208:530::18)
 by SA3PR12MB8763.namprd12.prod.outlook.com (2603:10b6:806:312::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 7 May
 2026 18:13:20 +0000
Received: from BL6PEPF00022570.namprd02.prod.outlook.com
 (2603:10b6:208:530:cafe::1) by MN0PR02CA0023.outlook.office365.com
 (2603:10b6:208:530::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.18 via Frontend Transport; Thu,
 7 May 2026 18:13:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00022570.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Thu, 7 May 2026 18:13:20 +0000
Received: from vijendar-linux.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 7 May
 2026 13:13:17 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <mario.limonciello@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH 3/5] ASoC: amd: acp7x: add helper functions and hw ops
Date: Thu, 7 May 2026 23:41:31 +0530
Message-ID: <20260507181251.20594-4-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260507181251.20594-1-Vijendar.Mukunda@amd.com>
References: <20260507181251.20594-1-Vijendar.Mukunda@amd.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022570:EE_|SA3PR12MB8763:EE_
X-MS-Office365-Filtering-Correlation-Id: 1989fc18-61c8-4eb6-e098-08deac645207
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	9DSfHLNwLHZOUFKhAGO31YJXfYnOrnX0G8y5EKja2HEmj1LtBWFyRi3/q5pGCKY49A+VWVAix3LnQvN5m28driUEeiRlevCWa4Ak8fuDX5ydW26N9eoBdEDCAeRWd7PhDyMKqn0barqzoRdPnim9FxzDT9Chnkmob7Dm54O6bwQ9XOyd8sz1jvhrvVAnxEaX1Q7SkKfPUjGOxTvrbJjGkHEAcdtvoEC16yQCwwo4677UF1FAa9IHfSfG8dvXtGvBTm+v8UNKyU5pjnXNUMBUHzz5sC6ZcGgE4PUlReFgr+jv0ydkRjT5KkAVy5UIwNHaVKS7x0Gc2O5GkAE4PONXorRI+uCwxmZ7rN5q0FRkwei7N+0C4S9Z+VmdHLoviDMywvk7WbsHKR08CQPaJYhb+ptMkUe5tqYufdWKqMX+cTEFnxtldicuNzfxrdvRliyPJw5YYPeosP8/6YtZqsuh47eqe1VzCeKPp1bttYWUQ5ukDw/AT3PqclPfWu9m+iuSbNEpxERO2E9p/SVbD7A7VUqx7Ly5ebNBbrrsxWtoGsPcNtCHdCZBrfSy/96BCcufKMJKJjr+OLN1lrionNLdfFRTRbYRrhah+gOOUA9cH11ZsN/L5nDUtT7uDqRKqiW3Z856uWwL07YBeLZAGk0Olf0/lzQb5EX8QxO+IYw6dxtETze8LM4Zi0JkSurKtu7NceJXIzHpQkUSObUbowCI2vKbAT+S0qQ0cK+xi0LmVwI=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iL7STTRvZjya2qHTBNJeVHUBlFXxbaXtw/g41TuA7cB97HCb5FIRxQ55dwjt+cSgP5OEEatqPNxDgBL/Xg+zJY9UFZxmNALzYqme675thWXBxnxUtZYvLEsNTCylM1ad3Fw9ZVgsVawqOXp1Xtj2HYMmHy0uhxwFnZMtD1So7mQ5X9m1STsuNCSnbT+PV7d5dJVsS3dqDnK8k3Y6OUxBwgLguyXMKTAcwm4tDL/tTmhns/KrvOI/x+IInKb8WjMZtwxRFrHsJ3yVDZbfD1ThoMo9nmsjfYrUEOOQfTla56TQWfO37rIo1NfXesOTx3i02lMMk0teBVo5Ql+923XEeG5mb4W6CaZhPpc9zjEh95xYWMdc8UMcwpKyAYTIRtMsPWhx2R3A9eNGgU/lLI6R9shKPO8kqEC+GOemWjiHz7uob0XWrTT+t56UBQXWM5vt
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 18:13:20.5703
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1989fc18-61c8-4eb6-e098-08deac645207
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022570.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8763

Add ACP7.x init/deinit helper routines and wire up PCI hw ops for
ACP7.D/7.E/7.F variants.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp7x/acp7x-common.c | 82 ++++++++++++++++++++++++++++++
 sound/soc/amd/acp7x/acp7x.h        | 78 +++++++++++++++++++++++++++-
 sound/soc/amd/acp7x/pci-acp7x.c    | 39 +++++++++++++-
 3 files changed, 197 insertions(+), 2 deletions(-)
 create mode 100644 sound/soc/amd/acp7x/acp7x-common.c

diff --git a/sound/soc/amd/acp7x/acp7x-common.c b/sound/soc/amd/acp7x/acp7x-common.c
new file mode 100644
index 000000000000..68f9b47766c4
--- /dev/null
+++ b/sound/soc/amd/acp7x/acp7x-common.c
@@ -0,0 +1,82 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * AMD ACP PCI driver callback routines for ACP7.x
+ * platforms.
+ *
+ * Copyright 2026 Advanced Micro Devices, Inc.
+ */
+
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/types.h>
+
+#include "acp7x.h"
+
+static int acp7x_power_on(void __iomem *acp_base)
+{
+	u32 val = 0;
+
+	val = readl(acp_base + ACP_PGFSM_STATUS);
+	if (!(val & ACP7X_PGFSM_STATUS_MASK))
+		return 0;
+
+	writel(ACP7X_PGFSM_CNTL_POWER_ON_MASK, acp_base + ACP_PGFSM_CONTROL);
+	val = readl(acp_base + ACP_PGFSM_CONTROL);
+	return readl_poll_timeout(acp_base + ACP_PGFSM_STATUS, val,
+				  ((val & ACP7X_PGFSM_STATUS_MASK) == 0), DELAY_US, ACP7X_TIMEOUT);
+}
+
+static int acp7x_reset(void __iomem *acp_base)
+{
+	u32 val;
+	int ret;
+
+	writel(1, acp_base + ACP_SOFT_RESET);
+	ret = readl_poll_timeout(acp_base + ACP_SOFT_RESET, val,
+				 val & ACP_SOFT_RESET_SOFTRESET_AUDDONE_MASK,
+				 DELAY_US, ACP7X_TIMEOUT);
+	if (ret)
+		return ret;
+
+	writel(0, acp_base + ACP_SOFT_RESET);
+	return readl_poll_timeout(acp_base + ACP_SOFT_RESET, val, !val, DELAY_US, ACP7X_TIMEOUT);
+}
+
+static int acp7x_init(void __iomem *acp_base, struct device *dev)
+{
+	int ret;
+
+	ret = acp7x_power_on(acp_base);
+	if (ret) {
+		dev_err(dev, "ACP power on failed\n");
+		return ret;
+	}
+	writel(0x01, acp_base + ACP_CONTROL);
+	ret = acp7x_reset(acp_base);
+	if (ret) {
+		dev_err(dev, "ACP reset failed\n");
+		return ret;
+	}
+	writel(0, acp_base + ACP_ZSC_DSP_CTRL);
+	return 0;
+}
+
+static int acp7x_deinit(void __iomem *acp_base, struct device *dev)
+{
+	int ret;
+
+	ret = acp7x_reset(acp_base);
+	if (ret) {
+		dev_err(dev, "ACP reset failed\n");
+		return ret;
+	}
+	writel(0x01, acp_base + ACP_ZSC_DSP_CTRL);
+	return 0;
+}
+
+void acp7x_hw_init_ops(struct acp_hw_ops *hw_ops)
+{
+	hw_ops->acp_init = acp7x_init;
+	hw_ops->acp_deinit = acp7x_deinit;
+}
diff --git a/sound/soc/amd/acp7x/acp7x.h b/sound/soc/amd/acp7x/acp7x.h
index b4586a2afae4..d3a57705385a 100644
--- a/sound/soc/amd/acp7x/acp7x.h
+++ b/sound/soc/amd/acp7x/acp7x.h
@@ -8,6 +8,8 @@
 #ifndef __SOUND_SOC_AMD_ACP7X_H
 #define __SOUND_SOC_AMD_ACP7X_H
 
+#include <linux/device.h>
+#include <linux/errno.h>
 #include <linux/io.h>
 #include <linux/pci.h>
 #include <linux/types.h>
@@ -22,10 +24,84 @@
 #define ACP7E_PCI_REV		0x7E
 #define ACP7F_PCI_REV		0x7F
 
-int snd_amd_acp_find_config(struct pci_dev *pci);
+/* Common register helper bits used by acp7x-common.c */
+#define ACP_SOFT_RESET_SOFTRESET_AUDDONE_MASK	0x00010001
+
+#define DELAY_US				5
+#define ACP7X_TIMEOUT				5000
+
+#define ACP7X_PGFSM_CNTL_POWER_ON_MASK		7
+#define ACP7X_PGFSM_STATUS_MASK			0x3F
+
+struct acp_hw_ops {
+	int (*acp_init)(void __iomem *acp_base, struct device *dev);
+	int (*acp_deinit)(void __iomem *acp_base, struct device *dev);
+	int (*acp_suspend)(struct device *dev);
+	int (*acp_resume)(struct device *dev);
+	int (*acp_suspend_runtime)(struct device *dev);
+	int (*acp_resume_runtime)(struct device *dev);
+};
 
 struct acp7x_dev_data {
 	void __iomem *acp7x_base;
+	struct acp_hw_ops *hw_ops;
+	u32 addr;
+	u32 reg_range;
+	u32 acp_rev;
 };
 
+void acp7x_hw_init_ops(struct acp_hw_ops *hw_ops);
+
+static inline int acp_hw_init(struct acp7x_dev_data *adata, struct device *dev)
+{
+	if (adata && adata->hw_ops && adata->hw_ops->acp_init)
+		return adata->hw_ops->acp_init(adata->acp7x_base, dev);
+	return -EOPNOTSUPP;
+}
+
+static inline int acp_hw_deinit(struct acp7x_dev_data *adata, struct device *dev)
+{
+	if (adata && adata->hw_ops && adata->hw_ops->acp_deinit)
+		return adata->hw_ops->acp_deinit(adata->acp7x_base, dev);
+	return -EOPNOTSUPP;
+}
+
+static inline int acp_hw_suspend(struct device *dev)
+{
+	struct acp7x_dev_data *adata = dev_get_drvdata(dev);
+
+	if (adata && adata->hw_ops && adata->hw_ops->acp_suspend)
+		return adata->hw_ops->acp_suspend(dev);
+	return -EOPNOTSUPP;
+}
+
+static inline int acp_hw_resume(struct device *dev)
+{
+	struct acp7x_dev_data *adata = dev_get_drvdata(dev);
+
+	if (adata && adata->hw_ops && adata->hw_ops->acp_resume)
+		return adata->hw_ops->acp_resume(dev);
+	return -EOPNOTSUPP;
+}
+
+static inline int acp_hw_suspend_runtime(struct device *dev)
+{
+	struct acp7x_dev_data *adata = dev_get_drvdata(dev);
+
+	if (adata && adata->hw_ops && adata->hw_ops->acp_suspend_runtime)
+		return adata->hw_ops->acp_suspend_runtime(dev);
+	return -EOPNOTSUPP;
+}
+
+static inline int acp_hw_runtime_resume(struct device *dev)
+{
+	struct acp7x_dev_data *adata = dev_get_drvdata(dev);
+
+	if (adata && adata->hw_ops && adata->hw_ops->acp_resume_runtime)
+		return adata->hw_ops->acp_resume_runtime(dev);
+	return -EOPNOTSUPP;
+}
+
+int snd_amd_acp_find_config(struct pci_dev *pci);
+
 #endif /* __SOUND_SOC_AMD_ACP7X_H */
diff --git a/sound/soc/amd/acp7x/pci-acp7x.c b/sound/soc/amd/acp7x/pci-acp7x.c
index 476b3ae52634..237eb06e3cad 100644
--- a/sound/soc/amd/acp7x/pci-acp7x.c
+++ b/sound/soc/amd/acp7x/pci-acp7x.c
@@ -16,6 +16,26 @@
 
 #include "acp7x.h"
 
+static int acp_hw_init_ops(struct acp7x_dev_data *adata, struct pci_dev *pci)
+{
+	adata->hw_ops = devm_kzalloc(&pci->dev, sizeof(struct acp_hw_ops),
+				     GFP_KERNEL);
+	if (!adata->hw_ops)
+		return -ENOMEM;
+
+	switch (adata->acp_rev) {
+	case ACP7D_PCI_REV:
+	case ACP7E_PCI_REV:
+	case ACP7F_PCI_REV:
+		acp7x_hw_init_ops(adata->hw_ops);
+		break;
+	default:
+		dev_err(&pci->dev, "ACP device not found\n");
+		return -ENODEV;
+	}
+	return 0;
+}
+
 static int snd_acp7x_probe(struct pci_dev *pci,
 			   const struct pci_device_id *pci_id)
 {
@@ -27,7 +47,6 @@ static int snd_acp7x_probe(struct pci_dev *pci,
 	flag = snd_amd_acp_find_config(pci);
 	if (flag)
 		return -ENODEV;
-
 	/* ACP PCI revision id check for ACP7.x platforms */
 	switch (pci->revision) {
 	case ACP7D_PCI_REV:
@@ -60,8 +79,19 @@ static int snd_acp7x_probe(struct pci_dev *pci,
 		ret = -ENOMEM;
 		goto release_regions;
 	}
+	adata->addr = addr;
+	adata->reg_range = ACP7X_REG_END - ACP7X_REG_START;
+	adata->acp_rev = pci->revision;
 	pci_set_master(pci);
 	pci_set_drvdata(pci, adata);
+	ret = acp_hw_init_ops(adata, pci);
+	if (ret) {
+		dev_err(&pci->dev, "ACP hw ops init failed\n");
+		goto release_regions;
+	}
+	ret = acp_hw_init(adata, &pci->dev);
+	if (ret)
+		goto release_regions;
 	return 0;
 
 release_regions:
@@ -74,6 +104,13 @@ static int snd_acp7x_probe(struct pci_dev *pci,
 
 static void snd_acp7x_remove(struct pci_dev *pci)
 {
+	struct acp7x_dev_data *adata;
+	int ret;
+
+	adata = pci_get_drvdata(pci);
+	ret = acp_hw_deinit(adata, &pci->dev);
+	if (ret)
+		dev_err(&pci->dev, "ACP de-init failed\n");
 	pci_release_regions(pci);
 	pci_disable_device(pci);
 }
-- 
2.45.2

