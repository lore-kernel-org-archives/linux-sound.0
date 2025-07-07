Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D807728C851
	for <linux-sound@vger.kernel.org>; Mon,  7 Jul 2025 12:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751892154; cv=fail; b=hGxIdh1NBnHJZ1IDSD+KFxgEhpnzRdiEQnWuekWz598IgGlO6y26WeDanU+g6LUw+g+VIib7EkcbP3L5xx4NKEewCAv53vT0rWI55GWh3XYLUIcK4nroKaq8QBvtqj1mFg6SuDXT3jPOjYqncFZSoIlia9vDXwK0GiHk3mKcRsA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751892154; c=relaxed/simple;
	bh=goN5OpnCb1WHy0VvCJSmdxCPrJ4CfRtkcAtAvlTyQDs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KTWm5llQ/QCsfB+j9XgAbgVNGrrZbYSXqVBpkk29emMLqgL7ZDhcA0r9IhBmjsDP4JUH51WojbgZn9djTrO03MPiaaBp8Lv+1kNCsZ5GqmzARDhA3P7U5NqUgPH3Xg7oTSSNNzVy1OIOzLVleN3diWZjrwrVpYHoGG85I6CeH1U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=l1LFb/Vr; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=C05m5g0L; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="l1LFb/Vr";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="C05m5g0L"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 567Aw7H5025523;
	Mon, 7 Jul 2025 07:42:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=XnPoHa5j+osFY6W54+FWwDUmw+ReGMPrzHRFJjmIcxc=; b=
	l1LFb/VrHAvZ3MQnFiRocZ92egpkFDWkG87w/QuzT786CDxWbl+tlxqe5At0FN1e
	zIO6SvAKDn5tcXAXxnPxviw+Wm1hpRMW/nQ9KDvPAk0Exn4+SitqAIlPletRtoSu
	LroMKfza6zKoqzA7Z5weihhVRoM10iUMSyN/Nv6IFeEUOFngEYBcabat89HcdDKj
	/D+PSilSmxpv9CsSZcISXxaZtGElFVCRddbl438mI3XRqyltKV9VWcViEg800JLO
	LVU/3IhvDe1BV11Hsc171UKYYOsfwDO50h3836KUro52cOF5dPMPzGLeaPXtRXEi
	qmk+0CTnQoetyd8WnSs/yw==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2094.outbound.protection.outlook.com [40.107.243.94])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 47r0pjrrx4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Jul 2025 07:42:06 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H+TEpVSCdKQpvk0/M+dlnpuVFme3Ko9h3oYLCxJtVzwDj0WWF7rwDBdwrvd0VBTX8ZkTzYjTudSXYrDeQU0DXEOm9/lcRhXMQdYoAGqaMBByT3N3cs+7d4p3pQOlG3l5h2mNXDVa0AJBtdRkEAJ5W7hvaSOBe8eT/AGksvHdl860rq0U16mzmBj8Rma+bKM0vVbi2WRFWjVNXf+fNMmrR/sZSOMvkqDIcsVpQpoNZpvz51UqhJUnw9exD6De/nWKEmQL0xqRL3Bi+xLfi9OLERc08gMX0b+x54+GYKV5bakkGr+B4klyfSXcg+ceC67DDV57z2wU1CrX4Cldp4PVrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XnPoHa5j+osFY6W54+FWwDUmw+ReGMPrzHRFJjmIcxc=;
 b=loJXJxa36HOXNKrSMAj+KKtMXxfoGw2baJsjJ0J+ymT6Ah0IuAsssbG0PVLEhP0d8adbEc9uG5oEWYLsCJjujUTwrCMvQxRqxKwyZYhMg2TP6cX2AA+82wsk7Px0H6HZXWEooAfmM+6oFWsiszC+pU8nOpii+KhP+cyaU1kBrcyJ741q3yRxqwZJd7K/5EscY/ge2rsjzlfSJ/YRJDBcoxgiNarZiKVu84PEan+T3sWDjEoiI6U9MYOSlLQR8d4dxVmcv4Dog+R9Tml1OpwF88fSr6JxTzNma+pu2AWFj+OPwzgReURbBNLn8ykHe2iLAnfzbiDRe+9PZJ0fMg11nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XnPoHa5j+osFY6W54+FWwDUmw+ReGMPrzHRFJjmIcxc=;
 b=C05m5g0L9NVpMF04Mz1HbeiTuexVNw0NrSOxpJ8WJTWOIPb8xxn5nn6QhrdWqxCmMWJ5R7Cq/TEdV0qR7Fdr3MmEJKhwsvDwUqptqfGs1E80s0fD6Mq/bCpfcET+054GFDY6vki/QZ7xgcMTOsP4kcanfkEoklqAeMzCyEvhl/g=
Received: from BYAPR11CA0068.namprd11.prod.outlook.com (2603:10b6:a03:80::45)
 by MW4PR19MB6675.namprd19.prod.outlook.com (2603:10b6:303:20f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Mon, 7 Jul
 2025 12:42:04 +0000
Received: from SJ1PEPF000023CD.namprd02.prod.outlook.com
 (2603:10b6:a03:80:cafe::94) by BYAPR11CA0068.outlook.office365.com
 (2603:10b6:a03:80::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.27 via Frontend Transport; Mon,
 7 Jul 2025 12:42:04 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000023CD.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.20
 via Frontend Transport; Mon, 7 Jul 2025 12:42:03 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C0420406559;
	Mon,  7 Jul 2025 12:41:59 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A8BF582024B;
	Mon,  7 Jul 2025 12:41:59 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org
Subject: [PATCH 6/7] ASoC: SDCA: Add a helper to get the SoundWire port number
Date: Mon,  7 Jul 2025 13:41:54 +0100
Message-Id: <20250707124155.2596744-7-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250707124155.2596744-1-ckeepax@opensource.cirrus.com>
References: <20250707124155.2596744-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CD:EE_|MW4PR19MB6675:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d687b35b-2641-4890-7e00-08ddbd53ad03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?B9wn647OZXVTT5jnaiGKdU3QAlHnbh22RJIlbBdKWUgstFSH/RoZH85Nq4K1?=
 =?us-ascii?Q?JULPx0c32n47gVf+THa1Y4AgwZ8jcDIS9PHHO3Kno1ayeuBedkee3XlaltRM?=
 =?us-ascii?Q?QvKwYKq+jJ7ATvZjsM2chbmo716LcwAet9y+Kcg8N+BRYK251U2Nrnm2lTwU?=
 =?us-ascii?Q?TMYH0fiqJUZffkApS26WR0hFGM/ZXpWw2F3aO2QOKMuYzMe/ikrP6QjvZAsq?=
 =?us-ascii?Q?jo5aHKRJRIiHvVqa3MRkOfnZh8jVsRTQSzwtPqSdKG7QsqYrqvZqf/OajPjT?=
 =?us-ascii?Q?mCb3EbY1r31X2xEVmeju47Wx9pbtJYkvxlOJuExutXB+HKYXzUcKfcAkxGvr?=
 =?us-ascii?Q?u9YFqMykmL+xBfWMJwKfa9qzSyl2JvHrkopABmi9L2mNLIZk3NtzfeSiyoUP?=
 =?us-ascii?Q?2zNujRNy5euBDb2K3MNzoIlOFq9dsAvA2JQYAcyVx29SmxsIOyPGFia5ahhZ?=
 =?us-ascii?Q?rElw954KSG9GqDWM0k6IyqUYM++rXW1yTu1te+kiBaY6hKkIZh3bptAL59iB?=
 =?us-ascii?Q?EXZ0I4upNdpMCK7eBQHnNrALmIgFG4YoaxbriY6UHhrLVAert/6jQVQYxlFV?=
 =?us-ascii?Q?TAJfoDZPkIdbkEND8cdNNzmDnGXjaSwHohHDMei6+WBClw2HffJHsE+7iT3O?=
 =?us-ascii?Q?jFegfUPWKEtbS5+n3zS5C3M/1l0v3SgmsUXUQ8Ul4azmPIHgO7u4nylFq/7L?=
 =?us-ascii?Q?kwU5xwJBKWm3HB0PyJS96qa2YSKufX9qLTqpTryBGRjWBJVSQYMuIToXBuM+?=
 =?us-ascii?Q?jT++d8hXnf6M0ERw89XhNqKAbTp8zDJOuhms1sZCtFWoY8u2mwTL9+TpI8lT?=
 =?us-ascii?Q?hX73c4TT36bHVVhd1qaGoheMW/HRV1jTfh8uFelHbV5AATpI1pMBsbLIVCEQ?=
 =?us-ascii?Q?Byfa2fGYY9oqCm8DqdoL2tojI7BYG3QsWfHfgC40V3l8bIejeSzDSYVIFZms?=
 =?us-ascii?Q?i+zEWjh7HKR6dB1lizlEVP0NL+EHydK2GKUSad84ucYd1z7shmbW9FDwrsjG?=
 =?us-ascii?Q?lMAG/He2aYkQoMz8d+Br+slpoZWQ7fZEqOkHgkRWnvyhrkUqdSvd7efgNVCp?=
 =?us-ascii?Q?ahrW10EfnxX2Adm2Hf6CV+uoBf7MWokhCuodUjT4W/ZcbrpQL9im/j4hqRfO?=
 =?us-ascii?Q?zCiljOoR69k/1NHSuGpRQQE4GnYY388/PQredLf7l5oyBMjpze6WR6LITNXP?=
 =?us-ascii?Q?CwJIGCkdT9IkzVM2aGYSHv9pqC+waHLrUDHp0XXxCTI/eE30T11lo04RAenT?=
 =?us-ascii?Q?WLpHnLZ2j6g2YuWfThjLZOMw4YjrKgRte0grsne2rlffARsq6OXnz4N+inDZ?=
 =?us-ascii?Q?QZyLPmtQgzojDQYi/kwqGphx0JCE2QzbQKsZiBkB/ZeXzdIYLl6+8+ImQy7E?=
 =?us-ascii?Q?Tf1IupOBZbZYEgb3s25eDQxj+cilr9sF6GRy6ZRGwDMgstJ2k8WWIMGUb23u?=
 =?us-ascii?Q?2zN8DwHHtbTbdZpP1k1brW45MZhIhbAHY7rKjmSGxgVgVfsn/U42C20k6Rhl?=
 =?us-ascii?Q?yhG+JN4WQdoN8EFvIQ5OtPjIe/abttoe+jpk?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 12:42:03.5748
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d687b35b-2641-4890-7e00-08ddbd53ad03
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CD.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR19MB6675
X-Proofpoint-ORIG-GUID: 9kd4Ud-FOsxo1SUHfAV7XpBDSCoP7PTa
X-Authority-Analysis: v=2.4 cv=dtDbC0g4 c=1 sm=1 tr=0 ts=686bc09e cx=c_pps a=FCOXCyludURfuBFcoab/Yw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=Wb1JkmetP80A:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=p0OGwvij_UMtKTEoj1wA:9
X-Proofpoint-GUID: 9kd4Ud-FOsxo1SUHfAV7XpBDSCoP7PTa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA3NCBTYWx0ZWRfX/ast/L7v8Q46 kknHc7ehEhQ86kmhsX5FQ5VMahQJ3uPeP21NW4Ryv1lBB3sSKUK+5I5VYobNxSYNm9+7VDmPQgH kS4Gb1ExbfR6O+I7/vKJisTH0FEGG31E3/9mRQ9n2SEMEoijqjEPStNIkwPF6WT8r8EZ4qBXdeV
 HeV3cqH1EZdeyP9qiyiCuMIeOu+XwJv2g3T3PCm/Y5j/hUcdYMZ2+/tqCt150kkbg5+77o17ms2 FCxt0qWCgETeI9hg9Q+ZqYtJnvUB0kZ+JqiCLXSPen4uaW8PepZIviY3mLWDwOIwbPKIUOS7LIy Gn9ZeyzXmpoG1AjiC4dNyQG2YRWiMd2kY1UuEmI25kqYMblXfS0fTE2bRVVdLdjthTOvqaNVFAC
 Av/CCncIK+ucNv4tqlecB/LhP4KexGXoETbZ6Nm4x7yeCRtt4GsRW6b0EGBXyUQfIZyTODAR
X-Proofpoint-Spam-Reason: safe

Add a helper function to extract the SoundWire hardware port number
from the SDCA DataPort Selector Control. Typically this would be
called from hw_params() and used to call sdw_stream_add_slave().

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/sdca_asoc.h     |  3 ++
 include/sound/sdca_function.h |  8 ++++
 sound/soc/sdca/sdca_asoc.c    | 75 +++++++++++++++++++++++++++++++++++
 3 files changed, 86 insertions(+)

diff --git a/include/sound/sdca_asoc.h b/include/sound/sdca_asoc.h
index bbf146e4fcea..800a26adcd8e 100644
--- a/include/sound/sdca_asoc.h
+++ b/include/sound/sdca_asoc.h
@@ -48,5 +48,8 @@ int sdca_asoc_set_constraints(struct device *dev, struct regmap *regmap,
 			      struct snd_soc_dai *dai);
 void sdca_asoc_free_constraints(struct snd_pcm_substream *substream,
 				struct snd_soc_dai *dai);
+int sdca_asoc_get_port(struct device *dev, struct regmap *regmap,
+		       struct sdca_function_data *function,
+		       struct snd_soc_dai *dai);
 
 #endif // __SDCA_ASOC_H__
diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index 3bde07409bf3..90d77fc46416 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -185,6 +185,14 @@ enum sdca_usage_range {
 	SDCA_USAGE_NCOLS				= 7,
 };
 
+/**
+ * enum sdca_dataport_selector_range - Column definitions for DataPort_Selector
+ */
+enum sdca_dataport_selector_range {
+	SDCA_DATAPORT_SELECTOR_NCOLS			= 16,
+	SDCA_DATAPORT_SELECTOR_NROWS			= 4,
+};
+
 /**
  * enum sdca_mu_controls - SDCA Controls for Mixer Unit
  *
diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index 1a0149287584..03c663413cc9 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -19,6 +19,7 @@
 #include <linux/regmap.h>
 #include <linux/soundwire/sdw_registers.h>
 #include <linux/string_helpers.h>
+#include <linux/types.h>
 #include <sound/control.h>
 #include <sound/pcm.h>
 #include <sound/sdca.h>
@@ -1368,3 +1369,77 @@ void sdca_asoc_free_constraints(struct snd_pcm_substream *substream,
 	kfree(constraint);
 }
 EXPORT_SYMBOL_NS(sdca_asoc_free_constraints, "SND_SOC_SDCA");
+
+/**
+ * sdca_asoc_get_port - return SoundWire port for a DAI
+ * @dev: Pointer to the device, used for error messages.
+ * @regmap: Pointer to the Function register map.
+ * @function: Pointer to the Function information.
+ * @dai: Pointer to the ASoC DAI.
+ *
+ * Typically called from hw_params().
+ *
+ * Return: Returns a positive port number on success, and a negative error
+ * code on failure.
+ */
+int sdca_asoc_get_port(struct device *dev, struct regmap *regmap,
+		       struct sdca_function_data *function,
+		       struct snd_soc_dai *dai)
+{
+	struct sdca_entity *entity = &function->entities[dai->id];
+	struct sdca_control_range *range;
+	unsigned int reg, val;
+	int sel = -EINVAL;
+	int i, ret;
+
+	switch (entity->type) {
+	case SDCA_ENTITY_TYPE_IT:
+		sel = SDCA_CTL_IT_DATAPORT_SELECTOR;
+		break;
+	case SDCA_ENTITY_TYPE_OT:
+		sel = SDCA_CTL_OT_DATAPORT_SELECTOR;
+		break;
+	default:
+		break;
+	}
+
+	if (sel < 0 || !entity->iot.is_dataport) {
+		dev_err(dev, "%s: port number only available for dataports\n",
+			entity->label);
+		return -EINVAL;
+	}
+
+	range = sdca_selector_find_range(dev, entity, sel, SDCA_DATAPORT_SELECTOR_NCOLS,
+					 SDCA_DATAPORT_SELECTOR_NROWS);
+	if (!range)
+		return -EINVAL;
+
+	reg = SDW_SDCA_CTL(function->desc->adr, entity->id, sel, 0);
+
+	ret = regmap_read(regmap, reg, &val);
+	if (ret) {
+		dev_err(dev, "%s: failed to read dataport selector: %d\n",
+			entity->label, ret);
+		return ret;
+	}
+
+	for (i = 0; i < range->rows; i++) {
+		static const u8 port_mask = 0xF;
+
+		sel = sdca_range(range, val & port_mask, i);
+
+		/*
+		 * FIXME: Currently only a single dataport is supported, so
+		 * return the first one found, technically up to 4 dataports
+		 * could be linked, but this is not yet supported.
+		 */
+		if (sel != 0xFF)
+			return sel;
+
+		val >>= hweight8(port_mask);
+	}
+
+	dev_err(dev, "%s: no dataport found\n", entity->label);
+	return -ENODEV;
+}
+EXPORT_SYMBOL_NS(sdca_asoc_get_port, "SND_SOC_SDCA");
-- 
2.39.5

