Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820F31A23AF
	for <linux-sound@vger.kernel.org>; Mon,  9 Jun 2025 12:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749472813; cv=fail; b=sxZOfbnIlikAXsRazLCn7KcC9nRZ/IJUnqhMsiCFpaYlMVB1G7LuvmZmOCeSuBYCrSumfCJyhkAjA5D87TzT22SXV5Vrqj8KbUUeiGuXucWjrofwHH0hZXp4RPO8NJkF2xz+IjyjrnG8Q7ZAPHUsRlOukpZYFVL7ohuwwkXXKNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749472813; c=relaxed/simple;
	bh=6InxOeyHkXQb59yEFWSP1suCnT/Lf43/8fagFx0HB2Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D2aMqMYI209D4hqzFE4G9vT3WuXgJGu7mZK+FldFSZVEPuUXlPNdZX+oHegrnIfiJ7kynYvuUoEAze32R0O/1e7x0s86OIL92SRPQo0PDAk3LvfqggFbR56WlOtk4q3/hum1jjPWSUpqU94625p54ZU1GBeC7wdPI3M0/Z4B2yA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=QwJpGom9; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=hYL/zNua; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="QwJpGom9";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="hYL/zNua"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559BiJuZ024626;
	Mon, 9 Jun 2025 07:39:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=0hpAfxW2yxq9FbUPxkuzn8Exg79x15bwR5j7oOhFKkA=; b=
	QwJpGom9uotc8KE2E8CrUYJlI458TlpprqfTjCbk5V6nth96S53dzzHzgvvXQgxR
	giXJ+e4l2YbwhHboxLyyugj+mkUpScOo900W8tMmkuWiOW1ELcOH2vVoqexl75QG
	Ex5SO0FOQSscgKRll7J/OvBwl1TCjdWvYBRsY6EvEsiLespUOXodii3+wpo69uxo
	Ti7/osP4zLha89Yl1RJRvUgmTfY6Ek5qugOKXw3MpIrUMpdw+sIdwRIzl4lOLbPM
	HIB/kKK2pazNNjvIXSVk5+YQE3pkSXgQwYcIBpr1Fz6WqEsDlis2CmUW377cNOSA
	oqR0FSf2TAk1XKku9bG8iA==
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02hn2208.outbound.protection.outlook.com [52.100.159.208])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 474yktheqx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Jun 2025 07:39:49 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NEROefpsfJ63fpIlNfcXq2ypRe7MNSsycgquz8JIswF0lhXAqVPHVDkQ6PLUckp+QZ5hFJXxHpCO30N+8ands/RFJ/O7hwEUy08WdD8XzFZrUhAgh0H2yhOoA/zH5+tbd24xMYu1G2Y6A1Rj+6Ty1+Oe0gEM2ysHEEX5v3kJDC9pZsrC9HQ03SsqpFk/15vimagQeHHqMdjyPgz0zGK7SqKF3tsHEp5FJc6LnX3coQdfPKHXm7FWFyWcYL+k8jVbFNAMJ8cVrN/RF1v4rL7jNGSE2MmA9AwzEPC7kwajlDrChr9E99cx1DzbxnAztjoVQvp8BSbRKV4wMsuoEWQf+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0hpAfxW2yxq9FbUPxkuzn8Exg79x15bwR5j7oOhFKkA=;
 b=lRFMYn+SgraIcDheRqHKbx3LLQtducLKMc6fLmnCLDGc0YHUcFvO84Ze1sGbSkP6dp5WrfneinwbxKSOSZfeSaXjlKKMvCR81nTzmH8c2FSEt3ITBtpVaPJ1fGWNmPo1NY+Pzhi5J2Rrks77K1dl/OfSC8tszuE8raXFrzuBd1r8U+WndQ9DtwQew+jmZmSmdcYcCeo1JJ79uWOKrcdL5rFryO0w6YanD7ZE4xilby6nkk/k5Sc4fdQLw4JEjDRXKGV5iew0MqjAzmqb7n2vrf7sxtvnknvfNj9gwJHVV+7LYwwjj1rVWxTDzji9Z+92hsvj9IAIGOa1q/rZJaTbAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0hpAfxW2yxq9FbUPxkuzn8Exg79x15bwR5j7oOhFKkA=;
 b=hYL/zNua+PPazIxqFt3wcGNEF4c6Ga5z9wJ2O3kp82qJ+y9mtDwO2oBaWq4HaVELty8Lwuxwiv8Syvx2s0384ZowZML3sg91q+TwFxxYdvBxKJmvLiGhEBpUBP7ldXW+vGOiJMwO78PrgKucG3K/syvHFKIjV3mAEQ1X7BvJNnw=
Received: from BN9PR03CA0378.namprd03.prod.outlook.com (2603:10b6:408:f7::23)
 by CH2PR19MB3783.namprd19.prod.outlook.com (2603:10b6:610:9e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.16; Mon, 9 Jun
 2025 12:39:43 +0000
Received: from BL6PEPF0001AB55.namprd02.prod.outlook.com
 (2603:10b6:408:f7:cafe::30) by BN9PR03CA0378.outlook.office365.com
 (2603:10b6:408:f7::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.27 via Frontend Transport; Mon,
 9 Jun 2025 12:39:43 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF0001AB55.mail.protection.outlook.com (10.167.241.7) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Mon, 9 Jun 2025 12:39:42 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 94C72406542;
	Mon,  9 Jun 2025 12:39:41 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 69E98820258;
	Mon,  9 Jun 2025 12:39:41 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com
Subject: [PATCH 1/7] MAINTAINERS: Add SDCA maintainers entry
Date: Mon,  9 Jun 2025 13:39:30 +0100
Message-Id: <20250609123936.292827-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250609123936.292827-1-ckeepax@opensource.cirrus.com>
References: <20250609123936.292827-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB55:EE_|CH2PR19MB3783:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f9d52cbc-b6aa-496e-fd16-08dda752b56d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|34020700016|376014|61400799027|12100799063;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jl81Dmg3GKzCJIGGbH3oRZz//gE3Rr0QZxlchF16G/i0uZkkfHZLYRTxZydC?=
 =?us-ascii?Q?15+Bn5hIPo2YhzLUR4j4UOlsBHw2S+SkbhGEtyYCSKDMzC363SoTHM4C5xvr?=
 =?us-ascii?Q?8NrNI/F6giUGbf3uOsxvWoCiXX1HQHtWxDny7YqW8Pq9FVHnVjgTFCMYaq9E?=
 =?us-ascii?Q?Ena/a/KuDQW4Cy1CBa8P4rLccNSspiu6zzHZQcabHPYL8KJ1nTxoyhOdRNub?=
 =?us-ascii?Q?sQjhXPHX9kvRhJoym+h+5JNM1eu1KOkfSCT4OjaAWYh6YITBqvOytpXMR4EU?=
 =?us-ascii?Q?gsdXQWlupGepBwizSF2Ea9FCPUNWrpK/wRcPLdFljBowOZ3A5r96YXtV3W2o?=
 =?us-ascii?Q?0Veqsl2ccWjhxOJZtwYhgYirT5Wt3BzCNSLKxCrS2/waCYEb3GJUhE1p20o1?=
 =?us-ascii?Q?hNFhU1y7r325WoWQto/n2cJsRwjrZFQ4Tp0Uugnh33BFPcgRi3hIVxiRYRuD?=
 =?us-ascii?Q?H9zEkRAtG8dxz+4NBLapTY5leV+DKQw6IPClrSi9IoBI/0n82QXxhjmUVWHp?=
 =?us-ascii?Q?xYDK+RAO3Fq07QfS39lcaG6qLxqDltEJ6bYTVp9dvszw1Fn210d4d4+QJMdR?=
 =?us-ascii?Q?21/Y4oJZlD1xHwk3E16gA/eUe7tgvGzV+U1Ohak5TUsiXl4VWF01zw3Q5ZCx?=
 =?us-ascii?Q?LuTnsHccvowNh/ISUcd0dlyxHnmxkVW1Ipi9CLNP2k07Ibv1/itVRmBPwlL3?=
 =?us-ascii?Q?pX17/XDdfQ4gHVKvu9l6KBC4cqUNAWQUkVC1XCsM0sEFjE7lVA6nfpnrXQOx?=
 =?us-ascii?Q?uW9DE1pOPxn0oiiGcvA1BJFLooQIWoDTKkp5+ilg7krTe0er/iDb/IpOfm9q?=
 =?us-ascii?Q?AAPsfjXuRb0g/rIBKG9MLkh1UI+07Y9/dSolNc7xdSdIzdJejSyGNiyIuIKg?=
 =?us-ascii?Q?/bstEnm3mz/DIY7hi2oapYsqC4jM+1M+bsSJSAwA6OprlZ1tsKJrqj5vqjNT?=
 =?us-ascii?Q?nlT1uX+VjazpBNBLMhFl4XNxVKN3B2C2T948fBWryYFp7BQwmqHJxCvllWHF?=
 =?us-ascii?Q?gkjPOZEvhMA6wLxmfFHBfq7FDLWb0BHCqqSsS1O+Z5rxdt419tDNEy6pL1tQ?=
 =?us-ascii?Q?g3AVM8ULweD1bbSdWf4feHWNFNx0i72VukRfanJ+oiAbnrBd02WIIIPbHZWR?=
 =?us-ascii?Q?f9j65cp1jfjPP2MDrIEDmDxqaNSIyG0+fpL4nX9zDM/pe4iu3XdevReMXMHH?=
 =?us-ascii?Q?zL8VEbyIZ46sug8UOBnqThuAFsnaOuFvxrh5hQ45pRpF80cJZRBwhcnA2My3?=
 =?us-ascii?Q?vDtdqAMOZNA0yIzw3CcSb2clchgVIvcL4l6XDyx/gV9EaKamzmLNl5jPC1xs?=
 =?us-ascii?Q?TJRcaRGZdNPqCmuqcOBRrUTYYB/iYWlQeMQ/+oCzv9uKBrjJUy3ukcbHrnpM?=
 =?us-ascii?Q?qgRYiSaD4TWzIa1mkHAsoBBRJpdxckfwk6jeS2ydVCZLByqCrWunh7q6QNHE?=
 =?us-ascii?Q?E5QsJKV606DErv4suK8ZcKQWYqCrJFfQCDNIbiGfqTJFXOXbgeuSS+OJnGNf?=
 =?us-ascii?Q?8Zd8ixaRudyI7gJ96CfZ0v2ZSSRk4hYj66Hi?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(34020700016)(376014)(61400799027)(12100799063);DIR:OUT;SFP:1501;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 12:39:42.7430
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9d52cbc-b6aa-496e-fd16-08dda752b56d
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB55.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR19MB3783
X-Proofpoint-ORIG-GUID: XAVNt4NpENXcKyg2bXAyCdwvCMf6E1m-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5NCBTYWx0ZWRfXyQobWECJ490y su537rg+WNWuxXgcjrdFXDOLis0uogcRWrFgdhAWE8KNRqlSCZFcKGDO/FB1GlLTLwOTQxkZQQ1 incjKZNwK2NLR2zDV/9X6OE4bdqCQkGX13Rwa94jbTj3eKCWQYpZMo3+Bh6PZGCnpWKmZqKRA9f
 cvcKy2EuINW7V+UCSz9HcwSFHUW7FoY3GrCnDJFnEyaXyAXkyHxDfoXjn1Kr8K5ysG4um5ROPJx Lt5JsVcxL2YwlEw4add6qjP85ndfNXvNuOdrdfikjQnCaABYgdwjKAvf5ExlG7CYvFoFYVyFbZv EDbKrwCd4nkEG07Io03pMMtq7PwOMEkxWZqgoD22xv3vh1W2ls9Oh6hqgfU7+WFsw7czMQCX5yR
 ADO4qvZdjFgA1miorB32cxWs23rhoQRKrQXoghC+u5LW3gtIQKie59ksJQvX5XsqTvnvyUbh
X-Proofpoint-GUID: XAVNt4NpENXcKyg2bXAyCdwvCMf6E1m-
X-Authority-Analysis: v=2.4 cv=TobmhCXh c=1 sm=1 tr=0 ts=6846d615 cx=c_pps a=3s97W6ozrBsz/7DJStkqmQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=6IFa9wvqVegA:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8 a=FP58Ms26AAAA:8 a=FFzfcNnoCV0qY3unxoYA:9 a=0lgtpPvCYYIA:10 a=jZz-an6Pvt0H8_Yc_ROU:22
X-Proofpoint-Spam-Reason: safe

Add a maintainers entry for the new SDCA support code.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c95f48f6635ad..50eb8b3cb2682 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21890,6 +21890,17 @@ M:	Jim Cromie <jim.cromie@gmail.com>
 S:	Maintained
 F:	drivers/clocksource/scx200_hrt.c
 
+SDCA LIBRARY AND CLASS DRIVER
+M:	Charles Keepax <ckeepax@opensource.cirrus.com>
+M:	Maciej Strozek <mstrozek@opensource.cirrus.com>
+R:	Bard Liao <yung-chuan.liao@linux.intel.com>
+R:	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
+L:	linux-sound@vger.kernel.org
+L:	patches@opensource.cirrus.com
+S:	Maintained
+F:	include/sound/sdca*
+F:	sound/soc/sdca/*
+
 SDRICOH_CS MMC/SD HOST CONTROLLER INTERFACE DRIVER
 M:	Sascha Sommer <saschasommer@freenet.de>
 L:	sdricohcs-devel@lists.sourceforge.net (subscribers-only)
-- 
2.39.5

