Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D8A2ECE91
	for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 08:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779092286; cv=none; b=a1FW09L9tUnzRKfi0FqjRubZbTDnYwh1zs3J61iH6Cg6YiBw58csXAO0nRejYgrF0suPhnAijN83qu9Fo1JiSqb3dl5sof/F5tNmobWO1w/jIUy6KlmLdRivaYOkCu5DQ5zO9wqgrar9UK+9tVdBWfvc3DMZJEQEMe4CKghtwX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779092286; c=relaxed/simple;
	bh=IBdjoJCkldAi1l7W7IesQKsrx4QqX49b2fX1Xw90/IM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cQHRbkUjXFofPVtxczsWWdx8SV/5SFl/FMl2M/szMXZRFAhO6ZrSYECcChgFQDHJHcuFY9W3d7J1TY5aU+azIucmBjYWYE6SRN+scdQ7IyKE2Mh6yzlhEHfi9Ldp3aH2INlE+SOc/XByPBngfOdk1+OsCMMYS03uzedp+ltK/i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hgV88T92; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E0e3eg6D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hgV88T92";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E0e3eg6D"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I6s4iF4172509
	for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 08:18:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5sRVeYMxBRb
	B3S6B199Lb1hv2zwBoow5QgQ7y16qGoM=; b=hgV88T921rDX3qFKn/h07HGkrQD
	cZ+wQe94uSuVeoQ3iMuWY8AND4QnwxrMLzgG+2t0kOqUH0E4J7uUF3k9bijfAkcG
	DZgKfsgtvpzyTMx5vP6dz+cN8Z9CAakxHBxTndDVrjF8vgyadlgK4/ulVc7bSAqP
	IzpbAYvr/vMJ9Li3RyV3Qe1oHQum5HEaZ0RateUSfH46CXFo5nQ0XGxodoy+x+oT
	aCiPkG7+QVOBglEbjEpsUjp7bZn52B1Qbg1WDPNK6TzfiqtAIIqGQ+IpkzYMMrSm
	xtFtJw57y3DAWYHyXq+bLC0LzcjbMxvPTq/53uN5k9uDFGWtyOHPhO0khMQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h0g5dkg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 08:18:02 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2babbeff9e4so22067485ad.0
        for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 01:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779092282; x=1779697082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5sRVeYMxBRbB3S6B199Lb1hv2zwBoow5QgQ7y16qGoM=;
        b=E0e3eg6DX06rUN+kVSuMzOqwuYSbGRviIm7cgTpQR4PNhgw9v1gT6jsqn+PogX1fcR
         ka5JsgDCIY1jyTIAoDab9d4Lo0gdoFKO6Gc4xtGGnaopSqdW8SIHo1jDbDIdfKre47Gx
         BGMS0cAf9+XKGpW0IdhjMAceCopad5CSwgpg2EcoXau0lkW/aVPLZW61Zh/JJLpHn16m
         kuG8EfEBuaxoC+H15RA38ukd1p+TwEG4ynp2LGjgMWfzW+MNBisWK8v7/3dExWP/8O6o
         NrjS+NlsA6ho+WUxSRLljiWKIuJ2U5mnqsz3ryfnhm3zFi/919bCjQ0xjiNJt/l4j1pP
         mXlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779092282; x=1779697082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5sRVeYMxBRbB3S6B199Lb1hv2zwBoow5QgQ7y16qGoM=;
        b=J0uv+fkEt9TBayjdiVGVZcUwFORzBxWpujUPqvioWXwEZ7vZe0c/uJ9I7+jYbR9qgz
         L5YInln+mS7dcPL1Rwu0UI3oR+XF1ozCE7RXeQNP+0ei8QfKNyIRB4USIDB092iFkl3X
         yKyVMBRcDGXeMTjjX8Iy6LvQ1gfUmTUB/T4nV84WC3NWglD393HX0W9JInggHuKSAc+G
         fjA6cA97niiaD6piUZNvhtdPDvhUAhy85+lWxmwZwBzyHvGHTY62BHUpMo+aHT7prfZl
         2bxNbRzROLwY71gwXQzUgQLbFk8PjUykk1xfadh+8tcscQMj5sZiq8BNyqoAY1HavSTc
         DpIw==
X-Gm-Message-State: AOJu0YwoinHn+gj+B+3BXcIbTqOnNNqlgoSTlX2mDCHXaBpobbysKOsq
	UfQBSWY6iQCM7HGuXsVVdUsiz+cB/oCAT5m03bbs6HX/jhK/L4o3d2dcify6kKeQG4ACbSDshtA
	UxHVqK44xClVrFEgHM9cVS4F5w1rHKmAIZzENuBIbclG5vl82uY5TVCjVcu64MRTyYw==
X-Gm-Gg: Acq92OFmgdxtHldWQ1GwpVHzH3m+UXxmdvjCoybnR0+cuTkxFIp7kBmqTuAfq3hBSDL
	WZI61Y7221fuXH5AD3tcBmE8n/C/5+HyzhwN5abElnodQzb44XTmOwPN7f9YJkYsKxqeF+/bgN6
	uwrTYFieQ4J/xCL6BRVu76LeiELUS2TIDd73UvsO77xkAiPmxBr+5ybHBp8SjkO+99La3jd4vm+
	gIDJuafnNFfbyH9BNNsQC0XgTXVQKw/SHvyQjNusOE7XSQcxcZbhpq7QFYUcrJuvjFAmXawF3r3
	etD62zjlKBOeA6LqUgW88+zC9WJvLw53vWpjowgMwN4pbpgFE5H9PxXsAP1e9IF94VgJw4O0lcO
	fL8vyafFvgA2x+UboVlBGLz7lbUQa3423KY535ws09fPZHW3yqg==
X-Received: by 2002:a17:903:3850:b0:2bd:6327:b507 with SMTP id d9443c01a7336-2bd6327b69bmr153260165ad.18.1779092281789;
        Mon, 18 May 2026 01:18:01 -0700 (PDT)
X-Received: by 2002:a17:903:3850:b0:2bd:6327:b507 with SMTP id d9443c01a7336-2bd6327b69bmr153259855ad.18.1779092281262;
        Mon, 18 May 2026 01:18:01 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c2631basm136620755ad.34.2026.05.18.01.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 01:18:00 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH v4 2/3] ASoC: codecs: lpass-va-macro: Switch to PM clock framework for runtime PM
Date: Mon, 18 May 2026 13:47:37 +0530
Message-Id: <20260518081738.2453957-3-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260518081738.2453957-1-ajay.nandam@oss.qualcomm.com>
References: <20260518081738.2453957-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA3OSBTYWx0ZWRfX6yXfHCM9FZSH
 2aYu1vpIhyyzi8CSpgtcHlZDfTff4xjFuvmW8uOLROKLx5SBniNOmqfQZrsuKXKc+31EwhXMzLL
 E8OGNmIpv8XUbOYfST6+DEU4tBsgEa3uKeFSkhbumvI0sGB55R49Uv31L+RulKy8nhC6oQyeVfK
 t5kIE3y9dmFoKKxnrC66+0apQT6rpf5FR31LvoAScdUj5s+JajXeWL4ngKpRZ2DkOGlvhjUAx0L
 FFh+FKCqkmAYnxugR7D8HWfQ0bJ2xE/JmNH3l5pKvax+i+pUU5Qg7ldrkMXAvbyJYR7YOWIvMqd
 h57MYUhVI/tfQ7IxluJ/x6WPrG1uzvHe9F6HQK/7mx7e/T8gpregr5Ws93BQuppSAkBFbnURFyZ
 Y1z6ShkaAN6lZV1w/sPLAQOMhNNKCJe0yz1TA52sGPq2sT5/4qIklBS54J+LHftW2AAnbQHWvRy
 l93fqtq2gYoQ2L7KjQQ==
X-Authority-Analysis: v=2.4 cv=W7gIkxWk c=1 sm=1 tr=0 ts=6a0acb3a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=YBVk55sqNhi4ukaP828A:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: wHedIVD2---nGMz5UmyxP6hmjcjiOX_k
X-Proofpoint-ORIG-GUID: wHedIVD2---nGMz5UmyxP6hmjcjiOX_k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180079

Convert the LPASS VA macro codec driver to use the PM clock framework
for runtime power management.

The driver now relies on pm_clk helpers and runtime PM instead of
manually enabling and disabling macro, dcodec, mclk, and npl clocks.
All clock control during runtime suspend and resume is delegated to
the PM core via pm_clk_suspend() and pm_clk_resume().

This change ensures clocks are only enabled when the VA macro is
active, improves power efficiency on LPASS platforms supporting
LPI/island modes, and aligns the driver with common ASoC runtime PM
patterns used across Qualcomm LPASS codec drivers.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-va-macro.c | 128 +++++++++++++++---------------
 1 file changed, 65 insertions(+), 63 deletions(-)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index 528d5b167ecf..64a06d9ed6c8 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -11,6 +11,7 @@
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/pm_clock.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <sound/soc.h>
@@ -1348,32 +1349,52 @@ static int fsgen_gate_enable(struct clk_hw *hw)
 	struct regmap *regmap = va->regmap;
 	int ret;
 
-	if (va->has_swr_master) {
-		ret = clk_prepare_enable(va->mclk);
-		if (ret)
-			return ret;
-	}
+	ret = pm_runtime_resume_and_get(va->dev);
+	if (ret < 0)
+		return ret;
 
 	ret = va_macro_mclk_enable(va, true);
+	if (ret) {
+		pm_runtime_put_noidle(va->dev);
+		return ret;
+	}
 	if (va->has_swr_master)
 		regmap_update_bits(regmap, CDC_VA_CLK_RST_CTRL_SWR_CONTROL,
 				   CDC_VA_SWR_CLK_EN_MASK, CDC_VA_SWR_CLK_ENABLE);
 
-	return ret;
+	return 0;
 }
 
 static void fsgen_gate_disable(struct clk_hw *hw)
 {
 	struct va_macro *va = to_va_macro(hw);
 	struct regmap *regmap = va->regmap;
+	int ret;
 
 	if (va->has_swr_master)
 		regmap_update_bits(regmap, CDC_VA_CLK_RST_CTRL_SWR_CONTROL,
 			   CDC_VA_SWR_CLK_EN_MASK, 0x0);
 
 	va_macro_mclk_enable(va, false);
-	if (va->has_swr_master)
-		clk_disable_unprepare(va->mclk);
+
+	ret = pm_runtime_put_autosuspend(va->dev);
+	if (ret < 0)
+		dev_warn(va->dev, "runtime PM put failed in fsgen disable: %d\n", ret);
+}
+
+static int va_macro_setup_pm_clocks(struct device *dev)
+{
+	int ret;
+
+	ret = devm_pm_clk_create(dev);
+	if (ret)
+		return ret;
+
+	ret = of_pm_clk_add_clks(dev);
+	if (ret < 0)
+		return ret;
+
+	return 0;
 }
 
 static int fsgen_gate_is_enabled(struct clk_hw *hw)
@@ -1534,6 +1555,7 @@ static int va_macro_probe(struct platform_device *pdev)
 	void __iomem *base;
 	u32 sample_rate = 0;
 	int ret;
+	int rpm_ret;
 
 	va = devm_kzalloc(dev, sizeof(*va), GFP_KERNEL);
 	if (!va)
@@ -1601,22 +1623,20 @@ static int va_macro_probe(struct platform_device *pdev)
 		clk_set_rate(va->npl, 2 * VA_MACRO_MCLK_FREQ);
 	}
 
-	ret = clk_prepare_enable(va->macro);
+	ret = va_macro_setup_pm_clocks(dev);
 	if (ret)
 		goto err;
 
-	ret = clk_prepare_enable(va->dcodec);
-	if (ret)
-		goto err_dcodec;
-
-	ret = clk_prepare_enable(va->mclk);
+	pm_runtime_set_autosuspend_delay(dev, 100);
+	pm_runtime_use_autosuspend(dev);
+	ret = devm_pm_runtime_enable(dev);
 	if (ret)
-		goto err_mclk;
+		goto err;
 
-	if (va->has_npl_clk) {
-		ret = clk_prepare_enable(va->npl);
-		if (ret)
-			goto err_npl;
+	rpm_ret = pm_runtime_resume_and_get(dev);
+	if (rpm_ret < 0) {
+		ret = rpm_ret;
+		goto err;
 	}
 
 	/**
@@ -1629,7 +1649,7 @@ static int va_macro_probe(struct platform_device *pdev)
 		/* read version from register */
 		ret = va_macro_set_lpass_codec_version(va);
 		if (ret)
-			goto err_clkout;
+			goto err_rpm_put;
 	}
 
 	if (va->has_swr_master) {
@@ -1659,35 +1679,26 @@ static int va_macro_probe(struct platform_device *pdev)
 					      va_macro_dais,
 					      ARRAY_SIZE(va_macro_dais));
 	if (ret)
-		goto err_clkout;
-
-	pm_runtime_set_autosuspend_delay(dev, 3000);
-	pm_runtime_use_autosuspend(dev);
-	pm_runtime_mark_last_busy(dev);
-	pm_runtime_set_active(dev);
-	pm_runtime_enable(dev);
+		goto err_rpm_put;
 
 	ret = va_macro_register_fsgen_output(va);
 	if (ret)
-		goto err_clkout;
+		goto err_rpm_put;
 
 	va->fsgen = devm_clk_hw_get_clk(dev, &va->hw, "fsgen");
 	if (IS_ERR(va->fsgen)) {
 		ret = PTR_ERR(va->fsgen);
-		goto err_clkout;
+		goto err_rpm_put;
 	}
 
+	rpm_ret = pm_runtime_put_autosuspend(dev);
+	if (rpm_ret < 0)
+		dev_warn(dev, "runtime PM put failed after probe: %d\n", rpm_ret);
+
 	return 0;
 
-err_clkout:
-	if (va->has_npl_clk)
-		clk_disable_unprepare(va->npl);
-err_npl:
-	clk_disable_unprepare(va->mclk);
-err_mclk:
-	clk_disable_unprepare(va->dcodec);
-err_dcodec:
-	clk_disable_unprepare(va->macro);
+err_rpm_put:
+	pm_runtime_put_sync_suspend(dev);
 err:
 	lpass_macro_pds_exit(va->pds);
 
@@ -1698,27 +1709,23 @@ static void va_macro_remove(struct platform_device *pdev)
 {
 	struct va_macro *va = dev_get_drvdata(&pdev->dev);
 
-	if (va->has_npl_clk)
-		clk_disable_unprepare(va->npl);
-
-	clk_disable_unprepare(va->mclk);
-	clk_disable_unprepare(va->dcodec);
-	clk_disable_unprepare(va->macro);
-
 	lpass_macro_pds_exit(va->pds);
 }
 
 static int va_macro_runtime_suspend(struct device *dev)
 {
 	struct va_macro *va = dev_get_drvdata(dev);
+	int ret;
 
 	regcache_cache_only(va->regmap, true);
-	regcache_mark_dirty(va->regmap);
 
-	if (va->has_npl_clk)
-		clk_disable_unprepare(va->npl);
+	ret = pm_clk_suspend(dev);
+	if (ret) {
+		regcache_cache_only(va->regmap, false);
+		return ret;
+	}
 
-	clk_disable_unprepare(va->mclk);
+	regcache_mark_dirty(va->regmap);
 
 	return 0;
 }
@@ -1728,23 +1735,18 @@ static int va_macro_runtime_resume(struct device *dev)
 	struct va_macro *va = dev_get_drvdata(dev);
 	int ret;
 
-	ret = clk_prepare_enable(va->mclk);
-	if (ret) {
-		dev_err(va->dev, "unable to prepare mclk\n");
+	ret = pm_clk_resume(dev);
+	if (ret)
 		return ret;
-	}
-
-	if (va->has_npl_clk) {
-		ret = clk_prepare_enable(va->npl);
-		if (ret) {
-			clk_disable_unprepare(va->mclk);
-			dev_err(va->dev, "unable to prepare npl\n");
-			return ret;
-		}
-	}
 
 	regcache_cache_only(va->regmap, false);
-	regcache_sync(va->regmap);
+
+	ret = regcache_sync(va->regmap);
+	if (ret) {
+		regcache_cache_only(va->regmap, true);
+		pm_clk_suspend(dev);
+		return ret;
+	}
 
 	return 0;
 }
-- 
2.34.1

