Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1409F2765EA
	for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 15:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760975753; cv=fail; b=YGxckY93vxDziVnzGgE+JGP3b+aUgBWBbntNB/U+819ZAFJP2kU2sn8hEH1NQlQH9n9UjkyPxLCYS6JGXpWGCU4P3waXqwb9JWNb0UToXgQ0yWQTgs2JQ3YSjdIeMVKGJzR5wuqgGJCRMU+dfuvBmpNRiVFNAnV5fS0y96yN1zA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760975753; c=relaxed/simple;
	bh=5jQBbz6ePoTD20MQJ7ayz7J4Ru5aXHh79AMAw2SAcHU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cSADzcfh/1qvxL7eMPHY2TG/1CJ0HiLCZZHPnUlVxoeyvDMO2U1g4IPNvLvOGC39FN4CLR7DcCWWYJB8gRGfnTZ0wzrJU5a7bAEN+Qpbiyy5wrlQs+B5NvkzOxWKSSfM/ZTcOHTHOjM58Re1K5f9e/3XTucvZOJqlLKRLxwtkT0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=XbDIs6NY; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=m8AdudfN; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="XbDIs6NY";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="m8AdudfN"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59KEAOJI941189;
	Mon, 20 Oct 2025 10:55:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=2x2fKKESDpjmA1AbOUJ0QMSC+x9deEAL9+PWOEBrnko=; b=
	XbDIs6NYWCay1NAbxOW4MFbgAUQWRzGFH/8kGV4SLPOg+ElM5aoN8e+3kdDhkZI1
	zrlR1RANc2jFyTmUwVXRkDVSKEYNufnCp8kTWh1/y6FnAE0yU9BUsMUybWVln69+
	1hj/dgsQ5ec6yyrVp0eSOhhDOLr4U9fUbn+YUvf6kh+xPPRsgYtyrSc9k983Fw7T
	PGbMseIjbPw/9aVcpEC9638vzuLkUk6vw9GrzUl+09UFZrMp9Tp0VIS4flXypPxv
	ExEB7ehVDLBKOZ+MNtBlzo9akEtlHC9psjR9lbANLJiN7aI4d9QUvzi3SESTY8j9
	DHvgbcuEfGGs9Opfw2u9kw==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022140.outbound.protection.outlook.com [52.101.48.140])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 49v7aj2aef-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 20 Oct 2025 10:55:23 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PPWbnLMHZ2P6h4ou5/3CWhNX1TkvGXJlsDS+4D0n9lhJE05rYeoA7AjmBZ6PQYxrbqcfWNIqlfeR2vTrZhH5LnZKHZNNrNBxmIWvMdbvur+3Q1f2tjgvb37tRQrtJOODrQYFjKWLvndvgYm7QlsCruw8/3fkBSbRpr0RbsAG+jAaVqBA5vT0D+oSUXk+nYJ0GAoeU0VBDMJzcCaXLCd0GGzT7qpon+bSkJiunCxQW3qTQ2oknu6149mJK1SHA3R+3KkHPI/8q2MEEzONGNY1YZJxNVqpAgUohPTNDILVJgw1UZGlUcF17xmkQuDFj2DSiomMRkh+x76O2TMIjuAFVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2x2fKKESDpjmA1AbOUJ0QMSC+x9deEAL9+PWOEBrnko=;
 b=Y0Oe4CXPg0Iqy1HjGj2PqCEPXDudgkxehT0XR24SXnaNR4mzr5XnJugirzfdoa1mqTDfNf1ZwYRo2/4aiHv7JwVM9u97596wGugr+nNheERa+8CWRQ2mf8ttK7dzNSqcf+s4GueTRqizKPA4yz+IOsvqhP2lV4Y+PAU1sPFkZUptUwyjQvC4UPWrQXN44WtvTH70HZdIqTlkXQCfTkbomcB0+xu5ETCN8yvDqXhfjOfb1vWcsfnBRoz90Zl9TNU5NyW5zu6/6QNT1YGW4ERW8v/xewQl5WxycSG2YHt5IIalI6KSczciSgqLIWv6p+nu5v3+bWW01cF2+E4bBABuvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2x2fKKESDpjmA1AbOUJ0QMSC+x9deEAL9+PWOEBrnko=;
 b=m8AdudfNENs2l14ilRjApA5x6frWWrcHa5Pz08FfMoB+6Hg1tNacwL8V4fxDdhTIsdgcBkcG0LdaRxFpT3l9O/fBVAoqCkhhy3B30cD875yoypbMyZv+WQFNZn+gWXnELFTgdhVe28XxNH/0Gvs8HyS9yXVnvPJJV96Xo6Yqt40=
Received: from SA0PR11CA0158.namprd11.prod.outlook.com (2603:10b6:806:1bb::13)
 by PH0PR19MB5597.namprd19.prod.outlook.com (2603:10b6:510:141::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 15:55:20 +0000
Received: from SN1PEPF000397B3.namprd05.prod.outlook.com
 (2603:10b6:806:1bb:cafe::1) by SA0PR11CA0158.outlook.office365.com
 (2603:10b6:806:1bb::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.16 via Frontend Transport; Mon,
 20 Oct 2025 15:55:20 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF000397B3.mail.protection.outlook.com (10.167.248.57) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7
 via Frontend Transport; Mon, 20 Oct 2025 15:55:18 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 2995340654B;
	Mon, 20 Oct 2025 15:55:17 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 171F1822540;
	Mon, 20 Oct 2025 15:55:17 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        peter.ujfalusi@linux.intel.com, shumingf@realtek.com,
        lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 RESEND 01/19] ASoC: SDCA: Rename SoundWire struct device variables
Date: Mon, 20 Oct 2025 16:54:54 +0100
Message-ID: <20251020155512.353774-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251020155512.353774-1-ckeepax@opensource.cirrus.com>
References: <20251020155512.353774-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B3:EE_|PH0PR19MB5597:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6ea9b406-837f-488c-b7d0-08de0ff1115f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|61400799027|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FptqF7UyCy1T8o2JzKEQ0Hs4hg8gpNJ04u/GHX+G6H+mRW0GgyRDTM+6BwTe?=
 =?us-ascii?Q?JlcqGXiYCxnjogf7h373s5URPyiP9LQzq8DyTVWOGWSxojs8Gbu7a1KTPJMw?=
 =?us-ascii?Q?LNHIBANP3awTukyVW/g+0iSysxc6aELkrK0sADAy9Jo6qpKdcwCfJ5pcq0tU?=
 =?us-ascii?Q?9okHAlHOnkcpQOXHYscPnxY4EUg6paur8L7Txo9t0seI7G+lAxYPhkct1c+a?=
 =?us-ascii?Q?NoaEb5FKvZeh4EKqvTt/Jf4Vkrzrl3Hajk+W0Ub4jUZ/K8rUsh0U9kG3rjnM?=
 =?us-ascii?Q?nucXtmm2Bt1aUKC6Whk/Yz9zhy52mDahKKAia9oPu677mYs1rV5KlW+BGVDs?=
 =?us-ascii?Q?rhm7P0NdLKeGKSn0gaQZqCpz+x8irf7MKezm4G3m7eKs12X43VCFTBnIMOr1?=
 =?us-ascii?Q?v8JmwoCjN38X4ZOMYhv/MgQnoXoPZCTqpMO7mDISR4rwaD70hHCqdoCHaRFW?=
 =?us-ascii?Q?iUwa2lexLprTJ3p1UECWjeiKecNJlAHm/B4K8kZnuvDQQ60VHLbjjM5Ec8SX?=
 =?us-ascii?Q?XLSqXMHgXAa8HSY+FT9ejNzItCK3DkZHXDZys/0uZwUFw2TCS7ifcCU93ZMw?=
 =?us-ascii?Q?OmxLXoZJ8OqHk6AfXUOMCSzMWW6PagEaivShJOH2m24ipbVYXvy4T7eet5Uf?=
 =?us-ascii?Q?HmL+pd7AK2ZVYFPKukeTS4uTCeptFBj+65xgzVG0iYN0tGBlQsTn1/+aU3qX?=
 =?us-ascii?Q?+fuSd+PHBt03rA1ctCP4bJb5rXb50p3ACw9M7bGhu8MW77D32bHBE9v/TjUG?=
 =?us-ascii?Q?XfwDQEcZFX/QCsauCRza5bmKenMsxchikLQkNxYHJ5BeS4+ygJHaEHNdZMT8?=
 =?us-ascii?Q?hRt8Notx2YwNuF5tA/tIxvM8WXyLaNcCPgGBVbSgT778dUCpYDTyngDImd2i?=
 =?us-ascii?Q?yA68+Ac2DSUuy8FnIxv9NpdWyy5leattunmiOKTUYkJu7vYNfaTP2dSo+806?=
 =?us-ascii?Q?32AsAkRUMBWK4sLonIbzWSpf0W7PRIZTJ+eZ+O3KNWgqY3JOxVu3oKpqy3Iy?=
 =?us-ascii?Q?gcC0C/TZifqwdSQ+GlsPzRQ0+PiSaTebCR6xmPd4e3SuS5jmPMSHfFtxhg9N?=
 =?us-ascii?Q?lMhwMi4GPaX3KTBfrZ7ZLpb3qvOMWokv9WNHr8K6IG0HpymilCyaGyROqwAA?=
 =?us-ascii?Q?vBVQwW8JzM3texu13twNeNYZlXjADuNxRtpuxVJO4l1eC/i/oAsBErkdR3jr?=
 =?us-ascii?Q?eU2gK+fXJ7zWne2AYzU1GTXlT4lJYgIr7aJuqK5s9lUx8Qxy0J8JLNZMR9cz?=
 =?us-ascii?Q?zjtyY7Wy58tTKHYvhdOMx8oaQnvTlO7mKOLsZO3WWczXj6CN5/YVEqb0dDa7?=
 =?us-ascii?Q?Xa70NPyoLgpVFuUdM9pSqMiT0sZbrSRRpuXf7lp8EY6Yt7ABEWVRbVnxIAnY?=
 =?us-ascii?Q?zEi4KWW7brFxBssd24SFmBWe9a+Ctm5S6g6tTzqZcuQU3KKtvxiVZeL/CnyW?=
 =?us-ascii?Q?AhbAJr4uuw5EDbWjVAQhJPMpkp1SaV2rV/WENgploHhHCOfzZKFashO3oAKF?=
 =?us-ascii?Q?wWvkjf8L7PuVbj9QEC9AdZfWN5K+UL8kyBTZ9Ket/SHV5/rMy4cTSarJN954?=
 =?us-ascii?Q?ftmSRgjAORuR1uOuxJI=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(61400799027)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 15:55:18.3453
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ea9b406-837f-488c-b7d0-08de0ff1115f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF000397B3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB5597
X-Proofpoint-ORIG-GUID: 3OLg-9_WgwYZMSBoFMI1FptyFn0mLe0P
X-Proofpoint-GUID: 3OLg-9_WgwYZMSBoFMI1FptyFn0mLe0P
X-Authority-Analysis: v=2.4 cv=bdNmkePB c=1 sm=1 tr=0 ts=68f65b6b cx=c_pps
 a=j1s/UBwfdopMoDbT8vzgZA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=x6icFKpwvdMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8
 a=dTxlFrGv0okYyNz-srMA:9 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDEzMSBTYWx0ZWRfXwvSr7F34LY9e
 gXixoEMZj4xf+PE/YpuZBKZeOZyir1R7ONc+cbAymxSACZbFVH8a8keulHmXHDZNlzO5j96Aw/w
 Ii04WUiHhv+7ZBFCbWFvmXBXeHMy37DQmdpzKe7q/XrK+R9eLZ5ftIg7LUYRTdoM9gAuk2upGdF
 4hL9Q4IYWRvY6cgNQ0wQ6m6GKRIWzY7cqe5gyclIBvSa48+QRACBz5bTTNbXNbXCId9bVbLko4v
 Ly8eteeWfMCipSaDatXlO3/DC6x0MZs7APUZTHanorK0X9ZmmJ2p/Q4hbbBxtHI+mw5GXCYEkyh
 h4LeVeRQYPm9exlaqoqL4zXL1xIXf6LSxBDzf/fnQTNzR0h6NmOFbgezPtqXZ/yEnPnvPKYFDnt
 IQpT7EB3DJOxC5awD14R3QmBSvXBWw==
X-Proofpoint-Spam-Reason: safe

The SDCA core processes two different struct device's at various times,
usually it is processing the struct device associated with an individual
SDCA Function driver. However, there are times that it is processing the
struct device associated with the actual SoundWire peripheral, usually
the parent of the Function device.

To ensure this distinction remains clear in the code, rename the variable
when handling the actual SoundWire device to sdev.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v2.

 sound/soc/sdca/sdca_functions.c  |  6 +++---
 sound/soc/sdca/sdca_interrupts.c | 14 +++++++-------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 13f68f7b6dd6a..5f76ff4345ff5 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -179,11 +179,11 @@ static int find_sdca_function(struct acpi_device *adev, void *data)
  */
 void sdca_lookup_functions(struct sdw_slave *slave)
 {
-	struct device *dev = &slave->dev;
-	struct acpi_device *adev = to_acpi_device_node(dev->fwnode);
+	struct device *sdev = &slave->dev;
+	struct acpi_device *adev = to_acpi_device_node(sdev->fwnode);
 
 	if (!adev) {
-		dev_info(dev, "no matching ACPI device found, ignoring peripheral\n");
+		dev_info(sdev, "no matching ACPI device found, ignoring peripheral\n");
 		return;
 	}
 
diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index 79bf3042f57d4..1926c0846846f 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -400,7 +400,7 @@ EXPORT_SYMBOL_NS_GPL(sdca_irq_populate, "SND_SOC_SDCA");
 
 /**
  * sdca_irq_allocate - allocate an SDCA interrupt structure for a device
- * @dev: Device pointer against which things should be allocated.
+ * @sdev: Device pointer against which things should be allocated.
  * @regmap: regmap to be used for accessing the SDCA IRQ registers.
  * @irq: The interrupt number.
  *
@@ -411,30 +411,30 @@ EXPORT_SYMBOL_NS_GPL(sdca_irq_populate, "SND_SOC_SDCA");
  * Return: A pointer to the allocated sdca_interrupt_info struct, or an
  * error code.
  */
-struct sdca_interrupt_info *sdca_irq_allocate(struct device *dev,
+struct sdca_interrupt_info *sdca_irq_allocate(struct device *sdev,
 					      struct regmap *regmap, int irq)
 {
 	struct sdca_interrupt_info *info;
 	int ret;
 
-	info = devm_kzalloc(dev, sizeof(*info), GFP_KERNEL);
+	info = devm_kzalloc(sdev, sizeof(*info), GFP_KERNEL);
 	if (!info)
 		return ERR_PTR(-ENOMEM);
 
 	info->irq_chip = sdca_irq_chip;
 
-	ret = devm_mutex_init(dev, &info->irq_lock);
+	ret = devm_mutex_init(sdev, &info->irq_lock);
 	if (ret)
 		return ERR_PTR(ret);
 
-	ret = devm_regmap_add_irq_chip(dev, regmap, irq, IRQF_ONESHOT, 0,
+	ret = devm_regmap_add_irq_chip(sdev, regmap, irq, IRQF_ONESHOT, 0,
 				       &info->irq_chip, &info->irq_data);
 	if (ret) {
-		dev_err(dev, "failed to register irq chip: %d\n", ret);
+		dev_err(sdev, "failed to register irq chip: %d\n", ret);
 		return ERR_PTR(ret);
 	}
 
-	dev_dbg(dev, "registered on irq %d\n", irq);
+	dev_dbg(sdev, "registered on irq %d\n", irq);
 
 	return info;
 }
-- 
2.47.3

