Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5748457E72
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 08:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790931346; cv=none; b=gXaLq9jr8TCt6a0vYskvgyJwQoy94TsniBMjr9CjprBIT4IuDkF+Jwak93lsoFULbkhKlBGnWD3oavUeBHWqA+0DNWYwlEiBW7Nw9i59NsCTP1+jHzzE4WiNNzyBvOvwBrc52XWSLZ+kYjCTgr11e+7kOm1jqd3kTFS95L7ZNX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790931346; c=relaxed/simple;
	bh=umc/6fwhf9XpvVasOBHpcb2QWd9azTneqPUDHvLnue0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ljNYQrysykWBbWhqda1CxEfYYsYcq4STRx99FA1hzBsunJNz9rPv0g992xrnJTStqVU9CS8Adc/iG8Ot2LQkbBeeNRtX3SJh+CBSEly/i43g08HDLr0+G5vlnWDsFrae33LMMWErTv9xxGOpHL/Y/9QJHevCE7kMXEAjQwPrAvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=AcmAuDrJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=y+Bq9yrU; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CG2mjeHV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hGDqWtK5; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AcmAuDrJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="y+Bq9yrU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CG2mjeHV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hGDqWtK5"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8AAF621F28;
	Fri,  2 Oct 2026 08:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931338; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MdC9mN3ikl0hWaCbPvCnmTL0++AEJSTlyooUhKj2S4M=;
	b=AcmAuDrJGaELpviTxpXHMgpLiwNxBR+FqwjKu92DmBGqpBFMYiekowMp4BwYu22weFJhQq
	vdZ8pUiNTP6GvMQDQtVJI29m9ap9rcAUyi2aYY30Z39SK0gY2dj+cisrR/6x5Jk+FLmA69
	2X1oCoGvrlWtFmozDGAm4VLEV+Q8/cU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931338;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MdC9mN3ikl0hWaCbPvCnmTL0++AEJSTlyooUhKj2S4M=;
	b=y+Bq9yrU11c4S67ACJ8gttPnuXBv8UVSkP8tcmzzBW5moZRSoMXVoMWdxbL4sS7hhU6wIN
	Pswt3JTvVdPAl1BQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931334; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MdC9mN3ikl0hWaCbPvCnmTL0++AEJSTlyooUhKj2S4M=;
	b=CG2mjeHV3AxTf+Ailrj09GaxqOOx72hMK0ym2pnKx2bg8gI8nhl1DpYl7iAy+stXUDmFB5
	VhFoRjbVhj9ItvWrL6YLvnOBNd1+QZCMuTARal3+IK17oUPqOFVFqsgOPcd6colL3NVG/H
	lf2pyhcM6py973L/cUI1kAcQmrFLLok=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931334;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MdC9mN3ikl0hWaCbPvCnmTL0++AEJSTlyooUhKj2S4M=;
	b=hGDqWtK5PsqA6uEhtg/miuIqL3wa0BR0OP9eh7LDUgRqhLnLZ4lafHckyndG7nrvP2ng7e
	YkkOxDXN32KArlCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AC5BE13C05;
	Fri,  2 Oct 2026 08:55:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HfPyB31xv2ppWAAAD6G6ig:T11
	(envelope-from <tiwai@suse.de>); Fri, 02 Oct 2026 08:55:26 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 10/32] ALSA: ca0106: Use auto-cleanup for probe card error handling
Date: Fri,  2 Oct 2026 10:54:48 +0200
Message-ID: <20261002085517.693510-11-tiwai@suse.de>
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
 sound/pci/ca0106/ca0106_main.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/sound/pci/ca0106/ca0106_main.c b/sound/pci/ca0106/ca0106_main.c
index cf923f551211..6429c2bfc310 100644
--- a/sound/pci/ca0106/ca0106_main.c
+++ b/sound/pci/ca0106/ca0106_main.c
@@ -1710,11 +1710,11 @@ static int snd_ca0106_midi(struct snd_ca0106 *chip, unsigned int channel)
 }
 
 
-static int __snd_ca0106_probe(struct pci_dev *pci,
+static int snd_ca0106_probe(struct pci_dev *pci,
 			      const struct pci_device_id *pci_id)
 {
 	static int dev;
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_free) = NULL;
 	struct snd_ca0106 *chip;
 	int i, err;
 
@@ -1767,16 +1767,11 @@ static int __snd_ca0106_probe(struct pci_dev *pci,
 		return err;
 
 	pci_set_drvdata(pci, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	dev++;
 	return 0;
 }
 
-static int snd_ca0106_probe(struct pci_dev *pci,
-			    const struct pci_device_id *pci_id)
-{
-	return snd_card_free_on_error(&pci->dev, __snd_ca0106_probe(pci, pci_id));
-}
-
 #ifdef CONFIG_PM_SLEEP
 static int snd_ca0106_suspend(struct device *dev)
 {
-- 
2.55.0

