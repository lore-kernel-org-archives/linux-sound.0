Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBCF1DF258
	for <linux-sound@vger.kernel.org>; Tue, 15 Jul 2025 15:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752592689; cv=fail; b=Qn4I4PU3VXS34KI2IKmt5z6eHAPMT1fUaJzyELLYLj10R9ruTtNnvlfe7hqzXrwFrJIKMK+sK1ZlrGbt8G0tKLBfzEIU7dZPsIvOIcaRmvbnLDAG2QCrCCnsxnBFuQPreiN0PQ03XgHoq4dkaYGzF7gWOf3hWgoEpVwMK12Naws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752592689; c=relaxed/simple;
	bh=hMiDsmNsNLbWB46rTnFsUet4Zd5Q4vIPowZRYnMj6Qw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QuM9a50cvlNgVb9xVQtRYbTijsHgwHeqHCSJ7+fP3YGbaF7D0C6Nc9O8SoxUjEWc+tv+Sjz8ZYW1TDZ3LAQBuSYugWTGCXEnBGO2o8OxNCPMjv+M2nQha8DUAGIqY9xNoRUlpwz/9iNjlDNomyVjmFgkm/Cm4I+FgIZ6JAdKyEc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Q05t+hdB; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Ynht9CsW; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Q05t+hdB";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Ynht9CsW"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FEm7PW029140;
	Tue, 15 Jul 2025 10:17:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=gtsuFFdj4aXYNopu7jrifNNCc5YgxblfEsr6c+AdUi8=; b=
	Q05t+hdByEgVJAIANKQhXh25QjF4o4PS73E5HSY9eiHB2y04jfnrq4fsL4ci+I/O
	NozLsk0QVtZ4GOBE5Mr5fecDIyrjsrEEL8nfN11jfxOWnOtfWRBfWMsNQwUN8vMz
	ZeaebeA2VcEYi+d5qOz+CYNgPm+FppBrR4NuX4VToZNNB7S3EiaqQtXX5pgOVQHN
	oVlNErAy66Tf2w9rGVsdn4gRkwdBPB6uthQrcRPqoYtJrIqC9rCjaYEniCVa0NyD
	MfTx7tQyQ/27Q0kTttwzS1thC50NzLcoQKmTx2VS+9zr+fbKoCcXQQvgD1guZIu6
	eU0pDharqWt2rwKFyWGCSQ==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2107.outbound.protection.outlook.com [40.107.223.107])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 47um4gvc6e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Jul 2025 10:17:34 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ebvzV9yqLOtenm1dWlabNnk/ZwGLwyKI8wZwewNBv57KkYWS0cF24rat8XkbFdzCtdhEPtD/yLxcVUJIWeIGubzezVPx5t6JPLw/rvPNe/JUJpGvkTxlUYFJy2iIOe3LjpLH9C2hIKoj2PLoxusbVGGuVZxdqScnaaxZY1t5CEN1ps662Cc1l8oUMhdPuSr0oSijoy3ksbyVTZ4mi1klaWP6zJZmW1r0MeWmxkz0+YGIybPzSGsp2jUeJnjc9qrZQdvBzlbn7EOHGS/FYVlojxdXvPxq4h62roggJFqIilfVEBCf/F+Y1ZDpeFQ837wkFdeZ6ehu93HjTTvuELNrSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gtsuFFdj4aXYNopu7jrifNNCc5YgxblfEsr6c+AdUi8=;
 b=bAPs2OeW94esV/RJS4f/RXEF/fbALYeN6DQkBcedhpdcgjd8RRWDn7mK7AluaLR64QHOrxvbAps8U2U9vO3MxaiJR16fxZl0j4wygXqUynDqys6//OC6geJM1T3PxR8Byt2s+jVv5HMExeBiAiaGKmfnxdE9AtbmAfMR6sNIk2GLjaJwPjcKIyfcWHJZTfuDG5R9P6ZKdwrKQkxNx6sSX3pLpDibnIH40vODwxiZtOWeBGZTLDxOBczwggiCC5LrfHTU9pslArkT6iJaEoVqA4skjZ4FzbIOk+W1kMCK4itzSTkv4S12LN0hSH4OHVC3XuzUDzZJr/2I3fcCoLUK9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gtsuFFdj4aXYNopu7jrifNNCc5YgxblfEsr6c+AdUi8=;
 b=Ynht9CsWHdhintqqKo6kRQLgqSjkbwXEe23Fl/HTH08cx/TTYHiNffqZU7+4SfunMs6n2XP5WxTj0JrHnYDIGTDAJweDoVgPzICV+dCzUzd7VeQAMH9pGRa7Vxto5pdLidyARTyrQy5PlL0HncCVKENeWl4FK3fVV5CM2RswagI=
Received: from SJ0PR13CA0035.namprd13.prod.outlook.com (2603:10b6:a03:2c2::10)
 by MN0PR19MB5756.namprd19.prod.outlook.com (2603:10b6:208:377::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Tue, 15 Jul
 2025 15:17:30 +0000
Received: from SJ5PEPF000001F0.namprd05.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::b) by SJ0PR13CA0035.outlook.office365.com
 (2603:10b6:a03:2c2::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.16 via Frontend Transport; Tue,
 15 Jul 2025 15:17:30 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001F0.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22
 via Frontend Transport; Tue, 15 Jul 2025 15:17:28 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 263C9406545;
	Tue, 15 Jul 2025 15:17:27 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 0069082255D;
	Tue, 15 Jul 2025 15:17:27 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        dan.carpenter@linaro.org, shumingf@realtek.com,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 3/3] ASoC: SDCA: Update memory allocations to zero initialise
Date: Tue, 15 Jul 2025 16:17:23 +0100
Message-Id: <20250715151723.2964336-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250715151723.2964336-1-ckeepax@opensource.cirrus.com>
References: <20250715151723.2964336-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F0:EE_|MN0PR19MB5756:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 588e45a1-78e2-46e4-fd32-08ddc3b2b67c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|61400799027|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OOGUElDqhpz+sI8Fw4D2STZ+9XO7V72LuekQG2du3edRrZMUDHGMDXiSde1A?=
 =?us-ascii?Q?fbb/Vh63J7EdhTKBXGpU3T2Tg3EO2/OZvZaH7ZMQtz4gJz7yzypuSHXf2g3p?=
 =?us-ascii?Q?vPG0Rxp0eL5z4DxmaObY8v5WxPTQu1Hpi3iURbwcjmdf5D9lTK7UT/qRdlL5?=
 =?us-ascii?Q?ac7TZ+T0axmVOUf+BTer43irl3YfEUpoB+qP8s68R/mntyQ6K8Ht0zKxsFb8?=
 =?us-ascii?Q?1rpuNDy3orSOiU+PMTay0TSCcNvEwpS+Lcdw24X7HSmqmZ8LcYY7z11VDXk2?=
 =?us-ascii?Q?03IvdF7SytrUyox9LOXJunPRZNC41FA6AU3ptMcS08ah+hZzCg1TL9hbun8y?=
 =?us-ascii?Q?s4sFOC+K6njxgGPC3f1tW0OFn073bQXOmCmOPK/HfxT2GyoJOaU2FAWP7O7t?=
 =?us-ascii?Q?G8zQy0OztTJ21bWfXFq2Qv+b0Xj2/lsXm92GormadejtYK3BewEVjQNcF01j?=
 =?us-ascii?Q?OfrCO6Mr1j+n6CDa5FuPVEsNvFfGTGPo95D1M9SJsiDSLZBTa35JyoWDTUNa?=
 =?us-ascii?Q?ycEXoIPBbUmYbbofjkzmfgLCGfVkBt1sJE38H9/dmQaWVXEh81atO8zQ6IgQ?=
 =?us-ascii?Q?fhp1QRpLMaFlwTWOogYPOq1yx6cua10T7m8WEbLTL2MArT9zPdJJYVTgXhV8?=
 =?us-ascii?Q?2DFIzveR3baJcXNMFQce/50WXkFksR+5U+Vc75gpGxnkH+T/p8EpNa/5Jzo8?=
 =?us-ascii?Q?hXLbOIUIvZ01yCG2u3vBI+0K5RjxCxqgsrfoUwScMH87B+AJmylDJM7tTCd3?=
 =?us-ascii?Q?hzxvL36TsTrq8S96fgjIT3LSy4jmrs/hPING4GJy7CAkJ+EPJENqFILwgd4d?=
 =?us-ascii?Q?M9pNg8ipAWpANH2p2y+9Uq77ngOSLgRZl/tRUC1yefr9Q2pRPlKJg3mPbvpN?=
 =?us-ascii?Q?FJoDCrBC6T/pU0rTnKH0r1vuiHCYbNDYsaTEnOrAlVnB6IBARvW/B9iGIkKz?=
 =?us-ascii?Q?1UsuSh465Dz+gOi2nvJ7gYKtB5PUrH6KYMMIUjoEWW3FMF7HKbCFoSkKPCPK?=
 =?us-ascii?Q?fW/bJRDfxMd8J3nQk6ywtuvP65t6i7rGjEBrudqXTPeqiENF9ZqYsxeBgsEI?=
 =?us-ascii?Q?7C8qMCJvKzeCDldSbJOfzYMztiIZhJf6JlvPS3qYrJu0MFXfDpPOTE4LRd21?=
 =?us-ascii?Q?LnDG+f7TfzejDidhmbs1XSp5AjYNKUVCkZUQhKQ4BC7EtsEgMiaWwH9fZkHZ?=
 =?us-ascii?Q?BrAWgS+3MO+AR0riXq4i3s/dgp4FHsyDWQfWKBMm0Yg3qShtiHaodZxvdRv6?=
 =?us-ascii?Q?W7c9UZdBbN2Euld/jJLUrxNrwANfrNdddZ0RP6QMCdnOSvp9zxzpZ+2FuTs7?=
 =?us-ascii?Q?KDJWzvWHNRnJgoHC7YH0tHSUYRI96vCp3opSDojqBhmPQTbiR6aJrtsFC1Oi?=
 =?us-ascii?Q?pEi8FyG0KxdbmoTTQ0ehN0NNKfhYCT/FaiBXemVmdJrOUiqdhgvSqX0gBgk/?=
 =?us-ascii?Q?rduNuvgqC85QldwD4Tku4Fmgmz/vvknx98V4PmvwHSI/UKPF2Uzy8OYNWfiE?=
 =?us-ascii?Q?4xAe67VjAJ7TN93H4K5O+rl+UQgrKLMzHC6o?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700013)(61400799027)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 15:17:28.6133
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 588e45a1-78e2-46e4-fd32-08ddc3b2b67c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR19MB5756
X-Proofpoint-ORIG-GUID: g7WZufRTtrFtsNmHoo5aMzg30fF4DkXc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDE0MCBTYWx0ZWRfX9b4u9+5byrwx AvV7R7NTjeBaAVS9lafx0B3PkUGR4TqvA+bcPUUW7FYsRNfwLVSYc1zsR+JHDkqg8mUJqhjbUgG aBJD5otQFl2yaG2ka0uaR5mOPcnWh7v/RXBdnhZqJufANL0BXEKSZtyrfC5tmdjjckckqAlqntA
 I1FxAj+swGTjGey1M4G85zRuMz587RXFChrmKS3F59Gs9Qhrybai3M20MNy0N3teRcACRugYElN AOnk+s7DFgcmrv82CWi1a/tGy7jgpJdcMitqaY7cvVhG1z7R1bEnDLxiiukY2eqSmcRkVioBzH+ xWMtqpFNQm8dx7jVdjDjh9Oe7l6e8pxGUqQZw9pnTcCCDW7hffwkMkJFZLH81LNJvBgckOkSUsg
 dce50OAw0P3qxGylzgO5zfiKiooZnue9v8HX35+IiXY6O877FpGmGuaaBhGh5G6/OiR6p2Ou
X-Authority-Analysis: v=2.4 cv=Kp9N2XWN c=1 sm=1 tr=0 ts=6876710e cx=c_pps a=aVHjp9ag5SOPUVfpuEL+cA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=Wb1JkmetP80A:10
 a=RWc_ulEos4gA:10 a=n9Sqmae0AAAA:8 a=w1d2syhTAAAA:8 a=kGD8SVebtJ78pGT0AoMA:9 a=UmAUUZEt6-oIqEbegvw9:22
X-Proofpoint-GUID: g7WZufRTtrFtsNmHoo5aMzg30fF4DkXc
X-Proofpoint-Spam-Reason: safe

All the memory allocations in the SDCA ASoC helpers rely on fields being
zero initialised, the code should use kzalloc not kmalloc.

Reported-by: Shuming Fan <shumingf@realtek.com>
Fixes: 2c8b3a8e6aa8 ("ASoC: SDCA: Create DAPM widgets and routes from DisCo")
Fixes: c3ca24e3fcb6 ("ASoC: SDCA: Create ALSA controls from DisCo")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdca/sdca_asoc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index dd7b19083c85f..ebb1c87facf9c 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -230,11 +230,11 @@ static int entity_early_parse_ge(struct device *dev,
 	if (!control_name)
 		return -ENOMEM;
 
-	kctl = devm_kmalloc(dev, sizeof(*kctl), GFP_KERNEL);
+	kctl = devm_kzalloc(dev, sizeof(*kctl), GFP_KERNEL);
 	if (!kctl)
 		return -ENOMEM;
 
-	soc_enum = devm_kmalloc(dev, sizeof(*soc_enum), GFP_KERNEL);
+	soc_enum = devm_kzalloc(dev, sizeof(*soc_enum), GFP_KERNEL);
 	if (!soc_enum)
 		return -ENOMEM;
 
@@ -561,11 +561,11 @@ static int entity_parse_su_class(struct device *dev,
 	const char **texts;
 	int i;
 
-	kctl = devm_kmalloc(dev, sizeof(*kctl), GFP_KERNEL);
+	kctl = devm_kzalloc(dev, sizeof(*kctl), GFP_KERNEL);
 	if (!kctl)
 		return -ENOMEM;
 
-	soc_enum = devm_kmalloc(dev, sizeof(*soc_enum), GFP_KERNEL);
+	soc_enum = devm_kzalloc(dev, sizeof(*soc_enum), GFP_KERNEL);
 	if (!soc_enum)
 		return -ENOMEM;
 
@@ -672,7 +672,7 @@ static int entity_parse_mu(struct device *dev,
 		if (!control_name)
 			return -ENOMEM;
 
-		mc = devm_kmalloc(dev, sizeof(*mc), GFP_KERNEL);
+		mc = devm_kzalloc(dev, sizeof(*mc), GFP_KERNEL);
 		if (!mc)
 			return -ENOMEM;
 
@@ -926,7 +926,7 @@ static int populate_control(struct device *dev,
 	if (!control_name)
 		return -ENOMEM;
 
-	mc = devm_kmalloc(dev, sizeof(*mc), GFP_KERNEL);
+	mc = devm_kzalloc(dev, sizeof(*mc), GFP_KERNEL);
 	if (!mc)
 		return -ENOMEM;
 
-- 
2.39.5

