Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECDA311583
	for <linux-sound@vger.kernel.org>; Thu,  6 Nov 2025 11:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762429490; cv=fail; b=jiLOeDxfE8fClW4GeBmkkweYH3lQ5/WaLnvfoVIrgfl6ZEt9ihMIR62a2FSv5GzhcxWxA2UKPzCkzOCH16HPhXmteoWpdrV1M+SuM5IkUedydH7ZyC5k+nOAY6GvEoWZ6qAvl5qJJJY8WuQ/jEkfh73X3v3XrIuvXTcsRpueiZk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762429490; c=relaxed/simple;
	bh=n75djoxHBwLhSXlQ4qT22syr8O6vhRCCXpW6jQioBPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HmuaLZs/Gb4gnbZGEJfcz+fN4v7FeZIT/vUXb4na+fSiwkzsF6NzEH1PckRuez3K9yTvmBVS82gGN8YNn/9+NS6JXsptqivqTygii09gFLzC+WhpHu5UVHhHXm7ACJgJ0EIjCVsz3ciWkxeJIpuvziZBUy1uvJCP6Huf8MQqKlQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=HVOQpeXy; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=wUCmjkPW; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="HVOQpeXy";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="wUCmjkPW"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A63tDsZ019774;
	Thu, 6 Nov 2025 05:44:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=KQvk+o5xg5H2QLH4+laK43FGhmrbv5ZY8QKO+5iS/r8=; b=
	HVOQpeXyUcp29y98fDioT78y188NMfyw2ytCgawMTPrP6FLqsAEhjF9/Jk2///3U
	FxR+dhK9up+Y/qtd7VVOK1BMZhWuWdxbGuFJV2OxUkUtOJf5HozAuojnnilj3Ng/
	VVljBoJx/p4gauhKdT/OR2D6NRhpzq2lAvYFSj9V8aD73qy5jdDtSk+DbiNF44Qe
	KTVsTmPxpdzM6p4o+Oc+Ls06NJuendUZ1hYog4kXmGPDDO8K/SBZ0jmonMJLeDBQ
	sQ2Y4s3RwemJUrRWQOzPqHR/hKViNefDYs090PzhbInhyxZgtZ2tGJWE8Tr5HQih
	AQyOEP6MeAvtekdxQDazIQ==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023076.outbound.protection.outlook.com [40.107.201.76])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4a7bwx3b5h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 06 Nov 2025 05:44:31 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w4P/ovOJHOmUbGtyLlv8oljLnClYQtx3BzlhLL+qeiHFnSWM1dhBTK7U0ejW8jkQ7sH9ueyf2Iwq0G8IlYSL8DvRRFVbFdtz7830q5EvQqLoKg0r8dsNVqacrJj3WhFRtCNsQdymc1m+k4NH8IJjzBYbtGnYQ5BYHxsuzRCM0NgtOfG7A8xc8zUa6qTsUf9CJd6VnydBzEmvsk+9C1PRDNHbfll74PWwcgg5e7l4R9c9OuBinxIdVzAupNO7RNYOkhn0kKpuK6T/0kDKhwZb4zYDYgJbiQSFMKKD/fP/psB+1yh0RAUQsOzizALoFwd4m+HK3N9HnYuTvhDcw7CRqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KQvk+o5xg5H2QLH4+laK43FGhmrbv5ZY8QKO+5iS/r8=;
 b=iI48hbX6IWTKfC8kB4OYDRUsYECokefF1ZmSanV9+aivc4f5neX42WylZ3CF0uF5jdpCwoZyf3f+/teJMPfAqGY75kbFNip2ddPVRpOpusD5QBzMeB0rEBDuWd7jSfAwVfSXoxfmVwWwVhspXuBGJJu0dCdlk69dsdPhFKWlLN5P0Aor83FrP8h1SKTGfp7taMoN1b31eNbGB3OiRrPQ9FYkk6yDmpcTabHQlZxQqOFu8ildGURxnCEaJhNzSo+g0sfinodZrlzC8jBdFRRxSUgVjWJqNqF6BvZjcHaRmSckmedfgTQAwNC9VIfVA1cGagjQQdsKUc2kIKNDGAQEFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KQvk+o5xg5H2QLH4+laK43FGhmrbv5ZY8QKO+5iS/r8=;
 b=wUCmjkPWtFxFtcxb4lfEX9C93Ac4ibpEUUXAO3P17Dt9F8xBDcBw4qhZuWD9gnlcxRaksza6cveXr/QHsJTtp34NATUicfLOj93hrDytVBsuMzzYouvL3jYmwnwO+JD/T8dzJcoGckfvT0qeRSjA12MJRJF4EDdyCmo1D9OB7S4=
Received: from BL1PR13CA0411.namprd13.prod.outlook.com (2603:10b6:208:2c2::26)
 by DM4PR19MB6245.namprd19.prod.outlook.com (2603:10b6:8:ae::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Thu, 6 Nov
 2025 11:44:28 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:208:2c2:cafe::db) by BL1PR13CA0411.outlook.office365.com
 (2603:10b6:208:2c2::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.8 via Frontend Transport; Thu, 6
 Nov 2025 11:44:28 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.6
 via Frontend Transport; Thu, 6 Nov 2025 11:44:27 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id EA81040654A;
	Thu,  6 Nov 2025 11:44:25 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B406C82026B;
	Thu,  6 Nov 2025 11:44:25 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 02/13] ASoC: SDCA: Fix missing dash in HIDE DisCo property
Date: Thu,  6 Nov 2025 11:44:11 +0000
Message-ID: <20251106114422.906370-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251106114422.906370-1-ckeepax@opensource.cirrus.com>
References: <20251106114422.906370-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|DM4PR19MB6245:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8abb5e0d-c1e4-4328-23a6-08de1d29d734
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yOYFVWZczvU+Y4U+MLjHStdcCXi3wcOkwudmoFvFSGpILCFhF+9h5/xFp/Ca?=
 =?us-ascii?Q?iHPPQtpnY1YJX+EESVWDDk3Px9c9X+cui1cpXIAKHm7NlWEuI8MtryNy8OIY?=
 =?us-ascii?Q?xL4IuDZFrIoRosGSI8rKvS8AEste/LHXEOzsTyFjKOrAWjwNHvns75/lT4xx?=
 =?us-ascii?Q?Kk+1/tJyJiRJwU2IGwrr/Uu6rvICXYxMN1T2q0SXl7JnlWPaO59zie9+u5Hz?=
 =?us-ascii?Q?f3ePU/vLiiYEecMmdIURfmYkbW0+ba3aQ15Y9KxSjjUKmyM9srrrn8pr8ZEO?=
 =?us-ascii?Q?YUhHAeid/gB5d4AhRFVOhAfMhO68rNDDdAO+I3WfOmrm3D7z74D8cXfxiVq4?=
 =?us-ascii?Q?fk0M/2r395d16b+lXILYNpgOY8D+06k+06uZAhFDpzV3aoTDun1MbaF6yZAC?=
 =?us-ascii?Q?Hq+GBvYpfQ/PeeQomyNq/0+VFbnqGu+s3Wr8iWAwZD4O39MVlAKiqhC7iBzz?=
 =?us-ascii?Q?IGnOrIQdTK1Kqzm6HPSAlnM0rqkGw9zufaRWqN323/CFTE+j1voWc4443KYT?=
 =?us-ascii?Q?XDqNAlDcYxFEioWTXR8z1HTZHOpo3Mpi6yrF8zU5XtVSTNgPu1oujeB+Srqa?=
 =?us-ascii?Q?dzP1C4OM8T5FEydsf1JSgnCN0od6j/v8o+BVQAt90j7UeB3K7w3jTaPRxZNA?=
 =?us-ascii?Q?1DQ/hRjvyB5IgVn0Fi579lVh+DvMqeJPH942+82tJSompefSRx033F52nm/m?=
 =?us-ascii?Q?GoVDV3V33HK5JFD5DHgvenXub0wrdsIN+D/4DC0cYaZt7vdHexDN0E2Fsbfm?=
 =?us-ascii?Q?VlAuQgDUzToaw9MhYexkxyu45zILSXiLnwOExqQwb3pMiQ9mvNuHJ5sc0v2L?=
 =?us-ascii?Q?2oAEvlTfvxWR3jpFLcT50Mg8B8+taoCsD2qVcuHCL4QwKKdq0Z75re00T4tT?=
 =?us-ascii?Q?fX8mthId2rko6XmM5HFIZifVlCSC5XP5nZ5WGhg1I+deQeG7N0YWzookcpp0?=
 =?us-ascii?Q?PkeIcafV+85v1FrOSLPMWGgczSepzvNt823s2dDXGhzk9J8k/ump25dxGM4Q?=
 =?us-ascii?Q?5U2SwNadXQJEAk0Q6FjjwBXffSEFAF1Hh/SpWJulQ/n5nZWMiifmGc62EH13?=
 =?us-ascii?Q?qhS/rUW9hJ6+dw/9uj2U1mJ1Fet1TgcrigUREykiyKlyK8bWmle/oJTwuIHW?=
 =?us-ascii?Q?xQTK8c6yxB0mMemFdGBBULigslpbaJ0mx5IRjBHJU/cJuIIx3gAVGjimaJKW?=
 =?us-ascii?Q?rWQ84kR8iR4qqAdQodpXS69xGIej9YI5OzPmn8DtwaeQzyBrlH1H71JoUjae?=
 =?us-ascii?Q?TMiNTpdvLMiyMRjwXWnVWiZBvsU4NiLal/epDBWdoWESgKl+S5d8ffNQwagW?=
 =?us-ascii?Q?67Mwkt0dCmWg8ozaA9BlqeDqC2lVK/z8tQsMpSqMqbG2KlSI8OBTqRSf3s2x?=
 =?us-ascii?Q?9jz4+IZWJfRZUvcN285PCdR9fxwejYQ+sc+acczMxFYMh9+f8j7oD96AEl36?=
 =?us-ascii?Q?qtwp8HeV7+QHy8e3xTi9gr6VyF4KBC3BBpX2w2VVZ2diGEqmpRw8Az7kaQbL?=
 =?us-ascii?Q?X1vNB213mp2LElEp/XvqwluOjYrpNzj/ZmACwdI0F4iLPDIezzVghafXqwrW?=
 =?us-ascii?Q?8ZiuGyJnd+7remR1CVU=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 11:44:27.2360
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8abb5e0d-c1e4-4328-23a6-08de1d29d734
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR19MB6245
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDA5MiBTYWx0ZWRfX+W+xcXbL6kMi
 rnl0LvujuBMsIkyZQnz+Vq0BYPxPeAcuujShXOdwxI5+Dk4aebePqIBSqwxyWzDsi10TxKWei+k
 Fa5LJr+BQsKUlE7ukl4znMcYai01lkY/Su02lb0As7afCi2ISdd8E2SsGJLPELOHRNheq1HgzQi
 b45T4PJwH9pQmA9tDST4mJMcsyDuPVkc/uGBtHZdF6rFsZce9HPJLckuMGbv2GJHgXJvZkLIAym
 3LK75wHWA07VcjR2Jc2bnmiJFIqv0lHMaVfJ4TjQGIYarZ4jPGFZqOmSKfVFjorDsgvi5PuYy03
 phQXCVUCVlVSPRnnYvtbxVWZEfDykCoelxJZVVlZrdN0GALhKkakqlK6R9CtNv6qvnq2Ak49VwJ
 V+F1H9AjSFMgCKZVT2OZ6kwH51d9XQ==
X-Proofpoint-ORIG-GUID: 5blLyvMUR5bY1bjx5OF1IFcxZyhRUuWM
X-Proofpoint-GUID: 5blLyvMUR5bY1bjx5OF1IFcxZyhRUuWM
X-Authority-Analysis: v=2.4 cv=FpcIPmrq c=1 sm=1 tr=0 ts=690c8a1f cx=c_pps
 a=QEJrKe+JhCFsWCDgFi+jqQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=Uc5XiwNe9-nZHr_u4vAA:9
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Reason: safe

The property name is "mipi-sdca-RxUMP-ownership-transition-max-delay",
with a dash between max and delay. Add the missing dash.

Fixes: 13ef21dffe76 ("ASoC: SDCA: add support for HIDE entity properties and HID descriptor/report")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v2.

 sound/soc/sdca/sdca_functions.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index b2e3fab9bd959..8ebc5161c9f85 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -1321,7 +1321,7 @@ find_sdca_entity_hide(struct device *dev, struct sdw_slave *sdw,
 	unsigned char *report_desc = NULL;
 
 	ret = fwnode_property_read_u32(entity_node,
-				       "mipi-sdca-RxUMP-ownership-transition-maxdelay", &delay);
+				       "mipi-sdca-RxUMP-ownership-transition-max-delay", &delay);
 	if (!ret)
 		hide->max_delay = delay;
 
-- 
2.47.3

