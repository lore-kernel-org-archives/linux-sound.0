Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010035.outbound.protection.outlook.com [52.101.193.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740673988EE;
	Tue,  7 Apr 2026 09:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775555361; cv=fail; b=LKH2xvbD5WaSlSuTnsbZcvdoEXQq16DDEI/uBVZIWY7nTpRYFeW5af7Tu6vJzP8URXRGSA6T7REzshEGHF8BV0QZ538sBSGdu0Zxijl8Ifvt0s9I4e3mI0dfDKtxIvhR07LMyDETJ3y2FfRKUZV0Ukh3iYLtKE/P9KxtEBgvx4E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775555361; c=relaxed/simple;
	bh=WFkXQsHKCf/Gzr6l5JsB2KFfWIs/gq+VgE/Tenc3hD4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qXKJcOl9P6o7IVAQ7O6itBjMmtv9C/KnRWh/faUajYZyDijxatznAvghH6bYvf8xdEYQol4jbakroGg/EYy5uQ1l5KI/HV0/dJH9FCLmxye5Czsrnr8i/iX95YiGvVFYcciSlK7d2f9HUMhi3BFASaKAWtCGq+soERSNKqWIIY4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=v8TnkRct; arc=fail smtp.client-ip=52.101.193.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="v8TnkRct"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jYUeq2GJXxcOb4+PAXFANLOjW3yFSHBlpImzHRJM5AQirUffXRBk219t22/SR+cZIURroL6fiqyKdtQK8t6msBdQ1IIO4s2SlrGqN0OOD7DXgN6ZAOB7wM0QZCX4LhvF/3nRXfZfwSCf7SRtIOSaH5gmctHFSeSiDXD/27blQAI085ZXF93mrghFERH4BrVEBDMmFUQLuDt5sNebgRZZklFbga3rBy3pu70kx523V0k+nHb2ADHImcpE0nh3HVZM1k2PUCtTCCBIkKQ9jI22upQNUtEOgZhW9NzP1JUDY7sHqa1DZLZOUnyACIPK1qczChq+pDG5HMBOi+FTtcjSEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wEhE3AQxLFH+xHKaUXj1H1+p/tv5Ue7hcWnJF2L5cWU=;
 b=W/ea1AynpvlK4inQxAqtI9mba0ljX55iRXAUGXS8zyfLym5BTKGqkqv7ifNHk8rqcTe2UVlpc5Yr1XnaK1dmH+EJtoJGsp30l3sAvLmBfz4KlGnU1IHIxhcx3wJCgS5vYT8KDzV8Jc5A4eM0qSTPtLVu9rCDW3uLD+eHJIMPJz95OOWzCwN0rcJaZ2OkVCr6p/k4rW39wtu7GkssBMadlspDtL2ckxGXyZyaSj/R1Gx5Fue3hI9PLS4dSaY3tVj0b54Og3FUjT0iJljZ9V9GPJ9iI/4CvbW4QdY6MgEzEuUHNpQ0yRlYT0lWECX33UFSKcZNky1IA/ICOnfp5lUIrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=linux.dev smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wEhE3AQxLFH+xHKaUXj1H1+p/tv5Ue7hcWnJF2L5cWU=;
 b=v8TnkRctch2OHEADajyklvpkwVADb0KI+Gtn0OhfoNTGSRHTdJWCBtlD835qTUMsfqY+x08adGEhcqFeLjbm1enFrRaRKCAWjmviqjAKpPTW8fNNmPtki5C9o0ATAbGuX3gbKI8/hsQVEwYMO9fG9MD4ieY3f0NVmA8MdVslLMY=
Received: from SA1P222CA0145.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c2::29)
 by MW4PR10MB6347.namprd10.prod.outlook.com (2603:10b6:303:1eb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Tue, 7 Apr
 2026 09:49:08 +0000
Received: from SN1PEPF000397B5.namprd05.prod.outlook.com
 (2603:10b6:806:3c2:cafe::38) by SA1P222CA0145.outlook.office365.com
 (2603:10b6:806:3c2::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.35 via Frontend Transport; Tue,
 7 Apr 2026 09:49:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF000397B5.mail.protection.outlook.com (10.167.248.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Tue, 7 Apr 2026 09:49:06 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 7 Apr
 2026 04:49:02 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 7 Apr
 2026 04:49:02 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 7 Apr 2026 04:49:02 -0500
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6379mhZa2330927;
	Tue, 7 Apr 2026 04:48:57 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <broonie@kernel.org>,
	<ckeepax@opensource.cirrus.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <cezary.rojewski@intel.com>,
	<peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
	<ranjani.sridharan@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <baojun.xu@ti.com>, <shenghao-ding@ti.com>,
	<sandeepk@ti.com>, <v-hampiholi@ti.com>, Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v5 3/3] ASoC: tac5xx2-sdw: ACPI match for intel mtl platform
Date: Tue, 7 Apr 2026 15:18:29 +0530
Message-ID: <20260407094829.2391-3-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20260407094829.2391-1-niranjan.hy@ti.com>
References: <20260407094829.2391-1-niranjan.hy@ti.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B5:EE_|MW4PR10MB6347:EE_
X-MS-Office365-Filtering-Correlation-Id: b95f4206-c2d6-453d-4695-08de948ae88d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|376014|82310400026|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	4Di4m2aHpsFQW/SnJIw6ucKmVU8NCoU2sjhLUzQ1HveKHE0gCDYBnefQw1HJ0z97NtvYJ8Wnv8MlgFMTIoneGKv1qeDbYG7k28pYfSUsxWgfcg+md+E2e97yLcPWk/wPsDIbXM3EHkO3SgOayfUipCmpwg0r6fAUcohyBLkKpQia0yuMFZPWXe1QA2DFnruX+J2ug6Bh5f911umkMFHrTsJrFVrA0RuWRiMFEt+uHQJ9Yg6IYBc2bkTzbDsR0SoZbSur5i9uO8mWmWCXG5A263n6nBTYYUT1I/10v77lQrilNjY+BCAKfqYS246FZ4FiOcyHlo6XML/zpMAbfw/Z1bvTEW3hiEfGX3ZyFKTYdIVPM1PDL2LdNcRg97TzsLLB5+1c3lwax42xEHyeGZrNH8c39tuytWE57+Yetmm++xxSX9Ve8Wh2PY2Y/yVHv7HAbkiLR4Tu+s6Tq4sAr6i2VDh+bjPVnd6qNxsYxPLu3Y2aUTZaoqIqMUdJvxLoBmLwyoi1tykiCE4GUcErsQ+mFCtAMBfxmBkp1CWkw92f2EC32MGILInWNeMi9T22Pc+LVq8ZiBlD1J39i+CIMWo+ddDZvyU6xxUeBXBEKCi2bC1X3uo6dY7N9CJsR2t0lWLxT0NVhb9Wc+R51u3bDAkBBbAY/E8qS/RjOnU1L0Lo6iQTRDiv+o0lr35RvuWtCM+zhK/8oLFg7cgyub6VlzUi7OpY4JQcfkdtVq3Wqb9wbChfcKs0Vu0BpZbnFceDjtUcyxispPDSJSCLwSgU/kCALg==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(82310400026)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bfXIU9gNfJC+lbfnokAB9qHVCVqsrJNZ32wn7Z+RLrAV6EXRKCXdT5gCsIhkokOdGnSZOdJY0uCqjcHprJUaqtZtHopENnFcboDCVjGW1xrdZfZ1o8EBraEJSCL2mjaHxYV2x9NyHgN+MN8UjqGcPaE7uOnAnclKw+MNXkXF3GyEZhF0SwBt7KA0vH56T4KLQxMm6cE4/siEQ4JCBWxmvOG+VTHsmYkwFdWloRMzHy/5Jz0ntUhauNeMMqgLAkFMeksPFx7+fHQpJwMk3GZQcp5CgdEadDirEXBhmYuNp7FRZGdFF21dgIoD9fu5t060T/rYDa4gyk1mu1qOT78Cmv93OXr62j7O8Bw/mBido/OSV0+iqGvZzrwHox6zHVoTekkV6lCk022rxwgyMQj0J7foN8jpwh8Vh5FSWCONQDLJG9TNgGzv1xEXnzuKN1cA
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 09:49:06.0460
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b95f4206-c2d6-453d-4695-08de948ae88d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6347

 Add acpi match entries to support TI's tac5572,
tas2883, tac5672 and tac5682 on link 0 on MTL machine.

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
---
v5:
- no change

v4:
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

