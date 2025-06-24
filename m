Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F68228D8F8
	for <linux-sound@vger.kernel.org>; Tue, 24 Jun 2025 12:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750768162; cv=fail; b=QcmdwYANAoz24jQ1O+ifsO0beYjQWYHTOEvEE5zDKVKjF5iV25f0qGtU2yoaL8rmrBeS1W3B/gBdKLE5Mq7r2jXPhZN9Y5nTjjtQsEXn8gfvugqThykrQE/MKgmyXQjiFGR8OISGmJe0iTFPsLEXCNF6VLa+ocFOd/A92tdzYMc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750768162; c=relaxed/simple;
	bh=vK5VNpWaoW4yjnx6lN1nVmo6jD3fsV1pnO4pA+YDqbI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cXh1eARrEvFYrNf+AvvgE9eOk7YhgJreZ2aqv9UAYZbTNE2V/Ggge72RHeBfMHww6WzsEpLhLnt95n0/POpXDOFymmp7ahHO3+tagRWQaHa9PlJrQwd6gl417cWkYQOtOTckXlZP1Gdh5CfFjCmi/Y87Wu3PYzcW/mMQSI8h3bM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=cAyBo1Ws; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=JeRstolW; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="cAyBo1Ws";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="JeRstolW"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O7O1mM001319;
	Tue, 24 Jun 2025 07:28:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=ZE0wVhiOSYlfu54rDDnYooYpkCP+i76AClM7igblBJ4=; b=
	cAyBo1WsXV2iahmnW/RbywjOb4yjj6QvYEjT0JPvMPNBSxmaAUHQb0LEbolSEms9
	Zx9anqA5Wp+wCQ5uQEbRjAuY1k7gRk/cGx4heOyFI48CCh0P3UiPo+Qjp2TaR6SK
	nZHRGLdlvC/Q/ZMTtTRXzxOfzZ5yoznyoHfA4607kPtFmMGTwuRbQHGnDYa3ju7q
	IuXduEmwnviV5uga7Etb6HlIDRdidbx8uiejU/yxrgN8qqVXixauADVvKBaZ5G8j
	zsgtkPrsD8S6EVimeWzIuu/j+DGlG/pOCgIlGryLbz1GQtefDGpCvBHX++6RcKLP
	jpTyNJ60ZQRB6yc+h8dpOg==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2129.outbound.protection.outlook.com [40.107.93.129])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 47enk9jppg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jun 2025 07:28:56 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BHEWVSN4QSppiZzphnt5lcSJQRBhrV3TmGondWjXrpJoKzn3AKPnjhn0n9Eev0fzU3W3wmRSSXcX9qCi9oG4MTrb71bnhEcsTZmshEmi7ydjwhxU2CdAruEm+VGXX7kmA9GrcNDxqQiI9PSC8rMVGO27fV1zFSiM+yU9T7qLIxFHqaQY7+V2M+2fxd6USeheyfYbjM8Zl1YNuGWvg72S137hFGfbPc7csotr2Bi8LRYZtTV1T61quNaXeDJnQmpCHkfAS1NRXm5BOQiB39YdAO7h302q5G82eYlqH8lyvchzyjyRHByKzTWnWBhU/rctvMDQRQE7cWpF/V9sHUGP/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZE0wVhiOSYlfu54rDDnYooYpkCP+i76AClM7igblBJ4=;
 b=tWDpZxTMyHj0jDcf5Q7+u0VipzGxn8G1XRZGMl17JnItHcvwUFphPcAo5Gj3RU/9YQcLNA/yHhkODgiraorv22Wz6rybdHhwlvmempOOhDMESGo/tE3hhK1vfjnjAerCvy2buENngqjeTLkfczZBWPWf5bxWDkbwZCxuv1sPudqt5bKQIDZ5fi8OciXbxy/StZB9JY5RJuAhJXYi1B2sZiWyhCnmS/4VA0xli8rATVsB0HkAEZPQJ0esu+SMaoB8R5dFkVda5hM91omHAXpT1JbrIplFUhxnxKVQi42uSiEik4omWQpffvViryAYOeThD71KTry2Vz5E522kXAEzkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZE0wVhiOSYlfu54rDDnYooYpkCP+i76AClM7igblBJ4=;
 b=JeRstolWQFZyviugCFh29MoBrL1VYLTGb3++oz0rtX80Pt4UPLGMGbefSX1JX4CVwVoqh+n/33eeXziGfnxIJbaX7d5ujJkpROUTVcEDSe/01j1wKZ9EXto5hAqIP9HD8eQDqid/jvo/bp9f8kOdAA9/y6dv+oD8HxNFqS2uVsY=
Received: from BL1PR13CA0019.namprd13.prod.outlook.com (2603:10b6:208:256::24)
 by PH0PR19MB4873.namprd19.prod.outlook.com (2603:10b6:510:77::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Tue, 24 Jun
 2025 12:28:50 +0000
Received: from BL6PEPF0002256F.namprd02.prod.outlook.com
 (2603:10b6:208:256:cafe::e) by BL1PR13CA0019.outlook.office365.com
 (2603:10b6:208:256::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.16 via Frontend Transport; Tue,
 24 Jun 2025 12:28:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF0002256F.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Tue, 24 Jun 2025 12:28:49 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 9F732406553;
	Tue, 24 Jun 2025 12:28:48 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7EB3482025A;
	Tue, 24 Jun 2025 12:28:48 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org
Subject: [PATCH v3 3/7] ASoC: SDCA: Fixup some kernel doc errors
Date: Tue, 24 Jun 2025 13:28:40 +0100
Message-Id: <20250624122844.2761627-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250624122844.2761627-1-ckeepax@opensource.cirrus.com>
References: <20250624122844.2761627-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256F:EE_|PH0PR19MB4873:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c489ef5a-9633-4cba-1fef-08ddb31aac77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?za/tfO3C0LmllD23T/uBbqtGULYvZwwOMJXZrqpd9Llc6Og4iolPToAzXFWB?=
 =?us-ascii?Q?U6kODtmbHCRNJXIqaoaMD2KpEcHY6KbAkFil6e4L2KCj49HAwImIfplk6d0e?=
 =?us-ascii?Q?SHX4G464gWVwjLay43PJUxX7F8t3cd+zogAvnv/ZIQi3GN8SQBi87ekpdrWX?=
 =?us-ascii?Q?YHBrqevA4bt3+fmdevGcmJmJfd5zdpS5VV1i9FvEp+dTyY1kuB9WRJU+6adY?=
 =?us-ascii?Q?8bf+etpBB+B1QU57k4s7sPqYkd/GSA67asuQJNTnuIMEqHXCTR0qAJYpnReT?=
 =?us-ascii?Q?fxs4Qgb/eD4jes6QMicCRBPVMX2vgVUSjVd3NwBBkvn0oHpHGtWlpJbl9j/4?=
 =?us-ascii?Q?DW8p+jWxoT8j4gd91hHie4IjS5ZkpDexfaoCec8ODhNIEOE4loOHW4p9BSJC?=
 =?us-ascii?Q?so7NzaQPrUMi++yFC0SUTsW/JQEHD0bCvihWDutlPCr8vqbfehdy26LMJ9qs?=
 =?us-ascii?Q?KfYX1bgBYD24nMhNxAqZaqjEZUFp9g4byfndrNaYd07qZuGRmCYZgb/XKtSh?=
 =?us-ascii?Q?rmsz+31wbheBkd7aKqte7H1zGDgA5sypSF0vvxnINZ3BrXorJKLUUHseY5+3?=
 =?us-ascii?Q?EpcroZOgdSfEJsPuzFHdpz6UomItYHlBraQDTkoORFiAw1fKvXZ4cddg6Pdx?=
 =?us-ascii?Q?TMfffc9JMwVdEvJrZIWib6ylU3pHHSUWBoOumfWsBbV3KX5L20B+jdWbLrK9?=
 =?us-ascii?Q?LcNIAkb6ND3IRs85jWlXvtG1nLy5G62vu5gGdlFUtf6cg/j3XYHKYWbkgBCe?=
 =?us-ascii?Q?mFpHiLhh0zxE+m9adER9nmwrg5e3GNOVgPeyl9EYOhjz60t/cZg3aELvLzyf?=
 =?us-ascii?Q?asUIiViUHqqXjIFUvw+5J7MOfScddCBWLJgCf8cWuOcvDnhSl+pmDqxLyQNJ?=
 =?us-ascii?Q?7qb4hfs5t0f8tDjq98B6nMOjL4jBEy8VAXeg20EsJpM18y8OojDR/qCQdKVJ?=
 =?us-ascii?Q?rb70zpBpvcE54WIiocbBbwW/xI0TIMGFFUDr9IG6q9eondoGe/LVoqZHznPH?=
 =?us-ascii?Q?c/EaKP9PaBErHGyzD/+bfTJ7HV7CmhDyVm2uPcVexi/budrDdTPclLBy4fKg?=
 =?us-ascii?Q?GYivZDrh859hj8PQL06iZzVYL564tZJOzg9TZVUSJiXAsF4jc8IROrjOplxr?=
 =?us-ascii?Q?ODKk8AUeIPrGSgwRvcYk+cti6xLq4IM5DlvCo2LPEhX0hw5ftZ7inA1xNgYJ?=
 =?us-ascii?Q?aNvO82TAk0CDbhUfkF1Ic1GJeCSr88+ot7V0GCDPcrWjdEUMDSpOy7m+Au6q?=
 =?us-ascii?Q?Yrh/sosC855UhG6eOc5wS9wWgVNPJUWN1+zot2OaDUbgdqataKfBj4zJsXMs?=
 =?us-ascii?Q?T3kn5uPTXJtRXi6j+GCB4HNU8ncpYrIURR06nWqNq1o5frjbeywO8OSFUsdd?=
 =?us-ascii?Q?odvT/5UoJUvikjd2qTRD4Jw8CW41r7HJFjKIwzaniP75qDrRi7+TcGW6zDCs?=
 =?us-ascii?Q?tjRrmR7bEdJaewHb0u393xA2zLYNIoz1rt0I1jbvzpZ5vjOLyCwXvVdhDTB7?=
 =?us-ascii?Q?3g8oWyKkqxvXr+sM6TR88J8WdxCd8Fab7LOI?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 12:28:49.8354
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c489ef5a-9633-4cba-1fef-08ddb31aac77
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0002256F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB4873
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDEwNSBTYWx0ZWRfX2ZKbbWSjlb3P GJNne1XjsSsvcOfiyw6bBmGtMNtlUzth/nn5NTb/WAQtA2Q52S8jO8BZffhoEYpzpH3M1D3P3aZ oCbpaavKshzN6T7ZqgN7/9ts4UWFn6Kd53Ucw1r9mxL8Eiv+R8+EFx47jUvdi0x6Xq2KJ+ZGK7u
 Vf5E6ovgLRjU8DOppwARvQmDuGnT6fbqWHTzPDlmw/Gy0VyBzzXfWFqfXSNBIWYmAwioeA1Pgqi zGoWUY3Y+Iz4Y/lALe+LbwFNCTPExCVFWRiMNnkUqvBxoNG+HtMPfCMtYOhjXx2GSeSAX9tJ0Ii mZ0+gepr/j4ZprXZF118FNQ3K5eJqr5tk16mjO/F+9O9HG/A/rxOnxOovjp6SEh+QY0+0X44MZj
 rE4z20U5wjmnW9c2Fasc4f/FPlXrUUcZeE92gVyAFFWdDk0Omtg19Xvrt1Aj/3SF5ImiV7mL
X-Authority-Analysis: v=2.4 cv=da+A3WXe c=1 sm=1 tr=0 ts=685a9a08 cx=c_pps a=KF8f92PZeEH78vqSuT/2EA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=6IFa9wvqVegA:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8 a=JE3WF5roqhOJyUsBzO4A:9
X-Proofpoint-ORIG-GUID: g37-iRst_m7KMGPCba6sky0DIsOpcXMH
X-Proofpoint-GUID: g37-iRst_m7KMGPCba6sky0DIsOpcXMH
X-Proofpoint-Spam-Reason: safe

Correct some typos and omissions in the kernel doc for the ASoC SDCA
code.

Fixes: 2c8b3a8e6aa8 ("ASoC: SDCA: Create DAPM widgets and routes from DisCo")
Reported-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No change since v2.

 sound/soc/sdca/sdca_asoc.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index e96e696cb1079..83911dab73ae2 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -93,6 +93,7 @@ static bool readonly_control(struct sdca_control *control)
 
 /**
  * sdca_asoc_count_component - count the various component parts
+ * @dev: Pointer to the device against which allocations will be done.
  * @function: Pointer to the Function information.
  * @num_widgets: Output integer pointer, will be filled with the
  * required number of DAPM widgets for the Function.
@@ -997,7 +998,7 @@ static int populate_pin_switch(struct device *dev,
  * sdca_asoc_populate_controls - fill in an array of ALSA controls for a Function
  * @dev: Pointer to the device against which allocations will be done.
  * @function: Pointer to the Function information.
- * @route: Array of ALSA controls to be populated.
+ * @kctl: Array of ALSA controls to be populated.
  *
  * This function populates an array of ALSA controls from the DisCo
  * information for a particular SDCA Function. Typically,
@@ -1244,7 +1245,11 @@ EXPORT_SYMBOL_NS(sdca_asoc_populate_dais, "SND_SOC_SDCA");
  * sdca_asoc_populate_component - fill in a component driver for a Function
  * @dev: Pointer to the device against which allocations will be done.
  * @function: Pointer to the Function information.
- * @copmonent_drv: Pointer to the component driver to be populated.
+ * @component_drv: Pointer to the component driver to be populated.
+ * @dai_drv: Pointer to the DAI driver array to be allocated and populated.
+ * @num_dai_drv: Pointer to integer that will be populated with the number of
+ * DAI drivers.
+ * @ops: DAI ops pointer that will be used for each DAI driver.
  *
  * This function populates a snd_soc_component_driver structure based
  * on the DisCo information for a particular SDCA Function. It does
-- 
2.39.5

