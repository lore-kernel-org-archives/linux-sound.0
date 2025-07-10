Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA0E2D640A
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142308; cv=none; b=q7BfAQiALzZ4AWM5M4OVc3ZPO6lZTWTgmilOjLquxXe3+QBs40By5Uep0IRdzam7VnP1arZfVuRY/Pk96r7y42whABJn3sn/KOkC4HgiHYbos5XR+Ck5BfSyrsYbLFUP4RzJM6bHsyp7FoO9vEg9IPJPvRGZb0q52Wcl1DUnTxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142308; c=relaxed/simple;
	bh=MYaDKhvuLyTLR9p13Cs/FlQMabrTGKrcj5FsrFoy/+g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eTsHStGk1Zl5RnsmVWe365iJpaOM5jQYDjB4EzgnyscCHZeSAIl64x4lur4fTMeOpiy7FXEo2S9lrGadE3o2omTHAC3PId1PMVJzqQ/vtvanZsafsKGSL7rfzSFup5YYaQbmnoDT1cUiMiAHBTgali9IPvYv0XD55tCyRkMGZBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=y4f+N3Dp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GbwULFjk; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=y4f+N3Dp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GbwULFjk; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="y4f+N3Dp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GbwULFjk";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="y4f+N3Dp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GbwULFjk"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 17F4D211A8;
	Thu, 10 Jul 2025 10:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142065; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kTQgWiyZ9zZsaecNumF0PnkBmLYmoO9am4oAJ+xkuLs=;
	b=y4f+N3DpiJ8uNkH7jpwDEoiNIPZ1gpT/Kxv053GDpN5pEKc0mnV7nQb1u9NXHAGuRyUxPt
	cfYNqWXQkWLYFKwWVbEfhJ9ojoFbvDO/SA1LLG0U65WsXR443Z3vZZK68BILoOtVjCE7p+
	4vx87DNGN5gBOk7xoW4H/HULADZHo3U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142065;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kTQgWiyZ9zZsaecNumF0PnkBmLYmoO9am4oAJ+xkuLs=;
	b=GbwULFjkb12clPmqXypCUe4Wlpfsc7TxEJa/cj7CKkdiGJMKHQVPU2UsFzZJHPTWJ4StFX
	5ehjdZh8wbdjIpCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142065; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kTQgWiyZ9zZsaecNumF0PnkBmLYmoO9am4oAJ+xkuLs=;
	b=y4f+N3DpiJ8uNkH7jpwDEoiNIPZ1gpT/Kxv053GDpN5pEKc0mnV7nQb1u9NXHAGuRyUxPt
	cfYNqWXQkWLYFKwWVbEfhJ9ojoFbvDO/SA1LLG0U65WsXR443Z3vZZK68BILoOtVjCE7p+
	4vx87DNGN5gBOk7xoW4H/HULADZHo3U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142065;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kTQgWiyZ9zZsaecNumF0PnkBmLYmoO9am4oAJ+xkuLs=;
	b=GbwULFjkb12clPmqXypCUe4Wlpfsc7TxEJa/cj7CKkdiGJMKHQVPU2UsFzZJHPTWJ4StFX
	5ehjdZh8wbdjIpCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F040B136DC;
	Thu, 10 Jul 2025 10:07:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +E+DOfCQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:44 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 062/103] ALSA: ens1370: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:06:44 +0200
Message-ID: <20250710100727.22653-63-tiwai@suse.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250710100727.22653-1-tiwai@suse.de>
References: <20250710100727.22653-1-tiwai@suse.de>
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
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLsqo7dymd5dgmoaprf5rep8is)];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

Use a safer function strscpy() instead of strcpy() for copying to
arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ens1370.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/pci/ens1370.c b/sound/pci/ens1370.c
index 1e6adf1ae304..82e10ecb9196 100644
--- a/sound/pci/ens1370.c
+++ b/sound/pci/ens1370.c
@@ -1244,7 +1244,7 @@ static int snd_ensoniq_pcm(struct ensoniq *ensoniq, int device)
 
 	pcm->private_data = ensoniq;
 	pcm->info_flags = 0;
-	strcpy(pcm->name, CHIP_NAME " DAC2/ADC");
+	strscpy(pcm->name, CHIP_NAME " DAC2/ADC");
 	ensoniq->pcm1 = pcm;
 
 	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
@@ -1276,7 +1276,7 @@ static int snd_ensoniq_pcm2(struct ensoniq *ensoniq, int device)
 #endif
 	pcm->private_data = ensoniq;
 	pcm->info_flags = 0;
-	strcpy(pcm->name, CHIP_NAME " DAC1");
+	strscpy(pcm->name, CHIP_NAME " DAC1");
 	ensoniq->pcm2 = pcm;
 
 	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
@@ -2250,7 +2250,7 @@ static int snd_ensoniq_midi(struct ensoniq *ensoniq, int device)
 	err = snd_rawmidi_new(ensoniq->card, "ES1370/1", device, 1, 1, &rmidi);
 	if (err < 0)
 		return err;
-	strcpy(rmidi->name, CHIP_NAME);
+	strscpy(rmidi->name, CHIP_NAME);
 	snd_rawmidi_set_ops(rmidi, SNDRV_RAWMIDI_STREAM_OUTPUT, &snd_ensoniq_midi_output);
 	snd_rawmidi_set_ops(rmidi, SNDRV_RAWMIDI_STREAM_INPUT, &snd_ensoniq_midi_input);
 	rmidi->info_flags |= SNDRV_RAWMIDI_INFO_OUTPUT | SNDRV_RAWMIDI_INFO_INPUT |
@@ -2346,9 +2346,9 @@ static int __snd_audiopci_probe(struct pci_dev *pci,
 
 	snd_ensoniq_create_gameport(ensoniq, dev);
 
-	strcpy(card->driver, DRIVER_NAME);
+	strscpy(card->driver, DRIVER_NAME);
 
-	strcpy(card->shortname, "Ensoniq AudioPCI");
+	strscpy(card->shortname, "Ensoniq AudioPCI");
 	sprintf(card->longname, "%s %s at 0x%lx, irq %i",
 		card->shortname,
 		card->driver,
-- 
2.50.0

