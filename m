Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52A1492519;
	Tue,  5 May 2026 16:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777999730; cv=fail; b=R6Px+SOe9wZcZu5RSuGMNVuiTlPXUH9LnDTWkkwM776cOe9yirWN1PRdarn0iVynxryubg++ekRzIpomBBpZ0CFJkLisexvbLpmQjv61H2UVZlBgzrWMKiF33eIPTI3Nh1b4DMNeDpm+OEHuKB/3OCwiBNL9yFjZmVoZPR1yqMw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777999730; c=relaxed/simple;
	bh=U98OvnRmtPrNiPtZehX0NJWkyTVHyZwt8Rp87e4FSso=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WQGgu1kC8YwIuGEc4fUfFs4t9fKsTMdFsmrJxWCXnS60Wwt9q3krXiJWEG8N6ZhvHQxzhhuC0osabwwUpQlFfc0aofI/3jM4rhvg8ptvWG6OH2ggvslwP+NmtHhwnB1doOW2BpeZFQ4c9yBGPp8Q5YFCBQnL3EZA3MCeJZGTwQI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=JiMAOoMT; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=UQm5ECIY; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="JiMAOoMT";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="UQm5ECIY"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6454rf3j1749983;
	Tue, 5 May 2026 11:48:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=ImU9NYINxt+CAKqxpCr2Bgl2dCiK2gzURVkH6Lmf8s0=; b=
	JiMAOoMTjb2P/k/F2wE1kJ4j1QLu/oqSpqzYK2u+CzgsqizXHtd+FWGD6HATjO6O
	d7KGYSeLoszMHivFW2ngm3ziCI6FIMAZ+1cOT2ksHhQhxfjR6OXiiy9rkJw3DRof
	N2Kuv+SshDXAhdgaVziEqFOkxliAqQD8MzURKav51qcV0eMLMIkKZ9RXkq5EpVSn
	QvA+419ug/poad+emrsBM6bw4muJNWDuP+NO5BVTxs8E0dI6OMU3Bmb3DqptbZzp
	Cqu0KXQLOPKBzl9CQvck7a3GKU5tQDMxiAjU44hcQE1Okmyqrmzw/smj1t53oJ1O
	i2LF/SJemi50bDGkcXQt+Q==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020075.outbound.protection.outlook.com [52.101.85.75])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4dwep0uvpx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 05 May 2026 11:48:26 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xAgT/+cyh2wXmdPi1JJk1XEcSTLqFSvffv0zbR9iloPALzdfZ1VIonCAcNSpIVrpxrOGSGWBev+ws1tIJjxNHovZ5KTk8pSwFY3tDmavKK66MJOvQUtNY9ef1N+x+XZPKxfCFczYGsJOiK6PwRHddn+gd2YV2xVZ6O6+3sHq72AJMk33YGuxkgZW8vXuUuQYtKVwaYDLCmqOCpLL4XFTWjpUMlCzGRhHZMzJlmH3BL68EN4OePL3cTmPdYxf8ueKaInaPORXy812hiYQOxMIRDKS9BuhNKB8iOTuYaJZG5OImy8vOboHhUR1MQDuH9NNJhytC+Qg1yGqb2Fx7yvhcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ImU9NYINxt+CAKqxpCr2Bgl2dCiK2gzURVkH6Lmf8s0=;
 b=ojWVJXxnB+o30MC64/wrnyGSoMHNdXhsJ0qOgyUv9fPVDlFZTUYcgixAK+DPcZDBfZ3BFDezFUEDwctAaiRMX1jFmo4YefQOrWGX+kYLlDiTI9o6iKgv0jQybyMv9L1o4MoM7ZX4dtvJSHL4JSDyKw9xp8fejD9B29jCxY7sRGPqCwDEDtJY9eAIEXVO+lCKzJkkkfOQ6LWACMBg1uobrxNu5IsYaHObUqcqT6vwIMO4zGGeSOKw7ZKOPDxidtJlWUcvWY/w3YnE+pWqV9hdmoM06AXF2Mb52A5AJ+8Uab1HbMfALxyET1WfdLqZ0yulmQon85EaY01MrDJzLvI2VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ImU9NYINxt+CAKqxpCr2Bgl2dCiK2gzURVkH6Lmf8s0=;
 b=UQm5ECIYBCcckFd3Pv4oi/kShwdhlAANnId6Tts4v6QYp1Fx9XZyuP9ZfwLhu85PFV0SzJWtlqhFG12m1HSxm+9liuWjTnZZLKgrPCjUp1r6UK108uSmnWYgVNGKa2XMZvnyyJBdpx0PSyrZQqvl+gcISSqQefjzxM6aZfHcKYg=
Received: from MN2PR07CA0015.namprd07.prod.outlook.com (2603:10b6:208:1a0::25)
 by SA1PR19MB8069.namprd19.prod.outlook.com (2603:10b6:806:38d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 16:48:15 +0000
Received: from BL02EPF0001A105.namprd05.prod.outlook.com
 (2603:10b6:208:1a0:cafe::5a) by MN2PR07CA0015.outlook.office365.com
 (2603:10b6:208:1a0::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Tue,
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
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 56A29406568;
	Tue,  5 May 2026 16:48:11 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 32A0A822558;
	Tue,  5 May 2026 16:48:11 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        shenghao-ding@ti.com, niranjan.hy@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 17/17] ASoC: tas2783: Use new SoundWire enumeration helper
Date: Tue,  5 May 2026 17:48:07 +0100
Message-ID: <20260505164807.4108684-18-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A105:EE_|SA1PR19MB8069:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3073d074-cd88-42ee-cbaa-08deaac61a47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|61400799027|7416014|82310400026|36860700016|56012099003|18002099003|16102099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Mesd1BiNjdNIcokTbIDb3WCjvKsqZ4tdZNn0gK/6ikUWO3cHif6ykooJ+Zhfa9Jlibt47W5mDD9riTyb4WDv2rYaSA6uoSajIUWEGOZ0Shs05/29PMXenWLewbD+A+1081USKiSd9YL6cz6llrGDqnamu3BieHbWh7VswmB7oQK/a05OqvZJBsuqarGSPBBUTeUmHXQZHoDQ2/i4zY71XIVi9Fr4Le2lLDrDQ9TjQJ04WqGVQxkpwGIwFhw1EXKT56uYqgHJFy94CKQLuaFGAoXH851EcKgZuaGfn7D/efAk3Vhq+KBVvuEzVNNlKnpPULGWmbNJYwQPN1B2gmPDFIeL3eaVsdLAKah9BmmRigHbAZi205zzykr9/EIlCqqCmLgFFXwqITXb+aOFxbJvFu2d2aQkAH2Vzj6d33cgCUKuDZoJbKqPafxHyw80odjqHL+OIZ2ajK56N+1drnP9dQFLTjyk3S+Ltmfot2+EtTyHO60gJCF5Y2bvBiQe6GKfzhxgMZ6kQnpRiPzmV0+VXj2ULdhgL0XiFWtGCc+9xcZmqi5kDZj4I4v/YHr3Mu5Qqw1rmRVF6DgMTLPrTjHWQ0JlWHTrF+i/t0oLo41J4+EqntfZ7Oz23UB7dGoMTTEL/hVvimDdCA03gxmv4rEsvZFJtPiZqUVy6aU4Ih6pQSJwX1afNhX3Qy4yGXNcyiE9vvIdh6VpyENg2ZPyjctTTG34Zk9LXEf++XdJEc19Rss=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(61400799027)(7416014)(82310400026)(36860700016)(56012099003)(18002099003)(16102099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9qXrE5icsmGIoheYUrlEaRjaeZ+TlmyVdwduKb7u6BjJZSR0BiAcTXAuFKoxFAh2ldWsXB9S8iJz+382cz+E/3/PHoOvl7zsyrW0d4AE85XKSswR83+R18F1quMrSHMmPiwU4kJD7bYz2N8iOgbEzKZPMhKAs4L59wP6DDAB5beBhWtA9uPtjwVd/Jh8/lDieJ0ZViS/iUG+zL31Do2iG2EJd//x7LGXgoe3q5lrBdWqH081eOnW7jgRyZenXoCGYEgfFQXqUDQf9CRUKEE1Po2rswU7Kg7lTLqo4H82k0/PMrR8KDz6ecE0w7CECLdZ6j4Q+0J9T9wlwGTnCymj+WGaNN1lESB7/cKoFuH6d/BJCB695O3O/xmymcu2S5/GFZhiRFM6XJdUIoGEjZq6s7KIqgglThqKeYo+f3gyuLoWQYnmNnX7Me3k7pul8OPr
X-Exchange-RoutingPolicyChecked:
	lMvVLUnb6332k99StvCtZ4ls2Q5WUo17bgeMDYBJgmgKwZsJJB2wSFzimjwr5VQMlwnbic7uTTGhD+KVok0vFhXMAq2HCfBoA7D+shu0+DEm/T3cPJyM64Xq6JS9a57Yphzjs/xJogZWtYCQOZJLoEuyPLggAH1TopUAkzsGdaRbk3pjl6oHot9uTV5lMRVtMFd+44HZpImmKCqV7h7j1H3Tk8Dk0XG8PYNoOTsByn0ZCo/PgsJwSvXz0XMBy3N+Zh6khACMR3uzzNP4TiPPDTE47J3ntXUhJgMosaDKhpnB7nUWjGFAQvw2AGIelQSviWz4e2A4rpseApd0qONETg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 16:48:15.2295
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3073d074-cd88-42ee-cbaa-08deaac61a47
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL02EPF0001A105.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB8069
X-Proofpoint-ORIG-GUID: Uc1NMNR84ed2B7xF2DZVNVGq_VbcQNft
X-Authority-Analysis: v=2.4 cv=fcCdDUQF c=1 sm=1 tr=0 ts=69fa1f5a cx=c_pps
 a=pc2HKzvVluWNC+6j00cpIA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=_kLIPOSdNJ7StitxxVsA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDE2MyBTYWx0ZWRfX9AtjWcKrB9QH
 bvLKLBA9BPic7MQ+k4C6aGc3tk9bJZ7sY4g83YiEIzV9v4cGm8GugBxiYnLGfGTy6xFaq9YKuyS
 g9ai9gRUWcz/ZkThaYNOt+qeurgEy29Lo8E2gdKAvuo5NxULl1VB3xNET8tv2bc/R8RUzcmuLq4
 xC2ev16uroHUShswGDWW4O/1mJXG/5MeS5uqOczj6sxeD2wykf/kr2rnBrWoVO3NF7Y3UMDd7c3
 OmArSvPj7muBQQgM4xOmWcVVXZy4cj3DucL16myc5NTX36HW0sikZFVignbHErNpS1KAEzBQ8pL
 wZhI/aJNoWvbeVLAIPRXG5ybBXt/exkt3nhoQNTSinKkLy5Xcljljlgzs66qTuz71ppgSAaTS13
 p7YwrZ27Mqfts2QYaiybud6B+m1NQ5LF2Ko2MN4zcIyp1R1w267CozOyW/TYYP3OoPX5SiZcv4q
 qY9cNJNq7Xyvsptz7cg==
X-Proofpoint-GUID: Uc1NMNR84ed2B7xF2DZVNVGq_VbcQNft
X-Proofpoint-Spam-Reason: safe

Update the driver to use the new core helper that waits for the device
to enumerate on SoundWire and be initialised by the SoundWire core.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/tas2783-sdw.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
index 38009168c5a11..69d03ddc7a0ba 100644
--- a/sound/soc/codecs/tas2783-sdw.c
+++ b/sound/soc/codecs/tas2783-sdw.c
@@ -1082,22 +1082,12 @@ static s32 tas2783_sdca_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct tas2783_prv *tas_dev = dev_get_drvdata(dev);
-	unsigned long t;
-
-	if (!slave->unattach_request)
-		goto regmap_sync;
-
-	t = wait_for_completion_timeout(&slave->initialization_complete,
-					msecs_to_jiffies(TAS2783_PROBE_TIMEOUT));
-	if (!t) {
-		dev_err(&slave->dev, "resume: initialization timed out\n");
-		sdw_show_ping_status(slave->bus, true);
-		return -ETIMEDOUT;
-	}
+	int ret;
 
-	slave->unattach_request = 0;
+	ret = sdw_slave_wait_for_init(slave, TAS2783_PROBE_TIMEOUT);
+	if (ret)
+		return ret;
 
-regmap_sync:
 	regcache_cache_only(tas_dev->regmap, false);
 	regcache_sync(tas_dev->regmap);
 	return 0;
-- 
2.47.3

