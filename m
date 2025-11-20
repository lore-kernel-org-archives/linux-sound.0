Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755EF2DC332
	for <linux-sound@vger.kernel.org>; Thu, 20 Nov 2025 15:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763652730; cv=fail; b=TrrotMhITtO1CKnO1a2J2aar8Z9uLPonu+373Cbv8UzFXgdy1Ow6MkVy355jufFWhk4hkGca8tM2dZsvnkWqQp824phkd2RLeU1LerI/7claQboBkWega8BCKj4PKTn67nZtZKMjbTHQ1J6KSXmgl6Mdq8jhGDYxGpvPvq+MKnM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763652730; c=relaxed/simple;
	bh=AaqeXS82mZA+3Ra4x73Sh0Gs4dYLrwuMsSOxSAhHiT4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t05FHdPXJHJMTq9OBEqAMHLQWKqx8RVLNp2Z1GCIL1ChyTjZneNdM46qgNPrt/J+m1VNNORylqUG9jATVkhKIIpY3fZqoReg33pkcU/Riyq16Or3QvtkcjZo7Cu2QJ8uYSEtRAgtIXxxtTyxarvVPUd9EZbDEG6iJGT2u1gQN2w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Btyhdv4O; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=kVdOX+7V; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Btyhdv4O";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="kVdOX+7V"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK3soJt262792;
	Thu, 20 Nov 2025 09:30:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=Xv1e9k3+6I1ambB4BXYfnKMg7g2Ml/XeLYJ7LZIKePg=; b=
	Btyhdv4OYsjtkk1TdfgV8BGn8NxHGxpYZTihR+klEBHA++3pi4BQar9Mu1Nbw9sp
	7bK/581IJAF5Kit8cXaqv3ed3FlPr5nrgzbMTee9532alPueOCYikZkf+fV0T1Of
	eL1H+bq9qQ2OBgmOa+y1utzvy7bNSmcQcSep/MuDzOljxRvpTa/171tMpxuf5pxj
	992XvFrQ6soZi1DILYK6UQDnvWTX93fMxK2wq3Z6zXvXop4UmIBE2+rG221Anwxr
	G1vtsfP6tpNmmJNTGKJjyn3VbuYFsh73CLf7SqaGGzvhFOqWu17c6zGnv8vTmlpj
	G8msbBMd4a42P2C3YdD8+w==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021143.outbound.protection.outlook.com [40.107.208.143])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4aeqt1enjw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 09:30:45 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s/ks0zaOyKw0SThYFxXPVqPlD94zctbQ4/6H0oxiMteUx9uMm0T88tSNFnK57AcM4gWGgvu3VXQ1SOojU9uAhFPmlIVnPuTlucjS5I+W6dawh6LdujqC+F5eA5kU5yJI1kGsNwliql6QEC1JcILYO+hp7zVb6BykOwnqQHCcr/KRK2CVPpy0ta8AUMzQHGuAdzYQksaPHYQ6VtcRCiVdfOZ4jVGMOw1VS5YsGrfipW5KfHXkzIP2vXkmj1zpyAAIr0ypaP1ALvhMqjrxuBg7a/LMyLqInQGBg+ICxQucOFWYIhRd0RagkeCCRNiztDZ9MAkMYWe01j0s2obwMuIrRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xv1e9k3+6I1ambB4BXYfnKMg7g2Ml/XeLYJ7LZIKePg=;
 b=QgffSqp1OHFL1QDF1e0E6Imuh9oe3XeMxdLG7x59bnJ+/3b4A+EkCFFI2Xan8X8VYRMT2u9C5fvFSba3LTdKgwCNgVm+pqzaqxNzeJesjXlEUWWWbenk1e2x5V/TNiCT2x0Jimlx25PA+rEARCmSivZ2WFE/kYS4ZlgHnMSFJaA/GBBksG2DT5XeLoIP3BHJMkafLRXjT3EcT0UCSgA2MKAqMxd9ELcLbmbIucWy8RAlGZpALinoJHpIo7aOqGacehmooaxGREcT3E+cWy11pKUN10q2CUOPpk3Uy9qcKHojxFom9hNuhJshYXmbADUrfwZMlaoK4x6LtU9BEw5sHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xv1e9k3+6I1ambB4BXYfnKMg7g2Ml/XeLYJ7LZIKePg=;
 b=kVdOX+7VfYIEtTLYRG+8iWiVi9EUT0T+OJ8Ps8RefKNyY+tEvQkzKshR6EaM8bsJT1HZQ3FLrPrgnzaLipg3XFwSin5fvEAD6m9BhYQE4j6lIj2tTNhpajufZIngDMNjZ/geBZAKNkO7lMVDRcSlc+ejXJXMud3v+6Y1FuLAuKE=
Received: from CY8PR22CA0017.namprd22.prod.outlook.com (2603:10b6:930:45::20)
 by IA0PPF8F544CF46.namprd19.prod.outlook.com (2603:10b6:20f:fc04::cb5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 15:30:34 +0000
Received: from CY4PEPF0000EE36.namprd05.prod.outlook.com
 (2603:10b6:930:45:cafe::8a) by CY8PR22CA0017.outlook.office365.com
 (2603:10b6:930:45::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.11 via Frontend Transport; Thu,
 20 Nov 2025 15:30:33 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000EE36.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.9
 via Frontend Transport; Thu, 20 Nov 2025 15:30:33 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 0FFA4406560;
	Thu, 20 Nov 2025 15:30:28 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id E5522820247;
	Thu, 20 Nov 2025 15:30:27 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v4 13/13] ASoC: SDCA: Add basic SDCA function driver
Date: Thu, 20 Nov 2025 15:30:22 +0000
Message-ID: <20251120153023.2105663-14-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE36:EE_|IA0PPF8F544CF46:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d8f31faa-d1a2-44eb-fb02-08de2849bf2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ekCinH5wGjT2PE+814HouicWf4eLBrwkHWFx61pCjIYwKGNFzGfeUKlBkVFm?=
 =?us-ascii?Q?VXKDy5atdblSqWFh50kp5BgnWomJ7VswivLG0kSbHbK1687oMIYn9Rg/dcgu?=
 =?us-ascii?Q?NVbBZ5ROSKUer2+JG8EozWmGVv9WmOwLAWaUHpkJcp5Wa+/EJBij8O+QUNN5?=
 =?us-ascii?Q?a7NSzgISC8Gcxx8r5DOOZRkzslFmAGhPIGpN7TCrGqmkyNgx28E6A4PpLnHO?=
 =?us-ascii?Q?VZaSUIpaInVi7KXWIMIl31BBySo7vXfoafAznsB6xvfsWKWbAGrJsHmh4BCZ?=
 =?us-ascii?Q?cv00lelSAUgO2+BvaFKbNzDkxWG5Eb+D25gAjCFH2kaZyxUAYTCKWulnxvci?=
 =?us-ascii?Q?kbyOT2E6I49Wi1w4Nfx8bBM/0VJGSWDI8hv6LeKlmYFR2BUNc3hJO4OdRsWj?=
 =?us-ascii?Q?rA3RcHFg0AFpyKaOZ6WdcrXByrXfPMTHfa4vGCT3Mg/fnCEH8tn+EONxHE5a?=
 =?us-ascii?Q?ABxLAucarYP9oYgOtXfgHqEOCzei85UMnzIUy10FvkhT5K4CYNygHGD4hYJD?=
 =?us-ascii?Q?B4ifLAucZUaxc+kHv87wXIY/bqgYZ6uHR3L7C/tvufdUziqTZnS7GpUUUh0d?=
 =?us-ascii?Q?1V8u51U04plD22uQN5Huv7uFUmKg4zzdJYUst2kvuzvuVWvLfwj02gPVQPNB?=
 =?us-ascii?Q?BW6PmkU8gho7fnuFxmdQvzfMQlA6hh/l+LyR3Z4Bs/GZlaoLLPFUjGZFvAbb?=
 =?us-ascii?Q?qzGvQh9JFgqVQ6I65SEhi6ZrRg1Lfhp75N6hL5+CJ2uHll42iGVCqTYaJUI1?=
 =?us-ascii?Q?Uv2M+NOPDBruWUZMJ4udTkILHbMcVvez26EN6DVsXB9MNItPzuywj40MQwju?=
 =?us-ascii?Q?uLVz384y9Vfnpmgro8Sc6IRhFpaq+sRhnsAigfYouEX7NeL47a1TVtkf1CPZ?=
 =?us-ascii?Q?cFSJrFf95gfp1yI8+R+mBS40koJzAmj+0c1Rb26n0d04KAMGIqh3hfX0jwh5?=
 =?us-ascii?Q?2m1KBifb63b0T9cOJ5NMq5VtlC//COtcF4axY7OzYFaRKabElJHxdJ3C3o5H?=
 =?us-ascii?Q?1bTMVroh13yMMpsaPRRKn7s1JuBmIZJsVFbDT3TQLirC/9Cl/TKhyT6hO3pm?=
 =?us-ascii?Q?YHYfa8vzZ/bGqMwlTDBylZ/pcVVVOqoMjedW29vsgtzPa8+sFktdqPx/AAx3?=
 =?us-ascii?Q?DKzajC2qElWm87enNLr/q8x1XaO0p2F+NMuUutu7djHuDWEOJak+Maj/bHcN?=
 =?us-ascii?Q?QjbNGKuYDuL3LPVLSpq7Z2CzSanM17tjuViFeH6x8z8nekiIKR2LbswRA99m?=
 =?us-ascii?Q?LV9Q6O868SI4Kosp6ZDe935mkIdzf8+eCjMkmKQAlkprAM6Qo2OApfCqcJIc?=
 =?us-ascii?Q?87cPvDnkfbopCvnzosmZTqmQ6M2opalloTotxVAo4oE0Xodlf+eQpiIgQMe3?=
 =?us-ascii?Q?m0PpXHn07hIO3eOLI8rOQVvZUg98khcgZV+qehoLKDynU7qahAklJOsd6e6J?=
 =?us-ascii?Q?UMeLFXahJqpfCkC1xDMY6kxsBfjbKD8+F9chc6mc/JfTvwikzeDqY/6IKZE5?=
 =?us-ascii?Q?Y0NTnt8OvBMvAuSF53m2ikdefbwGWHQ1E0HidfrS87Aqr6mwrGIzhqF2HC+m?=
 =?us-ascii?Q?soUqw/cjbX1mJuIYpT4=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 15:30:33.5526
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8f31faa-d1a2-44eb-fb02-08de2849bf2e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000EE36.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF8F544CF46
X-Authority-Analysis: v=2.4 cv=OOEqHCaB c=1 sm=1 tr=0 ts=691f3425 cx=c_pps
 a=QMhPzt4RVFymwNJSNtbcTg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KJT-RnjOAAAA:8 a=w1d2syhTAAAA:8 a=QyXUC8HyAAAA:8
 a=JfUX2HHz7D_845OBrMAA:9 a=HE_01F9_QflCRFonrIQr:22
X-Proofpoint-GUID: tY9TicKgcfRfFqXF1BDdZ8PNCvkq17hU
X-Proofpoint-ORIG-GUID: tY9TicKgcfRfFqXF1BDdZ8PNCvkq17hU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDEwMiBTYWx0ZWRfX0fBuHedGlcdp
 5BV4OOSptfVA9x1+F5Yv1ORQ4+UZ1evLg+ud6pEmcoHED3eyPpSpy23FlimahZ+A4rvbnbjYloS
 2XLdVUy5+eIAst8BdpPh1QgK1A53t/4buOefmeqtlhnuYhIVTj9NYu71mqAKhAa8EBiW2cgiUen
 iTpJmIO7F3jSBePx5OslC6SCao0cqCSoP7ZjDXHGTXY+uW+CmViYFkSaux5ZxmwVuGOpPqh8ftQ
 Cj9GsxKNqVmRubjn6Nu4xCQDmiQQwG584VWFtHfdh77ZIiG9Evg6KYw3vSCZ17b8CSYp3k8jLBX
 flGC69I7Z0ryvTvBTr3yl7BL4M6tBskSJaIRdiu+LHZVmkCKMT9NA8pnEv/07kGL/WkTl3WUr0B
 Z2elkmMkWXZ2TlzAdNLyczSJNONLzw==
X-Proofpoint-Spam-Reason: safe

Add a driver to support the individual SDCA functions within the class
driver. Use the SDCA helpers to parse the DisCo information and register
a function driver based on those properties. Manage the boot of the
function, reset, FDL, defaults. Manage the function level register map.

Co-developed-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
Tested-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
Reviewed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Tested-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v3.

 sound/soc/sdca/Kconfig               |   7 +
 sound/soc/sdca/Makefile              |   2 +
 sound/soc/sdca/sdca_class_function.c | 460 +++++++++++++++++++++++++++
 3 files changed, 469 insertions(+)
 create mode 100644 sound/soc/sdca/sdca_class_function.c

diff --git a/sound/soc/sdca/Kconfig b/sound/soc/sdca/Kconfig
index cbce51be0ba93..3c6bf0e2c2f01 100644
--- a/sound/soc/sdca/Kconfig
+++ b/sound/soc/sdca/Kconfig
@@ -40,6 +40,7 @@ config SND_SOC_SDCA_OPTIONAL
 config SND_SOC_SDCA_CLASS
 	tristate "SDCA Class Driver"
 	depends on SND_SOC_SDCA
+	select SND_SOC_SDCA_CLASS_FUNCTION
 	select SND_SOC_SDCA_FDL
 	select SND_SOC_SDCA_HID
 	select SND_SOC_SDCA_IRQ
@@ -47,4 +48,10 @@ config SND_SOC_SDCA_CLASS
 	  This option enables support for the SDCA Class driver which should
 	  support any class compliant SDCA part.
 
+config SND_SOC_SDCA_CLASS_FUNCTION
+	tristate
+	help
+	  This option enables support for the SDCA Class Function drivers,
+	  these implement the individual functions of the SDCA Class driver.
+
 endmenu
diff --git a/sound/soc/sdca/Makefile b/sound/soc/sdca/Makefile
index 95db4cef34833..f6b73275d9649 100644
--- a/sound/soc/sdca/Makefile
+++ b/sound/soc/sdca/Makefile
@@ -7,7 +7,9 @@ snd-soc-sdca-$(CONFIG_SND_SOC_SDCA_IRQ) += sdca_interrupts.o
 snd-soc-sdca-$(CONFIG_SND_SOC_SDCA_FDL) += sdca_fdl.o
 
 snd-soc-sdca-class-y := sdca_class.o
+snd-soc-sdca-class-function-y := sdca_class_function.o
 
 obj-$(CONFIG_SND_SOC_SDCA) += snd-soc-sdca.o
 
 obj-$(CONFIG_SND_SOC_SDCA_CLASS) += snd-soc-sdca-class.o
+obj-$(CONFIG_SND_SOC_SDCA_CLASS_FUNCTION) += snd-soc-sdca-class-function.o
diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
new file mode 100644
index 0000000000000..0028482a1e752
--- /dev/null
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -0,0 +1,460 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (C) 2025 Cirrus Logic, Inc. and
+//                    Cirrus Logic International Semiconductor Ltd.
+
+/*
+ * The MIPI SDCA specification is available for public downloads at
+ * https://www.mipi.org/mipi-sdca-v1-0-download
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/minmax.h>
+#include <linux/module.h>
+#include <linux/pm.h>
+#include <linux/pm_runtime.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_registers.h>
+#include <sound/pcm.h>
+#include <sound/sdca_asoc.h>
+#include <sound/sdca_fdl.h>
+#include <sound/sdca_function.h>
+#include <sound/sdca_interrupts.h>
+#include <sound/sdca_regmap.h>
+#include <sound/sdw.h>
+#include <sound/soc-component.h>
+#include <sound/soc-dai.h>
+#include <sound/soc.h>
+#include "sdca_class.h"
+
+struct class_function_drv {
+	struct device *dev;
+	struct regmap *regmap;
+	struct sdca_class_drv *core;
+
+	struct sdca_function_data *function;
+};
+
+static void class_function_regmap_lock(void *data)
+{
+	struct mutex *lock = data;
+
+	mutex_lock(lock);
+}
+
+static void class_function_regmap_unlock(void *data)
+{
+	struct mutex *lock = data;
+
+	mutex_unlock(lock);
+}
+
+static bool class_function_regmap_writeable(struct device *dev, unsigned int reg)
+{
+	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
+	struct class_function_drv *drv = auxiliary_get_drvdata(auxdev);
+
+	return sdca_regmap_writeable(drv->function, reg);
+}
+
+static bool class_function_regmap_readable(struct device *dev, unsigned int reg)
+{
+	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
+	struct class_function_drv *drv = auxiliary_get_drvdata(auxdev);
+
+	return sdca_regmap_readable(drv->function, reg);
+}
+
+static bool class_function_regmap_volatile(struct device *dev, unsigned int reg)
+{
+	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
+	struct class_function_drv *drv = auxiliary_get_drvdata(auxdev);
+
+	return sdca_regmap_volatile(drv->function, reg);
+}
+
+static const struct regmap_config class_function_regmap_config = {
+	.name			= "sdca",
+	.reg_bits		= 32,
+	.val_bits		= 32,
+	.reg_format_endian	= REGMAP_ENDIAN_LITTLE,
+	.val_format_endian	= REGMAP_ENDIAN_LITTLE,
+
+	.max_register		= SDW_SDCA_MAX_REGISTER,
+	.readable_reg		= class_function_regmap_readable,
+	.writeable_reg		= class_function_regmap_writeable,
+	.volatile_reg		= class_function_regmap_volatile,
+
+	.cache_type		= REGCACHE_MAPLE,
+
+	.lock			= class_function_regmap_lock,
+	.unlock			= class_function_regmap_unlock,
+};
+
+static int class_function_regmap_mbq_size(struct device *dev, unsigned int reg)
+{
+	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
+	struct class_function_drv *drv = auxiliary_get_drvdata(auxdev);
+
+	return sdca_regmap_mbq_size(drv->function, reg);
+}
+
+static bool class_function_regmap_deferrable(struct device *dev, unsigned int reg)
+{
+	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
+	struct class_function_drv *drv = auxiliary_get_drvdata(auxdev);
+
+	return sdca_regmap_deferrable(drv->function, reg);
+}
+
+static const struct regmap_sdw_mbq_cfg class_function_mbq_config = {
+	.mbq_size		= class_function_regmap_mbq_size,
+	.deferrable		= class_function_regmap_deferrable,
+	.retry_us		= 1000,
+	.timeout_us		= 10000,
+};
+
+static int class_function_startup(struct snd_pcm_substream *substream,
+				  struct snd_soc_dai *dai)
+{
+	struct class_function_drv *drv = snd_soc_component_get_drvdata(dai->component);
+
+	return sdca_asoc_set_constraints(drv->dev, drv->regmap, drv->function,
+					 substream, dai);
+}
+
+static int class_function_sdw_add_peripheral(struct snd_pcm_substream *substream,
+					     struct snd_pcm_hw_params *params,
+					     struct snd_soc_dai *dai)
+{
+	struct class_function_drv *drv = snd_soc_component_get_drvdata(dai->component);
+	struct sdw_stream_runtime *sdw_stream = snd_soc_dai_get_dma_data(dai, substream);
+	struct sdw_slave *sdw = dev_to_sdw_dev(drv->dev->parent);
+	struct sdw_stream_config sconfig = {0};
+	struct sdw_port_config pconfig = {0};
+	int ret;
+
+	if (!sdw_stream)
+		return -EINVAL;
+
+	snd_sdw_params_to_config(substream, params, &sconfig, &pconfig);
+
+	/*
+	 * FIXME: As also noted in sdca_asoc_get_port(), currently only
+	 * a single unshared port is supported for each DAI.
+	 */
+	ret = sdca_asoc_get_port(drv->dev, drv->regmap, drv->function, dai);
+	if (ret < 0)
+		return ret;
+
+	pconfig.num = ret;
+
+	ret = sdw_stream_add_slave(sdw, &sconfig, &pconfig, 1, sdw_stream);
+	if (ret) {
+		dev_err(drv->dev, "failed to add sdw stream: %d\n", ret);
+		return ret;
+	}
+
+	return sdca_asoc_hw_params(drv->dev, drv->regmap, drv->function,
+				   substream, params, dai);
+}
+
+static int class_function_sdw_remove_peripheral(struct snd_pcm_substream *substream,
+						struct snd_soc_dai *dai)
+{
+	struct class_function_drv *drv = snd_soc_component_get_drvdata(dai->component);
+	struct sdw_stream_runtime *sdw_stream = snd_soc_dai_get_dma_data(dai, substream);
+	struct sdw_slave *sdw = dev_to_sdw_dev(drv->dev->parent);
+
+	if (!sdw_stream)
+		return -EINVAL;
+
+	return sdw_stream_remove_slave(sdw, sdw_stream);
+}
+
+static int class_function_sdw_set_stream(struct snd_soc_dai *dai, void *sdw_stream,
+					 int direction)
+{
+	snd_soc_dai_dma_data_set(dai, direction, sdw_stream);
+
+	return 0;
+}
+
+static const struct snd_soc_dai_ops class_function_sdw_ops = {
+	.startup	= class_function_startup,
+	.shutdown	= sdca_asoc_free_constraints,
+	.set_stream	= class_function_sdw_set_stream,
+	.hw_params	= class_function_sdw_add_peripheral,
+	.hw_free	= class_function_sdw_remove_peripheral,
+};
+
+static int class_function_component_probe(struct snd_soc_component *component)
+{
+	struct class_function_drv *drv = snd_soc_component_get_drvdata(component);
+	struct sdca_class_drv *core = drv->core;
+
+	return sdca_irq_populate(drv->function, component, core->irq_info);
+}
+
+static const struct snd_soc_component_driver class_function_component_drv = {
+	.probe			= class_function_component_probe,
+	.endianness		= 1,
+};
+
+static int class_function_boot(struct class_function_drv *drv)
+{
+	unsigned int reg = SDW_SDCA_CTL(drv->function->desc->adr,
+					SDCA_ENTITY_TYPE_ENTITY_0,
+					SDCA_CTL_ENTITY_0_FUNCTION_STATUS, 0);
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(drv->regmap, reg, &val);
+	if (ret < 0) {
+		dev_err(drv->dev, "failed to read function status: %d\n", ret);
+		return ret;
+	}
+
+	if (!(val & SDCA_CTL_ENTITY_0_FUNCTION_HAS_BEEN_RESET)) {
+		dev_dbg(drv->dev, "reset function device\n");
+
+		ret = sdca_reset_function(drv->dev, drv->function, drv->regmap);
+		if (ret)
+			return ret;
+	}
+
+	if (val & SDCA_CTL_ENTITY_0_FUNCTION_NEEDS_INITIALIZATION) {
+		dev_dbg(drv->dev, "write initialisation\n");
+
+		ret = sdca_regmap_write_init(drv->dev, drv->core->dev_regmap,
+					     drv->function);
+		if (ret)
+			return ret;
+
+		ret = regmap_write(drv->regmap, reg,
+				   SDCA_CTL_ENTITY_0_FUNCTION_NEEDS_INITIALIZATION);
+		if (ret < 0) {
+			dev_err(drv->dev,
+				"failed to clear function init status: %d\n",
+				ret);
+			return ret;
+		}
+	}
+
+	/* Start FDL process */
+	ret = sdca_irq_populate_early(drv->dev, drv->regmap, drv->function,
+				      drv->core->irq_info);
+	if (ret)
+		return ret;
+
+	ret = sdca_fdl_sync(drv->dev, drv->function, drv->core->irq_info);
+	if (ret)
+		return ret;
+
+	ret = sdca_regmap_write_defaults(drv->dev, drv->regmap, drv->function);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(drv->regmap, reg, 0xFF);
+	if (ret < 0) {
+		dev_err(drv->dev, "failed to clear function status: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int class_function_probe(struct auxiliary_device *auxdev,
+				const struct auxiliary_device_id *aux_dev_id)
+{
+	struct device *dev = &auxdev->dev;
+	struct sdca_class_drv *core = dev_get_drvdata(dev->parent);
+	struct sdca_device_data *data = &core->sdw->sdca_data;
+	struct sdca_function_desc *desc;
+	struct snd_soc_component_driver *cmp_drv;
+	struct snd_soc_dai_driver *dais;
+	struct class_function_drv *drv;
+	struct regmap_sdw_mbq_cfg *mbq_config;
+	struct regmap_config *config;
+	struct reg_default *defaults;
+	int ndefaults;
+	int num_dais;
+	int ret;
+	int i;
+
+	drv = devm_kzalloc(dev, sizeof(*drv), GFP_KERNEL);
+	if (!drv)
+		return -ENOMEM;
+
+	cmp_drv = devm_kmemdup(dev, &class_function_component_drv, sizeof(*cmp_drv),
+			       GFP_KERNEL);
+	if (!cmp_drv)
+		return -ENOMEM;
+
+	config = devm_kmemdup(dev, &class_function_regmap_config, sizeof(*config),
+			      GFP_KERNEL);
+	if (!config)
+		return -ENOMEM;
+
+	mbq_config = devm_kmemdup(dev, &class_function_mbq_config, sizeof(*mbq_config),
+				  GFP_KERNEL);
+	if (!mbq_config)
+		return -ENOMEM;
+
+	drv->dev = dev;
+	drv->core = core;
+
+	for (i = 0; i < data->num_functions; i++) {
+		desc = &data->function[i];
+
+		if (desc->type == aux_dev_id->driver_data)
+			break;
+	}
+	if (i == core->sdw->sdca_data.num_functions) {
+		dev_err(dev, "failed to locate function\n");
+		return -EINVAL;
+	}
+
+	drv->function = &core->functions[i];
+
+	ret = sdca_parse_function(dev, core->sdw, desc, drv->function);
+	if (ret)
+		return ret;
+
+	ndefaults = sdca_regmap_count_constants(dev, drv->function);
+	if (ndefaults < 0)
+		return ndefaults;
+
+	defaults = devm_kcalloc(dev, ndefaults, sizeof(*defaults), GFP_KERNEL);
+	if (!defaults)
+		return -ENOMEM;
+
+	ret = sdca_regmap_populate_constants(dev, drv->function, defaults);
+	if (ret < 0)
+		return ret;
+
+	regcache_sort_defaults(defaults, ndefaults);
+
+	auxiliary_set_drvdata(auxdev, drv);
+
+	config->reg_defaults = defaults;
+	config->num_reg_defaults = ndefaults;
+	config->lock_arg = &core->regmap_lock;
+
+	if (drv->function->busy_max_delay) {
+		mbq_config->timeout_us = drv->function->busy_max_delay;
+		mbq_config->retry_us = umax(drv->function->busy_max_delay / 10,
+					    mbq_config->retry_us);
+	}
+
+	drv->regmap = devm_regmap_init_sdw_mbq_cfg(dev, core->sdw, config, mbq_config);
+	if (IS_ERR(drv->regmap))
+		return dev_err_probe(dev, PTR_ERR(drv->regmap),
+				     "failed to create regmap");
+
+	ret = sdca_asoc_populate_component(dev, drv->function, cmp_drv,
+					   &dais, &num_dais,
+					   &class_function_sdw_ops);
+	if (ret)
+		return ret;
+
+	pm_runtime_set_autosuspend_delay(dev, 200);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_set_active(dev);
+	pm_runtime_get_noresume(dev);
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
+	ret = class_function_boot(drv);
+	if (ret)
+		return ret;
+
+	ret = devm_snd_soc_register_component(dev, cmp_drv, dais, num_dais);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register component\n");
+
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+
+	return 0;
+}
+
+static int class_function_runtime_suspend(struct device *dev)
+{
+	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
+	struct class_function_drv *drv = auxiliary_get_drvdata(auxdev);
+
+	/*
+	 * Whilst the driver doesn't power the chip down here, going into
+	 * runtime suspend means the driver can't be sure the bus won't
+	 * power down which would prevent communication with the device.
+	 */
+	regcache_cache_only(drv->regmap, true);
+
+	return 0;
+}
+
+static int class_function_runtime_resume(struct device *dev)
+{
+	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
+	struct class_function_drv *drv = auxiliary_get_drvdata(auxdev);
+	int ret;
+
+	regcache_mark_dirty(drv->regmap);
+	regcache_cache_only(drv->regmap, false);
+
+	ret = regcache_sync(drv->regmap);
+	if (ret) {
+		dev_err(drv->dev, "failed to restore register cache: %d\n", ret);
+		goto err;
+	}
+
+	return 0;
+
+err:
+	regcache_cache_only(drv->regmap, true);
+
+	return ret;
+}
+
+static const struct dev_pm_ops class_function_pm_ops = {
+	RUNTIME_PM_OPS(class_function_runtime_suspend,
+		       class_function_runtime_resume, NULL)
+};
+
+static const struct auxiliary_device_id class_function_id_table[] = {
+	{
+		.name = "snd_soc_sdca." SDCA_FUNCTION_TYPE_SMART_AMP_NAME,
+		.driver_data = SDCA_FUNCTION_TYPE_SMART_AMP,
+	},
+	{
+		.name = "snd_soc_sdca." SDCA_FUNCTION_TYPE_SMART_MIC_NAME,
+		.driver_data = SDCA_FUNCTION_TYPE_SMART_MIC,
+	},
+	{
+		.name = "snd_soc_sdca." SDCA_FUNCTION_TYPE_UAJ_NAME,
+		.driver_data = SDCA_FUNCTION_TYPE_UAJ,
+	},
+	{
+		.name = "snd_soc_sdca." SDCA_FUNCTION_TYPE_HID_NAME,
+		.driver_data = SDCA_FUNCTION_TYPE_HID,
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(auxiliary, class_function_id_table);
+
+static struct auxiliary_driver class_function_drv = {
+	.driver = {
+		.name		= "sdca_function",
+		.pm		= pm_ptr(&class_function_pm_ops),
+	},
+
+	.probe		= class_function_probe,
+	.id_table	= class_function_id_table
+};
+module_auxiliary_driver(class_function_drv);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("SDCA Class Function Driver");
+MODULE_IMPORT_NS("SND_SOC_SDCA");
-- 
2.47.3

