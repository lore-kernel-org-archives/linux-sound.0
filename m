Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1C032C318
	for <linux-sound@vger.kernel.org>; Wed, 27 Aug 2025 09:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756286460; cv=none; b=V53PZwi55t7cHdwTvIRndL6J8pQNfujEuDyFSCJb7HR8g6pdMRZlaACTBM7nsX48+0COO9g5Wy4IqGISYDcCFQHepyYKDtgMCXLfH9zbUboKmrEZUfYv0URG0hrwdgX/WFvU0nnmQbEAwoLXjCzaI7nrARQkC9hDwZDgtv+XoxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756286460; c=relaxed/simple;
	bh=7Ih3usiJUJT4au20OO8OuUc63aDVqBj8gV41NRybMA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=USFcJdeozsTZWRFR9rm4M6PrAEHWIpZIeqbiNWBtgLN5WfLvI1FUyppI5zN1Ctk2s4wb9SM3lhuIHv5clBQ6vxPsoJNpMgIjrjlkA/59VgJxsQR02EHlhnEDdP9Lmh0Lj0CAzh76CCB4IzbZheMqtNZ0EvAQsVGhf6OYVmNX3n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=I6XxO0GQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0GZEnH7c; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=I6XxO0GQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0GZEnH7c; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="I6XxO0GQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0GZEnH7c";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="I6XxO0GQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0GZEnH7c"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C1CDF1FFC5;
	Wed, 27 Aug 2025 09:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756286424; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mVwsLZ6onzJBKUMjVRsfnU+cFuWI05WTb0rybrlOxu0=;
	b=I6XxO0GQrrhfa1TNHM46lOq0PXXfMtXlUmJDU/Zfpd4FvFcG6t9qJ0YZHD5nXzgqsoy25H
	qxuHyssgCWlnLozm8r39FjHrIJMfP0IinVuVsHxyKh0QsXbwy4kXFD/yIALkK2z8YeJRyZ
	plbwDfxoO50uzt1aFoH04ZOtPgfpjtY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756286424;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mVwsLZ6onzJBKUMjVRsfnU+cFuWI05WTb0rybrlOxu0=;
	b=0GZEnH7cy+6JDTF8pJXI1OZ3ajHbsGO+p+N5k3uHSjKfjRTFW2hsDybcnWWz+fxDd/AWTF
	shdHhQyeSQcYBBBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=I6XxO0GQ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=0GZEnH7c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756286424; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mVwsLZ6onzJBKUMjVRsfnU+cFuWI05WTb0rybrlOxu0=;
	b=I6XxO0GQrrhfa1TNHM46lOq0PXXfMtXlUmJDU/Zfpd4FvFcG6t9qJ0YZHD5nXzgqsoy25H
	qxuHyssgCWlnLozm8r39FjHrIJMfP0IinVuVsHxyKh0QsXbwy4kXFD/yIALkK2z8YeJRyZ
	plbwDfxoO50uzt1aFoH04ZOtPgfpjtY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756286424;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mVwsLZ6onzJBKUMjVRsfnU+cFuWI05WTb0rybrlOxu0=;
	b=0GZEnH7cy+6JDTF8pJXI1OZ3ajHbsGO+p+N5k3uHSjKfjRTFW2hsDybcnWWz+fxDd/AWTF
	shdHhQyeSQcYBBBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AF86F13A31;
	Wed, 27 Aug 2025 09:20:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8As0KtjNrmiFEgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 27 Aug 2025 09:20:24 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH 08/19] ALSA: firewire: fireface: Use guard() for mutex locks
Date: Wed, 27 Aug 2025 11:20:02 +0200
Message-ID: <20250827092017.29014-9-tiwai@suse.de>
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
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: C1CDF1FFC5
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Replace the manual mutex lock/unlock pairs with guard() for code
simplification.

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/firewire/fireface/ff-pcm.c | 91 ++++++++++++++------------------
 1 file changed, 39 insertions(+), 52 deletions(-)

diff --git a/sound/firewire/fireface/ff-pcm.c b/sound/firewire/fireface/ff-pcm.c
index 63457d24a288..2c301cff9616 100644
--- a/sound/firewire/fireface/ff-pcm.c
+++ b/sound/firewire/fireface/ff-pcm.c
@@ -156,56 +156,50 @@ static int pcm_open(struct snd_pcm_substream *substream)
 	if (err < 0)
 		goto release_lock;
 
-	mutex_lock(&ff->mutex);
+	scoped_guard(mutex, &ff->mutex) {
 
-	// When source of clock is not internal or any stream is reserved for
-	// transmission of PCM frames, the available sampling rate is limited
-	// at current one.
-	if (src != SND_FF_CLOCK_SRC_INTERNAL) {
-		for (i = 0; i < CIP_SFC_COUNT; ++i) {
-			if (amdtp_rate_table[i] == rate)
-				break;
-		}
+		// When source of clock is not internal or any stream is reserved for
+		// transmission of PCM frames, the available sampling rate is limited
+		// at current one.
+		if (src != SND_FF_CLOCK_SRC_INTERNAL) {
+			for (i = 0; i < CIP_SFC_COUNT; ++i) {
+				if (amdtp_rate_table[i] == rate)
+					break;
+			}
 
-		// The unit is configured at sampling frequency which packet
-		// streaming engine can't support.
-		if (i >= CIP_SFC_COUNT) {
-			mutex_unlock(&ff->mutex);
-			err = -EIO;
-			goto release_lock;
-		}
-
-		substream->runtime->hw.rate_min = rate;
-		substream->runtime->hw.rate_max = rate;
-	} else {
-		if (ff->substreams_counter > 0) {
-			unsigned int frames_per_period = d->events_per_period;
-			unsigned int frames_per_buffer = d->events_per_buffer;
-
-			rate = amdtp_rate_table[ff->rx_stream.sfc];
-			substream->runtime->hw.rate_min = rate;
-			substream->runtime->hw.rate_max = rate;
-
-			err = snd_pcm_hw_constraint_minmax(substream->runtime,
-					SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
-					frames_per_period, frames_per_period);
-			if (err < 0) {
-				mutex_unlock(&ff->mutex);
+			// The unit is configured at sampling frequency which packet
+			// streaming engine can't support.
+			if (i >= CIP_SFC_COUNT) {
+				err = -EIO;
 				goto release_lock;
 			}
 
-			err = snd_pcm_hw_constraint_minmax(substream->runtime,
-					SNDRV_PCM_HW_PARAM_BUFFER_SIZE,
-					frames_per_buffer, frames_per_buffer);
-			if (err < 0) {
-				mutex_unlock(&ff->mutex);
-				goto release_lock;
+			substream->runtime->hw.rate_min = rate;
+			substream->runtime->hw.rate_max = rate;
+		} else {
+			if (ff->substreams_counter > 0) {
+				unsigned int frames_per_period = d->events_per_period;
+				unsigned int frames_per_buffer = d->events_per_buffer;
+
+				rate = amdtp_rate_table[ff->rx_stream.sfc];
+				substream->runtime->hw.rate_min = rate;
+				substream->runtime->hw.rate_max = rate;
+
+				err = snd_pcm_hw_constraint_minmax(substream->runtime,
+								   SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
+								   frames_per_period, frames_per_period);
+				if (err < 0)
+					goto release_lock;
+
+				err = snd_pcm_hw_constraint_minmax(substream->runtime,
+								   SNDRV_PCM_HW_PARAM_BUFFER_SIZE,
+								   frames_per_buffer, frames_per_buffer);
+				if (err < 0)
+					goto release_lock;
 			}
 		}
 	}
 
-	mutex_unlock(&ff->mutex);
-
 	snd_pcm_set_sync(substream);
 
 	return 0;
@@ -235,12 +229,11 @@ static int pcm_hw_params(struct snd_pcm_substream *substream,
 		unsigned int frames_per_period = params_period_size(hw_params);
 		unsigned int frames_per_buffer = params_buffer_size(hw_params);
 
-		mutex_lock(&ff->mutex);
+		guard(mutex)(&ff->mutex);
 		err = snd_ff_stream_reserve_duplex(ff, rate, frames_per_period,
 						   frames_per_buffer);
 		if (err >= 0)
 			++ff->substreams_counter;
-		mutex_unlock(&ff->mutex);
 	}
 
 	return err;
@@ -250,15 +243,13 @@ static int pcm_hw_free(struct snd_pcm_substream *substream)
 {
 	struct snd_ff *ff = substream->private_data;
 
-	mutex_lock(&ff->mutex);
+	guard(mutex)(&ff->mutex);
 
 	if (substream->runtime->state != SNDRV_PCM_STATE_OPEN)
 		--ff->substreams_counter;
 
 	snd_ff_stream_stop_duplex(ff);
 
-	mutex_unlock(&ff->mutex);
-
 	return 0;
 }
 
@@ -268,14 +259,12 @@ static int pcm_capture_prepare(struct snd_pcm_substream *substream)
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	int err;
 
-	mutex_lock(&ff->mutex);
+	guard(mutex)(&ff->mutex);
 
 	err = snd_ff_stream_start_duplex(ff, runtime->rate);
 	if (err >= 0)
 		amdtp_stream_pcm_prepare(&ff->tx_stream);
 
-	mutex_unlock(&ff->mutex);
-
 	return err;
 }
 
@@ -285,14 +274,12 @@ static int pcm_playback_prepare(struct snd_pcm_substream *substream)
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	int err;
 
-	mutex_lock(&ff->mutex);
+	guard(mutex)(&ff->mutex);
 
 	err = snd_ff_stream_start_duplex(ff, runtime->rate);
 	if (err >= 0)
 		amdtp_stream_pcm_prepare(&ff->rx_stream);
 
-	mutex_unlock(&ff->mutex);
-
 	return err;
 }
 
-- 
2.50.1

