Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813D13C769D
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 10:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692808; cv=none; b=ELQO1lNXFW5dAZFy27eXcJPRFysniAmzX7APGTnZ8RKYIWJHmUT4xmql5m5DVgp92JAF8YZI4vtgF5zwFSts7uaEXWmUIMVUYNFCkgjpCKqoEh/rl2Qb5V0FPG6mf3yYmCiSX7wAON5JkbBYfUe25wJ8sscQijH43Tr9we1coWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692808; c=relaxed/simple;
	bh=B3a+HptmpYhmxBPPB7HraQVI4U2Yl3Y0z79s2iXuwWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O5973uA1Js1NbdqNY3k2QrKvPLZTAs2QbV6HwURQ6GJQXdSxBRO7mvGLM9iDVRow5Aj5RVHGWWSmJt0OeW+K+tE04BDSRkw1aNocZFvUbwk1GHIGWx93eR1crmuMX0qYYdDPWJv0uRDjLKEGKDqr3DSu0GgVtr/xG8xk/QSMgZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zh4TklyW; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zh4TklyW"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-30bd59b6eb9so793273eec.0
        for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 03:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692806; x=1782297606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F4NAL+Ax67W1fnPekopS276z3NNPB/KQWk3jQSVarPU=;
        b=Zh4TklyWemVw/lIA0cy1AmYWlkf/EJGGJ5lpnGm4GEmeJZi4gVVHjeK9DV7axqm1z9
         xZ+4nDsB8b/OkgpkHmkXj7ctwFb/K34y0VvZxKcQmFTVNWrvlg4S8INQlHH197nxMMtD
         fIVYg790nQ59b/K8Ro+r2cZlgQMjecE7mMktEFbWWXhC6IRjAHVTu9wrBKRiu9Ml6ZN4
         OJ0HGd0ez3Ux3IUd0OQbdxPmLwPRm4D9yg5YrZJsutmW9pEuIKeg6BjuxY1OU7Djk8p7
         4gScriBAV2aBIQhRIESutQR31I5IVlMH34yZZNI8hHg8Q+S8t8oIa6wMAzSpQM9KGmzd
         Zpow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692806; x=1782297606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F4NAL+Ax67W1fnPekopS276z3NNPB/KQWk3jQSVarPU=;
        b=aTEd+cqRN0HRTB9Aw1c2QwUany6cFoQz86pfREyURN9dS6o6LOjtWvGXvVKt9lWhBy
         zwq3Cf6lg/iHCrKhWDjG7vlwYLe2HOLvQ+x01MKGpiw1CFRncPPpVPUVO+C2Yx6vtg0R
         KBDuAF0l7hNjd9eGe/x6L0Zyg4Th83JkJRfY8lvhhs+klUXbB7rlVXjK6iPI65oX0Jsh
         RwqOb7VMkGVZTGtogK4LM/smnhd0QoXifO9FXloPbartndnqCGReieStA0uWFEFuU++x
         vEi6fUbiWAiW+hOgX9D2QOk7ujPWodxdM/eBocJ1TVLLGfQHQPL+Esn2ezU/LiUo98RW
         JPbg==
X-Forwarded-Encrypted: i=1; AFNElJ/8zTrvuA13iHTOPG59ebZW67/KZ8A5NeUeCElfhqsWMb1mJoiy6XdXgI8TMnv9aFGTWp2Re6MPpgF6ZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCXCR8vggquvFsllE4LC7a63852ip1A4Ind2jr93idwsGKYzlI
	NbX4U5Oauyu9pKXQA1IZGGQ9TLNtLpmwSvCNt8ZgRNVGV+eKshg7DC+N
X-Gm-Gg: AfdE7clCVmTyHFLQadBzy/EuPDfvSp2epQuhzlOrKn2hooqwqAnGkXHskbJ3N5nJPOT
	qYRVb5ePeaF6m3202anVg4NP35lGHCP+OH87KyIl8RjfijYNrSZ/DKJv3KCX/87SeKbAJZi4JuU
	YWVfim2JemVib99tU+lgMK5C+8jUeoOS4payLi+Yu24X44KyaCNw0xJpoRI2fVyUGiasJX64Vnp
	sSgqEkOjBxOXnNgdilLtlPCdN1zwuKnGpNYqOTeEmlbXuptlfOB+o8a2WI4dwrsgx/CIlZkdSPB
	KMhL0zmPL+60h277/0dbdoc5V/Ebcvp81UJg9aNNBIhPB5qP6k72q70cN2TTYZO1zkuvHGiH2Ov
	SyDD0iDm1LqoHeIJ1NF2xZMzR+/D64GM+i1WI/dgUeAyICxAK6sipDi51EDGFb041y8gTJu/IhR
	ppkKtH8QFbF5snjd82A1ZdG6jqzkrRtFOf8Vj2FeasoNduAp8=
X-Received: by 2002:a05:693c:3109:b0:2c0:c5e4:605f with SMTP id 5a478bee46e88-30bca10ce70mr1641138eec.24.1781692805548;
        Wed, 17 Jun 2026 03:40:05 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:40:05 -0700 (PDT)
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
Subject: [PATCH 45/78] ASoC: codecs: rt5677: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:32:02 +0700
Message-ID: <20260617103235.449609-46-phucduc.bui@gmail.com>
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
 sound/soc/codecs/rt5677-spi.c | 35 +++++++---------
 sound/soc/codecs/rt5677.c     | 77 ++++++++++++++++-------------------
 2 files changed, 48 insertions(+), 64 deletions(-)

diff --git a/sound/soc/codecs/rt5677-spi.c b/sound/soc/codecs/rt5677-spi.c
index 1bcafd5f4468..f559f7b15bae 100644
--- a/sound/soc/codecs/rt5677-spi.c
+++ b/sound/soc/codecs/rt5677-spi.c
@@ -133,9 +133,8 @@ static int rt5677_spi_hw_params(
 	struct rt5677_dsp *rt5677_dsp =
 			snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&rt5677_dsp->dma_lock);
+	guard(mutex)(&rt5677_dsp->dma_lock);
 	rt5677_dsp->substream = substream;
-	mutex_unlock(&rt5677_dsp->dma_lock);
 
 	return 0;
 }
@@ -147,9 +146,8 @@ static int rt5677_spi_hw_free(
 	struct rt5677_dsp *rt5677_dsp =
 			snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&rt5677_dsp->dma_lock);
+	guard(mutex)(&rt5677_dsp->dma_lock);
 	rt5677_dsp->substream = NULL;
-	mutex_unlock(&rt5677_dsp->dma_lock);
 
 	return 0;
 }
@@ -311,17 +309,17 @@ static void rt5677_spi_copy_work(struct work_struct *work)
 	int ret = 0;
 
 	/* Ensure runtime->dma_area buffer does not go away while copying. */
-	mutex_lock(&rt5677_dsp->dma_lock);
+	guard(mutex)(&rt5677_dsp->dma_lock);
 	if (!rt5677_dsp->substream) {
 		dev_err(rt5677_dsp->dev, "No pcm substream\n");
-		goto done;
+		return;
 	}
 
 	runtime = rt5677_dsp->substream->runtime;
 
 	if (rt5677_spi_mic_write_offset(&mic_write_offset)) {
 		dev_err(rt5677_dsp->dev, "No mic_write_offset\n");
-		goto done;
+		return;
 	}
 
 	/* If this is the first time that we've asked for streaming data after
@@ -355,7 +353,7 @@ static void rt5677_spi_copy_work(struct work_struct *work)
 		ret = rt5677_spi_copy(rt5677_dsp, copy_bytes);
 		if (ret) {
 			dev_err(rt5677_dsp->dev, "Copy failed %d\n", ret);
-			goto done;
+			return;
 		}
 		rt5677_dsp->avail_bytes += copy_bytes;
 		if (rt5677_dsp->avail_bytes >= period_bytes) {
@@ -367,8 +365,6 @@ static void rt5677_spi_copy_work(struct work_struct *work)
 
 	delay = bytes_to_frames(runtime, period_bytes) / runtime->rate;
 	schedule_delayed_work(&rt5677_dsp->copy_work, secs_to_jiffies(delay));
-done:
-	mutex_unlock(&rt5677_dsp->dma_lock);
 }
 
 static int rt5677_spi_pcm_new(struct snd_soc_component *component,
@@ -507,10 +503,8 @@ int rt5677_spi_read(u32 addr, void *rxbuf, size_t len)
 		header[3] = ((addr + offset) & 0x0000ff00) >> 8;
 		header[4] = ((addr + offset) & 0x000000ff) >> 0;
 
-		mutex_lock(&spi_mutex);
-		status |= spi_sync(g_spi, &m);
-		mutex_unlock(&spi_mutex);
-
+		scoped_guard(mutex, &spi_mutex)
+			status |= spi_sync(g_spi, &m);
 
 		/* Copy data back to caller buffer */
 		rt5677_spi_reverse(cb + offset, len - offset, body, t[1].len);
@@ -564,9 +558,8 @@ int rt5677_spi_write(u32 addr, const void *txbuf, size_t len)
 		offset += t.len;
 		t.len += RT5677_SPI_HEADER + 1;
 
-		mutex_lock(&spi_mutex);
-		status |= spi_sync(g_spi, &m);
-		mutex_unlock(&spi_mutex);
+		scoped_guard(mutex, &spi_mutex)
+			status |= spi_sync(g_spi, &m);
 	}
 	return status;
 }
@@ -591,10 +584,10 @@ void rt5677_spi_hotword_detected(void)
 		return;
 	}
 
-	mutex_lock(&rt5677_dsp->dma_lock);
-	dev_info(rt5677_dsp->dev, "Hotword detected\n");
-	rt5677_dsp->new_hotword = true;
-	mutex_unlock(&rt5677_dsp->dma_lock);
+	scoped_guard(mutex, &rt5677_dsp->dma_lock) {
+		dev_info(rt5677_dsp->dev, "Hotword detected\n");
+		rt5677_dsp->new_hotword = true;
+	}
 
 	schedule_delayed_work(&rt5677_dsp->copy_work, 0);
 }
diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index ac084ca008f3..fd060227655e 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -563,46 +563,43 @@ static int rt5677_dsp_mode_i2c_write_addr(struct rt5677_priv *rt5677,
 	struct snd_soc_component *component = rt5677->component;
 	int ret;
 
-	mutex_lock(&rt5677->dsp_cmd_lock);
+	guard(mutex)(&rt5677->dsp_cmd_lock);
 
 	ret = regmap_write(rt5677->regmap_physical, RT5677_DSP_I2C_ADDR_MSB,
 		addr >> 16);
 	if (ret < 0) {
 		dev_err(component->dev, "Failed to set addr msb value: %d\n", ret);
-		goto err;
+		return ret;
 	}
 
 	ret = regmap_write(rt5677->regmap_physical, RT5677_DSP_I2C_ADDR_LSB,
 		addr & 0xffff);
 	if (ret < 0) {
 		dev_err(component->dev, "Failed to set addr lsb value: %d\n", ret);
-		goto err;
+		return ret;
 	}
 
 	ret = regmap_write(rt5677->regmap_physical, RT5677_DSP_I2C_DATA_MSB,
 		value >> 16);
 	if (ret < 0) {
 		dev_err(component->dev, "Failed to set data msb value: %d\n", ret);
-		goto err;
+		return ret;
 	}
 
 	ret = regmap_write(rt5677->regmap_physical, RT5677_DSP_I2C_DATA_LSB,
 		value & 0xffff);
 	if (ret < 0) {
 		dev_err(component->dev, "Failed to set data lsb value: %d\n", ret);
-		goto err;
+		return ret;
 	}
 
 	ret = regmap_write(rt5677->regmap_physical, RT5677_DSP_I2C_OP_CODE,
 		opcode);
 	if (ret < 0) {
 		dev_err(component->dev, "Failed to set op code value: %d\n", ret);
-		goto err;
+		return ret;
 	}
 
-err:
-	mutex_unlock(&rt5677->dsp_cmd_lock);
-
 	return ret;
 }
 
@@ -622,36 +619,33 @@ static int rt5677_dsp_mode_i2c_read_addr(
 	int ret;
 	unsigned int msb, lsb;
 
-	mutex_lock(&rt5677->dsp_cmd_lock);
+	guard(mutex)(&rt5677->dsp_cmd_lock);
 
 	ret = regmap_write(rt5677->regmap_physical, RT5677_DSP_I2C_ADDR_MSB,
 		addr >> 16);
 	if (ret < 0) {
 		dev_err(component->dev, "Failed to set addr msb value: %d\n", ret);
-		goto err;
+		return ret;
 	}
 
 	ret = regmap_write(rt5677->regmap_physical, RT5677_DSP_I2C_ADDR_LSB,
 		addr & 0xffff);
 	if (ret < 0) {
 		dev_err(component->dev, "Failed to set addr lsb value: %d\n", ret);
-		goto err;
+		return ret;
 	}
 
 	ret = regmap_write(rt5677->regmap_physical, RT5677_DSP_I2C_OP_CODE,
 		0x0002);
 	if (ret < 0) {
 		dev_err(component->dev, "Failed to set op code value: %d\n", ret);
-		goto err;
+		return ret;
 	}
 
 	regmap_read(rt5677->regmap_physical, RT5677_DSP_I2C_DATA_MSB, &msb);
 	regmap_read(rt5677->regmap_physical, RT5677_DSP_I2C_DATA_LSB, &lsb);
 	*value = (msb << 16) | lsb;
 
-err:
-	mutex_unlock(&rt5677->dsp_cmd_lock);
-
 	return ret;
 }
 
@@ -940,21 +934,20 @@ static void rt5677_dsp_work(struct work_struct *work)
 		activity = false;
 
 		/* Don't turn off the DSP while handling irqs */
-		mutex_lock(&rt5677->irq_lock);
-		/* Set DSP CPU to Stop */
-		regmap_update_bits(rt5677->regmap, RT5677_PWR_DSP1,
-			RT5677_PWR_DSP_CPU, RT5677_PWR_DSP_CPU);
-
-		rt5677_set_dsp_mode(rt5677, false);
+		scoped_guard(mutex, &rt5677->irq_lock) {
+			/* Set DSP CPU to Stop */
+			regmap_update_bits(rt5677->regmap, RT5677_PWR_DSP1,
+				RT5677_PWR_DSP_CPU, RT5677_PWR_DSP_CPU);
 
-		/* Disable and clear VAD interrupt */
-		regmap_write(rt5677->regmap, RT5677_VAD_CTRL1, 0x2184);
+			rt5677_set_dsp_mode(rt5677, false);
 
-		/* Set GPIO1 pin back to be IRQ output for jack detect */
-		regmap_update_bits(rt5677->regmap, RT5677_GPIO_CTRL1,
-			RT5677_GPIO1_PIN_MASK, RT5677_GPIO1_PIN_IRQ);
+			/* Disable and clear VAD interrupt */
+			regmap_write(rt5677->regmap, RT5677_VAD_CTRL1, 0x2184);
 
-		mutex_unlock(&rt5677->irq_lock);
+			/* Set GPIO1 pin back to be IRQ output for jack detect */
+			regmap_update_bits(rt5677->regmap, RT5677_GPIO_CTRL1,
+				RT5677_GPIO1_PIN_MASK, RT5677_GPIO1_PIN_IRQ);
+		}
 	}
 }
 
@@ -4980,11 +4973,11 @@ static int rt5677_read(void *context, unsigned int reg, unsigned int *val)
 
 	if (rt5677->is_dsp_mode) {
 		if (reg > 0xff) {
-			mutex_lock(&rt5677->dsp_pri_lock);
-			rt5677_dsp_mode_i2c_write(rt5677, RT5677_PRIV_INDEX,
-				reg & 0xff);
-			rt5677_dsp_mode_i2c_read(rt5677, RT5677_PRIV_DATA, val);
-			mutex_unlock(&rt5677->dsp_pri_lock);
+			scoped_guard(mutex, &rt5677->dsp_pri_lock) {
+				rt5677_dsp_mode_i2c_write(rt5677, RT5677_PRIV_INDEX,
+					reg & 0xff);
+				rt5677_dsp_mode_i2c_read(rt5677, RT5677_PRIV_DATA, val);
+			}
 		} else {
 			rt5677_dsp_mode_i2c_read(rt5677, reg, val);
 		}
@@ -5002,12 +4995,12 @@ static int rt5677_write(void *context, unsigned int reg, unsigned int val)
 
 	if (rt5677->is_dsp_mode) {
 		if (reg > 0xff) {
-			mutex_lock(&rt5677->dsp_pri_lock);
-			rt5677_dsp_mode_i2c_write(rt5677, RT5677_PRIV_INDEX,
-				reg & 0xff);
-			rt5677_dsp_mode_i2c_write(rt5677, RT5677_PRIV_DATA,
-				val);
-			mutex_unlock(&rt5677->dsp_pri_lock);
+			scoped_guard(mutex, &rt5677->dsp_pri_lock) {
+				rt5677_dsp_mode_i2c_write(rt5677, RT5677_PRIV_INDEX,
+					reg & 0xff);
+				rt5677_dsp_mode_i2c_write(rt5677, RT5677_PRIV_DATA,
+					val);
+			}
 		} else {
 			rt5677_dsp_mode_i2c_write(rt5677, reg, val);
 		}
@@ -5313,7 +5306,7 @@ static irqreturn_t rt5677_irq(int unused, void *data)
 	int ret, loop, i, reg_irq, virq;
 	bool irq_fired = false;
 
-	mutex_lock(&rt5677->irq_lock);
+	guard(mutex)(&rt5677->irq_lock);
 
 	/*
 	 * Loop to handle interrupts until the last i2c read shows no pending
@@ -5370,7 +5363,6 @@ static irqreturn_t rt5677_irq(int unused, void *data)
 	}
 exit:
 	WARN_ON_ONCE(loop == 20);
-	mutex_unlock(&rt5677->irq_lock);
 	if (irq_fired)
 		return IRQ_HANDLED;
 	else
@@ -5399,7 +5391,7 @@ static void rt5677_resume_irq_check(struct work_struct *work)
 	 * Without this explicit check, unplug the headset right after suspend
 	 * starts, then after resume the headset is still shown as plugged in.
 	 */
-	mutex_lock(&rt5677->irq_lock);
+	guard(mutex)(&rt5677->irq_lock);
 	for (i = 0; i < RT5677_IRQ_NUM; i++) {
 		if (rt5677->irq_en & rt5677_irq_descs[i].enable_mask) {
 			virq = irq_find_mapping(rt5677->domain, i);
@@ -5407,7 +5399,6 @@ static void rt5677_resume_irq_check(struct work_struct *work)
 				handle_nested_irq(virq);
 		}
 	}
-	mutex_unlock(&rt5677->irq_lock);
 }
 
 static void rt5677_irq_bus_lock(struct irq_data *data)
-- 
2.43.0

