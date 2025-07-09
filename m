Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1823F1482E7
	for <linux-sound@vger.kernel.org>; Wed,  9 Jul 2025 16:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752077197; cv=none; b=f8NBWoVilkpH36xlBwnNCpyC7vjy/1FMy1x+26Br5UFGEXSWIeDoJZStRlEuL6BAWjrO57X4MT22DQ2QyldJZOPpwawJ++JpGcOJe8c8/wkEOLdwW76VIhQzn82CGjmnFVQ57EbLpOE9qADa1JQIv5O2CcVjSz5SCTDirD1vMS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752077197; c=relaxed/simple;
	bh=3ng9wV+8DRzdt5fQ0JXPQI+DYUtKvce0heulGRA/xqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H+ROoBIEX0hp3BFEfWzU6CWijlkaEW+e2E3yOM5UMXQfHcyWjgt6HOAD/6xA2DPHweKu2kruFr4d9w75G5BYAwtoFZk+X2Rr7QSR3PgrXjanTBdgE6XPNYfv9KMFQkLWDgz4+sXN/jieGEDaAE0ssc8gu17G6xxkIFi9VPJDtLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Fa/8arPe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0ygMbp11; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Fa/8arPe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0ygMbp11; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Fa/8arPe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0ygMbp11";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Fa/8arPe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0ygMbp11"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 114431F443;
	Wed,  9 Jul 2025 16:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752077095; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oDe8Vb5HtxXaMcw20jRItFisQo4JBtJgdy+F7v15rxw=;
	b=Fa/8arPegJLfJZxsmjc+uIgyMc3MTtDOZKv2z0AgOu7NC80VP4mk22sToqVKTwwdXs0Dcr
	SP89VOeK8QZckLwhwynKvPfbbtBtWKL8Ng2ZjeebcXWlholxaTrXllNz0IjMCAo4a7fGSd
	tE7wZCg2oyO21ciwAqK+XRAbNjGiMM0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752077095;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oDe8Vb5HtxXaMcw20jRItFisQo4JBtJgdy+F7v15rxw=;
	b=0ygMbp11xkfzpEkWOJLGuPHyxS0CUDfzavz6DzKeH6tVlzh2DetxEsiW58shhufPP4ZQJd
	HF3GL0a0oyvtnSDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="Fa/8arPe";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=0ygMbp11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752077095; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oDe8Vb5HtxXaMcw20jRItFisQo4JBtJgdy+F7v15rxw=;
	b=Fa/8arPegJLfJZxsmjc+uIgyMc3MTtDOZKv2z0AgOu7NC80VP4mk22sToqVKTwwdXs0Dcr
	SP89VOeK8QZckLwhwynKvPfbbtBtWKL8Ng2ZjeebcXWlholxaTrXllNz0IjMCAo4a7fGSd
	tE7wZCg2oyO21ciwAqK+XRAbNjGiMM0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752077095;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oDe8Vb5HtxXaMcw20jRItFisQo4JBtJgdy+F7v15rxw=;
	b=0ygMbp11xkfzpEkWOJLGuPHyxS0CUDfzavz6DzKeH6tVlzh2DetxEsiW58shhufPP4ZQJd
	HF3GL0a0oyvtnSDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B528D136DC;
	Wed,  9 Jul 2025 16:04:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mPntKiaTbmhDEAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 09 Jul 2025 16:04:54 +0000
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
Subject: [PATCH 15/27] ALSA: hda/cirrus: Split to cs420x and cs421x drivers
Date: Wed,  9 Jul 2025 18:04:18 +0200
Message-ID: <20250709160434.1859-16-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 114431F443
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email];
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

Since the codec ops for CS420x and CS421x are fairly independent,
split the cirrus codec driver into two drivers, snd-hda-codec-cs420x
and snd-hda-code-cs421x.  Together with the split, convert to the new
hda_codec_ops probe.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/cirrus/Kconfig               |  20 +-
 sound/hda/codecs/cirrus/Makefile              |   6 +-
 .../hda/codecs/cirrus/{cirrus.c => cs420x.c}  | 526 +---------------
 sound/hda/codecs/cirrus/cs421x.c              | 590 ++++++++++++++++++
 4 files changed, 643 insertions(+), 499 deletions(-)
 rename sound/hda/codecs/cirrus/{cirrus.c => cs420x.c} (61%)
 create mode 100644 sound/hda/codecs/cirrus/cs421x.c

diff --git a/sound/hda/codecs/cirrus/Kconfig b/sound/hda/codecs/cirrus/Kconfig
index f6cefb65c5f8..b3a5968e9a02 100644
--- a/sound/hda/codecs/cirrus/Kconfig
+++ b/sound/hda/codecs/cirrus/Kconfig
@@ -1,14 +1,24 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-config SND_HDA_CODEC_CIRRUS
-	tristate "Build Cirrus Logic codec support"
+config SND_HDA_CODEC_CS420X
+	tristate "Build Cirrus Logic CS420x codec support"
 	select SND_HDA_GENERIC
 	help
-	  Say Y or M here to include Cirrus Logic codec support in
-	  snd-hda-intel driver, such as CS4206.
+	  Say Y or M here to include Cirrus Logic CS420x codec support in
+	  snd-hda-intel driver
 
 comment "Set to Y if you want auto-loading the codec driver"
-	depends on SND_HDA=y && SND_HDA_CODEC_CIRRUS=m
+	depends on SND_HDA=y && SND_HDA_CODEC_CS420X=m
+
+config SND_HDA_CODEC_CS421X
+	tristate "Build Cirrus Logic CS421x codec support"
+	select SND_HDA_GENERIC
+	help
+	  Say Y or M here to include Cirrus Logic CS421x codec support in
+	  snd-hda-intel driver
+
+comment "Set to Y if you want auto-loading the codec driver"
+	depends on SND_HDA=y && SND_HDA_CODEC_CS421X=m
 
 config SND_HDA_CODEC_CS8409
 	tristate "Build Cirrus Logic HDA bridge support"
diff --git a/sound/hda/codecs/cirrus/Makefile b/sound/hda/codecs/cirrus/Makefile
index fa40c893fb09..dda1873ebcf5 100644
--- a/sound/hda/codecs/cirrus/Makefile
+++ b/sound/hda/codecs/cirrus/Makefile
@@ -1,8 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0
 subdir-ccflags-y += -I$(src)/../../common
 
-snd-hda-codec-cirrus-y :=	cirrus.o
+snd-hda-codec-cs420x-y :=	cs420x.o
+snd-hda-codec-cs421x-y :=	cs421x.o
 snd-hda-codec-cs8409-y :=	cs8409.o cs8409-tables.o
 
-obj-$(CONFIG_SND_HDA_CODEC_CIRRUS) += snd-hda-codec-cirrus.o
+obj-$(CONFIG_SND_HDA_CODEC_CS420X) += snd-hda-codec-cs420x.o
+obj-$(CONFIG_SND_HDA_CODEC_CS421X) += snd-hda-codec-cs421x.o
 obj-$(CONFIG_SND_HDA_CODEC_CS8409) += snd-hda-codec-cs8409.o
diff --git a/sound/hda/codecs/cirrus/cirrus.c b/sound/hda/codecs/cirrus/cs420x.c
similarity index 61%
rename from sound/hda/codecs/cirrus/cirrus.c
rename to sound/hda/codecs/cirrus/cs420x.c
index 81ea66c4e9d3..823220d5cada 100644
--- a/sound/hda/codecs/cirrus/cirrus.c
+++ b/sound/hda/codecs/cirrus/cs420x.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * HD audio interface patch for Cirrus Logic CS420x chip
+ * Cirrus Logic CS420x HD-audio codec
  *
  * Copyright (c) 2009 Takashi Iwai <tiwai@suse.de>
  */
@@ -17,9 +17,6 @@
 #include "hda_jack.h"
 #include "../generic.h"
 
-/*
- */
-
 struct cs_spec {
 	struct hda_gen_spec gen;
 
@@ -29,10 +26,6 @@ struct cs_spec {
 	unsigned int gpio_eapd_hp; /* EAPD GPIO bit for headphones */
 	unsigned int gpio_eapd_speaker; /* EAPD GPIO bit for speakers */
 
-	/* CS421x */
-	unsigned int spdif_detect:1;
-	unsigned int spdif_present:1;
-	unsigned int sense_b:1;
 	hda_nid_t vendor_nid;
 
 	/* for MBP SPDIF control */
@@ -56,13 +49,6 @@ enum {
 	CS420X_APPLE = CS420X_GPIO_13,
 };
 
-/* CS421x boards */
-enum {
-	CS421X_CDB4210,
-	CS421X_SENSE_B,
-	CS421X_STUMPY,
-};
-
 /* Vendor-specific processing widget */
 #define CS420X_VENDOR_NID	0x11
 #define CS_DIG_OUT1_PIN_NID	0x10
@@ -105,28 +91,6 @@ enum {
 /* Cirrus Logic CS4208 */
 #define CS4208_VENDOR_NID	0x24
 
-/*
- * Cirrus Logic CS4210
- *
- * 1 DAC => HP(sense) / Speakers,
- * 1 ADC <= LineIn(sense) / MicIn / DMicIn,
- * 1 SPDIF OUT => SPDIF Trasmitter(sense)
- */
-#define CS4210_DAC_NID		0x02
-#define CS4210_ADC_NID		0x03
-#define CS4210_VENDOR_NID	0x0B
-#define CS421X_DMIC_PIN_NID	0x09 /* Port E */
-#define CS421X_SPDIF_PIN_NID	0x0A /* Port H */
-
-#define CS421X_IDX_DEV_CFG	0x01
-#define CS421X_IDX_ADC_CFG	0x02
-#define CS421X_IDX_DAC_CFG	0x03
-#define CS421X_IDX_SPK_CTL	0x04
-
-/* Cirrus Logic CS4213 is like CS4210 but does not have SPDIF input/output */
-#define CS4213_VENDOR_NID	0x09
-
-
 static inline int cs_vendor_coef_get(struct hda_codec *codec, unsigned int idx)
 {
 	struct cs_spec *spec = codec->spec;
@@ -158,9 +122,6 @@ static void cs_automute(struct hda_codec *codec)
 {
 	struct cs_spec *spec = codec->spec;
 
-	/* mute HPs if spdif jack (SENSE_B) is present */
-	spec->gen.master_mute = !!(spec->spdif_present && spec->sense_b);
-
 	snd_hda_gen_update_outputs(codec);
 
 	if (spec->gpio_eapd_hp || spec->gpio_eapd_speaker) {
@@ -331,16 +292,6 @@ static int cs_build_controls(struct hda_codec *codec)
 	return 0;
 }
 
-#define cs_free		snd_hda_gen_free
-
-static const struct hda_codec_ops cs_patch_ops = {
-	.build_controls = cs_build_controls,
-	.build_pcms = snd_hda_gen_build_pcms,
-	.init = cs_init,
-	.free = cs_free,
-	.unsol_event = snd_hda_jack_unsol_event,
-};
-
 static int cs_parse_auto_config(struct hda_codec *codec)
 {
 	struct cs_spec *spec = codec->spec;
@@ -584,17 +535,10 @@ static struct cs_spec *cs_alloc_spec(struct hda_codec *codec, int vendor_nid)
 	return spec;
 }
 
-static int patch_cs420x(struct hda_codec *codec)
+static int cs420x_probe(struct hda_codec *codec)
 {
-	struct cs_spec *spec;
 	int err;
 
-	spec = cs_alloc_spec(codec, CS420X_VENDOR_NID);
-	if (!spec)
-		return -ENOMEM;
-
-	codec->patch_ops = cs_patch_ops;
-	spec->gen.automute_hook = cs_automute;
 	codec->single_adc_amp = 1;
 
 	snd_hda_pick_fixup(codec, cs420x_models, cs420x_fixup_tbl,
@@ -603,15 +547,11 @@ static int patch_cs420x(struct hda_codec *codec)
 
 	err = cs_parse_auto_config(codec);
 	if (err < 0)
-		goto error;
+		return err;
 
 	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PROBE);
 
 	return 0;
-
- error:
-	cs_free(codec);
-	return err;
 }
 
 /*
@@ -766,17 +706,11 @@ static void cs4208_fix_amp_caps(struct hda_codec *codec, hda_nid_t adc)
 	snd_hda_override_amp_caps(codec, adc, HDA_INPUT, caps);
 }
 
-static int patch_cs4208(struct hda_codec *codec)
+static int cs4208_probe(struct hda_codec *codec)
 {
-	struct cs_spec *spec;
+	struct cs_spec *spec = codec->spec;
 	int err;
 
-	spec = cs_alloc_spec(codec, CS4208_VENDOR_NID);
-	if (!spec)
-		return -ENOMEM;
-
-	codec->patch_ops = cs_patch_ops;
-	spec->gen.automute_hook = cs_automute;
 	/* exclude NID 0x10 (HP) from output volumes due to different steps */
 	spec->gen.out_vol_mask = 1ULL << 0x10;
 
@@ -792,452 +726,60 @@ static int patch_cs4208(struct hda_codec *codec)
 
 	err = cs_parse_auto_config(codec);
 	if (err < 0)
-		goto error;
+		return err;
 
 	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PROBE);
 
 	return 0;
-
- error:
-	cs_free(codec);
-	return err;
 }
 
-/*
- * Cirrus Logic CS4210
- *
- * 1 DAC => HP(sense) / Speakers,
- * 1 ADC <= LineIn(sense) / MicIn / DMicIn,
- * 1 SPDIF OUT => SPDIF Trasmitter(sense)
- */
-
-/* CS4210 board names */
-static const struct hda_model_fixup cs421x_models[] = {
-	{ .id = CS421X_CDB4210, .name = "cdb4210" },
-	{ .id = CS421X_STUMPY, .name = "stumpy" },
-	{}
-};
-
-static const struct hda_quirk cs421x_fixup_tbl[] = {
-	/* Test Intel board + CDB2410  */
-	SND_PCI_QUIRK(0x8086, 0x5001, "DP45SG/CDB4210", CS421X_CDB4210),
-	{} /* terminator */
-};
-
-/* CS4210 board pinconfigs */
-/* Default CS4210 (CDB4210)*/
-static const struct hda_pintbl cdb4210_pincfgs[] = {
-	{ 0x05, 0x0321401f },
-	{ 0x06, 0x90170010 },
-	{ 0x07, 0x03813031 },
-	{ 0x08, 0xb7a70037 },
-	{ 0x09, 0xb7a6003e },
-	{ 0x0a, 0x034510f0 },
-	{} /* terminator */
-};
-
-/* Stumpy ChromeBox */
-static const struct hda_pintbl stumpy_pincfgs[] = {
-	{ 0x05, 0x022120f0 },
-	{ 0x06, 0x901700f0 },
-	{ 0x07, 0x02a120f0 },
-	{ 0x08, 0x77a70037 },
-	{ 0x09, 0x77a6003e },
-	{ 0x0a, 0x434510f0 },
-	{} /* terminator */
-};
-
-/* Setup GPIO/SENSE for each board (if used) */
-static void cs421x_fixup_sense_b(struct hda_codec *codec,
-				 const struct hda_fixup *fix, int action)
-{
-	struct cs_spec *spec = codec->spec;
-
-	if (action == HDA_FIXUP_ACT_PRE_PROBE)
-		spec->sense_b = 1;
-}
-
-static const struct hda_fixup cs421x_fixups[] = {
-	[CS421X_CDB4210] = {
-		.type = HDA_FIXUP_PINS,
-		.v.pins = cdb4210_pincfgs,
-		.chained = true,
-		.chain_id = CS421X_SENSE_B,
-	},
-	[CS421X_SENSE_B] = {
-		.type = HDA_FIXUP_FUNC,
-		.v.func = cs421x_fixup_sense_b,
-	},
-	[CS421X_STUMPY] = {
-		.type = HDA_FIXUP_PINS,
-		.v.pins = stumpy_pincfgs,
-	},
-};
-
-static const struct hda_verb cs421x_coef_init_verbs[] = {
-	{0x0B, AC_VERB_SET_PROC_STATE, 1},
-	{0x0B, AC_VERB_SET_COEF_INDEX, CS421X_IDX_DEV_CFG},
-	/*
-	 *  Disable Coefficient Index Auto-Increment(DAI)=1,
-	 *  PDREF=0
-	 */
-	{0x0B, AC_VERB_SET_PROC_COEF, 0x0001 },
-
-	{0x0B, AC_VERB_SET_COEF_INDEX, CS421X_IDX_ADC_CFG},
-	/* ADC SZCMode = Digital Soft Ramp */
-	{0x0B, AC_VERB_SET_PROC_COEF, 0x0002 },
-
-	{0x0B, AC_VERB_SET_COEF_INDEX, CS421X_IDX_DAC_CFG},
-	{0x0B, AC_VERB_SET_PROC_COEF,
-	 (0x0002 /* DAC SZCMode = Digital Soft Ramp */
-	  | 0x0004 /* Mute DAC on FIFO error */
-	  | 0x0008 /* Enable DAC High Pass Filter */
-	  )},
-	{} /* terminator */
-};
-
-/* Errata: CS4210 rev A1 Silicon
- *
- * http://www.cirrus.com/en/pubs/errata/
- *
- * Description:
- * 1. Performance degredation is present in the ADC.
- * 2. Speaker output is not completely muted upon HP detect.
- * 3. Noise is present when clipping occurs on the amplified
- *    speaker outputs.
- *
- * Workaround:
- * The following verb sequence written to the registers during
- * initialization will correct the issues listed above.
- */
-
-static const struct hda_verb cs421x_coef_init_verbs_A1_silicon_fixes[] = {
-	{0x0B, AC_VERB_SET_PROC_STATE, 0x01},  /* VPW: processing on */
-
-	{0x0B, AC_VERB_SET_COEF_INDEX, 0x0006},
-	{0x0B, AC_VERB_SET_PROC_COEF, 0x9999}, /* Test mode: on */
-
-	{0x0B, AC_VERB_SET_COEF_INDEX, 0x000A},
-	{0x0B, AC_VERB_SET_PROC_COEF, 0x14CB}, /* Chop double */
-
-	{0x0B, AC_VERB_SET_COEF_INDEX, 0x0011},
-	{0x0B, AC_VERB_SET_PROC_COEF, 0xA2D0}, /* Increase ADC current */
-
-	{0x0B, AC_VERB_SET_COEF_INDEX, 0x001A},
-	{0x0B, AC_VERB_SET_PROC_COEF, 0x02A9}, /* Mute speaker */
-
-	{0x0B, AC_VERB_SET_COEF_INDEX, 0x001B},
-	{0x0B, AC_VERB_SET_PROC_COEF, 0X1006}, /* Remove noise */
-
-	{} /* terminator */
-};
-
-/* Speaker Amp Gain is controlled by the vendor widget's coef 4 */
-static const DECLARE_TLV_DB_SCALE(cs421x_speaker_boost_db_scale, 900, 300, 0);
-
-static int cs421x_boost_vol_info(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_info *uinfo)
-{
-	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
-	uinfo->count = 1;
-	uinfo->value.integer.min = 0;
-	uinfo->value.integer.max = 3;
-	return 0;
-}
-
-static int cs421x_boost_vol_get(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct hda_codec *codec = snd_kcontrol_chip(kcontrol);
-
-	ucontrol->value.integer.value[0] =
-		cs_vendor_coef_get(codec, CS421X_IDX_SPK_CTL) & 0x0003;
-	return 0;
-}
-
-static int cs421x_boost_vol_put(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct hda_codec *codec = snd_kcontrol_chip(kcontrol);
-
-	unsigned int vol = ucontrol->value.integer.value[0];
-	unsigned int coef =
-		cs_vendor_coef_get(codec, CS421X_IDX_SPK_CTL);
-	unsigned int original_coef = coef;
-
-	coef &= ~0x0003;
-	coef |= (vol & 0x0003);
-	if (original_coef != coef) {
-		cs_vendor_coef_set(codec, CS421X_IDX_SPK_CTL, coef);
-		return 1;
-	}
-
-	return 0;
-}
-
-static const struct snd_kcontrol_new cs421x_speaker_boost_ctl = {
-
-	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
-	.access = (SNDRV_CTL_ELEM_ACCESS_READWRITE |
-			SNDRV_CTL_ELEM_ACCESS_TLV_READ),
-	.name = "Speaker Boost Playback Volume",
-	.info = cs421x_boost_vol_info,
-	.get = cs421x_boost_vol_get,
-	.put = cs421x_boost_vol_put,
-	.tlv = { .p = cs421x_speaker_boost_db_scale },
-};
-
-static void cs4210_pinmux_init(struct hda_codec *codec)
-{
-	struct cs_spec *spec = codec->spec;
-	unsigned int def_conf, coef;
-
-	/* GPIO, DMIC_SCL, DMIC_SDA and SENSE_B are multiplexed */
-	coef = cs_vendor_coef_get(codec, CS421X_IDX_DEV_CFG);
-
-	if (spec->gpio_mask)
-		coef |= 0x0008; /* B1,B2 are GPIOs */
-	else
-		coef &= ~0x0008;
-
-	if (spec->sense_b)
-		coef |= 0x0010; /* B2 is SENSE_B, not inverted  */
-	else
-		coef &= ~0x0010;
-
-	cs_vendor_coef_set(codec, CS421X_IDX_DEV_CFG, coef);
-
-	if ((spec->gpio_mask || spec->sense_b) &&
-	    is_active_pin(codec, CS421X_DMIC_PIN_NID)) {
-
-		/*
-		 *  GPIO or SENSE_B forced - disconnect the DMIC pin.
-		 */
-		def_conf = snd_hda_codec_get_pincfg(codec, CS421X_DMIC_PIN_NID);
-		def_conf &= ~AC_DEFCFG_PORT_CONN;
-		def_conf |= (AC_JACK_PORT_NONE << AC_DEFCFG_PORT_CONN_SHIFT);
-		snd_hda_codec_set_pincfg(codec, CS421X_DMIC_PIN_NID, def_conf);
-	}
-}
-
-static void cs4210_spdif_automute(struct hda_codec *codec,
-				  struct hda_jack_callback *tbl)
-{
-	struct cs_spec *spec = codec->spec;
-	bool spdif_present = false;
-	hda_nid_t spdif_pin = spec->gen.autocfg.dig_out_pins[0];
-
-	/* detect on spdif is specific to CS4210 */
-	if (!spec->spdif_detect ||
-	    spec->vendor_nid != CS4210_VENDOR_NID)
-		return;
-
-	spdif_present = snd_hda_jack_detect(codec, spdif_pin);
-	if (spdif_present == spec->spdif_present)
-		return;
-
-	spec->spdif_present = spdif_present;
-	/* SPDIF TX on/off */
-	snd_hda_set_pin_ctl(codec, spdif_pin, spdif_present ? PIN_OUT : 0);
-
-	cs_automute(codec);
-}
-
-static void parse_cs421x_digital(struct hda_codec *codec)
-{
-	struct cs_spec *spec = codec->spec;
-	struct auto_pin_cfg *cfg = &spec->gen.autocfg;
-	int i;
-
-	for (i = 0; i < cfg->dig_outs; i++) {
-		hda_nid_t nid = cfg->dig_out_pins[i];
-
-		if (get_wcaps(codec, nid) & AC_WCAP_UNSOL_CAP) {
-			spec->spdif_detect = 1;
-			snd_hda_jack_detect_enable_callback(codec, nid,
-							    cs4210_spdif_automute);
-		}
-	}
-}
-
-static int cs421x_init(struct hda_codec *codec)
-{
-	struct cs_spec *spec = codec->spec;
-
-	if (spec->vendor_nid == CS4210_VENDOR_NID) {
-		snd_hda_sequence_write(codec, cs421x_coef_init_verbs);
-		snd_hda_sequence_write(codec, cs421x_coef_init_verbs_A1_silicon_fixes);
-		cs4210_pinmux_init(codec);
-	}
-
-	snd_hda_gen_init(codec);
-
-	if (spec->gpio_mask) {
-		snd_hda_codec_write(codec, 0x01, 0, AC_VERB_SET_GPIO_MASK,
-				    spec->gpio_mask);
-		snd_hda_codec_write(codec, 0x01, 0, AC_VERB_SET_GPIO_DIRECTION,
-				    spec->gpio_dir);
-		snd_hda_codec_write(codec, 0x01, 0, AC_VERB_SET_GPIO_DATA,
-				    spec->gpio_data);
-	}
-
-	init_input_coef(codec);
-
-	cs4210_spdif_automute(codec, NULL);
-
-	return 0;
-}
-
-static void fix_volume_caps(struct hda_codec *codec, hda_nid_t dac)
-{
-	unsigned int caps;
-
-	/* set the upper-limit for mixer amp to 0dB */
-	caps = query_amp_caps(codec, dac, HDA_OUTPUT);
-	caps &= ~(0x7f << AC_AMPCAP_NUM_STEPS_SHIFT);
-	caps |= ((caps >> AC_AMPCAP_OFFSET_SHIFT) & 0x7f)
-		<< AC_AMPCAP_NUM_STEPS_SHIFT;
-	snd_hda_override_amp_caps(codec, dac, HDA_OUTPUT, caps);
-}
-
-static int cs421x_parse_auto_config(struct hda_codec *codec)
-{
-	struct cs_spec *spec = codec->spec;
-	hda_nid_t dac = CS4210_DAC_NID;
-	int err;
-
-	fix_volume_caps(codec, dac);
-
-	err = snd_hda_parse_pin_defcfg(codec, &spec->gen.autocfg, NULL, 0);
-	if (err < 0)
-		return err;
-
-	err = snd_hda_gen_parse_auto_config(codec, &spec->gen.autocfg);
-	if (err < 0)
-		return err;
-
-	parse_cs421x_digital(codec);
-
-	if (spec->gen.autocfg.speaker_outs &&
-	    spec->vendor_nid == CS4210_VENDOR_NID) {
-		if (!snd_hda_gen_add_kctl(&spec->gen, NULL,
-					  &cs421x_speaker_boost_ctl))
-			return -ENOMEM;
-	}
-
-	return 0;
-}
-
-/*
- *	Manage PDREF, when transitioning to D3hot
- *	(DAC,ADC) -> D3, PDREF=1, AFG->D3
- */
-static int cs421x_suspend(struct hda_codec *codec)
-{
-	struct cs_spec *spec = codec->spec;
-	unsigned int coef;
-
-	snd_hda_shutup_pins(codec);
-
-	snd_hda_codec_write(codec, CS4210_DAC_NID, 0,
-			    AC_VERB_SET_POWER_STATE,  AC_PWRST_D3);
-	snd_hda_codec_write(codec, CS4210_ADC_NID, 0,
-			    AC_VERB_SET_POWER_STATE,  AC_PWRST_D3);
-
-	if (spec->vendor_nid == CS4210_VENDOR_NID) {
-		coef = cs_vendor_coef_get(codec, CS421X_IDX_DEV_CFG);
-		coef |= 0x0004; /* PDREF */
-		cs_vendor_coef_set(codec, CS421X_IDX_DEV_CFG, coef);
-	}
-
-	return 0;
-}
-
-static const struct hda_codec_ops cs421x_patch_ops = {
-	.build_controls = snd_hda_gen_build_controls,
-	.build_pcms = snd_hda_gen_build_pcms,
-	.init = cs421x_init,
-	.free = cs_free,
-	.unsol_event = snd_hda_jack_unsol_event,
-	.suspend = cs421x_suspend,
-};
-
-static int patch_cs4210(struct hda_codec *codec)
+static int cs_codec_probe(struct hda_codec *codec,
+			  const struct hda_device_id *id)
 {
 	struct cs_spec *spec;
 	int err;
 
-	spec = cs_alloc_spec(codec, CS4210_VENDOR_NID);
+	spec = cs_alloc_spec(codec, id->driver_data);
 	if (!spec)
 		return -ENOMEM;
-
-	codec->patch_ops = cs421x_patch_ops;
 	spec->gen.automute_hook = cs_automute;
 
-	snd_hda_pick_fixup(codec, cs421x_models, cs421x_fixup_tbl,
-			   cs421x_fixups);
-	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PRE_PROBE);
-
-	/*
-	 *  Update the GPIO/DMIC/SENSE_B pinmux before the configuration
-	 *   is auto-parsed. If GPIO or SENSE_B is forced, DMIC input
-	 *   is disabled.
-	 */
-	cs4210_pinmux_init(codec);
-
-	err = cs421x_parse_auto_config(codec);
+	if (spec->vendor_nid == CS4208_VENDOR_NID)
+		err = cs4208_probe(codec);
+	else
+		err = cs420x_probe(codec);
 	if (err < 0)
-		goto error;
-
-	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PROBE);
-
-	return 0;
-
- error:
-	cs_free(codec);
+		snd_hda_gen_remove(codec);
 	return err;
 }
 
-static int patch_cs4213(struct hda_codec *codec)
-{
-	struct cs_spec *spec;
-	int err;
-
-	spec = cs_alloc_spec(codec, CS4213_VENDOR_NID);
-	if (!spec)
-		return -ENOMEM;
-
-	codec->patch_ops = cs421x_patch_ops;
-
-	err = cs421x_parse_auto_config(codec);
-	if (err < 0)
-		goto error;
-
-	return 0;
-
- error:
-	cs_free(codec);
-	return err;
-}
+static const struct hda_codec_ops cs_codec_ops = {
+	.probe = cs_codec_probe,
+	.remove = snd_hda_gen_remove,
+	.build_controls = cs_build_controls,
+	.build_pcms = snd_hda_gen_build_pcms,
+	.init = cs_init,
+	.unsol_event = snd_hda_jack_unsol_event,
+	.stream_pm = snd_hda_gen_stream_pm,
+};
 
 /*
- * patch entries
+ * driver entries
  */
-static const struct hda_device_id snd_hda_id_cirrus[] = {
-	HDA_CODEC_ENTRY(0x10134206, "CS4206", patch_cs420x),
-	HDA_CODEC_ENTRY(0x10134207, "CS4207", patch_cs420x),
-	HDA_CODEC_ENTRY(0x10134208, "CS4208", patch_cs4208),
-	HDA_CODEC_ENTRY(0x10134210, "CS4210", patch_cs4210),
-	HDA_CODEC_ENTRY(0x10134213, "CS4213", patch_cs4213),
+static const struct hda_device_id snd_hda_id_cs420x[] = {
+	HDA_CODEC_ID_MODEL(0x10134206, "CS4206", CS420X_VENDOR_NID),
+	HDA_CODEC_ID_MODEL(0x10134207, "CS4207", CS420X_VENDOR_NID),
+	HDA_CODEC_ID_MODEL(0x10134208, "CS4208", CS4208_VENDOR_NID),
 	{} /* terminator */
 };
-MODULE_DEVICE_TABLE(hdaudio, snd_hda_id_cirrus);
+MODULE_DEVICE_TABLE(hdaudio, snd_hda_id_cs420x);
 
 MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("Cirrus Logic HD-audio codec");
+MODULE_DESCRIPTION("Cirrus Logic CS420x HD-audio codec");
 
-static struct hda_codec_driver cirrus_driver = {
-	.id = snd_hda_id_cirrus,
+static struct hda_codec_driver cs420x_driver = {
+	.id = snd_hda_id_cs420x,
+	.ops = &cs_codec_ops,
 };
 
-module_hda_codec_driver(cirrus_driver);
+module_hda_codec_driver(cs420x_driver);
diff --git a/sound/hda/codecs/cirrus/cs421x.c b/sound/hda/codecs/cirrus/cs421x.c
new file mode 100644
index 000000000000..a93e2e0bb391
--- /dev/null
+++ b/sound/hda/codecs/cirrus/cs421x.c
@@ -0,0 +1,590 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Cirrus Logic CS421x HD-audio codec
+ */
+
+#include <linux/init.h>
+#include <linux/slab.h>
+#include <linux/module.h>
+#include <sound/core.h>
+#include <linux/pci.h>
+#include <sound/tlv.h>
+#include <sound/hda_codec.h>
+#include "hda_local.h"
+#include "hda_auto_parser.h"
+#include "hda_jack.h"
+#include "../generic.h"
+
+struct cs_spec {
+	struct hda_gen_spec gen;
+
+	unsigned int gpio_mask;
+	unsigned int gpio_dir;
+	unsigned int gpio_data;
+	unsigned int gpio_eapd_hp; /* EAPD GPIO bit for headphones */
+	unsigned int gpio_eapd_speaker; /* EAPD GPIO bit for speakers */
+
+	/* CS421x */
+	unsigned int spdif_detect:1;
+	unsigned int spdif_present:1;
+	unsigned int sense_b:1;
+	hda_nid_t vendor_nid;
+
+	/* for MBP SPDIF control */
+	int (*spdif_sw_put)(struct snd_kcontrol *kcontrol,
+			    struct snd_ctl_elem_value *ucontrol);
+};
+
+/* CS421x boards */
+enum {
+	CS421X_CDB4210,
+	CS421X_SENSE_B,
+	CS421X_STUMPY,
+};
+
+/* Vendor-specific processing widget */
+#define CS_DIG_OUT1_PIN_NID	0x10
+#define CS_DIG_OUT2_PIN_NID	0x15
+#define CS_DMIC1_PIN_NID	0x0e
+#define CS_DMIC2_PIN_NID	0x12
+
+/* coef indices */
+#define IDX_SPDIF_STAT		0x0000
+#define IDX_SPDIF_CTL		0x0001
+#define IDX_ADC_CFG		0x0002
+/* SZC bitmask, 4 modes below:
+ * 0 = immediate,
+ * 1 = digital immediate, analog zero-cross
+ * 2 = digtail & analog soft-ramp
+ * 3 = digital soft-ramp, analog zero-cross
+ */
+#define   CS_COEF_ADC_SZC_MASK		(3 << 0)
+#define   CS_COEF_ADC_MIC_SZC_MODE	(3 << 0) /* SZC setup for mic */
+#define   CS_COEF_ADC_LI_SZC_MODE	(3 << 0) /* SZC setup for line-in */
+/* PGA mode: 0 = differential, 1 = signle-ended */
+#define   CS_COEF_ADC_MIC_PGA_MODE	(1 << 5) /* PGA setup for mic */
+#define   CS_COEF_ADC_LI_PGA_MODE	(1 << 6) /* PGA setup for line-in */
+#define IDX_DAC_CFG		0x0003
+/* SZC bitmask, 4 modes below:
+ * 0 = Immediate
+ * 1 = zero-cross
+ * 2 = soft-ramp
+ * 3 = soft-ramp on zero-cross
+ */
+#define   CS_COEF_DAC_HP_SZC_MODE	(3 << 0) /* nid 0x02 */
+#define   CS_COEF_DAC_LO_SZC_MODE	(3 << 2) /* nid 0x03 */
+#define   CS_COEF_DAC_SPK_SZC_MODE	(3 << 4) /* nid 0x04 */
+
+#define IDX_BEEP_CFG		0x0004
+/* 0x0008 - test reg key */
+/* 0x0009 - 0x0014 -> 12 test regs */
+/* 0x0015 - visibility reg */
+
+/*
+ * Cirrus Logic CS4210
+ *
+ * 1 DAC => HP(sense) / Speakers,
+ * 1 ADC <= LineIn(sense) / MicIn / DMicIn,
+ * 1 SPDIF OUT => SPDIF Transmitter(sense)
+ */
+#define CS4210_DAC_NID		0x02
+#define CS4210_ADC_NID		0x03
+#define CS4210_VENDOR_NID	0x0B
+#define CS421X_DMIC_PIN_NID	0x09 /* Port E */
+#define CS421X_SPDIF_PIN_NID	0x0A /* Port H */
+
+#define CS421X_IDX_DEV_CFG	0x01
+#define CS421X_IDX_ADC_CFG	0x02
+#define CS421X_IDX_DAC_CFG	0x03
+#define CS421X_IDX_SPK_CTL	0x04
+
+/* Cirrus Logic CS4213 is like CS4210 but does not have SPDIF input/output */
+#define CS4213_VENDOR_NID	0x09
+
+
+static inline int cs_vendor_coef_get(struct hda_codec *codec, unsigned int idx)
+{
+	struct cs_spec *spec = codec->spec;
+
+	snd_hda_codec_write(codec, spec->vendor_nid, 0,
+			    AC_VERB_SET_COEF_INDEX, idx);
+	return snd_hda_codec_read(codec, spec->vendor_nid, 0,
+				  AC_VERB_GET_PROC_COEF, 0);
+}
+
+static inline void cs_vendor_coef_set(struct hda_codec *codec, unsigned int idx,
+				      unsigned int coef)
+{
+	struct cs_spec *spec = codec->spec;
+
+	snd_hda_codec_write(codec, spec->vendor_nid, 0,
+			    AC_VERB_SET_COEF_INDEX, idx);
+	snd_hda_codec_write(codec, spec->vendor_nid, 0,
+			    AC_VERB_SET_PROC_COEF, coef);
+}
+
+/*
+ * auto-mute and auto-mic switching
+ * CS421x auto-output redirecting
+ * HP/SPK/SPDIF
+ */
+
+static void cs_automute(struct hda_codec *codec)
+{
+	struct cs_spec *spec = codec->spec;
+
+	/* mute HPs if spdif jack (SENSE_B) is present */
+	spec->gen.master_mute = !!(spec->spdif_present && spec->sense_b);
+
+	snd_hda_gen_update_outputs(codec);
+
+	if (spec->gpio_eapd_hp || spec->gpio_eapd_speaker) {
+		if (spec->gen.automute_speaker)
+			spec->gpio_data = spec->gen.hp_jack_present ?
+				spec->gpio_eapd_hp : spec->gpio_eapd_speaker;
+		else
+			spec->gpio_data =
+				spec->gpio_eapd_hp | spec->gpio_eapd_speaker;
+		snd_hda_codec_write(codec, 0x01, 0,
+				    AC_VERB_SET_GPIO_DATA, spec->gpio_data);
+	}
+}
+
+static bool is_active_pin(struct hda_codec *codec, hda_nid_t nid)
+{
+	unsigned int val;
+
+	val = snd_hda_codec_get_pincfg(codec, nid);
+	return (get_defcfg_connect(val) != AC_JACK_PORT_NONE);
+}
+
+static struct cs_spec *cs_alloc_spec(struct hda_codec *codec, int vendor_nid)
+{
+	struct cs_spec *spec;
+
+	spec = kzalloc(sizeof(*spec), GFP_KERNEL);
+	if (!spec)
+		return NULL;
+	codec->spec = spec;
+	spec->vendor_nid = vendor_nid;
+	codec->power_save_node = 1;
+	snd_hda_gen_spec_init(&spec->gen);
+
+	return spec;
+}
+
+/*
+ * Cirrus Logic CS4210
+ *
+ * 1 DAC => HP(sense) / Speakers,
+ * 1 ADC <= LineIn(sense) / MicIn / DMicIn,
+ * 1 SPDIF OUT => SPDIF Transmitter(sense)
+ */
+
+/* CS4210 board names */
+static const struct hda_model_fixup cs421x_models[] = {
+	{ .id = CS421X_CDB4210, .name = "cdb4210" },
+	{ .id = CS421X_STUMPY, .name = "stumpy" },
+	{}
+};
+
+static const struct hda_quirk cs421x_fixup_tbl[] = {
+	/* Test Intel board + CDB2410  */
+	SND_PCI_QUIRK(0x8086, 0x5001, "DP45SG/CDB4210", CS421X_CDB4210),
+	{} /* terminator */
+};
+
+/* CS4210 board pinconfigs */
+/* Default CS4210 (CDB4210)*/
+static const struct hda_pintbl cdb4210_pincfgs[] = {
+	{ 0x05, 0x0321401f },
+	{ 0x06, 0x90170010 },
+	{ 0x07, 0x03813031 },
+	{ 0x08, 0xb7a70037 },
+	{ 0x09, 0xb7a6003e },
+	{ 0x0a, 0x034510f0 },
+	{} /* terminator */
+};
+
+/* Stumpy ChromeBox */
+static const struct hda_pintbl stumpy_pincfgs[] = {
+	{ 0x05, 0x022120f0 },
+	{ 0x06, 0x901700f0 },
+	{ 0x07, 0x02a120f0 },
+	{ 0x08, 0x77a70037 },
+	{ 0x09, 0x77a6003e },
+	{ 0x0a, 0x434510f0 },
+	{} /* terminator */
+};
+
+/* Setup GPIO/SENSE for each board (if used) */
+static void cs421x_fixup_sense_b(struct hda_codec *codec,
+				 const struct hda_fixup *fix, int action)
+{
+	struct cs_spec *spec = codec->spec;
+
+	if (action == HDA_FIXUP_ACT_PRE_PROBE)
+		spec->sense_b = 1;
+}
+
+static const struct hda_fixup cs421x_fixups[] = {
+	[CS421X_CDB4210] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = cdb4210_pincfgs,
+		.chained = true,
+		.chain_id = CS421X_SENSE_B,
+	},
+	[CS421X_SENSE_B] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = cs421x_fixup_sense_b,
+	},
+	[CS421X_STUMPY] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = stumpy_pincfgs,
+	},
+};
+
+static const struct hda_verb cs421x_coef_init_verbs[] = {
+	{0x0B, AC_VERB_SET_PROC_STATE, 1},
+	{0x0B, AC_VERB_SET_COEF_INDEX, CS421X_IDX_DEV_CFG},
+	/*
+	 *  Disable Coefficient Index Auto-Increment(DAI)=1,
+	 *  PDREF=0
+	 */
+	{0x0B, AC_VERB_SET_PROC_COEF, 0x0001 },
+
+	{0x0B, AC_VERB_SET_COEF_INDEX, CS421X_IDX_ADC_CFG},
+	/* ADC SZCMode = Digital Soft Ramp */
+	{0x0B, AC_VERB_SET_PROC_COEF, 0x0002 },
+
+	{0x0B, AC_VERB_SET_COEF_INDEX, CS421X_IDX_DAC_CFG},
+	{0x0B, AC_VERB_SET_PROC_COEF,
+	 (0x0002 /* DAC SZCMode = Digital Soft Ramp */
+	  | 0x0004 /* Mute DAC on FIFO error */
+	  | 0x0008 /* Enable DAC High Pass Filter */
+	  )},
+	{} /* terminator */
+};
+
+/* Errata: CS4210 rev A1 Silicon
+ *
+ * http://www.cirrus.com/en/pubs/errata/
+ *
+ * Description:
+ * 1. Performance degredation is present in the ADC.
+ * 2. Speaker output is not completely muted upon HP detect.
+ * 3. Noise is present when clipping occurs on the amplified
+ *    speaker outputs.
+ *
+ * Workaround:
+ * The following verb sequence written to the registers during
+ * initialization will correct the issues listed above.
+ */
+
+static const struct hda_verb cs421x_coef_init_verbs_A1_silicon_fixes[] = {
+	{0x0B, AC_VERB_SET_PROC_STATE, 0x01},  /* VPW: processing on */
+
+	{0x0B, AC_VERB_SET_COEF_INDEX, 0x0006},
+	{0x0B, AC_VERB_SET_PROC_COEF, 0x9999}, /* Test mode: on */
+
+	{0x0B, AC_VERB_SET_COEF_INDEX, 0x000A},
+	{0x0B, AC_VERB_SET_PROC_COEF, 0x14CB}, /* Chop double */
+
+	{0x0B, AC_VERB_SET_COEF_INDEX, 0x0011},
+	{0x0B, AC_VERB_SET_PROC_COEF, 0xA2D0}, /* Increase ADC current */
+
+	{0x0B, AC_VERB_SET_COEF_INDEX, 0x001A},
+	{0x0B, AC_VERB_SET_PROC_COEF, 0x02A9}, /* Mute speaker */
+
+	{0x0B, AC_VERB_SET_COEF_INDEX, 0x001B},
+	{0x0B, AC_VERB_SET_PROC_COEF, 0X1006}, /* Remove noise */
+
+	{} /* terminator */
+};
+
+/* Speaker Amp Gain is controlled by the vendor widget's coef 4 */
+static const DECLARE_TLV_DB_SCALE(cs421x_speaker_boost_db_scale, 900, 300, 0);
+
+static int cs421x_boost_vol_info(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 1;
+	uinfo->value.integer.min = 0;
+	uinfo->value.integer.max = 3;
+	return 0;
+}
+
+static int cs421x_boost_vol_get(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct hda_codec *codec = snd_kcontrol_chip(kcontrol);
+
+	ucontrol->value.integer.value[0] =
+		cs_vendor_coef_get(codec, CS421X_IDX_SPK_CTL) & 0x0003;
+	return 0;
+}
+
+static int cs421x_boost_vol_put(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct hda_codec *codec = snd_kcontrol_chip(kcontrol);
+
+	unsigned int vol = ucontrol->value.integer.value[0];
+	unsigned int coef =
+		cs_vendor_coef_get(codec, CS421X_IDX_SPK_CTL);
+	unsigned int original_coef = coef;
+
+	coef &= ~0x0003;
+	coef |= (vol & 0x0003);
+	if (original_coef != coef) {
+		cs_vendor_coef_set(codec, CS421X_IDX_SPK_CTL, coef);
+		return 1;
+	}
+
+	return 0;
+}
+
+static const struct snd_kcontrol_new cs421x_speaker_boost_ctl = {
+
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+	.access = (SNDRV_CTL_ELEM_ACCESS_READWRITE |
+			SNDRV_CTL_ELEM_ACCESS_TLV_READ),
+	.name = "Speaker Boost Playback Volume",
+	.info = cs421x_boost_vol_info,
+	.get = cs421x_boost_vol_get,
+	.put = cs421x_boost_vol_put,
+	.tlv = { .p = cs421x_speaker_boost_db_scale },
+};
+
+static void cs4210_pinmux_init(struct hda_codec *codec)
+{
+	struct cs_spec *spec = codec->spec;
+	unsigned int def_conf, coef;
+
+	/* GPIO, DMIC_SCL, DMIC_SDA and SENSE_B are multiplexed */
+	coef = cs_vendor_coef_get(codec, CS421X_IDX_DEV_CFG);
+
+	if (spec->gpio_mask)
+		coef |= 0x0008; /* B1,B2 are GPIOs */
+	else
+		coef &= ~0x0008;
+
+	if (spec->sense_b)
+		coef |= 0x0010; /* B2 is SENSE_B, not inverted  */
+	else
+		coef &= ~0x0010;
+
+	cs_vendor_coef_set(codec, CS421X_IDX_DEV_CFG, coef);
+
+	if ((spec->gpio_mask || spec->sense_b) &&
+	    is_active_pin(codec, CS421X_DMIC_PIN_NID)) {
+
+		/*
+		 *  GPIO or SENSE_B forced - disconnect the DMIC pin.
+		 */
+		def_conf = snd_hda_codec_get_pincfg(codec, CS421X_DMIC_PIN_NID);
+		def_conf &= ~AC_DEFCFG_PORT_CONN;
+		def_conf |= (AC_JACK_PORT_NONE << AC_DEFCFG_PORT_CONN_SHIFT);
+		snd_hda_codec_set_pincfg(codec, CS421X_DMIC_PIN_NID, def_conf);
+	}
+}
+
+static void cs4210_spdif_automute(struct hda_codec *codec,
+				  struct hda_jack_callback *tbl)
+{
+	struct cs_spec *spec = codec->spec;
+	bool spdif_present = false;
+	hda_nid_t spdif_pin = spec->gen.autocfg.dig_out_pins[0];
+
+	/* detect on spdif is specific to CS4210 */
+	if (!spec->spdif_detect ||
+	    spec->vendor_nid != CS4210_VENDOR_NID)
+		return;
+
+	spdif_present = snd_hda_jack_detect(codec, spdif_pin);
+	if (spdif_present == spec->spdif_present)
+		return;
+
+	spec->spdif_present = spdif_present;
+	/* SPDIF TX on/off */
+	snd_hda_set_pin_ctl(codec, spdif_pin, spdif_present ? PIN_OUT : 0);
+
+	cs_automute(codec);
+}
+
+static void parse_cs421x_digital(struct hda_codec *codec)
+{
+	struct cs_spec *spec = codec->spec;
+	struct auto_pin_cfg *cfg = &spec->gen.autocfg;
+	int i;
+
+	for (i = 0; i < cfg->dig_outs; i++) {
+		hda_nid_t nid = cfg->dig_out_pins[i];
+
+		if (get_wcaps(codec, nid) & AC_WCAP_UNSOL_CAP) {
+			spec->spdif_detect = 1;
+			snd_hda_jack_detect_enable_callback(codec, nid,
+							    cs4210_spdif_automute);
+		}
+	}
+}
+
+static int cs421x_init(struct hda_codec *codec)
+{
+	struct cs_spec *spec = codec->spec;
+
+	if (spec->vendor_nid == CS4210_VENDOR_NID) {
+		snd_hda_sequence_write(codec, cs421x_coef_init_verbs);
+		snd_hda_sequence_write(codec, cs421x_coef_init_verbs_A1_silicon_fixes);
+		cs4210_pinmux_init(codec);
+	}
+
+	snd_hda_gen_init(codec);
+
+	if (spec->gpio_mask) {
+		snd_hda_codec_write(codec, 0x01, 0, AC_VERB_SET_GPIO_MASK,
+				    spec->gpio_mask);
+		snd_hda_codec_write(codec, 0x01, 0, AC_VERB_SET_GPIO_DIRECTION,
+				    spec->gpio_dir);
+		snd_hda_codec_write(codec, 0x01, 0, AC_VERB_SET_GPIO_DATA,
+				    spec->gpio_data);
+	}
+
+	cs4210_spdif_automute(codec, NULL);
+
+	return 0;
+}
+
+static void fix_volume_caps(struct hda_codec *codec, hda_nid_t dac)
+{
+	unsigned int caps;
+
+	/* set the upper-limit for mixer amp to 0dB */
+	caps = query_amp_caps(codec, dac, HDA_OUTPUT);
+	caps &= ~(0x7f << AC_AMPCAP_NUM_STEPS_SHIFT);
+	caps |= ((caps >> AC_AMPCAP_OFFSET_SHIFT) & 0x7f)
+		<< AC_AMPCAP_NUM_STEPS_SHIFT;
+	snd_hda_override_amp_caps(codec, dac, HDA_OUTPUT, caps);
+}
+
+static int cs421x_parse_auto_config(struct hda_codec *codec)
+{
+	struct cs_spec *spec = codec->spec;
+	hda_nid_t dac = CS4210_DAC_NID;
+	int err;
+
+	fix_volume_caps(codec, dac);
+
+	err = snd_hda_parse_pin_defcfg(codec, &spec->gen.autocfg, NULL, 0);
+	if (err < 0)
+		return err;
+
+	err = snd_hda_gen_parse_auto_config(codec, &spec->gen.autocfg);
+	if (err < 0)
+		return err;
+
+	parse_cs421x_digital(codec);
+
+	if (spec->gen.autocfg.speaker_outs &&
+	    spec->vendor_nid == CS4210_VENDOR_NID) {
+		if (!snd_hda_gen_add_kctl(&spec->gen, NULL,
+					  &cs421x_speaker_boost_ctl))
+			return -ENOMEM;
+	}
+
+	return 0;
+}
+
+/*
+ *	Manage PDREF, when transitioning to D3hot
+ *	(DAC,ADC) -> D3, PDREF=1, AFG->D3
+ */
+static int cs421x_suspend(struct hda_codec *codec)
+{
+	struct cs_spec *spec = codec->spec;
+	unsigned int coef;
+
+	snd_hda_shutup_pins(codec);
+
+	snd_hda_codec_write(codec, CS4210_DAC_NID, 0,
+			    AC_VERB_SET_POWER_STATE,  AC_PWRST_D3);
+	snd_hda_codec_write(codec, CS4210_ADC_NID, 0,
+			    AC_VERB_SET_POWER_STATE,  AC_PWRST_D3);
+
+	if (spec->vendor_nid == CS4210_VENDOR_NID) {
+		coef = cs_vendor_coef_get(codec, CS421X_IDX_DEV_CFG);
+		coef |= 0x0004; /* PDREF */
+		cs_vendor_coef_set(codec, CS421X_IDX_DEV_CFG, coef);
+	}
+
+	return 0;
+}
+
+static int cs421x_probe(struct hda_codec *codec, const struct hda_device_id *id)
+{
+	struct cs_spec *spec;
+	int err;
+
+	spec = cs_alloc_spec(codec, id->driver_data);
+	if (!spec)
+		return -ENOMEM;
+
+	spec->gen.automute_hook = cs_automute;
+
+	if (spec->vendor_nid == CS4210_VENDOR_NID) {
+		snd_hda_pick_fixup(codec, cs421x_models, cs421x_fixup_tbl,
+				   cs421x_fixups);
+		snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PRE_PROBE);
+
+		/*
+		 *  Update the GPIO/DMIC/SENSE_B pinmux before the configuration
+		 *   is auto-parsed. If GPIO or SENSE_B is forced, DMIC input
+		 *   is disabled.
+		 */
+		cs4210_pinmux_init(codec);
+	}
+
+	err = cs421x_parse_auto_config(codec);
+	if (err < 0)
+		goto error;
+
+	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PROBE);
+
+	return 0;
+
+ error:
+	snd_hda_gen_remove(codec);
+	return err;
+}
+
+static const struct hda_codec_ops cs421x_codec_ops = {
+	.probe = cs421x_probe,
+	.remove = snd_hda_gen_remove,
+	.build_controls = snd_hda_gen_build_controls,
+	.build_pcms = snd_hda_gen_build_pcms,
+	.init = cs421x_init,
+	.unsol_event = snd_hda_jack_unsol_event,
+	.suspend = cs421x_suspend,
+	.stream_pm = snd_hda_gen_stream_pm,
+};
+
+/*
+ * driver entries
+ */
+static const struct hda_device_id snd_hda_id_cs421x[] = {
+	HDA_CODEC_ID_MODEL(0x10134210, "CS4210", CS4210_VENDOR_NID),
+	HDA_CODEC_ID_MODEL(0x10134213, "CS4213", CS4213_VENDOR_NID),
+	{} /* terminator */
+};
+MODULE_DEVICE_TABLE(hdaudio, snd_hda_id_cs421x);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Cirrus Logic CS421x HD-audio codec");
+
+static struct hda_codec_driver cs421x_driver = {
+	.id = snd_hda_id_cs421x,
+	.ops = &cs421x_codec_ops,
+};
+
+module_hda_codec_driver(cs421x_driver);
-- 
2.50.0

