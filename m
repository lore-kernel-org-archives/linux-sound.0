Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5724C9540;
	Tue, 12 May 2026 10:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778580872; cv=fail; b=kkjfH97G+W/RP2XGDQ5/arh6T+AFvza9mvzbmbJSWCAC4rmgJ8lMjxcFkdRoLGdPcFPxAkMx6rQH3aYF3QkDbVm8TT0uoTJAHJBpCk8aAi17Dk2Kd77uczy7qW0BU2LhssUHdgVdc0sZrOKfEsMkSxO9ua206pepyyduLAOyLqc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778580872; c=relaxed/simple;
	bh=4DoGhGaDZdgSIw78IoFTjauHe3a2wLcWp9S/KiqEoIs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uHxkTTo2JgNNGvHswZHxDGH5HwLjyKVw5foC/yWXBBxAmDaqQA2ucDNhNowKcl41+VbkHGfF9VhZqBu+ZpVYcRjIXeIc7UY4GQOJ4CA0xXgexMosCbFSBTVrdWCd5CmuaUDABFBNKrIWxnrDS2Br6guB8Hkewl8FUTMNuugwQkY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=PnzYn0nx; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=wmYrZiWY; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="PnzYn0nx";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="wmYrZiWY"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C5x1Gl900775;
	Tue, 12 May 2026 05:14:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=eVZf20DcthkGJjhKTg/5EWtkpegOLLG2vmUONp2DKx0=; b=
	PnzYn0nxf6F4Qzkj/4BeFL75+aeWEv2rJUch3Y7+dLcKCrbzw1AH21KyguzAmgnL
	78Mx7T4w4i2tW5hdHheveplfO6IMnyx3fySoIs3v6I+LSKQtLINahpqv7o7lfCYs
	5QZVzpBFkE5DOAVMv507ZV7DQDMtxWzIs50nc2Y7nkLStdfulGA+nFkGpnbk2ch3
	mRBSpMaXihQp96IcgICA7VlXP9gLNvRcufAsOVZhT2led+Q874MrOL6QklhIPi3i
	asPRvZbY/Ph1RRBJsc9WIwS4UMnB4vmxs5aWEkHZU0Peg0+B53Tcb3m01mAS9lan
	XGa9aAjfB9/a85hOCWTr9g==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021115.outbound.protection.outlook.com [52.101.52.115])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4e3nvvgq6y-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 12 May 2026 05:14:04 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O9m/ysjIgyjjnrTVZ5FjEevc9TKffqE/DXgefu1noEHNM7GNWJWG1Ro6Tf5VJnZEz2fkWipM+obxM5jd6doeHZossr3U+OQmHunyX/PYaAJM+nOwLHO7HtuRpxmMLudmK8bSKW2vUDr9S0hrG4AvXZRNGdg9aPgVe3/ckpMPcgxOlXwV922kRIx50hoYajidirnXtVdwlL5dov9PTeyesMvJTSSBgOKs03WKlv19Ktrkmihkc9EKuid9O4WkCTprCnqjVUlbCazfnDzF3Jegm8XFLkZQhB31jcCUkjmqK8Jw3O74xbNKPmgu6O6GRr7rpXBazEY+9cTATkdJ6cUYSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eVZf20DcthkGJjhKTg/5EWtkpegOLLG2vmUONp2DKx0=;
 b=GAGoVX/wv05fgpLaI+/77giC/e5Y80mznJjIsOWsiMyvvobL9jfLoN5zyOt7tNU0YYuLyL92fB0U1ygv4HNWEMeKX8/QIQhjyjeGyDsBlj2jo+Zzxv0+D3tr6xnE9U3G5dvixuJcKjfCcybUzGPNd3AkkY1cyJ4ZX4eg6CvapH+m0/07yhYLtrNMJz4KnyK2PIQKNgKgPwj19VDooTVb+a+6jl8y0AiNtNFLonp6HmnGPkc6LbZXsT6WMcIHM38kCVsZyT/8fpmhEA/wqfknDPt5bqQKmWpUi++VnPsG8TigLipmLl38zuu58AqnmtMKKbobtmsqOAeTKVNNAMJRmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eVZf20DcthkGJjhKTg/5EWtkpegOLLG2vmUONp2DKx0=;
 b=wmYrZiWY8ct5q3tcH21dfkE07aqGFqN0EI38Wbr7T5wynFF/E9s1BXfbzqEPp/gjUHFSifLJ12HppOEYLJyMEOqcojrou6/KpGuMG6rEFtKdJUgEZ/UEAJCGVMhGojV3++eF2uEnlVTaApcQMKuLhI+mi7H4Y8TPpIy2yuyr/8Y=
Received: from BN1PR14CA0013.namprd14.prod.outlook.com (2603:10b6:408:e3::18)
 by LV2PR19MB5840.namprd19.prod.outlook.com (2603:10b6:408:172::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 10:13:54 +0000
Received: from BN2PEPF000055E0.namprd21.prod.outlook.com
 (2603:10b6:408:e3:cafe::33) by BN1PR14CA0013.outlook.office365.com
 (2603:10b6:408:e3::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Tue,
 12 May 2026 10:13:54 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF000055E0.mail.protection.outlook.com (10.167.245.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.3 via
 Frontend Transport; Tue, 12 May 2026 10:13:54 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D055B40655D;
	Tue, 12 May 2026 10:13:51 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B05A2820244;
	Tue, 12 May 2026 10:13:51 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v3 08/18] ASoC: rt712: Use new SoundWire enumeration helper
Date: Tue, 12 May 2026 11:13:38 +0100
Message-ID: <20260512101348.1138044-9-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E0:EE_|LV2PR19MB5840:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2a2659a6-eade-4ad5-9ca3-08deb00f2c46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|61400799027|7416014|376014|11063799003|3023799003|56012099003|22082099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	F3eJxDRGoZIKen73QMsYrEy70r3voMfEaP01SC47xOoMP8pmwOK0PtZ7ump8iCF2FpqEcfaIuFacoq6L327Uo5f+f3tdTWmEoGU9BYo+SDJZSuq/JliWYVEg0/+FhPo2g+jgT4/owRTBg3PJ05TfcpPwCPPcs7hgJHcw/aZA6Pe122JAEA4JoQunO74JEcRr9a3VTmuOp3sITm0dNwbXwA08AsHwbOnGllzEpKc90i0ypRtK2mbu4KD2PAs1V4ZSoqEpT3u6Vr4irMGHv01fS1i2jh8K6JtUu3rbpC/92yAdeoCaMn3Uuv/JKoBtxVk+x5w/0i7CcehWZoHzbuA/WO85YmM0C1IM4+ajES/Hon/6ZrPv46qPWVpzWCYShi+lk0JCXbAjkyqarLIwLS+NY2WH7t2k4McjD3eR6bBNJu9siDdew+MV9CpPdWaJwHEuZQNmCKJaY6In+9MEVc7EvkUIy2xdH4/bHNj6LoeYtHZJZLCHXYKFIejtvDk0XHxgOrKmKZCWx8mOK/FojY+KkdkOjGU6lFLvtutZMePYmGs7grUWHOJus5/60NGSNZ0ofR8TPzdrq7olTn4pktNzXR241WmzZhxdi2T17DREwKCHq8q1ZEC5S6yQRb5w3qMgxm8xXRr6qj3IibM1IuSaWHhJmJaLCKH3DjfivgnxXMrwtyLkGIjUL8jiMfTPQHAb2aNYBHKgo3DENEGKeR5zQY/G+bA1drB+zWH9Nyo1xXU=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(61400799027)(7416014)(376014)(11063799003)(3023799003)(56012099003)(22082099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RUaQpGCcPR2UB0ScINRpDcnua7nrXgT0Pef73TaBKih2aPdC2jQEYrUMaqdk7KbiU1vEEyhjxy926sLyPIlfV2FqHBIZfq0rwRfQvka8ue8fN6yp4iu/4kb4hL5iPn6TI8RbCcCm0EnH9tHySamOH7gdrFmLqoaN+YMbtUXOVlACLFOVgvKOk82ilDgvA3ZNeRLlSymxHC09c5r5FOfzRtGD49zrXBjPd3zyjFoAlwUX5shE9xodami5aPZE2Xu7YrcowRX3WPiszn7NY+bL6yF2E6hmgaYXw4f9Qph0MvsMRj5zCvtlOyK0TX6o+h4B2yhMZWNHGmx7TfZ/H6v7Ba1fjLxjjqFhEVwCb+JQgIWNKgqLMl02kvx7A0c8D+yBroa8sz/xNkMKXFNikDH/vJxk8gr3+JzgJnZ/UZIwMUTkmInCQ3qFSz4NpaOispgD
X-Exchange-RoutingPolicyChecked:
	vpQYiejO2pts3UAtdLt32LkgL7Z8+zsxLObCVdEATNKdqqZncM3GDbMNIFkXHo6ULbycPApjo6akb/FgDEXyHC6gQt6t/sVex9KFgv3FN7v8/p65gtN0e2R6ezgLizfklig4AwGBSRfuY5FxNwD83g36uG5IHw1rrvSyXfbrKhfl6co7xK9oC8p+wkCPKCfA9tRHZRi3bMs/+ydiBSmodbSET5jXiOd6QTooWcrfSWUXV0ZPZbC4Nzm9XjK8hQmxNu9tj7CcXvWJ97AWoAEE9QMiy+Z5f/NI678Cz5QYzm0IH3ox33XtwTyd7ya34LXjaW3ZkksqT+y2Ncf3EucpvQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 10:13:54.4883
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a2659a6-eade-4ad5-9ca3-08deb00f2c46
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF000055E0.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR19MB5840
X-Proofpoint-ORIG-GUID: VyMAI6MzvshmAdhw8qqEwiytlCW2sGDd
X-Authority-Analysis: v=2.4 cv=CdY4Irrl c=1 sm=1 tr=0 ts=6a02fd6c cx=c_pps
 a=G7MN2QGakcCL30ZscpFwFQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=RuJZr_uWk9hIvXmwfU8A:9
X-Proofpoint-GUID: VyMAI6MzvshmAdhw8qqEwiytlCW2sGDd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEwNSBTYWx0ZWRfX+lbTscY3EoJc
 acZ+6+hCeVPwgKIZBJyUNYBxL6c4ilCB8UxKxqmhWuuOCkVTpvMbNIIHVaSXuXJBduW4L0pg1l0
 CPutCyUPXdJE5/EygztdBDPCHUFhfV3CCiafDDZJLMfcbu1r1fmwVmys7hlBCnX6cPYwA8X7+JN
 TLr663L+XcVcRmW2xngaTsN3XPMVojZNZ2AJqsscTt/M4Vp7U8tG4LxohLL93sPqsMsHBQPtFUC
 i0ej/lbN9eAB2OovuIc6pu1ouRWY3NfECJBkTYiNQF6qRYIOeYCiTgtH/5bHO7vTxp/mz+3PVL9
 rTEgc04LDWwhnMoLpib/G5vjAvnbuvRvcu92MzGuAXDmC5QJui+RK56tYL5NBl9tzUlhUQLgajf
 ydMAgZRc1A16hUsNSAzAza43cfAkljpSGwAUFoQ0xiDBcJGMB3mWuN7WMO4+av7OFdGC7xYE9uu
 tHaAmmNgm2xrubPMAmQ==
X-Proofpoint-Spam-Reason: safe

Update the driver to use the new core helper that waits for the device
to enumerate on SoundWire and be initialised by the SoundWire core.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v2.

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

