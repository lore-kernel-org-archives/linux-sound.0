Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E03386541
	for <linux-sound@vger.kernel.org>; Wed,  1 Jul 2026 18:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782931551; cv=none; b=WTvMsISjQjvNKHMVt8qO/Knr4H0oxxmqSA1XQyjCnBJAHLQOiDwEr/UEMtl3omKYOM1oYGqH8C03AxRHKCyBt86Zzdcrj6HGuacPrIb367PMXs4wT+rwWS1GH3rqTD+xjtINGAq4Ozcxl5m4JuCAkBzKaRFOKCh8vN3TTt7P8hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782931551; c=relaxed/simple;
	bh=d9QVOK+rAtm3TZ+oEDHtwihIRXZeJpvva5fdj7MZ2YY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XMlcwBASEvNCmyUmac2ZeXZaAbrUsn0aBjJKkS8+Z4YJaXFIKsPVNtxxIfk3RfYwXvsrYjW5S6BibeD9YPm/mRXbW2mHvZ0njhgSogycZt+aP4CKkEh4HfZh9CtXD4NJ2TZNk0kup2+11+piT7jRZAnnHE9PTqDun+r/GJ/tvvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pNA4Uklc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HuoTJ4fr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pNA4Uklc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HuoTJ4fr"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661GmrLY1692307
	for <linux-sound@vger.kernel.org>; Wed, 1 Jul 2026 18:45:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3w9QdA7b771myxC+ZLEiTzbZxuHazaDmWMnEsXHPfuA=; b=pNA4Uklcw+7fWlcR
	YytVh/44hgedGdZGlJtAnrDQOwAt74RDdl28Wp+5Tk58GYoJeMlSyYfRJCzfXziu
	VUbHLKHs+pQv1Ix+mrrJypSLA1/VBHKxg7P9Xt+CDlZO2Ku+YjLajUnMMiLUCrXo
	JApsWVDritzVhnL2V0KO/VtWiKwyuvLelUBZ7E5NSZLVIvEgI2w/LHmEg633uHgt
	HzIzeE+CaajWC+2vN8HHZjw48Dx+mu5bH5ou7kD23i4L2pg8Tw9WCg9brF4Z+1IV
	UIk5c50McswjuEfGyN0RsqZjQbb4fkYGtNY6SiauY9nfoHqQ27ofMETe7tRRmBP7
	Z5me6g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4x0tk500-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 01 Jul 2026 18:45:48 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37e24235ce1so1315156a91.0
        for <linux-sound@vger.kernel.org>; Wed, 01 Jul 2026 11:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782931547; x=1783536347; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3w9QdA7b771myxC+ZLEiTzbZxuHazaDmWMnEsXHPfuA=;
        b=HuoTJ4frnP6YoJB0f1gXR8kRS+OXGG7iPvbuXVJFB0gkAT8UTfi4SK3WPv5jI1QByq
         Vz3AvASk7X9yW/nyIJA6UJs4LH5hC5+wZzOiatB6Yg9EjQtXpr+/DJMT8tu09BFXDp5y
         gN38BB/7v0MvourQln7RlvrOw4KoFxh5eVttXREhgCvw5JRyHigRtHKjvzqn+msP7j1c
         jXb6IPfNAij8X/iUc49NbVl+qVa5wEAhRpTv8jHw9udx3pzUCsTL9ZDA4ueyV0y5ZBUL
         /HPcDlF3vXY3+geKWjY3BbpgNmNmBmsnTllnU2jkrx5YUREQiCLwaqQFgKsCL8jGqg9O
         KFnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782931547; x=1783536347;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3w9QdA7b771myxC+ZLEiTzbZxuHazaDmWMnEsXHPfuA=;
        b=YPA/ggWeZmhnck6YT9ZhWTdFH1yimyBDjfJrLQcpjsaoVre5KAzDVJuFjeEMXJHNe6
         5NN4WmfSwAarJ4C+gNbS+RafRFYlGgyXy1DokPCqetMynLAxlcrmq7Dif8gX26CjFEF6
         /5ctH5p2HUO36S4GxO20rW+6PkO65WufNKh7jgmYEZc75lxDH+QXICwcja2kBGAty+lu
         dJD7kl1cvVVjnNjBHcpck9KY13oPhpcaanzEC2yR0yTkPcpCyR2awnM0RJPRO+nt93L/
         S13ZSnrgTeUhUzzPglk37l1KS9D2djeTbWXgWxBGwIO0yWOBrcWR/Vc3WR55uCS+K62e
         VKYg==
X-Gm-Message-State: AOJu0YzMt5nx905KR+V/FeU0R1ixtqqgeOvaXZN6eUSTfD3Nul9JyjL8
	So01TSaO0hg7PWGxn/39+69GVc8tk8dsq84LXwxupbPkK92T3SXctTTmChfgIaUOenQQp0CflYK
	ETtxL30amXy2OLcZVMm+CwHgZP7ofasVi/8SeaO58sYBRKKyvZvxLpP/xKNTMs385vw==
X-Gm-Gg: AfdE7clufYcPGitkpfQ5j3AX5m6zGW0SMfhN61pczAG1VXZpceveGuYo9NqMfXzHdXj
	4c76/TSE0WhtoHnZM5Ulm/uN3D/lsY+QCMqmz/ZFLKhzahj627YP0WqX4LzdJaqHNEMsxtHqez8
	Gg2LekpBV8IgXTDFmyEv4mMlGwoyzQmC9E1DqDmWvRXD3ywJHWpTqekHwihnqxsEqeI8MRvQdy+
	66KhhQIitdBaPBGWC3DASHjxNlaCEmdVJ4Ei5G/rFoGxS5B8R7fFr0BpEkctRingwKhMiQfDvWF
	aoT1U3Afg7415KKcDHGZnnfrzm8weGvqiSS+oiJwTH+PQomTv0lKwYpQSPfyMmdfYuk3B6zLm5j
	JzXG9E7NufEE1dDMVe2MeZYGDhVwpqysp5qYjRmk=
X-Received: by 2002:a17:90b:2f0b:b0:37d:7bbb:afab with SMTP id 98e67ed59e1d1-380aa0bd384mr2983145a91.11.1782931547334;
        Wed, 01 Jul 2026 11:45:47 -0700 (PDT)
X-Received: by 2002:a17:90b:2f0b:b0:37d:7bbb:afab with SMTP id 98e67ed59e1d1-380aa0bd384mr2983116a91.11.1782931546898;
        Wed, 01 Jul 2026 11:45:46 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38097dba406sm1023489a91.2.2026.07.01.11.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 11:45:46 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 00:14:58 +0530
Subject: [PATCH v8 2/3] ASoC: codecs: lpass-va-macro: Switch to PM clock
 framework for runtime PM
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-xo-sd-codec-v7-b4-v8-2-d39d0fdb7859@oss.qualcomm.com>
References: <20260702-xo-sd-codec-v7-b4-v8-0-d39d0fdb7859@oss.qualcomm.com>
In-Reply-To: <20260702-xo-sd-codec-v7-b4-v8-0-d39d0fdb7859@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-GUID: cDkiK4D2hrhqhBO1MhDZtkWzmmlfsJbU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDIwMCBTYWx0ZWRfX1U5/bO/FAPC4
 FIuHo3pfr7mH7KNvZQbZyyt9u5FgFBIftIguiGAFEGmlcdcy/2MQxD2w1Mr/X/FnA9Hc5hnfqLF
 khGg/1EnLRS8VwadvK0uf+GaPDCRUsg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDIwMCBTYWx0ZWRfX0WuTEoqRLb5z
 S1q9h6RJPUaupJfFPZxTv33aADKWHIB/XoNG/XMDZL88OMCkyMXxohFyMmcETrrWX2hqY2lhUaX
 PBp0PQoJpeZF98IQKtQbla39sQvWQ7XcAWwn6OBFBpI5K30Zh4eISFH1tvLQJTspphqGvE7QaZ8
 ppCEXz5HF29G0Pa+QgENvZy5st2fSlZS2WEYOqhwhNSBybvHjrLCfq7DwTVXtbskbPmVze/yyqi
 3b9FqWFPjqE73LHkz1gOTn+bf4aBqVYkBhYnJdmehDa/krqN2a/N2PsnzOwOAJkn9ePXBGtvo9a
 OmSGdNYbuitt1OFkfYNj5RQq5yswo2Pt0QjqDezbhT1JZWj6cjkkrq+t3t/xSRZjhTjMyXA/i+d
 DkcGw1Xjszv4Oj2CMDALeNA8viH7mTDhdS15plHuudPEKRjCbZjAzFIX820SoFzBIMC/7OAyK9c
 2DoNqBjHq/BN+tDndKQ==
X-Authority-Analysis: v=2.4 cv=T5+8ifKQ c=1 sm=1 tr=0 ts=6a45605c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=hyFrmWFU3cArO6j5gzUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: cDkiK4D2hrhqhBO1MhDZtkWzmmlfsJbU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010200

Convert the LPASS VA macro codec driver to runtime PM clock management by
using the PM clock framework.

Replace manual macro/dcodec/mclk/npl clock handling with PM clock helpers
and runtime PM callbacks, and keep runtime PM references around fsgen clock
gating so PM-clock-managed clocks remain active while fsgen is enabled.

Set autosuspend delay to 100 ms so PM-clock-managed votes are dropped soon
after idle while still avoiding suspend/resume churn on short gaps.

Add a PM_CLK dependency to SND_SOC_LPASS_VA_MACRO since this patch
introduces PM clock APIs.

Improve failure unwind paths: handle runtime PM put errors in probe/fsgen
paths and restore regcache state correctly on resume failure.

Suggested-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/codecs/Kconfig          |   1 +
 sound/soc/codecs/lpass-va-macro.c | 129 ++++++++++++++++++++------------------
 2 files changed, 68 insertions(+), 62 deletions(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 92cfa623782c..030bb902fdef 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -2904,6 +2904,7 @@ config SND_SOC_LPASS_WSA_MACRO
 
 config SND_SOC_LPASS_VA_MACRO
 	depends on COMMON_CLK
+	depends on PM_CLK
 	select REGMAP_MMIO
 	select SND_SOC_LPASS_MACRO_COMMON
 	tristate "Qualcomm VA Macro in LPASS(Low Power Audio SubSystem)"
diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index 528d5b167ecf..814a14f0d117 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -10,6 +10,7 @@
 #include <linux/of_clk.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
@@ -1346,34 +1347,43 @@ static int fsgen_gate_enable(struct clk_hw *hw)
 {
 	struct va_macro *va = to_va_macro(hw);
 	struct regmap *regmap = va->regmap;
-	int ret;
+	int ret, rpm_ret;
 
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
+		rpm_ret = pm_runtime_put_autosuspend(va->dev);
+		if (rpm_ret < 0)
+			dev_warn(va->dev,
+				 "runtime PM put failed in fsgen enable unwind: %d\n",
+				 rpm_ret);
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
 }
 
 static int fsgen_gate_is_enabled(struct clk_hw *hw)
@@ -1534,6 +1544,7 @@ static int va_macro_probe(struct platform_device *pdev)
 	void __iomem *base;
 	u32 sample_rate = 0;
 	int ret;
+	int rpm_ret;
 
 	va = devm_kzalloc(dev, sizeof(*va), GFP_KERNEL);
 	if (!va)
@@ -1601,22 +1612,24 @@ static int va_macro_probe(struct platform_device *pdev)
 		clk_set_rate(va->npl, 2 * VA_MACRO_MCLK_FREQ);
 	}
 
-	ret = clk_prepare_enable(va->macro);
+	ret = devm_pm_clk_create(dev);
 	if (ret)
 		goto err;
 
-	ret = clk_prepare_enable(va->dcodec);
-	if (ret)
-		goto err_dcodec;
+	ret = of_pm_clk_add_clks(dev);
+	if (ret < 0)
+		goto err;
 
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
@@ -1629,7 +1642,7 @@ static int va_macro_probe(struct platform_device *pdev)
 		/* read version from register */
 		ret = va_macro_set_lpass_codec_version(va);
 		if (ret)
-			goto err_clkout;
+			goto err_rpm_put;
 	}
 
 	if (va->has_swr_master) {
@@ -1659,35 +1672,28 @@ static int va_macro_probe(struct platform_device *pdev)
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
+	rpm_ret = pm_runtime_put_sync_suspend(dev);
+	if (rpm_ret < 0)
+		dev_warn(dev, "runtime PM sync suspend failed in probe unwind: %d\n", rpm_ret);
 err:
 	lpass_macro_pds_exit(va->pds);
 
@@ -1698,27 +1704,23 @@ static void va_macro_remove(struct platform_device *pdev)
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
@@ -1726,25 +1728,28 @@ static int va_macro_runtime_suspend(struct device *dev)
 static int va_macro_runtime_resume(struct device *dev)
 {
 	struct va_macro *va = dev_get_drvdata(dev);
-	int ret;
+	int ret, sret;
 
-	ret = clk_prepare_enable(va->mclk);
+	ret = pm_clk_resume(dev);
 	if (ret) {
-		dev_err(va->dev, "unable to prepare mclk\n");
+		regcache_cache_only(va->regmap, true);
+		regcache_mark_dirty(va->regmap);
 		return ret;
 	}
 
-	if (va->has_npl_clk) {
-		ret = clk_prepare_enable(va->npl);
-		if (ret) {
-			clk_disable_unprepare(va->mclk);
-			dev_err(va->dev, "unable to prepare npl\n");
-			return ret;
-		}
-	}
-
 	regcache_cache_only(va->regmap, false);
-	regcache_sync(va->regmap);
+
+	ret = regcache_sync(va->regmap);
+	if (ret) {
+		regcache_cache_only(va->regmap, true);
+		regcache_mark_dirty(va->regmap);
+		sret = pm_clk_suspend(dev);
+		if (sret)
+			dev_err(va->dev,
+				"failed to suspend clocks after regcache sync failure: %d\n",
+				sret);
+		return ret;
+	}
 
 	return 0;
 }

-- 
2.34.1

