Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D05472789;
	Wed, 15 Jul 2026 12:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784116918; cv=fail; b=g9NUmtFSciBrZtFaSlB2Y5e9Hc05UpYx2LQINPJsKS7vQO35Xwda9TvbsJPklSGX7ObGtshqVe2IfNf+81r+zLsluVx5WyiMI8Ey4HrtO8r/P8OyP+H7s1eJN5J3BpG/fTh7hiwRzk7x2YLHJxST80F2gmn4Ai/CpWwijhT1MiM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784116918; c=relaxed/simple;
	bh=xf8/4DPgbTXEdbEMk5GI6rPO67eZGyh6Bc3zeZwN1y4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g/hwvfrw5lCmlnMR0nQIwQu4b96dWIh8Lcvn5Fc+wIG3SLnEFVZhGDtkMKyOkO+WqAAm9jWFpMxyrjV2BoIy7/ZR9MoefAW6aBzhB0YdiJOa2UClzmYyJratfLBAKuA5gMDPy9lEIIe16xzcyDBFoYDlNh0EoFblpR0EpNaMVMM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=o7Ay6xNE; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Juo4Hy1Y; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="o7Ay6xNE";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Juo4Hy1Y"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FAxlmk920013;
	Wed, 15 Jul 2026 07:01:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=BsFns4vvyZa4oEN+aY7S9n75xPSMiJwFsJFCMH49H8U=; b=
	o7Ay6xNEBl3DhKHL8i6d61uutWyUxg8ReIcAcc0O6qAk0PrCACCoIzI6RU/9ssRH
	O2fjC19gK0TTtd5MVZ5qvV1q0rw3MrqOGEs+ZwEA9EDi/ovCAnvmJd+DoHW0+4q0
	C40QQa4UmBYhJH5ByIR0L2NPGRo5TBhrTWaitENIzDIX+HV/fdtDyZTbSGk/SOFW
	Bn9Hx/wmpk9KdJbslfh7uB+9qqOc8pQ20SDu7v8ne4BkiK6wMjjZOq7x+6eN/JPx
	YS0OVAUHmADnEGzFI2eqJTAynasLFBxClEdtsy6rUNsB3Ifr9euFE8no2ulBF1CA
	VdrDt7losgN96QNKjmhpaw==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020076.outbound.protection.outlook.com [52.101.61.76])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fbk7vw9ss-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 15 Jul 2026 07:01:42 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wtXNP9dFzigGP3NMGT7AtFmMOKAdeEmzTX9r+lbtsxAYRwrj7nHnEFkZyqnRdStqh1YGMkp7ObD024++ks0DOYuCRSBcE5LqRu8wlVWHF7dWbEip/5xWk3ZOJltZ9/TSXs9R3YdEAUk8nCbaLs8S49xRnbbhuGka1FiN/xUEXlpHAOJnNGfv4M+5+l7I0K5/bYRUHQ8WNrl7yRacE5ke7uKBh4sOK3qpK4swEE0ij7dn/VqxUzHEH+kHv61nniGSj4lTKn0FBFx1slLUqPhNvZQ7AXJKYatx18fuqLX19nxlqpAyDVjMCXZgyE7Ydw9Tm785ME4bhqdkaH1bXOIFvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BsFns4vvyZa4oEN+aY7S9n75xPSMiJwFsJFCMH49H8U=;
 b=lOXCKkjOkPALGZr+OaRvQbDzGBiZd+LJaEf/9Pc2iKx+gxTkGwQdCpFd4xADPkzzdvNfI6Dre4vICFC7kGndXJeENoFVQqZ1yM0pzhb2W+hiXUYMH2fEtkpnArAoU2kbS2Ar87ONXOI8qYadT+nFbcNlh4rRwPjFMG4fHobW/RFPUK29/YGEimqTlqYRPfdo3PEsEfRreqE4m2YUPsR4l23A6gh75OCHzI7rnv1mln0Ba42DgyViBOVsI/KstJtTd3yPlyd53NYK8nXKZHok8Bt9XCH9W21y0AsSZjxosXc0zgKipc6t2iJIovRilymGCxpvAhfl/NICaevsPjcBxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BsFns4vvyZa4oEN+aY7S9n75xPSMiJwFsJFCMH49H8U=;
 b=Juo4Hy1Y0ZIyZ2yRGo8apkuS+z2wvwHPCY/3V2ColjwfAL6nuJZ7ViUbKGgjI5DZbc78KxnlcOwzJL+lhglGpUXNA5+2MnF+Fiqi1OOIAiFG5xgDYuTIgBNmtJIncYdBLf7zeYe2xEL+ZzV6zlZLIuEdRzzJ4mP5B6Jx9Rn39T4=
Received: from MN2PR01CA0055.prod.exchangelabs.com (2603:10b6:208:23f::24) by
 BLAPR19MB4467.namprd19.prod.outlook.com (2603:10b6:208:29b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Wed, 15 Jul
 2026 12:01:39 +0000
Received: from MN1PEPF0000ECDB.namprd02.prod.outlook.com
 (2603:10b6:208:23f:cafe::ab) by MN2PR01CA0055.outlook.office365.com
 (2603:10b6:208:23f::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.12 via Frontend Transport; Wed,
 15 Jul 2026 12:01:38 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MN1PEPF0000ECDB.mail.protection.outlook.com (10.167.242.139) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9
 via Frontend Transport; Wed, 15 Jul 2026 12:01:36 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 59685406543;
	Wed, 15 Jul 2026 12:01:35 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 46060822542;
	Wed, 15 Jul 2026 12:01:35 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 2/2] ASoC: sdw_utils: Add codec info for CS35L62
Date: Wed, 15 Jul 2026 13:01:34 +0100
Message-ID: <20260715120135.939280-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260715120135.939280-1-rf@opensource.cirrus.com>
References: <20260715120135.939280-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDB:EE_|BLAPR19MB4467:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 963f247b-1171-4e86-4609-08dee268d27c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700016|23010399003|10067099003|18002099003|16102099003|22082099003|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	SUlya1Y+yTQRnZ0dpeVFamhyf9pN+NbFcf63zGxRgAl8KOz4eNMzRqlK8TGdARNCG6yg4NHxIa6eY72oOra9jFWUYl0iHviHFesVdxi5xAnMevCiD/LgJId4EHTUBGt206TTWtW4KTuWVrVKgMmqlYaeZ9dU8S+b4NKXFbof04MbBV3ssl/UMf5MEr+DpHm4Q330Lt0yrL1KM+OuXrwi9/1Y1lRJnvdJm7t0f4JjJQrW6ifGpHELyswTViFpVxghtg0V2dagXVe2YhhZTcKPirH06WZMkyTvGRh3/E8aoFC7VEc/ZS0J8zE6wY/UTSlN7HBwyOzOGwUHxEC9Mv5QT16van4faMkbty1eujYdw1mCdUlZzaEyYaS4RRQX0aLeg2zZEY9A5jB81JQiqvl2SiCD8dkO8yBDLKDWpoAk/3+GWKOFURLqbm5iAuObZCmQ8iJxcFzqR6vkaNuQQd+DQaN7jNGw+e+KltXUuMpEy6m9zgpkcqw0YaUMa6e7hKUibqYX8fcyDwiFbTeZwwyRqMtPfM07gFsrco4wyjqNy2lfzwdTsZE6bNx2ezcbyu1X7EzFbRQB0eJ3JsYwC0HR7ZNM4cBKn5mXu7Zr7QmD1R0vbQq5pHDmVT7frrj98OhZAPLcnz2d8U/aJ0HJp3vXpBPP5596a5BxAJgss8lgHOHvV6TF2fnrmgNK7+LGvvMaX+mIyJOmdWlBbn1YH4+sSg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700016)(23010399003)(10067099003)(18002099003)(16102099003)(22082099003)(6133799003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BEN5a2xJ2hmo56zLiWuh8ffPaFXgYfofQt/S0b0cgAVN45HRQ0X2HcZi6lrrLS1CTfSq3cy3y0Viim+0J6sWY84b210DcR90ksRulBm+cgv7adhJ6jSWYElpa1ncQZsoeS5tHXIbuKLKA4Fh7P5gQpM+9M6DcL/sQmw/w9R6qn8+QrTUX7EXh2mYLla6EFNWZQONolS0m8eQ+1lhqYrWP24d5sA0n31/bZG3032PGiQ5mDbdDCxU1z37gBnzTLVODEnOKUCyK2U7lACpGlgSs/AVfnS7vwbEldcChpv18nKbuLGMqv6gG74q6oyQiqxXVd8EVwqJ7pqhXNf1e+1ovEst5zI82Bdt7dDG46jE2b3hE2NfklubHpXv0RydPBHhKmxv4hlq8Ki9fZ7ARXq6fzpWJFeAmvWzyfjHje0dCSVh9QDwmKC/F3AaUB1xaAK5
X-Exchange-RoutingPolicyChecked:
	slLR/eIIL7Z9XUMBz9EfIZiWqSwoQRlfobOqarOM1yTi/9kTHb4U0Q9pauQYM1ZjrYSMNYx4mz3Z7foJPlLRjJGT2IXrAN1jtpK0PO3ZPo7ShDRwLAeZM2Vsnb1ehypB2ngO+lF4USJclexUtTh8yzVsoklaX0orL/A0g63E2rN1m9TD4zXrElYqiS2TbXWeLcKhYlwNxveMYfvqrgeWR9KMk3iIKNsedd8HGsOcAi4jkCMKd9k6nkRp3gsLxDjUbsoa9srr18vnSGjfze/nGNqdr6H8jdyzLQLalpsD2D4AFXa9L662OLohXQhuw36hUxmOZDeVMDG2SioGRyjkbg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 12:01:36.6969
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 963f247b-1171-4e86-4609-08dee268d27c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MN1PEPF0000ECDB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR19MB4467
X-Authority-Analysis: v=2.4 cv=V71NF+ni c=1 sm=1 tr=0 ts=6a5776a6 cx=c_pps
 a=2vyhS9wvvmK9UI+0OhD4Kw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=RAioF0-LDSMA:10 a=RWc_ulEos4gA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22 a=w1d2syhTAAAA:8
 a=mlZLeVKwfFaRoF9MOUwA:9
X-Proofpoint-ORIG-GUID: r9kWu4ddECGV8wzL3Duck39o5dk6HW7t
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDExNyBTYWx0ZWRfX6VRxtrf8QWoh
 gaxFCD1itdu6DmsxdfY1szrF7jEcy16PRVUbkfzRWiiN9UD3HJnj0sSGN7tkoWCUcKbP+t+iwYx
 9vBFxTfVhI1oJ4knW6+qU0hjlkG2hgM=
X-Proofpoint-GUID: r9kWu4ddECGV8wzL3Duck39o5dk6HW7t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDExNyBTYWx0ZWRfX/KpmaIv4GTzV
 6OQdlDRrSwRKjJ6P0CpUcu7u3M3uLpY608lrIDt+fXhmxP9dnxnTfPLP3FfxfjlEgpCKm2DdNuy
 26bmhGbiRGYxWHp0IpEyNcAQorqGMBR1u6JoCQgfoIS5kFWDUCq7HuTZ9B1VDJ9c8L4oKYboJRr
 9q4TuR75C5+4l0tSwsIM1X6VmxtKztqI9LhkhTvMYtenrvV/hFzBbWs48e59dlu5vaNQFtFrIbC
 pJsx0e2ViWiCgpgTCtvaEajg0EkxrPevZCP5SVoBpDsfoZPHDblKsRTn7EQyqql8ZKR8g1Q7GgF
 A3krGaNIzFMT9FIZTOHirD+xbo2HCJjdF/OCAeZLYmsTrtoB0tZzhvx7ftXmRLu3hKCuZ/X2Pum
 vtkSXgCh+imjht/yfXWO5iGRJeGFQbPtbYOReEF7E9cmGzFKFpYftP+SkmP2FvafEjTGR79pbB7
 kE9fb0tz1BiHh9648mQ==
X-Proofpoint-Spam-Reason: safe

From: Stefan Binding <sbinding@opensource.cirrus.com>

CS35L62 is very similar to CS35L63, and uses the same driver, so we
can use the same configuration.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/sdw_utils/soc_sdw_utils.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index dd2cc57059d6a..d4074309fa81c 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -834,6 +834,35 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		},
 		.dai_num = 2,
 	},
+	{
+		.vendor_id = 0x01fa,
+		.part_id = 0x3562,
+		.name_prefix = "AMP",
+		.is_amp = true,
+		.dais = {
+			{
+				.direction = {true, false},
+				.dai_name = "cs35l56-sdw1",
+				.component_name = "cs35l56",
+				.dai_type = SOC_SDW_DAI_TYPE_AMP,
+				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
+				.init = asoc_sdw_cs_amp_init,
+				.rtd_init = asoc_sdw_cs_spk_rtd_init,
+				.controls = generic_spk_controls,
+				.num_controls = ARRAY_SIZE(generic_spk_controls),
+				.widgets = generic_spk_widgets,
+				.num_widgets = ARRAY_SIZE(generic_spk_widgets),
+			},
+			{
+				.direction = {false, true},
+				.dai_name = "cs35l56-sdw1c",
+				.dai_type = SOC_SDW_DAI_TYPE_AMP,
+				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_AMP_IN_DAI_ID},
+				.rtd_init = asoc_sdw_cs_spk_feedback_rtd_init,
+			},
+		},
+		.dai_num = 2,
+	},
 	{
 		.vendor_id = 0x01fa,
 		.part_id = 0x3563,
-- 
2.47.3

