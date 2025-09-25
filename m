Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8892F3C11
	for <linux-sound@vger.kernel.org>; Thu, 25 Sep 2025 10:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758797659; cv=fail; b=AGm0OK68wlW5ooqcIRVmO7T0ZDP0SUce63WZdQVtM3fuDjrv7RVx4GadcOWQizDNbuORxr1WxqIgTeobaVUt8ynbUdcQR9CdllkiRq6DG43jov07q+QcMo6m/ncE+ga5Ca0rivDOlYm7NlOlPo2DucYYZ+F83E12/5GieAgyU68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758797659; c=relaxed/simple;
	bh=5jQBbz6ePoTD20MQJ7ayz7J4Ru5aXHh79AMAw2SAcHU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VLBpxj4X2roF1f8S+xNZKYuxlz/9trCJwF6Hmd33YckSP6rXRCKV3Wg0FRLOfGJBW1WUgtMOxNA7HdAuYSvuuYzc8ZOhUz7OnyvAySooGGHRjgFMaiZtrU2QZI8uOrBZKLQ3NDSHalxRnZ746dwgdXKg0lusp4tfZULs1xPvVlI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=XDFuxb6w; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=h89DMjb1; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="XDFuxb6w";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="h89DMjb1"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58PAUKKe1392027;
	Thu, 25 Sep 2025 05:53:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=2x2fKKESDpjmA1AbOUJ0QMSC+x9deEAL9+PWOEBrnko=; b=
	XDFuxb6wPnN8kXxEpsJpZ7CcGb0XMyLkA0vtyzJQVfThwjjQldlepI2939kLra0J
	My43qVIGsqlTFw9idfFNsfm5Tn0OJHL0vLXxhRi2DhSCOICHvL/XMFF2SfHG6pU+
	SfAt1YXVBKFnyMlmukBwy4PYW2ftWD2SIDpXSzpOKnrzSK5628xH/hzYPl3i268g
	trvpjqIfgEbDQStBqLk8i5Tgb7RX881vWkHqAv4jMD/RXl/Eu8J5pcLA3uLMwCoz
	/0Q6X6NIMTEdYEVR52z/PKhgUqmHCLB2nBTtXm6IyfgeDNJtqgSXtaVtlcieCx96
	zBsHuZlsSPcc4c8cbmc+0Q==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023084.outbound.protection.outlook.com [40.107.201.84])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 49cjmds8ws-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 25 Sep 2025 05:53:52 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GSkfQC9DjEgJBcg/vZeE4WzrhE54cWG6blpRQojmUqaqGY9Wyryfi+ylm6RFI1TVnENcNeNyoRuYckZviLM2DY6RNP/YGoch5wV71Dz0GCURQ9VYJdkVfGkd1Ln3s6R2+Y/UuTxgFGrMS2JselIElutkhVLKL8AfLa+9bO884+goFCWUeDZYxVQZjCootzFAAN2CWpECD8kA6z3FpJUmKg0/8wkIUA449Me4L02tnfSJHE1d86ch1yHs6EW4qCi2Y/TUeX7u/rA3qoGPCZ9BwKbXt6jS1PHgSuHThQr55jxk/DNaiF9K5/0muy7ESGOPpSWmChRvHKbh0NQgS0uSqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2x2fKKESDpjmA1AbOUJ0QMSC+x9deEAL9+PWOEBrnko=;
 b=vs5LyATbtvZZjBPmZR1mHAVEYr3kTHiY73C0WdJaXJSRzlDwGwHCCXk/prqALn9Dxng2kXEic/E1j+Rxp9ggwWJzfe8rPQwBgZwcbvl+27EcqjOXVaB7f8uAJmNzWCl+rbVRbBCV2STNOSLd7tCHkf88CZji+lHfljj4CoAHz40TLNZzYMoi34RN0iMb4kqv5UIT6jyMTAd+uG6PpIWJUrZFNTlUy+DC0MfPi3Xv7N6DhGQ+6lMLAhdze1PflrQs7SyInS2f7Wx1SRjrBJvaTmClYJWw1PjVWhdSTs2CmvphuHOMY5CxycYfdISvfeFIEyR28G2w7/YHPwVZFmHiDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2x2fKKESDpjmA1AbOUJ0QMSC+x9deEAL9+PWOEBrnko=;
 b=h89DMjb1N4yYB8y9k3QMvN/7Vwz9sPkdf7YPeAsqTYeoriyRw3ucVf10Oq0uCbVrd1kmLMxdcg8OmOGK0qnb6t2UbsRjQ8brGEzwhwsb6KVfhaPMzgd1ESYEkB2iGcuSjFgbSdfW5mmUDMCHJH10b+IRH3701jurnNBYti+DCTI=
Received: from SN6PR04CA0077.namprd04.prod.outlook.com (2603:10b6:805:f2::18)
 by DS2PR19MB9244.namprd19.prod.outlook.com (2603:10b6:8:2d1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Thu, 25 Sep
 2025 10:53:48 +0000
Received: from SN1PEPF0002BA51.namprd03.prod.outlook.com
 (2603:10b6:805:f2:cafe::7c) by SN6PR04CA0077.outlook.office365.com
 (2603:10b6:805:f2::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.10 via Frontend Transport; Thu,
 25 Sep 2025 10:53:49 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF0002BA51.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.9
 via Frontend Transport; Thu, 25 Sep 2025 10:53:47 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 0B297406552;
	Thu, 25 Sep 2025 10:53:46 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id E30DF82024B;
	Thu, 25 Sep 2025 10:53:45 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 01/19] ASoC: SDCA: Rename SoundWire struct device variables
Date: Thu, 25 Sep 2025 11:53:23 +0100
Message-ID: <20250925105341.194178-2-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA51:EE_|DS2PR19MB9244:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: bf612cbf-1ca2-4152-55fb-08ddfc21cdea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+A/9KsgQ0jFbVEVYtH7X2AB7v4N5NTPE5rk/iLNn9bPrDEHviS4MQMC9gpAY?=
 =?us-ascii?Q?0VR+tUx4jJPGfNgImOgsQho7KoaLdeTzpr3C6Oka9Z67fieJtkg9ax56zHto?=
 =?us-ascii?Q?ejda3t3NWo/lcC5xon9sCMwCq3EoyYt9QPn3dSAqhh5q8HlxgbeqWsBhMVlo?=
 =?us-ascii?Q?fXD4BlfO9nYJ/8hdT+o2xURRrkAbclioohF0OwwKBn4h2ViZ0WdOsk7rQj7q?=
 =?us-ascii?Q?endfy1wh2VlGlqayb3lYLKsLL35exs77IHicEBQqc0n51a7q1BVVrnkLWmua?=
 =?us-ascii?Q?FNvxDJlG3zeBPdTSEjZUZ136TEdCUS8PjV5YS0suNLE+UExdT9Yj2CBKBDyw?=
 =?us-ascii?Q?LZRd4/mAsAijiDx7Gev2liXFyNi1GbUS/ze/TiLanvmm+oxtt+DitD+dQTWI?=
 =?us-ascii?Q?v70/8cJI9c0EdbE4fhXsazPBjTvY4ey6CG1PLHZ94BvbL3ZK3h8hfR/eRdp1?=
 =?us-ascii?Q?uatu4e/7HtOk3Sou8J8cWtVuldJK5JhG6qgjVG/GtLhk4HjCyMMWt3wcPPVH?=
 =?us-ascii?Q?fAvRL0XjIH8Lahm9mI62o7FrWcOk5j2fmuOw1B1YVHrV0mt8ugS9RTj6nEes?=
 =?us-ascii?Q?3h6KAAWDqdPeSDHI/YWT+9TUnAjywbS3fE+JrZClfYwtLckAgUu1Bhhvi9Gx?=
 =?us-ascii?Q?qtU23QTzyZPFTGVnPuGNv4yZAl4gh6pm9OG2eLsa26vPOrxF0lD+4Uo4k8Cx?=
 =?us-ascii?Q?xcKGbzCwxtl6zvT9OofSXj9xiLvaknNrmx1JDOiTvYUrmWElrcq4dJXizc8s?=
 =?us-ascii?Q?hz8j3Mm5diM/JaZW2pnrx+Kw8AJSOpTJ6cC0CoummTuHtaOb1ICkOw9iWNKh?=
 =?us-ascii?Q?u1Aq2HCbURmdN7ugtCSfOWlqKrJOoE9+kv7h2YBQUEuOxMlonkV17Wp2oRbm?=
 =?us-ascii?Q?XW14HjtoXoIgG8VWh0nuA792TksWuCQqhxcYPkXuxb62l7MFslkTCGviv35w?=
 =?us-ascii?Q?PrbRfkaJ70i2pouK7yi10s6OYT/tXVV5vEVy/OzL1BNL+nQ/FDnMCJztvtSt?=
 =?us-ascii?Q?fu18+x9qoc86Y7P2QrJp27N0kmxvAmSCUDzjDPIlikUg0FDSL9mp+wC+iqKq?=
 =?us-ascii?Q?pmBRVlFeKps6e3JFH6x08iPEI7dCTNzPZJqyu72CPU71cfK42u5O3NfVXA4U?=
 =?us-ascii?Q?V/ho+GXCCoky1cJqUmE7MF9mUVlbQcEYk9/ZGrWyhon5rzwAYarM+1cTX/eS?=
 =?us-ascii?Q?TfFhRkbXp+D+EdlxYuKK4pVXTveq3bCdTxlonSGp8XwB7kI6Ogs++VBLMWvu?=
 =?us-ascii?Q?ODPKAu+dcpwDTXwyU+KujpxojQafLnhPRzXPzNPOJhTTuSoeIXdjnfjFAoRm?=
 =?us-ascii?Q?33mNtvRpg654ZZoRi9rYQwt6TzWl2gvx1SmB4F2OebQk6JVW0E7K5z1OHN8c?=
 =?us-ascii?Q?UuKs2KcbUlteFSP6Xj8j/T2LSNOYmElAg+VRc5lW7vTCgHnzPHq9QMDVhda5?=
 =?us-ascii?Q?ou+lhHgXe+H72UT0jbFJ4MWX/4ipY2smh/u3e7w8hylXHDCjD4IkfZpf2Kxo?=
 =?us-ascii?Q?gj9is+c1rcIGNLv5kDY5doaEg3Zdv8Vpyra0?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(61400799027)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 10:53:47.2449
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf612cbf-1ca2-4152-55fb-08ddfc21cdea
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF0002BA51.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR19MB9244
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDEwMiBTYWx0ZWRfX+1y3dizrybHs
 RGcMyOch5haY0advThnRI8/ZmgYUyXiWHL6fsTBWSsSZKjw9rkUObrbvnnhcRZrFdfBsnYX4Gxm
 fISXS2J7QUMl5uUcKKu54XGbvinDS8P1Ah5UpvFBpTkq3VEP/FzO7TZHD22Mw3qG3Nnkjjyvss4
 BcmcO0u2dqfvXOqkIU7Dc4dXavrF5JYX7288ebUC+ETSNFkJc9KqNtbmVqWWvLIy6izbabsywHU
 Bv8wuEeQgc9vufmXvLromt/Tf8DXudT5EK7DJ3Jbui3sX4CqNFWd5hMVtpr+MyPnmUUNiw4Cv+F
 UmYRloX6fEZk7DjQ+oTvwbsl16qjsuXKUVYIUlZAcOHsSBvLmIUSE0NAyfdl6k=
X-Proofpoint-GUID: LpqmyQYYXsG_zWIah6R2-mp3tP7LRUiJ
X-Proofpoint-ORIG-GUID: LpqmyQYYXsG_zWIah6R2-mp3tP7LRUiJ
X-Authority-Analysis: v=2.4 cv=ap6yCTZV c=1 sm=1 tr=0 ts=68d51f40 cx=c_pps
 a=1VlWSMzKqEv4z/WE8IH0Jg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=yJojWOMRYYMA:10 a=RWc_ulEos4gA:10 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8
 a=dTxlFrGv0okYyNz-srMA:9
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

