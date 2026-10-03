Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C18C41BA72
	for <linux-sound@vger.kernel.org>; Sat,  3 Oct 2026 10:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791025074; cv=none; b=ox6h8pIQor54PTgIPqrfm6rBzeCfD8s+n0nbcO9i5I56IIxaTp6Olx6IBefvEbMVJQCV6tx9q8psFNcBJ2yntSUhJRSglTF+Hq21w9He99tdxybtJmP2obFpkHGELfqUylhBkm32y1IYPA1P/++zsZ2jXHc9kbCTKDefserT+Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791025074; c=relaxed/simple;
	bh=bRTuNiS86Lz2ELE/UVf4AiAl70++SfQTkOB8W24veXI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tyvPB4Wx2g+w9GzYrsncUbahIoxVKgByMTDDnyk+MApeZn/RirQmhFUo29Ptdh14HHj1+v3HDfi3fm16cRi9R3k3tVqvgnisTdpij1CTEEjj0AQmj/xBKf/3JsIy9VBfuT4PAunrdXMUCYqlcZ3sdPGEtZUD5cxF6RqXVFUdjM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Fib2vYhj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=P2jq29YL; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VpitoAgn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZtfhPxxr; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Fib2vYhj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="P2jq29YL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VpitoAgn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZtfhPxxr"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 30C831FECF;
	Sat,  3 Oct 2026 10:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791025066; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lYryTm3Za2e1XtqAQkqdIT94om9xZ3AEJx3TdVkB3B4=;
	b=Fib2vYhjkL8/vdOtHtYBL/zYnWsyWf2+LTIN3qonNJjIoUgp8FHxxrO3OZ/YBwKtJuotM3
	OHyFYXOfUHaqyHZwuNJnzFQITtVITVCjmkjQR9BpdQX5QtxmBF1C5KsOaugaty+PwwSl62
	i4gnLzMZwgvF+L1U04jTCRSeehcRXdk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791025066;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lYryTm3Za2e1XtqAQkqdIT94om9xZ3AEJx3TdVkB3B4=;
	b=P2jq29YLrn0qwkLWg2/rv85sMz1x+Ki0Hql1KdQbbwWww2yNRanPJa834YbJ0j8xSnB0z7
	S/Mx5geUu1g+tkAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791025062; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lYryTm3Za2e1XtqAQkqdIT94om9xZ3AEJx3TdVkB3B4=;
	b=VpitoAgnPUTem79SFIdJOrDGR73fWLi4ihk31JX64XQfMr2jaRcsjyeRUU6P0LcmNDdApq
	803nSBBAb+rfSVjLZEOyJEn6RjGqxyfbW44k/QTwgi0tnbdLVmF/0b4eTSzLigg7ietunJ
	02Z91aRsxO8tXlt1RnkC5UcbUQBlUhc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791025062;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lYryTm3Za2e1XtqAQkqdIT94om9xZ3AEJx3TdVkB3B4=;
	b=ZtfhPxxrXwU9bbHJ+il2AzvAuRfgz4C2LtPslW1JXMf/Lhiv5opycMD8o91vGnd+4wPelF
	uw04Hn/YHK6FrqCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C43B013872;
	Sat,  3 Oct 2026 10:57:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id rc1+HaXfwGosCAAAD6G6ig:T2
	(envelope-from <tiwai@suse.de>); Sat, 03 Oct 2026 10:57:41 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 1/9] ALSA: mips: hal2: Use devres card management
Date: Sat,  3 Oct 2026 12:57:08 +0200
Message-ID: <20261003105719.1070427-2-tiwai@suse.de>
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

The hal2 driver's remove callback is nothing but a simple
snd_card_free() call, so let's use the devres for managing the card,
for simplifying the handling.

Now the card is created via snd_devm_card_new() that is auto-cleaned
up at probe for errors.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/mips/hal2.c | 30 ++++++++----------------------
 1 file changed, 8 insertions(+), 22 deletions(-)

diff --git a/sound/mips/hal2.c b/sound/mips/hal2.c
index 84f265335cf9..6decbaa5800e 100644
--- a/sound/mips/hal2.c
+++ b/sound/mips/hal2.c
@@ -837,30 +837,24 @@ static int hal2_create(struct snd_card *card, struct snd_hal2 **rchip)
 
 static int hal2_probe(struct platform_device *pdev)
 {
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_free) = NULL;
 	struct snd_hal2 *chip;
 	int err;
 
-	err = snd_card_new(&pdev->dev, index, id, THIS_MODULE, 0, &card);
+	err = snd_devm_card_new(&pdev->dev, index, id, THIS_MODULE, 0, &card);
 	if (err < 0)
 		return err;
 
 	err = hal2_create(card, &chip);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 
 	err = hal2_pcm_create(chip);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 	err = hal2_mixer_create(chip);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 
 	strscpy(card->driver, "SGI HAL2 Audio");
 	strscpy(card->shortname, "SGI HAL2 Audio");
@@ -869,24 +863,16 @@ static int hal2_probe(struct platform_device *pdev)
 		SGI_HPCDMA_IRQ);
 
 	err = snd_card_register(card);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
+
 	platform_set_drvdata(pdev, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	return 0;
 }
 
-static void hal2_remove(struct platform_device *pdev)
-{
-	struct snd_card *card = platform_get_drvdata(pdev);
-
-	snd_card_free(card);
-}
-
 static struct platform_driver hal2_driver = {
 	.probe	= hal2_probe,
-	.remove = hal2_remove,
 	.driver = {
 		.name	= "sgihal2",
 	}
-- 
2.55.0

