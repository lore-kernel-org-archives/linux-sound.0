Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209A33F9A01;
	Tue, 21 Jul 2026 14:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784644642; cv=fail; b=WWRwFAMEQbVYjGIK2RbVXB7QNMNEHZWHIwRJQKhTAza6Nh3D08c7ys+EWBG/E+qJEz77qhg5Gxm1n3bZvBty4x2LKqz+d1zkFsDgzIS1TXPpG1ETBMhSmIIudiwYOBfpyfthyzQOkYkbC4MsVCuO+GoP6lnonqIv33Na2+YKTck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784644642; c=relaxed/simple;
	bh=IUUJylDvxRH1bWBPhdxnIb/nAExjJo7CAPi+Q+ra0/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HrRD5SGT2VN1Meatol6uVIjxNCvGDRXnGPwNDESx+qH7BvTKZqhx4vrnVh+7MiQhHZW+Av6rkpvAE/ELnYG0leNgxFG8qWveLDgHmXuzv3kot/xNrWQ/ZkgMUpBvsJraVZfVlmB8g4xq2rY9P3cRyegvUqa51gp4Alyd/9NY3RY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=IJBaMA2u; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=N2wlZmRk; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="IJBaMA2u";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="N2wlZmRk"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LEbBgS669055;
	Tue, 21 Jul 2026 09:37:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=/mxQ5WByEBRPe1hBTIPImAUQsvwI+YCspiT5bp3BSC0=; b=
	IJBaMA2uKy3tFOYA6fVtA5jxAG6+Uwu1EFo3oDASksJ+nlj15o+r3lEeVedxZXLj
	DUxuuUd4ewZwbVZmOXMFOzxtIB81q7YyVEtczg796shkVII5BBcvIH4hVKdhTH0A
	tCXSSUGR/h5XR106sSigdXZE3EOq5c7cIzxiYKw7+1v1gFZYRpzLwK0xBnUpbPVm
	khhVYY5YJQMfDFhjGOWKAHm6/7ZXcLK2Ny2Ns8xMVl35ovEtGQRt2gcPba1xta0L
	jUEUZ1dE+pJBrRBlpNFTO/dBB19ICUE8V/koav5ZrznUCDPdtLpi3/AxiW+/UZMe
	++L0csJt7Q/DoBRGcdntdQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023137.outbound.protection.outlook.com [40.93.201.137])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4fg5wfc7ch-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 21 Jul 2026 09:37:06 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J6gzhS9iaoZowG7kFKZoqL6xpUUYLNKFBGFGBcucUnrFUwCboXy45lQkQZOZ8a5GQ2+YMuDIucPeRtUmYqH6ZpWM6sf5FvYA5mpAIsHbA8gdYx6xCQrcZmtSeLyP7yFrLG9DjiGb1p5uXtQTWWT6E2nYPGQpZKmu3dBtonnHedriPM3aGQBC6mwbYuAXBlozd3EWrRmmIGB8y/GHiZHHGRNHCkmNHeKSo3EG9UI982BX7ELWPOU47lLYx/ClEK4Lg0h9iJH8pLDh3MUJJgscURhDFgV1ojwmRv/vWcUEqSzUDz9cui7lBK97QlG67N4ySGKiEGOMgku8BJfOobGwsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/mxQ5WByEBRPe1hBTIPImAUQsvwI+YCspiT5bp3BSC0=;
 b=Jh+lcCPCPqQWf2R/8ghU143Ke7qenexdzT0x5NM30TcRKN/EdS0H1vnpMpzuVJ/5Mo2yT6BNWoEY3Yp2XFKDgPTqgwFjeY1mnNNizG1kdIIAAXHY+UVOd0pQoD25SDXHP9SZNE3dJwmxdfRgujiij+ZiZQfInFX5atlD883Z9ub21FeuEcq1o4vnchfPASK10IPnlpj8MG5S0OMf+hlaL9Hfu4mlltRjtEnIDeJprGKbgPa4Zhkqy6mnyttxFmNE40veS3pqQaV3npE5Jl2MmuaQX8dmW15YPgh7voUI47n2qtok9brXpEUecdKYljtyt75za1OIr880QQXDzQA1WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/mxQ5WByEBRPe1hBTIPImAUQsvwI+YCspiT5bp3BSC0=;
 b=N2wlZmRkE9ohOXdIGwYpKk+DqemBeBN2Iin+cbgVoEhXZo/UCkhfUdNsD3KazsNOCywLPut+6cFTTaUJVHOoTe8TAWBoRGcHJCYnFeaP0V+HgbX71TIRy1wcXghRJpSUVjubP5FTbeAKdFY4HbSag6nRDmvsX1FwrX01lP+ERPA=
Received: from SJ0PR03CA0362.namprd03.prod.outlook.com (2603:10b6:a03:3a1::7)
 by MN0PR19MB6384.namprd19.prod.outlook.com (2603:10b6:208:3c0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 14:36:42 +0000
Received: from BY1PEPF0001AE1C.namprd04.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::5f) by SJ0PR03CA0362.outlook.office365.com
 (2603:10b6:a03:3a1::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Tue,
 21 Jul 2026 14:36:42 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BY1PEPF0001AE1C.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.5
 via Frontend Transport; Tue, 21 Jul 2026 14:36:41 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id DC86F406543;
	Tue, 21 Jul 2026 14:36:39 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B32B282254D;
	Tue, 21 Jul 2026 14:36:39 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, shumingf@realtek.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v4 2/7] ASoC: SDCA: Add sdca_irq_cleanup_late()
Date: Tue, 21 Jul 2026 15:36:31 +0100
Message-ID: <20260721143636.361814-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260721143636.361814-1-ckeepax@opensource.cirrus.com>
References: <20260721143636.361814-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1C:EE_|MN0PR19MB6384:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 62e835e8-c721-429f-ef1c-08dee7357b01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|61400799027|23010399003|376014|18002099003|22082099003|16102099003|10067099003|11063799006|5023799004|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	ORQIJGIZXCyHDZxcIfK5lXgaiJCMeSa79gBmhEMgkPVwb4+yyi5SjGfn04B7WAgqdlv4J/6TPj/cUzRibn6X/Xet2kT/83c5rOCGH0CtF3OpSEwrsyM0jFC5QpmvaPR+BnPftmtnZnJxKQ6AhrRLCWpz+jihx0NqhZUjZEKuWPejsnxWWWKgG4hpu4WsZt3JQ0bbWS3vLDn2wOdI7kgb6QWmQH89tdwLEafyjQ0zDMz7imQaEWuCLMHM6iXcrgeyt0PKjGt1DAN3H/NVHir5lWMU4A60CZ9i175636BE1Qqc6ZEg25wuOa9r9XHU+CHOlbP4qw0welUQcY18+cXW3DFBfz+4+ZK9E+pcMacCHGyYhp7jPB02hRb/gXtbwWWkDQdGijvbN/FpQc+9TH/FleHr6gSJxUZMAphQ5yYRJOSCPYQsXH4yaiEXMdveOjyIaRpejEdhjulVGg6/cM8FR/sxKXcOzd32oFDBw0e/fzWYskLlI0nMIML5meeLKvoGlrCLiLzGvqj1O/jwLJYyyTSmJwVlAAWZE1UFKD3mlLRsecYbkBtK+ZWdrU4wwshYHsg8pGa4HRl25xVm+WWjHX1KySIiVKndQBucYZ3UU819V8dqiqr3u1NAeMeJu8kjvm7mq4XzvyCLPexY6ySJUn7SJhTPU5Z7fN9hb+9i2L9+O2C0ye64G66+/9gB4kQ9qDB7shSru3p2aUShRNgdvg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(61400799027)(23010399003)(376014)(18002099003)(22082099003)(16102099003)(10067099003)(11063799006)(5023799004)(56012099006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	P1RHHpPaItwsFdjihSorqKzHpge095uO1wbeaj0Nh7ESu0LOHj989Q8WjbrRDFjvL9OMsqJMsqiBH1MkS1YMSzI0hB+VXeIJC+Xu5Dw3d7ffN0mzhVjMuvlEnBrcvBCAwgeF8FnN6aGDc0cdYuPEVNSj3cKIEgQeiow089GEooucg6i39GHGoOAJTEFmaTxA+kkdQ6fVTr6v7QKLFFXUZTAbbWr/j+cqGlCtlnmUGFTc8si7TsB+aJ70FYiIUaL0uj49ADgNjj6tfVd8u60/c4WSNtzjfT358gEuFLd/NS1b7cpwyBKcLmUFd1bPZ3oglO8hNAmWPm3CikPeKxNZUxk6j43ZdRcpD3VhsrUmZU6tZmPj9QisOlvfPF3d9QJrfNmqX+ZdoHJaa8g1lsNgT2O+g2wdFFLQ+N21mbcAolaO3rpfYSIMkqHPkBsyMdmY
X-Exchange-RoutingPolicyChecked:
	mDLG2gz1iiBmQ+e+whtpNNZk0+5z1GCE30mka+qSHCztPMFSwKZDvdoalm5zmnTAhKtu78iWIRsv5SJaq3LTm1eWUkRP1cYSdmBLqLqxnGjAnuGG+9Sl8DRPEDamc8XvMtQbkp+PduMA8n9fa7hxMZoymHt+NWflHLvGSHi1TFGoY96DKr7+r+8r/cLadO82vqFzXMhjtmrZAvYR6SyNr3dsRizvgIELBpAEJw/RLHrkzBSpI6wgPPpjArND5d0IflWaBtKrpMNAXhiKCj62LglDIGCk8RHThvyu6Zwma8K8K71uNGf8kiuOGMpgMzJpTJiF9GK8uHawL+B+qGMk4Q==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 14:36:41.2977
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62e835e8-c721-429f-ef1c-08dee7357b01
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BY1PEPF0001AE1C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR19MB6384
X-Proofpoint-ORIG-GUID: IdNCBA6qr5LK3MUplr3J-wYtUL32IrS4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE1NCBTYWx0ZWRfXw00GG0P1Yfeo
 b1zYFInnIa2LvS8zs4XW0hFZw38DMJ4XHb2oijj3gvZm+I0OBSJ7mTeey7ZleUayu/5Aw476jLY
 q5jIuII63bPu2pEN+MmJW3+xpvMfz64=
X-Proofpoint-GUID: IdNCBA6qr5LK3MUplr3J-wYtUL32IrS4
X-Authority-Analysis: v=2.4 cv=BdjoFLt2 c=1 sm=1 tr=0 ts=6a5f8417 cx=c_pps
 a=lhMG70nIYFfcSaqvxYvWRA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=2A11PYpd9AFOWc80pHMA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE1NCBTYWx0ZWRfX0JwHUelcK/b9
 JMcltDdt0yqF2t3AhR0V97XR72xiSWGm5Zrc1pfIGY2ymIlWQWeZFwCjgwnCdTkKwcOSjIi1ZUs
 ++rxoTNbkFdqi+Ylf++JgorGXh6Bw5a9oD3nmWKAwAB2Ay1t0agjnCiLeu4RSjezmpTZ/ESDIgq
 KiCJWzRtPo9V8W6Md2FqUB0/U7i7u31WycYY8szcd++DhG2bwvIby0s9+JY+WGaFpJSSQN17oyV
 MpQhACYmXtOvy7JBqY9fnlrySNI0pb6WOxN2Jz+rXBHCdsljRmWNI7Oo+NZtcROTk4ptJTfeouw
 +YdSjzezJMcmBNaSeRfj3yWHr4EYcuraVzUTeJrRarDZztwc8tYYQXJHozj8Ka0CZPUsfxrJuO3
 kWZrNm1IpSy9F9FMEFecmmE2hws1fmUl2JrIPDdQqiAizkeicnVwLxrtJPKePvB/wwax4Cm4PIA
 Ps9/XzxHBprKheBOJpA==
X-Proofpoint-Spam-Reason: safe

The SDCA IRQs are split into two groups, those registered at bus probe
time (basically just FDL) and those registered at component time.
There currently exists only a single cleanup function, if the FDL IRQ
is freed at component time, then nothing would re-register it if the
component is probed again. But the IRQs depending on a component need
to be freed if the card is destroyed so they can't use stale
components.

Split the clean up into two functions one for the component level and
one for the bus level.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v3:
 - Switched to using an early request flag rather than a big switch.
 - Renamed the cleanup flag to be a little clear.

 include/sound/sdca_interrupts.h      |  5 +++
 sound/soc/sdca/sdca_class_function.c |  2 +-
 sound/soc/sdca/sdca_interrupts.c     | 53 ++++++++++++++++++++++------
 3 files changed, 48 insertions(+), 12 deletions(-)

diff --git a/include/sound/sdca_interrupts.h b/include/sound/sdca_interrupts.h
index 28fd44eb93343..38c6c58c2cc78 100644
--- a/include/sound/sdca_interrupts.h
+++ b/include/sound/sdca_interrupts.h
@@ -33,6 +33,7 @@ struct sdca_function_data;
  * @priv: Pointer to private data for use by the handler.
  * @irq: IRQ number allocated to this interrupt, also used internally to track
  * the IRQ being assigned.
+ * @early_request: Flag to indicate this IRQ was requested at bus probe time.
  */
 struct sdca_interrupt {
 	const char *name;
@@ -48,6 +49,7 @@ struct sdca_interrupt {
 	void *priv;
 
 	int irq;
+	bool early_request;
 };
 
 /**
@@ -86,6 +88,9 @@ int sdca_irq_populate(struct sdca_function_data *function,
 void sdca_irq_cleanup(struct device *dev,
 		      struct sdca_function_data *function,
 		      struct sdca_interrupt_info *info);
+void sdca_irq_cleanup_late(struct device *dev,
+			   struct sdca_function_data *function,
+			   struct sdca_interrupt_info *info);
 
 struct sdca_interrupt_info *devm_sdca_irq_allocate(struct device *dev,
 						   struct regmap *regmap, int irq);
diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
index 1496a15f7d2ac..5ae6c727c796d 100644
--- a/sound/soc/sdca/sdca_class_function.c
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -408,7 +408,7 @@ static void class_function_remove(struct auxiliary_device *auxdev)
 {
 	struct class_function_drv *drv = auxiliary_get_drvdata(auxdev);
 
-	sdca_irq_cleanup(drv->dev, drv->function, drv->core->irq_info);
+	sdca_irq_cleanup_late(drv->dev, drv->function, drv->core->irq_info);
 }
 
 static int class_function_runtime_suspend(struct device *dev)
diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index 1e4efc0609d93..d86884a89c405 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -456,6 +456,8 @@ int sdca_irq_populate_early(struct device *dev, struct regmap *regmap,
 				if (ret)
 					return ret;
 
+				interrupt->early_request = true;
+
 				ret = sdca_fdl_alloc_state(interrupt);
 				if (ret)
 					return ret;
@@ -562,17 +564,10 @@ int sdca_irq_populate(struct sdca_function_data *function,
 }
 EXPORT_SYMBOL_NS_GPL(sdca_irq_populate, "SND_SOC_SDCA");
 
-/**
- * sdca_irq_cleanup - Free all the individual IRQs for an SDCA Function
- * @dev: Device pointer against which the sdca_interrupt_info was allocated.
- * @function: Pointer to the SDCA Function.
- * @info: Pointer to the SDCA interrupt info for this device.
- *
- * Typically this would be called from the driver for a single SDCA Function.
- */
-void sdca_irq_cleanup(struct device *dev,
-		      struct sdca_function_data *function,
-		      struct sdca_interrupt_info *info)
+static void sdca_irq_cleanup_flags(struct device *dev,
+				   struct sdca_function_data *function,
+				   struct sdca_interrupt_info *info,
+				   bool late_cleanup)
 {
 	int i;
 
@@ -584,13 +579,49 @@ void sdca_irq_cleanup(struct device *dev,
 		if (interrupt->function != function || !interrupt->irq)
 			continue;
 
+		if (interrupt->early_request && !late_cleanup)
+			continue;
+
 		sdca_irq_free_locked(dev, info, i, interrupt->name, interrupt);
 
 		kfree(interrupt->name);
 	}
 }
+
+/**
+ * sdca_irq_cleanup - Free the regular IRQs for an SDCA Function
+ * @dev: Device pointer against which the sdca_interrupt_info was allocated.
+ * @function: Pointer to the SDCA Function.
+ * @info: Pointer to the SDCA interrupt info for this device.
+ *
+ * Typically this would be called from the driver for a single SDCA Function
+ * from component remove.
+ */
+void sdca_irq_cleanup(struct device *dev,
+		      struct sdca_function_data *function,
+		      struct sdca_interrupt_info *info)
+{
+	sdca_irq_cleanup_flags(dev, function, info, false);
+}
 EXPORT_SYMBOL_NS_GPL(sdca_irq_cleanup, "SND_SOC_SDCA");
 
+/**
+ * sdca_irq_cleanup_late - Free the early IRQs for an SDCA Function
+ * @dev: Device pointer against which the sdca_interrupt_info was allocated.
+ * @function: Pointer to the SDCA Function.
+ * @info: Pointer to the SDCA interrupt info for this device.
+ *
+ * Typically this would be called from the driver for a single SDCA Function
+ * from bus remove.
+ */
+void sdca_irq_cleanup_late(struct device *dev,
+			   struct sdca_function_data *function,
+			   struct sdca_interrupt_info *info)
+{
+	sdca_irq_cleanup_flags(dev, function, info, true);
+}
+EXPORT_SYMBOL_NS_GPL(sdca_irq_cleanup_late, "SND_SOC_SDCA");
+
 /**
  * devm_sdca_irq_allocate - allocate an SDCA interrupt structure for a device
  * @sdev: Device pointer against which things should be allocated.
-- 
2.47.3

