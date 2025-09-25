Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74F32F60C7
	for <linux-sound@vger.kernel.org>; Thu, 25 Sep 2025 10:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758797663; cv=fail; b=c5uQVxMC/tIPrKCaqVaHmEdPcWRA4TbF3f2HsHMdvFoAul2J04sd5td1TNED1rHBkGAlP6w6MAHt6couXLeovKrZtxtaK/bXgwhdwGxWcPnLapO/CWTAhGX1ClbMVXO5kAF73qPp8tuGxgn0yJEX0+VWOwONx9dPJYa/tuZtzwI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758797663; c=relaxed/simple;
	bh=cGFJgYE2T3P5r9d1LdElxzcsaGLfx37KWTMPxGtw8AA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Lx/QzOtIBAZOMTXSJnoiSObzvmpt3jcUF/qVtPe2fJocvNxLafO7cTUWqfQ9Q5iB91aaRsSTC/etQ8iE4lLvI6NBAkmenujsuUux0IgD7bBDNgZP3aQU+wmiXB0+qrm+cerfcrqZvBvoSCfDRQsDR4g35Z1mJhnOk2MGE65I59o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Uu63hM21; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=BdfknBvT; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Uu63hM21";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="BdfknBvT"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58P1vjO81785534;
	Thu, 25 Sep 2025 05:53:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=YR0kGFnAXQ0xhQ62Our+smTi234Ks/vlKxvf8Ri5Rs4=; b=
	Uu63hM21cS3FCe5vYiGsIKiAeAkV/u4tNf4n+3dKzPzMJ7hlL8bBSTiSwn5IBDMw
	gP+TbEDvnDFRKqpjFTj4OLlNI6UfJR9oCdSzB6bvbqU6QFoYc+/vEOGMxFDU0Puv
	p10HYrJLV0YLcwIJSOILXop0i50vd/5NgmYdf7G+geTK7L6LWfPWaoNwq0PkPG9t
	bIGv0L+58jbDAWbhGKHToNhgqlnP8iMtjgBmmBAHsAYgfvJwhT5kLpSiisNQUdnQ
	92tbLYryp+7aDINIcryLqm6pjXMd6dsGwgnXj0qm4edUyCVFLGMDTtal5g/UcVt0
	4ZVgpL9qgfSZw4qbACuoVg==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023115.outbound.protection.outlook.com [40.107.201.115])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 49cvharf6e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 25 Sep 2025 05:53:54 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vqQzVemBnSBOQtq5+Bdl+L9UZKMY0X5nFtl4wHdWGRfletnHc21YArl5xyBwTHoO27O/6nwEEyBHUhFoPKdDmLFfUrs7P1JcSslwPez3VSRRcclnNz19sFmrh+n7+OMTl5ywiiG23Lvu5OqVCkuuBhz9AyLlxf/+38XMPq1a7epwugaInCuCLtU82ddbE60V/Pj5pMgPv/yB78zDH5elNJL/j9y71ucKnH5VbJB8Li5nG82eBQmMJTMEn8sdRblgF23XlHYROvNTZaybAJT0TSip3N4uU3HCmxu2DQVuRMaU1SNUHZJf6hCCCk0y/Ih278aZ0h4U/HKAW8wKOHMwIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YR0kGFnAXQ0xhQ62Our+smTi234Ks/vlKxvf8Ri5Rs4=;
 b=SffZOOioouMswjqBvIkhD8HErwK2OpKprC1iOpjWsv8ASD3pCk0z+DmBYn6M53tL4nXwG9lV0QYRgOzu/M8No6IN+c7WneojGFeqEDkNXRAb5aaAYQnbxqqS26zGlOnSzN7bARx4aiGBcEdu+tXbS2f5jJqrZ56fygknMfji2X8az4iuNUXVyjNFvWlE9T2LH5N8uiHYC3wGSr7NaD6KBDBcqHwwIFvLRJ7vCWciHOIBPuRVE+2+Eeino7b5XDiJ8HSgpyxdu4szsZR163tVG/1c1Q0UI2345aQWnpoH1c6+IYGG8aLO2tuxmxHyvPAZW9BJJRRprA1pGqC3jrCBjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YR0kGFnAXQ0xhQ62Our+smTi234Ks/vlKxvf8Ri5Rs4=;
 b=BdfknBvT3jrCE1hjy/OjZKP3H+2xamziL5cLq2SAnfxCFf9vLRYC7UYwVblzNq6MpQp+0hHy1J1NkKftiSOZ6v+e0jVrlG173xP4Qwc76zSKV22WaLqjwvwvJItOshafo6IqymyVXEjVHVBn+LiEDorM/kBoG6+FT8YbtAl5ROo=
Received: from PH8PR22CA0007.namprd22.prod.outlook.com (2603:10b6:510:2d1::12)
 by LV0PR19MB9399.namprd19.prod.outlook.com (2603:10b6:408:326::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Thu, 25 Sep
 2025 10:53:51 +0000
Received: from SN1PEPF0002BA4D.namprd03.prod.outlook.com
 (2603:10b6:510:2d1:cafe::9a) by PH8PR22CA0007.outlook.office365.com
 (2603:10b6:510:2d1::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.22 via Frontend Transport; Thu,
 25 Sep 2025 10:53:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF0002BA4D.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.9
 via Frontend Transport; Thu, 25 Sep 2025 10:53:50 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 89B3A406579;
	Thu, 25 Sep 2025 10:53:46 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 75C2182024B;
	Thu, 25 Sep 2025 10:53:46 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 11/19] ASoC: SDCA: Parse Function Reset max delay
Date: Thu, 25 Sep 2025 11:53:33 +0100
Message-ID: <20250925105341.194178-12-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250925105341.194178-1-ckeepax@opensource.cirrus.com>
References: <20250925105341.194178-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4D:EE_|LV0PR19MB9399:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e41c8a67-4354-4bf0-5f80-08ddfc21cfb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jZC9mfuB4JfN/7mJuEZo3nF5LgnkHsKezdWl9QZuHq6ljMQK1ZqujbAxVz2O?=
 =?us-ascii?Q?FlzmgWkQxqw/ZWm6wJ/wabxx7cTS4hACDFGeBYpLfAohcdMhDTrqd6Sx1lUR?=
 =?us-ascii?Q?0hUVFjPfKIJi9nvVXOzIWuujOZdxrWz7+kwNLgNRyRPranUI5wkzHDVpORiJ?=
 =?us-ascii?Q?ipwJKMmEYAT6+/gkIFYxwa5iIqyA2zRa4h7jqj0nsytcAmdi+CAIRWZON2Ef?=
 =?us-ascii?Q?S4P2P3cGbEZQ6y00i9SlBLwOGm5i2b6Cfx3CR8AVy5Gd9i411JVtwudbbNmD?=
 =?us-ascii?Q?BdzNejYJ5eGYajVtn75txj5YRWlxJyiSJjH6t+o0flvL0WBHUBG/mfvYU+54?=
 =?us-ascii?Q?/5HPwIli9Xa7mIXO9etlnlVWRDrVNrJCDAtEi2i2oq0UcmjDcjaLuBdWW+GZ?=
 =?us-ascii?Q?wsHM/VAY7JEZPYNxa2Gq3U/oUcFat2zYy87k08h8JbfN3WDHGrkHiwsUFSeD?=
 =?us-ascii?Q?clZeYDNpkb1F3BQ3dZy5G+nIzffgr4oUr+53xgAjqjJ6BptNhPB9ypj+qELr?=
 =?us-ascii?Q?Iju5HGv5VXZb+tbsTkQQmSZ3iVJpqZN/zsghBSAf0L60IglMqM+zWc3pqwSE?=
 =?us-ascii?Q?B4RWu4a1UkJ2sWB5TUiODC8d75EfRLYXMJjZS/0UIUjut81eIrk1HcdOhENx?=
 =?us-ascii?Q?0eZXrwsYpxKvmLJd7Lry18Rc5H52LrWzOZxu8F3VRqs2pcTsTy/9mWxP/e97?=
 =?us-ascii?Q?WPa+umjQLCE7IIKsSg7xUUH1mHK75WJb6WBwHy1Cr95rFd3ee+2dtxclhdJZ?=
 =?us-ascii?Q?ijLyQbIBLWbW/TNxMHwX2jlkUMpH9XbMKJHseL/FE5g66D5uyFzRJJa0GcHX?=
 =?us-ascii?Q?MN/zZpoa4rtIR/SEo1VQXKKxQdvTvvB38Xc4r7B62MAvwhfjddIVJoR8LaMu?=
 =?us-ascii?Q?+wrQoZCmE7pIl5QnUmNvWYZOZgGSjEsrLKKE9oAP/G5zJttJj0xQWud+QAA/?=
 =?us-ascii?Q?1xtP0NDKBcZcwMWCCH+ld6UJ3WNyU/QXKExlQcpEVu63yjd0jmrZipvb8eD1?=
 =?us-ascii?Q?3V4B7gFM8jbIDRQzCod2Jxvd0mXSdt0C+OadrpqnYn7Mqae7Px8n/mLJBy3q?=
 =?us-ascii?Q?hxJnTy4LAvQYwvLcZrbPq0Fuy6dVfP5gVQcvOshJfS6vMSc6oADcf27J2BSL?=
 =?us-ascii?Q?kKCrThQSkgcG4LGilBNeQ/Nhr6yFFo9Fqa7MeFmG+LucRSr3p43PIvsjvFhR?=
 =?us-ascii?Q?suer1gQbpNsGhJp9Mr5zlG8HMoaCifRtrFwhoTmHUcaXu/8pD5WsiHAfjIsd?=
 =?us-ascii?Q?i2lIglTeTEBniLBVtRAlSEYxEI5gvuicDc8GmjxV4AonVkAVIqzT2eNW00Gy?=
 =?us-ascii?Q?ymrpMySAJS8xn5OYHWbABo7Y7nE3hB7iKU6RrSrNjkgBUkQgV2e9hXmbfNXB?=
 =?us-ascii?Q?4PMclUb9X3JXzvOQgjNAWBjhduklrJHYrHC7x1Q8x9oXnNso3Va/zeaZk7hW?=
 =?us-ascii?Q?FT+74IiFD9TWGs3HFPSJv3NsYtKwuIgmm84nCHfX1eJ0/lvuRaXmkzmgJzX0?=
 =?us-ascii?Q?ca/MEg1QeVxajfpps83pZc8bVfJsUXcYROquKNxdwmz1X1sEOrmbJV6qYfBJ?=
 =?us-ascii?Q?A5PwJ5OIJq8i2LNuFtw=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(376014)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 10:53:50.2504
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e41c8a67-4354-4bf0-5f80-08ddfc21cfb3
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF0002BA4D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR19MB9399
X-Proofpoint-GUID: _1QOziDj1Vsqlmq7Jo9Vml-JLOmnpmWl
X-Proofpoint-ORIG-GUID: _1QOziDj1Vsqlmq7Jo9Vml-JLOmnpmWl
X-Authority-Analysis: v=2.4 cv=dL+mmPZb c=1 sm=1 tr=0 ts=68d51f42 cx=c_pps
 a=8YD3JtO18OBpAIphJ6JiAg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=QyXUC8HyAAAA:8
 a=w1d2syhTAAAA:8 a=OQzKDbBj9KY52EoSo_EA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDEwMiBTYWx0ZWRfX5NdI8V4dPPJd
 9hxP24ui93tvv7Au3lW6ll8o4uesu4Tcp/inLrAqVrrRod75XcNfFha+JE+Oe47TTTke0uZEEeX
 jdgwr0ogJG1qnFhuoVnlyDvcazAp4V+Uzmxl8seUmxoTw04WGiIWmg/cpkdTfGtDb7v3GQeJSV3
 yZLl4tv4AlTc4vWVi1wALTc+3ecS2YEi7WOw9CT7gLoIlkeuPe31v+Gip5fGij5NdKgbrGqdKsE
 XiFf/oaRDBYdEORIRdKJMQaGMfeIvsyOdQLprJa4vaVEOc/oBDorr6p4gCyt0wfF4V8r/SgEj2M
 3gsBEm/IQjn/rA/PlcEu9DlMj5dvS6EuQFroATnUQsUvOorKP6Qs0u4KzUB+sw=
X-Proofpoint-Spam-Reason: safe

Parse the DisCo property to get the timeout for a Function Reset.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v2.

 include/sound/sdca_function.h   |  3 +++
 sound/soc/sdca/sdca_functions.c | 10 ++++++++--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index f2ce13162151d..2e988a30481c7 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -1323,6 +1323,8 @@ enum sdca_cluster_range {
  * @num_clusters: Number of Channel Clusters reported in this Function.
  * @busy_max_delay: Maximum Function busy delay in microseconds, before an
  * error should be reported.
+ * @reset_max_delay: Maximum Function reset delay in microseconds, before an
+ * error should be reported.
  */
 struct sdca_function_data {
 	struct sdca_function_desc *desc;
@@ -1335,6 +1337,7 @@ struct sdca_function_data {
 	int num_clusters;
 
 	unsigned int busy_max_delay;
+	unsigned int reset_max_delay;
 };
 
 static inline u32 sdca_range(struct sdca_control_range *range,
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 2e66748462213..6602727c73f73 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -2033,8 +2033,14 @@ int sdca_parse_function(struct device *dev, struct sdw_slave *sdw,
 	if (!ret)
 		function->busy_max_delay = tmp;
 
-	dev_info(dev, "%pfwP: name %s delay %dus\n", function->desc->node,
-		 function->desc->name, function->busy_max_delay);
+	ret = fwnode_property_read_u32(function_desc->node,
+				       "mipi-sdca-function-reset-max-delay", &tmp);
+	if (!ret)
+		function->reset_max_delay = tmp;
+
+	dev_info(dev, "%pfwP: name %s busy delay %dus reset delay %dus\n",
+		 function->desc->node, function->desc->name,
+		 function->busy_max_delay, function->reset_max_delay);
 
 	ret = find_sdca_init_table(dev, function_desc->node, function);
 	if (ret)
-- 
2.47.3

