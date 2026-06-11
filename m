Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001BA407CC2;
	Thu, 11 Jun 2026 13:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781184155; cv=fail; b=QxcImqcCMYsG6RCtiGZewhVrsVP8Q8y7xFGEk9xpknJWGmJ56paXetX5F2NatOD/gN4s9Q53qyYJdCb78RhTzPp441fl5z9R+KswQh4uKtTaRwySWdcp78NetxwtXRJJhEKeQbD96lIZAU6cE/ntzMltW2fS+jlPME32pbH/uZM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781184155; c=relaxed/simple;
	bh=LBf74yxOBn/W+JL0iZ+En/lG1Uvbz1xV88pnA6Lbxk4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qXJb2Q4+bMsMS2N/9CYG1XRBR/7+9pSsXJMZNDJlJ3oXSEFkk999zF084Gas40a36z20aAUSQHtpyyvSCcB9eGanpK6LbtKgz4dQweF0SlJ0wZPCsuc64tk62RTLZru+QMPkeQHDgCqMV3hVxFs8DZOYqwww9kQK0jdVEAGAxBs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=K8wSMfP6; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=fOyMvIXn; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="K8wSMfP6";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="fOyMvIXn"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BD0V5C1621531;
	Thu, 11 Jun 2026 08:22:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=ZQOVNrR85BNMl2I6
	HuBzVlsD1dUPznYbV8lFiD9lCkM=; b=K8wSMfP69nmjajNjZYLIsJYQ32lEZIvF
	BiQ6heE2GbqaiKyewzGs/JCoHXxzcszlMwtsxlu0sTld1hv8E22aZxzWgzfC63si
	KjMH10YoPP4ZWlGhx3A+423hPLSloFW94Qp8iJHvmcD2OwxZ0qS/N6fQxXUT4CRZ
	4bVZ9eQaDXDWM6xKoERQF5DWgJ3yqBxhOXt55zU7a4Id1+7/DHLMcWTfZrZxT4ID
	L6wKMmMLt7GEcwYhLE7/ZGbm+03h2oiHAERBTd7yO1hIBjVDg5hagZqDLqxhgimv
	VOZUw6cjX5pRlCkKW7H39UgG/rgcY+vmFtsccCLM+Tqk33Rw8ruBCw==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022129.outbound.protection.outlook.com [40.107.200.129])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4eqe6e15b5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 11 Jun 2026 08:22:28 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CbUtpPl7833yLrb2BV+bWGGuEa+dW2oT8OyFGDChu8uTcF9D4UJ9/WPHuACryVY4CP+y48JlhUXsGxwNTIawhjz5CPlTq8lSPLUIJO3Gap3Gh/QIyWjOmTI6zGft2CvkoQ1oe8lEhPiLYEpGBNoD3rvY3Mu4LySCNmhrQlphDrPYsFR2hFMe2EI5r7oPJP8q1x0NR2cg432W1kiei2k7CTuKdxVPylMVNpF/Ed73lk8yT6C3t/mMM0aqsdZnXkbuA/KYD0qztN7Wd906ywvGmIe0kaCmPp3brMFvrmROu0oUNX2RsUXOR4sfEteua4SL6JKedTAr4B0lkYQRcIqv9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZQOVNrR85BNMl2I6HuBzVlsD1dUPznYbV8lFiD9lCkM=;
 b=dOMEUYoWUrZayWVi5cjwEFKXJ2kpQBdNqRII+qFr3sLYCeUF7KgTG4LN6dADirtBBB64SiBI3P/522UtQJkFvBehYdFbo22uDtkRxiLMUkvWApwRp8fzfK4moEbzwbfgVI/Pbv79JPvtbJhsu1J0/p+jGVgOvscGXIqni0I4hIVVbTjd2BfnGL80GXLn8eSNgzDWSV2Dd6se8PXDbNPmfiwnTFVomZweyyYA+D+VZVWh1f2aasDidZ8Qds7MXcJI0ojxlOETHRrAwSbvCRG9y/mxywGhcjIrJMnjdGz4wz72DEFejDlKH+/vFMDHwZscxsgFRgZwRVFoeUriAyBEgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZQOVNrR85BNMl2I6HuBzVlsD1dUPznYbV8lFiD9lCkM=;
 b=fOyMvIXnGmrUYxHDvcr4sFh39oWxFMXB0CcEIumGCrn5quY5u+cuKbUluXMQfx4HqPh46dNJ7GFg0p8mpZppEfphiixop0oSVPBy047rIUYDEjFa+2Lin7HPzmk9UNEwot8SuT6btqKbHG7SeWPO3robe5YMTIev5zkc43sslZ0=
Received: from PH7P220CA0061.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32c::25)
 by CYYPR19MB8103.namprd19.prod.outlook.com (2603:10b6:930:be::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.18; Thu, 11 Jun
 2026 13:22:24 +0000
Received: from CY4PEPF0000EE3A.namprd03.prod.outlook.com
 (2603:10b6:510:32c:cafe::62) by PH7P220CA0061.outlook.office365.com
 (2603:10b6:510:32c::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.14 via Frontend Transport; Thu,
 11 Jun 2026 13:22:23 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000EE3A.mail.protection.outlook.com (10.167.242.12) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.7
 via Frontend Transport; Thu, 11 Jun 2026 13:22:22 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 6C051406544;
	Thu, 11 Jun 2026 13:22:21 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.13])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 5D9C082024A;
	Thu, 11 Jun 2026 13:22:21 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: cs35l56: Fix possible uninitialized value in cs35l56_spi_system_reset()
Date: Thu, 11 Jun 2026 14:22:21 +0100
Message-ID: <20260611132221.1100497-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3A:EE_|CYYPR19MB8103:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2720f8ed-e9e5-4f94-0a46-08dec7bc78f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|61400799027|82310400026|30052699003|376014|23010399003|18002099003|16102099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	so6FEXKPsbT8QebbXeCJEZjSwLhN4Ewet/+pZvYAVQtXxACNHOCNl+nfrw/QNksOj1dPw0wsTxd4wolVzxoZTBe6CNmmjlUmHlcVk5USycUSRcM/3X7VcZJwK+aLKCUc+auSQwLtb0olS54D5dBuM6QXnbdlfGjmpq1Wv6f5yVf1ek8rGqgL/BHVgvhImj+THWwqcFOwg9BFcIPB+JKwJwKvSokoXX0OMm2c+KDMCxm6H5Q7M4oJXKlFTlU+501J+BwJ9loiOCasPg4Uv4nR3WGQgJnpBXpbkoJMyKkJpqwIqBhNEx/GN/32Ix9l5b3nT95sDhtXprUHe94UUTgPu/INuBS9OAAJk+Rrj63Z048VhSdHqIgdvSdvSK5vTbXIuPH7e+sgeDQkTWdZoKiFL9i/t2u0HPm9NCDVc7+oSLmmNNa35ITqvaFXXWQCJ8KRCGGtyvyvP7nQAFV1+pgzh2OK2rh8te275NJm7Ou4joO+zq/jV449sNK2VZuGorTEu6wqFErVpE9f4ARZmwP/pcfFWJxFEYNyFVr+N17UNs1xpShi4LETuymNT5wLPWXz7neb7S+u83DpqrXe1W2DO+uxHsdI34qZhYp9CAQcbklWvU2l39j5Lb4PhHEyyoLxad9RsLUWjO2oser7XniCj6uhfaeEeX/iPh0B/6HrXyKF6OffhslKIFcAS8yUaa5cAMON+kbGAjQA909VemZYG80LIKO8KpTnsMEIgk9g68Y=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(61400799027)(82310400026)(30052699003)(376014)(23010399003)(18002099003)(16102099003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WVJ1hNwnxcJZYGdV1Y1Xec64M5h17HSYazPahJWXgZ54DdCu1Bac0JpLGPiOf1OFSr6pZc827H0WGayvw2k7+Jq3OApmGAE4h1RaYajG9rxqW8hR7m+egjn6zPuTp73gImaZ+WBVuwkhLsQms8BCSDsnV8+GpYvWl+3IHOvJv9CN2QYc/V/nQX2mZ5aWV7P72OkF09OTDiLANFk40a/bisKXpWM61/nG+ahxgpwu9Nshqw/6OmO5lGyzqLvH4Y+qgA4kTt4x19sgJ8HG41IPhvTEywivRL6aU+WGfcYMlVgm6uPuVqsj2doRtJkFFwEBFn20Dj9dBf55sCpOBzf2tUhRa/mwDOC5YmZclf2dCqNRcB5Oz40zlKV/15wG1SjImBlaSjpWJK30bFyQU52B3TTy+a8CwLZQDX4ZSmrMh30nbuv2J9JMaA3gFuNULfAa
X-Exchange-RoutingPolicyChecked:
	IWNm5FmJmazSAP8oGFH+x7BUffuKrFLV1/QSVHI+6O/g7sAauZJc8SSKuhpTeSQ9wCXQpmbd/RqX2ep1JvLYXfmrJSUzMeX3z8FcBuacb8j1KdXJ34JZN9tElLP52juN2siCTqNKRqGuNk8HsF2wrtuhFNgsmTw/Gvl+KHOYnxOMMrHzCEk1VSnw5UErYiRqd/i5qMRMMNNcG+Br23UMtd1i5yw+c277Wk3giw85/gwnytdaBgPzN9IYaSGNHQNpL8Z8bhgOn3UNnKVAd8yri0IS/gdLBU3Hd9GMhxNfgh7MYPb0H4dfXn3Il2XiM/ZyXxXStNWJHSbWRxckBhdVNg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 13:22:22.7037
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2720f8ed-e9e5-4f94-0a46-08dec7bc78f0
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000EE3A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR19MB8103
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDEzMyBTYWx0ZWRfX4o448JAOm/IY
 SblD7rVU5yAS7IMeGK6ynsH0ZYs6zFRLuEiU4/B6Z+kG4iG/CFGBz1vDEt/MladyeDoxNd7Pk3q
 OmFm/AjtbH03l85AoR4iZEsIXjbfDT8=
X-Authority-Analysis: v=2.4 cv=UL7t2ify c=1 sm=1 tr=0 ts=6a2ab694 cx=c_pps
 a=qarI89rSqn+7JjoOq/Qxcw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=kJq5YCjLBpoLs4DOyuQA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDEzMyBTYWx0ZWRfXxCeR4IyxtN9o
 yWkC8fRkRAY6/+HeijabGXy0ADhNjf323i6hrS639g1d2oP3uxfk8yY1Fm7HHyfWdzshMzlaAy/
 8m4YpfBh0yms8ATYF4GGN6JCi5T3Q3MQxtRt4hdIg7NzEI5NwekUOKIUXGOwdxdHI1JvN4hsH8o
 7LLpHjXka/H2baGYmdogIr6+H/lkuJeP7yCtSk1+ULtfKnwZ7PE1wHmQwyzJJmPsu5vAtqG1yMO
 pjnYDQRUlSeNYwQEoNJzIeRi9CkewfampFnn7P1mOohRad5q4GA3za+62OBjkxXn5on7EVLk1Gf
 IQj5TQMWJzOxY0a+jO+CfAWca9UHKkLGsLYO/JGEc8t4ThPtpg83OUzd0ZOBeQOqqFN9cl27xNC
 EHZH8CwodEPKG11okSCGIRTfRu6Btctm8TnI79CSxYpINjkVvsR0m/FxRwkR+GNQVvLU/bYD4+9
 eVNLmmBjWMRaB/2uKmQ==
X-Proofpoint-GUID: 3GA5l8kMtS1mvc9he3lb8Q6eH3kJPnc-
X-Proofpoint-ORIG-GUID: 3GA5l8kMtS1mvc9he3lb8Q6eH3kJPnc-
X-Proofpoint-Spam-Reason: safe

In cs35l56_spi_system_reset() initialize val to zero before using it in
the read_poll_timeout(). This prevents testing an uninitialized value if
the regmap_read_bypassed() returns an error.

Read errors are intentionally ignored during this loop because the
device is resetting (though SPI can't really detect that so shouldn't
fail because of that, it's safer to ignore errors and keep polling).
Because of this, val must be initialized to something in case the first
read fails. The polling loop is looking for a non-zero value, so
initializing val to 0 will ensure that the loop continues until a valid
state is read from the device or it times out.

Fixes: 769c1b79295c ("ASoC: cs35l56: Prevent races when soft-resetting using SPI control")
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
Mark,

This is for-next. Not urgent.

 sound/soc/codecs/cs35l56-shared.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index 90e52a678e71..d9f237bf8168 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -534,6 +534,7 @@ static void cs35l56_spi_system_reset(struct cs35l56_base *cs35l56_base)
 	 * The regmap must remain in cache-only until the chip has
 	 * booted, so use a bypassed read.
 	 */
+	val = 0;
 	ret = read_poll_timeout(regmap_read_bypassed, read_ret,
 				(val > 0) && (val < 0xffffffff),
 				CS35L56_HALO_STATE_POLL_US,
-- 
2.47.3

