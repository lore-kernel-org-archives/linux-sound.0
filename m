Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28259404BEA
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 10:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692634; cv=none; b=EGT5dmVCL8/agy1yJfoBMgbnviI2srLkVY9T4LsG548QaeFv4AcMbnI4gqzxKt8tVIeR19A8vAq2Xtkf4ieqzJdObRYRylmuL/3F39Mm+Um/EiW6vcw6OyqpRnc5ODgH/HwscHKDisr/2lpv6enNpqlNw9Mlm3GwE8EHDWc1AAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692634; c=relaxed/simple;
	bh=6JGmkvmPv3bfeFK1z8LiLk2AYl5VVZRgiOOlTyfPPvU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sOGQZLqjc5zFK2UB3fuYrky5dZCDiG1fGvPPQ/v/5DAynrDojTgKUTB5odYRQ9reejidJVuMmRTgkQcsMnH84gg4e2o8R843ZGnS4n+n55ibVHVcTHT61qdD96UlYAGtCggYtvx2nAGa31X9J+Rnp5D06JItWaPOw0cvxiwEv9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jki8DKIv; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jki8DKIv"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-30bbe98c3f0so2724121eec.0
        for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 03:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692628; x=1782297428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xcitmHPXdjwjVBCqMlXK3p8pn3Z3237U4G8SnuErAoU=;
        b=Jki8DKIvwzfcZYFPY37grUmia4Mo8LGurvsEPlPd8pelHo+xFrVLjINFn2dahluMkV
         hAGv62N0nv7hHM37GMM0NBVKMq1IABx4k4uIK92urqPeJCqYUF++G4wN7f43AGGzaZK0
         QKd9r5NAR55YBovhCtJ8mojuNRXErczwEzuYcGJ9s8fOiRLhstrGnlbSUhWEM88r5jrH
         5AKuMsXGYBdgwQ2B2zIyuH44aBI2RVeActsFOExOTtYPeLzL+4rxYF7zjYuYYjIG3FRt
         fsLk5bwLvtTMzUjy6wRhQy1XK6yNUNSSPsDlOAe0MbSIuMqeXgBnPpn+AC+oZt30Dhkw
         d2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692628; x=1782297428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xcitmHPXdjwjVBCqMlXK3p8pn3Z3237U4G8SnuErAoU=;
        b=aR0cS/yWXeJHpo5V+5FhEx85jd0j/PD751eGngI6gzoLdoiHnAKJgoFbwqmESi2XqL
         zoSfexfE2r+NpDrvBtnealaOWKwRPuBoUSfcEYnNUKFbnOt7k1xYjtbEYRFgW5JitN+c
         mONs9b4WK2AvKN/XTE2upr9GWjTMvcIcVzV6+QN/3MaHfqHlIcfnJEF4tyipAHx88WcL
         iBzBzuLU8I/tsdooiTF+qbUJpNFLTUk9ict6eb2E9aU+hyPRDTBRNQxR5HLMaA10pk8b
         UKBcb27LxeeX6snzt1ainf9Hlu9VCkgWV1Kcl1HcyGeikq8RJd6lZWN6ZemSaR9d8fsz
         HbJw==
X-Forwarded-Encrypted: i=1; AFNElJ9kOLXGGsHGJ9zCzwisug1NM3+5x+DzHcZbiJK6V1vHYfdoPnwqlFpXcnKJaFmf5C9WawUcQbyj//hpcg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1YpyN8o/6bUZyYb0fvqkXjQUY0wlymE7hF3w6Gk5mwZOe1tUe
	evOqkQb5LGqJA9Hz7Pl5yeaWDOeoPiM8DpE3kHQftKWPL/JpzC6O1hco
X-Gm-Gg: AfdE7cnwFpPWcuDtqihbKwAw2tA2TWqj+vzkVLS857vJtluDanDyp7oNDMSxrcb5hRh
	jbqHafA5xdPhHmzBcH3UqaYFt0FJ7sHNX6vxgHUmhtrv8bX4EY3L4bpbWXbF/2u485rJXHVeiP4
	gr73otPY6gqiP92teWEDSRifIFq6vQp4umMj2o3R82Jmsf9NJ7Io6pJbzZLb3Tbv2wK8AVl5ZYm
	AZ6j8PeE/zgOYUbfoc9W0evZ97sLhvfSGF6hd/qQE/+jMol0Rq2HpH5/84OUw9NTHPphinKd7zF
	WpVAzpDerwFSvHNZLD/bizl7J98Oc1sdTKIiwJX5KodEwW13ahdJZml1MrcAHQiFHp5uBokJX78
	pV0XffNguKk2VUGT2Do1Ya6vYbqjfxM8XR9QISTjwORRwSu1VEqPaesiv5y1C9ojAAQVO5ydais
	zCQXrWoOoF8jhdO5iNeLs7sSSCH/fYzOH4LfQe5PeiU5Wvyp0=
X-Received: by 2002:a05:7300:4313:b0:2d1:d434:cfe3 with SMTP id 5a478bee46e88-30bc92019d6mr1607108eec.0.1781692628170;
        Wed, 17 Jun 2026 03:37:08 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:37:07 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 27/78] ASoC: codecs: es8316: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:44 +0700
Message-ID: <20260617103235.449609-28-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/es8316.c | 30 ++++++++++++------------------
 1 file changed, 12 insertions(+), 18 deletions(-)

diff --git a/sound/soc/codecs/es8316.c b/sound/soc/codecs/es8316.c
index 6a428387e496..df6cf8a19270 100644
--- a/sound/soc/codecs/es8316.c
+++ b/sound/soc/codecs/es8316.c
@@ -621,15 +621,15 @@ static irqreturn_t es8316_irq(int irq, void *data)
 	struct snd_soc_component *comp = es8316->component;
 	unsigned int flags;
 
-	mutex_lock(&es8316->lock);
+	guard(mutex)(&es8316->lock);
 
 	regmap_read(es8316->regmap, ES8316_GPIO_FLAG, &flags);
 	if (flags == 0x00)
-		goto out; /* Powered-down / reset */
+		return IRQ_HANDLED; /* Powered-down / reset */
 
 	/* Catch spurious IRQ before set_jack is called */
 	if (!es8316->jack)
-		goto out;
+		return IRQ_HANDLED;
 
 	if (es8316->jd_inverted)
 		flags ^= ES8316_GPIO_FLAG_HP_NOT_INSERTED;
@@ -682,8 +682,6 @@ static irqreturn_t es8316_irq(int irq, void *data)
 		}
 	}
 
-out:
-	mutex_unlock(&es8316->lock);
 	return IRQ_HANDLED;
 }
 
@@ -700,18 +698,16 @@ static void es8316_enable_jack_detect(struct snd_soc_component *component,
 	es8316->jd_inverted = device_property_read_bool(component->dev,
 							"everest,jack-detect-inverted");
 
-	mutex_lock(&es8316->lock);
+	scoped_guard(mutex, &es8316->lock) {
+		es8316->jack = jack;
 
-	es8316->jack = jack;
-
-	if (es8316->jack->status & SND_JACK_MICROPHONE)
-		es8316_enable_micbias_for_mic_gnd_short_detect(component);
-
-	snd_soc_component_update_bits(component, ES8316_GPIO_DEBOUNCE,
-				      ES8316_GPIO_ENABLE_INTERRUPT,
-				      ES8316_GPIO_ENABLE_INTERRUPT);
+		if (es8316->jack->status & SND_JACK_MICROPHONE)
+			es8316_enable_micbias_for_mic_gnd_short_detect(component);
 
-	mutex_unlock(&es8316->lock);
+		snd_soc_component_update_bits(component, ES8316_GPIO_DEBOUNCE,
+					      ES8316_GPIO_ENABLE_INTERRUPT,
+					      ES8316_GPIO_ENABLE_INTERRUPT);
+	}
 
 	/* Enable irq and sync initial jack state */
 	enable_irq(es8316->irq);
@@ -727,7 +723,7 @@ static void es8316_disable_jack_detect(struct snd_soc_component *component)
 
 	disable_irq(es8316->irq);
 
-	mutex_lock(&es8316->lock);
+	guard(mutex)(&es8316->lock);
 
 	snd_soc_component_update_bits(component, ES8316_GPIO_DEBOUNCE,
 				      ES8316_GPIO_ENABLE_INTERRUPT, 0);
@@ -738,8 +734,6 @@ static void es8316_disable_jack_detect(struct snd_soc_component *component)
 	}
 
 	es8316->jack = NULL;
-
-	mutex_unlock(&es8316->lock);
 }
 
 static int es8316_set_jack(struct snd_soc_component *component,
-- 
2.43.0

