Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB43015E5C2
	for <linux-sound@vger.kernel.org>; Fri, 18 Jul 2025 13:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752846903; cv=fail; b=h7E93pd7vxSzvsBs+E2u6EVzw5NBssG9EFBSoGv0Gsl6FAMXH5G3SOZMYAMMGNxf9XtwBYpDlMzalhUeyuDXZjPjasOnEdLJ/eoofRNq35XXCS2dde2JpK3bAZ2PbPP7UiqfXLdyQDnJXULEZApzFXtXYntkrncU8/NkeMQ5iUA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752846903; c=relaxed/simple;
	bh=BW0mkRWx1Gv+rOCu4YcO83sTXxWE+n9FeVvf7fvPRug=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=bYusCdMcqZghUqeYbXqRVo3AgUr9jn96EFGgjFJ8cLF2dO8eaE2MhpKouO7nZvCfUBeGBWjg4nXeX+iLG+rsPYh1wzF56Kx3ubIrbJwd56DL6BjNwh0xe96Zw0HyJ8dqIfAa9rLp48nOrfaXhWs4tdcIWDC4csCbLINR2DHx5nc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=X9s6Sxyc; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=RQN7hBfh; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="X9s6Sxyc";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="RQN7hBfh"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56IBGZO4024560;
	Fri, 18 Jul 2025 08:54:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=rfaXH7j+GeekAKX7
	ST7nTnMxiX8y6snGY6Sc0xUnuYM=; b=X9s6Sxyc/LMsZLohv/FmnlNhdIJ7848B
	2xQxP2/3OKlNuOiiqgt6wg2CTSTgvIt0k4r0giYJfhihhnUP3BZWuOsqeTnQAQGd
	NSZ8auI3u1LY1NcS58qYbCOTca5PmvsPlZJAsN8mBFiH/K8t01KsmS+y8DPtAAKY
	4Ym+k2csfrGsGL7KwwG65tbvWB1J9cDURvq6TO3N/CfvkhnjMCsMekJJW+W2FG4d
	lnvwVnot7NHNXSaymijvKKYDd9DB2nNxxjVefhlt11fHNvSxyiAgkuQ0naIbRTqx
	w87YY2mIIQaMoiJXzA5+9ixJU+4HiqzXDyHmLDz5oBsWdKqScS7aEg==
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2120.outbound.protection.outlook.com [40.107.236.120])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 47x7uuuf4y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Jul 2025 08:54:43 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JSkCnLIRvuuA3GDcfvJMWb6ywhhgDKF1qNy+bdcqdt3VUzc/PQtZyyyikK6GmrjuTH+KmSnfbGN+CZz25DJzfKRZEMNWqboPlDvd9UkYrBLE+JgmEFN0XjMVChi3kdXNBKltywRHVj/ImH8+dfftuUldIlu0hqk/y6eUPGkUQ1vKHUvgCA7cA54UGIuQxBzF/tbh2BEylzGG4bVTTNCRkakmd7EEZyd4JOkUveE+dI4iQGnqyJ7pF/url345475Pz5/uXlC6eCAEWjt1aDs/og/EHI4p5wXtzWX8sbwrnxObD0Xd/GOwEprGFFoen79N+cUfyMQkJDmY46OZqU7Daw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rfaXH7j+GeekAKX7ST7nTnMxiX8y6snGY6Sc0xUnuYM=;
 b=zAbaIlM8QonDNxYDZa9Ha26+8EcnYjaVhUyaPILF8wzV3HjNAWgaFici6RL7K2z2hGYBAdhFBuHWNlQxeUG/hx56KtNlDmtbOsjC15q6ZlS+qGhLD9H3ALE0epB8YSSyZm0ZLkHQBCjrEd6Dxcqwv0wE3u9sjNOdkLHjcOpdAZ+XwvlPTE/S+gmuHwZC31PodxIbIHfThhn3wTOlLjyN7qnCArjwfY7GkhBBcGEtaYkq0XdFallWHqH3t76uICwxNqGdybUK4zTDOmESieWDzJ6Zvl1wsqAkdQz5E9c23l+vC787Ucf5TeMXHjlgquNXuMpUGoWtKwcXSmstZXxGtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rfaXH7j+GeekAKX7ST7nTnMxiX8y6snGY6Sc0xUnuYM=;
 b=RQN7hBfhsBnP07/jTKH6v/tuU/ABPoNcKLbR2jg227H1K6xwhVuXqF6DVBup+KPEc0iY0u3iciTisGumk1YiQnhF0JAhoDUNSn2TqqjEzXLBR/Kchs97Me/WKu7ohFj6HTZUx6dP3hQXTNqDpRi5tPj0RX4OxIFVcOhj+q3dp+Q=
Received: from SJ0PR03CA0034.namprd03.prod.outlook.com (2603:10b6:a03:33e::9)
 by SA1PR19MB5499.namprd19.prod.outlook.com (2603:10b6:806:233::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Fri, 18 Jul
 2025 13:54:40 +0000
Received: from CO1PEPF000042AA.namprd03.prod.outlook.com
 (2603:10b6:a03:33e:cafe::ac) by SJ0PR03CA0034.outlook.office365.com
 (2603:10b6:a03:33e::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.20 via Frontend Transport; Fri,
 18 Jul 2025 13:54:39 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF000042AA.mail.protection.outlook.com (10.167.243.39) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.21
 via Frontend Transport; Fri, 18 Jul 2025 13:54:38 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 2F775406541;
	Fri, 18 Jul 2025 13:54:37 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 15452820249;
	Fri, 18 Jul 2025 13:54:37 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 0/2] More minor SDCA changes
Date: Fri, 18 Jul 2025 14:54:30 +0100
Message-Id: <20250718135432.1048566-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AA:EE_|SA1PR19MB5499:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f645e167-17b7-409e-d628-08ddc602a35a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6Mz4TVMQKHxRw0rNi7Bv0PTw8wD6FL/UQddp68nw10+Y0d6OiFCQopC0hAmT?=
 =?us-ascii?Q?IHuSYeo462MJs02P3gx2LQbi3RO0aHt/EgbblDxdaNRHTIC0vhpUMzNh5Swz?=
 =?us-ascii?Q?40my+/rvw22ab1sWWlOy6kzIweu8nxZ2GMFJ5Dv43UgrN9VtlXRV5zLxYEzC?=
 =?us-ascii?Q?/PknIUfPoYw440AR8VfNOWeQ1iN8gAvcGs+WSHxuHgiM+5fiuxpWVUP22kE/?=
 =?us-ascii?Q?13WhVo2EKb6NP9NMsieXj/k66RKkdZydkIJSDjKDbIzihHvkD4VXTbZJg4MM?=
 =?us-ascii?Q?UQvCxmGVeER3FzvEWbAbvK8B5pHdROla9jLtPuCrKET+Dmpjp3RddrtjbR+8?=
 =?us-ascii?Q?HjAyOxalSuFWdS5KdeRo+aawVRudUyj9qweC54SbTwPdF6W4UdIfJxEnUTS5?=
 =?us-ascii?Q?tW5meHt86cKLdW8sZHV7wazOePc3mr7HLr86GoX6lAOvDQpAX+telbSImYSw?=
 =?us-ascii?Q?zcUqW7QlyL5+8cQhWqZ7E43tcatggRb8v3k+mvp6aZUuYNLQDo/SWeCSJM+l?=
 =?us-ascii?Q?dkvzqMLzGqrnqq+J76nXYj5GsUfmUNZqCncy7ez6m1WTYCyExnfCRU8rDu64?=
 =?us-ascii?Q?Ck6kkr5WEl8SzP6BzvbTiabG+WWGCCjUUvkjTnyQFprIYRmB0QtH4/ZRSkc9?=
 =?us-ascii?Q?AaK0ftFCrCW2lId0rTRnd2syRf5ZBcE8cmMNOo7QEPEyX8+/aJXjid5mURbt?=
 =?us-ascii?Q?uKS7q/Kos48wTGYZYXLQtaIDWZ08oP5Q+yAgJRBBWw5ZHZ9L+pkmtRV1rbq5?=
 =?us-ascii?Q?HVXkfr7qAU6QkLvRW13x2imgxDL7qHu5IP5F+bdVJNkFkpUUG41dlVC5nfZ6?=
 =?us-ascii?Q?6jzFCw7mngDcCdhwaJXHvdHUZKOWaRz/PNAw9JApG1aVhJsbfTA40KahDt5v?=
 =?us-ascii?Q?gwieFNJZpzLom99VEJ2cMC3eMvdHQb3fH1c1mBOg0bhqiBpLqmPoXRCSDw/8?=
 =?us-ascii?Q?nzufa5y+SscT3sDgCJMQhdnzzoQWZKbkRaDaOc6j2bG3oyBIYjUXuR7TCI4r?=
 =?us-ascii?Q?v3EI/Yz0CERrmKdNn+gRKuMWYAmwZmaeaYdFABEHbC3NsFa17TW/yb9xS9gR?=
 =?us-ascii?Q?9odA42i1xjEutQblxOM+5F91l4vsXCEjIE3ZR8yPtYAVK4mqSAZzTfPC2c6X?=
 =?us-ascii?Q?kSMmU8KHmsySSiEJiHR50M+uR47z6Y2u1b4or5Jw5EAAOc6lJHLcaauOM/cU?=
 =?us-ascii?Q?u3uM45wZs2f/bYS7nclK3/PAJW5varJH2IHwV960DJpoHaFMDqtSKcAS6Se+?=
 =?us-ascii?Q?6AfEo0znN4uLakfgmnK+XFkJgaWaKWhjEZdEKJPvT7YWCzFVyIoZoHYgiLaP?=
 =?us-ascii?Q?EUIz0A/+dHT1Gl3IAxXlLINMaewENr3V6F8dO6bem3cdbCzE3lGqTWSwJHl+?=
 =?us-ascii?Q?/01PNffmJ6fTRu1/E1BZpQHlKebc44AmpLjyxE/DiphpQXpbEMPQuP0Q8w2B?=
 =?us-ascii?Q?up4RRs2JzaVT2VxSzlphk30kIFfblBwq6mPgVpQJ/d8zxrlQ2wMBam4e48ky?=
 =?us-ascii?Q?59gwsOk3y/vIhGRgC8eyXPKKXJObeq2L2NEH?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 13:54:38.6079
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f645e167-17b7-409e-d628-08ddc602a35a
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB5499
X-Proofpoint-ORIG-GUID: dbGok0cqTRqBCHhp4TNlYMa0O5Fh2xUp
X-Proofpoint-GUID: dbGok0cqTRqBCHhp4TNlYMa0O5Fh2xUp
X-Authority-Analysis: v=2.4 cv=IIwCChvG c=1 sm=1 tr=0 ts=687a5223 cx=c_pps a=Ufsf49TWcJbLMf22iB5iag==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=Wb1JkmetP80A:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=Pgp_QrUPNwGWFtvJARoA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDA2NyBTYWx0ZWRfX2BosN0GVOIAI Po7hkbC3LmSjBmzHEHp8DvlBencHZMePP3wCY6kPQ9R0E4inRL5NQhXmt7+ge7Fpm74+8m0yjA3 Qf0sUhKNjzXtBftXensgKGKTClDOnjb92hIRGWSosRXFvEiXGPpbKlS83HWkdBI0UiLHgWfMEtg
 Z2c1CNDiE3DkOTgRcxdpmviK5XEtnAVzYr2fCKfT+cxZBIPSlb+QwoXMGn0rhAZezNtS0SpzrtW /tn9us64tFURtSNiKct1a5qRfJqzAlOk+a9z4p27k4i/O4U5WyoHmwHSBDeOm2cXVZosh+EIv2x xc4MS2YLi3CF8lCzqvxijWfh20thszIbM4k8MrdbmPjVqNnRTMbRaqZkvKbVIcGgO8aZbVtrG8l arZmUvXg
X-Proofpoint-Spam-Reason: safe

A small chain with some patches that seem to have got lost in the
process. One small additional bug fix for the regmap callbacks, and one
small feature addition for the control parsing.

Charles Keepax (2):
  ASoC: SDCA: Fix some holes in the regmap readable/writeable helpers
  ASoC: SDCA: Add support for -cn- value properties

 include/sound/sdca_function.h   | 14 ++---
 sound/soc/sdca/sdca_functions.c | 99 +++++++++++++++++++++------------
 sound/soc/sdca/sdca_regmap.c    | 29 ++++++++--
 3 files changed, 92 insertions(+), 50 deletions(-)

-- 
2.39.5

