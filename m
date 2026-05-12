Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9301D395AE4;
	Tue, 12 May 2026 10:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778581912; cv=fail; b=JC34+gmU2HVJ7S4wEKkEnsTX/MToFjObgp28Zix4vn1TPH8VEYLO11568N5B6dtMFpo3IDH86ktt3epeXKO1fbZVGz/kPJNNcEgADw9dh5otkc2C/r1zLV1U8qsK6ZGZlwiayhxuc6sS9RZIVjg/jbdWeld4MCiOcYNCXZr/Q1M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778581912; c=relaxed/simple;
	bh=W8NdWWD4VFiXpYTOUZA4dZjh320qfmmSfw5o36xdNvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t3saVCT10ee+Jj4jMQhUVmXBiCkWJ6Mzy7yejgIyrlONthKU1WnNDVm6ttiHO7Q38eV2Jw5eIWYYcRHcFadP0PPIiKANmKzPh61udANzVtbLjTpn3saM04ibHxgkE8Woa9gxK8f0rARmjJtF6id3RbuimzIRXFcZo9uXmi4P9UA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=NcoivQ8i; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Njdfqtgg; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="NcoivQ8i";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Njdfqtgg"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C59jn2818502;
	Tue, 12 May 2026 05:31:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=O4tbcEbgLR2z7KGxWjTuqmSQYgFiWL17YVnwK/vZJ4o=; b=
	NcoivQ8iN5/FRe6TK7fFcm0Jq6lhpG9nOEldlHIpQDHT+2Gz7nMFlv4umYwoffjG
	DQ5REjxaPH8lUd+h4+5Rj4p2Tmzp7jMtLPzA7JE/FcyygRV7bxonmykAokLVwVRi
	4BoeHPqIjaqgPlF1/oynMtOrCYCbBzVQ8dZMu7DcsX3ECuQJooWg5inq7hnP96pv
	1Lqb1NXSnCqqJByyhCGU78CnRBR7hrgNm29ndMqZSOzu9onGJQ9MnJZgUp621etv
	Uf6gPV9Da1A38bP1eCJJ5ugWchzPXDwaBaWVJkqCp3dIpqbqdGKSzS5+XGozCK4m
	2uSBrI3mG2Q8fti80dF9hw==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021124.outbound.protection.outlook.com [40.93.194.124])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4e3nvvgr3c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 12 May 2026 05:31:09 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VoH+hh4RH3bGt6eIWXLkCKHEKk7Y9+aPGxyak2z3my7PyyYlY6iq7oROaY09fbydNc1N1wfTt5eEx7672cq9ffqnwJtLtSPWwJFyYnMqpddXcBZFOwt9AaSqLcVP5NbAmvXTrgw9uqDaetrxU/etJ7GVF9iHvgJIQ6CcXdPHK5vjmJeIDr4J760zMXCjenU7z6Tz/zYZbvCde7dYslNL2BilMFa01Za2z5DzEC/dJtMP2HtK9XSoUGd1mD/fVJWp+xnoSetnD5mlvhZPEfyHQD8hIcUqeUn4RZd3z/D8vCd1MO9inbH0mUF7Pmk0Z8R5gOTBJznFRhA/YBK3FFXMrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O4tbcEbgLR2z7KGxWjTuqmSQYgFiWL17YVnwK/vZJ4o=;
 b=uljE1qID9+RctVsXLl1zjSIqY9e1ZhHWjDTA1EunQRkQD0RXHeEbyKRYFY/X1HlxoVHqdzJ34q/A57cFhu3rFzFOagCuH+JeIxqNVgh8pmvxQ2FLMGl7X9cgitn4HknsbOK4wCOvRgAWx8fy5tVkvxAAPSV0Vs5UTB1pQhjYNH1VyXznLUnZG3fxkD8Uv9yxFBTYvw9NJ8TDCdLY0Bphv3dEN5tVPw6Cf1i7FBoXyVzh6TWRSweAqPSP7bcz7uwK3K5t6mpno+MVFZs/QCvqdsx3xrC0v0iGEnzaFn9VinRaHLVmZlNjMPiOBrIexu4agMEKsojDNFKynateeK1kYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O4tbcEbgLR2z7KGxWjTuqmSQYgFiWL17YVnwK/vZJ4o=;
 b=NjdfqtggotTFAHTYzW0nYw9TvRC5Mla27zE9fUOPcFGm/cuebPNDu47iqZwURIiAmiuGv3aPKJbWH25j0iX+D/jhWNBIreY5fbwxqdkFoJPKKaHLtffvBq5vnGS3xkJeLwxIB5i7s2AKPjeCwdzcC+8/sMr1fqpOxNkzeffsVKs=
Received: from CH0PR03CA0307.namprd03.prod.outlook.com (2603:10b6:610:118::8)
 by LV8PR19MB8713.namprd19.prod.outlook.com (2603:10b6:408:25a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Tue, 12 May
 2026 10:31:05 +0000
Received: from CH3PEPF00000012.namprd21.prod.outlook.com
 (2603:10b6:610:118:cafe::56) by CH0PR03CA0307.outlook.office365.com
 (2603:10b6:610:118::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Tue,
 12 May 2026 10:31:05 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH3PEPF00000012.mail.protection.outlook.com (10.167.244.117) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.3 via
 Frontend Transport; Tue, 12 May 2026 10:31:05 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 8DDF240655C;
	Tue, 12 May 2026 10:31:02 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 53174822554;
	Tue, 12 May 2026 10:31:02 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v4 07/18] ASoC: rt711: Use new SoundWire enumeration helper
Date: Tue, 12 May 2026 11:30:11 +0100
Message-ID: <20260512103022.1154645-8-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000012:EE_|LV8PR19MB8713:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0a346d56-e35a-45db-d6a3-08deb01192d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|7416014|36860700016|82310400026|16102099003|18002099003|3023799003|11063799003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	DIxRiffEoiFl5eABJShAW13lSTJ8yMNZUAe60KgmbdbOCwCFaDA2j0Wc5g61Y7Swj/yTFDl1lrHF4r3mCB2lGG+oq5YGbk13xuqkgdPt6smvzQTI+Fhg/u1xK9AVZtQ9D2oL4Ya6lG8KUt9Y5ylJwA/8e8gqM2dfBxV9BQKR4y3OfkFVx9WyG0jEKg7v05JiVBeyX4TdUXUTvqVm0O03ValL3SnQcaxzmbtjAghyhe5e+KyVGvb7KGY0Jf9fEzZjwnzKxxBhVS9OneXoCUKSRSnlIfxbTKW0Cplqye+p+antCD5K6h3b+FoNJl8b2JFuu21hXcGBrjm4CpnqRmSAlWfttRkW0Xn+JNrJ84AHLAbVyKcspkoov6IXcLGOcUhNNRGbHH7eHNMJW1Tv/O69QaHIFPEaSjEeSOqr3/MLL6q6j1R6jw2zI5hzcyU2W4N7To131b2B68Mtc0WF6MfrdUJhW5aKL4OcShuIFzbd1t1tFHBK47RteadkbOrVhphUGt+M/OSIEYwL8cLUbD5DiGRCoXoN3Lfd7or9s3S8g+kL6DF8cQUOqadg/GwLWC76yX+qdYihlB6S/q4h2sLweNxn+MJpOmsm519p1faXj6aHVT1axWr00FCuRdx6CU9A09HVbkBH8/RFxVlbqodBl/RN2tXq3BT+FXVIGgZshDyO+VLm7D82avw5ISMULXyPbulXAyebrHaBvB/hFxXb4MxM4yA5P29IzvaIXFaRK+0=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(7416014)(36860700016)(82310400026)(16102099003)(18002099003)(3023799003)(11063799003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LX0LqnxnlOp4D1aaxi8QQld2uGM/2DAtwfsyYFE4ik6gJ9VPs2Wlh1DXxO/aYA0nA/N5N74dN0iCUnRTeHqINNH5JkP/i1BP7hzi234LjpKutRbHCP22sJq8y53xBm9QoABNToRY2zTGWp7uhy0ULtVVAicjTlJ6BLWjg/DGBhEwmxRMiAAImsQT2riF+AfTlfKcD9cO2H/ZthPrzIIoLxO4jORXGc6qqpRFtSmwPnRiTHlqMahg8MDFhw9+/2k8+HxPcJEqqnRzecRpqVpbWwZyPwntabPgm7sIlq1aLTqBbKFW+bj9eakPSpfnhHWLmA9tD0mpuBcWoqyXe+IUeNarJqRglw1U78jZKtKCJPV/zwhQHNMALxoOhIeEZIeM3klJALpN+LWAlMS3Gm2YxWJpUHZHtp5j+bfTg0nTe0/UqKONRHtrxyCu5ytheG7i
X-Exchange-RoutingPolicyChecked:
	Jq6q98qWrdrTjER4rb0tliZNNGNBAIHfow+JEh43wtCdN7qnWJr9Z7cLstWDmw8ZZT6FDL2xuwOejixkVaozqg/OOJBeyoC7ubjXwajMR8LEJ/n9ClF6wvhM8wXInFdMouoR30t90IEJylo9UXOP6GOJiB+GfFFPkYFn/SqG4mPD6eqBf9PSdnbsRuErME8CVL/jYjoUtW/iCAivT+zEDmg/HWNswRsfqz2GSxD/bO8gqKqlHmBxyRD0aJHgCc4fduwc+ErzijY4OZaD7Yk7aflpy4yaw8hCKZOFDlbQMQQvDOT93GCS7yOwXGtUhH7Pm4NKz5vlBHsBUASJxdhoNQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 10:31:05.4969
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a346d56-e35a-45db-d6a3-08deb01192d0
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH3PEPF00000012.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR19MB8713
X-Proofpoint-ORIG-GUID: oEGXbfnXYeU6EbHNnSl4FHZv9k0i3j3_
X-Authority-Analysis: v=2.4 cv=CdY4Irrl c=1 sm=1 tr=0 ts=6a03016d cx=c_pps
 a=MkKZ5qa7cfSD1TaEQpvYjA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=RuJZr_uWk9hIvXmwfU8A:9
X-Proofpoint-GUID: oEGXbfnXYeU6EbHNnSl4FHZv9k0i3j3_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEwOCBTYWx0ZWRfX8NWMvC0aVrof
 HjXZ8WX6mETxIhTqI3TNwIxpP1F3pB903QuSpGNIP96iFSiMREFpPpSagIYWUd4Z2BFYWS5dnd9
 HOWpNqzPK5K7pTg/gQz+wi+hGyAyfNCLEbPozNQYn+hjuBbDFImon7L97gvO092XRT9KeWgBQXO
 JdxW2RmCULqq2k2MrmrSXn6rrUj88h1mbpnum1pe3smxFKdIieLKcPm0y17ts/WzZFWjpjHL4I2
 jVD8FrFsGI7J3L8aF4DmafwH6Jp90zuV/KGfshlgT8kiXKLL6AUqf8VJr1mA7EDPz1dF2cKsIRX
 niQdTHcIanCSOLChDMyPZnhIq+FeRrutKrA+wPJgpU6FDov5cXXe1GIljCNXZ9EmZAOcOjfEevV
 Mip1BDEciMFwd5NzRLULi+LFXaNkIbC4pfaBO6X9jEjZ10s8s79kBUO4omJyrh6EvpBjLFMUQqc
 2tNgQZVldZePtTMuc5A==
X-Proofpoint-Spam-Reason: safe

Update the driver to use the new core helper that waits for the device
to enumerate on SoundWire and be initialised by the SoundWire core.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v3.

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

