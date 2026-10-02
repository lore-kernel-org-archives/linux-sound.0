Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C291A45D926
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 08:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790931354; cv=none; b=UJfpX80tm97Nfm1hYc3HAiRpkbdI17Xzmz9DdZ/ie+gMWbuTJGM9m6Zf1ByUMldKDPPfhh9lPGQEguSCpQea1ULCHkTkAMpJ6XEzfunToQmtn24rhnb7YakYLFsGRrb3eXZj/JiV0Ugxq0JKrxkEy9EoASKcu3dDoVWRM4jzmFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790931354; c=relaxed/simple;
	bh=i/bWMzv8aypB8Sb1EOIfWZzTH+10yyfP4ylzHf6nJAI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NEVXAzVty5zBwuKEIAaUm5jKu7MzTbod+bLgOrP2GKaZZOLT/rbyOJ6H5dBUPPxmuyL2HNcrpUfFUcvxpoy7tRj85oYvcFBvk8kUbFlNsF+Mg5u0z89uSullE5uJTw5ZrjoeDRzXbFr7MVdh6+FzgfnX6qUScKD9EpHZMzAhHGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rbw/OSw/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9c0vT6pO; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ghnaEj37; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uZsPfGSF; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rbw/OSw/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9c0vT6pO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ghnaEj37";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uZsPfGSF"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A148D1FE52;
	Fri,  2 Oct 2026 08:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931346; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K5L300wtR7IouSLmlKqZZXy9xh0c9LPQgyLbCRlmK6M=;
	b=rbw/OSw/JPopFfoUBtYTiw51zaEJst0XW02sW4uJphwVpnWKPMM3j9uJHWKNH60ytdGHgQ
	cVIYmWIBAa0atEnDo5gPyWpGakmsT2Z9qtBa9oGkjYOYFjXrTMhdhi4urWixZ+zfAb+Yq3
	SaL7aRIQjE93qjMyLnFkmXUItIGyklk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931346;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K5L300wtR7IouSLmlKqZZXy9xh0c9LPQgyLbCRlmK6M=;
	b=9c0vT6pOKmcYhtHAQ8OCz23VLypXsJd8hQinIe7wigaSc1SVWhO0XUYAZkbW39vVnEvHFA
	qs3uLy4CXW+2abCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931342; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K5L300wtR7IouSLmlKqZZXy9xh0c9LPQgyLbCRlmK6M=;
	b=ghnaEj37vyHXo+OA/kEWWRt9u1mgu4Y6bZoYJcf0qUYVGN4LUpha/YiAeKT0/PD2SNH2oF
	R4RrY9oTzDznAmOkxRG44G6ykleP0ntmv9ln5KZubAITUuetkYfpah3RZ7BMThhiVS6Bp4
	6w4u4BYqtNV//qQWQnpWz/9/EtIQEY4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931342;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K5L300wtR7IouSLmlKqZZXy9xh0c9LPQgyLbCRlmK6M=;
	b=uZsPfGSFxvQG6bgmIw18dNZBdHfOF6Pii31X3a6ifDSU6CuKbEgso5qL14TNQlR8PrG3yn
	WMuC4jnoMw5OJcAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 01E4113C0E;
	Fri,  2 Oct 2026 08:55:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HfPyB31xv2ppWAAAD6G6ig:T20
	(envelope-from <tiwai@suse.de>); Fri, 02 Oct 2026 08:55:27 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 19/32] ALSA: ice1724: Use auto-cleanup for probe card error handling
Date: Fri,  2 Oct 2026 10:54:57 +0200
Message-ID: <20261002085517.693510-20-tiwai@suse.de>
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
 sound/pci/ice1712/ice1724.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/pci/ice1712/ice1724.c b/sound/pci/ice1712/ice1724.c
index 859bb87393b4..651d92663567 100644
--- a/sound/pci/ice1712/ice1724.c
+++ b/sound/pci/ice1712/ice1724.c
@@ -2524,11 +2524,11 @@ static int snd_vt1724_create(struct snd_card *card,
  *
  */
 
-static int __snd_vt1724_probe(struct pci_dev *pci,
-			      const struct pci_device_id *pci_id)
+static int snd_vt1724_probe(struct pci_dev *pci,
+			    const struct pci_device_id *pci_id)
 {
 	static int dev;
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_free) = NULL;
 	struct snd_ice1712 *ice;
 	int pcm_dev = 0, err;
 	const struct snd_ice1712_card_info *c;
@@ -2663,16 +2663,11 @@ static int __snd_vt1724_probe(struct pci_dev *pci,
 	if (err < 0)
 		return err;
 	pci_set_drvdata(pci, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	dev++;
 	return 0;
 }
 
-static int snd_vt1724_probe(struct pci_dev *pci,
-			    const struct pci_device_id *pci_id)
-{
-	return snd_card_free_on_error(&pci->dev, __snd_vt1724_probe(pci, pci_id));
-}
-
 #ifdef CONFIG_PM_SLEEP
 static int snd_vt1724_suspend(struct device *dev)
 {
-- 
2.55.0

