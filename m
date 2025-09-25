Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C82E2F83C1
	for <linux-sound@vger.kernel.org>; Thu, 25 Sep 2025 10:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758797667; cv=fail; b=sBfQ3684iIUadonAbF66rDXi/h99CvejkXunFZ+hq7zpe9anMPHnEduTQF6CB5f/CFP44ZBFkPLKV3UIQ3LD/zeXx1GfjFpRp5uS2Im7+0QtWVqPlVDlqpnZ1M4rgrvzH7n1UgLT9aX4vIWzzKat+oaRygYK9bz8V5O494c0dR8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758797667; c=relaxed/simple;
	bh=/mm8Ea6o1ZIgZqT4rOwmfJ5CqYbrxr7k/2oEqEgddMU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WghQLihisTxsUGqWSBGAM8YzBaUnE17pOZ2OJL23f8eEKxPYubC9n1UbXRQIw2FYUqmE0ZOJNpaSnN0CoDe2Co9spk4dchSD1fb1U5QXZHq3iHT15+7CbmaPPZMrz7P1m1GQk3crFqPry+bLvnP/yaB+tVxtKEXNxBehZxUjPRs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=kaibbP07; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=I8HdLpah; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="kaibbP07";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="I8HdLpah"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58P1vI921785206;
	Thu, 25 Sep 2025 05:53:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=aMNCRp/hDKHKvX4PdOXq/7vjkLAn1q0OuVcTPWDtQf0=; b=
	kaibbP07dTqsIzzQO5Z+GJAHGg3aFmljejwhjv4Ut8TK6o9KHggbtRUxLYovQx9P
	Luamq15MCytiUSEt93FlQpjHhNRnrxXjI+AqeXIYxc6BczCPKqK+ddw7zjnSDDZT
	DmYuVzMLscM+KAf1UKhPTHoA5tMdYezeT9mKQ8Oav8B/+26dJXfM9Ywrlv7duw76
	j+NC8o5SWGGmIArrKwWhRNesXaokGULydxLNUsfPu73fN0YlwERIGL1V1z2sJ0Lz
	l4jr2f2KO3MSpHyubc4IJv/QsI38FoKVDE70xnrBZy7R7x4obe4LYAJdhZ+4brC8
	DxrI8Atgd2KIvVmOzuf2tA==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020105.outbound.protection.outlook.com [52.101.61.105])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 49cvharf6m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 25 Sep 2025 05:53:58 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E56hDJfV5xD/TiADShDtKZ2xc0ScIJb2rpHkBK3ANUvS7GmN2rYCX1zinlOcqagH5Q9yotAYFVLDc0NdIjutU+UYVFFOUUgb+GKu1dsz6P/Pf5fp35IXLECpCh8u0ytb8+dp5yfnXlnvFdvOaa9xe0Un3KoBTyO8sO7u6Cesl9BIVQKQctYaF8oZeceVlDFkYfcSWxbCMhSYUDDLkmK+tF6al2xwklDUY4ObIFQFJl8Wa80eIBgV3DA05LROrTbIKf7ev7y9Oz5wsNtkONk/KSsOyGkjggAxAUKjlvu9SG4xs+TcAMvHVDiIq6StuGbpC2OzJZyDYYHxJevq+DW0Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aMNCRp/hDKHKvX4PdOXq/7vjkLAn1q0OuVcTPWDtQf0=;
 b=RxlNFfHquLipMbZUy6OLM4OwiQag4pSa6SZ3EXD5b4cuPlON/3+1x10TaS1Zouz9jhzgUYoPWOtQM3b8PIxPZRA7YOlwH45vOJevNoiOUWl/TSnFV4b4iX36XIMVV0vfzsleh8s1tWvnkAUvxdcSKM5XvmawoOnDTovqowXQ5ulEw9J6MAiHCiqRJi6q3YG/ROjDLuFqtr7MfgMyLE/AdsAX9TbNRv9aNaD6uB9jffvyGQLmPy/MGQJd993FDGSce+uhabZgZBwBrv9TjRkhs79b2JHRaiQTkf/+0/hzjfMgUHY0A9A1sop62OI7cpg3YgcjC0N+d++JuFVSLAY6+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aMNCRp/hDKHKvX4PdOXq/7vjkLAn1q0OuVcTPWDtQf0=;
 b=I8HdLpahwhg5Ndbc8WTUPBXyhnSAreCOaL4iDb3C7BbbQm/dl+n3ZX47A7jku3ye2MRFkEnBOWsGlb7rlphLJR1JO1lwhTevz67lqgHsDuzKAVOczJldxugGasiwjtxddhj1STku1GJeVT3qjzFsmV+8Nr6VsUn4ACi/Wj/5eoc=
Received: from BN9PR03CA0948.namprd03.prod.outlook.com (2603:10b6:408:108::23)
 by CH3PR19MB8212.namprd19.prod.outlook.com (2603:10b6:610:198::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Thu, 25 Sep
 2025 10:53:52 +0000
Received: from BN1PEPF0000468C.namprd05.prod.outlook.com
 (2603:10b6:408:108:cafe::67) by BN9PR03CA0948.outlook.office365.com
 (2603:10b6:408:108::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.20 via Frontend Transport; Thu,
 25 Sep 2025 10:53:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN1PEPF0000468C.mail.protection.outlook.com (10.167.243.137) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.9
 via Frontend Transport; Thu, 25 Sep 2025 10:53:51 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 9F870406642;
	Thu, 25 Sep 2025 10:53:46 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 93ADE820249;
	Thu, 25 Sep 2025 10:53:46 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 14/19] ASoC: SDCA: Add FDL library for XU entities
Date: Thu, 25 Sep 2025 11:53:36 +0100
Message-ID: <20250925105341.194178-15-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468C:EE_|CH3PR19MB8212:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2ec86591-47ba-4a63-22fd-08ddfc21d03f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|61400799027|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JljE2vFZchAa7HBc1M9ywrWwk0iC7IWnv/ux4v8xd/uBPmemLueEfGzMzNQE?=
 =?us-ascii?Q?PVSw47FqkcufGrfazBtQFYdrkLgTIOk5R2mb0zMRrqFM9EypVS31TyBAGnSX?=
 =?us-ascii?Q?VuQ3QmJLgAmS3bbDXnUqEw7LTGR47CmG0IaA4FjKIWbWiN2Pv0aWVqSUp+fb?=
 =?us-ascii?Q?awdvJqJzCBJq+qaj+i0MVnx0rjhRmWltsWEUuD4YQqxNRf7WzEsZ/X9d8yo7?=
 =?us-ascii?Q?zJZCNevash4a6H50I7R3qRlySj2kasjniMD9jnyZyOytE3/p4cPu6i7cSzUq?=
 =?us-ascii?Q?/IvZZOTIFUEutIAkHQ7kIdl9FvdVPSd1QeI9Sn8mhFQZ/ube2t+FJOENphV2?=
 =?us-ascii?Q?fIpelNfJWJX0suP4S3B1jqrlzZkjLoHUXsEREaXoSDg4xYrFl10qBrPerfkj?=
 =?us-ascii?Q?lkV/DN186e65LWcCFQoEHXK0WggHUpFim9QnBYcN3o58qjKZhGVRmBj6PBMA?=
 =?us-ascii?Q?0zdVsuSbLiWMB45okbG/ug/IPEJn+TJBZoMR6p6RJQ4bfXZ7E/cGaz72DZYN?=
 =?us-ascii?Q?80KVlQJLHVd/pnJcPmqAeVrQznC/m5rk1t+nCIz1+LAVysL2+QDjGQhOnu8s?=
 =?us-ascii?Q?vd3DEXoFVhoX2jzIFb8bkfUkt6B/XYWsre5jluQQAS7LYMoFGu+BmyfGlXLy?=
 =?us-ascii?Q?3bAL2Aq4SsFwAp0eUAXlyAFaV7szA0hTaAVb6+IUeHZNeoMScz0Ncz0b49ax?=
 =?us-ascii?Q?NiZ5ZjTsEBBMi32n5jgjL1rF7rBZMHoKmH/YTuRx8YFAT3louPu+l4t2Cevx?=
 =?us-ascii?Q?8ds00OLx404zJEqn3u2y/3mY4EIH1W2gt2Vea4AajQKHihaENDtKP+IR4cC4?=
 =?us-ascii?Q?Mu+GxB3HAdp0fBytpaY198fu1ZLWUt1WD+EiibrnwRwz2zxJMGtHIn9CEcAu?=
 =?us-ascii?Q?11hpRB60NzE5FGQVz9orqs6NSkzLAo8JTePh45yPSJltw2Rct3eeZbl7Z4bA?=
 =?us-ascii?Q?e49fXbAO1c/lyGTMbS4N8ZY4vwhaxlBv0qtMDf0lhJwU6FDFpksVqwds5iHk?=
 =?us-ascii?Q?UIWx+ze6t4CKOAhA1fDE6QxgEyvRRDQUIW76F27HCPk8FbdkdxAdngQhEjbD?=
 =?us-ascii?Q?gewWM9CRA2gyAsbc+yFX11Qa5EJCkcxd2EqksrUensArdV+Pp5lMNV40IN0D?=
 =?us-ascii?Q?nSG02vgib40cPqMKUcX1Wc8L9SUBovbaryuhcFFA5OjmbbcAgLVcGWaJbPKn?=
 =?us-ascii?Q?7GmbGOw/biwSFLuPHC20IU6jggMGSm6t8PLnVcv/kIcW6Yqzuy0J4ac/dz8o?=
 =?us-ascii?Q?/JCMafYwhRtpK0QAIteLB+9LUouq0r7eKOttDGhxOSsScBIw3yW9HAOBH0Hk?=
 =?us-ascii?Q?lnz6ZWWHZbBLYdTb53R/5mCK0PpXOXhcjEgLITfXvTshAVYOxgwX6QBVC0BJ?=
 =?us-ascii?Q?HSfuoUP/1e+7SA5gx57WGhPtgcmohnKd4fNIkttKnkprJc0of4bFFqA4IKUt?=
 =?us-ascii?Q?9j0Y5t0gGT0+tiJziENeQXhVs03zd8sMdwvNC8aoS6QgCCL5iTNJOQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(61400799027)(82310400026)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 10:53:51.2242
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ec86591-47ba-4a63-22fd-08ddfc21d03f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF0000468C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR19MB8212
X-Proofpoint-GUID: S3B0HT-85wyHx8Jwy_G-gMWhmtzNVbiz
X-Proofpoint-ORIG-GUID: S3B0HT-85wyHx8Jwy_G-gMWhmtzNVbiz
X-Authority-Analysis: v=2.4 cv=dL+mmPZb c=1 sm=1 tr=0 ts=68d51f46 cx=c_pps
 a=SfbXOumlQYQ7ptoTXzRROw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=KJT-RnjOAAAA:8
 a=w1d2syhTAAAA:8 a=QyXUC8HyAAAA:8 a=t79y7CTzVJ1LY0QAh3MA:9
 a=HE_01F9_QflCRFonrIQr:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDEwMiBTYWx0ZWRfXyjGtyCI+0Uyd
 yQH4kiEu2g8CMTX4Q7L0FP3eWaGebXSJRgQ5m8c5GQoifTPa92q3+VcfR1W8qkmnlK3vbzmjdWY
 7AHF+Z89EGqw6HdsioKtc3k622bzOYqeG4Jol3WfgaHjT4HELjBRByYo/VhhJEHwnbzdGdBX2ZO
 K9v8nIbti90Q5DObtlzQrdS1SDtER24uKzWCaaGbW9M62uqCn0nEULstgLBd8s0u5Vz0h5urvgQ
 yfrE02FqCY8440XTSiVq0Mk1UteOksC8PFWtRXXnPfYTIXgFHygoWAHpdI7F55CYDnOKjAMYDGa
 WAR/WlhXj/PyWETFK9fNhOClds69LyLJwgd1GtwU9hA1A++8NgNzlEUKik/T6E=
X-Proofpoint-Spam-Reason: safe

From: Maciej Strozek <mstrozek@opensource.cirrus.com>

Some instances of the XU Entity have a need for Files to be downloaded
from the Host. In these XUs, there is one instance of a Host to Device
(Consumer) UMP, identified by the FDL_CurrentOwner Control. FDL Library
introduced here implements the FDL flow triggered by FDL_CurrentOwner
irq, which sends a file from SoundWire File Table (SWFT) or from the
firmware directory in specific cases, to the Device FDL UMP.

Currently only Direct method of FDL is implemented.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v2:
 - Check disk size of firmwares
 - Reset on more FDL failure paths

 include/sound/sdca_fdl.h      |  58 ++++++
 include/sound/sdca_function.h |  24 +++
 sound/soc/sdca/Kconfig        |   8 +
 sound/soc/sdca/Makefile       |   1 +
 sound/soc/sdca/sdca_fdl.c     | 376 ++++++++++++++++++++++++++++++++++
 5 files changed, 467 insertions(+)
 create mode 100644 include/sound/sdca_fdl.h
 create mode 100644 sound/soc/sdca/sdca_fdl.c

diff --git a/include/sound/sdca_fdl.h b/include/sound/sdca_fdl.h
new file mode 100644
index 0000000000000..8b025aff4a0cd
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
index f557206cec83d..99cb978f7099b 100644
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
index 6a3ba43f26bd9..a73920d07073e 100644
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
index a1b24c95cd8c8..be911c399bbde 100644
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
index 0000000000000..8a15c6300556c
--- /dev/null
+++ b/sound/soc/sdca/sdca_fdl.c
@@ -0,0 +1,376 @@
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
+		dev_err(dev, "request to load SWF with no set\n");
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
+		if (firmware->size < sizeof(*tmp) ||
+		    tmp->file_length != firmware->size) {
+			dev_err(dev, "bad disk SWF size\n");
+		} else if (!swf || swf->file_version <= tmp->file_version) {
+			dev_dbg(dev, "using SWF from disk: %x-%x-%x\n",
+				tmp->vendor_id, tmp->file_id, tmp->file_version);
+			swf = tmp;
+		}
+	}
+
+	if (!swf) {
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
+static int fdl_status_process(struct sdca_interrupt *interrupt, unsigned int status)
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
+		return -EINVAL;
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
+	unsigned int reg, status;
+	int response, ret;
+
+	ret = sdca_ump_get_owner_host(dev, interrupt->function_regmap,
+				      interrupt->function, interrupt->entity,
+				      interrupt->control);
+	if (ret)
+		goto reset_function;
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
+	ret = fdl_status_process(interrupt, status);
+	if (ret < 0)
+		goto reset_function;
+
+	response = ret;
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
+			goto reset_function;
+		}
+	default:
+		return 0;
+	}
+
+reset_function:
+	sdca_reset_function(dev, interrupt->function, interrupt->function_regmap);
+
+	return ret;
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

