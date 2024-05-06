Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A5515664A
	for <linux-sound@vger.kernel.org>; Mon,  6 May 2024 16:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715012036; cv=none; b=FfVbOIVZoK8P3kKS5+w14x029qZk4/SNXiePWH7YhNq5+vL7zIU0u1pk1LfDvtf44TL8w7bwt9pn5c/TpaDWhqqmo/d/op5aHoWjKzKioMgInFrJpldWRszGrwQ5nsvZoBZVCwRPsmadGLcBeUd4ZCEE4RloYAaYxpLVmroAUX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715012036; c=relaxed/simple;
	bh=bMUfQomdSV1OXpHR/lG3ngxhDfWm801K0HGxF3thVac=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dCXbonlhtniZD7Z4eWAZ7DZZOOX0XAXhRLE1BrExMqCvNPMOkBuTv6Gru8axyKZJk9R1T6Jsxm2XVK0d5xz9werfb2KSTHqBwqNEIRUaWlmIuKRpNgdsfyS1iSOd1xgWRcE7Sbb4QiQZmV4l9l1rCYV3LvVn+yGmQZX173TpCkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=aIohjfVG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wVIvaDVb; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=aIohjfVG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wVIvaDVb; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aIohjfVG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wVIvaDVb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aIohjfVG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wVIvaDVb"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D9C081F7A7;
	Mon,  6 May 2024 16:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715012030; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xTlCPr+UKpUyJhdtRIoU/J0tJTzNnnbT6NG75eNN6pM=;
	b=aIohjfVG2hJZW1lAcKF44udmAZ9sYJCEaOAC4u32DJfYueAmsDpm/woPCUNcL49ITQJj2o
	xeBbpIzMjhU73bwJLGLF3n/1igJzskHP43Y9kzh6vm1Wy01OujXHXl4F6CkdPjgT6SLd7a
	ywPn3BFJOqTa32btyZtfZpd2QypTHjc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715012030;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xTlCPr+UKpUyJhdtRIoU/J0tJTzNnnbT6NG75eNN6pM=;
	b=wVIvaDVbkk80WaYdOze3wcMB5DTrJDyjMmyvI42MubouiWHdKS3L7m45tYk1MfK34v59QF
	dMc2Gp7tikmnqIDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=aIohjfVG;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=wVIvaDVb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715012030; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xTlCPr+UKpUyJhdtRIoU/J0tJTzNnnbT6NG75eNN6pM=;
	b=aIohjfVG2hJZW1lAcKF44udmAZ9sYJCEaOAC4u32DJfYueAmsDpm/woPCUNcL49ITQJj2o
	xeBbpIzMjhU73bwJLGLF3n/1igJzskHP43Y9kzh6vm1Wy01OujXHXl4F6CkdPjgT6SLd7a
	ywPn3BFJOqTa32btyZtfZpd2QypTHjc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715012030;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xTlCPr+UKpUyJhdtRIoU/J0tJTzNnnbT6NG75eNN6pM=;
	b=wVIvaDVbkk80WaYdOze3wcMB5DTrJDyjMmyvI42MubouiWHdKS3L7m45tYk1MfK34v59QF
	dMc2Gp7tikmnqIDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C10FC13A31;
	Mon,  6 May 2024 16:13:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iPzULb4BOWbwFQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 06 May 2024 16:13:50 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 11/12] ALSA: hda: sigmantel: Reduce CONFIG_PM dependencies
Date: Mon,  6 May 2024 18:13:54 +0200
Message-ID: <20240506161359.6960-12-tiwai@suse.de>
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
X-Spamd-Result: default: False [-0.43 / 50.00];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	BAYES_HAM(-0.42)[78.25%];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -0.43
X-Spamd-Bar: /
X-Rspamd-Queue-Id: D9C081F7A7
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

CONFIG_PM dependencies got reduced in HD-audio codec core driver, and
now it's time to reduce in HD-audio sigmatel codec driver, too.

Simply drop CONFIG_PM ifdefs.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_sigmatel.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/sound/pci/hda/patch_sigmatel.c b/sound/pci/hda/patch_sigmatel.c
index 61258b0aac8d..ae1a34c68c61 100644
--- a/sound/pci/hda/patch_sigmatel.c
+++ b/sound/pci/hda/patch_sigmatel.c
@@ -2154,10 +2154,8 @@ static void stac92hd83xxx_fixup_hp_mic_led(struct hda_codec *codec,
 
 	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
 		spec->mic_mute_led_gpio = 0x08; /* GPIO3 */
-#ifdef CONFIG_PM
 		/* resetting controller clears GPIO, so we need to keep on */
 		codec->core.power_caps &= ~AC_PWRST_CLKSTOP;
-#endif
 	}
 }
 
@@ -4442,7 +4440,6 @@ static void stac927x_proc_hook(struct snd_info_buffer *buffer,
 #define stac927x_proc_hook	NULL
 #endif
 
-#ifdef CONFIG_PM
 static int stac_suspend(struct hda_codec *codec)
 {
 	struct sigmatel_spec *spec = codec->spec;
@@ -4456,9 +4453,6 @@ static int stac_suspend(struct hda_codec *codec)
 
 	return 0;
 }
-#else
-#define stac_suspend		NULL
-#endif /* CONFIG_PM */
 
 static const struct hda_codec_ops stac_patch_ops = {
 	.build_controls = snd_hda_gen_build_controls,
@@ -4466,9 +4460,7 @@ static const struct hda_codec_ops stac_patch_ops = {
 	.init = stac_init,
 	.free = stac_free,
 	.unsol_event = snd_hda_jack_unsol_event,
-#ifdef CONFIG_PM
 	.suspend = stac_suspend,
-#endif
 };
 
 static int alloc_stac_spec(struct hda_codec *codec)
-- 
2.43.0

