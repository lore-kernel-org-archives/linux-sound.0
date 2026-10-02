Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB08446A5EC
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 08:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790931354; cv=none; b=d8SCAhE/o5HJtPYuokW9bprDPMtTTv9RMnzUoWUyheidjbgzLwqhXHrIwvRIO/W1O3W1vS0RG4XKgau13Yd6lLIdTYzA0VoX+zo+92f+8kNjlpT4C65kp5uiUJP5MQoweBEVI8z5Zw89o3AOqOgH7QJPOMRNs1mDaSNzCKE+Ar8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790931354; c=relaxed/simple;
	bh=npgNNW2fD0Tto/gZXW4Mkq12AJlzb6vQKtl6ZLCc9Zw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ImNRhNokLJOXQuUYMCFpex2+6JmCrnN76nfJUx2NUSPO3MQ8iuUMtgb9I1pmf/rFPY0dJi4p9DTBcwXY+xDtVZft83JgeHdtIK+WKsA4fTu9veLovyq/9o5hexYYsRgpxL+6hoQJK4GoSe+0XQ6rM/bDm0tXpmwYhID4Fdayl+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FiU05bAz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AtL4qXOg; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=x7/D5yh1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BIqP3nhc; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FiU05bAz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AtL4qXOg";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="x7/D5yh1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BIqP3nhc"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 18D121FE3F;
	Fri,  2 Oct 2026 08:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931347; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GkPy3ViM1rYiXXHsqo4wTK188jGct48gbuwwiOz3qUs=;
	b=FiU05bAzef1VgDVEp4dHSyu8VAnJcrBvOe9dgj/G6UVnH+f3pMm93fZBoKBvw3Xjvh/8bS
	3otT+2frBX/ukSdVI+1cta26xwc09451kJ+ftPU8keV1x4GEWXIsWIh4GfBi7luzqpzIAa
	7KXjcPaMa1T47i370tNqf2o7N87HJz4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931347;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GkPy3ViM1rYiXXHsqo4wTK188jGct48gbuwwiOz3qUs=;
	b=AtL4qXOgwYskk8R0WQbYOSO4dyWTYmJTSOCzzXmkRjwNJm/3FcFeEI9FEm4lfnF5k+EGBV
	RzFCbPKrhXwuRzCQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="x7/D5yh1";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=BIqP3nhc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931343; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GkPy3ViM1rYiXXHsqo4wTK188jGct48gbuwwiOz3qUs=;
	b=x7/D5yh1SgsPoEXZHS9g1NxZZNP4qb/UQ9Ebcaa1HKYZKnxHnm7XRhtUKhXCdMb66wLcIY
	OJKA6oILbqWO69u4rlYiA8dTO1N7NMtgiuqRZvn9GDfJ2X+E3ieX1WYXMgqhP5clkE1Zc4
	4o7Vgqq/s2b1tzuNt0KHpxG3Z67p+Xc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931343;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GkPy3ViM1rYiXXHsqo4wTK188jGct48gbuwwiOz3qUs=;
	b=BIqP3nhcaksH0ygFJzDG2XIvzZY6X0UEMlgny2qSCwDKQvNzvk4qN6rqpmiQZIBNnBIbHK
	iRxhAy8hdxdB+xCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A979713C12;
	Fri,  2 Oct 2026 08:55:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HfPyB31xv2ppWAAAD6G6ig:T24
	(envelope-from <tiwai@suse.de>); Fri, 02 Oct 2026 08:55:28 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 23/32] ALSA: oxygen: Use auto-cleanup for probe card error handling
Date: Fri,  2 Oct 2026 10:55:01 +0200
Message-ID: <20261002085517.693510-24-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 18D121FE3F
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
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
 sound/pci/oxygen/oxygen_lib.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/sound/pci/oxygen/oxygen_lib.c b/sound/pci/oxygen/oxygen_lib.c
index 6b096d654f9f..587785d5451b 100644
--- a/sound/pci/oxygen/oxygen_lib.c
+++ b/sound/pci/oxygen/oxygen_lib.c
@@ -572,7 +572,7 @@ static void oxygen_card_free(struct snd_card *card)
 	mutex_destroy(&chip->mutex);
 }
 
-static int __oxygen_pci_probe(struct pci_dev *pci, int index, char *id,
+int oxygen_pci_probe(struct pci_dev *pci, int index, char *id,
 		     struct module *owner,
 		     const struct pci_device_id *ids,
 		     int (*get_model)(struct oxygen *chip,
@@ -580,7 +580,7 @@ static int __oxygen_pci_probe(struct pci_dev *pci, int index, char *id,
 				     )
 		    )
 {
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_free) = NULL;
 	struct oxygen *chip;
 	const struct pci_device_id *pci_id;
 	int err;
@@ -695,18 +695,9 @@ static int __oxygen_pci_probe(struct pci_dev *pci, int index, char *id,
 		return err;
 
 	pci_set_drvdata(pci, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	return 0;
 }
-
-int oxygen_pci_probe(struct pci_dev *pci, int index, char *id,
-		     struct module *owner,
-		     const struct pci_device_id *ids,
-		     int (*get_model)(struct oxygen *chip,
-				      const struct pci_device_id *id))
-{
-	return snd_card_free_on_error(&pci->dev,
-				      __oxygen_pci_probe(pci, index, id, owner, ids, get_model));
-}
 EXPORT_SYMBOL(oxygen_pci_probe);
 
 static int oxygen_pci_suspend(struct device *dev)
-- 
2.55.0

