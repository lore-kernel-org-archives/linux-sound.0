Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010003.outbound.protection.outlook.com [52.101.85.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525D13D9054;
	Wed,  8 Apr 2026 18:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775674436; cv=fail; b=ePD9Urt6KIud95qUVgU+ODyeH+TuNguI43WS7XeD+KaIBxwiC0PcUOEW3KyJcgS7lAWQ2N3+c3c1u6QyNl8sS+xWddwCvCRbTCRZccBcmDl9ObsusthdRqcaZ1DA1BTNplDBhWH1H8CP/e+Xa5hrO0ZtwxogXeVU/dSYjEV80+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775674436; c=relaxed/simple;
	bh=puSGR/BP0E1nOs1d9LoYUpuRcFvhMFotjFukZCu7Gg0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sr/thk9rz/B33szMUZ8jVKFAbUd5lFZnUfCNXK1MVnIazMF2NH82WRrf8h8NIX5zuR7fg4YWUEcPSwhaWeHWWOhYqybG/IaIG/106vO52aywR5wfuWwHF9l/XOqUwykOXU+PrHDzDEI+XtElby2W2pLiaDfkaqO93jWn35xqksk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=QPD82hRz; arc=fail smtp.client-ip=52.101.85.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="QPD82hRz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N0L5Mr2qDQRro3bKNPQl8sjrjGyl1MD4wHVV/phisiN+c16ajq1TISPfxeOOH36VKQ96ew1nCXCUsrkVh+Z+qxDTzb++GeEwWkb6nW5wAM6cikOjMWxg5szn4Ub1qt6ns6yOUQeSJJh3MPo/VxH/D6meM+ilB1N1IFXcPnOGl5zoGXLNvSMYcpU0ynMk5dHkipGCdj1sn3TX4QsRHFDFgfQ/575Gri1Uh2AmJjK3cD5Zt2ToJtj4XD10CRKFaDlEYBipwuRDhlUm7OaWYOuzGTxZsf45YD4iM6PSRwyFRiiuhGzAw7OdN+wkCd4Ywfkwzs8d75BltL0E87qsHVP/BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FN1bYD/98nfPvRVNf8ReBhQP59QSkldTo8vb3yl/PZo=;
 b=wCAQ9A1Pk11tMMhvpjHOsrdlmRRSPqKeUntiyRbxY1VMR6vIlYdv+0yqg3EE+t95qsGDbiJwOTbHu+8OTMB3ySUD4+XqAoJg81zXCuCaWtfRcuIjRz1nFeHsTNLMJoK1h2qQHsx2Ib+VGUzcbBMEYFMaM8bfxSu3+tWQeqPl6zRBS7Uu8YugqI82pqxkE+9t9SrefmqJdzcmpBxcg53DzZlo2sA9lfFojgDDMxeOLlu3sFIaj0gU2Co2T+WAyT5Jpc7ckOzNe9ySVJeTsUj0upGf6/mSf0sTvspAKv5a0f/Ofl7emK6FJQS6buJfG4C68xS3KMtN6GBtE3RX4OF8ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=linux.dev smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FN1bYD/98nfPvRVNf8ReBhQP59QSkldTo8vb3yl/PZo=;
 b=QPD82hRzDox/TMddR/W7f3Qoy70StunwcHQdmGDarUgIHR8di5eEVAzTlhTiEKBiJXoNytqrnoSNHq2OkigOTYCrfZkfIpDtdILAFcXV7+KfhjubLICi1CpfbKukjNcy2ICZSKDO0MttUe1juAThcXzsLHJM2CkhK1WDFzcFIrk=
Received: from DS7PR03CA0077.namprd03.prod.outlook.com (2603:10b6:5:3bb::22)
 by LV3PR10MB7771.namprd10.prod.outlook.com (2603:10b6:408:1b0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Wed, 8 Apr
 2026 18:53:47 +0000
Received: from DS3PEPF0000C380.namprd04.prod.outlook.com
 (2603:10b6:5:3bb:cafe::be) by DS7PR03CA0077.outlook.office365.com
 (2603:10b6:5:3bb::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.37 via Frontend Transport; Wed,
 8 Apr 2026 18:53:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS3PEPF0000C380.mail.protection.outlook.com (10.167.23.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 8 Apr 2026 18:53:46 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 8 Apr
 2026 13:53:46 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 8 Apr
 2026 13:53:45 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 8 Apr 2026 13:53:45 -0500
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 638IrQQJ1234943;
	Wed, 8 Apr 2026 13:53:41 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <broonie@kernel.org>,
	<ckeepax@opensource.cirrus.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <cezary.rojewski@intel.com>,
	<peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
	<ranjani.sridharan@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <baojun.xu@ti.com>, <shenghao-ding@ti.com>,
	<sandeepk@ti.com>, <v-hampiholi@ti.com>, Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v6 3/3] ASoC: tac5xx2-sdw: ACPI match for intel mtl platform
Date: Thu, 9 Apr 2026 00:22:11 +0530
Message-ID: <20260408185212.4605-3-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20260408185212.4605-1-niranjan.hy@ti.com>
References: <20260408185212.4605-1-niranjan.hy@ti.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C380:EE_|LV3PR10MB7771:EE_
X-MS-Office365-Filtering-Correlation-Id: ea122a9e-9772-44ea-8ee3-08de95a02a19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|7416014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	5OayK1sJ+i2FcUCwyHjAPqltvy9CmBmEQoLiHCnO8hK/tvxa+5CHn82fRlPQhwcwUCsy55ZL5RqqxfoZ7Jmuf0Xuz+EppnwIwP1EqyzyD+3D4jfKxienQBzkZoJ88BXdOpAL6H1wx5Jjwd4D1AuBtj8xurUooxbq2N9E/XirhIuQxfXGm1xJF0iWCCRaNxN6l5Hds2EYlO+umR9/T8N6PV/hjxeFZ2JvtNuCVKfQCdKnqcTeAwRi0liXF+IDF+x6BXcNxD8g07Lx/SQe+DVL2YGlD0js2ZctYtVSXQ2pMYWS4lyc3KOT5u9rToYPGT5fE5wlw6HK/5qDvsp1RCtJsD6Wi/LbIYvPCWokse9H99I5TeBz1igpdrX8VhyHJpD/qMlOiBFuH86B0Hk8M1Qv2LWdfQGtLIHK2ql1d9giNgWWaEEu+Kp86WReKiDeStB9Fq7/XqJqvYwPfkcW7aWFyNG3a8/DxVwkCd8TDls+gY5RQx+Eq9cCs4BrxxDeih8T0JEEBuBn2MdZLXXG2An/HDNkcfKL6JEZ/rcPqdfnC5Io+A275TbfH2fbGuSWQAUR5bePhhRmiScHnjQt6DiBKw3Cf/NaMUJOc+rvDaZFn6ucnLAEhod+pmajc0ZgYCsoYbg0ztqJPZUqRUl8VnxzvDXCfRczWgPyYpsFQ7I2u1fBitJ9+BZxTz11a3Apoi/inmPlXY5Vapj7pk8eOi30eoqD1Sa090vBYbMkm4TK8p3kH38a5cSShk3mHomCUKOmOzyNIP6ptR/fVn+/xNkCJg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(7416014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VoHQRQwDzsC84qWTPOgq0IxdyqQU1uTib0xD9U718MhZkTUl3afkeJTjK8SeiuInKyL/bd+1Iysj58FBV+MoLX0I+38Npkr9jSvc75GB9CHL8KoQ0u/lYiw3nxxZDAB9mWnKrRq4+h1UUqaQH+WUwo/tnMi4R3hBOgTWjME4BVbBBrPp6SckXy0SjopS8zpdZ36I/1ccpgPR0YlYKnTFFpr67939chVz38XESVVDLkEviG2T3/MV47enpxID8hpQ1RLuMp9ejyjWlTOCQo2JzE+D1ScBdPt5OFLNq9IaEDZHZKie1MoBkBS0yyExlhzo5DIEexlx+0OHoGFfCgJRQt3mvaUGzIjkEhVELpHhca92OkAjt3qAl3uJ0LKDY+zGegTn+caQtOGIeYMxawC5nYUrGaSxvpCHm5BE4Qzbgid4mKBT1REJ6oiuIdnrI6YT
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 18:53:46.5751
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea122a9e-9772-44ea-8ee3-08de95a02a19
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C380.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7771

 Add acpi match entries to support TI's tac5572,
tas2883, tac5672 and tac5682 on link 0 on MTL machine.

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
---
v6:
- no change

v5:
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

