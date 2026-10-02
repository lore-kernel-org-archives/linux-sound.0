Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D754BD7B6
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 15:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790953681; cv=none; b=l/2RofMUVpu2HNjaaoeQKmny2X29ADGgwJ/SjCz3eOcW+6KiyoY/5dED18TcNYWJv3QnoJi2bMEtzfnJoC+3X/6/SPsFi8IcKjTGozl0Cf+KK2kmPaFhj4qIZ3MvVedHpYPQ2qwgnfQ6dmyQJ1LgTTrbtdGbugaeY0LiE5G4ZtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790953681; c=relaxed/simple;
	bh=NZuJH2OSAKnXkLtWzqMiELjZ/ccbTgvPkNuskOUY4qA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N5Q6KT82lmpfcG/WR0t0H6kZ6LjHUsS2BSNFSX9zc0tSRYBsEUDoBFDHYqoFOBdMuOY76QhZvS4P4o+1dgc1zkzvPN5BsSKaGVLmMw5b4rjRoHAYGMmi8AA6azsZ7oNrLkwFPcTevxfg+C8mj00BpFzAG1KfaFaTJWuE9ohLYaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BNrcognY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nVp8KwsG; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FwiOuBrk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+FkeM3OM; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BNrcognY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nVp8KwsG";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FwiOuBrk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+FkeM3OM"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A23CD21E19;
	Fri,  2 Oct 2026 15:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790953670; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=piFmA64ToHppqp4ZvOjHpUQZ5cS1H2XdJxyAab5pEOo=;
	b=BNrcognYfh1zng39jp5X77i/wKwmsQs9p1wDs0lLsAKJqS/qRdfHnpfS9nTbozBhBwt36R
	1SLjHRwL/0NsHldw4GAiA4/CAieavYCzm2HnWp6GRRJVMf0Gv+b6yFPZ7DjmzHjK4r2AD7
	dmV6/UV7j35tJT+PizA4nzk7buUai0s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790953670;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=piFmA64ToHppqp4ZvOjHpUQZ5cS1H2XdJxyAab5pEOo=;
	b=nVp8KwsG3C1JoVJzUAfp1CObXqfwwARQHq5nDUBBOpQ4pJkfLZLQ1Mp36kjmDQEsOXqJ5B
	XDewQmOj1OvOZsAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790953666; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=piFmA64ToHppqp4ZvOjHpUQZ5cS1H2XdJxyAab5pEOo=;
	b=FwiOuBrktxgJgKp7QYhuZKaKTlqi9r/+mnl4hbR+lCkgYPie0/5J9Encq+c4grXMf6VLKD
	wET+/On+yJIP9BD7uygrbDUhwueQeXtcoMybm722nxXYNX4VqziEq/J3SBnU/ot/Huuubc
	qM7mQ2EPmr0WUdGopSZBuOxYQr6ZKQo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790953666;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=piFmA64ToHppqp4ZvOjHpUQZ5cS1H2XdJxyAab5pEOo=;
	b=+FkeM3OMCNOWWfsslZ/ufQY76DcHrOoq0VAvQ4xjyIObl77UZK7HIghXCBV+hA9ivEQq5d
	IJhXQPVrypzKN/DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 951B3139DE;
	Fri,  2 Oct 2026 15:07:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id bn6aIrnIv2qpZwAAD6G6ig:T8
	(envelope-from <tiwai@suse.de>); Fri, 02 Oct 2026 15:07:38 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 7/9] ALSA: hdsp: Avoid manual calls of snd_card_free() at probe card error handling
Date: Fri,  2 Oct 2026 17:07:29 +0200
Message-ID: <20261002150733.880051-8-tiwai@suse.de>
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
 sound/pci/rme9652/hdsp.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/pci/rme9652/hdsp.c b/sound/pci/rme9652/hdsp.c
index 31cc2d91c8d2..87a5844dc75a 100644
--- a/sound/pci/rme9652/hdsp.c
+++ b/sound/pci/rme9652/hdsp.c
@@ -5328,7 +5328,7 @@ static int snd_hdsp_probe(struct pci_dev *pci,
 {
 	static int dev;
 	struct hdsp *hdsp;
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_free) = NULL;
 	int err;
 
 	if (dev >= SNDRV_CARDS)
@@ -5349,21 +5349,18 @@ static int snd_hdsp_probe(struct pci_dev *pci,
 	hdsp->pci = pci;
 	err = snd_hdsp_create(card, hdsp);
 	if (err)
-		goto error;
+		return err;
 
 	strscpy(card->shortname, "Hammerfall DSP");
 	sprintf(card->longname, "%s at 0x%lx, irq %d", hdsp->card_name,
 		hdsp->port, hdsp->irq);
 	err = snd_card_register(card);
 	if (err)
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
 
 static struct pci_driver hdsp_driver = {
-- 
2.55.0

