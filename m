Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2452A322A08
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756478804; cv=none; b=chuCoalbucrTU5VhpV7nbNb9m68wSSinibppYo+JAsgCYEx284UwhIkyNUFcr7Fns/6PIE9QSBw1rTS60TpvyBd3d11E/irKbsnDlkCOjVUhqLyXmjr4IHlyR+ZnT6eTMFlvr3lVtkjoqICWwyRAp5N8C0K0Ux9PGieamvPrcO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756478804; c=relaxed/simple;
	bh=t+YuEtQQOCv2UVRkkqb4j/6ws3SBg/oRZJaUWKB1PxM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SP3KL9rRS2MarTr/+Ss1rYy8FYAPmzv6EtNflpxcB6d4h9kn7+0Jvq3XlKoD9UkdcxhBNXfwlKewCORU8CHODqD5x60c+QVd0hvS8H5mUpipq5H8a5N4H7KUgY5QBSa7HO5o+KKDpMj958VeStuDMURBrvVlNpKuHrk3x34qL/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YtJBJb3p; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VEkAHIQn; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YtJBJb3p; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VEkAHIQn; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YtJBJb3p";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VEkAHIQn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YtJBJb3p";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VEkAHIQn"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1C6255C23C;
	Fri, 29 Aug 2025 14:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478642; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5bezFg/mN9RWuj+Z++hPgK/Ha9c/QOYFUHFsYLGx9Gg=;
	b=YtJBJb3pzld+MPMACFLKyCdEGjAHwJ7wtUX5ttJrxY2fFi35BkfF8xdh3COoLPUQD3DDEz
	YrUctOemFPTV8C7dqqp9b/83+S+n7bxm/X6anupAIrGJaxhwf9ohfNJDwaV+ExgAEjmXmJ
	0Mqhi9yTtPlaeraL8I4NTOjHBStc7UU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478642;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5bezFg/mN9RWuj+Z++hPgK/Ha9c/QOYFUHFsYLGx9Gg=;
	b=VEkAHIQnqNG9kMSHXACWs/Wen0A8SAWs7X1xmVoVeoUUTifB0xHtXt4/amJbrA7CU6oyKF
	4Nbm2YXQU849EQCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=YtJBJb3p;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=VEkAHIQn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478642; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5bezFg/mN9RWuj+Z++hPgK/Ha9c/QOYFUHFsYLGx9Gg=;
	b=YtJBJb3pzld+MPMACFLKyCdEGjAHwJ7wtUX5ttJrxY2fFi35BkfF8xdh3COoLPUQD3DDEz
	YrUctOemFPTV8C7dqqp9b/83+S+n7bxm/X6anupAIrGJaxhwf9ohfNJDwaV+ExgAEjmXmJ
	0Mqhi9yTtPlaeraL8I4NTOjHBStc7UU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478642;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5bezFg/mN9RWuj+Z++hPgK/Ha9c/QOYFUHFsYLGx9Gg=;
	b=VEkAHIQnqNG9kMSHXACWs/Wen0A8SAWs7X1xmVoVeoUUTifB0xHtXt4/amJbrA7CU6oyKF
	4Nbm2YXQU849EQCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 04AE913A6A;
	Fri, 29 Aug 2025 14:44:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8CuZO7G8sWi6GAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:44:01 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 42/61] ALSA: maestro3: Use guard() for spin locks
Date: Fri, 29 Aug 2025 16:43:17 +0200
Message-ID: <20250829144342.4290-43-tiwai@suse.de>
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
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim,suse.de:email];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLe1mc1hwayk397878n5a1j337)];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 1C6255C23C
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Clean up the code using guard() for spin locks.

Merely code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/maestro3.c | 23 +++++++----------------
 1 file changed, 7 insertions(+), 16 deletions(-)

diff --git a/sound/pci/maestro3.c b/sound/pci/maestro3.c
index e092097599ff..bddf47a1f263 100644
--- a/sound/pci/maestro3.c
+++ b/sound/pci/maestro3.c
@@ -1096,7 +1096,7 @@ snd_m3_pcm_trigger(struct snd_pcm_substream *subs, int cmd)
 	if (snd_BUG_ON(!s))
 		return -ENXIO;
 
-	spin_lock(&chip->reg_lock);
+	guard(spinlock)(&chip->reg_lock);
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
@@ -1117,7 +1117,6 @@ snd_m3_pcm_trigger(struct snd_pcm_substream *subs, int cmd)
 		}
 		break;
 	}
-	spin_unlock(&chip->reg_lock);
 	return err;
 }
 
@@ -1412,7 +1411,7 @@ snd_m3_pcm_prepare(struct snd_pcm_substream *subs)
 	    runtime->rate < 8000)
 		return -EINVAL;
 
-	spin_lock_irq(&chip->reg_lock);
+	guard(spinlock_irq)(&chip->reg_lock);
 
 	snd_m3_pcm_setup1(chip, s, subs);
 
@@ -1423,8 +1422,6 @@ snd_m3_pcm_prepare(struct snd_pcm_substream *subs)
 
 	snd_m3_pcm_setup2(chip, s, runtime);
 
-	spin_unlock_irq(&chip->reg_lock);
-
 	return 0;
 }
 
@@ -1466,9 +1463,8 @@ snd_m3_pcm_pointer(struct snd_pcm_substream *subs)
 	if (snd_BUG_ON(!s))
 		return 0;
 
-	spin_lock(&chip->reg_lock);
+	guard(spinlock)(&chip->reg_lock);
 	ptr = snd_m3_get_pointer(chip, s, subs);
-	spin_unlock(&chip->reg_lock);
 	return bytes_to_frames(subs->runtime, ptr);
 }
 
@@ -1629,13 +1625,12 @@ static irqreturn_t snd_m3_interrupt(int irq, void *dev_id)
 			if (ctl & DSP2HOST_REQ_TIMER) {
 				outb(DSP2HOST_REQ_TIMER, chip->iobase + ASSP_HOST_INT_STATUS);
 				/* update adc/dac info if it was a timer int */
-				spin_lock(&chip->reg_lock);
+				guard(spinlock)(&chip->reg_lock);
 				for (i = 0; i < chip->num_substreams; i++) {
 					struct m3_dma *s = &chip->substreams[i];
 					if (s->running)
 						snd_m3_update_ptr(chip, s);
 				}
-				spin_unlock(&chip->reg_lock);
 			}
 		}
 	}
@@ -1707,18 +1702,16 @@ snd_m3_substream_open(struct snd_m3 *chip, struct snd_pcm_substream *subs)
 	int i;
 	struct m3_dma *s;
 
-	spin_lock_irq(&chip->reg_lock);
+	guard(spinlock_irq)(&chip->reg_lock);
 	for (i = 0; i < chip->num_substreams; i++) {
 		s = &chip->substreams[i];
 		if (! s->opened)
 			goto __found;
 	}
-	spin_unlock_irq(&chip->reg_lock);
 	return -ENOMEM;
 __found:
 	s->opened = 1;
 	s->running = 0;
-	spin_unlock_irq(&chip->reg_lock);
 
 	subs->runtime->private_data = s;
 	s->substream = subs;
@@ -1742,7 +1735,7 @@ snd_m3_substream_close(struct snd_m3 *chip, struct snd_pcm_substream *subs)
 	if (s == NULL)
 		return; /* not opened properly */
 
-	spin_lock_irq(&chip->reg_lock);
+	guard(spinlock_irq)(&chip->reg_lock);
 	if (s->substream && s->running)
 		snd_m3_pcm_stop(chip, s, s->substream); /* does this happen? */
 	if (s->in_lists) {
@@ -1753,7 +1746,6 @@ snd_m3_substream_close(struct snd_m3 *chip, struct snd_pcm_substream *subs)
 	}
 	s->running = 0;
 	s->opened = 0;
-	spin_unlock_irq(&chip->reg_lock);
 }
 
 static int
@@ -2339,14 +2331,13 @@ static void snd_m3_free(struct snd_card *card)
 	cancel_work_sync(&chip->hwvol_work);
 
 	if (chip->substreams) {
-		spin_lock_irq(&chip->reg_lock);
+		guard(spinlock_irq)(&chip->reg_lock);
 		for (i = 0; i < chip->num_substreams; i++) {
 			s = &chip->substreams[i];
 			/* check surviving pcms; this should not happen though.. */
 			if (s->substream && s->running)
 				snd_m3_pcm_stop(chip, s, s->substream);
 		}
-		spin_unlock_irq(&chip->reg_lock);
 	}
 	if (chip->iobase) {
 		outw(0, chip->iobase + HOST_INT_CTRL); /* disable ints */
-- 
2.50.1

