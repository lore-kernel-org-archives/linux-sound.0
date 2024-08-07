Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1FF1EB49E
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 13:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723037666; cv=none; b=AD7V/jGCjC3W9LxlRPVwnGrQ6clDmsPCQ9/rINu5iB79yMscjEd8p/nwsbpom++q9teeu6vNpBZD2r2faXCbQ8eKbSbN3xg37mFVM0VBfy0lolPkA4cM9UVKrS4M92SDbK8PsGcIbxSiro0fPn3YYqXfhoV2BmHrYbAyY0wbjnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723037666; c=relaxed/simple;
	bh=yYYj+xdWikjaW5d6bedBctUwJM+6VuXrIVV+f/HUXBw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mzGOihuWQt//MiuBpt4RpEJySnUbR69OfL1oPAxkJ2nZ+UOVRZfnYnk4cVOdbJtOv2K6yRKsDQmKeesIsEk6fiDaoGcNCHL9WegPlagx1//8N73q7SLALOVR/Xgbk2XLUyT9lGoa9Kg/Rq7aWI6kisd+lhX8EMeoe7yMJHnT8WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JlnzZq0C; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sB+iMkug; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JlnzZq0C; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sB+iMkug; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JlnzZq0C";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sB+iMkug";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JlnzZq0C";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sB+iMkug"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C6C481FB93;
	Wed,  7 Aug 2024 13:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037659; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X8kdpjkK0M0337MQdpxGoUaSVFXUPOozcgu+pJgxpzA=;
	b=JlnzZq0CTc76XkMeFPw32wMXl5OnbOs/wWHLaa6VfHXHJKkqjsuP3qiGuiew6DD4ul0dLA
	qB4ZskecnV7qX6jQ1XCPQ3PDCColSIdMnJoxbhBDsjOhxy+GtJBfAyY6zg2bTuf9XCrpyW
	DgL2JkFJRaGynC0YdwAv+ThcnQm3JYc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037659;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X8kdpjkK0M0337MQdpxGoUaSVFXUPOozcgu+pJgxpzA=;
	b=sB+iMkugPJPaIJh/TetXD+myxQB2Yf5qdMyme2A8D8rGhFEuhGUPb+ARgr4adZdnv9CHnU
	cEbEge3HGKWtTgBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=JlnzZq0C;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=sB+iMkug
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037659; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X8kdpjkK0M0337MQdpxGoUaSVFXUPOozcgu+pJgxpzA=;
	b=JlnzZq0CTc76XkMeFPw32wMXl5OnbOs/wWHLaa6VfHXHJKkqjsuP3qiGuiew6DD4ul0dLA
	qB4ZskecnV7qX6jQ1XCPQ3PDCColSIdMnJoxbhBDsjOhxy+GtJBfAyY6zg2bTuf9XCrpyW
	DgL2JkFJRaGynC0YdwAv+ThcnQm3JYc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037659;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X8kdpjkK0M0337MQdpxGoUaSVFXUPOozcgu+pJgxpzA=;
	b=sB+iMkugPJPaIJh/TetXD+myxQB2Yf5qdMyme2A8D8rGhFEuhGUPb+ARgr4adZdnv9CHnU
	cEbEge3HGKWtTgBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AD35C13A7D;
	Wed,  7 Aug 2024 13:34:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WFyRKNt3s2ZpVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 13:34:19 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 23/54] ALSA: cs4236: Use standard print API
Date: Wed,  7 Aug 2024 15:34:13 +0200
Message-ID: <20240807133452.9424-24-tiwai@suse.de>
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
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO
X-Rspamd-Queue-Id: C6C481FB93
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_NONE(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:email]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

Use the standard print API with dev_*() instead of the old house-baked
one.  It gives better information and allows dynamically control of
debug prints.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/cs423x/cs4236.c     | 31 ++++++++++---------
 sound/isa/cs423x/cs4236_lib.c | 56 +++++++++++++++++------------------
 2 files changed, 45 insertions(+), 42 deletions(-)

diff --git a/sound/isa/cs423x/cs4236.c b/sound/isa/cs423x/cs4236.c
index 7226cbf2d7de..ad20bb2649bd 100644
--- a/sound/isa/cs423x/cs4236.c
+++ b/sound/isa/cs423x/cs4236.c
@@ -204,7 +204,7 @@ MODULE_DEVICE_TABLE(pnp_card, snd_cs423x_pnpids);
 static int snd_cs423x_pnp_init_wss(int dev, struct pnp_dev *pdev)
 {
 	if (pnp_activate_dev(pdev) < 0) {
-		printk(KERN_ERR IDENT " WSS PnP configure failed for WSS (out of resources?)\n");
+		dev_err(&pdev->dev, IDENT " WSS PnP configure failed for WSS (out of resources?)\n");
 		return -EBUSY;
 	}
 	port[dev] = pnp_port_start(pdev, 0);
@@ -214,10 +214,12 @@ static int snd_cs423x_pnp_init_wss(int dev, struct pnp_dev *pdev)
 	irq[dev] = pnp_irq(pdev, 0);
 	dma1[dev] = pnp_dma(pdev, 0);
 	dma2[dev] = pnp_dma(pdev, 1) == 4 ? -1 : (int)pnp_dma(pdev, 1);
-	snd_printdd("isapnp WSS: wss port=0x%lx, fm port=0x%lx, sb port=0x%lx\n",
-			port[dev], fm_port[dev], sb_port[dev]);
-	snd_printdd("isapnp WSS: irq=%i, dma1=%i, dma2=%i\n",
-			irq[dev], dma1[dev], dma2[dev]);
+	dev_dbg(&pdev->dev,
+		"isapnp WSS: wss port=0x%lx, fm port=0x%lx, sb port=0x%lx\n",
+		port[dev], fm_port[dev], sb_port[dev]);
+	dev_dbg(&pdev->dev,
+		"isapnp WSS: irq=%i, dma1=%i, dma2=%i\n",
+		irq[dev], dma1[dev], dma2[dev]);
 	return 0;
 }
 
@@ -225,11 +227,11 @@ static int snd_cs423x_pnp_init_wss(int dev, struct pnp_dev *pdev)
 static int snd_cs423x_pnp_init_ctrl(int dev, struct pnp_dev *pdev)
 {
 	if (pnp_activate_dev(pdev) < 0) {
-		printk(KERN_ERR IDENT " CTRL PnP configure failed for WSS (out of resources?)\n");
+		dev_err(&pdev->dev, IDENT " CTRL PnP configure failed for WSS (out of resources?)\n");
 		return -EBUSY;
 	}
 	cport[dev] = pnp_port_start(pdev, 0);
-	snd_printdd("isapnp CTRL: control port=0x%lx\n", cport[dev]);
+	dev_dbg(&pdev->dev, "isapnp CTRL: control port=0x%lx\n", cport[dev]);
 	return 0;
 }
 
@@ -237,7 +239,7 @@ static int snd_cs423x_pnp_init_ctrl(int dev, struct pnp_dev *pdev)
 static int snd_cs423x_pnp_init_mpu(int dev, struct pnp_dev *pdev)
 {
 	if (pnp_activate_dev(pdev) < 0) {
-		printk(KERN_ERR IDENT " MPU401 PnP configure failed for WSS (out of resources?)\n");
+		dev_err(&pdev->dev, IDENT " MPU401 PnP configure failed for WSS (out of resources?)\n");
 		mpu_port[dev] = SNDRV_AUTO_PORT;
 		mpu_irq[dev] = SNDRV_AUTO_IRQ;
 	} else {
@@ -250,7 +252,7 @@ static int snd_cs423x_pnp_init_mpu(int dev, struct pnp_dev *pdev)
 			mpu_irq[dev] = -1;	/* disable interrupt */
 		}
 	}
-	snd_printdd("isapnp MPU: port=0x%lx, irq=%i\n", mpu_port[dev], mpu_irq[dev]);
+	dev_dbg(&pdev->dev, "isapnp MPU: port=0x%lx, irq=%i\n", mpu_port[dev], mpu_irq[dev]);
 	return 0;
 }
 
@@ -333,7 +335,8 @@ static int snd_cs423x_probe(struct snd_card *card, int dev)
 	if (sb_port[dev] > 0 && sb_port[dev] != SNDRV_AUTO_PORT) {
 		if (!devm_request_region(card->dev, sb_port[dev], 16,
 					 IDENT " SB")) {
-			printk(KERN_ERR IDENT ": unable to register SB port at 0x%lx\n", sb_port[dev]);
+			dev_err(card->dev, IDENT ": unable to register SB port at 0x%lx\n",
+				sb_port[dev]);
 			return -EBUSY;
 		}
 	}
@@ -384,7 +387,7 @@ static int snd_cs423x_probe(struct snd_card *card, int dev)
 		if (snd_opl3_create(card,
 				    fm_port[dev], fm_port[dev] + 2,
 				    OPL3_HW_OPL3_CS, 0, &opl3) < 0) {
-			printk(KERN_WARNING IDENT ": OPL3 not detected\n");
+			dev_warn(card->dev, IDENT ": OPL3 not detected\n");
 		} else {
 			err = snd_opl3_hwdep_new(opl3, 0, 1, NULL);
 			if (err < 0)
@@ -398,7 +401,7 @@ static int snd_cs423x_probe(struct snd_card *card, int dev)
 		if (snd_mpu401_uart_new(card, 0, MPU401_HW_CS4232,
 					mpu_port[dev], 0,
 					mpu_irq[dev], NULL) < 0)
-			printk(KERN_WARNING IDENT ": MPU401 not detected\n");
+			dev_warn(card->dev, IDENT ": MPU401 not detected\n");
 	}
 
 	return snd_card_register(card);
@@ -521,7 +524,7 @@ static int snd_cs423x_pnpbios_detect(struct pnp_dev *pdev,
 		return err;
 	err = snd_card_cs423x_pnp(dev, card->private_data, pdev, cdev);
 	if (err < 0) {
-		printk(KERN_ERR "PnP BIOS detection failed for " IDENT "\n");
+		dev_err(card->dev, "PnP BIOS detection failed for " IDENT "\n");
 		return err;
 	}
 	err = snd_cs423x_probe(card, dev);
@@ -573,7 +576,7 @@ static int snd_cs423x_pnpc_detect(struct pnp_card_link *pcard,
 		return res;
 	res = snd_card_cs423x_pnpc(dev, card->private_data, pcard, pid);
 	if (res < 0) {
-		printk(KERN_ERR "isapnp detection failed and probing for " IDENT
+		dev_err(card->dev, "isapnp detection failed and probing for " IDENT
 		       " is not supported\n");
 		return res;
 	}
diff --git a/sound/isa/cs423x/cs4236_lib.c b/sound/isa/cs423x/cs4236_lib.c
index 35f25911adcf..1a03cff6915b 100644
--- a/sound/isa/cs423x/cs4236_lib.c
+++ b/sound/isa/cs423x/cs4236_lib.c
@@ -279,8 +279,8 @@ int snd_cs4236_create(struct snd_card *card,
 		return err;
 
 	if ((chip->hardware & WSS_HW_CS4236B_MASK) == 0) {
-		snd_printd("chip is not CS4236+, hardware=0x%x\n",
-			   chip->hardware);
+		dev_dbg(card->dev, "chip is not CS4236+, hardware=0x%x\n",
+			chip->hardware);
 		*rchip = chip;
 		return 0;
 	}
@@ -288,25 +288,25 @@ int snd_cs4236_create(struct snd_card *card,
 	{
 		int idx;
 		for (idx = 0; idx < 8; idx++)
-			snd_printk(KERN_DEBUG "CD%i = 0x%x\n",
-				   idx, inb(chip->cport + idx));
+			dev_dbg(card->dev, "CD%i = 0x%x\n",
+				idx, inb(chip->cport + idx));
 		for (idx = 0; idx < 9; idx++)
-			snd_printk(KERN_DEBUG "C%i = 0x%x\n",
-				   idx, snd_cs4236_ctrl_in(chip, idx));
+			dev_dbg(card->dev, "C%i = 0x%x\n",
+				idx, snd_cs4236_ctrl_in(chip, idx));
 	}
 #endif
 	if (cport < 0x100 || cport == SNDRV_AUTO_PORT) {
-		snd_printk(KERN_ERR "please, specify control port "
-			   "for CS4236+ chips\n");
+		dev_err(card->dev, "please, specify control port for CS4236+ chips\n");
 		return -ENODEV;
 	}
 	ver1 = snd_cs4236_ctrl_in(chip, 1);
 	ver2 = snd_cs4236_ext_in(chip, CS4236_VERSION);
-	snd_printdd("CS4236: [0x%lx] C1 (version) = 0x%x, ext = 0x%x\n",
-			cport, ver1, ver2);
+	dev_dbg(card->dev, "CS4236: [0x%lx] C1 (version) = 0x%x, ext = 0x%x\n",
+		cport, ver1, ver2);
 	if (ver1 != ver2) {
-		snd_printk(KERN_ERR "CS4236+ chip detected, but "
-			   "control port 0x%lx is not valid\n", cport);
+		dev_err(card->dev,
+			"CS4236+ chip detected, but control port 0x%lx is not valid\n",
+			cport);
 		return -ENODEV;
 	}
 	snd_cs4236_ctrl_out(chip, 0, 0x00);
@@ -934,14 +934,14 @@ static int snd_cs4236_get_iec958_switch(struct snd_kcontrol *kcontrol, struct sn
 	spin_lock_irqsave(&chip->reg_lock, flags);
 	ucontrol->value.integer.value[0] = chip->image[CS4231_ALT_FEATURE_1] & 0x02 ? 1 : 0;
 #if 0
-	printk(KERN_DEBUG "get valid: ALT = 0x%x, C3 = 0x%x, C4 = 0x%x, "
-	       "C5 = 0x%x, C6 = 0x%x, C8 = 0x%x\n",
-			snd_wss_in(chip, CS4231_ALT_FEATURE_1),
-			snd_cs4236_ctrl_in(chip, 3),
-			snd_cs4236_ctrl_in(chip, 4),
-			snd_cs4236_ctrl_in(chip, 5),
-			snd_cs4236_ctrl_in(chip, 6),
-			snd_cs4236_ctrl_in(chip, 8));
+	dev_dbg(chip->card->dev,
+		"get valid: ALT = 0x%x, C3 = 0x%x, C4 = 0x%x, C5 = 0x%x, C6 = 0x%x, C8 = 0x%x\n",
+		snd_wss_in(chip, CS4231_ALT_FEATURE_1),
+		snd_cs4236_ctrl_in(chip, 3),
+		snd_cs4236_ctrl_in(chip, 4),
+		snd_cs4236_ctrl_in(chip, 5),
+		snd_cs4236_ctrl_in(chip, 6),
+		snd_cs4236_ctrl_in(chip, 8));
 #endif
 	spin_unlock_irqrestore(&chip->reg_lock, flags);
 	return 0;
@@ -972,14 +972,14 @@ static int snd_cs4236_put_iec958_switch(struct snd_kcontrol *kcontrol, struct sn
 	mutex_unlock(&chip->mce_mutex);
 
 #if 0
-	printk(KERN_DEBUG "set valid: ALT = 0x%x, C3 = 0x%x, C4 = 0x%x, "
-	       "C5 = 0x%x, C6 = 0x%x, C8 = 0x%x\n",
-			snd_wss_in(chip, CS4231_ALT_FEATURE_1),
-			snd_cs4236_ctrl_in(chip, 3),
-			snd_cs4236_ctrl_in(chip, 4),
-			snd_cs4236_ctrl_in(chip, 5),
-			snd_cs4236_ctrl_in(chip, 6),
-			snd_cs4236_ctrl_in(chip, 8));
+	dev_dbg(chip->card->dev,
+		"set valid: ALT = 0x%x, C3 = 0x%x, C4 = 0x%x, C5 = 0x%x, C6 = 0x%x, C8 = 0x%x\n",
+		snd_wss_in(chip, CS4231_ALT_FEATURE_1),
+		snd_cs4236_ctrl_in(chip, 3),
+		snd_cs4236_ctrl_in(chip, 4),
+		snd_cs4236_ctrl_in(chip, 5),
+		snd_cs4236_ctrl_in(chip, 6),
+		snd_cs4236_ctrl_in(chip, 8));
 #endif
 	return change;
 }
-- 
2.43.0

