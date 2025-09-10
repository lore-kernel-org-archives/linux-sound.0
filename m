Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AF531C572
	for <linux-sound@vger.kernel.org>; Wed, 10 Sep 2025 11:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757502602; cv=none; b=ZymoTr+MEzynQnd+Adq/m7BQ1SWxH/KWBZRAtFWA4iBwnvMI8KdQTKV7JcQ4ekL8cRr8W9XOIlVWLIaduEEp+qL7xLuaIGFlgsz2bhTx1jNb5H73PPsJAW3fZt/klh1xraGrLNnjXe3GjYE7g9srdMKhbisQ7c+drv6vf6LfbrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757502602; c=relaxed/simple;
	bh=A68IQZPJJB6T1x387jl8XpQ4i4ULLXijfEik4RM85qk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p5kN76/ocXLdpLxS0pmDL80uS3IhvEUJ9gs6nrgRLLIKN78oNYkk7pIe3tR+N8UnMew7n8t2YMfAAuS/FV0W68QKOGiXMoZP0bsQK6zl34AbX/z6lYyNnenZysk2meI2ZM//kLNv4oxk+rWdRlR5skkVX+HW3DDEFjlJrbyQwzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RUTgM8bY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ihFwMv9P; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RUTgM8bY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ihFwMv9P; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RUTgM8bY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ihFwMv9P";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RUTgM8bY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ihFwMv9P"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 68E6C37846;
	Wed, 10 Sep 2025 11:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1757502585; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TcxlmVq53m+wGts9FZb7PKLQgU5ZD7goVhuRBo6gA/E=;
	b=RUTgM8bYNCmh3vn6sOWimuv56b9/oq27fctJAcx9QFEz4t7p4+4f015oPU9HqE2n43Af11
	Fyk70vxSaGocLht6vXS9nqJxQtn/3vJp5K55tf44ebvRW3Mn0ZQrfK5gCcux886bzj34mq
	gHw/RotD1J2mAPg8CllQfYnCoLxNt0U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757502585;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TcxlmVq53m+wGts9FZb7PKLQgU5ZD7goVhuRBo6gA/E=;
	b=ihFwMv9PdNJrngMLigi8chf/Qa1tSFlm/gwjhLOaZARkcMZwZEw3UyzS6BWn7p94prCwgv
	8/315nQRG0dwKICg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1757502585; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TcxlmVq53m+wGts9FZb7PKLQgU5ZD7goVhuRBo6gA/E=;
	b=RUTgM8bYNCmh3vn6sOWimuv56b9/oq27fctJAcx9QFEz4t7p4+4f015oPU9HqE2n43Af11
	Fyk70vxSaGocLht6vXS9nqJxQtn/3vJp5K55tf44ebvRW3Mn0ZQrfK5gCcux886bzj34mq
	gHw/RotD1J2mAPg8CllQfYnCoLxNt0U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757502585;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TcxlmVq53m+wGts9FZb7PKLQgU5ZD7goVhuRBo6gA/E=;
	b=ihFwMv9PdNJrngMLigi8chf/Qa1tSFlm/gwjhLOaZARkcMZwZEw3UyzS6BWn7p94prCwgv
	8/315nQRG0dwKICg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5068813301;
	Wed, 10 Sep 2025 11:09:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eGp5EnlcwWi+YAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 10 Sep 2025 11:09:45 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 05/14] ALSA: snd-n64: Use guard() for spin locks
Date: Wed, 10 Sep 2025 13:09:20 +0200
Message-ID: <20250910110932.15234-6-tiwai@suse.de>
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
 sound/mips/snd-n64.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/sound/mips/snd-n64.c b/sound/mips/snd-n64.c
index e1b2ff65d850..f17e63f2ff5a 100644
--- a/sound/mips/snd-n64.c
+++ b/sound/mips/snd-n64.c
@@ -81,10 +81,9 @@ static u32 n64mi_read_reg(struct n64audio *priv, const u8 reg)
 static void n64audio_push(struct n64audio *priv)
 {
 	struct snd_pcm_runtime *runtime = priv->chan.substream->runtime;
-	unsigned long flags;
 	u32 count;
 
-	spin_lock_irqsave(&priv->chan.lock, flags);
+	guard(spinlock_irqsave)(&priv->chan.lock);
 
 	count = priv->chan.writesize;
 
@@ -104,15 +103,12 @@ static void n64audio_push(struct n64audio *priv)
 	priv->chan.nextpos %= priv->chan.bufsize;
 
 	runtime->delay = runtime->period_size;
-
-	spin_unlock_irqrestore(&priv->chan.lock, flags);
 }
 
 static irqreturn_t n64audio_isr(int irq, void *dev_id)
 {
 	struct n64audio *priv = dev_id;
 	const u32 intrs = n64mi_read_reg(priv, MI_INTR_REG);
-	unsigned long flags;
 
 	// Check it's ours
 	if (!(intrs & MI_INTR_AI))
@@ -121,11 +117,9 @@ static irqreturn_t n64audio_isr(int irq, void *dev_id)
 	n64audio_write_reg(priv, AI_STATUS_REG, 1);
 
 	if (priv->chan.substream && snd_pcm_running(priv->chan.substream)) {
-		spin_lock_irqsave(&priv->chan.lock, flags);
-
-		priv->chan.pos = priv->chan.nextpos;
-
-		spin_unlock_irqrestore(&priv->chan.lock, flags);
+		scoped_guard(spinlock_irqsave, &priv->chan.lock) {
+			priv->chan.pos = priv->chan.nextpos;
+		}
 
 		snd_pcm_period_elapsed(priv->chan.substream);
 		if (priv->chan.substream && snd_pcm_running(priv->chan.substream))
@@ -221,7 +215,7 @@ static int n64audio_pcm_prepare(struct snd_pcm_substream *substream)
 		rate = 16;
 	n64audio_write_reg(priv, AI_BITCLOCK_REG, rate - 1);
 
-	spin_lock_irq(&priv->chan.lock);
+	guard(spinlock_irq)(&priv->chan.lock);
 
 	/* Setup the pseudo-dma transfer pointers.  */
 	priv->chan.pos = 0;
@@ -230,7 +224,6 @@ static int n64audio_pcm_prepare(struct snd_pcm_substream *substream)
 	priv->chan.writesize = snd_pcm_lib_period_bytes(substream);
 	priv->chan.bufsize = snd_pcm_lib_buffer_bytes(substream);
 
-	spin_unlock_irq(&priv->chan.lock);
 	return 0;
 }
 
-- 
2.50.1

