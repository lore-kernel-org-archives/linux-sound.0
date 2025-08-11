Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA37E1F3B98
	for <linux-sound@vger.kernel.org>; Mon, 11 Aug 2025 10:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754906918; cv=none; b=h0dhTB2AB8G70IO9duDaFXVJNkeIKILbo/KBKPYSiK9KPJfrMD7n98sP5NUs972aR7kOqD9C8BwRTVKLkUlto4Wfikaf56obNdwgqLN60nNNamiRwuUniSnvKv7/So2gOnbM3RwZS6GPglKId4nBsyAfojDx6ev35TzWPZ1rYCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754906918; c=relaxed/simple;
	bh=v4JB+6Ho7/Stx9pmr33SWX+COuP17S6EIf0yS2OiJao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qtMpP8AJS39wIAEfMeyXhI2/6i8ArVUHj0d4latXkgDZ913GZuNL6CDZdu5XmIhIDAj2J6zQqur/OLxp7e54gp/kKFIx1D7mb875aDLypOAZNX4iYMkfm3aibtO4KPX1KhueiB4/Ib2j5da+S6lIT8BNDxstvzLAlL/MxcK3Zmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=t7Xj+snW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rYOMnquG; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SfWjMCvQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hAJOXdlG; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="t7Xj+snW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rYOMnquG";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SfWjMCvQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hAJOXdlG"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 656685BDFD;
	Mon, 11 Aug 2025 10:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754906894; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e+4lQtZ+rod3EbMhqnjmYK/qxz/RuZ+rgkP6wJv4H5c=;
	b=t7Xj+snWoCSOxjpApZF/BWkBT4nggBfJyO2FAMQBVEv1CKZaMzRqIDu9lFEdfQJ9lEx56R
	t+us8Z4qLekEPQ7zOym0w/Hh4PfgFpCrWNgaMv93uHUr5gqhQjErrm9azfcRSMuLKwrIza
	kPtx66pV3FXlgW/Wmf4p/bc+t7cjKew=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754906894;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e+4lQtZ+rod3EbMhqnjmYK/qxz/RuZ+rgkP6wJv4H5c=;
	b=rYOMnquGrgBF42e7mILLlLQcPgncdsBU1PITNlzrrD4NNoJBr6c7H5Cc7Hilz0rbwMStrJ
	YFDJxV33aCeGt9Ag==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754906893; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e+4lQtZ+rod3EbMhqnjmYK/qxz/RuZ+rgkP6wJv4H5c=;
	b=SfWjMCvQZ99tdBO00a10oAzF5moUtOKJ2RIJJqknUBfOKiA5pgOhmqlWW0qYAwutll4V5E
	rNJb0MIOosiyVQgVfYAuh23ZbrBfWrsl21NJhZz+w9qWGQZAVP+tDIramw9UYDr/qv6Icn
	oJEdJsjUYhtClShqCZc+4VR7H++FzPs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754906893;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e+4lQtZ+rod3EbMhqnjmYK/qxz/RuZ+rgkP6wJv4H5c=;
	b=hAJOXdlG/X5yiQy/nuwBMb+whb4iJlu3KgYgSJl+PXdlv0gt/pERdC9beygbvQSDIUtIX1
	eqBj/ipVlAQeY4Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2C17E13A9B;
	Mon, 11 Aug 2025 10:08:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MN2JCQ3BmWiVBwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 11 Aug 2025 10:08:13 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>
Subject: [PATCH 02/25] ALSA: hda/ca0132: Use cleanup macros for PM controls
Date: Mon, 11 Aug 2025 12:07:36 +0200
Message-ID: <20250811100807.7962-3-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250811100807.7962-1-tiwai@suse.de>
References: <20250811100807.7962-1-tiwai@suse.de>
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
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_RATELIMIT(0.00)[to_ip_from(RLf66hkhxcz6y1w5afddqk81z3)];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

The new macro CLASS(snd_hda_power) can replace the manual
snd_hda_power_up() and _down() calls as well as the *_pm_*() variants
gracefully.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/ca0132.c | 106 ++++++++++++++------------------------
 1 file changed, 39 insertions(+), 67 deletions(-)

diff --git a/sound/hda/codecs/ca0132.c b/sound/hda/codecs/ca0132.c
index b7d456e16c93..f5ad8a5777b4 100644
--- a/sound/hda/codecs/ca0132.c
+++ b/sound/hda/codecs/ca0132.c
@@ -4244,11 +4244,10 @@ static int tuning_ctl_set(struct hda_codec *codec, hda_nid_t nid,
 
 	return -EINVAL;
 found:
-	snd_hda_power_up(codec);
+	CLASS(snd_hda_power, pm)(codec);
 	dspio_set_param(codec, ca0132_tuning_ctls[i].mid, 0x20,
 			ca0132_tuning_ctls[i].req,
 			&(lookup[idx]), sizeof(unsigned int));
-	snd_hda_power_down(codec);
 
 	return 1;
 }
@@ -4465,7 +4464,7 @@ static int ca0132_select_out(struct hda_codec *codec)
 
 	codec_dbg(codec, "ca0132_select_out\n");
 
-	snd_hda_power_up_pm(codec);
+	CLASS(snd_hda_power_pm, pm)(codec);
 
 	auto_jack = spec->vnode_lswitch[VNID_HP_ASEL - VNODE_START_NID];
 
@@ -4486,12 +4485,12 @@ static int ca0132_select_out(struct hda_codec *codec)
 		tmp = FLOAT_ONE;
 		err = dspio_set_uint_param(codec, 0x80, 0x04, tmp);
 		if (err < 0)
-			goto exit;
+			return err;
 		/*enable speaker EQ*/
 		tmp = FLOAT_ONE;
 		err = dspio_set_uint_param(codec, 0x8f, 0x00, tmp);
 		if (err < 0)
-			goto exit;
+			return err;
 
 		/* Setup EAPD */
 		snd_hda_codec_write(codec, spec->out_pins[1], 0,
@@ -4519,12 +4518,12 @@ static int ca0132_select_out(struct hda_codec *codec)
 		tmp = FLOAT_ZERO;
 		err = dspio_set_uint_param(codec, 0x80, 0x04, tmp);
 		if (err < 0)
-			goto exit;
+			return err;
 		/*disable speaker EQ*/
 		tmp = FLOAT_ZERO;
 		err = dspio_set_uint_param(codec, 0x8f, 0x00, tmp);
 		if (err < 0)
-			goto exit;
+			return err;
 
 		/* Setup EAPD */
 		snd_hda_codec_write(codec, spec->out_pins[0], 0,
@@ -4548,10 +4547,7 @@ static int ca0132_select_out(struct hda_codec *codec)
 				    pin_ctl | PIN_HP);
 	}
 
-exit:
-	snd_hda_power_down_pm(codec);
-
-	return err < 0 ? err : 0;
+	return 0;
 }
 
 static int ae5_headphone_gain_set(struct hda_codec *codec, long val);
@@ -4775,7 +4771,7 @@ static int ca0132_alt_select_out(struct hda_codec *codec)
 
 	codec_dbg(codec, "%s\n", __func__);
 
-	snd_hda_power_up_pm(codec);
+	CLASS(snd_hda_power_pm, pm)(codec);
 
 	auto_jack = spec->vnode_lswitch[VNID_HP_ASEL - VNODE_START_NID];
 
@@ -4800,11 +4796,11 @@ static int ca0132_alt_select_out(struct hda_codec *codec)
 	/* Begin DSP output switch, mute DSP volume. */
 	err = dspio_set_uint_param(codec, 0x96, SPEAKER_TUNING_MUTE, FLOAT_ONE);
 	if (err < 0)
-		goto exit;
+		return err;
 
 	err = ca0132_alt_select_out_quirk_set(codec);
 	if (err < 0)
-		goto exit;
+		return err;
 
 	switch (spec->cur_out_type) {
 	case SPEAKER_OUT:
@@ -4835,7 +4831,7 @@ static int ca0132_alt_select_out(struct hda_codec *codec)
 
 		err = dspio_set_uint_param(codec, 0x80, 0x04, tmp);
 		if (err < 0)
-			goto exit;
+			return err;
 
 		break;
 	case HEADPHONE_OUT:
@@ -4862,7 +4858,7 @@ static int ca0132_alt_select_out(struct hda_codec *codec)
 			err = dspio_set_uint_param(codec, 0x80, 0x04, FLOAT_ZERO);
 
 		if (err < 0)
-			goto exit;
+			return err;
 		break;
 	}
 	/*
@@ -4877,7 +4873,7 @@ static int ca0132_alt_select_out(struct hda_codec *codec)
 	/* Set speaker EQ bypass attenuation to 0. */
 	err = dspio_set_uint_param(codec, 0x8f, 0x01, FLOAT_ZERO);
 	if (err < 0)
-		goto exit;
+		return err;
 
 	/*
 	 * Although unused on all cards but the AE series, this is always set
@@ -4886,7 +4882,7 @@ static int ca0132_alt_select_out(struct hda_codec *codec)
 	err = dspio_set_uint_param(codec, 0x96,
 			SPEAKER_TUNING_USE_SPEAKER_EQ, FLOAT_ZERO);
 	if (err < 0)
-		goto exit;
+		return err;
 
 	if (spec->cur_out_type == SPEAKER_OUT)
 		err = ca0132_alt_surround_set_bass_redirection(codec,
@@ -4894,24 +4890,21 @@ static int ca0132_alt_select_out(struct hda_codec *codec)
 	else
 		err = ca0132_alt_surround_set_bass_redirection(codec, 0);
 	if (err < 0)
-		goto exit;
+		return err;
 
 	/* Unmute DSP now that we're done with output selection. */
 	err = dspio_set_uint_param(codec, 0x96,
 			SPEAKER_TUNING_MUTE, FLOAT_ZERO);
 	if (err < 0)
-		goto exit;
+		return err;
 
 	if (spec->cur_out_type == SPEAKER_OUT) {
 		err = ca0132_alt_set_full_range_speaker(codec);
 		if (err < 0)
-			goto exit;
+			return err;
 	}
 
-exit:
-	snd_hda_power_down_pm(codec);
-
-	return err < 0 ? err : 0;
+	return 0;
 }
 
 static void ca0132_unsol_hp_delayed(struct work_struct *work)
@@ -5059,7 +5052,7 @@ static int ca0132_select_mic(struct hda_codec *codec)
 
 	codec_dbg(codec, "ca0132_select_mic\n");
 
-	snd_hda_power_up_pm(codec);
+	CLASS(snd_hda_power_pm, pm)(codec);
 
 	auto_jack = spec->vnode_lswitch[VNID_AMIC1_ASEL - VNODE_START_NID];
 
@@ -5092,8 +5085,6 @@ static int ca0132_select_mic(struct hda_codec *codec)
 		ca0132_effects_set(codec, VOICE_FOCUS, 0);
 	}
 
-	snd_hda_power_down_pm(codec);
-
 	return 0;
 }
 
@@ -5110,7 +5101,7 @@ static int ca0132_alt_select_in(struct hda_codec *codec)
 
 	codec_dbg(codec, "%s\n", __func__);
 
-	snd_hda_power_up_pm(codec);
+	CLASS(snd_hda_power_pm, pm)(codec);
 
 	chipio_set_stream_control(codec, 0x03, 0);
 	chipio_set_stream_control(codec, 0x04, 0);
@@ -5273,7 +5264,6 @@ static int ca0132_alt_select_in(struct hda_codec *codec)
 	}
 	ca0132_cvoice_switch_set(codec);
 
-	snd_hda_power_down_pm(codec);
 	return 0;
 }
 
@@ -5611,12 +5601,10 @@ static int ca0132_vnode_switch_set(struct snd_kcontrol *kcontrol,
 static void ca0132_alt_bass_redirection_xover_set(struct hda_codec *codec,
 		long idx)
 {
-	snd_hda_power_up(codec);
+	CLASS(snd_hda_power, pm)(codec);
 
 	dspio_set_param(codec, 0x96, 0x20, SPEAKER_BASS_REDIRECT_XOVER_FREQ,
 			&(float_xbass_xover_lookup[idx]), sizeof(unsigned int));
-
-	snd_hda_power_down(codec);
 }
 
 /*
@@ -5642,7 +5630,7 @@ static int ca0132_alt_slider_ctl_set(struct hda_codec *codec, hda_nid_t nid,
 	else
 		y = 1;
 
-	snd_hda_power_up(codec);
+	CLASS(snd_hda_power, pm)(codec);
 	if (nid == XBASS_XOVER) {
 		for (i = 0; i < OUT_EFFECTS_COUNT; i++)
 			if (ca0132_effects[i].nid == X_BASS)
@@ -5662,8 +5650,6 @@ static int ca0132_alt_slider_ctl_set(struct hda_codec *codec, hda_nid_t nid,
 				&(lookup[idx]), sizeof(unsigned int));
 	}
 
-	snd_hda_power_down(codec);
-
 	return 0;
 }
 
@@ -6342,12 +6328,11 @@ static int ca0132_switch_put(struct snd_kcontrol *kcontrol,
 	hda_nid_t nid = get_amp_nid(kcontrol);
 	int ch = get_amp_channels(kcontrol);
 	long *valp = ucontrol->value.integer.value;
-	int changed = 1;
 
 	codec_dbg(codec, "ca0132_switch_put: nid=0x%x, val=%ld\n",
 		    nid, *valp);
 
-	snd_hda_power_up(codec);
+	CLASS(snd_hda_power, pm)(codec);
 	/* vnode */
 	if ((nid >= VNODE_START_NID) && (nid < VNODE_END_NID)) {
 		if (ch & 1) {
@@ -6358,30 +6343,26 @@ static int ca0132_switch_put(struct snd_kcontrol *kcontrol,
 			spec->vnode_rswitch[nid - VNODE_START_NID] = *valp;
 			valp++;
 		}
-		changed = ca0132_vnode_switch_set(kcontrol, ucontrol);
-		goto exit;
+		return ca0132_vnode_switch_set(kcontrol, ucontrol);
 	}
 
 	/* PE */
 	if (nid == PLAY_ENHANCEMENT) {
 		spec->effects_switch[nid - EFFECT_START_NID] = *valp;
-		changed = ca0132_pe_switch_set(codec);
-		goto exit;
+		return ca0132_pe_switch_set(codec);
 	}
 
 	/* CrystalVoice */
 	if (nid == CRYSTAL_VOICE) {
 		spec->effects_switch[nid - EFFECT_START_NID] = *valp;
-		changed = ca0132_cvoice_switch_set(codec);
-		goto exit;
+		return ca0132_cvoice_switch_set(codec);
 	}
 
 	/* out and in effects */
 	if (((nid >= OUT_EFFECT_START_NID) && (nid < OUT_EFFECT_END_NID)) ||
 	    ((nid >= IN_EFFECT_START_NID) && (nid < IN_EFFECT_END_NID))) {
 		spec->effects_switch[nid - EFFECT_START_NID] = *valp;
-		changed = ca0132_effects_set(codec, nid, *valp);
-		goto exit;
+		return ca0132_effects_set(codec, nid, *valp);
 	}
 
 	/* mic boost */
@@ -6389,24 +6370,22 @@ static int ca0132_switch_put(struct snd_kcontrol *kcontrol,
 		spec->cur_mic_boost = *valp;
 		if (ca0132_use_alt_functions(spec)) {
 			if (spec->in_enum_val != REAR_LINE_IN)
-				changed = ca0132_mic_boost_set(codec, *valp);
+				return ca0132_mic_boost_set(codec, *valp);
 		} else {
 			/* Mic boost does not apply to Digital Mic */
 			if (spec->cur_mic_type != DIGITAL_MIC)
-				changed = ca0132_mic_boost_set(codec, *valp);
+				return ca0132_mic_boost_set(codec, *valp);
 		}
 
-		goto exit;
+		return 1;
 	}
 
 	if (nid == ZXR_HEADPHONE_GAIN) {
 		spec->zxr_gain_set = *valp;
 		if (spec->cur_out_type == HEADPHONE_OUT)
-			changed = zxr_headphone_gain_set(codec, *valp);
+			return zxr_headphone_gain_set(codec, *valp);
 		else
-			changed = 0;
-
-		goto exit;
+			return 0;
 	}
 
 	if (nid == SPEAKER_FULL_RANGE_FRONT || nid == SPEAKER_FULL_RANGE_REAR) {
@@ -6414,7 +6393,7 @@ static int ca0132_switch_put(struct snd_kcontrol *kcontrol,
 		if (spec->cur_out_type == SPEAKER_OUT)
 			ca0132_alt_set_full_range_speaker(codec);
 
-		changed = 0;
+		return 0;
 	}
 
 	if (nid == BASS_REDIRECTION) {
@@ -6422,12 +6401,10 @@ static int ca0132_switch_put(struct snd_kcontrol *kcontrol,
 		if (spec->cur_out_type == SPEAKER_OUT)
 			ca0132_alt_surround_set_bass_redirection(codec, *valp);
 
-		changed = 0;
+		return 0;
 	}
 
-exit:
-	snd_hda_power_down(codec);
-	return changed;
+	return 1;
 }
 
 /*
@@ -6555,7 +6532,7 @@ static int ca0132_volume_put(struct snd_kcontrol *kcontrol,
 		int dir = get_amp_direction(kcontrol);
 		unsigned long pval;
 
-		snd_hda_power_up(codec);
+		CLASS(snd_hda_power, pm)(codec);
 		mutex_lock(&codec->control_mutex);
 		pval = kcontrol->private_value;
 		kcontrol->private_value = HDA_COMPOSE_AMP_VAL(shared_nid, ch,
@@ -6563,7 +6540,6 @@ static int ca0132_volume_put(struct snd_kcontrol *kcontrol,
 		changed = snd_hda_mixer_amp_volume_put(kcontrol, ucontrol);
 		kcontrol->private_value = pval;
 		mutex_unlock(&codec->control_mutex);
-		snd_hda_power_down(codec);
 	}
 
 	return changed;
@@ -6604,12 +6580,11 @@ static int ca0132_alt_volume_put(struct snd_kcontrol *kcontrol,
 		valp++;
 	}
 
-	snd_hda_power_up(codec);
+	CLASS(snd_hda_power, pm)(codec);
 	ca0132_alt_dsp_volume_put(codec, vnid);
 	mutex_lock(&codec->control_mutex);
 	changed = snd_hda_mixer_amp_volume_put(kcontrol, ucontrol);
 	mutex_unlock(&codec->control_mutex);
-	snd_hda_power_down(codec);
 
 	return changed;
 }
@@ -8664,14 +8639,13 @@ static void ca0132_process_dsp_response(struct hda_codec *codec,
 	struct ca0132_spec *spec = codec->spec;
 
 	codec_dbg(codec, "ca0132_process_dsp_response\n");
-	snd_hda_power_up_pm(codec);
+	CLASS(snd_hda_power_pm, pm)(codec);
 	if (spec->wait_scp) {
 		if (dspio_get_response_data(codec) >= 0)
 			spec->wait_scp = 0;
 	}
 
 	dspio_clear_response_queue(codec);
-	snd_hda_power_down_pm(codec);
 }
 
 static void hp_callback(struct hda_codec *codec, struct hda_jack_callback *cb)
@@ -9546,7 +9520,7 @@ static int ca0132_init(struct hda_codec *codec)
 	if (ca0132_use_pci_mmio(spec))
 		ca0132_mmio_init(codec);
 
-	snd_hda_power_up_pm(codec);
+	CLASS(snd_hda_power_pm, pm)(codec);
 
 	if (ca0132_quirk(spec) == QUIRK_AE5 || ca0132_quirk(spec) == QUIRK_AE7)
 		ae5_register_set(codec);
@@ -9626,8 +9600,6 @@ static int ca0132_init(struct hda_codec *codec)
 		ca0132_pe_switch_set(codec);
 	}
 
-	snd_hda_power_down_pm(codec);
-
 	return 0;
 }
 
-- 
2.50.1

