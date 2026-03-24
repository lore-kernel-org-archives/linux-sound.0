Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010070.outbound.protection.outlook.com [40.93.198.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34661D435F;
	Tue, 24 Mar 2026 04:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774325596; cv=fail; b=Yf/+iaf3MMzPGHY30fwX0HV/NJ7q5e2puOVH7rfIqpVKFS4qLtMNrcPuQ2xgrJ3ROPxSbWXeeznSzupLZvrOt6QLHAmMUz1KhavUk2sNKYRIpej56FxnJR5BNf7RKofp80ZbHIRIrjyLPKUAppohKC0ttbdAh9CixQryo7anxwk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774325596; c=relaxed/simple;
	bh=kpUCPYSzkopfiMw3CRLn8fCJjiqV4LMoeYGqZOQg91I=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mwUQcfLDCsYo+vCkwnpEsiOLr32jItCKXsfCLD7IlXJIrJT7F2IywBd2sQzOmEa70AgWIAztk85kA/7CL+7mOzHoOvSl/9bJy0VJQadIk32ylp30kNNwqtUfkkkAF8Qjwkz7YpX+2je1Sli2mxnD/10P/pvYjTC3WbHJfVnrQwQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=qJVrYsuC; arc=fail smtp.client-ip=40.93.198.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="qJVrYsuC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IxDi0iNpj1ztkHAFKOQIEp00vVZV0hlrLJofbn6tk9jS9wf2GEWN+p3tUuzxht9T4Htf90sOSiIvQI0E9pkCxlIwOUw1QiFadz5Y+DFXzESo+SNd0yt9KxULv5tMN5itSEUSGdoA40WugbCKTnd/gf0gPwLOIGU/yNCJCakAcVS9RKW0ei2rwMXny3UC6JkghLe2nx5p2j+mfUCk0PvOnzP/z7DTHleiGohj4fdCjPXU0t49+/Vqelo8T8f46ddIJfhhK/4VtgXXFzvyRwWFe2k0ZH9u+f/LOpiEM1OdQQZwFCy+1IO9bujUt62zZtpJMVMV/UHL1n0jK+R/XD+cdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7PJTviglXA+MopoFYwbFyOr7SJn3NMr0rIfdah9nKy8=;
 b=Nqe1WniTJok6Y3YhmiewQ65/3phii7/GGc3XwuV2mK3lP/8LlN1a0DXxvT2VqMSnSeWan3gTbMoCXny7EyfpY9Xdvi+Dv2pfaQ59M2mvnYf+IKHo8VyTrNiE5BUrjEM4HBnlKn26VuMdDv3jd/t5U4eMtJ07w33mePtofwqVZZcZuV4EJzE4uoWp8W3bS/nwH8RdyadYzMWJ/Y2P3xRxexkSYnr8mootuN8xSVW7CjCWKlvkYfcGUbYB2Hwq+JrrQIEP63mUw0/Yw3nP+eMUs3VnXNDuy+Lc0tKOpOSi6J1K1ZoYb/7ikzQkrxUDHH4exepEcvkjOCsXWJJbfoBc+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=linux.dev smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7PJTviglXA+MopoFYwbFyOr7SJn3NMr0rIfdah9nKy8=;
 b=qJVrYsuC6aO2JGSLDlwYJXGwiBfz2Gn/QRuj+5ZLVeICwrdd5WeIvpcG+aR1cCy4kPQVtVX+IDseO+GxhEirTnHc59SNfBGyIE12qyS0PXGyAUviCDVRtCVAby4IrdNHkQYluLazGERyy+Dy81VVjHCjHPct9Wr+miq7efV3KNk=
Received: from MN2PR01CA0018.prod.exchangelabs.com (2603:10b6:208:10c::31) by
 PH0PR10MB6960.namprd10.prod.outlook.com (2603:10b6:510:26e::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.31; Tue, 24 Mar 2026 04:13:12 +0000
Received: from BL6PEPF0001AB53.namprd02.prod.outlook.com
 (2603:10b6:208:10c:cafe::34) by MN2PR01CA0018.outlook.office365.com
 (2603:10b6:208:10c::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Tue,
 24 Mar 2026 04:13:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL6PEPF0001AB53.mail.protection.outlook.com (10.167.241.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Tue, 24 Mar 2026 04:13:10 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Mar
 2026 23:13:10 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Mar
 2026 23:13:09 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 23 Mar 2026 23:13:09 -0500
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62O4D4ja1451108;
	Mon, 23 Mar 2026 23:13:05 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <broonie@kernel.org>,
	<lgirdwood@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
	<cezary.rojewski@intel.com>, <peter.ujfalusi@linux.intel.com>,
	<yung-chuan.liao@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
	<kai.vehmanen@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<baojun.xu@ti.com>, <shenghao-ding@ti.com>, <sandeepk@ti.com>,
	<v-hampiholi@ti.com>, Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v2] ASoC: sdw_utils: add vendor_id to asoc_sdw_codec_info
Date: Tue, 24 Mar 2026 09:42:59 +0530
Message-ID: <20260324041300.784-1-niranjan.hy@ti.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB53:EE_|PH0PR10MB6960:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ba7c0b9-88be-4082-ff3c-08de895ba923
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700016|82310400026|1800799024|7053199007|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	vFYEqFYhKbRQxjB0TGDbHeNf6afDj36v/0eCflgIhTsRpHj+R7ULioK51/i/2OgX/AnvzRCavXcQJas5T6BaRRKuaqWPaPAMVAK+CYSbxVyVsANohrTAZlpK9QZwFzKMMg8aX0iQvzFlA0+sY8oUPYQPllxFzmZNm9xfGVn9sHAIYpdR7nASgVZdyWR/KNgS7Cuw4GuovcdFtw2vIbdbblXvTmF/pkuhPH1aXNYH8dSQs3OqStoiaX3pr3VfyE6TOvSQbeydwF9D34WK2de25NHnHxTId6OH06MhlyL9bnYuidwmGl7OtTM8Xnv/NsBTYNyyf3l3drklwJYxn8/ayyRVfwGBg3rdgzaP//rAc0KhrVxpwoE7oHPiTfOgsSod50mHLEle0lV/ertoJmF6dOv4wwa8SpjzQGCb7SAIgU+YiePsF5NRpJM5MzGuO789/CWcCxEXyYDZKxIROleUKBGEF4oZuE7wdPWezr7Idv/0WOPawJ+kEkeuXVoC0HpU2V7g8oKhWz1Ti6hQe3za1xhBjSavvlSwwJFwPU6Hl/h+YwpV/D7wFVVcNcbD87ZYOx6o1glRU28nygW0SotvvFS3wMsIB8qfBxA8UufdVZ1CDR9IVHRyse5pXT8ulCT1GkhcscVKwM5vW1fyroQE375njdgcwBLLPnJsdXSO/LthFHuX24nprEIknasS6bOijM5diYabAC48pGs7kAGk1g==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(82310400026)(1800799024)(7053199007)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9LcCuIW8yBdBjBi1G13YAJcBwQY2eopGXY6j42u87OY29fP9ihaxD9rm12XJ7873bB3fM83sx/3cDuRANKv+gBAv5m0+pTT4SOq4w770YaZtKp+1OlRGtWVKF+OhBwc6+GxiIzh2ZcUZdpwImT3UupkoCVEdUk62RzY0mMBfPPTW48doVFoZTQa/I53mhaFKm5JxzVKup/SHiddcMpjRhnBvO6ysP6B5JdpQKKsV/IY9Eklc/0Pc8DMzL3HuEh2azjENH+DuRKQKhfq9d3dJpNvPdPUKcIibygx7+CJbPX/ihUQpOzC3qo9x+zDVGcUGhyLWfWcmzam7fPfN/jY0711ueer8ACFxc7MTCHMDwOyw9qw9uWuNswZ4zPfDHnzuRAPVmnEnhjT8ZZiTby3OGyli7Zl/sIJhVi/L1jTf8E530Uxe3kfTLhjfmGMljwM9
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 04:13:10.4720
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ba7c0b9-88be-4082-ff3c-08de895ba923
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB53.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB6960

 struct asoc_sdw_codec_info has part_id which is not
sufficient to uniquely identify devices. This change
adds the vendor_id field and updates the codec_info
list with the corresponding vendor id as per the
Manufacturer's id in https://mid.mipi.org/

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
---
v2:
- Make this as independent patch by removing from the TI's
  tac5xx2-sdw codec driver patch series.
- Add missing vendor IDs for Cirrus machines after rebase
---
 include/sound/soc_sdw_utils.h       |  1 +
 sound/soc/sdw_utils/soc_sdw_utils.c | 48 ++++++++++++++++++++++++++---
 sound/soc/sof/intel/hda.c           |  7 +++--
 3 files changed, 49 insertions(+), 7 deletions(-)

diff --git a/include/sound/soc_sdw_utils.h b/include/sound/soc_sdw_utils.h
index 98531e500cbb3..48f516ba682f7 100644
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
index 75658148df57c..637c640001d69 100644
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
@@ -724,6 +751,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		.dai_num = 4,
 	},
 	{
+		.vendor_id = 0x01fa,
 		.part_id = 0x2A3B,
 		.name_prefix = "cs42l43",
 		.count_sidecar = asoc_sdw_bridge_cs35l56_count_sidecar,
@@ -778,6 +806,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		.dai_num = 4,
 	},
 	{
+		.vendor_id = 0x01fa,
 		.part_id = 0x4245,
 		.name_prefix = "cs42l45",
 		.dais = {
@@ -814,6 +843,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		.aux_num = 1,
 	},
 	{
+		.vendor_id = 0x01fa,
 		.part_id = 0x4249,
 		.name_prefix = "cs42l45", /* Use same user-space as cs42l45 */
 		.dais = {
@@ -850,6 +880,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		.aux_num = 1,
 	},
 	{
+		.vendor_id = 0x01fa,
 		.part_id = 0x4747,
 		.name_prefix = "cs47l47",
 		.dais = {
@@ -886,6 +917,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		.aux_num = 1,
 	},
 	{
+		.vendor_id = 0x0105,
 		.part_id = 0xaaaa, /* generic codec mockup */
 		.name_prefix = "sdw_mockup_mmulti-function",
 		.version_id = 0,
@@ -912,6 +944,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		.dai_num = 3,
 	},
 	{
+		.vendor_id = 0x0105,
 		.part_id = 0xaa55, /* headset codec mockup */
 		.name_prefix = "sdw_mockup_headset0",
 		.version_id = 0,
@@ -926,6 +959,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		.dai_num = 1,
 	},
 	{
+		.vendor_id = 0x0105,
 		.part_id = 0x55aa, /* amplifier mockup */
 		.name_prefix = "sdw_mockup_amp1",
 		.version_id = 0,
@@ -940,6 +974,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		.dai_num = 1,
 	},
 	{
+		.vendor_id = 0x0105,
 		.part_id = 0x5555,
 		.name_prefix = "sdw_mockup_mic0",
 		.version_id = 0,
@@ -964,9 +999,10 @@ EXPORT_SYMBOL_NS(asoc_sdw_get_codec_info_list_count, "SND_SOC_SDW_UTILS");
 
 struct asoc_sdw_codec_info *asoc_sdw_find_codec_info_part(const u64 adr)
 {
-	unsigned int part_id, sdw_version;
+	unsigned int vendor_id, part_id, sdw_version;
 	int i;
 
+	vendor_id = SDW_MFG_ID(adr);
 	part_id = SDW_PART_ID(adr);
 	sdw_version = SDW_VERSION(adr);
 	for (i = 0; i < ARRAY_SIZE(codec_info_list); i++)
@@ -975,6 +1011,7 @@ struct asoc_sdw_codec_info *asoc_sdw_find_codec_info_part(const u64 adr)
 		 * version_id is not specified in the codec info.
 		 */
 		if (part_id == codec_info_list[i].part_id &&
+		    vendor_id == codec_info_list[i].vendor_id &&
 		    (!codec_info_list[i].version_id ||
 		     sdw_version == codec_info_list[i].version_id))
 			return &codec_info_list[i];
@@ -989,6 +1026,7 @@ static struct asoc_sdw_codec_info *asoc_sdw_find_codec_info_sdw_id(const struct
 
 	for (i = 0; i < ARRAY_SIZE(codec_info_list); i++)
 		if (id->part_id == codec_info_list[i].part_id &&
+		    id->mfg_id == codec_info_list[i].vendor_id &&
 		    (!codec_info_list[i].version_id ||
 		     id->sdw_version == codec_info_list[i].version_id))
 			return &codec_info_list[i];
@@ -1093,8 +1131,8 @@ int asoc_sdw_rtd_init(struct snd_soc_pcm_runtime *rtd)
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
@@ -1103,8 +1141,8 @@ int asoc_sdw_rtd_init(struct snd_soc_pcm_runtime *rtd)
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
index c0cc7d3ce5262..9ec33147d9af3 100644
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

