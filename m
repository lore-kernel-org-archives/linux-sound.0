Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CB61E5B78
	for <linux-sound@vger.kernel.org>; Wed,  9 Jul 2025 16:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752077203; cv=none; b=uX3v1ZTqHtmuuY9glb5//J4kqV1YM9sl6YhqwZ5E8eyMNiY7PUyhEwfsIszJm1Kuhs8bEE0oxJ9PTgblKexQACvsFiAeWFufOgrFQnLHpeT3n60m1slOTHlN8Vlm9vd/KnfUERt5lNbLzf4mLkgOab/lksBLCsBMNTog3L3SjVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752077203; c=relaxed/simple;
	bh=BUSmVMjnmBdgg3j2E+MdJ9AZiY/7VcKhIDfbcOFv6O8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NUo8o1t6qfbb03Q4UjctN9LxTLf/RVCa8yWGxgPkGkGXeiAL554A9IBgTA+hSoO06DPt6wZTg32Nfx0mXcu1fqj+U91OwDssYE0EEqcOGt6FAcPLkoZNQU8U3DHO0R9cfWuKXMuggXy7ErAYdTUMzmaCDSAtKrlS4jE1XwmvEtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1zYeF58R; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0UHXv2Ny; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1zYeF58R; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0UHXv2Ny; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1zYeF58R";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0UHXv2Ny";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1zYeF58R";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0UHXv2Ny"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 223A41F453;
	Wed,  9 Jul 2025 16:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752077097; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/UDobiBqPvbLODA6fJLSFozzAi/lykH5cs3udLZXiq0=;
	b=1zYeF58RK/AC/x2weToYbmIabUk7RnP+Y5ZRaN6l3MLH4yg6YgOG4VES84aqjbRnfSptbW
	Gds+RQRQvU+gC29bDSZ9MM3nfoO9an3JU9E69FgwdwDE9RMSqmz+QT8Z5WZ+3q6ZsrFFub
	zwqnwcMnCeZ++Q1ubVaigmzg749FHpU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752077097;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/UDobiBqPvbLODA6fJLSFozzAi/lykH5cs3udLZXiq0=;
	b=0UHXv2NyftWDTjlOzogqvachWXBB1W1H/YZzzFsNY+AAoO4ri5v2hPoF+9jckDdK/RxV2E
	5VMCQnxuirvh/sAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752077097; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/UDobiBqPvbLODA6fJLSFozzAi/lykH5cs3udLZXiq0=;
	b=1zYeF58RK/AC/x2weToYbmIabUk7RnP+Y5ZRaN6l3MLH4yg6YgOG4VES84aqjbRnfSptbW
	Gds+RQRQvU+gC29bDSZ9MM3nfoO9an3JU9E69FgwdwDE9RMSqmz+QT8Z5WZ+3q6ZsrFFub
	zwqnwcMnCeZ++Q1ubVaigmzg749FHpU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752077097;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/UDobiBqPvbLODA6fJLSFozzAi/lykH5cs3udLZXiq0=;
	b=0UHXv2NyftWDTjlOzogqvachWXBB1W1H/YZzzFsNY+AAoO4ri5v2hPoF+9jckDdK/RxV2E
	5VMCQnxuirvh/sAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C630B136DC;
	Wed,  9 Jul 2025 16:04:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kJEsLyiTbmhDEAAAD6G6ig
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
Subject: [PATCH 18/27] ALSA: hda/senary: Rewrite to new probe method
Date: Wed,  9 Jul 2025 18:04:21 +0200
Message-ID: <20250709160434.1859-19-tiwai@suse.de>
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

Convert the Senary codec driver to use the new hda_codec_ops probe.
No functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/senarytech.c | 46 ++++++++++++++++++-----------------
 1 file changed, 24 insertions(+), 22 deletions(-)

diff --git a/sound/hda/codecs/senarytech.c b/sound/hda/codecs/senarytech.c
index 9a253ad19f4d..9aa1e9bcd9ec 100644
--- a/sound/hda/codecs/senarytech.c
+++ b/sound/hda/codecs/senarytech.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * HD audio interface patch for Senary HDA audio codec
+ * HD audio codec driver for Senary HDA audio codec
  *
  * Initially based on conexant.c
  */
@@ -129,7 +129,7 @@ static void senary_init_gpio_led(struct hda_codec *codec)
 	}
 }
 
-static int senary_auto_init(struct hda_codec *codec)
+static int senary_init(struct hda_codec *codec)
 {
 	snd_hda_gen_init(codec);
 	senary_init_gpio_led(codec);
@@ -138,7 +138,7 @@ static int senary_auto_init(struct hda_codec *codec)
 	return 0;
 }
 
-static void senary_auto_shutdown(struct hda_codec *codec)
+static void senary_shutdown(struct hda_codec *codec)
 {
 	struct senary_spec *spec = codec->spec;
 
@@ -148,29 +148,19 @@ static void senary_auto_shutdown(struct hda_codec *codec)
 	senary_auto_turn_eapd(codec, spec->num_eapds, spec->eapds, false);
 }
 
-static void senary_auto_free(struct hda_codec *codec)
+static void senary_remove(struct hda_codec *codec)
 {
-	senary_auto_shutdown(codec);
-	snd_hda_gen_free(codec);
+	senary_shutdown(codec);
+	snd_hda_gen_remove(codec);
 }
 
-static int senary_auto_suspend(struct hda_codec *codec)
+static int senary_suspend(struct hda_codec *codec)
 {
-	senary_auto_shutdown(codec);
+	senary_shutdown(codec);
 	return 0;
 }
 
-static const struct hda_codec_ops senary_auto_patch_ops = {
-	.build_controls = snd_hda_gen_build_controls,
-	.build_pcms = snd_hda_gen_build_pcms,
-	.init = senary_auto_init,
-	.free = senary_auto_free,
-	.unsol_event = snd_hda_jack_unsol_event,
-	.suspend = senary_auto_suspend,
-	.check_power_status = snd_hda_gen_check_power_status,
-};
-
-static int patch_senary_auto(struct hda_codec *codec)
+static int senary_probe(struct hda_codec *codec, const struct hda_device_id *id)
 {
 	struct senary_spec *spec;
 	int err;
@@ -182,7 +172,6 @@ static int patch_senary_auto(struct hda_codec *codec)
 		return -ENOMEM;
 	snd_hda_gen_spec_init(&spec->gen);
 	codec->spec = spec;
-	codec->patch_ops = senary_auto_patch_ops;
 
 	senary_auto_parse_eapd(codec);
 	spec->gen.own_eapd_ctl = 1;
@@ -221,15 +210,27 @@ static int patch_senary_auto(struct hda_codec *codec)
 	return 0;
 
  error:
-	senary_auto_free(codec);
+	senary_remove(codec);
 	return err;
 }
 
+static const struct hda_codec_ops senary_codec_ops = {
+	.probe = senary_probe,
+	.remove = senary_remove,
+	.build_controls = snd_hda_gen_build_controls,
+	.build_pcms = snd_hda_gen_build_pcms,
+	.init = senary_init,
+	.unsol_event = snd_hda_jack_unsol_event,
+	.suspend = senary_suspend,
+	.check_power_status = snd_hda_gen_check_power_status,
+	.stream_pm = snd_hda_gen_stream_pm,
+};
+
 /*
  */
 
 static const struct hda_device_id snd_hda_id_senary[] = {
-	HDA_CODEC_ENTRY(0x1fa86186, "SN6186", patch_senary_auto),
+	HDA_CODEC_ID(0x1fa86186, "SN6186"),
 	{} /* terminator */
 };
 MODULE_DEVICE_TABLE(hdaudio, snd_hda_id_senary);
@@ -239,6 +240,7 @@ MODULE_DESCRIPTION("Senarytech HD-audio codec");
 
 static struct hda_codec_driver senary_driver = {
 	.id = snd_hda_id_senary,
+	.ops = &senary_codec_ops,
 };
 
 module_hda_codec_driver(senary_driver);
-- 
2.50.0

