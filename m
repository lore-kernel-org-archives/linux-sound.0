Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEDD1482E7
	for <linux-sound@vger.kernel.org>; Wed,  9 Jul 2025 16:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752077183; cv=none; b=T8PaSVPt50B+c3Dm4Y7PuuN8X8OyxeqL0SZXGwCy+68+e+xfkD2zggxdsT33XB8s2VGXTRDqjAG1vwpbwjyqKaJSXTpDtuz8f32d2Y1Kg5tiX3W4swn5m3zif42hJpNNEJgPQ9xCWv974cvGyyIqYCf2ZLfM34mqaEJUEWesNP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752077183; c=relaxed/simple;
	bh=Xv71wEWPAf6PstXOnvafRYEx3U4ABqB7VkK37cmJrLs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VnTzg9nnxqylVz0atyX65U2b5r69LqGLD1gIk+g8YSYOhZY6YOUMNvKlSqgTuEaT2VxVps69wnpQiIqKdIfPWQdT5MLF3mJzphKyTNK/ELvHR7SwJe+TLbAILKoTXSzgRisUAt4/6JZuCErJXjHAwIfLlpYj8PyxUOQ6m//mRXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=h6l9iDrV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Xg68kgSr; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=h6l9iDrV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Xg68kgSr; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="h6l9iDrV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Xg68kgSr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="h6l9iDrV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Xg68kgSr"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A79861F455;
	Wed,  9 Jul 2025 16:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752077091; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IP528+R272qzVwa83ytrz5PEo9pfad8Da03PlGu3Mvk=;
	b=h6l9iDrVdT+1suPQvQpxLb6lX4/P39A4Ai6PeY+sN8uTqbqmnwfRvNNXD3C4pNdUbTepTc
	3gizKB1Tl0+tjRxrFNeRdeFJwLXo5TJHai2QP4ZSN+DhAW3O/tdPn8QXkKisiB+/U7S8s7
	K3FOmyYA6bI82AOjAeuek4b0W/+LXGs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752077091;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IP528+R272qzVwa83ytrz5PEo9pfad8Da03PlGu3Mvk=;
	b=Xg68kgSropyU5zAHiC3zRWHHVve/LVo3TTAtMM8p2rZM9rqP2V8v4Y6f64EIQu9O86O4iB
	WGKH/a5sZNerAVBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752077091; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IP528+R272qzVwa83ytrz5PEo9pfad8Da03PlGu3Mvk=;
	b=h6l9iDrVdT+1suPQvQpxLb6lX4/P39A4Ai6PeY+sN8uTqbqmnwfRvNNXD3C4pNdUbTepTc
	3gizKB1Tl0+tjRxrFNeRdeFJwLXo5TJHai2QP4ZSN+DhAW3O/tdPn8QXkKisiB+/U7S8s7
	K3FOmyYA6bI82AOjAeuek4b0W/+LXGs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752077091;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IP528+R272qzVwa83ytrz5PEo9pfad8Da03PlGu3Mvk=;
	b=Xg68kgSropyU5zAHiC3zRWHHVve/LVo3TTAtMM8p2rZM9rqP2V8v4Y6f64EIQu9O86O4iB
	WGKH/a5sZNerAVBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5CA2D136DC;
	Wed,  9 Jul 2025 16:04:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IMZoFSOTbmhDEAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 09 Jul 2025 16:04:51 +0000
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
Subject: [PATCH 10/27] ALSA: hda/generic: Rewrite to new probe method
Date: Wed,  9 Jul 2025 18:04:13 +0200
Message-ID: <20250709160434.1859-11-tiwai@suse.de>
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

Convert the generic HD-audio codec driver to use the new hda_codec_ops
probe.  No functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/generic.c | 43 +++++++++++++++++++++++---------------
 sound/hda/codecs/generic.h |  3 ++-
 2 files changed, 28 insertions(+), 18 deletions(-)

diff --git a/sound/hda/codecs/generic.c b/sound/hda/codecs/generic.c
index 873fd4b7f451..82c31b93424c 100644
--- a/sound/hda/codecs/generic.c
+++ b/sound/hda/codecs/generic.c
@@ -4946,7 +4946,7 @@ static void mute_all_mixer_nid(struct hda_codec *codec, hda_nid_t mix)
  * @nid: audio widget
  * @on: power on/off flag
  *
- * Set this in patch_ops.stream_pm.  Only valid with power_save_node flag.
+ * Set this in hda_codec_ops.stream_pm.  Only valid with power_save_node flag.
  */
 void snd_hda_gen_stream_pm(struct hda_codec *codec, hda_nid_t nid, bool on)
 {
@@ -5230,7 +5230,7 @@ static const char * const follower_pfxs[] = {
  * snd_hda_gen_build_controls - Build controls from the parsed results
  * @codec: the HDA codec
  *
- * Pass this to build_controls patch_ops.
+ * Pass this to build_controls hda_codec_ops.
  */
 int snd_hda_gen_build_controls(struct hda_codec *codec)
 {
@@ -5743,7 +5743,7 @@ static void setup_pcm_stream(struct hda_pcm_stream *str,
  * snd_hda_gen_build_pcms - build PCM streams based on the parsed results
  * @codec: the HDA codec
  *
- * Pass this to build_pcms patch_ops.
+ * Pass this to build_pcms hda_codec_ops.
  */
 int snd_hda_gen_build_pcms(struct hda_codec *codec)
 {
@@ -6032,7 +6032,7 @@ static void clear_unsol_on_unused_pins(struct hda_codec *codec)
  * snd_hda_gen_init - initialize the generic spec
  * @codec: the HDA codec
  *
- * This can be put as patch_ops init function.
+ * This can be put as hda_codec_ops init function.
  */
 int snd_hda_gen_init(struct hda_codec *codec)
 {
@@ -6070,26 +6070,26 @@ int snd_hda_gen_init(struct hda_codec *codec)
 EXPORT_SYMBOL_GPL(snd_hda_gen_init);
 
 /**
- * snd_hda_gen_free - free the generic spec
+ * snd_hda_gen_remove - free the generic spec
  * @codec: the HDA codec
  *
- * This can be put as patch_ops free function.
+ * This can be put as hda_codec_ops remove function.
  */
-void snd_hda_gen_free(struct hda_codec *codec)
+void snd_hda_gen_remove(struct hda_codec *codec)
 {
 	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_FREE);
 	snd_hda_gen_spec_free(codec->spec);
 	kfree(codec->spec);
 	codec->spec = NULL;
 }
-EXPORT_SYMBOL_GPL(snd_hda_gen_free);
+EXPORT_SYMBOL_GPL(snd_hda_gen_remove);
 
 /**
  * snd_hda_gen_check_power_status - check the loopback power save state
  * @codec: the HDA codec
  * @nid: NID to inspect
  *
- * This can be put as patch_ops check_power_status function.
+ * This can be put as hda_codec_ops check_power_status function.
  */
 int snd_hda_gen_check_power_status(struct hda_codec *codec, hda_nid_t nid)
 {
@@ -6112,11 +6112,8 @@ static const struct hda_codec_ops generic_patch_ops = {
 	.check_power_status = snd_hda_gen_check_power_status,
 };
 
-/*
- * snd_hda_parse_generic_codec - Generic codec parser
- * @codec: the HDA codec
- */
-static int snd_hda_parse_generic_codec(struct hda_codec *codec)
+static int snd_hda_gen_probe(struct hda_codec *codec,
+			     const struct hda_device_id *id)
 {
 	struct hda_gen_spec *spec;
 	int err;
@@ -6139,19 +6136,31 @@ static int snd_hda_parse_generic_codec(struct hda_codec *codec)
 	return 0;
 
 error:
-	snd_hda_gen_free(codec);
+	snd_hda_gen_remove(codec);
 	return err;
 }
 
+static const struct hda_codec_ops generic_codec_ops = {
+	.probe = snd_hda_gen_probe,
+	.remove = snd_hda_gen_remove,
+	.build_controls = snd_hda_gen_build_controls,
+	.build_pcms = snd_hda_gen_build_pcms,
+	.init = snd_hda_gen_init,
+	.unsol_event = snd_hda_jack_unsol_event,
+	.check_power_status = snd_hda_gen_check_power_status,
+	.stream_pm = snd_hda_gen_stream_pm,
+};
+
 static const struct hda_device_id snd_hda_id_generic[] = {
-	HDA_CODEC_ENTRY(0x1af40021, "Generic", snd_hda_parse_generic_codec), /* QEMU */
-	HDA_CODEC_ENTRY(HDA_CODEC_ID_GENERIC, "Generic", snd_hda_parse_generic_codec),
+	HDA_CODEC_ID(0x1af40021, "Generic"), /* QEMU */
+	HDA_CODEC_ID(HDA_CODEC_ID_GENERIC, "Generic"),
 	{} /* terminator */
 };
 MODULE_DEVICE_TABLE(hdaudio, snd_hda_id_generic);
 
 static struct hda_codec_driver generic_driver = {
 	.id = snd_hda_id_generic,
+	.ops = &generic_codec_ops,
 };
 
 module_hda_codec_driver(generic_driver);
diff --git a/sound/hda/codecs/generic.h b/sound/hda/codecs/generic.h
index 9612afaa61c2..00a92fc55846 100644
--- a/sound/hda/codecs/generic.h
+++ b/sound/hda/codecs/generic.h
@@ -311,7 +311,8 @@ enum {
 int snd_hda_gen_spec_init(struct hda_gen_spec *spec);
 
 int snd_hda_gen_init(struct hda_codec *codec);
-void snd_hda_gen_free(struct hda_codec *codec);
+void snd_hda_gen_remove(struct hda_codec *codec);
+#define snd_hda_gen_free	snd_hda_gen_remove
 
 int snd_hda_get_path_idx(struct hda_codec *codec, struct nid_path *path);
 struct nid_path *snd_hda_get_path_from_idx(struct hda_codec *codec, int idx);
-- 
2.50.0

