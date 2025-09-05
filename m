Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EBD36CE04
	for <linux-sound@vger.kernel.org>; Fri,  5 Sep 2025 14:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757082725; cv=fail; b=Jws82nK6Z/WMgvy0vmeyiCJ/up4zRnrxqV0iMdhJBT3ZuRZpkzz1CcUFAJqyHWt4cck7YilqlsmE9oviks8ne4FlOMT6knIkO0sa7Ysj+isVbNa6/+vr3CGftOVOOYausxBQviWafyI8iv921AydKOeRRM3orCkF2RWZKezI8PY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757082725; c=relaxed/simple;
	bh=3+sBoI7CqF+WqMhj43Nne1xEKgnMo5n/XTZHQujcgrc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WYyarQnEBYifdbmWP4TU0xYf+qBi6tCo86W6C72i/6W59PVpS9OAMiAJVW0RopQNzD4XyWYh6fih0mWqEbMQaK7+FO7GoRcbfnYK7RoESvY9sx3pNHdR7x7/wdse5achxS3ZzpbGdIAj4xwQVGJMPzVfng1Ao9D+vLUFl5J8sSI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=JtsWqDFl; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=QYMfq3KK; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="JtsWqDFl";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="QYMfq3KK"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58549Fcl1243755;
	Fri, 5 Sep 2025 09:31:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=rbjGbHjCu7UviNHGE5LCQsSmi6z6nONA1JMoiwsfacc=; b=
	JtsWqDFlxi197E9atukZTY7xKfDSXR6FHUY24rDQfRIala/kjQSNsDpjmJWtTGUO
	PqLVAbUjsxfLmFKdAlKNtGksHvfNEWjVyx78NH3bKqAINY3KHkLneuiffB0j9XKo
	7YVmhAbEF8STSm1kAf/MrlaRjmH41mibgExCtrWs/H7ND96evduuIas+x/0rGWpD
	Bq74XAMHh85qTFvyy3lgMPODTUP7JsgE2R69qIee/ccgn0WDz/iUVL7/d2qkSWyZ
	0bM7DA1cbIYoEElB4m4afmtHeFx4ILKjpe/hA2gcADLKsviLmZWwTPBME167S/XY
	PdkpVY5oDdROo1HIKGyKfQ==
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04hn2212.outbound.protection.outlook.com [52.100.163.212])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 48vensfsvp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 05 Sep 2025 09:31:37 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MoV/zeG9b8CnNSO1Tqeph4M1y6L4TK+v1k+jm2LmVedxxZZMCxvqTAD3a0atS/NBkMw8CU7c79JRIf+3v2hDPLpMW32oP4bUJv0auVya50CakMsELrN/slPJOPG0ok+nHn7zvyao7OjNj97pr9u+sHCtCIzsFJjDH5WlV2YcAGA0XqZyLps+v7iN+BJ6VFVA8r5R3ml3rCha9806aZtRbgz5HKfihIX09cxET1z/4sGkmqUNP++ePWAVh+o/pAIJ5GyCuQTP4204I0SoM2vSYPpkPhXbYCUxJwWBqRyXPY2ehwhD54zov72qtqLVG3uevA4VdyR7sblBvwm1RvoHHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rbjGbHjCu7UviNHGE5LCQsSmi6z6nONA1JMoiwsfacc=;
 b=p8SNbKlk4M/FhBdN8Rfz14Yi7LWSBhfJc52bD7FPuyL36jGtIzYWLyCf+1JL4y8BERdvCHUfKz/gSkFyo9klgNYKBhl16+0h39ApzVPJRQwEDz+nLal+8XrdQCz7HS977MGR4OwmWqMhQXX58HZMiiu3/jx3Ws9OxOO77l8aVi8JuzPkq2qY940I5V/Mbd0N0h88MtyPRD7o3iBYGWL+GGtdNfHIs/GgQFDYhmbRyF/2V2NHDOe31EL+/Arsn6pzYKOA6/5Fd1fVMDkr6X7pDHEgD9OXb9iFK4bGomL8DaTSmFI6DM/QSMAHPwl7xySj13FgbAv30OjF72kSICoe8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rbjGbHjCu7UviNHGE5LCQsSmi6z6nONA1JMoiwsfacc=;
 b=QYMfq3KKRkSyTve+741FLu2B19ezv7H0QUBypaPm3UMyEuOs7Y+KVRJ+h9CpPy0iSQ9EDQDu2EyGYxV6OVbvgHqTccQ4kPR1R8kI/SRiOrDX4nyxUugXiGKlNU+U20cpxP623wMAqskk2+i62Y2OSGIlVLic4/4FbGVOFqbMPo8=
Received: from DS7PR03CA0211.namprd03.prod.outlook.com (2603:10b6:5:3ba::6) by
 DS0PR19MB7927.namprd19.prod.outlook.com (2603:10b6:8:160::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.17; Fri, 5 Sep 2025 14:31:34 +0000
Received: from DS1PEPF00017091.namprd03.prod.outlook.com
 (2603:10b6:5:3ba:cafe::ec) by DS7PR03CA0211.outlook.office365.com
 (2603:10b6:5:3ba::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.17 via Frontend Transport; Fri,
 5 Sep 2025 14:31:33 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS1PEPF00017091.mail.protection.outlook.com (10.167.17.133) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.14
 via Frontend Transport; Fri, 5 Sep 2025 14:31:32 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D673E40655C;
	Fri,  5 Sep 2025 14:31:27 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C318C82026B;
	Fri,  5 Sep 2025 14:31:27 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 09/15] ASoC: SDCA: Add UMP buffer helper functions
Date: Fri,  5 Sep 2025 15:31:17 +0100
Message-ID: <20250905143123.3038716-10-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250905143123.3038716-1-ckeepax@opensource.cirrus.com>
References: <20250905143123.3038716-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017091:EE_|DS0PR19MB7927:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: fb3d2182-6ed2-4962-89e4-08ddec88e900
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|34020700016|61400799027|82310400026|376014|13003099007|12100799063;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?n0yL7WSA16aKh1++lTDvBZGUJ7QeW6KVvLc3Tkb+7F/Ku2815CYn1Y6AAlmu?=
 =?us-ascii?Q?1KKSJm+S3yt8onUyjniJ2zny2233Xw8kaqlOFFrAO5oKA99qST+UYNu1drGd?=
 =?us-ascii?Q?SST09XIEWd0r66AE1DxZC1VGk0wjhupBNl1zmBmq6Bd1AOOpJPfa8JW+RL7U?=
 =?us-ascii?Q?x2dwxF6zkvyQriUCQge8FKSR/OfXdzIYEadIrXyQ0TbcYlnPoCC4GDrz6W1T?=
 =?us-ascii?Q?DZalo3Dms7N3LDxSR87MfltIYoWHZysMbT2zGZ60Qq7XnpfaaVER5g9d9L3D?=
 =?us-ascii?Q?44Zm98wLaldxVeeP3zDp5Gt1hr1VxOlpRUE4baEz03al/msKME/LodYYgPgg?=
 =?us-ascii?Q?w8SaqiYtEpvbCfa3FuNfBDv5X2VH80Kcg2h/o747mOfrcMLB1bywsPRiJfJa?=
 =?us-ascii?Q?wiQpsshetpc/1dDfHrTqA+vaG/pFj+Ylb4jMTZ+ahkMRKBcfnpHkCnmwt7H7?=
 =?us-ascii?Q?1BDHjx0/hhYcCKvtapS7BLVUACW8hL5GOnBhl93d3eJPJI9U6tH6vKjUAClY?=
 =?us-ascii?Q?O1rZiciOCoYJxhkODWRsFZbK6cZu+5SkJ2Xslw7OgOXeCrRaM2QIi0376H+z?=
 =?us-ascii?Q?ewVNh/XPWnNkcGLf4GzJnvk4U8Uo7SAk5lkkFndgdi/R7p0JbDQ4WBU5xn5v?=
 =?us-ascii?Q?zcCuaUeb4yGKKdd6uO2vS14PyJR/oIBi4bQZruoAL8fzgfjrkH0CvREClGug?=
 =?us-ascii?Q?DlDwkVwcvcxK30c5WTwXq88rHWWVIlCmrhiAnXkhoc4i3Ci51l1Z8u+tfPnp?=
 =?us-ascii?Q?AJY08nIBnSr5tLDFaLFupy2ziYIV9DYlJwn8VrvQdzs+yC440lTJ4hxqQSYn?=
 =?us-ascii?Q?gduT8VTno1YTjgo2lPR7+5cAil/b3AOrzgrTEz7ndFC6BRjMUbbFHIBrkBiS?=
 =?us-ascii?Q?7+8M/vvnaeuFtnmI3Do2P4gAPG9kVoAhQPmipE8jvBDPoVrxGCrfZZare4AA?=
 =?us-ascii?Q?6QLICTRyHxJ8dfRPrjpgy7PdFGiQMRf/Znb1PaffWaVI/5JnIMRlSBthsNxD?=
 =?us-ascii?Q?Pt1X7dVua56a/nuyUk9RLaPQAPrxXThe2ZcJI7YZ+kbnWeN+ruH8Q4RPmbx1?=
 =?us-ascii?Q?8LUJQaBN2jSjxgiJvqRZ0vn8lCdqgwniNx4PcdRbrPM5omuTv/TSKQp0Uc6/?=
 =?us-ascii?Q?j3pXxYypGubEzU2+ItsVWyP3dnrt+uaA1Q37KOcvA4WWWcWFCgCZ0onWiNmj?=
 =?us-ascii?Q?DQLts92DzNU8aEeMtDCJoX2kFbe4bua4vpsklqJJV4Kktfqpv8U4ODbvO6rD?=
 =?us-ascii?Q?fhhzVodTIXmFvldgXjV+IKXmBxMoqZqF7o5Xjcne7KTfna7RYLqCINhzOA/I?=
 =?us-ascii?Q?fxFnZMRch/951G8HpD/4cDs2UZH0ABK75sn86EaqPSJqcuLrFN/4ec85iTMb?=
 =?us-ascii?Q?tXjuRQUfgzXv4ayI6E64xiF8U1ZS9EGFHzuldLppFM4QZbwelESOS3cdTJOi?=
 =?us-ascii?Q?G4JP9BbUxuLXYLydXvDFqeTndwj8/PPW1zI9ku2NJibdsVJKbXKDaw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(34020700016)(61400799027)(82310400026)(376014)(13003099007)(12100799063);DIR:OUT;SFP:1501;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 14:31:32.2622
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb3d2182-6ed2-4962-89e4-08ddec88e900
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS1PEPF00017091.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR19MB7927
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA1MDE0MiBTYWx0ZWRfXxfKMQAXh5qsc
 ztCu6W2PHG1aS2nxduP6y/CyeYUwxfkS5cfKrjtswVcoC/4ZCss3MiEeiy2In7ZIYQsOzJaifh/
 qM1nYGG/O2c35pgxCpVq0/Kf92jgxA3lWhTDwfxO7+sKpQSd64aBbYiIZHsA8W1ZGJywUOCJZ1z
 tRzhrnimb6NLdOfjlKV/MIwXzEhuthp3tSM5SJ8ZrV6BOmXyVI/Y0BwlhXT+OawEX9GlyBtY4S5
 6qZIxxmlblf/aJgrwlzuXCfx+LMbDH2oRK02RGHLAIvU0gIsJ/kiQpLsJBN/Y2tJdIV9GjleTBY
 Pldvor5eiuBh4Z8LzNKj+0pdI6vFzWihSVui1iON26ne7qXEk+YKvHPsq7a14I=
X-Authority-Analysis: v=2.4 cv=BY/Y0qt2 c=1 sm=1 tr=0 ts=68baf449 cx=c_pps
 a=JNbu8zhCpVSWjzMxnURztA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=yJojWOMRYYMA:10 a=RWc_ulEos4gA:10 a=KJT-RnjOAAAA:8 a=w1d2syhTAAAA:8
 a=QWniJiZs-oX1o9d3st4A:9 a=HE_01F9_QflCRFonrIQr:22 a=jZz-an6Pvt0H8_Yc_ROU:22
X-Proofpoint-GUID: OAIofBIjGFaICp1eTm_9dwzk1sA_DN1K
X-Proofpoint-ORIG-GUID: OAIofBIjGFaICp1eTm_9dwzk1sA_DN1K
X-Proofpoint-Spam-Reason: safe

Add helper functions for handling Universal Message Passing (UMP)
buffers on SDCA devices. These are generic mechanisms to pass blocks of
binary data between the host and the device, in both directions. They
are used for things like passing HID descriptors and the File Download
process.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/sdca_function.h |  26 ++++
 include/sound/sdca_ump.h      |  45 +++++++
 sound/soc/sdca/Makefile       |   3 +-
 sound/soc/sdca/sdca_ump.c     | 247 ++++++++++++++++++++++++++++++++++
 4 files changed, 320 insertions(+), 1 deletion(-)
 create mode 100644 include/sound/sdca_ump.h
 create mode 100644 sound/soc/sdca/sdca_ump.c

diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index ab9af84082c95..341912d896679 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -133,6 +133,32 @@ struct sdca_init_write {
 #define SDCA_CTL_TYPE_S(ent, sel) SDCA_CTL_TYPE(SDCA_ENTITY_TYPE_##ent, \
 						SDCA_CTL_##ent##_##sel)
 
+/**
+ * enum sdca_messageoffset_range - Column definitions UMP MessageOffset
+ */
+enum sdca_messageoffset_range {
+	SDCA_MESSAGEOFFSET_BUFFER_START_ADDRESS		= 0,
+	SDCA_MESSAGEOFFSET_BUFFER_LENGTH		= 1,
+	SDCA_MESSAGEOFFSET_UMP_MODE			= 2,
+	SDCA_MESSAGEOFFSET_NCOLS			= 3,
+};
+
+/**
+ * enum sdca_ump_mode - SDCA UMP Mode
+ */
+enum sdca_ump_mode {
+	SDCA_UMP_MODE_DIRECT				= 0x00,
+	SDCA_UMP_MODE_INDIRECT				= 0x01,
+};
+
+/**
+ * enum sdca_ump_owner - SDCA UMP Owner
+ */
+enum sdca_ump_owner {
+	SDCA_UMP_OWNER_HOST				= 0x00,
+	SDCA_UMP_OWNER_DEVICE				= 0x01,
+};
+
 /**
  * enum sdca_it_controls - SDCA Controls for Input Terminal
  *
diff --git a/include/sound/sdca_ump.h b/include/sound/sdca_ump.h
new file mode 100644
index 0000000000000..b2363199d19aa
--- /dev/null
+++ b/include/sound/sdca_ump.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * The MIPI SDCA specification is available for public downloads at
+ * https://www.mipi.org/mipi-sdca-v1-0-download
+ *
+ * Copyright (C) 2025 Cirrus Logic, Inc. and
+ *                    Cirrus Logic International Semiconductor Ltd.
+ */
+
+#ifndef __SDCA_UMP_H__
+#define __SDCA_UMP_H__
+
+struct regmap;
+struct sdca_control;
+struct sdca_entity;
+struct sdca_function_data;
+struct snd_soc_component;
+
+int sdca_ump_get_owner_host(struct device *dev,
+			    struct regmap *function_regmap,
+			    struct sdca_function_data *function,
+			    struct sdca_entity *entity,
+			    struct sdca_control *control);
+int sdca_ump_set_owner_device(struct device *dev,
+			      struct regmap *function_regmap,
+			      struct sdca_function_data *function,
+			      struct sdca_entity *entity,
+			      struct sdca_control *control);
+int sdca_ump_read_message(struct device *dev,
+			  struct regmap *device_regmap,
+			  struct regmap *function_regmap,
+			  struct sdca_function_data *function,
+			  struct sdca_entity *entity,
+			  unsigned int offset_sel, unsigned int length_sel,
+			  void **msg);
+int sdca_ump_write_message(struct device *dev,
+			   struct regmap *device_regmap,
+			   struct regmap *function_regmap,
+			   struct sdca_function_data *function,
+			   struct sdca_entity *entity,
+			   unsigned int offset_sel, unsigned int msg_offset,
+			   unsigned int length_sel,
+			   void *msg, int msg_len);
+
+#endif // __SDCA_UMP_H__
diff --git a/sound/soc/sdca/Makefile b/sound/soc/sdca/Makefile
index 5e51760cb6513..a1b24c95cd8c8 100644
--- a/sound/soc/sdca/Makefile
+++ b/sound/soc/sdca/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-snd-soc-sdca-y := sdca_functions.o sdca_device.o sdca_regmap.o sdca_asoc.o
+snd-soc-sdca-y := sdca_functions.o sdca_device.o sdca_regmap.o sdca_asoc.o \
+		  sdca_ump.o
 snd-soc-sdca-$(CONFIG_SND_SOC_SDCA_HID) += sdca_hid.o
 snd-soc-sdca-$(CONFIG_SND_SOC_SDCA_IRQ) += sdca_interrupts.o
 
diff --git a/sound/soc/sdca/sdca_ump.c b/sound/soc/sdca/sdca_ump.c
new file mode 100644
index 0000000000000..5dcad2f7ea05b
--- /dev/null
+++ b/sound/soc/sdca/sdca_ump.c
@@ -0,0 +1,247 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (C) 2025 Cirrus Logic, Inc. and
+//                    Cirrus Logic International Semiconductor Ltd.
+
+/*
+ * The MIPI SDCA specification is available for public downloads at
+ * https://www.mipi.org/mipi-sdca-v1-0-download
+ */
+
+#include <linux/dev_printk.h>
+#include <linux/device.h>
+#include <linux/regmap.h>
+#include <sound/sdca.h>
+#include <sound/sdca_function.h>
+#include <sound/sdca_ump.h>
+#include <sound/soc-component.h>
+#include <linux/soundwire/sdw_registers.h>
+
+/**
+ * sdca_ump_get_owner_host - check a UMP buffer is owned by the host
+ * @dev: Pointer to the struct device used for error messages.
+ * @function_regmap: Pointer to the regmap for the SDCA Function.
+ * @function: Pointer to the Function information.
+ * @entity: Pointer to the SDCA Entity.
+ * @control: Pointer to the SDCA Control for the UMP Owner.
+ *
+ * Return: Returns zero on success, and a negative error code on failure.
+ */
+int sdca_ump_get_owner_host(struct device *dev,
+			    struct regmap *function_regmap,
+			    struct sdca_function_data *function,
+			    struct sdca_entity *entity,
+			    struct sdca_control *control)
+{
+	unsigned int reg, owner;
+	int ret;
+
+	reg = SDW_SDCA_CTL(function->desc->adr, entity->id, control->sel, 0);
+	ret = regmap_read(function_regmap, reg, &owner);
+	if (ret < 0) {
+		dev_err(dev, "%s: failed to read UMP owner: %d\n",
+			entity->label, ret);
+		return ret;
+	}
+
+	if (owner != SDCA_UMP_OWNER_HOST) {
+		dev_err(dev, "%s: host is not the UMP owner\n", entity->label);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(sdca_ump_get_owner_host, "SND_SOC_SDCA");
+
+/**
+ * sdca_ump_set_owner_device - set a UMP buffer's ownership back to the device
+ * @dev: Pointer to the struct device used for error messages.
+ * @function_regmap: Pointer to the regmap for the SDCA Function.
+ * @function: Pointer to the Function information.
+ * @entity: Pointer to the SDCA Entity.
+ * @control: Pointer to the SDCA Control for the UMP Owner.
+ *
+ * Return: Returns zero on success, and a negative error code on failure.
+ */
+int sdca_ump_set_owner_device(struct device *dev,
+			      struct regmap *function_regmap,
+			      struct sdca_function_data *function,
+			      struct sdca_entity *entity,
+			      struct sdca_control *control)
+{
+	unsigned int reg;
+	int ret;
+
+	reg = SDW_SDCA_CTL(function->desc->adr, entity->id, control->sel, 0);
+	ret = regmap_write(function_regmap, reg, SDCA_UMP_OWNER_DEVICE);
+	if (ret < 0)
+		dev_err(dev, "%s: failed to write UMP owner: %d\n",
+			entity->label, ret);
+
+	return ret;
+}
+EXPORT_SYMBOL_NS_GPL(sdca_ump_set_owner_device, "SND_SOC_SDCA");
+
+/**
+ * sdca_ump_read_message - read a UMP message from the device
+ * @dev: Pointer to the struct device used for error messages.
+ * @device_regmap: Pointer to the Device register map.
+ * @function_regmap: Pointer to the regmap for the SDCA Function.
+ * @function: Pointer to the Function information.
+ * @entity: Pointer to the SDCA Entity.
+ * @offset_sel: Control Selector for the UMP Offset Control.
+ * @length_sel: Control Selector for the UMP Length Control.
+ * @msg: Pointer that will be populated with an dynamically buffer
+ * containing the UMP message. Note this needs to be freed by the
+ * caller.
+ *
+ * The caller should first call sdca_ump_get_owner_host() to ensure the host
+ * currently owns the UMP buffer, and then this function can be used to
+ * retrieve a message. It is the callers responsibility to free the
+ * message once it is finished with it. Finally sdca_ump_set_owner_device()
+ * should be called to return the buffer to the device.
+ *
+ * Return: Returns the message length on success, and a negative error
+ * code on failure.
+ */
+int sdca_ump_read_message(struct device *dev,
+			  struct regmap *device_regmap,
+			  struct regmap *function_regmap,
+			  struct sdca_function_data *function,
+			  struct sdca_entity *entity,
+			  unsigned int offset_sel, unsigned int length_sel,
+			  void **msg)
+{
+	struct sdca_control_range *range;
+	unsigned int msg_offset, msg_len;
+	unsigned int buf_addr, buf_len;
+	unsigned int reg;
+	int ret;
+
+	reg = SDW_SDCA_CTL(function->desc->adr, entity->id, offset_sel, 0);
+	ret = regmap_read(function_regmap, reg, &msg_offset);
+	if (ret < 0) {
+		dev_err(dev, "%s: failed to read UMP offset: %d\n",
+			entity->label, ret);
+		return ret;
+	}
+
+	range = sdca_selector_find_range(dev, entity, offset_sel,
+					 SDCA_MESSAGEOFFSET_NCOLS, 1);
+	if (!range)
+		return -ENOENT;
+
+	buf_addr = sdca_range(range, SDCA_MESSAGEOFFSET_BUFFER_START_ADDRESS, 0);
+	buf_len = sdca_range(range, SDCA_MESSAGEOFFSET_BUFFER_LENGTH, 0);
+
+	reg = SDW_SDCA_CTL(function->desc->adr, entity->id, length_sel, 0);
+	ret = regmap_read(function_regmap, reg, &msg_len);
+	if (ret < 0) {
+		dev_err(dev, "%s: failed to read UMP length: %d\n",
+			entity->label, ret);
+		return ret;
+	}
+
+	if (msg_len > buf_len - msg_offset) {
+		dev_err(dev, "%s: message too big for UMP buffer: %d\n",
+			entity->label, msg_len);
+		return -EINVAL;
+	}
+
+	*msg = kmalloc(msg_len, GFP_KERNEL);
+	if (!*msg)
+		return -ENOMEM;
+
+	ret = regmap_raw_read(device_regmap, buf_addr + msg_offset, *msg, msg_len);
+	if (ret < 0) {
+		dev_err(dev, "%s: failed to read UMP message: %d\n",
+			entity->label, ret);
+		return ret;
+	}
+
+	return msg_len;
+}
+EXPORT_SYMBOL_NS_GPL(sdca_ump_read_message, "SND_SOC_SDCA");
+
+/**
+ * sdca_ump_write_message - write a UMP message to the device
+ * @dev: Pointer to the struct device used for error messages.
+ * @device_regmap: Pointer to the Device register map.
+ * @function_regmap: Pointer to the regmap for the SDCA Function.
+ * @function: Pointer to the Function information.
+ * @entity: Pointer to the SDCA Entity.
+ * @offset_sel: Control Selector for the UMP Offset Control.
+ * @msg_offset: Offset within the UMP buffer at which the message should
+ * be written.
+ * @length_sel: Control Selector for the UMP Length Control.
+ * @msg: Pointer to the data that should be written to the UMP buffer.
+ * @msg_len: Length of the message data in bytes.
+ *
+ * The caller should first call sdca_ump_get_owner_host() to ensure the host
+ * currently owns the UMP buffer, and then this function can be used to
+ * write a message. Finally sdca_ump_set_owner_device() should be called to
+ * return the buffer to the device, allowing the device to access the
+ * message.
+ *
+ * Return: Returns zero on success, and a negative error code on failure.
+ */
+int sdca_ump_write_message(struct device *dev,
+			   struct regmap *device_regmap,
+			   struct regmap *function_regmap,
+			   struct sdca_function_data *function,
+			   struct sdca_entity *entity,
+			   unsigned int offset_sel, unsigned int msg_offset,
+			   unsigned int length_sel,
+			   void *msg, int msg_len)
+{
+	struct sdca_control_range *range;
+	unsigned int buf_addr, buf_len, ump_mode;
+	unsigned int reg;
+	int ret;
+
+	range = sdca_selector_find_range(dev, entity, offset_sel,
+					 SDCA_MESSAGEOFFSET_NCOLS, 1);
+	if (!range)
+		return -ENOENT;
+
+	buf_addr = sdca_range(range, SDCA_MESSAGEOFFSET_BUFFER_START_ADDRESS, 0);
+	buf_len = sdca_range(range, SDCA_MESSAGEOFFSET_BUFFER_LENGTH, 0);
+	ump_mode = sdca_range(range, SDCA_MESSAGEOFFSET_UMP_MODE, 0);
+
+	if (msg_len > buf_len - msg_offset) {
+		dev_err(dev, "%s: message too big for UMP buffer: %d\n",
+			entity->label, msg_len);
+		return -EINVAL;
+	}
+
+	if (ump_mode != SDCA_UMP_MODE_DIRECT) {
+		dev_err(dev, "%s: only direct mode currently supported\n",
+			entity->label);
+		return -EINVAL;
+	}
+
+	ret = regmap_raw_write(device_regmap, buf_addr + msg_offset, msg, msg_len);
+	if (ret) {
+		dev_err(dev, "%s: failed to write UMP message: %d\n",
+			entity->label, ret);
+		return ret;
+	}
+
+	reg = SDW_SDCA_CTL(function->desc->adr, entity->id, offset_sel, 0);
+	ret = regmap_write(function_regmap, reg, msg_offset);
+	if (ret < 0) {
+		dev_err(dev, "%s: failed to write UMP offset: %d\n",
+			entity->label, ret);
+		return ret;
+	}
+
+	reg = SDW_SDCA_CTL(function->desc->adr, entity->id, length_sel, 0);
+	ret = regmap_write(function_regmap, reg, msg_len);
+	if (ret < 0) {
+		dev_err(dev, "%s: failed to write UMP length: %d\n",
+			entity->label, ret);
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(sdca_ump_write_message, "SND_SOC_SDCA");
-- 
2.47.2

