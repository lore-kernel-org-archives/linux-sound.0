Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6B727F749
	for <linux-sound@vger.kernel.org>; Tue, 25 Nov 2025 15:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764084115; cv=fail; b=OI3hyloiggw7qFl/uroYMjrKsUHSQMnHfbwXiL6cQ/o4EsItMjrMko/IBhK02MVnDzT7Foglmd/9eqL93nXVsUhRaNF+noTK79OE44Cp0dyK2mDQaCAeimIBV1IVLVKnaIqeYBzJfO56skw92xY0z/rU0ngubsRkFJXFT9RQcBM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764084115; c=relaxed/simple;
	bh=jxfwDqbF9tQyskGpaCX9mswvuFN2c4pZ4NdxT/lD2ok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EpYsp39Ewm3XB5AYN8Hc5TvD88UQxf8PnapthiyBAjU5eQ81uPHqVjZ45noB1d8LazVjthIZImq7M8Mr86ypLLNJuMtykmBT/b3U1qVH0RXJz2tz6ioOL/5+BIXQCnCF8dn9+HPf/tUWqoJT4lxdlf5hEf9EU5YbHRTCI2EN8Tw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=CV85OH0s; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ev3bJf5p; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="CV85OH0s";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ev3bJf5p"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP4gsXr3663653;
	Tue, 25 Nov 2025 09:21:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=8X5vYAQfv9SVjTSnWj3J27akw0T/JHv5JmqWsV86dGo=; b=
	CV85OH0sL06GoiSDfrvieYBkTaCXWyjWgPCtnhP1lM6HkFCI98mTuLo7lOUgCNxG
	IHjOTFtfm4FICxrQC4nK6GNrnQdo9hJyEmFJ/G4XWCzvpQBzMewt8dYqmlIbRkcr
	/3Kmb0ozYRtIdes9p8CEYALHXTvvD9iirjifBhvPxFVP72iCeAsdYt0m8LDrYPI+
	mxKV7hDE/GqoTM6cYmjkRAxTFsQm0IE1WNuyPb8nQJLwa2cfuvqHdOVBMgPCaZlc
	YH3Q8amxPxxmEXGQG1F35IMsXAzuAJfIBEUGZ4Ei1KWy4KMJShnr2mQE9NSVkl5a
	+zoqPRZ/ZY8RK1lkUBYuOA==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022133.outbound.protection.outlook.com [40.107.209.133])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4akafkb7cv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 25 Nov 2025 09:21:36 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Re1mia4dkDHWsHn0BPE/MdJmDuGveVITxTutYASxVl9Bwy7i620a63xQDBbOukBCrnaTdX+xyzYnuqdgQ7AHVP9IdUw6cJQotZWa+8TPXrrrD81nQl4jnC3wzGv8Rxi5dEywiByAiEfPk+LFxJDK5nq573mu8tFJCSlMUei5Y4QvAE5j7X/riKNzujOYz+MqdPBpnZwQwMrFeu+55gi60JW80Zu/SM8WVdIj46ONB14u4OAGFyGM0nnds9J7h8gp/EIx+ouy/gs56djfBUQF229HlZ3k08BhsbSfWA+8wwSaJaizh9PpbmVnrGel+Mo8wFgx3fz29suyBo1HLVGoDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8X5vYAQfv9SVjTSnWj3J27akw0T/JHv5JmqWsV86dGo=;
 b=B8Oh9G7obl04pZ7929UyQZrdxluTapqIJRpe8pVHTYKjcQXAOZxwajpBhQit36Q6p0Wzh0MUbDgcjAAnNZcVq4mT43cjoFJ03HGvvH1479jduMurXnPnYNpiMBF1kpn6c7IETAiI1+Koe1UIU2tO1cFDRJ119osgjd4fmzGmNrNQ5mL5qQWCRdAo5wsSlCfl8v2FE3071z7QnqCZJiDKXp6I9v9GdqfGRZkLHzYAi840yQqAqFbqiL6HVVPdOVGg3tb5l+YCe1opksHItNKTWuc4e9ujajGB4+1ziwNwpY5KQjM1eqU6gNgUXoEH9tZx1NRMry2JCNzw7BZgYeC4GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8X5vYAQfv9SVjTSnWj3J27akw0T/JHv5JmqWsV86dGo=;
 b=ev3bJf5pycYQvub4UHPxHKHxuDOvX87pKnzrcXw+KsjglYyeQf3qz6ik2ANCvNYJOTR+QnLyKdzp9FAZWLVpEygElXtTm6p1Nc7obVBebRFtuEZrIvdlV0hzs18XEuU0iPeO3nF8ODwbNOaP6x5t7mbCTyx6UUQID+0NhkbJYNU=
Received: from PH7PR03CA0015.namprd03.prod.outlook.com (2603:10b6:510:339::19)
 by SA0PR19MB4444.namprd19.prod.outlook.com (2603:10b6:806:bb::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 15:21:34 +0000
Received: from SN1PEPF000397B5.namprd05.prod.outlook.com
 (2603:10b6:510:339:cafe::c8) by PH7PR03CA0015.outlook.office365.com
 (2603:10b6:510:339::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.11 via Frontend Transport; Tue,
 25 Nov 2025 15:21:34 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF000397B5.mail.protection.outlook.com (10.167.248.59) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.7
 via Frontend Transport; Tue, 25 Nov 2025 15:21:33 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 80C1540654A;
	Tue, 25 Nov 2025 15:21:32 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 60436822540;
	Tue, 25 Nov 2025 15:21:32 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        vkoul@kernel.org, lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 2/7] ASoC: SDCA: Add ability to connect SDCA jacks to ASoC jacks
Date: Tue, 25 Nov 2025 15:21:23 +0000
Message-ID: <20251125152128.274808-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251125152128.274808-1-ckeepax@opensource.cirrus.com>
References: <20251125152128.274808-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B5:EE_|SA0PR19MB4444:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f36a03a6-2705-476e-e2e4-08de2c36516c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wg1t8ACGFMLjCNzb9ede0Xvprle/t3bAky+jpFoUgJYjbs9ptn6UsU2Q/9o2?=
 =?us-ascii?Q?mUw09EfNUkDFo82MOiqURopb7tn3R5K7m6bC6AM00ejS3AI+5/YXkGarH42A?=
 =?us-ascii?Q?3C4OdPjdzM40k5Wty87cKhuk/2dAE8sx1b55kV4plJaqo0d6EpI9D0UXuatX?=
 =?us-ascii?Q?kzRvFKKaFuqKQ7DzmllUYeTgJfaNR7acAPwNSSDZbtIq5AtgSsFpXdhBN2iG?=
 =?us-ascii?Q?wzGp0IeT8bb+iKGz0JhklBlNWMBlwRUkgtUcdxWaceOkkovuSjhf/qBHRG0G?=
 =?us-ascii?Q?AMVdafjm5FK3Vd8TYio9e+yxpwWFZRtbAQm6bfT6pXZzsHIf/dHx6qnuxX6w?=
 =?us-ascii?Q?3sb93MyRGJbhsBhS+q4aOBiS4vmTv96YHHzDoEeWK6CJw5zL3P1tpwI2/9Pa?=
 =?us-ascii?Q?clkS5942/jf07Hp/Pxl83P3d/wGi7+jAeelweDn/jPs8V8YijsP4DaYwVZM6?=
 =?us-ascii?Q?0ye0HcXElytegwbS1buGegJothtYS7uvVERnlVbajus/MLZPr5u+GoeR/YF2?=
 =?us-ascii?Q?Hfzc3dM6rXgGW9PDFsXMuE77ScbKo0iJmL9HA1F6YDO9/FXx+eVL6UO8Uo5J?=
 =?us-ascii?Q?VYc/cg1zlCwMq/gazvmWm3xO/wPyHwLmaGeCbvEYDuMNolBtVC5Ifl2A9uRm?=
 =?us-ascii?Q?vFFqoBOBOAHdV1jZ1IX9P7Wo6VIzHSN/dactD+Rzk2hb3CSNt3aUEbM+9j6S?=
 =?us-ascii?Q?TnvXs5iuosqH5dEWpYtLO1DYg95LP+kZd77TRiLfpo4S9RKfjC6mfISqA7uk?=
 =?us-ascii?Q?gCI76MV7Sgf/bW5jx93K+eU7T7FXm62s422yUjc6IKzDQyMq4Yqk0SwuXk2e?=
 =?us-ascii?Q?ZSr72ZTFMifHGawFzhrr9+2Ey2bdT3Hn9vE4Nt19ABjOyp2e+ldUPV7wTHB8?=
 =?us-ascii?Q?Ht9Ekj5LO7MwZZlXWGpyQF3sE3yE6tHBxZmLCskkaTF90iMbJQ1okAGIPwf2?=
 =?us-ascii?Q?ChhOtWKgKBJstIXq64jkRVxkBEZzZUJEuiyTA4nYSBeICQcxlV+N8+c3eeRu?=
 =?us-ascii?Q?/k9sMo5EoHb3iFhdK3s+ckmHp+NgHojGANgnuXBNCAs5XRrUwPurwCADi57v?=
 =?us-ascii?Q?fwcDz//kIdtbJtFy+5Y3SucsLFIfAyqJhHr53ajF4GFAj2KpzS5dcwoDIWT7?=
 =?us-ascii?Q?XAeIB8yLKHUKh2zvk4LTOg4PUCM7KzatWhfJNFzxeGj/2kdRMycNS1cuz9Ni?=
 =?us-ascii?Q?0U85FbiEXEfNiN+KIKRAsU26t1G9XcSNoB1FHtIkfZAdKmkThy6yfUxh9pYx?=
 =?us-ascii?Q?5rfbv+yhgVcgCm+CJBgz2pSOJXr8zn0eK8y7nN0bI3+bOVjlxsWo6BDER96d?=
 =?us-ascii?Q?Bed/WFd9a+rs+7WhgVKgwIUitDwrHB4IUqcF0SQpchfGcEOeMOHjdIanPmaD?=
 =?us-ascii?Q?VUagof9qyGjRMbRx7qLPJNSkIxnBBNzKzkfXbWU8yi4FyqVduuKlCNUc485g?=
 =?us-ascii?Q?2zvrnV/i00Lsk6dou3wTb1Szm7lfqducxALUHpNluBX3i/So4A+ZWQSEjMC0?=
 =?us-ascii?Q?urOzQe1xhkh/b6WXneFRj3lNH6BzS3tHB5RQvR+AoGDm7wIJ0FTq4zFSWeva?=
 =?us-ascii?Q?RHJUGr8RqWctrbGWibc=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(376014)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 15:21:33.6329
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f36a03a6-2705-476e-e2e4-08de2c36516c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF000397B5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR19MB4444
X-Proofpoint-ORIG-GUID: KncsroxyOPfEDHq7xjWFrjA0HZ5-0pul
X-Proofpoint-GUID: KncsroxyOPfEDHq7xjWFrjA0HZ5-0pul
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDEyNyBTYWx0ZWRfX0CwxL8mtO2Kn
 N7HyKJN0Bcdi6oo4snbFawUNDirolCiMMzfn6huXeL+E2CSjMOqHxpRA43d4fjcgM9lR0REuMH5
 AWJY9wuAFrqGRwyICsYnK9r1IkWuU7HvIKCQEsKvRLZSVcWDNDCzu8NgHoxTnV3UXHocNFi+kW7
 kOx1J++/CjfsLiPjl2XjTEbrxC8wKkJfYvKpyj0sH0GkU8Si1My177/VWrY9C3LO5Y1CZQmZB/7
 T4DyHPBWABUnxBhKUCNzz/B2ACyULWER5pZOi2+MGv05W3mq3Hnefx75j8m9exiJogA1/XM702u
 UrKYbK0Q6UdAwh2cTwyKXQJH1hUt+as1Vn6qCu1jrwJBlumOQR24lfnx0yrSTTqXYxoCBbAAsud
 tkTFDMzkl0jObtTzL23pAotuxEi7mA==
X-Authority-Analysis: v=2.4 cv=Dacaa/tW c=1 sm=1 tr=0 ts=6925c980 cx=c_pps
 a=o+9IzLN2JPavfcgUIASn6g==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=CYD-5wu46CJa73xgJB0A:9
X-Proofpoint-Spam-Reason: safe

Add handling for the ASoC jack API to SDCA to allow user-space to be
hooked up normally.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/sdca_jack.h  |   5 ++
 sound/soc/sdca/sdca_jack.c | 106 ++++++++++++++++++++++++++++++++++++-
 2 files changed, 110 insertions(+), 1 deletion(-)

diff --git a/include/sound/sdca_jack.h b/include/sound/sdca_jack.h
index 9fad5f22cbb9e..3ec22046d3ebc 100644
--- a/include/sound/sdca_jack.h
+++ b/include/sound/sdca_jack.h
@@ -12,16 +12,21 @@
 
 struct sdca_interrupt;
 struct snd_kcontrol;
+struct snd_soc_jack;
 
 /**
  * struct jack_state - Jack state structure to keep data between interrupts
  * @kctl: Pointer to the ALSA control attached to this jack
+ * @jack: Pointer to the ASoC jack struct for this jack
  */
 struct jack_state {
 	struct snd_kcontrol *kctl;
+	struct snd_soc_jack *jack;
 };
 
 int sdca_jack_alloc_state(struct sdca_interrupt *interrupt);
 int sdca_jack_process(struct sdca_interrupt *interrupt);
+int sdca_jack_set_jack(struct sdca_interrupt_info *info, struct snd_soc_jack *jack);
+int sdca_jack_report(struct sdca_interrupt *interrupt);
 
 #endif // __SDCA_JACK_H__
diff --git a/sound/soc/sdca/sdca_jack.c b/sound/soc/sdca/sdca_jack.c
index 83b2b9cc81f00..5b9cf69cbcd6b 100644
--- a/sound/soc/sdca/sdca_jack.c
+++ b/sound/soc/sdca/sdca_jack.c
@@ -17,11 +17,13 @@
 #include <linux/rwsem.h>
 #include <sound/asound.h>
 #include <sound/control.h>
+#include <sound/jack.h>
 #include <sound/sdca.h>
 #include <sound/sdca_function.h>
 #include <sound/sdca_interrupts.h>
 #include <sound/sdca_jack.h>
 #include <sound/soc-component.h>
+#include <sound/soc-jack.h>
 #include <sound/soc.h>
 
 /**
@@ -114,7 +116,7 @@ int sdca_jack_process(struct sdca_interrupt *interrupt)
 
 	snd_ctl_notify(card->snd_card, SNDRV_CTL_EVENT_MASK_VALUE, &kctl->id);
 
-	return 0;
+	return sdca_jack_report(interrupt);
 }
 EXPORT_SYMBOL_NS_GPL(sdca_jack_process, "SND_SOC_SDCA");
 
@@ -138,3 +140,105 @@ int sdca_jack_alloc_state(struct sdca_interrupt *interrupt)
 	return 0;
 }
 EXPORT_SYMBOL_NS_GPL(sdca_jack_alloc_state, "SND_SOC_SDCA");
+
+/**
+ * sdca_jack_set_jack - attach an ASoC jack to SDCA
+ * @info: SDCA interrupt information.
+ * @jack: ASoC jack to be attached.
+ *
+ * Return: Zero on success or a negative error code.
+ */
+int sdca_jack_set_jack(struct sdca_interrupt_info *info, struct snd_soc_jack *jack)
+{
+	int i, ret;
+
+	guard(mutex)(&info->irq_lock);
+
+	for (i = 0; i < SDCA_MAX_INTERRUPTS; i++) {
+		struct sdca_interrupt *interrupt = &info->irqs[i];
+		struct sdca_control *control = interrupt->control;
+		struct sdca_entity *entity = interrupt->entity;
+		struct jack_state *jack_state;
+
+		if (!interrupt->irq)
+			continue;
+
+		switch (SDCA_CTL_TYPE(entity->type, control->sel)) {
+		case SDCA_CTL_TYPE_S(GE, DETECTED_MODE):
+			jack_state = interrupt->priv;
+			jack_state->jack = jack;
+
+			/* Report initial state in case IRQ was already handled */
+			ret = sdca_jack_report(interrupt);
+			if (ret)
+				return ret;
+			break;
+		default:
+			break;
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(sdca_jack_set_jack, "SND_SOC_SDCA");
+
+int sdca_jack_report(struct sdca_interrupt *interrupt)
+{
+	struct jack_state *jack_state = interrupt->priv;
+	struct sdca_control_range *range;
+	enum sdca_terminal_type type;
+	unsigned int report = 0;
+	unsigned int reg, val;
+	int ret;
+
+	reg = SDW_SDCA_CTL(interrupt->function->desc->adr, interrupt->entity->id,
+			   SDCA_CTL_GE_SELECTED_MODE, 0);
+
+	ret = regmap_read(interrupt->function_regmap, reg, &val);
+	if (ret) {
+		dev_err(interrupt->dev, "failed to read selected mode: %d\n", ret);
+		return ret;
+	}
+
+	range = sdca_selector_find_range(interrupt->dev, interrupt->entity,
+					 SDCA_CTL_GE_SELECTED_MODE,
+					 SDCA_SELECTED_MODE_NCOLS, 0);
+	if (!range)
+		return -EINVAL;
+
+	type = sdca_range_search(range, SDCA_SELECTED_MODE_INDEX,
+				 val, SDCA_SELECTED_MODE_TERM_TYPE);
+
+	switch (type) {
+	case SDCA_TERM_TYPE_LINEIN_STEREO:
+	case SDCA_TERM_TYPE_LINEIN_FRONT_LR:
+	case SDCA_TERM_TYPE_LINEIN_CENTER_LFE:
+	case SDCA_TERM_TYPE_LINEIN_SURROUND_LR:
+	case SDCA_TERM_TYPE_LINEIN_REAR_LR:
+		report = SND_JACK_LINEIN;
+		break;
+	case SDCA_TERM_TYPE_LINEOUT_STEREO:
+	case SDCA_TERM_TYPE_LINEOUT_FRONT_LR:
+	case SDCA_TERM_TYPE_LINEOUT_CENTER_LFE:
+	case SDCA_TERM_TYPE_LINEOUT_SURROUND_LR:
+	case SDCA_TERM_TYPE_LINEOUT_REAR_LR:
+		report = SND_JACK_LINEOUT;
+		break;
+	case SDCA_TERM_TYPE_MIC_JACK:
+		report = SND_JACK_MICROPHONE;
+		break;
+	case SDCA_TERM_TYPE_HEADPHONE_JACK:
+		report = SND_JACK_HEADPHONE;
+		break;
+	case SDCA_TERM_TYPE_HEADSET_JACK:
+		report = SND_JACK_HEADSET;
+		break;
+	default:
+		break;
+	}
+
+	snd_soc_jack_report(jack_state->jack, report, 0xFFFF);
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(sdca_jack_report, "SND_SOC_SDCA");
-- 
2.47.3

