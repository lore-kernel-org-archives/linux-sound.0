Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011037.outbound.protection.outlook.com [40.93.194.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD5539B971;
	Mon, 27 Apr 2026 08:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777278359; cv=fail; b=E8s06xNia8i7KNcyNIOzLp9uDQNkOX3hJiIUpZiUPz3Vqhc7toUSe+CYSZGS8KiheuSnQNbxm5aRNsyOBcYWX5xQDd7o9uCDWzlDbI14FwRpD8BSpZsG+F193DndhVjKoBYItsLIzMgS38++hiHE8XjhXZAxpQzjd3v9QRYkUD4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777278359; c=relaxed/simple;
	bh=0APbCjlPzc4ADVq/NiQ8jWEFD50POiGp6C36NBz/PUA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oBGHWT0eP7a3In2o8mrmle9FRzzliH/Q51F1LAc1YD9CiMfNH4vsCE0qFG4RJg4GZgjnrJ4CzP9RqWV/ojVt63Dvdf7m3umIzxXdy6fnddu/BAgzD/sExfweZDUTvQO542WgDIDY1eY/jLaG2BBJBSN+OOO5YvoClzSHbhMtsgw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=xYqFRhxx; arc=fail smtp.client-ip=40.93.194.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="xYqFRhxx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H06AcoaZB34NnR2YmsbSsizVpEC2Cp2cv0ZmZvvg67XadpsLzpK3bFSTQSDuT5MPyDGYHgzLQALhfnZJ5bnUEIv6xMdBCj3nSkgS92Np3wgNubVmfDr7gLdNjWbS4W7w3xrcKB2yuBqqJqvFEFRD4USAG7DYO+OUyX8re9ZLlPsQHv1NAiaeEBKTv8WBetUPdglfbwDXMKKD6lCmw3kA2R7aaHd0FSTpxOge/akLNZEEg2TdJ0NMRLgiXp5MbCpuqM3QSTeBZs+4ubogf/O74UvR4L85wF7ai5SAvsRskqNgdWM1+dKtMXqNiOu8Acq5/bgHOFGW9f2QksRpQbipFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sjRJqYNk3EzJuVCviVTFiTKitQ0w0zDhOUH4L2Lztxo=;
 b=RjOKqiayJpXnIOCiNWBu6yNM7PnBsuMHHItD0S4KlmMmgBMlA8tz3jkzWcg9CUqQWpgOiS1nhLm8yrXVeGYsTUSMEtyLLmPh6eeRlDEhkER26/NZ6rKhxLjqv85dcDOZRvxV0IH8EwoLddkLb0AvRxPQCVTV3+JTOz2moCDs3R3iWGlNFZYNiwI9r6kWsGYCsrVZDdeAp8XhY2O56xr3qSdRMw2KMc530U/k07S8iHClhfje43OWh/Lg49UsMDd4aJyy0yTgrQX4RzsWEqEx8miikkGu/u9Dc4VxrMr0e9sPAUNhhjzOk+RqZYC7vE379cq0YcqBwIGQWppVJAdikg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=linux.dev smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sjRJqYNk3EzJuVCviVTFiTKitQ0w0zDhOUH4L2Lztxo=;
 b=xYqFRhxxZ5f21HzaU/fle0IG08opQ1QbYb8fug279iekxOFptyBl0Fb3U/pll2tPDrb7z9uDMPT81eb7o0U523Tdwh+I2QuBvQjwO77Bm3pJhqP5t/1nGSj5Jj8wyMiDFxULUZ3cYPC86hsoby+RejhDnKJ24vcmiEXSd3ciE8k=
Received: from DS7P220CA0082.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:259::16) by
 BLAPR10MB4994.namprd10.prod.outlook.com (2603:10b6:208:30d::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.26; Mon, 27 Apr 2026 08:25:55 +0000
Received: from DS3PEPF000099DC.namprd04.prod.outlook.com
 (2603:10b6:8:259:cafe::10) by DS7P220CA0082.outlook.office365.com
 (2603:10b6:8:259::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Mon,
 27 Apr 2026 08:25:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS3PEPF000099DC.mail.protection.outlook.com (10.167.17.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Mon, 27 Apr 2026 08:25:53 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 27 Apr
 2026 03:25:53 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 27 Apr
 2026 03:25:53 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 27 Apr 2026 03:25:53 -0500
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63R8PGjE2864337;
	Mon, 27 Apr 2026 03:25:45 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <broonie@kernel.org>,
	<ckeepax@opensource.cirrus.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <cezary.rojewski@intel.com>,
	<peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
	<ranjani.sridharan@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <baojun.xu@ti.com>, <shenghao-ding@ti.com>,
	<sandeepk@ti.com>, <v-hampiholi@ti.com>, Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v11 4/4] ASoC: tac5xx2-sdw: ACPI match for intel mtl platform
Date: Mon, 27 Apr 2026 13:54:01 +0530
Message-ID: <20260427082401.2118-4-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20260427082401.2118-1-niranjan.hy@ti.com>
References: <20260427082401.2118-1-niranjan.hy@ti.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DC:EE_|BLAPR10MB4994:EE_
X-MS-Office365-Filtering-Correlation-Id: 3eae0d8b-b24f-4a17-3b76-08dea436993e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|7416014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	2xYnTbGg7MTCC5VObNZy/AZQWAmn+SUYuQEXk6k/Xxwmyt2wo13dCio50jUuhxaMCzkDfNTIbwmTqN5tMvFOQBmZTceLKcH+orIi9HsnuEubOofzYE8FJUhENlHoAvZ/aUdTbNswaatXk8FCAn1DfA/JLJ5z54zLUbPIcH3eAUO0g+/HxHrd/7Ejss9WbcxeuDDlZnRCPAhSRtLZe2CH9cAmx4XSNsFHmGqFdIPksiNcm1bhIWGOuaXD51SQeEStgS3DxdtQNmk+RsfcX+VODcDH4xsL3TkmYk/TzbaQyV5ZIH5C1TytHe1eEyU7PQYJq0s/UrgqPAstclRenoL50NacudgkXZGe7tGDtnNIyZuPdIBSOmnqLRzbjUNtCkA3DdXV/ArQ+ZjYxnW/0570uWEzL/HqdCZuTa+f9/LsuZswy5/n0+RsGb/Pu9snxCqHNF/y7bGCa+l2twnR0QuEq0vOHM/CRKyzHR3GkzkOw/RU9kpo1ulU5PQfh7BZsTbS87k7oS6ecGEq2qJRWXZQxNKMcsu4E4PB0dyM0JGY3Re97GcgfiuA2ixRIgaHwvn5QkDcLZYxzInlV/6yAJk52tzomcoeiLzD8DGc1pT9Ait2nxcNB6bI+i2yO4vSxRxL6wYa2ICLWrF7q1FUp2lOX+HpZynrRDXBUV/3o7iBw9nroyrOxcrJWwfpgnd090bmIFReqP30j61iG4y4YAi17iXLh6/Bntwo8X6bCqYi2B+tNREimKURNXkX9cGKmQjPeJ7E/soj2/ev1fCAogcIDw==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(7416014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fxSTrGcu0mbrfNCuF5P5nMaPaIDn5DwXi3wfOPi+xS3O5Zn8HQlsTzIqBMcQORlBTgX6M0gUqA1GhTEEZOuuZMhd3ZKBBKsQ/fNNcx0Syfr6TRRiKO0riim6RU6YVHfC+T5/5w0AeVX8ZmieKlW+ZFgWSP2IfQCz0u5m6GlfoDrFn5bGiTSV7sz6V+LCKzyXnmt6B62ap+xepUTb6D+lwsKwrli0LqzSvDMiMA0V5YPgRcVTBwOqtJZA8Q/qaykFmculNRzvZZUas7QWWe1gZ8ZNPwTfpmmFhIr0qLWGFhxrKJkDldTWzKiuK1ynH1zI5Jq9qWLc4o+PXDqXgknQTGCN71wXj0yBkmnmE3KkxlRq/GevaUjCyzdOeCKugm6QFxqMrZxX01NB9VJoQpzbQ6ta+VU1kt7p5KY69rZJ6dymhsUOWu3aVdksPlaWjZ9+
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 08:25:53.8396
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eae0d8b-b24f-4a17-3b76-08dea436993e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4994

 Add acpi match entries to support TI's tac5572,
tas2883, tac5672 and tac5682 on link 0 on MTL machine.

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
---
v11:
- no change

v10:
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

