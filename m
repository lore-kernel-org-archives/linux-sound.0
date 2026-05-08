Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFD3225417
	for <linux-sound@vger.kernel.org>; Fri,  8 May 2026 11:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778240128; cv=none; b=VNrgbyodvAN8sxaFLHJ3MFbPFV8rp5mgognx41JjTIeDJr1izL31TwSTkPi4zajouyMtCaIYBZ9M/r1K2Tfx/RDQ33MoBYCpOr3LpOdtyujXAyddJJS+GDrtsKaNHbWskvlwflTMOJMYOlAhU/9YBJAfOw3mt+jp5lvkBkbV/Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778240128; c=relaxed/simple;
	bh=6Bao6ldnZVFtz4MObX4+zB0URlU9DNOPyzrPJEwQEqE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y2TqPlrQqqTWY6f7ShSo8fDMaq/SOm0UtUy4ceT+GqMBm9IGyLlrnSkApXSya9tdkGW97KLx7CV+ZwQYCygO4OsEEdBr/+BFPQKpx1zPSYxeQaBpmHFZpr1DmwtXIoA3tke9JhvxlnuZe7vDiedddtREhr9VpxrscPh3lQbbEeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ol6nyoSh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T/eVktqW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ol6nyoSh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T/eVktqW"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6487vVSp2384409
	for <linux-sound@vger.kernel.org>; Fri, 8 May 2026 11:35:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=amVdIFBe8i4
	qduqKVQlXrpoHfnV9p6Zr6XtF24FGwho=; b=Ol6nyoShJcY6I8x9CIbSwlZFOUj
	jwNTZFwW0/0AQu69P8fXZGvLit7rIKbD9OeQx5JwaBz+7lQdbu8Zqt68lziTgBsb
	gROAN9qz4peIPXyuxu8kke5zO/BoUpq9zF8Ret62biZm6DvfbeJa+9fVrSU8Abgo
	7G514MKFHr9KZbvpbkDAN3sXNvt/1sHlQM/rJMPkkgM/LrfIOVtxS5MCMwRRt0EI
	PO33L3BmTTp5WqbGoYlCCvdH3yMd7glG4i9+RFSE1isoW+pR1YDEHit6fK0Zpnhi
	CEuP5uNFI5L7bqHiCs0hm3SAChP5y84u53yLNGPbnSkTiSkTmBy5t5gQKdw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0wwukvp7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 08 May 2026 11:35:25 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b9fe2d6793so37176175ad.0
        for <linux-sound@vger.kernel.org>; Fri, 08 May 2026 04:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778240125; x=1778844925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=amVdIFBe8i4qduqKVQlXrpoHfnV9p6Zr6XtF24FGwho=;
        b=T/eVktqWQ+pspTpTrH4210SejTZ4sFZL5sVYe5q/m238nK8sGPTDS3hR1OxXi1JKXU
         4aFlaWCur/Ck4SjtQEAt+ceWVR0hRC2zGAOW3wLoN01cjLwFZ/eLmLPx0CKecBDVn6iR
         rBKVJf9SONHpVus8vXgkjlAcyow42UhMSdbhTP3Tgtv0W3A29CGdDRPm61EEpsmjrTx6
         FLYBtZlFBIqAvZyF8gmRNftajd3SHmY+3Xo0eYOm6xVXT0GtlO9UQhMWqwZJzxTfdZ1L
         8th2JVoOrCw+zcIkoIrSPbFx9N9KSBiF5bhs/OpEaG+EhLLE+4yajCMcwXfJtloOsVpN
         O6Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778240125; x=1778844925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=amVdIFBe8i4qduqKVQlXrpoHfnV9p6Zr6XtF24FGwho=;
        b=D3qG725wHddl2JqUW+RPtrhr5PnmTPAAFS23V5aT82tnWezovXcTlU/ReMH5Bzg9rJ
         3z7U/kNuXO1G+quvlUFkRooZRGe/V9uMwadJfOrMVyRTH6OQPQ3HD4+oL39Nrlu946Z0
         0neLNba66but22HeSPFsRbLQKZ8C38Fkgm24S+tqtd5JAgb3FyIGgYzShp/lJGKPBF4w
         3TC3L6soVNkoWveosbtR3BEmPxhzA+NXVQLhB1G6woI9Er/etezItEMrScAWQYkCAic9
         XfO+oXuxbO0d09MY/1RTH/jVvt1F7tLpyyUF368RHGRKKPX4VJWAYIayldmted50PNhG
         IDVA==
X-Forwarded-Encrypted: i=1; AFNElJ/aWl61ar+TK2FKiBiqb5JH+0TspA8pa9hyAZDExf1A8X8O6fmxSkeM/5PKrIpHWffsGORoSIMhGI/j9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDxGokK1h1a1Ej9vpTvpeqea5ZT/N3HOTzNlhXl/8j4y4viDOl
	woHcR3SfajB66boOaXwA0bbJOVH5XXQJZ0kNj6XMzqkUc2uU4pgRm9GvAtCyFov+aJbKgqJ4p+j
	RK9DT1jnaRgC0bVdTdGsm6mX81oTTQ8hZKP2XhOUuapOq+4rzeJ7Km3+NHCJf5Venwg==
X-Gm-Gg: Acq92OEPWHugwWCI95GxZRZRhd8Upjefmt1UblC/esc6+i2b+U4y77usG7USUWRNXII
	pRaT8FNauGAJE5QP94eOs2npXU/Qe6QmyDv5GQaIbdv9sUpHCsY5yYUJX2CVREQcY3ytbb0AasA
	r9itLyFzdxdDr5BUCqNXCAvTrCbw5dgeAEeIcpfo/x3kRdfTURCr129HCYCnoxKBctuSxys4ida
	nr4xqzqclzRpWkFPYlP1a0tx6GhmFPDSw2aASHVXGD/axkcS1uv6bzl5obwo6at6ZM2S3Q1F/jF
	Of3r/7k+a+c13NmLV4NF70VTc/O7lkq7IWCvKS7TeEqM3tLDCrcY3HkyD9N7wvA//+tN6nfRHbI
	mI3Uc0PLhbh0eXELolcSc7NYOtglaY8K6tBOIq/UIj7dgoxzx6Q==
X-Received: by 2002:a17:903:13c8:b0:2b9:8d39:5e87 with SMTP id d9443c01a7336-2ba78f4589bmr125182025ad.10.1778240124784;
        Fri, 08 May 2026 04:35:24 -0700 (PDT)
X-Received: by 2002:a17:903:13c8:b0:2b9:8d39:5e87 with SMTP id d9443c01a7336-2ba78f4589bmr125181725ad.10.1778240124273;
        Fri, 08 May 2026 04:35:24 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d52f27sm26616005ad.36.2026.05.08.04.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:35:24 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org
Subject: [PATCH v3 2/3] ASoC: codecs: lpass-va-macro: Switch to PM clock framework for runtime PM
Date: Fri,  8 May 2026 17:05:02 +0530
Message-Id: <20260508113503.3550647-3-ajay.nandam@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: LbIbsYjyQpZROYrWsXVqkRLjZI4BH8Do
X-Authority-Analysis: v=2.4 cv=Nd/WEWD4 c=1 sm=1 tr=0 ts=69fdca7d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=YBVk55sqNhi4ukaP828A:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDExOSBTYWx0ZWRfX0WiZwWeN02/A
 rSuKRx7VsBLoP0flz2KnTcSxOdk68NnJKzcR3bOlAGSMCkz9dw6PPSE08uprveAkRdfwZJod9r+
 fpC+Q7oVDl7Pi/3dHA1UiVzxFWkdz9GihfD4nO4dKgTs0vB+Lue/Da1RiHS9EyDvVdMeHBLZ9F7
 5pl8+ZiKwerbqfbjvtMo+kXPcJ4ki5n7IQH8TKQl99Q0pGnVOsKGV0ep2Ax/Tw1kKUDs4wpBQ9C
 /L73o/nxnKGA2ertTlk3rroq5LQ7Q+yDCrJWzP46/t92Rjix664IEeLRSFnvznRoJTUwj2F0ygm
 1k3JeVPXqq7LvsVOEIHtp2G0yuZ3lC79F2jbmTFBJ6tQOM2cabVxlxnXGmSwVFReRyRdkaiT57e
 C7NbFblLkvrEjdggUQX3A+1eqecO2vzjEiZmRzpIFfISk30QOkR65f5vLTUtR+ATD6o8eVp/k/6
 Ve3ztoCVH/0iXV5HvZw==
X-Proofpoint-GUID: LbIbsYjyQpZROYrWsXVqkRLjZI4BH8Do
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080119

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
 sound/soc/codecs/lpass-va-macro.c | 121 ++++++++++++++----------------
 1 file changed, 57 insertions(+), 64 deletions(-)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index 528d5b167ecf..44dc7f91bd40 100644
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
+		/* pm_runtime_resume_and_get() already dropped usage count */
+		return ret;
 	}
 
 	ret = va_macro_mclk_enable(va, true);
+	if (ret) {
+		pm_runtime_put_sync_suspend(va->dev);
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
+	ret = va_macro_setup_pm_clocks(dev);
 	if (ret)
 		goto err;
 
-	ret = clk_prepare_enable(va->dcodec);
-	if (ret)
-		goto err_dcodec;
-
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
+	pm_runtime_put_sync_suspend(dev);
+err_rpm_disable:
+	pm_runtime_disable(dev);
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

