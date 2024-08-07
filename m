Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552D920124D
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 13:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723037670; cv=none; b=uoQ8qjJQ9nPB0GklsrkQ9VtFwUlv+oGJVbpe+MPEqULV4aAnNRKgblaoEPUjHsPeKGgdU0KI/VqRGBiX5C4RFw7sjElaLdOyouqDysIEU7WUiGvoEsdsIp5Lqqli9ZFXeIaKPyokXMQn1ffWqrUfDPuGk9Qzuu+Vazu4KHXO1RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723037670; c=relaxed/simple;
	bh=n+QnXltA/TNWopyiysVd3Ue7EI86iYqgjG+sRHX2XSA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KSoLoYhQy1EZmJ6lS4gWfdTvce49FRGZBMffQob4ezvTwOWcdRS95oIC6kw9ST6HD0C2MwgoVXECXn+QYMKmSjID9OmE9r/Zx/a+ER+y9WOJ1TFx+Pw6dIijWFupIW8/hUdGEgtShFBVJMtxKnIQESoYiYFjCtVc2wfoXxmaF8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jh/3bHO3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gRYYyQjZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jh/3bHO3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gRYYyQjZ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jh/3bHO3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gRYYyQjZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jh/3bHO3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gRYYyQjZ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 213F91FDD5;
	Wed,  7 Aug 2024 13:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037663; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yTFrqZGXHsF4E25BQiSZ0eAz0VwgVmbD5WfZlb8Gz9o=;
	b=jh/3bHO3YFLzEKOuwKK8QZECXNjYYK5eJ8XaGf4xsjuapxOBKLhABtJvoN+jiEqsua6sgN
	v7uui0w4p0lzH4BsHFzWnKpbRQfcnBRDKbOG5ivS6iRy3qtp8MX8MbKoAgAQja8rWJleTI
	r1Wr2/tsrOtuAZsv9tYUX1Zz62aV2uU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037663;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yTFrqZGXHsF4E25BQiSZ0eAz0VwgVmbD5WfZlb8Gz9o=;
	b=gRYYyQjZB40/a9SHZft9AYWDAres3GnZYNBm9Gi8SeiOQNMkFOE3pttYaW6KsZpOVK2CWY
	uEQWF1xWe/LgXvBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="jh/3bHO3";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=gRYYyQjZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037663; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yTFrqZGXHsF4E25BQiSZ0eAz0VwgVmbD5WfZlb8Gz9o=;
	b=jh/3bHO3YFLzEKOuwKK8QZECXNjYYK5eJ8XaGf4xsjuapxOBKLhABtJvoN+jiEqsua6sgN
	v7uui0w4p0lzH4BsHFzWnKpbRQfcnBRDKbOG5ivS6iRy3qtp8MX8MbKoAgAQja8rWJleTI
	r1Wr2/tsrOtuAZsv9tYUX1Zz62aV2uU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037663;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yTFrqZGXHsF4E25BQiSZ0eAz0VwgVmbD5WfZlb8Gz9o=;
	b=gRYYyQjZB40/a9SHZft9AYWDAres3GnZYNBm9Gi8SeiOQNMkFOE3pttYaW6KsZpOVK2CWY
	uEQWF1xWe/LgXvBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F242C13B03;
	Wed,  7 Aug 2024 13:34:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0AIHOt53s2ZpVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 13:34:22 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 48/54] ALSA: pdaudiocf: Use standard print API
Date: Wed,  7 Aug 2024 15:34:38 +0200
Message-ID: <20240807133452.9424-49-tiwai@suse.de>
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
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-0.01 / 50.00];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:dkim];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spamd-Bar: /
X-Rspamd-Queue-Id: 213F91FDD5
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -0.01

Use the standard print API with dev_*() instead of the old house-baked
one.  It gives better information and allows dynamically control of
debug prints.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pcmcia/pdaudiocf/pdaudiocf.c      | 21 ++++-----------
 sound/pcmcia/pdaudiocf/pdaudiocf_core.c | 36 ++++++++++++-------------
 sound/pcmcia/pdaudiocf/pdaudiocf_irq.c  |  3 +--
 3 files changed, 24 insertions(+), 36 deletions(-)

diff --git a/sound/pcmcia/pdaudiocf/pdaudiocf.c b/sound/pcmcia/pdaudiocf/pdaudiocf.c
index 8363ec08df5d..494460746614 100644
--- a/sound/pcmcia/pdaudiocf/pdaudiocf.c
+++ b/sound/pcmcia/pdaudiocf/pdaudiocf.c
@@ -85,14 +85,13 @@ static int snd_pdacf_probe(struct pcmcia_device *link)
 		.dev_free =	snd_pdacf_dev_free,
 	};
 
-	snd_printdd(KERN_DEBUG "pdacf_attach called\n");
 	/* find an empty slot from the card list */
 	for (i = 0; i < SNDRV_CARDS; i++) {
 		if (! card_list[i])
 			break;
 	}
 	if (i >= SNDRV_CARDS) {
-		snd_printk(KERN_ERR "pdacf: too many cards found\n");
+		dev_err(&link->dev, "pdacf: too many cards found\n");
 		return -EINVAL;
 	}
 	if (! enable[i])
@@ -102,7 +101,7 @@ static int snd_pdacf_probe(struct pcmcia_device *link)
 	err = snd_card_new(&link->dev, index[i], id[i], THIS_MODULE,
 			   0, &card);
 	if (err < 0) {
-		snd_printk(KERN_ERR "pdacf: cannot create a card instance\n");
+		dev_err(&link->dev, "pdacf: cannot create a card instance\n");
 		return err;
 	}
 
@@ -152,7 +151,7 @@ static int snd_pdacf_assign_resources(struct snd_pdacf *pdacf, int port, int irq
 	int err;
 	struct snd_card *card = pdacf->card;
 
-	snd_printdd(KERN_DEBUG "pdacf assign resources: port = 0x%x, irq = %d\n", port, irq);
+	dev_dbg(card->dev, "pdacf assign resources: port = 0x%x, irq = %d\n", port, irq);
 	pdacf->port = port;
 	pdacf->irq = irq;
 	pdacf->chip_status |= PDAUDIOCF_STAT_IS_CONFIGURED;
@@ -185,8 +184,6 @@ static void snd_pdacf_detach(struct pcmcia_device *link)
 {
 	struct snd_pdacf *chip = link->priv;
 
-	snd_printdd(KERN_DEBUG "pdacf_detach called\n");
-
 	if (chip->chip_status & PDAUDIOCF_STAT_IS_CONFIGURED)
 		snd_pdacf_powerdown(chip);
 	chip->chip_status |= PDAUDIOCF_STAT_IS_STALE; /* to be sure */
@@ -203,7 +200,6 @@ static int pdacf_config(struct pcmcia_device *link)
 	struct snd_pdacf *pdacf = link->priv;
 	int ret;
 
-	snd_printdd(KERN_DEBUG "pdacf_config called\n");
 	link->config_index = 0x5;
 	link->config_flags |= CONF_ENABLE_IRQ | CONF_ENABLE_PULSE_IRQ;
 
@@ -241,11 +237,8 @@ static int pdacf_suspend(struct pcmcia_device *link)
 {
 	struct snd_pdacf *chip = link->priv;
 
-	snd_printdd(KERN_DEBUG "SUSPEND\n");
-	if (chip) {
-		snd_printdd(KERN_DEBUG "snd_pdacf_suspend calling\n");
+	if (chip)
 		snd_pdacf_suspend(chip);
-	}
 
 	return 0;
 }
@@ -254,14 +247,10 @@ static int pdacf_resume(struct pcmcia_device *link)
 {
 	struct snd_pdacf *chip = link->priv;
 
-	snd_printdd(KERN_DEBUG "RESUME\n");
 	if (pcmcia_dev_present(link)) {
-		if (chip) {
-			snd_printdd(KERN_DEBUG "calling snd_pdacf_resume\n");
+		if (chip)
 			snd_pdacf_resume(chip);
-		}
 	}
-	snd_printdd(KERN_DEBUG "resume done!\n");
 
 	return 0;
 }
diff --git a/sound/pcmcia/pdaudiocf/pdaudiocf_core.c b/sound/pcmcia/pdaudiocf/pdaudiocf_core.c
index 5537c0882aa5..11aacc7e3f0b 100644
--- a/sound/pcmcia/pdaudiocf/pdaudiocf_core.c
+++ b/sound/pcmcia/pdaudiocf/pdaudiocf_core.c
@@ -28,7 +28,7 @@ static unsigned char pdacf_ak4117_read(void *private_data, unsigned char reg)
 		udelay(5);
 		if (--timeout == 0) {
 			spin_unlock_irqrestore(&chip->ak4117_lock, flags);
-			snd_printk(KERN_ERR "AK4117 ready timeout (read)\n");
+			dev_err(chip->card->dev, "AK4117 ready timeout (read)\n");
 			return 0;
 		}
 	}
@@ -38,7 +38,7 @@ static unsigned char pdacf_ak4117_read(void *private_data, unsigned char reg)
 		udelay(5);
 		if (--timeout == 0) {
 			spin_unlock_irqrestore(&chip->ak4117_lock, flags);
-			snd_printk(KERN_ERR "AK4117 read timeout (read2)\n");
+			dev_err(chip->card->dev, "AK4117 read timeout (read2)\n");
 			return 0;
 		}
 	}
@@ -59,7 +59,7 @@ static void pdacf_ak4117_write(void *private_data, unsigned char reg, unsigned c
 		udelay(5);
 		if (--timeout == 0) {
 			spin_unlock_irqrestore(&chip->ak4117_lock, flags);
-			snd_printk(KERN_ERR "AK4117 ready timeout (write)\n");
+			dev_err(chip->card->dev, "AK4117 ready timeout (write)\n");
 			return;
 		}
 	}
@@ -70,21 +70,21 @@ static void pdacf_ak4117_write(void *private_data, unsigned char reg, unsigned c
 #if 0
 void pdacf_dump(struct snd_pdacf *chip)
 {
-	printk(KERN_DEBUG "PDAUDIOCF DUMP (0x%lx):\n", chip->port);
-	printk(KERN_DEBUG "WPD         : 0x%x\n",
-	       inw(chip->port + PDAUDIOCF_REG_WDP));
-	printk(KERN_DEBUG "RDP         : 0x%x\n",
-	       inw(chip->port + PDAUDIOCF_REG_RDP));
-	printk(KERN_DEBUG "TCR         : 0x%x\n",
-	       inw(chip->port + PDAUDIOCF_REG_TCR));
-	printk(KERN_DEBUG "SCR         : 0x%x\n",
-	       inw(chip->port + PDAUDIOCF_REG_SCR));
-	printk(KERN_DEBUG "ISR         : 0x%x\n",
-	       inw(chip->port + PDAUDIOCF_REG_ISR));
-	printk(KERN_DEBUG "IER         : 0x%x\n",
-	       inw(chip->port + PDAUDIOCF_REG_IER));
-	printk(KERN_DEBUG "AK_IFR      : 0x%x\n",
-	       inw(chip->port + PDAUDIOCF_REG_AK_IFR));
+	dev_dbg(chip->card->dev, "PDAUDIOCF DUMP (0x%lx):\n", chip->port);
+	dev_dbg(chip->card->dev, "WPD         : 0x%x\n",
+		inw(chip->port + PDAUDIOCF_REG_WDP));
+	dev_dbg(chip->card->dev, "RDP         : 0x%x\n",
+		inw(chip->port + PDAUDIOCF_REG_RDP));
+	dev_dbg(chip->card->dev, "TCR         : 0x%x\n",
+		inw(chip->port + PDAUDIOCF_REG_TCR));
+	dev_dbg(chip->card->dev, "SCR         : 0x%x\n",
+		inw(chip->port + PDAUDIOCF_REG_SCR));
+	dev_dbg(chip->card->dev, "ISR         : 0x%x\n",
+		inw(chip->port + PDAUDIOCF_REG_ISR));
+	dev_dbg(chip->card->dev, "IER         : 0x%x\n",
+		inw(chip->port + PDAUDIOCF_REG_IER));
+	dev_dbg(chip->card->dev, "AK_IFR      : 0x%x\n",
+		inw(chip->port + PDAUDIOCF_REG_AK_IFR));
 }
 #endif
 
diff --git a/sound/pcmcia/pdaudiocf/pdaudiocf_irq.c b/sound/pcmcia/pdaudiocf/pdaudiocf_irq.c
index f134b4a4622f..af40a2c8789a 100644
--- a/sound/pcmcia/pdaudiocf/pdaudiocf_irq.c
+++ b/sound/pcmcia/pdaudiocf/pdaudiocf_irq.c
@@ -27,7 +27,7 @@ irqreturn_t pdacf_interrupt(int irq, void *dev)
 	stat = inw(chip->port + PDAUDIOCF_REG_ISR);
 	if (stat & (PDAUDIOCF_IRQLVL|PDAUDIOCF_IRQOVR)) {
 		if (stat & PDAUDIOCF_IRQOVR)	/* should never happen */
-			snd_printk(KERN_ERR "PDAUDIOCF SRAM buffer overrun detected!\n");
+			dev_err(chip->card->dev, "PDAUDIOCF SRAM buffer overrun detected!\n");
 		if (chip->pcm_substream)
 			wake_thread = true;
 		if (!(stat & PDAUDIOCF_IRQAKM))
@@ -257,7 +257,6 @@ irqreturn_t pdacf_threaded_irq(int irq, void *dev)
 
 	rdp = inw(chip->port + PDAUDIOCF_REG_RDP);
 	wdp = inw(chip->port + PDAUDIOCF_REG_WDP);
-	/* printk(KERN_DEBUG "TASKLET: rdp = %x, wdp = %x\n", rdp, wdp); */
 	size = wdp - rdp;
 	if (size < 0)
 		size += 0x10000;
-- 
2.43.0

