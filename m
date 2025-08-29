Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE6F2E7F08
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756478707; cv=none; b=BsQGpMcJDUiEVF08tKBZtnAGRVJRyEwEAEMjA0trqG4XtYhUjwPIqe4cA0O0cDWRGO6sW1Z+gnWVfOQGLNHzcZxV1D3TLpU6Xsw6ASJT1YIqJAdKUZsU5yrMw8sxekO1KDp7FZToW30/FtK0YHf5RrS+vqynmbaNO7N+y9I7Y+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756478707; c=relaxed/simple;
	bh=UK3tiI8TRUaeMNuOoGk6sm/48grKE+tBuBLjTKieh4M=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CnP+QclAsWmg5Mr7P67f03CtHSi6hFIkYT8IFzrlxHRE0ulzNlNzHOVqFhxV1Ic5zIi8zv+ukqz3GLD999O8xNd0hMII0fxtnMy7EoHVIXgUChiQI2H963si09+1XDS9XNSbuw+aNZI7V343JXTcccfJQ8Lg5JPJWcAhUWDmEAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NveDitho; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lPvYjhD3; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NveDitho; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lPvYjhD3; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NveDitho";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lPvYjhD3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NveDitho";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lPvYjhD3"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E1DE633ECC;
	Fri, 29 Aug 2025 14:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478639; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QU+oryXl3UkcNcMC9CZnL7b5Q/m+6YfLAKM7dXs5spI=;
	b=NveDithoesSjh1iyn8a13mw7JTsi3FBkDB8GDZ7Chj2eaZ+VIvqx9Qt3abOKnQgSOTiyVL
	85OJVU1ES6TzGPxLmQ+PzOsBPwQVnrOcwjw4LuohQ5VJdjoInEUs1+9PQpd4M7GIKLYVGz
	GAJm78RxdFmjgghcLzyKZkFddcG5lGI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478639;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QU+oryXl3UkcNcMC9CZnL7b5Q/m+6YfLAKM7dXs5spI=;
	b=lPvYjhD3Nq5ZzMO9aLPxfK66lnN4VWaSDv/IEfDKfQlSW/d4l/ai+O8SVZ5z0i78gLHOCX
	zvrC9ivU9T5yzeDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478639; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QU+oryXl3UkcNcMC9CZnL7b5Q/m+6YfLAKM7dXs5spI=;
	b=NveDithoesSjh1iyn8a13mw7JTsi3FBkDB8GDZ7Chj2eaZ+VIvqx9Qt3abOKnQgSOTiyVL
	85OJVU1ES6TzGPxLmQ+PzOsBPwQVnrOcwjw4LuohQ5VJdjoInEUs1+9PQpd4M7GIKLYVGz
	GAJm78RxdFmjgghcLzyKZkFddcG5lGI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478639;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QU+oryXl3UkcNcMC9CZnL7b5Q/m+6YfLAKM7dXs5spI=;
	b=lPvYjhD3Nq5ZzMO9aLPxfK66lnN4VWaSDv/IEfDKfQlSW/d4l/ai+O8SVZ5z0i78gLHOCX
	zvrC9ivU9T5yzeDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C21A813A3E;
	Fri, 29 Aug 2025 14:43:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MKBHLq+8sWi6GAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:43:59 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 25/61] ALSA: echoaudio: Use guard() for spin locks
Date: Fri, 29 Aug 2025 16:43:00 +0200
Message-ID: <20250829144342.4290-26-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829144342.4290-1-tiwai@suse.de>
References: <20250829144342.4290-1-tiwai@suse.de>
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
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

Clean up the code using guard() for spin locks.

Merely code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/echoaudio/echoaudio.c    | 92 ++++++++++++------------------
 sound/pci/echoaudio/echoaudio_3g.c |  6 +-
 sound/pci/echoaudio/gina24_dsp.c   |  3 +-
 sound/pci/echoaudio/layla24_dsp.c  |  6 +-
 sound/pci/echoaudio/midi.c         | 41 ++++++-------
 sound/pci/echoaudio/mona_dsp.c     |  3 +-
 6 files changed, 62 insertions(+), 89 deletions(-)

diff --git a/sound/pci/echoaudio/echoaudio.c b/sound/pci/echoaudio/echoaudio.c
index 4cfe8ad97069..f2c8602a1ad7 100644
--- a/sound/pci/echoaudio/echoaudio.c
+++ b/sound/pci/echoaudio/echoaudio.c
@@ -531,22 +531,21 @@ static int init_engine(struct snd_pcm_substream *substream,
 	/* Sets up che hardware. If it's already initialized, reset and
 	 * redo with the new parameters
 	 */
-	spin_lock_irq(&chip->lock);
-	if (pipe->index >= 0) {
-		dev_dbg(chip->card->dev, "hwp_ie free(%d)\n", pipe->index);
-		err = free_pipes(chip, pipe);
-		snd_BUG_ON(err);
-		chip->substream[pipe->index] = NULL;
-	}
+	scoped_guard(spinlock_irq, &chip->lock) {
+		if (pipe->index >= 0) {
+			dev_dbg(chip->card->dev, "hwp_ie free(%d)\n", pipe->index);
+			err = free_pipes(chip, pipe);
+			snd_BUG_ON(err);
+			chip->substream[pipe->index] = NULL;
+		}
 
-	err = allocate_pipes(chip, pipe, pipe_index, interleave);
-	if (err < 0) {
-		spin_unlock_irq(&chip->lock);
-		dev_err(chip->card->dev, "allocate_pipes(%d) err=%d\n",
-			pipe_index, err);
-		return err;
+		err = allocate_pipes(chip, pipe, pipe_index, interleave);
+		if (err < 0) {
+			dev_err(chip->card->dev, "allocate_pipes(%d) err=%d\n",
+				pipe_index, err);
+			return err;
+		}
 	}
-	spin_unlock_irq(&chip->lock);
 	dev_dbg(chip->card->dev, "allocate_pipes()=%d\n", pipe_index);
 
 	dev_dbg(chip->card->dev,
@@ -594,9 +593,8 @@ static int init_engine(struct snd_pcm_substream *substream,
 	smp_wmb();
 	chip->substream[pipe_index] = substream;
 	chip->rate_set = 1;
-	spin_lock_irq(&chip->lock);
+	guard(spinlock_irq)(&chip->lock);
 	set_sample_rate(chip, hw_params->rate_num / hw_params->rate_den);
-	spin_unlock_irq(&chip->lock);
 	return 0;
 }
 
@@ -658,14 +656,13 @@ static int pcm_hw_free(struct snd_pcm_substream *substream)
 	chip = snd_pcm_substream_chip(substream);
 	pipe = (struct audiopipe *) substream->runtime->private_data;
 
-	spin_lock_irq(&chip->lock);
+	guard(spinlock_irq)(&chip->lock);
 	if (pipe->index >= 0) {
 		dev_dbg(chip->card->dev, "pcm_hw_free(%d)\n", pipe->index);
 		free_pipes(chip, pipe);
 		chip->substream[pipe->index] = NULL;
 		pipe->index = -1;
 	}
-	spin_unlock_irq(&chip->lock);
 
 	return 0;
 }
@@ -715,15 +712,12 @@ static int pcm_prepare(struct snd_pcm_substream *substream)
 	 * exclusive control
 	 */
 
-	spin_lock_irq(&chip->lock);
+	guard(spinlock_irq)(&chip->lock);
 
-	if (snd_BUG_ON(!is_pipe_allocated(chip, pipe_index))) {
-		spin_unlock_irq(&chip->lock);
+	if (snd_BUG_ON(!is_pipe_allocated(chip, pipe_index)))
 		return -EINVAL;
-	}
 
 	set_audio_format(chip, pipe_index, &format);
-	spin_unlock_irq(&chip->lock);
 
 	return 0;
 }
@@ -747,7 +741,7 @@ static int pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 		}
 	}
 
-	spin_lock(&chip->lock);
+	guard(spinlock)(&chip->lock);
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_START:
@@ -795,7 +789,6 @@ static int pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 	default:
 		err = -EINVAL;
 	}
-	spin_unlock(&chip->lock);
 	return err;
 }
 
@@ -1012,7 +1005,7 @@ static int snd_echo_output_gain_put(struct snd_kcontrol *kcontrol,
 
 	changed = 0;
 	chip = snd_kcontrol_chip(kcontrol);
-	spin_lock_irq(&chip->lock);
+	guard(spinlock_irq)(&chip->lock);
 	for (c = 0; c < num_busses_out(chip); c++) {
 		gain = ucontrol->value.integer.value[c];
 		/* Ignore out of range values */
@@ -1025,7 +1018,6 @@ static int snd_echo_output_gain_put(struct snd_kcontrol *kcontrol,
 	}
 	if (changed)
 		update_output_line_level(chip);
-	spin_unlock_irq(&chip->lock);
 	return changed;
 }
 
@@ -1093,7 +1085,7 @@ static int snd_echo_input_gain_put(struct snd_kcontrol *kcontrol,
 
 	changed = 0;
 	chip = snd_kcontrol_chip(kcontrol);
-	spin_lock_irq(&chip->lock);
+	guard(spinlock_irq)(&chip->lock);
 	for (c = 0; c < num_analog_busses_in(chip); c++) {
 		gain = ucontrol->value.integer.value[c];
 		/* Ignore out of range values */
@@ -1106,7 +1098,6 @@ static int snd_echo_input_gain_put(struct snd_kcontrol *kcontrol,
 	}
 	if (changed)
 		update_input_line_level(chip);
-	spin_unlock_irq(&chip->lock);
 	return changed;
 }
 
@@ -1162,7 +1153,7 @@ static int snd_echo_output_nominal_put(struct snd_kcontrol *kcontrol,
 
 	changed = 0;
 	chip = snd_kcontrol_chip(kcontrol);
-	spin_lock_irq(&chip->lock);
+	guard(spinlock_irq)(&chip->lock);
 	for (c = 0; c < num_analog_busses_out(chip); c++) {
 		if (chip->nominal_level[c] != ucontrol->value.integer.value[c]) {
 			set_nominal_level(chip, c,
@@ -1172,7 +1163,6 @@ static int snd_echo_output_nominal_put(struct snd_kcontrol *kcontrol,
 	}
 	if (changed)
 		update_output_line_level(chip);
-	spin_unlock_irq(&chip->lock);
 	return changed;
 }
 
@@ -1225,7 +1215,7 @@ static int snd_echo_input_nominal_put(struct snd_kcontrol *kcontrol,
 
 	changed = 0;
 	chip = snd_kcontrol_chip(kcontrol);
-	spin_lock_irq(&chip->lock);
+	guard(spinlock_irq)(&chip->lock);
 	for (c = 0; c < num_analog_busses_in(chip); c++) {
 		if (chip->nominal_level[bx_analog_in(chip) + c] !=
 		    ucontrol->value.integer.value[c]) {
@@ -1238,7 +1228,6 @@ static int snd_echo_input_nominal_put(struct snd_kcontrol *kcontrol,
 		update_output_line_level(chip);	/* "Output" is not a mistake
 						 * here.
 						 */
-	spin_unlock_irq(&chip->lock);
 	return changed;
 }
 
@@ -1298,10 +1287,9 @@ static int snd_echo_mixer_put(struct snd_kcontrol *kcontrol,
 	if (gain < ECHOGAIN_MINOUT || gain > ECHOGAIN_MAXOUT)
 		return -EINVAL;
 	if (chip->monitor_gain[out][in] != gain) {
-		spin_lock_irq(&chip->lock);
+		guard(spinlock_irq)(&chip->lock);
 		set_monitor_gain(chip, out, in, gain);
 		update_output_line_level(chip);
-		spin_unlock_irq(&chip->lock);
 		changed = 1;
 	}
 	return changed;
@@ -1361,10 +1349,9 @@ static int snd_echo_vmixer_put(struct snd_kcontrol *kcontrol,
 	if (gain < ECHOGAIN_MINOUT || gain > ECHOGAIN_MAXOUT)
 		return -EINVAL;
 	if (chip->vmixer_gain[out][vch] != ucontrol->value.integer.value[0]) {
-		spin_lock_irq(&chip->lock);
+		guard(spinlock_irq)(&chip->lock);
 		set_vmixer_gain(chip, out, vch, ucontrol->value.integer.value[0]);
 		update_vmixer_level(chip);
-		spin_unlock_irq(&chip->lock);
 		changed = 1;
 	}
 	return changed;
@@ -1500,9 +1487,8 @@ static int snd_echo_spdif_mode_put(struct snd_kcontrol *kcontrol,
 	chip = snd_kcontrol_chip(kcontrol);
 	mode = !!ucontrol->value.enumerated.item[0];
 	if (mode != chip->professional_spdif) {
-		spin_lock_irq(&chip->lock);
+		guard(spinlock_irq)(&chip->lock);
 		set_professional_spdif(chip, mode);
-		spin_unlock_irq(&chip->lock);
 		return 1;
 	}
 	return 0;
@@ -1567,11 +1553,10 @@ static int snd_echo_clock_source_put(struct snd_kcontrol *kcontrol,
 	dclock = chip->clock_source_list[eclock];
 	if (chip->input_clock != dclock) {
 		guard(mutex)(&chip->mode_mutex);
-		spin_lock_irq(&chip->lock);
+		guard(spinlock_irq)(&chip->lock);
 		changed = set_input_clock(chip, dclock);
 		if (!changed)
 			changed = 1;	/* no errors */
-		spin_unlock_irq(&chip->lock);
 	}
 
 	if (changed < 0)
@@ -1615,9 +1600,8 @@ static int snd_echo_phantom_power_put(struct snd_kcontrol *kcontrol,
 
 	power = !!ucontrol->value.integer.value[0];
 	if (chip->phantom_power != power) {
-		spin_lock_irq(&chip->lock);
+		guard(spinlock_irq)(&chip->lock);
 		changed = set_phantom_power(chip, power);
-		spin_unlock_irq(&chip->lock);
 		if (changed == 0)
 			changed = 1;	/* no errors */
 	}
@@ -1658,9 +1642,8 @@ static int snd_echo_automute_put(struct snd_kcontrol *kcontrol,
 
 	automute = !!ucontrol->value.integer.value[0];
 	if (chip->digital_in_automute != automute) {
-		spin_lock_irq(&chip->lock);
+		guard(spinlock_irq)(&chip->lock);
 		changed = set_input_auto_mute(chip, automute);
-		spin_unlock_irq(&chip->lock);
 		if (changed == 0)
 			changed = 1;	/* no errors */
 	}
@@ -1688,9 +1671,8 @@ static int snd_echo_vumeters_switch_put(struct snd_kcontrol *kcontrol,
 	struct echoaudio *chip;
 
 	chip = snd_kcontrol_chip(kcontrol);
-	spin_lock_irq(&chip->lock);
+	guard(spinlock_irq)(&chip->lock);
 	set_meters_on(chip, ucontrol->value.integer.value[0]);
-	spin_unlock_irq(&chip->lock);
 	return 1;
 }
 
@@ -2135,17 +2117,13 @@ static int snd_echo_suspend(struct device *dev)
 	if (chip->midi_out)
 		snd_echo_midi_output_trigger(chip->midi_out, 0);
 #endif
-	spin_lock_irq(&chip->lock);
-	if (wait_handshake(chip)) {
-		spin_unlock_irq(&chip->lock);
-		return -EIO;
+	scoped_guard(spinlock_irq, &chip->lock) {
+		if (wait_handshake(chip))
+			return -EIO;
+		clear_handshake(chip);
+		if (send_vector(chip, DSP_VC_GO_COMATOSE) < 0)
+			return -EIO;
 	}
-	clear_handshake(chip);
-	if (send_vector(chip, DSP_VC_GO_COMATOSE) < 0) {
-		spin_unlock_irq(&chip->lock);
-		return -EIO;
-	}
-	spin_unlock_irq(&chip->lock);
 
 	chip->dsp_code = NULL;
 	free_irq(chip->irq, chip);
diff --git a/sound/pci/echoaudio/echoaudio_3g.c b/sound/pci/echoaudio/echoaudio_3g.c
index 18b4d4b4d38d..c9ee98ea3c71 100644
--- a/sound/pci/echoaudio/echoaudio_3g.c
+++ b/sound/pci/echoaudio/echoaudio_3g.c
@@ -119,7 +119,7 @@ static int set_digital_mode(struct echoaudio *chip, u8 mode)
 	 * updated by the DSP comm object. */
 	if (err >= 0 && previous_mode != mode &&
 	    (previous_mode == DIGITAL_MODE_ADAT || mode == DIGITAL_MODE_ADAT)) {
-		spin_lock_irq(&chip->lock);
+		guard(spinlock_irq)(&chip->lock);
 		for (o = 0; o < num_busses_out(chip); o++)
 			for (i = 0; i < num_busses_in(chip); i++)
 				set_monitor_gain(chip, o, i,
@@ -134,7 +134,6 @@ static int set_digital_mode(struct echoaudio *chip, u8 mode)
 		for (o = 0; o < num_busses_out(chip); o++)
 			set_output_gain(chip, o, chip->output_gain[o]);
 		update_output_line_level(chip);
-		spin_unlock_irq(&chip->lock);
 	}
 
 	return err;
@@ -396,7 +395,7 @@ static int dsp_set_digital_mode(struct echoaudio *chip, u8 mode)
 		return -EINVAL;
 	}
 
-	spin_lock_irq(&chip->lock);
+	guard(spinlock_irq)(&chip->lock);
 
 	if (incompatible_clock) {
 		chip->sample_rate = 48000;
@@ -422,7 +421,6 @@ static int dsp_set_digital_mode(struct echoaudio *chip, u8 mode)
 	}
 
 	err = write_control_reg(chip, control_reg, get_frq_reg(chip), 1);
-	spin_unlock_irq(&chip->lock);
 	if (err < 0)
 		return err;
 	chip->digital_mode = mode;
diff --git a/sound/pci/echoaudio/gina24_dsp.c b/sound/pci/echoaudio/gina24_dsp.c
index 56e9d1b9b330..78fbac9f3eac 100644
--- a/sound/pci/echoaudio/gina24_dsp.c
+++ b/sound/pci/echoaudio/gina24_dsp.c
@@ -305,7 +305,7 @@ static int dsp_set_digital_mode(struct echoaudio *chip, u8 mode)
 		return -EINVAL;
 	}
 
-	spin_lock_irq(&chip->lock);
+	guard(spinlock_irq)(&chip->lock);
 
 	if (incompatible_clock) {	/* Switch to 48KHz, internal */
 		chip->sample_rate = 48000;
@@ -336,7 +336,6 @@ static int dsp_set_digital_mode(struct echoaudio *chip, u8 mode)
 	}
 
 	err = write_control_reg(chip, control_reg, true);
-	spin_unlock_irq(&chip->lock);
 	if (err < 0)
 		return err;
 	chip->digital_mode = mode;
diff --git a/sound/pci/echoaudio/layla24_dsp.c b/sound/pci/echoaudio/layla24_dsp.c
index ef27805d63f6..decfccb1e803 100644
--- a/sound/pci/echoaudio/layla24_dsp.c
+++ b/sound/pci/echoaudio/layla24_dsp.c
@@ -358,16 +358,15 @@ static int dsp_set_digital_mode(struct echoaudio *chip, u8 mode)
 
 	if (incompatible_clock) {	/* Switch to 48KHz, internal */
 		chip->sample_rate = 48000;
-		spin_lock_irq(&chip->lock);
+		guard(spinlock_irq)(&chip->lock);
 		set_input_clock(chip, ECHO_CLOCK_INTERNAL);
-		spin_unlock_irq(&chip->lock);
 	}
 
 	/* switch_asic() can sleep */
 	if (switch_asic(chip, asic) < 0)
 		return -EIO;
 
-	spin_lock_irq(&chip->lock);
+	guard(spinlock_irq)(&chip->lock);
 
 	/* Tweak the control register */
 	control_reg = le32_to_cpu(chip->comm_page->control_register);
@@ -387,7 +386,6 @@ static int dsp_set_digital_mode(struct echoaudio *chip, u8 mode)
 	}
 
 	err = write_control_reg(chip, control_reg, true);
-	spin_unlock_irq(&chip->lock);
 	if (err < 0)
 		return err;
 	chip->digital_mode = mode;
diff --git a/sound/pci/echoaudio/midi.c b/sound/pci/echoaudio/midi.c
index 4ee230794b4e..dd5212644844 100644
--- a/sound/pci/echoaudio/midi.c
+++ b/sound/pci/echoaudio/midi.c
@@ -167,9 +167,8 @@ static void snd_echo_midi_input_trigger(struct snd_rawmidi_substream *substream,
 	struct echoaudio *chip = substream->rmidi->private_data;
 
 	if (up != chip->midi_input_enabled) {
-		spin_lock_irq(&chip->lock);
+		guard(spinlock_irq)(&chip->lock);
 		enable_midi_input(chip, up);
-		spin_unlock_irq(&chip->lock);
 		chip->midi_input_enabled = up;
 	}
 }
@@ -201,14 +200,13 @@ static int snd_echo_midi_output_open(struct snd_rawmidi_substream *substream)
 static void snd_echo_midi_output_write(struct timer_list *t)
 {
 	struct echoaudio *chip = timer_container_of(chip, t, timer);
-	unsigned long flags;
 	int bytes, sent, time;
 	unsigned char buf[MIDI_OUT_BUFFER_SIZE - 1];
 
 	/* No interrupts are involved: we have to check at regular intervals
 	if the card's output buffer has room for new data. */
 	sent = 0;
-	spin_lock_irqsave(&chip->lock, flags);
+	guard(spinlock_irqsave)(&chip->lock);
 	chip->midi_full = 0;
 	if (!snd_rawmidi_transmit_empty(chip->midi_out)) {
 		bytes = snd_rawmidi_transmit_peek(chip->midi_out, buf,
@@ -242,7 +240,6 @@ static void snd_echo_midi_output_write(struct timer_list *t)
 		dev_dbg(chip->card->dev,
 			"Timer armed(%d)\n", ((time * HZ + 999) / 1000));
 	}
-	spin_unlock_irqrestore(&chip->lock, flags);
 }
 
 
@@ -251,25 +248,29 @@ static void snd_echo_midi_output_trigger(struct snd_rawmidi_substream *substream
 					 int up)
 {
 	struct echoaudio *chip = substream->rmidi->private_data;
+	bool remove_timer = false;
 
 	dev_dbg(chip->card->dev, "snd_echo_midi_output_trigger(%d)\n", up);
-	spin_lock_irq(&chip->lock);
-	if (up) {
-		if (!chip->tinuse) {
-			timer_setup(&chip->timer, snd_echo_midi_output_write,
-				    0);
-			chip->tinuse = 1;
-		}
-	} else {
-		if (chip->tinuse) {
-			chip->tinuse = 0;
-			spin_unlock_irq(&chip->lock);
-			timer_delete_sync(&chip->timer);
-			dev_dbg(chip->card->dev, "Timer removed\n");
-			return;
+	scoped_guard(spinlock_irq, &chip->lock) {
+		if (up) {
+			if (!chip->tinuse) {
+				timer_setup(&chip->timer, snd_echo_midi_output_write,
+					    0);
+				chip->tinuse = 1;
+			}
+		} else {
+			if (chip->tinuse) {
+				chip->tinuse = 0;
+				remove_timer = true;
+			}
 		}
 	}
-	spin_unlock_irq(&chip->lock);
+
+	if (remove_timer) {
+		timer_delete_sync(&chip->timer);
+		dev_dbg(chip->card->dev, "Timer removed\n");
+		return;
+	}
 
 	if (up && !chip->midi_full)
 		snd_echo_midi_output_write(&chip->timer);
diff --git a/sound/pci/echoaudio/mona_dsp.c b/sound/pci/echoaudio/mona_dsp.c
index f8e7bb6ce040..9bb6a174745c 100644
--- a/sound/pci/echoaudio/mona_dsp.c
+++ b/sound/pci/echoaudio/mona_dsp.c
@@ -381,7 +381,7 @@ static int dsp_set_digital_mode(struct echoaudio *chip, u8 mode)
 		return -EINVAL;
 	}
 
-	spin_lock_irq(&chip->lock);
+	guard(spinlock_irq)(&chip->lock);
 
 	if (incompatible_clock) {	/* Switch to 48KHz, internal */
 		chip->sample_rate = 48000;
@@ -413,7 +413,6 @@ static int dsp_set_digital_mode(struct echoaudio *chip, u8 mode)
 	}
 
 	err = write_control_reg(chip, control_reg, false);
-	spin_unlock_irq(&chip->lock);
 	if (err < 0)
 		return err;
 	chip->digital_mode = mode;
-- 
2.50.1

