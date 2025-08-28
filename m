Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E8A310636
	for <linux-sound@vger.kernel.org>; Thu, 28 Aug 2025 13:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756387699; cv=none; b=YZQgLi2kA91U9S3AfmvLW65Ki/DLBf4bzpDhhTPaM8uXnCG3T5w3NO5K61ZzQFeIcu2pFBMt33CSvu7ENA+CXzgX+YMD/7UA1DeDIj1A3mBqyQIbHTELaxcaScfxxzBSqTRiUzcv/1SbulujNTrLcA5M2HIpDC8cjC75IntNOuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756387699; c=relaxed/simple;
	bh=3boVSxwRcC3ACf9C+zxlfjysT0DcShxfZSfLf76DvK8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G5/ZQpqKyvvPBAinxciWD7Me9qSk+SA0PsvoMg301Kr1AQE9hEIQibN0bkKKtggncVXrMRMdEOZg3L/wsA4R0Zkv1hAmh13G+MvfsT9fh2jJIhl3BNSDoF6c8o2lqunBdb+fmqvQ370E5GiL0T24kkcsCE1w/E6nq2dQoaqLHlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BnF/2M9Z; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=46HK22+4; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BnF/2M9Z; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=46HK22+4; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BnF/2M9Z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="46HK22+4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BnF/2M9Z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="46HK22+4"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BF27D22DB3;
	Thu, 28 Aug 2025 13:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756387689; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pA/udTxzwyyFraV3l0XVuIo+V8kODoD+SjPToL+/Qbg=;
	b=BnF/2M9Zlfhdyw75M0A1axsmNy7rae7e8JKn0EHMcn5nJ0AQ1WnWYUmPQiEPmHTQmkwva1
	WkqUBT2Jt4kDvRtdfD/yuyCbfDgGgeWLlpVjmt6Cjz+OXkm7+fg2XNpdb4/B0KcX2nJtib
	flXMvGm9PhIuM292pJckkOy0jIwJ6WM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756387689;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pA/udTxzwyyFraV3l0XVuIo+V8kODoD+SjPToL+/Qbg=;
	b=46HK22+4dAib8dRIqCyKdWAt3Gk/Czqv9bG6NKNwhVI8O+z1/Bf4RGkAXP1GqCyMaVwppZ
	rDha2SZXpF6UgdBQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="BnF/2M9Z";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=46HK22+4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756387689; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pA/udTxzwyyFraV3l0XVuIo+V8kODoD+SjPToL+/Qbg=;
	b=BnF/2M9Zlfhdyw75M0A1axsmNy7rae7e8JKn0EHMcn5nJ0AQ1WnWYUmPQiEPmHTQmkwva1
	WkqUBT2Jt4kDvRtdfD/yuyCbfDgGgeWLlpVjmt6Cjz+OXkm7+fg2XNpdb4/B0KcX2nJtib
	flXMvGm9PhIuM292pJckkOy0jIwJ6WM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756387689;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pA/udTxzwyyFraV3l0XVuIo+V8kODoD+SjPToL+/Qbg=;
	b=46HK22+4dAib8dRIqCyKdWAt3Gk/Czqv9bG6NKNwhVI8O+z1/Bf4RGkAXP1GqCyMaVwppZ
	rDha2SZXpF6UgdBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9B5781368B;
	Thu, 28 Aug 2025 13:28:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YO+zJGlZsGgmDgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 28 Aug 2025 13:28:09 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH v2 03/19] ALSA: firewire: digi00x: Use guard() for mutex locks
Date: Thu, 28 Aug 2025 15:27:07 +0200
Message-ID: <20250828132802.9032-4-tiwai@suse.de>
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
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: BF27D22DB3
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Replace the manual mutex lock/unlock pairs with guard() for code
simplification.

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/firewire/digi00x/digi00x-midi.c | 24 ++++-----
 sound/firewire/digi00x/digi00x-pcm.c  | 73 +++++++++++----------------
 sound/firewire/digi00x/digi00x.c      |  3 +-
 3 files changed, 42 insertions(+), 58 deletions(-)

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
index 85e65cbc00c4..75f81545d50c 100644
--- a/sound/firewire/digi00x/digi00x-pcm.c
+++ b/sound/firewire/digi00x/digi00x-pcm.c
@@ -127,46 +127,38 @@ static int pcm_open(struct snd_pcm_substream *substream)
 		}
 	}
 
-	mutex_lock(&dg00x->mutex);
+	scoped_guard(mutex, &dg00x->mutex) {
+		// When source of clock is not internal or any stream is reserved for
+		// transmission of PCM frames, the available sampling rate is limited
+		// at current one.
+		if ((clock != SND_DG00X_CLOCK_INTERNAL) ||
+		    (dg00x->substreams_counter > 0 && d->events_per_period > 0)) {
+			unsigned int frames_per_period = d->events_per_period;
+			unsigned int frames_per_buffer = d->events_per_buffer;
+			unsigned int rate;
 
-	// When source of clock is not internal or any stream is reserved for
-	// transmission of PCM frames, the available sampling rate is limited
-	// at current one.
-	if ((clock != SND_DG00X_CLOCK_INTERNAL) ||
-	    (dg00x->substreams_counter > 0 && d->events_per_period > 0)) {
-		unsigned int frames_per_period = d->events_per_period;
-		unsigned int frames_per_buffer = d->events_per_buffer;
-		unsigned int rate;
-
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
@@ -195,12 +187,11 @@ static int pcm_hw_params(struct snd_pcm_substream *substream,
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
@@ -210,15 +201,13 @@ static int pcm_hw_free(struct snd_pcm_substream *substream)
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
 
@@ -227,14 +216,12 @@ static int pcm_capture_prepare(struct snd_pcm_substream *substream)
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
 
@@ -243,7 +230,7 @@ static int pcm_playback_prepare(struct snd_pcm_substream *substream)
 	struct snd_dg00x *dg00x = substream->private_data;
 	int err;
 
-	mutex_lock(&dg00x->mutex);
+	guard(mutex)(&dg00x->mutex);
 
 	err = snd_dg00x_stream_start_duplex(dg00x);
 	if (err >= 0) {
@@ -251,8 +238,6 @@ static int pcm_playback_prepare(struct snd_pcm_substream *substream)
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

