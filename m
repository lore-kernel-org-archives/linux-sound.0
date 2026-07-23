Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082EF45D5ED
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 11:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784805064; cv=none; b=rnEOoOL+YmPQdEs/Xop1k+2vHM5RBV88SI+VSFhQOoWSua4OHqpl7ZxvqJwct3qJRhQdWd2kWH16Q22V/IaTxa8UMwmUUyP/9UvkZrbSx53GPvxUzCWsgJOWhf86GS3KBo3HNqs6zDqnXsyK3kwTrisR47rEIJLKwfuiLbSwAwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784805064; c=relaxed/simple;
	bh=7N9zuuD+31Nj6KRIPVdXvkaRC6VlFeTBZCFuP4lEjtw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EhlnjDUxebRqBoBELl1jZqzzV/UisZUHXBR3OpvyNns3QQrSKqRRxO0mAT/VflJEdq61hdpwbItBM1c8cVFzAyWlw6pS66s1BEVecv0CaitdNT1SDMeF3Bh1qf2CIXBlZhPWh7i13QlrnV2p4l9zCxgsJ7YGAurzNbtjIay5tEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CbIPrqVh; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CbIPrqVh"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ccf2360620so4670275ad.3
        for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 04:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784805056; x=1785409856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OnMHtcI+qpC3YzUAbOGiPJG/5dyoFkJTHwb+5r+sq3Q=;
        b=CbIPrqVhOX6/7vEeRTG/WY9OwDDGK3bWEJMrvMIrpqfdxiKReCWqsbG24Kj75EoOw4
         huJI9iJ7QfNp8syla8aWhotd1D5aIFLbChSYy8KvCB+7zjLCEeJRryKtUNoReQcBawzy
         b2RjWKpprJTvLaQS0MzPNss7xl9h90vzurNadFuOs74E+Fi1gAWJmW8YzOo86+M5bBLM
         /4zV9arpMTO8YyuOOlCKZFNxQIz47rMZFEd25Xy00kkbqMl2BXuKYJYF5iSGe4JlmLuz
         KR3ancHz3Uym3jPgvsVwVwGcfQEfRrbyRVkj28nHXB9Abkp822LGulXcHg3GRPIrVORR
         aH+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784805056; x=1785409856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OnMHtcI+qpC3YzUAbOGiPJG/5dyoFkJTHwb+5r+sq3Q=;
        b=JaBc2prpCujkacf0eMV9GoxeHnQWyI75qhSbohtHK770aWMEiwutJz0fPCSyyDleDt
         K/EkQKJc+c+CBF0BJrkBDFwPN7Zi7EAGBi5uMkbwO1EucJ6+4yIqQQebGLLQPcfYSggC
         CLFk8YVg7agAjYhyz8pkk4E9+EUWpOyS+6pw9Yqgxbw9DLNSLgofwE9ycw/wiNTlEFcg
         kGd9tbFFRm9ZFQooGHXv6U/5FyTgGzsnm0IiFgwZLwFzqStm9O7FfIXyIAV78lZTCAHx
         ri5t7Bquft0tGUXruoM1zPc1emVL3z0gt3XYRDAqEaqDxixc10ptVa47n0GClwB3DYl2
         JfkA==
X-Forwarded-Encrypted: i=1; AHgh+RrlThZCKXeutLWGx7y/hRMxlCrijrZHBV/OUCgSlDiKv5pYCpDs4JOTAXxx0gBrGgwC06ja1HB4zr14Xg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXSE4Z4V7PzQDh0HlVOF3hGbOivGCsN7ne8Bfu2J8lXfo0DUN2
	JYPK83OKgRufY2hE/QbOtCF1DSAmKzmsS8JMi8qXR2EwxhRAIZLaz2p1
X-Gm-Gg: AR+sD12hJbG3FpB0K6+64L7vaTijnb0pbazJH4VyA6IVWxxvS1WlPA4WyxwvzAAFpzT
	ivGo2el5KrOO9XewtolNY8na6tdK055lYxeXgaVrfmEAjFF+9HbAUEaLAiDsuwJ5RLgXq9ko/es
	WLc3sbUKQyYVIFHjHkOTdjxFA3eqfD81Ee9ZMmUugSKvH2OGUEUTxTM1OeFx2UiYg/d7c9DDizA
	YnL3ZuYIBdEGKgGfzMHlz6x1QGGDKzl9sWme1z5txvoGNrxrROq/YpsdGPNewP//agWCCbyHSwN
	+Q/SV7CeBUWzTddQb0gTUCu9TbNCs2hzKBtG0b0p6gmm2RZxvAE+EQxkjdcQzVWUoyncetQHQ/D
	3UfmLJTimFwSxUVdzMNbbRF5cIBD9shZOaG2En6sMXbJ3BeDJMaVQ4uj4ZLiLJNX205VxmFZkCv
	auG8JhBrhq16523OoqMtpbGUf2mHKT4o9XF5Z4
X-Received: by 2002:a17:902:d4d2:b0:2ca:f21a:a6c5 with SMTP id d9443c01a7336-2cfa6a546bcmr31664385ad.1.1784805056158;
        Thu, 23 Jul 2026 04:10:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f38a893sm31500805ad.77.2026.07.23.04.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 04:10:55 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Hal Feng <hal.feng@starfivetech.com>,
	Xingyu Wu <xingyu.wu@starfivetech.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Walker Chen <walker.chen@starfivetech.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 4/4] ASoC: starfive: jh7110_tdm: Drop redundant error messages
Date: Thu, 23 Jul 2026 18:10:14 +0700
Message-ID: <20260723111014.54071-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723111014.54071-1-phucduc.bui@gmail.com>
References: <20260723111014.54071-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The called functions already log failures where appropriate. Return the
original error directly and avoid duplicate error messages.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/starfive/jh7110_tdm.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/sound/soc/starfive/jh7110_tdm.c b/sound/soc/starfive/jh7110_tdm.c
index 5365ebe44471..f7522bfbe8e6 100644
--- a/sound/soc/starfive/jh7110_tdm.c
+++ b/sound/soc/starfive/jh7110_tdm.c
@@ -559,10 +559,8 @@ static int jh7110_tdm_clk_reset_get(struct platform_device *pdev,
 	tdm->clks[5].id = "tdm";
 
 	ret = devm_clk_bulk_get(&pdev->dev, ARRAY_SIZE(tdm->clks), tdm->clks);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to get tdm clocks\n");
+	if (ret)
 		return ret;
-	}
 
 	tdm->resets = devm_reset_control_array_get_exclusive(&pdev->dev);
 	if (IS_ERR(tdm->resets)) {
@@ -589,28 +587,22 @@ static int jh7110_tdm_probe(struct platform_device *pdev)
 	tdm->dev = &pdev->dev;
 
 	ret = jh7110_tdm_clk_reset_get(pdev, tdm);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to enable audio-tdm clock\n");
+	if (ret)
 		return ret;
-	}
 
 	jh7110_tdm_init_params(tdm);
 
 	dev_set_drvdata(&pdev->dev, tdm);
 	ret = devm_snd_soc_register_component(&pdev->dev, &jh7110_tdm_component,
 					      &jh7110_tdm_dai, 1);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to register dai\n");
+	if (ret)
 		return ret;
-	}
 
 	ret = devm_snd_dmaengine_pcm_register(&pdev->dev,
 					      &jh7110_dmaengine_pcm_config,
 					      SND_DMAENGINE_PCM_FLAG_COMPAT);
-	if (ret) {
-		dev_err(&pdev->dev, "Could not register pcm: %d\n", ret);
+	if (ret)
 		return ret;
-	}
 
 	pm_runtime_enable(&pdev->dev);
 	if (!pm_runtime_enabled(&pdev->dev)) {
-- 
2.43.0

