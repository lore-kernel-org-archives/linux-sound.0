Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03375367F3C
	for <linux-sound@vger.kernel.org>; Wed,  1 Jul 2026 18:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782931548; cv=none; b=lDa5QFZKxbQd9E5YJ1BW/JMT1Dt527nECtG1E+jezMPUc6QtDlIcUMKJIcQnSbGbgQ3rqMFf0RlYpsYkGQ7kqIt1XxMvtg29ddNXfvTnJt75QaDHegrPpWXxvGyJDEwRvvVJnK/ca3AZE0fFrk3rpy2EC+CfTibeOMC2ExcIO2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782931548; c=relaxed/simple;
	bh=BJWn646ReG/Zhog3+YV18NW8zzIb5JBXv7+oxMebjNY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TekwLsc9Z1v37FSL7qg7gSSXhc7S+AlSUgYi3/3hV0vJ/s4kUWtX5Jf5Z0caExIQbwaVewxJVavGAJHOK9BOYrtxZGTmhFu0ce3BQPM2RQbLa4xfWnUnHoy8MZqcR0Zw6Wqy17jvl0yLd3KSdhfdcwU53JMzI2saTTIgaoGmcVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L3KXGGzQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i6lQomyV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L3KXGGzQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i6lQomyV"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661GmpHg1708640
	for <linux-sound@vger.kernel.org>; Wed, 1 Jul 2026 18:45:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cLYsJ2RyfAAEuls6MuOpX4Na3+hzb3k3HRjT21yP3Ns=; b=L3KXGGzQTNQUEKVs
	F1ms336oaxy4VmXq/+FLfujJMWSTERLQW9g3N24XKBC35Kp7TUX3qYbxTwHEN84x
	05bA9zY0LQu0alB33HiisenATYqcMKgwZM9IRaKkTyhEHiFT54Az95FCU0hMjw2y
	f21yu6jjj9mQPWM3VpgxKO4exY/hlpI1jWoq5I0gNwFVl6A5kcHDX/BP+4vhlbG1
	7+4nM71DA7/GiaIbkKf4enGkmp3x0RDgS4XFmK8TS5gmZbhdCwvcP2zDPpJwRNBc
	0w3QZYQ02q79jsGbBzt5rqRnPPfeYCxwpPuB3XkXH1nqTHwTUzxFXdwkzBB1hkZj
	MO0hgg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f50sqtavf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 01 Jul 2026 18:45:44 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-380a638fb5bso777549a91.0
        for <linux-sound@vger.kernel.org>; Wed, 01 Jul 2026 11:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782931544; x=1783536344; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cLYsJ2RyfAAEuls6MuOpX4Na3+hzb3k3HRjT21yP3Ns=;
        b=i6lQomyVXyAVqwGpt3oPxiDrip/AbpnRbidrGT20kUGXQxHFNA0rbWpA/st3SfRKQ5
         qcsx0r3ckTuEgpyO7GRS4r1+pCZPHn7089uBVXSWd0ePDrvMOm0/NWNIIDGQB/jDcFUs
         I+kkRzHZPoxHH8W5CTgjGR+ZaQJ1M9nwoc/2m1Hln7ADCkbc/pghmt2OZCjYLXjYPylu
         LE/CQJ2LMefi4qz6sxXvlgpu/6p5puj38QQrA+ZIkdNkA/OEqLw8c3cpiW5VLOJxvw1C
         GUncfkyw7TQfl9qsMS5zPQXujfqGtlKR8dIK0JGHUx6X7EIRft8FgSji853Iy++SDlZC
         nyWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782931544; x=1783536344;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cLYsJ2RyfAAEuls6MuOpX4Na3+hzb3k3HRjT21yP3Ns=;
        b=ZJDcEOw14ckOx+OSCloFQmvMS0hlx+COj+dIDIjGNATjwadv0YTf/YcczzZsjAY6R8
         ODb0Z2XBeJlsOh924S7h4g/uqbGZFhIkeKKsSn2c7I6MfgSJTgvEatChKUkhUylS5TAp
         IVmrKu48ID4EjTJmo0jzV64CTeE13EPy5rrQtNokQdEeHB36SUtVYhFCLh4z0BZdWuEN
         nQiUZ0tUb7uIybwrRRnBJVa27Q+jdUj2e3DwWkcl7M3MLCgTnXAfFZojNtxYIrIez2h+
         3bLh8oGEy1Ah2JHNFaYWoJnq02qPZnocCbzvAhR19upUBHXj3YO/uAIIrHChUE0fCUgZ
         tStw==
X-Gm-Message-State: AOJu0YzyB7UR3vRjt1jgdwAzl8nX0WkUiEjP++A4bDCIUg/zB30hX+hi
	xTVZqmqCWu+JMabPuiHvji2UFG7dFxQf4Jo0eujXLJTIASUXkmX/mjp8UX9VSSU1OZZNE+k8GYh
	J2xveshrd3mAdrdoNNjm0t+bGe3ZRcPdyQ2uqGqkFEOPVBsFarybz8XxMUnmkdSSnWdJfBUVphQ
	==
X-Gm-Gg: AfdE7cloNfmGWU1BG22aydMbDz7StdbrMVhE6oRKQzZVci8QEXYGBwLKh9pAN8S9XE9
	DA6ijbFZYkqlgmGdohomXy4ZbLPsPClI3HgFbb8GxuZ16rnTBQqkZyZrswE5RfePGvx2e6F9UM/
	TVGbgE88mnJqwuOMANsVgW6496FO5GQ5dsR0BQnV+ij03ypQsnzuf60gFEkPF8tPUSKJhOoiNFT
	iE7Iyy7MIV/AcwZ75ikgDUEDnz4uKyyV+mk1f4isxrYM6SKbK6+7/n08WSnLtUfeNePPqc7lTYe
	YWD6rpPldl+/pVuf7MdJyOhfIenN0APRk2grKohy2C1t18rxxQR7di3I02CNXquue6iNPEg3dIQ
	d3hxKOlOKq95FJx/8ypqaPeiQzxIIQMK7Iuwyqcc=
X-Received: by 2002:a17:90a:e7cd:b0:37f:464d:ea38 with SMTP id 98e67ed59e1d1-380ba70e00cmr1812536a91.0.1782931543834;
        Wed, 01 Jul 2026 11:45:43 -0700 (PDT)
X-Received: by 2002:a17:90a:e7cd:b0:37f:464d:ea38 with SMTP id 98e67ed59e1d1-380ba70e00cmr1812502a91.0.1782931543344;
        Wed, 01 Jul 2026 11:45:43 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38097dba406sm1023489a91.2.2026.07.01.11.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 11:45:42 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 00:14:57 +0530
Subject: [PATCH v8 1/3] ASoC: codecs: lpass-wsa-macro: Switch to PM clock
 framework for runtime PM
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-xo-sd-codec-v7-b4-v8-1-d39d0fdb7859@oss.qualcomm.com>
References: <20260702-xo-sd-codec-v7-b4-v8-0-d39d0fdb7859@oss.qualcomm.com>
In-Reply-To: <20260702-xo-sd-codec-v7-b4-v8-0-d39d0fdb7859@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-GUID: BnVkcBRDX5xBlEP3psDnKJ5eVE05oMdK
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDIwMCBTYWx0ZWRfXyPOzqXEBaUhb
 u0OHTFTbhLBEGs1/8S6t6MCL2sL8E5VPYelSVeAKpmkTMmR+FBn5SVT1OAxu/2QnGu0j9CN9rpJ
 rm/ZR592GCJIRTaDe64QEZTU0q2wYjA=
X-Proofpoint-ORIG-GUID: BnVkcBRDX5xBlEP3psDnKJ5eVE05oMdK
X-Authority-Analysis: v=2.4 cv=ceHiaHDM c=1 sm=1 tr=0 ts=6a456058 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=akXh_AD3SVDOJReeMSQA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDIwMCBTYWx0ZWRfXzpyurmwe23Xd
 iPZqEwx3E/JpLMQ491rIPpCT1rbhIuLFNEvgKHfEOIaxEiFLi85I9y68gjG1GA3rh8IT2jGG+T/
 BhAFpDFDlu1RhhgsyIU/dwDzpf+9oDFNzmQd8kY5vQZqHquq3d4fp2AI89ngI8hJQpx1aIBtuQp
 KHTsDJP6rh9El87KOUrCTJKjOY5zIPS3MAtQDrK1bniYcsLP9950tACxoGkxuJAUzJsuo+v+Rln
 HNXZdQ3HCw0198vr6QGMjQnIvEy3+alv5sJMJpUS7AR4m1U/fz1dmw0KX5dyNlMOj9vtfYozlSn
 z4FvlPm3IDi8XPp0HgOlOrWuc0AiaQGlzPa8Fcfg6/CdFYPdbJ/wT3SSpjj1ifDEJsNJdMp1hgM
 e7iStj6XMwrCXENCUYbdl7EZKhT8wxdIkfqS+gAd5cpznkGFNwuaokU4tOGhm1RFicFzO06n6Lu
 3fe06AM2gk2+iz5KNpA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010200

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

Suggested-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/codecs/Kconfig           |   1 +
 sound/soc/codecs/lpass-wsa-macro.c | 131 +++++++++++++++----------------------
 2 files changed, 53 insertions(+), 79 deletions(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 252f683be3c1..92cfa623782c 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -2897,6 +2897,7 @@ config SND_SOC_LPASS_MACRO_COMMON
 
 config SND_SOC_LPASS_WSA_MACRO
 	depends on COMMON_CLK
+	depends on PM_CLK
 	select REGMAP_MMIO
 	select SND_SOC_LPASS_MACRO_COMMON
 	tristate "Qualcomm WSA Macro in LPASS(Low Power Audio SubSystem)"
diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 5ad0448af649..718564ee381e 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -12,6 +12,7 @@
 #include <linux/clk-provider.h>
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
+#include <linux/pm_clock.h>
 #include <linux/pm_runtime.h>
 #include <linux/of_platform.h>
 #include <sound/tlv.h>
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
@@ -2809,56 +2809,37 @@ static int wsa_macro_probe(struct platform_device *pdev)
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
-}
-
-static void wsa_macro_remove(struct platform_device *pdev)
-{
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
@@ -2866,36 +2847,29 @@ static int wsa_macro_runtime_suspend(struct device *dev)
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
@@ -2929,7 +2903,6 @@ static struct platform_driver wsa_macro_driver = {
 		.pm = pm_ptr(&wsa_macro_pm_ops),
 	},
 	.probe = wsa_macro_probe,
-	.remove = wsa_macro_remove,
 };
 
 module_platform_driver(wsa_macro_driver);

-- 
2.34.1

