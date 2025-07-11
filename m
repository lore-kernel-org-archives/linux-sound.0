Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD361A5BA4
	for <linux-sound@vger.kernel.org>; Fri, 11 Jul 2025 10:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752228411; cv=fail; b=gEfDPvjCdJvc7BMkQ2gYps2PJmBfuVU4eWojuQ3dn8rNvUaZjPi0EzR7DgbzmpF/k/YuGoY/jK2A8RVl8B/hjeOhdDR/FGQ7r3rNyAmFXTCvkTouSGQx9MzTjpOuu+UKNlCUCtJczhoWspQZ6FGx3lHxW9DQrotB+qaOQT/qZhU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752228411; c=relaxed/simple;
	bh=/BaV1EnpBdcZNirUX1F3hUZKOvYtQ1T3ns9ppEMLQwM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qfzcU2AV7antYeL61V8k+LmW9HyA9vHG3rxjI3LbPpeJrDA05XRp7hdOJadxM6WbxBDqs43dizsnXl/TcE7fzTrvjpJaYtQf0Di7D2FJFGpuqCSNGHKrh5fcpho6wH7tzhaSWqOT+MErsdNlZ+aFUCr9K/yX3T9WjeIrBbnYEMs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=U1PFxSPs; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ygm46ua1; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="U1PFxSPs";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ygm46ua1"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B5wwAv014521;
	Fri, 11 Jul 2025 05:06:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=nwkMPW9nBDwbscCprWex5ZQU1l6NIeZMgpTGZ8Ik8b4=; b=
	U1PFxSPsZbr2bTM+mQRqsX9CqDvCwRamS7FPRnu/OqS59Y0kJd32DGEWzd5EgFYR
	xzWYG+UQOzwZ/y4h/xCi1llyUFAnibGSab/Gz1pDJAU0PGp74EVe9Xsjhh7sZRik
	J4hg/N6XBrZUWp1vdX0yfsFkWDY2GaLrg9hkXNmH+WijZ2U+Q2BBGULAxjnU+fEZ
	aKCbdDcTrt4AMk2rJqqQvW3oe83a/O2ARy7Iwe1eI4maIwIe9wNVkdmDwuNJDyEA
	Wwxo+0NDXUmnpzGhSmVMH+wBzzaebFnEHZPeRnwIzfx1v59Jj7xJaN5mtl7eb6ts
	M+R2iH5W60mdgjtz4SBx4w==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2097.outbound.protection.outlook.com [40.107.93.97])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 47sev6dy73-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jul 2025 05:06:31 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DGo0iDpTGOdVUU/cRCVFvK0tzeoUOxJdhkqPEW7xLgERKGtdbs/syP1uU1soZG7v16pNQHbN/4/7ZThHmFPiPOKjHVxUDLn0BDylwSmSfsRurV9Xaztv7br4Pspyih9aAcmZQhptEcBAzeIJw25VfrirfrRY+9KmrLbZIJybIplgZCoo7h6cjvqYQtYHAN/GWfd7WBF6RHRxUAKBDfGhyOSTeR3QVd3WcOUv0b3vC8bL1CegB5atmgXAzxXAGJe0ZUbCzQs8aNMYUr1MLQD55fWt9pYj4Yip4wFtwvN1T8jNt+0ViV9qwTQINxUoP2w7HMaf29uGMyPoLLcS+P8K3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nwkMPW9nBDwbscCprWex5ZQU1l6NIeZMgpTGZ8Ik8b4=;
 b=sWcZ1zOjvUd9JfyzLuQwKq+/GHwHMiTgfZzLJHMRgYGUt78jvAzbXW640yPean1VwbamGi33T/HXzocTONNZlQv8s/KkC4btKt85pNOuYJsXUb7QP36F7K4rt5PtpxHWrqVdUnCaQbPHJLqb67omFYNQwu+LP0uJXHzLLAv1f0F8v4uWY7nz9rBESv65XP1BuF10yskey+1yyJUJbWUWpR0ejVGQlTqWpeBFIucMFDas/+J7WRknLyzrB5/j1Q1aJ/Q5b23DFjVSFVTcLoEfb3GlCozJNc8Bd/ETWWb5GeLmWmWtTVvWrLrynurM0Yd5lD1e+/+ucHXyJzQd+DPAFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nwkMPW9nBDwbscCprWex5ZQU1l6NIeZMgpTGZ8Ik8b4=;
 b=ygm46ua1u7G2t72vNnoIU/TBjnLzI+2ZYERvyvOpizFaE21BiiI2zWqK49QX/eIs8kI6D7yhJzi9tKgTITKZ1UOLHhTHctvivoazXyUUutbVMttKyphHxx8ajkXzMS9YU/XN3VBheoR4UZPosztVSeB7j9/r3prtiHjDA3qZXJo=
Received: from MW4PR04CA0273.namprd04.prod.outlook.com (2603:10b6:303:89::8)
 by CH2PR19MB4729.namprd19.prod.outlook.com (2603:10b6:610:64::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Fri, 11 Jul
 2025 10:06:23 +0000
Received: from CO1PEPF000066E7.namprd05.prod.outlook.com
 (2603:10b6:303:89:cafe::20) by MW4PR04CA0273.outlook.office365.com
 (2603:10b6:303:89::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.26 via Frontend Transport; Fri,
 11 Jul 2025 10:06:23 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF000066E7.mail.protection.outlook.com (10.167.249.9) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22
 via Frontend Transport; Fri, 11 Jul 2025 10:06:21 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 5363B40654F;
	Fri, 11 Jul 2025 10:06:20 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 34E73820257;
	Fri, 11 Jul 2025 10:06:20 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        arnd@kernel.org, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 2/2] ASoC: SDCA: Pull HID and IRQ into the primary SDCA module
Date: Fri, 11 Jul 2025 11:06:16 +0100
Message-Id: <20250711100616.296329-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250711100616.296329-1-ckeepax@opensource.cirrus.com>
References: <20250711100616.296329-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E7:EE_|CH2PR19MB4729:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: fbe5d3af-729c-4463-1830-08ddc0629685
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|61400799027|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fbJcI30MNWVbNmyaGEYNfOzTEMwTuABHTBOe0N/DCh7cLZnIBR01pEyU9beO?=
 =?us-ascii?Q?hCLi/oaLZsOXDiWTE1v2r+7CypIXrpz7eCChEe7SH3AzDvZhPwvanzeLLe3s?=
 =?us-ascii?Q?6eIWiJ/h5Kbk8AWl2cjSesYd0EfNeqyXI0S6ZzkJVUsm6PlT5ePVkkpDObsQ?=
 =?us-ascii?Q?Fd20GmeuJTMLJcwtrUmMZXvPeFTvjUCSIEUzc/ty9e7bSfQDwZ+PAsY6m3NT?=
 =?us-ascii?Q?ZzTOFIq9SVqUv2jUjSB3gQc4f8hr+kifYJWgXP1saP3qgKMBQawxclhZ28y/?=
 =?us-ascii?Q?X3J+TD3m27V23ZQB8T+l+C7bKOQP9egL/GoJAlRViJHxbUo1mGuHr5eAZCKy?=
 =?us-ascii?Q?JklmuXES4CvMV8gu3C5jptNuq3Y+31dgdlsH7EvD9aqsp6oJc3AnOPb7OB08?=
 =?us-ascii?Q?Unj4Zn7a0t7QGzAxws8hfDqnsnRQks6qpHvYhJaFvI22Jde4Sm73VRD0Kxv7?=
 =?us-ascii?Q?T11P3++C+lmtmlsI5H1/pK6pOM91FagaFDXEP6y5Tz5KLhixAXJac0jfG252?=
 =?us-ascii?Q?IBbmW1g5BDKvqnJQDPMtEgYbimFgydUJU/sUIoGiZqpFshuO5yEMzM9fu/8s?=
 =?us-ascii?Q?ywwCiInjZM4y7rnoK3iQB7cbzcslxwHet/plJae7C24oOYDpNuuySnvi2/hn?=
 =?us-ascii?Q?InwVm9taFfDzgRk0FpEZwNivV2ol+JOfA6rQW5zLflx76FDe+JlsdZ6Fht0n?=
 =?us-ascii?Q?vDzVFhuM+zbE5vDkIzufg7K0GSvEayFukI2/NlA/DkRzbBvYG1XcSqN++4qG?=
 =?us-ascii?Q?mpqTkTOvMQiBhFU4KKlPSaLrhthxM/Rg5KqQzXF29wnCnE5jHoRZbHXvus5n?=
 =?us-ascii?Q?CUdjh6CLeE7cCHIqOUIJRrGf7MSbWYHq6OsEzD5CYiongX/sCUiRZ9YpGP3f?=
 =?us-ascii?Q?NTLMquw++W5i4RUiGhAQq/MqYME4yBbemiJcy32NqHM+Oyrcprwy5HJ+1MKE?=
 =?us-ascii?Q?OTRkqOTB3Pfk1RsBBq0+pL5tB6nU/lfDteta4ciFNouzEOdD3KIqgbTOsmof?=
 =?us-ascii?Q?Hmi9QAA9r90DoSOQxHts+MlwZpKv4VbIHDktThkx2D+9to54pIitI0oUcrlh?=
 =?us-ascii?Q?jrKjJKRPpxCwjkHzRDaEe7mwAqhSSb3RYI0p1i0CP7bKWWFhXGLUHyMVgfKe?=
 =?us-ascii?Q?uebheDiScD7oKbhoNZIcqRnbXfiuI2xVyX0WNQ1CHWty/DEaq/SfhbaFOHZn?=
 =?us-ascii?Q?UJ+pKSd1m87dF66KBV147LWmLBzwB3/n/D9FjwlnFt+HqrUFGN94chwT3VVP?=
 =?us-ascii?Q?NZBNKXsB/iONlw3FesmQ5ZUFVxi/ivlszhmrV1BK44mwZeM4xa/c0h3x8Mbv?=
 =?us-ascii?Q?oig9NEnhu0xnEqBoWwnVW/vZ+BAuZAsBmscqdeO18Xwlbnb2ojmc+yEtBq2P?=
 =?us-ascii?Q?PMSLAOgDTfdIUfi7UP+H2TBjwFS9GAl7ZXN9ofpCG0DmRMSPuRA/MRz3Vhi8?=
 =?us-ascii?Q?jnTctF8ppTx/uTnpvSAQuzBep5eAMc+smws81TscichDZ/42V7dFN9kj3BnB?=
 =?us-ascii?Q?YT7wdBE5HFCUM7Dr2wHOKnH8KCXdlSmU3bIF?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(61400799027)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 10:06:21.7835
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fbe5d3af-729c-4463-1830-08ddc0629685
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR19MB4729
X-Authority-Analysis: v=2.4 cv=Zb8dNtVA c=1 sm=1 tr=0 ts=6870e228 cx=c_pps a=3zwJ+Acc3RxIQNi1sO625Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=Wb1JkmetP80A:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=PnvNH41lCDOGRys4nAIA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA3MSBTYWx0ZWRfXwBGQHaB+11oe Hl6KtWIO0lxVg+OLYpipZKW21Qkjr9OvTnjHCezvWvvQuSi9QFq7cEKa19+1n5iVA6AKT8pYv6M O5kg8f6VIYm/J06peNa9PDgxr8sH9kxHCF77ijxecAfWjnTAedRJlbruwnp7xXlhXqVxzKtN0Qu
 gwHke4pH7buVrsTorK9nxhR0ntVI3ElxgYPLdc8XLwxHRpuQPBkrALvAejSqTs8+WdtXI++UfQ7 Ua5TEj3YBPReI4M2I93YfOSa0lEUp/PgV5bemuaJnRYS2kMJe3Wlu7DF4mB2h49kysykNez6QSA IN5iA3UsuEfzjzIiwuFpjKgXjnhUmzUoBPX9+cYVGyFCNQAWa9+1/NCradxNYtivQNDOS3BEG2p
 XjBMc9S2wumJan4EDX409NWFlglNTyyfMOyKRZ5z2pYUF5B6/hXNVj5H12mi2+tsYVXuagQD
X-Proofpoint-ORIG-GUID: S75qpj8oyVS4ASsYDz6yVxCxfeY0kaX2
X-Proofpoint-GUID: S75qpj8oyVS4ASsYDz6yVxCxfeY0kaX2
X-Proofpoint-Spam-Reason: safe

If the HID or the IRQ are selected as options they will always require
loading alongside the main SDCA module. Since it will never be possible
to run without them the value of keeping them as separate modules is
fairly limited. Pull them into the main SDCA module to simplify things
still further.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v1:
 - Simplify Makefile bits for HID/IRQ

 sound/soc/sdca/Makefile          | 10 ++--------
 sound/soc/sdca/sdca_functions.c  |  1 -
 sound/soc/sdca/sdca_hid.c        |  2 +-
 sound/soc/sdca/sdca_interrupts.c |  8 ++++----
 4 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/sound/soc/sdca/Makefile b/sound/soc/sdca/Makefile
index 58a8f3ef3feb2..5e51760cb6513 100644
--- a/sound/soc/sdca/Makefile
+++ b/sound/soc/sdca/Makefile
@@ -1,13 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 snd-soc-sdca-y := sdca_functions.o sdca_device.o sdca_regmap.o sdca_asoc.o
-snd-soc-sdca-hid-y := sdca_hid.o
-snd-soc-sdca-irq-y := sdca_interrupts.o
+snd-soc-sdca-$(CONFIG_SND_SOC_SDCA_HID) += sdca_hid.o
+snd-soc-sdca-$(CONFIG_SND_SOC_SDCA_IRQ) += sdca_interrupts.o
 
 obj-$(CONFIG_SND_SOC_SDCA) += snd-soc-sdca.o
-ifdef CONFIG_SND_SOC_SDCA_HID
-obj-$(CONFIG_SND_SOC_SDCA) += snd-soc-sdca-hid.o
-endif
-ifdef CONFIG_SND_SOC_SDCA_IRQ
-obj-$(CONFIG_SND_SOC_SDCA) += snd-soc-sdca-irq.o
-endif
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index c34f3bf629833..be09b7a341027 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -1943,4 +1943,3 @@ EXPORT_SYMBOL_NS(sdca_parse_function, "SND_SOC_SDCA");
 
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_DESCRIPTION("SDCA library");
-MODULE_IMPORT_NS("SND_SOC_SDCA_HID");
diff --git a/sound/soc/sdca/sdca_hid.c b/sound/soc/sdca/sdca_hid.c
index b227ad94d08ff..2224ade59affa 100644
--- a/sound/soc/sdca/sdca_hid.c
+++ b/sound/soc/sdca/sdca_hid.c
@@ -121,7 +121,7 @@ int sdca_add_hid_device(struct device *dev, struct sdca_entity *entity)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(sdca_add_hid_device, "SND_SOC_SDCA_HID");
+EXPORT_SYMBOL_NS(sdca_add_hid_device, "SND_SOC_SDCA");
 
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_DESCRIPTION("SDCA HID library");
diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index edb045c7ebb08..2f85fcc6e5446 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -279,7 +279,7 @@ int sdca_irq_request(struct device *dev, struct sdca_interrupt_info *info,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(sdca_irq_request, "SND_SOC_SDCA_IRQ");
+EXPORT_SYMBOL_NS_GPL(sdca_irq_request, "SND_SOC_SDCA");
 
 /**
  * sdca_irq_data_populate - Populate common interrupt data
@@ -313,7 +313,7 @@ int sdca_irq_data_populate(struct snd_soc_component *component,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(sdca_irq_data_populate, "SND_SOC_SDCA_IRQ");
+EXPORT_SYMBOL_NS_GPL(sdca_irq_data_populate, "SND_SOC_SDCA");
 
 /**
  * sdca_irq_populate - Request all the individual IRQs for an SDCA Function
@@ -393,7 +393,7 @@ int sdca_irq_populate(struct sdca_function_data *function,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(sdca_irq_populate, "SND_SOC_SDCA_IRQ");
+EXPORT_SYMBOL_NS_GPL(sdca_irq_populate, "SND_SOC_SDCA");
 
 /**
  * sdca_irq_allocate - allocate an SDCA interrupt structure for a device
@@ -433,7 +433,7 @@ struct sdca_interrupt_info *sdca_irq_allocate(struct device *dev,
 
 	return info;
 }
-EXPORT_SYMBOL_NS_GPL(sdca_irq_allocate, "SND_SOC_SDCA_IRQ");
+EXPORT_SYMBOL_NS_GPL(sdca_irq_allocate, "SND_SOC_SDCA");
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("SDCA IRQ library");
-- 
2.39.5

