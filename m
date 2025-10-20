Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0B02773E3
	for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 15:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760975754; cv=fail; b=E0uOJZ+vDfkEDjIf60WG/MDEY33XceNvoUFpFE5LIkMUA4Xf1Vpmbx6+ErXFTvMKB3rKIoN7fLtUDhvSDibVAmkVpa4hdYkumRunxS1DiN2j2cM/roR5uSzwNqapqELQqxNgojE5U+KJr9agJSqhwOm2ocZfvJrwVcVBHYo7i/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760975754; c=relaxed/simple;
	bh=/7Nw/OpaSWOxWXyHechpdMDyeDK3NZ/Qdxm3uGTQV3s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AO3dN6QngpxxhnXesDih+BTdGejpTyeKybNFNHkZGgvU9pPMq+37ebJ8AGJRp3MrvnVj463gj56ZsLeSfR2LELI9u2vvNx+NIhxjwummf2L7vpHuutPt36sS9Jkl3al1MjTehzPrEzpgb71PjPLbiOWliab7HpEiuD7LGTTpgZA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=g3U6PYXB; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=MqtDlAKx; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="g3U6PYXB";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="MqtDlAKx"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59KEAb4H941361;
	Mon, 20 Oct 2025 10:55:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=qUBYbaD9i0pabAAvpzyzrRT9NZXeI/V3YQ73xriXtvw=; b=
	g3U6PYXBozJl4mneymSh5fSdsSeZ6noDqX2+wJYpezUwX8+eFbxIGMdp9BrOAlJr
	k2WovkrBxpupNE1dZ6Y4cEsJKZx1j5DuZv8+S/pPQFpeebuMvoAiacaLcPkMiCK4
	QEFE8tVbBkRoBG9oJtoTXb9Sipbq7yiaAyVhTAuASLXdC4D0LaDkNoPH99AGyH/i
	36RVui8gB1pMHqM2VGx+sEXQLMvJwALryfdXo8+PCDV1Qj463Z3uAepNmZejqEkE
	/doYDfRMgUw+eKL6Dw49GhV5HyQkXAM1giPkgZtNW/JgYfwSXpW5fKnS474vdHVy
	LwEeDXHy9KbE6p0eiBWkSQ==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021109.outbound.protection.outlook.com [40.107.208.109])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 49v7aj2aet-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 20 Oct 2025 10:55:28 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dYiBJrArQNEmFqd3X6Tfu8wFo7RBVdRZHRqCLNbjLdUeQA+nkeq7p8JTRkMmbBJ2a+vBnPG1QkpO8Orb/VS1EOgXivE3xAu9/hVClJnuhN9gE2SyM9Tw/Y/rdvAh3B0pIc+I2hTQ0b0Q9oWdQ3YcLUKmtlpV70nfF1e0bDGVEkFOPLPR82GNyEhigxPT2BPUoPU0fLFCxCf325+G6yixQz5GuAGepwr69Zmk5bM2kZzNnFtEvyfyuyc5PVipKT9sbNpctGe6kgFZrOA2nwV8jlHj+ju2mmiVPlHrroH7zVlhifwDc2wZsNdFYM/gVAuznsFTDM8w5phfCO/Wyob88Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qUBYbaD9i0pabAAvpzyzrRT9NZXeI/V3YQ73xriXtvw=;
 b=EsU5dIey4cLI5Ri3wwzjPwNhjsBX2/atjNSDPjC/deNkwGM5A+c3uXXcfNSKLZWLvWxWmZrRG8dz2crMuVEAMf3wt9ZZ84+oX/Okk59zblTmzP7GQYyzrIkqC+OqQWF7sJwiMHQGf/riGVPwZSiUDZgL6TDQH2PGKYlPRTciM+tMATE5AzGJciSBKjoRuosymRZ6UmH4Cc7FEEeqwOU8JO34ZunifLhaDODUMkslmS/TwqJYEcUGfVNS/GK3U8aPLRhJvsg066MGU7Dry+u+uF9Eh6tRb8da8ywKJ1peUbQIxcaWKuv54sofK7yj0pLKOE1IoQvsmy2TGpG/v0YSlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qUBYbaD9i0pabAAvpzyzrRT9NZXeI/V3YQ73xriXtvw=;
 b=MqtDlAKxQi37508kjAJBSVh9DFgboSTvPUK8dS3vqm70tG/T8UApGV5psIuL6zucbpzqS0qp7xZh/73Kbt1J/WRqSc3AZ3i1CsW2Vzmzg7TDdrWPHYDaKgoZ8jg8igmMRD4MvEO837SpLXE7pK92HuHMFs7zWH4/C6RzYdmrgUA=
Received: from BY3PR04CA0027.namprd04.prod.outlook.com (2603:10b6:a03:217::32)
 by BY5PR19MB4050.namprd19.prod.outlook.com (2603:10b6:a03:22c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 15:55:25 +0000
Received: from SJ5PEPF000001CD.namprd05.prod.outlook.com
 (2603:10b6:a03:217:cafe::72) by BY3PR04CA0027.outlook.office365.com
 (2603:10b6:a03:217::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.17 via Frontend Transport; Mon,
 20 Oct 2025 15:55:25 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001CD.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7
 via Frontend Transport; Mon, 20 Oct 2025 15:55:24 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 0963B40664D;
	Mon, 20 Oct 2025 15:55:18 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 02046822540;
	Mon, 20 Oct 2025 15:55:18 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        peter.ujfalusi@linux.intel.com, shumingf@realtek.com,
        lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 RESEND 19/19] ASoC: SDCA: Add HID button IRQ
Date: Mon, 20 Oct 2025 16:55:12 +0100
Message-ID: <20251020155512.353774-20-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251020155512.353774-1-ckeepax@opensource.cirrus.com>
References: <20251020155512.353774-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CD:EE_|BY5PR19MB4050:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c644d30e-0418-4292-3bb4-08de0ff11501
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|61400799027|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?R1+cFDbdSwpGUk18dBeLSIVIi3iWGuw+WNid5y8bAgPyfhwGCd4zVemWMHpE?=
 =?us-ascii?Q?mrUlDwGe4SPiyKfKQkHKt45WlfGZURfhAC9n0xTV0c+rj7XX7JngEyxnTkrj?=
 =?us-ascii?Q?I2AJ2NsphU9IXUxGqIeVmCvwQC0bLYqan1zzjRVbKbIS5YmLBYFOV/dNCLgt?=
 =?us-ascii?Q?s0u0pBxF1pp57uJMa+b6NtPGKHHGKtTDPYexJ8b5hLeHEG3k3WWVc4P9ZE07?=
 =?us-ascii?Q?0zRkLoSXWuwoJrzsTtEENSI3ipHAWeq/A8FhnOlYEQAlgoC099lfA4OIRHBP?=
 =?us-ascii?Q?6cmmP+BTBnlZQiP76FAKQMcjcAXht30O7cUi6T1FlCwRAHZ67QKCPK5CttuV?=
 =?us-ascii?Q?5aeys7RhPqtfQi93du9LVpvtF3CBNceLioSOf7Csc7Qi/dH5O+DisfaaBXZt?=
 =?us-ascii?Q?COaWgv9senxZRJbHqZog4r5wChMQDm8oryD7pL7lCDPL3z/bdCqzPVm/CSrY?=
 =?us-ascii?Q?3swSCmKPp8+INy7CGYfJ8Sicx6P/C7KRbxTWw2vPXa4hNeSAzexDnlTG1FbB?=
 =?us-ascii?Q?tClrvCP9N+c7ISoGE7ZPhU6Le8SHuUQa5Q5159pjdT8THX3kHbTVaQS6xala?=
 =?us-ascii?Q?pz+rtC1OwZ/jP5ccnyFAdGwScPVZtx3XQ97EQo50Rp7rwD6nlnyW9JvT8C6l?=
 =?us-ascii?Q?d2Ay2ABJ167ZOto4GSG0WMNgMUEuwvz/z6/0ej6xmdpby01WQ+kgO8dPjN/Y?=
 =?us-ascii?Q?GJ9d/ReADRCBfMEqO/K1B492T1X5n+bD+dVdSkNdIESqumGbptsWGRpHXEm3?=
 =?us-ascii?Q?d1ffX2J/BnxICV9v5gStcVSi+lZ08hc7+sazgChBbT/ocTu+iuMVnindMaha?=
 =?us-ascii?Q?ozF9H25CKK8LF7VTKos4MgHlKzYnFCo3rwsajm54S+trnnimis8eqkNdiww5?=
 =?us-ascii?Q?dddr4aCtyvq3oWRbAdXnJXpE+UFDQSrjqECqVaX7hOC7Xu32w8RyUsjW0Ku3?=
 =?us-ascii?Q?mSjBVjsd+N/b8LqV3DFFowNjnWtHzqCWGksGUlA9DttXDYDE8YzwCCUzn7XE?=
 =?us-ascii?Q?bjU9OEB7sUpJ73YPdWggOSCqZQwNBfz6MQKbsJ0FWu7+mSiwTo/aIweNl1aC?=
 =?us-ascii?Q?jwwqBJvi35WANiypFk+HQO869nqPEw4GeIFQMWphWORNI4L3IrgrdHBV/qJA?=
 =?us-ascii?Q?d+QYHyCTieFQaWwCQSQ9sxCRyoiFTssj8EfMFDkfO1qb2fZaVjSC8JO6G8QI?=
 =?us-ascii?Q?489sbSpE6eQlxENaB6jorkFM0vZZFcdzY0RaipMtZ3PzmzZfnPkQ7XgZIf6H?=
 =?us-ascii?Q?uOA6Z3EpO42XukIBeDgwYfFSv6uM/1SwM16rbD58JTP8jdNUr2lNXWA3Um+c?=
 =?us-ascii?Q?KB7RN3vDVAjrsfKqaE+EPlv1wAaJeW31dcrmN5xV5hLlOu045FUc/viItDoN?=
 =?us-ascii?Q?oe2gHZvAxI2T/ofM1F7v00/NOAq7XWLEFRwaCCd+uWCrsLmPVWJn6VjVJf6p?=
 =?us-ascii?Q?KTEPJNdi7Dls0E/kAXtZ1e8K1+EJOG28wAjCAb0XpEcQn6Epu4YrDTDB6pry?=
 =?us-ascii?Q?bCNLFp4gAvgUTVFMYDs39lxuYea3dAUR4U2kl0BH3MPfcwL3KkNO8E7nj9Z7?=
 =?us-ascii?Q?DyDyg5zc7roi2DJSJh0=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(61400799027)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 15:55:24.3772
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c644d30e-0418-4292-3bb4-08de0ff11501
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001CD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR19MB4050
X-Proofpoint-ORIG-GUID: eAwDBy80_uZ_sTVrt1xNrAORxyDawT3k
X-Proofpoint-GUID: eAwDBy80_uZ_sTVrt1xNrAORxyDawT3k
X-Authority-Analysis: v=2.4 cv=bdNmkePB c=1 sm=1 tr=0 ts=68f65b70 cx=c_pps
 a=0hJHWFAiWqvHUFm5j3G3Dg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=x6icFKpwvdMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8
 a=6BSnrPCAuFArKd-Y-XcA:9 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDEzMSBTYWx0ZWRfX8PSpv0P4JhMT
 MRLiQLksKzTHyxdoATyrNrKjWBfc6bboxuiipJgOaDI9CRLD6V5r+ODwA60/zUXw+gkdNjbCssS
 unTWnZ92V00g7MFnaT3H9ZJsLd2tSU6Zcip2e5YVk5dfElPvXmPbuRZ8n5sp8G3wRmb2vzuI9QK
 1cZG2Gm7QkD2L0Y+foUEBUWD3DrohBGtPICMSEAk20qX2nvzlorFVrvbmYzFPPn1e1oB6k9v3ex
 snnw9nF/bcdQEkbqJmTbOId2MZuOH4tqU+ub5e3g3uXXLUyeOuy18Zq82SjZj3JBChI+6Bx4oEV
 1+wfj3MT+D1AbkX0c4ta0kwnmFB7/gzmYjYkqiNf1eczyTpf2wryNMB2iYLXVh6vss+F6CCuX0u
 b0TzcJ3M1I7yptxnmEAxpWwfm72rsQ==
X-Proofpoint-Spam-Reason: safe

Now full support for the UMP buffers is available, it is possible to
read the SDCA HID descriptors from the device and pass them to
user-space. Add a helper function to process HID events from an SDCA
device.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v2.

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
index 51342b8aacae9..5176460416bbe 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -20,6 +20,7 @@
 #include <sound/sdca.h>
 #include <sound/sdca_fdl.h>
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
2.47.3

