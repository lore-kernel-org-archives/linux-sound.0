Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9073F88BA;
	Wed, 10 Jun 2026 10:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781088966; cv=fail; b=E1TbSZ/+YfvHoKTCmfuIt8VbH52qkBq41s9Tq5WNlikdwh7TqxLF0P5RJRaVKqlt2IrsJpqzgGdGo6myUotxgqzdurHMW/LHxUrL1MxM5RpJ59/wtwv3HIrAXR20iudJQ+T74i4qrOy+OEkIaic5hlZSaI77p7KhnRcfRt3aT3U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781088966; c=relaxed/simple;
	bh=2sH69hKe1hATi8hpiIvCyb/+GNKBqzUyESQhZ+fEI50=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WZMdIPHihLQb5qf6WIAFAV9dc947s6U3bW9SBYUVR/5dObW+sH5Xj48Y2WmZYAEojqlVXJT+/ygXss1sYNxMQrQprKEjddsGidP1y5xeYhKKIRkEMSiED3VzIbRqEWLusWdJiwF++nr3+xSwVTYXC+PI+lUEQ8PydOfcCs5Zd58=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=diZD6MuB; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=PuP1WDC+; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="diZD6MuB";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="PuP1WDC+"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A3ls5k2444315;
	Wed, 10 Jun 2026 05:56:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=RuuKpIR3aTjVjIZT
	90DsVJ71iU+kk76/u9JU73WZu54=; b=diZD6MuB5mum8s/EY2WaGogU+OoG4liN
	P6yjgMvXghBVaMa95m0LHVYBfoxAatO4FKNfMa3Iib/JKjf3/m/IA9Jdb2PJorwh
	7wzOYkIPqApnKLc4WWQp/gf8JwusUtuJpY3aI5RKB623cFCJFP3IopAUmSRuRa/l
	5+zlYem6PBidVJDzy+L2ZQNP2GbXrHrO79mrpNoHrkQ8KuWpGCYpsG30bse65qSf
	9NFWHhxhiZGvTyBLI/ZAArq+hxDDdgOb+h+n8iilCSnDuCLAa4/XNzxYEX4NHOUP
	7TMOEH5Xj+MAOIthXgdbegm0T9kjFXqHLvY0ApZ7WFRhpOjtISO6wQ==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021072.outbound.protection.outlook.com [52.101.57.72])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4emfyge4f3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 10 Jun 2026 05:56:01 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=how3exbDWPzGmcAqDdpu+JfOrb8dfRiHX7vUmZ04CRcE/21rcy7RsvV7tTmYO0rcLpKEFBHvrCvqCWrSAlRxNvVAGNLVkcrkO2Irotpc+zFROF3oyVu7nTOVi7RaJ/stZntYp0tZh1ShWdnOdaDo8uWw/lAZB0Lb5cyRvGh0WvLoFK6X5GCezfDOVnenFl3dPuXlsPs48ptZAcoZJAjSqT6wSQNp6Zi064tCNkP/RLNN7X5vI9pl70tDzRDf9etTeqgalWY24vczfd8s986IX4EOUgQHEg0T1e+WnIvrSrGYibn91HGOVZCBsHTz/N2yDKOEdbBioPxpXTGsigLzEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RuuKpIR3aTjVjIZT90DsVJ71iU+kk76/u9JU73WZu54=;
 b=ZZFBMPKT/bUaGFOwi2CSgyZRIH9O+z4prWvbPCtCyLMTBtk1GEqFUYNvPrn33OVqsPSBC62Y8UEvHWUKyh9Z5X0nbo8BYLu5d1NWVkPu3qTAiVPvRO4ZmA/UJIBQ/jEqjlwa4Sd8NFZByEVGaHwOIrTm/XmfhiLYuL5FTwswH6R32nhB8Cx8VlTysc/FuYwGBVAkF3RHqQmLDlgP3QSn3/0ijiyV1NW+SchmCcpVQv80nWzRXB+4JOqKw4lSoWkRs9pW7yyF0edoYomdBWIxoCfpyjDEvWB6tqAJo+v/Rwb//UeDwmPaSAuCEQ19TsNKDtdkR//7yQJk4ATH+f9Giw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RuuKpIR3aTjVjIZT90DsVJ71iU+kk76/u9JU73WZu54=;
 b=PuP1WDC+UuGH+8j6wsDPd4nWjsLcDMON9QeOBjfEZ9+vEus0smqsxstprJAM3uDjSvE8MYvTKypQteOwlZzrqqCJ9j1iOWpjaP6J+fzWpxdLLz5eWa/YQXlXG3ELz7jyjCBtfzdklz6fCDooobjCuU2hYVVG8LLvurGRtsOEg7w=
Received: from CH0P220CA0014.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::29)
 by IA3PR19MB8706.namprd19.prod.outlook.com (2603:10b6:208:529::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Wed, 10 Jun
 2026 10:55:58 +0000
Received: from CH2PEPF00000149.namprd02.prod.outlook.com
 (2603:10b6:610:ef:cafe::11) by CH0P220CA0014.outlook.office365.com
 (2603:10b6:610:ef::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.10 via Frontend Transport; Wed,
 10 Jun 2026 10:55:58 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH2PEPF00000149.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.7
 via Frontend Transport; Wed, 10 Jun 2026 10:55:57 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 6E6FA406544;
	Wed, 10 Jun 2026 10:55:56 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.13])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 602CB82024A;
	Wed, 10 Jun 2026 10:55:56 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: cs35l56: Don't leave parent IRQ disabled if system_suspend fails
Date: Wed, 10 Jun 2026 11:55:56 +0100
Message-ID: <20260610105556.612830-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000149:EE_|IA3PR19MB8706:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c25c11cb-ac0f-4549-f46c-08dec6deda63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|36860700016|82310400026|61400799027|16102099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	sPrc4sXm5J42YsyzOne3cwHWvz7qXMx0s6KkQf256a57yo8lip5SWSg9X5MU/5uPQ6SlQZiF3qhyymNxg4Mnj++BK7GNFzWEs9Nu1NZ0JuUJ/i5PsaRU7xV1+eV/Kb7k8D0mn4c1WGRnoPlYi3XJvVVWAERBJL5nNhVTD+T5kBiT3QGLd+u5WxWusuHIT/mqqgNBUxNsYhAAUxdsmNBJVadiautKjx/huSmaXaPzO23ANEzTwh6Doxs/EVA431YJt6HtwjJJBOQPWuSWzw6aorSdydi6K/dDyELtOZlRY6RiTdztmjKVx4/j718EZ79mrLQRwj9ynyIftTlqMBnD+CZfAYwLbsH7XUJeHhLnieCey4b2F8Ldh8aMRhWCyq9cRtHshwdusFNPmIBl4Xkitz4GL+jom5Be4AAgW2q6IZJMSPtpOO3MAOE+xQA4uQjQPaCLUG4qdX44sM07Fp5X6mK8dlBtGPuLC4rk4as/u8Rkg98b8o1RyW9nJtoRop9jjYMGPbSlRsS1Mkmw4D1JXKcWi566Aey34BJ2HNalUL6srACkgddi24mNt4jtwfvgOcNmKISj+zcUPTEqURPOd5TZEwfeaBxvSqZQX/tbbHKBUR0jBKPTMb7ZqWUJzMBsqwiTaUUm45haCwAhWxn1/NQ/kKoIbqCROF3QshMI8bN5MtjuJXSfEHJOihdsv2C651LR+lSIawrrvY1Cwd7lHg0Xhyj2NTnZDckBRvN2+nc=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(82310400026)(61400799027)(16102099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8rnAKWVtL7sAXU3X0JSlFXWN57IySn9TBFtIrp9qkPhC3f45+kRLX1o1hLDoMe61tyrNHClDETbPbh9v9XsCnse0rWhsQRan/Gj1bPYrHhnbOQwAQj8J/QJYNXFV3X/GKU53P+CwVThrtHoi7f+iPUoA8zmebeim5wht9zaxRvB64qjjdcikEHPPyAOwMVP0E/kuB0t6Qi+1JuWNcPIR3BEACOZDY2F1l3yrw3kqh/LlUjEHIrwoUi4qV3s6urC6K5/uydPGDdFbCT0zxaCoFB0KgEEwaxZTZLK6DOwm1ZBHlESZ/jfda8YEIrSswnS8WLGtYL6SPBWuDGnQVoIBmpGPxXwBsPxAIktp+EPWkOgRGWvjskevW99i8+/E4fMhZL6pGmCzQGxiCpk4gBl/pEZatWGuMGr2zXQ6N1+GvGzVdqD/bX3vW8TR9f1LyNPM
X-Exchange-RoutingPolicyChecked:
	MwQCZKGyDn5ISGfPHX+HpoIgBFudZpTSnZGTWtSDT2oPXWkXkm3ke/PmVafTlPB2lI1dqcZytpq9D7GQpY85MsYJK13KcubDOQBPbLfPbDtAG6nMQ3L41YuyctHIwGEgnNhsjcmwtVeDZ0MqeqFnWTgMp+OlZwXDtufFz5qpPi36t7iYyuLPwm+/C4lmy4ZumOF5bh6RcJqo9C/V7ajgx+pf1fPohwAtzzTSV9Y31zY533hNJIW03W0/pHx4YimYesqmk/+LTNnUG0+6rJcMtcJ6WrN8gdLUzdIXEDBCX4+08cttLptumcJdOriD43UV1moCUfRu4p5UWwicNgZCFA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 10:55:57.9840
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c25c11cb-ac0f-4549-f46c-08dec6deda63
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF00000149.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR19MB8706
X-Authority-Analysis: v=2.4 cv=Wt4b99fv c=1 sm=1 tr=0 ts=6a2942c1 cx=c_pps
 a=Tmenz91GMLKLa+Z4vsoKoQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=jEGSoAwOu74QnXRvSnAA:9
X-Proofpoint-GUID: 6f8ogcKtiWQAkCXpBua-9hz_SgeP2O_s
X-Proofpoint-ORIG-GUID: 6f8ogcKtiWQAkCXpBua-9hz_SgeP2O_s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEwMyBTYWx0ZWRfX89WaLXKvzkNM
 der6IzS6ykhFWsCNEfEncewoE7/2MTQlHHH7ZVo2Dq0EjPK6eke59Z3GebufqojnuEy7/90qjmD
 i6nl7gYet+Di66hfUFayMp7nbC/GiegmMLpgjMMMYVGhDFiJYb6MplXPW1YU5m+gjq7ED1QhAl4
 yVKCDy4mG0pSAYB/MWD47W9owYLtu0zGvxxuySSxt1KLJQjsqfrVXaLVtuasUKpJCBX7cM6zFaK
 gjr39BI4wOzqvqtMj0BHOddguF0BG2y5kouUdyx9+1URipsFt3GKN+nomgoycAsALz3FTJfCFrh
 OabCh74ltRdTR+3sFhy3wP88xqMS+NyoX2q4EYnZM0MjAaX4MpDX+ONG4sowYXLCwO4FW5Mttx8
 DwPDwbeTDkg59OlaEWF314iK5iaKRJLiQ+SuYyeWyobZ4E5j/gZ0Pq8onEiNocFxiBW5dr4RH+F
 kx/CwzNk67xF8kEvsfA==
X-Proofpoint-Spam-Reason: safe

In cs35l56_system_suspend() re-enable the parent IRQ if the call to
pm_runtime_force_suspend() returns an error.

Fixes: f9dc6b875ec0 ("ASoC: cs35l56: Add basic system suspend handling")
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 2e3b5f5e33ba..570a68829ccd 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -1524,6 +1524,7 @@ static int __maybe_unused cs35l56_runtime_resume_i2c_spi(struct device *dev)
 int cs35l56_system_suspend(struct device *dev)
 {
 	struct cs35l56_private *cs35l56 = dev_get_drvdata(dev);
+	int ret;
 
 	dev_dbg(dev, "system_suspend\n");
 
@@ -1539,7 +1540,11 @@ int cs35l56_system_suspend(struct device *dev)
 	if (cs35l56->base.irq)
 		disable_irq(cs35l56->base.irq);
 
-	return pm_runtime_force_suspend(dev);
+	ret = pm_runtime_force_suspend(dev);
+	if ((ret < 0) && cs35l56->base.irq)
+		enable_irq(cs35l56->base.irq);
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(cs35l56_system_suspend);
 
-- 
2.47.3

