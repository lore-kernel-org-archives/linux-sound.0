Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FF22765C5
	for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 15:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760975755; cv=fail; b=DmmvUveIJeIpyilufs71bpj7iznqdnfSwW80kaXMUMCRqTkLHYJxlV3A7CPlFBhk1p1o3YCx/pwqE7ZFhmkyQ4cUab/AraTtQvmt02Ittek5ENMCUW7Asau6/EYZ+94KLSfFTm5XsTAaKrC/THv8zC51N+N9ItcDVtwBCf2KJfQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760975755; c=relaxed/simple;
	bh=/3iGu4i4K4L7DBUK+CQL87/utUA9vu0DXzLS88FT4CY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jJux/2aeerFaLqJq2iqyjeserXeaHeMyNYljpDjaikT/el+ofXbGXJcDBb7MaTcNM7t2KSN9aWj4Qy6irKuCcmLjwTOI5dH3RRv91z901aYsQd73W3j84Kkxxp/H6LnvCw6dc+wEwacPjEadtAWTcyLBRZJBTY8MuT9VdSwixfc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=RwgtA8Te; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=A0H/eM6L; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="RwgtA8Te";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="A0H/eM6L"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59KEAnlP941629;
	Mon, 20 Oct 2025 10:55:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=XLbaswBk5Lk4q5HkX4cLQxDYUHVpldgD4b0DwxyX/ws=; b=
	RwgtA8TeBrzoB4AFquXk1Ocmfxh2vkYB/rxfYpRDOGtpO1DTLvrFDWL8EDZbQKRy
	8wUxeXdLRUCZ2ORyrmK5v8LllL4PoUIZceoOA0t/41VA2/pHcxP5bBdZUlDgK/UW
	scqqFrlg27ZmSFVC3GiQtzfJIzbMtBq3+3B4MGJAAQ14WTkBI8nNLEyNUr4NaQku
	dqC8sHREJYc6LH7b/D3quTw8ng/YackmCqBtuGeQ4lF90pspz2SVOg/E+vmXyoyE
	g5b8dtTRscrObbA1q96gXQc1KFgQWG7wCWvVOp9U/ZWAFjmkQMawBLvhyTRJn1mJ
	SwyOQmOKzUJRVDZ7fj6z7Q==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020117.outbound.protection.outlook.com [52.101.46.117])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 49v7aj2aeu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 20 Oct 2025 10:55:29 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e2+jL1ijYUJPpdp276Pxp2s/NKZdbVldSOwUQONlp9tvgfE4CevuXa3HP35Nc1I22GHVTXCchv3uW26hBEYELE1IKdbPJSM2Pwa8e9mSLFCgGqyKNmrn1S0WCioWSfMCbgrWRZFBhM2OyKx+O+EBa3cW2CYCa7oqlVKGg9e0ivyejCZJO4+kQu2fQ19Sw7+Gb7GFEOe8JNy5VbdZFBGRoQj8McwsIx522d4dHwIteQkmxcQuWeZlvxM9Rjtt0Afom+3MniliCfgknDo8IM7XWeFaiRmFDCQmWbWMak9ZKTyV18tY9UP9iBZsksAvT3bYdYgUv61UgZmhBygMYkZfhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XLbaswBk5Lk4q5HkX4cLQxDYUHVpldgD4b0DwxyX/ws=;
 b=X/W222T6B4wDOvqcVJnjbHpIfAPtM4lZrjujuUrPnZ2R79cDYhymy8y6tkUzhmVyXjY1AendUdkt6+++VHe92xHf7JSSe89jg7wDipNXhnzw0sULVmB1RZ/v5JV98RTC7xSdDo3XoX1oydE54UlqqUAg3qGc/18M8Ml2f4hUi9sgnXCpTASDiWTE5I1R2fucQy+9xJOpCMlCfew4xEN0H6SzApVo3na3f25A3d8WXlnhtcOeFFAIK7KJrLaTCfp2hOaHDSaUlvw6yZ2pq770GRpHiNCbQw115iz7T2MQxjNs//+wGoFTUI5fr5SkjHQ6Fe8o6pyVZgKPfg9PbNoZiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XLbaswBk5Lk4q5HkX4cLQxDYUHVpldgD4b0DwxyX/ws=;
 b=A0H/eM6Lu7MnyxOqwTzixlPUNB/f4ZqhL6rMrQQX+I4mYuy4F3dvclWeDti8R9dFG5LcgrmaskQ0L8E9TvCrhOudqPbady+T8z1VP5Ey4U+GsH5CvK0GLzZto2H5DTsYZzUIT9GqSopl9iruAUrS4MvW0DT4Bqm39snSKnEtwvM=
Received: from BY3PR04CA0003.namprd04.prod.outlook.com (2603:10b6:a03:217::8)
 by BY1PR19MB7823.namprd19.prod.outlook.com (2603:10b6:a03:533::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Mon, 20 Oct
 2025 15:55:24 +0000
Received: from SJ5PEPF000001CD.namprd05.prod.outlook.com
 (2603:10b6:a03:217:cafe::71) by BY3PR04CA0003.outlook.office365.com
 (2603:10b6:a03:217::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.16 via Frontend Transport; Mon,
 20 Oct 2025 15:55:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001CD.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7
 via Frontend Transport; Mon, 20 Oct 2025 15:55:24 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 029A840664C;
	Mon, 20 Oct 2025 15:55:18 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id E5DE4820244;
	Mon, 20 Oct 2025 15:55:17 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        peter.ujfalusi@linux.intel.com, shumingf@realtek.com,
        lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 RESEND 18/19] ASoC: SDCA: Add early IRQ handling
Date: Mon, 20 Oct 2025 16:55:11 +0100
Message-ID: <20251020155512.353774-19-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251020155512.353774-1-ckeepax@opensource.cirrus.com>
References: <20251020155512.353774-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CD:EE_|BY1PR19MB7823:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9b51cf40-dd6c-4e96-4273-08de0ff114e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9eG8MhAgmUAsnLvTpKqVZlnitt+Jorccd2R+gRGOJVeHdvms3W+QNV9S9HPy?=
 =?us-ascii?Q?vEHiwsv+8kRUuFt5/WesxcXHa+d84t7eDt+G/dnb93TIaazvzUMIfp8AC+Y0?=
 =?us-ascii?Q?fMnRm/1ff04t+a2u+ss5kugI4Sv0uWgcdkV0QtmH20hzP/E1mDu5olf99XIv?=
 =?us-ascii?Q?+4Ujc7FOS++Boyh0605JTbbmX/GP800DPS7NKbkXYTOeRqZZniUjsTD+6wLD?=
 =?us-ascii?Q?RaqCL/hhAmqg8hKLXph/AXZqLyc0bTLI7oosetuNIeKe8ZyaxuhxGwUcfywc?=
 =?us-ascii?Q?BD/NApCEsLUrWE13PLXN6NWqHTik2CKsfMEQ/xu7SuHiwMnue6cJbzarzXom?=
 =?us-ascii?Q?wmUP5tals1j0jO6ipTO4zpCMfUBCNsKgWmMFYiqApnfmDXxmui81yY30VrGO?=
 =?us-ascii?Q?eWaOXGXf6Zgxkk+UYh+rhnX7LwigkvGQG/QN1Umy8gZ+6Oymq8m0juEBr/Ad?=
 =?us-ascii?Q?cp4t5A+wPZc1xLvPC8G9EV/Ordth030hZsYjDR8Gfj/BM/RMZjXnFhPeD+68?=
 =?us-ascii?Q?z6rtnjuh9f7FhNT24iXaKqSkcTIFueHKAuKs49gKsqY9NFMrZOG2gAiXl+gq?=
 =?us-ascii?Q?9drK3DbTHV//ERcoznlwKgornGRIYs5IRjXaqs/rT8M2GeLzcdjESPEBEdji?=
 =?us-ascii?Q?dsrjEaq4Ft6adel60pv+9cYIPJqRoTnuq7qeW9fpEJ86zdBv6xOicyMyDCCu?=
 =?us-ascii?Q?iXpihIsFo9bYn5q1NlHZhNNr824VJkOZicFVWTTbUXYwEPrSORjA3WqcddF1?=
 =?us-ascii?Q?NCnZCh1cb03chUqfPzT2p4BFuixVPcoaLDswVHFdh3cmb95iOf/Fc4sy4Vdv?=
 =?us-ascii?Q?AAurCCg9W4pZ/yLvSatCLJjZSTCcOeVQg1YlQtoiGt5x66J4e5a7k7/H76tZ?=
 =?us-ascii?Q?nLCtrQnt0F/nBbacfyZ2I/rTX2gfpWPSOdTKw8Nx1UAZ+8YUADsuVOCuAID5?=
 =?us-ascii?Q?Grm9ibq/pQ+hyT/mJeOnO84Ey9TUt2LrYbRZmW8ae9C7MR8TA6/ZKU/X5NaQ?=
 =?us-ascii?Q?lqTXkQkKQq7/j68onwvf0P0KGSuHP+ngtAy975jHn7Fu5uiIhUqBpXZCWE1t?=
 =?us-ascii?Q?0SOPdxDknNdAE19qWSkK8yFbFTUxpfrzbjjrfv8pa7sme0O+f9XKt3XNYaO8?=
 =?us-ascii?Q?PC07Uev2Dl+fQNziTuFtMg811J1P9S/PzLE9tKIj6qMqVdubDGtXpPHNrHyY?=
 =?us-ascii?Q?/9t02svSEXL+pnlR5ghJYgBn6c7NGZtO4KnYmbx651p/3aMu2kf9Y5Zydoej?=
 =?us-ascii?Q?YX3dDgkkIcq37qdP1XQqR236sapiaHzlZXLJyJhzgPBGx8oWDIYtKxNGkFqP?=
 =?us-ascii?Q?XcfTgKrWUfkHaEtBYeQPQ4HJEo4nqM/6HL2SjXOD24yKC+ck5FiEN94X7NVf?=
 =?us-ascii?Q?sla4k/Pulv9sr9KUvX3gtWsYto5PWZWpLYhHU1iScYMWTQCiTW5YQXiykznV?=
 =?us-ascii?Q?cYjbOBN0raRh8PEufafIbTI1bPFoD9UImJystsCbXs2mZrRfpciAYXIwo+FL?=
 =?us-ascii?Q?XnVi6nzV9SqaXG5osTAvwwTPcTwG3jw0R19oHZrHMR2+6caiq08a4dRZVOju?=
 =?us-ascii?Q?tkTpsOMYAKBfToUVIcY=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 15:55:24.2209
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b51cf40-dd6c-4e96-4273-08de0ff114e9
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001CD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR19MB7823
X-Proofpoint-ORIG-GUID: 99Gwndv6xtvS3HT8KNO6cDYQOXzfmQrX
X-Proofpoint-GUID: 99Gwndv6xtvS3HT8KNO6cDYQOXzfmQrX
X-Authority-Analysis: v=2.4 cv=bdNmkePB c=1 sm=1 tr=0 ts=68f65b71 cx=c_pps
 a=RrdOQlmmxp+bQeXV/0G7LQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=x6icFKpwvdMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8
 a=QVwGPAhPMYaFeXMKfhcA:9 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDEzMSBTYWx0ZWRfXw1xVolqgZVyf
 k/sxKHuonVFSwQDvnWn83VOM/HJWV7nfRjnlSUIF21psB12x2Vwt+4zjjoguEdujJfzhayNc9ds
 sSXAdWP1S/tMn51L6KjIy9YChsfmMZZzYulDUGQQQsdxmCZLsu+s8kiiejFIXp0delK9VJ4sWdZ
 95snzaXCvyPUhYWTkPKXmbgYwo7KGl4WeFToQ9V/iJgHQzqk3wnkKjpuiSCAL5AoDBx3Uj9psW3
 VBuG3Hef9G2qljYwoVrRS33YRSSVOPhBuo3woDKUNzjLo7PAnnTteu6ArOe9NJeYRdENZCWuRWf
 xoyfTsvL+70onMdOiuak3A8MujpsNUx83S3bgIfEtNxUPPsxQuiupYNOLY3bkfeMroGBJroeN5m
 5D9zXv1eV5XC034wLGdfZ9MF7NrI5w==
X-Proofpoint-Spam-Reason: safe

Some IRQs (FDL) require processing before the primary soundcard is
brought up, as the downloaded files could be firmware required for
operation of the audio functions of the device. Add a new helper
function which registers the required IRQs.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v2.

 include/sound/sdca_interrupts.h  |  3 ++
 sound/soc/sdca/sdca_interrupts.c | 71 ++++++++++++++++++++++++++++++++
 2 files changed, 74 insertions(+)

diff --git a/include/sound/sdca_interrupts.h b/include/sound/sdca_interrupts.h
index 3983f515349ad..8f13417d129ab 100644
--- a/include/sound/sdca_interrupts.h
+++ b/include/sound/sdca_interrupts.h
@@ -75,6 +75,9 @@ int sdca_irq_data_populate(struct device *dev, struct regmap *function_regmap,
 			   struct sdca_entity *entity,
 			   struct sdca_control *control,
 			   struct sdca_interrupt *interrupt);
+int sdca_irq_populate_early(struct device *dev, struct regmap *function_regmap,
+			    struct sdca_function_data *function,
+			    struct sdca_interrupt_info *info);
 int sdca_irq_populate(struct sdca_function_data *function,
 		      struct snd_soc_component *component,
 		      struct sdca_interrupt_info *info);
diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index 3a3b966b5782b..51342b8aacae9 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -396,6 +396,77 @@ static struct sdca_interrupt *get_interrupt_data(struct device *dev, int irq,
 	return &info->irqs[irq];
 }
 
+/**
+ * sdca_irq_populate_early - process pre-audio card IRQ registrations
+ * @dev: Device pointer for SDCA Function.
+ * @regmap: Regmap pointer for the SDCA Function.
+ * @function: Pointer to the SDCA Function.
+ * @info: Pointer to the SDCA interrupt info for this device.
+ *
+ * This is intended to be used as part of the Function boot process. It
+ * can be called before the soundcard is registered (ie. doesn't depend
+ * on component) and will register the FDL interrupts.
+ *
+ * Return: Zero on success, and a negative error code on failure.
+ */
+int sdca_irq_populate_early(struct device *dev, struct regmap *regmap,
+			    struct sdca_function_data *function,
+			    struct sdca_interrupt_info *info)
+{
+	int i, j;
+
+	guard(mutex)(&info->irq_lock);
+
+	for (i = 0; i < function->num_entities; i++) {
+		struct sdca_entity *entity = &function->entities[i];
+
+		for (j = 0; j < entity->num_controls; j++) {
+			struct sdca_control *control = &entity->controls[j];
+			int irq = control->interrupt_position;
+			struct sdca_interrupt *interrupt;
+			int ret;
+
+			interrupt = get_interrupt_data(dev, irq, info);
+			if (IS_ERR(interrupt))
+				return PTR_ERR(interrupt);
+			else if (!interrupt)
+				continue;
+
+			switch (entity->type) {
+			case SDCA_ENTITY_TYPE_XU:
+				if (control->sel != SDCA_CTL_XU_FDL_CURRENTOWNER)
+					break;
+
+				ret = sdca_irq_data_populate(dev, regmap, NULL,
+							     function, entity,
+							     control, interrupt);
+				if (ret)
+					return ret;
+
+				ret = sdca_fdl_alloc_state(interrupt);
+				if (ret)
+					return ret;
+
+				ret = sdca_irq_request_locked(dev, info, irq,
+							      interrupt->name,
+							      fdl_owner_handler,
+							      interrupt);
+				if (ret) {
+					dev_err(dev, "failed to request irq %s: %d\n",
+						interrupt->name, ret);
+					return ret;
+				}
+				break;
+			default:
+				break;
+			}
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(sdca_irq_populate_early, "SND_SOC_SDCA");
+
 /**
  * sdca_irq_populate - Request all the individual IRQs for an SDCA Function
  * @function: Pointer to the SDCA Function.
-- 
2.47.3

