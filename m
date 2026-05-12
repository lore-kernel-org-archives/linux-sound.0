Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E0D357CEF;
	Tue, 12 May 2026 10:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778581913; cv=fail; b=nddDDhzRUTED4KGxxIzbynCTm+hSS1Plr+zEzMSZ4xQ7DA/qB7F4h+rN9NjmTGpAQJ5WR1ZYpy5wkFScIOB/ZMlWM3fKpUoulHoY3xNScXqs/eqaJjnYo/nd6FLUaRnttBFJlc0ECH69t2md4aBUofqqSQ0GPyLHmbsmJbXZGOk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778581913; c=relaxed/simple;
	bh=rKs179W2JGZECHJc3Hz8f4DExr3ewWlMe48XZVi1wqI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NrrK1Ddwn17ac0eaVscIov3EuLXUcacKvf1UUKEostxIu50X0tQdMmifIwXzwZ2gdmI6sOQ/TYUkQrHMZkee40jgRGuByWa4TJqS9/yscnMgDj4wX4UgImx1uM5ZWR+houVb6kAG1lCqQVUa9gcetqCh0s7eR/HkpvXyCUGzD4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=mY9fpLTZ; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=UaCnId4h; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="mY9fpLTZ";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="UaCnId4h"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C59jn3818502;
	Tue, 12 May 2026 05:31:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=+w7w9DDYOep6Q2YFceRYapyzT5zzhXrPcV589GeUtHQ=; b=
	mY9fpLTZRrBrnqm/1X5SK3XHMMEIaeNMLtqyZENsLWRfkohcWe+IA/xke42xyGH3
	IRVAqv/T87RJ1nB1aipJvb2a6k/OAX7UqEnIijgBARiNduW1d7BZf5Qy76YNfeDI
	CrpE+Wx+k5+42fCUZ4axZgOP+TdM/y8nVdzVekRRBsXXlnyEC8rULE2/vef98ZJF
	PJLm9pftzhJ8fdClDgbqQ50LV/rlS/1qIiaX26GF8Bz+ZcTFUhx/CxiMqqk98lgW
	zvHnc8AEsYCxH08lqKl+0Srj5WTSRHeXYTeid2C56ECm3LCYDoCAXtv1jJRF8/BF
	v0JpU4xtF+iwLKI6HDIYMA==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020076.outbound.protection.outlook.com [52.101.85.76])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4e3nvvgr3m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 12 May 2026 05:31:12 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dIJ/BUVK6j5K+Nnhs/PghK4cWSQRAL/e3bXVFWLmajzJVZwxVtLwg4IwEIVydVVpu7HFD0EEFETmg6T+6Kc1hUR2HI2YMy4biTfZKlI3jSn6vIIMrMynFjFga60KFKMiilPVV7AwC2HczULSVqxeHyLzmxx3+qu3NGWgUDbNIuCq0fm0KED7TJckSMGXWQBKA/ywHSfrzwOIE6F1U1E4w2Ihupc3oDzXhqaMjhesE9I1jTNq9yPD5m9GkU580JOlkTsvbBlPsPqQiuDYZdXcchlf2UdovueqMSjkWcl63Lrg+lM5bz4i2wnxcdcj+E1ZnhfZ/3xyyADOuVxQdHyjcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+w7w9DDYOep6Q2YFceRYapyzT5zzhXrPcV589GeUtHQ=;
 b=RUskNRULT8nJU1ij5e0pbMRkxTiH1+vPobKkJnc5nkRAQ4GT65XSjC5DUWryRTFkbGDR7fBYlPFObTVwd7rqFCZmj1AsvphVMPSSS+Zt2rWQ1kkf93skBaVrz9DpEDt9iXFXOhdywkW1I0/waTpTI8raoiA1YkG+mlCM//yTR4zTuK1dVTXq9sH0aQ/FBAgHIyet+jjB66JjEFc5VmCcPoJEjdeNtSKbjeKzB6WGJQ4A3DLqtpIMsUNyYovfq212SrzHqPJ8FGsHQbVtUVDbquhurg+vWArEUcP7lIKM3ZNJlqm0HWpQQslyVkIxa6eYGHtLW50BHISnHGgwtIdaGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+w7w9DDYOep6Q2YFceRYapyzT5zzhXrPcV589GeUtHQ=;
 b=UaCnId4hVdEi8c37djxi7fr5VnXf3anSVX9TK0RooUReQSrp6/ll//4NCduMXh2LDYL3x4Zi6lwige1VTBnPeAD1VALcDttA40A1RtSLgdxvwyhvt5Sdv1TRSLhK6Ooh4F/6wfHk9BxVZ136i2c4WMO3s1WntQsc/eEV26y6o/k=
Received: from BYAPR11CA0102.namprd11.prod.outlook.com (2603:10b6:a03:f4::43)
 by BL1PPFCAA20E3D1.namprd19.prod.outlook.com (2603:10b6:20f:fc04::ed2) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Tue, 12 May
 2026 10:31:07 +0000
Received: from CO1PEPF000066E7.namprd05.prod.outlook.com
 (2603:10b6:a03:f4:cafe::8a) by BYAPR11CA0102.outlook.office365.com
 (2603:10b6:a03:f4::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Tue,
 12 May 2026 10:31:07 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF000066E7.mail.protection.outlook.com (10.167.249.9) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Tue, 12 May 2026 10:31:06 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A7157406563;
	Tue, 12 May 2026 10:31:02 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7556A82254E;
	Tue, 12 May 2026 10:31:02 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v4 15/18] ASoC: rt1318: Use new SoundWire enumeration helper
Date: Tue, 12 May 2026 11:30:19 +0100
Message-ID: <20260512103022.1154645-16-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E7:EE_|BL1PPFCAA20E3D1:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b40340aa-945a-4333-a049-08deb01193aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|61400799027|376014|7416014|11063799003|56012099003|22082099003|18002099003|16102099003|3023799003;
X-Microsoft-Antispam-Message-Info:
	ij2M6PG/A3Jw4zhF5p3kf3EaZsN4xEHhXHcp/dhCKr6VzJl7dO9mJwE9KPK5E0sunnTNeww6uMgGbbfDPvGdunbQEajobASNQsnkLFrgo/kEid3pIDXJMPadGFjIWZWZdIpuF/EiKnFVkaX2mfsdj42wI461FMp0FkcNDyMPaal7YEkqo8T2gikV/QQopXYWxYdDWBKg7rZ5k2kUKhcqxfi/UcLSdtYpGmC4AqOY/rRmsLZ8n6rBPOzRyHPd82LdETNvt8PKRpm69KlozofO52bGiWy309DPnxwMyejSYYjiN06J1a+1M96WTlkOU4Qpn6evTSBOZCBf8b0ge+YlgHgnv1bRaOn/3RELcrFWjqbgbG3yIvz/mjSpE1pXVSqSwN9q8xrqE1EFz25elJXH6jl7zPfHMdgAhjfi5IzhZLIaVNnbxx+Qt0s90kbd0y/jXOAGQ2eQclUekYpc7OXzda+tb3XBmGJ2mu6s0cJ0i+zoO8vDlluYdLAYWWscKjfri8ArEp5lTMlPL9+rIhfHF4ZyCxxdXJxw42VLvWMon11esXwZwtBBPhex0OWB/oLQXPqv+gtUnBpmVpqBCtubPUkssacOKl3HU0xkK5kGq+sQ1oaL9+FLJeMGTQKC8gfIOJj23SXUksX/N+a8p96/D2GJqB9JvgL5zNI8hr3smC0ftE9ByLaEYJhoOhHoIJzJU5v3TQWOK+nd30nSPqVQ05N/KmAyuEPj1El+AemhyA4=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(61400799027)(376014)(7416014)(11063799003)(56012099003)(22082099003)(18002099003)(16102099003)(3023799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2R67LMSVfcf3/+x4FO2K/FYTk7RTcmOcXDnjuHlDjf6ASAOrvHP2+qFXuMTBs5pAtU9ByadvePkJdTk4NES1LEMX1lK0fvfHzse7fT+OKjhV9OB5Bzy5gXmf2wcNvO4JftdiISnpguvflymnXygIOVHXzNS4k1rGKLRW2cPegsfYMcC76v461hRnAMGOjbmhluPOCrzNRsftwpTg4792gz1YmrDH0Y1JMI0e+7ob8gKURshb0Sx4gVqMCGjY0r1QwEa6XkVnbRwTztQL4F4W3iYvUAxW0m6byQRIhS8Inr20nlAFvngGPs1OWOagPQLZxaXDcCasGpvlyEEHXFEwZ4YquwcF08xzy8psYKK0AMP8y/D0wSkcxI+6SyegBaQkFnM+1KDDfepeNrzQWrEaZF3vsAQLGGEa122pvFxOBC94NGyLK8LPaRCdTc+Tji6W
X-Exchange-RoutingPolicyChecked:
	BX/Ki9EJLr5TuOffsC3fKNLwzx44HB9t/iH57SmrxfXhmDwtjAxR+EN03loksHNJ71BgaaTV5lMpxftXaX5bB+rNsq6cVTeGA37yZAhHN9GXXPx/haeC73f0tHDhxSluFLRqMuILg1Fy4b2UltS2wIUDy/VDSf8EX7Zpk+8pqzGCUOcfvyyoO8MGThslpvXl6SwvtAb0TJ90q1QNbvzG1gYy8hFhczUjyAGznKzuM3skHKpPuB7VxcBENzMSUqJBAUnRlnd/ftAywByQOuuNK1HMIGFcUnitZ0q0UehYtbT7SYWoh2JQ2jS1yltvzV18FeSU+t2ZjQFTMi6UP8drmg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 10:31:06.8401
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b40340aa-945a-4333-a049-08deb01193aa
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF000066E7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PPFCAA20E3D1
X-Proofpoint-ORIG-GUID: 8ipheDozT3tkbVrWfi-5_2hctr8eZAWH
X-Authority-Analysis: v=2.4 cv=CdY4Irrl c=1 sm=1 tr=0 ts=6a030170 cx=c_pps
 a=PU2v30DqrLDYHXTVxoobRg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=_kLIPOSdNJ7StitxxVsA:9
X-Proofpoint-GUID: 8ipheDozT3tkbVrWfi-5_2hctr8eZAWH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEwOCBTYWx0ZWRfX3tSo8k8VUcMT
 y+CZloWPFKyO2PHN3B+QqcypilEcVRh05QOhjoHaM9AK7UwPEhPHLCLNmUZPIERTs2jsGn0752M
 c3pw6Cj/4yGDy+OmuRPlM1RSHJg9bOqT+b5QsefkMrfB9nG743m3kK8CCnLvMir4GpDjjk2PT7k
 4SZlZrVua+rrKxDxJ5i9tCbdN6BlAs8ZB6N4S0F6FAdP27AgtpMAC8lHXQzLLTaMUp7TZyw4mIA
 RGUzUf/wN1HpclRzREvBLvlEbh1Ysorz3mvFzei8aKrexiafE1tXQrNvteS/HVW6St/yTtDVfX5
 FZ+iWsyoHy7gC0gsKvCtIm4SybRmIUfRNPBpR+dXZX/j1cVxaURD81xZmY6oQA0+DzXVGOW6n+p
 3f7hJZ/+h5KRO6UmCLlvpRCkjQxqpCCU6pfLZQWrr8l05C2g/+8BWpQEB55CplvM+H4yIAMdktK
 J0mbx3R1iUAVLUPyQMg==
X-Proofpoint-Spam-Reason: safe

Update the driver to use the new core helper that waits for the device
to enumerate on SoundWire and be initialised by the SoundWire core.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v3.

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

