Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773252DCBEB
	for <linux-sound@vger.kernel.org>; Wed,  9 Jul 2025 16:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752077544; cv=none; b=CrdCDTrkGPfFnXj288iz5Q8UpYOv6Z+dMT8qdhmkgv6rr9JUJiy/PVPgUmKPCNFs7UN3uJLaeUPRASipat+mp9SGRQOMt8HXJxI/p1ANDImenWyN0tpE12qE+ljJC8jtF3+srEy6poXTNTaH1qIVp9kmtDcN8nIJPHx+UJ/vxzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752077544; c=relaxed/simple;
	bh=hmp04wKyGmk4IE4llovWKpSt5iVXSrwEiB7Fu8onhhg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G+9qJUcjTjYcT7SPoZi0pv3PQ7gKjevAcIEWiIPgsrOtz7Lu8IePzSZKGwr4R+MkaBD71g1QFlYky0rbEms3cPOyQxWyLIzyKS4AG58w1ZGP2PRay7U1ZTOShYisaDV4fx5T0ca6x2QZLxd6ToD1udt3yAVcEVymk3QzhAZ14po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=g9HeB4HY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=73VlYcwY; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=g9HeB4HY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=73VlYcwY; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="g9HeB4HY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="73VlYcwY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="g9HeB4HY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="73VlYcwY"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5D3392116D;
	Wed,  9 Jul 2025 16:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752077092; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EGZp/4Hp7WuKdvP52hz/UJOWTpZ1Ss9AswnYVrOsAqw=;
	b=g9HeB4HYwDqt63N5BEn5EjJDct4F/QUlVUhmgDNg+NlLuJHMHrpKA5A6T3tILVco3a7hh2
	8I1CGrQse2PAfA+P/YUVNbRnBKJjQWGlbxUH+V8LtYkNbjMPBtTNcuOugMSNKp5m5SUdnH
	ljYa/2GesCxhp8PYJHFvkGRc14FwEt0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752077092;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EGZp/4Hp7WuKdvP52hz/UJOWTpZ1Ss9AswnYVrOsAqw=;
	b=73VlYcwYtgtYF21SV+0aEa2gDnfQ/0w8UwXyQsmTzQxUFbYvTDnPFCK+cwEPeuBsfaNMPr
	2eK2VfraZqkcdzDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752077092; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EGZp/4Hp7WuKdvP52hz/UJOWTpZ1Ss9AswnYVrOsAqw=;
	b=g9HeB4HYwDqt63N5BEn5EjJDct4F/QUlVUhmgDNg+NlLuJHMHrpKA5A6T3tILVco3a7hh2
	8I1CGrQse2PAfA+P/YUVNbRnBKJjQWGlbxUH+V8LtYkNbjMPBtTNcuOugMSNKp5m5SUdnH
	ljYa/2GesCxhp8PYJHFvkGRc14FwEt0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752077092;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EGZp/4Hp7WuKdvP52hz/UJOWTpZ1Ss9AswnYVrOsAqw=;
	b=73VlYcwYtgtYF21SV+0aEa2gDnfQ/0w8UwXyQsmTzQxUFbYvTDnPFCK+cwEPeuBsfaNMPr
	2eK2VfraZqkcdzDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 16E24136DC;
	Wed,  9 Jul 2025 16:04:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QOVEBCSTbmhDEAAAD6G6ig
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
Subject: [PATCH 11/27] ALSA: hda/realtek: Rewrite to new probe method
Date: Wed,  9 Jul 2025 18:04:14 +0200
Message-ID: <20250709160434.1859-12-tiwai@suse.de>
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

Convert the Realtek codec drivers to use the new hda_codec_ops probe.
No functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/realtek/alc260.c   |  20 ++++-
 sound/hda/codecs/realtek/alc262.c   |  20 ++++-
 sound/hda/codecs/realtek/alc268.c   |  22 +++++-
 sound/hda/codecs/realtek/alc269.c   | 111 +++++++++++++++-------------
 sound/hda/codecs/realtek/alc662.c   |  42 +++++++----
 sound/hda/codecs/realtek/alc680.c   |  20 ++++-
 sound/hda/codecs/realtek/alc861.c   |  22 +++++-
 sound/hda/codecs/realtek/alc861vd.c |  22 +++++-
 sound/hda/codecs/realtek/alc880.c   |  24 ++++--
 sound/hda/codecs/realtek/alc882.c   |  48 +++++++-----
 sound/hda/codecs/realtek/realtek.c  |  17 +----
 sound/hda/codecs/realtek/realtek.h  |   4 -
 12 files changed, 244 insertions(+), 128 deletions(-)

diff --git a/sound/hda/codecs/realtek/alc260.c b/sound/hda/codecs/realtek/alc260.c
index ebe20eaec58a..8bd47079dccb 100644
--- a/sound/hda/codecs/realtek/alc260.c
+++ b/sound/hda/codecs/realtek/alc260.c
@@ -211,7 +211,7 @@ static const struct hda_model_fixup alc260_fixup_models[] = {
 
 /*
  */
-static int patch_alc260(struct hda_codec *codec)
+static int alc260_probe(struct hda_codec *codec, const struct hda_device_id *id)
 {
 	struct alc_spec *spec;
 	int err;
@@ -252,15 +252,28 @@ static int patch_alc260(struct hda_codec *codec)
 	return 0;
 
  error:
-	alc_free(codec);
+	snd_hda_gen_remove(codec);
 	return err;
 }
 
+static const struct hda_codec_ops alc260_codec_ops = {
+	.probe = alc260_probe,
+	.remove = snd_hda_gen_remove,
+	.build_controls = alc_build_controls,
+	.build_pcms = snd_hda_gen_build_pcms,
+	.init = alc_init,
+	.unsol_event = snd_hda_jack_unsol_event,
+	.resume = alc_resume,
+	.suspend = alc_suspend,
+	.check_power_status = snd_hda_gen_check_power_status,
+	.stream_pm = snd_hda_gen_stream_pm,
+};
+
 /*
  * driver entries
  */
 static const struct hda_device_id snd_hda_id_alc260[] = {
-	HDA_CODEC_ENTRY(0x10ec0260, "ALC260", patch_alc260),
+	HDA_CODEC_ID(0x10ec0260, "ALC260"),
 	{} /* terminator */
 };
 MODULE_DEVICE_TABLE(hdaudio, snd_hda_id_alc260);
@@ -271,6 +284,7 @@ MODULE_IMPORT_NS("SND_HDA_CODEC_REALTEK");
 
 static struct hda_codec_driver alc260_driver = {
 	.id = snd_hda_id_alc260,
+	.ops = &alc260_codec_ops,
 };
 
 module_hda_codec_driver(alc260_driver);
diff --git a/sound/hda/codecs/realtek/alc262.c b/sound/hda/codecs/realtek/alc262.c
index ffe61f447667..3ec06cf5d2a6 100644
--- a/sound/hda/codecs/realtek/alc262.c
+++ b/sound/hda/codecs/realtek/alc262.c
@@ -126,7 +126,7 @@ static const struct hda_model_fixup alc262_fixup_models[] = {
 
 /*
  */
-static int patch_alc262(struct hda_codec *codec)
+static int alc262_probe(struct hda_codec *codec, const struct hda_device_id *id)
 {
 	struct alc_spec *spec;
 	int err;
@@ -175,15 +175,28 @@ static int patch_alc262(struct hda_codec *codec)
 	return 0;
 
  error:
-	alc_free(codec);
+	snd_hda_gen_remove(codec);
 	return err;
 }
 
+static const struct hda_codec_ops alc262_codec_ops = {
+	.probe = alc262_probe,
+	.remove = snd_hda_gen_remove,
+	.build_controls = alc_build_controls,
+	.build_pcms = snd_hda_gen_build_pcms,
+	.init = alc_init,
+	.unsol_event = snd_hda_jack_unsol_event,
+	.resume = alc_resume,
+	.suspend = alc_suspend,
+	.check_power_status = snd_hda_gen_check_power_status,
+	.stream_pm = snd_hda_gen_stream_pm,
+};
+
 /*
  * driver entries
  */
 static const struct hda_device_id snd_hda_id_alc262[] = {
-	HDA_CODEC_ENTRY(0x10ec0262, "ALC262", patch_alc262),
+	HDA_CODEC_ID(0x10ec0262, "ALC262"),
 	{} /* terminator */
 };
 MODULE_DEVICE_TABLE(hdaudio, snd_hda_id_alc262);
@@ -194,6 +207,7 @@ MODULE_IMPORT_NS("SND_HDA_CODEC_REALTEK");
 
 static struct hda_codec_driver alc262_driver = {
 	.id = snd_hda_id_alc262,
+	.ops = &alc262_codec_ops,
 };
 
 module_hda_codec_driver(alc262_driver);
diff --git a/sound/hda/codecs/realtek/alc268.c b/sound/hda/codecs/realtek/alc268.c
index d018f9982feb..e489cdc98eb8 100644
--- a/sound/hda/codecs/realtek/alc268.c
+++ b/sound/hda/codecs/realtek/alc268.c
@@ -101,7 +101,7 @@ static int alc268_parse_auto_config(struct hda_codec *codec)
 
 /*
  */
-static int patch_alc268(struct hda_codec *codec)
+static int alc268_probe(struct hda_codec *codec, const struct hda_device_id *id)
 {
 	struct alc_spec *spec;
 	int i, err;
@@ -151,16 +151,29 @@ static int patch_alc268(struct hda_codec *codec)
 	return 0;
 
  error:
-	alc_free(codec);
+	snd_hda_gen_remove(codec);
 	return err;
 }
 
+static const struct hda_codec_ops alc268_codec_ops = {
+	.probe = alc268_probe,
+	.remove = snd_hda_gen_remove,
+	.build_controls = alc_build_controls,
+	.build_pcms = snd_hda_gen_build_pcms,
+	.init = alc_init,
+	.unsol_event = snd_hda_jack_unsol_event,
+	.resume = alc_resume,
+	.suspend = alc_suspend,
+	.check_power_status = snd_hda_gen_check_power_status,
+	.stream_pm = snd_hda_gen_stream_pm,
+};
+
 /*
  * driver entries
  */
 static const struct hda_device_id snd_hda_id_alc268[] = {
-	HDA_CODEC_ENTRY(0x10ec0267, "ALC267", patch_alc268),
-	HDA_CODEC_ENTRY(0x10ec0268, "ALC268", patch_alc268),
+	HDA_CODEC_ID(0x10ec0267, "ALC267"),
+	HDA_CODEC_ID(0x10ec0268, "ALC268"),
 	{} /* terminator */
 };
 MODULE_DEVICE_TABLE(hdaudio, snd_hda_id_alc268);
@@ -171,6 +184,7 @@ MODULE_IMPORT_NS("SND_HDA_CODEC_REALTEK");
 
 static struct hda_codec_driver alc268_driver = {
 	.id = snd_hda_id_alc268,
+	.ops = &alc268_codec_ops,
 };
 
 module_hda_codec_driver(alc268_driver);
diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 325ba08e2981..b393338808d5 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -992,7 +992,7 @@ static int alc269_resume(struct hda_codec *codec)
 		msleep(150);
 	}
 
-	codec->patch_ops.init(codec);
+	snd_hda_codec_init(codec);
 
 	if (spec->codec_variant == ALC269_TYPE_ALC269VB)
 		alc269vb_toggle_power_output(codec, 1);
@@ -7841,19 +7841,19 @@ static void alc269_fill_coef(struct hda_codec *codec)
 	alc_update_coef_idx(codec, 0x4, 0, 1<<11);
 }
 
-static void alc269_free(struct hda_codec *codec)
+static void alc269_remove(struct hda_codec *codec)
 {
 	struct alc_spec *spec = codec->spec;
 
 	if (spec)
 		hda_component_manager_free(&spec->comps, &comp_master_ops);
 
-	alc_free(codec);
+	snd_hda_gen_remove(codec);
 }
 
 /*
  */
-static int patch_alc269(struct hda_codec *codec)
+static int alc269_probe(struct hda_codec *codec, const struct hda_device_id *id)
 {
 	struct alc_spec *spec;
 	int err;
@@ -7867,9 +7867,6 @@ static int patch_alc269(struct hda_codec *codec)
 	codec->power_save_node = 0;
 	spec->en_3kpull_low = true;
 
-	codec->patch_ops.suspend = alc269_suspend;
-	codec->patch_ops.resume = alc269_resume;
-	codec->patch_ops.free = alc269_free;
 	spec->shutup = alc_default_shutup;
 	spec->init_hook = alc_default_init;
 
@@ -8067,56 +8064,69 @@ static int patch_alc269(struct hda_codec *codec)
 	return 0;
 
  error:
-	alc_free(codec);
+	alc269_remove(codec);
 	return err;
 }
 
+static const struct hda_codec_ops alc269_codec_ops = {
+	.probe = alc269_probe,
+	.remove = alc269_remove,
+	.build_controls = alc_build_controls,
+	.build_pcms = snd_hda_gen_build_pcms,
+	.init = alc_init,
+	.unsol_event = snd_hda_jack_unsol_event,
+	.suspend = alc269_suspend,
+	.resume = alc269_resume,
+	.check_power_status = snd_hda_gen_check_power_status,
+	.stream_pm = snd_hda_gen_stream_pm,
+};
+
 /*
  * driver entries
  */
 static const struct hda_device_id snd_hda_id_alc269[] = {
-	HDA_CODEC_ENTRY(0x10ec0215, "ALC215", patch_alc269),
-	HDA_CODEC_ENTRY(0x10ec0221, "ALC221", patch_alc269),
-	HDA_CODEC_ENTRY(0x10ec0222, "ALC222", patch_alc269),
-	HDA_CODEC_ENTRY(0x10ec0225, "ALC225", patch_alc269),
-	HDA_CODEC_ENTRY(0x10ec0230, "ALC236", patch_alc269),
-	HDA_CODEC_ENTRY(0x10ec0231, "ALC231", patch_alc269),
-	HDA_CODEC_ENTRY(0x10ec0233, "ALC233", patch_alc269),
-	HDA_CODEC_ENTRY(0x10ec0234, "ALC234", patch_alc269),
-	HDA_CODEC_ENTRY(0x10ec0235, "ALC233", patch_alc269),
-	HDA_CODEC_ENTRY(0x10ec0236, "ALC236", patch_alc269),
-	HDA_CODEC_ENTRY(0x10ec0245, "ALC245", patch_alc269),
-	HDA_CODEC_ENTRY(0x10ec0255, "ALC255", patch_alc269),
-	HDA_CODEC_ENTRY(0x10ec0256, "ALC256", patch_alc269),
-	HDA_CODEC_ENTRY(0x10ec0257, "ALC257", patch_alc269),
-	HDA_CODEC_ENTRY(0x10ec0269, "ALC269", patch_alc269),
-	HDA_CODEC_ENTRY(0x10ec0270, "ALC270", patch_alc269),
-	HDA_CODEC_ENTRY(0x10ec0274, "ALC274", patch_alc269),
-	HDA_CODEC_ENTRY(0x10ec0275, "ALC275", patch_alc269),
-	HDA_CODEC_ENTRY(0x10ec0276, "ALC276", patch_alc269),
-	HDA_CODEC_ENTRY(0x10ec0280, "ALC280", patch_alc269),
-	HDA_CODEC_ENTRY(0x10ec0282, "ALC282", patch_alc269),
-	HDA_CODEC_ENTRY(0x10ec0283, "ALC283", patch_alc269),
-	HDA_CODEC_ENTRY(0x10ec0284, "ALC284", patch_alc269),
-	HDA_CODEC_ENTRY(0x10ec0285, "ALC285", patch_alc269),
-	HDA_CODEC_ENTRY(0x10ec0286, "ALC286", patch_alc269),
-	HDA_CODEC_ENTRY(0x10ec0287, "ALC287", patch_alc269),
-	HDA_CODEC_ENTRY(0x10ec0288, "ALC288", patch_alc269),
-	HDA_CODEC_ENTRY(0x10ec0289, "ALC289", patch_alc269),
-	HDA_CODEC_ENTRY(0x10ec0290, "ALC290", patch_alc269),
-	HDA_CODEC_ENTRY(0x10ec0292, "ALC292", patch_alc269),
-	HDA_CODEC_ENTRY(0x10ec0293, "ALC293", patch_alc269),
-	HDA_CODEC_ENTRY(0x10ec0294, "ALC294", patch_alc269),
-	HDA_CODEC_ENTRY(0x10ec0295, "ALC295", patch_alc269),
-	HDA_CODEC_ENTRY(0x10ec0298, "ALC298", patch_alc269),
-	HDA_CODEC_ENTRY(0x10ec0299, "ALC299", patch_alc269),
-	HDA_CODEC_ENTRY(0x10ec0300, "ALC300", patch_alc269),
-	HDA_CODEC_ENTRY(0x10ec0623, "ALC623", patch_alc269),
-	HDA_CODEC_ENTRY(0x10ec0700, "ALC700", patch_alc269),
-	HDA_CODEC_ENTRY(0x10ec0701, "ALC701", patch_alc269),
-	HDA_CODEC_ENTRY(0x10ec0703, "ALC703", patch_alc269),
-	HDA_CODEC_ENTRY(0x10ec0711, "ALC711", patch_alc269),
-	HDA_CODEC_ENTRY(0x19e58326, "HW8326", patch_alc269),
+	HDA_CODEC_ID(0x10ec0215, "ALC215"),
+	HDA_CODEC_ID(0x10ec0221, "ALC221"),
+	HDA_CODEC_ID(0x10ec0222, "ALC222"),
+	HDA_CODEC_ID(0x10ec0225, "ALC225"),
+	HDA_CODEC_ID(0x10ec0230, "ALC236"),
+	HDA_CODEC_ID(0x10ec0231, "ALC231"),
+	HDA_CODEC_ID(0x10ec0233, "ALC233"),
+	HDA_CODEC_ID(0x10ec0234, "ALC234"),
+	HDA_CODEC_ID(0x10ec0235, "ALC233"),
+	HDA_CODEC_ID(0x10ec0236, "ALC236"),
+	HDA_CODEC_ID(0x10ec0245, "ALC245"),
+	HDA_CODEC_ID(0x10ec0255, "ALC255"),
+	HDA_CODEC_ID(0x10ec0256, "ALC256"),
+	HDA_CODEC_ID(0x10ec0257, "ALC257"),
+	HDA_CODEC_ID(0x10ec0269, "ALC269"),
+	HDA_CODEC_ID(0x10ec0270, "ALC270"),
+	HDA_CODEC_ID(0x10ec0274, "ALC274"),
+	HDA_CODEC_ID(0x10ec0275, "ALC275"),
+	HDA_CODEC_ID(0x10ec0276, "ALC276"),
+	HDA_CODEC_ID(0x10ec0280, "ALC280"),
+	HDA_CODEC_ID(0x10ec0282, "ALC282"),
+	HDA_CODEC_ID(0x10ec0283, "ALC283"),
+	HDA_CODEC_ID(0x10ec0284, "ALC284"),
+	HDA_CODEC_ID(0x10ec0285, "ALC285"),
+	HDA_CODEC_ID(0x10ec0286, "ALC286"),
+	HDA_CODEC_ID(0x10ec0287, "ALC287"),
+	HDA_CODEC_ID(0x10ec0288, "ALC288"),
+	HDA_CODEC_ID(0x10ec0289, "ALC289"),
+	HDA_CODEC_ID(0x10ec0290, "ALC290"),
+	HDA_CODEC_ID(0x10ec0292, "ALC292"),
+	HDA_CODEC_ID(0x10ec0293, "ALC293"),
+	HDA_CODEC_ID(0x10ec0294, "ALC294"),
+	HDA_CODEC_ID(0x10ec0295, "ALC295"),
+	HDA_CODEC_ID(0x10ec0298, "ALC298"),
+	HDA_CODEC_ID(0x10ec0299, "ALC299"),
+	HDA_CODEC_ID(0x10ec0300, "ALC300"),
+	HDA_CODEC_ID(0x10ec0623, "ALC623"),
+	HDA_CODEC_ID(0x10ec0700, "ALC700"),
+	HDA_CODEC_ID(0x10ec0701, "ALC701"),
+	HDA_CODEC_ID(0x10ec0703, "ALC703"),
+	HDA_CODEC_ID(0x10ec0711, "ALC711"),
+	HDA_CODEC_ID(0x19e58326, "HW8326"),
 	{} /* terminator */
 };
 MODULE_DEVICE_TABLE(hdaudio, snd_hda_id_alc269);
@@ -8128,6 +8138,7 @@ MODULE_IMPORT_NS("SND_HDA_SCODEC_COMPONENT");
 
 static struct hda_codec_driver alc269_driver = {
 	.id = snd_hda_id_alc269,
+	.ops = &alc269_codec_ops,
 };
 
 module_hda_codec_driver(alc269_driver);
diff --git a/sound/hda/codecs/realtek/alc662.c b/sound/hda/codecs/realtek/alc662.c
index 94e4a313e5e2..5073165d1f3c 100644
--- a/sound/hda/codecs/realtek/alc662.c
+++ b/sound/hda/codecs/realtek/alc662.c
@@ -994,7 +994,7 @@ static const struct snd_hda_pin_quirk alc662_pin_fixup_tbl[] = {
 
 /*
  */
-static int patch_alc662(struct hda_codec *codec)
+static int alc662_probe(struct hda_codec *codec, const struct hda_device_id *id)
 {
 	struct alc_spec *spec;
 	int err;
@@ -1067,26 +1067,39 @@ static int patch_alc662(struct hda_codec *codec)
 	return 0;
 
  error:
-	alc_free(codec);
+	snd_hda_gen_remove(codec);
 	return err;
 }
 
+static const struct hda_codec_ops alc662_codec_ops = {
+	.probe = alc662_probe,
+	.remove = snd_hda_gen_remove,
+	.build_controls = alc_build_controls,
+	.build_pcms = snd_hda_gen_build_pcms,
+	.init = alc_init,
+	.unsol_event = snd_hda_jack_unsol_event,
+	.resume = alc_resume,
+	.suspend = alc_suspend,
+	.check_power_status = snd_hda_gen_check_power_status,
+	.stream_pm = snd_hda_gen_stream_pm,
+};
+
 /*
  * driver entries
  */
 static const struct hda_device_id snd_hda_id_alc662[] = {
-	HDA_CODEC_ENTRY(0x10ec0272, "ALC272", patch_alc662),
-	HDA_CODEC_REV_ENTRY(0x10ec0662, 0x100101, "ALC662 rev1", patch_alc662),
-	HDA_CODEC_REV_ENTRY(0x10ec0662, 0x100300, "ALC662 rev3", patch_alc662),
-	HDA_CODEC_ENTRY(0x10ec0663, "ALC663", patch_alc662),
-	HDA_CODEC_ENTRY(0x10ec0665, "ALC665", patch_alc662),
-	HDA_CODEC_ENTRY(0x10ec0667, "ALC667", patch_alc662),
-	HDA_CODEC_ENTRY(0x10ec0668, "ALC668", patch_alc662),
-	HDA_CODEC_ENTRY(0x10ec0670, "ALC670", patch_alc662),
-	HDA_CODEC_ENTRY(0x10ec0671, "ALC671", patch_alc662),
-	HDA_CODEC_ENTRY(0x10ec0867, "ALC891", patch_alc662),
-	HDA_CODEC_ENTRY(0x10ec0892, "ALC892", patch_alc662),
-	HDA_CODEC_ENTRY(0x10ec0897, "ALC897", patch_alc662),
+	HDA_CODEC_ID(0x10ec0272, "ALC272"),
+	HDA_CODEC_ID_REV(0x10ec0662, 0x100101, "ALC662 rev1"),
+	HDA_CODEC_ID_REV(0x10ec0662, 0x100300, "ALC662 rev3"),
+	HDA_CODEC_ID(0x10ec0663, "ALC663"),
+	HDA_CODEC_ID(0x10ec0665, "ALC665"),
+	HDA_CODEC_ID(0x10ec0667, "ALC667"),
+	HDA_CODEC_ID(0x10ec0668, "ALC668"),
+	HDA_CODEC_ID(0x10ec0670, "ALC670"),
+	HDA_CODEC_ID(0x10ec0671, "ALC671"),
+	HDA_CODEC_ID(0x10ec0867, "ALC891"),
+	HDA_CODEC_ID(0x10ec0892, "ALC892"),
+	HDA_CODEC_ID(0x10ec0897, "ALC897"),
 	{} /* terminator */
 };
 MODULE_DEVICE_TABLE(hdaudio, snd_hda_id_alc662);
@@ -1097,6 +1110,7 @@ MODULE_IMPORT_NS("SND_HDA_CODEC_REALTEK");
 
 static struct hda_codec_driver alc662_driver = {
 	.id = snd_hda_id_alc662,
+	.ops = &alc662_codec_ops,
 };
 
 module_hda_codec_driver(alc662_driver);
diff --git a/sound/hda/codecs/realtek/alc680.c b/sound/hda/codecs/realtek/alc680.c
index baf19ee3bc2f..8aab1026243c 100644
--- a/sound/hda/codecs/realtek/alc680.c
+++ b/sound/hda/codecs/realtek/alc680.c
@@ -14,7 +14,7 @@ static int alc680_parse_auto_config(struct hda_codec *codec)
 
 /*
  */
-static int patch_alc680(struct hda_codec *codec)
+static int alc680_probe(struct hda_codec *codec, const struct hda_device_id *id)
 {
 	int err;
 
@@ -26,18 +26,31 @@ static int patch_alc680(struct hda_codec *codec)
 	/* automatic parse from the BIOS config */
 	err = alc680_parse_auto_config(codec);
 	if (err < 0) {
-		alc_free(codec);
+		snd_hda_gen_remove(codec);
 		return err;
 	}
 
 	return 0;
 }
 
+static const struct hda_codec_ops alc680_codec_ops = {
+	.probe = alc680_probe,
+	.remove = snd_hda_gen_remove,
+	.build_controls = alc_build_controls,
+	.build_pcms = snd_hda_gen_build_pcms,
+	.init = alc_init,
+	.unsol_event = snd_hda_jack_unsol_event,
+	.resume = alc_resume,
+	.suspend = alc_suspend,
+	.check_power_status = snd_hda_gen_check_power_status,
+	.stream_pm = snd_hda_gen_stream_pm,
+};
+
 /*
  * driver entries
  */
 static const struct hda_device_id snd_hda_id_alc680[] = {
-	HDA_CODEC_ENTRY(0x10ec0680, "ALC680", patch_alc680),
+	HDA_CODEC_ID(0x10ec0680, "ALC680"),
 	{} /* terminator */
 };
 MODULE_DEVICE_TABLE(hdaudio, snd_hda_id_alc680);
@@ -48,6 +61,7 @@ MODULE_IMPORT_NS("SND_HDA_CODEC_REALTEK");
 
 static struct hda_codec_driver alc680_driver = {
 	.id = snd_hda_id_alc680,
+	.ops = &alc680_codec_ops,
 };
 
 module_hda_codec_driver(alc680_driver);
diff --git a/sound/hda/codecs/realtek/alc861.c b/sound/hda/codecs/realtek/alc861.c
index 0eb70b44dc05..270037c6504a 100644
--- a/sound/hda/codecs/realtek/alc861.c
+++ b/sound/hda/codecs/realtek/alc861.c
@@ -88,7 +88,7 @@ static const struct hda_quirk alc861_fixup_tbl[] = {
 
 /*
  */
-static int patch_alc861(struct hda_codec *codec)
+static int alc861_probe(struct hda_codec *codec, const struct hda_device_id *id)
 {
 	struct alc_spec *spec;
 	int err;
@@ -124,16 +124,29 @@ static int patch_alc861(struct hda_codec *codec)
 	return 0;
 
  error:
-	alc_free(codec);
+	snd_hda_gen_remove(codec);
 	return err;
 }
 
+static const struct hda_codec_ops alc861_codec_ops = {
+	.probe = alc861_probe,
+	.remove = snd_hda_gen_remove,
+	.build_controls = alc_build_controls,
+	.build_pcms = snd_hda_gen_build_pcms,
+	.init = alc_init,
+	.unsol_event = snd_hda_jack_unsol_event,
+	.resume = alc_resume,
+	.suspend = alc_suspend,
+	.check_power_status = snd_hda_gen_check_power_status,
+	.stream_pm = snd_hda_gen_stream_pm,
+};
+
 /*
  * driver entries
  */
 static const struct hda_device_id snd_hda_id_alc861[] = {
-	HDA_CODEC_REV_ENTRY(0x10ec0861, 0x100340, "ALC660", patch_alc861),
-	HDA_CODEC_ENTRY(0x10ec0861, "ALC861", patch_alc861),
+	HDA_CODEC_ID_REV(0x10ec0861, 0x100340, "ALC660"),
+	HDA_CODEC_ID(0x10ec0861, "ALC861"),
 	{} /* terminator */
 };
 MODULE_DEVICE_TABLE(hdaudio, snd_hda_id_alc861);
@@ -144,6 +157,7 @@ MODULE_IMPORT_NS("SND_HDA_CODEC_REALTEK");
 
 static struct hda_codec_driver alc861_driver = {
 	.id = snd_hda_id_alc861,
+	.ops = &alc861_codec_ops,
 };
 
 module_hda_codec_driver(alc861_driver);
diff --git a/sound/hda/codecs/realtek/alc861vd.c b/sound/hda/codecs/realtek/alc861vd.c
index ebf274ad730b..44264e0d6e56 100644
--- a/sound/hda/codecs/realtek/alc861vd.c
+++ b/sound/hda/codecs/realtek/alc861vd.c
@@ -62,7 +62,7 @@ static const struct hda_quirk alc861vd_fixup_tbl[] = {
 
 /*
  */
-static int patch_alc861vd(struct hda_codec *codec)
+static int alc861vd_probe(struct hda_codec *codec, const struct hda_device_id *id)
 {
 	struct alc_spec *spec;
 	int err;
@@ -98,16 +98,29 @@ static int patch_alc861vd(struct hda_codec *codec)
 	return 0;
 
  error:
-	alc_free(codec);
+	snd_hda_gen_remove(codec);
 	return err;
 }
 
+static const struct hda_codec_ops alc861vd_codec_ops = {
+	.probe = alc861vd_probe,
+	.remove = snd_hda_gen_remove,
+	.build_controls = alc_build_controls,
+	.build_pcms = snd_hda_gen_build_pcms,
+	.init = alc_init,
+	.unsol_event = snd_hda_jack_unsol_event,
+	.resume = alc_resume,
+	.suspend = alc_suspend,
+	.check_power_status = snd_hda_gen_check_power_status,
+	.stream_pm = snd_hda_gen_stream_pm,
+};
+
 /*
  * driver entries
  */
 static const struct hda_device_id snd_hda_id_alc861vd[] = {
-	HDA_CODEC_ENTRY(0x10ec0660, "ALC660-VD", patch_alc861vd),
-	HDA_CODEC_ENTRY(0x10ec0862, "ALC861-VD", patch_alc861vd),
+	HDA_CODEC_ID(0x10ec0660, "ALC660-VD"),
+	HDA_CODEC_ID(0x10ec0862, "ALC861-VD"),
 	{} /* terminator */
 };
 MODULE_DEVICE_TABLE(hdaudio, snd_hda_id_alc861vd);
@@ -118,6 +131,7 @@ MODULE_IMPORT_NS("SND_HDA_CODEC_REALTEK");
 
 static struct hda_codec_driver alc861vd_driver = {
 	.id = snd_hda_id_alc861vd,
+	.ops = &alc861vd_codec_ops,
 };
 
 module_hda_codec_driver(alc861vd_driver);
diff --git a/sound/hda/codecs/realtek/alc880.c b/sound/hda/codecs/realtek/alc880.c
index 2e828ab96dc5..bf1bdf11ec2d 100644
--- a/sound/hda/codecs/realtek/alc880.c
+++ b/sound/hda/codecs/realtek/alc880.c
@@ -434,9 +434,9 @@ static const struct hda_model_fixup alc880_fixup_models[] = {
 
 
 /*
- * OK, here we have finally the patch for ALC880
+ * OK, here we have finally the probe for ALC880
  */
-static int patch_alc880(struct hda_codec *codec)
+static int alc880_probe(struct hda_codec *codec, const struct hda_device_id *id)
 {
 	struct alc_spec *spec;
 	int err;
@@ -449,8 +449,6 @@ static int patch_alc880(struct hda_codec *codec)
 	spec->gen.need_dac_fix = 1;
 	spec->gen.beep_nid = 0x01;
 
-	codec->patch_ops.unsol_event = alc880_unsol_event;
-
 	alc_pre_init(codec);
 
 	snd_hda_pick_fixup(codec, alc880_fixup_models, alc880_fixup_tbl,
@@ -473,15 +471,28 @@ static int patch_alc880(struct hda_codec *codec)
 	return 0;
 
  error:
-	alc_free(codec);
+	snd_hda_gen_remove(codec);
 	return err;
 }
 
+static const struct hda_codec_ops alc880_codec_ops = {
+	.probe = alc880_probe,
+	.remove = snd_hda_gen_remove,
+	.build_controls = alc_build_controls,
+	.build_pcms = snd_hda_gen_build_pcms,
+	.init = alc_init,
+	.unsol_event = alc880_unsol_event,
+	.resume = alc_resume,
+	.suspend = alc_suspend,
+	.check_power_status = snd_hda_gen_check_power_status,
+	.stream_pm = snd_hda_gen_stream_pm,
+};
+
 /*
  * driver entries
  */
 static const struct hda_device_id snd_hda_id_alc880[] = {
-	HDA_CODEC_ENTRY(0x10ec0880, "ALC880", patch_alc880),
+	HDA_CODEC_ID(0x10ec0880, "ALC880"),
 	{} /* terminator */
 };
 MODULE_DEVICE_TABLE(hdaudio, snd_hda_id_alc880);
@@ -492,6 +503,7 @@ MODULE_IMPORT_NS("SND_HDA_CODEC_REALTEK");
 
 static struct hda_codec_driver alc880_driver = {
 	.id = snd_hda_id_alc880,
+	.ops = &alc880_codec_ops,
 };
 
 module_hda_codec_driver(alc880_driver);
diff --git a/sound/hda/codecs/realtek/alc882.c b/sound/hda/codecs/realtek/alc882.c
index 6af2f7fcc6bb..529fecd5baa0 100644
--- a/sound/hda/codecs/realtek/alc882.c
+++ b/sound/hda/codecs/realtek/alc882.c
@@ -757,7 +757,7 @@ static int alc882_parse_auto_config(struct hda_codec *codec)
 
 /*
  */
-static int patch_alc882(struct hda_codec *codec)
+static int alc882_probe(struct hda_codec *codec, const struct hda_device_id *id)
 {
 	struct alc_spec *spec;
 	int err;
@@ -809,29 +809,42 @@ static int patch_alc882(struct hda_codec *codec)
 	return 0;
 
  error:
-	alc_free(codec);
+	snd_hda_gen_remove(codec);
 	return err;
 }
 
+static const struct hda_codec_ops alc882_codec_ops = {
+	.probe = alc882_probe,
+	.remove = snd_hda_gen_remove,
+	.build_controls = alc_build_controls,
+	.build_pcms = snd_hda_gen_build_pcms,
+	.init = alc_init,
+	.unsol_event = snd_hda_jack_unsol_event,
+	.resume = alc_resume,
+	.suspend = alc_suspend,
+	.check_power_status = snd_hda_gen_check_power_status,
+	.stream_pm = snd_hda_gen_stream_pm,
+};
+
 /*
  * driver entries
  */
 static const struct hda_device_id snd_hda_id_alc882[] = {
-	HDA_CODEC_REV_ENTRY(0x10ec0662, 0x100002, "ALC662 rev2", patch_alc882),
-	HDA_CODEC_ENTRY(0x10ec0882, "ALC882", patch_alc882),
-	HDA_CODEC_ENTRY(0x10ec0883, "ALC883", patch_alc882),
-	HDA_CODEC_REV_ENTRY(0x10ec0885, 0x100101, "ALC889A", patch_alc882),
-	HDA_CODEC_REV_ENTRY(0x10ec0885, 0x100103, "ALC889A", patch_alc882),
-	HDA_CODEC_ENTRY(0x10ec0885, "ALC885", patch_alc882),
-	HDA_CODEC_ENTRY(0x10ec0887, "ALC887", patch_alc882),
-	HDA_CODEC_REV_ENTRY(0x10ec0888, 0x100101, "ALC1200", patch_alc882),
-	HDA_CODEC_ENTRY(0x10ec0888, "ALC888", patch_alc882),
-	HDA_CODEC_ENTRY(0x10ec0889, "ALC889", patch_alc882),
-	HDA_CODEC_ENTRY(0x10ec0899, "ALC898", patch_alc882),
-	HDA_CODEC_ENTRY(0x10ec0900, "ALC1150", patch_alc882),
-	HDA_CODEC_ENTRY(0x10ec0b00, "ALCS1200A", patch_alc882),
-	HDA_CODEC_ENTRY(0x10ec1168, "ALC1220", patch_alc882),
-	HDA_CODEC_ENTRY(0x10ec1220, "ALC1220", patch_alc882),
+	HDA_CODEC_ID_REV(0x10ec0662, 0x100002, "ALC662 rev2"),
+	HDA_CODEC_ID(0x10ec0882, "ALC882"),
+	HDA_CODEC_ID(0x10ec0883, "ALC883"),
+	HDA_CODEC_ID_REV(0x10ec0885, 0x100101, "ALC889A"),
+	HDA_CODEC_ID_REV(0x10ec0885, 0x100103, "ALC889A"),
+	HDA_CODEC_ID(0x10ec0885, "ALC885"),
+	HDA_CODEC_ID(0x10ec0887, "ALC887"),
+	HDA_CODEC_ID_REV(0x10ec0888, 0x100101, "ALC1200"),
+	HDA_CODEC_ID(0x10ec0888, "ALC888"),
+	HDA_CODEC_ID(0x10ec0889, "ALC889"),
+	HDA_CODEC_ID(0x10ec0899, "ALC898"),
+	HDA_CODEC_ID(0x10ec0900, "ALC1150"),
+	HDA_CODEC_ID(0x10ec0b00, "ALCS1200A"),
+	HDA_CODEC_ID(0x10ec1168, "ALC1220"),
+	HDA_CODEC_ID(0x10ec1220, "ALC1220"),
 	{} /* terminator */
 };
 MODULE_DEVICE_TABLE(hdaudio, snd_hda_id_alc882);
@@ -842,6 +855,7 @@ MODULE_IMPORT_NS("SND_HDA_CODEC_REALTEK");
 
 static struct hda_codec_driver alc882_driver = {
 	.id = snd_hda_id_alc882,
+	.ops = &alc882_codec_ops,
 };
 
 module_hda_codec_driver(alc882_driver);
diff --git a/sound/hda/codecs/realtek/realtek.c b/sound/hda/codecs/realtek/realtek.c
index 4ab49e76c304..66b2efb9acb3 100644
--- a/sound/hda/codecs/realtek/realtek.c
+++ b/sound/hda/codecs/realtek/realtek.c
@@ -862,27 +862,13 @@ int alc_resume(struct hda_codec *codec)
 
 	if (!spec->no_depop_delay)
 		msleep(150); /* to avoid pop noise */
-	codec->patch_ops.init(codec);
+	snd_hda_codec_init(codec);
 	snd_hda_regmap_sync(codec);
 	hda_call_check_power_status(codec, 0x01);
 	return 0;
 }
 EXPORT_SYMBOL_NS_GPL(alc_resume, "SND_HDA_CODEC_REALTEK");
 
-/*
- */
-const struct hda_codec_ops alc_patch_ops = {
-	.build_controls = alc_build_controls,
-	.build_pcms = snd_hda_gen_build_pcms,
-	.init = alc_init,
-	.free = alc_free,
-	.unsol_event = snd_hda_jack_unsol_event,
-	.resume = alc_resume,
-	.suspend = alc_suspend,
-	.check_power_status = snd_hda_gen_check_power_status,
-};
-EXPORT_SYMBOL_NS_GPL(alc_patch_ops, "SND_HDA_CODEC_REALTEK");
-
 /*
  * Rename codecs appropriately from COEF value or subvendor id
  */
@@ -1082,7 +1068,6 @@ int alc_alloc_spec(struct hda_codec *codec, hda_nid_t mixer_nid)
 	/* FIXME: do we need this for all Realtek codec models? */
 	codec->spdif_status_reset = 1;
 	codec->forced_resume = 1;
-	codec->patch_ops = alc_patch_ops;
 	mutex_init(&spec->coef_mutex);
 
 	err = alc_codec_rename_from_preset(codec);
diff --git a/sound/hda/codecs/realtek/realtek.h b/sound/hda/codecs/realtek/realtek.h
index ac142f2540e3..ee893da0c486 100644
--- a/sound/hda/codecs/realtek/realtek.h
+++ b/sound/hda/codecs/realtek/realtek.h
@@ -226,15 +226,11 @@ void alc_power_eapd(struct hda_codec *codec);
 int alc_suspend(struct hda_codec *codec);
 int alc_resume(struct hda_codec *codec);
 
-#define alc_free	snd_hda_gen_free
-
 int alc_parse_auto_config(struct hda_codec *codec,
 			  const hda_nid_t *ignore_nids,
 			  const hda_nid_t *ssid_nids);
 int alc_alloc_spec(struct hda_codec *codec, hda_nid_t mixer_nid);
 
-extern const struct hda_codec_ops alc_patch_ops;
-
 #define alc_codec_rename(codec, name) snd_hda_codec_set_name(codec, name)
 
 #ifdef CONFIG_SND_HDA_INPUT_BEEP
-- 
2.50.0

