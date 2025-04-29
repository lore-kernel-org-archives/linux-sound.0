Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6413E29DB7E
	for <linux-sound@vger.kernel.org>; Tue, 29 Apr 2025 08:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745917166; cv=fail; b=HhzCMdxT6f6UoR+YkQhzg29H622D/juIwBBmAKIK/6NpOTdSgrj733Fkx/k/s4efmCJcx51UqkQgdSRTInP7xcMDcezBFsKMrUz9Eb5pqR7dwIibqSurU7ympGViVXln+SVwvxX06yo0aE/4A6kCO9DywZKC9/J84FoRUloOtCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745917166; c=relaxed/simple;
	bh=uOLpCI63jMICQ2GuPlQLI7WHre8O5sWR4P0X1CTm9NM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fd98ool6V94Uy3RUA/nWYjUDRbyadU50jaMDi5c8vsNTNQ0s7tSgqt1+5Yd43zhSpQfX7a6lhqsIs/5axivdrGZmTL1xP1v9Ks6gUFBoysVkop8N0XdbQqhv9r0CBFpgMB+q3/0rj2yquSl+RbeK8gr9x1s2zrZ0Li0j60LW3yM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=S60uzyNz; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=zYLvi0uR; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="S60uzyNz";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="zYLvi0uR"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53T4QfCI022415;
	Tue, 29 Apr 2025 03:59:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=QvKsRhQ8PEh+XzybctbqFDVGB1nkXuzQZKOAaV2wGzw=; b=
	S60uzyNzyoKtIEuvocjlJGPr7z6vwrZIe1VCejNGgZQt4bE/o602veFc8xoasE6n
	+nr5rgGehePKB5baJDsrgEFXaEmCtAU9ysfMzn2sGMJ8/Xfwrl4rc8VzH4Pp2yI3
	7jugJ2Xwy8OVIvGqGpTGYw5AK3paSKQiO1j61MrRL2QiwiMXuYZtO7c5r2LdCaYy
	SjiOw5PCNYRh7vX+6noG0hQ7UgLE4Utl7MydAnCEkKMn+n0G7554dbh8di7vFEyW
	Vw/wZD0CQYAp+BYwHZueKywopk9YmGd85+gVuf/4kMJG78SVUsVKhzZBsSGbPXRb
	00kn5GDCl27Xts5y5uDDNQ==
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2045.outbound.protection.outlook.com [104.47.73.45])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 468vw1bccq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 03:59:05 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hDqupzKlv4w6OGzvE8OQy3CvoJlCjs2vl0/71YdiTqDJIMrSTn3/en+fikPd8h7/6MB7TrUZc4x9ofv3agtF5jtM+DJ3WCDNnB8C8PBX1jpwA0Z5IiwDaFGY6P0j3q1StvT3WBPZxxvrTyIaZ58GT/+Zcn2dtmub1f5z+JM3qbHKr2KQCsjKknH39imRWliLxwWsxcjvB9QJn+ad8E4U5y240SpcqaJarOvxf8O1IpXKw5DUh7vjLGuKwfnZFqKt1anGTa+JrxaAMo2tjBRoJXegCjCpIiyey2qZNxto5TNk10BKWpwgi9MOoUWdLxhY7QqszrK1Ou6IEoX+28K/YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QvKsRhQ8PEh+XzybctbqFDVGB1nkXuzQZKOAaV2wGzw=;
 b=xzWF/Ja5Oye82k+y7DO6PGCY96t5VYYbLBjWAbkHtlg1R92XMsbjH9iuBPlK/zuX72GbAzin17SjA0SNQOw9Fjb9L3HM9UQ/osI+AuA4a7JsL0mFU+SoGBPtzKLV8QB9C/LQOnh6bhcKNIw8OjiJsVz6X5MgXhIOF/qx1NI1uM3f8H6azdO4I6GiDV8MXIBzcE6AS4hDct4WSKGSZaCspzkCI/VaUdWY8n2gJdGcnoHbtwcVmQVlYFBObP9V4bIbWodUY+c3AUrQhITlQHLwHOPob6jilI1Y2WLwGZij5gnqNWcO6RokENPVTD0E4eJGjlkZUJDlOW9zgT7k/8incQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QvKsRhQ8PEh+XzybctbqFDVGB1nkXuzQZKOAaV2wGzw=;
 b=zYLvi0uR0U1Py3U02J4T7iUMJ64JYyOn0aEEJFYjnpGpB6+x/KptAKF4Ltdv6JwPw3AiAOP6jxqeq+BEeXH3nawy84S4cFQLsrY3SkGWECmDM72CEOiZpWbTq1bdpgvV+LXYLZ6fWRwtow7uDG1mSesQ2CXwi2t6uCg0zA/H098=
Received: from SJ0PR13CA0218.namprd13.prod.outlook.com (2603:10b6:a03:2c1::13)
 by LV8PR19MB8198.namprd19.prod.outlook.com (2603:10b6:408:184::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 08:58:58 +0000
Received: from CY4PEPF0000E9DA.namprd05.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::a) by SJ0PR13CA0218.outlook.office365.com
 (2603:10b6:a03:2c1::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8678.23 via Frontend Transport; Tue,
 29 Apr 2025 08:58:58 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000E9DA.mail.protection.outlook.com (10.167.241.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8678.33
 via Frontend Transport; Tue, 29 Apr 2025 08:58:57 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C9B2440654F;
	Tue, 29 Apr 2025 08:58:53 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id B2745820244;
	Tue, 29 Apr 2025 08:58:53 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v4 5/5] ASoC: SDCA: Create DAI drivers from DisCo
Date: Tue, 29 Apr 2025 09:58:53 +0100
Message-Id: <20250429085853.258038-6-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250429085853.258038-1-ckeepax@opensource.cirrus.com>
References: <20250429085853.258038-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DA:EE_|LV8PR19MB8198:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b29fffc0-051a-4a9f-466b-08dd86fc13b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|61400799027|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cWTDHjQRMyVUwN9ffAuQ0jYVk31yq9g/eJPnfOiw1df51IHoTV4vPUue6M6g?=
 =?us-ascii?Q?XYWxkoLZZJ+/MXRynAlg5XF0B46EMh+xWRUIP51B5pgbKlF149deFZuwy3cK?=
 =?us-ascii?Q?9pLsB2/16pJl3CoA1kUGY3/CWg+Z3xsBvJMx4SSscI2KHLrT0N8IGY9dO9lN?=
 =?us-ascii?Q?PSY2YhJjBmH1jWEX4E8+0/nj7ct2oaCUahN/mN4Y6YfSG0JUmsuGUrzQ0RRw?=
 =?us-ascii?Q?6BaAgN9G87la1wTHm13ZFxruUyW4NZ/9QvXpq1zYjcHbsPQ3ZTBPmav0onWd?=
 =?us-ascii?Q?Prm4kzJFJXLlOviq/7yBUfuNpnq9MCe3y1YtDN2eq5w7/j0UqPop5nyAg8L9?=
 =?us-ascii?Q?2dNzsIFKNv/IEAJ+mGzrWsFSUxJDwCs9dlK8q+hnA/HylsfLRRClLQlxLkjb?=
 =?us-ascii?Q?OAQ5kyZB8nZfzMSZ4iNSDGxJyClY7OFGqg/c19cyMANlShtbdiFNGi2QftO+?=
 =?us-ascii?Q?cymCeCaZnKz+gaXczL3QhpXlHwXqt37u4Pvche50cpChwWnqH4c60WGUPGav?=
 =?us-ascii?Q?csQhsdXJfmFot9dAZ+HVRF4HmBDYP0pkonnkFmdgD5TW4usGSw7rElcP9Y/Z?=
 =?us-ascii?Q?qzFhOXSu8g95AdfVYNBsWWRI+lTcyV/YAxZ2avPW1GHBh3gYwZkIIWoPII82?=
 =?us-ascii?Q?JdFANIkqrT0j92swBeYOuDueKkPrwFM2ydJ9wjc/LE+xP+hk5O0zBaWfMncX?=
 =?us-ascii?Q?yfTojAmNoiWFeW7Mh1KoczKtQ1ANT2mSXkDQNNb2G1jsqnOHfTqVxvJHlwD2?=
 =?us-ascii?Q?zRtaR6nwXEwREeHpt66B3d8Oa9EVJ4x8GNC28noMtIVYyJB0pE0rUgApqEty?=
 =?us-ascii?Q?eLwv9jrjuONkwXvEXokh/ZviOJVHZHHR7gS+ZYsmvX21jSARFiNf7+KhU2MC?=
 =?us-ascii?Q?zOtGvM0FuWdBO+t2BeoYHzQeB02CfEBPKIer31BELHs8RhX4oloSml4xkwbF?=
 =?us-ascii?Q?l2EUqs7wiYi5HCj6POkQFS3Y5AjyZO+OtRqNdQvK+4raK7YqL6scV1AwIJBr?=
 =?us-ascii?Q?C8WZisg7YDlV54AexUfGKJWW4VVvJsDabM8OphNa+SIv1/VRSBimaA0E7GBM?=
 =?us-ascii?Q?1/KDBdukmK1vAICSf3UPc63UEiV4jfI2xahvGRcVqCjPXvK5iGmszQgrX0rY?=
 =?us-ascii?Q?hZt9HYAf64T/PwQ3iQaabJqyeO0n1wICYDgW9Hwuf1QQkAv+LuE0+m6tNAC9?=
 =?us-ascii?Q?9OlFc2E2eQEFk14Vh01HRQSyxn/jitdAF5Ji1z3sC8L4UT8ZTMNJkDuwgMoQ?=
 =?us-ascii?Q?6gqtM4sjulJ+TIgAd0lU5tTvFUKRd9sKmzYkW61u9VJ9niJ+/OHvSlPDSJug?=
 =?us-ascii?Q?5Rd7q7kOmJg+4PxJeR1sAyut2CbtdpwbbA47dlynu2VesAVicap+LfmyPZkh?=
 =?us-ascii?Q?+uPByL+Kb/LLuTQgNU536CELktmB/xYQAz5U7Nc3jLXdHp8kG5XR8d3GpzmD?=
 =?us-ascii?Q?FNMo3/y9EmAD3/ltFynS11+rAueegnTKPvXdEFIsCIy8Ti/8L5IwS8N28iRX?=
 =?us-ascii?Q?uZHFPggzfBAyZZcy9cXgCwLdf5c4wlIdk7kY?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(61400799027)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 08:58:57.3977
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b29fffc0-051a-4a9f-466b-08dd86fc13b3
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9DA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR19MB8198
X-Proofpoint-GUID: OjyjkzNwlO-Q4W2khCE7hBfCoZyIH2_9
X-Proofpoint-ORIG-GUID: OjyjkzNwlO-Q4W2khCE7hBfCoZyIH2_9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA2NiBTYWx0ZWRfXz6TLNqOii2fy +Zpqk1ZZoj5fZplWdDB1SvZzpRaGLdcNY+mmFQoofw6OvpOq3XJn780NjbAVGRogm7v+tyAtz/U QYeEisQAE+Zs/YmqFhLvgyOTufY0zxTXuFWbpnLqbTcBkx2HZnoQKdQRygSn8WSLjH+3A0hijRa
 soPjDNM6+kr1EEo4nPnCRngAo+j+9On2L7UwIlZlGoDrNWVaYEzkSYBlvpbkmHMzgWm1ech8Az8 edEVv2x7x5FuYbzlunOVVFh2R6GCiJG9nwnfbLpp94TSHqOa66ePfFIvsj/WN37ZbS5yKGRRNZ/ aqj+m20Z45mm+rLCq3cFQhJztaQK55ek9Yng5FM+04iy6Cr5jFmj7Pd99dgBrqLEMgeXtJtnMpt
 cARFwex/4zXbGHD3zV26AvaB+eM5PsFD1WdnUXFBmOek1FhGzc0shPf2KhTiAQcDuczfw9jS
X-Authority-Analysis: v=2.4 cv=Dd4XqutW c=1 sm=1 tr=0 ts=681094d9 cx=c_pps a=o99l/OlIsmxthp48M8gYaQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=XR8D0OoHHMoA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8
 a=TKdQKM3kYW3HcpqIAtQA:9 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-Spam-Reason: safe

Use the previously parsed DisCo information from ACPI to create the DAI
drivers required to connect an SDCA Function into an ASoC soundcard.

Create DAI driver structures and populate the supported sample rates
and sample widths into them based on the Input/Output Terminal and any
attach Clock Source entities. More complex relationships with channels
etc. will be added later as constraints as part of the DAI startup.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v3.

 include/sound/sdca_asoc.h     |  12 +-
 include/sound/sdca_function.h |  23 ++++
 sound/soc/sdca/sdca_asoc.c    | 226 +++++++++++++++++++++++++++++++++-
 3 files changed, 255 insertions(+), 6 deletions(-)

diff --git a/include/sound/sdca_asoc.h b/include/sound/sdca_asoc.h
index d19e7e969283..9121531f0826 100644
--- a/include/sound/sdca_asoc.h
+++ b/include/sound/sdca_asoc.h
@@ -14,11 +14,14 @@ struct device;
 struct sdca_function_data;
 struct snd_kcontrol_new;
 struct snd_soc_component_driver;
+struct snd_soc_dai_driver;
+struct snd_soc_dai_ops;
 struct snd_soc_dapm_route;
 struct snd_soc_dapm_widget;
 
 int sdca_asoc_count_component(struct device *dev, struct sdca_function_data *function,
-			      int *num_widgets, int *num_routes, int *num_controls);
+			      int *num_widgets, int *num_routes, int *num_controls,
+			      int *num_dais);
 
 int sdca_asoc_populate_dapm(struct device *dev, struct sdca_function_data *function,
 			    struct snd_soc_dapm_widget *widgets,
@@ -26,9 +29,14 @@ int sdca_asoc_populate_dapm(struct device *dev, struct sdca_function_data *funct
 int sdca_asoc_populate_controls(struct device *dev,
 				struct sdca_function_data *function,
 				struct snd_kcontrol_new *kctl);
+int sdca_asoc_populate_dais(struct device *dev, struct sdca_function_data *function,
+			    struct snd_soc_dai_driver *dais,
+			    const struct snd_soc_dai_ops *ops);
 
 int sdca_asoc_populate_component(struct device *dev,
 				 struct sdca_function_data *function,
-				 struct snd_soc_component_driver *component_drv);
+				 struct snd_soc_component_driver *component_drv,
+				 struct snd_soc_dai_driver **dai_drv, int *num_dai_drv,
+				 const struct snd_soc_dai_ops *ops);
 
 #endif // __SDCA_ASOC_H__
diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index 77ffb1f4e1ca..be7e4a88cbed 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -168,6 +168,20 @@ enum sdca_ot_controls {
 	SDCA_CTL_OT_NDAI_PACKETTYPE			= 0x17,
 };
 
+/**
+ * enum sdca_usage_range - Column definitions for Usage
+ */
+enum sdca_usage_range {
+	SDCA_USAGE_NUMBER				= 0,
+	SDCA_USAGE_CBN					= 1,
+	SDCA_USAGE_SAMPLE_RATE				= 2,
+	SDCA_USAGE_SAMPLE_WIDTH				= 3,
+	SDCA_USAGE_FULL_SCALE				= 4,
+	SDCA_USAGE_NOISE_FLOOR				= 5,
+	SDCA_USAGE_TAG					= 6,
+	SDCA_USAGE_NCOLS				= 7,
+};
+
 /**
  * enum sdca_mu_controls - SDCA Controls for Mixer Unit
  *
@@ -246,6 +260,15 @@ enum sdca_cs_controls {
 	SDCA_CTL_CS_SAMPLERATEINDEX			= 0x10,
 };
 
+/**
+ * enum sdca_samplerateindex_range - Column definitions for SampleRateIndex
+ */
+enum sdca_samplerateindex_range {
+	SDCA_SAMPLERATEINDEX_INDEX			= 0,
+	SDCA_SAMPLERATEINDEX_RATE			= 1,
+	SDCA_SAMPLERATEINDEX_NCOLS			= 2,
+};
+
 /**
  * enum sdca_cx_controls - SDCA Controls for Clock Selector
  *
diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index 9c7c0737a347..dfd6405decf9 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -89,6 +89,8 @@ static bool exported_control(struct sdca_control *control)
  * required number of DAPM routes for the Function.
  * @num_controls: Output integer pointer, will be filled with the
  * required number of ALSA controls for the Function.
+ * @num_dais: Output integer pointer, will be filled with the
+ * required number of ASoC DAIs for the Function.
  *
  * This function counts various things within the SDCA Function such
  * that the calling driver can allocate appropriate space before
@@ -97,13 +99,15 @@ static bool exported_control(struct sdca_control *control)
  * Return: Returns zero on success, and a negative error code on failure.
  */
 int sdca_asoc_count_component(struct device *dev, struct sdca_function_data *function,
-			      int *num_widgets, int *num_routes, int *num_controls)
+			      int *num_widgets, int *num_routes, int *num_controls,
+			      int *num_dais)
 {
 	int i, j;
 
 	*num_widgets = function->num_entities - 1;
 	*num_routes = 0;
 	*num_controls = 0;
+	*num_dais = 0;
 
 	for (i = 0; i < function->num_entities - 1; i++) {
 		struct sdca_entity *entity = &function->entities[i];
@@ -114,6 +118,7 @@ int sdca_asoc_count_component(struct device *dev, struct sdca_function_data *fun
 			*num_routes += !!entity->iot.clock;
 			*num_routes += !!entity->iot.is_dataport;
 			*num_controls += !entity->iot.is_dataport;
+			*num_dais += !!entity->iot.is_dataport;
 			break;
 		case SDCA_ENTITY_TYPE_PDE:
 			*num_routes += entity->pde.num_managed;
@@ -1021,6 +1026,205 @@ int sdca_asoc_populate_controls(struct device *dev,
 }
 EXPORT_SYMBOL_NS(sdca_asoc_populate_controls, "SND_SOC_SDCA");
 
+static unsigned int rate_find_mask(unsigned int rate)
+{
+	switch (rate) {
+	case 0:
+		return SNDRV_PCM_RATE_8000_768000;
+	case 5512:
+		return SNDRV_PCM_RATE_5512;
+	case 8000:
+		return SNDRV_PCM_RATE_8000;
+	case 11025:
+		return SNDRV_PCM_RATE_11025;
+	case 16000:
+		return SNDRV_PCM_RATE_16000;
+	case 22050:
+		return SNDRV_PCM_RATE_22050;
+	case 32000:
+		return SNDRV_PCM_RATE_32000;
+	case 44100:
+		return SNDRV_PCM_RATE_44100;
+	case 48000:
+		return SNDRV_PCM_RATE_48000;
+	case 64000:
+		return SNDRV_PCM_RATE_64000;
+	case 88200:
+		return SNDRV_PCM_RATE_88200;
+	case 96000:
+		return SNDRV_PCM_RATE_96000;
+	case 176400:
+		return SNDRV_PCM_RATE_176400;
+	case 192000:
+		return SNDRV_PCM_RATE_192000;
+	case 352800:
+		return SNDRV_PCM_RATE_352800;
+	case 384000:
+		return SNDRV_PCM_RATE_384000;
+	case 705600:
+		return SNDRV_PCM_RATE_705600;
+	case 768000:
+		return SNDRV_PCM_RATE_768000;
+	case 12000:
+		return SNDRV_PCM_RATE_12000;
+	case 24000:
+		return SNDRV_PCM_RATE_24000;
+	case 128000:
+		return SNDRV_PCM_RATE_128000;
+	default:
+		return 0;
+	}
+}
+
+static u64 width_find_mask(unsigned int bits)
+{
+	switch (bits) {
+	case 0:
+		return SNDRV_PCM_FMTBIT_S8 | SNDRV_PCM_FMTBIT_S16_LE |
+		       SNDRV_PCM_FMTBIT_S20_LE | SNDRV_PCM_FMTBIT_S24_LE |
+		       SNDRV_PCM_FMTBIT_S32_LE;
+	case 8:
+		return SNDRV_PCM_FMTBIT_S8;
+	case 16:
+		return SNDRV_PCM_FMTBIT_S16_LE;
+	case 20:
+		return SNDRV_PCM_FMTBIT_S20_LE;
+	case 24:
+		return SNDRV_PCM_FMTBIT_S24_LE;
+	case 32:
+		return SNDRV_PCM_FMTBIT_S32_LE;
+	default:
+		return 0;
+	}
+}
+
+static int populate_rate_format(struct device *dev,
+				struct sdca_function_data *function,
+				struct sdca_entity *entity,
+				struct snd_soc_pcm_stream *stream)
+{
+	struct sdca_control_range *range;
+	unsigned int sample_rate, sample_width;
+	unsigned int clock_rates = 0;
+	unsigned int rates = 0;
+	u64 formats = 0;
+	int sel, i;
+
+	switch (entity->type) {
+	case SDCA_ENTITY_TYPE_IT:
+		sel = SDCA_CTL_IT_USAGE;
+		break;
+	case SDCA_ENTITY_TYPE_OT:
+		sel = SDCA_CTL_OT_USAGE;
+		break;
+	default:
+		dev_err(dev, "%s: entity type has no usage control\n",
+			entity->label);
+		return -EINVAL;
+	}
+
+	if (entity->iot.clock) {
+		range = selector_find_range(dev, entity->iot.clock,
+					    SDCA_CTL_CS_SAMPLERATEINDEX,
+					    SDCA_SAMPLERATEINDEX_NCOLS, 0);
+		if (!range)
+			return -EINVAL;
+
+		for (i = 0; i < range->rows; i++) {
+			sample_rate = sdca_range(range, SDCA_SAMPLERATEINDEX_RATE, i);
+			clock_rates |= rate_find_mask(sample_rate);
+		}
+	} else {
+		clock_rates = UINT_MAX;
+	}
+
+	range = selector_find_range(dev, entity, sel, SDCA_USAGE_NCOLS, 0);
+	if (!range)
+		return -EINVAL;
+
+	for (i = 0; i < range->rows; i++) {
+		sample_rate = sdca_range(range, SDCA_USAGE_SAMPLE_RATE, i);
+		sample_rate = rate_find_mask(sample_rate);
+
+		if (sample_rate & clock_rates) {
+			rates |= sample_rate;
+
+			sample_width = sdca_range(range, SDCA_USAGE_SAMPLE_WIDTH, i);
+			formats |= width_find_mask(sample_width);
+		}
+	}
+
+	stream->formats = formats;
+	stream->rates = rates;
+
+	return 0;
+}
+
+/**
+ * sdca_asoc_populate_dais - fill in an array of DAI drivers for a Function
+ * @dev: Pointer to the device against which allocations will be done.
+ * @function: Pointer to the Function information.
+ * @dais: Array of DAI drivers to be populated.
+ * @ops: DAI ops to be attached to each of the created DAI drivers.
+ *
+ * This function populates an array of ASoC DAI drivers from the DisCo
+ * information for a particular SDCA Function. Typically,
+ * snd_soc_asoc_count_component will be used to allocate an
+ * appropriately sized array before calling this function.
+ *
+ * Return: Returns zero on success, and a negative error code on failure.
+ */
+
+int sdca_asoc_populate_dais(struct device *dev, struct sdca_function_data *function,
+			    struct snd_soc_dai_driver *dais,
+			    const struct snd_soc_dai_ops *ops)
+{
+	int i, j;
+	int ret;
+
+	for (i = 0, j = 0; i < function->num_entities - 1; i++) {
+		struct sdca_entity *entity = &function->entities[i];
+		struct snd_soc_pcm_stream *stream;
+		const char *stream_suffix;
+
+		switch (entity->type) {
+		case SDCA_ENTITY_TYPE_IT:
+			stream = &dais[j].playback;
+			stream_suffix = "Playback";
+			break;
+		case SDCA_ENTITY_TYPE_OT:
+			stream = &dais[j].capture;
+			stream_suffix = "Capture";
+			break;
+		default:
+			continue;
+		}
+
+		if (!entity->iot.is_dataport)
+			continue;
+
+		stream->stream_name = devm_kasprintf(dev, GFP_KERNEL, "%s %s",
+						     entity->label, stream_suffix);
+		if (!stream->stream_name)
+			return -ENOMEM;
+		/* Channels will be further limited by constraints */
+		stream->channels_min = 1;
+		stream->channels_max = SDCA_MAX_CHANNEL_COUNT;
+
+		ret = populate_rate_format(dev, function, entity, stream);
+		if (ret)
+			return ret;
+
+		dais[j].id = i;
+		dais[j].name = entity->label;
+		dais[j].ops = ops;
+		j++;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(sdca_asoc_populate_dais, "SND_SOC_SDCA");
+
 /**
  * sdca_asoc_populate_component - fill in a component driver for a Function
  * @dev: Pointer to the device against which allocations will be done.
@@ -1035,16 +1239,19 @@ EXPORT_SYMBOL_NS(sdca_asoc_populate_controls, "SND_SOC_SDCA");
  */
 int sdca_asoc_populate_component(struct device *dev,
 				 struct sdca_function_data *function,
-				 struct snd_soc_component_driver *component_drv)
+				 struct snd_soc_component_driver *component_drv,
+				 struct snd_soc_dai_driver **dai_drv, int *num_dai_drv,
+				 const struct snd_soc_dai_ops *ops)
 {
 	struct snd_soc_dapm_widget *widgets;
 	struct snd_soc_dapm_route *routes;
 	struct snd_kcontrol_new *controls;
-	int num_widgets, num_routes, num_controls;
+	struct snd_soc_dai_driver *dais;
+	int num_widgets, num_routes, num_controls, num_dais;
 	int ret;
 
 	ret = sdca_asoc_count_component(dev, function, &num_widgets, &num_routes,
-					&num_controls);
+					&num_controls, &num_dais);
 	if (ret)
 		return ret;
 
@@ -1060,6 +1267,10 @@ int sdca_asoc_populate_component(struct device *dev,
 	if (!controls)
 		return -ENOMEM;
 
+	dais = devm_kcalloc(dev, num_dais, sizeof(*dais), GFP_KERNEL);
+	if (!dais)
+		return -ENOMEM;
+
 	ret = sdca_asoc_populate_dapm(dev, function, widgets, routes);
 	if (ret)
 		return ret;
@@ -1068,6 +1279,10 @@ int sdca_asoc_populate_component(struct device *dev,
 	if (ret)
 		return ret;
 
+	ret = sdca_asoc_populate_dais(dev, function, dais, ops);
+	if (ret)
+		return ret;
+
 	component_drv->dapm_widgets = widgets;
 	component_drv->num_dapm_widgets = num_widgets;
 	component_drv->dapm_routes = routes;
@@ -1075,6 +1290,9 @@ int sdca_asoc_populate_component(struct device *dev,
 	component_drv->controls = controls;
 	component_drv->num_controls = num_controls;
 
+	*dai_drv = dais;
+	*num_dai_drv = num_dais;
+
 	return 0;
 }
 EXPORT_SYMBOL_NS(sdca_asoc_populate_component, "SND_SOC_SDCA");
-- 
2.39.5

