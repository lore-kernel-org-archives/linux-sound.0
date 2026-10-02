Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE1A468C0C
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 08:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790931358; cv=none; b=UM2QFIa/sOYOgG36hJfmtUtKFBV1iALNrLNFaxuLgWKOmG2PycLHvVCeFb80CFXjjY5TM4QuaaABpNxaIDBla8YiVVMzNOvMAZ8i9aZTGjlCoRjb9JmuLzRxHUi49D+XZ25IP0Yt9ZYMkePP+Ad4Gv7pFTyqAiiScjeOAfcuwZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790931358; c=relaxed/simple;
	bh=J+djJpKNZuhv3kNw/sOYgxh9USoGoFaOwWQR4/l1eLk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S8BQCS++CgJFOxUsB5GqzZNBBGs66oZyN316ALbSpbOUsjivUus4hxfV5/HWW0Ggc4WtcN5H1Rc7WizOoi6kg2OSQ5kbYaY2xQxTBl0oN6s4HqByk4FJoWRR0BDmAms1/RRxV85Wt4asLcgJhouwDdrYDUE9S8SXswHyRuxugkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=b7K0UEj9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3zgWmryc; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SpQdLN1T; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HiqiBiXu; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="b7K0UEj9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3zgWmryc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SpQdLN1T";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HiqiBiXu"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4BE6821F47;
	Fri,  2 Oct 2026 08:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931347; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lwNJfkhubqmlZOC12R+Y1lcNR5dlqIq6Mxv/QRDf3wU=;
	b=b7K0UEj9pXiEvdQxll86jpDbhX2AuIOjoTV94aXQ2kiUm6CDqW5GJNG65gBp+dw1UxVga+
	liJWe4gb6v2G4qghN21qyR3u0Asj0kA91Sx+cz0//pOahrXca5ro8nlqlQWImUGaM7ghII
	SXCx2ng1a43JwSQXkb19msAz32g2htk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931347;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lwNJfkhubqmlZOC12R+Y1lcNR5dlqIq6Mxv/QRDf3wU=;
	b=3zgWmrycH+dC5zNNw6bJFjVAD8zPxGDwQUXjl9ZznDSULKlFdhElw7xjt93wBCbNzm48Mc
	3cbbgn85buFb5tBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931343; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lwNJfkhubqmlZOC12R+Y1lcNR5dlqIq6Mxv/QRDf3wU=;
	b=SpQdLN1TJofNIPOlSahnjPVsm37M/2nuoWsbbXiXuJkW5yyeNFzhkfOHMzwDie5gfedhQ7
	A7m9u7I5JVJ5HMl+tkFucmd+kdQiSYJ4RX6nf/TMZXTA3RkbRUfBXjooGjIUdW2RrBZx7b
	szpa4AVPiPRkrktul++xHrNnDiS//yE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931343;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lwNJfkhubqmlZOC12R+Y1lcNR5dlqIq6Mxv/QRDf3wU=;
	b=HiqiBiXuoS7O/iGYtKpGjlpmVCtCE5y8tGjgpi33IAGMvzTpJsslpl48FiOnOnLq8qzEPB
	eilUvsvubHP2ebDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4A68913C16;
	Fri,  2 Oct 2026 08:55:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HfPyB31xv2ppWAAAD6G6ig:T28
	(envelope-from <tiwai@suse.de>); Fri, 02 Oct 2026 08:55:29 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 27/32] ALSA: sis7019: Use auto-cleanup for probe card error handling
Date: Fri,  2 Oct 2026 10:55:05 +0200
Message-ID: <20261002085517.693510-28-tiwai@suse.de>
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
 sound/pci/sis7019.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/pci/sis7019.c b/sound/pci/sis7019.c
index 55c1b11a2900..fe5bda5af6a5 100644
--- a/sound/pci/sis7019.c
+++ b/sound/pci/sis7019.c
@@ -1309,10 +1309,10 @@ static int sis_chip_create(struct snd_card *card,
 	return 0;
 }
 
-static int __snd_sis7019_probe(struct pci_dev *pci,
-			       const struct pci_device_id *pci_id)
+static int snd_sis7019_probe(struct pci_dev *pci,
+			     const struct pci_device_id *pci_id)
 {
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_free) = NULL;
 	struct sis7019 *sis;
 	int rc;
 
@@ -1361,15 +1361,10 @@ static int __snd_sis7019_probe(struct pci_dev *pci,
 		return rc;
 
 	pci_set_drvdata(pci, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	return 0;
 }
 
-static int snd_sis7019_probe(struct pci_dev *pci,
-			     const struct pci_device_id *pci_id)
-{
-	return snd_card_free_on_error(&pci->dev, __snd_sis7019_probe(pci, pci_id));
-}
-
 static struct pci_driver sis7019_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_sis7019_ids,
-- 
2.55.0

