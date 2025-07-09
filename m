Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1DB2E612B
	for <linux-sound@vger.kernel.org>; Wed,  9 Jul 2025 16:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752077583; cv=none; b=MpNU4vLE+VkL/lixoLnU7exjGcGPY5wRlNdY2vmUAEJRWMdw2gYhzRXHqISC9bRnKxSYL8/E9jIg9+gKwaZ7Ha2mn1DQB05ZQ1nibUPvd7BbSokeZ9C4n+gj1CuPgf4PEb7il0LVOTIirEHH1oxUFCAW8GBPFsxtaKsiCRs8X+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752077583; c=relaxed/simple;
	bh=TB4i6FJK3x1ekDW+BSWiT62zc/B5o7gPJpJ+fWyPd9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ub2v1a5a4jglW7gC+jqyPlG62EOTy40SNnKxSPIOLhGtRM8S0bu74TFVDD9nl2A1fI0sx4FwNtyoZPLjG4ZCsecP5JlpHvdFAiTMmQDREcGRRm9Qi6+FLda3lkBjMLngNBYYJEWyCcoZsgOelVpsGXxBp4tmPJZHC/h52+kcGS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ALHjsy9T; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+4TxEUCf; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ALHjsy9T; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+4TxEUCf; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ALHjsy9T";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+4TxEUCf";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ALHjsy9T";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+4TxEUCf"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 68D1421187;
	Wed,  9 Jul 2025 16:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752077096; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EBI1oi44764daV4UCSZj+qCPPt5NVah+qrgsXRQLUfc=;
	b=ALHjsy9TRHqn0dcjBKeRtPqIQwpErtxK9uE94PVz5aJcXZE7JiqsAIwB46NIWnT+fMdy6/
	ip975RTGhtPJeoBJTHRbgfOZYHiiNuwMh0TMg4SIg3+M2rDABf+9W2UyqnhbHfqFT46ld+
	6IuA9lZRi94co8Ubqg8ZFh4dXyI3VFQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752077096;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EBI1oi44764daV4UCSZj+qCPPt5NVah+qrgsXRQLUfc=;
	b=+4TxEUCfKc+gj8s+dEQcpHCjQh4vDpHfFANThlhAA9oUiioQ1Ciy9nakISedfgq3x2SzF/
	u9lLb367rj3TyHAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752077096; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EBI1oi44764daV4UCSZj+qCPPt5NVah+qrgsXRQLUfc=;
	b=ALHjsy9TRHqn0dcjBKeRtPqIQwpErtxK9uE94PVz5aJcXZE7JiqsAIwB46NIWnT+fMdy6/
	ip975RTGhtPJeoBJTHRbgfOZYHiiNuwMh0TMg4SIg3+M2rDABf+9W2UyqnhbHfqFT46ld+
	6IuA9lZRi94co8Ubqg8ZFh4dXyI3VFQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752077096;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EBI1oi44764daV4UCSZj+qCPPt5NVah+qrgsXRQLUfc=;
	b=+4TxEUCfKc+gj8s+dEQcpHCjQh4vDpHfFANThlhAA9oUiioQ1Ciy9nakISedfgq3x2SzF/
	u9lLb367rj3TyHAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 22953136DC;
	Wed,  9 Jul 2025 16:04:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ML8dByiTbmhDEAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 09 Jul 2025 16:04:56 +0000
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
Subject: [PATCH 17/27] ALSA: hda/conexant: Rewrite to new probe method
Date: Wed,  9 Jul 2025 18:04:20 +0200
Message-ID: <20250709160434.1859-18-tiwai@suse.de>
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
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_RATELIMIT(0.00)[to_ip_from(RL7bz5f8woybp4997xe1n6ecoy)];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

Convert the Conexant codec driver to use the new hda_codec_ops probe.
No functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/conexant.c | 104 ++++++++++++++++++------------------
 1 file changed, 53 insertions(+), 51 deletions(-)

diff --git a/sound/hda/codecs/conexant.c b/sound/hda/codecs/conexant.c
index b7710a81fd87..c881bf213ebe 100644
--- a/sound/hda/codecs/conexant.c
+++ b/sound/hda/codecs/conexant.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * HD audio interface patch for Conexant HDA audio codec
+ * HD audio codec driver for Conexant HDA audio codec
  *
  * Copyright (c) 2006 Pototskiy Akex <alex.pototskiy@gmail.com>
  * 		      Takashi Iwai <tiwai@suse.de>
@@ -185,7 +185,7 @@ static void cx_fixup_headset_recog(struct hda_codec *codec)
 		snd_hda_codec_write(codec, 0x19, 0, AC_VERB_SET_PIN_WIDGET_CONTROL, 0x20);
 }
 
-static int cx_auto_init(struct hda_codec *codec)
+static int cx_init(struct hda_codec *codec)
 {
 	struct conexant_spec *spec = codec->spec;
 	snd_hda_gen_init(codec);
@@ -210,10 +210,10 @@ static void cx_auto_shutdown(struct hda_codec *codec)
 	cx_auto_turn_eapd(codec, spec->num_eapds, spec->eapds, false);
 }
 
-static void cx_auto_free(struct hda_codec *codec)
+static void cx_remove(struct hda_codec *codec)
 {
 	cx_auto_shutdown(codec);
-	snd_hda_gen_free(codec);
+	snd_hda_gen_remove(codec);
 }
 
 static void cx_process_headset_plugin(struct hda_codec *codec)
@@ -258,22 +258,12 @@ static void cx_update_headset_mic_vref(struct hda_codec *codec, struct hda_jack_
 		cx_process_headset_plugin(codec);
 }
 
-static int cx_auto_suspend(struct hda_codec *codec)
+static int cx_suspend(struct hda_codec *codec)
 {
 	cx_auto_shutdown(codec);
 	return 0;
 }
 
-static const struct hda_codec_ops cx_auto_patch_ops = {
-	.build_controls = snd_hda_gen_build_controls,
-	.build_pcms = snd_hda_gen_build_pcms,
-	.init = cx_auto_init,
-	.free = cx_auto_free,
-	.unsol_event = snd_hda_jack_unsol_event,
-	.suspend = cx_auto_suspend,
-	.check_power_status = snd_hda_gen_check_power_status,
-};
-
 /*
  * pin fix-up
  */
@@ -1178,7 +1168,7 @@ static void add_cx5051_fake_mutes(struct hda_codec *codec)
 	spec->gen.dac_min_mute = true;
 }
 
-static int patch_conexant_auto(struct hda_codec *codec)
+static int cx_probe(struct hda_codec *codec, const struct hda_device_id *id)
 {
 	struct conexant_spec *spec;
 	int err;
@@ -1190,7 +1180,6 @@ static int patch_conexant_auto(struct hda_codec *codec)
 		return -ENOMEM;
 	snd_hda_gen_spec_init(&spec->gen);
 	codec->spec = spec;
-	codec->patch_ops = cx_auto_patch_ops;
 
 	/* init cx11880/sn6140 flag and reset headset_present_flag */
 	switch (codec->core.vendor_id) {
@@ -1276,47 +1265,59 @@ static int patch_conexant_auto(struct hda_codec *codec)
 	return 0;
 
  error:
-	cx_auto_free(codec);
+	cx_remove(codec);
 	return err;
 }
 
+static const struct hda_codec_ops cx_codec_ops = {
+	.probe = cx_probe,
+	.remove = cx_remove,
+	.build_controls = snd_hda_gen_build_controls,
+	.build_pcms = snd_hda_gen_build_pcms,
+	.init = cx_init,
+	.unsol_event = snd_hda_jack_unsol_event,
+	.suspend = cx_suspend,
+	.check_power_status = snd_hda_gen_check_power_status,
+	.stream_pm = snd_hda_gen_stream_pm,
+};
+
 /*
  */
 
 static const struct hda_device_id snd_hda_id_conexant[] = {
-	HDA_CODEC_ENTRY(0x14f11f86, "CX11880", patch_conexant_auto),
-	HDA_CODEC_ENTRY(0x14f11f87, "SN6140", patch_conexant_auto),
-	HDA_CODEC_ENTRY(0x14f12008, "CX8200", patch_conexant_auto),
-	HDA_CODEC_ENTRY(0x14f120d0, "CX11970", patch_conexant_auto),
-	HDA_CODEC_ENTRY(0x14f120d1, "SN6180", patch_conexant_auto),
-	HDA_CODEC_ENTRY(0x14f15045, "CX20549 (Venice)", patch_conexant_auto),
-	HDA_CODEC_ENTRY(0x14f15047, "CX20551 (Waikiki)", patch_conexant_auto),
-	HDA_CODEC_ENTRY(0x14f15051, "CX20561 (Hermosa)", patch_conexant_auto),
-	HDA_CODEC_ENTRY(0x14f15066, "CX20582 (Pebble)", patch_conexant_auto),
-	HDA_CODEC_ENTRY(0x14f15067, "CX20583 (Pebble HSF)", patch_conexant_auto),
-	HDA_CODEC_ENTRY(0x14f15068, "CX20584", patch_conexant_auto),
-	HDA_CODEC_ENTRY(0x14f15069, "CX20585", patch_conexant_auto),
-	HDA_CODEC_ENTRY(0x14f1506c, "CX20588", patch_conexant_auto),
-	HDA_CODEC_ENTRY(0x14f1506e, "CX20590", patch_conexant_auto),
-	HDA_CODEC_ENTRY(0x14f15097, "CX20631", patch_conexant_auto),
-	HDA_CODEC_ENTRY(0x14f15098, "CX20632", patch_conexant_auto),
-	HDA_CODEC_ENTRY(0x14f150a1, "CX20641", patch_conexant_auto),
-	HDA_CODEC_ENTRY(0x14f150a2, "CX20642", patch_conexant_auto),
-	HDA_CODEC_ENTRY(0x14f150ab, "CX20651", patch_conexant_auto),
-	HDA_CODEC_ENTRY(0x14f150ac, "CX20652", patch_conexant_auto),
-	HDA_CODEC_ENTRY(0x14f150b8, "CX20664", patch_conexant_auto),
-	HDA_CODEC_ENTRY(0x14f150b9, "CX20665", patch_conexant_auto),
-	HDA_CODEC_ENTRY(0x14f150f1, "CX21722", patch_conexant_auto),
-	HDA_CODEC_ENTRY(0x14f150f2, "CX20722", patch_conexant_auto),
-	HDA_CODEC_ENTRY(0x14f150f3, "CX21724", patch_conexant_auto),
-	HDA_CODEC_ENTRY(0x14f150f4, "CX20724", patch_conexant_auto),
-	HDA_CODEC_ENTRY(0x14f1510f, "CX20751/2", patch_conexant_auto),
-	HDA_CODEC_ENTRY(0x14f15110, "CX20751/2", patch_conexant_auto),
-	HDA_CODEC_ENTRY(0x14f15111, "CX20753/4", patch_conexant_auto),
-	HDA_CODEC_ENTRY(0x14f15113, "CX20755", patch_conexant_auto),
-	HDA_CODEC_ENTRY(0x14f15114, "CX20756", patch_conexant_auto),
-	HDA_CODEC_ENTRY(0x14f15115, "CX20757", patch_conexant_auto),
-	HDA_CODEC_ENTRY(0x14f151d7, "CX20952", patch_conexant_auto),
+	HDA_CODEC_ID(0x14f11f86, "CX11880"),
+	HDA_CODEC_ID(0x14f11f87, "SN6140"),
+	HDA_CODEC_ID(0x14f12008, "CX8200"),
+	HDA_CODEC_ID(0x14f120d0, "CX11970"),
+	HDA_CODEC_ID(0x14f120d1, "SN6180"),
+	HDA_CODEC_ID(0x14f15045, "CX20549 (Venice)"),
+	HDA_CODEC_ID(0x14f15047, "CX20551 (Waikiki)"),
+	HDA_CODEC_ID(0x14f15051, "CX20561 (Hermosa)"),
+	HDA_CODEC_ID(0x14f15066, "CX20582 (Pebble)"),
+	HDA_CODEC_ID(0x14f15067, "CX20583 (Pebble HSF)"),
+	HDA_CODEC_ID(0x14f15068, "CX20584"),
+	HDA_CODEC_ID(0x14f15069, "CX20585"),
+	HDA_CODEC_ID(0x14f1506c, "CX20588"),
+	HDA_CODEC_ID(0x14f1506e, "CX20590"),
+	HDA_CODEC_ID(0x14f15097, "CX20631"),
+	HDA_CODEC_ID(0x14f15098, "CX20632"),
+	HDA_CODEC_ID(0x14f150a1, "CX20641"),
+	HDA_CODEC_ID(0x14f150a2, "CX20642"),
+	HDA_CODEC_ID(0x14f150ab, "CX20651"),
+	HDA_CODEC_ID(0x14f150ac, "CX20652"),
+	HDA_CODEC_ID(0x14f150b8, "CX20664"),
+	HDA_CODEC_ID(0x14f150b9, "CX20665"),
+	HDA_CODEC_ID(0x14f150f1, "CX21722"),
+	HDA_CODEC_ID(0x14f150f2, "CX20722"),
+	HDA_CODEC_ID(0x14f150f3, "CX21724"),
+	HDA_CODEC_ID(0x14f150f4, "CX20724"),
+	HDA_CODEC_ID(0x14f1510f, "CX20751/2"),
+	HDA_CODEC_ID(0x14f15110, "CX20751/2"),
+	HDA_CODEC_ID(0x14f15111, "CX20753/4"),
+	HDA_CODEC_ID(0x14f15113, "CX20755"),
+	HDA_CODEC_ID(0x14f15114, "CX20756"),
+	HDA_CODEC_ID(0x14f15115, "CX20757"),
+	HDA_CODEC_ID(0x14f151d7, "CX20952"),
 	{} /* terminator */
 };
 MODULE_DEVICE_TABLE(hdaudio, snd_hda_id_conexant);
@@ -1326,6 +1327,7 @@ MODULE_DESCRIPTION("Conexant HD-audio codec");
 
 static struct hda_codec_driver conexant_driver = {
 	.id = snd_hda_id_conexant,
+	.ops = &cx_codec_ops,
 };
 
 module_hda_codec_driver(conexant_driver);
-- 
2.50.0

