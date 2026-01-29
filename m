Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012004.outbound.protection.outlook.com [40.107.200.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8E11ADFE4;
	Thu, 29 Jan 2026 06:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769667341; cv=fail; b=InuPwX9tgY2z+/j71DWaYOqTsrmGcaboc7cneJSHIx8akOx9Mctln7SHfM6DmAcEjjAFI8OgMYDVQ9F6kL7+XU/nm768sIUcP56x9bJX/LjA+YkC2//5zG3gacnpmCxp00gPB44asjzZSesITmXblEvgS8eAB9gH+UqxIYsnVhA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769667341; c=relaxed/simple;
	bh=aLR5bxqVbDcOV6YWuW1zFfP75Ll/HqJXB53ht+pUbI8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aPbyMi4QhP+xlKp0zK+WR4zZM8Pij3urJ9I3TeXGNibxpLWJt6CqpUtdy703arDBIk0mEEBlg489rJ7W4yJYjnVieyI2dy4Hm/CMrgyysA5OyI16o3yb8t56XSro+EzP64Mpwb04R6h/kgHg1I443+9ScpZ+b/0xPFh1kEUfJzg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jX7YCf+a; arc=fail smtp.client-ip=40.107.200.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jX7YCf+a"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hd7ZFjKNMefHpK0vsXTFnfB5ZINXd/b4DdtoDwYe75tLPsd6OepC5BuRWOMTYQIigHL3PhsBYnbvX5csVuCoq/ROab+4AKpR0DSXc2z56IFNp+Rkj9+oy3nVHh/WVYfEyQnFYs7Cln6jv2VOH6arVJIPIIFy3oAEvVYBlha5gRuqbi1zo+b/VKOfN2/+MpIBrpZ3Lj9KYGQIrg/8NSQZAq7Sv9o0aEo2F0QAc71AInw5d36iFSiXm/KzOSce9qNH5JllSvrDRvqfuUtNl/qEDTXDawzr1LuHoYPpmEt4xBQG1AJu0jZYvlwwrvsfvftQSYQspTVlWNU74UnAsrI7jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i9iPDOTCuvhm0fhy2mUCWaVYq1efaXSGAJejGzoRnt0=;
 b=SLmNTeF6/lef5sn6JzVazP4iIRrQPuFO9KpSrM8JU4XWJN57BP4kJ0uoecbjPezy/R6GDOo5gmlHlcXI0aOCiOtbLQxoU4R7vUrqC858x5YMI+6ks7GU/r81M51QwhVEzZYlIGgHdFvF/FGyzyW16/wXLiy+YZAHrDh54w7R0MSUclVbSL71kBAcbHRenEVFbY15XHd6EBUhz+BCgpJ9SYbDbj60/roOwXIjgjZPojerbRxmlfwb81OSj863RhfaeiTavXTXwzvccoN8TRjUaDQOgpvDhZAPSy8o+sbORBOuhPX836eQXEv9Lkc3dpjcHJBBxBUnE4BXzqmX8mCgNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i9iPDOTCuvhm0fhy2mUCWaVYq1efaXSGAJejGzoRnt0=;
 b=jX7YCf+ayoYvIUaa+lKq0J8OXR9eS8DWvHTXxPVMvnJeHAme3kSN4rSN8Dl6Cu/nWx4yn5WNxaS/lYBK/YNlPPljQo7HS1NHaorOdD3VGsQPasniS+lblGonge5aFGtoU69ZQMWo/Lxlj4xCA7MQMU51aPlZahhdWEGN+q7zWWM=
Received: from BN9PR03CA0910.namprd03.prod.outlook.com (2603:10b6:408:107::15)
 by DS2PR12MB9749.namprd12.prod.outlook.com (2603:10b6:8:2b9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Thu, 29 Jan
 2026 06:15:35 +0000
Received: from BN3PEPF0000B074.namprd04.prod.outlook.com
 (2603:10b6:408:107:cafe::6c) by BN9PR03CA0910.outlook.office365.com
 (2603:10b6:408:107::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.8 via Frontend Transport; Thu,
 29 Jan 2026 06:15:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B074.mail.protection.outlook.com (10.167.243.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 29 Jan 2026 06:15:35 +0000
Received: from vijendar-linux.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 29 Jan
 2026 00:15:32 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Sunil-kumar.Dommati@amd.com>, <Mario.Limonciello@amd.com>,
	<venkataprasad.potturu@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v4 1/2] soundwire: amd: add clock init control function
Date: Thu, 29 Jan 2026 11:44:11 +0530
Message-ID: <20260129061517.38985-2-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260129061517.38985-1-Vijendar.Mukunda@amd.com>
References: <20260129061517.38985-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B074:EE_|DS2PR12MB9749:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c3845de-9864-4d34-ffac-08de5efdd0b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZfqSLE6yMTqUWRt63VBNQsDFVByRNsMMnni+jGBMDZbfkqfX5WgJCzSP/e5E?=
 =?us-ascii?Q?l5w67r7JHcFxgNi/esPX62tgEVIy4L8aYuLWcdPPBH3wLScH9yY5m8dP9Ck7?=
 =?us-ascii?Q?+vdSD4R5XfxbSjI9JJo+H9vpI+1+/b3CIbsEcASSjxpYZPmuzkKwrOipS2hl?=
 =?us-ascii?Q?8cNPquspgWJrF8nCdAdumD9Cu5/86c7liD55pz2fhi07SIkdMITyAjZ0czje?=
 =?us-ascii?Q?SVPAcvEfWgfeguA6/mtYpSUSkUMi36jiTFX6iOVN62zn024M6gRfQlZVwsfg?=
 =?us-ascii?Q?sQ+ms1/iNmEPKfNLOd3/syTyQ6L3lwvrJTEurGGxlGKaci6AM4kzMX+FmFt3?=
 =?us-ascii?Q?CNap+X3GgDmK2SM00RD55sbgFPaaGYLk3GLurRtXY2Vvyrc/hfNl8Ndqkeag?=
 =?us-ascii?Q?CZ8KCgp7AB2JUPTrxJ0bxouTYLifW/BgNPnOC0rkFUA911an12NNIidxyJ1R?=
 =?us-ascii?Q?2LMIO71C5PfDgfzWAWU63bpkOJfn2iefdrPx7haQMP5qcJe4F0sLl5TMpNzq?=
 =?us-ascii?Q?JICgh7J2M327iP8VI5/YiUsMrHcBaZItkakpRtU1lhmf3kz1RVWR33i/nPuy?=
 =?us-ascii?Q?2LT3VrRY8Rwb8oCrZlTtcmf3yqoArcgjWR5xUiG2Um6uiRlvScSDxAjVG2+I?=
 =?us-ascii?Q?kIT7Qd16fzHSaZyz3nbi+D7mX1jwdUSH0Pjaku+j9MR3o85sBYG+UVgviLrP?=
 =?us-ascii?Q?B1hGmteaAaTH7ZOmj/zpwWB3moGoyPUyEpmXd0Zu/+Nw94mYrEt2oU3tgcH2?=
 =?us-ascii?Q?efxmxn2UwfGH8WgBvWlULYQXaRje3LU0FhP7IVr7TFl4RqqaLwdpwWS6FQlT?=
 =?us-ascii?Q?VOcICkwAp9/uJ7gxr0yd/BZe47Lz31ckizlTq55QPvviogy72r6xs8qATllr?=
 =?us-ascii?Q?70/5WQrbyYzXaD3i6Z//v9A+9CRg/eyXzwWGtz//pNi9BToFcAaNgbVPMgDE?=
 =?us-ascii?Q?Us4aZxAXxK9xjbg3oWRJDP26YuMQxi1zSOy5SEJIHB6SHGm8cAyhO96Qsu9P?=
 =?us-ascii?Q?u/sSyZdfWA/tSFoKOikSMEz/PxWqQIGdKeHc+O5/TjRmaYAKk7wLKid0PR/C?=
 =?us-ascii?Q?X7ar9oN734X+z1/VUsw2eHTFfhcXQviCDEaicpWjC3N5DHc9q4UHWp1rmDAu?=
 =?us-ascii?Q?xBujxlGNQ5M+eDcrWG5fAjn5Phpc+HjgBEZ7yNkUVk2sDWBuS0zemUr9Sc1P?=
 =?us-ascii?Q?xzPHRXsRqsySLxCuFPz96kan9je5G9PumrYYNCJ/LxyiUeXr3ny2sF0P4JAU?=
 =?us-ascii?Q?E4Wq78k742MhCmjhuSYi/kbNGU6y8u9qknhKAf7tOqohry5ivA+1+d3aPEry?=
 =?us-ascii?Q?0B+BIEmSwDH1npI+8o+HsncnctAiRu506dIxT5LIYATfe9FvET5P6f2O12b4?=
 =?us-ascii?Q?MZuvGb31ZP/v1eKAs5Eh5uYjfsV/ZqDuqL3VdEXZ7GBAMKQDh/ACnp9OjATx?=
 =?us-ascii?Q?CNedmNQvP5O0oY8pMurpu5k3zEYdAP0PbbEzJHpfSJP7Mlw0nrlTOr5mh3ak?=
 =?us-ascii?Q?+dFdqdP+nayzX7jZdbkRSsKy4//kdB2QpWbXujbVLALUfd6YSaPQ5RzzhlCu?=
 =?us-ascii?Q?JGt6f5w8Kd13NyI/mfYQKJIsLtRJX3mv3hREtbE3tVrepJDNw+1KJlHsex23?=
 =?us-ascii?Q?2JAKYr6Jba1y+dZdHJMgDMhFsj0L3C9q1KwtKm6eqFN+tweHsyUUlWGvUEBt?=
 =?us-ascii?Q?rfmdmg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 06:15:35.3344
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c3845de-9864-4d34-ffac-08de5efdd0b6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B074.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9749

Add generic SoundWire clock initialization sequence to support
different SoundWire bus clock frequencies for ACP6.3/7.0/7.1/7.2
platforms and remove hard coding initializations for 12Mhz bus
clock frequency.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 52 ++++++++++++++++++++++++++++-----
 drivers/soundwire/amd_manager.h |  4 ---
 2 files changed, 45 insertions(+), 11 deletions(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 5fd311ee4107..b53f781e4e74 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -27,6 +27,45 @@
 
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
+	return 0;
+}
+
 static int amd_init_sdw_manager(struct amd_sdw_manager *amd_manager)
 {
 	u32 val;
@@ -961,6 +1000,9 @@ int amd_sdw_manager_start(struct amd_sdw_manager *amd_manager)
 
 	prop = &amd_manager->bus.prop;
 	if (!prop->hw_disabled) {
+		ret = amd_sdw_clk_init_ctrl(amd_manager);
+		if (ret)
+			return ret;
 		ret = amd_init_sdw_manager(amd_manager);
 		if (ret)
 			return ret;
@@ -985,7 +1027,6 @@ static int amd_sdw_manager_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct device *dev = &pdev->dev;
 	struct sdw_master_prop *prop;
-	struct sdw_bus_params *params;
 	struct amd_sdw_manager *amd_manager;
 	int ret;
 
@@ -1049,14 +1090,8 @@ static int amd_sdw_manager_probe(struct platform_device *pdev)
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
@@ -1348,6 +1383,9 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
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

