Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75941BC08C
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 13:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723037660; cv=none; b=oFoR8EcpWfSfX81sVPgKAvjnVtFrneH8yBP6/CQhD3EVwLvecGdQ+1rAK6k8K2iwO5gofB+yEEmEZ4FbSTaBEGYyOmQ29au1JTcCM9fO16c/g7kGYDutoGlHxCVnpAPAWVs0XVMdqvJ51PdVPSTQSL9bdNNv/qWYfzbOgj+GVzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723037660; c=relaxed/simple;
	bh=O4vsEcDTZxX0PAqGM6whQr67waVkJRM4Bl2/4X+uebg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CDvh24V0RVjcMK7sWCn9x5G+sYVDYaRMSqwEz59bLBFuNO7AliaX5liOfFVhfRghRHQ1Pi1hcGOpDgRc/iq4wyqJF2mnAIIcJyFuuxarOBogIegd0wBN/EHBC9R9oBAQTiMAes3zhTuNdmCIb0wc7SSy8n4sclnoEhVGTkQqSD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=X8I1SGSw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+OGWkw9+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=X8I1SGSw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+OGWkw9+; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="X8I1SGSw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+OGWkw9+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="X8I1SGSw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+OGWkw9+"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 14FA51F891;
	Wed,  7 Aug 2024 13:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037657; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8MBtXQPGfHqDS7H3Cg3owACryDilFxhzkG+MA4FKfkw=;
	b=X8I1SGSwVrhOzn2TBRRHHNs9Ie5WOnsqAgQqOfeAxKcrAzRAYvjTt5V5KIpNm5+6f9nY6w
	IMnTTp2RpmTdIWlnyUjq8LTbFFNkLND6vyQKdzuE5eQwXjSEfxzR3RdZXmz0SKY+gM/DLT
	VGGFMzY2MvbhfMehhvaG2UspCMbhxgA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037657;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8MBtXQPGfHqDS7H3Cg3owACryDilFxhzkG+MA4FKfkw=;
	b=+OGWkw9+0siwVcezxz5yTaFH++b38qSMWs+Z/W43ctXdBJU7okEOuH0BrezJHKtr14SByi
	veKKx6EdyVWG1bCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037657; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8MBtXQPGfHqDS7H3Cg3owACryDilFxhzkG+MA4FKfkw=;
	b=X8I1SGSwVrhOzn2TBRRHHNs9Ie5WOnsqAgQqOfeAxKcrAzRAYvjTt5V5KIpNm5+6f9nY6w
	IMnTTp2RpmTdIWlnyUjq8LTbFFNkLND6vyQKdzuE5eQwXjSEfxzR3RdZXmz0SKY+gM/DLT
	VGGFMzY2MvbhfMehhvaG2UspCMbhxgA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037657;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8MBtXQPGfHqDS7H3Cg3owACryDilFxhzkG+MA4FKfkw=;
	b=+OGWkw9+0siwVcezxz5yTaFH++b38qSMWs+Z/W43ctXdBJU7okEOuH0BrezJHKtr14SByi
	veKKx6EdyVWG1bCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EB7FB13A7D;
	Wed,  7 Aug 2024 13:34:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2DlWONh3s2ZpVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 13:34:16 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 02/54] ALSA: mts64: Use standard print API
Date: Wed,  7 Aug 2024 15:33:52 +0200
Message-ID: <20240807133452.9424-3-tiwai@suse.de>
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
	NEURAL_HAM_SHORT(-0.19)[-0.953];
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

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/mts64.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/drivers/mts64.c b/sound/drivers/mts64.c
index b1b333d1cf39..6fc255a6754d 100644
--- a/sound/drivers/mts64.c
+++ b/sound/drivers/mts64.c
@@ -652,8 +652,8 @@ static int snd_mts64_ctl_create(struct snd_card *card,
 	for (i = 0; control[i]; ++i) {
 		err = snd_ctl_add(card, snd_ctl_new1(control[i], mts));
 		if (err < 0) {
-			snd_printd("Cannot create control: %s\n", 
-				   control[i]->name);
+			dev_dbg(card->dev, "Cannot create control: %s\n",
+				control[i]->name);
 			return err;
 		}
 	}
@@ -926,7 +926,7 @@ static int snd_mts64_probe(struct platform_device *pdev)
 	err = snd_card_new(&pdev->dev, index[dev], id[dev], THIS_MODULE,
 			   0, &card);
 	if (err < 0) {
-		snd_printd("Cannot create card\n");
+		dev_dbg(&pdev->dev, "Cannot create card\n");
 		return err;
 	}
 	strcpy(card->driver, DRIVER_NAME);
@@ -940,21 +940,21 @@ static int snd_mts64_probe(struct platform_device *pdev)
 					    &mts64_cb,	 /* callbacks */
 					    pdev->id);	 /* device number */
 	if (!pardev) {
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
 
 	err = snd_mts64_create(card, pardev, &mts);
 	if (err < 0) {
-		snd_printd("Cannot create main component\n");
+		dev_dbg(card->dev, "Cannot create main component\n");
 		goto release_pardev;
 	}
 	card->private_data = mts;
@@ -968,7 +968,7 @@ static int snd_mts64_probe(struct platform_device *pdev)
 	
 	err = snd_mts64_rawmidi_create(card);
 	if (err < 0) {
-		snd_printd("Creating Rawmidi component failed\n");
+		dev_dbg(card->dev, "Creating Rawmidi component failed\n");
 		goto __err;
 	}
 
@@ -982,11 +982,11 @@ static int snd_mts64_probe(struct platform_device *pdev)
 	/* At this point card will be usable */
 	err = snd_card_register(card);
 	if (err < 0) {
-		snd_printd("Cannot register card\n");
+		dev_dbg(card->dev, "Cannot register card\n");
 		goto __err;
 	}
 
-	snd_printk(KERN_INFO "ESI Miditerminal 4140 on 0x%lx\n", p->base);
+	dev_info(card->dev, "ESI Miditerminal 4140 on 0x%lx\n", p->base);
 	return 0;
 
 release_pardev:
-- 
2.43.0

