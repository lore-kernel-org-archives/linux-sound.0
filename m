Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010056.outbound.protection.outlook.com [52.101.46.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FC0411626;
	Wed,  1 Apr 2026 13:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775049779; cv=fail; b=m8x5iaYNXdlgBQlgCEXiQuPB3Hxr/Y8vmI1b5jXODbA0AlihkJbPrpBb5ZfTQDdZzTdxYPo+0MNjSCz1+P6YCNZr47FMo8wVHWbffSIQedXPJ86EAyQpvOfVTNp9XIeItj+EqMtuWBiLby7bs+EcAUSA8sjIBgUFcO+Sk7IagD4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775049779; c=relaxed/simple;
	bh=UZL1oYwePVcSgIG5loOXYQ4P+U83OmHxkILp6JHnvOs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g2NyDnjsCMf80cZuU/jtsbBir670yu/jjD8/ASTrLoEUcbifW+xeAfgXautlpwxyYkzefuBGFqVDfabNm+TH89ADR2+BW4p9ffvzCKHL73gtTmkQnzKaROgAk3t5bpDDpWAGVI7GnxN4cpmbBUVZbv556Fwb1Eqd6GcLXnrLxdw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=AFGsGVZV; arc=fail smtp.client-ip=52.101.46.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="AFGsGVZV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hWGlZOItKyujvdF/ipTK4kgwH/horAYKjHimB+P7VGGmG3KkzrkJYeZwO/68CswLXFQOXv/5skyuo/gvtCcgjW0ctBt7k/9hOCr27jnu5HAU3GxdwtWTjfozPterHphT4nhEO/pVAQGxnIuHxt2cj7g6fuG0y8S95D/rhUpJa1D45BblfOqkT3s4swjedMKumHE2z2qckOoH7VvC73srQj/w8WJ6jY/KSvDf6rtAKp8+BQk22TzmWzUnUiy12iRBS5VeLNA2qMtXezStD2pp08D0KrszxytCJgpsrcs8yI8NsFZ9ndEaC8A81W6SoQJDDPRW5sqrBl6dT8zzpMTOcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SsTq+kjNUfoQ9zCp1GRUy7uED5kSxkLr94w/jMhu3bs=;
 b=dbF+lM6uOpPIN3m1vF2QuyPBN98EjZuMh1vkaQY7CVX3PwVvqU1LIsarpY69bzkRRQtq66CDmJEu7nWaMvB8uztxcX6h9O8d7OKZiRtCyd1P8iWqu19AAD/cWzhZMRdXQbuRaFIe2SABc17CtoI69MZ+43S9m7LMy7k4/wK5a7tHVeI//QLRpcxmin5KoovEXzLazOIuMhiIb4t0pyEcIbLA718M+zJ+2DSEyABBXm9jCcmr7uSgKHQnvjVjClUgyW5IMCqA8kmqsM5xCKLlsUzUDNZPwtIZwF/VDdpJO+iA66yg1VFlOVyzJ6NqUq/QgDBufLWFCes+ZuvfzGDmMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=linux.dev smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SsTq+kjNUfoQ9zCp1GRUy7uED5kSxkLr94w/jMhu3bs=;
 b=AFGsGVZVc/W/Nt/10ezZNiWcArPDfBxEFSFxEuluRnCpCC9v6irFMqsYJl9Eyv3tr9OjR3CEx6qcUd8Z1QTiXk3rRZXNCBuXQUfe1qHcu/VnpUqdzckaqQgzI4gbr3ZSaP7lyw27kzkxqsLcBLTPJahGsjHl1dkGPgD+pbZPChA=
Received: from SJ0PR13CA0025.namprd13.prod.outlook.com (2603:10b6:a03:2c0::30)
 by MW4PR10MB5727.namprd10.prod.outlook.com (2603:10b6:303:18d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 13:22:53 +0000
Received: from SJ5PEPF00000208.namprd05.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::eb) by SJ0PR13CA0025.outlook.office365.com
 (2603:10b6:a03:2c0::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17 via Frontend Transport; Wed,
 1 Apr 2026 13:22:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF00000208.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 1 Apr 2026 13:22:53 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 1 Apr
 2026 08:22:52 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 1 Apr
 2026 08:22:52 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 1 Apr 2026 08:22:52 -0500
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 631DMHUU147568;
	Wed, 1 Apr 2026 08:22:47 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <broonie@kernel.org>,
	<ckeepax@opensource.cirrus.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <cezary.rojewski@intel.com>,
	<peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
	<ranjani.sridharan@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <baojun.xu@ti.com>, <shenghao-ding@ti.com>,
	<sandeepk@ti.com>, <v-hampiholi@ti.com>, Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v4 4/4] ASoC: tac5xx2-sdw: ACPI match for intel mtl platform
Date: Wed, 1 Apr 2026 18:51:48 +0530
Message-ID: <20260401132148.2367-4-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20260401132148.2367-1-niranjan.hy@ti.com>
References: <20260401132148.2367-1-niranjan.hy@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000208:EE_|MW4PR10MB5727:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f7d79fc-970d-463c-2911-08de8ff1c79f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|376014|1800799024|82310400026|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	i54mFi4EBn09eNKlNuneoMj+RGUuei5wBXuiNv7nkPK754AjVuwLNJ1lzeEsxQgr8A+aq+AN2QDu71tld8HTKw1FmJ4q19L127OhaA3TTQ2r4m3iOPC11mnh9/Yw0a1WXYOGS3H7sO2arblTJbv5hxXhIj8xIs91MvmSM6Bf2l8BcB+tkXl3uDTQqd/bZJG+dr03A+5w0TxjceToYzScXygox7jvnPvZEtnAI99SAwJltjF4gsYqeDIV9Hwn/TQXkcXacsf+v8Hfrskx8lflt2a6nizBPz7MNWeKDf2SoWt/Q08r/OqDO1hQIP7PzmQlBjjU+XT3kXGt/cSPkrvZp6HIA3udz19/w6ANulJzSISrDMNCaWTdOvM0oC5kE7BoNc29kAggroP05ugTit73lPPfsgJ3D56e5WathlBaMgabzUKjZtq9sZbpCcEEVsU+cm+aoz3TjwvX4yBSnoH3IV4/KqYbf2qgVjrlEEeyWC+us4GMnEwQbQpfYmL5ZQYknTxYP7XyrmJtRqkM3wbkySxJ7lpB1Hd72HPTvuaXmTuO9yJRSosmMlxJ+UXya5q5JYyvIqGmfIM9ayxvjRUBeBl9cTyeL18y/owinE9MuYGKUOGvXuzp2BLuX7O6yCC9ZvhUuHbyflypadQ7QxJGe/1p83G4knNHXz/f+6CrVH6/hhpQpNMZoe3TbooFWiwbuX2ZSJitTJCxrLzRWNmRnrEoZOOnPmlTWNFdLppuqccVbi/pm7T9dc2aWzzwTminrFSY79u2zr5o24ss6FQcdw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(1800799024)(82310400026)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bogcLPYl7DDqMvqW+Z9igpq+eKI7y7uDhz2voWz8qmOVl0cjFoCUM6T04GObNJPSg4QFhcZphwAkqMtVgoipzHpH7awjFN8pFTWdMsFxnwf+b6xgrbhOlhsA882UDKrsMf7F8HCH+mlrsQdfHWcr8iXV5vkVY29gOzDq4Gih+P7AOtmL1dn4NvFL7j38uSOoRyxXWdV2DV2jEuD19JNapx1CLw25Q80uqx5f9ZTBBfYhI4xnUhgVAihagTJPfVubdewco9j9YWlVujVTll05RSavleahnwWFYTN2Vq7dug0hYZ5BhE2bcFoD8CSUZyswuDIvMOK/8YBXveja1B37EYqFjd55cLMm+2I/w8Z5DhaAEBo3yWkaXwdDsicmOUxNBV1fHaYfeXOnKpeWe4iKWaAlofkgEAuUrO/G0DI7yCqSa5BX0NrI4TXMXsXhWoVo
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 13:22:53.0920
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f7d79fc-970d-463c-2911-08de8ff1c79f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000208.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5727

 Add acpi match entries to support TI's tac5572,
tas2883, tac5672 and tac5682 on link 0 on MTL machine.

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
---
v4:
- no change

v3:
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

