Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342222571C2
	for <linux-sound@vger.kernel.org>; Mon,  9 Jun 2025 12:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749472805; cv=fail; b=L009KmBz7TpN7hp/31nh1f+J6wCg8RJ1Hy4kKeMGVH89bQZSDV4kNXZhU5jPOWmlr6w8DmvrE7T/4HbxmkCRfGRp2UILV7XI2iMa2uYAOmZ0BvQlCOzXGuw2rZB9kN31bPIe79tZYb0dAE4gIAUrL1Ra2umcRICW4k4j875tXnM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749472805; c=relaxed/simple;
	bh=/5EB/lldmicAO9O5VZzi9kJnOUVm33zdWkHeAjPRxLU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LRsAuQM7zJON/Sa5vn9wPjOFr3mYJDH48gl5ankbObseWPeorNW0YpdX+7atpzoJBfv4XQjyb3Vgib1DT9KATgA59c95L/jB8CREXoZCPAc7iVlOxRPahns6VCOxizSRT+zySXqQVC9XiQ50Aa6nEVP0DomB63b9KORSquEO/pk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Se4f6Jnr; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=XTTyw+GN; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Se4f6Jnr";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="XTTyw+GN"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559BViPK028543;
	Mon, 9 Jun 2025 07:39:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=pCefdxm5umYxzf6R3fjIUbbQ5zfYXKQ2J+amn97hll8=; b=
	Se4f6JnrB4oS8jPOPVJJ0c9+ZVr64hUp3GzzWufUNaRl5bVxswCsSqja0ss+MsWd
	dZwBm/JnHthnPnZJNb3IXkYii6PO4kU4V/noG8DUjKGoOuqq7o8lWo/FbAxKafx0
	9FOLAyGpGKJy2uNsMTiw9dD1KvfdIoGYlf4UgHOI+gYTq88mJvLyRIBy0GPj1TWI
	tDOeI56pDT8SThd4gWvtcF2+TzPZWfEoARSfcVxUPAPuWpNJX/NRNZClsnqEsz63
	0VYxgaIxyVpUCC86yQ8A7QC2e6Kq7q5t2evFKVDG5NQKUFDXT36l+z+d5k6DkK0g
	85U84VDRoY5jEJ2rHykFtA==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11hn2216.outbound.protection.outlook.com [52.100.172.216])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 47529v1dt7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Jun 2025 07:39:51 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yNZUn6ej9dpeEKaKdjmZ5Ynw9X15gy+wI8csemjE2ldd5tTEJ58UdsUovIrtnniI4/QKY/2kqUauYg7XZrycTCPWmmEAIgwh74RXnEHTBCniry6tbI0gstEuBMiHcXMcg12aI/wFM3HFdkR2lBH0MvtgfS3ZnsBm+n0/8tAt03KbPPawQzwJ2jFYfrh9MmL6opUqlit8hBZpEI2yWpSW0jQgtmkLFOKhwOJXEnhYxq2KnrKAov+5RJl+XxlofV/ogqN+l7zQ5O0Fn0pv8HYtvTe+RBrZQAU5tPEcP509rBaYZvfOFxyhXdR6fsgDC+L4cJ3GTm6XkAWSt/fc1HiRdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pCefdxm5umYxzf6R3fjIUbbQ5zfYXKQ2J+amn97hll8=;
 b=PZveeSkhSgtOkGreSyTx0d0r3Ubjhx6VraU/ZnPYFn4CPKdOAjNq65E8nMqZUksOtqGLchgKbQJzqbsrFE0RtASpQ5LYxsozNjWls7SrQRpRsd/u/KtLNDtBPp36CuUxJqdu0YK3jCHadUAcvmR0YMm0T5oNKg9EXmrXSWu5d1Wxo8aUEX3DAzaS3OJzd/1auaxJZ+l4hoSdx7/tHRE0XsyXiyqbxb3ZigGVB7ptqs3XNTW1rD93gIOAna3TfDI7G3ibUVIyv86w3ixz84TwGv7w50HtKjvMLwcTdQSrg8RoreQGKN5Gd1wx7vkJaZZDPmgOz8qfjpkssVLThxrZzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pCefdxm5umYxzf6R3fjIUbbQ5zfYXKQ2J+amn97hll8=;
 b=XTTyw+GNzLootpxxNrNQh220IUqOcnaLBhlfMzZ3ignKTWLDHJyPtRnkd4AZI8YNbzU56vlrdVCl5tYnnl1jCNJM6LfTmQ7+AbcPb7soEmyG/Uaakc7sML43CFzA//TG4w7wOrEGSW4HLhWQkJTCrEsYkvwh4heeErqiDGcySdY=
Received: from SJ0PR13CA0148.namprd13.prod.outlook.com (2603:10b6:a03:2c6::33)
 by LV8PR19MB8599.namprd19.prod.outlook.com (2603:10b6:408:265::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.14; Mon, 9 Jun
 2025 12:39:46 +0000
Received: from CY4PEPF0000FCC3.namprd03.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::4a) by SJ0PR13CA0148.outlook.office365.com
 (2603:10b6:a03:2c6::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.10 via Frontend Transport; Mon,
 9 Jun 2025 12:39:45 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000FCC3.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Mon, 9 Jun 2025 12:39:45 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B1260406561;
	Mon,  9 Jun 2025 12:39:41 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 88A32822541;
	Mon,  9 Jun 2025 12:39:41 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com
Subject: [PATCH 7/7] ASoC: SDCA: Add some initial IRQ handlers
Date: Mon,  9 Jun 2025 13:39:36 +0100
Message-Id: <20250609123936.292827-8-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC3:EE_|LV8PR19MB8599:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: adef7aa6-4d65-418c-1c1e-08dda752b6f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|34020700016|36860700013|376014|12100799063;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BtlEYHIOv07ZNlBZbKGHhYON5nkQkbVnDdoBPzX6jNsAYo/cL0hPzCbLTuqk?=
 =?us-ascii?Q?CNTSCopTtB3l0O2iVsGA0bcfVCM/aCpphcNhmqGAIpeV3jdaZznRlrt8m4xR?=
 =?us-ascii?Q?C8zHDc4SBZO0eFv2vTWSRT627goEC37vz9qqTJLljFCZx3gPWBr2riJexbNq?=
 =?us-ascii?Q?9d4diwZbP1fYjhqDxp7X1R7biYZZd3e456amW0iDALRFhBRpIm45vagjbl3/?=
 =?us-ascii?Q?b7ZGSdkmFteAGW60OA780JLzrJwt6ZE/QJ/3gftBEcXLdT1dp9OydrSrqGPI?=
 =?us-ascii?Q?JENoHX9HYPFGWZHLjfkCGjaLzFjEm756lSnKV19IVXgtSA74TIaK1wPtVLPv?=
 =?us-ascii?Q?WmZzJOTrx26n7VxzNk2aoVpeV1Gf7K+AnLLxmjKOjf29YbVUaUtmB/eCy0Ef?=
 =?us-ascii?Q?EkL+hIbFft6NxifBRUZfcoi8WTjDrveygYEG4lQKVrZUTZMBLdhH1DNDNpPt?=
 =?us-ascii?Q?hcuLvjftW4ndR+fAF3j/tNYyObl4CSxRpW7Th2GKal+WdoQlkgHQJzUgMEA2?=
 =?us-ascii?Q?qY4JszBNy87ytnSVKtgzy9jFfkKsN+EamjZgA6I2Z6NoxK4w/0KGnWd84xBI?=
 =?us-ascii?Q?UMx9flfnZv0bsMBGZEWs4MM+8KjgAV6uwlCpRKdf517+BPKCCAwKEXrjK3pT?=
 =?us-ascii?Q?Bhn6vKaC/7bF0Fz5aHVxazs++NKyotc/LGZi4wJCkxKOj6Ni/bJqZuuMG/Gr?=
 =?us-ascii?Q?eIeELqtt5jgTqL7nWrT+OWDhx9ww94DYqG5ugJxOjjVDEcM67HLTSYH/Xmt2?=
 =?us-ascii?Q?nLaIp9gq6ecnsLXdhjJDERoYUiSlX1E8wUCkAKq5w9u4MJtD8MhUi2CY4p48?=
 =?us-ascii?Q?3Cctk2QKHydCn+Nc7kz8GT3SJtzYATOIrDh4b0z5W3uPHgZm+7JeU31C06uq?=
 =?us-ascii?Q?WXisAhpiURFLUPFc1PnGbAUGln4O7MGvosolNOFTDijJTPhYfHnf73ye8XF3?=
 =?us-ascii?Q?4i05UU3Av0zYSbGBe6oVvBpklnWNMzAXFjJdcXh3WtXqjWNONdfrSJ+K2b0g?=
 =?us-ascii?Q?sIqoeBH2vbf/dlJ4ncssY+KI7OGRjyXzGEoMa+cXcrlkavmRCZTZ784Y74UW?=
 =?us-ascii?Q?pqIup3SnMnXuekj6dECU2iwIv9Qlvk0EEUu0wzrxXsoil4hQTbXUERqUPk2A?=
 =?us-ascii?Q?u6bOkOBEZKB3XT5ahP2wIvvuzVVkeavTZfKeUL3/8i+qkAMlpirwvttWnYYf?=
 =?us-ascii?Q?4vZjkeIc5tkBYXILgQ6YS5Hx2XhmHUjNwK8omYEMexAZttkXilpTkdWmZFQA?=
 =?us-ascii?Q?zROpTXCzzUM+1I8pEUjzSeBXilX/mgXHrpLSe5AHMk8YeJmZCImuNPrBQAu5?=
 =?us-ascii?Q?W2mbkeBvYDFJmoW3/o7cps3Z/zyhkpMzExxiqQEuqrGu03joElqrmtCaJe69?=
 =?us-ascii?Q?W0dzdh6fSf6gIbHt3oL/MNcmfAAWML2Aw7m3bjukkVZOAXqW80oRkMSBSpRr?=
 =?us-ascii?Q?dBNEwHIigar31tsDQHDl8Iqp7kINCRKIjAciBfwg/lkZLC16mdvTbQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(34020700016)(36860700013)(376014)(12100799063);DIR:OUT;SFP:1501;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 12:39:45.2123
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: adef7aa6-4d65-418c-1c1e-08dda752b6f4
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR19MB8599
X-Authority-Analysis: v=2.4 cv=Jfq8rVKV c=1 sm=1 tr=0 ts=6846d617 cx=c_pps a=9STpQmiUi7MPFHWhrPQkZQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=6IFa9wvqVegA:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=KJT-RnjOAAAA:8 a=w1d2syhTAAAA:8 a=uY7Gk4WlIypM0dlVatYA:9 a=HE_01F9_QflCRFonrIQr:22 a=jZz-an6Pvt0H8_Yc_ROU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5NCBTYWx0ZWRfX/YcPyxifKc6B YLEhHwshiRQ8QeFc/qd1y1kHBHMHKqd/KvB88C2z8KaGiv1yCx0JfWQT7aN8+mbI4K1YBIE+/Sy WW1A4fzZ0E++2IQFsNuTUSkzele3kCtE8TlD0FjR0DF4b4pzV/GjTBtRy3240I1qRA/k6SX+o3l
 rLFgodFIBNtyzLZCltCYagPKAHSRkT6exAgZahznYHQ6a0u8sN0dkEQucUi/TRd3uKHs8A+mbNg VG5y+LuM2/l63zmU83GdjzC1//eNQh7ByPxgg20lK9dz5B/omaTg+KsgKOhBElxLeeroJibZE3O f8zyi5jUMlnRJZC8lkYDgewIpJqGXrpNB73JMwlFYqXjx1eJ16JmXm9yrRnutkgkMq9tlaAsn9r
 UsH724VQL86/SbGorIMsY5GLhV/rZyApPAvaA43jMx19OjGSUQU8ywqYJE2XSpzMZSdiJt5V
X-Proofpoint-ORIG-GUID: hiiaweZJ91zWcaJeQ-OIVHmeCgDJgZBU
X-Proofpoint-GUID: hiiaweZJ91zWcaJeQ-OIVHmeCgDJgZBU
X-Proofpoint-Spam-Reason: safe

Add basic IRQ handlers for the function status and jack detection
interrupts.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/sdca_interrupts.h  |   3 +
 sound/soc/sdca/sdca_interrupts.c | 155 ++++++++++++++++++++++++++++++-
 2 files changed, 157 insertions(+), 1 deletion(-)

diff --git a/include/sound/sdca_interrupts.h b/include/sound/sdca_interrupts.h
index 10c14db282bfe..a688197896784 100644
--- a/include/sound/sdca_interrupts.h
+++ b/include/sound/sdca_interrupts.h
@@ -27,6 +27,7 @@ struct sdca_function_data;
  * @function: Pointer to the Function that the interrupt is associated with.
  * @entity: Pointer to the Entity that the interrupt is associated with.
  * @control: Pointer to the Control that the interrupt is associated with.
+ * @priv: Pointer to private data for use by the handler.
  * @externally_requested: Internal flag used to check if something has already
  * requested the interrupt.
  */
@@ -38,6 +39,8 @@ struct sdca_interrupt {
 	struct sdca_entity *entity;
 	struct sdca_control *control;
 
+	void *priv;
+
 	bool externally_requested;
 };
 
diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index 1b02d584cb5a3..005b7a085a491 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -7,6 +7,7 @@
  * https://www.mipi.org/mipi-sdca-v1-0-download
  */
 
+#include <linux/bitmap.h>
 #include <linux/bits.h>
 #include <linux/cleanup.h>
 #include <linux/device.h>
@@ -18,6 +19,7 @@
 #include <sound/sdca_function.h>
 #include <sound/sdca_interrupts.h>
 #include <sound/soc-component.h>
+#include <sound/soc.h>
 
 #define IRQ_SDCA(number) REGMAP_IRQ_REG(number, ((number) / BITS_PER_BYTE), \
 					SDW_SCP_SDCA_INTMASK_SDCA_##number)
@@ -80,6 +82,141 @@ static irqreturn_t base_handler(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static irqreturn_t function_status_handler(int irq, void *data)
+{
+	struct sdca_interrupt *interrupt = data;
+	struct device *dev = interrupt->component->dev;
+	unsigned int reg, val;
+	unsigned long status;
+	unsigned int mask;
+	int ret;
+
+	reg = SDW_SDCA_CTL(interrupt->function->desc->adr, interrupt->entity->id,
+			   interrupt->control->sel, 0);
+
+	ret = regmap_read(interrupt->component->regmap, reg, &val);
+	if (ret < 0) {
+		dev_err(dev, "failed to read function status: %d\n", ret);
+		return IRQ_NONE;
+	}
+
+	dev_dbg(dev, "function status: %#x\n", val);
+
+	status = val;
+	for_each_set_bit(mask, &status, BITS_PER_BYTE) {
+		mask = 1 << mask;
+
+		switch (mask) {
+		case SDCA_CTL_ENTITY_0_FUNCTION_NEEDS_INITIALIZATION:
+			//FIXME: Add init writes
+			break;
+		case SDCA_CTL_ENTITY_0_FUNCTION_FAULT:
+			dev_err(dev, "function fault\n");
+			break;
+		case SDCA_CTL_ENTITY_0_UMP_SEQUENCE_FAULT:
+			dev_err(dev, "ump sequence fault\n");
+			break;
+		case SDCA_CTL_ENTITY_0_DEVICE_NEWLY_ATTACHED:
+		case SDCA_CTL_ENTITY_0_INTS_DISABLED_ABNORMALLY:
+		case SDCA_CTL_ENTITY_0_STREAMING_STOPPED_ABNORMALLY:
+		case SDCA_CTL_ENTITY_0_FUNCTION_HAS_BEEN_RESET:
+		case SDCA_CTL_ENTITY_0_FUNCTION_BUSY:
+			break;
+		}
+	}
+
+	ret = regmap_write(interrupt->component->regmap, reg, val);
+	if (ret < 0) {
+		dev_err(dev, "failed to clear function status: %d\n", ret);
+		return IRQ_NONE;
+	}
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t detected_mode_handler(int irq, void *data)
+{
+	struct sdca_interrupt *interrupt = data;
+	struct snd_soc_component *component = interrupt->component;
+	struct device *dev = component->dev;
+	struct snd_soc_card *card = component->card;
+	struct rw_semaphore *rwsem = &card->snd_card->controls_rwsem;
+	struct snd_kcontrol *kctl = interrupt->priv;
+	struct snd_ctl_elem_value ucontrol;
+	struct soc_enum *soc_enum;
+	unsigned int reg, val;
+	int ret;
+
+	if (!kctl) {
+		const char *name __free(kfree) = kasprintf(GFP_KERNEL, "%s %s",
+							   interrupt->entity->label,
+							   SDCA_CTL_SELECTED_MODE_NAME);
+
+		if (!name)
+			return -ENOMEM;
+
+		kctl = snd_soc_component_get_kcontrol(component, name);
+		if (!kctl) {
+			dev_dbg(dev, "control not found: %s\n", name);
+			return IRQ_NONE;
+		}
+
+		interrupt->priv = kctl;
+	}
+
+	soc_enum = (struct soc_enum *)kctl->private_value;
+
+	reg = SDW_SDCA_CTL(interrupt->function->desc->adr, interrupt->entity->id,
+			   interrupt->control->sel, 0);
+
+	ret = regmap_read(component->regmap, reg, &val);
+	if (ret < 0) {
+		dev_err(dev, "failed to read detected mode: %d\n", ret);
+		return IRQ_NONE;
+	}
+
+	switch (val) {
+	case SDCA_DETECTED_MODE_DETECTION_IN_PROGRESS:
+	case SDCA_DETECTED_MODE_JACK_UNKNOWN:
+		reg = SDW_SDCA_CTL(interrupt->function->desc->adr,
+				   interrupt->entity->id,
+				   SDCA_CTL_GE_SELECTED_MODE, 0);
+
+		/*
+		 * Selected mode is not typically a volatile register, but
+		 * force a read from the hardware in the case detected mode
+		 * is unknown to see what the device selected as a "safe"
+		 * option.
+		 */
+		regcache_drop_region(component->regmap, reg, reg);
+
+		ret = regmap_read(component->regmap, reg, &val);
+		if (ret) {
+			dev_err(dev, "failed to re-check selected mode: %d\n", ret);
+			return IRQ_NONE;
+		}
+		break;
+	default:
+		break;
+	}
+
+	dev_dbg(dev, "%s: %#x\n", interrupt->name, val);
+
+	ucontrol.value.enumerated.item[0] = snd_soc_enum_val_to_item(soc_enum, val);
+
+	down_write(rwsem);
+	ret = kctl->put(kctl, &ucontrol);
+	up_write(rwsem);
+	if (ret < 0) {
+		dev_err(dev, "failed to update selected mode: %d\n", ret);
+		return IRQ_NONE;
+	}
+
+	snd_ctl_notify(card->snd_card, SNDRV_CTL_EVENT_MASK_VALUE, &kctl->id);
+
+	return IRQ_HANDLED;
+}
+
 static int sdca_irq_request_locked(struct device *dev,
 				   struct sdca_interrupt_info *info,
 				   int sdca_irq, const char *name,
@@ -202,6 +339,7 @@ int sdca_irq_populate(struct sdca_function_data *function,
 			struct sdca_control *control = &entity->controls[j];
 			int irq = control->interrupt_position;
 			struct sdca_interrupt *interrupt;
+			irq_handler_t handler;
 			const char *name;
 			int ret;
 
@@ -226,8 +364,23 @@ int sdca_irq_populate(struct sdca_function_data *function,
 			if (ret)
 				return ret;
 
+			handler = base_handler;
+
+			switch (entity->type) {
+			case SDCA_ENTITY_TYPE_ENTITY_0:
+				if (control->sel == SDCA_CTL_ENTITY_0_FUNCTION_STATUS)
+					handler = function_status_handler;
+				break;
+			case SDCA_ENTITY_TYPE_GE:
+				if (control->sel == SDCA_CTL_GE_DETECTED_MODE)
+					handler = detected_mode_handler;
+				break;
+			default:
+				break;
+			}
+
 			ret = sdca_irq_request_locked(dev, info, irq, interrupt->name,
-						      base_handler, interrupt);
+						      handler, interrupt);
 			if (ret) {
 				dev_err(dev, "failed to request irq %s: %d\n",
 					name, ret);
-- 
2.39.5

