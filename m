Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011049.outbound.protection.outlook.com [52.101.62.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C0A3A3E69;
	Fri, 17 Apr 2026 13:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776431700; cv=fail; b=AjVw72Zgso6jpU5yFVNAsPlOsvrkjCTRRqoaFDiqpwhITYIbzjfFwpjF/NaYCsHqpxwRPV5QyyJAcygov6TK3RNT4r9tNxE6Hdgbnco/ZTM7n8UbaZXrxM5bhiErXVngedHHcCspUdJJzyq5uztDk2uCj8bmt8NX4nzlk1IFm6Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776431700; c=relaxed/simple;
	bh=iXPa0tKTGn3jhY8D23jdQJwoTRV1jxQWs42kDsr9X8o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=laR8SFF8mvnsvYXyer9Z4+BF4e0jpaAHJqDUoVw9MRgiI628pZxUNzX4v1ZbIl5Ypd4+PiF71IyozjWLXJ5JX8mmyXZwwc66haGhdIEtuthFMDfyO13A74aTu644X5V7I8lqb0PsjlzLhXf/R3KSxZb/lxmvfD4L+MzP7Q9Olg8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ko9x+SiS; arc=fail smtp.client-ip=52.101.62.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ko9x+SiS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TBWjgGt5fKN63s8H4oypmF6gHBmv5pwQUGgiTeJr9LpNSRr4EKXnY1dUefQIaJxoAa/kQc2xXn4BMWXbRzgM0omCxkvmyFuHIvzBA0NPoDjHJLtTMdJ+c0jhb+7S77RmBoYVYCXJacBSaCs+LzW+3Jq+a+viwAeEo85+IyQsPXmmiQHbgTrhuThTDR+bjM29MvpdmYrbZ+9I1s9hI2bi5FaD7fXeIZYYZKsD0P4wNApf44TvCpRMIf+tuuD6mwI154dIyb6YPQH0vq3krjnGrl5v+qAB3VgZ5CFf+hZIpNWkBAGrqQtZavky8qthSUsUBOEJX2F9cC6t7pl/gm97hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DEnUBw9T+TkJ1I1M0JQqHUDWnU1a7na+Vf6TMcBBFfA=;
 b=Vt0l8fSHZSEBWhysUn3e2LFGqM61bs0VNnycHopvzgFgn24AOB2BhylYfkPCwEyLApNVgPhtMNmV4lmozNdMo/koH0Mf6fCavp6bnFR6oRWfA3tcDXdWzFL32qmrPzHA0SpY0rvzGH4fLvYhE3/abXLjaOgF5k5a4jp2r3WEhcQbN4na9sel9ptc4i5Tx7MnGIqjNJ27DA8Ht2vusktlwMWfeI9bL5uiN95Rx2hdXNO6N8e6P2M4JYhxXxAuMNxSWqYlmniqlX235y363/Rp73gmo0BKF3sBo3ccDhrJBCTSnd2ut7ErH0fbR0iCY3QAdIeJhbQj0ZtqA40WJpi1Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=linux.dev smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DEnUBw9T+TkJ1I1M0JQqHUDWnU1a7na+Vf6TMcBBFfA=;
 b=ko9x+SiScdWgkTpkmPVr4o9pE6qCkttQTMYqmDBZW//kPP2/9L00wc3/m3edkmRNA3rsPg62bbvOCIfNhUwq8a5Me9tKOlry8guvNdnCzLp1v7sPl9hW1z5UteH8fi0/YATPp/0AX5Wl28qTmB/11Wrr6vR16UA/06x+OwkyVZ4=
Received: from BN0PR04CA0046.namprd04.prod.outlook.com (2603:10b6:408:e8::21)
 by SA2PR10MB4523.namprd10.prod.outlook.com (2603:10b6:806:113::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 13:14:49 +0000
Received: from BN2PEPF000055DB.namprd21.prod.outlook.com
 (2603:10b6:408:e8:cafe::b6) by BN0PR04CA0046.outlook.office365.com
 (2603:10b6:408:e8::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.52 via Frontend Transport; Fri,
 17 Apr 2026 13:14:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF000055DB.mail.protection.outlook.com (10.167.245.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.0 via Frontend Transport; Fri, 17 Apr 2026 13:14:47 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 17 Apr
 2026 08:14:47 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 17 Apr
 2026 08:14:46 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 17 Apr 2026 08:14:46 -0500
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63HDE59B1770830;
	Fri, 17 Apr 2026 08:14:41 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <broonie@kernel.org>,
	<ckeepax@opensource.cirrus.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <cezary.rojewski@intel.com>,
	<peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
	<ranjani.sridharan@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <baojun.xu@ti.com>, <shenghao-ding@ti.com>,
	<sandeepk@ti.com>, <v-hampiholi@ti.com>, Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v9 4/4] ASoC: tac5xx2-sdw: ACPI match for intel mtl platform
Date: Fri, 17 Apr 2026 18:44:01 +0530
Message-ID: <20260417131401.3104-4-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20260417131401.3104-1-niranjan.hy@ti.com>
References: <20260417131401.3104-1-niranjan.hy@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DB:EE_|SA2PR10MB4523:EE_
X-MS-Office365-Filtering-Correlation-Id: 3763b03a-25be-48f6-0c8d-08de9c834ce0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|36860700016|376014|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	0f2OVpsT6+8REHqgosjy88lIYvQ//blIKtXegkzupso8tASgXUWsrSMyoBoKs21+8YEqtENBoa83GSTUbxnwJzm9aovIhOH7KumF07FiysjpvxmG70HnfobQgLU4ea9lNgXES9P+sWMrbOkldmn0xY0fsNdEirqaEDe9fITgVSWy/SUTEwKDvgjlrPjjY6+3E47azpBpwQ2AIFSDvUbu2X5DDhZAxPqEkSFSLOrAcstFBcLB7WLJYsnLgmRNv5hy4lOTs/NYo1HO5y1lLcuxBts4PC4HNgnab9if9j21AZQ0kHO87tRP4tunDb9LZ4ApmzOIZNprLKlaqPPnaMbwr67rLTMJpaGq7utCU8+ESm2BzoN1ZTttc8VEmPBaz/MxWgVBWoOwcaA+Eilcqm2KH/UunjxE9Qh1U6/fjorNljkaCeO4AiMkaX6Pgg0a6uUAS9h5TTOuDjtwd+ZXhzwiWzECeJviYWBdZYuI4+e4vmAbf1nQ8BupFuGMR1yhhWaQ6i4e/04HcScdK5sjSLVR5aMtkrT7qpDGJJyrcqt5i5A7xZaeYzNR1szrWHg7STOH/N3CHK9T5Oz/bSA+smf+LTpuLTFQbaUFdgxSU4LhL8StieqRn/rJNyggp6G0rCZENCB//r8k34JD1KZlPogFfFg6m31eOzq3hWFYsNXuGu9E7SYKdJNLOvoNy5DaeGkFRaQbpUMlvdApAnCbTmDtR/0UqriKDc8HfuHuDbZAKPMvdIDT6CDLKfMR59I/07rU99/u0noKZV0P/f973pKUgg==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(36860700016)(376014)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0d+Fgib5EDNRp6D7I+yVk2X6MLXNCqF6Rh41nRM8UhqeshL9Qiic0c7NeDw6z2IQOFD4iEGDl8B9WANkBmaw7bErs+Eso4JIm4tA2LDiQDJTNWeN3+aT2xc6Pga8kt+GSX5BKniYTrnioN9wZRDeS2H1KJPSA0nRPI8N1BeG7m15msp+nfOGYK3IM92HMEVe/MRRmniSjMsZPzUVnwH031dEUGd2x0r+H95b9dwV6CtpJlwqtLhr2Vgb3Ii8xBaeNmC+xBxmDj+9m6p28MY3RspY4wkLLS0uK3wgLdqUCGKTnIdtYT5KoUpbbwGJ3XIb/lWTj3ms9ZeOCs5WtflmnMPyKvNQa2G+cssneL/ggBg+z65Bpf+zsvkLTbO00ZQ/pbWROjvVLrW+wGUBj90t37lJhsVSKqUufbVmKxFEV0GlhZ1tRH4irNzNXyfTk5X4
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 13:14:47.6347
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3763b03a-25be-48f6-0c8d-08de9c834ce0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4523

 Add acpi match entries to support TI's tac5572,
tas2883, tac5672 and tac5682 on link 0 on MTL machine.

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
---
v9:
- no change

v8:
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

