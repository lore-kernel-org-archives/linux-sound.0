Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099B52DC761
	for <linux-sound@vger.kernel.org>; Fri, 12 Sep 2025 10:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757673333; cv=fail; b=uJVHq4dzruNUt11QAgeTfcqV4aJZqIINXpTpZhCpewaCux/hLw8Lc0ZP63p3ZUYEEE9e/2tH+Ufl7UsrAwZYx1ZRfxnU3joRuUEZcoMGBNcMoGxxcrZkPuKz4+jtShb7uX/BOPs3JCKLbqvgOFeinYNUr+sz5bcmdeli0vaf06o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757673333; c=relaxed/simple;
	bh=Ai85WAtOTj7Zid8s2a1ZPixdH67it5IwM/ziIPgu81Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WvSeK+Sy4nzjKLzn7sXHtY7bzpL6hyd8ylry2oUeERYG1h1Zdq1a5xKtH8xyuZr21PV0vlxEj2VYivxrMGnfbkY51MCeIYvgIdkxbzHnsE0UQJDRvqyO8oNE+KUmX+t5A2WTxvOJGrydlbwtkZpsHcPBeGIX08PComN6nZyzfjU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Y310/4MI; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=TqKhPodH; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Y310/4MI";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="TqKhPodH"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58C5wnsS3620852;
	Fri, 12 Sep 2025 05:35:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=mhHNbrTzEWMty84vShVcyqFyItQhieU4GYpAeaEwauE=; b=
	Y310/4MIXZDcEdG8dilZTijRpxPWVmudK7UjLAtmDl1hMH1SDPWhli7k15tSZgLy
	FCe+uVBf9wXpIOANIEfcWS2+NEEJf3tGyTlIfGCMORu5vxE/AYrsE4BfjNeXgTgt
	CQ0W2YyhIVuY8PIFdid8rXERNB9a4AQWt3aOHp/KlLH08UJ4pRh0QNkga5aMjbtp
	72eVNy5WxYQXIVXFpPzk+86zw5LldZ7XDPycinOEEXzW/6ODngXC2BG/mrVkhBoC
	cKTuAKcvXotvFLvBvSMquIyN3mSXUFkj8dQm5Q1GhyeI0b/bnkFQC5lsETWagfkg
	O8HgHnrllsgBAvVrJiozeA==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2114.outbound.protection.outlook.com [40.107.220.114])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 494due08yh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 05:35:18 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kWrOnZJQyF5tUEjcjCTlSqQ9HJmWZp3sb46+lpOf953BaPWZNpO9uVvXmdrR1ZC4Dd4owVdvbAQ3rHtBup9FJqJSCcvNVyjO463eHnUQMYOTFNmjRWp+4hFT1OlGji4jaJwA1IbOsSLp1isVfonC7oMd7UCoRkRp+koBgmTKSh2RgTEqfgVqrRjgLZrdwAw4pPM9tUabM9YujViJCIRZ1VilKEL5xbvrTVvNjbJiRFMj1Xd4UqfazeZ3eMow/5sJS8to5c0jdJ0suZP6SL6g2GkQPwm0b3by2g7Z3rAVw4RVo/st7dijjTUo6envNqARkkEQDcKFL4eJHJJksbn0xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mhHNbrTzEWMty84vShVcyqFyItQhieU4GYpAeaEwauE=;
 b=HanM2IKp834toYqXInkFkCA43B66gltC4L93zklRILyL4H/uqc1ndOjIlEAS/epcR2t+mE84qFDWAuiR59h3Nf5clss5CrTfgDovGP23wGUsYuOmTt5uowhn4Nd6yazjM9bPW5JxaNce2YSbr6Zeq956JLx9om+kbt9cKt9KXWUKz2nVcT41LcMc/wGGy2ueef4MFSvD3Y2mce7r3QIBeFOrVBMXYS+2d00C4KySKT7zFw4mYJrFFzPNuTFeDZYHevmRvBwo7pf+vTErTneppkLHgROmCKUoC6VLE8NdXn7+MJ1Lo0TCDwlDrDwD18N1vtihWy4TK5CapWYJqHMJgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mhHNbrTzEWMty84vShVcyqFyItQhieU4GYpAeaEwauE=;
 b=TqKhPodHmRHw8lH3gcTLgpU4sycAgZasBJaPn7EuwsjPHYuSKIgwu6xSSDwlHchUZra15/ycdfC9+CSAgLEWH1hgN6JBfNVdomuBfL0pedUysx8K0V7KkAZjWsBfZzhoNHrUgm9oRtchlrnAJ2t2+pFlZplHmn54Zh99bESAw5Y=
Received: from SJ0P220CA0002.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::10)
 by IA3PR19MB8616.namprd19.prod.outlook.com (2603:10b6:208:522::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 10:35:14 +0000
Received: from SJ5PEPF00000204.namprd05.prod.outlook.com
 (2603:10b6:a03:41b:cafe::8) by SJ0P220CA0002.outlook.office365.com
 (2603:10b6:a03:41b::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.17 via Frontend Transport; Fri,
 12 Sep 2025 10:35:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF00000204.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.13
 via Frontend Transport; Fri, 12 Sep 2025 10:35:13 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 41289406563;
	Fri, 12 Sep 2025 10:35:08 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 22773822548;
	Fri, 12 Sep 2025 10:35:08 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 12/19] ASoC: SDCA: Add UMP buffer helper functions
Date: Fri, 12 Sep 2025 11:34:57 +0100
Message-ID: <20250912103504.2679226-13-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250912103504.2679226-1-ckeepax@opensource.cirrus.com>
References: <20250912103504.2679226-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000204:EE_|IA3PR19MB8616:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 60d19d1a-a1ba-47fb-f2a2-08ddf1e80e82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|61400799027|82310400026|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?q43jtgw7ttnJ9lIE4OxYQAaHSOF5zG5xkDoV7x6BFmqQiv/sd2Y3JzrSQwGn?=
 =?us-ascii?Q?ELblV/Pej2eIiysntZLen2UjSXM5b6XoIX0tM6L8FSAYTve5HtTJZ5T4QRNr?=
 =?us-ascii?Q?mPFZDlX4VsfCh3irVL20FUnKX6uw+sJm6AHT1fjkMrFeMkAUc//fOhr+0Za2?=
 =?us-ascii?Q?tIMy3t5HkbG9IawYknIqq0DyzcdWVFkw2OTWobJrh89+F1ag8mT4UQlAI9z7?=
 =?us-ascii?Q?hahwZ/+KCNEbULb5Gyoq+LwBQwBmWPb6SsWHpQKHwdOvlJRGF8JcZDwArbe2?=
 =?us-ascii?Q?4xi4inQ61llQn/RWBHlBDg2gG2F1cULslUCNWy2LYUZQRPwEkVQSxXupDKrX?=
 =?us-ascii?Q?8yjPuB6n2LpEZ8Z2wj6UKOOOerHMfiJOCwdSfso5HlapTnP/WVCnAKc2xRVg?=
 =?us-ascii?Q?16iWoNWYCSz5xGo1bz9n2Uoc+TKbgbhOAtv2Pb3TUCX69nDPU58x+jTqm/+e?=
 =?us-ascii?Q?GmXtFv99yHwgGVvBZ7z01eFbnOtGB+l3p4yegK7tRR4CH265h4wkoSGqff8v?=
 =?us-ascii?Q?JhXRZYRjlTOKWUMvGtA3nYdufuLZfbSdLrhgq5fCGXqI3Fwl2BWvXdTlhpFZ?=
 =?us-ascii?Q?T8LjvTblpVAs0I095CfWfyMkK/grrEG/XQe0fOSiXlJYUlLz8qSgvKyZr92t?=
 =?us-ascii?Q?IUoFeToC9VN2e6Smccrt/6FrR4nsBCFtonxKmnFt/7V+cMumkp1jC7mXGIrF?=
 =?us-ascii?Q?ru8M/sioL22WpAu7tgr6Ny0X0JK1gnPMsRrc3W+JD5CecyKm+i4HoG7AYwxL?=
 =?us-ascii?Q?5cZWr+8cY6/s3/YyNxH2aWlTQWZswpAz6YmV+M42nTTEJPPmiyFo1ULKzzkj?=
 =?us-ascii?Q?IpAWqa5Uu5svVg8tx/V8vOKKV6crZqoSN6rL4DFx69KAYYr4wRM/kG42yv9Q?=
 =?us-ascii?Q?zf3dDiNiqgMxtLqIA1llrPqMHFGG/VQVYQhnNgXbRLmOX6JlNTvzYJ1fbJBP?=
 =?us-ascii?Q?jMKDIjkpD6dwcCfpUfTIsT4lr3qJ7y3rFbr+WvqHfijGvfev20ncJQ/SEh1l?=
 =?us-ascii?Q?v/Z/qnQ9oWrJdLiwXnuhB4agC6YDLIz1YIVLEb1N+wXNMbCB1fNV4jFqtHlm?=
 =?us-ascii?Q?GkXi6EoE2vm5G6LvsDFJyekNy4Aasa306lDVch3LMgPI2cSpvkU8QGtfvabZ?=
 =?us-ascii?Q?9Wacogh2ItXvoJE3VQrudlMCT6xJWjN03mr1JSvHnei62ioGAV0RVX4JR9Ce?=
 =?us-ascii?Q?tcETASqlT8R7+w8KvO1IpV3U7kTcJoDu8MCBhRZrCqLy6wqHF3yvvjrCDJU7?=
 =?us-ascii?Q?RUP30de2qJA6x7F7501lcmJ4A6wH4vug9Zbl5Fi8GWqIAtUZvvK79fcOa16x?=
 =?us-ascii?Q?vmXVbW7GSslr/kJErIICs2SL2hlS9MMIg85lO7hxShd1u5jzNw0dOru4vXYw?=
 =?us-ascii?Q?rVc9EPJnWKGqRXC/7LsEhYB6tFHfga9EV47WbSl4etOMcabHqb+mQUeuPOKP?=
 =?us-ascii?Q?jejiEh03aIRkLs7/IQax4CG2sjzpBfRHOp+jZ5W5gqYGw0R7lLBhHA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(82310400026)(376014)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 10:35:13.1399
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60d19d1a-a1ba-47fb-f2a2-08ddf1e80e82
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF00000204.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR19MB8616
X-Proofpoint-ORIG-GUID: SftVsHMOPKKnVdLxK0F0M7WJDWScm_t_
X-Authority-Analysis: v=2.4 cv=F9NXdrhN c=1 sm=1 tr=0 ts=68c3f767 cx=c_pps
 a=Y2uv1Dt6t1MA76GmTEdXEQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=KJT-RnjOAAAA:8
 a=w1d2syhTAAAA:8 a=QWniJiZs-oX1o9d3st4A:9 a=HE_01F9_QflCRFonrIQr:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEyMDA5OSBTYWx0ZWRfX4Kk2XOzMtbmy
 qA4bsaVChg1R3Uo36GkzUEzhR60TlCFvFetpEzfl6bm7egzXXZe1ND0DrlYQ0FczGhIwezVQXd4
 BG5D33XPdXbdrDJAOfgxTYX1c5XWr/yjdyXN5mW0einPpntQNwrmzMe9ImIccFBeMPX+VTR6ZfQ
 IkZSOO0uHq0ice0+9f1BeHzSo7Z30WpS9/GajuadK0iKwXxiztcX2NgfSjAx4zNsbm7IxJnCQD8
 CEd3PXA6L4SaSw/nhLiYb2020EyEjk67cXJmhosb1XC2Y2c7PAR93N1RYTxpwVgzFB2aOUW0LJm
 WCj0/6XE4vuv+T3prpml8F31aQH98EAmaVXL0E6yfOvy+ICYeXrcOUEtAubQG8=
X-Proofpoint-GUID: SftVsHMOPKKnVdLxK0F0M7WJDWScm_t_
X-Proofpoint-Spam-Reason: safe

Add helper functions for handling Universal Message Passing (UMP)
buffers on SDCA devices. These are generic mechanisms to pass blocks of
binary data between the host and the device, in both directions. They
are used for things like passing HID descriptors and the File Download
process.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v1.

 include/sound/sdca_function.h |  26 ++++
 include/sound/sdca_ump.h      |  45 +++++++
 sound/soc/sdca/Makefile       |   3 +-
 sound/soc/sdca/sdca_ump.c     | 247 ++++++++++++++++++++++++++++++++++
 4 files changed, 320 insertions(+), 1 deletion(-)
 create mode 100644 include/sound/sdca_ump.h
 create mode 100644 sound/soc/sdca/sdca_ump.c

diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index 2e988a30481c..6dd44a7a8a35 100644
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
index 000000000000..b2363199d19a
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
index 5e51760cb651..a1b24c95cd8c 100644
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
index 000000000000..5dcad2f7ea05
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

