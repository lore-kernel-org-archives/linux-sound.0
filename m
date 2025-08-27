Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7702BFC70
	for <linux-sound@vger.kernel.org>; Wed, 27 Aug 2025 09:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756286441; cv=none; b=fecUyB52ZXMqTcizwhTKQu5ssF/kzaP7Ihu81xLNjZQXm4Mh8G+TTr1ioA49IJNtq2JrwpOio41Uby6eZIWMAep+GEW+DXklGu0Nz1b/YtmzKUU1OFrertblyDpBo7IAGBeeemxZ90VFp8vpJ2MkGJHYEySjeiiVNLBueJqLthc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756286441; c=relaxed/simple;
	bh=kGH4EhUnbtDrEHvbKMy+s3O+UfIkV5GYMc/FzaoTZ6s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YLu/BXYNQ6k0BG1odbNxS6IUdlTyOoyfuX7izkKTr6Kjo+refGrl5KJ7eZMtJpeTxy8XoGejqdy03tED/M33IAxxGVc1Y3H5uFSkTZ1R0MeOGNKg+OwmcsWwiQw+TCQh1FZ7xBOs/IxM8maGSLg049kaF9gpC458a64n+jq/7yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oiH8A06e; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OITeKOOz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oiH8A06e; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OITeKOOz; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oiH8A06e";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OITeKOOz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oiH8A06e";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OITeKOOz"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4BAF91FFC1;
	Wed, 27 Aug 2025 09:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756286424; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+wLoK75oqbXmrrChHatFwZ9lZouWdx3SkGl5YRB0ICI=;
	b=oiH8A06eQSbjO7bZLJu/FQ+cL27pwHEZz19FJ73Ze9jKDPtPFUBMTZsocDen8OXuUbkTfq
	2bok+US4TUZ4iOrmOBUxIavreE2cy55OdljVcfbiZVd7lvsRilAV52Sow4qpi6fv+qFbHf
	zuAjqiewn9Y+fOGn+qrus8EuMn6qCO8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756286424;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+wLoK75oqbXmrrChHatFwZ9lZouWdx3SkGl5YRB0ICI=;
	b=OITeKOOz339avtnxNCGkHorY/M/hwY2jgb0PhBe+Ply1uCUVSxhGqtcFO5W+R41DYLqhKJ
	UV/8icaUym08XBDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756286424; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+wLoK75oqbXmrrChHatFwZ9lZouWdx3SkGl5YRB0ICI=;
	b=oiH8A06eQSbjO7bZLJu/FQ+cL27pwHEZz19FJ73Ze9jKDPtPFUBMTZsocDen8OXuUbkTfq
	2bok+US4TUZ4iOrmOBUxIavreE2cy55OdljVcfbiZVd7lvsRilAV52Sow4qpi6fv+qFbHf
	zuAjqiewn9Y+fOGn+qrus8EuMn6qCO8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756286424;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+wLoK75oqbXmrrChHatFwZ9lZouWdx3SkGl5YRB0ICI=;
	b=OITeKOOz339avtnxNCGkHorY/M/hwY2jgb0PhBe+Ply1uCUVSxhGqtcFO5W+R41DYLqhKJ
	UV/8icaUym08XBDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3A38013A6A;
	Wed, 27 Aug 2025 09:20:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +G2MDdjNrmiFEgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 27 Aug 2025 09:20:24 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH 02/19] ALSA: firewire: dice: Use guard() for mutex locks
Date: Wed, 27 Aug 2025 11:19:56 +0200
Message-ID: <20250827092017.29014-3-tiwai@suse.de>
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
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -2.80

Replace the manual mutex lock/unlock pairs with guard() for code
simplification.

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/firewire/dice/dice-midi.c | 28 +++++-----
 sound/firewire/dice/dice-pcm.c  | 90 +++++++++++++++------------------
 sound/firewire/dice/dice.c      |  3 +-
 3 files changed, 53 insertions(+), 68 deletions(-)

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
index cfc19bd0d5dd..7411581dd663 100644
--- a/sound/firewire/dice/dice-pcm.c
+++ b/sound/firewire/dice/dice-pcm.c
@@ -196,53 +196,46 @@ static int pcm_open(struct snd_pcm_substream *substream)
 		break;
 	}
 
-	mutex_lock(&dice->mutex);
+	scoped_guard(mutex, &dice->mutex) {
 
-	// When source of clock is not internal or any stream is reserved for
-	// transmission of PCM frames, the available sampling rate is limited
-	// at current one.
-	if (!internal ||
-	    (dice->substreams_counter > 0 && d->events_per_period > 0)) {
-		unsigned int frames_per_period = d->events_per_period;
-		unsigned int frames_per_buffer = d->events_per_buffer;
-		unsigned int rate;
+		// When source of clock is not internal or any stream is reserved for
+		// transmission of PCM frames, the available sampling rate is limited
+		// at current one.
+		if (!internal ||
+		    (dice->substreams_counter > 0 && d->events_per_period > 0)) {
+			unsigned int frames_per_period = d->events_per_period;
+			unsigned int frames_per_buffer = d->events_per_buffer;
+			unsigned int rate;
 
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
@@ -271,7 +264,7 @@ static int pcm_hw_params(struct snd_pcm_substream *substream,
 		unsigned int events_per_period = params_period_size(hw_params);
 		unsigned int events_per_buffer = params_buffer_size(hw_params);
 
-		mutex_lock(&dice->mutex);
+		guard(mutex)(&dice->mutex);
 		// For double_pcm_frame quirk.
 		if (rate > 96000 && !dice->disable_double_pcm_frames) {
 			events_per_period /= 2;
@@ -281,7 +274,6 @@ static int pcm_hw_params(struct snd_pcm_substream *substream,
 					events_per_period, events_per_buffer);
 		if (err >= 0)
 			++dice->substreams_counter;
-		mutex_unlock(&dice->mutex);
 	}
 
 	return err;
@@ -291,15 +283,13 @@ static int pcm_hw_free(struct snd_pcm_substream *substream)
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
 
@@ -309,9 +299,9 @@ static int capture_prepare(struct snd_pcm_substream *substream)
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
 
@@ -323,9 +313,9 @@ static int playback_prepare(struct snd_pcm_substream *substream)
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

