Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE23E2D5C99
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142278; cv=none; b=W5cWVhNagXBmZIq0f6NXAxOM2lQYpJKrMC17XdqeF9WrxYZAjThkXlgM2B1nIEyBzrFX0pnkJgOyWOZzwXvigw/ToQ0oOMz+OqDFRfQ1lHvrib55KnjnnE7t/0xOTOuuNfsHDDSmdSmiYjb6bROPTiYnWD7YF4Htx2d3V5bgSVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142278; c=relaxed/simple;
	bh=t3cIAUAtn9pcE0UxYU9uqmBAW1XaijyFT2cPc5iO9fA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pgbejE8q2XaANlf++RWIZEPqbrNKGysdb2P6iWOvFdJ/SdnwoUCixlnp1jtr5fJIfK6oBUXNOkty8Til5tPzVT0/btHe2S9TlVZEZvLd9MXigbtXi0XJYwrUN1ABGtfuWZ7dBwrhca7BYcYkoJCvHa69nrSqFJUX99UJnW1kvSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ibBr2qE7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qN86j5U8; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ibBr2qE7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qN86j5U8; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ibBr2qE7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qN86j5U8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ibBr2qE7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qN86j5U8"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 84ACB211A2;
	Thu, 10 Jul 2025 10:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142063; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CueDv1nAUSraWpYHj7poiPqmC52gcdS9hfmtY5HBQ/Y=;
	b=ibBr2qE7qv7MIzs9rysmeseiJ8asu3bMVS6ecwVmGM5MqlyxXJxQURIXcUB+f89f5DLwiK
	rtozhVPVNKE4WJQy204WrIzGjh60MblkyEOGCzqxhDYp1q+S7ogQDAY6fW/Zzdgq5ZRoRb
	2lZN+bb/8a6aSjdStCvdKdhg622q4/Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142063;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CueDv1nAUSraWpYHj7poiPqmC52gcdS9hfmtY5HBQ/Y=;
	b=qN86j5U81UFpPkwmEOeKARaqD913BYEJ3pjaoiIDyDDG2SpfcItZUIS/+FtyGteXH8k5nU
	W86Sdj+QVM8I5sBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142063; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CueDv1nAUSraWpYHj7poiPqmC52gcdS9hfmtY5HBQ/Y=;
	b=ibBr2qE7qv7MIzs9rysmeseiJ8asu3bMVS6ecwVmGM5MqlyxXJxQURIXcUB+f89f5DLwiK
	rtozhVPVNKE4WJQy204WrIzGjh60MblkyEOGCzqxhDYp1q+S7ogQDAY6fW/Zzdgq5ZRoRb
	2lZN+bb/8a6aSjdStCvdKdhg622q4/Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142063;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CueDv1nAUSraWpYHj7poiPqmC52gcdS9hfmtY5HBQ/Y=;
	b=qN86j5U81UFpPkwmEOeKARaqD913BYEJ3pjaoiIDyDDG2SpfcItZUIS/+FtyGteXH8k5nU
	W86Sdj+QVM8I5sBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6ADC413A70;
	Thu, 10 Jul 2025 10:07:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qOTmGO+Qb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:43 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 051/103] ALSA: azt3328: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:06:33 +0200
Message-ID: <20250710100727.22653-52-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
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
 sound/pci/azt3328.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/pci/azt3328.c b/sound/pci/azt3328.c
index 053a18f434bf..4418b9ae33e6 100644
--- a/sound/pci/azt3328.c
+++ b/sound/pci/azt3328.c
@@ -1188,7 +1188,7 @@ snd_azf3328_mixer_new(struct snd_azf3328 *chip)
 			return err;
 	}
 	snd_component_add(card, "AZF3328 mixer");
-	strcpy(card->mixername, "AZF3328 mixer");
+	strscpy(card->mixername, "AZF3328 mixer");
 
 	return 0;
 }
@@ -2095,7 +2095,7 @@ snd_azf3328_pcm(struct snd_azf3328 *chip)
 
 	pcm->private_data = chip;
 	pcm->info_flags = 0;
-	strcpy(pcm->name, chip->card->shortname);
+	strscpy(pcm->name, chip->card->shortname);
 	/* same pcm object for playback/capture (see snd_pcm_new() above) */
 	chip->pcm[AZF_CODEC_PLAYBACK] = pcm;
 	chip->pcm[AZF_CODEC_CAPTURE] = pcm;
@@ -2112,7 +2112,7 @@ snd_azf3328_pcm(struct snd_azf3328 *chip)
 
 	pcm->private_data = chip;
 	pcm->info_flags = 0;
-	strcpy(pcm->name, chip->card->shortname);
+	strscpy(pcm->name, chip->card->shortname);
 	chip->pcm[AZF_CODEC_I2S_OUT] = pcm;
 
 	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, &chip->pci->dev,
@@ -2217,7 +2217,7 @@ snd_azf3328_timer(struct snd_azf3328 *chip, int device)
 	if (err < 0)
 		goto out;
 
-	strcpy(timer->name, "AZF3328 timer");
+	strscpy(timer->name, "AZF3328 timer");
 	timer->private_data = chip;
 	timer->hw = snd_azf3328_timer_hw;
 
@@ -2437,8 +2437,8 @@ __snd_azf3328_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 		return err;
 	chip = card->private_data;
 
-	strcpy(card->driver, "AZF3328");
-	strcpy(card->shortname, "Aztech AZF3328 (PCI168)");
+	strscpy(card->driver, "AZF3328");
+	strscpy(card->shortname, "Aztech AZF3328 (PCI168)");
 
 	err = snd_azf3328_create(card, pci, pci_id->driver_data);
 	if (err < 0)
-- 
2.50.0

