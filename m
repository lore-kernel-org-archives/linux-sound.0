Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1942D46B2
	for <linux-sound@vger.kernel.org>; Thu, 27 Nov 2025 16:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764261349; cv=fail; b=WWQAQhjLi4cJOWpKANypnD8am+4Iwy9HVUq5olTF5BXV6ItJ/t3j1Yo7dByo0CpPC7qLXkefquVkAyCCoh9LJm+VHIfbEzRW2zP04ohPG4RUW+M3v446rHk0fySyP07Un9SZZD8JVWJWJgpEC6jshj9Tndm1qXHRw1QhrrnGStU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764261349; c=relaxed/simple;
	bh=ZY5z1JxsB3YzqyFIjLG6avHcZJTTC1tRA4k2ZJ5tm1k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AQcQ9kB/CZEEChBzcqs9RUIjtXJpALhUDMXvw/kbFJ632s1NpFTXrVfhRDbuyS2hpweRmDLctStIBJMg3Wpkb7Cn23jO8juyqJW999wFj7C4ZW1E2kyE0wS5nJuqF0GQljrt8kPSUHKNvpBPNTO/aTdanQy169i9PqHuQsOPfq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=PeVy97kM; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=cnNk1T99; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="PeVy97kM";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="cnNk1T99"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AR61IkY687202;
	Thu, 27 Nov 2025 10:34:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=TSmPrH0nYzAEK1Hyv7qj05F4naCOcSGIISyDJFqVuNI=; b=
	PeVy97kME50wRGaz2lMHcQVTTnKQvKA3BgLIGNiSymSGcmjvGvpmt9oicEDgbwpy
	1o6MYVyKldsefMDgLmNzf2HRvodb5kjf7XIqoGiHEt0p5wRj0qwWa69gZqUsehRg
	QF9E3NQVHOtQ231rLGp5J8kqAmrAle4bnN9BiKdYeY0OWdnIek9AUmAmodttwwRu
	CgCddPHxbxNmAi5WEBRIMq6yChlm/4tvr0Uhy0kgP75cXSBTah8TMOUP5N6yFx9X
	cMA+XCaQ86/AwzDnXIQfMhdtcbwuwP3Z+ix+d8OSa1SCPpxraEhmwXwR8J3wcq6J
	shGTzz6qQj4A8KPCdHdGlg==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020128.outbound.protection.outlook.com [52.101.61.128])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4anjvwteky-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 27 Nov 2025 10:34:34 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J0/7T1Tl64JShThYq3i7tTn9OPTV++J6O/F1E7NDwqBdfjgRliQgfQmla2fAukvJ9LFxWqHk78x71v4FmtaVR525TCjrQ7YQxhNARcmXEVgVb9OhUSUCpRVADOCz7YdrUcxFuCd6wetI0n9iYtY/OYs3XzZgHhHL/joeHUmpQMidiiQA+ayT6Jzx8PUUy2AyhgEOTQy/I0oRsPNq0dVOO0YNXfM2uSqY7UbIMOYYjgz0De2lx+2nO9kawD+TUfH/FZRMz3OAse9xtA4MBcuyFJQ3eHCGnhMkgJzNzI9AEKVypeF5Dq/e7b/92nPixP7Il9LCbKVltjGqHyGBx73SAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TSmPrH0nYzAEK1Hyv7qj05F4naCOcSGIISyDJFqVuNI=;
 b=EY5+RqX3vzxDPVbATyl7aFlqyIuiHWz/aBc00/V1Y3zy6wx11QtRcCSp2pQlZXMn83XY1wCy/Uyl8iPDBFRt27mP0FdRVkM9/N14HoxS78GIVEB7rskfdFvMlfD2bDzNXDdevgY09iW2qoo8oXuUVb9W+sMqfAi3ow9EjNyierpTR2Jm2kClbALTLUWqS2nsyAcU5NrvIc4pSNIIpZjtpJpePQ1dSHNUHKeJTatnFzi02BhFDBN4DPWGYwrgflvzSMvUs7dRuGZf9efrX2MiNUvpDO2+XYyZgejJi9VlR8MGtE0CckBU/waoEdZa5tcY6M9gSUBfgc8vNZaTbVuPTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TSmPrH0nYzAEK1Hyv7qj05F4naCOcSGIISyDJFqVuNI=;
 b=cnNk1T99dkSEPdSkMwvkGYePWnep8WWE8168VL96qqI85t62cpX+V+R7aqTgUDtlWe4HoIuBRK+PKMTuOvAd59C67i7gOwwb/yx7NvAhAnEGc0s709oToGtA4r508KEri5v8aqcZSBcZfOa2vq7aRvWkSMf+IWz3p0c3UqvYqgk=
Received: from SA9PR13CA0125.namprd13.prod.outlook.com (2603:10b6:806:27::10)
 by DS3PR19MB9414.namprd19.prod.outlook.com (2603:10b6:8:2e0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Thu, 27 Nov
 2025 16:34:32 +0000
Received: from SA2PEPF0000150B.namprd04.prod.outlook.com
 (2603:10b6:806:27:cafe::dc) by SA9PR13CA0125.outlook.office365.com
 (2603:10b6:806:27::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.3 via Frontend Transport; Thu,
 27 Nov 2025 16:34:32 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF0000150B.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.7
 via Frontend Transport; Thu, 27 Nov 2025 16:34:31 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3AA29406550;
	Thu, 27 Nov 2025 16:34:30 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 16C0682026C;
	Thu, 27 Nov 2025 16:34:30 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 4/7] ASoC: sdw_utils: Move codec_name to dai info
Date: Thu, 27 Nov 2025 16:34:23 +0000
Message-ID: <20251127163426.2500633-5-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251127163426.2500633-1-ckeepax@opensource.cirrus.com>
References: <20251127163426.2500633-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150B:EE_|DS3PR19MB9414:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f21b67cf-5f6b-4745-caee-08de2dd2d78e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|61400799027|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EsTRSz0v8yak5ISir291JF/p5BeuUSQNDUvUlZpd4i/rjKsfOgEoPVYMH1+F?=
 =?us-ascii?Q?xEZalTEuMCuuZTnJUQpe6yjqBG2GRknCCD9dfBk0ARPBOS5EM/x8ZbtNZ1Mx?=
 =?us-ascii?Q?wRFE/MwQX0dmYVfZ+49fMOkwRqtH0uhxdTSsPs0eEBMO/U6HCvD7AEPFl3cy?=
 =?us-ascii?Q?HuYghXhsWN/cdJHppqIXRCMy0SHzYqBaWzHTz76orf2yjRXtO8CXNoK4a80/?=
 =?us-ascii?Q?hQnumrJf0D/Z4Kg7dWWnmUsUYRTGF5F+FZX/oKtI9tHYCakfVXRN421IFQng?=
 =?us-ascii?Q?t9bMKTklm+VPjtQb5w4O87c4KOCnovwibTOJHqMwXZFdBKehcpDHxMN8WXvC?=
 =?us-ascii?Q?rp3qGjQGK/6HWIkNPf+3J4aAD9/GpmTf9lwLFnKGAHafL6vpJhM8OA3PiIIE?=
 =?us-ascii?Q?IpfZjCvQ9ZLfyYAC5cSXpi3sdSLR/W0a10KpXcyf0s6EhN7einEuWHOPifux?=
 =?us-ascii?Q?rYmSSmExSywy8e4VndF2s583LQP/2Qi6WZoAbg5ZSK5wUo2JZ7DFZLa7xfvC?=
 =?us-ascii?Q?8HxrcAhDaAfQG/L6+icPaA7+I9i4fjDRwR8HQ2CKvgcD3PmJVgNzn0/Jgav9?=
 =?us-ascii?Q?DJlPja8CbnybmzdYJ72qh7Oa9ITyxATcUQEebizRairnd1VPxRwj77sog+fy?=
 =?us-ascii?Q?fl7yQwJigrncGK8rrqoj2PKQ1dUpzEyGo0Weup4RVf7SaQpA7mYYCL4VrnE5?=
 =?us-ascii?Q?bC3eX6Vh7D3dAHMZ9LCEAveKeHiCiQoXsZYb/bWV1C/D/Y3B4OZPPBFEDcUu?=
 =?us-ascii?Q?ZnhiCNiHKGfFa0iU1L9i8ENt8zXAFWxq+fa842PumLPHge2hrLpi/OHLvc5o?=
 =?us-ascii?Q?4F5zV2nwFsrQMxzJzkTjrEEctWievw4tcuzl6Hd6wKF6hms4TNQMCXpWphBn?=
 =?us-ascii?Q?81jpOg+LUATJdzTURaphsBn5oXb+8VMfe4vkoHJuPVkkz+7Gh+Y3ESKNcdyP?=
 =?us-ascii?Q?b/mk/OHKUKx7MkDUUUcNMDfFZaDRZZ2TXG072O1du7QyL75//ncHS0tBJs/x?=
 =?us-ascii?Q?Gs81nTu9x3Tvs2pF+aebz7hAHdes2ZlF4N1HUVTsCSgvkCOY5NuvZes5qALg?=
 =?us-ascii?Q?f1qxMm+zsI/hG67B5cp7cSdlQTKykmNEivu6QJFwKt0/GuArRl1XOTb0ZsNn?=
 =?us-ascii?Q?iiqC6FbJbgEOgWCf3JLx4B6dcmxCm1Qa7J8Z5mopfIP4QjwAaNy89GxBgt4J?=
 =?us-ascii?Q?Nf9NeZgsyyiYQF8OwaTgruk1jFGLtuB02bUgtNO9NBrNt46gi8//lJq1bJ2j?=
 =?us-ascii?Q?7uIUbYDzYK3zSeMYPDQ14XAaXs+rQkYrdiOxaXdaQlqhV0kgSHtE9VskYf2N?=
 =?us-ascii?Q?BVAeoKwVrKiS+/x3LzffCMfQh8dMP9ZtsggfgeUahmpb/TyujaMa0n3K7K+7?=
 =?us-ascii?Q?qzf+g0SutMK7vZmyYa3dN5Z7I5n569Tbut3yy/SPbeTbYA0mKGaEEe6paMvi?=
 =?us-ascii?Q?UBg8YAtJchaNJJcP/va52hglPE16VrTAkBj7U8Ld9gA7PGnPKs9WhXI7c1BH?=
 =?us-ascii?Q?PYg6OP1uZaxtDPRSX6sBLGAPwaiX85abwAdjXWZngg0EBXMel9JKW/1jPoK/?=
 =?us-ascii?Q?a6rUfqZR2UpiWZSvHvY=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(61400799027)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 16:34:31.3274
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f21b67cf-5f6b-4745-caee-08de2dd2d78e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF0000150B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR19MB9414
X-Proofpoint-ORIG-GUID: 8ojpbBDhuE95BDI09KAKJ-qsDUvYCvBe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDEyNCBTYWx0ZWRfX2O1c1U7pJ91t
 DDCbaeiHL82x5qMTSHByjPmChlIoF10pBCzlKQVJc0EJpeOHz7fT1Yn2k3PULpUcZScJaYaMJ1O
 vY4Bc4ovoMUvT+oX3f9LrkODdYs/pqors7vBAox5TyT1GCTb316PwUhSUqufFNitMJ1016rYhKh
 gzoQPSL6OwyrU1wrENOVBoWXgju52dbRh8se8g618wqNkkMylNOXRgky/ClpgG/AChe2uQx+yPe
 ef5NbY6NQTbuwkWKJ/HuhNx7y9MaApv97HkIfQAk+E/BZ5vq1l6knNtoEBhRc9/kWaHEKDXXlJY
 8sS8iA8MSE/B7EK9k/OrCVZpCe1nawmQnvsKstM7hGCQDdWx8Xr9tpVJoBtfSDyekb7Zbg90yML
 ITsJ0k6fUhhWAr/aBUu1ikdYH/gCVw==
X-Authority-Analysis: v=2.4 cv=Vvouwu2n c=1 sm=1 tr=0 ts=69287d9b cx=c_pps
 a=8h7WK4dQWB09CNKj11a7yw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8
 a=xvjx6ylBrtOVPY9pl5EA:9
X-Proofpoint-GUID: 8ojpbBDhuE95BDI09KAKJ-qsDUvYCvBe
X-Proofpoint-Spam-Reason: safe

As SDCA devices will support each DAI link on a different child device,
move the codec name from codec_info to each dai_info. To allow the
appropriate function device to be bound to each DAI link.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/soc_sdw_utils.h       |  4 ++--
 sound/soc/sdw_utils/soc_sdw_utils.c | 19 ++++++++++---------
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/include/sound/soc_sdw_utils.h b/include/sound/soc_sdw_utils.h
index 76c64c5245d47..714e207d4c013 100644
--- a/include/sound/soc_sdw_utils.h
+++ b/include/sound/soc_sdw_utils.h
@@ -45,6 +45,7 @@ struct asoc_sdw_codec_info;
 
 struct asoc_sdw_dai_info {
 	const bool direction[2]; /* playback & capture support */
+	const char *codec_name;
 	const char *dai_name;
 	const char *component_name;
 	const int dai_type;
@@ -67,7 +68,6 @@ struct asoc_sdw_dai_info {
 struct asoc_sdw_codec_info {
 	const int part_id;
 	const int version_id;
-	const char *codec_name;
 	const char *name_prefix;
 	int amp_num;
 	const u8 acpi_id[ACPI_ID_LEN];
@@ -131,7 +131,7 @@ int asoc_sdw_hw_free(struct snd_pcm_substream *substream);
 void asoc_sdw_shutdown(struct snd_pcm_substream *substream);
 
 const char *asoc_sdw_get_codec_name(struct device *dev,
-				    const struct asoc_sdw_codec_info *codec_info,
+				    const struct asoc_sdw_dai_info *dai_info,
 				    const struct snd_soc_acpi_link_adr *adr_link,
 				    int adr_index);
 
diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index f2f1954adf221..f31213e00a16a 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -656,12 +656,12 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 	{
 		.part_id = 0x4243,
 		.name_prefix = "cs42l43",
-		.codec_name = "cs42l43-codec",
 		.count_sidecar = asoc_sdw_bridge_cs35l56_count_sidecar,
 		.add_sidecar = asoc_sdw_bridge_cs35l56_add_sidecar,
 		.dais = {
 			{
 				.direction = {true, false},
+				.codec_name = "cs42l43-codec",
 				.dai_name = "cs42l43-dp5",
 				.dai_type = SOC_SDW_DAI_TYPE_JACK,
 				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
@@ -673,6 +673,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 			},
 			{
 				.direction = {false, true},
+				.codec_name = "cs42l43-codec",
 				.dai_name = "cs42l43-dp1",
 				.dai_type = SOC_SDW_DAI_TYPE_MIC,
 				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
@@ -684,12 +685,14 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 			},
 			{
 				.direction = {false, true},
+				.codec_name = "cs42l43-codec",
 				.dai_name = "cs42l43-dp2",
 				.dai_type = SOC_SDW_DAI_TYPE_JACK,
 				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
 			},
 			{
 				.direction = {true, false},
+				.codec_name = "cs42l43-codec",
 				.dai_name = "cs42l43-dp6",
 				.dai_type = SOC_SDW_DAI_TYPE_AMP,
 				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
@@ -1094,7 +1097,6 @@ static bool asoc_sdw_is_unique_device(const struct snd_soc_acpi_link_adr *adr_li
 }
 
 static const char *_asoc_sdw_get_codec_name(struct device *dev,
-					    const struct asoc_sdw_codec_info *codec_info,
 					    const struct snd_soc_acpi_link_adr *adr_link,
 					    int adr_index)
 {
@@ -1116,14 +1118,14 @@ static const char *_asoc_sdw_get_codec_name(struct device *dev,
 }
 
 const char *asoc_sdw_get_codec_name(struct device *dev,
-				    const struct asoc_sdw_codec_info *codec_info,
+				    const struct asoc_sdw_dai_info *dai_info,
 				    const struct snd_soc_acpi_link_adr *adr_link,
 				    int adr_index)
 {
-	if (codec_info->codec_name)
-		return devm_kstrdup(dev, codec_info->codec_name, GFP_KERNEL);
+	if (dai_info->codec_name)
+		return devm_kstrdup(dev, dai_info->codec_name, GFP_KERNEL);
 
-	return _asoc_sdw_get_codec_name(dev, codec_info, adr_link, adr_index);
+	return _asoc_sdw_get_codec_name(dev, adr_link, adr_index);
 }
 EXPORT_SYMBOL_NS(asoc_sdw_get_codec_name, "SND_SOC_SDW_UTILS");
 
@@ -1354,8 +1356,7 @@ static int is_sdca_endpoint_present(struct device *dev,
 	}
 	kfree(dlc);
 
-	sdw_codec_name = _asoc_sdw_get_codec_name(dev, codec_info,
-						  adr_link, adr_index);
+	sdw_codec_name = _asoc_sdw_get_codec_name(dev, adr_link, adr_index);
 	if (!sdw_codec_name)
 		return -ENOMEM;
 
@@ -1529,7 +1530,7 @@ int asoc_sdw_parse_sdw_endpoints(struct snd_soc_card *card,
 				num_link_dailinks += !!list_empty(&soc_dai->endpoints);
 				list_add_tail(&soc_end->list, &soc_dai->endpoints);
 
-				codec_name = asoc_sdw_get_codec_name(dev, codec_info,
+				codec_name = asoc_sdw_get_codec_name(dev, dai_info,
 								     adr_link, i);
 				if (!codec_name)
 					return -ENOMEM;
-- 
2.47.3

