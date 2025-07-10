Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29ED22D6404
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142314; cv=none; b=Qbva+WZ6+FKH5NVNvBwJqu4QFRv7GAuiECYtGhhjiqwzSQIlfmwy7ewvkDEDi1O4pMLJ1Je/GuC0nBJ+2O/CLKDgYyEIiOaBQL+Ejko9hv0Hzxd/3FC8k7cb7sLGGIsqjODb8bGTYwcP4iNMvjhDV2dqe90k+J4UbpX3AX84QXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142314; c=relaxed/simple;
	bh=sAeT00hEWyu/hzYyWtoU8JIofqa1e+uGaVnCbQfxqFs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gopcW7We97oayoStFeuGlq+o1vNudS7DgWnKjX2d4r4zAF9JLHA2SKpaxz8CYCw7Z2amoVD+XOGgRjOnSmd2YuRy6CJ4Y8FCHgCg9G2F9aAreVWCIxlcF41OgA/fEc1ALguKC4q7LsbzwFaYXzMp/gV/uh/haw47Nzg0Ofg/HPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mmCK4nfT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DTYxxkC4; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mmCK4nfT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DTYxxkC4; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mmCK4nfT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DTYxxkC4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mmCK4nfT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DTYxxkC4"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B7C03211A9;
	Thu, 10 Jul 2025 10:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142065; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cHWYJrQNK9KKXVtdG4FGGxCFs2m7WMm3QRgedh5rgfE=;
	b=mmCK4nfTAwLO+7MVHFvt8LPFq3NvqViItQDb7gQX9kjNxUH8SHsuf8uZfwrSztNYqDdj2J
	6FMsk/sODHmFRH7G5qkn7qR0xRrXdV/LaC6W3t8ungIcqOgI0jz/vwM2xz/gL8Euyb3mmG
	qcQFoQEopKukEguGv/kH87is+Xa3QU8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142065;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cHWYJrQNK9KKXVtdG4FGGxCFs2m7WMm3QRgedh5rgfE=;
	b=DTYxxkC49JAPsijp63a4xzMSQSTBVVIgyyBubKDl9U7AyFanz3dK4aqDUiEELEUC3NY0+l
	pnMhKOkcRzfp6oAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=mmCK4nfT;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=DTYxxkC4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142065; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cHWYJrQNK9KKXVtdG4FGGxCFs2m7WMm3QRgedh5rgfE=;
	b=mmCK4nfTAwLO+7MVHFvt8LPFq3NvqViItQDb7gQX9kjNxUH8SHsuf8uZfwrSztNYqDdj2J
	6FMsk/sODHmFRH7G5qkn7qR0xRrXdV/LaC6W3t8ungIcqOgI0jz/vwM2xz/gL8Euyb3mmG
	qcQFoQEopKukEguGv/kH87is+Xa3QU8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142065;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cHWYJrQNK9KKXVtdG4FGGxCFs2m7WMm3QRgedh5rgfE=;
	b=DTYxxkC49JAPsijp63a4xzMSQSTBVVIgyyBubKDl9U7AyFanz3dK4aqDUiEELEUC3NY0+l
	pnMhKOkcRzfp6oAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9EAD713A70;
	Thu, 10 Jul 2025 10:07:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kJuQJfGQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:45 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 067/103] ALSA: ice1724: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:06:49 +0200
Message-ID: <20250710100727.22653-68-tiwai@suse.de>
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
	BAYES_HAM(-3.00)[100.00%];
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
X-Rspamd-Queue-Id: B7C03211A9
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Use a safer function strscpy() instead of strcpy() for copying to
arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ice1712/ice1724.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/pci/ice1712/ice1724.c b/sound/pci/ice1712/ice1724.c
index be22b159e65a..0445d2e8e548 100644
--- a/sound/pci/ice1712/ice1724.c
+++ b/sound/pci/ice1712/ice1724.c
@@ -1118,7 +1118,7 @@ static int snd_vt1724_pcm_profi(struct snd_ice1712 *ice, int device)
 
 	pcm->private_data = ice;
 	pcm->info_flags = 0;
-	strcpy(pcm->name, "ICE1724");
+	strscpy(pcm->name, "ICE1724");
 
 	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
 				       &ice->pci->dev, 256*1024, 256*1024);
@@ -1313,7 +1313,7 @@ static int snd_vt1724_pcm_spdif(struct snd_ice1712 *ice, int device)
 
 	pcm->private_data = ice;
 	pcm->info_flags = 0;
-	strcpy(pcm->name, name);
+	strscpy(pcm->name, name);
 
 	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
 				       &ice->pci->dev, 256*1024, 256*1024);
@@ -1425,7 +1425,7 @@ static int snd_vt1724_pcm_indep(struct snd_ice1712 *ice, int device)
 
 	pcm->private_data = ice;
 	pcm->info_flags = 0;
-	strcpy(pcm->name, "ICE1724 Surround PCM");
+	strscpy(pcm->name, "ICE1724 Surround PCM");
 
 	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
 				       &ice->pci->dev, 256*1024, 256*1024);
@@ -1820,7 +1820,7 @@ static int snd_vt1724_pro_internal_clock_info(struct snd_kcontrol *kcontrol,
 		uinfo->value.enumerated.item = uinfo->value.enumerated.items - 1;
 	if (uinfo->value.enumerated.item >= hw_rates_count)
 		/* ext_clock items */
-		strcpy(uinfo->value.enumerated.name,
+		strscpy(uinfo->value.enumerated.name,
 				ice->ext_clock_names[
 				uinfo->value.enumerated.item - hw_rates_count]);
 	else
@@ -2545,8 +2545,8 @@ static int __snd_vt1724_probe(struct pci_dev *pci,
 		return err;
 	ice = card->private_data;
 
-	strcpy(card->driver, "ICE1724");
-	strcpy(card->shortname, "ICEnsemble ICE1724");
+	strscpy(card->driver, "ICE1724");
+	strscpy(card->shortname, "ICEnsemble ICE1724");
 
 	err = snd_vt1724_create(card, pci, model[dev]);
 	if (err < 0)
@@ -2557,9 +2557,9 @@ static int __snd_vt1724_probe(struct pci_dev *pci,
 
 	c = ice->card_info;
 	if (c) {
-		strcpy(card->shortname, c->name);
+		strscpy(card->shortname, c->name);
 		if (c->driver) /* specific driver? */
-			strcpy(card->driver, c->driver);
+			strscpy(card->driver, c->driver);
 		if (c->chip_init) {
 			err = c->chip_init(ice);
 			if (err < 0)
@@ -2637,7 +2637,7 @@ static int __snd_vt1724_probe(struct pci_dev *pci,
 				return err;
 			ice->rmidi[0] = rmidi;
 			rmidi->private_data = ice;
-			strcpy(rmidi->name, "ICE1724 MIDI");
+			strscpy(rmidi->name, "ICE1724 MIDI");
 			rmidi->info_flags = SNDRV_RAWMIDI_INFO_OUTPUT |
 					    SNDRV_RAWMIDI_INFO_INPUT |
 					    SNDRV_RAWMIDI_INFO_DUPLEX;
-- 
2.50.0

