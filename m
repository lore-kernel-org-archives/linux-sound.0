Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9184949552C;
	Tue,  5 May 2026 16:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777999735; cv=fail; b=FvyBZJUDzgw88SBdwpscCEhT5a8F6lKo09mWOBZvem0ZInXEbCL/7skCUUCfumfONQoClTJ7++9Az+9hLhGYMBJm50tHOt2RtxrB6U4/8B5Hx3Y+f9rR3xLPfSatd2gDBKoxpwXvQ03Ysgi6oIeOUiX33I9P/1kKFmVQZEvCv28=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777999735; c=relaxed/simple;
	bh=d98SqBeHlm6APQv2036REhjjgVUogsrSyF9zRif1hm8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LsOa4uKvGJULir8HUg2tYoxkZ5JT7XrYEjFhlI3zdVJswobZkq2TCkHY4q3OruXg9qebq2qvH4Rb548FPMz4FwP8/TjhUDtnMzzAZ9HVcPkGT7wccBUzW8bCBZrxYhiVBQI0KpxjfPEpvQA1QLFhcQ5Vu1gLQTlk/AKA6JEIpFo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=dtAkuK/d; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=zwbMIfo/; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="dtAkuK/d";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="zwbMIfo/"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6456Tep71903558;
	Tue, 5 May 2026 11:48:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=B8cNaY7dwfBfVefssI1ffOOOBKgwfIbALDcuUfV2WwM=; b=
	dtAkuK/dqfko5OUaFzwflY4ylGun7OCAJtGV+2vdL6A7PCnMnlplTTjx/y/sgg82
	wBwQuLCdN6GNkOPrgZhVTs5MEN8qeEjLdEYs9RX+jJ9RQ9+JYsPt+BsZwDtukrMP
	4V1qFTTqXG9uihGiNd/OJXFWFVZwZPQdtdBV4qxnxYoGmY95OFvd4sbnbvBmFO54
	c51thCnAV1MNgf+e9v1PMe+kae96m+L42vKxzCkp8fPxZiwRiinIfwQVghlZVSJW
	wz4VvEuOTtQakGRNxFkT9UhWMX626iiLYNHE6P9tKWrnswS0fK15sxQ52Gc344ku
	rAxZKeadO2ORkGO1U0JSyA==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022137.outbound.protection.outlook.com [40.107.200.137])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4dwep0uvpp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 05 May 2026 11:48:20 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X54mg8R2hDm5IvY4TlXxtctj93kBhWBigm99DHJ9l4V4045egrRvxdr6QmGloLIjDuU5c+7Bfq1TtpS7/Asz6Ekae9/DZNPCrP65ekuUBqpPV06i9fBTHwXbgabJFYd1Lg1nbBuNeivgh76VIldroR5oBXs6IjDGSnEPwKuZfE1JVRPYdDmYXurMcZdXOYZVLK0FBFs8iq3uYzvn6hvANv+w2zR5jGHbA94eoJMxdnxB37JJ9u0QcJnm9Gf1P2ny0V+dKHjGpbhOSH+0PEv6llQSEgMLdXfPhjh4ZU5oTSFp60N4D7hrWKYSeVY+xecuZNUzfKtQJERz9Z/9tai6og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B8cNaY7dwfBfVefssI1ffOOOBKgwfIbALDcuUfV2WwM=;
 b=v6UBLpA8hRrQ5EERfezzqG+SATE+Lg8LjafMPV8sejE1yiUIW5BEGmXTPzECcoND9BL1ZzwSDEd5W9cwNDh6Q2x9/ICOiFOkm5jMB+pEokNDT0svGNWsWJUWdrh0QRNsbNzAsmns8/7zT3bhX43Zc+XlLyOKZUyB200eWQaYb1pT8T84YhW3khGSR5cy4Cmwipns4Mk0FEabdWUFuCMkaWjO5BsaWapchQKKFPBVrocbSWxyXcZ/JYDjCkGu9IjCGC31vfJrlAtHpRuv85heSRGv60iYw5lhuiBDEjFv7ArGZm01IRbtLHNyT8lKA3N9DS5KV5UnVPxjvFVqlXAnPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B8cNaY7dwfBfVefssI1ffOOOBKgwfIbALDcuUfV2WwM=;
 b=zwbMIfo/oCdBHMK7H2iIMaKdfLir/Jgq2MMw7OG3+RCWH5BY0nO3GhxxZj3GDVmFYXGdZ9303G1on8Y39OogBC2+enxWm/c0om8m85QyO0dQNb4K6Ud8vkTwegtt0bAonYetudMRiVDLdKTb1iWIQ46c6ZUkol7zSnX1GhfGKdQ=
Received: from DS7PR03CA0131.namprd03.prod.outlook.com (2603:10b6:5:3b4::16)
 by PH7PR19MB6849.namprd19.prod.outlook.com (2603:10b6:510:1b8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 16:48:13 +0000
Received: from DS3PEPF0000C37E.namprd04.prod.outlook.com
 (2603:10b6:5:3b4:cafe::d5) by DS7PR03CA0131.outlook.office365.com
 (2603:10b6:5:3b4::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Tue,
 5 May 2026 16:48:13 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS3PEPF0000C37E.mail.protection.outlook.com (10.167.23.8) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9 via
 Frontend Transport; Tue, 5 May 2026 16:48:12 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 392A7406558;
	Tue,  5 May 2026 16:48:11 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id ED35E822542;
	Tue,  5 May 2026 16:48:10 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        shenghao-ding@ti.com, niranjan.hy@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 03/17] ASoC: max98363: Use new SoundWire enumeration helper
Date: Tue,  5 May 2026 17:47:53 +0100
Message-ID: <20260505164807.4108684-4-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37E:EE_|PH7PR19MB6849:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a04c791a-f13b-4ea6-e24b-08deaac618b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|7416014|376014|61400799027|16102099003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Uhv3pAYpoHLKWVGv0eFYhaETkHO7rSofox7Wr2nWDgMo8mG+mP5pogI7wIDaaLd8xSrzZ6J5uc6wg9rntmE0Z74L11T63kKEWXpRAJlu27fSF+imOavnpjM33lqk1/DV5QavFqSjFibwnFmoPap+NeP/EcAuhzpLteuogVjqq2QtpUVc1GW0JDGvNq+mwnPYDRS5FM6EQ2RLt3B37Lyak2YjYxJ7bvElAY6JnsZPrdOHdykJVxiwyOTKe219ame0i3KNCr3OyUuBh763nUbv16P3sA9Wechx6KVyMGiux6c62faYz5pJZHLA+1sJrjmwB4MSZd9CBeEa4QWUQAumkRM9Q/U3OQ2tEAgXTTsJN+7gIBfasq+fwM1sQe1Tbg1/FPFaNnWAM6KvJGG3qWMYdEf7XlKtIiCrvBbqmw86uxDPudIJNvU/6xXPsSCpr9Vwa/C0ycgfgCqcZ8zTXH3yM2O+uXrCYe3P4aQD1Eb/uWF15E63ewKb7EgW2Vm0hvWfdJiX3YniDluXr6azKX8ibqsc1xco3dVUwi4wJUSQL7YtEGdsIzKnx+Z2EV0+PwiIttXPnq4evbPtFOlPdBZg4PP1TkeykjU7iIJFBm4n3dHaYc8b24jBJV+c4gNLn6vpQeHjIVVFOjKFtlMOXUJKHg6FSUHh6uy1uyotR87kETjuIXpCTlAU6LtPx8dMSo+NFx5Id77dUBJHsJIuVuEpXP7NyLKbGZ8wpU70L27vgRU=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(7416014)(376014)(61400799027)(16102099003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FttuC9uAfa/xP9fBjlb45SI/nWPdstMAI+PCb5Ti+eFv73wyhAjWf9oCVq15qIyaPt0N+HiVbpCyVWJUVYM/oHtQO4ikU13BzMqsCsv1FcG+eaUhAzOw8Op5QpRvMF9/8KJJn11bn8VYm2FknwNvU2uDX/0BnWEgUNH4ZAUQRE3chd2EutLPnbe2TCJSEsutug6BqWquwBADnjM9cZOvvtGaU6tg3LCcCkCRHl/Z9yN8kgPWs4YgGOLqQCoWUl0K/zouKkr0mC0+J5VFg9ic9Q+BwJ1GwAd2DU6Y3+G73e2rqROVMZlVhw91hx73wUeG1zElVairwscmVPKrzbyfHX4uvYQlgr8QjGx06svTC5Fp+I9mcAPWag602A8T7sw5zcHhGhdtAdHHNdjyYAALuEIMwun/j/BlWzXAS9ZhSTn9jAU7hbBJw8tO2nBNGwaW
X-Exchange-RoutingPolicyChecked:
	hEo9CW70guTiNbhwpnfwvJsSbRMAG20QCXHIcXrl5iTV3gkeGzCo7nOyCbicDY9WRCy07xxcFlC6SuoQzNSDTbB/ChQBkoHWutmkUIh2KGIVitbUZHPmGoJnCGsXWV9ODoW5V8laQTFsrSVCfhT9QNal0HUchYRgz5F5QQb7h+8BlcQuEwE9esLESlYBL+kn1fjH6/rZ+L/CZqrJjQPYOGYrMXSXC1QBRK7gKGflPw3c7Yhng4kXK6EJ0EWd+hny0PH3DqqZc3ynsEUlawkSzwB98BCdHA7XSgYtT28DejBL5cZf8uATns893/fiaYS1gDd7rwAxVS7dOX7WAMAoWQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 16:48:12.5557
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a04c791a-f13b-4ea6-e24b-08deaac618b8
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS3PEPF0000C37E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB6849
X-Proofpoint-ORIG-GUID: Q5eUYaWMV1XQo-W3HiX53BcvJUK6ySAn
X-Authority-Analysis: v=2.4 cv=fcCdDUQF c=1 sm=1 tr=0 ts=69fa1f54 cx=c_pps
 a=fuE/7uQEd4exF76fV1vK5g==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=_kLIPOSdNJ7StitxxVsA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDE2MyBTYWx0ZWRfX18OkqpcrUI/V
 Phf5OyDWJPjXB2z7zuHbg2Gi1wr3QdkgRPzoBHglAQO6mfm0TAcO4lC3T2lQMDSls4v03pSXsyL
 Fo4jGcWPBqT1pc/TB+xp8g2BAgjZayiHU0n/FKgMRlIdjXr5vGrrwp7Zdu76Kx+PUJHqZb7GUZx
 Migd8RsgwyYbpOVpvSLRTFc7UP/KH9odLGnRvDpoTUZm7WWbzYFnyzGWeDoDeVAZJPnPQe22Cu0
 EAa0vr6QS4vbssCrQ9DfOogmWx13WRq5SpxwvFrQyrAKSvGxtkYCHccc4TAZ+Mxj3h7YAlqGPUw
 RF+JVJGRt/ljqmrh+ueN6CNIDCONNwD/tXu/qI2GhvfMDbxrvgihxsFagaY7KHbGKcbMcijDXnD
 R08gZnPrAOJlfNU1xo0ofnXDFKVFR/XT5V7hkR36PHYSBIXvr7jmGs7RW3c92cF0wSaSOtrFZbd
 D5hR3vb3/HGR/yXwcJg==
X-Proofpoint-GUID: Q5eUYaWMV1XQo-W3HiX53BcvJUK6ySAn
X-Proofpoint-Spam-Reason: safe

Update the driver to use the new core helper that waits for the device
to enumerate on SoundWire and be initialised by the SoundWire core.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/max98363.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/max98363.c b/sound/soc/codecs/max98363.c
index 25af78ab30d5c..099dc5bf6195f 100644
--- a/sound/soc/codecs/max98363.c
+++ b/sound/soc/codecs/max98363.c
@@ -90,24 +90,15 @@ static int max98363_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct max98363_priv *max98363 = dev_get_drvdata(dev);
-	unsigned long time;
+	int ret;
 
 	if (!max98363->first_hw_init)
 		return 0;
 
-	if (!slave->unattach_request)
-		goto regmap_sync;
-
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-					   msecs_to_jiffies(MAX98363_PROBE_TIMEOUT));
-	if (!time) {
-		dev_err(dev, "Initialization not complete, timed out\n");
-		return -ETIMEDOUT;
-	}
-
-regmap_sync:
+	ret = sdw_slave_wait_for_init(slave, MAX98363_PROBE_TIMEOUT);
+	if (ret)
+		return ret;
 
-	slave->unattach_request = 0;
 	regcache_cache_only(max98363->regmap, false);
 	regcache_sync(max98363->regmap);
 
-- 
2.47.3

