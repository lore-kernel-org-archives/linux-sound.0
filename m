Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE5F156643
	for <linux-sound@vger.kernel.org>; Mon,  6 May 2024 16:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715012036; cv=none; b=S9r+ZRxOhCmA7MvtPnNRUQIUcW9ihiN5ZkXH4To282Uupg5in5Oa/TZneZF4DCCSvlVS/a6C16tpL3cDxv05mWwc+yRgZmW8PVWHUwv/3rO13xbLdx4MkaTOdD8xrVo43cseRr0MpBpCpBdLR4TnseCHjMGy+LYWVLUqlJk+0PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715012036; c=relaxed/simple;
	bh=1vfSO4HUc253jOFMG2JUcyjYDmEzV3OGLZW9KJuw2vU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cV5hl0WTjLJNW1+iaRw7UrnFAnVi8DgV3t0ohIRwTqzsuR2epiQo5wf01FwG6AOATNlFiUO6RDpopNhDTXP70ieEG8v83RYtUVQakHBBw2KtTcuvKyq3O7A1WzSZcdQdwl+Ln4SG5aIifVftQyZaEKDoZtScEq4fUJadBFjvGA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mqaEBzNn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Hm/0s+Eb; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mqaEBzNn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Hm/0s+Eb; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mqaEBzNn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Hm/0s+Eb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mqaEBzNn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Hm/0s+Eb"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BB5D91F7A5;
	Mon,  6 May 2024 16:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715012030; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bNIazqfjwaZcu4LMvun5yJR6mHT4Fge2aRxt+zexqyE=;
	b=mqaEBzNniklciG+DMjassXAeoTIf8vKeNwpDsNHbDoXS2usclSxwOxAJD0ZUZZnDhNLtOu
	spEto7LQ7Z1i7YBxo+qeD6Z9hxQffXv1GRMFiZdjf0Iyrhigrke5sgeCWjOrYm0pERe/iZ
	C7CnyzJfWHZzsfZetiVF/ogrypasjPk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715012030;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bNIazqfjwaZcu4LMvun5yJR6mHT4Fge2aRxt+zexqyE=;
	b=Hm/0s+EbsqTSGiTj4voBX2a9uOtXrrcu7RZ97oQ4zp3JW8WvJ9OGxGzldk688GlxfvwM4M
	QzFJxRvdTr5aTYCw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=mqaEBzNn;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="Hm/0s+Eb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715012030; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bNIazqfjwaZcu4LMvun5yJR6mHT4Fge2aRxt+zexqyE=;
	b=mqaEBzNniklciG+DMjassXAeoTIf8vKeNwpDsNHbDoXS2usclSxwOxAJD0ZUZZnDhNLtOu
	spEto7LQ7Z1i7YBxo+qeD6Z9hxQffXv1GRMFiZdjf0Iyrhigrke5sgeCWjOrYm0pERe/iZ
	C7CnyzJfWHZzsfZetiVF/ogrypasjPk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715012030;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bNIazqfjwaZcu4LMvun5yJR6mHT4Fge2aRxt+zexqyE=;
	b=Hm/0s+EbsqTSGiTj4voBX2a9uOtXrrcu7RZ97oQ4zp3JW8WvJ9OGxGzldk688GlxfvwM4M
	QzFJxRvdTr5aTYCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A076C1386E;
	Mon,  6 May 2024 16:13:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mDsBJr4BOWbwFQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 06 May 2024 16:13:50 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 10/12] ALSA: hda: realtek: Reduce CONFIG_PM dependencies
Date: Mon,  6 May 2024 18:13:53 +0200
Message-ID: <20240506161359.6960-11-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240506161359.6960-1-tiwai@suse.de>
References: <20240506161359.6960-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: BB5D91F7A5
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -3.01

CONFIG_PM dependencies got reduced in HD-audio codec core driver, and
now it's time to reduce in HD-audio realtek codec driver, too.

Simply drop CONFIG_PM ifdefs.  A superfluous __maybe_unused attribute
was dropped as well.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_realtek.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index b29739bd330b..944f36f94a5a 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -109,9 +109,7 @@ struct alc_spec {
 
 	/* hooks */
 	void (*init_hook)(struct hda_codec *codec);
-#ifdef CONFIG_PM
 	void (*power_hook)(struct hda_codec *codec);
-#endif
 	void (*shutup)(struct hda_codec *codec);
 
 	int init_amp;
@@ -947,7 +945,6 @@ static int alc_init(struct hda_codec *codec)
 
 #define alc_free	snd_hda_gen_free
 
-#ifdef CONFIG_PM
 static inline void alc_shutup(struct hda_codec *codec)
 {
 	struct alc_spec *spec = codec->spec;
@@ -986,7 +983,6 @@ static int alc_resume(struct hda_codec *codec)
 	hda_call_check_power_status(codec, 0x01);
 	return 0;
 }
-#endif
 
 /*
  */
@@ -996,11 +992,9 @@ static const struct hda_codec_ops alc_patch_ops = {
 	.init = alc_init,
 	.free = alc_free,
 	.unsol_event = snd_hda_jack_unsol_event,
-#ifdef CONFIG_PM
 	.resume = alc_resume,
 	.suspend = alc_suspend,
 	.check_power_status = snd_hda_gen_check_power_status,
-#endif
 };
 
 
@@ -4041,7 +4035,6 @@ static void alc5505_dsp_init(struct hda_codec *codec)
 #define alc5505_dsp_resume(codec)	alc5505_dsp_back_from_halt(codec)
 #endif
 
-#ifdef CONFIG_PM
 static int alc269_suspend(struct hda_codec *codec)
 {
 	struct alc_spec *spec = codec->spec;
@@ -4087,7 +4080,6 @@ static int alc269_resume(struct hda_codec *codec)
 
 	return 0;
 }
-#endif /* CONFIG_PM */
 
 static void alc269_fixup_pincfg_no_hp_to_lineout(struct hda_codec *codec,
 						 const struct hda_fixup *fix, int action)
@@ -7204,7 +7196,7 @@ static void alc287_alc1318_playback_pcm_hook(struct hda_pcm_stream *hinfo,
 	}
 }
 
-static void __maybe_unused alc287_s4_power_gpio3_default(struct hda_codec *codec)
+static void alc287_s4_power_gpio3_default(struct hda_codec *codec)
 {
 	if (is_s4_suspend(codec)) {
 		alc_write_coef_idx(codec, 0x10, 0x8806); /* Change MLK to GPIO3 */
@@ -7219,9 +7211,7 @@ static void alc287_fixup_lenovo_thinkpad_with_alc1318(struct hda_codec *codec,
 
 	if (action != HDA_FIXUP_ACT_PRE_PROBE)
 		return;
-#ifdef CONFIG_PM
 	spec->power_hook = alc287_s4_power_gpio3_default;
-#endif
 	spec->gen.pcm_playback_hook = alc287_alc1318_playback_pcm_hook;
 }
 
@@ -11287,10 +11277,8 @@ static int patch_alc269(struct hda_codec *codec)
 	codec->power_save_node = 0;
 	spec->en_3kpull_low = true;
 
-#ifdef CONFIG_PM
 	codec->patch_ops.suspend = alc269_suspend;
 	codec->patch_ops.resume = alc269_resume;
-#endif
 	spec->shutup = alc_default_shutup;
 	spec->init_hook = alc_default_init;
 
@@ -11588,9 +11576,7 @@ static int patch_alc861(struct hda_codec *codec)
 	if (has_cdefine_beep(codec))
 		spec->gen.beep_nid = 0x23;
 
-#ifdef CONFIG_PM
 	spec->power_hook = alc_power_eapd;
-#endif
 
 	alc_pre_init(codec);
 
-- 
2.43.0

