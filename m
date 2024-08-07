Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572501EA0BC
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 13:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723037664; cv=none; b=KCdWfEBIme3mrJp+hsSdG4OaezxeofqlE4CUQQedTuT2ayMIOwlrR4aDj/6itX3EeKL5JMaQATK6JppM0xfQKxgtv1WK/eT5yBedi0CVtPKGF6y40ptH0Wq0mz0bgL+sdf4GN5U4rhrE9y/KXqyoQV+wRLW6VxTQySYMAbXwkhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723037664; c=relaxed/simple;
	bh=4hvumKjt6ibklg1qn7dMSD4sw1uvQwFrtW6ypPClN3w=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BOdmoA70Z53Q+xt1tWqfx6J9c2OJ1CjqeJgA0UqF9pOkN8+ITB+7nfA1TUa84Sv37Rd9yfEU0Y1FpJLAqn0073nmiiRhioPq/j7tWY4TkJGOuZB4UCXL6ak4kU43p6Tj8+rjLv6q2FfGSs/j1KxzNISCyzpW2duwPfbrkPfnid0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=D/+iJwMD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=u5l2gGca; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZznxdOy6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7wW4e8Ya; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="D/+iJwMD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="u5l2gGca";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZznxdOy6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7wW4e8Ya"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E62C021D16;
	Wed,  7 Aug 2024 13:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037657; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qrPIftRg6Nya8AcUFlf8s13Up9HBfRngh1trplSUKN8=;
	b=D/+iJwMDZLkv6m+qYBjUU8H+jA26uIqj4OQ61LWvFDRhCK8UirJmmeW7j/vwY1STLPY/j9
	WgsO9l/YtadEB2QX/xL9HYxUSSgnk5D/qCJ5s5eTHl1cYHMhFTlghPznupuWahGLHZDH0K
	GMuinEKlx97FEJmOSUOP28+72GKjvwI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037657;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qrPIftRg6Nya8AcUFlf8s13Up9HBfRngh1trplSUKN8=;
	b=u5l2gGca1nHeXryhMrymXPYu0sLvIVB6Hj3rbe/UW9AEPkjP9DH/HvDMZiFmU2FJjd9Yfw
	VVIuLRgugC05mHCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ZznxdOy6;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=7wW4e8Ya
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037656; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qrPIftRg6Nya8AcUFlf8s13Up9HBfRngh1trplSUKN8=;
	b=ZznxdOy6jqM56wFsYqHVQq06+dt0NFrz91YNpfrpJIZdeDhoi+nsZLhX49xIsmTfMrXXC1
	SS/gIlMwcG0sUFdb6VI47O/qRwIWF7uuY5uvFpDHG9js3T4VZP+a8X6dC/VIFdDmZGfWJi
	fH5cEWCsfGvo3y2wIT5bL9+/woCEH+c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037656;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qrPIftRg6Nya8AcUFlf8s13Up9HBfRngh1trplSUKN8=;
	b=7wW4e8YasPX7p7WfJpcX74P3OsQefT5CYVZdY0ZK4q6cTPQQKVDaXmcfHAlUMi1czVCeB1
	YUO/GhjZzW2dlNBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CD34D13B03;
	Wed,  7 Aug 2024 13:34:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mJ7tMNh3s2ZpVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 13:34:16 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 01/54] ALSA: portman2x4: Use standard print API
Date: Wed,  7 Aug 2024 15:33:51 +0200
Message-ID: <20240807133452.9424-2-tiwai@suse.de>
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
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:dkim];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spamd-Bar: /
X-Rspamd-Queue-Id: E62C021D16
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -0.01

Use the standard print API with dev_*() instead of the old house-baked
one.  It gives better information and allows dynamically control of
debug prints.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/portman2x4.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/sound/drivers/portman2x4.c b/sound/drivers/portman2x4.c
index 6fd9e8870021..54d818d2f53d 100644
--- a/sound/drivers/portman2x4.c
+++ b/sound/drivers/portman2x4.c
@@ -385,9 +385,8 @@ static void portman_flush_input(struct portman *pm, unsigned char port)
 		command = RXDATA1;
 		break;
 	default:
-		snd_printk(KERN_WARNING
-			   "portman_flush_input() Won't flush port %i\n",
-			   port);
+		dev_warn(pm->card->dev, "%s Won't flush port %i\n",
+			 __func__, port);
 		return;
 	}
 
@@ -712,7 +711,7 @@ static int snd_portman_probe(struct platform_device *pdev)
 	err = snd_card_new(&pdev->dev, index[dev], id[dev], THIS_MODULE,
 			   0, &card);
 	if (err < 0) {
-		snd_printd("Cannot create card\n");
+		dev_dbg(&pdev->dev, "Cannot create card\n");
 		return err;
 	}
 	strcpy(card->driver, DRIVER_NAME);
@@ -726,21 +725,21 @@ static int snd_portman_probe(struct platform_device *pdev)
 					    &portman_cb,   /* callbacks */
 					    pdev->id);	   /* device number */
 	if (pardev == NULL) {
-		snd_printd("Cannot register pardevice\n");
+		dev_dbg(card->dev, "Cannot register pardevice\n");
 		err = -EIO;
 		goto __err;
 	}
 
 	/* claim parport */
 	if (parport_claim(pardev)) {
-		snd_printd("Cannot claim parport 0x%lx\n", pardev->port->base);
+		dev_dbg(card->dev, "Cannot claim parport 0x%lx\n", pardev->port->base);
 		err = -EIO;
 		goto free_pardev;
 	}
 
 	err = portman_create(card, pardev, &pm);
 	if (err < 0) {
-		snd_printd("Cannot create main component\n");
+		dev_dbg(card->dev, "Cannot create main component\n");
 		goto release_pardev;
 	}
 	card->private_data = pm;
@@ -754,7 +753,7 @@ static int snd_portman_probe(struct platform_device *pdev)
 	
 	err = snd_portman_rawmidi_create(card);
 	if (err < 0) {
-		snd_printd("Creating Rawmidi component failed\n");
+		dev_dbg(card->dev, "Creating Rawmidi component failed\n");
 		goto __err;
 	}
 
@@ -768,11 +767,11 @@ static int snd_portman_probe(struct platform_device *pdev)
 	/* At this point card will be usable */
 	err = snd_card_register(card);
 	if (err < 0) {
-		snd_printd("Cannot register card\n");
+		dev_dbg(card->dev, "Cannot register card\n");
 		goto __err;
 	}
 
-	snd_printk(KERN_INFO "Portman 2x4 on 0x%lx\n", p->base);
+	dev_info(card->dev, "Portman 2x4 on 0x%lx\n", p->base);
 	return 0;
 
 release_pardev:
-- 
2.43.0

