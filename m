Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA10335BDC
	for <linux-sound@vger.kernel.org>; Tue,  9 Sep 2025 12:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757421830; cv=none; b=hPoUy6OXSmJsYLkct9RAxB/Ikpxjy0eXLgm3A+hps+X0PLwbh51dPn49+t9mQYIBeu6RYqqwztvbCSnmfZqyVNdZpUMcPpUj/H19d4GgAnwxuWzdW97MXvXC6azwP9sM+WlRlCya2+KPdqPetyTu6kesPE4nRBPx5GdxxN4Gsl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757421830; c=relaxed/simple;
	bh=A68IQZPJJB6T1x387jl8XpQ4i4ULLXijfEik4RM85qk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NfzyI9IRuvn6UAGf/46zZJ/iUBu5BPcbPQZ7Kb5Lj+TK9EtwL90f3TRewsgSLF3rQBrK3uL4on3cupDHH5c2IWPDZgFXQKkRg0Uhq+4iNk1UlPnVcBbwO5Cy+Bb4lRMoXtvswNvcKu6h3+mCwI6XFCSf4rEdo4Jsi2su1TaT2Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FH8SMx2f; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Jcyg7nQz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FH8SMx2f; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Jcyg7nQz; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FH8SMx2f";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Jcyg7nQz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FH8SMx2f";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Jcyg7nQz"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 91EF233B09;
	Tue,  9 Sep 2025 12:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1757421814; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TcxlmVq53m+wGts9FZb7PKLQgU5ZD7goVhuRBo6gA/E=;
	b=FH8SMx2fvlPpVNnP/0x6OOgfUgEzwK61G91lQUC5kQAR2pOgxVgRN+vYeJkYFaiVXSkDrC
	uqj7jqV6/llW+gwRkXRp/T8noNORl5L4a0hCVFV1yo9nivLmSbh7HfHKw1+cjrp/V8dXPm
	oF1vlrL8s5NDR0E1ez3Fg3wa72SDObo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757421814;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TcxlmVq53m+wGts9FZb7PKLQgU5ZD7goVhuRBo6gA/E=;
	b=Jcyg7nQznl3ayNBvlFwcgBABeCpYflxRXt6B+lSnaH917nBjCn6snb7dh0YwUsT242jKPU
	CvZLMDLHEn3DLPCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1757421814; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TcxlmVq53m+wGts9FZb7PKLQgU5ZD7goVhuRBo6gA/E=;
	b=FH8SMx2fvlPpVNnP/0x6OOgfUgEzwK61G91lQUC5kQAR2pOgxVgRN+vYeJkYFaiVXSkDrC
	uqj7jqV6/llW+gwRkXRp/T8noNORl5L4a0hCVFV1yo9nivLmSbh7HfHKw1+cjrp/V8dXPm
	oF1vlrL8s5NDR0E1ez3Fg3wa72SDObo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757421814;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TcxlmVq53m+wGts9FZb7PKLQgU5ZD7goVhuRBo6gA/E=;
	b=Jcyg7nQznl3ayNBvlFwcgBABeCpYflxRXt6B+lSnaH917nBjCn6snb7dh0YwUsT242jKPU
	CvZLMDLHEn3DLPCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8109313ABD;
	Tue,  9 Sep 2025 12:43:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YFPxHvYgwGi6TgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 09 Sep 2025 12:43:34 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 05/14] ALSA: snd-n64: Use guard() for spin locks
Date: Tue,  9 Sep 2025 14:43:25 +0200
Message-ID: <20250909124331.10670-6-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250909124331.10670-1-tiwai@suse.de>
References: <20250909124331.10670-1-tiwai@suse.de>
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

