Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219AF2DA743
	for <linux-sound@vger.kernel.org>; Wed,  9 Jul 2025 16:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752077475; cv=none; b=iwjbRwz5ig/kuUj9eB0NJfoHybE9B/USESYVIt97VQAUgWL8eM95JQMJeP1tPQVB4ZX9IuspQEreClXUUasYW0SRonsau7Jc78F0Cb2JKqeQThGy6b4LwKKOpP30RXjW6qXxOebizEjhBdJZ3hWM7Gizd5scAiGLGnEM1cyBGgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752077475; c=relaxed/simple;
	bh=ZnWafTkoOeFXiwYstiOPme/zI9Y+Qxn7szS15SmWA54=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dCHKK7PFTQ5zzKjaWiduw+bPJKtifCQ5SrUAnMDKUyH5O5yYYyh31AtAv4vzXYiWlsRSnlAzeBwzLPcvBlfjLMrcstuG0R/RadggRS5/VKEnm7NS1+ARKNQnAfD7OPm2nMeDeRQGWQ9Rm3ZV+sqCG0E7KYHSXnDig5CG5HPhbog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0QrHq6wY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Yx3TjwGY; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fT4234yI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rhsC91Ab; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0QrHq6wY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Yx3TjwGY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fT4234yI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rhsC91Ab"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C104B2118C;
	Wed,  9 Jul 2025 16:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752077098; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4DJ3rUVlLGAV9KTRqvUr28EizqyhH9l2RoPsA8dj0Dk=;
	b=0QrHq6wYC9XHnpa0E9YfUtRJu25giOYGBMIrH9peoT8AOSxGwxtxqRjeMHGveWvNbSqK+4
	qKm3D+ATeSi4+XBop/vo2GGY5GgITRV+TWN4gFB8nMRfgdE7TKv4CtOjEsUJu5JJTIY+OP
	/4oIHKtutEHauidM7OuWi/11/2CCeFY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752077098;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4DJ3rUVlLGAV9KTRqvUr28EizqyhH9l2RoPsA8dj0Dk=;
	b=Yx3TjwGYQQbHriWyJxougvVN/0vYYeDh9HE9GObWrt0T2r3YdKezLZCuY82/K49Y0oJVMD
	bV78n9qWvS1oUaCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=fT4234yI;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=rhsC91Ab
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752077097; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4DJ3rUVlLGAV9KTRqvUr28EizqyhH9l2RoPsA8dj0Dk=;
	b=fT4234yIxTrAZrNJ+9tBA3jweNKcftPhQDK48z3SmDF96FnIlaxSiipW2mmxLTW94dJSrQ
	1ASyyTPhnlY4/YoDnzs7T8eblJP3wXP8FwGdYhC02QMWQoJSRKfdBKJ+qTKUNgTOAVfOpa
	9rXNRM6i0BatL50j+0RZfUItE6B9vZw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752077097;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4DJ3rUVlLGAV9KTRqvUr28EizqyhH9l2RoPsA8dj0Dk=;
	b=rhsC91Ab0m/5MhEU3na9doEQaniUBEet/oKJ/iceQs2nnAwlGNRr4VvE3l7y7B3BYaBh4x
	Jps3w/AHR+WLyBDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7A553136DC;
	Wed,  9 Jul 2025 16:04:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ONuiHCmTbmhDEAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 09 Jul 2025 16:04:57 +0000
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
Subject: [PATCH 19/27] ALSA: hda/si3054: Rewrite to new probe method
Date: Wed,  9 Jul 2025 18:04:22 +0200
Message-ID: <20250709160434.1859-20-tiwai@suse.de>
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
X-Rspamd-Queue-Id: C104B2118C
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Convert the SI3054 codec driver to use the new hda_codec_ops probe.
No functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/si3054.c | 53 +++++++++++++++++++--------------------
 1 file changed, 26 insertions(+), 27 deletions(-)

diff --git a/sound/hda/codecs/si3054.c b/sound/hda/codecs/si3054.c
index 763eae80a148..87cf9da9f3bf 100644
--- a/sound/hda/codecs/si3054.c
+++ b/sound/hda/codecs/si3054.c
@@ -2,7 +2,7 @@
 /*
  * Universal Interface for Intel High Definition Audio Codec
  *
- * HD audio interface patch for Silicon Labs 3054/5 modem codec
+ * HD audio codec driver for Silicon Labs 3054/5 modem codec
  *
  * Copyright (c) 2005 Sasha Khapyorsky <sashak@alsa-project.org>
  *                    Takashi Iwai <tiwai@suse.de>
@@ -246,50 +246,48 @@ static int si3054_init(struct hda_codec *codec)
 	return 0;
 }
 
-static void si3054_free(struct hda_codec *codec)
+static void si3054_remove(struct hda_codec *codec)
 {
 	kfree(codec->spec);
 }
 
-
 /*
  */
 
-static const struct hda_codec_ops si3054_patch_ops = {
-	.build_controls = si3054_build_controls,
-	.build_pcms = si3054_build_pcms,
-	.init = si3054_init,
-	.free = si3054_free,
-};
-
-static int patch_si3054(struct hda_codec *codec)
+static int si3054_probe(struct hda_codec *codec, const struct hda_device_id *id)
 {
-	struct si3054_spec *spec = kzalloc(sizeof(*spec), GFP_KERNEL);
-	if (spec == NULL)
+	codec->spec = kzalloc(sizeof(struct si3054_spec), GFP_KERNEL);
+	if (!codec->spec)
 		return -ENOMEM;
-	codec->spec = spec;
-	codec->patch_ops = si3054_patch_ops;
 	return 0;
 }
 
+static const struct hda_codec_ops si3054_codec_ops = {
+	.probe = si3054_probe,
+	.remove = si3054_remove,
+	.build_controls = si3054_build_controls,
+	.build_pcms = si3054_build_pcms,
+	.init = si3054_init,
+};
+
 /*
- * patch entries
+ * driver entries
  */
 static const struct hda_device_id snd_hda_id_si3054[] = {
-	HDA_CODEC_ENTRY(0x163c3055, "Si3054", patch_si3054),
-	HDA_CODEC_ENTRY(0x163c3155, "Si3054", patch_si3054),
-	HDA_CODEC_ENTRY(0x11c13026, "Si3054", patch_si3054),
-	HDA_CODEC_ENTRY(0x11c13055, "Si3054", patch_si3054),
-	HDA_CODEC_ENTRY(0x11c13155, "Si3054", patch_si3054),
-	HDA_CODEC_ENTRY(0x10573055, "Si3054", patch_si3054),
-	HDA_CODEC_ENTRY(0x10573057, "Si3054", patch_si3054),
-	HDA_CODEC_ENTRY(0x10573155, "Si3054", patch_si3054),
+	HDA_CODEC_ID(0x163c3055, "Si3054"),
+	HDA_CODEC_ID(0x163c3155, "Si3054"),
+	HDA_CODEC_ID(0x11c13026, "Si3054"),
+	HDA_CODEC_ID(0x11c13055, "Si3054"),
+	HDA_CODEC_ID(0x11c13155, "Si3054"),
+	HDA_CODEC_ID(0x10573055, "Si3054"),
+	HDA_CODEC_ID(0x10573057, "Si3054"),
+	HDA_CODEC_ID(0x10573155, "Si3054"),
 	/* VIA HDA on Clevo m540 */
-	HDA_CODEC_ENTRY(0x11063288, "Si3054", patch_si3054),
+	HDA_CODEC_ID(0x11063288, "Si3054"),
 	/* Asus A8J Modem (SM56) */
-	HDA_CODEC_ENTRY(0x15433155, "Si3054", patch_si3054),
+	HDA_CODEC_ID(0x15433155, "Si3054"),
 	/* LG LW20 modem */
-	HDA_CODEC_ENTRY(0x18540018, "Si3054", patch_si3054),
+	HDA_CODEC_ID(0x18540018, "Si3054"),
 	{}
 };
 MODULE_DEVICE_TABLE(hdaudio, snd_hda_id_si3054);
@@ -299,6 +297,7 @@ MODULE_DESCRIPTION("Si3054 HD-audio modem codec");
 
 static struct hda_codec_driver si3054_driver = {
 	.id = snd_hda_id_si3054,
+	.ops = &si3054_codec_ops,
 };
 
 module_hda_codec_driver(si3054_driver);
-- 
2.50.0

