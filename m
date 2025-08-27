Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949972848A9
	for <linux-sound@vger.kernel.org>; Wed, 27 Aug 2025 09:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756286434; cv=none; b=Usnp5zeV32iRybklzSDwdS877iCuqBGn6DL4fmWHvJ9HnCzrN97wDcQIojOWOPnxBEACjhUz5/5ucxeMTN9U0IH5IKW5FE+Q4BIYXhlHYBaQy2RajLLSUz6ez4zMBh54KQsCocBZwdIV5tYrxbAYFDxH0RlADmobiaR2SM4hegw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756286434; c=relaxed/simple;
	bh=975pumzMXsXs8aAPNQ/Y0fhT9LEeTytesmCScx5/j7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WhIQErnvTZcLuvvYlj0tU9q4X0DwMsQSLsKIZWMrlm01yyD/dpiB9n0u/CaQxuND9QlMjNRZZGrVm770x//WOQd5t16uFq+8dthtcru+08RRnzxGz6I1dKLVz0n825+0wq0VRKYkeqtkcowRQvtTbxsBOlU1LfqXu7Qd89muXNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WCbCEPmd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qHAmGkEf; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WCbCEPmd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qHAmGkEf; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WCbCEPmd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qHAmGkEf";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WCbCEPmd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qHAmGkEf"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3CE361FFC0;
	Wed, 27 Aug 2025 09:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756286424; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7yFsJ9HFmjskZ0b/LOWCYdQpoBMnSPj+GJnxvdLuc7c=;
	b=WCbCEPmdvAXRgeRKztuOgcsGqoJ1hu488yXQuvP5c8FtlVS5hdDCGxRS1AWGCrAdu7uxYz
	dxzbYz6w5zsvdXIa4WJVJXWorW9C/Fx8yzn8c9AFXvS4+wRiDNaIe9Bt0MLnC5YNaBV6/c
	8uDJoOPFEQAgtwPfrpBvMBhPrjWzAUY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756286424;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7yFsJ9HFmjskZ0b/LOWCYdQpoBMnSPj+GJnxvdLuc7c=;
	b=qHAmGkEfUlXc7Ru3BCFXUyicYY+YnjPOKjTO6IKJh+3IcHMsnWJAiGM19lnm8ymzSvs5c+
	lr6gYnFFo9WdhAAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756286424; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7yFsJ9HFmjskZ0b/LOWCYdQpoBMnSPj+GJnxvdLuc7c=;
	b=WCbCEPmdvAXRgeRKztuOgcsGqoJ1hu488yXQuvP5c8FtlVS5hdDCGxRS1AWGCrAdu7uxYz
	dxzbYz6w5zsvdXIa4WJVJXWorW9C/Fx8yzn8c9AFXvS4+wRiDNaIe9Bt0MLnC5YNaBV6/c
	8uDJoOPFEQAgtwPfrpBvMBhPrjWzAUY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756286424;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7yFsJ9HFmjskZ0b/LOWCYdQpoBMnSPj+GJnxvdLuc7c=;
	b=qHAmGkEfUlXc7Ru3BCFXUyicYY+YnjPOKjTO6IKJh+3IcHMsnWJAiGM19lnm8ymzSvs5c+
	lr6gYnFFo9WdhAAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 27CD413A31;
	Wed, 27 Aug 2025 09:20:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8K84CdjNrmiFEgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 27 Aug 2025 09:20:24 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH 01/19] ALSA: firewire: bebob: Use guard() for mutex locks
Date: Wed, 27 Aug 2025 11:19:55 +0200
Message-ID: <20250827092017.29014-2-tiwai@suse.de>
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
 sound/firewire/bebob/bebob.c        | 36 +++++++---------
 sound/firewire/bebob/bebob_maudio.c | 42 +++++++-----------
 sound/firewire/bebob/bebob_midi.c   | 24 +++++------
 sound/firewire/bebob/bebob_pcm.c    | 67 +++++++++++++----------------
 4 files changed, 72 insertions(+), 97 deletions(-)

diff --git a/sound/firewire/bebob/bebob.c b/sound/firewire/bebob/bebob.c
index 4ebaeff16455..01e2c4cc03d4 100644
--- a/sound/firewire/bebob/bebob.c
+++ b/sound/firewire/bebob/bebob.c
@@ -122,9 +122,9 @@ bebob_card_free(struct snd_card *card)
 {
 	struct snd_bebob *bebob = card->private_data;
 
-	mutex_lock(&devices_mutex);
-	clear_bit(bebob->card_index, devices_used);
-	mutex_unlock(&devices_mutex);
+	scoped_guard(mutex, &devices_mutex) {
+		clear_bit(bebob->card_index, devices_used);
+	}
 
 	snd_bebob_stream_destroy_duplex(bebob);
 
@@ -207,25 +207,21 @@ static int bebob_probe(struct fw_unit *unit, const struct ieee1394_device_id *en
 			return -ENODEV;
 	}
 
-	mutex_lock(&devices_mutex);
-	for (card_index = 0; card_index < SNDRV_CARDS; card_index++) {
-		if (!test_bit(card_index, devices_used) && enable[card_index])
-			break;
-	}
-	if (card_index >= SNDRV_CARDS) {
-		mutex_unlock(&devices_mutex);
-		return -ENOENT;
-	}
+	scoped_guard(mutex, &devices_mutex) {
+		for (card_index = 0; card_index < SNDRV_CARDS; card_index++) {
+			if (!test_bit(card_index, devices_used) && enable[card_index])
+				break;
+		}
+		if (card_index >= SNDRV_CARDS)
+			return -ENOENT;
 
-	err = snd_card_new(&unit->device, index[card_index], id[card_index], THIS_MODULE,
-			   sizeof(*bebob), &card);
-	if (err < 0) {
-		mutex_unlock(&devices_mutex);
-		return err;
+		err = snd_card_new(&unit->device, index[card_index], id[card_index], THIS_MODULE,
+				   sizeof(*bebob), &card);
+		if (err < 0)
+			return err;
+		card->private_free = bebob_card_free;
+		set_bit(card_index, devices_used);
 	}
-	card->private_free = bebob_card_free;
-	set_bit(card_index, devices_used);
-	mutex_unlock(&devices_mutex);
 
 	bebob = card->private_data;
 	bebob->unit = fw_unit_get(unit);
diff --git a/sound/firewire/bebob/bebob_maudio.c b/sound/firewire/bebob/bebob_maudio.c
index 177699e1be11..376a9a175479 100644
--- a/sound/firewire/bebob/bebob_maudio.c
+++ b/sound/firewire/bebob/bebob_maudio.c
@@ -265,7 +265,7 @@ snd_bebob_maudio_special_discover(struct snd_bebob *bebob, bool is1814)
 	if (!params)
 		return -ENOMEM;
 
-	mutex_lock(&bebob->mutex);
+	guard(mutex)(&bebob->mutex);
 
 	bebob->maudio_special_quirk = (void *)params;
 	params->is1814 = is1814;
@@ -277,12 +277,12 @@ snd_bebob_maudio_special_discover(struct snd_bebob *bebob, bool is1814)
 	if (err < 0) {
 		dev_err(&bebob->unit->device,
 			"fail to initialize clock params: %d\n", err);
-		goto end;
+		return err;
 	}
 
 	err = add_special_controls(bebob);
 	if (err < 0)
-		goto end;
+		return err;
 
 	special_stream_formation_set(bebob);
 
@@ -293,8 +293,6 @@ snd_bebob_maudio_special_discover(struct snd_bebob *bebob, bool is1814)
 		bebob->midi_input_ports = 2;
 		bebob->midi_output_ports = 2;
 	}
-end:
-	mutex_unlock(&bebob->mutex);
 	return err;
 }
 
@@ -383,14 +381,12 @@ static int special_clk_ctl_put(struct snd_kcontrol *kctl,
 	if (id >= ARRAY_SIZE(special_clk_types))
 		return -EINVAL;
 
-	mutex_lock(&bebob->mutex);
+	guard(mutex)(&bebob->mutex);
 
 	err = avc_maudio_set_special_clk(bebob, id,
 					 params->dig_in_fmt,
 					 params->dig_out_fmt,
 					 params->clk_lock);
-	mutex_unlock(&bebob->mutex);
-
 	if (err >= 0)
 		err = 1;
 
@@ -456,14 +452,14 @@ static int special_dig_in_iface_ctl_get(struct snd_kcontrol *kctl,
 	unsigned int dig_in_iface;
 	int err, val;
 
-	mutex_lock(&bebob->mutex);
+	guard(mutex)(&bebob->mutex);
 
 	err = avc_audio_get_selector(bebob->unit, 0x00, 0x04,
 				     &dig_in_iface);
 	if (err < 0) {
 		dev_err(&bebob->unit->device,
 			"fail to get digital input interface: %d\n", err);
-		goto end;
+		return err;
 	}
 
 	/* encoded id for user value */
@@ -474,9 +470,7 @@ static int special_dig_in_iface_ctl_get(struct snd_kcontrol *kctl,
 		val = 2;
 
 	uval->value.enumerated.item[0] = val;
-end:
-	mutex_unlock(&bebob->mutex);
-	return err;
+	return 0;
 }
 static int special_dig_in_iface_ctl_set(struct snd_kcontrol *kctl,
 					struct snd_ctl_elem_value *uval)
@@ -494,7 +488,7 @@ static int special_dig_in_iface_ctl_set(struct snd_kcontrol *kctl,
 	dig_in_fmt = (id >> 1) & 0x01;
 	dig_in_iface = id & 0x01;
 
-	mutex_lock(&bebob->mutex);
+	guard(mutex)(&bebob->mutex);
 
 	err = avc_maudio_set_special_clk(bebob,
 					 params->clk_src,
@@ -502,24 +496,19 @@ static int special_dig_in_iface_ctl_set(struct snd_kcontrol *kctl,
 					 params->dig_out_fmt,
 					 params->clk_lock);
 	if (err < 0)
-		goto end;
+		return err;
 
 	/* For ADAT, optical interface is only available. */
-	if (params->dig_in_fmt > 0) {
-		err = 1;
-		goto end;
-	}
+	if (params->dig_in_fmt > 0)
+		return 1;
 
 	/* For S/PDIF, optical/coaxial interfaces are selectable. */
 	err = avc_audio_set_selector(bebob->unit, 0x00, 0x04, dig_in_iface);
 	if (err < 0)
 		dev_err(&bebob->unit->device,
 			"fail to set digital input interface: %d\n", err);
-	err = 1;
-end:
 	special_stream_formation_set(bebob);
-	mutex_unlock(&bebob->mutex);
-	return err;
+	return 1;
 }
 static const struct snd_kcontrol_new special_dig_in_iface_ctl = {
 	.name	= "Digital Input Interface",
@@ -546,9 +535,9 @@ static int special_dig_out_iface_ctl_get(struct snd_kcontrol *kctl,
 {
 	struct snd_bebob *bebob = snd_kcontrol_chip(kctl);
 	struct special_params *params = bebob->maudio_special_quirk;
-	mutex_lock(&bebob->mutex);
+
+	guard(mutex)(&bebob->mutex);
 	uval->value.enumerated.item[0] = params->dig_out_fmt;
-	mutex_unlock(&bebob->mutex);
 	return 0;
 }
 static int special_dig_out_iface_ctl_set(struct snd_kcontrol *kctl,
@@ -563,7 +552,7 @@ static int special_dig_out_iface_ctl_set(struct snd_kcontrol *kctl,
 	if (id >= ARRAY_SIZE(special_dig_out_iface_labels))
 		return -EINVAL;
 
-	mutex_lock(&bebob->mutex);
+	guard(mutex)(&bebob->mutex);
 
 	err = avc_maudio_set_special_clk(bebob,
 					 params->clk_src,
@@ -574,7 +563,6 @@ static int special_dig_out_iface_ctl_set(struct snd_kcontrol *kctl,
 		err = 1;
 	}
 
-	mutex_unlock(&bebob->mutex);
 	return err;
 }
 static const struct snd_kcontrol_new special_dig_out_iface_ctl = {
diff --git a/sound/firewire/bebob/bebob_midi.c b/sound/firewire/bebob/bebob_midi.c
index b1425bf98c3b..5fd2d363de52 100644
--- a/sound/firewire/bebob/bebob_midi.c
+++ b/sound/firewire/bebob/bebob_midi.c
@@ -16,15 +16,15 @@ static int midi_open(struct snd_rawmidi_substream *substream)
 	if (err < 0)
 		return err;
 
-	mutex_lock(&bebob->mutex);
-	err = snd_bebob_stream_reserve_duplex(bebob, 0, 0, 0);
-	if (err >= 0) {
-		++bebob->substreams_counter;
-		err = snd_bebob_stream_start_duplex(bebob);
-		if (err < 0)
-			--bebob->substreams_counter;
+	scoped_guard(mutex, &bebob->mutex) {
+		err = snd_bebob_stream_reserve_duplex(bebob, 0, 0, 0);
+		if (err >= 0) {
+			++bebob->substreams_counter;
+			err = snd_bebob_stream_start_duplex(bebob);
+			if (err < 0)
+				--bebob->substreams_counter;
+		}
 	}
-	mutex_unlock(&bebob->mutex);
 	if (err < 0)
 		snd_bebob_stream_lock_release(bebob);
 
@@ -35,10 +35,10 @@ static int midi_close(struct snd_rawmidi_substream *substream)
 {
 	struct snd_bebob *bebob = substream->rmidi->private_data;
 
-	mutex_lock(&bebob->mutex);
-	bebob->substreams_counter--;
-	snd_bebob_stream_stop_duplex(bebob);
-	mutex_unlock(&bebob->mutex);
+	scoped_guard(mutex, &bebob->mutex) {
+		bebob->substreams_counter--;
+		snd_bebob_stream_stop_duplex(bebob);
+	}
 
 	snd_bebob_stream_lock_release(bebob);
 	return 0;
diff --git a/sound/firewire/bebob/bebob_pcm.c b/sound/firewire/bebob/bebob_pcm.c
index 360ebf3c4ca2..573d3efb42cc 100644
--- a/sound/firewire/bebob/bebob_pcm.c
+++ b/sound/firewire/bebob/bebob_pcm.c
@@ -149,49 +149,43 @@ static int pcm_open(struct snd_pcm_substream *substream)
 	if (err < 0)
 		goto err_locked;
 
-	mutex_lock(&bebob->mutex);
+	scoped_guard(mutex, &bebob->mutex) {
 
-	// When source of clock is not internal or any stream is reserved for
-	// transmission of PCM frames, the available sampling rate is limited
-	// at current one.
-	if (src == SND_BEBOB_CLOCK_TYPE_EXTERNAL ||
-	    (bebob->substreams_counter > 0 && d->events_per_period > 0)) {
-		unsigned int frames_per_period = d->events_per_period;
-		unsigned int frames_per_buffer = d->events_per_buffer;
-		unsigned int sampling_rate;
+		// When source of clock is not internal or any stream is reserved for
+		// transmission of PCM frames, the available sampling rate is limited
+		// at current one.
+		if (src == SND_BEBOB_CLOCK_TYPE_EXTERNAL ||
+		    (bebob->substreams_counter > 0 && d->events_per_period > 0)) {
+			unsigned int frames_per_period = d->events_per_period;
+			unsigned int frames_per_buffer = d->events_per_buffer;
+			unsigned int sampling_rate;
 
-		err = spec->get(bebob, &sampling_rate);
-		if (err < 0) {
-			mutex_unlock(&bebob->mutex);
-			dev_err(&bebob->unit->device,
-				"fail to get sampling rate: %d\n", err);
-			goto err_locked;
-		}
-
-		substream->runtime->hw.rate_min = sampling_rate;
-		substream->runtime->hw.rate_max = sampling_rate;
-
-		if (frames_per_period > 0) {
-			err = snd_pcm_hw_constraint_minmax(substream->runtime,
-					SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
-					frames_per_period, frames_per_period);
+			err = spec->get(bebob, &sampling_rate);
 			if (err < 0) {
-				mutex_unlock(&bebob->mutex);
+				dev_err(&bebob->unit->device,
+					"fail to get sampling rate: %d\n", err);
 				goto err_locked;
 			}
 
-			err = snd_pcm_hw_constraint_minmax(substream->runtime,
-					SNDRV_PCM_HW_PARAM_BUFFER_SIZE,
-					frames_per_buffer, frames_per_buffer);
-			if (err < 0) {
-				mutex_unlock(&bebob->mutex);
-				goto err_locked;
+			substream->runtime->hw.rate_min = sampling_rate;
+			substream->runtime->hw.rate_max = sampling_rate;
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
 			}
 		}
 	}
 
-	mutex_unlock(&bebob->mutex);
-
 	snd_pcm_set_sync(substream);
 
 	return 0;
@@ -219,12 +213,11 @@ static int pcm_hw_params(struct snd_pcm_substream *substream,
 		unsigned int frames_per_period = params_period_size(hw_params);
 		unsigned int frames_per_buffer = params_buffer_size(hw_params);
 
-		mutex_lock(&bebob->mutex);
+		guard(mutex)(&bebob->mutex);
 		err = snd_bebob_stream_reserve_duplex(bebob, rate,
 					frames_per_period, frames_per_buffer);
 		if (err >= 0)
 			++bebob->substreams_counter;
-		mutex_unlock(&bebob->mutex);
 	}
 
 	return err;
@@ -234,15 +227,13 @@ static int pcm_hw_free(struct snd_pcm_substream *substream)
 {
 	struct snd_bebob *bebob = substream->private_data;
 
-	mutex_lock(&bebob->mutex);
+	guard(mutex)(&bebob->mutex);
 
 	if (substream->runtime->state != SNDRV_PCM_STATE_OPEN)
 		bebob->substreams_counter--;
 
 	snd_bebob_stream_stop_duplex(bebob);
 
-	mutex_unlock(&bebob->mutex);
-
 	return 0;
 }
 
-- 
2.50.1

