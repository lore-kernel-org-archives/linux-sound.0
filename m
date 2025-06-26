Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49E62E5427
	for <linux-sound@vger.kernel.org>; Thu, 26 Jun 2025 14:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750947550; cv=fail; b=LHJsoEazK0iQLK+iV0HbOLl2gm/Es/PgBlMfoDL3P0iIjRta+XjLxy4RpK6W+DbPBxma8jlK36apOQluCHuKgG30r0RE1xbQIFiwJ59CONEPWBquSoEE1KvwIpMaBmxkoSxQYBOHcf74OWmlOzWaxL9Ss2OHjNioJE7Y/J8lv0s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750947550; c=relaxed/simple;
	bh=5AUTX/4JHyVVC/NbfZfMdaL8P1dQlpdpz6VzHxrv718=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=W6N7WYAHH0bhZVQYGl9nOruL3sFU3AUl+NhhthIZ83qOhL2vmDiKCEEH7Nb8eMY/NIryYEMSnolh4/sfrpdclnDEfYr9J3LTf7Jc11LLvhGnw7c/T/2Ji+65csMD82R6OyBmkoBVnYDuxDSvpeR3kBLyRS+7VG1haGVLVhpgwcs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=itkNaGgw; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Z/bhOmV0; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="itkNaGgw";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Z/bhOmV0"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QDF3gK023031;
	Thu, 26 Jun 2025 09:18:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=kVAv7GFvuwTCPxB6
	ElgiieCZyBQSiLqOV+aJ6w/CbF8=; b=itkNaGgw0C9Iqk3DvguD239HwIrMxkUj
	N9myntjP0XjlXosDUdAz6tDiXXTkUqEExXgQt0DR+8CsY3KPto0fXKBtJxzsW7gl
	odzMJ28re8eV9vFGWCbrQDD2VigJoMh/9nGU1vVmbqEM5pME9m/QflnIbcUDcAfP
	/CLRZatX+TduRA3yZmmKwmYu2WeSH3nrZICTiymgJETes9GIvAm3sOQ3sfS623Uy
	/O+lYKpE60GQmSK7xV77rhaKtYFUau4aGD/azms5Y/ZTBrg4pGWpbh+DUt4fUlyD
	dRnYfiN+w72YjWFB+TBzbdFC31Fvuzk6sZ4Zk1cHPkxqNucK00lnhg==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2107.outbound.protection.outlook.com [40.107.220.107])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 47e5tyxecb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jun 2025 09:18:50 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PPPlep3k4wti1Ku90XgPPhL1EtuzjiqWh75A2B4FXeR6B10BikZolLgsc++DRsBbNTUxw/oBUT+k1uciKdneyFZ/riktXy3Xslm67h4IkPQdNZtBwAhYsRsrd76Cad1wuS+N/t8ui0sfi1APkPsEFcrc/oEUldVh/doxjdOZ1hKwcOtzAQu/eKeUzv3aLW+gUFmvQ3jkk902lpQ32YSkLBxMASSxfxSuJLMbYr7zyd/LvzSB9BZcvpIMZdvwvf3Py92Ute55Y2wN+5vANyVx6V79+q3y3MJODBmuBgEsK1/aArkuZs/MiVoXiGYS93gM3CgjtMrHN9hfNY+dIki8Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kVAv7GFvuwTCPxB6ElgiieCZyBQSiLqOV+aJ6w/CbF8=;
 b=Gn9EKSh8Uk/PEuiGZ2olA+ppEU4dHoUaZ0DEGL0LvpUGIPsmYNBtgFmvXlWSp56tafRUFdglxOwKRmLCUzdclScbrj9FLJ+nkjrgxLcHLEpv3T5HEjNKZhPWfoCAicPeiYddz0l7vp3pAvA2IYUWfFuzwHkxRLnt/4TXuYUblUSUHXY8tps9n04LQRxUM0IbChkyeXoVmU/bu/RrpxOD/Jyo22bgq0tRQ5933jchFAp6PdLcx4nw6E7lNONybRm7J3EhjLihjPCeGwduySI1hSr+rlbraS0TThtPzXOyZSWWZ7KNHOT8u4kbRD+6Buxv2i9Z5mBhytMzFvKwtftF9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kVAv7GFvuwTCPxB6ElgiieCZyBQSiLqOV+aJ6w/CbF8=;
 b=Z/bhOmV0VdE7WvoF+sYcbwdY6uSqEi7KuQwwR0pUKvC1mitqAjEwFI7vuJrueH/+x0WgOVdQsP7vxtq8Az0YW9MSNqeQduJ1HtmiwnTvHJ1gEfnXtSyQNpUmX9LE3k2OkQFCL9sZAf5Web6pIOCpbKSLKWFp6CY6cfHcAnMIufc=
Received: from SJ0PR03CA0245.namprd03.prod.outlook.com (2603:10b6:a03:3a0::10)
 by PH7PR19MB5564.namprd19.prod.outlook.com (2603:10b6:510:135::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Thu, 26 Jun
 2025 14:18:47 +0000
Received: from MWH0EPF000A672E.namprd04.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::a2) by SJ0PR03CA0245.outlook.office365.com
 (2603:10b6:a03:3a0::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.17 via Frontend Transport; Thu,
 26 Jun 2025 14:18:46 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000A672E.mail.protection.outlook.com (10.167.249.20) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Thu, 26 Jun 2025 14:18:45 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A2298406541;
	Thu, 26 Jun 2025 14:18:44 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9233D82024A;
	Thu, 26 Jun 2025 14:18:44 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: liam.r.girdwood@linux.intel.com, peter.ujfalusi@linux.intel.com,
        yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
        kai.vehmanen@linux.intel.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: Intel: soc-acpi: arl: Correct order of cs42l43 matches
Date: Thu, 26 Jun 2025 15:18:41 +0100
Message-Id: <20250626141841.77780-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672E:EE_|PH7PR19MB5564:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8bd79b2a-d6c0-424d-5686-08ddb4bc5cf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|61400799027|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3CPzZ8xAyhqVtLaO6+1Ibhas7EwPw186v6/GNG5NbokiIF/n0uSgTVQFTuwX?=
 =?us-ascii?Q?fznRfebXaJT9MNbS7gyFPl5AdWP9MISXPIUFCvnZF+kR4fTUFgwrzShkAAuJ?=
 =?us-ascii?Q?YrBruo63c3DvGXMBxXvV+73duX0KChJpybQ9ugbrzSbORL0/U2bljVJBjxz9?=
 =?us-ascii?Q?A5rGWAGv637opCbVGv5RW9m9t43EIu/mfslUyf4X4/8BsE6iRb86mKjkPBTR?=
 =?us-ascii?Q?M2XqRIdPQhX8ApsliLdDqMLUXm9YDMiiGt2lhFpp6NdUWHFOQJwgiqZ76rSY?=
 =?us-ascii?Q?w6YFz0OPx/iDf0ohFTIkMKW5eaLrbjADukK8OlBKsiDcBvsdQmgNJbUY4Sqk?=
 =?us-ascii?Q?FrhYA962TQb80Gju42MiW1Fghv3l4XNdNrDofLG6rEW+VbVQ5eoy9KOtLrFe?=
 =?us-ascii?Q?79hbeb0Fsxgprn/GwrIHplG3bgt0y7En+Aa7izdDFmFnSGG9zHe/WpxOBN9P?=
 =?us-ascii?Q?LJMIBuYyuJF7pMbQF1LT+2gePJb5V0+K9vQ+OEOu3Zm3Nvw3oHSFrts2tgd0?=
 =?us-ascii?Q?C4Ud7qabMHZZSUhl9DnKe0atDjhsIo8+4WAImE++2eETegiUdr2rbR7HTR2j?=
 =?us-ascii?Q?59RLZHG2AOMhkrkLKYBykJvJpX1GHo1res2w902HdUtNuRzT/9t67FTZPFq5?=
 =?us-ascii?Q?o9fn5ecMfAv9RQuE2r7ByRO/FPpuQDfhD2j8iIFEwThb6nCLGId3VU+q4cig?=
 =?us-ascii?Q?0NVmyMTFSiqQeVgiwGzHxgZoOMJCYiJCLLIpq7C2ooSZd2HoPNWqkptcUMpT?=
 =?us-ascii?Q?a516spmovSoF9INGg58iflcSRyOWzV2nLDnRC1o13bunMoXk2zqiIaIfTrWV?=
 =?us-ascii?Q?gj8uNAFBdYfzZYcH/yZEzX+dGhbbP5uSNKq4t6dP+QtOTf3KsW+sKlnEqGE1?=
 =?us-ascii?Q?QAAuoQ3LMrprT3M3tTrGy1W8ZWJM9fcukMpKblqckjuqnT9HZL52sbs1wKkd?=
 =?us-ascii?Q?kmTpHiOPUqEGd+YQ81OeZ39PDo6mnyMCh001TqkQxmWKNCSEhsys0vLVLFmp?=
 =?us-ascii?Q?Vg7/fUkw36TW+b7IxkAvXqgFo4KPOhusA8R+QY5unk+TKc7gFskFC6ZhGS/m?=
 =?us-ascii?Q?D8unu8fnUWLVui7pCdbnFabYXVmwA7m8lqBBqDJ2/3hnYm1lw5KnmDvFkPpe?=
 =?us-ascii?Q?pIWgnlp+5FLmMytVd32qQ4bN3r5LO8eYL1mPOBhorGdJXJ+l5RuCbqXL2dLy?=
 =?us-ascii?Q?OWt77+0aOzaqJtC3WZdlRJKJV7D1IHZYoyZVJZqADfebC/HGc3Pr4cAmNDyY?=
 =?us-ascii?Q?Z/kwYFDYzLHJze0KlaPXlDOBs437VMcRwt7ONiwlyMAXJNqymugnQQSWRL7J?=
 =?us-ascii?Q?LgdIdvnkv2Wh0pkc6H0BjO206tzHMgs5CZGnc3zauLWPj61In1dkBx6lKvps?=
 =?us-ascii?Q?5Ok931tARZf9JQYsWfAPzYAyzsjCucO8Pbqp2W267KYpk9tTsd08doXLGNvK?=
 =?us-ascii?Q?/+sLTUOMxZTmxpZFQQpovd2SXqABtluVhDNUB+CRTCv6LftRsT62xG/oVHOJ?=
 =?us-ascii?Q?ZR6pp0DsnjYGEscAd2I/qtWw/I3Zglc1KQ5n?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(61400799027)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 14:18:45.9770
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bd79b2a-d6c0-424d-5686-08ddb4bc5cf7
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A672E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB5564
X-Proofpoint-GUID: a1K9VTmVNJiVOrEOeliee4-auQQQqThZ
X-Proofpoint-ORIG-GUID: a1K9VTmVNJiVOrEOeliee4-auQQQqThZ
X-Authority-Analysis: v=2.4 cv=P9E6hjAu c=1 sm=1 tr=0 ts=685d56ca cx=c_pps a=QkMd9A5hkDPJHF1mgsh70Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=6IFa9wvqVegA:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=z77_F88Z10gFaSvlVacA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDEyMSBTYWx0ZWRfX6WsWyxS0HdkX jyZRhVq/f+pt/vMcJi7hIvitxN7ROIdI/6bZCIV9DmxfqRs0ktYWyo5OJjRgEi+T1H04yp1uzP9 SzhAttRr9j7/FurITnmRm2K1BoxfxLEpE8c9p6CgJQK1+4VyoX2kiXCNGKYKnNjOgNWnWFNaeB/
 IT6vsfeeA+LoCSWbVD3ShCgYkuDimdQZFKpbyc3qg+/qD002OOF3A1l1fJO/F4hD47pXDKWSfMM j1WnmUmp+hCXpAwvt3Dzf1HoPyHSDLsK1wVTD4JF7M+nYZauEbm5H1XYxfemQgvHtxhf/sWqEtb pYypOsIb707AdYCOsofaodVUPGTaj7sXapY3fzWO1q1nCsQy7EWbV/7dKeLDjbd5P+oIzbWF9so
 k/1LiMvxLbhb/UkkiYvM2cKZVSjfHWGnOH+S42wNtvE9JXjCT/+sJAPP26iqbO/zaCb7yGBN
X-Proofpoint-Spam-Reason: safe

Matches should go from more specific to less specific, correct the
ordering of two cs42l43 entries.

Fixes: c0524067653d ("ASoC: Intel: soc-acpi: arl: Add match entries for new cs42l43 laptops")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/intel/common/soc-acpi-intel-arl-match.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-arl-match.c b/sound/soc/intel/common/soc-acpi-intel-arl-match.c
index 73e581e937554..1ad704ca2c5f2 100644
--- a/sound/soc/intel/common/soc-acpi-intel-arl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-arl-match.c
@@ -468,17 +468,17 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_arl_sdw_machines[] = {
 		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
-		.link_mask = BIT(2),
-		.links = arl_cs42l43_l2,
+		.link_mask = BIT(2) | BIT(3),
+		.links = arl_cs42l43_l2_cs35l56_l3,
 		.drv_name = "sof_sdw",
-		.sof_tplg_filename = "sof-arl-cs42l43-l2.tplg",
+		.sof_tplg_filename = "sof-arl-cs42l43-l2-cs35l56-l3.tplg",
 		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
-		.link_mask = BIT(2) | BIT(3),
-		.links = arl_cs42l43_l2_cs35l56_l3,
+		.link_mask = BIT(2),
+		.links = arl_cs42l43_l2,
 		.drv_name = "sof_sdw",
-		.sof_tplg_filename = "sof-arl-cs42l43-l2-cs35l56-l3.tplg",
+		.sof_tplg_filename = "sof-arl-cs42l43-l2.tplg",
 		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
-- 
2.39.5

