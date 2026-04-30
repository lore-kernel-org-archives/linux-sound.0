Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010026.outbound.protection.outlook.com [52.101.61.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F5842B743;
	Thu, 30 Apr 2026 14:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777560414; cv=fail; b=YGdOaKlLmA8414H80Vb8hLlHBHl568D9WwioszkgDIeoFif3HbabaSxQKr3yKZWek3sWl2FVN0c38JRyzhs4WyBeOgWhn+rDXj1YJF+4knQgaArf0ODPSsRNCW7HyHawH/WIuVfdUiyLx8qkfQEFmB9XO/d/LWUQQhFOJ4HgRl4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777560414; c=relaxed/simple;
	bh=/v69QSVjnqtgQKgUvHzvHbHXvpYLopRR/uq+ohnsrBo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d99zZsZlR6MPEaTxXZx+QkHNlyHvg6rYQzW4VaFoyV46KUDpQcrUT2t+J50uMsj8Ar7/4eiQ9F6w1dKkzos77fkVD4435xYLu23ohWtXuYKed1ElSUWDX0bavIqlX/cozdnRlkQcoKbrlGL+QdsT8+3wMgKOU1vs8cJUUsBDpYY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=UaWdDs6i; arc=fail smtp.client-ip=52.101.61.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="UaWdDs6i"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q6GJQF2LHZhufWO92ktO6UvxY0K+/mQODsNTzOsE51kmaga+fTb/xRz336e5LZdcvgd0H0sY6AgAXbdJqimAP2xzrLu6GQ8YSN7olfh2/PL0qDExXb1xeSrJGfNrrezXUcPtqjGf3gRxsYuP6viZgIeieOpMgCLMgUwe1ZcXOs1BBOEa6W8eKsD0JnoapJmzYFoI0UHtATODNWViB8QDktDm2iRv4hO03PMBXVt2eosZ+jCJQdHT1h0mpNq2k5SqlIrTIB6KIR+ZZf3Xx60am+VVwl9PDH1yQvukChy0O56IADD7GZ/XLCmwwjTjyF0ulBQfhuSieugOfvnfoik5oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+rSrjWIxzX7WPqXxjrP7r4J7S4iv0+pDMpctC1GSN9I=;
 b=iNFxpNJtsteX2E1VYoVw/iohqcwxvpfqJ31McIb5SmUCrpIwpUUkCdkPY9btZ26pcTz5Hyc0/+BG4cizJWlbBbwoMKyRAQtwWofv/7HraNKkaoNNz0Yxd4Dzmn9tTwpXUTheW0zj0byzTIALbX4qSnIFOiG9UicedFtw0bC3zN2TCd3rp3SSouVuEXhN2TNwVrXf2109urOonJKcOl21sQugQ+KczlYF//MLC94TKeoN/OGPv1iUlrXatqkYNIOaIXqc/F/mdmnvAncLVkh7PGzvI/qvXYm7Gk9DpOp59IMCpKJTgWpVq6RHHrWwF0xJyx1cH2AXYSXrGzpqndo11Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=linux.dev smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+rSrjWIxzX7WPqXxjrP7r4J7S4iv0+pDMpctC1GSN9I=;
 b=UaWdDs6irORmQ+Doj5N2W3Svwd1GHG5MDUVwSKlF8RKKf/WRaGr3gFwo3HDDp3mMBFeU0Lrb7FngtBKn0cZCqcwno3qhekuoThvOz3XWgRiwF06BeR2oW3X5E5pPmWzyOuQjlCIk8hp9ouoaFsVRhdHm3wRksruuIAg+u7Y6RIg=
Received: from BN9PR03CA0277.namprd03.prod.outlook.com (2603:10b6:408:f5::12)
 by BN0PR10MB4904.namprd10.prod.outlook.com (2603:10b6:408:125::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 14:46:47 +0000
Received: from MN1PEPF0000F0E0.namprd04.prod.outlook.com
 (2603:10b6:408:f5:cafe::6c) by BN9PR03CA0277.outlook.office365.com
 (2603:10b6:408:f5::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Thu,
 30 Apr 2026 14:46:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MN1PEPF0000F0E0.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Thu, 30 Apr 2026 14:46:45 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Apr
 2026 09:46:40 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Apr
 2026 09:46:39 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 30 Apr 2026 09:46:39 -0500
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63UEk6Ml1332278;
	Thu, 30 Apr 2026 09:46:34 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <broonie@kernel.org>,
	<ckeepax@opensource.cirrus.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <cezary.rojewski@intel.com>,
	<peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
	<ranjani.sridharan@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <baojun.xu@ti.com>, <shenghao-ding@ti.com>,
	<sandeepk@ti.com>, <v-hampiholi@ti.com>, Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v14 4/4] ASoC: tac5xx2-sdw: ACPI match for intel mtl platform
Date: Thu, 30 Apr 2026 20:15:54 +0530
Message-ID: <20260430144554.1335-5-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20260430144554.1335-1-niranjan.hy@ti.com>
References: <20260430144554.1335-1-niranjan.hy@ti.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E0:EE_|BN0PR10MB4904:EE_
X-MS-Office365-Filtering-Correlation-Id: 375fc814-b781-467f-3531-08dea6c74d44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700016|82310400026|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	WSHsBLF2VFFFUVX5m6pmiyb48VMlhARFKzez1J2GdKP4BUZ5jUz+WbdNm5WaasK+K3KS3XG5q/HCsrhdd3cQrNeyafBn8EVfZTQDbd8LO6DDiM3m0BhEohzRe1sSM/ieJm3+U5juGwY7T7KZMhm6fFzW9dHc46R71hfW21zxIrBrW8g15r+1CifBVYkFrpoI/kzCZRQaOIM+EZX6kweAKyt+9WQ923Wanb6VwiRtSbjPzqyHlWpFv5l5aBXLa9Lzlxc1LCbs3r9HzsdbFNsUd+YFGcqyAF+3TaLJHW21v6pb2RHjOd/hEboU0/JVjqTPMFAttaqBHYYXqgs6vuck4FHSs47M6VAxHEvxC+X/g55AGYApKoYTCBmt51S0E44QAWxCPTVI4A5B5szrMWZSllV3Epy8Sj0FDGyiyyC4DJoOlpDr7Y58eyP7aiCHK0WoOQO0F3O3MK6z4MaXYCbOWoIfqj6Wztmc5RGWIMQn7HqRphuhBcXTmrNiV3ldiXnHZEudU3YM1/zG3nUS0llZ3cSbBBy18xJ1IuO5MduklFID5mWyMHdTLIAPnJ7rDld+34L2Gc5hI5HTwZanYjq5Vz86tEt5OKAvGc/6LkiU2LoZlvnz2Ugq8MAroCZvDImtUUqR1zES7I5qcyqe12a2WVHakQ4FDXlgxppuJT2RDOZnt8LTP3naiyPMs9U4hAyuXLZlRrdGOwaZf1mXOv21UnoElNmtc0EcGUHFzPioBpQhujn1vdq930snCsWa6JJK3t30ldowIp225WnZmsezQA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(82310400026)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MC5LVlk4q9fpSkPohq9j4oG9U/dFayP0m/5XCg2zMpAM7VXKuF1ltQPdyz9XPIMBe43DN1hhbEItruRZPjKeNOpNKLCaum2Y6JDn6prUjO1QGx3SRYPQNPLQfLhGAnpVNOG8fX2jl1sqYnylslWzP/RUWX3JcImQocwYJBHJ1+lzS+yLIiICHESYBQVUt9wWs5x+8/YI9AyCyk9RRlxcw+jKfG3OsdKDcijoSC/tCDdr0ubgs4yA+Bqee8gMNTuX77PWIz4PZxF8g6o8srPwjaHcjqC354KlrT4Um8OMKKU/MQEcamsB8iRlykuF8Jx01k0ufmgy+IEjT0fna69MyNUFeWTjacUR7gNDnFwbZMoL67c4sNssjxv1Y6iiIlKhjUEcuteTD5ZdSZ1AWqqhXE9H1jR5tWTxuYGn4hZQiOouWRVFlH66XTJOszZYRUnk
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 14:46:45.7048
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 375fc814-b781-467f-3531-08dea6c74d44
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4904

 Add acpi match entries to support TI's tac5572,
tas2883, tac5672 and tac5682 on link 0 on MTL machine.

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
---
14:
- Resending complete series (v13 1/4 was accidentally sent alone)
- no change

v13:
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

