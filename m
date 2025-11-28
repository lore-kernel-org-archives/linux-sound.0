Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716931F9F47
	for <linux-sound@vger.kernel.org>; Fri, 28 Nov 2025 10:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764325741; cv=fail; b=eWbCD2KBiYnMmVrWNroSSS3xY6rr4TCfipmK42OLhK9nnubcMub98OZ7Gj0P18Wk5T+2RHiHbm4sTC4MtlgIFdrsGMQhf2cJMa78dLrStsVgcRvE8bwSymgrdpCEPQvPdOn2rlhMydVg812qLVwX0bKYNchdw/M1ozONO+3R3ps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764325741; c=relaxed/simple;
	bh=QPPaHC6xi6jNMSe//n41Sw+LCfFpUU1cT9GiARPGOV8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dmbULIugQ9MZlcY1XCpYcWCjN/PY6MnudL7WLhRo7JrOPKNMoyT56SvJkMQACqEI4m/GbxEQfmbDJt259h23417YeatE2a9na16Jl9rDuRgOcFbhYGpsj9XMg1NX3sxn/uTbZBcgDsIZA/cqfIFoOq1mDJCS6bwrWkjVmE4EyMs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=T3ICwf4k; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Ly+w+Rm+; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="T3ICwf4k";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Ly+w+Rm+"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS91TFV3346198;
	Fri, 28 Nov 2025 04:28:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=SBkTGcFkPGlJeIxP
	nBX1S3lEHWObzd3BjQxMJeexhCQ=; b=T3ICwf4k9vbqxsfkB610y/TVufdSl7v5
	imMZndKPJAbbvfmPt5kG2E8+YS+pZOxf6BIKdCsVddzTmVk2Uckb6QRbgMrFJBF1
	eSjfVB1B8Po2zsTPAIMZ+Se9oXxDJRUhYSUHsj+Xuk702kLStlZeBTpmhA9tOyLl
	lOIe1GqdjmtwSzry04ugYlLq/uuNJHpvm5ReVjfD8tPuiDi2S8VXw/6DnQ/aH/08
	aZtLyluo/JlKJO0Z2EnPaRHqdNqARe80aCAMB/hM2VegRObYson35d9CQoLgDjGn
	Zoe4i9N+LvEu1yFf8JC5XWHdD3/E6G9cpAHE+qyfG6tv7DQOmBkawg==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023136.outbound.protection.outlook.com [40.93.196.136])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4anjvwuecy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 28 Nov 2025 04:28:52 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wPn8e+k0sq2goNiT/0HnnWkZV1xZH6OQTtzLOt6HVNg4H3PJCT9MGyHq/6CsazuDktqQEVFFmODJmBLBR++6v/9t3iol8emLNRtKZFUkQZs51HFxKIF0WzHzqEYMOkQ4zbtc15KECd1+t46amHFN+UcSS5El1azlxLc5Q+XaTz66uetvNJ383kioUSGE7+7k+y4Sne+zDyjitHRVhYM9fbOlS+g0ifMFuK7gThvqoaiDcum1mb1iR+VUAe10B36oBb6XqCNIPhpLiRnGmDr6WleB2yVcU3Z9zNCAgeitBeXQ2bTxxccvAvX4YeDaYLQVts8ZJwj3RQ6P7PduJde8KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SBkTGcFkPGlJeIxPnBX1S3lEHWObzd3BjQxMJeexhCQ=;
 b=e4huVPcflYQHpzLwCYPwh+WTP9bdHqcVFsJO9zJcy3Sdg1IqegDzceToqL/bNFG+ARVW4kXtKCBcgJySi1yQyp41zHNt5sdr7PajnesK9F/5A6fSnArA6OwQ+fVrRqcgX3dnCkVUSN91aoavj8kMiQKB+lj56X7dxO/BF73uZw7O9PdvpcLQ3NBGuEZ9TJP17+K/5EtOnBODwmyNUY90RctBFdAp/x+BWBCQToD5912JYYEQdUTt/dBAI2+VHnnDQrjr8+FbuTgNJIZUQno2gHPJ7SvZmOdSX6gh670gcr9BnD17pQsS1L2CVOi+nJUeMxgBU5M3MfKeMk+tP7n98A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SBkTGcFkPGlJeIxPnBX1S3lEHWObzd3BjQxMJeexhCQ=;
 b=Ly+w+Rm++KHrBRNkdvtSDDYrXWscR/zikHO8QGDaD3kqVrnFrM7MWkYIgsX6jHteFfrQvBFXN+oslve2jlxwgHVBE4bXOsbUdpK8MyrZjptiTT2YJOgEsVE+q2m+hP5zPkZ8dmC2p2jMZF6Ecd8V4WrDdGQnfHN0VrpqDDaxpww=
Received: from SN7PR18CA0012.namprd18.prod.outlook.com (2603:10b6:806:f3::35)
 by DS3PR19MB9246.namprd19.prod.outlook.com (2603:10b6:8:2de::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Fri, 28 Nov
 2025 10:28:49 +0000
Received: from SA2PEPF00003AE5.namprd02.prod.outlook.com
 (2603:10b6:806:f3:cafe::14) by SN7PR18CA0012.outlook.office365.com
 (2603:10b6:806:f3::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Fri,
 28 Nov 2025 10:28:48 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF00003AE5.mail.protection.outlook.com (10.167.248.5) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.7
 via Frontend Transport; Fri, 28 Nov 2025 10:28:47 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3147A406541;
	Fri, 28 Nov 2025 10:28:46 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2575B82024D;
	Fri, 28 Nov 2025 10:28:46 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH] ASoC: SDCA: Fixup some more Kconfig issues
Date: Fri, 28 Nov 2025 10:28:41 +0000
Message-ID: <20251128102841.2930808-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE5:EE_|DS3PR19MB9246:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 25702d6e-f088-4dbd-5b95-08de2e68ea81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|61400799027|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iLPeW1nsMmMlxsBRIWPb8q6BnoPhDF1nFgSxgS0wqWvkjsPo8jNRNUrQB9OM?=
 =?us-ascii?Q?TX+xW+0dKWKmWIdVQ2FkS3wUpc0CLuOEw7KnzXVdqzBmTiFYE4hfF2Lt9r3D?=
 =?us-ascii?Q?pFX+b9rZVA4jjxXlyAN9Azq5k40JXfOAS5m7mYPdG4DewMxT+PUAo1L56X3F?=
 =?us-ascii?Q?ctCp+Wd1xnS/4VSk99Rcuhr1HY2GzJ4OpCknuWELhP82msEAy4LePIGaz/Qr?=
 =?us-ascii?Q?EklWIhIIrytxA7mKDi5W+yfCPLWUn5yQ3jRzxUwxWYmNe4qG1lVy908KDDDj?=
 =?us-ascii?Q?0atITatuv1NVlKE6hS7qMSU61kHDYSfLVrRCF0qYG4puM9I8Dj07Wp0MYmss?=
 =?us-ascii?Q?UIiTT09rEHKip6Jm3mzCH5kk3GxZnboQIhPTkv+nHRu/5OjBArtUH6I8ObRX?=
 =?us-ascii?Q?jLsPxJN3ky4OaXt5/q+b5V6IJ99tOhH37z1VQ3Xjknp3yp+i8QY7+71eeFgP?=
 =?us-ascii?Q?SkkS6Y79LqnH1850Xf9hYR0xOwdI2mHICLUdmdrB3l1qk5UsyHNBz00wGSXk?=
 =?us-ascii?Q?iTdFJ8Hn6Qi1ZwJ6qrCBHrckoxKDL8tQTyT6cI1LgEfY0OWvRCD1uKhNI+Pu?=
 =?us-ascii?Q?QqMLW3rfJnliod300aE3h3Ht5ezNk04xAllFYKFlKi1QEwtBJ/G2DRjMc455?=
 =?us-ascii?Q?xr9hblqO1+bYI6fV0ypDpMQLmO4VyjvOUqMu40uwHL1XDSofBL9FTenbtI0u?=
 =?us-ascii?Q?tvfhf+Obsj94fje23Gt07XzHYwDIydSOLjXvE1xdYszPneXwyvqMZnJ1+fA4?=
 =?us-ascii?Q?fH3GCOMfKufAPbvBOp3KYgc11jJLMzcyVkddboyBB+bXihp8Rrqui63FlzOw?=
 =?us-ascii?Q?tEmo1qNnBGG3DGyd487Lm8QU7iwoFvuXoQPt2oHuP1XR7+u/RPkHMRqwF5Ve?=
 =?us-ascii?Q?NBqpUudAMez+hMmq2BsRHd28JfMYVDFLyyE8vZ3ApwfoGtYJEtthi1NdcYV4?=
 =?us-ascii?Q?YOOhZ2KiDrgULYYrdbF6OQYLdpffPgmhnU9zoplgcx5lFM4GNXO4bulwFGA5?=
 =?us-ascii?Q?HcDYTssb7BbRwHokkvnSN6UG/LP1GtZ9J6CHIROQ1MFhnHEweYl2vkFhvQGG?=
 =?us-ascii?Q?xpgkMWcyYkIL7Aq6ddJZADmWt8SvsLfXS4faSij2r+VvXQkg8VuCJgaXdWQm?=
 =?us-ascii?Q?tEmqYHN6gobPEkxzyDPI3WMRoRjnyF3ClmuHgINhG0L2oKDOwbyD0o+LXhM2?=
 =?us-ascii?Q?qQzUcGI6CpKLeH/kTH2wsf1OrJAjfi2GR9kjAQ5oBPTQNZUSJ15dYPwitc84?=
 =?us-ascii?Q?bpwaIN08HGVUtuUsCqMz0vxKASr6sM+O3uoTUKs3e208w0m9M3GLWmqBvj5g?=
 =?us-ascii?Q?HxToKT3WO09PnIRFo7QluXe1/oAHse80rHME+sBzmiV6bEqqJE4HIJDLO09C?=
 =?us-ascii?Q?PICk1IH1zDd2XRvamgS6f33r/SCsH/MV4Vv5Pi1AbSs3003alscgSYOwM3dd?=
 =?us-ascii?Q?IqYiPaWYbD71l2O89LUxzJlJtFYhCZ7DB+5EjKHSGr01tdXyL9JW2YDG6JSs?=
 =?us-ascii?Q?7lwdX6Eo+wlLOkzNiSmSMzOIOrfxcvVbwZRPY61INI51OBvH+ICRyISL+07l?=
 =?us-ascii?Q?5Qt5TlXLu6V+hclwaC4=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(61400799027)(36860700013)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 10:28:47.6205
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25702d6e-f088-4dbd-5b95-08de2e68ea81
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00003AE5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR19MB9246
X-Proofpoint-ORIG-GUID: 4wvpGhq5drj3L82JLgRlaMOUOEZfTwcM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA3NiBTYWx0ZWRfX8cIc+0Z/8k84
 dK2z8FoGQTlGucCjB9XrreLSNZ8JGPsPtZsoY09GgAZo1MF1xAzkAOvizFHm0XsHBInp9dh3llC
 eQeWS9YZ6pMoIPSwPpAkTY0Nc85rFl5A0bBcTihVp4qoUIUkHPBTpHLAIkpjmanz7An/uiFzq1K
 EuSJUWkpxdydQq9T+yYNo90L/3Y3Mjnmm1iLsfTYzp9q0MkI7vuIlC1RA9OilNODd1TaYVrTdJk
 UdZSU5aNyeiEhHWiQbKm7PO3/xKoDbwK3TdHyDtbQHlgPeEsOyBq2MlpNGAOiRNfGhXDd15lWtF
 VKIYydWNHbu2hEfEIc8pYz0e7Yc5HEQEu7pBPWRfhWsuKtJ+SJQ0i70pjKKIEC1EeG/QlLCaW4F
 xsoDh6qh17J5P7gXl+dxe8nNFK23iA==
X-Authority-Analysis: v=2.4 cv=Vvouwu2n c=1 sm=1 tr=0 ts=69297964 cx=c_pps
 a=MadOk45lBhyGsbwhHlC0NA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=RWc_ulEos4gA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8 a=QVjOOgo7zhWGKpXJRT0A:9
X-Proofpoint-GUID: 4wvpGhq5drj3L82JLgRlaMOUOEZfTwcM
X-Proofpoint-Spam-Reason: safe

As the class driver is manually selectable, it needs to depend on
SOUNDWIRE, which is obviously necessary. Also the depends on in
SND_SOC_SDCA_HID needs to be pulled into SND_SOC_SDCA_CLASS as well,
since HID is selected by the class driver.

Fixes: 2d877d0659cb ("ASoC: SDCA: Add basic SDCA class driver")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202511281223.DDs12LiC-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202511280822.i2fveMpR-lkp@intel.com/
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdca/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/sdca/Kconfig b/sound/soc/sdca/Kconfig
index 3c6bf0e2c2f01..fabb69a3450d3 100644
--- a/sound/soc/sdca/Kconfig
+++ b/sound/soc/sdca/Kconfig
@@ -39,6 +39,8 @@ config SND_SOC_SDCA_OPTIONAL
 
 config SND_SOC_SDCA_CLASS
 	tristate "SDCA Class Driver"
+	depends on SOUNDWIRE
+	depends on HID=y || HID=SND_SOC_SDCA
 	depends on SND_SOC_SDCA
 	select SND_SOC_SDCA_CLASS_FUNCTION
 	select SND_SOC_SDCA_FDL
-- 
2.47.3

