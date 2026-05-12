Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1A34D2EFE;
	Tue, 12 May 2026 10:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778580875; cv=fail; b=sR+bHwJd/c8JXHHfHyiZeHppe4Z+VmkGwZRj4Dl6WhUXxfsxdwa7u74unPFNPCRW3aeg+30V8Hj25Acq1trWR7pRIfNqHrLl1A4VEEg8xr5HNuJZfXnFNU1TZfVMTQe8n8dLrs2fYCyi7Etr46yAAmzP9Qpa0680Z6RWF8+Ekrk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778580875; c=relaxed/simple;
	bh=WNUj6SB9tYMiX9kLBOoBrE/I7lb3A59zU8S3z5MSHwE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mJwFvGQpqLodzAlcPA8TzppzB5C94VkWKUjakrZMO50450OuZz1A5PRLjeFfgWRMWYRbXKw4SSxzd6ui5ZUf5R/2qqrgiVZDFjJ40rI9P7f04m5g7HlBjmo8VYSWNIPgYI2FA/pWHpcoo8hLhHq7YTFpZRbVA9gFa8LLqGfYVl4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=WoRIDyv0; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=iB7G7LZW; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="WoRIDyv0";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="iB7G7LZW"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C4v9Ae797268;
	Tue, 12 May 2026 05:13:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=IhQWE9nZjE9VSvwXl2KtzPtx8Xbj53GB8JCP8c3H79Y=; b=
	WoRIDyv03j7SXBnk7yMcv79Tkcvyhf7kpa4v6a5Q1+IizHFtshxIK9Syww2HnUvV
	STL5nYpOyFSrba5USQAoEPkGBxbkMT6DgiMcMr/ty88CuqEDf3SbgVbcaFAE0HuB
	4J/1//RJyksheJ5kgpK4SXH1iCfA0KJ3nrtC6kT9w67rnNwqRsFHQ81k7F4j+3D3
	IH0LLg0C/VLmIIgqkujDTPWRQ0uYlbE/AEqiNmRdjDwba9cUwt8Spg9LiIf9NRNe
	Lr/AxZ3rHF7ZgWjjQzUcy9ONl2WgqBtBdUUVXcH2MOmX47aH2eyxDen5MHlhrdPx
	3NSdRAYLswwwQiuRlBF5CA==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022082.outbound.protection.outlook.com [40.93.195.82])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4e3nvvgq6d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 12 May 2026 05:13:58 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ctDSyLxuh3UhP5ArE+hrnoEweLO2+fzMtbKHL5Pu4weeOft1vEryWSPWgZmMLCftLL5FKO/R3UXrL1YWaHCYkNJ6TAcmT3fiRX6XEFR53PV6ahM6lBLI8xQczfHQklIyZouLY+NafD8VGZ+JXsNPfmS9zJSbQX1SlDvFncmYoPoURXkXtEjKF934GkKj5gQMEnZI6M3aV/ssa6Wvq2xmvAJVIroyH4xPj/RmG1V0bFH9QmYKEPCl89BmCbfQ/t23h9KL6EcQy/OJJXpan/H+Wrr30cyl37QPT2Bw0EcMDxqMniHOk8CRigPU/Cfo4uMw7v3N2yxJT9jylDse+4iSLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IhQWE9nZjE9VSvwXl2KtzPtx8Xbj53GB8JCP8c3H79Y=;
 b=ZJSlkL2IV2MdUzFpUscYEu2OONldpDD1fZvlQ9R5Xlj/0Zk8g/JOaHhKgh4IEtgAzn5nFCBFyaa0jkeP0A+7P70vKM/zQnoxIu7HL5CmQKvxnjsQjq0HGl6idonK6T+Tfnm0aMEynQc2tQD+d+KyQLFNCbFiRnVKQoFaYzO/bPSZ3dIfEvdwUU6YC1wd8Mk0JMIkJXNiwJencEZGcfJvGq/hkeOGAdExwVpEuLRKgTZr9+CbfgtCNV6mA6lrhMT9umTO6heB6MiLSU6vdvBVQSl/wcqB89E5VWHfOrCYUsxd1uw6KUvsmzDvdFwjFMcWTqVmIfhdcdPsNitKQTbDDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IhQWE9nZjE9VSvwXl2KtzPtx8Xbj53GB8JCP8c3H79Y=;
 b=iB7G7LZWxjmTF5NXuO7VtcS+dhvXlFzRjTLTUWKhww2jJAh+VVJITuJn8eC0jkxP7a5aqBqs3oEWWth9KGmo+Q2LhFuxIrDC3xYg4pEnlrN+M3IQa0iUF/EOONT68KemnJ9yUIMwAxqDzCgaf1omppqajN68g6aDi48m5b9tyqw=
Received: from SA9PR13CA0020.namprd13.prod.outlook.com (2603:10b6:806:21::25)
 by DM4PR19MB5737.namprd19.prod.outlook.com (2603:10b6:8:60::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 10:13:55 +0000
Received: from SN1PEPF00036F3F.namprd05.prod.outlook.com
 (2603:10b6:806:21:cafe::6d) by SA9PR13CA0020.outlook.office365.com
 (2603:10b6:806:21::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.15 via Frontend Transport; Tue, 12
 May 2026 10:13:54 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF00036F3F.mail.protection.outlook.com (10.167.248.23) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Tue, 12 May 2026 10:13:53 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B501840655A;
	Tue, 12 May 2026 10:13:51 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9F03B82254E;
	Tue, 12 May 2026 10:13:51 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v3 04/18] ASoC: max98363: Use new SoundWire enumeration helper
Date: Tue, 12 May 2026 11:13:34 +0100
Message-ID: <20260512101348.1138044-5-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3F:EE_|DM4PR19MB5737:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 04cc6924-822c-4e60-a275-08deb00f2be3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|7416014|36860700016|82310400026|18002099003|16102099003|3023799003|11063799003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	HxvMsPvIP5sOQ/YtST1va71qh1YXHK+RuB36Z4Ho8AUYwHese+F0nUNhp9CZruo0B2g6J8ZutU7AcS0RpUI14A/1UAywaPRo6jliJVpkUin0i/EF4ve2Q2s/lrZZK3rwZECSZzttvd8dmcvpNFeqKT77Ka2kDmYdsunEpezSbQAhSfbg3B/muDs+ltxtB1wFjTQNj/8YN02spYK3RFiKgs48y0OYU3f9qqMUzkK6/nm3gM93FzRipkIEFaYtkTtmDOD5qECnnT6wH/SiCJvCceP30qE7NVhMlVBjUVJd0j7WYk7MI4KFp4s4IAK1IfDyGBM7vxkWfWX9+zjHRI+kIsRV0+fhl8LIwdTUqow/erMqcdo1dxacx9cKk0JMEMtPtyXVeTfbWg/37WsPhCllnYYy177ORFNvNU2UrBoeC5gwzEj2m2KgcMFFxkMuQrSqFrBIPchx8ikImWt0AA+Ux3vOrRD2wlFhzFMr0NSPCQ2smD2EoM+0n1O5nhtIVkgQskrowXoUE7MSF9/WdmmCGorO1TPWDbwTsGMCNvz6PqPvaSwh3uGM5rQooq99WSso0wnN9m4hp5J//DVa7hSIWmi9YVSCIC9o3QQG3FKF7rww1AZmhS3MVzJQBDMrY/kNWV0rmGg2fuNGbzaT+Xvk9V9IE+mX8Q54DmQzvvQ7LL4sfmNI4tZGQ1c/1XjWfEI9zgdAMAUo7N4YjAuvWIujhHJ8ZS7jXnELWAhERUxSgjc=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(7416014)(36860700016)(82310400026)(18002099003)(16102099003)(3023799003)(11063799003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RmZKHj0q6JCFShWGtbrzf3fvh5/kvY5QpRjwWKCzxir9y38uiz++ev2F+KnNsKCpHgevCfEv5cwxGM6FaF7U0Hfb5MBfXQjhLgEj4NUZpj+gEjCl6u++C8BWHkfYttM9VsYc2nL9IJdURdWx01GRy2RjpVc/GlMoy/uDnj5J4xsfPztOBwzMLJ8tK/LsSEV/FsZ+4yu5aEVnZZJe0FTbqr8navOtmqDX4KoqQnNIYk8FZKowX9XNaEVoRpe18Se1oRKunoD9ifx9dpCa0cP0kUbQ7k7uhhHQPT/y+WKFOJVbZIOEof0vScYe36eX2kamrUfN++1uu38v/FJ8lY2KHXFvXoT4pf+H+p+N7ZMOJaWQ7kvnxwYgj274Q+N6+hQWOsJYIy44uCVBQlxxqutsyk/z5syNWCe0BvfXfl+lwMKt8dxfZ5y3vNV4siv92ifZ
X-Exchange-RoutingPolicyChecked:
	E+SI5oBusmUMC27i475xMxVTe7c4R8L7rcK/9rr2WjfrmHA/do+34jx4m6Z39HnDRcpzNrCx3pNN7lWKGBAoyr3AHMeMe3BnYslGks1iPThgnIQOIlB46w/yj1Jj3Q1du5CdrektVv/+5ORU5D1vW8SBb9JtxhwCXLNryRY2qnJU5J1awydtXZ86BCDP1LCitKDBo0HS1ZdE9KGiI4RtQd86uGCB7HQVoNe9uoLzuTOv6Y2hqDiqpqnTBmd9kYgZNQj9U4QcrQ777/DtzzrmbXiCXOasp7TQ0Xaw/QBv1S5cl5I2B1Iu2QsC3PC+BnyP8P6c5afYWrY/IRMkkpXBeQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 10:13:53.7775
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04cc6924-822c-4e60-a275-08deb00f2be3
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF00036F3F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR19MB5737
X-Proofpoint-ORIG-GUID: cWzXu68Vqx5mZj8Hj0w8ulVRqXmDRtKx
X-Authority-Analysis: v=2.4 cv=CdY4Irrl c=1 sm=1 tr=0 ts=6a02fd66 cx=c_pps
 a=SxHyg0WdnT6D0o3uZaVs/g==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=_kLIPOSdNJ7StitxxVsA:9
X-Proofpoint-GUID: cWzXu68Vqx5mZj8Hj0w8ulVRqXmDRtKx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEwNSBTYWx0ZWRfXwwSE2e2LZf2Q
 0v6y2Dzq4MuytiFlk49M9tlJ9Fetczkq8de36sbS4kz7d61MYUrLg6YVS0lMc+i7SBly9GPtUB8
 Ha5op/LdLR7b8//1Fsd5aPT7MCwgOBW34NFmahO8FYjxUEoIbu6Y19t9j7ceVutC3XDVq1Du968
 +q9ojaTNunzVsY9DemKyzg9aWWMUEvHVs5EtvmUJHJEcaMWA3A+EE+Jlp95p+8Zrtoojf0Uf1Y7
 whtV0+Opg7uxHdZhNIa6MpAWuvm8BRWntSQnBYwBa6vWbRwYf54MhCHwq4lCwh62qjz0/Slc1tW
 yOry7Vv+RmmphoXX+yknjAk9dmpk+cuzme959pznFaV533PkisebqxBA3MUNwbztWfo7Mv2F/GV
 8emDan8ZRsf+fBVhDo+bUDzNIS/58KdG7x2AF7d0mRnJMZpf+eDyaULggoO/xoUbXRZ2IxmMpCK
 d6xyaSr8b0wdjylAtQw==
X-Proofpoint-Spam-Reason: safe

Update the driver to use the new core helper that waits for the device
to enumerate on SoundWire and be initialised by the SoundWire core.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v2.

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

