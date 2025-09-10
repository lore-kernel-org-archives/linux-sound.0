Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22E5317712
	for <linux-sound@vger.kernel.org>; Wed, 10 Sep 2025 11:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757502636; cv=none; b=upB45qZm2BMtzXxXOOqPRM2yld4Whou/OXsg+VXOrr29Fm/kcqmSN0a6Os2wT5OhFguS2I+AgR2XnUvpXmDjHLqNZqGAYNhU7LY2H74Pxv8EDKF86wV1ocIcxx8ohG9diWMlG5C67ozaTNe3mj/8vaD7bEtI5zEO9MHTlWXqPZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757502636; c=relaxed/simple;
	bh=ztetWOMAN0ZNxAsZJ+k5Bm6a6HeNlAZzCexnyC7/Y98=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ir69gKfMovPXdKf+mv6J9uiQ+SZt2PcZducYWcWmBghFK+DmQhYxkgEZA6tdZfb80QX1BLodZ9BN8J3NPTynK45mNkAGmsMC5L8kSlSQSgghrE5ZymVxj2VAsP4hirRS27OSUq+pW8KIR0WiYaw5Gse7rM6L6MPvB7fNJJNTLDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=smyQrPYR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=N0oFnE9E; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=smyQrPYR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=N0oFnE9E; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="smyQrPYR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="N0oFnE9E";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="smyQrPYR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="N0oFnE9E"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 57250378D1;
	Wed, 10 Sep 2025 11:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1757502586; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MBCl+skfxiry+8Ni4H1YPhWKZKxYClmwDlMCYmj0KdY=;
	b=smyQrPYRbUC1vsEC/uVCRuEjrpwFeZ77LYcKwP74bj9616MeAkjDWS7jO5az2soKWhgk6f
	cmzfGvjJmBaZXGQJDAgh9srwfnFp0ElCPq3YExSUTKrBI/EBfnraGm7ayNxUhkr4iUfR9b
	LRs/v4T9ocIV+Qa1wYxCbWzkDoqkX88=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757502586;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MBCl+skfxiry+8Ni4H1YPhWKZKxYClmwDlMCYmj0KdY=;
	b=N0oFnE9ENIH2rN07mijwr1TGazEArAxl+1K7/Eyx35sHwFi3g85QYSqhuBvmg6A8J8PNmd
	287SPPXvUzWCVABg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1757502586; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MBCl+skfxiry+8Ni4H1YPhWKZKxYClmwDlMCYmj0KdY=;
	b=smyQrPYRbUC1vsEC/uVCRuEjrpwFeZ77LYcKwP74bj9616MeAkjDWS7jO5az2soKWhgk6f
	cmzfGvjJmBaZXGQJDAgh9srwfnFp0ElCPq3YExSUTKrBI/EBfnraGm7ayNxUhkr4iUfR9b
	LRs/v4T9ocIV+Qa1wYxCbWzkDoqkX88=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757502586;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MBCl+skfxiry+8Ni4H1YPhWKZKxYClmwDlMCYmj0KdY=;
	b=N0oFnE9ENIH2rN07mijwr1TGazEArAxl+1K7/Eyx35sHwFi3g85QYSqhuBvmg6A8J8PNmd
	287SPPXvUzWCVABg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3F8B513A54;
	Wed, 10 Sep 2025 11:09:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sLdSDnpcwWi+YAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 10 Sep 2025 11:09:46 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 12/14] ALSA: sparc/amd7930: Use guard() for spin locks
Date: Wed, 10 Sep 2025 13:09:27 +0200
Message-ID: <20250910110932.15234-13-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250910110932.15234-1-tiwai@suse.de>
References: <20250910110932.15234-1-tiwai@suse.de>
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
 sound/sparc/amd7930.c | 110 +++++++++++++++++-------------------------
 1 file changed, 43 insertions(+), 67 deletions(-)

diff --git a/sound/sparc/amd7930.c b/sound/sparc/amd7930.c
index e73d3b262f57..da04ed5cbac4 100644
--- a/sound/sparc/amd7930.c
+++ b/sound/sparc/amd7930.c
@@ -346,34 +346,25 @@ static struct snd_amd7930 *amd7930_list;
 /* Idle the AMD7930 chip.  The amd->lock is not held.  */
 static __inline__ void amd7930_idle(struct snd_amd7930 *amd)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave(&amd->lock, flags);
+	guard(spinlock_irqsave)(&amd->lock);
 	sbus_writeb(AMR_INIT, amd->regs + AMD7930_CR);
 	sbus_writeb(0, amd->regs + AMD7930_DR);
-	spin_unlock_irqrestore(&amd->lock, flags);
 }
 
 /* Enable chip interrupts.  The amd->lock is not held.  */
 static __inline__ void amd7930_enable_ints(struct snd_amd7930 *amd)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave(&amd->lock, flags);
+	guard(spinlock_irqsave)(&amd->lock);
 	sbus_writeb(AMR_INIT, amd->regs + AMD7930_CR);
 	sbus_writeb(AM_INIT_ACTIVE, amd->regs + AMD7930_DR);
-	spin_unlock_irqrestore(&amd->lock, flags);
 }
 
 /* Disable chip interrupts.  The amd->lock is not held.  */
 static __inline__ void amd7930_disable_ints(struct snd_amd7930 *amd)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave(&amd->lock, flags);
+	guard(spinlock_irqsave)(&amd->lock);
 	sbus_writeb(AMR_INIT, amd->regs + AMD7930_CR);
 	sbus_writeb(AM_INIT_ACTIVE | AM_INIT_DISABLE_INTS, amd->regs + AMD7930_DR);
-	spin_unlock_irqrestore(&amd->lock, flags);
 }
 
 /* Commit amd7930_map settings to the hardware.
@@ -497,34 +488,33 @@ static irqreturn_t snd_amd7930_interrupt(int irq, void *dev_id)
 	unsigned int elapsed;
 	u8 ir;
 
-	spin_lock(&amd->lock);
+	scoped_guard(spinlock, &amd->lock) {
+		elapsed = 0;
 
-	elapsed = 0;
+		ir = sbus_readb(amd->regs + AMD7930_IR);
+		if (ir & AMR_IR_BBUF) {
+			u8 byte;
 
-	ir = sbus_readb(amd->regs + AMD7930_IR);
-	if (ir & AMR_IR_BBUF) {
-		u8 byte;
-
-		if (amd->flags & AMD7930_FLAG_PLAYBACK) {
-			if (amd->p_left > 0) {
-				byte = *(amd->p_cur++);
-				amd->p_left--;
-				sbus_writeb(byte, amd->regs + AMD7930_BBTB);
-				if (amd->p_left == 0)
-					elapsed |= AMD7930_FLAG_PLAYBACK;
-			} else
-				sbus_writeb(0, amd->regs + AMD7930_BBTB);
-		} else if (amd->flags & AMD7930_FLAG_CAPTURE) {
-			byte = sbus_readb(amd->regs + AMD7930_BBRB);
-			if (amd->c_left > 0) {
-				*(amd->c_cur++) = byte;
-				amd->c_left--;
-				if (amd->c_left == 0)
-					elapsed |= AMD7930_FLAG_CAPTURE;
+			if (amd->flags & AMD7930_FLAG_PLAYBACK) {
+				if (amd->p_left > 0) {
+					byte = *(amd->p_cur++);
+					amd->p_left--;
+					sbus_writeb(byte, amd->regs + AMD7930_BBTB);
+					if (amd->p_left == 0)
+						elapsed |= AMD7930_FLAG_PLAYBACK;
+				} else
+					sbus_writeb(0, amd->regs + AMD7930_BBTB);
+			} else if (amd->flags & AMD7930_FLAG_CAPTURE) {
+				byte = sbus_readb(amd->regs + AMD7930_BBRB);
+				if (amd->c_left > 0) {
+					*(amd->c_cur++) = byte;
+					amd->c_left--;
+					if (amd->c_left == 0)
+						elapsed |= AMD7930_FLAG_CAPTURE;
+				}
 			}
 		}
 	}
-	spin_unlock(&amd->lock);
 
 	if (elapsed & AMD7930_FLAG_PLAYBACK)
 		snd_pcm_period_elapsed(amd->playback_substream);
@@ -536,10 +526,9 @@ static irqreturn_t snd_amd7930_interrupt(int irq, void *dev_id)
 
 static int snd_amd7930_trigger(struct snd_amd7930 *amd, unsigned int flag, int cmd)
 {
-	unsigned long flags;
 	int result = 0;
 
-	spin_lock_irqsave(&amd->lock, flags);
+	guard(spinlock_irqsave)(&amd->lock);
 	if (cmd == SNDRV_PCM_TRIGGER_START) {
 		if (!(amd->flags & flag)) {
 			amd->flags |= flag;
@@ -559,7 +548,6 @@ static int snd_amd7930_trigger(struct snd_amd7930 *amd, unsigned int flag, int c
 	} else {
 		result = -EINVAL;
 	}
-	spin_unlock_irqrestore(&amd->lock, flags);
 
 	return result;
 }
@@ -583,10 +571,9 @@ static int snd_amd7930_playback_prepare(struct snd_pcm_substream *substream)
 	struct snd_amd7930 *amd = snd_pcm_substream_chip(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	unsigned int size = snd_pcm_lib_buffer_bytes(substream);
-	unsigned long flags;
 	u8 new_mmr1;
 
-	spin_lock_irqsave(&amd->lock, flags);
+	guard(spinlock_irqsave)(&amd->lock);
 
 	amd->flags |= AMD7930_FLAG_PLAYBACK;
 
@@ -605,8 +592,6 @@ static int snd_amd7930_playback_prepare(struct snd_pcm_substream *substream)
 		__amd7930_update_map(amd);
 	}
 
-	spin_unlock_irqrestore(&amd->lock, flags);
-
 	return 0;
 }
 
@@ -615,10 +600,9 @@ static int snd_amd7930_capture_prepare(struct snd_pcm_substream *substream)
 	struct snd_amd7930 *amd = snd_pcm_substream_chip(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	unsigned int size = snd_pcm_lib_buffer_bytes(substream);
-	unsigned long flags;
 	u8 new_mmr1;
 
-	spin_lock_irqsave(&amd->lock, flags);
+	guard(spinlock_irqsave)(&amd->lock);
 
 	amd->flags |= AMD7930_FLAG_CAPTURE;
 
@@ -637,8 +621,6 @@ static int snd_amd7930_capture_prepare(struct snd_pcm_substream *substream)
 		__amd7930_update_map(amd);
 	}
 
-	spin_unlock_irqrestore(&amd->lock, flags);
-
 	return 0;
 }
 
@@ -805,7 +787,6 @@ static int snd_amd7930_get_volume(struct snd_kcontrol *kctl, struct snd_ctl_elem
 static int snd_amd7930_put_volume(struct snd_kcontrol *kctl, struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_amd7930 *amd = snd_kcontrol_chip(kctl);
-	unsigned long flags;
 	int type = kctl->private_value;
 	int *swval, change;
 
@@ -822,7 +803,7 @@ static int snd_amd7930_put_volume(struct snd_kcontrol *kctl, struct snd_ctl_elem
 		break;
 	}
 
-	spin_lock_irqsave(&amd->lock, flags);
+	guard(spinlock_irqsave)(&amd->lock);
 
 	if (*swval != ucontrol->value.integer.value[0]) {
 		*swval = ucontrol->value.integer.value[0] & 0xff;
@@ -831,8 +812,6 @@ static int snd_amd7930_put_volume(struct snd_kcontrol *kctl, struct snd_ctl_elem
 	} else
 		change = 0;
 
-	spin_unlock_irqrestore(&amd->lock, flags);
-
 	return change;
 }
 
@@ -921,7 +900,6 @@ static int snd_amd7930_create(struct snd_card *card,
 			      struct snd_amd7930 **ramd)
 {
 	struct snd_amd7930 *amd;
-	unsigned long flags;
 	int err;
 
 	*ramd = NULL;
@@ -955,25 +933,23 @@ static int snd_amd7930_create(struct snd_card *card,
 
 	amd7930_enable_ints(amd);
 
-	spin_lock_irqsave(&amd->lock, flags);
+	scoped_guard(spinlock_irqsave, &amd->lock) {
+		amd->rgain = 128;
+		amd->pgain = 200;
+		amd->mgain = 0;
 
-	amd->rgain = 128;
-	amd->pgain = 200;
-	amd->mgain = 0;
+		memset(&amd->map, 0, sizeof(amd->map));
+		amd->map.mmr1 = (AM_MAP_MMR1_GX | AM_MAP_MMR1_GER |
+				 AM_MAP_MMR1_GR | AM_MAP_MMR1_STG);
+		amd->map.mmr2 = (AM_MAP_MMR2_LS | AM_MAP_MMR2_AINB);
 
-	memset(&amd->map, 0, sizeof(amd->map));
-	amd->map.mmr1 = (AM_MAP_MMR1_GX | AM_MAP_MMR1_GER |
-			 AM_MAP_MMR1_GR | AM_MAP_MMR1_STG);
-	amd->map.mmr2 = (AM_MAP_MMR2_LS | AM_MAP_MMR2_AINB);
+		__amd7930_update_map(amd);
 
-	__amd7930_update_map(amd);
-
-	/* Always MUX audio (Ba) to channel Bb. */
-	sbus_writeb(AMR_MUX_MCR1, amd->regs + AMD7930_CR);
-	sbus_writeb(AM_MUX_CHANNEL_Ba | (AM_MUX_CHANNEL_Bb << 4),
-		    amd->regs + AMD7930_DR);
-
-	spin_unlock_irqrestore(&amd->lock, flags);
+		/* Always MUX audio (Ba) to channel Bb. */
+		sbus_writeb(AMR_MUX_MCR1, amd->regs + AMD7930_CR);
+		sbus_writeb(AM_MUX_CHANNEL_Ba | (AM_MUX_CHANNEL_Bb << 4),
+			    amd->regs + AMD7930_DR);
+	}
 
 	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL,
 			     amd, &snd_amd7930_dev_ops);
-- 
2.50.1

