Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D8335675A;
	Tue, 12 May 2026 10:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778581913; cv=fail; b=gcgjNmDTtCl8x+RbUMbJsxgBBOe8zTbvaQiQfchz4RjUj8AN3dLYIL1rzLpUyjG7EqpEs61zE6S9W/loB+0VrmGI8dv4M7Fvyt2iGImE0hXR+sTZixOPVr/tuYLpw6Fe7PtwbKzsisdC/xORaqMv1ogD4egO85DUyDbwuF5CzPQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778581913; c=relaxed/simple;
	bh=1E5C6f2goLWC+eqfHixB1FNisJsI/ISEf7lhw037e0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hSuQHDxuK0YVphe8/TwAgPPV5A2+Y7Ki9WasVLt5JMJmax29RihHdyAmPe76xuB9QRT0DAQ1pVD8Iybrc9zl1j7TOkSK3OTc+R/CMNEzu7L3+aAm7G72aAc8tciyWwPxUUL+DVztN9CDoSQy0roxYd0A9+BPurnL2/SBkspauNk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=DY+yAyDM; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=elb82ppi; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="DY+yAyDM";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="elb82ppi"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK8R3u4113712;
	Tue, 12 May 2026 05:31:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=3fBp/B3oYeTWYxXDrewUymQkATMVXXdeYX2tCEeii5k=; b=
	DY+yAyDMU2XkL3gBxyvNO9Y+rzRR+i7GfGT6Y84qqa6ijE2dCJJV6rb/vIQsv+Kv
	JnKph/5ekQOmJqGo6Qgq8//0ovt7s/CA4QJuURu/n4A1qI0TCilN+RQ3PmAKQCGn
	ZEbw294g/a0e8pFoG0If/dv71VfDCgGHPARIZYmAiRKJeFv/CrzPye9F2dv4vrkm
	Z92JIO5I1d4lpg+ItQgJ/stzHVb8e+uYyxymUUDhWJryAKDw0D7aVpBtpXC4ZEcn
	Z31vVT5hItHibmicA+rFDuLVqNSlgMQY/SNrI/aTXudOyn8RXwfYo+Ta/ASleNhN
	qHqVb1nREQWqj78cLsNHjQ==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022114.outbound.protection.outlook.com [40.107.209.114])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4e3nvvgr3j-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 12 May 2026 05:31:11 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i1gc06d22AI2+4t2RvsDqUiQzrn4cXUcOW5XbYXFpgd2BDONV8thiDCBYa5sO29DQ9MExhocegdZxxuRFsxtSiiOszvTa/XMETBVxsp7rUV34AWyjeYS/Qwcn+3nN6aoWqYZADMx7IGliA5suVNRYcRaNuMGlY3aqsW82rwF+d1KuLLbHHrs8p6FPOln0iWIAKbJh9IGoAf7tFCimM6SaGKpkfBl8GEbpTlowfCvMW0P/yAUN7kvSJ4bwIHe+YDLqwLRWhc3g5iMEsnNntTGDklw6lVbotCYJtz/Vcuckfl41PU4iVxo2sgOU8mAof41OVxrasvBM5bno2M11zW17w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3fBp/B3oYeTWYxXDrewUymQkATMVXXdeYX2tCEeii5k=;
 b=pNjTk8eCHlHJpHKIM0WTib9WkN8A+XTWKeCkzj9FA6kC90gLd+yTR82PL4lWG0pvZ7u5kPk2queSVQJoxoTWSRiy1klHfc6r+aGUXrb41vgOOzeSyXRJ4e9I3yxLANGPcnsyzB61vcuhaaKyMiKwhi6KSXnSjYBUntAxD9s1qwrxC7FPA3by5w+KFbz7vtsdSavc0roKll5n/dCyGcREgfEkfd+DBh+RWQzbC9ReweFPIOolYeHkjLdBewbsw0Uc/md04VZmZJZ3es6hcx48TjjKX+A97Tw37cnfISAVNn0Qc5XvG6cUO6Cn3GdDa7PXMQ9NPv3NsPJHIVXsZnfxkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3fBp/B3oYeTWYxXDrewUymQkATMVXXdeYX2tCEeii5k=;
 b=elb82ppi2t1rYDeFgsg1Bx5/l+LEyDzLkWKs7h+eqzEKhfcdx0AMszdSrbJZvz9SzuAYKdfC5RsFtNId8DOkICiedDVuoUFcUYfMFuIlcqNz4iM4OPFtM9Sc2R2kSKW7segPMPBt0/KwyVfO3ANR/lKpEXn+uHFC2YrFZ1HtQ1g=
Received: from DM6PR10CA0020.namprd10.prod.outlook.com (2603:10b6:5:60::33) by
 MN0PR19MB5828.namprd19.prod.outlook.com (2603:10b6:208:37b::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9913.11; Tue, 12 May 2026 10:31:08 +0000
Received: from CY4PEPF0000E9D1.namprd03.prod.outlook.com
 (2603:10b6:5:60:cafe::b9) by DM6PR10CA0020.outlook.office365.com
 (2603:10b6:5:60::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Tue,
 12 May 2026 10:31:08 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000E9D1.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Tue, 12 May 2026 10:31:07 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id AA0D2406566;
	Tue, 12 May 2026 10:31:02 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7969A82255F;
	Tue, 12 May 2026 10:31:02 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v4 16/18] ASoC: rt1320: Use new SoundWire enumeration helper
Date: Tue, 12 May 2026 11:30:20 +0100
Message-ID: <20260512103022.1154645-17-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D1:EE_|MN0PR19MB5828:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 909ef5c5-2221-4a05-63bd-08deb01193fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|61400799027|376014|36860700016|82310400026|22082099003|18002099003|56012099003|16102099003|3023799003|11063799003;
X-Microsoft-Antispam-Message-Info:
	hC+hv5PZkmM2zb/a/CizUMSDw8FTfwe6Q1E5LTTN8k2KrWE7G+/m8OoVl8oNP4XZ6Xa9JRKx0M/0Mcrrr02pGh5NmD7nSxzeu31cxYyhxdhbauhuMuphJaE+1W3o8Bn+gyWsT+D4TBJ+KmgXYMFHgsb/ZdeHXUkSua6jGDLFb3JwlUmQVRmanKsoLO/IYs3bxMvx53SVlMOWlD+i2dy5NF7K6MX5I/+Fclk1bWN+uGfftuW58uVJRNfS/BWaB1HQ9OA0j2CuGcmTxXWV9tzQ6kgXNJ//3eZWDrrDFifYxZwNF7aEJJ9LHUZ5U3sZRbXtTCPoOKOOlmWEzkTBJHgawP+ckL0qaglYOVFCLAU2PprTMSLvtQiDRKFitiAm4YH1VdENPTem7JB6wbhiOg37kl0r+pgQ0tt80XSD8XRrf6FejKCiMZ0/LVLDsXkJ/XpYpZ2kokrknSsEVytM+oQQMwT1ViIFNsABYcR39W9m/sPSk1KV+YJWbWMpQCkqg+1foIN51suqD3ZHagbWnMeR2KwDLJgPzMOwB//Y6jD2rLWb7cfb8JY0r3aejvaIaBSGc4toRFvOfJegq3kDtpmD5KfrbneuxZH64k7BBTBqKZbJjOH/sy3tbsmem0ZqAcQ6Uylx1Uep21KL0OZ0oY+4gjDYGGz3YWE6ZMyNVWmisGdLzMK+WjXI3ncPh3Q6UxDPzzAyS08oQBXOUJ0LQUvXxxmqDRBUlUIcp2G0CMHeXlU=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(61400799027)(376014)(36860700016)(82310400026)(22082099003)(18002099003)(56012099003)(16102099003)(3023799003)(11063799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uRiXNkAhJIB67fhT4ArvpLW1jkYroFVgTZny2GXCI8ybXhg/cptAr+CajIeImCie5mFobUm5ETE4FHmtTsKgZ+CQexJdDfwGzyo7Nl7Gxqy9ZaPLJvdSrOjjOjwENiw9TxL5WETcZecpiCBAXmzkTCy4E8Fk9le4upZ7lk5E6fYZ88Z2C7G0oN1SEhhyJk83HLT1AAjLJ8/wbK5iFSAhEZjfmdSRa6CSQjXAAmzCJCGugcAOaOh7FGYrLP6d/kc01J2epB9ETWh+2eps9Wvsgy2IaE73fVBYGeHiTnFbdv5tEvJgztCniHO1F9vE5VL/o8WCMsPpWdJfgqCPji7SL3X9qwdQsxs7/Rt/OZATE6HQ1HN/5o6hrUz+3TytQ+JoIAOTKhf+hW0k7IXcubCsMZncxZADucnIEVM4XuS/PWmJkTzGfRylHQBw7YKkGd6q
X-Exchange-RoutingPolicyChecked:
	S6l6S16GBTfgNymYzV86a9VWN0nYKsy5uF+8qFK4LVsta74D0IcHfLeKfbak15ZBycDIL2XL4Xj9KuLIwwMgj8zEEd/6i8UL/ZFLvxfV5Cravw5DSlxipLO3Ol8Ypj8pbGLPnQ1KpdNlMymZaXzm2iXpirPESe+xbGsPu1EpA0g6gxtpZ5XjAUamLRqLzD01hkT+mxfrOmyEWaR0CLZMNXIr/G5lFceEXNGuqnk577sAaslFX+VbO2rT1GAc6yX5fGDL6IlfjhPRCgF0eCi2eblHtwA6hzHNpzWFuD9BQPaEvn8QTqkfuBtaBd0ExXjWP5/oWfPR1Njsvn4319cBdg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 10:31:07.4002
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 909ef5c5-2221-4a05-63bd-08deb01193fb
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000E9D1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR19MB5828
X-Proofpoint-ORIG-GUID: tugASnkTcwISyoqfX4MH1rOBpRhL6oSW
X-Authority-Analysis: v=2.4 cv=CdY4Irrl c=1 sm=1 tr=0 ts=6a03016f cx=c_pps
 a=4EVvFC7fyiOjnGrcsbJlsg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=_kLIPOSdNJ7StitxxVsA:9
X-Proofpoint-GUID: tugASnkTcwISyoqfX4MH1rOBpRhL6oSW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEwOCBTYWx0ZWRfX6aR++0mGcNVC
 msckhw6HmxzzudNGSyeX6Ph++Uw94m5EsL6dWJchc5l9TCT8NmuK79BbP4Bvlliw7x828buiuf/
 MOFTnmRJRf0M9gXFhBfM3dwJYuddjvxocEFqjhsFKMcEhp/n3pw1N2Qz+XmTNiNgDQNlX8ZdVEY
 aJx/JFbjG4FSvG6imZ1iYBokPJbbktv3ubGNZKC3qT43p4SWdlSxUlqBV2XigLgHahdsjHSilfI
 o3mryudz9QCf5qU3J2kMsOvc9cdpR73haI2Q/UtvNkY7GlHPtYkWr1bIxdOztcB1qIdYoC/iF+X
 phTIr+zPpiI5gx+98EtEhB2RKekvqt8ajuptVIoaEhmDTrtL2kN/q+UKtULSVVdwzml6WusfcbV
 E6vRsKZb7wANM2BJm7QPN/yEMmAHo22isdoNan14jrrLf7uNkDw8DAjmzkI3Al6yi2UpD1Ul7uU
 Y2xEKTxB2jdirwFMBvQ==
X-Proofpoint-Spam-Reason: safe

Update the driver to use the new core helper that waits for the device
to enumerate on SoundWire and be initialised by the SoundWire core.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v3.

 sound/soc/codecs/rt1320-sdw.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/rt1320-sdw.c b/sound/soc/codecs/rt1320-sdw.c
index 192faa431b5e9..13493b85f3c95 100644
--- a/sound/soc/codecs/rt1320-sdw.c
+++ b/sound/soc/codecs/rt1320-sdw.c
@@ -3053,23 +3053,15 @@ static int rt1320_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt1320_sdw_priv *rt1320 = dev_get_drvdata(dev);
-	unsigned long time;
+	int ret;
 
 	if (!rt1320->first_hw_init)
 		return 0;
 
-	if (!slave->unattach_request)
-		goto regmap_sync;
-
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-				msecs_to_jiffies(RT1320_PROBE_TIMEOUT));
-	if (!time) {
-		dev_err(&slave->dev, "%s: Initialization not complete, timed out\n", __func__);
-		return -ETIMEDOUT;
-	}
+	ret = sdw_slave_wait_for_init(slave, RT1320_PROBE_TIMEOUT);
+	if (ret)
+		return ret;
 
-regmap_sync:
-	slave->unattach_request = 0;
 	regcache_cache_only(rt1320->regmap, false);
 	regcache_sync(rt1320->regmap);
 	regcache_cache_only(rt1320->mbq_regmap, false);
-- 
2.47.3

