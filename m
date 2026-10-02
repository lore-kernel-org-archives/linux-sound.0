Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F318455615
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 08:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790931345; cv=none; b=bTtILrONajSII80xhyXJ8BQmnGcEmS5Koy6Vj5QJwjih8MWaM3+b5YCOS3MaPEJIbQ1NobKpKeO3A4Ihbc6aPDXTQULR08O+i0L/yIXiE83bijX/3FN7Y8lztA9Rlg476Qxbz9FP5Dl2MOhE6bB5DGIVYd0cQurb09Mkk4mimmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790931345; c=relaxed/simple;
	bh=1DXqUjieUdJY7JgUxExEW/ikU4ZKrJuo2hs9JhM/aPw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WWhLwRJRANGE814OLjBTLBtcF8Vur/eOJJVkedCEOpbQWxd/WNzh6jih71uMpOoS4+gK8HmgPEpOh1fbJzlcOokYA7WS5aBrPM9gvPynaxj6exy35QavDBfnjw2h9cLOkCWYrz0ZrrO7bFyfT6VFDOJ8CMDjfgP7QeLb1vOkToE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SnxHQ/zZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GEOxGyTt; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IvmBO/uC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AUx5edDe; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SnxHQ/zZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GEOxGyTt";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IvmBO/uC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AUx5edDe"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 39CBF1FE45;
	Fri,  2 Oct 2026 08:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931338; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dBZfhJ6zGxq7juDOdVQ+cWnMYCFYYyqZWjrxjaC6REU=;
	b=SnxHQ/zZMEWYCo99bR9XxsmvmsvWt0RvWrCBbEy1Qby89sCpF2TevoG1KlIX23fWDv8UC7
	jtJ15QgYyD7aSLYsttftkRiN5aAEEQSREGybczQzvE4LF8ALYfZUrcEiE6A7mEu8INc3b/
	Oe/Qzwd0m4mN58EMTEkNcNPmtpCAInY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931338;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dBZfhJ6zGxq7juDOdVQ+cWnMYCFYYyqZWjrxjaC6REU=;
	b=GEOxGyTtpBcQjITx5lvJw+Ko0RFq3UNOxhA1BwfWS/4HQcZOs0h21HOq+E8R1iPkVQD2wx
	lX2cHsk1REiN1MDA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="IvmBO/uC";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=AUx5edDe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931334; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dBZfhJ6zGxq7juDOdVQ+cWnMYCFYYyqZWjrxjaC6REU=;
	b=IvmBO/uCNxDQ/vClAR2nrXrMzuyu/CUOfxCjyTVFORSFV9ezqnjjiixRxbOH7HWLOLfBl6
	fLd970ra72yK4BG1079litFwBddwgg/cDy2Rsy/Gt5IG08ZIv0QmSyCFnH4r3fGX5+TR+F
	aHxtPXTmQWq/e6tff8UBRTtXyFqKGDk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931334;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dBZfhJ6zGxq7juDOdVQ+cWnMYCFYYyqZWjrxjaC6REU=;
	b=AUx5edDeTkcjuCNRWJZHf2+zghp7arjyppbPv4ZbEzev1Z6/Zfbo4ecc5GoF+6buhyDR9r
	JiNBoZrCP805pUDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5A02613C03;
	Fri,  2 Oct 2026 08:55:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HfPyB31xv2ppWAAAD6G6ig:T9
	(envelope-from <tiwai@suse.de>); Fri, 02 Oct 2026 08:55:26 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 08/32] ALSA: azt3328: Use auto-cleanup for probe card error handling
Date: Fri,  2 Oct 2026 10:54:46 +0200
Message-ID: <20261002085517.693510-9-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 39CBF1FE45
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Instead of the manual call of snd_card_free_on_error(), use the
auto-cleanup feature.

Merely a code cleanup, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/azt3328.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/sound/pci/azt3328.c b/sound/pci/azt3328.c
index ccca82417657..8cf94c41a54c 100644
--- a/sound/pci/azt3328.c
+++ b/sound/pci/azt3328.c
@@ -2403,10 +2403,10 @@ snd_azf3328_create(struct snd_card *card,
 }
 
 static int
-__snd_azf3328_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
+snd_azf3328_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 {
 	static int dev;
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_free) = NULL;
 	struct snd_azf3328 *chip;
 	struct snd_opl3 *opl3;
 	int err;
@@ -2492,16 +2492,11 @@ __snd_azf3328_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 	snd_azf3328_gameport(chip, dev);
 
 	pci_set_drvdata(pci, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	dev++;
 	return 0;
 }
 
-static int
-snd_azf3328_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
-{
-	return snd_card_free_on_error(&pci->dev, __snd_azf3328_probe(pci, pci_id));
-}
-
 static inline void
 snd_azf3328_suspend_regs(const struct snd_azf3328 *chip,
 			 unsigned long io_addr, unsigned count, u32 *saved_regs)
-- 
2.55.0

