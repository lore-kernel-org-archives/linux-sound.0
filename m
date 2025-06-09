Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD3C2571A9
	for <linux-sound@vger.kernel.org>; Mon,  9 Jun 2025 12:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749472803; cv=fail; b=grB6cP2ZB8igOFY8sPtftzL5687DCs3xVflvZCXOenFiL/fIleCbIICEtUkQ5o6kmWlfwEdk4SO76gyUo9l9aEzjRPJ/5gLfKxHuPOFyGRjhWmHcjXAFCH+oAemgGgTmfrGfj4boPDk9vKES3K41BmutlyxBJJ0sv4E1Iu14YY4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749472803; c=relaxed/simple;
	bh=mk4lWi989ddjCjCMxLQKtEvA9Si0xwkH2tSDo/MzuPY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uAu1sxXX1NtL0VIeGwbauEKLrRQTeJ5sTPpBaFQfvt/YFwS9KWbnhkU+SFTaoXh0JCzqJXs20svMiRl8mf7n6ShjGw3HZNc1UAcx+P/Aclk8R5UoXtBqWKnCN5YTmJr6+wZgN7fxBDQWBlonjU9zC6Kd0LJx92rYbrX61JEuwfU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=EADey/en; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=GQ7xjIHN; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="EADey/en";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="GQ7xjIHN"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5595Rw04027950;
	Mon, 9 Jun 2025 07:39:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=nWEFWiO8BTpkhAmWU3O6niMSS+5j11QWUaQPDz2s/dM=; b=
	EADey/en9TkxsUmfvh4uwwCPsmEKYqqZK7nNoNEtsETV+KyzS7fq+28t9FRMiJes
	Uhg4Y+ZRy1QjyqRSe4yyoT9lb785qlxqXPb60qw1apUrXZ2QVqElWwfZj8GKeuxd
	Du5nZFzwwOcOsLFdtXMc/svZ4nMChPKVfqaKfD+yUnKipbFS6Roqhu8+c7kfyExY
	uAoAUFdfdhSzSII2EhIGKHqIxo4Rq5pdz3GpDk8FRDOSPiwwexXCrFbkRDEyMQ9D
	74a7T9B7hQHi8ThlTMGpVcycxFgn65o/DZ/2JgW0sYtblHau9ny+wS3QgZBAfuMx
	mV9sJb47LFkMu7+axQf6eg==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12hn2244.outbound.protection.outlook.com [52.100.165.244])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 47529v1dt1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Jun 2025 07:39:48 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O1dWzS5sJ0ay1vQcC43r13ViWeYxqiEzR2Gxgo4E/TfmDBMqmrQOS3e0Z1w0fGf5tRZl/aFMIN/gqNvxg8BPDc/9jBMSA+wNx7ZYp5J9MvrVGisxsO+BfwLTh9x3Nrbl2LkgB7s8lS9ZRZEbdnii9J+v62LG564LVNYZkm/73XECvunphXzA9CO669/kjRvGuI6sv3qVp5adaqO2QEyoMnu6CZjFJke1VsUofDZlAnOQRsC9KWVNUFKDX1x9NDuPLLghw2Vp/O+RXt9R9Tb7mbyChx1cIa4P17g5QEHVaA8peWoUlmc5DVmtDgXpAhI8FqadPedwBGhQpp1oBuh5UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nWEFWiO8BTpkhAmWU3O6niMSS+5j11QWUaQPDz2s/dM=;
 b=oDtDXsmtb7FNIbcIUst1ICugtz7oyWt6C/akeah3gHxqr/3nIWI9DLVjFzejYYUWdiTobVCi0m0yKn/1Pb+wiDHASI3Gu5whxPKRZVSQcjfK4EsKBv1fRWfktQXyXc9DqpCFV/aN6GCy5cp9qYJ6s6EDC8L077CZmreqOPxcI5Q+EWL6Dp4Lj4LmHnFi8HGZTCFN4XRYMCp767pqX21TJXHh0Wgvxp0S78PfrhijXBJdZOpGHCjPjeJ9PowsiYcNADivnGEvg8re3W+1NzcmgV1UHClDIakxYHcLUzk+eyMchAGIKtFoQYS8KetlbF0PyIsh5fcrMJGTSJd3msuHsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nWEFWiO8BTpkhAmWU3O6niMSS+5j11QWUaQPDz2s/dM=;
 b=GQ7xjIHNhNOU2D9CsOI5TBMucUoqHgDRM9YFZeFr0DFaS/DF5lyMmqjScHTWFcfmhgs2LIgDsCBtFNqSdR4rGi07YGIirYgXlDQZTJ7xy90tFn+NQ0gwV123CZyl+BY5sTZn034KmVScb01HEFtKDc0iOinlGU9kRhcHoNu+Hao=
Received: from BYAPR01CA0051.prod.exchangelabs.com (2603:10b6:a03:94::28) by
 SJ0PR19MB5415.namprd19.prod.outlook.com (2603:10b6:a03:3e2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.19; Mon, 9 Jun
 2025 12:39:44 +0000
Received: from SJ1PEPF00001CE6.namprd03.prod.outlook.com
 (2603:10b6:a03:94:cafe::f8) by BYAPR01CA0051.outlook.office365.com
 (2603:10b6:a03:94::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.34 via Frontend Transport; Mon,
 9 Jun 2025 12:40:12 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00001CE6.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Mon, 9 Jun 2025 12:39:43 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A322F406555;
	Mon,  9 Jun 2025 12:39:41 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 740B182026B;
	Mon,  9 Jun 2025 12:39:41 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com
Subject: [PATCH 4/7] ASoC: SDCA: Minor selected/detected mode control fixups
Date: Mon,  9 Jun 2025 13:39:33 +0100
Message-Id: <20250609123936.292827-5-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250609123936.292827-1-ckeepax@opensource.cirrus.com>
References: <20250609123936.292827-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE6:EE_|SJ0PR19MB5415:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8191cc88-c8a7-4de1-4a59-08dda752b5f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|34020700016|36860700013|61400799027|82310400026|12100799063;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nQWhTbRP6btibjtX5cHO0XJ+Q6jkQrECS6UYrvJKrnwNi0nzeU6FbQZJFLXW?=
 =?us-ascii?Q?hJ9cnuAusDAY4XsR1Sb9dYbWuq+hjgBARXUc/MHY9ChxigREY2eEK+eiASBB?=
 =?us-ascii?Q?ztb0HIW+PWZYEWTfiu9/kvy0IRo/9CAEUvVG8I6+g+tDLqSJXp9VEE3y4KnS?=
 =?us-ascii?Q?/6odvbUntVqOzoIDo08UXhIeZr1bLlv9BH/Kf7WSxCAr21VmEo1MFZs+/5QU?=
 =?us-ascii?Q?UTYLWo5G7mnVeOfVKAtS2j5UUuHKow/1/iyf3xfhBPSfbvQiwLweq9micA94?=
 =?us-ascii?Q?nQEK1PupakxkCTLbHceLX1iHTt1z/19F9W+sYezrTOLtAiPz5dTeQ7aMNcDS?=
 =?us-ascii?Q?VQkRsIYnmSnTf1DE9W8LtOnhXIHDCSx9l7B3wCc9z63cpe0WL/gTO09y/H7x?=
 =?us-ascii?Q?ZGh2v5B+tpLi70vSsRDDaZUyER9AXnmGFwyyj8tqzUbMuPK1Zao22+lWtKzC?=
 =?us-ascii?Q?+3qEclfq14vW3bNul6cU9rIITAQItVIroS/4O9ExqiOtj8gOeWoEsl3DACeY?=
 =?us-ascii?Q?71MQVl0lm89aXEsJBfQaiPdwMYKJYq1LI4NjZCrJfU+Unqg2xl82rlZXQI5q?=
 =?us-ascii?Q?tO7x0g4tOCbIcEnZWSXbSVWJGGMNSx4be3WIlMqJ0zFQdrrqhpy8CN1SDvYW?=
 =?us-ascii?Q?jDdX7lwQDdzDL3y47p/kQSrED5YlkMzgNRkyLEMLmeHqniYvGlBukNta5XUl?=
 =?us-ascii?Q?nLA914Z1hDk+NeBZCQQGFSGdMDRTzdNKtWeOSEnYXHHWaR49mfo+a8ChsFc1?=
 =?us-ascii?Q?qxKSFFFKfW49FrPltBqTwW8h8ZcMjiUtn/6hrR7crJEFh7VqkaNGjqjeHCLq?=
 =?us-ascii?Q?GCe1uvABQQnD9z3HMB/3WkYFPQu1Jo+H09Mu/iCB2MKQ1hmikWTUjaKXvBS4?=
 =?us-ascii?Q?phcULB1LN0sI4sSFmHer+4Kj6oyUnyjHA4ETz6mAsXOO+v0LWXnEUQneyP1h?=
 =?us-ascii?Q?JGaEbtGc+mYIruXxTFvtZucfRt1dZjT9LfeyLf/qqk+vHia3i+t+d6N5jlM3?=
 =?us-ascii?Q?lXtwnY1jnAr9dGl2aLsJWIS/SsNJUVH+mvz+nFmsTJKZD2I1CEcRbY9K47h6?=
 =?us-ascii?Q?iH0UOad/RxWIne4mmPvLMTGBXVIbo/6MnICM7pMbhKhwNTmxEkFmREz2C/yN?=
 =?us-ascii?Q?DmyaqHiWjIegTndcYh1ZF0zyjllWp9tUrJYGzccnqdwrTh0IN9Hf+JH2XVS6?=
 =?us-ascii?Q?I2dsvYHh/epjoZrwHP33COci9Gb+dMWLqzbQRSVlAua8BEihwmUmNU6sodN+?=
 =?us-ascii?Q?a2YYLwhcj/Z0C/5dJL1j+1KsQcrPeRhpV52J2ue3xDJ9+Gc0fyghqGMnnv0i?=
 =?us-ascii?Q?jwgaLotKWHDAUTRQ+C27tevo5l5XAXK+8YWYIsUNsiFtYvlHf1Gz9QOMEPD0?=
 =?us-ascii?Q?ZXTef+5brlDB+Ayb69e1Ul0dFOesI+upS42XI43PNE/vFOvHFneY4BVAjuNL?=
 =?us-ascii?Q?Ax/HNRbFwlIYqqil5loE+c8Ttt3crbntRfzN5JX859pZ743Hr7feDmNZ/bxo?=
 =?us-ascii?Q?aIt6qvCTNUbpYMjQ2QRohoaI+M43QSzK03pu?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(34020700016)(36860700013)(61400799027)(82310400026)(12100799063);DIR:OUT;SFP:1501;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 12:39:43.5331
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8191cc88-c8a7-4de1-4a59-08dda752b5f9
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB5415
X-Authority-Analysis: v=2.4 cv=Jfq8rVKV c=1 sm=1 tr=0 ts=6846d615 cx=c_pps a=CggIZtEdKO2ExlSOZwbBuA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=6IFa9wvqVegA:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=sw6q9iSsejWU8wM_bgEA:9 a=jZz-an6Pvt0H8_Yc_ROU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5NCBTYWx0ZWRfX4xFCzDBhqrR5 /pdGPo5N8x1gLV9vA8o6vBy/1ybKXC91n3gD6DjeOXl7BoNx9oV5ZP13CB9gvhU+dRIrwYxu7DZ QvIwIvOopMu3jn5HCJO/dlV71U/Qc09F47Jx2l+DyKmRC9EzsY5dB/7ZvqGtOdf4+IA22cY6frO
 YsXzE44X6z3VkmUCqga0kxwPUp+BXwau0bIwfS8PN3UanfWQkuUxH38NV1FFisaoDlmP8/++6Ha Bwm/HdiybFC9vQ0hTRS0X1eB9TzzK6R5qga2DfLDiRPZGfjgLgvPuCdCoTGWFBUKGbUtoxXFea7 5D2mKGloeLHn6bMm5SPCNkIqbGM4mWnctVkaeGNPKzt+ViYwBPrkuLxokX668ZOun6hSW/6VSLF
 GF4M0m8ukZq97AweDiyHNCPdiiGrl5y6ZogBilbTp2qlgOw8nXrooBVOzifWGINIm+sbQaYJ
X-Proofpoint-ORIG-GUID: 4Z0cLdnTDxYEbZOfShtlLg3cZXOUcjeM
X-Proofpoint-GUID: 4Z0cLdnTDxYEbZOfShtlLg3cZXOUcjeM
X-Proofpoint-Spam-Reason: safe

Make the names a slightly better match for the specification and add
some constants for the values rather than hard coding.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/sdca_function.h | 9 +++++++++
 sound/soc/sdca/sdca_asoc.c    | 8 ++++----
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index eaedb54a83227..e5166583d2581 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -318,6 +318,15 @@ enum sdca_selected_mode_range {
 	SDCA_SELECTED_MODE_NCOLS			= 2,
 };
 
+/**
+ * enum sdca_detected_mode_values - Predefined GE Detected Mode values
+ */
+enum sdca_detected_mode_values {
+	SDCA_DETECTED_MODE_JACK_UNPLUGGED		= 0,
+	SDCA_DETECTED_MODE_JACK_UNKNOWN			= 1,
+	SDCA_DETECTED_MODE_DETECTION_IN_PROGRESS	= 2,
+};
+
 /**
  * enum sdca_spe_controls - SDCA Controls for Security & Privacy Unit
  *
diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index 83911dab73ae2..dd7b19083c85f 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -246,12 +246,12 @@ static int entity_early_parse_ge(struct device *dev,
 	if (!values)
 		return -ENOMEM;
 
-	texts[0] = "No Jack";
+	texts[0] = "Jack Unplugged";
 	texts[1] = "Jack Unknown";
 	texts[2] = "Detection in Progress";
-	values[0] = 0;
-	values[1] = 1;
-	values[2] = 2;
+	values[0] = SDCA_DETECTED_MODE_JACK_UNPLUGGED;
+	values[1] = SDCA_DETECTED_MODE_JACK_UNKNOWN;
+	values[2] = SDCA_DETECTED_MODE_DETECTION_IN_PROGRESS;
 	for (i = 0; i < range->rows; i++) {
 		enum sdca_terminal_type type;
 
-- 
2.39.5

