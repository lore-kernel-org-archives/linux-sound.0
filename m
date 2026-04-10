Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010027.outbound.protection.outlook.com [52.101.85.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7BB3446A3;
	Fri, 10 Apr 2026 09:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775813169; cv=fail; b=ltyk2XxWv4HW6bqS6GNJjZYaHLNO5emYX6sOyNPtBDGZViQvhURavXmUu/k+7URFvP9CoqgneX4fT4MKGz+wxOVVmUaHZQp3kuCK7og0GAbFpQOaN/6OeRcATAOIvuMuKSNU48CaBFyYFfpYgRKWhMZWGA6Bqsdk3Ch44sZEGGM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775813169; c=relaxed/simple;
	bh=6E+MFsUV1MfQ9DhXc03BdF8zrrNbfL55CcUY7fhLaDE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Atv2idhqaVmBlhV/jZ88vOpG/M0ojICyuxrY25RfdbHENAymjXP1yu/IkB5WuzFp3blvLgVmBpX15USaH/FgqyMpsTRGat8rEL5lkpikBZCZLUirBJOpbz29qzOaZYni/PvLN4AGF0Ccn89l3vaRPVoKUjJFbndb37k338Bd26Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=l+/Fq6lc; arc=fail smtp.client-ip=52.101.85.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="l+/Fq6lc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JO37Apd5qSDjWbtS/9GGPKnpxNm5FobzoKiPXQVCx8mFaZrRXkBy1Q5ioUTKcebMIAeudsRjk/RSn6AKThqDlaa63bmbHUjfUP3lfWYWQAMXoiKWO1BUBCpSmXs36B4DfNOHgduj/pn5ZWy5CAKRxDEm5v5aX9SavYHd/Qne1+ZEQWJXFDLfEftzIIltpkjknnxIQeNJ7IMRLh0HihHc7Rj/ajtv2bNdUFCof9B9ZWpanbZ00pBcE4klxVc8rOuILuCDHMLNsNwrve6BjyPF5KAp+8VLmhpC7loFPkaQU9Fiyaht9of7nuUQR8Ga0XbN9LaN+aS3OcbRYNpRA/VATA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ZJnvxXfqw/y7o5HR5wafTZt9tRi3aB1WRaEKybfNz0=;
 b=Vun6gV5hsP1iIvrgf6WvvviZ5e85SEWDzABJDiQVSnuCUiEgMh2MLJZdydPVPPmncPzLHdZ03xS0hbzFt1XBYx4RL222QAaeEICd3DkCCp6oyxHPQyMZrbFe7QzWxZyisHgQnY8kpLJIFEMYud2YMuBralsxqId1ZS8TN9wBI8LNw82vhJcHElHlePihTDO8SALiTyuArlSJJVziUTV8yU5PTJQxVrEDtAzJlMVdbBBuOWPtmgkeBQEfy69WWokbn/4EDAygIZ4aB1edI8c5P8/YfBeC27rif/qWlInsXC0Bi7AdvjC4Wr6zXBhk2jO4VqdBkG5oqh5/Lf0ZCYpR5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=linux.dev smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ZJnvxXfqw/y7o5HR5wafTZt9tRi3aB1WRaEKybfNz0=;
 b=l+/Fq6lcu1CPSXy/MpUgAOD9mCZZsAGzp/k9pZYk6NH7AShazXzGguZC9x71GfN46oT5zYheFQAEwgD1CNG8tcw5pxxAQDanK3jvroncFmeVRv5i/ufZDfGzFq3aYh3USAC21bHjhG+eh4SUFDpdr0/jx/0RFYmnV16bTR7OqPI=
Received: from CY5PR17CA0026.namprd17.prod.outlook.com (2603:10b6:930:17::13)
 by CHAPR10MB997723.namprd10.prod.outlook.com (2603:10b6:610:2f6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Fri, 10 Apr
 2026 09:26:06 +0000
Received: from CY4PEPF0000EE35.namprd05.prod.outlook.com
 (2603:10b6:930:17:cafe::6e) by CY5PR17CA0026.outlook.office365.com
 (2603:10b6:930:17::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.41 via Frontend Transport; Fri,
 10 Apr 2026 09:26:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000EE35.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Fri, 10 Apr 2026 09:26:04 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Apr
 2026 04:26:02 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Apr
 2026 04:26:02 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 10 Apr 2026 04:26:02 -0500
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63A9Pe9n1150015;
	Fri, 10 Apr 2026 04:25:56 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <broonie@kernel.org>,
	<ckeepax@opensource.cirrus.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <cezary.rojewski@intel.com>,
	<peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
	<ranjani.sridharan@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <baojun.xu@ti.com>, <shenghao-ding@ti.com>,
	<sandeepk@ti.com>, <v-hampiholi@ti.com>, Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v7 3/3] ASoC: tac5xx2-sdw: ACPI match for intel mtl platform
Date: Fri, 10 Apr 2026 14:55:36 +0530
Message-ID: <20260410092536.5521-3-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20260410092536.5521-1-niranjan.hy@ti.com>
References: <20260410092536.5521-1-niranjan.hy@ti.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE35:EE_|CHAPR10MB997723:EE_
X-MS-Office365-Filtering-Correlation-Id: 440a26ae-ff53-429d-be75-08de96e33085
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700016|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	eSFJTEYMHJqVQpP1FjOd8kBQXWmptBBCHybCli5C5Oz0zK2CcvPNA0e12y8UnAsKWnEc50FKV0knCKS19IOqTDSFZ4PheUBJ3blyrlZOiyP/QU79UuAURqilvjmWVuxu2rm/QOnUQPA6wcJhx0oGde/Opz0V3lTj6ybxKYCHbhzOvpebloMhEGKPW9nhjqsWCCY5i4LpHVJLXV17EyLSdyllyYpOUP4cEUh8+v6HMV7m4oLuxJ/Gc4YFNVcUlLcJ7Ms02m4U7LUbskclq8WEdKyoDapf2RMYt4yr8o6ibC7BEZ8ijI9hgIAns4bkhwyklAVFxLG0/lGwIahuRCX/ANIAABCroOcQeAwhqyQfDM7jjBwJXHBRQYA8yXb5WRCK1/UJ7CtwCmjyXGsZNEUgH3PjacMPfmN3FaDDphKHsg1tSifdiktST2etvyddAlk0vnpQ2MILiBB1QoqGfnK+k5UsBpRauKVuFZ0dYXuKrq2+N5sTsEznB+LPbpUMuFlmJzvho4KTZycJrkh20hll2GyE2AUCCr6EhoUS6J/lloynyp7Xpebx5w5LiF4o3vpHlZNpsBqvPsep+umy1a0Nee7ohXsObR+qOLbbDN4IKLXY8orFG6GrEjhmlAWj67gMgVQ3yOsdYyUiguSWpP6XVVyS+Y1bkY8ZA9KiPV3OV11dhjDsAyeYrYhe0NXiB91wxja4QHJUz+sLS3yTBKH9j1JUKXBt5Q9984MMFDM4u1FaVYBTwyg6eLB/6wEWoMoETUhOfMvwHj1oJcKadQJqiQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700016)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pBaa8li85SPro4fIpH6WY9XRGqa9NaNqMDaqAvQNIDrC647Dk/zlW84QHXuVkdqySceXTDqbc7MjMD5iQ4xCKcuQP8XnKzzYQX6Obsg45gXySZg3l2s44512GTWSm6b+KHQudk3kAee9RHK9NDvq0ChZ3f9r/S0Z6fl30ZuqQxcAbLqzthctz+m1S0OxsHwcgeNXEfCzjTVzmL9tpFYpNJFAkVf9sCWFjeJvb7XnpRgAxHNafsslKXobz2Y9ThRf6FGNNZnMLg3jyHUhv9QMcFVbTtGsp+TaaDxqihjr1FM75PjXCSMmKm9+9nHPLHyccnADUWaNPjv8pHfXvLGA1w4T3551dvlLoZO2Zs2gQyQa8DYgyOj65i13yMRtQXXARzugqV5b+QO4YOJirXgA/iR8PZ2BqehK13aJyAxN7iCsRV4yQoxwAMiTf56vHrzz
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 09:26:04.8583
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 440a26ae-ff53-429d-be75-08de96e33085
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE35.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHAPR10MB997723

 Add acpi match entries to support TI's tac5572,
tas2883, tac5672 and tac5682 on link 0 on MTL machine.

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
---
v7:
- no change

v6:
- no change
---
 .../intel/common/soc-acpi-intel-mtl-match.c   | 132 ++++++++++++++++++
 1 file changed, 132 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
index 72c35e73078e3..2e4222456f27f 100644
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

