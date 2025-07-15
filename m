Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84A622E3F0
	for <linux-sound@vger.kernel.org>; Tue, 15 Jul 2025 15:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752592693; cv=fail; b=Ls1Z/ipTWuYZ+KpIk3kTfAPDB7MDw2stCR40IOFvI+8WNdqhgrH++HYuXHhf1dcf2eku+Y81ylnOWXY1tJble8YK+RrtVHGhtwNOX5jOT+Yvk6c8gKtCaHdYvrBa75ltEH9+m1xnh46ZyBNjmFyQ/TPf+p6ST0NauilY6Jv1e9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752592693; c=relaxed/simple;
	bh=LMTjk/i0R4XAn7qPjG+SVs4JgSu81iuD4AkGTtv78CQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Im1Wqv5oaYG9f2B4ejrSUd7HeDK26gjVUnjwD+tciQ0zKSL5TKl/G567Aiux83x5QVAWGtbwDqUlivo4rdklHrPVwli+4JN3GpH5/1byCkbA1KfQeEtDRWZqodTZCDbFeVkElW8HQI9l0vj87bz/IgkvdXEvjvuh2SyrWjfI2x0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=MUKw0mkG; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=pZBPpAKb; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="MUKw0mkG";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="pZBPpAKb"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FEmkZo029707;
	Tue, 15 Jul 2025 10:17:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=u7vlI+ipGwQucGoBiYT2L9gyAnwJIV2IeQjSgCAsKME=; b=
	MUKw0mkGrOnIN7E5yB2jC5wr+gv90O7OZU3jXzEpfVo8Gqj5an+VgrUa1PNKI1lv
	zUjXIWjBuDoMR7EFYGAoQHOtore7Rsx5AESolThTV/wKbfRYYi3kioOk7gMGGjST
	KSz1kGTp96UsHk+X3JGT5mExhfehVFoYpMOYwtmXCHFxtUWjoLw46hG2Xk0hkEv+
	w6vq+Wd6A+h+R3urNBgb12vUk7W0UlN/8INLzrXU/ln690JGU72I7pHdf/L8XdAF
	wUf2PE7cp70aNxqFQ4urhh/k/L629/uZceQV8Na/XSqUf1esjGkpv2QNix18tI2x
	xdnUKOZQZrVTqGfEe3PGXw==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2121.outbound.protection.outlook.com [40.107.92.121])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 47um4gvc6d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Jul 2025 10:17:33 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n4+61PdVp2U3k0qypITASKMmFGYTHn3Hz0Imo7v8/0yyUtvuCOfWn8eV7GArIxkcr1VQRx2qIZTl7UyOdY7q4Ony5yaWBklgpJBj56uYUnqKWBPjth9RamBw5aiO5TcScaH2bYgNe2yXSeFThkWggLlr4b+pNYG8ww2k5uK5kfKOLHJqKk7SWvj9x2fKhOpWHiL+mZFxbPYRpuG3YmyOeFWL9m2fwQLByvbKpBmSmEowyBxGtMTApNdDpzuyB/cNbVdU4wYqywdk/vF6UsBll/dmnJMo3m7oHRpcAKHyiLTMKr/ytA5uQNfat3SVnEtuhT7G52I7Y8iltbbnCnga+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u7vlI+ipGwQucGoBiYT2L9gyAnwJIV2IeQjSgCAsKME=;
 b=T3zFJpqUWk1XxKaK889xeENKf4Vsywa4eoUcMZaz5i134O9FVIOMc7aHxYbPtGIvVr0/uezevtPjOJsn+vMVIc320B5DoBicbekKb65GcZi8jtrCd/6/6IttzXsVg3AaLktdXcVJ7kdsU1lrHvdozuHELirpxQMCDtmil8DGtWgUtssQ5tgNwO81YvdEB98lHWUcKLQ/Zl33uTKA7lKT8ylkqnz/WUe1ZSfmwDr9qIvAe8q6iMGF0bT0saFUpcMj5DGB70HT1MzChTEOrd7AiJ9avPywtj47oUAQODgw/kF+zKO/HZQdxuR1Luc7aUlmmlXoPEyyxuI/yviYQ6xyYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u7vlI+ipGwQucGoBiYT2L9gyAnwJIV2IeQjSgCAsKME=;
 b=pZBPpAKb1zM4Zm3nExW9varfJSdb9oEovoY6mTpIZhi4VyyzhLilRxVNhV2NHEi6M9+XPZrlANPnJ1B4L+F+OSCdGEAJU1xjIUjBFwL0rtgkCPVpwW09elZ5LEfCDryfn4CoGFkf5yipWi9CGGrgXMOw+iJpeFKIvT5JhsCPQ6M=
Received: from MW4PR04CA0241.namprd04.prod.outlook.com (2603:10b6:303:88::6)
 by MN2PR19MB3965.namprd19.prod.outlook.com (2603:10b6:208:1e7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Tue, 15 Jul
 2025 15:17:29 +0000
Received: from SA2PEPF000015C6.namprd03.prod.outlook.com
 (2603:10b6:303:88:cafe::d7) by MW4PR04CA0241.outlook.office365.com
 (2603:10b6:303:88::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.17 via Frontend Transport; Tue,
 15 Jul 2025 15:17:28 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF000015C6.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22
 via Frontend Transport; Tue, 15 Jul 2025 15:17:28 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 2292A406542;
	Tue, 15 Jul 2025 15:17:27 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id F131E82255C;
	Tue, 15 Jul 2025 15:17:26 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        dan.carpenter@linaro.org, shumingf@realtek.com,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 2/3] ASoC: SDCA: Avoid use of uninitialised local name variable
Date: Tue, 15 Jul 2025 16:17:22 +0100
Message-Id: <20250715151723.2964336-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250715151723.2964336-1-ckeepax@opensource.cirrus.com>
References: <20250715151723.2964336-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C6:EE_|MN2PR19MB3965:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: bd7510fd-fa62-4f66-0ac7-08ddc3b2b63a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?l9hRxGHEZquEqrPSbEfnuGrYeCw9ss6DXkaZv69M/b5N7L7R4bs5K/BHI341?=
 =?us-ascii?Q?2QOURSP3d/DIDvmFCUv4knuo95U6GVLnUcWrcWTXxfGkqEpwfw4xOeOApBD4?=
 =?us-ascii?Q?UqhlKARbtc8wOEpttjU0luFOVnYUtGsbfXfSvZ+e8mD8YyE0kkYA6B5CCZKc?=
 =?us-ascii?Q?A1fA09MtYTB2jLZBSrkdoTHkOH2nZSCATo7Pg9W3Ek+NmWJpNFCI4GDwYna6?=
 =?us-ascii?Q?9rSC2RilwprCZhWnm/Vra8XedxkuEPKcC0lX0nZm7Da+HfrDpyH1g12gqdG8?=
 =?us-ascii?Q?AtrD/3Jq20pInlGCqgl5psJrginf2YI/Pr5F+VimnKEVWDJbISIlDMfgu0fl?=
 =?us-ascii?Q?Cvrs4hHAbveoYdr0ZPON+VIZf/x2RD2uVJ2HWdO+DKAzd3QhY5QGJodlrT1F?=
 =?us-ascii?Q?dDw1HpEEdfk/oR2HS00LFJzMBIjMrBrP5T+7PrEL3r0xt6Wu/V6aGpKrHmOX?=
 =?us-ascii?Q?7Kha5ILgI3AxVgWW5YWVxkvYV+HQt18xFBAv+GVm642Gf9P1s2fITyVOBSBm?=
 =?us-ascii?Q?hRE1L7kQvUWw2u3jWd43f5lxpc4eOaHnav12uDwhbPugIedfCG5Op0BWPj4W?=
 =?us-ascii?Q?rbEKFzIVOW8fy3VIIJ3urgVigEf39+zTquo0+fdYmFFcYdFR0uPohLQAH3Lj?=
 =?us-ascii?Q?rwMv8B4Q5VsrBhZ9uhLQrG9xoRir3BOzaT2tGRsMIdv1huo8akCwFMjfEfGf?=
 =?us-ascii?Q?strdaosVfaPg3TW1dbUMldXuAmrdZ9Tkf/KCX4sAxktJQmlajItf/rleLn7S?=
 =?us-ascii?Q?cRk5i7mDJlRHkZGVXgVpfBzWOhBT7OOWqSDTxyqKDa9JuSq2PckxL8F0vEMq?=
 =?us-ascii?Q?UeBEOonPYnA2N+UjcZ02KFaNviykKbWwXPg4v1F+sWOGmIAHCxTfSN716fM0?=
 =?us-ascii?Q?x29lMbyUWhnPoMs+D6jd4MELAvbyMcAOh9RltscwYC6jYVOD0xFOyWIYi0f6?=
 =?us-ascii?Q?eT6JeEThQdZhsetDwNZGiksT1o31EjHYgVnprcjHt/mLPBVuxbMEX4PrVTgh?=
 =?us-ascii?Q?QtHBOztPZgtG8UBFI0ahjyE1Lhu1W08Rb7nYxKRYTp+MGzOIojQHjGOEGUI3?=
 =?us-ascii?Q?ZTRGV39Gopi1+0EQOLY6ApUR2135fQC/2UdHdu75z5sPaNdtG1CqIJyWDqOW?=
 =?us-ascii?Q?YQtRgnmfwwwnBb7so5eF3Y1ZJFxl+n40vSjShg5PFJHWqkGo8kvM5GDMVA3+?=
 =?us-ascii?Q?p925Rc1iL2eG2qxyXFWVmJbYGN+B2Nr+Tzyz3bEOIAsiME/QgXFld1/pJps5?=
 =?us-ascii?Q?KYWRX8R5IDykOhrQPjdLeYd5FfAMIc9nTKdiZV73NHcuSJJXSYY1wCIwfzUD?=
 =?us-ascii?Q?V4pS81ATr8XRmw9aNCkZyZcCgaRifmQ5oG5H7jRKE8Aev5q0pNKZU3y1ZyhT?=
 =?us-ascii?Q?TraCUyvV6s770qmRGg48NAsN0Xlz5r6gTrBXJEpbIKBTolvHDxICdBVQFmE9?=
 =?us-ascii?Q?CaHQ2eim3YxXc2Xx/97BZOQUhF5me0w9g+O/Mfz9P+tPOki1BonK44YtvUDW?=
 =?us-ascii?Q?oOddWpP44+mX3POdjMkzBCIOydOwxqzcoNDe?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 15:17:28.2576
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd7510fd-fa62-4f66-0ac7-08ddc3b2b63a
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR19MB3965
X-Proofpoint-ORIG-GUID: l1nauUiKFa5OkKplHNQsk0D_DvzGSO-G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDE0MCBTYWx0ZWRfX4DaTURZeK8XG l0rHdLdNZcuR4864gminSrF8JHq2M+LBCtcjI1L2/OflQ+xbBgAWXoqEUCdB9Mv4CkNl093S/kb 83zwwumEWqBdRDa0N52WXALlGwZ1z8HHYuqz5ZzeTIo7wgNYgP2p18JBeShoUcv/UCRNV3i5Mk2
 BGFmC0yZo9qmIaWB1J7G6G5xjVVB/XwcwMh0HMjLspYHQl0mbKx3PlGnukIo5M/IopQaS4dIq56 DiUMYGH8XazgZcNJf6YJjmGQaUkyTuw59ovUo32k5elIZRygUi+vAOY+mrH7lTvL47rHO3NQ1Jh 0DCycjnmRHBeqJkx9JULp5EeNKqr5x4nu5ATsEWZHppuD3Ssj4vcSloJgpUOd6biFwnFceWoBus
 BpAyAgsQ1K5pEtJo4TKWnAiGR47lcmk7rq12bdOATg58M4YCXvX0cheIXorW1z+xSRH2W9NJ
X-Authority-Analysis: v=2.4 cv=Kp9N2XWN c=1 sm=1 tr=0 ts=6876710d cx=c_pps a=qbbqAyQBX9HJiZL65XHq3g==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=Wb1JkmetP80A:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=KKAkSRfTAAAA:8 a=w1d2syhTAAAA:8 a=Rc_zfZV6G2tp4E_J-K0A:9 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: l1nauUiKFa5OkKplHNQsk0D_DvzGSO-G
X-Proofpoint-Spam-Reason: safe

The local name variable is accidentally left over from an earlier
version of the code. Remove the variable and its uninitialised usage.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202507150415.M1tCgi3p-lkp@intel.com/
Fixes: b126394d9ec6 ("ASoC: SDCA: Generic interrupt support")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdca/sdca_interrupts.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index eb9e7eff4b4ba..b76512732af87 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -342,7 +342,6 @@ int sdca_irq_populate(struct sdca_function_data *function,
 			int irq = control->interrupt_position;
 			struct sdca_interrupt *interrupt;
 			irq_handler_t handler;
-			const char *name;
 			int ret;
 
 			if (irq == SDCA_NO_INTERRUPT) {
@@ -385,7 +384,7 @@ int sdca_irq_populate(struct sdca_function_data *function,
 						      handler, interrupt);
 			if (ret) {
 				dev_err(dev, "failed to request irq %s: %d\n",
-					name, ret);
+					interrupt->name, ret);
 				return ret;
 			}
 		}
-- 
2.39.5

