Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010020.outbound.protection.outlook.com [52.101.201.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA3A7404E;
	Mon, 23 Mar 2026 04:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774239423; cv=fail; b=usLY0YpeGNcRT0Y7Z3DRLsYlKy0LPTUjq53ZInWWZTwSbOk4eUfop4c/sD7hBBQjjkNKO/m93K69BLwvVBncV0QLLjcSlUFZHEJ7NgFFePs8KLcGQg5WFEox5wK5hErdT+y8mz/nO7h4TOQzFZ2a+kVtuphvEzJIWauLWkX2TPc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774239423; c=relaxed/simple;
	bh=U+8yPATmWwO4HbLkrQXD32a13G2oYolXgJ1Qv6CD7Ss=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=F23KRh8fec6Cmzs2VbDAo2Y05e8CHc3VS1PfXhA4rY/J6BznnFeidlSmDglE3B6RkFvuvINwATkQSd+ueRJOdsITjuNSOjTGeA0kKHQSPEcdScameCA52mLlnGGzoDpl99vjcSbdLqV+ViyJeX4uv672S4BAz+h5ewbACeeZ3UA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=WlnJq49d; arc=fail smtp.client-ip=52.101.201.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="WlnJq49d"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J4IbfJXAtzuOfOnFyUDWrcxerQGouW8FNfTlUh4wGX79waUzXwYA/o6sAPR87OGtOG1ra9NQl9IFQ1YvvVYfDEamgA4WM9LiOCIUDNhFP0Ven6lOpCPqzOHET9ZDD9NBxjBYn7Jl2lHEUZ6kWW01Bh+x4hQsKP4hTzLeinvNXrjwJpwOn8QgDSZryBKzyn665+2kp3poYaZv8SHv0gPkun+iHmPwXvUrVyk5UHenkRhXlCm6Tn4QGkW6bwwF/8WAEWLD+nU1591UItrhopn6hADEkcAWYUvgViz8jFjVWNpJLlyOVFs+VFEmZ8SjXlKAmg84xUHLGPEXMR2VazIz1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2n2d3CyRpBH0h/2bgpNQMMhA67BbByPipQwytfLnDyQ=;
 b=V6x3QDjCxqHQjSJOhW4i2eV0a+DKp7+JtC3Lo5Wy2klE3K5zudSw24RfVsoCCCelgdkG/mi3UrJ6psc7c2PYbDUouSDdj0WxsHI3K3fLagmgd2CgyGa+mYLBmvAwDjU1RaK1syf8nGFSJWNBa7DR50gQq5I3kKRx4ryq8OtLSLTYv/9Z2P5gLQpKeieYPzUFdNC90guZbjrxUXFf5xYMddrvjwzfa7Pnk2PJ836uCuzpFnLZBzsvNddqZzsqSgrzMINRaPxX9EBEcZoK7Kbw9KiZHEtGds+KBeqGILHID43DWPgR76H0P/pRReuvxwqUDEl5axb1oUXaR4PbwsX7Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=linux.dev smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2n2d3CyRpBH0h/2bgpNQMMhA67BbByPipQwytfLnDyQ=;
 b=WlnJq49ds/wL10S45VFUf5j1+eMphZaAlKGJx72gQiPZGcw18c43QrXrQx/NrTWnDFuS6qcxlvz907xqjYFjRAPpASG/X0kHxE2knZNazOxDOO7tTWHapjD6MT55tVSWjpMJlHp5q2+8FbnJEdFgLt0ZzlaFbN3p/GPQilG8Sjk=
Received: from PH7P220CA0125.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:327::18)
 by LV3PR10MB7940.namprd10.prod.outlook.com (2603:10b6:408:20f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 04:16:56 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2603:10b6:510:327:cafe::56) by PH7P220CA0125.outlook.office365.com
 (2603:10b6:510:327::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.25 via Frontend Transport; Mon,
 23 Mar 2026 04:16:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Mon, 23 Mar 2026 04:16:55 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 22 Mar
 2026 23:16:54 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 22 Mar
 2026 23:16:54 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sun, 22 Mar 2026 23:16:54 -0500
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62N4GncM044069;
	Sun, 22 Mar 2026 23:16:49 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <broonie@kernel.org>,
	<lgirdwood@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
	<cezary.rojewski@intel.com>, <peter.ujfalusi@linux.intel.com>,
	<yung-chuan.liao@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
	<kai.vehmanen@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<baojun.xu@ti.com>, <shenghao-ding@ti.com>, <sandeepk@ti.com>,
	<v-hampiholi@ti.com>, Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v1 4/4] ASoC: tac5xx2-sdw: ACPI match for Intel mtl platform
Date: Mon, 23 Mar 2026 09:46:41 +0530
Message-ID: <20260323041641.2133-1-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|LV3PR10MB7940:EE_
X-MS-Office365-Filtering-Correlation-Id: 546d0ee5-290a-481f-d7b0-08de88930492
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|36860700016|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	AFRuO8aI1g6GuZZNRyRf75oTRlfWI9wO4MNvIJi7AqWSYKwMVfoYMc0JYu9c/g1LddWS3HJDsBuFlZ9dAnw7RBA17bljG9fi4kc28DYPO5CtxQ/bdQ5UbRwY6wdR/b3KK4SMSQIL82Ydu4azr6P8igfR0uxond1+1XDtm3sRRpG5HjhWkAWvmUU3Izk754Fvk9170usPbrnfXaTUBbIn5b4allJAJuw8GERlUuNJSUm2+uPI8ryLM1iP+3sIrvk0fdwtLre1BRlsHLP/WWHuantWzBWmiu4GiehuL4WP8cnTJ6vJlDWsmyDecHUBGmGKaMn4I/wt0F0XUkdrYpjcEh3bWUrrunqvy1hCpgPAr1ieDpbctBbcjzcW5ABslM3C1Z90c1cieRZbwRAsKEwUcQRzPG4BOx9ZD8v2q6AhgeyfRbd4yHn5oXxYJyXaTTl4HFF5TRZYShmouLB/IiXdTg4FBk6jKL6MdY1ovNxc86vCvuhTcmXj/KsefLEmJ5QmW9UBu4QLMoBlbZD6qcCKaYpIFiRE9mNAVMG5CCj0dFvkWNFOsF8eRMG8OYwhCphwtZC53AS7aofpzSEJ2nKijxguivTfkaxBRNnb98jWpVONTIENJn5O91ju2c26P5XZaTfUpxGGDMNPvryO34yomg+M/2lF3SNvifXGdNxKwlbVRGqWrXKtIWHsopXJo24Yxyuvz24uWxVbDhWT0DTp/LsJ8ZVzk7FUJ59HD/MJWedX8hcr69Klmj2Bp+Yqq0erptSqVzcsx4AdRLptQq1bXA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700016)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Wn0O3G9eL0F/vEoPCobGMdocBbFzo83rHn7hcxvoiAHRY0EW9fvnoBSsQp/dmwqfl0KEAjdGAFKDMDbrH8RMN8xft9dYjLPFsrK6HrQr3C7ySOr3LhNFKEYypAqPuE7JeegV8GQMxKLHNUpWrXSojHLBZ8lrG+rEDuA7kczQ+fB6WoNanI3iuo8MtIiufxr2bhd9PW+do/HN3mJcFpsR2DZOaIR7D/NejfwlzYU5Ed2WN8xtjjtkPbo8jwXnkvnFEccVnypOAuDmjUs72YKGPhJHA+IJTDAPE9E72cnadlk6oGl2EBbDoKv1ncsbD2o8WPJ8ugsZYxEs7KbwK0Jy/UePxbhklxczMwWY8VFTsbvoVDOxmL3+nX3P4aRDKO/vMJ35N4RCnwdDVyxdjZg1vxlH1dGPJ3a+zNSSPUs27JVLO18c1AFnfSdZQ1T6TQHI
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 04:16:55.0626
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 546d0ee5-290a-481f-d7b0-08de88930492
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7940

 Add acpi match entries to support TI's tac5572,
tas2883, tac5672 and tac5682 on link 0 on MTL machine.

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-mtl-match.c   | 132 ++++++++++++++++++
 1 file changed, 132 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
index 72c35e73078e..2e4222456f27 100644
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

