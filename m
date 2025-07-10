Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C552D5C6D
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142224; cv=none; b=hfEvgtHwoiHHLM+pV09RfHbDixYg+u6P0J69I1b4rRGXrzZ77KmOsFEZSaqQRSvDkwEz9leA8XzRFxoBEy5u6W8WOJhzQHRvfVtte886FY/+X2rUGVrKRWJ35jMzh7w/Y3XgGOHNTkH+fkxgXDBCO2aPtxwDFjZyTZUlPLS79tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142224; c=relaxed/simple;
	bh=MzFmEn20HYKVJyF3N/1Lopm+j/CtbQ1C0LQ6WfmrOog=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sqWbn5f7dqgW5kOREoxiXaoLDZ0Xoj4EIq4fR5Xg/84szdIIlffTL/9RdArhH+NR5l2122xl8ZOcnpJpxUkop8xWNduHLEKJbvnKuAt2nuHz46jugQWXeQe6Nixl/EDnd5T4J6cU7DwHOm6ht/yEyDv4FhzvcKMXdlvJpkAAn5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kDsamWTQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5eMijgcu; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kDsamWTQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5eMijgcu; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kDsamWTQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5eMijgcu";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kDsamWTQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5eMijgcu"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 980F11F74C;
	Thu, 10 Jul 2025 10:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142065; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RRJOlNlZGxWCnwOO09prqtQeOdalk24lFyhKxHGQW2c=;
	b=kDsamWTQXYUM9mrN+MAXl79F1lL9EzULPFp1s/HliTKS0yCB8phUk/VmLasMILkuzZ17d6
	+ZqSslGP24Zg/KIfq8xRsOs5Z82UkeuZ/z+olA8JqSKlzlQNVBRVCu5ylsGDrywa4FRfll
	1udqx5+2Tl2M7qINK01Zpsv0qsPtbSo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142065;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RRJOlNlZGxWCnwOO09prqtQeOdalk24lFyhKxHGQW2c=;
	b=5eMijgcul6mimel+GciQl8xaSemDSGCAg6kLp6YmQpKnoVrloraRm9sjQoVV3reaii8PV1
	xOZlkv60xu01m1Aw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142065; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RRJOlNlZGxWCnwOO09prqtQeOdalk24lFyhKxHGQW2c=;
	b=kDsamWTQXYUM9mrN+MAXl79F1lL9EzULPFp1s/HliTKS0yCB8phUk/VmLasMILkuzZ17d6
	+ZqSslGP24Zg/KIfq8xRsOs5Z82UkeuZ/z+olA8JqSKlzlQNVBRVCu5ylsGDrywa4FRfll
	1udqx5+2Tl2M7qINK01Zpsv0qsPtbSo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142065;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RRJOlNlZGxWCnwOO09prqtQeOdalk24lFyhKxHGQW2c=;
	b=5eMijgcul6mimel+GciQl8xaSemDSGCAg6kLp6YmQpKnoVrloraRm9sjQoVV3reaii8PV1
	xOZlkv60xu01m1Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7FC4B136DC;
	Thu, 10 Jul 2025 10:07:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aKv2HfGQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:45 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 066/103] ALSA: ice1712: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:06:48 +0200
Message-ID: <20250710100727.22653-67-tiwai@suse.de>
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
 sound/pci/ice1712/ice1712.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/pci/ice1712/ice1712.c b/sound/pci/ice1712/ice1712.c
index a8ac14887676..1aefd46ebf6b 100644
--- a/sound/pci/ice1712/ice1712.c
+++ b/sound/pci/ice1712/ice1712.c
@@ -850,7 +850,7 @@ static int snd_ice1712_pcm(struct snd_ice1712 *ice, int device)
 
 	pcm->private_data = ice;
 	pcm->info_flags = 0;
-	strcpy(pcm->name, "ICE1712 consumer");
+	strscpy(pcm->name, "ICE1712 consumer");
 	ice->pcm = pcm;
 
 	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
@@ -875,7 +875,7 @@ static int snd_ice1712_pcm_ds(struct snd_ice1712 *ice, int device)
 
 	pcm->private_data = ice;
 	pcm->info_flags = 0;
-	strcpy(pcm->name, "ICE1712 consumer (DS)");
+	strscpy(pcm->name, "ICE1712 consumer (DS)");
 	ice->pcm_ds = pcm;
 
 	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
@@ -1216,7 +1216,7 @@ static int snd_ice1712_pcm_profi(struct snd_ice1712 *ice, int device)
 
 	pcm->private_data = ice;
 	pcm->info_flags = 0;
-	strcpy(pcm->name, "ICE1712 multi");
+	strscpy(pcm->name, "ICE1712 multi");
 
 	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
 				       &ice->pci->dev, 256*1024, 256*1024);
@@ -2559,8 +2559,8 @@ static int snd_ice1712_probe(struct pci_dev *pci,
 		return err;
 	ice = card->private_data;
 
-	strcpy(card->driver, "ICE1712");
-	strcpy(card->shortname, "ICEnsemble ICE1712");
+	strscpy(card->driver, "ICE1712");
+	strscpy(card->shortname, "ICEnsemble ICE1712");
 
 	err = snd_ice1712_create(card, pci, model[dev], omni[dev],
 				 cs8427_timeout[dev], dxr_enable[dev]);
@@ -2570,9 +2570,9 @@ static int snd_ice1712_probe(struct pci_dev *pci,
 	for (tbl = card_tables; *tbl; tbl++) {
 		for (c = *tbl; c->subvendor; c++) {
 			if (c->subvendor == ice->eeprom.subvendor) {
-				strcpy(card->shortname, c->name);
+				strscpy(card->shortname, c->name);
 				if (c->driver) /* specific driver? */
-					strcpy(card->driver, c->driver);
+					strscpy(card->driver, c->driver);
 				if (c->chip_init) {
 					err = c->chip_init(ice);
 					if (err < 0)
-- 
2.50.0

