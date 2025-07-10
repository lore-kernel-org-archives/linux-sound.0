Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D6C2D5431
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142206; cv=none; b=FKFlvE/6R9Y6xR53brozOlF6aCpWt1Cul260jRieE0S5S2wl7uEqE2c9PbM5E5fC8wEgd6514ZBvAvvLbyjbDqQFxnpdvjqoUVwIcdOsmevFmbk3dXy3uDZRYQ95/LiDtbgsXYJ8CPnW2c34eserfl36HxghtBrAw13wgWu0O7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142206; c=relaxed/simple;
	bh=GgIsDHqrD1Hta1uprnNNseDbb8x0C/EUFKcUiaSt2gs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qqO7xYntxau1au7VH6rK+Pq8Jg31qM6MtqNN0okdAMkGMJGw4pdD8wPptTmp0BwQAXTYE6qAXF9Sq7Ps5ki0dZPC997azdeHHnkr8CyNIoLO2dHwnP2VJRdBPBf5nSt72TR7itl4gtWsaH/LpS5y0XlNbcAiUMKQVF2405XvZuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PQxd/cW/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=R9sbCi2W; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PQxd/cW/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=R9sbCi2W; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PQxd/cW/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="R9sbCi2W";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PQxd/cW/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="R9sbCi2W"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 377D81F749;
	Thu, 10 Jul 2025 10:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142065; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3jqaCcdnK4k+/5Ut7u6FVLl7M+oXJLe+L2oQKEjRl3M=;
	b=PQxd/cW/sNl2jWvh1uTg5lnfEXLkfRWYzOVBEEznuPiWomPIPsyMKY6/XFwEbxOvug6u6L
	hBEW4BJp/M9ozDoWi4/Q3gKLvDpaCVMIZSpGgP4rLZcxA3aQ+k7sdjfM+hErOGg5xBFSaU
	ZByocA3LcJ/bV+zxYa3U+os08CiZMFw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142065;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3jqaCcdnK4k+/5Ut7u6FVLl7M+oXJLe+L2oQKEjRl3M=;
	b=R9sbCi2WnZ0JoJoG8sZFySIIyI4HQXcy1ifVXm4BzvI36W18ssdQ1CllH0BQt0ao5+TZ/F
	fy2v5whntXS1s+Bg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142065; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3jqaCcdnK4k+/5Ut7u6FVLl7M+oXJLe+L2oQKEjRl3M=;
	b=PQxd/cW/sNl2jWvh1uTg5lnfEXLkfRWYzOVBEEznuPiWomPIPsyMKY6/XFwEbxOvug6u6L
	hBEW4BJp/M9ozDoWi4/Q3gKLvDpaCVMIZSpGgP4rLZcxA3aQ+k7sdjfM+hErOGg5xBFSaU
	ZByocA3LcJ/bV+zxYa3U+os08CiZMFw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142065;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3jqaCcdnK4k+/5Ut7u6FVLl7M+oXJLe+L2oQKEjRl3M=;
	b=R9sbCi2WnZ0JoJoG8sZFySIIyI4HQXcy1ifVXm4BzvI36W18ssdQ1CllH0BQt0ao5+TZ/F
	fy2v5whntXS1s+Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1D7B113AAB;
	Thu, 10 Jul 2025 10:07:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YHnaBfGQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:45 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 063/103] ALSA: es1938: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:06:45 +0200
Message-ID: <20250710100727.22653-64-tiwai@suse.de>
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
	BAYES_HAM(-3.00)[99.99%];
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
 sound/pci/es1938.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/pci/es1938.c b/sound/pci/es1938.c
index 27728bdfac57..0ce7076206f9 100644
--- a/sound/pci/es1938.c
+++ b/sound/pci/es1938.c
@@ -982,7 +982,7 @@ static int snd_es1938_new_pcm(struct es1938 *chip, int device)
 	
 	pcm->private_data = chip;
 	pcm->info_flags = 0;
-	strcpy(pcm->name, "ESS Solo-1");
+	strscpy(pcm->name, "ESS Solo-1");
 
 	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
 				       &chip->pci->dev, 64*1024, 64*1024);
@@ -1658,7 +1658,7 @@ static int snd_es1938_mixer(struct es1938 *chip)
 
 	card = chip->card;
 
-	strcpy(card->mixername, "ESS Solo-1");
+	strscpy(card->mixername, "ESS Solo-1");
 
 	for (idx = 0; idx < ARRAY_SIZE(snd_es1938_controls); idx++) {
 		struct snd_kcontrol *kctl;
@@ -1720,8 +1720,8 @@ static int __snd_es1938_probe(struct pci_dev *pci,
 	if (err < 0)
 		return err;
 
-	strcpy(card->driver, "ES1938");
-	strcpy(card->shortname, "ESS ES1938 (Solo-1)");
+	strscpy(card->driver, "ES1938");
+	strscpy(card->shortname, "ESS ES1938 (Solo-1)");
 	sprintf(card->longname, "%s rev %i, irq %i",
 		card->shortname,
 		chip->revision,
-- 
2.50.0

