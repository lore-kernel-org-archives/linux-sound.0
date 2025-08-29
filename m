Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD912EB85D
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756478755; cv=none; b=ic3HsZEC209qZF+c1EsV/yU/bv2mKr27DcsHjixb7MNRUBIexu5Tu+I0ugfmqq3u8R0GHMAO84BN9M+OcAkuJQ3BQp9IM3GLDaEM6FMVLh84fF7q0PsccxpvbbtsMvpabSK3PdwqgtvWTxU2Nw/huyckvQ/pzcNFVDiV+kZKmFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756478755; c=relaxed/simple;
	bh=0OqF9tDYD0zH5zktE9ZM2dZ4ZAgmZpW+gFmIDmePXOE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PG523yv2yorttH8KKy9Ef84cb/AAGeWC8aA35d5YaNKO9tJwlSeKUlb1qPhzg9cqitUWzPEnQXQf6W4dMc7Gj+yePEeVhXTV9+VrLfVBrIXDzDlXoOWIxAbpNFvwxC0Su7MIJCQzLhjW0JvcXmjCdoJTLGcKk8ZTyR6YqGARedc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Z2HuPQi3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=A+JhliAM; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mMG6Eyk8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TGq9KvEx; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Z2HuPQi3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="A+JhliAM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mMG6Eyk8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TGq9KvEx"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id ED6F05C235;
	Fri, 29 Aug 2025 14:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478641; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=POgsyF2gynxc/cd38LN/tqNwa1hBueO3Mxnrx9Kw8+s=;
	b=Z2HuPQi3DMtJ60K0BqQUojckVl5Ql/ywAOmz94E3aVq8qUCYlEYjf3xgakUfWUEL/jomsD
	MnK2jF3OEZLHN/eb35NcY9hyGp2jYUswPBAmy92es/yodpzKnnuhUrX4n8iJkmVGQijxmw
	+PQcePQFjKGInzlLSxMjRGysgut72HY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478641;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=POgsyF2gynxc/cd38LN/tqNwa1hBueO3Mxnrx9Kw8+s=;
	b=A+JhliAMW+AMafA/2B7qriCKnZy5LJCRkzkEviWhSG+VeOjQ2tgBKi857keXdP8QK8Khh5
	U/Iy+zEqVVsKxUDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478640; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=POgsyF2gynxc/cd38LN/tqNwa1hBueO3Mxnrx9Kw8+s=;
	b=mMG6Eyk82Nr6Sw6Xr0+hKah3LNoXHR7Ts15a5PhTZz9ws0v9H2KpTzdON8Bq18MRTlYsLX
	076zRsyRV2XX0aIgciNdDtJb4Q1hO54kuC2tp9n32P3Ohha5q9k1U0daA2BrxZtlp3UW2F
	Di3WdvomuuURZ3jqtYhO1ySU0VCW9Cc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478640;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=POgsyF2gynxc/cd38LN/tqNwa1hBueO3Mxnrx9Kw8+s=;
	b=TGq9KvExC9kzTHWcAXuWykYR+HMcf8QZfoEoX5ys/KZvGHH/4Hq4rKRIKQMv2r8G0FZJZ+
	oFwW8eArQ48P1PBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D614213A3E;
	Fri, 29 Aug 2025 14:44:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GEUkM7C8sWi6GAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:44:00 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 33/61] ALSA: fm801: Use guard() for spin locks
Date: Fri, 29 Aug 2025 16:43:08 +0200
Message-ID: <20250829144342.4290-34-tiwai@suse.de>
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
 sound/pci/fm801.c | 71 ++++++++++++++++++++---------------------------
 1 file changed, 30 insertions(+), 41 deletions(-)

diff --git a/sound/pci/fm801.c b/sound/pci/fm801.c
index cf40bd06b734..4ca992449ea3 100644
--- a/sound/pci/fm801.c
+++ b/sound/pci/fm801.c
@@ -279,16 +279,14 @@ static int snd_fm801_update_bits(struct fm801 *chip, unsigned short reg,
 				 unsigned short mask, unsigned short value)
 {
 	int change;
-	unsigned long flags;
 	unsigned short old, new;
 
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	old = fm801_ioread16(chip, reg);
 	new = (old & ~mask) | value;
 	change = old != new;
 	if (change)
 		fm801_iowrite16(chip, reg, new);
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 	return change;
 }
 
@@ -393,7 +391,7 @@ static int snd_fm801_playback_trigger(struct snd_pcm_substream *substream,
 {
 	struct fm801 *chip = snd_pcm_substream_chip(substream);
 
-	spin_lock(&chip->reg_lock);
+	guard(spinlock)(&chip->reg_lock);
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 		chip->ply_ctrl &= ~(FM801_BUF1_LAST |
@@ -414,12 +412,10 @@ static int snd_fm801_playback_trigger(struct snd_pcm_substream *substream,
 		chip->ply_ctrl &= ~FM801_PAUSE;
 		break;
 	default:
-		spin_unlock(&chip->reg_lock);
 		snd_BUG();
 		return -EINVAL;
 	}
 	fm801_writew(chip, PLY_CTRL, chip->ply_ctrl);
-	spin_unlock(&chip->reg_lock);
 	return 0;
 }
 
@@ -428,7 +424,7 @@ static int snd_fm801_capture_trigger(struct snd_pcm_substream *substream,
 {
 	struct fm801 *chip = snd_pcm_substream_chip(substream);
 
-	spin_lock(&chip->reg_lock);
+	guard(spinlock)(&chip->reg_lock);
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 		chip->cap_ctrl &= ~(FM801_BUF1_LAST |
@@ -449,12 +445,10 @@ static int snd_fm801_capture_trigger(struct snd_pcm_substream *substream,
 		chip->cap_ctrl &= ~FM801_PAUSE;
 		break;
 	default:
-		spin_unlock(&chip->reg_lock);
 		snd_BUG();
 		return -EINVAL;
 	}
 	fm801_writew(chip, CAP_CTRL, chip->cap_ctrl);
-	spin_unlock(&chip->reg_lock);
 	return 0;
 }
 
@@ -465,7 +459,7 @@ static int snd_fm801_playback_prepare(struct snd_pcm_substream *substream)
 
 	chip->ply_size = snd_pcm_lib_buffer_bytes(substream);
 	chip->ply_count = snd_pcm_lib_period_bytes(substream);
-	spin_lock_irq(&chip->reg_lock);
+	guard(spinlock_irq)(&chip->reg_lock);
 	chip->ply_ctrl &= ~(FM801_START | FM801_16BIT |
 			     FM801_STEREO | FM801_RATE_MASK |
 			     FM801_CHANNELS_MASK);
@@ -487,7 +481,6 @@ static int snd_fm801_playback_prepare(struct snd_pcm_substream *substream)
 	fm801_writel(chip, PLY_BUF1, chip->ply_buffer);
 	fm801_writel(chip, PLY_BUF2,
 		     chip->ply_buffer + (chip->ply_count % chip->ply_size));
-	spin_unlock_irq(&chip->reg_lock);
 	return 0;
 }
 
@@ -498,7 +491,7 @@ static int snd_fm801_capture_prepare(struct snd_pcm_substream *substream)
 
 	chip->cap_size = snd_pcm_lib_buffer_bytes(substream);
 	chip->cap_count = snd_pcm_lib_period_bytes(substream);
-	spin_lock_irq(&chip->reg_lock);
+	guard(spinlock_irq)(&chip->reg_lock);
 	chip->cap_ctrl &= ~(FM801_START | FM801_16BIT |
 			     FM801_STEREO | FM801_RATE_MASK);
 	if (snd_pcm_format_width(runtime->format) == 16)
@@ -514,7 +507,6 @@ static int snd_fm801_capture_prepare(struct snd_pcm_substream *substream)
 	fm801_writel(chip, CAP_BUF1, chip->cap_buffer);
 	fm801_writel(chip, CAP_BUF2,
 		     chip->cap_buffer + (chip->cap_count % chip->cap_size));
-	spin_unlock_irq(&chip->reg_lock);
 	return 0;
 }
 
@@ -525,13 +517,12 @@ static snd_pcm_uframes_t snd_fm801_playback_pointer(struct snd_pcm_substream *su
 
 	if (!(chip->ply_ctrl & FM801_START))
 		return 0;
-	spin_lock(&chip->reg_lock);
+	guard(spinlock)(&chip->reg_lock);
 	ptr = chip->ply_pos + (chip->ply_count - 1) - fm801_readw(chip, PLY_COUNT);
 	if (fm801_readw(chip, IRQ_STATUS) & FM801_IRQ_PLAYBACK) {
 		ptr += chip->ply_count;
 		ptr %= chip->ply_size;
 	}
-	spin_unlock(&chip->reg_lock);
 	return bytes_to_frames(substream->runtime, ptr);
 }
 
@@ -542,13 +533,12 @@ static snd_pcm_uframes_t snd_fm801_capture_pointer(struct snd_pcm_substream *sub
 
 	if (!(chip->cap_ctrl & FM801_START))
 		return 0;
-	spin_lock(&chip->reg_lock);
+	guard(spinlock)(&chip->reg_lock);
 	ptr = chip->cap_pos + (chip->cap_count - 1) - fm801_readw(chip, CAP_COUNT);
 	if (fm801_readw(chip, IRQ_STATUS) & FM801_IRQ_CAPTURE) {
 		ptr += chip->cap_count;
 		ptr %= chip->cap_size;
 	}
-	spin_unlock(&chip->reg_lock);
 	return bytes_to_frames(substream->runtime, ptr);
 }
 
@@ -565,31 +555,31 @@ static irqreturn_t snd_fm801_interrupt(int irq, void *dev_id)
 	/* ack first */
 	fm801_writew(chip, IRQ_STATUS, status);
 	if (chip->pcm && (status & FM801_IRQ_PLAYBACK) && chip->playback_substream) {
-		spin_lock(&chip->reg_lock);
-		chip->ply_buf++;
-		chip->ply_pos += chip->ply_count;
-		chip->ply_pos %= chip->ply_size;
-		tmp = chip->ply_pos + chip->ply_count;
-		tmp %= chip->ply_size;
-		if (chip->ply_buf & 1)
-			fm801_writel(chip, PLY_BUF1, chip->ply_buffer + tmp);
-		else
-			fm801_writel(chip, PLY_BUF2, chip->ply_buffer + tmp);
-		spin_unlock(&chip->reg_lock);
+		scoped_guard(spinlock, &chip->reg_lock) {
+			chip->ply_buf++;
+			chip->ply_pos += chip->ply_count;
+			chip->ply_pos %= chip->ply_size;
+			tmp = chip->ply_pos + chip->ply_count;
+			tmp %= chip->ply_size;
+			if (chip->ply_buf & 1)
+				fm801_writel(chip, PLY_BUF1, chip->ply_buffer + tmp);
+			else
+				fm801_writel(chip, PLY_BUF2, chip->ply_buffer + tmp);
+		}
 		snd_pcm_period_elapsed(chip->playback_substream);
 	}
 	if (chip->pcm && (status & FM801_IRQ_CAPTURE) && chip->capture_substream) {
-		spin_lock(&chip->reg_lock);
-		chip->cap_buf++;
-		chip->cap_pos += chip->cap_count;
-		chip->cap_pos %= chip->cap_size;
-		tmp = chip->cap_pos + chip->cap_count;
-		tmp %= chip->cap_size;
-		if (chip->cap_buf & 1)
-			fm801_writel(chip, CAP_BUF1, chip->cap_buffer + tmp);
-		else
-			fm801_writel(chip, CAP_BUF2, chip->cap_buffer + tmp);
-		spin_unlock(&chip->reg_lock);
+		scoped_guard(spinlock, &chip->reg_lock) {
+			chip->cap_buf++;
+			chip->cap_pos += chip->cap_count;
+			chip->cap_pos %= chip->cap_size;
+			tmp = chip->cap_pos + chip->cap_count;
+			tmp %= chip->cap_size;
+			if (chip->cap_buf & 1)
+				fm801_writel(chip, CAP_BUF1, chip->cap_buffer + tmp);
+			else
+				fm801_writel(chip, CAP_BUF2, chip->cap_buffer + tmp);
+		}
 		snd_pcm_period_elapsed(chip->capture_substream);
 	}
 	if (chip->rmidi && (status & FM801_IRQ_MPU))
@@ -924,10 +914,9 @@ static int snd_fm801_get_double(struct snd_kcontrol *kcontrol,
 	int invert = (kcontrol->private_value >> 24) & 0xff;
 	long *value = ucontrol->value.integer.value;
 
-	spin_lock_irq(&chip->reg_lock);
+	guard(spinlock_irq)(&chip->reg_lock);
 	value[0] = (fm801_ioread16(chip, reg) >> shift_left) & mask;
 	value[1] = (fm801_ioread16(chip, reg) >> shift_right) & mask;
-	spin_unlock_irq(&chip->reg_lock);
 	if (invert) {
 		value[0] = mask - value[0];
 		value[1] = mask - value[1];
-- 
2.50.1

