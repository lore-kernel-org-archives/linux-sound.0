Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7FF1CCEE0
	for <linux-sound@vger.kernel.org>; Thu, 21 Aug 2025 08:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755764819; cv=fail; b=KoTUYqi2loEHlQHr43c1Hr8flKlB1cXLrFSPMfPHEEa64dk9Mmta3m9SxXP5wpPODtSqTOjMHko2ezjV8aLHyjufOYErgwga+6AAB7l435u6yp5R7LdAFLjPbixIRmRoKigZCKiuRJlc1CYiv9E+EtJ25cYJ3gTH6XHAK7km0jc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755764819; c=relaxed/simple;
	bh=iLuN4ahcL6pNUeHWahPPu2XmMr0yYvLEAcshUbTQbD0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xjn8DaDngbTRyqnENL+rblyBsWVKupmpTIxNN+sC1g8HT9MRyQ60mTc57Mx0DgOr8ViUR0W6We5/IfO3SIvOCH8maOoZJx0wEQa42Y680oAQghNcCh/Uy0jrYAPHbQDUi0YEVs9hENdb4JCyXy9rjwQ/kQJzfKSTPZXDPH/64wI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=hTlNKwgg; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=F6XM8j4H; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="hTlNKwgg";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="F6XM8j4H"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57L2FSZu3325127;
	Thu, 21 Aug 2025 03:26:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=U1HFdF7sf/tJvxAPN9B9zkw+A6VN8qogCCBpRoco+HY=; b=
	hTlNKwgg0Rx0cIoFiNWZ7XimcSXGUCzlflEHGUtAkreMxq24NjhxJiFMOQhctMfP
	D8HIOKrtWEgKaWVhld/3EJCPhLdEdMtkmNwLKQPslqpdjnZ+W9R/b0WzekekDNm5
	H2VMtBSHO/R1Q/69+JVuQoDs2FDErjB31n3KGt6dWReJBK9nzfrUbTl+2fBoQ+Xw
	QB1Hva5A0KXJWo8N3i7eV1ltJEKork6zuy5/o/VbMn1vzYPAWlcHqvfdpAyGh/Y1
	H+vqlueFW/qeX85yh9MMKCAUMoUwfJrPYzFuBWk1ceFmMC3zwTK8fhaNzCv4pSNx
	kzrACK/Up9zmeyUonCLlnA==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2090.outbound.protection.outlook.com [40.107.94.90])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 48myd9ajj1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 03:26:48 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dS3rGJIAlOa8ABPYCypN1PCeKUiZR8+hbNFMZSggFbNZuLOnTa02XnAlWFER6STu3D8mlHoNkbwdgUd2y0qA4l9dYXsPT+8pbjelizQkG8doWnOf950beK+lwhlZLsMU03IXbyDDILIqBKVV6IQwrSe+jmQ/fQkw4K1gjY4YWoe6JMtQ1WftYjVahWMYpv6fymt1deAHyT2tY3umY5FWTnfHgEH7zCBSOL3hAOWS6fWWqDEjO+dyJIsESHdNrk1gLn5tRG5rEeeDgwzjnmMNRPUBgT0hqe4X7/aXI+Jg/BvtvSzSjsFRHn6gPYftnrRVmqyFeJoN8XzPxEuMY91SiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U1HFdF7sf/tJvxAPN9B9zkw+A6VN8qogCCBpRoco+HY=;
 b=Hs0S7xHUtnSH1wlrpRe9iepdqE1CvUf74qAjLngpTfhgp6fzcUAOm+Gu0Z4ivvrDnA8XWVw2EV3W1brxMGjKzCXE80grsQ/vfa9HjxUV33JVpX6zjMPOYx9Y9kfAFbR9XSX8HURb+2mQFpxS7+oFOyxrZoPRXL26ZndENJ1z9wWf3jWNyIFWM5jaUNwsR95szkxewZFVUheuBXPqeoaVkdunXynRtCC5ZC2dLRB68Jh8WuS6HdIf4tIwia2VYdfPOOstAsbtoMhWetOumcZTdNPfQ0/lMZ7yryYl9uCcg3rw+GZxiDG3dNK5zhRz9q8xDE0f+J0dcsW8n5cAmj9qlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U1HFdF7sf/tJvxAPN9B9zkw+A6VN8qogCCBpRoco+HY=;
 b=F6XM8j4HQsOFbb8WQV717EQecnKVFzYg3wofsWCKVicWByuIJtxnDqEUinSZTKrXmGi2cZXqyW+7WK9O8PoR6u/ef7dPWBeL3FmaoxtQql14fKRf7RD8lm0MAap9PTRwK2mEt+vtPcah60AvidLbIVV0OG/g6T4hYCD79dtFtS8=
Received: from CH2PR07CA0049.namprd07.prod.outlook.com (2603:10b6:610:5b::23)
 by DM4PR19MB6533.namprd19.prod.outlook.com (2603:10b6:8:b6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Thu, 21 Aug
 2025 08:26:45 +0000
Received: from DS3PEPF000099DA.namprd04.prod.outlook.com
 (2603:10b6:610:5b:cafe::ef) by CH2PR07CA0049.outlook.office365.com
 (2603:10b6:610:5b::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.15 via Frontend Transport; Thu,
 21 Aug 2025 08:26:45 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS3PEPF000099DA.mail.protection.outlook.com (10.167.17.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.8
 via Frontend Transport; Thu, 21 Aug 2025 08:26:44 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 7E796406552;
	Thu, 21 Aug 2025 08:26:43 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 71C8F82024A;
	Thu, 21 Aug 2025 08:26:43 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, lukma@denx.de, mans@mansr.com,
        ankur.tyagi85@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 2/3] ASoC: wm8940: Correct typo in control name
Date: Thu, 21 Aug 2025 09:26:38 +0100
Message-ID: <20250821082639.1301453-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250821082639.1301453-1-ckeepax@opensource.cirrus.com>
References: <20250821082639.1301453-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DA:EE_|DM4PR19MB6533:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b705a54d-5afd-42ab-16d0-08dde08c76bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/bwZ+Fk3FyIQuJJeHctuT7IiJJPQQhYFof8vb2AAj3y/N3vsye0HjbbAZVFk?=
 =?us-ascii?Q?LP5gNg5NjXfJHEygL3pRaOBJsEy3kgH95zpcJSnO/EupKa9YO9fiv+g8Xqs/?=
 =?us-ascii?Q?X3U7W/kyxzhmnGGBgH5eHE8/Cvh2iHCFiwFWNll4UfQjFSKxADSzNJbkKxc/?=
 =?us-ascii?Q?MWpsEanprWCuVgMCQxgBxFscY6kZYmQq2Vmmb8BfvqmFHsc7EEofgS4MR+7g?=
 =?us-ascii?Q?VkKi2y5n7L3cR6VEG1cnZI6XsNwlyIRTN1MmIEbr/7k1Vf8fr8ZLHDIaSUur?=
 =?us-ascii?Q?DskgPQ0hcK3LyOAbd4VqlQaBg9daLTQ5g/31JBxBt1x4MUo0Y78aNkzo+6Sc?=
 =?us-ascii?Q?bJnL3ymKwQhIZqsJCv8Yp+UDb4oMfqjYCRDcBLCfzy5cv+gpG1c3eFNZecb5?=
 =?us-ascii?Q?2sVrYQ0wav6iWUe3SiXFJx/bBMjs7EOrA+o6dGCjffr60pLhhN5JuItjvrdS?=
 =?us-ascii?Q?Ld8gxlw5YD5zEcUy0ZPsjJhIGwnsBOLakk3YgD4cws189bwj84e1O8/KBkBo?=
 =?us-ascii?Q?vd7tiWpwDE7Jd06f8GQZy1F5N/5tOwawKs/iyF96MJMtxO6tbVR2kTgblS61?=
 =?us-ascii?Q?k/bTAOMBxuOUknR2jHdvnKJP6H1zY6zcq7g/K8LFl/rH/fwwUKMP35Pt/NBP?=
 =?us-ascii?Q?HKTwg83Uom+xieAstmwPTtADXXywmEK/rGxNVTVToULQdQWBOc8TMvTjySmk?=
 =?us-ascii?Q?M9GucOZ4TwfXl2ricCRMovBY95ceTAo5oO6r8ijrMBy/8Xpcadtrl+SUtopT?=
 =?us-ascii?Q?7X0SrrAFpBc4Pugv8Q/ecbnxJQsLizcoYG+TfYQk0HVOnt6OTZXGyVgfECkJ?=
 =?us-ascii?Q?zeD23klYQhCa9sNoHuaO+EwfDlcNUbrOWlkgSqEPSYnhYYUrzEkKl4nuWg1b?=
 =?us-ascii?Q?QbBo/w8akMoXsFfx/MbfHCNarPg/gBMTminanVZymo/YEcJYkAOOuTGtlRK+?=
 =?us-ascii?Q?sDkDqEeeSicHSK9RrLloYHXxveiJecEGQw9Y0zDh1SLwPa6S770ZqnslF4yA?=
 =?us-ascii?Q?vfxJhfkPNvQ6nvpI1U17pCPS9x6iYMkItZFpepKXtfLfdsf7v7ofGJ3MYCEo?=
 =?us-ascii?Q?AiLtHtCGxfweOq+C4TIxYjibT7k78OSj1mWv7W909TLhNfpPgo+GEtJzj6YJ?=
 =?us-ascii?Q?tKUKEA+Erp8/rxFiCBSyP9IGLHlxzGzLTMhp01peO6AnE7Xxaasv5Fc4BZAm?=
 =?us-ascii?Q?k6UyyaE4VAc1yJXIw+MJcNRG1JoxAlw0ZVXeyAGO3JKAT9Ai89S7qZCknmqX?=
 =?us-ascii?Q?DxNlCpEX0p6XDZCrMlEv6IB0+vsnnHpV7qK/E5bTvTCecdNNxxKazCQPwx8m?=
 =?us-ascii?Q?PvRneKINSYP5Vm2oHqEMjR4LCkHwk711kRHV8UIm1LlM+K+2AWXk8WUR5upF?=
 =?us-ascii?Q?Wc7YWurhTUP6lOfivEvb8/0EX+yYQ6ciY9nAoOcQvskLNhAPOWl6n4A1QzDG?=
 =?us-ascii?Q?AtLG4xSELOdTxTOtdgGxHUc9meitghHEFw4rgwo24sWVrwP/XKtinzeR7Fnd?=
 =?us-ascii?Q?6Uk1Ghu8thqGFNPFl9TNbWReZU4ugYI19YK+?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 08:26:44.5955
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b705a54d-5afd-42ab-16d0-08dde08c76bf
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR19MB6533
X-Proofpoint-ORIG-GUID: alybYmLUe1bAp1piufWO2EAs8PbeFWWC
X-Proofpoint-GUID: alybYmLUe1bAp1piufWO2EAs8PbeFWWC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIxMDA2NSBTYWx0ZWRfX4RRhm5IIBso4
 HIxMlSJXME+8rEuBMU7NgurlOf2F+8GP+zrnrhIQ2q14am9ZO/eb512FGFgFk9/m28dy8SAdyqs
 Spb/TVTGXxqR6xO8WJL/47a/eYwdIdkrT8yz5kdZa6dyi47MTnLgo64a5EAyDeE5eUBNggDhZvo
 Rin8HsMNqi6cV9D4OGJeLtp/UR+AikRvi+He0Q28e668LrVcm8huPA4JrG3r+ehHhzBRp1rjn92
 f7K8GYlR098cuGRZFOl2IFde9hOcFklwtUtiC0bS5CJ6q7NDpVmZOha0bMyhFqJ/5d2ek+am8Nt
 X0R2uoyeZMIKDVcKtjOjUfkio/wWcoK9Qwn88LqbuqrCdGz3ZHQxq/X7GBH9TjnQJIxuXQ6qvw7
 ciHb7Q5mDgDiijvd42OKX88G9BYchA==
X-Authority-Analysis: v=2.4 cv=WIwmnnsR c=1 sm=1 tr=0 ts=68a6d849 cx=c_pps
 a=aK0lWSFyTQY9KTcR+53xQQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=2OwXVqhp2XgA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=pGLkceISAAAA:8 a=w1d2syhTAAAA:8 a=aOC138GHNtJUrrzWcgIA:9
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Reason: safe

Fixes: 0b5e92c5e020 ("ASoC WM8940 Driver")
Reported-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No change since v1.

 sound/soc/codecs/wm8940.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8940.c b/sound/soc/codecs/wm8940.c
index 46c16c9bc17a8..94873ea630146 100644
--- a/sound/soc/codecs/wm8940.c
+++ b/sound/soc/codecs/wm8940.c
@@ -220,7 +220,7 @@ static const struct snd_kcontrol_new wm8940_snd_controls[] = {
 	SOC_SINGLE_TLV("Digital Capture Volume", WM8940_ADCVOL,
 		       0, 255, 0, wm8940_adc_tlv),
 	SOC_ENUM("Mic Bias Level", wm8940_mic_bias_level_enum),
-	SOC_SINGLE_TLV("Capture Boost Volue", WM8940_ADCBOOST,
+	SOC_SINGLE_TLV("Capture Boost Volume", WM8940_ADCBOOST,
 		       8, 1, 0, wm8940_capture_boost_vol_tlv),
 	SOC_SINGLE_TLV("Speaker Playback Volume", WM8940_SPKVOL,
 		       0, 63, 0, wm8940_spk_vol_tlv),
-- 
2.47.2

