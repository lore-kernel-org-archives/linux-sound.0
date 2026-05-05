Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374C449690A;
	Tue,  5 May 2026 16:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777999749; cv=fail; b=pyMCXhGBCWS3hJY/rire0q4bPY+41PoEmIAHC0OfUf1lsaJncAA1bFmtEunYHTtQXMFWFmHwCQIzDLnsTYKOmQgR2YtrcPaQ0XTn/9Fj7ZWDA4HzPvtlPs2Lk4kMZ/smjWBt5G41NHX1rpLHwRqDWH7hTyxPXBh1WplHHeB1FIU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777999749; c=relaxed/simple;
	bh=axqo5icDflt8G3BeU9YN15qY5nEDWQGiMi+r/T36+P4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q+O9/xNd942T2Q4XLpg+lhKreLw23XUnnKNnptcVvGLBPq8RTpWCpxsUyjZGHij3xN2t647xaJ9KBKZLCi93CYnyDE1cBV7qVe0LfQCzxTDH9Q+bUT5HbXZD/kTZ0XqTeLuNjyrdU1uHe2yGaBl+tau+1SUvTnwUWPok2sa9U5U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=n5fb/xXA; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=RhniBWF0; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="n5fb/xXA";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="RhniBWF0"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645478YK455970;
	Tue, 5 May 2026 11:48:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=cPrUjVe5LVQPY7GOEaJMHD1kJ0o3bfv34mgCPrysD/E=; b=
	n5fb/xXAUxB5Mf62ewnr1nPQ25UkWHUprBNC/eRSKXAZldApHyKlyQg9LyUGIYUk
	Gject4k83+Y1ZnH6JKnSRv4+wv+VZ4hDl44LT6H/3dREdGgY2bpePTd6OdlHsDRY
	px4K68z2ZIfa+8Q8VvUeyCuoK21BtnPH8hnyV8IPlj5RCfXEBwjuNVKXRTYw6PJh
	DbDNeUpBy/Boptm6LUVTXYV747JReocWKh0Rg3F2Px8YjQIpXCqAEyT+TaHpW6JT
	EZMBD2ZxYaG/moLKzMvcP3rB2ZGEoyoSioKN6zdrrcEGjhRCmyIznU149WKbi6X2
	1Ac8d5UErLXtDpQUqxP5fg==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021100.outbound.protection.outlook.com [52.101.57.100])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4dwdpk45v1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 05 May 2026 11:48:19 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eTdVgqo7oEgjDOXJrHD2wrv2mVEk18cQVmgkt4uuZO6kYu+EF6AeqoPzeFCK3ycjR3F+fV6/0K9rXjYb6u3L3xRF6Taf9czrU39cWpmklk4OZ2o6mVIO5Pif3Nk38DKRSsKUVTxyXshblXSGCDC4uShysAK/36GsvZmUahCumj9Q7UjGYSx4tPcPa8JhdhMAiajDI8NGspLoGHZRdQ9iJhRXPBrqvlVyEEHaap2F08ECehALxnatTmARDDuTBCpOfrn192lmoIGa09QaiGVzINjPhOFgaI4WbeMhzXIXJfIBhVXkEMZ9r2l3fc6INMIIbt7B3BaZ2ClW3uGP0vu/bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cPrUjVe5LVQPY7GOEaJMHD1kJ0o3bfv34mgCPrysD/E=;
 b=U4pdC7pG6jmnBbWCoFc7mwlc5SK8S9P0IWTKL362PkIs/y/rQggbaSKwKj2GQYys43nhUy3AhiiG4uOsUiS4yHuDXGhbKmUPlPeMAgqEGnZIEJaRw83uNpeH3ePZnrsH1qtptLnJSIEv4NKYNS1VhknT5j5Bf9y0tzUSWpd4WUXXLI34wVvpw2nWn/aGBcU3j9MprIe7kzMRcVeR7TzP6OUTViN15qhVsi8dRpUlZg/6Bp1sGhEG5tehPZThlpHj7IChLsfzxryjRo4lRAxkGnv72tRtuRuym0IBd5acHYMSzQTRG7NUjJHrWcKqN8r+ssePuvc/AjJWH4uvRIRqmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cPrUjVe5LVQPY7GOEaJMHD1kJ0o3bfv34mgCPrysD/E=;
 b=RhniBWF0aaecdP15UxqSKgfdsEjbcMI2WvmDJSuTTZVcfBEG453uW9gVseIAZEJkyHjyPob37S5xDWkVaL5nevG2ZjHK7cIGUMIbuOO8DVfwwRQNr0/yiYTXmlYkrMplZfIwlr/A+m13+BKnbyoJwsOw5HTexg7/ZQJYh8voeaQ=
Received: from DM6PR02CA0144.namprd02.prod.outlook.com (2603:10b6:5:332::11)
 by SJ2PR19MB8178.namprd19.prod.outlook.com (2603:10b6:a03:564::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 16:48:16 +0000
Received: from DS1PEPF00017095.namprd03.prod.outlook.com
 (2603:10b6:5:332:cafe::91) by DM6PR02CA0144.outlook.office365.com
 (2603:10b6:5:332::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Tue,
 5 May 2026 16:48:15 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS1PEPF00017095.mail.protection.outlook.com (10.167.17.138) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Tue, 5 May 2026 16:48:15 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4DB78406561;
	Tue,  5 May 2026 16:48:11 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 1780B82024A;
	Tue,  5 May 2026 16:48:11 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        shenghao-ding@ti.com, niranjan.hy@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 12/17] ASoC: rt1308: Use new SoundWire enumeration helper
Date: Tue,  5 May 2026 17:48:02 +0100
Message-ID: <20260505164807.4108684-13-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017095:EE_|SJ2PR19MB8178:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3cbed5fa-972a-400b-3f43-08deaac61a67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|61400799027|376014|82310400026|36860700016|56012099003|16102099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	NdV0E7z6RAsGSbwq0G0VyrHeKJ3zUXc069b544yVDRFMCLD6MvZ8gUGKR5fY0S2fp6yGjLK60QfKSjcwTip/N/xNOdmzUgZkCB+6EFG5Nn6Qw9b64HHaqqtmRULzDQiEryZWoP0hC416BYGU2KXJFG2GhxFyKhyFMUaJi2Z52sj9A6L8tlMWJfKeBWpQlIF1bRcMjA32GeytRqDyhLp6ebW4OtcUtqbkF+Av1QEn0ji0m1Xh8mxBm8yqq4P3JG57oH+LB62TonhZvg8fOGMW9kwEzwVKAZVXJ3KsEgZttgnQNLXePRZDlj+sLReIPVBMvE6S26hAhYF0XY7qJtsNRD/66EIlWVNoeMfofo0Htm9aTfZHRfzERsXCGOoUm2cB0QP88etQwL0JzMrStg04n2TfS3K1OjqkfcN8//TIxI9fDxQj0Ns5t/B4KCd00GJUjhkxBi3A9CcubvY7wwtK/SkMg+3kgaL1PxrqbX9S0GczzSfmVcCFTRDr05lnGLi1POGN7BGFsJG2XR+yuVtm06LO3EmQE7KSNNsG0w6FYJReTR4ZgCTsxNauN33keVVlqqnPeq4eZjz+lM7twgjx84jqrqMuU/gA1Yqn3ytH1LIHDXs75CkWI5wjXrGynA/0PEioCX2iGeaaoFniEZXQ+SYHx5+yA9R3PRDADWs3KFTJkB4iwNsQ6w7GghqPaPtuqu8VUjwuwJaYQJNehGFauIgRoQQm/HEMu26U7oEuFlw=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(61400799027)(376014)(82310400026)(36860700016)(56012099003)(16102099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IRb47AIXa887AtEYS7Cv8ux0RnykwOzIqUc1B1P3ljxrhoNnYyVI/KG5JyMunq/BaKEUhSSH+fJ7D3ZRBXS8Sz3fQRqBeAHdJ2gwSwYBLqggFs+LoOJH69AsGZt8CWhru0UbOKm2dCxURFUNth+YGqeKOJKHtXSMANrihwYJUSHyd7VOWUitJ/nNf1q0HpZ+ukGWcs286+ALGZvBC/zakrMBBaWPUR4Sa+ySyrIW3ojMtp2my71bFtv/Y7smpGjbjeG+oVssF5TfSpzgacx7f2Dze1dywLaql2+wrWT38+t/JOBnEYXUOnFiCRcbkL3Fb+B386Tz4uXtCiH0DqaRbNIBPs1JIgjb41DwpDEQwWWwyOwcpbyUD3/Vyv0CzN1JPoO9SugECh+d8RfJa+S4t5WMZm5njvKj+tRm3PzMGIN+yS1P5NxRIiCCDzR8/vuY
X-Exchange-RoutingPolicyChecked:
	FBDgANsC+35peWYsXBWIwEnwKQV60rKblSnO3lLqNeAOG3sOnwQoaiHbikkvP4JQ9Ucd9hABRmQ8h9Trnve3PCs5ce2F1/AyXKAZv3J+SHOqHq1rZ2olASeUX6S3BKXHWlg+sG0HwNChtJ0giOFppYC/wfnGiAMj83W56hlNFrHoSgV7asl+XIkGLBbfF1aFIIAKEYQ/nuJSBSE9ywjoBjkCpTk+zl9HBdF3zL/34rwXvY7oM4Y50jNcBQV/XAIQdW8Ux+omDDCx1hUIc3Wi3lwn15EA8UkP5qz1C3d6OP7qWujCguhprvJsNaYsUU63HkSBmabVt39CQvnAEr5XZw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 16:48:15.3855
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cbed5fa-972a-400b-3f43-08deaac61a67
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS1PEPF00017095.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR19MB8178
X-Proofpoint-GUID: bESP6KdA7DvOD8EtFRLq-o_7h18JN1dD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDE2MyBTYWx0ZWRfX2WIJpjqvaLUI
 IEn42fR+xACSqbSqzVW3fsehWsH9vZ0qEZpE82hJpCrKJrVcB/9VmcgfPyCXg6V8oK+LLiCHkFi
 NcPpEMcoirnB0+cK1Sx4k3qc1u038rAdjN5rxbPhmQ7nOqCYMffaGZrHHIF1GgECZ+EHcmYflck
 ALThiLNnG1Tl6YLZFwiu9gkcld+UkdT3l9IHxH9SOhx0QRMlVuzSxTwS/BsghEaveBWJCCoXLBP
 lyP/7hLb2oBrWJQuHlGNWdL5YP3uMUGaMZidzWCgJMBuItimNWcXmGm+eXkeeuKps6LQikE3eRj
 w+c9JIht5BHjH9BuC92hOUOb+rcosRe0HVlHtzXtFrdf7l095ktGcuApx8JwQfnBqSZQGvkoxWK
 nLDnNs5dhnQSrXwG78zLQR+0iSec4o5Hp/Xrt3mszsP2I3rK5BdyXirG2qkDJ30dQnEt+y3myD9
 2mmffpFOQq68JXdk5qw==
X-Proofpoint-ORIG-GUID: bESP6KdA7DvOD8EtFRLq-o_7h18JN1dD
X-Authority-Analysis: v=2.4 cv=LZcMLDfi c=1 sm=1 tr=0 ts=69fa1f53 cx=c_pps
 a=FS5ki9kahP9/IQdclff7Rw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=_kLIPOSdNJ7StitxxVsA:9
X-Proofpoint-Spam-Reason: safe

Update the driver to use the new core helper that waits for the device
to enumerate on SoundWire and be initialised by the SoundWire core.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/rt1308-sdw.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/rt1308-sdw.c b/sound/soc/codecs/rt1308-sdw.c
index e077d096bc239..39e06a3a75609 100644
--- a/sound/soc/codecs/rt1308-sdw.c
+++ b/sound/soc/codecs/rt1308-sdw.c
@@ -768,25 +768,15 @@ static int rt1308_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt1308_sdw_priv *rt1308 = dev_get_drvdata(dev);
-	unsigned long time;
+	int ret;
 
 	if (!rt1308->first_hw_init)
 		return 0;
 
-	if (!slave->unattach_request)
-		goto regmap_sync;
-
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-				msecs_to_jiffies(RT1308_PROBE_TIMEOUT));
-	if (!time) {
-		dev_err(&slave->dev, "Initialization not complete, timed out\n");
-		sdw_show_ping_status(slave->bus, true);
-
-		return -ETIMEDOUT;
-	}
+	ret = sdw_slave_wait_for_init(slave, RT1308_PROBE_TIMEOUT);
+	if (ret)
+		return ret;
 
-regmap_sync:
-	slave->unattach_request = 0;
 	regcache_cache_only(rt1308->regmap, false);
 	regcache_sync_region(rt1308->regmap, 0xc000, 0xcfff);
 
-- 
2.47.3

