Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E1536CDF1
	for <linux-sound@vger.kernel.org>; Thu, 20 Nov 2025 15:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763652665; cv=fail; b=cFwSU7F6HTUmcEqrrsQnatMVL9Uhpw1uhreAA5EnQ4iryKk+ThXWEQcn/4iaS1W8/ZUXq/N/deeWPLejpVw+cDRlcT/NTz4OZEOiF2VBlYcKuVJHrS0DiDTjymMZFYUqOsZQn8YS7xwIpsbpbrUBA0auJE2m4PxUgF9hrbedrLI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763652665; c=relaxed/simple;
	bh=NHnv4QgYmI9Q9wO1GHYlIW1T8M3Ub9LFrt7Xrh7uuno=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P2GZBAoOZfYWVkP5ra8xjChSpH0s0jd52PtH7+T8g9S6xlE2UcTDZkXipJ5d9s44CFOzaGzroobNp1OnnozUTVHsc80TWHCNqOZbVfmHQP+QInlKnhZ9FSfoORltHwNj0VMR2CZUljX6EEGnAJYYI2jLtd8tqGXbDPS7GcPpHpg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=kIDFhKWh; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Mhy646Hz; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="kIDFhKWh";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Mhy646Hz"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK609eX460858;
	Thu, 20 Nov 2025 09:30:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=zUGV8t9+ajC9hA8VXyM/cb4zMratv/1NHn9TjBjBb9c=; b=
	kIDFhKWhSw794onDPFX+0VTvlzZcH5/6gX5ShbKVU8NguD6Ndmpvp3EaP2gxVjcW
	2rtdF9T3XcFTDO+SMjEPRc48ThGp95Dg7b0s+m/1DLXL0lLac+PLchcp+IeVG3fy
	aKYrrMDNy3dKex+/baiPtUTz1+Uh+LOl8gphM7ZIHJQ32m2pX7i/0sWqjcmVynXP
	gc7wPxM8TDqtrT2NIFLpdHRld3kIXaDrD35cQuSPmO5WQ8r3p14i1PZeFBzzbpZC
	cVoL6IYzk2ildX+E8iPOKvzAfWmdGNRL1GumADPVOa7DYBACbdDd0ibFuBTSIUJL
	bkEp1G0ccKZsiqQ9441BTA==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022078.outbound.protection.outlook.com [40.107.200.78])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4aeqt1enjk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 09:30:38 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GKpd6zE/VnMCkhRnprVrdxgN8FFxEIhRtV7p1sDVufnYknXjwv7i1FXLswiTO0M9Qe9CLPjHJMFvpoZ9wkvjSpsduEnuk38DE7EP5Ge4DQsyIUokdprtLg7GHv2jnwNbGk4mtyEUcE3Aq+idG02OuoQTLQs22ZNnFlmslGrE2HCJMlHmWF4SAPHF0NITVqRHaK4XFt1nFKl96Lk2Jitid6L2/ucXWtmPps+U0oT7EJhWaDhSgJH3fTynwuBLf/OwzKQx4xa57EfG0O4fCEAjf2j/fltTLJlIJI5vpFzRyv1zKoWooXzn2PFvf/jfVFH0Mck6YJzsa7LWrLPICcmPQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zUGV8t9+ajC9hA8VXyM/cb4zMratv/1NHn9TjBjBb9c=;
 b=KG+wbFDOp+LQ7MWwGpc/WPV4ksU9L6mcskgEHtVcF8FO0+ccE9VVTNXi4HBSmQvnV9160nEaHjkSoYcuOttMldlaHYWe4eKfpLURP2royc7R1U9Rq8OJDJRaX2qBnO9LMmDnD/4G8xxfRv503LKuNSvb/NIfqg8HBLjkIAaez+MsVdboAgY5xwTjLcS/N4mjvIGOwzldPBt22HDYo1Jp/s12aM26IANByk6C1W35JqGwmaJyQCwoYPZrwFyA7LyKrxvALy9WuAwUbFG/cYvRtOX/u+mEyfkJ7XDRXqdLTWVkFX3J1DS8BjxGCZOwTvEbEnJ4EwxKxPvekAuEpA9KRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zUGV8t9+ajC9hA8VXyM/cb4zMratv/1NHn9TjBjBb9c=;
 b=Mhy646HzYdPrNpY1/70TSpyZUlI9cEGk9dNuVhsTqw9XPAFdouOaQGVjviJ6KH3pFSZ+rWQ91HplQ3GcpW2K5JYcT6erZARoE8y0/BiyvQNOocUjMMiZWcwWDzcMfOY2z5xqrmu8YoWW/qMH8kDO4y7+Vie+eC1rUBcsTlAp8Y8=
Received: from CH0P220CA0019.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::26)
 by CH2PR19MB3832.namprd19.prod.outlook.com (2603:10b6:610:9c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 15:30:32 +0000
Received: from CH2PEPF0000013F.namprd02.prod.outlook.com
 (2603:10b6:610:ef:cafe::9f) by CH0P220CA0019.outlook.office365.com
 (2603:10b6:610:ef::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.11 via Frontend Transport; Thu,
 20 Nov 2025 15:30:27 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH2PEPF0000013F.mail.protection.outlook.com (10.167.244.71) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.9
 via Frontend Transport; Thu, 20 Nov 2025 15:30:31 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D2DCA406558;
	Thu, 20 Nov 2025 15:30:27 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A92FE82025A;
	Thu, 20 Nov 2025 15:30:27 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v4 07/13] ASoC: SDCA: Use helper macros for control identification
Date: Thu, 20 Nov 2025 15:30:16 +0000
Message-ID: <20251120153023.2105663-8-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251120153023.2105663-1-ckeepax@opensource.cirrus.com>
References: <20251120153023.2105663-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013F:EE_|CH2PR19MB3832:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 83160f4e-e76e-43d5-e1f6-08de2849bdd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|61400799027|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8QIdB9bS71bNZ0tZJM7YiLAL+cVxvm9Fr+2hgV8ryUy020xZZo9zI7niPK+Z?=
 =?us-ascii?Q?ywNiTnnGV2KHTvJD7SAnkqVI49oo3ZDebf/abuMUXUPhK2hb3+CDscurKj2V?=
 =?us-ascii?Q?KfEys+SQ5ctAtKdwlUCPxRygVRLUvVfUCLnZt3u4xI/ankQyzrJPv+zHEy3R?=
 =?us-ascii?Q?Mxi+hM8euVIVUPqrgooEfVqCLmOkjMJ0VYSec16kmeCNv/3hql2OPphQ2Iiy?=
 =?us-ascii?Q?217L9i1poWSwlZ0Uf5whWNAOCVG0j4z9mS75d69vmXYNX69WUFNTtXaB02H7?=
 =?us-ascii?Q?8Jb8vQrxql712Dw5BBvTwWCCVfDhHO1ywhoAMdh61+KfLfQqlEdNZkU2kUJy?=
 =?us-ascii?Q?GCE9+J8bLStoeeQ0TqXAGl9wewMb29Pk4vi/aqsbHx8y/qzBeb4EUhMfEUez?=
 =?us-ascii?Q?kB+4f/GiL0ZcszPGjsVNgHHYdDJ4Kis8Y62vgSuWq+sY7n+1p2MDasIpyYVn?=
 =?us-ascii?Q?FmVrLSV76j4z61O7OppdjMsOX0BMSdrmviCjned3ovU5eYltQAavY9bvOnfz?=
 =?us-ascii?Q?zT7/mJbzhdDVlLFIISMfdvz0ht1tsif33zHI6LnTLURq/i8gpsfMvyJy0QH+?=
 =?us-ascii?Q?kmMxsEesL4iA7VzhLl84xE86pk73cRZJAQ4r7oCA5h5SyuFIYjk6uyQ/W8Ap?=
 =?us-ascii?Q?ogXdEf0jDyNLTOEK4mmhZX4aJfxHigJjMqd66NWaVFY2t21aN23zBiwuQU/K?=
 =?us-ascii?Q?fLFmX97XPMYW4HAU+lc/71fFPfo6VmQY2tN8W7k7jr/TWnXzjmbKDwN1iYDB?=
 =?us-ascii?Q?WfezUGNteybJLLznOAe8CLF9SFuw04bOw5F+hgUUbKxItEGQ8RcFwb+ZFwv4?=
 =?us-ascii?Q?exFwVm/ncHvfK82p3iqTP+CGjactPYZrLhNrXLR2U3NfmWfSvQnWT6S+BuYs?=
 =?us-ascii?Q?rKN4iaEylbFv5vnBzjOcJtCTMOAoXtaRXoVHwsXq463DMkC0HVmykfBtQvFq?=
 =?us-ascii?Q?wxLIfpb1gEI3Lu/UCEEooRA3LCaGBFRIMwQ0cdik0yqLL6mD+LJFl2vhAVt/?=
 =?us-ascii?Q?SbWqSSiBOxlUlu/XixFeT3fy/27XirXIfgsmqPcncSDaIbeNt7oK+nCWEhkd?=
 =?us-ascii?Q?AogW27PTY99vns/iv1osy/2UNoMVR4+8OrEprvCnPaExhT789k+Ji17ePXtr?=
 =?us-ascii?Q?usbwSmbsCpHQeMC/QhxdKzqGdxmU+oqUsFJ6n4UNSZVGfuMGqaKAwWJ1OiEG?=
 =?us-ascii?Q?v2BZSc5Op2+O/TGZfNoRhK/t3EyTmXwpbWzzAASukCaLTb51WdKWjWmOhbis?=
 =?us-ascii?Q?5LQD1MFr95d74XP7e4XqBTb/KYfcoyUtOyDX0UngTAbWZE/Y7id25aR3HKpS?=
 =?us-ascii?Q?iR9bI0mybdaZfS/WXNAXHqGXlE0F07uMrlC7TUrVVx1EXSxtf6OEL+rm8kbY?=
 =?us-ascii?Q?CT4i+pvcx5zTVZeqmPeul16Lzy2vU31rOqoyWlyPQxHscY08HUXmLIZVVjIY?=
 =?us-ascii?Q?CtT/0IOACs6qLQwB68iONPJfJzTGphhFNARJe6OdAyA8xkoKUghAdGKtAtB9?=
 =?us-ascii?Q?7G7vzOa/6joREq5VVUh2ie7kE5K3LvdMcCF5tb18Dpx6yJl3eEdxksVLSdsi?=
 =?us-ascii?Q?I8bMkuolPxgeU+tAg3k=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(61400799027)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 15:30:31.3695
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83160f4e-e76e-43d5-e1f6-08de2849bdd9
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF0000013F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR19MB3832
X-Authority-Analysis: v=2.4 cv=OOEqHCaB c=1 sm=1 tr=0 ts=691f341e cx=c_pps
 a=kwEHbe0FhOXiazSsKgGQ8w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8
 a=nQC4CdCC1Wy_cx0jZ8cA:9
X-Proofpoint-GUID: wznb82xGxDeTGsnc4SdUs-6eHCwDGh9T
X-Proofpoint-ORIG-GUID: wznb82xGxDeTGsnc4SdUs-6eHCwDGh9T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDEwMiBTYWx0ZWRfX+AXE10kn8uLq
 tmOt04U1+AgG74oXVYprr2F15VFkEEHkRZL1aXiaejyfI7sA4nbaFQpFKEeDbpHDpke8JXZMUTC
 YdiiAkyRqqOHg28TskMn5Z5K6QSx7rZVJbQH6s+2zDFl3S5cvvzs2ERv+MopHo3pytrorQaJai3
 5X46tt6WOIEzj3UM08kcCqkEHCoP16Z4ooPohaHl3dA/CEN532s087mvS2KUE6TCP3oXYQUnfMc
 xdmcgjau8lif1M4DUinbSTzToWdcOgTGGr0KfTZUhgpFDFkjTAaJy3qZDDEEfN19ljabKKL3vBI
 01xu3VVGl4XVvXKC457NORjWxh/l/NE18WdQmAazbdcvcNFg2xU1EqLeK94OlNuHndO3A/2lYU/
 qO7XzyWBooKGfP5gHvRPg4U8E6/hkg==
X-Proofpoint-Spam-Reason: safe

We have the SDCA_CTL_TYPE helper macros, we should use them when
identifying specific controls to simplify the code a little.

Tested-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
Reviewed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Tested-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v3.

 sound/soc/sdca/sdca_interrupts.c | 36 +++++++++++++-------------------
 1 file changed, 14 insertions(+), 22 deletions(-)

diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index a18ec9dd3398b..8f6a2adfb6fbe 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -456,11 +456,8 @@ int sdca_irq_populate_early(struct device *dev, struct regmap *regmap,
 			else if (!interrupt)
 				continue;
 
-			switch (entity->type) {
-			case SDCA_ENTITY_TYPE_XU:
-				if (control->sel != SDCA_CTL_XU_FDL_CURRENTOWNER)
-					break;
-
+			switch (SDCA_CTL_TYPE(entity->type, control->sel)) {
+			case SDCA_CTL_TYPE_S(XU, FDL_CURRENTOWNER):
 				ret = sdca_irq_data_populate(dev, regmap, NULL,
 							     function, entity,
 							     control, interrupt);
@@ -534,27 +531,22 @@ int sdca_irq_populate(struct sdca_function_data *function,
 
 			handler = base_handler;
 
-			switch (entity->type) {
-			case SDCA_ENTITY_TYPE_ENTITY_0:
-				if (control->sel == SDCA_CTL_ENTITY_0_FUNCTION_STATUS)
-					handler = function_status_handler;
+			switch (SDCA_CTL_TYPE(entity->type, control->sel)) {
+			case SDCA_CTL_TYPE_S(ENTITY_0, FUNCTION_STATUS):
+				handler = function_status_handler;
 				break;
-			case SDCA_ENTITY_TYPE_GE:
-				if (control->sel == SDCA_CTL_GE_DETECTED_MODE)
-					handler = detected_mode_handler;
+			case SDCA_CTL_TYPE_S(GE, DETECTED_MODE):
+				handler = detected_mode_handler;
 				break;
-			case SDCA_ENTITY_TYPE_XU:
-				if (control->sel == SDCA_CTL_XU_FDL_CURRENTOWNER) {
-					ret = sdca_fdl_alloc_state(interrupt);
-					if (ret)
-						return ret;
+			case SDCA_CTL_TYPE_S(XU, FDL_CURRENTOWNER):
+				ret = sdca_fdl_alloc_state(interrupt);
+				if (ret)
+					return ret;
 
-					handler = fdl_owner_handler;
-				}
+				handler = fdl_owner_handler;
 				break;
-			case SDCA_ENTITY_TYPE_HIDE:
-				if (control->sel == SDCA_CTL_HIDE_HIDTX_CURRENTOWNER)
-					handler = hid_handler;
+			case SDCA_CTL_TYPE_S(HIDE, HIDTX_CURRENTOWNER):
+				handler = hid_handler;
 				break;
 			default:
 				break;
-- 
2.47.3

