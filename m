Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B1938399A;
	Tue, 12 May 2026 10:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778581899; cv=fail; b=UDm1PxSN2d0WUZITGfe5+Ulk7L6hlWbiM3OY2wS2k//4qugfICfwum0Dmux57HgN7aBA8JacnHGDRduI6GNbpbXUSFOxOeLd2EWQa8ETdH66QmVg8/QeqA2N0xWIoLZUyPRuFgHpmG+uaydxIbtTibNjVhcwL5Mq/ajf37OpNEo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778581899; c=relaxed/simple;
	bh=MKqVyQ2GQZwVuSxC7i6ZGGgHvlxojYrueEkmw8mqfrk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SuTTLeeodX3f+/40WgxyT/1nHu9x8RbET4VqaivDgPN3XPyt7SUaZmQ/QczJNlBUA006FBXozYn315Xg0EZWhibyqSGj7bsWqltdCxGunbLwCAZtIlAlybSSuMDGveLx3hZ8n1a5mjEYeo5LlCmnqB/uartqmPDtZcDVAhVrD3k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ipVOpnKz; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=RHiLQMTJ; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ipVOpnKz";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="RHiLQMTJ"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C4hpnu1493060;
	Tue, 12 May 2026 05:31:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=3WKMByAVzcu6WvodnCITwpM4ab5P9nCItjIFmzx1eZY=; b=
	ipVOpnKzajPTUHhvvTxEDbOWkiGSTmbNebcwiD4bgpwbV3t69eA1ra3eGRmlhmJP
	uG1L4vZusskQ8tThKvj4S2soax4aoSMVZF9KBv+IBmKIkzJs8XIkZNuss5iKYjjI
	VOZSzqQn0izXi3diNqMb3/HPmTkOqpoc8o9AUWq6VnjFErD21/bnZZEGtbNbxtru
	+ulaOtSPwki9X9xHlmIk3jNAKMMTuyOINblmOAYjq//jdUMnmt2RfXoSgfffMziV
	cl3Tqh5x9SPjCjEQl67QMIfv9jdQMUibxo8StmmWD7Td5OUPWlgCv4VHKf2vl0/K
	chjsTlnTISgmDzY16EG3Uw==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022132.outbound.protection.outlook.com [52.101.53.132])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4e3nw58r82-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 12 May 2026 05:31:12 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ngllK+c0DRCP82SH3K2T626GjBgsihV5z28/NidQCorAkIuy61MT+oAyZPY6kxqt2ui5+wkC/NCY+EFxZL0aT691JaZ7gKfm/6dCXocbYP3TGiWua6C1Xp81Pni0hGmU/x3TF+IM/IXKlmrYj1XFpFS1wgdBVH77IY01fPhyRUq4bzacwfb92ZNs/LzMpUnouDtXbEjtbMKzp2V4ALf8YQ1xR8zOqZ0YpAJnsQfvSmkROw8gQSv5AxDdNaQP0jojNE1Fj7KDEZXSePcqc7T2uvTvq1auIjXSfQ74OentMmByx3JdI7Fo0OHbsXJ6fj1Yyzw1QQTvE5h91+OnI9cATQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3WKMByAVzcu6WvodnCITwpM4ab5P9nCItjIFmzx1eZY=;
 b=VCHWs+bWppEmYD7nTUqlye6hPLXoaFJKL0OEi21dC7ZwIFsorwIFhHw67PPDVV8cIzisRvxYzTb5Io0b3NmslcwzEuj1Gv1YqRngj3dXuf2MkuQFKw03yXJM1BWC3rwgFdsJOGpafUCBsGCIHzNReYdV0QjWQru0tLyGOFrq3FoIA4O9XThouFK/TRsw1AY5HBYeDj8UH8Cvu139lc8gQsi1nvPztyzYuNGpJ7dJ3IeUpuy4IVhC5hW1Af/FTxiZOERktbaDqre+tHLu2MJQY7bKSNakraVNjgcYvInhsmOWYBRf8mjTcP/hQgou4AgEkLU13BXlipDYSfRzIpkJbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3WKMByAVzcu6WvodnCITwpM4ab5P9nCItjIFmzx1eZY=;
 b=RHiLQMTJzL5aJrYpWKudeyAN4+kIASOo6tS+fEjYfuA/9aaiBNzL6bQnukpTt0Y9brzEBejNFMGm2rTtLU37ztDypCEhOxW0dwPWwcYJ0pmUcsAysyK7O+Ki7BIOfg+w041cJOvPnyzQKJE7gZuUc9ohTqzFlP4VEQeF0Y2jFTg=
Received: from BYAPR11CA0073.namprd11.prod.outlook.com (2603:10b6:a03:f4::14)
 by CO1PR19MB4966.namprd19.prod.outlook.com (2603:10b6:303:f6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Tue, 12 May
 2026 10:31:06 +0000
Received: from CO1PEPF000066E7.namprd05.prod.outlook.com (2603:10b6:a03:f4::4)
 by BYAPR11CA0073.outlook.office365.com (2603:10b6:a03:f4::14) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11
 via Frontend Transport; Tue, 12 May 2026 10:31:06 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF000066E7.mail.protection.outlook.com (10.167.249.9) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Tue, 12 May 2026 10:31:05 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 8960740655B;
	Tue, 12 May 2026 10:31:02 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 4C2B7822552;
	Tue, 12 May 2026 10:31:02 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v4 06/18] ASoC: rt700: Use new SoundWire enumeration helper
Date: Tue, 12 May 2026 11:30:10 +0100
Message-ID: <20260512103022.1154645-7-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260512103022.1154645-1-ckeepax@opensource.cirrus.com>
References: <20260512103022.1154645-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E7:EE_|CO1PR19MB4966:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c4ecc358-1b5c-4739-89f1-08deb0119307
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700016|61400799027|82310400026|376014|16102099003|18002099003|11063799003|3023799003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	qSAtZVB4OajNi/GBD2vDaz32KDCWJAj8q6I+RiMu6EU/mSORAxH9CgYaCuqUvf7b+VevPDxLIt7O0t+KwN/AwE7gw7r4AKzWPZfbCnq4l/khoV2JVQq3GybYsKa8WyhUMyJuk+VW3Gk8xzBbJx7iebD6cqnxBAS4KSSOHxvl3sOLiRR1Mqd8jjetzt6bSYqSpPcgXkn/lFztWChZCdzrChYJ6EtX+kPaav32gXPT5JCgYm2qhaR/iu00WFvY8E65qhzOuwDfbsTRfGJ2yDLSawuIT+uaKt2OkaXrI9Kq2W9o75PFoddap1Jk7Po8iII56kg6U9CV5Ac/A5hawlPUj3YXU4Ueixx00kskqIvWukKvURZqnsW/ND+41sYwtCkO9xhqskvA9nxQ7YE5buw+aqKx50hL8NdKllDwWX6TUFP+xIjscf1Kj/7jcL60UAkQEFe2dIk044X2IuLN5rjx61nPo6EK22CgxE3TagYy/Ml37JeWYe9q6WD/DxuheFN7sn1A1npxDBopMQ0MMwRiFpRFqPWQxGlhAPzaoIhnIk2SdRydiiuGlozuotRzJt5dpOJyoxbQenDnQ7NCQe3ZZc5V1ok2zVNlZ799CdyeM6hXWvj6XUPlNuDCfL+YP0k3LbQTv4Pvx9Jl4Luip8MNYz5xEbIlbLMK7Qb13glNPdq0WEFPk9e+lZOqLDnPeR7Tk8gwU1cTsAB5IAg4Kr11xP+7ImnEUPik2jvWFHTXB2o=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(36860700016)(61400799027)(82310400026)(376014)(16102099003)(18002099003)(11063799003)(3023799003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8d1poHKE/NOJtsVoDljbokaWPfVOC+F2MrNeHTlZpx96ADvVxI1h7B/GnhZgdaPGdRHfYSR845vDvosp//HZZCCUsBz0mR0h+RJCs916A2WMD9ThayK0iGklCRs+f2Fbf2BK85pOEmsIJJ6FAuc2qonERIcxZ1KAflsfnHtrKwOwy6deAVfJqVzm+dCX73B8w1NYgk+TllY5wokr1WSt7hu4rCbrYpSyoL8ap66YB9Wsw094STUSgy6+Ucy3R/O82qrYLcXFEQkQQYV9+4R0UbfApmHey7V8cxHDqgk8QZb+BL8F7zW1meyU8yssLcqalQUuLlh79ICdVOZPoe8JAYogClq5TUeINB9vG1Fe85MOmw/0umSfG4u/hhA1P0BhZxGiRlxzB2z3YPdywy/MXyum4WgNHQ/peOY19J04klu5xLxsLxZwGLksD3hRkQ4B
X-Exchange-RoutingPolicyChecked:
	aCxo5UMOZ88f3nr+oQq9qa8Wk5dB46ObNRO02xfcaPHXZRMqpy7EFeo9zdUsPYveSXhqHAiv1+uksUtxWsGOBNQSde1QNmlBDXxpyn/WFlsb2ZivA56LwPCvF9jq7F5ztHealJP1YN0y+DjwC5VPUWbfeSfKa8LEvQFj8TG0HPWzDp0NDqmn9QJqUWk+wSGQWBxY5faVWHtW3a9hnEmclYMzRrYbobzqJSBfXdSgmjRnOYylEnxkyfGdQ7NVQiswvMfEk/utPSPGp2xKeh0fWNQ01XNMgUT/WoCU4syi+b9sKBUQF6+wr1n5EcI68xfJTbSbQChsaqPA8vCBrvpziQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 10:31:05.7708
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4ecc358-1b5c-4739-89f1-08deb0119307
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF000066E7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR19MB4966
X-Proofpoint-GUID: FxtEvVYmbDoqIurH_7ed44sbJcfvPyGX
X-Proofpoint-ORIG-GUID: FxtEvVYmbDoqIurH_7ed44sbJcfvPyGX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEwOCBTYWx0ZWRfXyWm4I+e1342p
 z8wkpMQSmmbNRudbJMicWeXPino0mPvr0W2Zjuu7P0RyFWhoUnRWatfcR8C7/i9B3kZ/PHtJvN2
 pcbruSJEqYXixazUFjxlK0S1jq0oCz5vCrSSPMqAruphoAl6c+TJA8ewIZclTc6ubkRKG7WTOoi
 Oc1vp+iJJxXImA24FVXAbjzoD6ruMqWhSdK4nLr5did2ZnsD/JGaOQodbFG8ffBEwF/SwLICXYb
 kiXLde3ezHJAQntTjFJD8m3IY82j1i5sAvZ9XZ2WTQtHGX55oX81TF877tHMicfsiOhluS+9uOd
 4CvEoAGurZHg8MKaXPpxXWVGVwDOzBGp9c5vYiFfYQ3H3Q4leFeIbXGCrxaKYIA7EDUVbO1SmL3
 +XEI0R6JnT9LKDJQWmW8oyR2t5wwD0QpH01WGAXW6eNVFPwM75peK/2fNJmcJujSWywYLzhB1tA
 Zsj01aOrWbVGJOMlCIA==
X-Authority-Analysis: v=2.4 cv=KsJ9H2WN c=1 sm=1 tr=0 ts=6a030170 cx=c_pps
 a=6PZ0G0LshRjEn6jg1bA0Kg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=_kLIPOSdNJ7StitxxVsA:9
X-Proofpoint-Spam-Reason: safe

Update the driver to use the new core helper that waits for the device
to enumerate on SoundWire and be initialised by the SoundWire core.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v3.

 sound/soc/codecs/rt700-sdw.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/rt700-sdw.c b/sound/soc/codecs/rt700-sdw.c
index 9ce36a66fae1d..30fcca210f051 100644
--- a/sound/soc/codecs/rt700-sdw.c
+++ b/sound/soc/codecs/rt700-sdw.c
@@ -522,25 +522,15 @@ static int rt700_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt700_priv *rt700 = dev_get_drvdata(dev);
-	unsigned long time;
+	int ret;
 
 	if (!rt700->first_hw_init)
 		return 0;
 
-	if (!slave->unattach_request)
-		goto regmap_sync;
-
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-				msecs_to_jiffies(RT700_PROBE_TIMEOUT));
-	if (!time) {
-		dev_err(&slave->dev, "Initialization not complete, timed out\n");
-		sdw_show_ping_status(slave->bus, true);
-
-		return -ETIMEDOUT;
-	}
+	ret = sdw_slave_wait_for_init(slave, RT700_PROBE_TIMEOUT);
+	if (ret)
+		return ret;
 
-regmap_sync:
-	slave->unattach_request = 0;
 	regcache_cache_only(rt700->regmap, false);
 	regcache_sync_region(rt700->regmap, 0x3000, 0x8fff);
 	regcache_sync_region(rt700->regmap, 0x752010, 0x75206b);
-- 
2.47.3

