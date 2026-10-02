Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F390A4E06C5
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 15:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790953670; cv=none; b=PSqB7KhlaSpct0wpEcChDDG1DkZUJBSoUf/4zj8u1NGjttlusNXCLmn9Lm0+GFhoYqf+uADE8u0TcAg7NP/H4VkgH2m9gNDScqE0I6b7IVR9ZvttKEQNHjhXbiv7EKj8i0DSTcNCi9Eqro+xAzvF1rKM4CwWaf1aWdkNNFlLvCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790953670; c=relaxed/simple;
	bh=uqSQ53J2NJDuoAW94WRnDsbx7XyFKUHxBJ1SA7oRUpE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KPLbPcMC2YmlsLkNq8XDaM+MGEo7jo34hYAgwdRv+kKy2DdVe/roqNJs6W78BbP3TaOVL91ODrDpGD197e38wt0CfL3DuJuLPZYPIy6BoekGuK84WVwPAASt0RSkbI1DnHKU2untDKRUph3XGAIPtXygrD2VDmRgoMvo8hJmAX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=H5xcAXwh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8iQPVMjb; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QXcidjRD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OJPM+QZd; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="H5xcAXwh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8iQPVMjb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QXcidjRD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OJPM+QZd"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B62E121EBE;
	Fri,  2 Oct 2026 15:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790953662; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bqnuA4vy340SHTG3rI4oNU6vlCLPneh2eeFeSbuhXi4=;
	b=H5xcAXwhqtNpt+CPoXnJBb0WXbKse5NbcbFEkiEQgnbipQ7Q5MJuUBbaX3n1AkOBAEFy6w
	ywmlplrkkCBTXVsr0jt3XQgaLeIk6FLgvYMFk8fNupr1D8cCnJC+a4RekreWTRwOaxkWHF
	1afFVzAfHWsMml1ZKGPAPbvTS+ZbziA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790953662;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bqnuA4vy340SHTG3rI4oNU6vlCLPneh2eeFeSbuhXi4=;
	b=8iQPVMjbefrMdhWswuBrv8AD8yTK5dZaWCcSUzGWs7Qa7Jz3M4OvRASvRd/McMlfRS84XO
	JipRf81VDfwtFRBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790953658; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bqnuA4vy340SHTG3rI4oNU6vlCLPneh2eeFeSbuhXi4=;
	b=QXcidjRDXoQexfVoAebY2RurhUY4ptBWZBn7BSa5M08tQ9grPiBtlyDcdLODYLNdZkqaJc
	ZukLyRk6PANAlGFMQOvpV+S5E3r8/gnFET6tNAe0+xfRor3/M6pGtmLo5oJGw4Lm/WkEQw
	cdX8+8qVlnK+i9Jv5pyIT9v6YOFogfU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790953658;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bqnuA4vy340SHTG3rI4oNU6vlCLPneh2eeFeSbuhXi4=;
	b=OJPM+QZdlkLWn/6DVtiwIlj/hQbG13bjdNabweTP4oVupVsnCFy1zhoCiHxXK5PkVAov93
	QKS2TGIprR2VJBCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3AE9F139D8;
	Fri,  2 Oct 2026 15:07:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id bn6aIrnIv2qpZwAAD6G6ig:T5
	(envelope-from <tiwai@suse.de>); Fri, 02 Oct 2026 15:07:38 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 4/9] ALSA: cs46xx: Avoid manual calls of snd_card_free() at probe card error handling
Date: Fri,  2 Oct 2026 17:07:26 +0200
Message-ID: <20261002150733.880051-5-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002150733.880051-1-tiwai@suse.de>
References: <20261002150733.880051-1-tiwai@suse.de>
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
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

Instead of the manual calls of snd_card_free() at probe error
handling, use the auto-cleanup feature.

Merely a code cleanup, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/cs46xx/cs46xx.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/sound/pci/cs46xx/cs46xx.c b/sound/pci/cs46xx/cs46xx.c
index 0cb7c2a2929f..a4a0b36290d9 100644
--- a/sound/pci/cs46xx/cs46xx.c
+++ b/sound/pci/cs46xx/cs46xx.c
@@ -55,7 +55,7 @@ static int snd_card_cs46xx_probe(struct pci_dev *pci,
 				 const struct pci_device_id *pci_id)
 {
 	static int dev;
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_free) = NULL;
 	struct snd_cs46xx *chip;
 	int err;
 
@@ -74,36 +74,36 @@ static int snd_card_cs46xx_probe(struct pci_dev *pci,
 	err = snd_cs46xx_create(card, pci,
 				external_amp[dev], thinkpad[dev]);
 	if (err < 0)
-		goto error;
+		return err;
 	card->private_data = chip;
 	chip->accept_valid = mmap_valid[dev];
 	err = snd_cs46xx_pcm(chip, 0);
 	if (err < 0)
-		goto error;
+		return err;
 #ifdef CONFIG_SND_CS46XX_NEW_DSP
 	err = snd_cs46xx_pcm_rear(chip, 1);
 	if (err < 0)
-		goto error;
+		return err;
 	err = snd_cs46xx_pcm_iec958(chip, 2);
 	if (err < 0)
-		goto error;
+		return err;
 #endif
 	err = snd_cs46xx_mixer(chip, 2);
 	if (err < 0)
-		goto error;
+		return err;
 #ifdef CONFIG_SND_CS46XX_NEW_DSP
 	if (chip->nr_ac97_codecs ==2) {
 		err = snd_cs46xx_pcm_center_lfe(chip, 3);
 		if (err < 0)
-			goto error;
+			return err;
 	}
 #endif
 	err = snd_cs46xx_midi(chip, 0);
 	if (err < 0)
-		goto error;
+		return err;
 	err = snd_cs46xx_start_dsp(chip);
 	if (err < 0)
-		goto error;
+		return err;
 
 	snd_cs46xx_gameport(chip);
 
@@ -117,15 +117,12 @@ static int snd_card_cs46xx_probe(struct pci_dev *pci,
 
 	err = snd_card_register(card);
 	if (err < 0)
-		goto error;
+		return err;
 
 	pci_set_drvdata(pci, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	dev++;
 	return 0;
-
- error:
-	snd_card_free(card);
-	return err;
 }
 
 static struct pci_driver cs46xx_driver = {
-- 
2.55.0

