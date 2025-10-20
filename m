Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B9D2773E5
	for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 15:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760975757; cv=fail; b=lOVOBzNm6dOvFmrTrIK9nWiGYu0eQGITW7M1SYMIshIoUBeMqeka6TgliyCwbUjPmMrLcCUGbx6PxyqEHKTAQeFt4RWSXc1tBD7ZFGR4b8HYFi4UdSDF3Izd9FlSEAF+Q/Z0bXvjQ4AjoDD+Ymd5don1e6/WIrXJ2Zn06GO9n1Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760975757; c=relaxed/simple;
	bh=Uh10q/h/FHndYlGmKVMeLu3G+Yu1QIhQQZOKpFl1REc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=movMY+PtszZOdjlrcELGHPQq283J6FHwEQGH5nagc6TavQCN9NHgScFZ+Uj33mbx3Ps95ClYNbXlnp//jspnqtDfso82D323x2MOQtonvgfDY8fIgFXnzUk3tmyMyCO51k5ak3b3b5hzSJDzpp0/qi0Ol7IYGw486r7BzpIcc9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=meEbBM1b; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=LeAly6ox; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="meEbBM1b";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="LeAly6ox"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59KEAYtv3744741;
	Mon, 20 Oct 2025 10:55:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=9xhaP1ua/UWhAKA+ANqGSS8ayWfImDl4BrGqhzrc5QM=; b=
	meEbBM1b2g94ZpJZdoz87CRzkhXR1nwzSKmU32fdEWySHJWtvPN8Q29XJXEyV4qB
	Xrgh86l9saqJJ3qe7xHkGKkb+LlwSK+60a+QW7Ph7gmjzFO//K7dhBS+uVsdjzUU
	b+2Ag4XBfiCt5ZK6lDeMDcWc4ZnH9di7HoI5cM6wb8ZAsLxH1QUh8Z6WcxryANJl
	UFIcNWwYtCS1E8sYI1GwGue7cjMuVl8h4zg5ELg6WeSAczQoikRfM8j5hT2YCTHq
	X0vGcTHD3Ho+Vemk6uzKBv2h/Ftf+nXqO5L92WYCRYi6eQnjJco3HO22ltcbG2Sm
	nykquR8RoLlqmHuMFPge6A==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021129.outbound.protection.outlook.com [52.101.62.129])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 49wnc4r8dk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 20 Oct 2025 10:55:28 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iNwmFJL2TerzzIRrFHqdqjQKSV+2XS/5ft9U1zonvBRCQT4lXDUuNsQqSmlzljl9x0YDUxLwZ9QO8BnVx4JbkPuTifXZ3HpTwC05sBWri1hsYHJoAs79THV1/Plu0nNfCQtQi2xqmgIo7d+jH3aDdpFr6QuNayMhAGUKP36B2dFSTjJzN637s3qSEadofVAtHkj+od8JFqwL9rUCLi10UZYYoTtd2HkgUIFqsCy1vP6xg99Uzf9D2U65vfkvot3FEt2ZJk+EhJlu64GMYIJALGh+LTJQhyzPlBHoWzNjYdWP16zxG3CRUm+3lSxf7K6iRVnD8An4QQspzYNlLiPd1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9xhaP1ua/UWhAKA+ANqGSS8ayWfImDl4BrGqhzrc5QM=;
 b=iaoZI9spdAkM8UqAaFvQGgiYtzXugDSejCWnjOps6qyVydWfTaTBa+o3zeyij+NAsYrijlveuZT0OMttdLdXjABBhqK7UmIAXW3sNrw+FBxC4TyMBsWt5u9evcX07TIrIiHAoVxA4DONOTjOYzoMopaNcmAGXIcSlYnNQp4N2D2s2dkBifuD405YR/pne+jfrplJIKFquoDhBQGepzopCH4xEKE8BMT1dJAw/xCrYyTTbeDjoO7PY9hMJ1H4B3yJvALthxEoK0wRGwMBNKW1VUoRvfzNs18TVlR/v5T0CQESn5Gv+0RSpSLW5hNMiGOR4nTgiB5LZj2mt507ntJJYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9xhaP1ua/UWhAKA+ANqGSS8ayWfImDl4BrGqhzrc5QM=;
 b=LeAly6oxJpivZjdAoHoWg4eNa/4kLQw/SC7Dxw5JfeW1PdLXnGr5jQ/XcgbajCsvhi1Q5PxcTMg+8W6P4qiD7AJ5022T/n6tt02jmlvQuCuWNOYwjtkHrPJwpkIQit99072vocFLtHP5T3u8Q4Q5PX4sX7rgFDKPzLAJybs2xWk=
Received: from SJ0PR05CA0084.namprd05.prod.outlook.com (2603:10b6:a03:332::29)
 by PH8PR19MB7808.namprd19.prod.outlook.com (2603:10b6:510:23b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 15:55:25 +0000
Received: from SJ5PEPF000001C9.namprd05.prod.outlook.com
 (2603:10b6:a03:332:cafe::2d) by SJ0PR05CA0084.outlook.office365.com
 (2603:10b6:a03:332::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.11 via Frontend Transport; Mon,
 20 Oct 2025 15:55:25 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001C9.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7
 via Frontend Transport; Mon, 20 Oct 2025 15:55:24 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E1108406647;
	Mon, 20 Oct 2025 15:55:17 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id CEB6A820244;
	Mon, 20 Oct 2025 15:55:17 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        peter.ujfalusi@linux.intel.com, shumingf@realtek.com,
        lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 RESEND 16/19] ASoC: SDCA: Add completion for FDL start and stop
Date: Mon, 20 Oct 2025 16:55:09 +0100
Message-ID: <20251020155512.353774-17-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251020155512.353774-1-ckeepax@opensource.cirrus.com>
References: <20251020155512.353774-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C9:EE_|PH8PR19MB7808:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4d7f5afe-85d2-4fce-89e1-08de0ff11509
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|61400799027|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KSdlN866l6jFS4hzVh0ahag2CZoDnv60fOjuxqmyF1Sm3t5qDd94rHwWxEfz?=
 =?us-ascii?Q?rJ+oGoHZ87ZXCeDqVh8uPHCZ5GqbsN94d/om0JFnZHvHF8lujUxg4A2xaNxJ?=
 =?us-ascii?Q?65TKQptt9X/htoAPK/inCs+4xqX+YUYn6yrzDciTMYUv3mpo3U39t205TXup?=
 =?us-ascii?Q?+YdWWk6oaSTFZG0x1WRpH50fE32jd69vgi0+yVjblw4FEcZgBlx7eKOb2j6v?=
 =?us-ascii?Q?wPUBYuIfhoXczhkqilHNZUq6gxMKlIwJkL8zbkdJ3RJ+v2KWLfek3XHBseY6?=
 =?us-ascii?Q?YZ/YXMvkcGNajDCnL+iST3GNcoJAHEuHyAQiDa872X3fDx58plxbLUmJPRiH?=
 =?us-ascii?Q?aGvIZODyJxwcN2Mn4OHxN8ftCgoS1IJIeIkMdd1HH8vI5FC/RrDeHcq/ABSH?=
 =?us-ascii?Q?K/6XfAonDFjzxf/dBZDxauWGy7ii1fHrniWLJjc+M/4MpwY77hjPs7Xj8Ogh?=
 =?us-ascii?Q?loK3IbDveXt8PZ+wK4Oeyg7F2L5GzG9Oq2N7aZjCx+gzYA660AYOwwx0xZrO?=
 =?us-ascii?Q?L7+MSA5TnfBZpTDUhUqpov72VKdMfoRBF/33zxqfad8mGZKG1hXcHc9X9J7A?=
 =?us-ascii?Q?vIp5lfVZnYOQHD/0k9cokDaNPasnDr3O+Y0akHry0b0+vx6hN2UtYo0SYmx5?=
 =?us-ascii?Q?vbWgymT5rC8gmgQBHBums5V/T5MwTjy8bn0WhL9/HpYWHgCmLUnXS1e7KvLK?=
 =?us-ascii?Q?f69wQHbQyFRMFn+6mC7RYQGnYVWQOYjM2v2qlyvPzYA/lowPBNgs1wC9RAS6?=
 =?us-ascii?Q?2gBZ4taQS6tid/PPk7DkGedDT31Zu2fQs0qmVnaQSRGw983D7TVd7+UNvxkH?=
 =?us-ascii?Q?ayN+gEIAoyaC/wQ6M+YMgRSO5qhFu6Lf7lEJWuRHqTrZeDlzBNZC6KhuQuOg?=
 =?us-ascii?Q?sdKNJfQCKTMN8xM7f1UJRmXmDBtJY+LL4G4mRdfffkHr8kkpImFf4gUdGS9v?=
 =?us-ascii?Q?9SLEI+hMidwm8jDHyRh1Iz8sT0pG9x7IRnHU/aGffBiAYZXHbER/EJtPODR2?=
 =?us-ascii?Q?af6yhKgNxX56iKAPZru51xAHzCUAz6iMUe5A1rjOaAFvZ1HC3fbK6yAAykhP?=
 =?us-ascii?Q?aNvcg+W3fRZKKfHiy7PC0ml8rqstBsYMQaw0bM3BDg3Y3Rh9aqsmu2C+6mMm?=
 =?us-ascii?Q?SuCtANUQmPlXXoex6MsO/lKm3FBvma1hb3Eih7MtAlEGldTip7N8vu+M2T5z?=
 =?us-ascii?Q?eVa7AZwR2h9yIDQREbdKBavnp1dlzKCs4M5jy1Wpdg5z45kTZV7t0WRoDbfS?=
 =?us-ascii?Q?+YZXedkJwI4LC89N4gA7RTp0OaIRzfeSjJYFQ8OXWD/HPYbRweegNUWaWM1K?=
 =?us-ascii?Q?9ZsdzlEEAAK/jXZSfhUrTibj8Hivm7LMSfZGlFtA6bp7AuhReGRPi2V/7+by?=
 =?us-ascii?Q?cwxG1Lp9+1eZC0Gg6JEPNSqqGYs9dfMfgULXaKdH28bzSFagH72CUI8Cvf8k?=
 =?us-ascii?Q?bi57n/Nc8GcIUtnJWV2ReLAwAnRGTByo6xgL81GjprT/4QYAJ1UrPvP2UEQC?=
 =?us-ascii?Q?KUToYjKh5gAyZ9FnpEayU1mL+CMxlGO9Tlz9HSExpX7ihrs5hK1WhAPjzloA?=
 =?us-ascii?Q?It3ITJ565Nt1rfQVeQI=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 15:55:24.4413
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d7f5afe-85d2-4fce-89e1-08de0ff11509
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001C9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR19MB7808
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDEzMSBTYWx0ZWRfX3yxfxgCO8UqE
 IUW7ppmC89+vQ10UoeqL2790i/tqOWPGtsPCIm9x/lOl0cA1iMOkZZwNwmwC0k/vbQRfUXW8IUh
 TIrtkCY71dV5jW+qOmLm3wjNHGUK90GS2KQ/PjyfuHKOnpMtVUwmibinvA7qB0eQeVa8zU75jSz
 YLoF1A3FEV68Do+e53dhjTtvMZGDAcsXw9GY/c4gD/WUEwSbOmpklaHFfGMsH2utnfSa65XvqoF
 wB7bwv6u2sNm2aDQVqkhLrLOROexgH96LFhFHaK6lUCGhaPyHbrX6c5VJVkzTY+2sVsOiO4B2Ii
 tVZplVgtyXbaA/nfMVhyIfHyYhEk77eeQqN/LG72sWHAl6esJeyHyH44n/Pc8qPEzzuDR6Jtday
 V7xX5OQX5B6j9k3iexG9xdQmLgySOg==
X-Proofpoint-GUID: 6fBJIQwet4cf52QaZo1ZHDPGjneYZStf
X-Proofpoint-ORIG-GUID: 6fBJIQwet4cf52QaZo1ZHDPGjneYZStf
X-Authority-Analysis: v=2.4 cv=bf1mkePB c=1 sm=1 tr=0 ts=68f65b70 cx=c_pps
 a=CEL0Ro9GVPysLTgZBAX40A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=x6icFKpwvdMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8
 a=8ToN6VyAo-4Z1emjpr8A:9 a=cPQSjfK2_nFv0Q5t_7PE:22
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

