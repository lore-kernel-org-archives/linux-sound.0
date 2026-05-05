Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8514494A08;
	Tue,  5 May 2026 16:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777999745; cv=fail; b=hPlfxAsfzL++y8puVmKjgWRVyzi2lKInSiE6Xmq4w6oYmZFp5tDgujZwhxzer6HGOgvUGUsB+PdKUtBU6pneUoji0f52lIbdedGsmxQK8iU0+C5QIuSsgzF1rNGzbCrDFYwZS3mO6oCJ6xl5eeclB6Vh2R8CADv2lRRF/4kHPfQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777999745; c=relaxed/simple;
	bh=3mtmRnbYLtP0oBCZIrfPDxPrHIaap66JTT2NLOIonLI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j3vVUXgAqV7SPCJRfiR/O7sh0S47hIu0+e4NB19FrJT1s5/mWlLFhRtif2RIPsivZnYea3rJHeAwfRaZ74OLuMGIj4uLvWk6Mq6uDMwj/2m65vMRJ0/pmZbuyE5tIvggUge3SBW7bVOvTgCYGtjV4nh2IozPv6q1Oi2ZhKch8oM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ic29nwJc; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=alRGTFYd; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ic29nwJc";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="alRGTFYd"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6454tvQC535461;
	Tue, 5 May 2026 11:48:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=iCIXQDcMHXL44Lddcj0u6NsmCDjO5qZ8K0S9pkRQj5Y=; b=
	ic29nwJcfkZ57alVMMrqdbNmeRbqOjULI9ZV54ptMz4ecSvowWKVNf8tLnBdWRjq
	aV4OGvJG6bCUwT3huoaqMKYeSrsoKktaE62xiWA7+ReIrZLBRe8n/nwSGnSDJfe0
	7SgZyVnJ7PQJ3z7znFi0z74Poe/Oz0TEhWUFcZK5N85wV7GwChRnkcQH/Kcl72Cr
	0/XyEqT+dyMXvnE+G4r26HxWZtSNjtY2Sa/4wxXiRsTEuDmrytK9BlkvLW3e79Kb
	+j0/2fzre2ibFINF2ynacvyTkgHfDEWJmBFnxsB+SojmcnK4SOXqRkfRCucFK9fW
	EdG5oogDkuoPlFGTMEBC/A==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020124.outbound.protection.outlook.com [52.101.201.124])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4dwdpk45uv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 05 May 2026 11:48:18 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jIRXtn+ri5ae4Z0TgNLMzraQoWAfTjunO9Vzf13CztcU21IM6WGsEDiGy30H+fSAnaGOy2MZAhy1ZSp6tc1lyKceT5c8j7urvUzTo/FZJiCxBFqd068jnDQpLr/O1K+K6TaGSuY95+O4yrK/IKBGWKwGlDQkOkbqsDCSEh1MmsQ0qIzBttH9NacqrbjehdVpfw/HMtlPO9+jCnEpnRb/cyVuhmlVro2S0RJtin5thNlo6BqUugNHZPABaQA/SPEh5+TZe5O6hLcV/4fQZzwm66WPF2ihTFdaDqyYm8rAOJXiKqLnyQ8CrdonQF4HYCwT8jNsh+U+K7WlryHTXl4RwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iCIXQDcMHXL44Lddcj0u6NsmCDjO5qZ8K0S9pkRQj5Y=;
 b=FWlyHdwYF9yry70Y4cWrnlOH09qQIq/+Au0oFptXW79bGjNpJBr27PZ5QZV9ft/s14bLhwVy1hmLl6h09vPqfwugQNBqAGYUBqQBZhD2gpByBxeTYcQ95v30aQQ/Js9DwvmpIsdPjLX3nrpop79V8KUzPsp3nHjU9gr+9gJaFSjU4wofeVTBzPuf4xxqd8h/IgcVxlugz6/sjYd8BFITjxYyDgrhvNl4Ueug8dAK/4F9MwqALzCWFTOM4QtZrCHpCdwcU9nL9rBMxr0pTQhClKbUVqHM+2jFwCEyM3RHjBwkxf4tFGRthvI2YIfoL/am1rA6wxAedxoeT9Wc2i1EQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iCIXQDcMHXL44Lddcj0u6NsmCDjO5qZ8K0S9pkRQj5Y=;
 b=alRGTFYdwBjhx3QBrlTzaX9cbMtpVoyeyVUNtldQPT9LxsTlOc/JgVZnkK1g5s6+2uD/lEch9jFNKEIc2AUkNFVQNZmuqwIPJdwYxLHdz8Sz0og6Mnyx79umjBgiMbngs+N+nIuNIvTBNwGnYHAyZPRnI4++KDpj/aA8uS2ML5k=
Received: from DM6PR02CA0081.namprd02.prod.outlook.com (2603:10b6:5:1f4::22)
 by LV5PR19MB9083.namprd19.prod.outlook.com (2603:10b6:408:303::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Tue, 5 May
 2026 16:48:15 +0000
Received: from DS1PEPF00017093.namprd03.prod.outlook.com
 (2603:10b6:5:1f4:cafe::79) by DM6PR02CA0081.outlook.office365.com
 (2603:10b6:5:1f4::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.27 via Frontend Transport; Tue,
 5 May 2026 16:48:15 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS1PEPF00017093.mail.protection.outlook.com (10.167.17.136) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Tue, 5 May 2026 16:48:14 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4543F40655D;
	Tue,  5 May 2026 16:48:11 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 08F15822549;
	Tue,  5 May 2026 16:48:11 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        shenghao-ding@ti.com, niranjan.hy@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 08/17] ASoC: rt715: Use new SoundWire enumeration helper
Date: Tue,  5 May 2026 17:47:58 +0100
Message-ID: <20260505164807.4108684-9-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017093:EE_|LV5PR19MB9083:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f78ec02c-b0b5-488a-be17-08deaac619b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|7416014|376014|36860700016|82310400026|16102099003|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	u/e15aUUF0BQOH8t/PsRtFSg9ykT7EMxu3Ble5ujJIUrn2WkaDjh3HFcAoEk5sipUSkYzI5ibGMiyh8vgDHQNrfPdEtF8vojunmcODALHlfRaaanNKiZ3eUHjKYnz6N7r7/uJXwqP56dHwqD3fYl7bIlK6SdIR6gj//otUFePHGJ3AuEtvd0B5U50HYiBzIsA9/WhUqoBKsxMdlVnKVhvQbsMd9ffgh/zm0gFeEN4o82Z4dDa7cuhFrm8lWR7h9gjXK0gc3rJl15LYHBfm+AQlg/jWS7I8eJIQyoG5xW9ZBEIjhmn9fmagW7jDjV15r5XxNvnUKgU2DUgBs1YKkaqMvcAeqXAqSc3Qdpsfc0rE07L6oj9i7DL2UUZEekWX4cyGQ9vCSZV28+6OvN255yOCznhP2bycAPOKIjfwEnkWi1mUTbKOtaOZH0/zPB7paVRsRuIu1p7zUCZBzU/2tRrB289Z5GEzDpfV+NlYiuOGuHtuhHxog4sgybQHNJZU0rMZ35vtKYXH9q8IyjHxhsfBCexYfIJoNbNSbiSoDTJ2gDT4s5g+C4B5wIIrspX0OeleGwPeAOzB9Xa8kaEF/VwU9xf1gfrxFy/N248k7qa7w1oSSLIipmMM+rnWK8ZIpgMj5ja+EpNwj5j62AW+gzLeGYGZqrAfJr58Y3kRrtspPE/fcIuUSu5DP0j5XS+dMiJbO7+PdWIUVyodzicO0rOqz3Ff/k9q3jXhwOfGlW5r8=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(7416014)(376014)(36860700016)(82310400026)(16102099003)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CkhOJw+MDCJoUm7xxIjBESjlcUNzaJNOw0mb4Z5vzC4ddzNGwE1C+la7JgMy1K0EsU5PUyU8C3SbjXl1waOxx3PPisGzrC8beNy0Imw1FF3ETThaQUBH60es8/RdblU8fWW9V32Ikt0tr4mfewrz2f3/ckdybtOeTCXCFkSDNsvqddG44uo5af3/DCpcbo9sGRszhHP1zGhq1lOF4ug4amFzIM5tCLe78xylC+O+qzLZycjowKSKX9ACGHBlqKiZsVJqXHwdr0g4QTIoJh0f+WGDpZMT8wF/vVYz8yagbyf80jozGyxnWVf6PvBt3NJlyXa75ICMLGcSao9n0J6V59TCTa5IDILC796scGN/Q6Oa7f8Cw+pErS4qt5kSFRlqpW04CLBoSgP50ZgI+rQLj+RVARZtm3nz+WvxCa/+FXU0PwOXDE3P1chRFMjm83iy
X-Exchange-RoutingPolicyChecked:
	jWguupO3B81O+BGZPovV2UbUxyJ3Ub0/duE27izsxvNu91vTqrq+T+n54hair+AJkKlMlacv+seCGsToNhWFovnOBN0X8lJ4QwNwOahqzeRZv6mj+VJ+g+LEUw/Haqt3Zuupl5IsTVgwKh1gLI+1LNsWTNYjEec12FffYfs7zqeAKiTkWUWyV//0hTygxS09rocT52K3gxIckQEX90Zu5Fu+n9SCwB2gCXCExoasO/gqUa65eUGm0dhNoiVFcRW6CjugsxCRAeoZi6SG0hhpTHNcNAvzGWchOIKiR8tcz8h+hGVPt6SKQqdMN39E7MdhMtd/FSDclsj+p1c9J+xm6g==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 16:48:14.2143
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f78ec02c-b0b5-488a-be17-08deaac619b4
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS1PEPF00017093.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR19MB9083
X-Proofpoint-GUID: Q6EwCGVh_l6nh6Nm5XGfhQIYyL6OM6WM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDE2MyBTYWx0ZWRfX7BPGvr23eKrr
 VW1XyRkQM6lhAZvCBdG0UzSIJ6rq/fQf/a3n0fkCbgg/Vg37UHjGI5wDlz7ElcnU8Gy5LejDeaO
 EGd3EXXJcpEEaspMrc0O/0tE6f4f4wPfbSQBrSMzh0uTv6njT89mxjAq5HmNi3gJ6ij4RKOlpnw
 5Tav+MyBor0g1P5H4FQZam+stbuldVyoN1QVO9t8VJ61HyiffQbi+8e9qEF880hvHyea8T+VR4L
 nWtjBfAVAXRlYTgN7DFOogT/UrpNHgDZPaef5jGUD/ZTz7USgqwtYBGrvKfpaHe9hwdK0GV7DcB
 6uIMq+x2L3DjZtS36bmLrNHaQKcL1P2eTaHuWnOkR3+qHvPj5YptuJbTl/HPr7742OozZf6SP+9
 lr16pofFzOZ9B6GM5fa9MqjhCpUnj5WvcYVX/OXZ48mkdCoUsRpFfevOLZWEgWxY/2koMAQFuSw
 ptS0OcenWJ5ZPLwnzfg==
X-Proofpoint-ORIG-GUID: Q6EwCGVh_l6nh6Nm5XGfhQIYyL6OM6WM
X-Authority-Analysis: v=2.4 cv=LZcMLDfi c=1 sm=1 tr=0 ts=69fa1f52 cx=c_pps
 a=vXaAVha9trvDieRJfPSLuA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=RuJZr_uWk9hIvXmwfU8A:9
X-Proofpoint-Spam-Reason: safe

Update the driver to use the new core helper that waits for the device
to enumerate on SoundWire and be initialised by the SoundWire core.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/rt715-sdca-sdw.c | 18 ++++--------------
 sound/soc/codecs/rt715-sdw.c      | 18 ++++--------------
 2 files changed, 8 insertions(+), 28 deletions(-)

diff --git a/sound/soc/codecs/rt715-sdca-sdw.c b/sound/soc/codecs/rt715-sdca-sdw.c
index 968bc183b8d8c..4b9815b5628db 100644
--- a/sound/soc/codecs/rt715-sdca-sdw.c
+++ b/sound/soc/codecs/rt715-sdca-sdw.c
@@ -224,25 +224,15 @@ static int rt715_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt715_sdca_priv *rt715 = dev_get_drvdata(dev);
-	unsigned long time;
+	int ret;
 
 	if (!rt715->first_hw_init)
 		return 0;
 
-	if (!slave->unattach_request)
-		goto regmap_sync;
+	ret = sdw_slave_wait_for_init(slave, RT715_PROBE_TIMEOUT);
+	if (ret)
+		return ret;
 
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-					   msecs_to_jiffies(RT715_PROBE_TIMEOUT));
-	if (!time) {
-		dev_err(&slave->dev, "%s: Initialization not complete, timed out\n", __func__);
-		sdw_show_ping_status(slave->bus, true);
-
-		return -ETIMEDOUT;
-	}
-
-regmap_sync:
-	slave->unattach_request = 0;
 	regcache_cache_only(rt715->regmap, false);
 	regcache_sync_region(rt715->regmap,
 		SDW_SDCA_CTL(FUN_JACK_CODEC, RT715_SDCA_ST_EN, RT715_SDCA_ST_CTRL,
diff --git a/sound/soc/codecs/rt715-sdw.c b/sound/soc/codecs/rt715-sdw.c
index 49c91d015be4d..7f83a8f1a06e9 100644
--- a/sound/soc/codecs/rt715-sdw.c
+++ b/sound/soc/codecs/rt715-sdw.c
@@ -501,25 +501,15 @@ static int rt715_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt715_priv *rt715 = dev_get_drvdata(dev);
-	unsigned long time;
+	int ret;
 
 	if (!rt715->first_hw_init)
 		return 0;
 
-	if (!slave->unattach_request)
-		goto regmap_sync;
-
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-					   msecs_to_jiffies(RT715_PROBE_TIMEOUT));
-	if (!time) {
-		dev_err(&slave->dev, "%s: Initialization not complete, timed out\n", __func__);
-		sdw_show_ping_status(slave->bus, true);
-
-		return -ETIMEDOUT;
-	}
+	ret = sdw_slave_wait_for_init(slave, RT715_PROBE_TIMEOUT);
+	if (ret)
+		return ret;
 
-regmap_sync:
-	slave->unattach_request = 0;
 	regcache_cache_only(rt715->regmap, false);
 	regcache_sync_region(rt715->regmap, 0x3000, 0x8fff);
 	regcache_sync_region(rt715->regmap, 0x752039, 0x752039);
-- 
2.47.3

