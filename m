Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F18C1EA0BD
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 13:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723037667; cv=none; b=TfTgnZVquqQsZ4NxKdwb0DsULvGJru7fJ084wosYsemKj1B6+zPoYwjcCwSy6uF1bEFdhERcDAdsSsYHUgLVB1/yONjX5plLVY5YVU3U3LE5qFicWtGwIPyXIferiDz/dL/bhkFWX0mqrFq54la2HHns38hYha3Iig1lwzkl5fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723037667; c=relaxed/simple;
	bh=/L/NkOTzQ0AGyBvXvHx6V2z6uUxm6LFlTdskExsqBtg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lqUAdfy6Ckbz0vNvMnrh4EjlNRBzZMwdy7XZnDu9HlOqqjrN0YDukQOab6zF61HvOKLWD6nfUMVyDzI/A2ejxbgcvbrGizxAweu2RBgzjVZCb/xuBZTqOyFuKs0vkVEBKWUNF3sid0hHMigulvRTlwCrXS1JD49gsL8VrO6Mlh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=u9plPApW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WOEpe0Qf; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=u9plPApW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WOEpe0Qf; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="u9plPApW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WOEpe0Qf";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="u9plPApW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WOEpe0Qf"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 624071FB97;
	Wed,  7 Aug 2024 13:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037660; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XlzffnDLpltiUCy+JqcehGi7I0NyiC1PNpNJDqFNEaQ=;
	b=u9plPApWRbr8bVK26XhqDPW1aL8ztD/nmxY1kF7GIVUgjcrOVIBdX4mHwwz6xMP5B8E0J+
	VHXG6T76m41Q/l1PWlIeo7k9EWSOyFkcGKYp+N+XU+7MiPNNNpUYdL935EnOH44cR967QA
	MQTTq13Iq/jiINviZDcLoFNE3cffdMo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037660;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XlzffnDLpltiUCy+JqcehGi7I0NyiC1PNpNJDqFNEaQ=;
	b=WOEpe0Qfu6RkjaMdnuXFJRGXVCciNM75KUiB4MzO2flJQ55+5Vq8d5ktHKGh0j8s7Gk6Tm
	qbaW7G2yEvD1d5BA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037660; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XlzffnDLpltiUCy+JqcehGi7I0NyiC1PNpNJDqFNEaQ=;
	b=u9plPApWRbr8bVK26XhqDPW1aL8ztD/nmxY1kF7GIVUgjcrOVIBdX4mHwwz6xMP5B8E0J+
	VHXG6T76m41Q/l1PWlIeo7k9EWSOyFkcGKYp+N+XU+7MiPNNNpUYdL935EnOH44cR967QA
	MQTTq13Iq/jiINviZDcLoFNE3cffdMo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037660;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XlzffnDLpltiUCy+JqcehGi7I0NyiC1PNpNJDqFNEaQ=;
	b=WOEpe0Qfu6RkjaMdnuXFJRGXVCciNM75KUiB4MzO2flJQ55+5Vq8d5ktHKGh0j8s7Gk6Tm
	qbaW7G2yEvD1d5BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 49E5B13A7D;
	Wed,  7 Aug 2024 13:34:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +A7yENx3s2ZpVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 13:34:20 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 27/54] ALSA: msnd: Use standard print API
Date: Wed,  7 Aug 2024 15:34:17 +0200
Message-ID: <20240807133452.9424-28-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240807133452.9424-1-tiwai@suse.de>
References: <20240807133452.9424-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.79 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.19)[-0.941];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.79
X-Spam-Flag: NO
X-Spam-Level: 

Use the standard print API with dev_*() instead of the old house-baked
one.  It gives better information and allows dynamically control of
debug prints.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/msnd/msnd.c          |  46 ++++-----
 sound/isa/msnd/msnd_midi.c     |   4 -
 sound/isa/msnd/msnd_pinnacle.c | 184 +++++++++++++++++----------------
 3 files changed, 112 insertions(+), 122 deletions(-)

diff --git a/sound/isa/msnd/msnd.c b/sound/isa/msnd/msnd.c
index c3fd1eb301bb..611ce7ddf7e7 100644
--- a/sound/isa/msnd/msnd.c
+++ b/sound/isa/msnd/msnd.c
@@ -86,7 +86,7 @@ int snd_msnd_send_dsp_cmd(struct snd_msnd *dev, u8 cmd)
 	}
 	spin_unlock_irqrestore(&dev->lock, flags);
 
-	snd_printd(KERN_ERR LOGNAME ": Send DSP command timeout\n");
+	dev_dbg(dev->card->dev, LOGNAME ": Send DSP command timeout\n");
 
 	return -EIO;
 }
@@ -104,7 +104,7 @@ int snd_msnd_send_word(struct snd_msnd *dev, unsigned char high,
 		return 0;
 	}
 
-	snd_printd(KERN_ERR LOGNAME ": Send host word timeout\n");
+	dev_dbg(dev->card->dev, LOGNAME ": Send host word timeout\n");
 
 	return -EIO;
 }
@@ -115,7 +115,7 @@ int snd_msnd_upload_host(struct snd_msnd *dev, const u8 *bin, int len)
 	int i;
 
 	if (len % 3 != 0) {
-		snd_printk(KERN_ERR LOGNAME
+		dev_err(dev->card->dev, LOGNAME
 			   ": Upload host data not multiple of 3!\n");
 		return -EINVAL;
 	}
@@ -138,7 +138,7 @@ int snd_msnd_enable_irq(struct snd_msnd *dev)
 	if (dev->irq_ref++)
 		return 0;
 
-	snd_printdd(LOGNAME ": Enabling IRQ\n");
+	dev_dbg(dev->card->dev, LOGNAME ": Enabling IRQ\n");
 
 	spin_lock_irqsave(&dev->lock, flags);
 	if (snd_msnd_wait_TXDE(dev) == 0) {
@@ -156,7 +156,7 @@ int snd_msnd_enable_irq(struct snd_msnd *dev)
 	}
 	spin_unlock_irqrestore(&dev->lock, flags);
 
-	snd_printd(KERN_ERR LOGNAME ": Enable IRQ failed\n");
+	dev_dbg(dev->card->dev, LOGNAME ": Enable IRQ failed\n");
 
 	return -EIO;
 }
@@ -170,10 +170,10 @@ int snd_msnd_disable_irq(struct snd_msnd *dev)
 		return 0;
 
 	if (dev->irq_ref < 0)
-		snd_printd(KERN_WARNING LOGNAME ": IRQ ref count is %d\n",
-			   dev->irq_ref);
+		dev_dbg(dev->card->dev, LOGNAME ": IRQ ref count is %d\n",
+			dev->irq_ref);
 
-	snd_printdd(LOGNAME ": Disabling IRQ\n");
+	dev_dbg(dev->card->dev, LOGNAME ": Disabling IRQ\n");
 
 	spin_lock_irqsave(&dev->lock, flags);
 	if (snd_msnd_wait_TXDE(dev) == 0) {
@@ -186,7 +186,7 @@ int snd_msnd_disable_irq(struct snd_msnd *dev)
 	}
 	spin_unlock_irqrestore(&dev->lock, flags);
 
-	snd_printd(KERN_ERR LOGNAME ": Disable IRQ failed\n");
+	dev_dbg(dev->card->dev, LOGNAME ": Disable IRQ failed\n");
 
 	return -EIO;
 }
@@ -220,8 +220,8 @@ void snd_msnd_dsp_halt(struct snd_msnd *chip, struct file *file)
 		snd_msnd_send_dsp_cmd(chip, HDEX_RECORD_STOP);
 		snd_msnd_disable_irq(chip);
 		if (file) {
-			snd_printd(KERN_INFO LOGNAME
-				   ": Stopping read for %p\n", file);
+			dev_dbg(chip->card->dev, LOGNAME
+				": Stopping read for %p\n", file);
 			chip->mode &= ~FMODE_READ;
 		}
 		clear_bit(F_AUDIO_READ_INUSE, &chip->flags);
@@ -233,8 +233,8 @@ void snd_msnd_dsp_halt(struct snd_msnd *chip, struct file *file)
 		}
 		snd_msnd_disable_irq(chip);
 		if (file) {
-			snd_printd(KERN_INFO
-				   LOGNAME ": Stopping write for %p\n", file);
+			dev_dbg(chip->card->dev,
+				LOGNAME ": Stopping write for %p\n", file);
 			chip->mode &= ~FMODE_WRITE;
 		}
 		clear_bit(F_AUDIO_WRITE_INUSE, &chip->flags);
@@ -329,12 +329,6 @@ int snd_msnd_DAPQ(struct snd_msnd *chip, int start)
 		++nbanks;
 
 		/* Then advance the tail */
-		/*
-		if (protect)
-			snd_printd(KERN_INFO "B %X %lX\n",
-				   bank_num, xtime.tv_usec);
-		*/
-
 		DAPQ_tail = (++bank_num % 3) * PCTODSP_OFFSET(DAQDS__size);
 		writew(DAPQ_tail, chip->DAPQ + JQS_wTail);
 		/* Tell the DSP to play the bank */
@@ -343,10 +337,6 @@ int snd_msnd_DAPQ(struct snd_msnd *chip, int start)
 			if (2 == bank_num)
 				break;
 	}
-	/*
-	if (protect)
-		snd_printd(KERN_INFO "%lX\n", xtime.tv_usec);
-	*/
 	/* spin_unlock_irqrestore(&chip->lock, flags); not necessary */
 	return nbanks;
 }
@@ -406,7 +396,7 @@ static void snd_msnd_capture_reset_queue(struct snd_msnd *chip,
 #endif
 
 	chip->capturePeriodBytes = pcm_count;
-	snd_printdd("snd_msnd_capture_reset_queue() %i\n", pcm_count);
+	dev_dbg(chip->card->dev, "%s() %i\n", __func__, pcm_count);
 
 	pDAQ = chip->mappedbase + DARQ_DATA_BUFF;
 
@@ -533,21 +523,21 @@ static int snd_msnd_playback_trigger(struct snd_pcm_substream *substream,
 	int	result = 0;
 
 	if (cmd == SNDRV_PCM_TRIGGER_START) {
-		snd_printdd("snd_msnd_playback_trigger(START)\n");
+		dev_dbg(chip->card->dev, "%s(START)\n", __func__);
 		chip->banksPlayed = 0;
 		set_bit(F_WRITING, &chip->flags);
 		snd_msnd_DAPQ(chip, 1);
 	} else if (cmd == SNDRV_PCM_TRIGGER_STOP) {
-		snd_printdd("snd_msnd_playback_trigger(STop)\n");
+		dev_dbg(chip->card->dev, "%s(STOP)\n", __func__);
 		/* interrupt diagnostic, comment this out later */
 		clear_bit(F_WRITING, &chip->flags);
 		snd_msnd_send_dsp_cmd(chip, HDEX_PLAY_STOP);
 	} else {
-		snd_printd(KERN_ERR "snd_msnd_playback_trigger(?????)\n");
+		dev_dbg(chip->card->dev, "%s(?????)\n", __func__);
 		result = -EINVAL;
 	}
 
-	snd_printdd("snd_msnd_playback_trigger() ENDE\n");
+	dev_dbg(chip->card->dev, "%s() ENDE\n");
 	return result;
 }
 
diff --git a/sound/isa/msnd/msnd_midi.c b/sound/isa/msnd/msnd_midi.c
index 7c61caaf99ad..3ffc8758bec2 100644
--- a/sound/isa/msnd/msnd_midi.c
+++ b/sound/isa/msnd/msnd_midi.c
@@ -42,8 +42,6 @@ static int snd_msndmidi_input_open(struct snd_rawmidi_substream *substream)
 {
 	struct snd_msndmidi *mpu;
 
-	snd_printdd("snd_msndmidi_input_open()\n");
-
 	mpu = substream->rmidi->private_data;
 
 	mpu->substream_input = substream;
@@ -84,8 +82,6 @@ static void snd_msndmidi_input_trigger(struct snd_rawmidi_substream *substream,
 	unsigned long flags;
 	struct snd_msndmidi *mpu;
 
-	snd_printdd("snd_msndmidi_input_trigger(, %i)\n", up);
-
 	mpu = substream->rmidi->private_data;
 	spin_lock_irqsave(&mpu->input_lock, flags);
 	if (up) {
diff --git a/sound/isa/msnd/msnd_pinnacle.c b/sound/isa/msnd/msnd_pinnacle.c
index 4433a92f08e7..635403301a15 100644
--- a/sound/isa/msnd/msnd_pinnacle.c
+++ b/sound/isa/msnd/msnd_pinnacle.c
@@ -81,11 +81,12 @@ static void snd_msnd_eval_dsp_msg(struct snd_msnd *chip, u16 wMessage)
 	switch (HIBYTE(wMessage)) {
 	case HIMT_PLAY_DONE: {
 		if (chip->banksPlayed < 3)
-			snd_printdd("%08X: HIMT_PLAY_DONE: %i\n",
+			dev_dbg(chip->card->dev, "%08X: HIMT_PLAY_DONE: %i\n",
 				(unsigned)jiffies, LOBYTE(wMessage));
 
 		if (chip->last_playbank == LOBYTE(wMessage)) {
-			snd_printdd("chip.last_playbank == LOBYTE(wMessage)\n");
+			dev_dbg(chip->card->dev,
+				"chip.last_playbank == LOBYTE(wMessage)\n");
 			break;
 		}
 		chip->banksPlayed++;
@@ -121,21 +122,22 @@ static void snd_msnd_eval_dsp_msg(struct snd_msnd *chip, u16 wMessage)
 		case HIDSP_PLAY_UNDER:
 #endif
 		case HIDSP_INT_PLAY_UNDER:
-			snd_printd(KERN_WARNING LOGNAME ": Play underflow %i\n",
+			dev_dbg(chip->card->dev,
+				LOGNAME ": Play underflow %i\n",
 				chip->banksPlayed);
 			if (chip->banksPlayed > 2)
 				clear_bit(F_WRITING, &chip->flags);
 			break;
 
 		case HIDSP_INT_RECORD_OVER:
-			snd_printd(KERN_WARNING LOGNAME ": Record overflow\n");
+			dev_dbg(chip->card->dev, LOGNAME ": Record overflow\n");
 			clear_bit(F_READING, &chip->flags);
 			break;
 
 		default:
-			snd_printd(KERN_WARNING LOGNAME
-				   ": DSP message %d 0x%02x\n",
-				   LOBYTE(wMessage), LOBYTE(wMessage));
+			dev_dbg(chip->card->dev, LOGNAME
+				": DSP message %d 0x%02x\n",
+				LOBYTE(wMessage), LOBYTE(wMessage));
 			break;
 		}
 		break;
@@ -146,8 +148,8 @@ static void snd_msnd_eval_dsp_msg(struct snd_msnd *chip, u16 wMessage)
 		break;
 
 	default:
-		snd_printd(KERN_WARNING LOGNAME ": HIMT message %d 0x%02x\n",
-			   HIBYTE(wMessage), HIBYTE(wMessage));
+		dev_dbg(chip->card->dev, LOGNAME ": HIMT message %d 0x%02x\n",
+			HIBYTE(wMessage), HIBYTE(wMessage));
 		break;
 	}
 }
@@ -180,8 +182,9 @@ static irqreturn_t snd_msnd_interrupt(int irq, void *dev_id)
 }
 
 
-static int snd_msnd_reset_dsp(long io, unsigned char *info)
+static int snd_msnd_reset_dsp(struct snd_msnd *chip, unsigned char *info)
 {
+	long io = chip->io;
 	int timeout = 100;
 
 	outb(HPDSPRESET_ON, io + HP_DSPR);
@@ -197,7 +200,7 @@ static int snd_msnd_reset_dsp(long io, unsigned char *info)
 			return 0;
 		msleep(1);
 	}
-	snd_printk(KERN_ERR LOGNAME ": Cannot reset DSP\n");
+	dev_err(chip->card->dev, LOGNAME ": Cannot reset DSP\n");
 
 	return -EIO;
 }
@@ -213,11 +216,11 @@ static int snd_msnd_probe(struct snd_card *card)
 #endif
 
 	if (!request_region(chip->io, DSP_NUMIO, "probing")) {
-		snd_printk(KERN_ERR LOGNAME ": I/O port conflict\n");
+		dev_err(card->dev, LOGNAME ": I/O port conflict\n");
 		return -ENODEV;
 	}
 
-	if (snd_msnd_reset_dsp(chip->io, &info) < 0) {
+	if (snd_msnd_reset_dsp(chip, &info) < 0) {
 		release_region(chip->io, DSP_NUMIO);
 		return -ENODEV;
 	}
@@ -225,7 +228,7 @@ static int snd_msnd_probe(struct snd_card *card)
 #ifdef MSND_CLASSIC
 	strcpy(card->shortname, "Classic/Tahiti/Monterey");
 	strcpy(card->longname, "Turtle Beach Multisound");
-	printk(KERN_INFO LOGNAME ": %s, "
+	dev_info(card->dev, LOGNAME ": %s, "
 	       "I/O 0x%lx-0x%lx, IRQ %d, memory mapped to 0x%lX-0x%lX\n",
 	       card->shortname,
 	       chip->io, chip->io + DSP_NUMIO - 1,
@@ -285,7 +288,7 @@ static int snd_msnd_probe(struct snd_card *card)
 		break;
 	}
 	strcpy(card->longname, "Turtle Beach Multisound Pinnacle");
-	printk(KERN_INFO LOGNAME ": %s revision %s, Xilinx version %s, "
+	dev_info(card->dev, LOGNAME ": %s revision %s, Xilinx version %s, "
 	       "I/O 0x%lx-0x%lx, IRQ %d, memory mapped to 0x%lX-0x%lX\n",
 	       card->shortname,
 	       rev, xv,
@@ -377,22 +380,22 @@ static int upload_dsp_code(struct snd_card *card)
 
 	err = request_firmware(&init_fw, INITCODEFILE, card->dev);
 	if (err < 0) {
-		printk(KERN_ERR LOGNAME ": Error loading " INITCODEFILE);
+		dev_err(card->dev, LOGNAME ": Error loading " INITCODEFILE);
 		goto cleanup1;
 	}
 	err = request_firmware(&perm_fw, PERMCODEFILE, card->dev);
 	if (err < 0) {
-		printk(KERN_ERR LOGNAME ": Error loading " PERMCODEFILE);
+		dev_err(card->dev, LOGNAME ": Error loading " PERMCODEFILE);
 		goto cleanup;
 	}
 
 	memcpy_toio(chip->mappedbase, perm_fw->data, perm_fw->size);
 	if (snd_msnd_upload_host(chip, init_fw->data, init_fw->size) < 0) {
-		printk(KERN_WARNING LOGNAME ": Error uploading to DSP\n");
+		dev_warn(card->dev, LOGNAME ": Error uploading to DSP\n");
 		err = -ENODEV;
 		goto cleanup;
 	}
-	printk(KERN_INFO LOGNAME ": DSP firmware uploaded\n");
+	dev_info(card->dev, LOGNAME ": DSP firmware uploaded\n");
 	err = 0;
 
 cleanup:
@@ -425,17 +428,17 @@ static int snd_msnd_initialize(struct snd_card *card)
 #endif
 	err = snd_msnd_init_sma(chip);
 	if (err < 0) {
-		printk(KERN_WARNING LOGNAME ": Cannot initialize SMA\n");
+		dev_warn(card->dev, LOGNAME ": Cannot initialize SMA\n");
 		return err;
 	}
 
-	err = snd_msnd_reset_dsp(chip->io, NULL);
+	err = snd_msnd_reset_dsp(chip, NULL);
 	if (err < 0)
 		return err;
 
 	err = upload_dsp_code(card);
 	if (err < 0) {
-		printk(KERN_WARNING LOGNAME ": Cannot upload DSP code\n");
+		dev_warn(card->dev, LOGNAME ": Cannot upload DSP code\n");
 		return err;
 	}
 
@@ -444,7 +447,7 @@ static int snd_msnd_initialize(struct snd_card *card)
 	while (readw(chip->mappedbase)) {
 		msleep(1);
 		if (!timeout--) {
-			snd_printd(KERN_ERR LOGNAME ": DSP reset timeout\n");
+			dev_err(card->dev, LOGNAME ": DSP reset timeout\n");
 			return -EIO;
 		}
 	}
@@ -466,7 +469,7 @@ static int snd_msnd_dsp_full_reset(struct snd_card *card)
 
 	rv = snd_msnd_initialize(card);
 	if (rv)
-		printk(KERN_WARNING LOGNAME ": DSP reset failed\n");
+		dev_warn(card->dev, LOGNAME ": DSP reset failed\n");
 	snd_msndmix_force_recsrc(chip, 0);
 	clear_bit(F_RESETTING, &chip->flags);
 	return rv;
@@ -483,7 +486,7 @@ static int snd_msnd_send_dsp_cmd_chk(struct snd_msnd *chip, u8 cmd)
 
 static int snd_msnd_calibrate_adc(struct snd_msnd *chip, u16 srate)
 {
-	snd_printdd("snd_msnd_calibrate_adc(%i)\n", srate);
+	dev_dbg(chip->card->dev, "snd_msnd_calibrate_adc(%i)\n", srate);
 	writew(srate, chip->SMA + SMA_wCalFreqAtoD);
 	if (chip->calibrate_signal == 0)
 		writew(readw(chip->SMA + SMA_wCurrHostStatusFlags)
@@ -496,7 +499,7 @@ static int snd_msnd_calibrate_adc(struct snd_msnd *chip, u16 srate)
 		schedule_timeout_interruptible(msecs_to_jiffies(333));
 		return 0;
 	}
-	printk(KERN_WARNING LOGNAME ": ADC calibration failed\n");
+	dev_warn(chip->card->dev, LOGNAME ": ADC calibration failed\n");
 	return -EIO;
 }
 
@@ -527,7 +530,7 @@ static int snd_msnd_attach(struct snd_card *card)
 	err = devm_request_irq(card->dev, chip->irq, snd_msnd_interrupt, 0,
 			       card->shortname, chip);
 	if (err < 0) {
-		printk(KERN_ERR LOGNAME ": Couldn't grab IRQ %d\n", chip->irq);
+		dev_err(card->dev, LOGNAME ": Couldn't grab IRQ %d\n", chip->irq);
 		return err;
 	}
 	card->sync_irq = chip->irq;
@@ -537,14 +540,14 @@ static int snd_msnd_attach(struct snd_card *card)
 
 	if (!devm_request_mem_region(card->dev, chip->base, BUFFSIZE,
 				     card->shortname)) {
-		printk(KERN_ERR LOGNAME
+		dev_err(card->dev, LOGNAME
 			": unable to grab memory region 0x%lx-0x%lx\n",
 			chip->base, chip->base + BUFFSIZE - 1);
 		return -EBUSY;
 	}
 	chip->mappedbase = devm_ioremap(card->dev, chip->base, 0x8000);
 	if (!chip->mappedbase) {
-		printk(KERN_ERR LOGNAME
+		dev_err(card->dev, LOGNAME
 			": unable to map memory region 0x%lx-0x%lx\n",
 			chip->base, chip->base + BUFFSIZE - 1);
 		return -EIO;
@@ -556,13 +559,13 @@ static int snd_msnd_attach(struct snd_card *card)
 
 	err = snd_msnd_pcm(card, 0);
 	if (err < 0) {
-		printk(KERN_ERR LOGNAME ": error creating new PCM device\n");
+		dev_err(card->dev, LOGNAME ": error creating new PCM device\n");
 		return err;
 	}
 
 	err = snd_msndmix_new(card);
 	if (err < 0) {
-		printk(KERN_ERR LOGNAME ": error creating new Mixer device\n");
+		dev_err(card->dev, LOGNAME ": error creating new Mixer device\n");
 		return err;
 	}
 
@@ -577,7 +580,7 @@ static int snd_msnd_attach(struct snd_card *card)
 					  mpu_irq[0],
 					  &chip->rmidi);
 		if (err < 0) {
-			printk(KERN_ERR LOGNAME
+			dev_err(card->dev, LOGNAME
 				": error creating new Midi device\n");
 			return err;
 		}
@@ -604,103 +607,104 @@ static int snd_msnd_attach(struct snd_card *card)
 
 /* Pinnacle/Fiji Logical Device Configuration */
 
-static int snd_msnd_write_cfg(int cfg, int reg, int value)
+static int snd_msnd_write_cfg(struct snd_msnd *chip, int cfg, int reg, int value)
 {
 	outb(reg, cfg);
 	outb(value, cfg + 1);
 	if (value != inb(cfg + 1)) {
-		printk(KERN_ERR LOGNAME ": snd_msnd_write_cfg: I/O error\n");
+		dev_err(chip->card->dev, LOGNAME ": %s: I/O error\n", __func__);
 		return -EIO;
 	}
 	return 0;
 }
 
-static int snd_msnd_write_cfg_io0(int cfg, int num, u16 io)
+static int snd_msnd_write_cfg_io0(struct snd_msnd *chip, int cfg, int num, u16 io)
 {
-	if (snd_msnd_write_cfg(cfg, IREG_LOGDEVICE, num))
+	if (snd_msnd_write_cfg(chip, cfg, IREG_LOGDEVICE, num))
 		return -EIO;
-	if (snd_msnd_write_cfg(cfg, IREG_IO0_BASEHI, HIBYTE(io)))
+	if (snd_msnd_write_cfg(chip, cfg, IREG_IO0_BASEHI, HIBYTE(io)))
 		return -EIO;
-	if (snd_msnd_write_cfg(cfg, IREG_IO0_BASELO, LOBYTE(io)))
+	if (snd_msnd_write_cfg(chip, cfg, IREG_IO0_BASELO, LOBYTE(io)))
 		return -EIO;
 	return 0;
 }
 
-static int snd_msnd_write_cfg_io1(int cfg, int num, u16 io)
+static int snd_msnd_write_cfg_io1(struct snd_msnd *chip, int cfg, int num, u16 io)
 {
-	if (snd_msnd_write_cfg(cfg, IREG_LOGDEVICE, num))
+	if (snd_msnd_write_cfg(chip, cfg, IREG_LOGDEVICE, num))
 		return -EIO;
-	if (snd_msnd_write_cfg(cfg, IREG_IO1_BASEHI, HIBYTE(io)))
+	if (snd_msnd_write_cfg(chip, cfg, IREG_IO1_BASEHI, HIBYTE(io)))
 		return -EIO;
-	if (snd_msnd_write_cfg(cfg, IREG_IO1_BASELO, LOBYTE(io)))
+	if (snd_msnd_write_cfg(chip, cfg, IREG_IO1_BASELO, LOBYTE(io)))
 		return -EIO;
 	return 0;
 }
 
-static int snd_msnd_write_cfg_irq(int cfg, int num, u16 irq)
+static int snd_msnd_write_cfg_irq(struct snd_msnd *chip, int cfg, int num, u16 irq)
 {
-	if (snd_msnd_write_cfg(cfg, IREG_LOGDEVICE, num))
+	if (snd_msnd_write_cfg(chip, cfg, IREG_LOGDEVICE, num))
 		return -EIO;
-	if (snd_msnd_write_cfg(cfg, IREG_IRQ_NUMBER, LOBYTE(irq)))
+	if (snd_msnd_write_cfg(chip, cfg, IREG_IRQ_NUMBER, LOBYTE(irq)))
 		return -EIO;
-	if (snd_msnd_write_cfg(cfg, IREG_IRQ_TYPE, IRQTYPE_EDGE))
+	if (snd_msnd_write_cfg(chip, cfg, IREG_IRQ_TYPE, IRQTYPE_EDGE))
 		return -EIO;
 	return 0;
 }
 
-static int snd_msnd_write_cfg_mem(int cfg, int num, int mem)
+static int snd_msnd_write_cfg_mem(struct snd_msnd *chip, int cfg, int num, int mem)
 {
 	u16 wmem;
 
 	mem >>= 8;
 	wmem = (u16)(mem & 0xfff);
-	if (snd_msnd_write_cfg(cfg, IREG_LOGDEVICE, num))
+	if (snd_msnd_write_cfg(chip, cfg, IREG_LOGDEVICE, num))
 		return -EIO;
-	if (snd_msnd_write_cfg(cfg, IREG_MEMBASEHI, HIBYTE(wmem)))
+	if (snd_msnd_write_cfg(chip, cfg, IREG_MEMBASEHI, HIBYTE(wmem)))
 		return -EIO;
-	if (snd_msnd_write_cfg(cfg, IREG_MEMBASELO, LOBYTE(wmem)))
+	if (snd_msnd_write_cfg(chip, cfg, IREG_MEMBASELO, LOBYTE(wmem)))
 		return -EIO;
-	if (wmem && snd_msnd_write_cfg(cfg, IREG_MEMCONTROL,
+	if (wmem && snd_msnd_write_cfg(chip, cfg, IREG_MEMCONTROL,
 				       MEMTYPE_HIADDR | MEMTYPE_16BIT))
 		return -EIO;
 	return 0;
 }
 
-static int snd_msnd_activate_logical(int cfg, int num)
+static int snd_msnd_activate_logical(struct snd_msnd *chip, int cfg, int num)
 {
-	if (snd_msnd_write_cfg(cfg, IREG_LOGDEVICE, num))
+	if (snd_msnd_write_cfg(chip, cfg, IREG_LOGDEVICE, num))
 		return -EIO;
-	if (snd_msnd_write_cfg(cfg, IREG_ACTIVATE, LD_ACTIVATE))
+	if (snd_msnd_write_cfg(chip, cfg, IREG_ACTIVATE, LD_ACTIVATE))
 		return -EIO;
 	return 0;
 }
 
-static int snd_msnd_write_cfg_logical(int cfg, int num, u16 io0,
+static int snd_msnd_write_cfg_logical(struct snd_msnd *chip,
+				      int cfg, int num, u16 io0,
 				      u16 io1, u16 irq, int mem)
 {
-	if (snd_msnd_write_cfg(cfg, IREG_LOGDEVICE, num))
+	if (snd_msnd_write_cfg(chip, cfg, IREG_LOGDEVICE, num))
 		return -EIO;
-	if (snd_msnd_write_cfg_io0(cfg, num, io0))
+	if (snd_msnd_write_cfg_io0(chip, cfg, num, io0))
 		return -EIO;
-	if (snd_msnd_write_cfg_io1(cfg, num, io1))
+	if (snd_msnd_write_cfg_io1(chip, cfg, num, io1))
 		return -EIO;
-	if (snd_msnd_write_cfg_irq(cfg, num, irq))
+	if (snd_msnd_write_cfg_irq(chip, cfg, num, irq))
 		return -EIO;
-	if (snd_msnd_write_cfg_mem(cfg, num, mem))
+	if (snd_msnd_write_cfg_mem(chip, cfg, num, mem))
 		return -EIO;
-	if (snd_msnd_activate_logical(cfg, num))
+	if (snd_msnd_activate_logical(chip, cfg, num))
 		return -EIO;
 	return 0;
 }
 
-static int snd_msnd_pinnacle_cfg_reset(int cfg)
+static int snd_msnd_pinnacle_cfg_reset(struct snd_msnd *chip, int cfg)
 {
 	int i;
 
 	/* Reset devices if told to */
-	printk(KERN_INFO LOGNAME ": Resetting all devices\n");
+	dev_info(chip->card->dev, LOGNAME ": Resetting all devices\n");
 	for (i = 0; i < 4; ++i)
-		if (snd_msnd_write_cfg_logical(cfg, i, 0, 0, 0, 0))
+		if (snd_msnd_write_cfg_logical(chip, cfg, i, 0, 0, 0, 0))
 			return -EIO;
 
 	return 0;
@@ -779,7 +783,7 @@ static int snd_msnd_isa_match(struct device *pdev, unsigned int i)
 		return 0;
 
 	if (irq[i] == SNDRV_AUTO_PORT || mem[i] == SNDRV_AUTO_PORT) {
-		printk(KERN_WARNING LOGNAME ": io, irq and mem must be set\n");
+		dev_warn(pdev, LOGNAME ": io, irq and mem must be set\n");
 		return 0;
 	}
 
@@ -792,14 +796,14 @@ static int snd_msnd_isa_match(struct device *pdev, unsigned int i)
 	      io[i] == 0x220 ||
 	      io[i] == 0x210 ||
 	      io[i] == 0x3e0)) {
-		printk(KERN_ERR LOGNAME ": \"io\" - DSP I/O base must be set "
+		dev_err(pdev, LOGNAME ": \"io\" - DSP I/O base must be set "
 			" to 0x210, 0x220, 0x230, 0x240, 0x250, 0x260, 0x290, "
 			"or 0x3E0\n");
 		return 0;
 	}
 #else
 	if (io[i] < 0x100 || io[i] > 0x3e0 || (io[i] % 0x10) != 0) {
-		printk(KERN_ERR LOGNAME
+		dev_err(pdev, LOGNAME
 			": \"io\" - DSP I/O base must within the range 0x100 "
 			"to 0x3E0 and must be evenly divisible by 0x10\n");
 		return 0;
@@ -812,7 +816,7 @@ static int snd_msnd_isa_match(struct device *pdev, unsigned int i)
 	      irq[i] == 10 ||
 	      irq[i] == 11 ||
 	      irq[i] == 12)) {
-		printk(KERN_ERR LOGNAME
+		dev_err(pdev, LOGNAME
 			": \"irq\" - must be set to 5, 7, 9, 10, 11 or 12\n");
 		return 0;
 	}
@@ -823,7 +827,7 @@ static int snd_msnd_isa_match(struct device *pdev, unsigned int i)
 	      mem[i] == 0xd8000 ||
 	      mem[i] == 0xe0000 ||
 	      mem[i] == 0xe8000)) {
-		printk(KERN_ERR LOGNAME ": \"mem\" - must be set to "
+		dev_err(pdev, LOGNAME ": \"mem\" - must be set to "
 		       "0xb0000, 0xc8000, 0xd0000, 0xd8000, 0xe0000 or "
 		       "0xe8000\n");
 		return 0;
@@ -831,9 +835,9 @@ static int snd_msnd_isa_match(struct device *pdev, unsigned int i)
 
 #ifndef MSND_CLASSIC
 	if (cfg[i] == SNDRV_AUTO_PORT) {
-		printk(KERN_INFO LOGNAME ": Assuming PnP mode\n");
+		dev_info(pdev, LOGNAME ": Assuming PnP mode\n");
 	} else if (cfg[i] != 0x250 && cfg[i] != 0x260 && cfg[i] != 0x270) {
-		printk(KERN_INFO LOGNAME
+		dev_info(pdev, LOGNAME
 			": Config port must be 0x250, 0x260 or 0x270 "
 			"(or unspecified for PnP mode)\n");
 		return 0;
@@ -854,7 +858,7 @@ static int snd_msnd_isa_probe(struct device *pdev, unsigned int idx)
 	    || cfg[idx] == SNDRV_AUTO_PORT
 #endif
 	    ) {
-		printk(KERN_INFO LOGNAME ": Assuming PnP mode\n");
+		dev_info(pdev, LOGNAME ": Assuming PnP mode\n");
 		return -ENODEV;
 	}
 
@@ -897,21 +901,21 @@ static int snd_msnd_isa_probe(struct device *pdev, unsigned int idx)
 		chip->memid = HPMEM_E800; break;
 	}
 #else
-	printk(KERN_INFO LOGNAME ": Non-PnP mode: configuring at port 0x%lx\n",
-			cfg[idx]);
+	dev_info(pdev, LOGNAME ": Non-PnP mode: configuring at port 0x%lx\n",
+		 cfg[idx]);
 
 	if (!devm_request_region(card->dev, cfg[idx], 2,
 				 "Pinnacle/Fiji Config")) {
-		printk(KERN_ERR LOGNAME ": Config port 0x%lx conflict\n",
-			   cfg[idx]);
+		dev_err(pdev, LOGNAME ": Config port 0x%lx conflict\n",
+			cfg[idx]);
 		return -EIO;
 	}
 	if (reset[idx])
-		if (snd_msnd_pinnacle_cfg_reset(cfg[idx]))
+		if (snd_msnd_pinnacle_cfg_reset(chip, cfg[idx]))
 			return -EIO;
 
 	/* DSP */
-	err = snd_msnd_write_cfg_logical(cfg[idx], 0,
+	err = snd_msnd_write_cfg_logical(chip, cfg[idx], 0,
 					 io[idx], 0,
 					 irq[idx], mem[idx]);
 
@@ -923,10 +927,10 @@ static int snd_msnd_isa_probe(struct device *pdev, unsigned int idx)
 	/* MPU */
 	if (mpu_io[idx] != SNDRV_AUTO_PORT
 	    && mpu_irq[idx] != SNDRV_AUTO_IRQ) {
-		printk(KERN_INFO LOGNAME
+		dev_info(pdev, LOGNAME
 		       ": Configuring MPU to I/O 0x%lx IRQ %d\n",
 		       mpu_io[idx], mpu_irq[idx]);
-		err = snd_msnd_write_cfg_logical(cfg[idx], 1,
+		err = snd_msnd_write_cfg_logical(chip, cfg[idx], 1,
 						 mpu_io[idx], 0,
 						 mpu_irq[idx], 0);
 
@@ -938,10 +942,10 @@ static int snd_msnd_isa_probe(struct device *pdev, unsigned int idx)
 	if (ide_io0[idx] != SNDRV_AUTO_PORT
 	    && ide_io1[idx] != SNDRV_AUTO_PORT
 	    && ide_irq[idx] != SNDRV_AUTO_IRQ) {
-		printk(KERN_INFO LOGNAME
+		dev_info(pdev, LOGNAME
 		       ": Configuring IDE to I/O 0x%lx, 0x%lx IRQ %d\n",
 		       ide_io0[idx], ide_io1[idx], ide_irq[idx]);
-		err = snd_msnd_write_cfg_logical(cfg[idx], 2,
+		err = snd_msnd_write_cfg_logical(chip, cfg[idx], 2,
 						 ide_io0[idx], ide_io1[idx],
 						 ide_irq[idx], 0);
 
@@ -951,10 +955,10 @@ static int snd_msnd_isa_probe(struct device *pdev, unsigned int idx)
 
 	/* Joystick */
 	if (joystick_io[idx] != SNDRV_AUTO_PORT) {
-		printk(KERN_INFO LOGNAME
+		dev_info(pdev, LOGNAME
 		       ": Configuring joystick to I/O 0x%lx\n",
 		       joystick_io[idx]);
-		err = snd_msnd_write_cfg_logical(cfg[idx], 3,
+		err = snd_msnd_write_cfg_logical(chip, cfg[idx], 3,
 						 joystick_io[idx], 0,
 						 0, 0);
 
@@ -989,13 +993,13 @@ static int snd_msnd_isa_probe(struct device *pdev, unsigned int idx)
 	spin_lock_init(&chip->lock);
 	err = snd_msnd_probe(card);
 	if (err < 0) {
-		printk(KERN_ERR LOGNAME ": Probe failed\n");
+		dev_err(pdev, LOGNAME ": Probe failed\n");
 		return err;
 	}
 
 	err = snd_msnd_attach(card);
 	if (err < 0) {
-		printk(KERN_ERR LOGNAME ": Attach failed\n");
+		dev_err(pdev, LOGNAME ": Attach failed\n");
 		return err;
 	}
 	dev_set_drvdata(pdev, card);
@@ -1042,12 +1046,12 @@ static int snd_msnd_pnp_detect(struct pnp_card_link *pcard,
 		return -ENODEV;
 
 	if (!pnp_is_active(pnp_dev) && pnp_activate_dev(pnp_dev) < 0) {
-		printk(KERN_INFO "msnd_pinnacle: device is inactive\n");
+		dev_info(&pcard->card->dev, "msnd_pinnacle: device is inactive\n");
 		return -EBUSY;
 	}
 
 	if (!pnp_is_active(mpu_dev) && pnp_activate_dev(mpu_dev) < 0) {
-		printk(KERN_INFO "msnd_pinnacle: MPU device is inactive\n");
+		dev_info(&pcard->card->dev, "msnd_pinnacle: MPU device is inactive\n");
 		return -EBUSY;
 	}
 
@@ -1098,13 +1102,13 @@ static int snd_msnd_pnp_detect(struct pnp_card_link *pcard,
 	spin_lock_init(&chip->lock);
 	ret = snd_msnd_probe(card);
 	if (ret < 0) {
-		printk(KERN_ERR LOGNAME ": Probe failed\n");
+		dev_err(&pcard->card->dev, LOGNAME ": Probe failed\n");
 		return ret;
 	}
 
 	ret = snd_msnd_attach(card);
 	if (ret < 0) {
-		printk(KERN_ERR LOGNAME ": Attach failed\n");
+		dev_err(&pcard->card->dev, LOGNAME ": Attach failed\n");
 		return ret;
 	}
 
-- 
2.43.0

