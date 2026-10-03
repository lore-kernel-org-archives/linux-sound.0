Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4DC41F5D1
	for <linux-sound@vger.kernel.org>; Sat,  3 Oct 2026 10:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791025083; cv=none; b=OzE2h5wMtAdhR5sFw/k6rN8zaU0DYf/bvSd/UThWK+JqYMgQ0Yg+9KrHnh6s1QRpss4/votky69orW05c66hgiFjBM075rXhxU3/5DO/PXGNid3dckENXSa3YXulhepoke8FPlx/CJtDVZwN1OK53tz3rXa5cu+TSqrKT83D/1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791025083; c=relaxed/simple;
	bh=rTVx16sAsk0v/hEwWV+TDpEj+pfJkEf8HcbYZfD8igI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KBFelqKviV/wWEIYcm6niIxH9wBAI2QC1TiU7WSWKOOi0fBgpoz2NoKH+TLlCbfpsG6ncXIVEk5hQLlzFyPaZR+oaeu6S3z2+vM+3QZKJx2CCdxHFmhNlRE7Ddhsb7CHYPSemAfNZnTYaf25XnlRx/dh81YIr4+P/+49jrYR8ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rPQ5RnUN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1beQVtuq; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fLg/5kZj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CWBKDj71; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rPQ5RnUN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1beQVtuq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fLg/5kZj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CWBKDj71"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 700D21FED2;
	Sat,  3 Oct 2026 10:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791025074; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LDGnevIyqOpLjm02MpP6/4/zdSJpoprj+Q9mJMWM5BI=;
	b=rPQ5RnUNHx2HTcAScbX36OaMUNpNAY/DM6U+elwhnJR524wKuQWALUecuUg9sHa5wM7OBL
	PhsiTxYBiVfAri6vSGBobj54xijvosCGJRuaLDawKaqVC+B0GIawBd4oc67UQYg+OjsIge
	A/nVQQxc847fptExUfZG58IbrKO636Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791025074;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LDGnevIyqOpLjm02MpP6/4/zdSJpoprj+Q9mJMWM5BI=;
	b=1beQVtuqRiy9rGP2c8MhTWFGz+aRgUX+3/ciaO1k71ovLyaFFUQPFPF8w2pwpDZEp0e8pT
	0M58JJ4h3gTpz+Dg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791025070; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LDGnevIyqOpLjm02MpP6/4/zdSJpoprj+Q9mJMWM5BI=;
	b=fLg/5kZjWnD24jp6ePhgqB4oGaU0Jun1i/th2v3nwqgd8LUFcvIU7o6P3Y0ooWWCvLFfqr
	uWmswyLU9UPHeLScVosdtzSh9S6hs0T/gltTXJKRYGmdLNkeDuItsaSFolsARndbEDzGg3
	oQV3554p8GEWElGJXRNtJARAeEppbyk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791025070;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LDGnevIyqOpLjm02MpP6/4/zdSJpoprj+Q9mJMWM5BI=;
	b=CWBKDj71C4O9JOqNTzhBSVvNmfri6/elucKRpuPBipY/VY0/HQjK8psZ056cJmYwWE5UJw
	geXlnWqbdgvSqNCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4D88713883;
	Sat,  3 Oct 2026 10:57:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id rc1+HaXfwGosCAAAD6G6ig:T6
	(envelope-from <tiwai@suse.de>); Sat, 03 Oct 2026 10:57:42 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 5/9] ALSA: ctxfi: Use devres card management
Date: Sat,  3 Oct 2026 12:57:12 +0200
Message-ID: <20261003105719.1070427-6-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

The ctxfi driver's remove callback is nothing but a simple
snd_card_free() call, so let's use the devres for managing the card,
for simplifying the handling.

Now the card is created via snd_devm_card_new() that is auto-cleaned
up at probe for errors.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ctxfi/xfi.c | 23 +++++++----------------
 1 file changed, 7 insertions(+), 16 deletions(-)

diff --git a/sound/pci/ctxfi/xfi.c b/sound/pci/ctxfi/xfi.c
index d8dd84d41c87..99319d75e963 100644
--- a/sound/pci/ctxfi/xfi.c
+++ b/sound/pci/ctxfi/xfi.c
@@ -56,7 +56,7 @@ static int
 ct_card_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 {
 	static int dev;
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_free) = NULL;
 	struct ct_atc *atc;
 	int err;
 
@@ -67,8 +67,8 @@ ct_card_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 		dev++;
 		return -ENOENT;
 	}
-	err = snd_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
-			   0, &card);
+	err = snd_devm_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
+				0, &card);
 	if (err)
 		return err;
 	if ((reference_rate != 48000) && (reference_rate != 44100)) {
@@ -89,14 +89,14 @@ ct_card_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 	err = ct_atc_create(card, pci, reference_rate, multiple,
 			    pci_id->driver_data, subsystem[dev], &atc);
 	if (err < 0)
-		goto error;
+		return err;
 
 	card->private_data = atc;
 
 	/* Create alsa devices supported by this card */
 	err = ct_atc_create_alsa_devs(atc);
 	if (err < 0)
-		goto error;
+		return err;
 
 	strscpy(card->driver, "SB-XFi");
 	strscpy(card->shortname, "Creative X-Fi");
@@ -105,21 +105,13 @@ ct_card_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 
 	err = snd_card_register(card);
 	if (err < 0)
-		goto error;
+		return err;
 
 	pci_set_drvdata(pci, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	dev++;
 
 	return 0;
-
-error:
-	snd_card_free(card);
-	return err;
-}
-
-static void ct_card_remove(struct pci_dev *pci)
-{
-	snd_card_free(pci_get_drvdata(pci));
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -149,7 +141,6 @@ static struct pci_driver ct_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = ct_pci_dev_ids,
 	.probe = ct_card_probe,
-	.remove = ct_card_remove,
 	.driver = {
 		.pm = CT_CARD_PM_OPS,
 	},
-- 
2.55.0

