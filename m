Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52332D5A16
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142218; cv=none; b=cNZLFrWma0SOqEtxIpJG/IQc7cAJLfJximBRJdgMzFx+SbgtGoP7FC+nhr+zSti7IpWuC1lwR/I5WxpFhL2ymF10kkdpKjdJYTVJuPNQNW4Ayo7dW5pmtlclh7DJBg8T3Kgn+mzFbSRRkO8YBHORFLn54ODPxVVmJvY4fHpld98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142218; c=relaxed/simple;
	bh=r2c6UdxrXn6qp5G4PXI99S0YLs7MN6QsgfiBJKrcr4w=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d8azOov9tqzuqE2ejL4tGl6HzuxLVYRKT9Ct3e7uAvodzZpS0e87Bz3pdwELrxeeWpp3A9oDp/dnHf5iSr5uUDNQ2gef1HU8T0ngm7Tx1YjgQATb46PRe/shIXDT6VzmKOMPV/UE2UboltHuHMipPqgtbPo67Tg+mwJghJTiMiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zURJtGzS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=H18ggxeh; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zURJtGzS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=H18ggxeh; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zURJtGzS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="H18ggxeh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zURJtGzS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="H18ggxeh"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8730D1F74B;
	Thu, 10 Jul 2025 10:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142065; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hDGfskXk1hxTIY91lLbz9gWgHBlRvIbSTRYwlyZbxd4=;
	b=zURJtGzSjpfEdPylscGVZdx308EyW0x2i7xy0bFxpmrQzHQ+G3FG6dBFFS6F9o8sntSI5R
	sQEh0BUgxL8xFCBewSzwvc8dOm/xncu6T9DtDolZfgNY36YPIFhP4pUrHuM3KANmfUsmqX
	G7aMu49hydi4EvQSPiPN0T1WK8AmwG8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142065;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hDGfskXk1hxTIY91lLbz9gWgHBlRvIbSTRYwlyZbxd4=;
	b=H18ggxehuIeo8clOXEbBxGzZaGlZn9hrydunDlAhKFTU0lTMURC567cjbJhiYcRafs8pBj
	r2s4LpVX947xh4BQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142065; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hDGfskXk1hxTIY91lLbz9gWgHBlRvIbSTRYwlyZbxd4=;
	b=zURJtGzSjpfEdPylscGVZdx308EyW0x2i7xy0bFxpmrQzHQ+G3FG6dBFFS6F9o8sntSI5R
	sQEh0BUgxL8xFCBewSzwvc8dOm/xncu6T9DtDolZfgNY36YPIFhP4pUrHuM3KANmfUsmqX
	G7aMu49hydi4EvQSPiPN0T1WK8AmwG8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142065;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hDGfskXk1hxTIY91lLbz9gWgHBlRvIbSTRYwlyZbxd4=;
	b=H18ggxehuIeo8clOXEbBxGzZaGlZn9hrydunDlAhKFTU0lTMURC567cjbJhiYcRafs8pBj
	r2s4LpVX947xh4BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6013C13A70;
	Thu, 10 Jul 2025 10:07:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yGREFvGQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:45 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 065/103] ALSA: fm801: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:06:47 +0200
Message-ID: <20250710100727.22653-66-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
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
 sound/pci/fm801.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/pci/fm801.c b/sound/pci/fm801.c
index f283256eda0d..cf40bd06b734 100644
--- a/sound/pci/fm801.c
+++ b/sound/pci/fm801.c
@@ -726,7 +726,7 @@ static int snd_fm801_pcm(struct fm801 *chip, int device)
 
 	pcm->private_data = chip;
 	pcm->info_flags = 0;
-	strcpy(pcm->name, "FM801");
+	strscpy(pcm->name, "FM801");
 	chip->pcm = pcm;
 
 	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, &pdev->dev,
@@ -1291,8 +1291,8 @@ static int __snd_card_fm801_probe(struct pci_dev *pci,
 	if (err < 0)
 		return err;
 
-	strcpy(card->driver, "FM801");
-	strcpy(card->shortname, "ForteMedia FM801-");
+	strscpy(card->driver, "FM801");
+	strscpy(card->shortname, "ForteMedia FM801-");
 	strcat(card->shortname, chip->multichannel ? "AU" : "AS");
 	sprintf(card->longname, "%s at 0x%lx, irq %i",
 		card->shortname, chip->port, chip->irq);
-- 
2.50.0

