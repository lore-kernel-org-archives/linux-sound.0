Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1E031B832;
	Fri, 19 Dec 2025 10:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766139353; cv=fail; b=g8yk/93K+WPl3mV81ENHwDYO3IwPm2C8ZVSPnkLb4o142k6hYgnFaBRXVtKdMYUHY0noaEoubMyaciBtBNcOZRebs0gOAox5BJWG/OGtghSguMCkD1af2FjiyG6qkxWxPjqGbNQA86ejAbL1LHpquts4xC4h06H1pHuDZAWoCUs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766139353; c=relaxed/simple;
	bh=cZ3NipTLOhg0/5+/d3aPEk68p1BDqK0U16MeoNxiN4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o8KcfIr624HzXWwe1xEANEoZlt32FiByR5JG/iWcxgnhwWThTLzZ2rYIkMeG0jMmDbtehjkIHGLzV0JjenUM6vKbsmiq0LsTLauJq9AcLw6Wi2FV3+cqRJYTr5Nw1GsuddhIbp/dFc0oXHRq3gwh6IurNlNc65+xeq1zRfUVEFc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=QlNuO2Mx; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=fMt7YXtG; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="QlNuO2Mx";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="fMt7YXtG"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ8LSax1649602;
	Fri, 19 Dec 2025 04:03:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=b0aXp0jwhgVIxR04Ho5HbsFe1bhF7lhPjS/eDICxczU=; b=
	QlNuO2Mx8l/B1225l7j2vD9VK/Z3Cifi2HRe6xzswZql9AadM9uq+a9txPfd2W7m
	ryiEr4yN/eOJVhlGboIht10JHHI7CcpYDgoRW04YT2eaH5fBGBsB4xr8LPP2oSdm
	a1vCnLamgCqHFpj8NwhOWNe9CIGC+wJ9x3/UMyPTiCixSArNK/JbScIu0BFctSMk
	OreldCMcPfMhk6IR02v36g2XP5XYzwjY4XetyhSYESVOSHj6L7wRIWZrbi/++Iz3
	PGL5LfhIYEz8o9Gi0lQsn0wrYgQzN/l4Fc/vwI0OTMd9tjCiMylLjCJLg7lrkzib
	+v23KgQvHvtVmkCu+MjeqQ==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022078.outbound.protection.outlook.com [40.107.209.78])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4b4r40gp3h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 19 Dec 2025 04:03:05 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qmEXyuGeWtcyjWucCk0TKve9C6JNvho9IZhrPV6YYnjn9E7M3vJELwEwSVjy95R5Dj3DfVK0yPaJpemFL7ZG6NJWPo2pcrAuMcBcN/TPnuPSwXlde3ixEFt5KMkg26J8zq+RvuzXfjWlD35yPllVuVCkb3nU7hgahGJfOO2gxpgva0lqaeT7vUOoN2ZTKnvLYorUNhIVsV4aX03YSUXjKnQhIozcVAHnbeYwAk7/fEhtvGf46WV4QAnq9YEtdFPD0/EtE6m8/qxKz7B6C2TKZckOt2d6Wk31BmHHnuG0W/7uJlHfAJYrAD1zhU2JwHgruoACR5AFp5hbXMcK77NgVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b0aXp0jwhgVIxR04Ho5HbsFe1bhF7lhPjS/eDICxczU=;
 b=rvWkeu5zBIwt/9tjq7kPnbMbkHP2lUCljBp1fT+KmcmLw6yWBRqv+y2SveVS5uAsHlvmGXd/CrK2m2PK7klNVig/9IY48LIEOaybKFZ2w+UTWjirrLc+4p/vchNAEsBNuFfzMVZ3gGbjGCfct3ij0bQ20biy/WhDMRv+E1dVFacvMIOv/vp/AgEDP8wTeL5+W0++N/XzjTMaZCxxdY3M9fpu4+CDaFxmTWCtabSXrQaZ58UM/22uWT1y8BcLuouuJ1ePxg0CTYkheKS5jwv6qq6D756djY72D2YpiYsyDgYyYUXZkYNMDa0M/iL9HzX4XBMez/lhfMR+K65+y7Ak9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b0aXp0jwhgVIxR04Ho5HbsFe1bhF7lhPjS/eDICxczU=;
 b=fMt7YXtGJXMjIa4SZaOSEE609lbIzfdLfRovvPtyU0Fbyrpv9XKUXK6bm1Ntws3UQfoRho9kxWy3CSx8V6G7glWEtvuzEY1aAOXIBwz4jt1RNHmyGctWKQ5hug98PzaKrsJm+0xY+vOME4kqRqh/UsPRug219utQe3KHtiXY9qE=
Received: from DS7PR05CA0085.namprd05.prod.outlook.com (2603:10b6:8:56::15) by
 PH7PR19MB6064.namprd19.prod.outlook.com (2603:10b6:510:1df::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6; Fri, 19 Dec 2025 10:03:02 +0000
Received: from DS2PEPF00003442.namprd04.prod.outlook.com
 (2603:10b6:8:56:cafe::e) by DS7PR05CA0085.outlook.office365.com
 (2603:10b6:8:56::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.6 via Frontend Transport; Fri,
 19 Dec 2025 10:02:59 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS2PEPF00003442.mail.protection.outlook.com (10.167.17.69) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6
 via Frontend Transport; Fri, 19 Dec 2025 10:03:01 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 1AC36406545;
	Fri, 19 Dec 2025 10:03:00 +0000 (UTC)
Received: from ediswws03.ad.cirrus.com (ediswws03.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id CD6BB820258;
	Fri, 19 Dec 2025 10:02:59 +0000 (UTC)
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Lee Jones <lee@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com,
        Maciej Strozek <mstrozek@opensource.cirrus.com>
Subject: [PATCH 1/3] ASoC: sdw_utils: Add CS42L43B codec info
Date: Fri, 19 Dec 2025 10:01:53 +0000
Message-ID: <20251219100235.1247053-2-mstrozek@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251219100235.1247053-1-mstrozek@opensource.cirrus.com>
References: <20251219100235.1247053-1-mstrozek@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003442:EE_|PH7PR19MB6064:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 58a4c036-d85f-4933-b3c4-08de3ee5cb65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LqaxVMOEyIb4qYQgowlb0Z7HE84Tsg78UJT5hSDP6+wTEhJexVkJNS00UHpf?=
 =?us-ascii?Q?6vl4X3CL9mLRVJ1qXPSpjMpAzkWnKDFhGjcqqHNWckXbZr7XqLiN9tbrvcjS?=
 =?us-ascii?Q?7l3DiDfyBgklPkv5uyre+vUln3AXlmXD1ST8I2Hz/VfbVgabAGZZaDJklG7P?=
 =?us-ascii?Q?Ad6l7etLsQBIUk48rhX01GfZPS9ZLikJ22PH+QV5xUfCgKYN0cMgTLB2g2Tq?=
 =?us-ascii?Q?l8QrK7E8N0zOIk26rN2WQt2fN4ZrCK3KZmuueIugWERTAKu/FsPPh7KhSTBQ?=
 =?us-ascii?Q?Y+MfxAYvdEcBVedy+teZOfxIemTjrSTmJFH6uLvxxZ0cTMs/ylsdUXSGe0Ht?=
 =?us-ascii?Q?0zxjdcKczV969YxpzRL5hF1olMxMEIxdoNaAMBYRau4hyjss+Xt+vY4AccEV?=
 =?us-ascii?Q?bYykYPaoE4NJnC24o4f9K9VuMDK5o1xYrBG7uE7NS9WDV0ZtmFkWcyM1DudS?=
 =?us-ascii?Q?Cgq8genOR3nIbwAZX9cuRYN9Bs4jnjwQvLAP/gwG4EbdRWX6RPt0hM/7H69B?=
 =?us-ascii?Q?AvXdU0xAe2MGaXefIdKi6QA4ID9/7yfODWhR0wjmrt4XiWdUVArggdc9XVyV?=
 =?us-ascii?Q?PMoFsWDPGxKFQ0qpkjpjGkJtN5QPfhYnC5xxVgLqMwx0asy1NHYaKCa/aQc2?=
 =?us-ascii?Q?ulZpcgQOpvEtUL0pz0LIXRzd/NL3J3/rGXz8ZYZrvI05bwVRQuO/oAn/8ApD?=
 =?us-ascii?Q?D4Z1dgFSjf/3fsAOm0EdrZXzfNel/Bpts5+oWBAI2c3IF8FuIhwsmVWS95Gt?=
 =?us-ascii?Q?dvdK67T0xZW1b8vvoFOa5YqsHA8BcJIgL+7uM/3ItOk1IrwIuYOipvTRtq5y?=
 =?us-ascii?Q?uhESLY6mhFStAf+vG9HNZ5jqcvussINn2BQOhSPphwKCxnCRaFQa7lTbn5mP?=
 =?us-ascii?Q?UQXqO/igISXwzsSlFxBSztr3Ek3nCo9HTH2B31/OzsellL+rcLys0RBxD0bT?=
 =?us-ascii?Q?A9jAZTvEFUsJeVKK/znRM8qrbn7Vrwe86qI8A3dpyfNlzk9m+OIQiVVd1BwY?=
 =?us-ascii?Q?bPr6blYFVEHZMxpKRj7DmKzcVBV6yRLSUn2af0rCDo10HIGkIITLRwhxkuqV?=
 =?us-ascii?Q?smKnTqOY1StjfRJB0q+S30mJig8xXOiGrOFPwm1zRUEELQG3lVP10RdcQXvo?=
 =?us-ascii?Q?wCfYmiIdKMmJBPYoHlXzhNy4ZuMv9RxYH5VIAMbtPNttaLGDMpP0q/UCPAsD?=
 =?us-ascii?Q?T7m2NrNDtRd8FxUccRHOrXSSJ/RvPpgcI9g+CMClZ5od7R7m6m+2nJ3HAnwQ?=
 =?us-ascii?Q?fx7IqKD+1WG56FU64ZNiWoCi9/7yOMlIT+kASjOJes5EIJZAAPYzbXEWhXFx?=
 =?us-ascii?Q?XyAHzmgl09saqiu3516RO8UUWDaqZqwqjQUiSbGWxlLMNe5lk3nZIgjmK5xk?=
 =?us-ascii?Q?rNZMNqWsik++rbJdbpwrFCFvFpLLRrAthtMA/ZIFsNsV6NA3jChK3V7K4wqt?=
 =?us-ascii?Q?X72MioEszhaqKf8WPLfRDYFA1TVEkEoKgk4geZHGE5r5Izk1By3j7jRTuOdk?=
 =?us-ascii?Q?iYGRkx5mPZMke2sQS/myG9pXntWln56asC1xLC1TzsbZ8SPFkdoGLU7yk4zR?=
 =?us-ascii?Q?7Q+oRaTMcrZuGFU+hL0=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 10:03:01.1288
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58a4c036-d85f-4933-b3c4-08de3ee5cb65
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS2PEPF00003442.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB6064
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA4MiBTYWx0ZWRfX18ojX3ezAXnK
 3Saf0qZn9P/3BjY0FZ/vWGd0pib439vFirQoKKCD3Z08CQTUqUF0Fr4PxPaFIbz9MPtKvEYWFEG
 nDdCLi5SC6aeeBBr9uEQUtdmROSiwpJEhdYTKVKDk3CFkLD9EZM1H7mDegRmuaUefZ8AZYB50+7
 pf4HC3vCd4lqtAX1Mi2hUmXalLpp8x7Y8j6WwcHaQjEB+KtIu4dXoDQtzFBDRfU3O5Z6QSBpudN
 PVNB5TGzEUfFByfPetQJA1ZF1MDS5BgqzQIeqWbzKKpFxHI21abRhlTSqIfqqaIlfRaLxQ+W+UH
 pIfDCvfjOO015uQg1hSl3Z6MOtIC+ZGsRvmC6ButqRJfmNLZreWYvhXXcuu3MsYtlDwFU2dQZpU
 vc+fxHIymq5DsdnbRufUz0zE46sv3Okg+eGz0poNGG8EDeCQu9XtObj/ay3ekxBzKKjY/BQ3Vmp
 RQfc0yZWBgxHxye/eTw==
X-Authority-Analysis: v=2.4 cv=K7Mv3iWI c=1 sm=1 tr=0 ts=694522d9 cx=c_pps
 a=d12s6WLQALnS74XQi9GLPg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=tJGs-QWwAZckUbUC11UA:9
X-Proofpoint-GUID: 3xxOq6DjUfa_0vc2kjJV82OE9z5SBWnE
X-Proofpoint-ORIG-GUID: 3xxOq6DjUfa_0vc2kjJV82OE9z5SBWnE
X-Proofpoint-Spam-Reason: safe

Add codec_info for a new variant of CS42L43. It can resue existing info
but needs a new part_id.

Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
---
 sound/soc/sdw_utils/soc_sdw_utils.c | 54 +++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index f169d95895ea2..d68eefc11406e 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -707,6 +707,60 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		},
 		.dai_num = 4,
 	},
+	{
+		.part_id = 0x2A3B,
+		.name_prefix = "cs42l43",
+		.count_sidecar = asoc_sdw_bridge_cs35l56_count_sidecar,
+		.add_sidecar = asoc_sdw_bridge_cs35l56_add_sidecar,
+		.dais = {
+			{
+				.direction = {true, false},
+				.codec_name = "cs42l43-codec",
+				.dai_name = "cs42l43-dp5",
+				.dai_type = SOC_SDW_DAI_TYPE_JACK,
+				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
+				.rtd_init = asoc_sdw_cs42l43_hs_rtd_init,
+				.controls = generic_jack_controls,
+				.num_controls = ARRAY_SIZE(generic_jack_controls),
+				.widgets = generic_jack_widgets,
+				.num_widgets = ARRAY_SIZE(generic_jack_widgets),
+			},
+			{
+				.direction = {false, true},
+				.codec_name = "cs42l43-codec",
+				.dai_name = "cs42l43-dp1",
+				.dai_type = SOC_SDW_DAI_TYPE_MIC,
+				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
+				.rtd_init = asoc_sdw_cs42l43_dmic_rtd_init,
+				.widgets = generic_dmic_widgets,
+				.num_widgets = ARRAY_SIZE(generic_dmic_widgets),
+				.quirk = SOC_SDW_CODEC_MIC,
+				.quirk_exclude = true,
+			},
+			{
+				.direction = {false, true},
+				.codec_name = "cs42l43-codec",
+				.dai_name = "cs42l43-dp2",
+				.dai_type = SOC_SDW_DAI_TYPE_JACK,
+				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
+			},
+			{
+				.direction = {true, false},
+				.codec_name = "cs42l43-codec",
+				.dai_name = "cs42l43-dp6",
+				.dai_type = SOC_SDW_DAI_TYPE_AMP,
+				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
+				.init = asoc_sdw_cs42l43_spk_init,
+				.rtd_init = asoc_sdw_cs42l43_spk_rtd_init,
+				.controls = generic_spk_controls,
+				.num_controls = ARRAY_SIZE(generic_spk_controls),
+				.widgets = generic_spk_widgets,
+				.num_widgets = ARRAY_SIZE(generic_spk_widgets),
+				.quirk = SOC_SDW_CODEC_SPKR | SOC_SDW_SIDECAR_AMPS,
+			},
+		},
+		.dai_num = 4,
+	},
 	{
 		.part_id = 0x4245,
 		.name_prefix = "cs42l45",
-- 
2.47.3

