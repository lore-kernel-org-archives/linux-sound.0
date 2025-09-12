Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902DBA41
	for <linux-sound@vger.kernel.org>; Fri, 12 Sep 2025 10:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757673330; cv=fail; b=apTSEfPd2jr3YTEYTHk9iFgU/Oe1P7NPresFN7wA+dzEKWRv6aFygVeOIkjwEJr1cqFt6JnfI72wPyhmtVoSup2uU7OqSFLz71DKln3i8cIQ6ymmpP+Kfai+mz+hBB7v/YQ1haQ8U4ZonJWRZLlwtHG40fVuUL58iNy6UUYE7Ng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757673330; c=relaxed/simple;
	bh=3u5F75cAtFO7Js1qkwkrpx41dDf8aU+Ge6xeuaLgUdc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZgI2AJWhcwPYKlukMRpI0lSqDG02uUUMT05XcsjPhaAFY6Bq9Fiu+4z34skxk1sqKnAkh3bizOU7Qh7oZuAwX82qNDjGKZaZ8psLZ0m2LOPjQq8tlKCqQULaCmgTmFS3fySRtBH8bQGUtu7c2LB/ZsXSTClt46rRsZTBz6oOgp4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ZZ5ZMzHU; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=tnl6xi9U; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ZZ5ZMzHU";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="tnl6xi9U"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58BNeAn2643006;
	Fri, 12 Sep 2025 05:35:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=lMWtzNOW8A+HJSntsI9R7z3NuGbbRobOdPrD2pitEzM=; b=
	ZZ5ZMzHU3mbvGmr1qaSHGp/hpWTqklyH3geuxR2L3B9ksLXIzKiO3T8oVy+DLdmn
	KH4tSUPFqNv/Ap9L3UCXGc+oWXX8FptFuaUwBD3WYMi9IobzVdjMfncLkWhTzfva
	kXpl1CcucWfGprB2dQyt3jQAvlNgya/CgEQ3SS0Yyc/e9l3znMUsBwcgAp8DZb6Q
	NdNF2UHUgyOp15f9AKSu4dek9v2U4N7yCdz2u0KpcI5/0GvXfbapmCYLsWVVWJjt
	7pJzT1y1AF91Me82gprRLaiuavH8mgSPvFspP4GwAxSGKSJ09KQEVrCEn5BuyL7N
	if8DfdKLMS4RfzC/PTQIaw==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2115.outbound.protection.outlook.com [40.107.244.115])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 492q6tcph1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 05:35:13 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vD6Y/Lf0hbBiM9Fy/E2v4ANapzF1dpOKwbdmWZNEwYgfmpI9nzAa+Ng9uCvy28b0OBX52IBrPyXHoXuaAo3a3dL+U6rej2X23Aq7ol1HBIathc077PGUpiOnWMo24q1ZxWBE9eIKkQH0DoBdy+wg7YD8a0oRUz2F+MaDqu6oIU0ENZwjk3tJeRFl5TH3jJwiP8+r4kRCXm351wt2UPrfZoiim4Ax1sXCa4e0adsm8sFlJI+cQiEKaolIdRhzRkPbptAIvCCjEL+NSwRJ14v3jqAcd6RTDYnD3pBRiYVH8aoTVNhkSRhKNjaapnu/siJpJpAhpARCoEIHooXDrJ3Dnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lMWtzNOW8A+HJSntsI9R7z3NuGbbRobOdPrD2pitEzM=;
 b=zPBHBRcz138bwN8hLd6lNj9YF4YYhFUWk7EhU1fMYBJQdo8s3YZEbMTouLGFUZKHxNpTkXcaDZ/45A1BGqxdws15jEDbJPpmtV2zqTD94xzVZY8aEr9Ob0LbJlu2oT00422VjkP7pz89WnVoHUGV2T6RfsxMJLj4Wi6yXsWJgNN/H3VE0Ww+gAg/soj1NJ0QD9FsWQ1Ez7m09LZ/OE4RjO1iIyg2F6ILhVfIx3TUlWydcyKSQSLlBienIevxpPa3QVFdT9i15HOpFte/OE5BniKU2UwxjDdJrJoCl7h/bpQIuxz06wSqoib9dX1gHnyoa4ttLluBBHREgScLXkFT1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lMWtzNOW8A+HJSntsI9R7z3NuGbbRobOdPrD2pitEzM=;
 b=tnl6xi9U9nVbi4CDLJuGsOpnsMCgW3mcSfcIxd31M0OZyUqaherlfn6eKUd4K7HiboueL1EywJ51tMTdtkrj0c4B8F25kQlRTa2Ywbs/FnaclY16lsaNhVLFnGP9zrnUDP5fIGCBtim/IHg0io26xsIkNuwEx8EO/3feK55Jaow=
Received: from CYZPR05CA0013.namprd05.prod.outlook.com (2603:10b6:930:89::11)
 by CY8PR19MB7010.namprd19.prod.outlook.com (2603:10b6:930:5a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 10:35:09 +0000
Received: from CY4PEPF0000E9D2.namprd03.prod.outlook.com
 (2603:10b6:930:89:cafe::65) by CYZPR05CA0013.outlook.office365.com
 (2603:10b6:930:89::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.9 via Frontend Transport; Fri,
 12 Sep 2025 10:35:08 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000E9D2.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.13
 via Frontend Transport; Fri, 12 Sep 2025 10:35:09 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id F1782406545;
	Fri, 12 Sep 2025 10:35:07 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id DF0AE822548;
	Fri, 12 Sep 2025 10:35:07 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 01/19] ASoC: SDCA: Rename SoundWire struct device variables
Date: Fri, 12 Sep 2025 11:34:46 +0100
Message-ID: <20250912103504.2679226-2-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D2:EE_|CY8PR19MB7010:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f6889ad5-b6f1-4614-ca65-08ddf1e80c13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|61400799027|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oTKoh+gF9s2iBcyI2hhyd+U8RtaBdiVlFIUWH0+0WZAsvgUoZUpOxNO3CaSk?=
 =?us-ascii?Q?IfuCSecXFD3VnAPMnwAni16VvReFIvNhU4hHUM6GAO1hr4xbxgGBdCuEJj16?=
 =?us-ascii?Q?VADLF3dFW78hBxKuGuKT7ltuDas/2QkhpofXRHP7irDFoyG+SAFPBdeyg+Bg?=
 =?us-ascii?Q?922PygJnVUdbSclwkts177BxIyM7wts8aDLp5pcyHRZOzCUZ81kGIAoqGrXw?=
 =?us-ascii?Q?K/wNNgzxSGvfD15Kuihddc22z9tkQShsD5Pes74HPK04gEZ1jXTfHNnmDiQk?=
 =?us-ascii?Q?NI5eeCe+4V3Nf2pIlh93r0lgiSE7fDlSN5/9iIDci7rYcjWRNy5crQlED3L9?=
 =?us-ascii?Q?pUM/ArZZm5+zQy5t/5CKHtgfHdyXt2V0vaiL/UPrrRIN8zNAC4WRPjL0XSV9?=
 =?us-ascii?Q?45mRABLypoGuy6La17pPZLkM5mOFxtZdy56c5ROV6DegmISfqaAd5AhRV4nV?=
 =?us-ascii?Q?WkK+ygETMp2BLxvNRF+UBve2NZv1HroNt4yF2vuLnP2PWqFIexnn1ww9bQbX?=
 =?us-ascii?Q?m9j4r5rnyfA2fiDxfs8K/XE7i1FqCANYFaImwFnTaTgTtCXi/pFxmpdP8O7D?=
 =?us-ascii?Q?imrxWr9PEF2uvnCS8s387olrc8XMi1sunmPfWJcu08sNwxTIwLrGFSvmbJvr?=
 =?us-ascii?Q?/rEIsTwC4redSZpllbsATUUne0oTmFX2iSubSjuDc/+BPiy3wWXMO2MJafVm?=
 =?us-ascii?Q?nhwM2hvNNYj7YjYGhlNA0PqbFl+6HPLUqS9jXGvMD/YW167esH1BJ0Dzox/a?=
 =?us-ascii?Q?rNOCqkEsnPxJdObrCzzG6Xe2vpqB7Wv7WZFa8NMEVe9XhNmAgZ9wo1iMwk1Q?=
 =?us-ascii?Q?aBxV5Trm/wyc59MBn6bx+sBMniafbZqwQ3k8paYlIF0U6KZ/BUSwPPLOOl7M?=
 =?us-ascii?Q?PSUk98yfMX9CU7WoOfjU0d4ALO3CVjnsyq4+bCod6p3IdfA2cwPpteVPpVB3?=
 =?us-ascii?Q?imjTxkn1hvH5lr9idhc5XSFz87MO4utHlALcYJdzl4x2iL92IXCg2oadkKk0?=
 =?us-ascii?Q?j8HbLV/cEp2OEsTk5TSCfkE07Mvz54rwo/zUEgnzR7QOWa2DwvcIz3fUfvx2?=
 =?us-ascii?Q?s4xFAQMOp0fIDmQnctHNwilKQbS2uENxhnpyaogMBL05AALbrOl6/Tj4E7DF?=
 =?us-ascii?Q?YvSAEJKBEAczTuMAFsXUjonQ+fxyBQlzPMspuMuWx4PZHD/Gh2Ns7rkAKFYd?=
 =?us-ascii?Q?sn62xaJG0pRGRwQ/7iHX1R2D4CFbiL3KuORQ8CkJDJugibeEoXBug6rtVtrj?=
 =?us-ascii?Q?ixubpvDkMkzCqXmDmRSDjV5jBUeyiKBWvWmA7qh9bI550kpnzakyoUvN7rF5?=
 =?us-ascii?Q?UpMD++WfzSnueEnme7KjzqZj0ncWeHaji2O3QH4vm3xre6TYVpxQNgvQFHXJ?=
 =?us-ascii?Q?EzBRRR2vaqm9aRbC4w2yKmZR2Qfs8gfHkezbe2Zru7p8yKYL3Z3BO2T22ic6?=
 =?us-ascii?Q?KD8KWKzUTh0v/Pz2RxJh4kNws0qZ9RA3w+pwsjVFaM+FOUB9RlBuu5tlX1Q9?=
 =?us-ascii?Q?zicTYRnZoI+0PwIVbTOlGSaJnMtx45kzOIfb?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(61400799027)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 10:35:09.0942
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6889ad5-b6f1-4614-ca65-08ddf1e80c13
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000E9D2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR19MB7010
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEyMDA5OSBTYWx0ZWRfX74getGe7Fkp6
 StKmrOzFqX7//UiWo0eOqQpxTIZh1d+m7qansCq6QMcFCNHoYPXQB9+iWwOnl1ZVURrivot1F0X
 7jcljAG7bOdvllM85kMR9tN9tP/TD1GcS8/3E6q2GbRYjXw0mf9w3f2cnB2HGB21QbdRS3O8f6p
 lUv8ZhOfwyFF3PogAuXK4aQ2CROVYUzTjB/v36t/c86mTmRLVEnqY5nxfpcCL7+PMxLqP7ZQxvi
 mUbRAODwy1nNcp7WXaZgdgeV3bS1wLYa0yPOKrsrXzacoTFZ5ELh0iEibrkU7DZVV7MNtTSVP5+
 nyhewRWJInue2Kvlodcf/Ii+wahDCPDuFQ5zsL9s5R/8aFbift9EVLnKG0sbWU=
X-Proofpoint-GUID: r-rLz97Sz4jSiO3vK-foGfwP88tQnkZL
X-Authority-Analysis: v=2.4 cv=X71SKHTe c=1 sm=1 tr=0 ts=68c3f761 cx=c_pps
 a=CPDyn8ho2KF1l7cSkvawzA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8
 a=dTxlFrGv0okYyNz-srMA:9
X-Proofpoint-ORIG-GUID: r-rLz97Sz4jSiO3vK-foGfwP88tQnkZL
X-Proofpoint-Spam-Reason: safe

The SDCA core processes two different struct device's at various times,
usually it is processing the struct device associated with an individual
SDCA Function driver. However, there are times that it is processing the
struct device associated with the actual SoundWire peripheral, usually
the parent of the Function device.

To ensure this distinction remains clear in the code, rename the variable
when handling the actual SoundWire device to sdev.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

New since v1.

 sound/soc/sdca/sdca_functions.c  |  6 +++---
 sound/soc/sdca/sdca_interrupts.c | 14 +++++++-------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 13f68f7b6dd6..5f76ff4345ff 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -179,11 +179,11 @@ static int find_sdca_function(struct acpi_device *adev, void *data)
  */
 void sdca_lookup_functions(struct sdw_slave *slave)
 {
-	struct device *dev = &slave->dev;
-	struct acpi_device *adev = to_acpi_device_node(dev->fwnode);
+	struct device *sdev = &slave->dev;
+	struct acpi_device *adev = to_acpi_device_node(sdev->fwnode);
 
 	if (!adev) {
-		dev_info(dev, "no matching ACPI device found, ignoring peripheral\n");
+		dev_info(sdev, "no matching ACPI device found, ignoring peripheral\n");
 		return;
 	}
 
diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index 79bf3042f57d..1926c0846846 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -400,7 +400,7 @@ EXPORT_SYMBOL_NS_GPL(sdca_irq_populate, "SND_SOC_SDCA");
 
 /**
  * sdca_irq_allocate - allocate an SDCA interrupt structure for a device
- * @dev: Device pointer against which things should be allocated.
+ * @sdev: Device pointer against which things should be allocated.
  * @regmap: regmap to be used for accessing the SDCA IRQ registers.
  * @irq: The interrupt number.
  *
@@ -411,30 +411,30 @@ EXPORT_SYMBOL_NS_GPL(sdca_irq_populate, "SND_SOC_SDCA");
  * Return: A pointer to the allocated sdca_interrupt_info struct, or an
  * error code.
  */
-struct sdca_interrupt_info *sdca_irq_allocate(struct device *dev,
+struct sdca_interrupt_info *sdca_irq_allocate(struct device *sdev,
 					      struct regmap *regmap, int irq)
 {
 	struct sdca_interrupt_info *info;
 	int ret;
 
-	info = devm_kzalloc(dev, sizeof(*info), GFP_KERNEL);
+	info = devm_kzalloc(sdev, sizeof(*info), GFP_KERNEL);
 	if (!info)
 		return ERR_PTR(-ENOMEM);
 
 	info->irq_chip = sdca_irq_chip;
 
-	ret = devm_mutex_init(dev, &info->irq_lock);
+	ret = devm_mutex_init(sdev, &info->irq_lock);
 	if (ret)
 		return ERR_PTR(ret);
 
-	ret = devm_regmap_add_irq_chip(dev, regmap, irq, IRQF_ONESHOT, 0,
+	ret = devm_regmap_add_irq_chip(sdev, regmap, irq, IRQF_ONESHOT, 0,
 				       &info->irq_chip, &info->irq_data);
 	if (ret) {
-		dev_err(dev, "failed to register irq chip: %d\n", ret);
+		dev_err(sdev, "failed to register irq chip: %d\n", ret);
 		return ERR_PTR(ret);
 	}
 
-	dev_dbg(dev, "registered on irq %d\n", irq);
+	dev_dbg(sdev, "registered on irq %d\n", irq);
 
 	return info;
 }
-- 
2.47.3

