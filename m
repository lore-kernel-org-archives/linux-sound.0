Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D839D2EA170
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756478880; cv=none; b=RNuvSWHrDBtzY2/5GWdWoHP8Q8HRQkOjaPjl5VHvb5EqGwgJ/c7dOe4RvZk1wXkKLMJzkLiyVGH5vK7MzHkjAL/eoI8djdKvi3Qn27uA/daeTvhOJR5N2SN+Ssehj/rO8PzRZ6a+Ch1yiuWB+2IXlSpeuQStJd2I0hpNBFzVI0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756478880; c=relaxed/simple;
	bh=VjzIgfD1MiO3D0vWnWOUhfMabyyMUvfw5wzL02dDuk0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lp2yENvB54fo6MUJlyGZcTGfOVqe47MkQDpV1wl0YhBF1wiZexLcU/A33/+kQ3ylOvOq0afBScS4Z2gHnw9NaTLhc3GvOhJ2zDh8Emi+S5IeqVXlARpLd+aO26O4o27MNjsBMIdWjW53jrmM3C42aaJ2eUV0Ua2ERuiNVfINT2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uHIP4HHg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0C2K7Yhx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uHIP4HHg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0C2K7Yhx; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uHIP4HHg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0C2K7Yhx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uHIP4HHg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0C2K7Yhx"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 33C6A5C245;
	Fri, 29 Aug 2025 14:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478644; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JBNXUCZ1CtjcaPoCvXhRiqumF2PWVV0QSWsv0q/mpmc=;
	b=uHIP4HHgo6bpdckjqGUN8+43dqa29ETS2ENaP7YW7ua3uLPl0jet9QrB7xZ36f66oNMg7/
	OKfs6yX/WHAxT7NHjfSMd8qzpfRJkG4MNT1axs3fbjYv+WSbPIS1v3pqCbijpd13tLipVn
	97i9Tyh0QkHMmYfpNsfnTy1wMfQBxxo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478644;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JBNXUCZ1CtjcaPoCvXhRiqumF2PWVV0QSWsv0q/mpmc=;
	b=0C2K7YhxqAuCcHYqU0M/yvq9tqhKbL8ewjhqZjLWcjqnwz/K/e5pufbtMRXAkojaOXoXa8
	ySnY51+JOZuIP+BA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478644; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JBNXUCZ1CtjcaPoCvXhRiqumF2PWVV0QSWsv0q/mpmc=;
	b=uHIP4HHgo6bpdckjqGUN8+43dqa29ETS2ENaP7YW7ua3uLPl0jet9QrB7xZ36f66oNMg7/
	OKfs6yX/WHAxT7NHjfSMd8qzpfRJkG4MNT1axs3fbjYv+WSbPIS1v3pqCbijpd13tLipVn
	97i9Tyh0QkHMmYfpNsfnTy1wMfQBxxo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478644;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JBNXUCZ1CtjcaPoCvXhRiqumF2PWVV0QSWsv0q/mpmc=;
	b=0C2K7YhxqAuCcHYqU0M/yvq9tqhKbL8ewjhqZjLWcjqnwz/K/e5pufbtMRXAkojaOXoXa8
	ySnY51+JOZuIP+BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1A60A13A3E;
	Fri, 29 Aug 2025 14:44:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uAxKBbS8sWi6GAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:44:04 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 59/61] ALSA: via82xx: Use guard() for spin locks
Date: Fri, 29 Aug 2025 16:43:34 +0200
Message-ID: <20250829144342.4290-60-tiwai@suse.de>
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
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLsqo7dymd5dgmoaprf5rep8is)];
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
 sound/pci/via82xx.c       | 80 ++++++++++++++++++---------------------
 sound/pci/via82xx_modem.c |  6 +--
 2 files changed, 39 insertions(+), 47 deletions(-)

diff --git a/sound/pci/via82xx.c b/sound/pci/via82xx.c
index 0753c0c73f51..2b0f9e38863e 100644
--- a/sound/pci/via82xx.c
+++ b/sound/pci/via82xx.c
@@ -628,7 +628,7 @@ static irqreturn_t snd_via686_interrupt(int irq, void *dev_id)
 	}
 
 	/* check status for each stream */
-	spin_lock(&chip->reg_lock);
+	guard(spinlock)(&chip->reg_lock);
 	for (i = 0; i < chip->num_devs; i++) {
 		struct viadev *viadev = &chip->devs[i];
 		unsigned char c_status = inb(VIADEV_REG(viadev, OFFSET_STATUS));
@@ -652,7 +652,6 @@ static irqreturn_t snd_via686_interrupt(int irq, void *dev_id)
 		}
 		outb(c_status, VIADEV_REG(viadev, OFFSET_STATUS)); /* ack */
 	}
-	spin_unlock(&chip->reg_lock);
 	return IRQ_HANDLED;
 }
 
@@ -667,7 +666,7 @@ static irqreturn_t snd_via8233_interrupt(int irq, void *dev_id)
 	int irqreturn = 0;
 
 	/* check status for each stream */
-	spin_lock(&chip->reg_lock);
+	guard(spinlock)(&chip->reg_lock);
 	status = inl(VIAREG(chip, SGD_SHADOW));
 
 	for (i = 0; i < chip->num_devs; i++) {
@@ -706,7 +705,6 @@ static irqreturn_t snd_via8233_interrupt(int irq, void *dev_id)
 		outb(c_status, VIADEV_REG(viadev, OFFSET_STATUS)); /* ack */
 		irqreturn = 1;
 	}
-	spin_unlock(&chip->reg_lock);
 	return IRQ_RETVAL(irqreturn);
 }
 
@@ -833,7 +831,7 @@ static snd_pcm_uframes_t snd_via686_pcm_pointer(struct snd_pcm_substream *substr
 	if (!(inb(VIADEV_REG(viadev, OFFSET_STATUS)) & VIA_REG_STAT_ACTIVE))
 		return 0;
 
-	spin_lock(&chip->reg_lock);
+	guard(spinlock)(&chip->reg_lock);
 	count = inl(VIADEV_REG(viadev, OFFSET_CURR_COUNT)) & 0xffffff;
 	/* The via686a does not have the current index register,
 	 * so we need to calculate the index from CURR_PTR.
@@ -845,7 +843,6 @@ static snd_pcm_uframes_t snd_via686_pcm_pointer(struct snd_pcm_substream *substr
 		idx = ((ptr - (unsigned int)viadev->table.addr) / 8 - 1) % viadev->tbl_entries;
 	res = calc_linear_pos(chip, viadev, idx, count);
 	viadev->lastpos = res; /* remember the last position */
-	spin_unlock(&chip->reg_lock);
 
 	return bytes_to_frames(substream->runtime, res);
 }
@@ -863,7 +860,7 @@ static snd_pcm_uframes_t snd_via8233_pcm_pointer(struct snd_pcm_substream *subst
 	if (snd_BUG_ON(!viadev->tbl_entries))
 		return 0;
 
-	spin_lock(&chip->reg_lock);
+	guard(spinlock)(&chip->reg_lock);
 	count = inl(VIADEV_REG(viadev, OFFSET_CURR_COUNT));
 	status = viadev->in_interrupt;
 	if (!status)
@@ -904,7 +901,6 @@ static snd_pcm_uframes_t snd_via8233_pcm_pointer(struct snd_pcm_substream *subst
 	}			    
 unlock:
 	viadev->lastpos = res;
-	spin_unlock(&chip->reg_lock);
 
 	return bytes_to_frames(substream->runtime, res);
 }
@@ -997,7 +993,7 @@ static int via_lock_rate(struct via_rate_lock *rec, int rate)
 {
 	int changed = 0;
 
-	spin_lock_irq(&rec->lock);
+	guard(spinlock_irq)(&rec->lock);
 	if (rec->rate != rate) {
 		if (rec->rate && rec->used > 1) /* already set */
 			changed = -EINVAL;
@@ -1006,7 +1002,6 @@ static int via_lock_rate(struct via_rate_lock *rec, int rate)
 			changed = 1;
 		}
 	}
-	spin_unlock_irq(&rec->lock);
 	return changed;
 }
 
@@ -1167,33 +1162,33 @@ static int snd_via82xx_pcm_open(struct via82xx *chip, struct viadev *viadev,
 	
 	/* set the hw rate condition */
 	ratep = &chip->rates[viadev->direction];
-	spin_lock_irq(&ratep->lock);
-	ratep->used++;
-	if (chip->spdif_on && viadev->reg_offset == 0x30) {
-		/* DXS#3 and spdif is on */
-		runtime->hw.rates = chip->ac97->rates[AC97_RATES_SPDIF];
-		snd_pcm_limit_hw_rates(runtime);
-	} else if (chip->dxs_fixed && viadev->reg_offset < 0x40) {
-		/* fixed DXS playback rate */
-		runtime->hw.rates = SNDRV_PCM_RATE_48000;
-		runtime->hw.rate_min = runtime->hw.rate_max = 48000;
-	} else if (chip->dxs_src && viadev->reg_offset < 0x40) {
-		/* use full SRC capabilities of DXS */
-		runtime->hw.rates = (SNDRV_PCM_RATE_CONTINUOUS |
-				     SNDRV_PCM_RATE_8000_48000);
-		runtime->hw.rate_min = 8000;
-		runtime->hw.rate_max = 48000;
-		use_src = true;
-	} else if (! ratep->rate) {
-		int idx = viadev->direction ? AC97_RATES_ADC : AC97_RATES_FRONT_DAC;
-		runtime->hw.rates = chip->ac97->rates[idx];
-		snd_pcm_limit_hw_rates(runtime);
-	} else {
-		/* a fixed rate */
-		runtime->hw.rates = SNDRV_PCM_RATE_KNOT;
-		runtime->hw.rate_max = runtime->hw.rate_min = ratep->rate;
+	scoped_guard(spinlock_irq, &ratep->lock) {
+		ratep->used++;
+		if (chip->spdif_on && viadev->reg_offset == 0x30) {
+			/* DXS#3 and spdif is on */
+			runtime->hw.rates = chip->ac97->rates[AC97_RATES_SPDIF];
+			snd_pcm_limit_hw_rates(runtime);
+		} else if (chip->dxs_fixed && viadev->reg_offset < 0x40) {
+			/* fixed DXS playback rate */
+			runtime->hw.rates = SNDRV_PCM_RATE_48000;
+			runtime->hw.rate_min = runtime->hw.rate_max = 48000;
+		} else if (chip->dxs_src && viadev->reg_offset < 0x40) {
+			/* use full SRC capabilities of DXS */
+			runtime->hw.rates = (SNDRV_PCM_RATE_CONTINUOUS |
+					     SNDRV_PCM_RATE_8000_48000);
+			runtime->hw.rate_min = 8000;
+			runtime->hw.rate_max = 48000;
+			use_src = true;
+		} else if (!ratep->rate) {
+			int idx = viadev->direction ? AC97_RATES_ADC : AC97_RATES_FRONT_DAC;
+			runtime->hw.rates = chip->ac97->rates[idx];
+			snd_pcm_limit_hw_rates(runtime);
+		} else {
+			/* a fixed rate */
+			runtime->hw.rates = SNDRV_PCM_RATE_KNOT;
+			runtime->hw.rate_max = runtime->hw.rate_min = ratep->rate;
+		}
 	}
-	spin_unlock_irq(&ratep->lock);
 
 	/* we may remove following constaint when we modify table entries
 	   in interrupt */
@@ -1311,11 +1306,11 @@ static int snd_via82xx_pcm_close(struct snd_pcm_substream *substream)
 
 	/* release the rate lock */
 	ratep = &chip->rates[viadev->direction];
-	spin_lock_irq(&ratep->lock);
-	ratep->used--;
-	if (! ratep->used)
-		ratep->rate = 0;
-	spin_unlock_irq(&ratep->lock);
+	scoped_guard(spinlock_irq, &ratep->lock) {
+		ratep->used--;
+		if (!ratep->used)
+			ratep->rate = 0;
+	}
 	if (! ratep->rate) {
 		if (! viadev->direction) {
 			snd_ac97_update_power(chip->ac97,
@@ -1606,14 +1601,13 @@ static int snd_via8233_capture_source_put(struct snd_kcontrol *kcontrol,
 	unsigned long port = chip->port + (kcontrol->id.index ? (VIA_REG_CAPTURE_CHANNEL + 0x10) : VIA_REG_CAPTURE_CHANNEL);
 	u8 val, oval;
 
-	spin_lock_irq(&chip->reg_lock);
+	guard(spinlock_irq)(&chip->reg_lock);
 	oval = inb(port);
 	val = oval & ~VIA_REG_CAPTURE_CHANNEL_MIC;
 	if (ucontrol->value.enumerated.item[0])
 		val |= VIA_REG_CAPTURE_CHANNEL_MIC;
 	if (val != oval)
 		outb(val, port);
-	spin_unlock_irq(&chip->reg_lock);
 	return val != oval;
 }
 
diff --git a/sound/pci/via82xx_modem.c b/sound/pci/via82xx_modem.c
index 12a8c620724d..6ce2cd88cda6 100644
--- a/sound/pci/via82xx_modem.c
+++ b/sound/pci/via82xx_modem.c
@@ -483,7 +483,7 @@ static irqreturn_t snd_via82xx_interrupt(int irq, void *dev_id)
 // _skip_sgd:
 
 	/* check status for each stream */
-	spin_lock(&chip->reg_lock);
+	guard(spinlock)(&chip->reg_lock);
 	for (i = 0; i < chip->num_devs; i++) {
 		struct viadev *viadev = &chip->devs[i];
 		unsigned char c_status = inb(VIADEV_REG(viadev, OFFSET_STATUS));
@@ -497,7 +497,6 @@ static irqreturn_t snd_via82xx_interrupt(int irq, void *dev_id)
 		}
 		outb(c_status, VIADEV_REG(viadev, OFFSET_STATUS)); /* ack */
 	}
-	spin_unlock(&chip->reg_lock);
 	return IRQ_HANDLED;
 }
 
@@ -616,7 +615,7 @@ static snd_pcm_uframes_t snd_via686_pcm_pointer(struct snd_pcm_substream *substr
 	if (!(inb(VIADEV_REG(viadev, OFFSET_STATUS)) & VIA_REG_STAT_ACTIVE))
 		return 0;
 
-	spin_lock(&chip->reg_lock);
+	guard(spinlock)(&chip->reg_lock);
 	count = inl(VIADEV_REG(viadev, OFFSET_CURR_COUNT)) & 0xffffff;
 	/* The via686a does not have the current index register,
 	 * so we need to calculate the index from CURR_PTR.
@@ -628,7 +627,6 @@ static snd_pcm_uframes_t snd_via686_pcm_pointer(struct snd_pcm_substream *substr
 		idx = ((ptr - (unsigned int)viadev->table.addr) / 8 - 1) %
 			viadev->tbl_entries;
 	res = calc_linear_pos(chip, viadev, idx, count);
-	spin_unlock(&chip->reg_lock);
 
 	return bytes_to_frames(substream->runtime, res);
 }
-- 
2.50.1

