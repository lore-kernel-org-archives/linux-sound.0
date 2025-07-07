Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80091F9F51
	for <linux-sound@vger.kernel.org>; Mon,  7 Jul 2025 12:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751892155; cv=fail; b=uTRyTE9QkIs2Fj+39GCbrZPvspPP+389Oj389ZKV5PSqNF/Ov2DddPwD56PSOMYH+DWm+3hpJ6mguwuP9blDmbDx4KZX8BomW+Rq+7URT8YagGOvgjnP05if0N1KamD7ytIKhbo7xueE7yKOpO4XWqRw7gcVBWDXRw/S3UM7qE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751892155; c=relaxed/simple;
	bh=euOnXC7MMM0YN0bvLnHosVAHnMhlWf5fOa/iMopEEBQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KxRZ5oJuViTlcmr8h0Ba0TwCYMtQOsgVIE622LclhQbb8YzSwyLoEC8Iqq7y/FgDJG8E5EB/puwBHhVJZkcZ6vzvH/HITHWQttl6dY1cwSJAB+wyRwxVmrnnIcpu+3CE49qyFct7UMTwXj8qOTiTI0AD7ujOjXgbo1SPn10ttUY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Fw1u6vcl; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=VP+fuR1B; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Fw1u6vcl";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="VP+fuR1B"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 567BMKtn029949;
	Mon, 7 Jul 2025 07:42:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=/hJHFU41GYeVP9QYI9YJwgv30RV3/isF/1aXvMmo7lg=; b=
	Fw1u6vclC7GfCWS3XGhU8120gGoPM6P4Vm3mS3WpBRTSeNJ9gAjILXi5wP3tCZcR
	fmtZ/gB14eedCOSll4AAGujrEXFLwFmfzyFUm918D9FAEw5O6w5XZVe7wtRT0YSV
	KSJxcViUvl9Wra53Iihk3CFQU9JKlC9PdtCrKhKjJaN5ngM70R1inUQmZ0j8AACZ
	QI8nT7fOdn6rHTiqHefFzB4ysIDTSOaOoDuQsUbEhTYpMkxVSUmyjLo/d2XcYHZJ
	JdzPjVqicf2UHxokZL/1FAAfGmlga/AmglD7ZqunHlQCFonq6ps3g7f7bIs0k0v3
	CoItJB8hfmJlswFnv+F2HQ==
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02on2137.outbound.protection.outlook.com [40.107.212.137])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 47r0pjrrx3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Jul 2025 07:42:06 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vZrFSLmiwJKWD395ZpDTTO1In6Bkn/eqcVdk6x2f2fX5HyyzOJa7qDI56+hdd27kEKVxQg7B3Lds4OuIhVl+R7CTo01oeJNVcoYxJ9jdxhnttRA7VFLS0luMRV4k8PmyuzOjeGLum+GFbejfbg2Cz0hFsGbwV9SSiKHmgd476qx9Dm3guh8Rf6soa4oE2ieXQrL/cNGqD9j4PSSu5ZCGOFWM90GAcKcLECdve4aguzxHlQmr0eDyVVEooNK3obUYKCZIyi1mTlCb6zBOasKYr6vUvYAL168k1Qr9cniy7UAOHMAwzQBu0bGfRKzLB/uo74XomHWJOGti94nlwB06mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/hJHFU41GYeVP9QYI9YJwgv30RV3/isF/1aXvMmo7lg=;
 b=kpf5FUxdGdElSKbVe70pvhAMWpZK0zidLXY4QGdleen4N0W136GgHz644WUtecOW8JadRdVsR4qB9u/RAQ0AI8hnRNdTG94smNzmEonqT0+zo8X4P2LXV2ORVu22JMVM00O6nfdLyYTFSdDoxWVUulgQ9byTvFQJCiY1c8iVYSO2Ot0TyhwrNOzFL8ayFdOMtRNi6mg6RV/dmnU9/1Ybqc5OgFdVl0/ia8ylWGQGlfW/++C7ivY6NOTChgsuh6qmDB3BYsWUcnJK/ZFXO1lPpk6URv2Yf6yNkH0xn1zlvsRoxpk0G30Q4dZHwXHTpWoNbGG7GLAhF22VtVz+js066g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/hJHFU41GYeVP9QYI9YJwgv30RV3/isF/1aXvMmo7lg=;
 b=VP+fuR1BBE6pmYE4SsibvKZQT95T0NmyyK5qp/JqSyNRol2TqzZYwa12upEGFtncr5gL9HwyRP+EtpMT9juQTL8L428xDyTbZt6L6tCodB5uEiu8WGYqT9+kf6B8eayAhXlyPnBL7wMyBIGXVlCEfkQP0uKr17MavHAsRu0mOmE=
Received: from MN2PR15CA0044.namprd15.prod.outlook.com (2603:10b6:208:237::13)
 by SJ0PR19MB5384.namprd19.prod.outlook.com (2603:10b6:a03:3d7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Mon, 7 Jul
 2025 12:42:02 +0000
Received: from BN3PEPF0000B373.namprd21.prod.outlook.com
 (2603:10b6:208:237:cafe::e9) by MN2PR15CA0044.outlook.office365.com
 (2603:10b6:208:237::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.27 via Frontend Transport; Mon,
 7 Jul 2025 12:42:01 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B373.mail.protection.outlook.com (10.167.243.170) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.1
 via Frontend Transport; Mon, 7 Jul 2025 12:42:00 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A24F540654B;
	Mon,  7 Jul 2025 12:41:59 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 8941482024B;
	Mon,  7 Jul 2025 12:41:59 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org
Subject: [PATCH 4/7] ASoC: soc-dai: Add private data to snd_soc_dai
Date: Mon,  7 Jul 2025 13:41:52 +0100
Message-Id: <20250707124155.2596744-5-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250707124155.2596744-1-ckeepax@opensource.cirrus.com>
References: <20250707124155.2596744-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B373:EE_|SJ0PR19MB5384:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f2ac3c77-9340-4789-2f59-08ddbd53ab64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rGibCjRCHdqNZomqNftWNCUztHNQBXcwqLwpa77Ax9y44BYmAn86lH8+PaPG?=
 =?us-ascii?Q?PTW7Os1pjXxSEC3FDWhOcewcHycgd2vJ7sC3LD3qb6iK6aB3E7SJ9WNUgybg?=
 =?us-ascii?Q?EZmz2sZuDWtdQWtGNk7LednAc7i/+WRuWC8G5jwwgzfxMfynoduWxafqI4K2?=
 =?us-ascii?Q?oAWvSwb2qLYeABvb33KEH4KJyz202FqNeLZbg94esaQHM4AhHL6w8r29TIyO?=
 =?us-ascii?Q?qCEHtcqi8LrxIA7XMQm+Er1ZSf3xVr4JNypg0Ze6H6lzuEfMxeUdSWq2LYHl?=
 =?us-ascii?Q?m6wZ3h+//eW+L1xTrx2Dq4icAWVcLLdwbshnQXzWLxdz1cAFgg2AP0CRSz7w?=
 =?us-ascii?Q?nsWpTmPpOJQCsRVtgctVHVlXpPbXGY3by+xyG1zMUmCAhw/Ls/bfczBAuCgg?=
 =?us-ascii?Q?pBToKQ+kDR4sX7M4X58eSnwfMVrv1sqqy0s0ukV+VGMLGpAd1ZFU/R6rlWxv?=
 =?us-ascii?Q?wNc6r9OgfV1rYd372WzYL1kBKOkq6NWWSaTUhwpTBxVXU41x5GbFnvFg3wJB?=
 =?us-ascii?Q?gq2eFdsFHVlovzCRLwXayghY3hi1cbq47ClXmDtu8gjXyuz6ea3WlqfW1vpk?=
 =?us-ascii?Q?alqhQSfKfUFNKcAGiuMUd1SgJiTn43OiqybR5GFpShdsqdFzoPBu4eL5OtJA?=
 =?us-ascii?Q?0y0YyEFjUj5Ypt4Git+pyLRraXaYfFWJhxfATpcRFPHd40l+MYkY7NZooiEL?=
 =?us-ascii?Q?HNrNf19tYFRelAcftpiU0Pr7PVzcze1l3DOP8pridIFvK5ZH9fmr6YZQRE+h?=
 =?us-ascii?Q?6m1RYdDyPmzmD4oDLDUEpwnZaDg2s5bUrpqDK4nNvQaT3vxBh9rXdu+9lyc7?=
 =?us-ascii?Q?RBO/7bROotX55AuRz6RdGbdZ//PoiibSiTtq0GsClrXawOrI04Bzcoca7yZE?=
 =?us-ascii?Q?G2dxFdjMDPEmPq+8M58NSHlj1LQII4n3zYW0KkJ3YVP6ozqKdSMx6ko1oyhh?=
 =?us-ascii?Q?mDGWfH36jcujEpJodHZYCWw3FlUoQ5MgEBdW3TeNJ5LUVTwpgD0Oj7k8Nc3I?=
 =?us-ascii?Q?6+BxK5FFF8MCfp4G5PWjidZmiAUucI12GZvYl9JVrmcYx1rNCAXaJn1beYBC?=
 =?us-ascii?Q?FxJPqE10KQaCn/4rTtnIylDGV9MnxNs7H5Q0b/4Dcq5tmcmSoypCoNLHkqbI?=
 =?us-ascii?Q?jY+fER638u75Y5Wett5X7UvoIpvZ+ugIKD4nOvrHFZA8ZTHPSu9ebUt7ET89?=
 =?us-ascii?Q?ARGmK4jgDY/D54nTNOMgecEadb9AZyqMsZoaD38yt99psl4LDOBW9g6BG3pu?=
 =?us-ascii?Q?Ru+WLSbiTD24Z0PT11t9bOFW/DR9g7r5O9bPYhw0bD3akYGUOBKyBvxgTYhw?=
 =?us-ascii?Q?IE5umTVIOtDnz3uqsdtZba8H0d4hpzJH+gPDGZQy7s/Vsoc9flR3eYMuBRV7?=
 =?us-ascii?Q?rAlo44F8QnbKpurdwy1DKl4EOnynDGGmHXKzvW8OFLqsl45MGXtembXzctOq?=
 =?us-ascii?Q?pq414D2B6YImvgBhGtcFC0kf8xe1ZSnbMBnIU++g9X7vryimE34JM5NMvIxf?=
 =?us-ascii?Q?jEw73msjJLrRG7lhYRb+RMg9jAA6LuFSNEIw?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(36860700013)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 12:42:00.9734
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2ac3c77-9340-4789-2f59-08ddbd53ab64
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B373.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB5384
X-Proofpoint-ORIG-GUID: EPoTHG7dL7oWUDG1x_OeLnBAdCk2ehqx
X-Authority-Analysis: v=2.4 cv=dtDbC0g4 c=1 sm=1 tr=0 ts=686bc09e cx=c_pps a=5nwQQ/GGsU//opIcnTdfyQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=Wb1JkmetP80A:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=BbBaQpACbrQgpGSE2J0A:9 a=0lgtpPvCYYIA:10
X-Proofpoint-GUID: EPoTHG7dL7oWUDG1x_OeLnBAdCk2ehqx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA3NCBTYWx0ZWRfXxqVzTPJwWGew LrJ3Jhs/UJaXRwqS/q0GXOtEfh0WWrydIDQwolyylLNbfk7qYiA/XZm0YaSG1drWxlkBYNTzFZP FsL7VPd87Nw0ZS8TyN5s9H1xUKDsOiy1t1u92Cz6/Q+Gqz1NXy0rH7WTHPEnHi9EhaavNLPEOJ9
 BlJLOGiazEo26qLFZrgKb/gw9dZT48ch6KiDatShxRFHuwYLbHR+blPsLLiRqPJt4cz6k3+2Vgm IJdgDe3s+p9Fu/grBWAZk+sWnLDYZFGNRCfRI5cGGKFd3fTSbYsyvHpmPnBrgpZOtRzcYuv7MFW iO0EeBlhg1xlPyPX/vQXD+4jhiqhq3Yu4OGDvEjCrN/lfHA56lideorFd9QPN+kIDAe071yP+TO
 BpdPkT/9/iTH/fszKhWszUePc31m9vqfmjPoLSibMW+o8Wly49FKvXG/3/f+bskSLESwDsnK
X-Proofpoint-Spam-Reason: safe

Add a private data pointer that can be used to store context along
with the DAI. This will be useful to allow the SDCA class library to
store data separately from the CODEC driver itself.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/soc-dai.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index d19ab5572d2b..166c29557e9d 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -463,6 +463,9 @@ struct snd_soc_dai {
 
 	/* bit field */
 	unsigned int probed:1;
+
+	/* DAI private data */
+	void *priv;
 };
 
 static inline const struct snd_soc_pcm_stream *
-- 
2.39.5

