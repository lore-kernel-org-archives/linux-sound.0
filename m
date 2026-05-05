Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED0849551C;
	Tue,  5 May 2026 16:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777999734; cv=fail; b=CkwBOf3+0v4/yQDSEWVZ0BCEv9aKqECS7ScjksMb6MF0csYKzaf1hUoNpXAfgSY4U2jwosqADFMuuaR9lJ50+bWsSpwIl/5zsHW3s/gVx3mQ3IlAza53Ia/dfb7X3ECn8/eME/AODIcQDPIfUfHqAdEXy3xY7zuCoiEmBw8H9oA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777999734; c=relaxed/simple;
	bh=AijazC99u3bPkVjXnJ1MYl5LEgiAkypGz4LNmjutgc0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RmD//0et/5Bndozwktl9cw5o91ffIQzS03EMc1WSr4hNPs/cXznfoIZFl6u0n/8zHCI3EanZyi3ndGFal9MInpQAX1qFN0DQHjQqJa4lQjwvJdIVK1omOMaviLJYYmOw9+ILUp63o9dPNYZpz1d+6xGbZJD7tDyMWCDKcYSHPwY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ayCbwq+t; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=TbenFE+h; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ayCbwq+t";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="TbenFE+h"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6454rANs1749407;
	Tue, 5 May 2026 11:48:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=A4yS9fAZTJ6r2X4R61s4yxierGOxLQkdPj7nQ8WQkDQ=; b=
	ayCbwq+tAR1cOA9pA1IQDBF/E/gkSLQLz8Urkk1k4tjjmKnguTtN8h8aHG9Xw8I3
	k70AI6AVMgnK6G2tafTSSI2CZLazw4KmtIkdnKp3MLF8cyx2HgdPI7wXp9tExpSP
	qZH1QwatqZGrcj8D39hILHPLrfuLF8yhSdRVoWdC7reQUh4blv02/o41Za9flv7A
	5qua2Rksiryv8xFCuecNcMS0s2x5+9luss0BQuc9zHGpQUxr1SSHSf2kE32BoE8U
	v1m8kGtINzKYbFHMrybv1NeMDbsx7v3RdEwvIm0+qBv7VISLXUc4U5jkvg9ts080
	kFwGRpvMMnqJc1vvUPdTuw==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021106.outbound.protection.outlook.com [40.107.208.106])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4dwep0uvph-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 05 May 2026 11:48:19 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wJPPcJ0EKx9lQJSzg4VoLMMctSVZvY7kC+w5DNtgOy00EjFcxe/IWDlPdjnDMo63OTlCGzqtKNewjPKny0gyjyvUpkZc0N8PLIjzj6+zP06Sen9qZsTGSYTXAVVm9nfo9ihyAwImYe7eIV4VuzOLnDP5lHhXnLgT6RMZNIrOvX7tjP7gHQQuB2G2lN4gCLgDYR1Dt2eLnTLHTVGtnxEDjM8wTp7beoRvN8587UQX+CNNBB0ZrWhbxrNPknB9zEL6xusNNzYEk8WuVYCYQyr6kKft2fw+PLd4GWHKwx/0ih4jqK7pXmF7BzmLbb+4FKlFy+KzsdD+9cFP6Q2gISKPCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A4yS9fAZTJ6r2X4R61s4yxierGOxLQkdPj7nQ8WQkDQ=;
 b=Z4YSq3FeAK2/SzFX8NwbvliY+mxSAwjceX4ymkUZN/Cdy4dUyL6nWlMDSFUmWaPWBkKrxPTJQ4Pm+qfWbFcUMCDiB5p6AWtEj2a5X/PPxY0zZP80+0iWjvJcWnKnHxL8omwbfLCG9m0ASpt1cEuOA66ECHfh3FjC0I6ep4/5o9qf4mLfjRCxVfdBw0Z0TE8E5cUQHARJiptMejhNiPYJhlM8Muc8pDyb4cNHFoiMDRv6tCAybb8piFz+fMHp7d0PEBTZsYIXv2H6OrqOg7ZLoNpnQmLlzkgyO+10lstHvK/ziPmLKqb5em5VWghfl15Y4eRUk4z4+6SDPwxrrddX3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A4yS9fAZTJ6r2X4R61s4yxierGOxLQkdPj7nQ8WQkDQ=;
 b=TbenFE+hFsKSmV+CGwidcWI+U7M/HYR8wKvuuJRuwe/UQYZTR60rKznMKsvYYIaKZlwKlBxPqOTrSvFfFYCT2hwKz+6+Ogso50izaL4rwjI8Q/o8fLhxl5zjvNPAXbJFUBlPs/MWIs7kHNHGRkG39WNA5OZM0AtBuecBEIGw4y8=
Received: from DM6PR08CA0046.namprd08.prod.outlook.com (2603:10b6:5:1e0::20)
 by PH7PR19MB7481.namprd19.prod.outlook.com (2603:10b6:510:27b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 16:48:13 +0000
Received: from DS1PEPF0001708F.namprd03.prod.outlook.com
 (2603:10b6:5:1e0:cafe::37) by DM6PR08CA0046.outlook.office365.com
 (2603:10b6:5:1e0::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.15 via Frontend Transport; Tue,
 5 May 2026 16:48:13 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS1PEPF0001708F.mail.protection.outlook.com (10.167.17.139) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Tue, 5 May 2026 16:48:12 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3A105406559;
	Tue,  5 May 2026 16:48:11 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id EA10782026C;
	Tue,  5 May 2026 16:48:10 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        shenghao-ding@ti.com, niranjan.hy@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 02/17] ASoC: cs42l42: Use new SoundWire enumeration helper
Date: Tue,  5 May 2026 17:47:52 +0100
Message-ID: <20260505164807.4108684-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260505164807.4108684-1-ckeepax@opensource.cirrus.com>
References: <20260505164807.4108684-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708F:EE_|PH7PR19MB7481:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1536561a-cbb6-49f5-a1fa-08deaac618c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|61400799027|82310400026|7416014|376014|22082099003|18002099003|56012099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	NWigWVU/tpihz3lNhVfKMWEeewZlQ2amjpPzOd5rfmAs15nJSE76aYZVxu39ypT6cx5KyqWD2SBzt9mcgHm3+UVJ4NFcwiGgZqqM9h+e05sHluegPwqcP8TTTE+rH7R6VwllAG/LTTqCBbkZRaQWy+b70ikewioq1YVJuK86kOy6YImFBOeIvPZlu7Ucbyy4cs6rIukNnarnkE9nFLjHmmdmuZ5iNJZAt5OZ6CnLFmfoNFeCuP0rRNJkHhidlFKgEaEndbTQEbY/nDr0Bb4O+BbPFoQtSZJGut4CYX9KiRqhxx3tR4twoh/GFc1sD+jG407NTO2BZnIqgq7S3SAByVWAGfgw1nRNfL9HliRvRODn1BfPv/DSltVfWOUsOR+3H7ofUSVW/Hp0zdUPzIDdIyfUfNGxiKUu6E4p2SSFhtljeQ+xEEt4ls1lo/jl+B6FVlM1KXT+qiWayZs5ayajx3XcI7NghlEWLIaG/tqsJZslJZvipWE2MSOAlwsMHwhCETuaDNdxqIaJxlq23X90jNdgaEklH4FHxu/5oiUEyWiAic1n0opTyg1mmZVbT/bkadoi0dDH6qpoHMUcUK3wCscbjZSUZwzOHhgHLR4XvP81d9fSiU+ybIC3PMNnhb2xXQkjinxZmFLWXcEt1Dpme3XnApdxUctB8wRE2GkxA6WNHCvU+NfGquDl6u23HLMMn0BwA6nbMQOnh/PfVV4ggicA5NVwYCmQ4xW6qhVLV14=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(61400799027)(82310400026)(7416014)(376014)(22082099003)(18002099003)(56012099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OvUVcDBkeTXQOGNy5onKZ9GTT8mT4y2wGPB6idByH5Kbg4RdMla1LzvoS7IBdc6PaMS0iWdZoiJ33+IJJRetrosnJDffx/hlEW82/thiosPLkf1IpspZzYDeWMrrUMMmpLS5q1dYKRMDpBz7HKBax8WjxKcJwWhPsK7dV4qymWuHydCXJIxnSjm2FysMS5aogEbdVHDttyuvN6XEgIGi6k7YmbUJc3HqPBShY9Pq/wSjzMrENL8bnShsENAg7xHgVWkpFzEdhjceVV3dNjR8NPyM7x7F9qFLfzqkAFw4BIw50svodqQgIRf6P4Hf8qpn2dDnhG4UHKry3q1jyOjEMJIHemdrfUDAju0Vcg2z3zNW902x5glfpuFEqlASHrmqevDqB7l927BTu0k5qYJ6TzAKe3xZqHVzw5WiQ+eIB+WNsKj9dx7NOhlD95c8EPwn
X-Exchange-RoutingPolicyChecked:
	OwagHDJ5QJDHE8fhv+Os1yBBWNvcAVf3IXatYqPNfQyF+HJZ4zSRUjYQ2MRgdp0MJxatyic4cpHNfwvHZOjy3Qcv04ZPkCFc7bM4VGlvjDw1cvQtGRtXBnO2z/Gdm2x9c0oCyLRuQvixjSF1l4uiPFp6H0k90QbqUbbqQJKN2iwICVp9O9SwwH199/Azij/4Q6nAlwlWevl0cfRIQrnS6A/Cdo/ja5L1M5ooOmPpyEKD3yMEhpr6bHsHSvlEKHURCSDhToxl5nvks2KBQU5Tl0wR3tctzekEjj+3YVU49IwSgZ3JkiZ61iWdkwnLpakRCrNiwmauI0deSgueQNux2Q==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 16:48:12.6408
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1536561a-cbb6-49f5-a1fa-08deaac618c7
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS1PEPF0001708F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB7481
X-Proofpoint-ORIG-GUID: X_A5kOyRF9J3aqsXeTSZDqBYz2C_4LXG
X-Authority-Analysis: v=2.4 cv=fcCdDUQF c=1 sm=1 tr=0 ts=69fa1f53 cx=c_pps
 a=6x23l/Z23zFMKbaFKVaz7A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=_kLIPOSdNJ7StitxxVsA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDE2MyBTYWx0ZWRfX+vHVfq/MS0mB
 HAprI37bqw74fI7apsSx7rqr0IJTgto8Y5FdZcSEkW10pYhwyMYkpOIJybbT+0vnE60kss4n1aQ
 4NGfzkn4tdL0dLmVBcZy/6a+ldolMABJ8HKAqS81Igj6CiCAVGIvodCbCq3Pn0aMfksmmaz6sQy
 20drDBCyzKl0GrVzHzRQRSVkc3Ky635OSiXKdhiAfv5cqf1oSAjr4p73J/spHRdLr0iGWD/UAh+
 6zVdkj5OXqh/xs5HlzUPFDq7PsQoGJPQPliMFjHh6sCKBCPBLELugghbwbKdIE2PJAZTg2emwVy
 KR3i2YUQKadMlt5rJIVIaLpQnUZHtl1exONdBnM+AeHsignHzak7a2AqVoAxlMVLftZyQJk5yhU
 Nk2Po/sSUu3ORD2LZqvjinU6hwDSvVhvoULUeM5/Oj1iPl9OjgQ4wFeFpWcmsfvwOZc+AEI7pDv
 +tMHUE7acR0oPlALmwg==
X-Proofpoint-GUID: X_A5kOyRF9J3aqsXeTSZDqBYz2C_4LXG
X-Proofpoint-Spam-Reason: safe

Update the driver to use the new core helper that waits for the device
to enumerate on SoundWire and be initialised by the SoundWire core.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l42-sdw.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/sound/soc/codecs/cs42l42-sdw.c b/sound/soc/codecs/cs42l42-sdw.c
index d5999ad9ff9b4..ef030d0ddce94 100644
--- a/sound/soc/codecs/cs42l42-sdw.c
+++ b/sound/soc/codecs/cs42l42-sdw.c
@@ -433,19 +433,12 @@ static const struct reg_sequence cs42l42_soft_reboot_seq[] = {
 static int cs42l42_sdw_handle_unattach(struct cs42l42_private *cs42l42)
 {
 	struct sdw_slave *peripheral = cs42l42->sdw_peripheral;
-
-	if (!peripheral->unattach_request)
-		return 0;
+	int ret;
 
 	/* Cannot access registers until master re-attaches. */
-	dev_dbg(&peripheral->dev, "Wait for initialization_complete\n");
-	if (!wait_for_completion_timeout(&peripheral->initialization_complete,
-					 msecs_to_jiffies(5000))) {
-		dev_err(&peripheral->dev, "initialization_complete timed out\n");
-		return -ETIMEDOUT;
-	}
-
-	peripheral->unattach_request = 0;
+	ret = sdw_slave_wait_for_init(peripheral, 5000);
+	if (ret)
+		return ret;
 
 	/*
 	 * After a bus reset there must be a reconfiguration reset to
-- 
2.47.3

