Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3243D2DA743
	for <linux-sound@vger.kernel.org>; Wed,  9 Jul 2025 16:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752077536; cv=none; b=LZav7EmUvTm4cXIX97uw59fJes9XOzjxlEOhV4nooWj5kaLJU1V3/fR6m2RFNHnpuvy2i4QpsF15UXQk56uW/4Fg2a9AQVya1RzIS5L8fQSJ6/L/xmOF5Hm5ZVFg5Qq5TRS3s0kc2Kd+i4b3nsWmCdKpDyq5nBLdG8DUvRFLuJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752077536; c=relaxed/simple;
	bh=zWQrH9FSIy3y3m1IW3onMP6TtYdSgOQoTgBcK8EHKnk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JL1y3bJsIwBuiIn/F/lg80yTuVsBwo2xHibZni8Im9ji+h4G+pd/mPWFgR36kVc0mVz9fYw/3nzcfeCJk5boE+yiYEfrESoYmvgaCLW06o6jULXSGXw/n5FlK/m7se5esLmraTnySHlYWe0GSvOG0Dqyky1z4E1YTUYa4kxSMOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lSJLUBtd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wgAovke4; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lSJLUBtd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wgAovke4; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lSJLUBtd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wgAovke4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lSJLUBtd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wgAovke4"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 275B921190;
	Wed,  9 Jul 2025 16:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752077099; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ObB4QT3Yiorr7Lu+288QNBp+llJ5Rd5YeMTlgiOwoRo=;
	b=lSJLUBtdOsTJsUbFB49PBCa4wbt6NVzhsqCD8DliZfUBsc2pjVVUP8sGrm0cJctMAqbnvu
	P3q6WhkthIR0aSbckAgUUu2uXD4/BUsRSRJqXkipuNinKgMR3XSCDRPzXWAUwTdKwtafkA
	AnRaSKSJFeLFxiBV4Ji6eSnuRjn1iP8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752077099;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ObB4QT3Yiorr7Lu+288QNBp+llJ5Rd5YeMTlgiOwoRo=;
	b=wgAovke44WbTKeaCRzLbUeAtIe5Ei2JgLXOtej52k6ylBVZU9KfiRywJ0XcJAcFMGqH9Wm
	ur6v2f0HYZHQ+sBQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=lSJLUBtd;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=wgAovke4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752077099; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ObB4QT3Yiorr7Lu+288QNBp+llJ5Rd5YeMTlgiOwoRo=;
	b=lSJLUBtdOsTJsUbFB49PBCa4wbt6NVzhsqCD8DliZfUBsc2pjVVUP8sGrm0cJctMAqbnvu
	P3q6WhkthIR0aSbckAgUUu2uXD4/BUsRSRJqXkipuNinKgMR3XSCDRPzXWAUwTdKwtafkA
	AnRaSKSJFeLFxiBV4Ji6eSnuRjn1iP8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752077099;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ObB4QT3Yiorr7Lu+288QNBp+llJ5Rd5YeMTlgiOwoRo=;
	b=wgAovke44WbTKeaCRzLbUeAtIe5Ei2JgLXOtej52k6ylBVZU9KfiRywJ0XcJAcFMGqH9Wm
	ur6v2f0HYZHQ+sBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C9CAD13998;
	Wed,  9 Jul 2025 16:04:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ILYcMCqTbmhDEAAAD6G6ig
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
Subject: [PATCH 21/27] ALSA: hda/sigmatel: Rewrite to new probe method
Date: Wed,  9 Jul 2025 18:04:24 +0200
Message-ID: <20250709160434.1859-22-tiwai@suse.de>
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
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 275B921190
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RL53w3f6h5bdz1qypc3i64rty7)];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01

Convert the Sigmatel/IDT codec driver to use the new hda_codec_ops
probe.  No functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/sigmatel.c | 398 ++++++++++++++++++------------------
 1 file changed, 203 insertions(+), 195 deletions(-)

diff --git a/sound/hda/codecs/sigmatel.c b/sound/hda/codecs/sigmatel.c
index 56274ff49b0b..ecbee408d771 100644
--- a/sound/hda/codecs/sigmatel.c
+++ b/sound/hda/codecs/sigmatel.c
@@ -2,7 +2,7 @@
 /*
  * Universal Interface for Intel High Definition Audio Codec
  *
- * HD audio interface patch for SigmaTel STAC92xx
+ * HD audio codec driver for SigmaTel STAC92xx
  *
  * Copyright (c) 2005 Embedded Alley Solutions, Inc.
  * Matt Porter <mporter@embeddedalley.com>
@@ -4391,8 +4391,6 @@ static int stac_init(struct hda_codec *codec)
 	return 0;
 }
 
-#define stac_free	snd_hda_gen_free
-
 #ifdef CONFIG_SND_PROC_FS
 static void stac92hd_proc_hook(struct snd_info_buffer *buffer,
 			       struct hda_codec *codec, hda_nid_t nid)
@@ -4454,15 +4452,6 @@ static int stac_suspend(struct hda_codec *codec)
 	return 0;
 }
 
-static const struct hda_codec_ops stac_patch_ops = {
-	.build_controls = snd_hda_gen_build_controls,
-	.build_pcms = snd_hda_gen_build_pcms,
-	.init = stac_init,
-	.free = stac_free,
-	.unsol_event = snd_hda_jack_unsol_event,
-	.suspend = stac_suspend,
-};
-
 static int alloc_stac_spec(struct hda_codec *codec)
 {
 	struct sigmatel_spec *spec;
@@ -4474,19 +4463,14 @@ static int alloc_stac_spec(struct hda_codec *codec)
 	codec->spec = spec;
 	codec->no_trigger_sense = 1; /* seems common with STAC/IDT codecs */
 	spec->gen.dac_min_mute = true;
-	codec->patch_ops = stac_patch_ops;
 	return 0;
 }
 
-static int patch_stac9200(struct hda_codec *codec)
+static int probe_stac9200(struct hda_codec *codec)
 {
 	struct sigmatel_spec *spec;
 	int err;
 
-	err = alloc_stac_spec(codec);
-	if (err < 0)
-		return err;
-
 	spec = codec->spec;
 	spec->linear_tone_beep = 1;
 	spec->gen.own_eapd_ctl = 1;
@@ -4500,25 +4484,19 @@ static int patch_stac9200(struct hda_codec *codec)
 	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PRE_PROBE);
 
 	err = stac_parse_auto_config(codec);
-	if (err < 0) {
-		stac_free(codec);
+	if (err < 0)
 		return err;
-	}
 
 	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PROBE);
 
 	return 0;
 }
 
-static int patch_stac925x(struct hda_codec *codec)
+static int probe_stac925x(struct hda_codec *codec)
 {
 	struct sigmatel_spec *spec;
 	int err;
 
-	err = alloc_stac_spec(codec);
-	if (err < 0)
-		return err;
-
 	spec = codec->spec;
 	spec->linear_tone_beep = 1;
 	spec->gen.own_eapd_ctl = 1;
@@ -4530,26 +4508,20 @@ static int patch_stac925x(struct hda_codec *codec)
 	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PRE_PROBE);
 
 	err = stac_parse_auto_config(codec);
-	if (err < 0) {
-		stac_free(codec);
+	if (err < 0)
 		return err;
-	}
 
 	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PROBE);
 
 	return 0;
 }
 
-static int patch_stac92hd73xx(struct hda_codec *codec)
+static int probe_stac92hd73xx(struct hda_codec *codec)
 {
 	struct sigmatel_spec *spec;
 	int err;
 	int num_dacs;
 
-	err = alloc_stac_spec(codec);
-	if (err < 0)
-		return err;
-
 	spec = codec->spec;
 	/* enable power_save_node only for new 92HD89xx chips, as it causes
 	 * click noises on old 92HD73xx chips.
@@ -4604,10 +4576,8 @@ static int patch_stac92hd73xx(struct hda_codec *codec)
 		snd_hda_add_verbs(codec, stac92hd73xx_core_init);
 
 	err = stac_parse_auto_config(codec);
-	if (err < 0) {
-		stac_free(codec);
+	if (err < 0)
 		return err;
-	}
 
 	/* Don't GPIO-mute speakers if there are no internal speakers, because
 	 * the GPIO might be necessary for Headphone
@@ -4646,15 +4616,11 @@ static void stac_setup_gpio(struct hda_codec *codec)
 	}
 }
 
-static int patch_stac92hd83xxx(struct hda_codec *codec)
+static int probe_stac92hd83xxx(struct hda_codec *codec)
 {
 	struct sigmatel_spec *spec;
 	int err;
 
-	err = alloc_stac_spec(codec);
-	if (err < 0)
-		return err;
-
 	/* longer delay needed for D3 */
 	codec->core.power_caps &= ~AC_PWRST_EPSS;
 
@@ -4679,10 +4645,8 @@ static int patch_stac92hd83xxx(struct hda_codec *codec)
 	stac_setup_gpio(codec);
 
 	err = stac_parse_auto_config(codec);
-	if (err < 0) {
-		stac_free(codec);
+	if (err < 0)
 		return err;
-	}
 
 	codec->proc_widget_hook = stac92hd_proc_hook;
 
@@ -4695,15 +4659,11 @@ static const hda_nid_t stac92hd95_pwr_nids[] = {
 	0x0a, 0x0b, 0x0c, 0x0d
 };
 
-static int patch_stac92hd95(struct hda_codec *codec)
+static int probe_stac92hd95(struct hda_codec *codec)
 {
 	struct sigmatel_spec *spec;
 	int err;
 
-	err = alloc_stac_spec(codec);
-	if (err < 0)
-		return err;
-
 	/* longer delay needed for D3 */
 	codec->core.power_caps &= ~AC_PWRST_EPSS;
 
@@ -4725,10 +4685,8 @@ static int patch_stac92hd95(struct hda_codec *codec)
 	stac_setup_gpio(codec);
 
 	err = stac_parse_auto_config(codec);
-	if (err < 0) {
-		stac_free(codec);
+	if (err < 0)
 		return err;
-	}
 
 	codec->proc_widget_hook = stac92hd_proc_hook;
 
@@ -4737,16 +4695,12 @@ static int patch_stac92hd95(struct hda_codec *codec)
 	return 0;
 }
 
-static int patch_stac92hd71bxx(struct hda_codec *codec)
+static int probe_stac92hd71bxx(struct hda_codec *codec)
 {
 	struct sigmatel_spec *spec;
 	const hda_nid_t *unmute_nids = stac92hd71bxx_unmute_nids;
 	int err;
 
-	err = alloc_stac_spec(codec);
-	if (err < 0)
-		return err;
-
 	spec = codec->spec;
 	/* disabled power_save_node since it causes noises on a Dell machine */
 	/* codec->power_save_node = 1; */
@@ -4809,10 +4763,8 @@ static int patch_stac92hd71bxx(struct hda_codec *codec)
 	stac_setup_gpio(codec);
 
 	err = stac_parse_auto_config(codec);
-	if (err < 0) {
-		stac_free(codec);
+	if (err < 0)
 		return err;
-	}
 
 	codec->proc_widget_hook = stac92hd7x_proc_hook;
 
@@ -4821,15 +4773,11 @@ static int patch_stac92hd71bxx(struct hda_codec *codec)
 	return 0;
 }
 
-static int patch_stac922x(struct hda_codec *codec)
+static int probe_stac922x(struct hda_codec *codec)
 {
 	struct sigmatel_spec *spec;
 	int err;
 
-	err = alloc_stac_spec(codec);
-	if (err < 0)
-		return err;
-
 	spec = codec->spec;
 	spec->linear_tone_beep = 1;
 	spec->gen.own_eapd_ctl = 1;
@@ -4848,10 +4796,8 @@ static int patch_stac922x(struct hda_codec *codec)
 	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PRE_PROBE);
 
 	err = stac_parse_auto_config(codec);
-	if (err < 0) {
-		stac_free(codec);
+	if (err < 0)
 		return err;
-	}
 
 	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PROBE);
 
@@ -4863,15 +4809,11 @@ static const char * const stac927x_spdif_labels[] = {
 	"Analog Mux 2", "Analog Mux 3", NULL
 };
 
-static int patch_stac927x(struct hda_codec *codec)
+static int probe_stac927x(struct hda_codec *codec)
 {
 	struct sigmatel_spec *spec;
 	int err;
 
-	err = alloc_stac_spec(codec);
-	if (err < 0)
-		return err;
-
 	spec = codec->spec;
 	spec->linear_tone_beep = 1;
 	spec->gen.own_eapd_ctl = 1;
@@ -4897,10 +4839,8 @@ static int patch_stac927x(struct hda_codec *codec)
 		snd_hda_add_verbs(codec, stac927x_core_init);
 
 	err = stac_parse_auto_config(codec);
-	if (err < 0) {
-		stac_free(codec);
+	if (err < 0)
 		return err;
-	}
 
 	codec->proc_widget_hook = stac927x_proc_hook;
 
@@ -4921,15 +4861,11 @@ static int patch_stac927x(struct hda_codec *codec)
 	return 0;
 }
 
-static int patch_stac9205(struct hda_codec *codec)
+static int probe_stac9205(struct hda_codec *codec)
 {
 	struct sigmatel_spec *spec;
 	int err;
 
-	err = alloc_stac_spec(codec);
-	if (err < 0)
-		return err;
-
 	spec = codec->spec;
 	spec->linear_tone_beep = 1;
 	spec->gen.own_eapd_ctl = 1;
@@ -4955,10 +4891,8 @@ static int patch_stac9205(struct hda_codec *codec)
 	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PRE_PROBE);
 
 	err = stac_parse_auto_config(codec);
-	if (err < 0) {
-		stac_free(codec);
+	if (err < 0)
 		return err;
-	}
 
 	codec->proc_widget_hook = stac9205_proc_hook;
 
@@ -5008,15 +4942,11 @@ static const struct hda_quirk stac9872_fixup_tbl[] = {
 	{} /* terminator */
 };
 
-static int patch_stac9872(struct hda_codec *codec)
+static int probe_stac9872(struct hda_codec *codec)
 {
 	struct sigmatel_spec *spec;
 	int err;
 
-	err = alloc_stac_spec(codec);
-	if (err < 0)
-		return err;
-
 	spec = codec->spec;
 	spec->linear_tone_beep = 1;
 	spec->gen.own_eapd_ctl = 1;
@@ -5028,125 +4958,202 @@ static int patch_stac9872(struct hda_codec *codec)
 	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PRE_PROBE);
 
 	err = stac_parse_auto_config(codec);
-	if (err < 0) {
-		stac_free(codec);
-		return -EINVAL;
-	}
+	if (err < 0)
+		return err;
 
 	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PROBE);
 
 	return 0;
 }
 
+/*
+ * common driver probe
+ */
+
+enum {
+	MODEL_STAC9200,
+	MODEL_STAC9205,
+	MODEL_STAC922X,
+	MODEL_STAC925X,
+	MODEL_STAC927X,
+	MODEL_STAC9872,
+	MODEL_STAC92HD71BXX,
+	MODEL_STAC92HD73XX,
+	MODEL_STAC92HD83XXX,
+	MODEL_STAC92HD95,
+};
+
+static int stac_probe(struct hda_codec *codec, const struct hda_device_id *id)
+{
+	int err;
+
+	err = alloc_stac_spec(codec);
+	if (err < 0)
+		return err;
+
+	switch (id->driver_data) {
+	case MODEL_STAC9200:
+		err = probe_stac9200(codec);
+		break;
+	case MODEL_STAC9205:
+		err = probe_stac9205(codec);
+		break;
+	case MODEL_STAC922X:
+		err = probe_stac922x(codec);
+		break;
+	case MODEL_STAC925X:
+		err = probe_stac925x(codec);
+		break;
+	case MODEL_STAC927X:
+		err = probe_stac927x(codec);
+		break;
+	case MODEL_STAC9872:
+		err = probe_stac9872(codec);
+		break;
+	case MODEL_STAC92HD71BXX:
+		err = probe_stac92hd71bxx(codec);
+		break;
+	case MODEL_STAC92HD73XX:
+		err = probe_stac92hd73xx(codec);
+		break;
+	case MODEL_STAC92HD83XXX:
+		err = probe_stac92hd83xxx(codec);
+		break;
+	case MODEL_STAC92HD95:
+		err = probe_stac92hd95(codec);
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
+static const struct hda_codec_ops stac_codec_ops = {
+	.probe = stac_probe,
+	.remove = snd_hda_gen_remove,
+	.build_controls = snd_hda_gen_build_controls,
+	.build_pcms = snd_hda_gen_build_pcms,
+	.init = stac_init,
+	.unsol_event = snd_hda_jack_unsol_event,
+	.suspend = stac_suspend,
+	.stream_pm = snd_hda_gen_stream_pm,
+};
 
 /*
- * patch entries
+ * driver entries
  */
 static const struct hda_device_id snd_hda_id_sigmatel[] = {
-	HDA_CODEC_ENTRY(0x83847690, "STAC9200", patch_stac9200),
-	HDA_CODEC_ENTRY(0x83847882, "STAC9220 A1", patch_stac922x),
-	HDA_CODEC_ENTRY(0x83847680, "STAC9221 A1", patch_stac922x),
-	HDA_CODEC_ENTRY(0x83847880, "STAC9220 A2", patch_stac922x),
-	HDA_CODEC_ENTRY(0x83847681, "STAC9220D/9223D A2", patch_stac922x),
-	HDA_CODEC_ENTRY(0x83847682, "STAC9221 A2", patch_stac922x),
-	HDA_CODEC_ENTRY(0x83847683, "STAC9221D A2", patch_stac922x),
-	HDA_CODEC_ENTRY(0x83847618, "STAC9227", patch_stac927x),
-	HDA_CODEC_ENTRY(0x83847619, "STAC9227", patch_stac927x),
-	HDA_CODEC_ENTRY(0x83847638, "STAC92HD700", patch_stac927x),
-	HDA_CODEC_ENTRY(0x83847616, "STAC9228", patch_stac927x),
-	HDA_CODEC_ENTRY(0x83847617, "STAC9228", patch_stac927x),
-	HDA_CODEC_ENTRY(0x83847614, "STAC9229", patch_stac927x),
-	HDA_CODEC_ENTRY(0x83847615, "STAC9229", patch_stac927x),
-	HDA_CODEC_ENTRY(0x83847620, "STAC9274", patch_stac927x),
-	HDA_CODEC_ENTRY(0x83847621, "STAC9274D", patch_stac927x),
-	HDA_CODEC_ENTRY(0x83847622, "STAC9273X", patch_stac927x),
-	HDA_CODEC_ENTRY(0x83847623, "STAC9273D", patch_stac927x),
-	HDA_CODEC_ENTRY(0x83847624, "STAC9272X", patch_stac927x),
-	HDA_CODEC_ENTRY(0x83847625, "STAC9272D", patch_stac927x),
-	HDA_CODEC_ENTRY(0x83847626, "STAC9271X", patch_stac927x),
-	HDA_CODEC_ENTRY(0x83847627, "STAC9271D", patch_stac927x),
-	HDA_CODEC_ENTRY(0x83847628, "STAC9274X5NH", patch_stac927x),
-	HDA_CODEC_ENTRY(0x83847629, "STAC9274D5NH", patch_stac927x),
-	HDA_CODEC_ENTRY(0x83847632, "STAC9202",  patch_stac925x),
-	HDA_CODEC_ENTRY(0x83847633, "STAC9202D", patch_stac925x),
-	HDA_CODEC_ENTRY(0x83847634, "STAC9250", patch_stac925x),
-	HDA_CODEC_ENTRY(0x83847635, "STAC9250D", patch_stac925x),
-	HDA_CODEC_ENTRY(0x83847636, "STAC9251", patch_stac925x),
-	HDA_CODEC_ENTRY(0x83847637, "STAC9250D", patch_stac925x),
-	HDA_CODEC_ENTRY(0x83847645, "92HD206X", patch_stac927x),
-	HDA_CODEC_ENTRY(0x83847646, "92HD206D", patch_stac927x),
+	HDA_CODEC_ID_MODEL(0x83847690, "STAC9200", MODEL_STAC9200),
+	HDA_CODEC_ID_MODEL(0x83847882, "STAC9220 A1", MODEL_STAC922X),
+	HDA_CODEC_ID_MODEL(0x83847680, "STAC9221 A1", MODEL_STAC922X),
+	HDA_CODEC_ID_MODEL(0x83847880, "STAC9220 A2", MODEL_STAC922X),
+	HDA_CODEC_ID_MODEL(0x83847681, "STAC9220D/9223D A2", MODEL_STAC922X),
+	HDA_CODEC_ID_MODEL(0x83847682, "STAC9221 A2", MODEL_STAC922X),
+	HDA_CODEC_ID_MODEL(0x83847683, "STAC9221D A2", MODEL_STAC922X),
+	HDA_CODEC_ID_MODEL(0x83847618, "STAC9227", MODEL_STAC927X),
+	HDA_CODEC_ID_MODEL(0x83847619, "STAC9227", MODEL_STAC927X),
+	HDA_CODEC_ID_MODEL(0x83847638, "STAC92HD700", MODEL_STAC927X),
+	HDA_CODEC_ID_MODEL(0x83847616, "STAC9228", MODEL_STAC927X),
+	HDA_CODEC_ID_MODEL(0x83847617, "STAC9228", MODEL_STAC927X),
+	HDA_CODEC_ID_MODEL(0x83847614, "STAC9229", MODEL_STAC927X),
+	HDA_CODEC_ID_MODEL(0x83847615, "STAC9229", MODEL_STAC927X),
+	HDA_CODEC_ID_MODEL(0x83847620, "STAC9274", MODEL_STAC927X),
+	HDA_CODEC_ID_MODEL(0x83847621, "STAC9274D", MODEL_STAC927X),
+	HDA_CODEC_ID_MODEL(0x83847622, "STAC9273X", MODEL_STAC927X),
+	HDA_CODEC_ID_MODEL(0x83847623, "STAC9273D", MODEL_STAC927X),
+	HDA_CODEC_ID_MODEL(0x83847624, "STAC9272X", MODEL_STAC927X),
+	HDA_CODEC_ID_MODEL(0x83847625, "STAC9272D", MODEL_STAC927X),
+	HDA_CODEC_ID_MODEL(0x83847626, "STAC9271X", MODEL_STAC927X),
+	HDA_CODEC_ID_MODEL(0x83847627, "STAC9271D", MODEL_STAC927X),
+	HDA_CODEC_ID_MODEL(0x83847628, "STAC9274X5NH", MODEL_STAC927X),
+	HDA_CODEC_ID_MODEL(0x83847629, "STAC9274D5NH", MODEL_STAC927X),
+	HDA_CODEC_ID_MODEL(0x83847632, "STAC9202",  MODEL_STAC925X),
+	HDA_CODEC_ID_MODEL(0x83847633, "STAC9202D", MODEL_STAC925X),
+	HDA_CODEC_ID_MODEL(0x83847634, "STAC9250", MODEL_STAC925X),
+	HDA_CODEC_ID_MODEL(0x83847635, "STAC9250D", MODEL_STAC925X),
+	HDA_CODEC_ID_MODEL(0x83847636, "STAC9251", MODEL_STAC925X),
+	HDA_CODEC_ID_MODEL(0x83847637, "STAC9250D", MODEL_STAC925X),
+	HDA_CODEC_ID_MODEL(0x83847645, "92HD206X", MODEL_STAC927X),
+	HDA_CODEC_ID_MODEL(0x83847646, "92HD206D", MODEL_STAC927X),
 	/* The following does not take into account .id=0x83847661 when subsys =
 	 * 104D0C00 which is STAC9225s. Because of this, some SZ Notebooks are
 	 * currently not fully supported.
 	 */
-	HDA_CODEC_ENTRY(0x83847661, "CXD9872RD/K", patch_stac9872),
-	HDA_CODEC_ENTRY(0x83847662, "STAC9872AK", patch_stac9872),
-	HDA_CODEC_ENTRY(0x83847664, "CXD9872AKD", patch_stac9872),
-	HDA_CODEC_ENTRY(0x83847698, "STAC9205", patch_stac9205),
-	HDA_CODEC_ENTRY(0x838476a0, "STAC9205", patch_stac9205),
-	HDA_CODEC_ENTRY(0x838476a1, "STAC9205D", patch_stac9205),
-	HDA_CODEC_ENTRY(0x838476a2, "STAC9204", patch_stac9205),
-	HDA_CODEC_ENTRY(0x838476a3, "STAC9204D", patch_stac9205),
-	HDA_CODEC_ENTRY(0x838476a4, "STAC9255", patch_stac9205),
-	HDA_CODEC_ENTRY(0x838476a5, "STAC9255D", patch_stac9205),
-	HDA_CODEC_ENTRY(0x838476a6, "STAC9254", patch_stac9205),
-	HDA_CODEC_ENTRY(0x838476a7, "STAC9254D", patch_stac9205),
-	HDA_CODEC_ENTRY(0x111d7603, "92HD75B3X5", patch_stac92hd71bxx),
-	HDA_CODEC_ENTRY(0x111d7604, "92HD83C1X5", patch_stac92hd83xxx),
-	HDA_CODEC_ENTRY(0x111d76d4, "92HD83C1C5", patch_stac92hd83xxx),
-	HDA_CODEC_ENTRY(0x111d7605, "92HD81B1X5", patch_stac92hd83xxx),
-	HDA_CODEC_ENTRY(0x111d76d5, "92HD81B1C5", patch_stac92hd83xxx),
-	HDA_CODEC_ENTRY(0x111d76d1, "92HD87B1/3", patch_stac92hd83xxx),
-	HDA_CODEC_ENTRY(0x111d76d9, "92HD87B2/4", patch_stac92hd83xxx),
-	HDA_CODEC_ENTRY(0x111d7666, "92HD88B3", patch_stac92hd83xxx),
-	HDA_CODEC_ENTRY(0x111d7667, "92HD88B1", patch_stac92hd83xxx),
-	HDA_CODEC_ENTRY(0x111d7668, "92HD88B2", patch_stac92hd83xxx),
-	HDA_CODEC_ENTRY(0x111d7669, "92HD88B4", patch_stac92hd83xxx),
-	HDA_CODEC_ENTRY(0x111d7608, "92HD75B2X5", patch_stac92hd71bxx),
-	HDA_CODEC_ENTRY(0x111d7674, "92HD73D1X5", patch_stac92hd73xx),
-	HDA_CODEC_ENTRY(0x111d7675, "92HD73C1X5", patch_stac92hd73xx),
-	HDA_CODEC_ENTRY(0x111d7676, "92HD73E1X5", patch_stac92hd73xx),
-	HDA_CODEC_ENTRY(0x111d7695, "92HD95", patch_stac92hd95),
-	HDA_CODEC_ENTRY(0x111d76b0, "92HD71B8X", patch_stac92hd71bxx),
-	HDA_CODEC_ENTRY(0x111d76b1, "92HD71B8X", patch_stac92hd71bxx),
-	HDA_CODEC_ENTRY(0x111d76b2, "92HD71B7X", patch_stac92hd71bxx),
-	HDA_CODEC_ENTRY(0x111d76b3, "92HD71B7X", patch_stac92hd71bxx),
-	HDA_CODEC_ENTRY(0x111d76b4, "92HD71B6X", patch_stac92hd71bxx),
-	HDA_CODEC_ENTRY(0x111d76b5, "92HD71B6X", patch_stac92hd71bxx),
-	HDA_CODEC_ENTRY(0x111d76b6, "92HD71B5X", patch_stac92hd71bxx),
-	HDA_CODEC_ENTRY(0x111d76b7, "92HD71B5X", patch_stac92hd71bxx),
-	HDA_CODEC_ENTRY(0x111d76c0, "92HD89C3", patch_stac92hd73xx),
-	HDA_CODEC_ENTRY(0x111d76c1, "92HD89C2", patch_stac92hd73xx),
-	HDA_CODEC_ENTRY(0x111d76c2, "92HD89C1", patch_stac92hd73xx),
-	HDA_CODEC_ENTRY(0x111d76c3, "92HD89B3", patch_stac92hd73xx),
-	HDA_CODEC_ENTRY(0x111d76c4, "92HD89B2", patch_stac92hd73xx),
-	HDA_CODEC_ENTRY(0x111d76c5, "92HD89B1", patch_stac92hd73xx),
-	HDA_CODEC_ENTRY(0x111d76c6, "92HD89E3", patch_stac92hd73xx),
-	HDA_CODEC_ENTRY(0x111d76c7, "92HD89E2", patch_stac92hd73xx),
-	HDA_CODEC_ENTRY(0x111d76c8, "92HD89E1", patch_stac92hd73xx),
-	HDA_CODEC_ENTRY(0x111d76c9, "92HD89D3", patch_stac92hd73xx),
-	HDA_CODEC_ENTRY(0x111d76ca, "92HD89D2", patch_stac92hd73xx),
-	HDA_CODEC_ENTRY(0x111d76cb, "92HD89D1", patch_stac92hd73xx),
-	HDA_CODEC_ENTRY(0x111d76cc, "92HD89F3", patch_stac92hd73xx),
-	HDA_CODEC_ENTRY(0x111d76cd, "92HD89F2", patch_stac92hd73xx),
-	HDA_CODEC_ENTRY(0x111d76ce, "92HD89F1", patch_stac92hd73xx),
-	HDA_CODEC_ENTRY(0x111d76df, "92HD93BXX", patch_stac92hd83xxx),
-	HDA_CODEC_ENTRY(0x111d76e0, "92HD91BXX", patch_stac92hd83xxx),
-	HDA_CODEC_ENTRY(0x111d76e3, "92HD98BXX", patch_stac92hd83xxx),
-	HDA_CODEC_ENTRY(0x111d76e5, "92HD99BXX", patch_stac92hd83xxx),
-	HDA_CODEC_ENTRY(0x111d76e7, "92HD90BXX", patch_stac92hd83xxx),
-	HDA_CODEC_ENTRY(0x111d76e8, "92HD66B1X5", patch_stac92hd83xxx),
-	HDA_CODEC_ENTRY(0x111d76e9, "92HD66B2X5", patch_stac92hd83xxx),
-	HDA_CODEC_ENTRY(0x111d76ea, "92HD66B3X5", patch_stac92hd83xxx),
-	HDA_CODEC_ENTRY(0x111d76eb, "92HD66C1X5", patch_stac92hd83xxx),
-	HDA_CODEC_ENTRY(0x111d76ec, "92HD66C2X5", patch_stac92hd83xxx),
-	HDA_CODEC_ENTRY(0x111d76ed, "92HD66C3X5", patch_stac92hd83xxx),
-	HDA_CODEC_ENTRY(0x111d76ee, "92HD66B1X3", patch_stac92hd83xxx),
-	HDA_CODEC_ENTRY(0x111d76ef, "92HD66B2X3", patch_stac92hd83xxx),
-	HDA_CODEC_ENTRY(0x111d76f0, "92HD66B3X3", patch_stac92hd83xxx),
-	HDA_CODEC_ENTRY(0x111d76f1, "92HD66C1X3", patch_stac92hd83xxx),
-	HDA_CODEC_ENTRY(0x111d76f2, "92HD66C2X3", patch_stac92hd83xxx),
-	HDA_CODEC_ENTRY(0x111d76f3, "92HD66C3/65", patch_stac92hd83xxx),
+	HDA_CODEC_ID_MODEL(0x83847661, "CXD9872RD/K", MODEL_STAC9872),
+	HDA_CODEC_ID_MODEL(0x83847662, "STAC9872AK", MODEL_STAC9872),
+	HDA_CODEC_ID_MODEL(0x83847664, "CXD9872AKD", MODEL_STAC9872),
+	HDA_CODEC_ID_MODEL(0x83847698, "STAC9205", MODEL_STAC9205),
+	HDA_CODEC_ID_MODEL(0x838476a0, "STAC9205", MODEL_STAC9205),
+	HDA_CODEC_ID_MODEL(0x838476a1, "STAC9205D", MODEL_STAC9205),
+	HDA_CODEC_ID_MODEL(0x838476a2, "STAC9204", MODEL_STAC9205),
+	HDA_CODEC_ID_MODEL(0x838476a3, "STAC9204D", MODEL_STAC9205),
+	HDA_CODEC_ID_MODEL(0x838476a4, "STAC9255", MODEL_STAC9205),
+	HDA_CODEC_ID_MODEL(0x838476a5, "STAC9255D", MODEL_STAC9205),
+	HDA_CODEC_ID_MODEL(0x838476a6, "STAC9254", MODEL_STAC9205),
+	HDA_CODEC_ID_MODEL(0x838476a7, "STAC9254D", MODEL_STAC9205),
+	HDA_CODEC_ID_MODEL(0x111d7603, "92HD75B3X5", MODEL_STAC92HD71BXX),
+	HDA_CODEC_ID_MODEL(0x111d7604, "92HD83C1X5", MODEL_STAC92HD83XXX),
+	HDA_CODEC_ID_MODEL(0x111d76d4, "92HD83C1C5", MODEL_STAC92HD83XXX),
+	HDA_CODEC_ID_MODEL(0x111d7605, "92HD81B1X5", MODEL_STAC92HD83XXX),
+	HDA_CODEC_ID_MODEL(0x111d76d5, "92HD81B1C5", MODEL_STAC92HD83XXX),
+	HDA_CODEC_ID_MODEL(0x111d76d1, "92HD87B1/3", MODEL_STAC92HD83XXX),
+	HDA_CODEC_ID_MODEL(0x111d76d9, "92HD87B2/4", MODEL_STAC92HD83XXX),
+	HDA_CODEC_ID_MODEL(0x111d7666, "92HD88B3", MODEL_STAC92HD83XXX),
+	HDA_CODEC_ID_MODEL(0x111d7667, "92HD88B1", MODEL_STAC92HD83XXX),
+	HDA_CODEC_ID_MODEL(0x111d7668, "92HD88B2", MODEL_STAC92HD83XXX),
+	HDA_CODEC_ID_MODEL(0x111d7669, "92HD88B4", MODEL_STAC92HD83XXX),
+	HDA_CODEC_ID_MODEL(0x111d7608, "92HD75B2X5", MODEL_STAC92HD71BXX),
+	HDA_CODEC_ID_MODEL(0x111d7674, "92HD73D1X5", MODEL_STAC92HD73XX),
+	HDA_CODEC_ID_MODEL(0x111d7675, "92HD73C1X5", MODEL_STAC92HD73XX),
+	HDA_CODEC_ID_MODEL(0x111d7676, "92HD73E1X5", MODEL_STAC92HD73XX),
+	HDA_CODEC_ID_MODEL(0x111d7695, "92HD95", MODEL_STAC92HD95),
+	HDA_CODEC_ID_MODEL(0x111d76b0, "92HD71B8X", MODEL_STAC92HD71BXX),
+	HDA_CODEC_ID_MODEL(0x111d76b1, "92HD71B8X", MODEL_STAC92HD71BXX),
+	HDA_CODEC_ID_MODEL(0x111d76b2, "92HD71B7X", MODEL_STAC92HD71BXX),
+	HDA_CODEC_ID_MODEL(0x111d76b3, "92HD71B7X", MODEL_STAC92HD71BXX),
+	HDA_CODEC_ID_MODEL(0x111d76b4, "92HD71B6X", MODEL_STAC92HD71BXX),
+	HDA_CODEC_ID_MODEL(0x111d76b5, "92HD71B6X", MODEL_STAC92HD71BXX),
+	HDA_CODEC_ID_MODEL(0x111d76b6, "92HD71B5X", MODEL_STAC92HD71BXX),
+	HDA_CODEC_ID_MODEL(0x111d76b7, "92HD71B5X", MODEL_STAC92HD71BXX),
+	HDA_CODEC_ID_MODEL(0x111d76c0, "92HD89C3", MODEL_STAC92HD73XX),
+	HDA_CODEC_ID_MODEL(0x111d76c1, "92HD89C2", MODEL_STAC92HD73XX),
+	HDA_CODEC_ID_MODEL(0x111d76c2, "92HD89C1", MODEL_STAC92HD73XX),
+	HDA_CODEC_ID_MODEL(0x111d76c3, "92HD89B3", MODEL_STAC92HD73XX),
+	HDA_CODEC_ID_MODEL(0x111d76c4, "92HD89B2", MODEL_STAC92HD73XX),
+	HDA_CODEC_ID_MODEL(0x111d76c5, "92HD89B1", MODEL_STAC92HD73XX),
+	HDA_CODEC_ID_MODEL(0x111d76c6, "92HD89E3", MODEL_STAC92HD73XX),
+	HDA_CODEC_ID_MODEL(0x111d76c7, "92HD89E2", MODEL_STAC92HD73XX),
+	HDA_CODEC_ID_MODEL(0x111d76c8, "92HD89E1", MODEL_STAC92HD73XX),
+	HDA_CODEC_ID_MODEL(0x111d76c9, "92HD89D3", MODEL_STAC92HD73XX),
+	HDA_CODEC_ID_MODEL(0x111d76ca, "92HD89D2", MODEL_STAC92HD73XX),
+	HDA_CODEC_ID_MODEL(0x111d76cb, "92HD89D1", MODEL_STAC92HD73XX),
+	HDA_CODEC_ID_MODEL(0x111d76cc, "92HD89F3", MODEL_STAC92HD73XX),
+	HDA_CODEC_ID_MODEL(0x111d76cd, "92HD89F2", MODEL_STAC92HD73XX),
+	HDA_CODEC_ID_MODEL(0x111d76ce, "92HD89F1", MODEL_STAC92HD73XX),
+	HDA_CODEC_ID_MODEL(0x111d76df, "92HD93BXX", MODEL_STAC92HD83XXX),
+	HDA_CODEC_ID_MODEL(0x111d76e0, "92HD91BXX", MODEL_STAC92HD83XXX),
+	HDA_CODEC_ID_MODEL(0x111d76e3, "92HD98BXX", MODEL_STAC92HD83XXX),
+	HDA_CODEC_ID_MODEL(0x111d76e5, "92HD99BXX", MODEL_STAC92HD83XXX),
+	HDA_CODEC_ID_MODEL(0x111d76e7, "92HD90BXX", MODEL_STAC92HD83XXX),
+	HDA_CODEC_ID_MODEL(0x111d76e8, "92HD66B1X5", MODEL_STAC92HD83XXX),
+	HDA_CODEC_ID_MODEL(0x111d76e9, "92HD66B2X5", MODEL_STAC92HD83XXX),
+	HDA_CODEC_ID_MODEL(0x111d76ea, "92HD66B3X5", MODEL_STAC92HD83XXX),
+	HDA_CODEC_ID_MODEL(0x111d76eb, "92HD66C1X5", MODEL_STAC92HD83XXX),
+	HDA_CODEC_ID_MODEL(0x111d76ec, "92HD66C2X5", MODEL_STAC92HD83XXX),
+	HDA_CODEC_ID_MODEL(0x111d76ed, "92HD66C3X5", MODEL_STAC92HD83XXX),
+	HDA_CODEC_ID_MODEL(0x111d76ee, "92HD66B1X3", MODEL_STAC92HD83XXX),
+	HDA_CODEC_ID_MODEL(0x111d76ef, "92HD66B2X3", MODEL_STAC92HD83XXX),
+	HDA_CODEC_ID_MODEL(0x111d76f0, "92HD66B3X3", MODEL_STAC92HD83XXX),
+	HDA_CODEC_ID_MODEL(0x111d76f1, "92HD66C1X3", MODEL_STAC92HD83XXX),
+	HDA_CODEC_ID_MODEL(0x111d76f2, "92HD66C2X3", MODEL_STAC92HD83XXX),
+	HDA_CODEC_ID_MODEL(0x111d76f3, "92HD66C3/65", MODEL_STAC92HD83XXX),
 	{} /* terminator */
 };
 MODULE_DEVICE_TABLE(hdaudio, snd_hda_id_sigmatel);
@@ -5156,6 +5163,7 @@ MODULE_DESCRIPTION("IDT/Sigmatel HD-audio codec");
 
 static struct hda_codec_driver sigmatel_driver = {
 	.id = snd_hda_id_sigmatel,
+	.ops = &stac_codec_ops,
 };
 
 module_hda_codec_driver(sigmatel_driver);
-- 
2.50.0

