Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73E83D6664
	for <linux-sound@vger.kernel.org>; Fri,  8 May 2026 11:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778240125; cv=none; b=ELTvkoZTlS1W56WWO2piTv12VFBSDCGJyqA+2mn5xZkiC5e3OYZj7bK9jJpnx+ZVmTnxrMjegKLYfTVjJi6eskOGix34143ww5oBLndBRI0Va01pA3DqvdkaUIa6JdEa6WVQrFobhNMQd7DyuA7aIendr/h1PpOExtjjlmyYtu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778240125; c=relaxed/simple;
	bh=knynDHER1f1lxrDhbhKfo3pasNup4E37od6/VAZTOR4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EON8oO60t9Ep19h/sH4Uqvv5whSe6fpiK87nZj+PWGR1O5F+fezr4rVOvDC4WKJ9LinHTO5rDQDlUn0SQM73XfqpX53d/PP5Ys6J8uNA3vMf23tLd8QJHFHX6YVVkfl2K+J6jWBp4KjygpBh5yA09jrXDC6R+Q5tNGaP3x+7XX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UuE3a4zk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rm9jiA13; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UuE3a4zk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rm9jiA13"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6489KEEA2771025
	for <linux-sound@vger.kernel.org>; Fri, 8 May 2026 11:35:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=d5K3SJ3TnI0
	83StGhp81ic4knbiTAAh8lrfQK8duyCc=; b=UuE3a4zkUK4Bw8U48Mbp+xeW4NH
	+7S4gZkbe+FIQmGk57A+n5zMl/5nyJwrELoUjjRnrbNu2Y1kpKdY/PVp5/M1/qpR
	NtGBKSezWj6AkrSkflFJmRC7RRU7eOYtC/fPAXeYB7TCBIVVIgzPblGmjnEj6TM3
	viXIt3iIOEq70BAfaaC6gbtMScpUxouMZHY4a20pZyxNOSS6eDQ8pjIcpNODKaKr
	rLu4PqAavNl+TY3EQVIG1eDcUu+0tZvgeYfBTBis+v3M5i09Du94btCSKWBIV0gR
	P3HZcGpG1s/P9q8id6opY0s4598/FRLhjzYUb5QoVmfnoejJGaDjZqBTd5g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0yt5kg9c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 08 May 2026 11:35:22 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b9a3c3c4eeso21584945ad.3
        for <linux-sound@vger.kernel.org>; Fri, 08 May 2026 04:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778240122; x=1778844922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d5K3SJ3TnI083StGhp81ic4knbiTAAh8lrfQK8duyCc=;
        b=Rm9jiA13/gzofiLOjb8LYxUMmYqQRY2LivqbHLUULvbA2eJLS+LJamZeQdg6o7bDaR
         5E5UOwiTTJy+0C/g+mlZJe02KD4tecLC8k3SBfkbb4PC/I17+4QMr9YmIwnWxHVSPAzY
         A3uG+a6qRw9Tvwkrp0PHx9cvD+kMkTzlFxf2sdwAxHEVg5W56LB8nlAXn6DSnAatjhjg
         Z9lRhsEGcRe2qsIbCTzGbfLILkal9VwPgkzr/NeUZ+Iegnd84CK9xyFMFaXwaPyMt/WY
         N/BkegXpiahILOjVCRGATVg9cXMEBXU43JLj2P2SVaIqkCe0SlQMruo3k/nDrLfEm6Be
         eUdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778240122; x=1778844922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d5K3SJ3TnI083StGhp81ic4knbiTAAh8lrfQK8duyCc=;
        b=ssWa04lflgMMVbIH3oHikbyEfJ/zcltRyCuukV56/NLJHG+NoUy3J4EawAd1hxh7jf
         ARWZb3lgg0kUDgDKcP8leHqFvA3xpDTLK5eOil6WOgAMSZuihVqruZig25SAlrLwo4KR
         Qv5FUl7TUgAKSu64XZqc7uemxOlXAlXizl+/oRo+SKmrSmgodKvSqtw1zSz4oxCbvtee
         c6cW+wGqZDLK9D0dmjFtIPpPDuAdYA46zX6DJQhTbVB6FDjSDeGAOF01eN4eBR5tPP1A
         bXyuHEFq4hYBD1P88UoJpDcy8QgcYnBY36SPuhDRSESPGpvBZlscM/6qi0hxkm+hP57/
         zuxg==
X-Forwarded-Encrypted: i=1; AFNElJ+ZTEdu0yLqZUn2d+vZfbV74ayIgJIeDp7XWzG5LXkdnfmicH/1vUqa2K1ofsfyU/owkfstwJ81Qkn1tQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhMT7gKpT0SgR8tD4dnf4qMDClxp2I3G+obXex6UlbreHBem80
	x0iRHj3zBFFPgvaELiOLlAC6ackssGRJVPnGmTUBIKdd+QRElLtjvrguvEx0bWnCqMKawQs1Q73
	4y1tppA5y26v8TmJ6YaF3J3ZH/19W6iZxs49OUpiJANcjcBldaskz17IM015ZCc0ZAQ==
X-Gm-Gg: Acq92OFfPW976KahDo8VznjqRtN67UY7XOJHFqaf/JQbCUpJ/Ca6fRW9+FM4cxLndHC
	ReilSOE+d3p7cBLXkDlgM0vQYKj9CoWKIarUHRe3BhcLVd+hRY9tIrbTtH/wyhuTPSSPZMFKCmN
	OmBJVobR5NwwNc/bliRsVYUGmP9i7r7SD4EDxFOyU8OjpKAiaDu8v7RYHW7+zuhCH9XS73E4Uxr
	xJB/u5vUDNecNEbOaq166yjhjvEWiH4H5niZdkJ5fZGDJuZOnopD2IFfHdpyU7mui8FeTDScFf+
	X0QmtRKEGgykCdv1sAkLlDH8iYGbiFEqWEnvLe5B8FV2hzvzbXlcKFdtNlw6Np3K82RG8iqx6ki
	wLWXdoR4IHmHxp+kBwhBui/gYswhL6NKumsy1tzrob/i2xjx9XSYW9iXRRFGE
X-Received: by 2002:a17:903:1d2:b0:2b2:539b:d2b1 with SMTP id d9443c01a7336-2ba78f63e3fmr136464475ad.16.1778240121735;
        Fri, 08 May 2026 04:35:21 -0700 (PDT)
X-Received: by 2002:a17:903:1d2:b0:2b2:539b:d2b1 with SMTP id d9443c01a7336-2ba78f63e3fmr136463845ad.16.1778240121040;
        Fri, 08 May 2026 04:35:21 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d52f27sm26616005ad.36.2026.05.08.04.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:35:20 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org
Subject: [PATCH v3 1/3] ASoC: codecs: lpass-wsa-macro: Switch to PM clock framework for runtime PM
Date: Fri,  8 May 2026 17:05:01 +0530
Message-Id: <20260508113503.3550647-2-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260508113503.3550647-1-ajay.nandam@oss.qualcomm.com>
References: <20260508113503.3550647-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Dc0nbPtW c=1 sm=1 tr=0 ts=69fdca7a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=6iqXw53aW0HuLngz8iAA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: nCvhatABfIQ8NO03Z2Bs2HswkAm-3D0d
X-Proofpoint-ORIG-GUID: nCvhatABfIQ8NO03Z2Bs2HswkAm-3D0d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDExOSBTYWx0ZWRfXxLEM/JwIms+9
 R6tAokE9hJ/d2V/bVl3x0ZrkWWlF7A6dbTPlJavFQxaST/03kt22RdKdt03P2c6/5WRwWVUp+0d
 StzoOtERj0QnMyOiSTM5Yxd0FfFpM/XR6br8CzsKG4zU8qHp2ni1MaF2TsFQOYZ7btbHV4D7Nk7
 TUHHpZqmiKcldMt2gcBiwhGahFSV1UK5mRlXSH/87ML9ISl1ArmARsf1lRNl3pRYuXmDcIGVIgu
 90mhDge5gbetYyDPWohsX1yRUzzCcZvY7weM01NfYkA0w3kRN+u/Lq5sB6dW9Wldz6ViiHW4A5v
 U8Hj47LPzRbFiiKtKHrxkRqPgPCvcRtg63oUS5UxZcbmo3Y8JbHdfCAX1WcoF+oB7FtwUAHCHxG
 jqEDG/DbwNxnn2FpMNfjSR8rGsaKGQhkZj7p58y3k1hY7ezemXawUSBJm7hKs+AT2qTHzdiwLzN
 1/WB5WMnli2qVKGphuw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080119

Convert the LPASS WSA macro codec driver to use the PM clock framework
for runtime power management.

The driver now relies on pm_clk helpers and runtime PM instead of
manually enabling and disabling macro, dcodec, mclk, npl, and fsgen
clocks. Runtime suspend and resume handling is delegated to the PM
core via pm_clk_suspend() and pm_clk_resume(), while existing runtime
PM callbacks continue to manage regcache state.

This ensures clocks are enabled only when the WSA macro is active,
improves power efficiency on LPASS platforms supporting LPI/island
modes, and aligns the driver with common ASoC runtime PM patterns used
across Qualcomm LPASS codec drivers.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-wsa-macro.c | 111 ++++++++++-------------------
 1 file changed, 36 insertions(+), 75 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 5ad0448af649..6148de1d0da0 100644
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
 
-	if (enable) {
-		int ret;
+	ret = pm_runtime_resume_and_get(wsa->dev);
+	if (ret < 0)
+		return ret;
 
-		ret = clk_prepare_enable(wsa->mclk);
-		if (ret) {
-			dev_err(wsa->dev, "failed to enable mclk\n");
-			return ret;
-		}
+	if (enable) {
 		wsa_macro_mclk_enable(wsa, true);
 
 		regmap_update_bits(regmap, CDC_WSA_CLK_RST_CTRL_SWR_CONTROL,
@@ -2548,9 +2547,9 @@ static int wsa_swrm_clock(struct wsa_macro *wsa, bool enable)
 		regmap_update_bits(regmap, CDC_WSA_CLK_RST_CTRL_SWR_CONTROL,
 				   CDC_WSA_SWR_CLK_EN_MASK, 0);
 		wsa_macro_mclk_enable(wsa, false);
-		clk_disable_unprepare(wsa->mclk);
 	}
 
+	pm_runtime_put_autosuspend(wsa->dev);
 	return 0;
 }
 
@@ -2774,25 +2773,23 @@ static int wsa_macro_probe(struct platform_device *pdev)
 	clk_set_rate(wsa->mclk, WSA_MACRO_MCLK_FREQ);
 	clk_set_rate(wsa->npl, WSA_MACRO_MCLK_FREQ);
 
-	ret = clk_prepare_enable(wsa->macro);
+	ret = devm_pm_clk_create(dev);
 	if (ret)
-		goto err;
+		return ret;
 
-	ret = clk_prepare_enable(wsa->dcodec);
-	if (ret)
-		goto err_dcodec;
+	ret = of_pm_clk_add_clks(dev);
+	if (ret < 0)
+		return ret;
 
-	ret = clk_prepare_enable(wsa->mclk);
-	if (ret)
-		goto err_mclk;
+	pm_runtime_set_autosuspend_delay(dev, 100);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_enable(dev);
 
-	ret = clk_prepare_enable(wsa->npl);
-	if (ret)
-		goto err_npl;
 
-	ret = clk_prepare_enable(wsa->fsgen);
-	if (ret)
-		goto err_fsgen;
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0) {
+		goto err_rpm_disable;
+	}
 
 	/* reset swr ip */
 	regmap_update_bits(wsa->regmap, CDC_WSA_CLK_RST_CTRL_SWR_CONTROL,
@@ -2809,44 +2806,25 @@ static int wsa_macro_probe(struct platform_device *pdev)
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
+	pm_runtime_put_autosuspend(dev);
 
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
+	pm_runtime_put_sync_suspend(dev);
+err_rpm_disable:
+	pm_runtime_disable(dev);
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
+	pm_runtime_disable(&pdev->dev);
 }
 
 static int wsa_macro_runtime_suspend(struct device *dev)
@@ -2856,11 +2834,7 @@ static int wsa_macro_runtime_suspend(struct device *dev)
 	regcache_cache_only(wsa->regmap, true);
 	regcache_mark_dirty(wsa->regmap);
 
-	clk_disable_unprepare(wsa->fsgen);
-	clk_disable_unprepare(wsa->npl);
-	clk_disable_unprepare(wsa->mclk);
-
-	return 0;
+	return pm_clk_suspend(dev);
 }
 
 static int wsa_macro_runtime_resume(struct device *dev)
@@ -2868,34 +2842,21 @@ static int wsa_macro_runtime_resume(struct device *dev)
 	struct wsa_macro *wsa = dev_get_drvdata(dev);
 	int ret;
 
-	ret = clk_prepare_enable(wsa->mclk);
+	ret = pm_clk_resume(dev);
 	if (ret) {
-		dev_err(dev, "unable to prepare mclk\n");
+		regcache_cache_only(wsa->regmap, true);
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
+		pm_clk_suspend(dev);
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

