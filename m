Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8496C28F955
	for <linux-sound@vger.kernel.org>; Wed,  9 Jul 2025 16:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752077591; cv=none; b=Vl7fHSkzCcNebrdt2mLfY7fMLpmNu9xjRtmlXyGIVIS94kY02EVWKXv4OTlBlojP06dg0GGfhIdStrIsCm+4+dHvArdiRWZme64HnlrneS99HrjlgNxFfpKB4aak27YpdbiARW2ijJlL7jLdImkKG8sGQBBqcgJn9PKoydpgmM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752077591; c=relaxed/simple;
	bh=UP/qAnHco7szwaFw8fxrKWeK6gLvNhWw1RlIOTpPFGI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q6hOH57maNcnxYk3fbgUlmADRWXfqrPUre21BYu+ScLTrp0Dtx3pY8gJtRbK0saQxVuo/o7KWnDgd45az6GdAkv38paHoXWraywwBWSHyEAEl4Pr+PzrB45BS5Mrr+59wb0iWbnyX8un1OVUh5iSbInTleO2rrvqEZN9n5b14NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=B0C1Bkdg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=U3lvojrc; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=B0C1Bkdg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=U3lvojrc; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="B0C1Bkdg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="U3lvojrc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="B0C1Bkdg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="U3lvojrc"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6E6F92118D;
	Wed,  9 Jul 2025 16:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752077098; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WMfNuugWXJgYrTxtdw4qrKdcKV1+THMkE9PaR/EbO2s=;
	b=B0C1BkdgU1X+LpqpEjAw48cYvAN93SoN/JnA3+NrevhOhMPc6XcNHQszoFKqxLxdmb7+Hq
	L+cizUHxxGhXyTzWGGwo5oZrTvbm8uo4wydsGPKLPm+dL5Izy+8ue5No0+fXdkIYInKHsZ
	XNPOll6VMMJ9Mm7O6fQW2EByLzHeR24=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752077098;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WMfNuugWXJgYrTxtdw4qrKdcKV1+THMkE9PaR/EbO2s=;
	b=U3lvojrcMn4xgf2Dj/PuyeBZhgDFCuURGa3LXuTBw7z9NMF0GQspZa3lTLwQHhjkgSp8+6
	xsUdikyokkV3ecBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752077098; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WMfNuugWXJgYrTxtdw4qrKdcKV1+THMkE9PaR/EbO2s=;
	b=B0C1BkdgU1X+LpqpEjAw48cYvAN93SoN/JnA3+NrevhOhMPc6XcNHQszoFKqxLxdmb7+Hq
	L+cizUHxxGhXyTzWGGwo5oZrTvbm8uo4wydsGPKLPm+dL5Izy+8ue5No0+fXdkIYInKHsZ
	XNPOll6VMMJ9Mm7O6fQW2EByLzHeR24=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752077098;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WMfNuugWXJgYrTxtdw4qrKdcKV1+THMkE9PaR/EbO2s=;
	b=U3lvojrcMn4xgf2Dj/PuyeBZhgDFCuURGa3LXuTBw7z9NMF0GQspZa3lTLwQHhjkgSp8+6
	xsUdikyokkV3ecBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2444C13998;
	Wed,  9 Jul 2025 16:04:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ECSSByqTbmhDEAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 09 Jul 2025 16:04:58 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
	Kailang <kailang@realtek.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>,
	patches@opensource.cirrus.com,
	Baojun Xu <baojun.xu@ti.com>,
	bo liu <bo.liu@senarytech.com>
Subject: [PATCH 20/27] ALSA: hda/via: Rewrite to new probe method
Date: Wed,  9 Jul 2025 18:04:23 +0200
Message-ID: <20250709160434.1859-21-tiwai@suse.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250709160434.1859-1-tiwai@suse.de>
References: <20250709160434.1859-1-tiwai@suse.de>
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
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_RATELIMIT(0.00)[to_ip_from(RL7bz5f8woybp4997xe1n6ecoy)];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

Convert the VIA codec driver to use the new hda_codec_ops probe.
No functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/via.c | 445 +++++++++++++++++------------------------
 1 file changed, 186 insertions(+), 259 deletions(-)

diff --git a/sound/hda/codecs/via.c b/sound/hda/codecs/via.c
index e3ce563f866b..6becea9bb810 100644
--- a/sound/hda/codecs/via.c
+++ b/sound/hda/codecs/via.c
@@ -2,7 +2,7 @@
 /*
  * Universal Interface for Intel High Definition Audio Codec
  *
- * HD audio interface patch for VIA VT17xx/VT18xx/VT20xx codec
+ * HD audio codec driver for VIA VT17xx/VT18xx/VT20xx codec
  *
  *  (C) 2006-2009 VIA Technology, Inc.
  *  (C) 2006-2008 Takashi Iwai <tiwai@suse.de>
@@ -52,8 +52,10 @@
 enum VIA_HDA_CODEC {
 	UNKNOWN = -1,
 	VT1708,
+	VT1709,
 	VT1709_10CH,
 	VT1709_6CH,
+	VT1708B,
 	VT1708B_8CH,
 	VT1708B_4CH,
 	VT1708S,
@@ -66,6 +68,7 @@ enum VIA_HDA_CODEC {
 	VT1802,
 	VT1705CF,
 	VT1808,
+	VT3476,
 	CODEC_TYPES,
 };
 
@@ -95,8 +98,6 @@ static void via_playback_pcm_hook(struct hda_pcm_stream *hinfo,
 				  struct snd_pcm_substream *substream,
 				  int action);
 
-static const struct hda_codec_ops via_patch_ops; /* defined below */
-
 static struct via_spec *via_new_spec(struct hda_codec *codec)
 {
 	struct via_spec *spec;
@@ -118,7 +119,6 @@ static struct via_spec *via_new_spec(struct hda_codec *codec)
 	spec->gen.add_stereo_mix_input = HDA_HINT_STEREO_MIX_AUTO;
 	codec->power_save_node = 1;
 	spec->gen.power_down_unused = 1;
-	codec->patch_ops = via_patch_ops;
 	return spec;
 }
 
@@ -373,10 +373,10 @@ static void via_playback_pcm_hook(struct hda_pcm_stream *hinfo,
 	vt1708_update_hp_work(codec);
 }
 
-static void via_free(struct hda_codec *codec)
+static void via_remove(struct hda_codec *codec)
 {
 	vt1708_stop_hp_work(codec);
-	snd_hda_gen_free(codec);
+	snd_hda_gen_remove(codec);
 }
 
 static int via_suspend(struct hda_codec *codec)
@@ -395,7 +395,7 @@ static int via_resume(struct hda_codec *codec)
 {
 	/* some delay here to make jack detection working (bko#98921) */
 	msleep(10);
-	codec->patch_ops.init(codec);
+	snd_hda_codec_init(codec);
 	snd_hda_regmap_sync(codec);
 	return 0;
 }
@@ -411,20 +411,6 @@ static int via_check_power_status(struct hda_codec *codec, hda_nid_t nid)
 /*
  */
 
-static int via_init(struct hda_codec *codec);
-
-static const struct hda_codec_ops via_patch_ops = {
-	.build_controls = snd_hda_gen_build_controls,
-	.build_pcms = snd_hda_gen_build_pcms,
-	.init = via_init,
-	.free = via_free,
-	.unsol_event = snd_hda_jack_unsol_event,
-	.suspend = via_suspend,
-	.resume = via_resume,
-	.check_power_status = via_check_power_status,
-};
-
-
 static const struct hda_verb vt1708_init_verbs[] = {
 	/* power down jack detect function */
 	{0x1, 0xf81, 0x1},
@@ -541,19 +527,21 @@ static int via_init(struct hda_codec *codec)
 	return 0;
 }
 
-static int vt1708_build_controls(struct hda_codec *codec)
+static int via_build_controls(struct hda_codec *codec)
 {
 	/* In order not to create "Phantom Jack" controls,
 	   temporary enable jackpoll */
 	int err;
 	int old_interval = codec->jackpoll_interval;
-	codec->jackpoll_interval = msecs_to_jiffies(100);
+	if (old_interval)
+		codec->jackpoll_interval = msecs_to_jiffies(100);
 	err = snd_hda_gen_build_controls(codec);
-	codec->jackpoll_interval = old_interval;
+	if (old_interval)
+		codec->jackpoll_interval = old_interval;
 	return err;
 }
 
-static int vt1708_build_pcms(struct hda_codec *codec)
+static int via_build_pcms(struct hda_codec *codec)
 {
 	struct via_spec *spec = codec->spec;
 	int i, err;
@@ -580,19 +568,11 @@ static int vt1708_build_pcms(struct hda_codec *codec)
 	return 0;
 }
 
-static int patch_vt1708(struct hda_codec *codec)
+static int probe_vt1708(struct hda_codec *codec)
 {
-	struct via_spec *spec;
+	struct via_spec *spec = codec->spec;
 	int err;
 
-	/* create a codec specific record */
-	spec = via_new_spec(codec);
-	if (spec == NULL)
-		return -ENOMEM;
-
-	/* override some patch_ops */
-	codec->patch_ops.build_controls = vt1708_build_controls;
-	codec->patch_ops.build_pcms = vt1708_build_pcms;
 	spec->gen.mixer_nid = 0x17;
 
 	/* set jackpoll_interval while parsing the codec */
@@ -611,81 +591,47 @@ static int patch_vt1708(struct hda_codec *codec)
 
 	err = snd_hda_add_verbs(codec, vt1708_init_verbs);
 	if (err < 0)
-		goto error;
+		return err;
 
 	/* automatic parse from the BIOS config */
 	err = via_parse_auto_config(codec);
 	if (err < 0)
-		goto error;
+		return err;
 
 	/* add jack detect on/off control */
-	if (!snd_hda_gen_add_kctl(&spec->gen, NULL, &vt1708_jack_detect_ctl)) {
-		err = -ENOMEM;
-		goto error;
-	}
+	if (!snd_hda_gen_add_kctl(&spec->gen, NULL, &vt1708_jack_detect_ctl))
+		return -ENOMEM;
 
 	/* clear jackpoll_interval again; it's set dynamically */
 	codec->jackpoll_interval = 0;
 
 	return 0;
-
- error:
-	via_free(codec);
-	return err;
 }
 
-static int patch_vt1709(struct hda_codec *codec)
+static int probe_vt1709(struct hda_codec *codec)
 {
-	struct via_spec *spec;
-	int err;
-
-	/* create a codec specific record */
-	spec = via_new_spec(codec);
-	if (spec == NULL)
-		return -ENOMEM;
+	struct via_spec *spec = codec->spec;
 
 	spec->gen.mixer_nid = 0x18;
 
-	err = via_parse_auto_config(codec);
-	if (err < 0)
-		goto error;
-
-	return 0;
-
- error:
-	via_free(codec);
-	return err;
+	return via_parse_auto_config(codec);
 }
 
-static int patch_vt1708S(struct hda_codec *codec);
-static int patch_vt1708B(struct hda_codec *codec)
+static int probe_vt1708S(struct hda_codec *codec);
+static int probe_vt1708B(struct hda_codec *codec)
 {
-	struct via_spec *spec;
-	int err;
+	struct via_spec *spec = codec->spec;
 
 	if (get_codec_type(codec) == VT1708BCE)
-		return patch_vt1708S(codec);
-
-	/* create a codec specific record */
-	spec = via_new_spec(codec);
-	if (spec == NULL)
-		return -ENOMEM;
+		return probe_vt1708S(codec);
 
 	spec->gen.mixer_nid = 0x16;
 
 	/* automatic parse from the BIOS config */
-	err = via_parse_auto_config(codec);
-	if (err < 0)
-		goto error;
-
-	return 0;
-
- error:
-	via_free(codec);
-	return err;
+	return via_parse_auto_config(codec);
 }
 
-/* Patch for VT1708S */
+/* Support for VT1708S */
 static const struct hda_verb vt1708S_init_verbs[] = {
 	/* Enable Mic Boost Volume backdoor */
 	{0x1, 0xf98, 0x1},
@@ -706,16 +652,11 @@ static void override_mic_boost(struct hda_codec *codec, hda_nid_t pin,
 				  (0 << AC_AMPCAP_MUTE_SHIFT));
 }
 
-static int patch_vt1708S(struct hda_codec *codec)
+static int probe_vt1708S(struct hda_codec *codec)
 {
-	struct via_spec *spec;
+	struct via_spec *spec = codec->spec;
 	int err;
 
-	/* create a codec specific record */
-	spec = via_new_spec(codec);
-	if (spec == NULL)
-		return -ENOMEM;
-
 	spec->gen.mixer_nid = 0x16;
 	override_mic_boost(codec, 0x1a, 0, 3, 40);
 	override_mic_boost(codec, 0x1e, 0, 3, 40);
@@ -729,21 +670,12 @@ static int patch_vt1708S(struct hda_codec *codec)
 
 	err = snd_hda_add_verbs(codec, vt1708S_init_verbs);
 	if (err < 0)
-		goto error;
+		return err;
 
-	/* automatic parse from the BIOS config */
-	err = via_parse_auto_config(codec);
-	if (err < 0)
-		goto error;
-
-	return 0;
-
- error:
-	via_free(codec);
-	return err;
+	return via_parse_auto_config(codec);
 }
 
-/* Patch for VT1702 */
+/* Support for VT1702 */
 
 static const struct hda_verb vt1702_init_verbs[] = {
 	/* mixer enable */
@@ -753,16 +685,11 @@ static const struct hda_verb vt1702_init_verbs[] = {
 	{ }
 };
 
-static int patch_vt1702(struct hda_codec *codec)
+static int probe_vt1702(struct hda_codec *codec)
 {
-	struct via_spec *spec;
+	struct via_spec *spec = codec->spec;
 	int err;
 
-	/* create a codec specific record */
-	spec = via_new_spec(codec);
-	if (spec == NULL)
-		return -ENOMEM;
-
 	spec->gen.mixer_nid = 0x1a;
 
 	/* limit AA path volume to 0 dB */
@@ -774,21 +701,13 @@ static int patch_vt1702(struct hda_codec *codec)
 
 	err = snd_hda_add_verbs(codec, vt1702_init_verbs);
 	if (err < 0)
-		goto error;
+		return err;
 
 	/* automatic parse from the BIOS config */
-	err = via_parse_auto_config(codec);
-	if (err < 0)
-		goto error;
-
-	return 0;
-
- error:
-	via_free(codec);
-	return err;
+	return via_parse_auto_config(codec);
 }
 
-/* Patch for VT1718S */
+/* Support for VT1718S */
 
 static const struct hda_verb vt1718S_init_verbs[] = {
 	/* Enable MW0 adjust Gain 5 */
@@ -836,16 +755,11 @@ static int add_secret_dac_path(struct hda_codec *codec)
 }
 
 
-static int patch_vt1718S(struct hda_codec *codec)
+static int probe_vt1718S(struct hda_codec *codec)
 {
-	struct via_spec *spec;
+	struct via_spec *spec = codec->spec;
 	int err;
 
-	/* create a codec specific record */
-	spec = via_new_spec(codec);
-	if (spec == NULL)
-		return -ENOMEM;
-
 	spec->gen.mixer_nid = 0x21;
 	override_mic_boost(codec, 0x2b, 0, 3, 40);
 	override_mic_boost(codec, 0x29, 0, 3, 40);
@@ -853,21 +767,13 @@ static int patch_vt1718S(struct hda_codec *codec)
 
 	err = snd_hda_add_verbs(codec, vt1718S_init_verbs);
 	if (err < 0)
-		goto error;
+		return err;
 
 	/* automatic parse from the BIOS config */
-	err = via_parse_auto_config(codec);
-	if (err < 0)
-		goto error;
-
-	return 0;
-
- error:
-	via_free(codec);
-	return err;
+	return via_parse_auto_config(codec);
 }
 
-/* Patch for VT1716S */
+/* Support for VT1716S */
 
 static int vt1716s_dmic_info(struct snd_kcontrol *kcontrol,
 			    struct snd_ctl_elem_info *uinfo)
@@ -933,41 +839,30 @@ static const struct hda_verb vt1716S_init_verbs[] = {
 	{ }
 };
 
-static int patch_vt1716S(struct hda_codec *codec)
+static int probe_vt1716S(struct hda_codec *codec)
 {
-	struct via_spec *spec;
+	struct via_spec *spec = codec->spec;
 	int err;
 
-	/* create a codec specific record */
-	spec = via_new_spec(codec);
-	if (spec == NULL)
-		return -ENOMEM;
-
 	spec->gen.mixer_nid = 0x16;
 	override_mic_boost(codec, 0x1a, 0, 3, 40);
 	override_mic_boost(codec, 0x1e, 0, 3, 40);
 
 	err = snd_hda_add_verbs(codec, vt1716S_init_verbs);
 	if (err < 0)
-		goto error;
+		return err;
 
 	/* automatic parse from the BIOS config */
 	err = via_parse_auto_config(codec);
 	if (err < 0)
-		goto error;
+		return err;
 
 	if (!snd_hda_gen_add_kctl(&spec->gen, NULL, &vt1716s_dmic_mixer_vol) ||
 	    !snd_hda_gen_add_kctl(&spec->gen, NULL, &vt1716s_dmic_mixer_sw) ||
-	    !snd_hda_gen_add_kctl(&spec->gen, NULL, &vt1716S_mono_out_mixer)) {
-		err = -ENOMEM;
-		goto error;
-	}
+	    !snd_hda_gen_add_kctl(&spec->gen, NULL, &vt1716S_mono_out_mixer))
+		return -ENOMEM;
 
 	return 0;
-
- error:
-	via_free(codec);
-	return err;
 }
 
 /* for vt2002P */
@@ -1055,17 +950,12 @@ static void fix_vt1802_connections(struct hda_codec *codec)
 	snd_hda_override_conn_list(codec, 0x33, ARRAY_SIZE(conn_33), conn_33);
 }
 
-/* patch for vt2002P */
-static int patch_vt2002P(struct hda_codec *codec)
+/* Support for vt2002P */
+static int probe_vt2002P(struct hda_codec *codec)
 {
-	struct via_spec *spec;
+	struct via_spec *spec = codec->spec;
 	int err;
 
-	/* create a codec specific record */
-	spec = via_new_spec(codec);
-	if (spec == NULL)
-		return -ENOMEM;
-
 	spec->gen.mixer_nid = 0x21;
 	override_mic_boost(codec, 0x2b, 0, 3, 40);
 	override_mic_boost(codec, 0x29, 0, 3, 40);
@@ -1081,18 +971,10 @@ static int patch_vt2002P(struct hda_codec *codec)
 	else
 		err = snd_hda_add_verbs(codec, vt2002P_init_verbs);
 	if (err < 0)
-		goto error;
+		return err;
 
 	/* automatic parse from the BIOS config */
-	err = via_parse_auto_config(codec);
-	if (err < 0)
-		goto error;
-
-	return 0;
-
- error:
-	via_free(codec);
-	return err;
+	return via_parse_auto_config(codec);
 }
 
 /* for vt1812 */
@@ -1105,17 +987,11 @@ static const struct hda_verb vt1812_init_verbs[] = {
 	{ }
 };
 
-/* patch for vt1812 */
-static int patch_vt1812(struct hda_codec *codec)
+static int probe_vt1812(struct hda_codec *codec)
 {
-	struct via_spec *spec;
+	struct via_spec *spec = codec->spec;
 	int err;
 
-	/* create a codec specific record */
-	spec = via_new_spec(codec);
-	if (spec == NULL)
-		return -ENOMEM;
-
 	spec->gen.mixer_nid = 0x21;
 	override_mic_boost(codec, 0x2b, 0, 3, 40);
 	override_mic_boost(codec, 0x29, 0, 3, 40);
@@ -1123,21 +999,13 @@ static int patch_vt1812(struct hda_codec *codec)
 
 	err = snd_hda_add_verbs(codec, vt1812_init_verbs);
 	if (err < 0)
-		goto error;
+		return err;
 
 	/* automatic parse from the BIOS config */
-	err = via_parse_auto_config(codec);
-	if (err < 0)
-		goto error;
-
-	return 0;
-
- error:
-	via_free(codec);
-	return err;
+	return via_parse_auto_config(codec);
 }
 
-/* patch for vt3476 */
+/* Support for vt3476 */
 
 static const struct hda_verb vt3476_init_verbs[] = {
 	/* Enable DMic 8/16/32K */
@@ -1149,96 +1017,155 @@ static const struct hda_verb vt3476_init_verbs[] = {
 	{ }
 };
 
-static int patch_vt3476(struct hda_codec *codec)
+static int probe_vt3476(struct hda_codec *codec)
 {
-	struct via_spec *spec;
+	struct via_spec *spec = codec->spec;
 	int err;
 
-	/* create a codec specific record */
-	spec = via_new_spec(codec);
-	if (spec == NULL)
-		return -ENOMEM;
-
 	spec->gen.mixer_nid = 0x3f;
 	add_secret_dac_path(codec);
 
 	err = snd_hda_add_verbs(codec, vt3476_init_verbs);
 	if (err < 0)
-		goto error;
+		return err;
 
 	/* automatic parse from the BIOS config */
-	err = via_parse_auto_config(codec);
-	if (err < 0)
-		goto error;
+	return via_parse_auto_config(codec);
 
-	return 0;
-
- error:
-	via_free(codec);
-	return err;
 }
 
 /*
- * patch entries
+ * common driver probe
+ */
+static int via_probe(struct hda_codec *codec, const struct hda_device_id *id)
+{
+	struct via_spec *spec;
+	int err;
+
+	/* create a codec specific record */
+	spec = via_new_spec(codec);
+	if (!spec)
+		return -ENOMEM;
+
+	switch (id->driver_data) {
+	case VT1708:
+		err = probe_vt1708(codec);
+		break;
+	case VT1709:
+		err = probe_vt1709(codec);
+		break;
+	case VT1708B:
+		err = probe_vt1708B(codec);
+		break;
+	case VT1708S:
+		err = probe_vt1708S(codec);
+		break;
+	case VT1702:
+		err = probe_vt1702(codec);
+		break;
+	case VT1718S:
+		err = probe_vt1718S(codec);
+		break;
+	case VT1716S:
+		err = probe_vt1716S(codec);
+		break;
+	case VT2002P:
+		err = probe_vt2002P(codec);
+		break;
+	case VT1812:
+		err = probe_vt1812(codec);
+		break;
+	case VT3476:
+		err = probe_vt3476(codec);
+		break;
+	default:
+		err = -EINVAL;
+		break;
+	}
+
+	if (err < 0) {
+		via_remove(codec);
+		return err;
+	}
+
+	return 0;
+}
+
+static const struct hda_codec_ops via_codec_ops = {
+	.probe = via_probe,
+	.remove = via_remove,
+	.build_controls = via_build_controls,
+	.build_pcms = via_build_pcms,
+	.init = via_init,
+	.unsol_event = snd_hda_jack_unsol_event,
+	.suspend = via_suspend,
+	.resume = via_resume,
+	.check_power_status = via_check_power_status,
+	.stream_pm = snd_hda_gen_stream_pm,
+};
+
+/*
+ * driver entries
  */
 static const struct hda_device_id snd_hda_id_via[] = {
-	HDA_CODEC_ENTRY(0x11061708, "VT1708", patch_vt1708),
-	HDA_CODEC_ENTRY(0x11061709, "VT1708", patch_vt1708),
-	HDA_CODEC_ENTRY(0x1106170a, "VT1708", patch_vt1708),
-	HDA_CODEC_ENTRY(0x1106170b, "VT1708", patch_vt1708),
-	HDA_CODEC_ENTRY(0x1106e710, "VT1709 10-Ch", patch_vt1709),
-	HDA_CODEC_ENTRY(0x1106e711, "VT1709 10-Ch", patch_vt1709),
-	HDA_CODEC_ENTRY(0x1106e712, "VT1709 10-Ch", patch_vt1709),
-	HDA_CODEC_ENTRY(0x1106e713, "VT1709 10-Ch", patch_vt1709),
-	HDA_CODEC_ENTRY(0x1106e714, "VT1709 6-Ch", patch_vt1709),
-	HDA_CODEC_ENTRY(0x1106e715, "VT1709 6-Ch", patch_vt1709),
-	HDA_CODEC_ENTRY(0x1106e716, "VT1709 6-Ch", patch_vt1709),
-	HDA_CODEC_ENTRY(0x1106e717, "VT1709 6-Ch", patch_vt1709),
-	HDA_CODEC_ENTRY(0x1106e720, "VT1708B 8-Ch", patch_vt1708B),
-	HDA_CODEC_ENTRY(0x1106e721, "VT1708B 8-Ch", patch_vt1708B),
-	HDA_CODEC_ENTRY(0x1106e722, "VT1708B 8-Ch", patch_vt1708B),
-	HDA_CODEC_ENTRY(0x1106e723, "VT1708B 8-Ch", patch_vt1708B),
-	HDA_CODEC_ENTRY(0x1106e724, "VT1708B 4-Ch", patch_vt1708B),
-	HDA_CODEC_ENTRY(0x1106e725, "VT1708B 4-Ch", patch_vt1708B),
-	HDA_CODEC_ENTRY(0x1106e726, "VT1708B 4-Ch", patch_vt1708B),
-	HDA_CODEC_ENTRY(0x1106e727, "VT1708B 4-Ch", patch_vt1708B),
-	HDA_CODEC_ENTRY(0x11060397, "VT1708S", patch_vt1708S),
-	HDA_CODEC_ENTRY(0x11061397, "VT1708S", patch_vt1708S),
-	HDA_CODEC_ENTRY(0x11062397, "VT1708S", patch_vt1708S),
-	HDA_CODEC_ENTRY(0x11063397, "VT1708S", patch_vt1708S),
-	HDA_CODEC_ENTRY(0x11064397, "VT1705", patch_vt1708S),
-	HDA_CODEC_ENTRY(0x11065397, "VT1708S", patch_vt1708S),
-	HDA_CODEC_ENTRY(0x11066397, "VT1708S", patch_vt1708S),
-	HDA_CODEC_ENTRY(0x11067397, "VT1708S", patch_vt1708S),
-	HDA_CODEC_ENTRY(0x11060398, "VT1702", patch_vt1702),
-	HDA_CODEC_ENTRY(0x11061398, "VT1702", patch_vt1702),
-	HDA_CODEC_ENTRY(0x11062398, "VT1702", patch_vt1702),
-	HDA_CODEC_ENTRY(0x11063398, "VT1702", patch_vt1702),
-	HDA_CODEC_ENTRY(0x11064398, "VT1702", patch_vt1702),
-	HDA_CODEC_ENTRY(0x11065398, "VT1702", patch_vt1702),
-	HDA_CODEC_ENTRY(0x11066398, "VT1702", patch_vt1702),
-	HDA_CODEC_ENTRY(0x11067398, "VT1702", patch_vt1702),
-	HDA_CODEC_ENTRY(0x11060428, "VT1718S", patch_vt1718S),
-	HDA_CODEC_ENTRY(0x11064428, "VT1718S", patch_vt1718S),
-	HDA_CODEC_ENTRY(0x11060441, "VT2020", patch_vt1718S),
-	HDA_CODEC_ENTRY(0x11064441, "VT1828S", patch_vt1718S),
-	HDA_CODEC_ENTRY(0x11060433, "VT1716S", patch_vt1716S),
-	HDA_CODEC_ENTRY(0x1106a721, "VT1716S", patch_vt1716S),
-	HDA_CODEC_ENTRY(0x11060438, "VT2002P", patch_vt2002P),
-	HDA_CODEC_ENTRY(0x11064438, "VT2002P", patch_vt2002P),
-	HDA_CODEC_ENTRY(0x11060448, "VT1812", patch_vt1812),
-	HDA_CODEC_ENTRY(0x11060440, "VT1818S", patch_vt1708S),
-	HDA_CODEC_ENTRY(0x11060446, "VT1802", patch_vt2002P),
-	HDA_CODEC_ENTRY(0x11068446, "VT1802", patch_vt2002P),
-	HDA_CODEC_ENTRY(0x11064760, "VT1705CF", patch_vt3476),
-	HDA_CODEC_ENTRY(0x11064761, "VT1708SCE", patch_vt3476),
-	HDA_CODEC_ENTRY(0x11064762, "VT1808", patch_vt3476),
+	HDA_CODEC_ID_MODEL(0x11061708, "VT1708", VT1708),
+	HDA_CODEC_ID_MODEL(0x11061709, "VT1708", VT1708),
+	HDA_CODEC_ID_MODEL(0x1106170a, "VT1708", VT1708),
+	HDA_CODEC_ID_MODEL(0x1106170b, "VT1708", VT1708),
+	HDA_CODEC_ID_MODEL(0x1106e710, "VT1709 10-Ch", VT1709),
+	HDA_CODEC_ID_MODEL(0x1106e711, "VT1709 10-Ch", VT1709),
+	HDA_CODEC_ID_MODEL(0x1106e712, "VT1709 10-Ch", VT1709),
+	HDA_CODEC_ID_MODEL(0x1106e713, "VT1709 10-Ch", VT1709),
+	HDA_CODEC_ID_MODEL(0x1106e714, "VT1709 6-Ch", VT1709),
+	HDA_CODEC_ID_MODEL(0x1106e715, "VT1709 6-Ch", VT1709),
+	HDA_CODEC_ID_MODEL(0x1106e716, "VT1709 6-Ch", VT1709),
+	HDA_CODEC_ID_MODEL(0x1106e717, "VT1709 6-Ch", VT1709),
+	HDA_CODEC_ID_MODEL(0x1106e720, "VT1708B 8-Ch", VT1708B),
+	HDA_CODEC_ID_MODEL(0x1106e721, "VT1708B 8-Ch", VT1708B),
+	HDA_CODEC_ID_MODEL(0x1106e722, "VT1708B 8-Ch", VT1708B),
+	HDA_CODEC_ID_MODEL(0x1106e723, "VT1708B 8-Ch", VT1708B),
+	HDA_CODEC_ID_MODEL(0x1106e724, "VT1708B 4-Ch", VT1708B),
+	HDA_CODEC_ID_MODEL(0x1106e725, "VT1708B 4-Ch", VT1708B),
+	HDA_CODEC_ID_MODEL(0x1106e726, "VT1708B 4-Ch", VT1708B),
+	HDA_CODEC_ID_MODEL(0x1106e727, "VT1708B 4-Ch", VT1708B),
+	HDA_CODEC_ID_MODEL(0x11060397, "VT1708S", VT1708S),
+	HDA_CODEC_ID_MODEL(0x11061397, "VT1708S", VT1708S),
+	HDA_CODEC_ID_MODEL(0x11062397, "VT1708S", VT1708S),
+	HDA_CODEC_ID_MODEL(0x11063397, "VT1708S", VT1708S),
+	HDA_CODEC_ID_MODEL(0x11064397, "VT1705", VT1708S),
+	HDA_CODEC_ID_MODEL(0x11065397, "VT1708S", VT1708S),
+	HDA_CODEC_ID_MODEL(0x11066397, "VT1708S", VT1708S),
+	HDA_CODEC_ID_MODEL(0x11067397, "VT1708S", VT1708S),
+	HDA_CODEC_ID_MODEL(0x11060398, "VT1702", VT1702),
+	HDA_CODEC_ID_MODEL(0x11061398, "VT1702", VT1702),
+	HDA_CODEC_ID_MODEL(0x11062398, "VT1702", VT1702),
+	HDA_CODEC_ID_MODEL(0x11063398, "VT1702", VT1702),
+	HDA_CODEC_ID_MODEL(0x11064398, "VT1702", VT1702),
+	HDA_CODEC_ID_MODEL(0x11065398, "VT1702", VT1702),
+	HDA_CODEC_ID_MODEL(0x11066398, "VT1702", VT1702),
+	HDA_CODEC_ID_MODEL(0x11067398, "VT1702", VT1702),
+	HDA_CODEC_ID_MODEL(0x11060428, "VT1718S", VT1718S),
+	HDA_CODEC_ID_MODEL(0x11064428, "VT1718S", VT1718S),
+	HDA_CODEC_ID_MODEL(0x11060441, "VT2020", VT1718S),
+	HDA_CODEC_ID_MODEL(0x11064441, "VT1828S", VT1718S),
+	HDA_CODEC_ID_MODEL(0x11060433, "VT1716S", VT1716S),
+	HDA_CODEC_ID_MODEL(0x1106a721, "VT1716S", VT1716S),
+	HDA_CODEC_ID_MODEL(0x11060438, "VT2002P", VT2002P),
+	HDA_CODEC_ID_MODEL(0x11064438, "VT2002P", VT2002P),
+	HDA_CODEC_ID_MODEL(0x11060448, "VT1812", VT1812),
+	HDA_CODEC_ID_MODEL(0x11060440, "VT1818S", VT1708S),
+	HDA_CODEC_ID_MODEL(0x11060446, "VT1802", VT2002P),
+	HDA_CODEC_ID_MODEL(0x11068446, "VT1802", VT2002P),
+	HDA_CODEC_ID_MODEL(0x11064760, "VT1705CF", VT3476),
+	HDA_CODEC_ID_MODEL(0x11064761, "VT1708SCE", VT3476),
+	HDA_CODEC_ID_MODEL(0x11064762, "VT1808", VT3476),
 	{} /* terminator */
 };
 MODULE_DEVICE_TABLE(hdaudio, snd_hda_id_via);
 
 static struct hda_codec_driver via_driver = {
 	.id = snd_hda_id_via,
+	.ops = &via_codec_ops,
 };
 
 MODULE_LICENSE("GPL");
-- 
2.50.0

