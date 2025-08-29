Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1020320CCA
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756478874; cv=none; b=f2KZQuA0YehZPw9HBSO2jYTlww9kx39EddP9dHM/6vgNADdzCyK/kP9rko6RvGKJfzk+vlgIFc4/kpd2g8agssPq95Z7rhGx95mWyRRmtBCbj9MR7GEgTwA5Qq9qolouUiyMKW7HGfb4UkMZu7idE1LRMIQmvllKxBXJupp1W4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756478874; c=relaxed/simple;
	bh=Xk8l9X3GE+8F13WyAF6bWYQoyceRV0uTxOjJiHBvycI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eKwkwTAc9BZQrYtNwe7bWXZiLkSoPAJSnLftOg9sqU+jJ5uy0EiKLfiJpM70BrB6ZErnA+2CG0yQ4F5KYag0KsM0U8jVbqLRbfXdiPMXNPvm4CfbCmeZOgrWOQasl1ckYqMdGcZikdAHT23bV2+yboQ6qo2sTWLCedpSbQ+CfAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FgUkI414; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/yBWVDSW; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FgUkI414; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/yBWVDSW; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FgUkI414";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/yBWVDSW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FgUkI414";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/yBWVDSW"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CBC415C249;
	Fri, 29 Aug 2025 14:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478643; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BXFNCl+3SI7skpuYe8nOwWAW3lK/ogfK9QnxG/7NiJA=;
	b=FgUkI414WIS3cu12MUqstddoKDpwUchzQaoYEmPFKwmOObEESA+XJTt7C/mBM2iS3GpjFH
	44vQJmvvaanKocA1TmxvpmRjUPsZ3Hi0lok4GBsZD97Op6NVcrAKdzRwZ6ATqHew9TnCrn
	e3Pv8fS7C7WZwu+LupdoMSZ5Vfrd65g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478643;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BXFNCl+3SI7skpuYe8nOwWAW3lK/ogfK9QnxG/7NiJA=;
	b=/yBWVDSWPZBlo21MpoCAG72hqm0l5dLOixrYD84vDyKPIK6b/tslFTUOwQiSuRQydtmxs+
	LJSe4pAYuhhPDwBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478643; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BXFNCl+3SI7skpuYe8nOwWAW3lK/ogfK9QnxG/7NiJA=;
	b=FgUkI414WIS3cu12MUqstddoKDpwUchzQaoYEmPFKwmOObEESA+XJTt7C/mBM2iS3GpjFH
	44vQJmvvaanKocA1TmxvpmRjUPsZ3Hi0lok4GBsZD97Op6NVcrAKdzRwZ6ATqHew9TnCrn
	e3Pv8fS7C7WZwu+LupdoMSZ5Vfrd65g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478643;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BXFNCl+3SI7skpuYe8nOwWAW3lK/ogfK9QnxG/7NiJA=;
	b=/yBWVDSWPZBlo21MpoCAG72hqm0l5dLOixrYD84vDyKPIK6b/tslFTUOwQiSuRQydtmxs+
	LJSe4pAYuhhPDwBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B401413A54;
	Fri, 29 Aug 2025 14:44:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UBjWKrO8sWi6GAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:44:03 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 56/61] ALSA: sonicvibes: Use guard() for spin locks
Date: Fri, 29 Aug 2025 16:43:31 +0200
Message-ID: <20250829144342.4290-57-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLsqo7dymd5dgmoaprf5rep8is)];
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
 sound/pci/sonicvibes.c | 113 ++++++++++++++++-------------------------
 1 file changed, 44 insertions(+), 69 deletions(-)

diff --git a/sound/pci/sonicvibes.c b/sound/pci/sonicvibes.c
index f85a9556dacb..a4c72799d034 100644
--- a/sound/pci/sonicvibes.c
+++ b/sound/pci/sonicvibes.c
@@ -303,14 +303,11 @@ static void snd_sonicvibes_out(struct sonicvibes * sonic,
 			       unsigned char reg,
 			       unsigned char value)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave(&sonic->reg_lock, flags);
+	guard(spinlock_irqsave)(&sonic->reg_lock);
 	outb(reg, SV_REG(sonic, INDEX));
 	udelay(10);
 	outb(value, SV_REG(sonic, DATA));
 	udelay(10);
-	spin_unlock_irqrestore(&sonic->reg_lock, flags);
 }
 
 static unsigned char snd_sonicvibes_in1(struct sonicvibes * sonic, unsigned char reg)
@@ -326,15 +323,13 @@ static unsigned char snd_sonicvibes_in1(struct sonicvibes * sonic, unsigned char
 
 static unsigned char snd_sonicvibes_in(struct sonicvibes * sonic, unsigned char reg)
 {
-	unsigned long flags;
 	unsigned char value;
 
-	spin_lock_irqsave(&sonic->reg_lock, flags);
+	guard(spinlock_irqsave)(&sonic->reg_lock);
 	outb(reg, SV_REG(sonic, INDEX));
 	udelay(10);
 	value = inb(SV_REG(sonic, DATA));
 	udelay(10);
-	spin_unlock_irqrestore(&sonic->reg_lock, flags);
 	return value;
 }
 
@@ -448,9 +443,7 @@ static void snd_sonicvibes_setfmt(struct sonicvibes * sonic,
                                   unsigned char mask,
                                   unsigned char value)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave(&sonic->reg_lock, flags);
+	guard(spinlock_irqsave)(&sonic->reg_lock);
 	outb(SV_MCE | SV_IREG_DMA_DATA_FMT, SV_REG(sonic, INDEX));
 	if (mask) {
 		sonic->format = inb(SV_REG(sonic, DATA));
@@ -461,7 +454,6 @@ static void snd_sonicvibes_setfmt(struct sonicvibes * sonic,
 	udelay(10);
 	outb(0, SV_REG(sonic, INDEX));
 	udelay(10);
-	spin_unlock_irqrestore(&sonic->reg_lock, flags);
 }
 
 static void snd_sonicvibes_pll(unsigned int rate,
@@ -506,21 +498,18 @@ static void snd_sonicvibes_setpll(struct sonicvibes * sonic,
                                   unsigned char reg,
                                   unsigned int rate)
 {
-	unsigned long flags;
 	unsigned int r, m, n;
 
 	snd_sonicvibes_pll(rate, &r, &m, &n);
 	if (sonic != NULL) {
-		spin_lock_irqsave(&sonic->reg_lock, flags);
+		guard(spinlock_irqsave)(&sonic->reg_lock);
 		snd_sonicvibes_out1(sonic, reg, m);
 		snd_sonicvibes_out1(sonic, reg + 1, r | n);
-		spin_unlock_irqrestore(&sonic->reg_lock, flags);
 	}
 }
 
 static void snd_sonicvibes_set_adc_rate(struct sonicvibes * sonic, unsigned int rate)
 {
-	unsigned long flags;
 	unsigned int div;
 	unsigned char clock;
 
@@ -533,10 +522,9 @@ static void snd_sonicvibes_set_adc_rate(struct sonicvibes * sonic, unsigned int
 		clock = 0x00;
 		snd_sonicvibes_setpll(sonic, SV_IREG_ADC_PLL, rate);
 	}
-	spin_lock_irqsave(&sonic->reg_lock, flags);
+	guard(spinlock_irqsave)(&sonic->reg_lock);
 	snd_sonicvibes_out1(sonic, SV_IREG_ADC_ALT_RATE, (div - 1) << 4);
 	snd_sonicvibes_out1(sonic, SV_IREG_ADC_CLOCK, clock);
-	spin_unlock_irqrestore(&sonic->reg_lock, flags);
 }
 
 static int snd_sonicvibes_hw_constraint_dac_rate(struct snd_pcm_hw_params *params,
@@ -567,22 +555,18 @@ static int snd_sonicvibes_hw_constraint_dac_rate(struct snd_pcm_hw_params *param
 static void snd_sonicvibes_set_dac_rate(struct sonicvibes * sonic, unsigned int rate)
 {
 	unsigned int div;
-	unsigned long flags;
 
 	div = DIV_ROUND_CLOSEST(rate * 65536, SV_FULLRATE);
 	if (div > 65535)
 		div = 65535;
-	spin_lock_irqsave(&sonic->reg_lock, flags);
+	guard(spinlock_irqsave)(&sonic->reg_lock);
 	snd_sonicvibes_out1(sonic, SV_IREG_PCM_RATE_HIGH, div >> 8);
 	snd_sonicvibes_out1(sonic, SV_IREG_PCM_RATE_LOW, div);
-	spin_unlock_irqrestore(&sonic->reg_lock, flags);
 }
 
 static int snd_sonicvibes_trigger(struct sonicvibes * sonic, int what, int cmd)
 {
-	int result = 0;
-
-	spin_lock(&sonic->reg_lock);
+	guard(spinlock)(&sonic->reg_lock);
 	if (cmd == SNDRV_PCM_TRIGGER_START) {
 		if (!(sonic->enable & what)) {
 			sonic->enable |= what;
@@ -594,10 +578,9 @@ static int snd_sonicvibes_trigger(struct sonicvibes * sonic, int what, int cmd)
 			snd_sonicvibes_out1(sonic, SV_IREG_PC_ENABLE, sonic->enable);
 		}
 	} else {
-		result = -EINVAL;
+		return -EINVAL;
 	}
-	spin_unlock(&sonic->reg_lock);
-	return result;
+	return 0;
 }
 
 static irqreturn_t snd_sonicvibes_interrupt(int irq, void *dev_id)
@@ -628,34 +611,34 @@ static irqreturn_t snd_sonicvibes_interrupt(int irq, void *dev_id)
 		unsigned char udreg;
 		int vol, oleft, oright, mleft, mright;
 
-		spin_lock(&sonic->reg_lock);
-		udreg = snd_sonicvibes_in1(sonic, SV_IREG_UD_BUTTON);
-		vol = udreg & 0x3f;
-		if (!(udreg & 0x40))
-			vol = -vol;
-		oleft = mleft = snd_sonicvibes_in1(sonic, SV_IREG_LEFT_ANALOG);
-		oright = mright = snd_sonicvibes_in1(sonic, SV_IREG_RIGHT_ANALOG);
-		oleft &= 0x1f;
-		oright &= 0x1f;
-		oleft += vol;
-		if (oleft < 0)
-			oleft = 0;
-		if (oleft > 0x1f)
-			oleft = 0x1f;
-		oright += vol;
-		if (oright < 0)
-			oright = 0;
-		if (oright > 0x1f)
-			oright = 0x1f;
-		if (udreg & 0x80) {
-			mleft ^= 0x80;
-			mright ^= 0x80;
+		scoped_guard(spinlock, &sonic->reg_lock) {
+			udreg = snd_sonicvibes_in1(sonic, SV_IREG_UD_BUTTON);
+			vol = udreg & 0x3f;
+			if (!(udreg & 0x40))
+				vol = -vol;
+			oleft = mleft = snd_sonicvibes_in1(sonic, SV_IREG_LEFT_ANALOG);
+			oright = mright = snd_sonicvibes_in1(sonic, SV_IREG_RIGHT_ANALOG);
+			oleft &= 0x1f;
+			oright &= 0x1f;
+			oleft += vol;
+			if (oleft < 0)
+				oleft = 0;
+			if (oleft > 0x1f)
+				oleft = 0x1f;
+			oright += vol;
+			if (oright < 0)
+				oright = 0;
+			if (oright > 0x1f)
+				oright = 0x1f;
+			if (udreg & 0x80) {
+				mleft ^= 0x80;
+				mright ^= 0x80;
+			}
+			oleft |= mleft & 0x80;
+			oright |= mright & 0x80;
+			snd_sonicvibes_out1(sonic, SV_IREG_LEFT_ANALOG, oleft);
+			snd_sonicvibes_out1(sonic, SV_IREG_RIGHT_ANALOG, oright);
 		}
-		oleft |= mleft & 0x80;
-		oright |= mright & 0x80;
-		snd_sonicvibes_out1(sonic, SV_IREG_LEFT_ANALOG, oleft);
-		snd_sonicvibes_out1(sonic, SV_IREG_RIGHT_ANALOG, oright);
-		spin_unlock(&sonic->reg_lock);
 		snd_ctl_notify(sonic->card, SNDRV_CTL_EVENT_MASK_VALUE, &sonic->master_mute->id);
 		snd_ctl_notify(sonic->card, SNDRV_CTL_EVENT_MASK_VALUE, &sonic->master_volume->id);
 	}
@@ -696,11 +679,10 @@ static int snd_sonicvibes_playback_prepare(struct snd_pcm_substream *substream)
 		fmt |= 2;
 	snd_sonicvibes_setfmt(sonic, ~3, fmt);
 	snd_sonicvibes_set_dac_rate(sonic, runtime->rate);
-	spin_lock_irq(&sonic->reg_lock);
+	guard(spinlock_irq)(&sonic->reg_lock);
 	snd_sonicvibes_setdmaa(sonic, runtime->dma_addr, size);
 	snd_sonicvibes_out1(sonic, SV_IREG_DMA_A_UPPER, count >> 8);
 	snd_sonicvibes_out1(sonic, SV_IREG_DMA_A_LOWER, count);
-	spin_unlock_irq(&sonic->reg_lock);
 	return 0;
 }
 
@@ -721,11 +703,10 @@ static int snd_sonicvibes_capture_prepare(struct snd_pcm_substream *substream)
 		fmt |= 0x20;
 	snd_sonicvibes_setfmt(sonic, ~0x30, fmt);
 	snd_sonicvibes_set_adc_rate(sonic, runtime->rate);
-	spin_lock_irq(&sonic->reg_lock);
+	guard(spinlock_irq)(&sonic->reg_lock);
 	snd_sonicvibes_setdmac(sonic, runtime->dma_addr, size);
 	snd_sonicvibes_out1(sonic, SV_IREG_DMA_C_UPPER, count >> 8);
 	snd_sonicvibes_out1(sonic, SV_IREG_DMA_C_LOWER, count);
-	spin_unlock_irq(&sonic->reg_lock);
 	return 0;
 }
 
@@ -894,10 +875,9 @@ static int snd_sonicvibes_get_mux(struct snd_kcontrol *kcontrol, struct snd_ctl_
 {
 	struct sonicvibes *sonic = snd_kcontrol_chip(kcontrol);
 	
-	spin_lock_irq(&sonic->reg_lock);
+	guard(spinlock_irq)(&sonic->reg_lock);
 	ucontrol->value.enumerated.item[0] = ((snd_sonicvibes_in1(sonic, SV_IREG_LEFT_ADC) & SV_RECSRC_OUT) >> 5) - 1;
 	ucontrol->value.enumerated.item[1] = ((snd_sonicvibes_in1(sonic, SV_IREG_RIGHT_ADC) & SV_RECSRC_OUT) >> 5) - 1;
-	spin_unlock_irq(&sonic->reg_lock);
 	return 0;
 }
 
@@ -912,7 +892,7 @@ static int snd_sonicvibes_put_mux(struct snd_kcontrol *kcontrol, struct snd_ctl_
 		return -EINVAL;
 	left = (ucontrol->value.enumerated.item[0] + 1) << 5;
 	right = (ucontrol->value.enumerated.item[1] + 1) << 5;
-	spin_lock_irq(&sonic->reg_lock);
+	guard(spinlock_irq)(&sonic->reg_lock);
 	oval1 = snd_sonicvibes_in1(sonic, SV_IREG_LEFT_ADC);
 	oval2 = snd_sonicvibes_in1(sonic, SV_IREG_RIGHT_ADC);
 	left = (oval1 & ~SV_RECSRC_OUT) | left;
@@ -920,7 +900,6 @@ static int snd_sonicvibes_put_mux(struct snd_kcontrol *kcontrol, struct snd_ctl_
 	change = left != oval1 || right != oval2;
 	snd_sonicvibes_out1(sonic, SV_IREG_LEFT_ADC, left);
 	snd_sonicvibes_out1(sonic, SV_IREG_RIGHT_ADC, right);
-	spin_unlock_irq(&sonic->reg_lock);
 	return change;
 }
 
@@ -949,9 +928,8 @@ static int snd_sonicvibes_get_single(struct snd_kcontrol *kcontrol, struct snd_c
 	int mask = (kcontrol->private_value >> 16) & 0xff;
 	int invert = (kcontrol->private_value >> 24) & 0xff;
 	
-	spin_lock_irq(&sonic->reg_lock);
+	guard(spinlock_irq)(&sonic->reg_lock);
 	ucontrol->value.integer.value[0] = (snd_sonicvibes_in1(sonic, reg)>> shift) & mask;
-	spin_unlock_irq(&sonic->reg_lock);
 	if (invert)
 		ucontrol->value.integer.value[0] = mask - ucontrol->value.integer.value[0];
 	return 0;
@@ -971,12 +949,11 @@ static int snd_sonicvibes_put_single(struct snd_kcontrol *kcontrol, struct snd_c
 	if (invert)
 		val = mask - val;
 	val <<= shift;
-	spin_lock_irq(&sonic->reg_lock);
+	guard(spinlock_irq)(&sonic->reg_lock);
 	oval = snd_sonicvibes_in1(sonic, reg);
 	val = (oval & ~(mask << shift)) | val;
 	change = val != oval;
 	snd_sonicvibes_out1(sonic, reg, val);
-	spin_unlock_irq(&sonic->reg_lock);
 	return change;
 }
 
@@ -1007,10 +984,9 @@ static int snd_sonicvibes_get_double(struct snd_kcontrol *kcontrol, struct snd_c
 	int mask = (kcontrol->private_value >> 24) & 0xff;
 	int invert = (kcontrol->private_value >> 22) & 1;
 	
-	spin_lock_irq(&sonic->reg_lock);
+	guard(spinlock_irq)(&sonic->reg_lock);
 	ucontrol->value.integer.value[0] = (snd_sonicvibes_in1(sonic, left_reg) >> shift_left) & mask;
 	ucontrol->value.integer.value[1] = (snd_sonicvibes_in1(sonic, right_reg) >> shift_right) & mask;
-	spin_unlock_irq(&sonic->reg_lock);
 	if (invert) {
 		ucontrol->value.integer.value[0] = mask - ucontrol->value.integer.value[0];
 		ucontrol->value.integer.value[1] = mask - ucontrol->value.integer.value[1];
@@ -1038,7 +1014,7 @@ static int snd_sonicvibes_put_double(struct snd_kcontrol *kcontrol, struct snd_c
 	}
 	val1 <<= shift_left;
 	val2 <<= shift_right;
-	spin_lock_irq(&sonic->reg_lock);
+	guard(spinlock_irq)(&sonic->reg_lock);
 	oval1 = snd_sonicvibes_in1(sonic, left_reg);
 	oval2 = snd_sonicvibes_in1(sonic, right_reg);
 	val1 = (oval1 & ~(mask << shift_left)) | val1;
@@ -1046,7 +1022,6 @@ static int snd_sonicvibes_put_double(struct snd_kcontrol *kcontrol, struct snd_c
 	change = val1 != oval1 || val2 != oval2;
 	snd_sonicvibes_out1(sonic, left_reg, val1);
 	snd_sonicvibes_out1(sonic, right_reg, val2);
-	spin_unlock_irq(&sonic->reg_lock);
 	return change;
 }
 
-- 
2.50.1

