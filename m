Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34941A314F
	for <linux-sound@vger.kernel.org>; Mon, 23 Jun 2025 09:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750672075; cv=fail; b=IpiTZ+uPZC5LfHqMJQ0y4cfkKVOgSyxwBIE0O8wiyEGKvF37wySQlG+jeyfU7GivvX5Kbar6Rla6WD8PF3t5fSRRAKZuGXdOmcMj2bn85/c1Rgzfx37jXpZqtyH6gJHSKy3DhEoeCcfPpjoIFhgH+aYSokw+HDwmXR1zt1OEVoY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750672075; c=relaxed/simple;
	bh=mjifz0mndtrVIBRq8Cgz6+SwRKNiHh1zAmcVwEtATro=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mUPMsL6AXPEaMXdRqWcUfTzsqnBXjg2Q4aoR7CvVtzYqjl2A0IH1njJimqpWU/f+59dbOTKHlUqHIj7PmUH1sM4NbbPX48uZROrlFr21JN8pNDJ0/E6ctEO+dGPjG5WVnUg4E+g2UcGpGri1Y1XLcr7ds6gJa/k6xWQ4FEfGhPo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=bNTxhiFb; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=UM79QlIX; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="bNTxhiFb";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="UM79QlIX"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N60A9D027103;
	Mon, 23 Jun 2025 04:47:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=DhYrlUYx7Z4w/jMVmRYYwCVdYfJKuTeD4LquAIqLkLg=; b=
	bNTxhiFbIxmhPMvdX2BOS39SdZaOQU+uq44Yo2+n5u8duzJW4T3GCN3EhetalTm2
	RzPG1h/96W2JVMhGs21S4d3BgN1o89K/tQoi4yHjNrlDipC5IdQjdCowQPu9IJSj
	W044IIos85Cr7Pyjd9HJ15K2h2yl3AOVgyQgpllpcgFA/MTj6Oyh8SuEMMqSNzht
	sKYGk/qMWg9XEcOWU14vWJIH9xgYklAmBB7SeK3zmSG+UQfkclKvk5VJ0RoVPcew
	EiA/7ox68NNYkCl4LZFawYL6lTYSA5NZ6bPsz3JEmX5Tu5MB0P8CMWNKsr64+Fed
	tgWEuNh2AecKCAT6Be75SA==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2098.outbound.protection.outlook.com [40.107.244.98])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 47e5tysdc0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jun 2025 04:47:33 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NFCtO/GTCP6lBT9byzpDnZKY8t/NVM05+twA1nPKb7ql2+aYkkdCXB3Zk4uTTdunADzQ/F/gqh2rcqDKKKe2FRnx++TawvkLzBbNKE1/8w21fvO0elIlw81GKqyNPs4m55o7IYrmXd/h97oGJaYVAjsg1NWyStTvx/T8lliY4+3oZXPSnFC8vJgAtk+fSM8Ljj7qiwUc2q1vMe5G+hsu4gkz9Sm+Oz7XvCYm2fmnfiPZDbtPVgBvxYKCOK5keVMGWDf2C26Wl9oFSBle1VI4m9dELUWeSA3BUaz/zJDFx7r0WkwmLXXQO2DDhu+XT4ZR1/84pESnmKFS013vIrA0Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DhYrlUYx7Z4w/jMVmRYYwCVdYfJKuTeD4LquAIqLkLg=;
 b=ywwGseItGRAJM89rlnb47V6oWkHr8AzoMxOoE1Rg2+EDbhTSxWP8PBjBvuiPnnkB0gFMsP/M7mayQFaJgDMqwGN8wJO6BZqR5Lx0xPIM2QIiLzFQ0Ok6UOd7v2L6p1+T4MSAM+hNWfUAnjUFxfLxBhCvuzmpEsLyAoq5SeY18iG7nocaaLybbI7ZjuZnsJcEOBN3az1nPytKH87SvNsabex44nqddCXWEARotvel3VggYetMb23KlnramYbQHuZMrD4s529P1VYZ6yA+/wkCEA+hpxd9In0zFrIjFbvoVJ8iyYRZFFBnYLkB6vrnrFSf7+rHMT5MI6TNoc5/MO2+yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DhYrlUYx7Z4w/jMVmRYYwCVdYfJKuTeD4LquAIqLkLg=;
 b=UM79QlIXvvExZ2S3xfFoznECPaOdjWmO9GalTanUD2CsCQLEgZx8TrtCF5FZiAw+Z9LwPt0dq2bOSUN5p2ltVnFbHiqXpeX5sZqorvfs8g9kPAJ1NUl6wj3mTTVvAckAR/+Pr0L1SFMjkta7sWo1kIuj+qdo9iuNaQBdCSU/BQc=
Received: from SJ0PR03CA0021.namprd03.prod.outlook.com (2603:10b6:a03:33a::26)
 by IA1PR19MB6371.namprd19.prod.outlook.com (2603:10b6:208:3e5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.17; Mon, 23 Jun
 2025 09:47:24 +0000
Received: from SJ5PEPF000001EC.namprd05.prod.outlook.com
 (2603:10b6:a03:33a:cafe::10) by SJ0PR03CA0021.outlook.office365.com
 (2603:10b6:a03:33a::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.30 via Frontend Transport; Mon,
 23 Jun 2025 09:47:24 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001EC.mail.protection.outlook.com (10.167.242.200) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Mon, 23 Jun 2025 09:47:23 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D1D13406559;
	Mon, 23 Jun 2025 09:47:20 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id AB7B5822562;
	Mon, 23 Jun 2025 09:47:20 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org
Subject: [PATCH v2 6/7] ASoC: SDCA: Generic interrupt support
Date: Mon, 23 Jun 2025 10:47:15 +0100
Message-Id: <20250623094716.1874443-7-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250623094716.1874443-1-ckeepax@opensource.cirrus.com>
References: <20250623094716.1874443-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EC:EE_|IA1PR19MB6371:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b38dcf9a-22f6-4df3-facd-08ddb23af4d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|61400799027|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?L/8/uQBhRs8nmA9VIMvpu0n78NnJB1l4lUjmdoeYDqcU3PQSEEY1JcIylhOV?=
 =?us-ascii?Q?/zWexJDYPFx5E36YtOXKdbVXX7ik515wOI395vlDfcQuSR6DWXHeaMoMUT0b?=
 =?us-ascii?Q?5YoTZgLOOnLaq5Kwzw0s8cG6DGolZEdAaSV3ClEj60ZTdCp/nEBsBmgqDgIN?=
 =?us-ascii?Q?KMgQYNHtq3Q1vaJsmYGsXFmi48jOgU7MoYwdJeMIAhbkpCeGg2DS7ZiHLn4N?=
 =?us-ascii?Q?BJ5kZ8zO7/XTxZ9uHa4Yo4vUpGW5VkqAM5+cxCcQ6M86aPk4JmKGHcMLxTaD?=
 =?us-ascii?Q?0PXJBgQNrqWG0UwiKxhJzCmbL03OR+RP3ZCjFGnpau9SkJReDLnqKUx+CGBq?=
 =?us-ascii?Q?pDBFHNAHGUb3uO+RoSoaAtsSJTi3jw39iquZXtSYE76IgaCytOQYjLNyZG2z?=
 =?us-ascii?Q?lDsqDhtZ78aAAwQLeIOBI5BwXP7IOWkCreIbKxO293XKMTttro5CubGf5GXl?=
 =?us-ascii?Q?xNLO12YQaImeeJB8m3V341Ewgh7XjFFDPECO6Kthu8nWryZHnh8UmwOFCXxH?=
 =?us-ascii?Q?iHzqMz3Y+pLqUSvHFzgJvsrKeMutjs+FPYysO3yBlC23LDWSzpsplvi8dKus?=
 =?us-ascii?Q?LhtdgvppyXBIHGOdVPfVEcsesEgSQ3s8btVL9imDmlZ8DqS9wjD0BrozsM8G?=
 =?us-ascii?Q?u2Y1M71GoHUMuSa/hdhRShOPGylEcgbSppdvnjztj8yaDpHMa+xf/NPqabUP?=
 =?us-ascii?Q?nMaD5lO/ZEb2aQeO1oroeRHApEPxWRkm+s6EFf8VBQrVZbdavP7blNAjvrZx?=
 =?us-ascii?Q?LZkSmIuN/vwEc9vdYKZy0MfCteZuQRGl1rVZBwWWywqsDd3GQ7Pd67FD4QW0?=
 =?us-ascii?Q?mMFWurkYckSZHXNq6/uAfGNyoKJaAfIerQd46Lq/lJlmd6EkhY4Qnf7oeqgT?=
 =?us-ascii?Q?uX6OuGnAb/YL96YV+1cN50i1zSV5qC1lR+FkYN6KFnpFZ2v4TCJWTweWIfYH?=
 =?us-ascii?Q?wSf6VL1I+TTifFLAJMN28d1TClO6eBSoq/ddXwm7hNCPjX5Fus2XnXQyriHJ?=
 =?us-ascii?Q?cK5ptlfo62PbGOBoUkqEeQapQrZjeo+Y2dTcx8glwIDR2zI5j/aQACQ45zKd?=
 =?us-ascii?Q?VxsnN+azoxUTUSAuEvv3KYyBGam4oodRGNqoOPEFb6FLzKkWmCrWpepYcB3M?=
 =?us-ascii?Q?Ku1yuKe8b0akmnNSe9PWyUS42hE60q/YCIm8DTRmORQQ7Lcsmm+igfSDH/7A?=
 =?us-ascii?Q?INEulhKi8zy75cBTmgBY8mfsPnOxenis6cuPy/ODRufCy5j9dWgc6L8RMRWw?=
 =?us-ascii?Q?w+8KyBbmFX0Nul2FH1X2Rf8PPPbv0WC97HXF2bb0XJtXY2L6SlX1YXUG/GzS?=
 =?us-ascii?Q?ZQ4TqT29k1QFqWs33Y/ZRi4WHOksX5Ljdx+vPFsAj7OHHvppJlYYP8VXQ2ma?=
 =?us-ascii?Q?lC7uB6ywEIvmHC7nzlFWSaEAFZsjQm29uHQQSfyMYzc09W4kvqPWkrVf4LKw?=
 =?us-ascii?Q?DYZFkogn/D0KgVF8RKslKS99oymi5Kok9ISAKvsYzEebTF/lszUh3g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(61400799027)(376014)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 09:47:23.8771
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b38dcf9a-22f6-4df3-facd-08ddb23af4d8
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR19MB6371
X-Proofpoint-GUID: qRhc54O3NELJvdMnuRDx9aP1YZJOop4s
X-Proofpoint-ORIG-GUID: qRhc54O3NELJvdMnuRDx9aP1YZJOop4s
X-Authority-Analysis: v=2.4 cv=P9E6hjAu c=1 sm=1 tr=0 ts=685922b5 cx=c_pps a=FxXBCnfXph51YBDQzOwJNA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=6IFa9wvqVegA:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=KJT-RnjOAAAA:8 a=w1d2syhTAAAA:8 a=QyXUC8HyAAAA:8 a=m4jr48dSj2k80pI-KV0A:9 a=HE_01F9_QflCRFonrIQr:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA1NyBTYWx0ZWRfX/4hEY9AqgJjS x02DraWMXpxc8Q+Rs8KhbyPqGEhp3DUSpl/aWR5EynyDM38WPAqjqZQYIgYMBFhxyONIUnK5S1q e+5PYLFSL1Qk35qhKduFdb5Hf9BcizBD3A3Pme5k/q5IaHatI0hyP99bOCnXgHHENeOQ6GBp9OU
 Eskonnck9GgEXIo6HF9dxOeThEPEBKdo4BijR338JLLqv5n8oTrnIRSpjMJpUpR0hB250cbhnbq m8wq047i61INpPF0Y4jKJ0Zw1184hYSFPtNnYKDz2NnXMB3ptoptjtHcTGd+St4RnAmQn9J8F+M ngF1yQtc/J22QbvEEsYIwNl+p0Cn1szlcaIcUzv6l+snyFjNKQS8p/af5mDmCYzJhsPSXACv+lA
 fkOpSwmuykhrMu7O5/RiSphWsAatGtcrB/BPVQzFTR9o9iAxj9/B9aEguN4ZKaaVxq8CxaLf
X-Proofpoint-Spam-Reason: safe

From: Maciej Strozek <mstrozek@opensource.cirrus.com>

Add a library supporting usage of SDCA interrupts, using regmap irq
framework. The library adds functions for parsing ACPI for
interrupt-related information, configuring irq chip and requesting
individual irqs. Calling code (SDCA function code) is expected to also
substitute the library's base irq handler for its own, appropriate
callback.

Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v1:
 - Update comments on externally_requested and irq_lock.
 - Drop warning in base_handler down to an info.

 include/sound/sdca_interrupts.h  |  75 ++++++++
 sound/soc/sdca/Kconfig           |   7 +
 sound/soc/sdca/Makefile          |   2 +
 sound/soc/sdca/sdca_interrupts.c | 284 +++++++++++++++++++++++++++++++
 4 files changed, 368 insertions(+)
 create mode 100644 include/sound/sdca_interrupts.h
 create mode 100644 sound/soc/sdca/sdca_interrupts.c

diff --git a/include/sound/sdca_interrupts.h b/include/sound/sdca_interrupts.h
new file mode 100644
index 0000000000000..4cda8b75bae0e
--- /dev/null
+++ b/include/sound/sdca_interrupts.h
@@ -0,0 +1,75 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * The MIPI SDCA specification is available for public downloads at
+ * https://www.mipi.org/mipi-sdca-v1-0-download
+ *
+ * Copyright (C) 2025 Cirrus Logic, Inc. and
+ *                    Cirrus Logic International Semiconductor Ltd.
+ */
+
+#ifndef __SDCA_INTERRUPTS_H__
+#define __SDCA_INTERRUPTS_H__
+
+#include <linux/interrupt.h>
+#include <linux/mutex.h>
+#include <linux/regmap.h>
+
+struct device;
+struct snd_soc_component;
+struct sdca_function_data;
+
+#define SDCA_MAX_INTERRUPTS 31 /* the last bit is reserved for future extensions */
+
+/**
+ * struct sdca_interrupt - contains information about a single SDCA interrupt
+ * @name: The name of the interrupt.
+ * @component: Pointer to the ASoC component owns the interrupt.
+ * @function: Pointer to the Function that the interrupt is associated with.
+ * @entity: Pointer to the Entity that the interrupt is associated with.
+ * @control: Pointer to the Control that the interrupt is associated with.
+ * @externally_requested: Internal flag used to check if a client driver has
+ * already requested the interrupt, for custom handling, allowing the core to
+ * skip handling this interrupt.
+ */
+struct sdca_interrupt {
+	const char *name;
+
+	struct snd_soc_component *component;
+	struct sdca_function_data *function;
+	struct sdca_entity *entity;
+	struct sdca_control *control;
+
+	bool externally_requested;
+};
+
+/**
+ * struct sdca_interrupt_info - contains top-level SDCA interrupt information
+ * @irq_chip: regmap irq chip structure.
+ * @irq_data: regmap irq chip data structure.
+ * @irqs: Array of data for each individual IRQ.
+ * @irq_lock: Protects access to the list of sdca_interrupt structures.
+ */
+struct sdca_interrupt_info {
+	struct regmap_irq_chip irq_chip;
+	struct regmap_irq_chip_data *irq_data;
+
+	struct sdca_interrupt irqs[SDCA_MAX_INTERRUPTS];
+
+	struct mutex irq_lock; /* Protect irqs list across functions */
+};
+
+int sdca_irq_request(struct device *dev, struct sdca_interrupt_info *interrupt_info,
+		     int sdca_irq, const char *name, irq_handler_t handler,
+		     void *data);
+int sdca_irq_data_populate(struct snd_soc_component *component,
+			   struct sdca_function_data *function,
+			   struct sdca_entity *entity,
+			   struct sdca_control *control,
+			   struct sdca_interrupt *interrupt);
+int sdca_irq_populate(struct sdca_function_data *function,
+		      struct snd_soc_component *component,
+		      struct sdca_interrupt_info *info);
+struct sdca_interrupt_info *sdca_irq_allocate(struct device *dev,
+					      struct regmap *regmap, int irq);
+
+#endif
diff --git a/sound/soc/sdca/Kconfig b/sound/soc/sdca/Kconfig
index ee20b9914aa1f..d40331cb0a212 100644
--- a/sound/soc/sdca/Kconfig
+++ b/sound/soc/sdca/Kconfig
@@ -9,3 +9,10 @@ config SND_SOC_SDCA
 
 config SND_SOC_SDCA_OPTIONAL
 	def_tristate SND_SOC_SDCA || !SND_SOC_SDCA
+
+config SND_SOC_SDCA_IRQ
+	tristate
+	select REGMAP
+	select REGMAP_IRQ
+	help
+	  This option enables support for SDCA IRQs.
diff --git a/sound/soc/sdca/Makefile b/sound/soc/sdca/Makefile
index 53344f108ca67..d7f9a16790ad8 100644
--- a/sound/soc/sdca/Makefile
+++ b/sound/soc/sdca/Makefile
@@ -1,5 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 snd-soc-sdca-y	:= sdca_functions.o sdca_device.o sdca_regmap.o sdca_asoc.o
+snd-soc-sdca-irq-y := sdca_interrupts.o
 
 obj-$(CONFIG_SND_SOC_SDCA)	+= snd-soc-sdca.o
+obj-$(CONFIG_SND_SOC_SDCA_IRQ) += snd-soc-sdca-irq.o
diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
new file mode 100644
index 0000000000000..7272d11cb6d49
--- /dev/null
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -0,0 +1,284 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (C) 2025 Cirrus Logic, Inc. and
+//                    Cirrus Logic International Semiconductor Ltd.
+
+/*
+ * The MIPI SDCA specification is available for public downloads at
+ * https://www.mipi.org/mipi-sdca-v1-0-download
+ */
+
+#include <linux/bits.h>
+#include <linux/cleanup.h>
+#include <linux/device.h>
+#include <linux/interrupt.h>
+#include <linux/regmap.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_registers.h>
+#include <sound/sdca.h>
+#include <sound/sdca_function.h>
+#include <sound/sdca_interrupts.h>
+#include <sound/soc-component.h>
+
+#define IRQ_SDCA(number) REGMAP_IRQ_REG(number, ((number) / BITS_PER_BYTE), \
+					SDW_SCP_SDCA_INTMASK_SDCA_##number)
+
+static const struct regmap_irq regmap_irqs[SDCA_MAX_INTERRUPTS] = {
+	IRQ_SDCA(0),
+	IRQ_SDCA(1),
+	IRQ_SDCA(2),
+	IRQ_SDCA(3),
+	IRQ_SDCA(4),
+	IRQ_SDCA(5),
+	IRQ_SDCA(6),
+	IRQ_SDCA(7),
+	IRQ_SDCA(8),
+	IRQ_SDCA(9),
+	IRQ_SDCA(10),
+	IRQ_SDCA(11),
+	IRQ_SDCA(12),
+	IRQ_SDCA(13),
+	IRQ_SDCA(14),
+	IRQ_SDCA(15),
+	IRQ_SDCA(16),
+	IRQ_SDCA(17),
+	IRQ_SDCA(18),
+	IRQ_SDCA(19),
+	IRQ_SDCA(20),
+	IRQ_SDCA(21),
+	IRQ_SDCA(22),
+	IRQ_SDCA(23),
+	IRQ_SDCA(24),
+	IRQ_SDCA(25),
+	IRQ_SDCA(26),
+	IRQ_SDCA(27),
+	IRQ_SDCA(28),
+	IRQ_SDCA(29),
+	IRQ_SDCA(30),
+};
+
+static const struct regmap_irq_chip sdca_irq_chip = {
+	.name = "sdca_irq",
+
+	.status_base = SDW_SCP_SDCA_INT1,
+	.unmask_base = SDW_SCP_SDCA_INTMASK1,
+	.ack_base = SDW_SCP_SDCA_INT1,
+	.num_regs = 4,
+
+	.irqs = regmap_irqs,
+	.num_irqs = SDCA_MAX_INTERRUPTS,
+
+	.runtime_pm = true,
+};
+
+static irqreturn_t base_handler(int irq, void *data)
+{
+	struct sdca_interrupt *interrupt = data;
+	struct device *dev = interrupt->component->dev;
+
+	dev_info(dev, "%s irq without full handling\n", interrupt->name);
+
+	return IRQ_HANDLED;
+}
+
+static int sdca_irq_request_locked(struct device *dev,
+				   struct sdca_interrupt_info *info,
+				   int sdca_irq, const char *name,
+				   irq_handler_t handler, void *data)
+{
+	int irq;
+	int ret;
+
+	irq = regmap_irq_get_virq(info->irq_data, sdca_irq);
+	if (irq < 0)
+		return irq;
+
+	ret = devm_request_threaded_irq(dev, irq, NULL, handler,
+					IRQF_ONESHOT, name, data);
+	if (ret)
+		return ret;
+
+	dev_dbg(dev, "requested irq %d for %s\n", irq, name);
+
+	return 0;
+}
+
+/**
+ * sdca_request_irq - request an individual SDCA interrupt
+ * @dev: Pointer to the struct device against which things should be allocated.
+ * @interrupt_info: Pointer to the interrupt information structure.
+ * @sdca_irq: SDCA interrupt position.
+ * @name: Name to be given to the IRQ.
+ * @handler: A callback thread function to be called for the IRQ.
+ * @data: Private data pointer that will be passed to the handler.
+ *
+ * Typically this is handled internally by sdca_irq_populate, however if
+ * a device requires custom IRQ handling this can be called manually before
+ * calling sdca_irq_populate, which will then skip that IRQ whilst processing.
+ *
+ * Return: Zero on success, and a negative error code on failure.
+ */
+int sdca_irq_request(struct device *dev, struct sdca_interrupt_info *info,
+		     int sdca_irq, const char *name, irq_handler_t handler,
+		     void *data)
+{
+	int ret;
+
+	if (sdca_irq < 0 || sdca_irq > SDCA_MAX_INTERRUPTS) {
+		dev_err(dev, "bad irq request: %d\n", sdca_irq);
+		return -EINVAL;
+	}
+
+	guard(mutex)(&info->irq_lock);
+
+	ret = sdca_irq_request_locked(dev, info, sdca_irq, name, handler, data);
+	if (ret) {
+		dev_err(dev, "failed to request irq %s: %d\n", name, ret);
+		return ret;
+	}
+
+	info->irqs[sdca_irq].externally_requested = true;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(sdca_irq_request, "SND_SOC_SDCA_IRQ");
+
+/**
+ * sdca_irq_data_populate - Populate common interrupt data
+ * @component: Pointer to the ASoC component for the Function.
+ * @function: Pointer to the SDCA Function.
+ * @entity: Pointer to the SDCA Entity.
+ * @control: Pointer to the SDCA Control.
+ * @interrupt: Pointer to the SDCA interrupt for this IRQ.
+ *
+ * Return: Zero on success, and a negative error code on failure.
+ */
+int sdca_irq_data_populate(struct snd_soc_component *component,
+			   struct sdca_function_data *function,
+			   struct sdca_entity *entity,
+			   struct sdca_control *control,
+			   struct sdca_interrupt *interrupt)
+{
+	struct device *dev = component->dev;
+	const char *name;
+
+	name = devm_kasprintf(dev, GFP_KERNEL, "%s %s %s", function->desc->name,
+			      entity->label, control->label);
+	if (!name)
+		return -ENOMEM;
+
+	interrupt->name = name;
+	interrupt->component = component;
+	interrupt->function = function;
+	interrupt->entity = entity;
+	interrupt->control = control;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(sdca_irq_data_populate, "SND_SOC_SDCA_IRQ");
+
+/**
+ * sdca_irq_populate - Request all the individual IRQs for an SDCA Function
+ * @function: Pointer to the SDCA Function.
+ * @component: Pointer to the ASoC component for the Function.
+ * @info: Pointer to the SDCA interrupt info for this device.
+ *
+ * Typically this would be called from the driver for a single SDCA Function.
+ *
+ * Return: Zero on success, and a negative error code on failure.
+ */
+int sdca_irq_populate(struct sdca_function_data *function,
+		      struct snd_soc_component *component,
+		      struct sdca_interrupt_info *info)
+{
+	struct device *dev = component->dev;
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
+			const char *name;
+			int ret;
+
+			if (irq == SDCA_NO_INTERRUPT) {
+				continue;
+			} else if (irq < 0 || irq >= SDCA_MAX_INTERRUPTS) {
+				dev_err(dev, "bad irq position: %d\n", irq);
+				return -EINVAL;
+			}
+
+			interrupt = &info->irqs[irq];
+
+			if (interrupt->externally_requested) {
+				dev_dbg(dev,
+					"skipping irq %d, externally requested\n",
+					irq);
+				continue;
+			}
+
+			ret = sdca_irq_data_populate(component, function, entity,
+						     control, interrupt);
+			if (ret)
+				return ret;
+
+			ret = sdca_irq_request_locked(dev, info, irq, interrupt->name,
+						      base_handler, interrupt);
+			if (ret) {
+				dev_err(dev, "failed to request irq %s: %d\n",
+					name, ret);
+				return ret;
+			}
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(sdca_irq_populate, "SND_SOC_SDCA_IRQ");
+
+/**
+ * sdca_irq_allocate - allocate an SDCA interrupt structure for a device
+ * @dev: Device pointer against which things should be allocated.
+ * @regmap: regmap to be used for accessing the SDCA IRQ registers.
+ * @irq: The interrupt number.
+ *
+ * Typically this would be called from the top level driver for the whole
+ * SDCA device, as only a single instance is required across all Functions
+ * on the device.
+ *
+ * Return: A pointer to the allocated sdca_interrupt_info struct, or an
+ * error code.
+ */
+struct sdca_interrupt_info *sdca_irq_allocate(struct device *dev,
+					      struct regmap *regmap, int irq)
+{
+	struct sdca_interrupt_info *info;
+	int ret;
+
+	info = devm_kzalloc(dev, sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return ERR_PTR(-ENOMEM);
+
+	info->irq_chip = sdca_irq_chip;
+
+	devm_mutex_init(dev, &info->irq_lock);
+
+	ret = devm_regmap_add_irq_chip(dev, regmap, irq, IRQF_ONESHOT, 0,
+				       &info->irq_chip, &info->irq_data);
+	if (ret) {
+		dev_err(dev, "failed to register irq chip: %d\n", ret);
+		return ERR_PTR(ret);
+	}
+
+	dev_dbg(dev, "registered on irq %d\n", irq);
+
+	return info;
+}
+EXPORT_SYMBOL_NS_GPL(sdca_irq_allocate, "SND_SOC_SDCA_IRQ");
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("SDCA IRQ library");
-- 
2.39.5

