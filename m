Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC04346A13
	for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 09:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145399; cv=none; b=XDhfAhf960xjdzMwDHW+oPsWl57wrCAlSU5WNZH3mdfi3UVFB2lMKs8q1cSGjl8CifortMgwgd0eJVNjNntbY6wkOHBCEtbXJpHkKZqOQiY0QXX0Thdp15Plf1F5/B5lFVt7+WTcx/7zOiFiV2z96TPlI2hQPf51VEldOv9HG1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145399; c=relaxed/simple;
	bh=4P3qOSBkZIQJD0dP/avNyHuYesAgPsaLhYxvXxAmErk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DniUJ+YO1ursJ5Dg5iQoNqOjGI98+xwkmQZT73sznFi3elzoAXnhRAh6yNzIxfXqNzN8H5Feu81YwDT9FZEls3dHXLl71QH0UOM5ISc6VCSsTvfSI8MlpuOTJMDWUqkj0W0XRtCLD1fOpGm8xldhoJ1vL+8LEKxE8kMFlKNQ5YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tLlefO7W; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tLlefO7W"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso22108435ad.3
        for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 02:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785145388; x=1785750188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HMaTaVppxtdBT/aFQQkrTJ9dhpXa6DmRNwQ/jLrNZ78=;
        b=tLlefO7WK36gdHSnTdQAX0M/Ng+QzbLFH+UkM9iY6Fm5NDcm4tGwp1Qx58AWAuSwyh
         QDTV47YKbO20rhY1+Y3IfzahmSzCrEFuj+LJwir3Mx4X2LVSUx6Rp0R6ik5KZNbE5avb
         UuV2tCUcFsZVg1GGGcnF9/p375EQRSem3xes4KA/Qf9RLiCxzvGwvP5M6ltCeXAVN6wx
         FkI+L9NqcFTMO7vywRBlk9PFiegY+ScCa6bQqpNwy7HOWiEl/nTEPfOSVtm+L96Aa4Hp
         /LcenMdtAUfkidJhsVXN8PvQ/PGaENvV2lbqaABXMhDjfzMc8xq6ZLooxaUKVnxuiS1f
         1LGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785145388; x=1785750188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HMaTaVppxtdBT/aFQQkrTJ9dhpXa6DmRNwQ/jLrNZ78=;
        b=oYX+qsCnK2KMGhP0RLasEJejH6lycAfxCj+l+yffVG3LULYiZzzGmFheYQqT/G7Bos
         W6n9ydvx1J1JIdLHqmVORo2z5+0t2x6u/v1JcHJq6K7h6Tx6UjMOFvSSSBStaCqeUzBK
         LtTsWisykAFaVHqk0gy9XQ722aPlVuEZ/ZOH9foQ5hZnlz2bJ61pR86VKobHyF+QtVoo
         cwlbDAd0oRPTUHhMFc7RsoEEXdZ/cw2WDqqOGzzQg04tS+HJ2JzADAUPMH5ZDkzdfuhq
         glW2QUfnsu8ZEEbyidixFe1+b2a/WEecVdyIL1yPMN6LZctr1oCDeVp6drCZzyp3GQ7q
         F8Qg==
X-Forwarded-Encrypted: i=1; AHgh+Rr7Br8SL7uAhnSKbuF+NBXCETNCkPAckBkKtOqE/FRjMo6ZUIvv3u2xWVLG3NHQ2w2yhislyIp9Azqneg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yze8K0QpDbtIIlDz5NP4SpDvKG7aImtClUuxKPM/SsLIx+t6EfZ
	pAEvyq+H+o5FG4e2q9BzRZji7s7ckPLe/ebtKHb2zQh/7aiOooshfiTu
X-Gm-Gg: AR+sD13Sl8OJ+ZYBRG6MSwa4A75MHe/wX+Ikxmqhiz9/H2OkkjgopGN9+CWPKrwoVyc
	62dd/lwBm5iNLiiKhNZtMBppSVjwbP+iaWJCIg7QSLnKcg1DNd88v2AIHGvW8oUIpMRN4hseCcK
	Fd4ToJA7fevclng7tl5o1NwgnJr9G+6xYJU9H960/WXwjf3UBozyAhrY3bMJPPFbYV2H5Iri6dl
	hAnv14zfS3a1vS8z7OGmMhJ9RlRmptfW7XEP82tG2TSszobpHRg3urNRoQwWtG43MKQudsQ2rR/
	0bpyQ6o9OvkLhi706oEFfHNUFXfDGGr1Lu7CFE+JAHY7himQYjVTGQ1Z7/QPscKgRdxjUQaqy6S
	tXE5993dSTseEkcORLqAItZtCPOlT7kWsdXvSSqjR/BD8Yc96eDjf//BOTMphGjFsrwYhunfIcZ
	LECaZyFNcClCFXnYm45h7w+IC4+cD6UY962CoEQG6JccbTRq1I7LPTq0ATOtzIDH+BZ63prYkz7
	sayftBkIvkW6T2Nxz1CUw==
X-Received: by 2002:a05:6a21:4c03:b0:3c0:b55a:80ff with SMTP id adf61e73a8af0-3c67da78f78mr7986160637.24.1785145388492;
        Mon, 27 Jul 2026 02:43:08 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb66b5ffesm2959018a12.19.2026.07.27.02.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:43:08 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>
Cc: Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Linus Walleij <linusw@kernel.org>,
	u.kleine-koenig@baylibre.com,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Kees Cook <kees@kernel.org>,
	Chen Ni <nichen@iscas.ac.cn>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 07/26] ASoC: codecs: tlv320dac33: Use guard() for mutex & spin locks
Date: Mon, 27 Jul 2026 16:40:27 +0700
Message-ID: <20260727094046.23001-8-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727094046.23001-1-phucduc.bui@gmail.com>
References: <20260727094046.23001-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex & spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/tlv320dac33.c | 87 ++++++++++++++--------------------
 1 file changed, 36 insertions(+), 51 deletions(-)

diff --git a/sound/soc/codecs/tlv320dac33.c b/sound/soc/codecs/tlv320dac33.c
index 223c49dfc450..9bd2ddd8dacd 100644
--- a/sound/soc/codecs/tlv320dac33.c
+++ b/sound/soc/codecs/tlv320dac33.c
@@ -7,6 +7,7 @@
  * Copyright:   (C) 2009 Nokia Corporation
  */
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
@@ -236,13 +237,10 @@ static int dac33_write_locked(struct snd_soc_component *component, unsigned int
 			      unsigned int value)
 {
 	struct tlv320dac33_priv *dac33 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&dac33->mutex);
-	ret = dac33_write(component, reg, value);
-	mutex_unlock(&dac33->mutex);
+	guard(mutex)(&dac33->mutex);
 
-	return ret;
+	return dac33_write(component, reg, value);
 }
 
 #define DAC33_I2C_ADDR_AUTOINC	0x80
@@ -365,13 +363,13 @@ static int dac33_hard_power(struct snd_soc_component *component, int power)
 	struct tlv320dac33_priv *dac33 = snd_soc_component_get_drvdata(component);
 	int ret = 0;
 
-	mutex_lock(&dac33->mutex);
+	guard(mutex)(&dac33->mutex);
 
 	/* Safety check */
 	if (unlikely(power == dac33->chip_power)) {
 		dev_dbg(component->dev, "Trying to set the same power state: %s\n",
 			power ? "ON" : "OFF");
-		goto exit;
+		return ret;
 	}
 
 	if (power) {
@@ -380,7 +378,7 @@ static int dac33_hard_power(struct snd_soc_component *component, int power)
 		if (ret != 0) {
 			dev_err(component->dev,
 				"Failed to enable supplies: %d\n", ret);
-			goto exit;
+			return ret;
 		}
 
 		if (dac33->reset_gpiod) {
@@ -388,7 +386,7 @@ static int dac33_hard_power(struct snd_soc_component *component, int power)
 			if (ret < 0) {
 				dev_err(&dac33->i2c->dev,
 					"Failed to set reset GPIO: %d\n", ret);
-				goto exit;
+				return ret;
 			}
 		}
 
@@ -400,7 +398,7 @@ static int dac33_hard_power(struct snd_soc_component *component, int power)
 			if (ret < 0) {
 				dev_err(&dac33->i2c->dev,
 					"Failed to set reset GPIO: %d\n", ret);
-				goto exit;
+				return ret;
 			}
 		}
 
@@ -409,14 +407,12 @@ static int dac33_hard_power(struct snd_soc_component *component, int power)
 		if (ret != 0) {
 			dev_err(component->dev,
 				"Failed to disable supplies: %d\n", ret);
-			goto exit;
+			return ret;
 		}
 
 		dac33->chip_power = 0;
 	}
 
-exit:
-	mutex_unlock(&dac33->mutex);
 	return ret;
 }
 
@@ -659,7 +655,6 @@ static inline void dac33_prefill_handler(struct tlv320dac33_priv *dac33)
 {
 	struct snd_soc_component *component = dac33->component;
 	unsigned int delay;
-	unsigned long flags;
 
 	switch (dac33->fifo_mode) {
 	case DAC33_FIFO_MODE1:
@@ -667,10 +662,10 @@ static inline void dac33_prefill_handler(struct tlv320dac33_priv *dac33)
 			DAC33_THRREG(dac33->nsample));
 
 		/* Take the timestamps */
-		spin_lock_irqsave(&dac33->lock, flags);
-		dac33->t_stamp2 = ktime_to_us(ktime_get());
-		dac33->t_stamp1 = dac33->t_stamp2;
-		spin_unlock_irqrestore(&dac33->lock, flags);
+		scoped_guard(spinlock_irqsave, &dac33->lock) {
+			dac33->t_stamp2 = ktime_to_us(ktime_get());
+			dac33->t_stamp1 = dac33->t_stamp2;
+		}
 
 		dac33_write16(component, DAC33_PREFILL_MSB,
 				DAC33_THRREG(dac33->alarm_threshold));
@@ -682,11 +677,11 @@ static inline void dac33_prefill_handler(struct tlv320dac33_priv *dac33)
 		break;
 	case DAC33_FIFO_MODE7:
 		/* Take the timestamp */
-		spin_lock_irqsave(&dac33->lock, flags);
-		dac33->t_stamp1 = ktime_to_us(ktime_get());
-		/* Move back the timestamp with drain time */
-		dac33->t_stamp1 -= dac33->mode7_us_to_lthr;
-		spin_unlock_irqrestore(&dac33->lock, flags);
+		scoped_guard(spinlock_irqsave, &dac33->lock) {
+			dac33->t_stamp1 = ktime_to_us(ktime_get());
+			/* Move back the timestamp with drain time */
+			dac33->t_stamp1 -= dac33->mode7_us_to_lthr;
+		}
 
 		dac33_write16(component, DAC33_PREFILL_MSB,
 				DAC33_THRREG(DAC33_MODE7_MARGIN));
@@ -704,14 +699,12 @@ static inline void dac33_prefill_handler(struct tlv320dac33_priv *dac33)
 static inline void dac33_playback_handler(struct tlv320dac33_priv *dac33)
 {
 	struct snd_soc_component *component = dac33->component;
-	unsigned long flags;
 
 	switch (dac33->fifo_mode) {
 	case DAC33_FIFO_MODE1:
 		/* Take the timestamp */
-		spin_lock_irqsave(&dac33->lock, flags);
-		dac33->t_stamp2 = ktime_to_us(ktime_get());
-		spin_unlock_irqrestore(&dac33->lock, flags);
+		scoped_guard(spinlock_irqsave, &dac33->lock)
+			dac33->t_stamp2 = ktime_to_us(ktime_get());
 
 		dac33_write16(component, DAC33_NSAMPLE_MSB,
 				DAC33_THRREG(dac33->nsample));
@@ -735,7 +728,7 @@ static void dac33_work(struct work_struct *work)
 	dac33 = container_of(work, struct tlv320dac33_priv, work);
 	component = dac33->component;
 
-	mutex_lock(&dac33->mutex);
+	guard(mutex)(&dac33->mutex);
 	switch (dac33->state) {
 	case DAC33_PREFILL:
 		dac33->state = DAC33_PLAYBACK;
@@ -757,18 +750,15 @@ static void dac33_work(struct work_struct *work)
 		dac33_write(component, DAC33_FIFO_CTRL_A, reg);
 		break;
 	}
-	mutex_unlock(&dac33->mutex);
 }
 
 static irqreturn_t dac33_interrupt_handler(int irq, void *dev)
 {
 	struct snd_soc_component *component = dev;
 	struct tlv320dac33_priv *dac33 = snd_soc_component_get_drvdata(component);
-	unsigned long flags;
 
-	spin_lock_irqsave(&dac33->lock, flags);
-	dac33->t_stamp1 = ktime_to_us(ktime_get());
-	spin_unlock_irqrestore(&dac33->lock, flags);
+	scoped_guard(spinlock_irqsave, &dac33->lock)
+		dac33->t_stamp1 = ktime_to_us(ktime_get());
 
 	/* Do not schedule the workqueue in Mode7 */
 	if (dac33->fifo_mode != DAC33_FIFO_MODE7)
@@ -902,14 +892,13 @@ static int dac33_prepare_chip(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	mutex_lock(&dac33->mutex);
+	guard(mutex)(&dac33->mutex);
 
 	if (!dac33->chip_power) {
 		/*
 		 * Chip is not powered yet.
 		 * Do the init in the dac33_set_bias_level later.
 		 */
-		mutex_unlock(&dac33->mutex);
 		return 0;
 	}
 
@@ -1053,8 +1042,6 @@ static int dac33_prepare_chip(struct snd_pcm_substream *substream,
 		break;
 	}
 
-	mutex_unlock(&dac33->mutex);
-
 	return 0;
 }
 
@@ -1156,21 +1143,20 @@ static snd_pcm_sframes_t dac33_dai_delay(
 	unsigned int time_delta, uthr;
 	int samples_out, samples_in, samples;
 	snd_pcm_sframes_t delay = 0;
-	unsigned long flags;
 
 	switch (dac33->fifo_mode) {
 	case DAC33_FIFO_BYPASS:
 		break;
 	case DAC33_FIFO_MODE1:
-		spin_lock_irqsave(&dac33->lock, flags);
-		t0 = dac33->t_stamp1;
-		t1 = dac33->t_stamp2;
-		spin_unlock_irqrestore(&dac33->lock, flags);
+		scoped_guard(spinlock_irqsave, &dac33->lock) {
+			t0 = dac33->t_stamp1;
+			t1 = dac33->t_stamp2;
+		}
 		t_now = ktime_to_us(ktime_get());
 
 		/* We have not started to fill the FIFO yet, delay is 0 */
 		if (!t1)
-			goto out;
+			return 0;
 
 		if (t0 > t1) {
 			/*
@@ -1230,23 +1216,22 @@ static snd_pcm_sframes_t dac33_dai_delay(
 		}
 		break;
 	case DAC33_FIFO_MODE7:
-		spin_lock_irqsave(&dac33->lock, flags);
-		t0 = dac33->t_stamp1;
-		uthr = dac33->uthr;
-		spin_unlock_irqrestore(&dac33->lock, flags);
+		scoped_guard(spinlock_irqsave, &dac33->lock) {
+			t0 = dac33->t_stamp1;
+			uthr = dac33->uthr;
+		}
 		t_now = ktime_to_us(ktime_get());
 
 		/* We have not started to fill the FIFO yet, delay is 0 */
 		if (!t0)
-			goto out;
+			return 0;
 
 		if (t_now <= t0) {
 			/*
 			 * Either the timestamps are messed or equal. Report
 			 * maximum delay
 			 */
-			delay = uthr;
-			goto out;
+			return uthr;
 		}
 
 		time_delta = t_now - t0;
@@ -1287,7 +1272,7 @@ static snd_pcm_sframes_t dac33_dai_delay(
 							dac33->fifo_mode);
 		break;
 	}
-out:
+
 	return delay;
 }
 
-- 
2.43.0

