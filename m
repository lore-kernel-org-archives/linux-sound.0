Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45631EB497
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 13:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723037667; cv=none; b=Ukko69LTJ0hDLaJvHdKgzfFSZ8PZdemWNETA2olTrS3Z8e3iYPt9PQiVi375rJDlgAV875RYrJxRzVhKIhyH+7y3JvXyGjgo9DVdmegvX+XDvayyOioU2BQlI09nCJcgLB6j+TxDehMlf8uiZ3v5GV/At0mbnBvwK1AJqmkXBh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723037667; c=relaxed/simple;
	bh=pghgWMjmr3uNIy9/OTvb8fPBo0pV1ZaG7Ug2zCGQSJs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T/S6iCfSMmulHMZa83nhG0H7h1uaO2diqUbNx7CRNJfyNnkk5fkOlib15ErPFyFdLl84x7E3XT3IW0uweBbMIUTZwzH4do77bVdTTJb3AMfbw2fqF/hqWfwMXd3N4VZK1SNUikMlQcUZmCn9Fiq4EYj6oO1otzPaXQCQN6jHqKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=W97AtB+5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=m8Ab9fJl; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SHsttvv0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ly/fEw3/; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="W97AtB+5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="m8Ab9fJl";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SHsttvv0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ly/fEw3/"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EC97A1FB95;
	Wed,  7 Aug 2024 13:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037660; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hip9yYrnC0jYAkTDHjdlrxG0ktOVCpMbPfxCsnh92mA=;
	b=W97AtB+5gGxYgC1BfQ4Jw+iq1FZEmDPA+JHOgBIM457WDDBwO4oz84EVuYpkBben43TQfI
	G2UXUG3x308MXijtkzZwWjajnM4SsDAEgXEB3PwzovMLcGUdjM+fTzQWLIiI4rO0pDsXYs
	azyrwmHn215o7yuzgoR3EEqxGrfyqQ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037660;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hip9yYrnC0jYAkTDHjdlrxG0ktOVCpMbPfxCsnh92mA=;
	b=m8Ab9fJlazRdLuzUrUfaOBsME1VKV6HrDFKIHXDUEwcGZ5sfURyTEa2g2KOihlu4K+nskv
	jlVoQNkT6CyKBADg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037659; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hip9yYrnC0jYAkTDHjdlrxG0ktOVCpMbPfxCsnh92mA=;
	b=SHsttvv0rlnfA8oU5m7YbNPxfJfuyJ8HclN50lVCHSZrqACL0lduKyGclNqgb0WB4bGcTI
	zvOBCGDS4iJHgTQF+HHgiTtxrmRjY0fsBap687ZTKzkLfuLhqk87Rt6hKXj0WjBCOd5RhO
	FiM7UIkRCaSeFCiY/ZkwRnh03sULIXE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037659;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hip9yYrnC0jYAkTDHjdlrxG0ktOVCpMbPfxCsnh92mA=;
	b=Ly/fEw3/hQPtz3QPqZUFjZfkRO3Lgyi3ADtTNSTqP5HBOCCpGcj5ausiyLia9q9pmbMRXD
	8WvAWlsTFiNCrEDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D188013B03;
	Wed,  7 Aug 2024 13:34:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qLVDMdt3s2ZpVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 13:34:19 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 24/54] ALSA: es1688: Use standard print API
Date: Wed,  7 Aug 2024 15:34:14 +0200
Message-ID: <20240807133452.9424-25-tiwai@suse.de>
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
X-Spam-Level: 
X-Spamd-Result: default: False [0.21 / 50.00];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.19)[-0.942];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: 0.21

Use the standard print API with dev_*() instead of the old house-baked
one.  It gives better information and allows dynamically control of
debug prints.

For referring to the device, introduce snd_card pointer to struct
snd_es1688.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/es1688.h        |  1 +
 sound/isa/es1688/es1688.c     |  2 +-
 sound/isa/es1688/es1688_lib.c | 55 ++++++++++++++++++-----------------
 3 files changed, 31 insertions(+), 27 deletions(-)

diff --git a/include/sound/es1688.h b/include/sound/es1688.h
index 099569c31fbb..425a3717d77a 100644
--- a/include/sound/es1688.h
+++ b/include/sound/es1688.h
@@ -17,6 +17,7 @@
 #define ES1688_HW_UNDEF	0x0003
 
 struct snd_es1688 {
+	struct snd_card *card;
 	unsigned long port;		/* port of ESS chip */
 	struct resource *res_port;
 	unsigned long mpu_port;		/* MPU-401 port of ESS chip */
diff --git a/sound/isa/es1688/es1688.c b/sound/isa/es1688/es1688.c
index 97728bf45474..6a95dfb7600a 100644
--- a/sound/isa/es1688/es1688.c
+++ b/sound/isa/es1688/es1688.c
@@ -213,7 +213,7 @@ static int snd_card_es968_pnp(struct snd_card *card, unsigned int n,
 
 	error = pnp_activate_dev(pdev);
 	if (error < 0) {
-		snd_printk(KERN_ERR "ES968 pnp configure failure\n");
+		dev_err(card->dev, "ES968 pnp configure failure\n");
 		return error;
 	}
 	port[n] = pnp_port_start(pdev, 0);
diff --git a/sound/isa/es1688/es1688_lib.c b/sound/isa/es1688/es1688_lib.c
index 8554cb2263c1..c0c230149a75 100644
--- a/sound/isa/es1688/es1688_lib.c
+++ b/sound/isa/es1688/es1688_lib.c
@@ -30,9 +30,7 @@ static int snd_es1688_dsp_command(struct snd_es1688 *chip, unsigned char val)
 			outb(val, ES1688P(chip, COMMAND));
 			return 1;
 		}
-#ifdef CONFIG_SND_DEBUG
-	printk(KERN_DEBUG "snd_es1688_dsp_command: timeout (0x%x)\n", val);
-#endif
+	dev_dbg(chip->card->dev, "%s: timeout (0x%x)\n", __func__, val);
 	return 0;
 }
 
@@ -43,7 +41,8 @@ static int snd_es1688_dsp_get_byte(struct snd_es1688 *chip)
 	for (i = 1000; i; i--)
 		if (inb(ES1688P(chip, DATA_AVAIL)) & 0x80)
 			return inb(ES1688P(chip, READ));
-	snd_printd("es1688 get byte failed: 0x%lx = 0x%x!!!\n", ES1688P(chip, DATA_AVAIL), inb(ES1688P(chip, DATA_AVAIL)));
+	dev_dbg(chip->card->dev, "es1688 get byte failed: 0x%lx = 0x%x!!!\n",
+		ES1688P(chip, DATA_AVAIL), inb(ES1688P(chip, DATA_AVAIL)));
 	return -ENODEV;
 }
 
@@ -95,7 +94,8 @@ int snd_es1688_reset(struct snd_es1688 *chip)
 	udelay(30);
 	for (i = 0; i < 1000 && !(inb(ES1688P(chip, DATA_AVAIL)) & 0x80); i++);
 	if (inb(ES1688P(chip, READ)) != 0xaa) {
-		snd_printd("ess_reset at 0x%lx: failed!!!\n", chip->port);
+		dev_dbg(chip->card->dev, "ess_reset at 0x%lx: failed!!!\n",
+			chip->port);
 		return -ENODEV;
 	}
 	snd_es1688_dsp_command(chip, 0xc6);	/* enable extended mode */
@@ -127,7 +127,8 @@ static int snd_es1688_probe(struct snd_es1688 *chip)
 	inb(ES1688P(chip, ENABLE0));	/* ENABLE0 */
 
 	if (snd_es1688_reset(chip) < 0) {
-		snd_printdd("ESS: [0x%lx] reset failed... 0x%x\n", chip->port, inb(ES1688P(chip, READ)));
+		dev_dbg(chip->card->dev, "ESS: [0x%lx] reset failed... 0x%x\n",
+			chip->port, inb(ES1688P(chip, READ)));
 		spin_unlock_irqrestore(&chip->reg_lock, flags);
 		return -ENODEV;
 	}
@@ -145,7 +146,9 @@ static int snd_es1688_probe(struct snd_es1688 *chip)
 
 	spin_unlock_irqrestore(&chip->reg_lock, flags);
 
-	snd_printdd("ESS: [0x%lx] found.. major = 0x%x, minor = 0x%x\n", chip->port, major, minor);
+	dev_dbg(chip->card->dev,
+		"ESS: [0x%lx] found.. major = 0x%x, minor = 0x%x\n",
+		chip->port, major, minor);
 
 	chip->version = (major << 8) | minor;
 	if (!chip->version)
@@ -153,15 +156,16 @@ static int snd_es1688_probe(struct snd_es1688 *chip)
 
 	switch (chip->version & 0xfff0) {
 	case 0x4880:
-		snd_printk(KERN_ERR "[0x%lx] ESS: AudioDrive ES488 detected, "
-			   "but driver is in another place\n", chip->port);
+		dev_err(chip->card->dev,
+			"[0x%lx] ESS: AudioDrive ES488 detected, but driver is in another place\n",
+			chip->port);
 		return -ENODEV;
 	case 0x6880:
 		break;
 	default:
-		snd_printk(KERN_ERR "[0x%lx] ESS: unknown AudioDrive chip "
-			   "with version 0x%x (Jazz16 soundcard?)\n",
-			   chip->port, chip->version);
+		dev_err(chip->card->dev,
+			"[0x%lx] ESS: unknown AudioDrive chip with version 0x%x (Jazz16 soundcard?)\n",
+			chip->port, chip->version);
 		return -ENODEV;
 	}
 
@@ -210,9 +214,6 @@ static int snd_es1688_init(struct snd_es1688 * chip, int enable)
 			}
 		}
 	}
-#if 0
-	snd_printk(KERN_DEBUG "mpu cfg = 0x%x\n", cfg);
-#endif
 	spin_lock_irqsave(&chip->reg_lock, flags);
 	snd_es1688_mixer_write(chip, 0x40, cfg);
 	spin_unlock_irqrestore(&chip->reg_lock, flags);
@@ -225,9 +226,9 @@ static int snd_es1688_init(struct snd_es1688 * chip, int enable)
 		cfg = 0xf0;	/* enable only DMA counter interrupt */
 		irq_bits = irqs[chip->irq & 0x0f];
 		if (irq_bits < 0) {
-			snd_printk(KERN_ERR "[0x%lx] ESS: bad IRQ %d "
-				   "for ES1688 chip!!\n",
-				   chip->port, chip->irq);
+			dev_err(chip->card->dev,
+				"[0x%lx] ESS: bad IRQ %d for ES1688 chip!!\n",
+				chip->port, chip->irq);
 #if 0
 			irq_bits = 0;
 			cfg = 0x10;
@@ -240,8 +241,9 @@ static int snd_es1688_init(struct snd_es1688 * chip, int enable)
 		cfg = 0xf0;	/* extended mode DMA enable */
 		dma = chip->dma8;
 		if (dma > 3 || dma == 2) {
-			snd_printk(KERN_ERR "[0x%lx] ESS: bad DMA channel %d "
-				   "for ES1688 chip!!\n", chip->port, dma);
+			dev_err(chip->card->dev,
+				"[0x%lx] ESS: bad DMA channel %d for ES1688 chip!!\n",
+				chip->port, dma);
 #if 0
 			dma_bits = 0;
 			cfg = 0x00;	/* disable all DMA */
@@ -326,9 +328,9 @@ static int snd_es1688_trigger(struct snd_es1688 *chip, int cmd, unsigned char va
 		return -EINVAL;	/* something is wrong */
 	}
 #if 0
-	printk(KERN_DEBUG "trigger: val = 0x%x, value = 0x%x\n", val, value);
-	printk(KERN_DEBUG "trigger: pointer = 0x%x\n",
-	       snd_dma_pointer(chip->dma8, chip->dma_size));
+	dev_dbg(chip->card->dev, "trigger: val = 0x%x, value = 0x%x\n", val, value);
+	dev_dbg(chip->card->dev, "trigger: pointer = 0x%x\n",
+		snd_dma_pointer(chip->dma8, chip->dma_size));
 #endif
 	snd_es1688_write(chip, 0xb8, (val & 0xf0) | value);
 	spin_unlock(&chip->reg_lock);
@@ -620,20 +622,21 @@ int snd_es1688_create(struct snd_card *card,
 
 	if (chip == NULL)
 		return -ENOMEM;
+	chip->card = card;
 	chip->irq = -1;
 	chip->dma8 = -1;
 	chip->hardware = ES1688_HW_UNDEF;
 	
 	chip->res_port = request_region(port + 4, 12, "ES1688");
 	if (chip->res_port == NULL) {
-		snd_printk(KERN_ERR "es1688: can't grab port 0x%lx\n", port + 4);
+		dev_err(card->dev, "es1688: can't grab port 0x%lx\n", port + 4);
 		err = -EBUSY;
 		goto exit;
 	}
 
 	err = request_irq(irq, snd_es1688_interrupt, 0, "ES1688", (void *) chip);
 	if (err < 0) {
-		snd_printk(KERN_ERR "es1688: can't grab IRQ %d\n", irq);
+		dev_err(card->dev, "es1688: can't grab IRQ %d\n", irq);
 		goto exit;
 	}
 
@@ -642,7 +645,7 @@ int snd_es1688_create(struct snd_card *card,
 	err = request_dma(dma8, "ES1688");
 
 	if (err < 0) {
-		snd_printk(KERN_ERR "es1688: can't grab DMA8 %d\n", dma8);
+		dev_err(card->dev, "es1688: can't grab DMA8 %d\n", dma8);
 		goto exit;
 	}
 	chip->dma8 = dma8;
-- 
2.43.0

