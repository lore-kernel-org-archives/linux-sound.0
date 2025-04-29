Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA3218FDAB
	for <linux-sound@vger.kernel.org>; Tue, 29 Apr 2025 08:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745917162; cv=fail; b=XEWc2kunn1puF5juP2ai/1lxb5TXMW237uVbicNor6fDWux4M/MQ3XMgtKof1x4ZjWjnldp2XucZn2RIejZSAQnN1s89PrK/Np8xU+p7nA/dbSdUR40MonQpAUpGdUpLfEqj32IaYzk/3mfe2RccpSPCONh3F89e5++c8xRWprI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745917162; c=relaxed/simple;
	bh=nROGEAPARZpWGPPxHBYsR8VFCFKo/nWUQrEnkZrcXzM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rh4NNpztyagqBb4OjPmrBa27AInSjcNkBQhQdHTe7fihAPA0Ofocb12eB0eGVwaOpkfascmP9Bm2mQZ4AFS2nm2tswrYPfc0G1h91NMNGODzHlx3SmKy8xp1rL32RkuQUD3bUIxGBhemlyt74SHDpbSdqhf/47sIDYRnNEMghME=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=GKF/y7hD; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=TYAvSgr8; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="GKF/y7hD";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="TYAvSgr8"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53T4d2xI007326;
	Tue, 29 Apr 2025 03:59:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=qMCHJfZJgPqI1nG3GhRqqmZPsmo+/V5jv37Z3PdJBh4=; b=
	GKF/y7hD1YsErOcEdPIg5IyH8M+2K1l2b6v0bDLNHk6fxV+dGBbjueXWLhzL2CnZ
	QQ/YA6EOsKN0mqvybt6e/O8gJbkKKrMNG+PCKDq4aslBdVnWgvbIdBczycgnFwK5
	wK103fQY0C+FJsMekkp0pTX/CgSHd53Cx4oK3h6KDIdk8zOgwWcvEv6zF4j3TCOZ
	DQoKr81LK1Mqq81wDsSlk8VF+jvXgjoimTs9xYV5MInyvrfR98/BG2SqtIEJysBm
	AcPwPFk1/WvOGBex7zG3J8i/TyuGPPDGmnF8PYlPeXN8JOk2gePJyXILAK4Gaes2
	Q94jB6F349JgGIZJmpEcsg==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 468vw1bccp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 03:59:01 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rd6vVRxbidMdhn9DASkDNPBZlckQBEzLguh1tZgtAEEIcQxSoCvCIj8Wlu18qOHVEe+h+n9Tdh7xqafvUxxmOoXFMIHMSriPMSWlvyEO1CDlFq75VZFd9c75ftwXILtI3S8qVT3G7k79QjCfVhv5np/FKuT/RSsojJHscHiIPDxHhtiPojkOH/9BLPjCsMUwZht4ePQ1MulpKq5iRf97J+CPz5AvEgeIrW808N93K+61RJiM2MyAIXI9MPawtjlwknzcJqgL2hurGLUCO963exG76o/G6U+EmAdk6UN+iSvi4CkygWYCF+a/TG2w5cuqcfuiGytgOgbn637MdaSJgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qMCHJfZJgPqI1nG3GhRqqmZPsmo+/V5jv37Z3PdJBh4=;
 b=xoAJH1AbgDmQaorWX8oDii7/Z3RVsnnQ9xsagjyUWKiPLg8vCyGlsxx1BFJY53wgPBvA1Mm2go3DINKkvNXAszGyWfa4Rx8GQyLAHf6R7KH0z7NoLZ+W5JQeNZ0lt6VYtNe6vDGUzoiyz0Btih2QV7JTidsCExUTiKysT4CciqS/onmn2T9UjHku5dT1XfI+ZWJP39FcB48tzNijpC0NJ1P4c7+QIleq/WxLIPcn43lVCd9hRueI0RFTaw3ojjGfd6Taz+z2U4cUgwM2VISA4mJBNl2gkOSeVFzy+wTbTzG/hVzJKXyjkMWidDLC4EymJ+wqGIKGhvCWpcJZD6+0YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qMCHJfZJgPqI1nG3GhRqqmZPsmo+/V5jv37Z3PdJBh4=;
 b=TYAvSgr8jE/p0jACdG/8pSrQGFhjvHWlm9zrnd2qfp1f5QyV9cOduViiS/o2k0+3TLo+vxPH0V1Kh+A5X3knRg1Hl+rPmz8PuXlegMjfvyE3YaG4HYF4wUVgUaRiTTR2fhwK4BScBqHBIcxjo+kaaJbtoa441slYPqJZNecNtPo=
Received: from PH0PR07CA0060.namprd07.prod.outlook.com (2603:10b6:510:e::35)
 by LV2PR19MB6126.namprd19.prod.outlook.com (2603:10b6:408:17d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Tue, 29 Apr
 2025 08:58:56 +0000
Received: from CY4PEPF0000E9D6.namprd05.prod.outlook.com
 (2603:10b6:510:e:cafe::c4) by PH0PR07CA0060.outlook.office365.com
 (2603:10b6:510:e::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Tue,
 29 Apr 2025 08:58:55 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000E9D6.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8678.33
 via Frontend Transport; Tue, 29 Apr 2025 08:58:54 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 91C50406545;
	Tue, 29 Apr 2025 08:58:53 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 7597382026B;
	Tue, 29 Apr 2025 08:58:53 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v4 1/5] ASoC: SDCA: Move allocation of PDE delays array
Date: Tue, 29 Apr 2025 09:58:49 +0100
Message-Id: <20250429085853.258038-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250429085853.258038-1-ckeepax@opensource.cirrus.com>
References: <20250429085853.258038-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D6:EE_|LV2PR19MB6126:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9ebe0de9-5877-4826-f6f3-08dd86fc123b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Znf5axNUn9SKTyfumVKXmEoaDP3mcX3PNzB9YDX8GXO7QHF+VbAXm14eWeBq?=
 =?us-ascii?Q?/o9CuIaDUNhoAz1cAOdPnbLNhI3mkTKIiaLOrjLO1AbyvJTbKAofnAt1nxgM?=
 =?us-ascii?Q?tmAjPB6cdQGhqIWGsq4R4UHwxdOOyrRc8LWFhTBDZoWgGEy8WFB0cBtgAFIn?=
 =?us-ascii?Q?YX4Uvc1Z4nc1eWsOunrgOZ3xOpkoa12gnFeC+jToFlZ56foobwJdU+xQ+emm?=
 =?us-ascii?Q?fiH0RApISByBvPD714TQv7IAFxMUMk/laDswZfe2t+PqLkk6cTKloWTebIvh?=
 =?us-ascii?Q?V9Td3j9rFviarZLwhhi5iokr/Pz/Lxwkoj5QdlYaYbMTZnHEUZRs/vp7YMyR?=
 =?us-ascii?Q?kKMYofzAoxttPNwrhXAgN5UG/B2hE5PUAQNB9K3OXnnsIHIcPZ+NTFxjpqTy?=
 =?us-ascii?Q?AqFF9vkf2+fExuHQHCMcwDl52gUBLyI5JdiiAUcfQ1JxcU7MORtniEFs0pBW?=
 =?us-ascii?Q?NABVYxNhindj797zAEgIoLoY/srLIvJRwYnPwemXqxghcmUKNgv9lf5z9/9H?=
 =?us-ascii?Q?ngDRy8kryoy+6vbUP8aE21AbEY6lEujUY5yNCQ6o/ln0B2DPd5B8VYWdEQKz?=
 =?us-ascii?Q?CFBYUqfgR34oinFqrx/ICJClM7bXDvhrYo0K4RgSc3DTAePtvhmLgRS8aB6e?=
 =?us-ascii?Q?HtQ7gn2wQrjgWHnURhYxeRWHycWDsv2Rx5S0DpFYZqmmOCxCD/3r9wTkgbro?=
 =?us-ascii?Q?7zJPuaz37kBrxun16gvDjGdiXeqy8GiskVV8O47zlX+7hQxPTEnuf5iYWO3t?=
 =?us-ascii?Q?6+QAuI6gt7fQydqa64iCbGCusX3/0Q57aOgbNrBqizbA8yUr4J6Fda9YlHYk?=
 =?us-ascii?Q?tjCzFEboSnxgFlNkfKzZU+DD+Yx55YfnzSD+dnW4uOEGG1CMJBY8jrFdIkQU?=
 =?us-ascii?Q?z8nqaNRGwseUfwQBE9RyGBtwdUMqbIy3H6FCpJX2abFKnPF/5rHBvkuKue9z?=
 =?us-ascii?Q?AssBODbkGeqk2+Z+XkmLLWOTuiXKeoISq2HKTkmiR0ropr+etfSp8PhHn7kH?=
 =?us-ascii?Q?gtLfcQBhjwAFcmWF+teL9E12Ikk4c3mctBH6gA5GHxs2dHnpJrr238v2tePQ?=
 =?us-ascii?Q?dbFZ5Oy99PpEBiBCWQQbNlOgoRC0YMDPLtFAOn5jLFd+8O0ongmgnT+Dlokd?=
 =?us-ascii?Q?74Ce8bfGn7chovpEn+2r996sJPb6lsVH4DNrmrA93igbo41XB4EYGfP/Q7F3?=
 =?us-ascii?Q?Y6FRcPk2UQodh0kAQjRwnVXXsLcQU2ruExEXKpPu8jWdKOaofvie7ltwgmW5?=
 =?us-ascii?Q?ZZZ5kz2PEHn92r0MDeyArxZ2hM/xVVnCnwMusQYjkgjagz9iktNWuY6uPYeK?=
 =?us-ascii?Q?Pr62oDkPnr0e8KCtpkgujBqpOJ8TwnJcRpydjcXfqhhZj4jrwfenhTj71OJk?=
 =?us-ascii?Q?hYhG1ugeBs7Lwim8Su52EutZv/uXA+F6n4ckEK4pVTLEqlklB4WpiURGF1Fd?=
 =?us-ascii?Q?ERQ7VpRIelLQXOqHKNu9FZ0FTzSIpfW7ZSWCYxYPqYa5RBVb2hY8zCXeuLSR?=
 =?us-ascii?Q?TPZGnVPc0hBOfPotMdIKyXlzq/x3eDNv2avM?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 08:58:54.9337
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ebe0de9-5877-4826-f6f3-08dd86fc123b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR19MB6126
X-Proofpoint-GUID: RI5cyJE4dm0JTTVoy0jnmbwGMMZX0eSS
X-Proofpoint-ORIG-GUID: RI5cyJE4dm0JTTVoy0jnmbwGMMZX0eSS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA2NiBTYWx0ZWRfX1rCbqpDLB1JA gPysOTDyri65mPM24+B8PdlyBrix57ypHqilzdxH7Yvn9tCtebalZovqrheU7l985JAr/XHd0Pv nEP08S9A/XEsXLnxKDLfN5TnW2FE692hJxLSZ+Q4KZbQmUGjzSNvczuIc1jZx0T4mCqZrfDnmPI
 wvmdmtGAATzWv3Zdv6WQNHO7qeX5h9UCGlAvY76tGVd3BUDqj3PxBxQO6igM8IDFQyXYsR2xdkP ws73NLD4D+eW/h3xNpE2YdOxEoMnFuQzWgLjsbppvBDYXjeqjtC8jmTBvtXuGlr0Uv5VbiNjRA8 99CEjeVukvNjbMkSw1haI5pslxMU5K83x6EFnjOavHhe56i+gRcI6Tl2mBjIcYpzhEY6mgCHUvb
 nPqB2OiGAg3BJeBJN4/xSsPWHfhwaobZJVGp+RCXNJ/21mTKj1NddXidsZT/Ws8gwQPpYQQ4
X-Authority-Analysis: v=2.4 cv=Dd4XqutW c=1 sm=1 tr=0 ts=681094d5 cx=c_pps a=mXs27GP3B2XOU+bPH1EGlQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=XR8D0OoHHMoA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=lMW7R4D7PrprYJh-GsMA:9 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-Spam-Reason: safe

Move the allocation of the PDE delays array until after the size has
been adjusted, this saves an additional division and simplifies the
code slightly.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

New since v3.

 sound/soc/sdca/sdca_functions.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 493f390f087a..64ac26443890 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -1105,12 +1105,6 @@ static int find_sdca_entity_pde(struct device *dev,
 		return -EINVAL;
 	}
 
-	/* There are 3 values per delay */
-	delays = devm_kcalloc(dev, num_delays / mult_delay,
-			      sizeof(*delays), GFP_KERNEL);
-	if (!delays)
-		return -ENOMEM;
-
 	delay_list = kcalloc(num_delays, sizeof(*delay_list), GFP_KERNEL);
 	if (!delay_list)
 		return -ENOMEM;
@@ -1121,6 +1115,10 @@ static int find_sdca_entity_pde(struct device *dev,
 
 	num_delays /= mult_delay;
 
+	delays = devm_kcalloc(dev, num_delays, sizeof(*delays), GFP_KERNEL);
+	if (!delays)
+		return -ENOMEM;
+
 	for (i = 0, j = 0; i < num_delays; i++) {
 		delays[i].from_ps = delay_list[j++];
 		delays[i].to_ps = delay_list[j++];
-- 
2.39.5

