Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFEE3BFE5B
	for <linux-sound@vger.kernel.org>; Wed, 29 Apr 2026 09:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777454209; cv=none; b=VlLS/cUIeGx7e9YkqUGAcFAGoJdKMl58GthSOhx3YRFVXmF+xYH/uGzcCyfTseh1mQUQz6e8H6xgeEf+NsuDkwA5wUaG0qD3xPqMKiCnnKu/gi3F4Ty3Uy9xBFLlXlXLicG8oLNbQoHbjIPHcVsSf4pWnfmB6QEv+DZE1RX3wdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777454209; c=relaxed/simple;
	bh=VjVSRWG2abSYsb/wTYHT+3dbM9kBQXjmurL6mO+xRKk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lXR1ooux9VxBr1sCI58CQnBOn3PXnZwgUFEZiR6c7MTGtdLz2KjBgR5Rkun9bHdYzMLjJO+m7Ww0NU+nJPCd7wDv44CBI+mNSAUCrDu816crDFDpPk8JxoVInRFbzhkU19N7mq5Sfeb3vE0Kc+Y9ztguLQMLkSzFEjPJe9cKPCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lPWBSdbt; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lPWBSdbt"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-82f8893bff3so5791600b3a.2
        for <linux-sound@vger.kernel.org>; Wed, 29 Apr 2026 02:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777454207; x=1778059007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wOQASXH1zi/ymC17DpxSnsJj0Xv7qAzrcrKjqR45UNg=;
        b=lPWBSdbtgNRXNAF8V2igYjCWgjxe2SpCwh1bgKJzs9q7p1C20j2DSA3sVu/Sn8TwLw
         YBb6P4TvN77wSNcEQoJ1UQ2MG4n9YDDR+RJDi7RJYc9wqtCisjD8jrc+dtxGaP0D0aPe
         9oV6McGLPoPNavRP9TJJFKc1orQLIcjLFoLIVr2GwfTxKacm06KQ8bpKeLIDULgBIqGd
         gBEgdOf9yzPhV8BRQCuLy6oZBQiJRlPw3CG6U9h+PZ8fU2cvUVlXOIzhoeG0UVrCPNoX
         BshN1YjzBiSOtEmcuXEp4CrtK24bavdXkK4JfiilFiMMdt2MFMeTACXXnCTSz1Vgrzmy
         +VPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777454207; x=1778059007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wOQASXH1zi/ymC17DpxSnsJj0Xv7qAzrcrKjqR45UNg=;
        b=s/djJUGovzj0wksTKNjHMzYE71Gvhtf3V7JTjeiXffGuZRV0u+bS9dMeeVcKOb4njh
         ihXRImjI7TWDwwaUSENUEj4OrxSaUJ9NYkckYpDBrRPEkB+OlmGgDaVUZ0CFD3FVb/og
         Az4+D0XETZI5KCaVnvJOfsxI6otzyHmX6XuoZ5cibrsnDCYxtQ87OHyL+ZlGwX11yARo
         b1Y+vMXgQ1aalrcIwKv1bZlYG0TGbXzynLI+6oDvBdgPSsQo5oTUGOOeoSE+LqW4O+25
         31p3iEtRoAo7EbTPQKZAgJAL+WjDBeLaMjTPb8DgPc+q0PlQt2YTOsfg6fr+2Rz0WHvT
         +N0g==
X-Forwarded-Encrypted: i=1; AFNElJ8Lek0t0I/KKsTXFDj4EhlyYynmk8NEdtlBPAi4fZ8Z1QMKDxjbcU0dLzcleTtdyFpzs/Z3qZfVhPi3WQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YySeIGSnZbr2cOxrz/1eJ8FUFdenDY9Csbz1UIH5MTfm4EJwO7q
	g4OyIXjfm484zUjaqCaQTrioxLAAOBKTiTaTBmIJPAZHSidXCl8F06Ou
X-Gm-Gg: AeBDievKrzf1YMMypRqURP9ODGnpPYPJDuXCyIjErap3KbT91XZIODLrbFp/4U0yPpa
	Gb/rcMRQNuX8MmYuV2D+k4rwmN1Ra3b1P6qRSsY1Ha+icjbyhT/wIM9IeIZ/1xdJFDKgr4BMdHb
	6L+8l13nJ4Xr5rt4H4L7ttHVWqnEqGZzmpnb6tNxXNBJg39z+XdInLt7e+S6HSRc12MiMz86QFO
	EC7RTe3O1SutvxRPPfuNLCkuqU/edsgYb/AM2oeOXhndy+Ro/zzWVaH4ATGmTURqS9zWozAi+ph
	HRPde3qlQCp2Rn72xVY/G0c7kFfxSYfapCaokApWO+vT315pLxh4RBeih3qTedMDnBFvYIOpNMw
	2aCXFubQM86ZVgru3J6q8I4R3W/3d+TT1E2muGXwkeT47SH3uUOHefqsa6lQ9+khX7vlQi66mhM
	HY2FF8eBDTYLuFK9A3GxC6b5Hn+vr6Lhn+KeBAw2V7v5O/5r89VNri00UaFyV9wc4Fu1k1
X-Received: by 2002:a05:6a00:1885:b0:82f:5c3f:94c6 with SMTP id d2e1a72fcca58-834ddc146c3mr6886356b3a.28.1777454207406;
        Wed, 29 Apr 2026 02:16:47 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed5cd3b8sm1586865b3a.16.2026.04.29.02.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 02:16:47 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Joris Verhaegen <verhaegen@google.com>,
	Miller Liang <millerliang@google.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/2] ASoC: uniphier: aio-dma: Use guard() for spin locks
Date: Wed, 29 Apr 2026 16:16:14 +0700
Message-ID: <20260429091614.96667-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429091614.96667-1-phucduc.bui@gmail.com>
References: <20260429091614.96667-1-phucduc.bui@gmail.com>
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
 sound/soc/uniphier/aio-dma.c | 52 ++++++++++++++++--------------------
 1 file changed, 23 insertions(+), 29 deletions(-)

diff --git a/sound/soc/uniphier/aio-dma.c b/sound/soc/uniphier/aio-dma.c
index c1ca55997103..c01eae55d4fc 100644
--- a/sound/soc/uniphier/aio-dma.c
+++ b/sound/soc/uniphier/aio-dma.c
@@ -32,15 +32,15 @@ static void aiodma_pcm_irq(struct uniphier_aio_sub *sub)
 		runtime->channels * samples_to_bytes(runtime, 1);
 	int ret;
 
-	spin_lock(&sub->lock);
-	ret = aiodma_rb_set_threshold(sub, runtime->dma_bytes,
-				      sub->threshold + bytes);
-	if (!ret)
-		sub->threshold += bytes;
-
-	aiodma_rb_sync(sub, runtime->dma_addr, runtime->dma_bytes, bytes);
-	aiodma_rb_clear_irq(sub);
-	spin_unlock(&sub->lock);
+	scoped_guard(spinlock, &sub->lock) {
+		ret = aiodma_rb_set_threshold(sub, runtime->dma_bytes,
+					      sub->threshold + bytes);
+		if (!ret)
+			sub->threshold += bytes;
+
+		aiodma_rb_sync(sub, runtime->dma_addr, runtime->dma_bytes, bytes);
+		aiodma_rb_clear_irq(sub);
+	}
 
 	snd_pcm_period_elapsed(sub->substream);
 }
@@ -51,15 +51,15 @@ static void aiodma_compr_irq(struct uniphier_aio_sub *sub)
 	int bytes = runtime->fragment_size;
 	int ret;
 
-	spin_lock(&sub->lock);
-	ret = aiodma_rb_set_threshold(sub, sub->compr_bytes,
-				      sub->threshold + bytes);
-	if (!ret)
-		sub->threshold += bytes;
+	scoped_guard(spinlock, &sub->lock) {
+		ret = aiodma_rb_set_threshold(sub, sub->compr_bytes,
+					      sub->threshold + bytes);
+		if (!ret)
+			sub->threshold += bytes;
 
-	aiodma_rb_sync(sub, sub->compr_addr, sub->compr_bytes, bytes);
-	aiodma_rb_clear_irq(sub);
-	spin_unlock(&sub->lock);
+		aiodma_rb_sync(sub, sub->compr_addr, sub->compr_bytes, bytes);
+		aiodma_rb_clear_irq(sub);
+	}
 
 	snd_compr_fragment_elapsed(sub->cstream);
 }
@@ -113,18 +113,16 @@ static int uniphier_aiodma_prepare(struct snd_soc_component *component,
 	struct uniphier_aio_sub *sub = &aio->sub[substream->stream];
 	int bytes = runtime->period_size *
 		runtime->channels * samples_to_bytes(runtime, 1);
-	unsigned long flags;
 	int ret;
 
 	ret = aiodma_ch_set_param(sub);
 	if (ret)
 		return ret;
 
-	spin_lock_irqsave(&sub->lock, flags);
-	ret = aiodma_rb_set_buffer(sub, runtime->dma_addr,
-				   runtime->dma_addr + runtime->dma_bytes,
-				   bytes);
-	spin_unlock_irqrestore(&sub->lock, flags);
+	scoped_guard(spinlock_irqsave, &sub->lock)
+		ret = aiodma_rb_set_buffer(sub, runtime->dma_addr,
+					   runtime->dma_addr + runtime->dma_bytes,
+					   bytes);
 	if (ret)
 		return ret;
 
@@ -141,9 +139,8 @@ static int uniphier_aiodma_trigger(struct snd_soc_component *component,
 	struct device *dev = &aio->chip->pdev->dev;
 	int bytes = runtime->period_size *
 		runtime->channels * samples_to_bytes(runtime, 1);
-	unsigned long flags;
 
-	spin_lock_irqsave(&sub->lock, flags);
+	guard(spinlock_irqsave)(&sub->lock);
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 		aiodma_rb_sync(sub, runtime->dma_addr, runtime->dma_bytes,
@@ -161,7 +158,6 @@ static int uniphier_aiodma_trigger(struct snd_soc_component *component,
 		dev_warn(dev, "Unknown trigger(%d) ignored\n", cmd);
 		break;
 	}
-	spin_unlock_irqrestore(&sub->lock, flags);
 
 	return 0;
 }
@@ -176,17 +172,15 @@ static snd_pcm_uframes_t uniphier_aiodma_pointer(
 	struct uniphier_aio_sub *sub = &aio->sub[substream->stream];
 	int bytes = runtime->period_size *
 		runtime->channels * samples_to_bytes(runtime, 1);
-	unsigned long flags;
 	snd_pcm_uframes_t pos;
 
-	spin_lock_irqsave(&sub->lock, flags);
+	guard(spinlock_irqsave)(&sub->lock);
 	aiodma_rb_sync(sub, runtime->dma_addr, runtime->dma_bytes, bytes);
 
 	if (sub->swm->dir == PORT_DIR_OUTPUT)
 		pos = bytes_to_frames(runtime, sub->rd_offs);
 	else
 		pos = bytes_to_frames(runtime, sub->wr_offs);
-	spin_unlock_irqrestore(&sub->lock, flags);
 
 	return pos;
 }
-- 
2.43.0

