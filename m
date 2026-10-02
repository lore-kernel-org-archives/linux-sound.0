Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B569A44F548
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 08:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790931347; cv=none; b=GRGr/mLHPfeGqYYb+Ff73Et4LhTshJhvxxRf4Y+3XwoOLPsLIVXrJE7PhaUIV/xbjGCbptoQhniJFPW6gmD3c5YEJN9/AiSqUMz42KKMd0c9faTzDF880jUA5O2t9gDE1a4akmgXylYlgZEFFMmPqx0x6c4bqiY6IXdDJZWXURM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790931347; c=relaxed/simple;
	bh=blQKIx1EyQSCMSJH8402dd4oEgHSVMKi7LmswrSGAhA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NaGeg3MLn9lAdnFJrbGbnxinEzYiDnNeVnZTwIYDE2U+0RoavpVKVAbSroAiQ6BHxS5UTZu3uzrxebMU/NOXCA2DU7WWqyikBQlrU53YLQ23GaqjIzwwUoQEgeDzCjpAkLuvI/6qWVXCHOjv+Km8iAIToY635l2n3e71qFeqlbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LhdIZ5Kz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=aZ3SN+gL; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JF92NA97; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JVaKGJvT; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LhdIZ5Kz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aZ3SN+gL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JF92NA97";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JVaKGJvT"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 67FC9215E7;
	Fri,  2 Oct 2026 08:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931338; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S1rQHGwK1lugsVLp1G/3f5F2FDjA7UWjDB9bNFXNVxs=;
	b=LhdIZ5Kzh1NYevoq1guvF2V3Q27ra3RqddVlzZJ340N8TDUNt6yagdgW++/U01R/QygV9S
	Q85xXkoq0l4NMzt/3L4i5uOS5AUvNSqOYh7DTRko+90m0qeBYhaIJerZ7d/RzAQHZQ8S2O
	jz1fVHysVK+MnlTGw0aq666+Pbg/Vzc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931338;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S1rQHGwK1lugsVLp1G/3f5F2FDjA7UWjDB9bNFXNVxs=;
	b=aZ3SN+gLMaYGgwWd9JeoB9FE5Hm8X5gZCylNelLnOdoH/FrZaCUDmKkIa+be2vMAWnyNJt
	9moZoX1Mcp57HgAA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=JF92NA97;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=JVaKGJvT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931334; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S1rQHGwK1lugsVLp1G/3f5F2FDjA7UWjDB9bNFXNVxs=;
	b=JF92NA97sa69fR3sW7ILTd0O3X6/C/lFIcahsOGMGoSWr9j2gV7jhVsUO9YnoXJptuKVA7
	zrImioUSmcwlJ/CTfvzYcYG9c0ga82hfS7sUGRt06LCPLI29jSKyjSFbIn8k1LtwPQVyo2
	xtpfuBdranvCqFJeMTTB0g4rpZedKQo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931334;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S1rQHGwK1lugsVLp1G/3f5F2FDjA7UWjDB9bNFXNVxs=;
	b=JVaKGJvT5aEaU7fy/DJmbNACyifNvTqFXBs+ZqX39RmKGxjsdJQvz/KgGvPcOruemrtQ2Q
	0oUyEPygQXplRYAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8BE3313C04;
	Fri,  2 Oct 2026 08:55:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HfPyB31xv2ppWAAAD6G6ig:T10
	(envelope-from <tiwai@suse.de>); Fri, 02 Oct 2026 08:55:26 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 09/32] ALSA: bt87x: Use auto-cleanup for probe card error handling
Date: Fri,  2 Oct 2026 10:54:47 +0200
Message-ID: <20261002085517.693510-10-tiwai@suse.de>
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
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 67FC9215E7
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:email,suse.de:dkim];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 

Instead of the manual call of snd_card_free_on_error(), use the
auto-cleanup feature.

Merely a code cleanup, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/bt87x.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/pci/bt87x.c b/sound/pci/bt87x.c
index 383def1f2af7..db8f60261a0f 100644
--- a/sound/pci/bt87x.c
+++ b/sound/pci/bt87x.c
@@ -798,11 +798,11 @@ static int snd_bt87x_detect_card(struct pci_dev *pci)
 	return SND_BT87X_BOARD_UNKNOWN;
 }
 
-static int __snd_bt87x_probe(struct pci_dev *pci,
-			     const struct pci_device_id *pci_id)
+static int snd_bt87x_probe(struct pci_dev *pci,
+			   const struct pci_device_id *pci_id)
 {
 	static int dev;
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_free) = NULL;
 	struct snd_bt87x *chip;
 	int err;
 	enum snd_bt87x_boardid boardid;
@@ -878,16 +878,11 @@ static int __snd_bt87x_probe(struct pci_dev *pci,
 		return err;
 
 	pci_set_drvdata(pci, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	++dev;
 	return 0;
 }
 
-static int snd_bt87x_probe(struct pci_dev *pci,
-			   const struct pci_device_id *pci_id)
-{
-	return snd_card_free_on_error(&pci->dev, __snd_bt87x_probe(pci, pci_id));
-}
-
 /* default entries for all Bt87x cards - it's not exported */
 /* driver_data is set to 0 to call detection */
 static const struct pci_device_id snd_bt87x_default_ids[] = {
-- 
2.55.0

