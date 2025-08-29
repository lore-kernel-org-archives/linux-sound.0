Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B2031B10A
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756479245; cv=none; b=kzmWfi6G7e6h4s8rpVgMHyoXG39NtvIAUJ7JPCRGnoxL0QftOk39DEoTjK91XJhWqK/lRxawW0POVwaUCypibvo8gI6NDnTIRqv02JqOX3e3LxHBq4HvEEuGcTxH9/fj3GkXY2mQVra9Eqp7ZU/ZBqYL6ga0hb11uLoGJ0bdYvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756479245; c=relaxed/simple;
	bh=Ql+RLePi07buFgWDk8NYU2SN1JdwF/phkexD3dFzaIg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pgeFCV1Nscuovjh9bdcSX8L6zBvOUFfzfWpblj0iPoxAfA63lZiWkxur8BcV+tQFTs15i5ya55vfAm2qFfabC6GZBiRXOsIsL0SWLBmLWHWhCaOyamMOI6XfpqXZu6AjiAWl9DC1kBmAdNaIcCWB8LNkYIIxA1HeiI70jcZT4Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yXzVIztA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dgb0dJx6; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jRd0u4Xq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=e7E2Q+AE; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yXzVIztA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dgb0dJx6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jRd0u4Xq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="e7E2Q+AE"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EA7395C246;
	Fri, 29 Aug 2025 14:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756479193; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=caPAYvxTW7MEwG1vEiCLHfs4RwX/MZrdikWrdYOXNhg=;
	b=yXzVIztAz5MllUl+vA1V2t3Ygt8pwipIaDOO2fv888Q5ggVVamjRLQLvw1BQ9cLV6ufCNK
	k2Gu7TkHu7doTZnmzIPl3qFdGCKCgdnl25J0CHklri5U+ap53YsX/uRnZn/ez4vit+dfUJ
	Wd2vyWX0WQ4pT0s+B4wq9YDEwOTTFLM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756479193;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=caPAYvxTW7MEwG1vEiCLHfs4RwX/MZrdikWrdYOXNhg=;
	b=dgb0dJx6BVbIVidG40K5nGDbc7HYxO4SMeD2uw2ixH8IdcNVSxxAlVCrgN62bbx7+JfSub
	mAFYp0cxJ6r5Z2AQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=jRd0u4Xq;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=e7E2Q+AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756479192; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=caPAYvxTW7MEwG1vEiCLHfs4RwX/MZrdikWrdYOXNhg=;
	b=jRd0u4XqPzLBlnHdJYn0cXAdMAJDjJ9CuNqCetSlgmkCVf4x0f6raTHZ173IxOn+ZfOWiq
	MY3Mg2KszVfdO1RaYcsEKud3iLA+UrAsph8Ct6kQODSiCcCT8HVKwPCbBviZhfKHVd4np5
	8RrRXooDwNgBrKLkr/wS6JexCtojsII=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756479192;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=caPAYvxTW7MEwG1vEiCLHfs4RwX/MZrdikWrdYOXNhg=;
	b=e7E2Q+AEwPYeKoZlX4sjOdl9JH9a5hIjR75VjSKTjcmzIZCEtSzmy7IVcj+bOGaTieFwCM
	zqc/tb1IHf7uI2CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D136B13A54;
	Fri, 29 Aug 2025 14:53:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sOqwMdi+sWhzGwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:53:12 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 17/18] ALSA: wss: Use guard() for spin locks
Date: Fri, 29 Aug 2025 16:52:57 +0200
Message-ID: <20250829145300.5460-18-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829145300.5460-1-tiwai@suse.de>
References: <20250829145300.5460-1-tiwai@suse.de>
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
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: EA7395C246
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Clean up the code using guard() for spin locks.

Merely code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/wss/wss_lib.c | 264 ++++++++++++++++------------------------
 1 file changed, 107 insertions(+), 157 deletions(-)

diff --git a/sound/isa/wss/wss_lib.c b/sound/isa/wss/wss_lib.c
index 0a2c040af5f0..6cf88625bbc3 100644
--- a/sound/isa/wss/wss_lib.c
+++ b/sound/isa/wss/wss_lib.c
@@ -360,7 +360,6 @@ static void snd_wss_busy_wait(struct snd_wss *chip)
 
 void snd_wss_mce_up(struct snd_wss *chip)
 {
-	unsigned long flags;
 	int timeout;
 
 	snd_wss_wait(chip);
@@ -369,7 +368,7 @@ void snd_wss_mce_up(struct snd_wss *chip)
 		dev_dbg(chip->card->dev,
 			"mce_up - auto calibration time out (0)\n");
 #endif
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	chip->mce_bit |= CS4231_MCE;
 	timeout = wss_inb(chip, CS4231P(REGSEL));
 	if (timeout == 0x80)
@@ -379,13 +378,11 @@ void snd_wss_mce_up(struct snd_wss *chip)
 	if (!(timeout & CS4231_MCE))
 		wss_outb(chip, CS4231P(REGSEL),
 			 chip->mce_bit | (timeout & 0x1f));
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 }
 EXPORT_SYMBOL(snd_wss_mce_up);
 
 void snd_wss_mce_down(struct snd_wss *chip)
 {
-	unsigned long flags;
 	unsigned long end_time;
 	int timeout;
 	int hw_mask = WSS_HW_CS4231_MASK | WSS_HW_CS4232_MASK | WSS_HW_AD1848;
@@ -398,11 +395,11 @@ void snd_wss_mce_down(struct snd_wss *chip)
 			"mce_down [0x%lx] - auto calibration time out (0)\n",
 			(long)CS4231P(REGSEL));
 #endif
-	spin_lock_irqsave(&chip->reg_lock, flags);
-	chip->mce_bit &= ~CS4231_MCE;
-	timeout = wss_inb(chip, CS4231P(REGSEL));
-	wss_outb(chip, CS4231P(REGSEL), chip->mce_bit | (timeout & 0x1f));
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
+	scoped_guard(spinlock_irqsave, &chip->reg_lock) {
+		chip->mce_bit &= ~CS4231_MCE;
+		timeout = wss_inb(chip, CS4231P(REGSEL));
+		wss_outb(chip, CS4231P(REGSEL), chip->mce_bit | (timeout & 0x1f));
+	}
 	if (timeout == 0x80)
 		dev_dbg(chip->card->dev,
 			"mce_down [0x%lx]: serious init problem - codec still busy\n",
@@ -496,7 +493,7 @@ static int snd_wss_trigger(struct snd_pcm_substream *substream,
 			snd_pcm_trigger_done(s, substream);
 		}
 	}
-	spin_lock(&chip->reg_lock);
+	guard(spinlock)(&chip->reg_lock);
 	if (do_start) {
 		chip->image[CS4231_IFACE_CTRL] |= what;
 		if (chip->trigger)
@@ -507,7 +504,6 @@ static int snd_wss_trigger(struct snd_pcm_substream *substream,
 			chip->trigger(chip, what, 0);
 	}
 	snd_wss_out(chip, CS4231_IFACE_CTRL, chip->image[CS4231_IFACE_CTRL]);
-	spin_unlock(&chip->reg_lock);
 #if 0
 	snd_wss_debug(chip);
 #endif
@@ -553,14 +549,11 @@ static unsigned char snd_wss_get_format(struct snd_wss *chip,
 
 static void snd_wss_calibrate_mute(struct snd_wss *chip, int mute)
 {
-	unsigned long flags;
 
 	mute = mute ? 0x80 : 0;
-	spin_lock_irqsave(&chip->reg_lock, flags);
-	if (chip->calibrate_mute == mute) {
-		spin_unlock_irqrestore(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
+	if (chip->calibrate_mute == mute)
 		return;
-	}
 	if (!mute) {
 		snd_wss_dout(chip, CS4231_LEFT_INPUT,
 			     chip->image[CS4231_LEFT_INPUT]);
@@ -608,20 +601,18 @@ static void snd_wss_calibrate_mute(struct snd_wss *chip, int mute)
 			     mute | chip->image[CS4231_LINE_RIGHT_OUTPUT]);
 	}
 	chip->calibrate_mute = mute;
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 }
 
 static void snd_wss_playback_format(struct snd_wss *chip,
 				       struct snd_pcm_hw_params *params,
 				       unsigned char pdfr)
 {
-	unsigned long flags;
 	int full_calib = 1;
 
 	guard(mutex)(&chip->mce_mutex);
 	if (chip->hardware == WSS_HW_CS4231A ||
 	    (chip->hardware & WSS_HW_CS4232_MASK)) {
-		spin_lock_irqsave(&chip->reg_lock, flags);
+		guard(spinlock_irqsave)(&chip->reg_lock);
 		if ((chip->image[CS4231_PLAYBK_FORMAT] & 0x0f) == (pdfr & 0x0f)) {	/* rate is same? */
 			snd_wss_out(chip, CS4231_ALT_FEATURE_1,
 				    chip->image[CS4231_ALT_FEATURE_1] | 0x10);
@@ -633,7 +624,6 @@ static void snd_wss_playback_format(struct snd_wss *chip,
 			udelay(100); /* Fixes audible clicks at least on GUS MAX */
 			full_calib = 0;
 		}
-		spin_unlock_irqrestore(&chip->reg_lock, flags);
 	} else if (chip->hardware == WSS_HW_AD1845) {
 		unsigned rate = params_rate(params);
 
@@ -646,25 +636,24 @@ static void snd_wss_playback_format(struct snd_wss *chip,
 		 * NOTE: We seem to need to write to the MSB before the LSB
 		 *       to get the correct sample frequency.
 		 */
-		spin_lock_irqsave(&chip->reg_lock, flags);
+		guard(spinlock_irqsave)(&chip->reg_lock);
 		snd_wss_out(chip, CS4231_PLAYBK_FORMAT, (pdfr & 0xf0));
 		snd_wss_out(chip, AD1845_UPR_FREQ_SEL, (rate >> 8) & 0xff);
 		snd_wss_out(chip, AD1845_LWR_FREQ_SEL, rate & 0xff);
 		full_calib = 0;
-		spin_unlock_irqrestore(&chip->reg_lock, flags);
 	}
 	if (full_calib) {
 		snd_wss_mce_up(chip);
-		spin_lock_irqsave(&chip->reg_lock, flags);
-		if (chip->hardware != WSS_HW_INTERWAVE && !chip->single_dma) {
-			if (chip->image[CS4231_IFACE_CTRL] & CS4231_RECORD_ENABLE)
-				pdfr = (pdfr & 0xf0) |
-				       (chip->image[CS4231_REC_FORMAT] & 0x0f);
-		} else {
-			chip->image[CS4231_PLAYBK_FORMAT] = pdfr;
+		scoped_guard(spinlock_irqsave, &chip->reg_lock) {
+			if (chip->hardware != WSS_HW_INTERWAVE && !chip->single_dma) {
+				if (chip->image[CS4231_IFACE_CTRL] & CS4231_RECORD_ENABLE)
+					pdfr = (pdfr & 0xf0) |
+						(chip->image[CS4231_REC_FORMAT] & 0x0f);
+			} else {
+				chip->image[CS4231_PLAYBK_FORMAT] = pdfr;
+			}
+			snd_wss_out(chip, CS4231_PLAYBK_FORMAT, pdfr);
 		}
-		snd_wss_out(chip, CS4231_PLAYBK_FORMAT, pdfr);
-		spin_unlock_irqrestore(&chip->reg_lock, flags);
 		if (chip->hardware == WSS_HW_OPL3SA2)
 			udelay(100);	/* this seems to help */
 		snd_wss_mce_down(chip);
@@ -681,7 +670,7 @@ static void snd_wss_capture_format(struct snd_wss *chip,
 	guard(mutex)(&chip->mce_mutex);
 	if (chip->hardware == WSS_HW_CS4231A ||
 	    (chip->hardware & WSS_HW_CS4232_MASK)) {
-		spin_lock_irqsave(&chip->reg_lock, flags);
+		guard(spinlock_irqsave)(&chip->reg_lock);
 		if ((chip->image[CS4231_PLAYBK_FORMAT] & 0x0f) == (cdfr & 0x0f) ||	/* rate is same? */
 		    (chip->image[CS4231_IFACE_CTRL] & CS4231_PLAYBACK_ENABLE)) {
 			snd_wss_out(chip, CS4231_ALT_FEATURE_1,
@@ -692,7 +681,6 @@ static void snd_wss_capture_format(struct snd_wss *chip,
 				chip->image[CS4231_ALT_FEATURE_1] &= ~0x20);
 			full_calib = 0;
 		}
-		spin_unlock_irqrestore(&chip->reg_lock, flags);
 	} else if (chip->hardware == WSS_HW_AD1845) {
 		unsigned rate = params_rate(params);
 
@@ -705,12 +693,11 @@ static void snd_wss_capture_format(struct snd_wss *chip,
 		 * NOTE: We seem to need to write to the MSB before the LSB
 		 *       to get the correct sample frequency.
 		 */
-		spin_lock_irqsave(&chip->reg_lock, flags);
+		guard(spinlock_irqsave)(&chip->reg_lock);
 		snd_wss_out(chip, CS4231_REC_FORMAT, (cdfr & 0xf0));
 		snd_wss_out(chip, AD1845_UPR_FREQ_SEL, (rate >> 8) & 0xff);
 		snd_wss_out(chip, AD1845_LWR_FREQ_SEL, rate & 0xff);
 		full_calib = 0;
-		spin_unlock_irqrestore(&chip->reg_lock, flags);
 	}
 	if (full_calib) {
 		snd_wss_mce_up(chip);
@@ -752,10 +739,10 @@ static unsigned long snd_wss_timer_resolution(struct snd_timer *timer)
 
 static int snd_wss_timer_start(struct snd_timer *timer)
 {
-	unsigned long flags;
 	unsigned int ticks;
 	struct snd_wss *chip = snd_timer_chip(timer);
-	spin_lock_irqsave(&chip->reg_lock, flags);
+
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	ticks = timer->sticks;
 	if ((chip->image[CS4231_ALT_FEATURE_1] & CS4231_TIMER_ENABLE) == 0 ||
 	    (unsigned char)(ticks >> 8) != chip->image[CS4231_TIMER_HIGH] ||
@@ -770,26 +757,22 @@ static int snd_wss_timer_start(struct snd_timer *timer)
 			    chip->image[CS4231_ALT_FEATURE_1] |
 			    CS4231_TIMER_ENABLE);
 	}
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 	return 0;
 }
 
 static int snd_wss_timer_stop(struct snd_timer *timer)
 {
-	unsigned long flags;
 	struct snd_wss *chip = snd_timer_chip(timer);
-	spin_lock_irqsave(&chip->reg_lock, flags);
+
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	chip->image[CS4231_ALT_FEATURE_1] &= ~CS4231_TIMER_ENABLE;
 	snd_wss_out(chip, CS4231_ALT_FEATURE_1,
 		    chip->image[CS4231_ALT_FEATURE_1]);
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 	return 0;
 }
 
 static void snd_wss_init(struct snd_wss *chip)
 {
-	unsigned long flags;
-
 	snd_wss_calibrate_mute(chip, 1);
 	snd_wss_mce_down(chip);
 
@@ -797,15 +780,15 @@ static void snd_wss_init(struct snd_wss *chip)
 	dev_dbg(chip->card->dev, "init: (1)\n");
 #endif
 	snd_wss_mce_up(chip);
-	spin_lock_irqsave(&chip->reg_lock, flags);
-	chip->image[CS4231_IFACE_CTRL] &= ~(CS4231_PLAYBACK_ENABLE |
-					    CS4231_PLAYBACK_PIO |
-					    CS4231_RECORD_ENABLE |
-					    CS4231_RECORD_PIO |
-					    CS4231_CALIB_MODE);
-	chip->image[CS4231_IFACE_CTRL] |= CS4231_AUTOCALIB;
-	snd_wss_out(chip, CS4231_IFACE_CTRL, chip->image[CS4231_IFACE_CTRL]);
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
+	scoped_guard(spinlock_irqsave, &chip->reg_lock) {
+		chip->image[CS4231_IFACE_CTRL] &= ~(CS4231_PLAYBACK_ENABLE |
+						    CS4231_PLAYBACK_PIO |
+						    CS4231_RECORD_ENABLE |
+						    CS4231_RECORD_PIO |
+						    CS4231_CALIB_MODE);
+		chip->image[CS4231_IFACE_CTRL] |= CS4231_AUTOCALIB;
+		snd_wss_out(chip, CS4231_IFACE_CTRL, chip->image[CS4231_IFACE_CTRL]);
+	}
 	snd_wss_mce_down(chip);
 
 #ifdef SNDRV_DEBUG_MCE
@@ -813,12 +796,12 @@ static void snd_wss_init(struct snd_wss *chip)
 #endif
 
 	snd_wss_mce_up(chip);
-	spin_lock_irqsave(&chip->reg_lock, flags);
-	chip->image[CS4231_IFACE_CTRL] &= ~CS4231_AUTOCALIB;
-	snd_wss_out(chip, CS4231_IFACE_CTRL, chip->image[CS4231_IFACE_CTRL]);
-	snd_wss_out(chip,
-		    CS4231_ALT_FEATURE_1, chip->image[CS4231_ALT_FEATURE_1]);
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
+	scoped_guard(spinlock_irqsave, &chip->reg_lock) {
+		chip->image[CS4231_IFACE_CTRL] &= ~CS4231_AUTOCALIB;
+		snd_wss_out(chip, CS4231_IFACE_CTRL, chip->image[CS4231_IFACE_CTRL]);
+		snd_wss_out(chip,
+			    CS4231_ALT_FEATURE_1, chip->image[CS4231_ALT_FEATURE_1]);
+	}
 	snd_wss_mce_down(chip);
 
 #ifdef SNDRV_DEBUG_MCE
@@ -826,16 +809,16 @@ static void snd_wss_init(struct snd_wss *chip)
 		chip->image[CS4231_ALT_FEATURE_1]);
 #endif
 
-	spin_lock_irqsave(&chip->reg_lock, flags);
-	snd_wss_out(chip, CS4231_ALT_FEATURE_2,
-		    chip->image[CS4231_ALT_FEATURE_2]);
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
+	scoped_guard(spinlock_irqsave, &chip->reg_lock) {
+		snd_wss_out(chip, CS4231_ALT_FEATURE_2,
+			    chip->image[CS4231_ALT_FEATURE_2]);
+	}
 
 	snd_wss_mce_up(chip);
-	spin_lock_irqsave(&chip->reg_lock, flags);
-	snd_wss_out(chip, CS4231_PLAYBK_FORMAT,
-		    chip->image[CS4231_PLAYBK_FORMAT]);
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
+	scoped_guard(spinlock_irqsave, &chip->reg_lock) {
+		snd_wss_out(chip, CS4231_PLAYBK_FORMAT,
+			    chip->image[CS4231_PLAYBK_FORMAT]);
+	}
 	snd_wss_mce_down(chip);
 
 #ifdef SNDRV_DEBUG_MCE
@@ -843,11 +826,11 @@ static void snd_wss_init(struct snd_wss *chip)
 #endif
 
 	snd_wss_mce_up(chip);
-	spin_lock_irqsave(&chip->reg_lock, flags);
-	if (!(chip->hardware & WSS_HW_AD1848_MASK))
-		snd_wss_out(chip, CS4231_REC_FORMAT,
-			    chip->image[CS4231_REC_FORMAT]);
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
+	scoped_guard(spinlock_irqsave, &chip->reg_lock) {
+		if (!(chip->hardware & WSS_HW_AD1848_MASK))
+			snd_wss_out(chip, CS4231_REC_FORMAT,
+				    chip->image[CS4231_REC_FORMAT]);
+	}
 	snd_wss_mce_down(chip);
 	snd_wss_calibrate_mute(chip, 0);
 
@@ -858,8 +841,6 @@ static void snd_wss_init(struct snd_wss *chip)
 
 static int snd_wss_open(struct snd_wss *chip, unsigned int mode)
 {
-	unsigned long flags;
-
 	guard(mutex)(&chip->open_mutex);
 	if ((chip->mode & mode) ||
 	    ((chip->mode & WSS_MODE_OPEN) && chip->single_dma))
@@ -869,7 +850,7 @@ static int snd_wss_open(struct snd_wss *chip, unsigned int mode)
 		return 0;
 	}
 	/* ok. now enable and ack CODEC IRQ */
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	if (!(chip->hardware & WSS_HW_AD1848_MASK)) {
 		snd_wss_out(chip, CS4231_IRQ_STATUS,
 			    CS4231_PLAYBACK_IRQ |
@@ -888,7 +869,6 @@ static int snd_wss_open(struct snd_wss *chip, unsigned int mode)
 			    CS4231_TIMER_IRQ);
 		snd_wss_out(chip, CS4231_IRQ_STATUS, 0);
 	}
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 
 	chip->mode = mode;
 	return 0;
@@ -988,18 +968,16 @@ static int snd_wss_playback_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_wss *chip = snd_pcm_substream_chip(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	unsigned long flags;
 	unsigned int size = snd_pcm_lib_buffer_bytes(substream);
 	unsigned int count = snd_pcm_lib_period_bytes(substream);
 
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	chip->p_dma_size = size;
 	chip->image[CS4231_IFACE_CTRL] &= ~(CS4231_PLAYBACK_ENABLE | CS4231_PLAYBACK_PIO);
 	snd_dma_program(chip->dma1, runtime->dma_addr, size, DMA_MODE_WRITE | DMA_AUTOINIT);
 	count = snd_wss_get_count(chip->image[CS4231_PLAYBK_FORMAT], count) - 1;
 	snd_wss_out(chip, CS4231_PLY_LWR_CNT, (unsigned char) count);
 	snd_wss_out(chip, CS4231_PLY_UPR_CNT, (unsigned char) (count >> 8));
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 #if 0
 	snd_wss_debug(chip);
 #endif
@@ -1023,11 +1001,10 @@ static int snd_wss_capture_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_wss *chip = snd_pcm_substream_chip(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	unsigned long flags;
 	unsigned int size = snd_pcm_lib_buffer_bytes(substream);
 	unsigned int count = snd_pcm_lib_period_bytes(substream);
 
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	chip->c_dma_size = size;
 	chip->image[CS4231_IFACE_CTRL] &= ~(CS4231_RECORD_ENABLE | CS4231_RECORD_PIO);
 	snd_dma_program(chip->dma2, runtime->dma_addr, size, DMA_MODE_READ | DMA_AUTOINIT);
@@ -1047,18 +1024,16 @@ static int snd_wss_capture_prepare(struct snd_pcm_substream *substream)
 		snd_wss_out(chip, CS4231_REC_UPR_CNT,
 			    (unsigned char) (count >> 8));
 	}
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 	return 0;
 }
 
 void snd_wss_overrange(struct snd_wss *chip)
 {
-	unsigned long flags;
 	unsigned char res;
 
-	spin_lock_irqsave(&chip->reg_lock, flags);
-	res = snd_wss_in(chip, CS4231_TEST_INIT);
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
+	scoped_guard(spinlock_irqsave, &chip->reg_lock) {
+		res = snd_wss_in(chip, CS4231_TEST_INIT);
+	}
 	if (res & (0x08 | 0x02))	/* detect overrange only above 0dB; may be user selectable? */
 		chip->capture_substream->runtime->overrange++;
 }
@@ -1104,13 +1079,12 @@ irqreturn_t snd_wss_interrupt(int irq, void *dev_id)
 		}
 	}
 
-	spin_lock(&chip->reg_lock);
+	guard(spinlock)(&chip->reg_lock);
 	status = ~CS4231_ALL_IRQS | ~status;
 	if (chip->hardware & WSS_HW_AD1848_MASK)
 		wss_outb(chip, CS4231P(STATUS), 0);
 	else
 		snd_wss_out(chip, CS4231_IRQ_STATUS, status);
-	spin_unlock(&chip->reg_lock);
 	return IRQ_HANDLED;
 }
 EXPORT_SYMBOL(snd_wss_interrupt);
@@ -1144,10 +1118,8 @@ static snd_pcm_uframes_t snd_wss_capture_pointer(struct snd_pcm_substream *subst
 static int snd_ad1848_probe(struct snd_wss *chip)
 {
 	unsigned long timeout = jiffies + msecs_to_jiffies(1000);
-	unsigned long flags;
 	unsigned char r;
 	unsigned short hardware = 0;
-	int err = 0;
 	int i;
 
 	while (wss_inb(chip, CS4231P(REGSEL)) & CS4231_INIT) {
@@ -1155,7 +1127,7 @@ static int snd_ad1848_probe(struct snd_wss *chip)
 			return -ENODEV;
 		cond_resched();
 	}
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 
 	/* set CS423x MODE 1 */
 	snd_wss_dout(chip, CS4231_MISC_INFO, 0);
@@ -1164,19 +1136,15 @@ static int snd_ad1848_probe(struct snd_wss *chip)
 	r = snd_wss_in(chip, CS4231_RIGHT_INPUT);
 	if (r != 0x45) {
 		/* RMGE always high on AD1847 */
-		if ((r & ~CS4231_ENABLE_MIC_GAIN) != 0x45) {
-			err = -ENODEV;
-			goto out;
-		}
+		if ((r & ~CS4231_ENABLE_MIC_GAIN) != 0x45)
+			return -ENODEV;
 		hardware = WSS_HW_AD1847;
 	} else {
 		snd_wss_dout(chip, CS4231_LEFT_INPUT,  0xaa);
 		r = snd_wss_in(chip, CS4231_LEFT_INPUT);
 		/* L/RMGE always low on AT2320 */
-		if ((r | CS4231_ENABLE_MIC_GAIN) != 0xaa) {
-			err = -ENODEV;
-			goto out;
-		}
+		if ((r | CS4231_ENABLE_MIC_GAIN) != 0xaa)
+			return -ENODEV;
 	}
 
 	/* clear pending IRQ */
@@ -1185,11 +1153,11 @@ static int snd_ad1848_probe(struct snd_wss *chip)
 	mb();
 
 	if ((chip->hardware & WSS_HW_TYPE_MASK) != WSS_HW_DETECT)
-		goto out;
+		return 0;
 
 	if (hardware) {
 		chip->hardware = hardware;
-		goto out;
+		return 0;
 	}
 
 	r = snd_wss_in(chip, CS4231_MISC_INFO);
@@ -1218,14 +1186,11 @@ static int snd_ad1848_probe(struct snd_wss *chip)
 		chip->hardware = WSS_HW_AD1848;
 out_mode:
 	snd_wss_dout(chip, CS4231_MISC_INFO, 0);
-out:
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
-	return err;
+	return 0;
 }
 
 static int snd_wss_probe(struct snd_wss *chip)
 {
-	unsigned long flags;
 	int i, id, rev, regnum;
 	unsigned char *ptr;
 	unsigned int hw;
@@ -1241,11 +1206,10 @@ static int snd_wss_probe(struct snd_wss *chip)
 			if (wss_inb(chip, CS4231P(REGSEL)) & CS4231_INIT)
 				msleep(2);
 			else {
-				spin_lock_irqsave(&chip->reg_lock, flags);
+				guard(spinlock_irqsave)(&chip->reg_lock);
 				snd_wss_out(chip, CS4231_MISC_INFO,
 					    CS4231_MODE2);
 				id = snd_wss_in(chip, CS4231_MISC_INFO) & 0x0f;
-				spin_unlock_irqrestore(&chip->reg_lock, flags);
 				if (id == 0x0a)
 					break;	/* this is valid value */
 			}
@@ -1280,11 +1244,11 @@ static int snd_wss_probe(struct snd_wss *chip)
 			return -ENODEV;		/* unknown CS4231 chip? */
 		}
 	}
-	spin_lock_irqsave(&chip->reg_lock, flags);
-	wss_inb(chip, CS4231P(STATUS));	/* clear any pendings IRQ */
-	wss_outb(chip, CS4231P(STATUS), 0);
-	mb();
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
+	scoped_guard(spinlock_irqsave, &chip->reg_lock) {
+		wss_inb(chip, CS4231P(STATUS));	/* clear any pendings IRQ */
+		wss_outb(chip, CS4231P(STATUS), 0);
+		mb();
+	}
 
 	if (!(chip->hardware & WSS_HW_AD1848_MASK))
 		chip->image[CS4231_MISC_INFO] = CS4231_MODE2;
@@ -1319,10 +1283,10 @@ static int snd_wss_probe(struct snd_wss *chip)
 	ptr = (unsigned char *) &chip->image;
 	regnum = (chip->hardware & WSS_HW_AD1848_MASK) ? 16 : 32;
 	snd_wss_mce_down(chip);
-	spin_lock_irqsave(&chip->reg_lock, flags);
-	for (i = 0; i < regnum; i++)	/* ok.. fill all registers */
-		snd_wss_out(chip, i, *ptr++);
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
+	scoped_guard(spinlock_irqsave, &chip->reg_lock) {
+		for (i = 0; i < regnum; i++)	/* ok.. fill all registers */
+			snd_wss_out(chip, i, *ptr++);
+	}
 	snd_wss_mce_up(chip);
 	snd_wss_mce_down(chip);
 
@@ -1587,12 +1551,11 @@ static void snd_wss_thinkpad_twiddle(struct snd_wss *chip, int on)
 static void snd_wss_suspend(struct snd_wss *chip)
 {
 	int reg;
-	unsigned long flags;
 
-	spin_lock_irqsave(&chip->reg_lock, flags);
-	for (reg = 0; reg < 32; reg++)
-		chip->image[reg] = snd_wss_in(chip, reg);
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
+	scoped_guard(spinlock_irqsave, &chip->reg_lock) {
+		for (reg = 0; reg < 32; reg++)
+			chip->image[reg] = snd_wss_in(chip, reg);
+	}
 	if (chip->thinkpad_flag)
 		snd_wss_thinkpad_twiddle(chip, 0);
 }
@@ -1601,27 +1564,26 @@ static void snd_wss_suspend(struct snd_wss *chip)
 static void snd_wss_resume(struct snd_wss *chip)
 {
 	int reg;
-	unsigned long flags;
 	/* int timeout; */
 
 	if (chip->thinkpad_flag)
 		snd_wss_thinkpad_twiddle(chip, 1);
 	snd_wss_mce_up(chip);
-	spin_lock_irqsave(&chip->reg_lock, flags);
-	for (reg = 0; reg < 32; reg++) {
-		switch (reg) {
-		case CS4231_VERSION:
-			break;
-		default:
-			snd_wss_out(chip, reg, chip->image[reg]);
-			break;
+	scoped_guard(spinlock_irqsave, &chip->reg_lock) {
+		for (reg = 0; reg < 32; reg++) {
+			switch (reg) {
+			case CS4231_VERSION:
+				break;
+			default:
+				snd_wss_out(chip, reg, chip->image[reg]);
+				break;
+			}
 		}
+		/* Yamaha needs this to resume properly */
+		if (chip->hardware == WSS_HW_OPL3SA2)
+			snd_wss_out(chip, CS4231_PLAYBK_FORMAT,
+				    chip->image[CS4231_PLAYBK_FORMAT]);
 	}
-	/* Yamaha needs this to resume properly */
-	if (chip->hardware == WSS_HW_OPL3SA2)
-		snd_wss_out(chip, CS4231_PLAYBK_FORMAT,
-			    chip->image[CS4231_PLAYBK_FORMAT]);
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 #if 1
 	snd_wss_mce_down(chip);
 #else
@@ -1630,11 +1592,11 @@ static void snd_wss_resume(struct snd_wss *chip)
 	   include rescheduling.  -- iwai
 	   */
 	snd_wss_busy_wait(chip);
-	spin_lock_irqsave(&chip->reg_lock, flags);
-	chip->mce_bit &= ~CS4231_MCE;
-	timeout = wss_inb(chip, CS4231P(REGSEL));
-	wss_outb(chip, CS4231P(REGSEL), chip->mce_bit | (timeout & 0x1f));
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
+	scoped_guard(spinlock_irqsave, &chip->reg_lock) {
+		chip->mce_bit &= ~CS4231_MCE;
+		timeout = wss_inb(chip, CS4231P(REGSEL));
+		wss_outb(chip, CS4231P(REGSEL), chip->mce_bit | (timeout & 0x1f));
+	}
 	if (timeout == 0x80)
 		dev_err(chip->card->dev
 			"down [0x%lx]: serious init problem - codec still busy\n",
@@ -1935,12 +1897,10 @@ static int snd_wss_get_mux(struct snd_kcontrol *kcontrol,
 			   struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_wss *chip = snd_kcontrol_chip(kcontrol);
-	unsigned long flags;
 
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	ucontrol->value.enumerated.item[0] = (chip->image[CS4231_LEFT_INPUT] & CS4231_MIXS_ALL) >> 6;
 	ucontrol->value.enumerated.item[1] = (chip->image[CS4231_RIGHT_INPUT] & CS4231_MIXS_ALL) >> 6;
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 	return 0;
 }
 
@@ -1948,7 +1908,6 @@ static int snd_wss_put_mux(struct snd_kcontrol *kcontrol,
 			   struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_wss *chip = snd_kcontrol_chip(kcontrol);
-	unsigned long flags;
 	unsigned short left, right;
 	int change;
 
@@ -1957,14 +1916,13 @@ static int snd_wss_put_mux(struct snd_kcontrol *kcontrol,
 		return -EINVAL;
 	left = ucontrol->value.enumerated.item[0] << 6;
 	right = ucontrol->value.enumerated.item[1] << 6;
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	left = (chip->image[CS4231_LEFT_INPUT] & ~CS4231_MIXS_ALL) | left;
 	right = (chip->image[CS4231_RIGHT_INPUT] & ~CS4231_MIXS_ALL) | right;
 	change = left != chip->image[CS4231_LEFT_INPUT] ||
 		 right != chip->image[CS4231_RIGHT_INPUT];
 	snd_wss_out(chip, CS4231_LEFT_INPUT, left);
 	snd_wss_out(chip, CS4231_RIGHT_INPUT, right);
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 	return change;
 }
 
@@ -1985,15 +1943,13 @@ int snd_wss_get_single(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_wss *chip = snd_kcontrol_chip(kcontrol);
-	unsigned long flags;
 	int reg = kcontrol->private_value & 0xff;
 	int shift = (kcontrol->private_value >> 8) & 0xff;
 	int mask = (kcontrol->private_value >> 16) & 0xff;
 	int invert = (kcontrol->private_value >> 24) & 0xff;
 
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	ucontrol->value.integer.value[0] = (chip->image[reg] >> shift) & mask;
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 	if (invert)
 		ucontrol->value.integer.value[0] = mask - ucontrol->value.integer.value[0];
 	return 0;
@@ -2004,7 +1960,6 @@ int snd_wss_put_single(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_wss *chip = snd_kcontrol_chip(kcontrol);
-	unsigned long flags;
 	int reg = kcontrol->private_value & 0xff;
 	int shift = (kcontrol->private_value >> 8) & 0xff;
 	int mask = (kcontrol->private_value >> 16) & 0xff;
@@ -2016,11 +1971,10 @@ int snd_wss_put_single(struct snd_kcontrol *kcontrol,
 	if (invert)
 		val = mask - val;
 	val <<= shift;
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	val = (chip->image[reg] & ~(mask << shift)) | val;
 	change = val != chip->image[reg];
 	snd_wss_out(chip, reg, val);
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 	return change;
 }
 EXPORT_SYMBOL(snd_wss_put_single);
@@ -2042,7 +1996,6 @@ int snd_wss_get_double(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_wss *chip = snd_kcontrol_chip(kcontrol);
-	unsigned long flags;
 	int left_reg = kcontrol->private_value & 0xff;
 	int right_reg = (kcontrol->private_value >> 8) & 0xff;
 	int shift_left = (kcontrol->private_value >> 16) & 0x07;
@@ -2050,10 +2003,9 @@ int snd_wss_get_double(struct snd_kcontrol *kcontrol,
 	int mask = (kcontrol->private_value >> 24) & 0xff;
 	int invert = (kcontrol->private_value >> 22) & 1;
 
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	ucontrol->value.integer.value[0] = (chip->image[left_reg] >> shift_left) & mask;
 	ucontrol->value.integer.value[1] = (chip->image[right_reg] >> shift_right) & mask;
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 	if (invert) {
 		ucontrol->value.integer.value[0] = mask - ucontrol->value.integer.value[0];
 		ucontrol->value.integer.value[1] = mask - ucontrol->value.integer.value[1];
@@ -2066,7 +2018,6 @@ int snd_wss_put_double(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_wss *chip = snd_kcontrol_chip(kcontrol);
-	unsigned long flags;
 	int left_reg = kcontrol->private_value & 0xff;
 	int right_reg = (kcontrol->private_value >> 8) & 0xff;
 	int shift_left = (kcontrol->private_value >> 16) & 0x07;
@@ -2084,7 +2035,7 @@ int snd_wss_put_double(struct snd_kcontrol *kcontrol,
 	}
 	val1 <<= shift_left;
 	val2 <<= shift_right;
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	if (left_reg != right_reg) {
 		val1 = (chip->image[left_reg] & ~(mask << shift_left)) | val1;
 		val2 = (chip->image[right_reg] & ~(mask << shift_right)) | val2;
@@ -2098,7 +2049,6 @@ int snd_wss_put_double(struct snd_kcontrol *kcontrol,
 		change = val1 != chip->image[left_reg];
 		snd_wss_out(chip, left_reg, val1);
 	}
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 	return change;
 }
 EXPORT_SYMBOL(snd_wss_put_double);
-- 
2.50.1

