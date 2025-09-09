Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F17334722
	for <linux-sound@vger.kernel.org>; Tue,  9 Sep 2025 12:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757421842; cv=none; b=AkJGwUs09hbs0cDHmF59cc/uZpYsy5puhESFkwAK4zpr0jIIVm3mfDVqciOgm1LJkLmF3z6nBHB+Oitmka3XNUuHPA4o0dvDr5p3hpX/Xe/Dn0Tf9xyZtRWFvVJQka2tYKmhlwMZ2Kn5DdLs1F0B8HJf55O7aumTpGctkNWC8SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757421842; c=relaxed/simple;
	bh=A9QhMoKR6YasXFQEaMlpXfALTJ7/6ZShZf9jG7xfuLw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IAlScSGugBQa9fg704ar+ltjHO3MLEz9VjIvYQnkGjwDazO/+nujisdXMnaSzD8tXkO+KB9IyS/b3ZvBYUPRWm+nOl/ydYHmb0JGIRe/0X5v7hrbxmpBfMkdSgPUD6AVna/heiY7RV4JY17TtNm4XZ5A9N2H6hB+F59Bmw1+iFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bWz1e6Qz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=A25lBDCD; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bWz1e6Qz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=A25lBDCD; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bWz1e6Qz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="A25lBDCD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bWz1e6Qz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="A25lBDCD"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B749A33BFC;
	Tue,  9 Sep 2025 12:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1757421814; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BZVxWwJMpmbRiwE1IPPvybOvbj+FR0SmdWlNRNrjWnM=;
	b=bWz1e6Qzq9sqZVhEr8O7v4kYF93872i44+rX5Mzbaxbg53YDBU7CFeMgZNIx1Kto186BFv
	lkP4UiJNV5urtsi+PwG1kfZXCZJ23hnL+ZvkGUhuHvtDBIHp6iUBr84hln2Jot2JKGsdF5
	TqUxdoEF7KiOdNWviEBnQII6Gx5kSnw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757421814;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BZVxWwJMpmbRiwE1IPPvybOvbj+FR0SmdWlNRNrjWnM=;
	b=A25lBDCDuwDzeSp4yZR0eUD0rp9+i7+GrEhnwo58zq2xuXaZkQ7YeR3mDxwq53keC/VSj7
	M2F1ROEPlWfowUAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=bWz1e6Qz;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=A25lBDCD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1757421814; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BZVxWwJMpmbRiwE1IPPvybOvbj+FR0SmdWlNRNrjWnM=;
	b=bWz1e6Qzq9sqZVhEr8O7v4kYF93872i44+rX5Mzbaxbg53YDBU7CFeMgZNIx1Kto186BFv
	lkP4UiJNV5urtsi+PwG1kfZXCZJ23hnL+ZvkGUhuHvtDBIHp6iUBr84hln2Jot2JKGsdF5
	TqUxdoEF7KiOdNWviEBnQII6Gx5kSnw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757421814;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BZVxWwJMpmbRiwE1IPPvybOvbj+FR0SmdWlNRNrjWnM=;
	b=A25lBDCDuwDzeSp4yZR0eUD0rp9+i7+GrEhnwo58zq2xuXaZkQ7YeR3mDxwq53keC/VSj7
	M2F1ROEPlWfowUAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AA19D13A56;
	Tue,  9 Sep 2025 12:43:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AJbrKPYgwGi6TgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 09 Sep 2025 12:43:34 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 08/14] ALSA: ppc: Use guard() for spin locks
Date: Tue,  9 Sep 2025 14:43:28 +0200
Message-ID: <20250909124331.10670-9-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250909124331.10670-1-tiwai@suse.de>
References: <20250909124331.10670-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: B749A33BFC
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
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01

Clean up the code using guard() for spin locks.

Merely code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/ppc/awacs.c    | 24 +++---------
 sound/ppc/beep.c     | 17 +++------
 sound/ppc/burgundy.c | 10 +----
 sound/ppc/pmac.c     | 88 ++++++++++++++++++++++----------------------
 4 files changed, 57 insertions(+), 82 deletions(-)

diff --git a/sound/ppc/awacs.c b/sound/ppc/awacs.c
index 13a6f3af13ef..c231a9d6d1de 100644
--- a/sound/ppc/awacs.c
+++ b/sound/ppc/awacs.c
@@ -137,13 +137,11 @@ static int snd_pmac_awacs_get_volume(struct snd_kcontrol *kcontrol,
 	int reg = kcontrol->private_value & 0xff;
 	int lshift = (kcontrol->private_value >> 8) & 0xff;
 	int inverted = (kcontrol->private_value >> 16) & 1;
-	unsigned long flags;
 	int vol[2];
 
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	vol[0] = (chip->awacs_reg[reg] >> lshift) & 0xf;
 	vol[1] = chip->awacs_reg[reg] & 0xf;
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 	if (inverted) {
 		vol[0] = 0x0f - vol[0];
 		vol[1] = 0x0f - vol[1];
@@ -161,7 +159,6 @@ static int snd_pmac_awacs_put_volume(struct snd_kcontrol *kcontrol,
 	int lshift = (kcontrol->private_value >> 8) & 0xff;
 	int inverted = (kcontrol->private_value >> 16) & 1;
 	int val, oldval;
-	unsigned long flags;
 	unsigned int vol[2];
 
 	vol[0] = ucontrol->value.integer.value[0];
@@ -174,14 +171,13 @@ static int snd_pmac_awacs_put_volume(struct snd_kcontrol *kcontrol,
 	}
 	vol[0] &= 0x0f;
 	vol[1] &= 0x0f;
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	oldval = chip->awacs_reg[reg];
 	val = oldval & ~(0xf | (0xf << lshift));
 	val |= vol[0] << lshift;
 	val |= vol[1];
 	if (oldval != val)
 		snd_pmac_awacs_write_reg(chip, reg, val);
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 	return oldval != reg;
 }
 
@@ -204,11 +200,9 @@ static int snd_pmac_awacs_get_switch(struct snd_kcontrol *kcontrol,
 	int shift = (kcontrol->private_value >> 8) & 0xff;
 	int invert = (kcontrol->private_value >> 16) & 1;
 	int val;
-	unsigned long flags;
 
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	val = (chip->awacs_reg[reg] >> shift) & 1;
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 	if (invert)
 		val = 1 - val;
 	ucontrol->value.integer.value[0] = val;
@@ -224,16 +218,14 @@ static int snd_pmac_awacs_put_switch(struct snd_kcontrol *kcontrol,
 	int invert = (kcontrol->private_value >> 16) & 1;
 	int mask = 1 << shift;
 	int val, changed;
-	unsigned long flags;
 
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	val = chip->awacs_reg[reg] & ~mask;
 	if (ucontrol->value.integer.value[0] != invert)
 		val |= mask;
 	changed = chip->awacs_reg[reg] != val;
 	if (changed)
 		snd_pmac_awacs_write_reg(chip, reg, val);
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 	return changed;
 }
 
@@ -541,14 +533,12 @@ static int snd_pmac_screamer_mic_boost_get(struct snd_kcontrol *kcontrol,
 {
 	struct snd_pmac *chip = snd_kcontrol_chip(kcontrol);
 	int val = 0;
-	unsigned long flags;
 
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	if (chip->awacs_reg[6] & MASK_MIC_BOOST)
 		val |= 2;
 	if (chip->awacs_reg[0] & MASK_GAINLINE)
 		val |= 1;
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 	ucontrol->value.integer.value[0] = val;
 	return 0;
 }
@@ -559,9 +549,8 @@ static int snd_pmac_screamer_mic_boost_put(struct snd_kcontrol *kcontrol,
 	struct snd_pmac *chip = snd_kcontrol_chip(kcontrol);
 	int changed = 0;
 	int val0, val6;
-	unsigned long flags;
 
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	val0 = chip->awacs_reg[0] & ~MASK_GAINLINE;
 	val6 = chip->awacs_reg[6] & ~MASK_MIC_BOOST;
 	if (ucontrol->value.integer.value[0] & 1)
@@ -576,7 +565,6 @@ static int snd_pmac_screamer_mic_boost_put(struct snd_kcontrol *kcontrol,
 		snd_pmac_awacs_write_reg(chip, 6, val6);
 		changed = 1;
 	}
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 	return changed;
 }
 
diff --git a/sound/ppc/beep.c b/sound/ppc/beep.c
index bf289783eafd..ab2468790b0c 100644
--- a/sound/ppc/beep.c
+++ b/sound/ppc/beep.c
@@ -88,7 +88,6 @@ static int snd_pmac_beep_event(struct input_dev *dev, unsigned int type,
 {
 	struct snd_pmac *chip;
 	struct pmac_beep *beep;
-	unsigned long flags;
 	int beep_speed = 0;
 	int srate;
 	int period, ncycles, nsamples;
@@ -112,10 +111,9 @@ static int snd_pmac_beep_event(struct input_dev *dev, unsigned int type,
 		return -1;
 
 	if (! hz) {
-		spin_lock_irqsave(&chip->reg_lock, flags);
+		guard(spinlock_irqsave)(&chip->reg_lock);
 		if (beep->running)
 			snd_pmac_beep_stop(chip);
-		spin_unlock_irqrestore(&chip->reg_lock, flags);
 		return 0;
 	}
 
@@ -125,13 +123,11 @@ static int snd_pmac_beep_event(struct input_dev *dev, unsigned int type,
 	if (hz <= srate / BEEP_BUFLEN || hz > srate / 2)
 		hz = 1000;
 
-	spin_lock_irqsave(&chip->reg_lock, flags);
-	if (chip->playback.running || chip->capture.running || beep->running) {
-		spin_unlock_irqrestore(&chip->reg_lock, flags);
-		return 0;
+	scoped_guard(spinlock_irqsave, &chip->reg_lock) {
+		if (chip->playback.running || chip->capture.running || beep->running)
+			return 0;
+		beep->running = 1;
 	}
-	beep->running = 1;
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 
 	if (hz == beep->hz && beep->volume == beep->volume_play) {
 		nsamples = beep->nsamples;
@@ -151,9 +147,8 @@ static int snd_pmac_beep_event(struct input_dev *dev, unsigned int type,
 		beep->nsamples = nsamples;
 	}
 
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	snd_pmac_beep_dma_start(chip, beep->nsamples * 4, beep->addr, beep_speed);
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 	return 0;
 }
 
diff --git a/sound/ppc/burgundy.c b/sound/ppc/burgundy.c
index ba15bc34c9ec..5d6accce3a72 100644
--- a/sound/ppc/burgundy.c
+++ b/sound/ppc/burgundy.c
@@ -59,9 +59,8 @@ static unsigned
 snd_pmac_burgundy_rcw(struct snd_pmac *chip, unsigned addr)
 {
 	unsigned val = 0;
-	unsigned long flags;
 
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 
 	out_le32(&chip->awacs->codec_ctrl, addr + 0x100000);
 	snd_pmac_burgundy_busy_wait(chip);
@@ -83,8 +82,6 @@ snd_pmac_burgundy_rcw(struct snd_pmac *chip, unsigned addr)
 	snd_pmac_burgundy_extend_wait(chip);
 	val += ((in_le32(&chip->awacs->codec_stat)>>4) & 0xff) <<24;
 
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
-
 	return val;
 }
 
@@ -100,17 +97,14 @@ static unsigned
 snd_pmac_burgundy_rcb(struct snd_pmac *chip, unsigned int addr)
 {
 	unsigned val = 0;
-	unsigned long flags;
 
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 
 	out_le32(&chip->awacs->codec_ctrl, addr + 0x100000);
 	snd_pmac_burgundy_busy_wait(chip);
 	snd_pmac_burgundy_extend_wait(chip);
 	val += (in_le32(&chip->awacs->codec_stat) >> 4) & 0xff;
 
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
-
 	return val;
 }
 
diff --git a/sound/ppc/pmac.c b/sound/ppc/pmac.c
index a3d346f1cc05..6d7dab26ddf2 100644
--- a/sound/ppc/pmac.c
+++ b/sound/ppc/pmac.c
@@ -206,32 +206,32 @@ static int snd_pmac_pcm_prepare(struct snd_pmac *chip, struct pmac_stream *rec,
 	 * common to many PowerBook G3 systems and random noise otherwise
 	 * captured on iBook2's about every third time. -ReneR
 	 */
-	spin_lock_irq(&chip->reg_lock);
-	snd_pmac_dma_stop(rec);
-	chip->extra_dma.cmds->command = cpu_to_le16(DBDMA_STOP);
-	snd_pmac_dma_set_command(rec, &chip->extra_dma);
-	snd_pmac_dma_run(rec, RUN);
-	spin_unlock_irq(&chip->reg_lock);
-	mdelay(5);
-	spin_lock_irq(&chip->reg_lock);
-	/* continuous DMA memory type doesn't provide the physical address,
-	 * so we need to resolve the address here...
-	 */
-	offset = runtime->dma_addr;
-	for (i = 0, cp = rec->cmd.cmds; i < rec->nperiods; i++, cp++) {
-		cp->phy_addr = cpu_to_le32(offset);
-		cp->req_count = cpu_to_le16(rec->period_size);
-		/*cp->res_count = cpu_to_le16(0);*/
-		cp->xfer_status = cpu_to_le16(0);
-		offset += rec->period_size;
+	scoped_guard(spinlock_irq, &chip->reg_lock) {
+		snd_pmac_dma_stop(rec);
+		chip->extra_dma.cmds->command = cpu_to_le16(DBDMA_STOP);
+		snd_pmac_dma_set_command(rec, &chip->extra_dma);
+		snd_pmac_dma_run(rec, RUN);
 	}
-	/* make loop */
-	cp->command = cpu_to_le16(DBDMA_NOP | BR_ALWAYS);
-	cp->cmd_dep = cpu_to_le32(rec->cmd.addr);
+	mdelay(5);
+	scoped_guard(spinlock_irq, &chip->reg_lock) {
+		/* continuous DMA memory type doesn't provide the physical address,
+		 * so we need to resolve the address here...
+		 */
+		offset = runtime->dma_addr;
+		for (i = 0, cp = rec->cmd.cmds; i < rec->nperiods; i++, cp++) {
+			cp->phy_addr = cpu_to_le32(offset);
+			cp->req_count = cpu_to_le16(rec->period_size);
+			/*cp->res_count = cpu_to_le16(0);*/
+			cp->xfer_status = cpu_to_le16(0);
+			offset += rec->period_size;
+		}
+		/* make loop */
+		cp->command = cpu_to_le16(DBDMA_NOP | BR_ALWAYS);
+		cp->cmd_dep = cpu_to_le32(rec->cmd.addr);
 
-	snd_pmac_dma_stop(rec);
-	snd_pmac_dma_set_command(rec, &rec->cmd);
-	spin_unlock_irq(&chip->reg_lock);
+		snd_pmac_dma_stop(rec);
+		snd_pmac_dma_set_command(rec, &rec->cmd);
+	}
 
 	return 0;
 }
@@ -253,26 +253,26 @@ static int snd_pmac_pcm_trigger(struct snd_pmac *chip, struct pmac_stream *rec,
 			return -EBUSY;
 		command = (subs->stream == SNDRV_PCM_STREAM_PLAYBACK ?
 			   OUTPUT_MORE : INPUT_MORE) + INTR_ALWAYS;
-		spin_lock(&chip->reg_lock);
-		snd_pmac_beep_stop(chip);
-		snd_pmac_pcm_set_format(chip);
-		for (i = 0, cp = rec->cmd.cmds; i < rec->nperiods; i++, cp++)
-			out_le16(&cp->command, command);
-		snd_pmac_dma_set_command(rec, &rec->cmd);
-		(void)in_le32(&rec->dma->status);
-		snd_pmac_dma_run(rec, RUN|WAKE);
-		rec->running = 1;
-		spin_unlock(&chip->reg_lock);
+		scoped_guard(spinlock, &chip->reg_lock) {
+			snd_pmac_beep_stop(chip);
+			snd_pmac_pcm_set_format(chip);
+			for (i = 0, cp = rec->cmd.cmds; i < rec->nperiods; i++, cp++)
+				out_le16(&cp->command, command);
+			snd_pmac_dma_set_command(rec, &rec->cmd);
+			(void)in_le32(&rec->dma->status);
+			snd_pmac_dma_run(rec, RUN|WAKE);
+			rec->running = 1;
+		}
 		break;
 
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
-		spin_lock(&chip->reg_lock);
-		rec->running = 0;
-		snd_pmac_dma_stop(rec);
-		for (i = 0, cp = rec->cmd.cmds; i < rec->nperiods; i++, cp++)
-			out_le16(&cp->command, DBDMA_STOP);
-		spin_unlock(&chip->reg_lock);
+		scoped_guard(spinlock, &chip->reg_lock) {
+			rec->running = 0;
+			snd_pmac_dma_stop(rec);
+			for (i = 0, cp = rec->cmd.cmds; i < rec->nperiods; i++, cp++)
+				out_le16(&cp->command, DBDMA_STOP);
+		}
 		break;
 
 	default:
@@ -1321,14 +1321,12 @@ int snd_pmac_new(struct snd_card *card, struct snd_pmac **chip_return)
 
 void snd_pmac_suspend(struct snd_pmac *chip)
 {
-	unsigned long flags;
-
 	snd_power_change_state(chip->card, SNDRV_CTL_POWER_D3hot);
 	if (chip->suspend)
 		chip->suspend(chip);
-	spin_lock_irqsave(&chip->reg_lock, flags);
-	snd_pmac_beep_stop(chip);
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
+	scoped_guard(spinlock_irqsave, &chip->reg_lock) {
+		snd_pmac_beep_stop(chip);
+	}
 	if (chip->irq >= 0)
 		disable_irq(chip->irq);
 	if (chip->tx_irq >= 0)
-- 
2.50.1

