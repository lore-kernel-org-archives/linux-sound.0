Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F54E1EA0BC
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 13:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723037666; cv=none; b=qrRo3osgGpcDr8jSq6gp0ACARXwBJnvCm38OjgmEv3rFxN4lQx55MoY+92ErppGfpch4PAPyLtEobSbHCIP8WYp/jKPth9G+WiIcglWeomUCF13zM3f5OhZhzQXyOPwBZowR/ULfg4Hra2uVKOf16fEKE2CVrQlDazH3+j8u1Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723037666; c=relaxed/simple;
	bh=Av0KYcmZEwUJBmDw9a+vcnuidl7yZJKuglH2lWyFd48=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sLkBk79WonDBp2RW3gv/J+ak/TUExz/z6B22p1xOAZj8Sg/AYtAFCAFZYzKE0emvZ+X/WkjEKyzQcMF1du1PLhgg9yLw9mRYfRkJ5DLlWuTE7XpHrLvEMzbqSjSe9bb1eMT8nTRtsOn2UB74kvhdNynPFX/Axk8nUq0eOYsqo34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eAxg5ckc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yk3eMogb; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eAxg5ckc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yk3eMogb; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eAxg5ckc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yk3eMogb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eAxg5ckc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yk3eMogb"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 196811FB96;
	Wed,  7 Aug 2024 13:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037660; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FgIIe3jLm4lIGUeZ2niVSrxKFfVmubI0qPh2fWP0790=;
	b=eAxg5ckc7zi24Uw/NQZl6ktvAY9zzd/RUujSddAMFGL7oyZqjZJ/ztJ/RBu0hzIhqWqYE0
	ESUu+VtXe392Zl4UR0HitZ61kIg8h2gdg6K2v/a1olq1+Gts7rYZWuq+IpPvqgMCE81YXh
	RCpG96Qn9Uy/Upr/wDaHbaM+jlQXuIY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037660;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FgIIe3jLm4lIGUeZ2niVSrxKFfVmubI0qPh2fWP0790=;
	b=yk3eMogbNWWxxPltEZmGgLjwbTiK9JDt/N7EA+mSreAZwHbVMPI03BJtNlHprWlTZ6B1On
	dk2GZuTdY5ZpnzDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037660; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FgIIe3jLm4lIGUeZ2niVSrxKFfVmubI0qPh2fWP0790=;
	b=eAxg5ckc7zi24Uw/NQZl6ktvAY9zzd/RUujSddAMFGL7oyZqjZJ/ztJ/RBu0hzIhqWqYE0
	ESUu+VtXe392Zl4UR0HitZ61kIg8h2gdg6K2v/a1olq1+Gts7rYZWuq+IpPvqgMCE81YXh
	RCpG96Qn9Uy/Upr/wDaHbaM+jlQXuIY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037660;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FgIIe3jLm4lIGUeZ2niVSrxKFfVmubI0qPh2fWP0790=;
	b=yk3eMogbNWWxxPltEZmGgLjwbTiK9JDt/N7EA+mSreAZwHbVMPI03BJtNlHprWlTZ6B1On
	dk2GZuTdY5ZpnzDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 016E013A7D;
	Wed,  7 Aug 2024 13:34:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mGHQOtt3s2ZpVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 13:34:19 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 25/54] ALSA: es18xx: Use standard print API
Date: Wed,  7 Aug 2024 15:34:15 +0200
Message-ID: <20240807133452.9424-26-tiwai@suse.de>
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
	NEURAL_HAM_SHORT(-0.19)[-0.945];
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

For referring to the device, introduce snd_card pointer to struct
snd_es18xx.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/es18xx.c | 87 ++++++++++++++++++++++++----------------------
 1 file changed, 46 insertions(+), 41 deletions(-)

diff --git a/sound/isa/es18xx.c b/sound/isa/es18xx.c
index 0a32845b1017..59c784a70ac1 100644
--- a/sound/isa/es18xx.c
+++ b/sound/isa/es18xx.c
@@ -82,9 +82,8 @@
 #define SNDRV_LEGACY_FIND_FREE_DMA
 #include <sound/initval.h>
 
-#define PFX "es18xx: "
-
 struct snd_es18xx {
+	struct snd_card *card;
 	unsigned long port;		/* port of ESS chip */
 	unsigned long ctrl_port;	/* Control port of ESS chip */
 	int irq;			/* IRQ number of ESS chip */
@@ -165,7 +164,7 @@ static int snd_es18xx_dsp_command(struct snd_es18xx *chip, unsigned char val)
                         outb(val, chip->port + 0x0C);
                         return 0;
                 }
-	snd_printk(KERN_ERR "dsp_command: timeout (0x%x)\n", val);
+	dev_err(chip->card->dev, "dsp_command: timeout (0x%x)\n", val);
         return -EINVAL;
 }
 
@@ -176,8 +175,8 @@ static int snd_es18xx_dsp_get_byte(struct snd_es18xx *chip)
         for(i = MILLISECOND/10; i; i--)
                 if (inb(chip->port + 0x0C) & 0x40)
                         return inb(chip->port + 0x0A);
-	snd_printk(KERN_ERR "dsp_get_byte failed: 0x%lx = 0x%x!!!\n",
-		   chip->port + 0x0A, inb(chip->port + 0x0A));
+	dev_err(chip->card->dev, "dsp_get_byte failed: 0x%lx = 0x%x!!!\n",
+		chip->port + 0x0A, inb(chip->port + 0x0A));
         return -ENODEV;
 }
 
@@ -197,7 +196,7 @@ static int snd_es18xx_write(struct snd_es18xx *chip,
  end:
         spin_unlock_irqrestore(&chip->reg_lock, flags);
 #ifdef REG_DEBUG
-	snd_printk(KERN_DEBUG "Reg %02x set to %02x\n", reg, data);
+	dev_dbg(chip->card->dev, "Reg %02x set to %02x\n", reg, data);
 #endif
 	return ret;
 }
@@ -216,7 +215,7 @@ static int snd_es18xx_read(struct snd_es18xx *chip, unsigned char reg)
 	data = snd_es18xx_dsp_get_byte(chip);
 	ret = data;
 #ifdef REG_DEBUG
-	snd_printk(KERN_DEBUG "Reg %02x now is %02x (%d)\n", reg, data, ret);
+	dev_dbg(chip->card->dev, "Reg %02x now is %02x (%d)\n", reg, data, ret);
 #endif
  end:
         spin_unlock_irqrestore(&chip->reg_lock, flags);
@@ -252,8 +251,8 @@ static int snd_es18xx_bits(struct snd_es18xx *chip, unsigned char reg,
 		if (ret < 0)
 			goto end;
 #ifdef REG_DEBUG
-		snd_printk(KERN_DEBUG "Reg %02x was %02x, set to %02x (%d)\n",
-			   reg, old, new, ret);
+		dev_dbg(chip->card->dev, "Reg %02x was %02x, set to %02x (%d)\n",
+			reg, old, new, ret);
 #endif
 	}
 	ret = oval;
@@ -271,7 +270,7 @@ static inline void snd_es18xx_mixer_write(struct snd_es18xx *chip,
         outb(data, chip->port + 0x05);
         spin_unlock_irqrestore(&chip->mixer_lock, flags);
 #ifdef REG_DEBUG
-	snd_printk(KERN_DEBUG "Mixer reg %02x set to %02x\n", reg, data);
+	dev_dbg(chip->card->dev, "Mixer reg %02x set to %02x\n", reg, data);
 #endif
 }
 
@@ -284,7 +283,7 @@ static inline int snd_es18xx_mixer_read(struct snd_es18xx *chip, unsigned char r
 	data = inb(chip->port + 0x05);
         spin_unlock_irqrestore(&chip->mixer_lock, flags);
 #ifdef REG_DEBUG
-	snd_printk(KERN_DEBUG "Mixer reg %02x now is %02x\n", reg, data);
+	dev_dbg(chip->card->dev, "Mixer reg %02x now is %02x\n", reg, data);
 #endif
         return data;
 }
@@ -303,8 +302,8 @@ static inline int snd_es18xx_mixer_bits(struct snd_es18xx *chip, unsigned char r
 		new = (old & ~mask) | (val & mask);
 		outb(new, chip->port + 0x05);
 #ifdef REG_DEBUG
-		snd_printk(KERN_DEBUG "Mixer reg %02x was %02x, set to %02x\n",
-			   reg, old, new);
+		dev_dbg(chip->card->dev, "Mixer reg %02x was %02x, set to %02x\n",
+			reg, old, new);
 #endif
 	}
         spin_unlock_irqrestore(&chip->mixer_lock, flags);
@@ -324,8 +323,8 @@ static inline int snd_es18xx_mixer_writable(struct snd_es18xx *chip, unsigned ch
 	new = inb(chip->port + 0x05);
         spin_unlock_irqrestore(&chip->mixer_lock, flags);
 #ifdef REG_DEBUG
-	snd_printk(KERN_DEBUG "Mixer reg %02x was %02x, set to %02x, now is %02x\n",
-		   reg, old, expected, new);
+	dev_dbg(chip->card->dev, "Mixer reg %02x was %02x, set to %02x, now is %02x\n",
+		reg, old, expected, new);
 #endif
 	return expected == new;
 }
@@ -1356,7 +1355,7 @@ static void snd_es18xx_config_write(struct snd_es18xx *chip,
 	outb(reg, chip->ctrl_port);
 	outb(data, chip->ctrl_port + 1);
 #ifdef REG_DEBUG
-	snd_printk(KERN_DEBUG "Config reg %02x set to %02x\n", reg, data);
+	dev_dbg(chip->card->dev, "Config reg %02x set to %02x\n", reg, data);
 #endif
 }
 
@@ -1425,7 +1424,7 @@ static int snd_es18xx_initialize(struct snd_es18xx *chip,
 			irqmask = 3;
 			break;
 		default:
-			snd_printk(KERN_ERR "invalid irq %d\n", chip->irq);
+			dev_err(chip->card->dev, "invalid irq %d\n", chip->irq);
 			return -ENODEV;
 		}
 		switch (chip->dma1) {
@@ -1439,7 +1438,7 @@ static int snd_es18xx_initialize(struct snd_es18xx *chip,
 			dma1mask = 3;
 			break;
 		default:
-			snd_printk(KERN_ERR "invalid dma1 %d\n", chip->dma1);
+			dev_err(chip->card->dev, "invalid dma1 %d\n", chip->dma1);
 			return -ENODEV;
 		}
 		switch (chip->dma2) {
@@ -1456,7 +1455,7 @@ static int snd_es18xx_initialize(struct snd_es18xx *chip,
 			dma2mask = 3;
 			break;
 		default:
-			snd_printk(KERN_ERR "invalid dma2 %d\n", chip->dma2);
+			dev_err(chip->card->dev, "invalid dma2 %d\n", chip->dma2);
 			return -ENODEV;
 		}
 
@@ -1531,7 +1530,7 @@ static int snd_es18xx_identify(struct snd_card *card, struct snd_es18xx *chip)
 
 	/* reset */
 	if (snd_es18xx_reset(chip) < 0) {
-		snd_printk(KERN_ERR "reset at 0x%lx failed!!!\n", chip->port);
+		dev_err(card->dev, "reset at 0x%lx failed!!!\n", chip->port);
 		return -ENODEV;
 	}
 
@@ -1569,7 +1568,7 @@ static int snd_es18xx_identify(struct snd_card *card, struct snd_es18xx *chip)
 
 		if (!devm_request_region(card->dev, chip->ctrl_port, 8,
 					 "ES18xx - CTRL")) {
-			snd_printk(KERN_ERR PFX "unable go grab port 0x%lx\n", chip->ctrl_port);
+			dev_err(card->dev, "unable go grab port 0x%lx\n", chip->ctrl_port);
 			return -EBUSY;
 		}
 
@@ -1601,7 +1600,7 @@ static int snd_es18xx_probe(struct snd_card *card,
 			    unsigned long fm_port)
 {
 	if (snd_es18xx_identify(card, chip) < 0) {
-		snd_printk(KERN_ERR PFX "[0x%lx] ESS chip not found\n", chip->port);
+		dev_err(card->dev, "[0x%lx] ESS chip not found\n", chip->port);
                 return -ENODEV;
 	}
 
@@ -1623,12 +1622,12 @@ static int snd_es18xx_probe(struct snd_card *card,
 		chip->caps = ES18XX_PCM2 | ES18XX_RECMIX | ES18XX_AUXB | ES18XX_DUPLEX_SAME | ES18XX_GPO_2BIT;
 		break;
 	default:
-		snd_printk(KERN_ERR "[0x%lx] unsupported chip ES%x\n",
-                           chip->port, chip->version);
+		dev_err(card->dev, "[0x%lx] unsupported chip ES%x\n",
+			chip->port, chip->version);
                 return -ENODEV;
         }
 
-        snd_printd("[0x%lx] ESS%x chip found\n", chip->port, chip->version);
+	dev_dbg(card->dev, "[0x%lx] ESS%x chip found\n", chip->port, chip->version);
 
 	if (chip->dma1 == chip->dma2)
 		chip->caps &= ~(ES18XX_PCM2 | ES18XX_DUPLEX_SAME);
@@ -1725,6 +1724,7 @@ static int snd_es18xx_new_device(struct snd_card *card,
 {
 	struct snd_es18xx *chip = card->private_data;
 
+	chip->card = card;
 	spin_lock_init(&chip->reg_lock);
  	spin_lock_init(&chip->mixer_lock);
         chip->port = port;
@@ -1735,27 +1735,27 @@ static int snd_es18xx_new_device(struct snd_card *card,
 	chip->active = 0;
 
 	if (!devm_request_region(card->dev, port, 16, "ES18xx")) {
-		snd_printk(KERN_ERR PFX "unable to grap ports 0x%lx-0x%lx\n", port, port + 16 - 1);
+		dev_err(card->dev, "unable to grap ports 0x%lx-0x%lx\n", port, port + 16 - 1);
 		return -EBUSY;
 	}
 
 	if (devm_request_irq(card->dev, irq, snd_es18xx_interrupt, 0, "ES18xx",
 			     (void *) card)) {
-		snd_printk(KERN_ERR PFX "unable to grap IRQ %d\n", irq);
+		dev_err(card->dev, "unable to grap IRQ %d\n", irq);
 		return -EBUSY;
 	}
 	chip->irq = irq;
 	card->sync_irq = chip->irq;
 
 	if (snd_devm_request_dma(card->dev, dma1, "ES18xx DMA 1")) {
-		snd_printk(KERN_ERR PFX "unable to grap DMA1 %d\n", dma1);
+		dev_err(card->dev, "unable to grap DMA1 %d\n", dma1);
 		return -EBUSY;
 	}
 	chip->dma1 = dma1;
 
 	if (dma2 != dma1 &&
 	    snd_devm_request_dma(card->dev, dma2, "ES18xx DMA 2")) {
-		snd_printk(KERN_ERR PFX "unable to grap DMA2 %d\n", dma2);
+		dev_err(card->dev, "unable to grap DMA2 %d\n", dma2);
 		return -EBUSY;
 	}
 	chip->dma2 = dma2;
@@ -1954,7 +1954,7 @@ MODULE_DEVICE_TABLE(pnp, snd_audiodrive_pnpbiosids);
 static int snd_audiodrive_pnp_init_main(int dev, struct pnp_dev *pdev)
 {
 	if (pnp_activate_dev(pdev) < 0) {
-		snd_printk(KERN_ERR PFX "PnP configure failure (out of resources?)\n");
+		dev_err(&pdev->dev, "PnP configure failure (out of resources?)\n");
 		return -EBUSY;
 	}
 	/* ok. hack using Vendor-Defined Card-Level registers */
@@ -1973,8 +1973,12 @@ static int snd_audiodrive_pnp_init_main(int dev, struct pnp_dev *pdev)
 	dma1[dev] = pnp_dma(pdev, 0);
 	dma2[dev] = pnp_dma(pdev, 1);
 	irq[dev] = pnp_irq(pdev, 0);
-	snd_printdd("PnP ES18xx: port=0x%lx, fm port=0x%lx, mpu port=0x%lx\n", port[dev], fm_port[dev], mpu_port[dev]);
-	snd_printdd("PnP ES18xx: dma1=%i, dma2=%i, irq=%i\n", dma1[dev], dma2[dev], irq[dev]);
+	dev_dbg(&pdev->dev,
+		"PnP ES18xx: port=0x%lx, fm port=0x%lx, mpu port=0x%lx\n",
+		port[dev], fm_port[dev], mpu_port[dev]);
+	dev_dbg(&pdev->dev,
+		"PnP ES18xx: dma1=%i, dma2=%i, irq=%i\n",
+		dma1[dev], dma2[dev], irq[dev]);
 	return 0;
 }
 
@@ -2022,11 +2026,12 @@ static int snd_audiodrive_pnpc(int dev, struct snd_es18xx *chip,
 
 	/* Control port initialization */
 	if (pnp_activate_dev(chip->devc) < 0) {
-		snd_printk(KERN_ERR PFX "PnP control configure failure (out of resources?)\n");
+		dev_err(chip->card->dev,
+			"PnP control configure failure (out of resources?)\n");
 		return -EAGAIN;
 	}
-	snd_printdd("pnp: port=0x%llx\n",
-			(unsigned long long)pnp_port_start(chip->devc, 0));
+	dev_dbg(chip->card->dev, "pnp: port=0x%llx\n",
+		(unsigned long long)pnp_port_start(chip->devc, 0));
 	if (snd_audiodrive_pnp_init_main(dev, chip->dev) < 0)
 		return -EBUSY;
 
@@ -2084,9 +2089,9 @@ static int snd_audiodrive_probe(struct snd_card *card, int dev)
 	if (fm_port[dev] > 0 && fm_port[dev] != SNDRV_AUTO_PORT) {
 		if (snd_opl3_create(card, fm_port[dev], fm_port[dev] + 2,
 				    OPL3_HW_OPL3, 0, &opl3) < 0) {
-			snd_printk(KERN_WARNING PFX
-				   "opl3 not detected at 0x%lx\n",
-				   fm_port[dev]);
+			dev_warn(card->dev,
+				 "opl3 not detected at 0x%lx\n",
+				 fm_port[dev]);
 		} else {
 			err = snd_opl3_hwdep_new(opl3, 0, 1, NULL);
 			if (err < 0)
@@ -2134,21 +2139,21 @@ static int snd_es18xx_isa_probe(struct device *pdev, unsigned int dev)
 	if (irq[dev] == SNDRV_AUTO_IRQ) {
 		irq[dev] = snd_legacy_find_free_irq(possible_irqs);
 		if (irq[dev] < 0) {
-			snd_printk(KERN_ERR PFX "unable to find a free IRQ\n");
+			dev_err(pdev, "unable to find a free IRQ\n");
 			return -EBUSY;
 		}
 	}
 	if (dma1[dev] == SNDRV_AUTO_DMA) {
 		dma1[dev] = snd_legacy_find_free_dma(possible_dmas);
 		if (dma1[dev] < 0) {
-			snd_printk(KERN_ERR PFX "unable to find a free DMA1\n");
+			dev_err(pdev, "unable to find a free DMA1\n");
 			return -EBUSY;
 		}
 	}
 	if (dma2[dev] == SNDRV_AUTO_DMA) {
 		dma2[dev] = snd_legacy_find_free_dma(possible_dmas);
 		if (dma2[dev] < 0) {
-			snd_printk(KERN_ERR PFX "unable to find a free DMA2\n");
+			dev_err(pdev, "unable to find a free DMA2\n");
 			return -EBUSY;
 		}
 	}
-- 
2.43.0

