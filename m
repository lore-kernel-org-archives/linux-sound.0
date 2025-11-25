Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA6727F749
	for <linux-sound@vger.kernel.org>; Tue, 25 Nov 2025 15:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764084120; cv=fail; b=tmCy46LTnzLykrhM0a0iO2hUcVLlP+eUBt0oPMsb3DysVXaRkv4iDJdrfrNlnivhvL80OZYU9CNrFgdrYeSH32dyAigaCuLe8LQtgiqk2QCDiHBM1k8BXsUvD+3utWEuPihbRXVg6eL/OJeC1BZJ2jAuo7ik51FJYMSJHqJZI2I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764084120; c=relaxed/simple;
	bh=vpO6+IiafFjUeM9ymroWA0RSTlpd4/mo7QpSY0Jdq00=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tJfDeSPbFATOhOK4NUEtX9f8ZpgF/A8NT2DIvjWZ4KHArW201k2h6m8Z8msZ8nlX1hzhgBUHjWoQxfKXD1DDtJeQI8xs9hFl9vVlcIjj73mspAk9p0LlXeo9XYPTU6gPINmYVVVxplkmkgJCbDWEENJieM2b6XTUQRLx6QoJN68=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=KzwNCIGP; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=M8u1qH/a; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="KzwNCIGP";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="M8u1qH/a"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APCJjDT4074483;
	Tue, 25 Nov 2025 09:21:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=PB7lw+3aYEO16ctz1TgCRfkEBgF/PhS1cll5U6BuzA8=; b=
	KzwNCIGP/RwqgDxupHwZsreABEj+svkU7gC5od42EM8f1N8tiiCsrxKMxXDXfbLd
	/YMvAwjCAkAJL5vnCSdSNlwKeEXsX4m13LuafFYHw7UCt6wyP+URPHeD3C2Y+z+m
	XxNtahTwWFMPfI4XLIZpEjK6I3hd4CyZ+N+lwNHv7Wrt601TwhJH1v79uA8OPvLb
	TRpIMJ+JpUz9KECweA19ZjsRLUJPnHug+bkaDuf1FWdRBLk0qvU25OPMaB9CnrxK
	GFjM2baUNJ9QZNxRIP5wd9z9kBu9eVrygVi5EjhVAmiOsNNHXPtmB644OYtp1Q3v
	faDavzhMOm7iPbO37wMOCg==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023139.outbound.protection.outlook.com [40.93.196.139])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4akbf1b5su-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 25 Nov 2025 09:21:37 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wdz9Oapvc8ODwCK4GYA8LFC2GjFSouo3NunDy80SuwL32/WQPWxs6oqiZ+TJGQKX/I+ZkHiIyjwKzWcnv4wXXWYa/efgbFchn6t2WBpkUfQUOIJGTzQ/NdenoDZGCdPtq0gYuyIqOuQZxHd6i64SJNVEdZUlOQN6I6rzEKZ4FDQMPwSVFrULeYQ15tPSH8KJtJOUr/RKqEeMVxOEOV0pI37UxmJII6qz8B5mxOR+2oTd22kteisV5SYH2WVIkTPdzccpaO2IaaJmqTaY3assYjwXZtbzvNRwNYGApjBxYDxCtUSd2BtSPD88t3621ZYA4yndDdVpXA4GJDhKfe0/hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PB7lw+3aYEO16ctz1TgCRfkEBgF/PhS1cll5U6BuzA8=;
 b=bU8ibqglyLHQzOavDm4OsGy4c9+QBCGkQapGefldp0sg72ZbCxm6As+KcLj4VuWeCq9xoVa7H5V6EP4qSnR4Iik0ivca5niP70PjGJ3kbq53rCWzxbNlKvJBpt8nhzaEoR/zdh8tLbqzvTYPHelIsK2/5mDFKpT86ZQzGuPNnDV0S3U8A8U9zOh34CnxEs6wo1rTZp+BqKFuq0kXTCFE4jL2tEfym9JOy5TosfJlOkFwXsWC0cMgkB5LcRyvMhc3TvEX8agWeAEsIAXkIRtWeFs2Yfl31ksm3ZokIDndzazhzAruUwc0Cm/RRPLz5y0Zy+EPJ+LzjJQpGxwiS6cmGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PB7lw+3aYEO16ctz1TgCRfkEBgF/PhS1cll5U6BuzA8=;
 b=M8u1qH/aGRCuUWedsbQrM5JoTD0XYh//5aYlPYOWZSt0zv5wlmxp2B0u/P5gmRdNT2G63TI0XQplWCllVdd6gh03z0iUsPSP4q22jptHLE+fT37mtHxxCQ43aIEDlhz7T4SzIhXCXuJ15unwKIhkrbflbmatS7LbayfO9s/GN6A=
Received: from SA0PR11CA0013.namprd11.prod.outlook.com (2603:10b6:806:d3::18)
 by SA0PR19MB4572.namprd19.prod.outlook.com (2603:10b6:806:b9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Tue, 25 Nov
 2025 15:21:34 +0000
Received: from SA2PEPF000015CC.namprd03.prod.outlook.com
 (2603:10b6:806:d3:cafe::70) by SA0PR11CA0013.outlook.office365.com
 (2603:10b6:806:d3::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.11 via Frontend Transport; Tue,
 25 Nov 2025 15:21:31 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF000015CC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.7
 via Frontend Transport; Tue, 25 Nov 2025 15:21:33 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 75866406543;
	Tue, 25 Nov 2025 15:21:32 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 5BB38820273;
	Tue, 25 Nov 2025 15:21:32 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        vkoul@kernel.org, lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 1/7] ASoC: SDCA: Factor out jack handling into new c file
Date: Tue, 25 Nov 2025 15:21:22 +0000
Message-ID: <20251125152128.274808-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251125152128.274808-1-ckeepax@opensource.cirrus.com>
References: <20251125152128.274808-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CC:EE_|SA0PR19MB4572:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1db62599-43c8-4644-c077-08de2c365176
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|61400799027|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JqB/xzjIWpyAnNFIn5pJ5lnXAmIYh9lXOMViioDYtSwlZuYAY+iKjYx8sZM+?=
 =?us-ascii?Q?3NZFnMR9nkJ41y6+Qvad3i1S0eKqhVu+tlOA6ZMnLYI7MdVzdbt2ojmEt5cH?=
 =?us-ascii?Q?NCTTayGm6htf1YpMSjRIYsN1gTACxIMArDzDMtJTCmYPn1Fk+q+JfnytrQ7k?=
 =?us-ascii?Q?biyjsvBhHptPvIv61SH1jXQwXuKeAwIBeHginxuCNg+U6MmUUPWahVCX++Xn?=
 =?us-ascii?Q?SI0o66wuCz3tI1blzO5fFAOQT/tnvaehz5CKvk+viyk2oJyJ+KKAOcsqtedf?=
 =?us-ascii?Q?D+l/EmVyAFUnjVQ9ejgwJ6MifH8oU8PtISrJVUZTAxUmSwv7pXqmsZpa/a5K?=
 =?us-ascii?Q?+z/AG/J0MQmoM05b1V7sJXAJF/v9F6gIZ/UZNAF8bVJmi1GVui4fG90LdqtA?=
 =?us-ascii?Q?k/+Jp1nymU3Dg2JAiA+IXxq6Akky1YgrmiT4yLpwLyGmLG7lDwrb4dbdp30o?=
 =?us-ascii?Q?lKgmmwu19gBk8/2xLzezEbmOHSuXjxVLIikowXqGXSjCLhgfPZuA3y01CHem?=
 =?us-ascii?Q?u11t7OnyTGoumitkW54kHgeqqhB7zQO/zZH1oZrNgWYhGb4O/8OXWvzYo94e?=
 =?us-ascii?Q?VdkgmhZlaKje4vaRbPIRAFUYec4E6oG9ncVhaBSBVAdixqGWLPKRpf8bX768?=
 =?us-ascii?Q?qoKcC7KpKMCgyWC0gRoa7aXxRwelIRpZkxp0h6tz0JOvjSY26J2wMXOv1EuJ?=
 =?us-ascii?Q?q2UDtzO3o4+7Qv3AYujcS4LsIzbSxM/xbDZ6MjF1/ycUBKgHlk8djTAgZUh8?=
 =?us-ascii?Q?jg5brzgBBoZtouptzPsUTXJ4lsL89ptLZOeLImGFuNmGB1OiOl6XlgEtpdb9?=
 =?us-ascii?Q?pvFbvRDR1YELwKnYiUfvAmdt7RvQ3qe+8a810N/72eC/gmxBLK2r2xRfUGyW?=
 =?us-ascii?Q?61sZ2r9ErnPlvqvf+QyPRtIxC4S3BenDuF4C3SoPECQoERfsnCFnXAcwu4/X?=
 =?us-ascii?Q?JVEMyn4OlayPz0Mv2gaL1nBf/TruO+3HAUxAjwubZiLlqffUU3q+tTMnfMCS?=
 =?us-ascii?Q?uuJNvd6d8D5IwfWiyqxJzwjED279Lx6nFDODf9QOShBJXygT14kBPAnreFj2?=
 =?us-ascii?Q?Dm999gF+2SxjpPQbqqoBEIHWAvDibIL3ZkXTvZK04JQ/zjgIzbIZyhJysiq7?=
 =?us-ascii?Q?IslxqmQLGGEBCioCbAcF2/Xqdnn0NLsmew2q9zBb5vefHbNtiO/GKLlOX+zV?=
 =?us-ascii?Q?7CMZmGv2U3uYyvRopOQm7sRjhRX/5/Ldok4kjv3Kva5p+o/DKXRJkPl6SWzb?=
 =?us-ascii?Q?egkhaAwSx9x2H8/eYHNfKkQsmrKcpXSqY1m3dVLdPakM9rZ7tuh4hsF9tMqq?=
 =?us-ascii?Q?C9PH6J3d7MH9on7QQTuH7x5WaQZBklMuj8d9kTjcHV2rXiJR9YUo5Lk+1Rr1?=
 =?us-ascii?Q?Za6uLplVnXKfb99tICCy5HG/39NeVaqarlbFhUr8TSEVR7PBkUznBp6QaaKZ?=
 =?us-ascii?Q?FHMTjpCN+YS8PzWrTtUMcDqkpIqpbMn1gbGPogXWQMH0Vq655AYt5EZoXnUe?=
 =?us-ascii?Q?LDYxgQCrCs7LrCqxJnZ5/ejPumAZbCzu37wTfLSxRXrTxQuwV44UsYKMLMaQ?=
 =?us-ascii?Q?NY+3pz1G2r4tytJxOv8=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(61400799027)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 15:21:33.7011
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1db62599-43c8-4644-c077-08de2c365176
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF000015CC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR19MB4572
X-Authority-Analysis: v=2.4 cv=caHfb3DM c=1 sm=1 tr=0 ts=6925c981 cx=c_pps
 a=Bf9D2RbFEixf9qU3mYXllg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KJT-RnjOAAAA:8 a=w1d2syhTAAAA:8
 a=E_qsNW-z644fjflaSDkA:9 a=HE_01F9_QflCRFonrIQr:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDEyNyBTYWx0ZWRfXzWh1yCiYJUKz
 gnHuWIka15plcje+nJ6U4U1Ad4d9YA2ZzSuRkfogB7lRxVI3UO3ydQMF0wr59Ept2SHtEKB5neH
 zhtjCxIiF3Unh0tMakbpINc7IwlTydJ3RUki7d9cucKZ/5QT71KRyrOOaRFAOoXmIdr3btTYbTq
 5ut6prv4zYo/eGT/nBpi4XsFMWeO5saiHHy1oDnYDfLzgL3LHg65wOaCW9zmm8vPHOa8e04PmHO
 jZjQrl7PlcOuYy18tk9DmasRxmBVKw+Wbq76UIBiY3yC3FAbWzaKPTYIBotZSJ2cs3iQ44xOoGn
 NWsAue813yEBzd/YcTqrTfjyrvjW78AurfioLFK1/oB8lAA0jkmRwchgQ7nV43Ox2RgNRFH5d5B
 +tDYj0e9xKOj0MiEvXikiBnc3KOYXQ==
X-Proofpoint-GUID: ePC0DAgk-V0pGmKsrIdoeLCd-vPsR8Zg
X-Proofpoint-ORIG-GUID: ePC0DAgk-V0pGmKsrIdoeLCd-vPsR8Zg
X-Proofpoint-Spam-Reason: safe

The jack code is perhaps a bit large for being in the interrupt
code directly. Improve the encapsulation by factoring out the
jack handling code into a new c file, as is already done for HID
and FDL. Whilst doing so also add a jack_state structure to hold
the jack state for improved expandability in the future.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/sdca_jack.h        |  27 ++++++
 sound/soc/sdca/Makefile          |   2 +-
 sound/soc/sdca/sdca_interrupts.c |  83 ++----------------
 sound/soc/sdca/sdca_jack.c       | 140 +++++++++++++++++++++++++++++++
 4 files changed, 175 insertions(+), 77 deletions(-)
 create mode 100644 include/sound/sdca_jack.h
 create mode 100644 sound/soc/sdca/sdca_jack.c

diff --git a/include/sound/sdca_jack.h b/include/sound/sdca_jack.h
new file mode 100644
index 0000000000000..9fad5f22cbb9e
--- /dev/null
+++ b/include/sound/sdca_jack.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * The MIPI SDCA specification is available for public downloads at
+ * https://www.mipi.org/mipi-sdca-v1-0-download
+ *
+ * Copyright (C) 2025 Cirrus Logic, Inc. and
+ *                    Cirrus Logic International Semiconductor Ltd.
+ */
+
+#ifndef __SDCA_JACK_H__
+#define __SDCA_JACK_H__
+
+struct sdca_interrupt;
+struct snd_kcontrol;
+
+/**
+ * struct jack_state - Jack state structure to keep data between interrupts
+ * @kctl: Pointer to the ALSA control attached to this jack
+ */
+struct jack_state {
+	struct snd_kcontrol *kctl;
+};
+
+int sdca_jack_alloc_state(struct sdca_interrupt *interrupt);
+int sdca_jack_process(struct sdca_interrupt *interrupt);
+
+#endif // __SDCA_JACK_H__
diff --git a/sound/soc/sdca/Makefile b/sound/soc/sdca/Makefile
index f6b73275d9649..b3b0f5d94c8de 100644
--- a/sound/soc/sdca/Makefile
+++ b/sound/soc/sdca/Makefile
@@ -3,7 +3,7 @@
 snd-soc-sdca-y := sdca_functions.o sdca_device.o sdca_function_device.o \
 		  sdca_regmap.o sdca_asoc.o sdca_ump.o
 snd-soc-sdca-$(CONFIG_SND_SOC_SDCA_HID) += sdca_hid.o
-snd-soc-sdca-$(CONFIG_SND_SOC_SDCA_IRQ) += sdca_interrupts.o
+snd-soc-sdca-$(CONFIG_SND_SOC_SDCA_IRQ) += sdca_interrupts.o sdca_jack.o
 snd-soc-sdca-$(CONFIG_SND_SOC_SDCA_FDL) += sdca_fdl.o
 
 snd-soc-sdca-class-y := sdca_class.o
diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index 8f6a2adfb6fbe..ff3a7e405fdcb 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -22,6 +22,7 @@
 #include <sound/sdca_function.h>
 #include <sound/sdca_hid.h>
 #include <sound/sdca_interrupts.h>
+#include <sound/sdca_jack.h>
 #include <sound/sdca_ump.h>
 #include <sound/soc-component.h>
 #include <sound/soc.h>
@@ -155,14 +156,7 @@ static irqreturn_t detected_mode_handler(int irq, void *data)
 {
 	struct sdca_interrupt *interrupt = data;
 	struct device *dev = interrupt->dev;
-	struct snd_soc_component *component = interrupt->component;
-	struct snd_soc_card *card = component->card;
-	struct rw_semaphore *rwsem = &card->snd_card->controls_rwsem;
-	struct snd_kcontrol *kctl = interrupt->priv;
-	struct snd_ctl_elem_value *ucontrol __free(kfree) = NULL;
-	struct soc_enum *soc_enum;
 	irqreturn_t irqret = IRQ_NONE;
-	unsigned int reg, val;
 	int ret;
 
 	ret = pm_runtime_get_sync(dev);
@@ -171,76 +165,9 @@ static irqreturn_t detected_mode_handler(int irq, void *data)
 		goto error;
 	}
 
-	if (!kctl) {
-		const char *name __free(kfree) = kasprintf(GFP_KERNEL, "%s %s",
-							   interrupt->entity->label,
-							   SDCA_CTL_SELECTED_MODE_NAME);
-
-		if (!name)
-			goto error;
-
-		kctl = snd_soc_component_get_kcontrol(component, name);
-		if (!kctl) {
-			dev_dbg(dev, "control not found: %s\n", name);
-			goto error;
-		}
-
-		interrupt->priv = kctl;
-	}
-
-	soc_enum = (struct soc_enum *)kctl->private_value;
-
-	reg = SDW_SDCA_CTL(interrupt->function->desc->adr, interrupt->entity->id,
-			   interrupt->control->sel, 0);
-
-	ret = regmap_read(interrupt->function_regmap, reg, &val);
-	if (ret < 0) {
-		dev_err(dev, "failed to read detected mode: %d\n", ret);
-		goto error;
-	}
-
-	switch (val) {
-	case SDCA_DETECTED_MODE_DETECTION_IN_PROGRESS:
-	case SDCA_DETECTED_MODE_JACK_UNKNOWN:
-		reg = SDW_SDCA_CTL(interrupt->function->desc->adr,
-				   interrupt->entity->id,
-				   SDCA_CTL_GE_SELECTED_MODE, 0);
-
-		/*
-		 * Selected mode is not normally marked as volatile register
-		 * (RW), but here force a read from the hardware. If the
-		 * detected mode is unknown we need to see what the device
-		 * selected as a "safe" option.
-		 */
-		regcache_drop_region(interrupt->function_regmap, reg, reg);
-
-		ret = regmap_read(interrupt->function_regmap, reg, &val);
-		if (ret) {
-			dev_err(dev, "failed to re-check selected mode: %d\n", ret);
-			goto error;
-		}
-		break;
-	default:
-		break;
-	}
-
-	dev_dbg(dev, "%s: %#x\n", interrupt->name, val);
-
-	ucontrol = kzalloc(sizeof(*ucontrol), GFP_KERNEL);
-	if (!ucontrol)
-		goto error;
-
-	ucontrol->value.enumerated.item[0] = snd_soc_enum_val_to_item(soc_enum, val);
-
-	down_write(rwsem);
-	ret = kctl->put(kctl, ucontrol);
-	up_write(rwsem);
-	if (ret < 0) {
-		dev_err(dev, "failed to update selected mode: %d\n", ret);
+	ret = sdca_jack_process(interrupt);
+	if (ret)
 		goto error;
-	}
-
-	snd_ctl_notify(card->snd_card, SNDRV_CTL_EVENT_MASK_VALUE, &kctl->id);
 
 	irqret = IRQ_HANDLED;
 error:
@@ -536,6 +463,10 @@ int sdca_irq_populate(struct sdca_function_data *function,
 				handler = function_status_handler;
 				break;
 			case SDCA_CTL_TYPE_S(GE, DETECTED_MODE):
+				ret = sdca_jack_alloc_state(interrupt);
+				if (ret)
+					return ret;
+
 				handler = detected_mode_handler;
 				break;
 			case SDCA_CTL_TYPE_S(XU, FDL_CURRENTOWNER):
diff --git a/sound/soc/sdca/sdca_jack.c b/sound/soc/sdca/sdca_jack.c
new file mode 100644
index 0000000000000..83b2b9cc81f00
--- /dev/null
+++ b/sound/soc/sdca/sdca_jack.c
@@ -0,0 +1,140 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (C) 2025 Cirrus Logic, Inc. and
+//                    Cirrus Logic International Semiconductor Ltd.
+
+/*
+ * The MIPI SDCA specification is available for public downloads at
+ * https://www.mipi.org/mipi-sdca-v1-0-download
+ */
+
+#include <linux/cleanup.h>
+#include <linux/device.h>
+#include <linux/dev_printk.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_registers.h>
+#include <linux/sprintf.h>
+#include <linux/regmap.h>
+#include <linux/rwsem.h>
+#include <sound/asound.h>
+#include <sound/control.h>
+#include <sound/sdca.h>
+#include <sound/sdca_function.h>
+#include <sound/sdca_interrupts.h>
+#include <sound/sdca_jack.h>
+#include <sound/soc-component.h>
+#include <sound/soc.h>
+
+/**
+ * sdca_jack_process - Process an SDCA jack event
+ * @interrupt: SDCA interrupt structure
+ *
+ * Return: Zero on success or a negative error code.
+ */
+int sdca_jack_process(struct sdca_interrupt *interrupt)
+{
+	struct device *dev = interrupt->dev;
+	struct snd_soc_component *component = interrupt->component;
+	struct snd_soc_card *card = component->card;
+	struct rw_semaphore *rwsem = &card->snd_card->controls_rwsem;
+	struct jack_state *state = interrupt->priv;
+	struct snd_kcontrol *kctl = state->kctl;
+	struct snd_ctl_elem_value *ucontrol __free(kfree) = NULL;
+	struct soc_enum *soc_enum;
+	unsigned int reg, val;
+	int ret;
+
+	if (!kctl) {
+		const char *name __free(kfree) = kasprintf(GFP_KERNEL, "%s %s",
+							   interrupt->entity->label,
+							   SDCA_CTL_SELECTED_MODE_NAME);
+
+		if (!name)
+			return -ENOMEM;
+
+		kctl = snd_soc_component_get_kcontrol(component, name);
+		if (!kctl) {
+			dev_dbg(dev, "control not found: %s\n", name);
+			return -ENOENT;
+		}
+
+		state->kctl = kctl;
+	}
+
+	soc_enum = (struct soc_enum *)kctl->private_value;
+
+	reg = SDW_SDCA_CTL(interrupt->function->desc->adr, interrupt->entity->id,
+			   interrupt->control->sel, 0);
+
+	ret = regmap_read(interrupt->function_regmap, reg, &val);
+	if (ret < 0) {
+		dev_err(dev, "failed to read detected mode: %d\n", ret);
+		return ret;
+	}
+
+	switch (val) {
+	case SDCA_DETECTED_MODE_DETECTION_IN_PROGRESS:
+	case SDCA_DETECTED_MODE_JACK_UNKNOWN:
+		reg = SDW_SDCA_CTL(interrupt->function->desc->adr,
+				   interrupt->entity->id,
+				   SDCA_CTL_GE_SELECTED_MODE, 0);
+
+		/*
+		 * Selected mode is not normally marked as volatile register
+		 * (RW), but here force a read from the hardware. If the
+		 * detected mode is unknown we need to see what the device
+		 * selected as a "safe" option.
+		 */
+		regcache_drop_region(interrupt->function_regmap, reg, reg);
+
+		ret = regmap_read(interrupt->function_regmap, reg, &val);
+		if (ret) {
+			dev_err(dev, "failed to re-check selected mode: %d\n", ret);
+			return ret;
+		}
+		break;
+	default:
+		break;
+	}
+
+	dev_dbg(dev, "%s: %#x\n", interrupt->name, val);
+
+	ucontrol = kzalloc(sizeof(*ucontrol), GFP_KERNEL);
+	if (!ucontrol)
+		return -ENOMEM;
+
+	ucontrol->value.enumerated.item[0] = snd_soc_enum_val_to_item(soc_enum, val);
+
+	down_write(rwsem);
+	ret = kctl->put(kctl, ucontrol);
+	up_write(rwsem);
+	if (ret < 0) {
+		dev_err(dev, "failed to update selected mode: %d\n", ret);
+		return ret;
+	}
+
+	snd_ctl_notify(card->snd_card, SNDRV_CTL_EVENT_MASK_VALUE, &kctl->id);
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(sdca_jack_process, "SND_SOC_SDCA");
+
+/**
+ * sdca_jack_alloc_state - allocate state for a jack interrupt
+ * @interrupt: SDCA interrupt structure.
+ *
+ * Return: Zero on success or a negative error code.
+ */
+int sdca_jack_alloc_state(struct sdca_interrupt *interrupt)
+{
+	struct device *dev = interrupt->dev;
+	struct jack_state *jack_state;
+
+	jack_state = devm_kzalloc(dev, sizeof(*jack_state), GFP_KERNEL);
+	if (!jack_state)
+		return -ENOMEM;
+
+	interrupt->priv = jack_state;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(sdca_jack_alloc_state, "SND_SOC_SDCA");
-- 
2.47.3

