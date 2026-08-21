Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6063624CF;
	Fri, 21 Aug 2026 22:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787352111; cv=fail; b=kow/YEDiGbayb9OKCUQJftlnNRsItAJNkjtrmV5bfXuZhgU/NkvNwIEWAtGJW5PZW689nF6RNxu7luDMSPPDGgtNGZTnJ5DsdUqCnyzLbDS+ozqDQErUKyr0/9dATOai1L27P9ukHdMwEewZtgsRtZjH6M4uIXvrMQlTm+jF/ug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787352111; c=relaxed/simple;
	bh=0A7mB589P9Rb8Ze/CGZU5bASo6C6XuGflYRhS68Xzew=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VV8rb54lYhc5D3hCAhNb3pF5wn8mMd1G0h87t5/W1Yih8rbTnjV45HYiZX9H7IA2or8CZfKLrOVgpl46RuieToeJdhppCiik0jH7S5396ktkcQnAC6D5fZaCx/LE973l3Nk3MUMDoUsKg/n42/3KRRpzwt1e76SdkM4J6sTsLAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ieaMLlXx; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=icc6NS3Q; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ieaMLlXx";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="icc6NS3Q"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LCuCpb4001011;
	Fri, 21 Aug 2026 17:41:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=16mXsst7yRVTG59VKOu+xMPLXx3qliAUsWtmT6rr0+U=; b=
	ieaMLlXxUy8Vd7ONm5OHFp7JHkuGCiQ/kdXEzg50gbIEbY5iIZQCtCrRjZVdfFFm
	tlpnxgZbQazcOpbJHwSu1Zxcu348OM5J4T27G1XHRZQZekFozJpyPKnq4kCng2Nh
	ChVctJhr2iwkMuZ6kwS5kD7Pyp4ZlWHsiLj7rJYFOjm/+ILyYuGGw4Mxs/GbvC5x
	A7Uap5lReblA+3rat+u393b1aKDctqKja18nJ+k3uTrWH1AOprZyHyT5weCWtpne
	+qZpj/Gf5+gNgCJf0TPjStXBplTNVwWvYE0hAgZndqazTbNaJyPxliCDaTzz/C2Y
	ZrqRYscVG4AKwX+lzjiX1w==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020081.outbound.protection.outlook.com [52.101.56.81])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4g4ydawnm8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 21 Aug 2026 17:41:40 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Il20D2+PWASoyQFpc5P6a9XY63lVmYTkQab3bOX4PhucBwnsaNfeId1fC//+Y9ch4yBJP/Y4yErSJAYMZBKvNFP9K5nQ6TKwBN+xumqIGmdpA3w+sEpR6PyUrsHaZJw862KspaohoxOFuuXmM3SC8GZUD1Cq1WLS9iXF8kTIuMobs/X6jvFfEh/THHJ9NMTly5rpV2mhv+CvL4V4YVStUaLEKJuGMPZC1OEpvc0nMz5UaO6XbSbE7i87QqzMqfBuyIh9YzERlE38Kjdkp9uv6soH2AtOUw/DXAQ9txP99ob1aygwWcycGNriOolXb3Rny3RYf59CjplBGvdNdDMo3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=16mXsst7yRVTG59VKOu+xMPLXx3qliAUsWtmT6rr0+U=;
 b=PBKolTD2K8qWENubT2FGmsTcvQ7I0DikgIwtSWSIuAENnxGjsWs22Uzbp3pdOx1JJiVV0p0c1bzT2H4EGJhcah6kmMSvx2HhDcrajTBD7DbLebYVH+33lGQNXFt1tUSS5g9d6QJaU7MZjB6Rf9nqb2q9Hzomre40xYH00s4HuGZmGj7MxAhHjK6uV1UFMx7pbJ3ECo4QZ2yfffmPoX8MXAmba1y2+LN5OFQVbS+oYHGJIOHH9XqgEdmZXM3dw6C8mNegiOsxa3Rkl+719hQhOA11ostodVv4L+hR402d6rJN7fz+4PpayVvzDHHQt6w1WuUUmjo45IsrHTVE9FOeAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=16mXsst7yRVTG59VKOu+xMPLXx3qliAUsWtmT6rr0+U=;
 b=icc6NS3Qqu0LQ9fjyv8oWdWKMwSbu9OVbXDzOdeStNlbFcBYi9daW7xXiXq33fApci87DNptbLg5TjqPRJm3nIVwxPRtF1rj48v204BjTn2+9TYk+TajSdh0G8SXARBOQLaCmN1t8Bqii/TFSOHzaWdXPgAV0I47YiY0OQa+YiY=
Received: from SN7PR04CA0031.namprd04.prod.outlook.com (2603:10b6:806:120::6)
 by SA0PR19MB4175.namprd19.prod.outlook.com (2603:10b6:806:84::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Fri, 21 Aug
 2026 22:41:36 +0000
Received: from SA2PEPF00003F65.namprd04.prod.outlook.com
 (2603:10b6:806:120:cafe::77) by SN7PR04CA0031.outlook.office365.com
 (2603:10b6:806:120::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Fri,
 21 Aug 2026 22:41:36 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF00003F65.mail.protection.outlook.com (10.167.248.40) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.3
 via Frontend Transport; Fri, 21 Aug 2026 22:41:35 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id AF3AA406541;
	Fri, 21 Aug 2026 22:41:34 +0000 (UTC)
Received: from [172.17.0.2] (unknown [141.131.136.144])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 84CCF82254B;
	Fri, 21 Aug 2026 22:41:32 +0000 (UTC)
From: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
Date: Fri, 21 Aug 2026 17:41:13 -0500
Subject: [PATCH v4 2/2] ASoC: cs35l45: Adds support for SYNC bus
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-sound-for-next-cs35l45-sync-v4-v4-2-20d3a07c3b8d@opensource.cirrus.com>
References: <20260821-sound-for-next-cs35l45-sync-v4-v4-0-20d3a07c3b8d@opensource.cirrus.com>
In-Reply-To: <20260821-sound-for-next-cs35l45-sync-v4-v4-0-20d3a07c3b8d@opensource.cirrus.com>
To: David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787352087; l=9143;
 i=rriveram@opensource.cirrus.com; s=20260821; h=from:subject:message-id;
 bh=0A7mB589P9Rb8Ze/CGZU5bASo6C6XuGflYRhS68Xzew=;
 b=WRc6a4qHFHRu1VwjEYDKNpMfvVP6f+gTb6aPYnl9Ar4dRg8+PboT8lt8GqI9cnuoQsce1U2GH
 8JnXBn6bCk5DIb9ZzGgE5lbmxzC7ZH5MU9enFUcwUDQM+GSDA+LHwus
X-Developer-Key: i=rriveram@opensource.cirrus.com; a=ed25519;
 pk=PWYAqW73jQepp6ORjx3V81remQilskf6ccMx0Wc1wUA=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F65:EE_|SA0PR19MB4175:EE_
X-MS-Office365-Filtering-Correlation-Id: cd7f9113-2de9-47e9-dd02-08deffd55b7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|7416014|61400799027|36860700016|23010399003|22082099003|56012099006|11063799006|10067099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	tu8URaNoHdc4fJoYc+0Camr3t9R0PH7i+bU2vVjHNGYsV09MnuDx9u4jsc6Tn6x+ckm5guzpF3zZm0EuH/bJ7AfXO//CfGV1wbM9BuOvq5rPBkAU8vE10uTt63P4JOruDSZTJntqBaUuQy8G/sA5UamauhiDm6oGdNqLdOZBnogr7qw2b6mCxWHixB2V02m79wRCNiX3QGiAds59ir4ZomqRv/gLpb4fgoa5fzG+8nkweeft2JKliXXE4p/UUlYEHLlchOL+5VO9cPURFWsp3HuIEOrfpXU0jgT0Dqq40dE1UOO9HJwi+dtz1OkYtBnNzWZ/7Hibd0kQCWZ24I3d6WfSmAA4WiR1nT2Eqlbvd2Qv/HjxdG0v/z31ZyBjBgqiDDP9ATehELpEqr+gHO5/JapnsKOd/b8B5rSeGypPSnAQX0rs1Y3W/H+0xdTTC706WVqOEja64njdUpzEZ7FRkSXeVBJ8wv5HQ5jminzN8o8w5lPPzxUv0EktMzsHYtmw7oDPmPxUoGeM8ONPJWEgubBuFIkVpejzTT6tIDSNQH9JgxBzUk2VSR+uK1Jtpppw2vM4VplDNZKFxDrxxOB/JjQ30xg3SBuorK0Ss+vjND+AFnyCW3QLQpwfRzShaRIG4N++P6mc7MDnD6LFrZB1mjFElLY8hvzuygInYRLiQBQXC3dEP1er5hqGeFAr/fx8eLDpeBf8Ze9L6H9FhJym3A==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(7416014)(61400799027)(36860700016)(23010399003)(22082099003)(56012099006)(11063799006)(10067099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1XvTF5MkX8lS882aVJt2yKfKS3lMYNr0meOzzt8k6T+tNkgQiTPke9jFYh+dJbOt74gOLuy/PTG2rGDo+jfQs8UgRxZige9CJXNL05ephSnAREh86uQhIfl9hyAOkSTnQkb4y2KBAoQaHEivxiQmfIuKWuuSSbIKtec5ZP1o1BQAZqIbqaWPswdANMk+GZEm7xOgeNPeJoIuUjzP7pIt2opiUyU7BLtDvo+eD+USHQ0cumkGimS1nDwa7CoY8hJOOeuOg0Yqxh1RgYs/8NrhLXTQuRepLOouVPqf3JpNUKhMC1IKKE5T9igIQFKfLhozLQRU3ctcG9Rpba/yuQPiJ2DHB9GvNv7jYwG9Bta9DaAGVO0fX0FuK08r6b/76ovbFwNMT+GgTFqTXLI4QNC/8G6+CZ+MsNblAJ2Biia/xBGtDOkSPk0eiGbvMrJ/7ttO
X-Exchange-RoutingPolicyChecked:
	FudDWtXVVawKYna7dp6rMIkMON0TuvvY+IQqu5ulyQztS5TRv5TBD53k5nFsYhtoR3wEaIc3BhifzcCMO/AjAkd5UxgBLuehvHUVfqWH6pb3CeuAPWO9gVWxN6c/7cn5bGy8PKwMGPVdBNz1zOBcTCYZo+d0zuLtLwecXkGaBNZ90cZd7fSmTQewJCPDXRx70ZaxPgRZj5CJHn/cvtYOOAbyInEyvvHhwWCpZsCA9pfDlFPcn3Z+bpC97Lc8jREsWtSYiNbNJKSnhz8G4j4T9DhZ/Isrd4jk1opPjXkAjmFazObetoDs2AP5+p+kz8LcQZTCE/oZKh8FDEAaOpp7CQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 22:41:35.8377
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd7f9113-2de9-47e9-dd02-08deffd55b7b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00003F65.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR19MB4175
X-Proofpoint-GUID: 7OcEa-cRZfYNX9vU0sDOVemqWB4CpzOv
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDE4MiBTYWx0ZWRfX2PuinkJ/npR6
 Nuvp6QOZJ6YyzqY/UmGollxLdrVUrMPudvNieZm+cVrL/uzzPv4KyfJpkD5jlxplkQrUa7i6fsH
 VwhyzA1fQRasbsOymaBmJ4sWg22on9w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDE4MiBTYWx0ZWRfX9uSHAdLjvdcs
 hS6IXQ+CUVg/musts9dIHSq0jIPdmpvkpG/hUDR6Vn184phtnLgGbq8PQ7CSqoE2FdGcdFK5ZSN
 60rd11gn8WYEZ80qnPKnBYflHld4Su9fOPCalL1fcnGtK5xMGFtL79lMPcMrRHopWtWtfJAwOij
 PUZj2SPVFULVWHNSvTy3ujW8W2U22ZTfAeDZR+YrSs1yI1XvZauyUeAQpCOG4xKGQ/Rn8dYW6Kq
 sTr+vcms7tf7+Wh4272WdtvG6tVxr8wi7e8ZAoVvzlWH1rzpm2iNGWt7K+/WJgsc3CCmE7iZncA
 +O2n78Gh0e+J5bClEUoehrZ1Wrcrlm8iUwRCXIXdF1ojr8j2+IvfLW9vKsRc7Aao7gaKiX28iMq
 6UiLkUouFlLq2xEaf/HvOpK//NtO4BJ/9mfeUn9NcGI5idC1Zt/jfAitJiR0php7W49vJ0uOnGV
 lyFJAveHKWx6iqtiZ3g==
X-Proofpoint-ORIG-GUID: 7OcEa-cRZfYNX9vU0sDOVemqWB4CpzOv
X-Authority-Analysis: v=2.4 cv=Hb4kiCE8 c=1 sm=1 tr=0 ts=6a88d424 cx=c_pps
 a=H8KQetTyUVx2NtQIo3bL5Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=I_x9miFozz5syUPFWzIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Reason: safe

Adds support for the multidevice synchronization (SYNC) bus.
The SYNC bus is an opaque one wire bus that is shared between
Cirrus devices. Initial support only includes software (SW)
data packets.

Signed-off-by: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l45-tables.c |   4 ++
 sound/soc/codecs/cs35l45.c        | 101 ++++++++++++++++++++++++++++++++++++--
 sound/soc/codecs/cs35l45.h        |  23 +++++++++
 3 files changed, 124 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/cs35l45-tables.c b/sound/soc/codecs/cs35l45-tables.c
index 764dbaa35042..57982b8ae645 100644
--- a/sound/soc/codecs/cs35l45-tables.c
+++ b/sound/soc/codecs/cs35l45-tables.c
@@ -51,6 +51,8 @@ static const struct reg_default cs35l45_defaults[] = {
 	{ CS35L45_WKI2C_CTL,			0x00000030 },
 	{ CS35L45_REFCLK_INPUT,			0x00000510 },
 	{ CS35L45_GLOBAL_SAMPLE_RATE,		0x00000003 },
+	{ CS35L45_SYNC_TX_RX_ENABLES,		0x00000200 },
+	{ CS35L45_SYNC_SW_TX_ID,		0x00000000 },
 	{ CS35L45_ASP_ENABLES1,			0x00000000 },
 	{ CS35L45_ASP_CONTROL1,			0x00000028 },
 	{ CS35L45_ASP_CONTROL2,			0x18180200 },
@@ -134,6 +136,8 @@ static bool cs35l45_readable_reg(struct device *dev, unsigned int reg)
 	case CS35L45_PWRMGT_STS:
 	case CS35L45_REFCLK_INPUT:
 	case CS35L45_GLOBAL_SAMPLE_RATE:
+	case CS35L45_SYNC_TX_RX_ENABLES:
+	case CS35L45_SYNC_SW_TX_ID:
 	case CS35L45_ASP_ENABLES1:
 	case CS35L45_ASP_CONTROL1:
 	case CS35L45_ASP_CONTROL2:
diff --git a/sound/soc/codecs/cs35l45.c b/sound/soc/codecs/cs35l45.c
index a032bb23b4ac..2d6360bc555b 100644
--- a/sound/soc/codecs/cs35l45.c
+++ b/sound/soc/codecs/cs35l45.c
@@ -6,6 +6,7 @@
 //
 // Author: James Schulman <james.schulman@cirrus.com>
 
+#include <linux/bitfield.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
@@ -195,6 +196,46 @@ static int cs35l45_activate_ctl(struct snd_soc_component *component,
 	return 0;
 }
 
+static int cs35l45_sync_en_get(struct snd_kcontrol *kcontrol,
+				      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct cs35l45_private *cs35l45 =
+			snd_soc_component_get_drvdata(component);
+
+	ucontrol->value.integer.value[0] = cs35l45->sync_en;
+
+	return 0;
+}
+
+static int cs35l45_sync_en_put(struct snd_kcontrol *kcontrol,
+				      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct cs35l45_private *cs35l45 =
+			snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm =
+			snd_soc_component_to_dapm(component);
+
+	snd_soc_dapm_mutex_lock(dapm);
+
+	if (ucontrol->value.integer.value[0] == cs35l45->sync_en) {
+		snd_soc_dapm_mutex_unlock(dapm);
+		return 0;
+	}
+
+	if ((bool)ucontrol->value.integer.value[0])
+		regmap_set_bits(cs35l45->regmap, CS35L45_BLOCK_ENABLES2, CS35L45_SYNC_EN_MASK);
+	else
+		regmap_clear_bits(cs35l45->regmap, CS35L45_BLOCK_ENABLES2, CS35L45_SYNC_EN_MASK);
+
+	cs35l45->sync_en = ucontrol->value.integer.value[0];
+
+	snd_soc_dapm_mutex_unlock(dapm);
+
+	return 1;
+}
+
 static int cs35l45_amplifier_mode_get(struct snd_kcontrol *kcontrol,
 				      struct snd_ctl_elem_value *ucontrol)
 {
@@ -591,6 +632,18 @@ static SOC_ENUM_SINGLE_DECL(amplifier_mode_enum, SND_SOC_NOPM, 0,
 static DECLARE_TLV_DB_SCALE(amp_gain_tlv, 1000, 300, 0);
 static const DECLARE_TLV_DB_SCALE(cs35l45_dig_pcm_vol_tlv, -10225, 25, true);
 
+static const struct snd_kcontrol_new cs35l45_sync_controls[] = {
+	SOC_SINGLE_BOOL_EXT("SYNC Switch", 0, cs35l45_sync_en_get, cs35l45_sync_en_put),
+	SOC_SINGLE("SYNC LSW RX Switch", CS35L45_SYNC_TX_RX_ENABLES,
+			CS35L45_SYNC_LSW_RX_EN_SHIFT, 1, 0),
+	SOC_SINGLE("SYNC LSW TX Switch", CS35L45_SYNC_TX_RX_ENABLES,
+			CS35L45_SYNC_LSW_TX_EN_SHIFT, 1, 0),
+	SOC_SINGLE("SYNC SW RX Switch", CS35L45_SYNC_TX_RX_ENABLES,
+			CS35L45_SYNC_SW_RX_EN_SHIFT, 1, 0),
+	SOC_SINGLE("SYNC SW TX Switch", CS35L45_SYNC_TX_RX_ENABLES,
+			CS35L45_SYNC_SW_TX_EN_SHIFT, 1, 0),
+};
+
 static const struct snd_kcontrol_new cs35l45_controls[] = {
 	SOC_ENUM_EXT("Amplifier Mode", amplifier_mode_enum,
 		     cs35l45_amplifier_mode_get, cs35l45_amplifier_mode_put),
@@ -880,6 +933,19 @@ static struct snd_soc_dai_driver cs35l45_dai[] = {
 static int cs35l45_component_probe(struct snd_soc_component *component)
 {
 	struct cs35l45_private *cs35l45 = snd_soc_component_get_drvdata(component);
+	int ret;
+
+	ret = snd_soc_add_component_controls(component, cs35l45_controls,
+					     ARRAY_SIZE(cs35l45_controls));
+	if (ret < 0)
+		return ret;
+
+	if (cs35l45->sync_pin_set) {
+		ret = snd_soc_add_component_controls(component, cs35l45_sync_controls,
+						     ARRAY_SIZE(cs35l45_sync_controls));
+		if (ret < 0)
+			return ret;
+	}
 
 	return wm_adsp2_component_probe(&cs35l45->dsp, component);
 }
@@ -901,9 +967,6 @@ static const struct snd_soc_component_driver cs35l45_component = {
 	.dapm_routes = cs35l45_dapm_routes,
 	.num_dapm_routes = ARRAY_SIZE(cs35l45_dapm_routes),
 
-	.controls = cs35l45_controls,
-	.num_controls = ARRAY_SIZE(cs35l45_controls),
-
 	.name = "cs35l45",
 
 	.endianness = 1,
@@ -1064,6 +1127,25 @@ static int cs35l45_sys_resume(struct device *dev)
 	return 0;
 }
 
+static int cs35l45_apply_sync_property_config(struct cs35l45_private *cs35l45,
+					      struct device_node *child)
+{
+	unsigned int val;
+	int ret;
+
+	ret = of_property_read_u32(child, "cirrus,sync-lsw-txid", &val);
+	if (!ret)
+		regmap_update_bits(cs35l45->regmap, CS35L45_SYNC_SW_TX_ID,
+				   CS35L45_SYNC_LSW_TXID_MASK, val << CS35L45_SYNC_LSW_TXID_SHIFT);
+
+	ret = of_property_read_u32(child, "cirrus,sync-sw-txid", &val);
+	if (!ret)
+		regmap_update_bits(cs35l45->regmap, CS35L45_SYNC_SW_TX_ID,
+				   CS35L45_SYNC_SW_TXID_MASK, val);
+
+	return 0;
+}
+
 static int cs35l45_apply_property_config(struct cs35l45_private *cs35l45)
 {
 	struct device_node *node = cs35l45->dev->of_node;
@@ -1110,10 +1192,13 @@ static int cs35l45_apply_property_config(struct cs35l45_private *cs35l45)
 					   val << CS35L45_GPIO_POL_SHIFT);
 
 		ret = of_property_read_u32(child, "gpio-ctrl", &val);
-		if (!ret)
+		if (!ret) {
+			if ((i == 0) && (val == CS35L45_GP1_CTRL_MDSYNC))
+				cs35l45->sync_pin_set = true;
 			regmap_update_bits(cs35l45->regmap, pad_regs[i],
 					   CS35L45_GPIO_CTRL_MASK,
 					   val << CS35L45_GPIO_CTRL_SHIFT);
+		}
 
 		ret = of_property_read_u32(child, "gpio-invert", &val);
 		if (!ret) {
@@ -1134,6 +1219,14 @@ static int cs35l45_apply_property_config(struct cs35l45_private *cs35l45)
 				   val << CS35L45_ASP_DOUT_HIZ_CTRL_SHIFT);
 	}
 
+	if (cs35l45->sync_pin_set) {
+		child = of_get_child_by_name(node, "sync");
+		if (child)
+			cs35l45_apply_sync_property_config(cs35l45, child);
+
+		of_node_put(child);
+	}
+
 	return 0;
 }
 
diff --git a/sound/soc/codecs/cs35l45.h b/sound/soc/codecs/cs35l45.h
index 7a790d2acac7..f8a4713ae92f 100644
--- a/sound/soc/codecs/cs35l45.h
+++ b/sound/soc/codecs/cs35l45.h
@@ -35,6 +35,8 @@
 #define CS35L45_PWRMGT_STS			0x0000290C
 #define CS35L45_REFCLK_INPUT			0x00002C04
 #define CS35L45_GLOBAL_SAMPLE_RATE		0x00002C0C
+#define CS35L45_SYNC_TX_RX_ENABLES		0x00003400
+#define CS35L45_SYNC_SW_TX_ID			0x00003408
 #define CS35L45_BOOST_CCM_CFG			0x00003808
 #define CS35L45_BOOST_DCM_CFG			0x0000380C
 #define CS35L45_BOOST_OV_CFG			0x0000382C
@@ -183,6 +185,8 @@
 #define CS35L45_ASP_EN_SHIFT			27
 #define CS35L45_AMP_DRE_EN_SHIFT		20
 #define CS35L45_AMP_DRE_EN_MASK		BIT(20)
+#define CS35L45_SYNC_EN_SHIFT			8
+#define CS35L45_SYNC_EN_MASK			BIT(8)
 #define CS35L45_MEM_RDY_SHIFT			1
 #define CS35L45_MEM_RDY_MASK			BIT(1)
 
@@ -220,6 +224,22 @@
 #define CS35L45_44P100_KHZ			0x0B
 #define CS35L45_88P200_KHZ			0x0C
 
+/* SYNC_TX_RX_ENABLES */
+#define CS35L45_SYNC_LSW_RX_EN_SHIFT		19
+#define CS35L45_SYNC_LSW_RX_EN_MASK		BIT(19)
+#define CS35L45_SYNC_LSW_TX_EN_SHIFT		18
+#define CS35L45_SYNC_LSW_TX_EN_MASK		BIT(18)
+#define CS35L45_SYNC_SW_RX_EN_SHIFT		17
+#define CS35L45_SYNC_SW_RX_EN_MASK		BIT(17)
+#define CS35L45_SYNC_SW_TX_EN_SHIFT		16
+#define CS35L45_SYNC_SW_TX_EN_MASK		BIT(16)
+
+/* SYNC_SW_TX_ID */
+#define CS35L45_SYNC_LSW_TXID_SHIFT		8
+#define CS35L45_SYNC_LSW_TXID_MASK		GENMASK(10, 8)
+#define CS35L45_SYNC_SW_TXID_SHIFT		0
+#define CS35L45_SYNC_SW_TXID_MASK		GENMASK(2, 0)
+
 /* ASP_ENABLES_1 */
 #define CS35L45_ASP_RX2_EN_SHIFT		17
 #define CS35L45_ASP_RX1_EN_SHIFT		16
@@ -320,6 +340,7 @@
 #define CS35L45_GPIO_CTRL_MASK			GENMASK(22, 20)
 #define CS35L45_GPIO_INVERT_SHIFT		19
 #define CS35L45_GPIO_INVERT_MASK		BIT(19)
+#define CS35L45_GP1_CTRL_MDSYNC		0x2
 
 /* CS35L45_IRQ1_EINT_1 */
 #define CS35L45_BST_UVP_ERR_SHIFT		7
@@ -493,6 +514,8 @@ struct cs35l45_private {
 	struct regulator *vdd_a;
 	bool initialized;
 	bool sysclk_set;
+	bool sync_en;
+	bool sync_pin_set;
 	u8 slot_width;
 	u8 slot_count;
 	int amplifier_mode;

-- 
2.43.0

