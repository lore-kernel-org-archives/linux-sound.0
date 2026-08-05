Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1834570F1;
	Wed,  5 Aug 2026 12:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785931324; cv=fail; b=T+QhXyJeW7deNUeNjoeKjSXc3SynYOEsio6/rLI7t7bO7rKj1m3E9NS7KO5oHQkYPsGn0irYcbYeWwNBehpfvLmFhrA5WDuOO/o2QKaAt+gv5VqP5zViEntTPPViC12mlTMfBsbVDismraeQ8dSWiet9Om755mZ9yDGiXUkVon0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785931324; c=relaxed/simple;
	bh=4HbDp6rdJX1KEWBLznxGSe98erG4MsNU5pEHU3ws4Sw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iJfqhebBA3nv9l2JvmI43Xn8uhxr9bVAXkJ6bHWoN1ptAjDw7JTmSnL25NK56sStwzFtv00teb2KaMofEjyKNSCU2oEXZe5EE4mZZ28TbE/zxAr6MfqyEhWq5tqATPOUAflo/Qvzt5heoL0W08GWw8KNNcdhh/QhT9bcmq8K/xQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=P1q195c3; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=DAvX8V+z; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="P1q195c3";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="DAvX8V+z"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674NPT0F2014368;
	Wed, 5 Aug 2026 07:01:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=BFZtt7aYJTW+OUuE
	5z36L9L6cOIvViMktNJijxUhQyM=; b=P1q195c3PYp/AiLdBTzUmIPk9P0fP3t0
	m78+sFOpmCWqKnjkQ92FzCRMvaxnfIyZ/vFmzg8QcbuGCH9q+LemIS1vha7nOXRJ
	JtJ7LLprZlwXzd+gFCAjjGQM3pJ10k/AQHX/ReTdsFo1w9zG6b40offMN3he7V5f
	BZXOsoDWEV5do+YwqltsSjkW+n+9tR80q98DfjoEnUf0CDYRawE7TdcK6SZRbSdr
	sON417fvDxl+Cl7fykFuCahtJEufGPVwmKDYhKF5xagIGYirPl8NhdWQE1WC+wPo
	4ifPX2TgJRN/c3/bBve9Gmv3WCAtmy38xQkscyDpMUYbdbe1AkcNjQ==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021136.outbound.protection.outlook.com [40.107.208.136])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4fsd7h5my9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 05 Aug 2026 07:01:33 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eVWMWM6naM96S/rl9fVn1xcNoK7HsrHR2U8u10QIaHs23O0ayy4rohODCP9HEGXMKsGk4Cb2UP3xZrFZewVo0hSuFRZE0aerrVU+9jbAA43bODOKMW/pM6HVql3zfmzRdHkuA54ONhNprcjY0DRGz+tyfNZpKPQHx8eGkiHjzNh+EI7kj1sJLQXD3luR9eZmueZtrqDy5KkXHhuHNWWs03+QlG35p7t1CvvTVFCTmgb7GGrGPhZQCk+8aOWbSWHEf3NUIGxxVnzGdU4TLlthLKtuQhsx+IXbUdsftZHyAe6cGO6Q+0dUYxip5JWXXdXAwAniX5WyUXgUYMQtQpL3Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BFZtt7aYJTW+OUuE5z36L9L6cOIvViMktNJijxUhQyM=;
 b=xEzxNyTNHF//QMwW72RAPoEY/5qhZ9Di2kR4niXWDGbhlq1zbmkXLHvXLSZOWDHcJA8kLwcXxms2kqozJrKN94L6txCfZn1MHu8UsPqyZs6GsDWgXbjwHGlf+K+fPJzkgxp+ie68V4JKsXLx9WaKBFgMLErpv4Ie/wJZO2j30rbaLxArm6Ys6qyWBx1j8kt+7w2YQZQfBwjQ99LJEz6CBvH/UAL9BFw3zIs03Kx10WbEDfV0Jnn5vtYczg4zg+pMwoCF6eRlbsci+FSFnzo2/Wh2Nn50N0ufV2tfr7C/GaieDYZ96lVyIMcMROfWAiJ0hf4UsuC5fow5+rry9jkdzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BFZtt7aYJTW+OUuE5z36L9L6cOIvViMktNJijxUhQyM=;
 b=DAvX8V+zMEvBP17JPukZnB8IGfbCfYd6mYNDpd+xB4ADWOYD/Kg1ST0M5xdZxqO/A77DoJ4h7+olptvyvl4HtptRvQn+B4mv6DOhKqihJn1ZdKPyF1vD4WmSE3gsQpZ6qlJpeeE1tdiZakNY4MRKJ4kRkE5J/gkl/PyHnWFAYnU=
Received: from CH0PR04CA0022.namprd04.prod.outlook.com (2603:10b6:610:76::27)
 by SA1PR19MB6790.namprd19.prod.outlook.com (2603:10b6:806:24d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 12:01:15 +0000
Received: from CH2PEPF0000009B.namprd02.prod.outlook.com
 (2603:10b6:610:76:cafe::1b) by CH0PR04CA0022.outlook.office365.com
 (2603:10b6:610:76::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.19 via Frontend Transport; Wed, 5
 Aug 2026 12:01:15 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH2PEPF0000009B.mail.protection.outlook.com (10.167.244.23) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Wed, 5 Aug 2026 12:01:14 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C3152406544;
	Wed,  5 Aug 2026 12:01:12 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A719E82025A;
	Wed,  5 Aug 2026 12:01:12 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: lee@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com, mfd@lists.linux.dev
Subject: [PATCH] mfd: cs42l43: Fix regmap defaults ordering
Date: Wed,  5 Aug 2026 13:01:09 +0100
Message-ID: <20260805120109.4024451-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009B:EE_|SA1PR19MB6790:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4e2efd73-2a68-4d02-eef1-08def2e93fc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|23010399003|61400799027|16102099003|18002099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	HU0/64t8jZReGr3ekPNIymkcNQTVKJ/pmqGD+wt+yKPyAMImBiHQv+0TemxsaxrERaAftTvUrIVzj1UOZyT58E+EikHY+LgAIJkPDaljvYGqfTWcO/+HFS7x9OqGAOcu3Be7VIv8UZUt8kgubWciQgn0pbJBODhp1kOLx3259y38GNR0IuEboQ9Ta8Tj1eGR17LmbBaK+kTBh73GBi+Abpu7vWrIaylH5lMitWbjq+/jNuwCCtoLcBrGecOByaICppH6tpnzHa68/CpkYnnZCwbU+GILsESZPBWDZsZLbsPORHWHpxkS5fytvQB7Zec0oTSAuqMINpk6OfY4uB37I0BWPklO3qOR2GhW/jYhgh4AQEyy1s1zQbOihTRFzGm/8hLMZ1wthFW8b1xhsPH50H7clvH4RWmWj6RJ5/tW+Kst9QEwOcK6iV78ldsysCUCtGsntYxllLQLbEfofxmMtpVaaE+Nqx0s/OoQ8aF+g39IXbRJKXIiJcHmDgjYmbTwHdYCQilQdLmNrZ40lLyc+y19cFnwik8c9dumpYE3WnOGGVchVeKZ9Pp81Cun38zxk1YTyEdahWKlFBpMzwy5zNH/Kwl6Gapb6uQ2zJJWveBoiHKzCoIS2LvE9rN9h4sZZGIW4AyPvOE/x3O095zWK2d6eWhoNBA3NaPGP+UgWwcs0KeL8e+mXNOZ4GP0GWmNqS81xGzXB/x4c4gzvWbqhA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(61400799027)(16102099003)(18002099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/6r4dL/trI6Fzd7QtMRRiIhijeITv0b1vBdFRPOXO8V9rSK+kthfua35e52c4IjI4jgCX78yU47JzlhotD9ewcXl1OaEASykYfDIyvekNF2FFVEFWgtHwKZTUNt7IdiVXsGgUPSmFBYlpkl0kI2Y4AR7IKLDTi6SXQ/RujoFc1c8nuY/ujb+8O4AlCiPyAD6bW7lndfbS1hRh1YsIX5cZeZR1u+ZzR++BDDFBHHO/aRDqQaWR0N6+qgQKbFDG+Vic8D8c6nNzCn3/y080KHZHIHh25u6E48puXB8MAQHiA0/rY1zWmY9+iCRMgvquiTZLFZrj6ArmiasvZYCDIP16gFlLN9y44NpiYYXm+j4hO02Sb0BB742nRMITBWuMU2nNxdJVuzrCd56ghfwwriqsKCqTMkVLkS9yBcSZXqnD/cxJJ4dkxbm69eE1XkB9bnF
X-Exchange-RoutingPolicyChecked:
	P+vzSDnd2jyU1k+zxk5/+9l/G73FAMaTXyyK5AEKGnHyvF6EIf2wi+lg0v0Q4NjRphJx3IUL37+L/F+crkaVCS1PxHe+bttBtZ1KujxoPRNU4A8eag+D5ekQ7QuJscryL5rGE/nNCKynz2HikCqxAGNDHRZfuTy+/M1QRMXO4t8uzxTC35Kx3NEC07zmaQDcdgzfvUq+wzAaeAAM5lz1RF5rcL/5VW4k0EK1UQKX3ks4XlyooI63ipASCxTFiTo+DVMCOMY2tCGqPfyToZFmKLLd74GJA992AGnTzMwgThoI5k16KsOnK/l2SHWj6Zp864rrv4tReWk0AmU/d3Nghw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 12:01:14.2115
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e2efd73-2a68-4d02-eef1-08def2e93fc5
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF0000009B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB6790
X-Authority-Analysis: v=2.4 cv=ZK/nX37b c=1 sm=1 tr=0 ts=6a73261d cx=c_pps
 a=peeJaRLe+dxo5n1sA3bZUg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=gWieM2piWHysNEegxn8A:9
X-Proofpoint-GUID: 1BOie0BuhQ3-SvDxM5lt2l8XbVN9z5FY
X-Proofpoint-ORIG-GUID: 1BOie0BuhQ3-SvDxM5lt2l8XbVN9z5FY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA5NiBTYWx0ZWRfX3CMQ0F0s3mcN
 KKsvxP/f1cvi63BJDaPHlryIjMjJ3EvGsFIC/pE2EcchAlsHY08XlrCnURtSAWSGvAV+P3A7eWN
 wv1VLfxNVGfRNk0KoJR84/g9QopgNQB9IMKEOoojn3edN5567BdV/qPmuQ0HEoYArIGqlfcXGDy
 4Cl319+T2Ud78RdNte6s/ZxUCByJ3ovhJa9eNRwqGHRFQxKvHDlX1zmcUCJ2nyhcA1Vocmk6V8x
 hDUYGDu/ZdPuRz21tWGl7P6sq1vfC7ssLTZRTZWluROvtxFnPAA5uZGc+jyyAnUY5ZZfFsoiN9q
 ti4OjJPeMqKh+oAQo8dpT9LkPjB2gSkF8vaJjQBs2LVMdamq0y9N9JvFSb+9XwOIHfIeahBEk8F
 0TAvSSG2hrptOVN7r2xqElTCo12QRab1pewLhC6VNGgGeXHF8/eBxIs1+jm4IdVe6Rpuf7T9HRi
 PLOIzzEx9NN6Ul+hGFA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA5NiBTYWx0ZWRfX0GF2Kdmy7+BC
 q+e+TCb3ilZbKTJHSJ6YpX4uoIzMvNmaPeE0RIOAZ8OJ+IfSDDlPfjV56l7S7xs3oxriz+U/qTW
 C+0k+q/8xrkE+am9icG+E51UeK1o51A=
X-Proofpoint-Spam-Reason: safe

The regmap defaults should be ordered as binary search is done on the
array. A few registers were added in the wrong places, move these to be
in register address order.

Fixes: a6fe20d67dc7 ("mfd: cs42l43: Add support for the B variant")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/mfd/cs42l43.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/mfd/cs42l43.c b/drivers/mfd/cs42l43.c
index 33479ddd539a6..4212ebcca60b5 100644
--- a/drivers/mfd/cs42l43.c
+++ b/drivers/mfd/cs42l43.c
@@ -115,14 +115,14 @@ const struct reg_default cs42l43_reg_default[CS42L43_N_DEFAULTS] = {
 	{ CS42L43_DECIM_HPF_WNF_CTRL2,			0x00000001 },
 	{ CS42L43_DECIM_HPF_WNF_CTRL3,			0x00000001 },
 	{ CS42L43_DECIM_HPF_WNF_CTRL4,			0x00000001 },
-	{ CS42L43B_DECIM_HPF_WNF_CTRL5,			0x00000001 },
-	{ CS42L43B_DECIM_HPF_WNF_CTRL6,			0x00000001 },
 	{ CS42L43_DMIC_PDM_CTRL,			0x00000000 },
 	{ CS42L43_DECIM_VOL_CTRL_CH1_CH2,		0x20122012 },
 	{ CS42L43_DECIM_VOL_CTRL_CH3_CH4,		0x20122012 },
 	{ CS42L43B_DECIM_VOL_CTRL_CH1_CH2,		0x20122012 },
 	{ CS42L43B_DECIM_VOL_CTRL_CH3_CH4,		0x20122012 },
 	{ CS42L43B_DECIM_VOL_CTRL_CH5_CH6,		0x20122012 },
+	{ CS42L43B_DECIM_HPF_WNF_CTRL5,			0x00000001 },
+	{ CS42L43B_DECIM_HPF_WNF_CTRL6,			0x00000001 },
 	{ CS42L43_INTP_VOLUME_CTRL1,			0x00000180 },
 	{ CS42L43_INTP_VOLUME_CTRL2,			0x00000180 },
 	{ CS42L43_AMP1_2_VOL_RAMP,			0x00000022 },
@@ -160,10 +160,10 @@ const struct reg_default cs42l43_reg_default[CS42L43_N_DEFAULTS] = {
 	{ CS42L43_SWIRE_DP2_CH2_INPUT,			0x00000000 },
 	{ CS42L43_SWIRE_DP3_CH1_INPUT,			0x00000000 },
 	{ CS42L43_SWIRE_DP3_CH2_INPUT,			0x00000000 },
-	{ CS42L43B_SWIRE_DP3_CH3_INPUT,			0x00000000 },
-	{ CS42L43B_SWIRE_DP3_CH4_INPUT,			0x00000000 },
 	{ CS42L43_SWIRE_DP4_CH1_INPUT,			0x00000000 },
 	{ CS42L43_SWIRE_DP4_CH2_INPUT,			0x00000000 },
+	{ CS42L43B_SWIRE_DP3_CH3_INPUT,			0x00000000 },
+	{ CS42L43B_SWIRE_DP3_CH4_INPUT,			0x00000000 },
 	{ CS42L43B_SWIRE_DP4_CH3_INPUT,			0x00000000 },
 	{ CS42L43B_SWIRE_DP4_CH4_INPUT,			0x00000000 },
 	{ CS42L43_ASRC_INT1_INPUT1,			0x00000000 },
@@ -178,14 +178,10 @@ const struct reg_default cs42l43_reg_default[CS42L43_N_DEFAULTS] = {
 	{ CS42L43_ISRC1INT2_INPUT1,			0x00000000 },
 	{ CS42L43_ISRC1DEC1_INPUT1,			0x00000000 },
 	{ CS42L43_ISRC1DEC2_INPUT1,			0x00000000 },
-	{ CS42L43B_ISRC1DEC3_INPUT1,			0x00000000 },
-	{ CS42L43B_ISRC1DEC4_INPUT1,			0x00000000 },
 	{ CS42L43_ISRC2INT1_INPUT1,			0x00000000 },
 	{ CS42L43_ISRC2INT2_INPUT1,			0x00000000 },
 	{ CS42L43_ISRC2DEC1_INPUT1,			0x00000000 },
 	{ CS42L43_ISRC2DEC2_INPUT1,			0x00000000 },
-	{ CS42L43B_ISRC2DEC3_INPUT1,			0x00000000 },
-	{ CS42L43B_ISRC2DEC4_INPUT1,			0x00000000 },
 	{ CS42L43_EQ1MIX_INPUT1,			0x00800000 },
 	{ CS42L43_EQ1MIX_INPUT2,			0x00800000 },
 	{ CS42L43_EQ1MIX_INPUT3,			0x00800000 },
@@ -212,6 +208,10 @@ const struct reg_default cs42l43_reg_default[CS42L43_N_DEFAULTS] = {
 	{ CS42L43_AMP4MIX_INPUT2,			0x00800000 },
 	{ CS42L43_AMP4MIX_INPUT3,			0x00800000 },
 	{ CS42L43_AMP4MIX_INPUT4,			0x00800000 },
+	{ CS42L43B_ISRC1DEC3_INPUT1,			0x00000000 },
+	{ CS42L43B_ISRC1DEC4_INPUT1,			0x00000000 },
+	{ CS42L43B_ISRC2DEC3_INPUT1,			0x00000000 },
+	{ CS42L43B_ISRC2DEC4_INPUT1,			0x00000000 },
 	{ CS42L43_ASRC_INT_ENABLES,			0x00000100 },
 	{ CS42L43_ASRC_DEC_ENABLES,			0x00000100 },
 	{ CS42L43_PDNCNTL,				0x00000000 },
-- 
2.47.3

