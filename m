Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF1C38CFE5;
	Tue,  5 May 2026 16:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777999730; cv=fail; b=HhdjhQGGBQG5tv+F8gbplEdhVUrOGSQmQXjlWelnyjtnNzyMBka5w+l7y0SRvbom0gBTLpHd3XK3quuMwqaYZCJouQegKnr2fZY87ZAgCzac/W26rH73T2hQ0B9jeAFZwfG7JHJCtjf1TG2SBgcZcVCwTEPtt4bsx1ujuHdUJAs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777999730; c=relaxed/simple;
	bh=Js/fd70ubu8XR/7T+/wGC0rwCUY3AXZjHgYFy3C3Clw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qCy8AK7R+mtLagaW5pJb8RVDhSbavm3knxAdAWLlvlRx2Wk22RDRuB+zGD7gp7DSO6ouAFGr98mGMAWm1oXadqwt8B5t6f+ZKAw3RN2RWL0qqigq3EbYhV1WMRLJmtSDTebFlASN4EcH23bjwJ0Lt00PyGLkSZoXZA6gYEGlEn4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=DFC3kTKp; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=JzraaZFV; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="DFC3kTKp";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="JzraaZFV"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6456Tep81903558;
	Tue, 5 May 2026 11:48:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=RFxyL+85MxteDQXZxQI8qszhDAD5wzVIeG8AmZrGpWs=; b=
	DFC3kTKpF16prg204VJT7wHON31b1v9+2HC6GL4SGpNlDpkqhb78t5Rkd5PJw7Cy
	K7WSgoIYkaDStFsmRlGf8iiG6YNVluQj9SuJtm2oDnxKmvpFjz9hr0Rv7WugwnTZ
	Hg5F1hH0xcJBA0QSEn86VL/iNn3Vwx4x1GUViHTCAlZlVyrTCUrFKjimsCC4rKku
	f3itXnxx/HdoCaQSoukhTtTsT+QeM0cyXZTaWrNOKHO0BiBoDlmm0g3ERaqb23q9
	X71JaTil+W7kMrbTF2aBREnygSAniYc0BR7aDY0gk5BI4GJdGRZ27XrYIF1E7s5b
	q5apeN5D5S+7/0zP40fhHw==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022098.outbound.protection.outlook.com [52.101.43.98])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4dwep0uvpv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 05 May 2026 11:48:22 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=htIZasDswoLsNU4TeW59PDZLUzzdlhZw01fGLcpadyjoymptL7zB41cOaiBEGNkLkwB7ecc76hU1SICEHsUbchKOAarImqNmYsMtvRDPl7KQZyg/EY3MbTkMtYma8RD9Vm67LW2+45dBBnUkdXXJ++/YQ6+EbTjqE2mkSy/PmkDRIl7gy2j8cwjBldU3r/RmfEXXA76B8+qItvplmkqLnUfiTup0gBNoaDTAo79LcL6Yg7WNSqs3Qa6G4jgBfT+Xww3QxejPaDPGs/8irxle5QOtdDLvNAng4GaQmBlxxo7EJGZUsMdiBd+m6Co2qmpoGl51VjR7X3EPIyEj7+uVTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RFxyL+85MxteDQXZxQI8qszhDAD5wzVIeG8AmZrGpWs=;
 b=cAt4T2UHNYjoO6rpgyuyd3RTI3VcSuHICKontQ64hfty6uc0YIlYm/QQBLfznSMkhffNAe1OyqxuMFdVaNLoLHxRseM2GXV6A8OFP3AzwW/83YvwwmwbxvrVr67chkSYJVjIyZMyV9LDTIpjHo4iNijFwj2y1XcwtQPmJz72EkgPLofpulmADk7TSTLgUDWwPajp0qbN5QsZKLy1XHvEFhg55VRDPVEmiJZUn4EJBKOBHaZJ6oGEUWjoWR08nYKPtjjziaHTKvP19b5Fc748QnSd+oIUwujxUpnGIU68LC+xeKUWB2d8R2Y7LUn/faDoNQq89JyDh4+U6yoA5Lmr8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RFxyL+85MxteDQXZxQI8qszhDAD5wzVIeG8AmZrGpWs=;
 b=JzraaZFVHRR7Gw+v2sLwOf9J6aecE0h+BInMPOSdRKscqvs5mux0dsCcLIGmsFXtVwo8kvEa1nQIdnQ0GJFgSqFPJq9bOQpSR5+Lm1ClEd5KHDkyZ2D0zkYOI3fRp1RfL7gXJjryw0JrjRv/t+6TvqhBKFroniv4Pj+Rmycmaa0=
Received: from BN9PR03CA0605.namprd03.prod.outlook.com (2603:10b6:408:106::10)
 by BY3PR19MB5188.namprd19.prod.outlook.com (2603:10b6:a03:362::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 16:48:15 +0000
Received: from BL02EPF0001A103.namprd05.prod.outlook.com
 (2603:10b6:408:106:cafe::17) by BN9PR03CA0605.outlook.office365.com
 (2603:10b6:408:106::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.27 via Frontend Transport; Tue,
 5 May 2026 16:48:14 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF0001A103.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Tue, 5 May 2026 16:48:14 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 44B6340655C;
	Tue,  5 May 2026 16:48:11 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 05B8A822548;
	Tue,  5 May 2026 16:48:11 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        shenghao-ding@ti.com, niranjan.hy@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 07/17] ASoC: rt712: Use new SoundWire enumeration helper
Date: Tue,  5 May 2026 17:47:57 +0100
Message-ID: <20260505164807.4108684-8-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A103:EE_|BY3PR19MB5188:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: bbd07279-a792-4623-1181-08deaac61991
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|7416014|376014|61400799027|18002099003|16102099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	0BgRxVEySN56TfwnWyaLGoJlXzkdGKByy3CgfWDL+eGw/efp16oC9M0hsFVPPu0HPaVQKzR+eQ+WW9MDoullc2v5QlDfwvik5huQBJZX3GXY8jmz3KlgU79STDASuX8mfiycvBkHhEogfNrGYRLLgdu6D+WZJeL6yP+uTx41WW3zTBtUkeOcpUseZdnyn3hFng70wB28YGfOLxM5IjhlqoB4huH3PxU2UTRJNJPTtzbbTnPrDRfbva25W3ZoTybkz+btv4Rr0PJdRjfnbR0L7M0DCorUjrFhRbhbUUH+geIclGqxnGm9b51XMPFaHvCgsAirdw/D9GeVdYHeG17LoJE5uLai3ClpSk0MXJ6BjXQcFb0Q1UdijpejtiBM0OyAPO9SuzwGdNmlGk2NMMetpPgYcvYy/n53wBaNLiWqRqZZFtH9xUXd1NDs6rrYMGVL6SStMe2h3ZBzX5M0YqMmFP0A4YBPOu72733Iq/k+bXJmosnEwUCHyZCO8eBcr4ZYpYVuFR28+jZ7QIwFZwyupVwO3X/uY8FoHu3TD686a6+oih2fhgA5BABMTzVLxicE47qLrJkMK/uzi9E5JFy5Qk371U2VfLCZq9zwxaznOx17nHcTq/xdCM8hTKHprrGujtC9v2I0P1Axu4c0Er2wWKT8clC0GPFXT4QbMmUbpTMinCK7cWEQqDYy4y7PqCFIU+w78ez+Rcg+gjs4zjAOhCt4h5hNYJ0ua9ZtjAf3sEA=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(7416014)(376014)(61400799027)(18002099003)(16102099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RMmta+C8gwWaTC6nYSUxI22tXq3N7LAJV8d25tK0KoKGCZfVbKd3JFloUQSCnLtYJYUyD9ndRTgAlSBA/1G+LeDSnOxom4zaseB1ZPbmpOyTMBqMCp8+tMmhofI714NT5Pwak20t+Xcsd3OimO1RFPdYLqoRatVwIlO25yaE7x8pdRYSlneKlL8nXsv2AF/JEBnodXmXfhls/pmBd0mBezavvw8g4IHJ2yNX9Nh3IofS0Tw6MAnvPRDMoK/grori2Q/vA+IfYUhP9dzg9Chya0MGP+TymFj+OEB/s4rd1/kHj9hHKAzTodiAmBCIcyPH6b14Xld/g9QMSta0g9by4kCA9mollEDGSnbIqdbregdFSkETO5tRJ22EVfZSiMIhTDtjPMaO6X7QaQgjJ19N1sHdpPk2IIJR/YiTDrMt5+TYt0Xe30mGP6vSIH/2gHXE
X-Exchange-RoutingPolicyChecked:
	cZx2LNhF5vCxGXHdFI5ef7EhkhyzPoEuQjVSmWRv8uzHqqU3GjxFuYm2LBGjbnbjTLepGbkjJ5c9QGrLyIFLTSMly1OgbyxGaP7PFN0FoHqLCWU5Nd2UHgw6mnuukcolk0qo4kOdf91rrtx7V3OglsVYAohmca5IZpYrad3xYR3/CRUb3desKheV9IzJWXH8qVu/IjjFSkFxc5/ZWd4hRWwAnswhmeR1rpp3QH5GwaXNhCxIDT8p523PzQzO80nOY7MEleqQfZI6KdNtyXLRl9jr0LtVwq82v4PykTpr0Jxhz4tD4r8cWAF6L2NJRW9+FtZgTLuVCCc1rOYjQ/YNOg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 16:48:14.0320
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbd07279-a792-4623-1181-08deaac61991
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL02EPF0001A103.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR19MB5188
X-Proofpoint-ORIG-GUID: FmcZZ-xMs45Rp7KFKQHoOabLBm_fPuil
X-Authority-Analysis: v=2.4 cv=fcCdDUQF c=1 sm=1 tr=0 ts=69fa1f56 cx=c_pps
 a=52G9BLf6iDL1HAe0xuko4Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=RuJZr_uWk9hIvXmwfU8A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDE2MyBTYWx0ZWRfX4iIM/rslIeTR
 69FlDFGhk5R0Lq9CnuvPVxM4JoU85tbBsun2gwrebKtXV8U/Lx8gBNqDjgW/KB6Ba2ASOyxXl3f
 DyzOSA59OCGjngri6y8XJ+TeQXsEPFBW+K9tJNIlFt7GEM3a4yTm/qPrdDi49xy5SVNw39gqgl1
 gjiveotj6Iqv0ZP9E/S+OLOt1oWJ8iK2DK0xCk3lwSXnBdtfiHHVuhkoSggu2JipUeRWVQoENOh
 HSmMojeolD0H3K8jGs6Y+kdTm4sh4LB2MG/gKerOKwJb7NC1RWSQkN5GQNUGoKUPi+2qmxd0mmI
 zG0+MHToflJzpM/xD1sC9KkLmf9ReIzP83MDC7no4BANE4HQ7oTS5Jnj14lm8WLfQugCGgRW4Ge
 cWzwpE9RVAm5CUPbkLob+O8SQLMuC+RRRVtd+gnAqPnHhWHchC4OADQgxFJsIob3s1hRmWhn+cE
 gv/cJ05GK+XOurOc5Jw==
X-Proofpoint-GUID: FmcZZ-xMs45Rp7KFKQHoOabLBm_fPuil
X-Proofpoint-Spam-Reason: safe

Update the driver to use the new core helper that waits for the device
to enumerate on SoundWire and be initialised by the SoundWire core.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/rt712-sdca-dmic.c | 19 ++++---------------
 sound/soc/codecs/rt712-sdca-sdw.c  | 16 ++++------------
 2 files changed, 8 insertions(+), 27 deletions(-)

diff --git a/sound/soc/codecs/rt712-sdca-dmic.c b/sound/soc/codecs/rt712-sdca-dmic.c
index 4d83544ef2049..4c5c2f5ba5edf 100644
--- a/sound/soc/codecs/rt712-sdca-dmic.c
+++ b/sound/soc/codecs/rt712-sdca-dmic.c
@@ -905,26 +905,15 @@ static int rt712_sdca_dmic_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt712_sdca_dmic_priv *rt712 = dev_get_drvdata(dev);
-	unsigned long time;
+	int ret;
 
 	if (!rt712->first_hw_init)
 		return 0;
 
-	if (!slave->unattach_request)
-		goto regmap_sync;
-
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-				msecs_to_jiffies(RT712_PROBE_TIMEOUT));
-	if (!time) {
-		dev_err(&slave->dev, "%s: Initialization not complete, timed out\n",
-			__func__);
-		sdw_show_ping_status(slave->bus, true);
-
-		return -ETIMEDOUT;
-	}
+	ret = sdw_slave_wait_for_init(slave, RT712_PROBE_TIMEOUT);
+	if (ret)
+		return ret;
 
-regmap_sync:
-	slave->unattach_request = 0;
 	regcache_cache_only(rt712->regmap, false);
 	regcache_sync(rt712->regmap);
 	regcache_cache_only(rt712->mbq_regmap, false);
diff --git a/sound/soc/codecs/rt712-sdca-sdw.c b/sound/soc/codecs/rt712-sdca-sdw.c
index 8c82887174db2..5817321804736 100644
--- a/sound/soc/codecs/rt712-sdca-sdw.c
+++ b/sound/soc/codecs/rt712-sdca-sdw.c
@@ -450,7 +450,7 @@ static int rt712_sdca_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt712_sdca_priv *rt712 = dev_get_drvdata(dev);
-	unsigned long time;
+	int ret;
 
 	if (!rt712->first_hw_init)
 		return 0;
@@ -464,20 +464,12 @@ static int rt712_sdca_dev_resume(struct device *dev)
 			rt712->disable_irq = false;
 		}
 		mutex_unlock(&rt712->disable_irq_lock);
-		goto regmap_sync;
 	}
 
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-				msecs_to_jiffies(RT712_PROBE_TIMEOUT));
-	if (!time) {
-		dev_err(&slave->dev, "%s: Initialization not complete, timed out\n", __func__);
-		sdw_show_ping_status(slave->bus, true);
+	ret = sdw_slave_wait_for_init(slave, RT712_PROBE_TIMEOUT);
+	if (ret)
+		return ret;
 
-		return -ETIMEDOUT;
-	}
-
-regmap_sync:
-	slave->unattach_request = 0;
 	regcache_cache_only(rt712->regmap, false);
 	regcache_sync(rt712->regmap);
 	regcache_cache_only(rt712->mbq_regmap, false);
-- 
2.47.3

