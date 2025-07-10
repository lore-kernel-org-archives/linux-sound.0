Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386182D5A0B
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142162; cv=none; b=P71WoR++vQzl5h/jRO0/km3jCOnXxeWZ3L1qBx3OgBsjx7/IXWvJ8k4K7Ln0HV3KD9EVz+hebc4Ve+ZYo/edFordYxvfNnY46bZZQu5MZRADZ669iopaWjjXyx9UC2j0WtfBTrbCM5sBzoNHVrnCsloKetlVEaYTBh4DNbFvKP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142162; c=relaxed/simple;
	bh=ebQWiD18rGLMI1x+W/Gg3aBZdZbTZZi52snHNA5bhiI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U6M7V8ZqWSXVT7Rqdzf7lsyoNEtumA6iUx79XuuqT2LSaAYhYlgaQg2ZqhclpmaTDyaOQAYorFopEMFoMQi2RmF2kpdfT/GPKdVbGHsN7F5z79p25wB1ht2OakQK8jNARdm+OKIw5hWqKzIGjmRUJDyEOt/EHEoPJXVeywOeOJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=a4qpnAnB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=l+03xbsq; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=a4qpnAnB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=l+03xbsq; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="a4qpnAnB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="l+03xbsq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="a4qpnAnB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="l+03xbsq"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BB1272118D;
	Thu, 10 Jul 2025 10:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142059; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mRwisASha8UsFNxiI3Pni85rVbtEvY41IY250KCH3VA=;
	b=a4qpnAnBaE99SqbYQadMii1YVVHIjCuW+AYdqVdkUy5vtmvesa98IKr4qt4WQ8o4ZdnlKQ
	WLkjMxZG+gGcpcfHPYdZv2YWwDxMBeLPfh+GKrtaMVQ3ZsV8fFGu5yAqfbU6FpGoWQfMQO
	FlipOLga/c4rQMCBnu3/iPe5J/cobiM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142059;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mRwisASha8UsFNxiI3Pni85rVbtEvY41IY250KCH3VA=;
	b=l+03xbsqSlmYE85e4RcjAtu3UrsgY629TBjvmdMvGEv0pOVIcLN36I5vv8OdCio3Z3n0ik
	pclxT1ibXRuLC/CQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=a4qpnAnB;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=l+03xbsq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142059; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mRwisASha8UsFNxiI3Pni85rVbtEvY41IY250KCH3VA=;
	b=a4qpnAnBaE99SqbYQadMii1YVVHIjCuW+AYdqVdkUy5vtmvesa98IKr4qt4WQ8o4ZdnlKQ
	WLkjMxZG+gGcpcfHPYdZv2YWwDxMBeLPfh+GKrtaMVQ3ZsV8fFGu5yAqfbU6FpGoWQfMQO
	FlipOLga/c4rQMCBnu3/iPe5J/cobiM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142059;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mRwisASha8UsFNxiI3Pni85rVbtEvY41IY250KCH3VA=;
	b=l+03xbsqSlmYE85e4RcjAtu3UrsgY629TBjvmdMvGEv0pOVIcLN36I5vv8OdCio3Z3n0ik
	pclxT1ibXRuLC/CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A0E4E136DC;
	Thu, 10 Jul 2025 10:07:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uM8fJuuQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:39 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 022/103] ALSA: ad1816a: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:06:04 +0200
Message-ID: <20250710100727.22653-23-tiwai@suse.de>
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
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim,suse.de:email];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLe1mc1hwayk397878n5a1j337)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: BB1272118D
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Use a safer function strscpy() instead of strcpy() for copying to
arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/ad1816a/ad1816a.c     | 4 ++--
 sound/isa/ad1816a/ad1816a_lib.c | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/isa/ad1816a/ad1816a.c b/sound/isa/ad1816a/ad1816a.c
index 5c9e2d41d900..8e84d4091f1e 100644
--- a/sound/isa/ad1816a/ad1816a.c
+++ b/sound/isa/ad1816a/ad1816a.c
@@ -143,8 +143,8 @@ static int snd_card_ad1816a_probe(int dev, struct pnp_card_link *pcard,
 	if (clockfreq[dev] >= 5000 && clockfreq[dev] <= 100000)
 		chip->clock_freq = clockfreq[dev];
 
-	strcpy(card->driver, "AD1816A");
-	strcpy(card->shortname, "ADI SoundPort AD1816A");
+	strscpy(card->driver, "AD1816A");
+	strscpy(card->shortname, "ADI SoundPort AD1816A");
 	sprintf(card->longname, "%s, SS at 0x%lx, irq %d, dma %d&%d",
 		card->shortname, chip->port, irq[dev], dma1[dev], dma2[dev]);
 
diff --git a/sound/isa/ad1816a/ad1816a_lib.c b/sound/isa/ad1816a/ad1816a_lib.c
index 2b87036cb94f..400ae547bcba 100644
--- a/sound/isa/ad1816a/ad1816a_lib.c
+++ b/sound/isa/ad1816a/ad1816a_lib.c
@@ -631,7 +631,7 @@ int snd_ad1816a_pcm(struct snd_ad1816a *chip, int device)
 	pcm->private_data = chip;
 	pcm->info_flags = (chip->dma1 == chip->dma2 ) ? SNDRV_PCM_INFO_JOINT_DUPLEX : 0;
 
-	strcpy(pcm->name, snd_ad1816a_chip_id(chip));
+	strscpy(pcm->name, snd_ad1816a_chip_id(chip));
 	snd_ad1816a_init(chip);
 
 	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, chip->card->dev,
@@ -655,7 +655,7 @@ int snd_ad1816a_timer(struct snd_ad1816a *chip, int device)
 	error = snd_timer_new(chip->card, "AD1816A", &tid, &timer);
 	if (error < 0)
 		return error;
-	strcpy(timer->name, snd_ad1816a_chip_id(chip));
+	strscpy(timer->name, snd_ad1816a_chip_id(chip));
 	timer->private_data = chip;
 	chip->timer = timer;
 	timer->hw = snd_ad1816a_timer_table;
@@ -912,7 +912,7 @@ int snd_ad1816a_mixer(struct snd_ad1816a *chip)
 
 	card = chip->card;
 
-	strcpy(card->mixername, snd_ad1816a_chip_id(chip));
+	strscpy(card->mixername, snd_ad1816a_chip_id(chip));
 
 	for (idx = 0; idx < ARRAY_SIZE(snd_ad1816a_controls); idx++) {
 		err = snd_ctl_add(card, snd_ctl_new1(&snd_ad1816a_controls[idx], chip));
-- 
2.50.0

