Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5412C0327
	for <linux-sound@vger.kernel.org>; Wed,  9 Jul 2025 16:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752077557; cv=none; b=u89Ukku1jqB6eMLczzI/5hYpDQFTEgUcAv6WF3SFp4uGgslGfirRD6BJlBWlk/Iq9GfsIoBJCZsdmX1sb62DfzEAemr5H6Pmkwe5hWWvfaswhGENc1srYR+GjJF7ASfMPdMfKz4gvPPMAmgpgJ+o6eTweLH3TgIAUXVcXzpZ0Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752077557; c=relaxed/simple;
	bh=/IQE+EE1W9MAfeu2dDsAiigQR2WQzBs3TtFdju5e8ek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dBV2+uPnMAB91f8miqE03g19V1NAKfNxv/9EEtxzpYmfN93iT7hifjyl4Q3gw0jRdamOMCOacAsIY3DA/p40HjcabsYRhrS+vnD9+IWWlwwgXlRP2vt2P2kSxich7CL7X9srFyyRKOVhyvPIIaII7g5ZRf47JFz43NngfB0ZXLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=a3nxTJJI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JoPfiPoc; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=a3nxTJJI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JoPfiPoc; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="a3nxTJJI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JoPfiPoc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="a3nxTJJI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JoPfiPoc"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BAE5621185;
	Wed,  9 Jul 2025 16:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752077095; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lFJjNVWvWvDtamKU4xxN67+0rzZHtBQisZlSUsn3Nac=;
	b=a3nxTJJIwS/oeRsuzy9nIDUbDcYSg8vwurATOT/88WtcYSCaIfpZyNnynz8C2JNMVgFBtv
	Yd7Bpw+poTuq61eUSmCN3yXmZ7Zt9yRgwi+JK/7BeoEciIZ/tAL0y0LI5AruGBwJkOApQ9
	u9HXumyH2IoHw0z4HpdW4/fjYqMZO8o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752077095;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lFJjNVWvWvDtamKU4xxN67+0rzZHtBQisZlSUsn3Nac=;
	b=JoPfiPocSH6xhs+sw7f9Hv5zUN3vXKrfQN7uhgl2/SJ327hNKxhQyUP7Kx+9MvT0TOtNdn
	uewVoqOYDUgJD6Aw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752077095; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lFJjNVWvWvDtamKU4xxN67+0rzZHtBQisZlSUsn3Nac=;
	b=a3nxTJJIwS/oeRsuzy9nIDUbDcYSg8vwurATOT/88WtcYSCaIfpZyNnynz8C2JNMVgFBtv
	Yd7Bpw+poTuq61eUSmCN3yXmZ7Zt9yRgwi+JK/7BeoEciIZ/tAL0y0LI5AruGBwJkOApQ9
	u9HXumyH2IoHw0z4HpdW4/fjYqMZO8o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752077095;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lFJjNVWvWvDtamKU4xxN67+0rzZHtBQisZlSUsn3Nac=;
	b=JoPfiPocSH6xhs+sw7f9Hv5zUN3vXKrfQN7uhgl2/SJ327hNKxhQyUP7Kx+9MvT0TOtNdn
	uewVoqOYDUgJD6Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 799CD136DC;
	Wed,  9 Jul 2025 16:04:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +LyNHCeTbmhDEAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 09 Jul 2025 16:04:55 +0000
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
Subject: [PATCH 16/27] ALSA: hda/cs8409: Rewrite to new probe method
Date: Wed,  9 Jul 2025 18:04:19 +0200
Message-ID: <20250709160434.1859-17-tiwai@suse.de>
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
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	R_RATELIMIT(0.00)[to_ip_from(RL7bz5f8woybp4997xe1n6ecoy)];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -2.80

Convert the CS8409 codec driver to use the new hda_codec_ops probe.
The Dolphin support needs an override of unsol_event callback, and
redirect via spec->unsol_event function pointer for now.

Other than that, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/cirrus/cs8409-tables.c |  2 +-
 sound/hda/codecs/cirrus/cs8409.c        | 55 +++++++++++++------------
 sound/hda/codecs/cirrus/cs8409.h        |  4 +-
 3 files changed, 33 insertions(+), 28 deletions(-)

diff --git a/sound/hda/codecs/cirrus/cs8409-tables.c b/sound/hda/codecs/cirrus/cs8409-tables.c
index 5fe49f13c0da..8c703b714a71 100644
--- a/sound/hda/codecs/cirrus/cs8409-tables.c
+++ b/sound/hda/codecs/cirrus/cs8409-tables.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * cs8409-tables.c  --  HD audio interface patch for Cirrus Logic CS8409 HDA bridge chip
+ * cs8409-tables.c  --  HD audio codec driver for Cirrus Logic CS8409 HDA bridge chip
  *
  * Copyright (C) 2021 Cirrus Logic, Inc. and
  *                    Cirrus Logic International Semiconductor Ltd.
diff --git a/sound/hda/codecs/cirrus/cs8409.c b/sound/hda/codecs/cirrus/cs8409.c
index 5ec1126b2a55..e32b462cdc5e 100644
--- a/sound/hda/codecs/cirrus/cs8409.c
+++ b/sound/hda/codecs/cirrus/cs8409.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * HD audio interface patch for Cirrus Logic CS8409 HDA bridge chip
+ * HD audio codec driver for Cirrus Logic CS8409 HDA bridge chip
  *
  * Copyright (C) 2021 Cirrus Logic, Inc. and
  *                    Cirrus Logic International Semiconductor Ltd.
@@ -954,7 +954,7 @@ static void cs42l42_suspend(struct sub_codec *cs42l42)
 	snd_hda_codec_write(codec, CS8409_PIN_AFG, 0, AC_VERB_SET_GPIO_DATA, spec->gpio_data);
 }
 
-static void cs8409_free(struct hda_codec *codec)
+static void cs8409_remove(struct hda_codec *codec)
 {
 	struct cs8409_spec *spec = codec->spec;
 
@@ -962,7 +962,7 @@ static void cs8409_free(struct hda_codec *codec)
 	cancel_delayed_work_sync(&spec->i2c_clk_work);
 	cs8409_disable_i2c_clock(codec);
 
-	snd_hda_gen_free(codec);
+	snd_hda_gen_remove(codec);
 }
 
 /******************************************************************************
@@ -1007,6 +1007,16 @@ static void cs8409_cs42l42_jack_unsol_event(struct hda_codec *codec, unsigned in
 	}
 }
 
+static void cs8409_unsol_event(struct hda_codec *codec, unsigned int res)
+{
+	struct cs8409_spec *spec = codec->spec;
+
+	if (spec->unsol_event)
+		spec->unsol_event(codec, res);
+	else
+		cs8409_cs42l42_jack_unsol_event(codec, res);
+}
+
 /* Manage PDREF, when transition to D3hot */
 static int cs8409_cs42l42_suspend(struct hda_codec *codec)
 {
@@ -1076,15 +1086,6 @@ static void cs8409_cs42l42_hw_init(struct hda_codec *codec)
 	cs8409_enable_ur(codec, 1);
 }
 
-static const struct hda_codec_ops cs8409_cs42l42_patch_ops = {
-	.build_controls = cs8409_build_controls,
-	.build_pcms = snd_hda_gen_build_pcms,
-	.init = cs8409_init,
-	.free = cs8409_free,
-	.unsol_event = cs8409_cs42l42_jack_unsol_event,
-	.suspend = cs8409_cs42l42_suspend,
-};
-
 static int cs8409_cs42l42_exec_verb(struct hdac_device *dev, unsigned int cmd, unsigned int flags,
 				    unsigned int *res)
 {
@@ -1134,7 +1135,6 @@ void cs8409_cs42l42_fixups(struct hda_codec *codec, const struct hda_fixup *fix,
 		spec->scodecs[CS8409_CODEC0] = &cs8409_cs42l42_codec;
 		spec->num_scodecs = 1;
 		spec->scodecs[CS8409_CODEC0]->codec = codec;
-		codec->patch_ops = cs8409_cs42l42_patch_ops;
 
 		spec->gen.suppress_auto_mute = 1;
 		spec->gen.no_primary_hp = 1;
@@ -1304,15 +1304,6 @@ static void dolphin_hw_init(struct hda_codec *codec)
 	cs8409_enable_ur(codec, 1);
 }
 
-static const struct hda_codec_ops cs8409_dolphin_patch_ops = {
-	.build_controls = cs8409_build_controls,
-	.build_pcms = snd_hda_gen_build_pcms,
-	.init = cs8409_init,
-	.free = cs8409_free,
-	.unsol_event = dolphin_jack_unsol_event,
-	.suspend = cs8409_cs42l42_suspend,
-};
-
 static int dolphin_exec_verb(struct hdac_device *dev, unsigned int cmd, unsigned int flags,
 			     unsigned int *res)
 {
@@ -1371,7 +1362,7 @@ void dolphin_fixups(struct hda_codec *codec, const struct hda_fixup *fix, int ac
 		spec->num_scodecs = 2;
 		spec->gen.suppress_vmaster = 1;
 
-		codec->patch_ops = cs8409_dolphin_patch_ops;
+		spec->unsol_event = dolphin_jack_unsol_event;
 
 		/* GPIO 1,5 out, 0,4 in */
 		spec->gpio_dir = spec->scodecs[CS8409_CODEC0]->reset_gpio |
@@ -1444,7 +1435,7 @@ void dolphin_fixups(struct hda_codec *codec, const struct hda_fixup *fix, int ac
 	}
 }
 
-static int patch_cs8409(struct hda_codec *codec)
+static int cs8409_probe(struct hda_codec *codec, const struct hda_device_id *id)
 {
 	int err;
 
@@ -1461,7 +1452,7 @@ static int patch_cs8409(struct hda_codec *codec)
 
 	err = cs8409_parse_auto_config(codec);
 	if (err < 0) {
-		cs8409_free(codec);
+		cs8409_remove(codec);
 		return err;
 	}
 
@@ -1469,14 +1460,26 @@ static int patch_cs8409(struct hda_codec *codec)
 	return 0;
 }
 
+static const struct hda_codec_ops cs8409_codec_ops = {
+	.probe = cs8409_probe,
+	.remove = cs8409_remove,
+	.build_controls = cs8409_build_controls,
+	.build_pcms = snd_hda_gen_build_pcms,
+	.init = cs8409_init,
+	.unsol_event = cs8409_unsol_event,
+	.suspend = cs8409_cs42l42_suspend,
+	.stream_pm = snd_hda_gen_stream_pm,
+};
+
 static const struct hda_device_id snd_hda_id_cs8409[] = {
-	HDA_CODEC_ENTRY(0x10138409, "CS8409", patch_cs8409),
+	HDA_CODEC_ID(0x10138409, "CS8409"),
 	{} /* terminator */
 };
 MODULE_DEVICE_TABLE(hdaudio, snd_hda_id_cs8409);
 
 static struct hda_codec_driver cs8409_driver = {
 	.id = snd_hda_id_cs8409,
+	.ops = &cs8409_codec_ops,
 };
 module_hda_codec_driver(cs8409_driver);
 
diff --git a/sound/hda/codecs/cirrus/cs8409.h b/sound/hda/codecs/cirrus/cs8409.h
index 35072cd009dc..7fe56f4a73bc 100644
--- a/sound/hda/codecs/cirrus/cs8409.h
+++ b/sound/hda/codecs/cirrus/cs8409.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
- * HD audio interface patch for Cirrus Logic CS8409 HDA bridge chip
+ * HD audio codec driver for Cirrus Logic CS8409 HDA bridge chip
  *
  * Copyright (C) 2021 Cirrus Logic, Inc. and
  *                    Cirrus Logic International Semiconductor Ltd.
@@ -345,6 +345,8 @@ struct cs8409_spec {
 	/* verb exec op override */
 	int (*exec_verb)(struct hdac_device *dev, unsigned int cmd, unsigned int flags,
 			 unsigned int *res);
+	/* unsol_event op override */
+	void (*unsol_event)(struct hda_codec *codec, unsigned int res);
 };
 
 extern const struct snd_kcontrol_new cs42l42_dac_volume_mixer;
-- 
2.50.0

