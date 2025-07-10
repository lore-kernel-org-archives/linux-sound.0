Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A145B2D6403
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142291; cv=none; b=WxGsnYjHU2tyO1gfTbfTYd2Y8rWFNjRzpLYNLFvgG/vcxU0hK+QsKC7ImKr/1Ht1vJKxABzBKLN1QJ/0RBUuzuPuTy0qht+KaSU/foxAYhY+TyU+DmF5LruyOjQFDfiKUqJ2NjCq4RPNnmj8EVFz6yqIzH9DBfj0bvJKSlY1Qjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142291; c=relaxed/simple;
	bh=cBj/r4oBY3qtCnfgLkgN2+VCP7IOd5NgpTkX/yshA30=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t8VLH9T3CFx/kChf1NVdZe9yzQ2Z0PeSkGxCmVB5accdUpvwRL9yRUQKYrAac3fEN577vvrimNm7tpY7eOFJgS7jeVlcqSn+TYjgp0wGOzf2PJ+pPEIEh0+dPFBaWe3KHFa1T0bTn09+Dr2PdX2kcXwnQlwIRqvKujGEeEJkk1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ArKEmcLF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2Jw0I/gH; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ArKEmcLF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2Jw0I/gH; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ArKEmcLF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2Jw0I/gH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ArKEmcLF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2Jw0I/gH"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 079281F785;
	Thu, 10 Jul 2025 10:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142069; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cel6z5YjQIs3aPLVg+pULRznQdW28uMf+lxiAP04dI8=;
	b=ArKEmcLFBiulJ3lCiDEyWJ/7pSuhpimb68dWuPYEgeGIIdothFTuJ/kAnSmUH/dNT/bG/D
	uPnXIcDqwqbZZ8oFYuU2M6iDCIavSTvLswTTleT19mnajjmJThFx0hxt36/SL/oLh/y9LN
	XgksrXXJ8T7IyUsAgvR8/4NXoZlAt2c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142069;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cel6z5YjQIs3aPLVg+pULRznQdW28uMf+lxiAP04dI8=;
	b=2Jw0I/gHbhEq7JN9Y4vKlzZWkoADQc11I295Bgfhdui/01L2HSEXHIcJT86vLDPUPJ4GxF
	yKWgGWf4kOJjytBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ArKEmcLF;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="2Jw0I/gH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142069; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cel6z5YjQIs3aPLVg+pULRznQdW28uMf+lxiAP04dI8=;
	b=ArKEmcLFBiulJ3lCiDEyWJ/7pSuhpimb68dWuPYEgeGIIdothFTuJ/kAnSmUH/dNT/bG/D
	uPnXIcDqwqbZZ8oFYuU2M6iDCIavSTvLswTTleT19mnajjmJThFx0hxt36/SL/oLh/y9LN
	XgksrXXJ8T7IyUsAgvR8/4NXoZlAt2c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142069;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cel6z5YjQIs3aPLVg+pULRznQdW28uMf+lxiAP04dI8=;
	b=2Jw0I/gHbhEq7JN9Y4vKlzZWkoADQc11I295Bgfhdui/01L2HSEXHIcJT86vLDPUPJ4GxF
	yKWgGWf4kOJjytBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E0FBC136DC;
	Thu, 10 Jul 2025 10:07:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2EMTNfSQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:48 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 090/103] ALSA: ppc: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:07:12 +0200
Message-ID: <20250710100727.22653-91-tiwai@suse.de>
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
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim,suse.de:email];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLe1mc1hwayk397878n5a1j337)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 079281F785
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Use a safer function strscpy() instead of strcpy() for copying to
arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/ppc/awacs.c    | 2 +-
 sound/ppc/burgundy.c | 2 +-
 sound/ppc/daca.c     | 2 +-
 sound/ppc/pmac.c     | 2 +-
 sound/ppc/powermac.c | 8 ++++----
 sound/ppc/snd_ps3.c  | 8 ++++----
 6 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/sound/ppc/awacs.c b/sound/ppc/awacs.c
index 49399a4a290d..13a6f3af13ef 100644
--- a/sound/ppc/awacs.c
+++ b/sound/ppc/awacs.c
@@ -956,7 +956,7 @@ snd_pmac_awacs_init(struct snd_pmac *chip)
 	/*
 	 * build mixers
 	 */
-	strcpy(chip->card->mixername, "PowerMac AWACS");
+	strscpy(chip->card->mixername, "PowerMac AWACS");
 
 	err = build_mixers(chip, ARRAY_SIZE(snd_pmac_awacs_mixers),
 				snd_pmac_awacs_mixers);
diff --git a/sound/ppc/burgundy.c b/sound/ppc/burgundy.c
index 400a886562b1..ba15bc34c9ec 100644
--- a/sound/ppc/burgundy.c
+++ b/sound/ppc/burgundy.c
@@ -665,7 +665,7 @@ int snd_pmac_burgundy_init(struct snd_pmac *chip)
 	/*
 	 * build burgundy mixers
 	 */
-	strcpy(chip->card->mixername, "PowerMac Burgundy");
+	strscpy(chip->card->mixername, "PowerMac Burgundy");
 
 	for (i = 0; i < ARRAY_SIZE(snd_pmac_burgundy_mixers); i++) {
 		err = snd_ctl_add(chip->card,
diff --git a/sound/ppc/daca.c b/sound/ppc/daca.c
index d5766952f3db..a74114225b67 100644
--- a/sound/ppc/daca.c
+++ b/sound/ppc/daca.c
@@ -261,7 +261,7 @@ int snd_pmac_daca_init(struct snd_pmac *chip)
 	/*
 	 * build mixers
 	 */
-	strcpy(chip->card->mixername, "PowerMac DACA");
+	strscpy(chip->card->mixername, "PowerMac DACA");
 
 	for (i = 0; i < ARRAY_SIZE(daca_mixers); i++) {
 		err = snd_ctl_add(chip->card, snd_ctl_new1(&daca_mixers[i], chip));
diff --git a/sound/ppc/pmac.c b/sound/ppc/pmac.c
index 76674c43fa7e..a3d346f1cc05 100644
--- a/sound/ppc/pmac.c
+++ b/sound/ppc/pmac.c
@@ -679,7 +679,7 @@ int snd_pmac_pcm_new(struct snd_pmac *chip)
 
 	pcm->private_data = chip;
 	pcm->info_flags = SNDRV_PCM_INFO_JOINT_DUPLEX;
-	strcpy(pcm->name, chip->card->shortname);
+	strscpy(pcm->name, chip->card->shortname);
 	chip->pcm = pcm;
 
 	chip->formats_ok = SNDRV_PCM_FMTBIT_S16_BE;
diff --git a/sound/ppc/powermac.c b/sound/ppc/powermac.c
index f1b0cf9ea555..e685d245883e 100644
--- a/sound/ppc/powermac.c
+++ b/sound/ppc/powermac.c
@@ -55,8 +55,8 @@ static int snd_pmac_probe(struct platform_device *devptr)
 
 	switch (chip->model) {
 	case PMAC_BURGUNDY:
-		strcpy(card->driver, "PMac Burgundy");
-		strcpy(card->shortname, "PowerMac Burgundy");
+		strscpy(card->driver, "PMac Burgundy");
+		strscpy(card->shortname, "PowerMac Burgundy");
 		sprintf(card->longname, "%s (Dev %d) Sub-frame %d",
 			card->shortname, chip->device_id, chip->subframe);
 		err = snd_pmac_burgundy_init(chip);
@@ -64,8 +64,8 @@ static int snd_pmac_probe(struct platform_device *devptr)
 			goto __error;
 		break;
 	case PMAC_DACA:
-		strcpy(card->driver, "PMac DACA");
-		strcpy(card->shortname, "PowerMac DACA");
+		strscpy(card->driver, "PMac DACA");
+		strscpy(card->shortname, "PowerMac DACA");
 		sprintf(card->longname, "%s (Dev %d) Sub-frame %d",
 			card->shortname, chip->device_id, chip->subframe);
 		err = snd_pmac_daca_init(chip);
diff --git a/sound/ppc/snd_ps3.c b/sound/ppc/snd_ps3.c
index a6cff2c46ac7..ce7ee2713f9d 100644
--- a/sound/ppc/snd_ps3.c
+++ b/sound/ppc/snd_ps3.c
@@ -951,9 +951,9 @@ static int snd_ps3_driver_probe(struct ps3_system_bus_device *dev)
 	if (ret < 0)
 		goto clean_irq;
 
-	strcpy(the_card.card->driver, "PS3");
-	strcpy(the_card.card->shortname, "PS3");
-	strcpy(the_card.card->longname, "PS3 sound");
+	strscpy(the_card.card->driver, "PS3");
+	strscpy(the_card.card->shortname, "PS3");
+	strscpy(the_card.card->longname, "PS3 sound");
 
 	/* create control elements */
 	for (i = 0; i < ARRAY_SIZE(spdif_ctls); i++) {
@@ -975,7 +975,7 @@ static int snd_ps3_driver_probe(struct ps3_system_bus_device *dev)
 		goto clean_card;
 
 	the_card.pcm->private_data = &the_card;
-	strcpy(the_card.pcm->name, "SPDIF");
+	strscpy(the_card.pcm->name, "SPDIF");
 
 	/* set pcm ops */
 	snd_pcm_set_ops(the_card.pcm, SNDRV_PCM_STREAM_PLAYBACK,
-- 
2.50.0

