Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596D7255F4C
	for <linux-sound@vger.kernel.org>; Mon,  9 Jun 2025 12:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749472814; cv=fail; b=i1a3Ls5cT0xbI5f6D60WzDdW+sytOWBSjxJLs3gBW4AYm3jJTyK9onMq72vssDwC5PcVGqviWqg0+y2HoyMv7SEoZx/5UzC6CXVFUthl7fbA0lr6sSiPLD3XnK4ZtP4voTnwU9n1eMB99UytvteoZ+rMkz2y/WBJYZ95dCG8iR8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749472814; c=relaxed/simple;
	bh=nAAxuEV90+zetF0kXrx2DI/6RQQSSWdpT/aOtALNOQY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hAq9SnvSSJ1EyyJdzYQfwMEjhKzIn1QWP9hyAu/GfEfyNl9v6hVn/meV14JnoSltTSyoCTCc2vj84/iilsCm5NMIlajodEaOR6d1TyLvSWrz6akbY7ZfYCNGwbHQbs+bP0fOZf1WwgarEWRRzFcE6BW6bETAFoekKYhyJcwBU8A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=eMBBvT/b; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Y1mSrbhW; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="eMBBvT/b";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Y1mSrbhW"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5596mIEl001774;
	Mon, 9 Jun 2025 07:39:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=8xVLG/PpTERWPAmQoo84QdKhGvzy5WXn/TKCHlwg0Fs=; b=
	eMBBvT/bAoUhK+tTp8rvYjk9olIC0Zvf/rSApWgGMhgBg4zkfQXUUuQThNlo8oLk
	AVf38C9Ul0I4oqHjUykj8tuGaJFY/mvWtW68n9YjLAB6E77hP6GI5ZDxq6uY9f12
	rq6Mk4WF4kzuKqWJDYPviobOnm3tB6pVFMLO/60PX4F74GKEwQrsSFQSZQIyOSKS
	U0qW1AvGF3vOuD9BVfJM4h4Vl5H9CqDH8OjBXPDxlMOcGm4eeoTU8n3z3LfdY8La
	3vjgqW2YVfJYXfBD0+ZGhCe5hpRRkQk9z/hAnBlbLTjY5THjuKdXwE1XZJhtIXF2
	jskyLQG1sOyYSDvYJuLZVQ==
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02hn2249.outbound.protection.outlook.com [52.100.158.249])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 474ykther0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Jun 2025 07:39:51 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r75+IRUYEreFzrYYGQtQrhePhQUK2HEJy6Bq3kjc0lGTo5pIe0Pgul4MotSsfhpehEd8PkZ3EkMvApfRlWmTzyxNNQCuW0kitMU9OIRLDIiYEUMHLCseAhNNM38ZQYTIOv6fMUUHWHF3oKYqguK/IBHMafjNUhHw+Vt3tPElcAAmfJ+r1ODN7BJZbdEb16eUvDA3em0FUX6kpOwRE/+0vlL0MQsnaoYKbVFzuN9OJpxdqJYVotnXMqShVe8/reDwc7t2x7LvuLF5OskEQCK6tvK2BsBOxz/bolj7DfYMwtISFlVKIMjHVG8jjnTRWZhTPnDPV9DzD6vnIqxba21ygw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8xVLG/PpTERWPAmQoo84QdKhGvzy5WXn/TKCHlwg0Fs=;
 b=naOoIosQ13Q6wS4hQJw3ytW2VoBGYEFNjuw/cAPAJu2fbKSuhC95u8Gph2IVvWZisFRxE4cjboB7DQnI4AY8Huz6ijijbGyTBChuYxODBv+yhMJ9RVnEfrkKQ+UbIE/3627Dd4621tSoowQgoWdsD+0f5HFRu0gr3N4jf3rKXGO1IBMnIuH/f9aO+SU1oHll2gp5hmnQ3TpKNYJ1qPLirYZ2gaGrhq8v1Qw9PjZg70ioMEwEPPjOY/yFZvVAVjpRUAWedLcMVDYRAk2Bi3hAA71gsWFL0jWJV4nIGT4hJdUFjb6PNBMye/PV2vU+03sRtGCCayYc+acXdNAahTHBiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8xVLG/PpTERWPAmQoo84QdKhGvzy5WXn/TKCHlwg0Fs=;
 b=Y1mSrbhWF1NFH75keRdWZw7XWogWTkhobLtFmUJAGTREH06ZWbzFOOfEpQbS8Z1DymBdFvo/ZJ2BKPcmgq/lWKc9E9Xgte5P1/WOo7CxceFIDY20MN3Ax82BqImDjny8JgUGORGisNLCUX0IJMMjeh+pqfoxFQOIpMeVFrWpObU=
Received: from SJ0PR13CA0074.namprd13.prod.outlook.com (2603:10b6:a03:2c4::19)
 by SA1PR19MB5086.namprd19.prod.outlook.com (2603:10b6:806:188::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.13; Mon, 9 Jun
 2025 12:39:46 +0000
Received: from SJ1PEPF00001CE8.namprd03.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::1f) by SJ0PR13CA0074.outlook.office365.com
 (2603:10b6:a03:2c4::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.16 via Frontend Transport; Mon,
 9 Jun 2025 12:39:46 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00001CE8.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Mon, 9 Jun 2025 12:39:45 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id AF09340655D;
	Mon,  9 Jun 2025 12:39:41 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 83BF5822540;
	Mon,  9 Jun 2025 12:39:41 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com
Subject: [PATCH 6/7] ASoC: SDCA: Generic interrupt support
Date: Mon,  9 Jun 2025 13:39:35 +0100
Message-Id: <20250609123936.292827-7-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE8:EE_|SA1PR19MB5086:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a5426eb2-ec49-4801-55ba-08dda752b742
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|34020700016|376014|36860700013|13003099007|12100799063;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LRtKrU3X/4/0Z9X+dlQ7Ijt4kYuAjpY6NF1te9tEZI6BshDrOypXAsB8CoeD?=
 =?us-ascii?Q?dq+hnUE9UUoWoqAtNHZ30wOuLSZYczyjm0v74k9hzCAzZ9CbOBathmT2PkTc?=
 =?us-ascii?Q?lPvpEE9rnFkis4sUHiVYCKogXoO8N2U+hKtadpBDZZfSvd0DNRNXOhx0Fyx2?=
 =?us-ascii?Q?EwNs1UoZcGrY2XrSn1+hz+svF4dN2GL2rV6L/z1MhjtsjXz2wpq/txXNbFbq?=
 =?us-ascii?Q?YSjzYrXaaL71G5ql0+YTUWGJg0ZOWeuMGjFb1UQLw19oUPPC1GhlGYxrDL/q?=
 =?us-ascii?Q?fRthW16og6EqFt0mxtukBsVS2F4RYCh7FlOTyakR2rZMoxb32kosD4cVtyBy?=
 =?us-ascii?Q?fVjaEkoUic89oQvUJJiC727snp+L5bfd7eyzzLuj+W7W1H8A8tgj05/2DiLo?=
 =?us-ascii?Q?GjVZoC1gH0i+FwxaA73zS2rcKyVjQB9/MkU6d27Cc5u2IEWJ3hlZGy3f6sR9?=
 =?us-ascii?Q?5RJCzP43Mmsu5XS2HJXxr7NTOdCpHLwwRYL8DElI4yOU1jLe0j9EffD82OfN?=
 =?us-ascii?Q?2wAY1L/cZVgaRwOu+A5819LHWEnPzdxbTcy+cX5x/lL871ow95vMtNYn/4T1?=
 =?us-ascii?Q?2MTOowNNye/Bu+/vbB7d67Ah1ibOJFRMNz6NBZVVW9RukotI4Bcy8EdfbgQe?=
 =?us-ascii?Q?2ywlhv9H7Z+gdLx34yLVVXsnf7+nDLx4EBtp1a+xdn4sa26r3lWnDUDxAbfY?=
 =?us-ascii?Q?xDUIQVklh+jvrQFP6WeMZs6AsQfrdtx+uxhopNb743J6hahFbEg8PIy4rdKg?=
 =?us-ascii?Q?JrJc4exCVUgyD60Jvm4Mhh9RCTNt4NYGDseLp4mWJ6KA2gw7Yc1U2O7nbXvF?=
 =?us-ascii?Q?hoMXPFla6uWYk6e2zyQLD71WG4tzE8w/CVe2Vbz16B+EKPHPCehd7yH2E3Nh?=
 =?us-ascii?Q?heLhoUpK80gHKfHMt819zD+TT62ca8lETNkV7ysgpDTHeU/d8xsQv28B9Yfh?=
 =?us-ascii?Q?6W83JEPMoEth4EbzwSeG348bPFlzCRUtvtNjMLPB5DHw+2dK9rslkebO6KUd?=
 =?us-ascii?Q?uLISUTC9CBKRXYknDwKKiu2UniRfzbWJDQGOcbh445HXBiGfNjAj6KGwWfi+?=
 =?us-ascii?Q?ANDbsCX1yqS0YjdYaBjNie8iO9KJlYtPVIUZ9T/drBCfTdAmv+G0coGOMnIj?=
 =?us-ascii?Q?dCy6YBHqQx8f3QVwU95QIo5bii9+Xv1FsxJ424iri1fqf8/Klz/4c0lwOebc?=
 =?us-ascii?Q?A3Ldp9lMfTHswHR+RQSRTBWrxzKDiLZuXD+X95+2cDc9eEWvrS4TgXqbGkPJ?=
 =?us-ascii?Q?nQqiMusqLaDZKMI8go54u63wwcyqNokIzVSy9wYz/CegitxWHxTMESBStW8o?=
 =?us-ascii?Q?ruPeICrZOYx/jAAykWcW3Yaqmk2gQMhaO6GyIDdR4plJ6WpVT350EL+WQuVz?=
 =?us-ascii?Q?9QIvh0g0eOoaeSZGeZUVbsmwSuiTALydkG8eKY3uwyBYn4cdTmGzYJpgQxVR?=
 =?us-ascii?Q?fQgqHtqCddNJcrw4nK4/I7gzw+Cod9MHbkVvKN5J84WlNOWBQ4RmTQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(34020700016)(376014)(36860700013)(13003099007)(12100799063);DIR:OUT;SFP:1501;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 12:39:45.6855
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5426eb2-ec49-4801-55ba-08dda752b742
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB5086
X-Proofpoint-ORIG-GUID: I_dOU1vRGaAg-hDYNj-hPSwzTY5cSQpN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5NCBTYWx0ZWRfX7jvG1OCRhqDI bEKbqWREKll+n2EmQIoBCkz+bJRcy7cbT2WSN9n+8OSzVHNADRvW+h26GHFfThCFrarn9SqQi2E zzrF102walXnaP6EJOM1P5Iq67tPURrzrma8t9zPDiTnG0AsMrPBwoYf/eDTnkOHUwkz1BdL5fs
 iKYLw2oSl3b4+8EUcfPheAOaxBW9dnJ8urzUSH+//LvbB3bT9z1HQv33mF+LpAb+yxyYd1t7J9i FutbZ9pZIm8yBTlDHq4k03EJzGkD5E2880X9Tv6ZNMolcOsMoM89uVAvOtjLLDLd82wnzJQ75UL fzCvO8gPrnTsxZrSeDXb8YNKoWKwHkFvvCSd1tX+IQtKzVfom+DqubaWuEBqaKt+A9ofR7LFOwP
 cZVisVDR55W3JRYRhB70LF1lY8RcKY/iomq3obnFzTrEEJHCmbSrJQ11ZNovc6PZzBBNPS2t
X-Proofpoint-GUID: I_dOU1vRGaAg-hDYNj-hPSwzTY5cSQpN
X-Authority-Analysis: v=2.4 cv=TobmhCXh c=1 sm=1 tr=0 ts=6846d617 cx=c_pps a=6nhUB0PyWefyRjwYGF7XPA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=6IFa9wvqVegA:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=KJT-RnjOAAAA:8 a=w1d2syhTAAAA:8 a=m4jr48dSj2k80pI-KV0A:9 a=HE_01F9_QflCRFonrIQr:22 a=jZz-an6Pvt0H8_Yc_ROU:22
X-Proofpoint-Spam-Reason: safe

From: Maciej Strozek <mstrozek@opensource.cirrus.com>

Add a library supporting usage of SDCA interrupts, using regmap irq
framework. The library adds functions for parsing ACPI for
interrupt-related information, configuring irq chip and requesting
individual irqs. Calling code (SDCA function code) is expected to also
substitute the library's base irq handler for its own, appropriate
callback.

Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/sdca_interrupts.h  |  74 ++++++++
 sound/soc/sdca/Kconfig           |   7 +
 sound/soc/sdca/Makefile          |   2 +
 sound/soc/sdca/sdca_interrupts.c | 284 +++++++++++++++++++++++++++++++
 4 files changed, 367 insertions(+)
 create mode 100644 include/sound/sdca_interrupts.h
 create mode 100644 sound/soc/sdca/sdca_interrupts.c

diff --git a/include/sound/sdca_interrupts.h b/include/sound/sdca_interrupts.h
new file mode 100644
index 0000000000000..10c14db282bfe
--- /dev/null
+++ b/include/sound/sdca_interrupts.h
@@ -0,0 +1,74 @@
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
+ * @externally_requested: Internal flag used to check if something has already
+ * requested the interrupt.
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
+	struct mutex irq_lock; /* Protect accesses to irqs list */
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
index 0000000000000..1b02d584cb5a3
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
+	dev_warn(dev, "%s irq without full handling\n", interrupt->name);
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

