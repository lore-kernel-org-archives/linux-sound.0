Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10CD469855
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 08:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790931354; cv=none; b=IUyX2CKhLD2/49y467JaLUEliyfGZz0SvMgjtEQ7CZE6i5SCtJJDmQrcMnp2CNpNLWVHck6Wxw99IKyDeIK+oL/gemWTMPPGxPXAPQyQt2PekXg3VsIc11TVG1kIV6FDU1u3hdgEEaYfleNTDeGMGZ/6F6QwxfAVQBjopIFkXoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790931354; c=relaxed/simple;
	bh=rXwnoC21Qe02xa5dR3nMKaRr1aPwcTwFT6d8OIgu8jQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hTSDXckfkdz+k9CBppFmS4Npx7/j735CJ8VyfxJN4R91o96T+K0NEPrKw9NiTfnmKlil/zvYY6XWNr0HT+RKVzP/f1C9YLEWrKQCQH45gSLMAIpDRbLkacAuNXFmetGiLB82WhbKpBTZwe/FkQwqhKoiS5IjrSph3KFg6btb0cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TQVnk/OM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zEjg+tCF; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Nh/sqZkV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3ze027pF; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TQVnk/OM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zEjg+tCF";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Nh/sqZkV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3ze027pF"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E141621F22;
	Fri,  2 Oct 2026 08:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931347; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JfHVHMGD3dCnS1Dqg6FOLqjbdwlawUrvuF1EVkqis9Q=;
	b=TQVnk/OMdzd5azqHBkNUA0nTc0IdUfWDLbYguulCK0sng1ULcBwcuTFXJ2KMcyju4Wmbo7
	Hj+899qAeAwR0ANFgULg7KetL0KnrPVw8FXynEQsFdVNog/zudZd6xwzqao2uLUjkX08cx
	gXWeJCxSS6JvrV7q0+mchuD0dmlBFJ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931347;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JfHVHMGD3dCnS1Dqg6FOLqjbdwlawUrvuF1EVkqis9Q=;
	b=zEjg+tCFmU7AzP93dCZ14BTA0ZTBQKkaghM20ZRYww3LTHqoPVLNLFbHUzKp0/cVz9r+RM
	iIpifV9JQQ+MW1CQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931342; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JfHVHMGD3dCnS1Dqg6FOLqjbdwlawUrvuF1EVkqis9Q=;
	b=Nh/sqZkVj5XYulg4+WGsd6+IbEWsV0jR7BGwI2Z2Ui8qpD5ZX74JS1vnrOz+w6ENdHb0Gu
	dkG2wH1bgahoi5E5vgaGpORfMpxD7xRLojME2zw7tuiiy5aggnm7SsK8lOm5dDV81wxND1
	/2a+EgtcG5RFzuf5EQ/NtVBbaY4HghE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931342;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JfHVHMGD3dCnS1Dqg6FOLqjbdwlawUrvuF1EVkqis9Q=;
	b=3ze027pFpQ9l7ZuTehQI93UmOZiNYdSnxURwgwyP1yrJyPnHcE2oNB30CHllhRbDdhDlux
	55c/o1GuzZ97qyCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 725B913C11;
	Fri,  2 Oct 2026 08:55:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HfPyB31xv2ppWAAAD6G6ig:T23
	(envelope-from <tiwai@suse.de>); Fri, 02 Oct 2026 08:55:28 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 22/32] ALSA: maestro3: Use auto-cleanup for probe card error handling
Date: Fri,  2 Oct 2026 10:55:00 +0200
Message-ID: <20261002085517.693510-23-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002085517.693510-1-tiwai@suse.de>
References: <20261002085517.693510-1-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
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

Instead of the manual call of snd_card_free_on_error(), use the
auto-cleanup feature.

Merely a code cleanup, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/maestro3.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/sound/pci/maestro3.c b/sound/pci/maestro3.c
index dd45ffa171e1..2114f9f16a34 100644
--- a/sound/pci/maestro3.c
+++ b/sound/pci/maestro3.c
@@ -2629,10 +2629,10 @@ snd_m3_create(struct snd_card *card, struct pci_dev *pci,
 /*
  */
 static int
-__snd_m3_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
+snd_m3_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 {
 	static int dev;
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_free) = NULL;
 	struct snd_m3 *chip;
 	int err;
 
@@ -2690,16 +2690,11 @@ __snd_m3_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 #endif
 
 	pci_set_drvdata(pci, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	dev++;
 	return 0;
 }
 
-static int
-snd_m3_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
-{
-	return snd_card_free_on_error(&pci->dev, __snd_m3_probe(pci, pci_id));
-}
-
 static struct pci_driver m3_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_m3_ids,
-- 
2.55.0

