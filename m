Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC7E36CDF7
	for <linux-sound@vger.kernel.org>; Fri,  5 Sep 2025 14:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757082724; cv=fail; b=MZOIinrtVTGfD/OmmwMejqnZUapv6mW082wSPnatau9oRESmsnGr1qbE8N5PMX357T1Y/n6csxDsvX65dfLbR/5xrObc0jp9oAdMyJhJIOT9Rn5QrC4xnI+8zQrNOrQWSiQKdTN1zAVn1WggEdzxZptFp/rBLpXm3KhMELug+ZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757082724; c=relaxed/simple;
	bh=FWyULzqE4KslAJd5H4JJ8HRxjXMKivAmKaMP7StOkuk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FDqeTrOzE1HSHlUnWDtfayGRizWTfApb6l5R2FnaVG6j046LXTHSK77b8gFOHvAlG57kIi2gpVlrXCjR9Yt8pL0ByQDZAl/GeV+q3ducjy7JFCS6ILRf3muDhPqUmRbXUUf+JhBsHt7lxj55Q1CvWjx6I9YxBbap6HlDAzm+vRs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=XlmTzEXg; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=VmEM8Gww; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="XlmTzEXg";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="VmEM8Gww"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58549Fcn1243755;
	Fri, 5 Sep 2025 09:31:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=DzaqO2LmQJYA498qf5Kj28ZYp2fVXwrxliQolE1di/c=; b=
	XlmTzEXg0QlvWq0EatGbpGYYxK8lu5KWLZ7D/An2Ha12LFiGyLO9FilI3kRvw033
	z6yCO6qXfRpHsldU2OXBkmpejig4LND0CZKJPisfadhEW6IuuPphX+zq5HLkD5i3
	UAPtVGQhj0kfidaYgHZuq5lSJVmmsgGSitAlIZMHhSp1dr/RLVu16Mr6qsdWQ7n3
	Pj4DDU/R1IAi9as6OVc2RXMMgWg49lPg2sk1D/hoImBMJg3ch67cOkJ69mEwR64I
	41gLHNeYubJ2HZbeOozZs7mInMTR9cMTEo5CeE/8h5/tL+TF1wCHo7TT4xX2KgUf
	yaKo4+AI+ShAncg4omiT0g==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11hn2217.outbound.protection.outlook.com [52.100.172.217])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 48vensfsw2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 05 Sep 2025 09:31:46 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xwwDxz4OkBa4+RnmRQEHBgL988NpRFVEhqGTAXwV4/ehq0A7+woTlVc3CUhcRmoC+K18uSHpvATYdBwA51tEj+pn2SYvkgTQVblqhrcRaMj6x9xCfJS99tHoH3q4s/pKN48cow3UBC3aNBTXC+5d+IL/BezPAn1nzV+9xsZw0Qjtpi+YNMsBYeffp9JxHiECDGzs0MLF2zH3yKbEzaXImOCDYRzhfKu6xdB+jczsQc/NWhSijUmk8bOev2r9xLWSMevTuGtNr/62vvmLQttvGwDnknuH+KotpD2jwhpuh5hrS/PmZA7IhlAw1W1hIQmz1mybSPGv8q1mD2J5iN5NlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DzaqO2LmQJYA498qf5Kj28ZYp2fVXwrxliQolE1di/c=;
 b=SvZy6k9vq3n/+LgbWXw3XDgJKNMHL/YbXQnfBH6ciKtuKMuIVAeX+48FrAA8NRlnzvCmW6IyMQHc7z4V2+p2elZSrESTzEHfQnrU/SAfntjP+zLrR1jxTfEyvwFuXTDWNsWf/DwVOSY7qKH8jRu+6Ft7o2dxUsZaetQG0fIyORH9nOpqeuAfdX63pejAvdZB5Ng+HD1sdI5+b0i65o0fmoSaM+7HVag/KzUSnHLvkZ3ae+i/yzvjV+YCPoHtWs9JQRqpc6+gteFhOPWjSm/9CKGUFmDvAFW4yJXNihSo0A4g6AnYH10B6ZbuXCxjmH+Efz5ItR68+GE/0O1um9C8kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DzaqO2LmQJYA498qf5Kj28ZYp2fVXwrxliQolE1di/c=;
 b=VmEM8GwwsewTtW8gam+IX38r8LhVySFt3h0/j6aZ4sSbW05KaR8WmpO54SUAF9fxMbHnT+UNSTyPl5JxYo1qLNbsnMAJs3wEAIjBbTVYel2wFEgl/t827I6soFMWdTJJFMSTzuFXxHzesl4HuVB32cOKwU34HtK6P0HVrue+LSE=
Received: from MN0PR02CA0015.namprd02.prod.outlook.com (2603:10b6:208:530::16)
 by PH7PR19MB6110.namprd19.prod.outlook.com (2603:10b6:510:1dd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Fri, 5 Sep
 2025 14:31:37 +0000
Received: from BN3PEPF0000B078.namprd04.prod.outlook.com
 (2603:10b6:208:530:cafe::9a) by MN0PR02CA0015.outlook.office365.com
 (2603:10b6:208:530::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.28 via Frontend Transport; Fri,
 5 Sep 2025 14:31:34 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B078.mail.protection.outlook.com (10.167.243.123) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.14
 via Frontend Transport; Fri, 5 Sep 2025 14:31:33 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id DDF9D40655F;
	Fri,  5 Sep 2025 14:31:27 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id D618B82025A;
	Fri,  5 Sep 2025 14:31:27 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 11/15] ASoC: SDCA: Add FDL library for XU entities
Date: Fri,  5 Sep 2025 15:31:19 +0100
Message-ID: <20250905143123.3038716-12-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B078:EE_|PH7PR19MB6110:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 82ce7f4e-e405-4fde-61f2-08ddec88e9cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|61400799027|34020700016|13003099007|12100799063;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9KXQgmXDIhG3fXxEelahxJcLPKUDbvlXFm53Fslr5DQB2o6ZdbQpQDg+brP3?=
 =?us-ascii?Q?Yz7NR9UZ4HYYxnrxmix1xhaf5ZNSYIvt6Q9JF3Pwywvomhz3/steHeHNgdL0?=
 =?us-ascii?Q?M3pTjvCN3az3YoeTInkzUGJPWDbWVzcvv2S+DUzCp+BRe2nZ0Wrs1guAcKcE?=
 =?us-ascii?Q?tOVdb1Ceh4gEROYNzwp76QRZZmfiBjI5cJNsP9cxCdzZFxzuWswFfmCFFan5?=
 =?us-ascii?Q?dLkLLcu38oyhB86rNn3hKxh35Wlnbm5f10h5vOOVNLL0lJJFAEchQrdbtEBB?=
 =?us-ascii?Q?K5zKpdQi4YZHXsTjoAWmyjTzyKSUPC/+1AJZPKYNlbZaWXx7oIC4OT0OeoKA?=
 =?us-ascii?Q?Eq726QPLuE/9qwTUiTRPPmbdo4crJxXZnc2BYWplZ9rPPzJjbCtcJFvKZvdq?=
 =?us-ascii?Q?b8I3CI/vRsVF/uJnJem9w8yt/fBei6mWYchEMaJQ66zviUvLBQuut0E88DMl?=
 =?us-ascii?Q?580iFFsnnO8kSDCdOB0264Bb3+16S5Uya4d3L57OZBd9WKQ55kMPROqhls6k?=
 =?us-ascii?Q?AaP3yB+jsw1I7HfwJu5XGr8NooSVZBlLU9FEuB59M0Tnu+kiySPI9N3BAUom?=
 =?us-ascii?Q?gxKtbg0Rns1fXQUSf7+37tHnGSif/EXFMjBUKtkBFRVJl4wZqxgg6xA85eYN?=
 =?us-ascii?Q?tyPZITVmzMPzoO29zlaiPolqVUZjQIDj1a9Vw39rMNoYiEf/EEIowwwdH4ie?=
 =?us-ascii?Q?alCowsVrmyL1gMlO6BPjNhdS6m/v3lTgBflza46PPYAe400brBpP9qwz6ZwD?=
 =?us-ascii?Q?6y3jgT6yjY2kEs0phuqrVvAzx91FPN+c1udv6H7AfWf5V8BYsumXcD/L6xFK?=
 =?us-ascii?Q?Tw2zI/a55b1yMdYi/0AIkLCy/v4JINuEvtbxAEjFtyJv/d7zU/uapPqkFO5G?=
 =?us-ascii?Q?Yh05xRq55K1gLOsxRTpTxEHsfx8kJUtGdmk2AsLubGpcwa4z7HR6u9EQ29wC?=
 =?us-ascii?Q?6rqO+H0iUa6btPrXpSvwwYP6a3klmhZKGjsx74nA++IlCZt7XSeun9xHljDC?=
 =?us-ascii?Q?MZ1pHehYFIdeJGAK74YmL8iVpyRWhxn6Nm3hH8f5zBJWqNLEe4NQpx1Q5SUC?=
 =?us-ascii?Q?KSUaZSGD6KukVs1ZW1r7qJmUdTguCNhOkZ/6ck+hq+lsM95JPHAwD0qJonVB?=
 =?us-ascii?Q?MhBbd2AcfLDDYLWiCGAfFoE7fjbRqQtg1sVgfi86ljYhySGBqBA7z6ifD5i5?=
 =?us-ascii?Q?F3onr5cK7o2f16Dy+dzq6ncKT7WCkixeLrdKiMVKt+Sj5DHSv5E4jxYDT27n?=
 =?us-ascii?Q?GovMD2ZyDh/USlRjLT6KOFMODvwBQKjSWp9O9CPuVT8nP7btm2kNCB0ykZEz?=
 =?us-ascii?Q?ZrI9BJzgcZbfDZV4Aeyo1JDoWJMyXrPd/uDSQWraYVTbge+ommYEb4tP8Ywy?=
 =?us-ascii?Q?Glthvh5zbuyDzhaxYgBBPEhAxGHEMI3TFwng8CG9ZCJbr0zH+C8wbXcboreE?=
 =?us-ascii?Q?+IwQ3gPAM12HDStz0X0UohlrXpeKtQPEE9GB5PppjNF/WoNYubJiXw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(61400799027)(34020700016)(13003099007)(12100799063);DIR:OUT;SFP:1501;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 14:31:33.6712
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82ce7f4e-e405-4fde-61f2-08ddec88e9cf
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B078.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB6110
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA1MDE0MiBTYWx0ZWRfX/7bKx79Vukde
 CENj0WfPNB2fONPQCUJJC5T/z1ghqxwAbkNE2ZPaClIlQmgtdWdvY1eTVzx2Ns4ENXlNB7x4DFs
 XoLLaFP+aDvm+52wN+3QUwe82lOv691TpJ8219+pib/fM9+Ymr845ZGXVQz2XMsOm3It0oiufn+
 QVMHj9D9HSFbUr4iLdMZD/LKOLDxjwWs2+EexcRE8x+3Q75S8ZblJXUyu516Dy/a+VNxc+VPaRI
 gJIMJDaZplE+MbdRgPDtwXkfUGUfPzS2nV2W0gXuJo2mocrHMGvCZWEEnnUPs56f77eVUsx/rE8
 +fJHVni8X5lF6rxXoRRJ/795miKsjYw+XIS7YjTeJ6MMU10QIidrjlHreVEpcw=
X-Authority-Analysis: v=2.4 cv=BY/Y0qt2 c=1 sm=1 tr=0 ts=68baf453 cx=c_pps
 a=6tzeBysbjMPqSRQ0i9FWHQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=KJT-RnjOAAAA:8
 a=w1d2syhTAAAA:8 a=meKaLK7t0xT8hC_3HS8A:9 a=HE_01F9_QflCRFonrIQr:22
 a=jZz-an6Pvt0H8_Yc_ROU:22
X-Proofpoint-GUID: qaNzv31oYQFpERBVbUAsp1IbNnytxTPe
X-Proofpoint-ORIG-GUID: qaNzv31oYQFpERBVbUAsp1IbNnytxTPe
X-Proofpoint-Spam-Reason: safe

From: Maciej Strozek <mstrozek@opensource.cirrus.com>

Some instances of the XU Entity have a need for Files to be downloaded
from the Host. In these XUs, there is one instance of a Host to Device
(Consumer) UMP, identified by the FDL_CurrentOwner Control. XU Library
introduced here implements the FDL flow triggered by FDL_CurrentOwner
irq, which sends a file from SoundWire File Table (SWFT) or from the
firmware directory in specific cases, to the Device FDL UMP.

Currently only Direct method of FDL is implemented.

Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
---
 include/sound/sdca_entity_xu.h  |  52 ++++++
 include/sound/sdca_function.h   |  21 +++
 sound/soc/sdca/Kconfig          |   7 +
 sound/soc/sdca/Makefile         |   1 +
 sound/soc/sdca/sdca_entity_xu.c | 315 ++++++++++++++++++++++++++++++++
 5 files changed, 396 insertions(+)
 create mode 100644 include/sound/sdca_entity_xu.h
 create mode 100644 sound/soc/sdca/sdca_entity_xu.c

diff --git a/include/sound/sdca_entity_xu.h b/include/sound/sdca_entity_xu.h
new file mode 100644
index 0000000000000..6f2ab0fc905a8
--- /dev/null
+++ b/include/sound/sdca_entity_xu.h
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * The MIPI SDCA specification is available for public downloads at
+ * https://www.mipi.org/mipi-sdca-v1-0-download
+ *
+ * Copyright (C) 2025 Cirrus Logic, Inc. and
+ *                    Cirrus Logic International Semiconductor Ltd.
+ */
+
+#ifndef __SDCA_ENTITY_XU_H__
+#define __SDCA_ENTITY_XU_H__
+
+struct sdca_fdl_set;
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
+#endif // __SDCA_ENTITY_XU_H__
diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index 7ee2f6666958b..7578615b8dbdf 100644
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
diff --git a/sound/soc/sdca/Kconfig b/sound/soc/sdca/Kconfig
index 6a3ba43f26bd9..a607e2a28fc67 100644
--- a/sound/soc/sdca/Kconfig
+++ b/sound/soc/sdca/Kconfig
@@ -25,6 +25,13 @@ config SND_SOC_SDCA_IRQ
 	help
 	  This option enables support for SDCA IRQs.
 
+config SND_SOC_SDCA_XU
+	bool "SDCA XU support"
+	depends on SND_SOC_SDCA
+	default y
+	help
+	  This option enables support for the MIPI SDCA XU Entity driver.
+
 config SND_SOC_SDCA_OPTIONAL
 	def_tristate SND_SOC_SDCA || !SND_SOC_SDCA
 
diff --git a/sound/soc/sdca/Makefile b/sound/soc/sdca/Makefile
index a1b24c95cd8c8..f2155eb6b6f98 100644
--- a/sound/soc/sdca/Makefile
+++ b/sound/soc/sdca/Makefile
@@ -4,5 +4,6 @@ snd-soc-sdca-y := sdca_functions.o sdca_device.o sdca_regmap.o sdca_asoc.o \
 		  sdca_ump.o
 snd-soc-sdca-$(CONFIG_SND_SOC_SDCA_HID) += sdca_hid.o
 snd-soc-sdca-$(CONFIG_SND_SOC_SDCA_IRQ) += sdca_interrupts.o
+snd-soc-sdca-$(CONFIG_SND_SOC_SDCA_XU) += sdca_entity_xu.o
 
 obj-$(CONFIG_SND_SOC_SDCA) += snd-soc-sdca.o
diff --git a/sound/soc/sdca/sdca_entity_xu.c b/sound/soc/sdca/sdca_entity_xu.c
new file mode 100644
index 0000000000000..ff7758460edc3
--- /dev/null
+++ b/sound/soc/sdca/sdca_entity_xu.c
@@ -0,0 +1,315 @@
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
+#include <sound/sdca_entity_xu.h>
+#include <sound/sdca_function.h>
+#include <sound/sdca_interrupts.h>
+#include <sound/sdca_ump.h>
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
+	if (response == SDCA_CTL_XU_FDLH_RESET_ACK) {
+		dev_dbg(dev, "FDL request reset\n");
+		// FIXME: Add reset of device
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(sdca_fdl_process, "SND_SOC_SDCA");
-- 
2.47.2

