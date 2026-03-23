Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010008.outbound.protection.outlook.com [52.101.193.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A1117A586;
	Mon, 23 Mar 2026 04:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774239322; cv=fail; b=akAGMJh0GDt3I65e2AbVQG6Tkz0hGNa0hZO0KV49lDtB+L6UPvYkyk1Bf1wBGyEtVEckFGtrC98IxfCFqD3Rr9lNq8rQqKXCr5jQAKIwybHdo5X6bCiCVm6tNbsy/Jv999LvOrTLS+0qVApYCTmU+B0xvMRn4lZyJi6tJq57vzk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774239322; c=relaxed/simple;
	bh=jnBw9e31nFti0pkYSovh2z5d/aaMTnFuEsxJb4YZpdw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PjHwbZk0M4OuqO1lotAvwU/ROZKDPcnyIWkSCSQC17hpoAg1ElXb6PxOY/MctHj/Ux8XJbJ2Fl4YI+TZ6Miu/bz9rOp8vkZ75TFIM7qtCfNZ82/oym/BFsn3idTPaxfjbubZLZ95F7X0WXYzB/hZ2vyEZQp6QBVywCC/XQ8+FHM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=J0GzzUJ0; arc=fail smtp.client-ip=52.101.193.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="J0GzzUJ0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uJYOB821GqbPOkc0m6XjEc/48xd2XKRUtDvhiMoHiVfNbcN7I1KcjBXxCdf5Ns/jFsbWeqY5dt8iH6xz9QNpO4gZvZiCZcVRw2PVvOWIzJMYpTr1NN4YYmpV2zUXHSKYRhDZp9qMPnYrTFgs80J+N9WJKVA9mvvE2N6wfwatYoYVJMxbPGhTwFJJW6pHLRl/yxAo+rskjzTYJnvJ98uXISaNXjIXbsqBm6WU6+22MTZP1/LLxffb8BqWRfVPlud+KynV7up4MnwjlpOEwmwEIRce/hySYk6ETZoc0lYQXOTyAVu5HeLj0IDGQasB293pHbp13MuQtYTgiGYdQ7EyLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i5jbYLXcfRLU5zZdHACIDt5v/7FaLzMeNbaQeE99SDM=;
 b=wFg+EfTCqilQgAJo8km6vzAX0cyHZoXW14YAPm7UccvlUh73WvzDdhJLKV2ftvbwWOCPStlU2MA4vzaU4MNAmPegaMFRIXAsqZjhxFK3l/6vXB2jgtGptguebiXgQHAUOnksZ+FQopnVXhGKBfhHUfAJ9GaTFFAnCu749iONjxUoA1oTOKn7iSmHhXpmAgfFQB8QUF9/0i+W2IKJmuSrEjaMKsgLsDGRjKY+jUDTw2rnFrG7GGrkxGbGu+AM10vfs8KCwsvwOjIHnbZP2CGIEmkUNwPCPwMFyMf/eDC3aswBoLOKoOsqFAmjDelv4laGhk9aLmz5PRQ7tlfSbruKKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=linux.dev smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i5jbYLXcfRLU5zZdHACIDt5v/7FaLzMeNbaQeE99SDM=;
 b=J0GzzUJ0zO/NwRFliofh1uyqpRYtvdvkpank5WtmlAhBZAkEjj/ToxWu7CF2TIZN8tsN8cO0TrSoexkbsv60Bta59vSt89t5l6d90gp0qGmnCjPwzLhR7+A5+pQ4im8x+PzhZSr5tBfoBH5lAeZfeMFFWCa/R1HihJltzDVaMT0=
Received: from SN6PR04CA0074.namprd04.prod.outlook.com (2603:10b6:805:f2::15)
 by SJ0PR10MB6351.namprd10.prod.outlook.com (2603:10b6:a03:479::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Mon, 23 Mar
 2026 04:15:16 +0000
Received: from SA2PEPF00003F63.namprd04.prod.outlook.com
 (2603:10b6:805:f2:cafe::2d) by SN6PR04CA0074.outlook.office365.com
 (2603:10b6:805:f2::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.25 via Frontend Transport; Mon,
 23 Mar 2026 04:15:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SA2PEPF00003F63.mail.protection.outlook.com (10.167.248.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Mon, 23 Mar 2026 04:15:15 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 22 Mar
 2026 23:15:15 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 22 Mar
 2026 23:15:14 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sun, 22 Mar 2026 23:15:14 -0500
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62N4FA49042429;
	Sun, 22 Mar 2026 23:15:10 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <broonie@kernel.org>,
	<lgirdwood@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
	<cezary.rojewski@intel.com>, <peter.ujfalusi@linux.intel.com>,
	<yung-chuan.liao@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
	<kai.vehmanen@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<baojun.xu@ti.com>, <shenghao-ding@ti.com>, <sandeepk@ti.com>,
	<v-hampiholi@ti.com>, Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v1 1/4] ASoC: sdw_utils: add vendor_id to asoc_sdw_codec_info
Date: Mon, 23 Mar 2026 09:45:05 +0530
Message-ID: <20260323041505.2088-1-niranjan.hy@ti.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F63:EE_|SJ0PR10MB6351:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cb5ea3d-9d3e-4909-47bc-08de8892c941
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|1800799024|82310400026|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Yk/8w9ZckeM4VNy8duuFFocZjQUwj9K2WZImUVBHiHUXCCQ4m7dkhYw8axvwLMtYzFUGUugOb34ov59R4qpsnrUPFbpOM3AF3AB85vfdh4umHuRY2Wqez8qwBCSdz0Gf7pj4EM8sfJmfH2gXXgYQT6vNtFrzGdSVhCuSHq/Ve8Ch0+O/8mJkF4+UT3fd7rGKFSMjwHk9JEJm2zvHpfq3jXtIpYCzLSG4+ZmMq/w3AgHo+obsujIhObLzTWB4dYSLwLKfsUCkvFdNZ4vXx4a9IHDKmLlsuXUkPlP1hBunisfkH0LkwI7Ul8LrJeD1SrpY5p3ea2w0bK63IXvHBRmPwLLxS87oL0vDqL+y2nX4MI9wTP+jtT9s9N0R3nhfRTeezcG9nRLWQ9PmSm6MevZ35MkxWRnSp9kE9sJthMFeW7AUUoqRvhUeq192fV92jJ4vlCfAqFjEArqnpRh+eVmpSf8T7en5EQ0tG9VhS2H7eiw7iejOj6X3ICqeK+iZTsQQL9U1a7pWlM1myO77uVsZtOO/f/pll5AHh3oJBt6s9/6CWhBJpQcYXMMXjaZPYqxleP1pyzuKOkrgysUBeEodVq57KcAWJWZv1SepcaPS5A67U2fO98h8EEiRD14FGPwIgN4F+nEjygl4Blo2zJ1HFt/mBU5VhwYwVISzyTzeiht5Rwp4qDARvtjdvd3Ik8s0YhMJZzZEfQ9WdvKlgBcglA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(1800799024)(82310400026)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	auJvjRfONcWu26jw8s25ODdQXVjhG5exa7unMmMLwKADKpA3jIsX0wRx3pyKKMfcu7oRiicvoxZ2vVgT0STDA6qO3YeXBF7bveyAqxg1Ux6mseytUDZJPsHGELy9Aepbztu8tPsXoU7H6DALYOqsKfTdR91cbZkm6TuU5j2e5Nz7dkNuHYhZzfl9cObsrZ1Y4gTU+T4DIXFxBMjDrppTUUHHg3yn8c8rA6EyyB58HEoUCfLG+868OLJCEs+8nrKnMikqZ7BJHoWPZQ9B42LEIDGrEzBMpD8zL3yd4EP5djxW0RyCzx5/7IAbt2di0LYzUng00XoquBP5sjTuHG6YxnR3k98HJuCN6t7C+gK0Km4xAr/3RTKloFT6jy/Kz7FUj/YQphRy/LpYbvboNAUkNKRC2ggABODWdIFR8FS2aKkAZDMpL2RCJTSUaTXXNAk8
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 04:15:15.5691
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cb5ea3d-9d3e-4909-47bc-08de8892c941
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F63.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB6351

 struct asoc_sdw_codec_info has part_id which is not
sufficient to uniquely identify devices. This change
adds the vendor_id field and updates the codec_info
list with the corresponding vendor id as per the
Manufacturer's id in https://mid.mipi.org/

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 include/sound/soc_sdw_utils.h       |  1 +
 sound/soc/sdw_utils/soc_sdw_utils.c | 46 +++++++++++++++++++++++++----
 sound/soc/sof/intel/hda.c           |  7 +++--
 3 files changed, 47 insertions(+), 7 deletions(-)

diff --git a/include/sound/soc_sdw_utils.h b/include/sound/soc_sdw_utils.h
index 98531e500cbb..48f516ba682f 100644
--- a/include/sound/soc_sdw_utils.h
+++ b/include/sound/soc_sdw_utils.h
@@ -71,6 +71,7 @@ struct asoc_sdw_aux_info {
 };
 
 struct asoc_sdw_codec_info {
+	const int vendor_id;
 	const int part_id;
 	const int version_id;
 	const char *name_prefix;
diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index 75658148df57..0daffd78f58c 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -73,6 +73,7 @@ static const struct snd_kcontrol_new rt700_controls[] = {
 
 struct asoc_sdw_codec_info codec_info_list[] = {
 	{
+		.vendor_id = 0x0102,
 		.part_id = 0x0000, /* TAS2783A */
 		.name_prefix = "tas2783",
 		.dais = {
@@ -92,6 +93,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		.dai_num = 1,
 	},
 	{
+		.vendor_id = 0x025d,
 		.part_id = 0x700,
 		.name_prefix = "rt700",
 		.dais = {
@@ -110,6 +112,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		.dai_num = 1,
 	},
 	{
+		.vendor_id = 0x025d,
 		.part_id = 0x711,
 		.name_prefix = "rt711",
 		.version_id = 3,
@@ -131,6 +134,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		.dai_num = 1,
 	},
 	{
+		.vendor_id = 0x025d,
 		.part_id = 0x711,
 		.name_prefix = "rt711",
 		.version_id = 2,
@@ -152,6 +156,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		.dai_num = 1,
 	},
 	{
+		.vendor_id = 0x025d,
 		.part_id = 0x712,
 		.name_prefix = "rt712",
 		.version_id = 3,
@@ -194,6 +199,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		.dai_num = 3,
 	},
 	{
+		.vendor_id = 0x025d,
 		.part_id = 0x1712,
 		.name_prefix = "rt712-dmic",
 		.version_id = 3,
@@ -209,6 +215,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		.dai_num = 1,
 	},
 	{
+		.vendor_id = 0x025d,
 		.part_id = 0x713,
 		.name_prefix = "rt713",
 		.version_id = 3,
@@ -237,6 +244,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		.dai_num = 2,
 	},
 	{
+		.vendor_id = 0x025d,
 		.part_id = 0x1713,
 		.name_prefix = "rt713-dmic",
 		.version_id = 3,
@@ -252,6 +260,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		.dai_num = 1,
 	},
 	{
+		.vendor_id = 0x025d,
 		.part_id = 0x1308,
 		.name_prefix = "rt1308",
 		.acpi_id = "10EC1308",
@@ -275,6 +284,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		.ops = &soc_sdw_rt1308_i2s_ops,
 	},
 	{
+		.vendor_id = 0x025d,
 		.part_id = 0x1316,
 		.name_prefix = "rt1316",
 		.dais = {
@@ -296,6 +306,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		.dai_num = 1,
 	},
 	{
+		.vendor_id = 0x025d,
 		.part_id = 0x1318,
 		.name_prefix = "rt1318",
 		.dais = {
@@ -317,6 +328,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		.dai_num = 1,
 	},
 	{
+		.vendor_id = 0x025d,
 		.part_id = 0x1320,
 		.name_prefix = "rt1320",
 		.dais = {
@@ -338,6 +350,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		.dai_num = 1,
 	},
 	{
+		.vendor_id = 0x025d,
 		.part_id = 0x1321,
 		.name_prefix = "rt1320",
 		.dais = {
@@ -359,6 +372,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		.dai_num = 1,
 	},
 	{
+		.vendor_id = 0x025d,
 		.part_id = 0x714,
 		.name_prefix = "rt714",
 		.version_id = 3,
@@ -375,6 +389,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		.dai_num = 1,
 	},
 	{
+		.vendor_id = 0x025d,
 		.part_id = 0x715,
 		.name_prefix = "rt715",
 		.version_id = 3,
@@ -391,6 +406,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		.dai_num = 1,
 	},
 	{
+		.vendor_id = 0x025d,
 		.part_id = 0x714,
 		.name_prefix = "rt714",
 		.version_id = 2,
@@ -407,6 +423,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		.dai_num = 1,
 	},
 	{
+		.vendor_id = 0x025d,
 		.part_id = 0x715,
 		.name_prefix = "rt715",
 		.version_id = 2,
@@ -423,6 +440,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		.dai_num = 1,
 	},
 	{
+		.vendor_id = 0x025d,
 		.part_id = 0x721,
 		.name_prefix = "rt721",
 		.version_id = 3,
@@ -466,6 +484,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		.dai_num = 3,
 	},
 	{
+		.vendor_id = 0x025d,
 		.part_id = 0x722,
 		.name_prefix = "rt722",
 		.version_id = 3,
@@ -513,6 +532,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		.dai_num = 3,
 	},
 	{
+		.vendor_id = 0x019f,
 		.part_id = 0x8373,
 		.name_prefix = "Left",
 		.dais = {
@@ -533,6 +553,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		.dai_num = 1,
 	},
 	{
+		.vendor_id = 0x019f,
 		.part_id = 0x8363,
 		.name_prefix = "Left",
 		.dais = {
@@ -553,6 +574,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		.dai_num = 1,
 	},
 	{
+		.vendor_id = 0x025d,
 		.part_id = 0x5682,
 		.name_prefix = "rt5682",
 		.dais = {
@@ -571,6 +593,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		.dai_num = 1,
 	},
 	{
+		.vendor_id = 0x01fa,
 		.part_id = 0x3556,
 		.name_prefix = "AMP",
 		.dais = {
@@ -598,6 +621,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		.dai_num = 2,
 	},
 	{
+		.vendor_id = 0x01fa,
 		.part_id = 0x3557,
 		.name_prefix = "AMP",
 		.dais = {
@@ -625,6 +649,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		.dai_num = 2,
 	},
 	{
+		.vendor_id = 0x01fa,
 		.part_id = 0x3563,
 		.name_prefix = "AMP",
 		.dais = {
@@ -652,6 +677,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		.dai_num = 2,
 	},
 	{
+		.vendor_id = 0x01fa,
 		.part_id = 0x4242,
 		.name_prefix = "cs42l42",
 		.dais = {
@@ -670,6 +696,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		.dai_num = 1,
 	},
 	{
+		.vendor_id = 0x01fa,
 		.part_id = 0x4243,
 		.name_prefix = "cs42l43",
 		.count_sidecar = asoc_sdw_bridge_cs35l56_count_sidecar,
@@ -778,6 +805,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		.dai_num = 4,
 	},
 	{
+		.vendor_id = 0x01fa,
 		.part_id = 0x4245,
 		.name_prefix = "cs42l45",
 		.dais = {
@@ -850,6 +878,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		.aux_num = 1,
 	},
 	{
+		.vendor_id = 0x01fa,
 		.part_id = 0x4747,
 		.name_prefix = "cs47l47",
 		.dais = {
@@ -886,6 +915,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		.aux_num = 1,
 	},
 	{
+		.vendor_id = 0x0105,
 		.part_id = 0xaaaa, /* generic codec mockup */
 		.name_prefix = "sdw_mockup_mmulti-function",
 		.version_id = 0,
@@ -912,6 +942,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		.dai_num = 3,
 	},
 	{
+		.vendor_id = 0x0105,
 		.part_id = 0xaa55, /* headset codec mockup */
 		.name_prefix = "sdw_mockup_headset0",
 		.version_id = 0,
@@ -926,6 +957,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		.dai_num = 1,
 	},
 	{
+		.vendor_id = 0x0105,
 		.part_id = 0x55aa, /* amplifier mockup */
 		.name_prefix = "sdw_mockup_amp1",
 		.version_id = 0,
@@ -940,6 +972,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		.dai_num = 1,
 	},
 	{
+		.vendor_id = 0x0105,
 		.part_id = 0x5555,
 		.name_prefix = "sdw_mockup_mic0",
 		.version_id = 0,
@@ -964,9 +997,10 @@ EXPORT_SYMBOL_NS(asoc_sdw_get_codec_info_list_count, "SND_SOC_SDW_UTILS");
 
 struct asoc_sdw_codec_info *asoc_sdw_find_codec_info_part(const u64 adr)
 {
-	unsigned int part_id, sdw_version;
+	unsigned int vendor_id, part_id, sdw_version;
 	int i;
 
+	vendor_id = SDW_MFG_ID(adr);
 	part_id = SDW_PART_ID(adr);
 	sdw_version = SDW_VERSION(adr);
 	for (i = 0; i < ARRAY_SIZE(codec_info_list); i++)
@@ -975,6 +1009,7 @@ struct asoc_sdw_codec_info *asoc_sdw_find_codec_info_part(const u64 adr)
 		 * version_id is not specified in the codec info.
 		 */
 		if (part_id == codec_info_list[i].part_id &&
+		    vendor_id == codec_info_list[i].vendor_id &&
 		    (!codec_info_list[i].version_id ||
 		     sdw_version == codec_info_list[i].version_id))
 			return &codec_info_list[i];
@@ -989,6 +1024,7 @@ static struct asoc_sdw_codec_info *asoc_sdw_find_codec_info_sdw_id(const struct
 
 	for (i = 0; i < ARRAY_SIZE(codec_info_list); i++)
 		if (id->part_id == codec_info_list[i].part_id &&
+		    id->mfg_id == codec_info_list[i].vendor_id &&
 		    (!codec_info_list[i].version_id ||
 		     id->sdw_version == codec_info_list[i].version_id))
 			return &codec_info_list[i];
@@ -1093,8 +1129,8 @@ int asoc_sdw_rtd_init(struct snd_soc_pcm_runtime *rtd)
 			ret = snd_soc_add_card_controls(card, codec_info->dais[dai_index].controls,
 							codec_info->dais[dai_index].num_controls);
 			if (ret) {
-				dev_err(card->dev, "%#x controls addition failed: %d\n",
-					codec_info->part_id, ret);
+				dev_err(card->dev, "%#x-%#x controls addition failed: %d\n",
+					codec_info->vendor_id, codec_info->part_id, ret);
 				return ret;
 			}
 		}
@@ -1103,8 +1139,8 @@ int asoc_sdw_rtd_init(struct snd_soc_pcm_runtime *rtd)
 							codec_info->dais[dai_index].widgets,
 							codec_info->dais[dai_index].num_widgets);
 			if (ret) {
-				dev_err(card->dev, "%#x widgets addition failed: %d\n",
-					codec_info->part_id, ret);
+				dev_err(card->dev, "%#x-%#x widgets addition failed: %d\n",
+					codec_info->vendor_id, codec_info->part_id, ret);
 				return ret;
 			}
 		}
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index c0cc7d3ce526..9ec33147d9af 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1179,6 +1179,9 @@ static struct snd_soc_acpi_adr_device *find_acpi_adr_device(struct device *dev,
 		struct snd_soc_acpi_endpoint *endpoints;
 		int amp_group_id = 1;
 
+		if (sdw_device->id.mfg_id != codec_info_list[i].vendor_id)
+			continue;
+
 		if (sdw_device->id.part_id != codec_info_list[i].part_id)
 			continue;
 
@@ -1193,8 +1196,8 @@ static struct snd_soc_acpi_adr_device *find_acpi_adr_device(struct device *dev,
 		 * dereference
 		 */
 		if (!name_prefix) {
-			dev_err(dev, "codec_info_list name_prefix of part id %#x is missing\n",
-				codec_info_list[i].part_id);
+			dev_err(dev, "codec_info_list name_prefix of part id %#x-%#x is missing\n",
+				codec_info_list[i].vendor_id, codec_info_list[i].part_id);
 			return NULL;
 		}
 		for (j = 0; j < codec_info_list[i].dai_num; j++) {
-- 
2.34.1

