Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DED1EA0C0
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 13:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723037664; cv=none; b=iddzHi+hq7vzFv/wEF0PiX8iPlR9H+24fD8kgLh1I4htPOZy4logvrk3eDeeLgKEFIv/rNVTc35yx1KiFv4alz27q//Xv2ZJkxuoI5/MAbYVvTm4U22eEa4136BkEvptBN3EewIRUoqZItrMAAOI4uPfKXpKJVP20hraTPRPt6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723037664; c=relaxed/simple;
	bh=HQhLEjoCA7RUVlFDF/vYUulMHUSDgQiS6ke6eN/d5Es=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qprJ7XsRatssGs2sdgwYvrDVKfNtvLli43ao/ty4iGfPWifiu11/8PVV4eg6roRCUxAc1Ipr+9uEmMtZiNGkC89swMOnPiA5mX4VoL6Rh9WUkxLf6xbF0Idg0NdisIp9ARhKxKgDLCcnoGGComBPk9ksxdk/S1RO1oO9Jrq8BFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rtHp+Ljp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wAlZKEku; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rtHp+Ljp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wAlZKEku; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rtHp+Ljp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wAlZKEku";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rtHp+Ljp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wAlZKEku"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1F9C71FB90;
	Wed,  7 Aug 2024 13:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037659; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DAH42y99h0pPKMDnw3lr6qJt9p31AOU0m0cam9l/Xcs=;
	b=rtHp+LjprghhyVp+RlVf+zKUSfZ7ZAWzWVCez4C9Nu/TPe82hjXSluVfKSu0x6DQOkoZxX
	axyrRHAHWI3xwwDWLdXCArMf/G+cQi2mylDe64ANa+RgGWZm97LVe+CIjihTN9k4lx4yOB
	tJwii0EuKhaO24Bc587X4jNvCekYWvg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037659;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DAH42y99h0pPKMDnw3lr6qJt9p31AOU0m0cam9l/Xcs=;
	b=wAlZKEkuMMEECyumlqfkee1WfGKeWCgoSpYXwJHLS97eqc0vAIEOstOKjsBcDBIAZE/xpl
	2GJhqJDBNV2r2yDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037659; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DAH42y99h0pPKMDnw3lr6qJt9p31AOU0m0cam9l/Xcs=;
	b=rtHp+LjprghhyVp+RlVf+zKUSfZ7ZAWzWVCez4C9Nu/TPe82hjXSluVfKSu0x6DQOkoZxX
	axyrRHAHWI3xwwDWLdXCArMf/G+cQi2mylDe64ANa+RgGWZm97LVe+CIjihTN9k4lx4yOB
	tJwii0EuKhaO24Bc587X4jNvCekYWvg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037659;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DAH42y99h0pPKMDnw3lr6qJt9p31AOU0m0cam9l/Xcs=;
	b=wAlZKEkuMMEECyumlqfkee1WfGKeWCgoSpYXwJHLS97eqc0vAIEOstOKjsBcDBIAZE/xpl
	2GJhqJDBNV2r2yDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 07B5113B03;
	Wed,  7 Aug 2024 13:34:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8PO2ANt3s2ZpVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 13:34:19 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 18/54] ALSA: ad1816a: Use standard print API
Date: Wed,  7 Aug 2024 15:34:08 +0200
Message-ID: <20240807133452.9424-19-tiwai@suse.de>
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
	NEURAL_HAM_SHORT(-0.19)[-0.941];
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

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/ad1816a/ad1816a.c     | 16 ++++++++--------
 sound/isa/ad1816a/ad1816a_lib.c | 16 ++++++++--------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/sound/isa/ad1816a/ad1816a.c b/sound/isa/ad1816a/ad1816a.c
index 9ac873773129..99006dc4777e 100644
--- a/sound/isa/ad1816a/ad1816a.c
+++ b/sound/isa/ad1816a/ad1816a.c
@@ -17,8 +17,6 @@
 #include <sound/mpu401.h>
 #include <sound/opl3.h>
 
-#define PFX "ad1816a: "
-
 MODULE_AUTHOR("Massimo Piccioni <dafastidio@libero.it>");
 MODULE_DESCRIPTION("AD1816A, AD1815");
 MODULE_LICENSE("GPL");
@@ -87,7 +85,7 @@ static int snd_card_ad1816a_pnp(int dev, struct pnp_card_link *card,
 
 	err = pnp_activate_dev(pdev);
 	if (err < 0) {
-		printk(KERN_ERR PFX "AUDIO PnP configure failure\n");
+		dev_err(&pdev->dev, "AUDIO PnP configure failure\n");
 		return -EBUSY;
 	}
 
@@ -100,13 +98,13 @@ static int snd_card_ad1816a_pnp(int dev, struct pnp_card_link *card,
 	pdev = pnp_request_card_device(card, id->devs[1].id, NULL);
 	if (pdev == NULL) {
 		mpu_port[dev] = -1;
-		snd_printk(KERN_WARNING PFX "MPU401 device busy, skipping.\n");
+		dev_warn(&pdev->dev, "MPU401 device busy, skipping.\n");
 		return 0;
 	}
 
 	err = pnp_activate_dev(pdev);
 	if (err < 0) {
-		printk(KERN_ERR PFX "MPU401 PnP configure failure\n");
+		dev_err(&pdev->dev, "MPU401 PnP configure failure\n");
 		mpu_port[dev] = -1;
 	} else {
 		mpu_port[dev] = pnp_port_start(pdev, 0);
@@ -166,14 +164,16 @@ static int snd_card_ad1816a_probe(int dev, struct pnp_card_link *pcard,
 		if (snd_mpu401_uart_new(card, 0, MPU401_HW_MPU401,
 					mpu_port[dev], 0, mpu_irq[dev],
 					NULL) < 0)
-			printk(KERN_ERR PFX "no MPU-401 device at 0x%lx.\n", mpu_port[dev]);
+			dev_err(card->dev, "no MPU-401 device at 0x%lx.\n",
+				mpu_port[dev]);
 	}
 
 	if (fm_port[dev] > 0) {
 		if (snd_opl3_create(card,
 				    fm_port[dev], fm_port[dev] + 2,
 				    OPL3_HW_AUTO, 0, &opl3) < 0) {
-			printk(KERN_ERR PFX "no OPL device at 0x%lx-0x%lx.\n", fm_port[dev], fm_port[dev] + 2);
+			dev_err(card->dev, "no OPL device at 0x%lx-0x%lx.\n",
+				fm_port[dev], fm_port[dev] + 2);
 		} else {
 			error = snd_opl3_hwdep_new(opl3, 0, 1, NULL);
 			if (error < 0)
@@ -252,7 +252,7 @@ static int __init alsa_card_ad1816a_init(void)
 	if (!ad1816a_devices) {
 		pnp_unregister_card_driver(&ad1816a_pnpc_driver);
 #ifdef MODULE
-		printk(KERN_ERR "no AD1816A based soundcards found.\n");
+		pr_err("no AD1816A based soundcards found.\n");
 #endif	/* MODULE */
 		return -ENODEV;
 	}
diff --git a/sound/isa/ad1816a/ad1816a_lib.c b/sound/isa/ad1816a/ad1816a_lib.c
index 132a095dca2c..2b87036cb94f 100644
--- a/sound/isa/ad1816a/ad1816a_lib.c
+++ b/sound/isa/ad1816a/ad1816a_lib.c
@@ -25,7 +25,7 @@ static inline int snd_ad1816a_busy_wait(struct snd_ad1816a *chip)
 		if (inb(AD1816A_REG(AD1816A_CHIP_STATUS)) & AD1816A_READY)
 			return 0;
 
-	snd_printk(KERN_WARNING "chip busy.\n");
+	dev_warn(chip->card->dev, "chip busy.\n");
 	return -EBUSY;
 }
 
@@ -186,7 +186,7 @@ static int snd_ad1816a_trigger(struct snd_ad1816a *chip, unsigned char what,
 		spin_unlock(&chip->lock);
 		break;
 	default:
-		snd_printk(KERN_WARNING "invalid trigger mode 0x%x.\n", what);
+		dev_warn(chip->card->dev, "invalid trigger mode 0x%x.\n", what);
 		error = -EINVAL;
 	}
 
@@ -548,8 +548,8 @@ static const char *snd_ad1816a_chip_id(struct snd_ad1816a *chip)
 	case AD1816A_HW_AD1815:	return "AD1815";
 	case AD1816A_HW_AD18MAX10: return "AD18max10";
 	default:
-		snd_printk(KERN_WARNING "Unknown chip version %d:%d.\n",
-			chip->version, chip->hardware);
+		dev_warn(chip->card->dev, "Unknown chip version %d:%d.\n",
+			 chip->version, chip->hardware);
 		return "AD1816A - unknown";
 	}
 }
@@ -566,23 +566,23 @@ int snd_ad1816a_create(struct snd_card *card,
 
 	chip->res_port = devm_request_region(card->dev, port, 16, "AD1816A");
 	if (!chip->res_port) {
-		snd_printk(KERN_ERR "ad1816a: can't grab port 0x%lx\n", port);
+		dev_err(card->dev, "ad1816a: can't grab port 0x%lx\n", port);
 		return -EBUSY;
 	}
 	if (devm_request_irq(card->dev, irq, snd_ad1816a_interrupt, 0,
 			     "AD1816A", (void *) chip)) {
-		snd_printk(KERN_ERR "ad1816a: can't grab IRQ %d\n", irq);
+		dev_err(card->dev, "ad1816a: can't grab IRQ %d\n", irq);
 		return -EBUSY;
 	}
 	chip->irq = irq;
 	card->sync_irq = chip->irq;
 	if (snd_devm_request_dma(card->dev, dma1, "AD1816A - 1")) {
-		snd_printk(KERN_ERR "ad1816a: can't grab DMA1 %d\n", dma1);
+		dev_err(card->dev, "ad1816a: can't grab DMA1 %d\n", dma1);
 		return -EBUSY;
 	}
 	chip->dma1 = dma1;
 	if (snd_devm_request_dma(card->dev, dma2, "AD1816A - 2")) {
-		snd_printk(KERN_ERR "ad1816a: can't grab DMA2 %d\n", dma2);
+		dev_err(card->dev, "ad1816a: can't grab DMA2 %d\n", dma2);
 		return -EBUSY;
 	}
 	chip->dma2 = dma2;
-- 
2.43.0

