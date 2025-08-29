Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAF932039E
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756478681; cv=none; b=DRtIsDThSRuu0yyVe0SOg2VJLPHlCFBfHS0G0r2zkrV56lze2gt6cb1ZmdvQePeuryU56mYG383U+nDk9s2MK0qU45LiXvj1YNyCQUkv4XtH4+C41oQp+v+vGmzbS3RTev5yOWW6Kr6BoAqVKDjA4HxGzACrSrOVu7EnIhjEan0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756478681; c=relaxed/simple;
	bh=u7PAo7+W/4TdynIiVT049EiYs1Btkw5t/G+KdsngX4U=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iNmwOGN4oWnKm8Ed2IVjfOXB8/akHwjROGLCbRw12yyWl4kKzVjhyPLBG8zwnPAAmRvH+Ph0xSyqYVHKRHI67YxuoB5oIaCHNjuAdbz1u3pn3sQ+mRe4/KzWjYHA0E8PZMkwwAc4M+iEaey3Zd809SvHCWvFHc/42WfMWW4Zz9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=E8Z+eLcP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Kb1cpTEr; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DQGyik0M; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PlsGy6Ku; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="E8Z+eLcP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Kb1cpTEr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DQGyik0M";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PlsGy6Ku"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id F16C833EC9;
	Fri, 29 Aug 2025 14:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478636; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K/uMImmIuzhnNxUL0Siiau6MWAVpjnBi6ncksE2Ectc=;
	b=E8Z+eLcP1WlaREVj0Z5hQz2wjM/2UqoFt4eSkRqtCiDS7pZSpWTMjiji+Vm/EJq7o22UvK
	JB9pOJrIz4PEUVdqzBKIk1FCnDH/nkC2YCSduBuEVWFcseWH5H9rIoY7dY7tQ9iDhOZGNZ
	Jn1GIA/8Df2YiORHrzUFT9kUNTeOhnw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478636;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K/uMImmIuzhnNxUL0Siiau6MWAVpjnBi6ncksE2Ectc=;
	b=Kb1cpTErs+R88cDrxJy/J0YdlnDCCIpnioPzB/uZsBE9BjKJ9M2ehwE8OOQMnmgWq3zhZl
	Q1wSZPpQsLvMlEAA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=DQGyik0M;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=PlsGy6Ku
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478635; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K/uMImmIuzhnNxUL0Siiau6MWAVpjnBi6ncksE2Ectc=;
	b=DQGyik0MMEVDkMHFM5uCcIEDl4nr8AUUipwvJshewhnLdNF1l67pB0n2r3AciQqYdngRYA
	+/cPUCGTPA9X1E+toe3yq6LLOy96pmB8VvqynR+ec4mPBV392PtogRlyozh9LQ/f4rLa+6
	7/4Fj61UjJQe5PXQvloOEQshWnASm8o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478635;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K/uMImmIuzhnNxUL0Siiau6MWAVpjnBi6ncksE2Ectc=;
	b=PlsGy6KuLjcMCLDG4/LYZ4mFBRUfz9TiNHa8GmABqi3ph468XeGX3xHA/+BJ9Q41LpjvWH
	jPJ/CTu0DsUv7iCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D905413A3E;
	Fri, 29 Aug 2025 14:43:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MEreM6u8sWi6GAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:43:55 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 14/61] ALSA: bt87x: Use guard() for spin locks
Date: Fri, 29 Aug 2025 16:42:49 +0200
Message-ID: <20250829144342.4290-15-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829144342.4290-1-tiwai@suse.de>
References: <20250829144342.4290-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: F16C833EC9
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Clean up the code using guard() for spin locks.

Merely code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/bt87x.c | 26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/sound/pci/bt87x.c b/sound/pci/bt87x.c
index b70f6f4ffe67..383def1f2af7 100644
--- a/sound/pci/bt87x.c
+++ b/sound/pci/bt87x.c
@@ -431,10 +431,10 @@ static int snd_bt87x_close(struct snd_pcm_substream *substream)
 {
 	struct snd_bt87x *chip = snd_pcm_substream_chip(substream);
 
-	spin_lock_irq(&chip->reg_lock);
-	chip->reg_control |= CTL_A_PWRDN;
-	snd_bt87x_writel(chip, REG_GPIO_DMA_CTL, chip->reg_control);
-	spin_unlock_irq(&chip->reg_lock);
+	scoped_guard(spinlock_irq, &chip->reg_lock) {
+		chip->reg_control |= CTL_A_PWRDN;
+		snd_bt87x_writel(chip, REG_GPIO_DMA_CTL, chip->reg_control);
+	}
 
 	chip->substream = NULL;
 	clear_bit(0, &chip->opened);
@@ -466,20 +466,19 @@ static int snd_bt87x_prepare(struct snd_pcm_substream *substream)
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	int decimation;
 
-	spin_lock_irq(&chip->reg_lock);
+	guard(spinlock_irq)(&chip->reg_lock);
 	chip->reg_control &= ~(CTL_DA_SDR_MASK | CTL_DA_SBR);
 	decimation = (ANALOG_CLOCK + runtime->rate / 4) / runtime->rate;
 	chip->reg_control |= decimation << CTL_DA_SDR_SHIFT;
 	if (runtime->format == SNDRV_PCM_FORMAT_S8)
 		chip->reg_control |= CTL_DA_SBR;
 	snd_bt87x_writel(chip, REG_GPIO_DMA_CTL, chip->reg_control);
-	spin_unlock_irq(&chip->reg_lock);
 	return 0;
 }
 
 static int snd_bt87x_start(struct snd_bt87x *chip)
 {
-	spin_lock(&chip->reg_lock);
+	guard(spinlock)(&chip->reg_lock);
 	chip->current_line = 0;
 	chip->reg_control |= CTL_FIFO_ENABLE | CTL_RISC_ENABLE | CTL_ACAP_EN;
 	snd_bt87x_writel(chip, REG_RISC_STRT_ADD, chip->dma_risc.addr);
@@ -487,18 +486,16 @@ static int snd_bt87x_start(struct snd_bt87x *chip)
 			 chip->line_bytes | (chip->lines << 16));
 	snd_bt87x_writel(chip, REG_INT_MASK, chip->interrupt_mask);
 	snd_bt87x_writel(chip, REG_GPIO_DMA_CTL, chip->reg_control);
-	spin_unlock(&chip->reg_lock);
 	return 0;
 }
 
 static int snd_bt87x_stop(struct snd_bt87x *chip)
 {
-	spin_lock(&chip->reg_lock);
+	guard(spinlock)(&chip->reg_lock);
 	chip->reg_control &= ~(CTL_FIFO_ENABLE | CTL_RISC_ENABLE | CTL_ACAP_EN);
 	snd_bt87x_writel(chip, REG_GPIO_DMA_CTL, chip->reg_control);
 	snd_bt87x_writel(chip, REG_INT_MASK, 0);
 	snd_bt87x_writel(chip, REG_INT_STAT, MY_INTERRUPTS);
-	spin_unlock(&chip->reg_lock);
 	return 0;
 }
 
@@ -560,13 +557,12 @@ static int snd_bt87x_capture_volume_put(struct snd_kcontrol *kcontrol,
 	u32 old_control;
 	int changed;
 
-	spin_lock_irq(&chip->reg_lock);
+	guard(spinlock_irq)(&chip->reg_lock);
 	old_control = chip->reg_control;
 	chip->reg_control = (chip->reg_control & ~CTL_A_GAIN_MASK)
 		| (value->value.integer.value[0] << CTL_A_GAIN_SHIFT);
 	snd_bt87x_writel(chip, REG_GPIO_DMA_CTL, chip->reg_control);
 	changed = old_control != chip->reg_control;
-	spin_unlock_irq(&chip->reg_lock);
 	return changed;
 }
 
@@ -596,13 +592,12 @@ static int snd_bt87x_capture_boost_put(struct snd_kcontrol *kcontrol,
 	u32 old_control;
 	int changed;
 
-	spin_lock_irq(&chip->reg_lock);
+	guard(spinlock_irq)(&chip->reg_lock);
 	old_control = chip->reg_control;
 	chip->reg_control = (chip->reg_control & ~CTL_A_G2X)
 		| (value->value.integer.value[0] ? CTL_A_G2X : 0);
 	snd_bt87x_writel(chip, REG_GPIO_DMA_CTL, chip->reg_control);
 	changed = chip->reg_control != old_control;
-	spin_unlock_irq(&chip->reg_lock);
 	return changed;
 }
 
@@ -638,13 +633,12 @@ static int snd_bt87x_capture_source_put(struct snd_kcontrol *kcontrol,
 	u32 old_control;
 	int changed;
 
-	spin_lock_irq(&chip->reg_lock);
+	guard(spinlock_irq)(&chip->reg_lock);
 	old_control = chip->reg_control;
 	chip->reg_control = (chip->reg_control & ~CTL_A_SEL_MASK)
 		| (value->value.enumerated.item[0] << CTL_A_SEL_SHIFT);
 	snd_bt87x_writel(chip, REG_GPIO_DMA_CTL, chip->reg_control);
 	changed = chip->reg_control != old_control;
-	spin_unlock_irq(&chip->reg_lock);
 	return changed;
 }
 
-- 
2.50.1

