Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C162DA743
	for <linux-sound@vger.kernel.org>; Wed,  9 Jul 2025 16:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752077550; cv=none; b=FtWqH1d2kPwTJTBG6wxcp/1jMGerN6+f4175/HJn6BYqjccDvIAsE2ISgkJ8hswms9O8DedekcvC4y6Qtnh60zB5dTc50mJigpGqx+PDYHqqRWg/VqMBxIIfqj6u+dHFT0HyCicDRKUiSOvN2fHdY4H9EtsX7rVweJnXqJR6mGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752077550; c=relaxed/simple;
	bh=uHCOjtbQRgW6MoBhswoMrfg/u+cBSqj96Y1fRGpyvoc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tQEqjq65fYVNZBkHmNpDpfWmRmAN8v7n1+ymURX953g5NW0iHHfhI9AGTEHvfTojgjOOU4azcFmdIPnOm9pWJoW5Q1OXAKghG0GP9OaXszCSecSHB4/5LM31KeG64UNMj9EhCHVLv2k7I6mkEHP+VgKo8VuOIVk5duhLl2e20tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CJYyaO+y; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6RXZXTH3; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CJYyaO+y; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6RXZXTH3; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CJYyaO+y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6RXZXTH3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CJYyaO+y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6RXZXTH3"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5D41521180;
	Wed,  9 Jul 2025 16:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752077094; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cWQEeP8rjSxgAMhVpWVlUdIiOg5XKDFV0kPGSayIoNc=;
	b=CJYyaO+ytDHk/vGmIVn0fA0gTSr5NXd18crexWSZA0gzswm5Z2otvLau7MoaS8BVYr3DRJ
	JMr8q9y9f6zqrhTWzn0pmQWPVClxen9t9QcJ3PaWbecRfBiknp+rpuP2mPvWVqZrmvXSO4
	9iMtHgpuGYxrS2oPY1YKhI6dzVvQiZA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752077094;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cWQEeP8rjSxgAMhVpWVlUdIiOg5XKDFV0kPGSayIoNc=;
	b=6RXZXTH3Hu4mBetry1gzlx0kbSZP8NxYQ7WDttM8onsFSkk0bP3nlYAcWLNwor6FN/Fu3q
	Ye7qO1LEab+4wJDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=CJYyaO+y;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=6RXZXTH3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752077094; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cWQEeP8rjSxgAMhVpWVlUdIiOg5XKDFV0kPGSayIoNc=;
	b=CJYyaO+ytDHk/vGmIVn0fA0gTSr5NXd18crexWSZA0gzswm5Z2otvLau7MoaS8BVYr3DRJ
	JMr8q9y9f6zqrhTWzn0pmQWPVClxen9t9QcJ3PaWbecRfBiknp+rpuP2mPvWVqZrmvXSO4
	9iMtHgpuGYxrS2oPY1YKhI6dzVvQiZA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752077094;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cWQEeP8rjSxgAMhVpWVlUdIiOg5XKDFV0kPGSayIoNc=;
	b=6RXZXTH3Hu4mBetry1gzlx0kbSZP8NxYQ7WDttM8onsFSkk0bP3nlYAcWLNwor6FN/Fu3q
	Ye7qO1LEab+4wJDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 181C3136DC;
	Wed,  9 Jul 2025 16:04:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gMO3BCaTbmhDEAAAD6G6ig
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
Subject: [PATCH 14/27] ALSA: hda/ca0110: Rewrite to new probe method
Date: Wed,  9 Jul 2025 18:04:17 +0200
Message-ID: <20250709160434.1859-15-tiwai@suse.de>
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
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_RATELIMIT(0.00)[to_ip_from(RL53w3f6h5bdz1qypc3i64rty7)];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 5D41521180
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Convert the CA0110 codec driver to use the new hda_codec_ops probe.
No functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/ca0110.c | 35 +++++++++++++++++------------------
 1 file changed, 17 insertions(+), 18 deletions(-)

diff --git a/sound/hda/codecs/ca0110.c b/sound/hda/codecs/ca0110.c
index 0353544435b9..c75a9ff9460d 100644
--- a/sound/hda/codecs/ca0110.c
+++ b/sound/hda/codecs/ca0110.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * HD audio interface patch for Creative X-Fi CA0110-IBG chip
+ * HD audio codec driver for Creative X-Fi CA0110-IBG chip
  *
  * Copyright (c) 2008 Takashi Iwai <tiwai@suse.de>
  */
@@ -15,15 +15,6 @@
 #include "hda_jack.h"
 #include "generic.h"
 
-
-static const struct hda_codec_ops ca0110_patch_ops = {
-	.build_controls = snd_hda_gen_build_controls,
-	.build_pcms = snd_hda_gen_build_pcms,
-	.init = snd_hda_gen_init,
-	.free = snd_hda_gen_free,
-	.unsol_event = snd_hda_jack_unsol_event,
-};
-
 static int ca0110_parse_auto_config(struct hda_codec *codec)
 {
 	struct hda_gen_spec *spec = codec->spec;
@@ -39,8 +30,7 @@ static int ca0110_parse_auto_config(struct hda_codec *codec)
 	return 0;
 }
 
-
-static int patch_ca0110(struct hda_codec *codec)
+static int ca0110_probe(struct hda_codec *codec, const struct hda_device_id *id)
 {
 	struct hda_gen_spec *spec;
 	int err;
@@ -50,7 +40,6 @@ static int patch_ca0110(struct hda_codec *codec)
 		return -ENOMEM;
 	snd_hda_gen_spec_init(spec);
 	codec->spec = spec;
-	codec->patch_ops = ca0110_patch_ops;
 
 	spec->multi_cap_vol = 1;
 	codec->bus->core.needs_damn_long_delay = 1;
@@ -62,18 +51,27 @@ static int patch_ca0110(struct hda_codec *codec)
 	return 0;
 
  error:
-	snd_hda_gen_free(codec);
+	snd_hda_gen_remove(codec);
 	return err;
 }
 
 
+static const struct hda_codec_ops ca0110_codec_ops = {
+	.probe = ca0110_probe,
+	.remove = snd_hda_gen_remove,
+	.build_controls = snd_hda_gen_build_controls,
+	.build_pcms = snd_hda_gen_build_pcms,
+	.init = snd_hda_gen_init,
+	.unsol_event = snd_hda_jack_unsol_event,
+};
+
 /*
- * patch entries
+ * driver entries
  */
 static const struct hda_device_id snd_hda_id_ca0110[] = {
-	HDA_CODEC_ENTRY(0x1102000a, "CA0110-IBG", patch_ca0110),
-	HDA_CODEC_ENTRY(0x1102000b, "CA0110-IBG", patch_ca0110),
-	HDA_CODEC_ENTRY(0x1102000d, "SB0880 X-Fi", patch_ca0110),
+	HDA_CODEC_ID(0x1102000a, "CA0110-IBG"),
+	HDA_CODEC_ID(0x1102000b, "CA0110-IBG"),
+	HDA_CODEC_ID(0x1102000d, "SB0880 X-Fi"),
 	{} /* terminator */
 };
 MODULE_DEVICE_TABLE(hdaudio, snd_hda_id_ca0110);
@@ -83,6 +81,7 @@ MODULE_DESCRIPTION("Creative CA0110-IBG HD-audio codec");
 
 static struct hda_codec_driver ca0110_driver = {
 	.id = snd_hda_id_ca0110,
+	.ops = &ca0110_codec_ops,
 };
 
 module_hda_codec_driver(ca0110_driver);
-- 
2.50.0

