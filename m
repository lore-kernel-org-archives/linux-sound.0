Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52424448BBE
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 16:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785428196; cv=none; b=GgPFiVmOYLkXb9hYaxldySIV0J7fhX8CzX8wuqYxa/ERVDwHrMOC74Tt8KTI7CIqsXIiJvNhQ4t4N7bR+V0o3qa6p4imEZIra9rjLkbnFevI43nnuNO04na76A0p0HPH9JoK++kEghwRQ3SVbfxRcWloHOqTbAPK82joil/RsbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785428196; c=relaxed/simple;
	bh=lY6DTaIKbatQDUrd56+WkWtJuGNuUeAkSx9xOMurkcg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CwasrQ3P8lvEbjMh220CMDbXUxEmJisWZzilBmEaQygb6Ddx+f8YJDlpcGM5em7sd+bNQwcwb+IsEwenoCbR9i1wnjroZvCPQJXK3Ww8uhFxVDmVxnjv1zNdn8ULaDjCpVJKqXJlw0Ox0IN9Su81obK+RwUfe9c+0DKZNikmI78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=euXnmcLx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GPLo0Ngs; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kISk7iIv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=luHG/uL1; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="euXnmcLx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GPLo0Ngs";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kISk7iIv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="luHG/uL1"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5E73F7D40F;
	Thu, 30 Jul 2026 16:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785428174; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=hFe8Nzv3vbRtemfS7c3xeg27cNNLJbkt/672+BPs5FU=;
	b=euXnmcLxgQOhpB/j8MDvljajJ6/SWLUAhgbvL1pJYcZl3L1c65T8p9X8ad4wul0CD3/hus
	vQOwrBd7MHlubLcG0L1PTIQsr98ncDLEUGiAZXXsqcJGi5POL99KrVgjqeIAFFXgyXGebq
	iSsROgKmwvDcnmBsQYfo4xyqFMsnHXQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785428174;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=hFe8Nzv3vbRtemfS7c3xeg27cNNLJbkt/672+BPs5FU=;
	b=GPLo0NgsgtGho902zGsckIWlMuYi/cZDbN9sJoJuVF41e9SGXVj179hL0+8nPfLAy9s5p2
	iGAVj4U/3jy6cPAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785428170; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=hFe8Nzv3vbRtemfS7c3xeg27cNNLJbkt/672+BPs5FU=;
	b=kISk7iIvgKHlfu4rhRtrbB3s0c1M8jGHT9fQmWggCRl1xP5iH8V4w9inWACBFrQZXEXYM5
	sv70rMCOt5nqQpfFM/ZH8LvDkS/FCdCfpEFHsqzklodX2x8/b/SZPpgo+2pruexn/hHMcD
	7dYfUFOKvvZthKioXEWMqHfF86aorUg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785428170;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=hFe8Nzv3vbRtemfS7c3xeg27cNNLJbkt/672+BPs5FU=;
	b=luHG/uL14ID3+Uur0vAMxLIGoDndDEIf1I5YBWpKsIb8ggKUfLLWobBzpvbVLTpbobfpXs
	dZTVhS7jpi1E8yBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 33F7C779CC;
	Thu, 30 Jul 2026 16:16:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HMp2C8p4a2pbCwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 30 Jul 2026 16:16:10 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Ian Bridges <icb@fastmail.org>
Subject: [PATCH] ALSA: hda: Add hda_append_suffix() local helper
Date: Thu, 30 Jul 2026 18:14:03 +0200
Message-ID: <20260730161518.641254-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

As strlcat() shall be deprecated in future, provide an alternative
just for a simple purpose -- append a suffix string to the given
string buffer -- and use it at appropriate places.  The code isn't
really efficient, but we don't ask for speed here, so let it be.

Link: https://lore.kernel.org/amolHJpiluNmBsDU@dev
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/generic.c   | 4 ++--
 sound/hda/common/hda_local.h | 7 +++++++
 sound/hda/common/jack.c      | 2 +-
 3 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/sound/hda/codecs/generic.c b/sound/hda/codecs/generic.c
index a4623dd67f81..6120f797b45a 100644
--- a/sound/hda/codecs/generic.c
+++ b/sound/hda/codecs/generic.c
@@ -2701,7 +2701,7 @@ static void get_jack_mode_name(struct hda_codec *codec, hda_nid_t pin,
 	struct hda_gen_spec *spec = codec->spec;
 
 	snd_hda_get_pin_label(codec, pin, &spec->autocfg, name, name_len);
-	strlcat(name, " Jack Mode", name_len);
+	hda_append_suffix(name, " Jack Mode", name_len);
 }
 
 static int get_out_jack_num_items(struct hda_codec *codec, hda_nid_t pin)
@@ -5678,7 +5678,7 @@ static void fill_pcm_stream_name(char *str, size_t len, const char *sfx,
 			break;
 		}
 	}
-	strlcat(str, sfx, len);
+	hda_append_suffix(str, sfx, len);
 }
 
 /* copy PCM stream info from @default_str, and override non-NULL entries
diff --git a/sound/hda/common/hda_local.h b/sound/hda/common/hda_local.h
index 98b2c4acebc2..947a3152fdb5 100644
--- a/sound/hda/common/hda_local.h
+++ b/sound/hda/common/hda_local.h
@@ -723,4 +723,11 @@ void snd_hda_codec_display_power(struct hda_codec *codec, bool enable);
 #define codec_dbg(codec, fmt, args...) \
 	dev_dbg(hda_codec_dev(codec), fmt, ##args)
 
+/* append a suffix string safely; equivalent with strlcat() */
+static inline void hda_append_suffix(char *str, const char *suffix, size_t size)
+{
+	size_t len = strnlen(str, size);
+	strscpy(str + len, suffix, size - len);
+}
+
 #endif /* __SOUND_HDA_LOCAL_H */
diff --git a/sound/hda/common/jack.c b/sound/hda/common/jack.c
index c4338f03a54d..1d6b0f0e6f27 100644
--- a/sound/hda/common/jack.c
+++ b/sound/hda/common/jack.c
@@ -615,7 +615,7 @@ static int add_jack_kctl(struct hda_codec *codec, hda_nid_t nid,
 		snd_hda_get_pin_label(codec, nid, cfg, name, sizeof(name));
 	if (phantom_jack)
 		/* Example final name: "Internal Mic Phantom Jack" */
-		strncat(name, " Phantom", sizeof(name) - strlen(name) - 1);
+		hda_append_suffix(name, " Phantom", sizeof(name));
 	err = snd_hda_jack_add_kctl(codec, nid, name, phantom_jack, 0, NULL);
 	if (err < 0)
 		return err;
-- 
2.55.0

