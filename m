Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B4819F121
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 15:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756479641; cv=none; b=q/6sd4JWnZTjYksAzkLQXLPQVDb8j2MMzzJyTcWznlcYi1lIibmAupxp76GRDoiP/DE+xFFfk8xKOzfDiihtHx/505VeVarBRzRru9DUALWmjtB+IX7sT/nBEhVwCaAGci6L5csIdofvmB91CCmFuihne3Ue/n4F7wv4G8yVyS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756479641; c=relaxed/simple;
	bh=ZDDSaBtfcK8gTqqa1nyEFWRncHsGFSjIjFNKEmx9aPo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RSfgtBmXLm811EZmcdcrFoTdN0DpiBLC1UWyibBBq4GMAS617rmwr6trG3Hg7nKJafw82ToxZDW3hSlxxnF97L1SnpKtvb7K7bEtLStDoLF6u22j7M6RLxXbPWd/cOGekmptSNLj0BMLjDoiPa3clcUy6Ay0RkzonPlmB2zVc1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lA7rVPHF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=y8YJ3myg; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lA7rVPHF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=y8YJ3myg; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lA7rVPHF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="y8YJ3myg";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lA7rVPHF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="y8YJ3myg"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 970E533EDC;
	Fri, 29 Aug 2025 15:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756479631; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EOIuL9s01TzaiVwNaQI99udotlk2XMJM4ioBXnNL+SE=;
	b=lA7rVPHFcHJerpdINIW1XB4qFiecXBQiQmBNegiKOxbcQgwUkHHZHFCV88qcgMSIhEzHMU
	e+UVhgwSgVaCdIKGlzkxk+IdlMbcoMkJylkkgWsJ60tZPWHqP9cabnx59FCHnume81tEae
	RfBGy+5xtm8WOaORvIqDIf021aVvSTU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756479631;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EOIuL9s01TzaiVwNaQI99udotlk2XMJM4ioBXnNL+SE=;
	b=y8YJ3mygcSYzr0qyBx3oYDqTicFB6AhaoCdWV2qaSpXA6FDAWJQAMSDEgRmV0jh0Uqp86d
	mwwExkFWySU1UjDg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=lA7rVPHF;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=y8YJ3myg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756479631; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EOIuL9s01TzaiVwNaQI99udotlk2XMJM4ioBXnNL+SE=;
	b=lA7rVPHFcHJerpdINIW1XB4qFiecXBQiQmBNegiKOxbcQgwUkHHZHFCV88qcgMSIhEzHMU
	e+UVhgwSgVaCdIKGlzkxk+IdlMbcoMkJylkkgWsJ60tZPWHqP9cabnx59FCHnume81tEae
	RfBGy+5xtm8WOaORvIqDIf021aVvSTU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756479631;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EOIuL9s01TzaiVwNaQI99udotlk2XMJM4ioBXnNL+SE=;
	b=y8YJ3mygcSYzr0qyBx3oYDqTicFB6AhaoCdWV2qaSpXA6FDAWJQAMSDEgRmV0jh0Uqp86d
	mwwExkFWySU1UjDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7FB3E13326;
	Fri, 29 Aug 2025 15:00:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wGAHHo/AsWjjHQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 15:00:31 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 02/13] ALSA: aloop: Use guard() for spin locks
Date: Fri, 29 Aug 2025 17:00:13 +0200
Message-ID: <20250829150026.6379-3-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829150026.6379-1-tiwai@suse.de>
References: <20250829150026.6379-1-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 970E533EDC
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Clean up the code using guard() for spin locks.

Merely code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/aloop.c | 193 +++++++++++++++++++++---------------------
 1 file changed, 96 insertions(+), 97 deletions(-)

diff --git a/sound/drivers/aloop.c b/sound/drivers/aloop.c
index 79e7f03e51e9..64ef03b2d579 100644
--- a/sound/drivers/aloop.c
+++ b/sound/drivers/aloop.c
@@ -414,39 +414,39 @@ static int loopback_trigger(struct snd_pcm_substream *substream, int cmd)
 		dpcm->last_jiffies = jiffies;
 		dpcm->pcm_rate_shift = 0;
 		dpcm->last_drift = 0;
-		spin_lock(&cable->lock);	
-		cable->running |= stream;
-		cable->pause &= ~stream;
-		err = cable->ops->start(dpcm);
-		spin_unlock(&cable->lock);
+		scoped_guard(spinlock, &cable->lock) {
+			cable->running |= stream;
+			cable->pause &= ~stream;
+			err = cable->ops->start(dpcm);
+		}
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 			loopback_active_notify(dpcm);
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
-		spin_lock(&cable->lock);	
-		cable->running &= ~stream;
-		cable->pause &= ~stream;
-		err = cable->ops->stop(dpcm);
-		spin_unlock(&cable->lock);
+		scoped_guard(spinlock, &cable->lock) {
+			cable->running &= ~stream;
+			cable->pause &= ~stream;
+			err = cable->ops->stop(dpcm);
+		}
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 			loopback_active_notify(dpcm);
 		break;
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
-		spin_lock(&cable->lock);	
-		cable->pause |= stream;
-		err = cable->ops->stop(dpcm);
-		spin_unlock(&cable->lock);
+		scoped_guard(spinlock, &cable->lock) {
+			cable->pause |= stream;
+			err = cable->ops->stop(dpcm);
+		}
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 			loopback_active_notify(dpcm);
 		break;
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 	case SNDRV_PCM_TRIGGER_RESUME:
-		spin_lock(&cable->lock);
-		dpcm->last_jiffies = jiffies;
-		cable->pause &= ~stream;
-		err = cable->ops->start(dpcm);
-		spin_unlock(&cable->lock);
+		scoped_guard(spinlock, &cable->lock) {
+			dpcm->last_jiffies = jiffies;
+			cable->pause &= ~stream;
+			err = cable->ops->start(dpcm);
+		}
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 			loopback_active_notify(dpcm);
 		break;
@@ -700,21 +700,22 @@ static unsigned int loopback_jiffies_timer_pos_update
 static void loopback_jiffies_timer_function(struct timer_list *t)
 {
 	struct loopback_pcm *dpcm = timer_container_of(dpcm, t, timer);
-	unsigned long flags;
+	bool period_elapsed = false;
 
-	spin_lock_irqsave(&dpcm->cable->lock, flags);
-	if (loopback_jiffies_timer_pos_update(dpcm->cable) &
-			(1 << dpcm->substream->stream)) {
-		loopback_jiffies_timer_start(dpcm);
-		if (dpcm->period_update_pending) {
-			dpcm->period_update_pending = 0;
-			spin_unlock_irqrestore(&dpcm->cable->lock, flags);
-			/* need to unlock before calling below */
-			snd_pcm_period_elapsed(dpcm->substream);
-			return;
+	scoped_guard(spinlock_irqsave, &dpcm->cable->lock) {
+		if (loopback_jiffies_timer_pos_update(dpcm->cable) &
+		    (1 << dpcm->substream->stream)) {
+			loopback_jiffies_timer_start(dpcm);
+			if (dpcm->period_update_pending) {
+				dpcm->period_update_pending = 0;
+				period_elapsed = true;
+				break;
+			}
 		}
 	}
-	spin_unlock_irqrestore(&dpcm->cable->lock, flags);
+
+	if (period_elapsed)
+		snd_pcm_period_elapsed(dpcm->substream);
 }
 
 /* call in cable->lock */
@@ -759,69 +760,69 @@ static void loopback_snd_timer_period_elapsed(struct loopback_cable *cable,
 	struct snd_pcm_substream *substream_play, *substream_capt;
 	struct snd_pcm_runtime *valid_runtime;
 	unsigned int running, elapsed_bytes;
-	unsigned long flags;
+	bool xrun = false;
 
-	spin_lock_irqsave(&cable->lock, flags);
-	running = cable->running ^ cable->pause;
-	/* no need to do anything if no stream is running */
-	if (!running) {
-		spin_unlock_irqrestore(&cable->lock, flags);
+	scoped_guard(spinlock_irqsave, &cable->lock) {
+		running = cable->running ^ cable->pause;
+		/* no need to do anything if no stream is running */
+		if (!running)
+			return;
+
+		dpcm_play = cable->streams[SNDRV_PCM_STREAM_PLAYBACK];
+		dpcm_capt = cable->streams[SNDRV_PCM_STREAM_CAPTURE];
+
+		if (event == SNDRV_TIMER_EVENT_MSTOP) {
+			if (!dpcm_play ||
+			    dpcm_play->substream->runtime->state !=
+			    SNDRV_PCM_STATE_DRAINING)
+				return;
+		}
+
+		substream_play = (running & (1 << SNDRV_PCM_STREAM_PLAYBACK)) ?
+			dpcm_play->substream : NULL;
+		substream_capt = (running & (1 << SNDRV_PCM_STREAM_CAPTURE)) ?
+			dpcm_capt->substream : NULL;
+		valid_runtime = (running & (1 << SNDRV_PCM_STREAM_PLAYBACK)) ?
+			dpcm_play->substream->runtime :
+			dpcm_capt->substream->runtime;
+
+		/* resolution is only valid for SNDRV_TIMER_EVENT_TICK events */
+		if (event == SNDRV_TIMER_EVENT_TICK) {
+			/* The hardware rules guarantee that playback and capture period
+			 * are the same. Therefore only one device has to be checked
+			 * here.
+			 */
+			if (loopback_snd_timer_check_resolution(valid_runtime,
+								resolution) < 0) {
+				xrun = true;
+				break;
+			}
+		}
+
+		elapsed_bytes = frames_to_bytes(valid_runtime,
+						valid_runtime->period_size);
+		/* The same timer interrupt is used for playback and capture device */
+		if ((running & (1 << SNDRV_PCM_STREAM_PLAYBACK)) &&
+		    (running & (1 << SNDRV_PCM_STREAM_CAPTURE))) {
+			copy_play_buf(dpcm_play, dpcm_capt, elapsed_bytes);
+			bytepos_finish(dpcm_play, elapsed_bytes);
+			bytepos_finish(dpcm_capt, elapsed_bytes);
+		} else if (running & (1 << SNDRV_PCM_STREAM_PLAYBACK)) {
+			bytepos_finish(dpcm_play, elapsed_bytes);
+		} else if (running & (1 << SNDRV_PCM_STREAM_CAPTURE)) {
+			clear_capture_buf(dpcm_capt, elapsed_bytes);
+			bytepos_finish(dpcm_capt, elapsed_bytes);
+		}
+	}
+
+	if (xrun) {
+		if (substream_play)
+			snd_pcm_stop_xrun(substream_play);
+		if (substream_capt)
+			snd_pcm_stop_xrun(substream_capt);
 		return;
 	}
 
-	dpcm_play = cable->streams[SNDRV_PCM_STREAM_PLAYBACK];
-	dpcm_capt = cable->streams[SNDRV_PCM_STREAM_CAPTURE];
-
-	if (event == SNDRV_TIMER_EVENT_MSTOP) {
-		if (!dpcm_play ||
-		    dpcm_play->substream->runtime->state !=
-				SNDRV_PCM_STATE_DRAINING) {
-			spin_unlock_irqrestore(&cable->lock, flags);
-			return;
-		}
-	}
-
-	substream_play = (running & (1 << SNDRV_PCM_STREAM_PLAYBACK)) ?
-			dpcm_play->substream : NULL;
-	substream_capt = (running & (1 << SNDRV_PCM_STREAM_CAPTURE)) ?
-			dpcm_capt->substream : NULL;
-	valid_runtime = (running & (1 << SNDRV_PCM_STREAM_PLAYBACK)) ?
-				dpcm_play->substream->runtime :
-				dpcm_capt->substream->runtime;
-
-	/* resolution is only valid for SNDRV_TIMER_EVENT_TICK events */
-	if (event == SNDRV_TIMER_EVENT_TICK) {
-		/* The hardware rules guarantee that playback and capture period
-		 * are the same. Therefore only one device has to be checked
-		 * here.
-		 */
-		if (loopback_snd_timer_check_resolution(valid_runtime,
-							resolution) < 0) {
-			spin_unlock_irqrestore(&cable->lock, flags);
-			if (substream_play)
-				snd_pcm_stop_xrun(substream_play);
-			if (substream_capt)
-				snd_pcm_stop_xrun(substream_capt);
-			return;
-		}
-	}
-
-	elapsed_bytes = frames_to_bytes(valid_runtime,
-					valid_runtime->period_size);
-	/* The same timer interrupt is used for playback and capture device */
-	if ((running & (1 << SNDRV_PCM_STREAM_PLAYBACK)) &&
-	    (running & (1 << SNDRV_PCM_STREAM_CAPTURE))) {
-		copy_play_buf(dpcm_play, dpcm_capt, elapsed_bytes);
-		bytepos_finish(dpcm_play, elapsed_bytes);
-		bytepos_finish(dpcm_capt, elapsed_bytes);
-	} else if (running & (1 << SNDRV_PCM_STREAM_PLAYBACK)) {
-		bytepos_finish(dpcm_play, elapsed_bytes);
-	} else if (running & (1 << SNDRV_PCM_STREAM_CAPTURE)) {
-		clear_capture_buf(dpcm_capt, elapsed_bytes);
-		bytepos_finish(dpcm_capt, elapsed_bytes);
-	}
-	spin_unlock_irqrestore(&cable->lock, flags);
-
 	if (substream_play)
 		snd_pcm_period_elapsed(substream_play);
 	if (substream_capt)
@@ -909,11 +910,10 @@ static snd_pcm_uframes_t loopback_pointer(struct snd_pcm_substream *substream)
 	struct loopback_pcm *dpcm = runtime->private_data;
 	snd_pcm_uframes_t pos;
 
-	spin_lock(&dpcm->cable->lock);
+	guard(spinlock)(&dpcm->cable->lock);
 	if (dpcm->cable->ops->pos_update)
 		dpcm->cable->ops->pos_update(dpcm->cable);
 	pos = dpcm->buf_pos;
-	spin_unlock(&dpcm->cable->lock);
 	return bytes_to_frames(runtime, pos);
 }
 
@@ -1045,9 +1045,8 @@ static void free_cable(struct snd_pcm_substream *substream)
 		return;
 	if (cable->streams[!substream->stream]) {
 		/* other stream is still alive */
-		spin_lock_irq(&cable->lock);
+		guard(spinlock_irq)(&cable->lock);
 		cable->streams[substream->stream] = NULL;
-		spin_unlock_irq(&cable->lock);
 	} else {
 		struct loopback_pcm *dpcm = substream->runtime->private_data;
 
@@ -1313,9 +1312,9 @@ static int loopback_open(struct snd_pcm_substream *substream)
 	else
 		runtime->hw = cable->hw;
 
-	spin_lock_irq(&cable->lock);
-	cable->streams[substream->stream] = dpcm;
-	spin_unlock_irq(&cable->lock);
+	scoped_guard(spinlock_irq, &cable->lock) {
+		cable->streams[substream->stream] = dpcm;
+	}
 
  unlock:
 	if (err < 0) {
-- 
2.50.1

