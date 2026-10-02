Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4041B4E0B8F
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 15:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790953680; cv=none; b=XLEYNoiNvEhY9FjRT6ofbCdI7TMnTtF7gyc8TMc3M4YHv9Omh1fjCVe9vIP+je5Ovp6o+vL7SWWu9Te6G4/glQrYW8GZqs8sPT4d+5wG5+v7REt4CFC4v+JSd1/z6TK4FUFp/yj1lWcA79Ug0NZ3P0R4QF+k3cKBbvE2be23ngM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790953680; c=relaxed/simple;
	bh=0gkvdAVqaFIx0jOqJuMBf8AapuZEbmJIx47huXalCak=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tk6ccfytwxeYjJxlcZmm2yd0haskdEHibVicbnjVjPgtgky7chtXlTu20GNxslEKddwDdWY8GOgMxXZ7hVKjjVQaPJXQIG/F+Gp4C3XDGYiJN1r3XOAz1k6/hMCfv1baCZZEZnrA5s1vsh7RHIFbiuv/x/BKQ0Ph/W9JOD19rT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SwNjY3A2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=omN0etKe; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=D/LTyHPZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8K8sQPuO; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SwNjY3A2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="omN0etKe";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="D/LTyHPZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8K8sQPuO"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7C7D61FE4A;
	Fri,  2 Oct 2026 15:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790953670; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gzvyTXHQn6+bdbnEYtYW9cTOMliq8HE1VQXEkyra2fo=;
	b=SwNjY3A2KVHFseZn4aKo6dxxJ1qtFzDL+ut2+fcJDQaJGGew7LysRO5Rvlf/tIH25GQmcQ
	KrdinFya7+Xu/y1gtrPq1kfeoQWCE3D9Jzmcab8IOlz6dt3kNNixl+RtCkrkzrwZpX/gyp
	YE+yvrI+EmEGL7UJj0vWhuQHd4zjUKg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790953670;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gzvyTXHQn6+bdbnEYtYW9cTOMliq8HE1VQXEkyra2fo=;
	b=omN0etKeVse5o8mU53ShUjWs0mvK3XPyAROToGTlJqlJJ4QNugkzqdVyM11lt9WpwqLM9T
	mk4zhgPBpJg7qiAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790953666; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gzvyTXHQn6+bdbnEYtYW9cTOMliq8HE1VQXEkyra2fo=;
	b=D/LTyHPZy0jhlZ4QjZZdI3fbCpdo0VCMab2g/V1aoUh1PaM8nJzjW3Vg1YHfg8LA3kdkk0
	rloAgHzLrv2CnxC7oNEZXUp2ZDy13D9t0xnNWi9kVb91wHxmAjv08XGSIAJAuIF7CVhT9W
	PbnV4zHxaqDbFjqhdgZILeVaoyymQjo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790953666;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gzvyTXHQn6+bdbnEYtYW9cTOMliq8HE1VQXEkyra2fo=;
	b=8K8sQPuOOdnLfmpgsEKS4EeQ7lRDX2Wj56GETXsrcrbx7w80o3UsI1wTXKMe3BFG4BqNfd
	z3w6AOvdU2y/2eBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5994B139D9;
	Fri,  2 Oct 2026 15:07:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id bn6aIrnIv2qpZwAAD6G6ig:T6
	(envelope-from <tiwai@suse.de>); Fri, 02 Oct 2026 15:07:38 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 5/9] ALSA: korg1212: Avoid manual calls of snd_card_free() at probe card error handling
Date: Fri,  2 Oct 2026 17:07:27 +0200
Message-ID: <20261002150733.880051-6-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

Instead of the manual calls of snd_card_free() at probe error
handling, use the auto-cleanup feature.

Merely a code cleanup, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/korg1212/korg1212.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/pci/korg1212/korg1212.c b/sound/pci/korg1212/korg1212.c
index f4d8402f835f..bb442b556158 100644
--- a/sound/pci/korg1212/korg1212.c
+++ b/sound/pci/korg1212/korg1212.c
@@ -2216,7 +2216,7 @@ snd_korg1212_probe(struct pci_dev *pci,
 {
 	static int dev;
 	struct snd_korg1212 *korg1212;
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_free) = NULL;
 	int err;
 
 	if (dev >= SNDRV_CARDS) {
@@ -2234,7 +2234,7 @@ snd_korg1212_probe(struct pci_dev *pci,
 
 	err = snd_korg1212_create(card, pci);
 	if (err < 0)
-		goto error;
+		return err;
 
 	strscpy(card->driver, "korg1212");
 	strscpy(card->shortname, "korg1212");
@@ -2245,14 +2245,11 @@ snd_korg1212_probe(struct pci_dev *pci,
 
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
 
 static struct pci_driver korg1212_driver = {
-- 
2.55.0

