Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCAC32C318
	for <linux-sound@vger.kernel.org>; Wed, 27 Aug 2025 09:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756286454; cv=none; b=OqikfZV5G+P70QQX+l+wkdTkwrLaTp06q6XXa2SrQWGO8O/GwAhv6mIaFgUiZ9+WFCtnMTSOeHrQ538QKEVWoYwi/yRkAjdDdHIRHU0eWuLz9OR9uNrx57/sBQsk0c9FWWxAZULtYn4rfeUPdsGhRXHyRgWWidskNm0Tt+OaCVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756286454; c=relaxed/simple;
	bh=nQdW+WsRg/UJ/gLN6skB7RMqqSoZqIkahpO1BdMBjBc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZONmwbsKBJQOgRHsNQb7/s3qW3WrL5plCKmaQb+RY9rSdK8nbcXxq9KEvQ722e81XxdMujUjEOfcSz0k6bcAJTvnmPnYlCUwc1VhpbtbdnsOs7DzT8DFiF5MgSVcmuf01gVgo9yXRJ7DfmjLc20pw3N9hvOt1X52bAxYXrSks7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JYLO5w/I; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OHBOQOV/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JYLO5w/I; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OHBOQOV/; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JYLO5w/I";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OHBOQOV/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JYLO5w/I";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OHBOQOV/"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AF6861FFC4;
	Wed, 27 Aug 2025 09:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756286424; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tyLB1bOMYKtUi06H+vWR70X6P5AjdUPStKIhVHhi+vE=;
	b=JYLO5w/IoTmrp7bO110jvO60b16yQ4ObD32sF9LESS1m8ZJAd8o7b5sun+6U4hFDJz9q3W
	h9HbXZieLrHhmjkIZnrHZ6oRhcE5386w1CzwI3TvZqJpk481Je/JjcL/FDg+Wtk8OVympG
	1gbpwlsc3icZuGQMfvW4TIXF0OUppBw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756286424;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tyLB1bOMYKtUi06H+vWR70X6P5AjdUPStKIhVHhi+vE=;
	b=OHBOQOV/BNw0enXRSa2dnpUejOFz/QIZ98KcbnjJ0oL8NUQmnrWiNGPZRGoMatr1mZlI/3
	UiSt6iemhvVk82BA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756286424; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tyLB1bOMYKtUi06H+vWR70X6P5AjdUPStKIhVHhi+vE=;
	b=JYLO5w/IoTmrp7bO110jvO60b16yQ4ObD32sF9LESS1m8ZJAd8o7b5sun+6U4hFDJz9q3W
	h9HbXZieLrHhmjkIZnrHZ6oRhcE5386w1CzwI3TvZqJpk481Je/JjcL/FDg+Wtk8OVympG
	1gbpwlsc3icZuGQMfvW4TIXF0OUppBw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756286424;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tyLB1bOMYKtUi06H+vWR70X6P5AjdUPStKIhVHhi+vE=;
	b=OHBOQOV/BNw0enXRSa2dnpUejOFz/QIZ98KcbnjJ0oL8NUQmnrWiNGPZRGoMatr1mZlI/3
	UiSt6iemhvVk82BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9D48213AA3;
	Wed, 27 Aug 2025 09:20:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kJ3jJdjNrmiFEgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 27 Aug 2025 09:20:24 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH 07/19] ALSA: firewire: tascam: Use guard() for mutex locks
Date: Wed, 27 Aug 2025 11:20:01 +0200
Message-ID: <20250827092017.29014-8-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250827092017.29014-1-tiwai@suse.de>
References: <20250827092017.29014-1-tiwai@suse.de>
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
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

Replace the manual mutex lock/unlock pairs with guard() for code
simplification.

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/firewire/tascam/tascam-pcm.c | 68 ++++++++++++------------------
 sound/firewire/tascam/tascam.c     |  3 +-
 2 files changed, 28 insertions(+), 43 deletions(-)

diff --git a/sound/firewire/tascam/tascam-pcm.c b/sound/firewire/tascam/tascam-pcm.c
index a73003ac11e6..a437efcecae3 100644
--- a/sound/firewire/tascam/tascam-pcm.c
+++ b/sound/firewire/tascam/tascam-pcm.c
@@ -59,43 +59,36 @@ static int pcm_open(struct snd_pcm_substream *substream)
 	if (err < 0)
 		goto err_locked;
 
-	mutex_lock(&tscm->mutex);
+	scoped_guard(mutex, &tscm->mutex) {
 
-	// When source of clock is not internal or any stream is reserved for
-	// transmission of PCM frames, the available sampling rate is limited
-	// at current one.
-	if (clock != SND_TSCM_CLOCK_INTERNAL || tscm->substreams_counter > 0) {
-		unsigned int frames_per_period = d->events_per_period;
-		unsigned int frames_per_buffer = d->events_per_buffer;
-		unsigned int rate;
+		// When source of clock is not internal or any stream is reserved for
+		// transmission of PCM frames, the available sampling rate is limited
+		// at current one.
+		if (clock != SND_TSCM_CLOCK_INTERNAL || tscm->substreams_counter > 0) {
+			unsigned int frames_per_period = d->events_per_period;
+			unsigned int frames_per_buffer = d->events_per_buffer;
+			unsigned int rate;
 
-		err = snd_tscm_stream_get_rate(tscm, &rate);
-		if (err < 0) {
-			mutex_unlock(&tscm->mutex);
-			goto err_locked;
-		}
-		substream->runtime->hw.rate_min = rate;
-		substream->runtime->hw.rate_max = rate;
+			err = snd_tscm_stream_get_rate(tscm, &rate);
+			if (err < 0)
+				goto err_locked;
+			substream->runtime->hw.rate_min = rate;
+			substream->runtime->hw.rate_max = rate;
 
-		err = snd_pcm_hw_constraint_minmax(substream->runtime,
-					SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
-					frames_per_period, frames_per_period);
-		if (err < 0) {
-			mutex_unlock(&tscm->mutex);
-			goto err_locked;
-		}
+			err = snd_pcm_hw_constraint_minmax(substream->runtime,
+							   SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
+							   frames_per_period, frames_per_period);
+			if (err < 0)
+				goto err_locked;
 
-		err = snd_pcm_hw_constraint_minmax(substream->runtime,
-					SNDRV_PCM_HW_PARAM_BUFFER_SIZE,
-					frames_per_buffer, frames_per_buffer);
-		if (err < 0) {
-			mutex_unlock(&tscm->mutex);
-			goto err_locked;
+			err = snd_pcm_hw_constraint_minmax(substream->runtime,
+							   SNDRV_PCM_HW_PARAM_BUFFER_SIZE,
+							   frames_per_buffer, frames_per_buffer);
+			if (err < 0)
+				goto err_locked;
 		}
 	}
 
-	mutex_unlock(&tscm->mutex);
-
 	snd_pcm_set_sync(substream);
 
 	return 0;
@@ -124,12 +117,11 @@ static int pcm_hw_params(struct snd_pcm_substream *substream,
 		unsigned int frames_per_period = params_period_size(hw_params);
 		unsigned int frames_per_buffer = params_buffer_size(hw_params);
 
-		mutex_lock(&tscm->mutex);
+		guard(mutex)(&tscm->mutex);
 		err = snd_tscm_stream_reserve_duplex(tscm, rate,
 					frames_per_period, frames_per_buffer);
 		if (err >= 0)
 			++tscm->substreams_counter;
-		mutex_unlock(&tscm->mutex);
 	}
 
 	return err;
@@ -139,15 +131,13 @@ static int pcm_hw_free(struct snd_pcm_substream *substream)
 {
 	struct snd_tscm *tscm = substream->private_data;
 
-	mutex_lock(&tscm->mutex);
+	guard(mutex)(&tscm->mutex);
 
 	if (substream->runtime->state != SNDRV_PCM_STATE_OPEN)
 		--tscm->substreams_counter;
 
 	snd_tscm_stream_stop_duplex(tscm);
 
-	mutex_unlock(&tscm->mutex);
-
 	return 0;
 }
 
@@ -157,14 +147,12 @@ static int pcm_capture_prepare(struct snd_pcm_substream *substream)
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	int err;
 
-	mutex_lock(&tscm->mutex);
+	guard(mutex)(&tscm->mutex);
 
 	err = snd_tscm_stream_start_duplex(tscm, runtime->rate);
 	if (err >= 0)
 		amdtp_stream_pcm_prepare(&tscm->tx_stream);
 
-	mutex_unlock(&tscm->mutex);
-
 	return err;
 }
 
@@ -174,14 +162,12 @@ static int pcm_playback_prepare(struct snd_pcm_substream *substream)
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	int err;
 
-	mutex_lock(&tscm->mutex);
+	guard(mutex)(&tscm->mutex);
 
 	err = snd_tscm_stream_start_duplex(tscm, runtime->rate);
 	if (err >= 0)
 		amdtp_stream_pcm_prepare(&tscm->rx_stream);
 
-	mutex_unlock(&tscm->mutex);
-
 	return err;
 }
 
diff --git a/sound/firewire/tascam/tascam.c b/sound/firewire/tascam/tascam.c
index 4f68bb4c58bc..f4092df8650c 100644
--- a/sound/firewire/tascam/tascam.c
+++ b/sound/firewire/tascam/tascam.c
@@ -158,9 +158,8 @@ static void snd_tscm_update(struct fw_unit *unit)
 
 	snd_tscm_transaction_reregister(tscm);
 
-	mutex_lock(&tscm->mutex);
+	guard(mutex)(&tscm->mutex);
 	snd_tscm_stream_update_duplex(tscm);
-	mutex_unlock(&tscm->mutex);
 }
 
 static void snd_tscm_remove(struct fw_unit *unit)
-- 
2.50.1

