Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74ECB47CC6D
	for <linux-sound@vger.kernel.org>; Thu,  4 Jun 2026 12:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780577329; cv=none; b=Oz7IhijmTjWdWSYHVa5rmGUOIYH4LDOhfBhvXPkDZIy72WQ39d1nyNrLAwyqOzXuptPunAuF0Z0JjI5jq/mm5O8MFQGVaFNJvDfJkiTIeRFLb6HniTf05LtJLb7ZhACFYsN83LJkgp+V/YdgS/gKelg+w6xNy6Su1+u6S9FDZEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780577329; c=relaxed/simple;
	bh=LYlQL8slJT2X3TsQrVJGOcIURgOr7EAYfQdBwvHGCbM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hYURHnrzi4t1zXMQzmjyXqnGZMYC9u5F4XiP0ybjTxTm2240O7AscH+9r/W0IMLCly4ThZ1lNOH95Fwj62hj61BfWg4gJHHbpa1Kh3sQ+5+JVSKYeJZMg04/5LeRY9B1396qshlefuJzh3Kqa+Esst9vJ/G16drYqw3xRjmXAg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eyKcdI9k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q5qBgIBC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eyKcdI9k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q5qBgIBC"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654CCXn03221123
	for <linux-sound@vger.kernel.org>; Thu, 4 Jun 2026 12:48:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=g3+Ward7dHQ
	7AzvjxSqcPJkFYwCD8AMq1fWcD6KwA/s=; b=eyKcdI9kbP8lRGFUMD6l1oNBrja
	1BIspPSONk33sTK3NAs7W2zBeVExNakfQyt4yUgiFtYugv3zmNrgqyXtcGyedzXC
	K865Oa1rHTMKxgXsFFaTpD4VF04ASVfWOEo69ltTnHIFhy56LrHIADAIT7Ygymju
	Tk9ZVoYZVgaI/7JKJXaafd80uFrxPzW5ADn2Bh/lKu1wv8btt8WZci+mEp6WTKet
	fSj1R7kV2ju8RwgOr0shAfxTEKTOZXvOCuiZOHhQ/ceaUe+j4KhupYbaSFeI1GTk
	jp1HaYwpZrnohDxhxR5DJ6trNnu9bozdlPTqdYcCLal4mNOnJz6BV8FrMDA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek95u852d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 04 Jun 2026 12:48:44 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c85a2c129b3so423860a12.1
        for <linux-sound@vger.kernel.org>; Thu, 04 Jun 2026 05:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780577324; x=1781182124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g3+Ward7dHQ7AzvjxSqcPJkFYwCD8AMq1fWcD6KwA/s=;
        b=Q5qBgIBCJXBhA0nrbKMvvFayCL13H8bo2kANmq/8aaJ2+W3NdCkgoBKwiXgm3NOu/7
         LjG3JcmDBFrW7ce+IRKfFd4JUDvCkV20eAcKQT//4UwdpWCms3mlQgeuTMHeeZTRuyZ5
         /cK8TYrI1wv6XxfWhxduC6rlZz82YcNYzBXDIXraQFTBUFy2OHhG1+Lq4O3BmfSo9KeI
         fWJXXYMpheMtoCxbtCFmq8bGwx8Oz8VZxL564LNvvstP7OA+BGBs5cTdYoCR3OCmGPIj
         9bJwZCH4EojIuHnPIsaxaoYxCo4Acm6whSRKOAQul9ivU6LMH75hiLBhHvs0jx3iGBUk
         0t/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780577324; x=1781182124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g3+Ward7dHQ7AzvjxSqcPJkFYwCD8AMq1fWcD6KwA/s=;
        b=CfwfaTsqfewVa9xdmUmj4cL0z3/LZR7miP910miCO+LPsHO040VAiFjC0JdjsV0Xa6
         PBi5N9/LcgLK6wP6d2rxH5n2oqFRx7lHM6XmXhq6R12QUTyRAYOjEbBN6fNV5e6pUB+5
         DHDCjwgyDH95AYSFyvV2rJ9tKYoc4DAIhAxALXPG6/5/loE2d8mFbZTyHt+3PNxTcxJ+
         Ac5a5RxkA6xLjnqt6B4yC57O6fMqJ8R5YTbSxUV7ZIyVqRWN56qivZmJ09heSCEVWD2g
         T4TNhntUIqPdK8pko4I/wk8Xna7gZ1HN3YeJ4VaD68H/p9kLEQu0CBzP/su7Iv2IKHmR
         balA==
X-Gm-Message-State: AOJu0YwnaUy0fk9/9QalfuBpQJTIpY3dUDXFxgWG/Qj/DHECxZ9S2wuO
	x2O8zFR76bBBof08I6Le+HsiWwFNl7DLEm8xcWS6LQh4GWFE5K8J9/MI7wSKjF817BNwe7e2tEi
	2pp19dOtTZFz+KmoimDXbt54Vu1cFRNvISXONf0kuKc2eD9eYH+h1cPwFPH5ViQwwDQ==
X-Gm-Gg: Acq92OEwY3N8RfeR12x5TEbnob0wJZPfcVI/7Jm7bxzKCQ3PIf2SHSqwhRxblJwx3Nk
	s2d2aA+LixqKEsmQNrF/rvDtfg8uCKSG7wRvCgTtoJJxFZVYWE31bNOUO12o2Pr91AWdu2T3NSd
	xFTvNsjJ7nL7WYD4LwJtdkIpT8N/9qvf3HWohRZCsrDLADn3arojvebom9PMw1SsRX/Jc78wJOK
	f1oNywYpKpLR+ubIHrH9ByqT++pF/rCUktINdYNONZaAZX0BvTLeyGn6RYEBMDKWCWh7OcMoIIW
	lqH6Ih8L3IRTnul+ARHyQNVz/GD1Jmy+38kii+imXYypz2g6klno6Xq0/kpUkOfDIaqpS10K4gf
	SBaSC0LmoiAkfjf8OIqzFvBRNi9rwG1qdGPfpOtpmkrzWHRZSxl24pvmiUOX+
X-Received: by 2002:a05:6a20:d80d:b0:3b3:e05:7fc4 with SMTP id adf61e73a8af0-3b4979a261amr8468713637.30.1780577324030;
        Thu, 04 Jun 2026 05:48:44 -0700 (PDT)
X-Received: by 2002:a05:6a20:d80d:b0:3b3:e05:7fc4 with SMTP id adf61e73a8af0-3b4979a261amr8468679637.30.1780577323518;
        Thu, 04 Jun 2026 05:48:43 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df04311bsm4911811a12.9.2026.06.04.05.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 05:48:43 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH v6 1/3] ASoC: codecs: lpass-wsa-macro: Switch to PM clock framework for runtime PM
Date: Thu,  4 Jun 2026 18:18:21 +0530
Message-Id: <20260604124823.3467457-2-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260604124823.3467457-1-ajay.nandam@oss.qualcomm.com>
References: <20260604124823.3467457-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=at2CzyZV c=1 sm=1 tr=0 ts=6a21742c cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=0L53WUX8MMYAS1EgRPIA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDEyNCBTYWx0ZWRfX/Di0/uVWTQx7
 qaERlGNBBXbXam8b5gsqEYI2cY6vPSkiFa0a3aGtVsuyFEU6FeNQPTlQCbGQdGRrivkndBJvvmV
 Spyb0G7KAA8nQIJdJo/lq/fxPegf6fwEE6nPTQlN4ZJtRzw4/vVuO5u8tR0CuBPOMq9ysRQ7B7O
 vN+eIl7Wh2IuH3T1Vw1KndoLuCl4HrujFbZCQSDfnrBNS8chzBzDYogFGbIxm1116YcrIF1zyp8
 NhQtj/X3atPj81OWWOmciHT1+h8ihYE0VhphGKhyEzjqxi4hvIwTnAHCPsSd44j/C5U03tNfv6Z
 hgETkZUIxaoOUSOexmjngKMcMdZM1L9KPCnV5jM051xjodslxO9MJdBmNPsP3hftqZeC1ut2L7I
 I0sO3si+0ZPG9fBQJxqsCG8ZxjRn+wsKqCgGU/ac2wd3eS8/GV58bkBA6Q4WFSHrCG1Bn/svqcZ
 e1sLEVH6TBZxtBeZQag==
X-Proofpoint-GUID: l3yjcC0eIsQU0UHoaIxl9i8cZj4DatXT
X-Proofpoint-ORIG-GUID: l3yjcC0eIsQU0UHoaIxl9i8cZj4DatXT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1015 malwarescore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040124

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

