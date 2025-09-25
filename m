Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53E92F5A13
	for <linux-sound@vger.kernel.org>; Thu, 25 Sep 2025 10:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758797663; cv=fail; b=HtCb42bwqMfOkLBl/C30MUb3WanquvuQh9h+L74X/9fZ/KQ691EnLrEhj01Tbtyjp+Uugg8rXiEiIcu0Ijea5tf4sNyNEATL6SHSNzhQxWJialjvH7zHyKtwWmcnOADAEPUOpU+SudsUXcBg9wuRkg525g6QEM072ldNGOrH+Mk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758797663; c=relaxed/simple;
	bh=kVrhsKWwk2SaP8uL5xqTqXuMwgI1AxVpkNVPz/vT4OQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tIvYVdqXM1JZwHr9nvzQx/DsrG4u7jnFo0fWemRfoijcoOREHUZsMHqRkTZNjZP6K3AbC7B4zrAFCrzGTRo8o1HYw13f1amldjJcg62NlVaRx35R+PX5bprGsQ3zUjIFNZ0rRfJc17hHRCBXROsjn1iDBxRDAR2gzVRWpB5fR3A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=HJkdxyAQ; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Mlmr6vuW; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="HJkdxyAQ";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Mlmr6vuW"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58P1vH5Z1785190;
	Thu, 25 Sep 2025 05:53:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=cgkyWFIFJxX71bZ2xCcTofEhMVQ6VZb50ep9XkluenA=; b=
	HJkdxyAQBu0z4XORIYgYE8rKSATm6NsqZsM5vKXaEsIh+tCqVhh6YDtcvT2EixrA
	062pgXDndjXZ3ZQfNY+thcTTyj1ZFPyY8rVoZKvElNo8uUBQl3rNXWPHlGayTEE+
	80/P/yVPJaLWkytE75GM3ufcEXj2ZBXZxAKeL2qAzGOfaVt1fADQ3QfTGw3CCo5p
	yxuJljcLXztk7EvXZmnnG6tdX2ONXfCySNGbaH3chaTDs4YOcAlxT/6FjecMayfD
	5P0E67A9ZhQiUxJ0vuYer/6x3uXmaodecb5zQIVOIQzWVxn8lM4/VeOuSpXXgGgu
	2VaAdccTKwOnX4RTSWXtvA==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020131.outbound.protection.outlook.com [40.93.198.131])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 49cvharf6c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 25 Sep 2025 05:53:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k3vABNQMPaDiDs77cH6blnFzJQCZ2i7OHM/Lwaf3fXgfSiIB17drPI3TNffKFjUPOyaG1siZce1A9OIpRV7J3RaknTUI0b3MDO8kgYeNsIgHf3RucSBvXH6tFqwuGGMfcE6hqAt+iJxx8IopxcHpgTTvi2HgnkXdUNA1A0q9A7h9QkYo43nllRacpGCVy7v2jm/8kmmPA7ZSCAtU9nPiefhIpsAxBmQbNnLU+1qXMx8GIHoVGy/l0j+H8Z0vdB9jwKcgq8SGM/LVol0g5b750i4HeEzjrOzAnDnoGZUQpfF3v8C9aTM2fRE5RIG0sDR1J5Tf1QvKlkQZzEnH4CiedQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cgkyWFIFJxX71bZ2xCcTofEhMVQ6VZb50ep9XkluenA=;
 b=PunXtXRse8mktJ1st3snQcQLGiPBYGp/FnEXPbKct5vSTZ8aj709HwGa0yTLBZdgCcw0Bk4yd/vPSccrNjmrC4zfR98umE7roVxqL8vttmS+kkq/xgYWgLhTahaJWsa8JdJ2N9O9Qd8mMG4VfihvUM2mN5SbB+hf++Gmw+pW3cVTfZBjWfB2e/bbQEglqT5rJ3V88XYKsii39J3f9IwEfmwY3CqYeFCcTbAZV9DmtHiNU0aZX955KGQwk1HNclZ/CHey8nMZgolUQs6/Y1QrIXv3omHgOpM5+dxjIDMNopKx6bJMuQj/5jnGWFJSzMqWIoO84ChN5RDHSHNvNu/O1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cgkyWFIFJxX71bZ2xCcTofEhMVQ6VZb50ep9XkluenA=;
 b=Mlmr6vuWbrh5eweyP6vOUBHyS1I2a7Ua/DsWknaMC90Mv1wMRXEZaDULCkkO50XNlsnSwuKRkVtr2PJVFvZgxvsn9HHZZ6np4+byZQSGWLJcMGRiAsnJwK0jxYKQzeeCpFboGDmG2qMYvL6zxIeD1mf0iXx9PhcCj3XSmgliLak=
Received: from MW4PR03CA0012.namprd03.prod.outlook.com (2603:10b6:303:8f::17)
 by MW3PR19MB4187.namprd19.prod.outlook.com (2603:10b6:303:49::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Thu, 25 Sep
 2025 10:53:51 +0000
Received: from MWH0EPF000971E4.namprd02.prod.outlook.com
 (2603:10b6:303:8f:cafe::7a) by MW4PR03CA0012.outlook.office365.com
 (2603:10b6:303:8f::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.20 via Frontend Transport; Thu,
 25 Sep 2025 10:53:51 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000971E4.mail.protection.outlook.com (10.167.243.72) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.9
 via Frontend Transport; Thu, 25 Sep 2025 10:53:50 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 9664640657E;
	Thu, 25 Sep 2025 10:53:46 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 8D87382024B;
	Thu, 25 Sep 2025 10:53:46 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 13/19] ASoC: SDCA: Add SDCA FDL data parsing
Date: Thu, 25 Sep 2025 11:53:35 +0100
Message-ID: <20250925105341.194178-14-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250925105341.194178-1-ckeepax@opensource.cirrus.com>
References: <20250925105341.194178-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E4:EE_|MW3PR19MB4187:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: cbb958ed-edcb-454c-4b34-08ddfc21d02a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+vFMLzotx6IYKPSUzXttObGzfQBYhEnmfEXBa2iZgDkyvI2VI4+iis/GBZbc?=
 =?us-ascii?Q?nyEc2QtcYzTF3sMwJONujNig/pWzV5bSCa4PITOlrCswrsSQ7hwKDICh6qNW?=
 =?us-ascii?Q?AoyhZBYlmW0fVlXayWCnYhTdDJT6Vf0JNnErup1UiJcnbc1eQ1HD+fNmszp7?=
 =?us-ascii?Q?PaJvcN/5OGcuMoSccIiYxRmALzG54fZFvoqF+Hxe5QhMd7L1UiBUKD0LbOrU?=
 =?us-ascii?Q?Y/DOkzCd9eTK5QPYOLQCZCDZSC9V/8GWabh2uK6XcbizKnOXXOAU1pdVqJ9h?=
 =?us-ascii?Q?t1mDkCJQp89ZC4S8KDmS4SaEq8cE677gIb5WieGJiQclss17IThOLRAc3nGX?=
 =?us-ascii?Q?CCVFfmrCTVB+Silxt2Z5hWCl4Zbu5UibuivvTCnhyDO7IYGPKC+iblcAaCFV?=
 =?us-ascii?Q?YKX5V7edxbCv/He7B2LCpQGDKNIQneOiQ//jRISpYsxDfMpx5F5uci+wOmua?=
 =?us-ascii?Q?vwKtcWT1wvB3oyh/DISYUcdxcLHCM/T1QzWoY0hYD03NNCxixvrbL/cgXu6b?=
 =?us-ascii?Q?/VunaeBADG+FNDds5i85xc0DUwwQfovUulMsRx7IDuumduRtWkFk+W9WlPDq?=
 =?us-ascii?Q?UuYNvOnSf8oDErLCDsqHHDTvmuSO9BH1I5q1FiynD4QLgbt1+gPiooGSvaWV?=
 =?us-ascii?Q?/BqQ7xuxv8202bY3jbwA4i+OAOhFNzMxcm4f5MZWLQPmZXNuplM8dhM2lMZ7?=
 =?us-ascii?Q?9P4IcDgwWLmZg3ezhMAdON9VRdMMrq4zJVng7sfG75W7pdQWuDyVx/7PpBKv?=
 =?us-ascii?Q?EtM5DJ16SZvvs/cmnZGBIX/l6wgql8AxMOP5IbhRagwOu4i9EKGLkdxu0jF3?=
 =?us-ascii?Q?n82CskFPzyEfiIZ5N33flPerv1kc4jWW/1r2PS3Ijc6NxRJ8PmfNp8K1QYfx?=
 =?us-ascii?Q?ihqUnrGI8PXlYFM0NoiKlZWZ0KSBZGw9XBp5+0luy4EWDG9vlGa+Sc4+7zEk?=
 =?us-ascii?Q?6ed8Oy3hFRdDpAXxk6r1pWbgQtJu6W+Gn/zQlP2xfUsVck3icGSOybzxTdP7?=
 =?us-ascii?Q?ZtL7GQV31UYTlaii4i/ZyAm7aI5ElClj1KTvinWBrC6CoBNBZd8g51fbLC4h?=
 =?us-ascii?Q?RGxZ2atuD9RhpQEK/mhaFIuP4OVC+2UaO3R0Rdo9/mTJ0xx4KEkkEUwsSl94?=
 =?us-ascii?Q?amIv8SBe/zke51lWD6hOjTlO11wx5EeIw3AAcxVYgsPp3uGiOBXHBnCnq59b?=
 =?us-ascii?Q?gdgIZo2Q6BaoPD5xmVetJdgs7Q4ny2zwD9e8uDGV6novY3M8IKx1Kf0yImyH?=
 =?us-ascii?Q?cKdk+aM5vj5WnxO8nkFku+Kqocz3VWYldNAw3lBbf6ruzQ/IwKeX3RKbNgy9?=
 =?us-ascii?Q?E5+1WHJG2hRU1CxIAcDVQ4hHX97iBSAvcy/meq7tIKoau7o8Shj/B4icwLbq?=
 =?us-ascii?Q?abiEM+UnMDB9kuNb506QfbOw3BvEPn7KMJUmHvMU+I/5R6nfaY05hHib3Q6x?=
 =?us-ascii?Q?ux5sRq9K4T5N6vTl2wkv/1AJqJr4pZcUQuO8S5oS5EOVip3vPX5EtTZBJAyD?=
 =?us-ascii?Q?iZvXaJ+usUIEOAN8XkTYdMuIhqDbj9nNZExQ?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 10:53:50.9858
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbb958ed-edcb-454c-4b34-08ddfc21d02a
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000971E4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR19MB4187
X-Proofpoint-GUID: 1kCZilnq3K2jvw5UCfi_RwANeeMqU2hv
X-Proofpoint-ORIG-GUID: 1kCZilnq3K2jvw5UCfi_RwANeeMqU2hv
X-Authority-Analysis: v=2.4 cv=dL+mmPZb c=1 sm=1 tr=0 ts=68d51f41 cx=c_pps
 a=wLjL7U/RDB/pQmeqDiFFmw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8
 a=QyXUC8HyAAAA:8 a=gdKTTE99PY5FDwdXciEA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDEwMiBTYWx0ZWRfX5m5Ad3TqMuvH
 NrdWcBxwexHWOdD5XV25dNqeTLwMSvlp8T8yGVQlo0e6CY5YBH8kLh0bBrKaj5AeS/BHvFibceX
 AXiFv3cY/mO82NwMlxOF48//QYv4CLcLMRvyUXnMKToP+C1tW+jNJmGCGZi2O7MZ9HOliVhU5sG
 HJXBKpeoQwPj6Wz7STkRo/rXn+SHncZr1ubYBqhAKxYHdnmC9XJOng1Ci8ltnu3YKzxRNxLzZJF
 /dnpFBkk35iyuTWnhzEmAF0pdNWaTonSb+If0o7CEAA0TYe1WjxmWiMPQ2CEuugu2ECiR36ACPX
 v46B1kfjvSzI6o0cMi3HzDEtjLz2civPGAaAos4vqAqPNkmd1nXQmEaGlL/I5o=
X-Proofpoint-Spam-Reason: safe

From: Maciej Strozek <mstrozek@opensource.cirrus.com>

Add parsing of ACPI DisCo information specific to FDL (File DownLoad).
DisCo contains a list of File Sets which can be requested by the device
and within each of those a list of individual files to be downloaded to
the device. Optionally the contents of the files may also be present in
a special ACPI table, called SWFT (SoundWire File Table).

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v2.

 include/sound/sdca.h            |  5 ++
 include/sound/sdca_function.h   | 40 ++++++++++++++
 sound/soc/sdca/sdca_device.c    | 20 +++++++
 sound/soc/sdca/sdca_functions.c | 93 +++++++++++++++++++++++++++++++++
 4 files changed, 158 insertions(+)

diff --git a/include/sound/sdca.h b/include/sound/sdca.h
index 9c6a351c9d474..d38cdbfeb35f5 100644
--- a/include/sound/sdca.h
+++ b/include/sound/sdca.h
@@ -12,6 +12,7 @@
 #include <linux/types.h>
 #include <linux/kconfig.h>
 
+struct acpi_table_swft;
 struct sdw_slave;
 
 #define SDCA_MAX_FUNCTION_COUNT 8
@@ -37,11 +38,13 @@ struct sdca_function_desc {
  * @num_functions: Total number of supported SDCA functions. Invalid/unsupported
  * functions will be skipped.
  * @function: Array of function descriptors.
+ * @swft: Pointer to the SWFT table, if available.
  */
 struct sdca_device_data {
 	u32 interface_revision;
 	int num_functions;
 	struct sdca_function_desc function[SDCA_MAX_FUNCTION_COUNT];
+	struct acpi_table_swft *swft;
 };
 
 enum sdca_quirk {
@@ -52,12 +55,14 @@ enum sdca_quirk {
 #if IS_ENABLED(CONFIG_ACPI) && IS_ENABLED(CONFIG_SND_SOC_SDCA)
 
 void sdca_lookup_functions(struct sdw_slave *slave);
+void sdca_lookup_swft(struct sdw_slave *slave);
 void sdca_lookup_interface_revision(struct sdw_slave *slave);
 bool sdca_device_quirk_match(struct sdw_slave *slave, enum sdca_quirk quirk);
 
 #else
 
 static inline void sdca_lookup_functions(struct sdw_slave *slave) {}
+static inline void sdca_lookup_swft(struct sdw_slave *slave) {}
 static inline void sdca_lookup_interface_revision(struct sdw_slave *slave) {}
 static inline bool sdca_device_quirk_match(struct sdw_slave *slave, enum sdca_quirk quirk)
 {
diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index 6dd44a7a8a359..f557206cec83d 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -13,6 +13,7 @@
 #include <linux/types.h>
 #include <linux/hid.h>
 
+struct acpi_table_swft;
 struct device;
 struct sdca_entity;
 struct sdca_function_desc;
@@ -1338,6 +1339,42 @@ enum sdca_cluster_range {
 	SDCA_CLUSTER_NCOLS				= 2,
 };
 
+/**
+ * struct sdca_fdl_file - information about a file from a fileset used in FDL
+ * @vendor_id: Vendor ID of the file.
+ * @file_id: File ID of the file.
+ * @fdl_offset: Offset information for FDL.
+ */
+struct sdca_fdl_file {
+	u16 vendor_id;
+	u32 file_id;
+	u32 fdl_offset;
+};
+
+/**
+ * struct sdca_fdl_set - information about a set of files used in FDL
+ * @files: Array of files in this FDL set.
+ * @num_files: Number of files in this FDL set.
+ * @id: ID of the FDL set.
+ */
+struct sdca_fdl_set {
+	struct sdca_fdl_file *files;
+	int num_files;
+	u32 id;
+};
+
+/**
+ * struct sdca_fdl_data - information about a function's FDL data
+ * @swft: Pointer to the SoundWire File Table.
+ * @sets: Array of FDL sets used by this function.
+ * @num_sets: Number of FDL sets used by this function.
+ */
+struct sdca_fdl_data {
+	struct acpi_table_swft *swft;
+	struct sdca_fdl_set *sets;
+	int num_sets;
+};
+
 /**
  * struct sdca_function_data - top-level information for one SDCA function
  * @desc: Pointer to short descriptor from initial parsing.
@@ -1351,6 +1388,7 @@ enum sdca_cluster_range {
  * error should be reported.
  * @reset_max_delay: Maximum Function reset delay in microseconds, before an
  * error should be reported.
+ * @fdl_data: FDL data for this Function, if available.
  */
 struct sdca_function_data {
 	struct sdca_function_desc *desc;
@@ -1364,6 +1402,8 @@ struct sdca_function_data {
 
 	unsigned int busy_max_delay;
 	unsigned int reset_max_delay;
+
+	struct sdca_fdl_data fdl_data;
 };
 
 static inline u32 sdca_range(struct sdca_control_range *range,
diff --git a/sound/soc/sdca/sdca_device.c b/sound/soc/sdca/sdca_device.c
index 4798ce2c8f0b4..405e80b979de8 100644
--- a/sound/soc/sdca/sdca_device.c
+++ b/sound/soc/sdca/sdca_device.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/device.h>
 #include <linux/dmi.h>
 #include <linux/module.h>
 #include <linux/property.h>
@@ -27,6 +28,25 @@ void sdca_lookup_interface_revision(struct sdw_slave *slave)
 }
 EXPORT_SYMBOL_NS(sdca_lookup_interface_revision, "SND_SOC_SDCA");
 
+static void devm_acpi_table_put(void *ptr)
+{
+	acpi_put_table((struct acpi_table_header *)ptr);
+}
+
+void sdca_lookup_swft(struct sdw_slave *slave)
+{
+	acpi_status status;
+
+	status = acpi_get_table(ACPI_SIG_SWFT, 0,
+				(struct acpi_table_header **)&slave->sdca_data.swft);
+	if (ACPI_FAILURE(status))
+		dev_info(&slave->dev, "SWFT not available\n");
+	else
+		devm_add_action_or_reset(&slave->dev, devm_acpi_table_put,
+					 &slave->sdca_data.swft);
+}
+EXPORT_SYMBOL_NS(sdca_lookup_swft, "SND_SOC_SDCA");
+
 static bool sdca_device_quirk_rt712_vb(struct sdw_slave *slave)
 {
 	struct sdw_slave_id *id = &slave->id;
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 6602727c73f73..b2e3fab9bd959 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -2010,6 +2010,95 @@ static int find_sdca_clusters(struct device *dev,
 	return 0;
 }
 
+static int find_sdca_filesets(struct device *dev, struct sdw_slave *sdw,
+			      struct fwnode_handle *function_node,
+			      struct sdca_function_data *function)
+{
+	static const int mult_fileset = 3;
+	char fileset_name[SDCA_PROPERTY_LENGTH];
+	u32 *filesets_list __free(kfree) = NULL;
+	struct sdca_fdl_set *sets;
+	int num_sets;
+	int i, j;
+
+	num_sets = fwnode_property_count_u32(function_node,
+					     "mipi-sdca-file-set-id-list");
+	if (num_sets == 0 || num_sets == -EINVAL) {
+		return 0;
+	} else if (num_sets < 0) {
+		dev_err(dev, "%pfwP: failed to read file set list: %d\n",
+			function_node, num_sets);
+		return num_sets;
+	}
+
+	filesets_list = kcalloc(num_sets, sizeof(u32), GFP_KERNEL);
+	if (!filesets_list)
+		return -ENOMEM;
+
+	fwnode_property_read_u32_array(function_node, "mipi-sdca-file-set-id-list",
+				       filesets_list, num_sets);
+
+	sets = devm_kcalloc(dev, num_sets, sizeof(struct sdca_fdl_set), GFP_KERNEL);
+	if (!sets)
+		return -ENOMEM;
+
+	for (i = 0; i < num_sets; i++) {
+		u32 *fileset_entries __free(kfree) = NULL;
+		struct sdca_fdl_set *set = &sets[i];
+		struct sdca_fdl_file *files;
+		int num_files, num_entries;
+
+		snprintf(fileset_name, sizeof(fileset_name),
+			 "mipi-sdca-file-set-id-0x%X", filesets_list[i]);
+
+		num_entries = fwnode_property_count_u32(function_node, fileset_name);
+		if (num_entries <= 0) {
+			dev_err(dev, "%pfwP: file set %d missing entries: %d\n",
+				function_node, filesets_list[i], num_entries);
+			return -EINVAL;
+		} else if (num_entries % mult_fileset != 0) {
+			dev_err(dev, "%pfwP: file set %d files not multiple of %d\n",
+				function_node, filesets_list[i], mult_fileset);
+			return -EINVAL;
+		}
+
+		dev_info(dev, "fileset: %#x\n", filesets_list[i]);
+
+		files = devm_kcalloc(dev, num_entries / mult_fileset,
+				     sizeof(struct sdca_fdl_file), GFP_KERNEL);
+		if (!files)
+			return -ENOMEM;
+
+		fileset_entries = kcalloc(num_entries, sizeof(u32), GFP_KERNEL);
+		if (!fileset_entries)
+			return -ENOMEM;
+
+		fwnode_property_read_u32_array(function_node, fileset_name,
+					       fileset_entries, num_entries);
+
+		for (j = 0, num_files = 0; j < num_entries; num_files++) {
+			struct sdca_fdl_file *file = &files[num_files];
+
+			file->vendor_id = fileset_entries[j++];
+			file->file_id = fileset_entries[j++];
+			file->fdl_offset = fileset_entries[j++];
+
+			dev_info(dev, "file: %#x, vendor: %#x, offset: %#x\n",
+				 file->file_id, file->vendor_id, file->fdl_offset);
+		}
+
+		set->id = filesets_list[i];
+		set->num_files = num_files;
+		set->files = files;
+	}
+
+	function->fdl_data.swft = sdw->sdca_data.swft;
+	function->fdl_data.num_sets = num_sets;
+	function->fdl_data.sets = sets;
+
+	return 0;
+}
+
 /**
  * sdca_parse_function - parse ACPI DisCo for a Function
  * @dev: Pointer to device against which function data will be allocated.
@@ -2058,6 +2147,10 @@ int sdca_parse_function(struct device *dev, struct sdw_slave *sdw,
 	if (ret < 0)
 		return ret;
 
+	ret = find_sdca_filesets(dev, sdw, function_desc->node, function);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 EXPORT_SYMBOL_NS(sdca_parse_function, "SND_SOC_SDCA");
-- 
2.47.3

