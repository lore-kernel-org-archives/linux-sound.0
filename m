Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652BA494A09;
	Tue,  5 May 2026 16:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777999749; cv=fail; b=I4KlPvSDvIw773UEMtwbRJSGqL5gkwNR3F3beywmmwZt0ORD62X/abSPBOLmSd9n1B45BPhRgW/mSF4iub+JRRsAlyVhiOM0akhoAOGea5raa4eZV/bKwHJ7sRJIPVAyeZsYhWKnFCfrQ1nFe47ED7KWfGMxZCzACsUeTW+uYk8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777999749; c=relaxed/simple;
	bh=MI1X/5cKM7qSVC1ytIDASpGnzuJKcnywmDtoAAbr3lw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GhAUqy/XBB26eSt9WxuVmsiGbTch5E06HxapwoI++5HJnf7opsP3SfwPHbBNiO64WKUrpDifa6cRECCyybRSSH799HujpmwDDx7FF5ar1rfj4X2uficNU3dOqx4qLPlwpZKMjWKicRJre4WosuwE+qxTwE0MY+1riXEcZu7YIAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=hqo6hS8h; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=zNfFoZgM; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="hqo6hS8h";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="zNfFoZgM"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6454tvQE535461;
	Tue, 5 May 2026 11:48:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=9j+CaRguzN4CHZdilSwjbdZKBjtyZgOIeDE6kzNXg+E=; b=
	hqo6hS8hwSuxQMwu8wGU9pYiJM8zUtFvwp6zQWOpMbheUHlowRvoaHCEswmIh2as
	HQo202IQdvLrOjpF7VmCkXJvAdq0VmZIokITnmGzF3lQ3TOSrSlT7KMFJ86fXUaC
	V32s7WvSx60jmjsvTQB22bcOV1q7VeQ9+y9IlxupWHRv0G9MG2QdLcw/cAwPr18K
	fbHDyNUZLLSHXAW0YADgOrqDmPuoPynGJ6bcyUzCaZi2MXrSw976JKUIzUwx3lAc
	RbtV1JcHvIcMgTgJh7qa0tcfoula9xv6rd0Np1+HH8BlyzQT/Cq/zevKm3Gv4AhE
	sb/1r43lGbIQan/XB9X1Lg==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021078.outbound.protection.outlook.com [40.93.194.78])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4dwdpk45vc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 05 May 2026 11:48:22 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ww4VPKRgqw2jya0OaNtD7vVfjxFjNzgGCXcXiCaHjhQICDr6hs79uaf6HAKYmnK1nGDTdK8VBl9o6aoaCV0aW3nVIWaZ83mKBdaT7qnrnX/0UPhazk690wuLI9qqxNCU+8hFI4UrWjWk2CkhXBror2ei4bB6Qz7+BbRsZK8mv/nQhuISZuSva+F6H9ScminNEoE3XGLAuoGNeNnby7pYAWuShKL3jIqi3zCNccPlpxJkIg7feinRZrhVgNzPCWA46LRjxXJdO4QpmZT7g4jt1oNmq3YsytbouAeB6Nyo0T/QcxG0QO8I1fKV7qfhqAVMmA+pYKfyTZrgodTN3YUE0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9j+CaRguzN4CHZdilSwjbdZKBjtyZgOIeDE6kzNXg+E=;
 b=A+gaDx0wV2NGGxRw47qvBesnb1a8qAIvnvq01jHNjZ52OYSsYfTibINofCZ7rtXBpFhOuzmqS/7U82iEGILukZYN+aJWLAWhC2ekkX3qw3hhfZOjD1kvOV18uq+492ZkrHV0URZQib20je5AkdiT6++iuOnbmnA2Zakt5/YRl2oQV1I+Ll6SYU2ZF3lGA84wqckFlX/Tkz80SuW2ovCgRg6d7tmHyYrq7boQk/WZm4H//4lmGfcUbd78+e0tEqSjntMzrWrJVWClyrojRxKRFFl6sl0km6LB89/iBQHAIO58PxUP3Zr9INVAV2cw7tWXA6PS9xeSUaJIngWnm6AOXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9j+CaRguzN4CHZdilSwjbdZKBjtyZgOIeDE6kzNXg+E=;
 b=zNfFoZgM87svjNKUbHWnGq5hSWsXrtVJHtQH96Zngbgkbbsjwf+3GUDqh3oiGMj5SQzPQoMaZvmVRv5lesMXwrNGTtSkykN/hhMIliFW1+P2y6ZRXoN9iNZX0kP36Nujwn8/dIqRPkV10/DV3/WX3USll13oTXXYke2dCvGgwYM=
Received: from MN2PR07CA0029.namprd07.prod.outlook.com (2603:10b6:208:1a0::39)
 by SN7PR19MB7449.namprd19.prod.outlook.com (2603:10b6:806:34a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.23; Tue, 5 May
 2026 16:48:17 +0000
Received: from BL02EPF0001A105.namprd05.prod.outlook.com
 (2603:10b6:208:1a0:cafe::80) by MN2PR07CA0029.outlook.office365.com
 (2603:10b6:208:1a0::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.27 via Frontend Transport; Tue,
 5 May 2026 16:48:15 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF0001A105.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Tue, 5 May 2026 16:48:15 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 565CB406567;
	Tue,  5 May 2026 16:48:11 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2F847822555;
	Tue,  5 May 2026 16:48:11 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        shenghao-ding@ti.com, niranjan.hy@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 16/17] ASoC: rt5682: Use new SoundWire enumeration helper
Date: Tue,  5 May 2026 17:48:06 +0100
Message-ID: <20260505164807.4108684-17-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A105:EE_|SN7PR19MB7449:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b39a056d-1f48-4629-ecd8-08deaac61a4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|82310400026|36860700016|7416014|18002099003|22082099003|56012099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	AeXLuGelS7UNy54TA7LByLXVlvozZTXFg5VLKDJOdtW2P+Szox8aUEXFEsu7bj6KRpAwavkay7RZEDGFFHXl6ASHhOB0Ms5UW3XLzVXJnY4PkODn02vfgtc5Efs2+bvNJPLM0MpH+sjE1RytfPYGYQ6eHdy+Nm4cfYpU3FvMSIrcaIaeJCFcpW8HJdMXxgWZGsrxLNm4dCeKbXdrDYivruCf0vVhUczsaF+os7OEBrTgRm9uks4A4khP/Kxi1+eN4ShD4rp+nLRU3y7e/VsGbecGVXexKX5VyipBokNKlw/Hx338xvPKlB9RT35hIiaKIoGCaSEvTSaaokfBNGFaxrSoboEuLe5Tum7duClSGxXiAvOj9h/dQVi+NxH7rqugH7GI2RsQDAs6EAfkMSsiewLfjaSI11pGmoZPImCDzUTfxt29Omyk/I5Xb9nWOpqq/ezB6USqW120N/KSNsLJLSYfARye2Ed26IU0Osdp3E44TKXW08h01tlmFyoq8DFR+zG/baaTPANST6Raa/gPj1Vi1Q+8/7zmEtMEXXmmJ1U5xUsAWUICTGPNIKa7ddEWBOXkczP7WgrFCTDT88IQGlY1stHPL3Z1eDbJpFu+tnoA6fkszQ/A7a6DjGDI+hkvtNjkhcVxF4vQsg95F06VsBYJ1NF/IgN4tBCv/eD3/XBc/FUh0LxpQ6VaziDDgrWdWDmFHOl9UvA2y0ru+0DeQWTTspKgailTMEuC5lZKgEg=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(82310400026)(36860700016)(7416014)(18002099003)(22082099003)(56012099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BpOHX5+EYFzSOsjrRbLDphXf/IqED9mG+hUKYlRpQKBvTJzbXiA+DNhnFF143QSbBgEBw2Aq3SRLsGcwIq/Q25kIWf5kSzeW+eziDwu6RKjfPxItye1xOBl1bSIO/+TrC3RmpQWvjYtxDhEsF0joXCMSy2RhiWWzCxB4bAfEH5PofH5bR9pgTjTh1u7mumr/FYU//vo0wysx46gh47dTOKq6KL+FsmhaNt5X1jXkMHUHXRDLoiVU8764UV87ZI1fU01c66OXRFA2feU5oAwey2v6Lyx1y9wGhES+UW/us0nOzySG81WSzM8NIRbhIP7W3bGt1ZE23/fqHkbsD0NhwTeBcJ8r88o1zlEKL/tPHlOAUJs7xdqLhVpDCAEnSUCBMlpFOo2dh0hNpNn+tAVcZsaIf9BjpGMh2DZvrWoN+CWgnKXS14fAProgldiIBo+3
X-Exchange-RoutingPolicyChecked:
	LBb1sF+xqOZqfvgLp1o/EIS9OmOVKnyUx+vgwDfkQhnGYDQIGIgZYJ/LpbhJwgNa32T3z6LABCEyf2W9G7UlUikemunHgnCKcaFEAHhkwj96lOcSWXj8Yi/RbDelp+roHSAqtOiLSuB0r4BFfrmNNKj0f7EqiBA//OTr2sLboKo2c4u6W2eMRdsQnH/UMcrqFoyL2mBeKWGknJqg1VPCGeLKt3UJTCKQVyCfOmEgIWsUExNzIH1ugHJZbvKtyY24efl0AcqmpouZATPw7Hh+OH3egD9qYnDF8BEdDKo/DgeaYdSKAVQlJXuhN+tOPH+fvuSvYF8pFqUslc7Lsn+1Xg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 16:48:15.2466
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b39a056d-1f48-4629-ecd8-08deaac61a4a
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL02EPF0001A105.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR19MB7449
X-Proofpoint-GUID: 1EmBObH5cybTr5tFdk-KsR74tBX0EPal
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDE2MyBTYWx0ZWRfX3W1ZmxhhAkyf
 cIOnCJCE5qos8NnXjGp2cMC7sYgdPxZfHcbuHvOpBeSV9xvBc0xlFyOzyYxVsIEsz2FYkkmzMAR
 p8OnbXzt/+JGxOLZgwdivCu2/CJByUwHWAV32OcEZuKJZQFFC2EAgWOAtveqUflHlHOclgxolEG
 J39wkZAR7fYPg5WHo1wRuU/4sChthIItItcEgannMYW/cOWu9BzPcFTefKaiBH0Yl2Ba1FFYslE
 rLWpzqnpoj/reKMJupTFdc6w4ytnOxQvi4Qg59Ie03Yb6E1c76sZNP0DX3YJLmyVAM/Zg3NvkG+
 NihMJYjwuMxgNUmkWKbQMufbYVTAbGmduy6k9fEuUCGIE8K1mvFf7goNq1vuc+HIOEwntt1b/mI
 pW16M5kTVh49ZO991U9F58xqPY2LZYw1+X5N/rjNMTeIsXlQAKDbZ2tzgdkEA4gRrKF97Qw5lpA
 Ar+Lc91PHvxBzVvTrtA==
X-Proofpoint-ORIG-GUID: 1EmBObH5cybTr5tFdk-KsR74tBX0EPal
X-Authority-Analysis: v=2.4 cv=LZcMLDfi c=1 sm=1 tr=0 ts=69fa1f56 cx=c_pps
 a=XqXlOjMxTw5Mth5+b1Cu5Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=_kLIPOSdNJ7StitxxVsA:9
X-Proofpoint-Spam-Reason: safe

Update the driver to use the new core helper that waits for the device
to enumerate on SoundWire and be initialised by the SoundWire core.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/rt5682-sdw.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/rt5682-sdw.c b/sound/soc/codecs/rt5682-sdw.c
index fc464538ceffb..ec2a35a0cacde 100644
--- a/sound/soc/codecs/rt5682-sdw.c
+++ b/sound/soc/codecs/rt5682-sdw.c
@@ -754,7 +754,7 @@ static int rt5682_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt5682_priv *rt5682 = dev_get_drvdata(dev);
-	unsigned long time;
+	int ret;
 
 	if (!rt5682->first_hw_init)
 		return 0;
@@ -766,20 +766,12 @@ static int rt5682_dev_resume(struct device *dev)
 			rt5682->disable_irq = false;
 		}
 		mutex_unlock(&rt5682->disable_irq_lock);
-		goto regmap_sync;
 	}
 
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-				msecs_to_jiffies(RT5682_PROBE_TIMEOUT));
-	if (!time) {
-		dev_err(&slave->dev, "%s: Initialization not complete, timed out\n", __func__);
-		sdw_show_ping_status(slave->bus, true);
-
-		return -ETIMEDOUT;
-	}
+	ret = sdw_slave_wait_for_init(slave, RT5682_PROBE_TIMEOUT);
+	if (ret)
+		return ret;
 
-regmap_sync:
-	slave->unattach_request = 0;
 	regcache_cache_only(rt5682->sdw_regmap, false);
 	regcache_cache_only(rt5682->regmap, false);
 	regcache_sync(rt5682->regmap);
-- 
2.47.3

