Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889363BFAF0
	for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 07:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784533286; cv=none; b=JUwEt5qqWEMeoht+M9PEslR+YV5YhN5bAxa39YkvJLfoz9PsB9prIk8MTastOWX0cAAOLObpHfCPb8qm9zrMZsin0TfuRW9VB0WcPi/lE7lnQpMz4Dw2SW9cy1easFIxsEV5QXizWQbTBDnyPMgYs14dw8/R+E5GKRUqd8/NM7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784533286; c=relaxed/simple;
	bh=+vs1BDGdDM58TuXDdX1LP1xFHTn/ZKSHj4D+LcB/aA8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L449Qmu0yE9z4LVTWYn9uiJZAphSo96f9HqhiAMzRO1gTB16V0/G6RxhbOx5sOCPQrVMLtHHApwk6Js6IJDl0P0iz6Z8/fJY+BN/J+zHArjvCDpTS2qsR9YrIu0pE6ImPH2n4/wrIesX+QqtO4LXB5OpEIh1ZMwuIgIj4Kkl2Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KgR2kzfL; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KgR2kzfL"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so5018418a91.0
        for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 00:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784533285; x=1785138085; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BxfhfVFXLPGi+jPTouqRSV9wQYObASU5W++hCoymJqs=;
        b=KgR2kzfLfeZ9PtV3tlECR58RnnfufgIw+jVxlaOomeXc5T8gmWtNPGu16R1yta1gah
         qP4+OUm6CWnNyEX/q0qYekkBcc8TCFunQVuHMMsh81mP/xgeI3J0l+E6AFFnzxfl1Qly
         GKNLSGCO+9MJ8vAFoRmPXSQS3Jz4gp991Sqlj2KF4yI4HC2oEOQINWKjEFANxum6+iBE
         PaJj0KawcIm12bcybAL8xPU4G19m+7yrRpvNFRrP10ur2geeUlSh3KoL5cox2vINP6rc
         AnqAr4jAcTy2/cnX/d5IMj14ZkjCKMl3KlzerwFOX4jpBAchC5/12W301Q1X7CvvBraT
         D+7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784533285; x=1785138085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BxfhfVFXLPGi+jPTouqRSV9wQYObASU5W++hCoymJqs=;
        b=apm67tHYanS6w0bMdlOmHbgOtfB1BvZUXmdROPWKegf8kr+pTR2I7jGP51bfmFmJmE
         Co+gl/EEJDRk14SDNeqYKnQY1j668r2UCzDIiL7sd8KLu6fiVDYNwuxiIFKR8ORpidgD
         oVqNMvIOeMlTmHZY0AMU/VPHICc+OjoYFGsnsVOHeGuYqxHZRTXMOAK0wCifZ1Dt/B0E
         obgh7stlW8+Vf8RmzB2VNKo+c9ReKA23x0mbuENJeidl5axX4cn7gFNpThAEmPvB1rvX
         QSiGN3t90mMhZZ/GbFt8O0W03NLCO4+c2PLm73dEDYZBRPOlNucUWIHRquKQBhTFDlNQ
         0IYg==
X-Forwarded-Encrypted: i=1; AHgh+RoqJrNE2dpKIjQbZNynrrEjqXNrNB4g2ATwx1ontS5gVCs8nnTM+8vLjoYLcqdEbzQ38GwUBUPXAd69Zw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/NomDlrkWVCwaeoZ2dTKRyA9h6VgSYJTgMto+YdJjuCKBrQHV
	kvf7QF6jCEP7s02rmbm/TzpJ/cf48nmgufaVEI+W0dqnUI3CawiPLPlO
X-Gm-Gg: AfdE7cknv/BvUVueNiSvIF/dHFKO5pY+DYmFwuQTLxvcNzo0nGC0bXDdG6EoZwLRN7y
	ZQfcK84WoQmYxg7Fp+LYcbolpPJIO/1/sAjcbaphVuiXW6UC4drY7s8KWWw7xedppOSKpKozQBE
	Q0p6evx565vrtMFc56CzCKUO8RQjUyo9deR4Gpg9gyW1ulM1ju6hdkmM6pKXADiYF2+eqUiL+r7
	zLZlXYaNjMm3xtubfj1LLVThri/33UrL+7s4z//NQMiIWxuDGQO26ooagYyldum4xQBRYDv+o8s
	QLhLR3mjCNPcwjCC2D4MbDGUZjs9utxASg8zZXiaAkMTzUXh7+QHDGDxwufAcMgd5r8oTTIIqq8
	9xQt12DTdm1RNOQsJ5gBcv6+i6u4fMZ3neIIpWOcmJIa7YASaUllr9E/6pGu0ubXfZOolDEp/uR
	T/NXGFhevxiWi1a/cVpQ4ljFELROttAQGzRD5V
X-Received: by 2002:a17:90b:57ee:b0:383:f52b:d616 with SMTP id 98e67ed59e1d1-38e4b40292cmr13847602a91.10.1784533285047;
        Mon, 20 Jul 2026 00:41:25 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e60cc2ad5sm470171a91.4.2026.07.20.00.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 00:41:24 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 4/4] ASoC: stm: stm32_spdifrx: Drop redundant error messages
Date: Mon, 20 Jul 2026 14:40:43 +0700
Message-ID: <20260720074044.87528-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720074044.87528-1-phucduc.bui@gmail.com>
References: <20260720074044.87528-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Both devm_request_irq() and snd_dmaengine_pcm_register() already log
failures internally. Drop the redundant error messages and return the
original errors directly.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/stm/stm32_spdifrx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/stm/stm32_spdifrx.c b/sound/soc/stm/stm32_spdifrx.c
index 2f83ca989e68..e0fef47a227e 100644
--- a/sound/soc/stm/stm32_spdifrx.c
+++ b/sound/soc/stm/stm32_spdifrx.c
@@ -970,10 +970,8 @@ static int stm32_spdifrx_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(&pdev->dev, spdifrx->irq, stm32_spdifrx_isr, 0,
 			       dev_name(&pdev->dev), spdifrx);
-	if (ret) {
-		dev_err(&pdev->dev, "IRQ request returned %d\n", ret);
+	if (ret)
 		return ret;
-	}
 
 	rst = devm_reset_control_get_optional_exclusive(&pdev->dev, NULL);
 	if (IS_ERR(rst))
@@ -987,7 +985,7 @@ static int stm32_spdifrx_probe(struct platform_device *pdev)
 	pcm_config = &stm32_spdifrx_pcm_config;
 	ret = snd_dmaengine_pcm_register(&pdev->dev, pcm_config, 0);
 	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "PCM DMA register error\n");
+		return ret;
 
 	ret = snd_soc_register_component(&pdev->dev,
 					 &stm32_spdifrx_component,
-- 
2.43.0

