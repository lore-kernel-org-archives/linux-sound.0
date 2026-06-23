Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3D8331EAF
	for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 07:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782199051; cv=none; b=c1lduBAfvknauKUuXIonLBQ6YWPyBkRV5Ee45q1JTO13J2pHvy0umpY6bMwDyTvGfILlUJT2462shARkPVhRRss5eY3WHjo+FsxCI607lKZx+TGtYYOOK+cRpgvIe6I+or/L5rIH8oCEIZKCMvzIng/WuG45kkstIV1EMzjXEk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782199051; c=relaxed/simple;
	bh=LYlQL8slJT2X3TsQrVJGOcIURgOr7EAYfQdBwvHGCbM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YzXuv8VC+uVLAkBDUmK+GCs9fN5OvLXmMZ3x7bM0ElwzJZvRedo1L1B0Pss2QKWF7EbBVEeDUt+7QZiQSPtiPlGdIjdsmtQcvgdNcMx7AE0jmcH5KDVgDIhIk9q8XEzDgZbkJS9nGvNOZkoVVRtgcxUg/584YPgO1JEC21EpYBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LcAvmHIQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I4Ieg2Do; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LcAvmHIQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I4Ieg2Do"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N6ciVM3063561
	for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 07:17:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=g3+Ward7dHQ7AzvjxSqcPJkFYwCD8AMq1fW
	cD6KwA/s=; b=LcAvmHIQoIrG6XUe95vyP5YRDEgQlEk+p5ixilUHyBuNnnujnCZ
	A+GWn0UnFLu6LK3hr03yl9oQVUcpaKFHVEADF9W1mxO5HoFHV3YRdjwE7LH65x87
	Ko+BLBoQUs4OH/CBkODfFj6UMkIk/ZJkc2Q5A2ukv1IRGXhEjd8Py5U8PtT+1pEI
	7icHLcBEdH0uQAQuRDjiflfv0FrA7xKmY0XvrySE218odbO9j5aqZf25fxk46xmr
	LsKsR0uhm0OD13/51NyrjQwEPjDLXSCsFrQLcK6e+gbYnZ2slsjYMp9msFDpeMHa
	V1JeE2FUPZ489LSnfo5aFit9TXMeGxTHKSw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey2yjc47c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 07:17:29 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0c272e532so50455065ad.1
        for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 00:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782199049; x=1782803849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g3+Ward7dHQ7AzvjxSqcPJkFYwCD8AMq1fWcD6KwA/s=;
        b=I4Ieg2DoKDjIort4ApV7GxBePIPcHX4XFoCkbCWRbMyBO/ZRinydT7AtaLcaHYCfx+
         0v+noAUyfSK0/ncNaf6RRLN3vL1ihLx0HC+WliynRmvvk3v+WfFcKl7+1IX/lX6xbxYU
         r1vOqEztN3AnSTHPfjhdGfSv0asHRdZ51WNBY6ZZGdfYeJIWtqaeeWm06EbRc1Jg9eNH
         dvEQiiIb95B9AzqpdpmsQqyHfCRhLDBsXdowZe1MCGBrqdgwqCnEN45cRU359AtFXdSd
         4+1sWpxHk+VB2Gxw7hqdGjQTTnaLM8R15muyGunRcEUh6hJT9z2uGIXOg4Pq2nApT6zI
         lIkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782199049; x=1782803849;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g3+Ward7dHQ7AzvjxSqcPJkFYwCD8AMq1fWcD6KwA/s=;
        b=AQcbDxpVrPZTd7pb0ktpeo7Bbr3Zr3LttkCvdSPgUOkP+ZWKNWwDMEcaS3VupF5YWT
         bIhA6scLtB38bHZtxGPlk/6JEAKeU3Zrg02tJTdsXp8lVjBmmez3zQNNWoZ2FGrqNzPF
         5GgLAfK3QFzZxTP3MsRzTv2+pl4+jzazeH1nxG4nMZ55nXJp7aT0Q0oGnmSL922A9oRS
         hz4GGCL2ydVpx3DTZumcrC0LBXTNP5F4yeo+NLsUCFO4JyP4ed3YXmRiYBwG/a/9Ew++
         zb1fqdYaSYWhX8fXARGvzNffSLT3Q5eU4PQeNPTJ3zthDL2om73Od+20Ni+hWaNAOBau
         5T/w==
X-Gm-Message-State: AOJu0YxhQagIOWXyOSg10VDAUPwQXaD4IHKgDNrVlW6rk58j4EGg89Ce
	o9l+JzLK00n8edOyxIH4A352owElIsx3cMXSU6+JCiKThYuG0aPmmEQvj4bEhTSBhzf1tMuvXuG
	LhEvQCdH6fVnIP1Iexmu+SSUS5Zkomt87GbPc/aETWzbTiCvjFpy1q+ZR6tckDLfYCw==
X-Gm-Gg: AfdE7ckqUjDwRmJGtqEgDjDy67pB6MKsYPpD3jHdwJA0p6TqL5hlLlpnuPF5PJkwQY6
	1a75gAhdyBETPm49Yb42YBohQ+I97I+oBZ1JbKli+A/Xfna05XBqNH2YcfQ/FyZdSzmWINdJp2n
	zLWDquIc8jcug7I6zggMu7uA7Fl/REkuuoJXczW4A8jXkp4hUjqKneRz89dY6b/H9UZKt1reHku
	Ny2DTW+iVO/IywY3ndL+aHDNw50pYJmUmYFwRc2oKKNOPPZI4gz//GLVG9uEFjVUjrHXTkSQMME
	o0eInLXMuH1Rf/3alX6gHlxcUpMGLr/7mpxbbULEApyBC/3ScQrnY6jiamJqvjYv0ggQOU9MIoG
	WgaoBINXZsY//IM5qwtPWCqyyexEYOp9ubpaJ6xw=
X-Received: by 2002:a17:902:c40e:b0:2c2:bd0d:3cf0 with SMTP id d9443c01a7336-2c7c9a9be7cmr12879055ad.25.1782199048674;
        Tue, 23 Jun 2026 00:17:28 -0700 (PDT)
X-Received: by 2002:a17:902:c40e:b0:2c2:bd0d:3cf0 with SMTP id d9443c01a7336-2c7c9a9be7cmr12878815ad.25.1782199048182;
        Tue, 23 Jun 2026 00:17:28 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7437002aesm99673535ad.37.2026.06.23.00.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 00:17:27 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        srini@kernel.org
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/3] ASoC: codecs: lpass-wsa-macro: Switch to PM clock framework for runtime PM
Date: Tue, 23 Jun 2026 12:47:06 +0530
Message-Id: <20260623071708.2822269-2-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: kaiPH2RrsN8Oh3riAGwdaLkABokIj-rM
X-Proofpoint-GUID: kaiPH2RrsN8Oh3riAGwdaLkABokIj-rM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA1NiBTYWx0ZWRfX8ODVSfcSGg8V
 FFVdraqDBH7V91H1dpSaT+0R/0ujzZD1GtgTy4V2URL9Q6pJ8rwueab0UW1FO6V92w35e/r204r
 +Ee5H3sWl6Ghy47TpL3DDRmOX1ocBLU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA1NiBTYWx0ZWRfXzFy+w2LoDTst
 CoT6tMIXbsVDmtGTkLb/GhYNNH6XFomVV5O8tO/JYlAXqaLjU5JBgD9OOlpdQPzP6iHP86gF4DO
 vDTGibpPtSmraNDLF52FCZqVpsL2ZQGwCJSaUQ31hpVRabyPq87XGKb2Ij1EdFws0ukKKtKH55n
 4eqLiI0aVIDVbH4LY64R8C7+ROi7ekvPJYbxuzMEN0lopa+mHx5cqtvnwGExKHRVb/ltJ3Ym3Jk
 piN2lGpG53aaHHt2xGuZLFgXSUCyOmTfhtpPzyEtp96cGJLKMYMrl/tHDPyk+M8kZlBg8Koq/5+
 u7n92kE53A/9xNpD4LiRKntBpoAh5IkPMyqmpmsmTFcrpjGe8z2zaBL10pTtTbVQLTH8L4U7lmu
 eUIT+R5EsIuFJ132co7WDOWV6lb4GZGl5MvSBVKuKCn/Fm3GmCdwBStn+ukqTSgoDSsOTK6vf0B
 /5vqalEh9+HyAQRUkkA==
X-Authority-Analysis: v=2.4 cv=YLSvDxGx c=1 sm=1 tr=0 ts=6a3a3309 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=0L53WUX8MMYAS1EgRPIA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230056

Convert the LPASS WSA macro codec driver to runtime PM clock management by
using the PM clock framework.

Replace manual macro/dcodec/mclk/npl/fsgen clock toggling with PM clock
helpers and runtime PM callbacks. Keep the SWR gate runtime PM reference
from SWR clock enable until disable so autosuspend does not gate clocks
while SWR is still prepared.

Set autosuspend delay to 100 ms so PM-clock-managed votes are dropped soon
after idle while still avoiding suspend/resume churn on short gaps.

Add a PM_CLK dependency to SND_SOC_LPASS_WSA_MACRO since this patch
introduces PM clock APIs.

Tighten error unwind by checking pm_runtime_put_sync_suspend() in probe and
by restoring regcache state if pm_clk_resume()/regcache_sync() fails.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/codecs/Kconfig           |   1 +
 sound/soc/codecs/lpass-wsa-macro.c | 126 ++++++++++++-----------------
 2 files changed, 53 insertions(+), 74 deletions(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index a7c61f7c7f4c..458ea62ad983 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -2889,6 +2889,7 @@ config SND_SOC_LPASS_MACRO_COMMON
 
 config SND_SOC_LPASS_WSA_MACRO
 	depends on COMMON_CLK
+	depends on PM_CLK
 	select REGMAP_MMIO
 	select SND_SOC_LPASS_MACRO_COMMON
 	tristate "Qualcomm WSA Macro in LPASS(Low Power Audio SubSystem)"
diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 5ad0448af649..5952bd6638ae 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -14,6 +14,7 @@
 #include <sound/soc-dapm.h>
 #include <linux/pm_runtime.h>
 #include <linux/of_platform.h>
+#include <linux/pm_clock.h>
 #include <sound/tlv.h>
 
 #include "lpass-macro-common.h"
@@ -2529,15 +2530,13 @@ static const struct snd_soc_dapm_route wsa_audio_map[] = {
 static int wsa_swrm_clock(struct wsa_macro *wsa, bool enable)
 {
 	struct regmap *regmap = wsa->regmap;
+	int ret;
 
 	if (enable) {
-		int ret;
-
-		ret = clk_prepare_enable(wsa->mclk);
-		if (ret) {
-			dev_err(wsa->dev, "failed to enable mclk\n");
+		ret = pm_runtime_resume_and_get(wsa->dev);
+		if (ret < 0)
 			return ret;
-		}
+
 		wsa_macro_mclk_enable(wsa, true);
 
 		regmap_update_bits(regmap, CDC_WSA_CLK_RST_CTRL_SWR_CONTROL,
@@ -2548,7 +2547,10 @@ static int wsa_swrm_clock(struct wsa_macro *wsa, bool enable)
 		regmap_update_bits(regmap, CDC_WSA_CLK_RST_CTRL_SWR_CONTROL,
 				   CDC_WSA_SWR_CLK_EN_MASK, 0);
 		wsa_macro_mclk_enable(wsa, false);
-		clk_disable_unprepare(wsa->mclk);
+
+		ret = pm_runtime_put_autosuspend(wsa->dev);
+		if (ret < 0)
+			dev_warn(wsa->dev, "runtime PM put failed: %d\n", ret);
 	}
 
 	return 0;
@@ -2774,25 +2776,23 @@ static int wsa_macro_probe(struct platform_device *pdev)
 	clk_set_rate(wsa->mclk, WSA_MACRO_MCLK_FREQ);
 	clk_set_rate(wsa->npl, WSA_MACRO_MCLK_FREQ);
 
-	ret = clk_prepare_enable(wsa->macro);
+	ret = devm_pm_clk_create(dev);
 	if (ret)
-		goto err;
-
-	ret = clk_prepare_enable(wsa->dcodec);
-	if (ret)
-		goto err_dcodec;
+		return ret;
 
-	ret = clk_prepare_enable(wsa->mclk);
-	if (ret)
-		goto err_mclk;
+	ret = of_pm_clk_add_clks(dev);
+	if (ret < 0)
+		return ret;
 
-	ret = clk_prepare_enable(wsa->npl);
+	pm_runtime_set_autosuspend_delay(dev, 100);
+	pm_runtime_use_autosuspend(dev);
+	ret = devm_pm_runtime_enable(dev);
 	if (ret)
-		goto err_npl;
+		return ret;
 
-	ret = clk_prepare_enable(wsa->fsgen);
-	if (ret)
-		goto err_fsgen;
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0)
+		return ret;
 
 	/* reset swr ip */
 	regmap_update_bits(wsa->regmap, CDC_WSA_CLK_RST_CTRL_SWR_CONTROL,
@@ -2809,56 +2809,41 @@ static int wsa_macro_probe(struct platform_device *pdev)
 					      wsa_macro_dai,
 					      ARRAY_SIZE(wsa_macro_dai));
 	if (ret)
-		goto err_clkout;
-
-	pm_runtime_set_autosuspend_delay(dev, 3000);
-	pm_runtime_use_autosuspend(dev);
-	pm_runtime_mark_last_busy(dev);
-	pm_runtime_set_active(dev);
-	pm_runtime_enable(dev);
+		goto err_rpm_put;
 
 	ret = wsa_macro_register_mclk_output(wsa);
 	if (ret)
-		goto err_clkout;
+		goto err_rpm_put;
 
-	return 0;
+	ret = pm_runtime_put_autosuspend(dev);
+	if (ret < 0)
+		dev_warn(dev, "runtime PM put failed after probe: %d\n", ret);
 
-err_clkout:
-	clk_disable_unprepare(wsa->fsgen);
-err_fsgen:
-	clk_disable_unprepare(wsa->npl);
-err_npl:
-	clk_disable_unprepare(wsa->mclk);
-err_mclk:
-	clk_disable_unprepare(wsa->dcodec);
-err_dcodec:
-	clk_disable_unprepare(wsa->macro);
-err:
+	return 0;
+err_rpm_put:
+	if (pm_runtime_put_sync_suspend(dev) < 0)
+		dev_warn(dev, "runtime PM sync suspend failed in probe unwind\n");
 	return ret;
-
 }
 
 static void wsa_macro_remove(struct platform_device *pdev)
 {
-	struct wsa_macro *wsa = dev_get_drvdata(&pdev->dev);
-
-	clk_disable_unprepare(wsa->macro);
-	clk_disable_unprepare(wsa->dcodec);
-	clk_disable_unprepare(wsa->mclk);
-	clk_disable_unprepare(wsa->npl);
-	clk_disable_unprepare(wsa->fsgen);
 }
 
 static int wsa_macro_runtime_suspend(struct device *dev)
 {
 	struct wsa_macro *wsa = dev_get_drvdata(dev);
+	int ret;
 
 	regcache_cache_only(wsa->regmap, true);
-	regcache_mark_dirty(wsa->regmap);
 
-	clk_disable_unprepare(wsa->fsgen);
-	clk_disable_unprepare(wsa->npl);
-	clk_disable_unprepare(wsa->mclk);
+	ret = pm_clk_suspend(dev);
+	if (ret) {
+		regcache_cache_only(wsa->regmap, false);
+		return ret;
+	}
+
+	regcache_mark_dirty(wsa->regmap);
 
 	return 0;
 }
@@ -2866,36 +2851,29 @@ static int wsa_macro_runtime_suspend(struct device *dev)
 static int wsa_macro_runtime_resume(struct device *dev)
 {
 	struct wsa_macro *wsa = dev_get_drvdata(dev);
-	int ret;
+	int ret, sret;
 
-	ret = clk_prepare_enable(wsa->mclk);
+	ret = pm_clk_resume(dev);
 	if (ret) {
-		dev_err(dev, "unable to prepare mclk\n");
+		regcache_cache_only(wsa->regmap, true);
+		regcache_mark_dirty(wsa->regmap);
 		return ret;
 	}
+	regcache_cache_only(wsa->regmap, false);
 
-	ret = clk_prepare_enable(wsa->npl);
-	if (ret) {
-		dev_err(dev, "unable to prepare mclkx2\n");
-		goto err_npl;
-	}
-
-	ret = clk_prepare_enable(wsa->fsgen);
+	ret = regcache_sync(wsa->regmap);
 	if (ret) {
-		dev_err(dev, "unable to prepare fsgen\n");
-		goto err_fsgen;
+		regcache_cache_only(wsa->regmap, true);
+		regcache_mark_dirty(wsa->regmap);
+		sret = pm_clk_suspend(dev);
+		if (sret)
+			dev_err(dev,
+				"failed to suspend clocks after regcache sync failure: %d\n",
+				sret);
+		return ret;
 	}
 
-	regcache_cache_only(wsa->regmap, false);
-	regcache_sync(wsa->regmap);
-
 	return 0;
-err_fsgen:
-	clk_disable_unprepare(wsa->npl);
-err_npl:
-	clk_disable_unprepare(wsa->mclk);
-
-	return ret;
 }
 
 static const struct dev_pm_ops wsa_macro_pm_ops = {
-- 
2.34.1

