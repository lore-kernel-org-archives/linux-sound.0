Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6C7311976
	for <linux-sound@vger.kernel.org>; Thu, 28 Aug 2025 13:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756387709; cv=none; b=TVVtb7gFzE6hndY3bciAcvAlffpM4TBz65qoOhzPM6UDRJTqg5LNboDCytmSLOhPDGkkEv0T+Iu4q+afmuA+ur78RgyLq9JGbe6pM4A52fZ63TltJdDnyPA4MEcaYI8RA7+8jOIMWHbUXuMqOpT0jBA/35fNqW+WaYRCHftfyAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756387709; c=relaxed/simple;
	bh=DxtmdHLdGGt1XetJ4DAIFJvSDmFy9YdtMYhmsvRkhkk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SsBKNQiP8Csz1+K7cmsvP+rstQDy/1v/+YFlqqdrYcnst7yTwPq6Nd7SOp/4+7DL0bypRkbImDvhl5kGqxFc5IhafzZfO9lhSOWmI0bd/NfKH9MBQJT4qTa2pBKjF6Z9dLnqWXwF+h4LjWErJ8G+voxeP9ir2bPJcrkGoDT5mCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NMGX9sYB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gTcKBRGy; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NMGX9sYB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gTcKBRGy; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NMGX9sYB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gTcKBRGy";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NMGX9sYB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gTcKBRGy"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 47A6820BE8;
	Thu, 28 Aug 2025 13:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756387690; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lOCdg/mn5qsGVSK/ycI+L+BRcykLBXufFJCCH7rpZDo=;
	b=NMGX9sYBrDPeFGSml+CmtJBMAZWt9tZ8uFJZn0S88SlS0rcJL6BSbUym7BSosxl2gTKXso
	lbsK08wpz2DuukZBvRULvoMPj0rpLkC6V0azRekpepB9/eP9Oz2Vedqjc9YGsyS43dfo2m
	V5mzYxTmWeaf0kV9il0DYfHDVZgOyrk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756387690;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lOCdg/mn5qsGVSK/ycI+L+BRcykLBXufFJCCH7rpZDo=;
	b=gTcKBRGyJQkuSQPYysAC77a5gE8CDztdzCohQdkx3VBTeF3gNrwgu+fl0AYSUwhx8EB7rg
	2UHCt0oMXRhpSbBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756387690; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lOCdg/mn5qsGVSK/ycI+L+BRcykLBXufFJCCH7rpZDo=;
	b=NMGX9sYBrDPeFGSml+CmtJBMAZWt9tZ8uFJZn0S88SlS0rcJL6BSbUym7BSosxl2gTKXso
	lbsK08wpz2DuukZBvRULvoMPj0rpLkC6V0azRekpepB9/eP9Oz2Vedqjc9YGsyS43dfo2m
	V5mzYxTmWeaf0kV9il0DYfHDVZgOyrk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756387690;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lOCdg/mn5qsGVSK/ycI+L+BRcykLBXufFJCCH7rpZDo=;
	b=gTcKBRGyJQkuSQPYysAC77a5gE8CDztdzCohQdkx3VBTeF3gNrwgu+fl0AYSUwhx8EB7rg
	2UHCt0oMXRhpSbBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 23A8B13326;
	Thu, 28 Aug 2025 13:28:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4OqHB2pZsGgmDgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 28 Aug 2025 13:28:10 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH v2 06/19] ALSA: firewire: oxfw: Use guard() for mutex locks
Date: Thu, 28 Aug 2025 15:27:10 +0200
Message-ID: <20250828132802.9032-7-tiwai@suse.de>
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
 sound/firewire/oxfw/oxfw-midi.c | 52 ++++++++-----------
 sound/firewire/oxfw/oxfw-pcm.c  | 90 ++++++++++++++-------------------
 sound/firewire/oxfw/oxfw.c      |  3 +-
 3 files changed, 60 insertions(+), 85 deletions(-)

diff --git a/sound/firewire/oxfw/oxfw-midi.c b/sound/firewire/oxfw/oxfw-midi.c
index c215fa6f7a03..7f757f02a877 100644
--- a/sound/firewire/oxfw/oxfw-midi.c
+++ b/sound/firewire/oxfw/oxfw-midi.c
@@ -16,18 +16,16 @@ static int midi_capture_open(struct snd_rawmidi_substream *substream)
 	if (err < 0)
 		return err;
 
-	mutex_lock(&oxfw->mutex);
-
-	err = snd_oxfw_stream_reserve_duplex(oxfw, &oxfw->tx_stream, 0, 0, 0, 0);
-	if (err >= 0) {
-		++oxfw->substreams_count;
-		err = snd_oxfw_stream_start_duplex(oxfw);
-		if (err < 0)
-			--oxfw->substreams_count;
+	scoped_guard(mutex, &oxfw->mutex) {
+		err = snd_oxfw_stream_reserve_duplex(oxfw, &oxfw->tx_stream, 0, 0, 0, 0);
+		if (err >= 0) {
+			++oxfw->substreams_count;
+			err = snd_oxfw_stream_start_duplex(oxfw);
+			if (err < 0)
+				--oxfw->substreams_count;
+		}
 	}
 
-	mutex_unlock(&oxfw->mutex);
-
 	if (err < 0)
 		snd_oxfw_stream_lock_release(oxfw);
 
@@ -43,16 +41,14 @@ static int midi_playback_open(struct snd_rawmidi_substream *substream)
 	if (err < 0)
 		return err;
 
-	mutex_lock(&oxfw->mutex);
-
-	err = snd_oxfw_stream_reserve_duplex(oxfw, &oxfw->rx_stream, 0, 0, 0, 0);
-	if (err >= 0) {
-		++oxfw->substreams_count;
-		err = snd_oxfw_stream_start_duplex(oxfw);
+	scoped_guard(mutex, &oxfw->mutex) {
+		err = snd_oxfw_stream_reserve_duplex(oxfw, &oxfw->rx_stream, 0, 0, 0, 0);
+		if (err >= 0) {
+			++oxfw->substreams_count;
+			err = snd_oxfw_stream_start_duplex(oxfw);
+		}
 	}
 
-	mutex_unlock(&oxfw->mutex);
-
 	if (err < 0)
 		snd_oxfw_stream_lock_release(oxfw);
 
@@ -63,12 +59,10 @@ static int midi_capture_close(struct snd_rawmidi_substream *substream)
 {
 	struct snd_oxfw *oxfw = substream->rmidi->private_data;
 
-	mutex_lock(&oxfw->mutex);
-
-	--oxfw->substreams_count;
-	snd_oxfw_stream_stop_duplex(oxfw);
-
-	mutex_unlock(&oxfw->mutex);
+	scoped_guard(mutex, &oxfw->mutex) {
+		--oxfw->substreams_count;
+		snd_oxfw_stream_stop_duplex(oxfw);
+	}
 
 	snd_oxfw_stream_lock_release(oxfw);
 	return 0;
@@ -78,12 +72,10 @@ static int midi_playback_close(struct snd_rawmidi_substream *substream)
 {
 	struct snd_oxfw *oxfw = substream->rmidi->private_data;
 
-	mutex_lock(&oxfw->mutex);
-
-	--oxfw->substreams_count;
-	snd_oxfw_stream_stop_duplex(oxfw);
-
-	mutex_unlock(&oxfw->mutex);
+	scoped_guard(mutex, &oxfw->mutex) {
+		--oxfw->substreams_count;
+		snd_oxfw_stream_stop_duplex(oxfw);
+	}
 
 	snd_oxfw_stream_lock_release(oxfw);
 	return 0;
diff --git a/sound/firewire/oxfw/oxfw-pcm.c b/sound/firewire/oxfw/oxfw-pcm.c
index e13dc817fc28..774b8a763795 100644
--- a/sound/firewire/oxfw/oxfw-pcm.c
+++ b/sound/firewire/oxfw/oxfw-pcm.c
@@ -181,42 +181,34 @@ static int pcm_open(struct snd_pcm_substream *substream)
 	if (err < 0)
 		goto err_locked;
 
-	mutex_lock(&oxfw->mutex);
+	scoped_guard(mutex, &oxfw->mutex) {
+		// When source of clock is not internal or any stream is reserved for
+		// transmission of PCM frames, the available sampling rate is limited
+		// at current one.
+		if (oxfw->substreams_count > 0 && d->events_per_period > 0) {
+			unsigned int frames_per_period = d->events_per_period;
+			unsigned int frames_per_buffer = d->events_per_buffer;
 
-	// When source of clock is not internal or any stream is reserved for
-	// transmission of PCM frames, the available sampling rate is limited
-	// at current one.
-	if (oxfw->substreams_count > 0 && d->events_per_period > 0) {
-		unsigned int frames_per_period = d->events_per_period;
-		unsigned int frames_per_buffer = d->events_per_buffer;
-
-		err = limit_to_current_params(substream);
-		if (err < 0) {
-			mutex_unlock(&oxfw->mutex);
-			goto err_locked;
-		}
-
-		if (frames_per_period > 0) {
-			err = snd_pcm_hw_constraint_minmax(substream->runtime,
-					SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
-					frames_per_period, frames_per_period);
-			if (err < 0) {
-				mutex_unlock(&oxfw->mutex);
+			err = limit_to_current_params(substream);
+			if (err < 0)
 				goto err_locked;
-			}
 
-			err = snd_pcm_hw_constraint_minmax(substream->runtime,
-					SNDRV_PCM_HW_PARAM_BUFFER_SIZE,
-					frames_per_buffer, frames_per_buffer);
-			if (err < 0) {
-				mutex_unlock(&oxfw->mutex);
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
 
-	mutex_unlock(&oxfw->mutex);
-
 	snd_pcm_set_sync(substream);
 
 	return 0;
@@ -245,13 +237,12 @@ static int pcm_capture_hw_params(struct snd_pcm_substream *substream,
 		unsigned int frames_per_period = params_period_size(hw_params);
 		unsigned int frames_per_buffer = params_buffer_size(hw_params);
 
-		mutex_lock(&oxfw->mutex);
+		guard(mutex)(&oxfw->mutex);
 		err = snd_oxfw_stream_reserve_duplex(oxfw, &oxfw->tx_stream,
 					rate, channels, frames_per_period,
 					frames_per_buffer);
 		if (err >= 0)
 			++oxfw->substreams_count;
-		mutex_unlock(&oxfw->mutex);
 	}
 
 	return err;
@@ -268,13 +259,12 @@ static int pcm_playback_hw_params(struct snd_pcm_substream *substream,
 		unsigned int frames_per_period = params_period_size(hw_params);
 		unsigned int frames_per_buffer = params_buffer_size(hw_params);
 
-		mutex_lock(&oxfw->mutex);
+		guard(mutex)(&oxfw->mutex);
 		err = snd_oxfw_stream_reserve_duplex(oxfw, &oxfw->rx_stream,
 					rate, channels, frames_per_period,
 					frames_per_buffer);
 		if (err >= 0)
 			++oxfw->substreams_count;
-		mutex_unlock(&oxfw->mutex);
 	}
 
 	return err;
@@ -284,30 +274,26 @@ static int pcm_capture_hw_free(struct snd_pcm_substream *substream)
 {
 	struct snd_oxfw *oxfw = substream->private_data;
 
-	mutex_lock(&oxfw->mutex);
+	guard(mutex)(&oxfw->mutex);
 
 	if (substream->runtime->state != SNDRV_PCM_STATE_OPEN)
 		--oxfw->substreams_count;
 
 	snd_oxfw_stream_stop_duplex(oxfw);
 
-	mutex_unlock(&oxfw->mutex);
-
 	return 0;
 }
 static int pcm_playback_hw_free(struct snd_pcm_substream *substream)
 {
 	struct snd_oxfw *oxfw = substream->private_data;
 
-	mutex_lock(&oxfw->mutex);
+	guard(mutex)(&oxfw->mutex);
 
 	if (substream->runtime->state != SNDRV_PCM_STATE_OPEN)
 		--oxfw->substreams_count;
 
 	snd_oxfw_stream_stop_duplex(oxfw);
 
-	mutex_unlock(&oxfw->mutex);
-
 	return 0;
 }
 
@@ -316,30 +302,28 @@ static int pcm_capture_prepare(struct snd_pcm_substream *substream)
 	struct snd_oxfw *oxfw = substream->private_data;
 	int err;
 
-	mutex_lock(&oxfw->mutex);
-	err = snd_oxfw_stream_start_duplex(oxfw);
-	mutex_unlock(&oxfw->mutex);
-	if (err < 0)
-		goto end;
+	scoped_guard(mutex, &oxfw->mutex) {
+		err = snd_oxfw_stream_start_duplex(oxfw);
+		if (err < 0)
+			return err;
+	}
 
 	amdtp_stream_pcm_prepare(&oxfw->tx_stream);
-end:
-	return err;
+	return 0;
 }
 static int pcm_playback_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_oxfw *oxfw = substream->private_data;
 	int err;
 
-	mutex_lock(&oxfw->mutex);
-	err = snd_oxfw_stream_start_duplex(oxfw);
-	mutex_unlock(&oxfw->mutex);
-	if (err < 0)
-		goto end;
+	scoped_guard(mutex, &oxfw->mutex) {
+		err = snd_oxfw_stream_start_duplex(oxfw);
+		if (err < 0)
+			return err;
+	}
 
 	amdtp_stream_pcm_prepare(&oxfw->rx_stream);
-end:
-	return err;
+	return 0;
 }
 
 static int pcm_capture_trigger(struct snd_pcm_substream *substream, int cmd)
diff --git a/sound/firewire/oxfw/oxfw.c b/sound/firewire/oxfw/oxfw.c
index 7a985f3cb8f6..5039bd79b18e 100644
--- a/sound/firewire/oxfw/oxfw.c
+++ b/sound/firewire/oxfw/oxfw.c
@@ -283,9 +283,8 @@ static void oxfw_bus_reset(struct fw_unit *unit)
 	fcp_bus_reset(oxfw->unit);
 
 	if (oxfw->has_output || oxfw->has_input) {
-		mutex_lock(&oxfw->mutex);
+		guard(mutex)(&oxfw->mutex);
 		snd_oxfw_stream_update_duplex(oxfw);
-		mutex_unlock(&oxfw->mutex);
 	}
 
 	if (oxfw->quirks & SND_OXFW_QUIRK_SCS_TRANSACTION)
-- 
2.50.1

