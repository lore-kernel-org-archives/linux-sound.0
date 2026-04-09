Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67D33A3E6B
	for <linux-sound@vger.kernel.org>; Thu,  9 Apr 2026 09:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775727539; cv=none; b=Tszpz5Ikew7RTbLe7J9lR+rovHttqaPs7jXgXKSAbuGNZMgeqe4fAeIGMNyVEqNpCEDiLDU0UmqV63uMIbLYtZqjfU0MbqvSsftS7E+rURkzBKEguvJ35X4FhyaSTAt2P9UKaTfh+3cjwOJRMniJhfsLr9PQTXH3Bh2VndxL1s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775727539; c=relaxed/simple;
	bh=pcCJ8lF566Y/icgcVEiJMdumaUulggn/02UmG6ibitc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tQHeu72Cr8XXe5KMN8aFdxCrAF5V3RuImU57/EzxEWzqYUgJGPn+3+VxIt6stAn4gLb8S2rR549gNHFlTU5Rwpnp7Y8RXDm9Usvd+kLyCcgvy2tU+7oy1YlSyYzsuN2NnKVmiPwh6VI75/jf3VnVIw/I6Hs8ChtSLLbtmT/9jzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=M09roJqG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=U47YPzTj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=M09roJqG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=U47YPzTj; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="M09roJqG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="U47YPzTj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="M09roJqG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="U47YPzTj"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 233555BD28;
	Thu,  9 Apr 2026 09:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775727511; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EOg3cndUK+ygfOzM0gU5ezsFuaU0pN25V2WS/DEik+k=;
	b=M09roJqGSZyuGZ7UcpE1RSfYlQoVG4XffFqCVuKlSebqSzM0tzE7oHzpJB1rN8LOKUYUGH
	bn15FCMZkYheIMzQIFe6Qs9RIOYGyVGy7iM5nJPvMMmvzEO7yQafCRHAI73GDxSnv/TZ9Y
	HVASWHxlSOFjWndXLn2VU6O0NHMWuXU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775727511;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EOg3cndUK+ygfOzM0gU5ezsFuaU0pN25V2WS/DEik+k=;
	b=U47YPzTjbuFZt/+JWGvbGS3kEQtzWPQr13S0ReITFCr/U85HoI3DxMzXQjk7flFTtMQ8GO
	qjKpCcVUPnizCpBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775727511; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EOg3cndUK+ygfOzM0gU5ezsFuaU0pN25V2WS/DEik+k=;
	b=M09roJqGSZyuGZ7UcpE1RSfYlQoVG4XffFqCVuKlSebqSzM0tzE7oHzpJB1rN8LOKUYUGH
	bn15FCMZkYheIMzQIFe6Qs9RIOYGyVGy7iM5nJPvMMmvzEO7yQafCRHAI73GDxSnv/TZ9Y
	HVASWHxlSOFjWndXLn2VU6O0NHMWuXU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775727511;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EOg3cndUK+ygfOzM0gU5ezsFuaU0pN25V2WS/DEik+k=;
	b=U47YPzTjbuFZt/+JWGvbGS3kEQtzWPQr13S0ReITFCr/U85HoI3DxMzXQjk7flFTtMQ8GO
	qjKpCcVUPnizCpBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0AFEA4A0B5;
	Thu,  9 Apr 2026 09:38:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SIKJAZdz12mdWgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 09 Apr 2026 09:38:31 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 08/10] ALSA: hda/cirrus: Clean up with the new GPIO helper
Date: Thu,  9 Apr 2026 11:38:21 +0200
Message-ID: <20260409093826.1317626-9-tiwai@suse.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260409093826.1317626-1-tiwai@suse.de>
References: <20260409093826.1317626-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO

Use the new GPIO helper function to clean up the open code.

Merely a code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/cirrus/cs420x.c | 11 +++--------
 sound/hda/codecs/cirrus/cs421x.c | 11 +++--------
 sound/hda/codecs/cirrus/cs8409.c | 22 ++++++----------------
 3 files changed, 12 insertions(+), 32 deletions(-)

diff --git a/sound/hda/codecs/cirrus/cs420x.c b/sound/hda/codecs/cirrus/cs420x.c
index 52eda0a338ea..42559edbba05 100644
--- a/sound/hda/codecs/cirrus/cs420x.c
+++ b/sound/hda/codecs/cirrus/cs420x.c
@@ -264,14 +264,9 @@ static int cs_init(struct hda_codec *codec)
 
 	snd_hda_gen_init(codec);
 
-	if (spec->gpio_mask) {
-		snd_hda_codec_write(codec, 0x01, 0, AC_VERB_SET_GPIO_MASK,
-				    spec->gpio_mask);
-		snd_hda_codec_write(codec, 0x01, 0, AC_VERB_SET_GPIO_DIRECTION,
-				    spec->gpio_dir);
-		snd_hda_codec_write(codec, 0x01, 0, AC_VERB_SET_GPIO_DATA,
-				    spec->gpio_data);
-	}
+	if (spec->gpio_mask)
+		snd_hda_codec_set_gpio(codec, spec->gpio_mask, spec->gpio_dir,
+				       spec->gpio_data, 0);
 
 	if (spec->vendor_nid == CS420X_VENDOR_NID) {
 		init_input_coef(codec);
diff --git a/sound/hda/codecs/cirrus/cs421x.c b/sound/hda/codecs/cirrus/cs421x.c
index c8349a2c5a36..645b06599e5f 100644
--- a/sound/hda/codecs/cirrus/cs421x.c
+++ b/sound/hda/codecs/cirrus/cs421x.c
@@ -442,14 +442,9 @@ static int cs421x_init(struct hda_codec *codec)
 
 	snd_hda_gen_init(codec);
 
-	if (spec->gpio_mask) {
-		snd_hda_codec_write(codec, 0x01, 0, AC_VERB_SET_GPIO_MASK,
-				    spec->gpio_mask);
-		snd_hda_codec_write(codec, 0x01, 0, AC_VERB_SET_GPIO_DIRECTION,
-				    spec->gpio_dir);
-		snd_hda_codec_write(codec, 0x01, 0, AC_VERB_SET_GPIO_DATA,
-				    spec->gpio_data);
-	}
+	if (spec->gpio_mask)
+		snd_hda_codec_set_gpio(codec, spec->gpio_mask, spec->gpio_dir,
+				       spec->gpio_data, 0);
 
 	cs4210_spdif_automute(codec, NULL);
 
diff --git a/sound/hda/codecs/cirrus/cs8409.c b/sound/hda/codecs/cirrus/cs8409.c
index 2d8f482e6474..c43ff3ef75b6 100644
--- a/sound/hda/codecs/cirrus/cs8409.c
+++ b/sound/hda/codecs/cirrus/cs8409.c
@@ -1042,14 +1042,9 @@ static void cs8409_cs42l42_hw_init(struct hda_codec *codec)
 	struct cs8409_spec *spec = codec->spec;
 	struct sub_codec *cs42l42 = spec->scodecs[CS8409_CODEC0];
 
-	if (spec->gpio_mask) {
-		snd_hda_codec_write(codec, CS8409_PIN_AFG, 0, AC_VERB_SET_GPIO_MASK,
-			spec->gpio_mask);
-		snd_hda_codec_write(codec, CS8409_PIN_AFG, 0, AC_VERB_SET_GPIO_DIRECTION,
-			spec->gpio_dir);
-		snd_hda_codec_write(codec, CS8409_PIN_AFG, 0, AC_VERB_SET_GPIO_DATA,
-			spec->gpio_data);
-	}
+	if (spec->gpio_mask)
+		snd_hda_codec_set_gpio(codec, spec->gpio_mask, spec->gpio_dir,
+				       spec->gpio_data, 0);
 
 	for (; seq->nid; seq++)
 		cs8409_vendor_coef_set(codec, seq->cir, seq->coeff);
@@ -1442,14 +1437,9 @@ static void dolphin_hw_init(struct hda_codec *codec)
 	struct sub_codec *cs42l42;
 	int i;
 
-	if (spec->gpio_mask) {
-		snd_hda_codec_write(codec, CS8409_PIN_AFG, 0, AC_VERB_SET_GPIO_MASK,
-				    spec->gpio_mask);
-		snd_hda_codec_write(codec, CS8409_PIN_AFG, 0, AC_VERB_SET_GPIO_DIRECTION,
-				    spec->gpio_dir);
-		snd_hda_codec_write(codec, CS8409_PIN_AFG, 0, AC_VERB_SET_GPIO_DATA,
-				    spec->gpio_data);
-	}
+	if (spec->gpio_mask)
+		snd_hda_codec_set_gpio(codec, spec->gpio_mask, spec->gpio_dir,
+				       spec->gpio_data, 0);
 
 	for (; seq->nid; seq++)
 		cs8409_vendor_coef_set(codec, seq->cir, seq->coeff);
-- 
2.53.0

