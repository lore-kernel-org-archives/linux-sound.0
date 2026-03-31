Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012046.outbound.protection.outlook.com [52.101.48.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77863D8114;
	Tue, 31 Mar 2026 15:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774970251; cv=fail; b=CT3kWkyA9PCwCuySppKbWfkjmlnfDWMiWGeujeNKjnLwxLBaSiMjLgfZn1gVL9b3ebZfLEbq6FQ4AwpHhIPooHTiIkcRTKB1NvVZjFysWMxAAC3fZDPhKI0ChcKsXNOwWgachf9WHSdp++LOCH+AYUNaHjAu30OvajijsPDSj0g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774970251; c=relaxed/simple;
	bh=VrFsU+4UY50zVkDIdrPgYhVLFBquue30xvVTNTOaVoU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lUvtmP25KNRgTx5lLIRsXT7GwYZJ/FAI87qe7ouVaOFg/4quRCkmoNOUg8+9Y82G2ugw/gxjqrkd1crm65HjNHdsGHZ+8wG5yz/s1LIYhy/qlEZBwUh45b2YweETdBWriY6iGJ5B8mkBOpqgtfK1xtQcAiLDkVMtoqjb5TVjCHQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ImkdgIGa; arc=fail smtp.client-ip=52.101.48.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ImkdgIGa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tCWDrm8z5xy+PQ45DJJSxMzUeYr1Fbk+M9Tol1xvhsXcDlF7XUG6E48paOaGzAs7juH2wqFCPPM0+nEDxpvcIWgw7KYkxRFT8hqRlKOsUjVFX6hdXLcvTC591De3bPq8xxavC4r+g13T8EgVgHQgDuTO5PGnkKqxlwzqIjOwIePVXcuW7mQ1ZtUulxX+WAgGf1bMtNMgpWTDG1zENTOsl34WjkGW/6tm8F50BGM2c6/ghfxCzlNubyynMxIChWKaVfzQjZBPXXwQA01XK45FkcNxm9Q9/D7ev+H6oRR0XF2rI7GfAc/M3bqM+/cgz5sjEpEhDtD9u/3FIskA7b4Hig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lo7T4erZoPQ0YG2cjs7zhaFxXwU8qfDiq9afsMvyhrE=;
 b=meIrIXVjMeR3MHH96f3wswL/aBlqHd/QI+bwzs2MfVJpk/p5xG75iMCDmzHUJyxvzfWHRPCl6va5lx7eG0864fSwbnRVd6T0zGhlaqL6tAsn3WCOIqXfjKxzsQH/NouIHtVwHncxOH4zTGffYp7ngOqo9cT8gyZWIoYdLMd5R4oZRl9CU8N/7dr0IPHBod5YHdeQYYXRGY9n8qbUtYoCQmGMSF6XSgn7fgPrUZl7qey0QPEQSP2mqimw/m3q3rA45fbJ3HQm9DDlGOmcmuWpc7lJJ3J8VtxJCjGvoaKEzPZ+ly9FKOMFs3ibQt4bc16uHC2l/oCCp6ctMa7oFAIhtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=linux.dev smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lo7T4erZoPQ0YG2cjs7zhaFxXwU8qfDiq9afsMvyhrE=;
 b=ImkdgIGa42rIZJmEARwumtGOBImsbU4c5FfACK/p/xcY8bSzptCX5mxYnJaUzR/JTFS8QyqC0GeKSya6HEugyqaJFf1XLEX8W9m0SzUTwE6xpHssESRBntb1n2M0kl7QVUYSPbaXEVbceb3H2kd11g703rEexeu24ctMP8jsbOw=
Received: from PH8PR20CA0018.namprd20.prod.outlook.com (2603:10b6:510:23c::28)
 by SA1PR10MB5821.namprd10.prod.outlook.com (2603:10b6:806:232::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 15:17:27 +0000
Received: from SN1PEPF000252A0.namprd05.prod.outlook.com
 (2603:10b6:510:23c:cafe::e3) by PH8PR20CA0018.outlook.office365.com
 (2603:10b6:510:23c::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.29 via Frontend Transport; Tue,
 31 Mar 2026 15:17:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF000252A0.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Tue, 31 Mar 2026 15:17:27 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 31 Mar
 2026 10:17:24 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 31 Mar
 2026 10:17:24 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 31 Mar 2026 10:17:24 -0500
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62VFGtw52994147;
	Tue, 31 Mar 2026 10:17:18 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <broonie@kernel.org>,
	<ckeepax@opensource.cirrus.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <cezary.rojewski@intel.com>,
	<peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
	<ranjani.sridharan@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <baojun.xu@ti.com>, <shenghao-ding@ti.com>,
	<sandeepk@ti.com>, <v-hampiholi@ti.com>, Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v3 4/4] ASoC: tac5xx2-sdw: ACPI match for intel mtl platform
Date: Tue, 31 Mar 2026 20:46:38 +0530
Message-ID: <20260331151638.1281-4-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20260331151638.1281-1-niranjan.hy@ti.com>
References: <20260331151638.1281-1-niranjan.hy@ti.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A0:EE_|SA1PR10MB5821:EE_
X-MS-Office365-Filtering-Correlation-Id: b8f0f4be-779b-47d1-f206-08de8f389e64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|82310400026|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	UHQBTVjFpCuW/fxQKvHOgylGZOT0642inslNqApOpQb0RcUY6Hwi/V+H06+KwHUksOJ7tS2IBurHdTTTmbp1sVAckeAwGwG0lpFvExWf2bH6aM3Y17AUfw7o6Ud0k7MmrBY5FmQniuQTHpvnOuZuXePCKCFSmfEOEMBMuVwD7Tv4G0Cwhoj1O0yxm/d7r4g5CZXPzaIbsdSaRSKC9ZrLXvKHncZKWCViOaAW0iAPnehoGquh3a1G0DS0v+oVOJAnpu+p20NN5DsxtS+JvyeydAp6KL8RJ1aXjkkdZbElePbDLhY85ksfBMORCJ97izW1KsuZjXjRM09nCGzMKW1OnVAtfMK7vo2KU4kp7zHWC03j+FxRGgrwNaz4eaQJMlvvdHEgq9RcvSTlbf4qsFfA9Kqn2KE2YL+gUGO8JYf8DzBBG4rYvhbxwEzop+b7cM5EiN6AJrvxeiepzX/Pg4ego6aBCtiAK2kZH6gu4oNOY/yVdEZxUeSAdUlhtcJGo3oljWXPk4gY0qv9Z5GVC9GUZ++MNgabukP7HDYs+Itdzx2gc1BYTHwjlGEooEwvJ9wWr3j7O8cUqYkd5T54ALSNBxdaPEq/cnsSwd35Rl01qMsTm5Il2pbIj1S5/nAKsawoLs7+vETuR6KlG5a7AbJHZb+OqUrsARvSarZuwTvt0d2tS5a16/yjADDF2H5nSZ6E9t0+l31Q1O8zVHGjdOiv/SUw5HDIMNT4Wqw5o7rYL3HWNx7S38L10cB3jBszKYhrgun82Qmi9FUIuk2EkhSjww==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(82310400026)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pUMmit+fhsjo0SMSv77XN5Bs9SyNdRv/62TQgDf4In7LQEeemw09WQMR72Si5RPBstjUFNFX8w/iGNqWPhmI9St2g0AGXmZMrIrSE+8aRcKFse2eyXJaWv45C4AOPWb8pYJIOXo6UE/oDQtHstQ3nOD6QG3bAqBzez/HnMzp5qdBts1klX/YrWXHwCCdMIvQ8npF+07bCVaGtrhow/BBs5J56LZUEnsQOvTm/XN2XkZC8hIblAOra4UTJHhIT6Szzlp2tgWxGLKrfGWEYyWQjhIYNN6bFEctLe0JSY45FFat3OIrzWZ4fkLBBNMOrMh+PGznGm+TWHs47MHIDVyYd3Rg+zQDXAQaIhW36aZWqVewJ6Hpl3xuJC4mpquAWghnynAnd0oCx7Yq8e8EuA80frxkY29XMYnwsMephwgRpWJbCVa1XWJeRi88rLkitQ1E
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 15:17:27.0866
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8f0f4be-779b-47d1-f206-08de8f389e64
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5821

 Add acpi match entries to support TI's tac5572,
tas2883, tac5672 and tac5682 on link 0 on MTL machine.

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
---
v3:
- no change

v2:
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

