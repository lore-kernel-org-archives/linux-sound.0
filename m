Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8B84E0B65
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 15:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790953670; cv=none; b=P+unnKWOHLCzlTwBDSpDU6FsVntVjDXPxcbKcrlEorsdRVOdeMobzhuxdXmT/GHM8XnUT+A4Jy0j64rMp0qDm3ebkm565g/7kb4uOLR2wfjM0rUOa595zIHu0TKCHidw3lcmoAWWP72788WB8xrvTvQE15sbfQJd4uK1C8uy2vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790953670; c=relaxed/simple;
	bh=WZVpfigQvT50xjQuDyY1zI2SbmQmheFB8hY8Pw4lXvo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ktXFQwViFyfrDV+UWdpAFqvp66nG5Vvt0wIz1F3IInzTtOFMDOMR7lfrH+6edTBMUw5FCIybVWNYMnQOmzSgCUaa0xhgePTMz/XNUv2F10IHQgObiEtqpU+g3sQpXttIUOCCfiEZJzwWyBDGb9hz3YxeV2tb1lAyrkuhTLlJAUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zRu0AnTN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2dktaIRE; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yeV3zKuL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yWXtYtro; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zRu0AnTN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2dktaIRE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yeV3zKuL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yWXtYtro"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8DE7B21EBD;
	Fri,  2 Oct 2026 15:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790953662; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oSKtUHO89L+ZAQFIQ/H3gp/tjLnqdv7xUiEMUIfU1Co=;
	b=zRu0AnTNqU9kbGJO8PVsYgd3em41Y125m4vTX7JAt5K8v/lZYuWMYenAzeg8JBdAVkknDH
	BT2yv+lPxF5To+kXWoMALba8Txm8PUk40R1tosKLAwiQpzxhf0IwDApXwbHugKXO5Aby8n
	Sc0UMzF8HUURT0rQhn+8556h46du2zU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790953662;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oSKtUHO89L+ZAQFIQ/H3gp/tjLnqdv7xUiEMUIfU1Co=;
	b=2dktaIREsmZTfqcMAlsmFRtDs3fJlCNSATOlR36t7rQlXbKRDRRD7RQ8xdgAxiEL6wNcp/
	VEtGBmy/7mz4XXCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790953658; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oSKtUHO89L+ZAQFIQ/H3gp/tjLnqdv7xUiEMUIfU1Co=;
	b=yeV3zKuLVlLKPWDv30IXLHwM7UQsgU9gQ5rDtwPfiEsZT+mKKsdmUoNvVjiVErXyscLYeq
	sTfBQ4Hd0KIHkzhXPTnSnIkuljA6NG6obeymFKHu4YYtblpFFVMecEbG4XqKSyk33r7tlE
	azVA4g1A1K0ga0H+l4TQ6dUxO/bu00w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790953658;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oSKtUHO89L+ZAQFIQ/H3gp/tjLnqdv7xUiEMUIfU1Co=;
	b=yWXtYtrohCqpz7yxCKremQjCbY03kzhKBGxn0vvpN4u4I8rYaY3EVJ39vDOLH36aMzipHF
	r2USUjYVe9uUYQDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1C2C1139D7;
	Fri,  2 Oct 2026 15:07:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id bn6aIrnIv2qpZwAAD6G6ig:T4
	(envelope-from <tiwai@suse.de>); Fri, 02 Oct 2026 15:07:38 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 3/9] ALSA: cmipci: Avoid manual calls of snd_card_free() at probe card error handling
Date: Fri,  2 Oct 2026 17:07:25 +0200
Message-ID: <20261002150733.880051-4-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
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
 sound/pci/cmipci.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/pci/cmipci.c b/sound/pci/cmipci.c
index 9d9f784e3a8c..d120b7bbe024 100644
--- a/sound/pci/cmipci.c
+++ b/sound/pci/cmipci.c
@@ -3170,7 +3170,7 @@ static int snd_cmipci_probe(struct pci_dev *pci,
 			    const struct pci_device_id *pci_id)
 {
 	static int dev;
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_free) = NULL;
 	int err;
 
 	if (dev >= SNDRV_CARDS)
@@ -3201,19 +3201,16 @@ static int snd_cmipci_probe(struct pci_dev *pci,
 
 	err = snd_cmipci_create(card, pci, dev);
 	if (err < 0)
-		goto error;
+		return err;
 
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
 
 /*
-- 
2.55.0

