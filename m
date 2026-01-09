Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9882BE655
	for <linux-sound@vger.kernel.org>; Fri,  9 Jan 2026 14:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767970367; cv=fail; b=NXFIfWmWVeaZL/VQSgUwDfwCrV9X9JLYniDhaJXt1njexYRx5KYMhBMQsjoMu7YC3d8zxFMQ1HsP0hxAsD7FsJ+9H7t/P8jdx9uuZGFPhVjUgW48OWAaRNjOK1GDkmBeXHG/xfqgoWtt8BovIaN5A3aJhcLdv8z4gfIgDHlkCEc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767970367; c=relaxed/simple;
	bh=iUzmphsNA+FLfAN542v5MLERhCJd4FVqSpSj2Z609Io=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ftXnddv1UGDpOo1C+faBy3Xdu+TA30etX8ResnjowB4ZON4sl4QLy/5NFoVN8FGtMeb4KEOIDFZni7NvXWeGVwuY2KUmYZxBawVOKME/fO0GEtnHtxQ7yQYMhA2jKEkFxBgTlmhLnskUD7vZGINy/3WrG0vgJ9UdYWgZGH3CaBU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=RL9I5ITT; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=t9ZZH+eY; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="RL9I5ITT";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="t9ZZH+eY"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6094sTBY3691653;
	Fri, 9 Jan 2026 08:52:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=uwjon04UaZB+/y6RrxXejh5LtJuO4r7ghK5u3cbsb8o=; b=
	RL9I5ITTQC7Gp3qrSKdDr4Wx1Qh67Efh/PuLyrLEDgYpw9+SMIQV+O7l2+vhL3mJ
	QQpbsFVdSEur8Irbs1j2nOTfYpo94cOvb/4ZE4ia3bnGki0Z+tUNuTtWYPrj7S56
	jci07C+W99x1nhaeLLK/tEoa48acmBsXs3C9ONpA763qXvhVZlCA0W4Ngv4bgQmp
	7P9bChQJB+O13gyyWGhAdQ0mTntQQ8GzpkG0OpTQD1Tg3SEWnhGnV87+54aqzvbl
	kUyYZ+IiLEb1zDIdoY6mJBFOx++ZKG5d6mYCJmW4n1SMMDKzAiGfGCO5JCCi6Kru
	Y0IQx2EPWFsBv/htuAmNXA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021121.outbound.protection.outlook.com [40.107.208.121])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4bf0dnxvc0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 09 Jan 2026 08:52:16 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PMBhFbdS6j1m9Kir5roSXialMNJu9+fETvK2F4TGabUFHs0172B4mmSmXe04+fCNw9ElaSDwF459VchpEdpYI3cICu0dyTXZM1c8wB+EkBmP94TPuW4eNnU2i54tUED5d7dmvqijR5TaMXzKcpK+Lr5AnSA6EX7K2Vj80B0fV4tmdOpHXwVgISFW+ythOZAcVVamQGDUK7Ignul9Az5xObv/OK4JXGXxcHsiZMc3fBhiAWqCRMbYyzkMLhh+QdiPATGJeSaGuAc8+quQpSEeCK7eqBknpEyJpw64dkwKEc7nD3kjxeB6g2EPagU/QuS5WB0gLBDnGG1372Vr2eCwpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uwjon04UaZB+/y6RrxXejh5LtJuO4r7ghK5u3cbsb8o=;
 b=msd15NrVE7pqZGIBugjjU8lG+NBNbKGoJDBLw6pfrrLUHIv1HrNfqryrywy4T9vrtU501LQeopyx5r6VS5rJBZJWQcL+aA3BDlw11mSdXFwK7z3OYE7AiPQm23RpsCsE0XZi8snrNulVPDcGzk4CXu9Tyqw7fdMbiF0sbnikAruJtNhW+qRO0od0R0JQtt978epaNRluFI8RE+9U3f4xGNOWt96dznsmkqBej7Dpg9XbyZwT9hP8wCBDSRkzS4zVZ8GGpjDruAQO/AUeF7pca1GI081cpPWjTKCOQ7ijHhM6ySduaKW/dLzYvQCkBUW7Ied7fbY37gusDbWBBUWs+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uwjon04UaZB+/y6RrxXejh5LtJuO4r7ghK5u3cbsb8o=;
 b=t9ZZH+eY03J6uyn47xcV1otK5uuce83eoT4VyEktn5prOvIibuH24xFq7/DU8XWp3yzM6UjuxcXx5GKScNHIdwS+3AyDvkY/fpqC6O91LLt8ITR0W03vWyBVIG5cCVKCz6LFTwjOjlcb89e6bhAd01I3daxcakWAiZgUiGc3teg=
Received: from BL1PR13CA0434.namprd13.prod.outlook.com (2603:10b6:208:2c3::19)
 by DS7PR19MB4534.namprd19.prod.outlook.com (2603:10b6:5:2d3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.5; Fri, 9 Jan
 2026 14:52:11 +0000
Received: from BL6PEPF0001AB4C.namprd04.prod.outlook.com
 (2603:10b6:208:2c3:cafe::6c) by BL1PR13CA0434.outlook.office365.com
 (2603:10b6:208:2c3::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.0 via Frontend Transport; Fri, 9
 Jan 2026 14:52:06 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF0001AB4C.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.1
 via Frontend Transport; Fri, 9 Jan 2026 14:52:11 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4CD0E406550;
	Fri,  9 Jan 2026 14:52:10 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 3921C820249;
	Fri,  9 Jan 2026 14:52:10 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 3/4] ASoC: SDCA: Device boot into the system suspend process
Date: Fri,  9 Jan 2026 14:52:05 +0000
Message-ID: <20260109145206.3456151-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260109145206.3456151-1-ckeepax@opensource.cirrus.com>
References: <20260109145206.3456151-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4C:EE_|DS7PR19MB4534:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 95222d9b-0a09-4829-1938-08de4f8eab6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?g9ZBlD7KmavFU7jybE5dCtsdhyfDuefrQPJyZgQrIui9bLpnho/43b0vlmKJ?=
 =?us-ascii?Q?C/szK6PkJkDHQ0eirfr+mRjq9yuzIv6hSY8J5yJusd2O2SOFIkuY2EV5/HW5?=
 =?us-ascii?Q?zd+xkBNtF/gy3d9fSq5oUBQ9yzZLOfJxNpNznz0QhOb1fZnsz7P6MgQBd/aG?=
 =?us-ascii?Q?Jb7xjYo1e6RlcC4Cu9nEPZ1TIQhlMC9oCiy6ji8kNJXGtxxeA1uFO8ZgxEJR?=
 =?us-ascii?Q?XHSWB/ospu8g5ZvQQ4uFw+siEglDb1CerD8fN9RmSowDXcq6UxCoWTKwI1m2?=
 =?us-ascii?Q?YMnsazgFoVJh2BR5vPAtKOXAcgUSnVVSfqDWneMYnVynQv9k4idteJKj+ATM?=
 =?us-ascii?Q?l6SfyCjQB9/aAwnQmR82VINjwGsosgAcQ+3vIcyC2On0CuTCm62btaYFQJrm?=
 =?us-ascii?Q?6zzuFjudIkSRXGVZBwDPer3PFVuJy75T5OPGi+oGVgeDBABGDA9r8POHOmFp?=
 =?us-ascii?Q?QH+oKdqIdIQsGP34j3j2JC1CW4/OLxj134Yp1CutnWqMcMzqf24usWWl9UqJ?=
 =?us-ascii?Q?ODdVm4CgHpF3jcu/13Fj5ohVBhkKueH7VyT3vP17/LbnCKbTp/fVKFHpUmHl?=
 =?us-ascii?Q?OVUdiO/Egw/s2tHw0k0I5mFV7Ewcm/QHMSRB5mcjgri08nCMAdDWxnZ3dLD0?=
 =?us-ascii?Q?0f8SoLNNLipb0GoQXUDlYgv9IDGAaf5EU/hdtSBxvLHutwbBgR6Qtq7zJsdY?=
 =?us-ascii?Q?+9uJXNIg19I9DujJ9aOz4SMcz3OF6AZc++N1cG/rlW30ddMuVWJXmLyNHHP+?=
 =?us-ascii?Q?2QFB/qW9QMzWrvuxmzJRih9SVVq5SNgCne/mTgZmjurfSJ39EFrO94BvxSot?=
 =?us-ascii?Q?NDine6TiMrSAnyRpM1LuHpM3UuYyAinSKZgk/5hL1fkGbj+n27/DC1x7qYnJ?=
 =?us-ascii?Q?ZCjaamaicqvS24u361sO/yR8KAklmpc6tzgLvnoo6WPCWbBR5X1azuaFig0W?=
 =?us-ascii?Q?qjFD3nx18oKfJL70gF7Cmnm9EIh+gK1bZuug06T9uTpmQ3wtreejhI0w/YhK?=
 =?us-ascii?Q?BzCU9LXV0gPKptUebSdlW7CxD+Z581OuLvH2q0iduWPWeMuU/SlP9yjgYzx7?=
 =?us-ascii?Q?l6HD/PcmtI5YF5xaxq90YqdDtTeVi/jZgR+hrkKzokGBm/XiewH+UFCDxi2E?=
 =?us-ascii?Q?Mnn8WI5XG74J3Q17BLOMiPBOHkomwOIyHZPjeKZOzjsfAPitU1Za4lqcTEky?=
 =?us-ascii?Q?O5uiOiySO5ERuWJOGJCjRVblQgbFOQyTb+bKDmqpBqt5zwhVBn8PpbwUSocR?=
 =?us-ascii?Q?E2UY6oMQib4+LIaAEeCWqlW0/E4EKibEeTCtG6FYDkf46lLthAVFIPVnjkRZ?=
 =?us-ascii?Q?5xx2r65qNOwyNzuH80qEIlyisabXA/HNkiNp4MH0JxsEVwVChc5GMQy21Z4p?=
 =?us-ascii?Q?p9OxqdgUf/zeXG7IT5ouKw6NnR9OlRLL/8pHWtxh+u3tyxQHCmG05Pj5MxTM?=
 =?us-ascii?Q?f5qlbFHyQqlG1NSGea+E2zoL/YpaGYqXtp/+tgNt8g8oBRnQZ3idc08lbXOa?=
 =?us-ascii?Q?4fhCsrN3birmR7XKbFZuMps82TF5lbtFKgo2OCRnRtG9gvS7FS4x0je+UvEu?=
 =?us-ascii?Q?iRdTaHzmivU+xj//89k=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(36860700013)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 14:52:11.1011
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95222d9b-0a09-4829-1938-08de4f8eab6b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF0001AB4C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB4534
X-Proofpoint-GUID: J_lfNWMScbwKvTgoN2BUNYV-APm6LFQf
X-Proofpoint-ORIG-GUID: J_lfNWMScbwKvTgoN2BUNYV-APm6LFQf
X-Authority-Analysis: v=2.4 cv=FscIPmrq c=1 sm=1 tr=0 ts=69611620 cx=c_pps
 a=jMYSYhjavaUERamZK80FfQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=bvcEEtyHG434Yft5PkcA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDExMCBTYWx0ZWRfX93QNXsNRPDjK
 zFWWiz1pJRS+R8Y2YZ4ka9etu7cqMWFGz3VAhLljIHGWPaERcHOZq5w8/i66WQO+ruhSGjvqkjG
 2Aj4ARzBcW4+o0dgfLgsARai+iDBqXbcf5gbvFvV75xkvtF/UZtiMM9OtAP5CPm67WhNkx2tkRh
 14tdQctMpvmpw5CS16zUCA+r6F64Om3Xl/3aDEprFtbYw7dTbJZaI8UxZ2Scl1n0v53BVe0L5kP
 o89H+jryzXL+dUvJfEnyyJiyaHKkMCzQ/DsxecAulvjrotavizuMPdn1rQu3dty39lj8Qb4sOH0
 yjnhK1eV7c7HcI4NoYZigVvzRqjfFiQ7VStQOrnVSTAJZ6GnhI1BeKXAxSJa5XqABq4y9lQhtKe
 YDlsi81P3p1RIr74uTvPSrSYWVchWnBDAaXiTHP4lsEtULhaOIMnAPkRZNxVQgGWtDpRA1g21IF
 yP9tXNgO2zldS0d4aWA==
X-Proofpoint-Spam-Reason: safe

When system suspending the device may be powered off, this means all
state will be lost and the firmware may need to be re-downloaded. Add
the necessary calls to bring the device back up. This also requires that
that the FDL (firmware download) IRQ handler is modified to allow it to
run before runtime PM has been fully restored.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v2:
 - Correct detection of system suspend in FDL IRQ.

 sound/soc/sdca/sdca_class_function.c | 72 +++++++++++++++++++---------
 sound/soc/sdca/sdca_interrupts.c     | 17 +++++--
 2 files changed, 62 insertions(+), 27 deletions(-)

diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
index 7d0a6c0adbfb6..bbf486d9a3d07 100644
--- a/sound/soc/sdca/sdca_class_function.c
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -211,21 +211,12 @@ static const struct snd_soc_component_driver class_function_component_drv = {
 	.endianness		= 1,
 };
 
-static int class_function_boot(struct class_function_drv *drv)
+static int class_function_init_device(struct class_function_drv *drv,
+				      unsigned int status)
 {
-	unsigned int reg = SDW_SDCA_CTL(drv->function->desc->adr,
-					SDCA_ENTITY_TYPE_ENTITY_0,
-					SDCA_CTL_ENTITY_0_FUNCTION_STATUS, 0);
-	unsigned int val;
 	int ret;
 
-	ret = regmap_read(drv->regmap, reg, &val);
-	if (ret < 0) {
-		dev_err(drv->dev, "failed to read function status: %d\n", ret);
-		return ret;
-	}
-
-	if (!(val & SDCA_CTL_ENTITY_0_FUNCTION_HAS_BEEN_RESET)) {
+	if (!(status & SDCA_CTL_ENTITY_0_FUNCTION_HAS_BEEN_RESET)) {
 		dev_dbg(drv->dev, "reset function device\n");
 
 		ret = sdca_reset_function(drv->dev, drv->function, drv->regmap);
@@ -233,24 +224,36 @@ static int class_function_boot(struct class_function_drv *drv)
 			return ret;
 	}
 
-	if (val & SDCA_CTL_ENTITY_0_FUNCTION_NEEDS_INITIALIZATION) {
+	if (status & SDCA_CTL_ENTITY_0_FUNCTION_NEEDS_INITIALIZATION) {
 		dev_dbg(drv->dev, "write initialisation\n");
 
 		ret = sdca_regmap_write_init(drv->dev, drv->core->dev_regmap,
 					     drv->function);
 		if (ret)
 			return ret;
+	}
 
-		ret = regmap_write(drv->regmap, reg,
-				   SDCA_CTL_ENTITY_0_FUNCTION_NEEDS_INITIALIZATION);
-		if (ret < 0) {
-			dev_err(drv->dev,
-				"failed to clear function init status: %d\n",
-				ret);
-			return ret;
-		}
+	return 0;
+}
+
+static int class_function_boot(struct class_function_drv *drv)
+{
+	unsigned int reg = SDW_SDCA_CTL(drv->function->desc->adr,
+					SDCA_ENTITY_TYPE_ENTITY_0,
+					SDCA_CTL_ENTITY_0_FUNCTION_STATUS, 0);
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(drv->regmap, reg, &val);
+	if (ret < 0) {
+		dev_err(drv->dev, "failed to read function status: %d\n", ret);
+		return ret;
 	}
 
+	ret = class_function_init_device(drv, val);
+	if (ret)
+		return ret;
+
 	/* Start FDL process */
 	ret = sdca_irq_populate_early(drv->dev, drv->regmap, drv->function,
 				      drv->core->irq_info);
@@ -419,10 +422,35 @@ static int class_function_runtime_resume(struct device *dev)
 	regcache_cache_only(drv->regmap, false);
 
 	if (drv->suspended) {
+		unsigned int reg = SDW_SDCA_CTL(drv->function->desc->adr,
+						SDCA_ENTITY_TYPE_ENTITY_0,
+						SDCA_CTL_ENTITY_0_FUNCTION_STATUS, 0);
+		unsigned int val;
+
+		ret = regmap_read(drv->regmap, reg, &val);
+		if (ret < 0) {
+			dev_err(drv->dev, "failed to read function status: %d\n", ret);
+			goto err;
+		}
+
+		ret = class_function_init_device(drv, val);
+		if (ret)
+			goto err;
+
 		sdca_irq_enable_early(drv->function, drv->core->irq_info);
-		/* TODO: Add FDL process between early and late IRQs */
+
+		ret = sdca_fdl_sync(drv->dev, drv->function, drv->core->irq_info);
+		if (ret)
+			goto err;
+
 		sdca_irq_enable(drv->function, drv->core->irq_info);
 
+		ret = regmap_write(drv->regmap, reg, 0xFF);
+		if (ret < 0) {
+			dev_err(drv->dev, "failed to clear function status: %d\n", ret);
+			goto err;
+		}
+
 		drv->suspended = false;
 	}
 
diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index afef7bbf613c9..cc40732c30ccb 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -205,10 +205,16 @@ static irqreturn_t fdl_owner_handler(int irq, void *data)
 	irqreturn_t irqret = IRQ_NONE;
 	int ret;
 
-	ret = pm_runtime_get_sync(dev);
-	if (ret < 0) {
-		dev_err(dev, "failed to resume for fdl: %d\n", ret);
-		goto error;
+	/*
+	 * FDL has to run from the system resume handler, at which point
+	 * we can't wait for the pm runtime.
+	 */
+	if (completion_done(&dev->power.completion)) {
+		ret = pm_runtime_get_sync(dev);
+		if (ret < 0) {
+			dev_err(dev, "failed to resume for fdl: %d\n", ret);
+			goto error;
+		}
 	}
 
 	ret = sdca_fdl_process(interrupt);
@@ -217,7 +223,8 @@ static irqreturn_t fdl_owner_handler(int irq, void *data)
 
 	irqret = IRQ_HANDLED;
 error:
-	pm_runtime_put(dev);
+	if (completion_done(&dev->power.completion))
+		pm_runtime_put(dev);
 	return irqret;
 }
 
-- 
2.47.3

