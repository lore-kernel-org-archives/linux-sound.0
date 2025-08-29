Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DAEE2E7F08
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756478710; cv=none; b=mfqU1PJCVY4u2D47bz1SlJyoKYZGj6gjd050sjivClJhryFMC9jWjpgpiFWlspaONFz0PWzdFFZzx8zycoXSL8O/jDmkFbeMmCCpRu1tFXbVhEu0Vkl5obg8966CFZL12hHYK3p8xEWK5Eywgv9aAVDYKzhhseDmhVwzdwtoyn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756478710; c=relaxed/simple;
	bh=JpNHiFdTjkKaYnK6mG/MBBssnEPqdvfa5S1N1cEx/iI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LQK08/oQKaZqSXwc2zeSDOoDxvle4zPJF+ycVZRQa30bkZZV0IrshS1Lnb94+Uox/YIHg3/Zrx32Gp+VOYtSlgX0Z09wJuxV9rcQOjHYKo6ny5yzkJWCZBKVva2xE6tSvMQu0+MPxFElcrABfAjQHUYNrCKc/SX2d6zeWwCZ6Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=r33G6AKB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1Dvt1Eyn; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=r33G6AKB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1Dvt1Eyn; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="r33G6AKB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1Dvt1Eyn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="r33G6AKB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1Dvt1Eyn"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4954A5C229;
	Fri, 29 Aug 2025 14:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478639; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5sCVbDo4tvMxhJfZT50pg8jvxpEQkfZyOLgZdSwOx9A=;
	b=r33G6AKBJFSE9Tg2oD50aGu/WHVnLvisf+Y32CfUitwbuDjBs92mLJ3hL76ErnshCBf5Mv
	n3yEY0jj8/SIJ/hinBRSQt/rpd/8+hCuk9bJms12XihhrCF6uZ2aJzggzQcShVUk93CS96
	7Dz2T2qSvxsINFpzIZ0jHSKNhMiBQIU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478639;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5sCVbDo4tvMxhJfZT50pg8jvxpEQkfZyOLgZdSwOx9A=;
	b=1Dvt1EynBddmbwQ6unvJU7+p4Q8SGi+v9RZHM3aeuEM2oT/9rbYDSQhuqvNMeRt3DGDtXD
	v0Y8rNUaJQPm+IDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478639; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5sCVbDo4tvMxhJfZT50pg8jvxpEQkfZyOLgZdSwOx9A=;
	b=r33G6AKBJFSE9Tg2oD50aGu/WHVnLvisf+Y32CfUitwbuDjBs92mLJ3hL76ErnshCBf5Mv
	n3yEY0jj8/SIJ/hinBRSQt/rpd/8+hCuk9bJms12XihhrCF6uZ2aJzggzQcShVUk93CS96
	7Dz2T2qSvxsINFpzIZ0jHSKNhMiBQIU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478639;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5sCVbDo4tvMxhJfZT50pg8jvxpEQkfZyOLgZdSwOx9A=;
	b=1Dvt1EynBddmbwQ6unvJU7+p4Q8SGi+v9RZHM3aeuEM2oT/9rbYDSQhuqvNMeRt3DGDtXD
	v0Y8rNUaJQPm+IDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2C1BB13A54;
	Fri, 29 Aug 2025 14:43:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ABSXCa+8sWi6GAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:43:59 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 20/61] ALSA: cs46xx: Use guard() for spin locks
Date: Fri, 29 Aug 2025 16:42:55 +0200
Message-ID: <20250829144342.4290-21-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

Clean up the code using guard() for spin locks.

Merely code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/cs46xx/cs46xx_lib.c       | 113 ++++++++++++----------------
 sound/pci/cs46xx/dsp_spos.c         |   4 +-
 sound/pci/cs46xx/dsp_spos_scb_lib.c |  60 +++++----------
 3 files changed, 69 insertions(+), 108 deletions(-)

diff --git a/sound/pci/cs46xx/cs46xx_lib.c b/sound/pci/cs46xx/cs46xx_lib.c
index a87571d5b572..b96ab7fd464c 100644
--- a/sound/pci/cs46xx/cs46xx_lib.c
+++ b/sound/pci/cs46xx/cs46xx_lib.c
@@ -707,7 +707,6 @@ static void snd_cs46xx_proc_stop(struct snd_cs46xx *chip)
 
 static void snd_cs46xx_set_play_sample_rate(struct snd_cs46xx *chip, unsigned int rate)
 {
-	unsigned long flags;
 	unsigned int tmp1, tmp2;
 	unsigned int phiIncr;
 	unsigned int correctionPerGOF, correctionPerSec;
@@ -744,16 +743,14 @@ static void snd_cs46xx_set_play_sample_rate(struct snd_cs46xx *chip, unsigned in
 	/*
 	 *  Fill in the SampleRateConverter control block.
 	 */
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	snd_cs46xx_poke(chip, BA1_PSRC,
 	  ((correctionPerSec << 16) & 0xFFFF0000) | (correctionPerGOF & 0xFFFF));
 	snd_cs46xx_poke(chip, BA1_PPI, phiIncr);
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 }
 
 static void snd_cs46xx_set_capture_sample_rate(struct snd_cs46xx *chip, unsigned int rate)
 {
-	unsigned long flags;
 	unsigned int phiIncr, coeffIncr, tmp1, tmp2;
 	unsigned int correctionPerGOF, correctionPerSec, initialDelay;
 	unsigned int frameGroupLength, cnt;
@@ -818,14 +815,14 @@ static void snd_cs46xx_set_capture_sample_rate(struct snd_cs46xx *chip, unsigned
 	/*
 	 *  Fill in the VariDecimate control block.
 	 */
-	spin_lock_irqsave(&chip->reg_lock, flags);
-	snd_cs46xx_poke(chip, BA1_CSRC,
-		((correctionPerSec << 16) & 0xFFFF0000) | (correctionPerGOF & 0xFFFF));
-	snd_cs46xx_poke(chip, BA1_CCI, coeffIncr);
-	snd_cs46xx_poke(chip, BA1_CD,
-		(((BA1_VARIDEC_BUF_1 + (initialDelay << 2)) << 16) & 0xFFFF0000) | 0x80);
-	snd_cs46xx_poke(chip, BA1_CPI, phiIncr);
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
+	scoped_guard(spinlock_irqsave, &chip->reg_lock) {
+		snd_cs46xx_poke(chip, BA1_CSRC,
+			((correctionPerSec << 16) & 0xFFFF0000) | (correctionPerGOF & 0xFFFF));
+		snd_cs46xx_poke(chip, BA1_CCI, coeffIncr);
+		snd_cs46xx_poke(chip, BA1_CD,
+			(((BA1_VARIDEC_BUF_1 + (initialDelay << 2)) << 16) & 0xFFFF0000) | 0x80);
+		snd_cs46xx_poke(chip, BA1_CPI, phiIncr);
+	}
 
 	/*
 	 *  Figure out the frame group length for the write back task.  Basically,
@@ -848,13 +845,12 @@ static void snd_cs46xx_set_capture_sample_rate(struct snd_cs46xx *chip, unsigned
 	/*
 	 * Fill in the WriteBack control block.
 	 */
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	snd_cs46xx_poke(chip, BA1_CFG1, frameGroupLength);
 	snd_cs46xx_poke(chip, BA1_CFG2, (0x00800000 | frameGroupLength));
 	snd_cs46xx_poke(chip, BA1_CCST, 0x0000FFFF);
 	snd_cs46xx_poke(chip, BA1_CSPB, ((65536 * rate) / 24000));
 	snd_cs46xx_poke(chip, (BA1_CSPB + 4), 0x0000FFFF);
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 }
 
 /*
@@ -969,15 +965,14 @@ static int snd_cs46xx_playback_trigger(struct snd_pcm_substream *substream,
 		if (substream->runtime->periods != CS46XX_FRAGS)
 			snd_cs46xx_playback_transfer(substream);
 #else
-		spin_lock(&chip->reg_lock);
-		if (substream->runtime->periods != CS46XX_FRAGS)
-			snd_cs46xx_playback_transfer(substream);
-		{ unsigned int tmp;
-		tmp = snd_cs46xx_peek(chip, BA1_PCTL);
-		tmp &= 0x0000ffff;
-		snd_cs46xx_poke(chip, BA1_PCTL, chip->play_ctl | tmp);
+		scoped_guard(spinlock, &chip->reg_lock) {
+			unsigned int tmp;
+			if (substream->runtime->periods != CS46XX_FRAGS)
+				snd_cs46xx_playback_transfer(substream);
+			tmp = snd_cs46xx_peek(chip, BA1_PCTL);
+			tmp &= 0x0000ffff;
+			snd_cs46xx_poke(chip, BA1_PCTL, chip->play_ctl | tmp);
 		}
-		spin_unlock(&chip->reg_lock);
 #endif
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
@@ -990,13 +985,12 @@ static int snd_cs46xx_playback_trigger(struct snd_pcm_substream *substream,
 		if (!cpcm->pcm_channel->unlinked)
 			cs46xx_dsp_pcm_unlink(chip,cpcm->pcm_channel);
 #else
-		spin_lock(&chip->reg_lock);
-		{ unsigned int tmp;
-		tmp = snd_cs46xx_peek(chip, BA1_PCTL);
-		tmp &= 0x0000ffff;
-		snd_cs46xx_poke(chip, BA1_PCTL, tmp);
+		scoped_guard(spinlock, &chip->reg_lock) {
+			unsigned int tmp;
+			tmp = snd_cs46xx_peek(chip, BA1_PCTL);
+			tmp &= 0x0000ffff;
+			snd_cs46xx_poke(chip, BA1_PCTL, tmp);
 		}
-		spin_unlock(&chip->reg_lock);
 #endif
 		break;
 	default:
@@ -1012,9 +1006,8 @@ static int snd_cs46xx_capture_trigger(struct snd_pcm_substream *substream,
 {
 	struct snd_cs46xx *chip = snd_pcm_substream_chip(substream);
 	unsigned int tmp;
-	int result = 0;
 
-	spin_lock(&chip->reg_lock);
+	guard(spinlock)(&chip->reg_lock);
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
@@ -1029,12 +1022,9 @@ static int snd_cs46xx_capture_trigger(struct snd_pcm_substream *substream,
 		snd_cs46xx_poke(chip, BA1_CCTL, tmp);
 		break;
 	default:
-		result = -EINVAL;
-		break;
+		return -EINVAL;
 	}
-	spin_unlock(&chip->reg_lock);
-
-	return result;
+	return 0;
 }
 
 #ifdef CONFIG_SND_CS46XX_NEW_DSP
@@ -1371,7 +1361,7 @@ static irqreturn_t snd_cs46xx_interrupt(int irq, void *dev_id)
 	if ((status1 & HISR_MIDI) && chip->rmidi) {
 		unsigned char c;
 		
-		spin_lock(&chip->reg_lock);
+		guard(spinlock)(&chip->reg_lock);
 		while ((snd_cs46xx_peekBA0(chip, BA0_MIDSR) & MIDSR_RBE) == 0) {
 			c = snd_cs46xx_peekBA0(chip, BA0_MIDRP);
 			if ((chip->midcr & MIDCR_RIE) == 0)
@@ -1388,7 +1378,6 @@ static irqreturn_t snd_cs46xx_interrupt(int irq, void *dev_id)
 			}
 			snd_cs46xx_pokeBA0(chip, BA0_MIDWP, c);
 		}
-		spin_unlock(&chip->reg_lock);
 	}
 	/*
 	 *  EOI to the PCI part....reenables interrupts
@@ -2509,7 +2498,7 @@ static int snd_cs46xx_midi_input_open(struct snd_rawmidi_substream *substream)
 	struct snd_cs46xx *chip = substream->rmidi->private_data;
 
 	chip->active_ctrl(chip, 1);
-	spin_lock_irq(&chip->reg_lock);
+	guard(spinlock_irq)(&chip->reg_lock);
 	chip->uartm |= CS46XX_MODE_INPUT;
 	chip->midcr |= MIDCR_RXE;
 	chip->midi_input = substream;
@@ -2518,7 +2507,6 @@ static int snd_cs46xx_midi_input_open(struct snd_rawmidi_substream *substream)
 	} else {
 		snd_cs46xx_pokeBA0(chip, BA0_MIDCR, chip->midcr);
 	}
-	spin_unlock_irq(&chip->reg_lock);
 	return 0;
 }
 
@@ -2526,16 +2514,16 @@ static int snd_cs46xx_midi_input_close(struct snd_rawmidi_substream *substream)
 {
 	struct snd_cs46xx *chip = substream->rmidi->private_data;
 
-	spin_lock_irq(&chip->reg_lock);
-	chip->midcr &= ~(MIDCR_RXE | MIDCR_RIE);
-	chip->midi_input = NULL;
-	if (!(chip->uartm & CS46XX_MODE_OUTPUT)) {
-		snd_cs46xx_midi_reset(chip);
-	} else {
-		snd_cs46xx_pokeBA0(chip, BA0_MIDCR, chip->midcr);
+	scoped_guard(spinlock_irq, &chip->reg_lock) {
+		chip->midcr &= ~(MIDCR_RXE | MIDCR_RIE);
+		chip->midi_input = NULL;
+		if (!(chip->uartm & CS46XX_MODE_OUTPUT)) {
+			snd_cs46xx_midi_reset(chip);
+		} else {
+			snd_cs46xx_pokeBA0(chip, BA0_MIDCR, chip->midcr);
+		}
+		chip->uartm &= ~CS46XX_MODE_INPUT;
 	}
-	chip->uartm &= ~CS46XX_MODE_INPUT;
-	spin_unlock_irq(&chip->reg_lock);
 	chip->active_ctrl(chip, -1);
 	return 0;
 }
@@ -2546,7 +2534,7 @@ static int snd_cs46xx_midi_output_open(struct snd_rawmidi_substream *substream)
 
 	chip->active_ctrl(chip, 1);
 
-	spin_lock_irq(&chip->reg_lock);
+	guard(spinlock_irq)(&chip->reg_lock);
 	chip->uartm |= CS46XX_MODE_OUTPUT;
 	chip->midcr |= MIDCR_TXE;
 	chip->midi_output = substream;
@@ -2555,7 +2543,6 @@ static int snd_cs46xx_midi_output_open(struct snd_rawmidi_substream *substream)
 	} else {
 		snd_cs46xx_pokeBA0(chip, BA0_MIDCR, chip->midcr);
 	}
-	spin_unlock_irq(&chip->reg_lock);
 	return 0;
 }
 
@@ -2563,26 +2550,25 @@ static int snd_cs46xx_midi_output_close(struct snd_rawmidi_substream *substream)
 {
 	struct snd_cs46xx *chip = substream->rmidi->private_data;
 
-	spin_lock_irq(&chip->reg_lock);
-	chip->midcr &= ~(MIDCR_TXE | MIDCR_TIE);
-	chip->midi_output = NULL;
-	if (!(chip->uartm & CS46XX_MODE_INPUT)) {
-		snd_cs46xx_midi_reset(chip);
-	} else {
-		snd_cs46xx_pokeBA0(chip, BA0_MIDCR, chip->midcr);
+	scoped_guard(spinlock_irq, &chip->reg_lock) {
+		chip->midcr &= ~(MIDCR_TXE | MIDCR_TIE);
+		chip->midi_output = NULL;
+		if (!(chip->uartm & CS46XX_MODE_INPUT)) {
+			snd_cs46xx_midi_reset(chip);
+		} else {
+			snd_cs46xx_pokeBA0(chip, BA0_MIDCR, chip->midcr);
+		}
+		chip->uartm &= ~CS46XX_MODE_OUTPUT;
 	}
-	chip->uartm &= ~CS46XX_MODE_OUTPUT;
-	spin_unlock_irq(&chip->reg_lock);
 	chip->active_ctrl(chip, -1);
 	return 0;
 }
 
 static void snd_cs46xx_midi_input_trigger(struct snd_rawmidi_substream *substream, int up)
 {
-	unsigned long flags;
 	struct snd_cs46xx *chip = substream->rmidi->private_data;
 
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	if (up) {
 		if ((chip->midcr & MIDCR_RIE) == 0) {
 			chip->midcr |= MIDCR_RIE;
@@ -2594,16 +2580,14 @@ static void snd_cs46xx_midi_input_trigger(struct snd_rawmidi_substream *substrea
 			snd_cs46xx_pokeBA0(chip, BA0_MIDCR, chip->midcr);
 		}
 	}
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 }
 
 static void snd_cs46xx_midi_output_trigger(struct snd_rawmidi_substream *substream, int up)
 {
-	unsigned long flags;
 	struct snd_cs46xx *chip = substream->rmidi->private_data;
 	unsigned char byte;
 
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	if (up) {
 		if ((chip->midcr & MIDCR_TIE) == 0) {
 			chip->midcr |= MIDCR_TIE;
@@ -2624,7 +2608,6 @@ static void snd_cs46xx_midi_output_trigger(struct snd_rawmidi_substream *substre
 			snd_cs46xx_pokeBA0(chip, BA0_MIDCR, chip->midcr);
 		}
 	}
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 }
 
 static const struct snd_rawmidi_ops snd_cs46xx_midi_output =
diff --git a/sound/pci/cs46xx/dsp_spos.c b/sound/pci/cs46xx/dsp_spos.c
index a0f908bfe7fa..3d34575a0e8f 100644
--- a/sound/pci/cs46xx/dsp_spos.c
+++ b/sound/pci/cs46xx/dsp_spos.c
@@ -1696,7 +1696,7 @@ int cs46xx_dsp_enable_spdif_in (struct snd_cs46xx *chip)
 								ins->spdif_in_src,
 								SCB_ON_PARENT_SUBLIST_SCB);
 
-	spin_lock_irq(&chip->reg_lock);
+	guard(spinlock_irq)(&chip->reg_lock);
 
 	/* reset SPDIF input sample buffer pointer */
 	/*snd_cs46xx_poke (chip, (SPDIFI_SCB_INST + 0x0c) << 2,
@@ -1709,8 +1709,6 @@ int cs46xx_dsp_enable_spdif_in (struct snd_cs46xx *chip)
 	/* unmute SRC volume */
 	cs46xx_dsp_scb_set_volume (chip,ins->spdif_in_src,0x7fff,0x7fff);
 
-	spin_unlock_irq(&chip->reg_lock);
-
 	/* set SPDIF input sample rate and unmute
 	   NOTE: only 48khz support for SPDIF input this time */
 	/* cs46xx_dsp_set_src_sample_rate(chip,ins->spdif_in_src,48000); */
diff --git a/sound/pci/cs46xx/dsp_spos_scb_lib.c b/sound/pci/cs46xx/dsp_spos_scb_lib.c
index 660ad19e5f18..32ed415bf427 100644
--- a/sound/pci/cs46xx/dsp_spos_scb_lib.c
+++ b/sound/pci/cs46xx/dsp_spos_scb_lib.c
@@ -159,7 +159,6 @@ static void _dsp_clear_sample_buffer (struct snd_cs46xx *chip, u32 sample_buffer
 void cs46xx_dsp_remove_scb (struct snd_cs46xx *chip, struct dsp_scb_descriptor * scb)
 {
 	struct dsp_spos_instance * ins = chip->dsp_spos_instance;
-	unsigned long flags;
 
 	/* check integrety */
 	if (snd_BUG_ON(scb->index < 0 ||
@@ -175,9 +174,9 @@ void cs46xx_dsp_remove_scb (struct snd_cs46xx *chip, struct dsp_scb_descriptor *
 		goto _end;
 #endif
 
-	spin_lock_irqsave(&chip->reg_lock, flags);    
-	_dsp_unlink_scb (chip,scb);
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
+	scoped_guard(spinlock_irqsave, &chip->reg_lock) {
+		_dsp_unlink_scb(chip, scb);
+	}
 
 	cs46xx_dsp_proc_free_scb_desc(scb);
 	if (snd_BUG_ON(!scb->scb_symbol))
@@ -262,8 +261,6 @@ _dsp_create_generic_scb (struct snd_cs46xx *chip, char * name, u32 * scb_data, u
 	struct dsp_spos_instance * ins = chip->dsp_spos_instance;
 	struct dsp_scb_descriptor * scb;
   
-	unsigned long flags;
-
 	if (snd_BUG_ON(!ins->the_null_scb))
 		return NULL;
 
@@ -317,12 +314,10 @@ _dsp_create_generic_scb (struct snd_cs46xx *chip, char * name, u32 * scb_data, u
 			snd_BUG();
 		}
 
-		spin_lock_irqsave(&chip->reg_lock, flags);
-
-		/* update entry in DSP RAM */
-		cs46xx_dsp_spos_update_scb(chip,scb->parent_scb_ptr);
-
-		spin_unlock_irqrestore(&chip->reg_lock, flags);
+		scoped_guard(spinlock_irqsave, &chip->reg_lock) {
+			/* update entry in DSP RAM */
+			cs46xx_dsp_spos_update_scb(chip, scb->parent_scb_ptr);
+		}
 	}
 
 
@@ -1219,7 +1214,6 @@ cs46xx_dsp_create_pcm_channel (struct snd_cs46xx * chip,
 	/* struct dsp_scb_descriptor * pcm_parent_scb; */
 	char scb_name[DSP_MAX_SCB_NAME];
 	int i, pcm_index = -1, insert_point, src_index = -1, pass_through = 0;
-	unsigned long flags;
 
 	switch (pcm_channel_id) {
 	case DSP_PCM_MAIN_CHANNEL:
@@ -1356,7 +1350,7 @@ cs46xx_dsp_create_pcm_channel (struct snd_cs46xx * chip,
 		return NULL;
 	}
 	
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	ins->pcm_channels[pcm_index].sample_rate = sample_rate;
 	ins->pcm_channels[pcm_index].pcm_reader_scb = pcm_scb;
 	ins->pcm_channels[pcm_index].src_scb = src_scb;
@@ -1367,7 +1361,6 @@ cs46xx_dsp_create_pcm_channel (struct snd_cs46xx * chip,
 	ins->pcm_channels[pcm_index].pcm_slot = pcm_index;
 	ins->pcm_channels[pcm_index].mixer_scb = mixer_scb;
 	ins->npcm_channels ++;
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 
 	return (ins->pcm_channels + pcm_index);
 }
@@ -1455,20 +1448,19 @@ void cs46xx_dsp_destroy_pcm_channel (struct snd_cs46xx * chip,
 				     struct dsp_pcm_channel_descriptor * pcm_channel)
 {
 	struct dsp_spos_instance * ins = chip->dsp_spos_instance;
-	unsigned long flags;
 
 	if (snd_BUG_ON(!pcm_channel->active ||
 		       ins->npcm_channels <= 0 ||
 		       pcm_channel->src_scb->ref_count <= 0))
 		return;
 
-	spin_lock_irqsave(&chip->reg_lock, flags);
-	pcm_channel->unlinked = 1;
-	pcm_channel->active = 0;
-	pcm_channel->private_data = NULL;
-	pcm_channel->src_scb->ref_count --;
-	ins->npcm_channels --;
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
+	scoped_guard(spinlock_irqsave, &chip->reg_lock) {
+		pcm_channel->unlinked = 1;
+		pcm_channel->active = 0;
+		pcm_channel->private_data = NULL;
+		pcm_channel->src_scb->ref_count--;
+		ins->npcm_channels--;
+	}
 
 	cs46xx_dsp_remove_scb(chip,pcm_channel->pcm_reader_scb);
 
@@ -1487,22 +1479,17 @@ void cs46xx_dsp_destroy_pcm_channel (struct snd_cs46xx * chip,
 int cs46xx_dsp_pcm_unlink (struct snd_cs46xx * chip,
 			   struct dsp_pcm_channel_descriptor * pcm_channel)
 {
-	unsigned long flags;
-
 	if (snd_BUG_ON(!pcm_channel->active ||
 		       chip->dsp_spos_instance->npcm_channels <= 0))
 		return -EIO;
 
-	spin_lock_irqsave(&chip->reg_lock, flags);
-	if (pcm_channel->unlinked) {
-		spin_unlock_irqrestore(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
+	if (pcm_channel->unlinked)
 		return -EIO;
-	}
 
 	pcm_channel->unlinked = 1;
 
 	_dsp_unlink_scb (chip,pcm_channel->pcm_reader_scb);
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 
 	return 0;
 }
@@ -1513,14 +1500,11 @@ int cs46xx_dsp_pcm_link (struct snd_cs46xx * chip,
 	struct dsp_spos_instance * ins = chip->dsp_spos_instance;
 	struct dsp_scb_descriptor * parent_scb;
 	struct dsp_scb_descriptor * src_scb = pcm_channel->src_scb;
-	unsigned long flags;
 
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 
-	if (pcm_channel->unlinked == 0) {
-		spin_unlock_irqrestore(&chip->reg_lock, flags);
+	if (pcm_channel->unlinked == 0)
 		return -EIO;
-	}
 
 	parent_scb = src_scb;
 
@@ -1541,7 +1525,6 @@ int cs46xx_dsp_pcm_link (struct snd_cs46xx * chip,
 	cs46xx_dsp_spos_update_scb(chip,parent_scb);
 
 	pcm_channel->unlinked = 0;
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 	return 0;
 }
 
@@ -1574,17 +1557,14 @@ cs46xx_add_record_source (struct snd_cs46xx *chip, struct dsp_scb_descriptor * s
 
 int cs46xx_src_unlink(struct snd_cs46xx *chip, struct dsp_scb_descriptor * src)
 {
-	unsigned long flags;
-
 	if (snd_BUG_ON(!src->parent_scb_ptr))
 		return -EINVAL;
 
 	/* mute SCB */
 	cs46xx_dsp_scb_set_volume (chip,src,0,0);
 
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	_dsp_unlink_scb (chip,src);
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 
 	return 0;
 }
-- 
2.50.1

