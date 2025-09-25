Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A262F5A16
	for <linux-sound@vger.kernel.org>; Thu, 25 Sep 2025 10:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758797663; cv=fail; b=X4OBNJ8Q2DvZXanDDEGDimk1Rj6RE/MeLeCfjHEQdb0D4e+xnMhZPO5TWQgdrD3vaWCZkRJ1zBgVTS2s06DDp+mCLuXnrcXLQpGtuIxPq7ZSOfTaSoET45dqO1Jaly20CsgNEOfqNNSC4QjHatSz81FniAEAXl+8OgNQNJulojU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758797663; c=relaxed/simple;
	bh=Uh10q/h/FHndYlGmKVMeLu3G+Yu1QIhQQZOKpFl1REc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HINco25e68ehbFcf23jjEwZhSspEa1C8cjBt3YbpCb4AHjqJlJpKSoV02sTEiKhhRETfkGpIHM+dQ87RNhHus/Q3QxMQPPJZaLnLKvSZBwAKlRJfKDhaM2247XIn0qwTiEGXOi0jQWa0OLT7XTLWX09yilf2E5i0X1mkOheOyXE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=D0URgBOb; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=NB+XdJR4; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="D0URgBOb";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="NB+XdJR4"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58P4PF6l2026617;
	Thu, 25 Sep 2025 05:54:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=9xhaP1ua/UWhAKA+ANqGSS8ayWfImDl4BrGqhzrc5QM=; b=
	D0URgBOb/14xEbz1g3JVJry3HKHFQsf6IzSuacGScgsdY8o5VVBytORpXlIq/RO1
	S1uOcaAibWRu9Z8Pg7SswiD4T79sHj1XaZutPe6LjvK7DxwBRnK84xbuBpB1gh1q
	0jluBUkkPsXK1sOUyW40uE4VWUVP4QbeCsINNTTxonUfKPXq16tS07QtYiszqtMR
	rVBDbpOX77QTYYQ9Ol0XL2xAbYIQTR8i+VP18656Rt5gbF9MjqrQP+ipisTzpjyr
	QV+H2uzgFw0O8+MFvheaJevxP6Aml0vfjOJz8akmE49+Ehei/HA7/6vV6WR4dFOq
	w/4TYUxWwI4ng1Egnw3cBA==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022131.outbound.protection.outlook.com [52.101.48.131])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 49cvharf6p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 25 Sep 2025 05:53:59 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WOhOoomD+uNptc+7EjjlMnQSz8qIvxP3Cmtnodoi+a0BlMnklrCMj16C45XcNbhDfk1cOu0zTlkQAC1PO+dv4ZRSo1Tt5JZL25fM1p5aKcmOeqafuRBxhNh0OPyhcUk84QhLm+z4ZlDwt1oh2DXvYnLxQWwGL1WncYZvyClmiffGFS6T4DC8udZSRdI0oC64jDOhYoPJlNLsLZ4qYhVNbQyBUsA0JqsaaBAQgXDdw+KRsWCELgZZvFWt/UTRpScuQjfR+S7Nsk+F4iuXitIGn7Xie9YOtwT+b0FIuhef+R2ZE4p2RxwvyaSl5GvaGBzpnhG01Z1sr/s74oxTYSWfVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9xhaP1ua/UWhAKA+ANqGSS8ayWfImDl4BrGqhzrc5QM=;
 b=kf17CNPQW1Sw7LiGwzxEzE7ns/rH4adTTzc8a7msSbCfgpfe7CMNnk6Bj+hToUcE/K+6kFxtvA3BVRnnYlqSbP4jGYI+AcZdfwJDA/HCL59m6lR+5XeKsB4Nl4etvWoEhMlA4VMvTFsU3y0RKo5JEtsEMlrx4IiO/UZa0GIXRs26mRmA2spwAeOgbXyA7tQ/GViquXZiQEhxQMxWBdi6t5QGyYHHwxsQntAkm+Hy9F/UiugDnTpMOh8G3MGS3n0qJdoQqawDewjCutejGQqL0XlKxFCleSXoaBOoCX1JdnzbPDjqJdSlPV7mT1VHT3aKjWIKKb9cbR9yZ11xAj8BKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9xhaP1ua/UWhAKA+ANqGSS8ayWfImDl4BrGqhzrc5QM=;
 b=NB+XdJR4Pz1fQwXiycx7a4gHmAJAp0OhEW8qPKfq4eMa1SRD+i13IxW3FM6Rjzjg5iuAt0EfrWmtcbUPgAkgXjPoZm6ipAATsdHqZ+/0nHz3bBe4MRC6Nl6ah7AyZnQemqNgXJ2/twkVlEHcmmub50uNDV7ihrIPgMmuGVqyIO4=
Received: from SA1PR02CA0020.namprd02.prod.outlook.com (2603:10b6:806:2cf::27)
 by BL1PPF8EA12D19D.namprd19.prod.outlook.com (2603:10b6:20f:fc04::ebe) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Thu, 25 Sep
 2025 10:53:54 +0000
Received: from SN1PEPF0002BA4B.namprd03.prod.outlook.com
 (2603:10b6:806:2cf:cafe::b1) by SA1PR02CA0020.outlook.office365.com
 (2603:10b6:806:2cf::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.23 via Frontend Transport; Thu,
 25 Sep 2025 10:53:53 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF0002BA4B.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.9
 via Frontend Transport; Thu, 25 Sep 2025 10:53:52 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B96F7406648;
	Thu, 25 Sep 2025 10:53:46 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id AF045820249;
	Thu, 25 Sep 2025 10:53:46 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 16/19] ASoC: SDCA: Add completion for FDL start and stop
Date: Thu, 25 Sep 2025 11:53:38 +0100
Message-ID: <20250925105341.194178-17-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4B:EE_|BL1PPF8EA12D19D:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 495b1c6b-0130-43ea-01a5-08ddfc21d0cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PR48DrYa5P8qS5d6xwYu+tGGEmy80uR88Juqote47wNARXtAYKdtcnuaxyMe?=
 =?us-ascii?Q?apdm4VrH/qY6PTrIBjM8qKVptjheOvUESj0pFJDmpTZFWP6GLTJzD03nlrZ4?=
 =?us-ascii?Q?MomsLyX7PYPyC00c9B2/7SMpJo5UMp3HvqMubyojSINnZEW46obM1czld9jn?=
 =?us-ascii?Q?d7cwiVGw2CeY8bKgNAZhBhYRB9kbiFfmtTN7mxOZDkAd486TmsRJNIbGQ+yd?=
 =?us-ascii?Q?6qFb70gf/jVGUCWN6dpGhjIgiDqD94LR3wBYpWPcqcUe1vWAwa7zKK1PSeif?=
 =?us-ascii?Q?84+e8HtW1nBj1fxRsXaNXwL7kNc2FqoMaNBJ1T0fil3JqMOTytgfxo0A0zgF?=
 =?us-ascii?Q?/9fpCAUTc8CudrTMxKxULwX6AZgp4O0H5/EKdV5Tbmp5YPM4TghIWXGaLuST?=
 =?us-ascii?Q?gV83EXz6h8mf9DQujEs3LJHP+tTj+jBBiulOBVu+xFU8JqYLrbQAfVN1/F/W?=
 =?us-ascii?Q?gi5lByBarO/Yhgl5RpvWSnAyHcrtb8UlgV1N2AadrtkemmjgnHHpjGcSgjRu?=
 =?us-ascii?Q?xCk4OfWR0FuRn+2hFprjJIK9Fetg2qP1tAa/lTSYfYUh/jAUITiLwGq8NAyJ?=
 =?us-ascii?Q?m2wLi65CXgz70B124KEk9DfkqODRvFTun2gRXPlxCpdDLUaKiaf9f6rtGb+t?=
 =?us-ascii?Q?70JqAwWRmD/pDsaejqEG8U0xLQjU2/rqoKw3KGkpXn1zfqNPlzFT1Gu8kdgs?=
 =?us-ascii?Q?v5vM0f9UQnv7ZVNcT3XOKo9XoIybTdnERpdJ/zk6uxgxF29TpIEgCCFGbDny?=
 =?us-ascii?Q?wLGcBHdkSSKrk27nia0ySjuwim1Ky7ci8JwKW05sCspUJ/r8kSI6OZYHelvw?=
 =?us-ascii?Q?nkbo0tgT6VqIrWf/OROm8DlB1axL7ofghwmOiASWTDKaxw7b61hmoTERjvxR?=
 =?us-ascii?Q?r7QUAJK2V0h654KuOgH4oPJR7SMDu9I3Qjmpef7Yy2xN9Y3+f+p9QKMjvh4w?=
 =?us-ascii?Q?2zU4rY46/HDWEgDIbZJQLtbNS5omkQcLcMkley4YVpC6AMYwqF3dSwumCqbj?=
 =?us-ascii?Q?YfkByi7VohkkYDYDUwXRKwLBElsL18kehRfvuIH2F1gxRRlaXZgVASQjlIt7?=
 =?us-ascii?Q?vNuKE0bVkdGRMJnV6GgsdVHN0eftgt+xhIQdTxqDTedanzItxoQ2ElUr+kz6?=
 =?us-ascii?Q?iLhJAVlj3kblvqUBi3l72yqW6TiOJ72cqrWnylr5fOvw7kmUT4+MFvyn/VO2?=
 =?us-ascii?Q?wqRTWWRI2mkiiJX+kNxhwJ9XM325fboqBOhvx1It3x4XITKj5KAgvqnwGAPT?=
 =?us-ascii?Q?GAzMaUzVnS+ZLi/HzcD0/cSSA2upWbfxm4bDjnnhjfwzEeGm/0yY75Ix/X6W?=
 =?us-ascii?Q?4NRtvgK6gLiQ59bjEMDbyt/DaM+vLpwZbKwpu1qzY2cAAfTKNy2zBXrE8LDc?=
 =?us-ascii?Q?fBh9eSFgpCkdKVYdGoJkWqkJZ2o0We/R5NPy7m2lvm/aOk15ISExv0qZNYfX?=
 =?us-ascii?Q?NBzMkMwMK5+OI2rVmwt+QBvKqVuXj3i51Xx8fbYc8VYk45Ie1zkzkPHAHXig?=
 =?us-ascii?Q?kuVznrUadIuKaPUTLzE+uOEsE6ykNvee0Tg+?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 10:53:52.0975
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 495b1c6b-0130-43ea-01a5-08ddfc21d0cf
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF0002BA4B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PPF8EA12D19D
X-Proofpoint-GUID: 7vFYhcwEwP-3BMKqo6yTQn5T5uF8N9Fb
X-Proofpoint-ORIG-GUID: 7vFYhcwEwP-3BMKqo6yTQn5T5uF8N9Fb
X-Authority-Analysis: v=2.4 cv=dL+mmPZb c=1 sm=1 tr=0 ts=68d51f47 cx=c_pps
 a=6zwKzwLBI9vfJyHbw/m+Xw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=QyXUC8HyAAAA:8
 a=w1d2syhTAAAA:8 a=8ToN6VyAo-4Z1emjpr8A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDEwMiBTYWx0ZWRfX0AqVf4IdlUA7
 Oub0j8GtHngStD8kYoDCg/N6jsmeuDwsSHQCVjR75vXRprkJsNArOaFiI9GHj6Q0srTcmj672BQ
 fRxRD+UCqD1Zx+0lBPD4tidBjaTZ87umIq9t0wFyYTBLLRXwF4IAf/STSRkxqOSucGuMQ5cqKEe
 WZ5692ThoaAf5eoCnt7+vXwcXD5K/QPh47BG7A9gwPA7DABLv3PVi05/pd+z3wCdvM9GzGN5wio
 3h3wO8lVRmRnTcc8IbqEuS+RxOzblu5y7g8yFKh9kXBD/0aVV7jEjb2sXb2ss19oydYlX/g6YtC
 tjr7wpgX07j5RX8hZo5HyV3mqbiRsh+aTcLpF1zfwlLbnWY2xjLs/KoPMLqtXU=
X-Proofpoint-Spam-Reason: safe

Add some completions and a helper function to allow other parts of the
system to wait for FDL to complete. The sdca_fdl_sync() function will
wait until it completes a full time out without a new FDL request
happening, this ensures that even parts requiring multiple rounds of FDL
should be fully downloaded before the driver boot continues.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v2:
 - Reduce number of FDL retries

 include/sound/sdca_fdl.h  | 10 ++++++
 sound/soc/sdca/sdca_fdl.c | 75 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 85 insertions(+)

diff --git a/include/sound/sdca_fdl.h b/include/sound/sdca_fdl.h
index 8b025aff4a0cd..4ea000d6acef4 100644
--- a/include/sound/sdca_fdl.h
+++ b/include/sound/sdca_fdl.h
@@ -10,18 +10,26 @@
 #ifndef __SDCA_FDL_H__
 #define __SDCA_FDL_H__
 
+#include <linux/completion.h>
+
 struct device;
 struct regmap;
 struct sdca_fdl_set;
 struct sdca_function_data;
 struct sdca_interrupt;
+struct sdca_interrupt_info;
 
 /**
  * struct fdl_state - FDL state structure to keep data between interrupts
+ * @begin: Completion indicating the start of an FDL download cycle.
+ * @done: Completion indicating the end of an FDL download cycle.
  * @set: Pointer to the FDL set currently being downloaded.
  * @file_index: Index of the current file being processed.
  */
 struct fdl_state {
+	struct completion begin;
+	struct completion done;
+
 	struct sdca_fdl_set *set;
 	int file_index;
 };
@@ -51,6 +59,8 @@ struct fdl_state {
 
 int sdca_fdl_alloc_state(struct sdca_interrupt *interrupt);
 int sdca_fdl_process(struct sdca_interrupt *interrupt);
+int sdca_fdl_sync(struct device *dev, struct sdca_function_data *function,
+		  struct sdca_interrupt_info *info);
 
 int sdca_reset_function(struct device *dev, struct sdca_function_data *function,
 			struct regmap *regmap);
diff --git a/sound/soc/sdca/sdca_fdl.c b/sound/soc/sdca/sdca_fdl.c
index 8a15c6300556c..39298314f69c9 100644
--- a/sound/soc/sdca/sdca_fdl.c
+++ b/sound/soc/sdca/sdca_fdl.c
@@ -14,6 +14,7 @@
 #include <linux/firmware.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/sprintf.h>
 #include <linux/soundwire/sdw.h>
@@ -63,6 +64,71 @@ int sdca_reset_function(struct device *dev, struct sdca_function_data *function,
 }
 EXPORT_SYMBOL_NS(sdca_reset_function, "SND_SOC_SDCA");
 
+/**
+ * sdca_fdl_sync - wait for a function to finish FDL
+ * @dev: Device pointer for error messages.
+ * @function: Pointer to the SDCA Function.
+ * @info: Pointer to the SDCA interrupt info for this device.
+ *
+ * Return: Zero on success or a negative error code.
+ */
+int sdca_fdl_sync(struct device *dev, struct sdca_function_data *function,
+		  struct sdca_interrupt_info *info)
+{
+	static const int fdl_retries = 6;
+	unsigned long begin_timeout = msecs_to_jiffies(100);
+	unsigned long done_timeout = msecs_to_jiffies(4000);
+	int nfdl;
+	int i, j;
+
+	for (i = 0; i < fdl_retries; i++) {
+		nfdl = 0;
+
+		for (j = 0; j < SDCA_MAX_INTERRUPTS; j++) {
+			struct sdca_interrupt *interrupt = &info->irqs[j];
+			struct fdl_state *fdl_state;
+			unsigned long time;
+
+			if (interrupt->function != function ||
+			    !interrupt->entity || !interrupt->control ||
+			    interrupt->entity->type != SDCA_ENTITY_TYPE_XU ||
+			    interrupt->control->sel != SDCA_CTL_XU_FDL_CURRENTOWNER)
+				continue;
+
+			fdl_state = interrupt->priv;
+			nfdl++;
+
+			/*
+			 * Looking for timeout without any new FDL requests
+			 * to imply the device has completed initial
+			 * firmware setup. Alas the specification doesn't
+			 * have any mechanism to detect this.
+			 */
+			time = wait_for_completion_timeout(&fdl_state->begin,
+							   begin_timeout);
+			if (!time) {
+				dev_dbg(dev, "no new FDL starts\n");
+				nfdl--;
+				continue;
+			}
+
+			time = wait_for_completion_timeout(&fdl_state->done,
+							   done_timeout);
+			if (!time) {
+				dev_err(dev, "timed out waiting for FDL to complete\n");
+				return -ETIMEDOUT;
+			}
+		}
+
+		if (!nfdl)
+			return 0;
+	}
+
+	dev_err(dev, "too many FDL requests\n");
+	return -ETIMEDOUT;
+}
+EXPORT_SYMBOL_NS_GPL(sdca_fdl_sync, "SND_SOC_SDCA");
+
 static char *fdl_get_sku_filename(struct device *dev,
 				  struct sdca_fdl_file *fdl_file)
 {
@@ -230,6 +296,9 @@ static void fdl_end(struct sdca_interrupt *interrupt)
 
 	fdl_state->set = NULL;
 
+	pm_runtime_put(interrupt->dev);
+	complete(&fdl_state->done);
+
 	dev_dbg(interrupt->dev, "completed FDL process\n");
 }
 
@@ -242,6 +311,9 @@ static int fdl_status_process(struct sdca_interrupt *interrupt, unsigned int sta
 	case SDCA_CTL_XU_FDLD_NEEDS_SET:
 		dev_dbg(interrupt->dev, "starting FDL process...\n");
 
+		pm_runtime_get(interrupt->dev);
+		complete(&fdl_state->begin);
+
 		fdl_state->file_index = 0;
 		fdl_state->set = fdl_get_set(interrupt);
 		fallthrough;
@@ -369,6 +441,9 @@ int sdca_fdl_alloc_state(struct sdca_interrupt *interrupt)
 	if (!fdl_state)
 		return -ENOMEM;
 
+	init_completion(&fdl_state->begin);
+	init_completion(&fdl_state->done);
+
 	interrupt->priv = fdl_state;
 
 	return 0;
-- 
2.47.3

