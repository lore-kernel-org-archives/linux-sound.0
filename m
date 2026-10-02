Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AEC7469855
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 08:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790931357; cv=none; b=hIbL4t200iPYF6CMvSPQ1unWaMWLfc8MbjVAsWPLiaGK3YndGo9m9yTUOPTjC+20nJRNWgac42GDz7ab2hkNatZ7Mappk0V9A4CCu+M3HvKB6UZDEb4qtVIbFdhcQMLza2EvEN+UAbjV7eQGnHbSHRErix4B/XdZapU0PZh1/yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790931357; c=relaxed/simple;
	bh=Vn+xS663ZJ7PAiNI8b7asp2OylEHJXa+J6vQ0NXopK8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OzAwpTo4bv4L2W2gPJh5f253m6vT+90tUdKHgeyDWv7Q4gHxuhZUfh+6XxOZJRk+UW2/WZOBE6ClS/x3I00TOvwYR/MWBO/1yQox61kaylKtPMhIwqaU80rqwqEui5Z0krERGqMWo8ZkXzLg+kU3YvVy8oGPmLmxA8zcYSD6S4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Q82MidGr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Wdd64OEL; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dqP9ARyg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PSAjttmj; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Q82MidGr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Wdd64OEL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dqP9ARyg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PSAjttmj"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6264021E7C;
	Fri,  2 Oct 2026 08:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931347; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ulSukrvmGnssmlrOb8W+lOkjzWx/5WDVTdaXLS2irJ8=;
	b=Q82MidGr2DVAL73qXJjf6HCIZPQdg/vP3IUo+kZeTphjZFadE719QW7FE5gOxsh7F0HW7K
	fmx4bhKH3vbEdJMfp+8G635rThvO0Cjm/5ltoqJfht4LjzY9Dt3JT+NutB8HCSq17Q8KU4
	DSoQHxA/5Gmro2nclKrliEcj6eTCUWU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931347;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ulSukrvmGnssmlrOb8W+lOkjzWx/5WDVTdaXLS2irJ8=;
	b=Wdd64OEL+h9RYqkv9ksJy8R/tMfF5dqA6UoArVetH0WFSylm8y3oIq09aytaE3pGq8VhGm
	uz1SfQTFzjQyK1Bw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931343; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ulSukrvmGnssmlrOb8W+lOkjzWx/5WDVTdaXLS2irJ8=;
	b=dqP9ARygh2nsFt8gNLjXsZNMhUKbKg3fiNmh+qLnBYM/l+VtiIJDL8EfjmhnfSGdr9syJ1
	jPfjMvGaXrX9BExaWihl//r1bwcpgUTv2edYO9GqD+Pb2mxJFr0HTz9wLPezBrtdASHYWY
	QiecdoKWd6uZKq2nOM35gRt4QPkq0kw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931343;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ulSukrvmGnssmlrOb8W+lOkjzWx/5WDVTdaXLS2irJ8=;
	b=PSAjttmj9yB6JwTuSInT0tXb0yFeSubrDrko8GqaK2YD+0X2n7wodhapjp+t3UKklH7rM+
	IO63CFUfagiAC0Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6C5DC13C17;
	Fri,  2 Oct 2026 08:55:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HfPyB31xv2ppWAAAD6G6ig:T29
	(envelope-from <tiwai@suse.de>); Fri, 02 Oct 2026 08:55:29 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 28/32] ALSA: sonicbibes: Use auto-cleanup for probe card error handling
Date: Fri,  2 Oct 2026 10:55:06 +0200
Message-ID: <20261002085517.693510-29-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
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
 sound/pci/sonicvibes.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/pci/sonicvibes.c b/sound/pci/sonicvibes.c
index a885d544acd6..b5bb20440c6e 100644
--- a/sound/pci/sonicvibes.c
+++ b/sound/pci/sonicvibes.c
@@ -1362,11 +1362,11 @@ static int snd_sonicvibes_midi(struct sonicvibes *sonic,
 	return 0;
 }
 
-static int __snd_sonic_probe(struct pci_dev *pci,
-			     const struct pci_device_id *pci_id)
+static int snd_sonic_probe(struct pci_dev *pci,
+			   const struct pci_device_id *pci_id)
 {
 	static int dev;
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_free) = NULL;
 	struct sonicvibes *sonic;
 	struct snd_rawmidi *midi_uart;
 	struct snd_opl3 *opl3;
@@ -1430,16 +1430,11 @@ static int __snd_sonic_probe(struct pci_dev *pci,
 		return err;
 	
 	pci_set_drvdata(pci, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	dev++;
 	return 0;
 }
 
-static int snd_sonic_probe(struct pci_dev *pci,
-			   const struct pci_device_id *pci_id)
-{
-	return snd_card_free_on_error(&pci->dev, __snd_sonic_probe(pci, pci_id));
-}
-
 static struct pci_driver sonicvibes_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_sonic_ids,
-- 
2.55.0

