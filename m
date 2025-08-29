Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A222135CE
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 15:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756480084; cv=none; b=iLRfZiyKZARMo0A9S1I3a2LNl0e24DaOUQWARR1qJ5klpHAKYm6WQ9hpNrg5CjBEjuW/Wyd3j43bxuUqB92FjZjv2cVGy1OvN/9L6oOt3fAkWRtALktGSxX9Ym4KL3uL9yA0DFV+YFtMwwYJ9ZEJXKUpRJSLetBuvE1b8pfgpW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756480084; c=relaxed/simple;
	bh=oB4lp0UndFr2rRD1h5rAMKgKHJMTu8DJdht4Bs5EQr8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IYSQttPLuU+b5GRlbgE4lOdU/Bh8m/3qVUJWekJXI5J2UlA6KmP1x0wNuTXId7ogpXzD8lwN+qUuFmTBIDMBuotMt19XA3wwQWNmVZXgL5XS2EQfd8cOakd4tc4ihCtHumg+Pvvq4BcrILNay9YYmIIne+EAmmFbpyBh4LTKR0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Lc1g67ka; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dAaH4WDZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NdEYM71Y; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=v7179WgE; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Lc1g67ka";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dAaH4WDZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NdEYM71Y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="v7179WgE"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EABBF33EF7;
	Fri, 29 Aug 2025 15:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756480055; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5HBtmeeR/kkAJvKA2z7LOTVMLLoqOWEOp1GwAxWSZNY=;
	b=Lc1g67kaypj5fR6RQbl4K1bOXYIDZKJ/GhDHALonPrmdsmKU4pytf4gKnNHF6uXPfAW3+o
	STqmlriL0Qz4DyW1yMBIBso/qgyDZRvrUwLt4Px8enoVYgMone6IHsdCh+PhlpA2uXjyS4
	a9mWh6OF5dVVQtxet3XyOZTEHHOiRSE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756480055;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5HBtmeeR/kkAJvKA2z7LOTVMLLoqOWEOp1GwAxWSZNY=;
	b=dAaH4WDZO+MYNCnaTs6FRFHhFf6xFqsPWFsnJLPicgKOYK0UOjlylyzeuCn/DjcLRha1Tx
	DdycEAvjB6b4juDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=NdEYM71Y;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=v7179WgE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756480054; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5HBtmeeR/kkAJvKA2z7LOTVMLLoqOWEOp1GwAxWSZNY=;
	b=NdEYM71YGuzMG/vrJzQ3Z9jlwKa96j39PGS9EibKGG+gLxi8Nv0i/8fSD9t7w+YZ9G8TlV
	6KLBYk3ynt5gdjkXlc8jp516iQtZRHIONMAoNCE/y+UCVOGMyB4+lMhJYeb+iAAOhsMRRP
	qVByVw7RKV4hzoKzaREBq0KrNL8Km1M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756480054;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5HBtmeeR/kkAJvKA2z7LOTVMLLoqOWEOp1GwAxWSZNY=;
	b=v7179WgE5SfGlOQ+t4sFYlUegi65AoK7TsdxMPA0PZnx2Qc+GP7FmipL5mdSwPcNa9czgj
	5ZW0BWlWYSamTbAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D06E513A54;
	Fri, 29 Aug 2025 15:07:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cHBXMTbCsWjMHwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 15:07:34 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 5/9] ALSA: hiface: Use guard() for spin locks
Date: Fri, 29 Aug 2025 17:07:13 +0200
Message-ID: <20250829150724.6886-6-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829150724.6886-1-tiwai@suse.de>
References: <20250829150724.6886-1-tiwai@suse.de>
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
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_NONE(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim,suse.de:email];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: EABBF33EF7
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Clean up the code using guard() for spin locks.

Merely code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/hiface/pcm.c | 35 ++++++++++++++---------------------
 1 file changed, 14 insertions(+), 21 deletions(-)

diff --git a/sound/usb/hiface/pcm.c b/sound/usb/hiface/pcm.c
index f992e94feb64..27cd427fbaa5 100644
--- a/sound/usb/hiface/pcm.c
+++ b/sound/usb/hiface/pcm.c
@@ -305,7 +305,6 @@ static void hiface_pcm_out_urb_handler(struct urb *usb_urb)
 	struct pcm_runtime *rt = out_urb->chip->pcm;
 	struct pcm_substream *sub;
 	bool do_period_elapsed = false;
-	unsigned long flags;
 	int ret;
 
 	if (rt->panic || rt->stream_state == STREAM_STOPPING)
@@ -325,13 +324,12 @@ static void hiface_pcm_out_urb_handler(struct urb *usb_urb)
 
 	/* now send our playback data (if a free out urb was found) */
 	sub = &rt->playback;
-	spin_lock_irqsave(&sub->lock, flags);
-	if (sub->active)
-		do_period_elapsed = hiface_pcm_playback(sub, out_urb);
-	else
-		memset(out_urb->buffer, 0, PCM_PACKET_SIZE);
-
-	spin_unlock_irqrestore(&sub->lock, flags);
+	scoped_guard(spinlock_irqsave, &sub->lock) {
+		if (sub->active)
+			do_period_elapsed = hiface_pcm_playback(sub, out_urb);
+		else
+			memset(out_urb->buffer, 0, PCM_PACKET_SIZE);
+	}
 
 	if (do_period_elapsed)
 		snd_pcm_period_elapsed(sub->instance);
@@ -389,7 +387,6 @@ static int hiface_pcm_close(struct snd_pcm_substream *alsa_sub)
 {
 	struct pcm_runtime *rt = snd_pcm_substream_chip(alsa_sub);
 	struct pcm_substream *sub = hiface_pcm_get_substream(alsa_sub);
-	unsigned long flags;
 
 	if (rt->panic)
 		return 0;
@@ -399,11 +396,9 @@ static int hiface_pcm_close(struct snd_pcm_substream *alsa_sub)
 		hiface_pcm_stream_stop(rt);
 
 		/* deactivate substream */
-		spin_lock_irqsave(&sub->lock, flags);
+		guard(spinlock_irqsave)(&sub->lock);
 		sub->instance = NULL;
 		sub->active = false;
-		spin_unlock_irqrestore(&sub->lock, flags);
-
 	}
 	return 0;
 }
@@ -452,16 +447,16 @@ static int hiface_pcm_trigger(struct snd_pcm_substream *alsa_sub, int cmd)
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		spin_lock_irq(&sub->lock);
-		sub->active = true;
-		spin_unlock_irq(&sub->lock);
+		scoped_guard(spinlock_irq, &sub->lock) {
+			sub->active = true;
+		}
 		return 0;
 
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		spin_lock_irq(&sub->lock);
-		sub->active = false;
-		spin_unlock_irq(&sub->lock);
+		scoped_guard(spinlock_irq, &sub->lock) {
+			sub->active = false;
+		}
 		return 0;
 
 	default:
@@ -473,15 +468,13 @@ static snd_pcm_uframes_t hiface_pcm_pointer(struct snd_pcm_substream *alsa_sub)
 {
 	struct pcm_substream *sub = hiface_pcm_get_substream(alsa_sub);
 	struct pcm_runtime *rt = snd_pcm_substream_chip(alsa_sub);
-	unsigned long flags;
 	snd_pcm_uframes_t dma_offset;
 
 	if (rt->panic || !sub)
 		return SNDRV_PCM_POS_XRUN;
 
-	spin_lock_irqsave(&sub->lock, flags);
+	guard(spinlock_irqsave)(&sub->lock);
 	dma_offset = sub->dma_off;
-	spin_unlock_irqrestore(&sub->lock, flags);
 	return bytes_to_frames(alsa_sub->runtime, dma_offset);
 }
 
-- 
2.50.1

