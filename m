Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CFC32D77F7
	for <linux-sound@vger.kernel.org>; Wed, 27 Aug 2025 09:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756286434; cv=none; b=s9+fQwvkrHoCDPGrflDsWU1NyyIm4w0gw0jm8oNUHRBgD+f8ieS5ZWw1MM7HzTxrsqTOT+Hbvskj4NpLqwu/i1lK7Ky7QvHGd5Y2UX1a1sPVcbQjYWE8Hkmg3AEuWJiY17UhE6PsN2AhRrsX/LJO2fOe5bPnRRsvZuwYWtolh6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756286434; c=relaxed/simple;
	bh=uv3HJT50Q8O1lu855+6ec3TZlXAYKYtvcHkpMO4bHg0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qW6aBAzat3ZCrowyzWieTHrlX6Qm2rtxCJ2RgyqDb+kCwOqoK6CydNsgPWma5ZEH//t7N/dTErVrtqbIRglk7l3n2jY4+6P3qxhbmVnkqhEejwFDnLL43WCzjN+QKsYe1+6cn0/fo2iMg5wNMWXV8A843+XjioFnd0RzLUlo2Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iAvPjJ7x; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SZIQP2y4; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iAvPjJ7x; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SZIQP2y4; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iAvPjJ7x";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SZIQP2y4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iAvPjJ7x";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SZIQP2y4"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 83CC72222C;
	Wed, 27 Aug 2025 09:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756286424; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iBs+xLQYcoH2K0UCW5HMq9NKmrw4P1SU71lOxBjnYq0=;
	b=iAvPjJ7xoX3JDlc79BXhcxLBvQvs0SjrwKbDZHhj0XZ5/DSVln8yTA0NN4j9ZTmE0TtS1h
	yfL8YiPtk25d09eyu6E23npA0uT9S81gKKLYRC9B5dytac3Lpn8VWGqyyMXjeTbZVjy1dE
	MlTOhRR/s89voHz2/pIxhJTEtv6LSaA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756286424;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iBs+xLQYcoH2K0UCW5HMq9NKmrw4P1SU71lOxBjnYq0=;
	b=SZIQP2y48DYfCEoFG7+6v6p4Zho8B5yq9/cQ5xD2nH+Bxa02DDet2Fm1isCgd+EVOPwE1K
	l/2WSEQ05CepZtBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=iAvPjJ7x;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=SZIQP2y4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756286424; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iBs+xLQYcoH2K0UCW5HMq9NKmrw4P1SU71lOxBjnYq0=;
	b=iAvPjJ7xoX3JDlc79BXhcxLBvQvs0SjrwKbDZHhj0XZ5/DSVln8yTA0NN4j9ZTmE0TtS1h
	yfL8YiPtk25d09eyu6E23npA0uT9S81gKKLYRC9B5dytac3Lpn8VWGqyyMXjeTbZVjy1dE
	MlTOhRR/s89voHz2/pIxhJTEtv6LSaA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756286424;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iBs+xLQYcoH2K0UCW5HMq9NKmrw4P1SU71lOxBjnYq0=;
	b=SZIQP2y48DYfCEoFG7+6v6p4Zho8B5yq9/cQ5xD2nH+Bxa02DDet2Fm1isCgd+EVOPwE1K
	l/2WSEQ05CepZtBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 60F2113A31;
	Wed, 27 Aug 2025 09:20:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aHsoF9jNrmiFEgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 27 Aug 2025 09:20:24 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH 04/19] ALSA: firewire: fireworks: Use guard() for mutex locks
Date: Wed, 27 Aug 2025 11:19:58 +0200
Message-ID: <20250827092017.29014-5-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 83CC72222C
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Replace the manual mutex lock/unlock pairs with guard() for code
simplification.

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/firewire/fireworks/fireworks.c      | 39 ++++++--------
 sound/firewire/fireworks/fireworks_midi.c | 27 +++++-----
 sound/firewire/fireworks/fireworks_pcm.c  | 64 ++++++++++-------------
 3 files changed, 57 insertions(+), 73 deletions(-)

diff --git a/sound/firewire/fireworks/fireworks.c b/sound/firewire/fireworks/fireworks.c
index 69f722244362..3378c7dce88a 100644
--- a/sound/firewire/fireworks/fireworks.c
+++ b/sound/firewire/fireworks/fireworks.c
@@ -188,9 +188,9 @@ efw_card_free(struct snd_card *card)
 {
 	struct snd_efw *efw = card->private_data;
 
-	mutex_lock(&devices_mutex);
-	clear_bit(efw->card_index, devices_used);
-	mutex_unlock(&devices_mutex);
+	scoped_guard(mutex, &devices_mutex) {
+		clear_bit(efw->card_index, devices_used);
+	}
 
 	snd_efw_stream_destroy_duplex(efw);
 	snd_efw_transaction_remove_instance(efw);
@@ -207,25 +207,21 @@ static int efw_probe(struct fw_unit *unit, const struct ieee1394_device_id *entr
 	int err;
 
 	// check registered cards.
-	mutex_lock(&devices_mutex);
-	for (card_index = 0; card_index < SNDRV_CARDS; ++card_index) {
-		if (!test_bit(card_index, devices_used) && enable[card_index])
-			break;
-	}
-	if (card_index >= SNDRV_CARDS) {
-		mutex_unlock(&devices_mutex);
-		return -ENOENT;
-	}
+	scoped_guard(mutex, &devices_mutex) {
+		for (card_index = 0; card_index < SNDRV_CARDS; ++card_index) {
+			if (!test_bit(card_index, devices_used) && enable[card_index])
+				break;
+		}
+		if (card_index >= SNDRV_CARDS)
+			return -ENOENT;
 
-	err = snd_card_new(&unit->device, index[card_index], id[card_index], THIS_MODULE,
-			   sizeof(*efw), &card);
-	if (err < 0) {
-		mutex_unlock(&devices_mutex);
-		return err;
+		err = snd_card_new(&unit->device, index[card_index], id[card_index], THIS_MODULE,
+				   sizeof(*efw), &card);
+		if (err < 0)
+			return err;
+		card->private_free = efw_card_free;
+		set_bit(card_index, devices_used);
 	}
-	card->private_free = efw_card_free;
-	set_bit(card_index, devices_used);
-	mutex_unlock(&devices_mutex);
 
 	efw = card->private_data;
 	efw->unit = fw_unit_get(unit);
@@ -287,9 +283,8 @@ static void efw_update(struct fw_unit *unit)
 
 	snd_efw_transaction_bus_reset(efw->unit);
 
-	mutex_lock(&efw->mutex);
+	guard(mutex)(&efw->mutex);
 	snd_efw_stream_update_duplex(efw);
-	mutex_unlock(&efw->mutex);
 }
 
 static void efw_remove(struct fw_unit *unit)
diff --git a/sound/firewire/fireworks/fireworks_midi.c b/sound/firewire/fireworks/fireworks_midi.c
index 350bf4d299c2..90fe809a26c0 100644
--- a/sound/firewire/fireworks/fireworks_midi.c
+++ b/sound/firewire/fireworks/fireworks_midi.c
@@ -14,20 +14,19 @@ static int midi_open(struct snd_rawmidi_substream *substream)
 
 	err = snd_efw_stream_lock_try(efw);
 	if (err < 0)
-		goto end;
+		return err;
 
-	mutex_lock(&efw->mutex);
-	err = snd_efw_stream_reserve_duplex(efw, 0, 0, 0);
-	if (err >= 0) {
-		++efw->substreams_counter;
-		err = snd_efw_stream_start_duplex(efw);
-		if (err < 0)
-			--efw->substreams_counter;
+	scoped_guard(mutex, &efw->mutex) {
+		err = snd_efw_stream_reserve_duplex(efw, 0, 0, 0);
+		if (err >= 0) {
+			++efw->substreams_counter;
+			err = snd_efw_stream_start_duplex(efw);
+			if (err < 0)
+				--efw->substreams_counter;
+		}
 	}
-	mutex_unlock(&efw->mutex);
 	if (err < 0)
 		snd_efw_stream_lock_release(efw);
-end:
 	return err;
 }
 
@@ -35,10 +34,10 @@ static int midi_close(struct snd_rawmidi_substream *substream)
 {
 	struct snd_efw *efw = substream->rmidi->private_data;
 
-	mutex_lock(&efw->mutex);
-	--efw->substreams_counter;
-	snd_efw_stream_stop_duplex(efw);
-	mutex_unlock(&efw->mutex);
+	scoped_guard(mutex, &efw->mutex) {
+		--efw->substreams_counter;
+		snd_efw_stream_stop_duplex(efw);
+	}
 
 	snd_efw_stream_lock_release(efw);
 	return 0;
diff --git a/sound/firewire/fireworks/fireworks_pcm.c b/sound/firewire/fireworks/fireworks_pcm.c
index eaf7778211de..e7b6425dc5c4 100644
--- a/sound/firewire/fireworks/fireworks_pcm.c
+++ b/sound/firewire/fireworks/fireworks_pcm.c
@@ -189,46 +189,39 @@ static int pcm_open(struct snd_pcm_substream *substream)
 	if (err < 0)
 		goto err_locked;
 
-	mutex_lock(&efw->mutex);
+	scoped_guard(mutex, &efw->mutex) {
 
-	// When source of clock is not internal or any stream is reserved for
-	// transmission of PCM frames, the available sampling rate is limited
-	// at current one.
-	if ((clock_source != SND_EFW_CLOCK_SOURCE_INTERNAL) ||
-	    (efw->substreams_counter > 0 && d->events_per_period > 0)) {
-		unsigned int frames_per_period = d->events_per_period;
-		unsigned int frames_per_buffer = d->events_per_buffer;
-		unsigned int sampling_rate;
+		// When source of clock is not internal or any stream is reserved for
+		// transmission of PCM frames, the available sampling rate is limited
+		// at current one.
+		if ((clock_source != SND_EFW_CLOCK_SOURCE_INTERNAL) ||
+		    (efw->substreams_counter > 0 && d->events_per_period > 0)) {
+			unsigned int frames_per_period = d->events_per_period;
+			unsigned int frames_per_buffer = d->events_per_buffer;
+			unsigned int sampling_rate;
 
-		err = snd_efw_command_get_sampling_rate(efw, &sampling_rate);
-		if (err < 0) {
-			mutex_unlock(&efw->mutex);
-			goto err_locked;
-		}
-		substream->runtime->hw.rate_min = sampling_rate;
-		substream->runtime->hw.rate_max = sampling_rate;
-
-		if (frames_per_period > 0) {
-			err = snd_pcm_hw_constraint_minmax(substream->runtime,
-					SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
-					frames_per_period, frames_per_period);
-			if (err < 0) {
-				mutex_unlock(&efw->mutex);
+			err = snd_efw_command_get_sampling_rate(efw, &sampling_rate);
+			if (err < 0)
 				goto err_locked;
-			}
+			substream->runtime->hw.rate_min = sampling_rate;
+			substream->runtime->hw.rate_max = sampling_rate;
 
-			err = snd_pcm_hw_constraint_minmax(substream->runtime,
-					SNDRV_PCM_HW_PARAM_BUFFER_SIZE,
-					frames_per_buffer, frames_per_buffer);
-			if (err < 0) {
-				mutex_unlock(&efw->mutex);
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
 
-	mutex_unlock(&efw->mutex);
-
 	snd_pcm_set_sync(substream);
 
 	return 0;
@@ -255,12 +248,11 @@ static int pcm_hw_params(struct snd_pcm_substream *substream,
 		unsigned int frames_per_period = params_period_size(hw_params);
 		unsigned int frames_per_buffer = params_buffer_size(hw_params);
 
-		mutex_lock(&efw->mutex);
+		guard(mutex)(&efw->mutex);
 		err = snd_efw_stream_reserve_duplex(efw, rate,
 					frames_per_period, frames_per_buffer);
 		if (err >= 0)
 			++efw->substreams_counter;
-		mutex_unlock(&efw->mutex);
 	}
 
 	return err;
@@ -270,15 +262,13 @@ static int pcm_hw_free(struct snd_pcm_substream *substream)
 {
 	struct snd_efw *efw = substream->private_data;
 
-	mutex_lock(&efw->mutex);
+	guard(mutex)(&efw->mutex);
 
 	if (substream->runtime->state != SNDRV_PCM_STATE_OPEN)
 		--efw->substreams_counter;
 
 	snd_efw_stream_stop_duplex(efw);
 
-	mutex_unlock(&efw->mutex);
-
 	return 0;
 }
 
-- 
2.50.1

