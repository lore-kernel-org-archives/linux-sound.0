Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C39322774
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756478662; cv=none; b=dfBxAHghGN6o0ya4kkLhl7sbtY2ctfn3pKh2lYsAwYDEwyizViSGuRo6qM/qeJCT+9zGjlyd4nsl1Qo3LydU+BeRG55M0RLgeod4LIK5p+BD74HjW/d7nYeMO9BcgndeM6fWKNTfAq7Fg/NLFfN4xj11wkUCebwoOqjRmwVzcZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756478662; c=relaxed/simple;
	bh=NXUAVF9KXLqNpXoGHgiJyDdIe2wz4OEeUwDSj9+GXKM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IW37iGYR69Q697RKRdTS0AQFBxsApf7u3j1haYpJuATESVeawCopv28+31x7BuMS7F5hKsk+ja4fgzOIPEaXpXTg7ole6vvjL6mXZQmKptgr6Ggidxbs7CcRJLmhsV0/fqhbF+wu2Q/Y6FxET+G39z1IQqDvPtjjYTXPO5vkJUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=v7wEbM3J; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Zwyx/oy+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=v7wEbM3J; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Zwyx/oy+; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="v7wEbM3J";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Zwyx/oy+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="v7wEbM3J";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Zwyx/oy+"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3BC065C22A;
	Fri, 29 Aug 2025 14:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478633; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v/u/ITArElfYXRGIsePflX9NOfHSogIjMDeXeo8+Akc=;
	b=v7wEbM3JMpw1Ms5yL/yQ2ZUfT3neMMV8cfvYfwjSL/avPGrwhThZpJYVIc9uCK+gKAZ9rj
	2GY8gSWA5sRwMmtGB5caFhn6G2yZsx5xYmIZ2cfcWdmyJtri2PocM4L5ycz5bXI2N8PWZX
	+8njdWaLooJaR2s+HymTxVu/hn51b+0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478633;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v/u/ITArElfYXRGIsePflX9NOfHSogIjMDeXeo8+Akc=;
	b=Zwyx/oy+5AH99vM+Ap+fTFmOhBJfHU7fBH0gp+84MQNa04ej+k5/zhS8zffhf+2VKn1H71
	BumA5GFEAn/hh4Cg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478633; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v/u/ITArElfYXRGIsePflX9NOfHSogIjMDeXeo8+Akc=;
	b=v7wEbM3JMpw1Ms5yL/yQ2ZUfT3neMMV8cfvYfwjSL/avPGrwhThZpJYVIc9uCK+gKAZ9rj
	2GY8gSWA5sRwMmtGB5caFhn6G2yZsx5xYmIZ2cfcWdmyJtri2PocM4L5ycz5bXI2N8PWZX
	+8njdWaLooJaR2s+HymTxVu/hn51b+0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478633;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v/u/ITArElfYXRGIsePflX9NOfHSogIjMDeXeo8+Akc=;
	b=Zwyx/oy+5AH99vM+Ap+fTFmOhBJfHU7fBH0gp+84MQNa04ej+k5/zhS8zffhf+2VKn1H71
	BumA5GFEAn/hh4Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2133113A3E;
	Fri, 29 Aug 2025 14:43:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OOP7Bqm8sWi6GAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:43:53 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 07/61] ALSA: als300: Use guard() for spin locks
Date: Fri, 29 Aug 2025 16:42:42 +0200
Message-ID: <20250829144342.4290-8-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829144342.4290-1-tiwai@suse.de>
References: <20250829144342.4290-1-tiwai@suse.de>
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
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

Clean up the code using guard() for spin locks.

Merely code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/als300.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/sound/pci/als300.c b/sound/pci/als300.c
index f9e8424dc77f..733e84def5a7 100644
--- a/sound/pci/als300.c
+++ b/sound/pci/als300.c
@@ -402,7 +402,7 @@ static int snd_als300_playback_prepare(struct snd_pcm_substream *substream)
 	unsigned short period_bytes = snd_pcm_lib_period_bytes(substream);
 	unsigned short buffer_bytes = snd_pcm_lib_buffer_bytes(substream);
 	
-	spin_lock_irq(&chip->reg_lock);
+	guard(spinlock_irq)(&chip->reg_lock);
 	tmp = snd_als300_gcr_read(chip->port, PLAYBACK_CONTROL);
 	tmp &= ~TRANSFER_START;
 
@@ -419,7 +419,6 @@ static int snd_als300_playback_prepare(struct snd_pcm_substream *substream)
 					runtime->dma_addr);
 	snd_als300_gcr_write(chip->port, PLAYBACK_END,
 					runtime->dma_addr + buffer_bytes - 1);
-	spin_unlock_irq(&chip->reg_lock);
 	return 0;
 }
 
@@ -431,7 +430,7 @@ static int snd_als300_capture_prepare(struct snd_pcm_substream *substream)
 	unsigned short period_bytes = snd_pcm_lib_period_bytes(substream);
 	unsigned short buffer_bytes = snd_pcm_lib_buffer_bytes(substream);
 
-	spin_lock_irq(&chip->reg_lock);
+	guard(spinlock_irq)(&chip->reg_lock);
 	tmp = snd_als300_gcr_read(chip->port, RECORD_CONTROL);
 	tmp &= ~TRANSFER_START;
 
@@ -448,7 +447,6 @@ static int snd_als300_capture_prepare(struct snd_pcm_substream *substream)
 					runtime->dma_addr);
 	snd_als300_gcr_write(chip->port, RECORD_END,
 					runtime->dma_addr + buffer_bytes - 1);
-	spin_unlock_irq(&chip->reg_lock);
 	return 0;
 }
 
@@ -463,7 +461,7 @@ static int snd_als300_trigger(struct snd_pcm_substream *substream, int cmd)
 	data = substream->runtime->private_data;
 	reg = data->control_register;
 
-	spin_lock(&chip->reg_lock);
+	guard(spinlock)(&chip->reg_lock);
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
@@ -492,7 +490,6 @@ static int snd_als300_trigger(struct snd_pcm_substream *substream, int cmd)
 		snd_als300_dbgplay("TRIGGER INVALID\n");
 		ret = -EINVAL;
 	}
-	spin_unlock(&chip->reg_lock);
 	return ret;
 }
 
@@ -506,10 +503,10 @@ static snd_pcm_uframes_t snd_als300_pointer(struct snd_pcm_substream *substream)
 	data = substream->runtime->private_data;
 	period_bytes = snd_pcm_lib_period_bytes(substream);
 	
-	spin_lock(&chip->reg_lock);
-	current_ptr = (u16) snd_als300_gcr_read(chip->port,
-					data->block_counter_register) + 4;
-	spin_unlock(&chip->reg_lock);
+	scoped_guard(spinlock, &chip->reg_lock) {
+		current_ptr = (u16) snd_als300_gcr_read(chip->port,
+							data->block_counter_register) + 4;
+	}
 	if (current_ptr > period_bytes)
 		current_ptr = 0;
 	else
@@ -563,10 +560,9 @@ static int snd_als300_new_pcm(struct snd_als300 *chip)
 
 static void snd_als300_init(struct snd_als300 *chip)
 {
-	unsigned long flags;
 	u32 tmp;
 	
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	chip->revision = (snd_als300_gcr_read(chip->port, MISC_CONTROL) >> 16)
 								& 0x0000000F;
 	/* Setup DRAM */
@@ -591,7 +587,6 @@ static void snd_als300_init(struct snd_als300 *chip)
 	tmp = snd_als300_gcr_read(chip->port, PLAYBACK_CONTROL);
 	snd_als300_gcr_write(chip->port, PLAYBACK_CONTROL,
 			tmp & ~TRANSFER_START);
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 }
 
 static int snd_als300_create(struct snd_card *card,
-- 
2.50.1

