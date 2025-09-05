Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C44369349
	for <linux-sound@vger.kernel.org>; Fri,  5 Sep 2025 14:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757082723; cv=fail; b=hDOQ13c6yxYKOlaRPmxRtkdT4WC2qmgesb0NRsfx1yQt4ezVGzXtFVCEv7+1N4Nuldqqy6RcSYMhnTk5tgbcuPUts+0D+ZtnqL3z1PhqbBhv+ZysD+bd02UGN7YzcAHOGQHEb973asGzb9XzVzYQDVboZGDdnrcB7kgql6sROFA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757082723; c=relaxed/simple;
	bh=wLlsx7pXKqor2wVTUZ+q2NsKsf8i6KTZ2iDK/kqwxus=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WQW2MP31RujXVj043Y5iOW5vdU6XKAzaAcRu3AuVyF1kenffcSA/Y3H4Vfov6WNAxT2l3OhyVfiWN9eY7EB9AabXeSAsyKStmlscWKZkNb1wexcf25PjM/Sl398nBzRmOZroIgh76cVFCsn8YKVOmYkJNk5Yd8QiOm5O8ddxwng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=OHwpTFSt; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=EVrxzgHQ; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="OHwpTFSt";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="EVrxzgHQ"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5859A7ed3552596;
	Fri, 5 Sep 2025 09:31:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=4jvb1LB+4Akom3achmv8RClshnBS+7IjtxOKEQtaqAg=; b=
	OHwpTFStBE/Gi2rqKEQ5qtlNUpcBF7sx/dQdZP3MK8tH9g68CIEfXET0qscePN2p
	dSwu/iel1Xyydo6Q8a1r/f33zE7zaxPeXIx8I1ro0pyk3oXm3B7w1U2aXDnB9r26
	mpq24INhWsSGSiQGUW7wZfTAsl3gN3umPehA4duRhgP+FFyrVkHpCmVlcXwZHH7T
	Q0OKj1Wb5zYbXmEDZwcCQ7eb0B1qTtb1594jHD57QcJeGzlyhZydTKV2kpyi2L6I
	5fA69tqMoQZ3JSVMxvha13544/9IulJsjDhBqMvCY8pGWG0lA/Tti0c/dWo9ZhB6
	OL13aBZlbI9XPAJngtEi9Q==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11hn2242.outbound.protection.outlook.com [52.100.173.242])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 48yw0b0bkd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 05 Sep 2025 09:31:39 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Px3O6LRHdIE6gsuMFWZ1SlDcFSCHgWKuqkkii0ae35e72JD7GtCbrbKctzrdL2RZm4noz5YKENOQIHRKl8dNTwTlyvvh5eJq684G79LouC1SXvJPyxvk24qzwwOYX0B7Lpsirj72qjsHbrOGQ9pLzffvDFSFOz9mMyiCgovETGI0sv0FYDBrlaCxkwj/Q8Eg8dY46ZWm6Yk44vTCWfabP1EUEpZccbMhE5RP1BCxT+YCifjeTFB80ln/k5cwKd4KkNxsMmIucgcfrOm6s4TQjAZ8gcsyBhmjsOpXylzO1Vpbvq3XE8Lywt2EIwVp6Ykk+ADK2tIycQ7u3/MJ314+uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4jvb1LB+4Akom3achmv8RClshnBS+7IjtxOKEQtaqAg=;
 b=stdE+KP8i7jJKqL5S7HxiL4EQ0yAed5LvPyqcN/17+aBUqm08K0/aIvMoTOBOnnXlwOG/6lBSJJvr0whmo8t349yNJnhbHuX7LNEmlRKUQ1Wo7enTy35Fn9G/GcEtAme3ydQ2iehIgZlhTvC0J5+yC5AX7gc2W/v5tjAphOCLTLs7xYpkyUWuSsof8VHYH2R1g75dlfUJtDZ55/ZA0J5w4yvNjDtu+3UuhXlu66H13is6Gku9sj9f3SVs0PvFJ8JhNptyOIZelaiY/eUDrNamfV0hDMhZjLrys73p2jJ32vJ7q4EVm/bKYjpbrj1udtX1WgUJQsA8VXr+1/eB4TU5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4jvb1LB+4Akom3achmv8RClshnBS+7IjtxOKEQtaqAg=;
 b=EVrxzgHQ0MomlENZYbEE5ABRILoMm9I8UmM3ECI1r3Qz/F3oVAFiEWqUecC7n1o5sCjguTEb85HR0yBcy8+DYSARzYdB1+0nTDU3JBVv/HueQC++RofZF4CVpltux8A2Wy09WnqqsQaUg0a9WQ3Dgz4J2DoNIHXNxN5lrMHQnfs=
Received: from BY3PR05CA0057.namprd05.prod.outlook.com (2603:10b6:a03:39b::32)
 by SA0PR19MB4367.namprd19.prod.outlook.com (2603:10b6:806:87::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Fri, 5 Sep
 2025 14:31:36 +0000
Received: from SJ1PEPF000023D3.namprd21.prod.outlook.com
 (2603:10b6:a03:39b:cafe::32) by BY3PR05CA0057.outlook.office365.com
 (2603:10b6:a03:39b::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.10 via Frontend Transport; Fri,
 5 Sep 2025 14:31:36 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000023D3.mail.protection.outlook.com (10.167.244.68) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.0
 via Frontend Transport; Fri, 5 Sep 2025 14:31:35 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 22EF4406564;
	Fri,  5 Sep 2025 14:31:28 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 0FB0882025A;
	Fri,  5 Sep 2025 14:31:28 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 15/15] ASoC: SDCA: Add HID button IRQ
Date: Fri,  5 Sep 2025 15:31:23 +0100
Message-ID: <20250905143123.3038716-16-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250905143123.3038716-1-ckeepax@opensource.cirrus.com>
References: <20250905143123.3038716-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D3:EE_|SA0PR19MB4367:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a8dd7e5b-0091-4f67-ad16-08ddec88eaf9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|34020700016|82310400026|376014|36860700013|61400799027|12100799063;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9YvxgdKOpoG5FG97clgiQxL8l5OJ2DlbryxeuEk01j/BOKP8tkxSi6pBK1RY?=
 =?us-ascii?Q?bMmePcNNwNAoQk+VJqgxTldEchUk5ZGhNXmAOnODhbUuAtoY+yUDciBAwMoB?=
 =?us-ascii?Q?aaCUD9n+jeIo9ANntqYc3H1V6ghyDAccySiNBsNfv4swQHO92S1+9WH8qV3V?=
 =?us-ascii?Q?d8NZ452rN5R3jaedVV5oOI4+1ecdawnkjP0iQpt8FHHw3GUJUf4bTnSs50Nz?=
 =?us-ascii?Q?pzZ5U05uhxOYI+vpSGwO/gFOvsTzrSqI2LDOBqp80LT1c2/hbQ9AEWj+p7+e?=
 =?us-ascii?Q?3wAPmd5Fr3RILepGdpBag+GnJZFjnS+7YKJlOj+vjBd8trYo16yTTDDwoMkO?=
 =?us-ascii?Q?BvxoCDPBCH4zbksp1kkGx6qbicok19YfEnxJJpG0MkxD7lp36Can6OTC0eb/?=
 =?us-ascii?Q?WzalL9y0BivwZxBsvWr2t1ynbce8wwrkl7tybmS5ARHICbpJsr69SBTMa1Jc?=
 =?us-ascii?Q?k/oktduVnXKcrYK6Cj+iwXEg9rS3TYjGtBSc5vM9EWbrimb8WnH+81hESIqn?=
 =?us-ascii?Q?XjGlER/pIrO+IP1gHI1mdYro/mdl3JFSn1iahfnjyoG0ET7KuajKiSj3tTgq?=
 =?us-ascii?Q?NWCGht6LKD/eA5Xf+FWlmZaDUMZjmhROECieJaqbbyHpYr3p0ZcgfJXdwkrw?=
 =?us-ascii?Q?icXx0w1lfAfvOAVylXcgG46M6KTRikvZ95YE90RUQWwn5s/mfb35s2RTPmMQ?=
 =?us-ascii?Q?eBcyOfA3Ecw27k3u5wQh01U8G+7VMJjkClF5QaIi8LMq0NQ54sYqWONsbcIn?=
 =?us-ascii?Q?k2T/8cm7+0pCKk+Kr+uTluZ1cFwNbpA0RoSSMSif6AzNsEjcuRbIASDnAVip?=
 =?us-ascii?Q?Ppb+tDXaVhRJVCT170uCUUiTnQotAOYk4SR+jMJkeQVi3/vBRqMEjxVVsvZe?=
 =?us-ascii?Q?OtQ8+bFuAObzLflMg3bJ/KryiId03et901WpMSMR9LA5mHQvDbEcTP/PR3io?=
 =?us-ascii?Q?6i9PwgP7DO1EkE4SSMIBAnSAMeIk2oLiUt1zmXK6NcgjD5ClGeN+l5gwfiRb?=
 =?us-ascii?Q?vqXORGamINxxaGAfDN2sDo5C5LKub1sYIHZZPG3a0zM34Awt6rdakkqflP0k?=
 =?us-ascii?Q?DQxo7xL+C3vy473W/GouasT5nz34Pqe1glRfQHKg5aAefkIOMHqmDHoY7+x/?=
 =?us-ascii?Q?y9eGR71RAzVrdVIbOpT/nucvff2CaKHdFfLnPCVkXHWIKnnuMNs3Rd0nMQpe?=
 =?us-ascii?Q?2C86jNZNeGCyTLoJNk8G8Gm2lQ5OG7q1asFOuKNT7YQFqTmzzWGEAbdkLOiG?=
 =?us-ascii?Q?TtTuI4YdALAE8HvrSxLiiwlrB2sEerZUtO6D8r08k50lG0657g6C4X72mZOB?=
 =?us-ascii?Q?FcQhNLXFsYTS0GHICRTIOMgaw4QTAivV+jei2CL+fberNTHrV1xNjoI1c5v1?=
 =?us-ascii?Q?MpakRufV6fxOPapJLbx0l3YP+8bxlliwxJQMIakt93JOBrzsN4zQ6V4AE399?=
 =?us-ascii?Q?XPHmBcFaf/oXMzlFzSVE2OqkyhKbut87g0Zf4S6LCVZD9sIpJ2SMzEmeZFI0?=
 =?us-ascii?Q?6KJ4DaUS7qZYedNJxXUoG8WoD9P7JonmQpmz?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(34020700016)(82310400026)(376014)(36860700013)(61400799027)(12100799063);DIR:OUT;SFP:1501;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 14:31:35.4033
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8dd7e5b-0091-4f67-ad16-08ddec88eaf9
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000023D3.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR19MB4367
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA1MDE0MiBTYWx0ZWRfX7Xn9ua3ATGC7
 b0N91noDOvmAaAYXPrMKId0Is+astSU19fgS04J5gs2NXRgZIVkeC26am7k/ARIno7PJKe6U5Bc
 cYWQ6hNAy6Nq3VTtS4IDsKvqM0uWDaabsf2a+sJFTtKS5SZRU5ZS3lQfIqyVj23LAMuH8xAp+26
 Goqllp2DjaJMZbcFobutJaVLFJtZe8rLXEHCPw6uQraV0qeEpRAwe1oc02Ll0rCzEu3Cb/h/KkQ
 34ZO/sjb1nD7ITpTydzotVhdWxV0dUWLTqAM0k22jPfIYUlrxrhjL8pXUEshjaEBse88xy0rEjf
 ulfIWBX7n+qP1RlQM6M3GI3Jf5L/fz9oiKW1/5jZw6p9VBJj/NokonH8mtJycA=
X-Authority-Analysis: v=2.4 cv=YJufyQGx c=1 sm=1 tr=0 ts=68baf44b cx=c_pps
 a=3APXPCHzLAc6z7E13t1aeQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8
 a=6BSnrPCAuFArKd-Y-XcA:9 a=jZz-an6Pvt0H8_Yc_ROU:22
X-Proofpoint-ORIG-GUID: ZmAqkFowLjQAc-74QWXxDbpxSNvYG9Rn
X-Proofpoint-GUID: ZmAqkFowLjQAc-74QWXxDbpxSNvYG9Rn
X-Proofpoint-Spam-Reason: safe

Now full support for the UMP buffers is available, it is possible to
read the SDCA HID descriptors from the device and pass them to
user-space. Add a helper function to process HID events from an SDCA
device.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/sdca_hid.h         | 13 +++++++--
 sound/soc/sdca/sdca_hid.c        | 46 ++++++++++++++++++++++++++++++++
 sound/soc/sdca/sdca_interrupts.c | 28 +++++++++++++++++++
 3 files changed, 85 insertions(+), 2 deletions(-)

diff --git a/include/sound/sdca_hid.h b/include/sound/sdca_hid.h
index 3a155835e035e..18bebbe428c9f 100644
--- a/include/sound/sdca_hid.h
+++ b/include/sound/sdca_hid.h
@@ -8,13 +8,17 @@
 #ifndef __SDCA_HID_H__
 #define __SDCA_HID_H__
 
-#include <linux/types.h>
-#include <linux/hid.h>
+struct device;
+struct sdw_slave;
+
+struct sdca_entity;
+struct sdca_interrupt;
 
 #if IS_ENABLED(CONFIG_SND_SOC_SDCA_HID)
 
 int sdca_add_hid_device(struct device *dev, struct sdw_slave *sdw,
 			struct sdca_entity *entity);
+int sdca_hid_process_report(struct sdca_interrupt *interrupt);
 
 #else
 
@@ -24,6 +28,11 @@ static inline int sdca_add_hid_device(struct device *dev, struct sdw_slave *sdw,
 	return 0;
 }
 
+static inline int sdca_hid_process_report(struct sdca_interrupt *interrupt)
+{
+	return 0;
+}
+
 #endif
 
 #endif /* __SDCA_HID_H__ */
diff --git a/sound/soc/sdca/sdca_hid.c b/sound/soc/sdca/sdca_hid.c
index 53dad1a524d4b..ad53207b0d62b 100644
--- a/sound/soc/sdca/sdca_hid.c
+++ b/sound/soc/sdca/sdca_hid.c
@@ -10,6 +10,7 @@
 #include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/dev_printk.h>
+#include <linux/hid.h>
 #include <linux/module.h>
 #include <linux/property.h>
 #include <linux/soundwire/sdw.h>
@@ -17,6 +18,8 @@
 #include <sound/sdca.h>
 #include <sound/sdca_function.h>
 #include <sound/sdca_hid.h>
+#include <sound/sdca_interrupts.h>
+#include <sound/sdca_ump.h>
 
 static int sdwhid_parse(struct hid_device *hid)
 {
@@ -121,5 +124,48 @@ int sdca_add_hid_device(struct device *dev, struct sdw_slave *sdw,
 }
 EXPORT_SYMBOL_NS(sdca_add_hid_device, "SND_SOC_SDCA");
 
+/**
+ * sdca_hid_process_report - read a HID event from the device and report
+ * @interrupt: Pointer to the SDCA interrupt information structure.
+ *
+ * Return: Zero on success, and a negative error code on failure.
+ */
+int sdca_hid_process_report(struct sdca_interrupt *interrupt)
+{
+	struct device *dev = interrupt->dev;
+	struct hid_device *hid = interrupt->entity->hide.hid;
+	void *val __free(kfree) = NULL;
+	int len, ret;
+
+	ret = sdca_ump_get_owner_host(dev, interrupt->function_regmap,
+				      interrupt->function, interrupt->entity,
+				      interrupt->control);
+	if (ret)
+		return ret;
+
+	len = sdca_ump_read_message(dev, interrupt->device_regmap,
+				    interrupt->function_regmap,
+				    interrupt->function, interrupt->entity,
+				    SDCA_CTL_HIDE_HIDTX_MESSAGEOFFSET,
+				    SDCA_CTL_HIDE_HIDTX_MESSAGELENGTH, &val);
+	if (len < 0)
+		return len;
+
+	ret = sdca_ump_set_owner_device(dev, interrupt->function_regmap,
+					interrupt->function, interrupt->entity,
+					interrupt->control);
+	if (ret)
+		return ret;
+
+	ret = hid_input_report(hid, HID_INPUT_REPORT, val, len, true);
+	if (ret < 0) {
+		dev_err(dev, "failed to report hid event: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(sdca_hid_process_report, "SND_SOC_SDCA");
+
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_DESCRIPTION("SDCA HID library");
diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index ed2a06a1b719f..386a15ebf1093 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -20,6 +20,7 @@
 #include <sound/sdca.h>
 #include <sound/sdca_entity_xu.h>
 #include <sound/sdca_function.h>
+#include <sound/sdca_hid.h>
 #include <sound/sdca_interrupts.h>
 #include <sound/sdca_ump.h>
 #include <sound/soc-component.h>
@@ -247,6 +248,29 @@ static irqreturn_t detected_mode_handler(int irq, void *data)
 	return irqret;
 }
 
+static irqreturn_t hid_handler(int irq, void *data)
+{
+	struct sdca_interrupt *interrupt = data;
+	struct device *dev = interrupt->dev;
+	irqreturn_t irqret = IRQ_NONE;
+	int ret;
+
+	ret = pm_runtime_get_sync(dev);
+	if (ret < 0) {
+		dev_err(dev, "failed to resume for hid: %d\n", ret);
+		goto error;
+	}
+
+	ret = sdca_hid_process_report(interrupt);
+	if (ret)
+		goto error;
+
+	irqret = IRQ_HANDLED;
+error:
+	pm_runtime_put(dev);
+	return irqret;
+}
+
 static irqreturn_t fdl_owner_handler(int irq, void *data)
 {
 	struct sdca_interrupt *interrupt = data;
@@ -528,6 +552,10 @@ int sdca_irq_populate(struct sdca_function_data *function,
 					handler = fdl_owner_handler;
 				}
 				break;
+			case SDCA_ENTITY_TYPE_HIDE:
+				if (control->sel == SDCA_CTL_HIDE_HIDTX_CURRENTOWNER)
+					handler = hid_handler;
+				break;
 			default:
 				break;
 			}
-- 
2.47.2

