Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D220468C0C
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 08:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790931347; cv=none; b=aKzP9WB56OPv3dtznyxlYLDH7pnLWUKGjUdYGqT9DWZBii0ciwLiWXjiHkA3Nv/XJ8MXs9HVRdO/SBThKVbUpHmQX9UoagNQ0wwPYFZxVJWP+RENvh29Q6uRduWL2h4dPw82QzRytUJRgUo5iFOfaPYYOzUKyb1N0ESLDRYi/pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790931347; c=relaxed/simple;
	bh=Me8qca1VCX+4SkKVSafn9BFoF7RR9sYl9NIHTMi6BME=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hx8y7NrS6Yi2/GE95Z+aH0q78yCuNGgI7xncaKhl98D2HgNXA6sS0dVdwdLPQGg0PLT+n71zmxUAUC6JQYebFyLDKaBi2ZuVWy0UWUTCIeDqRK/T8SrnrcqZGgDswObpgCQ3wdk3xgRKb7mhP7HJVNjS9f5TDnt3AzumSRdwCOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ddu6/Ef0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rOJX+IXp; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HS3YkXuM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Sfuox6vw; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ddu6/Ef0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rOJX+IXp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HS3YkXuM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Sfuox6vw"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 619F41FE49;
	Fri,  2 Oct 2026 08:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931339; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jt/lEQqInTOubTH+w1P09hCWelhzv0H0hc0kp7ZlHWc=;
	b=Ddu6/Ef09RJp5E6FZ80YkVCHEttV2wOxi5j7oRxTshvPpUoDmb4k/3a/0r912JHzK8IdJm
	W6J47JVDjZCrC+YCHEVKLteD5KlvC/p4F2oWIKE1UMUmu/LYm2qe/5g5zdTM/yccTxfMn4
	s2+sASpjEg/1WfK0yP9THdwfznARdqc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931339;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jt/lEQqInTOubTH+w1P09hCWelhzv0H0hc0kp7ZlHWc=;
	b=rOJX+IXpT10EM8DfY4yF9UTc1osyMojgMQLxuDaE+aXjIY54kUuOSXkGfgyTaOoFMF31ms
	qTeaGUDBxn57VeBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=HS3YkXuM;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Sfuox6vw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931335; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jt/lEQqInTOubTH+w1P09hCWelhzv0H0hc0kp7ZlHWc=;
	b=HS3YkXuMg4wATDpyne8qqftz0bU1UjHiPQds7bgLjsCziUQk/I2OJlixnimAszKxlTjN4R
	l9t3tpBNLXRX6IYYlawOPt1yJhbBez/D//PjlWBVgYH9xst5eY5RaRP7ChpU8o7pLUC87e
	bKB3zoSHgHZ+CghQKqKdddppkQkpP60=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931335;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jt/lEQqInTOubTH+w1P09hCWelhzv0H0hc0kp7ZlHWc=;
	b=Sfuox6vwEGvpgppHYqxJTMuwGhMNDDgGCAOKj6BSHR/MSwlgBjiZydiZ1E9gj+EzI12UoU
	V4JTgr8kEIDG2lDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AFE9D13C0C;
	Fri,  2 Oct 2026 08:55:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HfPyB31xv2ppWAAAD6G6ig:T18
	(envelope-from <tiwai@suse.de>); Fri, 02 Oct 2026 08:55:27 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 17/32] ALSA: es1968: Use auto-cleanup for probe card error handling
Date: Fri,  2 Oct 2026 10:54:55 +0200
Message-ID: <20261002085517.693510-18-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 619F41FE49
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
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
 sound/pci/es1968.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/pci/es1968.c b/sound/pci/es1968.c
index f04628c8cbb7..b0abbea2a992 100644
--- a/sound/pci/es1968.c
+++ b/sound/pci/es1968.c
@@ -2692,11 +2692,11 @@ static int snd_es1968_create(struct snd_card *card,
 
 /*
  */
-static int __snd_es1968_probe(struct pci_dev *pci,
-			      const struct pci_device_id *pci_id)
+static int snd_es1968_probe(struct pci_dev *pci,
+			    const struct pci_device_id *pci_id)
 {
 	static int dev;
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_free) = NULL;
 	struct es1968 *chip;
 	unsigned int i;
 	int err;
@@ -2795,16 +2795,11 @@ static int __snd_es1968_probe(struct pci_dev *pci,
 	if (err < 0)
 		return err;
 	pci_set_drvdata(pci, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	dev++;
 	return 0;
 }
 
-static int snd_es1968_probe(struct pci_dev *pci,
-			    const struct pci_device_id *pci_id)
-{
-	return snd_card_free_on_error(&pci->dev, __snd_es1968_probe(pci, pci_id));
-}
-
 static struct pci_driver es1968_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_es1968_ids,
-- 
2.55.0

