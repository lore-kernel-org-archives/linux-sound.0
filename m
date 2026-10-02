Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6154E0B79
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 15:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790953680; cv=none; b=mC3qNeBfSCppqwFvvx3AEzkAkJArmHMPCJwKsIApr4SbzfTS8g0a+yZWA/kmJEuLi4dY48XcLOtrgt2a16t36XtxTCCJdwTNx9Z+Goyo9l/nn5n45/+tSbqjbgd8US7ADGPHn976oFVleEsE0S1o1zO15zPB7Z3y9GmLY+laJpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790953680; c=relaxed/simple;
	bh=Vp7jZ8Dh4njsS714+jf3Nq9+M4uMKNJ8C0wyKoZFkq4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NG09Iwk2HKjPfe/2gf5U8H+w4xej5OrGheQDO12ofrvYi84m5GMdb089N7KgAv9w/sOIGVKDfPJ95S0Iym/l2rThIRAHXo8hL21K4q+jzqagZ3LOz6gznGt9pvjJOmKt5c5/l6m84RWK1Mu43x9UQo6oXthit3gz4HEIQvvlRdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jgce3CoI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZSUaQZ1W; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ies9WVl8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=F5U2nkeQ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jgce3CoI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZSUaQZ1W";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ies9WVl8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="F5U2nkeQ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 89BD41FE50;
	Fri,  2 Oct 2026 15:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790953670; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bjq7lGiSSYzphTxkyq8rsSTp2MtYzjj29ydmJgI+M6E=;
	b=jgce3CoIKH0+2+gjeRR3NsnwtJ8bShkRmpGrtgrw2J6qPBc8cpVS0gJu268khD1G6ebWw+
	TnzvJFCBbpl90wFxGXhIIcjFYKMTwoi6Y5DehtQSg5nlt/zjBqvfWHxhKfqcdyou9xPHij
	9Dp4XY5vZe+xDSiUjnstB/ycGFpLJsc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790953670;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bjq7lGiSSYzphTxkyq8rsSTp2MtYzjj29ydmJgI+M6E=;
	b=ZSUaQZ1W0c2g+f8tZoYC+DyfEEgt2jU3hpBHJCuKJatMPfSy0Cbh1zZlCTjDHUvsRhoIMI
	jDz1KZoHc/Cy3FDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790953666; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bjq7lGiSSYzphTxkyq8rsSTp2MtYzjj29ydmJgI+M6E=;
	b=ies9WVl8gMEiteW7Akg9Zu5nNUOonCKBPy+eT5Af95HAeiNaAff6AYyo8L1wpp6d2WlwrR
	a3I60uCWAlFJ3NZPU9pvLUkcWukHGOMowzP/c30DrLzFA2nkgBgDHN+DubPHVPonnB6EcY
	uPAE8sOmqZOuhXanLkBCySGEM7PjbyA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790953666;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bjq7lGiSSYzphTxkyq8rsSTp2MtYzjj29ydmJgI+M6E=;
	b=F5U2nkeQBQWjuDz/CV3jq2/j8v79WlZX4g2PWW/5/dkB5Kz4PzWH+b/d7e/Tr59ShuxF6C
	viL5MAHulCJQWMCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 77B40139DC;
	Fri,  2 Oct 2026 15:07:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id bn6aIrnIv2qpZwAAD6G6ig:T7
	(envelope-from <tiwai@suse.de>); Fri, 02 Oct 2026 15:07:38 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 6/9] ALSA: lx6464es: Avoid manual calls of snd_card_free() at probe card error handling
Date: Fri,  2 Oct 2026 17:07:28 +0200
Message-ID: <20261002150733.880051-7-tiwai@suse.de>
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

Instead of the manual calls of snd_card_free() at probe error
handling, use the auto-cleanup feature.

Merely a code cleanup, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/lx6464es/lx6464es.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/pci/lx6464es/lx6464es.c b/sound/pci/lx6464es/lx6464es.c
index 3b40ec071379..881f462fa929 100644
--- a/sound/pci/lx6464es/lx6464es.c
+++ b/sound/pci/lx6464es/lx6464es.c
@@ -981,7 +981,7 @@ static int snd_lx6464es_probe(struct pci_dev *pci,
 			      const struct pci_device_id *pci_id)
 {
 	static int dev;
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_free) = NULL;
 	struct lx6464es *chip;
 	int err;
 
@@ -1003,7 +1003,7 @@ static int snd_lx6464es_probe(struct pci_dev *pci,
 	err = snd_lx6464es_create(card, pci);
 	if (err < 0) {
 		dev_err(card->dev, "error during snd_lx6464es_create\n");
-		goto error;
+		return err;
 	}
 
 	strscpy(card->driver, "LX6464ES");
@@ -1020,16 +1020,13 @@ static int snd_lx6464es_probe(struct pci_dev *pci,
 
 	err = snd_card_register(card);
 	if (err < 0)
-		goto error;
+		return err;
 
 	dev_dbg(chip->card->dev, "initialization successful\n");
 	pci_set_drvdata(pci, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	dev++;
 	return 0;
-
- error:
-	snd_card_free(card);
-	return err;
 }
 
 static struct pci_driver lx6464es_driver = {
-- 
2.55.0

