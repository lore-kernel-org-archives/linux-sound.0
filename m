Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0055D310636
	for <linux-sound@vger.kernel.org>; Thu, 28 Aug 2025 13:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756387715; cv=none; b=XyUKeSIWK6CCYgpoMs0uZfA46+wOU4Qx5WvI3eEckeiNnTyMRvTEOWUmt+sI3bEWElQq0m9cpzpdmhkA+nB3yxySaCJVADDF4+kkC5Hws/KsmVGO/ASSZdwz96KfpJdljHKAqnZsxCE+/r8uWrmvtUHiuG29FtoVXyPvEPdnfvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756387715; c=relaxed/simple;
	bh=vLMG9ITWANR+b+JtbZt3daRnvL/A6r6k87AFytgfOFE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OgjDNwwc1JnoaFgY6QpeYHSE23lD5pJfmCcWBTQ/KcTayKS6yUmaqLcjnIO6q3iDUt9C8sAoEe60lhvbqS5EBk2TUSQ9Gu2hWS/4j52x2voJiK68rGDzLPNI1O2PzSSROaqSUrd42Vg9oNVAat1x5ziV5rmsjJNhcIGm8BTQjf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cvXxFJlq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kvKb+kbv; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cvXxFJlq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kvKb+kbv; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cvXxFJlq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kvKb+kbv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cvXxFJlq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kvKb+kbv"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7172320BF0;
	Thu, 28 Aug 2025 13:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756387690; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eyziFsjwZ2Szmuo5S34VTT0cla8MgwF0CVC6KvTEOMs=;
	b=cvXxFJlqPvOhTNXX/mRt6l3Du4sAfQitdIkFAjdVRZVfAuSfVC5L2eQX2hSfy9HbaYrnco
	taMKw0ukGH0Ndf21SvaeaeXUJAlp/dmohagENqHU5X3Fx4EwahpEiSWeFpgpwDaG5x8RX9
	ybCQR2DGOIqthFTbc044zCU0rCAIUoM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756387690;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eyziFsjwZ2Szmuo5S34VTT0cla8MgwF0CVC6KvTEOMs=;
	b=kvKb+kbvolbUiRpHeElMvz+tTyGMViYat2yZECnLwyKkXN1c/VwxT+X2lkoC2OcXY6Fha5
	P48w0jZYVBRLfNBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756387690; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eyziFsjwZ2Szmuo5S34VTT0cla8MgwF0CVC6KvTEOMs=;
	b=cvXxFJlqPvOhTNXX/mRt6l3Du4sAfQitdIkFAjdVRZVfAuSfVC5L2eQX2hSfy9HbaYrnco
	taMKw0ukGH0Ndf21SvaeaeXUJAlp/dmohagENqHU5X3Fx4EwahpEiSWeFpgpwDaG5x8RX9
	ybCQR2DGOIqthFTbc044zCU0rCAIUoM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756387690;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eyziFsjwZ2Szmuo5S34VTT0cla8MgwF0CVC6KvTEOMs=;
	b=kvKb+kbvolbUiRpHeElMvz+tTyGMViYat2yZECnLwyKkXN1c/VwxT+X2lkoC2OcXY6Fha5
	P48w0jZYVBRLfNBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4E38D1368B;
	Thu, 28 Aug 2025 13:28:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6CW4EWpZsGgmDgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 28 Aug 2025 13:28:10 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH v2 07/19] ALSA: firewire: tascam: Use guard() for mutex locks
Date: Thu, 28 Aug 2025 15:27:11 +0200
Message-ID: <20250828132802.9032-8-tiwai@suse.de>
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
 sound/firewire/tascam/tascam-pcm.c | 69 ++++++++++++------------------
 sound/firewire/tascam/tascam.c     |  3 +-
 2 files changed, 28 insertions(+), 44 deletions(-)

diff --git a/sound/firewire/tascam/tascam-pcm.c b/sound/firewire/tascam/tascam-pcm.c
index a73003ac11e6..d885fef0c8ca 100644
--- a/sound/firewire/tascam/tascam-pcm.c
+++ b/sound/firewire/tascam/tascam-pcm.c
@@ -59,43 +59,35 @@ static int pcm_open(struct snd_pcm_substream *substream)
 	if (err < 0)
 		goto err_locked;
 
-	mutex_lock(&tscm->mutex);
+	scoped_guard(mutex, &tscm->mutex) {
+		// When source of clock is not internal or any stream is reserved for
+		// transmission of PCM frames, the available sampling rate is limited
+		// at current one.
+		if (clock != SND_TSCM_CLOCK_INTERNAL || tscm->substreams_counter > 0) {
+			unsigned int frames_per_period = d->events_per_period;
+			unsigned int frames_per_buffer = d->events_per_buffer;
+			unsigned int rate;
 
-	// When source of clock is not internal or any stream is reserved for
-	// transmission of PCM frames, the available sampling rate is limited
-	// at current one.
-	if (clock != SND_TSCM_CLOCK_INTERNAL || tscm->substreams_counter > 0) {
-		unsigned int frames_per_period = d->events_per_period;
-		unsigned int frames_per_buffer = d->events_per_buffer;
-		unsigned int rate;
+			err = snd_tscm_stream_get_rate(tscm, &rate);
+			if (err < 0)
+				goto err_locked;
+			substream->runtime->hw.rate_min = rate;
+			substream->runtime->hw.rate_max = rate;
 
-		err = snd_tscm_stream_get_rate(tscm, &rate);
-		if (err < 0) {
-			mutex_unlock(&tscm->mutex);
-			goto err_locked;
-		}
-		substream->runtime->hw.rate_min = rate;
-		substream->runtime->hw.rate_max = rate;
+			err = snd_pcm_hw_constraint_minmax(substream->runtime,
+							   SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
+							   frames_per_period, frames_per_period);
+			if (err < 0)
+				goto err_locked;
 
-		err = snd_pcm_hw_constraint_minmax(substream->runtime,
-					SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
-					frames_per_period, frames_per_period);
-		if (err < 0) {
-			mutex_unlock(&tscm->mutex);
-			goto err_locked;
-		}
-
-		err = snd_pcm_hw_constraint_minmax(substream->runtime,
-					SNDRV_PCM_HW_PARAM_BUFFER_SIZE,
-					frames_per_buffer, frames_per_buffer);
-		if (err < 0) {
-			mutex_unlock(&tscm->mutex);
-			goto err_locked;
+			err = snd_pcm_hw_constraint_minmax(substream->runtime,
+							   SNDRV_PCM_HW_PARAM_BUFFER_SIZE,
+							   frames_per_buffer, frames_per_buffer);
+			if (err < 0)
+				goto err_locked;
 		}
 	}
 
-	mutex_unlock(&tscm->mutex);
-
 	snd_pcm_set_sync(substream);
 
 	return 0;
@@ -124,12 +116,11 @@ static int pcm_hw_params(struct snd_pcm_substream *substream,
 		unsigned int frames_per_period = params_period_size(hw_params);
 		unsigned int frames_per_buffer = params_buffer_size(hw_params);
 
-		mutex_lock(&tscm->mutex);
+		guard(mutex)(&tscm->mutex);
 		err = snd_tscm_stream_reserve_duplex(tscm, rate,
 					frames_per_period, frames_per_buffer);
 		if (err >= 0)
 			++tscm->substreams_counter;
-		mutex_unlock(&tscm->mutex);
 	}
 
 	return err;
@@ -139,15 +130,13 @@ static int pcm_hw_free(struct snd_pcm_substream *substream)
 {
 	struct snd_tscm *tscm = substream->private_data;
 
-	mutex_lock(&tscm->mutex);
+	guard(mutex)(&tscm->mutex);
 
 	if (substream->runtime->state != SNDRV_PCM_STATE_OPEN)
 		--tscm->substreams_counter;
 
 	snd_tscm_stream_stop_duplex(tscm);
 
-	mutex_unlock(&tscm->mutex);
-
 	return 0;
 }
 
@@ -157,14 +146,12 @@ static int pcm_capture_prepare(struct snd_pcm_substream *substream)
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	int err;
 
-	mutex_lock(&tscm->mutex);
+	guard(mutex)(&tscm->mutex);
 
 	err = snd_tscm_stream_start_duplex(tscm, runtime->rate);
 	if (err >= 0)
 		amdtp_stream_pcm_prepare(&tscm->tx_stream);
 
-	mutex_unlock(&tscm->mutex);
-
 	return err;
 }
 
@@ -174,14 +161,12 @@ static int pcm_playback_prepare(struct snd_pcm_substream *substream)
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	int err;
 
-	mutex_lock(&tscm->mutex);
+	guard(mutex)(&tscm->mutex);
 
 	err = snd_tscm_stream_start_duplex(tscm, runtime->rate);
 	if (err >= 0)
 		amdtp_stream_pcm_prepare(&tscm->rx_stream);
 
-	mutex_unlock(&tscm->mutex);
-
 	return err;
 }
 
diff --git a/sound/firewire/tascam/tascam.c b/sound/firewire/tascam/tascam.c
index 4f68bb4c58bc..f4092df8650c 100644
--- a/sound/firewire/tascam/tascam.c
+++ b/sound/firewire/tascam/tascam.c
@@ -158,9 +158,8 @@ static void snd_tscm_update(struct fw_unit *unit)
 
 	snd_tscm_transaction_reregister(tscm);
 
-	mutex_lock(&tscm->mutex);
+	guard(mutex)(&tscm->mutex);
 	snd_tscm_stream_update_duplex(tscm);
-	mutex_unlock(&tscm->mutex);
 }
 
 static void snd_tscm_remove(struct fw_unit *unit)
-- 
2.50.1

