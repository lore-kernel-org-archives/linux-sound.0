Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2170C418A2D
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 08:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790931357; cv=none; b=qEXNEZAerEhqtKZVW8sbW11TNmxesEPoYk4sTgxLj41Z1Twv9wIwMSyc+OG68iDfRQSNyVX4wD0WfvGik/hJ1lPVLkGdZEbsTZdBZRrN7mC8eOIybVGmm/o+LrLhWG1Do0OcAZaskhstHd613ReeUcdKEZ0UsUdmVLZuQXj9Who=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790931357; c=relaxed/simple;
	bh=I3FlzfhirJt0dA659n35PUDC33o/7iYxX21k1znBD9I=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fhjK7gHNNvTBgNK9ugdGchnf5Z1ojYedgojl9hVfkEqyr4NoJzfslLSPZMnuztsjf+dI/bcgWwjwyCmSkLJYlgCqjFC4iuL1zDwJWLAeICFqFSvoZPZelFQw1ZKnH6PQIoEaZNFkXA/20M9aMs+enTcXfljJaM0LVsl2+Zn1pU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZdJY6Xw4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IyzWLx2H; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SBbdWKxx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZRsr4z8W; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZdJY6Xw4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IyzWLx2H";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SBbdWKxx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZRsr4z8W"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9435F21FA3;
	Fri,  2 Oct 2026 08:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931347; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D+yuUJf0jcrKTvFUxsSOqGd4KL/AmS+ku332Av7+els=;
	b=ZdJY6Xw4ArBICa7HttaEN1Ugqwcp5KixOg4g2JZDlPrwwLac2tTg1fC3XhgB56/EaZK2n8
	opykO21y2Fg2og3/b4fYy9+Ib4chJjt/EBDiyuwuJsOHAkweSnxhDD80Q20E/q54vGZdNV
	0Dd7s+S8toLMy+rylFea3qqgtw6QGiA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931347;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D+yuUJf0jcrKTvFUxsSOqGd4KL/AmS+ku332Av7+els=;
	b=IyzWLx2HCYBz5uKVWrzFZWQlLFNnnli1jqJqNWozulWKDx+2IwbBZQLO0PcF3JGF07YwUl
	XqDRCgQFsJgkC5BA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=SBbdWKxx;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ZRsr4z8W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931343; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D+yuUJf0jcrKTvFUxsSOqGd4KL/AmS+ku332Av7+els=;
	b=SBbdWKxxHSEzKJ/Kcm6l9MiUilp9wGGQB1VeRlFkZPynVNZf6t61smB9hydDwtyYAJxQz4
	hJ40x4vT5pp5o5X8ZiR5KMVbFFK0r+QLfYSBRCQ8yTpAeUY3b3+a6k5qL3rVMyqDYfMCJq
	+bzoRzdtdaqJtjFZjEF7rmYNVIVjcdE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931343;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D+yuUJf0jcrKTvFUxsSOqGd4KL/AmS+ku332Av7+els=;
	b=ZRsr4z8WxqBmR7utlnc0YKpdfpjZN1EgY/z5KoEylPRKbo1F16AqS0BN8WQFmK+cZzri16
	1EGQTgXmnhhCi6DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AD79D13C19;
	Fri,  2 Oct 2026 08:55:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HfPyB31xv2ppWAAAD6G6ig:T31
	(envelope-from <tiwai@suse.de>); Fri, 02 Oct 2026 08:55:29 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 30/32] ALSA: ymfpci: Use auto-cleanup for probe card error handling
Date: Fri,  2 Oct 2026 10:55:08 +0200
Message-ID: <20261002085517.693510-31-tiwai@suse.de>
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
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 9435F21FA3
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Instead of the manual call of snd_card_free_on_error(), use the
auto-cleanup feature.

Merely a code cleanup, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ymfpci/ymfpci.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/pci/ymfpci/ymfpci.c b/sound/pci/ymfpci/ymfpci.c
index d3fb047c9a45..5e8c7e318138 100644
--- a/sound/pci/ymfpci/ymfpci.c
+++ b/sound/pci/ymfpci/ymfpci.c
@@ -152,11 +152,11 @@ static inline int snd_ymfpci_create_gameport(struct snd_ymfpci *chip, int dev, i
 void snd_ymfpci_free_gameport(struct snd_ymfpci *chip) { }
 #endif /* SUPPORT_JOYSTICK */
 
-static int __snd_card_ymfpci_probe(struct pci_dev *pci,
-				   const struct pci_device_id *pci_id)
+static int snd_card_ymfpci_probe(struct pci_dev *pci,
+				 const struct pci_device_id *pci_id)
 {
 	static int dev;
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_free) = NULL;
 	struct resource *fm_res = NULL;
 	struct resource *mpu_res = NULL;
 	struct snd_ymfpci *chip;
@@ -344,16 +344,11 @@ static int __snd_card_ymfpci_probe(struct pci_dev *pci,
 		return err;
 
 	pci_set_drvdata(pci, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	dev++;
 	return 0;
 }
 
-static int snd_card_ymfpci_probe(struct pci_dev *pci,
-				 const struct pci_device_id *pci_id)
-{
-	return snd_card_free_on_error(&pci->dev, __snd_card_ymfpci_probe(pci, pci_id));
-}
-
 static struct pci_driver ymfpci_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_ymfpci_ids,
-- 
2.55.0

