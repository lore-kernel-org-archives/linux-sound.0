Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E23923B61B;
	Mon, 26 Jan 2026 14:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769438438; cv=fail; b=Y3lEoAdrblLxiOvLOGkGwgn9rudQRcuaPpnETWrde8i82dLSk5olJzDVBfTUt03opVa3FyRFGOumKzl+juMRX9nJSxy+/vSmwnhFsT5Wbm+fqqXjE8Dr1xdruQQrUFn0vDfOitWKQ/lTkeMxbjBjXK1fDeCcnsRoaKW3Xh7chz0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769438438; c=relaxed/simple;
	bh=G+ZinInZWciO8IpljGEqTzowplJm7uUpiD7JWD8tHSY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VdruBlJnNSV9xnydktBtZOEXoXo5iBb6kl8AcpIuFJSnagC9pQ9gPKVEwMdIIOvJAP6YNK1cFDG+caZewl0ueHhe7iMcvgy1QynLtSz1eZ7L1ftYpaDHB4ONqqsUFjxltCbOiy9PpCI0Q6622gbQ/xm6v8GS2opL1ccYG94cVUA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ItJwVHDW; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=y4fiWYp6; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ItJwVHDW";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="y4fiWYp6"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q7XHSm3572519;
	Mon, 26 Jan 2026 08:40:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=Qx/x9ma6Sqm78cAQ
	LoNAblwDLPDkSHEtc7CS1cep2us=; b=ItJwVHDWzmCVylFta8xxBC62hRxV+DgL
	XnollVYm8zd6W4ADMX1mBqF1F0ykyn3PADz61H6N/xRFsrnFYZYWizIQ7a61nzGV
	xJUOL/y2z1vVU2w7fzEQ/4OeKxwMCSH7ofDMHN9b5Zus3yYm1jmv1moHvglQWvew
	MDxfFEjkAItVf+nsbWrlOVCenChk6jdO36GsOj1ESNPd7O5Y5POn0yoRz+Dh4LRx
	HszJPRQUbNyTXs3bkWdewUUUDF3Xl63l2anhX8Y1c37TsgMkjff53TfcqyPBeBFk
	R2cIxcWIe6og1EKjegSKDciuzMRpwvsAanI6qaCje/s27SFTp9owfA==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020072.outbound.protection.outlook.com [52.101.56.72])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4bvuck9kta-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 26 Jan 2026 08:40:24 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s7SdhOJBM4LRtH7kT27fwFVBeGLrxEwvsHIKOW5Hsuhe/0VrIZnKWmkIjL1JWbbAp/A4N/I/MMIZDouJep27DWS1qT2HPamauHitH8JYK2y0ev/RiCRaHnJqq5lG3SOZ3QO3u9WHrIcKeT/72Xqtc78/VMnuAHG417WI9fSGjtDHhzejo2br//KCEdQksq2Y2iAsrywhw8Fo270yz81YS4BPEowgY1s482/bFixaauIVBZ5JeXyzVif8FeC4OIUpZsrdLsGq/Sxly3NIaU0FE2JDtCepFZvg0g4/oic+PMYxHAEeirpmbInT+P72rzXcJ7yDFFBb2j9hDkGm6PO+sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qx/x9ma6Sqm78cAQLoNAblwDLPDkSHEtc7CS1cep2us=;
 b=TiTp57PW22anwPWJw4JUCv+ropQD+FUjB16LNJMeJJV6OenGaRoA2Gillre7eQ8i1vuFkKRV/GU9F5+4P354KYPSGOGza10ZtLqI7G/E9Bnd7E7aO6+cEuKcKc4egLqQzObfo3NDBBNJiVT8hlWbnjuyIow4rO7loerDivm53gOZhxrQM7jGUeeFx6uUSsLgXb2QMlPDGAp4/ebTH6nFg9wQwSLJuZdx7HI5NYKAgmw1XPphl9qppBs23nDK+NvhDBlM9s6YdKs6KTWmn3oN236C0GUxrf1YKDVIAjFmf9JXmfmCkhDi4o8RqkkvojY+EjUQfKDOSi6boipI73vTMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qx/x9ma6Sqm78cAQLoNAblwDLPDkSHEtc7CS1cep2us=;
 b=y4fiWYp6Xnr519jKZDeqDIgnwY/w/rahx1cw8lGgXoYzSmeurkaKT5P/Mul2yF/3VS7twz/mwcIDarMX1HdQaE3/ulrNs+y/CwbMI6mfkxjjfZIjg/eI3qJGB/zxK27pPHhnnMj4w9aVLx7fJHzvGy5plyub0wQcz+N/DitPchI=
Received: from BYAPR06CA0071.namprd06.prod.outlook.com (2603:10b6:a03:14b::48)
 by MW4PR19MB6934.namprd19.prod.outlook.com (2603:10b6:303:213::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.12; Mon, 26 Jan
 2026 14:40:20 +0000
Received: from CO1PEPF000044EE.namprd05.prod.outlook.com
 (2603:10b6:a03:14b:cafe::6f) by BYAPR06CA0071.outlook.office365.com
 (2603:10b6:a03:14b::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Mon,
 26 Jan 2026 14:40:22 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF000044EE.mail.protection.outlook.com (10.167.241.68) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3
 via Frontend Transport; Mon, 26 Jan 2026 14:40:18 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 24CE3406540;
	Mon, 26 Jan 2026 14:40:17 +0000 (UTC)
Received: from upx-mtl-008.ad.cirrus.com (upx-mtl-008.ad.cirrus.com [198.90.251.5])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 03811820249;
	Mon, 26 Jan 2026 14:40:17 +0000 (UTC)
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, devicetree@vger.kernel.org,
        Maciej Strozek <mstrozek@opensource.cirrus.com>
Subject: [PATCH v4 0/4] Add support for CS42L43B codec to CS42L43 driver
Date: Mon, 26 Jan 2026 14:39:14 +0000
Message-ID: <20260126144011.140029-1-mstrozek@opensource.cirrus.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044EE:EE_|MW4PR19MB6934:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e7f70131-ae69-4e79-7477-08de5ce8d403
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|61400799027|7416014|376014|82310400026|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/bZmxXtBhKRP5oIPsQAsu0Kpyt4O38fOMyj7U8KlUDfhJH3ODDJi9shZskWn?=
 =?us-ascii?Q?pi2mN/953UU7Xk12zsKAJQWMe+GE/A0j7y+z1LH5SkSsAR/FKwRGHpfQe783?=
 =?us-ascii?Q?4BTDRU74Hoc7GX51x84/ajpOJn6/rM9tWa3Ua7VS9/z0osLicF6PUE/hq8Jz?=
 =?us-ascii?Q?aU80zkGQec+/st+GnAUq7EJKG5IjVqODRa0d2e4kZFo1rLt8I+f5ySL7gioI?=
 =?us-ascii?Q?K0tFmPXD56Gz1eRKJB8PY+opS8AjmGJ6NGy7VrRJJoLqQ0IwcqhE6YLEb0nQ?=
 =?us-ascii?Q?jTVadFq70HFCqc8mSZfiRe8hVn1I7mFtFKTSweZso64mVnj3+L8ExQkCR1Kv?=
 =?us-ascii?Q?Rcoqq+hEhOf4NTwYD36LeM8qjA10lpAJqscv38EbQc3YpfTHKfkxbbXpOMJ3?=
 =?us-ascii?Q?VfdhDnnSHTNXSnzxV+yWcKrQtO/d1MaCzCrjcn/SV1mjVjMRtS5scgl28KqX?=
 =?us-ascii?Q?8i4QQVjsb8OyQl2uBMdH6QB+gPkeZ7od5p6U4PJCpSo8nL6fEtSaLc7qiAA8?=
 =?us-ascii?Q?vLe/i32CJTV+3DGxYqlTIzzxZXNcgUspkFNhDvKXZz0O1vx5O+OqijmJMJ/7?=
 =?us-ascii?Q?P5eDgaqvuYkMrLdj0qtqgKhgxYQFVSwUQ5H6dDjHW8pqxFdxX+CX2eLSPPHJ?=
 =?us-ascii?Q?lllY+L834/Rh88AlneCe0vD/dFEUK17chLtLjsOrHZe3GgFNRoi9lgBf0WYc?=
 =?us-ascii?Q?8K6ybANijKX5dASKBQ0fdc3/qwpmchWp0vX5mbawZ+AlMGpUH1cgq0Ih+JDp?=
 =?us-ascii?Q?yitmmQsFE9r4pn3LCkFGdXIScULBbCH01cS4Rpls2mSB2ZNzrWUmONTuIQBC?=
 =?us-ascii?Q?u+HlwI61/y8UUrU84mNRpLXmgZM2JNpqaoQNYVjF1Jqhq5G6BaaR/hn0anlw?=
 =?us-ascii?Q?jqSRGmXFRLOf52ZiLk0bURJUQ4wV/8cza/CbCdrZFROs+JIE2tiy5Wd6QveI?=
 =?us-ascii?Q?XmkLd9uaZ4rljQbzL0rz9wNvVQQBWMxIIAVhayoJuqzHHMGDNaKJprHdY+Qb?=
 =?us-ascii?Q?i7vMP/IuCxmQnsIczmyN/51g0GTH2/nKlQSLgFoIt/+6alSsnymBEyXmSKPV?=
 =?us-ascii?Q?NturlfUeLOuIgtlM29XxXOgO8CUckI53GJIAII+rY5PMqghfFUo6bDSWw68l?=
 =?us-ascii?Q?E8rTBIXzscixoUuPX+SEIpgvT+uCma41dX9r5OfJ0WO3zZagKDnx5ET8HJli?=
 =?us-ascii?Q?QbDbb6q0N4dE92zALlAba9xdxGao336Jq/MUkTFiPbqUVTHsdR7jVtsb1wio?=
 =?us-ascii?Q?s7yWY+kdd9pWGJuwkY8ryU8+RnpvSbrwihu1iyVGoRsRthUv37C2nLsBLCoW?=
 =?us-ascii?Q?D/7JZIpIelG6OkdAtHVKj+VioxXzT00537wEknIj63F/gCzj+RxGiAhqCrlK?=
 =?us-ascii?Q?ikkjZyzNnFSobiYOJnt3WMLZPlDF6pDqp0NdCPr9lVyQiGe7J6UTj1wZS6SG?=
 =?us-ascii?Q?bLgp3ZiTdynx6/bCGjKN6nenH9YAyS8HzOfd8jFFLSqrhRbsuhSNyM/q1pFx?=
 =?us-ascii?Q?E6R0Hmw38tvBfUFYQJ7oiL/aaeq/OqSqmSxxyxI/UMShPcRPpr0AGdtiAgsm?=
 =?us-ascii?Q?1CMeZq3qUjDUUhtRIy90pRZyQKn3lYn+0NzgX/GyWGdAO9YctL0+qG0vEHeH?=
 =?us-ascii?Q?NjRyj0SZT/yjlipg5+2DmEL43F3KR5t69Ec6YnHSNSVQAx8cWVIfefJ6Rc8c?=
 =?us-ascii?Q?sY9x8w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(7416014)(376014)(82310400026)(54012099003);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 14:40:18.9065
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7f70131-ae69-4e79-7477-08de5ce8d403
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF000044EE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR19MB6934
X-Proofpoint-ORIG-GUID: 8hQNygNzewmiq79xR9n5iPVkZOAp_q41
X-Proofpoint-GUID: 8hQNygNzewmiq79xR9n5iPVkZOAp_q41
X-Authority-Analysis: v=2.4 cv=Vb/6/Vp9 c=1 sm=1 tr=0 ts=69777cd8 cx=c_pps
 a=EuzLu2ZwJ/NCzAOim5xawA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=3fcK6sipGkM-lnU_H0wA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDEyNSBTYWx0ZWRfXzAaXCYrBK3zj
 Rt3RD/cU/uPvtX0SafAoPagclJR8EZfPVUU58LadIRSJkIzUs5+p3Q3YZVFAHdU1gLqQdJnhtJZ
 AzE/AK3XL6xkteTfUbv+0Svk4uUClBbXs6pTjdEPgZiLJytj6n2xAP9ZCuPL57/eRtfNzopWyaj
 8twkGeYibGgu4AP6SzW1vfiY326AzAA/IPk5Amwe7j0ZKISWMaVmkcZScA1ADQZkb+5U8cgAmkq
 nKceBEsyKItt3S7FjHsWUT0zvrHtr5TgCPRAQdSBauDImktIzUt+ppTGwUZH+jZP2O8Sc0KeVRH
 RRDEaEQABEZtZXPjl7dWUzK2OtI5oYjRoqF0kEAevVLlkrcSt2mqMWYCkF41wDHAHIGPXSeY1vs
 Frh4zjaHghEn717qrCDQxbe0EgeOxqdXTQY1ElNhe9wEuXsfZuLeksBVTqxvtj/LEqSL9qDQy3f
 2wEo1pXKc9VWXYCCE+A==
X-Proofpoint-Spam-Reason: safe

Hello,

Introducing CS42L43B, a variant of the CS42L43 codec with changes to
PDM (DMIC) inputs, RAM/ROM memory and extra channels to two SoundWire
ports and ISRCs, and can be supported by the existing CS42L43 driver
with some modifications.
Support is split into four commits:
 1. Add CS42L43B codec info to SoundWire utils
 2. Add dt binding for the new variant
 3. MFD driver part 1/2
 4. ASoC codec driver part 2/2

Regards,
Maciej

---
Changes in v4:
 - change variant_id to long int
Changes in v3:
 - fix incorrect type cast in mfd patch
Changes in v2:
 - Rework the mechanism to identify the new variant along with some
   error handling improvements.
 - Added some comments in cs42l43_readable_register() for clarity.
 - Add handling of the I2C path for the B variant
 - Add a dt binding for the new variant
 ---

Maciej Strozek (4):
  ASoC: sdw_utils: Add CS42L43B codec info
  ASoC: dt-bindings: cirrus,cs42l43: Add CS42L43B variant
  mfd: cs42l43: Add support for the B variant
  ASoC: cs42l43: Add support for the B variant

 .../bindings/sound/cirrus,cs42l43.yaml        |   3 +
 drivers/mfd/cs42l43-i2c.c                     |   7 +-
 drivers/mfd/cs42l43-sdw.c                     |   4 +-
 drivers/mfd/cs42l43.c                         |  93 ++-
 drivers/mfd/cs42l43.h                         |   2 +-
 include/linux/mfd/cs42l43-regs.h              |  76 ++
 include/linux/mfd/cs42l43.h                   |   1 +
 sound/soc/codecs/cs42l43.c                    | 756 +++++++++++++++---
 sound/soc/codecs/cs42l43.h                    |   4 +-
 sound/soc/sdw_utils/soc_sdw_utils.c           |  54 ++
 10 files changed, 848 insertions(+), 152 deletions(-)

--
2.48.1

