Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5415C41F357
	for <linux-sound@vger.kernel.org>; Sat,  3 Oct 2026 10:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791025076; cv=none; b=UFokeL/4asCrz5tiNtfJrOMsK87jiDanVHBYjWVhktpX0ESYyS/x7yVyghDeNoA+n7zPi3dWBYiGIcSsHllmzra64Ar04ND0KpWDmw8XD7bU8qPoa9iQdWridUE+Tu7Avk3KUaHyfVZjZCjOusGirZLyWMzZsXobRMv/Q0RY7xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791025076; c=relaxed/simple;
	bh=MnahyQsUW4LfKMnwfLNhpu8mNKYyPWG2BBdAkwuSeco=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VHsI+CcgNFxZvLK5Jw6POKB1zX2hcKerQEDM98XfGVyqh3Kqk0Jz3xrCQAIvAL10CV5qfZDrIFwUr2iCr+XDsQ7BoJEDtoYPhOQB7OoMvqWa7+zDqThfXG1tr5WJ71yFLFkvXjnTxtoCdllSnz4Zx9zh9ufT4mWU9RfNawNiB1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DYD+bZrp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8mRacrJx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KiMAE7vw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IkWQwL4f; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DYD+bZrp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8mRacrJx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KiMAE7vw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IkWQwL4f"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 90B4721C20;
	Sat,  3 Oct 2026 10:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791025066; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CV/P78Cwt9CwggBxjQkpLfcz8T6jqM/hKIU6jcwIFHg=;
	b=DYD+bZrpvqQkBCOyoZH+ei0Oi76vRKT/kB5UQvyi4ffYibORjhC/qNyF8yWkmMVv9EboXN
	k/m4P0aMrfNUHeRrRl4c06i21DQYCREGnX84ILH9IrVsHOA6NGcHty5Ot4yusABUfRm/1i
	f6/2/86PQSfIV6X9y787LLD4MoBfxLI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791025066;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CV/P78Cwt9CwggBxjQkpLfcz8T6jqM/hKIU6jcwIFHg=;
	b=8mRacrJxnHzrwKkIC6M1bJJ/UhGzGT1A/dYv5K4oe1eWNM5jHvEZIUcv8ntOmCNlZr9jpx
	a4Lb8sKlFkKFhpCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791025062; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CV/P78Cwt9CwggBxjQkpLfcz8T6jqM/hKIU6jcwIFHg=;
	b=KiMAE7vw4kmKMsRuZ7BUiC93X0ugUIdKfa8Fl5wUWL3EEGwaLxrY6gDWDUhONCI93WJksl
	j17BdTtuhvt1xaXu8fKULld1N/l57qn2f6kBJRENUK5HRuETriAS3zkquTdV6sxSFmaM7s
	+sFXi6XVy/6BCk/vz2QazBIBPjxjjV8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791025062;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CV/P78Cwt9CwggBxjQkpLfcz8T6jqM/hKIU6jcwIFHg=;
	b=IkWQwL4f4QPDz2dIEjil+P5BuIbPuUjo4kDUrjVXrzVKGEHgg78bCUoWiPwjAbYPesJQeb
	w7CoKPSUvw/q+kAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0B28E13876;
	Sat,  3 Oct 2026 10:57:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id rc1+HaXfwGosCAAAD6G6ig:T4
	(envelope-from <tiwai@suse.de>); Sat, 03 Oct 2026 10:57:42 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 3/9] ALSA: mips: n64: Handle card removal properly
Date: Sat,  3 Oct 2026 12:57:10 +0200
Message-ID: <20261003105719.1070427-4-tiwai@suse.de>
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

The remove callback for snd-n64 is completely missing by some reason,
so let's add it for consistency.  Along with it, clean up the error
handling at probe by replacing as well by the devres-managed card
object and auto-cleanup.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/mips/snd-n64.c | 61 ++++++++++++++++++++------------------------
 1 file changed, 28 insertions(+), 33 deletions(-)

diff --git a/sound/mips/snd-n64.c b/sound/mips/snd-n64.c
index f17e63f2ff5a..8cc001c58d5e 100644
--- a/sound/mips/snd-n64.c
+++ b/sound/mips/snd-n64.c
@@ -273,6 +273,15 @@ static const struct snd_pcm_ops n64audio_pcm_ops = {
 	.close =	n64audio_pcm_close,
 };
 
+static void n64audio_free(struct snd_card *card)
+{
+	struct n64audio *priv = card->private_data;
+
+	if (priv->ring_base)
+		dma_free_coherent(card->dev, 32 * 1024, priv->ring_base,
+				  priv->ring_base_dma);
+}
+
 /*
  * The target device is embedded and RAM-constrained. We save RAM
  * by initializing in __init code that gets dropped late in boot.
@@ -280,14 +289,14 @@ static const struct snd_pcm_ops n64audio_pcm_ops = {
  */
 static int __init n64audio_probe(struct platform_device *pdev)
 {
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_free) = NULL;
 	struct snd_pcm *pcm;
 	struct n64audio *priv;
 	int err, irq;
 
-	err = snd_card_new(&pdev->dev, SNDRV_DEFAULT_IDX1,
-			   SNDRV_DEFAULT_STR1,
-			   THIS_MODULE, sizeof(*priv), &card);
+	err = snd_devm_card_new(&pdev->dev, SNDRV_DEFAULT_IDX1,
+				SNDRV_DEFAULT_STR1,
+				THIS_MODULE, sizeof(*priv), &card);
 	if (err < 0)
 		return err;
 
@@ -296,29 +305,24 @@ static int __init n64audio_probe(struct platform_device *pdev)
 	spin_lock_init(&priv->chan.lock);
 
 	priv->card = card;
+	card->private_free = n64audio_free;
 
 	priv->ring_base = dma_alloc_coherent(card->dev, 32 * 1024, &priv->ring_base_dma,
 					     GFP_DMA|GFP_KERNEL);
-	if (!priv->ring_base) {
-		err = -ENOMEM;
-		goto fail_card;
-	}
+	if (!priv->ring_base)
+		return -ENOMEM;
 
 	priv->mi_reg_base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(priv->mi_reg_base)) {
-		err = PTR_ERR(priv->mi_reg_base);
-		goto fail_dma_alloc;
-	}
+	if (IS_ERR(priv->mi_reg_base))
+		return PTR_ERR(priv->mi_reg_base);
 
 	priv->ai_reg_base = devm_platform_ioremap_resource(pdev, 1);
-	if (IS_ERR(priv->ai_reg_base)) {
-		err = PTR_ERR(priv->ai_reg_base);
-		goto fail_dma_alloc;
-	}
+	if (IS_ERR(priv->ai_reg_base))
+		return PTR_ERR(priv->ai_reg_base);
 
 	err = snd_pcm_new(card, "N64 Audio", 0, 1, 0, &pcm);
 	if (err < 0)
-		goto fail_dma_alloc;
+		return err;
 
 	pcm->private_data = priv;
 	strscpy(pcm->name, "N64 Audio");
@@ -331,28 +335,19 @@ static int __init n64audio_probe(struct platform_device *pdev)
 	strscpy(card->longname, "N64 Audio");
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		err = -EINVAL;
-		goto fail_dma_alloc;
-	}
+	if (irq < 0)
+		return -EINVAL;
+
 	if (devm_request_irq(&pdev->dev, irq, n64audio_isr,
-				IRQF_SHARED, "N64 Audio", priv)) {
-		err = -EBUSY;
-		goto fail_dma_alloc;
-	}
+				IRQF_SHARED, "N64 Audio", priv))
+		return -EBUSY;
 
 	err = snd_card_register(card);
 	if (err < 0)
-		goto fail_dma_alloc;
+		return err;
 
+	card = NULL; /* probe succeeded, don't release as error */
 	return 0;
-
-fail_dma_alloc:
-	dma_free_coherent(card->dev, 32 * 1024, priv->ring_base, priv->ring_base_dma);
-
-fail_card:
-	snd_card_free(card);
-	return err;
 }
 
 static struct platform_driver n64audio_driver = {
-- 
2.55.0

