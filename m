Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A9F218EA8
	for <linux-sound@vger.kernel.org>; Fri,  5 Sep 2025 14:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757082723; cv=fail; b=ZTBI+PBT1wQ9XOkWv84AaPuBCGLHqTRPbwvSOrZtFbOEaT0byv6M9lSIzyFtcBGeP65Ifp5zZj3yxzvBntqY+zvltOGWq0vwqZKINH/sEILtxlwQj6CyAJP0RZN9qVZtCPgHpIZBjGV+YznICssvGBdTL22tT6VyXDtOAldH6vQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757082723; c=relaxed/simple;
	bh=j7b6k2H3L5WeP7Aq/0r0qVo3MlTxTJfUyw15AK2oPgY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o4NTOp2kQYYN3OBtYd1eOEuS4r8fahN8DKMmpOeSWqdCZ5HS8uNkl8F/bVsgaIsPsTnnHB2wKPUyU3UKxmOkCX9npSeKZda15C+60QTIWekdjYz2gi1Duh7VOJw/Givm3gcG05SgxE4Dz4uzy7GM21muE/Le1b1tivh25YSo8do=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=gT7snTX8; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=YBSoLn3T; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="gT7snTX8";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="YBSoLn3T"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5859A7ee3552596;
	Fri, 5 Sep 2025 09:31:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=UeL+kO7FAj3Ei8xnuXNpMo1teFIOIbGAeZ6ymBYzrjg=; b=
	gT7snTX8JY9Yj1Oi62pJAbpjlLvYZAq2+JAcX0hRihPNP7LPBOPGU6yNztf8maA0
	WJihQBvorP56IPX9lgLKES2/ATLyZcRqao8PBtKmZu4eUg4VAySQMxxn3LZ97Pl3
	7fSFzXsxRXQ4tyDOKmvcyx5SD3fCn/RSJ04Bs5GIhvh1Rx8pRwGic9GA/Bo49Cx5
	fmLLP6Lsp3MneYxtlEzlr3DXdaTsAUUUvzzrsU3ranx+dd562QAv07cFA2leVhh6
	5uBFpByvcr0sIFMNTmbFVKqw/hzam5JiT1csFD26vPH+T8gg3z18vumcladiNPWR
	9EL7agJhqJtDTrBZfTz5hw==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12hn2214.outbound.protection.outlook.com [52.100.166.214])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 48yw0b0bkm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 05 Sep 2025 09:31:40 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tj+dK/yUOA4EJ2YTpKke+ZgyMeNHq9dSridAE76c/PmRvGLUi4F79bPiY0ZYPBIh9Q9+z9+fAc0yi9v8hMP0xMg0r/yPOBRzbHUJcAt6gWnNCf9GeCuHqgn/lHoBYWV18BEjGs2O2uYVrZSLzAJtCMI0DPPZErupaSR+yUs4SzBFvB+0cDThP9c8rQvS2sZKuDIZi16zwaMb2C4V8gSFgrfqrRQqbl0uI2xcFGFotuIZ2vUyQrPycGYMX1Qz7hbK1hhoqgv5dOOd+thytFRRLV9bfrm48PNV9DlHAVULJyxx1Awtqcui029Vol5sklTnqlMUco+FxvmHGUJo/WomVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UeL+kO7FAj3Ei8xnuXNpMo1teFIOIbGAeZ6ymBYzrjg=;
 b=ohj/D0V9RxPu20O1q+fkNrLXajMK64vAgb2JZDQi3CZD4l6MPjnSkgK6p1wQ1RKvpmhiORG7liFCebF8/nCDYc64d7wZKpy6leBndgJnWaZk2TRTMHHBxJjQe3/z0ne9LnH/zdNJ58zAw3yrZt+sYi7mMzgfHT82rTwwZzlPg1AnFukUtYcmHshRJBoGYZs5BhUQWf7A/ovmggLg30H7gG+tSnFbQq5DZSnWsx6UkU8Bo4YN8f+XIYICUhwug3HBseV59wslPxZIP9siCBgGO1rkqsKWz91/cr2fyBIMeXClmw78eklrdIjVC/PB7CLUfBF1+j8PPd03qkbBU05QJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UeL+kO7FAj3Ei8xnuXNpMo1teFIOIbGAeZ6ymBYzrjg=;
 b=YBSoLn3T8F8ezYNwexKG7W2zt9IWEnL3jQ0/0bKgylSxe1/mRXUBv618Jg3+6KL9WtEmHRNeF2FcdhTY1Hicmcp6AoHngvkx1GWfJulGdhkI7fXTHlNrwT219Nt8Rq8PCI+B9bh+k7nXD/2X+DXZrlxToWQQa+8R07bUYi3Pn7E=
Received: from DS7PR06CA0010.namprd06.prod.outlook.com (2603:10b6:8:2a::17) by
 CH9PR19MB9347.namprd19.prod.outlook.com (2603:10b6:610:2e2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Fri, 5 Sep
 2025 14:31:33 +0000
Received: from DS1PEPF00017095.namprd03.prod.outlook.com
 (2603:10b6:8:2a:cafe::67) by DS7PR06CA0010.outlook.office365.com
 (2603:10b6:8:2a::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.20 via Frontend Transport; Fri,
 5 Sep 2025 14:31:33 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS1PEPF00017095.mail.protection.outlook.com (10.167.17.138) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.14
 via Frontend Transport; Fri, 5 Sep 2025 14:31:31 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id CEBB940655B;
	Fri,  5 Sep 2025 14:31:27 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id BEE37822549;
	Fri,  5 Sep 2025 14:31:27 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 08/15] ASoC: SDCA: Force some SDCA Controls to be volatile
Date: Fri,  5 Sep 2025 15:31:16 +0100
Message-ID: <20250905143123.3038716-9-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250905143123.3038716-1-ckeepax@opensource.cirrus.com>
References: <20250905143123.3038716-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017095:EE_|CH9PR19MB9347:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1081f86b-98b7-4ba2-8328-08ddec88e8d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|34020700016|376014|82310400026|61400799027|12100799063;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ppa+WzfKk0kCnNonG1RftLyTb5YAKIjShzexKoVsKEzCgmc27S9v3ZrIHb2N?=
 =?us-ascii?Q?c1ECeloGvGTyMH2htRY8WQSLw6WbR3pFTea5LIedAXYGsnUs0/ZqfNjCPcmo?=
 =?us-ascii?Q?q6YYIKiSRY4C7wT64T8yxKHxfEq4xOQrwkg4cYvVdhMGDbppBHdCjZEnmT8b?=
 =?us-ascii?Q?arwhP4u8Rkq4U46IGy8aDA9bsBmmqtk/YcumUELwWyL46KlxQzcsk5xypQ1L?=
 =?us-ascii?Q?7MSQ5Go25DtAbEIDFV+oaljyPubGbS9sGVCQIHalnByEiFeEQa9120WMEKZc?=
 =?us-ascii?Q?yZWMKAfjUJvNoETXvuIoN4Y5K9zEb9tGwwRwu77o9xkcZOwX1NY4Ls/cttXc?=
 =?us-ascii?Q?dr1xO72rAoBAfCKvfxehps11hgNOF8gdKjA7bLNynLxxdrA/VQhrPQiUDRBd?=
 =?us-ascii?Q?nawW3yuZA0LvxkddGxHlVk3895yXEp9KuwbgBxL49h6GAQWzaHqa55xrh4LD?=
 =?us-ascii?Q?BHwnTnG07gRR2sCj+d9wzuMkOTmhkoW5gDejKDTY+TyBDkv0jFmbCireUvf5?=
 =?us-ascii?Q?aTGgcd+1LzJnowusBJ3IQYwJIYxxcDKWv+jRPvZjbgOG/oi/ozs8b2CnWlR3?=
 =?us-ascii?Q?3tpFfo6PsoGabHpZ9nPS66edmSjGxq2DSoBD7jiwLxpx0DUxlIPRoztHHIHL?=
 =?us-ascii?Q?+uVk+6nyszhP7YeZbYwlXNYQTpNdlmPzkb1tffpJ0X/AOeUo8UBMCjzi3IH5?=
 =?us-ascii?Q?4AIYSK0J6gadGtviTPxVG2ZAbG7laBXXHFKBDi/vV3N6OkeCLxIMknXcCNwo?=
 =?us-ascii?Q?1f6psNar1wSwNrL01i5RmWqm10Qtrk3m6IE81YQ89TBn7gZOjLOKVS55OH9j?=
 =?us-ascii?Q?WSn8qyuTEQfONNBGP5cNm5g4wGT/E6ZAxivGBO2osT9Nn/ePCtZbCF6DSsYD?=
 =?us-ascii?Q?HRUp4apPuAAAZzr7tCYCdULc1q3mTrcvgZzBDppwDxHko9YaAmKN4mDbwof6?=
 =?us-ascii?Q?GwvNeX5GNl8TSbrFN4nVcMlv4KR/teQwVWcrT7tyVs7vNVaGXsGmE8vyniGw?=
 =?us-ascii?Q?ZddbxOxGlF+XpjbOgTkSPp8hX+YjG3P4Fn0eAmLQkllYEUcJnjJ8szxWiHWc?=
 =?us-ascii?Q?nkgaR1aVaLXxXDAOb+fDYnycgHwS1p48L1RKtf71hoBYrKiYgrRjguyIFWGY?=
 =?us-ascii?Q?gmgfpMhVj5xwnclojZhgnDYA0HT4i86/0zqrQTxxGKSj1D0h0WmuQVz94u98?=
 =?us-ascii?Q?p8yFB6ODqIMHpMubxUXALBVPXtlLb1dhQ9vWu1phMF1v3woebjLuvEq9imxI?=
 =?us-ascii?Q?cWaCa6/HW+n61pYYdKQ5m3QDC/Iu36BanBTaxxmJwLIELvq3KookXjeWQvEK?=
 =?us-ascii?Q?W1EyplCwlWMxJs9oUj/PiVkSM7KCoC2F4JARVXEwnsWClTZ7zGLuHOqfgUWy?=
 =?us-ascii?Q?iIaVyk5cjAtZIqxlYD15V56rdgPYtO9dy2HMcz6OVvtreeIM69XL4/KTj9FS?=
 =?us-ascii?Q?98vjSXGhM4ijfv+tQF+1Ax8j7J9OEIoZ5bEGZOkv+MchkJFwvQfCWz3DUHmt?=
 =?us-ascii?Q?oylyC1cc5yhpDvcwNouQLAS03Q7HqYy+LDD8?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(34020700016)(376014)(82310400026)(61400799027)(12100799063);DIR:OUT;SFP:1501;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 14:31:31.9537
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1081f86b-98b7-4ba2-8328-08ddec88e8d0
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS1PEPF00017095.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH9PR19MB9347
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA1MDE0MiBTYWx0ZWRfX5KD5dDfRSkTe
 JY6hxMhRr0HOabfqmxh7CHfs0o9XxtCtR2LNGe2yS/QZGH2qFYLtzMKAxWqVVb4r9t8SVvWBJC/
 hhRmzSmVpSIsVeZwAH1viSBVuCQKhH4/h3swS6Hd0EINynGkxJCci1q6y/QqjD3QWspLZBLqIUH
 w3Okg5/US67klnJyCWaKoWq1p1hk3ALeDy4jEYG2Q8+2zrfAfNIyIQsEcbFyw8q8i5Ltj0Dxr3k
 F/4XVZ6qbDQqvPle19vQXwI664UgKANgxdkaoG5q3iI93Rr1JeFlBwPUmNtbNBchCA5oA6UTM3f
 c+anmy2Bayvjlm7/Dk0y/Z+oiZL1Vtd6rvojP5H3qN1TanM2Hn39vlzqeE7UIY=
X-Authority-Analysis: v=2.4 cv=YJufyQGx c=1 sm=1 tr=0 ts=68baf44c cx=c_pps
 a=th+c55zLw7pfwmeCaz/3WA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8
 a=ouDB0LvNsPAk7ljP0nkA:9 a=jZz-an6Pvt0H8_Yc_ROU:22
X-Proofpoint-ORIG-GUID: lqj478pDeMqQM5JM2Ku_9RY_zC54F3at
X-Proofpoint-GUID: lqj478pDeMqQM5JM2Ku_9RY_zC54F3at
X-Proofpoint-Spam-Reason: safe

Whilst SDCA does specify an Access Mode for each Control, there is not a
1-to-1 mapping between that and ASoC's internal representation. Some
registers require being treated as volatile from the hosts perspective
even in their Access Mode is Read-Write. Add an explicit list of SDCA
controls that should be forced volatile.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/sdca_function.h   |  1 +
 sound/soc/sdca/sdca_functions.c | 58 +++++++++++++++++++++++++++++++++
 sound/soc/sdca/sdca_regmap.c    |  9 +----
 3 files changed, 60 insertions(+), 8 deletions(-)

diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index 51e12fcfc53cd..ab9af84082c95 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -771,6 +771,7 @@ struct sdca_control {
 	u8 layers;
 
 	bool deferrable;
+	bool is_volatile;
 	bool has_default;
 	bool has_fixed;
 };
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 7d08e6fc93b83..e12a2a90e34e1 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -779,6 +779,62 @@ find_sdca_control_datatype(const struct sdca_entity *entity,
 	}
 }
 
+static bool find_sdca_control_volatile(const struct sdca_entity *entity,
+				       const struct sdca_control *control)
+{
+	switch (control->mode) {
+	case SDCA_ACCESS_MODE_DC:
+		return false;
+	case SDCA_ACCESS_MODE_RO:
+	case SDCA_ACCESS_MODE_RW1S:
+	case SDCA_ACCESS_MODE_RW1C:
+		return true;
+	default:
+		break;
+	}
+
+	switch (SDCA_CTL_TYPE(entity->type, control->sel)) {
+	case SDCA_CTL_TYPE_S(XU, FDL_HOST_REQUEST):
+	case SDCA_CTL_TYPE_S(XU, FDL_MESSAGEOFFSET):
+	case SDCA_CTL_TYPE_S(XU, FDL_MESSAGELENGTH):
+	case SDCA_CTL_TYPE_S(SPE, AUTHTX_MESSAGEOFFSET):
+	case SDCA_CTL_TYPE_S(SPE, AUTHTX_MESSAGELENGTH):
+	case SDCA_CTL_TYPE_S(SPE, AUTHRX_MESSAGEOFFSET):
+	case SDCA_CTL_TYPE_S(SPE, AUTHRX_MESSAGELENGTH):
+	case SDCA_CTL_TYPE_S(MFPU, AE_MESSAGEOFFSET):
+	case SDCA_CTL_TYPE_S(MFPU, AE_MESSAGELENGTH):
+	case SDCA_CTL_TYPE_S(SMPU, HIST_MESSAGEOFFSET):
+	case SDCA_CTL_TYPE_S(SMPU, HIST_MESSAGELENGTH):
+	case SDCA_CTL_TYPE_S(SMPU, DTODTX_MESSAGEOFFSET):
+	case SDCA_CTL_TYPE_S(SMPU, DTODTX_MESSAGELENGTH):
+	case SDCA_CTL_TYPE_S(SMPU, DTODRX_MESSAGEOFFSET):
+	case SDCA_CTL_TYPE_S(SMPU, DTODRX_MESSAGELENGTH):
+	case SDCA_CTL_TYPE_S(SAPU, DTODTX_MESSAGEOFFSET):
+	case SDCA_CTL_TYPE_S(SAPU, DTODTX_MESSAGELENGTH):
+	case SDCA_CTL_TYPE_S(SAPU, DTODRX_MESSAGEOFFSET):
+	case SDCA_CTL_TYPE_S(SAPU, DTODRX_MESSAGELENGTH):
+	case SDCA_CTL_TYPE_S(HIDE, HIDTX_MESSAGEOFFSET):
+	case SDCA_CTL_TYPE_S(HIDE, HIDTX_MESSAGELENGTH):
+	case SDCA_CTL_TYPE_S(HIDE, HIDRX_MESSAGEOFFSET):
+	case SDCA_CTL_TYPE_S(HIDE, HIDRX_MESSAGELENGTH):
+	case SDCA_CTL_TYPE_S(XU, FDL_STATUS):
+	case SDCA_CTL_TYPE_S(XU, FDL_CURRENTOWNER):
+	case SDCA_CTL_TYPE_S(SPE, AUTHTX_CURRENTOWNER):
+	case SDCA_CTL_TYPE_S(SPE, AUTHRX_CURRENTOWNER):
+	case SDCA_CTL_TYPE_S(MFPU, AE_CURRENTOWNER):
+	case SDCA_CTL_TYPE_S(SMPU, HIST_CURRENTOWNER):
+	case SDCA_CTL_TYPE_S(SMPU, DTODTX_CURRENTOWNER):
+	case SDCA_CTL_TYPE_S(SMPU, DTODRX_CURRENTOWNER):
+	case SDCA_CTL_TYPE_S(SAPU, DTODTX_CURRENTOWNER):
+	case SDCA_CTL_TYPE_S(SAPU, DTODRX_CURRENTOWNER):
+	case SDCA_CTL_TYPE_S(HIDE, HIDTX_CURRENTOWNER):
+	case SDCA_CTL_TYPE_S(HIDE, HIDRX_CURRENTOWNER):
+		return true;
+	default:
+		return false;
+	}
+}
+
 static int find_sdca_control_range(struct device *dev,
 				   struct fwnode_handle *control_node,
 				   struct sdca_control_range *range)
@@ -930,6 +986,8 @@ static int find_sdca_entity_control(struct device *dev, struct sdca_entity *enti
 		break;
 	}
 
+	control->is_volatile = find_sdca_control_volatile(entity, control);
+
 	ret = find_sdca_control_range(dev, control_node, &control->range);
 	if (ret) {
 		dev_err(dev, "%s: control %#x: range missing: %d\n",
diff --git a/sound/soc/sdca/sdca_regmap.c b/sound/soc/sdca/sdca_regmap.c
index 72f893e00ff50..8fa138fca00ff 100644
--- a/sound/soc/sdca/sdca_regmap.c
+++ b/sound/soc/sdca/sdca_regmap.c
@@ -147,14 +147,7 @@ bool sdca_regmap_volatile(struct sdca_function_data *function, unsigned int reg)
 	if (!control)
 		return false;
 
-	switch (control->mode) {
-	case SDCA_ACCESS_MODE_RO:
-	case SDCA_ACCESS_MODE_RW1S:
-	case SDCA_ACCESS_MODE_RW1C:
-		return true;
-	default:
-		return false;
-	}
+	return control->is_volatile;
 }
 EXPORT_SYMBOL_NS(sdca_regmap_volatile, "SND_SOC_SDCA");
 
-- 
2.47.2

