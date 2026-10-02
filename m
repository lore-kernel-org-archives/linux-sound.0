Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63945468C0C
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 08:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790931349; cv=none; b=GIh8pp0vPb6KW7D/Me/r5c6XMTp62JDFTnUss1UD91M7C5QBXKuEgZwb2Sg45smCecxPGIxcbxtd7wIgwsox6KMeIQHeKf2Yoa/TugOXfru9H+pZ5qlrY9ee4OrLQ5j1yyYCWPsnimGGo1ozKjVkNnUSjNqmwQ70aWRHnxOyKe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790931349; c=relaxed/simple;
	bh=MIo2wtlsJU8tpSFJdALX7IGQxp7F8g97zlkimbvgEN0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rZl8EPxxaUrkj2uGKNuvddDy43jfav5Gk+Is5/g3koTrgr4t0vMgxnD5/njCgCea+my6IgkKLEnKo8nJRnIDal8aL5GinvMO5spd7x6WIPqrSxVAf8V/lNzx/OLUpigN/cGm41Bury/AoyI2OUNbm7gBjkgTJU2nhfwBVPxSPCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lIuoK6IT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lZFma2UO; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sGiLiuhj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GMt5Wf03; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lIuoK6IT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lZFma2UO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sGiLiuhj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GMt5Wf03"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1064F21F97;
	Fri,  2 Oct 2026 08:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931339; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2sR5CoHQW56jD+0bdFqVnWcY72BMPJWQ45A8tLux+AY=;
	b=lIuoK6ITDWxh+cq2CfEiHZ+xehBIDAsy1wruj57bXTJlpIAZZOkCu3fB/g51Q99hqmpJAJ
	KtdzJTQlOcDE4BQFBWWowS7sgJGFC6kts6S0nJxuHwipTrbdCFQw2dSATXrUyQIkjxGCCz
	sOOUwFucl5rtz801RbG6/1AjnpcBkB4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931339;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2sR5CoHQW56jD+0bdFqVnWcY72BMPJWQ45A8tLux+AY=;
	b=lZFma2UOtY92TQiT1pPxo/RxnyxSIt5eu6VJSpb4wIlOuqiBdxaX6Cur01r3z4GTRCiZVa
	XTTfvvsDUuMCVrAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931335; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2sR5CoHQW56jD+0bdFqVnWcY72BMPJWQ45A8tLux+AY=;
	b=sGiLiuhjWrfl8Ncn8FRVR4nQarzy2raMDMvzvBixGg4BvfWs//qptKiStOwj6GaQ2L/nqy
	kglxKpo7h22Sh9cERyqHLWt7E6NkOBt2el48rwNFSAimjLtw8IxbRq0oHt7h9P2QShvLic
	WuypvrarOEWWApBVgfLGhhqNhaC84Ic=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931335;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2sR5CoHQW56jD+0bdFqVnWcY72BMPJWQ45A8tLux+AY=;
	b=GMt5Wf03c4G4K1bSqmZ9FcI6Lj84epIVPuu6i4S6ZUxttvC/U3aohiTigBabVsDhyj66JO
	8w48w7HGyyvFazAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 40CCE13C09;
	Fri,  2 Oct 2026 08:55:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HfPyB31xv2ppWAAAD6G6ig:T15
	(envelope-from <tiwai@suse.de>); Fri, 02 Oct 2026 08:55:27 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 14/32] ALSA: emu10k1x: Use auto-cleanup for probe card error handling
Date: Fri,  2 Oct 2026 10:54:52 +0200
Message-ID: <20261002085517.693510-15-tiwai@suse.de>
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
 sound/pci/emu10k1/emu10k1x.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/pci/emu10k1/emu10k1x.c b/sound/pci/emu10k1/emu10k1x.c
index ed4630c8342b..03d277dd02d9 100644
--- a/sound/pci/emu10k1/emu10k1x.c
+++ b/sound/pci/emu10k1/emu10k1x.c
@@ -1447,11 +1447,11 @@ static int snd_emu10k1x_midi(struct emu10k1x *emu)
 	return 0;
 }
 
-static int __snd_emu10k1x_probe(struct pci_dev *pci,
-				const struct pci_device_id *pci_id)
+static int snd_emu10k1x_probe(struct pci_dev *pci,
+			      const struct pci_device_id *pci_id)
 {
 	static int dev;
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_free) = NULL;
 	struct emu10k1x *chip;
 	int err;
 
@@ -1506,16 +1506,11 @@ static int __snd_emu10k1x_probe(struct pci_dev *pci,
 		return err;
 
 	pci_set_drvdata(pci, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	dev++;
 	return 0;
 }
 
-static int snd_emu10k1x_probe(struct pci_dev *pci,
-			      const struct pci_device_id *pci_id)
-{
-	return snd_card_free_on_error(&pci->dev, __snd_emu10k1x_probe(pci, pci_id));
-}
-
 // PCI IDs
 static const struct pci_device_id snd_emu10k1x_ids[] = {
 	{ PCI_VDEVICE(CREATIVE, 0x0006) },	/* Dell OEM version (EMU10K1) */
-- 
2.55.0

