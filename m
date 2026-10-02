Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7884E06F0
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 15:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790953670; cv=none; b=NPVcSZZ4mZ8UhJu4dMfNBSI9SzHJ1z1GvlVBPPsf7sXlH3h5VDSkdMkijtOKr7aEWiWJfssDBYpdF0/EbYutRrHvXzG8G+//huRm4QD3/V33NrcxqRPwb+3txucMnpoVjdOogATBS6RWbY37wWPME3qDeISfh/6hrf2vBw1CfrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790953670; c=relaxed/simple;
	bh=/o1odneHoeO6UADmIJ8IK2403HVDDXCYjRN/Cs1JCQE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hOygibU35f1zcO4jlqKb9GXDrbnT7GcxWsR6xz248d7r5VTWtoK8CQhWK7vqjASKHqL6/jVhfxI58wfjTtzTWOgu5HNQF6Nr+79gzMICw16AjSiUdBllqv1YqNYagAh8wUgNJYtxQj0oIIIA4CxmuzpZVL1SB9cEA+qM6NuM23A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RDTL8pa0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=b8887pvY; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HJdlUYSr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=skDuk39c; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RDTL8pa0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="b8887pvY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HJdlUYSr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="skDuk39c"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 14F951FE57;
	Fri,  2 Oct 2026 15:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790953662; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=79A5ymLTn9DC/EHj/xPsdU9FnHu7rXdezipRxaX3S7U=;
	b=RDTL8pa03pMlaqpHpcdJS1e+glAw1okqmFIkttBw69dro3u+6Kes7KyIqR10sR3A6/+9PH
	CeT+M0ECMJm+ROmDp1W6r4wvDUElYKXA104rf+8+olosgAZiBwPFb6RBfFqZ6cmB8lUs2J
	ML2jrEY/Dd/clzXDPWhqzA6sIBS+MIU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790953662;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=79A5ymLTn9DC/EHj/xPsdU9FnHu7rXdezipRxaX3S7U=;
	b=b8887pvYd28Zn+TXvEeQDFMs2c7Ko1iKjHAQs/v6Mo1wh3Xa6dArKdlvQhxJ1XkMmHTp+9
	6KEf+y4L/U0kk7Aw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790953658; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=79A5ymLTn9DC/EHj/xPsdU9FnHu7rXdezipRxaX3S7U=;
	b=HJdlUYSrIc1/qqwGiXpIW+hfxlxQz8tFYes+TqQseLTf08ALiwfleXsX+jYoodudCzAi4O
	jrIbzS3VvZgCx2/CuVCnjGrfSVIo8jKIJTN1BHvnWTUPU8BdxlBZFGPFSub74/bGUrbeOe
	kQvpgf09CiIlirGTt+klWwITBB2KYvU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790953658;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=79A5ymLTn9DC/EHj/xPsdU9FnHu7rXdezipRxaX3S7U=;
	b=skDuk39cIrcQi6vGd38mYCqZdVhijXxuHRfBa/luzQIUdJ9W3TDns1Yn5PEjIbqzVFMpuo
	rg5URr9HJsocvYBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D40DE139D4;
	Fri,  2 Oct 2026 15:07:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id bn6aIrnIv2qpZwAAD6G6ig:T2
	(envelope-from <tiwai@suse.de>); Fri, 02 Oct 2026 15:07:37 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 1/9] ALSA: als300: Avoid manual calls of snd_card_free() at probe card error handling
Date: Fri,  2 Oct 2026 17:07:23 +0200
Message-ID: <20261002150733.880051-2-tiwai@suse.de>
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

Instead of the manual calls of snd_card_free() at the error handling,
use the auto-cleanup feature.

Merely a code cleanup, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/als300.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/pci/als300.c b/sound/pci/als300.c
index 00f0720169c3..5832f4d38c4e 100644
--- a/sound/pci/als300.c
+++ b/sound/pci/als300.c
@@ -675,7 +675,7 @@ static int snd_als300_probe(struct pci_dev *pci,
                              const struct pci_device_id *pci_id)
 {
 	static int dev;
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_free) = NULL;
 	struct snd_als300 *chip;
 	int err, chip_type;
 
@@ -696,7 +696,7 @@ static int snd_als300_probe(struct pci_dev *pci,
 
 	err = snd_als300_create(card, pci, chip_type);
 	if (err < 0)
-		goto error;
+		return err;
 
 	strscpy(card->driver, "ALS300");
 	if (chip->chip_type == DEVICE_ALS300_PLUS)
@@ -711,15 +711,12 @@ static int snd_als300_probe(struct pci_dev *pci,
 
 	err = snd_card_register(card);
 	if (err < 0)
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
 
 static struct pci_driver als300_driver = {
-- 
2.55.0

