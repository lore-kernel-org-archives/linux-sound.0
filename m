Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388322EB849
	for <linux-sound@vger.kernel.org>; Fri, 12 Sep 2025 10:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757673340; cv=fail; b=Tgf1CxP0qWzx8n0NDw1r5XJgIrDJXf+QUM4yhx7ZSqqL9+GlxNHtHLSYktzhbIw7sotJJB0gcbdxWWmNQVwapDyl2VGz4f8WotvyFoCxy6MXs7K1jUb473cB218dkjc5iiw/VMGcqxhItD5vIrM3XrkYwdO62W7AuVxQQDWeTqA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757673340; c=relaxed/simple;
	bh=FCvUyuOw1X+JQKuaqMs5blZ7Dy8oZHqu+P8ucBtPGCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LpFwdB5qtmR4PwvqaZJ/iZyM3fxxtfkKQouQZtI7kUUK7Gjutg8Brh92+iAtX9IONWGMIHm0ZAJKu9GuXKbB3Ia5G2n1sScBisNVPoRZOm/BdqEEnstpwPbpwqQAxjYnKRTDKFxNxmQXxvJucN6hqHu7aZ/kSjwfWAA8wj5Beb0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=dWRo+WfU; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=eNe1dymc; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="dWRo+WfU";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="eNe1dymc"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58C7QEbk3763904;
	Fri, 12 Sep 2025 05:35:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=fSLlBAXGYtpW/RbLWfnCDlpWFvJZaNT3NXHxtxdDHzM=; b=
	dWRo+WfUf7rhkbQhv86CsUgmx7T6CnQkaIrz9dFG8NIvf8nauv7kKTvw7j8W9mbU
	8QpfwUUzYi7IztzipfAfGUZrx9ngdr42LO+GIObe/QU64lYf96QEk8WaenmmA0E2
	/9swJTmHWN9CGjLeRlrSTRHsjUh1HQm4n/0qbZPVyq4QH0gEEaRt4M9BuxAeVFTC
	7C/E9Bg74nJkIvuReTklmmvLMSLuUip1V246bm7ZXFp/amTD38ZzfLAwA3a+2/GM
	FtQ4ICvdJODmhTdCCmc9uJRmQi2eiJ4GLpqyxN0dVzhWcFq/+H0rg8dEpVCu3Mcq
	7cbCytrcj30PmjZZ0ZfzMg==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2130.outbound.protection.outlook.com [40.107.94.130])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 494due08ym-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 05:35:20 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kabRWIJrnFPSxeLvqpm8HV3x2I//Gegv08MCbZXytz4jvrQkAzHVrkutkDNML6yCkM+QPuv3p1vu/B5TC2ZxdZpbJrzwP0C7p6Q8DTDZzU5aWkz1GbTOiBNM8TLMaCbPjYOkS61AMB4a2G3U+XjnaAMWZSHjJbaSAqjNI4ShXBk98uWQ8jj5wVJ92h8/GBYV0x88inHF8Dzbj19Z7q142BOcMQ25fDnby6dJ7JLSBSHZsLerdodTSMYKLpQWO0fmtEppOmEnu8bGTHJhUgB6jkqO2JAYKxe6bnp47lPXSMITl6qPsbetTZ3nzepEE7jj1fSdey6MHM/fPf3nITr7rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fSLlBAXGYtpW/RbLWfnCDlpWFvJZaNT3NXHxtxdDHzM=;
 b=IA7qsSoH0jOlQTsGJxg68Pm3hnCHQMVi5qKIlTUNNCj2+Z4MdLCQBDpsJG87FdimV3slb6VK+l03aDBwgyNu8B/p9ww3rpGVP8pmcKo/lg0Ny8nJX2Gc653q9po7V3IuUqUb8urWSK33YPCvH5d4/8uN2o7W0sSZjdK7kF2dZ38vhL4DMHRiZmZl7+ISGIp02iR2qfK2zH5tpCknX0aPJD2rViUCLupc0Ph/O+J28Vfn5K8W1TUGzUaakkMbRNx1OXiyCl6M3PPGLnxI0fvbshb0K/r2vqYTL4/Tm+pWaGckY1gBVpH92q5AYeQaUYoFyalRKG2QRnrjSzar2tKCiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fSLlBAXGYtpW/RbLWfnCDlpWFvJZaNT3NXHxtxdDHzM=;
 b=eNe1dymcBPO3NvQLp+HUQy4ahgQ9WWhYtyA6m803XRI/VsMF8M1G1lgG6E5AcaWYIOU29lVJ6gEbjk/cQxnV9IBh1pWb12FM1Po/vA+rpT+J6ZTuSSpJuNC7qlBenOLLx4paKPW3cGa2FJLF70z/IgpA+GT6Do7RTbKS3yyuRU0=
Received: from SJ0PR05CA0012.namprd05.prod.outlook.com (2603:10b6:a03:33b::17)
 by PH0PR19MB4873.namprd19.prod.outlook.com (2603:10b6:510:77::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 10:35:15 +0000
Received: from SJ5PEPF00000207.namprd05.prod.outlook.com
 (2603:10b6:a03:33b:cafe::21) by SJ0PR05CA0012.outlook.office365.com
 (2603:10b6:a03:33b::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.7 via Frontend Transport; Fri,
 12 Sep 2025 10:35:15 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF00000207.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.13
 via Frontend Transport; Fri, 12 Sep 2025 10:35:14 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4AE16406567;
	Fri, 12 Sep 2025 10:35:08 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 35ADA82254B;
	Fri, 12 Sep 2025 10:35:08 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 14/19] ASoC: SDCA: Add FDL library for XU entities
Date: Fri, 12 Sep 2025 11:34:59 +0100
Message-ID: <20250912103504.2679226-15-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250912103504.2679226-1-ckeepax@opensource.cirrus.com>
References: <20250912103504.2679226-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000207:EE_|PH0PR19MB4873:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a7d5cbd6-e560-43bf-960b-08ddf1e80f31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|61400799027|82310400026|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8VJeGMwtsu+T/Sfn+Keb2QEWAqle6MTouhYKyR2RU+lBaooD/koIYie3k2IV?=
 =?us-ascii?Q?YhmAwp3haHmLafSpDkNSx5O8beF4q9If923Ls9s53r0QP3POgjCB+djyByYz?=
 =?us-ascii?Q?2IyEYh7utkmG5mXLlHwOnKEdiH6UtysSU8HucgRAwoLgujW5gT1fwM42EHDS?=
 =?us-ascii?Q?NnI9HrgwfjJ5DW3/Nfpr+btQ/OJ79P3Q1b82fUnPycC1egVDbvu9OPdRXBb5?=
 =?us-ascii?Q?dY67bAI0g4+LChzoYO9Qu6U3COaBZg9dP83cKYUoKOU57KSDHiCNvkxBzxB9?=
 =?us-ascii?Q?Ubba+1nCHGCz8UTjBRlujlH7bxTeZgjYBUOFoxSzEWEkvM1tFtErOfOFfcm6?=
 =?us-ascii?Q?RwNLGdCgfCx2XFKqusCNr1Z36IBUyWfSvBlO8mBgaBgOXSbtkzKIjPe+Y5hG?=
 =?us-ascii?Q?DHI/X5WwN1C3aCyJOQKJscqnw1xJe9SnmFQtq8K7naBRHP6MnuRuS/LGutT2?=
 =?us-ascii?Q?BMiXR45U53gqZdAZmLVqwk2uX6hO7pzqpcIAA1R9vl43jCW5It8lPCul6Ky0?=
 =?us-ascii?Q?xOp36JIskQdsuZU2UJNTLf3GFy34N0AHzR/fDfLwlm7l5aC1FrDpjM3ZGmUs?=
 =?us-ascii?Q?xSzOkSHf9jadedYrr1UqkD85LbilivV7yY01wQVWOOF98yahWbrEaxOVDWEA?=
 =?us-ascii?Q?Jf/N4s0/XY2bh9WHAyEA+tIzADXCDMmp10yM5e90xF6a8xxm6+mQktYoscii?=
 =?us-ascii?Q?DYh+NtAZPfjRZMIvrsmqSk//I6m2ADyt7GmyV4c5Ivvc/g5xXqfl7UvFZRxN?=
 =?us-ascii?Q?pJ94z///GfXe+w9hL1ZUQN6KbAg3qMW6ipZAjSM/UytQux7+xXkA+zLA+3GK?=
 =?us-ascii?Q?c87a7Tr2JtwjjW+3KuoCSBjJfDjWpG/WIo1cEIQp1VUp+vm1iFbZsN19/9+4?=
 =?us-ascii?Q?JRBhU5+HyscuILHUqsjxgKeCMJW1zp149ArZZMuFTypZkFrcOIj7F/qHx9e5?=
 =?us-ascii?Q?rFPtjnVCiyy3ujCxm52ILTc/66uiBJwrtwqtxmp6LiB/bP7Fg8E71xXzjCGe?=
 =?us-ascii?Q?hLnuoUbl3tsOnm0TVKqPcpcwd3ro8FmmIB73KY6ZSmr8/n+U8a9idZk/cbPj?=
 =?us-ascii?Q?43gDe1G6TKZ8yYi6+UCxFi24ieNYbArUjFYMukPMD/yrnOnToZWUf8khbore?=
 =?us-ascii?Q?RcTWVY/LIl1kO4CMSqa+POPeU3SeYm1hEsTu6h/xGK9s8f0+gvqAbrtXwn52?=
 =?us-ascii?Q?QEi6uRZ3B9OLxAKoAYcxIsUeDsEbOYMSbynvv0Zw2P2j+oOlj+IrJ4CvyUMs?=
 =?us-ascii?Q?t0mV3TjNWf8MehxCNuDtEwykCsX/nIq7BE/sp5nGwOWknrRkMAPoSzouC4ZH?=
 =?us-ascii?Q?4lGKBWMMw9avYBJKzHETVgi0ggZSi1Zy7afqrtjM9wI5ePr9b44XOgTmDz+1?=
 =?us-ascii?Q?8a2Xvura7/Vc1ZQ8Jy8HoKYfcXYb/fCvWe3NhKTZdv3MwQqow31IQaN/IG5c?=
 =?us-ascii?Q?5/5YP2FaStiWi2GwtofG6TCa/MTkjsWepyJ6xJDOXDD1bAnATNoXsw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(82310400026)(376014)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 10:35:14.2813
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7d5cbd6-e560-43bf-960b-08ddf1e80f31
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF00000207.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB4873
X-Proofpoint-ORIG-GUID: 0uwG_TfASYutFs1DSs1aTlWpVuPYETMm
X-Authority-Analysis: v=2.4 cv=F9NXdrhN c=1 sm=1 tr=0 ts=68c3f768 cx=c_pps
 a=BjPzmLOISwj/Fyn8Ed/tWQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=KJT-RnjOAAAA:8
 a=w1d2syhTAAAA:8 a=BgFpxrvgLoZXw-M-4hoA:9 a=HE_01F9_QflCRFonrIQr:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEyMDA5OSBTYWx0ZWRfXyT5YUBlaA0FC
 dUFT7ji26PT0mn3EFYlBS8eYZTscbXcSP3ddZNVti1nz+Sn5AI+HY1iNRQnp3xiFLWFMRjmohPx
 g7KFgfZLCgauhmWHcjy1WIFO946RWClkPWipcI1PGkzIObPrdW7bbrDGgFuw1AuEWMEzlWREaTs
 vU0sd1tvM+QBmiClxCbGUmFnTvtu076SUXpNwo5OB9Zr6R0d+11BQsxnxR9IFdE4/QqZJ+O+IzD
 y6BULxlMjaGaAc/FFhmDG5RHI9jJUa4+V6+Zq2Ju1A/VNmsj5/lYl8ib2SREALjtdOF4rCnSOmr
 oMe2Os62lEdlJzZ+50ZDMNbn83RLYVY542f4d8rEhS7v/A7RbpaLVx7cW6D2a8=
X-Proofpoint-GUID: 0uwG_TfASYutFs1DSs1aTlWpVuPYETMm
X-Proofpoint-Spam-Reason: safe

From: Maciej Strozek <mstrozek@opensource.cirrus.com>

Some instances of the XU Entity have a need for Files to be downloaded
from the Host. In these XUs, there is one instance of a Host to Device
(Consumer) UMP, identified by the FDL_CurrentOwner Control. FDL Library
introduced here implements the FDL flow triggered by FDL_CurrentOwner
irq, which sends a file from SoundWire File Table (SWFT) or from the
firmware directory in specific cases, to the Device FDL UMP.

Currently only Direct method of FDL is implemented.

Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v1:
 - Remembered to actually add my sign-off
 - Renamed things to be FDL rather than XU
 - Added a function reset helper, and call it when the device resets a
   reset, other resets are still todos.

 include/sound/sdca_fdl.h      |  58 ++++++
 include/sound/sdca_function.h |  24 +++
 sound/soc/sdca/Kconfig        |   8 +
 sound/soc/sdca/Makefile       |   1 +
 sound/soc/sdca/sdca_fdl.c     | 370 ++++++++++++++++++++++++++++++++++
 5 files changed, 461 insertions(+)
 create mode 100644 include/sound/sdca_fdl.h
 create mode 100644 sound/soc/sdca/sdca_fdl.c

diff --git a/include/sound/sdca_fdl.h b/include/sound/sdca_fdl.h
new file mode 100644
index 000000000000..8b025aff4a0c
--- /dev/null
+++ b/include/sound/sdca_fdl.h
@@ -0,0 +1,58 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * The MIPI SDCA specification is available for public downloads at
+ * https://www.mipi.org/mipi-sdca-v1-0-download
+ *
+ * Copyright (C) 2025 Cirrus Logic, Inc. and
+ *                    Cirrus Logic International Semiconductor Ltd.
+ */
+
+#ifndef __SDCA_FDL_H__
+#define __SDCA_FDL_H__
+
+struct device;
+struct regmap;
+struct sdca_fdl_set;
+struct sdca_function_data;
+struct sdca_interrupt;
+
+/**
+ * struct fdl_state - FDL state structure to keep data between interrupts
+ * @set: Pointer to the FDL set currently being downloaded.
+ * @file_index: Index of the current file being processed.
+ */
+struct fdl_state {
+	struct sdca_fdl_set *set;
+	int file_index;
+};
+
+#define SDCA_CTL_XU_FDLH_COMPLETE	0
+#define SDCA_CTL_XU_FDLH_MORE_FILES	SDCA_CTL_XU_FDLH_SET_IN_PROGRESS
+#define SDCA_CTL_XU_FDLH_FILE_AVAILABLE	(SDCA_CTL_XU_FDLH_TRANSFERRED_FILE | \
+					 SDCA_CTL_XU_FDLH_SET_IN_PROGRESS)
+#define SDCA_CTL_XU_FDLH_MASK		(SDCA_CTL_XU_FDLH_TRANSFERRED_CHUNK | \
+					 SDCA_CTL_XU_FDLH_TRANSFERRED_FILE | \
+					 SDCA_CTL_XU_FDLH_SET_IN_PROGRESS | \
+					 SDCA_CTL_XU_FDLH_RESET_ACK | \
+					 SDCA_CTL_XU_FDLH_REQ_ABORT)
+
+#define SDCA_CTL_XU_FDLD_COMPLETE	0
+#define SDCA_CTL_XU_FDLD_FILE_OK	(SDCA_CTL_XU_FDLH_TRANSFERRED_FILE | \
+					 SDCA_CTL_XU_FDLH_SET_IN_PROGRESS | \
+					 SDCA_CTL_XU_FDLD_ACK_TRANSFER | \
+					 SDCA_CTL_XU_FDLD_NEEDS_SET)
+#define SDCA_CTL_XU_FDLD_MORE_FILES_OK	(SDCA_CTL_XU_FDLH_SET_IN_PROGRESS | \
+					 SDCA_CTL_XU_FDLD_ACK_TRANSFER | \
+					 SDCA_CTL_XU_FDLD_NEEDS_SET)
+#define SDCA_CTL_XU_FDLD_MASK		(SDCA_CTL_XU_FDLD_REQ_RESET | \
+					 SDCA_CTL_XU_FDLD_REQ_ABORT | \
+					 SDCA_CTL_XU_FDLD_ACK_TRANSFER | \
+					 SDCA_CTL_XU_FDLD_NEEDS_SET)
+
+int sdca_fdl_alloc_state(struct sdca_interrupt *interrupt);
+int sdca_fdl_process(struct sdca_interrupt *interrupt);
+
+int sdca_reset_function(struct device *dev, struct sdca_function_data *function,
+			struct regmap *regmap);
+
+#endif // __SDCA_FDL_H__
diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index f557206cec83..99cb978f7099 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -285,6 +285,27 @@ enum sdca_xu_controls {
 	SDCA_CTL_XU_FDL_STATUS				= 0x14,
 	SDCA_CTL_XU_FDL_SET_INDEX			= 0x15,
 	SDCA_CTL_XU_FDL_HOST_REQUEST			= 0x16,
+
+	/* FDL Status Host->Device bit definitions */
+	SDCA_CTL_XU_FDLH_TRANSFERRED_CHUNK		= BIT(0),
+	SDCA_CTL_XU_FDLH_TRANSFERRED_FILE		= BIT(1),
+	SDCA_CTL_XU_FDLH_SET_IN_PROGRESS		= BIT(2),
+	SDCA_CTL_XU_FDLH_RESET_ACK			= BIT(4),
+	SDCA_CTL_XU_FDLH_REQ_ABORT			= BIT(5),
+	/* FDL Status Device->Host bit definitions */
+	SDCA_CTL_XU_FDLD_REQ_RESET			= BIT(4),
+	SDCA_CTL_XU_FDLD_REQ_ABORT			= BIT(5),
+	SDCA_CTL_XU_FDLD_ACK_TRANSFER			= BIT(6),
+	SDCA_CTL_XU_FDLD_NEEDS_SET			= BIT(7),
+};
+
+/**
+ * enum sdca_set_index_range - Column definitions UMP SetIndex
+ */
+enum sdca_fdl_set_index_range {
+	SDCA_FDL_SET_INDEX_SET_NUMBER			= 0,
+	SDCA_FDL_SET_INDEX_FILE_SET_ID			= 1,
+	SDCA_FDL_SET_INDEX_NCOLS			= 2,
 };
 
 /**
@@ -569,6 +590,9 @@ enum sdca_entity0_controls {
 	SDCA_CTL_ENTITY_0_FUNCTION_NEEDS_INITIALIZATION	= BIT(5),
 	SDCA_CTL_ENTITY_0_FUNCTION_HAS_BEEN_RESET	= BIT(6),
 	SDCA_CTL_ENTITY_0_FUNCTION_BUSY			= BIT(7),
+
+	/* Function Action Bits */
+	SDCA_CTL_ENTITY_0_RESET_FUNCTION_NOW		= BIT(0),
 };
 
 #define SDCA_CTL_MIC_BIAS_NAME				"Mic Bias"
diff --git a/sound/soc/sdca/Kconfig b/sound/soc/sdca/Kconfig
index 6a3ba43f26bd..a73920d07073 100644
--- a/sound/soc/sdca/Kconfig
+++ b/sound/soc/sdca/Kconfig
@@ -25,6 +25,14 @@ config SND_SOC_SDCA_IRQ
 	help
 	  This option enables support for SDCA IRQs.
 
+config SND_SOC_SDCA_FDL
+	bool "SDCA FDL (File DownLoad) support"
+	depends on SND_SOC_SDCA
+	default y
+	help
+	  This option enables support for the File Download using UMP,
+	  typically used for downloading firmware to devices.
+
 config SND_SOC_SDCA_OPTIONAL
 	def_tristate SND_SOC_SDCA || !SND_SOC_SDCA
 
diff --git a/sound/soc/sdca/Makefile b/sound/soc/sdca/Makefile
index a1b24c95cd8c..be911c399bbd 100644
--- a/sound/soc/sdca/Makefile
+++ b/sound/soc/sdca/Makefile
@@ -4,5 +4,6 @@ snd-soc-sdca-y := sdca_functions.o sdca_device.o sdca_regmap.o sdca_asoc.o \
 		  sdca_ump.o
 snd-soc-sdca-$(CONFIG_SND_SOC_SDCA_HID) += sdca_hid.o
 snd-soc-sdca-$(CONFIG_SND_SOC_SDCA_IRQ) += sdca_interrupts.o
+snd-soc-sdca-$(CONFIG_SND_SOC_SDCA_FDL) += sdca_fdl.o
 
 obj-$(CONFIG_SND_SOC_SDCA) += snd-soc-sdca.o
diff --git a/sound/soc/sdca/sdca_fdl.c b/sound/soc/sdca/sdca_fdl.c
new file mode 100644
index 000000000000..3bcc89980908
--- /dev/null
+++ b/sound/soc/sdca/sdca_fdl.c
@@ -0,0 +1,370 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (C) 2025 Cirrus Logic, Inc. and
+//                    Cirrus Logic International Semiconductor Ltd.
+
+/*
+ * The MIPI SDCA specification is available for public downloads at
+ * https://www.mipi.org/mipi-sdca-v1-0-download
+ */
+
+#include <linux/acpi.h>
+#include <linux/device.h>
+#include <linux/dev_printk.h>
+#include <linux/dmi.h>
+#include <linux/firmware.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/regmap.h>
+#include <linux/sprintf.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_registers.h>
+#include <sound/sdca.h>
+#include <sound/sdca_fdl.h>
+#include <sound/sdca_function.h>
+#include <sound/sdca_interrupts.h>
+#include <sound/sdca_ump.h>
+
+/**
+ * sdca_reset_function - send an SDCA function reset
+ * @dev: Device pointer for error messages.
+ * @function: Pointer to the SDCA Function.
+ * @regmap: Pointer to the SDCA Function regmap.
+ *
+ * Return: Zero on success or a negative error code.
+ */
+int sdca_reset_function(struct device *dev, struct sdca_function_data *function,
+			struct regmap *regmap)
+{
+	unsigned int reg = SDW_SDCA_CTL(function->desc->adr,
+					SDCA_ENTITY_TYPE_ENTITY_0,
+					SDCA_CTL_ENTITY_0_FUNCTION_ACTION, 0);
+	unsigned int val, poll_us;
+	int ret;
+
+	ret = regmap_write(regmap, reg, SDCA_CTL_ENTITY_0_RESET_FUNCTION_NOW);
+	if (ret) // Allowed for function reset to not be implemented
+		return 0;
+
+	if (!function->reset_max_delay) {
+		dev_err(dev, "No reset delay specified in DisCo\n");
+		return -EINVAL;
+	}
+
+	poll_us = umin(function->reset_max_delay >> 4, 1000);
+
+	ret = regmap_read_poll_timeout(regmap, reg, val, !val, poll_us,
+				       function->reset_max_delay);
+	if (ret) {
+		dev_err(dev, "Failed waiting for function reset: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(sdca_reset_function, "SND_SOC_SDCA");
+
+static char *fdl_get_sku_filename(struct device *dev,
+				  struct sdca_fdl_file *fdl_file)
+{
+	struct device *parent = dev;
+	const char *product_vendor;
+	const char *product_sku;
+
+	/*
+	 * Try to find pci_dev manually because the card may not be ready to be
+	 * used for snd_soc_card_get_pci_ssid yet
+	 */
+	while (parent) {
+		if (dev_is_pci(parent)) {
+			struct pci_dev *pci_dev = to_pci_dev(parent);
+
+			return kasprintf(GFP_KERNEL, "sdca/%x/%x/%x/%x.bin",
+					 fdl_file->vendor_id,
+					 pci_dev->subsystem_vendor,
+					 pci_dev->subsystem_device,
+					 fdl_file->file_id);
+		} else {
+			parent = parent->parent;
+		}
+	}
+
+	product_vendor = dmi_get_system_info(DMI_SYS_VENDOR);
+	if (!product_vendor || !strcmp(product_vendor, "Default string"))
+		product_vendor = dmi_get_system_info(DMI_BOARD_VENDOR);
+	if (!product_vendor || !strcmp(product_vendor, "Default string"))
+		product_vendor = dmi_get_system_info(DMI_CHASSIS_VENDOR);
+	if (!product_vendor)
+		product_vendor = "unknown";
+
+	product_sku = dmi_get_system_info(DMI_PRODUCT_SKU);
+	if (!product_sku || !strcmp(product_sku, "Default string"))
+		product_sku = dmi_get_system_info(DMI_PRODUCT_NAME);
+	if (!product_sku)
+		product_sku = "unknown";
+
+	return kasprintf(GFP_KERNEL, "sdca/%x/%s/%s/%x.bin", fdl_file->vendor_id,
+			 product_vendor, product_sku, fdl_file->file_id);
+}
+
+static int fdl_load_file(struct sdca_interrupt *interrupt,
+			 struct sdca_fdl_set *set, int file_index)
+{
+	struct device *dev = interrupt->dev;
+	struct sdca_fdl_data *fdl_data = &interrupt->function->fdl_data;
+	const struct firmware *firmware = NULL;
+	struct acpi_sw_file *swf = NULL, *tmp;
+	struct sdca_fdl_file *fdl_file;
+	char *disk_filename;
+	int ret;
+	int i;
+
+	if (!set) {
+		dev_err(dev, "request to load file with no set\n");
+		return -EINVAL;
+	}
+
+	fdl_file = &set->files[file_index];
+
+	if (fdl_data->swft) {
+		tmp = fdl_data->swft->files;
+		for (i = 0; i < fdl_data->swft->header.length; i += tmp->file_length,
+		     tmp = ACPI_ADD_PTR(struct acpi_sw_file, tmp, tmp->file_length)) {
+			if (tmp->vendor_id == fdl_file->vendor_id &&
+			    tmp->file_id == fdl_file->file_id) {
+				dev_dbg(dev, "located SWF in ACPI: %x-%x-%x\n",
+					tmp->vendor_id, tmp->file_id,
+					tmp->file_version);
+				swf = tmp;
+				break;
+			}
+		}
+	}
+
+	disk_filename = fdl_get_sku_filename(dev, fdl_file);
+	if (!disk_filename)
+		return -ENOMEM;
+
+	dev_dbg(dev, "FDL disk filename: %s\n", disk_filename);
+
+	ret = firmware_request_nowarn(&firmware, disk_filename, dev);
+	kfree(disk_filename);
+	if (ret) {
+		disk_filename = kasprintf(GFP_KERNEL, "sdca/%x/%x.bin",
+					  fdl_file->vendor_id, fdl_file->file_id);
+		if (!disk_filename)
+			return -ENOMEM;
+
+		dev_dbg(dev, "FDL disk filename: %s\n", disk_filename);
+
+		ret = firmware_request_nowarn(&firmware, disk_filename, dev);
+		kfree(disk_filename);
+	}
+
+	if (!ret) {
+		tmp = (struct acpi_sw_file *)&firmware->data[0];
+
+		if (!swf || swf->file_version <= tmp->file_version) {
+			dev_dbg(dev, "using SWF from disk: %x-%x-%x\n",
+				tmp->vendor_id, tmp->file_id, tmp->file_version);
+			swf = tmp;
+		}
+	} else if (!swf) {
+		dev_err(dev, "failed to locate SWF\n");
+		return -ENOENT;
+	}
+
+	ret = sdca_ump_write_message(dev, interrupt->device_regmap,
+				     interrupt->function_regmap,
+				     interrupt->function, interrupt->entity,
+				     SDCA_CTL_XU_FDL_MESSAGEOFFSET, fdl_file->fdl_offset,
+				     SDCA_CTL_XU_FDL_MESSAGELENGTH, swf->data,
+				     swf->file_length - offsetof(struct acpi_sw_file, data));
+	release_firmware(firmware);
+	return ret;
+}
+
+static struct sdca_fdl_set *fdl_get_set(struct sdca_interrupt *interrupt)
+{
+	struct device *dev = interrupt->dev;
+	struct sdca_fdl_data *fdl_data = &interrupt->function->fdl_data;
+	struct sdca_entity *xu = interrupt->entity;
+	struct sdca_control_range *range;
+	unsigned int val;
+	int i, ret;
+
+	ret = regmap_read(interrupt->function_regmap,
+			  SDW_SDCA_CTL(interrupt->function->desc->adr, xu->id,
+				       SDCA_CTL_XU_FDL_SET_INDEX, 0),
+			  &val);
+	if (ret < 0) {
+		dev_err(dev, "failed to read FDL set index: %d\n", ret);
+		return NULL;
+	}
+
+	range = sdca_selector_find_range(dev, xu, SDCA_CTL_XU_FDL_SET_INDEX,
+					 SDCA_FDL_SET_INDEX_NCOLS, 0);
+
+	val = sdca_range_search(range, SDCA_FDL_SET_INDEX_SET_NUMBER,
+				val, SDCA_FDL_SET_INDEX_FILE_SET_ID);
+
+	for (i = 0; i < fdl_data->num_sets; i++) {
+		if (fdl_data->sets[i].id == val)
+			return &fdl_data->sets[i];
+	}
+
+	dev_err(dev, "invalid fileset id: %d\n", val);
+	return NULL;
+}
+
+static void fdl_end(struct sdca_interrupt *interrupt)
+{
+	struct fdl_state *fdl_state = interrupt->priv;
+
+	if (!fdl_state->set)
+		return;
+
+	fdl_state->set = NULL;
+
+	dev_dbg(interrupt->dev, "completed FDL process\n");
+}
+
+static unsigned int fdl_status_process(struct sdca_interrupt *interrupt,
+				       unsigned int status)
+{
+	struct fdl_state *fdl_state = interrupt->priv;
+	int ret;
+
+	switch (status) {
+	case SDCA_CTL_XU_FDLD_NEEDS_SET:
+		dev_dbg(interrupt->dev, "starting FDL process...\n");
+
+		fdl_state->file_index = 0;
+		fdl_state->set = fdl_get_set(interrupt);
+		fallthrough;
+	case SDCA_CTL_XU_FDLD_MORE_FILES_OK:
+		ret = fdl_load_file(interrupt, fdl_state->set, fdl_state->file_index);
+		if (ret) {
+			fdl_end(interrupt);
+			return SDCA_CTL_XU_FDLH_REQ_ABORT;
+		}
+
+		return SDCA_CTL_XU_FDLH_FILE_AVAILABLE;
+	case SDCA_CTL_XU_FDLD_FILE_OK:
+		if (!fdl_state->set) {
+			fdl_end(interrupt);
+			return SDCA_CTL_XU_FDLH_REQ_ABORT;
+		}
+
+		fdl_state->file_index++;
+
+		if (fdl_state->file_index < fdl_state->set->num_files)
+			return SDCA_CTL_XU_FDLH_MORE_FILES;
+		fallthrough;
+	case SDCA_CTL_XU_FDLD_COMPLETE:
+		fdl_end(interrupt);
+		return SDCA_CTL_XU_FDLH_COMPLETE;
+	default:
+		fdl_end(interrupt);
+
+		if (status & SDCA_CTL_XU_FDLD_REQ_RESET)
+			return SDCA_CTL_XU_FDLH_RESET_ACK;
+		else if (status & SDCA_CTL_XU_FDLD_REQ_ABORT)
+			return SDCA_CTL_XU_FDLH_COMPLETE;
+
+		dev_err(interrupt->dev, "invalid FDL status: %x\n", status);
+		return SDCA_CTL_XU_FDLH_REQ_ABORT;
+	}
+}
+
+/**
+ * sdca_fdl_process - Process the FDL state machine
+ * @interrupt: SDCA interrupt structure
+ *
+ * Based on section 13.2.5 Flow Diagram for File Download, Host side.
+ *
+ * Return: Zero on success or a negative error code.
+ */
+int sdca_fdl_process(struct sdca_interrupt *interrupt)
+{
+	struct device *dev = interrupt->dev;
+	struct sdca_entity_xu *xu = &interrupt->entity->xu;
+	unsigned int reg, status, response;
+	int ret;
+
+	ret = sdca_ump_get_owner_host(dev, interrupt->function_regmap,
+				      interrupt->function, interrupt->entity,
+				      interrupt->control);
+	if (ret)
+		return ret;
+
+	reg = SDW_SDCA_CTL(interrupt->function->desc->adr, interrupt->entity->id,
+			   SDCA_CTL_XU_FDL_STATUS, 0);
+	ret = regmap_read(interrupt->function_regmap, reg, &status);
+	if (ret < 0) {
+		dev_err(dev, "failed to read FDL status: %d\n", ret);
+		return ret;
+	}
+
+	dev_dbg(dev, "FDL status: %#x\n", status);
+
+	response = fdl_status_process(interrupt, status);
+
+	dev_dbg(dev, "FDL response: %#x\n", response);
+
+	ret = regmap_write(interrupt->function_regmap, reg,
+			   response | (status & ~SDCA_CTL_XU_FDLH_MASK));
+	if (ret < 0) {
+		dev_err(dev, "failed to set FDL status signal: %d\n", ret);
+		return ret;
+	}
+
+	ret = sdca_ump_set_owner_device(dev, interrupt->function_regmap,
+					interrupt->function, interrupt->entity,
+					interrupt->control);
+	if (ret)
+		return ret;
+
+	switch (response) {
+	case SDCA_CTL_XU_FDLH_RESET_ACK:
+		dev_dbg(dev, "FDL request reset\n");
+
+		switch (xu->reset_mechanism) {
+		default:
+			dev_warn(dev, "Requested reset mechanism not implemented\n");
+			fallthrough;
+		case SDCA_XU_RESET_FUNCTION:
+			ret = sdca_reset_function(dev, interrupt->function,
+						  interrupt->function_regmap);
+			if (ret) {
+				dev_err(dev, "Failed to reset device: %d\n", ret);
+				return ret;
+			}
+
+			return 0;
+		}
+	default:
+		return 0;
+	}
+}
+EXPORT_SYMBOL_NS_GPL(sdca_fdl_process, "SND_SOC_SDCA");
+
+/**
+ * sdca_fdl_alloc_state - allocate state for an FDL interrupt
+ * @interrupt: SDCA interrupt structure.
+ *
+ * Return: Zero on success or a negative error code.
+ */
+int sdca_fdl_alloc_state(struct sdca_interrupt *interrupt)
+{
+	struct device *dev = interrupt->dev;
+	struct fdl_state *fdl_state;
+
+	fdl_state = devm_kzalloc(dev, sizeof(struct fdl_state), GFP_KERNEL);
+	if (!fdl_state)
+		return -ENOMEM;
+
+	interrupt->priv = fdl_state;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(sdca_fdl_alloc_state, "SND_SOC_SDCA");
-- 
2.47.3

