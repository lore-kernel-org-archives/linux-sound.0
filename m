Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CEB3168F8
	for <linux-sound@vger.kernel.org>; Mon,  3 Nov 2025 15:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762182552; cv=fail; b=sUSp0tQKIRLTw0kPz25TuHtUSmf7A70VQWLWC/uhf+G2owlZeq+fu/pjCZO3sQYrGJ1W+G+/ABayBwJbz9GgLfuxEZUkbE686dDwZ8y1yvQFxx9W015xe+DEjJ92rqhrGlEduuZYYglJyopk49r7NOtw9841dNjWI68rSCf1b8w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762182552; c=relaxed/simple;
	bh=FbDs3iC7VQLh2oCAhzYztpaY/yZDALJYfKmPgNAECJA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KlHPILH8K3afGm8WWNUsAhRlcnctbKjONUAhatAJ0Eyx6lrJtYlcmSlIGdsygoUlTJMks60D1d9Y7NUUG5z4NsZzq3K5f2YgafA/DpArJfMch5RycHSq2SNk0CdxvFh8NUunUrznna0FDhAlFvdgED9884cjBVW9e+PUXdZf7EU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=WGkyIcpB; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ygB+qshS; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="WGkyIcpB";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ygB+qshS"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A34tUYl835950;
	Mon, 3 Nov 2025 09:08:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=ibbqSOfo4c8S6DH9j4m/zhCLxhdVPCgXpvhVvdRv5jc=; b=
	WGkyIcpBfYvh2NCFvBh+sptXJPSVR0dOqhjSWxCkru75av6j6YgssNY0zy/H0IeZ
	YxPnz8O6sFJUpXdznuV7Q8viIk7sMFqJIjJB7UBaM5T8dT/zX4Ys2pQJcht5uFXv
	3I4eamiVYLZ64bDAAcFCw8UDb5sqvFqJSw4xNES5y7dWKxt/MoEjCr656/v2EEML
	VEAlRA5MKvOqFtqFVsrPcgyLIbEyzYA60PfO+j1zVP4EKxWWU6bwP0qRE5obyACc
	LYMDDyHQPgG2q1CZi8nxn18uAcAipYbHcwRRPDY6fYQZzPe2u+OZAWsL0k5MYUXv
	xe60Rf7EcU5OqHmMLOj53Q==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023082.outbound.protection.outlook.com [40.107.201.82])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4a5emg26qq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 03 Nov 2025 09:08:24 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FST1c5839gpQQbOA9kq4A31bkMBDJEtONo6tpEiBImx4r7u1iDrsjnKxyXOzTFd0QiBFy+DHGFYmt7pnpJDVKs272j/tfQA8NsF4+3TnNOHRhkJr8FtPtLjaShWgfHuHMBXz/8GhsAgog+VvNoITllfAittEDlLnsfXc8X5vN0Q9So8aAopXpvZWMFjYYedodvb7VipwxCz6j1u54Ex6ELHV2XHokbRovHA9Fci3hAMMgjdheBHRJcevLrKqykmc5VtLDGXIk4lY+k3/KBpeZjVS9uz00yOZP2qNTV5DwP+nZMszIaZ0aRLrzyfAfSs1Q4p7FEOQon2ERFAYb0L4ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ibbqSOfo4c8S6DH9j4m/zhCLxhdVPCgXpvhVvdRv5jc=;
 b=kHNbfGW0ry3+HdsqUrkYA1CX0niGzG5EudBw61yyU8Rv4hFFufHV++UklV8/Uy8yGzIR06MsSEyBJPCVulIl+W3R6M0TCWmBoInYmeWUu9sE7V+jmlO5M2Lbs7PU7xfzYrHs68O//P21yDOUFfJp9eIw864SVYeRdvb7kmvOzpIkj2hnYFSyuLDeGJQzkwjO4vnhtCb+EBXJkwNShp/H6ROsYlVn9U+SjTNPccOu26Jf0rVuiAuLwUF8twt72jZUwgluzENaDT1ZVjaD7gTG+TrIWzbUOSWnQKLqdYGfXKoDMzGSacsiY4XeyfZXB614+VizYsb65DIUsIyRNbMOmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ibbqSOfo4c8S6DH9j4m/zhCLxhdVPCgXpvhVvdRv5jc=;
 b=ygB+qshSw5xgi+gB+PVuMItWFM2QBBKRuU/avRZHh/B7a5qlYsG1GHrR47Li1vxfrE93BcdQWIrbayGL7WiPYwguYNOgU23qt1JjoEfywy6RZAkrbVOaFp44eO5Hnw/AitdaAurzvki/n2DTvqlPcx4lmfjOnXUP7W3AZ/wElp0=
Received: from BY5PR04CA0006.namprd04.prod.outlook.com (2603:10b6:a03:1d0::16)
 by BLAPR19MB4562.namprd19.prod.outlook.com (2603:10b6:208:292::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 15:08:21 +0000
Received: from SJ1PEPF00001CE3.namprd05.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::91) by BY5PR04CA0006.outlook.office365.com
 (2603:10b6:a03:1d0::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Mon,
 3 Nov 2025 15:08:20 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00001CE3.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.6
 via Frontend Transport; Mon, 3 Nov 2025 15:08:20 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 52CE7406579;
	Mon,  3 Nov 2025 15:08:16 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B6D87820257;
	Mon,  3 Nov 2025 15:08:12 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 10/13] ASoC: SDCA: Add helper to write initialization writes
Date: Mon,  3 Nov 2025 15:08:05 +0000
Message-ID: <20251103150808.4015208-11-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE3:EE_|BLAPR19MB4562:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6d378715-d58b-459c-e204-08de1aead3cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?i4yeZZ64zcUPbLWG5GaObOZ2OqSwMwIiJ1N1tUjDJNYWrxglxzmNgix4dbR2?=
 =?us-ascii?Q?+TpMPcC/owWewFpg/4AeZM8eYOLjUSbmZsb822Fl2cFm0GlcV4HOO73lFEWQ?=
 =?us-ascii?Q?RTjmMaqTtYm0xzyztW841TOwFTx+kuOrdI11xC2+U/y2UL5pxyVvlTVZ5AJX?=
 =?us-ascii?Q?F45r1RGu5U3MAxLAW44aZCiUtptFsYZhdmIH59T3sPYJ685p2pd/8HUInES2?=
 =?us-ascii?Q?8muPlxS4Almi1u2VVVnOd6KeDObkqtT1Qyj8kq1hChjY7CoOcIXW/CBJoHGL?=
 =?us-ascii?Q?OLxdKU5LcM0wfqsg5jjE14QnljGVR6fS5NGufB6Bjf1DS9j1uu+PRWo5Axig?=
 =?us-ascii?Q?MEDVO4tf+y2Jdl+o9xbNWmE9lirGKIID4bbDJ97Rzvz7JbCV/Dghg1Tvwo1x?=
 =?us-ascii?Q?Gn04wbd4l+4BggYOvlQ33fOkk0pYDsW05fxI/LiesPYm7B3ZK3yWzDegFjc5?=
 =?us-ascii?Q?4aQNIVoEp4XFY0Gqb1geQD7qvvKNrb4gZh65nBpJpnxXe6ymTpHeCRj+pcfX?=
 =?us-ascii?Q?VczMwhMbw+fuWtmK6KZLq7LPyyz2SYR1or7WEhWTAbpAFMco/mkTbU4uACDq?=
 =?us-ascii?Q?UTn4kqZUqxFfCZMtCotA5HJXYYY9BQf68yM1kCgxfqNlIgoZzMsQjl1GCxbw?=
 =?us-ascii?Q?ZTAw5icf5NSfAP1Ro8ywy+1R8YaZq/LT83xAZNCN/l/2lGrKUGXb8bXddGhR?=
 =?us-ascii?Q?ZoU3J6VtH4rRiNeCzaV69NHf+8EQBV2qOk7Y951iF2MuSY4r7u96a+w9o4+p?=
 =?us-ascii?Q?WxF32XUcpRTRIR7Kd3Tt4rTBZGdYEhQW7n5RH7/JyHED/MdKGrkZshdMC6UX?=
 =?us-ascii?Q?56e2ZbzsxS7TD4VTEQwWSEQP71qckYiunBCR5XxUlSk2ZiAouYTK0Y72kyV2?=
 =?us-ascii?Q?8TlF5QWGDm0GOD0UlzT93NVIDT4AQg/eXH1ZwQ2ljZq5RGosWAzEqi+TZzhZ?=
 =?us-ascii?Q?9+At3R5jPnYlFT2EjSRMBaFZLPfNzbR+h+RfpKwPXccAn0FqOUFUQe1bIY/D?=
 =?us-ascii?Q?6XdlsrbCHAMe+Acudb57jHd9ScgSv2bmuYKGXChhfy32/h1AAqvqDNOrXLEW?=
 =?us-ascii?Q?CL19moJKw8f5R+KYK8bPSAdQooXwrN1Yp/PD2MS5MosRFlL5jx/l/wOxFdlI?=
 =?us-ascii?Q?+UaTEQZDLj4m/ZTJIBxQbm8D/CYjARHgIqMHkaLg3+M4FX4p0Cw59m+Obakx?=
 =?us-ascii?Q?xBM7tkpGt5javMLJ7aTP94gH03s7njhxwasn0taFxdR+ICdv6JMLR+74LdeF?=
 =?us-ascii?Q?k+I23A1tYO9EPC/EB3EzAMscu67S9KKL0OCvVCXBcncZRisALcQT9jIXjx2R?=
 =?us-ascii?Q?DV+DZ9cCeXilfeEaUsl0upUbapVoAdwS+xUIVyzMevBezpEuZYtfuaWrKZDp?=
 =?us-ascii?Q?z9o9yL9mSgfLQn8zEEWWYw1ntDO3juiDALGvAVFygAHvD+4SsyNcbWyOSh4u?=
 =?us-ascii?Q?MZvzPqZ8Sz3PHKc5qczmCaf0E63iccRk1sOXFG+8s2huLwniimEV3xEYFdtG?=
 =?us-ascii?Q?4htyRwPnnP8GbwTFjnzORI0eea/dic3vkY6j6DI1s60/9PBGp8Pt3kpOk3dB?=
 =?us-ascii?Q?ppU38deeM5gLkQXrqyg=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 15:08:20.7956
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d378715-d58b-459c-e204-08de1aead3cb
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00001CE3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR19MB4562
X-Proofpoint-GUID: cYtKeWH8qq32SzS86XmS9-3OHPa9pVLB
X-Authority-Analysis: v=2.4 cv=Mu5fKmae c=1 sm=1 tr=0 ts=6908c568 cx=c_pps
 a=YDC/Wd3livOBbj6CAX0Hng==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=w1d2syhTAAAA:8
 a=v3rgw8DwH17jaVfoKnAA:9 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: cYtKeWH8qq32SzS86XmS9-3OHPa9pVLB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDEzNyBTYWx0ZWRfX6PbmSpiqxbB2
 KoBQ15jsa15w9PJ5v50Va92X8UiJ8+JYahzdHNfcJRGQ0TrqzkX5kh6uvHuHAnaOm5YEL7TN298
 7AyKNEhAugHDwLLtWQZtuoJSTWzWNji6MFuwyqL9ZKcFSrBTLeP62F5MUi2mAv6XbKXZkvPAkHZ
 IMbDpRgW1fTBfRrnQFZ0PCpOqUO29mo9exGqq1xRsik3DxtN7byj3Apd8tMUwJxgmE27v0feMur
 R8ZdN0crsc1KkTTr/B9gvu1vRddfR8jfQu+tcr70qI6oiGL/UqnaQpWwVdgcrjdiRuqP+/bEnuN
 Nce7yvgJSEiM7pkDoB4GzKxXAYKH/yRuwovEiyxlV3ovGI0ASGA/D5mxePHkpbLml/nFVLoQf+M
 e/d6b1N/PjvzfvkNA0+Qo1cHYSd7Kg==
X-Proofpoint-Spam-Reason: safe

Add a helper function to write out the SDCA blind initialization writes.

Acked-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v1.

 include/sound/sdca_regmap.h  |  2 ++
 sound/soc/sdca/sdca_regmap.c | 16 ++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/include/sound/sdca_regmap.h b/include/sound/sdca_regmap.h
index b2e3c2ad2bb88..792540a530fc4 100644
--- a/include/sound/sdca_regmap.h
+++ b/include/sound/sdca_regmap.h
@@ -27,5 +27,7 @@ int sdca_regmap_populate_constants(struct device *dev, struct sdca_function_data
 
 int sdca_regmap_write_defaults(struct device *dev, struct regmap *regmap,
 			       struct sdca_function_data *function);
+int sdca_regmap_write_init(struct device *dev, struct regmap *regmap,
+			   struct sdca_function_data *function);
 
 #endif // __SDCA_REGMAP_H__
diff --git a/sound/soc/sdca/sdca_regmap.c b/sound/soc/sdca/sdca_regmap.c
index 6fbb241d9d357..2cca9a9c71ea9 100644
--- a/sound/soc/sdca/sdca_regmap.c
+++ b/sound/soc/sdca/sdca_regmap.c
@@ -355,3 +355,19 @@ int sdca_regmap_write_defaults(struct device *dev, struct regmap *regmap,
 	return 0;
 }
 EXPORT_SYMBOL_NS(sdca_regmap_write_defaults, "SND_SOC_SDCA");
+
+int sdca_regmap_write_init(struct device *dev, struct regmap *regmap,
+			   struct sdca_function_data *function)
+{
+	struct sdca_init_write *init = function->init_table;
+	int ret, i;
+
+	for (i = 0; i < function->num_init_table; i++) {
+		ret = regmap_write(regmap, init[i].addr, init[i].val);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(sdca_regmap_write_init, "SND_SOC_SDCA");
-- 
2.47.3

