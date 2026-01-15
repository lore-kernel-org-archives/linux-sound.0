Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE363033E3;
	Thu, 15 Jan 2026 19:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768505186; cv=fail; b=jV+rsoLrwdAu5Izrss5TnlILhPa2BIEMAF2HIbivbdaP3rtBul11uX9ai6VX6DHxQTMBxyXCd7xkKOBODaUULXr7xFujdDFCzuUE5lb0b2MbPrhzBbLLThk/oOUYarTSRi4hJDGbkeeIRMACQzSIW44hAuy5isXhPPsMTI2bV5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768505186; c=relaxed/simple;
	bh=81BPtR3yaJcIB1Tc3tEjWKRfjgxELiJ5DbAAATaBLPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ypq1Ycv9aSy7TPtivNxnLWMKpqu2T0hjH1DDDE8ghkv2Hz4jnmpYVUqUk66gtzAAqKdrGOVXBnqsh9uYhVz9VGInU4zpclKdwEyVztNTPeCV4ykV6TygsBxgIJ9riDW4CayDwb1dcTrW9p6M1SsvTezSHa+At31/0CG2xn7fMOI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ZRYKQiQO; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=gNEQIlG6; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ZRYKQiQO";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="gNEQIlG6"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FHSduf2311912;
	Thu, 15 Jan 2026 13:25:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=3en5hv0zjbXPSbnwQJJmmOfSNQUAcH5+nEWrz7BZKdg=; b=
	ZRYKQiQOTNT11mDlUnDw0DkaRFn1Xm9YTRtl8YQscDENjiYH44sK8wQGvNhOorn3
	+HUHnhDcpyMk5gjm3dJtuuCnl4y1iUsuWPb0OR7jYpJW3ld46Bgb6Uo3tzI2IlGV
	PM0ELgpcSykdYtPYX7Nc0ALDlpLBJojRl2HiIV/VNixdcGgFAvXQSDXHa/siuNZ/
	B2sQ4kkkHuVm++vAkc5YEi/WqXh3kJJjox2SWEj3pNCNgEClAZg6/8rn0dXJ7LUE
	qX4hK8swj4jAguM0z2XQLvxhzc/HeRk4NxvpzSi1UL9TVPJY5n/nnGmeC+e5S+df
	/aC7hXG+aYw/700n4ILKig==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022077.outbound.protection.outlook.com [40.107.209.77])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4bkn20699h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 15 Jan 2026 13:25:56 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J4gzPLjDvOcNxmtL2HaLXPuQpqi+yd53OkrT4rKp/YgGlrXyJIUtBhy/ooAxN1vnsb1VOMJR0uMBYT7uaBRLje2IsSwsIgDvqhICD66RWxC1gtycrmtdWADvvCyfjO9y8kjVuL8IyPMekHaDOX715s6f3Nqs8Dc6caklVK/McSI8WAcqhCBNaaKy8MoITEMQOG3ZeAV0Q+ZgkBqaj4FZ/IvmZ0WhYMUiZThrHe03BewddZCC7MYZ2nAFIRcNBC25d/2ZRLo9XpeRYAuwQFM/0zSKnOK9rgOhHetQWxTJfTKB6PWfEatdo1MKvJLSxagS2Vhah7G4fQLhABTtQsz9lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3en5hv0zjbXPSbnwQJJmmOfSNQUAcH5+nEWrz7BZKdg=;
 b=JXeJrwwFvZACyJRw7adV4HlAhxJKdz2quIDcxF3h7pXKpImSFIC2tKVw6prKHZ+VrnOdquFWkIM/ieKSnuAOfxB36UXyPGfVfxxs2hXUHhsMkmuxktFS3ltkbVTtPuy/fzEUrGtpq/hrfEwRNslYzcvrYkn5+Tt7ISjsXZE8wE+55VKHW6gglBXBGo6jrEbzorwYFn4DSTWyVrfziYTP9xdBHpLr0ET/bxl6CybaPhqQJt7IYs9aNVTsA6rWlSjWXyT8FacC49D8wh9m/uA5Elc55O5HvIIz96YCvN6hU/nSOGjWqXU1YMgLt8zEaMED1+D1i4LImYOlvf3D5LdpGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3en5hv0zjbXPSbnwQJJmmOfSNQUAcH5+nEWrz7BZKdg=;
 b=gNEQIlG6y7dl1IkbUfXhn2caPcFLqEiV7RH3X568G/M5QFtWqXTC3KMnbnpUAtp7JBRFhAwWgkoN5+/XSAeWIKUMU9T8lP5quAzvdXvp6OjCkAwMx/ZVAlDbKocNuStIr5EYl+tbWebtEQdrEXjAAFtC7G5JrTFD89adWrcHxZI=
Received: from BLAPR03CA0004.namprd03.prod.outlook.com (2603:10b6:208:32b::9)
 by BL1PR19MB5844.namprd19.prod.outlook.com (2603:10b6:208:398::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Thu, 15 Jan
 2026 19:25:50 +0000
Received: from BN2PEPF000044AC.namprd04.prod.outlook.com
 (2603:10b6:208:32b:cafe::83) by BLAPR03CA0004.outlook.office365.com
 (2603:10b6:208:32b::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.5 via Frontend Transport; Thu,
 15 Jan 2026 19:25:47 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF000044AC.mail.protection.outlook.com (10.167.243.107) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.4
 via Frontend Transport; Thu, 15 Jan 2026 19:25:49 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id BE40A40654F;
	Thu, 15 Jan 2026 19:25:48 +0000 (UTC)
Received: from ausswws06.ad.cirrus.com (ausswws06.ad.cirrus.com [141.131.145.166])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 147F2822547;
	Thu, 15 Jan 2026 19:25:46 +0000 (UTC)
From: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
To: David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org,
        Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH 1/1] ASoC: cs35l45: Corrects ASP_TX5 DAPM widget channel
Date: Thu, 15 Jan 2026 19:25:10 +0000
Message-ID: <20260115192523.1335742-2-rriveram@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260115192523.1335742-1-rriveram@opensource.cirrus.com>
References: <20260115192523.1335742-1-rriveram@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AC:EE_|BL1PR19MB5844:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 48cd9d4d-b16f-4a65-9d0f-08de546be40b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|61400799027|36860700013|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ePMpy5QWNyoXyQMGLyM6cglgQQCHNXNP6qyu4w4Q08i1+K571GH1KNFOv7rU?=
 =?us-ascii?Q?dwutUvmHzzy0Vb1pH6ixQjEeRb9lV5nst+8MNCpfUVTlhfaJF9YCCrEparqk?=
 =?us-ascii?Q?9OYDT8vVCgt3EXeFraRbWIRSqW58bW7vDDqDXg/hVGs9wGljDvadt9hWvqFj?=
 =?us-ascii?Q?hhYDoFrfyCotxG2rM29tGGEfa/LNdjHT2DQWBMvcaEPN6cINOKEx7wzQfTDu?=
 =?us-ascii?Q?rWGrIc/wZM4/j/KULYeCHiULheeOkUUajtvRQs7nlHxpL+z3F+ce9mXPBqWe?=
 =?us-ascii?Q?JUb8y5nm2/lRjz3b/2FvA3aHgHOQ8R7ufqeDUA9ipKDMDvZcyf3YI4cgXP0z?=
 =?us-ascii?Q?+ip+usYOSK1M6Sdg8JDD+eua9XzTchOptiYRxleOdiDVLnMWLI5EhwXRSbEy?=
 =?us-ascii?Q?IrqmNu/knLh1d0nbOO2pbWIhDtEswHabcVy+4IkaM89ex1OlqXKE+nsoItzx?=
 =?us-ascii?Q?R4llFUocet2LwdvcUOJA/FakALQ5YsGhIkzsmv6lf7mcKKjCRgvzw5wyJlmr?=
 =?us-ascii?Q?QGs/Kv+uNkzlkBsN9kGfnE8aAUZlhbPQgHWRossJSG6eqFGB1eLL4haZNCmg?=
 =?us-ascii?Q?3nOVNf44QCz8ZjIKHC0IVMzlA8s/yLOId46tG+Fm9JbOB6k/mWZH77w1yBe5?=
 =?us-ascii?Q?ewgraF/c+WCNY2tmwfNu4LLKCQJPy20plzVnLWe3ImQYpztzcRbPz9ipNFWL?=
 =?us-ascii?Q?Bq8J7XTur1e4K2ni+uhOio6Zmts/mLvqj+F2Y0LoijujYRf0QiDwiyohwy+/?=
 =?us-ascii?Q?AbC00P/FTYGQX5rI3mU1Km30bDXCZGY2AS60tBAVXp7NLK92/olT+ozXQWmb?=
 =?us-ascii?Q?9gH2wDdSoUbNtDOknRmCoLpuMm/pF7zHoubE4OZ49mhUeTzfnYc+OCY+nx9q?=
 =?us-ascii?Q?tl3jNCxGZSREXPSqqLc+mTaRQkBkmjt7HjjiMtw1nmsiUQCvYc0qiFYUJxEe?=
 =?us-ascii?Q?qG6SKw4PiQYzCn9xUtuS4cdYUwqOZrUtT7bZZSrAOcklXEdGDF63/O8YwRoo?=
 =?us-ascii?Q?zy6m3WHmRUZHchHzrrZ6Aimec8FIkJhtjttzri1vfpjZxg/AzCWj1o4XGWvi?=
 =?us-ascii?Q?5B/URCj7TZ9i4g1a7HNGaP1XiKFXxsc4TGoJzEqDJ3cg23w31PfSjNsMSOpL?=
 =?us-ascii?Q?M2KWYP3PjXZaDCq7o4awpO7uKzH8zKDFJaa5v6usm2dHeNUvwKTfC+CNZzfT?=
 =?us-ascii?Q?iRJfA+D23KKFpw9cxG/MeYlJW9HLst6nKLvU+ewaGR+4pSpvZSLWJH5nClZi?=
 =?us-ascii?Q?2zFSUls7IEwTaUKfY+7a8snCKQY9oyb3X6Jvv3MrBFjcUjkUiaUhP7t+mibN?=
 =?us-ascii?Q?ECYplJqQDBk5JJ5rgVy8c92twcTGrvQfRlN/RYihSSWmwDNzANJwgqim9uWy?=
 =?us-ascii?Q?WSCYFOPrmRSXyawchej4cwFGaQ1YCvUotZ6Be2lZGhcmF81DE7lyTPcrbbFJ?=
 =?us-ascii?Q?Nab0adK4op9Y4ZtsWsVeisjyvGUcFkvmlvprMoNWp/+mr4URwiOrlDkqhsBx?=
 =?us-ascii?Q?uH34W5AeWxzaQXKwbgtke0MVsqVqOSJ9jf5SygMlLNuVfheYZSlLYTL3pmYd?=
 =?us-ascii?Q?+cSlWRAkqih9wUIULi4xeblsr+M4UmkK+rYtkUVmNLEeAHRXZqJUkgzarg2q?=
 =?us-ascii?Q?iEcFicb2wqIFj+ImT6n2qCru+RbyZTc4q6v85nHfLbfj4OH8jtYj0rSUrk2X?=
 =?us-ascii?Q?Xov3LQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(61400799027)(36860700013)(54012099003);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 19:25:49.5250
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48cd9d4d-b16f-4a65-9d0f-08de546be40b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF000044AC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR19MB5844
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE1MSBTYWx0ZWRfX420E7QoXtMA1
 9MRAjTbAnxRhOFQrTTtd0Brl1k7tQ7qzzRaTjy/0Am0fai29n52WYda6tX7f4muB9CHTsIyKJgz
 R2vMfL0C8cbA0ClKfnZsryQQGQing+VaGrsmUDK8W6ARPaYKrUJOvtY+13Hyg4v8SPae3Rg4ECM
 R8EKPwiwAhQFJbJbQRd5md1gSWh/x7E6/cmibE88GgmPGp4ZjXjPKgiBoNoCGYNCrjpwkJnPMR7
 C3hMABWcQgEFMr842jog0FCsjU0qZM7cRMWB8iLLT7yOq1htxMFzOeHYSVL3IPjU549P8f1WA3O
 2yK/gEecE/i4wE1I6h87lSx+r1PtSusupXQb8peAaAFUBSgVnlf/lSvKCV3828YTCGYLA5Jbubh
 5SUzORFH2O2x+SPfAB7b6ENjAq2LcJHmlTfYyZxc4DHawzmRldQcEs1JtAyToiIgnkKeghAJNPc
 NF0M7hHAUEJIyGkgB/A==
X-Authority-Analysis: v=2.4 cv=LPVrgZW9 c=1 sm=1 tr=0 ts=69693f44 cx=c_pps
 a=X4ZH2kTj14Xf3yjbCCnrEw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=ncKhs6ovEJUGzFAfdRcA:9
X-Proofpoint-GUID: HSjj9if5rK0SVY01VMYZjzPlUaroucRR
X-Proofpoint-ORIG-GUID: HSjj9if5rK0SVY01VMYZjzPlUaroucRR
X-Proofpoint-Spam-Reason: safe

ASP_TX5 was incorrectly mapped to a channel value of 3 corrects,
the channel value of 4.

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l45.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l45.c b/sound/soc/codecs/cs35l45.c
index e33f11435980..7aa558d6362f 100644
--- a/sound/soc/codecs/cs35l45.c
+++ b/sound/soc/codecs/cs35l45.c
@@ -453,7 +453,7 @@ static const struct snd_soc_dapm_widget cs35l45_dapm_widgets[] = {
 	SND_SOC_DAPM_AIF_OUT("ASP_TX2", NULL, 1, CS35L45_ASP_ENABLES1, CS35L45_ASP_TX2_EN_SHIFT, 0),
 	SND_SOC_DAPM_AIF_OUT("ASP_TX3", NULL, 2, CS35L45_ASP_ENABLES1, CS35L45_ASP_TX3_EN_SHIFT, 0),
 	SND_SOC_DAPM_AIF_OUT("ASP_TX4", NULL, 3, CS35L45_ASP_ENABLES1, CS35L45_ASP_TX4_EN_SHIFT, 0),
-	SND_SOC_DAPM_AIF_OUT("ASP_TX5", NULL, 3, CS35L45_ASP_ENABLES1, CS35L45_ASP_TX5_EN_SHIFT, 0),
+	SND_SOC_DAPM_AIF_OUT("ASP_TX5", NULL, 4, CS35L45_ASP_ENABLES1, CS35L45_ASP_TX5_EN_SHIFT, 0),
 
 	SND_SOC_DAPM_MUX("ASP_TX1 Source", SND_SOC_NOPM, 0, 0, &cs35l45_asp_muxes[0]),
 	SND_SOC_DAPM_MUX("ASP_TX2 Source", SND_SOC_NOPM, 0, 0, &cs35l45_asp_muxes[1]),
-- 
2.43.0

