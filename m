Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E13E2D5A19
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142206; cv=none; b=eflpijl0kHnb4Mi8/0GwSP1oOXwoAjPWqAo8D/dYPkm8Q5oGNZclR1QkV75gLWR9dSOpAoyICipnZ5Xm/NsaYtpen5CroiT2sVaSDj6QPn4C8YKYaTKxJbUZdw0XYZuusIEi3ZIwdieHI2Cw9QZHdvu8OP3YQspV3B5wgzl2dkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142206; c=relaxed/simple;
	bh=aNO6uZAN327wr5FhJj1HQ7ln/+PNUT1LCeALQ9XpWQ0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tVI+RkDIXzuQCpuEgGWtNfD/L+hhlgM/ic5xcRKfohi1RwRcBDWOp6y08ecaZzOA0pbl3eSCgaP3C0EnDS+P33oon6zH7vbfpqOXJ0tNuyn5UKf8c3ilV1tiJDn07R4Ipubv5qj6LGEBf9IaVQWBfPbL7y578v4H1lUZCyyzMts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VnEhUjGk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Mz+N44I1; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VnEhUjGk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Mz+N44I1; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VnEhUjGk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Mz+N44I1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VnEhUjGk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Mz+N44I1"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5575721195;
	Thu, 10 Jul 2025 10:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142061; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kj4cqO7VrD94CodI4OUTN1WkBdsKfBHhy6VSzUgG5IQ=;
	b=VnEhUjGk68C5KauFeqn15NfgbUgQjQQ449ZL87BHb8g0MoO2PLN1Ymgy2nAgWymfGnOyR4
	EKIcjiE6jPVPRj47HvYVbojp/ru7aHBk37WgXvakX/Vz5t+ZfOc63ihcTGp1lCJ0kXyfv5
	z52DuX35Jqyqox8FWuw4K3+EHuY6N2c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142061;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kj4cqO7VrD94CodI4OUTN1WkBdsKfBHhy6VSzUgG5IQ=;
	b=Mz+N44I1tRBOb5aXDHIQpES8tHrEG+4l9/xJpBVHxe/Wb8Zt+uwOD6gicKR1xm/k6+aPaV
	T5N1LQ/UX4UuADAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142061; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kj4cqO7VrD94CodI4OUTN1WkBdsKfBHhy6VSzUgG5IQ=;
	b=VnEhUjGk68C5KauFeqn15NfgbUgQjQQ449ZL87BHb8g0MoO2PLN1Ymgy2nAgWymfGnOyR4
	EKIcjiE6jPVPRj47HvYVbojp/ru7aHBk37WgXvakX/Vz5t+ZfOc63ihcTGp1lCJ0kXyfv5
	z52DuX35Jqyqox8FWuw4K3+EHuY6N2c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142061;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kj4cqO7VrD94CodI4OUTN1WkBdsKfBHhy6VSzUgG5IQ=;
	b=Mz+N44I1tRBOb5aXDHIQpES8tHrEG+4l9/xJpBVHxe/Wb8Zt+uwOD6gicKR1xm/k6+aPaV
	T5N1LQ/UX4UuADAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3C81D136DC;
	Thu, 10 Jul 2025 10:07:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eCiiDe2Qb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:41 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 034/103] ALSA: opti9xx: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:06:16 +0200
Message-ID: <20250710100727.22653-35-tiwai@suse.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250710100727.22653-1-tiwai@suse.de>
References: <20250710100727.22653-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

Use a safer function strscpy() instead of strcpy() for copying to
arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/opti9xx/miro.c           |  8 ++++----
 sound/isa/opti9xx/opti92x-ad1848.c | 18 +++++++++---------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/sound/isa/opti9xx/miro.c b/sound/isa/opti9xx/miro.c
index 31d736d1dd10..ad7180d7c0c2 100644
--- a/sound/isa/opti9xx/miro.c
+++ b/sound/isa/opti9xx/miro.c
@@ -718,10 +718,10 @@ static int snd_miro_mixer(struct snd_card *card,
 
 	switch (miro->hardware) {
 	case OPTi9XX_HW_82C924:
-		strcpy(card->mixername, "ACI & OPTi924");
+		strscpy(card->mixername, "ACI & OPTi924");
 		break;
 	case OPTi9XX_HW_82C929:
-		strcpy(card->mixername, "ACI & OPTi929");
+		strscpy(card->mixername, "ACI & OPTi929");
 		break;
 	default:
 		snd_BUG();
@@ -779,7 +779,7 @@ static int snd_miro_init(struct snd_miro *chip,
 	static const int opti9xx_mc_size[] = {7, 7, 10, 10, 2, 2, 2};
 
 	chip->hardware = hardware;
-	strcpy(chip->name, snd_opti9xx_names[hardware]);
+	strscpy(chip->name, snd_opti9xx_names[hardware]);
 
 	chip->mc_base_size = opti9xx_mc_size[hardware];  
 
@@ -1351,7 +1351,7 @@ static int snd_miro_probe(struct snd_card *card)
 		sprintf(card->shortname, "unknown Cardinal Technologies");
 	}
 
-	strcpy(card->driver, "miro");
+	strscpy(card->driver, "miro");
 	scnprintf(card->longname, sizeof(card->longname),
 		  "%s: OPTi%s, %s at 0x%lx, irq %d, dma %d&%d",
 		  card->shortname, miro->name, codec->pcm->name,
diff --git a/sound/isa/opti9xx/opti92x-ad1848.c b/sound/isa/opti9xx/opti92x-ad1848.c
index a07a665d93dc..328d043a1619 100644
--- a/sound/isa/opti9xx/opti92x-ad1848.c
+++ b/sound/isa/opti9xx/opti92x-ad1848.c
@@ -171,7 +171,7 @@ static int snd_opti9xx_init(struct snd_opti9xx *chip,
 	static const int opti9xx_mc_size[] = {7, 7, 10, 10, 2, 2, 2};
 
 	chip->hardware = hardware;
-	strcpy(chip->name, snd_opti9xx_names[hardware]);
+	strscpy(chip->name, snd_opti9xx_names[hardware]);
 
 	spin_lock_init(&chip->lock);
 
@@ -594,35 +594,35 @@ static int snd_opti93x_mixer(struct snd_wss *chip)
 
 	card = chip->card;
 
-	strcpy(card->mixername, chip->pcm->name);
+	strscpy(card->mixername, chip->pcm->name);
 
 	memset(&id1, 0, sizeof(id1));
 	memset(&id2, 0, sizeof(id2));
 	id1.iface = id2.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
 	/* reassign AUX0 switch to CD */
-	strcpy(id1.name, "Aux Playback Switch");
-	strcpy(id2.name, "CD Playback Switch");
+	strscpy(id1.name, "Aux Playback Switch");
+	strscpy(id2.name, "CD Playback Switch");
 	err = snd_ctl_rename_id(card, &id1, &id2);
 	if (err < 0) {
 		dev_err(card->dev, "Cannot rename opti93x control\n");
 		return err;
 	}
 	/* reassign AUX1 switch to FM */
-	strcpy(id1.name, "Aux Playback Switch"); id1.index = 1;
-	strcpy(id2.name, "FM Playback Switch");
+	strscpy(id1.name, "Aux Playback Switch"); id1.index = 1;
+	strscpy(id2.name, "FM Playback Switch");
 	err = snd_ctl_rename_id(card, &id1, &id2);
 	if (err < 0) {
 		dev_err(card->dev, "Cannot rename opti93x control\n");
 		return err;
 	}
 	/* remove AUX1 volume */
-	strcpy(id1.name, "Aux Playback Volume"); id1.index = 1;
+	strscpy(id1.name, "Aux Playback Volume"); id1.index = 1;
 	snd_ctl_remove_id(card, &id1);
 
 	/* Replace WSS volume controls with OPTi93x volume controls */
 	id1.index = 0;
 	for (idx = 0; idx < ARRAY_SIZE(snd_opti93x_controls); idx++) {
-		strcpy(id1.name, snd_opti93x_controls[idx].name);
+		strscpy(id1.name, snd_opti93x_controls[idx].name);
 		snd_ctl_remove_id(card, &id1);
 
 		err = snd_ctl_add(card,
@@ -857,7 +857,7 @@ static int snd_opti9xx_probe(struct snd_card *card)
 #endif
 	chip->irq = irq;
 	card->sync_irq = chip->irq;
-	strcpy(card->driver, chip->name);
+	strscpy(card->driver, chip->name);
 	sprintf(card->shortname, "OPTi %s", card->driver);
 #if defined(CS4231) || defined(OPTi93X)
 	scnprintf(card->longname, sizeof(card->longname),
-- 
2.50.0

