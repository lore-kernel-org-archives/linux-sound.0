Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DA32D6612
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142322; cv=none; b=mKiHIfcNqMN6Y5M2aMcj8DruOo1XZKOTfSEKClxTJOEGrZE2N32K05gLEQw9WsdKUrQLlE5KammjAz5VQHFwDyEZAye2+R6kQvkdMfT40bqkz8Qw9fFXcI4FEu0MiQ0VZFdWmuoaM13NyqrtJmKpceX4tmmvHa1kwm4hUQlMpgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142322; c=relaxed/simple;
	bh=mOnE4zz1VR3wqISP3Z7WDyM0TUfq1TuKwnQVSrzrbPA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nNs+fMGuuhF7JcYxKAC90vLGycaTKQKYBm7srN7xPNyQAd5jou17qMpWs7D0SCUjxv89BU/o9gMfDIJg63lbJfcbE3tzcw5dBGrTm+nsVbN54yiskqBXSC70OnqVUHxWqboLND6yOuKLuYw70LR00hRLJ9z6XSAjrH/NEDtyeD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iugpvEVE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Kqsfe2gt; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iugpvEVE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Kqsfe2gt; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iugpvEVE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Kqsfe2gt";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iugpvEVE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Kqsfe2gt"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DA6CC211AA;
	Thu, 10 Jul 2025 10:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142065; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QhZAA7Oh13bWuDR5A1JTKbgkqaM2OBlXAJwMGOB58ng=;
	b=iugpvEVESlxWRO6E7pBRgiTcCpRWEgmdCy9qHX50sFRC7NJpTMXqpPoYLojguzsL3pVXG8
	pY2aRra4A7foG30nCTcchGRlML+duIh52pl44u0/7xK8Fdl0LjCHRSanobIcYjmFP8zT7t
	jMi2/VK7+5dBUIZorP3RhW3pNyzr7zM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142065;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QhZAA7Oh13bWuDR5A1JTKbgkqaM2OBlXAJwMGOB58ng=;
	b=Kqsfe2gtfJCoMAAZcLTBT/fY/Ie50RLI5unF+ivhsxoTTLnMxh4gNZrE4HUUeZp5H4ryN1
	x3G96mjOJtUOY0BQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142065; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QhZAA7Oh13bWuDR5A1JTKbgkqaM2OBlXAJwMGOB58ng=;
	b=iugpvEVESlxWRO6E7pBRgiTcCpRWEgmdCy9qHX50sFRC7NJpTMXqpPoYLojguzsL3pVXG8
	pY2aRra4A7foG30nCTcchGRlML+duIh52pl44u0/7xK8Fdl0LjCHRSanobIcYjmFP8zT7t
	jMi2/VK7+5dBUIZorP3RhW3pNyzr7zM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142065;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QhZAA7Oh13bWuDR5A1JTKbgkqaM2OBlXAJwMGOB58ng=;
	b=Kqsfe2gtfJCoMAAZcLTBT/fY/Ie50RLI5unF+ivhsxoTTLnMxh4gNZrE4HUUeZp5H4ryN1
	x3G96mjOJtUOY0BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BED6A136DC;
	Thu, 10 Jul 2025 10:07:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ALRLLfGQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:45 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 068/103] ALSA: intel8x0: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:06:50 +0200
Message-ID: <20250710100727.22653-69-tiwai@suse.de>
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
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLsqo7dymd5dgmoaprf5rep8is)];
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
 sound/pci/intel8x0.c  | 14 +++++++-------
 sound/pci/intel8x0m.c | 10 +++++-----
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/sound/pci/intel8x0.c b/sound/pci/intel8x0.c
index b521cec20333..9e6a5065ffbf 100644
--- a/sound/pci/intel8x0.c
+++ b/sound/pci/intel8x0.c
@@ -1436,7 +1436,7 @@ static int snd_intel8x0_pcm1(struct intel8x0 *chip, int device,
 	if (rec->suffix)
 		sprintf(name, "Intel ICH - %s", rec->suffix);
 	else
-		strcpy(name, "Intel ICH");
+		strscpy(name, "Intel ICH");
 	err = snd_pcm_new(chip->card, name, device,
 			  rec->playback_ops ? 1 : 0,
 			  rec->capture_ops ? 1 : 0, &pcm);
@@ -1453,7 +1453,7 @@ static int snd_intel8x0_pcm1(struct intel8x0 *chip, int device,
 	if (rec->suffix)
 		sprintf(pcm->name, "%s - %s", chip->card->shortname, rec->suffix);
 	else
-		strcpy(pcm->name, chip->card->shortname);
+		strscpy(pcm->name, chip->card->shortname);
 	chip->pcm[device] = pcm;
 
 	snd_pcm_set_managed_buffer_all(pcm, intel8x0_dma_type(chip),
@@ -3118,21 +3118,21 @@ static int __snd_intel8x0_probe(struct pci_dev *pci,
 	if (spdif_aclink < 0)
 		spdif_aclink = check_default_spdif_aclink(pci);
 
-	strcpy(card->driver, "ICH");
+	strscpy(card->driver, "ICH");
 	if (!spdif_aclink) {
 		switch (pci_id->driver_data) {
 		case DEVICE_NFORCE:
-			strcpy(card->driver, "NFORCE");
+			strscpy(card->driver, "NFORCE");
 			break;
 		case DEVICE_INTEL_ICH4:
-			strcpy(card->driver, "ICH4");
+			strscpy(card->driver, "ICH4");
 		}
 	}
 
-	strcpy(card->shortname, "Intel ICH");
+	strscpy(card->shortname, "Intel ICH");
 	for (name = shortnames; name->id; name++) {
 		if (pci->device == name->id) {
-			strcpy(card->shortname, name->s);
+			strscpy(card->shortname, name->s);
 			break;
 		}
 	}
diff --git a/sound/pci/intel8x0m.c b/sound/pci/intel8x0m.c
index 1ce775fe8a70..9e5988583abe 100644
--- a/sound/pci/intel8x0m.c
+++ b/sound/pci/intel8x0m.c
@@ -678,7 +678,7 @@ static int snd_intel8x0m_pcm1(struct intel8x0m *chip, int device,
 	if (rec->suffix)
 		sprintf(name, "Intel ICH - %s", rec->suffix);
 	else
-		strcpy(name, "Intel ICH");
+		strscpy(name, "Intel ICH");
 	err = snd_pcm_new(chip->card, name, device,
 			  rec->playback_ops ? 1 : 0,
 			  rec->capture_ops ? 1 : 0, &pcm);
@@ -696,7 +696,7 @@ static int snd_intel8x0m_pcm1(struct intel8x0m *chip, int device,
 	if (rec->suffix)
 		sprintf(pcm->name, "%s - %s", chip->card->shortname, rec->suffix);
 	else
-		strcpy(pcm->name, chip->card->shortname);
+		strscpy(pcm->name, chip->card->shortname);
 	chip->pcm[device] = pcm;
 
 	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
@@ -1184,11 +1184,11 @@ static int __snd_intel8x0m_probe(struct pci_dev *pci,
 		return err;
 	chip = card->private_data;
 
-	strcpy(card->driver, "ICH-MODEM");
-	strcpy(card->shortname, "Intel ICH");
+	strscpy(card->driver, "ICH-MODEM");
+	strscpy(card->shortname, "Intel ICH");
 	for (name = shortnames; name->id; name++) {
 		if (pci->device == name->id) {
-			strcpy(card->shortname, name->s);
+			strscpy(card->shortname, name->s);
 			break;
 		}
 	}
-- 
2.50.0

