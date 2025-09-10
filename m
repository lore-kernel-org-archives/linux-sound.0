Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D3E30ACEA
	for <linux-sound@vger.kernel.org>; Wed, 10 Sep 2025 11:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757502596; cv=none; b=hIf4F9yaE2qR/pUGlEN2fotl7+jpKjx7vrkfp3qE7pJpsVuJt3FQOeUJXGDC6UJSpIp2ySVLGbAjHSipXodbPQXoYwsNKIpJqK8kvzSWcPf6TbMGv0Y2UPNujf1M/X+KUR6g28LlXe30rEnKJj5B67B81RD9bPCFfG9/E+AyihU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757502596; c=relaxed/simple;
	bh=svC4U/+exgB/AP1mduH548qlIBSJOsU0wFn3sQVd8m8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ISIPh4/18M65ass2xUfuaLyg7Pfhud7wqOnnE9/ZRsdtgm6Pr2f2RQS3jfsJ6XD8kbjNuKVY2FHxjbCbA87+hAouWeJdJTL+kTge5+5lSS3AdYb8GEbljzQD3wyOmQ5+qr+1pgEILBEAIvESG4xM9IbKNUV7Ezh0KZVD88ol5Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Sw2NQQjM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dAKWgcrR; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Sw2NQQjM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dAKWgcrR; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Sw2NQQjM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dAKWgcrR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Sw2NQQjM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dAKWgcrR"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4E52537838;
	Wed, 10 Sep 2025 11:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1757502585; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BviOaVl/r3fSIkzs6B2dSjP+Qxl4DVL/02G4oMlccRc=;
	b=Sw2NQQjM3C/WOkZ8O2FjCz1v8K+u7dL4LaksIrv5pwg/qTyYUsf6Sovx6krvh/3XoI0nst
	gJp/ly+w2DHG4ZtQCCBqFANJliPb3ifzNoRFRj3PRzy5mJYmdo00r9JBiieICukwvlt5V2
	bMB3fD+QY4DOj3lE/6JSn70M8DNSKsg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757502585;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BviOaVl/r3fSIkzs6B2dSjP+Qxl4DVL/02G4oMlccRc=;
	b=dAKWgcrRlJDHcEpzG6H6fYpkLa4NjV4+LMchrvdS13iTzbva8+ggToegtzptePyVJI0O5e
	HSezBOmHR6yOV0Aw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Sw2NQQjM;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=dAKWgcrR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1757502585; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BviOaVl/r3fSIkzs6B2dSjP+Qxl4DVL/02G4oMlccRc=;
	b=Sw2NQQjM3C/WOkZ8O2FjCz1v8K+u7dL4LaksIrv5pwg/qTyYUsf6Sovx6krvh/3XoI0nst
	gJp/ly+w2DHG4ZtQCCBqFANJliPb3ifzNoRFRj3PRzy5mJYmdo00r9JBiieICukwvlt5V2
	bMB3fD+QY4DOj3lE/6JSn70M8DNSKsg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757502585;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BviOaVl/r3fSIkzs6B2dSjP+Qxl4DVL/02G4oMlccRc=;
	b=dAKWgcrRlJDHcEpzG6H6fYpkLa4NjV4+LMchrvdS13iTzbva8+ggToegtzptePyVJI0O5e
	HSezBOmHR6yOV0Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 317D913ABD;
	Wed, 10 Sep 2025 11:09:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SGPqCnlcwWi+YAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 10 Sep 2025 11:09:45 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 04/14] ALSA: sgio2audio: Use guard() for spin locks
Date: Wed, 10 Sep 2025 13:09:19 +0200
Message-ID: <20250910110932.15234-5-tiwai@suse.de>
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
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 4E52537838
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
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01

Clean up the code using guard() for spin locks.

Merely code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/mips/sgio2audio.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/sound/mips/sgio2audio.c b/sound/mips/sgio2audio.c
index 1af177f25c68..077fdf2181c1 100644
--- a/sound/mips/sgio2audio.c
+++ b/sound/mips/sgio2audio.c
@@ -103,9 +103,8 @@ static int read_ad1843_reg(void *priv, int reg)
 {
 	struct snd_sgio2audio *chip = priv;
 	int val;
-	unsigned long flags;
 
-	spin_lock_irqsave(&chip->ad1843_lock, flags);
+	guard(spinlock_irqsave)(&chip->ad1843_lock);
 
 	writeq((reg << CODEC_CONTROL_ADDRESS_SHIFT) |
 	       CODEC_CONTROL_READ, &mace->perif.audio.codec_control);
@@ -115,7 +114,6 @@ static int read_ad1843_reg(void *priv, int reg)
 
 	val = readq(&mace->perif.audio.codec_read);
 
-	spin_unlock_irqrestore(&chip->ad1843_lock, flags);
 	return val;
 }
 
@@ -126,9 +124,8 @@ static int write_ad1843_reg(void *priv, int reg, int word)
 {
 	struct snd_sgio2audio *chip = priv;
 	int val;
-	unsigned long flags;
 
-	spin_lock_irqsave(&chip->ad1843_lock, flags);
+	guard(spinlock_irqsave)(&chip->ad1843_lock);
 
 	writeq((reg << CODEC_CONTROL_ADDRESS_SHIFT) |
 	       (word << CODEC_CONTROL_WORD_SHIFT),
@@ -137,7 +134,6 @@ static int write_ad1843_reg(void *priv, int reg, int word)
 	val = readq(&mace->perif.audio.codec_control); /* flush bus */
 	udelay(200);
 
-	spin_unlock_irqrestore(&chip->ad1843_lock, flags);
 	return 0;
 }
 
@@ -351,10 +347,9 @@ static int snd_sgio2audio_dma_pull_frag(struct snd_sgio2audio *chip,
 	u64 *src;
 	s16 *dst;
 	u64 x;
-	unsigned long flags;
 	struct snd_pcm_runtime *runtime = chip->channel[ch].substream->runtime;
 
-	spin_lock_irqsave(&chip->channel[ch].lock, flags);
+	guard(spinlock_irqsave)(&chip->channel[ch].lock);
 
 	src_base = (unsigned long) chip->ring_base | (ch << CHANNEL_RING_SHIFT);
 	src_pos = readq(&mace->perif.audio.chan[ch].read_ptr);
@@ -383,7 +378,6 @@ static int snd_sgio2audio_dma_pull_frag(struct snd_sgio2audio *chip,
 	writeq(src_pos, &mace->perif.audio.chan[ch].read_ptr); /* in bytes */
 	chip->channel[ch].pos = dst_pos;
 
-	spin_unlock_irqrestore(&chip->channel[ch].lock, flags);
 	return ret;
 }
 
@@ -399,10 +393,9 @@ static int snd_sgio2audio_dma_push_frag(struct snd_sgio2audio *chip,
 	int src_pos;
 	u64 *dst;
 	s16 *src;
-	unsigned long flags;
 	struct snd_pcm_runtime *runtime = chip->channel[ch].substream->runtime;
 
-	spin_lock_irqsave(&chip->channel[ch].lock, flags);
+	guard(spinlock_irqsave)(&chip->channel[ch].lock);
 
 	dst_base = (unsigned long)chip->ring_base | (ch << CHANNEL_RING_SHIFT);
 	dst_pos = readq(&mace->perif.audio.chan[ch].write_ptr);
@@ -433,7 +426,6 @@ static int snd_sgio2audio_dma_push_frag(struct snd_sgio2audio *chip,
 	writeq(dst_pos, &mace->perif.audio.chan[ch].write_ptr); /* in bytes */
 	chip->channel[ch].pos = src_pos;
 
-	spin_unlock_irqrestore(&chip->channel[ch].lock, flags);
 	return ret;
 }
 
@@ -584,9 +576,8 @@ static int snd_sgio2audio_pcm_prepare(struct snd_pcm_substream *substream)
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_sgio2audio_chan *chan = substream->runtime->private_data;
 	int ch = chan->idx;
-	unsigned long flags;
 
-	spin_lock_irqsave(&chip->channel[ch].lock, flags);
+	guard(spinlock_irqsave)(&chip->channel[ch].lock);
 
 	/* Setup the pseudo-dma transfer pointers.  */
 	chip->channel[ch].pos = 0;
@@ -610,7 +601,6 @@ static int snd_sgio2audio_pcm_prepare(struct snd_pcm_substream *substream)
 				 runtime->channels);
 		break;
 	}
-	spin_unlock_irqrestore(&chip->channel[ch].lock, flags);
 	return 0;
 }
 
-- 
2.50.1

