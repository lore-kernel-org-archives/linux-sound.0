Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74FE4320CBF
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756478764; cv=none; b=DEIK/RStNKQ2aj3yNm3q97H+HW4+QWE2HLMiwdSOdXld76JpO1lgJySr1ZG+bmwTAaBsAJFuU92zg5AYbwL11yPjkQsn2n8DE+ZRG8a4F3GNpUbVYuMHLo3aWkLtUlnpWr+lWqDYWp2NEbTMCR/rj8ZTPlCSnh9Yp7EForCp3ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756478764; c=relaxed/simple;
	bh=wQP8BOOzyk9AAMFLLuqevIz+SriC9Xin3kvHQpjEu3A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cz7uZwY/jSM81Q//sN471NUZgm+89yalcF5PuVMhd61xYi0L6kqcFTq4OXhwojeLmU7PLLpTO+S2PvLtgCzMgeZDsU6WdlR75ygOd22LeqTEeZicBmYmo1/X3BNe6PDvSy0iT2kxbWVzJO01PR0ER5ns+kA0ORUKumLKU4dmjKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nyLreQdq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=01PPsQEy; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nyLreQdq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=01PPsQEy; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nyLreQdq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="01PPsQEy";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nyLreQdq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="01PPsQEy"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1434E33ED3;
	Fri, 29 Aug 2025 14:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478643; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HJVBxo/gclZJFddixABVAASZLhwSCjmQ0g3RUU8mGc4=;
	b=nyLreQdqa02nrykftAmG7Vryv9U8n3dfCa3USbs3w7rbQUUPJIiElXhRxueXRazRY/0DIN
	sGp1LrV9/EAZ1ip4fCh6QlHLBLISy0/ZuZsdMWHoNEhksHJnUe1KzsuJ1jXSi7EMOIiotE
	tNv4n0PEuHkYeji1WWC9kn+0N6L3wrM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478643;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HJVBxo/gclZJFddixABVAASZLhwSCjmQ0g3RUU8mGc4=;
	b=01PPsQEynHtBRdITCNL6p2/APA9Hf/S4O6CP3S0ZJtr4JqrH5zFyO4Ggn7WHFOg7QoRIUS
	6+VZ2yAoYcK2o8DQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478643; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HJVBxo/gclZJFddixABVAASZLhwSCjmQ0g3RUU8mGc4=;
	b=nyLreQdqa02nrykftAmG7Vryv9U8n3dfCa3USbs3w7rbQUUPJIiElXhRxueXRazRY/0DIN
	sGp1LrV9/EAZ1ip4fCh6QlHLBLISy0/ZuZsdMWHoNEhksHJnUe1KzsuJ1jXSi7EMOIiotE
	tNv4n0PEuHkYeji1WWC9kn+0N6L3wrM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478643;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HJVBxo/gclZJFddixABVAASZLhwSCjmQ0g3RUU8mGc4=;
	b=01PPsQEynHtBRdITCNL6p2/APA9Hf/S4O6CP3S0ZJtr4JqrH5zFyO4Ggn7WHFOg7QoRIUS
	6+VZ2yAoYcK2o8DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F124913A54;
	Fri, 29 Aug 2025 14:44:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mPioObK8sWi6GAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:44:02 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 50/61] ALSA: rme96: Use guard() for spin locks
Date: Fri, 29 Aug 2025 16:43:25 +0200
Message-ID: <20250829144342.4290-51-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
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
 sound/pci/rme96.c | 211 +++++++++++++++++++---------------------------
 1 file changed, 85 insertions(+), 126 deletions(-)

diff --git a/sound/pci/rme96.c b/sound/pci/rme96.c
index 5cdbbe9cf994..58b8ebf1a24e 100644
--- a/sound/pci/rme96.c
+++ b/sound/pci/rme96.c
@@ -964,48 +964,45 @@ snd_rme96_playback_hw_params(struct snd_pcm_substream *substream,
 	runtime->dma_addr = rme96->port + RME96_IO_PLAY_BUFFER;
 	runtime->dma_bytes = RME96_BUFFER_SIZE;
 
-	spin_lock_irq(&rme96->lock);
-	rate = 0;
-	if (!(rme96->wcreg & RME96_WCR_MASTER) &&
-	    snd_rme96_getinputtype(rme96) != RME96_INPUT_ANALOG)
-		rate = snd_rme96_capture_getrate(rme96, &dummy);
-	if (rate > 0) {
-                /* slave clock */
-                if ((int)params_rate(params) != rate) {
-			err = -EIO;
-			goto error;
+	scoped_guard(spinlock_irq, &rme96->lock) {
+		rate = 0;
+		if (!(rme96->wcreg & RME96_WCR_MASTER) &&
+		    snd_rme96_getinputtype(rme96) != RME96_INPUT_ANALOG)
+			rate = snd_rme96_capture_getrate(rme96, &dummy);
+		if (rate > 0) {
+			/* slave clock */
+			if ((int)params_rate(params) != rate)
+				return -EIO;
+		} else {
+			err = snd_rme96_playback_setrate(rme96, params_rate(params));
+			if (err < 0)
+				return err;
+			apply_dac_volume = err > 0; /* need to restore volume later? */
 		}
-	} else {
-		err = snd_rme96_playback_setrate(rme96, params_rate(params));
+
+		err = snd_rme96_playback_setformat(rme96, params_format(params));
 		if (err < 0)
 			goto error;
-		apply_dac_volume = err > 0; /* need to restore volume later? */
-	}
-
-	err = snd_rme96_playback_setformat(rme96, params_format(params));
-	if (err < 0)
-		goto error;
-	snd_rme96_setframelog(rme96, params_channels(params), 1);
-	if (rme96->capture_periodsize != 0) {
-		if (params_period_size(params) << rme96->playback_frlog !=
-		    rme96->capture_periodsize)
-		{
-			err = -EBUSY;
-			goto error;
+		snd_rme96_setframelog(rme96, params_channels(params), 1);
+		if (rme96->capture_periodsize != 0) {
+			if (params_period_size(params) << rme96->playback_frlog !=
+			    rme96->capture_periodsize) {
+				err = -EBUSY;
+				goto error;
+			}
+		}
+		rme96->playback_periodsize =
+			params_period_size(params) << rme96->playback_frlog;
+		snd_rme96_set_period_properties(rme96, rme96->playback_periodsize);
+		/* S/PDIF setup */
+		if ((rme96->wcreg & RME96_WCR_ADAT) == 0) {
+			rme96->wcreg &= ~(RME96_WCR_PRO | RME96_WCR_DOLBY | RME96_WCR_EMP);
+			writel(rme96->wcreg |= rme96->wcreg_spdif_stream, rme96->iobase + RME96_IO_CONTROL_REGISTER);
 		}
-	}
-	rme96->playback_periodsize =
-		params_period_size(params) << rme96->playback_frlog;
-	snd_rme96_set_period_properties(rme96, rme96->playback_periodsize);
-	/* S/PDIF setup */
-	if ((rme96->wcreg & RME96_WCR_ADAT) == 0) {
-		rme96->wcreg &= ~(RME96_WCR_PRO | RME96_WCR_DOLBY | RME96_WCR_EMP);
-		writel(rme96->wcreg |= rme96->wcreg_spdif_stream, rme96->iobase + RME96_IO_CONTROL_REGISTER);
-	}
 
-	err = 0;
+		err = 0;
+	}
  error:
-	spin_unlock_irq(&rme96->lock);
 	if (apply_dac_volume) {
 		usleep_range(3000, 10000);
 		snd_rme96_apply_dac_volume(rme96);
@@ -1027,45 +1024,33 @@ snd_rme96_capture_hw_params(struct snd_pcm_substream *substream,
 	runtime->dma_addr = rme96->port + RME96_IO_REC_BUFFER;
 	runtime->dma_bytes = RME96_BUFFER_SIZE;
 
-	spin_lock_irq(&rme96->lock);
+	guard(spinlock_irq)(&rme96->lock);
 	err = snd_rme96_capture_setformat(rme96, params_format(params));
-	if (err < 0) {
-		spin_unlock_irq(&rme96->lock);
+	if (err < 0)
 		return err;
-	}
 	if (snd_rme96_getinputtype(rme96) == RME96_INPUT_ANALOG) {
 		err = snd_rme96_capture_analog_setrate(rme96, params_rate(params));
-		if (err < 0) {
-			spin_unlock_irq(&rme96->lock);
+		if (err < 0)
 			return err;
-		}
 	} else {
 		rate = snd_rme96_capture_getrate(rme96, &isadat);
 		if (rate > 0) {
-			if ((int)params_rate(params) != rate) {
-				spin_unlock_irq(&rme96->lock);
+			if ((int)params_rate(params) != rate)
 				return -EIO;
-			}
 			if ((isadat && runtime->hw.channels_min == 2) ||
-			    (!isadat && runtime->hw.channels_min == 8)) {
-				spin_unlock_irq(&rme96->lock);
+			    (!isadat && runtime->hw.channels_min == 8))
 				return -EIO;
-			}
 		}
         }
 	snd_rme96_setframelog(rme96, params_channels(params), 0);
 	if (rme96->playback_periodsize != 0) {
 		if (params_period_size(params) << rme96->capture_frlog !=
 		    rme96->playback_periodsize)
-		{
-			spin_unlock_irq(&rme96->lock);
 			return -EBUSY;
-		}
 	}
 	rme96->capture_periodsize =
 		params_period_size(params) << rme96->capture_frlog;
 	snd_rme96_set_period_properties(rme96, rme96->capture_periodsize);
-	spin_unlock_irq(&rme96->lock);
 
 	return 0;
 }
@@ -1165,15 +1150,13 @@ snd_rme96_playback_spdif_open(struct snd_pcm_substream *substream)
 	struct snd_pcm_runtime *runtime = substream->runtime;
 
 	snd_pcm_set_sync(substream);
-	spin_lock_irq(&rme96->lock);	
-	if (rme96->playback_substream) {
-		spin_unlock_irq(&rme96->lock);
-                return -EBUSY;
-        }
-	rme96->wcreg &= ~RME96_WCR_ADAT;
-	writel(rme96->wcreg, rme96->iobase + RME96_IO_CONTROL_REGISTER);
-	rme96->playback_substream = substream;
-	spin_unlock_irq(&rme96->lock);
+	scoped_guard(spinlock_irq, &rme96->lock) {
+		if (rme96->playback_substream)
+			return -EBUSY;
+		rme96->wcreg &= ~RME96_WCR_ADAT;
+		writel(rme96->wcreg, rme96->iobase + RME96_IO_CONTROL_REGISTER);
+		rme96->playback_substream = substream;
+	}
 
 	runtime->hw = snd_rme96_playback_spdif_info;
 	if (!(rme96->wcreg & RME96_WCR_MASTER) &&
@@ -1215,13 +1198,11 @@ snd_rme96_capture_spdif_open(struct snd_pcm_substream *substream)
 		}
 	}
         
-	spin_lock_irq(&rme96->lock);
-	if (rme96->capture_substream) {
-		spin_unlock_irq(&rme96->lock);
-                return -EBUSY;
-        }
-	rme96->capture_substream = substream;
-	spin_unlock_irq(&rme96->lock);
+	scoped_guard(spinlock_irq, &rme96->lock) {
+		if (rme96->capture_substream)
+			return -EBUSY;
+		rme96->capture_substream = substream;
+	}
 	
 	rme96_set_buffer_size_constraint(rme96, runtime);
 	return 0;
@@ -1235,15 +1216,13 @@ snd_rme96_playback_adat_open(struct snd_pcm_substream *substream)
 	struct snd_pcm_runtime *runtime = substream->runtime;        
 	
 	snd_pcm_set_sync(substream);
-	spin_lock_irq(&rme96->lock);	
-	if (rme96->playback_substream) {
-		spin_unlock_irq(&rme96->lock);
-                return -EBUSY;
-        }
-	rme96->wcreg |= RME96_WCR_ADAT;
-	writel(rme96->wcreg, rme96->iobase + RME96_IO_CONTROL_REGISTER);
-	rme96->playback_substream = substream;
-	spin_unlock_irq(&rme96->lock);
+	scoped_guard(spinlock_irq, &rme96->lock) {
+		if (rme96->playback_substream)
+			return -EBUSY;
+		rme96->wcreg |= RME96_WCR_ADAT;
+		writel(rme96->wcreg, rme96->iobase + RME96_IO_CONTROL_REGISTER);
+		rme96->playback_substream = substream;
+	}
 	
 	runtime->hw = snd_rme96_playback_adat_info;
 	if (!(rme96->wcreg & RME96_WCR_MASTER) &&
@@ -1285,13 +1264,11 @@ snd_rme96_capture_adat_open(struct snd_pcm_substream *substream)
                 runtime->hw.rate_max = rate;
         }
         
-	spin_lock_irq(&rme96->lock);	
-	if (rme96->capture_substream) {
-		spin_unlock_irq(&rme96->lock);
-                return -EBUSY;
-        }
-	rme96->capture_substream = substream;
-	spin_unlock_irq(&rme96->lock);
+	scoped_guard(spinlock_irq, &rme96->lock) {
+		if (rme96->capture_substream)
+			return -EBUSY;
+		rme96->capture_substream = substream;
+	}
 
 	rme96_set_buffer_size_constraint(rme96, runtime);
 	return 0;
@@ -1303,14 +1280,13 @@ snd_rme96_playback_close(struct snd_pcm_substream *substream)
 	struct rme96 *rme96 = snd_pcm_substream_chip(substream);
 	int spdif = 0;
 
-	spin_lock_irq(&rme96->lock);	
-	if (RME96_ISPLAYING(rme96)) {
-		snd_rme96_trigger(rme96, RME96_STOP_PLAYBACK);
+	scoped_guard(spinlock_irq, &rme96->lock) {
+		if (RME96_ISPLAYING(rme96))
+			snd_rme96_trigger(rme96, RME96_STOP_PLAYBACK);
+		rme96->playback_substream = NULL;
+		rme96->playback_periodsize = 0;
+		spdif = (rme96->wcreg & RME96_WCR_ADAT) == 0;
 	}
-	rme96->playback_substream = NULL;
-	rme96->playback_periodsize = 0;
-	spdif = (rme96->wcreg & RME96_WCR_ADAT) == 0;
-	spin_unlock_irq(&rme96->lock);
 	if (spdif) {
 		rme96->spdif_ctl->vd[0].access |= SNDRV_CTL_ELEM_ACCESS_INACTIVE;
 		snd_ctl_notify(rme96->card, SNDRV_CTL_EVENT_MASK_VALUE |
@@ -1324,13 +1300,12 @@ snd_rme96_capture_close(struct snd_pcm_substream *substream)
 {
 	struct rme96 *rme96 = snd_pcm_substream_chip(substream);
 	
-	spin_lock_irq(&rme96->lock);	
+	guard(spinlock_irq)(&rme96->lock);
 	if (RME96_ISRECORDING(rme96)) {
 		snd_rme96_trigger(rme96, RME96_STOP_CAPTURE);
 	}
 	rme96->capture_substream = NULL;
 	rme96->capture_periodsize = 0;
-	spin_unlock_irq(&rme96->lock);
 	return 0;
 }
 
@@ -1339,12 +1314,11 @@ snd_rme96_playback_prepare(struct snd_pcm_substream *substream)
 {
 	struct rme96 *rme96 = snd_pcm_substream_chip(substream);
 	
-	spin_lock_irq(&rme96->lock);	
+	guard(spinlock_irq)(&rme96->lock);
 	if (RME96_ISPLAYING(rme96)) {
 		snd_rme96_trigger(rme96, RME96_STOP_PLAYBACK);
 	}
 	writel(0, rme96->iobase + RME96_IO_RESET_PLAY_POS);
-	spin_unlock_irq(&rme96->lock);
 	return 0;
 }
 
@@ -1353,12 +1327,11 @@ snd_rme96_capture_prepare(struct snd_pcm_substream *substream)
 {
 	struct rme96 *rme96 = snd_pcm_substream_chip(substream);
 	
-	spin_lock_irq(&rme96->lock);	
+	guard(spinlock_irq)(&rme96->lock);
 	if (RME96_ISRECORDING(rme96)) {
 		snd_rme96_trigger(rme96, RME96_STOP_CAPTURE);
 	}
 	writel(0, rme96->iobase + RME96_IO_RESET_REC_POS);
-	spin_unlock_irq(&rme96->lock);
 	return 0;
 }
 
@@ -1829,9 +1802,8 @@ snd_rme96_get_loopback_control(struct snd_kcontrol *kcontrol, struct snd_ctl_ele
 {
 	struct rme96 *rme96 = snd_kcontrol_chip(kcontrol);
 	
-	spin_lock_irq(&rme96->lock);
+	guard(spinlock_irq)(&rme96->lock);
 	ucontrol->value.integer.value[0] = rme96->wcreg & RME96_WCR_SEL ? 0 : 1;
-	spin_unlock_irq(&rme96->lock);
 	return 0;
 }
 static int
@@ -1842,12 +1814,11 @@ snd_rme96_put_loopback_control(struct snd_kcontrol *kcontrol, struct snd_ctl_ele
 	int change;
 	
 	val = ucontrol->value.integer.value[0] ? 0 : RME96_WCR_SEL;
-	spin_lock_irq(&rme96->lock);
+	guard(spinlock_irq)(&rme96->lock);
 	val = (rme96->wcreg & ~RME96_WCR_SEL) | val;
 	change = val != rme96->wcreg;
 	rme96->wcreg = val;
 	writel(val, rme96->iobase + RME96_IO_CONTROL_REGISTER);
-	spin_unlock_irq(&rme96->lock);
 	return change;
 }
 
@@ -1893,7 +1864,7 @@ snd_rme96_get_inputtype_control(struct snd_kcontrol *kcontrol, struct snd_ctl_el
 	struct rme96 *rme96 = snd_kcontrol_chip(kcontrol);
 	unsigned int items = 3;
 	
-	spin_lock_irq(&rme96->lock);
+	guard(spinlock_irq)(&rme96->lock);
 	ucontrol->value.enumerated.item[0] = snd_rme96_getinputtype(rme96);
 	
 	switch (rme96->pci->device) {
@@ -1923,7 +1894,6 @@ snd_rme96_get_inputtype_control(struct snd_kcontrol *kcontrol, struct snd_ctl_el
 		ucontrol->value.enumerated.item[0] = items - 1;
 	}
 	
-	spin_unlock_irq(&rme96->lock);
 	return 0;
 }
 static int
@@ -1961,10 +1931,9 @@ snd_rme96_put_inputtype_control(struct snd_kcontrol *kcontrol, struct snd_ctl_el
 		}
 	}
 	
-	spin_lock_irq(&rme96->lock);
+	guard(spinlock_irq)(&rme96->lock);
 	change = (int)val != snd_rme96_getinputtype(rme96);
 	snd_rme96_setinputtype(rme96, val);
-	spin_unlock_irq(&rme96->lock);
 	return change;
 }
 
@@ -1980,9 +1949,8 @@ snd_rme96_get_clockmode_control(struct snd_kcontrol *kcontrol, struct snd_ctl_el
 {
 	struct rme96 *rme96 = snd_kcontrol_chip(kcontrol);
 	
-	spin_lock_irq(&rme96->lock);
+	guard(spinlock_irq)(&rme96->lock);
 	ucontrol->value.enumerated.item[0] = snd_rme96_getclockmode(rme96);
-	spin_unlock_irq(&rme96->lock);
 	return 0;
 }
 static int
@@ -1993,10 +1961,9 @@ snd_rme96_put_clockmode_control(struct snd_kcontrol *kcontrol, struct snd_ctl_el
 	int change;
 	
 	val = ucontrol->value.enumerated.item[0] % 3;
-	spin_lock_irq(&rme96->lock);
+	guard(spinlock_irq)(&rme96->lock);
 	change = (int)val != snd_rme96_getclockmode(rme96);
 	snd_rme96_setclockmode(rme96, val);
-	spin_unlock_irq(&rme96->lock);
 	return change;
 }
 
@@ -2014,9 +1981,8 @@ snd_rme96_get_attenuation_control(struct snd_kcontrol *kcontrol, struct snd_ctl_
 {
 	struct rme96 *rme96 = snd_kcontrol_chip(kcontrol);
 	
-	spin_lock_irq(&rme96->lock);
+	guard(spinlock_irq)(&rme96->lock);
 	ucontrol->value.enumerated.item[0] = snd_rme96_getattenuation(rme96);
-	spin_unlock_irq(&rme96->lock);
 	return 0;
 }
 static int
@@ -2027,11 +1993,10 @@ snd_rme96_put_attenuation_control(struct snd_kcontrol *kcontrol, struct snd_ctl_
 	int change;
 	
 	val = ucontrol->value.enumerated.item[0] % 4;
-	spin_lock_irq(&rme96->lock);
+	guard(spinlock_irq)(&rme96->lock);
 
 	change = (int)val != snd_rme96_getattenuation(rme96);
 	snd_rme96_setattenuation(rme96, val);
-	spin_unlock_irq(&rme96->lock);
 	return change;
 }
 
@@ -2047,9 +2012,8 @@ snd_rme96_get_montracks_control(struct snd_kcontrol *kcontrol, struct snd_ctl_el
 {
 	struct rme96 *rme96 = snd_kcontrol_chip(kcontrol);
 	
-	spin_lock_irq(&rme96->lock);
+	guard(spinlock_irq)(&rme96->lock);
 	ucontrol->value.enumerated.item[0] = snd_rme96_getmontracks(rme96);
-	spin_unlock_irq(&rme96->lock);
 	return 0;
 }
 static int
@@ -2060,10 +2024,9 @@ snd_rme96_put_montracks_control(struct snd_kcontrol *kcontrol, struct snd_ctl_el
 	int change;
 	
 	val = ucontrol->value.enumerated.item[0] % 4;
-	spin_lock_irq(&rme96->lock);
+	guard(spinlock_irq)(&rme96->lock);
 	change = (int)val != snd_rme96_getmontracks(rme96);
 	snd_rme96_setmontracks(rme96, val);
-	spin_unlock_irq(&rme96->lock);
 	return change;
 }
 
@@ -2111,10 +2074,9 @@ static int snd_rme96_control_spdif_put(struct snd_kcontrol *kcontrol, struct snd
 	u32 val;
 	
 	val = snd_rme96_convert_from_aes(&ucontrol->value.iec958);
-	spin_lock_irq(&rme96->lock);
+	guard(spinlock_irq)(&rme96->lock);
 	change = val != rme96->wcreg_spdif;
 	rme96->wcreg_spdif = val;
-	spin_unlock_irq(&rme96->lock);
 	return change;
 }
 
@@ -2140,13 +2102,12 @@ static int snd_rme96_control_spdif_stream_put(struct snd_kcontrol *kcontrol, str
 	u32 val;
 	
 	val = snd_rme96_convert_from_aes(&ucontrol->value.iec958);
-	spin_lock_irq(&rme96->lock);
+	guard(spinlock_irq)(&rme96->lock);
 	change = val != rme96->wcreg_spdif_stream;
 	rme96->wcreg_spdif_stream = val;
 	rme96->wcreg &= ~(RME96_WCR_PRO | RME96_WCR_DOLBY | RME96_WCR_EMP);
 	rme96->wcreg |= val;
 	writel(rme96->wcreg, rme96->iobase + RME96_IO_CONTROL_REGISTER);
-	spin_unlock_irq(&rme96->lock);
 	return change;
 }
 
@@ -2180,10 +2141,9 @@ snd_rme96_dac_volume_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_valu
 {
 	struct rme96 *rme96 = snd_kcontrol_chip(kcontrol);
 
-	spin_lock_irq(&rme96->lock);
+	guard(spinlock_irq)(&rme96->lock);
         u->value.integer.value[0] = rme96->vol[0];
         u->value.integer.value[1] = rme96->vol[1];
-	spin_unlock_irq(&rme96->lock);
 
         return 0;
 }
@@ -2199,7 +2159,7 @@ snd_rme96_dac_volume_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_valu
 	if (!RME96_HAS_ANALOG_OUT(rme96))
 		return -EINVAL;
 	maxvol = RME96_185X_MAX_OUT(rme96);
-	spin_lock_irq(&rme96->lock);
+	guard(spinlock_irq)(&rme96->lock);
 	vol = u->value.integer.value[0];
 	if (vol != rme96->vol[0] && vol <= maxvol) {
 		rme96->vol[0] = vol;
@@ -2212,7 +2172,6 @@ snd_rme96_dac_volume_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_valu
 	}
 	if (change)
 		snd_rme96_apply_dac_volume(rme96);
-	spin_unlock_irq(&rme96->lock);
 
         return change;
 }
-- 
2.50.1

