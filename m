Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42F22D6404
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142297; cv=none; b=BBoazDDE00dwvc6JjcnnoqpdHb8Rb8Y6Lfx/0Y23XFEJqib5BJ9cZ3MRFoXTNY2A26mAo8yuKJMwtxILla4fLVYRnx7jhdYwh9q6eA6DTP+nGMOXUZMy2+MiGb2fHrKtc03CWw6d15guFwvtBNQ/YrakTfNfeXMkcu7HsMx9kcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142297; c=relaxed/simple;
	bh=To1fEg42/3kvGyqtMWiZP3wRmnTUrI3WB9MBzjAr9IQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=te7G0qJpxIh0C3U1sGoOEnwPOCZ95OuwCLUl+tfKEIHESGL6iuuLUgiwErqziQKz875TrRRdpIk5Fg4NJSY4ZJcEi30Z0po12BoaWsxBlV1S0AmhaduHWPls6jTqWoeKWJksETK/pBIrarJKzWaza7YIWVs1u4VPNFe9xPHUFFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VWHQWYBu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LBWTioya; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VWHQWYBu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LBWTioya; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VWHQWYBu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LBWTioya";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VWHQWYBu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LBWTioya"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 478951F788;
	Thu, 10 Jul 2025 10:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142069; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EAKo5/m0KYsAlEqLp03SkMgkfEetXonwCxufBT0BlSs=;
	b=VWHQWYBuWH0UXiO7OO4vIx2zloV0VmieIAGStFdny5psXpN/qy4zBRWkZymtNXYPhEKGpo
	1Nj8QVN9Ij0kp+Hn/BAAc2Q/qnXsgad1Ue/ygbfnn1oItkqz4fm8SJo8FW5kPYl1pH9A3O
	unslLcOeHvkSpVbJ8bZpD0OBU82kydk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142069;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EAKo5/m0KYsAlEqLp03SkMgkfEetXonwCxufBT0BlSs=;
	b=LBWTioyaUgOcpGSg8fc3i3DFhtMn9+iFQrQOTleFl6ISHVRlIg1Gt4dGho7eb80JlsvKDE
	u10qOx5pj4ijA1BQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142069; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EAKo5/m0KYsAlEqLp03SkMgkfEetXonwCxufBT0BlSs=;
	b=VWHQWYBuWH0UXiO7OO4vIx2zloV0VmieIAGStFdny5psXpN/qy4zBRWkZymtNXYPhEKGpo
	1Nj8QVN9Ij0kp+Hn/BAAc2Q/qnXsgad1Ue/ygbfnn1oItkqz4fm8SJo8FW5kPYl1pH9A3O
	unslLcOeHvkSpVbJ8bZpD0OBU82kydk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142069;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EAKo5/m0KYsAlEqLp03SkMgkfEetXonwCxufBT0BlSs=;
	b=LBWTioyaUgOcpGSg8fc3i3DFhtMn9+iFQrQOTleFl6ISHVRlIg1Gt4dGho7eb80JlsvKDE
	u10qOx5pj4ijA1BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2E99A136DC;
	Thu, 10 Jul 2025 10:07:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SMsyCvWQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:49 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 092/103] ALSA: sparc: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:07:14 +0200
Message-ID: <20250710100727.22653-93-tiwai@suse.de>
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
X-Spam-Level: 
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLsqo7dymd5dgmoaprf5rep8is)];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

Use a safer function strscpy() instead of strcpy() for copying to
arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/sparc/cs4231.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/sparc/cs4231.c b/sound/sparc/cs4231.c
index 1b44119edfbc..1a1fe3ceb76c 100644
--- a/sound/sparc/cs4231.c
+++ b/sound/sparc/cs4231.c
@@ -1230,7 +1230,7 @@ static int snd_cs4231_pcm(struct snd_card *card)
 	/* global setup */
 	pcm->private_data = chip;
 	pcm->info_flags = SNDRV_PCM_INFO_JOINT_DUPLEX;
-	strcpy(pcm->name, "CS4231");
+	strscpy(pcm->name, "CS4231");
 
 	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
 				       &chip->op->dev, 64 * 1024, 128 * 1024);
@@ -1256,7 +1256,7 @@ static int snd_cs4231_timer(struct snd_card *card)
 	err = snd_timer_new(card, "CS4231", &tid, &timer);
 	if (err < 0)
 		return err;
-	strcpy(timer->name, "CS4231");
+	strscpy(timer->name, "CS4231");
 	timer->private_data = chip;
 	timer->hw = snd_cs4231_timer_table;
 	chip->timer = timer;
@@ -1530,7 +1530,7 @@ static int snd_cs4231_mixer(struct snd_card *card)
 	if (snd_BUG_ON(!chip || !chip->pcm))
 		return -EINVAL;
 
-	strcpy(card->mixername, chip->pcm->name);
+	strscpy(card->mixername, chip->pcm->name);
 
 	for (idx = 0; idx < ARRAY_SIZE(snd_cs4231_controls); idx++) {
 		err = snd_ctl_add(card,
@@ -1565,8 +1565,8 @@ static int cs4231_attach_begin(struct platform_device *op,
 	if (err < 0)
 		return err;
 
-	strcpy(card->driver, "CS4231");
-	strcpy(card->shortname, "Sun CS4231");
+	strscpy(card->driver, "CS4231");
+	strscpy(card->shortname, "Sun CS4231");
 
 	chip = card->private_data;
 	chip->card = card;
@@ -1964,12 +1964,12 @@ static int snd_cs4231_ebus_create(struct snd_card *card,
 	chip->op = op;
 	memcpy(&chip->image, &snd_cs4231_original_image,
 	       sizeof(snd_cs4231_original_image));
-	strcpy(chip->c_dma.ebus_info.name, "cs4231(capture)");
+	strscpy(chip->c_dma.ebus_info.name, "cs4231(capture)");
 	chip->c_dma.ebus_info.flags = EBUS_DMA_FLAG_USE_EBDMA_HANDLER;
 	chip->c_dma.ebus_info.callback = snd_cs4231_ebus_capture_callback;
 	chip->c_dma.ebus_info.client_cookie = chip;
 	chip->c_dma.ebus_info.irq = op->archdata.irqs[0];
-	strcpy(chip->p_dma.ebus_info.name, "cs4231(play)");
+	strscpy(chip->p_dma.ebus_info.name, "cs4231(play)");
 	chip->p_dma.ebus_info.flags = EBUS_DMA_FLAG_USE_EBDMA_HANDLER;
 	chip->p_dma.ebus_info.callback = snd_cs4231_ebus_play_callback;
 	chip->p_dma.ebus_info.client_cookie = chip;
-- 
2.50.0

