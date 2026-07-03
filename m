Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82713BCD11
	for <linux-sound@vger.kernel.org>; Fri,  3 Jul 2026 11:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783077052; cv=none; b=Kyepk9lejF+N4YlzJEASAYkDROHSw5XlhfbockGCmUaivgmdlDeVrXfZxHOc1HWAyyrgcZGz4cHWT31NTmJrd0eVHhC3cEnl3GypG6D9x83/FiBGDKKdrM2WthTNokB3RrbVYyHatSCwo3uc9c94lGXuN9031ftpJ/07CZl/rU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783077052; c=relaxed/simple;
	bh=g/yMaJlvNBdEQ5jrnd01l44P+eHuNt4YxCH1LUazNBY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U5dg5js3LAEzPCVURIHkhqCGfrY+C7TKb7/vG/Yl8SHlN/5xVZ+hmEr0EiyNeaP18iqRARAA0qUKMmHI5EeucN/xmjehM4RYvCSC27JddGSe0tQRFbayEd6SV+xeCNtx/yZRqBHVP5mKWh1KJmiMDbhTVUHe9lE6aBYnfroZRUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eW8OZe0S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZMZiaWan; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eW8OZe0S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZMZiaWan"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663B7xVS3126415
	for <linux-sound@vger.kernel.org>; Fri, 3 Jul 2026 11:10:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EhvG5EAQSfN1zs/tCIl9waG523N1eM2uGMeWlhwydnY=; b=eW8OZe0SfY/T47go
	3sZv1wYe6hd2a9kE6B69zfBc+A54X1N/2RosmwA6bbBULm3DOn6fcCxx3o1AxJoF
	shUl6gBcJApkEhNeXTcPUvi7t+Vh2Pe+dywmZKmfqFfbOWooVN0NwlOio4K7YCcd
	X1gIx/2GHbKzPFKYdzsuIsHuqQp92HZxVgMIPwV3cWOXRRO0a3+q3/bumXaW/u7p
	Mgq7SQL13dLk0h+GBMbyekB9F7OfXxq25NVS7cvHVmNiMMhg8v+JTvbkvpta+Jti
	0hx/RZp4rZ97i4JHvgWXuSsV2JlWhRuMCsh6Uf6Rw8tXN+evsIL41kYCMGOQ4cfT
	j+ZaMA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5tpnm4ge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 03 Jul 2026 11:10:48 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8423f544944so456580b3a.3
        for <linux-sound@vger.kernel.org>; Fri, 03 Jul 2026 04:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783077048; x=1783681848; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EhvG5EAQSfN1zs/tCIl9waG523N1eM2uGMeWlhwydnY=;
        b=ZMZiaWandi97jj35Lv3ijWSsfGeMSN237uX/3Tx5k9EsU26Kgnf0/K5+iprFktJYpW
         xEObeNswa8RlxTNnOqL7SbHXdqPa5YAAGzHkBB4WOL0R+qL62Rd1M3ercdv9W2+8ToDK
         WVgbmN8JyEjx9P/M0bGlPYc1kz+upCbHv7muiH2VetsOgQvnYa5Qy6BCy8+2g3nTfjSn
         vjxu/Rt9VTIYW/6eZ3J/MpVzfrZ2Jsp/T4I17poTVfsDt8nIKyO9q7P1zgdDQlCa4gss
         sB3yPnLnKPs++12o77DN5DSqg5oo8GUUxHjDDg/cN/NZ8Uz3NwrlG3xoPtcBWpqjqi4a
         ToiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783077048; x=1783681848;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EhvG5EAQSfN1zs/tCIl9waG523N1eM2uGMeWlhwydnY=;
        b=HJoDYITT4Clq15n83fbMqiYr9QMZSmml2MxUfwuqNbKfveW4h1WFrBpuSe4eH/fM+V
         V9rz9FJ4PrVo5XUBtWs2LM2M9aZfSXSxvfZU/tHOQlNO4ZGAxy8r1TTvuzOLbu3C5Cil
         3LHhr2fjbf0D2j/4GJmxUSjtiul1RT+WwO5x3BiNAaGWbe3etaf8S3J7pWjeLP6sInY1
         soip2waRbJv6ZfrrUC0mwD1CySB3rgcuDbrd8soG5T1K/lIeX0s+PZGCHUmYMvKZXp80
         4lLWanqhOfdgM2xvsTlW9P2MdEDwGgZsBIfsuxMrJ2aZxAeWPE7QtjKheShrCvgyWWAI
         k1XQ==
X-Gm-Message-State: AOJu0Yxy+VnMFGJYmcVME53j4M0rORNoRi20m8TPCBWeWf089Lue51ix
	AD6raWRoIUXJB3XS1QkIeijfNWVgm4jTW4pvUDWJSNSZhOTuFeEsY8H/yHlG0xIxlzwwNi/SVL8
	cy2mvgnewBbkzRDdegQqzkvn29qc6U0McePrCuEr2egYloxLMA0uTZe2BB6wkO/p+Sw==
X-Gm-Gg: AfdE7cnUYniHyO7mC5EpbNzx9SGCGCMcRWCsQa6zvyrSQlzCIf240cD/nKxchr7fwou
	ZgvBj44q7uJ2+1ip5EYkbwrgJPHlCg+uDc8R8f5mefzGV2jWNsD0oZjYOPHlASpPM7FYLdF8gGP
	QPIvVXuNFTuFj6rT67LbudM6JQm/fY8R4qT96ZUDDBkujmipEilMDd2n3ziVST5v0erI6AJjeMS
	XmIy93Jq1fwbBbWVQQfau/NSp+GsWQCkBE6wEevdxN/ORoiUwXTWKlXrMoPic0I9o0DWQr1DpIs
	77ztV7WAx2KT0KaIMTdcqlUxOpYnKFztiDvrz+NYjKDVTv5H9MeZD5BGeyu0yLs+LfXjRp4TSK7
	OeBYecbH4Tf0wFKtysktLAao5BQdvkVLOy8YLqxU=
X-Received: by 2002:a05:6a00:a16:b0:845:d285:3b67 with SMTP id d2e1a72fcca58-847c51e5bc0mr9879558b3a.51.1783077047594;
        Fri, 03 Jul 2026 04:10:47 -0700 (PDT)
X-Received: by 2002:a05:6a00:a16:b0:845:d285:3b67 with SMTP id d2e1a72fcca58-847c51e5bc0mr9879526b3a.51.1783077047046;
        Fri, 03 Jul 2026 04:10:47 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb79b9adsm2836444b3a.27.2026.07.03.04.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:10:46 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 16:38:52 +0530
Subject: [PATCH 2/2] ASoC: codecs: lpass-rx-macro: switch to PM clock
 framework for runtime PM
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-xo-sd-codec-tx-rx-v1-2-a3cf683533d7@oss.qualcomm.com>
References: <20260703-xo-sd-codec-tx-rx-v1-0-a3cf683533d7@oss.qualcomm.com>
In-Reply-To: <20260703-xo-sd-codec-tx-rx-v1-0-a3cf683533d7@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-GUID: I0Hh8S1bx-oPZCTR8jj0y_N217PEV04Z
X-Proofpoint-ORIG-GUID: I0Hh8S1bx-oPZCTR8jj0y_N217PEV04Z
X-Authority-Analysis: v=2.4 cv=UMft2ify c=1 sm=1 tr=0 ts=6a4798b8 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=SrGOOKtgq2-mNKYMNKkA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEwOCBTYWx0ZWRfX7lYzsDDOvL+j
 73SeyggAWo2TggAPtfAycpKNGlCjii2Ibh5iYxpeHZyim4CfU2qjgtvM5Dm9cPX4U/Thi077ME6
 GLLJ9TF1C0dPWjSbeA3YtR4cA1bREG0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEwOCBTYWx0ZWRfX2H5Wis8akZxL
 KhnoSheeS86ZQSnUuqkISRrK3ORHqo7gyRLDP3abfuR0Un2jcflLupzfIfpa4WEjMYqzZg+xQ6T
 nBWSh42gxUdBYwBclP3gT4ePNFH6jUB+75kzI8KVHda/rjfai9P9kcTVFe60nlR+G13mdUBaytN
 V5t7vSDCzI8m1xkwHAmTMIkQU75wevJ0d8WBPyU9fGpbsSKqN5kdN7bQatD5Lb8zuDP7xglOJhp
 0zqEVvxfgfjtKq/iy14/x6oQIhg0ZjcM7ha+fpBMO61cJ9nyVRJOe02FJDehaoUg4sd8zdkLSWT
 37jRhORDjelA12xL3SHRINbrGVmeFG2UscwreOsNsKLhYpblDbKM2I/lpIakPQhVDzk+m5n400p
 aZg2MHw4EvblYYD38pSRXdz6uzCQIsXVZN+HqjimjynY8mfvC6lg1fMPQTJWg8wdCxNcDbaeVO2
 ojnPq6UoLmQfD+p30Sw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030108

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
 sound/soc/codecs/lpass-rx-macro.c | 114 ++++++++++++++------------------------
 1 file changed, 42 insertions(+), 72 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 6233aa9f5bc6..9122b07626ec 100644
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
@@ -3865,27 +3864,26 @@ static int rx_macro_probe(struct platform_device *pdev)
 
 	/* set MCLK and NPL rates */
 	clk_set_rate(rx->mclk, MCLK_FREQ);
-	clk_set_rate(rx->npl, MCLK_FREQ);
+	if (rx->npl)
+		clk_set_rate(rx->npl, MCLK_FREQ);
 
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
@@ -3902,46 +3900,25 @@ static int rx_macro_probe(struct platform_device *pdev)
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
@@ -3969,13 +3946,17 @@ MODULE_DEVICE_TABLE(of, rx_macro_dt_match);
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
@@ -3985,33 +3966,23 @@ static int rx_macro_runtime_resume(struct device *dev)
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
@@ -4026,7 +3997,6 @@ static struct platform_driver rx_macro_driver = {
 		.pm = pm_ptr(&rx_macro_pm_ops),
 	},
 	.probe = rx_macro_probe,
-	.remove = rx_macro_remove,
 };
 
 module_platform_driver(rx_macro_driver);

-- 
2.34.1

