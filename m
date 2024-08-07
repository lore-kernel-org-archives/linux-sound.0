Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B211E7A25
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 13:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723037664; cv=none; b=YxXwNySpzHLfvAkmCCi55ZFPLXMqWvXVM9op+6e+gYqQK2UJV4o9NxSmN+aiGnvsYsfooqtkr9rdaKId48gG/zkaz1ZqsnqCqbZvTbIxxD9IqwHbmgfWMHbvBgZai6Ofh5eDjje3JPjOSrdzmJkdmMv0uLFT02TD13dDp/f4fzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723037664; c=relaxed/simple;
	bh=J7tXz2KUMfb+3FF7LLSoN6Swmyp8DeQ8V/7xIUl+zsw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WtJw3IWMGLHaMIltItw0X5dbSxcCbUpQpYprZCxk1THSYN6zGqrK0ZTvDJ0evlYhx0Zjuhy1VQYgXPwxhy0qhtU7taAhLey1g9tIQb3sUSyCjq8dH+P4lXJoyLxl0fQB8U/7eBbzNVjH3bULfzhTWP0tDAk+YNOnbPbVeEl0fK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NWBN5MWP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=D+xNWhGU; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NWBN5MWP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=D+xNWhGU; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NWBN5MWP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="D+xNWhGU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NWBN5MWP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="D+xNWhGU"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3350D1FB8C;
	Wed,  7 Aug 2024 13:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037658; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jp/t+0Z2A/tGsU9CF00kdr0X9m/JgNH2khepCl93zMc=;
	b=NWBN5MWPPUzgzYdS0F6I+fHZXW8DTyIIm/xW2RgeZ5XoyBE/hv7jLSUMV3Uo5am0KTrZdX
	VJoBGDLjOKq1mtS9/VJiUWplnmahSBiBN5ijKkxAXEGuUShPcRTNe5bx10dICqMZ3D6Z2V
	qvn9vgaMeSVRcxT7plMB6OwD74/HgDc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037658;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jp/t+0Z2A/tGsU9CF00kdr0X9m/JgNH2khepCl93zMc=;
	b=D+xNWhGUaMQZpGmJ/wFkvhykjW+b8qgXLxvkC8q4hG4BI+p/NKBP+eUCmrEFqX6Fuz1hEc
	/pg1FfP44ZpjWODw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037658; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jp/t+0Z2A/tGsU9CF00kdr0X9m/JgNH2khepCl93zMc=;
	b=NWBN5MWPPUzgzYdS0F6I+fHZXW8DTyIIm/xW2RgeZ5XoyBE/hv7jLSUMV3Uo5am0KTrZdX
	VJoBGDLjOKq1mtS9/VJiUWplnmahSBiBN5ijKkxAXEGuUShPcRTNe5bx10dICqMZ3D6Z2V
	qvn9vgaMeSVRcxT7plMB6OwD74/HgDc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037658;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jp/t+0Z2A/tGsU9CF00kdr0X9m/JgNH2khepCl93zMc=;
	b=D+xNWhGUaMQZpGmJ/wFkvhykjW+b8qgXLxvkC8q4hG4BI+p/NKBP+eUCmrEFqX6Fuz1hEc
	/pg1FfP44ZpjWODw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1964A13A7D;
	Wed,  7 Aug 2024 13:34:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sOcDBdp3s2ZpVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 13:34:18 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 11/54] ALSA: vx_core: Use standard print API
Date: Wed,  7 Aug 2024 15:34:01 +0200
Message-ID: <20240807133452.9424-12-tiwai@suse.de>
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
	NEURAL_HAM_SHORT(-0.19)[-0.948];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo];
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

The commented old debug prints are dropped, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/vx/vx_core.c  | 64 ++++++++++++++++---------------------
 sound/drivers/vx/vx_hwdep.c |  2 +-
 sound/drivers/vx/vx_pcm.c   | 23 +++++++------
 sound/drivers/vx/vx_uer.c   |  3 +-
 4 files changed, 44 insertions(+), 48 deletions(-)

diff --git a/sound/drivers/vx/vx_core.c b/sound/drivers/vx/vx_core.c
index 18901e5bcfcf..e2def8719ed2 100644
--- a/sound/drivers/vx/vx_core.c
+++ b/sound/drivers/vx/vx_core.c
@@ -52,7 +52,9 @@ int snd_vx_check_reg_bit(struct vx_core *chip, int reg, int mask, int bit, int t
 			return 0;
 		//msleep(10);
 	} while (time_after_eq(end_time, jiffies));
-	snd_printd(KERN_DEBUG "vx_check_reg_bit: timeout, reg=%s, mask=0x%x, val=0x%x\n", reg_names[reg], mask, snd_vx_inb(chip, reg));
+	dev_dbg(chip->card->dev,
+		"vx_check_reg_bit: timeout, reg=%s, mask=0x%x, val=0x%x\n",
+		reg_names[reg], mask, snd_vx_inb(chip, reg));
 	return -EIO;
 }
 
@@ -129,13 +131,14 @@ static int vx_transfer_end(struct vx_core *chip, int cmd)
 	if (err & ISR_ERR) {
 		err = vx_wait_for_rx_full(chip);
 		if (err < 0) {
-			snd_printd(KERN_DEBUG "transfer_end: error in rx_full\n");
+			dev_dbg(chip->card->dev,
+				"transfer_end: error in rx_full\n");
 			return err;
 		}
 		err = vx_inb(chip, RXH) << 16;
 		err |= vx_inb(chip, RXM) << 8;
 		err |= vx_inb(chip, RXL);
-		snd_printd(KERN_DEBUG "transfer_end: error = 0x%x\n", err);
+		dev_dbg(chip->card->dev, "transfer_end: error = 0x%x\n", err);
 		return -(VX_ERR_MASK | err);
 	}
 	return 0;
@@ -239,20 +242,10 @@ int vx_send_msg_nolock(struct vx_core *chip, struct vx_rmh *rmh)
 
 	err = vx_reset_chk(chip);
 	if (err < 0) {
-		snd_printd(KERN_DEBUG "vx_send_msg: vx_reset_chk error\n");
+		dev_dbg(chip->card->dev, "vx_send_msg: vx_reset_chk error\n");
 		return err;
 	}
 
-#if 0
-	printk(KERN_DEBUG "rmh: cmd = 0x%06x, length = %d, stype = %d\n",
-	       rmh->Cmd[0], rmh->LgCmd, rmh->DspStat);
-	if (rmh->LgCmd > 1) {
-		printk(KERN_DEBUG "  ");
-		for (i = 1; i < rmh->LgCmd; i++)
-			printk(KERN_CONT "0x%06x ", rmh->Cmd[i]);
-		printk(KERN_CONT "\n");
-	}
-#endif
 	/* Check bit M is set according to length of the command */
 	if (rmh->LgCmd > 1)
 		rmh->Cmd[0] |= MASK_MORE_THAN_1_WORD_COMMAND;
@@ -262,7 +255,7 @@ int vx_send_msg_nolock(struct vx_core *chip, struct vx_rmh *rmh)
 	/* Wait for TX empty */
 	err = vx_wait_isr_bit(chip, ISR_TX_EMPTY);
 	if (err < 0) {
-		snd_printd(KERN_DEBUG "vx_send_msg: wait tx empty error\n");
+		dev_dbg(chip->card->dev, "vx_send_msg: wait tx empty error\n");
 		return err;
 	}
 
@@ -274,7 +267,8 @@ int vx_send_msg_nolock(struct vx_core *chip, struct vx_rmh *rmh)
 	/* Trigger irq MESSAGE */
 	err = vx_send_irq_dsp(chip, IRQ_MESSAGE);
 	if (err < 0) {
-		snd_printd(KERN_DEBUG "vx_send_msg: send IRQ_MESSAGE error\n");
+		dev_dbg(chip->card->dev,
+			"vx_send_msg: send IRQ_MESSAGE error\n");
 		return err;
 	}
 
@@ -287,13 +281,15 @@ int vx_send_msg_nolock(struct vx_core *chip, struct vx_rmh *rmh)
 	if (vx_inb(chip, ISR) & ISR_ERR) {
 		err = vx_wait_for_rx_full(chip);
 		if (err < 0) {
-			snd_printd(KERN_DEBUG "vx_send_msg: rx_full read error\n");
+			dev_dbg(chip->card->dev,
+				"vx_send_msg: rx_full read error\n");
 			return err;
 		}
 		err = vx_inb(chip, RXH) << 16;
 		err |= vx_inb(chip, RXM) << 8;
 		err |= vx_inb(chip, RXL);
-		snd_printd(KERN_DEBUG "msg got error = 0x%x at cmd[0]\n", err);
+		dev_dbg(chip->card->dev,
+			"msg got error = 0x%x at cmd[0]\n", err);
 		err = -(VX_ERR_MASK | err);
 		return err;
 	}
@@ -304,7 +300,8 @@ int vx_send_msg_nolock(struct vx_core *chip, struct vx_rmh *rmh)
 			/* Wait for TX ready */
 			err = vx_wait_isr_bit(chip, ISR_TX_READY);
 			if (err < 0) {
-				snd_printd(KERN_DEBUG "vx_send_msg: tx_ready error\n");
+				dev_dbg(chip->card->dev,
+					"vx_send_msg: tx_ready error\n");
 				return err;
 			}
 
@@ -316,14 +313,16 @@ int vx_send_msg_nolock(struct vx_core *chip, struct vx_rmh *rmh)
 			/* Trigger irq MESS_READ_NEXT */
 			err = vx_send_irq_dsp(chip, IRQ_MESS_READ_NEXT);
 			if (err < 0) {
-				snd_printd(KERN_DEBUG "vx_send_msg: IRQ_READ_NEXT error\n");
+				dev_dbg(chip->card->dev,
+					"vx_send_msg: IRQ_READ_NEXT error\n");
 				return err;
 			}
 		}
 		/* Wait for TX empty */
 		err = vx_wait_isr_bit(chip, ISR_TX_READY);
 		if (err < 0) {
-			snd_printd(KERN_DEBUG "vx_send_msg: TX_READY error\n");
+			dev_dbg(chip->card->dev,
+				"vx_send_msg: TX_READY error\n");
 			return err;
 		}
 		/* End of transfer */
@@ -372,9 +371,6 @@ int vx_send_rih_nolock(struct vx_core *chip, int cmd)
 	if (chip->chip_status & VX_STAT_IS_STALE)
 		return -EBUSY;
 
-#if 0
-	printk(KERN_DEBUG "send_rih: cmd = 0x%x\n", cmd);
-#endif
 	err = vx_reset_chk(chip);
 	if (err < 0)
 		return err;
@@ -453,7 +449,7 @@ int snd_vx_load_boot_image(struct vx_core *chip, const struct firmware *boot)
 			if (no_fillup)
 				break;
 			if (vx_wait_isr_bit(chip, ISR_TX_EMPTY) < 0) {
-				snd_printk(KERN_ERR "dsp boot failed at %d\n", i);
+				dev_err(chip->card->dev, "dsp boot failed at %d\n", i);
 				return -EIO;
 			}
 			vx_outb(chip, TXH, 0);
@@ -462,7 +458,7 @@ int snd_vx_load_boot_image(struct vx_core *chip, const struct firmware *boot)
 		} else {
 			const unsigned char *image = boot->data + i;
 			if (vx_wait_isr_bit(chip, ISR_TX_EMPTY) < 0) {
-				snd_printk(KERN_ERR "dsp boot failed at %d\n", i);
+				dev_err(chip->card->dev, "dsp boot failed at %d\n", i);
 				return -EIO;
 			}
 			vx_outb(chip, TXH, image[0]);
@@ -510,18 +506,12 @@ irqreturn_t snd_vx_threaded_irq_handler(int irq, void *dev)
 	if (vx_test_irq_src(chip, &events) < 0)
 		return IRQ_HANDLED;
     
-#if 0
-	if (events & 0x000800)
-		printk(KERN_ERR "DSP Stream underrun ! IRQ events = 0x%x\n", events);
-#endif
-	// printk(KERN_DEBUG "IRQ events = 0x%x\n", events);
-
 	/* We must prevent any application using this DSP
 	 * and block any further request until the application
 	 * either unregisters or reloads the DSP
 	 */
 	if (events & FATAL_DSP_ERROR) {
-		snd_printk(KERN_ERR "vx_core: fatal DSP error!!\n");
+		dev_err(chip->card->dev, "vx_core: fatal DSP error!!\n");
 		return IRQ_HANDLED;
 	}
 
@@ -698,8 +688,8 @@ int snd_vx_dsp_load(struct vx_core *chip, const struct firmware *dsp)
 		/* Wait DSP ready for a new read */
 		err = vx_wait_isr_bit(chip, ISR_TX_EMPTY);
 		if (err < 0) {
-			printk(KERN_ERR
-			       "dsp loading error at position %d\n", i);
+			dev_err(chip->card->dev,
+				"dsp loading error at position %d\n", i);
 			return err;
 		}
 		cptr = image;
@@ -713,7 +703,6 @@ int snd_vx_dsp_load(struct vx_core *chip, const struct firmware *dsp)
 		csum = (csum >> 24) | (csum << 8);
 		vx_outb(chip, TXL, *cptr++);
 	}
-	snd_printdd(KERN_DEBUG "checksum = 0x%08x\n", csum);
 
 	msleep(200);
 
@@ -759,7 +748,8 @@ int snd_vx_resume(struct vx_core *chip)
 			continue;
 		err = chip->ops->load_dsp(chip, i, chip->firmware[i]);
 		if (err < 0) {
-			snd_printk(KERN_ERR "vx: firmware resume error at DSP %d\n", i);
+			dev_err(chip->card->dev,
+				"vx: firmware resume error at DSP %d\n", i);
 			return -EIO;
 		}
 	}
diff --git a/sound/drivers/vx/vx_hwdep.c b/sound/drivers/vx/vx_hwdep.c
index 74f7ab330c7f..a7f8ddf4df5a 100644
--- a/sound/drivers/vx/vx_hwdep.c
+++ b/sound/drivers/vx/vx_hwdep.c
@@ -59,7 +59,7 @@ int snd_vx_setup_firmware(struct vx_core *chip)
 			continue;
 		sprintf(path, "vx/%s", fw_files[chip->type][i]);
 		if (request_firmware(&fw, path, chip->card->dev)) {
-			snd_printk(KERN_ERR "vx: can't load firmware %s\n", path);
+			dev_err(chip->card->dev, "vx: can't load firmware %s\n", path);
 			return -ENOENT;
 		}
 		err = chip->ops->load_dsp(chip, i, fw);
diff --git a/sound/drivers/vx/vx_pcm.c b/sound/drivers/vx/vx_pcm.c
index ceaeb257003b..cbc77ca1ebdd 100644
--- a/sound/drivers/vx/vx_pcm.c
+++ b/sound/drivers/vx/vx_pcm.c
@@ -190,8 +190,10 @@ static int vx_set_ibl(struct vx_core *chip, struct vx_ibl_info *info)
 	info->max_size = rmh.Stat[1];
 	info->min_size = rmh.Stat[2];
 	info->granularity = rmh.Stat[3];
-	snd_printdd(KERN_DEBUG "vx_set_ibl: size = %d, max = %d, min = %d, gran = %d\n",
-		   info->size, info->max_size, info->min_size, info->granularity);
+	dev_dbg(chip->card->dev,
+		"%s: size = %d, max = %d, min = %d, gran = %d\n",
+		__func__, info->size, info->max_size, info->min_size,
+		info->granularity);
 	return 0;
 }
 
@@ -616,12 +618,12 @@ static int vx_pcm_playback_transfer_chunk(struct vx_core *chip,
 	if (space < 0) {
 		/* disconnect the host, SIZE_HBUF command always switches to the stream mode */
 		vx_send_rih(chip, IRQ_CONNECT_STREAM_NEXT);
-		snd_printd("error hbuffer\n");
+		dev_dbg(chip->card->dev, "error hbuffer\n");
 		return space;
 	}
 	if (space < size) {
 		vx_send_rih(chip, IRQ_CONNECT_STREAM_NEXT);
-		snd_printd("no enough hbuffer space %d\n", space);
+		dev_dbg(chip->card->dev, "no enough hbuffer space %d\n", space);
 		return -EIO; /* XRUN */
 	}
 		
@@ -795,7 +797,8 @@ static int vx_pcm_prepare(struct snd_pcm_substream *subs)
 		/* IEC958 status (raw-mode) was changed */
 		/* we reopen the pipe */
 		struct vx_rmh rmh;
-		snd_printdd(KERN_DEBUG "reopen the pipe with data_mode = %d\n", data_mode);
+		dev_dbg(chip->card->dev,
+			"reopen the pipe with data_mode = %d\n", data_mode);
 		vx_init_rmh(&rmh, CMD_FREE_PIPE);
 		vx_set_pipe_cmd_params(&rmh, 0, pipe->number, 0);
 		err = vx_send_msg(chip, &rmh);
@@ -812,8 +815,9 @@ static int vx_pcm_prepare(struct snd_pcm_substream *subs)
 	}
 
 	if (chip->pcm_running && chip->freq != runtime->rate) {
-		snd_printk(KERN_ERR "vx: cannot set different clock %d "
-			   "from the current %d\n", runtime->rate, chip->freq);
+		dev_err(chip->card->dev,
+			"vx: cannot set different clock %d from the current %d\n",
+			runtime->rate, chip->freq);
 		return -EINVAL;
 	}
 	vx_set_clock(chip, runtime->rate);
@@ -1091,7 +1095,7 @@ void vx_pcm_update_intr(struct vx_core *chip, unsigned int events)
 			chip->irq_rmh.Cmd[0] |= 0x00000002;	/* SEL_END_OF_BUF_EVENTS */
 
 		if (vx_send_msg(chip, &chip->irq_rmh) < 0) {
-			snd_printdd(KERN_ERR "msg send error!!\n");
+			dev_dbg(chip->card->dev, "msg send error!!\n");
 			return;
 		}
 
@@ -1141,7 +1145,8 @@ static int vx_init_audio_io(struct vx_core *chip)
 
 	vx_init_rmh(&rmh, CMD_SUPPORTED);
 	if (vx_send_msg(chip, &rmh) < 0) {
-		snd_printk(KERN_ERR "vx: cannot get the supported audio data\n");
+		dev_err(chip->card->dev,
+			"vx: cannot get the supported audio data\n");
 		return -ENXIO;
 	}
 
diff --git a/sound/drivers/vx/vx_uer.c b/sound/drivers/vx/vx_uer.c
index 884c40be19dc..3eca22151225 100644
--- a/sound/drivers/vx/vx_uer.c
+++ b/sound/drivers/vx/vx_uer.c
@@ -196,7 +196,8 @@ void vx_set_internal_clock(struct vx_core *chip, unsigned int freq)
 
 	/* Get real clock value */
 	clock = vx_calc_clock_from_freq(chip, freq);
-	snd_printdd(KERN_DEBUG "set internal clock to 0x%x from freq %d\n", clock, freq);
+	dev_dbg(chip->card->dev,
+		"set internal clock to 0x%x from freq %d\n", clock, freq);
 	mutex_lock(&chip->lock);
 	if (vx_is_pcmcia(chip)) {
 		vx_outb(chip, HIFREQ, (clock >> 8) & 0x0f);
-- 
2.43.0

