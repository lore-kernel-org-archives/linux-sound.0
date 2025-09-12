Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09983A41
	for <linux-sound@vger.kernel.org>; Fri, 12 Sep 2025 10:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757673332; cv=fail; b=isGzyfVqbYzwLM3a0bu41ABXA2nPHiPgNsdXRPzRe+po68Aj1Fn39hUEK2LEku/umRBSQEzkd730iSjkehslVQnsV+CvKKh4dxedxhpRuHZpj3DGDp6pg83UP0Yp7JJzMNyeN5XB1PExdk+tMR47TAYt5tDY2DhinelOGScBjpM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757673332; c=relaxed/simple;
	bh=tAKvgAcM0h+wGnBBeUn4mzjzYrXURcmuRcmZMP83X/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mc2UKaFO+aoRJqqTFTiM1SfvCx7RcNHTOSb2N7mhF0kBi1o/1R2SGPP/CncxBu7I6dxNydQaFYRJE8kLn2IWQIyv37sPV1aULC5Uw7DdTIayPJjqBN/bzsDuL4oG6mwI9K2psylU2RevcmDQOFiZets9bE2nLqlAqsfUbTBftWc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=WilrUw+3; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=HKcWxbcr; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="WilrUw+3";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="HKcWxbcr"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58C5xntA3622022;
	Fri, 12 Sep 2025 05:35:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=xezGrqJV0CMl+5MCa9GYnYUqHtOEbSplgMZmQSSrMbM=; b=
	WilrUw+3I9g2i14xtJUdTuL7mVY8XaTzKjXIfn6l2uCMpm1L1RAX0tNYifxaGh2l
	fyjbw1cnzbQRDnW6sed9FOeFI42y+wUrLDz/cIj57GgSkdMiFBRJYX4dGgXxykkF
	dRKzbOkHaOISYQeGoL6ZKnY4oW4D867rh5B1Po63xiMB6k9HFtqKsElNlEDbJc2p
	Sh/CA+KnoC4dYZH219HYMULVZJsP8TSrPzSbYQl3UnVMLCE95TwTxwIWCPIVHy3s
	idb01nbsXF3cDrf7YVLKSZqdXa4ZHSBrnPJud9ajFXIpXSwZddmqs1f6wC9TLZqp
	XP2H+8Fl/d/6PwpmjZIpGw==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2118.outbound.protection.outlook.com [40.107.237.118])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 494due08yd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 05:35:17 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b1Ea9mPvKrEX/aWj08wq7GyOj+2mZXb+PyynrF6RSdNDqUgE23KcpZSW3gzZ31UlB9IijbIl+4I1phGcWLOKhvCt7AvXZUDxHPkf4ZPYUn+6J3Fpz+G8ga78UTVYiLEy+735Tt43o5a7kzJ2vHk9+YnL785yJIjbhI+cPKwdjP8FOLnDZE3QK84jJfNJf44xmmVoJPuzb/LeAq368A9vuNBo5bwdMGy8qWkE5ZZnreHDkOI344Z+MF40KUrKBjTtfj962ESbgyohtKFmoZlHzBd6Ss++9+mG5zIiOhpQGgT84ULXQmiaqG+8qaDG35TKgrm6gsXoBFcunEnXpHFC5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xezGrqJV0CMl+5MCa9GYnYUqHtOEbSplgMZmQSSrMbM=;
 b=JZHjgaHa97o2griFK/tBcwafRwx7VnCtgjNKb8w+zd/G4jVJn4PoF4GvGZBVbV0LgOV3G6+R0dJI2WmsDXmLCr64t9hW7JAsuTTTuOQrOY8GGvpPJ0+hnZ4ODO2rDzFzIj6SiZRUiYUBrLQ9KieLoqX6GavvwOLfcDL1Hl/Y5pyEEAeVMf+SftbDRfsrVWUSb8OBQvRmZdtMzqdneOinvTcHbhRj7048L6kXr1GI2MG/sEm3rfMnfGpmJyW59fquRXEwBiv4rJs+sevSngMe7GaWyCDnCAT7MD3CgxAAAQcPotJN+E+UYHEuMQ7JxA3CMo2n5Zz8xqWqT7a6RdDGmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xezGrqJV0CMl+5MCa9GYnYUqHtOEbSplgMZmQSSrMbM=;
 b=HKcWxbcruVNyY5wrULhbItWKJg6EWZODTsbZ+YFlazEanT4R/kDi3/Ki7fO7ddhaC6Xj/AMUpgyT0BHNBZe5wxt0zzHBlIocIBo1+XSHGCTrzR/uxOhCIo50+k/ShUDlpXf4cK/JEKAbZWPc1MdUZ4xStdYKasb+mom49x8O4yM=
Received: from SJ0PR13CA0012.namprd13.prod.outlook.com (2603:10b6:a03:2c0::17)
 by DM8PR19MB5288.namprd19.prod.outlook.com (2603:10b6:8:6::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.22; Fri, 12 Sep 2025 10:35:12 +0000
Received: from SJ5PEPF0000020A.namprd05.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::15) by SJ0PR13CA0012.outlook.office365.com
 (2603:10b6:a03:2c0::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.7 via Frontend Transport; Fri,
 12 Sep 2025 10:35:03 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF0000020A.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.13
 via Frontend Transport; Fri, 12 Sep 2025 10:35:12 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 376B640655F;
	Fri, 12 Sep 2025 10:35:08 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 13A9482024A;
	Fri, 12 Sep 2025 10:35:08 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 09/19] ASoC: SDCA: Force some SDCA Controls to be volatile
Date: Fri, 12 Sep 2025 11:34:54 +0100
Message-ID: <20250912103504.2679226-10-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250912103504.2679226-1-ckeepax@opensource.cirrus.com>
References: <20250912103504.2679226-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF0000020A:EE_|DM8PR19MB5288:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: eccec2d1-247e-48e4-32f3-08ddf1e80de5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?II1+etkNa62bExU9rN9KOLeeR67b9e9x7SawVAhJp2LijU18GbPawj8snQB1?=
 =?us-ascii?Q?Hu0AP1TEQ40w74FL9pg9sDCxs/Cbw/tNZ+7t1YMQTt3K+y9u+ciOMYIqnIdG?=
 =?us-ascii?Q?b8IXwLeZP0fKCslVurOh1uAGr57hZySg+5YxTkLuhwOt6/69QwdwMU0PBGvN?=
 =?us-ascii?Q?Xyktkl5Cxg0vX+Pxx+IyiT4jrBL20IFdo/RTJwppwmN2vDBnyUdgwbXjNWFb?=
 =?us-ascii?Q?fqXeibUvYO7hzgzArrP4aPO6GM1GR8bn2VIJ8aOuswsNCgZTjRIH79QCsB+r?=
 =?us-ascii?Q?RqFULVNVRw+gQr+PtKAnVU5zZktQJeVVlFXUCbC8Y5M/aJSZDnk4I5OeuhJP?=
 =?us-ascii?Q?1JrDYSQ7frlron329tg4Dk5Uo4w+9kEuPEiCcu56kmzKX1gvP7OcR50tewlP?=
 =?us-ascii?Q?zGdckcozoDJ8IRr5UzjIxLQfcgX2sblob0QtJJ8EPJzcwWkOk6AfIPPTf1Cv?=
 =?us-ascii?Q?wOjddWL2rrRT70+9Qa1daVZvFPtImXZJVy64YdEpg+N+yOXrFaUURSKndDwH?=
 =?us-ascii?Q?vpdGDK6PKzFqZmv44/uP0UdWvDa26YJwtCbPr62wonZi3pheRs05v9B2bbji?=
 =?us-ascii?Q?yXSMhmxxQ/NNF4K5ZYPsEWZAPsLTa3yH/jaEXCOmFKZavGa2Ccl9fKT/AmLe?=
 =?us-ascii?Q?cQXsQpcux5AqEpvnX1MLQT8b+y/DI9KK5cE7ddEFBlG8flYu3QL5K0yidFE1?=
 =?us-ascii?Q?t12IaeYoVd+6BxFB2GazKLr83REmmz/DneELIVXoh+7KsPWRjIwJx77wkdph?=
 =?us-ascii?Q?quDugRP6oJxPQHAi6i93wRcoNIfz52C7/jJTRgth0ThghURMv3/nm9ojx3k3?=
 =?us-ascii?Q?k6qVC6f0hucPUZN/FqfR0RgTSTvNO8eoNkJ1tbmnZStk0b9b4gRy+dxCFr/9?=
 =?us-ascii?Q?qkUibXpPng5y7lIEqLboZ5fmoBDrAblcPiuNzqQyv+3RrplfLLRogTbdMbQY?=
 =?us-ascii?Q?8O/d8jNj8c7rkp/DFlHgSWsVtS8vpKPr3BbhPBBfTk0g6XjxR2wRNFeJn/Vh?=
 =?us-ascii?Q?6YQ5+KcVQZIJVPy8PepiLJmLZy7r0O9+YtPW4zvETWEcGVdsVchiSM3YptA3?=
 =?us-ascii?Q?FCI7H+U7p6+kqYlg97OEkFOOL8DsaaYHUI/oIYGf+clBLAZKkFWG8VXkDkMm?=
 =?us-ascii?Q?gssD6KxcSbuK39c02zSRxXqwQg+c2nMPT0m0Z8XznX0GQXJLA7uxNtBmBi8m?=
 =?us-ascii?Q?f+RwjIRMRqC2aMrh6fdaDspWpYiZfdE2x1Q6otDWGIKsNIpijA1KnL7Xrgfz?=
 =?us-ascii?Q?NSxFpdMfsHsRqIK0s1DNzs3jJVC0scVLp8z1DxoDe6HYc29MT+nMf0wEO+25?=
 =?us-ascii?Q?unvc7MBtqXF2s/kR5OVR1UgB7e+WQMVVcpbxcwzU/nDDnisgRLpXHTpnRsr6?=
 =?us-ascii?Q?xRC2EkaybNyJgAlnw/1+4bkGkb9xtJuQZVahSfIguS46DFUjA8KaYX6BGh/d?=
 =?us-ascii?Q?3K15WOPS7t7mgDD2J1zZcqW6CfgGGg63xP62tvdxkdwO61aD/aX06dNntcMZ?=
 =?us-ascii?Q?0LkLjQR98OfW9LTzI7XsoqCMuadHPSDNvvGz?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 10:35:12.1057
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eccec2d1-247e-48e4-32f3-08ddf1e80de5
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF0000020A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR19MB5288
X-Proofpoint-ORIG-GUID: Q1pTsSiv27AWL7qwLE0WsqrCezfVJDFp
X-Authority-Analysis: v=2.4 cv=F9NXdrhN c=1 sm=1 tr=0 ts=68c3f765 cx=c_pps
 a=cREajeUs7dwWx3wSMBFr+A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8
 a=ouDB0LvNsPAk7ljP0nkA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEyMDA5OSBTYWx0ZWRfX69cw19GgQ6aU
 bniv7Nj39KyD5dm4Y49Sm6jqYzZ6ZBOhvTbUX3xzOE1aQuBxxvcfPRqpibjs1M3W3CQhbpYZvxi
 f9Z8TvAepTjMbryoYFFyN2zOdtm5nXEtBjgYAiqZJ6NREycLi6+YjYCAclfGLM4pJT7TuLQ/uhn
 8BxEZnhlz3B+aB/i7Xj8vV2pZbAxb9E2ts5aaD5L2uNsCrh6GX0mU1Tm2Yf5g9ql1bL3YTLxE23
 ruZRa/gWYFnNIenLCOssIihmNMJgBWFs7oxLDd7WPJTRP+7UpWlX+7TniiRwuWaxDGfjOQoIbXx
 zEQJIcg9S5kxPNdWUPTxlTFVNgf5lZZuarPPbIw85bYmEX+ZxmRsxNi3/p8zX0=
X-Proofpoint-GUID: Q1pTsSiv27AWL7qwLE0WsqrCezfVJDFp
X-Proofpoint-Spam-Reason: safe

Whilst SDCA does specify an Access Mode for each Control, there is not a
1-to-1 mapping between that and ASoC's internal representation. Some
registers require being treated as volatile from the hosts perspective
even in their Access Mode is Read-Write. Add an explicit list of SDCA
controls that should be forced volatile.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v1.

 include/sound/sdca_function.h   |  1 +
 sound/soc/sdca/sdca_functions.c | 58 +++++++++++++++++++++++++++++++++
 sound/soc/sdca/sdca_regmap.c    |  9 +----
 3 files changed, 60 insertions(+), 8 deletions(-)

diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index 51e12fcfc53c..ab9af84082c9 100644
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
index 2d5d20e23e3c..cc0306aa14b2 100644
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
index 72f893e00ff5..8fa138fca00f 100644
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
2.47.3

