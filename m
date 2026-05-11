Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4994D3FBEC6;
	Mon, 11 May 2026 14:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778508680; cv=fail; b=PmoO+jztaOQ1kFRjRbpjT9wMvBxV2a+9DqS9h0dspLjcVzLTmbRq+91RJj6sIIlqtfNpu1fNjGGnprmdpnr5XtZSzSiiYoV/2wcaPgx+IwBNmrqvdY3C5eOCUUeur3GvkS33+POFboIuxVRtPZ05S/w3ZIoHujeqx+pdfZ6B8ws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778508680; c=relaxed/simple;
	bh=VSDVVqDSu15Zwqlx3irW3Y/xPx8hvQRY3SS7GARKqoI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MC51KiU+MNM0R0NktLNPGsBFWlYUDJG4HFFhqiGy52jMSbL/DzWLj740vVHRQToOF0VioL2VNSSrge4HoT8rm9A5fDuUgjDhPTca6GS++Qhy7uO2AWGZMN+DFPjV+e+K3HKAi0aoELG11RQCG18JTcTo10R/UYsj3yC5di553eg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=q8NFXQcQ; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ntJllWIF; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="q8NFXQcQ";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ntJllWIF"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B5wUEI2685558;
	Mon, 11 May 2026 09:10:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=7OISf0PKZbD6du7SHib/SSVLTxZipkGnMKsACptDkiM=; b=
	q8NFXQcQgEc188SICJN1Q4X3ymqci/lGRWQRciFIzRYUV4U3DQz3m//DWGkNaG2k
	V7nsH8yKBARlzVKVy4el82PSTQ+30gtI0XkG5BNuGLglXWPAQThZ8fgsG7Em5BsR
	lJzYZHmcEUzqqqAnDBvTwIEPauYYpuHyCCU4++S3DwpaSq2jR0Zw4440Bvnnmd2H
	9ilHX9yWMgQxwJBMeuQD5/lGuIRUZbdyC1A5axoqjIhoeQLpk3JAQ9OYg+Y3Woa1
	eIbanvzhaEYOqRdjoKhfElOIJxqLTcCvSLKfV8O5iAC3dNdzSbIcbtSCfaF9MqcY
	hdGxJtiKQKmQKG64EeFVhQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021102.outbound.protection.outlook.com [52.101.52.102])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4e21bft8fc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 11 May 2026 09:10:39 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=giDFyRkmpLjHBy77gZTWHtkFFE/ih/xbho7bQKHMvUXdEYwSDCBBfWSnIgQx53HxtsVY4ydYr73EKhUpIhl6K2FOkyeiplAb2qNd4QyEb1NYwHwilrEUPoN0gSrWG6t235ob/CK/ImkcEOYl4sQ+yspAAshtC85defYU7ku1IX1HeInTZAYgRJj6uYRLTjQ3vZB9czmMFRrwxt8/9BpxOCyDPRJxDrQdkzOwGuOJNPam5qcVJrDYO9bF7iB1j28/s0Zs7zz+J+lo/nFtTQhTjjHl69hRW8niV5np1NnVK25e/mlAo5ezmpBdQZkHLC8dFbA6jfa8Dl7x4VXIoNALwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7OISf0PKZbD6du7SHib/SSVLTxZipkGnMKsACptDkiM=;
 b=pd2fTtBAoID+gcslWnOnq9E9QHZCJ7eDNtcAtIX/5aKdPW5uNYxndzWgZmUvKJwbpZVllg38NdcKlWLdb4kCNh+GZFR8g14CbfIrYdbqFIApafqrSyUmapvMLu2WCkWliNtJ2e1D+PX56MmlVPrTmklsYQXKrhaXhWWIleD8fMl8WhYVQk2IxPOli1WKQlRFAQleP3861B1IlczRQG0SLHU8GirdfRRmhFXEbPteDfSkpuvidFqAnIAFwaXqq/KSPTU/ST3kIOKL0OFEeMYHqTrEYiGswxjzUjkROxtT014sCqpl6+OaRiOXrJTc7aFVaawf0jMmyECab2OptNU8qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7OISf0PKZbD6du7SHib/SSVLTxZipkGnMKsACptDkiM=;
 b=ntJllWIFG2eNLEcsxkUUa8CerEItFyzkqQXtVMPp1nG01Au/lxuq5dBJNGrWBAha9O4vV5HQrYaQEnIUHpDPPXlrq7PUWS9xb8B61HBy/NhRN+XETLWp8uo5DB5WoG/PQBj6mACjmb1OpFwsmeqFbNBj5LP5Js8uvMGjSulWwdA=
Received: from BLAPR03CA0158.namprd03.prod.outlook.com (2603:10b6:208:32f::24)
 by SA3PR19MB9452.namprd19.prod.outlook.com (2603:10b6:806:494::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 14:10:36 +0000
Received: from BN3PEPF0000B36F.namprd21.prod.outlook.com
 (2603:10b6:208:32f:cafe::b4) by BLAPR03CA0158.outlook.office365.com
 (2603:10b6:208:32f::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Mon,
 11 May 2026 14:10:36 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B36F.mail.protection.outlook.com (10.167.243.166) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.3 via
 Frontend Transport; Mon, 11 May 2026 14:10:36 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 8DA7640655B;
	Mon, 11 May 2026 14:10:33 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 53F32822548;
	Mon, 11 May 2026 14:10:33 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v2 07/18] ASoC: rt711: Use new SoundWire enumeration helper
Date: Mon, 11 May 2026 15:10:18 +0100
Message-ID: <20260511141029.851125-8-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260511141029.851125-1-ckeepax@opensource.cirrus.com>
References: <20260511141029.851125-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36F:EE_|SA3PR19MB9452:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9e574b8d-fc5d-4bf4-9e42-08deaf6712a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|7416014|61400799027|11063799003|3023799003|56012099003|18002099003|16102099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	uRtvQZ2l4TVW3ZXLq0aRlcdUgUpCNqbTyqT4ZLf4jriMV2XN7+wyfcNxRtHlc7XELr1yOFjhPHHx71n3rL9bfg5oxpeiNOi4I+RsRVP6V+eWwICcaTns+J/NJrOD+lqcwXVHzd5chIjf9HRW1FjNQdG8p27P3ENK9KIGB0yTTprDdei33O1GZW67vT/iXzfxvUDkop2LmTcGIaLuRKnjXsqfc8yV+ACvEpteWz3z4Wd/LcHyXOuHzXbBM9tlAfbY9bgCmwI9QR4Qa+v/96tosaN/xiLCbqqB+RGP7+zk6nRtCbqNkvps48x59R7v+kUEhkxJntk0h4PQLLF+cUmG7M3k4aGr0BygPw8RE8pxmo/uqerV2xUO4r2j6VroSeG0sXfeXS32KI9g41WXkjnKgk/L2/yT+xcdlOoekVy2/zzyP0m3jKkjpjok87oJuIfdLl52aWi8RBPmfJDpUAf3NKaRU53/eBQvHgbwqCMDQ8reLBUEMagAMNeYI0FkTBwxpPbd9r6NQ/oRcI+25Lp7AUVVkWVTUFCVIOI1h+OCZHohv0fWIb5X8/iaGYrkQ4JIpI4XmBuU4UpY/7fGSWNVy9caWWgAzzUyoYZXu9esQChbn2+RLVY32H28e1X1QM1oO1C1Ui5hQXtXAhn1AXF0eqA9m42aY+oNcyRdrKHs6mvypQi1UxKIeLMjCqA6077eQSyxQKyhJa7bXVi2gTUYL7pTlGeUM6zMXAahrN5EVUU=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(7416014)(61400799027)(11063799003)(3023799003)(56012099003)(18002099003)(16102099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	b36LSDhfXtAf/Ov2TzF9MU9XKm5Damku4+CBLT/K9+lsp9GyxuofUUzBTsPI8GioHW1pToldwD/123r1A3ESt1d2e3uAx8xMT7J32zgj7s3HVReozVE/iIeKtD9S/AOSyZE4NvrtlPZAMPaAJw8x8ziD1JcdNTfPAqzjHggDLyJjFcS5mckmArVwISA1hDTX+olW59xZAEprhJCkfCTPRLhj/a6Fnd7zQ6cl+OhzTFegIjQTg4IxpElpdfFGRSt3BJzbNwO/3HLD51QHUM10zNSl97p0Gy1fAkuTnEXYhg2RZtnQboKGorKTE0u/sgRtneqw/dexXoR4664obM1rEbGoIuLM66CP2f1ocyiU8K4/+wL3++8HWABWvPbuiqFHYD6fFBlcRHmCnjZ66BV34/+Gb7CG3St7vQDvvN152HAX9Vbbe0dE5loejbR9cI7m
X-Exchange-RoutingPolicyChecked:
	Z+mCrZit867w1+aynEKRlw04p3GF4j72bboe6WWhbAvai51URqBk/w3Z9QyFrXhXmNIEHZ5RqfxOh7RKCvI2aMWRLB6m0TQQIXCdzLxqG8KRfMZETF8luNwA7KiWQeQnvLgh46fw8YLy94MfD3jsNYDSXcm2iszyEFJrxFAUSZexfZzSZdowdQtudyusny/H0ESj8qNiMMgsfF1iP96Rh2Y02cHh5dC+ewyqVIzYH1UtEbBcDTmBTNrPtgM26vCZSKhmGAKXEnjM79GWqjpp5aPQaFrt3QhUkwRwR4QyAlsv7tmnfNt9T//pHr5NRmu9kSGstARy/G8iYx7itQVicQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 14:10:36.0613
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e574b8d-fc5d-4bf4-9e42-08deaf6712a9
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B36F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR19MB9452
X-Authority-Analysis: v=2.4 cv=DYsnbPtW c=1 sm=1 tr=0 ts=6a01e35f cx=c_pps
 a=DtwdgGxVrw5JanCww5rNYw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=RuJZr_uWk9hIvXmwfU8A:9
X-Proofpoint-GUID: FuD1ypcWpRvh-xqDBL7i4ROdcAAtGQiO
X-Proofpoint-ORIG-GUID: FuD1ypcWpRvh-xqDBL7i4ROdcAAtGQiO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE1NyBTYWx0ZWRfX4PyoIuNr67MO
 YEbNip/71EjCBePbh2Tn7IeGsQKhf8zvgT2UAuNeyyEYQlCskXtEz93XI/i5a5N6zMUvBE37caD
 5WsQ57MG21vTzrt4wTLMpwqBaGYYzhunKvNl5h1ObCr7UBamVbfTNcM0aySACHyYTvaikoxeM+i
 7ZGi+m/V9FCs++9OBlaFwTToOnck3rsP6CJ/UMlNbhp2AlzVuvZNtPzbiDktcVSy/nr3z2mbtWh
 2FGq/2PyQQmv+oJcHLs89fMa4AumeYXHqVmJZx/sw8zUTW4nWbrYXmvv1MllkoNggUp2LjhZZ2j
 0xMs8AhB5QAi49oqd5/jZAyz+yZWTcBp7ohhgxHnMbCcsVKMseGQKqtead5btCGtlpwFQo3Em2U
 Gw2EExki2nmeeodgaoNKX4+YgzD84zu+p9N00Eti607VGNY8S5s+/eT7XtoeUrpZwzkLPzy9K4m
 L3XaFDF30pd0pjan9EA==
X-Proofpoint-Spam-Reason: safe

Update the driver to use the new core helper that waits for the device
to enumerate on SoundWire and be initialised by the SoundWire core.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v1.

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

