Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012007.outbound.protection.outlook.com [52.101.48.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DA438BF94;
	Thu, 26 Feb 2026 06:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772089020; cv=fail; b=NsyrlaSVgedCv6iRb5kWNRgNpPKVh/BKVAc/MSNNZoBCp5yfGTtgHWuh+CJyHBCznTajizovcr6T0+9Q7yhJdmTZt+nkJ9vrFdMw0wfH6Q/Q+1q/mQFu/zwLmNmmuYsPk3H1gPoNLqc9azuyWcwaQw4BqNRUv/c0iQK2UMDooUs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772089020; c=relaxed/simple;
	bh=e49kd4q7mdDz4JEvYWGCnkpRBoCCPmZljLMrVoodJss=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NZlmbrQmb7BNVkAOKtEU0KWoChWdW+jQvIHYFXlNjStUYDqz9NxKh/zLInXY2QRka1JZH/OofQpht5ggtcUXIKK1GKTAZ1aCCxKlzSh0Iwbt5kw43dtwbi3qFGLCmnHnczUt+FZAufTzX77heUuhxVhiFor0XsANwAhkQfTLZXY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=EQ3D0Etx; arc=fail smtp.client-ip=52.101.48.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="EQ3D0Etx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WhRCBIZ5GZ+9BLyz0K0DX2niHfpF97OOzBf0EAZa8sK6Zyqb0744gHkFWq8D1Bf1sdaRpKkSLU1ZEiWO67e6AOcj7awJsz2lH/savvCriQXF8XSmVysuGz1K1qlLrBuIXlpKaX2bMIIkAQfZlpO9BLxCe11YRXMklev5PP4gVL9GfH+2IA+Hhm+iwnoYsucyHc9Xh3EQP8hIG/SPSZnPTiISIlbIa/Bq26RsX9o91997ZSPflfxGHHGGKo8dPp/DyTrAa7jezUKnYvhpQVX4OV5H7XX0Vp5AhurpPkUMjOdv9rO3J59a4kP5yBGCez4RHi0m/M71LY781PXJsDgIBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nD/Xrb6+x1w7j8ERxB3qP+k5DkNDxWCVTQERpk3DS/s=;
 b=SkNuuodEtH50DsDDi+LcgFcdPPP9HPJpgIfkTL4iRTrrskdE2ZvI+Vaqy+OMP8OMRA0v2a9B/ZxX43eBGVNUJArxiSYXBmhSh51JNNZ9U1q2jzGzvKiw0NK7UEraQGzga5sBUwSA1x8i1Fodt0GCDBsNgwQg9jwWBike0D2hmiWAB8cXZBo2jUZ55oYurMtdp1M7+TTNKgIl+O2E283Pr/qYUKZTvK+uOGrJqOLXsZe16GKXs1LkLp8Dal/+gKKafm/xFh+I5/3nrMfm/vZJ3l7F46Kh7H+ca89zYy+/qgrQKPe0IwBk/qY3DJR0DIBYGi/Ux1m+xMSTMmLAcEI6ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nD/Xrb6+x1w7j8ERxB3qP+k5DkNDxWCVTQERpk3DS/s=;
 b=EQ3D0Etxi6okkzzLd0DChB2tiA2PNOuL+tO641DGuYdxFQcKFn+UgJycXRml8YXRXnt30px6SyuE1JRKWiwGVKeOxAy6jBHGEmiCXU6hTr5tw2r2k6DhuGHD//Lh6foRw8dsep612Vq+WBlKM0KqAK9kOf7OPkZ7TTS5eGerOyE=
Received: from BN9P222CA0008.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::13)
 by DM6PR12MB4156.namprd12.prod.outlook.com (2603:10b6:5:218::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 06:56:55 +0000
Received: from BN2PEPF000055DB.namprd21.prod.outlook.com
 (2603:10b6:408:10c:cafe::62) by BN9P222CA0008.outlook.office365.com
 (2603:10b6:408:10c::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.26 via Frontend Transport; Thu,
 26 Feb 2026 06:56:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055DB.mail.protection.outlook.com (10.167.245.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.0 via Frontend Transport; Thu, 26 Feb 2026 06:56:55 +0000
Received: from vijendar-linux.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 26 Feb
 2026 00:56:52 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Sunil-kumar.Dommati@amd.com>, <Mario.Limonciello@amd.com>,
	<venkataprasad.potturu@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V6 1/2] soundwire: amd: add clock init control function
Date: Thu, 26 Feb 2026 12:25:53 +0530
Message-ID: <20260226065638.1251771-2-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260226065638.1251771-1-Vijendar.Mukunda@amd.com>
References: <20260226065638.1251771-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DB:EE_|DM6PR12MB4156:EE_
X-MS-Office365-Filtering-Correlation-Id: 52d66adb-9393-4446-9f2b-08de75043a52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	20RvRhlmcpkvr36BNkTAIkwMQnWS2XAgFau4FhDaJvjrVaoK+efXtc94VizB5ZFS/Mfr+kRRMPk50pMQ32vOMfvW3OtqK1cvcjwTRDgZiCQR9Vx2qqsdnrDYPSgmwx2TRm2eKxcO/7unzTfwVcD7sUHI7uKdzMTqPKx39qMe9Y+0lfAYNkqDsFtBoM/pudHOuP+m+Fax8pvF+DOPT8Rj88xhpHnn+c603DzMy9/RPjx1T8B8SWZAexQYtsPL3uesMp8yf6TyD4UiomQj4Iti0rdV0xxWLdNDxhv3C36tW5kiEpAg8ixMOFmkDTKQqSSGVekx7SQnGDPkIFP8thMFiMeKVHHlkBsxvhwbHOgMK8IzxEUk6w9JGu5+rEt8wt6EgH2vL9tFEAbFF34oeFxjtI12YX7DqE9L65TPREhn8B8aGmhBjVWbxTlW6dQaRCMvplGwpAda8sxjL7vfNiVx+xwEoaF1TyvlNypqY7a5CEmD0VEiOWw3/dsgzsnjvkXknIkfMmYArqZ0WuSb9+yOD6hGR9n/Jz+5TInBkNXDXC4O4f12qCzQunx9Xjs3989mq4fZ0Ipn3jo5YMOJvOUCu3tekFpE/P6O5na43vUxxMkl45S9KWIXrFxPtfnJRoDEJlbYThricqaFiwPkG8wl3XrsrPWCB15M6ILS/FMXfpnB7SX0+kovlHvAm6AmP9ronpk5ArI8MWaSo8k9BY0/alXcsnlw/g7S4Pqnnhu8+mzletUIHyS3rUT/nUo/ltDjUlEVr7c8xm1CjcdMzhPpuzAeAS0uIik4+XLHbWh8uHZJkFfUQiRi4j/4tArsrxD7dXE3JTHU9mETSPD7T2zE9w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EKKDRgIqmPG5n4f5G9wNI9GWROTzBW3gJ7BDWPTlIyXotvW8aAwvk4DyN1bnq/JKegBPZj/17xs8A9KYLpwtCAYqcCszSJDEwF0weakcAtcFNTDbtJcOXFhgJ9XqSNy6DbYigB0AxDyzrj7tFXrye7Xlbpdx4nToOCCYxy9KPPA9UJFdMLFMF6drYE2bpgUFQWwspjcl+N59A1wOWoZDqi4cVekX3iK0QUm9YAo3LTNIqKA+Sp0hDSZ7w7PqmGhm9TcmLfgkLXxp2KzU38metjSgjnxLkTkZ58Dn79dGUcY1c1V+xCDqqSD9uHq28NRm2Jwf/l0sg2HTU6PbwOOhJAnvsxpfY/bzwc6Twu5mjT56VpmJJg9eI1X7ljSxItf+5mYMdu5Wx9tPSVm8QmHXjNAslnGrdW0RJrrNyKUuYLmjlCHlN2pIkMSRi+gwWCB1
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 06:56:55.1555
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52d66adb-9393-4446-9f2b-08de75043a52
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4156

Add generic SoundWire clock initialization sequence to support
different SoundWire bus clock frequencies for ACP6.3/7.0/7.1/7.2
platforms and remove hard coding initializations for 12Mhz bus
clock frequency.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 43 +++++++++++++++++++++++++++------
 drivers/soundwire/amd_manager.h |  4 ---
 2 files changed, 36 insertions(+), 11 deletions(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 5fd311ee4107..447b9d1f9cc7 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -27,6 +27,36 @@
 
 #define to_amd_sdw(b)	container_of(b, struct amd_sdw_manager, bus)
 
+static int amd_sdw_clk_init_ctrl(struct amd_sdw_manager *amd_manager)
+{
+	struct sdw_bus *bus = &amd_manager->bus;
+	struct sdw_master_prop *prop = &bus->prop;
+	u32 divider;
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
+	divider = (prop->mclk_freq / bus->params.curr_dr_freq);
+	writel(divider, amd_manager->mmio + ACP_SW_CLK_FREQUENCY_CTRL);
+
+	/* Set frame shape base on the actual bus frequency. */
+	prop->default_col = bus->params.curr_dr_freq /
+			    prop->default_frame_rate / prop->default_row;
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
@@ -961,6 +991,9 @@ int amd_sdw_manager_start(struct amd_sdw_manager *amd_manager)
 
 	prop = &amd_manager->bus.prop;
 	if (!prop->hw_disabled) {
+		ret = amd_sdw_clk_init_ctrl(amd_manager);
+		if (ret)
+			return ret;
 		ret = amd_init_sdw_manager(amd_manager);
 		if (ret)
 			return ret;
@@ -985,7 +1018,6 @@ static int amd_sdw_manager_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct device *dev = &pdev->dev;
 	struct sdw_master_prop *prop;
-	struct sdw_bus_params *params;
 	struct amd_sdw_manager *amd_manager;
 	int ret;
 
@@ -1049,14 +1081,8 @@ static int amd_sdw_manager_probe(struct platform_device *pdev)
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
@@ -1348,6 +1374,9 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
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

