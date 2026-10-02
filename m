Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CC544E02A
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 08:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790931338; cv=none; b=tYnf2iOQURBpq2wehLNhyZ+yZrSt5vHas7wxddEbe0HG99x9Kc72DvvJ7cmeXaF3AcERjYj3BR5IuN6sdn8o4Vi4YkbuBPqfaoKl/YRc7NM1FGrzXGFXo7NWP6ezhVZ/Ov/a+XjQHf7MZO3hiPRWBBTBitayyGnQbWiEgI8NjJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790931338; c=relaxed/simple;
	bh=QuE6t8hftirqdOUKNpFhaQeUYRiLQ9rE/nuNxoVmRck=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jLSS/Fw3GRCDsyDiOansVcTB9EsC3eYOZvItYM2Skl1UFeAVFT6WZbEhpW+Na4oDagNRpaoQ0eqmyFGpM8fV9heleHZSpGX93CU1oo0zs3pI8eTGpL75++6nnaWh9vh1Zzi97Qv1nbvuFGNBD8YnpPUx6uYwu+EahhyY+NVO4+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=D3+3sl32; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=F04dmeSy; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jBtB1U21; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MnuaYQeK; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="D3+3sl32";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="F04dmeSy";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jBtB1U21";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MnuaYQeK"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6DE6821F4C;
	Fri,  2 Oct 2026 08:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931330; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mvDXNO5FlsS1GY/dYrjc53AC7AF21n4dGJs9jRCZUgo=;
	b=D3+3sl32kPd2aOyj717JlFsb4G3oGwpHUueZr4u+sv32bSvQCB7oxqM5Qb91HyeCKTwAXu
	oZUgDfw/TbKsJz1G0ZMhkFske7Zvo7zpYuHmoJr0qcjEe4ABr0bm+TlILr5D46qUrImI8R
	UnVY/nXG2XVU2A9Cvf8joncjUYISpGw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931330;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mvDXNO5FlsS1GY/dYrjc53AC7AF21n4dGJs9jRCZUgo=;
	b=F04dmeSy6lrXm77K/v+mFkcBYnQv2f4WLWDaLkEs8VM/VjKjFrSxS+j87r7vZSMi3CcvKY
	7DbYv8qWC1SyG2BA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931326; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mvDXNO5FlsS1GY/dYrjc53AC7AF21n4dGJs9jRCZUgo=;
	b=jBtB1U219cNuJsQf3bSPDP7AJHi1+5t08dyFFOh09iZUuGwT/VYyNUtIgH0frBHI/HQwX2
	l+2IOPzm19E12soBP7QOYulNrnmc+XfZEMjvcOrFSOAWZ3MTvL0+qZiQunuR87d5pFRbUd
	6oaCsQdDkndqKC9yzpRA1BWB9A9y0MY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931326;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mvDXNO5FlsS1GY/dYrjc53AC7AF21n4dGJs9jRCZUgo=;
	b=MnuaYQeKLsp28s7lhJfr+uApB99iQreGS+jz7MxlqGNMQoL34l0FV+NM8ZRZcNTaMAo9jG
	wd8T66/f+Pz2+jAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CF32213C00;
	Fri,  2 Oct 2026 08:55:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HfPyB31xv2ppWAAAD6G6ig:T5
	(envelope-from <tiwai@suse.de>); Fri, 02 Oct 2026 08:55:25 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 04/32] ALSA: ali5451: Use auto-cleanup for probe card error handling
Date: Fri,  2 Oct 2026 10:54:42 +0200
Message-ID: <20261002085517.693510-5-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
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
 sound/pci/ali5451/ali5451.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/pci/ali5451/ali5451.c b/sound/pci/ali5451/ali5451.c
index f07c5f4c2380..8295eee9b977 100644
--- a/sound/pci/ali5451/ali5451.c
+++ b/sound/pci/ali5451/ali5451.c
@@ -2086,10 +2086,10 @@ static int snd_ali_create(struct snd_card *card,
 	return 0;
 }
 
-static int __snd_ali_probe(struct pci_dev *pci,
-			   const struct pci_device_id *pci_id)
+static int snd_ali_probe(struct pci_dev *pci,
+			 const struct pci_device_id *pci_id)
 {
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_free) = NULL;
 	struct snd_ali *codec;
 	int err;
 
@@ -2129,15 +2129,10 @@ static int __snd_ali_probe(struct pci_dev *pci,
 		return err;
 
 	pci_set_drvdata(pci, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	return 0;
 }
 
-static int snd_ali_probe(struct pci_dev *pci,
-			 const struct pci_device_id *pci_id)
-{
-	return snd_card_free_on_error(&pci->dev, __snd_ali_probe(pci, pci_id));
-}
-
 static struct pci_driver ali5451_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_ali_ids,
-- 
2.55.0

