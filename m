Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E90E2848A9
	for <linux-sound@vger.kernel.org>; Wed, 27 Aug 2025 09:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756286427; cv=none; b=NR0j5I5D27y7hnZmzD+q4MWx9cPeWIwgh/nhjBbn9KNoYi2iQzk1BjdRM4W9Q5JTbQJhdKjusDuGV9Eig94636HsFlL6ZKHavO8mtX7IourZPk+MX5q+/naZuYWn1KPMYTaTRL1932OlU7qXnQUwj09qmClojZzyUBNRT1DkSzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756286427; c=relaxed/simple;
	bh=uQeJYITgSI+EIiOnTzLTHQVTMUaGV//SLaT3tLwsGlc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qQ+jjSkM/+emOCmINAnq2Hj+VabXmaGslWueA0lSwUvNA1bNB/ULcCaJ1QUBGWKYPOuh+YK1R1WgcCu12DBbIbkjOLqpnpBBnSipafVBMwjNzJcpkX1K9FLBpKWXIOjA74kK8HPw9L5XNBfJUgBVftHC3Q/IHxO/9xAuY1ZzTu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=guZWOum/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oKN/htRs; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=guZWOum/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oKN/htRs; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="guZWOum/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oKN/htRs";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="guZWOum/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oKN/htRs"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 69B2C2222B;
	Wed, 27 Aug 2025 09:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756286424; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SShlitOkHLi6pDaFVbpJWBEoszp4G/CGpZbFds2Clgk=;
	b=guZWOum/F4pzh0iSxHoMcTe+iTuNo+EAjcRG9kNYoSdfDXOLfuDJ8xbQ0wNhpTE1VvZz6W
	65DYwwdYVj6xDk/wIrRFWKaReWeKL7z+ljkn7kZiih1y9agT/cWyyE6dFulH7dcW2rb4rE
	zAJ/U634fYT26mp3VyLzjuS7Y1mLAOI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756286424;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SShlitOkHLi6pDaFVbpJWBEoszp4G/CGpZbFds2Clgk=;
	b=oKN/htRssY083wrKY3O9BM/9XS1/bGcZDEX0oAZMrwsp9PsMuKAZeaNZfhw0zBN6Kqd6je
	OJBjnE6sstco+5AA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756286424; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SShlitOkHLi6pDaFVbpJWBEoszp4G/CGpZbFds2Clgk=;
	b=guZWOum/F4pzh0iSxHoMcTe+iTuNo+EAjcRG9kNYoSdfDXOLfuDJ8xbQ0wNhpTE1VvZz6W
	65DYwwdYVj6xDk/wIrRFWKaReWeKL7z+ljkn7kZiih1y9agT/cWyyE6dFulH7dcW2rb4rE
	zAJ/U634fYT26mp3VyLzjuS7Y1mLAOI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756286424;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SShlitOkHLi6pDaFVbpJWBEoszp4G/CGpZbFds2Clgk=;
	b=oKN/htRssY083wrKY3O9BM/9XS1/bGcZDEX0oAZMrwsp9PsMuKAZeaNZfhw0zBN6Kqd6je
	OJBjnE6sstco+5AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4B11713867;
	Wed, 27 Aug 2025 09:20:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eNHWEdjNrmiFEgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 27 Aug 2025 09:20:24 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH 03/19] ALSA: firewire: Use guard() for mutex locks
Date: Wed, 27 Aug 2025 11:19:57 +0200
Message-ID: <20250827092017.29014-4-tiwai@suse.de>
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
 sound/firewire/digi00x/digi00x-midi.c | 24 ++++-----
 sound/firewire/digi00x/digi00x-pcm.c  | 72 +++++++++++----------------
 sound/firewire/digi00x/digi00x.c      |  3 +-
 3 files changed, 42 insertions(+), 57 deletions(-)

diff --git a/sound/firewire/digi00x/digi00x-midi.c b/sound/firewire/digi00x/digi00x-midi.c
index 8f4bace16050..0f6ca58cc4a0 100644
--- a/sound/firewire/digi00x/digi00x-midi.c
+++ b/sound/firewire/digi00x/digi00x-midi.c
@@ -16,15 +16,15 @@ static int midi_open(struct snd_rawmidi_substream *substream)
 	if (err < 0)
 		return err;
 
-	mutex_lock(&dg00x->mutex);
-	err = snd_dg00x_stream_reserve_duplex(dg00x, 0, 0, 0);
-	if (err >= 0) {
-		++dg00x->substreams_counter;
-		err = snd_dg00x_stream_start_duplex(dg00x);
-		if (err < 0)
-			--dg00x->substreams_counter;
+	scoped_guard(mutex, &dg00x->mutex) {
+		err = snd_dg00x_stream_reserve_duplex(dg00x, 0, 0, 0);
+		if (err >= 0) {
+			++dg00x->substreams_counter;
+			err = snd_dg00x_stream_start_duplex(dg00x);
+			if (err < 0)
+				--dg00x->substreams_counter;
+		}
 	}
-	mutex_unlock(&dg00x->mutex);
 	if (err < 0)
 		snd_dg00x_stream_lock_release(dg00x);
 
@@ -35,10 +35,10 @@ static int midi_close(struct snd_rawmidi_substream *substream)
 {
 	struct snd_dg00x *dg00x = substream->rmidi->private_data;
 
-	mutex_lock(&dg00x->mutex);
-	--dg00x->substreams_counter;
-	snd_dg00x_stream_stop_duplex(dg00x);
-	mutex_unlock(&dg00x->mutex);
+	scoped_guard(mutex, &dg00x->mutex) {
+		--dg00x->substreams_counter;
+		snd_dg00x_stream_stop_duplex(dg00x);
+	}
 
 	snd_dg00x_stream_lock_release(dg00x);
 	return 0;
diff --git a/sound/firewire/digi00x/digi00x-pcm.c b/sound/firewire/digi00x/digi00x-pcm.c
index 85e65cbc00c4..ee650f039a75 100644
--- a/sound/firewire/digi00x/digi00x-pcm.c
+++ b/sound/firewire/digi00x/digi00x-pcm.c
@@ -127,46 +127,39 @@ static int pcm_open(struct snd_pcm_substream *substream)
 		}
 	}
 
-	mutex_lock(&dg00x->mutex);
+	scoped_guard(mutex, &dg00x->mutex) {
 
-	// When source of clock is not internal or any stream is reserved for
-	// transmission of PCM frames, the available sampling rate is limited
-	// at current one.
-	if ((clock != SND_DG00X_CLOCK_INTERNAL) ||
-	    (dg00x->substreams_counter > 0 && d->events_per_period > 0)) {
-		unsigned int frames_per_period = d->events_per_period;
-		unsigned int frames_per_buffer = d->events_per_buffer;
-		unsigned int rate;
+		// When source of clock is not internal or any stream is reserved for
+		// transmission of PCM frames, the available sampling rate is limited
+		// at current one.
+		if ((clock != SND_DG00X_CLOCK_INTERNAL) ||
+		    (dg00x->substreams_counter > 0 && d->events_per_period > 0)) {
+			unsigned int frames_per_period = d->events_per_period;
+			unsigned int frames_per_buffer = d->events_per_buffer;
+			unsigned int rate;
 
-		err = snd_dg00x_stream_get_external_rate(dg00x, &rate);
-		if (err < 0) {
-			mutex_unlock(&dg00x->mutex);
-			goto err_locked;
-		}
-		substream->runtime->hw.rate_min = rate;
-		substream->runtime->hw.rate_max = rate;
-
-		if (frames_per_period > 0) {
-			err = snd_pcm_hw_constraint_minmax(substream->runtime,
-					SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
-					frames_per_period, frames_per_period);
-			if (err < 0) {
-				mutex_unlock(&dg00x->mutex);
+			err = snd_dg00x_stream_get_external_rate(dg00x, &rate);
+			if (err < 0)
 				goto err_locked;
-			}
+			substream->runtime->hw.rate_min = rate;
+			substream->runtime->hw.rate_max = rate;
 
-			err = snd_pcm_hw_constraint_minmax(substream->runtime,
-					SNDRV_PCM_HW_PARAM_BUFFER_SIZE,
-					frames_per_buffer, frames_per_buffer);
-			if (err < 0) {
-				mutex_unlock(&dg00x->mutex);
-				goto err_locked;
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
 			}
 		}
 	}
 
-	mutex_unlock(&dg00x->mutex);
-
 	snd_pcm_set_sync(substream);
 
 	return 0;
@@ -195,12 +188,11 @@ static int pcm_hw_params(struct snd_pcm_substream *substream,
 		unsigned int frames_per_period = params_period_size(hw_params);
 		unsigned int frames_per_buffer = params_buffer_size(hw_params);
 
-		mutex_lock(&dg00x->mutex);
+		guard(mutex)(&dg00x->mutex);
 		err = snd_dg00x_stream_reserve_duplex(dg00x, rate,
 					frames_per_period, frames_per_buffer);
 		if (err >= 0)
 			++dg00x->substreams_counter;
-		mutex_unlock(&dg00x->mutex);
 	}
 
 	return err;
@@ -210,15 +202,13 @@ static int pcm_hw_free(struct snd_pcm_substream *substream)
 {
 	struct snd_dg00x *dg00x = substream->private_data;
 
-	mutex_lock(&dg00x->mutex);
+	guard(mutex)(&dg00x->mutex);
 
 	if (substream->runtime->state != SNDRV_PCM_STATE_OPEN)
 		--dg00x->substreams_counter;
 
 	snd_dg00x_stream_stop_duplex(dg00x);
 
-	mutex_unlock(&dg00x->mutex);
-
 	return 0;
 }
 
@@ -227,14 +217,12 @@ static int pcm_capture_prepare(struct snd_pcm_substream *substream)
 	struct snd_dg00x *dg00x = substream->private_data;
 	int err;
 
-	mutex_lock(&dg00x->mutex);
+	guard(mutex)(&dg00x->mutex);
 
 	err = snd_dg00x_stream_start_duplex(dg00x);
 	if (err >= 0)
 		amdtp_stream_pcm_prepare(&dg00x->tx_stream);
 
-	mutex_unlock(&dg00x->mutex);
-
 	return err;
 }
 
@@ -243,7 +231,7 @@ static int pcm_playback_prepare(struct snd_pcm_substream *substream)
 	struct snd_dg00x *dg00x = substream->private_data;
 	int err;
 
-	mutex_lock(&dg00x->mutex);
+	guard(mutex)(&dg00x->mutex);
 
 	err = snd_dg00x_stream_start_duplex(dg00x);
 	if (err >= 0) {
@@ -251,8 +239,6 @@ static int pcm_playback_prepare(struct snd_pcm_substream *substream)
 		amdtp_dot_reset(&dg00x->rx_stream);
 	}
 
-	mutex_unlock(&dg00x->mutex);
-
 	return err;
 }
 
diff --git a/sound/firewire/digi00x/digi00x.c b/sound/firewire/digi00x/digi00x.c
index cebc35dcf8cd..f73a9fc8adb1 100644
--- a/sound/firewire/digi00x/digi00x.c
+++ b/sound/firewire/digi00x/digi00x.c
@@ -116,9 +116,8 @@ static void snd_dg00x_update(struct fw_unit *unit)
 
 	snd_dg00x_transaction_reregister(dg00x);
 
-	mutex_lock(&dg00x->mutex);
+	guard(mutex)(&dg00x->mutex);
 	snd_dg00x_stream_update_duplex(dg00x);
-	mutex_unlock(&dg00x->mutex);
 }
 
 static void snd_dg00x_remove(struct fw_unit *unit)
-- 
2.50.1

