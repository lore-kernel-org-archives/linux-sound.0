Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED09E341AC7;
	Tue, 16 Dec 2025 14:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765894940; cv=fail; b=b583fpZ8iC0j/UzNSnXeWUkGaWJbLQhmHaRys72gGXciB96aUKriZ31xZJ5llm6w28dMNjxhfPD/u7WHHxGMJAAdDU4zR2AIpxaSt4WoSWy66LSlVnhjpo/0AVurQB/YKRYs2OYc1lkYr4bv9faX7NDXcYE/6SVGe6AbLoo47Z8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765894940; c=relaxed/simple;
	bh=ENmaXWcxoSyc9cNNm/p8ZYLtO2aVstn/q249BVboS7A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YRG4Thhp+UmPwDeaGlRuZMIL+tnANfJD+EQmjg9ypxPFLIspDRICyoqCiuFboT40q7FmW0x9hBh2F0REr2c95g2eXb+tqL0N+R5m3LqQeIYZlrwjoxS+7uizgbmsGuIJp03bjTcOtThHUho37UCG+4aF/AgMTO65ktTGn+Wh7As=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=cHSFkmab; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ZWCiR52P; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="cHSFkmab";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ZWCiR52P"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BG693Ex2491165;
	Tue, 16 Dec 2025 08:22:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=NPU7Eu0V7Ez1cO6f
	FphLAAu6gVusinbIk5iMcxNyr3A=; b=cHSFkmab52U2Vu9iwpbltAqOqN7f+woh
	0XOP0wj2NXKovcro4slaFeAsV118Zxxa4CCHcrJWO0+9fYjgfA4bQgN7LF6dGgHG
	77HTrd79vBvxfDxCxvVAJ53nV6FnCYThGpOfJzoSD9VUe2LvlQC/kin3P9wpSPHM
	1XG6sYXECItu7+LH8rsNcs6fppXGKHta1nMz+f0Sd37ZHpZ88GYPw1OBYfNZKdxG
	W41YNOp0Wl1hqc+u4AtantPQKIv3CzUsFxtPl31Dn+GfEtxMOkFvXTdFUSf3FHqn
	x8AAHevird7rHZ51kpSn2HS97SEvQG7AiVBrfNv+GuETK2+RRyke9w==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022077.outbound.protection.outlook.com [52.101.43.77])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4b16e1ubk2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 08:22:15 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WLhHr4xE5d5nGj0aTPGF2ZyC4uVdNm6IP3jgh8wcw5NTNFdj2yWY4h6vk65LhPraM/FUmoi9cH5zJGKizCvMqPOldpcct28oKrsqbA+5u/BdGQqwy6MeWimyvDfZ7rgn0eVkDrUi37iT5PnxxRV0OmwNMVFOT1rhqO04FkiOdQus0+ghEG1BjxY6Do+ZTtAJJf2U7SCWwlHJsOiAWLTXCyfo47lNj6ZnpPGGJhXFXfV9fYdHUGsL6eShsvhxo4seDcC5qJHUJTBHF4bGumcyrsyYd7PS8dQPbEj57zcnTN16kczIEJiC1etGskVxolCTkQCXeVg7k+KvqZfjUzH2mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NPU7Eu0V7Ez1cO6fFphLAAu6gVusinbIk5iMcxNyr3A=;
 b=x7BzoQUF0MlgGKVDVkEkwH7E0OUeCh51CdrDnPgQyLv/LpnI5d+Rk2ue0aZtotnv+LlCHo5li1XQgRElhbLZ9ufUC2hf6VmEtarXlTrGXvkEpRs3Bj4F9meGCUtpUTaVzfaVSKj+85gTyn8WCHaHeb+tFaKRTMu81/UHv53fvZOJuDvbjiKPS4M+d3/1g2q6FOg2IrUp6XdrFUphT2JvM+Cil2iJFh/KinZRV357UImh0W7/dgnJtXEe2VLWqIrW0BCYMW06kBaA7Bm4H0MsOXbdEy2wMLRm2geyozIigLzlYP/kafG0iey6S6hWa3XGS33nlWKC1VBuvWzQUOC7FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NPU7Eu0V7Ez1cO6fFphLAAu6gVusinbIk5iMcxNyr3A=;
 b=ZWCiR52POInZ7EC9gZpF25arp2q/NZmAiSLcURuAKuxrDGNBFUcZ6tn85Uk+mqJ864fpeszH1izq25q1I2iaY/+T+7SC5ZWNA3wTaHhY+Li4twcgPpJU8GInKaSmKUCLREWSij9wwrrLP+rfH2aXmRnP9hZvsdghsr9k0QGH72k=
Received: from BN9PR03CA0093.namprd03.prod.outlook.com (2603:10b6:408:fd::8)
 by LV3PR19MB8755.namprd19.prod.outlook.com (2603:10b6:408:28d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 14:22:13 +0000
Received: from BN2PEPF000044AC.namprd04.prod.outlook.com
 (2603:10b6:408:fd:cafe::65) by BN9PR03CA0093.outlook.office365.com
 (2603:10b6:408:fd::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Tue,
 16 Dec 2025 14:22:12 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF000044AC.mail.protection.outlook.com (10.167.243.107) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6
 via Frontend Transport; Tue, 16 Dec 2025 14:22:12 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 73873406540;
	Tue, 16 Dec 2025 14:22:11 +0000 (UTC)
Received: from lonswws01.ad.cirrus.com (lonswws01.ad.cirrus.com [198.90.188.26])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 3A3F6820247;
	Tue, 16 Dec 2025 14:22:11 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Simon Trimmer <simont@opensource.cirrus.com>
Subject: [PATCH] ASoC: SDCA: Allow sample width wild cards in set_usage()
Date: Tue, 16 Dec 2025 14:22:04 +0000
Message-ID: <20251216142204.183958-1-simont@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AC:EE_|LV3PR19MB8755:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: dd410877-f8cf-4d9d-0916-08de3cae8159
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iJuVBxlzK87kH9KXUrzHVZ/wHB/2aJ4/4ly9C6dUn1fFaIh4kwn/F9vySkPq?=
 =?us-ascii?Q?LD6INO5cEAUg4WSgig8aAuZNAXBD8AAF4eA1WJQ6bBIsVAICY0Cb9oLKZYKp?=
 =?us-ascii?Q?7y+ZWNwI68UF3BPgK3IYex6y3gXIA24T1SKipc6Wqc2R6SWl5uAZkj1TPFLn?=
 =?us-ascii?Q?0q+lZCSmcp+uJdksK19yFk6IP/SBYDK2UZA79HPFQ2tNuULTkD5ZtYSHVpmQ?=
 =?us-ascii?Q?pI+D6mPii2twd4mSQJXwx/31eJoJVnNko+mTbBDZqunRVLdCDnoah+fVHo5U?=
 =?us-ascii?Q?UiSS4qAzIf0NMacj36w6/heOAvsQoqxK29mLuR1wHEbEzLw0q0XK2N0/vP1w?=
 =?us-ascii?Q?9VowedIrI0++3D2NOUmsfa6+SXzVBvYb4NjASmI+TnC8Qy7RdXzG2TnbbCgs?=
 =?us-ascii?Q?gAqOE55jGGAM8y2VzOj5+j4VDy03Ird6a6PrhKZCJYzDI67T38Ger1UDEqhX?=
 =?us-ascii?Q?ORQSiqS94SEIjoR3k5Xl7csIJ8Zh8qXMXjb7ctokxSwwT7oZr+k4Rx7wWBTe?=
 =?us-ascii?Q?IpfqF4Fa0kULKJ/uSGcOGWUpAjSbTUVfZKI1siyx8J81mvpScDIraFDc4csn?=
 =?us-ascii?Q?2ylV7WCCnD/fMOZ/k55ojiuCEZonOUB3kBIceCa2o9/aMlpIlJ6z9YPM372J?=
 =?us-ascii?Q?Nf9PrKq31+0SkUQr1FcfLUB23EksAzFNBh4+H8YUbIjuvgd1RLGt5zMMOy9C?=
 =?us-ascii?Q?1JeS24fCcXyI0kbCVGh20lZFMoaA/0Tu7VWmXnkm9u1s1yUbWvl0Exo/yM1h?=
 =?us-ascii?Q?j77NwK+hnWsTnJFEaVkHbJJVunajKlmGcb+J654c7VssFXPsQTYccZe4hSbO?=
 =?us-ascii?Q?P/zwZpayKTw6XGXpeqhDnc1r5tezpP4fSuNHyhryahAJ+hiUfGS8XyKz5fW6?=
 =?us-ascii?Q?5ad39WRT6Bu3b7w4Itqdx2sWlbOqsLAkOAvN55TSgNV9J5SiGOho3EVPhqqT?=
 =?us-ascii?Q?bCUiuXon1efiW81BwztHZXNex+hfdl6Far+8pKRUQ/Adczt2FccLMdm6HoQD?=
 =?us-ascii?Q?sfappg/aXNxPQnsidB5SIj/goOfiIwZgy6dF1mpOwV5qSpdL7Scv9E4HrgEB?=
 =?us-ascii?Q?quTl2xKrkQXQLgxcEXsBpskghe9HimCmjQk8LZ8rcSGz1iY8gMgteg2Hm+c4?=
 =?us-ascii?Q?HzZSWvOBYEFxP8ypvAI/+3R5Swze6D0AxqFcIoRw1au63nCMmEImTucEH3VR?=
 =?us-ascii?Q?q2DfTRBX/7oLmbd/f02xcWq2ZjMESOLn84Hcn5cF8FODIg8tgRkKFVTOOA9u?=
 =?us-ascii?Q?gfm71Ug36TzllhRAtppceY4Y8XPUj1/+0UMS2gZ0txo4lXYP8zdAgnq1ilor?=
 =?us-ascii?Q?jojWyUcpw87J7F0TQBE8uGNV60QXx2hCZCCy9JfBIr9732i4F1Qh6fxoJeys?=
 =?us-ascii?Q?zWf4Syvb3KaDP3bCVysPSRV9hMIdqK76u79o0KSOR38xZkeTPYzVTz5gK7Va?=
 =?us-ascii?Q?0xHj+BIka50SLWpTKiZ0AScOe7nZuWsR78vqmhM9STsnHAyh8Ob+Ft7+UQtF?=
 =?us-ascii?Q?pobkUAa+PnQEhTEUUVUz5i6C2PUTSeBO3TzwFoeW+x+amPAPKI9LAi8Q5OiU?=
 =?us-ascii?Q?xDRNr52dI6P6gFBs3tE=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 14:22:12.3073
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd410877-f8cf-4d9d-0916-08de3cae8159
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF000044AC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR19MB8755
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDEyMyBTYWx0ZWRfX9IL4OM/N3Vad
 8Vly+fWwNs1lslGM5z5eAx4oo4NY/bLtuPROSkj0TvsfUZ/MaakxikAtp57Aj19jEU3Wh5ckbFe
 LhFiK/eCZP29jJSn6s7T36FCV/zMieIMT1NOGXOPvrADR744kJzQuyC74pWRcyUmFb5Xb8NE+Wu
 2rqVl254EHnWhTax9zqbIldef1xPU2Di8UAfazWGA0s+Srsg1qWaeYKaRZZ+qt3yjOGPUuor3yh
 BOlsqnLZ3n3bHcBoc0KxWAYjc5rV/IxRd7xrViaOoYd66dGu2FCQSpt9I7jt1BAk/17/u1PSL0b
 TRylStvNposVthHT84vWkAPtxH9w0WdymdJJxeOkaocnjPB7h9rHDgyb5XnCFL8xBcmmEdsv+4q
 YwQvGB3KTUcZ+5Ux3UVexqTW/Qqm6w==
X-Proofpoint-ORIG-GUID: bpUzmKXrIBK48bywEZX0GUvSDfQawLk8
X-Authority-Analysis: v=2.4 cv=Qdprf8bv c=1 sm=1 tr=0 ts=69416b18 cx=c_pps
 a=7Kp79o39qosEjZWU4lqIzQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=C76-Ibg2oE-iZqZMKLAA:9
X-Proofpoint-GUID: bpUzmKXrIBK48bywEZX0GUvSDfQawLk8
X-Proofpoint-Spam-Reason: safe

The SDCA spec allows the sample rate and width to be wild cards, but the
current implementation of set_usage() only checked for a wild card of
the sample rate.

Fixes: 4ed357f72a0e ("ASoC: SDCA: Add hw_params() helper function")
Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
---
 sound/soc/sdca/sdca_asoc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index 2d328bbb95b9..498aba9df5d9 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -1478,7 +1478,7 @@ static int set_usage(struct device *dev, struct regmap *regmap,
 		unsigned int rate = sdca_range(range, SDCA_USAGE_SAMPLE_RATE, i);
 		unsigned int width = sdca_range(range, SDCA_USAGE_SAMPLE_WIDTH, i);
 
-		if ((!rate || rate == target_rate) && width == target_width) {
+		if ((!rate || rate == target_rate) && (!width || width == target_width)) {
 			unsigned int usage = sdca_range(range, SDCA_USAGE_NUMBER, i);
 			unsigned int reg = SDW_SDCA_CTL(function->desc->adr,
 							entity->id, sel, 0);
-- 
2.43.0

