Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8761D43E483;
	Wed, 21 Jan 2026 13:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769001776; cv=fail; b=D8DETwAnk2Vbxy58FcSSIfN7h301cTA36uV6mvbaleqqQqLMiAPKXHnUCJLXHYlamAYCxPFepGZU/+idwlIBF4AHEVPIZuegyAVDtxo7/l1Kw5nvByZfPTDxl/vtTGiem/zbyi6VIVs8H+YpvHbPeyBYEBeJR+NmMzuyH+eFr2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769001776; c=relaxed/simple;
	bh=dlsAFUs037/DAjSygpkh/tbUBK5nGY8y/7IJUoHtg/I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wexd9/manQjmDp7CWEuDY1rLWKW6imr4uM8Yv/QgZvwRjIVAIb+VEpiWWwMHRcG7xTB0renpQzA38ZeOrCqB0p22qtbJJRYWIvvTwrPk81OBnj63z17i+6LoiDy2SP1b3snMgbDubLrkWjBaObKeDIs7OjBJrf5eYffqDJUAjWE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=A2KNk9FV; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=eXE640eu; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="A2KNk9FV";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="eXE640eu"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L3px5H2708810;
	Wed, 21 Jan 2026 07:22:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=FjQSC+4fZwRVVZW69Tv/ceyg43PtXyPhV1v7oCPlz1U=; b=
	A2KNk9FVHhwjF6sAACcSlQL3d49tQ+dY40lM6K0zpaKTYKnA4ci9K1/frYYq29yG
	pU6XuUs6axARW7FR0I51iDbDzwbiQwqME5fe515SMeOPpFMjcN1lswrW5rWF/3di
	q3OBUQjBzPUtSqmVIXrghAtCkTrAOmuQm4xW35OB4Wqbv9MmRZufe8rPtsSFFIbK
	0WZZIhL8Lipl12CD5oDx27UNnz+uZfvQ2+UNIArcmAPtdYExcZCZks0DwgfmVwW2
	POYTfAJQ1J5YuzV4thmbcSjsyNVIiw56XmEthYx0hTQbZzf1r7GsR3OLEnTwrPf/
	rtO706yDW5pnl/OwPTTvRg==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020089.outbound.protection.outlook.com [52.101.56.89])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4br8q1vnxv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 21 Jan 2026 07:22:51 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=anFuZSDto3B6WVMNb2VEmowKBfPwiJgkO+3Lu46XX1uxmkIByhdlzwcqkdgfuvlhs0W2LBx/Z1KFXpQBPZi+KtJ6Wc0qsyavoXW5N530h1ZFe8gkMnTAvoQCVN0Gs4wk5gLjapYM4iqG1oiOWO/EiL9KPraaHg7BVmefCxwxC3YpD438tB6IPZy1OQGBt5IeX4PEtMh94NY5WMxjEedQi9vqKX6DEljZJKT0ur6BHXBv//05vy9mZyy62K7PqtfQ5x+ADD4itf1VBObsU+aoQvo2g3nY6x61qG1Qk+dqBJK+9CLlaAFmZUX2nh1qYqapC8JTyDnO38nHgrdyfLjpHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FjQSC+4fZwRVVZW69Tv/ceyg43PtXyPhV1v7oCPlz1U=;
 b=MX59B0BY5f8zy9z0+/dxu1IQW6toFrYNVBOT6BpvVPAUHzJL0eqgejRHGbT8JhETgN9yFmvGRarZSGqkAexjAXYq4SOV7xy15npMvBfXpsrVftLlUuAa9xXb90X7/SjQPhUsRPbkwewYHfPNDre94nUj3k1jlD9wPC7U0PicZgZ6VrGy75EsTCfkQ2Kp6cVDTpXUj1P+USaKCVEeGTvf4bhCb3BzPPKR/T+3XVUKyISBqwXT34Ck4cgZGbTquBnlZl6VYE3W4XOr63/9LhJ1Im7/USZg7zvdwlJmKfYzYGxCpD+mJAs8wLVEWzRfH7xQJHLerCERV8LOtvn651ObgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FjQSC+4fZwRVVZW69Tv/ceyg43PtXyPhV1v7oCPlz1U=;
 b=eXE640euO43TjtZXKl6Dwewu6b6iAcbp+4+5ODWzWvvRPqcwCJIkKskT97JfM/byNRLgJNGIAlSXhgJOrGFI9dEHbbAsTMyQYN+A3z4NJycVqrCQPvplQlSDGCVgNxxMoZ8M2yc/xZ+iL5CVppX/MpgAN05CEHxTBauqCRLvffQ=
Received: from MN2PR20CA0049.namprd20.prod.outlook.com (2603:10b6:208:235::18)
 by IA0PR19MB7677.namprd19.prod.outlook.com (2603:10b6:208:406::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Wed, 21 Jan
 2026 13:22:47 +0000
Received: from BL6PEPF0001AB73.namprd02.prod.outlook.com
 (2603:10b6:208:235:cafe::46) by MN2PR20CA0049.outlook.office365.com
 (2603:10b6:208:235::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Wed,
 21 Jan 2026 13:22:40 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF0001AB73.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.4
 via Frontend Transport; Wed, 21 Jan 2026 13:22:46 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id EC68A406545;
	Wed, 21 Jan 2026 13:22:43 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id D979882024B;
	Wed, 21 Jan 2026 13:22:43 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 4/5] ASoC: cs-amp-lib: Add a Kconfig symbol for enabling test hooks
Date: Wed, 21 Jan 2026 13:22:42 +0000
Message-ID: <20260121132243.1256019-5-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260121132243.1256019-1-rf@opensource.cirrus.com>
References: <20260121132243.1256019-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB73:EE_|IA0PR19MB7677:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 20bd8243-1522-4cd5-0111-08de58f02ad7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|61400799027|82310400026|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZXhA/fJI6kRPatGmsCxwelJ8M8cajUNH9ebJqhEy2rdPqMavHIQcWQXLpzqc?=
 =?us-ascii?Q?qZH3eSglGG7qfMqOaLIHNrGdh2j8hCIdcql6EgrBid4YPH4muw+2EYBIa1y9?=
 =?us-ascii?Q?K0mDYG7wxeMQhFH2aQXnTcTrk7LGhqI1VqXzVt+QzSWk8i8ZeFRKUeJnxNLY?=
 =?us-ascii?Q?mWgLnhqZ2Daz45Q/6DYGD32DNUCSHxFr/9GMCZIRrm5T+IT2Q+cIMD5UHOuW?=
 =?us-ascii?Q?PXeemYPMkQqmMC8zk8SoBqN2Ii1JtwP/eask/ulgpoU0HNiD4FvPPHRcd3ny?=
 =?us-ascii?Q?KhKg13ZadbcuiAPHYNnvm+7dy/Q5N6SstqmlRqKSiS0oVlv93QkOCcqsd/75?=
 =?us-ascii?Q?dXPVvVwS3ygpw2xzHW1/U+K82ux0B6uMPM9oTCU+GCIIzJnPScw/6Znzdept?=
 =?us-ascii?Q?iml884jIYD9ieeeHhllqgkScfyKT/gxbBd3wEJc77hzMGrjYfg9gjh5bU8Iu?=
 =?us-ascii?Q?JfRpaCMnGFwcU0S7oUPHBSm/kdVmLA3LKTQGQtlGJFwLZf6EU+AR7kowuygQ?=
 =?us-ascii?Q?mKk2vlp7BTQKO0f2ZLCyAUjOF+POr0NKNMV2uj/W2QGzgCc9/scGmEDP1uhQ?=
 =?us-ascii?Q?aygrrVGw63bQXm6iVzF8edDu9WEyiLICyaYw64VzNlbxleydvL5Tz+8yWLwU?=
 =?us-ascii?Q?bzagNqLb8esSPvynGbzr49o9kJVbsxs9PP5KN8iVI0tMSWyxgk/nmWYw5yvm?=
 =?us-ascii?Q?v44qeXWFIJL3zOs+TcTCeoaX4AVtWH9CVkMSG1meRA/lDCRe7d2CpYIB5HVt?=
 =?us-ascii?Q?De5bRzA4TRc/Rl+E0Jdo7N/XzEs9GP6+hq9P+r5cgMuVtyyOnbHKkJ7/XgQV?=
 =?us-ascii?Q?Ilroh7Ad308S0wBkAtcgXxRELXmDPRg0mUYjvitQ5tbb3YCNg23T/xD7FRqD?=
 =?us-ascii?Q?AmlyfVfIQBt4aAqs5dg8nmx6/QpnGFZ9fj9svK3TrHvTL8noRbkxJRoD9WxQ?=
 =?us-ascii?Q?VYpjcYEU3v8kVQoGeLsxtEMlsT1iB8zlgOgxgd8/OH/j9m36J4sUIFSu8IK/?=
 =?us-ascii?Q?Usjholthpi45DxUyVaHO+J3d0n5NtOZzTlGG1DmgkH1YJHpSQhbIZVGnluKm?=
 =?us-ascii?Q?6EOA44BPyy+pH8d36NCyGF8i607VLJxDgs9BKAEz0cB9CBqJMfNmdh9yKS4h?=
 =?us-ascii?Q?8whhTWHuLLcVy1H4zE63c9QLy4zXPtya+KZTAaZ4NSpcDN75BnIIN5pqwbEX?=
 =?us-ascii?Q?TDEtsUBRt/OGDJutCrAr7XmizIQp271T6bqGLOkJBFSdjEFniH8OHHP3lQHQ?=
 =?us-ascii?Q?hOHrNkBCWaqnwqnt2te4vRk9Ah0f4Z8x865KmK1BrTvM3Dmpu0DYN40FTA7A?=
 =?us-ascii?Q?CxKzxm/2ubTZclSx0BdE5i63RSpOel34uPj7L3kV6Y3tm8zg56czBXG9V85H?=
 =?us-ascii?Q?sGFnVSW5ia7GtacPNxUhAw9X25edNWNAQtMCPh4tSUjer5/S1K+d5nwbYfJS?=
 =?us-ascii?Q?EP7Ob7Icx3w23L64HK3UrtVm1Mfcgj5hXprp463kaPnYQ8czaoKxUA9yRbS1?=
 =?us-ascii?Q?+RyRvo0I1N484z7GojHxCu/LcKhkanpFrjzeCaxzchIrQbu6EPJN1aRIH9AG?=
 =?us-ascii?Q?VXw9uuMnxYCPPYOirKgRYm+p0eTM4zTcea5CRv+OIjvKbE+Zp8uzGhydKsaf?=
 =?us-ascii?Q?/gV/8GcjPndhGIGMKBKTvHHauAjhp1tvGAW28idLm0wBHykpWw1LoxKc9sNr?=
 =?us-ascii?Q?WqUMMw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(61400799027)(82310400026)(54012099003);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 13:22:46.5144
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20bd8243-1522-4cd5-0111-08de58f02ad7
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF0001AB73.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR19MB7677
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDExMiBTYWx0ZWRfXxsvndpq9Ui5c
 Dk2xurbXfhEWsUM9xVZr8zSLU6/Bq1WB3/MjBc7xcsc29rWrFyV3ILTlO2HqmXUl9VD/tuR7EV5
 U/vX+uGxm7m/Q++QTuacpzNuojIZ7R/5EHb+zJ6qZ/zAEXuMgcnOoN26UNdhuR93gheclw4n2XQ
 o7cFJBUx40RJOxExLSJb4pCpGpEQrewPZXUv07+4+lwEkWNjRAZhJXFm2L87ykHyfICsufQlxmX
 sZbq4/VnlCwdNN2i4jSIYrdx7IENVf2tZufMfMaq+8eq5OtuwdR7+hhNzGQTuyHCAgmAoyf9zWy
 8pxQBh2lycoEfr5+YqKS9ROKDUCDuNZWBx1ub4KhYtFR7hQGPwWgroyzndxeDBE4Le9mwBO+su0
 jGWWBDTstjVmQkeOEiDvwn7KhdmDHNhkNWvUVBVj7zE9LAFuupt4M/xrJTrslll0lQ+TIKytk3g
 WO7gD9r4DlsiT24Epyg==
X-Proofpoint-GUID: hP6PQIyX0DLfe6mPOxuDjfEPC_6sNsf0
X-Proofpoint-ORIG-GUID: hP6PQIyX0DLfe6mPOxuDjfEPC_6sNsf0
X-Authority-Analysis: v=2.4 cv=JbmxbEKV c=1 sm=1 tr=0 ts=6970d32b cx=c_pps
 a=BKqWZN8aUWREUN+CsN3l9A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=1eBEuZX1URBboTtWnAsA:9
X-Proofpoint-Spam-Reason: safe

Add Kconfig symbol CONFIG_SND_SOC_CS_AMP_LIB_TEST_HOOKS to enable
calling into functions that would normally abort because of missing
EFI functionality. Before this the code paths were only enabled if
the KUnit test for cs-amp-lib was enabled.

This change allows KUnit tests for clients of cs-amp-lib to install
redirection hooks in cs-amp-lib.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/Kconfig      |  5 +++++
 sound/soc/codecs/cs-amp-lib.c | 19 ++++++++-----------
 2 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 90f09d4bdf8e..21d5b79f079d 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -786,9 +786,14 @@ config SND_SOC_CROS_EC_CODEC
 config SND_SOC_CS_AMP_LIB
 	tristate
 
+config SND_SOC_CS_AMP_LIB_TEST_HOOKS
+	bool
+	depends on SND_SOC_CS_AMP_LIB
+
 config SND_SOC_CS_AMP_LIB_TEST
 	tristate "KUnit test for Cirrus Logic cs-amp-lib" if !KUNIT_ALL_TESTS
 	depends on SND_SOC_CS_AMP_LIB && KUNIT
+	select SND_SOC_CS_AMP_LIB_TEST_HOOKS
 	default KUNIT_ALL_TESTS
 	help
 	  This builds KUnit tests for the Cirrus Logic common
diff --git a/sound/soc/codecs/cs-amp-lib.c b/sound/soc/codecs/cs-amp-lib.c
index 9f8c99dfb798..f8c7f594d54a 100644
--- a/sound/soc/codecs/cs-amp-lib.c
+++ b/sound/soc/codecs/cs-amp-lib.c
@@ -211,7 +211,7 @@ int cs_amp_write_cal_coeffs(struct cs_dsp *dsp,
 			    const struct cirrus_amp_cal_controls *controls,
 			    const struct cirrus_amp_cal_data *data)
 {
-	if (IS_REACHABLE(CONFIG_FW_CS_DSP) || IS_ENABLED(CONFIG_SND_SOC_CS_AMP_LIB_TEST))
+	if (IS_REACHABLE(CONFIG_FW_CS_DSP) || IS_ENABLED(CONFIG_SND_SOC_CS_AMP_LIB_TEST_HOOKS))
 		return _cs_amp_write_cal_coeffs(dsp, controls, data);
 	else
 		return -ENODEV;
@@ -230,7 +230,7 @@ int cs_amp_read_cal_coeffs(struct cs_dsp *dsp,
 			   const struct cirrus_amp_cal_controls *controls,
 			   struct cirrus_amp_cal_data *data)
 {
-	if (IS_REACHABLE(CONFIG_FW_CS_DSP) || IS_ENABLED(CONFIG_SND_SOC_CS_AMP_LIB_TEST))
+	if (IS_REACHABLE(CONFIG_FW_CS_DSP) || IS_ENABLED(CONFIG_SND_SOC_CS_AMP_LIB_TEST_HOOKS))
 		return _cs_amp_read_cal_coeffs(dsp, controls, data);
 	else
 		return -ENODEV;
@@ -249,10 +249,7 @@ int cs_amp_write_ambient_temp(struct cs_dsp *dsp,
 			      const struct cirrus_amp_cal_controls *controls,
 			      u32 temp)
 {
-	if (IS_REACHABLE(CONFIG_FW_CS_DSP) || IS_ENABLED(CONFIG_SND_SOC_CS_AMP_LIB_TEST))
-		return cs_amp_write_cal_coeff(dsp, controls, controls->ambient, temp);
-	else
-		return -ENODEV;
+	return cs_amp_write_cal_coeff(dsp, controls, controls->ambient, temp);
 }
 EXPORT_SYMBOL_NS_GPL(cs_amp_write_ambient_temp, "SND_SOC_CS_AMP_LIB");
 
@@ -611,7 +608,7 @@ static int _cs_amp_set_efi_calibration_data(struct device *dev, int amp_index, i
 int cs_amp_get_efi_calibration_data(struct device *dev, u64 target_uid, int amp_index,
 				    struct cirrus_amp_cal_data *out_data)
 {
-	if (IS_ENABLED(CONFIG_EFI) || IS_ENABLED(CONFIG_SND_SOC_CS_AMP_LIB_TEST))
+	if (IS_ENABLED(CONFIG_EFI) || IS_ENABLED(CONFIG_SND_SOC_CS_AMP_LIB_TEST_HOOKS))
 		return _cs_amp_get_efi_calibration_data(dev, target_uid, amp_index, out_data);
 	else
 		return -ENOENT;
@@ -647,7 +644,7 @@ EXPORT_SYMBOL_NS_GPL(cs_amp_get_efi_calibration_data, "SND_SOC_CS_AMP_LIB");
 int cs_amp_set_efi_calibration_data(struct device *dev, int amp_index, int num_amps,
 				    const struct cirrus_amp_cal_data *in_data)
 {
-	if (IS_ENABLED(CONFIG_EFI) || IS_ENABLED(CONFIG_SND_SOC_CS_AMP_LIB_TEST)) {
+	if (IS_ENABLED(CONFIG_EFI) || IS_ENABLED(CONFIG_SND_SOC_CS_AMP_LIB_TEST_HOOKS)) {
 		scoped_guard(mutex, &cs_amp_efi_cal_write_lock) {
 			return _cs_amp_set_efi_calibration_data(dev, amp_index,
 								num_amps, in_data);
@@ -720,7 +717,7 @@ int cs_amp_get_vendor_spkid(struct device *dev)
 	int i, ret;
 
 	if (!efi_rt_services_supported(EFI_RT_SUPPORTED_GET_VARIABLE) &&
-	    !IS_ENABLED(CONFIG_SND_SOC_CS_AMP_LIB_TEST))
+	    !IS_ENABLED(CONFIG_SND_SOC_CS_AMP_LIB_TEST_HOOKS))
 		return -ENOENT;
 
 	for (i = 0; i < ARRAY_SIZE(cs_amp_spkid_byte_types); i++) {
@@ -743,7 +740,7 @@ static const char *cs_amp_devm_get_dell_ssidex(struct device *dev,
 	int ret;
 
 	if (!efi_rt_services_supported(EFI_RT_SUPPORTED_GET_VARIABLE) &&
-	    !IS_ENABLED(CONFIG_SND_SOC_CS_AMP_LIB_TEST))
+	    !IS_ENABLED(CONFIG_SND_SOC_CS_AMP_LIB_TEST_HOOKS))
 		return ERR_PTR(-ENOENT);
 
 	char *ssidex_buf __free(kfree) = cs_amp_alloc_get_efi_variable(DELL_SSIDEXV2_EFI_NAME,
@@ -849,7 +846,7 @@ static const struct cs_amp_test_hooks cs_amp_test_hook_ptrs = {
 };
 
 const struct cs_amp_test_hooks * const cs_amp_test_hooks =
-	PTR_IF(IS_ENABLED(CONFIG_SND_SOC_CS_AMP_LIB_TEST), &cs_amp_test_hook_ptrs);
+	PTR_IF(IS_ENABLED(CONFIG_SND_SOC_CS_AMP_LIB_TEST_HOOKS), &cs_amp_test_hook_ptrs);
 EXPORT_SYMBOL_NS_GPL(cs_amp_test_hooks, "SND_SOC_CS_AMP_LIB");
 
 MODULE_DESCRIPTION("Cirrus Logic amplifier library");
-- 
2.47.3

