Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C8620012E
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 13:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723037669; cv=none; b=AroUqxO3YF0x2krnJoXSAFvEZ/Wj33JM1+C2TMfA09ddaZLVlVYQKMgKQb32ZlOyKoXiC+TFXt49NB52eRsB+WdYIfL+6/2lOFAcMAwOxD9gwPK80f4HwAq6DvTpVeLFKlHtcdrLdISw3LHhBvpWW8Xq1JguqFDUvUK6BSzTPaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723037669; c=relaxed/simple;
	bh=l0IZfQ72smMZzPocWAJmFYJxW75LPnnzXr3OgN3TtCU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q1LVaAR2MOX9kSFsONkbKHj1+w978mRpDwKDQeR32XEZlztKdVBykHTrk+p2CSriwFwLW52NO4stcA1BKD0j4yvxYp31fniNu8PPvjb0oWvt6tFGsYLWuZpAaXhu1AfjG3Y00Ax9gwpkdj9ohhTcpQh+4YTZh/gq2UomXkLuJxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=U4yjc/eu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=thh0GZEe; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=r2T+8Nez; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OuhCxrYw; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="U4yjc/eu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="thh0GZEe";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="r2T+8Nez";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OuhCxrYw"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id ED58521D2F;
	Wed,  7 Aug 2024 13:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037663; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jEbNRy/ZlsNIhoPoNCSm0+jJLKWDfTo4VB7JFPrmM2w=;
	b=U4yjc/eu6sAvkDOcn/N1ZTNyj4StATSryuL9fWQw2wpzkHDsfbvJ3kl7lhxKXqOiczy6tv
	D8GxferDlm4ymGZ+aFTJiLaaM8/pDyLn7eeerhKZC/AHmM7rU1pAZQYloeP8ENgRSQU+Xw
	YwhRzCOZ1dR3BJwoRo9VanH2hugvMC4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037663;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jEbNRy/ZlsNIhoPoNCSm0+jJLKWDfTo4VB7JFPrmM2w=;
	b=thh0GZEeWlkr6ep7Fqe4q0Zb/GLBp1F3nopAPlfTVuiw4+nPAmhKym6x0gbgqeMPxFLlZY
	LBwa8fGtJZbMYqDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037662; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jEbNRy/ZlsNIhoPoNCSm0+jJLKWDfTo4VB7JFPrmM2w=;
	b=r2T+8Nezg1dJI8x5n+8QZu/kEn/dHlp4pm+3oq/TK1b3CI/AAFTN4TAGEyn3QItqjKQ3sN
	vSuipa20GFy/MPdJyiUWP6xpZqX1V8IUj+y+9LqtbEKM74LwP8Jm+dKHDbMRhmOjkqSCIY
	2lnvzQx97rMV+BQx9mQZsUyE1xJ50kA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037662;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jEbNRy/ZlsNIhoPoNCSm0+jJLKWDfTo4VB7JFPrmM2w=;
	b=OuhCxrYw6LqTX043zvwCIh24pNJBhbANePsuSEBOxXIc5KOJdQH7ZZteWySp1F8y2BRDYK
	ktQQedDSBtxfptDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D4F7713A7D;
	Wed,  7 Aug 2024 13:34:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ANG6Mt53s2ZpVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 13:34:22 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 47/54] ALSA: vxpocket: Use standard print API
Date: Wed,  7 Aug 2024 15:34:37 +0200
Message-ID: <20240807133452.9424-48-tiwai@suse.de>
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

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pcmcia/vx/vxp_ops.c  | 10 ++++++----
 sound/pcmcia/vx/vxpocket.c | 25 ++++++++-----------------
 2 files changed, 14 insertions(+), 21 deletions(-)

diff --git a/sound/pcmcia/vx/vxp_ops.c b/sound/pcmcia/vx/vxp_ops.c
index 4176abd73799..0bc5c5d9d157 100644
--- a/sound/pcmcia/vx/vxp_ops.c
+++ b/sound/pcmcia/vx/vxp_ops.c
@@ -84,7 +84,7 @@ static int vx_check_magic(struct vx_core *chip)
 			return 0;
 		msleep(10);
 	} while (time_after_eq(end_time, jiffies));
-	snd_printk(KERN_ERR "cannot find xilinx magic word (%x)\n", c);
+	dev_err(chip->card->dev, "cannot find xilinx magic word (%x)\n", c);
 	return -EIO;
 }
 
@@ -153,7 +153,6 @@ static int vxp_load_xilinx_binary(struct vx_core *_chip, const struct firmware *
 	vx_outb(chip, ICR, 0);
 
 	/* Wait for answer HF2 equal to 1 */
-	snd_printdd(KERN_DEBUG "check ISR_HF2\n");
 	if (vx_check_isr(_chip, ISR_HF2, ISR_HF2, 20) < 0)
 		goto _error;
 
@@ -170,7 +169,9 @@ static int vxp_load_xilinx_binary(struct vx_core *_chip, const struct firmware *
 			goto _error;
 		c = vx_inb(chip, RXL);
 		if (c != (int)data)
-			snd_printk(KERN_ERR "vxpocket: load xilinx mismatch at %d: 0x%x != 0x%x\n", i, c, (int)data);
+			dev_err(_chip->card->dev,
+				"vxpocket: load xilinx mismatch at %d: 0x%x != 0x%x\n",
+				i, c, (int)data);
         }
 
 	/* reset HF1 */
@@ -188,7 +189,8 @@ static int vxp_load_xilinx_binary(struct vx_core *_chip, const struct firmware *
 	c |= (int)vx_inb(chip, RXM) << 8;
 	c |= vx_inb(chip, RXL);
 
-	snd_printdd(KERN_DEBUG "xilinx: dsp size received 0x%x, orig 0x%zx\n", c, fw->size);
+	dev_dbg(_chip->card->dev,
+		"xilinx: dsp size received 0x%x, orig 0x%zx\n", c, fw->size);
 
 	vx_outb(chip, ICR, ICR_HF0);
 
diff --git a/sound/pcmcia/vx/vxpocket.c b/sound/pcmcia/vx/vxpocket.c
index 7a0f0e73ceb2..2ea62efa0064 100644
--- a/sound/pcmcia/vx/vxpocket.c
+++ b/sound/pcmcia/vx/vxpocket.c
@@ -151,7 +151,8 @@ static int snd_vxpocket_assign_resources(struct vx_core *chip, int port, int irq
 	struct snd_card *card = chip->card;
 	struct snd_vxpocket *vxp = to_vxpocket(chip);
 
-	snd_printdd(KERN_DEBUG "vxpocket assign resources: port = 0x%x, irq = %d\n", port, irq);
+	dev_dbg(chip->card->dev,
+		"vxpocket assign resources: port = 0x%x, irq = %d\n", port, irq);
 	vxp->port = port;
 
 	sprintf(card->shortname, "Digigram %s", card->driver);
@@ -178,13 +179,11 @@ static int vxpocket_config(struct pcmcia_device *link)
 	struct vx_core *chip = link->priv;
 	int ret;
 
-	snd_printdd(KERN_DEBUG "vxpocket_config called\n");
-
 	/* redefine hardware record according to the VERSION1 string */
 	if (!strcmp(link->prod_id[1], "VX-POCKET")) {
-		snd_printdd("VX-pocket is detected\n");
+		dev_dbg(chip->card->dev, "VX-pocket is detected\n");
 	} else {
-		snd_printdd("VX-pocket 440 is detected\n");
+		dev_dbg(chip->card->dev, "VX-pocket 440 is detected\n");
 		/* overwrite the hardware information */
 		chip->hw = &vxp440_hw;
 		chip->type = vxp440_hw.type;
@@ -226,11 +225,8 @@ static int vxp_suspend(struct pcmcia_device *link)
 {
 	struct vx_core *chip = link->priv;
 
-	snd_printdd(KERN_DEBUG "SUSPEND\n");
-	if (chip) {
-		snd_printdd(KERN_DEBUG "snd_vx_suspend calling\n");
+	if (chip)
 		snd_vx_suspend(chip);
-	}
 
 	return 0;
 }
@@ -239,15 +235,10 @@ static int vxp_resume(struct pcmcia_device *link)
 {
 	struct vx_core *chip = link->priv;
 
-	snd_printdd(KERN_DEBUG "RESUME\n");
 	if (pcmcia_dev_present(link)) {
-		//struct snd_vxpocket *vxp = (struct snd_vxpocket *)chip;
-		if (chip) {
-			snd_printdd(KERN_DEBUG "calling snd_vx_resume\n");
+		if (chip)
 			snd_vx_resume(chip);
-		}
 	}
-	snd_printdd(KERN_DEBUG "resume done!\n");
 
 	return 0;
 }
@@ -269,7 +260,7 @@ static int vxpocket_probe(struct pcmcia_device *p_dev)
 			break;
 	}
 	if (i >= SNDRV_CARDS) {
-		snd_printk(KERN_ERR "vxpocket: too many cards found\n");
+		dev_err(&p_dev->dev, "vxpocket: too many cards found\n");
 		return -EINVAL;
 	}
 	if (! enable[i])
@@ -279,7 +270,7 @@ static int vxpocket_probe(struct pcmcia_device *p_dev)
 	err = snd_card_new(&p_dev->dev, index[i], id[i], THIS_MODULE,
 			   0, &card);
 	if (err < 0) {
-		snd_printk(KERN_ERR "vxpocket: cannot create a card instance\n");
+		dev_err(&pdev->dev, "vxpocket: cannot create a card instance\n");
 		return err;
 	}
 
-- 
2.43.0

