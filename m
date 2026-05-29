Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB9633D509;
	Fri, 29 May 2026 14:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780063439; cv=fail; b=durd0YDSJa4KCsEH5VpEGbglZUQNCduS1Y18uwv/1ifjyrt1BIy2yPDa/WwAx+xCM3EwxqO82ww3nS2l7wVkW6YAh0KXOc9Ra4Fcmfw0I3AKwjtqpHJUxiYkQ0jhzf8i7wKRbDD9Z9K9NICWDyOiYTR2WSJZ+NMKO3e43ynV1WI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780063439; c=relaxed/simple;
	bh=KC221MkIRgVKGiwE4CqA0qwI27PxuYWOtLnLo6lxEqw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MTyR8UeR7/BeFfMK5pWUnYrv9B/HkKD1qspD6BhW8qVkGttWBsDE6PqHCwsFUOSXyxElsAx1vMSeT8TKaN4dP/8lqiTj0SK3IXFPTrOsxHQ2XsJsPWedTDTzTh7UbiRIRS7j7gHerDkZIfhv4Xu2l32Je7FHrDzI1r9s0pjUweU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=e5dg9pGS; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=SxK7eyla; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="e5dg9pGS";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="SxK7eyla"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TCIKsd1584094;
	Fri, 29 May 2026 09:03:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=KHaasCBHvheEhlnV
	fMxMeo3M/GAzBa0z/WZIDlkoqso=; b=e5dg9pGSsHd2t3nDMswEw5u7U4iWl3I5
	oOMKIZNO9xYpptpAwq9lO1jAZZGJn4uD2Cr0JMlbiCtai65ydlwRb725fxipGkcj
	nwQpYRpA2VnLRW3s5MtH4Agm1B19CY/8V/PYvYttjIYfQfpeGCrsD6b/xHZstxgH
	GVL6R3e9QP0qrTSk3Qw0P53pMM7DIKHVbhF4IWZZT0hHwiknOwIUm9lpEP3/+hMK
	9bWtenaG+k90XTRo3QiqDuDSBbxIEFC7P8PcDhOkUk+C5ZMBDA0WhWY+LZRxLEFi
	JP4VdRPcJ0pSHK01PrgkUm0FTk4JZzFI10Z6p/6zFcy/rMddLhQNfg==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022113.outbound.protection.outlook.com [52.101.48.113])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4ee7x22h3r-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 29 May 2026 09:03:55 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QmCFTlZF6rnY8920Imxvi7SL99cO/RUrUWhPmwcNqhXU+iYDMTd+mFWeJ07tcmhiY6VgzY7N16jtse/WzfGatnEgc4VS/+xmhJbqIAS3i9B/oGEWOJUejsNUz+yzW9wiObHdBAmipdsZty+QJa/lJUeqDNnwHwisoGT1ane6YqNxk8Mgnqtb+Iqo8/Ix4WfH5u0oiXmtxVWvXq6FzTXEISYjcCQh/PaDpTpql4gkxc0s/Yfq27H3dBzavqz8Lg8DaxHr8R87BUULz5ZEGy9W/xsnpKSnnou6ryYXgmgY77Upn0+Og+MMzsf7DESUPHUWKGD5nkXiHMImD2nnOZLMcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KHaasCBHvheEhlnVfMxMeo3M/GAzBa0z/WZIDlkoqso=;
 b=g9CF5iqHTJ5LflIYHnW3jN3MTeNnsF4y5Vzdx6Ru2bEwjrJtzQk0+EyPWPYxnpNMLRDHSqjLfL24gLh8t6ThNTvXGtyct3oCPfmWvfoHL3ATmQB/3IkhIVHj6bVVDWADR2FSVgVBMDWdIV0IfKdxtKwHBxF5dg/OuuKErg4anOJ4kezQEqaD6xkCYhw3bMYK91h+gLn9xZJBd31FG2Hs9JbmwlbXOoZcsy2vA7Rq71FfBHzgDydM4sEReeKBsXSr1woEmwi1y/50qx4ct5TRFfRlbDEKdgoKMAArTEUKz72FOnsvthCeW0wSoHAsib1fszPxwrIlVWea91Z/88x/7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KHaasCBHvheEhlnVfMxMeo3M/GAzBa0z/WZIDlkoqso=;
 b=SxK7eylaLWUEjWKkcsER84nQUKYTX2xuQP0lt7Nhzh5qTLoePWRei7/C/q/liW5RhlbUqP1i2U6gfgInXtmxcHKovfD8fR0952fdnpySpVDpJXwEcJT0dqv48vUh1jh1926S4HaVLVeTg6x8uZB/vbEC/CBhkcnkZZTI7Zy7DNA=
Received: from MN0PR04CA0009.namprd04.prod.outlook.com (2603:10b6:208:52d::30)
 by PH8PR19MB7758.namprd19.prod.outlook.com (2603:10b6:510:25a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 14:03:52 +0000
Received: from BL6PEPF0001AB56.namprd02.prod.outlook.com
 (2603:10b6:208:52d:cafe::64) by MN0PR04CA0009.outlook.office365.com
 (2603:10b6:208:52d::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Fri, 29
 May 2026 14:03:52 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF0001AB56.mail.protection.outlook.com (10.167.241.8) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Fri, 29 May 2026 14:03:51 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D3C4F406540;
	Fri, 29 May 2026 14:03:50 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.13])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A1947820244;
	Fri, 29 May 2026 14:03:50 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2] ASoC: cs35l56: Share common SoundWire interrupt enable/disable code
Date: Fri, 29 May 2026 15:03:50 +0100
Message-ID: <20260529140350.408557-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB56:EE_|PH8PR19MB7758:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d3513de9-b99e-4866-f13d-08debd8b1d12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|36860700016|376014|6133799003|16102099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	Kb0CiST/wTK9th+xiduHVUb/O+W+5G9dMBfO2WAo1aqYpFxlcRhxraXc4zW/Tm+K74fSxJNw16vMo3/rRc/ufrfIsDBQEZfx2Fp8XRuxpUi+LEyzI/J2uN586Sswk8rXIIN9Fuuxe9UGFkbnVImkLDzhP18UaT8vGQzkWSiqEKM7U5t9i/kE65aWXE4p/T2X2pwAXWqWfXQ6EPXcSdAbDv4cniia8+hWDwNN1w9qJoYOJKBlQoLwCqln78GVowMhfgJNqC/25pSl7MD7W6/vozNyTZuIFQeQ3xzKNJIMJYrhV0Q3J/IoGyYkqYmIfg1UgeIoOjW+0RCaTd+DJTVQZaq0LROmUE/IwIGB1wDznWPFrTQOp/T+vN8jhfuqOzi2HLGQSz6WkbgLVPynKQvW66NeyiBWyhSOrNx2qQ/sMTyeeI3+QoCxbjkGTX9Efa+yYHSgzxVJXqyFZZCgXS0ha0MBHc7BIfskWC2YCrm96ZRpn7jZKx/csBhhd/pKNLnRfBfnQiXMwIXlxtnodgup3Mxly0JZ2VXNiolYYbrJKy4H/uNJwEXI1n0R3nH1tj23r+VqIkxlZeFNND8sjcwxDkRfjUDaDIWuqdDmjS/+dbMS2qhdPtNOqPWiwXjdnKIPuiH6aF6fxTzSCDml4HYrDDxWFaV2G9QleCGNW1dt7hpnqVuaV9mxScYcjSMAbwTI4mSDeYD6ty7ClFmyOf8VBBYXFwv+3JsTkLPiO7MXwhE=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(36860700016)(376014)(6133799003)(16102099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	skG6wr2EaPlYO+YwrU9t5O+LBUq2pTvxc/sa18G5zdZaRiitZWD65m83sfvP2pTzW6FMr0COCuHx9njamtm/nXJuafhfuzzkxpY3OlzT2/Cif/OF84Bb00D/CVIL4GMsYq17Mr81Q6srksaGjjYZKmjavn1Z/XF8/Twh5GswMIMyJxOSa0sRsJbfRLbXMH8qKpXVNvnhLUzNrDIPDO/a6YsjkIgP0JdtOAEU5usR1kj/gl+HoknJprj87Zatk0BjqaGyaJgnbAcDt6WyF2OQL4PlN7QDnHtQKORG42CsVFgzjLvyLAbJJV/k2YhDHdtrWD7UK9rk7Bjum2za/wAz3qzuk7ry1x//OqFb24Tck7Fp61bYi8lxnsOJkG6dkOSJt6POlAQvb3B444T07BO3/DMpiB2CKP+HbfkcYzLh3vytDfTBEeKFDZJ7epBebfRs
X-Exchange-RoutingPolicyChecked:
	IKJWkeKT2KaremrfFuJX+xdfc+bN6qp5NhRnzOsXwZg3uOQ7R+/md3whys7NWIYDQWY/Bs32Jgi57i3ksf+nBzMsr7OG5xtmsez05GCSOZ3BR9JOCDFuGF2cu1AdtN4lRvixwOwW/U+Y4k/qolXxxfdnxfTpyIehnNa86SwBdpMHBZhoE89IdSa0Q4v3w1/0uViDbvOqvcCwpGzBNGq56+NZS3xffd7wsBciekMNOftZ0MQ7P1ueIiOg03fGXMlMf0WbKl0+mXbcGGZl68CEennhvRjBSEeYWY47RCxyvzchdorM6yYP5eCa4DdAOmKNcYzwwgfr0Iknwp1RM656xQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 14:03:51.7019
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3513de9-b99e-4866-f13d-08debd8b1d12
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF0001AB56.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR19MB7758
X-Proofpoint-ORIG-GUID: uwkSYroPzd4T_xnueOLE5NQwPxIdp69C
X-Authority-Analysis: v=2.4 cv=H/frBeYi c=1 sm=1 tr=0 ts=6a199ccb cx=c_pps
 a=Q5kcJUpSFGSGPQA8zxlsBw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=K1VpkZIB_MQl3lKWWWkA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE0MSBTYWx0ZWRfX+g96i8fc8lP8
 0HgzHdjLrTITS4sZqKF4pBt7HQAVCB8Vby4OpOY/rp+mMyenFtnCIk49+izN0+YasgRz2N/EXhp
 jZjYjajcK4eE9diASi0EUHPR3VDHYBGUsppj5NAyPgI2hUOe7SpqrFvfakqcj3Xdy8FiPP6rPP+
 C9DVZcNQAUSH1LIFgXWbJ4Xas5BONhruWcYq/CnwGlyfNBFYBBVfiDwxYeNbJxBC1T1yr0Js4hG
 ydfiC8TvlSLA5GLO3/rE9kQE+vRKZcWjNwBW3TQRKhMtJgP/FDWaxKC4EUJpOfr0PGNWFD1JlhS
 fifJv8pzQ+++q04G58cDI++NmKptFT+jT/0WRqXpUD0D167835ntuhGhYDe9phUbPn5mDX8FR/9
 zc2yePkPlvhA7QIi1w6guJBYMop6P//yQ/k807Uuyn1G2FE42Nk1Gyt3edubu4+EekiuRVtl3fe
 GVEuFqgw+YMbSuvilqw==
X-Proofpoint-GUID: uwkSYroPzd4T_xnueOLE5NQwPxIdp69C
X-Proofpoint-Spam-Reason: safe

Move the duplicated SoundWire interrupt enable/disable code into shared
functions. These new functions are in cs35l56.c to prevent circular
dependency between cs35l56.c and cs35l56-sdw.c

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
Changes in V2:
- Put the new code in cs35l56.c instead of cs35l56-shared.c, so it's all
  in modules that already have a dependency on the SoundWire core.

 sound/soc/codecs/cs35l56-sdw.c | 43 +++++--------------------
 sound/soc/codecs/cs35l56.c     | 59 ++++++++++++++++++++++++++--------
 sound/soc/codecs/cs35l56.h     |  5 +++
 3 files changed, 58 insertions(+), 49 deletions(-)

diff --git a/sound/soc/codecs/cs35l56-sdw.c b/sound/soc/codecs/cs35l56-sdw.c
index c21568f57c631..847e88f3b2044 100644
--- a/sound/soc/codecs/cs35l56-sdw.c
+++ b/sound/soc/codecs/cs35l56-sdw.c
@@ -230,11 +230,8 @@ static void cs35l56_sdw_init(struct sdw_slave *peripheral)
 	 * cs35l56_init can return with !init_done if it triggered
 	 * a soft reset.
 	 */
-	if (cs35l56->base.init_done) {
-		/* Enable SoundWire interrupts */
-		sdw_write_no_pm(peripheral, CS35L56_SDW_GEN_INT_MASK_1,
-				CS35L56_SDW_INT_MASK_CODEC_IRQ);
-	}
+	if (cs35l56->base.init_done)
+		cs35l56_unmask_soundwire_interrupts(cs35l56->sdw_peripheral);
 
 out:
 	pm_runtime_put_autosuspend(cs35l56->base.dev);
@@ -259,15 +256,11 @@ static int cs35l56_sdw_interrupt(struct sdw_slave *peripheral,
 	pm_runtime_get_noresume(cs35l56->base.dev);
 
 	/*
-	 * Mask and clear until it has been handled. The read of GEN_INT_STAT_1
-	 * is required as per the SoundWire spec for interrupt status bits
-	 * to clear. GEN_INT_MASK_1 masks the _inputs_ to GEN_INT_STAT1.
+	 * Mask and clear until it has been handled.
 	 * None of the interrupts are time-critical so use the
 	 * power-efficient queue.
 	 */
-	sdw_write_no_pm(peripheral, CS35L56_SDW_GEN_INT_MASK_1, 0);
-	sdw_read_no_pm(peripheral, CS35L56_SDW_GEN_INT_STAT_1);
-	sdw_write_no_pm(peripheral, CS35L56_SDW_GEN_INT_STAT_1, 0xFF);
+	cs35l56_mask_soundwire_interrupts(peripheral);
 	queue_work(system_power_efficient_wq, &cs35l56->sdw_irq_work);
 
 	return 0;
@@ -283,8 +276,7 @@ static void cs35l56_sdw_irq_work(struct work_struct *work)
 
 	/* unmask interrupts */
 	if (!cs35l56->sdw_irq_no_unmask)
-		sdw_write_no_pm(cs35l56->sdw_peripheral, CS35L56_SDW_GEN_INT_MASK_1,
-				CS35L56_SDW_INT_MASK_CODEC_IRQ);
+		cs35l56_unmask_soundwire_interrupts(cs35l56->sdw_peripheral);
 
 	pm_runtime_put_autosuspend(cs35l56->base.dev);
 }
@@ -441,9 +433,7 @@ static int __maybe_unused cs35l56_sdw_runtime_resume(struct device *dev)
 	if (ret)
 		return ret;
 
-	/* Re-enable SoundWire interrupts */
-	sdw_write_no_pm(cs35l56->sdw_peripheral, CS35L56_SDW_GEN_INT_MASK_1,
-			CS35L56_SDW_INT_MASK_CODEC_IRQ);
+	cs35l56_unmask_soundwire_interrupts(cs35l56->sdw_peripheral);
 
 	return 0;
 }
@@ -455,18 +445,7 @@ static int __maybe_unused cs35l56_sdw_system_suspend(struct device *dev)
 	if (!cs35l56->base.init_done)
 		return 0;
 
-	/*
-	 * Disable SoundWire interrupts.
-	 * Flush - don't cancel because that could leave an unbalanced pm_runtime_get.
-	 */
-	cs35l56->sdw_irq_no_unmask = true;
-	flush_work(&cs35l56->sdw_irq_work);
-
-	/* Mask interrupts and flush in case sdw_irq_work was queued again */
-	sdw_write_no_pm(cs35l56->sdw_peripheral, CS35L56_SDW_GEN_INT_MASK_1, 0);
-	sdw_read_no_pm(cs35l56->sdw_peripheral, CS35L56_SDW_GEN_INT_STAT_1);
-	sdw_write_no_pm(cs35l56->sdw_peripheral, CS35L56_SDW_GEN_INT_STAT_1, 0xFF);
-	flush_work(&cs35l56->sdw_irq_work);
+	cs35l56_disable_sdw_interrupts(cs35l56);
 
 	return cs35l56_system_suspend(dev);
 }
@@ -542,13 +521,7 @@ static void cs35l56_sdw_remove(struct sdw_slave *peripheral)
 {
 	struct cs35l56_private *cs35l56 = dev_get_drvdata(&peripheral->dev);
 
-	/* Disable SoundWire interrupts */
-	cs35l56->sdw_irq_no_unmask = true;
-	flush_work(&cs35l56->sdw_irq_work);
-	sdw_write_no_pm(peripheral, CS35L56_SDW_GEN_INT_MASK_1, 0);
-	sdw_read_no_pm(peripheral, CS35L56_SDW_GEN_INT_STAT_1);
-	sdw_write_no_pm(peripheral, CS35L56_SDW_GEN_INT_STAT_1, 0xFF);
-	flush_work(&cs35l56->sdw_irq_work);
+	cs35l56_disable_sdw_interrupts(cs35l56);
 
 	cs35l56_remove(cs35l56);
 }
diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 80158913a60e0..b4b126753c101 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -37,6 +37,49 @@
 #include "wm_adsp.h"
 #include "cs35l56.h"
 
+void cs35l56_mask_soundwire_interrupts(struct sdw_slave *peripheral)
+{
+	 /*
+	  * The read of GEN_INT_STAT_1 is required as per the SoundWire spec
+	  * for interrupt status bits to clear.
+	  * GEN_INT_MASK_1 masks the _inputs_ to GEN_INT_STAT1.
+	  */
+	sdw_write_no_pm(peripheral, CS35L56_SDW_GEN_INT_MASK_1, 0);
+	sdw_read_no_pm(peripheral, CS35L56_SDW_GEN_INT_STAT_1);
+	sdw_write_no_pm(peripheral, CS35L56_SDW_GEN_INT_STAT_1, 0xFF);
+}
+EXPORT_SYMBOL_NS_GPL(cs35l56_mask_soundwire_interrupts, "SND_SOC_CS35L56_CORE");
+
+void cs35l56_unmask_soundwire_interrupts(struct sdw_slave *peripheral)
+{
+	sdw_write_no_pm(peripheral, CS35L56_SDW_GEN_INT_MASK_1, CS35L56_SDW_INT_MASK_CODEC_IRQ);
+}
+EXPORT_SYMBOL_NS_GPL(cs35l56_unmask_soundwire_interrupts, "SND_SOC_CS35L56_CORE");
+
+void cs35l56_disable_sdw_interrupts(struct cs35l56_private *cs35l56)
+{
+	if (!cs35l56->sdw_peripheral)
+		return;
+
+	cs35l56->sdw_irq_no_unmask = true;
+	flush_work(&cs35l56->sdw_irq_work);
+
+	/* Mask interrupts and flush in case sdw_irq_work was queued again */
+	cs35l56_mask_soundwire_interrupts(cs35l56->sdw_peripheral);
+	flush_work(&cs35l56->sdw_irq_work);
+}
+EXPORT_SYMBOL_NS_GPL(cs35l56_disable_sdw_interrupts, "SND_SOC_CS35L56_CORE");
+
+void cs35l56_enable_sdw_interrupts(struct cs35l56_private *cs35l56)
+{
+	if (!cs35l56->sdw_peripheral)
+		return;
+
+	cs35l56->sdw_irq_no_unmask = false;
+	cs35l56_unmask_soundwire_interrupts(cs35l56->sdw_peripheral);
+}
+EXPORT_SYMBOL_NS_GPL(cs35l56_enable_sdw_interrupts, "SND_SOC_CS35L56_CORE");
+
 static int cs35l56_dsp_event(struct snd_soc_dapm_widget *w,
 			     struct snd_kcontrol *kcontrol, int event);
 
@@ -790,14 +833,7 @@ static void cs35l56_patch(struct cs35l56_private *cs35l56, bool firmware_missing
 	 * Setting sdw_irq_no_unmask prevents the handler re-enabling
 	 * the SoundWire interrupt.
 	 */
-	if (cs35l56->sdw_peripheral) {
-		cs35l56->sdw_irq_no_unmask = true;
-		flush_work(&cs35l56->sdw_irq_work);
-		sdw_write_no_pm(cs35l56->sdw_peripheral, CS35L56_SDW_GEN_INT_MASK_1, 0);
-		sdw_read_no_pm(cs35l56->sdw_peripheral, CS35L56_SDW_GEN_INT_STAT_1);
-		sdw_write_no_pm(cs35l56->sdw_peripheral, CS35L56_SDW_GEN_INT_STAT_1, 0xFF);
-		flush_work(&cs35l56->sdw_irq_work);
-	}
+	cs35l56_disable_sdw_interrupts(cs35l56);
 
 	ret = cs35l56_firmware_shutdown(&cs35l56->base);
 	if (ret)
@@ -849,12 +885,7 @@ static void cs35l56_patch(struct cs35l56_private *cs35l56, bool firmware_missing
 err_unlock:
 	mutex_unlock(&cs35l56->base.irq_lock);
 err:
-	/* Re-enable SoundWire interrupts */
-	if (cs35l56->sdw_peripheral) {
-		cs35l56->sdw_irq_no_unmask = false;
-		sdw_write_no_pm(cs35l56->sdw_peripheral, CS35L56_SDW_GEN_INT_MASK_1,
-				CS35L56_SDW_INT_MASK_CODEC_IRQ);
-	}
+	cs35l56_enable_sdw_interrupts(cs35l56);
 }
 
 static void cs35l56_dsp_work(struct work_struct *work)
diff --git a/sound/soc/codecs/cs35l56.h b/sound/soc/codecs/cs35l56.h
index d029fa3f86565..6a27ef2b7569a 100644
--- a/sound/soc/codecs/cs35l56.h
+++ b/sound/soc/codecs/cs35l56.h
@@ -66,6 +66,11 @@ static inline struct cs35l56_private *cs35l56_private_from_base(struct cs35l56_b
 
 extern const struct dev_pm_ops cs35l56_pm_ops_i2c_spi;
 
+void cs35l56_mask_soundwire_interrupts(struct sdw_slave *peripheral);
+void cs35l56_unmask_soundwire_interrupts(struct sdw_slave *peripheral);
+void cs35l56_disable_sdw_interrupts(struct cs35l56_private *cs35l56);
+void cs35l56_enable_sdw_interrupts(struct cs35l56_private *cs35l56);
+
 int cs35l56_system_suspend(struct device *dev);
 int cs35l56_system_suspend_late(struct device *dev);
 int cs35l56_system_suspend_no_irq(struct device *dev);
-- 
2.47.3

