Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E372D59FA
	for <linux-sound@vger.kernel.org>; Thu, 27 Nov 2025 16:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764261353; cv=fail; b=r/LO4rEgRMrNPzrqJX1Ya8hdUJEiRHQOFKBv1g4osKSpMYw9L1B25jLK7y18EHywlHUt051TXxILbSgvKXq313Oema/nyndpQBCm/9VWtENrHQInIFrxFGwyX660FVLbOMdhiQOjHibiheDwitYOhNQ2+Ue52irvBMOU56i0208=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764261353; c=relaxed/simple;
	bh=45iQO9FNM5NsgrZydu4tm5kk32f+rCp25VIpotp30lE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hR7LW5nGn4nfJRbvuIzaZ5B4xKZtLYrWrCq2GtTmTeiXj5byErsE2iwqaMeZC9K7de76MsimgtpT7EkXbAlPoosFzQgwjtQJXMb5++Uq9n/v/Ta9mcQSU6acXTCqhi9x+D8IOGkayAigJakVgr/k9+8GWXt76+YETw8tuHxfWIA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=itvfGHJF; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=H75PG8cf; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="itvfGHJF";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="H75PG8cf"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AR61IkZ687202;
	Thu, 27 Nov 2025 10:34:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=b8AgZzMVmSt7PyJC9nLnMakOqLMNQNvdczae+wbFBUE=; b=
	itvfGHJFojs83B9fBmSWqLiVQBVBhHTQ4iCWoLxGnpBuDg/0wVMSO+Iz/r3sSwnn
	Mhzj4/NN3+0ivots4fLr7zMKZVQzf7miYTHO6038j00xoFvc67Q8FFoO5jdXBYfl
	VbsKA4KOEIIFmTw1gSLk0Y5+tk//MyxqJuhBqC+c9S1GRYGI9Y2WhQtl+S1QfkOr
	gxgi31t33PU6lVaumWiH6o1sSMFi1vAY4jm8u1XVagZQGjru4d3HY2G4ZlU5NRHU
	72FmHAZ+TdUNrR6r/LLekZEMyjxSzkJ6FjKzpgP5/z0szQAv+AZhDik/ySclt7ga
	MZahioZHcWUmhv5EtNc2Ow==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020142.outbound.protection.outlook.com [52.101.61.142])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4anjvwtem2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 27 Nov 2025 10:34:39 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eWNpg3vS4gef8DLqoPAj3Y+HzjZNDjgUH/jQu3Da0zqcQWzsdldyyXAiH/tINj/UMyc+VxwM5MQe3VOFQRRihH6w3CXc2PH31tXxJSMoEgYpGujTdENSckB/yJpZfGQVGErOO36QFRVzR5692SEWyU89kSjNRFaFYH7iLa5IH9IwGTnqu1H3xo+gF+48tkDyjDezRGrKCyzBVaRqYRKvwAikl/Zosr2eRZYq7K80vVoN6MPXI9sBqh/3mjyJpO5qvx14iYr6Gz4ijUAe15zR2q37v61WFOCftsx6/TeDnfKY8xsT3C4VZGNlxkiJvV9dlGlAI9Y09Saj/hVXr54KXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b8AgZzMVmSt7PyJC9nLnMakOqLMNQNvdczae+wbFBUE=;
 b=QXqtLRAEgI8jMNB77iJCoJ71Pfj46xTRMklII7haMg/7N5OI8CT+WQPU2RGAaNRZypF9gwWWlFUBSzlqUKdE0eyxB0eAr3MPRIXwTbMki/ZHBxlBNf5s3+C1w7erevfU63SakPz8mBBbcm07KUPwCBS2M6wJGsbxT6tPgwEf7aCyXI91fZDi+CVJujNYUB+BEbFNYVfN11CSWWaSX9tFdlfZGf2Q/raUjsWBrl2UUXRFDGB1h4rwkGvBlZKNqcW9RubxetqKhK0t4FsCwiyztjAOh6bc8XWR8aBOpC0NWZimOSo8e7Rfo/Vh5ToqreTc3Qwk6R0wkR5UfTGvGWc4mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b8AgZzMVmSt7PyJC9nLnMakOqLMNQNvdczae+wbFBUE=;
 b=H75PG8cfxpN/v7dgK+pCAh35PXa2uwMMe90FisEjZHrB2PYQkvsG7a6zzJ0Yyn+NENVtOPpmK46RsBD2VyeV+OUXrMbXghy/6L5dVdUaJd7qP02l4fmaV82bj8BsWV/nYAM4V9mDVQCkGtog96dGGdGIPHVv819EHOqdyTWbmzo=
Received: from CH0PR03CA0415.namprd03.prod.outlook.com (2603:10b6:610:11b::26)
 by SJ0PR19MB4527.namprd19.prod.outlook.com (2603:10b6:a03:27b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.15; Thu, 27 Nov
 2025 16:34:33 +0000
Received: from CH2PEPF00000140.namprd02.prod.outlook.com
 (2603:10b6:610:11b:cafe::dc) by CH0PR03CA0415.outlook.office365.com
 (2603:10b6:610:11b::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.14 via Frontend Transport; Thu,
 27 Nov 2025 16:34:31 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH2PEPF00000140.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.7
 via Frontend Transport; Thu, 27 Nov 2025 16:34:33 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3E3D7406554;
	Thu, 27 Nov 2025 16:34:30 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 1A1DF822540;
	Thu, 27 Nov 2025 16:34:30 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 5/7] ASoC: intel: sof_sdw: Add ability to have auxiliary devices
Date: Thu, 27 Nov 2025 16:34:24 +0000
Message-ID: <20251127163426.2500633-6-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000140:EE_|SJ0PR19MB4527:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 366f4443-d462-4459-1340-08de2dd2d89a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gj/SqYiYPyuokMiraQfgQWLeY81vMMp7casTMJcEzM6t1fE13VXWT4ryTqOx?=
 =?us-ascii?Q?JbtJEz5lD/aTGkWvsyGqA3iyjfOGIx+nA3+ynLQcRykduImCA6G7neH19FDT?=
 =?us-ascii?Q?Tz5dmV0VoqWdTY/jEJso5OWDGQiYi8avZIpYkcWCGQkJpyTr51hG5wnmBx+u?=
 =?us-ascii?Q?xk2NZ3Vy00D/T0qEOv8YJR+xo1uRYsHjGdjrxnm8m5akhiMcnE3U8ZY8WrS1?=
 =?us-ascii?Q?mqTn54ftwMRdnQKkRRxe4jwzYh/FMiheD9xTtodcuoXLcawOJCGU5Wwlzk6O?=
 =?us-ascii?Q?4QfcfVg338p2IytbRySGM+PWvRTIA7ZT2Ln2Kie8jI3llbO/xCxW2i77M2Y3?=
 =?us-ascii?Q?j6WUP9JkbOYWzfFQgk2sXqPZlBjQlxeHfPxqpKHbGX2yHvPO2r/syS/fdXwg?=
 =?us-ascii?Q?F1gr7XuNN1MxlgTjFRjdUHX7tidXSUTayiPWlRdf/u39BfmrQiRybh03Vqn3?=
 =?us-ascii?Q?VybAZlXqYOZ9ohHAQ8b2SKI2KMSpUzCeJMWgiRiMvSAODVcfvkfPJ7jYMFBK?=
 =?us-ascii?Q?XMjFvFnONKTgnoEH/EhDCvzW5YauP3GlYE4DJjtSWv75oe6OflOGRd2typQ4?=
 =?us-ascii?Q?qBhq17Dy3f9rlZYdNeiYc0VgaYCQIuhZzelxQKIV+ZHpHU0eqRjUoYIn/kdW?=
 =?us-ascii?Q?ZWiq72/hboaFKn8QoXfCUOxEuJG7tsN6bVxexuvFx2gLW733HXZBUvO1XM1K?=
 =?us-ascii?Q?t72EMdbxJl+yx9fhAVp5sOI19Vq1mIR+wiqt9lSECXm5gjJ/8YHeXJ/2kVGR?=
 =?us-ascii?Q?qI2dswMPA8hMSrG7rbdo1njqR5L1ANQMSKm6L5dfKwIcD45xV9mHW2C97vMC?=
 =?us-ascii?Q?djk+sFNZhu0lSXJn44/IRAmXcdiFofdByPDtGiuAZquKuhscfZWEc4MAFGuK?=
 =?us-ascii?Q?Z1vIV2prZsFfsRlLw9elYdHkCyOY8ef8WueX1adnlZ3iZJzrCgGiUU3TD0MJ?=
 =?us-ascii?Q?D2z/7Mjyn49RfNUN7WDZM2njGky+FT9SQsxlmRqcTQSvIozXMOFwtjjGRqyw?=
 =?us-ascii?Q?yCdaLd8DY0E3Rh9zGtTY99n+DoLJAR9kc2bNePUgWNzDqNuuI60D3uOSf0iv?=
 =?us-ascii?Q?QYc1Fua7wPrpr2qIavdZs9KebP8ItCSHJoj4XnfDS3ut2zume58F1JvsHzqb?=
 =?us-ascii?Q?GKEIvFTSQqNhI6CMtF0dHUhlGWS6qrqiMlpt6gkhoNNHcJH2kMO7vWcZJ1X8?=
 =?us-ascii?Q?NcJU2hI/+wp9XBWqlYcA1GMOaUpGrzVuRVHSlJtAiyZiwB3+yrT0TIlm4EV8?=
 =?us-ascii?Q?YZtWj7cDRcYHoaJ44psYxkqNvzI7+elOqZbohXZzGxECPFf5xtinrB11X+6h?=
 =?us-ascii?Q?jbO/ZeFx4EORuLkSvMKdUFDlxN+hWhxOB6WfJKPe08Pt/Or6dSJy6acMnakF?=
 =?us-ascii?Q?N9mnOummEyOJooU4ILjnRFWj58ndlZLvSJ1FTVQrVABAozziizlDOO0MNTwx?=
 =?us-ascii?Q?fv8ig3nGwmQumQEeOgBaQDYUNFD8numc4y5vmd9txnmvT8EzNgcuhu2Bd4pe?=
 =?us-ascii?Q?iM0MJjMEeciDIYCz1LPKWEAyldZt1FInkPexa9HuN5Gw18SDUwvu0ccVV+qs?=
 =?us-ascii?Q?jihpfUeUnIE/z3tQKro=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 16:34:33.0983
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 366f4443-d462-4459-1340-08de2dd2d89a
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF00000140.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB4527
X-Proofpoint-ORIG-GUID: ZldCss_BTD7LSUBn9vN-s4PzYe2K1Zrr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDEyNCBTYWx0ZWRfX6YmT5cH1mBGC
 bL3NUAunWkR6xbg/7uZiKuKayppTCtVrno+Y1Qps6U4F0tnWiHCg02IeK3CFyeF5tbaW1YomB7M
 q1cKAqqHvvH3uG9WJxyz22teJMQOZr3US1+lEJVgh/ULHhWbMGojCa9bcI1oYnGs31bbKhH7Fw+
 RCcNHjmVWlkXowomYugQ+i+LUg1p6IJFRZPc8a5w14yUFWMC+NaWRMLaj5yBQMOsSMpVnrloLrX
 o7klHeZw0/uTnHFT+94uOQJUTF99oMGQKFV/81k/K4EAiEQe3jqmi41Ja73UyfOPeEw4oDvQpAB
 Gis7x3oypXqg9wG4TuIwSr4fQUdifj7TSETLbzYnFIydg1bWY7vhe92RsvhroLdqVox7cNIskF5
 FpDHc7p4uxietFNYXiE3J4UtPflqyg==
X-Authority-Analysis: v=2.4 cv=Vvouwu2n c=1 sm=1 tr=0 ts=69287d9f cx=c_pps
 a=aEC+72U9RCav9gZ+GiM7dw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8
 a=WsGJ9FvaunWC_uj3hWkA:9
X-Proofpoint-GUID: ZldCss_BTD7LSUBn9vN-s4PzYe2K1Zrr
X-Proofpoint-Spam-Reason: safe

Currently the sof_sdw machine driver assumes that all devices involved
in the sound card are connected through a DAI link. However for SDCA
devices we still want the HID (Human Interface Device, used for jack
buttons) to be part of the sound card, but it contains no DAI links.

Add support into the machine driver to specify a list of auxiliary
devices to merged into the card.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/soc_sdw_utils.h           | 11 ++++++++++-
 sound/soc/amd/acp/acp-sdw-legacy-mach.c | 12 ++++++++++--
 sound/soc/amd/acp/acp-sdw-sof-mach.c    | 12 ++++++++++--
 sound/soc/intel/boards/sof_sdw.c        | 14 ++++++++++++--
 sound/soc/sdw_utils/soc_sdw_utils.c     | 23 ++++++++++++++++++++---
 5 files changed, 62 insertions(+), 10 deletions(-)

diff --git a/include/sound/soc_sdw_utils.h b/include/sound/soc_sdw_utils.h
index 714e207d4c013..48719fde308c0 100644
--- a/include/sound/soc_sdw_utils.h
+++ b/include/sound/soc_sdw_utils.h
@@ -13,6 +13,7 @@
 #include <sound/soc-acpi.h>
 
 #define SOC_SDW_MAX_DAI_NUM             8
+#define SOC_SDW_MAX_AUX_NUM		2
 #define SOC_SDW_MAX_NO_PROPS		2
 #define SOC_SDW_JACK_JDSRC(quirk)	((quirk) & GENMASK(3, 0))
 
@@ -65,6 +66,10 @@ struct asoc_sdw_dai_info {
 	bool quirk_exclude;
 };
 
+struct asoc_sdw_aux_info {
+	const char *codec_name;
+};
+
 struct asoc_sdw_codec_info {
 	const int part_id;
 	const int version_id;
@@ -75,6 +80,8 @@ struct asoc_sdw_codec_info {
 	const struct snd_soc_ops *ops;
 	struct asoc_sdw_dai_info dais[SOC_SDW_MAX_DAI_NUM];
 	const int dai_num;
+	struct asoc_sdw_aux_info auxs[SOC_SDW_MAX_AUX_NUM];
+	const int aux_num;
 
 	int (*codec_card_late_probe)(struct snd_soc_card *card);
 
@@ -165,13 +172,15 @@ int asoc_sdw_init_simple_dai_link(struct device *dev, struct snd_soc_dai_link *d
 				  int no_pcm, int (*init)(struct snd_soc_pcm_runtime *rtd),
 				  const struct snd_soc_ops *ops);
 
-int asoc_sdw_count_sdw_endpoints(struct snd_soc_card *card, int *num_devs, int *num_ends);
+int asoc_sdw_count_sdw_endpoints(struct snd_soc_card *card,
+				 int *num_devs, int *num_ends, int *num_aux);
 
 struct asoc_sdw_dailink *asoc_sdw_find_dailink(struct asoc_sdw_dailink *dailinks,
 					       const struct snd_soc_acpi_endpoint *new);
 int asoc_sdw_get_dai_type(u32 type);
 
 int asoc_sdw_parse_sdw_endpoints(struct snd_soc_card *card,
+				 struct snd_soc_aux_dev *soc_aux,
 				 struct asoc_sdw_dailink *soc_dais,
 				 struct asoc_sdw_endpoint *soc_ends,
 				 int *num_devs);
diff --git a/sound/soc/amd/acp/acp-sdw-legacy-mach.c b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
index f1f43eeb60378..fae94b9edd5a3 100644
--- a/sound/soc/amd/acp/acp-sdw-legacy-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
@@ -360,16 +360,18 @@ static int soc_card_dai_links_create(struct snd_soc_card *card)
 	struct snd_soc_acpi_mach_params *mach_params = &mach->mach_params;
 	struct asoc_sdw_endpoint *soc_ends __free(kfree) = NULL;
 	struct asoc_sdw_dailink *soc_dais __free(kfree) = NULL;
+	struct snd_soc_aux_dev *soc_aux;
 	struct snd_soc_codec_conf *codec_conf;
 	struct snd_soc_dai_link *dai_links;
 	int num_devs = 0;
 	int num_ends = 0;
+	int num_aux = 0;
 	int num_confs;
 	int num_links;
 	int be_id = 0;
 	int ret;
 
-	ret = asoc_sdw_count_sdw_endpoints(card, &num_devs, &num_ends);
+	ret = asoc_sdw_count_sdw_endpoints(card, &num_devs, &num_ends, &num_aux);
 	if (ret < 0) {
 		dev_err(dev, "failed to count devices/endpoints: %d\n", ret);
 		return ret;
@@ -387,7 +389,11 @@ static int soc_card_dai_links_create(struct snd_soc_card *card)
 	if (!soc_ends)
 		return -ENOMEM;
 
-	ret = asoc_sdw_parse_sdw_endpoints(card, soc_dais, soc_ends, &num_confs);
+	soc_aux = devm_kcalloc(dev, num_aux, sizeof(*soc_aux), GFP_KERNEL);
+	if (!soc_aux)
+		return -ENOMEM;
+
+	ret = asoc_sdw_parse_sdw_endpoints(card, soc_aux, soc_dais, soc_ends, &num_confs);
 	if (ret < 0)
 		return ret;
 
@@ -413,6 +419,8 @@ static int soc_card_dai_links_create(struct snd_soc_card *card)
 	card->num_configs = num_confs;
 	card->dai_link = dai_links;
 	card->num_links = num_links;
+	card->aux_dev = soc_aux;
+	card->num_aux_devs = num_aux;
 
 	/* SDW */
 	if (sdw_be_num) {
diff --git a/sound/soc/amd/acp/acp-sdw-sof-mach.c b/sound/soc/amd/acp/acp-sdw-sof-mach.c
index d055582a3bf1a..5677ae63fca92 100644
--- a/sound/soc/amd/acp/acp-sdw-sof-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-sof-mach.c
@@ -272,15 +272,17 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	struct snd_soc_acpi_mach_params *mach_params = &mach->mach_params;
 	struct asoc_sdw_endpoint *sof_ends __free(kfree) = NULL;
 	struct asoc_sdw_dailink *sof_dais __free(kfree) = NULL;
+	struct snd_soc_aux_dev *sof_aux;
 	struct snd_soc_codec_conf *codec_conf;
 	struct snd_soc_dai_link *dai_links;
 	int num_devs = 0;
 	int num_ends = 0;
+	int num_aux = 0;
 	int num_links;
 	int be_id = 0;
 	int ret;
 
-	ret = asoc_sdw_count_sdw_endpoints(card, &num_devs, &num_ends);
+	ret = asoc_sdw_count_sdw_endpoints(card, &num_devs, &num_ends, &num_aux);
 	if (ret < 0) {
 		dev_err(dev, "failed to count devices/endpoints: %d\n", ret);
 		return ret;
@@ -296,7 +298,11 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	if (!sof_ends)
 		return -ENOMEM;
 
-	ret = asoc_sdw_parse_sdw_endpoints(card, sof_dais, sof_ends, &num_devs);
+	sof_aux = devm_kcalloc(dev, num_aux, sizeof(*sof_aux), GFP_KERNEL);
+	if (!sof_aux)
+		return -ENOMEM;
+
+	ret = asoc_sdw_parse_sdw_endpoints(card, sof_aux, sof_dais, sof_ends, &num_devs);
 	if (ret < 0)
 		return ret;
 
@@ -322,6 +328,8 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	card->num_configs = num_devs;
 	card->dai_link = dai_links;
 	card->num_links = num_links;
+	card->aux_dev = sof_aux;
+	card->num_aux_devs = num_aux;
 
 	/* SDW */
 	if (sdw_be_num) {
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 0c6677d66ec73..2c1001148d540 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1189,8 +1189,10 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	struct asoc_sdw_codec_info *ssp_info;
 	struct asoc_sdw_endpoint *sof_ends;
 	struct asoc_sdw_dailink *sof_dais;
+	struct snd_soc_aux_dev *sof_aux;
 	int num_devs = 0;
 	int num_ends = 0;
+	int num_aux = 0;
 	int num_confs;
 	struct snd_soc_dai_link *dai_links;
 	int num_links;
@@ -1199,7 +1201,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	unsigned long ssp_mask;
 	int ret;
 
-	ret = asoc_sdw_count_sdw_endpoints(card, &num_devs, &num_ends);
+	ret = asoc_sdw_count_sdw_endpoints(card, &num_devs, &num_ends, &num_aux);
 	if (ret < 0) {
 		dev_err(dev, "failed to count devices/endpoints: %d\n", ret);
 		return ret;
@@ -1223,7 +1225,13 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 		goto err_dai;
 	}
 
-	ret = asoc_sdw_parse_sdw_endpoints(card, sof_dais, sof_ends, &num_confs);
+	sof_aux = devm_kcalloc(dev, num_aux, sizeof(*sof_aux), GFP_KERNEL);
+	if (!sof_aux) {
+		ret = -ENOMEM;
+		goto err_dai;
+	}
+
+	ret = asoc_sdw_parse_sdw_endpoints(card, sof_aux, sof_dais, sof_ends, &num_confs);
 	if (ret < 0)
 		goto err_end;
 
@@ -1289,6 +1297,8 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	card->num_configs = num_confs;
 	card->dai_link = dai_links;
 	card->num_links = num_links;
+	card->aux_dev = sof_aux;
+	card->num_aux_devs = num_aux;
 
 	/* SDW */
 	if (sdw_be_num) {
diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index f31213e00a16a..f57e02bea5b4e 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -1252,7 +1252,8 @@ int asoc_sdw_init_simple_dai_link(struct device *dev, struct snd_soc_dai_link *d
 }
 EXPORT_SYMBOL_NS(asoc_sdw_init_simple_dai_link, "SND_SOC_SDW_UTILS");
 
-int asoc_sdw_count_sdw_endpoints(struct snd_soc_card *card, int *num_devs, int *num_ends)
+int asoc_sdw_count_sdw_endpoints(struct snd_soc_card *card,
+				 int *num_devs, int *num_ends, int *num_aux)
 {
 	struct device *dev = card->dev;
 	struct snd_soc_acpi_mach *mach = dev_get_platdata(dev);
@@ -1263,8 +1264,18 @@ int asoc_sdw_count_sdw_endpoints(struct snd_soc_card *card, int *num_devs, int *
 	for (adr_link = mach_params->links; adr_link->num_adr; adr_link++) {
 		*num_devs += adr_link->num_adr;
 
-		for (i = 0; i < adr_link->num_adr; i++)
-			*num_ends += adr_link->adr_d[i].num_endpoints;
+		for (i = 0; i < adr_link->num_adr; i++) {
+			const struct snd_soc_acpi_adr_device *adr_dev = &adr_link->adr_d[i];
+			struct asoc_sdw_codec_info *codec_info;
+
+			*num_ends += adr_dev->num_endpoints;
+
+			codec_info = asoc_sdw_find_codec_info_part(adr_dev->adr);
+			if (!codec_info)
+				return -EINVAL;
+
+			*num_aux += codec_info->aux_num;
+		}
 	}
 
 	dev_dbg(dev, "Found %d devices with %d endpoints\n", *num_devs, *num_ends);
@@ -1402,6 +1413,7 @@ static int is_sdca_endpoint_present(struct device *dev,
 }
 
 int asoc_sdw_parse_sdw_endpoints(struct snd_soc_card *card,
+				 struct snd_soc_aux_dev *soc_aux,
 				 struct asoc_sdw_dailink *soc_dais,
 				 struct asoc_sdw_endpoint *soc_ends,
 				 int *num_devs)
@@ -1441,6 +1453,11 @@ int asoc_sdw_parse_sdw_endpoints(struct snd_soc_card *card,
 			if (!codec_info)
 				return -EINVAL;
 
+			for (j = 0; j < codec_info->aux_num; j++) {
+				soc_aux->dlc.name = codec_info->auxs[j].codec_name;
+				soc_aux++;
+			}
+
 			ctx->ignore_internal_dmic |= codec_info->ignore_internal_dmic;
 
 			if (codec_info->count_sidecar && codec_info->add_sidecar) {
-- 
2.47.3

