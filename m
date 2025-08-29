Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10892322A24
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756478641; cv=none; b=LcOZKZ3K2pbUJPtdnRMqnYAvOBCg8GtgUa3/CfNOiFr9DsEGlWPxLCyrfxXeQ0Yt/BcJuqUxYq/QB9lYBEUi5i0FqJUsAetOBTAOspxb38+PRVlI/0aMvNhSLdcz3xsXWf5CboxPMkUQpBruYE0jemefVL5RGPe96ky6ZHTEbok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756478641; c=relaxed/simple;
	bh=lQnYsLH6wWWJbDKzIAilOuhh6K9Wzg4uh6depabMdIA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OfZ8h40uc2V02knwqzEvtcH7TqefHCxiLKPwBJq2FU8mlpcGVtbK0khxMP+7gTNuGWr6C1o2YE4Asmsa9k5vg9JmwoK9cbGNGFK3DaZ9aZZnwgTPk4MoQ5L2Xl5bE/ImLxMyeNlFgxmnFbddKAKls4tH5moIn4EhUdrVFiviRII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MXmZ6Gm5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xVIyoHvk; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MXmZ6Gm5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xVIyoHvk; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MXmZ6Gm5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xVIyoHvk";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MXmZ6Gm5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xVIyoHvk"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 90A7D5C101;
	Fri, 29 Aug 2025 14:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478631; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DsVtsrNGHPfwG3OQmJ17XkDWj41Jg5KXrGqPftURaL8=;
	b=MXmZ6Gm5R8+p3OiOdX7yCExTM29bTQsX75yg7XMmALTqpqT5yK3V0WnvjZhEU1YE4pz96/
	NshTcvs6fG6pSa/xGmZiKrKZPbnmBs6IjKGfA5Wwaws/E+HQqxXw51g6/goe3ACggNmCgG
	W6S++GBmuBTmxuH6SWZZwtrDPKOOuYU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478631;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DsVtsrNGHPfwG3OQmJ17XkDWj41Jg5KXrGqPftURaL8=;
	b=xVIyoHvkhq8xUzCvIiBcNNf32LfSm6acSQdeOzpGEEnOhUD1iJT8hjdSilYOyuUf4a9gCC
	aoJTgYDHTsgNdbAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=MXmZ6Gm5;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=xVIyoHvk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478631; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DsVtsrNGHPfwG3OQmJ17XkDWj41Jg5KXrGqPftURaL8=;
	b=MXmZ6Gm5R8+p3OiOdX7yCExTM29bTQsX75yg7XMmALTqpqT5yK3V0WnvjZhEU1YE4pz96/
	NshTcvs6fG6pSa/xGmZiKrKZPbnmBs6IjKGfA5Wwaws/E+HQqxXw51g6/goe3ACggNmCgG
	W6S++GBmuBTmxuH6SWZZwtrDPKOOuYU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478631;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DsVtsrNGHPfwG3OQmJ17XkDWj41Jg5KXrGqPftURaL8=;
	b=xVIyoHvkhq8xUzCvIiBcNNf32LfSm6acSQdeOzpGEEnOhUD1iJT8hjdSilYOyuUf4a9gCC
	aoJTgYDHTsgNdbAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6D2AB13A3E;
	Fri, 29 Aug 2025 14:43:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6AeNGae8sWi6GAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:43:51 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 04/61] ALSA: azt3328: Use guard() for spin locks
Date: Fri, 29 Aug 2025 16:42:39 +0200
Message-ID: <20250829144342.4290-5-tiwai@suse.de>
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
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim,suse.de:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 90A7D5C101
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Clean up the code using guard() for spin locks.

Merely code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/azt3328.c | 143 ++++++++++++++++++++------------------------
 1 file changed, 65 insertions(+), 78 deletions(-)

diff --git a/sound/pci/azt3328.c b/sound/pci/azt3328.c
index b33344f65b8c..6cdf76e2b7d2 100644
--- a/sound/pci/azt3328.c
+++ b/sound/pci/azt3328.c
@@ -1201,7 +1201,6 @@ snd_azf3328_codec_setfmt(struct snd_azf3328_codec_data *codec,
 			       unsigned int channels
 )
 {
-	unsigned long flags;
 	u16 val = 0xff00;
 	u8 freq = 0;
 
@@ -1244,7 +1243,7 @@ snd_azf3328_codec_setfmt(struct snd_azf3328_codec_data *codec,
 	if (format_width == 16)
 		val |= SOUNDFORMAT_FLAG_16BIT;
 
-	spin_lock_irqsave(codec->lock, flags);
+	guard(spinlock_irqsave)(codec->lock);
 
 	/* set bitrate/format */
 	snd_azf3328_codec_outw(codec, IDX_IO_CODEC_SOUNDFORMAT, val);
@@ -1266,8 +1265,6 @@ snd_azf3328_codec_setfmt(struct snd_azf3328_codec_data *codec,
 			DMA_EPILOGUE_SOMETHING |
 			DMA_SOMETHING_ELSE
 		);
-
-	spin_unlock_irqrestore(codec->lock, flags);
 }
 
 static inline void
@@ -1373,8 +1370,6 @@ snd_azf3328_codec_setdmaa(struct snd_azf3328 *chip,
 	if (!codec->running) {
 		/* AZF3328 uses a two buffer pointer DMA transfer approach */
 
-		unsigned long flags;
-
 		/* width 32bit (prevent overflow): */
 		u32 area_length;
 		struct codec_setup_io {
@@ -1405,11 +1400,10 @@ snd_azf3328_codec_setdmaa(struct snd_azf3328 *chip,
 		/* build combined I/O buffer length word */
 		setup_io.dma_lengths = (area_length << 16) | (area_length);
 
-		spin_lock_irqsave(codec->lock, flags);
+		guard(spinlock_irqsave)(codec->lock);
 		snd_azf3328_codec_outl_multi(
 			codec, IDX_IO_CODEC_DMA_START_1, &setup_io, 3
 		);
-		spin_unlock_irqrestore(codec->lock, flags);
 	}
 }
 
@@ -1464,48 +1458,48 @@ snd_azf3328_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 			snd_pcm_format_width(runtime->format),
 			runtime->channels);
 
-		spin_lock(codec->lock);
-		/* first, remember current value: */
-		flags1 = snd_azf3328_codec_inw(codec, IDX_IO_CODEC_DMA_FLAGS);
+		scoped_guard(spinlock, codec->lock) {
+			/* first, remember current value: */
+			flags1 = snd_azf3328_codec_inw(codec, IDX_IO_CODEC_DMA_FLAGS);
 
-		/* stop transfer */
-		flags1 &= ~DMA_RESUME;
-		snd_azf3328_codec_outw(codec, IDX_IO_CODEC_DMA_FLAGS, flags1);
+			/* stop transfer */
+			flags1 &= ~DMA_RESUME;
+			snd_azf3328_codec_outw(codec, IDX_IO_CODEC_DMA_FLAGS, flags1);
 
-		/* FIXME: clear interrupts or what??? */
-		snd_azf3328_codec_outw(codec, IDX_IO_CODEC_IRQTYPE, 0xffff);
-		spin_unlock(codec->lock);
+			/* FIXME: clear interrupts or what??? */
+			snd_azf3328_codec_outw(codec, IDX_IO_CODEC_IRQTYPE, 0xffff);
+		}
 
 		snd_azf3328_codec_setdmaa(chip, codec, runtime->dma_addr,
 			snd_pcm_lib_period_bytes(substream),
 			snd_pcm_lib_buffer_bytes(substream)
 		);
 
-		spin_lock(codec->lock);
+		scoped_guard(spinlock, codec->lock) {
 #ifdef WIN9X
-		/* FIXME: enable playback/recording??? */
-		flags1 |= DMA_RUN_SOMETHING1 | DMA_RUN_SOMETHING2;
-		snd_azf3328_codec_outw(codec, IDX_IO_CODEC_DMA_FLAGS, flags1);
+			/* FIXME: enable playback/recording??? */
+			flags1 |= DMA_RUN_SOMETHING1 | DMA_RUN_SOMETHING2;
+			snd_azf3328_codec_outw(codec, IDX_IO_CODEC_DMA_FLAGS, flags1);
 
-		/* start transfer again */
-		/* FIXME: what is this value (0x0010)??? */
-		flags1 |= DMA_RESUME | DMA_EPILOGUE_SOMETHING;
-		snd_azf3328_codec_outw(codec, IDX_IO_CODEC_DMA_FLAGS, flags1);
+			/* start transfer again */
+			/* FIXME: what is this value (0x0010)??? */
+			flags1 |= DMA_RESUME | DMA_EPILOGUE_SOMETHING;
+			snd_azf3328_codec_outw(codec, IDX_IO_CODEC_DMA_FLAGS, flags1);
 #else /* NT4 */
-		snd_azf3328_codec_outw(codec, IDX_IO_CODEC_DMA_FLAGS,
-			0x0000);
-		snd_azf3328_codec_outw(codec, IDX_IO_CODEC_DMA_FLAGS,
-			DMA_RUN_SOMETHING1);
-		snd_azf3328_codec_outw(codec, IDX_IO_CODEC_DMA_FLAGS,
-			DMA_RUN_SOMETHING1 |
-			DMA_RUN_SOMETHING2);
-		snd_azf3328_codec_outw(codec, IDX_IO_CODEC_DMA_FLAGS,
-			DMA_RESUME |
-			SOMETHING_ALMOST_ALWAYS_SET |
-			DMA_EPILOGUE_SOMETHING |
-			DMA_SOMETHING_ELSE);
+			snd_azf3328_codec_outw(codec, IDX_IO_CODEC_DMA_FLAGS,
+					       0x0000);
+			snd_azf3328_codec_outw(codec, IDX_IO_CODEC_DMA_FLAGS,
+					       DMA_RUN_SOMETHING1);
+			snd_azf3328_codec_outw(codec, IDX_IO_CODEC_DMA_FLAGS,
+					       DMA_RUN_SOMETHING1 |
+					       DMA_RUN_SOMETHING2);
+			snd_azf3328_codec_outw(codec, IDX_IO_CODEC_DMA_FLAGS,
+					       DMA_RESUME |
+					       SOMETHING_ALMOST_ALWAYS_SET |
+					       DMA_EPILOGUE_SOMETHING |
+					       DMA_SOMETHING_ELSE);
 #endif
-		spin_unlock(codec->lock);
+		}
 		snd_azf3328_ctrl_codec_activity(chip, codec->type, 1);
 
 		if (is_main_mixer_playback_codec) {
@@ -1521,14 +1515,14 @@ snd_azf3328_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 	case SNDRV_PCM_TRIGGER_RESUME:
 		dev_dbg(chip->card->dev, "PCM RESUME %s\n", codec->name);
 		/* resume codec if we were active */
-		spin_lock(codec->lock);
-		if (codec->running)
-			snd_azf3328_codec_outw(codec, IDX_IO_CODEC_DMA_FLAGS,
-				snd_azf3328_codec_inw(
-					codec, IDX_IO_CODEC_DMA_FLAGS
-				) | DMA_RESUME
-			);
-		spin_unlock(codec->lock);
+		scoped_guard(spinlock, codec->lock) {
+			if (codec->running)
+				snd_azf3328_codec_outw(codec, IDX_IO_CODEC_DMA_FLAGS,
+						       snd_azf3328_codec_inw(
+									     codec, IDX_IO_CODEC_DMA_FLAGS
+									     ) | DMA_RESUME
+						       );
+		}
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
 		dev_dbg(chip->card->dev, "PCM STOP %s\n", codec->name);
@@ -1541,22 +1535,22 @@ snd_azf3328_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 				);
 		}
 
-		spin_lock(codec->lock);
-		/* first, remember current value: */
-		flags1 = snd_azf3328_codec_inw(codec, IDX_IO_CODEC_DMA_FLAGS);
+		scoped_guard(spinlock, codec->lock) {
+			/* first, remember current value: */
+			flags1 = snd_azf3328_codec_inw(codec, IDX_IO_CODEC_DMA_FLAGS);
 
-		/* stop transfer */
-		flags1 &= ~DMA_RESUME;
-		snd_azf3328_codec_outw(codec, IDX_IO_CODEC_DMA_FLAGS, flags1);
+			/* stop transfer */
+			flags1 &= ~DMA_RESUME;
+			snd_azf3328_codec_outw(codec, IDX_IO_CODEC_DMA_FLAGS, flags1);
 
-		/* hmm, is this really required? we're resetting the same bit
-		 * immediately thereafter... */
-		flags1 |= DMA_RUN_SOMETHING1;
-		snd_azf3328_codec_outw(codec, IDX_IO_CODEC_DMA_FLAGS, flags1);
+			/* hmm, is this really required? we're resetting the same bit
+			 * immediately thereafter... */
+			flags1 |= DMA_RUN_SOMETHING1;
+			snd_azf3328_codec_outw(codec, IDX_IO_CODEC_DMA_FLAGS, flags1);
 
-		flags1 &= ~DMA_RUN_SOMETHING1;
-		snd_azf3328_codec_outw(codec, IDX_IO_CODEC_DMA_FLAGS, flags1);
-		spin_unlock(codec->lock);
+			flags1 &= ~DMA_RUN_SOMETHING1;
+			snd_azf3328_codec_outw(codec, IDX_IO_CODEC_DMA_FLAGS, flags1);
+		}
 		snd_azf3328_ctrl_codec_activity(chip, codec->type, 0);
 
 		if (is_main_mixer_playback_codec) {
@@ -1724,12 +1718,11 @@ snd_azf3328_gameport_cooked_read(struct gameport *gameport,
 	struct snd_azf3328 *chip = gameport_get_port_data(gameport);
 	int i;
 	u8 val;
-	unsigned long flags;
 
 	if (snd_BUG_ON(!chip))
 		return 0;
 
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	val = snd_azf3328_game_inb(chip, IDX_GAME_LEGACY_COMPATIBLE);
 	*buttons = (~(val) >> 4) & 0xf;
 
@@ -1766,7 +1759,6 @@ snd_azf3328_gameport_cooked_read(struct gameport *gameport,
 	snd_azf3328_game_outb(chip, IDX_GAME_AXES_CONFIG, val);
 
 	snd_azf3328_game_outw(chip, IDX_GAME_AXIS_VALUE, 0xffff);
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 
 	for (i = 0; i < ARRAY_SIZE(chip->axes); i++) {
 		axes[i] = chip->axes[i];
@@ -1863,11 +1855,11 @@ snd_azf3328_pcm_interrupt(struct snd_azf3328 *chip,
 		if (!(status & (1 << codec_type)))
 			continue;
 
-		spin_lock(codec->lock);
-		which = snd_azf3328_codec_inb(codec, IDX_IO_CODEC_IRQTYPE);
-		/* ack all IRQ types immediately */
-		snd_azf3328_codec_outb(codec, IDX_IO_CODEC_IRQTYPE, which);
-		spin_unlock(codec->lock);
+		scoped_guard(spinlock, codec->lock) {
+			which = snd_azf3328_codec_inb(codec, IDX_IO_CODEC_IRQTYPE);
+			/* ack all IRQ types immediately */
+			snd_azf3328_codec_outb(codec, IDX_IO_CODEC_IRQTYPE, which);
+		}
 
 		if (codec->substream) {
 			snd_pcm_period_elapsed(codec->substream);
@@ -1912,9 +1904,9 @@ snd_azf3328_interrupt(int irq, void *dev_id)
 		if (chip->timer)
 			snd_timer_interrupt(chip->timer, chip->timer->sticks);
 		/* ACK timer */
-                spin_lock(&chip->reg_lock);
-		snd_azf3328_ctrl_outb(chip, IDX_IO_TIMER_VALUE + 3, 0x07);
-		spin_unlock(&chip->reg_lock);
+		scoped_guard(spinlock, &chip->reg_lock) {
+			snd_azf3328_ctrl_outb(chip, IDX_IO_TIMER_VALUE + 3, 0x07);
+		}
 		dev_dbg(chip->card->dev, "timer IRQ\n");
 	}
 
@@ -2137,7 +2129,6 @@ static int
 snd_azf3328_timer_start(struct snd_timer *timer)
 {
 	struct snd_azf3328 *chip;
-	unsigned long flags;
 	unsigned int delay;
 
 	chip = snd_timer_chip(timer);
@@ -2152,9 +2143,8 @@ snd_azf3328_timer_start(struct snd_timer *timer)
 	}
 	dev_dbg(chip->card->dev, "setting timer countdown value %d\n", delay);
 	delay |= TIMER_COUNTDOWN_ENABLE | TIMER_IRQ_ENABLE;
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	snd_azf3328_ctrl_outl(chip, IDX_IO_TIMER_VALUE, delay);
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 	return 0;
 }
 
@@ -2162,10 +2152,9 @@ static int
 snd_azf3328_timer_stop(struct snd_timer *timer)
 {
 	struct snd_azf3328 *chip;
-	unsigned long flags;
 
 	chip = snd_timer_chip(timer);
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	/* disable timer countdown and interrupt */
 	/* Hmm, should we write TIMER_IRQ_ACK here?
 	   YES indeed, otherwise a rogue timer operation - which prompts
@@ -2174,7 +2163,6 @@ snd_azf3328_timer_stop(struct snd_timer *timer)
 	   Simply manually poking 0x04 _once_ immediately successfully stops
 	   the hardware/ALSA interrupt activity. */
 	snd_azf3328_ctrl_outb(chip, IDX_IO_TIMER_VALUE + 3, 0x04);
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 	return 0;
 }
 
@@ -2406,10 +2394,9 @@ snd_azf3328_create(struct snd_card *card,
 		codec->running = true;
 		snd_azf3328_ctrl_codec_activity(chip, codec_type, 0);
 
-		spin_lock_irq(codec->lock);
+		guard(spinlock_irq)(codec->lock);
 		snd_azf3328_codec_outb(codec, IDX_IO_CODEC_DMA_FLAGS,
 						 dma_init);
-		spin_unlock_irq(codec->lock);
 	}
 
 	return 0;
-- 
2.50.1

