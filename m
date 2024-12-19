Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2078.outbound.protection.outlook.com [40.107.92.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303C7218ABC;
	Thu, 19 Dec 2024 05:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734587522; cv=fail; b=M/OPWgDl72+F62WDJYJdcqFkBhP7S3E3qexJWooa7hdoJ4e5L9/DQMoGyh81GjR9jQofQCQSiSceQs0nOOzvDNX1ywIbi+bgI8rr6rB6ZStoEk1GfvrySxHXMJZgeNTxKkCA0CINkBPydf6DP19mMH/Lw9EX8zXeHdkhE9Xnmt8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734587522; c=relaxed/simple;
	bh=U25s5aLwhsk2zL5rhOQf47JvTFjNh9sb8AGIQ+y1nWQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N/VodvuoIEEa21jVoUy9gdVtJGWH5UjFRXG9owT8msARoNzKzX3J44Cq/f3SfPuwRtq7mWyoJMBxzhtAb2j5BnlSQpmxIR9ilXNrBJIAGmEyf0yLag2qXuvNwL8P9B3o9PhP419dAaWZW0XOn+BvQnshUwMOikDcZQfIiEe56eU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=UIEFf3Rp; arc=fail smtp.client-ip=40.107.92.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="UIEFf3Rp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LUdDue1gnvcGP3xxunoKN8eh+vHzcdHxJkozTGtLrzcu2/YRmJEHRAQxSZKYnkSGoUC98wLh3atJcHaSvwV1C/QCLryl9G4YRknGOBMnK+96vMs4dBRkbQpwYg53zGWxQScXpYOFog+EO3wM4bwcIOVRd/+K2nViVa3FukptRM6DztaQMrIG5dgahNkQiS0eqzh624CJK8YquGr+VT+AcoFqxZ17kdjOmEW3U6m8Qi7MYZ59IIS3fveMmChYEf1r+KLXo/v+SgzXDsRPelMJZj03vVFH48n39s496LKTGxhBk2BNgP4DiEs7p3/PmKl6mOF2Ahnu6HcUuy1FpMxlyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5yvbuQE68I8CQBgTrrOyNfrUCUGPIKT7pMLZcWnPxk0=;
 b=cCEf50f/shlZbKAcyQzr01BIe4XBzkSBAhQMJBlRAsrnFqYlBagy00ezhBjAoku1m6O9bNlPaNAX6Jgulpl3r3cqmfixgCTVgY4wRr1E+xFBwurlCaKkhfXe4tGl1aqQxgqz/eEfo6PIabElhCLiilCTd7pWHUW5YAQA5iuu+Ix7DZ3JP4RNqv/KnWdX5SpdyGIIGV2tQ9TQ75IPYXG9XVTvf7XWdIJ2YCZSr1UZFoBEbGgGoVpi+BS8W2jURphv8BtkEwU+BHCS6y7mRT7f9yU5wpCoseANqRTiFKLBRAxfqgOk4N9MCWN1yWWJZ2yXfgBI1ICFZlJM6k1CBxFhsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5yvbuQE68I8CQBgTrrOyNfrUCUGPIKT7pMLZcWnPxk0=;
 b=UIEFf3Rpnr3RtKpMVcfX4mJnce+cyxJm/Ar2qg3d4pN7fFjf6LjGc8l9z7nqZOxPfVFxQwlgO9WJ8zDTHM/9thM1GBhd8TaF264yAc2p12sJu/bJoO3kYNkhbL9Za4xe0K1xGDJwHQrlO3d5KgAVGIpFugBPF7/F2RAFd6PxSIk=
Received: from CH2PR18CA0048.namprd18.prod.outlook.com (2603:10b6:610:55::28)
 by PH0PR12MB7861.namprd12.prod.outlook.com (2603:10b6:510:26e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Thu, 19 Dec
 2024 05:51:57 +0000
Received: from CH1PEPF0000AD81.namprd04.prod.outlook.com
 (2603:10b6:610:55:cafe::a7) by CH2PR18CA0048.outlook.office365.com
 (2603:10b6:610:55::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.23 via Frontend Transport; Thu,
 19 Dec 2024 05:51:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD81.mail.protection.outlook.com (10.167.244.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Thu, 19 Dec 2024 05:51:56 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Dec 2024 23:51:53 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Mario.Limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 20/21] ASoC: amd: acp: add RT711, RT714 & RT1316 support for ACP7.0 platform
Date: Thu, 19 Dec 2024 11:18:56 +0530
Message-ID: <20241219054857.2070420-21-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD81:EE_|PH0PR12MB7861:EE_
X-MS-Office365-Filtering-Correlation-Id: 034f671b-d096-461e-bfb7-08dd1ff13f74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FMA61LdIr4NNQmVuuNTc8BhuNZygYvTm7S72oSBfCxLtUip+XCCEFFqGufOq?=
 =?us-ascii?Q?HMsx+VVZDnZ7FwUY1FrPMk3uU3CbKt6S+oAhPkWIV5k53UDXipz7dzFA3YwQ?=
 =?us-ascii?Q?9idO2KshIMmACXdL/DUsm2+gx72hCo/W4o+etK7mBRDZIv13AZ94+RwfYwUa?=
 =?us-ascii?Q?69r2LDhTkPLDOe07EdVNjLDp+twZjCKqyx+jF0nnklxeCFyC2oMAXBAnWJ8Z?=
 =?us-ascii?Q?px29SJCEP24ytUDMkJ6neoJFQ0qtKcu/dKikw2bGkGNvoou9B+gjnrh/a+Lz?=
 =?us-ascii?Q?RkAWWM2sREwq3f/1MxJ9uVbhc/9MfWfYBl90ABeubZke4plo0/zFgR2UmX74?=
 =?us-ascii?Q?TRnrhefnbDUFyD8IVFGalvHHUrCpExi8w3sPJmWbMhPD5ImkpT+ORz25DO1a?=
 =?us-ascii?Q?+1WfG0GcuysKW7BmD1B/GCrbt+OO6abQkxT/5w198btAS5e+Yguxpwhv5w1I?=
 =?us-ascii?Q?kbV8+oiKjO7+6eMZyfiC/k/8SzjVXFuCwSVIf0HD2fEcZTZn+i7JPs+8Kwgm?=
 =?us-ascii?Q?JkiEgLJV3eBEwL4IG+YNZGOPxstnnie+hor1trGC+UwmOlU44kvjkhYiRBI0?=
 =?us-ascii?Q?XGqEklZodsq6vHKPBi7hmbWHNeU/ZgfRxm8i93mR5ZuVlngZyFcAQ9HgXE/Y?=
 =?us-ascii?Q?h0cvh9rjjL1IYs3P9O8KmA5TQvNuNteMKs4/gvpX217leO12bHiK0m9dzfwn?=
 =?us-ascii?Q?e4K5pvKC1wCfjQ2GEC+1hJI6FB1wnLYWF2a6+Jkn8vjKjRu7gwQmQWjJK25m?=
 =?us-ascii?Q?nlro2YXZm86zvaHXjbUI4VK4d1QXIePvhP4asXQ9Zqmk0kvQShd2AJSDhsz5?=
 =?us-ascii?Q?19n+nYjaXFGHYW98NsteoVtWioy2GQx72qeXO8t5MyRtEBT1MizjkcxkBdGK?=
 =?us-ascii?Q?eu2fzpygOLyZ3+7VU3EXzoZgq1mAqiR9q/0K+D6MPti18e/19gKJuLQ1JIxn?=
 =?us-ascii?Q?mIcuC0vM9ua3wuHZ1zbWmrd0h29eiMBfFLOwR5RcPfPBeWE5drL5e9WziWzn?=
 =?us-ascii?Q?EMWYH73VhT+/F6hk6jt7eL1dCIE2h17UwLXslEOQ7+cvrJuLvPho2n8liK4m?=
 =?us-ascii?Q?qOjp3JncOJJ+w7Km0IRTTJci/MPLs0CJywTpJMl2HsjAMr5WghRJLheFshE1?=
 =?us-ascii?Q?zQ8wvm4FGieqHBttUkkq+dLqGt693dBwsxXZc1b6/4i8YYrIuDTlwYWiOPOd?=
 =?us-ascii?Q?bzy/Aw1qeCGdoarij8h4Y2wTrGUvTY4pNSDPsLeQcwRA8iGctcD8VxIky8kh?=
 =?us-ascii?Q?iU3geybkNSpdB3P8QqpPrdz6H7A4RJYyzP9K1gyZvL5DUV5B1KdUkhwGVShI?=
 =?us-ascii?Q?yx4SouBSNJh+CCQ6kztPmPe2VqhvnAFIjFR6H7oWvK7ukCIaElmXPrvWJfBy?=
 =?us-ascii?Q?eXBlUgxcJp4dJTWg1s4Lxlvl6VPJUBeHApTHsQdp/rqsDM7bRUc4P09LjChI?=
 =?us-ascii?Q?SsWungJ/BgGLQ2FnJsTBJr05lInAbOqA16eThSPpqFF+duamfhKLCHvhHOCw?=
 =?us-ascii?Q?2RfenEaQ3xKPDTg=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 05:51:56.7892
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 034f671b-d096-461e-bfb7-08dd1ff13f74
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD81.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7861

Add support for corresponding codecs on ACP7.0 platform hardware
configuration.

SDW0: RT711 Jack
SDW0: RT1316 Left Speaker
SDW0: RT1316 Right Speaker
SDW1: RT714 DMIC

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/Kconfig                    |  1 +
 sound/soc/amd/acp/Makefile               |  2 +-
 sound/soc/amd/acp/amd-acp70-acpi-match.c | 88 ++++++++++++++++++++++++
 sound/soc/amd/acp70/pci-acp70.c          |  1 +
 sound/soc/amd/mach-config.h              |  1 +
 5 files changed, 92 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/amd/acp/amd-acp70-acpi-match.c

diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
index 57743bc4fcea..de55fc7642c8 100644
--- a/sound/soc/amd/Kconfig
+++ b/sound/soc/amd/Kconfig
@@ -187,6 +187,7 @@ config SND_SOC_AMD_PS_MACH
 config SND_SOC_AMD_ACP70
 	tristate "AMD Audio Coprocessor-v7.0 SoundWire support"
 	select SND_SOC_AMD_SOUNDWIRE_LINK_BASELINE
+	select SND_SOC_ACPI_AMD_MATCH
 	depends on X86 && PCI && ACPI
 	help
 	  This option enables Audio Coprocessor i.e ACP v7.0 support.
diff --git a/sound/soc/amd/acp/Makefile b/sound/soc/amd/acp/Makefile
index bb2702036338..7c75892e678b 100644
--- a/sound/soc/amd/acp/Makefile
+++ b/sound/soc/amd/acp/Makefile
@@ -22,7 +22,7 @@ snd-acp70-y := acp70.o
 snd-acp-mach-y     := acp-mach-common.o
 snd-acp-legacy-mach-y     := acp-legacy-mach.o acp3x-es83xx/acp3x-es83xx.o
 snd-acp-sof-mach-y     := acp-sof-mach.o
-snd-soc-acpi-amd-match-y := amd-acp63-acpi-match.o
+snd-soc-acpi-amd-match-y := amd-acp63-acpi-match.o amd-acp70-acpi-match.o
 snd-acp-sdw-mach-y     := acp-sdw-mach-common.o
 snd-acp-sdw-sof-mach-y += acp-sdw-sof-mach.o
 snd-acp-sdw-legacy-mach-y += acp-sdw-legacy-mach.o
diff --git a/sound/soc/amd/acp/amd-acp70-acpi-match.c b/sound/soc/amd/acp/amd-acp70-acpi-match.c
new file mode 100644
index 000000000000..1f30adb6c02a
--- /dev/null
+++ b/sound/soc/amd/acp/amd-acp70-acpi-match.c
@@ -0,0 +1,88 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * amd-acp70-acpi-match.c - tables and support for ACP 7.0 platform
+ * ACPI enumeration.
+ *
+ * Copyright 2024 Advanced Micro Devices, Inc.
+ */
+
+#include <sound/soc-acpi.h>
+#include "../mach-config.h"
+
+static const struct snd_soc_acpi_endpoint single_endpoint = {
+	.num = 0,
+	.aggregated = 0,
+	.group_position = 0,
+	.group_id = 0
+};
+
+static const struct snd_soc_acpi_endpoint spk_l_endpoint = {
+	.num = 0,
+	.aggregated = 1,
+	.group_position = 0,
+	.group_id = 1
+};
+
+static const struct snd_soc_acpi_endpoint spk_r_endpoint = {
+	.num = 0,
+	.aggregated = 1,
+	.group_position = 1,
+	.group_id = 1
+};
+
+static const struct snd_soc_acpi_adr_device rt711_rt1316_group_adr[] = {
+	{
+		.adr = 0x000030025D071101ull,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+		.name_prefix = "rt711"
+	},
+	{
+		.adr = 0x000030025D131601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+		.name_prefix = "rt1316-1"
+	},
+	{
+		.adr = 0x000032025D131601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "rt1316-2"
+	},
+};
+
+static const struct snd_soc_acpi_adr_device rt714_adr[] = {
+	{
+		.adr = 0x130025d071401ull,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+		.name_prefix = "rt714"
+	}
+};
+
+static const struct snd_soc_acpi_link_adr acp70_4_in_1_sdca[] = {
+	{	.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt711_rt1316_group_adr),
+		.adr_d = rt711_rt1316_group_adr,
+	},
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(rt714_adr),
+		.adr_d = rt714_adr,
+	},
+	{}
+};
+
+struct snd_soc_acpi_mach snd_soc_acpi_amd_acp70_sdw_machines[] = {
+	{
+		.link_mask = BIT(0) | BIT(1),
+		.links = acp70_4_in_1_sdca,
+		.drv_name = "amd_sdw",
+	},
+	{},
+};
+EXPORT_SYMBOL(snd_soc_acpi_amd_acp70_sdw_machines);
+
+MODULE_DESCRIPTION("AMD ACP7.0 tables and support for ACPI enumeration");
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Vijendar.Mukunda@amd.com");
diff --git a/sound/soc/amd/acp70/pci-acp70.c b/sound/soc/amd/acp70/pci-acp70.c
index ae19187fe695..d873e90e16d1 100644
--- a/sound/soc/amd/acp70/pci-acp70.c
+++ b/sound/soc/amd/acp70/pci-acp70.c
@@ -611,6 +611,7 @@ static int snd_acp70_probe(struct pci_dev *pci,
 	adata->addr = addr;
 	adata->reg_range = ACP70_REG_END - ACP70_REG_START;
 	adata->acp_rev = pci->revision;
+	adata->machines = snd_soc_acpi_amd_acp70_sdw_machines;
 	pci_set_master(pci);
 	pci_set_drvdata(pci, adata);
 	mutex_init(&adata->acp_lock);
diff --git a/sound/soc/amd/mach-config.h b/sound/soc/amd/mach-config.h
index a86c76f781f9..fdf016a64bbf 100644
--- a/sound/soc/amd/mach-config.h
+++ b/sound/soc/amd/mach-config.h
@@ -26,6 +26,7 @@ extern struct snd_soc_acpi_mach snd_soc_acpi_amd_acp63_sof_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_amd_acp63_sdw_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_amd_acp63_sof_sdw_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_amd_acp70_sof_machines[];
+extern struct snd_soc_acpi_mach snd_soc_acpi_amd_acp70_sdw_machines[];
 
 struct config_entry {
 	u32 flags;
-- 
2.34.1

