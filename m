Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B9E2D6623
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142403; cv=none; b=EaZfSXe7HrfNp5/7SBPEVGJijiUI9W/SZ2kwyTo1ImpNZeRnVXGCNr4tDwxitZQIMxWZzOitff6PhE/I98EQvWTPeooy59zeoPevh88SmwkjtshkA8cm1jUjngBxZ2wsEtE0tpZAJ7Px7J61iL24uMfnmg7XBBSPeZieavlhIHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142403; c=relaxed/simple;
	bh=CKRNgYtJDa4ZUjYGpZX4aChMcWiy+GlGKknbqjLoyRE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XwGBQWVHqc+fC9rYd/jjrOU/6dKKDihaJI/BcdXSnpusck/3xJeXj9oWsRQgq98UIwOzmjKzoW8gG66R0fAHNthONGba3rvbgn81LJBb9v0SJmhLbCQ2kj4jToTsqgZ9PyoX5gydh+15duVtE6JQ5rR4eMfVO+eQCQ2zDR2PgEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fZdbifK1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=i+1ZirQa; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fZdbifK1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=i+1ZirQa; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fZdbifK1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="i+1ZirQa";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fZdbifK1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="i+1ZirQa"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6A42D211C8;
	Thu, 10 Jul 2025 10:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142069; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=703cC3o3uwS420bJXFJiRJsDeh4BsxaPg1AUh5prrpk=;
	b=fZdbifK1HOdTfmQ4wyKUc+hnpoxB1LxKtczGdF1b/1PuJNxTqdlVYIDYZiVvorHozQ7AJS
	ed7qJZuBoL9x4F8C4xVzFsdC07Wh3K0ao/0BZKhJdzmx05LYPBTbUDafekXl9pmZDoYob3
	tBV+ZRJb5bnF1DT4pBxIGFU8XdjlguY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142069;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=703cC3o3uwS420bJXFJiRJsDeh4BsxaPg1AUh5prrpk=;
	b=i+1ZirQaoQSZWjuv4PXr1HSUi61DNYsMLR+Rnw6cE/oHaoQ62CYWmzEbdJCh01Y6ZV63f6
	OH5Si6Pr/5mhi1AA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142069; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=703cC3o3uwS420bJXFJiRJsDeh4BsxaPg1AUh5prrpk=;
	b=fZdbifK1HOdTfmQ4wyKUc+hnpoxB1LxKtczGdF1b/1PuJNxTqdlVYIDYZiVvorHozQ7AJS
	ed7qJZuBoL9x4F8C4xVzFsdC07Wh3K0ao/0BZKhJdzmx05LYPBTbUDafekXl9pmZDoYob3
	tBV+ZRJb5bnF1DT4pBxIGFU8XdjlguY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142069;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=703cC3o3uwS420bJXFJiRJsDeh4BsxaPg1AUh5prrpk=;
	b=i+1ZirQaoQSZWjuv4PXr1HSUi61DNYsMLR+Rnw6cE/oHaoQ62CYWmzEbdJCh01Y6ZV63f6
	OH5Si6Pr/5mhi1AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4F21813A70;
	Thu, 10 Jul 2025 10:07:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wEopEvWQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:49 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 093/103] ALSA: spi: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:07:15 +0200
Message-ID: <20250710100727.22653-94-tiwai@suse.de>
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
 sound/spi/at73c213.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/spi/at73c213.c b/sound/spi/at73c213.c
index 8f6929ced2c8..a0a7f90b6146 100644
--- a/sound/spi/at73c213.c
+++ b/sound/spi/at73c213.c
@@ -336,7 +336,7 @@ static int snd_at73c213_pcm_new(struct snd_at73c213 *chip, int device)
 
 	pcm->private_data = chip;
 	pcm->info_flags = SNDRV_PCM_INFO_BLOCK_TRANSFER;
-	strcpy(pcm->name, "at73c213");
+	strscpy(pcm->name, "at73c213");
 	chip->pcm = pcm;
 
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &at73c213_playback_ops);
@@ -713,7 +713,7 @@ static int snd_at73c213_mixer(struct snd_at73c213 *chip)
 
 	card = chip->card;
 
-	strcpy(card->mixername, chip->pcm->name);
+	strscpy(card->mixername, chip->pcm->name);
 
 	for (idx = 0; idx < ARRAY_SIZE(snd_at73c213_controls); idx++) {
 		errval = snd_ctl_add(card,
@@ -983,8 +983,8 @@ static int snd_at73c213_probe(struct spi_device *spi)
 	if (retval)
 		goto out_ssc;
 
-	strcpy(card->driver, "at73c213");
-	strcpy(card->shortname, board->shortname);
+	strscpy(card->driver, "at73c213");
+	strscpy(card->shortname, board->shortname);
 	sprintf(card->longname, "%s on irq %d", card->shortname, chip->irq);
 
 	retval = snd_card_register(card);
-- 
2.50.0

