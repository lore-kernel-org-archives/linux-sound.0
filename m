Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51FE349CEE;
	Tue, 12 May 2026 10:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778581913; cv=fail; b=TNySp5ZL0HvHdHKfDC3e12vZic2MjgJYZUMeOeCJnygvtTbjgOjFWlx81Fpf+elDKGf1xZSvi8usfr3U33s25Kkit8GT58pLjCqNgLgltl4hCYXEgq7gJk0GWsNWFIG4SpTnIZIq3pJ3W/7upinuUF6FHo3hkcjvAPu4cXTVISM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778581913; c=relaxed/simple;
	bh=2nMmecVaeuYNTOPlrm106nXdILBh14WNsTJiVLIDj38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OZQWemeQnNwPKHAMHePla1AWYevkY6Era53UVKKeJJO0JA9Df+j1vNqkmP/WN4mTv4wc7J/9QOk5wa7j6ZpkrfcsfbC2G22GyEgTndjhCVq7nDHXVwvz2Pigaq3kyUrOBU89JoErnItFiJZtAMhcK/ZtxlZkmmRx8jhTqXW/678=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=b7azc60B; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Nvu0I5Fo; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="b7azc60B";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Nvu0I5Fo"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C4hpnv1493060;
	Tue, 12 May 2026 05:31:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=BwhEkbJft3S1w0YnSf+07ruSm2fgczaeXn+Q+Qr9LrY=; b=
	b7azc60BdVI0JM4nDh5wRfpyIuQftvFBZ75Y+oVsvd2xCow7Aq0UfbL/gWrC3Hjr
	Mg8I/+1yRUyQay1TnrO2k0cb1+LStdxSurSfwQfOFPqJZqA+Ip3R4xnT7fNoMyJN
	CI+5XUN/d8kxXttaFfWw4tUTd4j0pZ7+ygc1quedMTpJj9HjjJxmf+fHo2pgZiOO
	7/T4p0hNWshjYZUs/uFe6LC35ypzFlcELkWlNmYZ2VEifNWP/YarE2xlzce4+RcX
	YtubF0cMAPQCiji8xWFzIhxQS7AMFgJIkQt/AfVjpGSVZq4iaoPqKjmM1K1xWo1j
	At9Uq3yFmAoS1ZOWbWLBAw==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021123.outbound.protection.outlook.com [40.107.208.123])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4e3nw58r85-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 12 May 2026 05:31:12 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yOWoGZDdYuG7Q4622+AdSKYOfGrUJCYglkH/u8QNxCZZrAZ2k2gD5BVXGkXmbYeKRSLkMG72Ao2Enq1cJYVNPnana3mkykJiBMKGOtA78EMed9vTtea8VDxqxlZjpM60dLo3fKTka3AVdBgAEYxhsT4yuEzig4fzdD5T+7HncxPVwW5HpCFsz/UKPFXf/kkaXtSzrcGaXmmD0ANh60P/3c7p59Winns8juswe2+RJ7KPD+IqRufuZqnrk5TwGmg9yDdvtot9mEb93DZ2ZynI8f1us114er+nK1mrMvdyd32dMzla9deZvBfyRFXehVTvoMR2qGo+VkcZ9uSWjkAZfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BwhEkbJft3S1w0YnSf+07ruSm2fgczaeXn+Q+Qr9LrY=;
 b=qUDtwavTodUxz6ojZVsWKEQN+ydCbC5L0Q7T+RTkkIhvlWXAOA1RB8zofHl9t8MiHa2FhwIWTIiLrIIl180H1EkP4vPo9E9FWf3RzQsJF50zm/TwvruGDMmYNi+q0EozYmW3J7LCcgC2WgI9ZBfe6ywgQLNtWyeGIP5voiXpkL4yWjNTPF96n+JpAxEv6I/E0MfBltY+DaEhJVEhZFmcyvhqSGR6Ss+BqYytIduXmvw6fj3a5auhQh6h3LeE2j01T2PJk4eiR/T24Y8yE7K84RjdmDdvSjvsMPW71dAUJ7Qy86b5/GlbwO3fMHXlWvnMd9tsrRRX5I34z+OzWgJZAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BwhEkbJft3S1w0YnSf+07ruSm2fgczaeXn+Q+Qr9LrY=;
 b=Nvu0I5FoclqswZsxHCs/hsTq4jgKRjnuPNUOZVWhigqxozZju/VCvS82FZxZ1Eer0pImrPhNBpXkoHg2d9MZvn5T+WSLfUsy6MBqChfkBQ3IwkzhQlm9pBTClrXMrOpmyg8mdMfK+ZewjVYV8snMB1azunwehFezYd0SnKLElxA=
Received: from CH0PR03CA0290.namprd03.prod.outlook.com (2603:10b6:610:e6::25)
 by BL1PPFB259EA841.namprd19.prod.outlook.com (2603:10b6:20f:fc04::ecd) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 10:31:08 +0000
Received: from CH3PEPF00000018.namprd21.prod.outlook.com
 (2603:10b6:610:e6:cafe::ba) by CH0PR03CA0290.outlook.office365.com
 (2603:10b6:610:e6::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Tue,
 12 May 2026 10:31:08 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH3PEPF00000018.mail.protection.outlook.com (10.167.244.123) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.3 via
 Frontend Transport; Tue, 12 May 2026 10:31:07 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id AE5DF406567;
	Tue, 12 May 2026 10:31:02 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7DC8E820244;
	Tue, 12 May 2026 10:31:02 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v4 17/18] ASoC: rt5682: Use new SoundWire enumeration helper
Date: Tue, 12 May 2026 11:30:21 +0100
Message-ID: <20260512103022.1154645-18-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000018:EE_|BL1PPFB259EA841:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 889fcafe-32eb-4144-8050-08deb011944a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|7416014|82310400026|36860700016|376014|22082099003|11063799003|56012099003|16102099003|18002099003|3023799003;
X-Microsoft-Antispam-Message-Info:
	qws2uqhPUjEsUTReaQ2/xX7rb+j1OR1rFu53m3tZJ3pMjHV66F/4U0IXP/JpaYyuodltnJbFyBSkX8uXAiQjLZuKxkzGcm7nA+Z5KoYH1ZOIvx7b9yi38PgSD76F/OUuYbC4YHQrguF/itgamrOHL3HKd5fpYp7dOpFo62aL1rKKuaFw2YzNMr50cSUhN2POUnS+vXKQSwc2z3Q/T9Sgz0fhU+DAzMITnh+oy7STcnS0DODOW9oj+/kpK26fZjUKezdXFf1zosgTAs5GTwYYWmKYMnhpTf34Xm87CtAHsf85DnEZjC1UpfKZ+n8HvtEEtWGmq5hP+Q78BrNan9ta6eKrV9lYsZqVub5E//sD454Bi38i3hAYpvIMKiBVXmGbkHzSFBvhrP4rzyCQHTponcDdGE4qRsc0QWVHh1g3MPdYB7Id33lzHwmX3OqVPTPR0Spg8Hz0de/RW5TCm6vQAqYT3RBjSnFAFnZ3ivLSObIF3sJtULrlb1NDrmR4n8b4+OsdLAZ/xDmvPeA8e/Jw4tuitT8trdrIG0j21k0F9xWO/Q4Sq9Nur+Pkzz4b4qWhGt7yAJM0jcFQkv4HJnkfMHRvbJC0MlI4eJ3d8PmkYRRo2/+hedZD0reRQdjpf7AZGD5S+I0w4qWbGs+z+F87iEV5zwFwl7VX62hvdv0pHoamQJDs0pnnHkYhS5XsF/M2CHdN7vamC2CCauh03Ty+tbsMROm1tZ3MdXbjTkAknTk=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(7416014)(82310400026)(36860700016)(376014)(22082099003)(11063799003)(56012099003)(16102099003)(18002099003)(3023799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	r5QmtKq9URkeQm4NUrT48DYQ0RxQKujlbTbJ40ejrJVhe4maBS9CLH90TiRKTFuXZM0Xn/LcMZVVRegzFUp+R597DJ/3WaEDIvL+cXFB4mu76I+fLC0whg9MiseVMrfL8Y64foPQ8BO7yGzZ93rMhvV4d5q7bjwrJx0q8YodjHJEbk1Djy7V930H+iKWWnU09oDOSeS0K4LFPwSHo3WUcIkayc2qBHLQS5Mbw3fqPZJiRIT+zwfKiWDO7VAyuUHUZkRxyFubbY1ee0eYuG+nfKDDSJDXbl/TLifhwsV6RK0jtUEkOvQa+z4GNnLuV2/mlOHqpp0f/uJFboyhWXrN/GZS4UZ6Qb4ep/VCErfER4FN3Cl3+BWuIVmCAS1b3pZOjc9C46ho+G95GUDt/L+d0LfL8C2hDPlAhmVp93yfnIrqrBmilUThUflvfiC/TSRJ
X-Exchange-RoutingPolicyChecked:
	d8lQtTdg6rB5yUzbul5zbiegwV1DdG51Gj71/aa6MFj81vtmTZf/iijEgf8/MJs9kPztDZ/xpoBA2NgEBgfuH/nuqnM07fS4n1y6RDJ9e18DB+yjwtZbjUMKdn0UumWM3GC/ffhr9gcuMnvNQX6EnGio/1PpBsC/DtzK26uEl/0fsFgiJV/GulhFaC8KGPnFgorJ6GtiMMyraPqknydb91jrV8wMYxiV55uWBRPPwZygK/PhEj/rW1EMGrSQ8RKaUCPlsx9z9sYQ8BDz0OmDSCSIeP9aybUeOHhzNtVMt4rMUylOhtyjymY/LWVEiTqrWZ5JW/vGTfCjECMeTtAfTg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 10:31:07.9667
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 889fcafe-32eb-4144-8050-08deb011944a
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH3PEPF00000018.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PPFB259EA841
X-Proofpoint-GUID: h4k6H5Dlf0Vsw7L-7uUUhFfrH1PsAGhh
X-Proofpoint-ORIG-GUID: h4k6H5Dlf0Vsw7L-7uUUhFfrH1PsAGhh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEwOCBTYWx0ZWRfX00L8WSBNyDog
 dMRsIknXwVzYEeE+qrlPgsjLK/e1uBpqdi0ch+ATUIe5VZoIsjysN6ujGZ7WO/WoW6Ayt48kgco
 VxfYqiReXbWOM0mw0pfBcw1odFWvojk0zLnhkjiNfCLAAX++7H4jTQje3nDItOJurr9TnMaDXHr
 swHL9criDpvEwxfz50bUex13syVljxxT/RWijjNdhkAOfnKJRlsug1AWFl7u1mvQqzdCxU3EPrK
 DV+vcg826F86PeRQow3B1Z0ZtLjYFnnDDzFm+cT+PVpBEBYfsHNCm2JNPOjbvfXbmBPj8sEY7+3
 j74yDKro4lCu+NrUw7aRQXQuvrGd1WaPXmoSuLUdaN2JR35xzp7qQAr06ggvcjO6+GMLswT9sOw
 CMf0u1i0JN6+YlUJkZ6iRHzfXHyWbinFHcRvxMrOsAPPN/lQ2IwLvDTInHG529NTn7alokLwIkG
 H49TjRrKFge7tQ3Rq4w==
X-Authority-Analysis: v=2.4 cv=KsJ9H2WN c=1 sm=1 tr=0 ts=6a030171 cx=c_pps
 a=CxbFE7Xfbix2UyL9/Td2hg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
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

