Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010000.outbound.protection.outlook.com [52.101.201.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D74C392C5D;
	Tue, 13 Jan 2026 14:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768313657; cv=fail; b=ZyS8UF1sCAQuLIIz1iaqWWgzyBWuOQKuz94vi/R5HteBKJLONuuwgFIiG6YLHpcXTIDv73vrihw41xZsB7tMVDmguSzWNZWuC2wBfBorAgeYefJOXVIP7HZtZz1Hf0J2SY0YpiDWP5ZFsR2TYK7IBPZsnVqL4p4PKvofdsmoSU8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768313657; c=relaxed/simple;
	bh=DgBGLOaCo5sKZDkZYGrQmU/qwy0kzGCwc8Vm9q2dpxk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ujZCAnuxiI60b6LysjQdawSNcDOt1ovvCXPhYpcO7IyRhO/ZkfxfByrCKlWdZakdGhyAmRFj8J2A1VHvmTrjcBtUWa8y/4V/JkAykZddE7t1IJTvaux9YiKGi7XkpXSGTJmjfv018Cdb9SGjxymW353REwDhP9I26ikIN/SRQuY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=MMP7uBEc; arc=fail smtp.client-ip=52.101.201.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="MMP7uBEc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rJA1p1ly3q6rINZSr0uk01fBfHF/FK1YLvne4WTsGTNtt/sscbO1qNeOeE0Yg0SztUkZ4W//Dk4li3vQpaMJeYbxBXQMbaJ18H51kaWu1fQVyQZxaFHvbfkDQwRvPN+Ttc+6hH5bqib1E4dENpvKvPd6WH6RlImdSunLjGQw9QKeIFLAImg1+0SZeYZUDXQSL6A/SutjQMnkB/Rdn+xQAb3myXkwNJGdLhxGXvd87WCkzXGYeg7RfckaWlCz3MQuyNAVwAM3S6A6iH7jJILxy5h/DV+mmzjieHdcaNTyX/2bjF4zBBk7HzoZq5+/J1vAwCCMDMtFZVjObQH3GMS4Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RdP+0x0qT0nySSuVefqSWkq1UAG+OEzdbkMsG4gq9Yo=;
 b=lIHaurvIveDhxC+SkBd29xVvp0rHZPSx56BR7/hs7EF08WGObnWnWrZ1cSyP58KtuDi0tI9iHE73lNYtZ84BqEIiB9mCRynJKIQ90MZB68uuBz0hm4UmyeL8ghvlUNDJ/XrJCQ4Z30c7k32VNk/15SXQc5kM1oIbViOqmYoG9bvyobQGEPWP91ctwnvY/5kZOyyVCgkbJd6PpkgdKRwyhVWhPn0AmxZGQ9Co3m47Lu92FoyOESOAUJoRW/8/fmakhMxEisQLxTT7eqYY4JE4OR/9p4zBQUgDJHkk/BkarvrlcM+JcStNrSWNDKYQAvKC338wqi3XuTyPRVlMNEYjeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RdP+0x0qT0nySSuVefqSWkq1UAG+OEzdbkMsG4gq9Yo=;
 b=MMP7uBEcxJ5pamq2AdXVV/0LzWalGl5IaVo6lGXA8i+vYV/RvvkBu6Stp6rSSGYvn/4hwRbJkMgVtBo2ycHjihNPAqQPqjy+YgKjQ77mgP1qvUKLOEipYIQFPgf6GVswSgiFrW3hxYpE6nAOmsQUNxhkF2lCHgSoSGNXRQQHVgk=
Received: from PH7P220CA0056.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32b::14)
 by PH0PR12MB8149.namprd12.prod.outlook.com (2603:10b6:510:297::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Tue, 13 Jan
 2026 14:14:11 +0000
Received: from SN1PEPF000397AE.namprd05.prod.outlook.com
 (2603:10b6:510:32b:cafe::fe) by PH7P220CA0056.outlook.office365.com
 (2603:10b6:510:32b::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Tue,
 13 Jan 2026 14:14:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000397AE.mail.protection.outlook.com (10.167.248.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 14:14:11 +0000
Received: from vijendar-linux.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 13 Jan
 2026 08:14:08 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Sunil-kumar.Dommati@amd.com>, <mario.limonciello@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH V2 1/2] soundwire: amd: add clock init control function
Date: Tue, 13 Jan 2026 19:43:07 +0530
Message-ID: <20260113141352.1940465-2-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260113141352.1940465-1-Vijendar.Mukunda@amd.com>
References: <20260113141352.1940465-1-Vijendar.Mukunda@amd.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AE:EE_|PH0PR12MB8149:EE_
X-MS-Office365-Filtering-Correlation-Id: 764cba36-c5ad-499a-cb7a-08de52ae061c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UCx/dA4VcTkZPQHeVwuuNOt4Id7Iu2GS6aPXnG7CcEXyZkZomBagHYn3rKf1?=
 =?us-ascii?Q?MDekvAC3poNj/0Ex6oEzkjdovURiVZ5Qno6s/VCR/DfeBtpgcMxJ08rcBmPt?=
 =?us-ascii?Q?HQulrrqWR/v5qZpRpcmwB+9fxyzPzug7c1hlHCx+9NDreICCNR0iaDGIyxeb?=
 =?us-ascii?Q?yHMRdbA3dlrnQqjiJk2AmCJOxtU80wOgwKe5qegJtmO3rGyXmaSdRnPXr0at?=
 =?us-ascii?Q?mQUJ7Fbg5LT04VjSpKwAkEDdsZ8E+QdpP5RKCCkmV+jb/XJwij6eY9W5N2DL?=
 =?us-ascii?Q?elGVVRbSP46zqHiOP/6kX9Z7LIGyM0Djlgegqk5p0Qbinul6zWMOs3WYJpPO?=
 =?us-ascii?Q?WQlTRMH0fISAsU9VczwWo7a9XpUOu+NKaYP/K/n07ndEYR6z+wCPF+3eW3wF?=
 =?us-ascii?Q?I9FnVdkVHJweNu8czo6RTKAsGrbX4GnGp4+QsSaL1dPjNzhUwxh/I7ghmpTe?=
 =?us-ascii?Q?1x562fOSlEfpqXwRKkcFqUEoovFKeys5EINoyGW1GHQVWTDCIm+hfS2VHWZl?=
 =?us-ascii?Q?OnMEMWAthAYWgsIFqxmPSG9WGCXlC2mn3mniaEIay+ZmGuXrsoc9YCx9grKK?=
 =?us-ascii?Q?PvSRDABcazum+QjhmV8ukRSYgIkqeJoVhjf+yiZ/eoUSt20BTySdOE0nEJR/?=
 =?us-ascii?Q?+RRD/yHhmquuNXsnaumWU1dLtSfS1xs50VM+MSddsibqs2Hu6Ku7DIvxW4Xx?=
 =?us-ascii?Q?uP6uxhObu/BCUXPsv9KhVICJL166g7TBHs7dywG2XtD5edLmkSRt01xl7Wet?=
 =?us-ascii?Q?URwp3oTQcXa7zh5wGasFMfNd8ggyYeD3dklJYKswS2nMRs1+jQYFmgSP4622?=
 =?us-ascii?Q?fd9jmBwCmKggy7spB/zJ1WPvv8IfsoqZwmZWMdbunFkihYQYR/oyxF64fuiz?=
 =?us-ascii?Q?0Q+nl8ZmROpTRrdHfYCKI4WdF3HGE+YOllDZtt/XEosOrJYNXA4/QLdwlsBX?=
 =?us-ascii?Q?F5AHolt0sN+aJ4nFbbYxc/Eps4QCU4CDdsn0YZyxCAuPjcLgHK5PM1GuOmF8?=
 =?us-ascii?Q?B6+pOk4QuXnFu9bFAOSfReAJE9ciXYf/+bek6pqfyw528kycmRDzInFL1qAi?=
 =?us-ascii?Q?5/NF2PK7craoHm+RLMTVvE956bdP03fGsHaZj0YItF+dmxQMV7oqxrlBboOn?=
 =?us-ascii?Q?Yc+Xkm0otE91EMT3JYvZbxR+MTQdxhg9ntS7vdDbhuAObORAdR2h9ZW6K0Hg?=
 =?us-ascii?Q?K53n6oh5ORArfBT50haLqL80DjvNiPEUcGji3NUP2Op/ZP5Ow3zJfKqmFn82?=
 =?us-ascii?Q?A/vtxmN4tF8XfNdGB190cIMHA3qPXTOyRBh3JkF5gMOVB+pnNpIFX4ag4DXJ?=
 =?us-ascii?Q?7tf36tg9BMl/pfYqddjiiUA0CaguFto0I7/M/GKgZtZK+qGewpgvpsCqp2ZX?=
 =?us-ascii?Q?ec8hY0PMcL6RgOkGlLX2QEklrNkfSZ3Gw6SAAiIJ2SmPFNTpGEod+R/mv8l2?=
 =?us-ascii?Q?auwvXTYX7yzt6hSqNM8xNduywYZ8jM3GtjJYx9gf11ZsuVT2GOykpEp/F968?=
 =?us-ascii?Q?16o8s0zcECYMD/NtWG8LDDhbhNt+vMZyjj20uIrQ+a919B2WKsZyNilUhJ/D?=
 =?us-ascii?Q?oMHEgiZUt07tdQx2IZU=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 14:14:11.2876
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 764cba36-c5ad-499a-cb7a-08de52ae061c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397AE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8149

Add generic SoundWire clock initialization sequence to support
different SoundWire bus clock frequencies for ACP6.3/7.0/7.1/7.2
platforms and remove hard coding initializations for 12Mhz bus
clock frequency.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 56 ++++++++++++++++++++++++++++-----
 drivers/soundwire/amd_manager.h |  4 ---
 2 files changed, 49 insertions(+), 11 deletions(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 5fd311ee4107..ee3c37a5a48b 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -27,6 +27,49 @@
 
 #define to_amd_sdw(b)	container_of(b, struct amd_sdw_manager, bus)
 
+static int amd_sdw_clk_init_ctrl(struct amd_sdw_manager *amd_manager)
+{
+	struct sdw_bus *bus = &amd_manager->bus;
+	struct sdw_master_prop *prop = &bus->prop;
+	u32 val;
+	int divider;
+
+	dev_dbg(amd_manager->dev, "mclk %d max %d row %d col %d frame_rate:%d\n",
+		prop->mclk_freq, prop->max_clk_freq, prop->default_row,
+		prop->default_col, prop->default_frame_rate);
+
+	if (!prop->default_frame_rate || !prop->default_row) {
+		dev_err(amd_manager->dev, "Default frame_rate %d or row %d is invalid\n",
+			prop->default_frame_rate, prop->default_row);
+		return -EINVAL;
+	}
+
+	/* Set clock divider */
+	dev_dbg(amd_manager->dev, "bus params curr_dr_freq: %d\n",
+		bus->params.curr_dr_freq);
+	divider = (prop->mclk_freq / bus->params.curr_dr_freq);
+
+	writel(divider, amd_manager->mmio + ACP_SW_CLK_FREQUENCY_CTRL);
+	val = readl(amd_manager->mmio + ACP_SW_CLK_FREQUENCY_CTRL);
+	dev_dbg(amd_manager->dev, "ACP_SW_CLK_FREQUENCY_CTRL:0x%x\n", val);
+
+	/* Set frame shape base on the actual bus frequency. */
+	prop->default_col = bus->params.curr_dr_freq /
+			    prop->default_frame_rate / prop->default_row;
+
+	dev_dbg(amd_manager->dev, "default_frame_rate:%d default_row: %d default_col: %d\n",
+		prop->default_frame_rate, prop->default_row, prop->default_col);
+	amd_manager->cols_index = sdw_find_col_index(prop->default_col);
+	amd_manager->rows_index = sdw_find_row_index(prop->default_row);
+	bus->params.col = prop->default_col;
+	bus->params.row = prop->default_row;
+	dev_dbg(amd_manager->dev, "rows_index: %d cols_index: %d\n",
+		amd_manager->rows_index, amd_manager->cols_index);
+	dev_dbg(amd_manager->dev, "params.col:0x%x params.row:0x%x\n",
+		bus->params.col, bus->params.row);
+	return 0;
+}
+
 static int amd_init_sdw_manager(struct amd_sdw_manager *amd_manager)
 {
 	u32 val;
@@ -961,6 +1004,9 @@ int amd_sdw_manager_start(struct amd_sdw_manager *amd_manager)
 
 	prop = &amd_manager->bus.prop;
 	if (!prop->hw_disabled) {
+		ret = amd_sdw_clk_init_ctrl(amd_manager);
+		if (ret)
+			return ret;
 		ret = amd_init_sdw_manager(amd_manager);
 		if (ret)
 			return ret;
@@ -985,7 +1031,6 @@ static int amd_sdw_manager_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct device *dev = &pdev->dev;
 	struct sdw_master_prop *prop;
-	struct sdw_bus_params *params;
 	struct amd_sdw_manager *amd_manager;
 	int ret;
 
@@ -1049,14 +1094,8 @@ static int amd_sdw_manager_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	params = &amd_manager->bus.params;
-
-	params->col = AMD_SDW_DEFAULT_COLUMNS;
-	params->row = AMD_SDW_DEFAULT_ROWS;
 	prop = &amd_manager->bus.prop;
-	prop->clk_freq = &amd_sdw_freq_tbl[0];
 	prop->mclk_freq = AMD_SDW_BUS_BASE_FREQ;
-	prop->max_clk_freq = AMD_SDW_DEFAULT_CLK_FREQ;
 
 	ret = sdw_bus_master_add(&amd_manager->bus, dev, dev->fwnode);
 	if (ret) {
@@ -1348,6 +1387,9 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
 			}
 		}
 		sdw_clear_slave_status(bus, SDW_UNATTACH_REQUEST_MASTER_RESET);
+		ret = amd_sdw_clk_init_ctrl(amd_manager);
+		if (ret)
+			return ret;
 		amd_init_sdw_manager(amd_manager);
 		amd_enable_sdw_interrupts(amd_manager);
 		ret = amd_enable_sdw_manager(amd_manager);
diff --git a/drivers/soundwire/amd_manager.h b/drivers/soundwire/amd_manager.h
index 6cc916b0c820..88cf8a426a0c 100644
--- a/drivers/soundwire/amd_manager.h
+++ b/drivers/soundwire/amd_manager.h
@@ -203,10 +203,6 @@
 #define AMD_SDW_DEVICE_STATE_D3				3
 #define ACP_PME_EN					0x0001400
 
-static u32 amd_sdw_freq_tbl[AMD_SDW_MAX_FREQ_NUM] = {
-	AMD_SDW_DEFAULT_CLK_FREQ,
-};
-
 struct sdw_manager_dp_reg {
 	u32 frame_fmt_reg;
 	u32 sample_int_reg;
-- 
2.45.2

