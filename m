Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621153112DB
	for <linux-sound@vger.kernel.org>; Thu,  6 Nov 2025 11:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762429489; cv=fail; b=QKcPbyYR0EnnI5eq/qK5FG908zmsM0hkAnU+703oV5BLutnk/HIu07Kr/iZVvRmQOuzP4Hcnk15LtH5O+xNRNLPMLCqWqrN9wsSLDXPWILH7QpWoAt5XBH9+x5V+l8nPLgzHqThTDrDQsh8rzIMcMZtU9c9/yTAOc96Me9l4Huo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762429489; c=relaxed/simple;
	bh=h63hAPhfGSsxGs62+6kadVEzJOBmcgWEs2l86G9rFUw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nToYn8wpsjkkkYTDO66lvx6fzy631DlQNF5uPlB13BiCYQbag9D3LFHuam/HsqGe0FeSd+aspKi6CrvrSamFgxxocZJia9ovpQd2PyLMbIk/2GKjUbvoyqcSZSL/iWESfeBMg0jEFKiQcR8wwksbUctKc17a9ZU2G5DsZbKI3yg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Tke4j4Uf; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Dl6tcYza; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Tke4j4Uf";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Dl6tcYza"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A61vDGw1122962;
	Thu, 6 Nov 2025 05:44:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=qIkaGn0g8EApLUjSdCeKfW+M12seq9Z03NpsROdaBkk=; b=
	Tke4j4UfReedN8V8ktGXZtKEJAHGIf4oVB4n1SHUf2bgeCnnVGnJ+lOY1o1Z+5tT
	L74QoB7iBhaIcsClxHS2wHuijyIeML47cPTK2z/BP8uzq+FWLOyDFQd8MY38+XTi
	Cs9IzHFiXlsf6JwX3tivRI54deLWZrm7Qvp0X6WJLX1G3EiQsfHJo/NSdQTS8CbO
	l8sUMmY/fs3jU31B1vN3kOyitpDm7oVMLZTKU/aMQSQn4W249wMCaRoCYoEMWeV2
	sUomXE7pOoY/+9x6R3vUFsZ6wneFejgYnMk9A/KdKE/Gzf0nToID2lI+EFP50shI
	nfzb/VNh/krlp+uFZwqS8w==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022073.outbound.protection.outlook.com [40.107.209.73])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4a783wun4m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 06 Nov 2025 05:44:34 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m5YO7XIEU8oXzv+V5gxMRisOHpw8jAz6v2t+St9kQzWr4ZF5UERNt0oV82zEfazSZDUqy8/AP28v8+x2w0TL7vUpHM+LnK7Je7cepHNF2OjQRdyMiaLI+3BR4a6glYTJzZMgwp8u0JJCWDFVfq9pwicxv82SktwiGiaI82d/lRtjGzG1h1Bp07ftRLPo/6KUGIuMd0KfTa56w3i9e0MUtoU+XkDNUnWT3FNWg9z/3Za3zQ0mbhM7YKVhuNyaat5lImVwYNRFoumUhN2fa0WvNOHONcPHVpjFYgBeJK30UepRKLURZF/a3KraiHGi6kxSfNqY5zJkH5QW4g444aRm+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qIkaGn0g8EApLUjSdCeKfW+M12seq9Z03NpsROdaBkk=;
 b=NCNgS2VZ99crwnvrB4SJ2pT4lLTEt+l4f6dHggMCbQ+HULjKA2vfjtL9eNXxlkdRrWh7mDAEjPvpE/pr8PN8vZVknaouQVW1rryI2PLYaKu99Md+9dHYFy91IYk2VEIv+BVqvEVQl9t4jnRSgkcbEdLRvWOx5shY+3Jxy2SeN3jb1tMGBR66BjNEmruUtpPmehg7mwI2IzaoxixJaceM6OKva8YHvliT5DRvtbu8dauwzflTRFAxAWnjV2kpXWUNDRO7mBOp31vxJJhlAiZIYMr2/7KHYvuhAYoHmSrsHT+jyxeXnDsZ3qcLBALdlL1DNCurR5fhLVALz+cmSp1yWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qIkaGn0g8EApLUjSdCeKfW+M12seq9Z03NpsROdaBkk=;
 b=Dl6tcYzapbNUlWFu8ppoV+s/Xzvp0i1WBkRIYgCBz+jxvAncxtRKSlv1biTkAHypE1JVP+MFlzl80INuAqdzuj766xeDlnhwZkocgX5IxRGjFDYiMjdDUmjvN566G6X7+NzMPRswSMVbUUhTF1WF4o/5fyf01F1q92zaXk42k6k=
Received: from CH2PR04CA0021.namprd04.prod.outlook.com (2603:10b6:610:52::31)
 by PH3PPF33B4D401A.namprd19.prod.outlook.com (2603:10b6:518:1::c11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.9; Thu, 6 Nov
 2025 11:44:28 +0000
Received: from CH3PEPF0000000F.namprd04.prod.outlook.com
 (2603:10b6:610:52:cafe::fe) by CH2PR04CA0021.outlook.office365.com
 (2603:10b6:610:52::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.12 via Frontend Transport; Thu,
 6 Nov 2025 11:44:23 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH3PEPF0000000F.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.6
 via Frontend Transport; Thu, 6 Nov 2025 11:44:27 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id EAB8B406550;
	Thu,  6 Nov 2025 11:44:25 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B70AC82026C;
	Thu,  6 Nov 2025 11:44:25 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 03/13] ASoC: SDCA: Add missing forward declaration in header
Date: Thu,  6 Nov 2025 11:44:12 +0000
Message-ID: <20251106114422.906370-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251106114422.906370-1-ckeepax@opensource.cirrus.com>
References: <20251106114422.906370-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000F:EE_|PH3PPF33B4D401A:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: aba5eaea-565e-4253-1ed6-08de1d29d73f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pGpnTXw1XwrYOLqfdPfAG36mwsrvMoCPSk9vHEwDfrnhfj9J/loLSXkc1lvE?=
 =?us-ascii?Q?dRhXMEGcW/qhJ6Raojp7169aXoiUNHhjAc2qddG7YOr0AB+IbcR9ZgJGj+nz?=
 =?us-ascii?Q?SpeJfeoSex6mYx3/QD6Uv10N2dYxaCjdhrQDvw/CcuQvtvB9TGN4c8yWkZBy?=
 =?us-ascii?Q?00id7J0spludRSNlE3FOa/1lKGb01VlRBi0ug4caJBZ+m5G6oak8rgPVxP4J?=
 =?us-ascii?Q?1e2xzgvVCq+atpJfU0lBP9v1v8MDTyHNelDMD2qdFEJRBTH8vDfQDt0Mvocy?=
 =?us-ascii?Q?WZPMbq6q9O7EbofIWjLRrqXYI6rDcsKo2vVc6+xhmIkrbvsgGjMdMRNq+86U?=
 =?us-ascii?Q?SWLaoaIofjNKT9Iu4gVy0qbgAjmfxON370K4VVcTJJY9n5yJSmsZsUVqaQ34?=
 =?us-ascii?Q?hP+glSplGG2Fn0eAFWW3c9hAgQCn3OhBbEICAuRlcn4oh4a7/fqNAdXztwTD?=
 =?us-ascii?Q?mKIo1LWsYt7YfTJKRmUN+7i+iJVVvClJxiUm/PwV+cjYbokPjNz+05zyks5q?=
 =?us-ascii?Q?Dgxsv/WzlL4c+VOFmdbk/nHamAEsBKOvy0Tg7CQ/CgHCkpwVIVewjfB8o7gl?=
 =?us-ascii?Q?k16SKqECUG84uVUKXyD5BVurLIIDQk6Cvhs77qdnYmNGQI9NhGvlrbp1BdNK?=
 =?us-ascii?Q?GLxuc2tgmzSmzrrejTVgAAkj7TFR6Y767c6zTtiLNTE0Bo3G56JhqvdxDjHV?=
 =?us-ascii?Q?lqYd5joEmYBiLQRbgEAAj2gH2RJKbfc5NYS+f0TCGiGbEKp/vARIVQvifwVL?=
 =?us-ascii?Q?XIOyCQ8wMAvBVvWkTmEEj/8DnXAuDyXJ53uvTd53VsXdIY9A1xTjzWUZJv7v?=
 =?us-ascii?Q?05hwAWuSimCGDHxsDK3MCDCN5bFqLtRFBO8aG2W4JUA/QYVezlP4dXzAwHaI?=
 =?us-ascii?Q?kM3slBAZFKwY9L34LUgig76T5UG0eVxmpNBmqqnL1VaP1zIpyt5tO36AbIkA?=
 =?us-ascii?Q?B2d1Cc3JFPsn4WPIkgYj+9J5zfZoawtOwa52M9MvO/GB1UEeLzI2camBQkiN?=
 =?us-ascii?Q?zvD12TSOP/5aUpeOvdG5eJ2YRd+eHBV2QwbANP0t+GCNQtdowQNxhSAQd4SG?=
 =?us-ascii?Q?iBXcce+GkqjMpXoxZJXFVieoLmDYzynpscRYlsSw03etU6ZijUm2g1Aer7qw?=
 =?us-ascii?Q?Au8FMFDW1QpZClYBJ2yq37LlOm40PhWZdKQETct9Re6rCPrQ6i+ErRBR+B4L?=
 =?us-ascii?Q?Decoa9Q1J2hBrbbYmu8AxeOZt1Ucv7z42UnMo/qAwdZSmlgW9BxlT/gQndRq?=
 =?us-ascii?Q?BM+xL+BBELUckDgKKcvW8B8NTCohaDtiEx4TvGd1MCyibKiUn+q+VNKumzdy?=
 =?us-ascii?Q?ZXX0OEDX3ToRmJmqrtqWzi8i5e29PuLCeIWtBwt2wACyJ7q8vHoXYSSPh5/j?=
 =?us-ascii?Q?34OR18AjfRs7Np0GdxhpSZEAJCc41KUNbsUzer7/czMTtve4BDIZ0FjYbq1U?=
 =?us-ascii?Q?d84xxBajkjeN6rJAN6tQnRGhhlwVsk614pYyuWyPXIKLVDxjkIo2YVM+PARk?=
 =?us-ascii?Q?VNIP9Va6vWnKwXsDtPBUUbrlTeYexXLIVF1/Zw62A7gfOLDjUiX+KclSNUja?=
 =?us-ascii?Q?AOJizWRhpmuZbjPp0eM=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 11:44:27.2813
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aba5eaea-565e-4253-1ed6-08de1d29d73f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH3PEPF0000000F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF33B4D401A
X-Proofpoint-GUID: B1pD01dJs3x-2WgSCpaL_8D6nPZ_w20q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDA5MiBTYWx0ZWRfX4jQgohV87MYR
 SBQPS20KQ1f1Ts4MufiHDTtAsUPZ6SAq2Xi+niXeXDS0howLqFcMa/Ij1b7wgoZFkz8sKSZfdWv
 0oTZx1zsGmGFwKCplkjaOGoTPIAK1PMbh1K/wEnSSj0d/cWv8jfaYYtnIJeOgrfbq3AWR2b1GwU
 TBr8wjMOhfRGesDi9hXyp32+nrOBo6jO1Vukv8SIdDfu/OFbu9Izrw98qlwSiqc91MeXSMPnMMB
 RILbNM2AHVEMJUSQJentXIfBn+mMaE18/QEgzpS5jYyKhlE+0lArlYWEstlGB8rCVclsHFKT0AH
 XREktt+zeg7RMAE161njvT5S18CGPVQWyKxDYc64bV/vPIHqsdd8fa+iIOvXmR4KJQhtEXTA8yP
 Z18yqB8tgjbq9HdnEj4YcSgN2WsyIQ==
X-Proofpoint-ORIG-GUID: B1pD01dJs3x-2WgSCpaL_8D6nPZ_w20q
X-Authority-Analysis: v=2.4 cv=b9G/I9Gx c=1 sm=1 tr=0 ts=690c8a22 cx=c_pps
 a=nTv9GYKPVLLC6uM4GBPpxQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=xw1g2quPM-hktvGfwDkA:9
 a=zZCYzV9kfG8A:10 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Reason: safe

The structure sdca_function_desc contains a fwnode_handle which is
undefined if the user doesn't pull in an appropriate header. Add a
forward declaration to avoid this.

Fixes: 996bf834d0b6 ("ASoC: SDCA: Add code to parse Function information")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v2.

 include/sound/sdca.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/sound/sdca.h b/include/sound/sdca.h
index d38cdbfeb35f5..d58d602212771 100644
--- a/include/sound/sdca.h
+++ b/include/sound/sdca.h
@@ -13,6 +13,7 @@
 #include <linux/kconfig.h>
 
 struct acpi_table_swft;
+struct fwnode_handle;
 struct sdw_slave;
 
 #define SDCA_MAX_FUNCTION_COUNT 8
-- 
2.47.3

