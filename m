Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF8B39C019;
	Thu,  2 Apr 2026 11:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775127623; cv=fail; b=tkmAukqUTQIOo6xDbCmKYTSdltaU8UCcNowKg1PdB1mlBDs5YS9sZ7pofmf4TW4dGYPiUE8oIqE1L+JEktnLWZ0iyoNzPpFybANBwvTN4ggdIrs2mfCLSdb2vom6S2nT7EF60d9yUM15ln4IcS79AP99nVQwPR51XwQTylI1DrM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775127623; c=relaxed/simple;
	bh=W7PLuCMKg4iuk8w/ya2+2jO5u6QLrj8ok03LYVESglQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hlMt4sJut7Kzn0n+FuMXUzt96AXcE8yi4MyGboDJ8LyftAWa3WOjrr7ZnwGdqElKiZhHqPr9yEnQ33UB87uZtNfC9I7HAcvEbvjxyWjhpu/eeTM7szzb2QGnmPNCP6+I7QIKvQHUYEnVpR7j53laCzFnUMyYd4DGb8fHQ70HeVA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ZFHoEbwv; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=0PSf6BHC; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ZFHoEbwv";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="0PSf6BHC"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6321h0dw2912346;
	Thu, 2 Apr 2026 06:00:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=zDGvbiix/CfqVsSD
	83VETqnyESiCdsmMKkd435KTSxA=; b=ZFHoEbwvX+0SChNaP+fXX31bGomd14g5
	jnzabTkZ8B8+h4DgULSezlj9rse4fPBhcEL230pKiq7ka0b0SlIaEaFm+9I/tLl4
	gwzC15NZ3eF7N0HnG6cYhTFRLb83Eh4uLo5Sfct4BhOH0P3HoNW1QE/9qFBlZty9
	19EvHkqh+VuxqlIPioUDogoup9yWaye4F4tdrYQ6DosvKILHOzw5hddECr1nHI3W
	aEszBs2PchEhz78X8sxxJGdWLeeccSmC3aN9uXknwsf/PW0xQZPiU9PYAwdA4u8H
	Ag8guUFUCISw+sMYznDy9TUQH9SLLScjC6OajnrZEgLbHG7ms2lkTw==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020143.outbound.protection.outlook.com [52.101.61.143])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4d6ccxx6gj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 02 Apr 2026 06:00:00 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EE57BMpPfQV2hTV1A+f2VDQzszUEQ07huYe/APZ2pBbkuLmOmTC/9NLTngQ4FRfUYu1fVvsd1BwswN9f7ef9dr5azzOWuJcu5shMvJNZXG3Fqq2pQFdrbmTF441ZoitE1o8XFSydZQrFBR8+bEDv+U/D0bpltgU02TWfZ8quZCTf7dmkEMwPclb3Ff2AiqKy7t4yboia2lJ9kRIFQB+5H7QtRwaz6OF5tfDjH7V74eI6KT9kLkSBkaKOuyB15PuMDo5/Abl4xeN7zbuUPsulgd3IMs+07p3+LA3rWVWAdtAYzmKOdHgHlULGxD7r7/6YO1EI5FlgIs4D9YNu1eDbEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zDGvbiix/CfqVsSD83VETqnyESiCdsmMKkd435KTSxA=;
 b=mPvxSRsUAUW63XqPr8et7aGcW6bxGC8ytLrVBdytxeMmQnnn0tv0Nf33U3aLftNH1NRZrvay1KeZzpirbDHw7g6o4Z1jy0kz1uScCZDDXN26j63tt1IiOjFT5hYXShjP0DYMNn+buN6YyWhL0RL9z85hA2jZCB/ukRmJB1RZ1e0aoBM8pkwwuaHnzhs4R8mssGtfjYVa+82cBN5BEDFn+CVYtXotq/FpM/Z8xJGW2xLKQCBV8b7baMGBFpKteK5gF4R86ILEvWbHiSmjVohGdA99wHVlkwSp4+JqplzPKiqla1IEw/c1EFGeA42dCiWMoNmK+C+PWsDSX3lCdMD5iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zDGvbiix/CfqVsSD83VETqnyESiCdsmMKkd435KTSxA=;
 b=0PSf6BHCbJ4dwD3N0GnBIVevC/oLhb+I/x/KN4W5Kzme5YS0t9gWf/HZ5Fez6/bmClBZ8pIsJTZvpIZLnBqp8IEEWP3chT7CT9pItolOANRwh8/QPdUO2L2lS99FmGcS1n8awKHN8BxnSFvGhIFoH48K9cr0DDBmiE8qd13tDOc=
Received: from SJ0PR03CA0051.namprd03.prod.outlook.com (2603:10b6:a03:33e::26)
 by SJ0PR19MB6868.namprd19.prod.outlook.com (2603:10b6:a03:483::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 2 Apr
 2026 10:59:56 +0000
Received: from SJ1PEPF00001CE5.namprd03.prod.outlook.com
 (2603:10b6:a03:33e:cafe::fc) by SJ0PR03CA0051.outlook.office365.com
 (2603:10b6:a03:33e::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.30 via Frontend Transport; Thu,
 2 Apr 2026 10:59:56 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00001CE5.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21
 via Frontend Transport; Thu, 2 Apr 2026 10:59:55 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 299CF406540;
	Thu,  2 Apr 2026 10:59:54 +0000 (UTC)
Received: from upx-mtl-008.ad.cirrus.com (upx-mtl-008.ad.cirrus.com [198.90.251.5])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 0DD6082024A;
	Thu,  2 Apr 2026 10:59:54 +0000 (UTC)
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com
Cc: yung-chuan.liao@linux.intel.com, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maciej Strozek <mstrozek@opensource.cirrus.com>
Subject: [PATCH] ASoC: intel: sof_sdw: Prepare for configuration without a jack
Date: Thu,  2 Apr 2026 11:59:43 +0100
Message-ID: <20260402105943.29605-1-mstrozek@opensource.cirrus.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE5:EE_|SJ0PR19MB6868:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 21a129f2-6cb4-44bf-9dac-08de90a6f9b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|61400799027|376014|82310400026|56012099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/RPbVEpcgVZJvOI4WTRkW+ZYMgLAmmqnYSRMxKamS99hXT2ywZafwQ4JbxturGWtpypkK6yGZRxvGhMBWz7F4imtHCtS8m/qyiVU7KGPPlhlnlTPNRV4Yz+nw6oqfozc9qatTlgv+GdS8r2Ho4fhlAgQ3aYOxOlw1WuHZLQqkbyOgW47KmAPxUCUfvYQbb1zLSuXUuZpMgW8/IK+/TJc98NkdicOOGn9TlzFPq3eZMhMGy4VCbbH1B0G9cG1bZTFT3N69mGHBNHRWTet1wgcDHTOhIvMUvm/+Pibd/jVqrB0IFnc4y8+ualas/qWFaJ1Br6sRK42/je3rUEEC+zLsbgaXVs9emFSsz8tRL90CUwYLSWs0BLrNZikTiz5JrKckUUQIuIha4l8rnJ5gwY2yLzfzRsXuKjl9Vvqjd6h6p7ONgMKrcCoUJ74+zESHsIzPnPAR/h08TJyPT+2cbFwyPx+kp4lBh8hP/MqyW4J+vkahiNQjFOKij147vOTcUvHlCBWLGQWo9MKjMkc6H4r62SO6uUziHAISRhVqcHWti1Nnh9FHfypl4NsQ6tYWv0B/cohPkLQMs0pTuYSR8s910/kYzl6t2sDGh9tvD4/fsPQ+RQr19Wnm/b+VO8mc8136GQ8ySXqOq4P25jo3AkBm/dtfKF1JpfMSMlxh9OvMeRmB8RtFbsPIAnL0w83hvAuL4Xw6WPwDv0AhY1n4znunMzLw0FdKKub0phAwiulzk0aKM5sy39+/g/CF1uLF7n2wPxUmWxa9ecV1s6uvzporw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(61400799027)(376014)(82310400026)(56012099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	e6ovYEpY3V4lp9QgyNbS8SLIkyypblWUu2tsi2UEI/9+pCZQIsPbndbHvlADL7LKlJf33HehYniiU0VIm/3zcMTwn6TivWIqk/ZsQsgoHOOnr/xuZQJh3MxqVxjVA61tBn/wJ7EDI22owlZwH2SfoLhNTMIprcLMKoGrX85sh5wVmNwsCc+qT2HpVmcM0wJAAbDJfUM7ABxI2KmObKqs7aZcLyB5VhZM9/nOa6l9c5tiA5unz1Hfu5XFu1dl+QxOpDwFwXprS5j7pee9ApHr9fk9q3CAFa034m05RVxiZ+wPo3y4RcW8Wb2Mu3RlcxDXMOupd4Zvx+BHko4XdZ/M8r0NQ29cpNkuQqo260oGB9cIRelKSx5J0XJPnv2C6QGReezII4A1jEZ4oBBbs1Pl8whCgWIkqO1hj1ylv2wDpygvp/4ZR2g2+ptM6zMQrypl
X-Exchange-RoutingPolicyChecked:
	cYSqjeqmBkmOzl60DbvDkFIGcH+4wsImNMw5I3pq7VCMElcuefl4TqZ0mZwT3Wg7QhzAssjuHoWvR6IUhY+T+mKdMm2JQz3SZMJKfLkUx6fWKRsyvrCoieU9tZj/DFvzl8abZl9h5+4Ur1HqyAyNlb1dB0Mc7MgUJawS/jeGx+myxoQdy2nNqdaBycRNXB/fLsOOWLqdL9IZvHMkNPUybHy+h8f51u0uvmmReNKjOYOC+uZ6spujcFc/QJTANZsQLa/Me9bPMEGcQe8V8GwY/dprqESkogc8x9Wou/Y9UwhktME7YSFP5eGjqO1bqw66WGyNwrNTYy77KEQyECdkXg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 10:59:55.8040
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21a129f2-6cb4-44bf-9dac-08de90a6f9b0
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00001CE5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB6868
X-Proofpoint-ORIG-GUID: G1xP-Dvtl8NXQL8NDCA-wGZrKsnO54PK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA5OCBTYWx0ZWRfXwQGOd71Eq6wJ
 4anbKg2wvgcgmD8k7pWbvXjxAbGEAbKWVHd6pugp8qP5u01in5VVHMT+PShHRf4ArPu0842n6JP
 KtNHeMPGkhQVFZ5/+G6eSk8Sgwq5rAoKpxC9pFWDdq60AwzO+YDXEcrLd19kLiHV/VilqKczCqU
 7T5b2uh8qfC7YPrp0uozb35JYoNELdW08oviVcvQcXN4ipy9PecYJ4ORCNoKpKbw6/NNIvVMrEQ
 q9Iuiw0BtmGWnH0luEYHhlUQTrtSQMSdf8O2GveUzuUv9OCBDbn3wmMEdJ+8FM6v8VHo++Vuumn
 /ZESRQnmuskAgBNACwoV/orlmArRtYIaiFwQkZoel7rt4OG3xY8ECH8cCAmLCskei4EGLkBnkx4
 cNMkHkAuxn+c7Ci8esQtlvZ9PO0LaGF/t/L347omzqH2jyLXDv2QDztPAsBX4qVRVfgHFxSreH+
 7rb/3OxzxA3w+NXyw9g==
X-Proofpoint-GUID: G1xP-Dvtl8NXQL8NDCA-wGZrKsnO54PK
X-Authority-Analysis: v=2.4 cv=Xvb3+FF9 c=1 sm=1 tr=0 ts=69ce4c30 cx=c_pps
 a=LFjpZjn29ChKSHKeLyduCQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=YsuQF2o18IcjyoC79ZAA:9
X-Proofpoint-Spam-Reason: safe

In certain setups of cs42l43 UAJ function may be removed from ACPI and
physically unconnected. Prepare a driver for that configuration by
setting a system clock in the speaker path too.

Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
---
 sound/soc/sdw_utils/soc_sdw_cs42l43.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/sdw_utils/soc_sdw_cs42l43.c b/sound/soc/sdw_utils/soc_sdw_cs42l43.c
index 2685ff4f0932..9ac779f51130 100644
--- a/sound/soc/sdw_utils/soc_sdw_cs42l43.c
+++ b/sound/soc/sdw_utils/soc_sdw_cs42l43.c
@@ -107,6 +107,7 @@ EXPORT_SYMBOL_NS(asoc_sdw_cs42l43_hs_rtd_init, "SND_SOC_SDW_UTILS");
 
 int asoc_sdw_cs42l43_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
 	struct snd_soc_card *card = rtd->card;
 	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
@@ -134,6 +135,11 @@ int asoc_sdw_cs42l43_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_so
 	if (ret)
 		dev_err(card->dev, "cs42l43 speaker map addition failed: %d\n", ret);
 
+	ret = snd_soc_component_set_sysclk(component, CS42L43_SYSCLK, CS42L43_SYSCLK_SDW,
+					   0, SND_SOC_CLOCK_IN);
+	if (ret)
+		dev_err(card->dev, "Failed to set sysclk: %d\n", ret);
+
 	return ret;
 }
 EXPORT_SYMBOL_NS(asoc_sdw_cs42l43_spk_rtd_init, "SND_SOC_SDW_UTILS");
-- 
2.48.1

