Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECA94D8DA4;
	Tue, 12 May 2026 10:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778580877; cv=fail; b=LAtYaSLIJ+Bvg7NQ+0AOCc6AQJ/sRQLRC8Kf0dqYoTeN9IFcOUjRfeEnLrSQ4hBK5zs3Kgfe+HDMH1jo46XPHdaetGliiJQ0NF9K/nLu0q+XxF1xiMHtnFCBTja1mdLQNdHi6bFKwuptJb+cE41vwGACcaQrwyAJZaz8/kfEa4w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778580877; c=relaxed/simple;
	bh=F3nactjm6AyTBndyuz+kFpexvPwEx7C50u/T+aJesH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k1eian6HtCY59k/nhYp0ZRcxMjx0VWamcvaFH4rewfLYQeV2NY47RyNmeLZO7urJ/0ODcgn+OtD6dMbFqyTAM+8QKLkJRCfdxdTYGuST/Fe+tm+3LZN53a6O+/zoqu7K2vSfBUfUohvaUscf7ifDPowX/H+tBLV08nFPrqHZsNg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=RWT78qTP; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=XRhk5Lre; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="RWT78qTP";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="XRhk5Lre"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C7N6B01750921;
	Tue, 12 May 2026 05:14:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=UvWTIKJEDIeEeLhvz7/1Pyotkq3jQOJvAe+mnEIrPzA=; b=
	RWT78qTP7I1EggKNzmFvanCjoQUFLOGJZW3DGiFQJAbYvIAVNG3q36HjPYBIM4vI
	2lJPL+PH6TW6KkYHSMN8kX7RvsZFWug3hRNe3Ol/vOBo6htvurqT3YjkQ0E7N1sK
	vWAP2C95DJlcazpRj6CzN0jJiJw+7nxdjCTemhA57Ico8ABr3ToTxfq6N/o+5zVL
	Kj8lY2FGGcnBEDxS1nlFCN9EtIK1AN2EKX1ppsD+yP1zEanhpuQmUiJuexJnqAqK
	PqV/iz19yt+vLrx48rxDFP8v2WQ1krB/rptWctc7Rb7J44jSRgbCdMlxWuSO7iBK
	THhdWmL4VBJDDM4lNxfaoA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021133.outbound.protection.outlook.com [52.101.52.133])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4e3nw58q8f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 12 May 2026 05:14:00 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pWlIf8uCtMEK3FmULd7NIl3RKmoU74BL5DQEiuW1k5Nn4XO5StKOeRXUZdMsPcBfRIFRHv9034rpwY6iAnaDnqTtjYmVKIyQWJr2UvcQ9Q9GCwtxCINQOumnpxEhO2vcipfh7zU/CLjYNqzmt7IdY5oV1eQZDvQZ/q3spqIMeZ36fdMUt67VMZLlb9SsRo5Y5HAWU8nqHxiUUCSBZe06klkVUEh2Una54yA3+yTMbQ+HLLAurH9XSseF8pZGkE5MEwD6A4hblqn6U8DRls2s8ObE3xdIkdy0WjTIjL2RaRNmpE6dEfo9KsYouvH3nnXGDC4rF/LQCETL7utM9PAKww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UvWTIKJEDIeEeLhvz7/1Pyotkq3jQOJvAe+mnEIrPzA=;
 b=HEuRzeip9oZ0j8KE+4IhbBuwzED4J6CVV4G2g2Z7aAaUGJS5h1U/FBtNUcad/D0fa61n+1A4SbHVaCZCiHQourENOFfUspJzUUdHz5BnQ1iRQW7790cw5aq/dTW+tNkB8z4OvxdY488fx0mkTHd/8bumFh8cIKSsUUCYAUJy7v70BxvMxXcO1IOL2YidYuYLXGzYquikdEq6bB7qBcfCnBr35ae1Bdq4miiCaTYiW1uWp93lcCL6EMFTDO4KzuBfpJG6rjQVA5wq2QMYGZOxtyOSq3/sAK3terXbUQGNd9ijnZC+pxKmKkhkzAXuqhplnlE8na7HgOkgts+kT38N/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UvWTIKJEDIeEeLhvz7/1Pyotkq3jQOJvAe+mnEIrPzA=;
 b=XRhk5LreNj8Kzuzl/pF9JJDGw+f8+GrfnaY6EM1rIz92x/kjw45CZX8pnb9u2VpFDeXuEwzwoqfN/Riyd0Ja5qvOF3wR0xRnlwYLjhX71WuYVKpsFQwBP4ZMxuyvZETlmPi+r61FntPSqM4OJ9+xN5iJixKYxJ5ba+BWHCJ6Uec=
Received: from PH8P222CA0014.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:2d7::20)
 by PH8PR19MB6620.namprd19.prod.outlook.com (2603:10b6:510:1cf::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Tue, 12 May
 2026 10:13:56 +0000
Received: from SA2PEPF00003F67.namprd04.prod.outlook.com
 (2603:10b6:510:2d7:cafe::96) by PH8P222CA0014.outlook.office365.com
 (2603:10b6:510:2d7::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Tue,
 12 May 2026 10:13:56 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF00003F67.mail.protection.outlook.com (10.167.248.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Tue, 12 May 2026 10:13:55 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D62B640655F;
	Tue, 12 May 2026 10:13:51 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B80D882254E;
	Tue, 12 May 2026 10:13:51 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v3 10/18] ASoc: rt721: Use new SoundWire enumeration helper
Date: Tue, 12 May 2026 11:13:40 +0100
Message-ID: <20260512101348.1138044-11-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F67:EE_|PH8PR19MB6620:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b9b2bc3c-1392-407f-e92a-08deb00f2cc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|7416014|376014|36860700016|82310400026|11063799003|3023799003|56012099003|16102099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	iZN14U8IykHTJzpKZjc8x8CIwnicIYCBvCcxllqJ6qPapW1PV/XhFOffft3UWvGyc7bEu+bsAdq2f/EG3vcvhgvdDrRhbbKt8llCmZELaWasb3fB9+AzGAmxbLI7hYja7B/JkmBQN0mlqS0dXtQtdhhF44m8z4yZwIS+d4wPTSvo90W7NuVa8YEE/Cx/1ZbFiRenZ4ALkl6J0d6PBuyJUY8eT7tIDFo5xaC8YYpcCUP2MG5DIV6N77ufu207ejagOpLG80qJMRVA+w5DQ1LhQMKZNS1RXOi44FenvVVMEMvG+K8Xt4zsj3kbKyPnzcBjEHc51bnFDtUbZxn0KgNPnbe+EsQy4gQ+FrCqXPvgXVQu/1HaW8V+4ntdsrpkBY/fZ4LMp7lQa06Efl2Rk+cJijtd1p2UfNOZEGjL4p+KdEI4ZZu1+bjt3mGP3b1r/wnNr4bwaFCcleff91yiVKUadokT5dB5TW0PV+YWrP7CKcKJRO6xDZ4olQM1WSK/tXVHniQkMJlOGCd36Isj1SWW2zS80ppl6l+X/rvPtdJ6KG9+Jr+pisjb1VgYqkChQmAnSB4bS7FzPWcwa3Zbd9JogRFdS5k5xPqhZfHPbzcsJXuqXk5r0/L3VQUVcrAWjyphzpM5KAoLAybC7nN0Ln1XyqDHQnp9AWz5hxbdYOf7ZShgjK1N3HMA6P8IGWfzV/Pd+JckA9Cw+JzelAyAEcATVCptM59pGj+sw5d1plraMJY=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(7416014)(376014)(36860700016)(82310400026)(11063799003)(3023799003)(56012099003)(16102099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XfmBHwl6PCsn5ZcrZJbzuh2Glgq8laXkyagaIoFRyQ7o1ShosG6+/GrjTTe3Iqz7ycSJBJkaqlkNVF3TvQGPnWrSGihpjsb+kVDZaJOWbRcGQDtZBs4t8Ze0MrReARfOKgnU3yPrvHVvFjq6bcK7ulTxU0R1rTDdeYNHC2VFTJU+TlCwbsL2jpiJ7zk/4hDZobD71+L4XGzaWDpvu1D6KR1JTh12SKnOoM0v9ZwzpyhQgfXULpQ1XEtgIBajGQivv6YQK0AAOx9+YBsWsqMMgTy+Tf90lxOLGMTryFUPASy8hnPue3YVRwAeNKX/l00gNVJRN5zmwTirfA2KSaiFDDlie+NxTTsf7KBllu5l9irLd66AS+87uGoXjrN5PNZzBfpeSh6S1e8rw7L20FAIp0xqOzxzIT7+fvdPWEWMWHJidoMqwS60nbH92LEMAMV4
X-Exchange-RoutingPolicyChecked:
	kiHhM/3+D4UJxB6wjNDiTjGgCt4DLpX9IkN7YwFjIIWQfoeWzcQ9+Ol1CVD9Pn5wMpYbX5oHCAHjY7chMBwVLGTAZEx+H4t50NcYuEWSFzNo3l6pp5cfAh4q8OgeqAVlZ2+/Oj695f5j/m1f2boqOq02PPF+Di42/I+72+/RJvAW+qQpk5xJHhcVz5F28zNub52V2SXZq8yh0A+SeEhHg802RXnPWx37UhWoOUf/34t4IwS7gNGLrgPomc/fzVxZqgO71YPeokDPS89sJ/mvJKh2wvbtWB3zZkxkE3xfh1GHGBDU2SWperBOxoYH18aCwYpGidGC+MD1oEB+9f4S+A==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 10:13:55.2828
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9b2bc3c-1392-407f-e92a-08deb00f2cc8
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00003F67.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR19MB6620
X-Proofpoint-GUID: asnBRGvQQSvP1miYF6UuhPi14atAshkt
X-Proofpoint-ORIG-GUID: asnBRGvQQSvP1miYF6UuhPi14atAshkt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEwNSBTYWx0ZWRfX5rYmyD8rs6Ka
 sdDZe+RhECIkAKLk0yzJlRktAUh/O4t2FlGf+Ndxg5E8Q2i2kIjfROFpLjkzpfvyOY0KHCS/KM4
 w9HpMQ6IJcdjSdPpSka4GlkzjDbJVTJLYM38Q0BOvpA45psnZ3vD+pnK/h6RQC35dgBzd6ExF8K
 QdpRqqec7MuORtE/gup71PuUnxSRffSJZNPoXJ8DiJ6NyoPXBhMAFSkReINxlKhpkMDnS5upfcs
 63lnKkj4Z4Q/NrByZIuzQWmrJoK0KOKFM04FUJi44dtEyufC27ch/p++jAKiDdcSjgsmq8WGKyC
 NV43oLjzBx6Z4sVG5vkXGFTieop4eqHeU50p/BCM/jN64fz25iNnoc1NMC9Eb9bzGVjQIgOdp9l
 SwFymRd/f+XqkbpPDR822CAjoBoKZnEplz+8wfrqiscPY47GoeAcsOkWDnD+JjgUGRNBWhZwEYl
 2/Mkk73v6N0EebYN68w==
X-Authority-Analysis: v=2.4 cv=KsJ9H2WN c=1 sm=1 tr=0 ts=6a02fd68 cx=c_pps
 a=zQVrRFDx79pk1Kc/J51lMQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
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

 sound/soc/codecs/rt721-sdca-sdw.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/rt721-sdca-sdw.c b/sound/soc/codecs/rt721-sdca-sdw.c
index 6eb8512975b85..58606209316a4 100644
--- a/sound/soc/codecs/rt721-sdca-sdw.c
+++ b/sound/soc/codecs/rt721-sdca-sdw.c
@@ -489,7 +489,7 @@ static int rt721_sdca_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt721_sdca_priv *rt721 = dev_get_drvdata(dev);
-	unsigned long time;
+	int ret;
 
 	if (!rt721->first_hw_init)
 		return 0;
@@ -502,20 +502,12 @@ static int rt721_sdca_dev_resume(struct device *dev)
 			rt721->disable_irq = false;
 		}
 		mutex_unlock(&rt721->disable_irq_lock);
-		goto regmap_sync;
 	}
 
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-				msecs_to_jiffies(RT721_PROBE_TIMEOUT));
-	if (!time) {
-		dev_err(&slave->dev, "Initialization not complete, timed out\n");
-		sdw_show_ping_status(slave->bus, true);
+	ret = sdw_slave_wait_for_init(slave, RT721_PROBE_TIMEOUT);
+	if (ret)
+		return ret;
 
-		return -ETIMEDOUT;
-	}
-
-regmap_sync:
-	slave->unattach_request = 0;
 	regcache_cache_only(rt721->regmap, false);
 	regcache_sync(rt721->regmap);
 	regcache_cache_only(rt721->mbq_regmap, false);
-- 
2.47.3

