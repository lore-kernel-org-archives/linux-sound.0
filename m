Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261632EB86E
	for <linux-sound@vger.kernel.org>; Thu, 21 Aug 2025 08:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755764657; cv=fail; b=ZVWyRbpqIiDydzYnQftoappG9Va+CD5uL7HOTOrGI59fhd47b41Ctx0egp5MIFbqRv3oSvwhM4kzsw8Pe5e3n6Q5HJpQMFboOQEfBlobQ19xQa1LnNpYALjufmyn3k+mzWI2w4FC3ZxnAn5NFa6vEbNF9GpufZy8/ze51XYlj0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755764657; c=relaxed/simple;
	bh=G7ItCYu0rBV+qv55nAa+mdvg81nhl9yeJxLWY/lCOCU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kx27IkYDn5fuF5sFphpzHrWtAjPq6yary++u7Jjjof1QZDXlbE/B4xr4C9XqOIriRxx1dm4glkGihYTvQMcwBD8P49ybzw6n03c2iCOHsgS9EvMbLMH8M8NN7UrTFBhiW+ppouUa/A3AS58uOTi8D8SExTD5tA5ifaksPCtypUk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=YLmgzBWI; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=KMH33PUo; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="YLmgzBWI";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="KMH33PUo"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57KEP5SI732167;
	Thu, 21 Aug 2025 03:24:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=8Od40y+GX3XH3sBZHS9yWRI0WaLJD6bzmq6g/b/Ud/o=; b=
	YLmgzBWIsXrS7XubudYOkTZ6RPLQem/c3/EFkGoNDTcyJH0nc9CUqUq5N2eHmLJR
	xzFUDKQ9Yh24sz4DGlij+Y7zHWUXfflJ7U80r+3IYisF10+TN68+yInWlAuUWfCJ
	vR4uOZZ9LuQJato8veDUwx7Nq48lQRWktkbnZ2bKd1KbEwH1GkaqCzaHqV2KmdCH
	Y/wHORXQ3iEinjPc94MZVT91iR/7TB7gL9sSdV4qfqKYRCcg+6PPiwA+TKpcz72+
	+f+HuQxtcvYd56HBHX8PtKKSFAZRbhfxzaZJd6ZeK6IajKymgSuS/v+Y1xgLSEYM
	EIfQkmMtLA0mPbnRtFBkSA==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2099.outbound.protection.outlook.com [40.107.237.99])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 48myd5akd7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 03:24:06 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aDsC5wJvU4C4W4F6hATVmJxN2+k7yacJEgkQ2jl2pZc/Kb9a1UTPckskh8EtaRtNbmqj2BpwoalrFbTrHFQ6JJ5RORGWbLyMysIgx1RXMs0DuvJlMiUqdPqW/K/WvIarnaE4Fu/OCTHxWhTM0xSUcIk439KGsREo37VQdKlWSGLe7fuBzdteS3N81CorSYTIKxnVDOOmb3C8lpEZ49naz87HVitD89FlD4hI42KP5b1IbYJtYk66qq1LDxyndJnayx83axbJkw5UZrUmhFCZ+cZHC0K+uNJiBq3M/mljkx7oZ81YX4gsVJi5LoZnAvPpWXHe3+2DPDzhhTZKrNbLKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Od40y+GX3XH3sBZHS9yWRI0WaLJD6bzmq6g/b/Ud/o=;
 b=Ovt/alw45ZF/v1rOW5iD8+O8m3A75ZFPliK2vwJeHbJdxyi0mgyGRg1AJIDEZkGllBAnG6yqgtOP0fQWe8QrUwan0LF8Wj1R+oywc1kYk1VnhdV13FLqJmdMM47PJxzm8liCDFo2YhX5fPu7goPA6pQuHjpT+Fxsmjp5sRgl9CF17RZ8S9jqZVvUCqjCoaFhwwKWPdmYyz7jpVNhjgV9dcKl7Erngs5hE2Rpcz9AaO7KqxXB7Q3o+jNpUEnSFYpbm+0zwiSEfkTxxsMxhf3wCYTf6etnYYXkLP7109U9mDFO7lU9+C8r/b5jstQrrW3cwKAKw1b0xMNsam3yNKw/JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Od40y+GX3XH3sBZHS9yWRI0WaLJD6bzmq6g/b/Ud/o=;
 b=KMH33PUodJJ+H7Y4bxXhm/r8IOfkq0KeMCLNkKC0k7z/Lb3TBQhGZ2XVwthSAvho3obC1ERIId33D+1q5vCfcQSR+YaW9zWiNPYhE8ay50xc5u4bjTTOlYcGpLOStlvx16/t4LwTwMrGiuQbI8LF8MTolJGThNyA74eEKYkPhec=
Received: from SN7PR04CA0045.namprd04.prod.outlook.com (2603:10b6:806:120::20)
 by SA3PR19MB9405.namprd19.prod.outlook.com (2603:10b6:806:492::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Thu, 21 Aug
 2025 08:24:03 +0000
Received: from SA2PEPF00003F67.namprd04.prod.outlook.com
 (2603:10b6:806:120:cafe::53) by SN7PR04CA0045.outlook.office365.com
 (2603:10b6:806:120::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.15 via Frontend Transport; Thu,
 21 Aug 2025 08:24:03 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF00003F67.mail.protection.outlook.com (10.167.248.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.8
 via Frontend Transport; Thu, 21 Aug 2025 08:24:01 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E5495406552;
	Thu, 21 Aug 2025 08:23:59 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C917E82024B;
	Thu, 21 Aug 2025 08:23:59 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, lukma@denx.de, mans@mansr.com,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 1/3] ASoC: wm8940: Correct PLL rate rounding
Date: Thu, 21 Aug 2025 09:23:54 +0100
Message-ID: <20250821082356.1301202-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250821082356.1301202-1-ckeepax@opensource.cirrus.com>
References: <20250821082356.1301202-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F67:EE_|SA3PR19MB9405:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: cccd5385-3822-41eb-da1e-08dde08c1585
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|61400799027|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OLxQUWicmhS/N1Q2mHYPRhypSB2/acZAvan4A6Rn43RynGdo4uHfUcdvxxDi?=
 =?us-ascii?Q?yTvd04PnFo/Ob8eO82URCkXyT68+MjjVY3pXxu2NZgimjlCFcJBE2LXaYP7i?=
 =?us-ascii?Q?19rcmcBDZPW76jiYtTobCARtpsc7TVjWVsGvlJ5DtcJkh1zWUuoZOXNh9h6L?=
 =?us-ascii?Q?blyelGKD7Bv2iGhTliSt5qfxBr4JTew0o7AI8xWtpuE7SzPFtYWhryuTEn/4?=
 =?us-ascii?Q?jYAgpGeAeD6y17g4VIf7wLzaJvxj24tpqDTCLVDRkGI16cWkxsUxKMtUeDor?=
 =?us-ascii?Q?LSFufyr/FYNFZi3n9c+UdmvLifzEbjdMrG6QU9MmuU3BCLZrie1YppQ6Xa0M?=
 =?us-ascii?Q?cKuQhX6c6fr/Zu2Jsua0qMDooC294QhqE7cOj9lX/As76TSlOn9W2KSzyRl0?=
 =?us-ascii?Q?Ncst8zdfgMk7Sgg/sLvGbTLTKhFpRU/aZ2XPC/Okp3wQuW4sUMxVvVM1QP1W?=
 =?us-ascii?Q?2Z/oxS8RPy81U/ZoJn6Z6Q4HTbsp+RIZZswfzMNDV8yT4fbL6FNkET15pWSv?=
 =?us-ascii?Q?FOIFoJnRfWUQ6KBjRXhyUm6g2/1PUpHv477U627gCvK4jNuPP1HNh3Qx6wBE?=
 =?us-ascii?Q?6BMyNTsdXMkvg+0n31KpYx0KYwCa7wulu8R/KL+UXSXOaC2S92TJaIULS1zh?=
 =?us-ascii?Q?ycONHzrTwlXFWmLjuc/enbb8hOv/PIEJxh869gCqvwjXbUAapwlJVN+wJEZu?=
 =?us-ascii?Q?hOAZ327ledU7PPyfw7a6OQTs7Snqpjez9FM3vyx9hYyypw9cssNeflx4zSjP?=
 =?us-ascii?Q?KjGnjQ8F0G2jXjCsL8nJTz1W7EDQO+n9UhRdqktqGoZB4+dR3s4k22AUAAXu?=
 =?us-ascii?Q?LXcgg3H2SkOi8jOF/HDBjd7C+idZLdyno3axoZOOBIceYGAyQ3EJtYRqwS+p?=
 =?us-ascii?Q?p9aDTD/KLj2ABKEnOPRvtPGgsRBzk4ssSV6+GqeVOUYQjFDByGBsJLBoaK6A?=
 =?us-ascii?Q?0ljAIkrVfCUSoDWg3bwGPNDBJSj3AITVOwwCKAORNtf0/S1RRjMUkw9rCgs9?=
 =?us-ascii?Q?uGoclBpaRRsLxYLi7pWUrNCc2US2l48WKMkaICkbGK/S8EV4j6AlRs0y4C8G?=
 =?us-ascii?Q?WtpmbEpPWSRXl7Zb8obLCsu04ci4uhwLRLCw1hrkLYWey8OzAEhC9MUbapfJ?=
 =?us-ascii?Q?DlM7McRL/M0D0Xg0Q1zcx/Ez1VHwT76o2QTPex+tQzWjmEbgKlOq//3SIEsn?=
 =?us-ascii?Q?yLjlcuydp94pSvGFZO4+UFFLxTGexe0zC+gc1bdgjw7+Cimu4inbRwIFP6XU?=
 =?us-ascii?Q?hC3PRb2CbEnvJ4NjTD03de1+2dYscMLWOO9lNaguZfg9pe8f7JDXHj8RCP7d?=
 =?us-ascii?Q?7lRP3BjGOSOWPM0c81zD6l3Iuu1bNifCnBdSXU7SNGaJF2j9Bda1OGAk9iV0?=
 =?us-ascii?Q?Vd99fAEa/RvODNsdO8fuhKaojboRKNbHCNzqbR4fHPne+NG9D3m404+/B0Uy?=
 =?us-ascii?Q?TfPNhFLAwGsBnTt3p0gGDFSsLNRI9/AGU6+a/+OfVfGPFFpsJbItwpFy1lBs?=
 =?us-ascii?Q?/8fjiGI9jiy1N5gG04mQ/uFLUJ0Juywztfot?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(61400799027)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 08:24:01.4729
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cccd5385-3822-41eb-da1e-08dde08c1585
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F67.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR19MB9405
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIxMDA2NSBTYWx0ZWRfX7zz/3871C+oy
 q3HsHNP0wSemC+R1VhS+G5ULobB2/bMG4FrnRGPdef5z8+u+hL1/dJ+EAIS+3MJjP46Ty2EL3vg
 3boagO2hCVofU8WCYI/cgCSVrlqWx5PB72PLsmCHbnVvkLwH8O8p8W71fEAX8ToDnveztdWIz4s
 gxP5woTUfYtFKbUmZsdHA5d0GHkdI8S4Q4lSVUNDS2EeDit82T2jAFbFq2/LJOVIYRv6E828oAD
 Z/9zoEPuiMfzp3wRUr8bjEcEdqDhSA+q7hBXhqbtj/2acxDG1BTvSTAzbVI0TFwwi+DaUZy/fOv
 vvg0aKU0ybTm+GehjZJIPMpwWfl9yQphw/OL75ziEf8UcNihPVGXdMy9Q5sM9/mYzkwLd3Ywj2K
 +KvLK6gOk1YDaKwD5J3AuSpqtVVxTw==
X-Proofpoint-ORIG-GUID: JE41ok77woM5GnIfwjZRmXXqDBuLPtZY
X-Authority-Analysis: v=2.4 cv=EpWLbScA c=1 sm=1 tr=0 ts=68a6d7a6 cx=c_pps
 a=jXf4nmV5bj/qAQq9M6c7cQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=2OwXVqhp2XgA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=pGLkceISAAAA:8 a=w1d2syhTAAAA:8 a=PVMzKINHrV3744RC6V8A:9
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: JE41ok77woM5GnIfwjZRmXXqDBuLPtZY
X-Proofpoint-Spam-Reason: safe

Using a single value of 22500000 for both 48000Hz and 44100Hz audio
will sometimes result in returning wrong dividers due to rounding.
Update the code to use the actual value for both.

Fixes: 294833fc9eb4 ("ASoC: wm8940: Rewrite code to set proper clocks")
Reported-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
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

