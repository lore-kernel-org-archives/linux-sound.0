Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471D01EA0D6
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 13:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723037665; cv=none; b=SqsVRrD0PGLz8gmuJkoQvqZmoxjhlYCKzS/ZTB3zwc9lS3FEe6VOXfkCIhmHJRpQoqiIQQjV6n7lNC51N5xM6ZPPt3vYMy77fWXA2QfkBrgB5r7esKxR5wF2Prw069yLABObgH1h6eYUqkBizSMeCgizea56G2xCoJ1KAAyFkUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723037665; c=relaxed/simple;
	bh=CMBjalV9hW/+bgWnmufIlRvriXRGBUNIm1zPSX7HbmY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iwQuGUDDHR+oNjM0poBWsd+apcRyY/Mr7cU73HQMse+iEe86YZgj0T/KsAnoN22KRf28XvooOc8FdE88zhN0Yn88aFFlQKS7Tz90PJt54PqsNhW0NPoNqIGYUe0z/7SQUDDF4HA4s7U+ZrRpmx2Ml3e4RTWo3FvnIVM26QV76PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=K3Fwb42J; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hd6Asxqa; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=K3Fwb42J; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hd6Asxqa; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="K3Fwb42J";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hd6Asxqa";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="K3Fwb42J";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hd6Asxqa"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5F7FE1FB91;
	Wed,  7 Aug 2024 13:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037659; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t0eq0NAc9OO3QmnmD20HOADoTUiByy1RTqvTlpeXiF0=;
	b=K3Fwb42JOoKPEMLTUVGNq8taDBz9ballQSaiOLWqyMsfRKn8dXW8+VjmiIkYMOBy0BD7H+
	JnLEjmp/YtU37KUNOqbGlyrBTTGBRoCg3L5EPeGBzsBOE8U60DoGYjwQrKhQN3QnOtWtcb
	QZdQULrh75/MF4iUTifk3v09mGqjTDQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037659;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t0eq0NAc9OO3QmnmD20HOADoTUiByy1RTqvTlpeXiF0=;
	b=hd6AsxqaHzwgkKOaEtwQyrfGG+ltOV/7CRj43YAso5QTFiPcKSnhFKO4Im+YnCiom+UnaE
	RW1jOR5yA/yeeLAw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=K3Fwb42J;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=hd6Asxqa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037659; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t0eq0NAc9OO3QmnmD20HOADoTUiByy1RTqvTlpeXiF0=;
	b=K3Fwb42JOoKPEMLTUVGNq8taDBz9ballQSaiOLWqyMsfRKn8dXW8+VjmiIkYMOBy0BD7H+
	JnLEjmp/YtU37KUNOqbGlyrBTTGBRoCg3L5EPeGBzsBOE8U60DoGYjwQrKhQN3QnOtWtcb
	QZdQULrh75/MF4iUTifk3v09mGqjTDQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037659;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t0eq0NAc9OO3QmnmD20HOADoTUiByy1RTqvTlpeXiF0=;
	b=hd6AsxqaHzwgkKOaEtwQyrfGG+ltOV/7CRj43YAso5QTFiPcKSnhFKO4Im+YnCiom+UnaE
	RW1jOR5yA/yeeLAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 45D8F13B05;
	Wed,  7 Aug 2024 13:34:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2G3wD9t3s2ZpVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 13:34:19 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 20/54] ALSA: azt2320: Use standard print API
Date: Wed,  7 Aug 2024 15:34:10 +0200
Message-ID: <20240807133452.9424-21-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
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
X-Rspamd-Queue-Id: 5F7FE1FB91
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -0.01

Use the standard print API with dev_*() instead of the old house-baked
one.  It gives better information and allows dynamically control of
debug prints.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/azt2320.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/sound/isa/azt2320.c b/sound/isa/azt2320.c
index 761cd198df2b..b937c9138d12 100644
--- a/sound/isa/azt2320.c
+++ b/sound/isa/azt2320.c
@@ -30,8 +30,6 @@
 #include <sound/mpu401.h>
 #include <sound/opl3.h>
 
-#define PFX "azt2320: "
-
 MODULE_AUTHOR("Massimo Piccioni <dafastidio@libero.it>");
 MODULE_DESCRIPTION("Aztech Systems AZT2320");
 MODULE_LICENSE("GPL");
@@ -99,7 +97,7 @@ static int snd_card_azt2320_pnp(int dev, struct snd_card_azt2320 *acard,
 
 	err = pnp_activate_dev(pdev);
 	if (err < 0) {
-		snd_printk(KERN_ERR PFX "AUDIO pnp configure failure\n");
+		dev_err(&pdev->dev, "AUDIO pnp configure failure\n");
 		return err;
 	}
 	port[dev] = pnp_port_start(pdev, 0);
@@ -120,7 +118,7 @@ static int snd_card_azt2320_pnp(int dev, struct snd_card_azt2320 *acard,
 	     __mpu_error:
 	     	if (pdev) {
 		     	pnp_release_card_device(pdev);
-	     		snd_printk(KERN_ERR PFX "MPU401 pnp configure failure, skipping\n");
+			dev_err(&pdev->dev, "MPU401 pnp configure failure, skipping\n");
 	     	}
 	     	acard->devmpu = NULL;
 	     	mpu_port[dev] = -1;
@@ -210,15 +208,15 @@ static int snd_card_azt2320_probe(int dev,
 		if (snd_mpu401_uart_new(card, 0, MPU401_HW_AZT2320,
 				mpu_port[dev], 0,
 				mpu_irq[dev], NULL) < 0)
-			snd_printk(KERN_ERR PFX "no MPU-401 device at 0x%lx\n", mpu_port[dev]);
+			dev_err(card->dev, "no MPU-401 device at 0x%lx\n", mpu_port[dev]);
 	}
 
 	if (fm_port[dev] > 0 && fm_port[dev] != SNDRV_AUTO_PORT) {
 		if (snd_opl3_create(card,
 				    fm_port[dev], fm_port[dev] + 2,
 				    OPL3_HW_AUTO, 0, &opl3) < 0) {
-			snd_printk(KERN_ERR PFX "no OPL device at 0x%lx-0x%lx\n",
-				   fm_port[dev], fm_port[dev] + 2);
+			dev_err(card->dev, "no OPL device at 0x%lx-0x%lx\n",
+				fm_port[dev], fm_port[dev] + 2);
 		} else {
 			error = snd_opl3_timer_new(opl3, 1, 2);
 			if (error < 0)
@@ -303,7 +301,7 @@ static int __init alsa_card_azt2320_init(void)
 	if (!azt2320_devices) {
 		pnp_unregister_card_driver(&azt2320_pnpc_driver);
 #ifdef MODULE
-		snd_printk(KERN_ERR "no AZT2320 based soundcards found\n");
+		pr_err("no AZT2320 based soundcards found\n");
 #endif
 		return -ENODEV;
 	}
-- 
2.43.0

