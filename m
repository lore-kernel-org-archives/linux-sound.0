Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931642E11C7;
	Tue, 12 May 2026 10:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778581912; cv=fail; b=gguEVEXN3z3f5CvFMtegzVQLPiTAF3WkXvUpGPuH/LnlQxHFhG18cFcZDDN1P8JPhzpNdY5VZ4Lhefgs6ZRNmlppaj28ZQL3pVJ9aFiKvhogzrZUArQaj6BRMEEDACEIC3Jf81fkFNRTrwM0AJK7vD7vu6NQF+6uWUyCRrcTMx4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778581912; c=relaxed/simple;
	bh=Wx7c1jW1lmbhOpLbZKQFYm2qSY6/xa3OweI3ZnrYMIM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nQzo6wlhw3uqnVzB7485jCDOIvKa1dErwAwF+z+fhAwmsT5BcCm8aavaSGYJZGLOnHPCTSXOaYHyrxwGsHnEq3A+p98yvJ7897cv/W8Ny5cZvYoPl3/ZiiW+xFkELJ1nnbMhQ1KNjh2OqBskc818Nlu28hd8RnM/tqU9xPgsr1c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=n+8/Rbwd; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=TBggfT4W; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="n+8/Rbwd";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="TBggfT4W"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C4hpnt1493060;
	Tue, 12 May 2026 05:31:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=9Z1sL/XrEvVvC0/hQWflIwvy0qtyTmlS5wJCWpNJoL4=; b=
	n+8/RbwdVBzhCS4O6JbRXHQTOZ+6wcT0VSl3P1T8SL3acpXt3Wr7VlMInPy6yhME
	XkjQ4ROhszNj4z+ONjHYiIQM+lIlqeEpKQYpKmJ8aYWWUAm4v7hF4XV761Lap+uS
	CuG5iKD8hb2nfeX5jGjmp93Y0mLsOcFkzFeAUDVp0RDbwIUy9PdWkD/tLYJWEWR7
	jNSTqNgfrqnkCoXKPjqTYp78uupgPczKqd5SUtgkhUIndIFAGDm5of/6UFGVNQaT
	+yspFp8OKJW0HMGPWdb+ZRZlalhfDAV+OSErDdG/3mGuomiZioI/nwo4072MiGhw
	4oOlHLPTJUDe/Y2HZrFQfw==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020078.outbound.protection.outlook.com [52.101.61.78])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4e3nw58r80-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 12 May 2026 05:31:11 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V9MoCz0PlILSl78dWU7X4YExjwyPhYqb75P7uoYb0L7cBdwLP77FmBGTqzYp46xziW29APETxY6+fuYy9YtQMCRPna42nv+wY6ZKk3AQoXP1+1sF1PJRayI5FE3ikzKfbF/zylMQoyVCsGu7nSRSXas+07DMPX5Iv1/jihrRwosmBdWIrHlnNiAQ8wo7ve0R/IabtNpjTmpxank8nRpS5iSMA+dRzbDbkq8BfuKFJyHvBDYgK2oeuJ0MxLm/GPTNp9PGjYfEWbY3VxCie+SIBtbqgOysE74LXYiWBxlKa3piKrXTYXnpPnWoM2Thik+rRALB55mXO6pFJu2JC132ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Z1sL/XrEvVvC0/hQWflIwvy0qtyTmlS5wJCWpNJoL4=;
 b=UGgLv56d2XVhbhhZSOpSzNaP8SbqlpDRR+cvlfdrr6p6N+GHmdjp3dZATBQoQXZiJRRNjYYD+28ovyDR2qfiYRJJHWnzJnIMvdazOSJ+Rlhrfe4pU959poWNYJFDv/tpiusMPCISkfF8aK+gSk2R/V0wvU84T1a7UxGHwWfEvehi6szQnyVcZvUy2tSL1OVEiPXugHTIC7BOHdkEa0XNdXObydx4dbi/orBCWdoGdrw1dcDrPtwUNMR/S3oBouybNDR6WEp+JmZGK01IvMWFy3N9G7Y5jwbRQ1hKsrisUOh0JJKgKQZZ64hLSHUg3aQ2Z0kzPwnz3BrkP7ejsARN7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Z1sL/XrEvVvC0/hQWflIwvy0qtyTmlS5wJCWpNJoL4=;
 b=TBggfT4WsdHb9sYx5DgdbkRQrR92Seq69mT/hp8zsWli+gT3uP9aAMW/5pZsQEbnxOkvQ3gnVelR9i9hsZcj1VJzvW1/eH/u1l75MssL5WGhSvvoFPloaNHM6AT8Y42ZTyXtHDPaUpfO/LbtdsBeaRXB/PRI5iy8hc/El5g/Nko=
Received: from BN9PR03CA0058.namprd03.prod.outlook.com (2603:10b6:408:fb::33)
 by SJ4PPF941707AB5.namprd19.prod.outlook.com (2603:10b6:a0f:fc02::a3f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 10:31:04 +0000
Received: from BN3PEPF0000B077.namprd04.prod.outlook.com
 (2603:10b6:408:fb:cafe::be) by BN9PR03CA0058.outlook.office365.com
 (2603:10b6:408:fb::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Tue,
 12 May 2026 10:31:03 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B077.mail.protection.outlook.com (10.167.243.122) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Tue, 12 May 2026 10:31:03 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 7B440406559;
	Tue, 12 May 2026 10:31:02 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 4444E820244;
	Tue, 12 May 2026 10:31:02 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v4 04/18] ASoC: max98363: Use new SoundWire enumeration helper
Date: Tue, 12 May 2026 11:30:08 +0100
Message-ID: <20260512103022.1154645-5-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B077:EE_|SJ4PPF941707AB5:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b409b301-58a9-4f6b-5443-08deb0119191
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|61400799027|82310400026|7416014|376014|11063799003|56012099003|22082099003|16102099003|18002099003|3023799003;
X-Microsoft-Antispam-Message-Info:
	XtZuOEaQ88MFSokDEKFxr0Ukrd1qvk6O3pOWI/slTC6wepYOrHTQAZqSrGz/paXDAC2W0CQ8w6VMZ1FcYKu0OrIZzzRaZr7L3veTAZLQApvlX5LA6RXmrLk0Luq9zRc6ESWGVUUDb5g2BtmeBM+5p/ueyrCdTZM3gRIeKo2dCZH+hX94VnnCenbwM7H8bpxvCYEw9UEjMWpdD4nay7Aq1/NJc42dSV2aMmU9KEfMHTQ0mTfe+NBqSHJTylEydTwnNLVHqxuWTuaW+3J5Mtw/a2Pp3cBNMd/eQ8j/kYc+5lPdwGfLHyIMR1ZVEYHpBIODbG5qrqedFI5gGc7tDWjlk5QrgKrbY6FnDYpeuB3/QmHXqEOSF/tKKYa2+t371+g9biB1wtpiervqlG22dNdTy59jbwsPtNH895s7d2SxNW5UrhwRsraX1pTNsR2W1Efoak/Lc4K+Pi7uLYIuIYjUkjUJLJv4DeoJCkXN+mmpRFU1JXrdcmSiJO/w6rVJmIZ/RetrWo5q9AKVZzujhHqzUSPvr7yIOLxIFwNhaYSmT76oRfxxmIbvaz1QJjQo1FpWHggAc/VcZ9bubndmIrNxDLRx6sT/udpeFEtdKKhsVMz6fyNCfhciSOux2qJl7Va/mqXembsRuVGqnPy9lF2GBaz0f5tREdgQUeoonw61UwzKHb9bVQtorpKDCK/H5L2Mg34fhZ5ZqPZ7HlKrpfhmdV+KP1HwL1E6eNzeeaHeQp0=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(61400799027)(82310400026)(7416014)(376014)(11063799003)(56012099003)(22082099003)(16102099003)(18002099003)(3023799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lDY6kmBHI1fDZrKq2LZOLumVBrln1SzOH9jf5qs8m0RmBWnJjqfnpLRJifolJURRwAean+MG4HnbC6lkDx0FB/BVQ7cDbtPFkDJKSj56+JIJxNFlRyWFFlSt5PiD088QE0QT0N3FQPHEeFHpopcoeOWX00V7ZlZC6fnxsIJPYHyVteMNjOiXtRfwHfpG08nnvlaZ2JVDUGgysMLExamCs92gMKd2mvv9pfk4M2Wi5UfyWPpu7CrDrQs0baP9i04ViSkwkMjngDDDWavIyH5QsFRHqG02XI2clr0oFFWu39BZ2IiYyvHjM3KWC/tsj88TSTr4z5jX8bSwM/pmr6xDp9BWsd5lIHcqru9UGa+lNsExqRdfhXL/Jatc03zuS8H9gxZZCH3VQFHSoOnZr9XUAV5Lf9FzG1cVIXsylWTUg3oDXTnpRekmNXOluHaya/ds
X-Exchange-RoutingPolicyChecked:
	ZNLwJoZdaTdl15/BGc4wUnc1MfYxL+RixuyAC26u3GcF0E1evuDd86JeC2Vz6mXdFmLihDXeriw2IL3/1R3nJ2XZ3w39y/rAxqwSf4244xUdsv6ynwJXWOefzM6W9pDmr94QFFPXgwnuOxFr2WGeVpJgEfxtTHDlO8c+F3o8XwkkttQCqBs21XWXYgV5qs73ewNjU5igGAOTCj/ycg1bPUNnC5s1XacyiwUlLGNZHJdTwWXeTYtT9SocH/73msLncLuOc+KQvESbGGVgaFP0GkFSZdi/BxgrkJJ8TpNPFoS0yVUPQvsYt/Xllr9Ks+81xA30PnK8BkwYkIr4TQ2b8Q==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 10:31:03.4084
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b409b301-58a9-4f6b-5443-08deb0119191
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B077.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ4PPF941707AB5
X-Proofpoint-GUID: UoOyS5WIg7DhDd78UNQzXkSQym5i0ClN
X-Proofpoint-ORIG-GUID: UoOyS5WIg7DhDd78UNQzXkSQym5i0ClN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEwOCBTYWx0ZWRfXyXiG9FxislBE
 SIZb9VXjVTnYexkUsnBydRmAq++3lMcnBfoFnPEYI4avwZcYzWtNUKdpJgtJFVGdDF5mKzIbtBT
 YrRayqUPZi+mPSDsCsRYzWnvAJ/AQ0TdW9plAVDzfzPQLQixyIuTN6XfwTynsdhkbSkqZB6bjmC
 qAvuOkZPK9NFbpg+hq5u3e3+ucDQ65KyvllTrQZ4WYZzfPL2dd4vIjLl7tl1Y3cFQhh34RCDz1V
 BCa9cf2ldP0rYnWzH2nUJoSE3bi38D/S/IRD8XiDzGLfqZ3r+bpVu+/GONQc7Zyq/cNhL4v6xD8
 rlJsvimmGPwsX60In4N/okcTimLZs/7nywSNcpkty2DrdhZlLazqB9KbXXQcu3c6iXMOPFeQwRj
 f7eGq/nhdJjtTm4OR6zFfI5wHjDabDqOq97EWNi+vIuGalOL2Kmes2H5pdr/9qyinP5BJHWV34/
 yZG57ewbq6HekSrt/DA==
X-Authority-Analysis: v=2.4 cv=KsJ9H2WN c=1 sm=1 tr=0 ts=6a03016f cx=c_pps
 a=qgEGzIGkZH4qQFF7vfwnSQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=_kLIPOSdNJ7StitxxVsA:9
X-Proofpoint-Spam-Reason: safe

Update the driver to use the new core helper that waits for the device
to enumerate on SoundWire and be initialised by the SoundWire core.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v3.

 sound/soc/codecs/max98363.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/max98363.c b/sound/soc/codecs/max98363.c
index 25af78ab30d5c..099dc5bf6195f 100644
--- a/sound/soc/codecs/max98363.c
+++ b/sound/soc/codecs/max98363.c
@@ -90,24 +90,15 @@ static int max98363_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct max98363_priv *max98363 = dev_get_drvdata(dev);
-	unsigned long time;
+	int ret;
 
 	if (!max98363->first_hw_init)
 		return 0;
 
-	if (!slave->unattach_request)
-		goto regmap_sync;
-
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-					   msecs_to_jiffies(MAX98363_PROBE_TIMEOUT));
-	if (!time) {
-		dev_err(dev, "Initialization not complete, timed out\n");
-		return -ETIMEDOUT;
-	}
-
-regmap_sync:
+	ret = sdw_slave_wait_for_init(slave, MAX98363_PROBE_TIMEOUT);
+	if (ret)
+		return ret;
 
-	slave->unattach_request = 0;
 	regcache_cache_only(max98363->regmap, false);
 	regcache_sync(max98363->regmap);
 
-- 
2.47.3

