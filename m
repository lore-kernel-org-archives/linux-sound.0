Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A003B961B;
	Tue, 12 May 2026 10:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778581919; cv=fail; b=NgIEhoEc0EN9ugxDTl2Y5c6ewTQiUGakZCePhE1MPJpK2qwCqq95tY538EACm0RHFa5NT2M5kczCDiaKykPo2X8Xo7g9JkVJ77/dO7l/tjrWJ9NROI5Wgt/hu7P1SSpi80QY4Ez6Lk1ZFLz/rrvM7sWjtQILLAQ9yZI0qxWsnVs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778581919; c=relaxed/simple;
	bh=SHU2e8SH0yInHMm4F4ebQYxAf05gNzy+Pyrl0thBx14=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=otwv7DpDywbw9xveaLqTUW+D2gP0FTZkWB3Ow/peFu3GCLuweKgnmG2tYOMo5N5IdLyt8rmO8i/q0LfHSYg8XRenYqb61oe+rjj49wm495xkvtsF0y8wk7Qh+h463epCr7ERHwUlxQfVaRjJl/BoTNKlJ0BdruS2OiD6jxSwHxA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=IonSL/32; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ipSMcSld; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="IonSL/32";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ipSMcSld"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C4h1RS1491325;
	Tue, 12 May 2026 05:31:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=1hunjrjhoFvzdyk8BDHS/kFHE4a4ZT6T5YICZW3HbQQ=; b=
	IonSL/32GtgZ4ZfPqj6iPSXSQll/uvvvKFud7BAkwyRjMWde/iiB/BDyWIElYS3/
	mdyWOTizfRbWyzTC9+ifcWHBbrs7KZxPOo0/mZV9TufmC8Gn53esyo7PvSaw5Yvk
	VuuBwtNsCTE7eiwM3bPLKNvpGM35A8yyDodZTIOcN57YrMe7CY2vpPw54ADf8fMn
	ZBaE0OgIkAAf587YLJP54TT+NYzsKXpaTeADRvxXFr8aLAPlBieFMYZRrkHztu+r
	B/8yYQRnRuijMdHiWN9Xa8qTLINQBkBVTEEOZNEHFquPDrZlzxEarA4gC2nRzjqV
	QdWZYXQTax+3+1WKy29BKg==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020122.outbound.protection.outlook.com [52.101.61.122])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4e3nw58r81-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 12 May 2026 05:31:13 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yhKGFJJYtEUS6D8jPkIhOYX1d6+2tlowH9RC0RAEcMlQEces/h/fxlg7Qz9hx6gLizg3WGLRZlXFGlCP1hpwj4uESH9KTLirPXujnh3ZjGtRPd1soB98Kn3K0OX8WWRMuYP9Odyf2RGLjiuARi2dk4QtoBjvPg1wv9z/lHhZjyT7ZoB2P0YJTshyG/X+GaiX+s2dvtNo8bhLMtL7zSoXRCPeN5nS41dZj4w1eB+p7/TSszBDQzabzdBswcc3anzHWRVjLM071yMdE4/BQygPQ1hcWxqp0qSIOI4yaptBmiRAaTj2aUwdc6lawT7eoUspDKxGVuR/OgyI3WeNWr81yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1hunjrjhoFvzdyk8BDHS/kFHE4a4ZT6T5YICZW3HbQQ=;
 b=x6/jgGJc4v/h6pddAP8EOWEdr1ByMT5f9EScfkxkVH6+J1nF4xFd6P8WEv5YN7gh7pOlTkyuMt78Es5/3SrdjyJmjd5Gc/jLwxu5u5myriqTCBYh8dKDU9GDhKQqin86piIemQJ4N2BHip6BjCAqU9XQR0ybjh6+7n7gQ+iqmRPvfxoVofHCzfxBAMaCJwMfWr4OewNg+P23htkF2qpFB6a8+BI6MQPyYo8X9uhNmIKcWpMtEdETvynw/R3PTGOkskqV9GuZpCe5mm4T7n9qjWT8AX0pKR5cn1QdBmCFofqSYh7jOSyLWh03wM0sSNW9SdpaJlIO5KWJiEMw5YonfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1hunjrjhoFvzdyk8BDHS/kFHE4a4ZT6T5YICZW3HbQQ=;
 b=ipSMcSldkvgxGfugNUzyO0V9iuDRfl7w5GAMAoxEy3XqzZ5TTnvr45F393+8viHaNlp/th92X/X3c+38ntD+PCwYbHjBlCy3xla8g4wKUzFYmu3rOlU8ip1kLEYsJAnZ+Fhh/lErGq0b4r6ckTgpy72Fdjkwc/A+PDxhNUU3I10=
Received: from BN1PR14CA0010.namprd14.prod.outlook.com (2603:10b6:408:e3::15)
 by DS0PR19MB6528.namprd19.prod.outlook.com (2603:10b6:8:c4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 10:31:06 +0000
Received: from BN3PEPF0000B076.namprd04.prod.outlook.com
 (2603:10b6:408:e3:cafe::8b) by BN1PR14CA0010.outlook.office365.com
 (2603:10b6:408:e3::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Tue,
 12 May 2026 10:31:06 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B076.mail.protection.outlook.com (10.167.243.121) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Tue, 12 May 2026 10:31:06 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 9746F40655E;
	Tue, 12 May 2026 10:31:02 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 5ABF2822558;
	Tue, 12 May 2026 10:31:02 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v4 09/18] ASoC: rt715: Use new SoundWire enumeration helper
Date: Tue, 12 May 2026 11:30:13 +0100
Message-ID: <20260512103022.1154645-10-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B076:EE_|DS0PR19MB6528:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d83dee66-4c48-4bcc-10e4-08deb0119322
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|7416014|376014|36860700016|82310400026|3023799003|11063799003|56012099003|16102099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	4PZSAWXemcGYRxyr9dUrXOVmriro9IiYrnU/X4EamheiuGn+JBk0fv/KcPZJ9+/vhRK/QEmSBpneVDmd8q+0LIBzZcIkx6YBvReUgzw9yccjTGv5e/m7TotjyTkTroEddE79gRMXmVgUooYVYZaMHkdteFRBOq53BefaBsq6dienqtRZyXWFyMbr0uSrynPME5CuCGrUuCvXtQoa43o04b17I8AudT5+nl3lUxqVVnYsH9pEBIV8eXwyUUB+BJ5kWSI7llmu3jLalLlfwCEGhtg187F0pSq/j7dbR1eZvOsVV4iaX942xYWNwvF9vEFrdrEMbffIWvlvr+c4ez9NtlZcYsjaYNHkct61M9w3YWdNQUxA5ZiT09Yf5/ZRR5/mnmsMtMzIEQZOU3aDdtNqiCd7UFxHF3EDemm6v+17lBgp7gTFFDhizhdpCyXT3ntM1wai4HerA543TBjNKx4is3MpSZonFVYSJApFWDkyKKsqDb6+dozJue7edHc2T1F/MXQPIFU+LNY6mltyBDQwqhp5WiTQt1bFTSGb09AF1ij1ERZDrmMutiKXAofMfAtW85TwyMq0ZzSnpquVsafbj62dRftSpoR9umFvvFRe59CXATjQOQbrwFHWyFiG5JzNprdBlXidHm3fNs7+57k6VwnDadK/Mhi4tohUP+jDnEtZIqcaPyai51sZxhbPAKvF2tAQ4ThMfx5+jNTbSFPI5N4ULTLZ+NUAT4nKtmcz3Gs=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(7416014)(376014)(36860700016)(82310400026)(3023799003)(11063799003)(56012099003)(16102099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4kT28TWAyz0FhthWQ+/W6QwVVQWk1OAR6VSqXD7o+4cFliLl7b+xpIBWH6syAJcqIh/Ss42qLSpIJqM1U1hrehxjIV6Me7o9zgakQ2PwUik7mQwsuynZ5hLlXFyc5L5lY5ARQNnkTSPh/nZLs4OlmOWZM8mv/9ersMcdQvqHnXNegrp18zYXi+3tM5rfEhF+TW0y8TWZg6aTp0dE0WCpXNn1wd2xZl3zxjAEyyFZZflyakX/opwKSnOi/u2WYeJFugunAmaBNwK2oYQhyUQbNQyZC3XPwFfKnwoxnDpiNOKtwhZUqdDmjK0vPVBeu4tCJ5BQNOsN8Z/9pSY5Av58Pde6vvxymhsKrbylt99+KbF1Wj6Mi2WvdHY6fPVDmY7e87OQLb/VrQYFDg47TpUD4a6saaicmBc7OqalihMdvBadUd6V0hsSWsJrZP0t3HzJ
X-Exchange-RoutingPolicyChecked:
	hjtYmztaViPV/co8Cl/cGbbw5qRUXsAfibAftFxwRBEltZ5NcWmmg7tqNoWBwGHe6sLS54Lq0OOmXqNUZKCSUsM985x4LmOKLlxzb+iyul5T9E41rDf8J/DtaXK0mDBp/g0TztbxHhFiAnBpFvhWs52dDP78kI3dHPqj6Jo+DaOWAmVyQ8dV1MN5QThx+Oes3GIsFPAVlcvLNEtVlv2fRUyxmQ5LIE7Oy5FPYWKifKH1WzLqU8zc2jBCcPGnssFT+fi0qKUvi6XU0uchy+3oS2V6jCNcGeBtxqLl05WArb0UDn54sjStg/nHHO49XWHd506jcN7+rsmPGX3dX5ynaQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 10:31:06.0478
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d83dee66-4c48-4bcc-10e4-08deb0119322
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B076.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR19MB6528
X-Proofpoint-GUID: v0y9MFzyvB6Kv3dDwOrayqdwL7IvOI8z
X-Proofpoint-ORIG-GUID: v0y9MFzyvB6Kv3dDwOrayqdwL7IvOI8z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEwOCBTYWx0ZWRfX/6jzkO0caJ8q
 BnuI7aDVaE0m52ETCzABCQS8q4bf6NlVRDwquf9y7QJsX5lE2OX46jT3rORIhiLcmqIXrmLVYTH
 8vt8koZjVVyc4KqLWHbltVSTeGXby0Js/L0TOejvu9Ma5itO4HUFNgklSKgwgjTLFykGERoN9Mr
 H9ra9h5eBCEs4cTu+MKIpFAczRrdUlWSQawUB6CQuMo7od3HcP9ghUdGGS5nxqj1zsm0sh6wafz
 Xw082VlO/UTsR9HK51PtwHl7GQu58hMV4qYBksI6eiIBNb3QehgqwaGb0qGflx3A0fXM8bN/x/1
 cMJVX+DYECx8zbKQSZ27SeAFVA4Vr3U83LqhuBfqKLHJN9spd8ZGwYChUUG0CC2Oc/74CJpePeM
 B3bSGauRxiqCGzMtaXNfEizbAdK1QScAEJrvIy020cBi0NAFbbPC4TeEb7bMaEvaU5DM1x1NY/0
 qGFReCdp8j1xj1VyHNQ==
X-Authority-Analysis: v=2.4 cv=KsJ9H2WN c=1 sm=1 tr=0 ts=6a030171 cx=c_pps
 a=BuIXzXdkr/R64TaiMYXo5w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=RuJZr_uWk9hIvXmwfU8A:9
X-Proofpoint-Spam-Reason: safe

Update the driver to use the new core helper that waits for the device
to enumerate on SoundWire and be initialised by the SoundWire core.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v3.

 sound/soc/codecs/rt715-sdca-sdw.c | 18 ++++--------------
 sound/soc/codecs/rt715-sdw.c      | 18 ++++--------------
 2 files changed, 8 insertions(+), 28 deletions(-)

diff --git a/sound/soc/codecs/rt715-sdca-sdw.c b/sound/soc/codecs/rt715-sdca-sdw.c
index 968bc183b8d8c..4b9815b5628db 100644
--- a/sound/soc/codecs/rt715-sdca-sdw.c
+++ b/sound/soc/codecs/rt715-sdca-sdw.c
@@ -224,25 +224,15 @@ static int rt715_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt715_sdca_priv *rt715 = dev_get_drvdata(dev);
-	unsigned long time;
+	int ret;
 
 	if (!rt715->first_hw_init)
 		return 0;
 
-	if (!slave->unattach_request)
-		goto regmap_sync;
+	ret = sdw_slave_wait_for_init(slave, RT715_PROBE_TIMEOUT);
+	if (ret)
+		return ret;
 
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-					   msecs_to_jiffies(RT715_PROBE_TIMEOUT));
-	if (!time) {
-		dev_err(&slave->dev, "%s: Initialization not complete, timed out\n", __func__);
-		sdw_show_ping_status(slave->bus, true);
-
-		return -ETIMEDOUT;
-	}
-
-regmap_sync:
-	slave->unattach_request = 0;
 	regcache_cache_only(rt715->regmap, false);
 	regcache_sync_region(rt715->regmap,
 		SDW_SDCA_CTL(FUN_JACK_CODEC, RT715_SDCA_ST_EN, RT715_SDCA_ST_CTRL,
diff --git a/sound/soc/codecs/rt715-sdw.c b/sound/soc/codecs/rt715-sdw.c
index 49c91d015be4d..7f83a8f1a06e9 100644
--- a/sound/soc/codecs/rt715-sdw.c
+++ b/sound/soc/codecs/rt715-sdw.c
@@ -501,25 +501,15 @@ static int rt715_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt715_priv *rt715 = dev_get_drvdata(dev);
-	unsigned long time;
+	int ret;
 
 	if (!rt715->first_hw_init)
 		return 0;
 
-	if (!slave->unattach_request)
-		goto regmap_sync;
-
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-					   msecs_to_jiffies(RT715_PROBE_TIMEOUT));
-	if (!time) {
-		dev_err(&slave->dev, "%s: Initialization not complete, timed out\n", __func__);
-		sdw_show_ping_status(slave->bus, true);
-
-		return -ETIMEDOUT;
-	}
+	ret = sdw_slave_wait_for_init(slave, RT715_PROBE_TIMEOUT);
+	if (ret)
+		return ret;
 
-regmap_sync:
-	slave->unattach_request = 0;
 	regcache_cache_only(rt715->regmap, false);
 	regcache_sync_region(rt715->regmap, 0x3000, 0x8fff);
 	regcache_sync_region(rt715->regmap, 0x752039, 0x752039);
-- 
2.47.3

