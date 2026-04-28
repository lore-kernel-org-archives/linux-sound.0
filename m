Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011050.outbound.protection.outlook.com [52.101.57.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2EBC33D6D6;
	Tue, 28 Apr 2026 16:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777393793; cv=fail; b=TOwZBHoHqdZOJgCKz4TAefJaYZefBvBh+G1dG0WLiFEVOKVhgqhr7S1qlVmQ16GgrLngXjionWpxJ24GYeCwZeUGpByMC5eXbATb1RtMjvtET+deFHfQah5OwtEHaRmJ4mhe98JMgU2AhyElgmrkC+1uudrOqjPehR1yW70fgOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777393793; c=relaxed/simple;
	bh=caAfFC9RSJg0O5pLHrQh/4hstN07bKtsyKUHA6zdvv0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S/qu/L8vuYtajWYQXySzb6U3yuho8wd1kBVWw+b2FlTbEA55qbA6JyX6QprYIJDUpiMPN//nuZ4+vIaGld6yY6gPyqwb0ruRt2bQbMlYeMoJhSW9zp/3S0b7bmgpp6ynRQOUryYSaIcfhpAdoCbetzozhPeHhYAe8M7dFkSd/Z4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Wv9g56UE; arc=fail smtp.client-ip=52.101.57.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Wv9g56UE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XxmrLlHAFtRHL6+L5fWWEIGon1++oxtiRjXhYKTXh0KbStPDlSfvwtEhgvukXlU0661sLv0pHwJ3jfX+lAtEPFCwb5LVRrxjwnw4HLxNJrlTDy3YoAX6jRuvBqMNH7l5yojbSyuT8Anav1Wn+5j0SiA97DEIiPal8Y3mNo+o82INrB9njRfBFmE5ymw/+ZsjuQI1H4QspuYUFM1lGhf3qzdDbYfUMVl2Nx/m6vqDsUefLOye8cm/TddcFr+1zRrM90Y2S1gq6RtL2gpksDWbr0kksE198rY5r02TRdaG+3rUNH/2Oo0X/IrSnriu92+iOvApZ2kclc1Bq738oGMVnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vhvRu9bZ8qkzlHgRwjT4w4TVez3lX+87ZAvM59SM4xo=;
 b=Fd+VqahBFU6//kly1BxiXR0XBqAKSddED4splHIKzNcn4pBYFbbUONNp8vOKxgpJn5FBRv7wqkBXc5vzHopbxf0s+LoFN4CDnKcP2hq7d3EUvutHzBiKImTT51EHoYMy+dRTqYpYvGuidTdS9AXvMXnecJlrP3Cc8VeUckYMKzU0Oqk//vov9PGLR02PmvNjAqlFi2dhuPvP83QGV2uFCts1Efc9+rMcAbZDnV8ruzJIrZvy4PojlGyOcWfZW/deQcCwhk9kSZ/7T6/RLewWpHMnWH/MHIC9PCOEsMXKHGHDIjeQ5L6DfRTp91tXILnSQuM+939BR7yms+lgdshX4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=linux.dev smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vhvRu9bZ8qkzlHgRwjT4w4TVez3lX+87ZAvM59SM4xo=;
 b=Wv9g56UECHAlVhmxu7L8Hhv5FJmgSiwCYxQBCMe3r6y6yltq5nqQTleC3duyg/DBGbk/5EZhwhpCSw4aEH6CAAFKUB7r+CG99/F4vU3LHlx8PWQ405Pxuyicjb5oaAz/TXIbPFMAE5sknHesowds7CLuyFnUdnMAg4cnxIELeAc=
Received: from BN9PR03CA0521.namprd03.prod.outlook.com (2603:10b6:408:131::16)
 by CH3PR10MB8216.namprd10.prod.outlook.com (2603:10b6:610:1f5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.25; Tue, 28 Apr
 2026 16:29:47 +0000
Received: from BL6PEPF00020E62.namprd04.prod.outlook.com
 (2603:10b6:408:131:cafe::23) by BN9PR03CA0521.outlook.office365.com
 (2603:10b6:408:131::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.28 via Frontend Transport; Tue,
 28 Apr 2026 16:29:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL6PEPF00020E62.mail.protection.outlook.com (10.167.249.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Tue, 28 Apr 2026 16:29:46 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Apr
 2026 11:29:45 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Apr
 2026 11:29:45 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 28 Apr 2026 11:29:45 -0500
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63SGTNo21314937;
	Tue, 28 Apr 2026 11:29:40 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <broonie@kernel.org>,
	<ckeepax@opensource.cirrus.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <cezary.rojewski@intel.com>,
	<peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
	<ranjani.sridharan@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <baojun.xu@ti.com>, <shenghao-ding@ti.com>,
	<sandeepk@ti.com>, <v-hampiholi@ti.com>, Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v12 4/4] ASoC: tac5xx2-sdw: ACPI match for intel mtl platform
Date: Tue, 28 Apr 2026 21:59:11 +0530
Message-ID: <20260428162911.2372-4-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20260428162911.2372-1-niranjan.hy@ti.com>
References: <20260428162911.2372-1-niranjan.hy@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E62:EE_|CH3PR10MB8216:EE_
X-MS-Office365-Filtering-Correlation-Id: 8649ef33-4900-4fc1-1bb9-08dea5435c33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700016|82310400026|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	zKD0lS+BnHDy5EKmmrx9KtppTiWcSouqWNwYVr/RTyRn6nNbQ5yH5hYPKJF9BKndRP96jlazZWB6mLSQ8Vei7vXuLqWIRkLo6DmCVTXKpNp4G0HbpGhy58LeZeUauPHzphA/iD8DgGeYntRbUiqsLicxHnrzXdl2N9qZRescWoMw1NpTCHfVWRfxNxX3336elDZSZJcbxPOTwTj5b2SSMl0QeY2pVBN85IX/3mOmGAHRHnSK/B42rIDBACA/SoLBuk2uY69vfUsPgr95zbzZrCiLXk2vydROQrxKODd55d2/VbzLx6Mwu62z8C/a9LxrUEDcYJPi56wFM0aozblIfIZxaAMSJnGJ8E3FoJ3pNbDsykkkGTmEVs/74nOoD2+wm9SmEnyo+nJCriM5BNWr1oOlEJOyx4O+QegbC3r4hh5MBdZBQhgQ2CUEmIGx8ZeTlKilZxgm9QLbhB23OePoCxBNuwJGkTArr0y3lxAeC2VvvwLPETVGx8oPuEy1n937/AyvjTpQ9POLxCs21KIPWmBtGIt64XokBxdhvNh9CgbpPLNAzk43C+YDCHp9bzsW0FxMA+C4qZsuBkek5pPBTlkKPTqvcZJgbZZC9RV6/bA9rclFeHxX70aUOldCBYJHGsiGZMBKvglEt+tfYuNS4u7Fob4rOTrWJcUlMbJ0VfPDx6h0ULRIzp1m+v+w23vlo9EKZTh40+6u2W1z1c/O53qVuqusLvyNO/JHsLzmbwjb2tJr342QxujZpt2GFSlP/5gve5ikU5IuSjCqPEQzXw==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(82310400026)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PUWzlECztJ/FHlryyGdB4v28LskjyzeqyxIttrly7b2WNpAwOs7TwJjYNaxKmNc4T2bdwtQIQIUhdYhT59sXEnCtGk3eZ1vfwAVeXg8S07vUHRH5AitoDJkNf1BR9zZ7FjlGZ1lfTZLawxU/V3uEedRIwJvfcnKADYPhqfskYqlDhALqUO5sQB1O8mbrO7doEpXL3j8iKGsg8oZpYPkDcKUZ/5M4fLLuI4zpcVNXvml06eO47vS0rw61pus9lZLHgB9zHKp+U3zhYNK58VqQ0bcNdH++onKmSxqHP5fXS/60bgN1WNgl/sKVP8vm7psZ6tiJBGKeOC4Dsr0gYWXoApcSptRNOpVR6fh/BUvJJmiIrMfa+OuOf7UfRpr0v/QOkvKSKeh0s2N8RWYSM/Zt+m9nJ0cvOEACLVcGuD9qOIyyzXDQDwt774iKQ/DMT96B
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 16:29:46.0191
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8649ef33-4900-4fc1-1bb9-08dea5435c33
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E62.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB8216

 Add acpi match entries to support TI's tac5572,
tas2883, tac5672 and tac5682 on link 0 on MTL machine.

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
---
v12:
- no change

v11:
- no change
---
 .../intel/common/soc-acpi-intel-mtl-match.c   | 132 ++++++++++++++++++
 1 file changed, 132 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
index 72c35e730..2e4222456 100644
--- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
@@ -122,6 +122,42 @@ static const struct snd_soc_acpi_endpoint spk_r_endpoint = {
 	.group_id = 1,
 };
 
+static const struct snd_soc_acpi_endpoint tac5xx2_endpoints[] = {
+	{ /* Playback Endpoint */
+		.num = 0,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+	{ /* Mic Capture Endpoint */
+		.num = 1,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+	{ /* UAJ-HP with Mic Endpoint */
+		.num = 2,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+};
+
+static const struct snd_soc_acpi_endpoint tas2883_endpoints[] = {
+	{ /* Playback Endpoint */
+		.num = 0,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+	{ /* Mic Capture Endpoint */
+		.num = 1,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+};
+
 static const struct snd_soc_acpi_endpoint rt712_endpoints[] = {
 	{
 		.num = 0,
@@ -1011,6 +1047,33 @@ static const struct snd_soc_acpi_adr_device cs42l42_0_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device tac5572_0_adr[] = {
+	{
+		.adr = 0x0000300102557201ull,
+		.num_endpoints = ARRAY_SIZE(tac5xx2_endpoints),
+		.endpoints = tac5xx2_endpoints,
+		.name_prefix = "tac5572"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device tac5672_0_adr[] = {
+	{
+		.adr = 0x0000300102567201ull,
+		.num_endpoints = ARRAY_SIZE(tac5xx2_endpoints),
+		.endpoints = tac5xx2_endpoints,
+		.name_prefix = "tac5672"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device tac5682_0_adr[] = {
+	{
+		.adr = 0x0000300102568201ull,
+		.num_endpoints = ARRAY_SIZE(tac5xx2_endpoints),
+		.endpoints = tac5xx2_endpoints,
+		.name_prefix = "tac5682"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device tas2783_0_adr[] = {
 	{
 		.adr = 0x00003c0102000001ull,
@@ -1035,9 +1098,45 @@ static const struct snd_soc_acpi_adr_device tas2783_0_adr[] = {
 		.num_endpoints = 1,
 		.endpoints = &spk_r_endpoint,
 		.name_prefix = "tas2783-4"
+	},
+};
+
+static const struct snd_soc_acpi_adr_device tas2883_0_adr[] = {
+	{
+		.adr = 0x0000300102288301ull,
+		.num_endpoints = ARRAY_SIZE(tas2883_endpoints),
+		.endpoints = tas2883_endpoints,
+		.name_prefix = "tas2883"
 	}
 };
 
+static const struct snd_soc_acpi_link_adr tac5572_l0[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(tac5572_0_adr),
+		.adr_d = tac5572_0_adr,
+	},
+	{}
+};
+
+static const struct snd_soc_acpi_link_adr tac5672_l0[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(tac5672_0_adr),
+		.adr_d = tac5672_0_adr,
+	},
+	{}
+};
+
+static const struct snd_soc_acpi_link_adr tac5682_l0[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(tac5682_0_adr),
+		.adr_d = tac5682_0_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_link_adr tas2783_link0[] = {
 	{
 		.mask = BIT(0),
@@ -1047,6 +1146,15 @@ static const struct snd_soc_acpi_link_adr tas2783_link0[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr tas2883_l0[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(tas2883_0_adr),
+		.adr_d = tas2883_0_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_link_adr cs42l42_link0_max98363_link2[] = {
 	/* Expected order: jack -> amp */
 	{
@@ -1208,12 +1316,36 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-mtl-rt715-rt711-rt1308-mono.tplg",
 	},
+	{
+		.link_mask = BIT(0),
+		.links = tac5572_l0,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-mtl-tac5572.tplg",
+	},
+	{
+		.link_mask = BIT(0),
+		.links = tac5672_l0,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-mtl-tac5672.tplg",
+	},
+	{
+		.link_mask = BIT(0),
+		.links = tac5682_l0,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-mtl-tac5682.tplg",
+	},
 	{
 		.link_mask = BIT(0),
 		.links = tas2783_link0,
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-mtl-tas2783.tplg",
 	},
+	{
+		.link_mask = BIT(0),
+		.links = tas2883_l0,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-mtl-tas2883.tplg",
+	},
 	{
 		.link_mask = GENMASK(3, 0),
 		.links = mtl_rt713_l0_rt1316_l12_rt1713_l3,
-- 
2.34.1

