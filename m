Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D153218DE
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756478653; cv=none; b=ukPH+x7v+zvHw3Lo9cfjRqMZuCvwrbQ5lN37DFQnbQxs2l3vgVf2zSTRy3ti4P9R3kN1BOLKt/6ZbV3ho9phXutY61ucTvxk8RjEtVxL6N2H+xUGrlEInAhqX1i9pl5WphYa0MHd8S60UVgV89HVGRHbKKpIq2VbsD27FmLY/9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756478653; c=relaxed/simple;
	bh=kR/bsx1x64e0mDstUSN3g6ALJblhA8LPzc8oM+uaHuY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eah47H/GnL4vm93Hq2r3fHAhVgGgzaLkRm69KUBLGs2ZZceXcq8ZHW4YD7LO7DMgp4T8TKu1y3j9K4QPHzDGi+oAYauUBSD3Fgcxp5uNqNusX0QTErb23HVrsKxvzkdN2FH4jaWHRn5hJaNSf2hM+fJ2yDL02y98vsVSCvhpNrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fT1fr1dp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cSCNdTIC; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fT1fr1dp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cSCNdTIC; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fT1fr1dp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cSCNdTIC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fT1fr1dp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cSCNdTIC"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B32DA33EC0;
	Fri, 29 Aug 2025 14:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478633; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LkQerwlEm7aaIP7RgQP4V+Uj9ivUVriTny0+CvdJMcs=;
	b=fT1fr1dpDw/Iq8Lh1YPJf0PcvPcdPPT2BE3UpvMSn9FCqso3UUmw1Mlsi8l4BQ4ZFO6bXz
	8y3K3h7s55y7LmCnf9OABBu1kR9vJtPLolkuv9uWugHJHrljEppcWZ7+Pn3jttVj5z6uBF
	awCUhEek/uqlpj2/AEUhYFgG4F2keDM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478633;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LkQerwlEm7aaIP7RgQP4V+Uj9ivUVriTny0+CvdJMcs=;
	b=cSCNdTIC1RBkJTUZ75wvJbNnMBAl3SQ+Coy4zaormQZ3YFobC/uSuxZgLfCDHBRguaPtMx
	/tiPkvEjZbIza+Ag==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478633; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LkQerwlEm7aaIP7RgQP4V+Uj9ivUVriTny0+CvdJMcs=;
	b=fT1fr1dpDw/Iq8Lh1YPJf0PcvPcdPPT2BE3UpvMSn9FCqso3UUmw1Mlsi8l4BQ4ZFO6bXz
	8y3K3h7s55y7LmCnf9OABBu1kR9vJtPLolkuv9uWugHJHrljEppcWZ7+Pn3jttVj5z6uBF
	awCUhEek/uqlpj2/AEUhYFgG4F2keDM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478633;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LkQerwlEm7aaIP7RgQP4V+Uj9ivUVriTny0+CvdJMcs=;
	b=cSCNdTIC1RBkJTUZ75wvJbNnMBAl3SQ+Coy4zaormQZ3YFobC/uSuxZgLfCDHBRguaPtMx
	/tiPkvEjZbIza+Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 983E913A3E;
	Fri, 29 Aug 2025 14:43:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2EIRJKm8sWi6GAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:43:53 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 08/61] ALSA: als4000: Use guard() for spin locks
Date: Fri, 29 Aug 2025 16:42:43 +0200
Message-ID: <20250829144342.4290-9-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
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
 sound/pci/als4000.c | 68 +++++++++++++++++++++------------------------
 1 file changed, 32 insertions(+), 36 deletions(-)

diff --git a/sound/pci/als4000.c b/sound/pci/als4000.c
index eb159497c905..33034e07b3d6 100644
--- a/sound/pci/als4000.c
+++ b/sound/pci/als4000.c
@@ -369,14 +369,14 @@ static int snd_als4000_capture_prepare(struct snd_pcm_substream *substream)
 		count >>= 1;
 	count--;
 
-	spin_lock_irq(&chip->reg_lock);
-	snd_als4000_set_rate(chip, runtime->rate);
-	snd_als4000_set_capture_dma(chip, runtime->dma_addr, size);
-	spin_unlock_irq(&chip->reg_lock);
-	spin_lock_irq(&chip->mixer_lock);
-	snd_als4_cr_write(chip, ALS4K_CR1C_FIFO2_BLOCK_LENGTH_LO, count & 0xff);
-	snd_als4_cr_write(chip, ALS4K_CR1D_FIFO2_BLOCK_LENGTH_HI, count >> 8);
-	spin_unlock_irq(&chip->mixer_lock);
+	scoped_guard(spinlock_irq, &chip->reg_lock) {
+		snd_als4000_set_rate(chip, runtime->rate);
+		snd_als4000_set_capture_dma(chip, runtime->dma_addr, size);
+	}
+	scoped_guard(spinlock_irq, &chip->mixer_lock) {
+		snd_als4_cr_write(chip, ALS4K_CR1C_FIFO2_BLOCK_LENGTH_LO, count & 0xff);
+		snd_als4_cr_write(chip, ALS4K_CR1D_FIFO2_BLOCK_LENGTH_HI, count >> 8);
+	}
 	return 0;
 }
 
@@ -402,7 +402,7 @@ static int snd_als4000_playback_prepare(struct snd_pcm_substream *substream)
 	 * reordering, ...). Something seems to get enabled on playback
 	 * that I haven't found out how to disable again, which then causes
 	 * the switching pops to reach the speakers the next time here. */
-	spin_lock_irq(&chip->reg_lock);
+	guard(spinlock_irq)(&chip->reg_lock);
 	snd_als4000_set_rate(chip, runtime->rate);
 	snd_als4000_set_playback_dma(chip, runtime->dma_addr, size);
 	
@@ -413,7 +413,6 @@ static int snd_als4000_playback_prepare(struct snd_pcm_substream *substream)
 	snd_sbdsp_command(chip, count & 0xff);
 	snd_sbdsp_command(chip, count >> 8);
 	snd_sbdsp_command(chip, playback_cmd(chip).dma_off);	
-	spin_unlock_irq(&chip->reg_lock);
 	
 	return 0;
 }
@@ -429,7 +428,7 @@ static int snd_als4000_capture_trigger(struct snd_pcm_substream *substream, int
 	   Probably need to take reg_lock as outer (or inner??) lock, too.
 	   (or serialize both lock operations? probably not, though... - racy?)
 	*/
-	spin_lock(&chip->mixer_lock);
+	guard(spinlock)(&chip->mixer_lock);
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
@@ -447,7 +446,6 @@ static int snd_als4000_capture_trigger(struct snd_pcm_substream *substream, int
 		result = -EINVAL;
 		break;
 	}
-	spin_unlock(&chip->mixer_lock);
 	return result;
 }
 
@@ -456,7 +454,7 @@ static int snd_als4000_playback_trigger(struct snd_pcm_substream *substream, int
 	struct snd_sb *chip = snd_pcm_substream_chip(substream);
 	int result = 0;
 
-	spin_lock(&chip->reg_lock);
+	guard(spinlock)(&chip->reg_lock);
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
@@ -472,7 +470,6 @@ static int snd_als4000_playback_trigger(struct snd_pcm_substream *substream, int
 		result = -EINVAL;
 		break;
 	}
-	spin_unlock(&chip->reg_lock);
 	return result;
 }
 
@@ -481,9 +478,9 @@ static snd_pcm_uframes_t snd_als4000_capture_pointer(struct snd_pcm_substream *s
 	struct snd_sb *chip = snd_pcm_substream_chip(substream);
 	unsigned int result;
 
-	spin_lock(&chip->reg_lock);	
-	result = snd_als4k_gcr_read(chip, ALS4K_GCRA4_FIFO2_CURRENT_ADDR);
-	spin_unlock(&chip->reg_lock);
+	scoped_guard(spinlock, &chip->reg_lock) {
+		result = snd_als4k_gcr_read(chip, ALS4K_GCRA4_FIFO2_CURRENT_ADDR);
+	}
 	result &= 0xffff;
 	return bytes_to_frames( substream->runtime, result );
 }
@@ -493,9 +490,9 @@ static snd_pcm_uframes_t snd_als4000_playback_pointer(struct snd_pcm_substream *
 	struct snd_sb *chip = snd_pcm_substream_chip(substream);
 	unsigned result;
 
-	spin_lock(&chip->reg_lock);	
-	result = snd_als4k_gcr_read(chip, ALS4K_GCRA0_FIFO1_CURRENT_ADDR);
-	spin_unlock(&chip->reg_lock);
+	scoped_guard(spinlock, &chip->reg_lock) {
+		result = snd_als4k_gcr_read(chip, ALS4K_GCRA0_FIFO1_CURRENT_ADDR);
+	}
 	result &= 0xffff;
 	return bytes_to_frames( substream->runtime, result );
 }
@@ -536,10 +533,10 @@ static irqreturn_t snd_als4000_interrupt(int irq, void *dev_id)
 	snd_als4k_iobase_writeb(chip->alt_port,
 			 ALS4K_IOB_0E_IRQTYPE_SB_CR1E_MPU, pci_irqstatus);
 	
-	spin_lock(&chip->mixer_lock);
-	/* SPECS_PAGE: 20 */
-	sb_irqstatus = snd_sbmixer_read(chip, SB_DSP4_IRQSTATUS);
-	spin_unlock(&chip->mixer_lock);
+	scoped_guard(spinlock, &chip->mixer_lock) {
+		/* SPECS_PAGE: 20 */
+		sb_irqstatus = snd_sbmixer_read(chip, SB_DSP4_IRQSTATUS);
+	}
 	
 	if (sb_irqstatus & SB_IRQTYPE_8BIT)
 		snd_sb_ack_8bit(chip);
@@ -709,18 +706,18 @@ static void snd_als4000_configure(struct snd_sb *chip)
 	int i;
 
 	/* do some more configuration */
-	spin_lock_irq(&chip->mixer_lock);
-	tmp = snd_als4_cr_read(chip, ALS4K_CR0_SB_CONFIG);
-	snd_als4_cr_write(chip, ALS4K_CR0_SB_CONFIG,
-				tmp|ALS4K_CR0_MX80_81_REG_WRITE_ENABLE);
-	/* always select DMA channel 0, since we do not actually use DMA
-	 * SPECS_PAGE: 19/20 */
-	snd_sbmixer_write(chip, SB_DSP4_DMASETUP, SB_DMASETUP_DMA0);
-	snd_als4_cr_write(chip, ALS4K_CR0_SB_CONFIG,
-				 tmp & ~ALS4K_CR0_MX80_81_REG_WRITE_ENABLE);
-	spin_unlock_irq(&chip->mixer_lock);
+	scoped_guard(spinlock_irq, &chip->mixer_lock) {
+		tmp = snd_als4_cr_read(chip, ALS4K_CR0_SB_CONFIG);
+		snd_als4_cr_write(chip, ALS4K_CR0_SB_CONFIG,
+				  tmp|ALS4K_CR0_MX80_81_REG_WRITE_ENABLE);
+		/* always select DMA channel 0, since we do not actually use DMA
+		 * SPECS_PAGE: 19/20 */
+		snd_sbmixer_write(chip, SB_DSP4_DMASETUP, SB_DMASETUP_DMA0);
+		snd_als4_cr_write(chip, ALS4K_CR0_SB_CONFIG,
+				  tmp & ~ALS4K_CR0_MX80_81_REG_WRITE_ENABLE);
+	}
 	
-	spin_lock_irq(&chip->reg_lock);
+	guard(spinlock_irq)(&chip->reg_lock);
 	/* enable interrupts */
 	snd_als4k_gcr_write(chip, ALS4K_GCR8C_MISC_CTRL,
 					ALS4K_GCR8C_IRQ_MASK_CTRL_ENABLE);
@@ -731,7 +728,6 @@ static void snd_als4000_configure(struct snd_sb *chip)
 	/* enable burst mode to prevent dropouts during high PCI bus usage */
 	snd_als4k_gcr_write(chip, ALS4K_GCR99_DMA_EMULATION_CTRL,
 		(snd_als4k_gcr_read(chip, ALS4K_GCR99_DMA_EMULATION_CTRL) & ~0x07) | 0x04);
-	spin_unlock_irq(&chip->reg_lock);
 }
 
 #ifdef SUPPORT_JOYSTICK
-- 
2.50.1

