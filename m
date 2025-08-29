Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87577322750
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756478670; cv=none; b=oLIlSuY0bXOm9kzg1BZfZixBbfe96NsqIbpx788JPOaeVIh0Dtc4GYy1VZC+wyfhLLNz4vrwuBFAnlX6vHyKqXCrKY7j4Pl7SHGlmA/0ccJgvdpldpVZduO8m8jPXv3OzvofF9BPwXqAtDkSX8hbFxcWWKgj6UX1K5nsDN0Y7TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756478670; c=relaxed/simple;
	bh=7iKMRdWrftFa/aQK87927LOGi3EsdEg0zQqhBHWHSG8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ttjt/+LslrmcpWPxjCYBl0iimaLu6jBXocVCCjHKfJU+J0ppFS1Sdltjbwg2s/yrWbrG/M/tM68jsDrHP4nzPs/TISpqhm7D3e0kpmDsBEtQFg5tChjT0BA6xfK/auYhz5qOgk7uqAMBhWSeLjwHL2qYL/AV9tnuAmvN2/aIswg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TuxMd240; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AaxJdNFv; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TuxMd240; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AaxJdNFv; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TuxMd240";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AaxJdNFv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TuxMd240";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AaxJdNFv"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DDD9B5C092;
	Fri, 29 Aug 2025 14:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478634; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZjJK+tmZdQs/t4gRn/hwKyi7Sd3zbDIyfT1fos3m9Xo=;
	b=TuxMd240RXRhGJfnAUw3jl9ck0K9vBRvvZHbHiHczOZYwUiTFVuQFs6grqYBO1PfCXbWSW
	w6D227NJmaX7O02FNSINX3BhQVtH0r1RGmQCOTtqj62r/qZHlARXb0VJ7paSwEc+uVnGfU
	/+QkWR9h2ikXv15vb0RJaya7++MIXY4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478634;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZjJK+tmZdQs/t4gRn/hwKyi7Sd3zbDIyfT1fos3m9Xo=;
	b=AaxJdNFvWHxOq3lvz5phmpc4VE7yeAcd/5SmBRaORfY1eX0rqlAJWeBpH20mZESQevIcu0
	z0mQOXp1zuGb1hAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478634; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZjJK+tmZdQs/t4gRn/hwKyi7Sd3zbDIyfT1fos3m9Xo=;
	b=TuxMd240RXRhGJfnAUw3jl9ck0K9vBRvvZHbHiHczOZYwUiTFVuQFs6grqYBO1PfCXbWSW
	w6D227NJmaX7O02FNSINX3BhQVtH0r1RGmQCOTtqj62r/qZHlARXb0VJ7paSwEc+uVnGfU
	/+QkWR9h2ikXv15vb0RJaya7++MIXY4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478634;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZjJK+tmZdQs/t4gRn/hwKyi7Sd3zbDIyfT1fos3m9Xo=;
	b=AaxJdNFvWHxOq3lvz5phmpc4VE7yeAcd/5SmBRaORfY1eX0rqlAJWeBpH20mZESQevIcu0
	z0mQOXp1zuGb1hAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C557513A3E;
	Fri, 29 Aug 2025 14:43:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6NcQL6q8sWi6GAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:43:54 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 11/61] ALSA: atiixp: Use guard() for spin locks
Date: Fri, 29 Aug 2025 16:42:46 +0200
Message-ID: <20250829144342.4290-12-tiwai@suse.de>
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
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

Clean up the code using guard() for spin locks.

Merely code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/atiixp.c       | 38 ++++++++++++++++----------------------
 sound/pci/atiixp_modem.c | 32 ++++++++++++++------------------
 2 files changed, 30 insertions(+), 40 deletions(-)

diff --git a/sound/pci/atiixp.c b/sound/pci/atiixp.c
index 38c07f3de850..2a0c59d5afa5 100644
--- a/sound/pci/atiixp.c
+++ b/sound/pci/atiixp.c
@@ -345,7 +345,6 @@ static int atiixp_build_dma_packets(struct atiixp *chip, struct atiixp_dma *dma,
 {
 	unsigned int i;
 	u32 addr, desc_addr;
-	unsigned long flags;
 
 	if (periods > ATI_MAX_DESCRIPTORS)
 		return -ENOMEM;
@@ -363,11 +362,11 @@ static int atiixp_build_dma_packets(struct atiixp *chip, struct atiixp_dma *dma,
 		return 0;
 
 	/* reset DMA before changing the descriptor table */
-	spin_lock_irqsave(&chip->reg_lock, flags);
-	writel(0, chip->remap_addr + dma->ops->llp_offset);
-	dma->ops->enable_dma(chip, 0);
-	dma->ops->enable_dma(chip, 1);
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
+	scoped_guard(spinlock_irqsave, &chip->reg_lock) {
+		writel(0, chip->remap_addr + dma->ops->llp_offset);
+		dma->ops->enable_dma(chip, 0);
+		dma->ops->enable_dma(chip, 1);
+	}
 
 	/* fill the entries */
 	addr = (u32)substream->runtime->dma_addr;
@@ -711,7 +710,7 @@ static int snd_atiixp_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 		       !dma->ops->flush_dma))
 		return -EINVAL;
 
-	spin_lock(&chip->reg_lock);
+	guard(spinlock)(&chip->reg_lock);
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
@@ -745,7 +744,6 @@ static int snd_atiixp_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 			snd_atiixp_check_bus_busy(chip);
 		}
 	}
-	spin_unlock(&chip->reg_lock);
 	return err;
 }
 
@@ -859,7 +857,7 @@ static int snd_atiixp_spdif_prepare(struct snd_pcm_substream *substream)
 {
 	struct atiixp *chip = snd_pcm_substream_chip(substream);
 
-	spin_lock_irq(&chip->reg_lock);
+	guard(spinlock_irq)(&chip->reg_lock);
 	if (chip->spdif_over_aclink) {
 		unsigned int data;
 		/* enable slots 10/11 */
@@ -877,7 +875,6 @@ static int snd_atiixp_spdif_prepare(struct snd_pcm_substream *substream)
 		atiixp_update(chip, CMD, ATI_REG_CMD_SPDF_CONFIG_MASK, 0);
 		atiixp_update(chip, CMD, ATI_REG_CMD_INTERLEAVE_SPDF, 0);
 	}
-	spin_unlock_irq(&chip->reg_lock);
 	return 0;
 }
 
@@ -887,7 +884,7 @@ static int snd_atiixp_playback_prepare(struct snd_pcm_substream *substream)
 	struct atiixp *chip = snd_pcm_substream_chip(substream);
 	unsigned int data;
 
-	spin_lock_irq(&chip->reg_lock);
+	guard(spinlock_irq)(&chip->reg_lock);
 	data = atiixp_read(chip, OUT_DMA_SLOT) & ~ATI_REG_OUT_DMA_SLOT_MASK;
 	switch (substream->runtime->channels) {
 	case 8:
@@ -922,7 +919,6 @@ static int snd_atiixp_playback_prepare(struct snd_pcm_substream *substream)
 	atiixp_update(chip, 6CH_REORDER, ATI_REG_6CH_REORDER_EN,
 		      substream->runtime->channels >= 6 ? ATI_REG_6CH_REORDER_EN: 0);
     
-	spin_unlock_irq(&chip->reg_lock);
 	return 0;
 }
 
@@ -931,11 +927,10 @@ static int snd_atiixp_capture_prepare(struct snd_pcm_substream *substream)
 {
 	struct atiixp *chip = snd_pcm_substream_chip(substream);
 
-	spin_lock_irq(&chip->reg_lock);
+	guard(spinlock_irq)(&chip->reg_lock);
 	atiixp_update(chip, CMD, ATI_REG_CMD_INTERLEAVE_IN,
 		      substream->runtime->format == SNDRV_PCM_FORMAT_S16_LE ?
 		      ATI_REG_CMD_INTERLEAVE_IN : 0);
-	spin_unlock_irq(&chip->reg_lock);
 	return 0;
 }
 
@@ -1043,9 +1038,9 @@ static int snd_atiixp_pcm_open(struct snd_pcm_substream *substream,
 	runtime->private_data = dma;
 
 	/* enable DMA bits */
-	spin_lock_irq(&chip->reg_lock);
-	dma->ops->enable_dma(chip, 1);
-	spin_unlock_irq(&chip->reg_lock);
+	scoped_guard(spinlock_irq, &chip->reg_lock) {
+		dma->ops->enable_dma(chip, 1);
+	}
 	dma->opened = 1;
 
 	return 0;
@@ -1058,9 +1053,9 @@ static int snd_atiixp_pcm_close(struct snd_pcm_substream *substream,
 	/* disable DMA bits */
 	if (snd_BUG_ON(!dma->ops || !dma->ops->enable_dma))
 		return -EINVAL;
-	spin_lock_irq(&chip->reg_lock);
-	dma->ops->enable_dma(chip, 0);
-	spin_unlock_irq(&chip->reg_lock);
+	scoped_guard(spinlock_irq, &chip->reg_lock) {
+		dma->ops->enable_dma(chip, 0);
+	}
 	dma->substream = NULL;
 	dma->opened = 0;
 	return 0;
@@ -1348,10 +1343,9 @@ static irqreturn_t snd_atiixp_interrupt(int irq, void *dev_id)
 	if (status & CODEC_CHECK_BITS) {
 		unsigned int detected;
 		detected = status & CODEC_CHECK_BITS;
-		spin_lock(&chip->reg_lock);
+		guard(spinlock)(&chip->reg_lock);
 		chip->codec_not_ready_bits |= detected;
 		atiixp_update(chip, IER, detected, 0); /* disable the detected irqs */
-		spin_unlock(&chip->reg_lock);
 	}
 
 	/* ack */
diff --git a/sound/pci/atiixp_modem.c b/sound/pci/atiixp_modem.c
index 81a53336699e..91f31e2ad3d3 100644
--- a/sound/pci/atiixp_modem.c
+++ b/sound/pci/atiixp_modem.c
@@ -314,7 +314,6 @@ static int atiixp_build_dma_packets(struct atiixp_modem *chip,
 {
 	unsigned int i;
 	u32 addr, desc_addr;
-	unsigned long flags;
 
 	if (periods > ATI_MAX_DESCRIPTORS)
 		return -ENOMEM;
@@ -330,11 +329,11 @@ static int atiixp_build_dma_packets(struct atiixp_modem *chip,
 		return 0;
 
 	/* reset DMA before changing the descriptor table */
-	spin_lock_irqsave(&chip->reg_lock, flags);
-	writel(0, chip->remap_addr + dma->ops->llp_offset);
-	dma->ops->enable_dma(chip, 0);
-	dma->ops->enable_dma(chip, 1);
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
+	scoped_guard(spinlock_irqsave, &chip->reg_lock) {
+		writel(0, chip->remap_addr + dma->ops->llp_offset);
+		dma->ops->enable_dma(chip, 0);
+		dma->ops->enable_dma(chip, 1);
+	}
 
 	/* fill the entries */
 	addr = (u32)substream->runtime->dma_addr;
@@ -661,7 +660,7 @@ static int snd_atiixp_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 		       !dma->ops->flush_dma))
 		return -EINVAL;
 
-	spin_lock(&chip->reg_lock);
+	guard(spinlock)(&chip->reg_lock);
 	switch(cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 		dma->ops->enable_transfer(chip, 1);
@@ -682,7 +681,6 @@ static int snd_atiixp_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 		snd_atiixp_check_bus_busy(chip);
 	}
 	}
-	spin_unlock(&chip->reg_lock);
 	return err;
 }
 
@@ -753,13 +751,12 @@ static int snd_atiixp_playback_prepare(struct snd_pcm_substream *substream)
 	struct atiixp_modem *chip = snd_pcm_substream_chip(substream);
 	unsigned int data;
 
-	spin_lock_irq(&chip->reg_lock);
+	guard(spinlock_irq)(&chip->reg_lock);
 	/* set output threshold */
 	data = atiixp_read(chip, MODEM_OUT_FIFO);
 	data &= ~ATI_REG_MODEM_OUT1_DMA_THRESHOLD_MASK;
 	data |= 0x04 << ATI_REG_MODEM_OUT1_DMA_THRESHOLD_SHIFT;
 	atiixp_write(chip, MODEM_OUT_FIFO, data);
-	spin_unlock_irq(&chip->reg_lock);
 	return 0;
 }
 
@@ -864,9 +861,9 @@ static int snd_atiixp_pcm_open(struct snd_pcm_substream *substream,
 	runtime->private_data = dma;
 
 	/* enable DMA bits */
-	spin_lock_irq(&chip->reg_lock);
-	dma->ops->enable_dma(chip, 1);
-	spin_unlock_irq(&chip->reg_lock);
+	scoped_guard(spinlock_irq, &chip->reg_lock) {
+		dma->ops->enable_dma(chip, 1);
+	}
 	dma->opened = 1;
 
 	return 0;
@@ -879,9 +876,9 @@ static int snd_atiixp_pcm_close(struct snd_pcm_substream *substream,
 	/* disable DMA bits */
 	if (snd_BUG_ON(!dma->ops || !dma->ops->enable_dma))
 		return -EINVAL;
-	spin_lock_irq(&chip->reg_lock);
-	dma->ops->enable_dma(chip, 0);
-	spin_unlock_irq(&chip->reg_lock);
+	scoped_guard(spinlock_irq, &chip->reg_lock) {
+		dma->ops->enable_dma(chip, 0);
+	}
 	dma->substream = NULL;
 	dma->opened = 0;
 	return 0;
@@ -1013,10 +1010,9 @@ static irqreturn_t snd_atiixp_interrupt(int irq, void *dev_id)
 	if (status & CODEC_CHECK_BITS) {
 		unsigned int detected;
 		detected = status & CODEC_CHECK_BITS;
-		spin_lock(&chip->reg_lock);
+		guard(spinlock)(&chip->reg_lock);
 		chip->codec_not_ready_bits |= detected;
 		atiixp_update(chip, IER, detected, 0); /* disable the detected irqs */
-		spin_unlock(&chip->reg_lock);
 	}
 
 	/* ack */
-- 
2.50.1

