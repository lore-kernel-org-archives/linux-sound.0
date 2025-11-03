Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7417A3148A8
	for <linux-sound@vger.kernel.org>; Mon,  3 Nov 2025 15:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762182530; cv=fail; b=RYDHSXD/+OC3QmgeP42bdGvxST+rDgZJV5sHU5dE4cVgXc/BffeLwMbmM58OPcukxsLSbYWy9/qNUJMjwsP3LHKfzbfMVYwqxWZc3Vm3trllEX4Q9KsUbcVnw8bqiEfr84c9IUqekdO82mY4WU+G7rY0CVUjSG6TRK8v9iqgcn8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762182530; c=relaxed/simple;
	bh=V56Tgr8mS8i32GYzGIZpkIedFL44ONLMEYq8snhltUE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l27SLeicqvePi3qXhjBY1QXRKCjP8yMYuhwU7hjDXCQrlOfYHgbzLdHYgxJWCsbugDu80aX1e+tIZtqxlUHhctTvGb38B65dClx3AMGKwcQ0bHYuW+Z0IvwUBQgfO3Gy18ru++shb7LVIgDCLq6iOCiCETxxG2ZkrMuz2vyN8ps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=nGuVf3lu; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=TtRvgtMh; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="nGuVf3lu";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="TtRvgtMh"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A34R0aK2395635;
	Mon, 3 Nov 2025 09:08:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=vXqy+/7mtKfodHwETVHKz11Fb2x1+RFXZC5mCqvbrC8=; b=
	nGuVf3luo3tzdAIkr0Nw6MdM3ZwUMU1sFZVIWO7N6w2r6AkqQnhfcIIK+V7fxwOn
	s7+K1NbWRGbQyrTUEyRZTl0tFTo2YiEPfJL9P63Re+FrbtxRbBYdl5iM/ALHqFtD
	4qHFkhqhX37E76JS553aqvhMt+2AzRqJgfbTGNrADYdDZI3fW+nz3d8yBtvuaHBV
	bruoDJ82wYjNwDqcRZuwZLQlHLAgu6nXgDEvAZ51hGbkv0ZsP+qmkjHIbjbS929H
	cOMkII/hI/Jr8ytAu5SS3xn5tXD8ItBZsjkH7mL1Zzyz7+ZM9do9rKnyji3b8zGs
	4FaAXxXzP6M5oMSZhLgDkw==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022123.outbound.protection.outlook.com [40.107.209.123])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4a5fkwt69r-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 03 Nov 2025 09:08:23 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j7e/wSS1uc4dKfYbJgCzsz1gxzY47j0T0IgpP8dNvGKPhIDf/X37byedQAxLIu8mmrD9VFGrKJ0LElUWfg1HGiEZDoBy5G3Cx2YAqA8cjRCU62OOq+9RbVMDg8+Iwa5bIjjY+qcl9NENUdnnkSfbf9izGlgQtZMHrBxLB9DpKOrUM4p0kqlKAcvsDBLpr58ld8L9W7oef+4AycZ5wTsog5zfT6kPWLgVbaHSqLF9XT7AkhNd9YfrQswlpbt0FZG6f0Wm8sr0dFsre8B1jgCmjLGLxLDYKO3ZA1CeOKKVsAY5aiwHywl9+KLipBQ+IvPXFO5jJWA0+NtVC6DtROFdfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vXqy+/7mtKfodHwETVHKz11Fb2x1+RFXZC5mCqvbrC8=;
 b=tONXpyixQRjRzbMv2dNr0hE68cMkkZHmRyF5pWz+t3wahRTwrR7WlBt/JHUkU0dax41nxwnmQptb6bCRVQ8uT0bE/V/rC6uJkYpHoB6kHzr6uoR8S9LXhWpOFq+hgs4wC++4L8pdBz/mCrDWNkMVVb8PqzQkzEkJPtoEHUKY4rov6NLFBz48uduYSXDHfmwgSZ2V06uEA7YwOFABbFljdRY0WbxdZOD1Ad0PuCE9LatZzFCyN3FU6HPkHShHnlpz3Yalzfg4Q7DC9O4UElSNMXWmt8OuqfZQjNh4Ce4vnKPId8HdKcHmvafZj3yTWBwBkdC3FxGs9rl+/3HIcHonRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vXqy+/7mtKfodHwETVHKz11Fb2x1+RFXZC5mCqvbrC8=;
 b=TtRvgtMh98M55GtNo2NFKj24sodtLattwWEGuIU2dRWezAWdVuXvNHy9VR0T5h6A9pCKt66NvJq9+/R6+wR5aSFyWQjPsX6HUdhBXYEmBl2H1AZFSFf+Hv1xSsWqxFMWGnbKccGmErVVQU2nOjTo0sduGTb5zNPV5UN1cxvNfX0=
Received: from BN9PR03CA0372.namprd03.prod.outlook.com (2603:10b6:408:f7::17)
 by IA0PPFA944E169D.namprd19.prod.outlook.com (2603:10b6:20f:fc04::cc1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 15:08:21 +0000
Received: from BN1PEPF0000468A.namprd05.prod.outlook.com
 (2603:10b6:408:f7:cafe::ec) by BN9PR03CA0372.outlook.office365.com
 (2603:10b6:408:f7::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Mon,
 3 Nov 2025 15:08:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN1PEPF0000468A.mail.protection.outlook.com (10.167.243.135) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.6
 via Frontend Transport; Mon, 3 Nov 2025 15:08:20 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 433D7406578;
	Mon,  3 Nov 2025 15:08:16 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B0AAD820258;
	Mon,  3 Nov 2025 15:08:12 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 09/13] ASoC: SDCA: Populate regmap cache for readable Controls
Date: Mon,  3 Nov 2025 15:08:04 +0000
Message-ID: <20251103150808.4015208-10-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251103150808.4015208-1-ckeepax@opensource.cirrus.com>
References: <20251103150808.4015208-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468A:EE_|IA0PPFA944E169D:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: cce8e1bc-60d4-412c-37a7-08de1aead355
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?u/3lamezvuWiEP0C3my60GfKMRUQFGWev7D+Qjy4KzJlZnqeScEUogPjQKd9?=
 =?us-ascii?Q?fVwEBNGujFGVDt7bY8peUF0Fqs7GACVRBFTOpzYRBp9dlVN7uxAZVD6vbndG?=
 =?us-ascii?Q?t3q9giYBJ3Wf1hirftxS376FJ3r9HXmoYmG264/5+X2wW7XT7Zna+RuByuid?=
 =?us-ascii?Q?z9kqmYgM3Z9+OFsqz4m/x6n8FrN/90i3AhO2QwDh+0aRgd6Ba4f6I5HNAnQo?=
 =?us-ascii?Q?/ZeadVZQ444Kel8qF+ysBqdsUA1QoiqnB9vQFbNmrdhU9L9FqhpGukSYlEDv?=
 =?us-ascii?Q?skBLlZCJ4ZNiLt2BmDZoU8PLeqL3dZTzOgrgPw89H1clCqSgWH8VjuV2LF9s?=
 =?us-ascii?Q?DwDcXkymvBiGW4BACx5OQvkYa4OTqp6OX9KLA2XUBGdlEF2F7AagOV0dEjEs?=
 =?us-ascii?Q?cu6vXeCnJH3+eyH8PmT9OUVUX59yHY9ZtTHs/zk6evZb+3WNDz1zOLzgXdiO?=
 =?us-ascii?Q?XTmgVMBpu20xZJbCWsj9DBJHN5RzgCvvKYiAdZ5zY1Bu+zMEpPOb597xrmu4?=
 =?us-ascii?Q?pd7jzd5PXtH/bOgpg+B6yGOEanLI4Hs+jfQvShhln7s8JTrraza11Tz9XGPf?=
 =?us-ascii?Q?S4l52DCO932gd9XZdnjq3e2qsiA+F10PjTXqe+8+oSMGmaMQTDzumnYtYYFC?=
 =?us-ascii?Q?2sKW5oPIdMydmmI19y3t2qKgXRwwNAdf4yfKVN7L8u7/Rbaf9+tR8eQK58ri?=
 =?us-ascii?Q?hIqkLEy+VnP0QQEYRQo5UavIgN22heg3/SbI12oS/WdyvtjLcbr8yJjyStH2?=
 =?us-ascii?Q?41ut8wBP1lWMbjKAIP62uOrQ7sosT93HIyUAZXDi+55BlJI3+RXSBPvz+vYn?=
 =?us-ascii?Q?XG3LElUz5SBvcvsccbJz8hyjuvy9nP/d1JgC3b1/etW76ZF4zF/6g9CmAjKG?=
 =?us-ascii?Q?E+drmAhVkdoZ+ty3fq71hAZr4QGaBY/NtfYpTKIvpYL46hWQOpmiWn+EeVpN?=
 =?us-ascii?Q?1BR0/6PaMaqJakrJysdVI/t+2tV/pKmA8lUGBlBtYW7u5cKB8WaQwVjESiFx?=
 =?us-ascii?Q?LX6Ey0JbK/NZNxPGOOTUkz5XHQNuuhpPWpnTMZUw8tJqcr08cW/yXL16BeAf?=
 =?us-ascii?Q?HFKwXoH63Vao/7NSUomgQY3S00Z9jK1bph8dttjPx7zTl6p0ogvtdvoNP/eY?=
 =?us-ascii?Q?kt2BwlpQ7OT+1+bTQsttJcyTrlmp+kpQ6D8ZRIQ9rllBNmS3dOy7wgWVGqqQ?=
 =?us-ascii?Q?AkLEyoDOnkhUrTtiJWv/38yAT/w5W7bnQ85nOnEbWJA3UwDbsAIapGdtRW+m?=
 =?us-ascii?Q?H3rLT6GxyCK/hoQKQ8eDM7Osq8snlwMEuXMWHu3FK3OOcyisZiJushKw+4eF?=
 =?us-ascii?Q?53CNDiSZZIRuAxVSmVIanqZnrLBhM4CGTAkMV9oA576CVuru5hZ7zNgtBeO2?=
 =?us-ascii?Q?z85FIhwBnEwUWp1PV7G1KAuAsJ2rOIC07GeTJG7CpMtu083w0BbtjuZAnFCH?=
 =?us-ascii?Q?GbmsFxwzH6Hrdy1frU4UGXTCz/VKW7HzOmW8ePjJCU7ZtnA79tbKEUdcS36B?=
 =?us-ascii?Q?NQmBVM9KDFevwhv7j/Dg8xnEk9YhJLRd+qcaXYlLjB0uEv9aFtfsrOgSi1hE?=
 =?us-ascii?Q?XqZ4OTv/VDyDW1F/RAY=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 15:08:20.1294
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cce8e1bc-60d4-412c-37a7-08de1aead355
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF0000468A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFA944E169D
X-Authority-Analysis: v=2.4 cv=donWylg4 c=1 sm=1 tr=0 ts=6908c567 cx=c_pps
 a=EEuUCq1UVZeKBjwkVe0TyA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=wK1mv6r_7XBLNqKtUq8A:9
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: buHCPSE3i5Cltu8T3hLd7EV6fxBS85Qa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDEzNyBTYWx0ZWRfX5gpmEXTOkovu
 iK5nfGxIkdPnErcA87swhFvAqf/rxTk2RDOSx4T8TLlGm7T4L7luK7BadKvr643WS0ikI7BRRwl
 4oMyCclLjv7OfPKp4h6h2dzciiO3pvJrUAFCO2hoIkPyPzFEu9Y6vwnJJq4nERJGDP7u/lDX0Qi
 0IlYx5t/lA/sr03X9oY5D/Ewj7Ybl/1GG8SSwMhVqPwMhqglVkU0RsigRrqGbJdSOdWQPDjR9Ye
 k2xUXm3zTGCm51jHvq1iz2Unp44PrYM8kwPa4tYk/kA9u4i0Z1RWF/PgOh5U4+MhFDvfXNH0L0i
 GEq1j8G+ySphjQwX0aq8Dny47OVSuWaFRVFjhiHCFnWTpMpqexLNImseoNd4kJj5oDrXLtxMpay
 w0yyq14QcxZVM6Z3MJ7qkkH7O9GQBQ==
X-Proofpoint-GUID: buHCPSE3i5Cltu8T3hLd7EV6fxBS85Qa
X-Proofpoint-Spam-Reason: safe

It is not uncommon for an SDCA Control to have no specified default
value in the DisCo. Non-volatile registers with no defaults will not be
present in the cache until they are accessed. However, if the first
operation user-space performs is a read whilst the device is runtime
suspended this read will fail.

To avoid such problems we should populate values from the hardware into
the cache for all non-volatile readable registers with no defaults.
Update the defaults handling to do this cache population since it is
iterating over the Controls and happens at a time the hardware is
always powered up.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

New since v1.

 sound/soc/sdca/sdca_regmap.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/sound/soc/sdca/sdca_regmap.c b/sound/soc/sdca/sdca_regmap.c
index 5104ae99df33a..6fbb241d9d357 100644
--- a/sound/soc/sdca/sdca_regmap.c
+++ b/sound/soc/sdca/sdca_regmap.c
@@ -286,24 +286,33 @@ static int populate_control_defaults(struct device *dev, struct regmap *regmap,
 	if (control->mode == SDCA_ACCESS_MODE_DC)
 		return 0;
 
-	if (!control->has_default && !control->has_fixed)
+	if (control->layers & SDCA_ACCESS_LAYER_DEVICE)
 		return 0;
 
 	i = 0;
 	for_each_set_bit(cn, (unsigned long *)&control->cn_list,
 			 BITS_PER_TYPE(control->cn_list)) {
-		unsigned int reg;
+		unsigned int reg, val;
 
 		reg = SDW_SDCA_CTL(function->desc->adr, entity->id, control->sel, cn);
 
-		ret = regmap_write(regmap, reg, control->values[i]);
-		if (ret) {
-			dev_err(dev, "Failed to write default %#x: %d\n",
-				reg, ret);
-			return ret;
-		}
+		if (control->has_default || control->has_fixed) {
+			ret = regmap_write(regmap, reg, control->values[i]);
+			if (ret) {
+				dev_err(dev, "Failed to write default %#x: %d\n",
+					reg, ret);
+				return ret;
+			}
 
-		i++;
+			i++;
+		} else if (!control->is_volatile) {
+			ret = regmap_read(regmap, reg, &val);
+			if (ret) {
+				dev_err(dev, "Failed to read initial %#x: %d\n",
+					reg, ret);
+				return ret;
+			}
+		}
 	}
 
 	return 0;
@@ -317,7 +326,10 @@ static int populate_control_defaults(struct device *dev, struct regmap *regmap,
  *
  * This function will write out to the hardware all the DisCo default and
  * fixed value controls. This will cause them to be populated into the cache,
- * and subsequent handling can be done through a cache sync.
+ * and subsequent handling can be done through a cache sync. It will also
+ * read any non-volatile registers that don't have defaults/fixed values to
+ * populate those into the cache, this ensures they are available for reads
+ * even when the device is runtime suspended.
  *
  * Return: Returns zero on success, and a negative error code on failure.
  */
-- 
2.47.3

