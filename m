Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8292D94BF
	for <linux-sound@vger.kernel.org>; Mon, 15 Dec 2025 15:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765813055; cv=fail; b=ivgsqNu4rCzK1o2aTIjT2fB5l/8hgxl2ZJkUyYIBBKiTMzl2Zt7Ic0Lspq1+jY80PeM0lLMYHy2rJN3ot2KvJLJ/qZ7zEUDVr1jRyd+YK3HF3NoYtpb6hAUrDti+dLYTewo5KBY8XgUq4IP5g4itaVB86ENLfKL+97lhHlbryos=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765813055; c=relaxed/simple;
	bh=vpO6+IiafFjUeM9ymroWA0RSTlpd4/mo7QpSY0Jdq00=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sn+cLCw20tcIv0EPHkALCwqtEkaNWmwGM1WTw5CMjxyF07GMBlJyYktThO6GkOZL3xAAPJwgieDe/eNTDapcrnEErBBR0pKPFHBEBQbFsjieBT+htauWBdSRyHeULdsKaBEJLer2KxrBVv/ex7U79lUX4HJP79jr6XvYrMF1jhM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=m2WkAz7m; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=f362hjMO; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="m2WkAz7m";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="f362hjMO"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BFEunGJ1043681;
	Mon, 15 Dec 2025 09:36:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=PB7lw+3aYEO16ctz1TgCRfkEBgF/PhS1cll5U6BuzA8=; b=
	m2WkAz7m3bhP6aX+zWN4tviaqUYwHzfvfqzSMWWC5SNIBmX2PgLzEizdMGTSmN0Z
	G5JeSom0JbFb9opGAH1oOD1zt5K+oWdMsTwXVO6LGPMu/8789XWYtd2aLbmWorIh
	5GBjJCUwDnijGnFyde2XP/v9umz6QjLkJO4aPNqWYV9gP4Dj8A9nxF6at5jN6d5S
	oJiuAYeqcJMvwBxVDNHFFX065tjfG06ybaU5plqIOxXMClxRi7YdITzcZT6GBEhJ
	tDxETmuKALxM2ayKC0sf+7ilabmZ7cDRxrlgz9ysKEVRgHv6IHyFVMLc6inwA14H
	JLov2ehf4j2nehsu/B7o9g==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021098.outbound.protection.outlook.com [40.93.194.98])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4b16e1t13c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 15 Dec 2025 09:36:59 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=di8AyeRcNH3tkjvJ/cp3Vcs32Bl+p8/j7/mMXIz+WZi6GfwaCApE7hEF+unEo6XF/DK8fNwz7GfHtVgzSohec7y4HImUgeVWNrO58mBwAZQycq+2Zdqr1z7jIHMwlHCStKj8GI6WFFXeobWsbGzPuQGuEDYP8DphMKcldytxj9WYiiZtjZxmdReG9ZNGxM71jMiLg49+tNYdT1CM1Ljnzp7V1+fMMx1d+mi4B9y5CMHYOr/6x3IFROTXEYhi2bWyKM+AHvfBZNlJ7AdltLewyU23iXOTBYC5N7dnm/frMDlz4VcxRFtNAmT8swyO7wybx23qaONLDjda6GBs1JKs1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PB7lw+3aYEO16ctz1TgCRfkEBgF/PhS1cll5U6BuzA8=;
 b=QvuNmrQ7DQvyOUDTmGN0xLp6YCK0uJsopLYZ9ca8SQQUxEvruU6rN7zadB1DRDLS1CIDySRsG+XkohkXcg1LIm+5j2R0komNVzvDG59Kv+AxrfBtCkwn8zq+bHbrhZkrqPoWLPOKErnKoAJwV2b4IzJrmEo7ki1Rm5npVWKgpoQy+TRfgUd4Ii93I7RFiqT0aaa22DCTag7Ve2xNXZ7EPsqCvCrPv6KyO149YTE1f8m1La99XOgxHve2jXoaUBP5Ylh+Bhe4UWfOrfKZzVQiwQblLyZF4B1TkEYzAxSeZzt/OUqxoOLI4lT/PD6CDf5458gfrQVcnBk89KjWHWmIUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PB7lw+3aYEO16ctz1TgCRfkEBgF/PhS1cll5U6BuzA8=;
 b=f362hjMOfBubfQKL0iAmufDDcGJbSvwpkdPEO0xvyxCQBwXierKkK6NQHLKe6rqQ/lldnEHaH5mlF3EmAcKYzwURKs5jNWyFvb/apZaNfAEq1M7iljNyxbuPdwBhGaQSs4PIKKfO5qVSSJ871DkTEk3UwB3L3dFNd3xcLD2C27E=
Received: from SJ0PR03CA0100.namprd03.prod.outlook.com (2603:10b6:a03:333::15)
 by DS1PR19MB8620.namprd19.prod.outlook.com (2603:10b6:8:1ef::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 15:36:55 +0000
Received: from SJ1PEPF0000231F.namprd03.prod.outlook.com
 (2603:10b6:a03:333:cafe::92) by SJ0PR03CA0100.outlook.office365.com
 (2603:10b6:a03:333::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.11 via Frontend Transport; Mon,
 15 Dec 2025 15:36:48 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF0000231F.mail.protection.outlook.com (10.167.242.235) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6
 via Frontend Transport; Mon, 15 Dec 2025 15:36:54 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 57AC0406542;
	Mon, 15 Dec 2025 15:36:53 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 43726820258;
	Mon, 15 Dec 2025 15:36:53 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH RESEND 1/3] ASoC: SDCA: Factor out jack handling into new c file
Date: Mon, 15 Dec 2025 15:36:47 +0000
Message-ID: <20251215153650.3913117-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251215153650.3913117-1-ckeepax@opensource.cirrus.com>
References: <20251215153650.3913117-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231F:EE_|DS1PR19MB8620:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 94b177a9-5d4b-4b22-cf13-08de3befc6c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|61400799027|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CZAatOmrZ3SK/Kd2IlyriH8dZwgSFOXS3/npWTgLWN7OSqRiRLWrTEu0Bfzh?=
 =?us-ascii?Q?QF/b3NOioV3foD/WMQS5dUwIxa6tRN0CBHhmaXDDB9PrTPUHuVO6ae/9czpE?=
 =?us-ascii?Q?3Wef0ox3ed0SPaFhKNZ+ymLXdGpUfVGZ1x3lgLJWjH41xklYexZUMwfzora2?=
 =?us-ascii?Q?oqUwjuxd0EdNZCZ67gJKMi/RqUo9d8j9W4RAi42J9zNsWxyTVExejN/3J0nA?=
 =?us-ascii?Q?A9njJCsQOnM+GCNUhi+cSsj9eDYQRVo8MUb5sGxWsNN60BPfnSLf6pAY8bZQ?=
 =?us-ascii?Q?f7SYLFEHTLoey1YjzrgA93p6E18PRX7fkxjgjzeVAqxLc8fe9M2y4npMp8BP?=
 =?us-ascii?Q?Wzz6nBKjc/na5/cCz53+iegESo/V3RvIZe2R8rt6fJOnBTTfPxIyMp13FwEt?=
 =?us-ascii?Q?IQioAfWxLqQKQbMPMlCqCYdf2Pe5YIrI9sdNltxUwnIG8iYAtrLE+w6RGer7?=
 =?us-ascii?Q?0ykfeqa490fiolHKsNCCH9FS2sV7o1L7G9F93k03DFHncfohGCgZtwZ/rtbH?=
 =?us-ascii?Q?MZpU31GS8Z1t5lWaSkyrfFZfQjO/ngYdwS5HhNBvThziGH2TKfK7sZGu1SvN?=
 =?us-ascii?Q?QjnFcOzUoBBUkmcMcD1JQf9ESBgWl+jiev1f/J5Z1IE74zcd3HxEG9o5JZUX?=
 =?us-ascii?Q?zhufmD0oq7rMXzbKa7g2QeftInk1JoEAPoaBLexv9NiPDMggE8CvPDGzm4Xa?=
 =?us-ascii?Q?XxTBD0d+3RmYPC7ojvBcqvI3NahpK6zJoV+BGxI3bjKJkJ0k8FMZrRC4k57w?=
 =?us-ascii?Q?GpjziCCGBJ/CUyK9nlJ/AUCEzUen1wwo35SdQOhCqV3x7x2zQvXLsE+/jfD/?=
 =?us-ascii?Q?hNmMqZ3YCuY4Y8WsSCmWHeh59jAONfkfTwdlcgNRB2tjPJhtqq3Xv32sHLue?=
 =?us-ascii?Q?1l2UqailDhVR007evo1Mt9EVMi6YuKfm99SilBEzmiHJ4hnqh9X4YvniYWuf?=
 =?us-ascii?Q?5uZ0oQoAoV0y/zdSfPbsjVE/HbY8tBhtPB3xjM8VZscu5ZbDnzcFpwFnLfPL?=
 =?us-ascii?Q?Y+xe9fVM/99IHAen+O8vMDy4y+qt3iz1BJF/HCED7YIJuGlk3upXe0a8ucFi?=
 =?us-ascii?Q?nVwmVbnCO9TymfgtwBJx9mKdosZolgyugpY/BA4OPKdtPqXhhUOD9kMog29R?=
 =?us-ascii?Q?ByRoBzkpVlndQPjgEAy8GgTn06Dq3yEpyH3cYW4+Y+vy7ticzmsh/aY5wSHZ?=
 =?us-ascii?Q?tdgqE4h6Hh30PDh8d6XMGtBXsziocfoyZ319Cv2NxCP/aYWN7Y7vXTMxnWxt?=
 =?us-ascii?Q?bPOR/x2TjpM6rHrYws8DzuFvW75pSQXeZFhI9kt7a437NUnPBVQgxaTdTYjQ?=
 =?us-ascii?Q?q6Xho5PZ2GcEQt3Ybv3hFnC7Kb65eZiuw3RWbClkmiIXQyNxkF2ozpl/r3HZ?=
 =?us-ascii?Q?05SnPY/2mfMuA2zgHmRka2z7pHipuG8HPBOs0unAih6uEztfE/7tNtufJ9ZZ?=
 =?us-ascii?Q?UdVTX7/TjY/HbmgJAkVZ7bMa/LBV6ee5uhtSSKgO1E0BwU+dUw802GbcSmnS?=
 =?us-ascii?Q?QylVS3FTu23Gse50hXwRIW54GMYYtKdcePpcfVu0ZqHmH+eE5NpcSd1y/OD1?=
 =?us-ascii?Q?4CXi3IvibFEIbQ6pmjs=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(61400799027)(82310400026)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 15:36:54.7921
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94b177a9-5d4b-4b22-cf13-08de3befc6c6
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF0000231F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS1PR19MB8620
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDEzNSBTYWx0ZWRfX94kyQ3SbswYd
 XP1pWAN3x4ME8JLLs9uz9b2K09maZ6ZVrhdWMavbRc1LfYZlAUEtQY76p0gcHdKSiQzaj41M/ex
 g4nXSQm47PuX2q9vz1cditgC5kBzPq5ZlcTDfsdC8Mi3i3S2vsqLap0m6lgrQwzajx1sMHEU5SK
 yr4lfHj8gUrD2gUAywhy9vLLLsrFRG8ZG8tKE8IbvhyJA7ZGvhhCZaoC7/jAMJBMTjHvGB4cAHJ
 ztmByQm1GYT3n93J1/mS7uiWTJlVGRud7OmzfZql2CGEOy7RN0cQ3q6Z5IIhB4B63DwG7dhdhgG
 smK+p/Ug1N+43y4nbTYzAJ3yveAUAfKc9ev4GFu8zLEiKlcwx9gZfz5QjPohhC6Hfc3OlB9JEvr
 jQgaTEv+Jhp2K9XeK3VTkOAfTY9g4A==
X-Proofpoint-ORIG-GUID: O56PZnHHwa5vtVyhZhvRq0e8HZe-CG6T
X-Authority-Analysis: v=2.4 cv=Qdprf8bv c=1 sm=1 tr=0 ts=69402b1b cx=c_pps
 a=+Hy52UGsyZjcAHjLWYz0zA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KJT-RnjOAAAA:8 a=w1d2syhTAAAA:8
 a=E_qsNW-z644fjflaSDkA:9 a=HE_01F9_QflCRFonrIQr:22
X-Proofpoint-GUID: O56PZnHHwa5vtVyhZhvRq0e8HZe-CG6T
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

