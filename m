Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D6C44F548
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 08:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790931338; cv=none; b=cDEm9sk30ZCIefdX+Wg4Edv69bInZozdouSJ1zrdLda1XZnraTl1EAVCIZBzT9qgJTDJ0NhcZ3HlHmY38njSUpAdZDq+9L63FDW6KyTptDiEN7JsXwnDC2MEnJcaVMj/XVdHFqss2dlg+WFJuXrFAcIbzt46kxqCsSEfA8nwNlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790931338; c=relaxed/simple;
	bh=XVf3HZqN1omuv1QTyc6WuhlDcFf/dJFtJF9OobkWeJI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R4xDUPlHFvaeeyAm+ouVrEM+QRZyLEb5J7N4uQ8QrkT8NPqFxpS5fijiprDDAVgClrHa0iaBndcCT7yUJ070QHLTMvh72FV2OQIkSSmzUZbdHay9gSODGYfoUBhlgVA4Oo2c5B6cXY7hxwFOftQ65gDNVC3ppcsxFGNMzStoc+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bMzbq8CD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=d7xbsLHW; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gy4sLd3L; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KuqIgIdh; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bMzbq8CD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="d7xbsLHW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gy4sLd3L";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KuqIgIdh"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8E9C721F6A;
	Fri,  2 Oct 2026 08:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931330; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WIV23DR6yXhDtnBp5e6GM0Ae+sO8GMI3/CD2GOtS7Us=;
	b=bMzbq8CDwY/ZOGpVwuYaNwZ7lAuduT/9dcyiAt6g44cX4Wa/J90cg8QZiqRpzZmpApxlDG
	9wNF6KD6bI8Ufs7f0izuxHe8nq4EPlcEYZj3wG3xCFuttywIHnT1ot7Pf1QptKKGmIoMvQ
	TzgKd6POWVamGBsIW9XH4fyReOdIOsU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931330;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WIV23DR6yXhDtnBp5e6GM0Ae+sO8GMI3/CD2GOtS7Us=;
	b=d7xbsLHWAm6nlOvL8ahAD9APGJzQOmbFO5GFiMQmtWql31Qi0Kc1cGhHI0+pckvL20JBmh
	W9TprioeBPMGMXBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931326; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WIV23DR6yXhDtnBp5e6GM0Ae+sO8GMI3/CD2GOtS7Us=;
	b=gy4sLd3LWuo2o7vk1iNYQw75dKI95ggU6DS512XnEN9ML3djvTi/cWp6SuabJ0pRKB+K0c
	m4hbzyiYdQMehlLdTDLGyt7h0LhF2ShRdjnYiFiZ7kfS4VBNFlXqwaI3e6IYt/ftPRt8qW
	0NjvQsFSmLvmf7NwySDaiC0EqbRDA+k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931326;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WIV23DR6yXhDtnBp5e6GM0Ae+sO8GMI3/CD2GOtS7Us=;
	b=KuqIgIdhE/0j0MZpHU+QTACVMVpDs2oK1mlZsBy/L60PF35sibFfXABXQSg5WYnHJ3ERSX
	7datzZeANytDl0Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id ED80013C01;
	Fri,  2 Oct 2026 08:55:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HfPyB31xv2ppWAAAD6G6ig:T6
	(envelope-from <tiwai@suse.de>); Fri, 02 Oct 2026 08:55:25 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 05/32] ALSA: als4000: Use auto-cleanup for probe card error handling
Date: Fri,  2 Oct 2026 10:54:43 +0200
Message-ID: <20261002085517.693510-6-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
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
 sound/pci/als4000.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/pci/als4000.c b/sound/pci/als4000.c
index 6396aa6c3bf0..12bb868fb9ce 100644
--- a/sound/pci/als4000.c
+++ b/sound/pci/als4000.c
@@ -798,11 +798,11 @@ static void snd_card_als4000_free( struct snd_card *card )
 	snd_als4000_free_gameport(acard);
 }
 
-static int __snd_card_als4000_probe(struct pci_dev *pci,
-				    const struct pci_device_id *pci_id)
+static int snd_card_als4000_probe(struct pci_dev *pci,
+				  const struct pci_device_id *pci_id)
 {
 	static int dev;
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_free) = NULL;
 	struct snd_card_als4000 *acard;
 	unsigned long iobase;
 	struct snd_sb *chip;
@@ -918,16 +918,11 @@ static int __snd_card_als4000_probe(struct pci_dev *pci,
 		return err;
 
 	pci_set_drvdata(pci, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	dev++;
 	return 0;
 }
 
-static int snd_card_als4000_probe(struct pci_dev *pci,
-				  const struct pci_device_id *pci_id)
-{
-	return snd_card_free_on_error(&pci->dev, __snd_card_als4000_probe(pci, pci_id));
-}
-
 static int snd_als4000_suspend(struct device *dev)
 {
 	struct snd_card *card = dev_get_drvdata(dev);
-- 
2.55.0

