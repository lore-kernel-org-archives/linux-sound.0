Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0028B42048D
	for <linux-sound@vger.kernel.org>; Sat,  3 Oct 2026 10:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791025084; cv=none; b=mxAoMTBBeNTmFgn6iSKRne98TtQHDecHl9UDKYRx9060CkpYjSrfb6kP7Ne5HpLLBAQmwZ04Sc5LwMbJBaoc3id1e+Ln+nJEhjY65iNaHlAbvwjVR3fZhRbn6s1ITx2yZxiOid6B+YCJm3EH6Nuqv2wXc1/oCBKE+O2N2UBG13A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791025084; c=relaxed/simple;
	bh=7QCRarObpsfYnmry7k7n/bwvxJbR6gor74MlEHtI20g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cxpdyzCB7ZgQTBK/2GNXgYIMXTERsFcsUCBOXRMB0HN3MROJayRGGWCtt7oE6hvYoXrS7uPzgKXwuTLsmIfffWS9LNV4uDbmhiNetiLb8V9COcZzaM1PLzh3UVuhyfdVgfsPw6Im75Pbttc1TmW9T4TUT1TERH2GzwK9nKCFNYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JWpWnSV+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pyhqdsOC; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=w5xZzsNF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5nenEi3O; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JWpWnSV+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pyhqdsOC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="w5xZzsNF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5nenEi3O"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A869721C30;
	Sat,  3 Oct 2026 10:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791025074; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jd0JnwF+Zxo3mR1So9bFqqxyttcU7G+XTTTz4IlC+BM=;
	b=JWpWnSV+++n/3JmYlD4T69F8L63vQ0+hz4QMnLAEhJnuWFcTgAf9m6joe5TpCCkgD4li8Q
	dyMKlQSvHIV06ip3cB4yA7jAVWCXyqnz2ubI+PlmRl28XD1sT0BaHDcDE8w+3wR68MkkCs
	PCAWa+O4CEVj7cPE/MydT5hklGMOR4Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791025074;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jd0JnwF+Zxo3mR1So9bFqqxyttcU7G+XTTTz4IlC+BM=;
	b=pyhqdsOCx6U7rM6SCDQl7SRqqwfa0zhNI+iGFAlBb2BODirt7mJDosF6EFl3f9JwZCFgHb
	s5HEXHq5O+EZfPCQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=w5xZzsNF;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=5nenEi3O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791025070; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jd0JnwF+Zxo3mR1So9bFqqxyttcU7G+XTTTz4IlC+BM=;
	b=w5xZzsNFjS8cUxPjghO14GWzFNEBGZVe31/rYmbpBaEryRv2ggsyploE4f1aMQmFuAtnkH
	ZWolVTTT06Z1WYrJRlpiBgC1GXN0dm1eDOUuLZ0kto68McwMVbPB8V2SuJKQwU+H0+bB/v
	d3/n+YoO4e0MwVWw+AgFBH7C+1mn+iE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791025070;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jd0JnwF+Zxo3mR1So9bFqqxyttcU7G+XTTTz4IlC+BM=;
	b=5nenEi3OJah+j4c3fNH6X2fxpODrLONeYufY99Cptwq+ZwIxH1c96EJvjn7Nes8V/nm4fK
	Aq2F4u3YfGKyJ6CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8FE4D13885;
	Sat,  3 Oct 2026 10:57:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id rc1+HaXfwGosCAAAD6G6ig:T8
	(envelope-from <tiwai@suse.de>); Sat, 03 Oct 2026 10:57:42 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 7/9] ALSA: sh: Use devres card management
Date: Sat,  3 Oct 2026 12:57:14 +0200
Message-ID: <20261003105719.1070427-8-tiwai@suse.de>
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
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: A869721C30
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 

The SH DAC driver's remove callback is nothing but a simple
snd_card_free() call, so let's use the devres for managing the card,
for simplifying the handling.

Now the card is created via snd_devm_card_new() that is auto-cleaned
up at probe for errors.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/sh/sh_dac_audio.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/sound/sh/sh_dac_audio.c b/sound/sh/sh_dac_audio.c
index 2d9a2d5b824e..5896cce424af 100644
--- a/sound/sh/sh_dac_audio.c
+++ b/sound/sh/sh_dac_audio.c
@@ -236,12 +236,6 @@ static int snd_sh_dac_pcm(struct snd_sh_dac *chip, int device)
 /* END OF PCM INTERFACE */
 
 
-/* driver .remove  --  destructor */
-static void snd_sh_dac_remove(struct platform_device *devptr)
-{
-	snd_card_free(platform_get_drvdata(devptr));
-}
-
 /* free -- it has been defined by create */
 static int snd_sh_dac_free(struct snd_sh_dac *chip)
 {
@@ -341,10 +335,10 @@ static int snd_sh_dac_create(struct snd_card *card,
 static int snd_sh_dac_probe(struct platform_device *devptr)
 {
 	struct snd_sh_dac *chip;
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_free) = NULL;
 	int err;
 
-	err = snd_card_new(&devptr->dev, index, id, THIS_MODULE, 0, &card);
+	err = snd_devm_card_new(&devptr->dev, index, id, THIS_MODULE, 0, &card);
 	if (err < 0) {
 		dev_err(&devptr->dev, "cannot allocate the card\n");
 		return err;
@@ -352,11 +346,11 @@ static int snd_sh_dac_probe(struct platform_device *devptr)
 
 	err = snd_sh_dac_create(card, devptr, &chip);
 	if (err < 0)
-		goto probe_error;
+		return err;
 
 	err = snd_sh_dac_pcm(chip, 0);
 	if (err < 0)
-		goto probe_error;
+		return err;
 
 	strscpy(card->driver, "snd_sh_dac");
 	strscpy(card->shortname, "SuperH DAC audio driver");
@@ -364,16 +358,13 @@ static int snd_sh_dac_probe(struct platform_device *devptr)
 
 	err = snd_card_register(card);
 	if (err < 0)
-		goto probe_error;
+		return err;
 
 	dev_info(&devptr->dev, "ALSA driver for SuperH DAC audio\n");
 
 	platform_set_drvdata(devptr, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	return 0;
-
-probe_error:
-	snd_card_free(card);
-	return err;
 }
 
 /*
@@ -381,7 +372,6 @@ static int snd_sh_dac_probe(struct platform_device *devptr)
  */
 static struct platform_driver sh_dac_driver = {
 	.probe	= snd_sh_dac_probe,
-	.remove = snd_sh_dac_remove,
 	.driver = {
 		.name = "dac_audio",
 	},
-- 
2.55.0

