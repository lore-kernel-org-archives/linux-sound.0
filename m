Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC682E9EC4
	for <linux-sound@vger.kernel.org>; Fri, 12 Sep 2025 10:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757673325; cv=fail; b=mCkRD5xJuDPRyj0AsRUlgx6TRRcUGgwJ0huFeHEbJotSsGC1Thb95Q3cQJ7QsO7jPB6Wyvl+hLCZNnv9Nhfta/rDdVReGfL9LEohOdGi2cby+lHBDswfQ5jpg2N2BTTsAFYp2CbH3CviS96vdNZd/366nIZ26daTQ/Msgl+Av4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757673325; c=relaxed/simple;
	bh=tCWvmeWdS57IFMJwdq6aiGrACs8P7kSg7PAtmcsz10k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g51Ju6W5WDyRQWzZDoeO710bzcA30/A4S9Vkc/xfacuTFSg5YtqzyquY1b3bdtIV1PB2sfSp2CXgv9viiHV68Fy9DMXqshaTNJKPmikkkYUGOPweDHzW6nw4o/hjyxieQ8DSHV3hnByfjuoIvVSQWoEobJFT0JKzeh6ueLUr7N0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=YoKo8Qk4; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=A+OMSjM+; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="YoKo8Qk4";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="A+OMSjM+"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58C5o57R1233047;
	Fri, 12 Sep 2025 05:35:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=DI+WhsoVwRh9kyBH/1sX8RkmdSecxmmXvxF2NQlKaGI=; b=
	YoKo8Qk4K3/FF3qZKrnbWXxK3kAEGogg3zt3EbjLvrRf1vomv5ksrY1GRrmj2+Hl
	Q2q/KouX9ZsS5Y0Pc2NVkXMJr0raQWJkAs2qpBUj1NnEcVfYAwannp24g+zDCI3U
	0+FNLCYvN8OW1+SJAD4W62rz0P9vgJjnA/SQslmeMGJTHoxSLJKQMEqmJkOkbD3c
	KOgzEOaXTjk+8aaxgEQ91J97+blm93cZmRPvadtILUb72k5s1K5zA7UvJsCgCCV7
	CU7n9+GxJUYrWsDbhM8P8FAAKxNZusGYqBoJPOfaRs4mAXnDN8J9jQeNuk9eocQk
	oijdhT+RxEXLUWKnR9Y+Ng==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2105.outbound.protection.outlook.com [40.107.94.105])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 492q6tcph5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 05:35:15 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ku03B52RMlFR2jr7etuj5A/0SkMB+RZyNogg7d+0qu/yRGs9Rrc+beN4gLI9EPHElpaPXG1Ti8nLaUeIvOKrESD04coUnNV15cfnq/NNKjt9EvDxefGC+xDJBlAAlx22PNneza8+CEYX6ztB+eYcq5fhnUGY1f5p4YGBV0J5r6k7h7Xpr3QqzC5yRjC1PpDD/ByXTMP9shcXPbDsPmRLAcjuC0bofl40ydLTu7SgxOQm20upisXT7ECmReNARG2xuEtDmT2T1afVDJyAx4RdbLJzm/KSqu8OuwInZWmxaZn+L6LihxjjPW/4e6g/oOwKRJVCCoYEDHUWRto7Izhj1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DI+WhsoVwRh9kyBH/1sX8RkmdSecxmmXvxF2NQlKaGI=;
 b=o025/1oPCus8V/osfbWJGOYCaGQlYHHKUjVao0otRBX6GS195MMGd5+QMwgDCXirDg01uKMyjNBksz7yd718vke7xbTfpYCcEZG+y4RCnsCfMPQMM5M2fpuIpW9O9UC55FnJNLNxBN4VrxHs07gFoaXJFxAp2jfw7Oe5OzosWGfYjHZvryoaE2zKCC/TiDmVCsmZb4xRefrk8PI2Cgx6Q60tLehoJ710swujuXdaJa3+VmJgV4ICspAv6HoSF+0IJlAruePUppGE6DXytAx+abSf1n3JOYPwqquA789HeLJaPEuySCXT0l0RkxO7OAQHNG/jDN5Mid1h3FCfRRYZFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DI+WhsoVwRh9kyBH/1sX8RkmdSecxmmXvxF2NQlKaGI=;
 b=A+OMSjM+NALd2A8VJX7Ced9AB+BSUd8/E9JFuTGALScFZDH80bRR30VlBkiQSb95L7O3xp3x6BdzhD7b5LJVQa9USHoCikwuCtK165OE7fgeGdXKIlcjI7EgkR6zC2yelsd4UTEyIN5Wcdnp4Z10z6XNAvgTKgq7EHRjPA/DN1E=
Received: from BYAPR03CA0008.namprd03.prod.outlook.com (2603:10b6:a02:a8::21)
 by SJ4PPF094C96A68.namprd19.prod.outlook.com (2603:10b6:a0f:fc02::a07) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Fri, 12 Sep
 2025 10:35:12 +0000
Received: from CO1PEPF000042AC.namprd03.prod.outlook.com
 (2603:10b6:a02:a8:cafe::c9) by BYAPR03CA0008.outlook.office365.com
 (2603:10b6:a02:a8::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.17 via Frontend Transport; Fri,
 12 Sep 2025 10:35:12 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF000042AC.mail.protection.outlook.com (10.167.243.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.13
 via Frontend Transport; Fri, 12 Sep 2025 10:35:11 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 244F240655A;
	Fri, 12 Sep 2025 10:35:08 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 05AEE82254A;
	Fri, 12 Sep 2025 10:35:08 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 05/19] ASoC: SDCA: Pass device register map from IRQ alloc to handlers
Date: Fri, 12 Sep 2025 11:34:50 +0100
Message-ID: <20250912103504.2679226-6-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AC:EE_|SJ4PPF094C96A68:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9663b3ff-ef88-426b-269f-08ddf1e80d94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YcE/BKBAabSzZQ9LW1vviMe4NzcWFxCPUYmaiGgZPWAQVw2/NqXKfTBiIFwT?=
 =?us-ascii?Q?43rV2dcfNUnZWlAD0VGYcE7micZLI9GOLbHdUn2Jm1bEp1id6MsN4rjZetbd?=
 =?us-ascii?Q?sLN0wcP+wdMP+EoVBYDZDrQQ6pIURbEvkzyermhEH0FDO4EBP1ancUSWWUo+?=
 =?us-ascii?Q?MYttp/V2+8ziA3dJJNTnNLZA8PH565Fs9y6f6/CSvxGybzRzHLh83KgqHHW2?=
 =?us-ascii?Q?kQexuOAR4tm17IEnPjfSErtXsYvCwrjFoU0EJKdfUDdlT5M/UOi5VWa9dLDG?=
 =?us-ascii?Q?96V3dmSrCxdBm1m8/T83Za76dttEJ9GQJGnaLsy2jHw9QE9DsqL5sn5fyb8B?=
 =?us-ascii?Q?fmMQy1KJn5yvW2BhphzuoQDei9N/l1WIvFGNE0CfAThQtEmJG1k6Y7UaHI7T?=
 =?us-ascii?Q?rIBcHyKn5B1tuFxg7NARwuW4EjygMn8OVXyj9l1Br79tnwqdaT27FeBJz8P2?=
 =?us-ascii?Q?NAUocyc87CLJhRSdslG7+AlW0fg1oRt2P8PFJU5iM741awpmZWgwheRg6QJd?=
 =?us-ascii?Q?DmECrHEOQ2i+qKcmPMLaHsxWTsYEgrzICTSD9LuJqdsvCMfDC/RCijKPTPxu?=
 =?us-ascii?Q?5Mxn53uqUpsnhsriz3cgDwP+mvkXFQkN/lO+SNQVr8NXmlgxZUb5q0BwFEyZ?=
 =?us-ascii?Q?jlNSq5lCu3bpzEWozrd1YkU+1rYsL5tppeTEgeQkurp1Kv1hPsPqDYY9/7sE?=
 =?us-ascii?Q?en21Grf2p4P0mjMk9o6YXAroR6oSpQZRO3UCBGbDnN1DP+gb11i+ylMdWZYm?=
 =?us-ascii?Q?pmIucbtiys1rROfYeTbTz+Go1DKYxtdD/dG6Ud1xY+j+2D5/duFcAAd1Wpj7?=
 =?us-ascii?Q?h78WZzGt/XZAtP6a0JS0Us/c4T9wbgq5iiWXSNJao89KcJCNOFbzBwPKhGK1?=
 =?us-ascii?Q?Z6Twb25bRzaJSbZYQ8OvPLYtRW1rh78nZ9Ry+3g47KTd+FARW8Y878PI/irW?=
 =?us-ascii?Q?bAXdqL6emXtO0GIbvanFPwn4XFSdLpCyPvkPyhI7BmQ76FALMbrqkYL4ZTQa?=
 =?us-ascii?Q?H4A7OMm3gLwdYN9VGAebKn1NE3mFXhRuXHSHHZBpMHlLaYNA8jJVeQcsCp6D?=
 =?us-ascii?Q?6oVcE4tUvGdLUKygTbiX2aIDHgLaQSUeANbsjUcjxEw4/0IGdPso988tWnBn?=
 =?us-ascii?Q?s1XhtptGJsEanAVteoYwlyYv/ERawRamQHD63hv4wyfvzLze16FkJkKEhXW8?=
 =?us-ascii?Q?ZMzN9S+sIOo2/REn5DBpLB5YYAL4Sn0uic6JXdDjqLr0dS9EKmTHLpF89nCI?=
 =?us-ascii?Q?oDaSiZz8j/eU+U14pBtL7HekS3BPalG44Axazm55gOW76PJBcoxefddi3Bi6?=
 =?us-ascii?Q?oCNJlV7LN2eer3Hq4KZQfT3wruQ/U14jPc6EMKp5ivQ9U4zNd5mkQRRGmhws?=
 =?us-ascii?Q?gDLUKolJS7y0ZGJBtIpuJ4SLj9BDZLfi3LlsE3v+pC+huo8vLByk1vlR3qQR?=
 =?us-ascii?Q?6SlYO4hQqRYZ81iXDYceumviA8ZhsqS60a99ogL1nS6y+6S16rsGf54ljwPh?=
 =?us-ascii?Q?fxXv3XUfqNc1okSiY8+Mre0N0JFUD4jpwfwh?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(36860700013)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 10:35:11.5827
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9663b3ff-ef88-426b-269f-08ddf1e80d94
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF000042AC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ4PPF094C96A68
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEyMDA5OSBTYWx0ZWRfX41paJcjzOq0f
 G1m1V63tuboZ1MUWDWChoT0Z3dCSd008/SuBjVm71MEZCE4XbcdGwsoq4KUsx+UXYFypuRiAu20
 e2cjX18NsA39QzJ7Qn5W9CyxbhOhjqc0K0curAV5MlmHQjNDl3kPzK7F5KefHGQ1vxfhcNnX5Yu
 k3uCJljbT6Zq5X1R71FxRgVM4qqWtTHTU+PDufxR1RDaYHLknYhyR9ZCC/psnSpU3PTFDZLy5L/
 SlitAcPq8N2Il8xg1UiqJOCDVQEC9M/KUjTRSD+mlaTlqSaLGSEREbF3SxtM9wmzM1975eRewOO
 +TNXomNhfgtRi6UQbdt2bMfiZNM77l5WuQZInKshXzuoAjgLXBhU2bbesDzaP8=
X-Proofpoint-GUID: nkRdD1A5JZI8sNsNLvYkMk1W9YC_8_S2
X-Authority-Analysis: v=2.4 cv=X71SKHTe c=1 sm=1 tr=0 ts=68c3f763 cx=c_pps
 a=DgGpGtaONXtiYPP+4HxLvA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8
 a=38gYyO_Oba7BUjtA73QA:9
X-Proofpoint-ORIG-GUID: nkRdD1A5JZI8sNsNLvYkMk1W9YC_8_S2
X-Proofpoint-Spam-Reason: safe

Store a copy of the device register map in the structure for the IRQ
handlers. This will allow the individual IRQ handlers access to the
device level register map if required.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v1.

 include/sound/sdca_interrupts.h  | 2 ++
 sound/soc/sdca/sdca_interrupts.c | 5 ++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/sound/sdca_interrupts.h b/include/sound/sdca_interrupts.h
index bbbc3ab27eba..d652c6e94ddc 100644
--- a/include/sound/sdca_interrupts.h
+++ b/include/sound/sdca_interrupts.h
@@ -23,6 +23,7 @@ struct sdca_function_data;
 /**
  * struct sdca_interrupt - contains information about a single SDCA interrupt
  * @name: The name of the interrupt.
+ * @device_regmap: Pointer to the IRQ regmap.
  * @component: Pointer to the ASoC component owns the interrupt.
  * @function: Pointer to the Function that the interrupt is associated with.
  * @entity: Pointer to the Entity that the interrupt is associated with.
@@ -35,6 +36,7 @@ struct sdca_function_data;
 struct sdca_interrupt {
 	const char *name;
 
+	struct regmap *device_regmap;
 	struct snd_soc_component *component;
 	struct sdca_function_data *function;
 	struct sdca_entity *entity;
diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index 9295d283be91..898069ceffe9 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -437,7 +437,7 @@ struct sdca_interrupt_info *sdca_irq_allocate(struct device *sdev,
 					      struct regmap *regmap, int irq)
 {
 	struct sdca_interrupt_info *info;
-	int ret;
+	int ret, i;
 
 	info = devm_kzalloc(sdev, sizeof(*info), GFP_KERNEL);
 	if (!info)
@@ -445,6 +445,9 @@ struct sdca_interrupt_info *sdca_irq_allocate(struct device *sdev,
 
 	info->irq_chip = sdca_irq_chip;
 
+	for (i = 0; i < ARRAY_SIZE(info->irqs); i++)
+		info->irqs[i].device_regmap = regmap;
+
 	ret = devm_mutex_init(sdev, &info->irq_lock);
 	if (ret)
 		return ERR_PTR(ret);
-- 
2.47.3

