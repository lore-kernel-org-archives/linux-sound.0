Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011017.outbound.protection.outlook.com [40.107.208.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8AC304BDA;
	Mon, 22 Dec 2025 07:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766389761; cv=fail; b=XnbYcOfF68KcY8+OJsH8S6EncxW4G/1qLKDOvUtnXd0MOh2Bh9YweTtL4D7830xRMFTKMO7J6FUUGpfcCSZL9yBoTihUmInJ4Eq5kMzWihdwOBmAho1kXxk++fXQZa9qprIEe1QQFY2BmDSDsLv5BCvsistuKVBXZTItXlFg7tA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766389761; c=relaxed/simple;
	bh=DgBGLOaCo5sKZDkZYGrQmU/qwy0kzGCwc8Vm9q2dpxk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fgU0/entkciMyFJgRWu6gvqwtPNEGdip5A8pP14fdQUUiIFwVS5wSgY/XlEsngdAp8TRqSfq5UM+toDSAzvAY20VQZSRjmAuaEjkRlBYg893vxS3spuwrZ+ohyCE/cVyNXWzOYIH69fAfP/gy2cUAqOcH4C6LcxcBb5bw23XaL8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=HzWieKY9; arc=fail smtp.client-ip=40.107.208.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="HzWieKY9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sTglORLxk9ksL0qKtr+XHsUyqv1G9immKwGEZsWllVi7VLRXDPhO0BZJJ4Q78QtY1abqjQw7nu71wHO69a+ahV7muO34mJl77VxCVbvLVQHf57t+jwIyS+yNrM+2R6VqRjCkYBUDXKABdDwYJb8rWmLGJxKIUHDjesu5SjejO9/ZHiu1cI4tcJuixMo27qxufXBProa/aYNO/+kI5K1DysPJtML1E41GGGuVX/mHPm32uHubwOOHk+jTzmLtmyv+VKwdRemj9eLQ+3MBp/UWtkBj8Il2gmirxbkCC7tkLIBpK+TwBObqiBRUS2FH9AKi5m4kRhJbFSKd2yI3aC3UOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RdP+0x0qT0nySSuVefqSWkq1UAG+OEzdbkMsG4gq9Yo=;
 b=dnxA3+kX4EAw4+7QOQ6li221IyJRNPSo19R9RES81I0BSuWoyqrYs5Ljv7yfyO2YHzijkmy8FiXyO+1+iRdwveAkhtD4bK1TYGSbzD4NKrYtwT9fFHU/52uog99JxY+eDVyvdToulCkUrz4yPoj1ybV3TROm2yDq0L4GNE6IWUxAlW/y/mTf24rYXukX4j7PuyzNA1jf8StnofiQOBI1P6W3oSN+DCrYa01Qz/dFulQPfeRnFEXK+2ciE7UOrhr7WnlCmZPT6lxtYofmvP1S2qLDPDi9CzpPk0uiwc+tOH1mwsZ8Ma+03qKummuQDB6yHrDblXpFl5OZjHljJtZl7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RdP+0x0qT0nySSuVefqSWkq1UAG+OEzdbkMsG4gq9Yo=;
 b=HzWieKY9whx0KlxEYhnZwhQAr9JkNuFmksnMMAYMVR6xGvU1N7jEmSww/Kl9OkxbOawYryCbFr3gdQT4DQFY/lcfw2l+sq8SUNdxACx9zsnvwTyJ6yS0l55UsqsMCzMeDLLEoGhreLdcPlDuD28pL43tqldVLlr8KDTxGTt8wBc=
Received: from DS7PR03CA0068.namprd03.prod.outlook.com (2603:10b6:5:3bb::13)
 by MN0PR12MB5761.namprd12.prod.outlook.com (2603:10b6:208:374::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.13; Mon, 22 Dec
 2025 07:49:16 +0000
Received: from CY4PEPF0000FCC2.namprd03.prod.outlook.com
 (2603:10b6:5:3bb:cafe::7d) by DS7PR03CA0068.outlook.office365.com
 (2603:10b6:5:3bb::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.11 via Frontend Transport; Mon,
 22 Dec 2025 07:49:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000FCC2.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9456.9 via Frontend Transport; Mon, 22 Dec 2025 07:49:15 +0000
Received: from vijendar-linux.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 22 Dec
 2025 01:49:07 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Sunil-kumar.Dommati@amd.com>, <Mario.Limonciello@amd.com>,
	<venkataprasad.potturu@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 1/2] soundwire: amd: add clock init control function
Date: Mon, 22 Dec 2025 13:18:12 +0530
Message-ID: <20251222074847.7270-2-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251222074847.7270-1-Vijendar.Mukunda@amd.com>
References: <20251222074847.7270-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC2:EE_|MN0PR12MB5761:EE_
X-MS-Office365-Filtering-Correlation-Id: e3dd1023-58bc-4c77-72a5-08de412e9b0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/dABamd5k63otbaWIAiDFuxOHIwi95/qpuNHWhkry3TfTd356JuLDBEvptr7?=
 =?us-ascii?Q?ev1Z4jnYgBNEbZmMlhzSIE+QHw/JHOHI/iMhHmKrkbsMNuqBdAZuliMzc5Zd?=
 =?us-ascii?Q?eFXoW0b6TLvLpx763DYzdL/bTcElr2cAbfahhwVThu2ZFwT8B7VXjmHhMnxk?=
 =?us-ascii?Q?suJAy/5sBbFMqz3jdIJIZ12VQbvms25NJ+Gnsvt1XhQSgKfP71m753i9ZEoq?=
 =?us-ascii?Q?Y5gAQY6koLS1LP+gd9kpp2kgawzh2dcyftn4msNVTYHDBdmbylyNWARw5EZA?=
 =?us-ascii?Q?WOUHC2F76rwBhfHJeMIcKm2+xcTgaqiSU6LCXgIV/v9PQAJ0/r06ZhSWfF+S?=
 =?us-ascii?Q?R0PJToI9hOKbGTJjBNBkAISKo3WB6LYJVJVFnz0rHUDPZb9bS8YUr1KUZNhK?=
 =?us-ascii?Q?v5jT7i2semvgodXe2Acx5dyZn1T5GSCD8ZBy9lFV84eZuzj3N5KcImPg6rod?=
 =?us-ascii?Q?W/bK19A70om67BfS0WjRYONhYNn3I5g3uV+2gf5orM7Owjzb/RmhyCfrv/tC?=
 =?us-ascii?Q?lHRqSUcJPO+NflWzwxr/su40oqnkkCkANW5jaZcF1gYlqSgn53v5FbAB+/zU?=
 =?us-ascii?Q?0Wrefk29NwpdqIb7HuAbtcmj6a3eK74VlM4yDfEohL4HbM3MtuGHoBRAGIVu?=
 =?us-ascii?Q?f9RMwNdlbWzUQwbzwtiriMDgorEnqamcaq5OE39fMazYF1emOeYtkJurMvDH?=
 =?us-ascii?Q?Fgc0MQ5DcsWUaq0Aj5Z7b9oe+3qREWzYN9fPToL2EjUsyK5ePg7zmIozKTCN?=
 =?us-ascii?Q?Dwxkqzk2UVGvftIWUegVWO3tWjfH2mgKa8zuK78InSW/8Ns+pEpa+RPnk2NZ?=
 =?us-ascii?Q?xim4T1fPcY3NqH5LJ5/51vA8as8Df0Uwpg1tpPIAolx/eh/vbXMPzTElhOTU?=
 =?us-ascii?Q?WnbBe58rIGgvOU4BD/oDI2oPiWGJkYpu+DlGnw4iostgtZQepGaeNTHYQXtR?=
 =?us-ascii?Q?gLty4tzvlg6oQv+eC9ydF+x/0QzxmzgWA7jJdQkRd8GAREy2NlUWbB/15yNF?=
 =?us-ascii?Q?Zyt3UROhBJsudK0PPDB/gCgMFlzxcIvtduT27VBtQCNIqS8PGTYfSyTa1U4s?=
 =?us-ascii?Q?EOPIp0WNlSJO6iAIXWIik1bfLL3h7tXQHPWFQGoDC0PVdUniqyU4emB3KJlK?=
 =?us-ascii?Q?yuIhIdtfPgM5eIOu4MlYnauP2JggdJAojCk3rpQD0ERIAo8QVDK8v8mx+I2S?=
 =?us-ascii?Q?3jhB5u8qGQrRMb0dpsZkQu28Xtly648qG39YcFWYEe+CsgUYKzsB2iK60Q3f?=
 =?us-ascii?Q?rXbc7cfayewlNtRzFW5lOg/W0E0HVrBUduxv8u0zQT1HAmqLcxlBquV8Ny8S?=
 =?us-ascii?Q?v2I/U55kB9IjUWCP9+ODcYI5B32grKLlL5TzhaEjY78QoBwAgdxEIVU4t0Ed?=
 =?us-ascii?Q?TQyZSfcdozqEiSTlMFSGRJSdmHLyxw6TtecAOUKGn89hYo1DT9o3u8lWjGSY?=
 =?us-ascii?Q?GBqW6R2VrzAZGr67nRRv78+wwZK1cIZla1AAEt3QWvoo+f/VOTuMZg077q2D?=
 =?us-ascii?Q?u7Cwq0KXPUpvq3Zic7srBFtMXpqEPHUXWD3k5YIVD6kRPplPIEvhxtVe54CS?=
 =?us-ascii?Q?jhIYFXjFDAaIIa7tR1o=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 07:49:15.7903
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3dd1023-58bc-4c77-72a5-08de412e9b0c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5761

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

