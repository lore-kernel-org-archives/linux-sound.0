Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68FA121C9FD
	for <linux-sound@vger.kernel.org>; Fri, 11 Jul 2025 08:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752222657; cv=none; b=Iy8xv88WLsJeh+gp7Fu+TXB1TMGxxESY4JIsfXyYKiB9kzWFjevC/Sca+p0iCAy3kNFrZby7zb6UWb1AGotR5xgIqQAWcbQRvyb2AqJi7ikuEE5wzClLIBwl/UUZl051izdDF/V3kLBqbGzKnhXrlqAw94gXg/ASl86O2ro6Xak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752222657; c=relaxed/simple;
	bh=1pWVRjjUswItFQzTm8dfIUNuLugs3oqpnPU5jsijyTc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=Vx4pDkfegH1ncpDdOpbm/JK7XoOmVxQlRkmpltUm+PiC8ZaKLWDuCm1XEriGIuvgrMp9DF3HoRU4WkmAXjrJ/UWfyZMzmAwfPoIZZIAqlkiQcIaMYqPpnbO7rIS5LuN99FkxsYEV6XWx3u5TG3Z50rclXa132iePdRwcO+b44VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cgkTR7BK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DGgIArbX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cgkTR7BK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DGgIArbX; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cgkTR7BK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DGgIArbX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cgkTR7BK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DGgIArbX"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6D9A61F7C9;
	Fri, 11 Jul 2025 08:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752222653; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=wlUYTlX8ABhtJGzKB0wJLKb+ZXmVRQgpGb+hoXnVFbw=;
	b=cgkTR7BKDsUYS3l2ZBhvb8aEX5iwLHbwnaai67NTyyoET96sjh0s24shfWDPkq9X4qkFm6
	ttl33PxvlpZWd4lFqJ15ebO8UiQ0+tOqU1JgPjPBPZkbN5Xidpj4oEg/ClBS3lPDfjvBpB
	k/bBzSNtvXNyy8GCXJuAtWwuZmKcXvc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752222653;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=wlUYTlX8ABhtJGzKB0wJLKb+ZXmVRQgpGb+hoXnVFbw=;
	b=DGgIArbX5yoiyynjgYbvaws5ELDCejfZHFOiS3fG+QBGQTpOm7DT+HtPxLqmyFsLxI61Vh
	toaN/HsK9+WYwpCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752222653; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=wlUYTlX8ABhtJGzKB0wJLKb+ZXmVRQgpGb+hoXnVFbw=;
	b=cgkTR7BKDsUYS3l2ZBhvb8aEX5iwLHbwnaai67NTyyoET96sjh0s24shfWDPkq9X4qkFm6
	ttl33PxvlpZWd4lFqJ15ebO8UiQ0+tOqU1JgPjPBPZkbN5Xidpj4oEg/ClBS3lPDfjvBpB
	k/bBzSNtvXNyy8GCXJuAtWwuZmKcXvc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752222653;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=wlUYTlX8ABhtJGzKB0wJLKb+ZXmVRQgpGb+hoXnVFbw=;
	b=DGgIArbX5yoiyynjgYbvaws5ELDCejfZHFOiS3fG+QBGQTpOm7DT+HtPxLqmyFsLxI61Vh
	toaN/HsK9+WYwpCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 42C5C138A5;
	Fri, 11 Jul 2025 08:30:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id tOeNDr3LcGhVWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 11 Jul 2025 08:30:53 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: hda: Use safer strscpy() instead of strcpy()
Date: Fri, 11 Jul 2025 10:30:50 +0200
Message-ID: <20250711083051.18759-1-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
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
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -2.80

Use a safer function strscpy() instead of strcpy() for copying to
arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/ca0132.c          | 18 +++++++++---------
 sound/hda/codecs/generic.c         |  4 ++--
 sound/hda/codecs/realtek/realtek.c |  4 ++--
 sound/hda/common/codec.c           |  4 ++--
 sound/hda/controllers/intel.c      |  2 +-
 5 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/sound/hda/codecs/ca0132.c b/sound/hda/codecs/ca0132.c
index 6ab59c336ed4..b716f721f25d 100644
--- a/sound/hda/codecs/ca0132.c
+++ b/sound/hda/codecs/ca0132.c
@@ -5796,7 +5796,7 @@ static int ca0132_alt_mic_boost_info(struct snd_kcontrol *kcontrol,
 	if (uinfo->value.enumerated.item >= MIC_BOOST_NUM_OF_STEPS)
 		uinfo->value.enumerated.item = MIC_BOOST_NUM_OF_STEPS - 1;
 	sprintf(namestr, "%d %s", (uinfo->value.enumerated.item * 10), sfx);
-	strcpy(uinfo->value.enumerated.name, namestr);
+	strscpy(uinfo->value.enumerated.name, namestr);
 	return 0;
 }
 
@@ -5850,7 +5850,7 @@ static int ae5_headphone_gain_info(struct snd_kcontrol *kcontrol,
 	sprintf(namestr, "%s %s",
 		ae5_headphone_gain_presets[uinfo->value.enumerated.item].name,
 		sfx);
-	strcpy(uinfo->value.enumerated.name, namestr);
+	strscpy(uinfo->value.enumerated.name, namestr);
 	return 0;
 }
 
@@ -5903,7 +5903,7 @@ static int ae5_sound_filter_info(struct snd_kcontrol *kcontrol,
 		uinfo->value.enumerated.item = AE5_SOUND_FILTER_MAX - 1;
 	sprintf(namestr, "%s",
 			ae5_filter_presets[uinfo->value.enumerated.item].name);
-	strcpy(uinfo->value.enumerated.name, namestr);
+	strscpy(uinfo->value.enumerated.name, namestr);
 	return 0;
 }
 
@@ -5952,7 +5952,7 @@ static int ca0132_alt_input_source_info(struct snd_kcontrol *kcontrol,
 	uinfo->value.enumerated.items = IN_SRC_NUM_OF_INPUTS;
 	if (uinfo->value.enumerated.item >= IN_SRC_NUM_OF_INPUTS)
 		uinfo->value.enumerated.item = IN_SRC_NUM_OF_INPUTS - 1;
-	strcpy(uinfo->value.enumerated.name,
+	strscpy(uinfo->value.enumerated.name,
 			in_src_str[uinfo->value.enumerated.item]);
 	return 0;
 }
@@ -6004,7 +6004,7 @@ static int ca0132_alt_output_select_get_info(struct snd_kcontrol *kcontrol,
 	uinfo->value.enumerated.items = NUM_OF_OUTPUTS;
 	if (uinfo->value.enumerated.item >= NUM_OF_OUTPUTS)
 		uinfo->value.enumerated.item = NUM_OF_OUTPUTS - 1;
-	strcpy(uinfo->value.enumerated.name,
+	strscpy(uinfo->value.enumerated.name,
 			out_type_str[uinfo->value.enumerated.item]);
 	return 0;
 }
@@ -6055,7 +6055,7 @@ static int ca0132_alt_speaker_channel_cfg_get_info(struct snd_kcontrol *kcontrol
 	uinfo->value.enumerated.items = items;
 	if (uinfo->value.enumerated.item >= items)
 		uinfo->value.enumerated.item = items - 1;
-	strcpy(uinfo->value.enumerated.name,
+	strscpy(uinfo->value.enumerated.name,
 			speaker_channel_cfgs[uinfo->value.enumerated.item].name);
 	return 0;
 }
@@ -6108,7 +6108,7 @@ static int ca0132_alt_svm_setting_info(struct snd_kcontrol *kcontrol,
 	uinfo->value.enumerated.items = NUM_OF_SVM_SETTINGS;
 	if (uinfo->value.enumerated.item >= NUM_OF_SVM_SETTINGS)
 		uinfo->value.enumerated.item = NUM_OF_SVM_SETTINGS - 1;
-	strcpy(uinfo->value.enumerated.name,
+	strscpy(uinfo->value.enumerated.name,
 			out_svm_set_enum_str[uinfo->value.enumerated.item]);
 	return 0;
 }
@@ -6172,7 +6172,7 @@ static int ca0132_alt_eq_preset_info(struct snd_kcontrol *kcontrol,
 	uinfo->value.enumerated.items = items;
 	if (uinfo->value.enumerated.item >= items)
 		uinfo->value.enumerated.item = items - 1;
-	strcpy(uinfo->value.enumerated.name,
+	strscpy(uinfo->value.enumerated.name,
 		ca0132_alt_eq_presets[uinfo->value.enumerated.item].name);
 	return 0;
 }
@@ -6229,7 +6229,7 @@ static int ca0132_voicefx_info(struct snd_kcontrol *kcontrol,
 	uinfo->value.enumerated.items = items;
 	if (uinfo->value.enumerated.item >= items)
 		uinfo->value.enumerated.item = items - 1;
-	strcpy(uinfo->value.enumerated.name,
+	strscpy(uinfo->value.enumerated.name,
 	       ca0132_voicefx_presets[uinfo->value.enumerated.item].name);
 	return 0;
 }
diff --git a/sound/hda/codecs/generic.c b/sound/hda/codecs/generic.c
index 044f1d0aeaea..a44beefe3e97 100644
--- a/sound/hda/codecs/generic.c
+++ b/sound/hda/codecs/generic.c
@@ -2828,7 +2828,7 @@ static int in_jack_mode_info(struct snd_kcontrol *kcontrol,
 	snd_hda_enum_helper_info(kcontrol, uinfo, hweight32(vref_caps),
 				 vref_texts);
 	/* set the right text */
-	strcpy(uinfo->value.enumerated.name,
+	strscpy(uinfo->value.enumerated.name,
 	       vref_texts[get_vref_idx(vref_caps, uinfo->value.enumerated.item)]);
 	return 0;
 }
@@ -2941,7 +2941,7 @@ static int hp_mic_jack_mode_info(struct snd_kcontrol *kcontrol,
 			text = "Mic In";
 	}
 
-	strcpy(uinfo->value.enumerated.name, text);
+	strscpy(uinfo->value.enumerated.name, text);
 	return 0;
 }
 
diff --git a/sound/hda/codecs/realtek/realtek.c b/sound/hda/codecs/realtek/realtek.c
index 66b2efb9acb3..b6feccfd45a9 100644
--- a/sound/hda/codecs/realtek/realtek.c
+++ b/sound/hda/codecs/realtek/realtek.c
@@ -1130,7 +1130,7 @@ void alc1220_fixup_gb_dual_codecs(struct hda_codec *codec,
 	switch (action) {
 	case HDA_FIXUP_ACT_PRE_PROBE:
 		/* override card longname to provide a unique UCM profile */
-		strcpy(codec->card->longname, "HDAudio-Gigabyte-ALC1220DualCodecs");
+		strscpy(codec->card->longname, "HDAudio-Gigabyte-ALC1220DualCodecs");
 		break;
 	case HDA_FIXUP_ACT_BUILD:
 		/* rename Capture controls depending on the codec */
@@ -1155,7 +1155,7 @@ void alc233_alc662_fixup_lenovo_dual_codecs(struct hda_codec *codec,
 	switch (action) {
 	case HDA_FIXUP_ACT_PRE_PROBE:
 		/* override card longname to provide a unique UCM profile */
-		strcpy(codec->card->longname, "HDAudio-Lenovo-DualCodecs");
+		strscpy(codec->card->longname, "HDAudio-Lenovo-DualCodecs");
 		break;
 	case HDA_FIXUP_ACT_BUILD:
 		/* rename Capture controls depending on the codec */
diff --git a/sound/hda/common/codec.c b/sound/hda/common/codec.c
index 8e47769ef0ce..eb268d442201 100644
--- a/sound/hda/common/codec.c
+++ b/sound/hda/common/codec.c
@@ -1638,7 +1638,7 @@ find_mixer_ctl(struct hda_codec *codec, const char *name, int dev, int idx)
 	id.index = idx;
 	if (snd_BUG_ON(strlen(name) >= sizeof(id.name)))
 		return NULL;
-	strcpy(id.name, name);
+	strscpy(id.name, name);
 	return snd_ctl_find_id(codec->card, &id);
 }
 
@@ -3508,7 +3508,7 @@ int snd_hda_input_mux_info(const struct hda_input_mux *imux,
 	index = uinfo->value.enumerated.item;
 	if (index >= imux->num_items)
 		index = imux->num_items - 1;
-	strcpy(uinfo->value.enumerated.name, imux->items[index].label);
+	strscpy(uinfo->value.enumerated.name, imux->items[index].label);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(snd_hda_input_mux_info);
diff --git a/sound/hda/controllers/intel.c b/sound/hda/controllers/intel.c
index ebfc999156f4..32bfd92d817f 100644
--- a/sound/hda/controllers/intel.c
+++ b/sound/hda/controllers/intel.c
@@ -2024,7 +2024,7 @@ static int azx_first_init(struct azx *chip)
 	if (azx_acquire_irq(chip, 0) < 0)
 		return -EBUSY;
 
-	strcpy(card->driver, "HDA-Intel");
+	strscpy(card->driver, "HDA-Intel");
 	strscpy(card->shortname, driver_short_names[chip->driver_type],
 		sizeof(card->shortname));
 	snprintf(card->longname, sizeof(card->longname),
-- 
2.50.1

