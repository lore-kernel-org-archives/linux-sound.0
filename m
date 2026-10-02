Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC8E43DA4B
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 08:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790931346; cv=none; b=BUmRdEq+R3otHmcTTTzXhByvR487Oc9twwkqGgyTJ4WOf/ehF4HT97JoIeS5Yvnv45RBoJXT+qbjkSrIAeAz9GYfmrK7dNRgQTa6wJpUO/tDWIOAKL8CH0e35iP/0Fm211+3D0RgudxWoEk9PfC/ypxwptpyQHDzTteV2OXTslw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790931346; c=relaxed/simple;
	bh=5opUG/z8GcVZoU3dwNSQMvkoc+9xsM8Zpd0jUP/QmOI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=On3WCnKqM+W6v3/ytawW6iKwcd1KzDqZtCbUfX7Ks/WyrLHTlrzdHAD0aiOUd3tb+uoHlipAVjcs2UKcEJHWkiD9vmj8/ypqijWCdkpMy/uypH3qXZbXHozH+igWKEz/f6He5gd8MvAV+ZRf2iNkw4nZdCp1bvB40qvRB6jJSA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fp3bkUAz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=aQMX8L96; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CZKdJyov; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wTQmjBv/; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fp3bkUAz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aQMX8L96";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CZKdJyov";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wTQmjBv/"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 350FE1FE48;
	Fri,  2 Oct 2026 08:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931339; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vzLI4jZSiNr2jqu2/6jIeIo8VOqQYSCAHIil2jIcijc=;
	b=fp3bkUAz0UAuoyMgQAdIn6dLlaj4jpEXs3lZlmwdoxX6rrs6FhOM/M5R4oQ2Jz30AnBaZx
	036ddQaUO4mjrB5lwN5osyLUR4QQ3w+BwLkpknEz6BJ1IQr7EkN8+DnEf/GCvyPGGZcL6O
	CZ6qRAyEGqLhBwXUKjL6b/Q6BEoPWys=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931339;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vzLI4jZSiNr2jqu2/6jIeIo8VOqQYSCAHIil2jIcijc=;
	b=aQMX8L96sqmhHTP+w28UG4rHZiLAHz/8KLkJnYLotankQEneej0TcY+1H620ebuq7lH5hp
	qGnVAZg2yPLDXECw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=CZKdJyov;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="wTQmjBv/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931335; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vzLI4jZSiNr2jqu2/6jIeIo8VOqQYSCAHIil2jIcijc=;
	b=CZKdJyov1xtOzSqlvYNge2RUQ62q4yuAfOJ6ns0XDJHh6wNYbuDCWIqtgZ5aKnaBfajlkp
	SQnXp+bKIs6YWNPNKeE1FK/lXPtJVPr5H0ZNns14YjVNQIyjuCns/DuGLWPRAyP2pkS2Ol
	72cXY9RTeH/B+0mlQK0/jGJzwfOwSzs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931335;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vzLI4jZSiNr2jqu2/6jIeIo8VOqQYSCAHIil2jIcijc=;
	b=wTQmjBv/6sEGy7a61yXYpwxoa5OLEpnotjCc8iM1Wrn7xhC5pAWIOb6m7oIdiZAxo+xSrq
	bXUAZ4V/CYGaqwCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8FF6013C0B;
	Fri,  2 Oct 2026 08:55:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HfPyB31xv2ppWAAAD6G6ig:T17
	(envelope-from <tiwai@suse.de>); Fri, 02 Oct 2026 08:55:27 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 16/32] ALSA: es1938: Use auto-cleanup for probe card error handling
Date: Fri,  2 Oct 2026 10:54:54 +0200
Message-ID: <20261002085517.693510-17-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 350FE1FE48
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Instead of the manual call of snd_card_free_on_error(), use the
auto-cleanup feature.

Merely a code cleanup, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/es1938.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/pci/es1938.c b/sound/pci/es1938.c
index 217beb9376ac..a612368fd0b1 100644
--- a/sound/pci/es1938.c
+++ b/sound/pci/es1938.c
@@ -1683,11 +1683,11 @@ static int snd_es1938_mixer(struct es1938 *chip)
 }
        
 
-static int __snd_es1938_probe(struct pci_dev *pci,
-			      const struct pci_device_id *pci_id)
+static int snd_es1938_probe(struct pci_dev *pci,
+			    const struct pci_device_id *pci_id)
 {
 	static int dev;
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_free) = NULL;
 	struct es1938 *chip;
 	struct snd_opl3 *opl3;
 	int idx, err;
@@ -1759,16 +1759,11 @@ static int __snd_es1938_probe(struct pci_dev *pci,
 		return err;
 
 	pci_set_drvdata(pci, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	dev++;
 	return 0;
 }
 
-static int snd_es1938_probe(struct pci_dev *pci,
-			    const struct pci_device_id *pci_id)
-{
-	return snd_card_free_on_error(&pci->dev, __snd_es1938_probe(pci, pci_id));
-}
-
 static struct pci_driver es1938_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_es1938_ids,
-- 
2.55.0

