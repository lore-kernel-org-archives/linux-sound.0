Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269943FBEC2
	for <linux-sound@vger.kernel.org>; Wed, 13 May 2026 10:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778669053; cv=none; b=dIamxtUTESI6JfUdCKPZyWGgabAZ35xvTVl30g3xCSudDT0KDzC9W4hl5Vz8FIS8sFCLjZX5wLdMep2f730o3qmjC3nV2YQpCLx49SZw5xSx1EkKs7omAkY0UotonAcNpJDVUAuIXzKT1K2nU9SIsmdFE8vUL1oXYXCVvzjUMCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778669053; c=relaxed/simple;
	bh=iO/fPS1u+WSDfI9ZJLJOThXlGnmZiGdD5849oKxjuFo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gpmXcFGOS9PGoLkzAV5DX75iekbRUb7dMDwvLIdPqJcLC1fFz2RaPDCYpyLlMKlO090COR3XqKstNJkovrvYbYnNunBKe1gIHhsR7TaKbL7FtgpVdIVCKy3rysnKFrUIG1jLBu2O1F/tYgNbed2kro8IRsr6ctCgXcxCsGthadQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MfWtFtPY; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MfWtFtPY"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c70ea5e9e9dso2725816a12.1
        for <linux-sound@vger.kernel.org>; Wed, 13 May 2026 03:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778669051; x=1779273851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eh0yf1lgtPbRzrPbuzjigiZ2dhg3uZqppPUNeSjlJCQ=;
        b=MfWtFtPYMVwqbRoYQ3KPwiOcgqgRPYedaJrridbed/KwfbvJCL4LuXqLR3jwHzFUaj
         jjD9VXhwIoUbcUZx59+yn5JSYO0VwGIpm0LTNN5MXIfEFAzLc6jMLlZ0x1JqvG9DulNx
         IOY79voBIjtOi9ITdBh+L27ceFrDHq1dFdyP6tFZawLG9vpk8qcOvfOiUo/EBAKl9y2r
         TXvdFT/iNvGE1lWBUIjDYJrPe9U1soi4Tu06nN6+Jp21oxSaN3ji3ArHVqFBE+hG3UyA
         CXqAK7Er7KDlJqU21TpBxkiAjtcvtlK9OLaHx95l/u5oeE5cvVNj/Iwd0AJI+jCJ3Nyx
         xeYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778669051; x=1779273851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Eh0yf1lgtPbRzrPbuzjigiZ2dhg3uZqppPUNeSjlJCQ=;
        b=k3rKINRr03F9wPxni5qXmfC8eJaUZ7StUuNx9sMbyc6cUGBmcvePtomT0j5Njs0b3b
         ZiCsx962gSNl/mS5xyOgm3p4ueDLdIijsJgEgboC+QmLFMZOxaRNAYAJmnimfQNOHHPp
         nrw7R9BRQFnXKF5fZA84Sd5vjqKFqNmXyFLnwEXRG78A3v1RMNnF5oJalpzT3W0pDqN5
         nBl9FMR7Etc62UK5oHLcSovCYfdFSa7evhYYk3zB8BMfMaym1z0V/tTtEcUeRtGVzzN/
         7b9aVeccKgLKUoMfpwp4L0s9hiOtMHmXbEz2KIcIIcGhcOOpOqzmVVO02MHs2VCTo9lf
         XmYQ==
X-Forwarded-Encrypted: i=1; AFNElJ+2+1z5GrmRg5Fc5OUPk8qCho1+h6+gKF21/Z9H71p5pWABl+u4WHwE2Eu0Mt7f+O4TVSyOAaJk7VJqOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFxCwG1kWiy06W45zvbvX8j78wAkvLG2mGNH+l8FmQlIkI6fS5
	sc0fJYxB0GdluiofSPirAh/+PjQjbOZ4wukd7/VbZN5ff+FqjDAKV87F
X-Gm-Gg: Acq92OGhDszNr62dT75b+0sf9z0LuQlfJESp+FYjNlKQuAJXzoEJJZcSdMUFmzA6bsa
	Xtp7imkXAWFSyrEhp+6NMXtdPbNpmpYxsA9nRVs4SQpEVUc1yO3Z4apz2gxW8tfaqmTllEX+kvT
	U5ynVJQBuRfks8rdg6/oyIdZNKpKTMxnwSO1Wf+x37NI6wCXxPBIb6f4KGuvirNOqLeIXJ9sf7+
	Lh54FXRn0fzsWe1l1aiqmPsvj1Ok6j1EWMwBjVplIoiqbRykMfjtKjsIJorVWR+Ducg/KMDLlNs
	skIQXKW1HjaIpUvYNSdWoMY182vpmAJgXKgNmgF8/i/WlH0FnnJiGWxbuav4edNHwpVIl9ntnIL
	DS1pQAZEs7sDmXI+99hy7FMl84d817Rx+Nbf4chz43LZUIjiWHNYuJohxPCIiSDqpIE9zNKFOqX
	yXHDm+1TatbODK3asm3Cb7c7XRJP3efbIytOGTzJUtwlgwZgzef6dW6KRICQ==
X-Received: by 2002:a17:903:3843:b0:2b2:4260:109 with SMTP id d9443c01a7336-2bd275c6580mr30109575ad.23.1778669051359;
        Wed, 13 May 2026 03:44:11 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e35e9dsm170479535ad.39.2026.05.13.03.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 03:44:11 -0700 (PDT)
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
Subject: [PATCH 4/4] ASoC: stm: stm32_spdifrx: Use guard() for spin locks
Date: Wed, 13 May 2026 17:43:29 +0700
Message-ID: <20260513104329.81592-5-phucduc.bui@gmail.com>
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
 sound/soc/stm/stm32_spdifrx.c | 44 +++++++++++++----------------------
 1 file changed, 16 insertions(+), 28 deletions(-)

diff --git a/sound/soc/stm/stm32_spdifrx.c b/sound/soc/stm/stm32_spdifrx.c
index 57b711c44278..2f83ca989e68 100644
--- a/sound/soc/stm/stm32_spdifrx.c
+++ b/sound/soc/stm/stm32_spdifrx.c
@@ -322,7 +322,6 @@ static void stm32_spdifrx_dma_ctrl_stop(struct stm32_spdifrx_data *spdifrx)
 static int stm32_spdifrx_start_sync(struct stm32_spdifrx_data *spdifrx)
 {
 	int cr, cr_mask, imr, ret;
-	unsigned long flags;
 
 	/* Enable IRQs */
 	imr = SPDIFRX_IMR_IFEIE | SPDIFRX_IMR_SYNCDIE | SPDIFRX_IMR_PERRIE;
@@ -330,7 +329,7 @@ static int stm32_spdifrx_start_sync(struct stm32_spdifrx_data *spdifrx)
 	if (ret)
 		return ret;
 
-	spin_lock_irqsave(&spdifrx->lock, flags);
+	guard(spinlock_irqsave)(&spdifrx->lock);
 
 	spdifrx->refcount++;
 
@@ -365,22 +364,17 @@ static int stm32_spdifrx_start_sync(struct stm32_spdifrx_data *spdifrx)
 				"Failed to start synchronization\n");
 	}
 
-	spin_unlock_irqrestore(&spdifrx->lock, flags);
-
 	return ret;
 }
 
 static void stm32_spdifrx_stop(struct stm32_spdifrx_data *spdifrx)
 {
 	int cr, cr_mask, reg;
-	unsigned long flags;
 
-	spin_lock_irqsave(&spdifrx->lock, flags);
+	guard(spinlock_irqsave)(&spdifrx->lock);
 
-	if (--spdifrx->refcount) {
-		spin_unlock_irqrestore(&spdifrx->lock, flags);
+	if (--spdifrx->refcount)
 		return;
-	}
 
 	cr = SPDIFRX_CR_SPDIFENSET(SPDIFRX_SPDIFEN_DISABLE);
 	cr_mask = SPDIFRX_CR_SPDIFEN_MASK | SPDIFRX_CR_RXDMAEN;
@@ -396,8 +390,6 @@ static void stm32_spdifrx_stop(struct stm32_spdifrx_data *spdifrx)
 	/* dummy read to clear CSRNE and RXNE in status register */
 	regmap_read(spdifrx->regmap, STM32_SPDIFRX_DR, &reg);
 	regmap_read(spdifrx->regmap, STM32_SPDIFRX_CSR, &reg);
-
-	spin_unlock_irqrestore(&spdifrx->lock, flags);
 }
 
 static int stm32_spdifrx_dma_ctrl_register(struct device *dev,
@@ -744,19 +736,19 @@ static irqreturn_t stm32_spdifrx_isr(int irq, void *devid)
 			return IRQ_HANDLED;
 		}
 
-		spin_lock(&spdifrx->irq_lock);
-		if (spdifrx->substream)
-			snd_pcm_stop(spdifrx->substream,
-				     SNDRV_PCM_STATE_DISCONNECTED);
-		spin_unlock(&spdifrx->irq_lock);
+		scoped_guard(spinlock, &spdifrx->irq_lock) {
+			if (spdifrx->substream)
+				snd_pcm_stop(spdifrx->substream,
+					     SNDRV_PCM_STATE_DISCONNECTED);
+		}
 
 		return IRQ_HANDLED;
 	}
 
-	spin_lock(&spdifrx->irq_lock);
-	if (err_xrun && spdifrx->substream)
-		snd_pcm_stop_xrun(spdifrx->substream);
-	spin_unlock(&spdifrx->irq_lock);
+	scoped_guard(spinlock, &spdifrx->irq_lock) {
+		if (err_xrun && spdifrx->substream)
+			snd_pcm_stop_xrun(spdifrx->substream);
+	}
 
 	return IRQ_HANDLED;
 }
@@ -765,12 +757,10 @@ static int stm32_spdifrx_startup(struct snd_pcm_substream *substream,
 				 struct snd_soc_dai *cpu_dai)
 {
 	struct stm32_spdifrx_data *spdifrx = snd_soc_dai_get_drvdata(cpu_dai);
-	unsigned long flags;
 	int ret;
 
-	spin_lock_irqsave(&spdifrx->irq_lock, flags);
-	spdifrx->substream = substream;
-	spin_unlock_irqrestore(&spdifrx->irq_lock, flags);
+	scoped_guard(spinlock_irqsave, &spdifrx->irq_lock)
+		spdifrx->substream = substream;
 
 	ret = clk_prepare_enable(spdifrx->kclk);
 	if (ret)
@@ -846,11 +836,9 @@ static void stm32_spdifrx_shutdown(struct snd_pcm_substream *substream,
 				   struct snd_soc_dai *cpu_dai)
 {
 	struct stm32_spdifrx_data *spdifrx = snd_soc_dai_get_drvdata(cpu_dai);
-	unsigned long flags;
 
-	spin_lock_irqsave(&spdifrx->irq_lock, flags);
-	spdifrx->substream = NULL;
-	spin_unlock_irqrestore(&spdifrx->irq_lock, flags);
+	scoped_guard(spinlock_irqsave, &spdifrx->irq_lock)
+		spdifrx->substream = NULL;
 
 	clk_disable_unprepare(spdifrx->kclk);
 }
-- 
2.43.0

