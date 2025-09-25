Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753852F547A
	for <linux-sound@vger.kernel.org>; Thu, 25 Sep 2025 10:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758797664; cv=fail; b=KE6V7qNM8hIRsXIWjPVyHX1elgh1l4UtejRiO2NxWz1BJMTrhHTxUNpmXMHsNI8luzMbRh+T+f3tEVwva2cksl49mJFNY86QpedxyJ7ncbmTFZPsYCjVfE3myn3aONqx+gx2QP3iTqI5ZrxKWuov2pnFKLDuN6kabvt1EENVQeA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758797664; c=relaxed/simple;
	bh=comK6L82qAzMpIALgAor3N9d6fI7SYEGeE9YCymudDE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eXmneEZTvKgh3PEQ+yIbTKbKFOELnQEBwmKtrLm1Z/jjqlBTuFAyjmmY9TYnqX0Ifz0nNTRL9Z2nUHQlUfY6Y8PKZ+Fv10Zdaj6sivfnJGOX2B9pvitfuFKBlub2LVxTDT3SKbTMKZzb6YZUaw7GSxKDKVEUKQNDFqykqe9f/rs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=kOtPUMek; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Vfd7WuCU; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="kOtPUMek";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Vfd7WuCU"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58P4cfHe2734368;
	Thu, 25 Sep 2025 05:53:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=GF8UHzl3NL6nXHKF3VKCO8eIQEIY+kZNKH+2QYEgU/Y=; b=
	kOtPUMekIIkdESREvKwY9jO1adyyJpAejHlLKTFNEKKntvfII7G+O6+tVWtDbFib
	r7I5cE6qXTaQrz+ijGQGC9m/4BkcjZFi2kkxdZe6+/BEsXVCx83Rshf1aJtRX4m6
	IWWfdar5afJDbv6JxbaU3tcgxS2shMEcboQDCzD0XRyyfz0CZ16BI6gXlnVWnAEA
	uxYNLav6Dl5rzJ1UWTUAe74XRTq8xLcvTWK9zLhlV3YIkMSygfaSaeON1sFQ2RgO
	2+GhOBZQ3Fo2EpWjBCeSopsQS53SBwyXsLwk2jxBI9c0JDG24CGU3Ip+vtyZhfxL
	bbjecOdqTGPQXv4jJm7mrg==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021107.outbound.protection.outlook.com [52.101.62.107])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 49cjmds8wy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 25 Sep 2025 05:53:56 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sOywIfw92SLunlFV6FY1bqfFN5Vd6WJfIz1VGw/IZxFAfuW3ODugvDbyqYOKUWmaj36Q668NsQMv5ZhpyHXdDrDodcIJA8j23PPHyFW1CkR1a5PjgFZGL5uxFw0gV7xqwOaBt+vsj4Nh508MmTPfZeraFSX9KebTAlusQYXhzfXRX35FuwExXxm2wBeLxja3tFQlUF3f3jAY32gciCR3AOF91qu+qzrvcaazNtMUR9Fiasa34SaWzdjuz8kN3vYkOdk7E3OiXdmztJXRo33/ngb7NnSuS0WAkToMhYcrBPVGR5WJF45W7kOxRsx6S7o4SH5UIPBrxxQyvnfZzmQzfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GF8UHzl3NL6nXHKF3VKCO8eIQEIY+kZNKH+2QYEgU/Y=;
 b=dC8pCm4aGkvtTttl4wOA4n3QGljAH9agk5xOPrG9kaauMf/PjsrytI1HjSp0GffXpWxQWvB5kew/k9Ds9a9rujRj5QyFSVdjRLrQIdC1o435mGxAOESHujnAjyVkBf4vplxbXJ9uic94BvLDq98DSaKw1RHfZNcDSir4oFBsYzjMz9XF3pJ24blVGvTCy++LbWYczz0RDyUrQMASZ2Ojsgj0aLrmxrE4pfH8j4DUwQ7IfxR7pQQwop9hXjpLXZvvg2wdDHz09Mt049riVkkC0+xz1qBWxL1HkbmxVz/njG6LIFt+FMPSNVzAZG99DAS1DA1wcJszopJV2ydz/Vyf4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GF8UHzl3NL6nXHKF3VKCO8eIQEIY+kZNKH+2QYEgU/Y=;
 b=Vfd7WuCUifBN1od12YSIfyssRQJ/+D8MnA1uR5fagUxhOnf8sacZ3TLoYuYZy2uaeZSvmQ4bYLGRemxc2MdgRp79T4JX8rylEdvUBPDwBBRVzJqJyFF44lcadThZv1nveFQx1iYo6xJpZjpLiFxrgra85sP5vRZk2OgXxkGmv/8=
Received: from SJ0PR13CA0100.namprd13.prod.outlook.com (2603:10b6:a03:2c5::15)
 by PH7PR19MB5583.namprd19.prod.outlook.com (2603:10b6:510:136::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.11; Thu, 25 Sep
 2025 10:53:51 +0000
Received: from MWH0EPF000971E8.namprd02.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::6f) by SJ0PR13CA0100.outlook.office365.com
 (2603:10b6:a03:2c5::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.10 via Frontend Transport; Thu,
 25 Sep 2025 10:53:51 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000971E8.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.9
 via Frontend Transport; Thu, 25 Sep 2025 10:53:50 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 547F6406565;
	Thu, 25 Sep 2025 10:53:46 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 41D6382024B;
	Thu, 25 Sep 2025 10:53:46 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 08/19] ASoC: SDCA: Rely less on the ASoC component in IRQ handling
Date: Thu, 25 Sep 2025 11:53:30 +0100
Message-ID: <20250925105341.194178-9-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E8:EE_|PH7PR19MB5583:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e237862c-cc68-41bd-a729-08ddfc21cfce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IpsjC1XdPMysh8ondcUwAFvBlmAYqNMHxHCy2FTLvCJbaMOgLf5BA0uqouE0?=
 =?us-ascii?Q?y1SYNZ/euyDlPxjz/WTy01qt8z2JziYR8l4udCjqHgJuk1zXZTUAdhoDciNd?=
 =?us-ascii?Q?bBaM118UT/J8t4YGwuo9f6fdgZ/2c6+T4HoJOo2U4Ei17eu/w5aMYGhxA0mH?=
 =?us-ascii?Q?zw6C8aNgY9EnGuPnXHoscBr0CP59tKWk6spBNazE3EHvGEXFVaEbKjk9CCBD?=
 =?us-ascii?Q?C+JdT+98SgD9I/Om38T/0MsnZewG0ncYuDT1+YoX+TWS767+zaJhcNq4DwDy?=
 =?us-ascii?Q?7gKCUoiIzegM7EnI4nxYfiDkvHkJJeVLcY7WASVMhdYqycrq54lHDLx/EjCO?=
 =?us-ascii?Q?dHXQLQDYcH5AIRBIA8fFnO7OUKkHBS0YLJJsofdGb4D7oJKhrX7qp+cA4W7I?=
 =?us-ascii?Q?JM23A+IM0i9FwBlFfpNaXuMIfYxi7fJOnpRC3dZPeTKB332vAyoqCp8CPSgs?=
 =?us-ascii?Q?dgLcaxJUbkKg0Qx+ElADmZWtPhZoCLrm7B4FVuTPd/GuyDeXXo36mCE0eklM?=
 =?us-ascii?Q?kAg/qm4EHGvmo08HqeuGr5iDOIfeilpb8JAKk86u+xFudwRYIkdx0ZAfaInR?=
 =?us-ascii?Q?lYmPS2KgFNj6AWVeD9WeSEYgSvC+YyLd7nkPg+JM7aHWXuJMSBgXnejVIztE?=
 =?us-ascii?Q?RDjEd45HckqZ0T5mXe2Nc1VYrDCSR9+WhNAuPgzUHYVRdEtmGyi0YO/q2z96?=
 =?us-ascii?Q?Z1eMgDVXWO+h6Iuyy3NIPNTRFqW8iJ3DZfUymQ64AVj8qcpJHIGbBg+thjJm?=
 =?us-ascii?Q?KlW/fj9yjEsXJV/5L1xY79e+6jYHFNvAfvBkmedJY2ipA8IJwYrMY5K1uthC?=
 =?us-ascii?Q?5j9Yokh/OO5VZW026zkw1mqxaEc5+aSzJYVaaJpYeOLKFRtnU9BiN0iG7uL4?=
 =?us-ascii?Q?xEXLZ0TAa7NsdAUb3PV3iDe45nmMA7mkxdVYY1j0VtoDhWS9mk0S6d3E2lWF?=
 =?us-ascii?Q?wYM8xRVd35fZn58pbnub2f1LWU3iEAX7J6LDMn97ljRUTQhsZjC/L8iCYVIN?=
 =?us-ascii?Q?kYf0H75UBEO0gTrEzYJZc+dVy4oKYew1wkjnh1xMYnGlOEyDKvoPlSeGlQnF?=
 =?us-ascii?Q?ayzcTShLdguiKNgLSuMdsIAMKOu3axg8Yq9Ff9ReexiB073LPHcll3wfGSqH?=
 =?us-ascii?Q?ukDwsSKBCaVMMdxzJC+8u2PvgPK20uZilX5l/PvDQyNnaWOF2VgqNtcifYQh?=
 =?us-ascii?Q?fJlVf9cY8TbFwfENHYukdEHkCf1Wp8sOFtHAnz2Up8mXT8er1Lgm7x9RpCIs?=
 =?us-ascii?Q?cnMoH4ljA/+WWL2W5TjJdngWF4vU39Bm4mXC9eiGmuNUuOjoUNkFKcS9rF20?=
 =?us-ascii?Q?bSzlum0O6LMIvNZHo+dGuDt+XKg7wpEw2tp43srBrpm9rx2JTU7MQdZj4qUY?=
 =?us-ascii?Q?yUeZKsLS90yEnFMHb51K8r3eLtUwL1mJvDhPeowfldrDASfAd85NGWsMXpyL?=
 =?us-ascii?Q?VerzSsrsr+APIku6O3XTxONU+XmrLe7pMFGviBpvNN++1EO6jVEaKXrTuC7I?=
 =?us-ascii?Q?BmUdRTo2I05kmQwjY8xDCTWaJodjwc3jkUCIh0MIc3iNB8UmREhwbrgBSsjM?=
 =?us-ascii?Q?h6cw4o7HkrNTs5ts3WE=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 10:53:50.3743
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e237862c-cc68-41bd-a729-08ddfc21cfce
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000971E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB5583
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDEwMiBTYWx0ZWRfXwlL9DTHv50wR
 rI0qEaFPI8vSDlSQR/Edo3vPIRUvsQC7AJZDuxbVisWhWtiGapbkoMoEniGfP/wCLUOJONCs1LM
 MscBlxTQmyHps+qq+dflLcXqOaOpXG22m0uYbRvSADvtXtcsNCBBiU1t1vRO548fSCyKiOsmNZ8
 LZ6fg58nROwLMmIsYmuwbbOcyWLsfL8NFhDQNTVvLuGMVp5tfh4FmvFi9fFbG7ouUx8Qt7ZGtuY
 NMl7DlaQIrGCkkS0wunBMEXbB9CP6wdj/q6SE90wrCD6b33kppIw93x2C209pTLV9iBc+R96PUn
 rnA0V7yftbP2tp3TvpVd8JyNLLW5MQA2l5I1v4uwMUPvKCwl+gYlz3tHz/CNCw=
X-Proofpoint-GUID: 7K5BM77tQxkY740e6nr58ChOSTm2P9Zw
X-Proofpoint-ORIG-GUID: 7K5BM77tQxkY740e6nr58ChOSTm2P9Zw
X-Authority-Analysis: v=2.4 cv=ap6yCTZV c=1 sm=1 tr=0 ts=68d51f44 cx=c_pps
 a=+HJImzcKfBiIxAXIXfD3UA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=QyXUC8HyAAAA:8
 a=w1d2syhTAAAA:8 a=TB0_WRDuyzPla43S73cA:9
X-Proofpoint-Spam-Reason: safe

In the future some IRQs (mostly the UMPs used during File
DownLoad) will need to run after the device has enumerated on the
bus but before the soundcard is actually constructed. As such
refactor more of the IRQ handling to use raw device and regmap
pointers, rather than accessing things through the component.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v2.

 include/sound/sdca_interrupts.h  |  7 +++++-
 sound/soc/sdca/sdca_interrupts.c | 37 +++++++++++++++++++++-----------
 2 files changed, 31 insertions(+), 13 deletions(-)

diff --git a/include/sound/sdca_interrupts.h b/include/sound/sdca_interrupts.h
index e4bf123936bbd..3983f515349ad 100644
--- a/include/sound/sdca_interrupts.h
+++ b/include/sound/sdca_interrupts.h
@@ -23,7 +23,9 @@ struct sdca_function_data;
 /**
  * struct sdca_interrupt - contains information about a single SDCA interrupt
  * @name: The name of the interrupt.
+ * @dev: Pointer to the Function device.
  * @device_regmap: Pointer to the IRQ regmap.
+ * @function_regmap: Pointer to the SDCA Function regmap.
  * @component: Pointer to the ASoC component owns the interrupt.
  * @function: Pointer to the Function that the interrupt is associated with.
  * @entity: Pointer to the Entity that the interrupt is associated with.
@@ -35,7 +37,9 @@ struct sdca_function_data;
 struct sdca_interrupt {
 	const char *name;
 
+	struct device *dev;
 	struct regmap *device_regmap;
+	struct regmap *function_regmap;
 	struct snd_soc_component *component;
 	struct sdca_function_data *function;
 	struct sdca_entity *entity;
@@ -65,7 +69,8 @@ struct sdca_interrupt_info {
 int sdca_irq_request(struct device *dev, struct sdca_interrupt_info *interrupt_info,
 		     int sdca_irq, const char *name, irq_handler_t handler,
 		     void *data);
-int sdca_irq_data_populate(struct snd_soc_component *component,
+int sdca_irq_data_populate(struct device *dev, struct regmap *function_regmap,
+			   struct snd_soc_component *component,
 			   struct sdca_function_data *function,
 			   struct sdca_entity *entity,
 			   struct sdca_control *control,
diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index 2b3bb7d0cb443..d0894c8e0552c 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -77,7 +77,7 @@ static const struct regmap_irq_chip sdca_irq_chip = {
 static irqreturn_t base_handler(int irq, void *data)
 {
 	struct sdca_interrupt *interrupt = data;
-	struct device *dev = interrupt->component->dev;
+	struct device *dev = interrupt->dev;
 
 	dev_info(dev, "%s irq without full handling\n", interrupt->name);
 
@@ -87,7 +87,7 @@ static irqreturn_t base_handler(int irq, void *data)
 static irqreturn_t function_status_handler(int irq, void *data)
 {
 	struct sdca_interrupt *interrupt = data;
-	struct device *dev = interrupt->component->dev;
+	struct device *dev = interrupt->dev;
 	irqreturn_t irqret = IRQ_NONE;
 	unsigned int reg, val;
 	unsigned long status;
@@ -103,7 +103,7 @@ static irqreturn_t function_status_handler(int irq, void *data)
 	reg = SDW_SDCA_CTL(interrupt->function->desc->adr, interrupt->entity->id,
 			   interrupt->control->sel, 0);
 
-	ret = regmap_read(interrupt->component->regmap, reg, &val);
+	ret = regmap_read(interrupt->function_regmap, reg, &val);
 	if (ret < 0) {
 		dev_err(dev, "failed to read function status: %d\n", ret);
 		goto error;
@@ -136,7 +136,7 @@ static irqreturn_t function_status_handler(int irq, void *data)
 		}
 	}
 
-	ret = regmap_write(interrupt->component->regmap, reg, val);
+	ret = regmap_write(interrupt->function_regmap, reg, val);
 	if (ret < 0) {
 		dev_err(dev, "failed to clear function status: %d\n", ret);
 		goto error;
@@ -151,8 +151,8 @@ static irqreturn_t function_status_handler(int irq, void *data)
 static irqreturn_t detected_mode_handler(int irq, void *data)
 {
 	struct sdca_interrupt *interrupt = data;
+	struct device *dev = interrupt->dev;
 	struct snd_soc_component *component = interrupt->component;
-	struct device *dev = component->dev;
 	struct snd_soc_card *card = component->card;
 	struct rw_semaphore *rwsem = &card->snd_card->controls_rwsem;
 	struct snd_kcontrol *kctl = interrupt->priv;
@@ -190,7 +190,7 @@ static irqreturn_t detected_mode_handler(int irq, void *data)
 	reg = SDW_SDCA_CTL(interrupt->function->desc->adr, interrupt->entity->id,
 			   interrupt->control->sel, 0);
 
-	ret = regmap_read(component->regmap, reg, &val);
+	ret = regmap_read(interrupt->function_regmap, reg, &val);
 	if (ret < 0) {
 		dev_err(dev, "failed to read detected mode: %d\n", ret);
 		goto error;
@@ -209,9 +209,9 @@ static irqreturn_t detected_mode_handler(int irq, void *data)
 		 * detected mode is unknown we need to see what the device
 		 * selected as a "safe" option.
 		 */
-		regcache_drop_region(component->regmap, reg, reg);
+		regcache_drop_region(interrupt->function_regmap, reg, reg);
 
-		ret = regmap_read(component->regmap, reg, &val);
+		ret = regmap_read(interrupt->function_regmap, reg, &val);
 		if (ret) {
 			dev_err(dev, "failed to re-check selected mode: %d\n", ret);
 			goto error;
@@ -309,6 +309,8 @@ EXPORT_SYMBOL_NS_GPL(sdca_irq_request, "SND_SOC_SDCA");
 
 /**
  * sdca_irq_data_populate - Populate common interrupt data
+ * @dev: Pointer to the Function device.
+ * @regmap: Pointer to the Function regmap.
  * @component: Pointer to the ASoC component for the Function.
  * @function: Pointer to the SDCA Function.
  * @entity: Pointer to the SDCA Entity.
@@ -317,21 +319,31 @@ EXPORT_SYMBOL_NS_GPL(sdca_irq_request, "SND_SOC_SDCA");
  *
  * Return: Zero on success, and a negative error code on failure.
  */
-int sdca_irq_data_populate(struct snd_soc_component *component,
+int sdca_irq_data_populate(struct device *dev, struct regmap *regmap,
+			   struct snd_soc_component *component,
 			   struct sdca_function_data *function,
 			   struct sdca_entity *entity,
 			   struct sdca_control *control,
 			   struct sdca_interrupt *interrupt)
 {
-	struct device *dev = component->dev;
 	const char *name;
 
+	if (!dev && component)
+		dev = component->dev;
+	if (!dev)
+		return -ENODEV;
+
 	name = devm_kasprintf(dev, GFP_KERNEL, "%s %s %s", function->desc->name,
 			      entity->label, control->label);
 	if (!name)
 		return -ENOMEM;
 
 	interrupt->name = name;
+	interrupt->dev = dev;
+	if (!regmap && component)
+		interrupt->function_regmap = component->regmap;
+	else
+		interrupt->function_regmap = regmap;
 	interrupt->component = component;
 	interrupt->function = function;
 	interrupt->entity = entity;
@@ -394,8 +406,9 @@ int sdca_irq_populate(struct sdca_function_data *function,
 			else if (!interrupt)
 				continue;
 
-			ret = sdca_irq_data_populate(component, function, entity,
-						     control, interrupt);
+			ret = sdca_irq_data_populate(dev, NULL, component,
+						     function, entity, control,
+						     interrupt);
 			if (ret)
 				return ret;
 
-- 
2.47.3

