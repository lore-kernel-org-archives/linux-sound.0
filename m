Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E052EB849
	for <linux-sound@vger.kernel.org>; Fri, 12 Sep 2025 10:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757673344; cv=fail; b=B4zY1ULl0VAO7DMTei8NkvX8KiFTJeKehqrgYHIELmz/06RfZXv9+z3o9v5CGPNHrZYHJFXJ3L5bZe36Rmi3ZE0lwk+J2pEXRb2SCVLqXlmvTLx40NzGIUYJDyi3pRpFfLiJujQZbhK04CHXKKVomwQhR8sK/HOH+NQWpe2dgfM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757673344; c=relaxed/simple;
	bh=Yn5CVm2RGvbBaDebCWFQKq2om5wxdCkddC+gLoYKu5c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uEJA96ZYTxWxg6RWYgvn4BAYFxUCcIw/UrzYUlRUAK1Xrg/k3GzrBcBlbLdyWSg1t6suCGaLEtsTB+ZROwC8dRAIOCrOj5JGSRKVdON7F0plrlvXoDaT4qOVZNa8x4Nz09QhYlXEnnr0zVNlQGSh6qnxEfhS/JaANXRaxKSmgkM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=kzqpAfvA; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=U4R8pmPo; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="kzqpAfvA";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="U4R8pmPo"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58C7QEbi3763904;
	Fri, 12 Sep 2025 05:35:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=rnqrTLE/w4Dlg+I2gp5nKuPbkYtPtVHlLgbM5Mb1lwQ=; b=
	kzqpAfvAygSrywquX1DxhyqDXqey2lvGOGXl87vjjlYPyLPoYzVNF/cYdPItS2ox
	nPYDTUEZPsFrkP/h5OGBUiKFLvSMwyR73jvv207Tc7oEbzamtlW9+DwTLBR6AB9b
	U45Kw6OUor3iWou3nkErn+2vLYOi/sCleVJMSmg6bpeVTSjP+qhdcKbf0S1arYXz
	Cx28KXgS4ZmbcL3k69nhUdhhoC2TEhljgT4oKKtl8bzS97sstN4H/Cot2Os+3b5j
	dt2XvULFKnrrasq73Yh8FLAU0Srga9ar6BQjWCD8rbgd+hWcAI9+0KKVRUP6awbv
	kbMq70GbwrT3bI8jkhRHyg==
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04on2129.outbound.protection.outlook.com [40.107.102.129])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 494due08yf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 05:35:18 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RTCKe2DPbBCayr4g3pIOvad9zUr7br7Joy0vSWYGEYMzYnwvzxgoDYJR/JJ5IHserC4TCxtVRSfjox4LGmQ+X7ubJ4NvwS5foFWm0mBPjF8fxpMKehcvtF5PNG5L/vbpLjPhksny23CyPuH+dsYYLSyZP0EIeORm9b7UoykKsssJnkC4tTwu4J5ssr7zSnSVC667gXNzKrukB7YWgLnc1j53YpG0W1b5XS3ZYY4I4lpv1azFbV8J7HQjgevhYxgOQNhYZytEiNGtIOArfmUi0pgcEURi+yAd8BEi+MG5wkQ+S1hVAyPN9i4S8hBdDiohsKi6Jq/bPQJ22nLv4jqQNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rnqrTLE/w4Dlg+I2gp5nKuPbkYtPtVHlLgbM5Mb1lwQ=;
 b=MHJJ2MqIwIDLMBY6rtPPdd+a0VXWOHTBLd+oFS4G4aM01NveJXGQHTEc3kq713QrPSMMDMBkY2yV5cXA+WF8yAYUhugqI2uFdltmfvoTJO2FjbHrinozKE2SiQKlecre/BB4E7TUXPbITOJHVJJr4JZ5zhvO/vpO64QgZn5h2MQ6ZgEz8EARMloDUp54mmya2z89tm8xMojaHT/Mf/wO3HII0M8D03boez9ACHazr3k/6IBdwNOr68wCwaJZlw4p3KJmv4WzJjWGGwaXPyLNF4LfW3shVKehFqJ9YPsCR9kT/XRosJ/sQ4SHytf+y0K6uwc3p8Knq1RV88hMDomFdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rnqrTLE/w4Dlg+I2gp5nKuPbkYtPtVHlLgbM5Mb1lwQ=;
 b=U4R8pmPoIEHPWvUgjvYMDxKbiVfiXxgPQw0yCEYluYqOx9K0hElqdn9Zxo8tuHeid5GLW9BB3Hsk9f3my6ZChlwRjXUbWHJbJakjmn4rMAahcEZIlvVduYhu2G0Q3ordrHqucPT9HSl4uc+oonEMOVVHSe0by/XlWWmDdZ+Gl9I=
Received: from SJ0PR05CA0102.namprd05.prod.outlook.com (2603:10b6:a03:334::17)
 by MW3PR19MB4267.namprd19.prod.outlook.com (2603:10b6:303:43::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.18; Fri, 12 Sep
 2025 10:35:14 +0000
Received: from CY4PEPF0000E9D8.namprd05.prod.outlook.com
 (2603:10b6:a03:334:cafe::36) by SJ0PR05CA0102.outlook.office365.com
 (2603:10b6:a03:334::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.7 via Frontend Transport; Fri,
 12 Sep 2025 10:35:14 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000E9D8.mail.protection.outlook.com (10.167.241.71) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.13
 via Frontend Transport; Fri, 12 Sep 2025 10:35:14 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4B9BD406568;
	Fri, 12 Sep 2025 10:35:08 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 4357A822548;
	Fri, 12 Sep 2025 10:35:08 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 16/19] ASoC: SDCA: Add completion for FDL start and stop
Date: Fri, 12 Sep 2025 11:35:01 +0100
Message-ID: <20250912103504.2679226-17-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D8:EE_|MW3PR19MB4267:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 44049343-d09b-4689-8050-08ddf1e80f0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JK2YhuApM8kmhhmNwjCR1QCloLu3uFKdP2cOSqccZhQucfnrk5jELPjS5w2Y?=
 =?us-ascii?Q?ZDyQkLA7mnekc224toaTKD0Wnp6NBHrx4jixzh4VkEnpov1h/W7vtd7m/wOz?=
 =?us-ascii?Q?dPbeLXRHWs1WyqcTVvnXarMS7njEAfVsKl+gAJSJmU0fI4CPmUmtovd4ffI/?=
 =?us-ascii?Q?qGiCLFsnWkfpXEfDWPEkc01z1z9kjWGiqa4qcRwUPU2X8sDW0jBOgxt2UmyL?=
 =?us-ascii?Q?sXTZ0e4SXKas2EecuwldOsqRbop8gJwSm0MkbC38DiSus4f/SbeTg3Yunhs1?=
 =?us-ascii?Q?uqISkrcj8jl+H9+4q+I5d6vV3OgaNHJiIIgV0BdqbIErDmKbOuC9/FbLeeVJ?=
 =?us-ascii?Q?Uni0yLUS/NjT2TmnvZwDPuqD1ssy8vlLza9/tAqXQos6fOeATNAQ77O/xLnR?=
 =?us-ascii?Q?gdC7I+dsej2AFnbk1ObYM/iutwcljx+ja5j3nNIBTSMRA6eKpWYR2NpYWHkU?=
 =?us-ascii?Q?oYQbN1xb3F8UolkqnrAkD92wnWz0tXkagbe0OyL+gU8wF3PofPbqUwlKvHJZ?=
 =?us-ascii?Q?YTja9Jz1tHm8zuXUH8PoDwqOr9dUQJkuAWSOHcFibfK/EoCZQ418h298HUvr?=
 =?us-ascii?Q?buY3ZuIHRrc/3RDXF4yrM9v9t+1Gn3yz0GRoyfY7l4KE84iiNuegVzFStUUf?=
 =?us-ascii?Q?UJG0KGvdzVgRw4Grn4RndsYOkvoq489x24zTulY5X5nnrHRMB/+fmL0izOuV?=
 =?us-ascii?Q?Qwu5DfAnJ9leGJDqck7mstSwjNuWanxgJqYr/RR4LeJfHOVCTutieP95B5aa?=
 =?us-ascii?Q?bj7F5eouc+QYNXluI9wZLdxx5D3Y8RWoFH+3bMcq2xoUl4ZhN6AVVH8Y1wz9?=
 =?us-ascii?Q?6oHB1nglwxNI3bx+iFbQi6WI3W2VUkH7EpJwNKS9SnVGsKhjENyzj1+o3JH7?=
 =?us-ascii?Q?bF/UREhCBZWep1cQCZxu5rnj8eSQzqOz49mvqOtEpcs2pvxeNP2VGGVuf0Wh?=
 =?us-ascii?Q?kqIyMs/6tX8SKuJFh/KAsrVdoOF2OOYXRZi/ZHfIlBDYTXPT3JLAyYXwnmG+?=
 =?us-ascii?Q?35IeWjTOy94k1pz2x2NpKNbTTzW9YY0RXCAxeErOI0IDKqTD54tWCB2tDFpG?=
 =?us-ascii?Q?u3ECBLeMjUeTVkEexXMnBDKSE3csMwy782UNdSZTdWR9LM+L4sAk0eNDhP1z?=
 =?us-ascii?Q?BC16UZhJCyqQqjJT6M3yOOnuHtK0wz3TtnVFsQ6H9Zs5eu2Aw3GHs/VZjlL3?=
 =?us-ascii?Q?8tN2Buuij3hT4fqDq17/97uI8Q6rTbtKCj2mbG2jG/pwJRM+f4t3Zw7N1pbD?=
 =?us-ascii?Q?4m5RfnkxraY9eaJM5RG5ivSJnK4nPP4p1hETPMLAZerbinkGUVnKoOVyphnY?=
 =?us-ascii?Q?u5OajsGD0dzBEyVMRYS5SIap0CBzzBJk1Do+4ljvm2Rav06WAXhIkVtqbVaj?=
 =?us-ascii?Q?H4sPQnAjV4dzdcQbsHvmLEZ/JJ/KWIM2sXFhMb5o0MJY4AEwNYy9CvBn+PH7?=
 =?us-ascii?Q?HvjjFvFkZRiF+6CBzORH5yxGM7vcfdNN8kvqr4j6uVwqfwlmA3Bfo3VFej2S?=
 =?us-ascii?Q?F/U/+wPFQn5Dzhwm2L5k2DfuzH2qX0cGYWhu?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 10:35:14.0667
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44049343-d09b-4689-8050-08ddf1e80f0a
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000E9D8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR19MB4267
X-Proofpoint-ORIG-GUID: gM5GYWcOBYC-MIR92qLK1uuopfoA44cy
X-Authority-Analysis: v=2.4 cv=F9NXdrhN c=1 sm=1 tr=0 ts=68c3f766 cx=c_pps
 a=dMUWVMdjlbIWyjQ5UC6y6Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8
 a=8ToN6VyAo-4Z1emjpr8A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEyMDA5OSBTYWx0ZWRfX+j2aQLj37WrE
 0tYU318zhRhlVYElx/PVD7EdqXUpvyH0mA50kW4MD8ndk+Kuy69oP+suKOCuCLp5KEj2rkNZr+c
 p86/BvOpTD/6oCKQjrR/cQwae506fbmaq2aw1aWEinNk/QopRFlYTrUEZ1AGl1T/z17DFKztpL3
 kAGKfm/5rt0uvlD0/P048CkN8SwoWGRUotLrJhns1LpqAt5Lci7vEtupZ7SK8IZhYe50ZxKJ7CA
 aVie48F5hltLH4GIaHOnlFA+vrHmg0J0mkZp5P4uFoMntcHV/PDwCtMZd9q0rFSbKgKwh8t/249
 3t9G79AwT2uZyIthjOu4glH8lSkrLKbFZ7Q4JycTKHKEYARiRMAjLhT0LyhgeA=
X-Proofpoint-GUID: gM5GYWcOBYC-MIR92qLK1uuopfoA44cy
X-Proofpoint-Spam-Reason: safe

Add some completions and a helper function to allow other parts of the
system to wait for FDL to complete. The sdca_fdl_sync() function will
wait until it completes a full time out without a new FDL request
happening, this ensures that even parts requiring multiple rounds of FDL
should be fully downloaded before the driver boot continues.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v1:
 - Added a limit to the number of times it will attempt FDL
 - Split the time outs such that a shorter timeout is used whilst
   waiting for FDL to start and a longer one for it to complete.

 include/sound/sdca_fdl.h  | 10 ++++++
 sound/soc/sdca/sdca_fdl.c | 75 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 85 insertions(+)

diff --git a/include/sound/sdca_fdl.h b/include/sound/sdca_fdl.h
index 8b025aff4a0c..4ea000d6acef 100644
--- a/include/sound/sdca_fdl.h
+++ b/include/sound/sdca_fdl.h
@@ -10,18 +10,26 @@
 #ifndef __SDCA_FDL_H__
 #define __SDCA_FDL_H__
 
+#include <linux/completion.h>
+
 struct device;
 struct regmap;
 struct sdca_fdl_set;
 struct sdca_function_data;
 struct sdca_interrupt;
+struct sdca_interrupt_info;
 
 /**
  * struct fdl_state - FDL state structure to keep data between interrupts
+ * @begin: Completion indicating the start of an FDL download cycle.
+ * @done: Completion indicating the end of an FDL download cycle.
  * @set: Pointer to the FDL set currently being downloaded.
  * @file_index: Index of the current file being processed.
  */
 struct fdl_state {
+	struct completion begin;
+	struct completion done;
+
 	struct sdca_fdl_set *set;
 	int file_index;
 };
@@ -51,6 +59,8 @@ struct fdl_state {
 
 int sdca_fdl_alloc_state(struct sdca_interrupt *interrupt);
 int sdca_fdl_process(struct sdca_interrupt *interrupt);
+int sdca_fdl_sync(struct device *dev, struct sdca_function_data *function,
+		  struct sdca_interrupt_info *info);
 
 int sdca_reset_function(struct device *dev, struct sdca_function_data *function,
 			struct regmap *regmap);
diff --git a/sound/soc/sdca/sdca_fdl.c b/sound/soc/sdca/sdca_fdl.c
index 3bcc89980908..f63ac4631e28 100644
--- a/sound/soc/sdca/sdca_fdl.c
+++ b/sound/soc/sdca/sdca_fdl.c
@@ -14,6 +14,7 @@
 #include <linux/firmware.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/sprintf.h>
 #include <linux/soundwire/sdw.h>
@@ -63,6 +64,71 @@ int sdca_reset_function(struct device *dev, struct sdca_function_data *function,
 }
 EXPORT_SYMBOL_NS(sdca_reset_function, "SND_SOC_SDCA");
 
+/**
+ * sdca_fdl_sync - wait for a function to finish FDL
+ * @dev: Device pointer for error messages.
+ * @function: Pointer to the SDCA Function.
+ * @info: Pointer to the SDCA interrupt info for this device.
+ *
+ * Return: Zero on success or a negative error code.
+ */
+int sdca_fdl_sync(struct device *dev, struct sdca_function_data *function,
+		  struct sdca_interrupt_info *info)
+{
+	static const int max_fdls = 10;
+	unsigned long begin_timeout = msecs_to_jiffies(100);
+	unsigned long done_timeout = msecs_to_jiffies(4000);
+	int nfdl;
+	int i, j;
+
+	for (i = 0; i < max_fdls; i++) {
+		nfdl = 0;
+
+		for (j = 0; j < SDCA_MAX_INTERRUPTS; j++) {
+			struct sdca_interrupt *interrupt = &info->irqs[j];
+			struct fdl_state *fdl_state;
+			unsigned long time;
+
+			if (interrupt->function != function ||
+			    !interrupt->entity || !interrupt->control ||
+			    interrupt->entity->type != SDCA_ENTITY_TYPE_XU ||
+			    interrupt->control->sel != SDCA_CTL_XU_FDL_CURRENTOWNER)
+				continue;
+
+			fdl_state = interrupt->priv;
+			nfdl++;
+
+			/*
+			 * Looking for timeout without any new FDL requests
+			 * to imply the device has completed initial
+			 * firmware setup. Alas the specification doesn't
+			 * have any mechanism to detect this.
+			 */
+			time = wait_for_completion_timeout(&fdl_state->begin,
+							   begin_timeout);
+			if (!time) {
+				dev_dbg(dev, "no new FDL starts\n");
+				nfdl--;
+				continue;
+			}
+
+			time = wait_for_completion_timeout(&fdl_state->done,
+							   done_timeout);
+			if (!time) {
+				dev_err(dev, "timed out waiting for FDL to complete\n");
+				return -ETIMEDOUT;
+			}
+		}
+
+		if (!nfdl)
+			return 0;
+	}
+
+	dev_err(dev, "too many FDL quests\n");
+	return -ETIMEDOUT;
+}
+EXPORT_SYMBOL_NS_GPL(sdca_fdl_sync, "SND_SOC_SDCA");
+
 static char *fdl_get_sku_filename(struct device *dev,
 				  struct sdca_fdl_file *fdl_file)
 {
@@ -225,6 +291,9 @@ static void fdl_end(struct sdca_interrupt *interrupt)
 
 	fdl_state->set = NULL;
 
+	pm_runtime_put(interrupt->dev);
+	complete(&fdl_state->done);
+
 	dev_dbg(interrupt->dev, "completed FDL process\n");
 }
 
@@ -238,6 +307,9 @@ static unsigned int fdl_status_process(struct sdca_interrupt *interrupt,
 	case SDCA_CTL_XU_FDLD_NEEDS_SET:
 		dev_dbg(interrupt->dev, "starting FDL process...\n");
 
+		pm_runtime_get(interrupt->dev);
+		complete(&fdl_state->begin);
+
 		fdl_state->file_index = 0;
 		fdl_state->set = fdl_get_set(interrupt);
 		fallthrough;
@@ -363,6 +435,9 @@ int sdca_fdl_alloc_state(struct sdca_interrupt *interrupt)
 	if (!fdl_state)
 		return -ENOMEM;
 
+	init_completion(&fdl_state->begin);
+	init_completion(&fdl_state->done);
+
 	interrupt->priv = fdl_state;
 
 	return 0;
-- 
2.47.3

