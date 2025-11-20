Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E4333BBB1
	for <linux-sound@vger.kernel.org>; Thu, 20 Nov 2025 15:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763654265; cv=fail; b=kBFLYHS31up2CL+e5hwM5YQ3cI2jTRZmrhzkzoT4vbGAMtkvZxIfG0FFu12QGwjuX6HiDKnWvEp1fhtEywg87Zv22+kbIhd/CkZOkT3AAcAurupCxekEerjpSs+6PE6IPV7iYOhBbvJJttkNaLhBu28YVXLSuwkIGFY0UYT/GV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763654265; c=relaxed/simple;
	bh=/tMxfSzqRUt2XXECCxP3+3219dgOjQaFtyuQeFjK5UM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ir2ZZpnzPhauWpSAvJY3gCJzx2+jh2hAzT1QBOSKtzRRtSp1JSZRFGU79tU+QRJJHWhjLNou8+ExZVVi1AMjgZqnilNt6Dqa9hqtjE5UWsKOvXVconHhZI7VD6+55+CkmOnB/DYsttcpXvX9ndVT/8tRnSj01W9vHfLdIBi10U0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=dvV1blQr; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=WZVsgu+J; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="dvV1blQr";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="WZVsgu+J"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AKCnRtV1115800;
	Thu, 20 Nov 2025 09:57:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=hAu7frd5RDfwEUiO
	uzTZi98GCJAIgu8dg7NJLe8e850=; b=dvV1blQrDzDPQ/pjv41EE5RDE4SrX1Og
	DNqIG0ALJW+0+lnpM+K30t++h/8nJS8sOvi0nk2UOqU8d9L4u8kfwdc8oh2ooWpf
	O3kxRaXK+JEZmAEuWv4Hx8ObJi670Nywu2kusmeicO+v9koD4iMhHHW/HAQ6AGDn
	SZmye8zJ0BvegzWHO42sJDxdYn3mh+0v7JiLgM36emK4aBDGBmvpd5oCm4r7khU4
	19VWGE4VQJwUcDvamGdUz7dRr7ehHZTFRXZcrzEJWoADCarlP+OKV6EKNBo+wW5B
	MgHJOodSLXe3bzRh+wbRqSfy61bbpfBFIFtZcCICN1W/qncYNqj5Rg==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020132.outbound.protection.outlook.com [40.93.198.132])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4aeqt1eptf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 09:57:10 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dxvNbwy6u7gyMwNdN7rcivgaNCT3eVp+vMIuJzDpauWhIpbBWG0kqmGG+9mqBDoxpuHpEuYc/CQvtKoB2RvsVex4oqcYupICzmmAmr47ApYSC7uuQbvuOXz3CnJmDCB05tB4xsNQTUIPnIXS2Y+qUnyeN7dPT6zX1DWiWSmNnYqYnC03PPwMiyTPvX5lODjQBwpfJ/zeHpdRd9z4SNh7vBnyuKi7JRoBkVwBLOdJmCsJWUUPseZR4uJ7sdmQ6C5UJL/bnPHBM3A9/Lnl80Z53k59Ca2E2UnZJZrXRMXKwKNvJi0dzrVhcMmvU7Bm0kG59XlFBXibSWGKVkqlcqRwSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hAu7frd5RDfwEUiOuzTZi98GCJAIgu8dg7NJLe8e850=;
 b=SLziMFlKPzbBTSKXrHFCxXTRBiKbTdgoGN7xcwiHJSB0zYcZMu+jSh/a710h63eIYSaMF5epb1tsE+8akdCkEgWCOE/s1MSSSHCvgP07QPjQ1tnjNiAgGH9XD3ZGrQyNssFk5ByinCawrS1w6tRIGVR0JKrrjk75BdkbLLQ8sqOxV+iiklpQmWzc4ASjCYma1Avo5xEn2yQmV2yRdinW7CvwSKA1p9e17Dc1c0lTmgQoSYCOP6TOp0TgAfeS7LJFT5Rk7iRmfoZTTLAXZ4kPp6TlbglbnL4FP4v9bGUwybfjCHNrtUofe62iGgmldQnxT+joB/DvSXDucVDcOlQlLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hAu7frd5RDfwEUiOuzTZi98GCJAIgu8dg7NJLe8e850=;
 b=WZVsgu+JkaCpE4h7oLE4OJ+V3h80vNie0gSa0y74BYN4VYFUicYEYp0xWQg4v3pUjF7ScdwxY72LcRRJxo5Ab69s9Y+p1VqSNlCh9YOhTUc9gcr7uBDIKPEpBixzfXAJq+xH1Z/yjpjNtGjgJ2rH6DqQuRgWrnJ6eBW3+S/Pxcs=
Received: from CH0PR07CA0017.namprd07.prod.outlook.com (2603:10b6:610:32::22)
 by DS1PR19MB8607.namprd19.prod.outlook.com (2603:10b6:8:1e0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 15:57:04 +0000
Received: from CH3PEPF0000000E.namprd04.prod.outlook.com
 (2603:10b6:610:32:cafe::f1) by CH0PR07CA0017.outlook.office365.com
 (2603:10b6:610:32::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.11 via Frontend Transport; Thu,
 20 Nov 2025 15:56:57 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH3PEPF0000000E.mail.protection.outlook.com (10.167.244.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.9
 via Frontend Transport; Thu, 20 Nov 2025 15:57:01 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 00176406547;
	Thu, 20 Nov 2025 15:57:00 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id DC724820247;
	Thu, 20 Nov 2025 15:57:00 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: SDCA: Add stubs for FDL helper functions
Date: Thu, 20 Nov 2025 15:56:57 +0000
Message-ID: <20251120155657.2181751-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000E:EE_|DS1PR19MB8607:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8ab78dba-b66c-4f48-59d2-08de284d71e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|61400799027|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Xzft+2VElJMD4B3GmWfEa2/wpd5mlE+B/VAlQIC54QNVvQgynKJVtz+CBlpq?=
 =?us-ascii?Q?euvVnvAhdBH3oOFFPPh1nmnRTfjj11N7UnMBCWW6TBH+2FXQ6AGnrEBOeCQC?=
 =?us-ascii?Q?8Sb1Ra4kOPaifj/d+oQekYh/UeiTqQlEgvdKxnNZbxlYbLj6yQ6KMwcFH3jx?=
 =?us-ascii?Q?T5H0YXoEAdB26ldu8qErP63JWkYqdyQfssEbmqWmM4pAVmRVwVWXkWxAPOaB?=
 =?us-ascii?Q?D1GRZwLzvZaG9VXa+5L8UyZ6uHUP3Ni/YgVc0mpnGz6uxp1Tewy6u9dtmqVx?=
 =?us-ascii?Q?ZSXSBbBWqwbo+dMyApWi4yYymlf09rv4A4hamlMBhVRe0rY4OXhgYu6itMLD?=
 =?us-ascii?Q?Qoh7xg+4yA44YfX9pwhRfLE4cUgFJcNgsy11wdNv2iLcN1Rz28yRZDj+3iVB?=
 =?us-ascii?Q?dVOKXB5HrW1a6Aj4o7SSTZam0n8n9Na89uzqaBjv9xrzGJpFNuPjXuxdZB6D?=
 =?us-ascii?Q?6KTLLVd6gNImycGjwoR/jd934TKnt89TKpzDmgA1RjAK4PD//eJRrQnTkJPB?=
 =?us-ascii?Q?4HyVmwoliOHDCx5DOESpzLCfRQrTGJ0fUA46ZfdTa1Nj5T+Boapx7UboFoFF?=
 =?us-ascii?Q?O/BTbR9izgLF0I6rdlJtGS0g1jjxovl7nD1GChFLlBHQNAnxanvRCvLHBe9w?=
 =?us-ascii?Q?ysNiRCwe5hoh3dvdQXuJ9J78xIN1qjd0eVB7c9bnktyJITHtIUQoBF9EIa5Q?=
 =?us-ascii?Q?co2d/JpdWiAbryKPF9pKf6mfEH8njYzrki8TTUgpEOu1Q56b+nz8Wl44nHVp?=
 =?us-ascii?Q?X9j+QqlFb7gqhxW/5mKHGUbzAwEppfSpHWfjdaC1yDxi0t/acc+DP73OR28t?=
 =?us-ascii?Q?rN4doaz/jCT4rj510ZV3LqdGM3nxpfgZxUU86xvTzeZaRb24m/vfBWauxVr5?=
 =?us-ascii?Q?oLaFOfG+AYmSAeCYntmhx0cN+Gh95cKNCpFKMMrxXAiMy6+RHoWcSY0wnOuK?=
 =?us-ascii?Q?eJVGPQFzhsi8Ly2sbtuzKMwdqr8pk7Pbv6TWqQr+RGRfIO/42Ecagt0x/Lbn?=
 =?us-ascii?Q?kPuP9mM3ZMEONkdoK15zdInja+h76R9CjELDsmP8NjroMB/M9SuAfCqscL3q?=
 =?us-ascii?Q?aXnTa6LpIk3Eqk522cXPA/yN5v65AESd5YKX1tbCs3yb/L5gLyt28gAg1lI4?=
 =?us-ascii?Q?H6HvR/+Hx+UtwmwjSyrN47Ek3ZfXGxyKmfaSx37lHixbwFmfZefZAXs4TUYw?=
 =?us-ascii?Q?4NlaMVXOXWaX5RUNMtItwDq8nSRN8H3t6SIZFx1wjlDnIFFynw+LIsw0taU/?=
 =?us-ascii?Q?fu+WQBP/I7YYemLEMTYAk9PTH8a7gCPvgK4UIp/XRL7dEyyWts9XyZoT64pj?=
 =?us-ascii?Q?VUeOS4ijP+9sfk1IiWR43s6hqIm2YTMtRRaIs5YEtcPG+Ec8jKGRQagf15ur?=
 =?us-ascii?Q?aqdHJeSBNbKPSxVFu9+IT8t/jJwgr+vH30UYUB9Od/qWmJAiKHF7T18rpFZ3?=
 =?us-ascii?Q?Xx0lXkJ7dmYJtCSQYeLSfcuJwE4dbGrGPMcTryomuydikfhZ45l9m1eHKpob?=
 =?us-ascii?Q?G8nXIecuK6YXcFEabTB8OrKDooOKsZ7ifDKUrGq64izR+03VwAlHDXISDG87?=
 =?us-ascii?Q?rOoJdA/TW8wkhCzmBro=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(61400799027)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 15:57:01.9411
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ab78dba-b66c-4f48-59d2-08de284d71e9
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH3PEPF0000000E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS1PR19MB8607
X-Authority-Analysis: v=2.4 cv=OOEqHCaB c=1 sm=1 tr=0 ts=691f3a56 cx=c_pps
 a=APpQm0mLgNUAkX6qZvPSjQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8
 a=1PYGPHLq7ypMcgB7c3kA:9
X-Proofpoint-GUID: 3hQMTec1spDYKRXlea7LNX7ypRVEkFDh
X-Proofpoint-ORIG-GUID: 3hQMTec1spDYKRXlea7LNX7ypRVEkFDh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDEwNSBTYWx0ZWRfX8/Cm0rbJj5Oy
 GEwD0Q+/qi3vB8dHLhiTMDE5zJWT++SVkB3jAHIRCDvbXARg8eOXlsUBXNL8tXCtO6ABcmqtWw4
 SbVaoT8qG/LZ+GqNwyYqIMezd83CYJZ5vYOcBc9q9pc8qfO++lpDglq2VO0XHZy5KifDGp/YZmS
 84qESDeAOimx3OEJt8/k2F1J9O4sFUon9+AdCtEPjpcrECjr3WYA8liRp4IqwAtfJ9ZVAXkkz6E
 LFzLF4TxYab7VSfxbft7hjXsEda6xk+uk+R/JsFloysV4iLIcFRJ23vdIm3XjSsdaduc5z59uEB
 G66pXfvI7JEmKyGePk3I8bYRHHNh22pkQlqEeEe+B+gCXZcp4/YKi2uVUtXnzpQmdgfAtW898ub
 kxX589NPg3Wy363NXrHi5LFaSaNqnw==
X-Proofpoint-Spam-Reason: safe

In the case the SDCA IRQ is built in but FDL support is not stub
functions are required for the FDL helpers to avoid build failures. The
FDL IRQs likely shouldn't get triggered in this case, however they would
still be a part of the build.

Fixes: 71f7990a34cd ("ASoC: SDCA: Add FDL library for XU entities")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202511200419.SbU6YvjE-lkp@intel.com/
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/sdca_fdl.h | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/include/sound/sdca_fdl.h b/include/sound/sdca_fdl.h
index f4ba809cb203a..fbaf4b384c8af 100644
--- a/include/sound/sdca_fdl.h
+++ b/include/sound/sdca_fdl.h
@@ -64,6 +64,8 @@ struct fdl_state {
 					 SDCA_CTL_XU_FDLD_ACK_TRANSFER | \
 					 SDCA_CTL_XU_FDLD_NEEDS_SET)
 
+#if IS_ENABLED(CONFIG_SND_SOC_SDCA_FDL)
+
 int sdca_fdl_alloc_state(struct sdca_interrupt *interrupt);
 int sdca_fdl_process(struct sdca_interrupt *interrupt);
 int sdca_fdl_sync(struct device *dev, struct sdca_function_data *function,
@@ -72,4 +74,32 @@ int sdca_fdl_sync(struct device *dev, struct sdca_function_data *function,
 int sdca_reset_function(struct device *dev, struct sdca_function_data *function,
 			struct regmap *regmap);
 
+#else
+
+static inline int sdca_fdl_alloc_state(struct sdca_interrupt *interrupt)
+{
+	return 0;
+}
+
+static inline int sdca_fdl_process(struct sdca_interrupt *interrupt)
+{
+	return 0;
+}
+
+static inline int sdca_fdl_sync(struct device *dev,
+				struct sdca_function_data *function,
+				struct sdca_interrupt_info *info)
+{
+	return 0;
+}
+
+static inline int sdca_reset_function(struct device *dev,
+				      struct sdca_function_data *function,
+				      struct regmap *regmap)
+{
+	return 0;
+}
+
+#endif // CONFIG_SND_SOC_SDCA_FDL
+
 #endif // __SDCA_FDL_H__
-- 
2.47.3

