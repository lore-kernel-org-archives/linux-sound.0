Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F4D31195B
	for <linux-sound@vger.kernel.org>; Thu, 28 Aug 2025 13:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756387712; cv=none; b=R8i/MIAqtxHN9+Kn1e7tWVrPmdcx9We1OSvb4QeAHKFRmL2nPyl1vz7Rcm+DR54YIjOOPKS5uAylVScDT9E2kga1E7SP1WQ55iaL+JccnH3JWBoUArqm6NPG8oL7S5US72U85qp0+V9611vwgYMT7jnH+ceput77n91u67eCWsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756387712; c=relaxed/simple;
	bh=AidkrVWRrF60bqJNBUrVCYFTRRf1jCO2vj0jsWm+Rhc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JEdWTsnGKE7EBLPwAwKNlXd4rdvDHjM3tCAugXSaeXHtf+YcOje+qZ0DistRDDv/PUDzuAn1FAasDA9qVGW2Gm1nhsdAsfmFQ1M+wJYWbVXgl5HytN/u2nY1pHEuXzCN9xS4nFmky0sfzw+Ca9rI44/t4m7l8+Ty86IYDOpmA94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=AczhOjgk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FVktLrN0; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=AczhOjgk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FVktLrN0; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AczhOjgk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FVktLrN0";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AczhOjgk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FVktLrN0"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1DC3C22D94;
	Thu, 28 Aug 2025 13:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756387690; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DkUFeOSqi2HxyqF4glL3cBKv4Ca0xZntvCEJhKpJo70=;
	b=AczhOjgk1Q7AMWHkFt5U2TVPzLBhVebwzUxbBPhE9v4v8yzofRsVihNuYG1jCB2uMbz6SJ
	PNIlibJvkaNc/6oNUbJ3lJan83nmpVwpYBz9iXMYzFKTMkfalvcdkt3L34vH3gHhwlkGkS
	1UnkBjcddBwDlh93z/yXYX4oDBVYg/M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756387690;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DkUFeOSqi2HxyqF4glL3cBKv4Ca0xZntvCEJhKpJo70=;
	b=FVktLrN0daLUfHq/Uv+10yCmSr5FFmF8Ewzn8iAvq6ai2v7xiQcmYzPwole//w6F8sp6PB
	C6uLv4blO/r8fXBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=AczhOjgk;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=FVktLrN0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756387690; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DkUFeOSqi2HxyqF4glL3cBKv4Ca0xZntvCEJhKpJo70=;
	b=AczhOjgk1Q7AMWHkFt5U2TVPzLBhVebwzUxbBPhE9v4v8yzofRsVihNuYG1jCB2uMbz6SJ
	PNIlibJvkaNc/6oNUbJ3lJan83nmpVwpYBz9iXMYzFKTMkfalvcdkt3L34vH3gHhwlkGkS
	1UnkBjcddBwDlh93z/yXYX4oDBVYg/M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756387690;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DkUFeOSqi2HxyqF4glL3cBKv4Ca0xZntvCEJhKpJo70=;
	b=FVktLrN0daLUfHq/Uv+10yCmSr5FFmF8Ewzn8iAvq6ai2v7xiQcmYzPwole//w6F8sp6PB
	C6uLv4blO/r8fXBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EF04E13890;
	Thu, 28 Aug 2025 13:28:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UM40OWlZsGgmDgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 28 Aug 2025 13:28:09 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH v2 05/19] ALSA: firewire: motu: Use guard() for mutex locks
Date: Thu, 28 Aug 2025 15:27:09 +0200
Message-ID: <20250828132802.9032-6-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250828132802.9032-1-tiwai@suse.de>
References: <20250828132802.9032-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 1DC3C22D94
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01

Replace the manual mutex lock/unlock pairs with guard() for code
simplification.

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/firewire/motu/motu-midi.c | 28 +++++-----
 sound/firewire/motu/motu-pcm.c  | 94 +++++++++++++++------------------
 2 files changed, 56 insertions(+), 66 deletions(-)

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
index 7b4d476af348..600c571edf02 100644
--- a/sound/firewire/motu/motu-pcm.c
+++ b/sound/firewire/motu/motu-pcm.c
@@ -138,59 +138,56 @@ static int pcm_open(struct snd_pcm_substream *substream)
 	if (err < 0)
 		return err;
 
-	mutex_lock(&motu->mutex);
-
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
+	scoped_guard(mutex, &motu->mutex) {
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
@@ -215,12 +212,11 @@ static int pcm_hw_params(struct snd_pcm_substream *substream,
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
@@ -230,15 +226,13 @@ static int pcm_hw_free(struct snd_pcm_substream *substream)
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
 
@@ -247,9 +241,9 @@ static int capture_prepare(struct snd_pcm_substream *substream)
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
 
@@ -260,9 +254,9 @@ static int playback_prepare(struct snd_pcm_substream *substream)
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

