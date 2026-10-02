Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3733C4DEC19
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 15:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790953681; cv=none; b=uk69aPJydEN7mAwp1gdSnLdBMH/ifbldJVC+Y2v8SE5Y4IcePpW4zB681gmgVaW0gjSF7FgnkAgXRx9TUvSRvPLU4/lTgXTXqF0Nza5Css3Xe9eMPT9wjtS8X0TXVW8vmSCIiFgJ7nFwWi3aGT/tsPlIF491FppZgVHclgHm8y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790953681; c=relaxed/simple;
	bh=F5q2WU959sekkVVgPVfjsGN1HSXULRzFPJvKTw6nf+0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cyYUz1W3jRvndf/LUPWrJyOJQyFzA8FxJ6TkdWJnIUd5n6LkEr6Bggq0dJZEDoWAOAnTO2o0esYehI3+cV+llK5nWC6cMYVSGb5GTXjtTl11AhR0UnorQ90udaio72onn7qd1dCh35KV4Olk730KXVxqnornVrO2p6Szh/ULBmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fKFDMywT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8VN5xIpR; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nUYqNRkq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nxbsdXXG; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fKFDMywT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8VN5xIpR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nUYqNRkq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nxbsdXXG"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BE01621E57;
	Fri,  2 Oct 2026 15:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790953670; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4glquKbRKKYBowL33mxK0WdZMpJZekC8gzNO5tqUULQ=;
	b=fKFDMywTRC9YAY1yaYaPycvuilHDpBocv+mgjXvXvm3Khlvh8DlJI7yEQjHKv3pJHP/Uje
	gzzK96PwTeqaL2/t6Vpl6upwj9fsZ+cfqBJqoPOZPmAVKT3xok7Yoy4KPJ+IQjDt4KdPzw
	RZgkBhFR4ZbNiUc07a/bY9Uikh83Xr8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790953670;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4glquKbRKKYBowL33mxK0WdZMpJZekC8gzNO5tqUULQ=;
	b=8VN5xIpRWxNcshm+WkEFKb+zaE3+KNUw6CIckf9DVHcSj2G56GVUHbiW1T6Sbq7JCnVHW0
	KWq+U1GRd70AtmAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=nUYqNRkq;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=nxbsdXXG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790953666; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4glquKbRKKYBowL33mxK0WdZMpJZekC8gzNO5tqUULQ=;
	b=nUYqNRkqymiJvGWbBLGeFcGSOdxOcR9wEvFMTY6uhK2MP/q2z4krN2VlukKJwFMl5KvTyf
	m1i1L9oh3RBP3UcACw8skvJ9Zpo2rpF9tyUPF7XGlDuNHC7ALwELQ1VjhMuI/UVtfYEvc2
	V/xRUa6Av3mTDRjqWvL7DbV7IpH54dQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790953666;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4glquKbRKKYBowL33mxK0WdZMpJZekC8gzNO5tqUULQ=;
	b=nxbsdXXGE4cUKOc4szz2JcMXbSSSPMJ80AyoZrQTez+oH6yOIrcnlLqnQ799UJfKxf3k+l
	lB6y9zLe0jb19ABg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B1EBD139E0;
	Fri,  2 Oct 2026 15:07:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id bn6aIrnIv2qpZwAAD6G6ig:T9
	(envelope-from <tiwai@suse.de>); Fri, 02 Oct 2026 15:07:38 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 8/9] ALSA: hdspm: Avoid manual calls of snd_card_free() at probe card error handling
Date: Fri,  2 Oct 2026 17:07:30 +0200
Message-ID: <20261002150733.880051-9-tiwai@suse.de>
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
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: BE01621E57
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:email,suse.de:dkim];
	RCVD_TLS_ALL(0.00)[];
	URIBL_BLOCKED(0.00)[suse.de:mid,suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 

Instead of the manual calls of snd_card_free() at probe error
handling, use the auto-cleanup feature.

Merely a code cleanup, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/rme9652/hdspm.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/pci/rme9652/hdspm.c b/sound/pci/rme9652/hdspm.c
index 95fd82bb1c6d..cc4cf43e5a5b 100644
--- a/sound/pci/rme9652/hdspm.c
+++ b/sound/pci/rme9652/hdspm.c
@@ -6796,7 +6796,7 @@ static int snd_hdspm_probe(struct pci_dev *pci,
 {
 	static int dev;
 	struct hdspm *hdspm;
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_free) = NULL;
 	int err;
 
 	if (dev >= SNDRV_CARDS)
@@ -6818,7 +6818,7 @@ static int snd_hdspm_probe(struct pci_dev *pci,
 
 	err = snd_hdspm_create(card, hdspm);
 	if (err < 0)
-		goto error;
+		return err;
 
 	if (hdspm->io_type != MADIface) {
 		snprintf(card->shortname, sizeof(card->shortname), "%s_%x",
@@ -6837,16 +6837,12 @@ static int snd_hdspm_probe(struct pci_dev *pci,
 
 	err = snd_card_register(card);
 	if (err < 0)
-		goto error;
+		return err;
 
 	pci_set_drvdata(pci, card);
-
+	card = NULL; /* probe succeeded, don't release as error */
 	dev++;
 	return 0;
-
- error:
-	snd_card_free(card);
-	return err;
 }
 
 static struct pci_driver hdspm_driver = {
-- 
2.55.0

