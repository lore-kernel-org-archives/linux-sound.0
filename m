Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00126420486
	for <linux-sound@vger.kernel.org>; Sat,  3 Oct 2026 10:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791025084; cv=none; b=E93A5LZA1Y3tn5IZBOzMGD9nxFkTeMCg0tSKHZpNHXPKkDA5fNNbp57k9jfEfDIyNOhegM4SHCWzIBl++DXpE5mmceQYDTLyUfuZD/0XPCnJiMYaSyEc7T+wQXttN1X7hTKL3QxV5DNcfriG6Wx8PQOLbDanRijcuzhHANCA7fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791025084; c=relaxed/simple;
	bh=sixe4/BBinvXGUcFHGZIkaudMII42LIRw50BSp/jHWU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gpZj5SeEuFr0sTzrEKPI9ch7Xf00KbxN0teQERhDSd+pXms0gsjbw6oilu5c8rXEvkFDhEX9WZqiYWbI2B6jXc9yqI6UGfayfjt0WXJURWdha2ljYw+4/iSazuyC+FdNlZj7l/4T2MrVZHqM9UH47wNW5riIXMeNPqLh0rWpgyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=s+27iZgP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=m7YDMzrv; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0FLsIh3q; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Y6X9vUkC; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="s+27iZgP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="m7YDMzrv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0FLsIh3q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Y6X9vUkC"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 99F2521C2D;
	Sat,  3 Oct 2026 10:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791025074; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PXN8TuwadCRn6vYcUGJCZKhTTxK5bKN9xSBHWY+yio0=;
	b=s+27iZgPaepgaTCzaPLAzzW6xrDD+zWUUBphtWzlQaIoaATZ5fR8dTAxrBTheLl9zNxQCs
	oWa7BAKHDISxfnYVv4ihnEjOlLetn3v3k000GSGgNM7LzyhdP/VRxF8CIQPdEmcxYS5cHN
	Fty3Zp6WFbUHvVU7rgSHlnn2dVHd9NI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791025074;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PXN8TuwadCRn6vYcUGJCZKhTTxK5bKN9xSBHWY+yio0=;
	b=m7YDMzrviaBvjXGyWG7Q+cwGHJ+AhpLSQG2ceq75Vs8WjFdsKLxVXzd4w/5ciMYOhZgmIi
	bBsxALdhOPe1CJBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791025070; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PXN8TuwadCRn6vYcUGJCZKhTTxK5bKN9xSBHWY+yio0=;
	b=0FLsIh3qbE5BbbTNMI6WFPK/PKidH2rTUczyukUweKHdEpRGA2xzzjkD4kBX5/63yqYQ9P
	06xjObnQZ/e5YL1THZZz1luI5AWm3cw+WjDrEBnaIBDcwd2HSQLG/kbZeLxqsjvU4hAYSY
	GS48zlkDJs2FW75gV9Id5f60COjltYw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791025070;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PXN8TuwadCRn6vYcUGJCZKhTTxK5bKN9xSBHWY+yio0=;
	b=Y6X9vUkCVKJAO8+CljsIB5EGzgIqdpdX+/RvIRpX+RRDyQv+8FjgDn0j5nu2xAWV9Dq2VK
	e+KSbGJtCEc0prDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6BA5213884;
	Sat,  3 Oct 2026 10:57:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id rc1+HaXfwGosCAAAD6G6ig:T7
	(envelope-from <tiwai@suse.de>); Sat, 03 Oct 2026 10:57:42 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 6/9] ALSA: powermac: Use devres card management
Date: Sat,  3 Oct 2026 12:57:13 +0200
Message-ID: <20261003105719.1070427-7-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261003105719.1070427-1-tiwai@suse.de>
References: <20261003105719.1070427-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-0.999];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.990];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Flag: NO

The powermac driver's remove callback is nothing but a simple
snd_card_free() call, so let's use the devres for managing the card,
for simplifying the handling.

Now the card is created via snd_devm_card_new() that is auto-cleaned
up at probe for errors.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/ppc/powermac.c | 35 ++++++++++++-----------------------
 1 file changed, 12 insertions(+), 23 deletions(-)

diff --git a/sound/ppc/powermac.c b/sound/ppc/powermac.c
index e685d245883e..30f4cd1a6d32 100644
--- a/sound/ppc/powermac.c
+++ b/sound/ppc/powermac.c
@@ -39,18 +39,18 @@ static struct platform_device *device;
 
 static int snd_pmac_probe(struct platform_device *devptr)
 {
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_free) = NULL;
 	struct snd_pmac *chip;
 	char *name_ext;
 	int err;
 
-	err = snd_card_new(&devptr->dev, index, id, THIS_MODULE, 0, &card);
+	err = snd_devm_card_new(&devptr->dev, index, id, THIS_MODULE, 0, &card);
 	if (err < 0)
 		return err;
 
 	err = snd_pmac_new(card, &chip);
 	if (err < 0)
-		goto __error;
+		return err;
 	card->private_data = chip;
 
 	switch (chip->model) {
@@ -61,7 +61,7 @@ static int snd_pmac_probe(struct platform_device *devptr)
 			card->shortname, chip->device_id, chip->subframe);
 		err = snd_pmac_burgundy_init(chip);
 		if (err < 0)
-			goto __error;
+			return err;
 		break;
 	case PMAC_DACA:
 		strscpy(card->driver, "PMac DACA");
@@ -70,7 +70,7 @@ static int snd_pmac_probe(struct platform_device *devptr)
 			card->shortname, chip->device_id, chip->subframe);
 		err = snd_pmac_daca_init(chip);
 		if (err < 0)
-			goto __error;
+			return err;
 		break;
 	case PMAC_TUMBLER:
 	case PMAC_SNAPPER:
@@ -81,10 +81,10 @@ static int snd_pmac_probe(struct platform_device *devptr)
 			card->shortname, chip->device_id, chip->subframe);
 		err = snd_pmac_tumbler_init(chip);
 		if (err < 0)
-			goto __error;
+			return err;
 		err = snd_pmac_tumbler_post_init();
 		if (err < 0)
-			goto __error;
+			return err;
 		break;
 	case PMAC_AWACS:
 	case PMAC_SCREAMER:
@@ -101,17 +101,16 @@ static int snd_pmac_probe(struct platform_device *devptr)
 			card->shortname, name_ext, chip->revision);
 		err = snd_pmac_awacs_init(chip);
 		if (err < 0)
-			goto __error;
+			return err;
 		break;
 	default:
 		dev_err(&devptr->dev, "unsupported hardware %d\n", chip->model);
-		err = -EINVAL;
-		goto __error;
+		return -EINVAL;
 	}
 
 	err = snd_pmac_pcm_new(chip);
 	if (err < 0)
-		goto __error;
+		return err;
 
 	chip->initialized = 1;
 	if (enable_beep)
@@ -119,20 +118,11 @@ static int snd_pmac_probe(struct platform_device *devptr)
 
 	err = snd_card_register(card);
 	if (err < 0)
-		goto __error;
+		return err;
 
 	platform_set_drvdata(devptr, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	return 0;
-
-__error:
-	snd_card_free(card);
-	return err;
-}
-
-
-static void snd_pmac_remove(struct platform_device *devptr)
-{
-	snd_card_free(platform_get_drvdata(devptr));
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -160,7 +150,6 @@ static SIMPLE_DEV_PM_OPS(snd_pmac_pm, snd_pmac_driver_suspend, snd_pmac_driver_r
 
 static struct platform_driver snd_pmac_driver = {
 	.probe		= snd_pmac_probe,
-	.remove		= snd_pmac_remove,
 	.driver		= {
 		.name	= SND_PMAC_DRIVER,
 		.pm	= SND_PMAC_PM_OPS,
-- 
2.55.0

