Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C29E4C8FE7;
	Tue, 12 May 2026 10:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778580882; cv=fail; b=ENbn6wKZQ+Zu7GQgxAAg4XGHmC0BJflMweiokVjJ+iPVidu0TO3v2U5rIEnV/MMoLqgaOQdmdJ9B/FGrGoIEYrigitzb7qY7MRmZPXa30ITsVGWqNVkdJOTD1u6XxWa5QLRK3BziNnthoPb2AAZeDGbr1Z51M2IVO6S8wRBPS/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778580882; c=relaxed/simple;
	bh=GLTT8uxtnDO7L1C9XC6UORLpe5bhhfv9V/WHe1KetbE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BKMLp+8xQ8CIe2eh9mK8yqL71b24tTCGS5JWJjLJspeZXwzX12VEyqk44XP5ofHRtuLc/iRBcjCK9mGGdK/nlWOU7z+dgp/ZBhHrKB5MHlNpidGghjo1xcs8EM3gGWw6Jdukz0T9TN3yKn2yDpU6xb9yD+9I21gn+8yJN0XmVEY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=JtmyVe8w; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=NegI8gSP; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="JtmyVe8w";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="NegI8gSP"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C4hpmn1493060;
	Tue, 12 May 2026 05:14:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=q/MkvcB852t6882uzl22NIOzfnA5htPpLaA08teucdk=; b=
	JtmyVe8wHdxyjfeEs5oHDsoIi/Hkhc4P27PmBD1FKBd259bElnxfVlelGsObwsqT
	ojRF1kzakYKMpGk6p2mLaSDt/QiW7n24tbcdsSfFsZ9TFiVhbq9dWEb7STlCUJ4q
	a3BdC3ea+q/YHO4j6N/XxDr7rIj4HAotDkK2NfA6yklMOqQwEMSC5C7YUJde8all
	IyZFoUOxYiN9ZJF0k5MtXf0mKfSGNFvDLOWPZb0TmCwliHAotLgwTi8HSah4JwEo
	lWD+qLbNnmj76MYRyt7mJGvquzPQPeJ8PboTU4FIXPrLuxarkfP7odBKPfUbnBTa
	U7nhxqeUg1WyAauSBPYJug==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020076.outbound.protection.outlook.com [52.101.46.76])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4e3nw58q8n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 12 May 2026 05:14:03 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G0x2/Oh8JNBif79m5va3ZlvfxCHxJG2JhD70AfkIpTudgJa5p73QhUFL7+JdOoUrAapCjzbWIFR4brXCvRTV3DDP0RY0KV+0bIZmEZiDhlRPnMGUTbnaLbkPOJY6DCLDtidCeGsVXg/xRNJdM+5S3HxChv+d6hFOwtUhu79GAJQJQN8ADGUHsWkuwHl8MmxAf7mM82UMbQNo/bV3uaJVyNl6fDhy6QSw8nei0Trr97BpBEac781//0a6ihmam4Tueis0VXjSy59KXU32iY4AioEyzIeKjmBvJaGS7mkrWpPSgbslLLDZqI7UN6FK1Id1HOGW6CgewtbH7k6sG4mCDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q/MkvcB852t6882uzl22NIOzfnA5htPpLaA08teucdk=;
 b=aXAlID/KqN5sAcPythxLWY+hd9SoeXW1DBQqU1omVQTKcBHSs5RqMlJH1GltEISkVLGIdHWOJGmg3QHPHPfmUMFJxVGtA+n4RIu4S21RCGMnGIYWh4iFPv2gXLNlM1WdYXOpqI8SGopQneGSrr2Wz2I0KcfdpHhKao6mcNLLat7BXpzK9UP+ncvtnyEc3k6kgf/+A8ombISCMyivhQa3hfil5gR7uO6oHt3YeKis3gf0XCfa6V3iarDM66ZbctjEI5KyEI2AN7ZV0P3i68UVW1QW8txkRvd2VjUUQ3IQu0sAUlEs/gi2gpmTNf6g+5FqguVh0c5e6SZNH/IkfCKwpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q/MkvcB852t6882uzl22NIOzfnA5htPpLaA08teucdk=;
 b=NegI8gSPbML4PmDyVFfHRwdLpYErpUrUb5xWubGVkjQGq6OSYHh/YBf0eHCDBtgy56WxGHP/QEbbaQ7gnni8Q9ZKpoum5TCvjnG5YWyNYgN23CZNmmgDPZh72mWY2zK1CtsVCRi61jWUf8yWcOtfEN6umPRTGqOG7yANONMyb7I=
Received: from IA4P221CA0003.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:559::7)
 by SJ0PR19MB4480.namprd19.prod.outlook.com (2603:10b6:a03:27a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Tue, 12 May
 2026 10:13:56 +0000
Received: from BN2PEPF000055DE.namprd21.prod.outlook.com
 (2603:10b6:208:559:cafe::54) by IA4P221CA0003.outlook.office365.com
 (2603:10b6:208:559::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.16 via Frontend Transport; Tue, 12
 May 2026 10:13:56 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF000055DE.mail.protection.outlook.com (10.167.245.8) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.3 via
 Frontend Transport; Tue, 12 May 2026 10:13:56 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E44AC406566;
	Tue, 12 May 2026 10:13:51 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id D4325820244;
	Tue, 12 May 2026 10:13:51 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v3 15/18] ASoC: rt1318: Use new SoundWire enumeration helper
Date: Tue, 12 May 2026 11:13:45 +0100
Message-ID: <20260512101348.1138044-16-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260512101348.1138044-1-ckeepax@opensource.cirrus.com>
References: <20260512101348.1138044-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DE:EE_|SJ0PR19MB4480:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 37c64852-7295-41ea-b179-08deb00f2d2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|7416014|61400799027|36860700016|22082099003|11063799003|18002099003|16102099003|56012099003|3023799003;
X-Microsoft-Antispam-Message-Info:
	O6uanlhM6OJ52AUiLrUfLZT1Tx/bmbSKob+piIWoMUwTGw/svjV2alhkxCSyCc2pUeoon1HM554YGtzyOj+X5y8xKPkndAJp7tMMrVLhfKQZX1qmjcF2itTlEVD3o1RRo/WDEOjM8CMtddTulTH1ImxyfPQ1jwCBWj+nO3sdi0HPv5sD1a0VPuxsHAgDaJpFnvCpKxlCXsWF2aeeuNlPhIBYwdTtB31he8fc1GLNqd39uzj7ZomAGd8IJ1Er6y+2nHoEgcF8x7OeNX8ym7HiJDHHNELFmwXGLKDduWYTKZ2uqRbUP0teazOBgtoKMWBwssMNCmRunARutvzENL9lz8j1+2oD09ud2a94vix/i8vgvbT6Ejn94SJykyPmobmKveLkRLYyWl6okliEduB7nNWu/NtbTf8vTRmHOzaDxy9cqHAwovdJan21gJSW/IfnX7e4BmIKly1T/bGg3WfcgwWWe4w57Csrejg8ItjmmTbwMH2EI7mk8cvOQ5S0DSoKGZfP0m/g2b9SX1Zrv0JgBPh4aqfap6t4xGcZJhr3CuSBo36KsTYDWlKe53NXYKpmsZh8w3IdOiRpziiiKQSW0ddTSXI+ufXl5M7BMlgqRhjB96G3wbn/zmwcMhXwnByK0So6oNEdNd0r9m/bc9kMTYxfNCfSmq7JZyurWIPT60mIsy89ZeNva4eL/gLFB90PzRTZOXRrPPr+O5bAUl+WxQclZFjE8wL2JqG0GubHA/I=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(7416014)(61400799027)(36860700016)(22082099003)(11063799003)(18002099003)(16102099003)(56012099003)(3023799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KLdcpnxrV6O3vOGxQcCFtJf1plCPuRZpTThQZMrfNlbTCw6HGnLAF4/QfWeNx1lFrclx0rNJVyGs8H45IMTsT1Qeqk+YB90zxvjYJtMXVmyWNXSzMGCQrkUQ2NXSxV7MN1aVmxA9ERS/V/noyIyijEd/gAPvtf5uZ5pXpARy4b+LOnFZIntvFbJMbqzggDLKj+KCknIxZp5ZXbSzb8NObcLk6PlqPu5YgiIHPXVOtizSqVpL5aBLUuHze/kiHMgFFoN0LKRwkv/2n16YVdCdtueUhrAWVUF6I39qK2IERphff0yMvvEAbkkT0yjf5aKcwHiNWD1Lc0lqeilUcXSXn7ZBTWot8OQnaBgYQs3rulrFtBaZoJ6opeSeKYWMTVgeozo6T8W7RV917zeqFfP89rKe5bv0hTwuMYzRdy73bC7qxG1WJI3PApSKVUnGma28
X-Exchange-RoutingPolicyChecked:
	tZGVznWBvp3KamM5nWYGFnkVVFo1vU1x1DZsL9b8V8t1NqfYe/B5lSs4LLdjHtfTW2+lU6L+IkzFLE+rA8NQZxcwAJEsQxQpM3mYXO1m7hOqePLSyA8o5UrMG4fTqGoPd33J8gZAwBxNAz/kH50a1iBxZHmhQLtgTefG/CL+QCVYtbRaNgC3BUzI7BGBjv8+V4t6tMqElJzVd0E/l3HN3T6BHtE3rxO0hc+EBjX8oWQ8baSx1TFb1R6fINYyb4ao7yKlnicp7CQPjTUkwxtRp7/anYmtBpJNVkub1YVU9v/RsD6OOYvXhIdeV2r6e98XtDhlGS4Y9LAL7Z43BAZwVw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 10:13:56.0168
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37c64852-7295-41ea-b179-08deb00f2d2f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF000055DE.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB4480
X-Proofpoint-GUID: VmiTV9dSUVPicHPNVnBpW0aKTECtKcKI
X-Proofpoint-ORIG-GUID: VmiTV9dSUVPicHPNVnBpW0aKTECtKcKI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEwNSBTYWx0ZWRfX88ujKcs+mhcp
 uDA/QkA9FfWJ81E87ImAHunXCxStOlX/Wg7khSrMMw8iYQcdBZRjedlsw1gJSj1cks0zH9blJWG
 Cjp7VzC6t/SgkbUSNHiZDfNp/pp1RFkOc1MNKm1fgDJMPHigIMRBghmpq6gt2e50Es+agkq9Elq
 4+0uZsAjLpgywVX2ENJAaWMYZmXBKXN/qvAIYdSaJSpU2g/6ClRNAgXpIVOZwFkCSFJ4Upn86zd
 RKZ+XR0RaDKXrnjtVdd+4/Yrv5Wj4WbclOGkYjvxRFQVWZRyXnuHgvKrsNLALZ975YcxtfJuEen
 Ev++63rmneUh2B7jz4MrGB57zR/g5L1SlKC99SJ5QOUS2Q/jyrvg6vQjuC+TFhzW/NbG2jzA/om
 ghqDhu0l7unGD2xXUjPYARTez7tk4RdXqRhvliFfNGJZMscl1VziyqAwMB1Gv3W60QvfiN4ervx
 EaEi+zuI7eNJyVDonlg==
X-Authority-Analysis: v=2.4 cv=KsJ9H2WN c=1 sm=1 tr=0 ts=6a02fd6b cx=c_pps
 a=nQOnRft24rXfzDxjd47CJg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=_kLIPOSdNJ7StitxxVsA:9
X-Proofpoint-Spam-Reason: safe

Update the driver to use the new core helper that waits for the device
to enumerate on SoundWire and be initialised by the SoundWire core.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v2.

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

