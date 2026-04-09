Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFF53B4E9C
	for <linux-sound@vger.kernel.org>; Thu,  9 Apr 2026 09:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775727525; cv=none; b=oC6zim1UktW+7l2sqfF2YGINiy2VSb4HQrSb+Iqy+RmDZQHsrdbxdWJTEZBRZQhaKORbUU/E3WSOrIjCUsyBjvKOj6JUJTFrfCVN8hqQztcrKOBVnRF942xdYPnihPUI+DQDpiBVTsSe+FHQBn8n5skYlhYSato5YLEY/ktijfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775727525; c=relaxed/simple;
	bh=b0iGTH4ptb+U7MfD5MFI3mSRmvUS+Uk1D4j7xcoJMgI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DXdfZWQyAov2LR5q72j27ZwxkG4jziOpia0LyyjFaHwgJgL3VirOMFYS1imelnym1/s1YnNRjYQo7wNHyBeCs7nnYu/hQRQsJy4i4JUpqRLgzqhRSUMIVgVjVr4wHTTJIGvvKO5ba5XW9qO8/tvnZsgXUPEVbjzDqIAqIxxpZR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0kmTR99J; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7LAaFhEn; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0kmTR99J; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7LAaFhEn; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0kmTR99J";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7LAaFhEn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0kmTR99J";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7LAaFhEn"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 28FE24EE85;
	Thu,  9 Apr 2026 09:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775727510; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1ar+pnfrVNoWl056IaXA6QeOboe0J6/XWiKYT4hoEsU=;
	b=0kmTR99JO8f4a43ioheMuGPe+qlYtnRQMadyiYk5KwF6sEf6N1oWSjIBMaBH+2g5OtxpaM
	e+mOF21rBkcPIL1SFgjIVv8K0CmRmILbRnCW5enzC3vwd4TbfIvx23g2wUZ6JcUoNzp4vY
	etdIH3PpAFacVMcwC+Z5wfqc9P4L07g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775727510;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1ar+pnfrVNoWl056IaXA6QeOboe0J6/XWiKYT4hoEsU=;
	b=7LAaFhEnuTGv3VdAxprOO9MANvrq7Hs/Eejix6b4APiAp0R+B3lF5r6x+zPFl9vpUDj0dg
	fFyWehJXA4ensQDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775727510; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1ar+pnfrVNoWl056IaXA6QeOboe0J6/XWiKYT4hoEsU=;
	b=0kmTR99JO8f4a43ioheMuGPe+qlYtnRQMadyiYk5KwF6sEf6N1oWSjIBMaBH+2g5OtxpaM
	e+mOF21rBkcPIL1SFgjIVv8K0CmRmILbRnCW5enzC3vwd4TbfIvx23g2wUZ6JcUoNzp4vY
	etdIH3PpAFacVMcwC+Z5wfqc9P4L07g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775727510;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1ar+pnfrVNoWl056IaXA6QeOboe0J6/XWiKYT4hoEsU=;
	b=7LAaFhEnuTGv3VdAxprOO9MANvrq7Hs/Eejix6b4APiAp0R+B3lF5r6x+zPFl9vpUDj0dg
	fFyWehJXA4ensQDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0E9444A0B4;
	Thu,  9 Apr 2026 09:38:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ABJuApZz12mdWgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 09 Apr 2026 09:38:30 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 01/10] ALSA: hda: Add sync version of snd_hda_codec_write()
Date: Thu,  9 Apr 2026 11:38:14 +0200
Message-ID: <20260409093826.1317626-2-tiwai@suse.de>
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

We used snd_hda_codec_read() for the verb write when a synchronization
is needed after the write, e.g. for the power state toggle or such
cases.  It works in principle, but it looks rather confusing and too
hackish.

For improving the code readability, introduce a new helper function,
snd_hda_codec_write_sync(), which is another variant of
snd_hda_codec_write(), and replace the existing snd_hda_codec_read()
calls with this one.

No behavior change but just the code refactoring.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/hda_codec.h          | 11 +++++++++++
 sound/hda/codecs/generic.c         |  2 +-
 sound/hda/codecs/hdmi/intelhdmi.c  |  2 +-
 sound/hda/codecs/realtek/realtek.c |  3 +--
 sound/hda/codecs/sigmatel.c        |  4 ++--
 sound/hda/common/codec.c           | 11 +++++------
 6 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/include/sound/hda_codec.h b/include/sound/hda_codec.h
index 5d9f0ef228af..292d6024388b 100644
--- a/include/sound/hda_codec.h
+++ b/include/sound/hda_codec.h
@@ -336,6 +336,17 @@ snd_hda_codec_write(struct hda_codec *codec, hda_nid_t nid, int flags,
 	return snd_hdac_codec_write(&codec->core, nid, flags, verb, parm);
 }
 
+/* sync after write */
+static inline int
+snd_hda_codec_write_sync(struct hda_codec *codec, hda_nid_t nid, int flags,
+			 unsigned int verb, unsigned int parm)
+{
+	/* use snd_hda_codec_read() for writing;
+	 * the returned value is usually discarded
+	 */
+	return snd_hdac_codec_read(&codec->core, nid, flags, verb, parm);
+}
+
 #define snd_hda_param_read(codec, nid, param) \
 	snd_hdac_read_parm(&(codec)->core, nid, param)
 #define snd_hda_get_sub_nodes(codec, nid, start_nid) \
diff --git a/sound/hda/codecs/generic.c b/sound/hda/codecs/generic.c
index 092428ada29d..660a9f2c0ded 100644
--- a/sound/hda/codecs/generic.c
+++ b/sound/hda/codecs/generic.c
@@ -863,7 +863,7 @@ static void sync_power_state_change(struct hda_codec *codec, hda_nid_t nid)
 {
 	if (nid) {
 		msleep(10);
-		snd_hda_codec_read(codec, nid, 0, AC_VERB_GET_POWER_STATE, 0);
+		snd_hda_codec_write_sync(codec, nid, 0, AC_VERB_GET_POWER_STATE, 0);
 	}
 }
 
diff --git a/sound/hda/codecs/hdmi/intelhdmi.c b/sound/hda/codecs/hdmi/intelhdmi.c
index 9460c8db39a9..6a7882544ab7 100644
--- a/sound/hda/codecs/hdmi/intelhdmi.c
+++ b/sound/hda/codecs/hdmi/intelhdmi.c
@@ -85,7 +85,7 @@ static void haswell_set_power_state(struct hda_codec *codec, hda_nid_t fg,
 		}
 	}
 
-	snd_hda_codec_read(codec, fg, 0, AC_VERB_SET_POWER_STATE, power_state);
+	snd_hda_codec_write_sync(codec, fg, 0, AC_VERB_SET_POWER_STATE, power_state);
 	snd_hda_codec_set_power_to_all(codec, fg, power_state);
 }
 
diff --git a/sound/hda/codecs/realtek/realtek.c b/sound/hda/codecs/realtek/realtek.c
index b240f13b0438..39a1ead3b743 100644
--- a/sound/hda/codecs/realtek/realtek.c
+++ b/sound/hda/codecs/realtek/realtek.c
@@ -411,9 +411,8 @@ void alc_headset_mic_no_shutup(struct hda_codec *codec)
 		return;
 
 	snd_array_for_each(&codec->init_pins, i, pin) {
-		/* use read here for syncing after issuing each verb */
 		if (pin->nid != mic_pin)
-			snd_hda_codec_read(codec, pin->nid, 0,
+			snd_hda_codec_write_sync(codec, pin->nid, 0,
 					AC_VERB_SET_PIN_WIDGET_CONTROL, 0);
 	}
 
diff --git a/sound/hda/codecs/sigmatel.c b/sound/hda/codecs/sigmatel.c
index acbbc7c3508b..4ff80a65168f 100644
--- a/sound/hda/codecs/sigmatel.c
+++ b/sound/hda/codecs/sigmatel.c
@@ -311,12 +311,12 @@ static void stac_gpio_set(struct hda_codec *codec, unsigned int mask,
 
 	snd_hda_codec_write(codec, fg, 0,
 			    AC_VERB_SET_GPIO_MASK, gpiomask);
-	snd_hda_codec_read(codec, fg, 0,
+	snd_hda_codec_write_sync(codec, fg, 0,
 			   AC_VERB_SET_GPIO_DIRECTION, gpiodir); /* sync */
 
 	msleep(1);
 
-	snd_hda_codec_read(codec, fg, 0,
+	snd_hda_codec_write_sync(codec, fg, 0,
 			   AC_VERB_SET_GPIO_DATA, gpiostate); /* sync */
 }
 
diff --git a/sound/hda/common/codec.c b/sound/hda/common/codec.c
index 5123df32ad89..3ac4bf6005d6 100644
--- a/sound/hda/common/codec.c
+++ b/sound/hda/common/codec.c
@@ -606,9 +606,8 @@ void snd_hda_shutup_pins(struct hda_codec *codec)
 	if (codec->bus->shutdown)
 		return;
 	snd_array_for_each(&codec->init_pins, i, pin) {
-		/* use read here for syncing after issuing each verb */
-		snd_hda_codec_read(codec, pin->nid, 0,
-				   AC_VERB_SET_PIN_WIDGET_CONTROL, 0);
+		snd_hda_codec_write_sync(codec, pin->nid, 0,
+					 AC_VERB_SET_PIN_WIDGET_CONTROL, 0);
 	}
 	codec->pins_shutup = 1;
 }
@@ -2794,9 +2793,9 @@ static unsigned int hda_set_power_state(struct hda_codec *codec,
 			if (codec->power_filter)
 				state = codec->power_filter(codec, fg, state);
 			if (state == power_state || power_state != AC_PWRST_D3)
-				snd_hda_codec_read(codec, fg, flags,
-						   AC_VERB_SET_POWER_STATE,
-						   state);
+				snd_hda_codec_write_sync(codec, fg, flags,
+							 AC_VERB_SET_POWER_STATE,
+							 state);
 			snd_hda_codec_set_power_to_all(codec, fg, power_state);
 		}
 		state = snd_hda_sync_power_state(codec, fg, power_state);
-- 
2.53.0

