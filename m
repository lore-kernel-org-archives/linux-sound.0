Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EFD2BDC3F;
	Wed, 31 Dec 2025 17:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767202057; cv=fail; b=Z76phKmhtbyOjtzHhrrzreg+mgYkHMa06ZKAZJO1kMYCaJdTwvUjKg/OAbP09d10M15iFU5ZCWUevNVNOkvkcEnpN6EZ/hzw1G0jWoWdaisr6ebkROjzoIyfefOp9RlQPgaoQgnKi1k+Ae5w+SM3hIp4z5CJcZLIrVOfHIYTA0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767202057; c=relaxed/simple;
	bh=1XKYdUomPW9clm9KBwX3ciyAiBs3G0Fvytvr95S0WeY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nbbvnW9DzbyOXK1EB2xELLwJG6VmcmCy9rnjf39n3DZxJg4DhoIr6xYRMNOTG7hS5uZ9DW2PiGXnWeqTlj2FLF92OIQxvz038ZTlL1S0Brsl8Uj5MhiIaQyqNcO9acO8b+erUp1YDjtC4BuDJ9Gsm61STrF0gBCopKYciQy2PoU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=a8huIOAa; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=waEbdQBj; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="a8huIOAa";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="waEbdQBj"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BVGvqok139094;
	Wed, 31 Dec 2025 11:27:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=LnxPPMJVjbWGZmCR1NYwWupvftNViJbSIcrB544kV3g=; b=
	a8huIOAaGfnXrTdd4wUtdcSUxG1E7CvUyKEcC6dkfhbYaHI6Jtb8QCchzWwY96LY
	Fm/dRiJzn3W0wnP8p+Ob53bb1dYD7ILFusPPwsRdZWCvrHGopJ0Vhatdu1LeS8OA
	s9zu0gt9o98QCEclK22pugioxM6vYXibLWNazIQB6ssGdOXhaLkpP4ab15+PkH44
	r5IZ07ZAdSc9I5Uf9Tdhm8wHT84R2RMJRsO5lO9mkDuueAB+z84UoHsmenISiRfR
	OBoleQpYN0panbjP2Q2Zl1Ur9D9oGrnOqv9RWzWbJoLkWHR8vNWhUXrgZNS2Tf84
	EEiQaNPpujyRyCziT2mNQw==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022116.outbound.protection.outlook.com [52.101.48.116])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4bacrmvct7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 31 Dec 2025 11:27:29 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=la3MIroKxTyuIzjCeLUiG0W3Lb5A6cSwfsYCkeucNcTQo+XJbxHnxFZS6w68xwhqqKodkconRoeG1c8dJ3PHHry9LKXQtr5g1Kv84B7emhgNE/6kLY8sSKFgH/emJQex1O/90smfM+DwCk0QaHI9K8TbOmM7BCtBjZZhYDD+NERmSNmTA3hAb3MOHyZZ7QOp5yxM8aOGojokgMHlbWb1hIHM6QEb9nCs3vGlYKAmSCYn++ifWTnIA7XWcgl8yF2WUQl0R3SZr9E+w+yA6oDsEQIKU1wkusUP39KJILZ+L93fDgLVbckyrYPFT0/iU2OxyvoEXNvRuLAjc2IEO5Ww8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LnxPPMJVjbWGZmCR1NYwWupvftNViJbSIcrB544kV3g=;
 b=j1gcJXyGW1ge+7IpbxdE1w+owXVTjNT0rZy79VPSSwX89dySs9oB4T/ws8PQTnVGnVRmJp0j6WAJTnPMtL/+UAfFG5mULK8UPmUymYNO3ekF7t5l6O5BW+Jo7BDG+lvdOn7TMDJf8G3z4iE7pxLEZeZkYe5IcQOU0IL3DEeHhh+eyoC/rtgVvqzb2i2+8QZAjF+B9X9nom0OHozOZnHzvmD6ySZCkwi1Y25EeOLEXQi8z+wrhcvhvSG4fowHQhotvU6VLrne6s7By/fSyrAQSJzlQRdDcbxMb9sfXjUEgx/fagsg8oiTHh36hY8e8nO2k6Vc6GaERJS8uApOZj8Vbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LnxPPMJVjbWGZmCR1NYwWupvftNViJbSIcrB544kV3g=;
 b=waEbdQBjtNlqZi4xkxZjXaUxEGSdXNww46O9KZUAapYPXSg0MacjtgqBloTSe9uhR7WHCYNZ1uQY6UP/+brKq2XTy7mg1F0G+8/MBDh2v2DX0bAwnu75QrCZedd0YwLAh4+Vp319r+WyIB64SdKPWf+TuX0DvV3R0vXov126P4E=
Received: from BN9PR03CA0796.namprd03.prod.outlook.com (2603:10b6:408:13f::21)
 by BN5PR19MB8837.namprd19.prod.outlook.com (2603:10b6:408:2a8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 17:27:23 +0000
Received: from BN3PEPF0000B073.namprd04.prod.outlook.com
 (2603:10b6:408:13f:cafe::f9) by BN9PR03CA0796.outlook.office365.com
 (2603:10b6:408:13f::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.14 via Frontend Transport; Wed,
 31 Dec 2025 17:27:23 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B073.mail.protection.outlook.com (10.167.243.118) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4
 via Frontend Transport; Wed, 31 Dec 2025 17:27:22 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 1173B406544;
	Wed, 31 Dec 2025 17:27:22 +0000 (UTC)
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com [198.61.69.19])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 834EC820249;
	Wed, 31 Dec 2025 17:27:21 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 7/8] firmware: cs_dsp: test_bin: Run test cases on long-offset blocks
Date: Wed, 31 Dec 2025 17:27:10 +0000
Message-ID: <20251231172711.450024-8-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251231172711.450024-1-rf@opensource.cirrus.com>
References: <20251231172711.450024-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B073:EE_|BN5PR19MB8837:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 865fd19f-b4cd-4226-e9da-08de4891dbf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ICG8b4lAA2OfqEEq3x4xmJHotyx/uJTcSeiMlWgtDOmAnuaPmfh2WfVarxAT?=
 =?us-ascii?Q?IZrCvTnG300gWvGW2bffEIJOeeS3UltA3NL9sjidHzAip2lL0xBWsYC4kMl3?=
 =?us-ascii?Q?7nHccvowmYWBznSPefeUMmwM1HiUNzmaD5lfBuxoFMcPfxezmPJb+Dn0jYfx?=
 =?us-ascii?Q?0LYzt6QOt+SvHzxUzmp2m3sLRTyJ3IpfRgbi3dDFyhbayS/zu8vmgaf+yoAu?=
 =?us-ascii?Q?IkpQDg5XYp8/uz91CVzdjCrtaGxWusAgJ6Xu3njIbCDrrqdj9AifmXtD1HLd?=
 =?us-ascii?Q?zdpHOXd5PWCQTWrtrWkr5zu2p0mzzTTSU+DoVY6L5JDNRZT/oNXEe62qzq3x?=
 =?us-ascii?Q?ai8cPRPCKOfkQnSis5IcYO0e/WFotx++9fqRdVVf+ANuAytor67JTJcaw6Wj?=
 =?us-ascii?Q?fjHsxSpjGza4gkCMVYZsReOSiLPga16cG5sgytQmlRixKFlcjWqHRaa3s0UG?=
 =?us-ascii?Q?dovyC+QRRwbi6Mm+m+/KhC8h/eyAFWWlwkZkc84GXBPQ3j6o68uW8MnDJdFP?=
 =?us-ascii?Q?SlSlqmVSzOJNObGM+c2EFheo4YORDyliJeM5fQrhN+Q616SQVsImMjJhXc1p?=
 =?us-ascii?Q?/HcoIsrgPfpqof4S0ZbII4nFRZzMxSvwuhDLyA+qk9beBd0Nl6WGAY1qsU4q?=
 =?us-ascii?Q?iboyngEgYFvc8AZLq0Bwlf6G93bkdgvfRNAYCEGD8VombdG7oOTGkxoORFOi?=
 =?us-ascii?Q?xAOraF9RsBYonRxrSjLWatz8tu9YrocnYlzBZmPVK0oCtneSpWiBwBTvj46d?=
 =?us-ascii?Q?Ikt9sSoILuqFPJS67UfRkmZIu+m7BGTDoO5+vGKax+1M3VzasbBi+es7Z5Ly?=
 =?us-ascii?Q?J9uQmAzUnvrsUiCIbTAmlcNpEa8LC4qBzQajdMU09TuMDFZ0E07DJE1PDlUn?=
 =?us-ascii?Q?x197QgepjJlM53UQgFQDQ1J0g7bTpIMNXjVuPYFtVQmJBLpATLXkiyJOALu/?=
 =?us-ascii?Q?06DGedR/9ObYLpLOm5n0eA0vdeS7NNlHGqZOZDVyFuqkBvImXAYTo9+9oz86?=
 =?us-ascii?Q?x0jKHnyTe/vD24M7R3m3IHqKoCXw06o2tLz+vD5UZ9ZGnaGBGudxcyRpU13b?=
 =?us-ascii?Q?mCG4lFydc5c8tM7t5SonBYT/CiVcZoRr4rsdQ2cMAFjiH/+k2At2TlqM3iy3?=
 =?us-ascii?Q?Kc4SO2qiBZgwyJx2u0D/qwiZVklqj5q7O/yH0dS719ovDpjQXnlk+6R0vjoh?=
 =?us-ascii?Q?kDO5n3KPmlNXKvNulZLKbM2UzX9MV4aw+KtSp7BjU+lcBDeNF+azDlq2D68l?=
 =?us-ascii?Q?Oed31CCt1U6Lr2FpagsD2CeAf6+6qXcpiYz43Y+HBYjQ2Q0Ck++6X0PtmkCq?=
 =?us-ascii?Q?hyNWcpUgxEdTeP/fXjJdm06e9Uq+uTIDRreu6KD3UjsKUWinSXtssmfxJmq0?=
 =?us-ascii?Q?geZnapJW2sN6OZpVxVQa8zXj1cNBqxEsmnCrO91wfnRBtE8CfNpCVteslzoh?=
 =?us-ascii?Q?U9AUzbjXOHQTVRCFWqiLd1DurXN7GAuAWHRr3efSyhighs+YVXs+S9GkVHa5?=
 =?us-ascii?Q?b6iRlx0jpN3/7P1SWeqf12SnWHnVJNR+VKBwvPeQVwDSFsVVmZlqyR3XfVnr?=
 =?us-ascii?Q?cwVnybs4seFO0j6OBMU=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 17:27:22.8516
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 865fd19f-b4cd-4226-e9da-08de4891dbf1
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B073.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR19MB8837
X-Proofpoint-GUID: uCW90WzYLJLb3GVcd9WnjzMXYmxnNAK7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDE1MyBTYWx0ZWRfX37/zCz6zYmWU
 LW8hqPqFxxTursVmhmhzRzcCCw9Q8GxotJz1oQlOY8v0mPGz5pvN/Rx/N6OoA3s9E8+DdHdl1ji
 G16M8/I8t3j/OMDef68YxXVGz1HkmWPmJ4ICZXOgvhfDy79GstWWnMgIME9rzVDUCALC3AU/84T
 wcZ6qtXV4jMyK+Olz6EnaZR0fN92eYSCRMIWoB9uKNiXaEsmp36TN7PFbXzCpBaOBlWYkRxNbgx
 XZWRpIqJNMGA+MmrTd2T6/3QULjVrk3Potqtv1SOUBhMecufNvzGD2T/H6c4yNaZ4Q7vX3+rGm+
 T/u0HRTXFONhBNAOiq2uifwO57sByO9U4SrL3+J4ejp2LLCXDFnUXtnqU1yhpjB39Trd1Ua8Suw
 d1djPWTd7PnL1ZH7KNy4k3uTravioheAlooU/Hi6/XSbJ//iNvjdNCBXS5iLL4PdcRNOR0y35kU
 DPU0XOTx5P/T6INyHFw==
X-Authority-Analysis: v=2.4 cv=bJgb4f+Z c=1 sm=1 tr=0 ts=69555d01 cx=c_pps
 a=er6SsJhWVBF8D4+n+SRFpA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=9aw_-pf0KlnW5EXjf9MA:9
X-Proofpoint-ORIG-GUID: uCW90WzYLJLb3GVcd9WnjzMXYmxnNAK7
X-Proofpoint-Spam-Reason: safe

Run the patch block test cases using the new long-offset block type.

This adds a new set of parameterization that uses
cs_dsp_mock_bin_add_patch_off32() to create the patch blocks in the
test bin file.

The test cases for Halo Core with V3 file format include another
run of the tests with the new parameterization, so that the tests
are run on the standard blocks and the long-offset blocks.

This commit does not add any new cases for offsets > 0xffff.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
No changes since V1.

 .../firmware/cirrus/test/cs_dsp_test_bin.c    | 229 +++++++++++++++++-
 1 file changed, 220 insertions(+), 9 deletions(-)

diff --git a/drivers/firmware/cirrus/test/cs_dsp_test_bin.c b/drivers/firmware/cirrus/test/cs_dsp_test_bin.c
index 7f53fa9964c4..67af7da4f8c1 100644
--- a/drivers/firmware/cirrus/test/cs_dsp_test_bin.c
+++ b/drivers/firmware/cirrus/test/cs_dsp_test_bin.c
@@ -2300,6 +2300,7 @@ static int cs_dsp_bin_test_adsp2_16bit_init(struct kunit *test)
 }
 
 #define WMDR_PATCH_SHORT .add_patch = cs_dsp_mock_bin_add_patch
+#define WMDR_PATCH_LONG .add_patch = cs_dsp_mock_bin_add_patch_off32
 
 /* Parameterize on choice of XM or YM with a range of word offsets */
 static const struct bin_test_param x_or_y_and_offset_param_cases[] = {
@@ -2324,6 +2325,28 @@ static const struct bin_test_param x_or_y_and_offset_param_cases[] = {
 	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 20, WMDR_PATCH_SHORT },
 };
 
+static const struct bin_test_param x_or_y_and_long_offset_param_cases[] = {
+	{ .mem_type = WMFW_ADSP2_XM, .offset_words = 0,  WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_XM, .offset_words = 1,  WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_XM, .offset_words = 2,  WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_XM, .offset_words = 3,  WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_XM, .offset_words = 4,  WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_XM, .offset_words = 23, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_XM, .offset_words = 22, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_XM, .offset_words = 21, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_XM, .offset_words = 20, WMDR_PATCH_LONG },
+
+	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 0,  WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 1,  WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 2,  WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 3,  WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 4,  WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 23, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 22, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 21, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 20, WMDR_PATCH_LONG },
+};
+
 /* Parameterize on ZM with a range of word offsets */
 static const struct bin_test_param z_and_offset_param_cases[] = {
 	{ .mem_type = WMFW_ADSP2_ZM, .offset_words = 0,  WMDR_PATCH_SHORT },
@@ -2350,18 +2373,35 @@ static const struct bin_test_param packed_x_or_y_and_offset_param_cases[] = {
 	{ .mem_type = WMFW_HALO_YM_PACKED, .offset_words = 12, WMDR_PATCH_SHORT },
 };
 
+static const struct bin_test_param packed_x_or_y_and_long_offset_param_cases[] = {
+	{ .mem_type = WMFW_HALO_XM_PACKED, .offset_words = 0,  WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_HALO_XM_PACKED, .offset_words = 4,  WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_HALO_XM_PACKED, .offset_words = 8,  WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_HALO_XM_PACKED, .offset_words = 12, WMDR_PATCH_LONG },
+
+	{ .mem_type = WMFW_HALO_YM_PACKED, .offset_words = 0,  WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_HALO_YM_PACKED, .offset_words = 4,  WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_HALO_YM_PACKED, .offset_words = 8,  WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_HALO_YM_PACKED, .offset_words = 12, WMDR_PATCH_LONG },
+};
+
 static void x_or_y_or_z_and_offset_param_desc(const struct bin_test_param *param,
 					   char *desc)
 {
-	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%s@%u",
+	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%s@%u %s",
 		 cs_dsp_mem_region_name(param->mem_type),
-		 param->offset_words);
+		 param->offset_words,
+		 (param->add_patch == cs_dsp_mock_bin_add_patch_off32) ? "offs32" : "");
 }
 
 KUNIT_ARRAY_PARAM(x_or_y_and_offset,
 		  x_or_y_and_offset_param_cases,
 		  x_or_y_or_z_and_offset_param_desc);
 
+KUNIT_ARRAY_PARAM(x_or_y_and_long_offset,
+		  x_or_y_and_long_offset_param_cases,
+		  x_or_y_or_z_and_offset_param_desc);
+
 KUNIT_ARRAY_PARAM(z_and_offset,
 		  z_and_offset_param_cases,
 		  x_or_y_or_z_and_offset_param_desc);
@@ -2370,19 +2410,31 @@ KUNIT_ARRAY_PARAM(packed_x_or_y_and_offset,
 		  packed_x_or_y_and_offset_param_cases,
 		  x_or_y_or_z_and_offset_param_desc);
 
+KUNIT_ARRAY_PARAM(packed_x_or_y_and_long_offset,
+		  packed_x_or_y_and_long_offset_param_cases,
+		  x_or_y_or_z_and_offset_param_desc);
+
 /* Parameterize on choice of packed XM or YM */
 static const struct bin_test_param packed_x_or_y_param_cases[] = {
 	{ .mem_type = WMFW_HALO_XM_PACKED, .offset_words = 0, WMDR_PATCH_SHORT },
 	{ .mem_type = WMFW_HALO_YM_PACKED, .offset_words = 0, WMDR_PATCH_SHORT },
 };
 
+static const struct bin_test_param packed_x_or_y_long_param_cases[] = {
+	{ .mem_type = WMFW_HALO_XM_PACKED, .offset_words = 0, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_HALO_YM_PACKED, .offset_words = 0, WMDR_PATCH_LONG },
+};
+
 static void x_or_y_or_z_param_desc(const struct bin_test_param *param,
 					   char *desc)
 {
-	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%s", cs_dsp_mem_region_name(param->mem_type));
+	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%s %s",
+		 cs_dsp_mem_region_name(param->mem_type),
+		 (param->add_patch == cs_dsp_mock_bin_add_patch_off32) ? "offs32" : "");
 }
 
 KUNIT_ARRAY_PARAM(packed_x_or_y, packed_x_or_y_param_cases, x_or_y_or_z_param_desc);
+KUNIT_ARRAY_PARAM(packed_x_or_y_long, packed_x_or_y_long_param_cases, x_or_y_or_z_param_desc);
 
 static const struct bin_test_param offset_param_cases[] = {
 	{ .offset_words = 0,  WMDR_PATCH_SHORT },
@@ -2396,12 +2448,27 @@ static const struct bin_test_param offset_param_cases[] = {
 	{ .offset_words = 20, WMDR_PATCH_SHORT },
 };
 
+static const struct bin_test_param long_offset_param_cases[] = {
+	{ .offset_words = 0,  WMDR_PATCH_LONG },
+	{ .offset_words = 1,  WMDR_PATCH_LONG },
+	{ .offset_words = 2,  WMDR_PATCH_LONG },
+	{ .offset_words = 3,  WMDR_PATCH_LONG },
+	{ .offset_words = 4,  WMDR_PATCH_LONG },
+	{ .offset_words = 23, WMDR_PATCH_LONG },
+	{ .offset_words = 22, WMDR_PATCH_LONG },
+	{ .offset_words = 21, WMDR_PATCH_LONG },
+	{ .offset_words = 20, WMDR_PATCH_LONG },
+};
+
 static void offset_param_desc(const struct bin_test_param *param, char *desc)
 {
-	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "@%u", param->offset_words);
+	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "@%u %s",
+		 param->offset_words,
+		 (param->add_patch == cs_dsp_mock_bin_add_patch_off32) ? "offs32" : "");
 }
 
 KUNIT_ARRAY_PARAM(offset, offset_param_cases, offset_param_desc);
+KUNIT_ARRAY_PARAM(long_offset, long_offset_param_cases, offset_param_desc);
 
 static const struct bin_test_param alg_param_cases[] = {
 	{ .alg_idx = 0, WMDR_PATCH_SHORT },
@@ -2410,15 +2477,24 @@ static const struct bin_test_param alg_param_cases[] = {
 	{ .alg_idx = 3, WMDR_PATCH_SHORT },
 };
 
+static const struct bin_test_param alg_long_param_cases[] = {
+	{ .alg_idx = 0, WMDR_PATCH_LONG },
+	{ .alg_idx = 1, WMDR_PATCH_LONG },
+	{ .alg_idx = 2, WMDR_PATCH_LONG },
+	{ .alg_idx = 3, WMDR_PATCH_LONG },
+};
+
 static void alg_param_desc(const struct bin_test_param *param, char *desc)
 {
 	WARN_ON(param->alg_idx >= ARRAY_SIZE(bin_test_mock_algs));
 
-	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "alg[%u] (%#x)",
-		 param->alg_idx, bin_test_mock_algs[param->alg_idx].id);
+	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "alg[%u] (%#x) %s",
+		 param->alg_idx, bin_test_mock_algs[param->alg_idx].id,
+		(param->add_patch == cs_dsp_mock_bin_add_patch_off32) ? "offs32" : "");
 }
 
 KUNIT_ARRAY_PARAM(alg, alg_param_cases, alg_param_desc);
+KUNIT_ARRAY_PARAM(alg_long, alg_long_param_cases, alg_param_desc);
 
 static const struct bin_test_param x_or_y_and_alg_param_cases[] = {
 	{ .mem_type = WMFW_ADSP2_XM, .alg_idx = 0, WMDR_PATCH_SHORT },
@@ -2432,16 +2508,31 @@ static const struct bin_test_param x_or_y_and_alg_param_cases[] = {
 	{ .mem_type = WMFW_ADSP2_YM, .alg_idx = 3, WMDR_PATCH_SHORT },
 };
 
+static const struct bin_test_param x_or_y_and_alg_long_param_cases[] = {
+	{ .mem_type = WMFW_ADSP2_XM, .alg_idx = 0, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_XM, .alg_idx = 1, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_XM, .alg_idx = 2, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_XM, .alg_idx = 3, WMDR_PATCH_LONG },
+
+	{ .mem_type = WMFW_ADSP2_YM, .alg_idx = 0, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_YM, .alg_idx = 1, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_YM, .alg_idx = 2, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_YM, .alg_idx = 3, WMDR_PATCH_LONG },
+};
+
 static void x_or_y_or_z_and_alg_param_desc(const struct bin_test_param *param, char *desc)
 {
 	WARN_ON(param->alg_idx >= ARRAY_SIZE(bin_test_mock_algs));
 
-	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%s alg[%u] (%#x)",
+	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%s alg[%u] (%#x) %s",
 		 cs_dsp_mem_region_name(param->mem_type),
-		 param->alg_idx, bin_test_mock_algs[param->alg_idx].id);
+		 param->alg_idx, bin_test_mock_algs[param->alg_idx].id,
+		 (param->add_patch == cs_dsp_mock_bin_add_patch_off32) ? "offs32" : "");
 }
 
 KUNIT_ARRAY_PARAM(x_or_y_and_alg, x_or_y_and_alg_param_cases, x_or_y_or_z_and_alg_param_desc);
+KUNIT_ARRAY_PARAM(x_or_y_and_alg_long, x_or_y_and_alg_long_param_cases,
+		  x_or_y_or_z_and_alg_param_desc);
 
 static const struct bin_test_param z_and_alg_param_cases[] = {
 	{ .mem_type = WMFW_ADSP2_ZM, .alg_idx = 0, WMDR_PATCH_SHORT },
@@ -2464,9 +2555,24 @@ static const struct bin_test_param packed_x_or_y_and_alg_param_cases[] = {
 	{ .mem_type = WMFW_HALO_YM_PACKED, .alg_idx = 3, WMDR_PATCH_SHORT },
 };
 
+static const struct bin_test_param packed_x_or_y_and_alg_long_param_cases[] = {
+	{ .mem_type = WMFW_HALO_XM_PACKED, .alg_idx = 0, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_HALO_XM_PACKED, .alg_idx = 1, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_HALO_XM_PACKED, .alg_idx = 2, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_HALO_XM_PACKED, .alg_idx = 3, WMDR_PATCH_LONG },
+
+	{ .mem_type = WMFW_HALO_YM_PACKED, .alg_idx = 0, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_HALO_YM_PACKED, .alg_idx = 1, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_HALO_YM_PACKED, .alg_idx = 2, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_HALO_YM_PACKED, .alg_idx = 3, WMDR_PATCH_LONG },
+};
+
 KUNIT_ARRAY_PARAM(packed_x_or_y_and_alg, packed_x_or_y_and_alg_param_cases,
 		  x_or_y_or_z_and_alg_param_desc);
 
+KUNIT_ARRAY_PARAM(packed_x_or_y_and_alg_long, packed_x_or_y_and_alg_long_param_cases,
+		  x_or_y_or_z_and_alg_param_desc);
+
 static struct kunit_case cs_dsp_bin_test_cases_halo[] = {
 	/* Unpacked memory */
 	KUNIT_CASE_PARAM(bin_patch_one_word, x_or_y_and_offset_gen_params),
@@ -2522,6 +2628,111 @@ static struct kunit_case cs_dsp_bin_test_cases_halo[] = {
 	{ } /* terminator */
 };
 
+static struct kunit_case cs_dsp_bin_test_cases_halo_wmdr3[] = {
+	/* Unpacked memory */
+	KUNIT_CASE_PARAM(bin_patch_one_word, x_or_y_and_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_one_multiword, x_or_y_and_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_multi_oneword, x_or_y_and_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_multi_oneword_unordered, x_or_y_and_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_one_word_multiple_mems, offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_one_word_multiple_mems, alg_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_multi_oneword_sparse_unordered, x_or_y_and_alg_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_one_word_multiple_algs, x_or_y_and_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_one_word_multiple_algs_unordered, x_or_y_and_offset_gen_params),
+
+	/* Packed memory tests */
+	KUNIT_CASE_PARAM(bin_patch_1_packed,
+			 packed_x_or_y_and_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_1_packed_1_single_trailing,
+			 packed_x_or_y_and_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_1_packed_2_single_trailing,
+			 packed_x_or_y_and_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_1_packed_3_single_trailing,
+			 packed_x_or_y_and_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_1_packed_2_trailing,
+			 packed_x_or_y_and_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_1_packed_3_trailing,
+			 packed_x_or_y_and_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_1_single_leading_1_packed,
+			 packed_x_or_y_and_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_2_single_leading_1_packed,
+			 packed_x_or_y_and_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_2_leading_1_packed,
+			 packed_x_or_y_and_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_3_single_leading_1_packed,
+			 packed_x_or_y_and_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_3_leading_1_packed,
+			 packed_x_or_y_and_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_multi_onepacked,
+			 packed_x_or_y_and_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_multi_onepacked_unordered,
+			 packed_x_or_y_and_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_1_packed_multiple_mems, offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_1_packed_multiple_mems, alg_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_multi_onepacked_sparse_unordered,
+			 packed_x_or_y_and_alg_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_1_packed_multiple_algs,
+			 packed_x_or_y_and_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_1_packed_multiple_algs_unordered,
+			 packed_x_or_y_and_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_mixed_packed_unpacked_random,
+			 packed_x_or_y_gen_params),
+
+	/* Unpacked memory with long-offset blocks */
+	KUNIT_CASE_PARAM(bin_patch_one_word, x_or_y_and_long_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_one_multiword, x_or_y_and_long_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_multi_oneword, x_or_y_and_long_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_multi_oneword_unordered, x_or_y_and_long_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_one_word_multiple_mems, long_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_one_word_multiple_mems, alg_long_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_multi_oneword_sparse_unordered, x_or_y_and_alg_long_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_one_word_multiple_algs, x_or_y_and_long_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_one_word_multiple_algs_unordered,
+			   x_or_y_and_long_offset_gen_params),
+
+	/* Packed memory tests with long offset blocks */
+	KUNIT_CASE_PARAM(bin_patch_1_packed,
+			 packed_x_or_y_and_long_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_1_packed_1_single_trailing,
+			 packed_x_or_y_and_long_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_1_packed_2_single_trailing,
+			 packed_x_or_y_and_long_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_1_packed_3_single_trailing,
+			 packed_x_or_y_and_long_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_1_packed_2_trailing,
+			 packed_x_or_y_and_long_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_1_packed_3_trailing,
+			 packed_x_or_y_and_long_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_1_single_leading_1_packed,
+			 packed_x_or_y_and_long_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_2_single_leading_1_packed,
+			 packed_x_or_y_and_long_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_2_leading_1_packed,
+			 packed_x_or_y_and_long_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_3_single_leading_1_packed,
+			 packed_x_or_y_and_long_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_3_leading_1_packed,
+			 packed_x_or_y_and_long_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_multi_onepacked,
+			 packed_x_or_y_and_long_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_multi_onepacked_unordered,
+			 packed_x_or_y_and_long_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_1_packed_multiple_mems, long_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_1_packed_multiple_mems, alg_long_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_multi_onepacked_sparse_unordered,
+			 packed_x_or_y_and_alg_long_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_1_packed_multiple_algs,
+			 packed_x_or_y_and_long_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_1_packed_multiple_algs_unordered,
+			 packed_x_or_y_and_long_offset_gen_params),
+	KUNIT_CASE_PARAM(bin_patch_mixed_packed_unpacked_random,
+			 packed_x_or_y_long_gen_params),
+
+	KUNIT_CASE(bin_patch_name_and_info),
+
+	{ } /* terminator */
+};
+
 static struct kunit_case cs_dsp_bin_test_cases_adsp2[] = {
 	/* XM and YM */
 	KUNIT_CASE_PARAM(bin_patch_one_word, x_or_y_and_offset_gen_params),
@@ -2559,7 +2770,7 @@ static struct kunit_suite cs_dsp_bin_test_halo = {
 static struct kunit_suite cs_dsp_bin_test_halo_wmdr3 = {
 	.name = "cs_dsp_bin_halo_wmdr_v3",
 	.init = cs_dsp_bin_test_halo_wmdr3_init,
-	.test_cases = cs_dsp_bin_test_cases_halo,
+	.test_cases = cs_dsp_bin_test_cases_halo_wmdr3,
 };
 
 static struct kunit_suite cs_dsp_bin_test_adsp2_32bit = {
-- 
2.43.0

