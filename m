Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD5B3F0AA6
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 11:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781781031; cv=none; b=tx6nPeyTahSwysffVk8T236GbyZ9yH26169YKaPAMMi5WrJQASMDG0BbsSaZmI+JAmoPXLr/yAjZHHdWL6m27gv2xBnAF/Wwi7kNQi4FB3TfuFmoCGO5f+WfIJLty1ttfrlVKJllwbOUgL+c+WOpEtDPR4jmscUqMri2BDQu1yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781781031; c=relaxed/simple;
	bh=VepUQOH9I2YScBtyygKkYYIP3OnVwMB6+G3b8wmbhVE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gv8zXb9lVFQkUcS/0qWGZX1vpVy5WowVFirrWtdw7DG5BPKtkEYV+EqYyIde/m50WjJFchpsHPlZ4cdL5cyIGFDUzZ1L3xqkkqh35AIgBLNPVXfe/DSXgm1eMMlno2mcWCwCIPwy0ZAcGKnXXD0BC4DrqEniM0SalwDwCJdGA5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gfFUqsPI; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gfFUqsPI"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2c6dadfbaafso8369575ad.3
        for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 04:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781029; x=1782385829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RUydxf/ZwzEU3byhG6kKewQSumkNnr4b0Y4idMeiddo=;
        b=gfFUqsPI97a4wZrtCyikMu5B2BK+QlAoIGBNGZx+llJJpSnf5t04yTCW52KaTYp34Y
         iG4ji3l3OamLY8Rj/TGECJnhBl3i3sy0YUtzF2vd+ku/s/frK6KxdQHgm2apJQO7FYGA
         CIAbjUexe+sO1QcY1ahGbt8lXWIOJBt840RZJ8gtVecnR7hkFRS6z2Y6hbJwOs7LrzDz
         IPsS0xKR8LRcXCcUqMFQWStFTWSY2WKb0RFGurn6ukBti8uJSNYhjxhDL03Sd17mZ1MN
         ODx4mj4IhEQ5vOUjBdoTgbOHIuCQYGyaainDTOITqiyNaNr2K6LUgdgAUkexN5KOWnug
         qmLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781029; x=1782385829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RUydxf/ZwzEU3byhG6kKewQSumkNnr4b0Y4idMeiddo=;
        b=ZQPthMa0K0EDSF7Uu+pJg1fL11dr7KPKOPa/b279kqn5xP3P/BrdXu6mnu5uT7X6qw
         77M1zmrvy+0ZIZ/8/R2SqRDnuXfbGdWaLQ4KRoEGGUdhGh6wIX9FFnpQIbOwdzK/8HTr
         jRm/oUouKxoRadgs6YILLzU2kakdWKlOwzvW8I4GzYG1PDjO+NWSiowb9D462fvQJe31
         ME7tbsn5EdRc7d2mk+oiNvh8phnRLW5yBlfOHKF3TMVcVFY1fLqyx1Vsdy73WZCetSx/
         zxXnEZa22ufD06WC3PI+TS8cXBWHjTMqKJfLb+J/EJaDhqvFn5gKXcAWf0SZkHNYj4ZR
         eMTg==
X-Forwarded-Encrypted: i=1; AFNElJ/cBp+v17iDM4w7ODCh7u4dgvZ6mGkOs68XFYwTGqlaOqJ/Gu9QdpTtHvzKVmK2ukekFQ4l6/R0OZXXNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZhEIM19aGts0fyDRghIO3uslAvCJ02e4uuVr7dzddgbgeGddE
	vIzIta9o4hgoJqSflmnaF7T0PtdXfx2PrRAkmUdDygFdnyqX0fMdxXYL
X-Gm-Gg: AfdE7cnb4y2SRloEp8aGxAVkHT6Oy2DvV6gbi515+dyUgBBYtt8Pdj5mcR/es0DGvTr
	Z8eqKexOpQW9sdtbeN7B0K6AeqH7tZvfVeQztHht/r2R9nq2Mfx3HjK9SJ+w71Pkub5ukZQrRns
	bMYxa5EpeuLh2i56Kux48XB3EosLdIEihUChF53vfLMcUoa11viltZRVC0tbQZ/MgGcN4wVYOHq
	m507DEUcKbNdCDemLdPRe8sGLdnaQsaQE5jbtzvOWMKekVM1h+F4t9L/ROcAgDMsYvPcmzpyakh
	3/xDt0Tx9Tnfmn08NHNluFzHodxFcisuUU5wVZ1AKSSOLVJ5npblCOvuG65b1y8RZNHTfv4Hh0D
	0O0C3Gfxdbzis0MDHSxhUW1m75pi4r8fPTZ0Qr86Benpa7tdOvsKHI1c8bgaLDW4QiGRqgkqJ/u
	OtHpv24SrF/hTgonlMf8oAICSYg1Ax8SC6yTHBJJjLNyA11zj/L/UbO+Mgow==
X-Received: by 2002:a17:902:c945:b0:2ba:3e2f:6883 with SMTP id d9443c01a7336-2c6e5155763mr34980605ad.19.1781781029264;
        Thu, 18 Jun 2026 04:10:29 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:10:28 -0700 (PDT)
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
Subject: [PATCH 68/78] ASoC: codecs: wm0010: Use guard() for mutex & spin locks
Date: Thu, 18 Jun 2026 18:08:17 +0700
Message-ID: <20260618110827.232983-12-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618110827.232983-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260618110827.232983-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wm0010.c | 63 ++++++++++++++-------------------------
 1 file changed, 23 insertions(+), 40 deletions(-)

diff --git a/sound/soc/codecs/wm0010.c b/sound/soc/codecs/wm0010.c
index 2a8c61a72c17..aeca42e4caba 100644
--- a/sound/soc/codecs/wm0010.c
+++ b/sound/soc/codecs/wm0010.c
@@ -148,13 +148,11 @@ static const char *wm0010_state_to_str(enum wm0010_state state)
 static void wm0010_halt(struct snd_soc_component *component)
 {
 	struct wm0010_priv *wm0010 = snd_soc_component_get_drvdata(component);
-	unsigned long flags;
 	enum wm0010_state state;
 
 	/* Fetch the wm0010 state */
-	spin_lock_irqsave(&wm0010->irq_lock, flags);
-	state = wm0010->state;
-	spin_unlock_irqrestore(&wm0010->irq_lock, flags);
+	scoped_guard(spinlock_irqsave, &wm0010->irq_lock)
+		state = wm0010->state;
 
 	switch (state) {
 	case WM0010_POWER_OFF:
@@ -173,9 +171,8 @@ static void wm0010_halt(struct snd_soc_component *component)
 		break;
 	}
 
-	spin_lock_irqsave(&wm0010->irq_lock, flags);
-	wm0010->state = WM0010_POWER_OFF;
-	spin_unlock_irqrestore(&wm0010->irq_lock, flags);
+	scoped_guard(spinlock_irqsave, &wm0010->irq_lock)
+		wm0010->state = WM0010_POWER_OFF;
 }
 
 struct wm0010_boot_xfer {
@@ -190,11 +187,9 @@ struct wm0010_boot_xfer {
 static void wm0010_mark_boot_failure(struct wm0010_priv *wm0010)
 {
 	enum wm0010_state state;
-	unsigned long flags;
 
-	spin_lock_irqsave(&wm0010->irq_lock, flags);
-	state = wm0010->state;
-	spin_unlock_irqrestore(&wm0010->irq_lock, flags);
+	scoped_guard(spinlock_irqsave, &wm0010->irq_lock)
+		state = wm0010->state;
 
 	dev_err(wm0010->dev, "Failed to transition from `%s' state to `%s' state\n",
 		wm0010_state_to_str(state), wm0010_state_to_str(state + 1));
@@ -558,7 +553,6 @@ static int wm0010_boot(struct snd_soc_component *component)
 {
 	struct spi_device *spi = to_spi_device(component->dev);
 	struct wm0010_priv *wm0010 = snd_soc_component_get_drvdata(component);
-	unsigned long flags;
 	int ret;
 	struct spi_message m;
 	struct spi_transfer t;
@@ -568,10 +562,10 @@ static int wm0010_boot(struct snd_soc_component *component)
 	u8 *out;
 	int i;
 
-	spin_lock_irqsave(&wm0010->irq_lock, flags);
-	if (wm0010->state != WM0010_POWER_OFF)
-		dev_warn(wm0010->dev, "DSP already powered up!\n");
-	spin_unlock_irqrestore(&wm0010->irq_lock, flags);
+	scoped_guard(spinlock_irqsave, &wm0010->irq_lock) {
+		if (wm0010->state != WM0010_POWER_OFF)
+			dev_warn(wm0010->dev, "DSP already powered up!\n");
+	}
 
 	if (wm0010->sysclk > 26000000) {
 		dev_err(component->dev, "Max DSP clock frequency is 26MHz\n");
@@ -579,7 +573,7 @@ static int wm0010_boot(struct snd_soc_component *component)
 		goto err;
 	}
 
-	mutex_lock(&wm0010->lock);
+	guard(mutex)(&wm0010->lock);
 	wm0010->pll_running = false;
 
 	dev_dbg(component->dev, "max_spi_freq: %d\n", wm0010->max_spi_freq);
@@ -589,7 +583,6 @@ static int wm0010_boot(struct snd_soc_component *component)
 	if (ret != 0) {
 		dev_err(&spi->dev, "Failed to enable core supplies: %d\n",
 			ret);
-		mutex_unlock(&wm0010->lock);
 		goto err;
 	}
 
@@ -601,17 +594,15 @@ static int wm0010_boot(struct snd_soc_component *component)
 
 	/* Release reset */
 	gpiod_set_value_cansleep(wm0010->reset, 0);
-	spin_lock_irqsave(&wm0010->irq_lock, flags);
-	wm0010->state = WM0010_OUT_OF_RESET;
-	spin_unlock_irqrestore(&wm0010->irq_lock, flags);
+	scoped_guard(spinlock_irqsave, &wm0010->irq_lock)
+		wm0010->state = WM0010_OUT_OF_RESET;
 
 	if (!wait_for_completion_timeout(&wm0010->boot_completion,
 					 msecs_to_jiffies(20)))
 		dev_err(component->dev, "Failed to get interrupt from DSP\n");
 
-	spin_lock_irqsave(&wm0010->irq_lock, flags);
-	wm0010->state = WM0010_BOOTROM;
-	spin_unlock_irqrestore(&wm0010->irq_lock, flags);
+	scoped_guard(spinlock_irqsave, &wm0010->irq_lock)
+		wm0010->state = WM0010_BOOTROM;
 
 	ret = wm0010_stage2_load(component);
 	if (ret)
@@ -621,9 +612,8 @@ static int wm0010_boot(struct snd_soc_component *component)
 					 msecs_to_jiffies(20)))
 		dev_err(component->dev, "Failed to get interrupt from DSP loader.\n");
 
-	spin_lock_irqsave(&wm0010->irq_lock, flags);
-	wm0010->state = WM0010_STAGE2;
-	spin_unlock_irqrestore(&wm0010->irq_lock, flags);
+	scoped_guard(spinlock_irqsave, &wm0010->irq_lock)
+		wm0010->state = WM0010_STAGE2;
 
 	/* Only initialise PLL if max_spi_freq initialised */
 	if (wm0010->max_spi_freq) {
@@ -693,11 +683,8 @@ static int wm0010_boot(struct snd_soc_component *component)
 	if (ret != 0)
 		goto abort;
 
-	spin_lock_irqsave(&wm0010->irq_lock, flags);
-	wm0010->state = WM0010_FIRMWARE;
-	spin_unlock_irqrestore(&wm0010->irq_lock, flags);
-
-	mutex_unlock(&wm0010->lock);
+	scoped_guard(spinlock_irqsave, &wm0010->irq_lock)
+		wm0010->state = WM0010_FIRMWARE;
 
 	return 0;
 
@@ -708,11 +695,9 @@ static int wm0010_boot(struct snd_soc_component *component)
 abort:
 	/* Put the chip back into reset */
 	wm0010_halt(component);
-	mutex_unlock(&wm0010->lock);
 	return ret;
 
 err_core:
-	mutex_unlock(&wm0010->lock);
 	regulator_bulk_disable(ARRAY_SIZE(wm0010->core_supplies),
 			       wm0010->core_supplies);
 err:
@@ -734,9 +719,8 @@ static int wm0010_set_bias_level(struct snd_soc_component *component,
 		break;
 	case SND_SOC_BIAS_STANDBY:
 		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_PREPARE) {
-			mutex_lock(&wm0010->lock);
-			wm0010_halt(component);
-			mutex_unlock(&wm0010->lock);
+			scoped_guard(mutex, &wm0010->lock)
+				wm0010_halt(component);
 		}
 		break;
 	case SND_SOC_BIAS_OFF:
@@ -832,9 +816,8 @@ static irqreturn_t wm0010_irq(int irq, void *data)
 	case WM0010_OUT_OF_RESET:
 	case WM0010_BOOTROM:
 	case WM0010_STAGE2:
-		spin_lock(&wm0010->irq_lock);
-		complete(&wm0010->boot_completion);
-		spin_unlock(&wm0010->irq_lock);
+		scoped_guard(spinlock, &wm0010->irq_lock)
+			complete(&wm0010->boot_completion);
 		return IRQ_HANDLED;
 	default:
 		return IRQ_NONE;
-- 
2.43.0

