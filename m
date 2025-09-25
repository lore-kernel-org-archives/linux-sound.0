Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A1A2F5A0D
	for <linux-sound@vger.kernel.org>; Thu, 25 Sep 2025 10:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758797662; cv=fail; b=ZG36/m+TTCqEDI6JMQXMzAxPDAhUw+HaUp9n8IB/fElP15UwW1PeUN9+TiDLiL/36BPEvxsDzFLhL8zss1TpbIIQyFoDdDJRyBSQsI5DN+3XR2nlKrJnMqhVpDumOM5i8JqsRsN78jWCPeKdII0s+ijmM8nlCGPbmnttAlc3imU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758797662; c=relaxed/simple;
	bh=/3iGu4i4K4L7DBUK+CQL87/utUA9vu0DXzLS88FT4CY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rWr3lhrm28erRd3xA1qx0XEWj5Awa7paIaXGVf7HoHi0BWwSZuNwHcb7Td+gqUt4MVEG1KpQEjXtsdzjzfgzI69fIuUrpKFhdu66sDi+4haFvXvGhEavA9utriB5akUhZs6YIss4YGgEROiTZS6wD2O8CQIMkjoYX62RhQOA2YY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=LLwdTydf; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Mtf23ld0; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="LLwdTydf";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Mtf23ld0"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58PAN0u51391147;
	Thu, 25 Sep 2025 05:53:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=XLbaswBk5Lk4q5HkX4cLQxDYUHVpldgD4b0DwxyX/ws=; b=
	LLwdTydftKSfyZb7fDFQk3seI0HjCaYpToD9uWKIYR1Q3SxZUyOsTOGlm1rNkqEQ
	jEn0ovtRH81z+S0b1Duc9fJ/6xoGrKRYQ7ILdqmYNKNFA51dzXNAXYOCvxR6xMLo
	lHK/G4l2opo/oaGhrqlsQi7Cqi4CXWnSl2YDa92HHImzYvk1g2yejfsMrmYwONDV
	BUKaZyKrPdjdja6ktDSGbZKUg+tKj6iu3+hgxpLKWAu6ChgeBUlJ+QoHND/uUuRI
	GYUugRcTJPFpPDfAyTdBirTgbaHXPH3M8kVCmjOxhMDrhrfRq/koof/4EN/RnJWx
	Q3bn5Zv6v/eWW0h4NW/lAw==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020103.outbound.protection.outlook.com [52.101.85.103])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 49cjmds8wx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 25 Sep 2025 05:53:55 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tYQ0RIUjwaCbADvq5CgJIhW8eg7Va8tfgcnPDMzm/XIUaOT9TMvCn7ZKSCx6gccEMSTnaxUF1I7n2moxyhJehpT8ewazr5Y05dPAdehsBka8Zd1wHcAa0GWc5UzkHCmXKbfUwJMlHDmkaPgzSbYJ/lwyWTTpHxJv4Sx6d3FZbjbFmKYp7OlKX8bg84CWW21Moz2NB0MEUlwKOg69Nwq3aYd+3Ve0a55+dIMTqfxalmQEgv3e39O6reB8ZhT3cW57jaiq4Ga8KQKkXqYD01qf40eJO1One+/oN6b5hOEnci5dFjTW+bxebYQgFrER5TNX989VVuus2BycwJPZxPqmXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XLbaswBk5Lk4q5HkX4cLQxDYUHVpldgD4b0DwxyX/ws=;
 b=o9xSvAH3PpcX5gTfthp1wJjcHh/PJx2cUl2NEpXUcUZ8uiQAHMBg2g+8ZpPvNzwVRovBDfI3WWMVfvV+XifPaKCBsQBApYU6H6N5KYxrhgcEh3hPsPqw6cp27d2SJAESJNEPFxTj+oOubjARKnERzg7Z0IFuy4b3YfUq8AVSt0Gc9m85PXzj3C+BfcXBGuzqi7Im9KVFcqq+PBb9it5/sN/AjA6r6s0c5SL39SjD0SZ/43sBTsP81arVIVXOKYVXysB8KAwuF6Bps2KG25Tp8Ga59uODemI+4cz3B093m2+h1Nnj/RQkzxLCwP8gBe70rIFPFt3G/LFphBNoXCL2Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XLbaswBk5Lk4q5HkX4cLQxDYUHVpldgD4b0DwxyX/ws=;
 b=Mtf23ld0e9gMm3754/VXjOB++BnNCVEp6PL2kol+9qVfqzmCVQNyTjowTmn0s3KyoTdtoJj/fKOThjvBnqJLX29jaXtnXApFJrnJTzrXScM6DwnyM3SXHXnqqDEZ9ovbTZXFyHOr7aPw9UYy/A+hxCIzqA8Blak9ae7EKrTyAXs=
Received: from BN9PR03CA0947.namprd03.prod.outlook.com (2603:10b6:408:108::22)
 by DS3PR19MB9632.namprd19.prod.outlook.com (2603:10b6:8:2df::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Thu, 25 Sep
 2025 10:53:52 +0000
Received: from BN1PEPF0000468C.namprd05.prod.outlook.com
 (2603:10b6:408:108:cafe::cd) by BN9PR03CA0947.outlook.office365.com
 (2603:10b6:408:108::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.11 via Frontend Transport; Thu,
 25 Sep 2025 10:53:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN1PEPF0000468C.mail.protection.outlook.com (10.167.243.137) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.9
 via Frontend Transport; Thu, 25 Sep 2025 10:53:51 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D266640664D;
	Thu, 25 Sep 2025 10:53:46 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C8FD982024D;
	Thu, 25 Sep 2025 10:53:46 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 18/19] ASoC: SDCA: Add early IRQ handling
Date: Thu, 25 Sep 2025 11:53:40 +0100
Message-ID: <20250925105341.194178-19-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250925105341.194178-1-ckeepax@opensource.cirrus.com>
References: <20250925105341.194178-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468C:EE_|DS3PR19MB9632:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c2205707-ce38-4aa8-b470-08ddfc21d099
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KOm1YK7b7lfYqGjEbDgPnqtCpc27vsECwC38hy3/41sGvDw2VUVdaz1LlZ58?=
 =?us-ascii?Q?/pMK/zXmNC/o3srt03IUqbA5TFTjAnGOdxpAQgCo8szqlsR9SjLck2DQv57a?=
 =?us-ascii?Q?YVUs+xzZIXVidJcWO0bKuxwqAhUO1UvQCthfE7MjPtgscNpXNVv7yfp9plsR?=
 =?us-ascii?Q?R5e57WSodXFJ3CxeqWwurJqb5/KjObkOD0UwLmS/CSQDCuh8bMzsgnoJDrwD?=
 =?us-ascii?Q?GEGHkDdWRfXcvAih5LblvA8LxwZ/11RpBh0sJQSRiM8yulgdfjITjfZRpoyT?=
 =?us-ascii?Q?bFobbg8aliYbswgiishP6jymO2FuD3+7ppy4/mpGTQ7wcldJQy0XbRUR3YZR?=
 =?us-ascii?Q?9Gz0gSxk+wAryApx7FNg3AnzCozEgsoEAcv0TzdETpyD2cDW1T8NG/sDRZGw?=
 =?us-ascii?Q?85j9qqnHElIYyU5dmJV4Scqc+S0bmCaiJTibvJiHx0nb63kBFReLJ8eL0mOc?=
 =?us-ascii?Q?LKiEeQ4G2qFWHFjlxhyie4VLlWAZrKdplF1OBmmimrpGHX2aqSBaKjtaPsGJ?=
 =?us-ascii?Q?FXzKjJb8wJzvmo4lLn/QJf1Wa4XGoCQ8C5CQcPN3GKUrmScdcP7hVCulJ14K?=
 =?us-ascii?Q?Gu5H3jwtzYu94WdEtRIdZe7Dqf+6QhMkYrUgpMPooF6mh/Ho4smcZcOYPHk5?=
 =?us-ascii?Q?pc0hV5HgHPoIrgOavgp+Q21Kg70vXfQbq/lubbs5iZqeprtUPcdiD/GhLq9N?=
 =?us-ascii?Q?U3LELqjb1u41lIEsxN0E7RD58pbnNesY5Mei7tC/iOczPqB7WOUcCHnZ97L2?=
 =?us-ascii?Q?RPnw+SyzRBSkyxQinsOl3l+wYvG5pwRI1sK0nWRp6bpUMvXtcGjfjM9NE1Br?=
 =?us-ascii?Q?YDqrkWyycEpzN0XxXE9XuJn1c3e0/iJSIcJrjuU4jv2pu2Y3Dg0Y6vqgTBYm?=
 =?us-ascii?Q?jTwed0Qhd5PQDTHI6gb5v1TCEzqGWOSnMoz+OgGskaBYS5HiXC48vMsD4fkH?=
 =?us-ascii?Q?f6SjpLOHvdmGBFHV4WXShetGrNWuEmeU4oTHcf2NODV9AD/4jeDzApO+qBuC?=
 =?us-ascii?Q?AeRzuN3ftgxWfkvyuzsXWXjOB+TwzK3MzKzd1fS/Hopl+wh0DddFWjK2HxZm?=
 =?us-ascii?Q?/Sa+G93rXzoj3ENzPjWM5nT+4Y5e5LAEWNYnakzMh5YTZrBvsJB0fYk461E6?=
 =?us-ascii?Q?K3hJVX7YDw9NyVmWVpTlXQ4S7kwHRH1BaDXgb8hKmTktDoaudcEjzKB9gtWz?=
 =?us-ascii?Q?GRu/GNtxsng7Te5Q0QxoSxf0wXbPCkGe3G9rZFRvpZARenvPb6/k3TUNL3dj?=
 =?us-ascii?Q?ShwW4NCJWXLXSUyvUaU6R74uCLuyClqZ6EcXbAczwe4VvWAFLDH/dhKw5tn8?=
 =?us-ascii?Q?XrwYnP4RiPyblrcM8+7C1+RsZhNetxb+cLpCZ+FkbizZvH23JJUcGgq3cekC?=
 =?us-ascii?Q?DREdOFaap7TzlYsyiM46uD7Lk4H3SuUyOLVgSS8JjvMFZhyZ0iTsu7aV/qRz?=
 =?us-ascii?Q?l7N6H9mZ8cvHgH0vTn1oBTlPBJGoy5xpGq9sCXp2D6j+Otv05KCict9IsNAt?=
 =?us-ascii?Q?qBzp3RsWvOmJjuZoHnA9y3+k4SFMg5hMxmPl?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 10:53:51.8179
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2205707-ce38-4aa8-b470-08ddfc21d099
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF0000468C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR19MB9632
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDEwMiBTYWx0ZWRfX8aPGrWKjqwEp
 o7ohzXffNVSw7lW6CTd6gpx7OUi6fqp0xOGJ/GTlvJj+FMz0msRt4RoqyNaA6gr5pNsnEifWNlq
 2x8a3YYosQNi8CIcdwm1eRZ/dLTV82R0gL+CSWiFup9M8PICXmbrUPcQ0YV1pz0OVVKE5gATJ7G
 1NfDutpxmDRbeV1LEc4XG+F3HBROq2MyMu8Q6b2YFwKTiWYGUl91drEKHBehTNX/5aZnH8FbpDr
 fw7bftsM+6X1ilQhey7aHyPP1xbh/3ayOaJvr8BHXiDNnqGUsEm8QA7QMpQ1cromOCTAVY0pcvi
 qTuy1QJ41HEepETZMLHRhj1Wgy0nB4gwVUBsHwSEd/I3RqxTke3LEo5eM2EefI=
X-Proofpoint-GUID: SqLHQ6W66KnP-3sswINSkAfczIsxSJ9A
X-Proofpoint-ORIG-GUID: SqLHQ6W66KnP-3sswINSkAfczIsxSJ9A
X-Authority-Analysis: v=2.4 cv=ap6yCTZV c=1 sm=1 tr=0 ts=68d51f43 cx=c_pps
 a=/LfXjj9SJEtuRzurF2V9tA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=QyXUC8HyAAAA:8
 a=w1d2syhTAAAA:8 a=QVwGPAhPMYaFeXMKfhcA:9
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

