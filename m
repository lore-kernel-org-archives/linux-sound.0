Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9987309EE5
	for <linux-sound@vger.kernel.org>; Tue,  9 Sep 2025 12:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757421824; cv=none; b=mr/ihBe/gHyZ4xF7OZ37JCElcSL38v0v00pCgGr1afwYDIyH5TziUWZBnJ/cTjGF9eWajDLhpdqSoGrwCLhuIk3vMVIVjdOJKa3z25+CXWu0OpPwVheUjN+Z+lVLqIrhzNowqc7gxMlNSX2dAoZRVc04/i8fS6BY1nC9qO51YNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757421824; c=relaxed/simple;
	bh=ro6VfN++6xOd3sep4s0UI69lSLVD3Wuv/RpaMiB7GFc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jqxGy2GirUnJmsEMnEoC1TiMoZkFUS9ryw/Cp9xUFDukuL8zulyP8cNe77cWUNx8/r3bL8860vjJQIStwEpTtViyphktGEh3FlpwQMqBPOwbcW/STszahlfnmAFxSfG9zC23p5ioROjiVdDtNIcI9h11bAxAGwxcbIl9Flb9oUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zDTAGDfX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=M1hcDUVb; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zDTAGDfX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=M1hcDUVb; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zDTAGDfX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="M1hcDUVb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zDTAGDfX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="M1hcDUVb"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5AE6B33A46;
	Tue,  9 Sep 2025 12:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1757421814; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VUN3vdTod2xFI9x4cnqtE3VkN1v/V6FPLBFfwQIP8YY=;
	b=zDTAGDfX06UQgSBPxHQlu7mgUlH3DQxrb+VEGkMd0mBRjEnmRxYQPiEZ4JrPIU7P5R3Jlf
	7tg2RgRRffowkxdRiFRtlLJdGndY6smJfH1hA0chvfr7ZWl4sdT1N1Kjvt316AumNnX5Ex
	Va0T7iELhtRKkjAnKvud7t2Gzoi2V4A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757421814;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VUN3vdTod2xFI9x4cnqtE3VkN1v/V6FPLBFfwQIP8YY=;
	b=M1hcDUVbKmnAO0izG8oRHSj8V5qVf3o3bnhimHw/Z9uLQOpQxnD9UDYNfr45xAjL9/OWr9
	caLIK78t9V7ZdXDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=zDTAGDfX;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=M1hcDUVb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1757421814; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VUN3vdTod2xFI9x4cnqtE3VkN1v/V6FPLBFfwQIP8YY=;
	b=zDTAGDfX06UQgSBPxHQlu7mgUlH3DQxrb+VEGkMd0mBRjEnmRxYQPiEZ4JrPIU7P5R3Jlf
	7tg2RgRRffowkxdRiFRtlLJdGndY6smJfH1hA0chvfr7ZWl4sdT1N1Kjvt316AumNnX5Ex
	Va0T7iELhtRKkjAnKvud7t2Gzoi2V4A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757421814;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VUN3vdTod2xFI9x4cnqtE3VkN1v/V6FPLBFfwQIP8YY=;
	b=M1hcDUVbKmnAO0izG8oRHSj8V5qVf3o3bnhimHw/Z9uLQOpQxnD9UDYNfr45xAjL9/OWr9
	caLIK78t9V7ZdXDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4A30C13A56;
	Tue,  9 Sep 2025 12:43:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gLuUEfYgwGi6TgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 09 Sep 2025 12:43:34 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 01/14] ALSA: aoa: Use guard() for spin locks
Date: Tue,  9 Sep 2025 14:43:21 +0200
Message-ID: <20250909124331.10670-2-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 5AE6B33A46
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email];
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
 sound/aoa/soundbus/i2sbus/core.c |   4 +-
 sound/aoa/soundbus/i2sbus/pcm.c  | 130 ++++++++++++++-----------------
 2 files changed, 60 insertions(+), 74 deletions(-)

diff --git a/sound/aoa/soundbus/i2sbus/core.c b/sound/aoa/soundbus/i2sbus/core.c
index ce84288168e4..f4d43c854bbd 100644
--- a/sound/aoa/soundbus/i2sbus/core.c
+++ b/sound/aoa/soundbus/i2sbus/core.c
@@ -93,14 +93,12 @@ static irqreturn_t i2sbus_bus_intr(int irq, void *devid)
 	struct i2sbus_dev *dev = devid;
 	u32 intreg;
 
-	spin_lock(&dev->low_lock);
+	guard(spinlock)(&dev->low_lock);
 	intreg = in_le32(&dev->intfregs->intr_ctl);
 
 	/* acknowledge interrupt reasons */
 	out_le32(&dev->intfregs->intr_ctl, intreg);
 
-	spin_unlock(&dev->low_lock);
-
 	return IRQ_HANDLED;
 }
 
diff --git a/sound/aoa/soundbus/i2sbus/pcm.c b/sound/aoa/soundbus/i2sbus/pcm.c
index 1edda4c9c6ab..fe11fee3c78f 100644
--- a/sound/aoa/soundbus/i2sbus/pcm.c
+++ b/sound/aoa/soundbus/i2sbus/pcm.c
@@ -505,20 +505,16 @@ static int i2sbus_pcm_trigger(struct i2sbus_dev *i2sdev, int in, int cmd)
 {
 	struct codec_info_item *cii;
 	struct pcm_info *pi;
-	int result = 0;
-	unsigned long flags;
 
-	spin_lock_irqsave(&i2sdev->low_lock, flags);
+	guard(spinlock_irqsave)(&i2sdev->low_lock);
 
 	get_pcm_info(i2sdev, in, &pi, NULL);
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
-		if (pi->dbdma_ring.running) {
-			result = -EALREADY;
-			goto out_unlock;
-		}
+		if (pi->dbdma_ring.running)
+			return -EALREADY;
 		list_for_each_entry(cii, &i2sdev->sound.codec_list, list)
 			if (cii->codec->start)
 				cii->codec->start(cii, pi->substream);
@@ -532,7 +528,7 @@ static int i2sbus_pcm_trigger(struct i2sbus_dev *i2sdev, int in, int cmd)
 				udelay(10);
 				if (in_le32(&pi->dbdma->status) & ACTIVE) {
 					pi->dbdma_ring.stopping = 0;
-					goto out_unlock; /* keep running */
+					return 0; /* keep running */
 				}
 			}
 		}
@@ -558,10 +554,8 @@ static int i2sbus_pcm_trigger(struct i2sbus_dev *i2sdev, int in, int cmd)
 
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
-		if (!pi->dbdma_ring.running) {
-			result = -EALREADY;
-			goto out_unlock;
-		}
+		if (!pi->dbdma_ring.running)
+			return -EALREADY;
 		pi->dbdma_ring.running = 0;
 
 		/* Set the S0 bit to make the DMA branch to the stop cmd */
@@ -573,13 +567,10 @@ static int i2sbus_pcm_trigger(struct i2sbus_dev *i2sdev, int in, int cmd)
 				cii->codec->stop(cii, pi->substream);
 		break;
 	default:
-		result = -EINVAL;
-		goto out_unlock;
+		return -EINVAL;
 	}
 
- out_unlock:
-	spin_unlock_irqrestore(&i2sdev->low_lock, flags);
-	return result;
+	return 0;
 }
 
 static snd_pcm_uframes_t i2sbus_pcm_pointer(struct i2sbus_dev *i2sdev, int in)
@@ -606,70 +597,67 @@ static inline void handle_interrupt(struct i2sbus_dev *i2sdev, int in)
 	int dma_stopped = 0;
 	struct snd_pcm_runtime *runtime;
 
-	spin_lock(&i2sdev->low_lock);
-	get_pcm_info(i2sdev, in, &pi, NULL);
-	if (!pi->dbdma_ring.running && !pi->dbdma_ring.stopping)
-		goto out_unlock;
+	scoped_guard(spinlock, &i2sdev->low_lock) {
+		get_pcm_info(i2sdev, in, &pi, NULL);
+		if (!pi->dbdma_ring.running && !pi->dbdma_ring.stopping)
+			return;
 
-	i = pi->current_period;
-	runtime = pi->substream->runtime;
-	while (pi->dbdma_ring.cmds[i].xfer_status) {
-		if (le16_to_cpu(pi->dbdma_ring.cmds[i].xfer_status) & BT)
-			/*
-			 * BT is the branch taken bit.  If it took a branch
-			 * it is because we set the S0 bit to make it
-			 * branch to the stop command.
-			 */
-			dma_stopped = 1;
-		pi->dbdma_ring.cmds[i].xfer_status = 0;
+		i = pi->current_period;
+		runtime = pi->substream->runtime;
+		while (pi->dbdma_ring.cmds[i].xfer_status) {
+			if (le16_to_cpu(pi->dbdma_ring.cmds[i].xfer_status) & BT)
+				/*
+				 * BT is the branch taken bit.  If it took a branch
+				 * it is because we set the S0 bit to make it
+				 * branch to the stop command.
+				 */
+				dma_stopped = 1;
+			pi->dbdma_ring.cmds[i].xfer_status = 0;
 
-		if (++i >= runtime->periods) {
-			i = 0;
-			pi->frame_count += runtime->buffer_size;
-		}
-		pi->current_period = i;
-
-		/*
-		 * Check the frame count.  The DMA tends to get a bit
-		 * ahead of the frame counter, which confuses the core.
-		 */
-		fc = in_le32(&i2sdev->intfregs->frame_count);
-		nframes = i * runtime->period_size;
-		if (fc < pi->frame_count + nframes)
-			pi->frame_count = fc - nframes;
-	}
-
-	if (dma_stopped) {
-		timeout = 1000;
-		for (;;) {
-			status = in_le32(&pi->dbdma->status);
-			if (!(status & ACTIVE) && (!in || (status & 0x80)))
-				break;
-			if (--timeout <= 0) {
-				printk(KERN_ERR "i2sbus: timed out "
-				       "waiting for DMA to stop!\n");
-				break;
+			if (++i >= runtime->periods) {
+				i = 0;
+				pi->frame_count += runtime->buffer_size;
 			}
-			udelay(1);
+			pi->current_period = i;
+
+			/*
+			 * Check the frame count.  The DMA tends to get a bit
+			 * ahead of the frame counter, which confuses the core.
+			 */
+			fc = in_le32(&i2sdev->intfregs->frame_count);
+			nframes = i * runtime->period_size;
+			if (fc < pi->frame_count + nframes)
+				pi->frame_count = fc - nframes;
 		}
 
-		/* Turn off DMA controller, clear S0 bit */
-		out_le32(&pi->dbdma->control, (RUN | PAUSE | 1) << 16);
+		if (dma_stopped) {
+			timeout = 1000;
+			for (;;) {
+				status = in_le32(&pi->dbdma->status);
+				if (!(status & ACTIVE) && (!in || (status & 0x80)))
+					break;
+				if (--timeout <= 0) {
+					printk(KERN_ERR "i2sbus: timed out "
+					       "waiting for DMA to stop!\n");
+					break;
+				}
+				udelay(1);
+			}
 
-		pi->dbdma_ring.stopping = 0;
-		if (pi->stop_completion)
-			complete(pi->stop_completion);
+			/* Turn off DMA controller, clear S0 bit */
+			out_le32(&pi->dbdma->control, (RUN | PAUSE | 1) << 16);
+
+			pi->dbdma_ring.stopping = 0;
+			if (pi->stop_completion)
+				complete(pi->stop_completion);
+		}
+
+		if (!pi->dbdma_ring.running)
+			return;
 	}
 
-	if (!pi->dbdma_ring.running)
-		goto out_unlock;
-	spin_unlock(&i2sdev->low_lock);
 	/* may call _trigger again, hence needs to be unlocked */
 	snd_pcm_period_elapsed(pi->substream);
-	return;
-
- out_unlock:
-	spin_unlock(&i2sdev->low_lock);
 }
 
 irqreturn_t i2sbus_tx_intr(int irq, void *devid)
-- 
2.50.1

