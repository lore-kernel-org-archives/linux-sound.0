Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6389A45D926
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 08:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790931349; cv=none; b=ni7MZwOOc86h3D4R06x5YQ9JykFRv+9O2bx/QEVF4DxN9v92P6aVIPxSHvD2AkchW4sJIIBtt1SkPSONtA+cUshlIEZQ6aJ/VccN+WALYJZxw33XXsLKcaXi2ON+M28MvJiatzvq5Jt6rpoGDaQ+MNYT6uEcCt9PnFaIxuN09Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790931349; c=relaxed/simple;
	bh=7GIzwhqaSnwL1r3GUfKOO3nnaCCcoGdRoqA8vf93yuI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GiUUHhSSLdtGft4Tl7qtip81cECa7Nf3TWrxICJvckkEPNzYDfI6vdGZtNkwJRvIad+tdHUNXCTeAyx+Tyn9lSO9TnT8LbSE9tppYHDmG8OLef0wvRJxmqt5/S4vpY8JG4DvrA6A/6/XtfNtaE/rTVWdJZ3IIZlK2bDpvlwddxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=k/bsNGfi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=A6RA0wrn; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=a4YKaXO6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=05zvq0a3; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="k/bsNGfi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="A6RA0wrn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="a4YKaXO6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="05zvq0a3"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 11C0521F98;
	Fri,  2 Oct 2026 08:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931339; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o/bLUVAQanubUUneAUiz6Ddnqt2r3ZjpyrVrdakcAUM=;
	b=k/bsNGfiihf5miCkkgv7dqx+h+O+Pt86HA6JflqfkbZpZ2Q48Z2v9D7p+qqauFcT1iDpCq
	lj1PYvdsZ5k88AZhq2Y/I13yAI/mE1zJpmUUPBILodb6JldCGMY865Z+C2x3SLsGgyxN41
	675k1k66d1E2l47PPzA1xYDSYF+LLnU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931339;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o/bLUVAQanubUUneAUiz6Ddnqt2r3ZjpyrVrdakcAUM=;
	b=A6RA0wrnKYOqrvtNU617iys3zfzd+gPxPPhdJvMFx/DNtMK8nGV3Fxk+pRkZ6acuFQp1Br
	jY+n49jRFN7TGMBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931335; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o/bLUVAQanubUUneAUiz6Ddnqt2r3ZjpyrVrdakcAUM=;
	b=a4YKaXO63FW7V46MKixxjS0hys0M22e6AFgR7o3HCbBueOebp/QRqPp95zgUqi+RuwkZ+x
	bqNsaKemIby0aqDOLfom7dtdJ2w9Oq9posCusMtQCRQZTqs7rLpkhSHkklBZ8q+VvfMNZk
	VJ+l/YfoY0b0Gkeu8l3szNTi2KXCmew=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931335;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o/bLUVAQanubUUneAUiz6Ddnqt2r3ZjpyrVrdakcAUM=;
	b=05zvq0a3n32BUBkPzJmeR/GvHz5dMZfLqVsQIUbHpPE6YxE/t8OYv3phYmQu07rq6lubWc
	BwH08+8djuRjiHAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5E4FB13C0A;
	Fri,  2 Oct 2026 08:55:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HfPyB31xv2ppWAAAD6G6ig:T16
	(envelope-from <tiwai@suse.de>); Fri, 02 Oct 2026 08:55:27 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 15/32] ALSA: ens137x: Use auto-cleanup for probe card error handling
Date: Fri,  2 Oct 2026 10:54:53 +0200
Message-ID: <20261002085517.693510-16-tiwai@suse.de>
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
 sound/pci/ens1370.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/pci/ens1370.c b/sound/pci/ens1370.c
index 0b9eb55a2121..c2af7eab633c 100644
--- a/sound/pci/ens1370.c
+++ b/sound/pci/ens1370.c
@@ -2267,11 +2267,11 @@ static irqreturn_t snd_audiopci_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static int __snd_audiopci_probe(struct pci_dev *pci,
-				const struct pci_device_id *pci_id)
+static int snd_audiopci_probe(struct pci_dev *pci,
+			      const struct pci_device_id *pci_id)
 {
 	static int dev;
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_free) = NULL;
 	struct ensoniq *ensoniq;
 	int err;
 
@@ -2328,16 +2328,11 @@ static int __snd_audiopci_probe(struct pci_dev *pci,
 		return err;
 
 	pci_set_drvdata(pci, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	dev++;
 	return 0;
 }
 
-static int snd_audiopci_probe(struct pci_dev *pci,
-			      const struct pci_device_id *pci_id)
-{
-	return snd_card_free_on_error(&pci->dev, __snd_audiopci_probe(pci, pci_id));
-}
-
 static struct pci_driver ens137x_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_audiopci_ids,
-- 
2.55.0

