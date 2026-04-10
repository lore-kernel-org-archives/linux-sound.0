Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012046.outbound.protection.outlook.com [40.107.200.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C34D3CBE86;
	Fri, 10 Apr 2026 14:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775830420; cv=fail; b=B/7NVyxnFesX61DwSxax+BatMa+I9GKcLytePUQAR/HxZDbbzjex8y5OtR4D5QQc8lrYrIiW7x8ooSwipK/A8SCB44wBJvntuIE8dzKxkx3uYvucmEV6dvW7560s5YLZyoWTgMd/fJeiVQctGtSPntS90E6Iv7zQCfxF6xVKMIM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775830420; c=relaxed/simple;
	bh=F1WmAmGLM9TfgKEnSbzoNEt3T9OP40Hc6O41cxXi9Cg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ux7xijkKwaPYHMY7/U4gikTrAmEcU5mhkswxjTYFl/C2NnGBa6I2kMlSI55f+2MsEiZ8wqo3HDY8tm4SvOlHlAr31clNOzGngjcROr+oejMfI6R/dSHAZd7KnI2iNpFkJd/U241+e/fiLqMwDL/V4XAI2bVOpyRI+NfS3ETwILY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=kPvNtZYl; arc=fail smtp.client-ip=40.107.200.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="kPvNtZYl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N+wiSreTJ0XQ3S2m6378brSxaxi0kSTsTHm6AJ6rrdHt1nCVLpBo4uJsvXRyPXh8ynleAlszDNwaenkQ1de6k0dJZoe1mDESlEkROdEs5m3zf9l8oDP/CRnuIB4kCFVCQ2HehmGwulXgX56FEWQfNVjm7bSwOy48IB9qs6LJOmuocT2J37QRo/wUyVksfLhXTVsLZekCWTQ6AhJGym0DIawaohpC8EK+LaPRbHpaygtemRbxnRhGkEhyyUAPSqDLX/O1JaxSIJL9PpRoJOP75DeIa3pTjOhANRnpiTe7eIYRgrCaCTfsr7kKKTJNXdAMn0KE3H2YsclimdlYHuZK1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=718RjXf3zv6u2z0209idQBvVQdh5DE6tychLblv9myY=;
 b=Fc/2zLPZ1uFEzRFGakrWsqqz//wU2mrie5nDXb5IkJKVrBfvzo1qoIsy0GiC68+U9SfJKmcPzhusJSXJ8CU9/iQeJcp/5JEpGfoyrkyiQhQc5yNOO1Cksni733QJM7YRNR4omfc2ddwgE1uwHMa1IsbF7b+Qh+9UEv4oPNppTn3fuI6vLFN7nD02/PG7UCjDhrkIgrX1n3mkQL6wjRfYqd32bFtu6cIg4lYthpf7oKIUmMgzkadMQYZBh4P8wcvBxKnNt61Z020M+twKf7KMk2vOOOJU8YivA+CdKvWJgE0qeWEUG+pHUs30DrZZmKJy+MmvGc+Ocpe6Jl7chUziiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=linux.dev smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=718RjXf3zv6u2z0209idQBvVQdh5DE6tychLblv9myY=;
 b=kPvNtZYlUlPA9KBpRR+pptPJ3saX2aVxdsyhamEXkCyEuwY8S6vjU0SvbdV/p7dwaIyJxPMpib7NErJPRpoQ+xNKX3iKkmurcxl66yUW5KELnqZv6ITF8bCMbLBhfajxkqW4oovS5+4Y1fcQqCAKjPyCEGaKNzpJVInTD++LjxQ=
Received: from SJ0PR03CA0342.namprd03.prod.outlook.com (2603:10b6:a03:39c::17)
 by BLAPR10MB5091.namprd10.prod.outlook.com (2603:10b6:208:30e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.44; Fri, 10 Apr
 2026 14:13:35 +0000
Received: from SJ1PEPF000023CE.namprd02.prod.outlook.com
 (2603:10b6:a03:39c:cafe::68) by SJ0PR03CA0342.outlook.office365.com
 (2603:10b6:a03:39c::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.43 via Frontend Transport; Fri,
 10 Apr 2026 14:13:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF000023CE.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Fri, 10 Apr 2026 14:13:35 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Apr
 2026 09:13:23 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Apr
 2026 09:13:23 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 10 Apr 2026 09:13:23 -0500
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63AED0Ph318380;
	Fri, 10 Apr 2026 09:13:18 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <broonie@kernel.org>,
	<ckeepax@opensource.cirrus.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <cezary.rojewski@intel.com>,
	<peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
	<ranjani.sridharan@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <baojun.xu@ti.com>, <shenghao-ding@ti.com>,
	<sandeepk@ti.com>, <v-hampiholi@ti.com>, Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v8 3/3] ASoC: tac5xx2-sdw: ACPI match for intel mtl platform
Date: Fri, 10 Apr 2026 19:42:50 +0530
Message-ID: <20260410141251.5563-3-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20260410141251.5563-1-niranjan.hy@ti.com>
References: <20260410141251.5563-1-niranjan.hy@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CE:EE_|BLAPR10MB5091:EE_
X-MS-Office365-Filtering-Correlation-Id: a05c3592-0c04-49ef-f7fd-08de970b5a7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|1800799024|36860700016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	xSJHHF4+PqzZbf+Zs+fwyUW537hWVHXUT+bzdUr2XLSF74LA95EtLKYgzsaxXUagFucrdKKuZ8UMZfNYyjnxpegmFaefOU3I8O+CWrUt8Tnzxpd6pfvpidI9/NdthfqxjF6XtUL8E+YGqXKGWL3E+GgwwNBjBXWGEY/j5MPKexAUZVE+aLpJeNH6TyryJy3b16Tw9oghz5BM6G+50FhHYcD5uQAh9qBAsnkTYxf7IA0YVOTNXgGgzCWK8Nakp9XgYJ43q+prqnKSsBNldYrlBwixUiGNFvqBbRmGtPIotO+xLWTdzCnj8WXrSixnBD13jKTtSGO17ZSZm3Vi7YBTtNF+cKcFRPoSX2dNdyse2FJiCI/ObC8XSGQUBa7a4PYgVL/AsdCQTmUCwh1lUzC7pTYD4RZ1BtAF14M1v95+wFscrgwv6QqCVXNhGT1E3hUwgFV5IBrL9ul9ihNY0vLZ9FQlgu4ufZzFAtuT2l+9qcLY5orN8YlfZ5w+qtSo6PH8KyCADjokd56L9XsU5yH7qEesoghfmwz4ang2YMtt7rwZUy2WE9IZHcdEI4VJ+iuZr628BqC0GtJS0wo6SfEY8QDY+XBoxFRUrSO5AwG/4jCFwVbaxSE7EmFSBnWhO5eCxpQpn5rv5kfR2FqxMzc5ZPNQ5GYnKra3eVDnSqjA2MkfjcE1p+XmEAKRJAdUtE5Ke72EKVr8YCrFH2WpcA0QpYzLIMJifcms0W+GRF65WkuFN2GFKC4sWWSb5v3nKx3ILsZMn/6CqHdI01o9wEdScQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(36860700016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8YgcZpzPulL9zhweHKMwNYqWm5SoMoZzn1meVyNbKYd2hU41hlNk4aOw3SUjj91U4/SiRTq3+UNIjrUxp0yt4pWfAuAOMy1G7BE3/phelneZfbxaBodqdIWknoNgba4Sqy0fEHGsZY/jl4GBvld7FdxkdMTROPcdpNV/5mnOyYmoD5NoiklmMUWro0f8hQ3t86A9RBThAm+zXqv4uL6K9Vee5pvyjsZPW2/uDm+/Jn5YSFH6IXh+fvZw7LLJjTnAEkJ9FhOfYGHPSW2TRc61OdckFVQUi9OekObq93hsHO/qKzZN7fMYU21IV4a8rhXJQXyvbjS2LSPtoNS5o/z1WUI7S4pH7H0qIAJJopQfsjW9t9TbUi41C7UlPTvdszzRpN+BDAA7eFfSZmtvP3uLam7d5K69N34iuV0weCoPlAwaIzeFlTtqNCt7c8MMwTTZ
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 14:13:35.0268
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a05c3592-0c04-49ef-f7fd-08de970b5a7a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CE.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5091

 Add acpi match entries to support TI's tac5572,
tas2883, tac5672 and tac5682 on link 0 on MTL machine.

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
---
v8:
- no change

v7:
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

