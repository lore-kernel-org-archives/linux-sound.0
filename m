Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FA24657EA
	for <linux-sound@vger.kernel.org>; Sun, 11 Oct 2026 22:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791757366; cv=none; b=X8UJkHhT6a5E4/y43kjqombsaZ1GwiiltT23H/BRP44HDMlktReqegX4s/v6tUzcXrQVALiY1u3rNKV/bOuUMrRv3+Z5N5VnpPiaVQ2ldBRO17CD46LZxFrFSI3bTuQBt9HzlHSPFrNBY1ZWGyBaN2u9uI3KAr8icACIlXsAG2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791757366; c=relaxed/simple;
	bh=2z7Ne1N0TCb32T0wKx020d2mr/EzWeKriUz7pyhBCsw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gmQT3aK+pT/TQdm1dGQsxAuQ7yV8Ztw1agsLfunzbjjIRSDOF/dyrfUriP6OG3EX/AmWqj5vsy/hJmQ5diL9BJDydVboha86l3vg/lG+1mxmeIL80mXi60hD2wSdLPTb7B0Z2GZJ0bkrLIsTJ86fqE/aJS/oXfc8RxZb2ZDsjqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sh6lgc+D; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sh6lgc+D"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5350cc60b51so19141321cf.1
        for <linux-sound@vger.kernel.org>; Sun, 11 Oct 2026 15:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791757363; x=1792362163; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UKkUPTCtltFdZ9C+7fT/K+z9vZg2YGtaLvZ8HrFAoZs=;
        b=sh6lgc+DBjz/BxRAkLwogM4/xvy+Zv4UrNPWZ1Q2fPsck8UA5zdgnv6dwcduQ5txud
         bad+ejSmDfsCp+GfgdWSFqGmEHW7u71x5TGLYdeaTLW/Wyw9HJlMDTgCcnJGo/NHUhpb
         rWWsAb/d0Jlhhwj/+1RKTM8bXC0T4ZkJOZLHXmHQwoFbor6keujskgyihNQmuxwHtAuq
         dfWnnczSalclr9apRm5AL5Dc67MnI5QLIjaN3sLlHo5qWFVHcdZb1qEzO0ccki8qJPhk
         xYF8T/bbau2AkG7A6q0kBfeYEcxfWLchPy1kcuSKruc4FCn5XWfPgx5D1cBfQ54R4co7
         XY3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791757363; x=1792362163;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UKkUPTCtltFdZ9C+7fT/K+z9vZg2YGtaLvZ8HrFAoZs=;
        b=xvqCbdWHHq4nZyTNM4MMFcxVajvY6YGXYM1qhHhxqqKgSiy7sR3bT0o2t96tHUnePA
         TE3Gq1K1DyGbvF8f+9+khrwWx5737Ug9xB29hQMW9vOH8CPaAABhp3olbcF2yp1CJOgp
         u2SlUOGBFScsCWE6ry7i1oi+b3YHMF0hf3FEXoeN2nyoRALz721JoPNkZx4WHPMINv7t
         g5Lcplg2kXlxbbL40W9DrCAUJF3VTP+rEfcuk8QXVRHYUHYMKpAZug6OHzeHfzt/UrXT
         LAzGBDlTR2KrmVFAvXr96yLJ/wByRdRNcm6SSg3pRD/g43D53TLIi6YBsU8szFgxkJyy
         r6HQ==
X-Gm-Message-State: AFq9FYIYj+0eq+Hih3vnKBTa/6FErmojQDYqC6VEMZ+HoSgYYBAAFjfF
	JT0qx0xCSiwm8G71m4Zi4jbwm70+5w/OF7l9mJNr8sw/qavEZ8a59zA=
X-Gm-Gg: AYBFou203Owz0s/ABapzmQ398D2DyqbECh7lskkqLtpQFjCqeeCB4CyqTLvVWflCHFD
	5FbZWwJz8xSdUmD6sc4+t35pu7h64zFrC83Nj3nF+rKusRJbJUo3RbvRrP38MiELIp7wu5FuKkG
	vBdWP9qYul72N2AGSL4U7zcRSJajN9GUjLjrqUVmTwnsrq1jXs6jtBZvseFp32fL4Ou7OkOmH4u
	qc2A+DLivcnKyaQTKede78zPuPj6M+2AYJNi2yLuPjoC2/FTfmMcXNQ1fCxNaTY6apgk3kPdTSP
	FsGJ3tKFXgIK2xWRdmziGgu9g1a4jCJkzbFfsA6q5/Bk4SGiChKelRizNi5/RIFCtbVbpQ3/mlm
	UPDtgrn4EJkLsbAZ7a/ntBAKoD/zPNRi+BQbmTnwwTxh0XvQuNODuFnEAH8elx76gKB8cP/Zr+x
	z8BbiJ9xMNOglJCS2zIbQ9XkXqr1eMsjesRAH06/Uo6IDf/hfxxKhi8rWMk/AjL2OshoXAZ0sqX
	+EsspSUrB+FOs9Tt+yt4Sv2ippV+sCefOTLjTiJtbqstomtNvC19fptSliKri2u6y52IWuSDqaD
	piDd2AK+ZozUvihuSs0OvdVwky0Z
X-Received: by 2002:a05:622a:4d07:b0:535:8518:a4ae with SMTP id d75a77b69052e-5359fdfce6amr134688601cf.61.1791757363408;
        Sun, 11 Oct 2026 15:22:43 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b7ecccdsm66288831cf.30.2026.10.11.15.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 15:22:41 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH 1/3] ASoC: mediatek: mt8186: Keep the AFE IRQ within its resource lifetime
Date: Sun, 11 Oct 2026 18:22:32 -0400
Message-ID: <20261011222234.2098904-2-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261011222234.2098904-1-mhun512@gmail.com>
References: <20261011222234.2098904-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The AFE IRQ handler uses afe->regmap, but its managed IRQ is requested
before the regmap is initialized. Apart from allowing an early interrupt
to use an uninitialized regmap, the reverse devres order releases the
regmap before the IRQ on probe failure and removal.

Request the IRQ after the regmap and the handler's other inputs have been
initialized. Release and synchronize it explicitly on removal before the
managed ASoC components start tearing down their state. Balance the IRQ
wake setting on removal and on the remaining probe error paths, and keep
the existing runtime PM error cleanup for a failed IRQ request. Save the
IRQ number in the private state for final cleanup.

This issue was found by static analysis.

Fixes: 097e874ad3fc ("ASoC: mediatek: mt8186: add platform driver")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Compile-tested with Clang 22.1.2, W=1 (arm64).

 sound/soc/mediatek/mt8186/mt8186-afe-common.h |  1 +
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c    | 44 ++++++++++++++-----
 2 files changed, 33 insertions(+), 12 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-common.h b/sound/soc/mediatek/mt8186/mt8186-afe-common.h
index d59258520995..d03e59ca7d65 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-common.h
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-common.h
@@ -139,6 +139,7 @@ struct mtk_base_irq_data;
 struct clk;
 
 struct mt8186_afe_private {
+	int irq_id;
 	struct clk **clk;
 	struct clk_lookup **lookup;
 	struct regmap *topckgen;
diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
index 44a521c3a610..ea61fa5fe372 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
@@ -2884,16 +2884,7 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 	if (irq_id <= 0)
 		return dev_err_probe(dev, irq_id < 0 ? irq_id : -ENXIO,
 				     "no irq found");
-
-	ret = devm_request_irq(dev, irq_id, mt8186_afe_irq_handler,
-			       IRQF_TRIGGER_NONE,
-			       "Afe_ISR_Handle", (void *)afe);
-	if (ret)
-		return dev_err_probe(dev, ret, "could not request_irq for Afe_ISR_Handle\n");
-
-	ret = enable_irq_wake(irq_id);
-	if (ret < 0)
-		return dev_err_probe(dev, ret, "enable_irq_wake %d\n", irq_id);
+	afe_priv->irq_id = irq_id;
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
@@ -2946,6 +2937,20 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 	afe->runtime_resume = mt8186_afe_runtime_resume;
 	afe->runtime_suspend = mt8186_afe_runtime_suspend;
 
+	ret = devm_request_irq(dev, irq_id, mt8186_afe_irq_handler,
+			       IRQF_TRIGGER_NONE,
+			       "Afe_ISR_Handle", afe);
+	if (ret) {
+		dev_err_probe(dev, ret, "could not request_irq for Afe_ISR_Handle\n");
+		goto err_pm_disable;
+	}
+
+	ret = enable_irq_wake(irq_id);
+	if (ret < 0) {
+		dev_err_probe(dev, ret, "enable_irq_wake %d\n", irq_id);
+		goto err_free_irq;
+	}
+
 	/* register platform */
 	dev_dbg(dev, "%s(), devm_snd_soc_register_component\n", __func__);
 
@@ -2955,14 +2960,14 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 					      afe->num_dai_drivers);
 	if (ret) {
 		dev_err(dev, "err_dai_component\n");
-		goto err_pm_disable;
+		goto err_disable_irq_wake;
 	}
 
 	ret = pm_runtime_put_sync(dev);
 	if (ret) {
 		pm_runtime_get_noresume(dev);
 		dev_err(dev, "failed to suspend device: %d\n", ret);
-		goto err_pm_disable;
+		goto err_disable_irq_wake;
 	}
 	afe_priv->pm_runtime_bypass_reg_ctl = false;
 
@@ -2971,6 +2976,10 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	return 0;
 
+err_disable_irq_wake:
+	disable_irq_wake(irq_id);
+err_free_irq:
+	devm_free_irq(dev, irq_id, afe);
 err_pm_disable:
 	pm_runtime_put_noidle(dev);
 	pm_runtime_set_suspended(dev);
@@ -2978,6 +2987,16 @@ err_pm_disable:
 	return ret;
 }
 
+static void mt8186_afe_pcm_dev_remove(struct platform_device *pdev)
+{
+	struct mtk_base_afe *afe = platform_get_drvdata(pdev);
+	struct mt8186_afe_private *afe_priv = afe->platform_priv;
+	int irq_id = afe_priv->irq_id;
+
+	disable_irq_wake(irq_id);
+	devm_free_irq(&pdev->dev, irq_id, afe);
+}
+
 static const struct of_device_id mt8186_afe_pcm_dt_match[] = {
 	{ .compatible = "mediatek,mt8186-sound", },
 	{},
@@ -2996,6 +3015,7 @@ static struct platform_driver mt8186_afe_pcm_driver = {
 		   .pm = pm_ptr(&mt8186_afe_pm_ops),
 	},
 	.probe = mt8186_afe_pcm_dev_probe,
+	.remove = mt8186_afe_pcm_dev_remove,
 };
 
 module_platform_driver(mt8186_afe_pcm_driver);
