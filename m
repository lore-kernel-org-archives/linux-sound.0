Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0902C21CA02
	for <linux-sound@vger.kernel.org>; Wed,  9 Jul 2025 16:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752077210; cv=none; b=OxVN7IXaSK6BeFIcfsP7hwQFMjKMDBT+KKR8cIWy1euTDaUHxpCMcHGvm2UgZw+nQPAxLCqMQC1FNnnw1IbaCtjd9X+HqIvq3uyQEz8su0NHMTmPk+aDJjsyeuQ3UdOToOUuTV9poAEablhRI3OceIJpxkB1+HrYhNl2FGgg0OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752077210; c=relaxed/simple;
	bh=qTzT7aE3/7w3gc6CevV3+RLstb+JGiyljGwwMF1lutY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X3kKeKOAbYcOxBVIKnuO/ZhNSbS4FerK0EjKkLEmErdSyVMu0A2WCgU3zWcCGQFcoFY5wOUeSfvb4daiaZ+Ok17dk9r/9f1aMmr9AP54kskHBTO/yAGp254TbehEo8yH/e+uuUV1Eqbn3z0y15FoCXK9gMhCE7G69yaJz4EcfQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=AK/ZMmDx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Xm8mp6qI; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=AK/ZMmDx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Xm8mp6qI; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AK/ZMmDx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Xm8mp6qI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AK/ZMmDx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Xm8mp6qI"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C6E171F457;
	Wed,  9 Jul 2025 16:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752077099; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cUO0R9fdUDJNN/kHwBXqOvTzX3c0ABusp22bz0EH71U=;
	b=AK/ZMmDxhS8mSO/TbPQUiDRI8c1Knr3pG/T6jgI2PSOZAkYE91/vWl2RGtzfnxn/qzNuDm
	txEdMPPDLK0/sBjuw05hgsYgR8D64Nd2sa/EQFbIsnx8CtfVpkcxBXS20y6+wpVjNEoxhX
	+XwzfMpHH06H7gn2pI7As6bWwHp8iyw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752077099;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cUO0R9fdUDJNN/kHwBXqOvTzX3c0ABusp22bz0EH71U=;
	b=Xm8mp6qI7IXsDwPmTdEkT87xuCo6JpWMf0WRamj9dqmi+MJatvZVPUH7ohyfqe7MuK0Pci
	M/wx+Sfv6vHwhRCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752077099; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cUO0R9fdUDJNN/kHwBXqOvTzX3c0ABusp22bz0EH71U=;
	b=AK/ZMmDxhS8mSO/TbPQUiDRI8c1Knr3pG/T6jgI2PSOZAkYE91/vWl2RGtzfnxn/qzNuDm
	txEdMPPDLK0/sBjuw05hgsYgR8D64Nd2sa/EQFbIsnx8CtfVpkcxBXS20y6+wpVjNEoxhX
	+XwzfMpHH06H7gn2pI7As6bWwHp8iyw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752077099;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cUO0R9fdUDJNN/kHwBXqOvTzX3c0ABusp22bz0EH71U=;
	b=Xm8mp6qI7IXsDwPmTdEkT87xuCo6JpWMf0WRamj9dqmi+MJatvZVPUH7ohyfqe7MuK0Pci
	M/wx+Sfv6vHwhRCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8258F13998;
	Wed,  9 Jul 2025 16:04:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2GKDHiuTbmhDEAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 09 Jul 2025 16:04:59 +0000
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
Subject: [PATCH 22/27] ALSA: hda/ca0132: Rewrite to new probe method
Date: Wed,  9 Jul 2025 18:04:25 +0200
Message-ID: <20250709160434.1859-23-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
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

Convert the CA0132 codec driver to use the new hda_codec_ops probe.
No functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/ca0132.c      | 103 +++++++++++++++++++++------------
 sound/hda/codecs/ca0132_regs.h |   2 +-
 2 files changed, 68 insertions(+), 37 deletions(-)

diff --git a/sound/hda/codecs/ca0132.c b/sound/hda/codecs/ca0132.c
index 35a979465c75..6ab59c336ed4 100644
--- a/sound/hda/codecs/ca0132.c
+++ b/sound/hda/codecs/ca0132.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * HD audio interface patch for Creative CA0132 chip
+ * HD audio codec driver for Creative CA0132 chip
  *
  * Copyright (c) 2011, Creative Technology Ltd.
  *
@@ -9118,7 +9118,7 @@ static void sbz_dsp_startup_check(struct hda_codec *codec)
 		codec_info(codec, "Reloading... Tries left: %d", reload);
 		sbz_exit_chip(codec);
 		spec->dsp_state = DSP_DOWNLOAD_INIT;
-		codec->patch_ops.init(codec);
+		snd_hda_codec_init(codec);
 		failure = 0;
 		for (i = 0; i < 4; i++) {
 			chipio_read(codec, cur_address, &dsp_data_check[i]);
@@ -9694,30 +9694,6 @@ static void dbpro_free(struct hda_codec *codec)
 	kfree(codec->spec);
 }
 
-static int ca0132_suspend(struct hda_codec *codec)
-{
-	struct ca0132_spec *spec = codec->spec;
-
-	cancel_delayed_work_sync(&spec->unsol_hp_work);
-	return 0;
-}
-
-static const struct hda_codec_ops ca0132_patch_ops = {
-	.build_controls = ca0132_build_controls,
-	.build_pcms = ca0132_build_pcms,
-	.init = ca0132_init,
-	.free = ca0132_free,
-	.unsol_event = snd_hda_jack_unsol_event,
-	.suspend = ca0132_suspend,
-};
-
-static const struct hda_codec_ops dbpro_patch_ops = {
-	.build_controls = dbpro_build_controls,
-	.build_pcms = dbpro_build_pcms,
-	.init = dbpro_init,
-	.free = dbpro_free,
-};
-
 static void ca0132_config(struct hda_codec *codec)
 {
 	struct ca0132_spec *spec = codec->spec;
@@ -9982,12 +9958,23 @@ static void sbz_detect_quirk(struct hda_codec *codec)
 	}
 }
 
-static int patch_ca0132(struct hda_codec *codec)
+static void ca0132_codec_remove(struct hda_codec *codec)
+{
+	struct ca0132_spec *spec = codec->spec;
+
+	if (ca0132_quirk(spec) == QUIRK_ZXR_DBPRO)
+		return dbpro_free(codec);
+	else
+		return ca0132_free(codec);
+}
+
+static int ca0132_codec_probe(struct hda_codec *codec,
+			      const struct hda_device_id *id)
 {
 	struct ca0132_spec *spec;
 	int err;
 
-	codec_dbg(codec, "patch_ca0132\n");
+	codec_dbg(codec, "%s\n", __func__);
 
 	spec = kzalloc(sizeof(*spec), GFP_KERNEL);
 	if (!spec)
@@ -10000,11 +9987,6 @@ static int patch_ca0132(struct hda_codec *codec)
 	if (ca0132_quirk(spec) == QUIRK_SBZ)
 		sbz_detect_quirk(codec);
 
-	if (ca0132_quirk(spec) == QUIRK_ZXR_DBPRO)
-		codec->patch_ops = dbpro_patch_ops;
-	else
-		codec->patch_ops = ca0132_patch_ops;
-
 	codec->pcm_format_first = 1;
 	codec->no_sticky_stream = 1;
 
@@ -10100,15 +10082,63 @@ static int patch_ca0132(struct hda_codec *codec)
 	return 0;
 
  error:
-	ca0132_free(codec);
+	ca0132_codec_remove(codec);
 	return err;
 }
 
+static int ca0132_codec_build_controls(struct hda_codec *codec)
+{
+	struct ca0132_spec *spec = codec->spec;
+
+	if (ca0132_quirk(spec) == QUIRK_ZXR_DBPRO)
+		return dbpro_build_controls(codec);
+	else
+		return ca0132_build_controls(codec);
+}
+
+static int ca0132_codec_build_pcms(struct hda_codec *codec)
+{
+	struct ca0132_spec *spec = codec->spec;
+
+	if (ca0132_quirk(spec) == QUIRK_ZXR_DBPRO)
+		return dbpro_build_pcms(codec);
+	else
+		return ca0132_build_pcms(codec);
+}
+
+static int ca0132_codec_init(struct hda_codec *codec)
+{
+	struct ca0132_spec *spec = codec->spec;
+
+	if (ca0132_quirk(spec) == QUIRK_ZXR_DBPRO)
+		return dbpro_init(codec);
+	else
+		return ca0132_init(codec);
+}
+
+static int ca0132_codec_suspend(struct hda_codec *codec)
+{
+	struct ca0132_spec *spec = codec->spec;
+
+	cancel_delayed_work_sync(&spec->unsol_hp_work);
+	return 0;
+}
+
+static const struct hda_codec_ops ca0132_codec_ops = {
+	.probe = ca0132_codec_probe,
+	.remove = ca0132_codec_remove,
+	.build_controls = ca0132_codec_build_controls,
+	.build_pcms = ca0132_codec_build_pcms,
+	.init = ca0132_codec_init,
+	.unsol_event = snd_hda_jack_unsol_event,
+	.suspend = ca0132_codec_suspend,
+};
+
 /*
- * patch entries
+ * driver entries
  */
 static const struct hda_device_id snd_hda_id_ca0132[] = {
-	HDA_CODEC_ENTRY(0x11020011, "CA0132", patch_ca0132),
+	HDA_CODEC_ID(0x11020011, "CA0132"),
 	{} /* terminator */
 };
 MODULE_DEVICE_TABLE(hdaudio, snd_hda_id_ca0132);
@@ -10118,6 +10148,7 @@ MODULE_DESCRIPTION("Creative Sound Core3D codec");
 
 static struct hda_codec_driver ca0132_driver = {
 	.id = snd_hda_id_ca0132,
+	.ops = &ca0132_codec_ops,
 };
 
 module_hda_codec_driver(ca0132_driver);
diff --git a/sound/hda/codecs/ca0132_regs.h b/sound/hda/codecs/ca0132_regs.h
index 0ead571fb447..dc0153df3d5c 100644
--- a/sound/hda/codecs/ca0132_regs.h
+++ b/sound/hda/codecs/ca0132_regs.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
- * HD audio interface patch for Creative CA0132 chip.
+ * HD audio codec driver for Creative CA0132 chip.
  * CA0132 registers defines.
  *
  * Copyright (c) 2011, Creative Technology Ltd.
-- 
2.50.0

