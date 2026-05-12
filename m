Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCCA38398B;
	Tue, 12 May 2026 10:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778580884; cv=fail; b=JaZaOs1FFcAzc/ubi6ALQDigKp0M3a2NoXxx+ppL7DVV21v+5iEFb9QD9QOdw0Q0SjhEezV3neIF7c7UZMFfV0O2zl5uqGmTlXHJUrmimAtb8rswU0Cq2dYa9LsUs/H84+wVEiHbubUQgPFKdwS4ewpQ5XjTIJEmC9LiHPWPT5o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778580884; c=relaxed/simple;
	bh=eWFejs1QLdiSMESX5u5F8hv6RAy+anuty/NG+mFhF7M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jT2yF9QqpwsDeu2r6jt1ZVxeaetKMsbeXfOTfMGumjV1Kl+HOEWJnXRS4FwXW/9Y25L1i57cI+Y7S0/haiHwMnVM3CdFQDdaLW4RQ6d3U3LKKXsHANt8i/t77JSAAVBh4QeRNYzNsWwMeNeekohGzmvJcwoafV2fW7E/wMHWaPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Le80n5CY; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=LsBKNQca; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Le80n5CY";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="LsBKNQca"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C4hpml1493060;
	Tue, 12 May 2026 05:13:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=HlWnVc7snUJgKklVmhRWvfV0dcYCpEOTV+L7mwT8q/o=; b=
	Le80n5CYHEXub02YVszKJWlA7exN4st7DFTx0FQuLE2BqX+H7mLgs/yQo/TDPveT
	zJPaHoNmP4+INVuqWKJwrDzEc+Cwx2QbNB/S6OVLy6rDEFbzbdHP3FvY2qKwAjPi
	dK27DV9jdFkvwM8+hb2waVzcwWjOsnzUY4UTs26FenNc5ZtV1MH+DONKF2fatIMO
	/0H+J14Nc8Xvu83T08NTA8uicxdBGWIH00Cb1MYMqx+gtqhI4wX+2Ycdst7E6j8Y
	VFGg2d+tycPfiC3Tls1//5vxyAUYOPiFVgbplKj91RYa+114FAGx3y5z5ayIME3/
	O0w6VqctLh+sqx31bdgx8A==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020120.outbound.protection.outlook.com [52.101.61.120])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4e3nw58q89-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 12 May 2026 05:13:58 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eaPobQKX6ODDnytF4IUVPm1Z5Ul/D4/1pxbzomI6UFyvJfP3WsbPUQhLFSQvsYbLY+oko4KiB/i3pJOhZMKEB3FiWn3yAEIOPE1OWAyLI299Jr17LIUmIkjMhABgzVmumymQN0iCYbUprdXcpH/UMyOKCQLsVQJ7dRxBhb3jB4dpkJL/jskFaeBSflwwsjjkpnfvdFmd0eg5YLXAEn/9V9qpbcmL2xy1ucBxktCXfsp5kGtCThk032SaKfdJ4mRbp8tF47gS2PdHqTgCAMd3Q5EEi/p/e2L/LLYg3jAu7N2MGWrvByNCy3/ZDx8v0cGvoiv2AbAW0yOQZiFm7TxxmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HlWnVc7snUJgKklVmhRWvfV0dcYCpEOTV+L7mwT8q/o=;
 b=Ixwwfmf8Wo1SqcafOnWiP/zV+3Qp24BLFmBDDXCdckSeuheksCrT+UfQ0r5RmD2uo57urQ7K8hJ6A74lGRRYH4kvk1JAs8kMIhbPTWDrCRHVqakRAkXqee4ia0CJnGOJ4czOBx9wO0kpm0PwlDp8bVgTJeJNGdG8Pi7aFWw6TIT7yu40DsQjLwH5dyG9xxUgv7isSTz7Ai8JpXg0uMFxg4QW0TUHBXM+5Pi3WRXx70mc/rvps+uY0aeLNktc/BmZvjKOra9jbINGXRLF911LW93JrlkFC0WQdxmZZvianyhbHNIpxDW352g776L3zbi3ZlLBmw1DU5KdB7hQnOh6wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HlWnVc7snUJgKklVmhRWvfV0dcYCpEOTV+L7mwT8q/o=;
 b=LsBKNQcauKfKbo5X5xhm2C6s1p28mp4eQuGZmNw/znbAeWI9H+4IuEaiW6Um+aZd7JA4HQG3tWf2lETSTmfUGKwMlihpBMD96DnvbgHxqJXt6cXF8IOKwaTMC96RCRACB3T2iYNJ/FAZYyhZ/iXd50bP9+AXel2W7ZGRayaY+VA=
Received: from PH7P221CA0085.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:328::19)
 by BY3PR19MB5187.namprd19.prod.outlook.com (2603:10b6:a03:355::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Tue, 12 May
 2026 10:13:54 +0000
Received: from SA2PEPF00003F64.namprd04.prod.outlook.com
 (2603:10b6:510:328:cafe::2b) by PH7P221CA0085.outlook.office365.com
 (2603:10b6:510:328::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.16 via Frontend Transport; Tue, 12
 May 2026 10:13:53 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF00003F64.mail.protection.outlook.com (10.167.248.39) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Tue, 12 May 2026 10:13:53 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id ACD23406557;
	Tue, 12 May 2026 10:13:51 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 96985820244;
	Tue, 12 May 2026 10:13:51 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v3 02/18] ASoC: cs35l56: Use new SoundWire enumeration helper
Date: Tue, 12 May 2026 11:13:32 +0100
Message-ID: <20260512101348.1138044-3-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F64:EE_|BY3PR19MB5187:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b599518a-38ca-4026-0f76-08deb00f2b90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700016|7416014|82310400026|376014|16102099003|18002099003|11063799003|56012099003|3023799003|22082099003;
X-Microsoft-Antispam-Message-Info:
	TFMLKgqOi3Zn7ouj+qCl25Xd356Mi4w6R0u/JRL4kCX3L3pH0/2YuT7CzlNWKUcqzEEA1zcXn4fzXASXYW6ENFzMyzXeWzf1gmKVDX2guzCzQ47Y6YrrnEEf569i4RIfljkGK9cmlJONgybGtVHeXrDBHyi28DOMAuZxy5QUDoAsK85wdTxbH11+ogTAbYJekI4sFpu2wHGLnc0lX2MyIQ3SQv+wgMG8hzLE+Mt2j6KRLREDr8p/e1sc0C7aoXEVlnefRLdDWVH4ZffQYCuTU1sud4ggcOT0OumPT4Dm+AmbDcv/n9LzXouiVPec6xBORfFD3MRRQbX1+ReSqTYS/yN4dniiydTTDLRgENirNKQup6qI5z8tUaSMMCm/wRD78CvKrJq00l9sN7q1H44LETwA1ldSwRRiXYl5SXNTyTBfuKF7QrG9yGeP9baMI9fCSEJea3Uoa08JCsj2BYJ+pU1HDs5qHnNUv4da4EsmnB9mKzDmEUT0oAiTjsuS0j6ikN1PLLoGBZchmoimI96c8a/gi9KfPHsA4H26p4Sb8uOBCQoi8CDHBh5awqOd6+zlrTgPkkLGyufJX2RQkctNG6iDzlGRSS1sbZUlQTSZpcV9VEbPli7cQIBbIT8XLeURoCYsqHlSdAhZZiogYEV6VSDIG84uXq/tf0rX0A0LsSX228coTGk7FxfOQWQLDWyzo1Rn75eLc2pjZpwDoJAfpNDRRwow3xmeupEsWnfaxyo=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700016)(7416014)(82310400026)(376014)(16102099003)(18002099003)(11063799003)(56012099003)(3023799003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	errjWNDaj2zskwmp96FmWEQsanMWChbJnpwk67wRW+u5jvCf8iJA34+R+KZD02FnQGPbia+7zMfv8ScT/7rucWTU8sLZNQRZjYP4jzWqglr6119I7d0leTvWi0bEWGB5TH+n3Xv21iOvbbMTDqOrUAYm/A/fouHdEopHWI+fiYOibsDuyIpabU09R/y5JRFSv/q1brbcFJESq33tseJflErLNWCediHik+VSYKJJJiq559c8njXisqYtJzOAjZxWVwLgyisphAS/C8hnSou0kLwPwD+dj/5l7dSKoaH0BvvyLM061EtVA+LzAT9Io49OAAqWY/d9wtmBag3RGB0Sji+9Fk+h9B/gJhVJCovinPC7a6mXkaM89y4VSdrMEM9TO/qfqALkg4MTXEt7rSG/uXlRs+xfPcKzFFx7nnxotGChnfKcu7UGC4bsG48oV1If
X-Exchange-RoutingPolicyChecked:
	ICTAvHxKoa1d90pDdBF6GEKz6L3g3uhjpDJIL2NVmslaiBoiNbDKtZhCgWp7971Kj+tnvZqXJ06zaTWSUY6mJGwRU9XfomoUAiE+sahcKh+7l7mou7lYl593pWwM+KtvYzuSOqaD71t+doAuDdudzLFcH4wXtaPi+gfhqShUgUpcunzEYwVIGLexyr/X05bY1sqWzSd2FO4SiAqLorr13804m0jk6jYOYrFj+sPr/5BYwmPL8W89yHnA1kIpd8W+Yf8N7aFpqYyecfxNc8ureUwIHoH3Fm+CtkHQPCYCzJrqRStvjOX4T0IwRTQGYvtjik85AgDobSntF7Pqt14NQg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 10:13:53.2319
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b599518a-38ca-4026-0f76-08deb00f2b90
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00003F64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR19MB5187
X-Proofpoint-GUID: 36yXOSrDBpfOaKYec5QNC_2viQFSw6Lv
X-Proofpoint-ORIG-GUID: 36yXOSrDBpfOaKYec5QNC_2viQFSw6Lv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEwNSBTYWx0ZWRfX87NRo8HvFeQ9
 VoOzXD1YlqkrKYg3zSKc7Axk4OE/NqV8oIGC+pdKuOX1u/iETM3Jzo6KhVHV3GTdWgF5U73TZ0x
 0QB3nT7RvH7iLRmNCK0NlaDp2/yOxTLtjl2cCT92/9SvIXYhTKNM0fax6R4U+IKsPC3WBLsq6iu
 kOoolh7DdYnFqmZB4QewOqF53wx614f+wNDW2HvN7X/VDVscKGC9utYooloSXeM5tS/ROVfcKBk
 bHOQvJiEXbr7EKwaY6bOmcEPyiAm39Mnr5uP/KHuK1n0m3zgsdowqR4b6lbHnvODIeYUjMhGMAg
 yiCi4CS0UQ5LWQkcOHgjiPGlhQZX9hF6uveaX9W+mPk8ZzvQntHHGSoR7J8uC63HMAL5a1KaxRy
 iBco04pIE+jJ1WX9FcS4RLscASZEi/xgyzROaeCtVJVt+rvuJqKI3lf21CjJ9gmwDojCfLUf/Ay
 s0+q4iZHaY9VflvWSxQ==
X-Authority-Analysis: v=2.4 cv=KsJ9H2WN c=1 sm=1 tr=0 ts=6a02fd66 cx=c_pps
 a=bPzRbboBZ578jDP6/fhW8Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
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

 sound/soc/codecs/cs35l56-sdw.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs35l56-sdw.c b/sound/soc/codecs/cs35l56-sdw.c
index 9dc47fec1ea04..105d38b1c1878 100644
--- a/sound/soc/codecs/cs35l56-sdw.c
+++ b/sound/soc/codecs/cs35l56-sdw.c
@@ -436,6 +436,7 @@ static const struct sdw_slave_ops cs35l56_sdw_ops = {
 static int __maybe_unused cs35l56_sdw_handle_unattach(struct cs35l56_private *cs35l56)
 {
 	struct sdw_slave *peripheral = cs35l56->sdw_peripheral;
+	int ret;
 
 	dev_dbg(cs35l56->base.dev, "attached:%u unattach_request:%u in_clock_stop_1:%u\n",
 		cs35l56->sdw_attached, peripheral->unattach_request, cs35l56->sdw_in_clock_stop_1);
@@ -443,13 +444,10 @@ static int __maybe_unused cs35l56_sdw_handle_unattach(struct cs35l56_private *cs
 	if (cs35l56->sdw_in_clock_stop_1 || peripheral->unattach_request) {
 		/* Cannot access registers until bus is re-initialized. */
 		dev_dbg(cs35l56->base.dev, "Wait for initialization_complete\n");
-		if (!wait_for_completion_timeout(&peripheral->initialization_complete,
-						 msecs_to_jiffies(5000))) {
-			dev_err(cs35l56->base.dev, "initialization_complete timed out\n");
-			return -ETIMEDOUT;
-		}
+		ret = sdw_slave_wait_for_init(peripheral, 5000);
+		if (ret)
+			return ret;
 
-		peripheral->unattach_request = 0;
 		cs35l56->sdw_in_clock_stop_1 = false;
 
 		/*
-- 
2.47.3

