Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855392EB5A2
	for <linux-sound@vger.kernel.org>; Thu, 21 Aug 2025 08:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755764820; cv=fail; b=tWD6BdjpQMTNiQsL8E1xAAAsTuKT6+fx2FnAQpe/ILr0bCkyTJhbLbG67Gro/EiHszvz2KsZR1WTHWpm8KC+QmVxVXXw+aksKN0KRZdj+Uf8Y5NeDB3tRz0CA8R0ElKoP7VAua45zbkbgJRJOncynMDKWJnBZP7vwNZhl8yUPCc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755764820; c=relaxed/simple;
	bh=M2sMQ2/cLgNoC8IGkRid0VXTaPU8ei5ARDtDMA8Gq1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DOjaFDJLGcmJ9atFLb2HLS7eXXUPUi4kqwiPg7hgsxormsxeYPSioGJfizC9CgJsJdIENskL6X2ZzjPSXXU6pvnLjr8uGx0r4XbSuftTfnyOY3DNPPVn2O/kFKsIzAGQLKBlr6IFI+DF8Jz5ORhuRBewV3duqbk3GQZQt67jiSw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Sar33siW; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=oNdmsxBT; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Sar33siW";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="oNdmsxBT"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57KEUKOB369229;
	Thu, 21 Aug 2025 03:26:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=e2lwdjuyMLXUKB3Nh/Z5CNr1621knjoXId3swt9hNjY=; b=
	Sar33siWRnM5R+ffe4CEsXTAYGM8QIYyKkXO9ikUBE5LZmfrCAxHTluCpbMX1Rzs
	fBopVUlCiyX4ZXODhlPSeq9h3RUSHjwDoQadBDtH7Oobjxml3f/RT1CtDxKa8h6P
	TU6BvlWoHeHhtYGN04rmfHVa5HjWYnDf/6LL76Uz5OkvKxVqyufDeeMkDc3Dfp4X
	g9CfP6xuolfMC7IhH/5NE+mc40DzbiQ7vbcG+wzJStpSXyf4QJizsPHjaV1fhF6l
	xU5VB7cih5Vm2LCd6QyZobz4lksAFN19QLiPlIYiIr6qDIkhPgdrr2RiAAmrSXZ0
	5KmNmJ6Comy9df6n0Gcy0A==
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04on2131.outbound.protection.outlook.com [40.107.102.131])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 48myd9ajj2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 03:26:49 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZVVdkadIeauGBrmA5/QVN/ejlzqPKCaul0jr8vQWtErHc6yU4giDQjDL40Jph01vaBBVrajklkjPQE3ybQqMV2MpSpdNNBzqilHx3M/E5Pl/syJMzlGaDe1BFR5J1wMRUDfgFgBh6u/9HUbtqBf00R25QTY/+Dtu9UDpN1beX/6JGytQ0E9JSK4bMKYGDfQfwsjDhYKJKR6Djb3W0OoYveS3bSngLUYbliqttmuSK8Qedq87ToDzdoaPSpS78IHoT2XkDq2oNjRM0ywgsxdAoTi/Wtlu0KpBnFWspE2yky149tzdMeTBD9YKa4rV3SYoxUWi/BTpqEozm5hOy5fTLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e2lwdjuyMLXUKB3Nh/Z5CNr1621knjoXId3swt9hNjY=;
 b=poff9K6IHHC1zpGza9kW52oQGm593ja2oY1E7Iqs8PfQvN6jYsbW9kevbFRd7yJvq40btfjf7WNc2AEYtCF635nzSypEcvljJnSWTrQwfFTW6cAn55ETfrlYcO8UGMC/xglVf8pn03MafWbeQyur4m801YKubYXcYngrrNLgyvEj3u04R+N5tr4y0baTQchhlg+8PVflh1VW4ACiknl4KVN9QsEjHRX9Q8DLYMLBDcToUhzz327KJjTG07ZJml4pdYEZEIWG4NgG972mJxF3Vq+97pn2zLVthkmobZyRwR2JSw5lrNTOTIDvCWJ/OY3xzbnbFO8EozdSmjqPihsJ7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e2lwdjuyMLXUKB3Nh/Z5CNr1621knjoXId3swt9hNjY=;
 b=oNdmsxBTFuBxyueeAiDrgeQdBKouySBcyZjjEkiaceyeVT+aodWnY43mMlIvsFB3YmW+H2UdCm7sTebTTajBmxcH1I9HYI2saMNRBoqwcXYCxb9+lTDAAfFQoXevMf+VzDJx5XmLjaP9Ma6sFxDiiE9ZUTJxIOPKn5LnKjfQ6qw=
Received: from CH2PR15CA0030.namprd15.prod.outlook.com (2603:10b6:610:51::40)
 by BN5PR19MB8840.namprd19.prod.outlook.com (2603:10b6:408:2ab::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.25; Thu, 21 Aug
 2025 08:26:45 +0000
Received: from DS3PEPF000099D4.namprd04.prod.outlook.com
 (2603:10b6:610:51:cafe::7c) by CH2PR15CA0030.outlook.office365.com
 (2603:10b6:610:51::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.14 via Frontend Transport; Thu,
 21 Aug 2025 08:26:45 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS3PEPF000099D4.mail.protection.outlook.com (10.167.17.5) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.8 via
 Frontend Transport; Thu, 21 Aug 2025 08:26:44 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 7B12840654B;
	Thu, 21 Aug 2025 08:26:43 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 6419782024B;
	Thu, 21 Aug 2025 08:26:43 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, lukma@denx.de, mans@mansr.com,
        ankur.tyagi85@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 1/3] ASoC: wm8940: Correct PLL rate rounding
Date: Thu, 21 Aug 2025 09:26:37 +0100
Message-ID: <20250821082639.1301453-2-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D4:EE_|BN5PR19MB8840:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 869c1cb8-7887-4ec6-e0ba-08dde08c76c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lUX/WCoCBGIc9yXju62+9YTN14WfIt9yfFgPd1BC/sUV4P5Ve+w3bFSA2koL?=
 =?us-ascii?Q?9nzGbFpePLUun1Qy9IY1YH+sdSN+z4pr0JuleP8+oBTdKh8dA1mTcXxHL8ad?=
 =?us-ascii?Q?jYS1YNt8N+Vgan5BZwkLoV0t4Hmbm6JRN4/JBXuZoLfEpZRUoCoAeg4Zx6mm?=
 =?us-ascii?Q?EmXjGSVsokwuLYO/mKJuBrRXjTobgqNmA70BMV/OWOwuv45cpcIo3aSK7nEQ?=
 =?us-ascii?Q?CC0pMOc5PkgflOxGn95HXuYYBGN2kiqVYKKvOXpCDc+NbyVsH7A0Y7/7EWBl?=
 =?us-ascii?Q?f1F2ogYcFw83GphQGFfgHM7o4jy6s0WBpq54VkNuV8JWkH3L3SzH9t5JaL7u?=
 =?us-ascii?Q?txHORCOtesyMH+HOqL+14F3LuSDhOGiodbNx+6wEhX7HizJHdcnWo0ZpAaUq?=
 =?us-ascii?Q?OraXyPrM9rvkc3XCn6jZXhCKkEdM0lc3EED8k1Ri8kapSfqle80mGncpBFq4?=
 =?us-ascii?Q?XBpLBh1HBGq6ggj3JY9tMyUaruTzT2XWnbU6U+w+nm37VN35kZ0bZCdk2gYB?=
 =?us-ascii?Q?2ctwnuXz1DYCMe8bjK/fFoQD1TJE+iKTKlcxMnsKz6nn9ljHTujoKSG3giLa?=
 =?us-ascii?Q?pa56YJFn5aCNg/If6v0hanI2BxjndDmjWMMdREHZxDOoacd6IwPSij2lVilP?=
 =?us-ascii?Q?i1dzKAyE9EaQ6asmURj4D9vw74UWKwYOcG4mTq0SYK3CKhxovFAsSvlI3hhI?=
 =?us-ascii?Q?Po1rYTOrvG/oOO69iDsQfT4+sFuUxitDtai212/FmehiAa1IFeHAyWPY7OaB?=
 =?us-ascii?Q?E4GlsF0+cKxx/mBkbOLepiFwTCgdEQUIM/M7Kx8Jzwc4V6s3D7P25Ge4LhNj?=
 =?us-ascii?Q?gAQ23njrf83kLE8u2uVitMIIMOdlWanDU1MkGN8kqY2YwEe7eajMqrMWevkX?=
 =?us-ascii?Q?nXDcHAh5pDI529UmhlXt+zx0+G38MqFlwrSs6BNYgXeomB/H0pzpuI3MDUG5?=
 =?us-ascii?Q?+LeX7kLwerT+0okXgRlDuTVtzQKVq2ZCqd49jR35srngit8ns8rwGz6kdVEG?=
 =?us-ascii?Q?LOarvO058l8yqth5vbJdnPu10reLuDgezcx5dQoAzYg1FHCpf7kthA11chn4?=
 =?us-ascii?Q?Nt01xJQWG2C7DFREAnN1wptgQpdiKcZ/IcEUPfy+RLfrlVkrbSvWdYig6Lmw?=
 =?us-ascii?Q?CAtox1tGAmRhHu/V6fjMypmEnVsBUP4YKpbPOtN0yrKWtLpXqfIa52mz4nPO?=
 =?us-ascii?Q?rOB05VsXnllo6k46HxUBNDft5bOYftCalcThueeYQvwEtvW1b3asjgrCTD/4?=
 =?us-ascii?Q?7zMIU4LnLYg2KR80A1cMw20yv8haerkaM+D8OOXCbtbBXbSEydIo4t28ooLW?=
 =?us-ascii?Q?Ycjjyl7TBMu2/5+2yIzVT0EbRSzSXL5g2DjYGvpWjSdSxepIjQVDyazTgPZi?=
 =?us-ascii?Q?+2EeDjIPomSEY6tAlo3qt7PJt2/Qdxo84GWJA5qulsqHCaviNLJhwo5Cp3Ed?=
 =?us-ascii?Q?Dd9ocLO9r+DmiRmLYUaOcoFaRJLgFZq6XweQmZxD1Rd37iknwjLLlqVtK/qr?=
 =?us-ascii?Q?R93YVVa3nLGLfKZI6XSvDzr3Mrob1ux9LiUq?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 08:26:44.6672
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 869c1cb8-7887-4ec6-e0ba-08dde08c76c9
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR19MB8840
X-Proofpoint-ORIG-GUID: QrtY9_mAOAOUqCWYIqnxNVMJkT3u0VqK
X-Proofpoint-GUID: QrtY9_mAOAOUqCWYIqnxNVMJkT3u0VqK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIxMDA2NSBTYWx0ZWRfX6/5pOuJgqq3U
 gpLqoRYCSYmCAxW1DnnEDizcH/2FwZL8S/mK60B1hdtLaGJgFm69uL8KbScXpcJPeWED/ZQD9dv
 t2u08zu/x3F3/dgdPKkPU+XSiuVcBOzv1Yxr/bAcrzfGz7YHP4s4AnNgEe6kAESMWgf1ZDIwUpt
 453CxoWmH+LVRcTmLmPEsG8WOzWpcQkGITIdoUng3lFmA8Ujqe9T9gm/IzVgH73B0uolEZbUBtA
 MwnYCGI40KEUKWBBM76ivt1uTY3k6e83dV/XUB+QVwqg9JP6Wrb8Q9NGbG/YG3ZQeTcYAHdml0n
 yGjV6xo7GAfzciNZdlp7LJMHR748tdTTXLtTwpgkM8bb54jM7xlcjCWI3Abw1w0QakT7dWojvQx
 em2+RCkROPlJC1EQrYlrV6rdEUuURQ==
X-Authority-Analysis: v=2.4 cv=WIwmnnsR c=1 sm=1 tr=0 ts=68a6d849 cx=c_pps
 a=ikxvSTmorgjviMIT8H7Oxg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=2OwXVqhp2XgA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=pGLkceISAAAA:8 a=w1d2syhTAAAA:8 a=PVMzKINHrV3744RC6V8A:9
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Reason: safe

Using a single value of 22500000 for both 48000Hz and 44100Hz audio
will sometimes result in returning wrong dividers due to rounding.
Update the code to use the actual value for both.

Fixes: 294833fc9eb4 ("ASoC: wm8940: Rewrite code to set proper clocks")
Reported-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No change since v1.

 sound/soc/codecs/wm8940.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8940.c b/sound/soc/codecs/wm8940.c
index 401ee20897b1b..46c16c9bc17a8 100644
--- a/sound/soc/codecs/wm8940.c
+++ b/sound/soc/codecs/wm8940.c
@@ -693,7 +693,12 @@ static int wm8940_update_clocks(struct snd_soc_dai *dai)
 	f = wm8940_get_mclkdiv(priv->mclk, fs256, &mclkdiv);
 	if (f != priv->mclk) {
 		/* The PLL performs best around 90MHz */
-		fpll = wm8940_get_mclkdiv(22500000, fs256, &mclkdiv);
+		if (fs256 % 8000)
+			f = 22579200;
+		else
+			f = 24576000;
+
+		fpll = wm8940_get_mclkdiv(f, fs256, &mclkdiv);
 	}
 
 	wm8940_set_dai_pll(dai, 0, 0, priv->mclk, fpll);
-- 
2.47.2

