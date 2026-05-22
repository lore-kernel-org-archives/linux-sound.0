Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E2939A7E0
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 13:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779455111; cv=none; b=DPfRg3rlfc2Tv7RTHpcKQch/U1BAqYldCeGrpm5/gw4RcLM6M941dmd62RR2XlwewCa+Ea5RpgsK6mFEcfnBvu0YAr7Utodwh27JashVjCbumZsk9fUptWEhs18OMxUGUfVg+pU1/5Y/tonwrrNTuwAYmkrVjkL60SpzuTeziac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779455111; c=relaxed/simple;
	bh=sg+2Dka9Tii5QpZ1rgOk7V9jpFe641VpWCk5BfK8u0Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=St9O0LFLUUsLmkkMk+pbAhZQw/pfJMR28WvTCkK2/touMjmFZH7gCberhgCggmUEaMI2CvW35WT9SEBsROiV3yXP7o5hy1Sns7VyAHjPYhBsoh6id0Bq/8uDMq4Tu+N1ao1YT9nV2OKKR0HImL7U8NGnjpMpYNU5tHeXiYxMKis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZSwzn/8l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ieuNoUkN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZSwzn/8l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ieuNoUkN"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M8eUhX2765446
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 13:05:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PM8JHMudD5X
	llfnNJ93l4boA9kEYi/3g+ZR7vBgyK2U=; b=ZSwzn/8lZciJCV0A1Wn1Wg8OALZ
	boMRunWcBu9Sor7+Dp/ltzht19NGOaziE6O2RwHr47aT+oLzYlovj6SV5UB6Ya4C
	44r246NNb6mDy9YK2rseiR4h/zGbX3S+tDrHAZ6mBJORhprj+UYLz+wwSXGLAYnq
	mWwpVjmcjGpcYEou3Yst7s4daMNaUS8+qR6wPU60flHsVnZq6eL0ySlkXQG3agub
	H2YsSD8CsUuKleCJo2zhtH++q8otukfQlDhp9ClnXCUTujYYHxw8bIfZqKSCiA/k
	cZJA/WwQLQAzBnkXH9IwdiwlvKExO0ZxTuZrfPMzOlZfEYORMXGSBiM2DbQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea3u7w225-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 13:05:08 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-368b0dc7731so4289443a91.3
        for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 06:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779455108; x=1780059908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PM8JHMudD5XllfnNJ93l4boA9kEYi/3g+ZR7vBgyK2U=;
        b=ieuNoUkN0D7htTNMLKMvYVRYAD2upUisRcBUZa6Koydx0Hd8xp/LjvDbWfCiOrNOTi
         hMda6FhVHpAZ1w6YU6t7ambgScApYcNibrd7t7nHY9oybi1/Gt8jw0SVLJAv7JpLayGj
         2CPXDojfta3j0EyHMPbWaneKUAZvhaDD6ovnc17zNKw10VwGfEU+mAkRHXR9VmV0OtX0
         Tx7u61YQTKXkKUqoG+cPAG4AtTPdrMmnBB0iA4L5lU+8wzXpdVOnxKcfy0Sd+kJbNXhp
         LWcW3qkOErlKnkrFuWVFu9xIwWUS87240+pWElLFTGHK8ebcwPuSICpIhdXxLvaShv2X
         9Uhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779455108; x=1780059908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PM8JHMudD5XllfnNJ93l4boA9kEYi/3g+ZR7vBgyK2U=;
        b=rB1hUaDQa2b0/fEknb21WlwfNmXOKH3KYMVZxo+5EWkOCA8LMuS7rOet+Hl7/7MKq3
         js887jJlYmh8CkgNxdQwKIP294N5rs6PqUGbxyR64waqzxuP3w+l82rHpv85Ks4PPFyI
         iVygThgX8PA6mZxizK5ExV64VVCDhC52IkyEmQRcVFaQISDSM60hGQrFGp4mWJAawnSF
         YK9wUfBRWcE4UmOYyx41KRtSnN4jqvac7wiiYR5Y/e8r/poNrQRRixXvs6mFZ0w7ZbaA
         iMeyRojPgJY7dli53OWgLG/eSR9SXnKEiiUw9uRlUNjtoJ9vbkoH7DPNZvY9lIw+TnvJ
         r/ug==
X-Gm-Message-State: AOJu0YwBbb5Vjqt/EgkCGmWaP/9vzl99QfyKCGXm1b+g7a6I67jdMQCg
	219py/nFiT8opFbWdlIsu/S4YgQiuRh6VbWg89LueFr1LMbdwtjlMlnvg035eEMKhq3cZiWmHpt
	/PoJ0YTfIuCD5uUtf+WlglbFt626GN4CmDQu2OI+vGMjapaQdJjYxQdlWdyNQR6rNuQ==
X-Gm-Gg: Acq92OFwkYMLeUVbyolqnDHdcMv/zdVrvuTyyCGE0m/ImASZMm/s/qeCIsv4cXl0AY/
	KbD4oBs36n5HAxI5OLB8x3Heg1sGYA1/FxLyOBVjL1q4J1uOYTLPhccgOwKLuH7rys0mXiSh+JX
	x8HYSsteot8/Qf2Y/PiLkO81ca3yjU3GBbhumGL1OA0M750aKMgIg1txxnlcZqaOyNrZabDABAs
	hzbJN8x3zWa+cb70p1rkMDABukJMnizmG22Xu2sBbaJTNT5FMOfpEjYFp9xyjBhd54E6nK4GCnp
	hgTG3T9fJ063P6LmRa0PTUdCkoLswCslobweh0COnBPGHjnWRyu7B8sskEJk9VlixIyYvb46ps1
	3wSYSUQvPV00zW5okrjeyidTVRMrQvcYGVBuS7qBUIi1d5HIPvQ==
X-Received: by 2002:a17:90b:4e84:b0:368:a297:bd3d with SMTP id 98e67ed59e1d1-36a676f0614mr3778441a91.3.1779455107519;
        Fri, 22 May 2026 06:05:07 -0700 (PDT)
X-Received: by 2002:a17:90b:4e84:b0:368:a297:bd3d with SMTP id 98e67ed59e1d1-36a676f0614mr3778372a91.3.1779455106974;
        Fri, 22 May 2026 06:05:06 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a72c98b95sm2069980a91.16.2026.05.22.06.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:05:06 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH v5 2/3] ASoC: codecs: lpass-va-macro: Switch to PM clock framework for runtime PM
Date: Fri, 22 May 2026 18:34:41 +0530
Message-Id: <20260522130459.3411038-2-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260522073324.e18bb240b6f6@oss.qualcomm.com>
References: <20260522073324.e18bb240b6f6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aIXAb79m c=1 sm=1 tr=0 ts=6a105484 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=KdAuDO48zGbrRqqoz3UA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: JxsPOJJg0ub41OPtlbScQCDp7gL6h-g6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEzMCBTYWx0ZWRfX2KVv9D5wsLK8
 Nu8xsj/RO7x5gIH3aKdVbYMDArIEYScMAwWieE9bQuN0nrB2IM9zHQtqXcTVMrPSrOd2grytfwu
 wSKXKGToB0ktX1+yUToJ3lyfM3INijwgKCeFBjKX8oxSed5gKTBH8aTRNiy/cde0QB1LBed8hbx
 KzbDtKjBBPwFUZCEEVg1VATmdhbn8shqLnTtpa9BjGQsfijgP6xgiYenXjWD8mbEs1RmFYRTEob
 /LZMPurJn5ZZo7hpgU5Ly7dWnBtqA72F0mHnlcsNVBZxhwvD1BV8nhWO41XuiKAR8ZSIY6CBuav
 HSNT+oc4JYNHFW6vgy1qE/HtVVUEMvkJvr0oXygc1X3ssOKJG34rAdJTJRqjE3jlTB5NE5WOtTn
 tASTFOMnQkj02XizKR9AfuQ71Jknadnw0zRdcqSx2D2gTXGEAZJGC8+nU21jXADtdgTzj8NItAA
 Xn93+6z0ggB4QG2xFdQ==
X-Proofpoint-ORIG-GUID: JxsPOJJg0ub41OPtlbScQCDp7gL6h-g6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220130

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

Take a runtime-PM reference in fsgen_gate_enable() for all VA variants,
including non-SWR-master configurations, and release it in
fsgen_gate_disable() so PM-clock-managed clocks stay active while fsgen
is enabled.

Add a PM dependency for SND_SOC_LPASS_VA_MACRO so PM clock helpers are
available when this driver is built.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/codecs/Kconfig          |   1 +
 sound/soc/codecs/lpass-va-macro.c | 133 +++++++++++++++++----------------
 2 files changed, 71 insertions(+), 63 deletions(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 4e17119f2f9e..e73667b87fd8 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -2867,7 +2867,8 @@ config SND_SOC_LPASS_WSA_MACRO
 
 config SND_SOC_LPASS_VA_MACRO
 	depends on COMMON_CLK
+	depends on PM
 	select REGMAP_MMIO
 	select SND_SOC_LPASS_MACRO_COMMON
 	tristate "Qualcomm VA Macro in LPASS(Low Power Audio SubSystem)"

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
@@ -1348,32 +1349,56 @@ static int fsgen_gate_enable(struct clk_hw *hw)
 	struct regmap *regmap = va->regmap;
 	int ret, rpm_ret;
 
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
@@ -1534,6 +1559,7 @@ static int va_macro_probe(struct platform_device *pdev)
 	void __iomem *base;
 	u32 sample_rate = 0;
 	int ret;
+	int rpm_ret;
 
 	va = devm_kzalloc(dev, sizeof(*va), GFP_KERNEL);
 	if (!va)
@@ -1601,22 +1627,20 @@ static int va_macro_probe(struct platform_device *pdev)
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
@@ -1629,7 +1653,7 @@ static int va_macro_probe(struct platform_device *pdev)
 		/* read version from register */
 		ret = va_macro_set_lpass_codec_version(va);
 		if (ret)
-			goto err_clkout;
+			goto err_rpm_put;
 	}
 
 	if (va->has_swr_master) {
@@ -1659,35 +1683,28 @@ static int va_macro_probe(struct platform_device *pdev)
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
 
@@ -1698,27 +1715,23 @@ static void va_macro_remove(struct platform_device *pdev)
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
@@ -1728,24 +1741,26 @@ static int va_macro_runtime_resume(struct device *dev)
 	struct va_macro *va = dev_get_drvdata(dev);
-	int ret;
+	int ret, sret;
 
-	ret = clk_prepare_enable(va->mclk);
-	if (ret) {
-		dev_err(va->dev, "unable to prepare mclk\n");
+	ret = pm_clk_resume(dev);
+	if (ret) {
+		regcache_cache_only(va->regmap, true);
+		regcache_mark_dirty(va->regmap);
 		return ret;
-	}
+	}
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
