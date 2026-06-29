Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075A93F888A
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 10:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782727572; cv=none; b=pMUxZ0drPaPbKtqvuevl+BGGVlhJN9kdool6cd/HWHXTfW/xfty9ofWpMicvfAIGjyItUh44MENxOWUjOItADjIw/pVQWxhNDtL6GMz5TfzFDFBqGL3Qo8/wOWzQQqf3iakUNkmaLVmFhVMZDt24HbrBl3gXLoAWdnmCAfKzLkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782727572; c=relaxed/simple;
	bh=BJWn646ReG/Zhog3+YV18NW8zzIb5JBXv7+oxMebjNY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=catX+1How0UYBstxujS4OdnnCIfRMw7h4+mVF9yExq5pXPDv41jJazC7w4NPXfci4+C19VhIeExiz4L0ZNU57sY7fHZ3UpD0Wpjoz08EPsC2QAy0J/XEFWlon3+cDmgT18w6NsczCZqegExUmzMGLndSY+cX5jP7xupSOecxElM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bz1/FqF7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O3+oT1+J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bz1/FqF7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O3+oT1+J"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6r1iq2076349
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 10:06:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cLYsJ2RyfAAEuls6MuOpX4Na3+hzb3k3HRjT21yP3Ns=; b=bz1/FqF7dReUF1ub
	kXhX7v1RAKPn5lvA7nxn+glzngAEoZh584C0jZ4CRB3quQaaGdWQX/V5ggti/s29
	6QItm00/+DTkyhEOZ/v7YeBzk0Ji3MyK6od1NLogXTmaGpdiDK+sTJjhHQgrB+EQ
	Lj3SOw7MLOoYD47zXtmc1gUEA/xGLMqQDFxkh9fXCDlHVSRKH5w80EpND1D74m9P
	QlTUvhtUjwCyKVjCWlsiCJ1F6w1Kb5tOEKdBxZ+McHNKaDUb27cNHvMR7FUgHu8G
	SXO5NT+36Xb3DUu9vk0Pzp4okJ1dTkHu8y0Cb5O5+gnn9VmVI/Kt+CKrLrd9p398
	cK3xFQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kp7gtq2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 10:06:09 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c9e994869aso5851245ad.0
        for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 03:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782727569; x=1783332369; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cLYsJ2RyfAAEuls6MuOpX4Na3+hzb3k3HRjT21yP3Ns=;
        b=O3+oT1+J6IAYObP9L3Xsz5beWjYx7XM7rmByEUbW2Q00Cv6wnDVfb00mW2ijLU1imu
         i0xyL7WLPGxDSeTGx4qlTCeLDKPYIg/ZJ0A/xoi4DeWU91kxCM/lERVFThnFk6HoDfpU
         UEcTAmCOmBXyCVfxmBngAIkM9vHU9MXJPBfEf7QrgnUeU8h+qIMCsU8RpxIu9c4kqptJ
         AD5MXycWgWJvYp9/2g6KU1KUAKsD9o5LXEXNVbaNaE/YJ+nft6Q4rbhmz+rSozmTezz8
         TPwsHD0qjCOVbEYFbcKNQzRsQpR7qIO0e8hJK7+w4r8qJ8UHsZKP6zmp8Er8a0VXyIPE
         ZNGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782727569; x=1783332369;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cLYsJ2RyfAAEuls6MuOpX4Na3+hzb3k3HRjT21yP3Ns=;
        b=DK6N/XF7TYLAKj+S6f017kEeUvft3rs0u6WI6zbYnVqASVwjiFQJ0PIn5D4MahbtVr
         ao5grH9+2ziiXwht3XcQkSUuDhNdmIfJ+MnxHgWJ2SveRX6KqE3rZwSu9lQ20QOrPVah
         Gs/LrA5Sb1UeBzKLSFPXDjbwiRCSFziO+H7zCw5X987gwg7OewWBU41bjVLhoIH2+rfL
         bjMaNOum37rPGo9EVDzAXub6FHjrqBeqA8eEVbFS8KXnE0BF9X49tjz3pJOUcSQKyq3Q
         fb9rZIWHYPtL0ESMIboRb6b7XmMQgGQCanOHmzNAGJcuKJDJKZuUp4DvySLQQLzLBvkW
         VH2g==
X-Gm-Message-State: AOJu0YyusmOJ112YSfNhXKWAEqhyfjv5Ynfx9uVpfh71f8Az2lKDwBQ4
	/1gOVxRYV8k9zd0C5vnOswHbjrVrnx6whs9R42AkYr6DZJaBAzXHfWcBYw5CSzegY28JJAw8W2o
	cfoYPrIuFbAaBo/toQnZmVPzjvRv9CCXJFx7dyrqmSl8ikOCc4mm8vSj17MqwJ4kuyQ==
X-Gm-Gg: AfdE7cl+yi7Gh14AwEM0iJ9JOCZVdnnUtt+6/yPtvtZ3K7dM9zHctHeJ+1n8+egqV2/
	jeM/c7SUxBVGHwLkZbzzxVU5FdVI6lH3BCQ+npPV5HGYflow/u46vKBhSOHTOIeUAQZ8KEKFbz5
	t8woVYvNbU6AalXiD0EIEcjmthsEDAPmibFWd/hF5q6Rq5No8rltGmQb/DwSd3dwfF9OuBpNNZ1
	cCpX9koVulFmtZzGolNm6o9CkCIcs7/bmDkL7jX+suBMCch4TrDMkMvib57UFzH9CE5vnIkMC9d
	doIRI9x5nwvN3PA76N5sWP61E4YA8/9wNJVdxXQgyuSf/vhklfqf7xKT0gJkb9fj8nKcj9wyJWq
	RGNVHOIWTOoQ2rB5JgIGWL7hS+3yjExHz28x+33E=
X-Received: by 2002:a17:902:ce07:b0:2ca:e5c:7fcf with SMTP id d9443c01a7336-2ca0e5c82d1mr15363485ad.3.1782727569198;
        Mon, 29 Jun 2026 03:06:09 -0700 (PDT)
X-Received: by 2002:a17:902:ce07:b0:2ca:e5c:7fcf with SMTP id d9443c01a7336-2ca0e5c82d1mr15363225ad.3.1782727568666;
        Mon, 29 Jun 2026 03:06:08 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f63cfe81sm88924305ad.55.2026.06.29.03.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:06:08 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 15:35:38 +0530
Subject: [PATCH v7 1/3] ASoC: codecs: lpass-wsa-macro: Switch to PM clock
 framework for runtime PM
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-xo-sd-codec-v7-b4-v7-1-fb37ce457c42@oss.qualcomm.com>
References: <20260629-xo-sd-codec-v7-b4-v7-0-fb37ce457c42@oss.qualcomm.com>
In-Reply-To: <20260629-xo-sd-codec-v7-b4-v7-0-fb37ce457c42@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4MSBTYWx0ZWRfX+QcTmzc4Yl1K
 xQxmAY1aVS6iCiWX/aIjdi8dR+MEl1gVWhpdWDWEJ+le7Gp2d0ifeFPcrVJiTRlHi03shBAPs21
 QvSq0B/DnXEA3qQs2odu3z5E/+Tst8U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4MSBTYWx0ZWRfX4RZfU8I+Auzp
 O2bQolOf4tLiS8lxUVZEElC/X9H+vuMQ+3ntTi/+WpNzR2kMWO/MXwJK+/PlVjxvcThrgs5PpXc
 qTLenowwoGE8eVDW+EbykybmOdiaSxbzJSCYpsKXh7YAC+8aruDDwKVp6N5D5EN9WQFHzBTNpkL
 gLD1Zq6xPK82j4OM7sfgU/zo0bI07W2VVuQC/w2/ejy2eQT2ZvBfsbT27GqZl9uJL199PLqCAEv
 1bcuwMnq1srnywZVtTSsVAvoOAV5h/rBD/aQnrmnm2cJXdTNh8/skaZkDpy7nBawIFDQrv/6/QL
 tQzx/zYvASy2On2eVmT74F9aCpoeCr4rjsNz72HnfTrpOKuSKZ4Gv9MI09IFKYlMTz9PZXWJXWF
 A6DKqrbK6UR/EWCG4baN8nJrvRdn//FieCJnfhggmCfkuxAMGViVTMz3NpDr91A6Is5G1K33RnL
 1ES4iSyoyn1QaVt5lSA==
X-Proofpoint-ORIG-GUID: LjypVyiNoQReclUwCStD2xUQFFKHuq5T
X-Authority-Analysis: v=2.4 cv=MZJcfZ/f c=1 sm=1 tr=0 ts=6a424391 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=akXh_AD3SVDOJReeMSQA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: LjypVyiNoQReclUwCStD2xUQFFKHuq5T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290081

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

