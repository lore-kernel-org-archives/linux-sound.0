Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEAD52D59EA
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142104; cv=none; b=QDwj22xw3H4Ak/UPmBTwo7FvH3bOaybrElxP6KnkriOCzE4In5RVBujRveYEYjNtM6nJejqWoXAWtlidmSZwWf7E9Z8nGKZ9+v2u2WGAnHKd+g+1hACmuqhA6A/zUf/9xUvlePHWSOdIw+L4268mdvPhE5/t4at6wOtSbteO4k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142104; c=relaxed/simple;
	bh=FgSn06xLMMqF70RCyLFXbPC9lRTphEXfmiLSQ+t7r+o=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gQXZ/31GyB5rGdrKN7oRSVdzu7o0QXcoKLHwiIEH/J+ewX4vc4cb/lDDs+upHrbIw8UAb/SIHo/+Duq7EOuFBqf4AFJqTHKjRBBEpi442vE+G5LDeGP2DrdNGAvBUhph7hRZA2YQL10XGWaHQg0mBmfpSm6VuJxmYGLWRDkP9lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=E3DOV7Nh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=P7zjaFiR; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=E3DOV7Nh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=P7zjaFiR; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="E3DOV7Nh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="P7zjaFiR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="E3DOV7Nh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="P7zjaFiR"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 263481F456;
	Thu, 10 Jul 2025 10:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142060; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OduU9Hs08kCrKvIQ1A65xTy7jYoth9tsiW9FM/8qsjM=;
	b=E3DOV7NhQ9A4RhRhLmkrdV8zotf4ddvj8hgJ4f+GioVoQuLl9+aXdfOPo9OF+d+Ip2mu23
	PmYfulGneLkUi4RWhMgWdPC2yzHGlAR9o66QnSJVA0HWTdP1XFSpjugvkLGjNf8Z6dZWGU
	zo0xq/91zcsNx+nLZPjRpt/Oqe2n2Ek=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142060;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OduU9Hs08kCrKvIQ1A65xTy7jYoth9tsiW9FM/8qsjM=;
	b=P7zjaFiRH3ypca7TBP1rwJipjC4Y0KbOLGdiyuE6T0ELolQJtMcuDDIlp2Ai1XhtFHUvIC
	YZGsrAOxTSTQ6ADA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142060; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OduU9Hs08kCrKvIQ1A65xTy7jYoth9tsiW9FM/8qsjM=;
	b=E3DOV7NhQ9A4RhRhLmkrdV8zotf4ddvj8hgJ4f+GioVoQuLl9+aXdfOPo9OF+d+Ip2mu23
	PmYfulGneLkUi4RWhMgWdPC2yzHGlAR9o66QnSJVA0HWTdP1XFSpjugvkLGjNf8Z6dZWGU
	zo0xq/91zcsNx+nLZPjRpt/Oqe2n2Ek=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142060;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OduU9Hs08kCrKvIQ1A65xTy7jYoth9tsiW9FM/8qsjM=;
	b=P7zjaFiRH3ypca7TBP1rwJipjC4Y0KbOLGdiyuE6T0ELolQJtMcuDDIlp2Ai1XhtFHUvIC
	YZGsrAOxTSTQ6ADA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0C61E13A70;
	Thu, 10 Jul 2025 10:07:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OILBAeyQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:40 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 025/103] ALSA: cmi8328: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:06:07 +0200
Message-ID: <20250710100727.22653-26-tiwai@suse.de>
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
X-Spam-Level: 
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

Use a safer function strscpy() instead of strcpy() for copying to
arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/cmi8328.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/isa/cmi8328.c b/sound/isa/cmi8328.c
index d30cce4cc7e3..4e6d823af103 100644
--- a/sound/isa/cmi8328.c
+++ b/sound/isa/cmi8328.c
@@ -155,34 +155,34 @@ static int snd_cmi8328_mixer(struct snd_wss *chip)
 	memset(&id2, 0, sizeof(id2));
 	id1.iface = id2.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
 	/* rename AUX0 switch to CD */
-	strcpy(id1.name, "Aux Playback Switch");
-	strcpy(id2.name, "CD Playback Switch");
+	strscpy(id1.name, "Aux Playback Switch");
+	strscpy(id2.name, "CD Playback Switch");
 	err = snd_ctl_rename_id(card, &id1, &id2);
 	if (err < 0) {
 		dev_err(card->dev, "error renaming control\n");
 		return err;
 	}
 	/* rename AUX0 volume to CD */
-	strcpy(id1.name, "Aux Playback Volume");
-	strcpy(id2.name, "CD Playback Volume");
+	strscpy(id1.name, "Aux Playback Volume");
+	strscpy(id2.name, "CD Playback Volume");
 	err = snd_ctl_rename_id(card, &id1, &id2);
 	if (err < 0) {
 		dev_err(card->dev, "error renaming control\n");
 		return err;
 	}
 	/* rename AUX1 switch to Synth */
-	strcpy(id1.name, "Aux Playback Switch");
+	strscpy(id1.name, "Aux Playback Switch");
 	id1.index = 1;
-	strcpy(id2.name, "Synth Playback Switch");
+	strscpy(id2.name, "Synth Playback Switch");
 	err = snd_ctl_rename_id(card, &id1, &id2);
 	if (err < 0) {
 		dev_err(card->dev, "error renaming control\n");
 		return err;
 	}
 	/* rename AUX1 volume to Synth */
-	strcpy(id1.name, "Aux Playback Volume");
+	strscpy(id1.name, "Aux Playback Volume");
 	id1.index = 1;
-	strcpy(id2.name, "Synth Playback Volume");
+	strscpy(id2.name, "Synth Playback Volume");
 	err = snd_ctl_rename_id(card, &id1, &id2);
 	if (err < 0) {
 		dev_err(card->dev, "error renaming control\n");
@@ -362,8 +362,8 @@ static int snd_cmi8328_probe(struct device *pdev, unsigned int ndev)
 		if (snd_opl3_hwdep_new(opl3, 0, 1, NULL) < 0)
 			dev_warn(pdev, "error initializing OPL3 hwdep\n");
 
-	strcpy(card->driver, "CMI8328");
-	strcpy(card->shortname, "C-Media CMI8328");
+	strscpy(card->driver, "CMI8328");
+	strscpy(card->shortname, "C-Media CMI8328");
 	sprintf(card->longname, "%s at 0x%lx, irq %d, dma %d,%d",
 		card->shortname, cmi->wss->port, irq[ndev], dma1[ndev],
 		(dma2[ndev] >= 0) ? dma2[ndev] : dma1[ndev]);
-- 
2.50.0

