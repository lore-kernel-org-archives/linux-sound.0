Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C611131B10A
	for <linux-sound@vger.kernel.org>; Wed, 10 Sep 2025 11:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757502588; cv=none; b=re74qKElRpbDOVpdb4DC6SNWhiDuv//aIDhUOdyenYcQaWBek5cZ1ZfysOUIfD3hwdHMjW6yLI17beIlTRIZslTMHUu4ExzHtiSXdt0EdcT6IPcS3TwzVlfR8dzBsPVZEeEq/z1fuXk2Vau9YavHfgq2L92KmBjif26qyWOjYQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757502588; c=relaxed/simple;
	bh=ro6VfN++6xOd3sep4s0UI69lSLVD3Wuv/RpaMiB7GFc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KKxG54saHtW44FqA40AP091XGkC9r38XLM6/R4pRquglZpzycq9btQyrrEZ7Y9vW17KUMMlQ7HZKbxE7it9JXVevBGRRezWe4HkMkHHGUgXKXN8axiDKfXTfal+0eLNOPaw/Cko03IJA4kkaKVjgv3UcDN0p0tbB7NGlTUII7xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CWC1eXuf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0GGq1wko; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CWC1eXuf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0GGq1wko; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CWC1eXuf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0GGq1wko";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CWC1eXuf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0GGq1wko"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DFFD65BD0F;
	Wed, 10 Sep 2025 11:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1757502584; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VUN3vdTod2xFI9x4cnqtE3VkN1v/V6FPLBFfwQIP8YY=;
	b=CWC1eXuf1JLMeNxAgxbErs7g27pdaYzNsDG0IoqDs56nLBZgOw936U8332+1pmJSpibbP4
	MK2ewHmwjlxZ0im+4ruTiIzN0w5qZFFP9CIqe/agwARhUoWrFoc1JnNitNk3Vqoxj0tweV
	0DMoUw0cpJvdn9/LCeWQfMIW5p+p0K8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757502584;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VUN3vdTod2xFI9x4cnqtE3VkN1v/V6FPLBFfwQIP8YY=;
	b=0GGq1wkonpkbuCzolO7NW5PHN0orAHvyP6TMEMPQW6l8Lk92yfDzpNoyHaMmGFFzz7Lofo
	PWUHzNNUhvKk8DDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1757502584; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VUN3vdTod2xFI9x4cnqtE3VkN1v/V6FPLBFfwQIP8YY=;
	b=CWC1eXuf1JLMeNxAgxbErs7g27pdaYzNsDG0IoqDs56nLBZgOw936U8332+1pmJSpibbP4
	MK2ewHmwjlxZ0im+4ruTiIzN0w5qZFFP9CIqe/agwARhUoWrFoc1JnNitNk3Vqoxj0tweV
	0DMoUw0cpJvdn9/LCeWQfMIW5p+p0K8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757502584;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VUN3vdTod2xFI9x4cnqtE3VkN1v/V6FPLBFfwQIP8YY=;
	b=0GGq1wkonpkbuCzolO7NW5PHN0orAHvyP6TMEMPQW6l8Lk92yfDzpNoyHaMmGFFzz7Lofo
	PWUHzNNUhvKk8DDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C7B6B13A54;
	Wed, 10 Sep 2025 11:09:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6NeNL3hcwWi+YAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 10 Sep 2025 11:09:44 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 01/14] ALSA: aoa: Use guard() for spin locks
Date: Wed, 10 Sep 2025 13:09:16 +0200
Message-ID: <20250910110932.15234-2-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

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

