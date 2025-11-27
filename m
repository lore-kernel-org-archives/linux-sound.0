Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE850274B46
	for <linux-sound@vger.kernel.org>; Thu, 27 Nov 2025 16:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764261291; cv=fail; b=set9xOb5iPrE62HXTZOpBe0QbkNniPFtzl3I2xFgEU4Z3D3a6D2nO6mw+GSMM0VAYzXNiyO8/yrtGCHMRnZobOhhuqNvmjXWHyGoJediwtzgqL2wGQw6zLnB22MwrV/jzCBG/l4fJ4UVeBiZ54bxAD1tf5YCbOoD6a7E0hOFNNI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764261291; c=relaxed/simple;
	bh=hQ47n2DJ4y91ash+G6oPLsY84UYPhGDT17DMNXDLIKg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CZb8VQtqfTRhkbDicCtMbOe3lgMPM1lzN/FarT3GElJ/Nr8Z/YEVAQqqYroDkvNscnnpKsvNvRz9pYpBpDcPbW64hUmCvFV0F+M9fQ5uDzhGUaWRy7K9DwBb9HotavgIDFKdWf40A2X36NwLRsgGn4SqcrhDocoVaAota1USAfw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=idZFnRdI; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=IM+cmz7Z; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="idZFnRdI";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="IM+cmz7Z"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AR5Kub0620267;
	Thu, 27 Nov 2025 10:34:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=FdhF2HYWysZPwOHObHskkviapUsp9hKQwi/meWlccpc=; b=
	idZFnRdIAtbRWXp2mcHTWTTEvPQY6PTrsFF6hCIpjg9qeN769ZxV/Wcpiq6An85v
	kuzrI3P4XrjDbfCh5Ad0QSDqf0CQ6q5gbSYVqgYEEgXXlqc0j0ZmWz2LFwp8kDSS
	MkaluYTns+eEA9h9qokEzJA7hsvmFmemtiQnYV6hVr66+TYiIy3fU/So1KbsNwQq
	fgFdxNEbN5epXMVwnjfny3Qfq26e+S+6GWenVsRsm3uEhqUZg8TnOXsK6GJYjPiJ
	oEeLBvkhi6Dy/+Yslnz35n90exqjHsRlppw5lj2NnGG2hqx3naCCmV0o7XbFsPpc
	QefvmqszUrRIvOGVHfV5PA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021097.outbound.protection.outlook.com [40.107.208.97])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4anjvwtekx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 27 Nov 2025 10:34:34 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MfsbXlx8xEqKy5Fuap+1HvDqrL76cAML1haEy4ft6YHMjpSzY+YNqsY7VoTsWd/xmMdRfsqK254kWEgDDvivUAqMARMiPRAJEJX2qo/meaT4HspwvZSY6AL6hQNZTme5l/MBVTGwBM1wVpo3+HfR0GdArCPfa5tZts0vs6S/DI5EPUQdAOhVMhXX1k8wsK9GcHxCmGOEyUaLn24mrCj09svvD4Tmdc8azw0j7Lpf8c2vpzjh972GolzcdKF7fqcEmesUbfxfqjn/rXuLQKhtC+QCfPAu3PpXtUPyoeLDmxIhX0RRm/Xkgks5a7LPi9f1HnoNBbShErYlhGE+FGqsjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FdhF2HYWysZPwOHObHskkviapUsp9hKQwi/meWlccpc=;
 b=o0/s7Y5pUYvmhji4+yU6VwhyeWWC26/KW7HAnNudirnyTXPpfheuVi1+4Wau+OCOkkQaREyaw2hUkft9bsMMLsr0KSa6QGX4qvd7C34KA1pnMpzMEzpyRzKEAJl/NnwdEUZzAOTqVL9m0pq3UG4PbmHLTD6iRLWjtJ/bUAyYxmn/kilJKFCEBzGBWifPfELLsrq6PTkwnSg5WhqSfXY8+WqTt6DVpUJ50yXjY5L4aSBrdl8lYcKbBgnNzl3aTNthfohXuwE062oU+NkaYQqpuGj/X+TeKhjzn46E5No0FELr2S+IBGTqYIgkvt752q0V4viDh/nDPfs5dVNgf7h+XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FdhF2HYWysZPwOHObHskkviapUsp9hKQwi/meWlccpc=;
 b=IM+cmz7Z0VWjiqoLBHOsIVJxriK/Ic5KmUEeQiQYDUWz4GNtheRUB2qrR/F9VQz++Kp1SmujkDFXmqS4AOVjeFBIdhrQn2wxrigBdmA1PItkmFQ3grhSu9lo+jjuOCgHcVqYehe6SphT311rXsBtfpukh6OP+gyk1G6itsJ/KAQ=
Received: from CH0PR03CA0391.namprd03.prod.outlook.com (2603:10b6:610:11b::10)
 by SA0PR19MB4554.namprd19.prod.outlook.com (2603:10b6:806:ba::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Thu, 27 Nov
 2025 16:34:31 +0000
Received: from CH2PEPF00000140.namprd02.prod.outlook.com
 (2603:10b6:610:11b:cafe::65) by CH0PR03CA0391.outlook.office365.com
 (2603:10b6:610:11b::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.13 via Frontend Transport; Thu,
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
 via Frontend Transport; Thu, 27 Nov 2025 16:34:31 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 36F2E40654A;
	Thu, 27 Nov 2025 16:34:30 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 134BC820273;
	Thu, 27 Nov 2025 16:34:30 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 3/7] ASoC: sdw_utils: Add codec_conf for every DAI
Date: Thu, 27 Nov 2025 16:34:22 +0000
Message-ID: <20251127163426.2500633-4-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000140:EE_|SA0PR19MB4554:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8488b120-d542-44e2-5671-08de2dd2d775
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|61400799027|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Eu6zRZGlIVWQKTzEk6iqTnZvvvMMESEhC99cWDWIoCBokX+Au2ldfgJxtglU?=
 =?us-ascii?Q?0MHhQkTzUl+zxShfb0l9dHpImRQLPdIt4DAZGmjKDYYaw3HEBw/+aZsitmrv?=
 =?us-ascii?Q?85S7q7cEXebsD6YA9vbe+VYykBn2zUEKA8PHCXgzhF4NxP18BIQU9QrruKqA?=
 =?us-ascii?Q?/Y/u+ozmvPrNfYTzGCnqHtZSVv2c9e2uxbGrWBb/GpPfZ4d6dc3SA2tX5c1B?=
 =?us-ascii?Q?iUSCCpgEcCMcYNZyzAJfyxqDa0oyhm62K5shv4tAef4W3MszQ8fXq7rmUHff?=
 =?us-ascii?Q?SocgmCQi0TLyZBC9aWxHq0KREOOiyEFDzxKlQDebg6rdaF7UJ+TgvRBDcdMj?=
 =?us-ascii?Q?Eqs9lytI8LCtWTTzP7B5/Wqd7xx5kT5jjJiKbM7oAb9LmEyFJfP91OXe9e+3?=
 =?us-ascii?Q?g5rJjg90jlbUlo9nRmkjLJ20z9R72na2GafJsuIJwhEpAjktnaObvcUp2TR6?=
 =?us-ascii?Q?wX4IjhV7cbckT4yHJnMc8S20HQUMNmE7XJdwfYABN4DQjXihxHT/3Oh0Fyfx?=
 =?us-ascii?Q?kd6c7+/q8j8LT3dhU1bt5VqB5gpynIwi8o7vwJydRlHIZkpnd9au2yOLpyM5?=
 =?us-ascii?Q?0qvtrjoCF+bP+5V2A8DmqB8fWcBmHbvozFNJ4htinYqdqvO3REB/MUtAfmcZ?=
 =?us-ascii?Q?w8xDUkctFMjEyl2ljtfRA9Psj/IYoKRN6tzZcGBKQuBwLyDjyNjvEOTxE4gv?=
 =?us-ascii?Q?BUUzBnUsyP/JBGz9qX3XEWqCmjhHAR2hfGuXu3vtI1MPB+z6JELeKTfWFbUW?=
 =?us-ascii?Q?nExptCl0nMsBFWHnOEtTzGDa1CQPCrRVDnqOpgX13WJLkDzKqJL4rFFKgp3P?=
 =?us-ascii?Q?yDcUte1H2oZhBZ3qiZRqeaiKytfyei+29kCbS5STonEfhUFKXaZcQdfLdKzW?=
 =?us-ascii?Q?MgEa7mLYHkcK6RqOnk1amSBLCwysffgkqDtrqo1Nx5axv2obhdPoWCNWwvaU?=
 =?us-ascii?Q?wo3jQNKl+xFyzuvyIIK7kyNK6odWjSuyukZ1k1dQ37RdXbTLB91+KPLjKH+t?=
 =?us-ascii?Q?FtylFV3joJS06HnlOg95W4WEE+0sDwg1RigugD7n1hMU9VpsIu7+mWOnFjEF?=
 =?us-ascii?Q?TUfTk/BrULoZbPRwR5N1GqkJcNcgiGJLMIe4B1xO5Brvt/Vv87dQ7WdHhS6T?=
 =?us-ascii?Q?iM55PFGD+ryhhSNUQpOgi194NfwFWQx24zy4TBmE2et1G56TzR7qtq6e4HH5?=
 =?us-ascii?Q?sEZP1WyLUgL7o+k2XBPnJs9vKlXmlC4opxxqe1x81XW+k67t8eWTwOHk0qm9?=
 =?us-ascii?Q?mnwTUVrd3fSimOnu1ZsYFuv/D7ybHz+dS99GgiqfAptqWCzzS9b6fivH92DA?=
 =?us-ascii?Q?upfDuVNb5NmxZs0BeN/UeXRbWzsfl0cUqE7FP/TV+psq9pfPqkhIW/5WYVoO?=
 =?us-ascii?Q?uozvdAzI033Nfr6T8S/lDgmAjQ8EAyj1p5+kSYskINHCxqvcsoQwuITposJG?=
 =?us-ascii?Q?kbE9pPou75ORvI7yrz0syt/C08MI/+Nfr7SlHiLC078cPMusmhHKnMyxMHao?=
 =?us-ascii?Q?Yko4BltnPfdUHIpzhA/uJMAxegzRVRfeg2N0ij1sGeun4eLejYIseiv5PW6G?=
 =?us-ascii?Q?R5V/z5olrlWOBfk8E28=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(61400799027)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 16:34:31.1836
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8488b120-d542-44e2-5671-08de2dd2d775
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF00000140.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR19MB4554
X-Proofpoint-ORIG-GUID: PSNOqTl5Wlx6gIP5OxJc7x9bNtFESMwR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDEyNCBTYWx0ZWRfX9YvSMB08t0Z2
 GawNP59H55ZdpvkDBkW1EsxsAPVJ3uhCBcLAvFiRJjJobFDVdsBaVVjVM69A6q/gwn8+rfITAlA
 2B0Ic4yO39ncQpVSAA7oPwAjTbeYdAE5WmjOpAFpvZZGzMilxsbITCF7JkoTcEUHOzraIVZ60F6
 kTfypQ58oHII0I6g6ZnbD7EM3JyN9oJcvwy6PSGbLzA8Y6HFyA8nYVeMBFfmgCsT3zjpsBVzEND
 qlKl3Xbx21VNLPoeQuFxUsCA5kPs6lm4cOAsM49f3+QDuGemAvubfhq3q3N0//5efZAVgmed8gk
 VMq6oNKFkdkWQN0MS4Hy0JcNybbnGqJeO011M/9/JYUC48swV6+OM7ruaXYgBKzoHAr9OAvaxYq
 CZ6ka+3Giblz+CJaBg9F+SfjKWjCqQ==
X-Authority-Analysis: v=2.4 cv=Vvouwu2n c=1 sm=1 tr=0 ts=69287d9b cx=c_pps
 a=HfG1oWozJQbQxD3IkfRzFg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8
 a=X_TSvZh96wuB8pFSj0sA:9
X-Proofpoint-GUID: PSNOqTl5Wlx6gIP5OxJc7x9bNtFESMwR
X-Proofpoint-Spam-Reason: safe

The assumption so far is that all the DAI links for a given audio part
would be on the same device. However, as SDCA implements each audio
function on a separate auxiliary driver this will no longer be true.
This means it is necessary to add additional codec_conf structures to
get the prefix for an audio part to apply to all the auxiliary drivers
that make up that part.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/amd/acp/acp-sdw-legacy-mach.c |  9 ++++++---
 sound/soc/intel/boards/sof_sdw.c        |  9 ++++++---
 sound/soc/sdw_utils/soc_sdw_utils.c     | 19 ++++++++++---------
 3 files changed, 22 insertions(+), 15 deletions(-)

diff --git a/sound/soc/amd/acp/acp-sdw-legacy-mach.c b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
index 54f823f7cecff..f1f43eeb60378 100644
--- a/sound/soc/amd/acp/acp-sdw-legacy-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
@@ -364,6 +364,7 @@ static int soc_card_dai_links_create(struct snd_soc_card *card)
 	struct snd_soc_dai_link *dai_links;
 	int num_devs = 0;
 	int num_ends = 0;
+	int num_confs;
 	int num_links;
 	int be_id = 0;
 	int ret;
@@ -374,6 +375,8 @@ static int soc_card_dai_links_create(struct snd_soc_card *card)
 		return ret;
 	}
 
+	num_confs = num_ends;
+
 	/* One per DAI link, worst case is a DAI link for every endpoint */
 	soc_dais = kcalloc(num_ends, sizeof(*soc_dais), GFP_KERNEL);
 	if (!soc_dais)
@@ -384,7 +387,7 @@ static int soc_card_dai_links_create(struct snd_soc_card *card)
 	if (!soc_ends)
 		return -ENOMEM;
 
-	ret = asoc_sdw_parse_sdw_endpoints(card, soc_dais, soc_ends, &num_devs);
+	ret = asoc_sdw_parse_sdw_endpoints(card, soc_dais, soc_ends, &num_confs);
 	if (ret < 0)
 		return ret;
 
@@ -396,7 +399,7 @@ static int soc_card_dai_links_create(struct snd_soc_card *card)
 
 	dev_dbg(dev, "sdw %d, dmic %d", sdw_be_num, dmic_num);
 
-	codec_conf = devm_kcalloc(dev, num_devs, sizeof(*codec_conf), GFP_KERNEL);
+	codec_conf = devm_kcalloc(dev, num_confs, sizeof(*codec_conf), GFP_KERNEL);
 	if (!codec_conf)
 		return -ENOMEM;
 
@@ -407,7 +410,7 @@ static int soc_card_dai_links_create(struct snd_soc_card *card)
 		return -ENOMEM;
 
 	card->codec_conf = codec_conf;
-	card->num_configs = num_devs;
+	card->num_configs = num_confs;
 	card->dai_link = dai_links;
 	card->num_links = num_links;
 
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 6c86a79e8c242..0c6677d66ec73 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1191,6 +1191,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	struct asoc_sdw_dailink *sof_dais;
 	int num_devs = 0;
 	int num_ends = 0;
+	int num_confs;
 	struct snd_soc_dai_link *dai_links;
 	int num_links;
 	int be_id = 0;
@@ -1204,6 +1205,8 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 		return ret;
 	}
 
+	num_confs = num_ends;
+
 	/*
 	 * One per DAI link, worst case is a DAI link for every endpoint, also
 	 * add one additional to act as a terminator such that code can iterate
@@ -1220,7 +1223,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 		goto err_dai;
 	}
 
-	ret = asoc_sdw_parse_sdw_endpoints(card, sof_dais, sof_ends, &num_devs);
+	ret = asoc_sdw_parse_sdw_endpoints(card, sof_dais, sof_ends, &num_confs);
 	if (ret < 0)
 		goto err_end;
 
@@ -1268,7 +1271,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 		sdw_be_num, ssp_num, dmic_num,
 		intel_ctx->hdmi.idisp_codec ? hdmi_num : 0, bt_num);
 
-	codec_conf = devm_kcalloc(dev, num_devs, sizeof(*codec_conf), GFP_KERNEL);
+	codec_conf = devm_kcalloc(dev, num_confs, sizeof(*codec_conf), GFP_KERNEL);
 	if (!codec_conf) {
 		ret = -ENOMEM;
 		goto err_end;
@@ -1283,7 +1286,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	}
 
 	card->codec_conf = codec_conf;
-	card->num_configs = num_devs;
+	card->num_configs = num_confs;
 	card->dai_link = dai_links;
 	card->num_links = num_links;
 
diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index 824fb613c4869..f2f1954adf221 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -1442,15 +1442,6 @@ int asoc_sdw_parse_sdw_endpoints(struct snd_soc_card *card,
 
 			ctx->ignore_internal_dmic |= codec_info->ignore_internal_dmic;
 
-			codec_name = asoc_sdw_get_codec_name(dev, codec_info, adr_link, i);
-			if (!codec_name)
-				return -ENOMEM;
-
-			dev_dbg(dev, "Adding prefix %s for %s\n",
-				adr_dev->name_prefix, codec_name);
-
-			soc_end->name_prefix = adr_dev->name_prefix;
-
 			if (codec_info->count_sidecar && codec_info->add_sidecar) {
 				ret = codec_info->count_sidecar(card, &num_dais, num_devs);
 				if (ret)
@@ -1538,6 +1529,16 @@ int asoc_sdw_parse_sdw_endpoints(struct snd_soc_card *card,
 				num_link_dailinks += !!list_empty(&soc_dai->endpoints);
 				list_add_tail(&soc_end->list, &soc_dai->endpoints);
 
+				codec_name = asoc_sdw_get_codec_name(dev, codec_info,
+								     adr_link, i);
+				if (!codec_name)
+					return -ENOMEM;
+
+				dev_dbg(dev, "Adding prefix %s for %s\n",
+					adr_dev->name_prefix, codec_name);
+
+				soc_end->name_prefix = adr_dev->name_prefix;
+
 				soc_end->link_mask = adr_link->mask;
 				soc_end->codec_name = codec_name;
 				soc_end->codec_info = codec_info;
-- 
2.47.3

