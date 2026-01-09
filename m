Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D091D2264C7
	for <linux-sound@vger.kernel.org>; Fri,  9 Jan 2026 14:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767970366; cv=fail; b=duUr3d4YvToMC94ZdsuQEchq3qXDILiezEnLK923kWPMDJeuGG/LmmjS4oEoDtqudizk/urb3L13jkwLtRb+TdNTgs6k5BPyxB4opKlfiBKNJxPTwoxBB07E3TqS0OPD41RnABjxMUrDggojeWDXUJmpvgXId4udieyabbd7pp0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767970366; c=relaxed/simple;
	bh=nZ87HH+mi25p6k+w5MI1vLw3P3b7MTAMx3h9vyVE1RE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YhlDhbZ1OfT5rZ37jUSRcl9/vX4qLugMvi53qIyaz83toIEZnImNKEYPehuWc2M0OWwumn0wEl+c4l0iRJ2DLIgB10X3ipaseZWQ4I/2ezRwBen35NPRWBAbWLWWIrw6WJfxmt1rCvGhzTKnz2589G8DJzHgepi+SN1VwhPN0IY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=TZh0ivw4; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=f6HPGjlZ; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="TZh0ivw4";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="f6HPGjlZ"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6095edJS3814932;
	Fri, 9 Jan 2026 08:52:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=CqG6f8nN0EirXJ7quhywYagsBiMP3IOdmam7Q90eUcw=; b=
	TZh0ivw4wwJ1E8p8KRjVtiAyRAjyNeuWuTjESzYxVReO9FF7lYQfTJBkKK524vG+
	fcB4w1XU7cInsmBU15zcBGqWBfaww5INuti+Tu8G8dIO3rih5w1H0Ft9xUw9aWAs
	FpaNEAX0O7dCNiGDhkqLcBKJae+OU500JQk7/5sXB8fDEkEXyoogvoelwLNlWak0
	6cl2WEgMMlZ4r50lb+V6JFlcC8BnI5uGzdBsEXDaPmdjpMLATJoL6mo+iw5iZhCa
	qwDgdviJk326VDH6Utb3nmFRzPb/GG0jnOT+k+qagzwYgS/AMRF/73RQ8oe2LArM
	ZkEB+E0dtyRAmxlMLNIkrg==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023099.outbound.protection.outlook.com [40.93.196.99])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4bf1d36ve2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 09 Jan 2026 08:52:16 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yArSgssFP1yvt0sSU9q6JmxQBqbcbM/L9RMLVNK7Nb0iv3SBebDgzjD3LsU/pBCs6Gbfv8hTYiY/QxXQe3obuyCNC8/mdlbZvgx0/AtZTTAW/LbnxxHm1U7JYbxJ34WxaEwPwHtV0K/TCGTZ4S28SKXv8j+dktQH0yxQbVBuxqQ/PpPmxogV5ME13P5Iy0WuciLrM31U0azLeGcLrhqOiFjulWnQSx18jtWqm749g3SuNjD7qVdXRg8Cz/OnzNEFs+NAobufydxI4jOasw2ezcD3eNI83IZlPgSVfzjnnao1P3caNIUsLvVMBxL5EIPX01cs5idCQOI7+OMYKfp+og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CqG6f8nN0EirXJ7quhywYagsBiMP3IOdmam7Q90eUcw=;
 b=Y6HGmKo/SlbZeEM7ddsQH2pQweIpxWJd95lVnpZCExu94v9LGTGcutyouZD3K79ltZ3ghckBekWIAdiZm3WaNFpls1wF8Pf6bVyAUCup+5xY6G/j6EF/1JBovY/Qz8blQ3nqLjbnc6P1Wcr9dOUx8q6d9aVkXy7oz4M2uw32GiVCgNdv6ViscEB5E7M6Ja4SqcsKnEJ9y7LF1KQIq0nV3/1biXGou1oYIeDUv+kg0mlcd9NShxZxZc8UBKaaVbyMksun7T9+E5ZuMsfzDhVR28fqdokAdQldLPLyKrKMthElEHbBfK9a18FpuS0x4mz5wmX56T/dxEBZdYXs/KTAUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CqG6f8nN0EirXJ7quhywYagsBiMP3IOdmam7Q90eUcw=;
 b=f6HPGjlZwCGLjvXFTlS4rtaZq3Z+n3z9ZGJPPBtNIeSE7w9YoxRP17KUmF1+/Px3PrmV6wR+W8nYqo9IAtuBG8g8EnNJN0wZY1YT2lo9NFfMCZJGASY02pmzThELSKn+zmSg69W1jwpeXIV5XrynAgvXeRoC4OjFFLQRylJvpzM=
Received: from CH2PR19CA0008.namprd19.prod.outlook.com (2603:10b6:610:4d::18)
 by BY5PR19MB4035.namprd19.prod.outlook.com (2603:10b6:a03:229::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.5; Fri, 9 Jan
 2026 14:52:12 +0000
Received: from CH1PEPF0000A34B.namprd04.prod.outlook.com
 (2603:10b6:610:4d:cafe::2f) by CH2PR19CA0008.outlook.office365.com
 (2603:10b6:610:4d::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.5 via Frontend Transport; Fri, 9
 Jan 2026 14:52:12 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0000A34B.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.1
 via Frontend Transport; Fri, 9 Jan 2026 14:52:11 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 5011D406554;
	Fri,  9 Jan 2026 14:52:10 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 3D3F382024A;
	Fri,  9 Jan 2026 14:52:10 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 4/4] ASoC: SDCA: Add lock to serialise the Function initialisation
Date: Fri,  9 Jan 2026 14:52:06 +0000
Message-ID: <20260109145206.3456151-5-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260109145206.3456151-1-ckeepax@opensource.cirrus.com>
References: <20260109145206.3456151-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34B:EE_|BY5PR19MB4035:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4391d944-2e30-445b-f988-08de4f8eab97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|61400799027|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iAI1BvTXMmeE7kCP+FqfgLEbibR4jLzAjHrBJ6qewrMg2mlAtsSYgVn3nKd9?=
 =?us-ascii?Q?0rOYv9JCLSUhIkPqsOpx7KfzNl2k0yNIAAcnKKVp8mgyUio3fO8PqELbu80V?=
 =?us-ascii?Q?oW4Kq9WgJ3L7F13CvYc4C33KqFT6vuj7M9ok/n7dQwlaCYS8vxXYwInrvVoG?=
 =?us-ascii?Q?zG6EouBojxTlT0Kaq8XM3c19b+n5eU8CWSmqZzODjkKz+yTS9ki0O6p0V4SR?=
 =?us-ascii?Q?sscUnQHOUmc/teaZA7SQAbx7jqI7G/o81vMgYNgf1B7kgVd2uJHWQ3UFVE+N?=
 =?us-ascii?Q?929Vq1TLZpQpSko+DC5xwgqf+lOXs5c40Gc8Xyc6gVwIvmkldoBKYV6LggyH?=
 =?us-ascii?Q?dWEwcEFvfw21UlyoHUyoaGgVQ9ubP5mjkUtGIaBY0eZO2UsigQcuDLHVXdr/?=
 =?us-ascii?Q?l2x01Upi8s2+XupEUJ0C9CdB/2BjUScMQdsPOigrlSB31RfEGcovsMdDUwtr?=
 =?us-ascii?Q?br9RTYJHSZpoyqNtzUGibkoL2Yt1FWFjeRHJ6vObwHTOXGGuzld8fP7weWau?=
 =?us-ascii?Q?OGUe7eQ4FxquPJ+X+9ZqOreXEBSd1g7FcVLUD5VHTi0/Kw4XOheMnd7nZnqR?=
 =?us-ascii?Q?lSylKE2fQe0l5rx0OAJ0CRo5E27q4RvWUzRKOxXobXwrtPLa0vUKsc7qP622?=
 =?us-ascii?Q?lKXFA2mRiwBe9scTEF2QptBCW+I61WbDT7fU8ccV7Li6euy5+ydBOVGvovej?=
 =?us-ascii?Q?uPH+DlljfDhN2VLPJEr1e7cVws5GnjmZZsUSf5OjbivBpVFhGQlFs5qDDVXq?=
 =?us-ascii?Q?Ws1pzHjYO/pYBmFheXCOyokgvff6l8py7WgZRzZ9KCrZ1N67/WJgmemGNCYI?=
 =?us-ascii?Q?ZeuvVuvorv3xin4+7k5s2d+HpEQTLKJUOVcH9w+FuAP0k6xjoT/QmykpN7/+?=
 =?us-ascii?Q?OpcpuHNOdFEcITb7LaR0s81OGW/rgVKKIwutl+iIXd5ZXqjJ8oCX12fp3CN3?=
 =?us-ascii?Q?KhwHaQtC8Cl0kb0o8JTnXRcy3cy8y3DQq2AKQt/dVevP0aAP/vn5wqdVFj1/?=
 =?us-ascii?Q?B/c/5AzeYsayikrfqgTmEeX9azatfGq/VpWNOb/LF9dnLFViyr4V4TAGjiHl?=
 =?us-ascii?Q?pDiAtY2Zznrv4ZNfzOwhrzL2wJ1mwfm0JI++T0nacfo7KLGsLx/iJ2uPft/b?=
 =?us-ascii?Q?MpAvK9m7X12JJUA18nm3ZR/C7C1pA2Smn/Uo1vYDiMgoetG2A7nTqCaONH3O?=
 =?us-ascii?Q?Y+JmTbo8VP0IwqWVm723zqyML71AanGuR+2Jyp9DjxDkSHvBm0Q8do59HGWl?=
 =?us-ascii?Q?QBv8kG1HFeeY5fz77PsgOJ2E/rETrtJ9tZ/mJMa7LYJ7sym5UXQE+FOlMxN7?=
 =?us-ascii?Q?vyppJLln3d68RYHr8y54ZBmqyT2KA+tnmfUDayYAsykIIy9AKoLt6DDN6NkZ?=
 =?us-ascii?Q?6z/KA675Hyxds1BBi4krZGS0o9GI1DtKYQye0mJA1DyuI/mKK1W/wI4FX+nC?=
 =?us-ascii?Q?FLtLcjTgaDCvac0a4K4DQD7rpLgyvQRy1d4EvlPMzuZ6gwh7zgyOjpYxzMkl?=
 =?us-ascii?Q?O2xpt0j4lmZCDkIjPJrNzYS3++RflRWAdeYn5fKbmLOPQ3MT0WBM9ZAws0Jv?=
 =?us-ascii?Q?vNikZSUCf1TD6Y0nvzk=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(61400799027)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 14:52:11.3690
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4391d944-2e30-445b-f988-08de4f8eab97
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0000A34B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR19MB4035
X-Authority-Analysis: v=2.4 cv=Ushu9uwB c=1 sm=1 tr=0 ts=69611620 cx=c_pps
 a=iMozJJ0ZMpdRlXWW5uynUA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=ZebSmUhBFGRK0BiUr4kA:9
X-Proofpoint-GUID: AYjvnwYqyS2tTKLiGrwQjGQUQWMKzDFS
X-Proofpoint-ORIG-GUID: AYjvnwYqyS2tTKLiGrwQjGQUQWMKzDFS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDExMCBTYWx0ZWRfX6FLtKJVMVtxI
 Rx4lELLwKSTs6ldJCnFjkuUqi+DCKvn71QwViYesHFE6vLGQU1mFBoJzav/1NkPr0M5NSky/anS
 ClQKrTUm5c80BQFI+kEKaQRPDDJYADSYN6Uf45PnNHW39KxnyLeKsmZhWFP/ve5UEQVRjbHbwqD
 QooZNnVuFfNwPUosHYGXu59isULWFdMjl9SDlcmVfa2lOaRkcjg+DvMJT/zs1yIAWARl+dYBHFW
 CM3gsjHu3gineQNpSx2LV+27if55nPm8X49nIhALaPApfbZxThhbkV2DaG/NsocZ/WXmbmiumZG
 lcRm0s3IX/DXiZU1PXw9sB2ekcg3oqcfW0R/YJOojeHt0N1E6/vmONmJI1LTb6/AfS/9kIW9LHI
 PyteYE2YaFuTJpsyD6UWhEUtLZS5IX1qL2M3vIp6r711DBgi0gaHfmkyHdZpHuHbsh5fvgE5c/l
 528JnUNxtsZF1y6h2AA==
X-Proofpoint-Spam-Reason: safe

To avoid issues on some devices serialise the boot of each SDCA Function
from the others.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v2.

 sound/soc/sdca/sdca_class.c          | 1 +
 sound/soc/sdca/sdca_class.h          | 2 ++
 sound/soc/sdca/sdca_class_function.c | 5 +++++
 3 files changed, 8 insertions(+)

diff --git a/sound/soc/sdca/sdca_class.c b/sound/soc/sdca/sdca_class.c
index 6d19a183683e8..918b638acb577 100644
--- a/sound/soc/sdca/sdca_class.c
+++ b/sound/soc/sdca/sdca_class.c
@@ -205,6 +205,7 @@ static int class_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *id
 	drv->dev = dev;
 	drv->sdw = sdw;
 	mutex_init(&drv->regmap_lock);
+	mutex_init(&drv->init_lock);
 
 	dev_set_drvdata(drv->dev, drv);
 
diff --git a/sound/soc/sdca/sdca_class.h b/sound/soc/sdca/sdca_class.h
index bb4c9dd124296..6f24ea2bbd381 100644
--- a/sound/soc/sdca/sdca_class.h
+++ b/sound/soc/sdca/sdca_class.h
@@ -28,6 +28,8 @@ struct sdca_class_drv {
 	struct sdca_interrupt_info *irq_info;
 
 	struct mutex regmap_lock;
+	/* Serialise function initialisations */
+	struct mutex init_lock;
 	struct work_struct boot_work;
 	struct completion device_attach;
 
diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
index bbf486d9a3d07..0afa41c1ee93c 100644
--- a/sound/soc/sdca/sdca_class_function.c
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/auxiliary_bus.h>
+#include <linux/cleanup.h>
 #include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/pm.h>
@@ -244,6 +245,8 @@ static int class_function_boot(struct class_function_drv *drv)
 	unsigned int val;
 	int ret;
 
+	guard(mutex)(&drv->core->init_lock);
+
 	ret = regmap_read(drv->regmap, reg, &val);
 	if (ret < 0) {
 		dev_err(drv->dev, "failed to read function status: %d\n", ret);
@@ -418,6 +421,8 @@ static int class_function_runtime_resume(struct device *dev)
 	struct class_function_drv *drv = auxiliary_get_drvdata(auxdev);
 	int ret;
 
+	guard(mutex)(&drv->core->init_lock);
+
 	regcache_mark_dirty(drv->regmap);
 	regcache_cache_only(drv->regmap, false);
 
-- 
2.47.3

