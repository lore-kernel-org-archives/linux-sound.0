Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2279E3C0A1F
	for <linux-sound@vger.kernel.org>; Tue,  7 Jul 2026 09:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783417425; cv=none; b=qo1kwZVSFQOcCt+ykQp49LVqnRGmaxtOnNnOf1ltLZ8BxleATUPBg6wm4GhgQofrfPl7jj7F7oGd15IhzXMNYcUp+by+bn5o5kddJmG0OenFEAMsOVXa/BC/HgRuQ0G2GdEQU6P4KnO2a8PPgU8mh24Nt1uAhL+6s1L6pO9XUFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783417425; c=relaxed/simple;
	bh=p6MkxTcG7Msy18PNCWUslWNtjw1w1EQTF3X3XfZ3gZ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VGktRpezZqcdGm1IO2cetmIySn6q3HViziWOj+u79OM1qCWC37gcVahUPixoEf4Fl5TIm+q3FCb1XBFKTCt6Z2qM5vzjyUdN63jkZXwSNqRXqJlzs2t6MjxEb6kw6lbcYkRSBnGUfBAvpWYyHn42fkBrBSSLr3c7ST55Cma2uAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FTfOcgEq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=af9gwQM0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FTfOcgEq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="af9gwQM0"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678DoMK3205913
	for <linux-sound@vger.kernel.org>; Tue, 7 Jul 2026 09:43:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sz7H/On7EVNikTZ2hOinzKwdtMxFMGJzuQHNXxzpf30=; b=FTfOcgEq8WqLlHia
	lJnFrKgb9Xdi24cZvqmC7zXmmeYHJliipDtVoNr9yNmWl/KV/VWHxwVreVRHgnTl
	PnV/6P1G3NjddMNgfLQNCYx/t3oh8KtUWp+Q2+6p22KK2n/NCfkqUv25aYPbl5xf
	PZnqjjOBMVev2jcudAFu2j4ybqvhtii8Dh0npOVGpZ6yjzkZjKeYMWJhWVhE+Hd8
	YnVmIxDj/9LaDtWZJUPWeLHEWcfLg81bGMiVas5rSHYirlx7M93KQBIlUFAu1jew
	GhoQeKzEDLESuVzi6s2sa90ox1lZiWzM6Kdnxdp0Z4kcz6+zryTh4RYKJm0JRTf2
	dxQLLQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8fdw3pkb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 07 Jul 2026 09:43:43 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ccbb61893fso13108515ad.0
        for <linux-sound@vger.kernel.org>; Tue, 07 Jul 2026 02:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783417423; x=1784022223; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sz7H/On7EVNikTZ2hOinzKwdtMxFMGJzuQHNXxzpf30=;
        b=af9gwQM0XLx4DgaXEdD9z+te52N+3y4yjtLitqTEgLjjYhj0g8mAG8bq4h/yhUXdqe
         VWnrYxNvk5Ao8zz8STit+1Ko0bsNXD1HnmrYWvoS4j/CsvcuNL1BiGQdESqmBOlFqVBt
         yzD0aFwjZVkIH0DZvoZlOyyvgOwXW987gKHt53M7Ep2nOy+l8gTb+wjJmI9C+ydFihOn
         GTTcdiLVvbNkZG7lvX6CCH8oFHx8C8bbotP9NfWQafdnRuh9cNYE3JTR26hsOMFW6gEf
         +GxAsc14EVFfYIpNN6Lkt76tRKC9r9xxTuEC4s/ek1AVCpWvvbOYvHOaKBlJV0Z3cnnh
         Mxmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783417423; x=1784022223;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Sz7H/On7EVNikTZ2hOinzKwdtMxFMGJzuQHNXxzpf30=;
        b=A3a2rET6tJpml7Dy9rOmDsBA1IWDMY1O6c03WHasPTnwDNFb/jpktqei56JESCaNqW
         JUbL13JVnTc4zu3q9tDCIiM476V0erad1qNXjL1mHGXHvt8ZOD57EuwOccQ67Q+Lk5Fb
         K0cp1Hu6SyTjBQE6po6WeE/DrwI/pVHZXwr7Sakl0+QQRTXdOL7B6SZZrVCz+iJ0tLUO
         oqmb9o0b9DBdhXOoqGUkQPJEOUZ8A58gKmMwiFg3kNgRb/VAJXGInloDrNVnbAp/TQjB
         davsGVsaQ5/Abh4p1IInrVujS1czaYq4UAL73LMb5ZtwKZ6tw5urK3gzOGhgV85nOaF4
         IvAA==
X-Gm-Message-State: AOJu0Yyx51AX5IfBYAZNjnM9b8bitgsZjH8v+XnlN9oSasZU4L7vMmgt
	+FYZbXqs/4bjdyFshTPDHlcmIpcZ0JdVBuJosVv7GTdY76VGHVY2X8KNtg7UwVCn7lLVHuTpYmn
	XAIzBC3uYWAgehXqOovloYdKWYvLjNFo5IFn72K1NCXx4ca8NbqK91zKyZAWMRoxkaA==
X-Gm-Gg: AfdE7cmGvHShyvddKh3KQ39XmFDIGeIr4ET0npCnA1RI6EBr76MUbzFD9T5ceLMszdl
	efvO5DpXbvfaG9NxbzyYa5gp6LP4kd3XrtRiBcfd6myOm54T/barGwBNxUHdhJk5xbfLJO4dPvF
	oQdrOCISlzhUMQwbRYmRwbS5LzQmtpz8YzxwluFbFF/C2a5F9MLqb707+4gHic4j7d/g+uB20eN
	BD2x52zEizC/10520USFmSj/R5Cu/Y6yP4JIJQR5whgwNt9WzflzrZQO0XKJjbAIS07ya6FdtaC
	sbF8HdSbQT6Sil5qrIQTSLD5PH+2IBy2WyQuXkCim8R8fAwkX8tC3J3+LBYFAOwj/rqORIvZ35w
	XDDx2opiXJmTBc6OlvXBW+e+aUScpmEPI+Wke1e4=
X-Received: by 2002:a17:903:2350:b0:2cc:85a7:36ee with SMTP id d9443c01a7336-2ccbf043f25mr46499395ad.32.1783417422617;
        Tue, 07 Jul 2026 02:43:42 -0700 (PDT)
X-Received: by 2002:a17:903:2350:b0:2cc:85a7:36ee with SMTP id d9443c01a7336-2ccbf043f25mr46499075ad.32.1783417422065;
        Tue, 07 Jul 2026 02:43:42 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bdddsm8422075ad.77.2026.07.07.02.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 02:43:41 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 15:13:11 +0530
Subject: [PATCH v2 1/3] ASoC: codecs: lpass-tx-macro: switch to PM clock
 framework for runtime PM
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-xo-sd-codec-tx-rx-v2-1-f61b4622f97f@oss.qualcomm.com>
References: <20260707-xo-sd-codec-tx-rx-v2-0-f61b4622f97f@oss.qualcomm.com>
In-Reply-To: <20260707-xo-sd-codec-tx-rx-v2-0-f61b4622f97f@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA5NCBTYWx0ZWRfXxp72PeUf6o+9
 Z/nCALTfflwLC5HyP2v0IhmdI7HcKojti5afJnydTufgsXeuQ+sbx/RPt9ZFCJD5NNQvxmdLy5Q
 4bHaGJ9S3MvliklioSkR7YnKj4heNJw=
X-Proofpoint-ORIG-GUID: zdAabH_maGZyFzuTmqzoer1yRIUHe4G3
X-Authority-Analysis: v=2.4 cv=EtziaycA c=1 sm=1 tr=0 ts=6a4cca4f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=2ztkfpsRXklUYACcPygA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA5NCBTYWx0ZWRfX9ckQWiZel0R7
 a4fBDYe22KJtbnHyeQ6kPVvJQcXZkjsS/4JaD9PUcFaCUzxGHDaFGIKI6l/LjvsWxrcpi3Y8iBp
 k51z7E0FmHixu4kzACqp+iIN6qXeZ9K63fZdKmEbDcsW6LB6Rcf8S3Kp341Ra8UPQ8SpBaww9jv
 Fgshmu/2d6aem0E5ms8aCIQbQwrdO8jJJPcI6KH52zqjlrWNEmsayq+Ec1ucB2HH43pzarS4/Il
 l7ORUvSWus3AhIDqWDn8MBJ6xdYJLL//Y6UbFGoAQHNb4OIvj7y3HPC6WtEBGE1apckeavvb+bC
 NFbodNycFX7y+8gDgHYdcT/SKYE2loZgU4J32rYrTrKJD9b8TK1L3pPPD3RgyCBql7UmfOfQS00
 roNjot86yt5wKP340BoR2Ht8AnP9UMRel2lbfCUGHdvC8b2yHX5H9b8ew0GP3cxv/x2EwvxwCH9
 2DowqcYwUc1clvSqikw==
X-Proofpoint-GUID: zdAabH_maGZyFzuTmqzoer1yRIUHe4G3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070094

Convert the LPASS TX macro codec driver to runtime PM clock management
using the PM clock framework.

Replace manual macro/dcodec/mclk/npl/fsgen clock toggling with PM clock
helpers and runtime PM callbacks. Keep the SWR gate runtime PM reference
from SWR clock enable until disable so autosuspend does not gate clocks
while SWR is still prepared.

Set autosuspend delay to 100 ms so PM-clock-managed votes are dropped soon
after idle while still avoiding suspend/resume churn on short gaps.

Add a PM_CLK dependency to SND_SOC_LPASS_TX_MACRO since this patch
introduces PM clock APIs.

Tighten error unwind by checking pm_runtime_put_sync_suspend() in probe
and by restoring regcache state if pm_clk_resume()/regcache_sync() fails.

Co-developed-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/codecs/Kconfig          |   2 +
 sound/soc/codecs/lpass-tx-macro.c | 112 ++++++++++++++++----------------------
 2 files changed, 48 insertions(+), 66 deletions(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index f90a0d4c77ea..cdb50316f471 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -2909,12 +2909,14 @@ config SND_SOC_LPASS_VA_MACRO
 
 config SND_SOC_LPASS_RX_MACRO
 	depends on COMMON_CLK
+	depends on PM_CLK
 	select REGMAP_MMIO
 	select SND_SOC_LPASS_MACRO_COMMON
 	tristate "Qualcomm RX Macro in LPASS(Low Power Audio SubSystem)"
 
 config SND_SOC_LPASS_TX_MACRO
 	depends on COMMON_CLK
+	depends on PM_CLK
 	select REGMAP_MMIO
 	select SND_SOC_LPASS_MACRO_COMMON
 	tristate "Qualcomm TX Macro in LPASS(Low Power Audio SubSystem)"
diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index f7d168f557dd..fc073a556fb5 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -6,6 +6,7 @@
 #include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <sound/soc.h>
@@ -2149,17 +2150,20 @@ static int swclk_gate_enable(struct clk_hw *hw)
 	struct regmap *regmap = tx->regmap;
 	int ret;
 
-	ret = clk_prepare_enable(tx->mclk);
+	ret = pm_runtime_resume_and_get(tx->dev);
+	if (ret < 0)
+		return ret;
+
+	ret = tx_macro_mclk_enable(tx, true);
 	if (ret) {
-		dev_err(tx->dev, "failed to enable mclk\n");
+		pm_runtime_put_autosuspend(tx->dev);
 		return ret;
 	}
 
-	tx_macro_mclk_enable(tx, true);
-
 	regmap_update_bits(regmap, CDC_TX_CLK_RST_CTRL_SWR_CONTROL,
 			   CDC_TX_SWR_CLK_EN_MASK,
 			   CDC_TX_SWR_CLK_ENABLE);
+
 	return 0;
 }
 
@@ -2172,7 +2176,7 @@ static void swclk_gate_disable(struct clk_hw *hw)
 			   CDC_TX_SWR_CLK_EN_MASK, 0x0);
 
 	tx_macro_mclk_enable(tx, false);
-	clk_disable_unprepare(tx->mclk);
+	pm_runtime_put_autosuspend(tx->dev);
 }
 
 static int swclk_gate_is_enabled(struct clk_hw *hw)
@@ -2318,25 +2322,23 @@ static int tx_macro_probe(struct platform_device *pdev)
 	clk_set_rate(tx->mclk, MCLK_FREQ);
 	clk_set_rate(tx->npl, MCLK_FREQ);
 
-	ret = clk_prepare_enable(tx->macro);
+	ret = devm_pm_clk_create(dev);
 	if (ret)
 		goto err;
 
-	ret = clk_prepare_enable(tx->dcodec);
-	if (ret)
-		goto err_dcodec;
-
-	ret = clk_prepare_enable(tx->mclk);
-	if (ret)
-		goto err_mclk;
+	ret = of_pm_clk_add_clks(dev);
+	if (ret < 0)
+		goto err;
 
-	ret = clk_prepare_enable(tx->npl);
+	pm_runtime_set_autosuspend_delay(dev, 100);
+	pm_runtime_use_autosuspend(dev);
+	ret = devm_pm_runtime_enable(dev);
 	if (ret)
-		goto err_npl;
+		goto err;
 
-	ret = clk_prepare_enable(tx->fsgen);
-	if (ret)
-		goto err_fsgen;
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0)
+		goto err;
 
 
 	/* reset soundwire block */
@@ -2356,30 +2358,21 @@ static int tx_macro_probe(struct platform_device *pdev)
 					      tx_macro_dai,
 					      ARRAY_SIZE(tx_macro_dai));
 	if (ret)
-		goto err_clkout;
-
-	pm_runtime_set_autosuspend_delay(dev, 3000);
-	pm_runtime_use_autosuspend(dev);
-	pm_runtime_mark_last_busy(dev);
-	pm_runtime_set_active(dev);
-	pm_runtime_enable(dev);
+		goto err_rpm_put;
 
 	ret = tx_macro_register_mclk_output(tx);
 	if (ret)
-		goto err_clkout;
+		goto err_rpm_put;
+
+	ret = pm_runtime_put_autosuspend(dev);
+	if (ret < 0)
+		dev_warn(dev, "runtime PM put failed after probe: %d\n", ret);
 
 	return 0;
 
-err_clkout:
-	clk_disable_unprepare(tx->fsgen);
-err_fsgen:
-	clk_disable_unprepare(tx->npl);
-err_npl:
-	clk_disable_unprepare(tx->mclk);
-err_mclk:
-	clk_disable_unprepare(tx->dcodec);
-err_dcodec:
-	clk_disable_unprepare(tx->macro);
+err_rpm_put:
+	if (pm_runtime_put_sync_suspend(dev) < 0)
+		dev_warn(dev, "runtime PM sync suspend failed in probe unwind\n");
 err:
 	lpass_macro_pds_exit(tx->pds);
 
@@ -2390,25 +2383,23 @@ static void tx_macro_remove(struct platform_device *pdev)
 {
 	struct tx_macro *tx = dev_get_drvdata(&pdev->dev);
 
-	clk_disable_unprepare(tx->macro);
-	clk_disable_unprepare(tx->dcodec);
-	clk_disable_unprepare(tx->mclk);
-	clk_disable_unprepare(tx->npl);
-	clk_disable_unprepare(tx->fsgen);
-
 	lpass_macro_pds_exit(tx->pds);
 }
 
 static int tx_macro_runtime_suspend(struct device *dev)
 {
 	struct tx_macro *tx = dev_get_drvdata(dev);
+	int ret;
 
 	regcache_cache_only(tx->regmap, true);
-	regcache_mark_dirty(tx->regmap);
 
-	clk_disable_unprepare(tx->fsgen);
-	clk_disable_unprepare(tx->npl);
-	clk_disable_unprepare(tx->mclk);
+	ret = pm_clk_suspend(dev);
+	if (ret) {
+		regcache_cache_only(tx->regmap, false);
+		return ret;
+	}
+
+	regcache_mark_dirty(tx->regmap);
 
 	return 0;
 }
@@ -2418,34 +2409,23 @@ static int tx_macro_runtime_resume(struct device *dev)
 	struct tx_macro *tx = dev_get_drvdata(dev);
 	int ret;
 
-	ret = clk_prepare_enable(tx->mclk);
+	ret = pm_clk_resume(dev);
 	if (ret) {
-		dev_err(dev, "unable to prepare mclk\n");
+		regcache_cache_only(tx->regmap, true);
+		regcache_mark_dirty(tx->regmap);
 		return ret;
 	}
 
-	ret = clk_prepare_enable(tx->npl);
-	if (ret) {
-		dev_err(dev, "unable to prepare npl\n");
-		goto err_npl;
-	}
-
-	ret = clk_prepare_enable(tx->fsgen);
+	regcache_cache_only(tx->regmap, false);
+	ret = regcache_sync(tx->regmap);
 	if (ret) {
-		dev_err(dev, "unable to prepare fsgen\n");
-		goto err_fsgen;
+		regcache_cache_only(tx->regmap, true);
+		regcache_mark_dirty(tx->regmap);
+		pm_clk_suspend(dev);
+		return ret;
 	}
 
-	regcache_cache_only(tx->regmap, false);
-	regcache_sync(tx->regmap);
-
 	return 0;
-err_fsgen:
-	clk_disable_unprepare(tx->npl);
-err_npl:
-	clk_disable_unprepare(tx->mclk);
-
-	return ret;
 }
 
 static const struct dev_pm_ops tx_macro_pm_ops = {

-- 
2.34.1

