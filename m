Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB7A2DECB4
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142377; cv=none; b=TpyjJeIXJ2CTOMh0YwKj7MohU/E/DPBuu//ojEszU25g9sh9lBwiMn9jJ8DJsfjT0uBS+mC8BEHfQZj/Hlc+ULzQSb58UHLsARgjNtALnmxdiVBSftHAt//CKBTkiLG5X8qIyQLZ8xvtgg5yBZwoFQdYfBG2354ZRkUq54j+tJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142377; c=relaxed/simple;
	bh=HN6foJvz5+zod8q1bHEu9r4r8Fr7UihDNFaP3N7u19A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bCG8dWvb3SYFArS9GDgRGopHMnxPnHkEFAd/eAa/K5n2t4E2o3YlEdtriOhu1ld9tGGvZtIA/uMZ4eqvWqCbN8QyNy8bmtWKpVUiAcT0Tc/laSDa4g19KW1E4nr4AVsDYM3h3GtCADATYeUdCeZa71iMhfhrpgb2B5/MZtdGcKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gyPLhr+9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Rx/L+WLJ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gyPLhr+9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Rx/L+WLJ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gyPLhr+9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Rx/L+WLJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gyPLhr+9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Rx/L+WLJ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6FB34211BF;
	Thu, 10 Jul 2025 10:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142068; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eqih4YIRmgE1LiJ1eFrhCIbQeZTm69wyyB7+/brClfg=;
	b=gyPLhr+9A1jcUX83s/IlAUKjLaz2I/SxSNJ4aKT3ciaAWesr53Dm0uwS9Y/qlH8w36Nc6P
	1IkqNlB6/hi+TBhRT3GT9w0sNxN/BjXD/ipHWakQbgAJTc/ldtBY5XCxZDxyzVg0rqSicd
	CufCW1DMP1mRpZ/C+KRiXSli+OAWOII=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142068;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eqih4YIRmgE1LiJ1eFrhCIbQeZTm69wyyB7+/brClfg=;
	b=Rx/L+WLJ8O3c4ynvPonQ/Zwry+qa+sicSjsCjIFdnc5hRzr0qYm+4ubkjrOf6SInoBDK7u
	w4gya/aFqD6gb2AA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142068; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eqih4YIRmgE1LiJ1eFrhCIbQeZTm69wyyB7+/brClfg=;
	b=gyPLhr+9A1jcUX83s/IlAUKjLaz2I/SxSNJ4aKT3ciaAWesr53Dm0uwS9Y/qlH8w36Nc6P
	1IkqNlB6/hi+TBhRT3GT9w0sNxN/BjXD/ipHWakQbgAJTc/ldtBY5XCxZDxyzVg0rqSicd
	CufCW1DMP1mRpZ/C+KRiXSli+OAWOII=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142068;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eqih4YIRmgE1LiJ1eFrhCIbQeZTm69wyyB7+/brClfg=;
	b=Rx/L+WLJ8O3c4ynvPonQ/Zwry+qa+sicSjsCjIFdnc5hRzr0qYm+4ubkjrOf6SInoBDK7u
	w4gya/aFqD6gb2AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 57181136DC;
	Thu, 10 Jul 2025 10:07:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uP4bFPSQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:48 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 086/103] ALSA: via82xx: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:07:08 +0200
Message-ID: <20250710100727.22653-87-tiwai@suse.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250710100727.22653-1-tiwai@suse.de>
References: <20250710100727.22653-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLsqo7dymd5dgmoaprf5rep8is)];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

Use a safer function strscpy() instead of strcpy() for copying to
arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/via82xx.c       | 20 ++++++++++----------
 sound/pci/via82xx_modem.c |  4 ++--
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/sound/pci/via82xx.c b/sound/pci/via82xx.c
index a04dbc0a420f..0753c0c73f51 100644
--- a/sound/pci/via82xx.c
+++ b/sound/pci/via82xx.c
@@ -1436,7 +1436,7 @@ static int snd_via8233_pcm_new(struct via82xx *chip)
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &snd_via8233_playback_ops);
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &snd_via8233_capture_ops);
 	pcm->private_data = chip;
-	strcpy(pcm->name, chip->card->shortname);
+	strscpy(pcm->name, chip->card->shortname);
 	chip->pcms[0] = pcm;
 	/* set up playbacks */
 	for (i = 0; i < 4; i++)
@@ -1461,7 +1461,7 @@ static int snd_via8233_pcm_new(struct via82xx *chip)
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &snd_via8233_multi_ops);
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &snd_via8233_capture_ops);
 	pcm->private_data = chip;
-	strcpy(pcm->name, chip->card->shortname);
+	strscpy(pcm->name, chip->card->shortname);
 	chip->pcms[1] = pcm;
 	/* set up playback */
 	init_viadev(chip, chip->multi_devno, VIA_REG_MULTPLAY_STATUS, 4, 0);
@@ -1504,7 +1504,7 @@ static int snd_via8233a_pcm_new(struct via82xx *chip)
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &snd_via8233_multi_ops);
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &snd_via8233_capture_ops);
 	pcm->private_data = chip;
-	strcpy(pcm->name, chip->card->shortname);
+	strscpy(pcm->name, chip->card->shortname);
 	chip->pcms[0] = pcm;
 	/* set up playback */
 	init_viadev(chip, chip->multi_devno, VIA_REG_MULTPLAY_STATUS, 4, 0);
@@ -1532,7 +1532,7 @@ static int snd_via8233a_pcm_new(struct via82xx *chip)
 		return err;
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &snd_via8233_playback_ops);
 	pcm->private_data = chip;
-	strcpy(pcm->name, chip->card->shortname);
+	strscpy(pcm->name, chip->card->shortname);
 	chip->pcms[1] = pcm;
 	/* set up playback */
 	init_viadev(chip, chip->playback_devno, 0x30, 3, 0);
@@ -1562,7 +1562,7 @@ static int snd_via686_pcm_new(struct via82xx *chip)
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &snd_via686_playback_ops);
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &snd_via686_capture_ops);
 	pcm->private_data = chip;
-	strcpy(pcm->name, chip->card->shortname);
+	strscpy(pcm->name, chip->card->shortname);
 	chip->pcms[0] = pcm;
 	init_viadev(chip, 0, VIA_REG_PLAYBACK_STATUS, 0, 0);
 	init_viadev(chip, 1, VIA_REG_CAPTURE_STATUS, 0, 1);
@@ -2461,7 +2461,7 @@ static int __snd_via82xx_probe(struct pci_dev *pci,
 	card_type = pci_id->driver_data;
 	switch (card_type) {
 	case TYPE_CARD_VIA686:
-		strcpy(card->driver, "VIA686A");
+		strscpy(card->driver, "VIA686A");
 		sprintf(card->shortname, "VIA 82C686A/B rev%x", pci->revision);
 		chip_type = TYPE_VIA686;
 		break;
@@ -2471,7 +2471,7 @@ static int __snd_via82xx_probe(struct pci_dev *pci,
 		for (i = 0; i < ARRAY_SIZE(via823x_cards); i++) {
 			if (pci->revision == via823x_cards[i].revision) {
 				chip_type = via823x_cards[i].type;
-				strcpy(card->shortname, via823x_cards[i].name);
+				strscpy(card->shortname, via823x_cards[i].name);
 				break;
 			}
 		}
@@ -2487,11 +2487,11 @@ static int __snd_via82xx_probe(struct pci_dev *pci,
 				chip_type = TYPE_VIA8233;
 		}
 		if (chip_type == TYPE_VIA8233A)
-			strcpy(card->driver, "VIA8233A");
+			strscpy(card->driver, "VIA8233A");
 		else if (pci->revision >= VIA_REV_8237)
-			strcpy(card->driver, "VIA8237"); /* no slog assignment */
+			strscpy(card->driver, "VIA8237"); /* no slog assignment */
 		else
-			strcpy(card->driver, "VIA8233");
+			strscpy(card->driver, "VIA8233");
 		break;
 	default:
 		dev_err(card->dev, "invalid card type %d\n", card_type);
diff --git a/sound/pci/via82xx_modem.c b/sound/pci/via82xx_modem.c
index eef0f9ddaae0..12a8c620724d 100644
--- a/sound/pci/via82xx_modem.c
+++ b/sound/pci/via82xx_modem.c
@@ -842,7 +842,7 @@ static int snd_via686_pcm_new(struct via82xx_modem *chip)
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &snd_via686_capture_ops);
 	pcm->dev_class = SNDRV_PCM_CLASS_MODEM;
 	pcm->private_data = chip;
-	strcpy(pcm->name, chip->card->shortname);
+	strscpy(pcm->name, chip->card->shortname);
 	chip->pcms[0] = pcm;
 	init_viadev(chip, 0, VIA_REG_MO_STATUS, 0);
 	init_viadev(chip, 1, VIA_REG_MI_STATUS, 1);
@@ -1116,7 +1116,7 @@ static int __snd_via82xx_probe(struct pci_dev *pci,
 	card_type = pci_id->driver_data;
 	switch (card_type) {
 	case TYPE_CARD_VIA82XX_MODEM:
-		strcpy(card->driver, "VIA82XX-MODEM");
+		strscpy(card->driver, "VIA82XX-MODEM");
 		sprintf(card->shortname, "VIA 82XX modem");
 		break;
 	default:
-- 
2.50.0

