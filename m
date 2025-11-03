Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18E53148BE
	for <linux-sound@vger.kernel.org>; Mon,  3 Nov 2025 15:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762182523; cv=fail; b=FoEimZbTSSpE6+JQdHh8LhVCeafS6WZS8JEbi1jm+lrCnm7f9m9NX1bkLmoyOUPKD+0AHOuY4pJ1stMhuE75gG0WrRgMQCyq3mR+VfWRypNMHxe4e9Bv37RCytOfByOKg1SrP/PImwDAJth34DI7IS9P8z333tEF7CjNR73dJIk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762182523; c=relaxed/simple;
	bh=CgXF6rBNGjlXzfH3cpfVJTLWklmTsnVBPi+hP3ff0Bo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IvHKoZ3vtxszWPF1bwbYcocxBfAbx545beMwqqdnehRrqF2kyC1xbwWuKh0bk9XjZfCQ/Fx4ZnEkaJrBnZiuuuR49+CqclNZNi4geLgA+aluEVshO6hleDKtoyxxA0zmbGAHa/s1E1adwR3jeRLbf4RjVHOjBfOHObwUSBwnWjk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=OpfPTqz5; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=bMZSWON/; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="OpfPTqz5";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="bMZSWON/"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A35toUi2534298;
	Mon, 3 Nov 2025 09:08:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=K5nrcyCU32omjfMr
	W2+pScJTq/6jU22VFWdeNAbnL8s=; b=OpfPTqz5KoXFoWW+4SedlQkA/ToCJWwp
	0X0b98Sv5wO89v3XGBoEfWekluT0OroRQXZq8OeFMVdarJGyh4nEE05DIU7Lw5VK
	LuvfXTTk0AsJoJyURi4rQx9Jw6aTNtlKjVFZR/JDS+8OOXTeDVv3dk58zeiwhZFE
	vtLMbqe2RZF4bNYV6NNh58njGWJ/g1g7lg/tIX2YGq0BQY+2CsWBCA0oon+dGkeq
	wEYM4peWyityHtr3dcr5UNneMROvgnmFS0aqEjw7eFqxkpVBkHMeu3/Cema+2e+V
	zALnSGeh7wxKl6TsGtTMlPpMFHhlVY1y34T7XyjDjiKn8bPp9s3+oA==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020141.outbound.protection.outlook.com [52.101.201.141])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4a5fkwt69h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 03 Nov 2025 09:08:20 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vgOe2DVdQ5zWm1zL6idy5iIDlC4VGlEc1VkOemuqEdyAV6K97Z6YVucQOwJVrcm07N03yPE3nBZp5yOR/loa4TohX3KMpkn2Mo9CnvkR4VwNcbzaGdBYko0+0Dx1rKwMYfk3m5BC2y6AiJoVmzrQUZWnlUU9Aq/zol7fMqPypB5y0VkJwUMNPxSkUv/0gn36+outcmdFY4vocKfcLJSyBs2kDVYvMrWBJMSJHz7VXLG/Y7HeMVIRDsg6BQ2vn3lKgyhSdc5M3L9niQ0yfyVMJrJ2fmuI0+BPyXfNi2pkFGTB0F8AZ90ipOanX2ZUqGCJjVT5yBOXyYYvDpnC53DfWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K5nrcyCU32omjfMrW2+pScJTq/6jU22VFWdeNAbnL8s=;
 b=Of2xhsQt2NB3sFfExbnEiL+ABAwD3OBdFQ9QVFlxpgdCH7LjtcUAMFMhPr924edDJeF5sOVZ9fqX3/T7tjbI/C7pap2NfUrBEn3W7/msqRPzEMXHONjvHGFe/7hOCk7wFJE7i7BO+pgSKxQ9hpj6ZASaWQ0LN9TxDVZksgnODbxrKbrqls05AK39wqUZlO4DG2OZpnhYj0CbievvLk5jddh7k5eZoRsDIjOAIyMwLc6bmWAUNtiSUTqyf/tJ3j2zRQ/GeVjHWwHGa/eBv595X2fmVNAaFMUySca/5j7l+nfI1KbP5Xp8MRbUprC5e+lcX9kicqSHJqDw4HWOn/2Ojg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K5nrcyCU32omjfMrW2+pScJTq/6jU22VFWdeNAbnL8s=;
 b=bMZSWON/4Ti2SOU2sAWRtyXKKj6E2qM2nWK5YRsp11+vyx4ZDTSvzNFpzuyD2ozowpFzkXKBqQqtNmL2bSIjyHsO3dyjC0J3AR4OiH6aTNyZzY2ZqbYqSg/hvOF3ap2IZm9NC0GV+7Rn0qHD9yU+Ere0ymDvAFtn/qkQM/om9XI=
Received: from PH8PR07CA0023.namprd07.prod.outlook.com (2603:10b6:510:2cd::11)
 by SA0PR19MB4443.namprd19.prod.outlook.com (2603:10b6:806:c3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 15:08:19 +0000
Received: from CY4PEPF0000EE3E.namprd03.prod.outlook.com
 (2603:10b6:510:2cd:cafe::e) by PH8PR07CA0023.outlook.office365.com
 (2603:10b6:510:2cd::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Mon,
 3 Nov 2025 15:08:21 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000EE3E.mail.protection.outlook.com (10.167.242.16) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.6
 via Frontend Transport; Mon, 3 Nov 2025 15:08:18 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 1DF0E406545;
	Mon,  3 Nov 2025 15:08:16 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 72EBE820257;
	Mon,  3 Nov 2025 15:08:12 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 00/13] Add SDCA class driver
Date: Mon,  3 Nov 2025 15:07:55 +0000
Message-ID: <20251103150808.4015208-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3E:EE_|SA0PR19MB4443:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: fbed4f64-3f39-46c0-0597-08de1aead230
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|61400799027|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?k/q+aI5lkMFofp1Y2gkXF5Izms99nLQF1c2h0O+x/C1FRRJi+NvUwNP1PbGL?=
 =?us-ascii?Q?ugk6yOxLD5ONFH86ctt9lQbi8Uatmb43Q+/nIgMQiWc/NNIS8qKWCar2jnih?=
 =?us-ascii?Q?J/AwDXL+uOfvsB5vDCfNk/1Tws/fcSWRH0mdhwgueCdRrPKGtFok4zzB9CEx?=
 =?us-ascii?Q?ZD5gQqv/QhAm1SmEyBMNFkP1lUGS/t/da5zqtxbzED2S1NMtyMWy6euXZvI3?=
 =?us-ascii?Q?3yr3/PrWrZKhZlDSMC1BWgjrTtRgCV2h4j/dahMwpvTE4Z6TR52AbkLCynSk?=
 =?us-ascii?Q?h9krXxN7aH+i0glSKKIwJHF1Uo9QJH8umlS90mWF3hNCr4BXCbVhtv/iqEqx?=
 =?us-ascii?Q?VYdJSHwvf2KkTSAmZrxg9lsCVEKSUYfFp5Jf6asE7u8nwYKY80I2wxrGfgH0?=
 =?us-ascii?Q?Lwk2N08iGcdN3g5FnbxDnVRxDFQ952bgjC/eSI5A1aerRMO16Dc2MPMkMUu8?=
 =?us-ascii?Q?I/IQjHUGuiGCmXWA81P9MGFytG2ULhdp55A0i96GgmT3cqlkcVJmngNKSWOF?=
 =?us-ascii?Q?q1B1EiAeOYDw+myp+VRAx2XxmFJoiKU9k4nvF24UlzLFNTd6O+0iUMgaruDW?=
 =?us-ascii?Q?CawUT3NCoLxlOCD7PJ5/MkF8D1242sunYcOFVoJ9oqNPUdiQO39zHaug0qt7?=
 =?us-ascii?Q?xkeplxBp7Gn0W/4+q36LB2MYr5HBBt/qtOFjyIywCX//MDIjfPuiV3x45I42?=
 =?us-ascii?Q?KT2QIsUdkj4k2D+DF1DdJqUBQibE39Q11NuOMyCQIh+R+UKV21Bl37+jj3or?=
 =?us-ascii?Q?9NPkT6frMVrkRdZ4QYDUDrq9pxrK55MmAz9RYxesXNFjfiw4HM/bZqYB0xgT?=
 =?us-ascii?Q?5NE3g8idFAz53g1lXxJNzM7tzCMNIk3I4BQniHzR1VB0ovsJHfFkd51zCgUM?=
 =?us-ascii?Q?V9UY8AxoOP3S4mYQJ5sjypjREvTwcpBdDQgOug8E2itkt0rpU5/yLXlKkFrg?=
 =?us-ascii?Q?pDYC/gVF12trhqI1dGx45GtSxckG0uBWhpsWLHmNxiZB1FYs7YY/E2HZZNeI?=
 =?us-ascii?Q?jBP/3ZETl3ETXsoWqsoMjM/7H0Sj9THMb7F0MeSaB2E/wBdPRk8g52y1fi7P?=
 =?us-ascii?Q?OvC/f2XBUxpnH0pMkVEAmxWcofTam+Vi/Lx5RzxO10Jj8AVql30z+li3s9ut?=
 =?us-ascii?Q?+piQ4REGrO789H5D+PNoEZ424AyxFGDhPoxaOcgW3MPpcGJ2vtumnLYI3s1T?=
 =?us-ascii?Q?sdeq3Kzm4Q0TSCIDNLWRZziF4f1/+mD7OnTwE+Lk57KavNfTVdcxT1EQWU52?=
 =?us-ascii?Q?ClogiU6pUnMWBnbwyPnEsrC0huAVn+7Xl7WunPiAxlipL4fbVv1YW0hw+0KO?=
 =?us-ascii?Q?RQpTMzY29C/eDopmMeZPrgVyDsLWt0XexUQXWXC1P5xgSGav6NraD0j9IsAB?=
 =?us-ascii?Q?ag1A/Yr0+u3s7h6gZZVJgRWfwWJKKij7RS7GTI7VmMG9JpW2IovoD98H+bF9?=
 =?us-ascii?Q?SvM8KjQPEuRKhV5pseG3nnzIyZ8D/3cmWZGe5dV9GYlzy8Jjd8GO6j3AWA5Q?=
 =?us-ascii?Q?77lLnG5J6+U8Q0y+jhlEHvoZ6+dSgpp9prliG8hgeKFw3mWXESWnsOwtdOP9?=
 =?us-ascii?Q?io0EacoyCuXZG0tfvQM=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 15:08:18.1251
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fbed4f64-3f39-46c0-0597-08de1aead230
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000EE3E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR19MB4443
X-Authority-Analysis: v=2.4 cv=donWylg4 c=1 sm=1 tr=0 ts=6908c564 cx=c_pps
 a=QyNrOpZ8ttbodQqJgga0rw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=hapR6Ux-F4-DubKi_fIA:9 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: rZowB-3wmavbqA5-IIrvX6xrCwfDBaUG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDEzNyBTYWx0ZWRfX+WWb2qmMGjNj
 CrhMdNs2s1DziEqlAZ0Vh3DSrjzTRkVVsxuuhrEnTfv5d9DZfGEtaYu5qlP6tXburAGHlRrHdao
 xDq4ERDtc6J+5aMiW2uRvgo6mMi2JTp1uuZq/QrNwHONu0aUvbKqfbSDZDyzVm1t0dE98hgcRMz
 Mk+0y+CW6ge/EIRTNjpdSCUisfIEU6gHPHr8X/CjiBiBtLAgS1GXIv/9x6mWijKtKLgR55e3zJl
 rtdOMsfkdQNyq9aw7FhnqLOjUro6JcnxUj5XCaTCNxC+iwiVkgnBVbcYQjhKcKte98pn/lgSeLX
 Afbm9M83wXFMUx1NUSLNQv+KxIhr+tc7P6V7T9ty8BUde7fLT0NCOChVcFrmevslAB+qzZU4i8T
 p3a8zzC08rCdbWIfcz8QoTtPabR5Aw==
X-Proofpoint-GUID: rZowB-3wmavbqA5-IIrvX6xrCwfDBaUG
X-Proofpoint-Spam-Reason: safe

This series adds an initial SDCA class driver, this consists of a
primary driver attached to the SoundWire device, and auxiliary drivers
representing each of the functions of the SDCA device. These drivers all
use the APIs added over the past series's to provide the class
functionality, as such these final drivers themselves are quite thin.

Also a few fix ups at the start of the series that have gathered up
whilst the last SDCA series was in review.

Thanks,
Charles

Changes since v2:
 - Add a bunch of bug fix patches
 - Change some prints to dbgs
 - Add some additional comments
 - Flip order on regcache operations in resume

Charles Keepax (12):
  ASoC: SDCA: Remove duplicated module macros
  ASoC: SDCA: Fix missing dash in HIDE DisCo property
  ASoC: SDCA: Add missing forward declaration in header
  ASoC: SDCA: Correct FDL locking with scoped_guard
  ASoC: SDCA: Add comment for function reset polling
  ASoC: SDCA: Move most of the messages from info to debug
  ASoC: SDCA: Use helper macros for control identification
  ASoC: SDCA: Factor out helper to process Control defaults
  ASoC: SDCA: Populate regmap cache for readable Controls
  ASoC: SDCA: Add helper to write initialization writes
  ASoC: SDCA: Add basic SDCA class driver
  ASoC: SDCA: Add basic SDCA function driver

Pierre-Louis Bossart (1):
  ASoC: SDCA: add function devices

 include/linux/soundwire/sdw_registers.h |   2 +
 include/sound/sdca.h                    |  14 +
 include/sound/sdca_regmap.h             |   2 +
 sound/soc/sdca/Kconfig                  |  18 +
 sound/soc/sdca/Makefile                 |  10 +-
 sound/soc/sdca/sdca_class.c             | 304 ++++++++++++++++
 sound/soc/sdca/sdca_class.h             |  37 ++
 sound/soc/sdca/sdca_class_function.c    | 460 ++++++++++++++++++++++++
 sound/soc/sdca/sdca_fdl.c               |  94 ++---
 sound/soc/sdca/sdca_function_device.c   | 117 ++++++
 sound/soc/sdca/sdca_function_device.h   |  15 +
 sound/soc/sdca/sdca_functions.c         |  52 ++-
 sound/soc/sdca/sdca_hid.c               |   3 -
 sound/soc/sdca/sdca_interrupts.c        |  39 +-
 sound/soc/sdca/sdca_regmap.c            |  89 +++--
 15 files changed, 1133 insertions(+), 123 deletions(-)
 create mode 100644 sound/soc/sdca/sdca_class.c
 create mode 100644 sound/soc/sdca/sdca_class.h
 create mode 100644 sound/soc/sdca/sdca_class_function.c
 create mode 100644 sound/soc/sdca/sdca_function_device.c
 create mode 100644 sound/soc/sdca/sdca_function_device.h

-- 
2.47.3

