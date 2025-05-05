Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B39D191F95
	for <linux-sound@vger.kernel.org>; Mon,  5 May 2025 14:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746454472; cv=fail; b=A1/+omccjDvSv5N2gvCRkx5wBYfsO6xraHtmv9XCTS8AwcMPVCWMTRNFjmDCm4zhK4bpz3HHAfugY6UK+PheYn/ZhdZfY22zFrZJPDAXQcTXhNgbYfltfBtFBEL29210L5qpjZQGdbxWNv2YFDnN+a3rELvAHjNWYwiaNDG6dQ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746454472; c=relaxed/simple;
	bh=hFe5EF0lLO+4Sz++iKHh2/vP3+3eoo9uwI1G+xaX2i8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xzoiw0iHUBwBlhKeQvgHbuKeG7GVSiXlOSctFE7+rXr4bwM5OYafCGmJmoVdAydgsFfe2yyZGFG+m7U3HOYZDYc0kgYS531JeYOdVoF3yNoCvfWrYe+2NwRo8lOATBVvJIcSzhtj4vHmtAv2Izmih/Cp6KoBqnwZhP8DoZ6E2rA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=AKL55NZ6; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Letl1Xlw; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="AKL55NZ6";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Letl1Xlw"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545CCn8D028441;
	Mon, 5 May 2025 09:14:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=egFQMP0JLG9RVN2KZN+2hH0hlTMBf5WoE7zGeygnGC4=; b=
	AKL55NZ6oE+RyRia5TadaS6B2V0wRkBGyiQD/YLXxEp63sRTarFXcgcV4w68z5SJ
	XqkPjL9bAxKux4GvXxif3NCDTl0JHZrON5nQvweC0nBal72yKCUUsqm2eZIaMDSt
	wr1PxLcV3AiOvr1RAPiRevkahWmykadPwYH8hdDwXOUmrNgk+NgANGRRJ8diW2Ss
	stlpjHHRSXALolVZ1197+YFMRWULqqQIDv0rxhju8HYK2WM2EyPYjqXgNPIENA+V
	e4vs3m9Bug01tRnsYYTed5CnuvK6Kh6VHEevGMP6D7TmglKYD4l3lAsGNBVGaQjh
	qVxbjIq3dLrN6R+YQ/fBIg==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2046.outbound.protection.outlook.com [104.47.58.46])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 46ew4n84s2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 09:14:19 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LxdOQXAlpraI3lBizWwLDDlrU6GvYgMsklDAbBqYh01eS047FGomxyfuwwuaJcjHERvkpX+ng9WUW/E64soovVuwobZBOwUz0Ryotf4cWXm8pRwggL+Yp/jdTqX/8/vlkb/5RP9wBeQy312x7/NLmJ+sQ3vKPO3aRob7AW+kpV3t5ajAtPeLzh4Uc9XOpH48pRfRFWZ5EArrAYBZtC2ZR+sb0Q08EtdU97XXv/Dt9g/55kQJw3wi/ccRptbjBn5yeXkacYEeuJrp67DfpgvJW7Lj7gf469XcAI8OuX1uXQFKleLAVuRATZVzv1jaTmL1BAmjv5PZntYsgJIVUOiU5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=egFQMP0JLG9RVN2KZN+2hH0hlTMBf5WoE7zGeygnGC4=;
 b=y4sDA348MHAwSvLiivdEc47/5je/HtbmPb+hJ2RFp79bV7De4UZCm/PFlGdwguZeTxg9pVzjV82uXg0mG3GWcdy9TjxRqEOjXO10ooaOYKIQJ5htyOHgc/8z4BOpIB1L2DqE336G8/M85YpULigztoN28RvJF/uSjTcD/ALQR7yo5qiJOrPIImiwPPCjx/8XkTULnXnBviAHiERSG3N0n8wmIzBDNaQHwJtRLFEjBx5Q7gGmWAOv6j7bx/ZICVOZbYprcWWRFMpEZq+2Y7lY/VQC1nuFPD6J/ArYMOLJtMTJ9PcKo5WJme5gfAhztMYwjJk+5nRdlsc368TrpbFRgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=amd.com smtp.mailfrom=opensource.cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=egFQMP0JLG9RVN2KZN+2hH0hlTMBf5WoE7zGeygnGC4=;
 b=Letl1XlwNelpRlMv2R7EZLUV15wwtD8DYXlo6fMORmEXb1WgoHTPyMaOLO7X72pGgHxOQ4fjaD6eSg6yU2wqWV0GMP35F7723nIpAXXu7P+zqDjeIKDypk1Rt96sl8tosKeQxyTp5QukdKZ8WpfRzb2oNT43TwZzrIMf3/HNYqE=
Received: from SJ0PR05CA0091.namprd05.prod.outlook.com (2603:10b6:a03:334::6)
 by DM4PR19MB6173.namprd19.prod.outlook.com (2603:10b6:8:b3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Mon, 5 May
 2025 14:14:13 +0000
Received: from SJ1PEPF000026C9.namprd04.prod.outlook.com
 (2603:10b6:a03:334:cafe::f2) by SJ0PR05CA0091.outlook.office365.com
 (2603:10b6:a03:334::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.23 via Frontend Transport; Mon,
 5 May 2025 14:14:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000026C9.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Mon, 5 May 2025 14:14:11 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 288C6406547;
	Mon,  5 May 2025 14:14:10 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id E9C5182026B;
	Mon,  5 May 2025 14:14:09 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, ranjani.sridharan@linux.intel.com,
        kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.dev,
        Vijendar.Mukunda@amd.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 1/2] ASoC: sdw_utils: Remove num_platforms from simple DAI helper
Date: Mon,  5 May 2025 15:14:08 +0100
Message-Id: <20250505141409.2614010-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505141409.2614010-1-ckeepax@opensource.cirrus.com>
References: <20250505141409.2614010-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C9:EE_|DM4PR19MB6173:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6095e852-b670-4c12-1b58-08dd8bdf1bed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jCuJFCBa+G+yYIo9dQTNWr489BjyoOptERzPhf4Bh9IWfa+oyNMQ79SjLY0l?=
 =?us-ascii?Q?oSuq8s8ZXy7C5yaSP+KdSz4eWDXmv3wzH2hPjEvPNYl3AejASh6zrk8ZdWV3?=
 =?us-ascii?Q?WTKdRdRULWsmKjy+r2FXLZlosqQk1ieXuc2MYbWaxAkO71ljMam1gjc+0g0e?=
 =?us-ascii?Q?Y9VUzceeizJPyQAe3IINhXo7+/U5cIag7mXeCIZ/W8sqWirBzvkqDErqrsFy?=
 =?us-ascii?Q?g4ItIMUSaMeBf/mEx/9v5J7c8ZJbWzm+gtkYDS1whpUNeduW4Weetj/cO2Uv?=
 =?us-ascii?Q?ey6iv1EL7/+TwWhvCSrcsYN7oa2TTi2MGSsMttbeC72XAWElLPNsn3GiZOkb?=
 =?us-ascii?Q?zhTK0VtcFc6FvRDPfe+EE1nFEJYJZaXOOwiO8iA3OIf7WrY4uW9Paz9g+w6U?=
 =?us-ascii?Q?VlDUt0daKJuqHJwwNNF9unb5QZz1vNJvi+TX5B2xuzOxH5mSQ4z47zUNayya?=
 =?us-ascii?Q?hcP/fWJCbl1j3uCrLheHrZw8fOn/KKoIfV32JCsKDBwZ/kabvX6BatHCkQak?=
 =?us-ascii?Q?RP23dtJd8xrC62tUaPq8pQlheQUNWsKrh+K7L0k5i5BHwacEkLfEmnfeXbhY?=
 =?us-ascii?Q?D0GR6pCgEQBWyXLQIMUdUUf5GKdkS3W8GY3f+IsuymeeTdSDXeSDABdizREE?=
 =?us-ascii?Q?s7v2wWvqwXBJeFw84noCD3J81lPW0XDCcsD6Aww3m04dlFSmUup/4I4cYOai?=
 =?us-ascii?Q?rR9v+8hkqtQilzFTHkP2Aw8mLyvpkIPxztP91QLGEjQnFrARQnAmxJxnvDs/?=
 =?us-ascii?Q?hudNE/uCHskj/kbyLlF2vDjLVBMgOVq4is9nRr1XgAQpen7m4CafYxZ3hgpx?=
 =?us-ascii?Q?4UXwX2Ac8aiJHegsR9iugnN5G8m711xe0cdmEr3raiStWcxG4ootmjNx3IrU?=
 =?us-ascii?Q?145NUreyBtMoK0h2vQLLCcHszBwC2h/vqJN99Hk1QisxJ3MCEoqVDNTD7hxX?=
 =?us-ascii?Q?y8L3R5qKAJUWYJfniccWgHyt87LNABT2dvTDIKJkqLvW2a2/jhHDimzb+yES?=
 =?us-ascii?Q?s82byLGAzV0hZ0p8noYF/CUsbX+OqtCSGDOKavZuZ+HzK+NwiqHxNkW70phS?=
 =?us-ascii?Q?/DeLm7Nud+jtdjlZCQA+KAhE2T1+BxLgQT2hnAfahCNhcEDP6IYA1CJU7EHC?=
 =?us-ascii?Q?HAWIVcOH1FTcCGreu/JmI7CfWbnHbNI7LydNn4aeODPtki0Q6S7mNZsRUK1H?=
 =?us-ascii?Q?OMgcC60AEZvDr0AZbgRo4Zw0oqdT4cIpAo6tSobXVcDJAb2+tDXcOJFaM1UV?=
 =?us-ascii?Q?binAyI6lbw42PB12D/DWPp51cSF/rhipqO9FA5h2yI4hpFGLAJO5wXyIjzuA?=
 =?us-ascii?Q?IcQdkAA/Ar4mcID4j2TbIVpscluWIGlKmZXIAQTvrqdaYWowc/Lx7OCl3dnO?=
 =?us-ascii?Q?uACIF75mY4QwWpcH9M+wS7jODoYHEEwdP0eyKn9PSaMJhnGwv88Ar+lNeVZE?=
 =?us-ascii?Q?A8lzLpu+tGWnmDOumYsHyrpDKoySqkd/FiPAGDlCaq/vSc/tQu1rfHka+9EQ?=
 =?us-ascii?Q?l5wDYDaG7xGbdKXUWLdP1J4KEnACGi25NR59?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(61400799027)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 14:14:11.5564
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6095e852-b670-4c12-1b58-08dd8bdf1bed
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR19MB6173
X-Authority-Analysis: v=2.4 cv=KoJN2XWN c=1 sm=1 tr=0 ts=6818c7bb cx=c_pps a=ur2hu7Zt/Tb0cWAHmjvzJg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=dt9VzEwgFbYA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8
 a=98xO0Hqg-jp0wvTIZKsA:9 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDEzNiBTYWx0ZWRfX19iUtc1moZSu JSY9Ee+HASsBQKGnSpgDtmFTg8wBKopLMHNsjSHzxopss8T/moovde5LIiMVyA+K27yTlzujL1l +eXYpX9ra76i9Mm1wuxxV04RlRRv+TYUs2bWSWljEedHLpZ/dkKf09/X3LR1IGWRq7RsnW2jRqE
 bgZ1myjjrRv86oD/V4Pjb/0d8vL1hXGwfFtT0WOlvMoxPSVGaobechAoYrrSDSxH04n/Ps6tNV0 xZe3Vllx8aoLA2rC9Nn78M5bqlm0CEq8i8oukbTWtU/G/s9hJnCWhjoTRA2ZHGSuobAni3OVPfq JRHFH/muBd8deQoft7gMcIDID24GP7UCtT4fwImJS0grhO+jCDLaDTNR2qvJGOozrvph78w8RoV
 msEyw6s5qgKCv8HbBozv16YrAvUUdYDN3aJnXkUj3Ves25Ri4lOU2FXLu52xMgQFuvMvjMvx
X-Proofpoint-ORIG-GUID: RbW2v1F_nsjCEcB86nYzWM6DSHEYjPjg
X-Proofpoint-GUID: RbW2v1F_nsjCEcB86nYzWM6DSHEYjPjg
X-Proofpoint-Spam-Reason: safe

There is no point in passing num_platforms into
asoc_sdw_init_simple_dai_link(). Firstly, as a single pointer for the
component name is passed in only a single string can be passed and
secondly if it is a complex DAI with multiple platforms it would make
more sense to use asoc_sdw_init_dai_link().

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v1:
 - Update commit message
 - Removed fixes tag

 include/sound/soc_sdw_utils.h           | 5 ++---
 sound/soc/amd/acp/acp-sdw-legacy-mach.c | 2 +-
 sound/soc/amd/acp/acp-sdw-sof-mach.c    | 1 -
 sound/soc/intel/boards/sof_sdw.c        | 7 +------
 sound/soc/sdw_utils/soc_sdw_utils.c     | 9 ++++-----
 5 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/include/sound/soc_sdw_utils.h b/include/sound/soc_sdw_utils.h
index d8bd5d37131a..b63021f5afaf 100644
--- a/include/sound/soc_sdw_utils.h
+++ b/include/sound/soc_sdw_utils.h
@@ -159,9 +159,8 @@ void asoc_sdw_init_dai_link(struct device *dev, struct snd_soc_dai_link *dai_lin
 int asoc_sdw_init_simple_dai_link(struct device *dev, struct snd_soc_dai_link *dai_links,
 				  int *be_id, char *name, int playback, int capture,
 				  const char *cpu_dai_name, const char *platform_comp_name,
-				  int num_platforms, const char *codec_name,
-				  const char *codec_dai_name, int no_pcm,
-				  int (*init)(struct snd_soc_pcm_runtime *rtd),
+				  const char *codec_name, const char *codec_dai_name,
+				  int no_pcm, int (*init)(struct snd_soc_pcm_runtime *rtd),
 				  const struct snd_soc_ops *ops);
 
 int asoc_sdw_count_sdw_endpoints(struct snd_soc_card *card, int *num_devs, int *num_ends);
diff --git a/sound/soc/amd/acp/acp-sdw-legacy-mach.c b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
index 2020c5cfb3d5..0bb06cb7d0f9 100644
--- a/sound/soc/amd/acp/acp-sdw-legacy-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
@@ -321,7 +321,7 @@ static int create_dmic_dailinks(struct snd_soc_card *card,
 	*be_id = ACP_DMIC_BE_ID;
 	ret = asoc_sdw_init_simple_dai_link(dev, *dai_links, be_id, "acp-dmic-codec",
 					    0, 1, // DMIC only supports capture
-					    pdm_cpu->name, pdm_platform->name, 1,
+					    pdm_cpu->name, pdm_platform->name,
 					    "dmic-codec.0", "dmic-hifi", no_pcm,
 					    asoc_sdw_dmic_init, NULL);
 	if (ret)
diff --git a/sound/soc/amd/acp/acp-sdw-sof-mach.c b/sound/soc/amd/acp/acp-sdw-sof-mach.c
index c09b1f118a6c..2141ccb8329d 100644
--- a/sound/soc/amd/acp/acp-sdw-sof-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-sof-mach.c
@@ -245,7 +245,6 @@ static int create_dmic_dailinks(struct snd_soc_card *card,
 	ret = asoc_sdw_init_simple_dai_link(dev, *dai_links, be_id, "acp-dmic-codec",
 					    0, 1, // DMIC only supports capture
 					    "acp-sof-dmic", platform_component->name,
-					    ARRAY_SIZE(platform_component),
 					    "dmic-codec", "dmic-hifi", no_pcm,
 					    asoc_sdw_dmic_init, NULL);
 	if (ret)
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 095d08b3fc82..29b813943ccc 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -994,8 +994,7 @@ static int create_ssp_dailinks(struct snd_soc_card *card,
 
 		ret = asoc_sdw_init_simple_dai_link(dev, *dai_links, be_id, name,
 						    playback, capture, cpu_dai_name,
-						    platform_component->name,
-						    ARRAY_SIZE(platform_component), codec_name,
+						    platform_component->name, codec_name,
 						    ssp_info->dais[0].dai_name, 1, NULL,
 						    ssp_info->ops);
 		if (ret)
@@ -1020,7 +1019,6 @@ static int create_dmic_dailinks(struct snd_soc_card *card,
 	ret = asoc_sdw_init_simple_dai_link(dev, *dai_links, be_id, "dmic01",
 					    0, 1, // DMIC only supports capture
 					    "DMIC01 Pin", platform_component->name,
-					    ARRAY_SIZE(platform_component),
 					    "dmic-codec", "dmic-hifi", 1,
 					    asoc_sdw_dmic_init, NULL);
 	if (ret)
@@ -1031,7 +1029,6 @@ static int create_dmic_dailinks(struct snd_soc_card *card,
 	ret = asoc_sdw_init_simple_dai_link(dev, *dai_links, be_id, "dmic16k",
 					    0, 1, // DMIC only supports capture
 					    "DMIC16k Pin", platform_component->name,
-					    ARRAY_SIZE(platform_component),
 					    "dmic-codec", "dmic-hifi", 1,
 					    /* don't call asoc_sdw_dmic_init() twice */
 					    NULL, NULL);
@@ -1075,7 +1072,6 @@ static int create_hdmi_dailinks(struct snd_soc_card *card,
 		ret = asoc_sdw_init_simple_dai_link(dev, *dai_links, be_id, name,
 						    1, 0, // HDMI only supports playback
 						    cpu_dai_name, platform_component->name,
-						    ARRAY_SIZE(platform_component),
 						    codec_name, codec_dai_name, 1,
 						    i == 0 ? sof_sdw_hdmi_init : NULL, NULL);
 		if (ret)
@@ -1102,7 +1098,6 @@ static int create_bt_dailinks(struct snd_soc_card *card,
 
 	ret = asoc_sdw_init_simple_dai_link(dev, *dai_links, be_id, name,
 					    1, 1, cpu_dai_name, platform_component->name,
-					    ARRAY_SIZE(platform_component),
 					    snd_soc_dummy_dlc.name, snd_soc_dummy_dlc.dai_name,
 					    1, NULL, NULL);
 	if (ret)
diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index 60b731673f3b..30f84f4e7637 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -1067,9 +1067,8 @@ EXPORT_SYMBOL_NS(asoc_sdw_init_dai_link, "SND_SOC_SDW_UTILS");
 int asoc_sdw_init_simple_dai_link(struct device *dev, struct snd_soc_dai_link *dai_links,
 				  int *be_id, char *name, int playback, int capture,
 				  const char *cpu_dai_name, const char *platform_comp_name,
-				  int num_platforms, const char *codec_name,
-				  const char *codec_dai_name, int no_pcm,
-				  int (*init)(struct snd_soc_pcm_runtime *rtd),
+				  const char *codec_name, const char *codec_dai_name,
+				  int no_pcm, int (*init)(struct snd_soc_pcm_runtime *rtd),
 				  const struct snd_soc_ops *ops)
 {
 	struct snd_soc_dai_link_component *dlc;
@@ -1086,8 +1085,8 @@ int asoc_sdw_init_simple_dai_link(struct device *dev, struct snd_soc_dai_link *d
 	dlc[2].dai_name = codec_dai_name;
 
 	asoc_sdw_init_dai_link(dev, dai_links, be_id, name, playback, capture,
-			       &dlc[0], 1, &dlc[1], num_platforms,
-			       &dlc[2], 1, no_pcm, init, ops);
+			       &dlc[0], 1, &dlc[1], 1, &dlc[2], 1,
+			       no_pcm, init, ops);
 
 	return 0;
 }
-- 
2.39.5

