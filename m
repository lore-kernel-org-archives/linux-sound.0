Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0D120124F
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 13:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723037670; cv=none; b=jY7UYt5mN/A9qqDOkg/pUE49eBnB7x7QBlCL7Jc7cknyXnnaQN5GSIlXSL0DEujkj43tmF96+LTEKAtqYP8P6E0XmEZ884zVVQfwXrtunnIRp4JxmkOQ/2zwaBS2O8YP4PRnrGPqDSZxQRMUWg+4+0iV4Xt7P0Frmw9B7E2NPxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723037670; c=relaxed/simple;
	bh=0LmwDGU7XeS9pNRquyFKaeM80+qCk79XsVi+NhzqMi4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Loi9BqT0LuidrcWqE8AXw2p1PVyvnQOFE9jbT52qm8bK05SLMeN/tymEcdkewBPrL0t5pfMG4ELSy2SYzHir2joSsCUHNeptRfn460YNTtB3ZXDPK8j0Nf3+aVC4Og0Vpq7SRWcS5CoHRoYi4o6poEgGrH8SV2XttGL0jmoJxj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IUN9ELsF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=keLefF5F; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IUN9ELsF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=keLefF5F; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IUN9ELsF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="keLefF5F";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IUN9ELsF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="keLefF5F"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 34F551FC86;
	Wed,  7 Aug 2024 13:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037663; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F2JiAOeEOyvaz6YRYE+ONWoikLcRDTDfv+3lHGPa9qk=;
	b=IUN9ELsFqfNnvOGPlJfxXye7xkpHLb252gS+VJ15kX+YQys6os/u5r2/ReuyOx+MClBkQp
	klhs8ZGzfydawRi8ckfC0UEaFGHlurL4Fw/zfATx5HmT3ATYVkyAShg7gcjWprGCXm+D76
	YFlKZ7OkV7Le7qCm71BZgV7d694gVqE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037663;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F2JiAOeEOyvaz6YRYE+ONWoikLcRDTDfv+3lHGPa9qk=;
	b=keLefF5FN5tfjAnyq56U6uArCGqKjkmR9K10rjGLLKbzSP1PU7IZB0u8ABTb9Pis1LY/kV
	g0fGkTFnQ4L1wKAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037663; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F2JiAOeEOyvaz6YRYE+ONWoikLcRDTDfv+3lHGPa9qk=;
	b=IUN9ELsFqfNnvOGPlJfxXye7xkpHLb252gS+VJ15kX+YQys6os/u5r2/ReuyOx+MClBkQp
	klhs8ZGzfydawRi8ckfC0UEaFGHlurL4Fw/zfATx5HmT3ATYVkyAShg7gcjWprGCXm+D76
	YFlKZ7OkV7Le7qCm71BZgV7d694gVqE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037663;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F2JiAOeEOyvaz6YRYE+ONWoikLcRDTDfv+3lHGPa9qk=;
	b=keLefF5FN5tfjAnyq56U6uArCGqKjkmR9K10rjGLLKbzSP1PU7IZB0u8ABTb9Pis1LY/kV
	g0fGkTFnQ4L1wKAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1C5D813A7D;
	Wed,  7 Aug 2024 13:34:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +D6vBd93s2ZpVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 13:34:23 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 49/54] ALSA: ppc: Use standard print API
Date: Wed,  7 Aug 2024 15:34:39 +0200
Message-ID: <20240807133452.9424-50-tiwai@suse.de>
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
	NEURAL_HAM_SHORT(-0.19)[-0.950];
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
 sound/ppc/awacs.c    |  4 ++--
 sound/ppc/daca.c     |  2 +-
 sound/ppc/keywest.c  |  5 +++--
 sound/ppc/pmac.c     | 52 ++++++++++++++++++++------------------------
 sound/ppc/powermac.c |  2 +-
 sound/ppc/tumbler.c  | 21 +++++++++---------
 6 files changed, 41 insertions(+), 45 deletions(-)

diff --git a/sound/ppc/awacs.c b/sound/ppc/awacs.c
index 659866cfe3b4..49399a4a290d 100644
--- a/sound/ppc/awacs.c
+++ b/sound/ppc/awacs.c
@@ -39,7 +39,7 @@ static void snd_pmac_screamer_wait(struct snd_pmac *chip)
 	while (!(in_le32(&chip->awacs->codec_stat) & MASK_VALID)) {
 		mdelay(1);
 		if (! --timeout) {
-			snd_printd("snd_pmac_screamer_wait timeout\n");
+			dev_dbg(chip->card->dev, "%s timeout\n", __func__);
 			break;
 		}
 	}
@@ -58,7 +58,7 @@ snd_pmac_awacs_write(struct snd_pmac *chip, int val)
 	out_le32(&chip->awacs->codec_ctrl, val | (chip->subframe << 22));
 	while (in_le32(&chip->awacs->codec_ctrl) & MASK_NEWECMD) {
 		if (! --timeout) {
-			snd_printd("snd_pmac_awacs_write timeout\n");
+			dev_dbg(chip->card->dev, "%s timeout\n", __func__);
 			break;
 		}
 	}
diff --git a/sound/ppc/daca.c b/sound/ppc/daca.c
index 4da9278dd58a..d5766952f3db 100644
--- a/sound/ppc/daca.c
+++ b/sound/ppc/daca.c
@@ -69,7 +69,7 @@ static int daca_set_volume(struct pmac_daca *mix)
 	data[1] |= mix->deemphasis ? 0x40 : 0;
 	if (i2c_smbus_write_block_data(mix->i2c.client, DACA_REG_AVOL,
 				       2, data) < 0) {
-		snd_printk(KERN_ERR "failed to set volume \n");
+		dev_err(&mix->i2c.client->dev, "failed to set volume\n");
 		return -EINVAL;
 	}
 	return 0;
diff --git a/sound/ppc/keywest.c b/sound/ppc/keywest.c
index 2894d041b2f5..3d3513d9def5 100644
--- a/sound/ppc/keywest.c
+++ b/sound/ppc/keywest.c
@@ -113,7 +113,8 @@ int snd_pmac_tumbler_post_init(void)
 
 	err = keywest_ctx->init_client(keywest_ctx);
 	if (err < 0) {
-		snd_printk(KERN_ERR "tumbler: %i :cannot initialize the MCS\n", err);
+		dev_err(&keywest_ctx->client->dev,
+			"tumbler: %i :cannot initialize the MCS\n", err);
 		return err;
 	}
 	return 0;
@@ -136,7 +137,7 @@ int snd_pmac_keywest_init(struct pmac_keywest *i2c)
 
 	err = i2c_add_driver(&keywest_driver);
 	if (err) {
-		snd_printk(KERN_ERR "cannot register keywest i2c driver\n");
+		dev_err(&i2c->client->dev, "cannot register keywest i2c driver\n");
 		i2c_put_adapter(adap);
 		return err;
 	}
diff --git a/sound/ppc/pmac.c b/sound/ppc/pmac.c
index 84058bbf9d12..76674c43fa7e 100644
--- a/sound/ppc/pmac.c
+++ b/sound/ppc/pmac.c
@@ -269,7 +269,6 @@ static int snd_pmac_pcm_trigger(struct snd_pmac *chip, struct pmac_stream *rec,
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 		spin_lock(&chip->reg_lock);
 		rec->running = 0;
-		/*printk(KERN_DEBUG "stopped!!\n");*/
 		snd_pmac_dma_stop(rec);
 		for (i = 0, cp = rec->cmd.cmds; i < rec->nperiods; i++, cp++)
 			out_le16(&cp->command, DBDMA_STOP);
@@ -304,7 +303,6 @@ static snd_pcm_uframes_t snd_pmac_pcm_pointer(struct snd_pmac *chip,
 	}
 #endif
 	count += rec->cur_period * rec->period_size;
-	/*printk(KERN_DEBUG "pointer=%d\n", count);*/
 	return bytes_to_frames(subs->runtime, count);
 }
 
@@ -384,8 +382,6 @@ static inline void snd_pmac_pcm_dead_xfer(struct pmac_stream *rec,
 	unsigned short req, res ;
 	unsigned int phy ;
 
-	/* printk(KERN_WARNING "snd-powermac: DMA died - patching it up!\n"); */
-
 	/* to clear DEAD status we must first clear RUN
 	   set it to quiescent to be on the safe side */
 	(void)in_le32(&rec->dma->status);
@@ -456,7 +452,6 @@ static void snd_pmac_pcm_update(struct snd_pmac *chip, struct pmac_stream *rec)
 			if (! (stat & ACTIVE))
 				break;
 
-			/*printk(KERN_DEBUG "update frag %d\n", rec->cur_period);*/
 			cp->xfer_status = cpu_to_le16(0);
 			cp->req_count = cpu_to_le16(rec->period_size);
 			/*cp->res_count = cpu_to_le16(0);*/
@@ -770,7 +765,6 @@ snd_pmac_ctrl_intr(int irq, void *devid)
 	struct snd_pmac *chip = devid;
 	int ctrl = in_le32(&chip->awacs->control);
 
-	/*printk(KERN_DEBUG "pmac: control interrupt.. 0x%x\n", ctrl);*/
 	if (ctrl & MASK_PORTCHG) {
 		/* do something when headphone is plugged/unplugged? */
 		if (chip->update_automute)
@@ -779,7 +773,7 @@ snd_pmac_ctrl_intr(int irq, void *devid)
 	if (ctrl & MASK_CNTLERR) {
 		int err = (in_le32(&chip->awacs->codec_stat) & MASK_ERRCODE) >> 16;
 		if (err && chip->model <= PMAC_SCREAMER)
-			snd_printk(KERN_DEBUG "error %x\n", err);
+			dev_dbg(chip->card->dev, "%s: error %x\n", __func__, err);
 	}
 	/* Writing 1s to the CNTLERR and PORTCHG bits clears them... */
 	out_le32(&chip->awacs->control, ctrl);
@@ -964,9 +958,8 @@ static int snd_pmac_detect(struct snd_pmac *chip)
 	if (prop) {
 		/* partly deprecate snd-powermac, for those machines
 		 * that have a layout-id property for now */
-		printk(KERN_INFO "snd-powermac no longer handles any "
-				 "machines with a layout-id property "
-				 "in the device-tree, use snd-aoa.\n");
+		dev_info(chip->card->dev,
+			 "snd-powermac no longer handles any machines with a layout-id property in the device-tree, use snd-aoa.\n");
 		of_node_put(sound);
 		of_node_put(chip->node);
 		chip->node = NULL;
@@ -1021,7 +1014,7 @@ static int snd_pmac_detect(struct snd_pmac *chip)
 	 */
 	macio = macio_find(chip->node, macio_unknown);
 	if (macio == NULL)
-		printk(KERN_WARNING "snd-powermac: can't locate macio !\n");
+		dev_warn(chip->card->dev, "snd-powermac: can't locate macio !\n");
 	else {
 		struct pci_dev *pdev = NULL;
 
@@ -1034,8 +1027,8 @@ static int snd_pmac_detect(struct snd_pmac *chip)
 		}
 	}
 	if (chip->pdev == NULL)
-		printk(KERN_WARNING "snd-powermac: can't locate macio PCI"
-		       " device !\n");
+		dev_warn(chip->card->dev,
+			 "snd-powermac: can't locate macio PCI device !\n");
 
 	detect_byte_swap(chip);
 
@@ -1125,7 +1118,8 @@ int snd_pmac_add_automute(struct snd_pmac *chip)
 	chip->auto_mute = 1;
 	err = snd_ctl_add(chip->card, snd_ctl_new1(&auto_mute_controls[0], chip));
 	if (err < 0) {
-		printk(KERN_ERR "snd-powermac: Failed to add automute control\n");
+		dev_err(chip->card->dev,
+			"snd-powermac: Failed to add automute control\n");
 		return err;
 	}
 	chip->hp_detect_ctl = snd_ctl_new1(&auto_mute_controls[1], chip);
@@ -1180,17 +1174,18 @@ int snd_pmac_new(struct snd_card *card, struct snd_pmac **chip_return)
 		for (i = 0; i < 2; i ++) {
 			if (of_address_to_resource(np->parent, i,
 						   &chip->rsrc[i])) {
-				printk(KERN_ERR "snd: can't translate rsrc "
-				       " %d (%s)\n", i, rnames[i]);
+				dev_err(chip->card->dev,
+					"snd: can't translate rsrc %d (%s)\n",
+					i, rnames[i]);
 				err = -ENODEV;
 				goto __error;
 			}
 			if (request_mem_region(chip->rsrc[i].start,
 					       resource_size(&chip->rsrc[i]),
 					       rnames[i]) == NULL) {
-				printk(KERN_ERR "snd: can't request rsrc "
-				       " %d (%s: %pR)\n",
-				       i, rnames[i], &chip->rsrc[i]);
+				dev_err(chip->card->dev,
+					"snd: can't request rsrc %d (%s: %pR)\n",
+					i, rnames[i], &chip->rsrc[i]);
 				err = -ENODEV;
 				goto __error;
 			}
@@ -1205,17 +1200,18 @@ int snd_pmac_new(struct snd_card *card, struct snd_pmac **chip_return)
 		for (i = 0; i < 3; i ++) {
 			if (of_address_to_resource(np, i,
 						   &chip->rsrc[i])) {
-				printk(KERN_ERR "snd: can't translate rsrc "
-				       " %d (%s)\n", i, rnames[i]);
+				dev_err(chip->card->dev,
+					"snd: can't translate rsrc %d (%s)\n",
+					i, rnames[i]);
 				err = -ENODEV;
 				goto __error;
 			}
 			if (request_mem_region(chip->rsrc[i].start,
 					       resource_size(&chip->rsrc[i]),
 					       rnames[i]) == NULL) {
-				printk(KERN_ERR "snd: can't request rsrc "
-				       " %d (%s: %pR)\n",
-				       i, rnames[i], &chip->rsrc[i]);
+				dev_err(chip->card->dev,
+					"snd: can't request rsrc %d (%s: %pR)\n",
+					i, rnames[i], &chip->rsrc[i]);
 				err = -ENODEV;
 				goto __error;
 			}
@@ -1233,8 +1229,8 @@ int snd_pmac_new(struct snd_card *card, struct snd_pmac **chip_return)
 		irq = irq_of_parse_and_map(np, 0);
 		if (request_irq(irq, snd_pmac_ctrl_intr, 0,
 				"PMac", (void*)chip)) {
-			snd_printk(KERN_ERR "pmac: unable to grab IRQ %d\n",
-				   irq);
+			dev_err(chip->card->dev,
+				"pmac: unable to grab IRQ %d\n", irq);
 			err = -EBUSY;
 			goto __error;
 		}
@@ -1242,14 +1238,14 @@ int snd_pmac_new(struct snd_card *card, struct snd_pmac **chip_return)
 	}
 	irq = irq_of_parse_and_map(np, 1);
 	if (request_irq(irq, snd_pmac_tx_intr, 0, "PMac Output", (void*)chip)){
-		snd_printk(KERN_ERR "pmac: unable to grab IRQ %d\n", irq);
+		dev_err(chip->card->dev, "pmac: unable to grab IRQ %d\n", irq);
 		err = -EBUSY;
 		goto __error;
 	}
 	chip->tx_irq = irq;
 	irq = irq_of_parse_and_map(np, 2);
 	if (request_irq(irq, snd_pmac_rx_intr, 0, "PMac Input", (void*)chip)) {
-		snd_printk(KERN_ERR "pmac: unable to grab IRQ %d\n", irq);
+		dev_err(chip->card->dev, "pmac: unable to grab IRQ %d\n", irq);
 		err = -EBUSY;
 		goto __error;
 	}
diff --git a/sound/ppc/powermac.c b/sound/ppc/powermac.c
index e17af46abddd..8e29c92830ad 100644
--- a/sound/ppc/powermac.c
+++ b/sound/ppc/powermac.c
@@ -104,7 +104,7 @@ static int snd_pmac_probe(struct platform_device *devptr)
 			goto __error;
 		break;
 	default:
-		snd_printk(KERN_ERR "unsupported hardware %d\n", chip->model);
+		dev_err(&devptr->dev, "unsupported hardware %d\n", chip->model);
 		err = -EINVAL;
 		goto __error;
 	}
diff --git a/sound/ppc/tumbler.c b/sound/ppc/tumbler.c
index 12f1e10db1c4..3c09660e1522 100644
--- a/sound/ppc/tumbler.c
+++ b/sound/ppc/tumbler.c
@@ -29,7 +29,7 @@
 #undef DEBUG
 
 #ifdef DEBUG
-#define DBG(fmt...) printk(KERN_DEBUG fmt)
+#define DBG(fmt...) pr_debug(fmt)
 #else
 #define DBG(fmt...)
 #endif
@@ -230,7 +230,7 @@ static int tumbler_set_master_volume(struct pmac_tumbler *mix)
   
 	if (i2c_smbus_write_i2c_block_data(mix->i2c.client, TAS_REG_VOL, 6,
 					   block) < 0) {
-		snd_printk(KERN_ERR "failed to set volume \n");
+		dev_err(&mix->i2c.client->dev, "failed to set volume\n");
 		return -EINVAL;
 	}
 	DBG("(I) succeeded to set volume (%u, %u)\n", left_vol, right_vol);
@@ -341,7 +341,7 @@ static int tumbler_set_drc(struct pmac_tumbler *mix)
 
 	if (i2c_smbus_write_i2c_block_data(mix->i2c.client, TAS_REG_DRC,
 					   2, val) < 0) {
-		snd_printk(KERN_ERR "failed to set DRC\n");
+		dev_err(&mix->i2c.client->dev, "failed to set DRC\n");
 		return -EINVAL;
 	}
 	DBG("(I) succeeded to set DRC (%u, %u)\n", val[0], val[1]);
@@ -378,7 +378,7 @@ static int snapper_set_drc(struct pmac_tumbler *mix)
 
 	if (i2c_smbus_write_i2c_block_data(mix->i2c.client, TAS_REG_DRC,
 					   6, val) < 0) {
-		snd_printk(KERN_ERR "failed to set DRC\n");
+		dev_err(&mix->i2c.client->dev, "failed to set DRC\n");
 		return -EINVAL;
 	}
 	DBG("(I) succeeded to set DRC (%u, %u)\n", val[0], val[1]);
@@ -503,8 +503,8 @@ static int tumbler_set_mono_volume(struct pmac_tumbler *mix,
 		block[i] = (vol >> ((info->bytes - i - 1) * 8)) & 0xff;
 	if (i2c_smbus_write_i2c_block_data(mix->i2c.client, info->reg,
 					   info->bytes, block) < 0) {
-		snd_printk(KERN_ERR "failed to set mono volume %d\n",
-			   info->index);
+		dev_err(&mix->i2c.client->dev, "failed to set mono volume %d\n",
+			info->index);
 		return -EINVAL;
 	}
 	return 0;
@@ -643,7 +643,8 @@ static int snapper_set_mix_vol1(struct pmac_tumbler *mix, int idx, int ch, int r
 	}
 	if (i2c_smbus_write_i2c_block_data(mix->i2c.client, reg,
 					   9, block) < 0) {
-		snd_printk(KERN_ERR "failed to set mono volume %d\n", reg);
+		dev_err(&mix->i2c.client->dev,
+			"failed to set mono volume %d\n", reg);
 		return -EINVAL;
 	}
 	return 0;
@@ -1102,7 +1103,6 @@ static long tumbler_find_device(const char *device, const char *platform,
 		node = find_audio_device(device);
 	if (! node) {
 		DBG("(W) cannot find audio device %s !\n", device);
-		snd_printdd("cannot find device %s\n", device);
 		return -ENODEV;
 	}
 
@@ -1111,7 +1111,6 @@ static long tumbler_find_device(const char *device, const char *platform,
 		base = of_get_property(node, "reg", NULL);
 		if (!base) {
 			DBG("(E) cannot find address for device %s !\n", device);
-			snd_printd("cannot find address for device %s\n", device);
 			of_node_put(node);
 			return -ENODEV;
 		}
@@ -1232,9 +1231,9 @@ static void tumbler_resume(struct snd_pmac *chip)
 	tumbler_reset_audio(chip);
 	if (mix->i2c.client && mix->i2c.init_client) {
 		if (mix->i2c.init_client(&mix->i2c) < 0)
-			printk(KERN_ERR "tumbler_init_client error\n");
+			dev_err(chip->card->dev, "tumbler_init_client error\n");
 	} else
-		printk(KERN_ERR "tumbler: i2c is not initialized\n");
+		dev_err(chip->card->dev, "tumbler: i2c is not initialized\n");
 	if (chip->model == PMAC_TUMBLER) {
 		tumbler_set_mono_volume(mix, &tumbler_pcm_vol_info);
 		tumbler_set_mono_volume(mix, &tumbler_bass_vol_info);
-- 
2.43.0

