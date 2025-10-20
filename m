Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08AFA2517B9
	for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 15:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760975864; cv=fail; b=JX90ZJj8DwqS75SHdY99aevueYDxiYz3pLUuSLshmiHwvjeO6QLv544wlgEW4XfrWXNkIRlLExTFpz9qIfizbX6X+FsMLKjLbOv1+VGm7RUCp4CIxfeH4y70F9+BGk+II20rNf7H3bZecY2osOKQWHgZzZk1S+UIrcymFpkRwtc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760975864; c=relaxed/simple;
	bh=/mm8Ea6o1ZIgZqT4rOwmfJ5CqYbrxr7k/2oEqEgddMU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PwnFCPWXqlxWZpFNUQqMt3Wl3WWbzbJSOhV+dI5fM9sdKwUWq9w2OMf4cLpvvic/cSthuwIb+4O7eg5gJ8Fb43TfoVTxRAPbSPJ1UFbqNrdvrRYdfOYijmvJElUyjqDAuVGqNcJNhc0VZC+yKSBh/rcbpUUjGAAYanyGLQ2EksQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ZTDb9jCu; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=W9/X4INk; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ZTDb9jCu";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="W9/X4INk"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59KEAOJK941189;
	Mon, 20 Oct 2025 10:55:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=aMNCRp/hDKHKvX4PdOXq/7vjkLAn1q0OuVcTPWDtQf0=; b=
	ZTDb9jCu44U0hmA5Ct+93A8e6wH9B28AzAwk+lYcOlW8zv9gOe1z3ktzGTkbwvEe
	nfcOMgwVMENO4f9VxAy4oa6U7B0Y+RlmBsHiHW5PMlIG1zHnkwcvnW5aqLdcMShQ
	r6MjEllshBIE1EtvWtd9yW/X6WXkohsU2ZTBon6d2E4eqFPkLNLnmOsFP5aE4hok
	8FUTyxZs6gKJd7nLPqnHCTXKKpimXB+n5dQRgOl4t6V/8GQEv5qYxJYSi/5le/Nm
	LcEZ3ArbpBVnLw+uE26346HPkELv31bmsKY4g9X+DU8zcKGHBtdEF6tPMPMcgyr7
	zsqAoeptXMnjZhj/mFM2Dg==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023105.outbound.protection.outlook.com [40.93.201.105])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 49v7aj2aep-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 20 Oct 2025 10:55:26 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zPcFU7SScXOkoBZKbcoDp8KsZj0B4qs54ndmHS7n2aoY1wwvyIyDOxfVZ9dvlNrcXD3FkTrW5gMXpZ6Mtz2t7yLEzbJsKwvKvDx9MEaEifbyWlbXbj3MEfeLa7sBGj0nqpaDTHw50YyUv5UDqpirvm1VHtqNylUcoEBL77m6/sgH8lqHKC8wWYbC+14KYd8U9tu03yF6ByOI5Sj4J2NFMmvZu/Ebit0N6iiv1O5FUM9JSw3uZ5t8nm+9eYvx8W9Io4v28niUJe9A1e843WlPLDdVcuvDqLDqOaMQM6M8ynRlNBzU3hN/FwgRcRDjUn+QWkPNStTLdmbMD3IqSpC79w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aMNCRp/hDKHKvX4PdOXq/7vjkLAn1q0OuVcTPWDtQf0=;
 b=kNOl1N3Mddpautb0Q7CgLdHNGOVkMAEKVmcICmm04fVky0IlbaUrYEzzbsNWIWKRnH+lOcRTHqc9p78AilOVVwKQZMouBoby/GBMgWJm2EBiUYPoasVLkhAWKKpDQas1lG2872PMSzU/703Pq1MI57QXGeEnh/DfYzHNf5MXL6+HZfwjH9R/cPTkvmok9SWH28wuDukSbgWY/3yzGZY2O4N5H8akyVL9VYG23lE3UzSUiiz3IHsjqwDdwyPBEEYuk8vz7KwbvHPolsG7lzXTwBMn7WpRVD9m0VGzfGnbYxN0+ffTI9uSV/J15OZyWCdOLoStcB5sc7qe/7CuKKMmmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aMNCRp/hDKHKvX4PdOXq/7vjkLAn1q0OuVcTPWDtQf0=;
 b=W9/X4INkmpZFwvYW6dA4dZwMASCKfj4aFfzdmG12i3eoUe999IAU3nAzYrLJQxUyBmdOHG4FxR5MaY53Uhk+oLjdnp1TxEnsl6ShuvNfpwBW2uvoip07zxYpxRjBDNszl8JmPIvvLYsBpmaGKY/y5BdCQ56+Pph8wltMlYHmtsA=
Received: from SA0PR11CA0176.namprd11.prod.outlook.com (2603:10b6:806:1bb::31)
 by MW4PR19MB7077.namprd19.prod.outlook.com (2603:10b6:303:22e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.15; Mon, 20 Oct
 2025 15:55:23 +0000
Received: from SN1PEPF000397B3.namprd05.prod.outlook.com
 (2603:10b6:806:1bb:cafe::a2) by SA0PR11CA0176.outlook.office365.com
 (2603:10b6:806:1bb::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.16 via Frontend Transport; Mon,
 20 Oct 2025 15:55:23 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF000397B3.mail.protection.outlook.com (10.167.248.57) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7
 via Frontend Transport; Mon, 20 Oct 2025 15:55:22 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C8C0A40657E;
	Mon, 20 Oct 2025 15:55:17 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id BD0D0820244;
	Mon, 20 Oct 2025 15:55:17 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        peter.ujfalusi@linux.intel.com, shumingf@realtek.com,
        lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 RESEND 14/19] ASoC: SDCA: Add FDL library for XU entities
Date: Mon, 20 Oct 2025 16:55:07 +0100
Message-ID: <20251020155512.353774-15-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B3:EE_|MW4PR19MB7077:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0ad1523a-cb1c-48a3-7e88-08de0ff11405
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700013|376014|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eijnw8UfmFig/CVp1xJnEAwCQNjzX7HKsq5OQiaK23rnDkuwAdXiefXPLcMt?=
 =?us-ascii?Q?p2tFJdaTrK/AoIurNC0vSHmNoAoM5fRghVGkrrR40TqjMKYaxiShlTwPeKb/?=
 =?us-ascii?Q?0vC7B1bflQJ8zlqcRCvg1l7bWrLM0xgQxgfkTVJox61EJavqbGnUxCh07O0Z?=
 =?us-ascii?Q?Xb0fL/9ZPD1V7Ry4sMj9554jFWH06ej7bG40uMj9hmHkUbrcBxQA03J0hkm7?=
 =?us-ascii?Q?AoDPBrknr8T1R8w1aY7COhzf/xVKl+abzf2v7zGfZKIppWaSEyPnBX1jSIQw?=
 =?us-ascii?Q?zBCwNUO91jH8dRhTp3X56aF5N6YOpd3iH5GCxze1m5I48kw9pLqCNhupBkKv?=
 =?us-ascii?Q?mUUnLyHMOSiJoKB+vkfxH08+CrX0pHC9ahCtV0bkPXgsgCkoBzTpLoeX4UCO?=
 =?us-ascii?Q?hgjU/j2/cQHJp1EiRoT2M++7Eg+ae3c38iQp6kiQLqzv2oASVJO73WFeSmIf?=
 =?us-ascii?Q?obXjkmo0PCPFkl3/W6bacQvQ3znXX1N/ADf3nrM8R6tdT7e9lCWbidiUfiRn?=
 =?us-ascii?Q?b7gwuwBHxMsFOq3FKm97zQ1qq6P6ikNPoznxcrR6gf86vMi6faQUm5YRvLT3?=
 =?us-ascii?Q?azGNIDX/yCxJ19J10+SmhZTe7rCg2RDIQbu4iLyc4hj0wENZEpwusNU66/cs?=
 =?us-ascii?Q?1WoCICkW3kf33ZKKIHTeEU80rOrTBNipoxtvD8DkboMZvBB0fkgONX8SjG8M?=
 =?us-ascii?Q?ClsFibCUGdWsZBp9RbKsahrm6FISlspWSRTErR+khhStc8jmkkyBZLP9MXJk?=
 =?us-ascii?Q?b0wxsMjGLsXnopJl9QF4/DwfHikLSobaOO4m36u0+8n/VSeHrFVDlqChxdSp?=
 =?us-ascii?Q?u8sRY3yS6asT1EHmRBdveH53mUzJDdXs571sX0+bEn0t0N8Icap29lCWhBEI?=
 =?us-ascii?Q?PAVa84Qn4lwoLvNEwU9xeBiUNE/bE0cBG5Sguh8F4JvOfqNBK12zToixrsEA?=
 =?us-ascii?Q?K0/5FqJks2cc5dzFWDYXC5UoDpx682aq8yRxYPF2liFH3MiG0r2q9K+VDXa8?=
 =?us-ascii?Q?35nBMwnEDsccW5wRjve3Ygo6KPBoVUsz9nwXmZaCbw3qHysRQhmV+ANXomdm?=
 =?us-ascii?Q?WlOpr55VYnB5XLhtG5t4Fu9GqoUrQVgFXFTuKG8rMju6L3spjmK2araQwZL1?=
 =?us-ascii?Q?4xcUwPLXjluNgFUz3tWzzNcZSWYmJkeuou6R3ea4rRYlcKeYeU/TMy3ClKdR?=
 =?us-ascii?Q?DN0cVIOOoOWTCYaeTvZ0YcHnRQhCCQDkb3+/R1czh1GDzGXxUdT6wnBPjJDD?=
 =?us-ascii?Q?KJGTuIlxnmXSMiqdjQ6tB0NMi8aYiiYhu8lVQpIQgs7FFSQ2mC1X+9d5ynZB?=
 =?us-ascii?Q?J/xmVHchdOA9eqBCvr0Jy6UGHIEofUgXbVJmcmdiLQ1m36SZF/wGDaYlyDkP?=
 =?us-ascii?Q?SHJwTPrh07bUY2Zkx/XCoKH2dXuZKkj3rPQLGSvNWhDcbdp348fwP9rC3Fh0?=
 =?us-ascii?Q?1hzTAV3s5StZd+4KYKQCQyazKx8dsLutUzK3HvWcf/c0D9btoQxsV6WpsqWI?=
 =?us-ascii?Q?RKN9e7JidaEilgnihvocUCLJrx8FrYwX0iJW86KotT/I7J3bX/Sg6c1VzJ9N?=
 =?us-ascii?Q?dclEYm2MD9/DKxTDPgI=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700013)(376014)(82310400026)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 15:55:22.7889
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ad1523a-cb1c-48a3-7e88-08de0ff11405
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF000397B3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR19MB7077
X-Proofpoint-ORIG-GUID: FV_CVcyI7DAqaU40zja6asx0mUNvAv5w
X-Proofpoint-GUID: FV_CVcyI7DAqaU40zja6asx0mUNvAv5w
X-Authority-Analysis: v=2.4 cv=bdNmkePB c=1 sm=1 tr=0 ts=68f65b6e cx=c_pps
 a=hloNlEDlI3+XEZKeHTbqpA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=x6icFKpwvdMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KJT-RnjOAAAA:8 a=w1d2syhTAAAA:8 a=QyXUC8HyAAAA:8
 a=t79y7CTzVJ1LY0QAh3MA:9 a=HE_01F9_QflCRFonrIQr:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDEzMSBTYWx0ZWRfX0PWQwaIzfZ1R
 PNJvBTE/9bgQfoPQ/HiTLO4SqrExXDFU/WHHXnLQFrPCuK+BSjd1LdSQHpKzTiCl0W5xwI347op
 uuUtBq5wc/78IsNBfAYp21UQ9YAhewx+ib0RVCw6ChXdyLDFEuwRCokrnNJGARsX26nG0ks3+uV
 uegTcF5piV5zvSAFsJhuJkpYkIo28LrQPoA8y/5QHpuHg/pojtOPc0NeE0jm3p2JShagPAfSJHP
 X47xmHY5znd7goMxUFrck+5fh5KGMQD7GD9GA4I7NRVizY2e8CXoDy2upHCi64MuDr9VHcq7r5C
 fHjaIkleeJ1xdUVAbGm/cJcIZGyM7BJfIRvQx6xkeY1BywNFMTH7ofRzRkPeHSO7i65wV/MntWB
 MMT7fI3RUPrvSWZHFGLY5R1Alk9Z8w==
X-Proofpoint-Spam-Reason: safe

From: Maciej Strozek <mstrozek@opensource.cirrus.com>

Some instances of the XU Entity have a need for Files to be downloaded
from the Host. In these XUs, there is one instance of a Host to Device
(Consumer) UMP, identified by the FDL_CurrentOwner Control. FDL Library
introduced here implements the FDL flow triggered by FDL_CurrentOwner
irq, which sends a file from SoundWire File Table (SWFT) or from the
firmware directory in specific cases, to the Device FDL UMP.

Currently only Direct method of FDL is implemented.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v2:
 - Check disk size of firmwares
 - Reset on more FDL failure paths

 include/sound/sdca_fdl.h      |  58 ++++++
 include/sound/sdca_function.h |  24 +++
 sound/soc/sdca/Kconfig        |   8 +
 sound/soc/sdca/Makefile       |   1 +
 sound/soc/sdca/sdca_fdl.c     | 376 ++++++++++++++++++++++++++++++++++
 5 files changed, 467 insertions(+)
 create mode 100644 include/sound/sdca_fdl.h
 create mode 100644 sound/soc/sdca/sdca_fdl.c

diff --git a/include/sound/sdca_fdl.h b/include/sound/sdca_fdl.h
new file mode 100644
index 0000000000000..8b025aff4a0cd
--- /dev/null
+++ b/include/sound/sdca_fdl.h
@@ -0,0 +1,58 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * The MIPI SDCA specification is available for public downloads at
+ * https://www.mipi.org/mipi-sdca-v1-0-download
+ *
+ * Copyright (C) 2025 Cirrus Logic, Inc. and
+ *                    Cirrus Logic International Semiconductor Ltd.
+ */
+
+#ifndef __SDCA_FDL_H__
+#define __SDCA_FDL_H__
+
+struct device;
+struct regmap;
+struct sdca_fdl_set;
+struct sdca_function_data;
+struct sdca_interrupt;
+
+/**
+ * struct fdl_state - FDL state structure to keep data between interrupts
+ * @set: Pointer to the FDL set currently being downloaded.
+ * @file_index: Index of the current file being processed.
+ */
+struct fdl_state {
+	struct sdca_fdl_set *set;
+	int file_index;
+};
+
+#define SDCA_CTL_XU_FDLH_COMPLETE	0
+#define SDCA_CTL_XU_FDLH_MORE_FILES	SDCA_CTL_XU_FDLH_SET_IN_PROGRESS
+#define SDCA_CTL_XU_FDLH_FILE_AVAILABLE	(SDCA_CTL_XU_FDLH_TRANSFERRED_FILE | \
+					 SDCA_CTL_XU_FDLH_SET_IN_PROGRESS)
+#define SDCA_CTL_XU_FDLH_MASK		(SDCA_CTL_XU_FDLH_TRANSFERRED_CHUNK | \
+					 SDCA_CTL_XU_FDLH_TRANSFERRED_FILE | \
+					 SDCA_CTL_XU_FDLH_SET_IN_PROGRESS | \
+					 SDCA_CTL_XU_FDLH_RESET_ACK | \
+					 SDCA_CTL_XU_FDLH_REQ_ABORT)
+
+#define SDCA_CTL_XU_FDLD_COMPLETE	0
+#define SDCA_CTL_XU_FDLD_FILE_OK	(SDCA_CTL_XU_FDLH_TRANSFERRED_FILE | \
+					 SDCA_CTL_XU_FDLH_SET_IN_PROGRESS | \
+					 SDCA_CTL_XU_FDLD_ACK_TRANSFER | \
+					 SDCA_CTL_XU_FDLD_NEEDS_SET)
+#define SDCA_CTL_XU_FDLD_MORE_FILES_OK	(SDCA_CTL_XU_FDLH_SET_IN_PROGRESS | \
+					 SDCA_CTL_XU_FDLD_ACK_TRANSFER | \
+					 SDCA_CTL_XU_FDLD_NEEDS_SET)
+#define SDCA_CTL_XU_FDLD_MASK		(SDCA_CTL_XU_FDLD_REQ_RESET | \
+					 SDCA_CTL_XU_FDLD_REQ_ABORT | \
+					 SDCA_CTL_XU_FDLD_ACK_TRANSFER | \
+					 SDCA_CTL_XU_FDLD_NEEDS_SET)
+
+int sdca_fdl_alloc_state(struct sdca_interrupt *interrupt);
+int sdca_fdl_process(struct sdca_interrupt *interrupt);
+
+int sdca_reset_function(struct device *dev, struct sdca_function_data *function,
+			struct regmap *regmap);
+
+#endif // __SDCA_FDL_H__
diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index f557206cec83d..99cb978f7099b 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -285,6 +285,27 @@ enum sdca_xu_controls {
 	SDCA_CTL_XU_FDL_STATUS				= 0x14,
 	SDCA_CTL_XU_FDL_SET_INDEX			= 0x15,
 	SDCA_CTL_XU_FDL_HOST_REQUEST			= 0x16,
+
+	/* FDL Status Host->Device bit definitions */
+	SDCA_CTL_XU_FDLH_TRANSFERRED_CHUNK		= BIT(0),
+	SDCA_CTL_XU_FDLH_TRANSFERRED_FILE		= BIT(1),
+	SDCA_CTL_XU_FDLH_SET_IN_PROGRESS		= BIT(2),
+	SDCA_CTL_XU_FDLH_RESET_ACK			= BIT(4),
+	SDCA_CTL_XU_FDLH_REQ_ABORT			= BIT(5),
+	/* FDL Status Device->Host bit definitions */
+	SDCA_CTL_XU_FDLD_REQ_RESET			= BIT(4),
+	SDCA_CTL_XU_FDLD_REQ_ABORT			= BIT(5),
+	SDCA_CTL_XU_FDLD_ACK_TRANSFER			= BIT(6),
+	SDCA_CTL_XU_FDLD_NEEDS_SET			= BIT(7),
+};
+
+/**
+ * enum sdca_set_index_range - Column definitions UMP SetIndex
+ */
+enum sdca_fdl_set_index_range {
+	SDCA_FDL_SET_INDEX_SET_NUMBER			= 0,
+	SDCA_FDL_SET_INDEX_FILE_SET_ID			= 1,
+	SDCA_FDL_SET_INDEX_NCOLS			= 2,
 };
 
 /**
@@ -569,6 +590,9 @@ enum sdca_entity0_controls {
 	SDCA_CTL_ENTITY_0_FUNCTION_NEEDS_INITIALIZATION	= BIT(5),
 	SDCA_CTL_ENTITY_0_FUNCTION_HAS_BEEN_RESET	= BIT(6),
 	SDCA_CTL_ENTITY_0_FUNCTION_BUSY			= BIT(7),
+
+	/* Function Action Bits */
+	SDCA_CTL_ENTITY_0_RESET_FUNCTION_NOW		= BIT(0),
 };
 
 #define SDCA_CTL_MIC_BIAS_NAME				"Mic Bias"
diff --git a/sound/soc/sdca/Kconfig b/sound/soc/sdca/Kconfig
index 6a3ba43f26bd9..a73920d07073e 100644
--- a/sound/soc/sdca/Kconfig
+++ b/sound/soc/sdca/Kconfig
@@ -25,6 +25,14 @@ config SND_SOC_SDCA_IRQ
 	help
 	  This option enables support for SDCA IRQs.
 
+config SND_SOC_SDCA_FDL
+	bool "SDCA FDL (File DownLoad) support"
+	depends on SND_SOC_SDCA
+	default y
+	help
+	  This option enables support for the File Download using UMP,
+	  typically used for downloading firmware to devices.
+
 config SND_SOC_SDCA_OPTIONAL
 	def_tristate SND_SOC_SDCA || !SND_SOC_SDCA
 
diff --git a/sound/soc/sdca/Makefile b/sound/soc/sdca/Makefile
index a1b24c95cd8c8..be911c399bbde 100644
--- a/sound/soc/sdca/Makefile
+++ b/sound/soc/sdca/Makefile
@@ -4,5 +4,6 @@ snd-soc-sdca-y := sdca_functions.o sdca_device.o sdca_regmap.o sdca_asoc.o \
 		  sdca_ump.o
 snd-soc-sdca-$(CONFIG_SND_SOC_SDCA_HID) += sdca_hid.o
 snd-soc-sdca-$(CONFIG_SND_SOC_SDCA_IRQ) += sdca_interrupts.o
+snd-soc-sdca-$(CONFIG_SND_SOC_SDCA_FDL) += sdca_fdl.o
 
 obj-$(CONFIG_SND_SOC_SDCA) += snd-soc-sdca.o
diff --git a/sound/soc/sdca/sdca_fdl.c b/sound/soc/sdca/sdca_fdl.c
new file mode 100644
index 0000000000000..8a15c6300556c
--- /dev/null
+++ b/sound/soc/sdca/sdca_fdl.c
@@ -0,0 +1,376 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (C) 2025 Cirrus Logic, Inc. and
+//                    Cirrus Logic International Semiconductor Ltd.
+
+/*
+ * The MIPI SDCA specification is available for public downloads at
+ * https://www.mipi.org/mipi-sdca-v1-0-download
+ */
+
+#include <linux/acpi.h>
+#include <linux/device.h>
+#include <linux/dev_printk.h>
+#include <linux/dmi.h>
+#include <linux/firmware.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/regmap.h>
+#include <linux/sprintf.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_registers.h>
+#include <sound/sdca.h>
+#include <sound/sdca_fdl.h>
+#include <sound/sdca_function.h>
+#include <sound/sdca_interrupts.h>
+#include <sound/sdca_ump.h>
+
+/**
+ * sdca_reset_function - send an SDCA function reset
+ * @dev: Device pointer for error messages.
+ * @function: Pointer to the SDCA Function.
+ * @regmap: Pointer to the SDCA Function regmap.
+ *
+ * Return: Zero on success or a negative error code.
+ */
+int sdca_reset_function(struct device *dev, struct sdca_function_data *function,
+			struct regmap *regmap)
+{
+	unsigned int reg = SDW_SDCA_CTL(function->desc->adr,
+					SDCA_ENTITY_TYPE_ENTITY_0,
+					SDCA_CTL_ENTITY_0_FUNCTION_ACTION, 0);
+	unsigned int val, poll_us;
+	int ret;
+
+	ret = regmap_write(regmap, reg, SDCA_CTL_ENTITY_0_RESET_FUNCTION_NOW);
+	if (ret) // Allowed for function reset to not be implemented
+		return 0;
+
+	if (!function->reset_max_delay) {
+		dev_err(dev, "No reset delay specified in DisCo\n");
+		return -EINVAL;
+	}
+
+	poll_us = umin(function->reset_max_delay >> 4, 1000);
+
+	ret = regmap_read_poll_timeout(regmap, reg, val, !val, poll_us,
+				       function->reset_max_delay);
+	if (ret) {
+		dev_err(dev, "Failed waiting for function reset: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(sdca_reset_function, "SND_SOC_SDCA");
+
+static char *fdl_get_sku_filename(struct device *dev,
+				  struct sdca_fdl_file *fdl_file)
+{
+	struct device *parent = dev;
+	const char *product_vendor;
+	const char *product_sku;
+
+	/*
+	 * Try to find pci_dev manually because the card may not be ready to be
+	 * used for snd_soc_card_get_pci_ssid yet
+	 */
+	while (parent) {
+		if (dev_is_pci(parent)) {
+			struct pci_dev *pci_dev = to_pci_dev(parent);
+
+			return kasprintf(GFP_KERNEL, "sdca/%x/%x/%x/%x.bin",
+					 fdl_file->vendor_id,
+					 pci_dev->subsystem_vendor,
+					 pci_dev->subsystem_device,
+					 fdl_file->file_id);
+		} else {
+			parent = parent->parent;
+		}
+	}
+
+	product_vendor = dmi_get_system_info(DMI_SYS_VENDOR);
+	if (!product_vendor || !strcmp(product_vendor, "Default string"))
+		product_vendor = dmi_get_system_info(DMI_BOARD_VENDOR);
+	if (!product_vendor || !strcmp(product_vendor, "Default string"))
+		product_vendor = dmi_get_system_info(DMI_CHASSIS_VENDOR);
+	if (!product_vendor)
+		product_vendor = "unknown";
+
+	product_sku = dmi_get_system_info(DMI_PRODUCT_SKU);
+	if (!product_sku || !strcmp(product_sku, "Default string"))
+		product_sku = dmi_get_system_info(DMI_PRODUCT_NAME);
+	if (!product_sku)
+		product_sku = "unknown";
+
+	return kasprintf(GFP_KERNEL, "sdca/%x/%s/%s/%x.bin", fdl_file->vendor_id,
+			 product_vendor, product_sku, fdl_file->file_id);
+}
+
+static int fdl_load_file(struct sdca_interrupt *interrupt,
+			 struct sdca_fdl_set *set, int file_index)
+{
+	struct device *dev = interrupt->dev;
+	struct sdca_fdl_data *fdl_data = &interrupt->function->fdl_data;
+	const struct firmware *firmware = NULL;
+	struct acpi_sw_file *swf = NULL, *tmp;
+	struct sdca_fdl_file *fdl_file;
+	char *disk_filename;
+	int ret;
+	int i;
+
+	if (!set) {
+		dev_err(dev, "request to load SWF with no set\n");
+		return -EINVAL;
+	}
+
+	fdl_file = &set->files[file_index];
+
+	if (fdl_data->swft) {
+		tmp = fdl_data->swft->files;
+		for (i = 0; i < fdl_data->swft->header.length; i += tmp->file_length,
+		     tmp = ACPI_ADD_PTR(struct acpi_sw_file, tmp, tmp->file_length)) {
+			if (tmp->vendor_id == fdl_file->vendor_id &&
+			    tmp->file_id == fdl_file->file_id) {
+				dev_dbg(dev, "located SWF in ACPI: %x-%x-%x\n",
+					tmp->vendor_id, tmp->file_id,
+					tmp->file_version);
+				swf = tmp;
+				break;
+			}
+		}
+	}
+
+	disk_filename = fdl_get_sku_filename(dev, fdl_file);
+	if (!disk_filename)
+		return -ENOMEM;
+
+	dev_dbg(dev, "FDL disk filename: %s\n", disk_filename);
+
+	ret = firmware_request_nowarn(&firmware, disk_filename, dev);
+	kfree(disk_filename);
+	if (ret) {
+		disk_filename = kasprintf(GFP_KERNEL, "sdca/%x/%x.bin",
+					  fdl_file->vendor_id, fdl_file->file_id);
+		if (!disk_filename)
+			return -ENOMEM;
+
+		dev_dbg(dev, "FDL disk filename: %s\n", disk_filename);
+
+		ret = firmware_request_nowarn(&firmware, disk_filename, dev);
+		kfree(disk_filename);
+	}
+
+	if (!ret) {
+		tmp = (struct acpi_sw_file *)&firmware->data[0];
+
+		if (firmware->size < sizeof(*tmp) ||
+		    tmp->file_length != firmware->size) {
+			dev_err(dev, "bad disk SWF size\n");
+		} else if (!swf || swf->file_version <= tmp->file_version) {
+			dev_dbg(dev, "using SWF from disk: %x-%x-%x\n",
+				tmp->vendor_id, tmp->file_id, tmp->file_version);
+			swf = tmp;
+		}
+	}
+
+	if (!swf) {
+		dev_err(dev, "failed to locate SWF\n");
+		return -ENOENT;
+	}
+
+	ret = sdca_ump_write_message(dev, interrupt->device_regmap,
+				     interrupt->function_regmap,
+				     interrupt->function, interrupt->entity,
+				     SDCA_CTL_XU_FDL_MESSAGEOFFSET, fdl_file->fdl_offset,
+				     SDCA_CTL_XU_FDL_MESSAGELENGTH, swf->data,
+				     swf->file_length - offsetof(struct acpi_sw_file, data));
+	release_firmware(firmware);
+	return ret;
+}
+
+static struct sdca_fdl_set *fdl_get_set(struct sdca_interrupt *interrupt)
+{
+	struct device *dev = interrupt->dev;
+	struct sdca_fdl_data *fdl_data = &interrupt->function->fdl_data;
+	struct sdca_entity *xu = interrupt->entity;
+	struct sdca_control_range *range;
+	unsigned int val;
+	int i, ret;
+
+	ret = regmap_read(interrupt->function_regmap,
+			  SDW_SDCA_CTL(interrupt->function->desc->adr, xu->id,
+				       SDCA_CTL_XU_FDL_SET_INDEX, 0),
+			  &val);
+	if (ret < 0) {
+		dev_err(dev, "failed to read FDL set index: %d\n", ret);
+		return NULL;
+	}
+
+	range = sdca_selector_find_range(dev, xu, SDCA_CTL_XU_FDL_SET_INDEX,
+					 SDCA_FDL_SET_INDEX_NCOLS, 0);
+
+	val = sdca_range_search(range, SDCA_FDL_SET_INDEX_SET_NUMBER,
+				val, SDCA_FDL_SET_INDEX_FILE_SET_ID);
+
+	for (i = 0; i < fdl_data->num_sets; i++) {
+		if (fdl_data->sets[i].id == val)
+			return &fdl_data->sets[i];
+	}
+
+	dev_err(dev, "invalid fileset id: %d\n", val);
+	return NULL;
+}
+
+static void fdl_end(struct sdca_interrupt *interrupt)
+{
+	struct fdl_state *fdl_state = interrupt->priv;
+
+	if (!fdl_state->set)
+		return;
+
+	fdl_state->set = NULL;
+
+	dev_dbg(interrupt->dev, "completed FDL process\n");
+}
+
+static int fdl_status_process(struct sdca_interrupt *interrupt, unsigned int status)
+{
+	struct fdl_state *fdl_state = interrupt->priv;
+	int ret;
+
+	switch (status) {
+	case SDCA_CTL_XU_FDLD_NEEDS_SET:
+		dev_dbg(interrupt->dev, "starting FDL process...\n");
+
+		fdl_state->file_index = 0;
+		fdl_state->set = fdl_get_set(interrupt);
+		fallthrough;
+	case SDCA_CTL_XU_FDLD_MORE_FILES_OK:
+		ret = fdl_load_file(interrupt, fdl_state->set, fdl_state->file_index);
+		if (ret) {
+			fdl_end(interrupt);
+			return SDCA_CTL_XU_FDLH_REQ_ABORT;
+		}
+
+		return SDCA_CTL_XU_FDLH_FILE_AVAILABLE;
+	case SDCA_CTL_XU_FDLD_FILE_OK:
+		if (!fdl_state->set) {
+			fdl_end(interrupt);
+			return SDCA_CTL_XU_FDLH_REQ_ABORT;
+		}
+
+		fdl_state->file_index++;
+
+		if (fdl_state->file_index < fdl_state->set->num_files)
+			return SDCA_CTL_XU_FDLH_MORE_FILES;
+		fallthrough;
+	case SDCA_CTL_XU_FDLD_COMPLETE:
+		fdl_end(interrupt);
+		return SDCA_CTL_XU_FDLH_COMPLETE;
+	default:
+		fdl_end(interrupt);
+
+		if (status & SDCA_CTL_XU_FDLD_REQ_RESET)
+			return SDCA_CTL_XU_FDLH_RESET_ACK;
+		else if (status & SDCA_CTL_XU_FDLD_REQ_ABORT)
+			return SDCA_CTL_XU_FDLH_COMPLETE;
+
+		dev_err(interrupt->dev, "invalid FDL status: %x\n", status);
+		return -EINVAL;
+	}
+}
+
+/**
+ * sdca_fdl_process - Process the FDL state machine
+ * @interrupt: SDCA interrupt structure
+ *
+ * Based on section 13.2.5 Flow Diagram for File Download, Host side.
+ *
+ * Return: Zero on success or a negative error code.
+ */
+int sdca_fdl_process(struct sdca_interrupt *interrupt)
+{
+	struct device *dev = interrupt->dev;
+	struct sdca_entity_xu *xu = &interrupt->entity->xu;
+	unsigned int reg, status;
+	int response, ret;
+
+	ret = sdca_ump_get_owner_host(dev, interrupt->function_regmap,
+				      interrupt->function, interrupt->entity,
+				      interrupt->control);
+	if (ret)
+		goto reset_function;
+
+	reg = SDW_SDCA_CTL(interrupt->function->desc->adr, interrupt->entity->id,
+			   SDCA_CTL_XU_FDL_STATUS, 0);
+	ret = regmap_read(interrupt->function_regmap, reg, &status);
+	if (ret < 0) {
+		dev_err(dev, "failed to read FDL status: %d\n", ret);
+		return ret;
+	}
+
+	dev_dbg(dev, "FDL status: %#x\n", status);
+
+	ret = fdl_status_process(interrupt, status);
+	if (ret < 0)
+		goto reset_function;
+
+	response = ret;
+
+	dev_dbg(dev, "FDL response: %#x\n", response);
+
+	ret = regmap_write(interrupt->function_regmap, reg,
+			   response | (status & ~SDCA_CTL_XU_FDLH_MASK));
+	if (ret < 0) {
+		dev_err(dev, "failed to set FDL status signal: %d\n", ret);
+		return ret;
+	}
+
+	ret = sdca_ump_set_owner_device(dev, interrupt->function_regmap,
+					interrupt->function, interrupt->entity,
+					interrupt->control);
+	if (ret)
+		return ret;
+
+	switch (response) {
+	case SDCA_CTL_XU_FDLH_RESET_ACK:
+		dev_dbg(dev, "FDL request reset\n");
+
+		switch (xu->reset_mechanism) {
+		default:
+			dev_warn(dev, "Requested reset mechanism not implemented\n");
+			fallthrough;
+		case SDCA_XU_RESET_FUNCTION:
+			goto reset_function;
+		}
+	default:
+		return 0;
+	}
+
+reset_function:
+	sdca_reset_function(dev, interrupt->function, interrupt->function_regmap);
+
+	return ret;
+}
+EXPORT_SYMBOL_NS_GPL(sdca_fdl_process, "SND_SOC_SDCA");
+
+/**
+ * sdca_fdl_alloc_state - allocate state for an FDL interrupt
+ * @interrupt: SDCA interrupt structure.
+ *
+ * Return: Zero on success or a negative error code.
+ */
+int sdca_fdl_alloc_state(struct sdca_interrupt *interrupt)
+{
+	struct device *dev = interrupt->dev;
+	struct fdl_state *fdl_state;
+
+	fdl_state = devm_kzalloc(dev, sizeof(struct fdl_state), GFP_KERNEL);
+	if (!fdl_state)
+		return -ENOMEM;
+
+	interrupt->priv = fdl_state;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(sdca_fdl_alloc_state, "SND_SOC_SDCA");
-- 
2.47.3

