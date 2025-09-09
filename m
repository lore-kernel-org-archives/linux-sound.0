Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7CB32CF9E
	for <linux-sound@vger.kernel.org>; Tue,  9 Sep 2025 12:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757421831; cv=none; b=Ubd7GJD/27ztMcEwZhPhDrlEuM4B5hnkhBZ8TIG0eUxS7hP7LIqbo/QbeY9sz4iQNUHunk21srjxnp4zPKd2mLOYYhcQHhQ4gW+jmZtW+wTFtjPRU8AmiEZfIRof39sTBVEHA/RC8PnyGIWhbRDBfwIprnrPZY9qT6A6v3oi3Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757421831; c=relaxed/simple;
	bh=svC4U/+exgB/AP1mduH548qlIBSJOsU0wFn3sQVd8m8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L5xYs4YGfyrcThmvjrG9g69hS6/9TA+oMND+Rd88AeyqWg0aTY1Es4Du685KtkpI1iBMRDHfaUZbsL9/FPGUZQfr5nY0FJeFbw3IQsExYGytA2zj9Y+ORWIkVdZjuYJ/8naZPQqWwGD0TnSo3s6ax0/nkVAKWIN+Zq7Ie7FVNqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iksDbm8P; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1sX70IQR; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iksDbm8P; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1sX70IQR; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iksDbm8P";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1sX70IQR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iksDbm8P";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1sX70IQR"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 81D121FE46;
	Tue,  9 Sep 2025 12:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1757421814; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BviOaVl/r3fSIkzs6B2dSjP+Qxl4DVL/02G4oMlccRc=;
	b=iksDbm8PHmYKa+q+EyiqeYAe80HivQQxY33HQ1bdozXtqYogkyEAiMlsL5lTc99x4FAyhV
	C6JDMKcnz6i1fndczz3Ve1qFmxWEbH544gyUyszKt9bsXMk4FQBbIsu+21pfm9sqA9ULT4
	LXQ/FteEmACHlhffDH8plpEBeXXzHPo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757421814;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BviOaVl/r3fSIkzs6B2dSjP+Qxl4DVL/02G4oMlccRc=;
	b=1sX70IQRp976zfiftcQ9uvsTj42K870M9QZ93VYR42Xp/Rahf4UvHsDtxJDstPyAzpHvWt
	Bb/h247XqnvUzpBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=iksDbm8P;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=1sX70IQR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1757421814; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BviOaVl/r3fSIkzs6B2dSjP+Qxl4DVL/02G4oMlccRc=;
	b=iksDbm8PHmYKa+q+EyiqeYAe80HivQQxY33HQ1bdozXtqYogkyEAiMlsL5lTc99x4FAyhV
	C6JDMKcnz6i1fndczz3Ve1qFmxWEbH544gyUyszKt9bsXMk4FQBbIsu+21pfm9sqA9ULT4
	LXQ/FteEmACHlhffDH8plpEBeXXzHPo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757421814;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BviOaVl/r3fSIkzs6B2dSjP+Qxl4DVL/02G4oMlccRc=;
	b=1sX70IQRp976zfiftcQ9uvsTj42K870M9QZ93VYR42Xp/Rahf4UvHsDtxJDstPyAzpHvWt
	Bb/h247XqnvUzpBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 735AD1388C;
	Tue,  9 Sep 2025 12:43:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GAuUG/YgwGi6TgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 09 Sep 2025 12:43:34 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 04/14] ALSA: sgio2audio: Use guard() for spin locks
Date: Tue,  9 Sep 2025 14:43:24 +0200
Message-ID: <20250909124331.10670-5-tiwai@suse.de>
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
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 81D121FE46
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
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

