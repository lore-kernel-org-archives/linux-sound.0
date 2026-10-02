Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA78146A5E6
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 08:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790931354; cv=none; b=N9NGsemWZ4wdjfubGQsKXKv7zLY1pQVH6jDXjs+mPwFx1IKPxDEv6q5KWsbo+Ppxf4P9DvnuZ5XTBSVkZtZWJjRNFnnRVTqQYX2mEsIwjPa9vzcvwcePaWrs6tdi3QJb2JIjqJzejxjI2HBU449UJ8U7J8kjLFgQtsbzFzOWKe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790931354; c=relaxed/simple;
	bh=mjKhW3/k+b37t5GWfe2yU+GFRyj51k/Aj9PxfY4EAG0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iwZmk7k0H3UMMAMqj65wNZj3kTVlyOHPgUd3TC3c7uzIH6fQazAaIY/Kg4nQiFx7VzriOEVrN2o1xRFXZx7PG3T+AKOJvnBtx3cKNVMCLEYghtYLGMDIMyzQEchVzWZB4mL0IUYUNcx5cnyEPK82zMaEJPYIAqqZvWthpNQVs64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=x06s82DZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=o7sewpyA; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dVGE+y+l; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6Rmn/2o3; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="x06s82DZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="o7sewpyA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dVGE+y+l";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6Rmn/2o3"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CE39E21E78;
	Fri,  2 Oct 2026 08:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931347; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=63blL9FiJwkZXCPDQVAFCKVwbb5LDyjuAAq5y7nGaK4=;
	b=x06s82DZ40901nKNp7/hHGRDYthpYl0hJ6koipbgiwmLhxzQNhRM9MTuOxznNmz+ILIwsG
	JBIrb4l2FR4penUpybS+XPdJ/8Tspd9uJPv9dczta3qe6aZOQX/4sEqDQicanbyF5nuWhs
	2JY7X5T+FFbCAW2gr4igOl9CZl+ITy8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931347;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=63blL9FiJwkZXCPDQVAFCKVwbb5LDyjuAAq5y7nGaK4=;
	b=o7sewpyAjJCPZdSoP9b6A0j1Bdtc5QSDK4TR/lLGV7n3gaQgseXZFnSg5MH7kTe43jiJ7a
	zh5/nijTsmIk+QAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931342; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=63blL9FiJwkZXCPDQVAFCKVwbb5LDyjuAAq5y7nGaK4=;
	b=dVGE+y+l5TIOz5OJ77UF66o9sxiTU1oNzdOBvM/SRmJxCx41QZcp1yeGA+dx75iItyCB3Y
	dw4i5eyDwjXVmGCHbLh3lLqkkE+gWSEgNOP+0yjbXsEIr1S/vCP3zpfLBkWhxMwNHIwgWU
	p2WJZMblpzgOcCTt2+5LCQpy09X6Fvw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931342;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=63blL9FiJwkZXCPDQVAFCKVwbb5LDyjuAAq5y7nGaK4=;
	b=6Rmn/2o3VpAbZRgNoAPmhcIRliOchwLUAKuinT3SSIeK+b/xjkHsirKE/f2oEIHnpT4QVW
	PPAcoDpZLxKRwWDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 488A413C10;
	Fri,  2 Oct 2026 08:55:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HfPyB31xv2ppWAAAD6G6ig:T22
	(envelope-from <tiwai@suse.de>); Fri, 02 Oct 2026 08:55:28 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 21/32] ALSA: lola: Use auto-cleanup for probe card error handling
Date: Fri,  2 Oct 2026 10:54:59 +0200
Message-ID: <20261002085517.693510-22-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
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

Instead of the manual call of snd_card_free_on_error(), use the
auto-cleanup feature.

Merely a code cleanup, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/lola/lola.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/pci/lola/lola.c b/sound/pci/lola/lola.c
index 34a3ba17deb4..1f7ffca57fc9 100644
--- a/sound/pci/lola/lola.c
+++ b/sound/pci/lola/lola.c
@@ -641,11 +641,11 @@ static int lola_create(struct snd_card *card, struct pci_dev *pci, int dev)
 	return 0;
 }
 
-static int __lola_probe(struct pci_dev *pci,
-			const struct pci_device_id *pci_id)
+static int lola_probe(struct pci_dev *pci,
+		      const struct pci_device_id *pci_id)
 {
 	static int dev;
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_free) = NULL;
 	struct lola *chip;
 	int err;
 
@@ -687,16 +687,11 @@ static int __lola_probe(struct pci_dev *pci,
 		return err;
 
 	pci_set_drvdata(pci, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	dev++;
 	return 0;
 }
 
-static int lola_probe(struct pci_dev *pci,
-		      const struct pci_device_id *pci_id)
-{
-	return snd_card_free_on_error(&pci->dev, __lola_probe(pci, pci_id));
-}
-
 /* PCI IDs */
 static const struct pci_device_id lola_ids[] = {
 	{ PCI_VDEVICE(DIGIGRAM, 0x0001) },
-- 
2.55.0

