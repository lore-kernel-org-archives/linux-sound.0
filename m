Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855AB2EB5A9
	for <linux-sound@vger.kernel.org>; Thu, 21 Aug 2025 08:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755764820; cv=fail; b=RP7PzTBhosfqlSLDIL8fqx8Pd06D44YDwobsqs5sPSEhd57ZabdWKCjh6UHYVIp7TGr9c1XMhNYBgIKEHus90Lanh9FfY8Lw3c2GHN6k/SbtgpF+POCY9lPbVKpHnnt8R4y9ye8WC6BbR+nozH5oP87mYNLJeW3mtyO+UB2NbGM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755764820; c=relaxed/simple;
	bh=cSvthzEktHsWPsh6RCJG4zeDEI2aYW//m7KMmfFDk8s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QLYI16+ysepIOhOCQoMKr3/iYxKPioRjmNEFiENfcF6Gb/BkPb6GE1+53Xw0bFSVVn/Gm/rOgc1SxODpz+FFFv5jsUP1+woTPE/qFI69ao639OT6eMbpFbE+T3CVem8mLmM281Y1cXvrAiEXygR9u+NDAR5HGqkvkq4yjA+aWaM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=QOPtuBEX; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=x6CTrzb6; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="QOPtuBEX";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="x6CTrzb6"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57KEvFjE732044;
	Thu, 21 Aug 2025 03:26:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=FDUnE+GL1Gb433Q9irSMv1bIrm0SvgwnT/R+llANADY=; b=
	QOPtuBEXSYt/DZb/9btJDmufbNcoHRFQwimHpbiYNRnO2C+mq+2ctiSv2kzL6Q2s
	oQ5Cp5UCjjT8gnYnpWdfYRuuCggCRkavEP2n/SMk54W/KN/rqbEWu8XEAwgoA5t/
	z1LzDm+tmlcTKlBrXN/DzP6dpSwrG6nTS9wdqe7p5AK2WYSwOKEFA0+YUTRv5p6r
	q1u2UuwlMuwwbiZGEEQajF/S2ZzGTAbsq4kTFl7dTgXHeKSptiEV0ro5uf1r9Hx0
	LOFaMZD5TwereJV96ZquHpVOLbfl+5v+aemAs6W0obyCGmVAik1ba629asRDxNgy
	VoJW+qYokWGjFZyueUWlSg==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2135.outbound.protection.outlook.com [40.107.223.135])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 48myd5akft-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 03:26:50 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EUrU0krk5IjkCHfozbm1zO5ZbQ7TFDpv0yEPI4Y08Y1hGiro9/Ds3Z4iqPEeWc/1b/8+PjknwCPZjCZ2ddstONDG8wkhBVMykrequqwL794Ypm9j08Z5QQVOWTvhkjqVK1SsY4LkAPilPD2ETINgqjyyBzDg9Iz1jOgsTSoKJK7DddMmkli3KNtHtmN16Q/c5aEJOaCuY1QW7mRcguIfgUeGfX4590u5muWXfrz/fZwT2H+9Svlc2KBtseXJNtrlo/AAeizX4FZIWizLzblVnfxPIpoCOhVqMEnwQKdfKzgFcHw/SceVIYmN7JYtKHXnbLPUPju45xHF5Pa4F4uZcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FDUnE+GL1Gb433Q9irSMv1bIrm0SvgwnT/R+llANADY=;
 b=GgIH/ntI7GytSadL0XpoFNbhsvTph6VKB7InU7KKc4AtEzblNEoRmordcFeZRoj/N2oI9Q2tz9plzAeUwoLWeK/4LwCGOFWxir8TYSFu8HUlF7HkdNWdLN6uhTiLHVxckX1ULjLpX73JrN0w42u9ieUGN+LhDFXntMNV3UApf9BlZ5+uuUlN/7NlhXR1A4plVhOHX8T8sluuyruOy6GGfmkH91ciucBHKTrJF0wBT+vLOBMZgUiuqnhZ4g06aulsbTynFl7vmIHdkCbBul/2252k/V+tCHhUEu/N1K7iPiTSFe23YwQr5vHW88029m+Yw0GT++MYi1fw2aBbeT0iSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FDUnE+GL1Gb433Q9irSMv1bIrm0SvgwnT/R+llANADY=;
 b=x6CTrzb6kEWOyj80Cqq0/9Xg6DTsx3ir7xnGFwWOuzW0Aq/aB6pdVudTBGSEJRF6NWpYp5R5VbzVpP4QIHqvMXBdpaPmP6jXW41ryhsfxnol/fFG+ZACSYB18aVcRQqqoQFs5aeAiiFK5LXZown1DQ9Vkxdwl+jaXYb5Wefrsr4=
Received: from DS7PR03CA0052.namprd03.prod.outlook.com (2603:10b6:5:3b5::27)
 by SA1PR19MB5150.namprd19.prod.outlook.com (2603:10b6:806:189::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Thu, 21 Aug
 2025 08:26:46 +0000
Received: from DS3PEPF000099D9.namprd04.prod.outlook.com
 (2603:10b6:5:3b5:cafe::3c) by DS7PR03CA0052.outlook.office365.com
 (2603:10b6:5:3b5::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.15 via Frontend Transport; Thu,
 21 Aug 2025 08:26:46 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS3PEPF000099D9.mail.protection.outlook.com (10.167.17.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.8
 via Frontend Transport; Thu, 21 Aug 2025 08:26:44 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 83523406553;
	Thu, 21 Aug 2025 08:26:43 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7567582024D;
	Thu, 21 Aug 2025 08:26:43 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, lukma@denx.de, mans@mansr.com,
        ankur.tyagi85@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 3/3] ASoC: wm8974: Correct PLL rate rounding
Date: Thu, 21 Aug 2025 09:26:39 +0100
Message-ID: <20250821082639.1301453-4-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D9:EE_|SA1PR19MB5150:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 208f1ae3-f694-4bc8-92ae-08dde08c76e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zDzqGXiQUA56WLy3VfJUNK8cxbORbSvmCMd/Ecms79+0TR6ULdE/aC/aj60G?=
 =?us-ascii?Q?+hVkVkvTEXthTjRxKB2L2Bq/ZUpQVRt+v2c1ELNH6xHsVn57QYF3ObSK5/CX?=
 =?us-ascii?Q?wGeJM9LHKiyHmBKfa/PkcUcOG+x2vhKSFc8LkqMYiIyBPZvJ6LNcmrsVHV+p?=
 =?us-ascii?Q?Qynlg6XHahyX4ZA1bPuKzWJRLzcLnZgeUhyGWqXJONY/rqU71crFWlhWp4nu?=
 =?us-ascii?Q?TPUgPSh8Bat1KoKrUhejCRSR4hl3AiQa3JqwxCJQBN0R+ZatsIPUCw1hiV88?=
 =?us-ascii?Q?P0vtLgtHye85NimYakIUJjZx5gYKKqI2G4JbIj/ZTV1go4FyAnejLBXqiJFs?=
 =?us-ascii?Q?xrngfkCyaH7dHwZqJa4/bGDSK1lHhzK4F5uwESE8sYr0orw2CN8abLRHj7kp?=
 =?us-ascii?Q?2l8bfLHSCafBMJBjD1dZYMZcnbdYEeH+6MSep8220kqY2rQEvBYoy1JV2Hkx?=
 =?us-ascii?Q?5SYYZGGXIQ+7n4SE26K6hiSfPqoYO4wE1GE4VWDpay4og3sM6b58EFYrcFCn?=
 =?us-ascii?Q?JDBXJNsrUdbcP/kRLz12muWJjtsO0vc+RZyAYrg9c+cjZZv4ybQ/gQNr3ECW?=
 =?us-ascii?Q?EW8UxCNIS6XSkxJ9O4xV+c9vD7qWRvekuxBKv/DeYcZ5CvSj2nxc1ysuPx4m?=
 =?us-ascii?Q?5bHTgNGbXsGs+8Nlmeu54BksJESZ17VbTYOCxaOS0U9ljWSvLTar69iy9dM/?=
 =?us-ascii?Q?So/h2MDZmbvUujxhNqM6ZbltLDzeHpyQHSaaobzWkr2cQXEgAVUNsrT5ZcO7?=
 =?us-ascii?Q?55GOqNZwEXnxkoH2k4MKAgkGd0zjg9ET+GDRWte/SVlu1qEA92P8iu7USsIG?=
 =?us-ascii?Q?KfAKlF1yYDMkt6H/qhNoQUImbJ0/H6cqVCcesSYmOJsMj4dZvp0o83EJ/DQE?=
 =?us-ascii?Q?ICXCnOosm28mkbixlKEI9DrWHeaP47omKDizk/KNHhzqE4I6gukXb4oTEGd0?=
 =?us-ascii?Q?NRinNsUCHUCclOrCboKoSwoPcCKcKqobQViKhXZqEkCgtQhfrSJvyf/PjJhg?=
 =?us-ascii?Q?qvbYQQUHLfzy/lfYzyJsLj3bF+UW+5XevZyZLgKHTM3nuaCEmL3TUe7eeLz5?=
 =?us-ascii?Q?e7EPA4a/2ZP9igZ9NBff3nkNPMTTQnO/6no3004VJ6GTsf/PMTvutJ3WCNdo?=
 =?us-ascii?Q?k1BBd4rn2/wJ3eacpeSPktIJUeWvWM82I/GLwhDY2CALfumy9a0o1kfKvBVj?=
 =?us-ascii?Q?GeozViuIayOsW32KJ8fw2l8arlAnF3wSys4TOoomZETJ33hVaohC3DGXLfYU?=
 =?us-ascii?Q?CQTeQfn4l+qd9vSH5reurjtGSE5SsljtzB8ToHIwrB5DkKgrDgUCvlx5fd/O?=
 =?us-ascii?Q?5wGFkypAHaPCw3/fQeOqO7hBuukRL94GRdKEyNxfbkjatY3y8R9A9/mCLkEI?=
 =?us-ascii?Q?LlRUsuVjxaR5cQ/a01SE1bOfJHDF6Eaw7C87HRTjoC6OtOZH7nsDOnecGmdK?=
 =?us-ascii?Q?xuz5rPMgZRVbw6G/kFDwNYtbD0UZIPnRshSlRyhDQ8jXglIKSKAJVQlRfoCe?=
 =?us-ascii?Q?dTPGhSE2QiBjz/2EOURC2R+gUiJ0UuZD4ltC?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 08:26:44.8158
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 208f1ae3-f694-4bc8-92ae-08dde08c76e0
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB5150
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIxMDA2NSBTYWx0ZWRfX4119Ky95fa3o
 6Xu1VRfxkBQgOn5BQdzvdNvu56PDSCFBuYIKCgY+QhRFimqMsB/KtsTCDifJejIQwm/sW1sW86j
 PQY57bH9yNC4DzAXCR3eftg4DsaOWazdcKMeZxdjOQBKkcCp49BjPk7rfXguyipwv0rPPoVaQuS
 z4kSmLYGrrO2BeYCwP08Q7b2pVOEFMsdxFt1F2pMfKqGeMlOb2hHngnAO6EDvn/FiT+itBXoww1
 fmkx8N8/bkIna8Xd4YRpjHFpSgwP1kt1PzPVvHkHLqANPCO32BSdfNQf0SBpu1vyw/2Yufz/R+w
 bUL0JPvxhiE4s4+mBRGwIT1UrwMC/GlQ5Udp3cxT4zdgl0zt655jndkX72lMXXjbXUPwkHw7PnB
 1CLpem2bheh8YrIqjR9Nd42/uBjBXQ==
X-Proofpoint-ORIG-GUID: wAtRyBIEXtvc6hG1Ek0Exx8OYFSKfsDL
X-Authority-Analysis: v=2.4 cv=EpWLbScA c=1 sm=1 tr=0 ts=68a6d84a cx=c_pps
 a=SfKpAED18FmY9QLmYdbp3w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=2OwXVqhp2XgA:10 a=RWc_ulEos4gA:10
 a=w1d2syhTAAAA:8 a=17M8HyGcdYgNtdz2D7gA:9 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: wAtRyBIEXtvc6hG1Ek0Exx8OYFSKfsDL
X-Proofpoint-Spam-Reason: safe

Using a single value of 22500000 for both 48000Hz and 44100Hz audio
will sometimes result in returning wrong dividers due to rounding.
Update the code to use the actual value for both.

Fixes: 51b2bb3f2568 ("ASoC: wm8974: configure pll and mclk divider automatically")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No change since v1.

 sound/soc/codecs/wm8974.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8974.c b/sound/soc/codecs/wm8974.c
index bdf437a5403fe..db16d893a2351 100644
--- a/sound/soc/codecs/wm8974.c
+++ b/sound/soc/codecs/wm8974.c
@@ -419,10 +419,14 @@ static int wm8974_update_clocks(struct snd_soc_dai *dai)
 	fs256 = 256 * priv->fs;
 
 	f = wm8974_get_mclkdiv(priv->mclk, fs256, &mclkdiv);
-
 	if (f != priv->mclk) {
 		/* The PLL performs best around 90MHz */
-		fpll = wm8974_get_mclkdiv(22500000, fs256, &mclkdiv);
+		if (fs256 % 8000)
+			f = 22579200;
+		else
+			f = 24576000;
+
+		fpll = wm8974_get_mclkdiv(f, fs256, &mclkdiv);
 	}
 
 	wm8974_set_dai_pll(dai, 0, 0, priv->mclk, fpll);
-- 
2.47.2

