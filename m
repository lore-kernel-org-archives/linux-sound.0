Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D72633436E
	for <linux-sound@vger.kernel.org>; Wed, 20 Aug 2025 16:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755707872; cv=fail; b=APweZZVhibfeAiJGEkGFG+yQtuF3Yl180LeT8O8nDYZB7dthsqHyzUwdutbkFx5GtscVXcFnUB50NHJxiDlsT5hl61U8U7lu8ljHd8DBDaXcbixy29XOmuRwHyRzv1VexlvvsyGeeg99iCfPrLhEKqIjynXyp/mIwNvMBvc/Nuk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755707872; c=relaxed/simple;
	bh=scGtWIL+d1FvmsWePEFrolC3EE7oqPpci9eYlaMCVsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ba1GU+/42IGr/YMgoL1BhpSDXPob5xIv1vdmj3iQKnbMK3VUE9u5L1RtbArPgZilKOjS5cBGlbR/NQrZ50+sWo4nenI0mAFGLN8vg6U/jxHL3iEq7Iprl25atgqNWtVR1jQJoDtOXsclS0MV5jnyub69u5ad41JH5PUyAt0Mo5w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=p5Zhw7VB; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=r/vuUZss; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="p5Zhw7VB";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="r/vuUZss"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57KEUKgh369229;
	Wed, 20 Aug 2025 11:37:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=V/zXXaqfrqWYLv7L
	bF6Vv8nVJZP3e0T8TGHvWKSdkBs=; b=p5Zhw7VBONZYrq5mYy0EXgXAOwxN9UoK
	UhFusm6rOtSLzbCYgcT/E+mpjEfxwjWt/PI9hLJ3f0Y5UGidj/JFd5hj8EWQvH6J
	WysZoQ7l5UYty3izlL+ZmBE5mGaishINYI6wxoi+TjZiXBPKZkoozHkN1xRou/6l
	d1ATuwFKb5A81rjtOM5G/jH378cVLbGupzLeS2wo0zC8Ig6D8WlEHF3PtCfDsUBV
	eiEh0G344PE9zbSSp8ksbKWRLuusLON3rmZTofJTOvYPQaPw1V384gdSvJ1livN+
	3Er0tCbJ8tvu6zeJvt3PY/yOXKkpwJ+QPDoklGDabcB2dhDeXiSIjg==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2090.outbound.protection.outlook.com [40.107.237.90])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 48myd99j2a-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 11:37:27 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YCkdUWLLo5ePZGfj/HklJar4fKHK2QmpwNGrSH6q8SLRyKdvYkR6JKhsWOspPyCXE9sWt3ksSWwp9ANWW3Y69W7GIvnEn8r/Bu/vZIHVZjNVnDUFg+jAYuRSPVnno5j+0Qkl4Q2aVVmb1jBJtnPCPEz3AU6zzTFv87Ob2hwlC5JKF168CuXyZjv2r6URJ+9V3c4azha982Wasv+WTScaKJmHip2HtCQtaPQfWVuGzaFo6HymbcipsaUnzt7e7Sexg95aKJw/CHX/bY8dy3KbxMt9UhlBlw+e/wUNyToTK1nhVSqrOHaSTLklLXfRpz5jsrv7NRqjTMKbTfC3R4x7tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V/zXXaqfrqWYLv7LbF6Vv8nVJZP3e0T8TGHvWKSdkBs=;
 b=ZXuX9H4R62UK3o4vhlP4aL810g9cD1bxRMDxlCMXTCpQhwZzNmKCeRhomTPHIvsvgQYwsz6TWvRE+wKNuQUtZf7hJD1M0Zvzem2yGMlA31mGjn0Jm1LtogJYfdl4w8LTqTNc8Hu/FOxXdASiaS2NNzPn5u+t3mD29JPRLxKOhoxUdx2hWveRXdJ2jFjAGTK+W7G1Z3K+IONt1g+bZpx/CYqaT2B0PJnLQjGXxiYX3TYicylNm+q9xr8QvgmqiaT9Nvi4C/Q3X/2XDHwe7tE8n68RLnqMHBzM0vxAqMOdj3xQ2sUsQoeZUYWZyVoftXJN+5PhuK4utHyoQovoIpTueg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V/zXXaqfrqWYLv7LbF6Vv8nVJZP3e0T8TGHvWKSdkBs=;
 b=r/vuUZssHKh0AXQeGtd/CJpa2aPDg2If3C7GPr9Fypr0GKSBlctv6cKdqROBxczc0uu8Fua597REmgJkSchQgsPp5kcc8N4FL9B6fkpSaDpg6h6c7F+VQdFAfnfhNKCwX7GCHI5D3y16LszqrnPKmgOB9q2fyQUNLmOIIAe+eDM=
Received: from CY8P220CA0010.NAMP220.PROD.OUTLOOK.COM (2603:10b6:930:46::22)
 by IA0PPF17D0A1D4A.namprd19.prod.outlook.com (2603:10b6:20f:fc04::c8c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Wed, 20 Aug
 2025 16:37:23 +0000
Received: from CY4PEPF0000EE35.namprd05.prod.outlook.com
 (2603:10b6:930:46:cafe::15) by CY8P220CA0010.outlook.office365.com
 (2603:10b6:930:46::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.14 via Frontend Transport; Wed,
 20 Aug 2025 16:37:23 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000EE35.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.8
 via Frontend Transport; Wed, 20 Aug 2025 16:37:22 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 57137406547;
	Wed, 20 Aug 2025 16:37:21 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 3B778820249;
	Wed, 20 Aug 2025 16:37:21 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 0/3] More minor SDCA bug fixes
Date: Wed, 20 Aug 2025 17:37:14 +0100
Message-ID: <20250820163717.1095846-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE35:EE_|IA0PPF17D0A1D4A:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 98bf3e39-f1bc-4026-046a-08dde007d6c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|61400799027|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7ijGq1GjFaOOYly8UkWhdMzjhn59T96uEh87wy3f9unqLWn7yHqGvbEEe99Y?=
 =?us-ascii?Q?73RskAF/c/nsF6hUEi/O/o9FSAuK/5Golssc0pf78tp+3ECI7OCQM9hLrrut?=
 =?us-ascii?Q?DXIfb4Kn3rMuXufkgluXju9uI/SEcfpd7wqVMwktnJ4Va4srfCDIf/YRT/Ya?=
 =?us-ascii?Q?Gg9GAJE299Lz2B7Hq4vWPyaxwXUFEx0JGsLbufHTPOm4D46hg/3PIFDPJCR5?=
 =?us-ascii?Q?B2thsyhBwNOrpkm3q17h33VGG1/MDux6q0zmmTSPnQsYDsskCdzPUpI0VjIe?=
 =?us-ascii?Q?yqSwYxW7786sI/6hifnx1HYWwREiZJ5VVfHHI5P5gXalam5veFSihc52sxUp?=
 =?us-ascii?Q?xEWJkFjsizhloVskkU9OgRPg89oLr90vQbwxycixXPKz1dJ6yX8r8fON7c7h?=
 =?us-ascii?Q?NexsTQLl9qsKhZ6PQraex7WHymzwYF30axijy2zq2jwWUuUu4l00Giqne2X/?=
 =?us-ascii?Q?/4ybE8RwHY30jXYDNNNg+X1h8tbPNc4XfKQtwBTdJMaU9AAkIswJl/opGkEE?=
 =?us-ascii?Q?/E+P6yLz4tqkTiMMAdwyodR9AjGF1XsmpEO9n5tzKEvJLZhQhpuKymJ21/uL?=
 =?us-ascii?Q?rY0rCqMWbHd9WlmCOTiS9ySFkzneHQUsmPhMrlmDCySOgUNZc4A38ndg2Z+v?=
 =?us-ascii?Q?WPHacfwQPa3FFRxmWDsajF/g3PWf0S5yFlO8JxY2zthPLQZzetMX2G34Ux7N?=
 =?us-ascii?Q?SRWBPFCyYbXC2ot4+yBB9Sc0D99Dr9Y3QEeJJYi3FpEKZq1GOiJEyV8bIxtM?=
 =?us-ascii?Q?xU3j2cd9Yj0EYYerQcDcZIikjksMGSsXd9HvnkZWlHtAGxfHH+oxPjbam75O?=
 =?us-ascii?Q?D7KObetEPXiDM42d1qZjW2Hl7xvtKSdsFE5yC1KCLiFgPMF1AyLxkyLkFO0O?=
 =?us-ascii?Q?UDjgkSiLJ6i9Qn8CcH1/aDXQykI4Cfi73/fJptkXz6fTaMOLD0/fIOqNamFE?=
 =?us-ascii?Q?7s8C22xZN28yyI+dFAk8LvvIJP2E7Q1P96gobZIEQMQj3Av0XtP9qBqjlA0R?=
 =?us-ascii?Q?9Z9ZCJiFNrNAUPb4V0S2HfI/NI2U4AB4tclP9itmLtu76QwFsHjgpAzmF8Vt?=
 =?us-ascii?Q?DROBZjr4fZggkBfJs1EEN8JjtQXoeDiIygt1HA0we8toAizY5Z6SsuYajoOQ?=
 =?us-ascii?Q?w4Ui0LT15phbft5Hx/QUl6NFyrtlzN13gRN5eFNwL+8e+Xtyo5QNXZQxWcSP?=
 =?us-ascii?Q?ns0u0rBzvDNhksJ0znaeHanF6h3RbMlVEXIqNKWPsCsTQsOrqTLxq0D2Q7Ek?=
 =?us-ascii?Q?LiTmXiRjh/dCuCazHLJ+iZKivcvU8qgLdf2J5XCzuvIdxYIHaLrPfDUo7Umr?=
 =?us-ascii?Q?Csez25ejyxpwH3mkMN9Eg9yqq0GSXnHoEojurEkyrCw2/gCSDv1pLchSxFTy?=
 =?us-ascii?Q?iwpSXDEw5gY5lrqfV83Kol1MomN0LZBhgpzGcvWgJZiuiMSf4/zsaA8Sm5ik?=
 =?us-ascii?Q?8lLlqd111+gf2LBsbajS1Oc+3lC6AZxxikRrU4jC/doCao9aDkCrLUFUNtmZ?=
 =?us-ascii?Q?LD2axOSrr07SQVVl7I+WcYlJRnuPI1Cwhcm6?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(61400799027)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 16:37:22.5875
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98bf3e39-f1bc-4026-046a-08dde007d6c1
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE35.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF17D0A1D4A
X-Proofpoint-ORIG-GUID: KExe-H3MqsCqdsJkWVLu95dHARsmcKrC
X-Proofpoint-GUID: KExe-H3MqsCqdsJkWVLu95dHARsmcKrC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDE0NyBTYWx0ZWRfXxaeiH95I4r5h
 YuEmMM9uBiAm9dEc085tf3PYvD4fU8Zkk4+qIWGUOcmBQZN1QWiCmzDJkmCAeoWjzhHiLDq4hLx
 XKdvmb1XrErOM4WLk733LMG4LoCrl/kWMKsVnxwC+uH+Ict7CDWA+63mI5oeJQQr9+lCtAtBMID
 gBj81I4pIyZ9yZ2kSK2AawF858DQTz1LVX53PRMsMX442d+UifQpcbCkmNcM4v449uGaECLK0WF
 rc5EYvSt/UhXLd1UC9tSQLnt+d9C77bGatJCFEADjip/jChSk64tR4LcDORkMpmToJUTSoQkX8U
 tEaeVZNuSWbJxPXBZuxHyDBmAU9pWlJPhkWDXhfTxVlSduFRi8Kbpqf2lTewZyXV6/KVzhVUsS1
 qE5UdX4+ng+zgFKAqzAjhwNdZ1/leg==
X-Authority-Analysis: v=2.4 cv=WIwmnnsR c=1 sm=1 tr=0 ts=68a5f9c7 cx=c_pps
 a=pMCGC4KjKGb1SibViVzv/A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=2OwXVqhp2XgA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=9nngPayWny9Uffy4FAkA:9 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Reason: safe

Just some minor SDCA bug fixes and some minor structure reordering to
improve the padding.

Thanks,
Charles

Charles Keepax (3):
  ASoC: SDCA: Fix return value in sdca_regmap_mbq_size()
  ASoC: SDCA: Fix return value in detected_mode_handler()
  ASoC: SDCA: Reorder members of hide struct to remove holes

 include/sound/sdca_function.h    | 21 ++++++++++++---------
 sound/soc/sdca/sdca_interrupts.c |  2 +-
 sound/soc/sdca/sdca_regmap.c     |  2 +-
 3 files changed, 14 insertions(+), 11 deletions(-)

-- 
2.47.2

