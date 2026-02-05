Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010007.outbound.protection.outlook.com [52.101.61.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992AD22339;
	Thu,  5 Feb 2026 16:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770309973; cv=fail; b=j5rUzTrD0ptpJL8j+cUDwamW/yp1sZHzXwEBBq457uYErryQgtM7VDUZfva1p2GuYrvt2kwfA4Pk2sQ452PiV2tD6VkClMAQIVafxQpMURb9wbvYUzMMG0kMESI6F8/A2fdnwgV2u3kizcKGR5+sw2E172pbaMmj3jlFPgmwXVg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770309973; c=relaxed/simple;
	bh=aLR5bxqVbDcOV6YWuW1zFfP75Ll/HqJXB53ht+pUbI8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gYkTziN5Oj6tSeBpPXXn1dogWkQytEFPuF2HpTeqg0roJj/tehqjiI4X6pXLBsa0USLQFs6+iQ8+2PkAdJRHOX/M4MZ44SXRy5MEDmCKrtAZ6JjTMUpCg6cxAdmhyFYIR4WIZeLFkepTKIQatosCg0hdQqPqmP93YyUOhgC3O7A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=tUD1azb8; arc=fail smtp.client-ip=52.101.61.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="tUD1azb8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=blJnDDcSAbWO8ZbX8FSDjuwl1YdG7CXvEVXIYQxEeptNEnn0uAKIEbtYNf95gHyWRx3MjNAcjo8S+jdHjWuMON29osTaswJUVpvxjIy6Fb9Xtrb8/rOuju7DgPAG5X+Zg/llzUodFnz/4oK/DGZFkujMj12R4N+Cot+TfRR0SSO9sEUi4kMqdBf7c/YdMeWo67/L5uKCTih8D4dOLRikUxDMXNFmvl9BqMhuN0jQhn6Z42kR3c47HI1ji7fNZ/cnUeFAx2G0CRzYk5iBIqqGoEPJ36JTZlBCF7vFGJbQ6XPa/kWa72E6GOPscA0xw4Ji8N4q0S7/kpETLsEqp7sw4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i9iPDOTCuvhm0fhy2mUCWaVYq1efaXSGAJejGzoRnt0=;
 b=PQw3lPG4SXPKUkERFCy/SzlgiNFNJhlm2CvMZINjUK28qZ8Tx3UWKVlLTnqvLgjmS0H6gLB3fEOnAQhb6stO90pFRcMtSGT5kqkB45cOpL4gi0ElV3BiDTsX43Mo/jQUegyiDm+8KinY3+mZe+sxxxzsSNUMKhp7g1rTKH4JTC692f9yhfNMAkT62UeqBFyOWFPzI+ORYpX4MuvM+UWfRmceByGx5dt7mUtSaqllrxAidTpjlZhjWtOQiXZcAy/Qjv1xmGIdsGU4uRH1omF8iA2jbyzcItTCamdTm6j8ulrfinGDIPC7iaf4CmJMzyFEovvya2U3OThhj9daXyk9EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i9iPDOTCuvhm0fhy2mUCWaVYq1efaXSGAJejGzoRnt0=;
 b=tUD1azb8UQsUfjRj61FFRfxTqbMpAReUhnC7Mjnj+0KB9fbFvM5fWlYf/0QKqIf7pwj+w6sY/k0pTQLX0Bal5haixMas4yqFF7LYMVeZ5i8uB/I8Z4h9U9PI/V9uvcISefe8zzqD/Vv/cUhnuv6KUQk/4NyGt2t6abWXC4I+o00=
Received: from DS7PR03CA0322.namprd03.prod.outlook.com (2603:10b6:8:2b::29) by
 CH2PR12MB9519.namprd12.prod.outlook.com (2603:10b6:610:27c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Thu, 5 Feb
 2026 16:45:59 +0000
Received: from CH3PEPF00000012.namprd21.prod.outlook.com
 (2603:10b6:8:2b:cafe::8) by DS7PR03CA0322.outlook.office365.com
 (2603:10b6:8:2b::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.15 via Frontend Transport; Thu,
 5 Feb 2026 16:45:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF00000012.mail.protection.outlook.com (10.167.244.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.0 via Frontend Transport; Thu, 5 Feb 2026 16:45:59 +0000
Received: from vijendar-linux.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 5 Feb
 2026 10:45:55 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Sunil-kumar.Dommati@amd.com>, <Mario.Limonciello@amd.com>,
	<venkataprasad.potturu@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V5 1/2] soundwire: amd: add clock init control function
Date: Thu, 5 Feb 2026 22:14:19 +0530
Message-ID: <20260205164539.892403-2-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260205164539.892403-1-Vijendar.Mukunda@amd.com>
References: <20260205164539.892403-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000012:EE_|CH2PR12MB9519:EE_
X-MS-Office365-Filtering-Correlation-Id: 31105351-93ba-4e0e-9d82-08de64d60a94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?97JzDs+hHM8ye4+MGt+cO48xYlPzqQq5veV+rP24JD3AeZadvwaCRBYiMGsp?=
 =?us-ascii?Q?L/U5KwSmh+vvZNMEfcjgO1Lg20iurnRbXixMn0sZ0gXts7iWFf7Ik3nB3Sm0?=
 =?us-ascii?Q?5HQqOQl00ToeExXYuJUJ/37LBK1BQQcaAPhgxAO0P3r9cwXm3YPt3IahGrRl?=
 =?us-ascii?Q?eOKv46lCRWDvv6J/gYN4KE/Yplk2WS+XdJSMspwjdREbLrxRJoLDFrNIDjs2?=
 =?us-ascii?Q?TXr1wl5KEV73G5eCH72JPAZP0olSzGcYiIymcNgKIDe0K+Pf0mANVAQlEXc2?=
 =?us-ascii?Q?25QdNYgz33HIHoiTX9eAhA4aCObLXp1wTRevH4Ksn5fMGc89Vx5nyY8qfpaK?=
 =?us-ascii?Q?RNMON+CffHUH5H/QpLa+aF64D1Z6FBNtd0dlv3IYUFORFFH773swYjO7QU4z?=
 =?us-ascii?Q?XFia/Akk2M8F2x3JDEHQ1g29FixzXMuPwj7kDdBI0mu79BYZ2PYBZIn397dY?=
 =?us-ascii?Q?KHQDuj9F2k3/+jxAyxsJwckcomyIzACzuu3s3D7IaFktbKh+y2YcsbkICPjI?=
 =?us-ascii?Q?6lWFcjxyR1zkzsdAuBAnKto7yOeb3sM80Q9Z5Q/0q136QUIajIlB0TDvFVZW?=
 =?us-ascii?Q?Tn7JIqFpzWzvi90dFtlOQW5vVrdahiw14UtYW5sk9LDMgey7MJAvdYRX8ZW8?=
 =?us-ascii?Q?NljWGS6MS19zOuIEWDPf0hrpLYt4vMCDlVorfxAp8S3vlD6/umEMVJib2giB?=
 =?us-ascii?Q?TcsIfFaBSovwm//BkxwPSSnprY5/vHh4YHn2vcMuvPsjNgUgtkb05MFNPpz7?=
 =?us-ascii?Q?9xKyRU+2FARcilL+vE70Nq0144pD2W+1WH/1JqbdhP0tOI91imsN0P92uqsQ?=
 =?us-ascii?Q?cgGneONnfcp6p4ZFJ+b78rmer5PdL5f/UkPWhZ/WIa2GloeMDWp66BEwsnIm?=
 =?us-ascii?Q?PBW395KFC4XHRNLe0qO+Ia81jjTMKV5vKRRfra4RhCjSQ0aZtp1EQx4U6DEj?=
 =?us-ascii?Q?xS27176+mJtuHHge2dEL/FBy7bVFRGpcDhjDJLVx9CzNXK+SM0WIha7CZyTn?=
 =?us-ascii?Q?VrE4DdBd9nFFGfzS6HRLY5yxwhu0/4hhZLv3KACGGnwAGRfrQl9oPrOXVlm+?=
 =?us-ascii?Q?rKcErJvh6Y73W2Dpx6A79HTF4vKEWBttX94N3butyEmEJZKw2pJn9ZL9s9Dq?=
 =?us-ascii?Q?65KXnxXOdTMz+eBh5MItwaD+djVQ73g1tOiX2mKxhNwPaxZ94Y5VkgyEh/MJ?=
 =?us-ascii?Q?1t03XtoYCvRm+RZg1Jyq+p/cXjNDy/ZbvSy5Vm2KBSO0Bwcrq+8tN9+q2m26?=
 =?us-ascii?Q?pG8wPLsxVr3LM1NGc+tPnF9oiN5c86Nu3UBXgR0M/g6mzcsRkXlLiFcsuTln?=
 =?us-ascii?Q?Cwa1dbHr7kB93PX178uw3LMWfiWfCEWFDt/SApc9hc5YmDMLwz2GPv29ZYlQ?=
 =?us-ascii?Q?KiSPKk3oOfu+NnbD3EEZ81BhzAVlalLVDLGj36Uud/iLLXMKSxcbYIFtZeDo?=
 =?us-ascii?Q?h4EoeaiUyxnlFB43J9yVsTVoFcar9hC+bNI5LpDdiyXJiJ+0JgUvfV5shZa7?=
 =?us-ascii?Q?zKIYUJ6oKnkna8vjg7WZ14mjyQdF8qqeIIFPyTwSD9S/8lroCbHVM+YZ12Qz?=
 =?us-ascii?Q?Fv9Y5rV2q1oiZvpH3RixKXKoKduTUJeHobEMxX7Wr6aEH+A7DYX2v7nJry/j?=
 =?us-ascii?Q?9bxEze6akxtx4dk4DVH2/Ys=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Am1o4LxF7Y3RTjKgL4NkRyPtzushGANmGAsaIyQpKGKYh08CFyq7IzRbQZizr49ItwXHHFtMZowKESdn6ns0LwXqu6d6n9PLBOxW2lUz9TRIfZGPaqiSVoZxQqTnfewWJFYbffOlDpJXbJJpvLC0mmNzRWojMkgp58xeGl6+KC14kralLvO9dKWO/EmenJhnjiD0snQIncYJuNYLX9XFrLeA9Li/YWgnNdgZVaPwaAfFeRiKAh56iN58aVVFT1twQ6z4rplZUUduG621A3TwqopadTqf5yqqlPBxOFN7J3qZY6L7+mg1NxIGjcIQsVp+Ugy3VFUjYpY/Wxy9CGkYr9eviIJqRauW6GxLLe+JfRrtWKb8mJsloDWxB/3jiWZa/nWBJ8Js5cOSD0TK45ohluUFHEZzFcX5wRfj0bCEuR2AGcjzChKYk7Ea2IcxQxfc
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 16:45:59.5936
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31105351-93ba-4e0e-9d82-08de64d60a94
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000012.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9519

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

