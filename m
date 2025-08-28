Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F507311955
	for <linux-sound@vger.kernel.org>; Thu, 28 Aug 2025 13:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756387693; cv=none; b=hx+HbgAsRxRCp93t2fGg1Tl3DqQ9zpuc/CADipubs3Ib09mQdyedDy0uURxzZ4r8wvk+7VcpQhnxe1sTZweqy6pmyuKhAbeGlT5zyVW65YlLZJNryQjHOWYQRNl4RpGf0oe6Tuulpuk4xH6es3Ov6qoJD7IFu3bHheDzDH1i9Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756387693; c=relaxed/simple;
	bh=NDnKK6uW+nroSCbfJCEEPKWHtSFoYLR9+7OY2ZM1Nck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m3E3Hz1pU5S8gYSIkuXXQnVcWyiFAL3IvTUU0S0pU7jJCnh7cx30Zjz4WoSSvPCSru+03X2xk2j/122Hq+uki3KHvafU9owtToM8ej5LR8Drao/dxUrO/FhWdGMS/HYwPxs2z5MokOdtv4srY1iXSa8nVuaW6fosvMJx5KD1sMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FIIWlzcB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sNUfKolz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FIIWlzcB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sNUfKolz; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FIIWlzcB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sNUfKolz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FIIWlzcB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sNUfKolz"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 94E7922D98;
	Thu, 28 Aug 2025 13:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756387689; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qRH2HT5Uc+iipPamRchwKZv9gWBqKg72yiOQe4aEErU=;
	b=FIIWlzcB2BbNDgo2m4hU6zFRrXdCqDLXIxWgrhvXwU52TVhng4UuAzSjqxVS7XGpzGL0iB
	0KfxzvOwvayDRTe2Y6D2W0e5645Q6eSqjFQFEjIAzO3/Be2b1dKhNMO9WJQpd/cx79pEyb
	p2lS9/dSVLsH7rBZquuh0Y+1i657+wY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756387689;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qRH2HT5Uc+iipPamRchwKZv9gWBqKg72yiOQe4aEErU=;
	b=sNUfKolzJobpMen1xvOif1VkqgegFIlV1nQNFovE8kSL6AeKQhjXUyY2Fk40Xgp8JHvHcX
	m+NO0YLezIAzeqAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756387689; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qRH2HT5Uc+iipPamRchwKZv9gWBqKg72yiOQe4aEErU=;
	b=FIIWlzcB2BbNDgo2m4hU6zFRrXdCqDLXIxWgrhvXwU52TVhng4UuAzSjqxVS7XGpzGL0iB
	0KfxzvOwvayDRTe2Y6D2W0e5645Q6eSqjFQFEjIAzO3/Be2b1dKhNMO9WJQpd/cx79pEyb
	p2lS9/dSVLsH7rBZquuh0Y+1i657+wY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756387689;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qRH2HT5Uc+iipPamRchwKZv9gWBqKg72yiOQe4aEErU=;
	b=sNUfKolzJobpMen1xvOif1VkqgegFIlV1nQNFovE8kSL6AeKQhjXUyY2Fk40Xgp8JHvHcX
	m+NO0YLezIAzeqAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 719E713326;
	Thu, 28 Aug 2025 13:28:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MPyGGmlZsGgmDgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 28 Aug 2025 13:28:09 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH v2 02/19] ALSA: firewire: dice: Use guard() for mutex locks
Date: Thu, 28 Aug 2025 15:27:06 +0200
Message-ID: <20250828132802.9032-3-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

Replace the manual mutex lock/unlock pairs with guard() for code
simplification.

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/firewire/dice/dice-midi.c | 28 +++++-----
 sound/firewire/dice/dice-pcm.c  | 91 +++++++++++++++------------------
 sound/firewire/dice/dice.c      |  3 +-
 3 files changed, 53 insertions(+), 69 deletions(-)

diff --git a/sound/firewire/dice/dice-midi.c b/sound/firewire/dice/dice-midi.c
index 78988e44b8bc..9ca975c556ca 100644
--- a/sound/firewire/dice/dice-midi.c
+++ b/sound/firewire/dice/dice-midi.c
@@ -15,18 +15,16 @@ static int midi_open(struct snd_rawmidi_substream *substream)
 	if (err < 0)
 		return err;
 
-	mutex_lock(&dice->mutex);
-
-	err = snd_dice_stream_reserve_duplex(dice, 0, 0, 0);
-	if (err >= 0) {
-		++dice->substreams_counter;
-		err = snd_dice_stream_start_duplex(dice);
-		if (err < 0)
-			--dice->substreams_counter;
+	scoped_guard(mutex, &dice->mutex) {
+		err = snd_dice_stream_reserve_duplex(dice, 0, 0, 0);
+		if (err >= 0) {
+			++dice->substreams_counter;
+			err = snd_dice_stream_start_duplex(dice);
+			if (err < 0)
+				--dice->substreams_counter;
+		}
 	}
 
-	mutex_unlock(&dice->mutex);
-
 	if (err < 0)
 		snd_dice_stream_lock_release(dice);
 
@@ -37,12 +35,10 @@ static int midi_close(struct snd_rawmidi_substream *substream)
 {
 	struct snd_dice *dice = substream->rmidi->private_data;
 
-	mutex_lock(&dice->mutex);
-
-	--dice->substreams_counter;
-	snd_dice_stream_stop_duplex(dice);
-
-	mutex_unlock(&dice->mutex);
+	scoped_guard(mutex, &dice->mutex) {
+		--dice->substreams_counter;
+		snd_dice_stream_stop_duplex(dice);
+	}
 
 	snd_dice_stream_lock_release(dice);
 	return 0;
diff --git a/sound/firewire/dice/dice-pcm.c b/sound/firewire/dice/dice-pcm.c
index cfc19bd0d5dd..d5319cd2cc6f 100644
--- a/sound/firewire/dice/dice-pcm.c
+++ b/sound/firewire/dice/dice-pcm.c
@@ -196,53 +196,45 @@ static int pcm_open(struct snd_pcm_substream *substream)
 		break;
 	}
 
-	mutex_lock(&dice->mutex);
+	scoped_guard(mutex, &dice->mutex) {
+		// When source of clock is not internal or any stream is reserved for
+		// transmission of PCM frames, the available sampling rate is limited
+		// at current one.
+		if (!internal ||
+		    (dice->substreams_counter > 0 && d->events_per_period > 0)) {
+			unsigned int frames_per_period = d->events_per_period;
+			unsigned int frames_per_buffer = d->events_per_buffer;
+			unsigned int rate;
 
-	// When source of clock is not internal or any stream is reserved for
-	// transmission of PCM frames, the available sampling rate is limited
-	// at current one.
-	if (!internal ||
-	    (dice->substreams_counter > 0 && d->events_per_period > 0)) {
-		unsigned int frames_per_period = d->events_per_period;
-		unsigned int frames_per_buffer = d->events_per_buffer;
-		unsigned int rate;
-
-		err = snd_dice_transaction_get_rate(dice, &rate);
-		if (err < 0) {
-			mutex_unlock(&dice->mutex);
-			goto err_locked;
-		}
-
-		substream->runtime->hw.rate_min = rate;
-		substream->runtime->hw.rate_max = rate;
-
-		if (frames_per_period > 0) {
-			// For double_pcm_frame quirk.
-			if (rate > 96000 && !dice->disable_double_pcm_frames) {
-				frames_per_period *= 2;
-				frames_per_buffer *= 2;
-			}
-
-			err = snd_pcm_hw_constraint_minmax(substream->runtime,
-					SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
-					frames_per_period, frames_per_period);
-			if (err < 0) {
-				mutex_unlock(&dice->mutex);
+			err = snd_dice_transaction_get_rate(dice, &rate);
+			if (err < 0)
 				goto err_locked;
-			}
 
-			err = snd_pcm_hw_constraint_minmax(substream->runtime,
-					SNDRV_PCM_HW_PARAM_BUFFER_SIZE,
-					frames_per_buffer, frames_per_buffer);
-			if (err < 0) {
-				mutex_unlock(&dice->mutex);
-				goto err_locked;
+			substream->runtime->hw.rate_min = rate;
+			substream->runtime->hw.rate_max = rate;
+
+			if (frames_per_period > 0) {
+				// For double_pcm_frame quirk.
+				if (rate > 96000 && !dice->disable_double_pcm_frames) {
+					frames_per_period *= 2;
+					frames_per_buffer *= 2;
+				}
+
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
 
-	mutex_unlock(&dice->mutex);
-
 	snd_pcm_set_sync(substream);
 
 	return 0;
@@ -271,7 +263,7 @@ static int pcm_hw_params(struct snd_pcm_substream *substream,
 		unsigned int events_per_period = params_period_size(hw_params);
 		unsigned int events_per_buffer = params_buffer_size(hw_params);
 
-		mutex_lock(&dice->mutex);
+		guard(mutex)(&dice->mutex);
 		// For double_pcm_frame quirk.
 		if (rate > 96000 && !dice->disable_double_pcm_frames) {
 			events_per_period /= 2;
@@ -281,7 +273,6 @@ static int pcm_hw_params(struct snd_pcm_substream *substream,
 					events_per_period, events_per_buffer);
 		if (err >= 0)
 			++dice->substreams_counter;
-		mutex_unlock(&dice->mutex);
 	}
 
 	return err;
@@ -291,15 +282,13 @@ static int pcm_hw_free(struct snd_pcm_substream *substream)
 {
 	struct snd_dice *dice = substream->private_data;
 
-	mutex_lock(&dice->mutex);
+	guard(mutex)(&dice->mutex);
 
 	if (substream->runtime->state != SNDRV_PCM_STATE_OPEN)
 		--dice->substreams_counter;
 
 	snd_dice_stream_stop_duplex(dice);
 
-	mutex_unlock(&dice->mutex);
-
 	return 0;
 }
 
@@ -309,9 +298,9 @@ static int capture_prepare(struct snd_pcm_substream *substream)
 	struct amdtp_stream *stream = &dice->tx_stream[substream->pcm->device];
 	int err;
 
-	mutex_lock(&dice->mutex);
-	err = snd_dice_stream_start_duplex(dice);
-	mutex_unlock(&dice->mutex);
+	scoped_guard(mutex, &dice->mutex) {
+		err = snd_dice_stream_start_duplex(dice);
+	}
 	if (err >= 0)
 		amdtp_stream_pcm_prepare(stream);
 
@@ -323,9 +312,9 @@ static int playback_prepare(struct snd_pcm_substream *substream)
 	struct amdtp_stream *stream = &dice->rx_stream[substream->pcm->device];
 	int err;
 
-	mutex_lock(&dice->mutex);
-	err = snd_dice_stream_start_duplex(dice);
-	mutex_unlock(&dice->mutex);
+	scoped_guard(mutex, &dice->mutex) {
+		err = snd_dice_stream_start_duplex(dice);
+	}
 	if (err >= 0)
 		amdtp_stream_pcm_prepare(stream);
 
diff --git a/sound/firewire/dice/dice.c b/sound/firewire/dice/dice.c
index 9675ec14271d..bcbe80344328 100644
--- a/sound/firewire/dice/dice.c
+++ b/sound/firewire/dice/dice.c
@@ -238,9 +238,8 @@ static void dice_bus_reset(struct fw_unit *unit)
 	/* The handler address register becomes initialized. */
 	snd_dice_transaction_reinit(dice);
 
-	mutex_lock(&dice->mutex);
+	guard(mutex)(&dice->mutex);
 	snd_dice_stream_update_duplex(dice);
-	mutex_unlock(&dice->mutex);
 }
 
 #define DICE_INTERFACE	0x000001
-- 
2.50.1

