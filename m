Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B301DF748;
	Thu, 14 May 2026 08:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778747678; cv=fail; b=AsAmrG9ipbUseKf5naVy+7iKYr1xcxHSLsLxxeDVTQXC4dQkw6Za6/I2PyeueQF0NpOza0l7U+9RrLw7IEvi/L5sTkFnwFHxbXSIDGM2Fq8C1HUxcCjywhWhGd9YU7Yybj0OuZKAxn31AunYqmagHn+EF9ysqzpujBiuADeLVtE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778747678; c=relaxed/simple;
	bh=JUPXVdgjaaYtjycY9igFyJPzrcpDW28QZk3ZchEypDU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Oh42tb+Drsj2T361N5lPPCbX6mQgvgpMMirrpuoVX8tRg8dcdxE1GI+4CuIY3TEVdrMPTDHw1shZLmHk4nCraBMz3FWe4m0lwEezLgh8NJGpUeuDwXeT6K0jEPtxfLSqMm3aaSdW2ctTk9OiDEdpuHHLgP4CXsS4y7XSOb/RZLY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=nGf6ZrrY; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ydMXOAN4; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="nGf6ZrrY";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ydMXOAN4"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E0tAMZ1028835;
	Thu, 14 May 2026 03:34:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=XjrZlZ1jyZjT8bMe
	GRBSzptT+SIrqJf6Kep2B68bNYI=; b=nGf6ZrrYyp/i9MrZ+e6jBNPm8Ke6dALY
	tX2sd59WD9a31ROpC11WGXYeaX8m6rkvifN/1ZdXcu3qy2AjqyvOgL293nbVVrDK
	5z/5ZQx3/Mz4mYyyPvsGRIYETyaAeKhJyLBplYsMqI+ShdrdaNgc1kcXrdNrSAfQ
	zxh85Lg+jmrfQsCSkn+bTYCdTk1qwFjUmcdY9kQfnaGQQHI9hBiiA4UglCHSZE6C
	zBUlnN3Bb8jx7I3xwucoZukUfF6imO7h8ar9NpW+EbOsRQrX8ikSZQM9cRekYzWb
	zx+I2LkVVJXaYXaoE1ZH9jZbHyYPKMUacgP1S2cc7WTWH4qwfVdUcA==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022131.outbound.protection.outlook.com [52.101.43.131])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4e4c7kj3hq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 14 May 2026 03:34:10 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eDMhqTm7fMsCzaomDTga8FW6fFXYWWi2a7n7duOH2S8jquYFrNMZIvH/2QUdiW1yKkGhSvKIy/pZOxSZ0HCS+Ljo5jqjmTxAI7sM3wR4hgZF/t5kzog+phcO59KbfnoxJN1jfAOp7anWZiCZW6p7aJJj1lQ40Ak/O8mVVF3em+sg5YSM+wAOBKF4F+qxmOR/VmYwZJLcisL6adHaJuH55YyHOl44r5UIbxDJjY4j5npPAtPhEoISEH/vb4r2mt2Krd3RMw1ZaBnOLObrGXaRam1Hi9iRBfwjO/rxSi0SVmtP+rNIzKJmFRSSk4PFU2swChho/4Z6JTU5QTtM+OByLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XjrZlZ1jyZjT8bMeGRBSzptT+SIrqJf6Kep2B68bNYI=;
 b=GqUnYQ5ZJ6wKW6qre48zCxLfknEezCx0rtiMSZI66/eo31T4sCz/11i4OU1lod2Kb+M09Te5PCEKysTGHVTkUIx1an51jenzoKrRGdNFekXjTwRKACWIKdPriQaAhfv7TChwlY2pWqkTEbFMTjWV1WjPxogGHxl1cvIN2j8IUFLioeaOJmw+fU07ZHsR/9UvnN49QxToeq/uEixD2jxCZBjFq+B7LRkPKnnaJV1OezVTCxNYyAe6Jpn/e3xwRmkyjgi7w1MtCSb+wKdU56RLX0N8ux0MxIQ0SRE4tUzAj9Op0l2XFJ2w3TsgzbKMHgkcFeOOTF0KAtKS4NsLOveiBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XjrZlZ1jyZjT8bMeGRBSzptT+SIrqJf6Kep2B68bNYI=;
 b=ydMXOAN4eluoFaqDXW4R0P/Ik0cJV4QNIcMg8DohyJDRhoqbSwx2hA9b14mCIiYOikpRZVVem9jI9eA56kmxg34u3lmA8aK6pTQbZF5XtSjCuLc68El0NaU2GQzOsCTD39jaZTFPdVrt3wRfl4yE7e8SHBj12sHxc6mMpgQ2eVY=
Received: from MN0PR02CA0017.namprd02.prod.outlook.com (2603:10b6:208:530::35)
 by SJ4PPF1475727D3.namprd19.prod.outlook.com (2603:10b6:a0f:fc02::a0c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Thu, 14 May
 2026 08:34:06 +0000
Received: from BL02EPF00021F6C.namprd02.prod.outlook.com
 (2603:10b6:208:530:cafe::dd) by MN0PR02CA0017.outlook.office365.com
 (2603:10b6:208:530::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.18 via Frontend Transport; Thu, 14
 May 2026 08:34:06 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF00021F6C.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Thu, 14 May 2026 08:34:06 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 8FEFC406540;
	Thu, 14 May 2026 08:34:04 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 76D5B820244;
	Thu, 14 May 2026 08:34:04 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev, niranjan.hy@ti.com,
        shenghao-ding@ti.com, kevin-lu@ti.com, baojun.xu@ti.com, sen@ti.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: tac5xx2-sdw: Use new SoundWire enumeration helper
Date: Thu, 14 May 2026 09:33:58 +0100
Message-ID: <20260514083358.2559733-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6C:EE_|SJ4PPF1475727D3:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 121d1bf9-c5c2-434d-16b3-08deb1938fb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|61400799027|7416014|82310400026|376014|11063799003|18002099003|56012099003|16102099003|3023799003;
X-Microsoft-Antispam-Message-Info:
	wMwLPONvxvxy/zE6dcl2XngStAj2PZGSfCrsXYembyW1xU60vuiM9OoJVxyAFsv0amcv8Adbfm+062xIcKuchux3gaUULuS9gScrqCBO6MvI50hUOLGEGFKMDYjeUWmQ9lm9Pb4Kz1ATpNvbwF7G6RLpB3XIKmK7hTz3esJYaTucYFpmKh2dwtOURtmZndY+fW4ChSAYY1ox953wljY3+lGuERuf7YTNbSVt3vQu4V3V33BSiB/lTyV7l9ZQ/r3JJFkNIvc2M1wyOgAi+EVwIRvFnicCiSMoNYdMmw1caeJCF8Jmr1AS7wf/uzIXyrfu5huKWZ1SqzARj9YnQ5GIDsQ25Zg8xNbyhQy0Mnv0n/dcMSch0ufQ7khnXdutAjMStx2h4qTgoA7eQVUbSorxP4GYZcPcmeu1MoS2Y4hL3MtXLAxb2ebobzj8fNCTcaUkRnZ8VDedwe+ps3/mG7+v5SkcNdj0CNDMLBawoT8hovyHP3A3G3N39jLzNQt12uB0s5SNJ1KD/+SinPm5MhPkE7BegcA5AVv5VUEYDrYTsw1/rSuZVl963+wtTEV8EOnXtcaox10QRzhaVcko7DTqIDwAkvtsTAHg1GlrAyKwyGbco0ze2+/aebZRG8CXOwYxfgnLm1RoCBZwpx9F+o7IUO6aQu1F6oD4/O7b0XoSpmwQLc9mnUGob9EQsx1UENjO5h3ubOv+Lq227nTF115LGrSwP4jmKEZjnxduIfdv4rk=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(61400799027)(7416014)(82310400026)(376014)(11063799003)(18002099003)(56012099003)(16102099003)(3023799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/GQuquoSzSCtWQrI+jCp//X7+UAwn0dQNilZgiqVFnUczNFPwtvw0EGbi/8u3ZXDw2vIj6Oqud9s38dcr9McvwYF1ZNAFZ9UKvEGWilWoEgnn8it/keKUI1GKd/t2TcjE8xFRIHiQ0MQo3SC6U3oe64CC3NWoQ7MiGAEKjofZwElz12YfCfRPYRIFE/ZP60vnyfFR9LjWzl8GSTwMIadPFWgypVnpEOeYRLUMlNnhiKIl6w5LnksOWNfHOtHd8dnHrPSCo4Noax6WXUBrFazKpzzdyS8XhnR78j59KlsQJnizg3PgAcR5xIP6BoPkkAMH3G6bwrj4XFBYBV3JIu06egFb++KzQqv6SekO+JRj+Ql7T+lUSKouzQSs/wmamilOl7qBD/++oJZ17/DiZxD5OKzseMuYEojvcs6rsS0TDeKRhvcO71zrRk1FBpO5ys+
X-Exchange-RoutingPolicyChecked:
	ABcYP/De9CPeAiz/63p5497NboDjZKCRpXpuvhc8jWn0mz2mkp08SUQNa5JkDiUQtz/G990A1h8d65sjnCED2ywBtkY+m9kn5GWqBNvPj3h3HKIfjl0iAmoP1SSdY40vBOAmM9iI8C/6b4fHks5fhYuu/iOAh2Hhp7DIH7gSOWqoj2dPsn1jhdM44RyPxZ63e5CTjXHpBx+qW6gBCxKICKW6R0ugdgdkduLCx64dEefkrQxZ0RLuL7L7Uu9Q4LJOXRBtjSp1K0Zlv3fizCxRIDH/WRvnP/MZeBpny5uTU4azQKRufDkduELMtJvmCulLwEKuXqLkVnvGM0d60J2imQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 08:34:06.0262
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 121d1bf9-c5c2-434d-16b3-08deb1938fb2
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL02EPF00021F6C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ4PPF1475727D3
X-Authority-Analysis: v=2.4 cv=DZcnbPtW c=1 sm=1 tr=0 ts=6a058902 cx=c_pps
 a=WiodiXt0wH02q4ozJLtFAw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=sozttTNsAAAA:8 a=w1d2syhTAAAA:8 a=EDAJIHx08I8nOylshL8A:9
X-Proofpoint-GUID: Yji8KaObXwt0yz6_HcvkZzXlptpWr_Jg
X-Proofpoint-ORIG-GUID: Yji8KaObXwt0yz6_HcvkZzXlptpWr_Jg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDA4NCBTYWx0ZWRfXwf9JHf89Ifx2
 nqBIEx8/7wSZelN5kR7n7MKkqXApbfu3aPihl3yc3KvmOE5weJ7U/nMcZfkHfJmuz4PF3JDvr6C
 tXUdsoex5wE402pLSCp0ufu/MDo4kZ337iWOFvH8RIXtqAIGhaVLeeRuki5FirrSWA8CjiN4kjz
 jQuccjRwyb4yaR4YgqN+AWDkkBNqiY8TVZDu1q7qg/B0/pXDZY0iLtTnDCIM3zPjUmh3/hT86dI
 lmmnFphO4dmhqMf8LVoQjFq4UjWkZPrGWqibnOtcSWPj9PoNadgvGNGCdmBx2el4zjqM312vvVA
 iAITfRIPiC7Yi2nH7vDvPQd5RdVtEVBWEYjGYRmVMF/N3yTCWGMPkY2kbZqi5kQU7zsVjp3H5PY
 qES+eYKNZOOvLABsJGjDo+3uglo+osXumjHmqmI+oIlr0UpXJIphUdDw2s8cpauuZzLQ1NnIp9O
 9ih/NsCtrBNRrIU/IdQ==
X-Proofpoint-Spam-Reason: safe

Update the driver to use the new core helper that waits for the device
to enumerate on SoundWire and be initialised by the SoundWire core.

Suggested-by: Niranjan H Y <niranjan.hy@ti.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Add the missing update that was pointed out by Niranjan.

Thanks,
Charles

 sound/soc/codecs/tac5xx2-sdw.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/tac5xx2-sdw.c b/sound/soc/codecs/tac5xx2-sdw.c
index 917b36ac1cd3b..bb12cfb6da12b 100644
--- a/sound/soc/codecs/tac5xx2-sdw.c
+++ b/sound/soc/codecs/tac5xx2-sdw.c
@@ -1437,7 +1437,6 @@ static s32 tac5xx2_sdca_dev_resume(struct device *dev)
 {
 	struct tac5xx2_prv *tac_dev = dev_get_drvdata(dev);
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
-	unsigned long t;
 	int ret;
 
 	if (!tac_dev->first_hw_init_done) {
@@ -1445,19 +1444,10 @@ static s32 tac5xx2_sdca_dev_resume(struct device *dev)
 		return 0;
 	}
 
-	if (!slave->unattach_request)
-		goto regmap_sync;
-
-	t = wait_for_completion_timeout(&slave->initialization_complete,
-					msecs_to_jiffies(TAC5XX2_PROBE_TIMEOUT_MS));
-	if (!t) {
-		dev_err(&slave->dev, "resume: initialization timed out\n");
-		sdw_show_ping_status(slave->bus, true);
-		return -ETIMEDOUT;
-	}
-	slave->unattach_request = 0;
+	ret = sdw_slave_wait_for_init(slave, TAC5XX2_PROBE_TIMEOUT_MS);
+	if (ret)
+		return ret;
 
-regmap_sync:
 	regcache_cache_only(tac_dev->regmap, false);
 	regcache_mark_dirty(tac_dev->regmap);
 	ret = regcache_sync(tac_dev->regmap);
-- 
2.47.3

