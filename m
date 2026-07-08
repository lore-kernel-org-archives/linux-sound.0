Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22ED83A875B;
	Wed,  8 Jul 2026 14:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783519252; cv=fail; b=QCIBr5HLxhJyjdBh0fAKuidrRnMvo8YyLsxJaP1S2mUQgckxtMfv0vHJ7fBHv8CJ1KnD8/3jFGE+byieaxgbV4e2yVpL/1U1R9S7hh9Aq0SAu8FTkxt4xYIaA8f9yeMjHNf14HG/3tyCkN1wPh681Q3u651Qz5iE1DyPLLffNTQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783519252; c=relaxed/simple;
	bh=R6mjQ+DvyrMQnd5/n9SOIZFbYinsGmjCSTE+9dBp1ec=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KgdUJbcMBL/fQy+Alr93aBYIcvFVfgY65Af69dF+oWBpERQUBI1QIxzYxlY8+z6gC2bDkBbypx1pQLfYFwXGyQmIsKOdWKTAiK/4eQRJn/kwH9TrKCLKvbnOQpEf5ealvJvuH+rFT1njHa6nW+CdOv24upG4AScmaz8DyQKtlcA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=RpQo3QP1; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=cMbUkW5b; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="RpQo3QP1";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="cMbUkW5b"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668CjD0I2436759;
	Wed, 8 Jul 2026 09:00:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=8xG7LqQcxanhK4jV
	/J5RL9LrZLWZ5wf5u3nSBWD5WTU=; b=RpQo3QP1R98xsuX+YUjbM5xdHLIvZ8Hs
	/ji4vyWjejRnW/XQWqwXtffHb9mEzhF7BHf7WMpXSeJevMVsJj06ungQl8uOBsC/
	nY5s2iieH7d9lZIrg+t8EN7RLeodr8MkfRz+BXzf5Gw9X4ib/349o/xPlj4VgvuX
	ybF+P7jvo1CYv6RW+nm0XuSNehh434IA3CRjAvPyv9v6yrIur963P2NGmkGIRCTV
	E45XBuEf87X+XvupqdgELIQuPSjYWfw9eR/LfYDKNY+WIVPMZbxfl3cwIbdVxv72
	jpHeX/z/6f3U8CvZwwHYtZC9OfRYedAGp2EWb/5xm1gYnnI7Hfz92g==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023122.outbound.protection.outlook.com [40.93.201.122])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4f6xkjpbf8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 09:00:47 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=idyaUWAYZc6Y3Ce9u1nTLCIggAJiva3VZl0CCk45dhE0w7/mwiTUZl7X6Syx1EheV5mQ63DIKMi1CNF9wbkMFm0SxZxVbTpoEo8V/lYQ/WGfgu+wOaNqT+UvfitDw6LmjWW0P6uegVCPT8U0x9uMFvAzX710TMy3E+9InGriW7u/uohylfhN/OHhh/b0IPHQcFuppDX6SIqhNLnjXvmbBhmjx0Caq2+xp/faA4yVxkBXRg/FlCtb9Y0x/NzWAhkbhbk5H6Wbp+9SAwOV5Ic0Cr8mZdRGNv96yAiKCbLsqLbdGpQy89CvlvBbq+rKrOo/LJtz6rio75+541Ecyh6aNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8xG7LqQcxanhK4jV/J5RL9LrZLWZ5wf5u3nSBWD5WTU=;
 b=VggBxrW6ttcVrOCowBcJ6rQ0MA2tDHte7a2Oclo8w5IG64kCfNMpgmx0ZNR7B6hW2qK0SC9TvpZIqPkUD5093RWuiOY3BYtOrU0cJWapESZxX/T6PRIyS6k4LYishiLJXea2YqUEo5gpM1uD7ylbkGCuAQVgSjKgq7KUTKXN3XnmexJCz5g9D7qNlEBBB/VTeIlIyrOgqLxOy7uz1b46fjeYEV/HyRrbAc++z0FI2Ytpkbkdq5wFVrsL4QhNSv0j/6sjO75LDWOsiwEeh6yxoRXm2BzHUb/rdgJX3PUg5iBRfobbUaNzUjNL3K8YYc7QDUU3A13nLjFn9QuqQKFmxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8xG7LqQcxanhK4jV/J5RL9LrZLWZ5wf5u3nSBWD5WTU=;
 b=cMbUkW5b4VjSybwSwrSvdM621d/ofVK97kNOkXO4WVHd5GascTM4WOzW0r0P1ym1Fwgmd0P4aCRJbSxzJGwhhZEEw32/HwpRRsHcybu5m1TcMTAXggccnCWo6iUOzG/MdpqKVDq0o8QuFkQfPVDGs25PJ3jS7ZuJFxtRoZnio6U=
Received: from CH0PR13CA0053.namprd13.prod.outlook.com (2603:10b6:610:b2::28)
 by PH0PR19MB5081.namprd19.prod.outlook.com (2603:10b6:510:79::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Wed, 8 Jul
 2026 14:00:45 +0000
Received: from CH1PEPF0000AD7E.namprd04.prod.outlook.com
 (2603:10b6:610:b2:cafe::2c) by CH0PR13CA0053.outlook.office365.com
 (2603:10b6:610:b2::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.3 via Frontend Transport; Wed, 8
 Jul 2026 14:00:45 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0000AD7E.mail.protection.outlook.com (10.167.244.87) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Wed, 8 Jul 2026 14:00:44 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 59D70406541;
	Wed,  8 Jul 2026 14:00:43 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 495E282025A;
	Wed,  8 Jul 2026 14:00:43 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: lee@kernel.org, broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org
Cc: conor+dt@kernel.org, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 0/3] Add support for cs42l44
Date: Wed,  8 Jul 2026 15:00:36 +0100
Message-ID: <20260708140039.1993489-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7E:EE_|PH0PR19MB5081:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 01782e12-d9ea-4cb9-1944-08dedcf94e0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|23010399003|7416014|376014|82310400026|36860700016|18002099003|16102099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	mgvF3w/+tLhT4Oygo2/VtRIku9MoPboLaZTF9rgBxkAxV4n7aba00rGe73oRHtaqE2IYNmATBU0bhLnpDzd62KUGVqwlUBQTb1JQNOPVidQAKmkuQcoJAZqU6kALxIhubMKo7Mmyr/3P50/37g8RgeHtjGNwDBiWpv2fHEgj/fZGBb+d3/QTGsklFDWOIpmSLwSOb/bMhZsDAgnUcs0K2aAKb6Icae++3SX1Pd2Y4UpI4O3zMG/TnqONhByy8B+N42ROkARQSev4imL7YDitmeuXY9Rq3dwXKeF0B/kxQL+PX2nIEvAFSsrzcyvqDvKSQi7c7eiHBAsc7GtB+H7tqQxYs+86rRLQoQ6oJhNgrhhuYx+73ty2dUOV71vcHauij1BDythOov5pWGrnbbJ/LVh8tAuMm67/nIqsIxB+Wuo2oIFnR/v/92vQPS/9RVDEB/d12jehIbasDlSuuJn7AeKHyIKedK0vlOT/DtnSE3TaDiXJRA0gh+Jqg5mUchU8SG4yDC8VjasfNXHSU7ItwsPdwamIiAY3lGw6DQOif+zcgXJewV1MgsvIP5Z3BfxlVBNbeAiic+Utfbp3/tROkvjT6cXAEOHtra1hNMviRrDcgpCJUasCb4mFIl9gPff2npUytDAABXy+mH/WOuvChUh9pt9yV7uM62YOq+a4VpBrW9Hu+SaT5RX/oslTUMBabG21/T6IP0uC4cW7BC4nbg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(23010399003)(7416014)(376014)(82310400026)(36860700016)(18002099003)(16102099003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wKtneXnaQlKJ6qVQNO0HQVTbj32T290Z4F8oYnb74zDQtlFNTHhzUBXGdyR+mATK9fhSkqKBSmorQpzIeRF1LY+KuBEo1fpW6yxlq+QJF39qXBQ5qr2XqazsCcLdPhXtA5MFFBrgKBXu2uqgWXa1MUG0DVAn2qkgwB6o6OPklUZMCa14T7vhTtYUDhA5n3yhLSLxKnm4UkaLduVDR7pE2vF4DeA/LJR6PX+0Sq28zzRVq9pQjoNRr/KGleHCvf/fKxfmpJ8OHebFnY5F2s2EHYOUtw8RM6CDAX0BybyBQICkEX55l47Woyv8xm9t2etb9hfLxWDzmyRkZ+tDzRFph3eWmU4mcpzidIiIPhi+KE5gtJEOA0B6v5qNeSB6busqpAhgDRF0MytD5Fqp38FxZlfxV4kLLlfcOxIyh5ObD7klY6yqXY9z70spJ3/kIsda
X-Exchange-RoutingPolicyChecked:
	VUP79bXcMLIMzAva1tleMgBWg4Z/SqfRixUhxv9v2QqldmaI8HptRkm1R3SU6bw6OqYeOTkYu+6SnvMF4gmlBb0ID+MoNe1RTq0gUtN2NZljHW9o4EeG4X+IUgCleQSSjTsLhPV3ZuWD3vm5ANABEIgimGRrJawmwKAqWm55Tp9IBOT2+lEQZo6cyLe7UT6TWa6fREArunpJ6tbQ+xj9UBzOsZ/eWrH5S6eRtU/6VbNHctIiHznMmzDJG8neoIBAH2YFfWxYsQYKgRlPH0A242tXpRIIYETt+CiaWmSDpepc35VKgs+Tw/lN2f6sOIAdmDwrg3C191G58E6vFtUWsQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 14:00:44.5082
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01782e12-d9ea-4cb9-1944-08dedcf94e0a
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0000AD7E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB5081
X-Proofpoint-ORIG-GUID: yOlR7IpUdk9U1YE_ZDvzB8hfvmO5Z2b0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEzNyBTYWx0ZWRfX8Hobgg4jzFrP
 PSR8hqytUSJzw/8fa6r0TwCEKJNwUd6NEl2ymGm7kT7To5q6plqp5Ex6udH25nSa6qdQzW9IIRf
 o9gyiXcbuNX7v4JRY3MfZwbGwv8maP0=
X-Authority-Analysis: v=2.4 cv=YYiNIQRf c=1 sm=1 tr=0 ts=6a4e580f cx=c_pps
 a=FNmKuShaFFLZE4HaRSHjWw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=VwQbUJbxAAAA:8 a=IpJZQVW2AAAA:8 a=Pg72HOMR73NeaF4ad0YA:9
 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEzNyBTYWx0ZWRfX644qpbTBZgfv
 YnDabEFiy79pE8lzUeFRpD8/FR28M3fTNMMvfIQXaMcifuKg6sLjCY4/y3CGmziElqu4tYeu9GB
 TqvKR5aGwU8ky+8Q6SClJM7AyOUfsIfVtxav2mC/Ghml5tInuX+92XWPPcMISPrnLi8Hxq2mEFB
 1PWyoLQmOPml4kCg4xLmRfBl9dmHXufLZ3ZeRNeXtgNih1FOKkp/r0xCtxnYuSpFxYbPs5Bf4Gq
 2P7LWAcDq0KY50JX3KhHUBo3H4JBORR3REbN+V1pkzhKQrd1tNxcgpDlxWQJyE2u/ovP2k4AYFD
 2EHK9t7+RrG8j2GJ+cdgGfTcvC/K43Ztn7GzDTTFQcoM7HoreOzSGYOSPUHsDBHTDksW9QTHSxB
 xDEafwcxQMVqfxX2Ec3qsb6ZX8nfi1GkfXaYRwvptWOzhBOCFZfVvBzCzrkzVsF6LiAbmzXDqdq
 o3vvKiLTQm1bWzOutbg==
X-Proofpoint-GUID: yOlR7IpUdk9U1YE_ZDvzB8hfvmO5Z2b0
X-Proofpoint-Spam-Reason: safe

This series add support for the cs42l44 to the cs42l43 driver.

I have based these patches on the series by Uwe from here:

https://lore.kernel.org/lkml/cover.1783507945.git.u.kleine-koenig@baylibre.com/

Since they both touch the device id arrays, does mean Uwe's series will
need to be merged before these but probably simpler this way round as
his series is a lot bigger.

Thanks,
Charles

Charles Keepax (3):
  ASoC: dt-bindings: cirrus,cs42l43: Add CS42L44 variant
  mfd: cs42l43: Tidy up formatting on sdw_device_id table
  mfd: cs42l43: Add support for new cs42l44 variant

 .../bindings/sound/cirrus,cs42l43.yaml         |  1 +
 drivers/mfd/cs42l43-i2c.c                      |  2 ++
 drivers/mfd/cs42l43-sdw.c                      |  7 ++++---
 drivers/mfd/cs42l43.c                          | 18 ++++++++++++------
 include/linux/mfd/cs42l43-regs.h               |  1 +
 5 files changed, 20 insertions(+), 9 deletions(-)

-- 
2.47.3

