Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43AC3876D2
	for <linux-sound@vger.kernel.org>; Thu, 23 Apr 2026 12:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776949029; cv=none; b=WdAx9hIJOACyK0iYD/k5qFJhDTDhydKEx1a8DPhZdNlST4t8e0GbWq/6uB35hsX8KjDKuLdtEkYCrwb9s4TFZ9dsTupWoPmbIV+LrTCw2+Bs6cG7r8kmW0fvs0FtIq4gcmizlfE23AIKM6D06n5qlPsel+1RJ22Yu3qoPSgM8Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776949029; c=relaxed/simple;
	bh=GIkxtpx0BE3fXD43iaaw+MEIaw5f7zEFtAUUx/Zpkfg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gaxRLohN2FpibZS9o3fZYPlcaVh01Vy7H5Rz4jquLES0+BajrNtKSQlxA77MKE5fpZ03tgX8QGxCStYjSSbBB/ldungKlq5A3S1FMheCGIHnr0bDVBQEtbf4ukK2CYz/lFWvVciVbABKrR3vGtRY9A552WyOcgfsqRBJiWwyQCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DZwQH0vP; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DZwQH0vP"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2b7adb38d65so5599775ad.2
        for <linux-sound@vger.kernel.org>; Thu, 23 Apr 2026 05:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776949027; x=1777553827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XYBc3dkqRtOvVCHHPogLuoxYhZu8BUNU+Mge5yqLcH0=;
        b=DZwQH0vPdwKp5YiaC4YFvgLDSRfCqAZEGIM3n86Ybe7qFfsb5sSIeyPNCn/gcQ/J41
         9bCafTi1zeH1gwRIX+W9vY9i4sC4+dC3n1XnPTSnJ8H+g0nz9iB2K3xkUYBsoxDOOusq
         lfMJxEnHq4zyfAJXrJ/S921i7CQXRuImbqxiyGvhHBSgWzVSarB1tvts8XPaqyXCWrA1
         fY2fkDMNXuKnHr5lvWiA1Wjid7eSK7cYZNC6/35Z0so1yOeLfiWnBDzb5zqXelRWUNZV
         hP7028v9MRGLtj4OvkVLiygdzH8rwSuOFzdj1M3Me5lwruagUZsCdIBtrhN3UHbfFOTU
         2BZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776949027; x=1777553827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XYBc3dkqRtOvVCHHPogLuoxYhZu8BUNU+Mge5yqLcH0=;
        b=TgpGNeOAQivPPx1JXKU1BX1xVtFBjNIV/bzpNDzIgpizhNh87rCcYz6f3FbHK8tBV/
         v80SL59NP35jlFEXIbnvBHd/DUW7QRdFiqLGgOVz9I6FNuNJrA33msxLhFf23jWtOxGB
         2mq4MEQSpVNm8OAllm5i3F6Nb2sAAIVKhHQ2rPLN+eCZzodR5tUjpU3HplHHystf9gTb
         ldgYfqMyKWisb21TXHZNsMA9ICD5MFVTBFOvQQa9BRc0yVv3rJYVk8pXPSpohJSVUrUD
         OTMfnrwTFTZSlYXwQ7urteWgeRQGe6pmBsF5LM9wN0G/JyqoUNRKDd0qslHvtc8EKnTe
         nH0A==
X-Forwarded-Encrypted: i=1; AFNElJ/aXFoB8R2vUFUQDGhWPeq72ayatJjmt6sBZnO7+HsgV5W9788Sg7z831nw9fxTGve3YNuiztg3H1mehw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw59QadfkJer9t60fc0pfJYCmKfEPkXGxsDkkoQa15LqkLUnnQK
	mNMllWLwsWgkIsPfVfxmtEgG5dPKX3Zo27NXfu7VlybgBjCXj//iOQup
X-Gm-Gg: AeBDievvEZagM6kVRAiC5IlS4Bwau8ybXA1u6V5YvMJ7kY9cxzkh4bRBnZESAN8Tku/
	bgouKzbd1U1ABT3e3URAu5KdP9MCdM0kW8aIA1UZRFk5WOjg/c+SzzNKQaaPjZGznC4SJhqf5iY
	9MG3LhgQOzSJCO6ebuZRYyvaMZHXAhNoh5JljmnDFvWM6C4n7mDgFt66N5hDnO7ZC0py484bRZV
	xzPn/4S42lkNVg/fIcqbjsGeSicDSVk/6s1BVx+jqd/jbaHoX9ldM9QnOeVxnSQEFiAQM5SRxk3
	qqInqOtXA3M7VrTG8O8wFlGfk8kJpicduX7V7UEdy7iyv+8y69DZ74ou1BVlBeP23/SpNyTHq0/
	uXUbIspyXlBzTnCGl1wHdLyHor3TQroDZL2HbRx1FyTzDsIqCp2f7b3R6L3mV+BTWRbqZ8C5+uL
	fRg9H1OuM4y5cG8K4pcGIYGLBlKxrNKjNc3atp+edCeM2wNeNaSrChGDY5ju7QPcYEydHE
X-Received: by 2002:a17:903:17cf:b0:2ad:bd4c:a5 with SMTP id d9443c01a7336-2b5f9e64d7fmr275396845ad.1.1776949027169;
        Thu, 23 Apr 2026 05:57:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff390sm192106545ad.9.2026.04.23.05.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:57:06 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	asahi@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/5] ASoC: samsung: i2s: Use guard() for spin locks
Date: Thu, 23 Apr 2026 19:56:42 +0700
Message-ID: <20260423125646.156599-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423125646.156599-1-phucduc.bui@gmail.com>
References: <20260423125646.156599-1-phucduc.bui@gmail.com>
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
 sound/soc/samsung/i2s.c | 118 +++++++++++++++++-----------------------
 1 file changed, 50 insertions(+), 68 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 140907a41a70..f80f697a5d55 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -510,14 +510,13 @@ static int i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id, unsigned int rfs,
 	unsigned int cdcon_mask = 1 << i2s_regs->cdclkcon_off;
 	unsigned int rsrc_mask = 1 << i2s_regs->rclksrc_off;
 	u32 mod, mask, val = 0;
-	unsigned long flags;
 	int ret = 0;
 
 	pm_runtime_get_sync(dai->dev);
 
-	spin_lock_irqsave(&priv->lock, flags);
-	mod = readl(priv->addr + I2SMOD);
-	spin_unlock_irqrestore(&priv->lock, flags);
+	scoped_guard(spinlock_irqsave, &priv->lock)
+		mod = readl(priv->addr + I2SMOD);
+
 
 	switch (clk_id) {
 	case SAMSUNG_I2S_OPCLK:
@@ -612,11 +611,11 @@ static int i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id, unsigned int rfs,
 		goto err;
 	}
 
-	spin_lock_irqsave(&priv->lock, flags);
-	mod = readl(priv->addr + I2SMOD);
-	mod = (mod & ~mask) | val;
-	writel(mod, priv->addr + I2SMOD);
-	spin_unlock_irqrestore(&priv->lock, flags);
+	scoped_guard(spinlock_irqsave, &priv->lock) {
+		mod = readl(priv->addr + I2SMOD);
+		mod = (mod & ~mask) | val;
+		writel(mod, priv->addr + I2SMOD);
+	}
 done:
 	pm_runtime_put(dai->dev);
 
@@ -729,7 +728,6 @@ static int i2s_hw_params(struct snd_pcm_substream *substream,
 	struct i2s_dai *i2s = to_info(dai);
 	u32 mod, mask = 0, val = 0;
 	struct clk *rclksrc;
-	unsigned long flags;
 
 	WARN_ON(!pm_runtime_active(dai->dev));
 
@@ -801,11 +799,11 @@ static int i2s_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	spin_lock_irqsave(&priv->lock, flags);
-	mod = readl(priv->addr + I2SMOD);
-	mod = (mod & ~mask) | val;
-	writel(mod, priv->addr + I2SMOD);
-	spin_unlock_irqrestore(&priv->lock, flags);
+	scoped_guard(spinlock_irqsave, &priv->lock) {
+		mod = readl(priv->addr + I2SMOD);
+		mod = (mod & ~mask) | val;
+		writel(mod, priv->addr + I2SMOD);
+	}
 
 	snd_soc_dai_init_dma_data(dai, &i2s->dma_playback, &i2s->dma_capture);
 
@@ -825,11 +823,10 @@ static int i2s_startup(struct snd_pcm_substream *substream,
 	struct samsung_i2s_priv *priv = snd_soc_dai_get_drvdata(dai);
 	struct i2s_dai *i2s = to_info(dai);
 	struct i2s_dai *other = get_other_dai(i2s);
-	unsigned long flags;
 
 	pm_runtime_get_sync(dai->dev);
 
-	spin_lock_irqsave(&priv->pcm_lock, flags);
+	guard(spinlock_irqsave)(&priv->pcm_lock);
 
 	i2s->mode |= DAI_OPENED;
 
@@ -841,8 +838,6 @@ static int i2s_startup(struct snd_pcm_substream *substream,
 	if (!any_active(i2s) && (priv->quirks & QUIRK_NEED_RSTCLR))
 		writel(CON_RSTCLR, i2s->priv->addr + I2SCON);
 
-	spin_unlock_irqrestore(&priv->pcm_lock, flags);
-
 	return 0;
 }
 
@@ -852,21 +847,18 @@ static void i2s_shutdown(struct snd_pcm_substream *substream,
 	struct samsung_i2s_priv *priv = snd_soc_dai_get_drvdata(dai);
 	struct i2s_dai *i2s = to_info(dai);
 	struct i2s_dai *other = get_other_dai(i2s);
-	unsigned long flags;
-
-	spin_lock_irqsave(&priv->pcm_lock, flags);
 
-	i2s->mode &= ~DAI_OPENED;
-	i2s->mode &= ~DAI_MANAGER;
+	scoped_guard(spinlock_irqsave, &priv->pcm_lock) {
+		i2s->mode &= ~DAI_OPENED;
+		i2s->mode &= ~DAI_MANAGER;
 
-	if (is_opened(other))
-		other->mode |= DAI_MANAGER;
+		if (is_opened(other))
+			other->mode |= DAI_MANAGER;
 
-	/* Reset any constraint on RFS and BFS */
-	i2s->rfs = 0;
-	i2s->bfs = 0;
-
-	spin_unlock_irqrestore(&priv->pcm_lock, flags);
+		/* Reset any constraint on RFS and BFS */
+		i2s->rfs = 0;
+		i2s->bfs = 0;
+	}
 
 	pm_runtime_put(dai->dev);
 }
@@ -939,7 +931,6 @@ static int i2s_trigger(struct snd_pcm_substream *substream,
 	int capture = (substream->stream == SNDRV_PCM_STREAM_CAPTURE);
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct i2s_dai *i2s = to_info(snd_soc_rtd_to_cpu(rtd, 0));
-	unsigned long flags;
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
@@ -950,37 +941,31 @@ static int i2s_trigger(struct snd_pcm_substream *substream,
 		if (priv->fixup_early)
 			priv->fixup_early(substream, dai);
 
-		spin_lock_irqsave(&priv->lock, flags);
+		scoped_guard(spinlock_irqsave, &priv->lock) {
+			if (config_setup(i2s))
+				return -EINVAL;
 
-		if (config_setup(i2s)) {
-			spin_unlock_irqrestore(&priv->lock, flags);
-			return -EINVAL;
-		}
+			if (priv->fixup_late)
+				priv->fixup_late(substream, dai);
 
-		if (priv->fixup_late)
-			priv->fixup_late(substream, dai);
-
-		if (capture)
-			i2s_rxctrl(i2s, 1);
-		else
-			i2s_txctrl(i2s, 1);
-
-		spin_unlock_irqrestore(&priv->lock, flags);
+			if (capture)
+				i2s_rxctrl(i2s, 1);
+			else
+				i2s_txctrl(i2s, 1);
+		}
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		spin_lock_irqsave(&priv->lock, flags);
-
-		if (capture) {
-			i2s_rxctrl(i2s, 0);
-			i2s_fifo(i2s, FIC_RXFLUSH);
-		} else {
-			i2s_txctrl(i2s, 0);
-			i2s_fifo(i2s, FIC_TXFLUSH);
+		scoped_guard(spinlock_irqsave, &priv->lock) {
+			if (capture) {
+				i2s_rxctrl(i2s, 0);
+				i2s_fifo(i2s, FIC_RXFLUSH);
+			} else {
+				i2s_txctrl(i2s, 0);
+				i2s_fifo(i2s, FIC_TXFLUSH);
+			}
 		}
-
-		spin_unlock_irqrestore(&priv->lock, flags);
 		pm_runtime_put(dai->dev);
 		break;
 	}
@@ -1056,7 +1041,6 @@ static int samsung_i2s_dai_probe(struct snd_soc_dai *dai)
 	struct samsung_i2s_priv *priv = snd_soc_dai_get_drvdata(dai);
 	struct i2s_dai *i2s = to_info(dai);
 	struct i2s_dai *other = get_other_dai(i2s);
-	unsigned long flags;
 
 	pm_runtime_get_sync(dai->dev);
 
@@ -1079,13 +1063,13 @@ static int samsung_i2s_dai_probe(struct snd_soc_dai *dai)
 	i2s->rfs = 0;
 	i2s->bfs = 0;
 
-	spin_lock_irqsave(&priv->lock, flags);
-	i2s_txctrl(i2s, 0);
-	i2s_rxctrl(i2s, 0);
-	i2s_fifo(i2s, FIC_TXFLUSH);
-	i2s_fifo(other, FIC_TXFLUSH);
-	i2s_fifo(i2s, FIC_RXFLUSH);
-	spin_unlock_irqrestore(&priv->lock, flags);
+	scoped_guard(spinlock_irqsave, &priv->lock) {
+		i2s_txctrl(i2s, 0);
+		i2s_rxctrl(i2s, 0);
+		i2s_fifo(i2s, FIC_TXFLUSH);
+		i2s_fifo(other, FIC_TXFLUSH);
+		i2s_fifo(i2s, FIC_RXFLUSH);
+	}
 
 	/* Gate CDCLK by default */
 	if (!is_opened(other))
@@ -1100,15 +1084,13 @@ static int samsung_i2s_dai_remove(struct snd_soc_dai *dai)
 {
 	struct samsung_i2s_priv *priv = snd_soc_dai_get_drvdata(dai);
 	struct i2s_dai *i2s = to_info(dai);
-	unsigned long flags;
 
 	pm_runtime_get_sync(dai->dev);
 
 	if (!is_secondary(i2s)) {
 		if (priv->quirks & QUIRK_NEED_RSTCLR) {
-			spin_lock_irqsave(&priv->lock, flags);
-			writel(0, priv->addr + I2SCON);
-			spin_unlock_irqrestore(&priv->lock, flags);
+			scoped_guard(spinlock_irqsave, &priv->lock)
+				writel(0, priv->addr + I2SCON);
 		}
 	}
 
-- 
2.43.0

