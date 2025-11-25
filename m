Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD10325702
	for <linux-sound@vger.kernel.org>; Tue, 25 Nov 2025 15:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764084121; cv=fail; b=ZT3J/t7+gEeYhxaE7oMQ42bKfy2BpDulRn6Ypl6spbiNLdmkvJ/+Hdyk4Xt7QRiEmUujlbvjD3KyW8PZYEJPvK1d6P6Et5gRPYrSqTAldxcUtLGBL1lGr5JIvwmkfq/xvNRjyCtKC8lXQ/QXDcqwd9AXqzWQ71MMlOkepQ5Eex0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764084121; c=relaxed/simple;
	bh=Arru2xRpz23ChcJfIxQIqWUBReO0USoUEsd95pcRjBc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eTBTz3GOkwZBASs9G5E5HZcCWJN1/VOXuU8FZLo1SVcVocp0TvY+h8XUsMbQksO7Ef46S4pzvkbATZNK7f8S0XckGwsQYlFyCVTeRPnnw2UmdIBBsPWPE/P95SqNZ7uelOv8b29GKcI2hii9e7LjbEnVrNCDjnzQnUUpW6gnUlM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=AYLprQ+O; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=kXyPQZRW; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="AYLprQ+O";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="kXyPQZRW"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP5jJV93446921;
	Tue, 25 Nov 2025 09:21:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=/OtexqhHRzQDwetru61h58YB1S/w5dLNa4sqrTlBTtw=; b=
	AYLprQ+OVBTM1jmWGLuGn1NkiWH16t4iMYnJiLknMT8HAf6vBUNzbBbnu87obYk/
	/nEPs2jhOf/OjxP2zO2ku4jaSPa2C4eOuDq7g3gHmdoykh+xXeIbP3YYvBPkDmLB
	KrslTE9BV1PmPGLEdaCNKG1YchX+h+o5p2M0n5YsYILEtaugQXqQm7HW8OYdMOGt
	N+9bvOWNdTdT6MN07age6eNLbb4DCyI4u/RdMZeTLgtq+jtaRx2Up/ebTb3+U07Z
	d226+St9xNgfb6l8s1hebJsXsHhfin/pTccEm2BBmoR9/wYEoBb0OReIhTvsrxUa
	N6kiWrDBEh+Wsup8Ky2RbA==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022121.outbound.protection.outlook.com [52.101.43.121])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4akbf1b5t0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 25 Nov 2025 09:21:40 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sAgM3dUV8RSFOQEzUqWgFAhGf+Xi8AszjT+ZRboxFasFXwTce0dG98WWhCejDofDvkDisx2/OIOGY+tdGEoFvxVin/9HDR+zF6YWIN8nwidkefNe6lAYcqfo2AIC2k97ANijOjFDbO3L9Aa6NdIrgrPUP+oPxBLJTgKLkzTO9HDtVMzk4uEhawPrCMfsGpeH93j+jvd+5sTFWZDxFMP/y6Q7nKGq4Z/YYDIpHC63mHXUlqQCZUAo8IFeaBX6Q3l5oDE1VxJdJnWNeNcvaZ5Kx8eCFqgxweatDIlRouJgAj0swbSMPThkhwJdkCBMg3plVCblGEhGb+IotH8aSOY+3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/OtexqhHRzQDwetru61h58YB1S/w5dLNa4sqrTlBTtw=;
 b=htjU2sIb3+F/1DCZ27shJKNucflQlrP0CITpLAVizXhH6eTdu7ntV2aYPgxMc54e2lmARtRQmLui6BYA1TzEvbhazigKVTQrpVMXXOTrPUmz1Gz/a/r1+Mg8RoDKfSEgrLzZ0I8SUaXG4GmNosie9NIrjHTNjhNlDAx+D0k/kzFcg7qdBcEsVcrKV+J0DpSR+aS5Glppqsr6iDDstgVqWySJ5cWbnlvytHYM3PN6cxo2It+/yeeMzmSPbZThRxuGQRyv19X6nViDy17PDCzbwv6o5pwZErH5yISg58/sUGCC3XPju0rCkpkj8tT1gl1wnI7c4kKdG0QirF3h4z/k1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/OtexqhHRzQDwetru61h58YB1S/w5dLNa4sqrTlBTtw=;
 b=kXyPQZRWWtwLTo2VzrAhLg4ei7rT09Vc3omc3msGrg/RQ+ZRbNLB7BD1gFmd5wcJRESvUuqSpP5azQewjiorqsZYFt8L0ar9W/soeZ7TaJEhkw4NKBm+viewA1nzhNYgGdSnj5CqQkVL0yimq3lqTWT4g0xDVvmbeZUhqL3kNS0=
Received: from BY5PR03CA0009.namprd03.prod.outlook.com (2603:10b6:a03:1e0::19)
 by SA3PR19MB9526.namprd19.prod.outlook.com (2603:10b6:806:496::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 15:21:37 +0000
Received: from SJ1PEPF00001CE3.namprd05.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::68) by BY5PR03CA0009.outlook.office365.com
 (2603:10b6:a03:1e0::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.17 via Frontend Transport; Tue,
 25 Nov 2025 15:21:03 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00001CE3.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.7
 via Frontend Transport; Tue, 25 Nov 2025 15:21:35 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 8827E406556;
	Tue, 25 Nov 2025 15:21:32 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 79153820273;
	Tue, 25 Nov 2025 15:21:32 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        vkoul@kernel.org, lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 6/7] ASoC: SDCA: Device boot into the system suspend process
Date: Tue, 25 Nov 2025 15:21:27 +0000
Message-ID: <20251125152128.274808-7-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251125152128.274808-1-ckeepax@opensource.cirrus.com>
References: <20251125152128.274808-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE3:EE_|SA3PR19MB9526:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b92db42a-704f-4e4c-d7f6-08de2c3652d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|61400799027|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RkWyCKIRBRy/hUmmqDL7ubNFVS08F6841vWWDKXeM1Hh40uXklidCD0nwWvF?=
 =?us-ascii?Q?NatF+2+e0mopsolTgeI8jkRg1m+CbtI3cUs/UIfE9y8MBHzup+w1O7i2FmaR?=
 =?us-ascii?Q?ruc7fHxMZFlE4D9X0dS7P4muZCf6NYZLlkwlog1DpUeERbW7+vIGTsym4ShH?=
 =?us-ascii?Q?P9z4K4WEx5klu5xS99ZrdgfajH/8K0sbx2+Mh3kpQdcRIJQrdAs+dxL4ENJb?=
 =?us-ascii?Q?HqZj5DCQHVxZehD7t75oeWnLDS0QudOC1W/sbSSK0QRf5JVhv9uYFRT2W7hN?=
 =?us-ascii?Q?FjpDc/UFqQCK1262QfLveqB0czlu8TnPs9Tz6VOStYi0GVarQclFoVVv79oI?=
 =?us-ascii?Q?06ooIJcdMY8FZDV2185QmYfAgd2F6Dpf3VUXLG8ZKEhLPRw1KVM20tkhCiS4?=
 =?us-ascii?Q?aEnGkOvkNE5p9oLbOG7SI0vXV/SuKjZV2FQh6yfV6JPsorG1yQ+NDKR/N8Q1?=
 =?us-ascii?Q?/vtvMWoF/Igk/vYcdQqcSvFmpUNvBttrRClwHnS8H1MovwGiigKekOcodVVo?=
 =?us-ascii?Q?h0cA2WMffwTISVBf8uhnwkk3YU8o4aEp5YkuAVI9yeuu06adA0ep1dhRrvjF?=
 =?us-ascii?Q?ym06FsxvbX8M5lK+j2FYaw73qZMKsaUU5Bc6ofJX4kwOfgLkUdJih3w0Jt5k?=
 =?us-ascii?Q?zSCp74iry6IjWlNdEH2sm0pntt6wI1U6vN2kFdX65KDhsHAPm/ZpKd3lIcbl?=
 =?us-ascii?Q?TH//6WaoI1dRUdQtuoU5U3V1MH8tSVhgdB/Va60f68kqxNbFolCj1xeQ5imf?=
 =?us-ascii?Q?eHt0Sr+uEf9oeAa93vDhzyN5fC0QLu96592sFf13+smE+DRNFPUt3kGWzktV?=
 =?us-ascii?Q?Z5aW50OqvGV/glvwPWP8HFWz/d/SYlyAVAdCPw+q10ry4E5ddaqtBitKA9As?=
 =?us-ascii?Q?xz6542WVJnUMwrAFGTx5jmsbm810LZoMBxk11AUSn+XcJz4sGPLmv0+NPPUd?=
 =?us-ascii?Q?e97l/Y69VdoVePZdiXz7XQhLISQqe4Cdn86bch45bvIuWya6rFaqJB3vSYrV?=
 =?us-ascii?Q?PGycsPTiyKtAFDM+/7CB6quEOVyGBxSbluCg23+hyWiqiAENafP+9X/E8H2a?=
 =?us-ascii?Q?ORsqBlTfwToUEx0PUJv7rdzxTFPd2aaU0WxoINPj7Cq2V94JRSx1j7Yf/cQb?=
 =?us-ascii?Q?/RlGd2Ryob3p2eE83kaQkusRW+RcJXaQJNTyNCEeaWNJ/aPjPkSwlF4ZNtPf?=
 =?us-ascii?Q?7SpDN4Xytiol+CAPCyEP/uTgi3hV17oqA4mH5jKojPMatNirhzFJ3FPPUz/T?=
 =?us-ascii?Q?/9jfNnIxMkqwgDFYRdN0k4TE6t0u7chrIoiE2z6Qizno8MJIrw/uhLY3bGsP?=
 =?us-ascii?Q?/KzgH9QhTSVuAOg1wrTn5M1N54a1D+ZPO/fosD3Okl/SPKiug3QsaAS7Dqu2?=
 =?us-ascii?Q?4N8M7iqLUz3WejnYyn6aro3xwA1LcJb6sd7FENEocqjAIPBKR+Gf4kLLdYM+?=
 =?us-ascii?Q?IXLfBGhbh38LUsmWIoTWWQbDhVF4MZyENAFNuMgdY/Xr5f8rLUxH42CLl+3Y?=
 =?us-ascii?Q?dHzijRiY+Vx+iEL6Q2AiSGWhtIuHm+miE/t7gn80/c/u42d8Lz5ZRtM90Fyy?=
 =?us-ascii?Q?BFrFkMSoZn0H3w+j1zo=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(61400799027)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 15:21:35.9479
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b92db42a-704f-4e4c-d7f6-08de2c3652d5
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00001CE3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR19MB9526
X-Authority-Analysis: v=2.4 cv=caHfb3DM c=1 sm=1 tr=0 ts=6925c984 cx=c_pps
 a=ojCuy1h7BbwMffJHuf2NLA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=HaEzm0aP01T4c4w9AGMA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDEyNyBTYWx0ZWRfXzkyUl78gtbD+
 KlXdtqDUK3pH55YHQwyP5aX2aTbrXhCzPvBM+7DFJg8NmKMQKJm3sZd9P+Ic+dR4EWgIO0icXy3
 hICp6MZac0DXKgtoRt4Yy6WR4KdnowKxn8jfZ5Q80+u8Vca5z+Gfx3QeyWbhRc7aQhV95ptSEMB
 5O23GvyG+YYu2xxtXmIXzHd3Zmmh/KBZViVogkFvAEibgvxgcn/nHiPzsEOdPeDpMgY6CqQaReD
 PcT9TwB6SzA6YgWLqV00++LhfMDs920ztUA1mUA1tXK15lua8MbYruFAlhgvTjreZJVk54g7S7C
 3lbRAijSn84aJq97aMG7N60DX+6SNO9JVWM0lpu3kGgku1QOFiYfysBE+V3Ls3BIZj8X4O9TBD3
 6kaZAqeFoC35KZXOG81v9ewZBLQm8w==
X-Proofpoint-GUID: 6Mh0u2lIpUhrQTe5fOssxPmi7Ypy_LeX
X-Proofpoint-ORIG-GUID: 6Mh0u2lIpUhrQTe5fOssxPmi7Ypy_LeX
X-Proofpoint-Spam-Reason: safe

When system suspending the device may be powered off, this means all
state will be lost and the firmware may need to be re-downloaded. Add
the necessary calls to bring the device back up. This also requires that
that the FDL (firmware download) IRQ handler is modified to allow it to
run before runtime PM has been fully restored.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdca/sdca_class_function.c | 71 ++++++++++++++++++++--------
 sound/soc/sdca/sdca_interrupts.c     | 17 +++++--
 2 files changed, 62 insertions(+), 26 deletions(-)

diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
index dccd0e531cefb..aed325087c1dd 100644
--- a/sound/soc/sdca/sdca_class_function.c
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -211,21 +211,12 @@ static const struct snd_soc_component_driver class_function_component_drv = {
 	.endianness		= 1,
 };
 
-static int class_function_boot(struct class_function_drv *drv)
+static int class_function_init_device(struct class_function_drv *drv,
+				      unsigned int status)
 {
-	unsigned int reg = SDW_SDCA_CTL(drv->function->desc->adr,
-					SDCA_ENTITY_TYPE_ENTITY_0,
-					SDCA_CTL_ENTITY_0_FUNCTION_STATUS, 0);
-	unsigned int val;
 	int ret;
 
-	ret = regmap_read(drv->regmap, reg, &val);
-	if (ret < 0) {
-		dev_err(drv->dev, "failed to read function status: %d\n", ret);
-		return ret;
-	}
-
-	if (!(val & SDCA_CTL_ENTITY_0_FUNCTION_HAS_BEEN_RESET)) {
+	if (!(status & SDCA_CTL_ENTITY_0_FUNCTION_HAS_BEEN_RESET)) {
 		dev_dbg(drv->dev, "reset function device\n");
 
 		ret = sdca_reset_function(drv->dev, drv->function, drv->regmap);
@@ -233,24 +224,36 @@ static int class_function_boot(struct class_function_drv *drv)
 			return ret;
 	}
 
-	if (val & SDCA_CTL_ENTITY_0_FUNCTION_NEEDS_INITIALIZATION) {
+	if (status & SDCA_CTL_ENTITY_0_FUNCTION_NEEDS_INITIALIZATION) {
 		dev_dbg(drv->dev, "write initialisation\n");
 
 		ret = sdca_regmap_write_init(drv->dev, drv->core->dev_regmap,
 					     drv->function);
 		if (ret)
 			return ret;
+	}
 
-		ret = regmap_write(drv->regmap, reg,
-				   SDCA_CTL_ENTITY_0_FUNCTION_NEEDS_INITIALIZATION);
-		if (ret < 0) {
-			dev_err(drv->dev,
-				"failed to clear function init status: %d\n",
-				ret);
-			return ret;
-		}
+	return 0;
+}
+
+static int class_function_boot(struct class_function_drv *drv)
+{
+	unsigned int reg = SDW_SDCA_CTL(drv->function->desc->adr,
+					SDCA_ENTITY_TYPE_ENTITY_0,
+					SDCA_CTL_ENTITY_0_FUNCTION_STATUS, 0);
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(drv->regmap, reg, &val);
+	if (ret < 0) {
+		dev_err(drv->dev, "failed to read function status: %d\n", ret);
+		return ret;
 	}
 
+	ret = class_function_init_device(drv, val);
+	if (ret)
+		return ret;
+
 	/* Start FDL process */
 	ret = sdca_irq_populate_early(drv->dev, drv->regmap, drv->function,
 				      drv->core->irq_info);
@@ -419,9 +422,35 @@ static int class_function_runtime_resume(struct device *dev)
 	regcache_cache_only(drv->regmap, false);
 
 	if (drv->suspended) {
+		unsigned int reg = SDW_SDCA_CTL(drv->function->desc->adr,
+						SDCA_ENTITY_TYPE_ENTITY_0,
+						SDCA_CTL_ENTITY_0_FUNCTION_STATUS, 0);
+		unsigned int val;
+
+		ret = regmap_read(drv->regmap, reg, &val);
+		if (ret < 0) {
+			dev_err(drv->dev, "failed to read function status: %d\n", ret);
+			goto err;
+		}
+
+		ret = class_function_init_device(drv, val);
+		if (ret)
+			goto err;
+
 		sdca_irq_enable(drv->function, drv->core->irq_info, true);
+
+		ret = sdca_fdl_sync(drv->dev, drv->function, drv->core->irq_info);
+		if (ret)
+			goto err;
+
 		sdca_irq_enable(drv->function, drv->core->irq_info, false);
 
+		ret = regmap_write(drv->regmap, reg, 0xFF);
+		if (ret < 0) {
+			dev_err(drv->dev, "failed to clear function status: %d\n", ret);
+			goto err;
+		}
+
 		drv->suspended = false;
 	}
 
diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index 34bcd18072768..05b4e999c72a4 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -205,10 +205,16 @@ static irqreturn_t fdl_owner_handler(int irq, void *data)
 	irqreturn_t irqret = IRQ_NONE;
 	int ret;
 
-	ret = pm_runtime_get_sync(dev);
-	if (ret < 0) {
-		dev_err(dev, "failed to resume for fdl: %d\n", ret);
-		goto error;
+	/*
+	 * FDL has to run from the system resume handler, at which point
+	 * pm_runtime isn't yet active.
+	 */
+	if (pm_runtime_active(dev)) {
+		ret = pm_runtime_get_sync(dev);
+		if (ret < 0) {
+			dev_err(dev, "failed to resume for fdl: %d\n", ret);
+			goto error;
+		}
 	}
 
 	ret = sdca_fdl_process(interrupt);
@@ -217,7 +223,8 @@ static irqreturn_t fdl_owner_handler(int irq, void *data)
 
 	irqret = IRQ_HANDLED;
 error:
-	pm_runtime_put(dev);
+	if (pm_runtime_active(dev))
+		pm_runtime_put(dev);
 	return irqret;
 }
 
-- 
2.47.3

