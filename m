Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4713E3142
	for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 08:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779092283; cv=none; b=L+zVrgT64OhM+0Uw7/xjjCgbnqyp3Wjy7VoxCnzgMln7MGfp38vKqEyiGwTzvjvjcphUTi2KI0HFC5OGJKfhKj2cAd4VhFCBTqGxRySEUmpNmyP+tqc6/nBlLlXhCCpRdMZPl7Ih4PmLeFeSyJJjsHx62SzMnFK13XZLOvYFrQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779092283; c=relaxed/simple;
	bh=tfty37G3kS3XZdzuIXgzP0j81pOPlMYbCUFjUi8suLk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IjlRVcpVrY/IS4cUmzELW/BjTUQIwfeBPbhtlSosU1HoS+518f7vNdSp+iJXUi3w9Y2QaQtLGW3e25nOB4+u07TVB1vX9GQGJNXP0/PeH7tmKPBmbrM5kfwLT6aO+xla7FIhvnQR1cxOqBtFq6BVFkG+FrMt/BIi8wrAB0kI0pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=okWsT5sC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CG72DRgo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="okWsT5sC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CG72DRgo"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I7dqjx2891865
	for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 08:17:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/b148M+Rew5
	DR1NQMjhg5HZ9UktJcPXNPN3d+hPUBbk=; b=okWsT5sCOJvV5oOLOTa8t7WTw74
	0FmGkP7iysWoNTDogkrNcs8sOCL4Wh1OuGIdARHQduB+9rwHi/Brp9absEi6gfGl
	iMi54WGSy0tfrWTHOCkmf26YNycdlVjTWP9eS0twOaXan6PddLLPbHNkShKqnIsU
	X9F9fjf2pV0nV1xytw6A1tuWOrfjZrRRUdwgok+pIZ/n1Xy9H2oNlLlaSIbpyMNt
	x9vPVHlYH9Xm8t9uyU2wN5K4TAslVWVWrBFrbs0fHcM6e26DVXr07wbSLlHXsJmx
	qrH5Ykz0gmUhE1PIpPyir1rOgKqT1wANFAykz+YzRVXiMcDI13PYVJHW48Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e7xk185ff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 08:17:58 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bc7f9b2213so15400785ad.0
        for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 01:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779092278; x=1779697078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/b148M+Rew5DR1NQMjhg5HZ9UktJcPXNPN3d+hPUBbk=;
        b=CG72DRgo6oqh6u2STdTlMIMSjWps67ydtVZfyr5pZkNEkmSNj+Gj3z3VnBjp7vFihH
         K8UBu9peqNXMT2tlbGbfQrc4D1w6FfrgNK3pRLlFBo7cnVh9zRSPzYS3mv6BS1l3avRn
         VEw0wp1TktRerG3v+2tj6AGwj4ZOfc+w8T6Cl6Xv+ZU5uB0uIzThRw14riqI69+lXUDB
         K/RDXLqBEry5DUNMl9uEwS3XKSnfjDZP00X7ok3nVf0qREugPa3ZED1PqpGQU9qZ6q1Q
         2f/VjC1j8zz60aVw3JcK3z1JDwfUlbn4+Ogwd2/FjDlht4ZvMytwBNcELgQMDOO2tD3L
         79kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779092278; x=1779697078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/b148M+Rew5DR1NQMjhg5HZ9UktJcPXNPN3d+hPUBbk=;
        b=LTCnPBA3iXx0OFKAoNDbtp5xGGdZTDei5VZIH/pMj9jWD+0kVhcXSQcCE73H7ojYAc
         BRqF3xB+PW23PwCA5+KmIWO+3XdY+YalyVXajwfMV4lw64IEplZYVXuEdRAWZJHI4Iju
         iyx/J5XLAaxb4t5cc1PbeTHFL8BWgycc7qVUskl8S5wj9WsAjysooFddBfu1bRIatNr6
         NQ1pMoDJ9mRX3GqkYAO8VNOo1j2NzyyMrMBUfgfB+1+zWodHuQTuW7Fv3apzWhnDSrkG
         SAJEhPVlBB7R3au0kK5RIvSe/JtCecDQGvRL3Jj4oC51nYHROW3vWKK2TXbxtI1TtUeF
         jAcQ==
X-Gm-Message-State: AOJu0Yw3q8p/nmMZJc+uVCTSD2Sm/a/om3224khKlxKkOB8UO/ogzpDB
	5YMxozr3hezcoZDMojH6DHq0WP3gYiMgl5VXYSkfwcefGWrb7TKqzLz2Wv6hWJIJlX8PJFRo1rk
	gs6c+/Z0oyB8upUmpKz3yxty0RxMwyyAZxAHiwTXEPHoHK39Ic6/Un+2lkBsn2W2o4w==
X-Gm-Gg: Acq92OEkaYZmqmH94z9RJXjJqYlaCATBKuy8P7Tmdz+6/C0leEa1cNLiruQhjXMe5wk
	qms4YoGpf1qZmbTlyljUgEAfWMWjYB4+MMX1eXJQC6SqUTUpg9SCh9yBz5zwKFToLqD0CQcxzbh
	kXBrHHxQpUHJZumS5D1rToC3iwQ5DQOltQuPen0tdIhaVn6yy7Dw8LBIZn7zGSmYrymn8QVSdcX
	YHble8HSYOoXxPSKAV++cJzlTI0c1qqTLokw+O9wn/jnPH5mfG5FXZPIBg816tu5cGIlXbQQAgB
	2btnF+agNp15YoLDrGBGYtlMOTUvAZ/enUTW0cEUkEgZEhtCS2ksZ63pyVzi+qBJnpKLzP7wK2C
	T4sHE9KK85K3/EKHc9R5y3RBBxvFTjT5k2EQmfg2mIvcSZ1qk2Q==
X-Received: by 2002:a17:903:1b4c:b0:2ba:7610:3f21 with SMTP id d9443c01a7336-2bd7e802964mr147985065ad.5.1779092277962;
        Mon, 18 May 2026 01:17:57 -0700 (PDT)
X-Received: by 2002:a17:903:1b4c:b0:2ba:7610:3f21 with SMTP id d9443c01a7336-2bd7e802964mr147984715ad.5.1779092277343;
        Mon, 18 May 2026 01:17:57 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c2631basm136620755ad.34.2026.05.18.01.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 01:17:57 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH v4 1/3] ASoC: codecs: lpass-wsa-macro: Switch to PM clock framework for runtime PM
Date: Mon, 18 May 2026 13:47:36 +0530
Message-Id: <20260518081738.2453957-2-ajay.nandam@oss.qualcomm.com>
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
X-Proofpoint-GUID: -zrQFPkZhmgmvuG5irjm84yyI9DQZhQE
X-Proofpoint-ORIG-GUID: -zrQFPkZhmgmvuG5irjm84yyI9DQZhQE
X-Authority-Analysis: v=2.4 cv=BICDalQG c=1 sm=1 tr=0 ts=6a0acb36 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=6iqXw53aW0HuLngz8iAA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA3OSBTYWx0ZWRfX7ugRxmqTHuXw
 F1njJ44KQceaQfuugca7uaI2H0jUtO2LY2wwzQslJE2roWQydMpoi1doQDYH62eQnmDd4zFU91h
 9j+Kul7R1Bl5Qdd2LNadpSl3DCVivZGXGPA4rEZjYEPK1BstIu5WlteqM410jDQhVdGM0Rbn7Uz
 KYbAjSSlLBKKpG3gTz/KDgBAPnHeInKzSpSdpabCr+77PQqdKYeu83VYIK5VACUIe7luHyeBSL3
 7QdiUit+1MZP6g8vYBK/xskmPqYfpvrtN4EhSfFZzCzktitNih+Zs0Vq77q+xWM6z40JQToLlMg
 L6IxzHPpZS5uUkS3hPzZAwFM4QxdvwPxiIU9xTTYSkcHMTpzdyQNCZDwLD79ZknTZx7kVbju/G9
 aW7OXaoOc9N3YzoWnTM4XxB0AFRmI2oIw7riWA1c9PbQ8zdGs1HatcDAY1LOX3v77qZMD1WMpUf
 c3OH5as9AmSlVGKy9+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180079

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

Keep the SWR gate runtime-PM reference from SWR clock enable until
disable so autosuspend does not gate clocks while SWR is prepared.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-wsa-macro.c | 117 +++++++++++------------------
 1 file changed, 44 insertions(+), 73 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 5ad0448af649..598292fe3219 100644
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
-	if (ret)
-		goto err;
-
-	ret = clk_prepare_enable(wsa->dcodec);
+	ret = devm_pm_clk_create(dev);
 	if (ret)
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
@@ -2809,56 +2809,40 @@ static int wsa_macro_probe(struct platform_device *pdev)
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
+	pm_runtime_put_sync_suspend(dev);
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
@@ -2868,34 +2852,21 @@ static int wsa_macro_runtime_resume(struct device *dev)
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

