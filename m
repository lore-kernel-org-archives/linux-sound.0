Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010013.outbound.protection.outlook.com [52.101.193.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4732881732;
	Tue, 21 Apr 2026 15:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776786596; cv=fail; b=Qa2seEYo3a6ycxZkt8N3brOrk2QteU/iSWonGQ8sdtnHNh1Tlj0tmm+dobPqYG8SQTCg0NHmLVlBfmNLfIKr9brbKZ12SfVLAzVJtNcf6rwLzw+FyDf6RYjf+p4y+gVexdNePmYdtQP5EwZYeFDfGvVQ40xdFHfH9V82RW2SCXw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776786596; c=relaxed/simple;
	bh=HeC3FNjbpC+09V+B/5Z9/unfB3oDz3DGkQGxy5YhqJw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ca2dE6PYNNluG7C3/Ia148J7bi8Zk9SvCWcFSHFcineaxo/f9M4VsEKOd6WbRMEOYp6as+Xjv9SsSXX4Cq1AGPwPSfyAKKqyDtdIJMjCwyoHrQ4exBjjhNvkhc3DTcg4H60M78beW4AtbqKp76LEMe1fQc308kNdQQUelfpX7Q8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=hb4xD+Ut; arc=fail smtp.client-ip=52.101.193.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="hb4xD+Ut"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=muTK2nNf0jqA7DBNdA17+ahrRFwkX7ZKlpJoJwMtu1o/adTNnCH1jO8XsGbGDOfELL9EVKKOiipFVFrCjnlp5JydOupOs2mw3DThG1liLAuzkLLvZsNQ25KoVlur2kFqmag8T/539WU/+s+rBHrUeexijML0W+Gcbkg15QDYIkkxvVNc/e8h6y4H+I7vzLFcNnP/leuGIuiUxl9BeM0/KLqiHhT7DF8LZCJuWXxOa4PB+b1Mt0r5NnQ02eIqDBo3+nn9fJ2DMg++XLfTIgjXQcc03eHlHhj8vpr354iDk1HxueADK3VmCmIODHj0vJF2cG3GuACQ3QIsSeqjv7Mrng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eSP3sfBSrs0LY3ZDWK1XIghMCx5bqXTIpBgRS+T2dOk=;
 b=fBILTIK5QEZeNFKDqzentnowCuwfJPT622PRQnQ/EuYho6s26oaVWBAr6NYkPA87hvnaBhvZRxy8Gv5gdGeUd4oiqFEpF37VZaKpuoXYWBquNuwGsONf9HzUQ83lMRszTdnWAIu3IloUWpg3YsPnpvdJ6X9aikXKvPLIDnXH4RVvFUt7sUVLJrb2eylulvhy6zeebyOjzip7NejmJsM03mCF6K9makPrBXMfdZywx/i3xlKZ9/CDmyjRiDRVBXEjGhFB/QbdjALuYMEpaJxvqLRcwfHTspU0ikAib5blHFS8b8jh163nrFFrYU5qprIHhNNABO+x0AWjzjzUF5O1OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=linux.dev smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eSP3sfBSrs0LY3ZDWK1XIghMCx5bqXTIpBgRS+T2dOk=;
 b=hb4xD+UtSWRn0G822MnhXszaUSwqnyacGtQjcHRfj49cqUW9Sm/etVZbIOpTHXkNrJPCXZubg5wvjsO7GACD8/oRJoX33SiXzCMOe/H2igPIMVgUFJfI79hv/lFhv71ew5s4GcL9vqu9GfSvOlv7dmiwR5wRdm60eLzKqFkCCtU=
Received: from SA9P221CA0013.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:25::18)
 by PH3PPFA3184E4F2.namprd10.prod.outlook.com (2603:10b6:518:1::7bb) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Tue, 21 Apr
 2026 15:49:51 +0000
Received: from SA2PEPF00003AE7.namprd02.prod.outlook.com
 (2603:10b6:806:25:cafe::c8) by SA9P221CA0013.outlook.office365.com
 (2603:10b6:806:25::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Tue,
 21 Apr 2026 15:49:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SA2PEPF00003AE7.mail.protection.outlook.com (10.167.248.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Tue, 21 Apr 2026 15:49:50 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 21 Apr
 2026 10:49:24 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 21 Apr
 2026 10:49:24 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 21 Apr 2026 10:49:24 -0500
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63LFn3U5522085;
	Tue, 21 Apr 2026 10:49:20 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <broonie@kernel.org>,
	<ckeepax@opensource.cirrus.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <cezary.rojewski@intel.com>,
	<peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
	<ranjani.sridharan@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <baojun.xu@ti.com>, <shenghao-ding@ti.com>,
	<sandeepk@ti.com>, <v-hampiholi@ti.com>, Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v10 4/4] ASoC: tac5xx2-sdw: ACPI match for intel mtl platform
Date: Tue, 21 Apr 2026 21:18:04 +0530
Message-ID: <20260421154804.2670-4-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20260421154804.2670-1-niranjan.hy@ti.com>
References: <20260421154804.2670-1-niranjan.hy@ti.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE7:EE_|PH3PPFA3184E4F2:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bdc9425-acbc-48c1-3116-08de9fbd9f49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|1800799024|82310400026|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	W3k7pOKDt/qqU4TSxtQikN6Qdo6tnfe/aIHnZopROvUkmg245CuG6EtoavRfWwxSo3VkWrgMfbFiMG2X0nCNbWiCTjz3ippxha+AI0613cmxU2ipY7GLrZdo4U6VK6IL854tzM7MeeVLSeKORSd1t1rDgyfDq/niwSu8yHFE3S+vzFKyVwCihgoRSRepRyIZ+H/LUHVp++WvnBJ2J76vDOhJQZ9hp5ie24L1pxve+3GFjjBIkKjti6kQBCoFjOCsj0L7W+TbVI3nuaZrQH/QwbPUMF6wvc4hVI5CsxkB2w2EBCIpU2rr0SkmKQZ8oJ95qVQMU+oTM1O53CtSFBxFinwLipEDJmJq2mz3fy9q4X7TBLtqIJUvSeRAWYbXnT18tLEzbNXKCDKTiJS1OXdNEo5doxzKYnknp8efJaNf3z8clI5Z1rapLmEjZuoiXQ8rYZZOK+n38iEeNpMRmhs/izvaqLtey0Yo2AyJ6OoWGMrYy0+jmR2CILMW6m5WyQohqjyU8Tcwh6VykU5vPxuee5RwK48MIWxlgP5Pkp9NkakbLgbMmciQ7NJ9svvXWiY+aq0El1j01FBfg7tY16AxRvEdxJJu7HxgW1EGDmSlFrDlzmqVh/P42X8o9EaHQmTw3WQGntUEwBFianqZ5Zju6TNom5eXX1b5rqJUSDLaxjO/oHJ37yDs/WlVf9k0+WSSkS124vcWMTGt49i6mcx76uochAnFrKhi8RVV3VpD6OHYl0DwXELLPx+ehdI8ckZN78qooj17TQbka7w190FQVA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(1800799024)(82310400026)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EjugX1wM10W/bpLOs3yc9LC7MVK8YGiI3w8LdH69LARbuFcmzbN8/pLrVrN3NzAv7NfHDSf9aUQrG8DNQdgxDKSVfoQL1SbeYjN3k2L5GDAiTfOE1WN6AZpkcUzmV1QnosyOHSaGHSuEWDsaDhx+qYKUKh1onmNmMBOOr5e4QNQLikhuTMxLknyiIFUjrM70aMjINionwfGSTofUfdFWJg+K8hLB1kHjyxtVN43w1d0yayDGC4sKZlCJu5P7tQJz2NjE0NOanQTyuifVY3VFM8qmJ77HEBfXLnXCvVPzl9Hf5wUXjM6J1isVPmkqpnttqu0697UyaaWpaB4xG/LxEy6o1cEumCkcoHGiWbvwJXPxu0aAEqjD1p6a9fb7HTmxypY4m9IXiPdzNKdZyi1EhiveqNgZxxx4uTJAq5LZzq4i6gQ53omqase+LzrKVZtE
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 15:49:50.2341
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bdc9425-acbc-48c1-3116-08de9fbd9f49
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFA3184E4F2

 Add acpi match entries to support TI's tac5572,
tas2883, tac5672 and tac5682 on link 0 on MTL machine.

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
---
v10:
- no change

v9:
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

