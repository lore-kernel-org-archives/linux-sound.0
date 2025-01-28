Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2055.outbound.protection.outlook.com [40.107.223.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA591DEFDC;
	Tue, 28 Jan 2025 06:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738046223; cv=fail; b=NOftOct1zfOcT+YYa19rRLkINfJuwvPu/C+FHmuALh9WDFD8rz1xoZ+nQ/sWfGekv/K5M3D+1kCQTZOCMm1NhZj40myefJ3BQ06hw+TGQCJygyGoUM1/xVAWx0ocbTdZgxg0Ha6Glnzl1mp3Q2uiqocTYfp4BTAR4hMF2Bdvwzo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738046223; c=relaxed/simple;
	bh=GeGRnFCLix4npnKlD7S9IX1noWe6lq85u+L7fNHaipE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UK0quvasCWAJkISimdJht+a5vrczroUx9wi5Dugl1RRJtXjPejYABy/oSq/GhN52ttDq8RAWX4jXN0hrWJYuM62Ic8AUboBFd+siZbsJynXZB3sY/1n5xcpeh4yb7R7/u1dV/C4IOtRtbY+ep7B+2ml+NJe1PdoLzSik6+TJfSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=sBf8NgHp; arc=fail smtp.client-ip=40.107.223.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="sBf8NgHp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dyYyJ9K6bC5QEpchfLlSxpKyIjl/zJqw2hi0/sv17Z4IwDPn/Yw6SnbuOBlUpz+waJftzOQ/kC/LGiBqLbTdtddW5nb81iLQlkZ0R2zfgt4p5Q7Km7rYu1VS2CIyc0mAMknDtQDx1PkQDyVLAkb1DmpYBo9T87wsUP0gjXwA+s6zDt33aRKsPSiuO3pZC9cXij8QCXTgYOaphKJzQLt0rXnLhzjoxwKpT/RKiZGRml3Y78SabbTYEZuZhgBRGcvz0VThlD213kbErGS/6LQp+wcZSbEjEBo3oatrJ0V6sVOJMocV4BxyKv/bS4cPDZUlbOh7fHNrOAMHPlLGPDDpHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dverl8JtniLoEHDf/sPeb47TbT+iuSMeIS47tXvWdYw=;
 b=LkmJiz81CALUTwIJ4JWnV9jkPL9cBh/O1Sc4OaoIuh0pjCIego1cjEuamrDRGNOPDatge2acC4SqxR1JKFcLFBhQj37usRtvlifgLpBEKR9ynwinEcqGXHvHkkoeO8ILusYJfZewaYE3aXkPW85kM5XJmQnsfhEFZ5dHFvXuNHe7y0VLLi6aIVzTAGcuelq45ryUdpyEp3aBhiJnOMl8PepB+Bcfw5SODdO+jT15nK+vhw/ZZ1t6pjK8WpSW7i0BCJincReRrSv9IGlLNczuSaseVc2rjl2cYrFe8O55mF4UumFgT6i8RiJMDe1AD58Ml9dLziXnqVMrCcOmWZ/CDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dverl8JtniLoEHDf/sPeb47TbT+iuSMeIS47tXvWdYw=;
 b=sBf8NgHpWBXE1w0iQY3jPh30qjzAJUAHzThiMYO6Wlrc/1AWoAmm6nIM5T8ODhDpl+sDDJCUGreB+Ru8KJwU3KA7ty31V928cEg3ZNe3PYEte2QcWu034mUMkTYbvZ7b2M8hGg10FavoFCnX2qNJ/FltsC+qmf8Ew0O2H5R2lRc=
Received: from BY3PR10CA0012.namprd10.prod.outlook.com (2603:10b6:a03:255::17)
 by DM4PR12MB7741.namprd12.prod.outlook.com (2603:10b6:8:103::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Tue, 28 Jan
 2025 06:36:58 +0000
Received: from SJ1PEPF00001CDF.namprd05.prod.outlook.com
 (2603:10b6:a03:255:cafe::1e) by BY3PR10CA0012.outlook.office365.com
 (2603:10b6:a03:255::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.22 via Frontend Transport; Tue,
 28 Jan 2025 06:36:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CDF.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Tue, 28 Jan 2025 06:36:58 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 Jan 2025 00:36:54 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <alsa-devel@alsa-project.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <sanyog.r.kale@intel.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Mario.Limonciello@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH V3 5/6] soundwire: amd: set ACP_PME_EN during runtime suspend sequence
Date: Tue, 28 Jan 2025 12:06:23 +0530
Message-ID: <20250128063624.1922470-6-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250128063624.1922470-1-Vijendar.Mukunda@amd.com>
References: <20250128063624.1922470-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDF:EE_|DM4PR12MB7741:EE_
X-MS-Office365-Filtering-Correlation-Id: 9761c403-c996-42f9-ff7b-08dd3f662a5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xM0W/g3InXX0ODyponnArUjMXvl5/dqTa1OgXq8cKjz1mKJswpvql6G82kJ1?=
 =?us-ascii?Q?6KimzK2C/fn3AzZ1ErLWlbazjL0hjsfGESbE14WHFVP2T1ijZBGAFChKBlCS?=
 =?us-ascii?Q?zcXdMKIdKeDZANcqEIFDyNAQ77DGr3VapPoijjgWfCDUMzFAS4PhSV6Kw+T6?=
 =?us-ascii?Q?opRvIvc/lCuybenm1SvGRd+Pb7uG8YvscOzaR+TwHVyWt7tTj65OBW9UI34T?=
 =?us-ascii?Q?vyUBJiz/RWPTvyLhZwextwBcde0ussdAJl1tlHdnMpoQHngGWYsCidtRKZ+K?=
 =?us-ascii?Q?1FLrG1FnmNMNGGxJCO8P2WA7ABKfdKlCKowWNeqa9yOsJO1g7RLGEiw5MPoF?=
 =?us-ascii?Q?xz1ReEKXiv++Sc18X19a7Hqi2S5v4IFUKkpy+ITGqTv9kHrJbWwDWfuEKoGR?=
 =?us-ascii?Q?5xkVQNaBnf5rZ7gNmO3A87KhGk/REFFbwCy7gKCnbooIWYgDKKwG7Qtll6fh?=
 =?us-ascii?Q?1ullEUpHIWwYyzKG6wvV8xAuhAGFW6TXCcTZOCOoWcLE6O7EflLhBM1bryvk?=
 =?us-ascii?Q?vwxlG8YcE+RQ+bhPrR64+EwC10FK2rTS2h18WmjG1qLznkYyZ4BvJXszy+Os?=
 =?us-ascii?Q?8Q0rARXk4vXx5i/q891rdX1WT81wOAjKNv9aFr4K5m0h7EYxp8z3chR4BoAu?=
 =?us-ascii?Q?IMITdzqUqezXxnW2tHD0QvkHTLTI/oZtRFSpgsekVKTz52zw7QMx5Yj7gLkj?=
 =?us-ascii?Q?1qt2EXjjIKrWt56UtWLyQg+QjVYumydqDziPDSg107tYkSkNBxHH/u/9l8Gw?=
 =?us-ascii?Q?2qTzDm/+gI+T188z5kLE1LF4Map1OMjEFa9J3KurS7O+TzT4RPlVDvvv2vdP?=
 =?us-ascii?Q?M5pONaCBUJuLlXHsSuPFxfq/5RY/42vqlvq9FX63xzEdmdysaClV2fNsWb2j?=
 =?us-ascii?Q?Ig1cu9s7Q9HWVEbW+nH7t2S1H6t1tu8na4cTDvW27ZH+iEEwTw/+RiNv9grm?=
 =?us-ascii?Q?zvmi5mG3a/8rzfiJdFxBJaMlgIxF0NDXXd/OPg0E7DZf+KLUEvbsborbme8Q?=
 =?us-ascii?Q?du9xITdbOjWuyXAvlmYdpYjBWs3gBCoLP+CsoZ31JgToTB/5cxaONztizg10?=
 =?us-ascii?Q?dlWNt9rbSUL1UI+xVD7KvqaSVLZF4AvaUcCkm0cQmjHasxbfV9FE09dmPyle?=
 =?us-ascii?Q?JYLJHxruE+8zkBr4c30jlW5waxFigsyHTl0YuULdWhHf6qiZ7YIte2gxQ4+a?=
 =?us-ascii?Q?r3SzUPkUdqKyKCA9URdeDQEU1Ne9Z9QpkiTHZhILa1a/IZFs2NhtPnSKl8uo?=
 =?us-ascii?Q?gwnhO40gIs5ZUXgxQtB8YduKivJh7Y6OaIs/JpqgvC/Ivszv/3w+ROrDAjW5?=
 =?us-ascii?Q?2z5cfa/MWljqcH4NmRXjElwMFNDI3g5kIODWPwhycfaaeukgQGro34vi3qHT?=
 =?us-ascii?Q?554FjLuyyosKBK+EkpsnCbK3LWPainZT/o3GVp0Lz21maWyGERJ6o45+Jcdn?=
 =?us-ascii?Q?8f1p2il/WaqLNHoAJTpnKwRqlFD8K4TmB0qUZHxqxNBPFAL0l4xrYQ18WHKa?=
 =?us-ascii?Q?6Ddvq9jhtP0ZM0o=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 06:36:58.4736
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9761c403-c996-42f9-ff7b-08dd3f662a5a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CDF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7741

Set ACP_PME_EN to 1 during runtime suspend sequence as per design flow
for ACP7.0 & ACP7.1 platforms.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 9 +++++++++
 drivers/soundwire/amd_manager.h | 1 +
 2 files changed, 10 insertions(+)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 41ddb491601b..41aa24986a1f 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1212,6 +1212,7 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
 	struct amd_sdw_manager *amd_manager = dev_get_drvdata(dev);
 	struct sdw_bus *bus = &amd_manager->bus;
 	int ret;
+	u32 val;
 
 	if (bus->prop.hw_disabled) {
 		dev_dbg(bus->dev, "SoundWire manager %d is disabled,\n",
@@ -1236,6 +1237,14 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
 		ret = amd_sdw_set_device_state(amd_manager, AMD_SDW_DEVICE_STATE_D3);
 		if (ret)
 			return ret;
+		if (amd_manager->wake_en_mask) {
+			val = readl(amd_manager->acp_mmio + ACP_PME_EN);
+			if (!val) {
+				writel(1, amd_manager->acp_mmio + ACP_PME_EN);
+				val = readl(amd_manager->acp_mmio + ACP_PME_EN);
+				dev_dbg(amd_manager->dev, "ACP_PME_EN:0x%x\n", val);
+			}
+		}
 	}
 	return 0;
 }
diff --git a/drivers/soundwire/amd_manager.h b/drivers/soundwire/amd_manager.h
index 8430f279d88e..1d5e94371f81 100644
--- a/drivers/soundwire/amd_manager.h
+++ b/drivers/soundwire/amd_manager.h
@@ -199,6 +199,7 @@
 #define AMD_SDW1_DEVICE_STATE_MASK			GENMASK(3, 2)
 #define AMD_SDW_DEVICE_STATE_D0				0
 #define AMD_SDW_DEVICE_STATE_D3				3
+#define ACP_PME_EN					0x0001400
 
 static u32 amd_sdw_freq_tbl[AMD_SDW_MAX_FREQ_NUM] = {
 	AMD_SDW_DEFAULT_CLK_FREQ,
-- 
2.34.1

