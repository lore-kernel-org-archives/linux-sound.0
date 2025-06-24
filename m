Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B816927D77B
	for <linux-sound@vger.kernel.org>; Tue, 24 Jun 2025 12:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750768165; cv=fail; b=aEIfg88hV2w306PxwrUQO/rwycszyuH343GivjwuxobISlxVD26MH/q8iuMCZKZqGpsALvf/BrerrZG9fDYcIopR5rO0v1p2kyWcDlM6+qHBtvvaUX2TwzEOCj89jkTEQIe/kZ49Sm1heqcSQkgQz1T/EyOlYwMEHqL5CcuSTQs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750768165; c=relaxed/simple;
	bh=9esLWAet7sxP+3FDpmJw09KoPHm3rVGROK2+0OmSJv0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z3Iq+hag3EJ6s4d8mF3W0EL3nq4SCu9c3Pc6Yi5EDRNpEdL+67Wmx+mg7XtNbcVsY3yz5Iwx5H4fRIzL96sCPR9GZgM69EtaVfH3rZ15Zv0gCvtrR95T7F27QnFUbesQUSm6sckjzuVa2uqJEDPq8iyfVgL2k5/w9PFv2Fa8i2w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=R3FASVuk; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=yM/AhKvj; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="R3FASVuk";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="yM/AhKvj"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O3NUlm012598;
	Tue, 24 Jun 2025 07:28:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=/Tb6ZEKxMmFOw93GdCYrCG55Uc6ibJj8XxHaRVAEb4s=; b=
	R3FASVuk15XzDtERDlmx0ZoMheERegyaax04T8Hz/3tmXt7Yw18VsRxmMDxlKhic
	H3b5RYxriEY5S483wfZxZcKzcdDekBRy6gRHDtU24CJox9MrHRxRv4prfuz5rVSo
	YJ0xK9+Qz/zLgxadvrP+r8J3CKEm6aAUTR6iwBgl30lpN8Z7jDajLXu78JU57+ch
	65MS0TuDLJUmM5XEzuXXtFY2lMG9Bw4wOPXNQESqepRSc7OE1ZO09u/FXpTA+klH
	6xSZQAw1crwJu2smMEKNpkimbMu3I5IWIgx/eaNfQq9yTVj2MgdPI3ZXflHtitEa
	Lkm78/yv52H+c4NAVyiWGA==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2123.outbound.protection.outlook.com [40.107.237.123])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 47e5tyu4k0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jun 2025 07:28:56 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DGNG9ycujDO6+EV/XekVP8BXUlVClSOeJpu+dg3hZOO+iowCZAaS4hONlHtePH40m/Pv7h87bHat1uoqhIDoh9s7PyffVTzGBsy85MtLiG9l7b2LjTRiULTmINru1japaxZ7JFernh78ebGGE4mlu5F/J2wllS0biqRcYcVTYUeeCYPdqVFFgSJ2LzXK2n3WtmLtjJrEV1qGq9gc4l/9NJxgxW4bxKdomXV4AzTLbTevlPiJNcRM1mHUPOLiYL8IVv/aTZVP3o6cAW8VcxDMxwRQPvqxzMy+x2kwwqxptVEu6LwUP1bjOUclFtfXznnKKe9fls27+JKgqdUFPpfjGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Tb6ZEKxMmFOw93GdCYrCG55Uc6ibJj8XxHaRVAEb4s=;
 b=TwDQW2xkUA77YphLp1mpXxZ84qWVgwBHZ16m4z/JQ4iS326mNUTD5AisnJuADuvFsSv48m/9CjVWcwYflRJwpihHhVlotIlu0q2IiXwCwPQUw69gCm/RyEVNpnkToDMldD+6Mpw1TxUmjElVXuKxuWTiB9qC6r8Gms2N+zxD9oZ3zYIcHboc9ZAk9mpNMGYqLY6Ta/P27n+LT2WUCL2IXM9zdTyT/OmAQeSMUYWnTJzJH1tkjbfpSp1BSLkYyBmVeWA5LSJRUWADqxv2kX6JCiqf+ml1HaWC06TRdn8dhyFTlrDCWf5zfVe65WX7VF9qPXcdM7n/GQg7XEOjEEN56A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Tb6ZEKxMmFOw93GdCYrCG55Uc6ibJj8XxHaRVAEb4s=;
 b=yM/AhKvjxc+K17QcVW0C7evhS58RIha5wGF+/p4U11+3KXyw8nn5GfeMsTf7Q8HfnzMaTXxVCfbKP/OIHGQ0MWlTQSTR2cE7riWHIvxTTA0NvyXsvdO5itlHf5mM/5p6Itdzzgg5UpsPkbwLwESjZKYofc212+7rg7RUGKGVFhY=
Received: from DM6PR04CA0018.namprd04.prod.outlook.com (2603:10b6:5:334::23)
 by SJ1PR19MB8285.namprd19.prod.outlook.com (2603:10b6:a03:488::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.15; Tue, 24 Jun
 2025 12:28:53 +0000
Received: from CH3PEPF00000016.namprd21.prod.outlook.com
 (2603:10b6:5:334:cafe::70) by DM6PR04CA0018.outlook.office365.com
 (2603:10b6:5:334::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.30 via Frontend Transport; Tue,
 24 Jun 2025 12:28:53 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH3PEPF00000016.mail.protection.outlook.com (10.167.244.121) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.1
 via Frontend Transport; Tue, 24 Jun 2025 12:28:52 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A3ADD406559;
	Tue, 24 Jun 2025 12:28:48 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9300B82026C;
	Tue, 24 Jun 2025 12:28:48 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org
Subject: [PATCH v3 6/7] ASoC: SDCA: Generic interrupt support
Date: Tue, 24 Jun 2025 13:28:43 +0100
Message-Id: <20250624122844.2761627-7-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000016:EE_|SJ1PR19MB8285:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a3096558-0117-4136-289c-08ddb31aade3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5wM3pFUcDd1fStbh1pOkcoM8ynt9eH8k3wyv8Tc/yjiNB1MMVi1p9g0WdUcI?=
 =?us-ascii?Q?So+NQTKx/D8yxAyHnWblHZkpFtpVEzi5nwa5WhcpPf6O7Qg8/0kLGOeUtmue?=
 =?us-ascii?Q?Ue/qE6Auq9XAX6/pJiCsI8Ek4pkawmZwz0znbLINsy1wths/vSXhJMV5MPjK?=
 =?us-ascii?Q?GEQ7pzQC7k58qgUMZtilXDk9pfrQ36+RqO/75EG3tMJZXxFJo001D/2GkLaD?=
 =?us-ascii?Q?OvIACdwDQiyivIAeWc1GYsOJmsLCxMuGB+Vl2v02WJVqvcUO1lBOyczNgNS4?=
 =?us-ascii?Q?pNd3RGC8llmybktOhoXZ8FYKoPg6dKgynd3tO1rou4H+7oIeN8I+HjcEAltn?=
 =?us-ascii?Q?8eSLBUmBHl+OZ6ApdSM3AxV+159It7DVruZlbFGguN7ty9LhdiXaFJMgBckD?=
 =?us-ascii?Q?7ICjo6ohs4QF9JIn9OpzAuadj4kCfkPkGae4bDOLs6lnC2J3t6eaVQuDGrEI?=
 =?us-ascii?Q?p2QDiUU/Hxyahq7fYjRm24IkkWQ9IbuzJqTK865ud3lKlV2P7FOug9IlXnZl?=
 =?us-ascii?Q?Bi34w2CryVx3bZ7khz0UUSU8ig5qINvhXQ14036mcbRY/NboyNt0vAdVRRiX?=
 =?us-ascii?Q?5RsWJ/Q1DoLWgYLVlQqp1KqMEtEIu3/g0yP9DKsHWrbIywoUR0ig5ezBYVvY?=
 =?us-ascii?Q?BW7QOML0QuKuSK21H746Xmnrg5ZFi4DgZGDNOBdTzzB3MN1ao+g5v+Nfsy+G?=
 =?us-ascii?Q?jw3IB7OCEvNxZYR5XP1QoUie7l4dbZa2jx0zwEiNtli30m/KK+195ctKNf2N?=
 =?us-ascii?Q?9fvlnNWHHf3Zb3fAHlNSde9bEiB31JZUz4nlNKryQQNLi40xoASaRFewgpL2?=
 =?us-ascii?Q?qj2liXhwlwjTdf6Aimhtue/6leZlnmdv8fazLxqtlhtMcaOi63q4xLUxxU/8?=
 =?us-ascii?Q?Dn7nBdpmp20dkFAHbsuJAYRJJnnHcHYXrIZWDHS7NcezGtxnPz2/bNeQAGQo?=
 =?us-ascii?Q?J/4DjLk85JJlvdcKYy97J2hYXVS2WTXO7wWCXQZKS1j21UxBjPSHKyfQH+h9?=
 =?us-ascii?Q?w3s7Ju85r3DViVrW63WxljiwsI0PWJY0YGWbX1e5ionDnz/KxG32ErPnTou4?=
 =?us-ascii?Q?nfHF2f47NdaCWiDG/7A+9/2imgKlQacz+TqNUFLWhEf8gdisHm4cAw2lpeq8?=
 =?us-ascii?Q?bl7dG+ddhfCFAL6GBaVGG6rx79mCZXIx2ATupkd34aLrkOwM7vVEPYHO2BWb?=
 =?us-ascii?Q?Ylhy2U87cXgYbfqZunv9vO+zd9QmjiACoSU+czcKupKcGO/nVrkAZcaj5Ce+?=
 =?us-ascii?Q?OXFU76Lbnr/F25iTsgjo/baI7TB1uMoHoMDWPDNXQWCtkxPEjgko8nvxlA7f?=
 =?us-ascii?Q?e9jrtiy96QQQg15j5HgwGx530VyYV1G4ArRSvWU9NDKeSGRT+WYuhZK02dRi?=
 =?us-ascii?Q?1xWZYPR7JDC4R6InwSNpYKDUb7fxRVh4uuAslalIMiv5JFUcrtfdVyjfSxbd?=
 =?us-ascii?Q?KSMCFbSZwmYGykR0CXBRTy+bMU8VSIVn9Hcne6h9oRcwiD0mo8mYFQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700013)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 12:28:52.1959
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3096558-0117-4136-289c-08ddb31aade3
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000016.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR19MB8285
X-Proofpoint-GUID: bAPPG8EeQd9c8edfrMxmeqUQlaUQdqfA
X-Proofpoint-ORIG-GUID: bAPPG8EeQd9c8edfrMxmeqUQlaUQdqfA
X-Authority-Analysis: v=2.4 cv=P9E6hjAu c=1 sm=1 tr=0 ts=685a9a08 cx=c_pps a=sXP4CBoXI4FFEMmoTRPjnQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=6IFa9wvqVegA:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=KJT-RnjOAAAA:8 a=w1d2syhTAAAA:8 a=QyXUC8HyAAAA:8 a=m4jr48dSj2k80pI-KV0A:9 a=HE_01F9_QflCRFonrIQr:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDEwNSBTYWx0ZWRfXwfqsAkf/ZJOR xi1qeJf6aS43o0sk+Ug/lX29xI72/wfPm6k5vcaaCkf+z/60Y0+/+lT26jBsxnBZNYTjvr/VjsX vBFoJrU3nUPKj7vMWBpkxBWG1uxgcxB7tg3VW2fIvTBIJqF6J1RrDaE9KNoWfk1C+dKEoiJVJ18
 e7nMx1dSGYci71X/oDIjQ/8uBLO0HLCfGl5MsQ3rX05UtqHrHZkH1IEAbF+jX6M3lweELX82u3u FuevMA68/PZiT66JcfckbOu1ABMiUeNEkFBsTqmf13DIRUMTMA9esvEolj0Ds3d3QqYA0wmIO6E FierIUH9Rbd8JyJHP8THts7JCywKVhFeJzlwQv8XyzYJGQKhIs+1kW5eDwvt9SpnFY51YL6Vq99
 3MV2dW04EZEAFk1gnEjvGs9fxlQWQMQq+ThySjRWIMfdacDC2IyxGryxLyRxfFBCpjwMM9LK
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

No change since v2.

 include/sound/sdca_interrupts.h  |  75 ++++++++
 sound/soc/sdca/Kconfig           |   7 +
 sound/soc/sdca/Makefile          |   5 +-
 sound/soc/sdca/sdca_interrupts.c | 284 +++++++++++++++++++++++++++++++
 4 files changed, 369 insertions(+), 2 deletions(-)
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
index ec28855fe3b09..a633d5a0fea51 100644
--- a/sound/soc/sdca/Kconfig
+++ b/sound/soc/sdca/Kconfig
@@ -13,3 +13,10 @@ config SND_SOC_SDCA_OPTIONAL
 config SND_SOC_SDCA_HID
 	tristate "SDCA HID support"
 	depends on SND_SOC_SDCA && HID
+
+config SND_SOC_SDCA_IRQ
+	tristate
+	select REGMAP
+	select REGMAP_IRQ
+	help
+	  This option enables support for SDCA IRQs.
diff --git a/sound/soc/sdca/Makefile b/sound/soc/sdca/Makefile
index 9af46e7edfd2a..2a3938d11ca90 100644
--- a/sound/soc/sdca/Makefile
+++ b/sound/soc/sdca/Makefile
@@ -1,8 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 snd-soc-sdca-y	:= sdca_functions.o sdca_device.o sdca_regmap.o sdca_asoc.o
-
 snd-soc-sdca-hid-y := sdca_hid.o
+snd-soc-sdca-irq-y := sdca_interrupts.o
 
-obj-$(CONFIG_SND_SOC_SDCA_HID)	+= snd-soc-sdca-hid.o
 obj-$(CONFIG_SND_SOC_SDCA)	+= snd-soc-sdca.o
+obj-$(CONFIG_SND_SOC_SDCA_HID)	+= snd-soc-sdca-hid.o
+obj-$(CONFIG_SND_SOC_SDCA_IRQ)	+= snd-soc-sdca-irq.o
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

