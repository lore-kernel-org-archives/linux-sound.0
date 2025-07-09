Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3042C08CF
	for <linux-sound@vger.kernel.org>; Wed,  9 Jul 2025 16:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752077529; cv=none; b=N5S9XR2lKLK3H86TrXyCaNdkzev+PeWwvjxOykC7MoM8pGeQJhVrAslNbtxP3UKM6gnCY14jbjsyKuQ8ecyOl+OvsGCmBvzQa1OvfsMWNhhzMSFXi8qkFCQxwv+pgYvZ4x1lgh7aYbDXdqdwtMN6gLOmIIcYofMyZIDG8q0syAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752077529; c=relaxed/simple;
	bh=RrOvLN61Sz4klbc10MRf/F0HGVivTsZmQUAWBitg5Gc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e4xMi0pSsR/2X0CvIl0azP2ylET0T5itCjACDjkWNch+9IhyQCfZaqL41T0L8Wp5/Td9982QDzH/skQPAu0i2bvNJ+9wAo7nzHk0kxI+P2XOlux3BbUW66N5SYxdLSSSieozjmZp6pHaK5R6mUmk6FzGFiifaXGxX+8MF9kL1WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MDP7YIPq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=krKaLA3m; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MDP7YIPq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=krKaLA3m; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MDP7YIPq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="krKaLA3m";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MDP7YIPq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="krKaLA3m"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1153121179;
	Wed,  9 Jul 2025 16:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752077093; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FcPA3+F4xWe1Tde1Em25P9wfMxo6ztobJItbY6UAcbY=;
	b=MDP7YIPqiC3x6XZZL5uWFhjwUrNIE4YqdT60rP8ciBBFfDLC0mTm8qCwtMBVh76g+SZOS0
	ecwSeGAChUhR7iJ0aVEwpuJyODrFDXv4W3vPQ47j1F7bSBs/9CbCdhby1fu2jpxtAFlV6e
	XTu5LVP12ewYtYWdH87kU1zTABhJXiA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752077093;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FcPA3+F4xWe1Tde1Em25P9wfMxo6ztobJItbY6UAcbY=;
	b=krKaLA3m9Yky5ciP22GwyeVrNYh07ooNOVJDX2IMWekdzKKLP2g3JYP6OpODO6ApB8r8Fk
	GG8t97limrN0G8AQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=MDP7YIPq;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=krKaLA3m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752077093; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FcPA3+F4xWe1Tde1Em25P9wfMxo6ztobJItbY6UAcbY=;
	b=MDP7YIPqiC3x6XZZL5uWFhjwUrNIE4YqdT60rP8ciBBFfDLC0mTm8qCwtMBVh76g+SZOS0
	ecwSeGAChUhR7iJ0aVEwpuJyODrFDXv4W3vPQ47j1F7bSBs/9CbCdhby1fu2jpxtAFlV6e
	XTu5LVP12ewYtYWdH87kU1zTABhJXiA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752077093;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FcPA3+F4xWe1Tde1Em25P9wfMxo6ztobJItbY6UAcbY=;
	b=krKaLA3m9Yky5ciP22GwyeVrNYh07ooNOVJDX2IMWekdzKKLP2g3JYP6OpODO6ApB8r8Fk
	GG8t97limrN0G8AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C0B12136DC;
	Wed,  9 Jul 2025 16:04:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eHbPLSSTbmhDEAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 09 Jul 2025 16:04:52 +0000
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
Subject: [PATCH 12/27] ALSA: hda/cmedia: Rewrite to new probe method
Date: Wed,  9 Jul 2025 18:04:15 +0200
Message-ID: <20250709160434.1859-13-tiwai@suse.de>
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
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim,suse.de:email];
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
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 1153121179
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Convert the C-Media codec driver to use the new hda_codec_ops probe.

Since the CM9825 uses a completely different probe and codec ops,
factor out to an individual codec driver, snd-hda-codec-cm9825.

Other than that, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/Kconfig  |  10 +
 sound/hda/codecs/Makefile |   2 +
 sound/hda/codecs/cm9825.c | 312 ++++++++++++++++++++++++++++++++
 sound/hda/codecs/cmedia.c | 372 +++++---------------------------------
 4 files changed, 365 insertions(+), 331 deletions(-)
 create mode 100644 sound/hda/codecs/cm9825.c

diff --git a/sound/hda/codecs/Kconfig b/sound/hda/codecs/Kconfig
index e8c2efd2efb6..addbc9424336 100644
--- a/sound/hda/codecs/Kconfig
+++ b/sound/hda/codecs/Kconfig
@@ -99,6 +99,16 @@ config SND_HDA_CODEC_CMEDIA
 comment "Set to Y if you want auto-loading the codec driver"
 	depends on SND_HDA=y && SND_HDA_CODEC_CMEDIA=m
 
+config SND_HDA_CODEC_CM9825
+	tristate "Build C-Media CM9825 HD-audio codec support"
+	select SND_HDA_GENERIC
+	help
+	  Say Y or M here to include C-Media CM9825 HD-audio codec support in
+	  snd-hda-intel driver
+
+comment "Set to Y if you want auto-loading the codec driver"
+	depends on SND_HDA=y && SND_HDA_CODEC_CM9825=m
+
 config SND_HDA_CODEC_SI3054
 	tristate "Build Silicon Labs 3054 HD-modem codec support"
 	help
diff --git a/sound/hda/codecs/Makefile b/sound/hda/codecs/Makefile
index 14e5041aa4f0..e7f03e281999 100644
--- a/sound/hda/codecs/Makefile
+++ b/sound/hda/codecs/Makefile
@@ -3,6 +3,7 @@ subdir-ccflags-y += -I$(src)/../common
 
 snd-hda-codec-generic-y :=	generic.o
 snd-hda-codec-cmedia-y :=	cmedia.o
+snd-hda-codec-cm9825-y :=	cm9825.o
 snd-hda-codec-analog-y :=	analog.o
 snd-hda-codec-ca0110-y :=	ca0110.o
 snd-hda-codec-ca0132-y :=	ca0132.o
@@ -21,6 +22,7 @@ obj-y += side-codecs/
 # codec drivers
 obj-$(CONFIG_SND_HDA_GENERIC) += snd-hda-codec-generic.o
 obj-$(CONFIG_SND_HDA_CODEC_CMEDIA) += snd-hda-codec-cmedia.o
+obj-$(CONFIG_SND_HDA_CODEC_CM9825) += snd-hda-codec-cm9825.o
 obj-$(CONFIG_SND_HDA_CODEC_ANALOG) += snd-hda-codec-analog.o
 obj-$(CONFIG_SND_HDA_CODEC_CA0110) += snd-hda-codec-ca0110.o
 obj-$(CONFIG_SND_HDA_CODEC_CA0132) += snd-hda-codec-ca0132.o
diff --git a/sound/hda/codecs/cm9825.c b/sound/hda/codecs/cm9825.c
new file mode 100644
index 000000000000..5c474ce44348
--- /dev/null
+++ b/sound/hda/codecs/cm9825.c
@@ -0,0 +1,312 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * CM9825 HD-audio codec
+ */
+
+#include <linux/init.h>
+#include <linux/slab.h>
+#include <linux/module.h>
+#include <sound/core.h>
+#include <sound/hda_codec.h>
+#include "hda_local.h"
+#include "hda_auto_parser.h"
+#include "hda_jack.h"
+#include "generic.h"
+
+/* CM9825 Offset Definitions */
+
+#define CM9825_VERB_SET_HPF_1 0x781
+#define CM9825_VERB_SET_HPF_2 0x785
+#define CM9825_VERB_SET_PLL 0x7a0
+#define CM9825_VERB_SET_NEG 0x7a1
+#define CM9825_VERB_SET_ADCL 0x7a2
+#define CM9825_VERB_SET_DACL 0x7a3
+#define CM9825_VERB_SET_MBIAS 0x7a4
+#define CM9825_VERB_SET_VNEG 0x7a8
+#define CM9825_VERB_SET_D2S 0x7a9
+#define CM9825_VERB_SET_DACTRL 0x7aa
+#define CM9825_VERB_SET_PDNEG 0x7ac
+#define CM9825_VERB_SET_VDO 0x7ad
+#define CM9825_VERB_SET_CDALR 0x7b0
+#define CM9825_VERB_SET_MTCBA 0x7b1
+#define CM9825_VERB_SET_OTP 0x7b2
+#define CM9825_VERB_SET_OCP 0x7b3
+#define CM9825_VERB_SET_GAD 0x7b4
+#define CM9825_VERB_SET_TMOD 0x7b5
+#define CM9825_VERB_SET_SNR 0x7b6
+
+struct cmi_spec {
+	struct hda_gen_spec gen;
+	const struct hda_verb *chip_d0_verbs;
+	const struct hda_verb *chip_d3_verbs;
+	const struct hda_verb *chip_hp_present_verbs;
+	const struct hda_verb *chip_hp_remove_verbs;
+	struct hda_codec *codec;
+	struct delayed_work unsol_hp_work;
+	int quirk;
+};
+
+static const struct hda_verb cm9825_std_d3_verbs[] = {
+	/* chip sleep verbs */
+	{0x43, CM9825_VERB_SET_D2S, 0x62},	/* depop */
+	{0x43, CM9825_VERB_SET_PLL, 0x01},	/* PLL set */
+	{0x43, CM9825_VERB_SET_NEG, 0xc2},	/* NEG set */
+	{0x43, CM9825_VERB_SET_ADCL, 0x00},	/* ADC */
+	{0x43, CM9825_VERB_SET_DACL, 0x02},	/* DACL */
+	{0x43, CM9825_VERB_SET_VNEG, 0x50},	/* VOL NEG */
+	{0x43, CM9825_VERB_SET_MBIAS, 0x00},	/* MBIAS */
+	{0x43, CM9825_VERB_SET_PDNEG, 0x04},	/* SEL OSC */
+	{0x43, CM9825_VERB_SET_CDALR, 0xf6},	/* Class D */
+	{0x43, CM9825_VERB_SET_OTP, 0xcd},	/* OTP set */
+	{}
+};
+
+static const struct hda_verb cm9825_std_d0_verbs[] = {
+	/* chip init verbs */
+	{0x34, AC_VERB_SET_EAPD_BTLENABLE, 0x02},	/* EAPD set */
+	{0x43, CM9825_VERB_SET_SNR, 0x30},	/* SNR set */
+	{0x43, CM9825_VERB_SET_PLL, 0x00},	/* PLL set */
+	{0x43, CM9825_VERB_SET_ADCL, 0x00},	/* ADC */
+	{0x43, CM9825_VERB_SET_DACL, 0x02},	/* DACL */
+	{0x43, CM9825_VERB_SET_MBIAS, 0x00},	/* MBIAS */
+	{0x43, CM9825_VERB_SET_VNEG, 0x56},	/* VOL NEG */
+	{0x43, CM9825_VERB_SET_D2S, 0x62},	/* depop */
+	{0x43, CM9825_VERB_SET_DACTRL, 0x00},	/* DACTRL set */
+	{0x43, CM9825_VERB_SET_PDNEG, 0x0c},	/* SEL OSC */
+	{0x43, CM9825_VERB_SET_VDO, 0x80},	/* VDO set */
+	{0x43, CM9825_VERB_SET_CDALR, 0xf4},	/* Class D */
+	{0x43, CM9825_VERB_SET_OTP, 0xcd},	/* OTP set */
+	{0x43, CM9825_VERB_SET_MTCBA, 0x61},	/* SR set */
+	{0x43, CM9825_VERB_SET_OCP, 0x33},	/* OTP set */
+	{0x43, CM9825_VERB_SET_GAD, 0x07},	/* ADC -3db */
+	{0x43, CM9825_VERB_SET_TMOD, 0x26},	/* Class D clk */
+	{0x3C, AC_VERB_SET_AMP_GAIN_MUTE |
+		AC_AMP_SET_OUTPUT | AC_AMP_SET_RIGHT, 0x2d},	/* Gain set */
+	{0x3C, AC_VERB_SET_AMP_GAIN_MUTE |
+		AC_AMP_SET_OUTPUT | AC_AMP_SET_LEFT, 0x2d},	/* Gain set */
+	{0x43, CM9825_VERB_SET_HPF_1, 0x40},	/* HPF set */
+	{0x43, CM9825_VERB_SET_HPF_2, 0x40},	/* HPF set */
+	{}
+};
+
+static const struct hda_verb cm9825_hp_present_verbs[] = {
+	{0x42, AC_VERB_SET_PIN_WIDGET_CONTROL, 0x00},	/* PIN off */
+	{0x43, CM9825_VERB_SET_ADCL, 0x88},	/* ADC */
+	{0x43, CM9825_VERB_SET_DACL, 0xaa},	/* DACL */
+	{0x43, CM9825_VERB_SET_MBIAS, 0x10},	/* MBIAS */
+	{0x43, CM9825_VERB_SET_D2S, 0xf2},	/* depop */
+	{0x43, CM9825_VERB_SET_DACTRL, 0x00},	/* DACTRL set */
+	{0x43, CM9825_VERB_SET_VDO, 0xc4},	/* VDO set */
+	{}
+};
+
+static const struct hda_verb cm9825_hp_remove_verbs[] = {
+	{0x43, CM9825_VERB_SET_ADCL, 0x00},	/* ADC */
+	{0x43, CM9825_VERB_SET_DACL, 0x56},	/* DACL */
+	{0x43, CM9825_VERB_SET_MBIAS, 0x00},	/* MBIAS */
+	{0x43, CM9825_VERB_SET_D2S, 0x62},	/* depop */
+	{0x43, CM9825_VERB_SET_DACTRL, 0xe0},	/* DACTRL set */
+	{0x43, CM9825_VERB_SET_VDO, 0x80},	/* VDO set */
+	{0x42, AC_VERB_SET_PIN_WIDGET_CONTROL, 0x40},	/* PIN on */
+	{}
+};
+
+static void cm9825_unsol_hp_delayed(struct work_struct *work)
+{
+	struct cmi_spec *spec =
+	    container_of(to_delayed_work(work), struct cmi_spec, unsol_hp_work);
+	struct hda_jack_tbl *jack;
+	hda_nid_t hp_pin = spec->gen.autocfg.hp_pins[0];
+	bool hp_jack_plugin = false;
+	int err = 0;
+
+	hp_jack_plugin = snd_hda_jack_detect(spec->codec, hp_pin);
+
+	codec_dbg(spec->codec, "hp_jack_plugin %d, hp_pin 0x%X\n",
+		  (int)hp_jack_plugin, hp_pin);
+
+	if (!hp_jack_plugin) {
+		err =
+		    snd_hda_codec_write(spec->codec, 0x42, 0,
+					AC_VERB_SET_PIN_WIDGET_CONTROL, 0x40);
+		if (err)
+			codec_dbg(spec->codec, "codec_write err %d\n", err);
+
+		snd_hda_sequence_write(spec->codec, spec->chip_hp_remove_verbs);
+	} else {
+		snd_hda_sequence_write(spec->codec,
+				       spec->chip_hp_present_verbs);
+	}
+
+	jack = snd_hda_jack_tbl_get(spec->codec, hp_pin);
+	if (jack) {
+		jack->block_report = 0;
+		snd_hda_jack_report_sync(spec->codec);
+	}
+}
+
+static void hp_callback(struct hda_codec *codec, struct hda_jack_callback *cb)
+{
+	struct cmi_spec *spec = codec->spec;
+	struct hda_jack_tbl *tbl;
+
+	/* Delay enabling the HP amp, to let the mic-detection
+	 * state machine run.
+	 */
+
+	codec_dbg(spec->codec, "cb->nid 0x%X\n", cb->nid);
+
+	tbl = snd_hda_jack_tbl_get(codec, cb->nid);
+	if (tbl)
+		tbl->block_report = 1;
+	schedule_delayed_work(&spec->unsol_hp_work, msecs_to_jiffies(200));
+}
+
+static void cm9825_setup_unsol(struct hda_codec *codec)
+{
+	struct cmi_spec *spec = codec->spec;
+
+	hda_nid_t hp_pin = spec->gen.autocfg.hp_pins[0];
+
+	snd_hda_jack_detect_enable_callback(codec, hp_pin, hp_callback);
+}
+
+static int cm9825_init(struct hda_codec *codec)
+{
+	snd_hda_gen_init(codec);
+	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_INIT);
+
+	return 0;
+}
+
+static void cm9825_remove(struct hda_codec *codec)
+{
+	struct cmi_spec *spec = codec->spec;
+
+	cancel_delayed_work_sync(&spec->unsol_hp_work);
+	snd_hda_gen_remove(codec);
+}
+
+static int cm9825_suspend(struct hda_codec *codec)
+{
+	struct cmi_spec *spec = codec->spec;
+
+	cancel_delayed_work_sync(&spec->unsol_hp_work);
+
+	snd_hda_sequence_write(codec, spec->chip_d3_verbs);
+
+	return 0;
+}
+
+static int cm9825_resume(struct hda_codec *codec)
+{
+	struct cmi_spec *spec = codec->spec;
+	hda_nid_t hp_pin = 0;
+	bool hp_jack_plugin = false;
+	int err;
+
+	err =
+	    snd_hda_codec_write(spec->codec, 0x42, 0,
+				AC_VERB_SET_PIN_WIDGET_CONTROL, 0x00);
+	if (err)
+		codec_dbg(codec, "codec_write err %d\n", err);
+
+	msleep(150);		/* for depop noise */
+
+	snd_hda_codec_init(codec);
+
+	hp_pin = spec->gen.autocfg.hp_pins[0];
+	hp_jack_plugin = snd_hda_jack_detect(spec->codec, hp_pin);
+
+	codec_dbg(spec->codec, "hp_jack_plugin %d, hp_pin 0x%X\n",
+		  (int)hp_jack_plugin, hp_pin);
+
+	if (!hp_jack_plugin) {
+		err =
+		    snd_hda_codec_write(spec->codec, 0x42, 0,
+					AC_VERB_SET_PIN_WIDGET_CONTROL, 0x40);
+
+		if (err)
+			codec_dbg(codec, "codec_write err %d\n", err);
+
+		snd_hda_sequence_write(codec, cm9825_hp_remove_verbs);
+	}
+
+	snd_hda_regmap_sync(codec);
+	hda_call_check_power_status(codec, 0x01);
+
+	return 0;
+}
+
+static int cm9825_probe(struct hda_codec *codec, const struct hda_device_id *id)
+{
+	struct cmi_spec *spec;
+	struct auto_pin_cfg *cfg;
+	int err;
+
+	spec = kzalloc(sizeof(*spec), GFP_KERNEL);
+	if (spec == NULL)
+		return -ENOMEM;
+
+	INIT_DELAYED_WORK(&spec->unsol_hp_work, cm9825_unsol_hp_delayed);
+	codec->spec = spec;
+	spec->codec = codec;
+	cfg = &spec->gen.autocfg;
+	snd_hda_gen_spec_init(&spec->gen);
+	spec->chip_d0_verbs = cm9825_std_d0_verbs;
+	spec->chip_d3_verbs = cm9825_std_d3_verbs;
+	spec->chip_hp_present_verbs = cm9825_hp_present_verbs;
+	spec->chip_hp_remove_verbs = cm9825_hp_remove_verbs;
+
+	snd_hda_sequence_write(codec, spec->chip_d0_verbs);
+
+	err = snd_hda_parse_pin_defcfg(codec, cfg, NULL, 0);
+	if (err < 0)
+		goto error;
+	err = snd_hda_gen_parse_auto_config(codec, cfg);
+	if (err < 0)
+		goto error;
+
+	cm9825_setup_unsol(codec);
+
+	return 0;
+
+ error:
+	cm9825_remove(codec);
+
+	codec_info(codec, "Enter err %d\n", err);
+
+	return err;
+}
+
+static const struct hda_codec_ops cm9825_codec_ops = {
+	.probe = cm9825_probe,
+	.remove = cm9825_remove,
+	.build_controls = snd_hda_gen_build_controls,
+	.build_pcms = snd_hda_gen_build_pcms,
+	.init = cm9825_init,
+	.unsol_event = snd_hda_jack_unsol_event,
+	.suspend = cm9825_suspend,
+	.resume = cm9825_resume,
+	.check_power_status = snd_hda_gen_check_power_status,
+	.stream_pm = snd_hda_gen_stream_pm,
+};
+
+/*
+ * driver entries
+ */
+static const struct hda_device_id snd_hda_id_cm9825[] = {
+	HDA_CODEC_ID(0x13f69825, "CM9825"),
+	{} /* terminator */
+};
+MODULE_DEVICE_TABLE(hdaudio, snd_hda_id_cm9825);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("CM9825 HD-audio codec");
+
+static struct hda_codec_driver cm9825_driver = {
+	.id = snd_hda_id_cm9825,
+	.ops = &cm9825_codec_ops,
+};
+
+module_hda_codec_driver(cm9825_driver);
diff --git a/sound/hda/codecs/cmedia.c b/sound/hda/codecs/cmedia.c
index c88da2f8233e..15e5a1118a6e 100644
--- a/sound/hda/codecs/cmedia.c
+++ b/sound/hda/codecs/cmedia.c
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Universal Interface for Intel High Definition Audio Codec
+ * Universal codec driver for Intel High Definition Audio Codec
  *
- * HD audio interface patch for C-Media CMI9880
+ * HD audio codec driver for C-Media CMI9880
  *
  * Copyright (c) 2004 Takashi Iwai <tiwai@suse.de>
  */
@@ -17,293 +17,11 @@
 #include "hda_jack.h"
 #include "generic.h"
 
-/* CM9825 Offset Definitions */
-
-#define CM9825_VERB_SET_HPF_1 0x781
-#define CM9825_VERB_SET_HPF_2 0x785
-#define CM9825_VERB_SET_PLL 0x7a0
-#define CM9825_VERB_SET_NEG 0x7a1
-#define CM9825_VERB_SET_ADCL 0x7a2
-#define CM9825_VERB_SET_DACL 0x7a3
-#define CM9825_VERB_SET_MBIAS 0x7a4
-#define CM9825_VERB_SET_VNEG 0x7a8
-#define CM9825_VERB_SET_D2S 0x7a9
-#define CM9825_VERB_SET_DACTRL 0x7aa
-#define CM9825_VERB_SET_PDNEG 0x7ac
-#define CM9825_VERB_SET_VDO 0x7ad
-#define CM9825_VERB_SET_CDALR 0x7b0
-#define CM9825_VERB_SET_MTCBA 0x7b1
-#define CM9825_VERB_SET_OTP 0x7b2
-#define CM9825_VERB_SET_OCP 0x7b3
-#define CM9825_VERB_SET_GAD 0x7b4
-#define CM9825_VERB_SET_TMOD 0x7b5
-#define CM9825_VERB_SET_SNR 0x7b6
-
-struct cmi_spec {
-	struct hda_gen_spec gen;
-	const struct hda_verb *chip_d0_verbs;
-	const struct hda_verb *chip_d3_verbs;
-	const struct hda_verb *chip_hp_present_verbs;
-	const struct hda_verb *chip_hp_remove_verbs;
-	struct hda_codec *codec;
-	struct delayed_work unsol_hp_work;
-	int quirk;
-};
-
-static const struct hda_verb cm9825_std_d3_verbs[] = {
-	/* chip sleep verbs */
-	{0x43, CM9825_VERB_SET_D2S, 0x62},	/* depop */
-	{0x43, CM9825_VERB_SET_PLL, 0x01},	/* PLL set */
-	{0x43, CM9825_VERB_SET_NEG, 0xc2},	/* NEG set */
-	{0x43, CM9825_VERB_SET_ADCL, 0x00},	/* ADC */
-	{0x43, CM9825_VERB_SET_DACL, 0x02},	/* DACL */
-	{0x43, CM9825_VERB_SET_VNEG, 0x50},	/* VOL NEG */
-	{0x43, CM9825_VERB_SET_MBIAS, 0x00},	/* MBIAS */
-	{0x43, CM9825_VERB_SET_PDNEG, 0x04},	/* SEL OSC */
-	{0x43, CM9825_VERB_SET_CDALR, 0xf6},	/* Class D */
-	{0x43, CM9825_VERB_SET_OTP, 0xcd},	/* OTP set */
-	{}
-};
-
-static const struct hda_verb cm9825_std_d0_verbs[] = {
-	/* chip init verbs */
-	{0x34, AC_VERB_SET_EAPD_BTLENABLE, 0x02},	/* EAPD set */
-	{0x43, CM9825_VERB_SET_SNR, 0x30},	/* SNR set */
-	{0x43, CM9825_VERB_SET_PLL, 0x00},	/* PLL set */
-	{0x43, CM9825_VERB_SET_ADCL, 0x00},	/* ADC */
-	{0x43, CM9825_VERB_SET_DACL, 0x02},	/* DACL */
-	{0x43, CM9825_VERB_SET_MBIAS, 0x00},	/* MBIAS */
-	{0x43, CM9825_VERB_SET_VNEG, 0x56},	/* VOL NEG */
-	{0x43, CM9825_VERB_SET_D2S, 0x62},	/* depop */
-	{0x43, CM9825_VERB_SET_DACTRL, 0x00},	/* DACTRL set */
-	{0x43, CM9825_VERB_SET_PDNEG, 0x0c},	/* SEL OSC */
-	{0x43, CM9825_VERB_SET_VDO, 0x80},	/* VDO set */
-	{0x43, CM9825_VERB_SET_CDALR, 0xf4},	/* Class D */
-	{0x43, CM9825_VERB_SET_OTP, 0xcd},	/* OTP set */
-	{0x43, CM9825_VERB_SET_MTCBA, 0x61},	/* SR set */
-	{0x43, CM9825_VERB_SET_OCP, 0x33},	/* OTP set */
-	{0x43, CM9825_VERB_SET_GAD, 0x07},	/* ADC -3db */
-	{0x43, CM9825_VERB_SET_TMOD, 0x26},	/* Class D clk */
-	{0x3C, AC_VERB_SET_AMP_GAIN_MUTE |
-		AC_AMP_SET_OUTPUT | AC_AMP_SET_RIGHT, 0x2d},	/* Gain set */
-	{0x3C, AC_VERB_SET_AMP_GAIN_MUTE |
-		AC_AMP_SET_OUTPUT | AC_AMP_SET_LEFT, 0x2d},	/* Gain set */
-	{0x43, CM9825_VERB_SET_HPF_1, 0x40},	/* HPF set */
-	{0x43, CM9825_VERB_SET_HPF_2, 0x40},	/* HPF set */
-	{}
-};
-
-static const struct hda_verb cm9825_hp_present_verbs[] = {
-	{0x42, AC_VERB_SET_PIN_WIDGET_CONTROL, 0x00},	/* PIN off */
-	{0x43, CM9825_VERB_SET_ADCL, 0x88},	/* ADC */
-	{0x43, CM9825_VERB_SET_DACL, 0xaa},	/* DACL */
-	{0x43, CM9825_VERB_SET_MBIAS, 0x10},	/* MBIAS */
-	{0x43, CM9825_VERB_SET_D2S, 0xf2},	/* depop */
-	{0x43, CM9825_VERB_SET_DACTRL, 0x00},	/* DACTRL set */
-	{0x43, CM9825_VERB_SET_VDO, 0xc4},	/* VDO set */
-	{}
-};
-
-static const struct hda_verb cm9825_hp_remove_verbs[] = {
-	{0x43, CM9825_VERB_SET_ADCL, 0x00},	/* ADC */
-	{0x43, CM9825_VERB_SET_DACL, 0x56},	/* DACL */
-	{0x43, CM9825_VERB_SET_MBIAS, 0x00},	/* MBIAS */
-	{0x43, CM9825_VERB_SET_D2S, 0x62},	/* depop */
-	{0x43, CM9825_VERB_SET_DACTRL, 0xe0},	/* DACTRL set */
-	{0x43, CM9825_VERB_SET_VDO, 0x80},	/* VDO set */
-	{0x42, AC_VERB_SET_PIN_WIDGET_CONTROL, 0x40},	/* PIN on */
-	{}
-};
-
-static void cm9825_unsol_hp_delayed(struct work_struct *work)
+static int cmedia_probe(struct hda_codec *codec, const struct hda_device_id *id)
 {
-	struct cmi_spec *spec =
-	    container_of(to_delayed_work(work), struct cmi_spec, unsol_hp_work);
-	struct hda_jack_tbl *jack;
-	hda_nid_t hp_pin = spec->gen.autocfg.hp_pins[0];
-	bool hp_jack_plugin = false;
-	int err = 0;
-
-	hp_jack_plugin = snd_hda_jack_detect(spec->codec, hp_pin);
-
-	codec_dbg(spec->codec, "hp_jack_plugin %d, hp_pin 0x%X\n",
-		  (int)hp_jack_plugin, hp_pin);
-
-	if (!hp_jack_plugin) {
-		err =
-		    snd_hda_codec_write(spec->codec, 0x42, 0,
-					AC_VERB_SET_PIN_WIDGET_CONTROL, 0x40);
-		if (err)
-			codec_dbg(spec->codec, "codec_write err %d\n", err);
-
-		snd_hda_sequence_write(spec->codec, spec->chip_hp_remove_verbs);
-	} else {
-		snd_hda_sequence_write(spec->codec,
-				       spec->chip_hp_present_verbs);
-	}
-
-	jack = snd_hda_jack_tbl_get(spec->codec, hp_pin);
-	if (jack) {
-		jack->block_report = 0;
-		snd_hda_jack_report_sync(spec->codec);
-	}
-}
-
-static void hp_callback(struct hda_codec *codec, struct hda_jack_callback *cb)
-{
-	struct cmi_spec *spec = codec->spec;
-	struct hda_jack_tbl *tbl;
-
-	/* Delay enabling the HP amp, to let the mic-detection
-	 * state machine run.
-	 */
-
-	codec_dbg(spec->codec, "cb->nid 0x%X\n", cb->nid);
-
-	tbl = snd_hda_jack_tbl_get(codec, cb->nid);
-	if (tbl)
-		tbl->block_report = 1;
-	schedule_delayed_work(&spec->unsol_hp_work, msecs_to_jiffies(200));
-}
-
-static void cm9825_setup_unsol(struct hda_codec *codec)
-{
-	struct cmi_spec *spec = codec->spec;
-
-	hda_nid_t hp_pin = spec->gen.autocfg.hp_pins[0];
-
-	snd_hda_jack_detect_enable_callback(codec, hp_pin, hp_callback);
-}
-
-static int cm9825_init(struct hda_codec *codec)
-{
-	snd_hda_gen_init(codec);
-	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_INIT);
-
-	return 0;
-}
-
-static void cm9825_free(struct hda_codec *codec)
-{
-	struct cmi_spec *spec = codec->spec;
-
-	cancel_delayed_work_sync(&spec->unsol_hp_work);
-	snd_hda_gen_free(codec);
-}
-
-static int cm9825_suspend(struct hda_codec *codec)
-{
-	struct cmi_spec *spec = codec->spec;
-
-	cancel_delayed_work_sync(&spec->unsol_hp_work);
-
-	snd_hda_sequence_write(codec, spec->chip_d3_verbs);
-
-	return 0;
-}
-
-static int cm9825_resume(struct hda_codec *codec)
-{
-	struct cmi_spec *spec = codec->spec;
-	hda_nid_t hp_pin = 0;
-	bool hp_jack_plugin = false;
-	int err;
-
-	err =
-	    snd_hda_codec_write(spec->codec, 0x42, 0,
-				AC_VERB_SET_PIN_WIDGET_CONTROL, 0x00);
-	if (err)
-		codec_dbg(codec, "codec_write err %d\n", err);
-
-	msleep(150);		/* for depop noise */
-
-	codec->patch_ops.init(codec);
-
-	hp_pin = spec->gen.autocfg.hp_pins[0];
-	hp_jack_plugin = snd_hda_jack_detect(spec->codec, hp_pin);
-
-	codec_dbg(spec->codec, "hp_jack_plugin %d, hp_pin 0x%X\n",
-		  (int)hp_jack_plugin, hp_pin);
-
-	if (!hp_jack_plugin) {
-		err =
-		    snd_hda_codec_write(spec->codec, 0x42, 0,
-					AC_VERB_SET_PIN_WIDGET_CONTROL, 0x40);
-
-		if (err)
-			codec_dbg(codec, "codec_write err %d\n", err);
-
-		snd_hda_sequence_write(codec, cm9825_hp_remove_verbs);
-	}
-
-	snd_hda_regmap_sync(codec);
-	hda_call_check_power_status(codec, 0x01);
-
-	return 0;
-}
-
-/*
- * stuff for auto-parser
- */
-static const struct hda_codec_ops cmi_auto_patch_ops = {
-	.build_controls = snd_hda_gen_build_controls,
-	.build_pcms = snd_hda_gen_build_pcms,
-	.init = snd_hda_gen_init,
-	.free = snd_hda_gen_free,
-	.unsol_event = snd_hda_jack_unsol_event,
-};
-
-static int patch_cm9825(struct hda_codec *codec)
-{
-	struct cmi_spec *spec;
-	struct auto_pin_cfg *cfg;
-	int err;
-
-	spec = kzalloc(sizeof(*spec), GFP_KERNEL);
-	if (spec == NULL)
-		return -ENOMEM;
-
-	INIT_DELAYED_WORK(&spec->unsol_hp_work, cm9825_unsol_hp_delayed);
-	codec->spec = spec;
-	spec->codec = codec;
-	codec->patch_ops = cmi_auto_patch_ops;
-	codec->patch_ops.init = cm9825_init;
-	codec->patch_ops.suspend = cm9825_suspend;
-	codec->patch_ops.resume = cm9825_resume;
-	codec->patch_ops.free = cm9825_free;
-	codec->patch_ops.check_power_status = snd_hda_gen_check_power_status;
-	cfg = &spec->gen.autocfg;
-	snd_hda_gen_spec_init(&spec->gen);
-	spec->chip_d0_verbs = cm9825_std_d0_verbs;
-	spec->chip_d3_verbs = cm9825_std_d3_verbs;
-	spec->chip_hp_present_verbs = cm9825_hp_present_verbs;
-	spec->chip_hp_remove_verbs = cm9825_hp_remove_verbs;
-
-	snd_hda_sequence_write(codec, spec->chip_d0_verbs);
-
-	err = snd_hda_parse_pin_defcfg(codec, cfg, NULL, 0);
-	if (err < 0)
-		goto error;
-	err = snd_hda_gen_parse_auto_config(codec, cfg);
-	if (err < 0)
-		goto error;
-
-	cm9825_setup_unsol(codec);
-
-	return 0;
-
- error:
-	cm9825_free(codec);
-
-	codec_info(codec, "Enter err %d\n", err);
-
-	return err;
-}
-
-static int patch_cmi9880(struct hda_codec *codec)
-{
-	struct cmi_spec *spec;
+	struct hda_gen_spec *spec;
 	struct auto_pin_cfg *cfg;
+	bool is_cmi8888 = id->vendor_id == 0x13f68888;
 	int err;
 
 	spec = kzalloc(sizeof(*spec), GFP_KERNEL);
@@ -311,9 +29,15 @@ static int patch_cmi9880(struct hda_codec *codec)
 		return -ENOMEM;
 
 	codec->spec = spec;
-	codec->patch_ops = cmi_auto_patch_ops;
-	cfg = &spec->gen.autocfg;
-	snd_hda_gen_spec_init(&spec->gen);
+	cfg = &spec->autocfg;
+	snd_hda_gen_spec_init(spec);
+
+	if (is_cmi8888) {
+		/* mask NID 0x10 from the playback volume selection;
+		 * it's a headphone boost volume handled manually below
+		 */
+		spec->out_vol_mask = (1ULL << 0x10);
+	}
 
 	err = snd_hda_parse_pin_defcfg(codec, cfg, NULL, 0);
 	if (err < 0)
@@ -322,33 +46,6 @@ static int patch_cmi9880(struct hda_codec *codec)
 	if (err < 0)
 		goto error;
 
-	return 0;
-
- error:
-	snd_hda_gen_free(codec);
-	return err;
-}
-
-static int patch_cmi8888(struct hda_codec *codec)
-{
-	struct cmi_spec *spec;
-	struct auto_pin_cfg *cfg;
-	int err;
-
-	spec = kzalloc(sizeof(*spec), GFP_KERNEL);
-	if (!spec)
-		return -ENOMEM;
-
-	codec->spec = spec;
-	codec->patch_ops = cmi_auto_patch_ops;
-	cfg = &spec->gen.autocfg;
-	snd_hda_gen_spec_init(&spec->gen);
-
-	/* mask NID 0x10 from the playback volume selection;
-	 * it's a headphone boost volume handled manually below
-	 */
-	spec->gen.out_vol_mask = (1ULL << 0x10);
-
 	err = snd_hda_parse_pin_defcfg(codec, cfg, NULL, 0);
 	if (err < 0)
 		goto error;
@@ -356,32 +53,44 @@ static int patch_cmi8888(struct hda_codec *codec)
 	if (err < 0)
 		goto error;
 
-	if (get_defcfg_device(snd_hda_codec_get_pincfg(codec, 0x10)) ==
-	    AC_JACK_HP_OUT) {
-		static const struct snd_kcontrol_new amp_kctl =
-			HDA_CODEC_VOLUME("Headphone Amp Playback Volume",
-					 0x10, 0, HDA_OUTPUT);
-		if (!snd_hda_gen_add_kctl(&spec->gen, NULL, &amp_kctl)) {
-			err = -ENOMEM;
-			goto error;
+	if (is_cmi8888) {
+		if (get_defcfg_device(snd_hda_codec_get_pincfg(codec, 0x10)) ==
+		    AC_JACK_HP_OUT) {
+			static const struct snd_kcontrol_new amp_kctl =
+				HDA_CODEC_VOLUME("Headphone Amp Playback Volume",
+						 0x10, 0, HDA_OUTPUT);
+			if (!snd_hda_gen_add_kctl(spec, NULL, &amp_kctl)) {
+				err = -ENOMEM;
+				goto error;
+			}
 		}
 	}
 
 	return 0;
 
  error:
-	snd_hda_gen_free(codec);
+	snd_hda_gen_remove(codec);
 	return err;
 }
 
+static const struct hda_codec_ops cmedia_codec_ops = {
+	.probe = cmedia_probe,
+	.remove = snd_hda_gen_remove,
+	.build_controls = snd_hda_gen_build_controls,
+	.build_pcms = snd_hda_gen_build_pcms,
+	.init = snd_hda_gen_init,
+	.unsol_event = snd_hda_jack_unsol_event,
+	.check_power_status = snd_hda_gen_check_power_status,
+	.stream_pm = snd_hda_gen_stream_pm,
+};
+
 /*
- * patch entries
+ * driver entries
  */
 static const struct hda_device_id snd_hda_id_cmedia[] = {
-	HDA_CODEC_ENTRY(0x13f68888, "CMI8888", patch_cmi8888),
-	HDA_CODEC_ENTRY(0x13f69880, "CMI9880", patch_cmi9880),
-	HDA_CODEC_ENTRY(0x434d4980, "CMI9880", patch_cmi9880),
-	HDA_CODEC_ENTRY(0x13f69825, "CM9825", patch_cm9825),
+	HDA_CODEC_ID(0x13f68888, "CMI8888"),
+	HDA_CODEC_ID(0x13f69880, "CMI9880"),
+	HDA_CODEC_ID(0x434d4980, "CMI9880"),
 	{} /* terminator */
 };
 MODULE_DEVICE_TABLE(hdaudio, snd_hda_id_cmedia);
@@ -391,6 +100,7 @@ MODULE_DESCRIPTION("C-Media HD-audio codec");
 
 static struct hda_codec_driver cmedia_driver = {
 	.id = snd_hda_id_cmedia,
+	.ops = &cmedia_codec_ops,
 };
 
 module_hda_codec_driver(cmedia_driver);
-- 
2.50.0

