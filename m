Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012025.outbound.protection.outlook.com [40.107.209.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FD722D78A;
	Fri, 23 Jan 2026 11:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769166782; cv=fail; b=oCAJAscepaolslrA+a1ZUkwWCbtb7uvAYHt1ettJlZpQxFU34kbA+Qre3njfGoM9/4RSpTKXToT/xMC4AfjBbkUf9GxBrkYN4ZZc+fw23s4+Cm4OqG30PmB+zZkq/LGUriD4befNYzzNt4doHJDtz30mQkeWJAi7CBUDMa/GBug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769166782; c=relaxed/simple;
	bh=DgBGLOaCo5sKZDkZYGrQmU/qwy0kzGCwc8Vm9q2dpxk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qCmQPvAL+5iksz4DpsjfZx97A9K0jvMYswMRghN0eIdrxkujaLbO8t2EHjdcT/6ZzUr2m/Fpm/MAsUhi2XYl8/vjl1mN6JfLVKkCXBMKfF0rPmxTO3ygueWOfvD5xIfwWYYbWKlfVjI6wZlfBBL8L09MGq91shvfwEwWy2DlD4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=LSw8AvpG; arc=fail smtp.client-ip=40.107.209.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="LSw8AvpG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qiV/xK6Ev4FdlsePEuhGXAN0b600TAO3KzNq1ngEIMBrIvU4eCE46vaTof02rpYopCx4F5AljB4gcBsiVxNulgiPB3QCsiWmiIpxYuC1+BN+wLVF30rHJDZ3hEgPLWuaoeoTmP/DK+vskqrQIj4a02oYr0KKBl/fY2pAq/v7mL1Nza/CIkz9KXsTaWrbqgoLuA8AtjRRS+9wlPvaDnCtkjv68vni8qTGh/4RIbxkUl3FGqDjalqfaYsHCWTmQYoexMt3FO8uP2Dx+ZnJzjWx26Dg9arYousDtRgoV4+OWV6OD7e+kZnY+tV9TRfu0g4Zuu4EYGu/k3xv6nXh52VrIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RdP+0x0qT0nySSuVefqSWkq1UAG+OEzdbkMsG4gq9Yo=;
 b=wb3JW1fq5zluPCZvG0HD10yZgSJEqcgb/wROZq0fPsSy6lEhr4Vw7EJMEACyi7GRbfQMPwlOKGxQTvhBJcAkubqrFSPqhheTrx0LdJDgyj2AccnOIdUj1RYrYpwO/Ff4upt5TT0/J0WsFWdgK3iLtrAtfw4elCT4pR5fErv77N9BAXdsOzDmCZQ9H5Dw1eKZa3Vl1VXEN2Gi9Gnht3V4JO8FjafAUC+y+ysTjb3kch+c+qK1QsbMvxgjn6FXncA5DwV7fxwxyptGsuQUJs6SwNq1BOysrDVEdfHPJ9dMVEP/yYZIhCPwrH+z3fM1UlC5uoT7pNwk0MZDHgB2j944iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RdP+0x0qT0nySSuVefqSWkq1UAG+OEzdbkMsG4gq9Yo=;
 b=LSw8AvpGabqeXKgo0crbe5WF3Ia9tqqnVlVOs296tSlym3siuvZRMSpnm6CoWv1Ax52n7jHCneRp1NldFT5+IJCiHabWGahEiah/mMfodWkrtfnyKAimrsECgy1Xp3fSZ3o+GRjZBGYeexvKA20dsulUwfrOFTqQq6NIH90qKDk=
Received: from BN0PR03CA0030.namprd03.prod.outlook.com (2603:10b6:408:e6::35)
 by IA0PR12MB7697.namprd12.prod.outlook.com (2603:10b6:208:433::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Fri, 23 Jan
 2026 11:12:52 +0000
Received: from BN3PEPF0000B073.namprd04.prod.outlook.com
 (2603:10b6:408:e6:cafe::eb) by BN0PR03CA0030.outlook.office365.com
 (2603:10b6:408:e6::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Fri,
 23 Jan 2026 11:12:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B073.mail.protection.outlook.com (10.167.243.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 11:12:52 +0000
Received: from vijendar-linux.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 23 Jan
 2026 05:12:48 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Sunil-kumar.Dommati@amd.com>, <Mario.Limonciello@amd.com>,
	<venkataprasad.potturu@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V3 1/2] soundwire: amd: add clock init control function
Date: Fri, 23 Jan 2026 16:41:31 +0530
Message-ID: <20260123111233.3649153-2-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260123111233.3649153-1-Vijendar.Mukunda@amd.com>
References: <20260123111233.3649153-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B073:EE_|IA0PR12MB7697:EE_
X-MS-Office365-Filtering-Correlation-Id: ecbf723e-e22b-47c1-842e-08de5a7059cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?p483BDFAOg+1vUsjhPGXSFgEdsMB7jSi1Uua2IcNWlkHkcr8gdVrFA5Mhqu6?=
 =?us-ascii?Q?3uSUxuv79l7DRcg+5QjDhVWPhhL1DigspKC8CSj0vwi2qPOKOWlgEtAKXvGh?=
 =?us-ascii?Q?cKLBjI3ebhlskkmFNBUThsp9jJHUDdW1HvK7h2Y+8GJjfLbHuGSuHc/mRW1U?=
 =?us-ascii?Q?0pvF0+23jJB92GScDZmiHGwFNt+OUqjb8GZGGjL27EJlmesy8Q7TH7YrjaUk?=
 =?us-ascii?Q?0vbd+YSZltCrA9WIPZUxA/rH/KtDygVwfINNGF6IfNqRxWBD0GsHSrDhKRDE?=
 =?us-ascii?Q?2AbibgoC0REx4X5K17MPGpgiLTBcF9eprM2fgtov4jt8l7xti9hLam7loi29?=
 =?us-ascii?Q?EHtiqPDFA5FJX8D8u8+Cbi+xVefTa0DKzpcM477WPwLg7tM1kda2Bp6hSGOP?=
 =?us-ascii?Q?K4ewGOUAgvoiE9NYhd7b8XkBerVqIlLhwJfI33OT94nbJ2uMRg4UVvYhzjPC?=
 =?us-ascii?Q?hWZJ9QEO1EQzCmAI04wy/BURhEwEkwsJvpl8F/RER6mpiC9dLgRPkz9iOhJh?=
 =?us-ascii?Q?qFrHIm3JCoFjPYisAgtyWceZALo2U2iXW13S/7PeY4HeWWUaDEp9cHOV3/TV?=
 =?us-ascii?Q?hPARv71Y8/ywko04cRB/yIn2aPPrbMN4hdToSYorQJkYS/rk1r2zr6nfGMPY?=
 =?us-ascii?Q?cpVtLFJZHS6PHNfkOgFt4v3cZoEvESXfOBP07NhmIz7H1AhroEmLxz10Nnzg?=
 =?us-ascii?Q?xYfJUSzPCx2nVat1d8LO5cCQMVrrHf+Y9P10v5LTogPFXsm7mEFcbYa2y5of?=
 =?us-ascii?Q?5pSkGxxvcwVR+Y3Wov+/QocqsM8mewXRM07uzTbhFulfpnJ/i6brftReY0r9?=
 =?us-ascii?Q?gDTnMp+d9W8l/2yhwhWPFOgW7oO1p+s9s7jR0gzRAfFzXozQtq/3vtrx4ZUM?=
 =?us-ascii?Q?75X+GDWeWxY9OZ/g4sPdLGlW3ixmKqVJa413QwGMvIFszAjB1cvOxn5NhWBl?=
 =?us-ascii?Q?Re8LNrX/Ejd1r5VHvY/IrhCDlllKM+0mNNMFuQg3RLYqqYvCG9FI1zM/98pU?=
 =?us-ascii?Q?4U6JlNeO5ksdtDN9kIaZkCUR2zM79fTCuzNveyL8mgjkB1gBRQwUbM8TuTIU?=
 =?us-ascii?Q?TUbaddfS7c+eHlUqHTno2GM25palbH63vPm6lrNs97/moudY6rfTO/fNDdN/?=
 =?us-ascii?Q?wFXY9gPpbLB5mwxr6lPzTDATRmWh750F9gkl0z5mapI4EP0WU0aclSlxiEsF?=
 =?us-ascii?Q?A0VF4O5KfZ9s1JWGjmVp9QHJ/fN5dhxx1d7uO4Va0SdYi4uQ7ktd9mIi5K2Z?=
 =?us-ascii?Q?yj2dhrTV+nRnMeGWssA2a0G9NL7K6FFaZ5rP/ya55chtoHgQm6eymtVqwl8t?=
 =?us-ascii?Q?re4HmKR1/YdhvaMXjgjSqNGvVgarkPfoAjkHX9dBWMmcWFAfDaOOTxce5t1z?=
 =?us-ascii?Q?NGwtG8XWZwCsAGbklvDJfXhotkuW2+pTOlBu3fM12BWClIp6lAVfbyvA+Xvr?=
 =?us-ascii?Q?wotTC5E2C03IYJt7xgb/aMcP6pmgt+MvvOrtBantou61a8A9bzoXWfdQaHaW?=
 =?us-ascii?Q?g1WR5A6FHxSAAMsMc8gSSLheaQfBgLXBAkA05cHdju0G/3+qRcj3/JQ2IEjS?=
 =?us-ascii?Q?neOfKJUYH7p5LA471PUweNy6EtBeW9MSlS2NnnhU6/Me7fkOZ7rDAkBwayP3?=
 =?us-ascii?Q?iBYrc3F7MJMfu0MYVu9VXffDs11gBvmxbRhxq57D4uVO?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 11:12:52.2367
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ecbf723e-e22b-47c1-842e-08de5a7059cf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B073.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7697

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

