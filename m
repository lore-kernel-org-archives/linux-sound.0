Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F3D200131
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 13:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723037670; cv=none; b=m/3j9NqvzUnMCM2dDJ0qm4ElUBctwOR0GpAuVbBLirvb42wH3Iddt62MwX9ca4R4MsYUXyaTacLT05JTqZxiwYbxEbDNBqL1olYYl7eOjhuMVJAr4BnB4CCiTeCrBRFMxQy+gryN95vR2DDYB6C/P9waH8Apa03zWUuMqgwDp10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723037670; c=relaxed/simple;
	bh=trB/SMSfe4z+WoZ+RL8lJx1KhabhVkERydY1qaL4Pf4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jfm90QweeK+Wl0xSNyrV3jcm37LRHS4tLaw+P5ruBmF1M7Rjm3vJuWEPTRovelHCTzNoJH3nDd+4RjBkSZ9x1aazd67/Utkt53HuE64pb/aL5Pwdgjg6YGP72YEcvy/6+NuWuc31ECCkJc+wgCyjIuLdn4YP3PAvU74h9znOFjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=S5YqiVst; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=h82DAQGH; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=S5YqiVst; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=h82DAQGH; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="S5YqiVst";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="h82DAQGH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="S5YqiVst";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="h82DAQGH"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7E6541FB98;
	Wed,  7 Aug 2024 13:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037660; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hLL1ufgJ8GjMX0sd/7QlQrfL6FI8v3g/wfM9swiQnNc=;
	b=S5YqiVstVgXQAue1l9sEeMogknsGFOuDlneVRHvwTS80lKa8OKA4MOz8SPwbecHOsKUIhW
	eJO+SdsIXBnUCId/27jbYGmR4AyphTyFKp17yj4FSF6Frc7Yv2l69VrpqyEQfhAyey1yb3
	7MKH2B9SJ4Kgk/W9lwKHYL2rr94OxMk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037660;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hLL1ufgJ8GjMX0sd/7QlQrfL6FI8v3g/wfM9swiQnNc=;
	b=h82DAQGHNoZGl7G5ifXBZtQBwFRU9l5vWYrF3fbhYwDFor/sDgqh7J7pFvd0X4GO3F5qoa
	c8DX5ZR/DUlwAdAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037660; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hLL1ufgJ8GjMX0sd/7QlQrfL6FI8v3g/wfM9swiQnNc=;
	b=S5YqiVstVgXQAue1l9sEeMogknsGFOuDlneVRHvwTS80lKa8OKA4MOz8SPwbecHOsKUIhW
	eJO+SdsIXBnUCId/27jbYGmR4AyphTyFKp17yj4FSF6Frc7Yv2l69VrpqyEQfhAyey1yb3
	7MKH2B9SJ4Kgk/W9lwKHYL2rr94OxMk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037660;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hLL1ufgJ8GjMX0sd/7QlQrfL6FI8v3g/wfM9swiQnNc=;
	b=h82DAQGHNoZGl7G5ifXBZtQBwFRU9l5vWYrF3fbhYwDFor/sDgqh7J7pFvd0X4GO3F5qoa
	c8DX5ZR/DUlwAdAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6750113B05;
	Wed,  7 Aug 2024 13:34:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kF0YGNx3s2ZpVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 13:34:20 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 28/54] ALSA: opl3sa2: Use standard print API
Date: Wed,  7 Aug 2024 15:34:18 +0200
Message-ID: <20240807133452.9424-29-tiwai@suse.de>
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
	NEURAL_HAM_SHORT(-0.19)[-0.946];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email];
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

The card pointer is stored in struct snd_opl3sa2 to be referred for
dev_*() calls.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/opl3sa2.c | 46 ++++++++++++++++++++++-----------------------
 1 file changed, 22 insertions(+), 24 deletions(-)

diff --git a/sound/isa/opl3sa2.c b/sound/isa/opl3sa2.c
index bad1490a66a0..a5ed5aa0606f 100644
--- a/sound/isa/opl3sa2.c
+++ b/sound/isa/opl3sa2.c
@@ -108,6 +108,7 @@ struct snd_opl3sa2 {
 	int irq;
 	int single_dma;
 	spinlock_t reg_lock;
+	struct snd_card *card;
 	struct snd_hwdep *synth;
 	struct snd_rawmidi *rmidi;
 	struct snd_wss *wss;
@@ -157,12 +158,12 @@ static unsigned char __snd_opl3sa2_read(struct snd_opl3sa2 *chip, unsigned char
 	unsigned char result;
 #if 0
 	outb(0x1d, port);	/* password */
-	printk(KERN_DEBUG "read [0x%lx] = 0x%x\n", port, inb(port));
+	dev_dbg(chip->card->dev, "read [0x%lx] = 0x%x\n", port, inb(port));
 #endif
 	outb(reg, chip->port);	/* register */
 	result = inb(chip->port + 1);
 #if 0
-	printk(KERN_DEBUG "read [0x%lx] = 0x%x [0x%x]\n",
+	dev_dbg(chip->card->dev, "read [0x%lx] = 0x%x [0x%x]\n",
 	       port, result, inb(port));
 #endif
 	return result;
@@ -211,17 +212,13 @@ static int snd_opl3sa2_detect(struct snd_card *card)
 	chip->res_port = devm_request_region(card->dev, port, 2,
 					     "OPL3-SA control");
 	if (!chip->res_port) {
-		snd_printk(KERN_ERR PFX "can't grab port 0x%lx\n", port);
+		dev_err(card->dev, "can't grab port 0x%lx\n", port);
 		return -EBUSY;
 	}
-	/*
-	snd_printk(KERN_DEBUG "REG 0A = 0x%x\n",
-		   snd_opl3sa2_read(chip, 0x0a));
-	*/
 	chip->version = 0;
 	tmp = snd_opl3sa2_read(chip, OPL3SA2_MISC);
 	if (tmp == 0xff) {
-		snd_printd("OPL3-SA [0x%lx] detect = 0x%x\n", port, tmp);
+		dev_dbg(card->dev, "OPL3-SA [0x%lx] detect = 0x%x\n", port, tmp);
 		return -ENODEV;
 	}
 	switch (tmp & 0x07) {
@@ -243,7 +240,7 @@ static int snd_opl3sa2_detect(struct snd_card *card)
 	snd_opl3sa2_write(chip, OPL3SA2_MISC, tmp ^ 7);
 	tmp1 = snd_opl3sa2_read(chip, OPL3SA2_MISC);
 	if (tmp1 != tmp) {
-		snd_printd("OPL3-SA [0x%lx] detect (1) = 0x%x (0x%x)\n", port, tmp, tmp1);
+		dev_dbg(card->dev, "OPL3-SA [0x%lx] detect (1) = 0x%x (0x%x)\n", port, tmp, tmp1);
 		return -ENODEV;
 	}
 	/* try if the MIC register is accessible */
@@ -251,7 +248,7 @@ static int snd_opl3sa2_detect(struct snd_card *card)
 	snd_opl3sa2_write(chip, OPL3SA2_MIC, 0x8a);
 	tmp1 = snd_opl3sa2_read(chip, OPL3SA2_MIC);
 	if ((tmp1 & 0x9f) != 0x8a) {
-		snd_printd("OPL3-SA [0x%lx] detect (2) = 0x%x (0x%x)\n", port, tmp, tmp1);
+		dev_dbg(card->dev, "OPL3-SA [0x%lx] detect (2) = 0x%x (0x%x)\n", port, tmp, tmp1);
 		return -ENODEV;
 	}
 	snd_opl3sa2_write(chip, OPL3SA2_MIC, 0x9f);
@@ -495,14 +492,14 @@ static int snd_opl3sa2_mixer(struct snd_card *card)
         strcpy(id2.name, "CD Playback Switch");
 	err = snd_ctl_rename_id(card, &id1, &id2);
 	if (err < 0) {
-		snd_printk(KERN_ERR "Cannot rename opl3sa2 control\n");
+		dev_err(card->dev, "Cannot rename opl3sa2 control\n");
                 return err;
 	}
         strcpy(id1.name, "Aux Playback Volume");
         strcpy(id2.name, "CD Playback Volume");
 	err = snd_ctl_rename_id(card, &id1, &id2);
 	if (err < 0) {
-		snd_printk(KERN_ERR "Cannot rename opl3sa2 control\n");
+		dev_err(card->dev, "Cannot rename opl3sa2 control\n");
                 return err;
 	}
 	/* reassign AUX1 to FM */
@@ -510,14 +507,14 @@ static int snd_opl3sa2_mixer(struct snd_card *card)
         strcpy(id2.name, "FM Playback Switch");
 	err = snd_ctl_rename_id(card, &id1, &id2);
 	if (err < 0) {
-		snd_printk(KERN_ERR "Cannot rename opl3sa2 control\n");
+		dev_err(card->dev, "Cannot rename opl3sa2 control\n");
                 return err;
 	}
         strcpy(id1.name, "Aux Playback Volume");
         strcpy(id2.name, "FM Playback Volume");
 	err = snd_ctl_rename_id(card, &id1, &id2);
 	if (err < 0) {
-		snd_printk(KERN_ERR "Cannot rename opl3sa2 control\n");
+		dev_err(card->dev, "Cannot rename opl3sa2 control\n");
                 return err;
 	}
 	/* add OPL3SA2 controls */
@@ -591,7 +588,7 @@ static int snd_opl3sa2_pnp(int dev, struct snd_opl3sa2 *chip,
 			   struct pnp_dev *pdev)
 {
 	if (pnp_activate_dev(pdev) < 0) {
-		snd_printk(KERN_ERR "PnP configure failure (out of resources?)\n");
+		dev_err(chip->card->dev, "PnP configure failure (out of resources?)\n");
 		return -EBUSY;
 	}
 	sb_port[dev] = pnp_port_start(pdev, 0);
@@ -602,9 +599,9 @@ static int snd_opl3sa2_pnp(int dev, struct snd_opl3sa2 *chip,
 	dma1[dev] = pnp_dma(pdev, 0);
 	dma2[dev] = pnp_dma(pdev, 1);
 	irq[dev] = pnp_irq(pdev, 0);
-	snd_printdd("%sPnP OPL3-SA: sb port=0x%lx, wss port=0x%lx, fm port=0x%lx, midi port=0x%lx\n",
+	dev_dbg(chip->card->dev, "%sPnP OPL3-SA: sb port=0x%lx, wss port=0x%lx, fm port=0x%lx, midi port=0x%lx\n",
 		pnp_device_is_pnpbios(pdev) ? "BIOS" : "ISA", sb_port[dev], wss_port[dev], fm_port[dev], midi_port[dev]);
-	snd_printdd("%sPnP OPL3-SA: control port=0x%lx, dma1=%i, dma2=%i, irq=%i\n",
+	dev_dbg(chip->card->dev, "%sPnP OPL3-SA: control port=0x%lx, dma1=%i, dma2=%i, irq=%i\n",
 		pnp_device_is_pnpbios(pdev) ? "BIOS" : "ISA", port[dev], dma1[dev], dma2[dev], irq[dev]);
 	return 0;
 }
@@ -640,6 +637,7 @@ static int snd_opl3sa2_probe(struct snd_card *card, int dev)
 
 	/* initialise this card from supplied (or default) parameter*/ 
 	chip = card->private_data;
+	chip->card = card;
 	chip->ymode = opl3sa3_ymode[dev] & 0x03 ;
 	chip->port = port[dev];
 	xirq = irq[dev];
@@ -653,7 +651,7 @@ static int snd_opl3sa2_probe(struct snd_card *card, int dev)
 	err = devm_request_irq(card->dev, xirq, snd_opl3sa2_interrupt, 0,
 			       "OPL3-SA2", card);
 	if (err) {
-		snd_printk(KERN_ERR PFX "can't grab IRQ %d\n", xirq);
+		dev_err(card->dev, "can't grab IRQ %d\n", xirq);
 		return -ENODEV;
 	}
 	chip->irq = xirq;
@@ -663,7 +661,7 @@ static int snd_opl3sa2_probe(struct snd_card *card, int dev)
 			     xirq, xdma1, xdma2,
 			     WSS_HW_OPL3SA2, WSS_HWSHARE_IRQ, &wss);
 	if (err < 0) {
-		snd_printd("Oops, WSS not detected at 0x%lx\n", wss_port[dev] + 4);
+		dev_dbg(card->dev, "Oops, WSS not detected at 0x%lx\n", wss_port[dev] + 4);
 		return err;
 	}
 	chip->wss = wss;
@@ -770,7 +768,7 @@ static int snd_opl3sa2_pnp_cdetect(struct pnp_card_link *pcard,
 
 	pdev = pnp_request_card_device(pcard, id->devs[0].id, NULL);
 	if (pdev == NULL) {
-		snd_printk(KERN_ERR PFX "can't get pnp device from id '%s'\n",
+		dev_err(&pcard->card->dev, "can't get pnp device from id '%s'\n",
 			   id->devs[0].id);
 		return -EBUSY;
 	}
@@ -828,19 +826,19 @@ static int snd_opl3sa2_isa_match(struct device *pdev,
 		return 0;
 #endif
 	if (port[dev] == SNDRV_AUTO_PORT) {
-		snd_printk(KERN_ERR PFX "specify port\n");
+		dev_err(pdev, "specify port\n");
 		return 0;
 	}
 	if (wss_port[dev] == SNDRV_AUTO_PORT) {
-		snd_printk(KERN_ERR PFX "specify wss_port\n");
+		dev_err(pdev, "specify wss_port\n");
 		return 0;
 	}
 	if (fm_port[dev] == SNDRV_AUTO_PORT) {
-		snd_printk(KERN_ERR PFX "specify fm_port\n");
+		dev_err(pdev, "specify fm_port\n");
 		return 0;
 	}
 	if (midi_port[dev] == SNDRV_AUTO_PORT) {
-		snd_printk(KERN_ERR PFX "specify midi_port\n");
+		dev_err(pdev, "specify midi_port\n");
 		return 0;
 	}
 	return 1;
-- 
2.43.0

