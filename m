Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7911F201254
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 13:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723037672; cv=none; b=oJXZMrLcikVMIhh6KxQ3lihy/ISxEIsQWJQ1+42bReYaisPc2CHYbrKNlr6EfZaAlW74mye5djoddSW1dtVqx/bA75zUqHddq2T+qU+sDH9lVjBUmQOlWNuHRHeGEGeN4gLO1EdWUQry2mhty6oHQuqOpafNks3g/tD9KUUq3tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723037672; c=relaxed/simple;
	bh=mUTUSQVp4U6ADmRxvLJdjmD1QPEmj+5efH7f7m27FLM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cMNBfYwi7I8nK/jPYd0eboUD769p4AXl3vXVNUZGA9g2TVz+CncBV6gfh6TIyYuSRdXEmBTzROrtvghGbN6qcF2sRY1F6CqtmLCjtyOo56sW2kKpA0ZXyVoTeI+ES8j+XqKG9VedTW1AljcqQGOuoSTeTxyGHWPJfLEtURUEuVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gz0CKxqo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VvS9IHUJ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gz0CKxqo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VvS9IHUJ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gz0CKxqo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VvS9IHUJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gz0CKxqo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VvS9IHUJ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 51EBE1F8AB;
	Wed,  7 Aug 2024 13:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037663; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LRX3oWdVtUasZh7kMuVD0QZcyBpyX66vdnq7BsHSRUw=;
	b=gz0CKxqonoArRpDMFGtQYm77TGGCQ6F4V6Mjsbo3sLGkQDcetLD5wkR7sXroxJCDuwlnSS
	HI2+W6VTd+u1XilZw4/VrtYB6N6Hkz6aJxmW/kb2fbhrFL90L1/pP24y+0CrJg/6q212qG
	/toj7M8Mo+HC/thErigUMDpYi574QGw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037663;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LRX3oWdVtUasZh7kMuVD0QZcyBpyX66vdnq7BsHSRUw=;
	b=VvS9IHUJlcAAnPGSMEsIEkGd//0krVGmoNr6GdLqOu6KJtL8r2yd4fpS1z9/SEqkEXd5Gl
	rSc9MxRDl0TtAkCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037663; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LRX3oWdVtUasZh7kMuVD0QZcyBpyX66vdnq7BsHSRUw=;
	b=gz0CKxqonoArRpDMFGtQYm77TGGCQ6F4V6Mjsbo3sLGkQDcetLD5wkR7sXroxJCDuwlnSS
	HI2+W6VTd+u1XilZw4/VrtYB6N6Hkz6aJxmW/kb2fbhrFL90L1/pP24y+0CrJg/6q212qG
	/toj7M8Mo+HC/thErigUMDpYi574QGw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037663;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LRX3oWdVtUasZh7kMuVD0QZcyBpyX66vdnq7BsHSRUw=;
	b=VvS9IHUJlcAAnPGSMEsIEkGd//0krVGmoNr6GdLqOu6KJtL8r2yd4fpS1z9/SEqkEXd5Gl
	rSc9MxRDl0TtAkCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3A37B13B03;
	Wed,  7 Aug 2024 13:34:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GKoSDd93s2ZpVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 13:34:23 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 50/54] ALSA: sh: Use standard print API
Date: Wed,  7 Aug 2024 15:34:40 +0200
Message-ID: <20240807133452.9424-51-tiwai@suse.de>
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
	NEURAL_HAM_SHORT(-0.19)[-0.951];
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
 sound/sh/aica.c         | 7 +++----
 sound/sh/sh_dac_audio.c | 8 ++++----
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/sound/sh/aica.c b/sound/sh/aica.c
index 3182c634464d..936cd6e91529 100644
--- a/sound/sh/aica.c
+++ b/sound/sh/aica.c
@@ -75,8 +75,7 @@ static void spu_write_wait(void)
 		/* To ensure hardware failure doesn't wedge kernel */
 		time_count++;
 		if (time_count > 0x10000) {
-			snd_printk
-			    ("WARNING: G2 FIFO appears to be blocked.\n");
+			pr_warn("WARNING: G2 FIFO appears to be blocked.\n");
 			break;
 		}
 	}
@@ -591,8 +590,8 @@ static int snd_aica_probe(struct platform_device *devptr)
 	if (unlikely(err < 0))
 		goto freedreamcast;
 	platform_set_drvdata(devptr, dreamcastcard);
-	snd_printk
-	    ("ALSA Driver for Yamaha AICA Super Intelligent Sound Processor\n");
+	dev_info(&devptr->dev,
+		 "ALSA Driver for Yamaha AICA Super Intelligent Sound Processor\n");
 	return 0;
       freedreamcast:
 	snd_card_free(dreamcastcard->card);
diff --git a/sound/sh/sh_dac_audio.c b/sound/sh/sh_dac_audio.c
index 95ba3abd4e47..e7b6ce7bd086 100644
--- a/sound/sh/sh_dac_audio.c
+++ b/sound/sh/sh_dac_audio.c
@@ -348,8 +348,8 @@ static int snd_sh_dac_probe(struct platform_device *devptr)
 
 	err = snd_card_new(&devptr->dev, index, id, THIS_MODULE, 0, &card);
 	if (err < 0) {
-			snd_printk(KERN_ERR "cannot allocate the card\n");
-			return err;
+		dev_err(&devptr->dev, "cannot allocate the card\n");
+		return err;
 	}
 
 	err = snd_sh_dac_create(card, devptr, &chip);
@@ -362,13 +362,13 @@ static int snd_sh_dac_probe(struct platform_device *devptr)
 
 	strcpy(card->driver, "snd_sh_dac");
 	strcpy(card->shortname, "SuperH DAC audio driver");
-	printk(KERN_INFO "%s %s", card->longname, card->shortname);
+	dev_info(&devptr->dev, "%s %s\n", card->longname, card->shortname);
 
 	err = snd_card_register(card);
 	if (err < 0)
 		goto probe_error;
 
-	snd_printk(KERN_INFO "ALSA driver for SuperH DAC audio");
+	dev_info(&devptr->dev, "ALSA driver for SuperH DAC audio\n");
 
 	platform_set_drvdata(devptr, card);
 	return 0;
-- 
2.43.0

