Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B432D77F7
	for <linux-sound@vger.kernel.org>; Wed, 27 Aug 2025 09:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756286442; cv=none; b=UCUIkf+RXo5KUjOzZ0zPyrzQ8F8VHkIHdZp9e5+D6V8GyB3oF5fXV+dtdTKRQy077ehfjzA1dy6kI/2savlrzuawBqDGzXN2+OxvVPYHtVGJZZt1DzJ3SGBtvojCSr9bW9Yeu8MU8HOFvWFtJyH9VatTbwHUVqoEV8vjZwdT52Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756286442; c=relaxed/simple;
	bh=QlAWCAj1JEd+hlMRiDVkBHfQZ1huWueIa8xjd8ugMnk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q8lQdeqADu//zs3rIpgsslAGJP5RZv4EaSp/E+2hpE9Y9uMsW306u41LN9ALLFwEvgp17qdqgdOBq8IcBYGcz2d6n2hLWq2jt28PBG/Ul7zuC9ZhGaCVF9E9vkeyG8EVTI7mJQpIs/LhIKfU+XrrqihWEpHRcmNbtqykA+6q0GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WNxdlq4M; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Nhv4ROyw; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WNxdlq4M; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Nhv4ROyw; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WNxdlq4M";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Nhv4ROyw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WNxdlq4M";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Nhv4ROyw"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8B25E2222D;
	Wed, 27 Aug 2025 09:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756286424; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jsyZwn6yntz5mee0Nb2x7aTEUstBn1FaKZjHGqHg7PA=;
	b=WNxdlq4M17LdM25ZcTJg38i1F0GT6kjmaregnHqU4vDPRc8Hj5kGJmKQ7KnsEhKzoKIm8z
	K6i+NF3ePyne/ZbVX1KOQ/gdGUsiYwYds8FXNZe/JV7H9syrgeWV50haW/Lbpd6AmD34tX
	HcuZF/smHTxJ8Vt6MjS9eSseurCCADQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756286424;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jsyZwn6yntz5mee0Nb2x7aTEUstBn1FaKZjHGqHg7PA=;
	b=Nhv4ROywO1/Q4RRQ7xnlD5ur7qZHXvO80cAHVPioqJWuITFNHgSnixnbMFTyY0USGLh4U6
	udbfxh56oZEEj4DQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756286424; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jsyZwn6yntz5mee0Nb2x7aTEUstBn1FaKZjHGqHg7PA=;
	b=WNxdlq4M17LdM25ZcTJg38i1F0GT6kjmaregnHqU4vDPRc8Hj5kGJmKQ7KnsEhKzoKIm8z
	K6i+NF3ePyne/ZbVX1KOQ/gdGUsiYwYds8FXNZe/JV7H9syrgeWV50haW/Lbpd6AmD34tX
	HcuZF/smHTxJ8Vt6MjS9eSseurCCADQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756286424;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jsyZwn6yntz5mee0Nb2x7aTEUstBn1FaKZjHGqHg7PA=;
	b=Nhv4ROywO1/Q4RRQ7xnlD5ur7qZHXvO80cAHVPioqJWuITFNHgSnixnbMFTyY0USGLh4U6
	udbfxh56oZEEj4DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 783FF13A6A;
	Wed, 27 Aug 2025 09:20:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wKTYHNjNrmiFEgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 27 Aug 2025 09:20:24 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH 05/19] ALSA: firewire: motu: Use guard() for mutex locks
Date: Wed, 27 Aug 2025 11:19:59 +0200
Message-ID: <20250827092017.29014-6-tiwai@suse.de>
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
 sound/firewire/motu/motu-midi.c | 28 +++++-----
 sound/firewire/motu/motu-pcm.c  | 93 ++++++++++++++++-----------------
 2 files changed, 56 insertions(+), 65 deletions(-)

diff --git a/sound/firewire/motu/motu-midi.c b/sound/firewire/motu/motu-midi.c
index eebc7e790ee2..18c5734e999f 100644
--- a/sound/firewire/motu/motu-midi.c
+++ b/sound/firewire/motu/motu-midi.c
@@ -15,18 +15,16 @@ static int midi_open(struct snd_rawmidi_substream *substream)
 	if (err < 0)
 		return err;
 
-	mutex_lock(&motu->mutex);
-
-	err = snd_motu_stream_reserve_duplex(motu, 0, 0, 0);
-	if (err >= 0) {
-		++motu->substreams_counter;
-		err = snd_motu_stream_start_duplex(motu);
-		if (err < 0)
-			--motu->substreams_counter;
+	scoped_guard(mutex, &motu->mutex) {
+		err = snd_motu_stream_reserve_duplex(motu, 0, 0, 0);
+		if (err >= 0) {
+			++motu->substreams_counter;
+			err = snd_motu_stream_start_duplex(motu);
+			if (err < 0)
+				--motu->substreams_counter;
+		}
 	}
 
-	mutex_unlock(&motu->mutex);
-
 	if (err < 0)
 		snd_motu_stream_lock_release(motu);
 
@@ -37,12 +35,10 @@ static int midi_close(struct snd_rawmidi_substream *substream)
 {
 	struct snd_motu *motu = substream->rmidi->private_data;
 
-	mutex_lock(&motu->mutex);
-
-	--motu->substreams_counter;
-	snd_motu_stream_stop_duplex(motu);
-
-	mutex_unlock(&motu->mutex);
+	scoped_guard(mutex, &motu->mutex) {
+		--motu->substreams_counter;
+		snd_motu_stream_stop_duplex(motu);
+	}
 
 	snd_motu_stream_lock_release(motu);
 	return 0;
diff --git a/sound/firewire/motu/motu-pcm.c b/sound/firewire/motu/motu-pcm.c
index 7b4d476af348..2302a96909b8 100644
--- a/sound/firewire/motu/motu-pcm.c
+++ b/sound/firewire/motu/motu-pcm.c
@@ -138,59 +138,57 @@ static int pcm_open(struct snd_pcm_substream *substream)
 	if (err < 0)
 		return err;
 
-	mutex_lock(&motu->mutex);
+	scoped_guard(mutex, &motu->mutex) {
 
-	err = snd_motu_stream_cache_packet_formats(motu);
-	if (err < 0)
-		goto err_locked;
-
-	err = init_hw_info(motu, substream);
-	if (err < 0)
-		goto err_locked;
-
-	err = snd_motu_protocol_get_clock_source(motu, &src);
-	if (err < 0)
-		goto err_locked;
-
-	// When source of clock is not internal or any stream is reserved for
-	// transmission of PCM frames, the available sampling rate is limited
-	// at current one.
-	if ((src != SND_MOTU_CLOCK_SOURCE_INTERNAL &&
-	     src != SND_MOTU_CLOCK_SOURCE_SPH) ||
-	    (motu->substreams_counter > 0 && d->events_per_period > 0)) {
-		unsigned int frames_per_period = d->events_per_period;
-		unsigned int frames_per_buffer = d->events_per_buffer;
-		unsigned int rate;
-
-		err = snd_motu_protocol_get_clock_rate(motu, &rate);
+		err = snd_motu_stream_cache_packet_formats(motu);
 		if (err < 0)
 			goto err_locked;
 
-		substream->runtime->hw.rate_min = rate;
-		substream->runtime->hw.rate_max = rate;
+		err = init_hw_info(motu, substream);
+		if (err < 0)
+			goto err_locked;
 
-		if (frames_per_period > 0) {
-			err = snd_pcm_hw_constraint_minmax(substream->runtime,
-					SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
-					frames_per_period, frames_per_period);
+		err = snd_motu_protocol_get_clock_source(motu, &src);
+		if (err < 0)
+			goto err_locked;
+
+		// When source of clock is not internal or any stream is reserved for
+		// transmission of PCM frames, the available sampling rate is limited
+		// at current one.
+		if ((src != SND_MOTU_CLOCK_SOURCE_INTERNAL &&
+		     src != SND_MOTU_CLOCK_SOURCE_SPH) ||
+		    (motu->substreams_counter > 0 && d->events_per_period > 0)) {
+			unsigned int frames_per_period = d->events_per_period;
+			unsigned int frames_per_buffer = d->events_per_buffer;
+			unsigned int rate;
+
+			err = snd_motu_protocol_get_clock_rate(motu, &rate);
 			if (err < 0)
 				goto err_locked;
 
-			err = snd_pcm_hw_constraint_minmax(substream->runtime,
-					SNDRV_PCM_HW_PARAM_BUFFER_SIZE,
-					frames_per_buffer, frames_per_buffer);
-			if (err < 0)
-				goto err_locked;
+			substream->runtime->hw.rate_min = rate;
+			substream->runtime->hw.rate_max = rate;
+
+			if (frames_per_period > 0) {
+				err = snd_pcm_hw_constraint_minmax(substream->runtime,
+								   SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
+								   frames_per_period, frames_per_period);
+				if (err < 0)
+					goto err_locked;
+
+				err = snd_pcm_hw_constraint_minmax(substream->runtime,
+								   SNDRV_PCM_HW_PARAM_BUFFER_SIZE,
+								   frames_per_buffer, frames_per_buffer);
+				if (err < 0)
+					goto err_locked;
+			}
 		}
 	}
 
 	snd_pcm_set_sync(substream);
 
-	mutex_unlock(&motu->mutex);
-
 	return 0;
 err_locked:
-	mutex_unlock(&motu->mutex);
 	snd_motu_stream_lock_release(motu);
 	return err;
 }
@@ -215,12 +213,11 @@ static int pcm_hw_params(struct snd_pcm_substream *substream,
 		unsigned int frames_per_period = params_period_size(hw_params);
 		unsigned int frames_per_buffer = params_buffer_size(hw_params);
 
-		mutex_lock(&motu->mutex);
+		guard(mutex)(&motu->mutex);
 		err = snd_motu_stream_reserve_duplex(motu, rate,
 					frames_per_period, frames_per_buffer);
 		if (err >= 0)
 			++motu->substreams_counter;
-		mutex_unlock(&motu->mutex);
 	}
 
 	return err;
@@ -230,15 +227,13 @@ static int pcm_hw_free(struct snd_pcm_substream *substream)
 {
 	struct snd_motu *motu = substream->private_data;
 
-	mutex_lock(&motu->mutex);
+	guard(mutex)(&motu->mutex);
 
 	if (substream->runtime->state != SNDRV_PCM_STATE_OPEN)
 		--motu->substreams_counter;
 
 	snd_motu_stream_stop_duplex(motu);
 
-	mutex_unlock(&motu->mutex);
-
 	return 0;
 }
 
@@ -247,9 +242,9 @@ static int capture_prepare(struct snd_pcm_substream *substream)
 	struct snd_motu *motu = substream->private_data;
 	int err;
 
-	mutex_lock(&motu->mutex);
-	err = snd_motu_stream_start_duplex(motu);
-	mutex_unlock(&motu->mutex);
+	scoped_guard(mutex, &motu->mutex) {
+		err = snd_motu_stream_start_duplex(motu);
+	}
 	if (err >= 0)
 		amdtp_stream_pcm_prepare(&motu->tx_stream);
 
@@ -260,9 +255,9 @@ static int playback_prepare(struct snd_pcm_substream *substream)
 	struct snd_motu *motu = substream->private_data;
 	int err;
 
-	mutex_lock(&motu->mutex);
-	err = snd_motu_stream_start_duplex(motu);
-	mutex_unlock(&motu->mutex);
+	scoped_guard(mutex, &motu->mutex) {
+		err = snd_motu_stream_start_duplex(motu);
+	}
 	if (err >= 0)
 		amdtp_stream_pcm_prepare(&motu->rx_stream);
 
-- 
2.50.1

