Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A979D3203A4
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756478703; cv=none; b=ORT9OeeAyaowFxeZB61nzB7OWGOuMa3JefVuzuBYmxL8/sHPHOnD604PV4P5m2DgxKuW6siy9kijx3OsKnvJmA3Xg45XJr23BkwI/6vHaHPqZ3UtTxAbjYeFdOmP79BLCj8l3pSdi6FZFR/Yzhaxv2JPWn5xdILmlR/pXQc2JWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756478703; c=relaxed/simple;
	bh=KAMEIy2rlIdukSi4GdI6PZE5ZEJ+msnxeQ3Mg6oW9rA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UBMul/a16Vme4TkueePJvW1C+qpmGqdudBlbDOz9F8uRuMmWY67rMyTgsBwu6uZWB61jqwc7HmyHsv+AUVKQltDhf0uWacMRIg+XEieh82DV3WfW2h3knTi5phiB/Rt1QzPK4Sv+zpmjeHRpjGZobgVsdkvoH4tyaxOkmfYBnwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gEhH1ou/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nzKOO4Nw; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gEhH1ou/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nzKOO4Nw; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gEhH1ou/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nzKOO4Nw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gEhH1ou/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nzKOO4Nw"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2C7DD5C230;
	Fri, 29 Aug 2025 14:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478638; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OATg5PjX+//eTCVKCyZNKZt3kJcP2ho+nzr+QM25wiY=;
	b=gEhH1ou/5kuu+orYZ8KXUrYYCJwVZOJxY2yPh9UaQHnLDVcclapkOIDMphYaz619hcfP/s
	bc7+8HwPJ5oznuxJV0n212gvOiq0Qso++yqg71+ue8AfT3A6dSWiTTA9KMKfXWwBKYY7ZE
	pT4UBDo15PkmjMdY3mKCfw2BykpO29o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478638;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OATg5PjX+//eTCVKCyZNKZt3kJcP2ho+nzr+QM25wiY=;
	b=nzKOO4NwURctTdx7tOCFgkuU4Us3kf5p0WZ5SnTRARg5oS+SXRVFLMu2WTnyvBBNacC6Pb
	PO3dMioS5w+P1xDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="gEhH1ou/";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=nzKOO4Nw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478638; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OATg5PjX+//eTCVKCyZNKZt3kJcP2ho+nzr+QM25wiY=;
	b=gEhH1ou/5kuu+orYZ8KXUrYYCJwVZOJxY2yPh9UaQHnLDVcclapkOIDMphYaz619hcfP/s
	bc7+8HwPJ5oznuxJV0n212gvOiq0Qso++yqg71+ue8AfT3A6dSWiTTA9KMKfXWwBKYY7ZE
	pT4UBDo15PkmjMdY3mKCfw2BykpO29o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478638;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OATg5PjX+//eTCVKCyZNKZt3kJcP2ho+nzr+QM25wiY=;
	b=nzKOO4NwURctTdx7tOCFgkuU4Us3kf5p0WZ5SnTRARg5oS+SXRVFLMu2WTnyvBBNacC6Pb
	PO3dMioS5w+P1xDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 135A713A3E;
	Fri, 29 Aug 2025 14:43:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6FScA668sWi6GAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:43:58 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 18/61] ALSA: cs4281: Use guard() for spin locks
Date: Fri, 29 Aug 2025 16:42:53 +0200
Message-ID: <20250829144342.4290-19-tiwai@suse.de>
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
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 2C7DD5C230
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01

Clean up the code using guard() for spin locks.

Merely code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/cs4281.c | 53 +++++++++++++++++-----------------------------
 1 file changed, 19 insertions(+), 34 deletions(-)

diff --git a/sound/pci/cs4281.c b/sound/pci/cs4281.c
index 31cb9cbe2f03..c519fb9cdd1e 100644
--- a/sound/pci/cs4281.c
+++ b/sound/pci/cs4281.c
@@ -651,7 +651,7 @@ static int snd_cs4281_trigger(struct snd_pcm_substream *substream, int cmd)
 	struct cs4281_dma *dma = substream->runtime->private_data;
 	struct cs4281 *chip = snd_pcm_substream_chip(substream);
 
-	spin_lock(&chip->reg_lock);
+	guard(spinlock)(&chip->reg_lock);
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 		dma->valDCR |= BA0_DCR_MSK;
@@ -678,13 +678,11 @@ static int snd_cs4281_trigger(struct snd_pcm_substream *substream, int cmd)
 			dma->valFCR &= ~BA0_FCR_FEN;
 		break;
 	default:
-		spin_unlock(&chip->reg_lock);
 		return -EINVAL;
 	}
 	snd_cs4281_pokeBA0(chip, dma->regDMR, dma->valDMR);
 	snd_cs4281_pokeBA0(chip, dma->regFCR, dma->valFCR);
 	snd_cs4281_pokeBA0(chip, dma->regDCR, dma->valDCR);
-	spin_unlock(&chip->reg_lock);
 	return 0;
 }
 
@@ -782,9 +780,8 @@ static int snd_cs4281_playback_prepare(struct snd_pcm_substream *substream)
 	struct cs4281_dma *dma = runtime->private_data;
 	struct cs4281 *chip = snd_pcm_substream_chip(substream);
 
-	spin_lock_irq(&chip->reg_lock);
+	guard(spinlock_irq)(&chip->reg_lock);
 	snd_cs4281_mode(chip, dma, runtime, 0, 1);
-	spin_unlock_irq(&chip->reg_lock);
 	return 0;
 }
 
@@ -794,9 +791,8 @@ static int snd_cs4281_capture_prepare(struct snd_pcm_substream *substream)
 	struct cs4281_dma *dma = runtime->private_data;
 	struct cs4281 *chip = snd_pcm_substream_chip(substream);
 
-	spin_lock_irq(&chip->reg_lock);
+	guard(spinlock_irq)(&chip->reg_lock);
 	snd_cs4281_mode(chip, dma, runtime, 1, 1);
-	spin_unlock_irq(&chip->reg_lock);
 	return 0;
 }
 
@@ -1580,7 +1576,7 @@ static int snd_cs4281_midi_input_open(struct snd_rawmidi_substream *substream)
 {
 	struct cs4281 *chip = substream->rmidi->private_data;
 
-	spin_lock_irq(&chip->reg_lock);
+	guard(spinlock_irq)(&chip->reg_lock);
  	chip->midcr |= BA0_MIDCR_RXE;
 	chip->midi_input = substream;
 	if (!(chip->uartm & CS4281_MODE_OUTPUT)) {
@@ -1588,7 +1584,6 @@ static int snd_cs4281_midi_input_open(struct snd_rawmidi_substream *substream)
 	} else {
 		snd_cs4281_pokeBA0(chip, BA0_MIDCR, chip->midcr);
 	}
-	spin_unlock_irq(&chip->reg_lock);
 	return 0;
 }
 
@@ -1596,7 +1591,7 @@ static int snd_cs4281_midi_input_close(struct snd_rawmidi_substream *substream)
 {
 	struct cs4281 *chip = substream->rmidi->private_data;
 
-	spin_lock_irq(&chip->reg_lock);
+	guard(spinlock_irq)(&chip->reg_lock);
 	chip->midcr &= ~(BA0_MIDCR_RXE | BA0_MIDCR_RIE);
 	chip->midi_input = NULL;
 	if (!(chip->uartm & CS4281_MODE_OUTPUT)) {
@@ -1605,7 +1600,6 @@ static int snd_cs4281_midi_input_close(struct snd_rawmidi_substream *substream)
 		snd_cs4281_pokeBA0(chip, BA0_MIDCR, chip->midcr);
 	}
 	chip->uartm &= ~CS4281_MODE_INPUT;
-	spin_unlock_irq(&chip->reg_lock);
 	return 0;
 }
 
@@ -1613,7 +1607,7 @@ static int snd_cs4281_midi_output_open(struct snd_rawmidi_substream *substream)
 {
 	struct cs4281 *chip = substream->rmidi->private_data;
 
-	spin_lock_irq(&chip->reg_lock);
+	guard(spinlock_irq)(&chip->reg_lock);
 	chip->uartm |= CS4281_MODE_OUTPUT;
 	chip->midcr |= BA0_MIDCR_TXE;
 	chip->midi_output = substream;
@@ -1622,7 +1616,6 @@ static int snd_cs4281_midi_output_open(struct snd_rawmidi_substream *substream)
 	} else {
 		snd_cs4281_pokeBA0(chip, BA0_MIDCR, chip->midcr);
 	}
-	spin_unlock_irq(&chip->reg_lock);
 	return 0;
 }
 
@@ -1630,7 +1623,7 @@ static int snd_cs4281_midi_output_close(struct snd_rawmidi_substream *substream)
 {
 	struct cs4281 *chip = substream->rmidi->private_data;
 
-	spin_lock_irq(&chip->reg_lock);
+	guard(spinlock_irq)(&chip->reg_lock);
 	chip->midcr &= ~(BA0_MIDCR_TXE | BA0_MIDCR_TIE);
 	chip->midi_output = NULL;
 	if (!(chip->uartm & CS4281_MODE_INPUT)) {
@@ -1639,16 +1632,14 @@ static int snd_cs4281_midi_output_close(struct snd_rawmidi_substream *substream)
 		snd_cs4281_pokeBA0(chip, BA0_MIDCR, chip->midcr);
 	}
 	chip->uartm &= ~CS4281_MODE_OUTPUT;
-	spin_unlock_irq(&chip->reg_lock);
 	return 0;
 }
 
 static void snd_cs4281_midi_input_trigger(struct snd_rawmidi_substream *substream, int up)
 {
-	unsigned long flags;
 	struct cs4281 *chip = substream->rmidi->private_data;
 
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	if (up) {
 		if ((chip->midcr & BA0_MIDCR_RIE) == 0) {
 			chip->midcr |= BA0_MIDCR_RIE;
@@ -1660,16 +1651,14 @@ static void snd_cs4281_midi_input_trigger(struct snd_rawmidi_substream *substrea
 			snd_cs4281_pokeBA0(chip, BA0_MIDCR, chip->midcr);
 		}
 	}
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 }
 
 static void snd_cs4281_midi_output_trigger(struct snd_rawmidi_substream *substream, int up)
 {
-	unsigned long flags;
 	struct cs4281 *chip = substream->rmidi->private_data;
 	unsigned char byte;
 
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	if (up) {
 		if ((chip->midcr & BA0_MIDCR_TIE) == 0) {
 			chip->midcr |= BA0_MIDCR_TIE;
@@ -1690,7 +1679,6 @@ static void snd_cs4281_midi_output_trigger(struct snd_rawmidi_substream *substre
 			snd_cs4281_pokeBA0(chip, BA0_MIDCR, chip->midcr);
 		}
 	}
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 }
 
 static const struct snd_rawmidi_ops snd_cs4281_midi_output =
@@ -1743,10 +1731,12 @@ static irqreturn_t snd_cs4281_interrupt(int irq, void *dev_id)
 	}
 
 	if (status & (BA0_HISR_DMA(0)|BA0_HISR_DMA(1)|BA0_HISR_DMA(2)|BA0_HISR_DMA(3))) {
-		for (dma = 0; dma < 4; dma++)
+		for (dma = 0; dma < 4; dma++) {
+			bool period_elapsed = false;
+			cdma = &chip->dma[dma];
+
 			if (status & BA0_HISR_DMA(dma)) {
-				cdma = &chip->dma[dma];
-				spin_lock(&chip->reg_lock);
+				guard(spinlock)(&chip->reg_lock);
 				/* ack DMA IRQ */
 				val = snd_cs4281_peekBA0(chip, cdma->regHDSR);
 				/* workaround, sometimes CS4281 acknowledges */
@@ -1755,24 +1745,23 @@ static irqreturn_t snd_cs4281_interrupt(int irq, void *dev_id)
 				if ((val & BA0_HDSR_DHTC) && !(cdma->frag & 1)) {
 					cdma->frag--;
 					chip->spurious_dhtc_irq++;
-					spin_unlock(&chip->reg_lock);
 					continue;
 				}
 				if ((val & BA0_HDSR_DTC) && (cdma->frag & 1)) {
 					cdma->frag--;
 					chip->spurious_dtc_irq++;
-					spin_unlock(&chip->reg_lock);
 					continue;
 				}
-				spin_unlock(&chip->reg_lock);
-				snd_pcm_period_elapsed(cdma->substream);
 			}
+			if (period_elapsed)
+				snd_pcm_period_elapsed(cdma->substream);
+		}
 	}
 
 	if ((status & BA0_HISR_MIDI) && chip->rmidi) {
 		unsigned char c;
 		
-		spin_lock(&chip->reg_lock);
+		guard(spinlock)(&chip->reg_lock);
 		while ((snd_cs4281_peekBA0(chip, BA0_MIDSR) & BA0_MIDSR_RBE) == 0) {
 			c = snd_cs4281_peekBA0(chip, BA0_MIDRP);
 			if ((chip->midcr & BA0_MIDCR_RIE) == 0)
@@ -1789,7 +1778,6 @@ static irqreturn_t snd_cs4281_interrupt(int irq, void *dev_id)
 			}
 			snd_cs4281_pokeBA0(chip, BA0_MIDWP, c);
 		}
-		spin_unlock(&chip->reg_lock);
 	}
 
 	/* EOI to the PCI part... reenables interrupts */
@@ -1805,7 +1793,6 @@ static irqreturn_t snd_cs4281_interrupt(int irq, void *dev_id)
 static void snd_cs4281_opl3_command(struct snd_opl3 *opl3, unsigned short cmd,
 				    unsigned char val)
 {
-	unsigned long flags;
 	struct cs4281 *chip = opl3->private_data;
 	void __iomem *port;
 
@@ -1814,15 +1801,13 @@ static void snd_cs4281_opl3_command(struct snd_opl3 *opl3, unsigned short cmd,
 	else
 		port = chip->ba0 + BA0_B0AP; /* left port */
 
-	spin_lock_irqsave(&opl3->reg_lock, flags);
+	guard(spinlock_irqsave)(&opl3->reg_lock);
 
 	writel((unsigned int)cmd, port);
 	udelay(10);
 
 	writel((unsigned int)val, port + 4);
 	udelay(30);
-
-	spin_unlock_irqrestore(&opl3->reg_lock, flags);
 }
 
 static int __snd_cs4281_probe(struct pci_dev *pci,
-- 
2.50.1

