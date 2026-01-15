Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51A73033D9;
	Thu, 15 Jan 2026 14:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768487975; cv=fail; b=Mx34/SrDm4Wu7XcdWhRVKsNf2HhDrOEimqBEsjgZolFjdAG5R3VoaHFk+Ws6KcaDVISdAAaRU+xoADS9PZ6YZXt+ol3TZWGpl4wlDatTaQwawm7L/PDWzkXVSsVzMUd5TSyRjZpvMrg+jhFr6hexWNlLLj6jMGgxwx55oS5WqPI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768487975; c=relaxed/simple;
	bh=O3CpJbMQycmADrzhLMqoS0A+h00TOsQuqw+o/jZ4taI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SJzPRk8G75OqUb0lNBhtY5ySOhV9Cmym0/SgvMY4oKefdJgGMNCI6g4gR1sLjyHvnzKQ2IiM+PhAW0PQJ719yh0bvi9/7dbcVyIwrtH0ozuPG7EGHf4yR3iqiBCAZQMkyUvUQ51YR85QUxix3RpOAJpCa5wHqySCFOuSdyUjkc8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=NWnk467I; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=CMLAhnna; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="NWnk467I";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="CMLAhnna"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F5tfGN1710468;
	Thu, 15 Jan 2026 08:39:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=tkFYMXOkw1sEIi3o
	3eHfqAPGF6VUPjxX1Tg5Fq7KreI=; b=NWnk467Iy/LwPKUZxi762/Z/JJMDjh/K
	uKyGRaS2w4xsplmbSMSungmYY4Yar1oxqOFCaBgNlZNchaBUGGCPL0/z2Fzn7KYC
	0oEfbG39NggbGY5VakzmIzasN9RAh6HLz4wixGg/6dODJVMtUpOHb3ePLiVKBfIv
	0HE+kGo/lRYww6lPtdlMFtkXRqFD9wVUPzX3mmGQ63ndgLB8gi5kp+hkcee7Gs9O
	Qar+koujRvAFPgzpbKcKfVV89t9OrPBUzp6gznxqzheH40GGKGpKRE5+SLamcnau
	zoErgbHG/peVvsdicjX+iOPtMPdDP0R5SlqmMij4H5rg4lG8HOX/9Q==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022109.outbound.protection.outlook.com [40.93.195.109])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4bkm2n5y9e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 15 Jan 2026 08:39:27 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ReMQudsrCom0/AAJbP/2yIc12/wEwLm1aqlLocJJR7Ooc1YWLq2AGsi27WcabeM+dtAl10kc+bRZEGp4Bxc6+EesnR1ObBTD4gsADdmP7gCFb8qModdN11tJT6d6XhOXjmZjrWGTmn/SKWxD/JQ/O1AwFMGeV6VaSKCfK5yHBDzkBh3ftkDZCjd5v8rHmpRUPjvwPX1RvYYgdwWG/85jw9WMM0MZhnoqOh7+dhOymVLcWNsrKP3WXrNDOtRDMCf4DF37Siiy5xhdjayhR5tlZJmpmdibdDKR33zV5EN3WRQcjoMPHPZ55gxIOYkFunkZpnWZwFZ4wWbpwKwh7dWXFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tkFYMXOkw1sEIi3o3eHfqAPGF6VUPjxX1Tg5Fq7KreI=;
 b=DrtslPW+53lGDm7RIguhZR4iRxuF/juPZ/TXIBJSRC7/qQQqQiKkqGPkjy4UY2W7+If1ct7F1CSRwdyuZyRppJHm0ZREp6AnbhneVku7tt0cdc9gj4v7l3k2Y8JKSL7kbCszEHx7qn6sjMvIsV4ZGmwzWTgdEY37c6UUQ3Q8Y6pHQXjs5+ISNhUehPcgKQk+SZJjtECZ8HVRwsZ7uZuTBVzRM8XTMd7ePqP/WPh/4htT5JEjlimaHOUiJAXr/HQ0xJWc/hxy8LsVSc5N0kn4yoSvK2x3fCfaVnUseGfO+LEudLEn4jV/WjaHEvJtRfIExI4lRjq9drjm8AySdtioPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tkFYMXOkw1sEIi3o3eHfqAPGF6VUPjxX1Tg5Fq7KreI=;
 b=CMLAhnnaQfOBgKIGm3MvmvOrKLv0zLS9Cu5zhKgx+pvr55vQSg+esDVFAGtOK+JBvQwSoyl0RF4WlqYGyAxwmejbPMdtSp/EbXP8cZXrE4RUOwCo4A4HjuPi18RzzVFt8PD8ZDhTXo/ZPZSLgB/7RHUdex1d8QkoygqQRhVr2Y0=
Received: from BL1P221CA0024.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:2c5::31)
 by LV3PR19MB8320.namprd19.prod.outlook.com (2603:10b6:408:216::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Thu, 15 Jan
 2026 14:39:22 +0000
Received: from BL02EPF0001A101.namprd05.prod.outlook.com
 (2603:10b6:208:2c5:cafe::c4) by BL1P221CA0024.outlook.office365.com
 (2603:10b6:208:2c5::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.4 via Frontend Transport; Thu,
 15 Jan 2026 14:39:14 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF0001A101.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.4
 via Frontend Transport; Thu, 15 Jan 2026 14:39:22 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 16ED540654E;
	Thu, 15 Jan 2026 14:39:21 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id F1310820247;
	Thu, 15 Jan 2026 14:39:20 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: tiwai@suse.com
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ALSA: hda/cirrus_scodec_test: Use faux_device instead of platform_device
Date: Thu, 15 Jan 2026 14:39:20 +0000
Message-ID: <20260115143920.1553783-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A101:EE_|LV3PR19MB8320:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1bf307f6-1379-408f-027b-08de5443df7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|61400799027|36860700013|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/Y84FbqouAaJDL+PQvjojgOfREokvbFqzC2HvsPFa46WqpVKKd7tBNJrg27v?=
 =?us-ascii?Q?xVFn1dJaMHGCZBUs4Rvot5kFqXfL4ty+qHbhyBA/L1n4ykTyAkeeoZMBkclG?=
 =?us-ascii?Q?9o9nz/+pj+5QuKgcP0ovsX9VvfsDKjWCRwqJwa75RxsIFVqTbxQCoXLWLWHK?=
 =?us-ascii?Q?HNMSID/2c7yl7TVEkPidmnCPfTx0xBTBWWsYglakSkdqLvGnLx9nWSixv7wV?=
 =?us-ascii?Q?GbTsD6vIg/GhRPaGX1v1ZmfcpS632f16Ir4peLJAGc55g0yEHQU14LWiqTP/?=
 =?us-ascii?Q?3DejkEoxbV/6UbhnzTk4k7sDG/PH+XD7Y2KNaxu63RQ78ntNlTLDGYHggjpt?=
 =?us-ascii?Q?DKSVJD++A7vcqvkqkG7pj2tdtZ/u59gjUZAO1XKxBrobfgMsqGfxsblqqANF?=
 =?us-ascii?Q?2ApKbbIUxsdWIBZmhtOXLcxGeuAvOoCbpYesQ8bP2kThlCfJBXvjH6ZxsONk?=
 =?us-ascii?Q?EBuCFKNZvzM78HtoyXHDCGdFG3vQqA+WRQ4zppumWktANHyuUcE7koDTLCC6?=
 =?us-ascii?Q?81/DZId5kRB1nzUso7lawT3A/B9Vmr70kEGspVtRs6Ot3t7S8ZQg0NyO3kZU?=
 =?us-ascii?Q?SCBsN9yGWetSsnFgtUQOsIyDG521ZxmE7QvSXyXuLDfv8bU2c3ADGJ+tUEni?=
 =?us-ascii?Q?gF662XwRw1MZ/6dV6digGnoi3mkum7sdG9siaNfqIrkb/g/mYQiM6dCi5tHt?=
 =?us-ascii?Q?g9OZmCPk/aYuiKcQaJLXXmHxym2sNlzfYBlXnxXrIMH6rmNXIcORsukD9r1s?=
 =?us-ascii?Q?gWRq0Oz1ZsIFTZtjNVjOWNqI8a/sGzRoQmUr0nKhhUEuIjfyDz+II8SSFzAr?=
 =?us-ascii?Q?aoq9aqUaHEYslwkADRN1T+uY6Q4mgPzhYN0UOtl746UWQVRnI2Ng1owD6CVs?=
 =?us-ascii?Q?DKNPb0fz+sHxI3TvqlBPy6YS7diz4X+7XifKHSrM+7ybruasCdGjx7sqY9dW?=
 =?us-ascii?Q?GfqPa7vZW9PQZt/0Amrad/OEPhaqfOPuqzAbM3hazyj2UIzb+BvgKh97vsvR?=
 =?us-ascii?Q?NM5W/7O39He6biSAKo4iVUaioE+tUh8ra0CfD6GZV65TQdd2vaM9fYrAw5ik?=
 =?us-ascii?Q?m5iQW2UV+AMu515iGCD6tPHL3MIdMF1L0BZ8uPAkUUQwWZulQl5uAnW/h+51?=
 =?us-ascii?Q?h8JTvIEp1Eyik4qY3OIZpr+8KcqKSyQ9SZRZ6ShIj1jdD5GiYcb/Dc97Oyww?=
 =?us-ascii?Q?/9i2mDbSs2BVgr6ZPORZTj6N5WzYuKi85qirHex2J9i/P7Mu3usmCzY6m6y3?=
 =?us-ascii?Q?UDSbV0jQF89NENicz4sNcfoB43maWCLZVp/sLcGdJ7PSxvYV9Lj3ag6WSCco?=
 =?us-ascii?Q?6N4rxdFFX7Bsh/RNCE4T55B2cRBgmE7JrrvxmM+fiXMlPEpGTpfvAIRCMlzu?=
 =?us-ascii?Q?kLdDvFF9b5nvxojd6BT1ObhOZQCxIVHauJNY4SyqrirrSUgbsxYAURIoWglP?=
 =?us-ascii?Q?cH7q1y55JdUFlGvkyeBgfiURe6xrzpW+0HyENTKZLwkxy9rT8z1GBqxzGuqj?=
 =?us-ascii?Q?ci3MaYHjbSYbAEFVyk+z16193qXP3XlTh3M1sLvflIG/ZxPyKz4GTQRIVeaw?=
 =?us-ascii?Q?SnSwu2pcB6iAwVwyEu0Q/3GJR/W70cHvOhrzTKG56hPMs2liH+3Nt4qGVHrh?=
 =?us-ascii?Q?ozi8OnPbji2eE3plcMfmIUOQ2lWAqrHpynzW7p8ps+Bk2amiE56VWTNTqxva?=
 =?us-ascii?Q?/7H0IQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(61400799027)(36860700013)(54012099003);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 14:39:22.0038
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bf307f6-1379-408f-027b-08de5443df7b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL02EPF0001A101.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR19MB8320
X-Proofpoint-GUID: m06XMkNRGz49QlGN_eRE2mRZ1HHC3_oL
X-Authority-Analysis: v=2.4 cv=JZ2xbEKV c=1 sm=1 tr=0 ts=6968fc1f cx=c_pps
 a=o74NBiIPioXkFKZqBywf3Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=RPzK4ybBN7rR8r8zI6wA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDEwOSBTYWx0ZWRfX8B/ykhm/xSTm
 0XysRR29xU8xI/8ZX5ysofq5SIYigaqPMIDfttwht8PgV4KPn4ZFrDtr6vr8JlevxCOYYu5sGHO
 XpkeRVPuqok7ednfq+gJec4mygATaStbjYRAQ05XjiTVsswpq/yE6Cxh2l6SD7GHBVjlO+dzvKO
 25dgEjIfmDn5W1WRqDwSRnGElF8KgbvTrhKXQHaFMM7Ne5aVOQyehw/kssH69zLNJs+SZwg5LNj
 VxXHBqv3Yu8IFjDF3rz0qI8BLcEtLmul6FrEIlS3r4ig3kGfaeCNn503uL5AP+Z9x7wlDagwdYw
 651yQ6UskdYaKC2M4mWi422QLPz6qNpU0JyZARBP0OisKXlOc0/ZPpFbDN4Bs0kQ/bYiGtBbMf7
 zdqkojrbK2xC6r/CHCetGr6dL9UMqZ2ljBcWSL81HM0bEy4B8VBE4xiZX5zBkG3l8pRxyrT0/jH
 aRp2xnIhlDcFVNm0RGQ==
X-Proofpoint-ORIG-GUID: m06XMkNRGz49QlGN_eRE2mRZ1HHC3_oL
X-Proofpoint-Spam-Reason: safe

The dummy GPIO driver doesn't need to be a platform device. So make it a
faux_device driver.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 .../codecs/side-codecs/cirrus_scodec_test.c   | 61 +++++++++----------
 1 file changed, 29 insertions(+), 32 deletions(-)

diff --git a/sound/hda/codecs/side-codecs/cirrus_scodec_test.c b/sound/hda/codecs/side-codecs/cirrus_scodec_test.c
index dc35932b6b22..50527c5fa374 100644
--- a/sound/hda/codecs/side-codecs/cirrus_scodec_test.c
+++ b/sound/hda/codecs/side-codecs/cirrus_scodec_test.c
@@ -5,14 +5,13 @@
 // Copyright (C) 2023 Cirrus Logic, Inc. and
 //                    Cirrus Logic International Semiconductor Ltd.
 
-#include <kunit/platform_device.h>
 #include <kunit/resource.h>
 #include <kunit/test.h>
 #include <linux/device.h>
+#include <linux/device/devres.h>
 #include <linux/device/faux.h>
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
-#include <linux/platform_device.h>
 
 #include "cirrus_scodec.h"
 
@@ -29,7 +28,7 @@ struct cirrus_scodec_test_gpio {
 
 struct cirrus_scodec_test_priv {
 	struct faux_device *amp_dev;
-	struct platform_device *gpio_pdev;
+	struct faux_device *gpio_dev;
 	struct cirrus_scodec_test_gpio *gpio_priv;
 };
 
@@ -92,59 +91,57 @@ static const struct gpio_chip cirrus_scodec_test_gpio_chip = {
 	.ngpio			= 32,
 };
 
-static int cirrus_scodec_test_gpio_probe(struct platform_device *pdev)
+/* software_node referencing the gpio driver */
+static const struct software_node cirrus_scodec_test_gpio_swnode = {
+	.name = "cirrus_scodec_test_gpio",
+};
+
+static int cirrus_scodec_test_gpio_probe(struct faux_device *fdev)
 {
 	struct cirrus_scodec_test_gpio *gpio_priv;
 	int ret;
 
-	gpio_priv = devm_kzalloc(&pdev->dev, sizeof(*gpio_priv), GFP_KERNEL);
+	gpio_priv = devm_kzalloc(&fdev->dev, sizeof(*gpio_priv), GFP_KERNEL);
 	if (!gpio_priv)
 		return -ENOMEM;
 
+	ret = device_add_software_node(&fdev->dev, &cirrus_scodec_test_gpio_swnode);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(&fdev->dev, device_remove_software_node_wrapper,
+				       &fdev->dev);
+	if (ret)
+		return ret;
+
 	/* GPIO core modifies our struct gpio_chip so use a copy */
 	gpio_priv->chip = cirrus_scodec_test_gpio_chip;
-	gpio_priv->chip.parent = &pdev->dev;
-	ret = devm_gpiochip_add_data(&pdev->dev, &gpio_priv->chip, gpio_priv);
+	gpio_priv->chip.parent = &fdev->dev;
+	ret = devm_gpiochip_add_data(&fdev->dev, &gpio_priv->chip, gpio_priv);
 	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "Failed to add gpiochip\n");
+		return dev_err_probe(&fdev->dev, ret, "Failed to add gpiochip\n");
 
-	dev_set_drvdata(&pdev->dev, gpio_priv);
+	dev_set_drvdata(&fdev->dev, gpio_priv);
 
 	return 0;
 }
 
-static struct platform_driver cirrus_scodec_test_gpio_driver = {
-	.driver.name	= "cirrus_scodec_test_gpio_drv",
-	.driver.owner	= THIS_MODULE,
+static const struct faux_device_ops cirrus_scodec_test_gpio_driver_ops = {
 	.probe		= cirrus_scodec_test_gpio_probe,
 };
 
-/* software_node referencing the gpio driver */
-static const struct software_node cirrus_scodec_test_gpio_swnode = {
-	.name = "cirrus_scodec_test_gpio",
-};
-
 static void cirrus_scodec_test_create_gpio(struct kunit *test)
 {
 	struct cirrus_scodec_test_priv *priv = test->priv;
 
-	KUNIT_ASSERT_EQ(test, 0,
-			kunit_platform_driver_register(test, &cirrus_scodec_test_gpio_driver));
-
-	priv->gpio_pdev = kunit_platform_device_alloc(test,
-						      cirrus_scodec_test_gpio_driver.driver.name,
-						      PLATFORM_DEVID_NONE);
-	KUNIT_ASSERT_NOT_NULL(test, priv->gpio_pdev);
-
-	KUNIT_ASSERT_EQ(test, 0, device_add_software_node(&priv->gpio_pdev->dev,
-							  &cirrus_scodec_test_gpio_swnode));
+	priv->gpio_dev = faux_device_create("cirrus_scodec_test_gpio_drv", NULL,
+					    &cirrus_scodec_test_gpio_driver_ops);
+	KUNIT_ASSERT_NOT_NULL(test, priv->gpio_dev);
 	KUNIT_ASSERT_EQ(test, 0, kunit_add_action_or_reset(test,
-							   device_remove_software_node_wrapper,
-							   &priv->gpio_pdev->dev));
+							   faux_device_destroy_wrapper,
+							   priv->gpio_dev));
 
-	KUNIT_ASSERT_EQ(test, 0, kunit_platform_device_add(test, priv->gpio_pdev));
-
-	priv->gpio_priv = dev_get_drvdata(&priv->gpio_pdev->dev);
+	priv->gpio_priv = dev_get_drvdata(&priv->gpio_dev->dev);
 	KUNIT_ASSERT_NOT_NULL(test, priv->gpio_priv);
 }
 
-- 
2.47.3

