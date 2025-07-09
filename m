Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66831E5B78
	for <linux-sound@vger.kernel.org>; Wed,  9 Jul 2025 16:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752077189; cv=none; b=NH+xTcnyr4JPr/8FRUj2yiQ1SQF9aekFhakdMr41/mhzGZBQFjR/8M0CKYH95uquQEejRGKsANXMyeBhtxKv1Ipo2GjGGNha3Kv9/I3n4EtPQt1GZ/XLmy3OLO/LDfYoQyrGY3NOd4nyex9+6tPE45pOUfgfrMdwLTj0v4zm6+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752077189; c=relaxed/simple;
	bh=cX3/n6ipuhpYv67VFNbqfPAz/Znp0tvdqoL/p7YLtlo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C3lDmOp0v2qbp6NJ9YIEI5qi0Epn33ZvImDc1vAfPxxuA7jVeBuZ0TBRy1xL7ODbeoc5+0orJlxHu/70b64qP76hVXHuJcCRIIMfc3veGZDBUqZRe1KBt+E/MGiAMUbHH42PwALnMBF7YHLAxkYnC9dctKixKXzbZspVByKqaYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sPfLHA1H; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=g4HYdcUJ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sPfLHA1H; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=g4HYdcUJ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sPfLHA1H";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="g4HYdcUJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sPfLHA1H";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="g4HYdcUJ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BF8B11F454;
	Wed,  9 Jul 2025 16:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752077093; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5DWXyn3hhsiC5NqMX5LKHkYGYZI+idQ9PSenbEjaJ5w=;
	b=sPfLHA1H4NtTBjkJAWSmrjgnesr1kdM26mHotgDToD0W1jEAvKRb+R5F15+SDQw51qvvft
	lEqnhGzNGk5j/pXIEPTFMVhCxXWaNx2VnOIkb7OvgiTXaLQU6ud1FpOvT05K7PrjqJ/7so
	rZk8+BXAvhTz3akVnL/6Uqi57Q1SDPI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752077093;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5DWXyn3hhsiC5NqMX5LKHkYGYZI+idQ9PSenbEjaJ5w=;
	b=g4HYdcUJBH5hjgee25dWilAhHxWVXVBtaGH0QEg7AnBwHr66CyvQc2J1KqZm5F5qCSHXE4
	KRNgyj6/Jug+l3BA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752077093; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5DWXyn3hhsiC5NqMX5LKHkYGYZI+idQ9PSenbEjaJ5w=;
	b=sPfLHA1H4NtTBjkJAWSmrjgnesr1kdM26mHotgDToD0W1jEAvKRb+R5F15+SDQw51qvvft
	lEqnhGzNGk5j/pXIEPTFMVhCxXWaNx2VnOIkb7OvgiTXaLQU6ud1FpOvT05K7PrjqJ/7so
	rZk8+BXAvhTz3akVnL/6Uqi57Q1SDPI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752077093;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5DWXyn3hhsiC5NqMX5LKHkYGYZI+idQ9PSenbEjaJ5w=;
	b=g4HYdcUJBH5hjgee25dWilAhHxWVXVBtaGH0QEg7AnBwHr66CyvQc2J1KqZm5F5qCSHXE4
	KRNgyj6/Jug+l3BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 70771136DC;
	Wed,  9 Jul 2025 16:04:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kCU/GiWTbmhDEAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 09 Jul 2025 16:04:53 +0000
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
Subject: [PATCH 13/27] ALSA: hda/analog: Rewrite to new probe method
Date: Wed,  9 Jul 2025 18:04:16 +0200
Message-ID: <20250709160434.1859-14-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_RATELIMIT(0.00)[to_ip_from(RL7bz5f8woybp4997xe1n6ecoy)];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

Convert the Analog Device codec driver to use the new hda_codec_ops
probe.  The probe function had to be unified and branched with the
model type specified via driver_data instead.

Other than that, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/analog.c | 221 +++++++++++++++++++-------------------
 1 file changed, 111 insertions(+), 110 deletions(-)

diff --git a/sound/hda/codecs/analog.c b/sound/hda/codecs/analog.c
index 3557e06c6d2b..33aaeb44c4dc 100644
--- a/sound/hda/codecs/analog.c
+++ b/sound/hda/codecs/analog.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * HD audio interface patch for AD1882, AD1884, AD1981HD, AD1983, AD1984,
+ * HD audio codec driver for AD1882, AD1884, AD1981HD, AD1983, AD1984,
  *   AD1986A, AD1988
  *
  * Copyright (c) 2005-2007 Takashi Iwai <tiwai@suse.de>
@@ -18,9 +18,18 @@
 #include "hda_jack.h"
 #include "generic.h"
 
+enum {
+	MODEL_AD1882,
+	MODEL_AD1884,
+	MODEL_AD1981,
+	MODEL_AD1983,
+	MODEL_AD1986A,
+	MODEL_AD1988,
+};
 
 struct ad198x_spec {
 	struct hda_gen_spec gen;
+	int model;
 
 	/* for auto parser */
 	int smux_paths[4];
@@ -111,7 +120,7 @@ static void ad198x_power_eapd(struct hda_codec *codec)
 	}
 }
 
-static int ad198x_suspend(struct hda_codec *codec)
+static int ad_codec_suspend(struct hda_codec *codec)
 {
 	snd_hda_shutup_pins(codec);
 	ad198x_power_eapd(codec);
@@ -137,7 +146,7 @@ static void ad_vmaster_eapd_hook(void *private_data, int enabled)
  * Automatic parse of I/O pins from the BIOS configuration
  */
 
-static int ad198x_auto_build_controls(struct hda_codec *codec)
+static int ad_codec_build_controls(struct hda_codec *codec)
 {
 	int err;
 
@@ -150,17 +159,6 @@ static int ad198x_auto_build_controls(struct hda_codec *codec)
 	return 0;
 }
 
-static const struct hda_codec_ops ad198x_auto_patch_ops = {
-	.build_controls = ad198x_auto_build_controls,
-	.build_pcms = snd_hda_gen_build_pcms,
-	.init = snd_hda_gen_init,
-	.free = snd_hda_gen_free,
-	.unsol_event = snd_hda_jack_unsol_event,
-	.check_power_status = snd_hda_gen_check_power_status,
-	.suspend = ad198x_suspend,
-};
-
-
 static int ad198x_parse_auto_config(struct hda_codec *codec, bool indep_hp)
 {
 	struct ad198x_spec *spec = codec->spec;
@@ -198,7 +196,6 @@ static int alloc_ad_spec(struct hda_codec *codec)
 		return -ENOMEM;
 	codec->spec = spec;
 	snd_hda_gen_spec_init(&spec->gen);
-	codec->patch_ops = ad198x_auto_patch_ops;
 	return 0;
 }
 
@@ -375,10 +372,10 @@ static const struct hda_model_fixup ad1986a_fixup_models[] = {
 
 /*
  */
-static int patch_ad1986a(struct hda_codec *codec)
+static int ad1986a_probe(struct hda_codec *codec)
 {
 	int err;
-	struct ad198x_spec *spec;
+	struct ad198x_spec *spec = codec->spec;
 	static const hda_nid_t preferred_pairs[] = {
 		0x1a, 0x03,
 		0x1b, 0x03,
@@ -388,11 +385,6 @@ static int patch_ad1986a(struct hda_codec *codec)
 		0
 	};
 
-	err = alloc_ad_spec(codec);
-	if (err < 0)
-		return err;
-	spec = codec->spec;
-
 	/* AD1986A has the inverted EAPD implementation */
 	codec->inv_eapd = 1;
 
@@ -418,10 +410,8 @@ static int patch_ad1986a(struct hda_codec *codec)
 	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PRE_PROBE);
 
 	err = ad198x_parse_auto_config(codec, false);
-	if (err < 0) {
-		snd_hda_gen_free(codec);
+	if (err < 0)
 		return err;
-	}
 
 	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PROBE);
 
@@ -507,18 +497,13 @@ static int ad1983_add_spdif_mux_ctl(struct hda_codec *codec)
 	return 0;
 }
 
-static int patch_ad1983(struct hda_codec *codec)
+static int ad1983_probe(struct hda_codec *codec)
 {
 	static const hda_nid_t conn_0c[] = { 0x08 };
 	static const hda_nid_t conn_0d[] = { 0x09 };
-	struct ad198x_spec *spec;
+	struct ad198x_spec *spec = codec->spec;
 	int err;
 
-	err = alloc_ad_spec(codec);
-	if (err < 0)
-		return err;
-	spec = codec->spec;
-
 	spec->gen.mixer_nid = 0x0e;
 	spec->gen.beep_nid = 0x10;
 	set_beep_amp(spec, 0x10, 0, HDA_OUTPUT);
@@ -529,15 +514,11 @@ static int patch_ad1983(struct hda_codec *codec)
 
 	err = ad198x_parse_auto_config(codec, false);
 	if (err < 0)
-		goto error;
+		return err;
 	err = ad1983_add_spdif_mux_ctl(codec);
 	if (err < 0)
-		goto error;
+		return err;
 	return 0;
-
- error:
-	snd_hda_gen_free(codec);
-	return err;
 }
 
 
@@ -597,16 +578,11 @@ static const struct hda_quirk ad1981_fixup_tbl[] = {
 	{}
 };
 
-static int patch_ad1981(struct hda_codec *codec)
+static int ad1981_probe(struct hda_codec *codec)
 {
-	struct ad198x_spec *spec;
+	struct ad198x_spec *spec = codec->spec;
 	int err;
 
-	err = alloc_ad_spec(codec);
-	if (err < 0)
-		return -ENOMEM;
-	spec = codec->spec;
-
 	spec->gen.mixer_nid = 0x0e;
 	spec->gen.beep_nid = 0x10;
 	set_beep_amp(spec, 0x0d, 0, HDA_OUTPUT);
@@ -616,18 +592,14 @@ static int patch_ad1981(struct hda_codec *codec)
 
 	err = ad198x_parse_auto_config(codec, false);
 	if (err < 0)
-		goto error;
+		return err;
 	err = ad1983_add_spdif_mux_ctl(codec);
 	if (err < 0)
-		goto error;
+		return err;
 
 	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PROBE);
 
 	return 0;
-
- error:
-	snd_hda_gen_free(codec);
-	return err;
 }
 
 
@@ -776,7 +748,7 @@ static const struct snd_kcontrol_new ad1988_auto_smux_mixer = {
 	.put = ad1988_auto_smux_enum_put,
 };
 
-static int ad1988_auto_init(struct hda_codec *codec)
+static int ad_codec_init(struct hda_codec *codec)
 {
 	struct ad198x_spec *spec = codec->spec;
 	int i, err;
@@ -784,6 +756,8 @@ static int ad1988_auto_init(struct hda_codec *codec)
 	err = snd_hda_gen_init(codec);
 	if (err < 0)
 		return err;
+	if (spec->model != MODEL_AD1988)
+		return 0;
 	if (!spec->gen.autocfg.dig_outs)
 		return 0;
 
@@ -854,8 +828,6 @@ static int ad1988_add_spdif_mux_ctl(struct hda_codec *codec)
 	if (!snd_hda_gen_add_kctl(&spec->gen, NULL, &ad1988_auto_smux_mixer))
 		return -ENOMEM;
 
-	codec->patch_ops.init = ad1988_auto_init;
-
 	return 0;
 }
 
@@ -889,16 +861,11 @@ static const struct hda_model_fixup ad1988_fixup_models[] = {
 	{}
 };
 
-static int patch_ad1988(struct hda_codec *codec)
+static int ad1988_probe(struct hda_codec *codec)
 {
-	struct ad198x_spec *spec;
+	struct ad198x_spec *spec = codec->spec;
 	int err;
 
-	err = alloc_ad_spec(codec);
-	if (err < 0)
-		return err;
-	spec = codec->spec;
-
 	spec->gen.mixer_nid = 0x20;
 	spec->gen.mixer_merge_nid = 0x21;
 	spec->gen.beep_nid = 0x10;
@@ -909,18 +876,14 @@ static int patch_ad1988(struct hda_codec *codec)
 
 	err = ad198x_parse_auto_config(codec, true);
 	if (err < 0)
-		goto error;
+		return err;
 	err = ad1988_add_spdif_mux_ctl(codec);
 	if (err < 0)
-		goto error;
+		return err;
 
 	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PROBE);
 
 	return 0;
-
- error:
-	snd_hda_gen_free(codec);
-	return err;
 }
 
 
@@ -1069,16 +1032,11 @@ static const struct hda_quirk ad1884_fixup_tbl[] = {
 };
 
 
-static int patch_ad1884(struct hda_codec *codec)
+static int ad1884_probe(struct hda_codec *codec)
 {
-	struct ad198x_spec *spec;
+	struct ad198x_spec *spec = codec->spec;
 	int err;
 
-	err = alloc_ad_spec(codec);
-	if (err < 0)
-		return err;
-	spec = codec->spec;
-
 	spec->gen.mixer_nid = 0x20;
 	spec->gen.mixer_merge_nid = 0x21;
 	spec->gen.beep_nid = 0x10;
@@ -1089,18 +1047,14 @@ static int patch_ad1884(struct hda_codec *codec)
 
 	err = ad198x_parse_auto_config(codec, true);
 	if (err < 0)
-		goto error;
+		return err;
 	err = ad1983_add_spdif_mux_ctl(codec);
 	if (err < 0)
-		goto error;
+		return err;
 
 	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PROBE);
 
 	return 0;
-
- error:
-	snd_hda_gen_free(codec);
-	return err;
 }
 
 /*
@@ -1115,53 +1069,99 @@ static int patch_ad1884(struct hda_codec *codec)
  * port-G - rear clfe-out (6stack)
  */
 
-static int patch_ad1882(struct hda_codec *codec)
+static int ad1882_probe(struct hda_codec *codec)
 {
-	struct ad198x_spec *spec;
+	struct ad198x_spec *spec = codec->spec;
 	int err;
 
-	err = alloc_ad_spec(codec);
-	if (err < 0)
-		return err;
-	spec = codec->spec;
-
 	spec->gen.mixer_nid = 0x20;
 	spec->gen.mixer_merge_nid = 0x21;
 	spec->gen.beep_nid = 0x10;
 	set_beep_amp(spec, 0x10, 0, HDA_OUTPUT);
 	err = ad198x_parse_auto_config(codec, true);
 	if (err < 0)
-		goto error;
+		return err;
 	err = ad1988_add_spdif_mux_ctl(codec);
 	if (err < 0)
-		goto error;
+		return err;
 	return 0;
-
- error:
-	snd_hda_gen_free(codec);
-	return err;
 }
 
-
 /*
- * patch entries
+ * driver entries
  */
+static int ad_codec_probe(struct hda_codec *codec,
+			  const struct hda_device_id *id)
+{
+	struct ad198x_spec *spec;
+	int err;
+
+	err = alloc_ad_spec(codec);
+	if (err < 0)
+		return -ENOMEM;
+	spec = codec->spec;
+	spec->model = id->driver_data;
+
+	switch (spec->model) {
+	case MODEL_AD1882:
+		err = ad1882_probe(codec);
+		break;
+	case MODEL_AD1884:
+		err = ad1884_probe(codec);
+		break;
+	case MODEL_AD1981:
+		err = ad1981_probe(codec);
+		break;
+	case MODEL_AD1983:
+		err = ad1983_probe(codec);
+		break;
+	case MODEL_AD1986A:
+		err = ad1986a_probe(codec);
+		break;
+	case MODEL_AD1988:
+		err = ad1988_probe(codec);
+		break;
+	default:
+		err = -EINVAL;
+		break;
+	}
+
+	if (err < 0) {
+		snd_hda_gen_remove(codec);
+		return err;
+	}
+
+	return 0;
+}
+
+static const struct hda_codec_ops ad_codec_ops = {
+	.probe = ad_codec_probe,
+	.remove = snd_hda_gen_remove,
+	.build_controls = ad_codec_build_controls,
+	.build_pcms = snd_hda_gen_build_pcms,
+	.init = ad_codec_init,
+	.unsol_event = snd_hda_jack_unsol_event,
+	.suspend = ad_codec_suspend,
+	.check_power_status = snd_hda_gen_check_power_status,
+	.stream_pm = snd_hda_gen_stream_pm,
+};
+
 static const struct hda_device_id snd_hda_id_analog[] = {
-	HDA_CODEC_ENTRY(0x11d4184a, "AD1884A", patch_ad1884),
-	HDA_CODEC_ENTRY(0x11d41882, "AD1882", patch_ad1882),
-	HDA_CODEC_ENTRY(0x11d41883, "AD1883", patch_ad1884),
-	HDA_CODEC_ENTRY(0x11d41884, "AD1884", patch_ad1884),
-	HDA_CODEC_ENTRY(0x11d4194a, "AD1984A", patch_ad1884),
-	HDA_CODEC_ENTRY(0x11d4194b, "AD1984B", patch_ad1884),
-	HDA_CODEC_ENTRY(0x11d41981, "AD1981", patch_ad1981),
-	HDA_CODEC_ENTRY(0x11d41983, "AD1983", patch_ad1983),
-	HDA_CODEC_ENTRY(0x11d41984, "AD1984", patch_ad1884),
-	HDA_CODEC_ENTRY(0x11d41986, "AD1986A", patch_ad1986a),
-	HDA_CODEC_ENTRY(0x11d41988, "AD1988", patch_ad1988),
-	HDA_CODEC_ENTRY(0x11d4198b, "AD1988B", patch_ad1988),
-	HDA_CODEC_ENTRY(0x11d4882a, "AD1882A", patch_ad1882),
-	HDA_CODEC_ENTRY(0x11d4989a, "AD1989A", patch_ad1988),
-	HDA_CODEC_ENTRY(0x11d4989b, "AD1989B", patch_ad1988),
+	HDA_CODEC_ID_MODEL(0x11d4184a, "AD1884A", MODEL_AD1884),
+	HDA_CODEC_ID_MODEL(0x11d41882, "AD1882", MODEL_AD1882),
+	HDA_CODEC_ID_MODEL(0x11d41883, "AD1883", MODEL_AD1884),
+	HDA_CODEC_ID_MODEL(0x11d41884, "AD1884", MODEL_AD1884),
+	HDA_CODEC_ID_MODEL(0x11d4194a, "AD1984A", MODEL_AD1884),
+	HDA_CODEC_ID_MODEL(0x11d4194b, "AD1984B", MODEL_AD1884),
+	HDA_CODEC_ID_MODEL(0x11d41981, "AD1981", MODEL_AD1981),
+	HDA_CODEC_ID_MODEL(0x11d41983, "AD1983", MODEL_AD1983),
+	HDA_CODEC_ID_MODEL(0x11d41984, "AD1984", MODEL_AD1884),
+	HDA_CODEC_ID_MODEL(0x11d41986, "AD1986A", MODEL_AD1986A),
+	HDA_CODEC_ID_MODEL(0x11d41988, "AD1988", MODEL_AD1988),
+	HDA_CODEC_ID_MODEL(0x11d4198b, "AD1988B", MODEL_AD1988),
+	HDA_CODEC_ID_MODEL(0x11d4882a, "AD1882A", MODEL_AD1882),
+	HDA_CODEC_ID_MODEL(0x11d4989a, "AD1989A", MODEL_AD1988),
+	HDA_CODEC_ID_MODEL(0x11d4989b, "AD1989B", MODEL_AD1988),
 	{} /* terminator */
 };
 MODULE_DEVICE_TABLE(hdaudio, snd_hda_id_analog);
@@ -1171,6 +1171,7 @@ MODULE_DESCRIPTION("Analog Devices HD-audio codec");
 
 static struct hda_codec_driver analog_driver = {
 	.id = snd_hda_id_analog,
+	.ops = &ad_codec_ops,
 };
 
 module_hda_codec_driver(analog_driver);
-- 
2.50.0

