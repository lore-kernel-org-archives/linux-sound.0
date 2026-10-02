Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB5946A5ED
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 08:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790931354; cv=none; b=dr+GPpxldCf7Wj+Xpt88pFWAKB+FKIDMgZTScC3A49iY0aD6u/KJqCb71WQ2Isq/522yMwd7759d11zSvSjTtvGRHpQSd47iVJGFPZfCd9yTv9qCmBjwlT47gMgXE+huqJ3AUQiKIrY6tGAPhbacI1IC09qzU1DCDWQFB+n9G4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790931354; c=relaxed/simple;
	bh=arp2XYQZ/2oblH94H8kDlx7e3DS5YeJXT4u9l5cSOjQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IB0faDTrvY6Uu1766bZb+SHlw/htQqznWxnTwJktdcnkXVCCHmFGz6OGTltyveNy3LmwNwSuRxIX+r+sWdhBehu1pV84BMI8WJHKz1hUUq7YT9FQwj3zsRaakK353TP7kC3Wh6MKvWw9Y7mDfm9h/SbkI87yECLPUOuQZZ5EN9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XXkBiHza; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xFNpnL3V; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Zblh1gKu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cOXCttpX; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XXkBiHza";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xFNpnL3V";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Zblh1gKu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cOXCttpX"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 329DA1FE54;
	Fri,  2 Oct 2026 08:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931347; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gHfn1Fu6qEjYJO/BSZxytiOS7gYblRZ2qRAXJMBgXW4=;
	b=XXkBiHzafyP6lgMX6IxV120llziTPbpp9vM24YnqjnFqZ6wWmL+IMHYi33/2YUEuArOnIl
	fOBnEK2CNNNC4nsKWBRclI8vmdwThnFgIy5jxIwn6Y/bBbiMXvfvRH0UPX56YrH0gPaPEq
	FEiUgpQAXnj9vUtNUoNc0NHzqz42vyY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931347;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gHfn1Fu6qEjYJO/BSZxytiOS7gYblRZ2qRAXJMBgXW4=;
	b=xFNpnL3V59XlRqHS25az6j5pbzX/KrU9r0pwprKnrUXctudqhw0pFaC6vOv6MlJsXRu+Io
	+xm0YVL+LyyUnEBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931343; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gHfn1Fu6qEjYJO/BSZxytiOS7gYblRZ2qRAXJMBgXW4=;
	b=Zblh1gKun5VbdwxoeZMA/4GAII5QVfojQXvrU3MWefMQ16egExFzpj5ohQlfxBMn37dyi0
	j+K/f+3EeBUOLpjnJhM4XJ1U9TSR/m98tPHAkRbzwLCY2ZE1MoKKXJHP6+jdbzPMGC/9bP
	s8ja1VAn+e7XPagVGiklz0FCh/zV38M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931343;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gHfn1Fu6qEjYJO/BSZxytiOS7gYblRZ2qRAXJMBgXW4=;
	b=cOXCttpXmk5xyVPrbSrwna0bkvjxHFTU02VqqLo4asAzzBZXtlrQ8ja8j8x65IPtvB5fRk
	qBbZwew4iL9dm2Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2791513C15;
	Fri,  2 Oct 2026 08:55:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HfPyB31xv2ppWAAAD6G6ig:T27
	(envelope-from <tiwai@suse.de>); Fri, 02 Oct 2026 08:55:29 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 26/32] ALSA: rm96: Use auto-cleanup for probe card error handling
Date: Fri,  2 Oct 2026 10:55:04 +0200
Message-ID: <20261002085517.693510-27-tiwai@suse.de>
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
 sound/pci/rme96.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/pci/rme96.c b/sound/pci/rme96.c
index 892fcc598557..926783f0410e 100644
--- a/sound/pci/rme96.c
+++ b/sound/pci/rme96.c
@@ -2356,12 +2356,12 @@ static void snd_rme96_card_free(struct snd_card *card)
 }
 
 static int
-__snd_rme96_probe(struct pci_dev *pci,
-		  const struct pci_device_id *pci_id)
+snd_rme96_probe(struct pci_dev *pci,
+		const struct pci_device_id *pci_id)
 {
 	static int dev;
 	struct rme96 *rme96;
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_free) = NULL;
 	int err;
 	u8 val;
 
@@ -2420,16 +2420,11 @@ __snd_rme96_probe(struct pci_dev *pci,
 		return err;
 
 	pci_set_drvdata(pci, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	dev++;
 	return 0;
 }
 
-static int snd_rme96_probe(struct pci_dev *pci,
-			   const struct pci_device_id *pci_id)
-{
-	return snd_card_free_on_error(&pci->dev, __snd_rme96_probe(pci, pci_id));
-}
-
 static struct pci_driver rme96_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_rme96_ids,
-- 
2.55.0

