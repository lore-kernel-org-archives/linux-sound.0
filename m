Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE023203A3
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756479214; cv=none; b=GagthUdSaQoNqcdmk27JqxhuTFurmzw8T71IX8q6jC++MjcRV5u/Is1Rkcdadi0SiRlizcxQuWYCxSHcZXLjBDjIj4QPBUnzc6RKBtfRTwxC5P9VNcnOrJdkFWrijd7P4UI9pi0RtCgD0/m3pAYfHFZgSl+8q52s2BgYgmzzuS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756479214; c=relaxed/simple;
	bh=cO/8PobtsJk9jwu5iK0dhwzECSIjhKZEH3PwHK6u5T4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sF16ay35TsQN3xtJM+oE2ugZWAw321TxPLKNd0/oXf3raGn7igIdJsxOkL/TMATSERclWynOoPWvpOU/ylezWfumim4Tj+U4sNBWKFm+AvoY3F5bG+id9kQqpV/bOVEOeuHjvlELMUkAeuO+WyH/aJQSr1GVrs80OWRThOYGNfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wJXjTiBn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Sn61NGPd; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wJXjTiBn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Sn61NGPd; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wJXjTiBn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Sn61NGPd";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wJXjTiBn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Sn61NGPd"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E030322775;
	Fri, 29 Aug 2025 14:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756479191; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0DbyDGUKUDsl7rqXKKuDjASPo7qAbkbvMGJm8EBbWt4=;
	b=wJXjTiBnA5HnOElzSneZxsbzMc62f9U3F5mWTxrwvcNfIzXxxa8R4opl7jAilzFpz6CMw+
	j9gIC0UOVn6RrSF8iYXKbloDsXhSaQAAhTfeQNwKZexf61ze95T7++tZye11psz/onR/Bt
	bjrfpbBvJNCm5SQxojRoSC2X/VYU54g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756479191;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0DbyDGUKUDsl7rqXKKuDjASPo7qAbkbvMGJm8EBbWt4=;
	b=Sn61NGPdUJpTsCcoi1MNZ5g/NJd1UI20BcRItcpZsJxdM0bpZL++/GKPOkj8cGcZR5cToE
	HwmfLZbEpWsN/1AQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756479191; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0DbyDGUKUDsl7rqXKKuDjASPo7qAbkbvMGJm8EBbWt4=;
	b=wJXjTiBnA5HnOElzSneZxsbzMc62f9U3F5mWTxrwvcNfIzXxxa8R4opl7jAilzFpz6CMw+
	j9gIC0UOVn6RrSF8iYXKbloDsXhSaQAAhTfeQNwKZexf61ze95T7++tZye11psz/onR/Bt
	bjrfpbBvJNCm5SQxojRoSC2X/VYU54g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756479191;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0DbyDGUKUDsl7rqXKKuDjASPo7qAbkbvMGJm8EBbWt4=;
	b=Sn61NGPdUJpTsCcoi1MNZ5g/NJd1UI20BcRItcpZsJxdM0bpZL++/GKPOkj8cGcZR5cToE
	HwmfLZbEpWsN/1AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C58A713A54;
	Fri, 29 Aug 2025 14:53:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wNgKL9e+sWhzGwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:53:11 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 09/18] ALSA: msnd: Use guard() for spin locks
Date: Fri, 29 Aug 2025 16:52:49 +0200
Message-ID: <20250829145300.5460-10-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829145300.5460-1-tiwai@suse.de>
References: <20250829145300.5460-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

Clean up the code using guard() for spin locks.

Merely code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/msnd/msnd.c                | 29 ++++++++--------------------
 sound/isa/msnd/msnd_pinnacle.c       | 11 +++++------
 sound/isa/msnd/msnd_pinnacle_mixer.c |  8 ++------
 3 files changed, 15 insertions(+), 33 deletions(-)

diff --git a/sound/isa/msnd/msnd.c b/sound/isa/msnd/msnd.c
index 8c1d2e27854b..5e350234d572 100644
--- a/sound/isa/msnd/msnd.c
+++ b/sound/isa/msnd/msnd.c
@@ -76,15 +76,11 @@ static int snd_msnd_wait_HC0(struct snd_msnd *dev)
 
 int snd_msnd_send_dsp_cmd(struct snd_msnd *dev, u8 cmd)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave(&dev->lock, flags);
+	guard(spinlock_irqsave)(&dev->lock);
 	if (snd_msnd_wait_HC0(dev) == 0) {
 		outb(cmd, dev->io + HP_CVR);
-		spin_unlock_irqrestore(&dev->lock, flags);
 		return 0;
 	}
-	spin_unlock_irqrestore(&dev->lock, flags);
 
 	dev_dbg(dev->card->dev, LOGNAME ": Send DSP command timeout\n");
 
@@ -133,14 +129,12 @@ EXPORT_SYMBOL(snd_msnd_upload_host);
 
 int snd_msnd_enable_irq(struct snd_msnd *dev)
 {
-	unsigned long flags;
-
 	if (dev->irq_ref++)
 		return 0;
 
 	dev_dbg(dev->card->dev, LOGNAME ": Enabling IRQ\n");
 
-	spin_lock_irqsave(&dev->lock, flags);
+	guard(spinlock_irqsave)(&dev->lock);
 	if (snd_msnd_wait_TXDE(dev) == 0) {
 		outb(inb(dev->io + HP_ICR) | HPICR_TREQ, dev->io + HP_ICR);
 		if (dev->type == msndClassic)
@@ -151,10 +145,8 @@ int snd_msnd_enable_irq(struct snd_msnd *dev)
 		enable_irq(dev->irq);
 		snd_msnd_init_queue(dev->DSPQ, dev->dspq_data_buff,
 				    dev->dspq_buff_size);
-		spin_unlock_irqrestore(&dev->lock, flags);
 		return 0;
 	}
-	spin_unlock_irqrestore(&dev->lock, flags);
 
 	dev_dbg(dev->card->dev, LOGNAME ": Enable IRQ failed\n");
 
@@ -164,8 +156,6 @@ EXPORT_SYMBOL(snd_msnd_enable_irq);
 
 int snd_msnd_disable_irq(struct snd_msnd *dev)
 {
-	unsigned long flags;
-
 	if (--dev->irq_ref > 0)
 		return 0;
 
@@ -175,16 +165,14 @@ int snd_msnd_disable_irq(struct snd_msnd *dev)
 
 	dev_dbg(dev->card->dev, LOGNAME ": Disabling IRQ\n");
 
-	spin_lock_irqsave(&dev->lock, flags);
+	guard(spinlock_irqsave)(&dev->lock);
 	if (snd_msnd_wait_TXDE(dev) == 0) {
 		outb(inb(dev->io + HP_ICR) & ~HPICR_RREQ, dev->io + HP_ICR);
 		if (dev->type == msndClassic)
 			outb(HPIRQ_NONE, dev->io + HP_IRQM);
 		disable_irq(dev->irq);
-		spin_unlock_irqrestore(&dev->lock, flags);
 		return 0;
 	}
-	spin_unlock_irqrestore(&dev->lock, flags);
 
 	dev_dbg(dev->card->dev, LOGNAME ": Disable IRQ failed\n");
 
@@ -376,7 +364,6 @@ static void snd_msnd_capture_reset_queue(struct snd_msnd *chip,
 {
 	int		n;
 	void		__iomem *pDAQ;
-	/* unsigned long	flags; */
 
 	/* snd_msnd_init_queue(chip->DARQ, DARQ_DATA_BUFF, DARQ_BUFF_SIZE); */
 
@@ -388,11 +375,11 @@ static void snd_msnd_capture_reset_queue(struct snd_msnd *chip,
 		chip->DARQ + JQS_wTail);
 
 #if 0 /* Critical section: bank 1 access. this is how the OSS driver does it:*/
-	spin_lock_irqsave(&chip->lock, flags);
-	outb(HPBLKSEL_1, chip->io + HP_BLKS);
-	memset_io(chip->mappedbase, 0, DAR_BUFF_SIZE * 3);
-	outb(HPBLKSEL_0, chip->io + HP_BLKS);
-	spin_unlock_irqrestore(&chip->lock, flags);
+	scoped_guard(spinlock_irqsave, &chip->lock) {
+		outb(HPBLKSEL_1, chip->io + HP_BLKS);
+		memset_io(chip->mappedbase, 0, DAR_BUFF_SIZE * 3);
+		outb(HPBLKSEL_0, chip->io + HP_BLKS);
+	}
 #endif
 
 	chip->capturePeriodBytes = pcm_count;
diff --git a/sound/isa/msnd/msnd_pinnacle.c b/sound/isa/msnd/msnd_pinnacle.c
index 969bbb18657b..c4eec391cd29 100644
--- a/sound/isa/msnd/msnd_pinnacle.c
+++ b/sound/isa/msnd/msnd_pinnacle.c
@@ -300,7 +300,6 @@ static int snd_msnd_init_sma(struct snd_msnd *chip)
 {
 	static int initted;
 	u16 mastVolLeft, mastVolRight;
-	unsigned long flags;
 
 #ifdef MSND_CLASSIC
 	outb(chip->memid, chip->io + HP_MEMM);
@@ -317,11 +316,11 @@ static int snd_msnd_init_sma(struct snd_msnd *chip)
 	memset_io(chip->mappedbase, 0, 0x8000);
 
 	/* Critical section: bank 1 access */
-	spin_lock_irqsave(&chip->lock, flags);
-	outb(HPBLKSEL_1, chip->io + HP_BLKS);
-	memset_io(chip->mappedbase, 0, 0x8000);
-	outb(HPBLKSEL_0, chip->io + HP_BLKS);
-	spin_unlock_irqrestore(&chip->lock, flags);
+	scoped_guard(spinlock_irqsave, &chip->lock) {
+		outb(HPBLKSEL_1, chip->io + HP_BLKS);
+		memset_io(chip->mappedbase, 0, 0x8000);
+		outb(HPBLKSEL_0, chip->io + HP_BLKS);
+	}
 
 	/* Digital audio play queue */
 	chip->DAPQ = chip->mappedbase + DAPQ_OFFSET;
diff --git a/sound/isa/msnd/msnd_pinnacle_mixer.c b/sound/isa/msnd/msnd_pinnacle_mixer.c
index 2f1bb5a2b376..ec354483b9f8 100644
--- a/sound/isa/msnd/msnd_pinnacle_mixer.c
+++ b/sound/isa/msnd/msnd_pinnacle_mixer.c
@@ -136,14 +136,12 @@ static int snd_msndmix_volume_get(struct snd_kcontrol *kcontrol,
 {
 	struct snd_msnd *msnd = snd_kcontrol_chip(kcontrol);
 	int addr = kcontrol->private_value;
-	unsigned long flags;
 
-	spin_lock_irqsave(&msnd->mixer_lock, flags);
+	guard(spinlock_irqsave)(&msnd->mixer_lock);
 	ucontrol->value.integer.value[0] = msnd->left_levels[addr] * 100;
 	ucontrol->value.integer.value[0] /= 0xFFFF;
 	ucontrol->value.integer.value[1] = msnd->right_levels[addr] * 100;
 	ucontrol->value.integer.value[1] /= 0xFFFF;
-	spin_unlock_irqrestore(&msnd->mixer_lock, flags);
 	return 0;
 }
 
@@ -253,15 +251,13 @@ static int snd_msndmix_volume_put(struct snd_kcontrol *kcontrol,
 	struct snd_msnd *msnd = snd_kcontrol_chip(kcontrol);
 	int change, addr = kcontrol->private_value;
 	int left, right;
-	unsigned long flags;
 
 	left = ucontrol->value.integer.value[0] % 101;
 	right = ucontrol->value.integer.value[1] % 101;
-	spin_lock_irqsave(&msnd->mixer_lock, flags);
+	guard(spinlock_irqsave)(&msnd->mixer_lock);
 	change = msnd->left_levels[addr] != left
 		|| msnd->right_levels[addr] != right;
 	snd_msndmix_set(msnd, addr, left, right);
-	spin_unlock_irqrestore(&msnd->mixer_lock, flags);
 	return change;
 }
 
-- 
2.50.1

