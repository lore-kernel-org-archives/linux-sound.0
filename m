Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2355030FF34
	for <linux-sound@vger.kernel.org>; Thu,  6 Nov 2025 11:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762429497; cv=fail; b=riwktXEWBfRUYO/kzz8OdHXk10v0O9B/tGdx1v30HQajo6eY4KnuYX7la3r8PBr8D+QGLK3sr9EKqifqXWcUYmzPAhb2aGcwu5X4HsWi0HuYsuoXem/sB2KfBP9TG8vcCOYEfDt4j5Yr4ubxkjaLLZ2inU9e55tlgL9A4AghLyY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762429497; c=relaxed/simple;
	bh=QnjvZIoPZ30TtBpCiTx020+KNE20vT/61qrrkYt8aM8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p7ubLl7BfIqVA8Fpr5bsLYih54EX1Wlsreu5CzdjN9hf56Luwz2fusGmCD1tAtCi6UX3rVyvj7pUz9Z95yWkri76eCYropSuSid4q6PDUsumC0qigXqkpxJ9FycXzL44AyIwXoHPnjsIsTs7s0Nm/MwWM0EF/lkDSx2iC1G9WQM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=PDSjt7Hh; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=qWrEF2jy; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="PDSjt7Hh";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="qWrEF2jy"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A61vDGx1122962;
	Thu, 6 Nov 2025 05:44:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=Ju2QmbSIwp6GWDEKQnT1mPgQCH/DZypthJyICZiOo4c=; b=
	PDSjt7HhNDe1XgyFOwDCbXdLT0bsK1rhoeqMuZoeUXPviWsDbdNFdmpDfhFsNjRa
	5GokVx7X0SvgUYP9iz0a8UOtpQCZ0AfTCRUJ+aZmI/0413a3ahxZ9u6Mkzw+/Hyf
	zJJ7oHQAWq3RGMyTA6NSlanhaDo0PFDrsJZPGshvmHKUaIN1oCFaV8pcAw4Yk7K9
	7VGBfsENzoQNbRQ1kKOSQc05fSP5vDNUklahyzFpoDoPFtcgpGvO2mPx7QLM4Vgz
	Bui11igzipTfEQ+tlUkDHs8Xl3lsUl68VMoR+CXIupGoXVVEUGuu/zo4Ukgfxdop
	Ikh/g3Ru4RO18IoGn5xVIg==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020125.outbound.protection.outlook.com [52.101.56.125])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4a783wun4j-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 06 Nov 2025 05:44:34 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KZAaX04m6l5hMBf9jqiuwVMGCxIF9IPLbjkszi5fItTJrCn5rBvQAzpRD1dJKDa0uuf2XJZNeLPF4KOc/Kv/l7rBCi47WwYDOJYRIyaKlFzQUPWeN025KJgyCWDjOWk21Fq5xQs33AWlk+h7hYmiild4Z89xvWrckMG4B7jzoclUOxv2b4ayBdeDZC0NBdI4v/8R0TPN8Qp3Dv08qVPhSqloSpqBMiNNbHsGkb1w05UXdXDOr+uIuRd/Xfe7jYluuyidCFqmrvuqj3zvzTPjjhox6KM3RCWoW+m5YzUAXGWF3NOn/gIBhV65/Sb0UWjNvRa8wKnTWq3gyYqmYSwg5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ju2QmbSIwp6GWDEKQnT1mPgQCH/DZypthJyICZiOo4c=;
 b=QXfSu6icgswoNbzTjDD5Og7+wwnrRw+J+9+bUCbBD0nr0m3g7lUDgFSQPOzri8NnBRp3BYmqtPuKu9COfy+RbHLzE6sr0kPaXa9QfgQpzWuUWCloXQYVAfkgkm66wG+cGeX1RxlJzCP3bMHSgBudv/fb8vfD+HXtkbZDV09b0zxWr+RwvhcK9TNXksUIqEgv/D++wQO0C95Ukuz9dKaYItY3lqlubaUbnCgbX13Y2R0bovnh+ZS2NqCSdpT6CvBkhsEyPp8hVlnRo5NNh74tfg44F/BBk5gYdUAdXNGgd42d4/I+CgCJlt6z5wpDbspY0ewCFmzKojWbtdePBUGsDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ju2QmbSIwp6GWDEKQnT1mPgQCH/DZypthJyICZiOo4c=;
 b=qWrEF2jy2N/47IODa6GptY9wnYbDnrnaOTSq/XX6/xLSh4XXtfhQH2vGqhgP4dmaE/26bp9JHHAGsaNoNCw3dSRAM7veY30RHSQpmhfxud0ChnXXhYia+ORG/5eqLPYt2o/ybWiIkgiQP60V/JPS6cxPw/hjvsWMlUACp9BHH8g=
Received: from CH2PR04CA0020.namprd04.prod.outlook.com (2603:10b6:610:52::30)
 by MW4PR19MB6722.namprd19.prod.outlook.com (2603:10b6:303:1ef::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Thu, 6 Nov
 2025 11:44:29 +0000
Received: from CH3PEPF0000000F.namprd04.prod.outlook.com
 (2603:10b6:610:52:cafe::3c) by CH2PR04CA0020.outlook.office365.com
 (2603:10b6:610:52::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.12 via Frontend Transport; Thu,
 6 Nov 2025 11:44:29 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH3PEPF0000000F.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.6
 via Frontend Transport; Thu, 6 Nov 2025 11:44:29 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 12BF640655A;
	Thu,  6 Nov 2025 11:44:26 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id D591F82025A;
	Thu,  6 Nov 2025 11:44:25 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 08/13] ASoC: SDCA: Factor out helper to process Control defaults
Date: Thu,  6 Nov 2025 11:44:17 +0000
Message-ID: <20251106114422.906370-9-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251106114422.906370-1-ckeepax@opensource.cirrus.com>
References: <20251106114422.906370-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000F:EE_|MW4PR19MB6722:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 90d16ddb-0ae5-4752-149e-08de1d29d88b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|61400799027|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ltf3Wvt43CTnpCG/pvgNpwJcEVdXblWzOX0q7xgRZG8ABtH8zRBPpBVK7KOt?=
 =?us-ascii?Q?xQZ6FN/v9htVdfX9iRkLNTTTdtX9gQnuoUKz1T2pMz+UTi/BcPKJIQlpWmOa?=
 =?us-ascii?Q?iowu2VvKdVBiqtO60PwQAQOPpquRmiOpFIYrdnIpuJRL0nK894ootCA5lW1h?=
 =?us-ascii?Q?iSf4FBJPR/JEE8iZyUG3h6JivIK49TeyX/IG26Y3qR8/LpKFJMwKvYonXF+L?=
 =?us-ascii?Q?zn/7fxG8Sy6YjvYuA17LFOwz318vqH17SwbojNDJWlyhgDJKpubbenMXlzVE?=
 =?us-ascii?Q?+7SctDWweDC/37SGMVRtAT4zVEqNRPh/khPAEg6noytLj62IW0LPDq7+bKgo?=
 =?us-ascii?Q?fmL3QmYSR89vZIvEZr0zRSuHsG7GzBARc6CCm10SpVrB2Aohw1FE2eV+0oJS?=
 =?us-ascii?Q?znMSU1LXWe83CdEFXBMUpraH+5fC61xaBymfeJ4b2Mx+qX2MQO6Ttjzwxkwn?=
 =?us-ascii?Q?r6djWQolYRKMQuMhQLukaYb073jzT2XxPkz9RejUy6RWqFTZJuRit9/qsyym?=
 =?us-ascii?Q?LshPPu4ec3ZN52mKFdpAdDdEyRcBpxzNUngxTTIOa+u5hZupauJQoGhx1wtK?=
 =?us-ascii?Q?QxJFtFRj/gu5xEhgPv7IVHthc73W8ABINd5b5Koy/BLLwiiqNx3FIx4upgRu?=
 =?us-ascii?Q?KdpkGzi1Vgez6Lnvu5MF3KDp+7DgvzyqYgaVjoZpWDzPUyI9WU6zt1x+BtjO?=
 =?us-ascii?Q?XbyoZjN9llo6PnYuWp2wAROuLJI2NfOz0m6Z66SOyHIZaq/s9YT2th1gZFQQ?=
 =?us-ascii?Q?1P7TQfYBn+4EwMUt1lCvlcKx3PqK1LWcVuDryIyEI+0nTbH2w6Aezd0znFVR?=
 =?us-ascii?Q?qLLcFNWh1+/X7zKY8RPddc3tIIiqZJgIyBQHriNaDR98PBaGwfrm5lhVvn2S?=
 =?us-ascii?Q?n6domy9l4edvIyo3bhPgjeNRj5WnJQsLP3JpPu7tInn/R0UFmVcEjCcz+Bem?=
 =?us-ascii?Q?WzM3SUDlBdGCRB0VwypSMn+0lftwP22D/C4BVm4IIQ7IFK4ZRe/S7WuoQXok?=
 =?us-ascii?Q?i1WXdjiy0HguiBZWb4raU3YYgjpChyWrIb4iXPxvfPNSb89Wds+J9/UviJec?=
 =?us-ascii?Q?SnVXRfnFbgJ7VnVEshfQk+JxNg/l/FGWXdVhApkOhcAv0pxCtjP57xBn4HI3?=
 =?us-ascii?Q?CObRjia2MKLxlctyUS10dGCc2UNWKpcdLIVFKz6MItbVZR++5wT0nbF2W5zn?=
 =?us-ascii?Q?ljMq3TLuufQcf4tOa4t4zhpoMnBYnY8bHgaL6eX+YIjSIsR1rR0V+zb/+A4P?=
 =?us-ascii?Q?Uu8EmByAM24uBzqrkbZa+LoXoItyGYsTV1u1zYYXRRxzBAE8QjmNTZOqCNf7?=
 =?us-ascii?Q?q/ejITWRxhei9WkiL2pNVwgLnONaSeHrXihZ45Xr53i7y8aDIrEeh1Jqtdq6?=
 =?us-ascii?Q?PIoMMNEQ1EDUPtaAqZVFSq+pV4O28SqpSAyTX+fwuYkOOQGL2TT6Jkxj7heD?=
 =?us-ascii?Q?sV0xJ5p6kCiw/CPB/Vb+r0m6zBQvE1PI0C478KrpxmlHUh+SZ5v/8U8bJEUg?=
 =?us-ascii?Q?oJAADaw+lmTq3A/0vYH/VAA4mkii2wC+E7D4wZA2K+eZycMs5BD7/mUJlk+o?=
 =?us-ascii?Q?nOCBsNlheeu6Q9faJUI=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(61400799027)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 11:44:29.4663
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90d16ddb-0ae5-4752-149e-08de1d29d88b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH3PEPF0000000F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR19MB6722
X-Proofpoint-GUID: jNJBNQgOLvnlbvu8PTIIH232zOcBELt4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDA5MiBTYWx0ZWRfX1Kv4U+JcVNwi
 ROMWbYxUMNtoatKhDUdXOdJIpnA52vJOUqkq6IBePA3hQFQ4UQK6wXRlj6q9g24PKOqq2Ou9dCH
 7rx0G9dYHlmuuikbDPZWueAnOQfyn4hTEQiNNsB/5aI24ka1bKo9Z6NBU9aHsdCPbES4v/kqdf2
 GfOBqyaXC5jgfbwcrLxV3SU2Hj2xR79Tu1eIK1vqCvVt5e4Xx51Y7IGQBOc345GBD3MQs8JWGVC
 yDQjqRDN6llizB8/umJmNfS2wjxTYPb57u6nDAHdm2wD7Z9PW5Nv20xkgPkg2ZsO6fOv7HYF5GR
 75GecsAhw9+IKu8CLQ/O3C6PFFBrhdQwL3WSmV3LuV+s8B+iSbcjc5rkQzzdeybJvhweyJZpF/9
 qc/DEOFTDirm9iT1JX7PbMyzZ8y1+A==
X-Proofpoint-ORIG-GUID: jNJBNQgOLvnlbvu8PTIIH232zOcBELt4
X-Authority-Analysis: v=2.4 cv=b9G/I9Gx c=1 sm=1 tr=0 ts=690c8a22 cx=c_pps
 a=qoAvcrxUHY3FHMzwJxUv3w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=IUiMwORI4Q0lmyDNHjMA:9
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Reason: safe

The indentation of the loop processing writing out SDCA Control default
values is getting a bit large. Reduce indentation and make adding more
functionality easier by factoring out the Control handling into a helper
function.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v2.

 sound/soc/sdca/sdca_regmap.c | 61 +++++++++++++++++++++++-------------
 1 file changed, 39 insertions(+), 22 deletions(-)

diff --git a/sound/soc/sdca/sdca_regmap.c b/sound/soc/sdca/sdca_regmap.c
index 8fa138fca00ff..5104ae99df33a 100644
--- a/sound/soc/sdca/sdca_regmap.c
+++ b/sound/soc/sdca/sdca_regmap.c
@@ -275,6 +275,40 @@ int sdca_regmap_populate_constants(struct device *dev,
 }
 EXPORT_SYMBOL_NS(sdca_regmap_populate_constants, "SND_SOC_SDCA");
 
+static int populate_control_defaults(struct device *dev, struct regmap *regmap,
+				     struct sdca_function_data *function,
+				     struct sdca_entity *entity,
+				     struct sdca_control *control)
+{
+	int i, ret;
+	int cn;
+
+	if (control->mode == SDCA_ACCESS_MODE_DC)
+		return 0;
+
+	if (!control->has_default && !control->has_fixed)
+		return 0;
+
+	i = 0;
+	for_each_set_bit(cn, (unsigned long *)&control->cn_list,
+			 BITS_PER_TYPE(control->cn_list)) {
+		unsigned int reg;
+
+		reg = SDW_SDCA_CTL(function->desc->adr, entity->id, control->sel, cn);
+
+		ret = regmap_write(regmap, reg, control->values[i]);
+		if (ret) {
+			dev_err(dev, "Failed to write default %#x: %d\n",
+				reg, ret);
+			return ret;
+		}
+
+		i++;
+	}
+
+	return 0;
+}
+
 /**
  * sdca_regmap_write_defaults - write out DisCo defaults to device
  * @dev: Pointer to the device.
@@ -290,7 +324,7 @@ EXPORT_SYMBOL_NS(sdca_regmap_populate_constants, "SND_SOC_SDCA");
 int sdca_regmap_write_defaults(struct device *dev, struct regmap *regmap,
 			       struct sdca_function_data *function)
 {
-	int i, j, k;
+	int i, j;
 	int ret;
 
 	for (i = 0; i < function->num_entities; i++) {
@@ -298,28 +332,11 @@ int sdca_regmap_write_defaults(struct device *dev, struct regmap *regmap,
 
 		for (j = 0; j < entity->num_controls; j++) {
 			struct sdca_control *control = &entity->controls[j];
-			int cn;
-
-			if (control->mode == SDCA_ACCESS_MODE_DC)
-				continue;
 
-			if (!control->has_default && !control->has_fixed)
-				continue;
-
-			k = 0;
-			for_each_set_bit(cn, (unsigned long *)&control->cn_list,
-					 BITS_PER_TYPE(control->cn_list)) {
-				unsigned int reg;
-
-				reg = SDW_SDCA_CTL(function->desc->adr, entity->id,
-						   control->sel, cn);
-
-				ret = regmap_write(regmap, reg, control->values[k]);
-				if (ret)
-					return ret;
-
-				k++;
-			}
+			ret = populate_control_defaults(dev, regmap, function,
+							entity, control);
+			if (ret)
+				return ret;
 		}
 	}
 
-- 
2.47.3

