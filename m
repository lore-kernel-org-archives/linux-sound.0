Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAEF35FC12
	for <linux-sound@vger.kernel.org>; Fri,  5 Sep 2025 14:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757082728; cv=fail; b=uR5ZVtqczHCRP7O0YTr4/Tej2uQfozoPT/3RA1GP2hRJQAaloQ5NK/R60AdyuiMCx4crVzdivh3YBDys2TT2bxfG2hZO7n7rmlclP+guaB1h9CnHeLxu+pZ1NGYh2Es7GItCS7u9aoOp9oI5mtT6pmWDVxZvecvX2iLPgMrm/Ro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757082728; c=relaxed/simple;
	bh=LO0aH4j0Yz44fL5wk8f8YXzeMD61lmZvDu49J+WIx5o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ETJjvHxDXEnUfVfOZ0Hjpxcn7sK98Cikiv4wdQXAHNE2KQ3E2MBo+Z8TAi9LocYmrLILsqXPAkiQVROmqFtSPKsKJc/UCWe1pkz9qmXsiHK8aIP+cJeJIOG2fjzpQHfrufPbo76XiQsvJVWCtj27pFrtjE/LRqeLQcDMrvzaSfI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=XH15GcDe; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ENn6POFs; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="XH15GcDe";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ENn6POFs"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5856KPYw1451153;
	Fri, 5 Sep 2025 09:31:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=wgX8+xF1MzWZum8gxiAvsrWSH0J39ieyjfCiBOiuO3Q=; b=
	XH15GcDeiblUrTI7urPLfgMa+DNlILqHNdlMTUmi+vKmPlYDqYHzpZRGGR9oeTOy
	5dAxGnuSrNGQV5pKxH1OeEP8abhVWOGqNMv78CadXRKhqQvyRcHmtyVl1eLoAN44
	awIof7/0VyCRgoBwNvQYjF9ftadva2qYOaUarGb2T7Rbs/Do6wHWRV3Mqod2PWQ2
	CApNjULQsLiM2uR0Itoe3PyPFS9uE6N6KEwERS5X3G9B3UyqhM1VRmVklPKUHGbH
	0+6exL6/2qnvJa5FhBL8RvFmVVa18TbS0Bk3+TiBLmz6/GfHjmDdPoP/f/Tdy2H+
	tiG9AHe+QO5UxzsR0KfPQw==
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04hn2216.outbound.protection.outlook.com [52.100.162.216])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 48vensfsvt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 05 Sep 2025 09:31:39 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nhzWJG2BYm3Zl78A0NqqojetxIJeFvupWsMCWMj6uNLafzc/PqaZxbqKsHYvsB7r19wxfo1CD760X04Clj7Jj9zKGjYLMYApYAsGed6hMfSLhlOYUPJoynXIVeTHHZRs0LZUYdgfZPWPJpp7UzWNtFNgBy0zGtjb7QiM/OrUS9kw0Drs+SMJ8ZglQvjGX08Wf2nqlg443WqXHvHVs7rTuP/S4XGBXnvTze78NmxDJ9YRxcYB0O21OCfezXhZTfL3sW07hCK4Z5an/uADxfvTIrRZYcYsWqCnjV8BQRVrhliNF3jLKuqyWRqdlYcY2eW5L3ltymkurwKyPsufMc73iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wgX8+xF1MzWZum8gxiAvsrWSH0J39ieyjfCiBOiuO3Q=;
 b=wHHDh3L33y4w5oWnpIv+YHSVloGT+PvbuQzR/Bp5gQMT8mfomTDXaApo4yg1w+/X2linUiA3HTfZOm93c3JHWoNaGzJAQaauI83Ph34uVYZNEY0zwqXStuwVsJ4kdZ8c13Og4vqdAXmlqKjydaJa+QAITLhsGgxZkY2tu+IybuudOY9aJr2eMw6auC8xBijsuNs8Zs1VP2ioyGDw/wplONYEvqExBfQM16uodv/CzfCTwT6DkCCaMTCoNNTSs8YQvEag/49jy0LdJVQBZWv4+55WQ0jXqsd60u7WcL36hbmrXFIoyiCHLAYG0jpTGvQAkDazZQcDqxuliGiaegth1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wgX8+xF1MzWZum8gxiAvsrWSH0J39ieyjfCiBOiuO3Q=;
 b=ENn6POFsW9ml/IJkz4uzfsLWQF1o3FdOB57AeFGcKTzjtPwB6SLLJqZkrlOb9xC5peuthBXetWQFhU9BSdZACifMXArph2tfUHpd5tLiT5ketWViIiVx8zZSe7kbfDA/BZKzidHi2UWkDBMauNynUPd9GbcXLGjKJoUIoLT7C2Q=
Received: from SA1P222CA0049.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2d0::26)
 by CH3PR19MB7683.namprd19.prod.outlook.com (2603:10b6:610:12f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Fri, 5 Sep
 2025 14:31:36 +0000
Received: from SA2PEPF00003AE8.namprd02.prod.outlook.com
 (2603:10b6:806:2d0:cafe::e) by SA1P222CA0049.outlook.office365.com
 (2603:10b6:806:2d0::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.21 via Frontend Transport; Fri,
 5 Sep 2025 14:31:35 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF00003AE8.mail.protection.outlook.com (10.167.248.8) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.14
 via Frontend Transport; Fri, 5 Sep 2025 14:31:33 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id F401D406562;
	Fri,  5 Sep 2025 14:31:27 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id E2CB082025A;
	Fri,  5 Sep 2025 14:31:27 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 13/15] ASoC: SDCA: Add completion for FDL start and stop
Date: Fri,  5 Sep 2025 15:31:21 +0100
Message-ID: <20250905143123.3038716-14-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE8:EE_|CH3PR19MB7683:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 49e72620-1fcd-4e97-7340-08ddec88e9dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|34020700016|376014|82310400026|61400799027|12100799063;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?u/nivd5r31iU3hx9twTBHCuq38kBfZVdlTQEsdneQbNsQd4prhz9AvcAK0LM?=
 =?us-ascii?Q?ZX+OJDXGZpceNxqvt6HnREKbZnjs0l9cfN+PaVZUzuC2fitB0ebgAnQLjxp1?=
 =?us-ascii?Q?ykED/sYkHphad675dOF+/4xwgrFXIiojyp813iMr2+C4uEY/l0U+5y/YYbvx?=
 =?us-ascii?Q?1q3T9G4IcCtHY0u8V+9BvqgZsAM8Iuw+zJGe3aGeEL1D/SY4HTi5kS6D83NW?=
 =?us-ascii?Q?uLPy4MdlGX+Gxz9m4JfC7Nz5O6xQVo0j2xYLHL/pxSp7N+QqlFCC0Hkyhk/X?=
 =?us-ascii?Q?lu1dAk6dELqq+HvqY4durU1s5Z/FPgGhdH1fTLOBxZ8mTnsvcsjsr3WCNrJ5?=
 =?us-ascii?Q?ErkwN9vfin0QANEwMChVh6uL8n/vZcymanTSS/jbx0oQ0ksEyd4VUy5hxpKw?=
 =?us-ascii?Q?m0lWP0TXEWGuiLDxClH1p8e8T5TnhhZLHVCHzDeyTW3k0YOksiprurUXSPMZ?=
 =?us-ascii?Q?6L3i14k8UzPLpDm/HeXwNX8s0t1+nrYdAw4kO9knzlwqiL9+3qRGpLMd7Hv2?=
 =?us-ascii?Q?10HIP/+PbJUYi6rd5teGDXUDFjpPamJaFApo73n8nPxrW+qWzUMg5WvBigCZ?=
 =?us-ascii?Q?/TSbrNmt6rY8yEn+fU4otJ1a642ovCwERDGHKbM3ZrDHl+hWkXsrluDsd9Pr?=
 =?us-ascii?Q?uJN6Emof6KuWqu3EKLt2qKIkmGG/lsrEGPbYBlCIO3m3/aTYEy0GOF0D8+3G?=
 =?us-ascii?Q?dq78USAgORxErpZKoETzUe86mDprupnwQZFmmhh8qzkOp3gJVCAasy1N+hRU?=
 =?us-ascii?Q?eGguJ9twOy6ZmEaaJOk9Yq3UEB68QwzfMMnto8XNbJeXPkCKyLZhvg2JPO5u?=
 =?us-ascii?Q?6/Wi7Sf9Zo2l4OohyzhIu8m7xXKo6waRmyBq86aSpu9mhV3CbsYneI1P8aHU?=
 =?us-ascii?Q?o2aAytdlrDpZhDEeeuvrw72ISIMyyOywOIOp+ffAoQiBN/PZxYlxPVBBht/H?=
 =?us-ascii?Q?y2Fg0ua2fMThJ/Gy23FuQsqkTmxTeIM6TE0tAEDdrQ/8I6MrhOJKJ7Xgstk9?=
 =?us-ascii?Q?FaYRDWz5CNwDYJhEkxLGl899Zz6V3cqP/UL4O0kwE8u1u2kLEGHFfUn3MIEv?=
 =?us-ascii?Q?EhNhVZk7/FbwGr6/OsKrKuiZFHt8ToCd/HFEUTxAcZxI0HquXknU+Mn441fM?=
 =?us-ascii?Q?he/f3lb7zT61Bxpg4iudHuaG7Ra1CPr32wzFLaPy0w1wqisFQ0UxZaE7zpRv?=
 =?us-ascii?Q?weMAivMoBi6ql8igyrAh0jsZBank4n7nRb0DVmaGCf5O3+8Aqu8QhB3cQxI5?=
 =?us-ascii?Q?+J2dBxcYRK9deFGPYX+LO+aXzeGMvK62wFWHeeQVVG5wLVVk5zPpcjnjWztD?=
 =?us-ascii?Q?tH9yR4U58wbg0C0dlMKAkxeHfb3AI+hcu2LUGFMlKy+rVeVBL/ASioUs0+IH?=
 =?us-ascii?Q?CS4hImvn3StSjbJPccdXeRROGNYxSlBtYPzsm5P+lOBL9pwt9+I9KBhA4pqP?=
 =?us-ascii?Q?LF3MbPgcEnGznPxIMpv/hcAcwBmyXO7vfBn4qeINJwVr8XXbGibImKfBFutc?=
 =?us-ascii?Q?zgNJB2A68KFOKwRybQqHt+x/ASbHrfNGAmYM?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(34020700016)(376014)(82310400026)(61400799027)(12100799063);DIR:OUT;SFP:1501;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 14:31:33.6700
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49e72620-1fcd-4e97-7340-08ddec88e9dc
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00003AE8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR19MB7683
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA1MDE0MiBTYWx0ZWRfXybwe1kQZIdJW
 k+tDuX+KkH25hnehhjerGowbqrzo7/AOgP2bfS/bKxZ1me+Rc0upcLhaBGdEcfEvLbpWjmZ7fvJ
 hYtdtjYebc8WmxoVWF3xMipuAYH5X9EhjISgNEta82WWPnF/SEewE4mCrtUjU+GtFBfouK+zofg
 iptrHYslr+F7brjGt0ecHXXkUgxso9BaQXwWFWTKFGotd7n+tBJrnOkkATK5GsrtzA1XnMmX5Yt
 0V2jtW1FmQBel1xjAQz+QFsxfQgEOBdEIoJhohZsCQHKXOH2pW/Uj4C+C/fKhMQueLV+B4EwudE
 wtsxY0uSOLZS7z+eJl3V0mApz9uGpB1oY7H5jAChKydQ3n5bEiOkSrROIgOLf4=
X-Authority-Analysis: v=2.4 cv=BY/Y0qt2 c=1 sm=1 tr=0 ts=68baf44b cx=c_pps
 a=9kXLUjxxLcveTLXHXUkJdg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8
 a=jMfqyHUko11x-OLNC70A:9 a=jZz-an6Pvt0H8_Yc_ROU:22
X-Proofpoint-GUID: EYUk3bhZTbg89EEmsErPkxoEAnIUyLo0
X-Proofpoint-ORIG-GUID: EYUk3bhZTbg89EEmsErPkxoEAnIUyLo0
X-Proofpoint-Spam-Reason: safe

Add some completions and a helper function to allow other parts of the
system to wait for FDL to complete. The sdca_fdl_sync() function will
wait until it completes a full time out without a new FDL request
happening, this ensures that even parts requiring multiple rounds of FDL
should be fully downloaded before the driver boot continues.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/sdca_entity_xu.h  | 11 ++++++
 sound/soc/sdca/sdca_entity_xu.c | 69 +++++++++++++++++++++++++++++++++
 2 files changed, 80 insertions(+)

diff --git a/include/sound/sdca_entity_xu.h b/include/sound/sdca_entity_xu.h
index 6f2ab0fc905a8..b3fb042cf9ba9 100644
--- a/include/sound/sdca_entity_xu.h
+++ b/include/sound/sdca_entity_xu.h
@@ -10,15 +10,24 @@
 #ifndef __SDCA_ENTITY_XU_H__
 #define __SDCA_ENTITY_XU_H__
 
+#include <linux/completion.h>
+
 struct sdca_fdl_set;
+struct sdca_function_data;
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
@@ -48,5 +57,7 @@ struct fdl_state {
 
 int sdca_fdl_alloc_state(struct sdca_interrupt *interrupt);
 int sdca_fdl_process(struct sdca_interrupt *interrupt);
+int sdca_fdl_sync(struct sdca_function_data *function,
+		  struct sdca_interrupt_info *info);
 
 #endif // __SDCA_ENTITY_XU_H__
diff --git a/sound/soc/sdca/sdca_entity_xu.c b/sound/soc/sdca/sdca_entity_xu.c
index ff7758460edc3..383492d8238a1 100644
--- a/sound/soc/sdca/sdca_entity_xu.c
+++ b/sound/soc/sdca/sdca_entity_xu.c
@@ -14,6 +14,7 @@
 #include <linux/firmware.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/sprintf.h>
 #include <linux/soundwire/sdw.h>
@@ -39,12 +40,74 @@ int sdca_fdl_alloc_state(struct sdca_interrupt *interrupt)
 	if (!fdl_state)
 		return -ENOMEM;
 
+	init_completion(&fdl_state->begin);
+	init_completion(&fdl_state->done);
+
 	interrupt->priv = fdl_state;
 
 	return 0;
 }
 EXPORT_SYMBOL_NS_GPL(sdca_fdl_alloc_state, "SND_SOC_SDCA");
 
+/**
+ * sdca_fdl_sync - wait for a function to finish FDL
+ * @function: Pointer to the SDCA Function.
+ * @info: Pointer to the SDCA interrupt info for this device.
+ *
+ * Return: Zero on success or a negative error code.
+ */
+int sdca_fdl_sync(struct sdca_function_data *function,
+		  struct sdca_interrupt_info *info)
+{
+	unsigned long timeout = msecs_to_jiffies(1000);
+	int nfdl;
+	int i;
+
+	do {
+		nfdl = 0;
+
+		for (i = 0; i < SDCA_MAX_INTERRUPTS; i++) {
+			struct sdca_interrupt *interrupt = &info->irqs[i];
+			struct device *dev = interrupt->dev;
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
+							   timeout);
+			if (!time) {
+				dev_dbg(dev, "no new FDL starts\n");
+				nfdl--;
+				continue;
+			}
+
+			time = wait_for_completion_timeout(&fdl_state->done,
+							   timeout);
+			if (!time) {
+				dev_err(dev, "timed out waiting for FDL to complete\n");
+				return -ETIMEDOUT;
+			}
+		}
+	} while (nfdl);
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(sdca_fdl_sync, "SND_SOC_SDCA");
+
 static char *fdl_get_sku_filename(struct device *dev,
 				  struct sdca_fdl_file *fdl_file)
 {
@@ -207,6 +270,9 @@ static void fdl_end(struct sdca_interrupt *interrupt)
 
 	fdl_state->set = NULL;
 
+	pm_runtime_put(interrupt->dev);
+	complete(&fdl_state->done);
+
 	dev_dbg(interrupt->dev, "completed FDL process\n");
 }
 
@@ -220,6 +286,9 @@ static unsigned int fdl_status_process(struct sdca_interrupt *interrupt,
 	case SDCA_CTL_XU_FDLD_NEEDS_SET:
 		dev_dbg(interrupt->dev, "starting FDL process...\n");
 
+		pm_runtime_get(interrupt->dev);
+		complete(&fdl_state->begin);
+
 		fdl_state->file_index = 0;
 		fdl_state->set = fdl_get_set(interrupt);
 		fallthrough;
-- 
2.47.2

