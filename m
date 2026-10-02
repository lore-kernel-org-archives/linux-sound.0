Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF9A46A60D
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 08:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790931354; cv=none; b=UQFj+Gs12lU7PdYFS+InG/YJLQ/MkYYLZ6OJXqUT4pHjqGLjOzLHUFkxyY0tbTB3nuqdT8RQttdsIIS62iu1gcNJE6/nrfYG/so18IdbFxUUFG3eadl9gorh7UHUBq2xztULjFznImiKGMB9jdYLzo+qQSymrLPldVh3ImRLzoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790931354; c=relaxed/simple;
	bh=KBOMy2+YfdmOEy10tE9RE85N3vjajemdzeeePR3k8MA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VRlchowpLg55Je7uXsJfNfmXjm/17ujnjYgbgN9pnTHZFJV/kvE5d3ItE2xk1RNcPLsNrrhlhIIpAxOHCuqkQSKJ4LEDjHE27nbLOyVBlzvHx5xMQ4lqmZxZ4alSLr60rhvRYtzYJ+kx6BxEliG76DnbAe82e+i7lCEi3wP/Mnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dMOYzlt4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Z+vAwvL9; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ekYS1oGI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pT7eYqJz; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dMOYzlt4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Z+vAwvL9";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ekYS1oGI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pT7eYqJz"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1283121F3C;
	Fri,  2 Oct 2026 08:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931347; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kAoo2fu1aEJ4Gv4ftlFnp9R/yvJPSOtLkijthKlJkoE=;
	b=dMOYzlt4JwHR1LDnTebn/qpDCeZs3N3v+BPILK4NJumoknbY/liIeba3ubiW+brZkZ3Y95
	Y85oOHlBHVbWw89d++TL6KPBMhUAaGkjeQvOcOB1UK6y4PgwJcIFp4zpFyYgrWgAV7hn3z
	UAlq9/HFdrvYjfO5aXns3O98qOVV7D0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931347;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kAoo2fu1aEJ4Gv4ftlFnp9R/yvJPSOtLkijthKlJkoE=;
	b=Z+vAwvL9z8F3M9UFRSz2fannH9SSiz7U7qZ4tF4yDHS0JrZrUorJ57Eu49r1Co0Wfq6ojP
	74/LjiQfxLFrkHDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931343; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kAoo2fu1aEJ4Gv4ftlFnp9R/yvJPSOtLkijthKlJkoE=;
	b=ekYS1oGI5WO1WKlzx3Iyzx6nPRR3/ffVr58QJgSqFNQhsAs+ylOP0Feg6Pdbdwn+U9WU80
	2hlO2x5VPyokWpw8sUYWYzfc4q1Qv6HPGOzUunRk1MALWGNbWIlQI3pBHrUhjPonuEthcn
	yVcOe9IekP6gyx85t1+8n7tFkeCA11g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931343;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kAoo2fu1aEJ4Gv4ftlFnp9R/yvJPSOtLkijthKlJkoE=;
	b=pT7eYqJzW8YglcRFxSWfqAWzIXKqAK+DpERXj9Z6r8MrfIJ/nyYlpgxf1yj94OhpVKBZlB
	m97if404KDjn07AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D61CF13C13;
	Fri,  2 Oct 2026 08:55:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HfPyB31xv2ppWAAAD6G6ig:T25
	(envelope-from <tiwai@suse.de>); Fri, 02 Oct 2026 08:55:28 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 24/32] ALSA: riptide: Use auto-cleanup for probe card error handling
Date: Fri,  2 Oct 2026 10:55:02 +0200
Message-ID: <20261002085517.693510-25-tiwai@suse.de>
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
	BAYES_HAM(-3.00)[99.99%];
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
 sound/pci/riptide/riptide.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/sound/pci/riptide/riptide.c b/sound/pci/riptide/riptide.c
index 99c00e46ce23..04cd2cef152c 100644
--- a/sound/pci/riptide/riptide.c
+++ b/sound/pci/riptide/riptide.c
@@ -2020,10 +2020,10 @@ static void snd_riptide_joystick_remove(struct pci_dev *pci)
 #endif
 
 static int
-__snd_card_riptide_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
+snd_card_riptide_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 {
 	static int dev;
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_free) = NULL;
 	struct snd_riptide *chip;
 	unsigned short val;
 	int err;
@@ -2117,16 +2117,11 @@ __snd_card_riptide_probe(struct pci_dev *pci, const struct pci_device_id *pci_id
 	if (err < 0)
 		return err;
 	pci_set_drvdata(pci, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	dev++;
 	return 0;
 }
 
-static int
-snd_card_riptide_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
-{
-	return snd_card_free_on_error(&pci->dev, __snd_card_riptide_probe(pci, pci_id));
-}
-
 static struct pci_driver driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_riptide_ids,
-- 
2.55.0

