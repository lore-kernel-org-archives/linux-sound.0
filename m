Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FB83C108E
	for <linux-sound@vger.kernel.org>; Tue,  7 Jul 2026 09:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783417430; cv=none; b=uMj0AbqUCKKDbO8iK5bUhDiGHS626V8zNwrXtw3HLNbm0rnkGK+lbhSPmgKHOmy9pJalAkbpgGu9XkZTOP7CJwR4VA/CHHiX4UWjATF1y4qFSH2OQDGclr0LzELsF9hzdPw1lqi+9mJgNlDjKg238fkcOaNBOBYDEdQB6po5xFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783417430; c=relaxed/simple;
	bh=TSbl0m/FOAI6PfxYdgJYXzRM4StznGnbNf0pbb6NsEA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WMky+BKK0WcjqEWgy8Hxwxo7mWUZmRZhu1MIKFSqGxzDS2ocz0I3+M/NIDoQfJ7LyS5hFJwEM8lbINAJduLBGXgSeAzYAvWxpORVZVZd4fPAhrRDq9/2RzzH8tP/mHjX91tbw8JiNKW4wHt50XHQGJ9mF386rHSAi0j5yaLA444=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NUZwmWzb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QnEQBIUL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NUZwmWzb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QnEQBIUL"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678Dnv33205882
	for <linux-sound@vger.kernel.org>; Tue, 7 Jul 2026 09:43:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YsC6PBdktmUOoL+JYCulZoNVI907voK3HYruugWamTo=; b=NUZwmWzbhPUJx367
	SrCGdhG27Wl9S27RyWVfC05EQNrJtsjd4WDxa4aDummtiaeVPAbXYEQ7qrHLWcUq
	DGHUEePHr2Cv5mQtAUMG/0vb6MEOP3H9dpGH2hFGWVjNRqxwgWLDBZQTUmftaasL
	ut6+1HQ/Jm+L4/1qbxFaxznZdWQFRIdkJz5yuRHxMbwBlLcmlED8Rhk4NtKGm7SN
	9La5JTDD7a39AbVQiEcaXIrSLGdPhJ5JMs4u+HcP4yQ+7e1wr7XjkDpd9SA6b+7t
	oR42VveZIcSw3iTn8jxvN8+QRDhU4Xs3QM30cB35eH/c7gZoU+UWY8HfKe4MYKQL
	nznQfg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8fdw3pkq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 07 Jul 2026 09:43:47 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3810e5c5871so7449343a91.2
        for <linux-sound@vger.kernel.org>; Tue, 07 Jul 2026 02:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783417427; x=1784022227; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YsC6PBdktmUOoL+JYCulZoNVI907voK3HYruugWamTo=;
        b=QnEQBIUL+R4pU/grKC/33Q+JrYPS0fbzKPaDIFg3TMIG2m8iQk77ZyPWnJNt5/FWqQ
         8kUnIajb3Iqilq912PIcstoQ5LECW5JCbiEZFAxp9DWzKnvBebdNDpYuhXOldaNbvf5J
         3UIz5KET7Ox7ATFT+7eEgn//jvARRGIB1fHxHb7s0JlfWEONVnyXRGM73G612EudooWb
         DtSzlSjNAxgXWBQmfIPdl9DsP5u4m9wAKH5iCqy9nI2pz2ffAORyEblQYW5GfcfzFUEO
         5Enehlo4T5n+Crb+RAmQa6vesQyB2gqewL2iJiZBO43N2w8iuWJY1GJHPnjkxCP5Q78S
         qZfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783417427; x=1784022227;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YsC6PBdktmUOoL+JYCulZoNVI907voK3HYruugWamTo=;
        b=FLkhJ6M9jvTUNfd+yIwXcJE9+Ft/b20lujY9iFLJsMm4EQsWPI/uX6AsPLrTPO8Y0H
         J7hWqzC70f4YwNSi9Da4VBCsKRK/f2tW7apnMMWhDFFAvKqHkY9KdlI2VvA12cPnFXOQ
         P61N5jIkc22AJjW1mRhjzQnKLWY0q+P1ysYEGqaLWNWSfxJ7mZIo6GHTciCmxQ+WK7qi
         G45uvlfeOWkd7EEFaKYF0vxXCjcNZOXm7nLD4hGhskhhpgMyUy/3cfNTVsw7TV8deiu1
         O5c/8Y8A1WbGy5UQTjHCSxjatSpau//dpxn+kBa1x02CsiMABS0x145XImV5ZwvY06jD
         ay3w==
X-Gm-Message-State: AOJu0YysQMNv7WJz6cchcvDZrNfbO81LZjFqRMqhxZCs2KLpoT7ZY8h0
	8lRnqw2HvMy72QEHMM4tmi6vUzXn4anjFN5vLIM80mlJcJgbLdqOd8lJDUwpIjCFapB0NhiGKf2
	8IOxixN5mY+KUk6JsNtI/JxZm9KW3f8RBV8Nz8vxotOfbpC3skaQGZPamCdqyuHEVlw==
X-Gm-Gg: AfdE7cmm5YmJnQbr9M4coKaQx+sh84we1SzJnRNyjN1vS573pphTcHEZP7d5hC0w1y5
	bRw8u2MnunPFuRMudP942KqBCBltpPU+u89HGOZyp33jnjkzAb2OeyIbj2Fn3KKeQMMFZTRyGag
	tUZB1QiOOaJHFpmDig2IY90myY/HlgtfnBk4H66/Xl6njIwpjcKfFrJ9czuVNTifNYC8dUSI8QV
	dYNs5q8z6PVDT3mqrY6cG+xT64oPsUc0x3UtY+PpSX2SgKEEwlOTjQEWuoQchW3ggYOSxzz84l0
	JbrI2hYo8yegmknrb9PfQ0qvwmMMuOGS9f3VeT9yL+jlnkjkwrtTZVidR0rdKZEYCDK8HoW2fqO
	w5/VMEoLrzm2CP9/BK5HEib8t6hs3PYMykTAkydI=
X-Received: by 2002:a17:90b:48cf:b0:387:e0db:3d90 with SMTP id 98e67ed59e1d1-387e0db4394mr1940808a91.43.1783417426293;
        Tue, 07 Jul 2026 02:43:46 -0700 (PDT)
X-Received: by 2002:a17:90b:48cf:b0:387:e0db:3d90 with SMTP id 98e67ed59e1d1-387e0db4394mr1940781a91.43.1783417425845;
        Tue, 07 Jul 2026 02:43:45 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bdddsm8422075ad.77.2026.07.07.02.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 02:43:45 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 15:13:12 +0530
Subject: [PATCH v2 2/3] ASoC: codecs: lpass-rx-macro: switch to PM clock
 framework for runtime PM
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-xo-sd-codec-tx-rx-v2-2-f61b4622f97f@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA5NCBTYWx0ZWRfXx+eP620fO89N
 IdgIR0lR3Ez6/1M2zWsraT8proNukww8VQhDEg97SSDk3pwZ30PvgXc/mByvtjGrDRjuKCGM3wY
 NtrdOhmCpIRHuoLBXTK4Qv5WEVCRXjw=
X-Proofpoint-ORIG-GUID: JAvqDSjozvDVZFh4VDoZe9l22IHEyiX-
X-Authority-Analysis: v=2.4 cv=EtziaycA c=1 sm=1 tr=0 ts=6a4cca53 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=SrGOOKtgq2-mNKYMNKkA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA5NCBTYWx0ZWRfX6+uNi7LabgYG
 0p8AfGp6S+yEB19vh6/hctv62ye0C9bblIMS/xDXRklAK2gz7GdVWa7SSfALQXYd5aMc7jwDyUg
 IpZs0pO9885nZLqdOLkZVP0EpOT+2B1mYLufvSvT9cfAhhg1xmsBS2erllIv9jvB3Pz306Nv7uw
 BnlU41g559jYFSwqJRo7H35/OnVvKyjCHdqj5VYrLvSOh9yIW1IPVaST2atVM8Knu0yaZYAi5Ha
 E8/6ZIfCiDIDyJ6zCPWEUX4mmR+xShSW/SyW/WUQ3fBjuIYg+prvx5BAcI+bI5uoHOGWHUHAQyF
 WZH5KFC1GnIRR+kATIk9XC232CXICFckxLRnCEw9OKuCdoDdSSTV/NP4q+tkqQ2bITqhqZ5o8tH
 4bEWsOpx6sDPSi7GJwAkFRMrERg7Vo9CPRqc5NZQUgEvB6dWXCaptqhHNG/s5gCLoc201jBymnC
 iaDqwmE7moCb//bqfUw==
X-Proofpoint-GUID: JAvqDSjozvDVZFh4VDoZe9l22IHEyiX-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070094

Convert the LPASS RX macro codec driver to runtime PM clock management
using the PM clock framework.

Replace manual macro/dcodec/mclk/npl/fsgen clock toggling with PM clock
helpers and runtime PM callbacks. Keep the SWR gate runtime PM reference
from SWR clock enable until disable so autosuspend does not gate clocks
while SWR is still prepared.

Set autosuspend delay to 100 ms so PM-clock-managed votes are dropped soon
after idle while still avoiding suspend/resume churn on short gaps.

Add a PM_CLK dependency to SND_SOC_LPASS_RX_MACRO since this patch
introduces PM clock APIs.

Tighten error unwind by checking pm_runtime_put_sync_suspend() in probe
and by restoring regcache state if pm_clk_resume()/regcache_sync() fails.

Drop the now-empty rx_macro_remove() callback since all clock cleanup
is handled by PM clock framework and devm.

Co-developed-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-rx-macro.c | 111 ++++++++++++++------------------------
 1 file changed, 40 insertions(+), 71 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 6233aa9f5bc6..927f75050c0f 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -6,6 +6,7 @@
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
 #include <linux/pm_runtime.h>
 #include <linux/clk.h>
 #include <sound/soc.h>
@@ -3671,11 +3672,9 @@ static int swclk_gate_enable(struct clk_hw *hw)
 	struct rx_macro *rx = to_rx_macro(hw);
 	int ret;
 
-	ret = clk_prepare_enable(rx->mclk);
-	if (ret) {
-		dev_err(rx->dev, "unable to prepare mclk\n");
+	ret = pm_runtime_resume_and_get(rx->dev);
+	if (ret < 0)
 		return ret;
-	}
 
 	rx_macro_mclk_enable(rx, true);
 
@@ -3693,7 +3692,7 @@ static void swclk_gate_disable(struct clk_hw *hw)
 			   CDC_RX_SWR_CLK_EN_MASK, 0);
 
 	rx_macro_mclk_enable(rx, false);
-	clk_disable_unprepare(rx->mclk);
+	pm_runtime_put_autosuspend(rx->dev);
 }
 
 static int swclk_gate_is_enabled(struct clk_hw *hw)
@@ -3867,25 +3866,23 @@ static int rx_macro_probe(struct platform_device *pdev)
 	clk_set_rate(rx->mclk, MCLK_FREQ);
 	clk_set_rate(rx->npl, MCLK_FREQ);
 
-	ret = clk_prepare_enable(rx->macro);
+	ret = devm_pm_clk_create(dev);
 	if (ret)
 		return ret;
 
-	ret = clk_prepare_enable(rx->dcodec);
-	if (ret)
-		goto err_dcodec;
-
-	ret = clk_prepare_enable(rx->mclk);
-	if (ret)
-		goto err_mclk;
+	ret = of_pm_clk_add_clks(dev);
+	if (ret < 0)
+		return ret;
 
-	ret = clk_prepare_enable(rx->npl);
+	pm_runtime_set_autosuspend_delay(dev, 100);
+	pm_runtime_use_autosuspend(dev);
+	ret = devm_pm_runtime_enable(dev);
 	if (ret)
-		goto err_npl;
+		return ret;
 
-	ret = clk_prepare_enable(rx->fsgen);
+	ret = pm_runtime_resume_and_get(dev);
 	if (ret)
-		goto err_fsgen;
+		return ret;
 
 	/* reset swr block  */
 	regmap_update_bits(rx->regmap, CDC_RX_CLK_RST_CTRL_SWR_CONTROL,
@@ -3902,46 +3899,25 @@ static int rx_macro_probe(struct platform_device *pdev)
 					      rx_macro_dai,
 					      ARRAY_SIZE(rx_macro_dai));
 	if (ret)
-		goto err_clkout;
-
-
-	pm_runtime_set_autosuspend_delay(dev, 3000);
-	pm_runtime_use_autosuspend(dev);
-	pm_runtime_mark_last_busy(dev);
-	pm_runtime_set_active(dev);
-	pm_runtime_enable(dev);
+		goto err_rpm_put;
 
 	ret = rx_macro_register_mclk_output(rx);
 	if (ret)
-		goto err_clkout;
+		goto err_rpm_put;
+
+	ret = pm_runtime_put_autosuspend(dev);
+	if (ret < 0)
+		dev_warn(dev, "runtime PM put failed after probe: %d\n", ret);
 
 	return 0;
 
-err_clkout:
-	clk_disable_unprepare(rx->fsgen);
-err_fsgen:
-	clk_disable_unprepare(rx->npl);
-err_npl:
-	clk_disable_unprepare(rx->mclk);
-err_mclk:
-	clk_disable_unprepare(rx->dcodec);
-err_dcodec:
-	clk_disable_unprepare(rx->macro);
+err_rpm_put:
+	if (pm_runtime_put_sync_suspend(dev) < 0)
+		dev_warn(dev, "runtime PM sync suspend failed in probe unwind\n");
 
 	return ret;
 }
 
-static void rx_macro_remove(struct platform_device *pdev)
-{
-	struct rx_macro *rx = dev_get_drvdata(&pdev->dev);
-
-	clk_disable_unprepare(rx->mclk);
-	clk_disable_unprepare(rx->npl);
-	clk_disable_unprepare(rx->fsgen);
-	clk_disable_unprepare(rx->macro);
-	clk_disable_unprepare(rx->dcodec);
-}
-
 static const struct of_device_id rx_macro_dt_match[] = {
 	{
 		.compatible = "qcom,sc7280-lpass-rx-macro",
@@ -3969,13 +3945,17 @@ MODULE_DEVICE_TABLE(of, rx_macro_dt_match);
 static int rx_macro_runtime_suspend(struct device *dev)
 {
 	struct rx_macro *rx = dev_get_drvdata(dev);
+	int ret;
 
 	regcache_cache_only(rx->regmap, true);
-	regcache_mark_dirty(rx->regmap);
 
-	clk_disable_unprepare(rx->fsgen);
-	clk_disable_unprepare(rx->npl);
-	clk_disable_unprepare(rx->mclk);
+	ret = pm_clk_suspend(dev);
+	if (ret) {
+		regcache_cache_only(rx->regmap, false);
+		return ret;
+	}
+
+	regcache_mark_dirty(rx->regmap);
 
 	return 0;
 }
@@ -3985,33 +3965,23 @@ static int rx_macro_runtime_resume(struct device *dev)
 	struct rx_macro *rx = dev_get_drvdata(dev);
 	int ret;
 
-	ret = clk_prepare_enable(rx->mclk);
+	ret = pm_clk_resume(dev);
 	if (ret) {
-		dev_err(dev, "unable to prepare mclk\n");
+		regcache_cache_only(rx->regmap, true);
+		regcache_mark_dirty(rx->regmap);
 		return ret;
 	}
 
-	ret = clk_prepare_enable(rx->npl);
-	if (ret) {
-		dev_err(dev, "unable to prepare mclkx2\n");
-		goto err_npl;
-	}
-
-	ret = clk_prepare_enable(rx->fsgen);
+	regcache_cache_only(rx->regmap, false);
+	ret = regcache_sync(rx->regmap);
 	if (ret) {
-		dev_err(dev, "unable to prepare fsgen\n");
-		goto err_fsgen;
+		regcache_cache_only(rx->regmap, true);
+		regcache_mark_dirty(rx->regmap);
+		pm_clk_suspend(dev);
+		return ret;
 	}
-	regcache_cache_only(rx->regmap, false);
-	regcache_sync(rx->regmap);
 
 	return 0;
-err_fsgen:
-	clk_disable_unprepare(rx->npl);
-err_npl:
-	clk_disable_unprepare(rx->mclk);
-
-	return ret;
 }
 
 static const struct dev_pm_ops rx_macro_pm_ops = {
@@ -4026,7 +3996,6 @@ static struct platform_driver rx_macro_driver = {
 		.pm = pm_ptr(&rx_macro_pm_ops),
 	},
 	.probe = rx_macro_probe,
-	.remove = rx_macro_remove,
 };
 
 module_platform_driver(rx_macro_driver);

-- 
2.34.1

