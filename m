Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70513242D68
	for <linux-sound@vger.kernel.org>; Fri, 16 May 2025 13:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747401035; cv=fail; b=Vxd23v3pAVA3CertnkY8DHU7QXXBreeUCC4krexKB5YMCdRgAgGj+799R0or447PBfgU2uuFM3gMBKfwjJ6l6kS47vY2ApeSwn7DVimzgLQXGC4gYkSKfrocy+p+0AWXiYBvTJoZNHZXTU4zKYAUTqebSHyrFBFbLWhjRkaqexs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747401035; c=relaxed/simple;
	bh=aCiZVLzUAF54slhJFMOv4OBEi6jeaArHxYXaZVdfdiE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iZuudfTYw29Wy1J+vEO++1WpzGjiFdjFqjBoxa7lWsgLlVD1fDdwQIcDTanNGQi6uKzkxbIrwonDr/Jd/6gNSeP7lFd7RTCSPFVm8Q/ppMeGn5DyYCDszQ+t9SsF89m7sErLAHK7PaDbWhm35gIErM54GKBxO1BUa6fkKH/xktU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=e1aF0iyC; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=BlF6zKtA; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="e1aF0iyC";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="BlF6zKtA"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54G4M7le025992;
	Fri, 16 May 2025 08:10:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=gwsZVAjxWrxiohZhi7VXwWH8iqk2GazzAGVoTAUzAjg=; b=
	e1aF0iyCNZlQEs3pbDHtQfIvjogd37HV6//m3nSQ6/R5kLZs9wNvC8AZlJ/9zoRl
	kYFOLJ0g477rbqv4O1UOepxanPqlVRYSMWa4/UYp4J/EzanGK9C9fi9b+Hgxf/jg
	GPz3Am+VrCXEmruWYoTM4YMkdW3xjxn0IxSj6cP0ZRYP/yTefP1P7O0Vt4rP8Tzs
	KNd7AM7myut00A+hooCo06pIr2l4HilrZEdUEsyUh83i6pR/S0oXyXGDtkUdOolf
	EAs37l1cl6s967ZP4a9a8m7XAEk8qJMILDbgMuiy5bGENUbhYzWr5CSWeJ89BGx6
	BWcTcdav1CMaqbJB/mB+1g==
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2040.outbound.protection.outlook.com [104.47.56.40])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 46mbdrcptr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 08:10:26 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rurutYpSgmRIf8rjv7N5ji8haonG66o+/etTH9wsjsNqVeVFZAGhfwKydHAl0j2BRxZCvu1Yntb5DcdfsB8zbSFScZ1ZenGIGKvCfI/JkG8YgkKe7zuWbXfgoAMLTpTaYTK83pfnt8yJ3abPusYma6M/2II1af6zzfUlqc42m9BYyLvFChc+1T3USliqkO1kEkHH6aXvHlnf6PE7ezJCb1UjzKaSj7/IvTIkOb/Y68ojzCCutWkjdeUVn6sd7jxHj+QrQitJgT4CY31hCIy0HDNTmGhLQHGVsXKdvISnifvGztl2jilP7B/xrfc8GndoFZTCeS+kJZu7ZqX1nEIBUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gwsZVAjxWrxiohZhi7VXwWH8iqk2GazzAGVoTAUzAjg=;
 b=y8DsobPmQ5WCLHYOCVxoDlZW/iKgUJAfcosi3WcMjJWPxqcITSQZtwzeoc+9CCEW66itE6iRoZiVWwbfng4+ymGiLqtJSQes5FIbvEnKZbSgyaoatARrcEZTeRQcci8PRflTMjRv+MC40JhgCEyYFi9V/QGNREYc7eb0DjV1tChNQrMl5Pu4mYX3HGcdb21R+6UJtWYd4rNnsYeos1LpKBD8J/pYtoObd6Vcj3KJPuNQTolKqrpy2qMCjgNVigKSFknwKT3NG/bssJ/xuaYQoHilqDZpwdct8Pm9zuUJ+7ZcK1JedX4r7rpjN0Oj3NWzb+UcPm4FyKgS5mn9/J46Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gwsZVAjxWrxiohZhi7VXwWH8iqk2GazzAGVoTAUzAjg=;
 b=BlF6zKtA6FyWRmbUDd4wWNGlsTPGmUsbfDpQQ2oiVjW4JrTVTSikNWbNYjFVT+YwQavz6EJhzqrWQREqU5XvLnFcoBx/6Jy9bZLHXqVNgU2TK90C8Bo6ltNs6jwJQ1NlzfeTJRvvcRf9UX0yrAOmexrxO+aTEYyA8KSkdywnsh0=
Received: from BN9PR03CA0362.namprd03.prod.outlook.com (2603:10b6:408:f7::7)
 by LV3PR19MB8480.namprd19.prod.outlook.com (2603:10b6:408:215::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Fri, 16 May
 2025 13:10:17 +0000
Received: from BL02EPF0001A102.namprd05.prod.outlook.com
 (2603:10b6:408:f7:cafe::54) by BN9PR03CA0362.outlook.office365.com
 (2603:10b6:408:f7::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.16 via Frontend Transport; Fri,
 16 May 2025 13:10:17 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF0001A102.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Fri, 16 May 2025 13:10:16 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4BB20406553;
	Fri, 16 May 2025 13:10:12 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 3A3E9822563;
	Fri, 16 May 2025 13:10:12 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v6 7/7] ASoC: SDCA: Create DAI drivers from DisCo
Date: Fri, 16 May 2025 14:10:11 +0100
Message-Id: <20250516131011.221310-8-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250516131011.221310-1-ckeepax@opensource.cirrus.com>
References: <20250516131011.221310-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A102:EE_|LV3PR19MB8480:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 54fceb9b-b877-4261-9873-08dd947b0044
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|61400799027|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vvxrY2UeAzXr4g/CyDYjGsT4jsAmUFES9J1aU1WodOFDZ6/VIik73Df4stJv?=
 =?us-ascii?Q?7M54STuUnag99T5HZws4vW+TI+UnRKAbHaj1KUA5E0bwapDuRKardsl3NcMt?=
 =?us-ascii?Q?4zA+EwY/2n9vjllykJScpe/NzC3dkZnHemSJQ6CYCXBC3alcIBCwzhqjuN/X?=
 =?us-ascii?Q?SCj60ykTCU0IJ9xVBbMe6+NSix/zmxApC5ISrv3EjSdfErZBXkL+55gnYJbN?=
 =?us-ascii?Q?D0TN7ZQ01db7QC4Ul3EqHuZVcmD8EoPbQVlME47i45wTyzGZwiBe/Y04t6xO?=
 =?us-ascii?Q?8H+LNb3WwWXvUlO4gNCUSSjlHPcdHd+1d9Al7Uvs65g+WxHoyCfG1xXxeS5E?=
 =?us-ascii?Q?355SDUlCWDHRTb/itYbGYfbpe5tuh5FOv0oUw+VXW/c9rddHJf2VjlZsSIgD?=
 =?us-ascii?Q?y8mNVOFs3hN1kruhjLpb5DAKKtT+80K4uAl1ohgztkOhiVnDt9ac765eHOAn?=
 =?us-ascii?Q?BjM/Yjh4Gw3yBS+etV54QNZ5AhdaUVeEsW6K8VMeQ7D2rPEeUFj4uvd/XQ7T?=
 =?us-ascii?Q?oS+WZ0s8s0hjuBIguzJEA0x6EP9gtFKax1apKeZ+OI0IivfkU/d6TSjhUxPl?=
 =?us-ascii?Q?Ms/V6Rc9BQzFA57sTgAg8uTLU4PskqvuIdm5fU2xRT01mdhbEBHMB372c7Db?=
 =?us-ascii?Q?7iCJtRNUyyrT+YvsowM7Wto0lkQ59MsW/CUhvwtTxBFOTcH0p9PSoGJmLDNe?=
 =?us-ascii?Q?RPEwIqFExGt0QGmVinUFbH73bfYWkmiYl2fzplyNPR2DFDewt83O5oAmK2qW?=
 =?us-ascii?Q?+eqehJa6RR6bhpKGtGF+p0PKWGFf21Q5OV6+eOFUefZH4MXGoNt1Sqw+HBfs?=
 =?us-ascii?Q?j3tQ+MOpIPY5fVUqkCdRC+QYUmnqb/mtqUkbOUg2hVhWBXDgnge827YN4lj7?=
 =?us-ascii?Q?1hUqsc5Geps+FRlKF+TRb/IbDrdVdDoq2hP7+T3B1jz+G+bytWs6Rdrlsaln?=
 =?us-ascii?Q?ZuWpDbSGGEVhpPLRG7sN73M5UHVZEFE+zIyfcg+d3DMhtj6qpXJmr55Jskyb?=
 =?us-ascii?Q?gvMgg4lKuN+L3JK9Fdt4CAUACh8eY532xS77IorjZplBZJAg5cgYZEL/Iu+7?=
 =?us-ascii?Q?9hplBiO/RfkW+7pmD5XuPtDv8dzToa3lOUSS+YEkxlrTk8feYjmiUaJsI6Rh?=
 =?us-ascii?Q?76wXWGjjcq5Xv+7akmv5oZP2gfWdYFjai5Z/zBmGpey8KUl4OEsdItjsw6nL?=
 =?us-ascii?Q?MjRPOHLz+mwMPqsTC/hAVmcyR893G/Hwp2l49TXsQE7ViXSRtl7xgsXz5oUy?=
 =?us-ascii?Q?aXMV2gg9VPLnKE5NqNP+hpqJjT8JYyADgAEBU/kSRFXBI7ArObU4k1aMV1nk?=
 =?us-ascii?Q?Ys0poIhBZsTc65BbOTv73I2dAFlbM0ORoQtdsnUFQhBpH92s2jxXg0X2bNXQ?=
 =?us-ascii?Q?5KkCdXxm1PY+KE5mDdiPUPgOOFQhDwvppRoNzNYsuLd0nVORbtPGlaxM3c5r?=
 =?us-ascii?Q?UOl4L/vFbBDMngshdjc9lSjGDEwaU3ExJTVbS+zL/NZP5BlMZTE6AW3Bfbxt?=
 =?us-ascii?Q?l7SZ6Uy+UNf8Qeohr+dmbLzQnJwRSHl03dMX?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 13:10:16.0795
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54fceb9b-b877-4261-9873-08dd947b0044
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A102.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR19MB8480
X-Proofpoint-ORIG-GUID: 18cMYVGnZlSxt2vTjn3Oy8Z8HzaxH6vm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDEyNyBTYWx0ZWRfX2jF7Odnd46JH TcqAa9l/8pDi/DyP0ghrOl7ZRWDesPVYxtRL4xAjIO5KsLy5vh5RupwEUpcaLrnEJ2r1RjFlpEn WmJFVeTNKM4pG6kGUzAWs6r9SCig52XUouCBc/VgvDMatQLTK5yW8YETKtr3YVM70OxkFw7o3D+
 v6uguxo69g4p3nQTkRmOg0ltpI6ICswlYB1KeIqm+DmMOlJa0m2a6J6pvJv2BLN2COV462ZYqli 8qHQr2T7oI3JYwzsZ49M/yIx4eA50gBz59Cz3IpPMF+1GVBUwdaJrCU9K3k3AtOrMTjbQEJ7w80 MMKmKO/7VIUerTqjxR+pTJtGanqILfD2bptH8zyX3Ja+i1EVoGsVvjVaNQHmkXmjafbKpn/6fy6
 qMfDQrRIE1TGKUBDGKIaH8wE8K1ZWA/Y8uEJMlBAtgGr6SoP/eGoJ+Gk24Fy8uSqnzb/CUAF
X-Proofpoint-GUID: 18cMYVGnZlSxt2vTjn3Oy8Z8HzaxH6vm
X-Authority-Analysis: v=2.4 cv=abNhnQot c=1 sm=1 tr=0 ts=68273942 cx=c_pps a=TWVVkEr8Ytp/jGYVlMgQuQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=dt9VzEwgFbYA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=TKdQKM3kYW3HcpqIAtQA:9
X-Proofpoint-Spam-Reason: safe

Use the previously parsed DisCo information from ACPI to create the DAI
drivers required to connect an SDCA Function into an ASoC soundcard.

Create DAI driver structures and populate the supported sample rates
and sample widths into them based on the Input/Output Terminal and any
attach Clock Source entities. More complex relationships with channels
etc. will be added later as constraints as part of the DAI startup.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v5:
 - Add some comments

 include/sound/sdca_asoc.h     |  12 +-
 include/sound/sdca_function.h |  23 ++++
 sound/soc/sdca/sdca_asoc.c    | 227 +++++++++++++++++++++++++++++++++-
 3 files changed, 256 insertions(+), 6 deletions(-)

diff --git a/include/sound/sdca_asoc.h b/include/sound/sdca_asoc.h
index d19e7e969283a..9121531f08260 100644
--- a/include/sound/sdca_asoc.h
+++ b/include/sound/sdca_asoc.h
@@ -14,11 +14,14 @@ struct device;
 struct sdca_function_data;
 struct snd_kcontrol_new;
 struct snd_soc_component_driver;
+struct snd_soc_dai_driver;
+struct snd_soc_dai_ops;
 struct snd_soc_dapm_route;
 struct snd_soc_dapm_widget;
 
 int sdca_asoc_count_component(struct device *dev, struct sdca_function_data *function,
-			      int *num_widgets, int *num_routes, int *num_controls);
+			      int *num_widgets, int *num_routes, int *num_controls,
+			      int *num_dais);
 
 int sdca_asoc_populate_dapm(struct device *dev, struct sdca_function_data *function,
 			    struct snd_soc_dapm_widget *widgets,
@@ -26,9 +29,14 @@ int sdca_asoc_populate_dapm(struct device *dev, struct sdca_function_data *funct
 int sdca_asoc_populate_controls(struct device *dev,
 				struct sdca_function_data *function,
 				struct snd_kcontrol_new *kctl);
+int sdca_asoc_populate_dais(struct device *dev, struct sdca_function_data *function,
+			    struct snd_soc_dai_driver *dais,
+			    const struct snd_soc_dai_ops *ops);
 
 int sdca_asoc_populate_component(struct device *dev,
 				 struct sdca_function_data *function,
-				 struct snd_soc_component_driver *component_drv);
+				 struct snd_soc_component_driver *component_drv,
+				 struct snd_soc_dai_driver **dai_drv, int *num_dai_drv,
+				 const struct snd_soc_dai_ops *ops);
 
 #endif // __SDCA_ASOC_H__
diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index 2ecf0c3a5e033..eaedb54a83227 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -168,6 +168,20 @@ enum sdca_ot_controls {
 	SDCA_CTL_OT_NDAI_PACKETTYPE			= 0x17,
 };
 
+/**
+ * enum sdca_usage_range - Column definitions for Usage
+ */
+enum sdca_usage_range {
+	SDCA_USAGE_NUMBER				= 0,
+	SDCA_USAGE_CBN					= 1,
+	SDCA_USAGE_SAMPLE_RATE				= 2,
+	SDCA_USAGE_SAMPLE_WIDTH				= 3,
+	SDCA_USAGE_FULL_SCALE				= 4,
+	SDCA_USAGE_NOISE_FLOOR				= 5,
+	SDCA_USAGE_TAG					= 6,
+	SDCA_USAGE_NCOLS				= 7,
+};
+
 /**
  * enum sdca_mu_controls - SDCA Controls for Mixer Unit
  *
@@ -246,6 +260,15 @@ enum sdca_cs_controls {
 	SDCA_CTL_CS_SAMPLERATEINDEX			= 0x10,
 };
 
+/**
+ * enum sdca_samplerateindex_range - Column definitions for SampleRateIndex
+ */
+enum sdca_samplerateindex_range {
+	SDCA_SAMPLERATEINDEX_INDEX			= 0,
+	SDCA_SAMPLERATEINDEX_RATE			= 1,
+	SDCA_SAMPLERATEINDEX_NCOLS			= 2,
+};
+
 /**
  * enum sdca_cx_controls - SDCA Controls for Clock Selector
  *
diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index bf8dbccde5263..7bc8f6069f3d4 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -22,6 +22,7 @@
 #include <sound/sdca_function.h>
 #include <sound/soc.h>
 #include <sound/soc-component.h>
+#include <sound/soc-dai.h>
 #include <sound/soc-dapm.h>
 #include <sound/tlv.h>
 
@@ -99,6 +100,8 @@ static bool readonly_control(struct sdca_control *control)
  * required number of DAPM routes for the Function.
  * @num_controls: Output integer pointer, will be filled with the
  * required number of ALSA controls for the Function.
+ * @num_dais: Output integer pointer, will be filled with the
+ * required number of ASoC DAIs for the Function.
  *
  * This function counts various things within the SDCA Function such
  * that the calling driver can allocate appropriate space before
@@ -107,13 +110,15 @@ static bool readonly_control(struct sdca_control *control)
  * Return: Returns zero on success, and a negative error code on failure.
  */
 int sdca_asoc_count_component(struct device *dev, struct sdca_function_data *function,
-			      int *num_widgets, int *num_routes, int *num_controls)
+			      int *num_widgets, int *num_routes, int *num_controls,
+			      int *num_dais)
 {
 	int i, j;
 
 	*num_widgets = function->num_entities - 1;
 	*num_routes = 0;
 	*num_controls = 0;
+	*num_dais = 0;
 
 	for (i = 0; i < function->num_entities - 1; i++) {
 		struct sdca_entity *entity = &function->entities[i];
@@ -125,6 +130,7 @@ int sdca_asoc_count_component(struct device *dev, struct sdca_function_data *fun
 			*num_routes += !!entity->iot.clock;
 			*num_routes += !!entity->iot.is_dataport;
 			*num_controls += !entity->iot.is_dataport;
+			*num_dais += !!entity->iot.is_dataport;
 			break;
 		case SDCA_ENTITY_TYPE_PDE:
 			*num_routes += entity->pde.num_managed;
@@ -1033,6 +1039,205 @@ int sdca_asoc_populate_controls(struct device *dev,
 }
 EXPORT_SYMBOL_NS(sdca_asoc_populate_controls, "SND_SOC_SDCA");
 
+static unsigned int rate_find_mask(unsigned int rate)
+{
+	switch (rate) {
+	case 0:
+		return SNDRV_PCM_RATE_8000_768000;
+	case 5512:
+		return SNDRV_PCM_RATE_5512;
+	case 8000:
+		return SNDRV_PCM_RATE_8000;
+	case 11025:
+		return SNDRV_PCM_RATE_11025;
+	case 16000:
+		return SNDRV_PCM_RATE_16000;
+	case 22050:
+		return SNDRV_PCM_RATE_22050;
+	case 32000:
+		return SNDRV_PCM_RATE_32000;
+	case 44100:
+		return SNDRV_PCM_RATE_44100;
+	case 48000:
+		return SNDRV_PCM_RATE_48000;
+	case 64000:
+		return SNDRV_PCM_RATE_64000;
+	case 88200:
+		return SNDRV_PCM_RATE_88200;
+	case 96000:
+		return SNDRV_PCM_RATE_96000;
+	case 176400:
+		return SNDRV_PCM_RATE_176400;
+	case 192000:
+		return SNDRV_PCM_RATE_192000;
+	case 352800:
+		return SNDRV_PCM_RATE_352800;
+	case 384000:
+		return SNDRV_PCM_RATE_384000;
+	case 705600:
+		return SNDRV_PCM_RATE_705600;
+	case 768000:
+		return SNDRV_PCM_RATE_768000;
+	case 12000:
+		return SNDRV_PCM_RATE_12000;
+	case 24000:
+		return SNDRV_PCM_RATE_24000;
+	case 128000:
+		return SNDRV_PCM_RATE_128000;
+	default:
+		return 0;
+	}
+}
+
+static u64 width_find_mask(unsigned int bits)
+{
+	switch (bits) {
+	case 0:
+		return SNDRV_PCM_FMTBIT_S8 | SNDRV_PCM_FMTBIT_S16_LE |
+		       SNDRV_PCM_FMTBIT_S20_LE | SNDRV_PCM_FMTBIT_S24_LE |
+		       SNDRV_PCM_FMTBIT_S32_LE;
+	case 8:
+		return SNDRV_PCM_FMTBIT_S8;
+	case 16:
+		return SNDRV_PCM_FMTBIT_S16_LE;
+	case 20:
+		return SNDRV_PCM_FMTBIT_S20_LE;
+	case 24:
+		return SNDRV_PCM_FMTBIT_S24_LE;
+	case 32:
+		return SNDRV_PCM_FMTBIT_S32_LE;
+	default:
+		return 0;
+	}
+}
+
+static int populate_rate_format(struct device *dev,
+				struct sdca_function_data *function,
+				struct sdca_entity *entity,
+				struct snd_soc_pcm_stream *stream)
+{
+	struct sdca_control_range *range;
+	unsigned int sample_rate, sample_width;
+	unsigned int clock_rates = 0;
+	unsigned int rates = 0;
+	u64 formats = 0;
+	int sel, i;
+
+	switch (entity->type) {
+	case SDCA_ENTITY_TYPE_IT:
+		sel = SDCA_CTL_IT_USAGE;
+		break;
+	case SDCA_ENTITY_TYPE_OT:
+		sel = SDCA_CTL_OT_USAGE;
+		break;
+	default:
+		dev_err(dev, "%s: entity type has no usage control\n",
+			entity->label);
+		return -EINVAL;
+	}
+
+	if (entity->iot.clock) {
+		range = selector_find_range(dev, entity->iot.clock,
+					    SDCA_CTL_CS_SAMPLERATEINDEX,
+					    SDCA_SAMPLERATEINDEX_NCOLS, 0);
+		if (!range)
+			return -EINVAL;
+
+		for (i = 0; i < range->rows; i++) {
+			sample_rate = sdca_range(range, SDCA_SAMPLERATEINDEX_RATE, i);
+			clock_rates |= rate_find_mask(sample_rate);
+		}
+	} else {
+		clock_rates = UINT_MAX;
+	}
+
+	range = selector_find_range(dev, entity, sel, SDCA_USAGE_NCOLS, 0);
+	if (!range)
+		return -EINVAL;
+
+	for (i = 0; i < range->rows; i++) {
+		sample_rate = sdca_range(range, SDCA_USAGE_SAMPLE_RATE, i);
+		sample_rate = rate_find_mask(sample_rate);
+
+		if (sample_rate & clock_rates) {
+			rates |= sample_rate;
+
+			sample_width = sdca_range(range, SDCA_USAGE_SAMPLE_WIDTH, i);
+			formats |= width_find_mask(sample_width);
+		}
+	}
+
+	stream->formats = formats;
+	stream->rates = rates;
+
+	return 0;
+}
+
+/**
+ * sdca_asoc_populate_dais - fill in an array of DAI drivers for a Function
+ * @dev: Pointer to the device against which allocations will be done.
+ * @function: Pointer to the Function information.
+ * @dais: Array of DAI drivers to be populated.
+ * @ops: DAI ops to be attached to each of the created DAI drivers.
+ *
+ * This function populates an array of ASoC DAI drivers from the DisCo
+ * information for a particular SDCA Function. Typically,
+ * snd_soc_asoc_count_component will be used to allocate an
+ * appropriately sized array before calling this function.
+ *
+ * Return: Returns zero on success, and a negative error code on failure.
+ */
+int sdca_asoc_populate_dais(struct device *dev, struct sdca_function_data *function,
+			    struct snd_soc_dai_driver *dais,
+			    const struct snd_soc_dai_ops *ops)
+{
+	int i, j;
+	int ret;
+
+	for (i = 0, j = 0; i < function->num_entities - 1; i++) {
+		struct sdca_entity *entity = &function->entities[i];
+		struct snd_soc_pcm_stream *stream;
+		const char *stream_suffix;
+
+		switch (entity->type) {
+		case SDCA_ENTITY_TYPE_IT:
+			stream = &dais[j].playback;
+			stream_suffix = "Playback";
+			break;
+		case SDCA_ENTITY_TYPE_OT:
+			stream = &dais[j].capture;
+			stream_suffix = "Capture";
+			break;
+		default:
+			continue;
+		}
+
+		/* Can't check earlier as only terminals have an iot member. */
+		if (!entity->iot.is_dataport)
+			continue;
+
+		stream->stream_name = devm_kasprintf(dev, GFP_KERNEL, "%s %s",
+						     entity->label, stream_suffix);
+		if (!stream->stream_name)
+			return -ENOMEM;
+		/* Channels will be further limited by constraints */
+		stream->channels_min = 1;
+		stream->channels_max = SDCA_MAX_CHANNEL_COUNT;
+
+		ret = populate_rate_format(dev, function, entity, stream);
+		if (ret)
+			return ret;
+
+		dais[j].id = i;
+		dais[j].name = entity->label;
+		dais[j].ops = ops;
+		j++;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(sdca_asoc_populate_dais, "SND_SOC_SDCA");
+
 /**
  * sdca_asoc_populate_component - fill in a component driver for a Function
  * @dev: Pointer to the device against which allocations will be done.
@@ -1047,16 +1252,19 @@ EXPORT_SYMBOL_NS(sdca_asoc_populate_controls, "SND_SOC_SDCA");
  */
 int sdca_asoc_populate_component(struct device *dev,
 				 struct sdca_function_data *function,
-				 struct snd_soc_component_driver *component_drv)
+				 struct snd_soc_component_driver *component_drv,
+				 struct snd_soc_dai_driver **dai_drv, int *num_dai_drv,
+				 const struct snd_soc_dai_ops *ops)
 {
 	struct snd_soc_dapm_widget *widgets;
 	struct snd_soc_dapm_route *routes;
 	struct snd_kcontrol_new *controls;
-	int num_widgets, num_routes, num_controls;
+	struct snd_soc_dai_driver *dais;
+	int num_widgets, num_routes, num_controls, num_dais;
 	int ret;
 
 	ret = sdca_asoc_count_component(dev, function, &num_widgets, &num_routes,
-					&num_controls);
+					&num_controls, &num_dais);
 	if (ret)
 		return ret;
 
@@ -1072,6 +1280,10 @@ int sdca_asoc_populate_component(struct device *dev,
 	if (!controls)
 		return -ENOMEM;
 
+	dais = devm_kcalloc(dev, num_dais, sizeof(*dais), GFP_KERNEL);
+	if (!dais)
+		return -ENOMEM;
+
 	ret = sdca_asoc_populate_dapm(dev, function, widgets, routes);
 	if (ret)
 		return ret;
@@ -1080,6 +1292,10 @@ int sdca_asoc_populate_component(struct device *dev,
 	if (ret)
 		return ret;
 
+	ret = sdca_asoc_populate_dais(dev, function, dais, ops);
+	if (ret)
+		return ret;
+
 	component_drv->dapm_widgets = widgets;
 	component_drv->num_dapm_widgets = num_widgets;
 	component_drv->dapm_routes = routes;
@@ -1087,6 +1303,9 @@ int sdca_asoc_populate_component(struct device *dev,
 	component_drv->controls = controls;
 	component_drv->num_controls = num_controls;
 
+	*dai_drv = dais;
+	*num_dai_drv = num_dais;
+
 	return 0;
 }
 EXPORT_SYMBOL_NS(sdca_asoc_populate_component, "SND_SOC_SDCA");
-- 
2.39.5

