Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D710416CD12
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 13:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723037660; cv=none; b=qopyqrFgoih3bVpFJaTdjoHImSTC62uAmD6c0Q9wWgwRe/GnCv7W3VV+u4d7ZeUmPwB9gnZWVUo0g3A99RV97wUALpPYWlGn+zojyrpypZ1snvbm5YPbZl2uj5hEqHToLtg5JyfWdrDVuAKWQ+t90O06JR4v63ffu3xAjfsGNTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723037660; c=relaxed/simple;
	bh=W61jHKw1kC5qg4kEvuCBi5LiXA0eou70/3cp4PMxxtU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CEsi/c2q66JyHpC83vzbOu1RWFkznjmLQ8mZyzOrYbqU0wX5fNiGaMIN4HM0LbY+tM6WfFP5wUFcIN5gaKuOEuOuJALFiJSEfaQtNCbRANGN6XUzqvj+4b92s1UOZSN7oS6USO/a0gtv2vrrPaxf7SdHxPiZkjzItCm53ThDmIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=s+WJERlT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0oSg9Qik; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=s+WJERlT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0oSg9Qik; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="s+WJERlT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0oSg9Qik";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="s+WJERlT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0oSg9Qik"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3334121D14;
	Wed,  7 Aug 2024 13:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037657; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nHXEFTWl8IRt9c5WGY64owzgnL8VfCPh6wnTLNoQIt0=;
	b=s+WJERlTkCZ5SD2hh2i43UeKoydkDba3dZj4Jf9xGzydjdsIp2BXHYNVLu9EUgiK6EsrJj
	Lrk+JL71lXuzETZJAHKdOOJrQJZHq9mwQda2QMADbQAmIr2JJGKvz369FeIsq6/UtZfDTY
	NUFqoz3yBB+aC0YgVsmUkaIKJf2IKq8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037657;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nHXEFTWl8IRt9c5WGY64owzgnL8VfCPh6wnTLNoQIt0=;
	b=0oSg9QikCIiWNyP1xslW/czm7mzITLGv/uoxdGVAt8AI36rwowr3nO8bhA8j4VZhPhqRGB
	j3hiHuJcoWxOm2BQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=s+WJERlT;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=0oSg9Qik
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037657; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nHXEFTWl8IRt9c5WGY64owzgnL8VfCPh6wnTLNoQIt0=;
	b=s+WJERlTkCZ5SD2hh2i43UeKoydkDba3dZj4Jf9xGzydjdsIp2BXHYNVLu9EUgiK6EsrJj
	Lrk+JL71lXuzETZJAHKdOOJrQJZHq9mwQda2QMADbQAmIr2JJGKvz369FeIsq6/UtZfDTY
	NUFqoz3yBB+aC0YgVsmUkaIKJf2IKq8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037657;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nHXEFTWl8IRt9c5WGY64owzgnL8VfCPh6wnTLNoQIt0=;
	b=0oSg9QikCIiWNyP1xslW/czm7mzITLGv/uoxdGVAt8AI36rwowr3nO8bhA8j4VZhPhqRGB
	j3hiHuJcoWxOm2BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 176E013B05;
	Wed,  7 Aug 2024 13:34:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KPVCBNl3s2ZpVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 13:34:17 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 03/54] ALSA: mpu401: Use standard print API
Date: Wed,  7 Aug 2024 15:33:53 +0200
Message-ID: <20240807133452.9424-4-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 3334121D14
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
 sound/drivers/mpu401/mpu401.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/drivers/mpu401/mpu401.c b/sound/drivers/mpu401/mpu401.c
index 3398aee33baa..cd01af5fa4ed 100644
--- a/sound/drivers/mpu401/mpu401.c
+++ b/sound/drivers/mpu401/mpu401.c
@@ -56,7 +56,7 @@ static int snd_mpu401_create(struct device *devptr, int dev,
 	int err;
 
 	if (!uart_enter[dev])
-		snd_printk(KERN_ERR "the uart_enter option is obsolete; remove it\n");
+		dev_err(devptr, "the uart_enter option is obsolete; remove it\n");
 
 	*rcard = NULL;
 	err = snd_devm_card_new(devptr, index[dev], id[dev], THIS_MODULE,
@@ -75,7 +75,7 @@ static int snd_mpu401_create(struct device *devptr, int dev,
 	err = snd_mpu401_uart_new(card, 0, MPU401_HW_MPU401, port[dev], 0,
 				  irq[dev], NULL);
 	if (err < 0) {
-		printk(KERN_ERR "MPU401 not detected at 0x%lx\n", port[dev]);
+		dev_err(devptr, "MPU401 not detected at 0x%lx\n", port[dev]);
 		return err;
 	}
 
@@ -90,11 +90,11 @@ static int snd_mpu401_probe(struct platform_device *devptr)
 	struct snd_card *card;
 
 	if (port[dev] == SNDRV_AUTO_PORT) {
-		snd_printk(KERN_ERR "specify port\n");
+		dev_err(&devptr->dev, "specify port\n");
 		return -EINVAL;
 	}
 	if (irq[dev] == SNDRV_AUTO_IRQ) {
-		snd_printk(KERN_ERR "specify or disable IRQ\n");
+		dev_err(&devptr->dev, "specify or disable IRQ\n");
 		return -EINVAL;
 	}
 	err = snd_mpu401_create(&devptr->dev, dev, &card);
@@ -133,11 +133,11 @@ static int snd_mpu401_pnp(int dev, struct pnp_dev *device,
 {
 	if (!pnp_port_valid(device, 0) ||
 	    pnp_port_flags(device, 0) & IORESOURCE_DISABLED) {
-		snd_printk(KERN_ERR "no PnP port\n");
+		dev_err(&device->dev, "no PnP port\n");
 		return -ENODEV;
 	}
 	if (pnp_port_len(device, 0) < IO_EXTENT) {
-		snd_printk(KERN_ERR "PnP port length is %llu, expected %d\n",
+		dev_err(&device->dev, "PnP port length is %llu, expected %d\n",
 			   (unsigned long long)pnp_port_len(device, 0),
 			   IO_EXTENT);
 		return -ENODEV;
@@ -146,7 +146,7 @@ static int snd_mpu401_pnp(int dev, struct pnp_dev *device,
 
 	if (!pnp_irq_valid(device, 0) ||
 	    pnp_irq_flags(device, 0) & IORESOURCE_DISABLED) {
-		snd_printk(KERN_WARNING "no PnP irq, using polling\n");
+		dev_warn(&device->dev, "no PnP irq, using polling\n");
 		irq[dev] = -1;
 	} else {
 		irq[dev] = pnp_irq(device, 0);
@@ -234,7 +234,7 @@ static int __init alsa_card_mpu401_init(void)
 
 	if (!snd_mpu401_devices) {
 #ifdef MODULE
-		printk(KERN_ERR "MPU-401 device not found or device busy\n");
+		pr_err("MPU-401 device not found or device busy\n");
 #endif
 		snd_mpu401_unregister_all();
 		return -ENODEV;
-- 
2.43.0

