Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58F247DFA5
	for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 11:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778844336; cv=none; b=Z7axC/6I5au1Vqvt+dEL245mYFz/d2GzaDqNVRCXrDEBjIPs8sd5YHhEmDuUNZ6MgVWBYqDFp0AIQIQO5/yhUllEgf9peVCRjH2keLsIMbLCftW68wxcjrTAng7CusFz0ccOK9W7S315yRogPJPMp6up1KRR7RfC0Bc0ylIcBcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778844336; c=relaxed/simple;
	bh=iO/fPS1u+WSDfI9ZJLJOThXlGnmZiGdD5849oKxjuFo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ejG1T+XfRdIkfR4/3a6n2/AwpTYdx+oArHZiNgbPrlLkmAzuZ3lR8q2i+kca6Sre9E02/XMdlGrW4JXJwqhUymoqbcQV3wO6nxx+VsNT83sEbSYWz3M+ZK3IiOT6EW6f42OA/cBQCWuQbN+7PReIVJOEAG3/wSkEuyaNcISlCzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jdrXt7jf; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jdrXt7jf"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ba3e3c4f87so84479995ad.3
        for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 04:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778844334; x=1779449134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eh0yf1lgtPbRzrPbuzjigiZ2dhg3uZqppPUNeSjlJCQ=;
        b=jdrXt7jfgXMTbMTssl/3CDwdxRsKn9NYjvDtWNdUHJ+4LhA4qvnpQ2Ju2nViYmW0aX
         +xhXKBCk5MBI3MPQb2SV7ezKQUwogaSTXi9pFMr6Uiio7LSSCLjRazghNJjBZy4Xbhow
         7nluiIUkSpti49+8REXZ7HPexCYG56ZMcGIHnoSbbSEAL19Vuljrmw2/tRC7rIbhXGDL
         spwOVgOK1zzPJ9j7lA9g3PhXwLyFbFjz6s9Fo7hx+U9tDgHtp8aoSwg/HvrT4gMwytvS
         AzchH2JOSl0ceQ0lzy2nevyO1KD90O82xclOr4OK5sh/UKXFIhQ8qVnBNKJFLTz1d9xv
         VbEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778844334; x=1779449134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Eh0yf1lgtPbRzrPbuzjigiZ2dhg3uZqppPUNeSjlJCQ=;
        b=L9JQg5oLXc0kklMAYjWMRI7TYOstnE/zwb3nY/Xm2LPTeS9OR3awNN+ymMGs8/zbmY
         g7I7yflUE2cfpCew29W6+RBxtFerZKsIsQrilZAJSHDv6QFMEccCpokMeBEs6X+5E7/J
         R8cAM6YeddsfXKduIDA8RmTtmAvOBkVvKWElBQFw4CW9fqs0JmpnsR/vBd1rUZFNcqfm
         qiNKamkkw9DvSDXV8AwA+jjuYfzi79cPQkZeV8oS5REqhNh/2vk5cg//YgTITsnuodHJ
         R13qWVW3yOZdUcmMU3sUcdUzQuNVdHlUJBzmFN7Luqa7m8xOJFD97yyDiG2NsBgaV2w2
         3cHw==
X-Forwarded-Encrypted: i=1; AFNElJ9qmUZH6qWEiuN10iViQ1NBq56dmsFVpxyTJ/j42gidVQ5a/4EQF23Zcf0iHvyJDLDaju0YK4xknXAlwg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVyayH77v51dC/Vor8PIYNB/+uooDHQ+MF+VVrn3wdFWSZ4Xf2
	aoiOtVLnYwxxasZz77vEQmg4rEAQkaBPSSKngqxountwb1l88YqxIxsd
X-Gm-Gg: Acq92OEJm4KI8/wrKz1ctiABMnVrQx8CEy20C24xMw+3Qd0A43zr5xuIZLmInjK+knG
	Zsgj6Y+7OwRYLdkXfqgSuaZCDLoh98VvefJUgkoljA/R5Y4rh449AIAoRUq4ICgq5fRxzEqluLw
	Q/c22LLd6k2JVUfiQs/Nc1LoDTJrUmGsF4UaRjv+fRNVML7aMhKWhjoqex0VCBbGPLhxdM8F6lj
	SqrOvfg2fk9AlFX1AW3f8+piRgjS7DdSqvjNrRX5uQFhKvyGNVIZfShrB1uWkuLrZr4NykMCRQI
	3blBGvMbUlAXsuhqqwesJWW4dgcKbNt/rAEngKc0mPm9IFto0xCCYqbBEuu2Zt9KGuyxbnA27Nr
	JkNwr9z1pQ2GKSx2QXhEhfpHnbn3/TGEwGYLB74jqjZqpvOxLhoTFmJpRDhYbb1tM16gp8YbJG7
	qgATd4sIk5B+p7fjaDvkbmum3SWJ05PYqO7ynXg3amAe8p5n60169Y9hkmFZiQrOAIzMxq
X-Received: by 2002:a17:903:1250:b0:2bd:7bec:f0d8 with SMTP id d9443c01a7336-2bd7e8386dbmr42166865ad.13.1778844334085;
        Fri, 15 May 2026 04:25:34 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d0fd856sm54530385ad.66.2026.05.15.04.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:25:33 -0700 (PDT)
From: phucduc.bui@gmail.com
To: olivier.moysan@foss.st.com,
	arnaud.pouliquen@foss.st.com,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 4/4] ASoC: stm: stm32_spdifrx: Use guard() for spin locks
Date: Fri, 15 May 2026 18:24:58 +0700
Message-ID: <20260515112458.34378-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260515112458.34378-1-phucduc.bui@gmail.com>
References: <20260515112458.34378-1-phucduc.bui@gmail.com>
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

