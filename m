Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5738844AB84
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 08:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790931337; cv=none; b=qBnFbTnGuetuYKXvL1lrTPapitdlM0VcH3OiFAdMNtiN7MktEUJab9xrQCp5lT0UuIcY2ETc9SKsz1NYw/Tm9zDjayjCeRTlHose63UZ/U5SROvHi0YeP1MrdK5y14jmo3TdgH5xMyqxuvI99ADV2YSZgbpbNnRnRdZM+93C7gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790931337; c=relaxed/simple;
	bh=7O+/zKTFDjdbkqZKaRExhsrn6ZD5sBzsG21OuDWWyjI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H+STowqFI81pE2CsQ6V8GCkZvDyDuQEhLc7wFVUzTQG39YqDTT2N9QYRFDOkGYe3rHl3uEEE9qJfQ5MUW9L1hg7qjrOqiXz7dfwiLWeDwxOvtLPpwYuMUSOqWBT98kzO9oFWgmrv/c7s64xUO4coe7EFjMD36eZ5zp+rQKsRwEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nxaVVp3b; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ArJ6OLUQ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XT4hqtOL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XLiwvKRD; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nxaVVp3b";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ArJ6OLUQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XT4hqtOL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XLiwvKRD"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2EE6D21F2D;
	Fri,  2 Oct 2026 08:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931330; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8XJ+00F7DvHQNpUvF4Ec2NHJThDJLK4NNVHNCi4wbAk=;
	b=nxaVVp3b8VSPAABeeVxNpYRKC8yiTwLRpryTXzn8A6gwdiEGByg+y9+4Rg4JCfGXH0vSF6
	4c8BpOQUKnSeO3B7IwDp3LaxNwG5YLmMyN9jlkB7asiwT3flx8vaLvXPbupjeSpwlAoBnO
	jli7Q5jyviChoke+fken/QaqRvHhdE4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931330;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8XJ+00F7DvHQNpUvF4Ec2NHJThDJLK4NNVHNCi4wbAk=;
	b=ArJ6OLUQ3ABUUju+Wr94L1MBLXIqqJx1yfj0wEEwwIvqIwzU0opWfFBjLSHjVOqrZlETKt
	C+FXotLVHlefi1CQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=XT4hqtOL;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=XLiwvKRD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931326; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8XJ+00F7DvHQNpUvF4Ec2NHJThDJLK4NNVHNCi4wbAk=;
	b=XT4hqtOLm35XSsksiZ8IthFDDJAP3RkC0HgghL8Zxxo09zX6wcLQNKcSV7Ifzl1+uEVSo2
	D2ADzH7LgL5/G50odN0hYdY70KnufuYvzS334XiCDxSVmdVr0GRf7BS8l0QiRwFMC37qR7
	qM4j0YZgBUwF92F43QZz/jTdPahLCts=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931326;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8XJ+00F7DvHQNpUvF4Ec2NHJThDJLK4NNVHNCi4wbAk=;
	b=XLiwvKRDsEU75TUKGXzRm6HFVa8QCgIMu6+MkOhwwQOEUsxVut/08oMTieKjT8uDQGaApY
	1yc3U+n+zA6L5QCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B0FB413BFF;
	Fri,  2 Oct 2026 08:55:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HfPyB31xv2ppWAAAD6G6ig:T4
	(envelope-from <tiwai@suse.de>); Fri, 02 Oct 2026 08:55:25 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 03/32] ALSA: ad1889: Use auto-cleanup for probe card error handling
Date: Fri,  2 Oct 2026 10:54:41 +0200
Message-ID: <20261002085517.693510-4-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:email,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 2EE6D21F2D
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Instead of the manual call of snd_card_free_on_error(), use the
auto-cleanup feature.

Merely a code cleanup, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ad1889.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/pci/ad1889.c b/sound/pci/ad1889.c
index f4ec404c0d15..42a8fa3f4fdc 100644
--- a/sound/pci/ad1889.c
+++ b/sound/pci/ad1889.c
@@ -837,12 +837,12 @@ snd_ad1889_create(struct snd_card *card, struct pci_dev *pci)
 }
 
 static int
-__snd_ad1889_probe(struct pci_dev *pci,
-		   const struct pci_device_id *pci_id)
+snd_ad1889_probe(struct pci_dev *pci,
+		 const struct pci_device_id *pci_id)
 {
 	int err;
 	static int devno;
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_free) = NULL;
 	struct snd_ad1889 *chip;
 
 	/* (1) */
@@ -892,17 +892,12 @@ __snd_ad1889_probe(struct pci_dev *pci,
 
 	/* (7) */
 	pci_set_drvdata(pci, card);
+	card = NULL; /* probe succeeded, don't release as error */
 
 	devno++;
 	return 0;
 }
 
-static int snd_ad1889_probe(struct pci_dev *pci,
-			    const struct pci_device_id *pci_id)
-{
-	return snd_card_free_on_error(&pci->dev, __snd_ad1889_probe(pci, pci_id));
-}
-
 static const struct pci_device_id snd_ad1889_ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_ANALOG_DEVICES, PCI_DEVICE_ID_AD1889JS) },
 	{ 0, },
-- 
2.55.0

