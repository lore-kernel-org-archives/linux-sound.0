Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1AFC1C84BD
	for <linux-sound@vger.kernel.org>; Tue, 25 Nov 2025 15:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764084125; cv=fail; b=HA8kwFsQFHpEUjLB+lV5iaYLh3+UeSYZwz/7tfmL/GV5bI3Z+6U8+Cva8jjnrFYSpSeUf2CAyTHF7qGtteR5EW5zbrf9OjVIC6qAqFebHl5wO8zJKbbPHumdCAdvsHALD/C0IjUpoViqH3UgLKj01uwF+urfy/USATy44aBXDYo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764084125; c=relaxed/simple;
	bh=kLQkpGUnhFTmGuDQmJItAtTynwHQ46Aqa3lZ6LfGR9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bAONkee6cy0Ra8JK0OG6TLlagEtAvNXStyXXxyQk866m7ZYqwdgkoeCbv5yKocwEsuRIP/V7EsTqNFx+ZOA4f66ei4ZZLY+54sfjCgneSWCbWJf9tcrswafUDuc1YQaoAQTEkjVlL5H9xZsrINfsFaReFrnmQ+9q5lY1DOgfFRg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=C6azafMX; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=DX8b2cFc; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="C6azafMX";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="DX8b2cFc"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP5jJVB3446921;
	Tue, 25 Nov 2025 09:21:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=oLZxQn5QHm+O7B1FBLcg7TbnsgZwLa9qJ+4Yf0AC7ZA=; b=
	C6azafMXUTp0Xkztlp/xtRCYmzBEDZpqpJX59EPuIe9auE8+JbS+7tx1TbcHR+Fy
	21VRXi3VSYbiIUKnxxXxkRsl2CjPI5DZ98nA/DwyWUcttwY8pMb8JMtrBiyiByh+
	5fM+KKu+9rkUlBcoeMKSlsJp5fHnmAM7ge1qu6C4JZLY416n9+ZQIAKosegCQOC1
	gYU5JnDApSi899ST5EpIlNFG3cH+h+8nS5Uce7r1GNlfB5eO4QDb734nrr1gOvIN
	gCkavF//xC5RXkyPtqlzM6ddT0dWdY09mlyww58hFJWZkQIScPDiRrcdbIbDudN4
	poKnjnCrsKv1HEsYIYEQlg==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020139.outbound.protection.outlook.com [52.101.56.139])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4akbf1b5t3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 25 Nov 2025 09:21:42 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=drX9Ipi+8EEZ13b94g1pzZdPdsbSFfEzIcHLN1K9gvJyLzTqf6Ve/qswm5+HLCNiVQLmw6sqPK3un6FDTKo7aAxvEsdDNdXEmqq53ZIipkE5929oUnPFX96pBJawXPcC1V+nArEFtloeY6HzPURUAZQjXdim+hAMghNNvVW+ZIxdJ3btRdim4Ryt9hR93b0ZkDy+135GwyxkAgUxrOe7NYi14NMAyALwpW9/ZUNdH5X4wFvJDvMWzrAEKT1Xucb3QnSGQiiqFmA356RaaqWkHv25dKJx644IuLtHMuMbzidop0bSeUzXcxAvkcrOwhrjuTwOjRHvZBG97UrSLr2NIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oLZxQn5QHm+O7B1FBLcg7TbnsgZwLa9qJ+4Yf0AC7ZA=;
 b=QEcifLg7QnqeGz+52DCMl+X+Aic9mTIl/9nFJCK71llNym/tQo3Z15VuugFYuf/R7DmURORsCyFigLUKg+3xWWhA0C0sjbCxoj5KJGQA1CxKn/YDk0WRk9Log1LnKMGA+1u8k8BP32Irm86LN5O34tsv0cxw3aAjUu1uQ0NrFjAOEPw7OfcF6+01HqaAToPICY1j17fJezSMv6QaeDvaVXmfXlcwdHQP0Z4tltxZRmjxderjrX0b41pzaiaDCM6R7G5WcphvTKMgb5UzahPbV5Nm/FMzK30U3neehndL6blnw4tCCA4trusEbu7c1kuQ+NAQzavXGOLlJGcuYpr8+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oLZxQn5QHm+O7B1FBLcg7TbnsgZwLa9qJ+4Yf0AC7ZA=;
 b=DX8b2cFc9haU78v2Rn/ZWCNwQCLYCulER7sztUgZXLc95KEZ4Y1CpeyQFhPpg6gjC+EyHd0WVk0Y3wV/4ZHIKrvVqMAvkb4Ds4e02iFdJWGH4CcXAacqZO1B5Vc/W5u6MF2MHhXiUhUIAUtwBzSqKzrzjLygxEJ9Ksb/F6Naiqw=
Received: from PH7PR03CA0028.namprd03.prod.outlook.com (2603:10b6:510:339::18)
 by DS0PR19MB8355.namprd19.prod.outlook.com (2603:10b6:8:1b4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 15:21:38 +0000
Received: from SN1PEPF000397B5.namprd05.prod.outlook.com
 (2603:10b6:510:339:cafe::58) by PH7PR03CA0028.outlook.office365.com
 (2603:10b6:510:339::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.11 via Frontend Transport; Tue,
 25 Nov 2025 15:21:36 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF000397B5.mail.protection.outlook.com (10.167.248.59) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.7
 via Frontend Transport; Tue, 25 Nov 2025 15:21:35 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 893C0406557;
	Tue, 25 Nov 2025 15:21:32 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7CFA8822548;
	Tue, 25 Nov 2025 15:21:32 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        vkoul@kernel.org, lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 7/7] ASoC: SDCA: Add lock to serialise the Function initialisation
Date: Tue, 25 Nov 2025 15:21:28 +0000
Message-ID: <20251125152128.274808-8-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251125152128.274808-1-ckeepax@opensource.cirrus.com>
References: <20251125152128.274808-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B5:EE_|DS0PR19MB8355:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c9e24a6f-bba3-4425-96e1-08de2c3652b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|61400799027|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?L1dHSwxichAjXFQwA6YqpH5deUPQcHL4CC2vX7OT97PWAaY1IlpDfKncjvBE?=
 =?us-ascii?Q?1vKTh7FqLNUXv5QF6cEmbGmA/nrjCotDWxlk3iM9u9tjWdD8FAIm9EFNQLZq?=
 =?us-ascii?Q?btHS4WH7yupwd773q5SA7UYxMweeOq9xFe3ttCmcIV7Zctv4LUuJBo+BvvD4?=
 =?us-ascii?Q?67e3RJN20rjGe0VmsOIfD6Y+TZ2NNL0GSR3tnQXeGbhhyTSdEBIWzgAHTc3d?=
 =?us-ascii?Q?+cw/QbYQKd0LZzC1dZ8OdG1uy8hlONW6wxaFKz4+8jGhGRU1codAHnvlGWvG?=
 =?us-ascii?Q?qyhJsp5cVqnojEvfFGOSvmaOI1hEPv7lnG0oOH+SVNyOiNc+qwjx1AzJZ1ho?=
 =?us-ascii?Q?LCP5Tz+ZBdCCGFrCUxWxI5xx4bMkMGBABspmyHGI0jIFrqh53Bs9mxiFE1D0?=
 =?us-ascii?Q?GwIii2nMUIjXAVuK9J8fI8yw7mCRf+Dl7ZFCUqhE7X4lEKPJM3fE4Xeva7NQ?=
 =?us-ascii?Q?x1q8sbYUk8bu+HBB9e/JDXYYtsqOolb2if833/jJMDV5LTIvHYHzMr2BP4s4?=
 =?us-ascii?Q?Y1wuQ+KgYIP98F3Lx9DjCoFsTunjigAG2GLz1wYDbxpdBv9Q0/gJiTLM1fqR?=
 =?us-ascii?Q?NCHYRhk5/P4BdOfZ6nsADaD+xyLBqm7HNNOLCA3vH3umjoIptijhSVOD+z4X?=
 =?us-ascii?Q?bS2DNILQ+i2QuWA70ct1Wb5wOoJ2HBAYOaTFxWk0LtKLmHqNuwrVDo2zD/Ui?=
 =?us-ascii?Q?qPh1g7UtwmVP1xtPnI6kCBJiMKvnvvw4pT+Wc9QNIRicoYrDmNEJyGNFi2J/?=
 =?us-ascii?Q?Q3FupVcsAU0c58ASli6PGbGb2j1BzmjMcH9rPw4zumebpzplFvt724BPU1PA?=
 =?us-ascii?Q?dCYB1OUklT+lP5UK+2CEM5b3ChEH9ojf6gqv2a+NOBulOoZWd2UzkTqIcYmg?=
 =?us-ascii?Q?B5NoaOzKH5CnFX7iYn1X0iiecEBcz+cd4pm1YzTvNYCivyNP1ql/GtiRhTw5?=
 =?us-ascii?Q?jHjqWLgXm/QXoW/i1jWxcKf8RhKGKKuZxBEvtg+Xru84bn0d7QWTeSMFCVUQ?=
 =?us-ascii?Q?Todvy5Lz5zShAyurkgJwKCH0uABhvGfzRqSGNqul/m30UhcZofU8wrepU5N1?=
 =?us-ascii?Q?ActVhNGW/g70PGPhFES4DTS4Qtc+JK1In5N49ddtJyqrV0s+l5/2LcbyrtMP?=
 =?us-ascii?Q?tW4bjz7UHSBWbZAfXOJkFwUBTivtFl8VJXdGXpg5gr1C7s9PGbKwf6adzRSz?=
 =?us-ascii?Q?5lddapkRmo0O49Lwpg+SeDK+oToprmqNXAYrSsQwnNcLFjLTD1+mu6Td9zw/?=
 =?us-ascii?Q?c1YbuEuLCVUifqfmPqPqWkGsyCg3yBYtVTI2yd6ubu0S86lg4y32qcA2Tw1A?=
 =?us-ascii?Q?YaadQ/+lF98G6Izb2WFP2t6vF4rTcjKNGQoaAUSCaeagxWpZxGjP18uNgVeS?=
 =?us-ascii?Q?NTqsgcsn6am39+j1nSI91goBkwy+x7SAyQk+IJv09m6t+CoVEO/MbINXR/Ue?=
 =?us-ascii?Q?e1w71e/aHUraVz7sQlKuPOce3IjFuqvWtT/DvKgxxEemgsy5mLfaWMi4WLoT?=
 =?us-ascii?Q?iNZgzZjyABeewxCUgUoXNZrnQWtaX/4TvPfDJGZM3WTGavs9QQMODxOX8tLI?=
 =?us-ascii?Q?zcaiWjmsOsCcJDz+EtM=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(61400799027)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 15:21:35.7660
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9e24a6f-bba3-4425-96e1-08de2c3652b1
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF000397B5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR19MB8355
X-Authority-Analysis: v=2.4 cv=caHfb3DM c=1 sm=1 tr=0 ts=6925c986 cx=c_pps
 a=HngsKjkEkW2FdqPxnP33Yg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=ZebSmUhBFGRK0BiUr4kA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDEyNyBTYWx0ZWRfX9oBcMDqm4rJ4
 YjslDf3+ogQW6oCMPhPDC8+oXF/3s4d5DPPJP5J4vA5E9+BiK6LGLqSIASBP2kPTUcRU0Xzpbpf
 7LhiJeULOHSlhF8eQEBUNXitPsG5aD3qPwoMnMWRlBgDEc2hag82p1QJh/Rqk4sFb2GVpn8dXzX
 UdrNuUiZ17rudZGvDIXqP3d5JzxzBbwPGlXawwKUr/T9FEfTJgQjFIWLy0ibXDLikoKWfawGqNr
 wagX7j4ZqQlu/KywefBEC1+IlhGZCDMQYM3JdXHRD4nh4sZNNwks/U80cxnfF6gj1o66+2ntjav
 lz3ynBFnKdR+kxBrdPf7Z89SvgUhPhgLD/NoIYGRaA7+4zGJwaw8e2YvlTFoyo/OCGMhIwdBMim
 qZpqiV5a5ftV1gN1uFUnjfqvUNUFvw==
X-Proofpoint-GUID: jvLRXKATJPDlb_jMUnM8tSCfSPHPDdpg
X-Proofpoint-ORIG-GUID: jvLRXKATJPDlb_jMUnM8tSCfSPHPDdpg
X-Proofpoint-Spam-Reason: safe

To avoid issues on some devices serialise the boot of each SDCA Function
from the others.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdca/sdca_class.c          | 1 +
 sound/soc/sdca/sdca_class.h          | 2 ++
 sound/soc/sdca/sdca_class_function.c | 5 +++++
 3 files changed, 8 insertions(+)

diff --git a/sound/soc/sdca/sdca_class.c b/sound/soc/sdca/sdca_class.c
index 438695291257e..1b83aad1d9d3b 100644
--- a/sound/soc/sdca/sdca_class.c
+++ b/sound/soc/sdca/sdca_class.c
@@ -205,6 +205,7 @@ static int class_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *id
 	drv->dev = dev;
 	drv->sdw = sdw;
 	mutex_init(&drv->regmap_lock);
+	mutex_init(&drv->init_lock);
 
 	dev_set_drvdata(drv->dev, drv);
 
diff --git a/sound/soc/sdca/sdca_class.h b/sound/soc/sdca/sdca_class.h
index bb4c9dd124296..6f24ea2bbd381 100644
--- a/sound/soc/sdca/sdca_class.h
+++ b/sound/soc/sdca/sdca_class.h
@@ -28,6 +28,8 @@ struct sdca_class_drv {
 	struct sdca_interrupt_info *irq_info;
 
 	struct mutex regmap_lock;
+	/* Serialise function initialisations */
+	struct mutex init_lock;
 	struct work_struct boot_work;
 	struct completion device_attach;
 
diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
index aed325087c1dd..5af13ced9ceff 100644
--- a/sound/soc/sdca/sdca_class_function.c
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/auxiliary_bus.h>
+#include <linux/cleanup.h>
 #include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/pm.h>
@@ -244,6 +245,8 @@ static int class_function_boot(struct class_function_drv *drv)
 	unsigned int val;
 	int ret;
 
+	guard(mutex)(&drv->core->init_lock);
+
 	ret = regmap_read(drv->regmap, reg, &val);
 	if (ret < 0) {
 		dev_err(drv->dev, "failed to read function status: %d\n", ret);
@@ -418,6 +421,8 @@ static int class_function_runtime_resume(struct device *dev)
 	struct class_function_drv *drv = auxiliary_get_drvdata(auxdev);
 	int ret;
 
+	guard(mutex)(&drv->core->init_lock);
+
 	regcache_mark_dirty(drv->regmap);
 	regcache_cache_only(drv->regmap, false);
 
-- 
2.47.3

