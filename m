Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F25A38399D;
	Tue, 12 May 2026 10:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778581900; cv=fail; b=hrWeCA6vIiGtS/OY1DZq2enlhuwRedbAI5LJn1g5NeyiccTG0ylKWSJ2Ond2pZiEJhBb+iGAQd7Jp+tCSTgvNr/3AyOApSg/E+0+z5hr1wA+w62dTbTCBZdCaFpXWvsEIJOAoKLXV4N8ucceYHQwj+AQLih6jfcJjybx36GHPd8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778581900; c=relaxed/simple;
	bh=gew5Fe0c0JxrqEZZQgT8/dqebCaCEIDJSLB/NXAhAek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sgQJPd+Zc0z4LCRRPBxP1cRcbwrCdh1L0eDFzbKYufrZlGvuIgzQ3Vn0cVszT5ZdLpe0mEXoLMPTn57+0CoQvBRZ2L1sWSYnlzKNCI5HyCWa5+BQmFqihjWYVKos4ZA5porrLgi5NWHXlqzz6qKzHz5P5Iu44DgOe1sQz4x8IYY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=YsJ2yiQk; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Xr94lBXP; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="YsJ2yiQk";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Xr94lBXP"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C5x1Hg900775;
	Tue, 12 May 2026 05:31:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=f9z5ygzpIbOhBaiIgykBZwFuz/adGHF1WziC8wU7CN8=; b=
	YsJ2yiQknyMcmJGtBH2maoewRBjtbSsAfQOUOPBa7PhWScjxNr/Dd0nsDsuW0did
	LSZ1fJ/a0YnBKOKGFWQDRcPpenxD9SXeHUlfX7ZGC7cjzynHcdA/4wLhK1JedXeO
	12O2lWJFHXUgt9/4O45+aUsEAZt9utmwfH4j5rYc1Fu6YlnBCCsb82xOyRp9PAR+
	0Pq0TK6WwvQk2hH8Nch7fwJuRHioOUp1Ckgh6IT9EybYcqv2QYKVrN89dVUT/FAj
	tJeAE69+RRMQbeDwLijqx0AyIH79mEpoB6ZhEUoBZV3fr7TEPdjqnb33/I4yOM5B
	CBmn1h7Ej7/OMA8E0cCQew==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020095.outbound.protection.outlook.com [52.101.85.95])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4e3nvvgr3a-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 12 May 2026 05:31:09 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hd9WLpcqmssTfUApP7Tydfglw3oAxWmuezowK/34z3M3jp7jOR/mwiD/J9xvpF4cA9D13mVQ4wu2lz8tOKb35OEHbx68dJ6vZgtxW3hPVKZMEktdzeB5EkoQXcFELuUgl0NhLi+ByRFIY1OOn1HlYo1NXRy7Q84V4rFsHAavlUXC6WmQFZ51865mGLBFkEo2MXWOPswKEPPrrayTkAsMzyCQklcg7DGbXTpg4iW32frKccnhCJQM7Vo3k7C5u84/28+cmqGIAoANbLCOu1ps9ZAh68fslQoGrpn+e6AbZxOx0IRHsKX768JhjfuPOUw5ru2DjeIsX+k78yrBXkb8XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f9z5ygzpIbOhBaiIgykBZwFuz/adGHF1WziC8wU7CN8=;
 b=CJnGfJE8Pzw8APnqhT9LRuInPGccGtbS0gOazJYlhC/YVELMBuyTBH8tL11Mypd7Nc4TculwJTkK2P2pv2zrG5QiIyVYg1KIVkYRIZMufR8VhlVssO+YL18sTrTMZwQs3BQDsNzUpo/atZJ5YG3snz0NUxhdL7MD1h09n0yXObmW/7nTDGwa8UUsQ74fyaSn8kUGNfv166W64Hp4mmiZX3oMpLR6GCJ1ap6dbIkQu5jsU0NdlR8z7rHyW78GIwNnBoPUKN5JKGb9GE+ywMffVKUv4XfOvEDVDTkYuND7tc6ULUBbR+2v4Ba/hqW+05IhfnKE+w6BsQ/zxrd9P2sCMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f9z5ygzpIbOhBaiIgykBZwFuz/adGHF1WziC8wU7CN8=;
 b=Xr94lBXPggfxXqkTWqg3j0fmq2/ywAf7CZDf5yhsLXsQELI2YrGg21cv7cisre3jF10cZYwHlboNLZtz2N4l5c7I7sSjPwIXk2xyluGzYkGYXUBgxeKR36vv8hZQH0DiDgQ3Vu8acn+0scPgJ1B1FCAKOBpe/AtefcimLPXkl1g=
Received: from SJ0PR03CA0356.namprd03.prod.outlook.com (2603:10b6:a03:39c::31)
 by BY3PR19MB5043.namprd19.prod.outlook.com (2603:10b6:a03:360::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.18; Tue, 12 May
 2026 10:31:04 +0000
Received: from CO1PEPF000066EA.namprd05.prod.outlook.com
 (2603:10b6:a03:39c:cafe::2a) by SJ0PR03CA0356.outlook.office365.com
 (2603:10b6:a03:39c::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Tue,
 12 May 2026 10:31:04 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF000066EA.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Tue, 12 May 2026 10:31:03 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 6CA7E406556;
	Tue, 12 May 2026 10:31:02 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 3AEB582254D;
	Tue, 12 May 2026 10:31:02 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v4 02/18] ASoC: cs35l56: Use new SoundWire enumeration helper
Date: Tue, 12 May 2026 11:30:06 +0100
Message-ID: <20260512103022.1154645-3-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EA:EE_|BY3PR19MB5043:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 86198d93-8fea-4f69-d1f3-08deb01191c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700016|7416014|16102099003|3023799003|11063799003|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	zNsKEqFpA573soRHJuDawhs3E1PXsCZSSyC1nqk1sFoizs7O4KRhFFug3iIgNnl1lsxGjKMd5nJrnqPJbFlQ4eKoCWtvZXlMDxg5EnTJ5jGZsdaAoxIOksFsEOEBLpVgvHSLoU95B3axzP7qIN4oAdAN/BJ+HmPhTHNbq7074Zy1KgK1Cxr2Lxy0FWPVce8nrcAp0XjZOdXMSqxBlwEKc08W+2n8LgOOWjkUwWTxcoqq5JJ8rkk1Zq/ovRZ3y71MLba4q5l3Ntmm5G1X6cBBJqPVPfOJ7DRcmZVeYBETmzNJFHikF5qLv0Qfw2MAWkDGcfRuQ4P1tNqf5iSaYHs90w5cSK3+MLsQYtX5gq7T1Zy+eXvnZyxL6aoKKk9T+0nXfIqORoWXMg9t2K4PtDs5+ziNh3I4hqz1vYK5DN5Zkxg3Gs7YhgAKoZ/j5xzHjwVTL7Y7QcFkh1j18n/OxoVJMsrC+UXTZWrnPeOpcOc9z2Dm1w/PeX32OSknaDYfLoZoTdyHdvDHsl63/6am7Ymg/BH/I0CtET7DJotq3/Q2Mr7kfzMOuBh26zZHs9DIhJGsJhZDWXSw7S9fzAoF6ahirEnzv3hXukjT+HTGA5NNczok5VtJkTe79viLnINkBvei/LT73IcyQOMboB/gJRy4joM2mkql85yora3z3rTyRTAWxNnfPqp5pZuh5uNrSsilinkY93R8E5LItDhB55UxVTnFQ/1pxQP+v8VTFRxP2/c=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700016)(7416014)(16102099003)(3023799003)(11063799003)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	eJC5KvSv53gn/X64epSQYE1lAbjZlk5uqLkyFCQ/xcg2fwkhvrjOX2ou/knP5XdAxxqDSrJTVaiaAFuM5Gsb5ZpWqj8vAGpvGl+1ibP4JV2LKQouDEdAyfNrwnRlsx/AnENGIio58btFGnnxWQ2mSQ7BZmFiG21rvoCEvS92MqOPgAmHa2a6H4xe3eiiw15ehhLrNNoUeFQftqZlJ+IiKRsAbL0B5sgEP2ae5yygPyWZAozVSbqBcK9XW+NCqwPwl6lpCZka+UlAuRGoOBlhK5keOLJ+eyWQyEVOP+m/DEXSFcpJ4pBiKSA570auRG/5dDFaJzM7ConpDizz83QaGgNCQKjjt7/RhPyKgrjmoOjxKLVoomDCjzf9mLBBN2R6b2FI/SEbk8xp7rAUMOhOshLIye5JrXkmJ5dbmop/cB4Jx4NmlVOGGdI7vvGJiSfu
X-Exchange-RoutingPolicyChecked:
	I4/eTHzeEy71Y/kiqj4Ni5AMeASd4tcfiQjMrJDWC/zmtKVb4H4X8CLzxqvjQnocIG7xWwalz2wJh+1wyE6CN3SQCny5IwPf+8LYvVVjIdBSQ0p8sMFEY6qzw2X2EiP4s232ciwoxrSuGwujHIwEcA+Crk3j4ysBN1qvrP/kpUmx1X6o3e0c+Kep4Ir8PfSzD8ah2mf8NqW1EQUqhLfmQYCJwrZKhGd4l+0W0Z4vgl6VdYkrwQVMPFZS+nqjrAnXggc51Avu1W1NSK6fSGZ2BBwRGPazTX3Ho7k9RxmV4MQSMRIzQsg9Fk9JDVio/cxnyR73aB4H9cMqATD+Y7lI0Q==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 10:31:03.6827
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86198d93-8fea-4f69-d1f3-08deb01191c8
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF000066EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR19MB5043
X-Proofpoint-ORIG-GUID: IREJjU4O1DYRUX-bYTOhIMrxyzfaGasG
X-Authority-Analysis: v=2.4 cv=CdY4Irrl c=1 sm=1 tr=0 ts=6a03016d cx=c_pps
 a=ws69a72eWNNXWagsEosLDA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=_kLIPOSdNJ7StitxxVsA:9
X-Proofpoint-GUID: IREJjU4O1DYRUX-bYTOhIMrxyzfaGasG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEwOCBTYWx0ZWRfX/2sEaMmBM3Ov
 fzFO17RRJ/qhGEIeevnf2S0KD6VT434P3puIvCbbYslGlw9bWd/u+o2FA8S3CkCk43f/PgH8jKS
 cF5xY2wTRHhqJxWGxdqVWg94OnfW9XdzfsT/BAdewU5mBdwGgWGFibRwyl7CIrgKlIu5FrA2EJ7
 f002GIbQHEeSEhWf0yNLyPzfNRCxXTD896bT3JrzQ3SJe44b8l5bYJ0egl93MxQ0FyPiSVse3qE
 OmRC/mlOwTaEjIq+lSGNfWob8mcOIHJga1vsZu+5UEw5/lz9ieW39n2j+QODnKkov9FX9+kc0H3
 HuCNTv+OUChWd5xtARWHtKqhjq2Fq7/MQGXGDX4N0jdGAZpoSi4iS+RnL27IzbQ4LHHYK+r2uPb
 DaEN4cupzOZiXXqjFayyE2+HP17C5CPR2Np6rkDgzMG0gBeW9ESG49Oo2kfeCOxN9qwntMpQ/uu
 PTvySawXP1W3g3XXigQ==
X-Proofpoint-Spam-Reason: safe

Update the driver to use the new core helper that waits for the device
to enumerate on SoundWire and be initialised by the SoundWire core.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v3.

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

