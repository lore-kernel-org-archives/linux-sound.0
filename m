Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349D34DD6F1;
	Tue, 12 May 2026 10:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778580882; cv=fail; b=N80BT8im0yAq33AlLCDVtWRT05pTVtlWRpWUrMSSfWkFfjGQPFU3fVHBn7GOvj/bm2TfN/uoxC8rSr1R1AMEXIVdsB0cDraZf0nGj5awSyHcA4PlLnsOIHfBnz0cjv/C0PcBfH4slRC6BUGcRLIvXc8XcfKymQeCr9Tud5/7swQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778580882; c=relaxed/simple;
	bh=BYdU2kGiFetXOXKEt7PF5sTwMJVjDeifGMO4PTQZCOw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ekwmeIOIuKBD4rzWNtpeSbsASrJIOPgxTIDZ77dOzHn2OJltrjLzUjACfapMee/K3yMiAyLzHf8J1Gve0ZDRO7MHQvjDKXAdvpISsgxJYQ41SScfNxjoigRDvo3G91772gXoMLaXBcyNsw5r5FoRFHth899K4JWQzuz6y/BLD38=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=PsE1e6jg; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ltRloSFm; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="PsE1e6jg";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ltRloSFm"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C5x1Gk900775;
	Tue, 12 May 2026 05:14:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=SFwhVLemB3Ye0qtlzu1x1tM1fQzIN/dSgsFCNO7MC6g=; b=
	PsE1e6jgdDh5TL6VBtwpHZe8BJOBEgeNC1Av8ks+5GY3Q42SbcsoaO8KXjSvUctf
	EkDex6mAj7SPDxUCavf+gqpjKfo5KCns8k/QFmLVQKxnseI0o1N3U4cO3v6WDSZJ
	KhN5TFv1KBQ9GvPzCT88bUFoOm6vPBUqbYCR8Z+e1bRSF15+r2oxmSKEucFAz68j
	U1OGYqfxxa572fuhkACDzjwx1kBDEVnxzvcSWJThRWUfGIQ5MyR5C3CoYO+MlK0N
	vSX5RW5cbJK9GSrBrhaMurwUfAFGDABupy9CkicSDYCYW/tC68BV4nH0UbGu5T+n
	YYZQ/zhPsP0n6OU73u3jgw==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020094.outbound.protection.outlook.com [52.101.193.94])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4e3nvvgq6n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 12 May 2026 05:14:00 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J/uKPQTpAR0hBd/nl5mWDXNHb40dA4GVLuWWDWRlofpfi7mlAtqk+u3TjCDZP7e8Ap9erxNxsVJO7/XPtUwMgSXTHF40QWvE+O+MA2UdWBIeZfS440Okv3wmU+1moM/waYvi1hZZMgzRDndPrx9BgcRtLy3x9YF7v7b4MhWBj/SEuJtZ/YppUTjRK+aT4SV52h4FHOPh6Xe1d63N0P0SbxdF3qKRlkM8aMsZ6cnCYSpm+P51EsQCOsmb6lZ5Buo+pspznOQBafGlHQ5t9sbv12AWEGHHSqLO8njump6rTjLPu8r97h+Zwu1TwNmNQ5JUF/pppPIoz1nHAwZB5TvWSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SFwhVLemB3Ye0qtlzu1x1tM1fQzIN/dSgsFCNO7MC6g=;
 b=WR+Rgg9bHrf5fs9J/0khEJjulnkalxFMQ+OaxBp2L+vSLvkZSR1DB1bB4xBF/giG+sdJvdhRPYBdEeebsAVhzq6kUnAgQRhNWklVl7jf4vtFFxN53VwK3Pj4liMmtCzW2Ve7EyGhpjz+FJa/tAMS2KfLHK7RE2BP9rG5c4SfYK1HhGUnQr4SN1QPSIwWqh/WFezn52MsPUoiKWrs6d5J7uEOPYTiitF6K1m1Pwmyu2YEzMqm3xk1QS39VSZ2gJ8PM3zJqBWoVlWKiSbnMl+k3V663fdV/vTVigzmj+OT9GV4WiogjIiIS5NBI1rvxw20oCmY6avrMcuX0bCgMpW5ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SFwhVLemB3Ye0qtlzu1x1tM1fQzIN/dSgsFCNO7MC6g=;
 b=ltRloSFmIbd0+hI96SSIInGgOgYKuXTaITuy+kRy63Fnyy268sKUJ9qCHGWBT+dDDp7kMkkY/2onYQ7TpEJporMUAlLk7c2ApSqhtqKh86fSjYJiU77Py4zZu4lEf3aAdnD40IzUWd1Ok8o4XQQfIH9NIZsw7RYlLuUYfrBl9fU=
Received: from BN9PR03CA0148.namprd03.prod.outlook.com (2603:10b6:408:fe::33)
 by PH3PPFD9BCBB842.namprd19.prod.outlook.com (2603:10b6:518:1::c56) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Tue, 12 May
 2026 10:13:55 +0000
Received: from BN2PEPF000055DC.namprd21.prod.outlook.com
 (2603:10b6:408:fe:cafe::86) by BN9PR03CA0148.outlook.office365.com
 (2603:10b6:408:fe::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Tue,
 12 May 2026 10:13:55 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF000055DC.mail.protection.outlook.com (10.167.245.6) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.3 via
 Frontend Transport; Tue, 12 May 2026 10:13:54 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D16D040655E;
	Tue, 12 May 2026 10:13:51 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id AB91F822552;
	Tue, 12 May 2026 10:13:51 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v3 07/18] ASoC: rt711: Use new SoundWire enumeration helper
Date: Tue, 12 May 2026 11:13:37 +0100
Message-ID: <20260512101348.1138044-8-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DC:EE_|PH3PPFD9BCBB842:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 255ba8ed-4cde-4b7a-34ec-08deb00f2c91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|36860700016|61400799027|376014|11063799003|56012099003|22082099003|18002099003|3023799003|16102099003;
X-Microsoft-Antispam-Message-Info:
	fT1qqNMFxqiYA/Lfdw0o2WTtIpbJjimK1JKbp3G3g4jxgZPfx8epkUCKbzCnib+LjMoM2cI1fSkfxY3u8Jnl5cL7eu079Me/MCkoq/BI1sYQwiJx0xX3C3p0AfOIWA6JfzIJ2z1t49D+RPlha9vdLPg71Sxv5IZEJdSbZG/NwXrcGFJ+iXvMj3qxWpsJO4pgtPAgpdZirWu/YGt8OYLgVfOFWx9o+08SJFxqAoCzmaZA1+pGTpsvfuk+m11zuMeEFaAi4sfb2TFM7ILsUQZLHeFFA+1w6mACuADnp+BWvnmsXo1+W15MnrAB/9DgI8GO0bwgEmpSAGSCjVOlHN5avBaHysYvL2ya1eKNMSADKCDhsCh42pR7AQoA5xVKosqEFI96H1ebenI7+qdDURxkHnKyEemiGGWg/hx0mvh2s9dvkMkO6imXWLf7WIXat1bi19XOnMsw3+BJ39+P52g3TjvyGpqbIcKE8kAZTrxEe+O6FlCwwA5rPiQH4MLlBzjQy6PDzSEDSqKohfE5PifUnATJjzwKgQQoX0XNhBL0ARdf23ARzKbpETs79HBPaEDrPYeywxYqOmC+hTpkqyGbeIX9iK1doLEAyYleZV+2NpfIWm6DE/sUnhD+FyEcYWR3pF/fD9Zf5e+cwmLq2yBofhNGHWsq2QYn43Tk/T4QZlFpM7YQTaraAozFQtWHyO06I6H3eOkVJkm6nF4XeQh9rDOXUsKPjo4HHPXGPGYnB28=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(36860700016)(61400799027)(376014)(11063799003)(56012099003)(22082099003)(18002099003)(3023799003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wECH/WOKBzpMPpzQaS/wFr7Mrtcj4e5FTMVZgBn3E94hpBmpqjds4Mscv3krhou8lu2S6Q171Dw8Jgmx6bVMJRVQhwzPZ5mDjCJZziTiQ5KTsQlbwu/21gKiZIPGLJ2iGwaeyxyPOU1Tz0lNJsRGAuC9fasXfPuuLlBhtNsV2gh0MvYTW1GGndn/efvaFf/sXKHLmrxg3o+oxh72oncrV6eCXE4xkHXil7cIN2PpVYTImrE6x2/NZrFz8OrtekBU/+eCUwJm6wHG1c7iqFVlQUlKu4hrRm6Nk0Bt//eXsut61DU6jyhaEWdARxYw6hidYbg2PKriBCX/1L1l6xlcTIUcQeBMGUWd7oEmgqYu7w3OzIrCeNSBUCpTH8ppDy15SUL7LeGSzFFhTFBAomGk7m4ts6SKRXr7ok89Jau/PlCOh4YjBtHXMB54GFpruAeU
X-Exchange-RoutingPolicyChecked:
	GCxl31f1B/dBV/Nz186HJxM4HIZJaJa5OFpaSTdYscs2sV4yoQivIvO3v5y/grssTn8btVgasbPFxAFIRrOpJk408rUaJRhqxrUwMo4T5HoAjyxvPA6whA25PJPsWmht/jefwpe48qXMaFmrrLqip+2Hj5cjtw/oikK7nlVhLMKyWyR8nso32p9xFglu6gt1hbbI1GCdeuTolHpF4Z6cXvxcM29iGbI5x0za+xtGytyJNZok0GiaNdn6XbUFuYJ42VHwswAzpaITLLiYkp8BidzJRKFRF61Yx2SO6in8r2icxlLadcXW2XJgbcQy/uI6jfylbxpityM6+XELQ5Ca+A==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 10:13:54.9780
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 255ba8ed-4cde-4b7a-34ec-08deb00f2c91
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF000055DC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFD9BCBB842
X-Proofpoint-ORIG-GUID: AJwhZAurpEuLWrZwjjY6eeHrzA0p6e5f
X-Authority-Analysis: v=2.4 cv=CdY4Irrl c=1 sm=1 tr=0 ts=6a02fd68 cx=c_pps
 a=R0VBx4CaF46Y8RBs4q2Lkw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=RuJZr_uWk9hIvXmwfU8A:9
X-Proofpoint-GUID: AJwhZAurpEuLWrZwjjY6eeHrzA0p6e5f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEwNSBTYWx0ZWRfX/paSOuDA/Hvs
 qrt90Oj94cTJKUQ3oD5rDr+mby5JnTdLEAy5vVV7G1J2IHd+MZg5EXs05WpFEwe4aPCQYkyTpXK
 wBJ04uSiJ3cGnS9hmC3KhmghgNxLowsfkT5VBZjbM1nLcHCipOSwmkEnIozCdlFmqQQgjr5Pn+i
 dqtti8l0NScJjZHVAbNI+7LUzVwlea+9Ebx1sL/1AxphCi3Spoxe7QUTu8YA4NU14Vh7EI7CGpW
 rDTn0nGI+uiHjIR+mHtJKXLwYAMhjxlfs0CyrX4/n84qbbWrK2LQbGM0oXOXs3/DVlFxzdbg+l9
 RianYFixMPQrAvBiHIYETRzMsrLCf2RjObXvQaVUgwiR7YJpb40J+LvznjN1aTbyfOiX5EWSUwE
 VYGoB1XdprJKimLelgOhwDgwyNPKbiLVwty6FKXZStU1QAyuoDdQ8AsJNExTO7uSpm5qYUoipFG
 KxxRw4h6E1m0MT68ggA==
X-Proofpoint-Spam-Reason: safe

Update the driver to use the new core helper that waits for the device
to enumerate on SoundWire and be initialised by the SoundWire core.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v2.

 sound/soc/codecs/rt711-sdca-sdw.c | 16 ++++------------
 sound/soc/codecs/rt711-sdw.c      | 14 ++++----------
 2 files changed, 8 insertions(+), 22 deletions(-)

diff --git a/sound/soc/codecs/rt711-sdca-sdw.c b/sound/soc/codecs/rt711-sdca-sdw.c
index 49dacceddf815..a8164fc3979ab 100644
--- a/sound/soc/codecs/rt711-sdca-sdw.c
+++ b/sound/soc/codecs/rt711-sdca-sdw.c
@@ -438,7 +438,7 @@ static int rt711_sdca_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt711_sdca_priv *rt711 = dev_get_drvdata(dev);
-	unsigned long time;
+	int ret;
 
 	if (!rt711->first_hw_init)
 		return 0;
@@ -451,20 +451,12 @@ static int rt711_sdca_dev_resume(struct device *dev)
 			rt711->disable_irq = false;
 		}
 		mutex_unlock(&rt711->disable_irq_lock);
-		goto regmap_sync;
 	}
 
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-				msecs_to_jiffies(RT711_PROBE_TIMEOUT));
-	if (!time) {
-		dev_err(&slave->dev, "%s: Initialization not complete, timed out\n", __func__);
-		sdw_show_ping_status(slave->bus, true);
+	ret = sdw_slave_wait_for_init(slave, RT711_PROBE_TIMEOUT);
+	if (ret)
+		return ret;
 
-		return -ETIMEDOUT;
-	}
-
-regmap_sync:
-	slave->unattach_request = 0;
 	regcache_cache_only(rt711->regmap, false);
 	regcache_sync(rt711->regmap);
 	regcache_cache_only(rt711->mbq_regmap, false);
diff --git a/sound/soc/codecs/rt711-sdw.c b/sound/soc/codecs/rt711-sdw.c
index 72ddf4cebdf36..df3c43f2ab6b8 100644
--- a/sound/soc/codecs/rt711-sdw.c
+++ b/sound/soc/codecs/rt711-sdw.c
@@ -530,7 +530,7 @@ static int rt711_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt711_priv *rt711 = dev_get_drvdata(dev);
-	unsigned long time;
+	int ret;
 
 	if (!rt711->first_hw_init)
 		return 0;
@@ -542,18 +542,12 @@ static int rt711_dev_resume(struct device *dev)
 			rt711->disable_irq = false;
 		}
 		mutex_unlock(&rt711->disable_irq_lock);
-		goto regmap_sync;
 	}
 
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-				msecs_to_jiffies(RT711_PROBE_TIMEOUT));
-	if (!time) {
-		dev_err(&slave->dev, "%s: Initialization not complete, timed out\n", __func__);
-		return -ETIMEDOUT;
-	}
+	ret = sdw_slave_wait_for_init(slave, RT711_PROBE_TIMEOUT);
+	if (ret)
+		return ret;
 
-regmap_sync:
-	slave->unattach_request = 0;
 	regcache_cache_only(rt711->regmap, false);
 	regcache_sync_region(rt711->regmap, 0x3000, 0x8fff);
 	regcache_sync_region(rt711->regmap, 0x752009, 0x752091);
-- 
2.47.3

