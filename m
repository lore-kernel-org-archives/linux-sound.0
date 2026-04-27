Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C57122A4FC
	for <linux-sound@vger.kernel.org>; Mon, 27 Apr 2026 12:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777291205; cv=fail; b=VK4D0Wxkxut9vEi6Tyt5E7rcnIkyARxPAesdika9VNtVBaDxffIOCrlxkiDpkXKbLdgGqjtM5AGnM5ST+STSfea1hygg/0Y0Z5ChJfU8w0RKS2u2asFY2sVe/ElYFGY9er7SkxvhJRo70ljQMq13e/bfOAyukuJ5DIl745jnMGc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777291205; c=relaxed/simple;
	bh=LDwka08CzwMP0Hp4N7KXpmDl4/DC0PuntD8MuR22WTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BDx5e9phWT8Fk++yjxa34gI0LBvCVswsoc/HerpBS1VnbphSmfSq5R50jZG95p8sy0oZ0AC0GexOcBFwcoqov4Vp7Ey8qZUzhwrUH968sDpNDPCafy41ieOWQNKUisAIRFPjFRHBd3StcJOdjt4L73iwqB94QD2c0pa37Mx9lbI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=dMFeO0/t; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=k8v5PwqG; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="dMFeO0/t";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="k8v5PwqG"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R6AhQj2037150;
	Mon, 27 Apr 2026 06:59:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=EsR+FxU1A3IMVVOma8/st5RlzvegyTE102AP/+RLb3w=; b=
	dMFeO0/tUh1MigroD3EbcvaOmeoB9NTLhW4R8fBOQdC/+9h/6JpkT+hPOilnI1pk
	fwTf5xw/1DHtPLD1Nx6Ir2zSCRbgeLg7d62abQbcGzh3hJ1rbwuwzgLnKpzYHGLk
	cweIVZHl1VvHgfSzO9ZkbTMW9/vyqTeEi2OGAYfSJsp66Feah9gIX4xAtVbAFEj0
	WMilzd5ZwLUWi7cuVGTUf/vRzDJj+/HAm6VYxuSLAnUuiKp4XhABSVIn7UR4cH3O
	WcCGJ2TYk352Fj6nWJSx2w88Q9ZKV6DK5BGkNL9clongF+WgRvHxkmtys4AwUueK
	lKCLxboH2IqfYodn6HJKUQ==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022072.outbound.protection.outlook.com [40.107.200.72])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4drt1jjc0h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 27 Apr 2026 06:59:40 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sSxwRhlR4VpZrkAkrWETg0EYLAD0xY/2wVms12QOuPOrUEqwYiRxKjs+UepYe+j1QI8YJeXTWREPFxw+1qC+DgQ2cXDKEYrmEV5GCZU9iSJ8p8S5EtJIzIOHGOiBZ34LFRLwuB4y9I10iprMBeqxZdJBVuwZL8XeEOGOnpO5BUIMTK82ketoMre5YYopTOWgOa303bugsJDyMOulLtcPU1op9Q0giIfyS3OutFv5TD0mKiosDFmLpILCTIG5CVjT74xFNDulM0tQmtC6iL7QNRoWLuvEcm+oNM907KncCiRQxhYuvdI4S+AvT+nJd/JTwaKNWnzRCkNbPaDQxRUUEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EsR+FxU1A3IMVVOma8/st5RlzvegyTE102AP/+RLb3w=;
 b=yB/Rs4JtRbi6XVAHUaSsREbzBIr0AMcsPlS8tDSnY6N0l3EWrAb4S0L8WRP6lYAo8aYdR77RACxGVuoRPIx+6tevhAeUYAXxoIpGhqjb0BGEYtS5E7xvNh5XgAu1lF8GzJXQUaUZGQ+FT7E0oWvxdPnxJ6SZg7Hd8eppR7O4X3Unlt4B1/D7cJ9bbWhNfXAnES7QI39fz7eAsN2yVUaA7GidSDFcoCRdKSd9jr+OZt0kJ5XUoFgecN08m4e1j+lBNqZdgzBrncasLAprd1Ij0e0X5YWQcmXpI9uD9LSaOS0JeYvvXUzYYu3oBGJr8m9QbK8gYrYtbXXTnJXroFImdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EsR+FxU1A3IMVVOma8/st5RlzvegyTE102AP/+RLb3w=;
 b=k8v5PwqG88hRwTGr4Fn5CCDnyvBc0BUXju6pcIJ7+h423UbFM2cSoBYS7Iblio0HQuuWHHSlyPMjV0xdx7Dqnzbu63XNqEn2Dt5ys5sl4603HvozK0cBlI5WGnX0PjZ2ImLAR6BXw0KfunsTUT0Z9420xsypkyAcBX0UYxviK4c=
Received: from PH7P221CA0049.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:33c::32)
 by SA7PR19MB997344.namprd19.prod.outlook.com (2603:10b6:806:4d0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 11:59:31 +0000
Received: from SN1PEPF000252A4.namprd05.prod.outlook.com
 (2603:10b6:510:33c:cafe::d1) by PH7P221CA0049.outlook.office365.com
 (2603:10b6:510:33c::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Mon,
 27 Apr 2026 11:59:31 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF000252A4.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.18
 via Frontend Transport; Mon, 27 Apr 2026 11:59:30 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 9B496406542;
	Mon, 27 Apr 2026 11:59:29 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 8AAD5820247;
	Mon, 27 Apr 2026 11:59:29 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 2/3] ASoC: SDCA: Remove sdca_function_data duplication
Date: Mon, 27 Apr 2026 12:59:24 +0100
Message-ID: <20260427115925.3801099-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260427115925.3801099-1-ckeepax@opensource.cirrus.com>
References: <20260427115925.3801099-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A4:EE_|SA7PR19MB997344:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 709772c4-e5a5-45e7-e3b7-08dea45470e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700016|376014|56012099003|18002099003|16102099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	c/3R0OMumAGyc8mIXka2nyai3gRIC+I8pvdOcGcrQRsOuGuib1hk85GnM4ktFfFCcBhuPRmG7PStKQtj2/0/u0hGJXrPmXGubD7ILFz19CSQpubAuBgWx2jrXtj8x3DhCzPSVXeH/CMQtj8MMuWXDgx1TAcO9qusQszYg4RkNip1Ao+6QVpRcijRWTVpXgb8g8yNsrsTan7/j72cFsvKHHLuRiLsDkU88EV1bfLP5Za6fXQJGwklP+nbFaAK3IKvwpXSTp6kG1CcXr6hbMRcImsphzAowgACHmb4Vo2a33jnAl2y58vb3TQtE5pgpZukgZlNCWDVGTwdhL+x3JoZKv4CVADr4FdonkHRjFEX2lpHFGoPB8d40z0fNjDBVA1Yvz8SUePtKOe/LvGZZ6rspD1CHnpTWulcGQZyu27TSmVsGZJ4PA+07SPigpcXuTQLGwGPT26hOcczAwyBlVV5RPfvY0DYqxVuIRdi6N2otA4frQ83VeiE5MTZiMDjq5mdH/I8DqhL+skprerfQtROo+hOEd4iAL5FiNSWvhWJEta6tMMkUy9XwMxrIrs8VZqA5dbMDAyqgdgUrx9eNd4LXxilJ7GyLVMGdVwQjjKGusHOSUxmo93hUtf3SkNgnlBlRE+7wBWUh2pmnCE2UIfTDTZDWr9Tdrs/CpWxyaXVK3tf39shwWu03acYbO/8JPtwu0Q+JJ8olu9ZxJFu8jcy4TKT0+ghzpR83gLnglQ13NbyVkXAd8s9s4/2/0edQH9i11V5IiBsTi4DPJp3u5d5lQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700016)(376014)(56012099003)(18002099003)(16102099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wsmvxgwZUVoEglykiG9O984/YtsZDf8TY6Y3D/UeCt8pO8Sx4CKV6bfzhKOv5awb/X19JaxbogYYZ5PJistEjZVkqX8fanbrqV42JSd4yjvj923i8QhvaddKZR6XCZxQQRF0IRhUMEXI1U8x/eSHBLdEOMn7qPvRADDj49TG1wGA4N4b1PGLkkMloDeaGcwo1IFTXEp1bN1v5p4K85BV24mavnd2M/+pY8+nRPjvxxMCXDnC+SS9HGkSt/4FJkKYJ6ECkl6TLTAz/FHFhkMNJJo3vqqHkqsS23UM/imUxUcB9MGdZRFoCUo3OTl0GEXCMys68U6qrnPTfiQCtXSTUJbSoRt2FZdgcj/SqLW44sYMBvcoRNseqrjIrytpJWoYMBj6L032t4eQkXE9X14YkHzfSBd1cYxn8BHv66u7xBiYEcjYmCPQVm9dTurh8rMz
X-Exchange-RoutingPolicyChecked:
	rFhFBIrA/qYaUFGsk03kONoFXtzwzOjSEbaLjOg49Ub7Qiz2krx6qSoaXmrn9cbl4m31h9OuhtmIvieE9P189hABrgewy279DN5V0iDK0+EoKl5JCw3nEOZWLV6YxxvKJdYaj3GOKYP7Bp7daW/xhUvFNGEHEe8ju9/cm1LtwnyuAKjw//FmnLvzRlbZVfb78+mFE/BBxD0/0bRrV3DjmskyemlekxzBByUxd/hgfrcZPPUGoL1CoIQR5QSVz98jg+Ng5QCCJnuKwj6b4gfgb0336R44JAPVlMC/NPCCtB+Q4t+9iTsPfHn8K+CHquFWlI3gpiaLhgSZJZFuZT+BXQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 11:59:30.8519
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 709772c4-e5a5-45e7-e3b7-08dea45470e2
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF000252A4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA7PR19MB997344
X-Authority-Analysis: v=2.4 cv=fbudDUQF c=1 sm=1 tr=0 ts=69ef4fac cx=c_pps
 a=lZ5sci2pGqwcsYvHxs2BaA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=QOvZEWDp8sjL2V-Hxj8A:9 a=O8hF6Hzn-FEA:10
X-Proofpoint-GUID: RPFSerQmrR0L0sPXS9o0YQBUb8Wo06z9
X-Proofpoint-ORIG-GUID: RPFSerQmrR0L0sPXS9o0YQBUb8Wo06z9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEyNyBTYWx0ZWRfX9n7MGX7N0hY4
 Mh7mY40boVCxW+Tu0RvchX1JMNrA0cnP8yOw9Nlbw5OWwRaoh+DZCT2fV7H8RMXdr9MuPxJU3yo
 f/djvTLXV/zVxbEu1JEFZHPm5abvW8Y8DevnimnF/vTaX7CSzFVLumBO9CQtbDMktxO0Ok36o7t
 dIU3RxJiUjRpPLHLxh8uVh7kmbqG4HIRlWpWhTbwvTrRre4uyIrCGJIfBV7dk52U3W5b7kpjBKN
 iUl/JbkV9FErOtCkz/ZFjvt1ne+8vwvlFwHdRk6ay9FAoONLdbC33t3hG8a5LUx3teg94sZpxTK
 CnTG4hHSK5GjQQTNR8uB1A+5mBh70W+Knxw9XL6/cGGCUGtcBzfIb1Hse1t8TmRX9yalNxZ7DLm
 W8ko89WuA8ORd6Vtrv57D++V0MNEzd5m8JfsN576q7s9wJJSSI/97akA3GyUrMcNWoC+L7T5O/z
 6FX1L+KccjCQfSOfwuA==
X-Proofpoint-Spam-Reason: safe

The class driver internally has an array of sdca_function_data pointers
that it uses to store the parsed DisCo data. However, there is already
an sdca_function_data attached to the auxdev device. It makes more sense
to use the one already provided in the auxdev device, as it could also
be used by custom drivers for parts that require those.

Using the auxdev copy also prevents the need for the class function
drivers to search through the array for the correct data, which
currently is based off matching the function type. This has problems
when two functions have the same type as the current code will find the
same data for both drivers, using the auxdev copy of the data avoids
this problem.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/sdca_function.h        |  1 -
 sound/soc/sdca/sdca_class.c          |  7 -------
 sound/soc/sdca/sdca_class.h          |  1 -
 sound/soc/sdca/sdca_class_function.c | 23 +++++------------------
 sound/soc/sdca/sdca_functions.c      | 25 ++++++++++---------------
 5 files changed, 15 insertions(+), 42 deletions(-)

diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index 0e871c786513f..b1489178b0ef8 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -1452,7 +1452,6 @@ static inline u32 sdca_range_search(struct sdca_control_range *range,
 }
 
 int sdca_parse_function(struct device *dev, struct sdw_slave *sdw,
-			struct sdca_function_desc *desc,
 			struct sdca_function_data *function);
 
 const char *sdca_find_terminal_name(enum sdca_terminal_type type);
diff --git a/sound/soc/sdca/sdca_class.c b/sound/soc/sdca/sdca_class.c
index 6e9b66f718019..a6a3da8de4371 100644
--- a/sound/soc/sdca/sdca_class.c
+++ b/sound/soc/sdca/sdca_class.c
@@ -183,7 +183,6 @@ static void class_boot_work(struct work_struct *work)
 static int class_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *id)
 {
 	struct device *dev = &sdw->dev;
-	struct sdca_device_data *data = &sdw->sdca_data;
 	struct regmap_config *dev_config;
 	struct sdca_class_drv *drv;
 	int ret;
@@ -199,12 +198,6 @@ static int class_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *id
 	if (!dev_config)
 		return -ENOMEM;
 
-	drv->functions = devm_kcalloc(dev, data->num_functions,
-				      sizeof(*drv->functions),
-				      GFP_KERNEL);
-	if (!drv->functions)
-		return -ENOMEM;
-
 	drv->dev = dev;
 	drv->sdw = sdw;
 	mutex_init(&drv->regmap_lock);
diff --git a/sound/soc/sdca/sdca_class.h b/sound/soc/sdca/sdca_class.h
index 6f24ea2bbd381..8b63e62485e64 100644
--- a/sound/soc/sdca/sdca_class.h
+++ b/sound/soc/sdca/sdca_class.h
@@ -24,7 +24,6 @@ struct sdca_class_drv {
 	struct regmap *dev_regmap;
 	struct sdw_slave *sdw;
 
-	struct sdca_function_data *functions;
 	struct sdca_interrupt_info *irq_info;
 
 	struct mutex regmap_lock;
diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
index 31fc08d513077..1496a15f7d2ac 100644
--- a/sound/soc/sdca/sdca_class_function.c
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -27,6 +27,7 @@
 #include <sound/soc-dai.h>
 #include <sound/soc.h>
 #include "sdca_class.h"
+#include "sdca_function_device.h"
 
 struct class_function_drv {
 	struct device *dev;
@@ -294,8 +295,7 @@ static int class_function_probe(struct auxiliary_device *auxdev,
 {
 	struct device *dev = &auxdev->dev;
 	struct sdca_class_drv *core = dev_get_drvdata(dev->parent);
-	struct sdca_device_data *data = &core->sdw->sdca_data;
-	struct sdca_function_desc *desc;
+	struct sdca_dev *sdev = auxiliary_dev_to_sdca_dev(auxdev);
 	struct snd_soc_component_driver *cmp_drv;
 	struct snd_soc_dai_driver *dais;
 	struct class_function_drv *drv;
@@ -305,7 +305,6 @@ static int class_function_probe(struct auxiliary_device *auxdev,
 	int ndefaults;
 	int num_dais;
 	int ret;
-	int i;
 
 	drv = devm_kzalloc(dev, sizeof(*drv), GFP_KERNEL);
 	if (!drv)
@@ -328,21 +327,9 @@ static int class_function_probe(struct auxiliary_device *auxdev,
 
 	drv->dev = dev;
 	drv->core = core;
+	drv->function = &sdev->function;
 
-	for (i = 0; i < data->num_functions; i++) {
-		desc = &data->function[i];
-
-		if (desc->type == aux_dev_id->driver_data)
-			break;
-	}
-	if (i == core->sdw->sdca_data.num_functions) {
-		dev_err(dev, "failed to locate function\n");
-		return -EINVAL;
-	}
-
-	drv->function = &core->functions[i];
-
-	ret = sdca_parse_function(dev, core->sdw, desc, drv->function);
+	ret = sdca_parse_function(dev, core->sdw, drv->function);
 	if (ret)
 		return ret;
 
@@ -377,7 +364,7 @@ static int class_function_probe(struct auxiliary_device *auxdev,
 		return dev_err_probe(dev, PTR_ERR(drv->regmap),
 				     "failed to create regmap");
 
-	switch (desc->type) {
+	switch (drv->function->desc->type) {
 	case SDCA_FUNCTION_TYPE_UAJ:
 	case SDCA_FUNCTION_TYPE_RJ:
 		cmp_drv->set_jack = class_function_set_jack;
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 196bade11ab5d..02abb7315b727 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -2158,27 +2158,22 @@ static int find_sdca_filesets(struct device *dev, struct sdw_slave *sdw,
  * sdca_parse_function - parse ACPI DisCo for a Function
  * @dev: Pointer to device against which function data will be allocated.
  * @sdw: SoundWire slave device to be processed.
- * @function_desc: Pointer to the Function short descriptor.
  * @function: Pointer to the Function information, to be populated.
  *
  * Return: Returns 0 for success.
  */
 int sdca_parse_function(struct device *dev, struct sdw_slave *sdw,
-			struct sdca_function_desc *function_desc,
 			struct sdca_function_data *function)
 {
+	struct fwnode_handle *node = function->desc->node;
 	u32 tmp;
 	int ret;
 
-	function->desc = function_desc;
-
-	ret = fwnode_property_read_u32(function_desc->node,
-				       "mipi-sdca-function-busy-max-delay", &tmp);
+	ret = fwnode_property_read_u32(node, "mipi-sdca-function-busy-max-delay", &tmp);
 	if (!ret)
 		function->busy_max_delay = tmp;
 
-	ret = fwnode_property_read_u32(function_desc->node,
-				       "mipi-sdca-function-reset-max-delay", &tmp);
+	ret = fwnode_property_read_u32(node, "mipi-sdca-function-reset-max-delay", &tmp);
 	if (ret || tmp == 0) {
 		dev_dbg(dev, "reset delay missing, defaulting to 100mS\n");
 		function->reset_max_delay = 100000;
@@ -2187,26 +2182,26 @@ int sdca_parse_function(struct device *dev, struct sdw_slave *sdw,
 	}
 
 	dev_dbg(dev, "%pfwP: name %s busy delay %dus reset delay %dus\n",
-		function->desc->node, function->desc->name,
-		function->busy_max_delay, function->reset_max_delay);
+		node, function->desc->name, function->busy_max_delay,
+		function->reset_max_delay);
 
-	ret = find_sdca_init_table(dev, function_desc->node, function);
+	ret = find_sdca_init_table(dev, node, function);
 	if (ret)
 		return ret;
 
-	ret = find_sdca_entities(dev, sdw, function_desc->node, function);
+	ret = find_sdca_entities(dev, sdw, node, function);
 	if (ret)
 		return ret;
 
-	ret = find_sdca_connections(dev, function_desc->node, function);
+	ret = find_sdca_connections(dev, node, function);
 	if (ret)
 		return ret;
 
-	ret = find_sdca_clusters(dev, function_desc->node, function);
+	ret = find_sdca_clusters(dev, node, function);
 	if (ret < 0)
 		return ret;
 
-	ret = find_sdca_filesets(dev, sdw, function_desc->node, function);
+	ret = find_sdca_filesets(dev, sdw, node, function);
 	if (ret)
 		return ret;
 
-- 
2.47.3

