Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43132494A1A;
	Tue,  5 May 2026 16:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777999750; cv=fail; b=m70ilCUilwxoKwQ0CsvK/aBEYzFwbAj0QbFV3XbviKvjfV5kpOZwZBWfy23ohLIdWFOu58+v4jgb4EUzhLhqXEeRa/VXVoTfl+kjP4KlakQa0Ai+mSvgJZmPoFsqvzqPZ4vcXM0LxkBNRw4JMYMWlfQh8Qp/j3PjrqptrUB0Ghk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777999750; c=relaxed/simple;
	bh=YS0aFLyva2alRQQnJFqkqPqBHsla1lrN7NBWkU0RhoU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MjS8rY/lGiTrcV6QZMyM0RXeVkzcwjf4UzSkBQimnFG8NCZf4IIvcKNhuWHS+5hAO2LNPPI7vDb2y5//12TJud2AzaZpIfpwUusQlg9c0Ty1ek7Pmobng7AmDZt+DBCyfm51bDr7JEUfMoRRmWPhZf2707jxAgCjL/BpCMmgLk8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Erl37VJk; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=oSxbZq7I; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Erl37VJk";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="oSxbZq7I"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6454H2UJ472333;
	Tue, 5 May 2026 11:48:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=+smGuch/TDfBoSv8Pp8rB+zYap2lykowFei0NjvaYvg=; b=
	Erl37VJkARkcOg5m9Gpay8tweUL3AGGPNur5rLzZsF3s/kyemMFF3do/e3FyKLED
	QorxtHbSvdMX5ur76WLuwyLeCofbrrzl93imJGSrDBwJiahokqAAjgCqFF83gU8h
	hTsz/E6JAhCW6R+/3tATSryWB++Mr6KGd3LLq1ptgo0ZAKSJAyjDMnh9Ja+YJuzR
	gnPhH+z9Nit50IUfj12HsBqYUfNoLcPcHEzvclwXoxtfAE+pIPkqjh3WW1tk7XMz
	r9vyYyfK0KuYUH8hMvc6qY0r/bweu0tqVj4JLvMZackWFMVFaL8J1T8fiq2y63A0
	nYiiWPoO/QkkD76LlDBbGw==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021116.outbound.protection.outlook.com [52.101.57.116])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4dwdpk45vf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 05 May 2026 11:48:23 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nHZxO2Tm+iz+43PT5zBaDc88EIAU5Kea9HV49oqfLLR0nop9HEwULYJeK6WjZqlEVX3CSnFXQTXOT6yZ3KdLomOPYDt2Z94kCBooyCL/jGaWPy0IwlUnl4uFdelcChVTEXYfXDhsMSydqAz0us6coMkZG5/GcAXjVvqCz43CFvzkcY7VUax/et59bwq0AwFB+CZzW9Ys95sadw3FYSbTZ12rigW/IQd3mUBkKz2fzIiBK8jhalDf11xcmR5CeDsIpbaN3Ao/YMC5lEHpvPPn4V6CKgld6Kua/hPW4AQNYuUtGsT4msSIr2bqDUbISg7YlLucIBnuK8saHLlKiyQkZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+smGuch/TDfBoSv8Pp8rB+zYap2lykowFei0NjvaYvg=;
 b=Pww/brLYa38HuTTYB3qAxN2fvUghFGCwM2qogEqE4BO2eOU1xVotQEXRu9FXW/tRxDv4u8nBujV5Wf9yHc0qLnuwkMjl+gCCO7idEFL+cZL1zj7LXOt5x1LFDLC3OcZp5zTF7jasqcgiRXrYd4XRMHZaCgva7NhtnyUzlDxC6+ZFfSOtl/y1lfTuLB+kYxurEHplBdE7NBeNqQaasTzvHLt/e5+pggMbpMNIUf5pHtDYcSgHmfWdP7ve6kcHhIY2pcVRyJW0wotlNBqerPKbZF/119i3xBMId9yZsIilexX5BmPQDNAg4zn4okliP9najN4N2AB0BcuvJMx0Un0evA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+smGuch/TDfBoSv8Pp8rB+zYap2lykowFei0NjvaYvg=;
 b=oSxbZq7IfP+oGLh3ImX70TamhUZ2GJMcxPjNrb0u2cMRFdLSnJFgIrIH4Tjf+lOK4GRFaBDK0H25JJnuEGxhjE4JUqU/0Utc85c+oBA2MLhYq/aj8fniJaN5GEwzW2bWYTCpMV/+41ndr6AeMDNt1k7hIIzlWS4s0zDptKtZ4JU=
Received: from CH2PR12CA0016.namprd12.prod.outlook.com (2603:10b6:610:57::26)
 by PH3PPFB16E4B5EB.namprd19.prod.outlook.com (2603:10b6:518:1::c46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Tue, 5 May
 2026 16:48:16 +0000
Received: from DS3PEPF0000C381.namprd04.prod.outlook.com
 (2603:10b6:610:57:cafe::85) by CH2PR12CA0016.outlook.office365.com
 (2603:10b6:610:57::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.27 via Frontend Transport; Tue,
 5 May 2026 16:48:15 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS3PEPF0000C381.mail.protection.outlook.com (10.167.23.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Tue, 5 May 2026 16:48:15 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 530CE406566;
	Tue,  5 May 2026 16:48:11 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 203AF822552;
	Tue,  5 May 2026 16:48:11 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        shenghao-ding@ti.com, niranjan.hy@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 14/17] ASoC: rt1318: Use new SoundWire enumeration helper
Date: Tue,  5 May 2026 17:48:04 +0100
Message-ID: <20260505164807.4108684-15-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C381:EE_|PH3PPFB16E4B5EB:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4c3e2cf0-dcd0-410e-b592-08deaac61a3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|7416014|61400799027|16102099003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	6mp4oPF3lu9g4MjteoYccecd7FaCyWygWUpI1k9m6zu54ri2l3j6zTu8VY3kY2NfCo4U0fugR3xx2KipQQCAUKJjsNc75XiQBzTwjCDd6YvQYY14QbQm8blI3fuouyOu30/oX9OfhMQJ9zkOESX4JuJCe3+lSNy2liyqH6ld6vvZy9T+SoaWu40dur3+kgQILxhQT9MaihLIzpZyhdRvizyCeHSwWav1mjYBw5pga2AZeQ3B2tFY/KeLD6p2sot+hhMjZV1BaswJcttkYKttQGR2JEHFcuidf5KNbU1yzYSGDRTWx7oDsmsgjgsKcvRpUXcXCgx7nxS8v5ckJm37LCWiSFZUhWarowfXsGXkrJqarGr1e8yjYr4Po0Ti5G9R/jb9t3fkwxTbcMCNH32LaqEIs20jH5AvCoXdqJxZA3SRJdYGP8eYLJ0c004/h8otTn5FY3f9chLoT5+OkHquot3x0bWDcFZYhxwAtYY9rvE4THzpdr+Pk0wccQqLfvLkkFFEPQWiFaY8lIJViWCC5Kz/kdNfRTx3zsDVJd+P5ALQ6YRZEfB5Qk+7r3VcDJmnAXUiP/BNReJyXuaAko5FqCdbfCnlJUlIqxlKG5eKhOfCBNiS/4AizIrNARi4gMqIWXKvhAiIQFOknf3SPJxCZduwN74mw1VLpiLE62/dx0oSc/jBfbjpb3nXopIMfZbjAwF/qyKw2qnCAxX49UUmDl9smf6JZ3/8M4vy9RhDSiY=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(7416014)(61400799027)(16102099003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	H2r+/HVxYwa2GZIfMiNCOeqZG4lXAOKJThIa6XjrMUSU+AmfpVdtyIImA/JciRkeRJ2yiGURPBKCQ4n9S01CP2vikvUMqqdZv1+C3HhxeEI6SpZpMzEZBk/G542kvhmy2YQEgfFwTJiPeNdC1d7hgfbrAG/E/byUWoozs/6Ax98/xuxr0k2On0KUlJdxM+ENj/pg3xYIp340TNIDjHdIsV1lZVmqhosLb/IN8jEofUGbroW5W1keKC80kUM2x5ejHQPvchirEB2sxSCpbqraq4bref0onNR1IFFzAifX7BTdn+/K2Z+Rnktwq7Yk5hxkra7CnReDKi5x3KIITBNbq6GOt7ZUJztJcA5mizvkFoN57lL4pZsHQDriJd579vOzwR74NJ+CErs+TqY+Dt8RYqTL+nkD+5tjDYoyDutEQ4cLpbGe1nD+PvWQ6XFNlDPa
X-Exchange-RoutingPolicyChecked:
	D4VYsXTM89pfN4OVkwsiRFoeV5QV1bTgv1x38gB+JM3QAI86D4gOUQ/tL4OpvvK4IzaRqCteY6NYb+e794G5DiTMZbeVjc1pqoQ5W2PMM7JFMPHe/C/rN3yJpfzdzw9NCXUg3RsyCGC7Mi8KgFkvx89gY+jbbaWTENIjmsUUf3tkdlnXM7HlvkdTlhScf2Ffjk0Tm87VTZPnqHPWWJnzZrIyeEoBT0KFnUiweaT9xEUGIjWBz3jnsP1I5dKf513d3Sug8Z/+xu+Fqg9zS+3T8/s4th9xpcbYNDNKTIDY7b/EewgFfLg4WnUG5UwdA3PNdEo2f8KyZbg7kV9ykApU4Q==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 16:48:15.1127
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c3e2cf0-dcd0-410e-b592-08deaac61a3d
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS3PEPF0000C381.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFB16E4B5EB
X-Proofpoint-GUID: 0KGTJWgZdYxcVGht9_9VJYCwLZH3nviN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDE2MyBTYWx0ZWRfX/fEpfRt2K/yV
 i8fFayuz5HTQd0c0iRl80wcdhlWG/rhc2jkO2cecDMKLrULqyVF99k1WbFCWIQCrXSVoZAVjbbS
 04G4Or0fMO/TESktv6oQH2TCcECG9IuUreDSmCs4seLIcKXvqnsv3yO1Rt3f1i0hqOUdRiLdlrg
 SVTeKXox2rj3Evpphekqa8U1J/+SLe4W1b0XfWZJkV6BFwS1lyg/oeHWWEf2pRGLCJiiNA4iT1H
 A7nchtbPEMp8Q+cajYS+dcWkW1gT5+yqrc79XPNghWWT6/z2x2vhscJXlVqAgQJ7pBI0QQat2oh
 wKD8BXg+NUOoXmfscGYo981nUWTViMYSpzIJ0hEB+C9mjUV7oYLRJA75QFruG+zKwSUGBp59geH
 +03eimcZE63rXzj3ZvCm/rrZFkEB4ppKL7gMx3iXZQfHM4HWu5TMBjyK+iQoMIxhfN2LjoP2lI4
 W+nt1g1eKEbBueVcLhQ==
X-Proofpoint-ORIG-GUID: 0KGTJWgZdYxcVGht9_9VJYCwLZH3nviN
X-Authority-Analysis: v=2.4 cv=LZcMLDfi c=1 sm=1 tr=0 ts=69fa1f57 cx=c_pps
 a=VPmHu6eXMPg+68oZcjUWEA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=_kLIPOSdNJ7StitxxVsA:9
X-Proofpoint-Spam-Reason: safe

Update the driver to use the new core helper that waits for the device
to enumerate on SoundWire and be initialised by the SoundWire core.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/rt1318-sdw.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/rt1318-sdw.c b/sound/soc/codecs/rt1318-sdw.c
index d28f1afe68f18..51bd11b92a554 100644
--- a/sound/soc/codecs/rt1318-sdw.c
+++ b/sound/soc/codecs/rt1318-sdw.c
@@ -821,23 +821,15 @@ static int rt1318_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt1318_sdw_priv *rt1318 = dev_get_drvdata(dev);
-	unsigned long time;
+	int ret;
 
 	if (!rt1318->first_hw_init)
 		return 0;
 
-	if (!slave->unattach_request)
-		goto regmap_sync;
-
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-				msecs_to_jiffies(RT1318_PROBE_TIMEOUT));
-	if (!time) {
-		dev_err(&slave->dev, "%s: Initialization not complete, timed out\n", __func__);
-		return -ETIMEDOUT;
-	}
+	ret = sdw_slave_wait_for_init(slave, RT1318_PROBE_TIMEOUT);
+	if (ret)
+		return ret;
 
-regmap_sync:
-	slave->unattach_request = 0;
 	regcache_cache_only(rt1318->regmap, false);
 	regcache_sync(rt1318->regmap);
 
-- 
2.47.3

