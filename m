Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79012F5A20
	for <linux-sound@vger.kernel.org>; Thu, 25 Sep 2025 10:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758797663; cv=fail; b=pqpFVUhOmiqNINVFae4CA2IK0hMTYJyPzAlXuJuJN8A8DO5LpP/Pm7xIPxXHg9ghtjZRfBgGVvRiJR94tbTPX9VntuWPE2a2+d5l5MJNuZxUub2slkw/avlPJmfkOg9vBx95hebJ0wNWAmOGtq3+hIF4ymlG9P5hA0KZWbVcLFs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758797663; c=relaxed/simple;
	bh=8dyxcBxrwsRHVptWV55QVTLrZ87JJmZwnB1VulIE5rk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VExF3cOJxbU9DK77aJZCAhyMjSFc4Yki6jcDKyiqeKqVbCGP8A2lw4VkvOsm7wgOiskf7hQuPdXcCGBPI/VK2I0tPd9P20Bg0y+3TyQq09nXWWXXU/n/8NhYoMeVzha8ojSCZsYdt/riLnEGjmgFUpP4t1D4O0tiURU7TmR3Wdc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Qyp8nkC1; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=DTUzoBjd; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Qyp8nkC1";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="DTUzoBjd"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58PAN0u61391147;
	Thu, 25 Sep 2025 05:53:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=l8hJ3vdowEbKwCMC7qzTbX7Rx846bdCgzhLXOx1qyuA=; b=
	Qyp8nkC1KWMKpUoHkfkxVAQUankMY+a8KcTd3aKjza9zrw5idoMsP6fNPrKMuNuR
	Ymd3pnth+I91kW9lesR5VhbGfYnMmtiREXS3OxrmH0vaXbgTA54Siats3GDOw84m
	maz0m9EsZlkqOjKfQbvOYW6RJQn+NniZ1170cjHm0OM7jVPm19wuNhusSA18AExr
	MCzLSYotJBSNO5Sb/A/MLyunqO4tgp6BA11+UmeovFETpAYQfxlgEI8SgQ2BkDtb
	UHj5St7fiySKQeT7RDuZuKoGhslSoyCHqNp33NcY7uT8LVEN5Y1ZCApQIrcqPSwL
	EVFVdSywtdJCaZL4Fdcvrg==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020073.outbound.protection.outlook.com [52.101.46.73])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 49cjmds8x1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 25 Sep 2025 05:53:56 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QylmFhyfPV4cbG/o2Cbs6t+CIfzgdlmCCR4Z0lPjR3UlBTl4NgHijwH8xAo4o4a6O34lLA+fjC/OkFCZT0lyv2fIZr/b1Lz25ZpG6VsrQjom3kZdnJcMj40Eyh3JD8KXDvR25trnx9gbWjMfHsrNoW2fGwReD3bNRbdL6+gJxAkW6Heh1gYzAE8GqC9EzJbBPtiJ+TW3fnoN9ni+9ouDj9Y+DvNsT6JQNhycNFDIb4eA07PiLbarw++xNkiUEC/Yb0TewjfYGabCvGJKapGW3iHKJBg9ZQIN7ksl3ATJesQ0vQ+732z/VCI7FDMn5NNdH8o8Qwx3V6A8pJGCrG0qdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l8hJ3vdowEbKwCMC7qzTbX7Rx846bdCgzhLXOx1qyuA=;
 b=vdHp5karUvVgDb/w2gJ7gYNqRJyHh3IffOPWhFBpIW/DLNxVBfERl+wnfkooE9CpXLjHyY3juIbMixq8OedM+i9rmK6jRwQcjT8Y/73/lavXQXWLwhQbVdS/3v4CNX+2x02e9RcZzdC8v4ZS+opktRJcAASsuN5wSimwZrYIPvHlcdrezZJKgUdDW+LnjPjxumH/bX3qnv3QM3EpX67ZOCrddqgocRxkui5doJI8kvBXJGAwxIQErplpQxjULRBy9fWXnMjbdbizd78d6eGL+g1YHXTbCZ4BSguoCuBoHeTXYSooj1a/mS7TAOZqwXsj0CyPrH+NBYr5axwIfdxOjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l8hJ3vdowEbKwCMC7qzTbX7Rx846bdCgzhLXOx1qyuA=;
 b=DTUzoBjdutD/hX99JN0vEcx2M45eamf5AIq0hIN4so3BfDgSNb+j5c0140VlRE933pU93+rTRgVbzk+WPJiLmk4zXjnodqCqc7V96OCATxuWR8NREAnCqNaWQWYbigCEtkMRpYc6tJEkFy5TvHLjnI1CPqiQmW4KdbHqiYmArqo=
Received: from PH8PR22CA0004.namprd22.prod.outlook.com (2603:10b6:510:2d1::19)
 by PH7PR19MB5704.namprd19.prod.outlook.com (2603:10b6:510:1d0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Thu, 25 Sep
 2025 10:53:50 +0000
Received: from SN1PEPF0002BA4D.namprd03.prod.outlook.com
 (2603:10b6:510:2d1:cafe::a3) by PH8PR22CA0004.outlook.office365.com
 (2603:10b6:510:2d1::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.22 via Frontend Transport; Thu,
 25 Sep 2025 10:53:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF0002BA4D.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.9
 via Frontend Transport; Thu, 25 Sep 2025 10:53:50 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 90DC840657D;
	Thu, 25 Sep 2025 10:53:46 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 878FA820249;
	Thu, 25 Sep 2025 10:53:46 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 12/19] ASoC: SDCA: Add UMP buffer helper functions
Date: Thu, 25 Sep 2025 11:53:34 +0100
Message-ID: <20250925105341.194178-13-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250925105341.194178-1-ckeepax@opensource.cirrus.com>
References: <20250925105341.194178-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4D:EE_|PH7PR19MB5704:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 681b30d3-9288-431b-d3ee-08ddfc21cfb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZgkZRSyBJ62A6j7zrYKGbpCOPsZbW88IKjBwKfeLTSM4Wf6owd/G3QmP1CfO?=
 =?us-ascii?Q?oo5t8nElqi9cqdcUF1cnRge8ZVMB81K0drPQV0u6dJMk6ZJKlVgidf7Y1XkQ?=
 =?us-ascii?Q?iV56Sr9b6DC+PVOL8hbTxKVyyGl7+COnGE0rh8n68JQCiDweoiwmftw3tkxE?=
 =?us-ascii?Q?RsJPSc05nSAXBkxcF+Tr0x9a7ZwxeixtN5oMHoWhtQ4eKeLuc6LuE4NTi6X/?=
 =?us-ascii?Q?1j/W4gmsfFcm1Q1rThQfwAElZUHIMPxC779AxRLXvbhnDAJVOyjMg70ZZ5qZ?=
 =?us-ascii?Q?mrzwb9mxFganh7RrTR8t5AZWTYGB8eN1hxmYR57TIAGodHxc5WYdAiTvDif6?=
 =?us-ascii?Q?mg79jBfGBPBIeRnzyLVsLlKz7TnSD9waqzWWfe7rFgNVq8jFCTPu97q1eGuV?=
 =?us-ascii?Q?4AU+d6lYw+deU+MK/bOXaUA/FKFl9COvf/l5XI5Pm+i30SZEpfJ6F9QG/H9r?=
 =?us-ascii?Q?8uM3RKCQfKqhAu213lpKlx9p4HmaBYpzZJ9ld6JvAiVXFUq7ZEBxJk9QE/BK?=
 =?us-ascii?Q?qYO7cfDao+PSDKJ1xsaciYs0YAZAjmDvd0y/3XDptx9pT0kTSvG2eeUJ0loC?=
 =?us-ascii?Q?ZOtk1co1tMSAmEXS2SMkvzRPNzc9ALok2D38qFZrPyvojBiNxLunjgnEOov/?=
 =?us-ascii?Q?+Va2sOGGuTnHRPwY2jwuUcrJ5SUoZJroh6jhjKMX7MVt57d4Vg5dCz5PEkpv?=
 =?us-ascii?Q?wuuBPMMNPExaueFKxVxBveKloLWPt+pSY5qPdDp9HjWmJTyVFD4lAvgp1XSx?=
 =?us-ascii?Q?d3yf/P+SHl4vvEt2s7pTzejeF3sIC7ln8SmSQny7qRNbuYZtdUtRO1utDIi7?=
 =?us-ascii?Q?24BOF1gsYM2bkgnYnnqwku04Cglg2BAQmCz4opSix8SvZSAPZVVDrShimiuI?=
 =?us-ascii?Q?xOuQfTnlNJCdI6lFNdJRKRj55qgmhH8danZdjATCozdhtk4dep6BGZlGft9Q?=
 =?us-ascii?Q?fvtRDdGzC6Gig0mi0ScbRSWmlGfTZ/8RDdjjc/fHVoqHdeSMOQYk/NllxgtT?=
 =?us-ascii?Q?hJUz+Zp2v86hf0OE+MmDFpCdTCdmAY9bkqS7qAgMcWPNryaWgekurKIgbFkj?=
 =?us-ascii?Q?hg4+8RypQHnp1pk3GsChoioMEsLttVgJwhKetuWNHtFD3+ORG1EIInVdXSHp?=
 =?us-ascii?Q?yvq9MyjwbUTpPxeJ5n7VqovkXLENEsPCFHLrZlbcioaDgcNbnsQ2HjHDPwSD?=
 =?us-ascii?Q?gAGbGg7xRsukpKFdkH1Ek4eNFTRliPnLRchLz4CZjJ2CkZ7cwBJfo2ePnWEJ?=
 =?us-ascii?Q?bBdl83j8RRGX+SGRBTj3TYx1LZZyyJDdVI/ZsMc9pn1MGqaLLEVSGh1GBs5K?=
 =?us-ascii?Q?IWiA7JlS++e34W4KGE4CzAysvragB2pCDkpjO3exnmoELX11aL4imm2sgGYY?=
 =?us-ascii?Q?pcK+WFTEzNm+1gnjCKpARPUO4F4B10SnywCaucl+gO1PzOQCNH18b0tpXOWJ?=
 =?us-ascii?Q?28ehF1co+XSeDBM0LHQJQpq1d5+yIIZ/VNAqh+hBZrTP+ZblBQmvCA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700013)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 10:53:50.2661
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 681b30d3-9288-431b-d3ee-08ddfc21cfb5
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF0002BA4D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB5704
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDEwMiBTYWx0ZWRfX8R5AQmtZewif
 ErQnH0CM6EJBJv86O9+zPN17Yimwvs0hiZQILIhoLTCwP6RWvco6nv9k/gI4YwtUA/ikoF0m+PD
 fJi8G6gFy8d02Ol9ziBqDCfOKJpV3B/mtUWaioWPuDouzCYZvuhjDYE/DVDz5t2TfngjoJShUmI
 TXeaLObxwED3xZ1m+oMxxgOuadN6gdO96ho7s10vTQsLxu2ufkP/bPhSB0OMCWRDbmFQIW0klx0
 /g1YIJIvnPnziDWVWK0qb2tsyvxNsap1Gg0rR1cH/JUCHAdnaNVS9Db6OiU4W+xh/kDNVkZKz/+
 KdV6SMcOIOZZvFBMSGmbB1pUjB7KDLkk6EWXvzDuuP94idy9HfC9zdq3sEHiv4=
X-Proofpoint-GUID: Zt6O9rBKbTy7zOVZparbzkQKTsSuyKWH
X-Proofpoint-ORIG-GUID: Zt6O9rBKbTy7zOVZparbzkQKTsSuyKWH
X-Authority-Analysis: v=2.4 cv=ap6yCTZV c=1 sm=1 tr=0 ts=68d51f44 cx=c_pps
 a=NUMs+PEU/Pz2DPnLQvFO8g==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=KJT-RnjOAAAA:8
 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8 a=QWniJiZs-oX1o9d3st4A:9
 a=HE_01F9_QflCRFonrIQr:22
X-Proofpoint-Spam-Reason: safe

Add helper functions for handling Universal Message Passing (UMP)
buffers on SDCA devices. These are generic mechanisms to pass blocks of
binary data between the host and the device, in both directions. They
are used for things like passing HID descriptors and the File Download
process.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v2.

 include/sound/sdca_function.h |  26 ++++
 include/sound/sdca_ump.h      |  45 +++++++
 sound/soc/sdca/Makefile       |   3 +-
 sound/soc/sdca/sdca_ump.c     | 247 ++++++++++++++++++++++++++++++++++
 4 files changed, 320 insertions(+), 1 deletion(-)
 create mode 100644 include/sound/sdca_ump.h
 create mode 100644 sound/soc/sdca/sdca_ump.c

diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index 2e988a30481c7..6dd44a7a8a359 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -133,6 +133,32 @@ struct sdca_init_write {
 #define SDCA_CTL_TYPE_S(ent, sel) SDCA_CTL_TYPE(SDCA_ENTITY_TYPE_##ent, \
 						SDCA_CTL_##ent##_##sel)
 
+/**
+ * enum sdca_messageoffset_range - Column definitions UMP MessageOffset
+ */
+enum sdca_messageoffset_range {
+	SDCA_MESSAGEOFFSET_BUFFER_START_ADDRESS		= 0,
+	SDCA_MESSAGEOFFSET_BUFFER_LENGTH		= 1,
+	SDCA_MESSAGEOFFSET_UMP_MODE			= 2,
+	SDCA_MESSAGEOFFSET_NCOLS			= 3,
+};
+
+/**
+ * enum sdca_ump_mode - SDCA UMP Mode
+ */
+enum sdca_ump_mode {
+	SDCA_UMP_MODE_DIRECT				= 0x00,
+	SDCA_UMP_MODE_INDIRECT				= 0x01,
+};
+
+/**
+ * enum sdca_ump_owner - SDCA UMP Owner
+ */
+enum sdca_ump_owner {
+	SDCA_UMP_OWNER_HOST				= 0x00,
+	SDCA_UMP_OWNER_DEVICE				= 0x01,
+};
+
 /**
  * enum sdca_it_controls - SDCA Controls for Input Terminal
  *
diff --git a/include/sound/sdca_ump.h b/include/sound/sdca_ump.h
new file mode 100644
index 0000000000000..b2363199d19aa
--- /dev/null
+++ b/include/sound/sdca_ump.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * The MIPI SDCA specification is available for public downloads at
+ * https://www.mipi.org/mipi-sdca-v1-0-download
+ *
+ * Copyright (C) 2025 Cirrus Logic, Inc. and
+ *                    Cirrus Logic International Semiconductor Ltd.
+ */
+
+#ifndef __SDCA_UMP_H__
+#define __SDCA_UMP_H__
+
+struct regmap;
+struct sdca_control;
+struct sdca_entity;
+struct sdca_function_data;
+struct snd_soc_component;
+
+int sdca_ump_get_owner_host(struct device *dev,
+			    struct regmap *function_regmap,
+			    struct sdca_function_data *function,
+			    struct sdca_entity *entity,
+			    struct sdca_control *control);
+int sdca_ump_set_owner_device(struct device *dev,
+			      struct regmap *function_regmap,
+			      struct sdca_function_data *function,
+			      struct sdca_entity *entity,
+			      struct sdca_control *control);
+int sdca_ump_read_message(struct device *dev,
+			  struct regmap *device_regmap,
+			  struct regmap *function_regmap,
+			  struct sdca_function_data *function,
+			  struct sdca_entity *entity,
+			  unsigned int offset_sel, unsigned int length_sel,
+			  void **msg);
+int sdca_ump_write_message(struct device *dev,
+			   struct regmap *device_regmap,
+			   struct regmap *function_regmap,
+			   struct sdca_function_data *function,
+			   struct sdca_entity *entity,
+			   unsigned int offset_sel, unsigned int msg_offset,
+			   unsigned int length_sel,
+			   void *msg, int msg_len);
+
+#endif // __SDCA_UMP_H__
diff --git a/sound/soc/sdca/Makefile b/sound/soc/sdca/Makefile
index 5e51760cb6513..a1b24c95cd8c8 100644
--- a/sound/soc/sdca/Makefile
+++ b/sound/soc/sdca/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-snd-soc-sdca-y := sdca_functions.o sdca_device.o sdca_regmap.o sdca_asoc.o
+snd-soc-sdca-y := sdca_functions.o sdca_device.o sdca_regmap.o sdca_asoc.o \
+		  sdca_ump.o
 snd-soc-sdca-$(CONFIG_SND_SOC_SDCA_HID) += sdca_hid.o
 snd-soc-sdca-$(CONFIG_SND_SOC_SDCA_IRQ) += sdca_interrupts.o
 
diff --git a/sound/soc/sdca/sdca_ump.c b/sound/soc/sdca/sdca_ump.c
new file mode 100644
index 0000000000000..5dcad2f7ea05b
--- /dev/null
+++ b/sound/soc/sdca/sdca_ump.c
@@ -0,0 +1,247 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (C) 2025 Cirrus Logic, Inc. and
+//                    Cirrus Logic International Semiconductor Ltd.
+
+/*
+ * The MIPI SDCA specification is available for public downloads at
+ * https://www.mipi.org/mipi-sdca-v1-0-download
+ */
+
+#include <linux/dev_printk.h>
+#include <linux/device.h>
+#include <linux/regmap.h>
+#include <sound/sdca.h>
+#include <sound/sdca_function.h>
+#include <sound/sdca_ump.h>
+#include <sound/soc-component.h>
+#include <linux/soundwire/sdw_registers.h>
+
+/**
+ * sdca_ump_get_owner_host - check a UMP buffer is owned by the host
+ * @dev: Pointer to the struct device used for error messages.
+ * @function_regmap: Pointer to the regmap for the SDCA Function.
+ * @function: Pointer to the Function information.
+ * @entity: Pointer to the SDCA Entity.
+ * @control: Pointer to the SDCA Control for the UMP Owner.
+ *
+ * Return: Returns zero on success, and a negative error code on failure.
+ */
+int sdca_ump_get_owner_host(struct device *dev,
+			    struct regmap *function_regmap,
+			    struct sdca_function_data *function,
+			    struct sdca_entity *entity,
+			    struct sdca_control *control)
+{
+	unsigned int reg, owner;
+	int ret;
+
+	reg = SDW_SDCA_CTL(function->desc->adr, entity->id, control->sel, 0);
+	ret = regmap_read(function_regmap, reg, &owner);
+	if (ret < 0) {
+		dev_err(dev, "%s: failed to read UMP owner: %d\n",
+			entity->label, ret);
+		return ret;
+	}
+
+	if (owner != SDCA_UMP_OWNER_HOST) {
+		dev_err(dev, "%s: host is not the UMP owner\n", entity->label);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(sdca_ump_get_owner_host, "SND_SOC_SDCA");
+
+/**
+ * sdca_ump_set_owner_device - set a UMP buffer's ownership back to the device
+ * @dev: Pointer to the struct device used for error messages.
+ * @function_regmap: Pointer to the regmap for the SDCA Function.
+ * @function: Pointer to the Function information.
+ * @entity: Pointer to the SDCA Entity.
+ * @control: Pointer to the SDCA Control for the UMP Owner.
+ *
+ * Return: Returns zero on success, and a negative error code on failure.
+ */
+int sdca_ump_set_owner_device(struct device *dev,
+			      struct regmap *function_regmap,
+			      struct sdca_function_data *function,
+			      struct sdca_entity *entity,
+			      struct sdca_control *control)
+{
+	unsigned int reg;
+	int ret;
+
+	reg = SDW_SDCA_CTL(function->desc->adr, entity->id, control->sel, 0);
+	ret = regmap_write(function_regmap, reg, SDCA_UMP_OWNER_DEVICE);
+	if (ret < 0)
+		dev_err(dev, "%s: failed to write UMP owner: %d\n",
+			entity->label, ret);
+
+	return ret;
+}
+EXPORT_SYMBOL_NS_GPL(sdca_ump_set_owner_device, "SND_SOC_SDCA");
+
+/**
+ * sdca_ump_read_message - read a UMP message from the device
+ * @dev: Pointer to the struct device used for error messages.
+ * @device_regmap: Pointer to the Device register map.
+ * @function_regmap: Pointer to the regmap for the SDCA Function.
+ * @function: Pointer to the Function information.
+ * @entity: Pointer to the SDCA Entity.
+ * @offset_sel: Control Selector for the UMP Offset Control.
+ * @length_sel: Control Selector for the UMP Length Control.
+ * @msg: Pointer that will be populated with an dynamically buffer
+ * containing the UMP message. Note this needs to be freed by the
+ * caller.
+ *
+ * The caller should first call sdca_ump_get_owner_host() to ensure the host
+ * currently owns the UMP buffer, and then this function can be used to
+ * retrieve a message. It is the callers responsibility to free the
+ * message once it is finished with it. Finally sdca_ump_set_owner_device()
+ * should be called to return the buffer to the device.
+ *
+ * Return: Returns the message length on success, and a negative error
+ * code on failure.
+ */
+int sdca_ump_read_message(struct device *dev,
+			  struct regmap *device_regmap,
+			  struct regmap *function_regmap,
+			  struct sdca_function_data *function,
+			  struct sdca_entity *entity,
+			  unsigned int offset_sel, unsigned int length_sel,
+			  void **msg)
+{
+	struct sdca_control_range *range;
+	unsigned int msg_offset, msg_len;
+	unsigned int buf_addr, buf_len;
+	unsigned int reg;
+	int ret;
+
+	reg = SDW_SDCA_CTL(function->desc->adr, entity->id, offset_sel, 0);
+	ret = regmap_read(function_regmap, reg, &msg_offset);
+	if (ret < 0) {
+		dev_err(dev, "%s: failed to read UMP offset: %d\n",
+			entity->label, ret);
+		return ret;
+	}
+
+	range = sdca_selector_find_range(dev, entity, offset_sel,
+					 SDCA_MESSAGEOFFSET_NCOLS, 1);
+	if (!range)
+		return -ENOENT;
+
+	buf_addr = sdca_range(range, SDCA_MESSAGEOFFSET_BUFFER_START_ADDRESS, 0);
+	buf_len = sdca_range(range, SDCA_MESSAGEOFFSET_BUFFER_LENGTH, 0);
+
+	reg = SDW_SDCA_CTL(function->desc->adr, entity->id, length_sel, 0);
+	ret = regmap_read(function_regmap, reg, &msg_len);
+	if (ret < 0) {
+		dev_err(dev, "%s: failed to read UMP length: %d\n",
+			entity->label, ret);
+		return ret;
+	}
+
+	if (msg_len > buf_len - msg_offset) {
+		dev_err(dev, "%s: message too big for UMP buffer: %d\n",
+			entity->label, msg_len);
+		return -EINVAL;
+	}
+
+	*msg = kmalloc(msg_len, GFP_KERNEL);
+	if (!*msg)
+		return -ENOMEM;
+
+	ret = regmap_raw_read(device_regmap, buf_addr + msg_offset, *msg, msg_len);
+	if (ret < 0) {
+		dev_err(dev, "%s: failed to read UMP message: %d\n",
+			entity->label, ret);
+		return ret;
+	}
+
+	return msg_len;
+}
+EXPORT_SYMBOL_NS_GPL(sdca_ump_read_message, "SND_SOC_SDCA");
+
+/**
+ * sdca_ump_write_message - write a UMP message to the device
+ * @dev: Pointer to the struct device used for error messages.
+ * @device_regmap: Pointer to the Device register map.
+ * @function_regmap: Pointer to the regmap for the SDCA Function.
+ * @function: Pointer to the Function information.
+ * @entity: Pointer to the SDCA Entity.
+ * @offset_sel: Control Selector for the UMP Offset Control.
+ * @msg_offset: Offset within the UMP buffer at which the message should
+ * be written.
+ * @length_sel: Control Selector for the UMP Length Control.
+ * @msg: Pointer to the data that should be written to the UMP buffer.
+ * @msg_len: Length of the message data in bytes.
+ *
+ * The caller should first call sdca_ump_get_owner_host() to ensure the host
+ * currently owns the UMP buffer, and then this function can be used to
+ * write a message. Finally sdca_ump_set_owner_device() should be called to
+ * return the buffer to the device, allowing the device to access the
+ * message.
+ *
+ * Return: Returns zero on success, and a negative error code on failure.
+ */
+int sdca_ump_write_message(struct device *dev,
+			   struct regmap *device_regmap,
+			   struct regmap *function_regmap,
+			   struct sdca_function_data *function,
+			   struct sdca_entity *entity,
+			   unsigned int offset_sel, unsigned int msg_offset,
+			   unsigned int length_sel,
+			   void *msg, int msg_len)
+{
+	struct sdca_control_range *range;
+	unsigned int buf_addr, buf_len, ump_mode;
+	unsigned int reg;
+	int ret;
+
+	range = sdca_selector_find_range(dev, entity, offset_sel,
+					 SDCA_MESSAGEOFFSET_NCOLS, 1);
+	if (!range)
+		return -ENOENT;
+
+	buf_addr = sdca_range(range, SDCA_MESSAGEOFFSET_BUFFER_START_ADDRESS, 0);
+	buf_len = sdca_range(range, SDCA_MESSAGEOFFSET_BUFFER_LENGTH, 0);
+	ump_mode = sdca_range(range, SDCA_MESSAGEOFFSET_UMP_MODE, 0);
+
+	if (msg_len > buf_len - msg_offset) {
+		dev_err(dev, "%s: message too big for UMP buffer: %d\n",
+			entity->label, msg_len);
+		return -EINVAL;
+	}
+
+	if (ump_mode != SDCA_UMP_MODE_DIRECT) {
+		dev_err(dev, "%s: only direct mode currently supported\n",
+			entity->label);
+		return -EINVAL;
+	}
+
+	ret = regmap_raw_write(device_regmap, buf_addr + msg_offset, msg, msg_len);
+	if (ret) {
+		dev_err(dev, "%s: failed to write UMP message: %d\n",
+			entity->label, ret);
+		return ret;
+	}
+
+	reg = SDW_SDCA_CTL(function->desc->adr, entity->id, offset_sel, 0);
+	ret = regmap_write(function_regmap, reg, msg_offset);
+	if (ret < 0) {
+		dev_err(dev, "%s: failed to write UMP offset: %d\n",
+			entity->label, ret);
+		return ret;
+	}
+
+	reg = SDW_SDCA_CTL(function->desc->adr, entity->id, length_sel, 0);
+	ret = regmap_write(function_regmap, reg, msg_len);
+	if (ret < 0) {
+		dev_err(dev, "%s: failed to write UMP length: %d\n",
+			entity->label, ret);
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(sdca_ump_write_message, "SND_SOC_SDCA");
-- 
2.47.3

