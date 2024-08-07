Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4714A1EA0CC
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 13:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723037666; cv=none; b=cCVxmEeZckCDzTY7ci14clmvRK6SfUWmt1mtNa81Rm7swL9KK0K7s6idmxT/UVhFEsSZ90V2ionapT2KY/gvAGLig9VUrNYe5+90FVwLtCosZDNzyT/gi989RpSYPZKuH17CMf7UXENIHqhDvUuqpyai4X9ibLQSVFxmcRfmwwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723037666; c=relaxed/simple;
	bh=uRN5kHAvvegVVJ+slJaXYd9dkhWvpad7n3O87RGqT/U=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i9rmn/nX1/hlgSvcFgQZF7hoXNtgGijnE6kzOjb+fL/ky9JLbtASVFqjD97dIburcwQc6mcUFJWLG2pgEaTGmgpnt8/d8yKLshv5Shgsc3g9Ab04PtjTfqSCQwacEC8BCRadBdMP/zbr3OMDVtvplYJbSp5H+yjBHlFPu0RWalc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jy603/2v; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DcRi5E6U; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jy603/2v; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DcRi5E6U; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jy603/2v";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DcRi5E6U";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jy603/2v";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DcRi5E6U"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A56FA1FB92;
	Wed,  7 Aug 2024 13:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037659; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k0xge1ENqtxbprk5EN/FVBbXoDD8PVVVEklgoQOJXo0=;
	b=jy603/2vrWqtK9kF5E1dmTMRAMGXkafwd+VgekZsCxIBcsdeM9t1FIVQLIiA2mte4DbCJB
	Vx66XmWTHwNBz+dNAMqWK2gmoItjlMWkn+q4dPwyll82F6Em75f75v17w37GEL1IzJYLwl
	unp2Yos3aORGAB/7MvEBOpoh13E4kaw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037659;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k0xge1ENqtxbprk5EN/FVBbXoDD8PVVVEklgoQOJXo0=;
	b=DcRi5E6Uex9Esxf/hEFgSj8jBWbY50q3YqpHYaFi9PgdNSvz97XYPvyG/xhCSOKUILCNfc
	bJw2Pod/5HxNtmDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037659; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k0xge1ENqtxbprk5EN/FVBbXoDD8PVVVEklgoQOJXo0=;
	b=jy603/2vrWqtK9kF5E1dmTMRAMGXkafwd+VgekZsCxIBcsdeM9t1FIVQLIiA2mte4DbCJB
	Vx66XmWTHwNBz+dNAMqWK2gmoItjlMWkn+q4dPwyll82F6Em75f75v17w37GEL1IzJYLwl
	unp2Yos3aORGAB/7MvEBOpoh13E4kaw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037659;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k0xge1ENqtxbprk5EN/FVBbXoDD8PVVVEklgoQOJXo0=;
	b=DcRi5E6Uex9Esxf/hEFgSj8jBWbY50q3YqpHYaFi9PgdNSvz97XYPvyG/xhCSOKUILCNfc
	bJw2Pod/5HxNtmDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8A6CA13B03;
	Wed,  7 Aug 2024 13:34:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EDm0INt3s2ZpVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 13:34:19 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 22/54] ALSA: cmi8330: Use standard print API
Date: Wed,  7 Aug 2024 15:34:12 +0200
Message-ID: <20240807133452.9424-23-tiwai@suse.de>
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
	NEURAL_HAM_SHORT(-0.19)[-0.945];
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

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/cmi8330.c | 36 +++++++++++++++++-------------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/sound/isa/cmi8330.c b/sound/isa/cmi8330.c
index f209b16c5229..25b4dc181089 100644
--- a/sound/isa/cmi8330.c
+++ b/sound/isa/cmi8330.c
@@ -342,7 +342,7 @@ static int snd_cmi8330_pnp(int dev, struct snd_cmi8330 *acard,
 
 	err = pnp_activate_dev(pdev);
 	if (err < 0) {
-		snd_printk(KERN_ERR "AD1848 PnP configure failure\n");
+		dev_err(&pdev->dev, "AD1848 PnP configure failure\n");
 		return -EBUSY;
 	}
 	wssport[dev] = pnp_port_start(pdev, 0);
@@ -356,7 +356,7 @@ static int snd_cmi8330_pnp(int dev, struct snd_cmi8330 *acard,
 
 	err = pnp_activate_dev(pdev);
 	if (err < 0) {
-		snd_printk(KERN_ERR "SB16 PnP configure failure\n");
+		dev_err(&pdev->dev, "SB16 PnP configure failure\n");
 		return -EBUSY;
 	}
 	sbport[dev] = pnp_port_start(pdev, 0);
@@ -376,7 +376,7 @@ static int snd_cmi8330_pnp(int dev, struct snd_cmi8330 *acard,
 
 	err = pnp_activate_dev(pdev);
 	if (err < 0)
-		snd_printk(KERN_ERR "MPU-401 PnP configure failure: will be disabled\n");
+		dev_err(&pdev->dev, "MPU-401 PnP configure failure: will be disabled\n");
 	else {
 		mpuport[dev] = pnp_port_start(pdev, 0);
 		mpuirq[dev] = pnp_irq(pdev, 0);
@@ -498,8 +498,6 @@ static int snd_cmi8330_resume(struct snd_card *card)
 #define is_isapnp_selected(dev)		0
 #endif
 
-#define PFX	"cmi8330: "
-
 static int snd_cmi8330_card_new(struct device *pdev, int dev,
 				struct snd_card **cardp)
 {
@@ -510,7 +508,7 @@ static int snd_cmi8330_card_new(struct device *pdev, int dev,
 	err = snd_devm_card_new(pdev, index[dev], id[dev], THIS_MODULE,
 				sizeof(struct snd_cmi8330), &card);
 	if (err < 0) {
-		snd_printk(KERN_ERR PFX "could not get a new card\n");
+		dev_err(pdev, "could not get a new card\n");
 		return err;
 	}
 	acard = card->private_data;
@@ -531,11 +529,11 @@ static int snd_cmi8330_probe(struct snd_card *card, int dev)
 			     wssdma[dev], -1,
 			     WSS_HW_DETECT, 0, &acard->wss);
 	if (err < 0) {
-		snd_printk(KERN_ERR PFX "AD1848 device busy??\n");
+		dev_err(card->dev, "AD1848 device busy??\n");
 		return err;
 	}
 	if (acard->wss->hardware != WSS_HW_CMI8330) {
-		snd_printk(KERN_ERR PFX "AD1848 not found during probe\n");
+		dev_err(card->dev, "AD1848 not found during probe\n");
 		return -ENODEV;
 	}
 
@@ -546,11 +544,11 @@ static int snd_cmi8330_probe(struct snd_card *card, int dev)
 			       sbdma16[dev],
 			       SB_HW_AUTO, &acard->sb);
 	if (err < 0) {
-		snd_printk(KERN_ERR PFX "SB16 device busy??\n");
+		dev_err(card->dev, "SB16 device busy??\n");
 		return err;
 	}
 	if (acard->sb->hardware != SB_HW_16) {
-		snd_printk(KERN_ERR PFX "SB16 not found during probe\n");
+		dev_err(card->dev, "SB16 not found during probe\n");
 		return -ENODEV;
 	}
 
@@ -561,22 +559,22 @@ static int snd_cmi8330_probe(struct snd_card *card, int dev)
 
 	err = snd_cmi8330_mixer(card, acard);
 	if (err < 0) {
-		snd_printk(KERN_ERR PFX "failed to create mixers\n");
+		dev_err(card->dev, "failed to create mixers\n");
 		return err;
 	}
 
 	err = snd_cmi8330_pcm(card, acard);
 	if (err < 0) {
-		snd_printk(KERN_ERR PFX "failed to create pcms\n");
+		dev_err(card->dev, "failed to create pcms\n");
 		return err;
 	}
 	if (fmport[dev] != SNDRV_AUTO_PORT) {
 		if (snd_opl3_create(card,
 				    fmport[dev], fmport[dev] + 2,
 				    OPL3_HW_AUTO, 0, &opl3) < 0) {
-			snd_printk(KERN_ERR PFX
-				   "no OPL device at 0x%lx-0x%lx ?\n",
-				   fmport[dev], fmport[dev] + 2);
+			dev_err(card->dev,
+				"no OPL device at 0x%lx-0x%lx ?\n",
+				fmport[dev], fmport[dev] + 2);
 		} else {
 			err = snd_opl3_hwdep_new(opl3, 0, 1, NULL);
 			if (err < 0)
@@ -588,7 +586,7 @@ static int snd_cmi8330_probe(struct snd_card *card, int dev)
 		if (snd_mpu401_uart_new(card, 0, MPU401_HW_MPU401,
 					mpuport[dev], 0, mpuirq[dev],
 					NULL) < 0)
-			printk(KERN_ERR PFX "no MPU-401 device at 0x%lx.\n",
+			dev_err(card->dev, "no MPU-401 device at 0x%lx.\n",
 				mpuport[dev]);
 	}
 
@@ -609,11 +607,11 @@ static int snd_cmi8330_isa_match(struct device *pdev,
 	if (!enable[dev] || is_isapnp_selected(dev))
 		return 0;
 	if (wssport[dev] == SNDRV_AUTO_PORT) {
-		snd_printk(KERN_ERR PFX "specify wssport\n");
+		dev_err(pdev, "specify wssport\n");
 		return 0;
 	}
 	if (sbport[dev] == SNDRV_AUTO_PORT) {
-		snd_printk(KERN_ERR PFX "specify sbport\n");
+		dev_err(pdev, "specify sbport\n");
 		return 0;
 	}
 	return 1;
@@ -683,7 +681,7 @@ static int snd_cmi8330_pnp_detect(struct pnp_card_link *pcard,
 		return res;
 	res = snd_cmi8330_pnp(dev, card->private_data, pcard, pid);
 	if (res < 0) {
-		snd_printk(KERN_ERR PFX "PnP detection failed\n");
+		dev_err(card->dev, "PnP detection failed\n");
 		return res;
 	}
 	res = snd_cmi8330_probe(card, dev);
-- 
2.43.0

