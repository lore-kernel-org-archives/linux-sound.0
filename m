Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D212D6413
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142364; cv=none; b=q1Tx0Q1jYhDY0EcTJxEhVduUtFvVS4TjPKfbY6u2TAPxnEEqfR9tYf7QJyPrt+NXdxTpAdutsWfd6EclH+cqnkpqqRgbVv11WoZSAAte4FMCFKtAhfv1tBDndS2LeFKRnTf8BQ0SVAAO6jSc+o8TKLYpp6aOLELOkW79g6PnWsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142364; c=relaxed/simple;
	bh=oMe8qFKfE/XEKIgNOsbtgW42jZpeG90iYRJQTPsaPRY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y9dXzXHQGa5EHVqILP80MLVbdHZQUqnFU3kNR9F6I4OfjGGAJXTF+ZBBP1tS1rCH8TdENHceQ3AD0cuebqSNV748yJwozVNoiBsIKsL6HUlVm/RkTKdcAy+G6axCMRR9RN8J9lO8eXTgO+M3DYURS28ZoOI6ZJf6DMbv1osKL5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kYDVEvGp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iaT6W9TK; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kYDVEvGp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iaT6W9TK; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kYDVEvGp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iaT6W9TK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kYDVEvGp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iaT6W9TK"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2B2D5211B5;
	Thu, 10 Jul 2025 10:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142067; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1f9jjuFkXp8GFWdciCx2PmvjtRya6Zqc6NQYx6kN2Z8=;
	b=kYDVEvGpGIUPyMNm3RlGaQICKQXwWoTkkVINZfobEUx+VK1x5yFz2ris65C8rhi+9k9qHp
	kCcindPoYrSjS6QJq8XTgzfFmIQ0ea+ajdq27Lx9zTsgCZ5TlnzBen/X2ut/rrOka3zVMA
	iJG4mLgMg8H9LgipY8nmIwIsadlrA5U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142067;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1f9jjuFkXp8GFWdciCx2PmvjtRya6Zqc6NQYx6kN2Z8=;
	b=iaT6W9TKBRhviMb7T63c8aTu143yv2zy9Eh8E33Cq+OvvAgSEHm83mA9z8x3XWRdRoZoRq
	F/gnWJBEYp8pUuBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=kYDVEvGp;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=iaT6W9TK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142067; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1f9jjuFkXp8GFWdciCx2PmvjtRya6Zqc6NQYx6kN2Z8=;
	b=kYDVEvGpGIUPyMNm3RlGaQICKQXwWoTkkVINZfobEUx+VK1x5yFz2ris65C8rhi+9k9qHp
	kCcindPoYrSjS6QJq8XTgzfFmIQ0ea+ajdq27Lx9zTsgCZ5TlnzBen/X2ut/rrOka3zVMA
	iJG4mLgMg8H9LgipY8nmIwIsadlrA5U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142067;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1f9jjuFkXp8GFWdciCx2PmvjtRya6Zqc6NQYx6kN2Z8=;
	b=iaT6W9TKBRhviMb7T63c8aTu143yv2zy9Eh8E33Cq+OvvAgSEHm83mA9z8x3XWRdRoZoRq
	F/gnWJBEYp8pUuBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1124913A70;
	Thu, 10 Jul 2025 10:07:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8OMAA/OQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:47 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 077/103] ALSA: riptide: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:06:59 +0200
Message-ID: <20250710100727.22653-78-tiwai@suse.de>
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
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 2B2D5211B5
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLe1mc1hwayk397878n5a1j337)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01

Use a safer function strscpy() instead of strcpy() for copying to
arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/riptide/riptide.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/pci/riptide/riptide.c b/sound/pci/riptide/riptide.c
index 578be0755b8a..e983cd657e28 100644
--- a/sound/pci/riptide/riptide.c
+++ b/sound/pci/riptide/riptide.c
@@ -1688,7 +1688,7 @@ static int snd_riptide_pcm(struct snd_riptide *chip, int device)
 			&snd_riptide_capture_ops);
 	pcm->private_data = chip;
 	pcm->info_flags = 0;
-	strcpy(pcm->name, "RIPTIDE");
+	strscpy(pcm->name, "RIPTIDE");
 	chip->pcm = pcm;
 	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV_SG,
 				       &chip->pci->dev, 64 * 1024, 128 * 1024);
@@ -2098,8 +2098,8 @@ __snd_card_riptide_probe(struct pci_dev *pci, const struct pci_device_id *pci_id
 	}
 #endif
 
-	strcpy(card->driver, "RIPTIDE");
-	strcpy(card->shortname, "Riptide");
+	strscpy(card->driver, "RIPTIDE");
+	strscpy(card->shortname, "Riptide");
 #ifdef SUPPORT_JOYSTICK
 	scnprintf(card->longname, sizeof(card->longname),
 		  "%s at 0x%lx, irq %i mpu 0x%x opl3 0x%x gameport 0x%x",
-- 
2.50.0

