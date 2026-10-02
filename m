Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC914E3229
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 15:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790953681; cv=none; b=sD3OFo1fMc1+q2uHkWdlKPJxgO/lqPN0xUfTUrL0i/3vLhoa6gisKw0S/Bh/3kwvKLfWpoeqdERnDeuFzZZ4jyIH+tTKUEfm/TX9iyHI3mm0NkiQtiEgRqJ665+RdvvfBRf0Mr0mlhzGDeAjEi0970ETbmOhRjccxKyN5Lst9wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790953681; c=relaxed/simple;
	bh=Mf8TLKZOqdl7J52UN1wXSu24j8PSiGzCtJAP2holzME=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qV9+H+dSdK6ke8eo1dgdK45PKXTxFvh4nUXIaO0NYefN7cj3IFdhPRUCXAWW9cMu4RPxDmvYVoh/GxYji8uyL4pCjHw7aJ8+Fhvc70SIrjn7QkdFvGGu5R1lhdhJZc0lP/+qVkG8FobjDvURdFSAvdAy2EowUnXRPcigG0wz13M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FxYpBOZS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RyRa6keS; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rn+34I7z; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LnxLnSnr; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FxYpBOZS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RyRa6keS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rn+34I7z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LnxLnSnr"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D424821EE8;
	Fri,  2 Oct 2026 15:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790953671; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HgKcW/qcO6x1tbpP1QpM/oqP4iK5WAEY4pWeypnb1Qo=;
	b=FxYpBOZSzv+cEY/DnnSeQqBF+UHotVXWJcxWMrJBeXFjmqh5HhTp3Kqn7qFPINi1kGwBS1
	QRDx/MvtCqOGk0QpE2/zGTwqB7GnZPYliK85wh25QMQ/1cgEE89hENKZqeTiDQDmyuXS4Z
	PPTMdQ4+9F1v/mJN42jeFU+0r12H41k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790953671;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HgKcW/qcO6x1tbpP1QpM/oqP4iK5WAEY4pWeypnb1Qo=;
	b=RyRa6keS4uHCkOEUxWVh5OXAzime+129q+xtQdD6tE/SqfFJRZzbKPV+dEM2ELG1smMr2N
	u+SqMFKTh6qcowAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790953666; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HgKcW/qcO6x1tbpP1QpM/oqP4iK5WAEY4pWeypnb1Qo=;
	b=rn+34I7zbD3REpjVgB480nHAOlV7IhN5FN5SuUHYF8xFahh41CUtyDc7dF0IaBy9OXTukl
	oJxwYrVVfFJgVQF89B7IoQ6ttCExaU0NJOWtNu1tuMkw+O+rn7ZTnbvK6qNUyaGOTC8WJC
	0ibu7VYCIlYBdgy/jm1gmcEUzUlBVRg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790953666;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HgKcW/qcO6x1tbpP1QpM/oqP4iK5WAEY4pWeypnb1Qo=;
	b=LnxLnSnrto9InW8eQYK6ujkYWdJKtzlq7heLKKDnpchc31EX7cV17nLqfDDQw+KJ7E4HJk
	dtMG1A3jiEtUkxDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CE2D1139E2;
	Fri,  2 Oct 2026 15:07:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id bn6aIrnIv2qpZwAAD6G6ig:T10
	(envelope-from <tiwai@suse.de>); Fri, 02 Oct 2026 15:07:38 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 9/9] ALSA: rme9652: Avoid manual calls of snd_card_free() at probe card error handling
Date: Fri,  2 Oct 2026 17:07:31 +0200
Message-ID: <20261002150733.880051-10-tiwai@suse.de>
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

Instead of the manual calls of snd_card_free() at probe error
handling, use the auto-cleanup feature.

Merely a code cleanup, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/rme9652/rme9652.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/pci/rme9652/rme9652.c b/sound/pci/rme9652/rme9652.c
index 3be30cb57a2e..46ed6b7a2c53 100644
--- a/sound/pci/rme9652/rme9652.c
+++ b/sound/pci/rme9652/rme9652.c
@@ -2472,7 +2472,7 @@ static int snd_rme9652_probe(struct pci_dev *pci,
 {
 	static int dev;
 	struct snd_rme9652 *rme9652;
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_free) = NULL;
 	int err;
 
 	if (dev >= SNDRV_CARDS)
@@ -2494,7 +2494,7 @@ static int snd_rme9652_probe(struct pci_dev *pci,
 	rme9652->pci = pci;
 	err = snd_rme9652_create(card, rme9652, precise_ptr[dev]);
 	if (err)
-		goto error;
+		return err;
 
 	strscpy(card->shortname, rme9652->card_name);
 
@@ -2502,14 +2502,11 @@ static int snd_rme9652_probe(struct pci_dev *pci,
 		card->shortname, rme9652->port, rme9652->irq);
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
 
 static struct pci_driver rme9652_driver = {
-- 
2.55.0

