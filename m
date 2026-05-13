Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E1D3914F0
	for <linux-sound@vger.kernel.org>; Wed, 13 May 2026 10:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778669043; cv=none; b=nzr+ZqAxgE6zaCVMFHKC4T+HQEeOGeTGskT74rAKpMl19YOycIVXTmjI7QEPzcs4zLD8XoxxaLr1V+CFhE1aJbrYm+WVZhUarm5UASYBmedJkihV9NwKdcHh20h5saakGmDjvdzUoEAD6pS4tRtVpFIWiLeCi/smdVgJsgFnXB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778669043; c=relaxed/simple;
	bh=pochR1mT5sxaS/wL+pdizgPHRe5KbjTluVM0TKx7yHU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dZdtGzO/3X0/BE+crRWu/R68IVeRv8dRbFC6vY2H3lC1ebpZnKynXvIZO4xE6sPkkP/Mc+CS1VFNgQT04iqitvDwvzvlh+OiGTu9V5mQ/JFYR5t4tK4OScC88UUTIoM3WaUIuVgddHhy3pAbXktZ+EdXk2QmN/PEX2ek9GwM4uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XTNcEl+F; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XTNcEl+F"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2b4583f0a1aso43290065ad.3
        for <linux-sound@vger.kernel.org>; Wed, 13 May 2026 03:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778669041; x=1779273841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/lGs9D+YRCQGi58C7TkoM1KuAOJdJ2M4q7kERCI4rfg=;
        b=XTNcEl+F5pofgP7IpimD2kKzuYmavFsGyyLrQJ+pv2dV4dfipQZRvXVUS5S23cEfHc
         l6rlHx1G//UWEg/NcTaDJqCi45EDEzGKVBQiueF/XuIg0ncQoBLhFvdkKoLON0/+RhMy
         4vZUfI3mfO93hnRrGZanivpKaDLbXN7tfYnzK+gHuyRIIV8O18tHQo1exaZ3m9C8tr16
         l+ovrXHgac/HixBFjRdMf8GXGb7SAwQc0MrQBqtUAUxcnWxJdiwLfNMCEMG90xrYmTHp
         DisbrYGsN3SjEq/ZVGUJCz1AROk/nwo4NsKcExJ/XUgmW450ctqezlm86aa/dMEUNaLE
         RXyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778669041; x=1779273841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/lGs9D+YRCQGi58C7TkoM1KuAOJdJ2M4q7kERCI4rfg=;
        b=oS/k+4WeLoRFLXZ9gdTNdi7XpTaaisUp/UcUkpHRvAbHcCXHc8tdaLtJCDha4NsA8F
         oVMyqZAv9n7zyEo8FLkwq5ZbQPO3v40ZBpifS/7pdCY02VYECHjRN9nQviK2Jj9E15CZ
         46uGPfNOZNlbqurAjkGgg9dHUwQpCQNUFWvNlZNEd+3LADak3g5068oTcrKw+a1iRlAW
         vA2t0ihuS4WbqSNlb+cCi+qsdW6VUvvOU3biEJhyYs1ohV+Pz7NGQHhxPcHrmfLtocIr
         OE956I8dm6wD3RdaV3/9Z3XTc7JcQ+F0cXh7RN1P2RSqRIE2U7Zu0PRXUxxo8YI1cZ+t
         wNSQ==
X-Forwarded-Encrypted: i=1; AFNElJ96AowI+OdH/2hdemdQR4bUGsf6wtnFNHN/6+7AEpYihgvksvyYtafCZYJrEfPPca5bx6JGHZuiZTmemw==@vger.kernel.org
X-Gm-Message-State: AOJu0YynAcDrYEko4W4nNt9/wHq6Sj2xoAH95xIC8UhKs10LTdilmjVj
	XweCn49wB4zlm4H4OiwEyLz3w5ejBDUGUtT/PowzOhXegcGlQC97mpWH
X-Gm-Gg: Acq92OGnPyH2jDld2O6P+TWyjYSfFtXR9nCZG1N4EO82AVpIOny2pc2agQI3jvZGPQo
	wVLL4Ad+JKaMUklDm7o+sKiAAqXWUQOtiTCmH+XBTUWBH00Kw4Qv9GdvO5CZTeNLUgQf3AxKClP
	TQAyNzpVQx4dZ/oE5rcHhnw3BzjpS6ySlHoEdS966ilCtr+uCSWZkRvSWunPtMq8JMC9hfcVlyq
	z4s/bbKtI6jFE/0qpYhm48VKNwoduR96hc7GzG4l/DgWei7e2qgCHGOotGptyxOqBH3BbqKzkBN
	KPhMqnlTal+syr1txG56nuEhUyIhMcsmSqnu6ZhYmlOcQk17BeJR0PkKVkugLxfpZZ0EC3VyAk/
	3LK3NcC+0y3FCea+h/m+z1HMzJJYLQhY+fRXPW7TMRaiNyWLzDoVKMAW2uX2wMama4DXDGnxU8i
	V5zOv6u+uhcsu7JmLwSgMNrN7lUz6NvuWPJDiMOmJsuGEUbR627n8Kird/TA==
X-Received: by 2002:a17:903:183:b0:2bd:3bfa:51fe with SMTP id d9443c01a7336-2bd3bfa6e4fmr11597115ad.41.1778669041190;
        Wed, 13 May 2026 03:44:01 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e35e9dsm170479535ad.39.2026.05.13.03.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 03:44:01 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Olivier Moysan <olivier.moysan@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/4] ASoC: stm: stm32_i2s: Use guard() for spin locks
Date: Wed, 13 May 2026 17:43:27 +0700
Message-ID: <20260513104329.81592-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513104329.81592-1-phucduc.bui@gmail.com>
References: <20260513104329.81592-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/stm/stm32_i2s.c | 67 ++++++++++++++++++---------------------
 1 file changed, 30 insertions(+), 37 deletions(-)

diff --git a/sound/soc/stm/stm32_i2s.c b/sound/soc/stm/stm32_i2s.c
index 6ca21780f21d..4fddb7ecd7fd 100644
--- a/sound/soc/stm/stm32_i2s.c
+++ b/sound/soc/stm/stm32_i2s.c
@@ -615,10 +615,10 @@ static irqreturn_t stm32_i2s_isr(int irq, void *devid)
 	if (flags & I2S_SR_TIFRE)
 		dev_dbg(&pdev->dev, "Frame error\n");
 
-	spin_lock(&i2s->irq_lock);
-	if (err && i2s->substream)
-		snd_pcm_stop_xrun(i2s->substream);
-	spin_unlock(&i2s->irq_lock);
+	scoped_guard(spinlock, &i2s->irq_lock) {
+		if (err && i2s->substream)
+			snd_pcm_stop_xrun(i2s->substream);
+	}
 
 	return IRQ_HANDLED;
 }
@@ -905,12 +905,10 @@ static int stm32_i2s_startup(struct snd_pcm_substream *substream,
 			     struct snd_soc_dai *cpu_dai)
 {
 	struct stm32_i2s_data *i2s = snd_soc_dai_get_drvdata(cpu_dai);
-	unsigned long flags;
 	int ret;
 
-	spin_lock_irqsave(&i2s->irq_lock, flags);
-	i2s->substream = substream;
-	spin_unlock_irqrestore(&i2s->irq_lock, flags);
+	scoped_guard(spinlock_irqsave, &i2s->irq_lock)
+		i2s->substream = substream;
 
 	if ((i2s->fmt & SND_SOC_DAIFMT_FORMAT_MASK) != SND_SOC_DAIFMT_DSP_A)
 		snd_pcm_hw_constraint_single(substream->runtime,
@@ -982,19 +980,19 @@ static int stm32_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 		regmap_write_bits(i2s->regmap, STM32_I2S_IFCR_REG,
 				  I2S_IFCR_MASK, I2S_IFCR_MASK);
 
-		spin_lock(&i2s->lock_fd);
-		i2s->refcount++;
-		if (playback_flg) {
-			ier = I2S_IER_UDRIE;
-		} else {
-			ier = I2S_IER_OVRIE;
-
-			if (STM32_I2S_IS_MASTER(i2s) && i2s->refcount == 1)
-				/* dummy write to gate bus clocks */
-				regmap_write(i2s->regmap,
-					     STM32_I2S_TXDR_REG, 0);
+		scoped_guard(spinlock, &i2s->lock_fd) {
+			i2s->refcount++;
+			if (playback_flg) {
+				ier = I2S_IER_UDRIE;
+			} else {
+				ier = I2S_IER_OVRIE;
+
+				if (STM32_I2S_IS_MASTER(i2s) && i2s->refcount == 1)
+					/* dummy write to gate bus clocks */
+					regmap_write(i2s->regmap,
+						     STM32_I2S_TXDR_REG, 0);
+			}
 		}
-		spin_unlock(&i2s->lock_fd);
 
 		if (STM32_I2S_IS_SLAVE(i2s))
 			ier |= I2S_IER_TIFREIE;
@@ -1016,21 +1014,18 @@ static int stm32_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 					   I2S_IER_OVRIE,
 					   (unsigned int)~I2S_IER_OVRIE);
 
-		spin_lock(&i2s->lock_fd);
-		i2s->refcount--;
-		if (i2s->refcount) {
-			spin_unlock(&i2s->lock_fd);
-			break;
-		}
+		scoped_guard(spinlock, &i2s->lock_fd) {
+			i2s->refcount--;
+			if (i2s->refcount)
+				break;
 
-		ret = regmap_update_bits(i2s->regmap, STM32_I2S_CR1_REG,
-					 I2S_CR1_SPE, 0);
-		if (ret < 0) {
-			dev_err(cpu_dai->dev, "Error %d disabling I2S\n", ret);
-			spin_unlock(&i2s->lock_fd);
-			return ret;
+			ret = regmap_update_bits(i2s->regmap, STM32_I2S_CR1_REG,
+						 I2S_CR1_SPE, 0);
+			if (ret < 0) {
+				dev_err(cpu_dai->dev, "Error %d disabling I2S\n", ret);
+				return ret;
+			}
 		}
-		spin_unlock(&i2s->lock_fd);
 
 		cfg1_mask = I2S_CFG1_RXDMAEN | I2S_CFG1_TXDMAEN;
 		regmap_update_bits(i2s->regmap, STM32_I2S_CFG1_REG,
@@ -1047,7 +1042,6 @@ static void stm32_i2s_shutdown(struct snd_pcm_substream *substream,
 			       struct snd_soc_dai *cpu_dai)
 {
 	struct stm32_i2s_data *i2s = snd_soc_dai_get_drvdata(cpu_dai);
-	unsigned long flags;
 
 	clk_disable_unprepare(i2s->i2sclk);
 
@@ -1059,9 +1053,8 @@ static void stm32_i2s_shutdown(struct snd_pcm_substream *substream,
 	if (!i2s->i2smclk && i2s->put_i2s_clk_rate)
 		i2s->put_i2s_clk_rate(i2s);
 
-	spin_lock_irqsave(&i2s->irq_lock, flags);
-	i2s->substream = NULL;
-	spin_unlock_irqrestore(&i2s->irq_lock, flags);
+	scoped_guard(spinlock_irqsave, &i2s->irq_lock)
+		i2s->substream = NULL;
 }
 
 static int stm32_i2s_dai_probe(struct snd_soc_dai *cpu_dai)
-- 
2.43.0

