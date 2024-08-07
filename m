Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D471C1E674B
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 13:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723037664; cv=none; b=Faq0uJonTGPLZtQ+VnUpRr84hUt2d6lGQqkBIgkrnFjibnMXLHe+JoSsJNBLwhtW1eV4d1B5VAL5DGMpAK5DPJU1GxsA60MUo887F9NHlS6lJdEKw1akyu2mlITU/cIlwdbJQsdL8rePaVWZgxG6JOMo60FBA5ryoQbQ2joIsng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723037664; c=relaxed/simple;
	bh=YPRPcm5IThAvsIMS01cdKfAWCZG979oPiq4DeQ5vqpU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EWR4J47nQan0sDQ8p90tz36UxPLVRaHQYRdaryWXVxybYOYvOEh6Z8PPFHZBXxFKRILnwjufR+cHrkHcYhigjPtMuoLsX9p2ZmNgT62w7qAHL50cH3d9YyVSEt0Ppygv5RHAiiIexuZ362InD1W9GRaSWAGNkmQvXlltO3DsNWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nAAtoHKg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sBXwvpxJ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nAAtoHKg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sBXwvpxJ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nAAtoHKg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sBXwvpxJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nAAtoHKg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sBXwvpxJ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 40D9E21D21;
	Wed,  7 Aug 2024 13:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037659; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ia/KbgZueV6WxQzPUtoJHOcdi3wu7s99CSwUPMuERT0=;
	b=nAAtoHKgi2QPeMVA7cHZB3p17FBFz9anKkdS4FToNJBxnpt3u27okuo805PxW+MpjS/NLX
	EG6QLU7xna+u9MyY47s59l94wXq9zEn6TVVxoFvlr5iba8YIZcHfBDla2UFa43Vu3iwxuR
	cVhyUuOYB99JZAVfqrXun2EYk0KPwiM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037659;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ia/KbgZueV6WxQzPUtoJHOcdi3wu7s99CSwUPMuERT0=;
	b=sBXwvpxJeXDzpEmbLIcY4jq/uHUun+SOP0y7BExoe7TB0VJQtUGSnYTeKQs41YBovIy0wH
	ZXf89hNxWlb0iQAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=nAAtoHKg;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=sBXwvpxJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037659; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ia/KbgZueV6WxQzPUtoJHOcdi3wu7s99CSwUPMuERT0=;
	b=nAAtoHKgi2QPeMVA7cHZB3p17FBFz9anKkdS4FToNJBxnpt3u27okuo805PxW+MpjS/NLX
	EG6QLU7xna+u9MyY47s59l94wXq9zEn6TVVxoFvlr5iba8YIZcHfBDla2UFa43Vu3iwxuR
	cVhyUuOYB99JZAVfqrXun2EYk0KPwiM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037659;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ia/KbgZueV6WxQzPUtoJHOcdi3wu7s99CSwUPMuERT0=;
	b=sBXwvpxJeXDzpEmbLIcY4jq/uHUun+SOP0y7BExoe7TB0VJQtUGSnYTeKQs41YBovIy0wH
	ZXf89hNxWlb0iQAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 24E6913A7D;
	Wed,  7 Aug 2024 13:34:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kE3UB9t3s2ZpVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 13:34:19 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 19/54] ALSA: als100: Use standard print API
Date: Wed,  7 Aug 2024 15:34:09 +0200
Message-ID: <20240807133452.9424-20-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 40D9E21D21
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

Use the standard print API with dev_*() instead of the old house-baked
one.  It gives better information and allows dynamically control of
debug prints.

Use the standard print API instead of open-coded printk().

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/als100.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/sound/isa/als100.c b/sound/isa/als100.c
index d582eff64082..e70dbf0b099a 100644
--- a/sound/isa/als100.c
+++ b/sound/isa/als100.c
@@ -23,8 +23,6 @@
 #include <sound/opl3.h>
 #include <sound/sb.h>
 
-#define PFX "als100: "
-
 MODULE_DESCRIPTION("Avance Logic ALS007/ALS1X0");
 MODULE_AUTHOR("Massimo Piccioni <dafastidio@libero.it>");
 MODULE_LICENSE("GPL");
@@ -112,7 +110,7 @@ static int snd_card_als100_pnp(int dev, struct snd_card_als100 *acard,
 
 	err = pnp_activate_dev(pdev);
 	if (err < 0) {
-		snd_printk(KERN_ERR PFX "AUDIO pnp configure failure\n");
+		dev_err(&pdev->dev, "AUDIO pnp configure failure\n");
 		return err;
 	}
 	port[dev] = pnp_port_start(pdev, 0);
@@ -135,7 +133,7 @@ static int snd_card_als100_pnp(int dev, struct snd_card_als100 *acard,
 	     __mpu_error:
 	     	if (pdev) {
 		     	pnp_release_card_device(pdev);
-	     		snd_printk(KERN_ERR PFX "MPU401 pnp configure failure, skipping\n");
+			dev_err(&pdev->dev, "MPU401 pnp configure failure, skipping\n");
 	     	}
 	     	acard->devmpu = NULL;
 	     	mpu_port[dev] = -1;
@@ -151,7 +149,7 @@ static int snd_card_als100_pnp(int dev, struct snd_card_als100 *acard,
 	      __fm_error:
 	     	if (pdev) {
 		     	pnp_release_card_device(pdev);
-	     		snd_printk(KERN_ERR PFX "OPL3 pnp configure failure, skipping\n");
+			dev_err(&pdev->dev, "OPL3 pnp configure failure, skipping\n");
 	     	}
 	     	acard->devopl = NULL;
 	     	fm_port[dev] = -1;
@@ -230,15 +228,15 @@ static int snd_card_als100_probe(int dev,
 					mpu_port[dev], 0, 
 					mpu_irq[dev],
 					NULL) < 0)
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
 			error = snd_opl3_timer_new(opl3, 0, 1);
 			if (error < 0)
@@ -324,7 +322,7 @@ static int __init alsa_card_als100_init(void)
 	if (!als100_devices) {
 		pnp_unregister_card_driver(&als100_pnpc_driver);
 #ifdef MODULE
-		snd_printk(KERN_ERR "no Avance Logic based soundcards found\n");
+		pr_err("no Avance Logic based soundcards found\n");
 #endif
 		return -ENODEV;
 	}
-- 
2.43.0

