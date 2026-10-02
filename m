Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66D6468C0C
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 08:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790931355; cv=none; b=ZlUfLqiFiYkVHpMvXVtR82J4PJK0iP2bPhgELakauk9kFciHJ3IWrXZIsnJtOci6Mxk5V3qRwafQJg3F9bdy6IF8j/JrifpaREB38Wv5TMDPwGd0aTN4OsmBxAN3ZxUbOO0aPlL7+AmOoLCAWoC6qbEF8K6gqknPcU4DhPTjAPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790931355; c=relaxed/simple;
	bh=5htnvBiShcymA5648PZR/WHNYGUAEjqEcMziSW/Okic=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gE+BhwNci8rs5Hpf14Un9pPV6v+IBIzCdLdqBJT41hod0QW0hYR449lNVyLd+MYPbk2WybEFqGfGWnmHhG3bNgGA3xbA0p1NF05eDX/0l3HlCwKoTAYahflzFPS4OcNuHW2AsIjOVVM9j05wJYylgjG00gymOHzIlznSLjA5OCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=szw3iHLi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0900w8q1; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MqXlK8RN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LNCYgNH6; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="szw3iHLi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0900w8q1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MqXlK8RN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LNCYgNH6"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7BAF11FE58;
	Fri,  2 Oct 2026 08:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931347; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A8LMA/RXWOypzCR4DehlYaYdcu1VWiJ8S2jInKvGrJY=;
	b=szw3iHLid2wbk0+Pi0BmM0Z9xaljazgQHYeflVgJ1Q6p0sWbVFk5oninnGlGIAk9x3Gid2
	GwGMfMeUCufMOjjEPhL2v11IqLOfn1bpoJKn7cubmz1sK/iV5a3mdMyB+Br+EfnUjJzy1S
	VUhcDzhGgIMOyaPe5ReMMRg2n2/lCj0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931347;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A8LMA/RXWOypzCR4DehlYaYdcu1VWiJ8S2jInKvGrJY=;
	b=0900w8q1c1vhoz0/Wb7PTaUha9qkZ6iLuFvDdHNVFMxScgAuIt4O+bkQlIFTI2+ld9i/k3
	Grno25cB9PEww0Dg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931343; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A8LMA/RXWOypzCR4DehlYaYdcu1VWiJ8S2jInKvGrJY=;
	b=MqXlK8RNn79UU3op5I8fQdvfzhRtjfUSw+qfvzX17TxtYFXBQOsysIgeNE1yi95/OTwUiX
	DUDOEsTRVSGRNBsqGSx9bk9JpPP66J3Fs5+XJUmXkOjPTgeLs7nXGTQNeV0zbxptg50LD1
	esSfiVhP5zP4qvqQGd+kzHUCiqDSWL4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931343;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A8LMA/RXWOypzCR4DehlYaYdcu1VWiJ8S2jInKvGrJY=;
	b=LNCYgNH6EHEWblBk6giBm8eA7KYQ9sdEprxaVZu4B5lte/GjSLOWlN3ggE7LFVuVodN7W7
	fLE/wQAuGKbrpEDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8EFFD13C18;
	Fri,  2 Oct 2026 08:55:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HfPyB31xv2ppWAAAD6G6ig:T30
	(envelope-from <tiwai@suse.de>); Fri, 02 Oct 2026 08:55:29 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 29/32] ALSA: via82xx: Use auto-cleanup for probe card error handling
Date: Fri,  2 Oct 2026 10:55:07 +0200
Message-ID: <20261002085517.693510-30-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
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
 sound/pci/via82xx.c       | 13 ++++---------
 sound/pci/via82xx_modem.c | 13 ++++---------
 2 files changed, 8 insertions(+), 18 deletions(-)

diff --git a/sound/pci/via82xx.c b/sound/pci/via82xx.c
index 24ee1302f27d..018e1aaccc04 100644
--- a/sound/pci/via82xx.c
+++ b/sound/pci/via82xx.c
@@ -2435,10 +2435,10 @@ static int check_dxs_list(struct pci_dev *pci, int revision)
 	return VIA_DXS_48K;
 };
 
-static int __snd_via82xx_probe(struct pci_dev *pci,
-			       const struct pci_device_id *pci_id)
+static int snd_via82xx_probe(struct pci_dev *pci,
+			     const struct pci_device_id *pci_id)
 {
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_free) = NULL;
 	struct via82xx *chip;
 	int chip_type = 0, card_type;
 	unsigned int i;
@@ -2543,15 +2543,10 @@ static int __snd_via82xx_probe(struct pci_dev *pci,
 	if (err < 0)
 		return err;
 	pci_set_drvdata(pci, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	return 0;
 }
 
-static int snd_via82xx_probe(struct pci_dev *pci,
-			     const struct pci_device_id *pci_id)
-{
-	return snd_card_free_on_error(&pci->dev, __snd_via82xx_probe(pci, pci_id));
-}
-
 static struct pci_driver via82xx_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_via82xx_ids,
diff --git a/sound/pci/via82xx_modem.c b/sound/pci/via82xx_modem.c
index b32f84ac17cc..7934bc5d6463 100644
--- a/sound/pci/via82xx_modem.c
+++ b/sound/pci/via82xx_modem.c
@@ -1088,10 +1088,10 @@ static int snd_via82xx_create(struct snd_card *card,
 }
 
 
-static int __snd_via82xx_probe(struct pci_dev *pci,
-			       const struct pci_device_id *pci_id)
+static int snd_via82xx_probe(struct pci_dev *pci,
+			     const struct pci_device_id *pci_id)
 {
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_free) = NULL;
 	struct via82xx_modem *chip;
 	int chip_type = 0, card_type;
 	unsigned int i;
@@ -1139,15 +1139,10 @@ static int __snd_via82xx_probe(struct pci_dev *pci,
 	if (err < 0)
 		return err;
 	pci_set_drvdata(pci, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	return 0;
 }
 
-static int snd_via82xx_probe(struct pci_dev *pci,
-			     const struct pci_device_id *pci_id)
-{
-	return snd_card_free_on_error(&pci->dev, __snd_via82xx_probe(pci, pci_id));
-}
-
 static struct pci_driver via82xx_modem_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_via82xx_modem_ids,
-- 
2.55.0

