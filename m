Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FA31D61AA
	for <linux-sound@vger.kernel.org>; Mon,  7 Jul 2025 12:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751892154; cv=fail; b=cDXJGDM7shULjRHd6HxMO2H2/Afaan9wtj41i1XlQVUzhxNjiOu/5mlMudNWxmB0wubYTdyFCQyDxHj+rzcieQ9a67V8SdAFdWsE33Yl1WoZMFjvD3WagYdPBTl1t7ZM8XS1Hypke+qveB2pfC9XR90PqezkyEfmJJswPsgM+VA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751892154; c=relaxed/simple;
	bh=nw6htH0Lx1rw+nf3pUnNilLObGMIlHjET5nvMZzD7oU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qpnpIxAbdjAcDWRRpJXCwRFKo2qIn3ia0L7Z5pFK5Z5PZ6+AqpaUtbVWEnKpCp7FFx2cnBBn8nGKQqb2T2zl8X+FLiaf3xJr2gxBQS0NRlXjEkEsDbgmeI3iCsR23hoxHcC/n1jzDric+ybn3mGIjX14/dWeIUpzR14uk/f9dlA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=HLWQ6STO; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Mb8NtM8p; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="HLWQ6STO";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Mb8NtM8p"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 567BMKto029949;
	Mon, 7 Jul 2025 07:42:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=/2geeWo221D8p8XwJ1oEEgIAB+aU/1x0S5PnOR/6zqw=; b=
	HLWQ6STOaW5q/BQH7AtKcwlVchVJAwHIllqb6Am2rkEdHsSigslz1eksEWdDDItc
	m/3qLkie9ic6Wr7ub9Xh1mgsOQUZRDitOJwl3lxcHxtSLxb1Zm2lWF1f2H5jV69g
	9YRpwGweyu+7mTsZBsQdd14GK0gTJjOEbij82WoXNfuRiO9sFVDm1VTwtXmT3CWL
	9bHivGyo1YHk9n5hX45voXwmdjbl0v4qCBotCKCkuk1bQvaWbMR105L0bDuYbzo7
	n4ZhgzpXZZ6COMqBDGnElxSDLRBMOgGuk7qcSxlpIQdmiU/w46HTPgeogqbp+KrD
	mdxL67W5xiytBliBcOeYrA==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2128.outbound.protection.outlook.com [40.107.220.128])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 47r0pjrrx5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Jul 2025 07:42:07 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MgIIFGbkeG+U7eWiifmjuf/EDMxs2z3gRaSdkCzzX20EV+VMxmiXYzyezEFAn8Nt3LYoeDWMQOeSfZJAVj9JUwUzj3w0LHTj4hK9RmFzr3ZYZx3p960eyy7ZXZDPTJMvrqL5zexy2/LX2g4MUroOVwDwNFBWavpmXCGnQ+bbPy+lWKE7Oxm80k0W5Z9z1VMWiW2xfIYW4HU5B+JrjswxJklic8R9WGSnQhHQXLzfXmofIYnGxXtIWeEwCrkPnfULrYUmV3nctVDOFrGKXZwtXvBV1lZY4F/AHNDcj30JcyLcYQbx6rHnaeUqgQb6Ar4LXCFNUCHJ31/QXG8E8UKhOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/2geeWo221D8p8XwJ1oEEgIAB+aU/1x0S5PnOR/6zqw=;
 b=BmuFQVK2uTq3PIhIJLh/XDIRZpq9CRr8L7XPqH8Z+rdjAkbjiLZYo0Ho75tjQRJDRgSUMp8pon8zmHNBZpsCrbvu4rylzwb/70fGDGXjM6PKqcs+lGzebTSqMyWFGBqOcxuEDWPrX+WKLRp7ERSgZ5KXTQN2eotwtM+1e8ZFcFWB+icth7Ltx062TP84pI3sErESB53qJxYqBMrYJaJwJnPwCKKfOhjUNKxKpVNWQsxalUbA0qlBMguzpAHLs4ux1K4W0H10zEcgrpAQis625yTnIJKf+2IEniq3huxFX1pPYkcqFe0CVkksd6m7NDauPTbT03G7h94X21ethaaN0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/2geeWo221D8p8XwJ1oEEgIAB+aU/1x0S5PnOR/6zqw=;
 b=Mb8NtM8pQp9DjtRdaHhHiqIhf2QFMnPIrFBNf604gmjr1gDhh8rGZ8cvxHL29TBR0TCucflciMafCntRZfG/63gMw3VLo3S9/mwTyiERQDvAf+Tcl/MbQNnIJRlxtQ4ihvIAanl4w+KpnzyJpCohQfNSVePKR1wyZBDmAUAxJYg=
Received: from BYAPR01CA0068.prod.exchangelabs.com (2603:10b6:a03:94::45) by
 BY3PR19MB4995.namprd19.prod.outlook.com (2603:10b6:a03:355::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.25; Mon, 7 Jul 2025 12:42:03 +0000
Received: from SJ1PEPF000023D2.namprd02.prod.outlook.com
 (2603:10b6:a03:94:cafe::f9) by BYAPR01CA0068.outlook.office365.com
 (2603:10b6:a03:94::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.27 via Frontend Transport; Mon,
 7 Jul 2025 12:42:17 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000023D2.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Mon, 7 Jul 2025 12:42:03 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B1342406555;
	Mon,  7 Jul 2025 12:41:59 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 964A482024D;
	Mon,  7 Jul 2025 12:41:59 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org
Subject: [PATCH 5/7] ASoC: SDCA: Add helper to add DAI constraints
Date: Mon,  7 Jul 2025 13:41:53 +0100
Message-Id: <20250707124155.2596744-6-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D2:EE_|BY3PR19MB4995:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 67707590-91e4-4930-48df-08ddbd53ad07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?h3zHX25QLF6whTO2WQMw6txGk2fProodmDI6L+KLu3B6CLmqNzCcEcB9s3xC?=
 =?us-ascii?Q?7WAq6XdH0aEetj1IbyMDds6uiOaIcBBvWOCXPLdQPFZcKzfAqBCdl21puwS9?=
 =?us-ascii?Q?PUugZhzF8x4+yJ29dQk84OFbh37ogmusTi9qMoE1Y6X4aTJvKiQS2iEeqPEy?=
 =?us-ascii?Q?fo3McoWhqGwOCtGNQ+b6452mYVjualhsLH59qEFjjwVOBqxLn9QAOHYKes9e?=
 =?us-ascii?Q?rH/gSl9QRb0BOL2fh1BnGFie/YBk41kWBpPSx9aqlpnrtidu7pUM2jseuZop?=
 =?us-ascii?Q?aZaNoyRwJOAeZQWIHpjUScBumVPoxgBogNJAjYODE7eIomdfhIXVu4a5ar4x?=
 =?us-ascii?Q?cD202LwmtOtqRZlZxZ8VivmvfHVSHHRsLSwlORGSoFDEsUvMLEJVKI3va8kU?=
 =?us-ascii?Q?9ETbuSHo4UI2sVjstBnzlbiMJxP6xPNoBRlg7+i1PLz156q0yrJBMNSmEFnK?=
 =?us-ascii?Q?7op+P49jaG2jfzuuq1vhVd1+Tmd3u/8lkH8lJJ6VFbRnsBhzoLY7lrH1bcYu?=
 =?us-ascii?Q?kr0J9F3pBVZQfm29LEvLOCzwVQ7dCrhP0q5dOJvZdVYmLzAFjbU+GvJhpYY1?=
 =?us-ascii?Q?b9nQmjfVnm2n70e0TyCjcQutb50khpRzscASdl7MS++c8lKc7P18QyLaVKqP?=
 =?us-ascii?Q?P8HwulX5yVb32QsArrAPKP/gokTcr2mffeu0f607rNk79oUYkKSXQ0i0KzYT?=
 =?us-ascii?Q?PROUdae5aCoakjmtjI11htpRZSHunnlhtvN+VlKcr9ydtmilINaZ3VIuqCrn?=
 =?us-ascii?Q?rP8DBqrobzSkE5sEqCGorH2K/hCLlpkSSxZzMmQUY2vXQ0UB7hJrpoQaL+h0?=
 =?us-ascii?Q?fOA9P782NZGsieQ5MkjZic9RZYwMA8m0fUej22LqaMYVIect+Iz1CpJTj6Sj?=
 =?us-ascii?Q?nt0e6psd2gW9fIMSxVuClSmFGgjUQitSvHq0sT6L3ybTnauanEBPfRVd1Af2?=
 =?us-ascii?Q?WZ9hfxEAstQvR7JDA/7z+nKj0TeLEj49yszKBD0XgFfN/gNmxVmVmjRpJkqS?=
 =?us-ascii?Q?5FhHdZ9B3YJ7TPqoz7E4ncdA8KcyB6cNTTokTy1iKjP1/zGZnxaUsBiI3dWU?=
 =?us-ascii?Q?GkFf5KW/7tF7KtjSKMY128C0wTCnYx24QS4h/beGFSUXoUucRCRLqt02n9U1?=
 =?us-ascii?Q?ckPOiEORzlzP1Tkj5l2Jalw4e2tfVpMpQZfGJuKeJUkDllylfppjSaBm3Yh4?=
 =?us-ascii?Q?aMqUJHELpgydSM+rYA013b4QhC3SOXk+A5KR6F6oV2jto+b2LjtUa+hPpLMe?=
 =?us-ascii?Q?K3lPucSmpXyrTfD4HYUo18qSj8WZ6QPWIow8LF9hQBQwc9CHjLB8UBeJDPWt?=
 =?us-ascii?Q?XB6cbPRJH1qTQIYYrcOkdoG7mm0oB1DkQJKa4wFkxC1p9TAKctjE87bRyFSc?=
 =?us-ascii?Q?Nxk7tVEGzQwXarN1QqzZN0OG4aq3Z7vSwEzDljX2O8AXuQv4PkKdRhgl2Z0H?=
 =?us-ascii?Q?vL+2HCA1z96Mn347DWFx96bH1faEmG8vNMfiXsD3Jd0XI82avIufFA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 12:42:03.6003
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67707590-91e4-4930-48df-08ddbd53ad07
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR19MB4995
X-Proofpoint-ORIG-GUID: oMLGKM9oOzMwm1gA6KVe1v4ktAN5NFVs
X-Authority-Analysis: v=2.4 cv=dtDbC0g4 c=1 sm=1 tr=0 ts=686bc09f cx=c_pps a=JpZts7cEBrfcwmRlVwBwFQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=Wb1JkmetP80A:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=KJT-RnjOAAAA:8 a=w1d2syhTAAAA:8 a=VAiO9yxWkaHCI-D53pIA:9 a=HE_01F9_QflCRFonrIQr:22
X-Proofpoint-GUID: oMLGKM9oOzMwm1gA6KVe1v4ktAN5NFVs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA3NCBTYWx0ZWRfX/wIfwEshrFQz 7CpUKytybUw13U/NMdjny/7uDhsM73RT27ml/0kr5uG9xiH+afAoWlvXICZcg0qKZvmi0E05ITD W14S6LNq2DOImWCHNU0q85yEZZAk5dq7x4OkJ7stydiO82IP/f7NhzTUXGVl/eTvxM6asNpeR1N
 7xRGZk87LY4g4M3sOqdZ8rJxa+RrYx59i2qITnJnvBGeNAgvtC9hkc90NKocCrnJlIIjFEkk3uA WC4srn1YbWhaDBlpq/Lk/XavMZbNf/t6Uf8qHBmDTxdf99RF3wBBM3yAo5oEXjMwVV0pzMCeuY4 bfm6FVQbjWDZmUxWqQeqe7eZRJj/nkDBbxjOzKBZqdZWHFQI+iWMq4uRu05Wvn+vPjTtd+2Y4zt
 wAi4+cxyQ0VgWmjWfwVrSBxWF1OdQ5jXG8WChtU6pSq6/DV60M6vk77t+Nc9Yare9+Z5pgXG
X-Proofpoint-Spam-Reason: safe

Currently the core SDCA code simply creates a place holder available
channels from 1 to SDCA_MAX_CHANNEL_COUNT. Add a helper function
that will constrain the number of channels based on the actual
available SDCA Clusters in DisCo. Currently this code only handles
Input Terminal Entities as they directly specify the Cluster. More
work will be required later for Output Terminals which inherit their
Cluster. Typically this new helper would be called from the DAIs
startup callback.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/sdca_asoc.h       | 10 ++++
 include/sound/sdca_function.h   | 12 ++++
 sound/soc/sdca/sdca_asoc.c      | 99 +++++++++++++++++++++++++++++++++
 sound/soc/sdca/sdca_functions.c | 18 ++++++
 4 files changed, 139 insertions(+)

diff --git a/include/sound/sdca_asoc.h b/include/sound/sdca_asoc.h
index 9121531f0826..bbf146e4fcea 100644
--- a/include/sound/sdca_asoc.h
+++ b/include/sound/sdca_asoc.h
@@ -11,9 +11,12 @@
 #define __SDCA_ASOC_H__
 
 struct device;
+struct regmap;
 struct sdca_function_data;
 struct snd_kcontrol_new;
+struct snd_pcm_substream;
 struct snd_soc_component_driver;
+struct snd_soc_dai;
 struct snd_soc_dai_driver;
 struct snd_soc_dai_ops;
 struct snd_soc_dapm_route;
@@ -39,4 +42,11 @@ int sdca_asoc_populate_component(struct device *dev,
 				 struct snd_soc_dai_driver **dai_drv, int *num_dai_drv,
 				 const struct snd_soc_dai_ops *ops);
 
+int sdca_asoc_set_constraints(struct device *dev, struct regmap *regmap,
+			      struct sdca_function_data *function,
+			      struct snd_pcm_substream *substream,
+			      struct snd_soc_dai *dai);
+void sdca_asoc_free_constraints(struct snd_pcm_substream *substream,
+				struct snd_soc_dai *dai);
+
 #endif // __SDCA_ASOC_H__
diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index 543c09e99ab1..3bde07409bf3 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -1268,6 +1268,15 @@ struct sdca_cluster {
 	struct sdca_channel *channels;
 };
 
+/**
+ * enum sdca_cluster_range - SDCA Range column definitions for ClusterIndex
+ */
+enum sdca_cluster_range {
+	SDCA_CLUSTER_BYTEINDEX				= 0,
+	SDCA_CLUSTER_CLUSTERID				= 1,
+	SDCA_CLUSTER_NCOLS				= 2,
+};
+
 /**
  * struct sdca_function_data - top-level information for one SDCA function
  * @desc: Pointer to short descriptor from initial parsing.
@@ -1326,5 +1335,8 @@ struct sdca_control_range *sdca_control_find_range(struct device *dev,
 struct sdca_control_range *sdca_selector_find_range(struct device *dev,
 						    struct sdca_entity *entity,
 						    int sel, int cols, int rows);
+struct sdca_cluster *sdca_id_find_cluster(struct device *dev,
+					  struct sdca_function_data *function,
+					  const int id);
 
 #endif
diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index 11c9b3b935fc..1a0149287584 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -7,16 +7,20 @@
  * https://www.mipi.org/mipi-sdca-v1-0-download
  */
 
+#include <linux/bits.h>
 #include <linux/bitmap.h>
+#include <linux/build_bug.h>
 #include <linux/delay.h>
 #include <linux/dev_printk.h>
 #include <linux/device.h>
 #include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/overflow.h>
+#include <linux/regmap.h>
 #include <linux/soundwire/sdw_registers.h>
 #include <linux/string_helpers.h>
 #include <sound/control.h>
+#include <sound/pcm.h>
 #include <sound/sdca.h>
 #include <sound/sdca_asoc.h>
 #include <sound/sdca_function.h>
@@ -1269,3 +1273,98 @@ int sdca_asoc_populate_component(struct device *dev,
 	return 0;
 }
 EXPORT_SYMBOL_NS(sdca_asoc_populate_component, "SND_SOC_SDCA");
+
+/**
+ * sdca_asoc_set_constraints - constrain channels available on a DAI
+ * @dev: Pointer to the device, used for error messages.
+ * @regmap: Pointer to the Function register map.
+ * @function: Pointer to the Function information.
+ * @substream: Pointer to the PCM substream.
+ * @dai: Pointer to the ASoC DAI.
+ *
+ * Typically called from startup().
+ *
+ * Return: Returns zero on success, and a negative error code on failure.
+ */
+int sdca_asoc_set_constraints(struct device *dev, struct regmap *regmap,
+			      struct sdca_function_data *function,
+			      struct snd_pcm_substream *substream,
+			      struct snd_soc_dai *dai)
+{
+	static const unsigned int channel_list[] = {
+		 1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14, 15, 16,
+		17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32,
+	};
+	struct sdca_entity *entity = &function->entities[dai->id];
+	struct snd_pcm_hw_constraint_list *constraint;
+	struct sdca_control_range *range;
+	struct sdca_control *control;
+	unsigned int channel_mask = 0;
+	int i, ret;
+
+	static_assert(ARRAY_SIZE(channel_list) == SDCA_MAX_CHANNEL_COUNT);
+	static_assert(sizeof(channel_mask) * BITS_PER_BYTE >= SDCA_MAX_CHANNEL_COUNT);
+
+	if (entity->type != SDCA_ENTITY_TYPE_IT)
+		return 0;
+
+	control = sdca_selector_find_control(dev, entity, SDCA_CTL_IT_CLUSTERINDEX);
+	if (!control)
+		return -EINVAL;
+
+	range = sdca_control_find_range(dev, entity, control, SDCA_CLUSTER_NCOLS, 0);
+	if (!range)
+		return -EINVAL;
+
+	for (i = 0; i < range->rows; i++) {
+		int clusterid = sdca_range(range, SDCA_CLUSTER_CLUSTERID, i);
+		struct sdca_cluster *cluster;
+
+		cluster = sdca_id_find_cluster(dev, function, clusterid);
+		if (!cluster)
+			return -ENODEV;
+
+		channel_mask |= (1 << (cluster->num_channels - 1));
+	}
+
+	dev_dbg(dev, "%s: set channel constraint mask: %#x\n",
+		entity->label, channel_mask);
+
+	constraint = kzalloc(sizeof(*constraint), GFP_KERNEL);
+	if (!constraint)
+		return -ENOMEM;
+
+	constraint->count = ARRAY_SIZE(channel_list);
+	constraint->list = channel_list;
+	constraint->mask = channel_mask;
+
+	ret = snd_pcm_hw_constraint_list(substream->runtime, 0,
+					 SNDRV_PCM_HW_PARAM_CHANNELS,
+					 constraint);
+	if (ret) {
+		dev_err(dev, "%s: failed to add constraint: %d\n", entity->label, ret);
+		kfree(constraint);
+		return ret;
+	}
+
+	dai->priv = constraint;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(sdca_asoc_set_constraints, "SND_SOC_SDCA");
+
+/**
+ * sdca_asoc_free_constraints - free constraint allocations
+ * @substream: Pointer to the PCM substream.
+ * @dai: Pointer to the ASoC DAI.
+ *
+ * Typically called from shutdown().
+ */
+void sdca_asoc_free_constraints(struct snd_pcm_substream *substream,
+				struct snd_soc_dai *dai)
+{
+	struct snd_pcm_hw_constraint_list *constraint = dai->priv;
+
+	kfree(constraint);
+}
+EXPORT_SYMBOL_NS(sdca_asoc_free_constraints, "SND_SOC_SDCA");
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index ca965e8a4c46..0019c72b4904 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -1991,6 +1991,24 @@ struct sdca_control_range *sdca_selector_find_range(struct device *dev,
 }
 EXPORT_SYMBOL_NS(sdca_selector_find_range, "SND_SOC_SDCA");
 
+struct sdca_cluster *sdca_id_find_cluster(struct device *dev,
+					  struct sdca_function_data *function,
+					  const int id)
+{
+	int i;
+
+	for (i = 0; i < function->num_clusters; i++) {
+		struct sdca_cluster *cluster = &function->clusters[i];
+
+		if (cluster->id == id)
+			return cluster;
+	}
+
+	dev_err(dev, "%s: cluster %#x: missing\n", function->desc->name, id);
+	return NULL;
+}
+EXPORT_SYMBOL_NS(sdca_id_find_cluster, "SND_SOC_SDCA");
+
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_DESCRIPTION("SDCA library");
 MODULE_IMPORT_NS("SND_SOC_SDCA_HID");
-- 
2.39.5

