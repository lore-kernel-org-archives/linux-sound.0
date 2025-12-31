Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483972BDC3E;
	Wed, 31 Dec 2025 17:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767202053; cv=fail; b=Lh6Sy+GAjSQGi0jZ/wCZsOV8WRcaMJFYIMFyERtyb1AYxO8GBfcbWiz3+YjuKa1UvQBEyPFrH6viC3UGMKR45RNPiecmKQYfvVLKFX+5AwSRio59ZUa3NUnIe1cMRYK/YfgtNKbJfuk/xqdXCUw37hyAqUnlwWO5QjCc4K0ndd0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767202053; c=relaxed/simple;
	bh=SrKhjEEPm0JvM0O70UoT9ZlZyS0Lg6Ugg9EE4VlFPYA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B16Bp+/HY64yULdoSkibaLjf++6iQ0Y+JKaArOONkj6S5TCSUcEEEI3IAKc5Jx4MDUriAjV9r3bHzNgS06de7ci/4UAB/JVLUGds4UCSsueQ7SVzNh+zOq1SSrhn52Eul5qE3IA9ntLNwax8mrnsWdlTeLmkcC20vXeQ5uhb6LY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=jxYPWgJK; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=TE0IqTg0; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="jxYPWgJK";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="TE0IqTg0"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BVGvqof139094;
	Wed, 31 Dec 2025 11:27:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=65iO20CLzIE66iN1053wJXMRGgysgU1SoteRju/CD/o=; b=
	jxYPWgJKsUvztzAWVNpMv5yy+mAieJxk7OtiF3GuQs8qEp0AhPQld0A8qb60vVgZ
	/JNhMyLZ0A+Z1s2OYt9g09V93dC0m8o72lRrli6hKJeNep9pDT9YcljljjEEDvPA
	UulXNK1m/i5aB0ZivuVQBIYQoziPs/N16rXmEPMUCvrlXyGKxI+9842L1vGcWUSb
	VuN93m30GAYtQz4lmsmQH/Jqb/w1SQosrW8iYaHQ8Ukpui/+aoZVMqQpS1+4PKp8
	crki9XW3eWg0CUB1xnEYzlxo6bGDhI/YQfxzCfN41J8SU+lHfzytcaOxHxAVhCBO
	CtOGsRbUhqp5T/hdH1kxTg==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020134.outbound.protection.outlook.com [52.101.46.134])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4bacrmvcsp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 31 Dec 2025 11:27:27 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GuBWF4wMd6el2Uj+CkhgONugmzdmiQASZP9x0I5CzKNtWMa8QAUFIz+Ryo3Oos6ktjzRJdCBeRdx/KPpHHy8hVKHDSz1UFgRBEt4lHu1SlpUxIDWTFySCV8pNLQW4cexLFDOg+TCCe/DXuXxVZvfDkuKaHAKkVs32HBlCDIBLYP54AbtZbRrpjFuFmcklOcv/KbAaR+MTe24Ubm4vFEkQH70es1lURPR/dyVDnpq3l8ponh07gJ0L3nN/1nucl0BMTz5r8k+2QGr7eQ7Vy6vg1+abVvsBHKrrCjIgcBn2AV1hBZByvjQZn0EMVqkBTiirxSw1FHVKnaDBTsNIsN3RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=65iO20CLzIE66iN1053wJXMRGgysgU1SoteRju/CD/o=;
 b=QzzRmsVmdgBW/Tk2fzxEzH38AHsxJ2eB57YhXP+YuYoO4ZfRsq2xOjly+4Gzc9kdOgKivpM+k7FtsVeQv/1Ba5w5iwc8xmxFHuhla7RJdbccSdmlslNZ7x8bh/ksofXaRoDEPiV4I8QlHqjxdAAUbXy8aBYpEiSaDJhXRMxYqOLgj9k6GftW7gQ0phEi3j5z5TZyQEAG7QTRb0hkOHeTLoaFyumPBKUtU2L6l08wK2oSYiJ+QwnIAT827CciN47FMQlQAfKohXdPBRacp1d3nz+f7ce4zbLIVI6eGdJL/UbDIR0kFNJ8bjiTqAlF2ZAwjKvAun5uLled+34O36NIRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=65iO20CLzIE66iN1053wJXMRGgysgU1SoteRju/CD/o=;
 b=TE0IqTg0B5z9a79MSG+ZZcGko8z9A/fPOfkFVBL4thDcrFjTJraNZm++MpI0C4ZbGwC3VOQwVy5kycgz+HJ2AorxJXhu3YSw+bHCzfPZTNL0NnGOQspIeX+32YzUpMmMfAdJYFf+EXhscC1vpo+RRNq4Qu3qti+/8M/r6iDHr4w=
Received: from DM6PR02CA0106.namprd02.prod.outlook.com (2603:10b6:5:1f4::47)
 by CO1PR19MB5015.namprd19.prod.outlook.com (2603:10b6:303:f0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 17:27:23 +0000
Received: from DS3PEPF000099DD.namprd04.prod.outlook.com
 (2603:10b6:5:1f4:cafe::5e) by DM6PR02CA0106.outlook.office365.com
 (2603:10b6:5:1f4::47) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Wed,
 31 Dec 2025 17:27:21 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS3PEPF000099DD.mail.protection.outlook.com (10.167.17.199) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4
 via Frontend Transport; Wed, 31 Dec 2025 17:27:22 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 728FC406543;
	Wed, 31 Dec 2025 17:27:21 +0000 (UTC)
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com [198.61.69.19])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2BF64820249;
	Wed, 31 Dec 2025 17:27:21 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 6/8] firmware: cs_dsp: test: Increase size of XM and YM on Halo Core
Date: Wed, 31 Dec 2025 17:27:09 +0000
Message-ID: <20251231172711.450024-7-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DD:EE_|CO1PR19MB5015:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e4096172-2a86-450b-d928-08de4891dbe0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mwsQ1pIwqzYBWYnXkJVKJZ94+ER8GyieUtt5KuKxWUTAzmf+xsgLC2BynaYU?=
 =?us-ascii?Q?6zbfLJ0K2dDQyNWmU+zB8HfnkSjwZmdSCWxhkbRs7u7IHdivQONjX+SfRCdN?=
 =?us-ascii?Q?Up2y5ZRnqKfGfZ4zP3eou3omF3IBGNVEtJYWQ2Frqjr40wpRpTgJN2NrX9Zh?=
 =?us-ascii?Q?5luJM0jvJStGnbNE9tooThoDPED0qwt2ivI2EZTAJpHoofuGlqgZhseZFiK8?=
 =?us-ascii?Q?UQPnyhNRu37Vr5FkMlGtxAOGlBUZa20i9WdJRJUH4soOxHqf6ogdcyhx1bZk?=
 =?us-ascii?Q?y7me2wiQy+rF4h9qxEqvAv93XS2etIzhs2HB7rZlkodGdBPLRHLB1oEQXHE8?=
 =?us-ascii?Q?2k9PtRhSGmAWoUe8mXbjnbywV8UNbYPw3xmnLu5p6CvOR4I+aXsYEXExWd8V?=
 =?us-ascii?Q?xaRbf2xzEjpSjtEhlJgNNmiUerA1cYuXHpiukfKC1DgyKWWqpDxFuq8gwv5l?=
 =?us-ascii?Q?17vTIGzKFJpxHwCPIeRATi51/A8JVixGVQiYF6XxVp73246uTuJQW55ea+zi?=
 =?us-ascii?Q?cRmhLDxtzkZ8VCNpLOHQUmRPs0mtlYvGiOP4Yvq/pvpSiZr8zObw2g84VbFi?=
 =?us-ascii?Q?ll6JX8Z8Pc6LBVcTxkAJ0Aw1tk8lYyUD/iAJNxhXvMh4kGhJkBYXZckJD2/7?=
 =?us-ascii?Q?Te7MN3KvsG9blzdr1k16Q91I4n9Vopcu/PrZ4AaGCR7NnGKh0xyx/2cL+h8S?=
 =?us-ascii?Q?RBmPJGJxpbXlXAqwutXDNuLUMyhLyG4VFPxkehEDeQygSQuUSro+r0u6HzXQ?=
 =?us-ascii?Q?A38GT+uLNS6JOyntt/vciozXAkZ1RtPchSrX0xZ3o4grczMn3V0KJmRA6of1?=
 =?us-ascii?Q?oDo/zfANKQ5/yvY2SVCD4xEI0GFKYGI+b+iay2U197QdHAJQJb2LUJ5ZeGUv?=
 =?us-ascii?Q?k66KXnYGxCgI1M9LUVOP1tf9eJWVLHifcd0pWmcx+yo6BeQuXfi0y1SjqXhn?=
 =?us-ascii?Q?fVebXOPeJxmgtZRlT7kwm16rbTPGs5/V5gHJD3pIi6gm5LAO/89nSzSq1CAc?=
 =?us-ascii?Q?TLO0vboyDOAhdfLJTcylkQ7/X0CiUCKtHW7rwlRf5A3H7U1a0lGKlAa43Wi4?=
 =?us-ascii?Q?SHZoiXLIb3LVMyafC2qKzcy5eq8cpEU7Kv6s5abeUwYPbpwrpKCajHTO2zjW?=
 =?us-ascii?Q?TOChBOYpRhzpq5h/lkhRv+Tinm3Aaav53qXet4l3CGEAnaRj3a8MmAyrMoih?=
 =?us-ascii?Q?i1ati6ccWlZ4D03H3m/NWNjym4VChIuOemdHjir7IBwOv/kxZHHtYw7SqOdz?=
 =?us-ascii?Q?9DOnE6x1tnO9TeLiMtypuThnKulEgbq6RnNcf+7VTJd6qVr5oKi3ZCCO107D?=
 =?us-ascii?Q?1JFwCfq5uG1iFInul2Vya8x838hKwwM6WX1Kflq7TfOklgLy48J9QJiNLhwW?=
 =?us-ascii?Q?G/0dCdr42OLtoS28Fel9AoM85mDYX0bRKDLPp1trEAYm38qPxo78H/BEI2ek?=
 =?us-ascii?Q?NHvleqrHFN1ZJIEW74Cc0PoX6p7eNRxSCRg6NmhTI5dtt6HRKdmALibVq1uH?=
 =?us-ascii?Q?uTceKliKltUz02P/12Uc/+NSPvgIEV8uQo3GInTUnjngUz/oDMrNe3huC0YF?=
 =?us-ascii?Q?j2tUfrcda0L7MKCnlcs=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(376014)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 17:27:22.6863
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4096172-2a86-450b-d928-08de4891dbe0
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS3PEPF000099DD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR19MB5015
X-Proofpoint-GUID: jAw0hcQvCfRKD3CJVqTaU4vnvOLohSys
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDE1MyBTYWx0ZWRfX0cgVZ822PK5/
 C7rj7RBsQrQDf+zFGrG7zMSAlibCicuAk40By9kUHIAINRui9mtwRqDZDUYix75bsst5eL7bvvL
 B1t4ANa2Jc2YA63ejMvg+GjUWS5qT+XL+m33riqqnnf8cT/ThrdRvabzL/tJvhQf1o/WMp8KO/V
 nL4bWfe2gGrYjHLXcKtGaKqKa6eSt+6MVMIaoiUKP1pnLLAGOB4/T1WwheaSFVr4dN2q4x3opQ7
 pj4NGcF0G7/xHe7FKH56ovdEe+cgu5dXKtWnv0pQ3oeEUs/PwqMrPs3n9moOFyF/xGFBpcMtMgB
 DQd1hBfdMMELG+HW7mlkHvVBtFZK4ZWtpjtuly7u+gIHuXiRXvunLS3te1RBpnKOJaM/J89/+xk
 /SFLIQrCKhuZWW+MS6dBkXrdIhH5a7gbs60T4OfqkC5mw+/GckOJ+bS/b58F3j0okYk/wYT6Wmg
 7sOuU23m4jSWavepEVg==
X-Authority-Analysis: v=2.4 cv=bJgb4f+Z c=1 sm=1 tr=0 ts=69555cff cx=c_pps
 a=1nHe0GVLCxVa2bATzrft2Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=QJCE3FmpgMk_I34YA98A:9
X-Proofpoint-ORIG-GUID: jAw0hcQvCfRKD3CJVqTaU4vnvOLohSys
X-Proofpoint-Spam-Reason: safe

Increase the size of the XM and YM regions in the mock Halo Core
register map for testing patch blocks with 32-bit offsets.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
No changes since V1.

 .../firmware/cirrus/test/cs_dsp_mock_mem_maps.c  |  8 ++++----
 .../firmware/cirrus/test/cs_dsp_mock_regmap.c    | 16 ++++++++--------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/firmware/cirrus/test/cs_dsp_mock_mem_maps.c b/drivers/firmware/cirrus/test/cs_dsp_mock_mem_maps.c
index 95946fac5563..7fb404425fd6 100644
--- a/drivers/firmware/cirrus/test/cs_dsp_mock_mem_maps.c
+++ b/drivers/firmware/cirrus/test/cs_dsp_mock_mem_maps.c
@@ -23,10 +23,10 @@ EXPORT_SYMBOL_NS_GPL(cs_dsp_mock_halo_dsp1_regions, "FW_CS_DSP_KUNIT_TEST_UTILS"
 /*  List of sizes in bytes, for each entry above */
 const unsigned int cs_dsp_mock_halo_dsp1_region_sizes[] = {
 	0x5000,		/* PM_PACKED */
-	0x6000,		/* XM_PACKED */
-	0x47F4,		/* YM_PACKED */
-	0x8000,		/* XM_UNPACKED_24 */
-	0x5FF8,		/* YM_UNPACKED_24 */
+	0x8fff4,	/* XM_PACKED */
+	0x8fff4,	/* YM_PACKED */
+	0xbfff8,	/* XM_UNPACKED_24 */
+	0xbfff8,	/* YM_UNPACKED_24 */
 
 	0		/* terminator */
 };
diff --git a/drivers/firmware/cirrus/test/cs_dsp_mock_regmap.c b/drivers/firmware/cirrus/test/cs_dsp_mock_regmap.c
index fb8e4a5d189a..5167305521cd 100644
--- a/drivers/firmware/cirrus/test/cs_dsp_mock_regmap.c
+++ b/drivers/firmware/cirrus/test/cs_dsp_mock_regmap.c
@@ -157,22 +157,22 @@ static const struct reg_default halo_register_defaults[] = {
 };
 
 static const struct regmap_range halo_readable_registers[] = {
-	regmap_reg_range(0x2000000, 0x2005fff), /* XM_PACKED */
+	regmap_reg_range(0x2000000, 0x208fff0), /* XM_PACKED */
 	regmap_reg_range(0x25e0000, 0x25e004f), /* SYSINFO */
 	regmap_reg_range(0x25e2000, 0x25e2047), /* SYSINFO */
-	regmap_reg_range(0x2800000, 0x2807fff), /* XM */
+	regmap_reg_range(0x2800000, 0x28bfff4), /* XM */
 	regmap_reg_range(0x2b80000, 0x2bc700b), /* CORE CTRL */
-	regmap_reg_range(0x2c00000, 0x2c047f3), /* YM_PACKED */
-	regmap_reg_range(0x3400000, 0x3405ff7), /* YM */
+	regmap_reg_range(0x2c00000, 0x2c8fff0), /* YM_PACKED */
+	regmap_reg_range(0x3400000, 0x34bfff4), /* YM */
 	regmap_reg_range(0x3800000, 0x3804fff), /* PM_PACKED */
 };
 
 static const struct regmap_range halo_writeable_registers[] = {
-	regmap_reg_range(0x2000000, 0x2005fff), /* XM_PACKED */
-	regmap_reg_range(0x2800000, 0x2807fff), /* XM */
+	regmap_reg_range(0x2000000, 0x208fff0), /* XM_PACKED */
+	regmap_reg_range(0x2800000, 0x28bfff4), /* XM */
 	regmap_reg_range(0x2b80000, 0x2bc700b), /* CORE CTRL */
-	regmap_reg_range(0x2c00000, 0x2c047f3), /* YM_PACKED */
-	regmap_reg_range(0x3400000, 0x3405ff7), /* YM */
+	regmap_reg_range(0x2c00000, 0x2c8fff0), /* YM_PACKED */
+	regmap_reg_range(0x3400000, 0x34bfff4), /* YM */
 	regmap_reg_range(0x3800000, 0x3804fff), /* PM_PACKED */
 };
 
-- 
2.43.0

