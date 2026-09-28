Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AA549CF28
	for <linux-sound@vger.kernel.org>; Mon, 28 Sep 2026 10:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790591575; cv=none; b=UcXbIHB+7oORO3GD7AYfpHTCqehWtp50hP8/1mcIYiHx7dTBEiVLli8rxXyXiROzlLfUnWZLIrXRVpeKvVKKKtEp3gxP5gIet4OXG561cV06d0n/ItB6YTT+Q5JT8IQY1IU66KaSVsMt45SHcXL+8KWj64Sad61zkdXf1otknu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790591575; c=relaxed/simple;
	bh=kPn6Dg0bdnYkwCA+6ezajILIS03WVEUaTY+v05K4hXg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qQ4qwtBakSKV0ngILKTyZ4Q8QAfbCAQUhpe5xgG4qG5sF5qXk6y9YO3DDCGZK6UR40NTKsRKnmAOFdZcXV/I9lKgm95ELcreJj9JlrKqN0FbZvCtcA2uf/PvYuSIgcy2Ow17qAJjkRrRQqeYNTToKA49+Z/mVHR7D0WJob0rTMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NQxAnjX5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gpGvgBro; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NQxAnjX5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gpGvgBro"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S9MJJx2168269
	for <linux-sound@vger.kernel.org>; Mon, 28 Sep 2026 10:32:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	btJXwtvrlKSFwnalBRzKZ+u43uNhdzBt0gD3LXAU9eg=; b=NQxAnjX54lWAg1vc
	UXBDSXM0R64YdEj66BuefrKeSD5GW4xWk11zf3gDdLxqccDUtIMjsOVuldvE+tGt
	sS8cyTWoUnqkcQTXp+cf2Xi6YRXZFx1BFNAph1UCiSampV0E/8lPKiMA3HegG9+h
	v6dYUvK9fNyXSRoVA15wJC7Zc94ghotpKJWlx2/5bqhycyOn61aAXL469TvF/wHy
	5aa5xT1hI6gMLjSqluw8KJTcaWqcBZPxbGi/oRHQnaWYggNwiYnnxrKNWLMmFumx
	CS9YmxK+ESZxNKiqEJO/fbB3BAMwJqrUf3PG1HU1bXfwIzIydhKTL+5wuWxcBxbY
	U3/qdw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyj6t13ft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 28 Sep 2026 10:32:51 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39de4e72b33so5617117a91.2
        for <linux-sound@vger.kernel.org>; Mon, 28 Sep 2026 03:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790591571; x=1791196371; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=btJXwtvrlKSFwnalBRzKZ+u43uNhdzBt0gD3LXAU9eg=;
        b=gpGvgBroigtWciRS2XcsPv7mSgn3FdAFMnXpUotpWdJZOr4RhG7vPKP1RF3STPzOt2
         gpUiaddwG1Cpnj9SFhZHMKF3jYOIamUOSD/4kwdhh7d8UAAiMli8l0U5jjK4apGKdfRv
         dR8eYprXQB/XJ6FpUm7eF2DtuX1gzM/BDd76l9HvdMRwn/3wwi0Zej6n63/LJTaYKPp9
         PRYBV6rZde11fXDBmTpXvh/Vn0PAFyIs5Qx/eQWg8Auq3XBbEBVHyfPnxvIcr0D0Cz/F
         GVr6Ct14uHeO0Mry8mPzX7Fy7sc2/BhTJqntQLRSUvSnd7mmKcPK7c3UKzY6f1yIByIz
         fS7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790591571; x=1791196371;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=btJXwtvrlKSFwnalBRzKZ+u43uNhdzBt0gD3LXAU9eg=;
        b=QFiKPsFJiJZ0eCbXWMAGkD5n8pyVaqP63m+4PxJgx2OuwX8bYOzCidOug15MiWIYZ9
         9Y/ev2k+kjnCUvqjgtn+PD1+hWH3jOZn4uU13wi9PLzXWMH9R90ZA2RYuYFHyXByXIZY
         zQMxBHt4u9m0oLRUjZkIqL0O/JBz9wCKxIUyxmdqZ6GL3LELUYttmXqUpcCHbRpuGDuz
         g+JzPOBYUBR8tO8uZPDIZ4PhaKdanwQQqhtuQg20t/QfqALBt22By9+cj7jYvexDAkFd
         8i29Ws8L/rUzrYRc22l2VNdJIhFXg5+95Qw8aOCLjUbXdceVCeIQe8z4A8gPMLz1f/wF
         UTLQ==
X-Gm-Message-State: AFq9FYIB0DWR4oxtjtvIzeDPJgI0VkVtLgrxbdQI52Ge0DEtSR0BOu9C
	g2Ff6w1h3mzaEpioLdpSRnvKr6RJZieAEXxRoPdipXpTT26tllQvk1nS/j1WsWJRJ7cDv/mka0q
	r1IUDNEnE9/id4nZmkb7ycn8wNRG3qcP7tmspBQKnNJ5GU3E9/Nmx4sYuqTc4dIgsoQ==
X-Gm-Gg: AYBFou08TCs/Xu+o8QJh9tQQLBfBxgCx1gyS5bIUP/TvPwMr0wkijD2V6YvMQR/gTaF
	rPxX/arcsp24L3c6+2NE80onUZDfjGkVrxONzcCELETdpFAaMB7uQowbW9e0QmDL9hH71YKYjy3
	pac3rWBpyozFZ+clpQ2znTStG4cAwxtdpE5lFAiNuFD1fqHth9GXunt9d7N/x+XViywHDh8QdwY
	JXaOOxDim2s/UoJmiN2HdSNpZxZu8XXwFxB/CvUkMWYMA0UbVxXjEkP6qJ8319mKQXNRF2kVuAQ
	gdnjdr3oWM1nED3b864hE4TJs5iaqM138wXIc3Eh69E86MhM0Nwi/g2vUYFkiwJqzvo2Af/IhA5
	QLYYhggubYPo/zV7vaprWgldmEjI=
X-Received: by 2002:a17:90b:264d:b0:3a0:3673:dbc0 with SMTP id 98e67ed59e1d1-3a0bb6325cemr7282998a91.49.1790591570954;
        Mon, 28 Sep 2026 03:32:50 -0700 (PDT)
X-Received: by 2002:a17:90b:264d:b0:3a0:3673:dbc0 with SMTP id 98e67ed59e1d1-3a0bb6325cemr7282990a91.49.1790591570467;
        Mon, 28 Sep 2026 03:32:50 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b8efaeb3sm19885131a91.2.2026.09.28.03.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 03:32:50 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 16:02:22 +0530
Subject: [PATCH 4/5] ASoC: codecs: lpass-wsa-macro: manage clocks in
 runtime PM
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-xo-sd-runtimepm-v1-final-v1-4-e3ebade3aeb7@oss.qualcomm.com>
References: <20260928-xo-sd-runtimepm-v1-final-v1-0-e3ebade3aeb7@oss.qualcomm.com>
In-Reply-To: <20260928-xo-sd-runtimepm-v1-final-v1-0-e3ebade3aeb7@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA0MSBTYWx0ZWRfX1aiRIVE2vzF6
 meBJrisNR0SnkIStQPb3kyvM6mcuUgiGPPtxBFHKkF4A2ksVtR9nE5Pw9uS+kCw7wX8rZIQ9vvC
 9OigN3by+b6YTxlcyDH5W+zS9mfo1fAHLFpdrJ8YoY43OlhDTdwsor3Z+9r8z2+YCrgL86ODMws
 8srkCuErraKNQpq0azLqsSeG2tPbNlQTZTPLHEIFtjOVmiTmmWUVfvHy6jh2+33xnilq5j/q+P6
 cwwB2H2Wq2VPTMoDXY5MEhvI/Drr35SUdVwSe3jBuwndIwja0pJIKn6/4x3m4FJoUxnsUwfod8A
 DSyY1IhO7K90SQNVWV3HatFyz0/7u1wvgLfKXPhLoVeDuKlTM5+2dng4yRT3zNDqLzhUbih//Vp
 Al3yT54uUiaK1T25u2HUNA5bzQN2jMxEjLuJCgysqrQfbfTZMMkeidKKm3ag9Pmfd8aUwCe2nNG
 L3Y1BoxUbeir9folTRg==
X-Proofpoint-ORIG-GUID: ciUfjJ5dNNIUV7TJYOhJ0CVldEH0mTLB
X-Authority-Analysis: v=2.4 cv=dZkVTnXe c=1 sm=1 tr=0 ts=6aba4253 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=0aw6pvlUo1gSDbX1wFsA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: ciUfjJ5dNNIUV7TJYOhJ0CVldEH0mTLB
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA0MSBTYWx0ZWRfXzvelpjc/KALN
 z/atKnzEYKUQUwphoBt41h1zGIYVcGBYELz4ZKxPZGNSr/XnroS9+alNif0PsGxjU8IxqfloCBx
 NRTgyOeyebQGB0R7OsXQxrJ+c4q3jsE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280041

Replace PM clock framework usage with explicit clock prepare/enable and
disable/unprepare operations from runtime PM callbacks. This keeps the WSA
macro clock prepare state tied to the runtime PM active state, so idle
suspend can release parent clock votes.

Use DEFINE_RUNTIME_DEV_PM_OPS() so system suspend forces the same runtime
suspend path for an active device.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-wsa-macro.c | 80 +++++++++++++++++++++++++-------------
 1 file changed, 53 insertions(+), 27 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 4242366601a5..bc0ff467c822 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -12,7 +12,6 @@
 #include <linux/clk-provider.h>
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
-#include <linux/pm_clock.h>
 #include <linux/pm_runtime.h>
 #include <linux/of_platform.h>
 #include <sound/tlv.h>
@@ -424,6 +423,53 @@ struct wsa_macro {
 };
 #define to_wsa_macro(_hw) container_of(_hw, struct wsa_macro, hw)
 
+static void wsa_macro_disable_clocks(struct wsa_macro *wsa)
+{
+	clk_disable_unprepare(wsa->fsgen);
+	clk_disable_unprepare(wsa->npl);
+	clk_disable_unprepare(wsa->mclk);
+	clk_disable_unprepare(wsa->dcodec);
+	clk_disable_unprepare(wsa->macro);
+}
+
+static int wsa_macro_enable_clocks(struct wsa_macro *wsa)
+{
+	int ret;
+
+	ret = clk_prepare_enable(wsa->macro);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(wsa->dcodec);
+	if (ret)
+		goto err_dcodec;
+
+	ret = clk_prepare_enable(wsa->mclk);
+	if (ret)
+		goto err_mclk;
+
+	ret = clk_prepare_enable(wsa->npl);
+	if (ret)
+		goto err_npl;
+
+	ret = clk_prepare_enable(wsa->fsgen);
+	if (ret)
+		goto err_fsgen;
+
+	return 0;
+
+err_fsgen:
+	clk_disable_unprepare(wsa->npl);
+err_npl:
+	clk_disable_unprepare(wsa->mclk);
+err_mclk:
+	clk_disable_unprepare(wsa->dcodec);
+err_dcodec:
+	clk_disable_unprepare(wsa->macro);
+
+	return ret;
+}
+
 static const struct wsa_reg_layout wsa_codec_v2_1 = {
 	.rx_intx_1_mix_inp0_sel_mask		= GENMASK(2, 0),
 	.rx_intx_1_mix_inp1_sel_mask		= GENMASK(5, 3),
@@ -2791,14 +2837,6 @@ static int wsa_macro_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = devm_pm_clk_create(dev);
-	if (ret)
-		return ret;
-
-	ret = of_pm_clk_add_clks(dev);
-	if (ret < 0)
-		return ret;
-
 	pm_runtime_set_autosuspend_delay(dev, 100);
 	pm_runtime_use_autosuspend(dev);
 	ret = devm_pm_runtime_enable(dev);
@@ -2844,16 +2882,9 @@ static int wsa_macro_probe(struct platform_device *pdev)
 static int wsa_macro_runtime_suspend(struct device *dev)
 {
 	struct wsa_macro *wsa = dev_get_drvdata(dev);
-	int ret;
 
 	regcache_cache_only(wsa->regmap, true);
-
-	ret = pm_clk_suspend(dev);
-	if (ret) {
-		regcache_cache_only(wsa->regmap, false);
-		return ret;
-	}
-
+	wsa_macro_disable_clocks(wsa);
 	regcache_mark_dirty(wsa->regmap);
 
 	return 0;
@@ -2862,9 +2893,9 @@ static int wsa_macro_runtime_suspend(struct device *dev)
 static int wsa_macro_runtime_resume(struct device *dev)
 {
 	struct wsa_macro *wsa = dev_get_drvdata(dev);
-	int ret, sret;
+	int ret;
 
-	ret = pm_clk_resume(dev);
+	ret = wsa_macro_enable_clocks(wsa);
 	if (ret) {
 		regcache_cache_only(wsa->regmap, true);
 		regcache_mark_dirty(wsa->regmap);
@@ -2876,20 +2907,15 @@ static int wsa_macro_runtime_resume(struct device *dev)
 	if (ret) {
 		regcache_cache_only(wsa->regmap, true);
 		regcache_mark_dirty(wsa->regmap);
-		sret = pm_clk_suspend(dev);
-		if (sret)
-			dev_err(dev,
-				"failed to suspend clocks after regcache sync failure: %d\n",
-				sret);
+		wsa_macro_disable_clocks(wsa);
 		return ret;
 	}
 
 	return 0;
 }
 
-static const struct dev_pm_ops wsa_macro_pm_ops = {
-	RUNTIME_PM_OPS(wsa_macro_runtime_suspend, wsa_macro_runtime_resume, NULL)
-};
+static DEFINE_RUNTIME_DEV_PM_OPS(wsa_macro_pm_ops, wsa_macro_runtime_suspend,
+				 wsa_macro_runtime_resume, NULL);
 
 static const struct of_device_id wsa_macro_dt_match[] = {
 	{

-- 
2.34.1

