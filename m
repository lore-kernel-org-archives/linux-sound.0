Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2CF264F81
	for <linux-sound@vger.kernel.org>; Thu, 25 Sep 2025 13:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758807209; cv=fail; b=l6siuzvgD3iCcQcb+Bgk4AInQWv9EsDBcaLFYr5p8hAnwab7LRDtKBS9tobuok1J2QZN0hib2q/2Oxh6Xn7DykopLbO3qZMaGreNVZaYEZaeqOkqtTvnOdefCfgmt1qfORimiZ//9reqAjjBAVQdZ6UJuPnK7GmpXdjunTkwEAk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758807209; c=relaxed/simple;
	bh=keRxTkZVwDC6+q1xB0ul2E8UTwV7AahY/9TXWJbECY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=op74tSJsNXZZTmMk8XyvKecSzyZGf7nfEAzcmYg8erwn7S6pLuVefxctpOcLkvxWcLQKmNwuK7I7MWiq24PPa400K6H5XyMehaMgFS/8lcmmlXs7u2WWro+3khhhp03xagdZ9UaNKKClmsGbRSpkHbPNkWiR8jpwbm75T2Mbob0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=lpBrD8Z8; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=bDXaCsMi; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="lpBrD8Z8";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="bDXaCsMi"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58PAUKTC1392027;
	Thu, 25 Sep 2025 08:33:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=kALOHajsmdwsiRWrCHIIn3cwzx2kJEHdlX8ErU558ds=; b=
	lpBrD8Z8sWIUV7/Qo25DYAOtfaQm2MH9OWgG5p3MudC4/4MHePkOiejEECcxlRn8
	9se4/FzAy5hd/xPYAxXe9hN/PfCv+SpZC2YjaLLNXnw2ydVmDUqOlgoxOslKnv6Z
	UFWH/WeQUaBIz3tKGzdhAnDOC7hlhtJcvVmyRLZZP3NenGMRq2OzG3P/riQuZv1m
	KgOwVsEjbQp0qvZvex0ABOKW6IDVlXt5GHGvsv6pWp58fn7081neLorhAJpsIXqT
	IYT08VeE1hpwn+valM4i8KwUoJVY6sjV63nLpOseXo2YfxHt+t9j+xPORWbRk/5q
	O6FUrBwIWX35m0ax7pb7Gw==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021082.outbound.protection.outlook.com [52.101.52.82])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 49cjmdsery-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 25 Sep 2025 08:33:16 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=arfioBOvgGs5ngenPbRzdAE+rI+vYMBPtEZW/ClMC5i/Z/KQKRt8YCDqupYmXnbWDWO6tC7S7fUq/CD9+UBkO5EJVt0uWUAhSAWZeX9shhmi4mthn/zjpm/QvFLRnxeNpYAWVm/hjqEKnI2aNKNjX4YU0FiN2ddc6ZDx23VE34hvIB1luVc760rXzrAyU7mzBieyKvtzSxbQfKyYsdGgMW6I4XXBYpwf3F1KswQ68QCsvnucP9iNBO7oABuMWmn9zP9F1/HdLVnMVJrj0aE6g3LSn9X+xYbkiAS9k2mSrxquvDCNWgFZHVV2SeSs3MOO+Fue2XvVfjfcTyXzC3OT1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kALOHajsmdwsiRWrCHIIn3cwzx2kJEHdlX8ErU558ds=;
 b=qCMO93brr+OcndEql21/Ttng2li5Tn7I1D+puJtDfNikxP3OyX0jksfO6EhqbObxqArvxf9nSubYBgw0PCVoKM7kA0pNDSInJGGo0bCg4cN0U8kXIOQcFUy36TZP6j13S0kIKPET6b6QwIf3Ne+91Q2nR2+O4lwpVt8SJqbUWLOi2yEjEqpTHzYIGOwUFxcLurEN7ZjyGwNQecy3GuNOsbgFecl9BrnN51ik+QONc7JCyI2T3HpSWoIVAKJ3QtlU5eZDBa7AxXLMaodA6xr4dVO4QVcdpbDwrpHmHecsW1Aw6fM7Zabbnhe36BlJGZqag4oYVNWLtjL1joirMOyo9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kALOHajsmdwsiRWrCHIIn3cwzx2kJEHdlX8ErU558ds=;
 b=bDXaCsMio1sQCMgXv4dpQf269GJOxX9H9glL5ypPjjo1ysMZfF7Uj5JmYzwVUXZgl+sBQAvZO8iuNJ+zftYl5oWjKHiOl4jLxenmXp7xYTY06BLkFwcAmbaMAV8fbL4d8UeP67yVrIQd9pBLM2fFeyhqtAvcOE4D6LDsj51cQmY=
Received: from DM6PR12CA0027.namprd12.prod.outlook.com (2603:10b6:5:1c0::40)
 by DS3PR19MB9439.namprd19.prod.outlook.com (2603:10b6:8:2e3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Thu, 25 Sep
 2025 13:33:13 +0000
Received: from DS1PEPF0001708F.namprd03.prod.outlook.com
 (2603:10b6:5:1c0:cafe::b8) by DM6PR12CA0027.outlook.office365.com
 (2603:10b6:5:1c0::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.22 via Frontend Transport; Thu,
 25 Sep 2025 13:33:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS1PEPF0001708F.mail.protection.outlook.com (10.167.17.139) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.9
 via Frontend Transport; Thu, 25 Sep 2025 13:33:12 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D3C77406556;
	Thu, 25 Sep 2025 13:33:10 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C0197820258;
	Thu, 25 Sep 2025 13:33:10 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 4/4] ASoC: SDCA: Add basic SDCA function driver
Date: Thu, 25 Sep 2025 14:33:06 +0100
Message-ID: <20250925133306.502514-5-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250925133306.502514-1-ckeepax@opensource.cirrus.com>
References: <20250925133306.502514-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708F:EE_|DS3PR19MB9439:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 16f2bb1d-66ef-42dd-2933-08ddfc3812fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?55n125ss+DznP1V56E2FAcWmb9gD/f2m4p8rH5+zKoE9rJki2MY9/sxBvV8r?=
 =?us-ascii?Q?FrgptzMQXmC+QGIfd1FJhrINjMMGTeiuKF86vUO/1HXVrt22pIV10fI4QcD+?=
 =?us-ascii?Q?XVih6TOPW1kHPb1MhzK6iZoZPSSAv8pBQtw1nO6+VGh+X3iU4PgeRx/73MTg?=
 =?us-ascii?Q?R3YHgtRZTs5a6dkvA06DY1oqTiRXntzwJVFwXk9LVGPN47K1Q5QaG5jqpB9a?=
 =?us-ascii?Q?yHPBl7unEMvEHkpwDkat2QOxKRvOKMo/A8i6M/uuDMyYHNq00LgPJL2zvnYI?=
 =?us-ascii?Q?xdZ1vNjz151uiQnnmmMMgg8PtYDHi86PgIfkl/tb/yH4NB+eUxoOOB+OZk1Y?=
 =?us-ascii?Q?Gc5Re5m2umoj5W9Fg9/551U4lwmZ7Mu/tfAwmoeKb+JxECDfqlE/URavckLx?=
 =?us-ascii?Q?+nkCn91UOWaBLZagw2eQWPKESYdeyUZ5iiiT/HZ8Hp81SQbQnQZK71kyFoGP?=
 =?us-ascii?Q?wADyTTsBiQJy3Qbrl8W3WQvlV/Tg9UYIFU86PUWr8MUX8OtoANmNVOGB7+UJ?=
 =?us-ascii?Q?uSndHhj+q2LhRT9trmzPNjQ/HzMHR7UmHEQ8fVEPdjjLuxIFebbiYt6VoOiD?=
 =?us-ascii?Q?Xi0O2PjPwijm7xdEAMETWbxTwL5We2eKuEI0XTA35ZX2h3JVtHjRX2aRGFmN?=
 =?us-ascii?Q?7ua8zIgeGXpTTKYKRkJD7isqHIcvT+mrtd0vjxJRRiQ8tsc8ILAduGfcPkA+?=
 =?us-ascii?Q?H/Vcd+Y9Z7QqVa7T3DzReZa6RlFzYCsUsad3mJMNA8sHBseHF2yhG072Bi45?=
 =?us-ascii?Q?YEnYM5TRKdunjkhty1j9ZSxPzOQVG+u57No1COExUeHZ8LxjT3O2rzw0SR/8?=
 =?us-ascii?Q?YkHFByskamEe8w5gSLbZMk/iXPI9LFQN3G7/wlxtxuB4ZoFSdbdQRNWHfo7/?=
 =?us-ascii?Q?K2lnEgD3k4G6tLtwcxduhotdYk+bGvLz1QcWAWBO10Wic7lQepbrQ4sKU5L0?=
 =?us-ascii?Q?Azco5eDdCU5vF7nUaiM7xNQdtuDTG806NLW24Axow1YXJ0xdU4g4khxwX7P3?=
 =?us-ascii?Q?hdIW/K1n/5iJ3tcLid9A5zBs4Usai0aXsD2DOSjfe33VdLFBb+8vehjbT6T2?=
 =?us-ascii?Q?WPtC0SKNBeqylZ9Qk3HU8TGOQUo5fr66ftli1ul/ZjBiOHlD4o2NOQA2Gtus?=
 =?us-ascii?Q?PVsNNRzfhMAvLmxI+OEtt8RZp9/Bi34lkt8xTVw3WFMiwmvjtw3C4adwndj0?=
 =?us-ascii?Q?ZoEHAM+0Rcu08NV0HXH7AIbPp5Kzya9BwOYtlpt1Xbp7o5H3d2iuiIfPyAax?=
 =?us-ascii?Q?jAQlarmR5FpIkVFEqe7TlDKiNqMN/aZ5QiQQbuer8fhHAVKmv08PhuezH9q0?=
 =?us-ascii?Q?EBPyS6BmghJdDQqFN7Xb6jeK1tAZMxDz8qahH0eELznCM7peaTsZ1e5lrtLp?=
 =?us-ascii?Q?f3CUQQzdnFRCZkkj8usdcEKy/vSYn1w1UfhQyIYJAUUyMd0zpDQA1xeUbEe5?=
 =?us-ascii?Q?lumygVcWQb8vKtuN32a9WZvh0cL4WuoaBAAgOEEqoRU3P6O95OvSVOSATZ7z?=
 =?us-ascii?Q?NG9K9BfVnsr8dZWli4i+ldcLiX2z/SmI7j+N?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 13:33:12.0611
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16f2bb1d-66ef-42dd-2933-08ddfc3812fb
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS1PEPF0001708F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR19MB9439
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDEyNiBTYWx0ZWRfX6XT92ddjrO+m
 NF/Vli3gryz+t8l+hJgmBCycoxG0KuMuP/yQpXHc1+XqTyyj95GU++ec52b4MoGAJkr8Hcjfn2O
 r9c+Wn22mnTtEp/j4HcZddUfG66tpc29tungejy1RfmI5km7QVxBH3HpzDUWkQaa7CAOXG8q4Sg
 Sq7GXukz87wd5Zo3a8Ew1hx8T/rBqtO+g1OFdfDdqQ6NXb9IqZ/VijtKsOYUNF7CRjBOLi8m72u
 IvburcNl7akH6XypLKxpaxjohNxXZsv4gAQp8G4m7gJXoPOXR9MtKe3qoa/+Wh/FTPrOF5ZMKtu
 q41zgpCfiZBTULSVABHG7+x81/n/1DPwbgdvAwUqv6A1Nd50QIzw1UcGvw32ns=
X-Proofpoint-GUID: yzaV0RS8Fkx9kI_cYioeqWXu8il3-l9I
X-Proofpoint-ORIG-GUID: yzaV0RS8Fkx9kI_cYioeqWXu8il3-l9I
X-Authority-Analysis: v=2.4 cv=ap6yCTZV c=1 sm=1 tr=0 ts=68d5449c cx=c_pps
 a=+c9WoxDyotZMqfRYVVLQHg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=KJT-RnjOAAAA:8
 a=w1d2syhTAAAA:8 a=2y6yY1NnbQwaM8O9J4YA:9 a=HE_01F9_QflCRFonrIQr:22
X-Proofpoint-Spam-Reason: safe

Add a driver to support the individual SDCA functions within the class
driver.

Co-developed-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdca/Kconfig               |   7 +
 sound/soc/sdca/Makefile              |   2 +
 sound/soc/sdca/sdca_class_function.c | 459 +++++++++++++++++++++++++++
 3 files changed, 468 insertions(+)
 create mode 100644 sound/soc/sdca/sdca_class_function.c

diff --git a/sound/soc/sdca/Kconfig b/sound/soc/sdca/Kconfig
index 56e3ff8448762..0a37e94a60302 100644
--- a/sound/soc/sdca/Kconfig
+++ b/sound/soc/sdca/Kconfig
@@ -39,6 +39,7 @@ config SND_SOC_SDCA_OPTIONAL
 
 config SND_SOC_SDCA_CLASS
 	tristate "SDCA Class Driver"
+	select SND_SOC_SDCA_CLASS_FUNCTION
 	select SND_SOC_SDCA
 	select SND_SOC_SDCA_FDL
 	select SND_SOC_SDCA_HID
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
index 0000000000000..34adedbf2fb5a
--- /dev/null
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -0,0 +1,459 @@
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
+	dev_err(dev, "%s: %pfwP: probe completed\n", __func__, auxdev->dev.fwnode);
+
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+
+	return 0;
+}
+
+static int class_function_codec_runtime_suspend(struct device *dev)
+{
+	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
+	struct class_function_drv *drv = auxiliary_get_drvdata(auxdev);
+
+	/*
+	 * Whilst the driver doesn't power the chip down here, going into
+	 * runtime suspend lets the SoundWire bus power down, which means
+	 * the driver can't communicate with the device any more.
+	 */
+	regcache_cache_only(drv->regmap, true);
+
+	return 0;
+}
+
+static int class_function_codec_runtime_resume(struct device *dev)
+{
+	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
+	struct class_function_drv *drv = auxiliary_get_drvdata(auxdev);
+	int ret;
+
+	regcache_cache_only(drv->regmap, false);
+
+	regcache_mark_dirty(drv->regmap);
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
+	RUNTIME_PM_OPS(class_function_codec_runtime_suspend,
+		       class_function_codec_runtime_resume, NULL)
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

