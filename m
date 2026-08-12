Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05220401A01
	for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 08:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786524741; cv=none; b=kkLKBbIsu0soiMgTi+o/x1dvvXjMjpwwMBgFiljTHFPLnYheB0FtMPLPzgRuyYshb2yvgvJTYWO12VJQXckcvyNAqYfpYyHsf5+qFFi6YRbdXfaBP8w889SsXX3GyLkJVUx+J7WLMhp3KhtGIePBoSmWgmyu3lR2WD808mcdbHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786524741; c=relaxed/simple;
	bh=GOa4PCeZb3TNRPAngDxKwF15NFCECYzINypupzd8BtU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jVg/3GARxAM+29j3Tmp0OyTkP7MbLoaM1Tl7dmyZfn7N7ta4RsEouhIq76fcubSF9t2gCTqMRmUpaEbUXIARGW8Ir9kDSVJX4S213h7Ojk90HJ1eJpj/iduSh8JZOIB1bw4eqF+sszfbrMX3RgrZsJtkQu65VpzqNoEGcWORKmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ez2zOAnF; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ez2zOAnF"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so796080a91.2
        for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 01:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786524739; x=1787129539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4x5jxb12BWr160Ndtvg6XwQshT8/0VQ/I3/i+j54xi0=;
        b=ez2zOAnFdF807VXQRzcYTRMVH/P6OuTk4JPqvpptGohLUkyF2x9nZp+unc+FYWgFZy
         UotQrC3rxqvbK3D5t97dWklOE8ryRiAONcw7cabtJ+vQ06xoVN0rzZLEQ98O1289s4od
         zAe5fHDoya5/GxFuldk2BHM0OqA4VISVFSD1G4/Bg30KQXJTFXYRVHZoFZPXk+ZqjElz
         FiMp0Zh1+HnjRh0REvfYCzyGt70oRCi71K9vw3w8zRk1ZLEAWuNmWjyTAW9EmNSj0eDd
         VMB1c0PAYqDZTXzaSujS5KbVBTglC6TFC/4Bp7JLc8Jums0fzrqW9Hcv8fL0kGMxdhjk
         /i0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786524739; x=1787129539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4x5jxb12BWr160Ndtvg6XwQshT8/0VQ/I3/i+j54xi0=;
        b=kILHUti7BlUbsveCRjAHmkiLciguFYd18L3vUJAkGGJOopaOc5GFFqFJ3bJ6c7CRlC
         XDPdaHRxvZ0f5iJ8Y8mtxWe+JY23cpg3TSv6FVH8n7GlVN9dMV2o/Tk8wUrJi9OCGsdS
         XGIM+JfPa9GTV1N1FKzrxuJ7HJCNf3DO4CozXNWORZYIjSajtAZWP7yP6lXrOtUNW6XY
         b0CIdcQZp3d4gE5fja9rxgF5/eruDeRs59QbmrLSzjJjL7dr7MY8ey17PRXDrgcxmrmD
         1JM7YvrI0zSAZch4Cww7l7FYRMbkDc9kQZWv7MfaHPG6GHlePHuME6qvEGlhZzw2PNZO
         O/BQ==
X-Gm-Message-State: AOJu0Yx6hK9BJeRYOEOFJuZ8qRXNqm1PEW98gOoqJBOeiAfwl6ZiJ5gh
	9lWueFAKa0dyx9spIx/IFtNyTDHNTUOsmGY81pKljtMJFy86QnAOW6sx
X-Gm-Gg: AR+sD13Id41Ek4NyhfE4+Gy/LeDCjE3zxZ5VpUyOrvjg4gC4mMf0jVAWPR8EzQKFgOF
	y31aI2S/zYTSgS1Bj8A8GAI/cyASpBLN0rBU4cs2TDr+KwJ6ptWOh8xnCBqcn5ChToqNMzB5MsP
	1jldw3RFudsScl/v/3Rjo0/qZgXfIvQRjCNQuIFzZRTRUaebNT1gnvMS3PI4hV+WKDMeTa6Q2xD
	DllO2ZMskB7AtIlixHdd4VvzVbjvg/Uv55gO35/azpmtCXThI6EySjlTsVg1z9sJGS6mgtBR65Y
	SyZXXPWPxUjgk7B1d+5tH5+j77e27Oj1U9NNxJaxrakUxxIUs0uO/ROaNYLlk7IaaUM5b/oYEtL
	qgLC/cqxo/04+Fkjy0CSg7OSTKpv2UYuWUfYeOzbGsgDhoMrbKr9vJY8p42GLX3M76MrY7jW5Qc
	h90qNJWeujDhYSQlIFV2p45wufJ3hhcajz9HM7vAr6DzCZRedbodgd7KvT9RFL50quhKoeZca31
	jCSDiW+7NbyBIFe1X4jPktTZQMc/QDYDCnctgUhVbv1PRSswhVtAnpMLH0sN0oHrsEPgNR3AW31
	z+MI
X-Received: by 2002:a17:90b:5448:b0:38e:6dd:a9ad with SMTP id 98e67ed59e1d1-3930106b2ddmr3589079a91.0.1786524739215;
        Wed, 12 Aug 2026 01:52:19 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392f94d30f4sm2916303a91.14.2026.08.12.01.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 01:52:19 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 2/6] ASoC: samsung: aries_wm8994: Drop redundant probe error messages
Date: Wed, 12 Aug 2026 15:51:29 +0700
Message-ID: <20260812085133.29658-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812085133.29658-1-phucduc.bui@gmail.com>
References: <20260812085133.29658-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The functions called here don't log the error themselves, but the
error is already reported deeper in the call chain, so the dev_err()
calls are redundant and can be removed.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Update the commit message.

 sound/soc/samsung/aries_wm8994.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/sound/soc/samsung/aries_wm8994.c b/sound/soc/samsung/aries_wm8994.c
index 58e3e08225de..d189db96cf17 100644
--- a/sound/soc/samsung/aries_wm8994.c
+++ b/sound/soc/samsung/aries_wm8994.c
@@ -381,10 +381,8 @@ static int aries_late_probe(struct snd_soc_card *card)
 			headset_det_irq_thread,
 			IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING |
 			IRQF_ONESHOT, "headset_detect", priv);
-	if (ret) {
-		dev_err(card->dev, "Failed to request headset detect irq");
+	if (ret)
 		return ret;
-	}
 
 	headset_button_gpio[0].data = priv;
 	headset_button_gpio[0].desc = priv->gpio_headset_key;
@@ -623,10 +621,8 @@ static int aries_audio_probe(struct platform_device *pdev)
 	if (ret < 0) {
 		/* Backwards compatible way */
 		ret = snd_soc_of_parse_audio_routing(card, "samsung,audio-routing");
-		if (ret < 0) {
-			dev_err(dev, "Audio routing invalid/unspecified\n");
+		if (ret < 0)
 			return ret;
-		}
 	}
 
 	aries_dai[1].dai_fmt = priv->variant->modem_dai_fmt;
@@ -671,10 +667,8 @@ static int aries_audio_probe(struct platform_device *pdev)
 
 	ret = devm_snd_soc_register_component(dev, &aries_component,
 				aries_ext_dai, ARRAY_SIZE(aries_ext_dai));
-	if (ret < 0) {
-		dev_err(dev, "Failed to register component: %d\n", ret);
+	if (ret < 0)
 		goto out;
-	}
 
 	ret = devm_snd_soc_register_card(dev, card);
 	if (ret)
-- 
2.43.0

