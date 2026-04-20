Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45B3249EB
	for <linux-sound@vger.kernel.org>; Mon, 20 Apr 2026 12:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776688250; cv=none; b=eWs5R/LS+cGhkR39bpNSOBvRsT4kuWeyN0e56cg12RJJiEHzTmIz3/Feq4Ej/ByQCWNg2Y1rqeiFqggfVs5cWI4KOnoAwmCwf8KN5uOeGTxLDQ27i9DoIrck/JpF+PSBXAVq97T4I8Mx9H6m+E9YZDDUoDKwwY1mFw/Z/VRQq9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776688250; c=relaxed/simple;
	bh=I/pefbqSETmnZNPMeq5NEVntkaBKgRJaMe2Xo98cXlo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FtXItJfdmZMoACgYB+U9x/A9o1vyO04eOd4eWnvoLpMrawgAVqsoQ15BlTtRtqiagiq2zCX3WFBrwumgD6ZA70tFSHosaFAevVJp5TzoduB7h+r9WiCpyv1OTwUgJFg244QTSOfF87hET0aDGUr7pofWj9hk76QXk+JwdjrsCAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cnzgp/aR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GOQYP7I7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cnzgp/aR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GOQYP7I7"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KAvSQw3015242
	for <linux-sound@vger.kernel.org>; Mon, 20 Apr 2026 12:30:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HisKd0+ZQuB
	MbBHyrnZU+sXN057JWjOAmVpbH/jgtuI=; b=cnzgp/aRm02KpmDsJsmI1acUS7t
	UfK2Z05cFRPzRzNS3HRULoLyv8M9cFoyggJAi9z7sagKVRBAg1jYbTSUIuQDSEIu
	wXW8L44g4VL8JOlVT6c8Gku2gpreGYYCgOcmMPubaN64QU0LQ61AfUqvApj6CuSe
	5nFLSnVnoRKRD97W/SzMEBL+c8sagsba3M4xeyPaTvvFh87atNNMFQ8mlpdO31CR
	F9aC26Woc3yDvEQWjnHC4MUkI9ceqtX8jF3dK9R3EzMFrz/enfkD4TwgnVqnmPQF
	7cUsJGQVVvI41jHSqEoAHJwmSUTpuRxuRhQGWEk3FO4NtCR2XoWyPZZFcvg==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnjukr915-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 20 Apr 2026 12:30:47 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7b7e80f7a8bso54273417b3.3
        for <linux-sound@vger.kernel.org>; Mon, 20 Apr 2026 05:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776688247; x=1777293047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HisKd0+ZQuBMbBHyrnZU+sXN057JWjOAmVpbH/jgtuI=;
        b=GOQYP7I7i11E7mECCJnl4a9AG7og8LA7dfZouxoQshNp0PDkb+5Kocg/NRK+7o0TVm
         c+4LbgRMVwRpMmHC7GplXdWYFK8F0KyNQ21IoTttF3RN9A47cM6U06catLasi1qOamv5
         wuqQ3yuH63d9lnWZML8nTbadBo7eLGIXyDDV/gt4VlGg1fCr3kRMt99HrCEES62RamRL
         LbNNxNqzaYyR1l3LSfFOsmQh0xuWugr/GX7w1mhcLKcjMAEWuUbnOPtlZHp8f7w9JdAy
         /BA677arnR4IdVS8iekQ17We2wNnCrvWWg6SDzTWNFQpBuKQlLS54VgZCUqC/NUIk9A9
         H5nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776688247; x=1777293047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HisKd0+ZQuBMbBHyrnZU+sXN057JWjOAmVpbH/jgtuI=;
        b=cH0wDIuW0N5W9CzmY+QPBl162fWbb23jkCmC2qS6beZLUMuBweAv1iVsRNs1aCRT9L
         B2QmZa6JcQOWdjrD0GG8ns4vagnYt8cOFl+tHe57E0ru7AxGytil03d8ZCMz54kB6qFl
         5Uv2QX+SYrSO+5J9Tuwg5xUdJHj+UxP8pbA4Z8v4wwmUQfGAf5qMtOu8QQXv1KDuSNyv
         rx+KfurDlaK9d5O1aFLAyB4b/6vmHHMLrTeMteJP2UnR5dX+grXdZl++hV4ONbn7AHf+
         A4LEhw2aC6rNqsOy48g7bkXmt480gvcOGGnNQMox1rzH9rZxlFP9kBwhD+tMwshOsDUq
         mmzw==
X-Gm-Message-State: AOJu0YycANg8faWiGHtN8g9XaWORDYNxnugjEbmYhQZPBTBMXSH6jXCr
	G/yady/nH1KgfIPv+M+5uLHwd8IBBB5vzX6N1HUY58/0JcBU6aXYS6eD1ys1MYZjYyVT5J+0GoC
	JD3ly/coWliPw22fGTybLxf1DyaXy4Ro4TahTd7SDK4q5mlnUDOccmVGrr4PiKqiRUg==
X-Gm-Gg: AeBDieuOuO+I/ClGeSibktTL0kvpG5pyO76OTzQXA2RNQPyP/8jlSOuMDc6K58d73m1
	J4HaNpDMP/6AoEYoSvR8pCN1DafFTspXWjwxGv0lBAi7U4iz7EDDKuaIOtRziEZ62t4Edmh3xWY
	QRYck7JUG852dg5DCdRz+dzskB802+H7Oio+5lZbaccUZR3LaE+LVDNBPRAUHkG+8CCJded1G1e
	EDZYfe4/Nw1T3LRm4PYy2XlG3239BIbc6yqtfvfCBK0PeOIfbcwqAzLEb/+Zg28ZfqHpoLW+zX7
	SZasbkPUl9OH3iBIPqqbCGvcOzxL/EVrD062rf9d2XJjvJrnscwWJ8JAeLnSCgRJcuDOEbOylbb
	TSqjGJT53bjumf4X/sHLIR2XiDQxL/s1yC6dGXBSCSXzNKbgvxkPx0Mf0dboh
X-Received: by 2002:a05:690c:388:b0:7ba:f2f1:86c0 with SMTP id 00721157ae682-7baf2f192a3mr24413357b3.12.1776688246816;
        Mon, 20 Apr 2026 05:30:46 -0700 (PDT)
X-Received: by 2002:a05:690c:388:b0:7ba:f2f1:86c0 with SMTP id 00721157ae682-7baf2f192a3mr24412937b3.12.1776688246262;
        Mon, 20 Apr 2026 05:30:46 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b9ee89aa91sm42785177b3.6.2026.04.20.05.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 05:30:45 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH v2 2/3] ASoC: codecs: lpass-va-macro: Switch to PM clock framework for runtime PM
Date: Mon, 20 Apr 2026 17:58:42 +0530
Message-Id: <20260420122843.327171-3-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420122843.327171-1-ajay.nandam@oss.qualcomm.com>
References: <20260420122843.327171-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: h7ph1SzLSftW85iL522Ug9lvRqpmZtHp
X-Proofpoint-ORIG-GUID: h7ph1SzLSftW85iL522Ug9lvRqpmZtHp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDEyMyBTYWx0ZWRfX38kgl84FJBAF
 +bSUyANja+7I8t/WUPHGh7+5GE9q30+8cHR/GuCHvNkmAlMpUkzh0n/bhbE+91OnHrodRRP0zol
 475bgP6vmQMTMNtNunf56Lss7JV/4NHTL/6DNOLYe86iAv7854vn5CkHUUfWDEPSj1iv7uqPIUZ
 4fG4DrNfPClKIaTsJbb0l5TojUCATVelY+0l51aZDybkx944icoCg2UXH+USBkgJGBDlA6Wy3LB
 Ewy7v78KPf80y0QoFtrE7Vrdyofzao+qPkwCuNNMBW6BGrTUjejixqhd+HjP66HnMtGw0Uoym+D
 /BrUtVQMjrRFbgJCSF8/hMqd62TKGg7T6B6Bp+VFlYysnacpA8vnptk6WI2yJRB47Mvbrne9BWz
 fJww4mGwxKmf4bpN0hXtk6CfzAjdNYQsOrFXY+IXSrXCSiZDk0jgy3Dp54sMGSmF47d10kMRLtF
 BIfgfEjvOBH3OEqC9KA==
X-Authority-Analysis: v=2.4 cv=WuUb99fv c=1 sm=1 tr=0 ts=69e61c77 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=YBVk55sqNhi4ukaP828A:9 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200123

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
 sound/soc/codecs/lpass-va-macro.c | 123 ++++++++++++++----------------
 1 file changed, 58 insertions(+), 65 deletions(-)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index 528d5b167ecf..949275f1dfac 100644
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
@@ -1348,18 +1349,22 @@ static int fsgen_gate_enable(struct clk_hw *hw)
 	struct regmap *regmap = va->regmap;
 	int ret;
 
-	if (va->has_swr_master) {
-		ret = clk_prepare_enable(va->mclk);
-		if (ret)
-			return ret;
+	ret = pm_runtime_resume_and_get(va->dev);
+	if (ret < 0) {
+		pm_runtime_put_noidle(va->dev);
+		return ret;
 	}
 
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
@@ -1372,8 +1377,23 @@ static void fsgen_gate_disable(struct clk_hw *hw)
 			   CDC_VA_SWR_CLK_EN_MASK, 0x0);
 
 	va_macro_mclk_enable(va, false);
-	if (va->has_swr_master)
-		clk_disable_unprepare(va->mclk);
+
+	pm_runtime_put_autosuspend(va->dev);
+}
+
+static int va_macro_setup_pm_clocks(struct device *dev, struct va_macro *va)
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
@@ -1534,6 +1554,7 @@ static int va_macro_probe(struct platform_device *pdev)
 	void __iomem *base;
 	u32 sample_rate = 0;
 	int ret;
+	int rpm_ret;
 
 	va = devm_kzalloc(dev, sizeof(*va), GFP_KERNEL);
 	if (!va)
@@ -1601,22 +1622,18 @@ static int va_macro_probe(struct platform_device *pdev)
 		clk_set_rate(va->npl, 2 * VA_MACRO_MCLK_FREQ);
 	}
 
-	ret = clk_prepare_enable(va->macro);
-	if (ret)
-		goto err;
-
-	ret = clk_prepare_enable(va->dcodec);
+	ret = va_macro_setup_pm_clocks(dev, va);
 	if (ret)
-		goto err_dcodec;
+		goto err_rpm_disable;
 
-	ret = clk_prepare_enable(va->mclk);
-	if (ret)
-		goto err_mclk;
+	pm_runtime_set_autosuspend_delay(dev, 100);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_enable(dev);
 
-	if (va->has_npl_clk) {
-		ret = clk_prepare_enable(va->npl);
-		if (ret)
-			goto err_npl;
+	rpm_ret = pm_runtime_resume_and_get(dev);
+	if (rpm_ret < 0) {
+		ret = rpm_ret;
+		goto err_rpm_disable;
 	}
 
 	/**
@@ -1629,7 +1646,7 @@ static int va_macro_probe(struct platform_device *pdev)
 		/* read version from register */
 		ret = va_macro_set_lpass_codec_version(va);
 		if (ret)
-			goto err_clkout;
+			goto err_rpm_put;
 	}
 
 	if (va->has_swr_master) {
@@ -1659,35 +1676,26 @@ static int va_macro_probe(struct platform_device *pdev)
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
 
+	pm_runtime_put_autosuspend(dev);
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
+	pm_runtime_put_noidle(dev);
+err_rpm_disable:
+	 pm_runtime_disable(dev);
 err:
 	lpass_macro_pds_exit(va->pds);
 
@@ -1698,12 +1706,7 @@ static void va_macro_remove(struct platform_device *pdev)
 {
 	struct va_macro *va = dev_get_drvdata(&pdev->dev);
 
-	if (va->has_npl_clk)
-		clk_disable_unprepare(va->npl);
-
-	clk_disable_unprepare(va->mclk);
-	clk_disable_unprepare(va->dcodec);
-	clk_disable_unprepare(va->macro);
+	pm_runtime_disable(&pdev->dev);
 
 	lpass_macro_pds_exit(va->pds);
 }
@@ -1715,12 +1718,7 @@ static int va_macro_runtime_suspend(struct device *dev)
 	regcache_cache_only(va->regmap, true);
 	regcache_mark_dirty(va->regmap);
 
-	if (va->has_npl_clk)
-		clk_disable_unprepare(va->npl);
-
-	clk_disable_unprepare(va->mclk);
-
-	return 0;
+	return pm_clk_suspend(dev);
 }
 
 static int va_macro_runtime_resume(struct device *dev)
@@ -1728,23 +1726,18 @@ static int va_macro_runtime_resume(struct device *dev)
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

