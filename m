Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E940D3148D6
	for <linux-sound@vger.kernel.org>; Thu,  6 Nov 2025 11:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762429905; cv=fail; b=MB8nauqTw8kr/Ub7QeviqB7oz/9kNZrd44RtLnLYc204QFuTI9PvR+H1qdHrU17mynrtg2tbelCE9ZcnOiwGwO0Dde4aXVoge7MIQXOl0bcM1cco49daD1BAr39HJ1JVumX150FqnlnRDJPsgf2gZ9Y5xCWwed4URMeYweZS74Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762429905; c=relaxed/simple;
	bh=+HYUumzhJCXG4M2qnz4rkRPzOIuC9ztVw4wrpm3LceY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SNuQyxsBxOMtF420YFOygBHPFbKct4wBj3UI0A5DA4XS1DcwICyTwHzUKh4c4R6ZrI4BHj2E/GxGKxPWCZEHHBNZ1SgzT1MdB++W5dKc6Ab7F5pcqKmGWUjUsat+tRBedLhN4raY+W3KjUsROxUrdEgAyqeOzp8A6FGZRoMqZEQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=qny6zeiF; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=OPb309Bf; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="qny6zeiF";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="OPb309Bf"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A61vDGv1122962;
	Thu, 6 Nov 2025 05:44:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=Odi27ZJF8VGcNA2HfPt66zbNAskaIb46yoCrs9ibE3g=; b=
	qny6zeiFiGCKS2XC5vrMJhvyRT1n6wwAt+auZ/PQjOkHu20ZAND7bpRAy7risWDa
	HNhcGV+QpmIWhwgIrNAb4NKUHTfMeWgbvdQVCI7ES4I8EAYi0adBymbhe6LYqri5
	J/aVcpRb1ZjP6GuetwZrhF4nukWK7T/WOgwhwm8GW+PGnxXZSi/UyREvEW9bgYGV
	QmYNFMxy7tKDQi//AZEEcEWXBbGUaK7iwn/i/0Riyht+ZvUXfoO0TT/3re3KrtfJ
	HZ4xbYei2IMvRyM2VjQcbvLVr6F0wVnbtUTCEnYu7TAOYi0gN1Nlk62XUgXcEUSl
	ohK65rSYgUkSrKQkLGfwZQ==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022121.outbound.protection.outlook.com [40.107.200.121])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4a783wun4g-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 06 Nov 2025 05:44:31 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B1c0dvRsIyLS1jEwXR4yw78dghSc/78kCMaFkK1P+4JMLh0VCMVHzpQ3bwFIPR+S/Hu7FaGkP7OH/RSs4Z+3BajMBwuuKi9CNhZf1CSHecmAzy0vAb+WTI/iTabO4r68lUUMxn6xnuJbmcxo5Q0+/3wvrry71oJxpML5kDBx0jcohDHNLStYxcZDsFDWkFKnV95jA9kgcYrrEMWrpleYnh17TcMfpGzJ4a8rHznqhcB7PilGR8gN54hqKypETZbNQI+MhRbenAmKGGTlI2a5263wG/A2taAZ9bmYZ4K5NByGtWsk9LuuW5rQKvLZDpasLHus8ZeGBRE9tUe2Pw59TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Odi27ZJF8VGcNA2HfPt66zbNAskaIb46yoCrs9ibE3g=;
 b=I9aJa3TlDGHVFqQOe8Y8jlwN2x7flyN1yz9KrCACoqZLGJRdEs+kwt4r7EIjbNYQPDEKWeQHA/ZgkdysVRG32/LuyCP6RD+DcW5FoiWaW5hICkFqnbUYONcWr21PaKIYNEaEPYdGCbzte73V2LZgK5ai9TEiBK1tnBy8/VJa8kdEOp/iojo1m5OZFHZkIP2isTiJaBZGgY3EdqNzPzLEnr/f+09noQebFzDm7tPtazmmFvx2+Ws8HlVl5/zTOe0oACqlgmiS6eiKO2nFFWw1cpdrWPZ2Gm9+XCVR961gzEGr7DXMQAVjk1Mk7X14M99DIeQGp/4uKoRgFAGGYTw1cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Odi27ZJF8VGcNA2HfPt66zbNAskaIb46yoCrs9ibE3g=;
 b=OPb309BfTliyrENwZgUhW0G7tQw9qHAUTBTOI0Vt6HpMqmZfUsaOuRz54noxfPjeHJJ3QIkpMFjc2HUS7oodiuCzfbPUeZTicc/zct7EwylyRbP5zdN/Rcx/qUWOapXS4gCNbeIYOaS8QGILeL6YTWrCD2vUliZ/WcJ/tHwiNNo=
Received: from MN2PR01CA0012.prod.exchangelabs.com (2603:10b6:208:10c::25) by
 SA1PR19MB5246.namprd19.prod.outlook.com (2603:10b6:806:186::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 11:44:28 +0000
Received: from MN1PEPF0000ECD7.namprd02.prod.outlook.com
 (2603:10b6:208:10c:cafe::77) by MN2PR01CA0012.outlook.office365.com
 (2603:10b6:208:10c::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.12 via Frontend Transport; Thu,
 6 Nov 2025 11:43:38 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MN1PEPF0000ECD7.mail.protection.outlook.com (10.167.242.136) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.6
 via Frontend Transport; Thu, 6 Nov 2025 11:44:26 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id F178D406554;
	Thu,  6 Nov 2025 11:44:25 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C45A7820273;
	Thu,  6 Nov 2025 11:44:25 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 04/13] ASoC: SDCA: Correct FDL locking in sdca_fdl_process()
Date: Thu,  6 Nov 2025 11:44:13 +0000
Message-ID: <20251106114422.906370-5-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251106114422.906370-1-ckeepax@opensource.cirrus.com>
References: <20251106114422.906370-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD7:EE_|SA1PR19MB5246:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: de328991-5f75-4613-fb1f-08de1d29d6ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|61400799027|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0+/uGaJ5uCWlSRY8DusFU44UOO0EnjfdmumNiHPG1sEiDRRWbJ4dbLwHrAtD?=
 =?us-ascii?Q?fPCCHweMGkx/sNk4QEQ2DOakWxLjutmgO4Ek9FwymBMp70t6BlCgSYSqDE2e?=
 =?us-ascii?Q?aIITKlNwYrQyXsyBHCSXRQQyynO+c0DTXLhCnAh9ski9mqTmRv5IPWBU3wQJ?=
 =?us-ascii?Q?hI+sQb1i4ng9P5kIr12OHkHIHluLO9orl5BQluaGVwpE1iAPHy6dccsGQ68i?=
 =?us-ascii?Q?Q/epgsuxf2BvpyfJyNd3ijBXXBW27fd9sF+TtgT8vMSvXHzdyFLHqcOTEWQT?=
 =?us-ascii?Q?TK25pndBQrSHx0FJxCobJVtZJDh4ICK3R6HOomkchB2sy28YhYy5kgx/7jVi?=
 =?us-ascii?Q?YExVkxnqNMGqKVVGxJ9qIaFq5ekVnt+UUt36GprhOedNWBZPsuk8S0u3RLMq?=
 =?us-ascii?Q?VuUeQb5dRGIKFewl2+wUX/XyDh5ncJeKEB8L9uCKRqHZRTiRfWyasxQuJdt+?=
 =?us-ascii?Q?KACWB/q0UmtVkcQhaP8cszrEKwTjhrZkXI6zLrOVZ53worxRzO+AitnmoM6n?=
 =?us-ascii?Q?8nYlOsG3BykCcvlxLcDIS58s3QWYD9oido06MZ/kO9WOzSBylKh8DztwNk3H?=
 =?us-ascii?Q?/8QjukYonZVS9gjA7rD+Ly/eZlhLMXVw4NzdWb2MAnwIlFeXrSKqtKwuMsuY?=
 =?us-ascii?Q?64TgohewDT4lRkU0Z78zVp838YFtlwm+WtPIuJ2jgTuQOJGAWVahT1MsoJYB?=
 =?us-ascii?Q?ndSLa6nQOOEsjt3knSeKfK2G9ktaUTleNDdUYcEvHi87Cq+StVodZL65QQJn?=
 =?us-ascii?Q?5z0+5dhWGIJFrJYa0yPEcGJ/z7ol272RBGEqisrKcUPmShXmZewRXh5YJpFE?=
 =?us-ascii?Q?CKnmNaUMQ/7w6u97jeQ0DyNAvUzGJNIScuXiyxAuSZ7MvtFLODwIZHEh1tvR?=
 =?us-ascii?Q?RuRF5CM+jF/bv1HekHIVaUhiiNp6rGWWN3FLfgCatZCdUc3IcWrPg6JkS4BP?=
 =?us-ascii?Q?LvfLvxOCg7DZEZ9/5R/4tXPkVVO/1VhY9X9Ou181YMmbWJopKaWzzAVli8ma?=
 =?us-ascii?Q?LO/dvKJd03JKLmBHGyalcSu7IfWGEyUppE8odg+Irs3qXCIKs+etzGarol2P?=
 =?us-ascii?Q?sFbKoHH8neeaTY7/7COBjpkde9BBBEuQbjoEUc7oBc3XN5kPBV4gX6l5zSLc?=
 =?us-ascii?Q?jyVVyk0oU6IzLT5NahZ8lUwKEPgA86q25epJl2ZDbvUY2I8zie/cA3ceQhH+?=
 =?us-ascii?Q?T/ApCbcvedSyt2EE+AaczE920PZ3GqbWox+5G0K3SmMysSryLPP5JKMXysRN?=
 =?us-ascii?Q?Jc+t98MLy1HcW6CMuEhcAqpCxmc2XmS+7+BlF+ZzU88NtzUY220EjbHlq0T0?=
 =?us-ascii?Q?TsxeasRRVMOFVs6ryK8aTMxLF7RVVvF/S1gZ1YYCL2pe1MBloubrJPpXWf1J?=
 =?us-ascii?Q?v8coSXiHRhBMnlnNvXn6CAiA68Caegwfo1Xu16cvtjdiSLLh/zVroSU3U9CU?=
 =?us-ascii?Q?2PbNNyzkjj4XhBYca6u+Zj39FRtprRXe55id1etXtz2QY3YTnA8Xw6SE9OQk?=
 =?us-ascii?Q?3fgIK3q7XxgYELW/v7mDw1UGUUATna0Wzwu5pyYrJxO/cLdqLP0j0AHlGggA?=
 =?us-ascii?Q?YNPcwypc6GhgSNh2yPA=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(61400799027)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 11:44:26.7654
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de328991-5f75-4613-fb1f-08de1d29d6ea
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MN1PEPF0000ECD7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB5246
X-Proofpoint-GUID: l1CRcT1_vRgtgR5JGtFbhjgCgt6ZNMQ_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDA5MiBTYWx0ZWRfX1Vb1FS9ZswxL
 PtPlMxyoaVfFmG19x5uuwZjg/dOQZNGV4qc/rFziZ9jDMpiBvx/lC+ftWKDb0oKsnQ2AoLyAtzS
 CIVrcuzySf7eNXX734tCKr8CUvxAv+W4z1O7VW8mwp09piS8kZJVD0mQnxtJ8Jk7ijIFGGdUrua
 R0AKCeDxK1zWRg+Ue77TlEyzY+IbLkStOkSVITsacBGvaIn8tjzJy2Pr7GQkK9Uhs0pb7dWLjNp
 cTqyUHdWEimDC9vcGMugngYNoe06jeUCKh0GhUPT5Q0ee5FDBIeDT+YlLD9DyB6JPgHy+q4ebDB
 875qfVQAu1MmlOZI0How2gv7jgBSpmh28ni9zSawmDDHF1osCFRRH3rBUepX0lI7/5RLnXf+/r6
 NlqzEAU1j9t/t5eOiPQBNP/OoHK/yA==
X-Proofpoint-ORIG-GUID: l1CRcT1_vRgtgR5JGtFbhjgCgt6ZNMQ_
X-Authority-Analysis: v=2.4 cv=b9G/I9Gx c=1 sm=1 tr=0 ts=690c8a1f cx=c_pps
 a=PlzX2GN61/O3EU/AUs1JWA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=AH0PBg6uO5gFn4kjdIUA:9
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Reason: safe

The current locking in sdca_fdl_process() locks over
sdca_ump_cancel_timeout() and the timeout work function takes the same
lock, this can lead to a deadlock if the work runs as part of the
cancel. To fix this move the guard() call to below the cancel timeout,
putting it outside the lock.

Fixes: e92e25f77748 ("ASoC: SDCA: Add UMP timeout handling for FDL")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v2:
 - Switched back to guard() and just moved it down a little.

 sound/soc/sdca/sdca_fdl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sdca/sdca_fdl.c b/sound/soc/sdca/sdca_fdl.c
index cb79dc3131b82..bc88d24d63d7f 100644
--- a/sound/soc/sdca/sdca_fdl.c
+++ b/sound/soc/sdca/sdca_fdl.c
@@ -402,8 +402,6 @@ int sdca_fdl_process(struct sdca_interrupt *interrupt)
 	unsigned int reg, status;
 	int response, ret;
 
-	guard(mutex)(&fdl_state->lock);
-
 	ret = sdca_ump_get_owner_host(dev, interrupt->function_regmap,
 				      interrupt->function, interrupt->entity,
 				      interrupt->control);
@@ -412,6 +410,8 @@ int sdca_fdl_process(struct sdca_interrupt *interrupt)
 
 	sdca_ump_cancel_timeout(&fdl_state->timeout);
 
+	guard(mutex)(&fdl_state->lock);
+
 	reg = SDW_SDCA_CTL(interrupt->function->desc->adr, interrupt->entity->id,
 			   SDCA_CTL_XU_FDL_STATUS, 0);
 	ret = regmap_read(interrupt->function_regmap, reg, &status);
-- 
2.47.3

