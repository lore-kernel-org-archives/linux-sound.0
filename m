Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A50D2D63F0
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142285; cv=none; b=sTgd2uZYhfHaWV0BGEVnx3IfcOncZo4eaCMbSnfHUzshq9VIthZzxsGi1YPKHDrtWli+d1SV75Bi6Qhca/czVYjhFHBHhIGWaEbgIcUHPcN63i9/4G5CORuOKRX4vWaqTUbCjGeilvZSwqOZK3JTpV4XH1Rds5kikh8ItXaBT9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142285; c=relaxed/simple;
	bh=FzxLOMW//UQ5vD5Tp2c/6q2sOIfi/HK0t71fTMWtxyA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aTezrtwzzivNbexgfSyLCW2FJt6uNMOBHKBtnmEXEVD8PLWDZMc1PLR42SIhVtWciIb91Kn7MlsfBmgsWlS2kmRV/aDCH8FWnNAFXhH5Nd4rrDSr2ghrjawkcK+DqK5+0cGMeZPA0mNRBdLlT+3lgHGG7hTOtv8bNCTIYuwbhro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=x7YlM1N3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YgdhYwcT; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=x7YlM1N3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YgdhYwcT; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="x7YlM1N3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YgdhYwcT";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="x7YlM1N3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YgdhYwcT"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8E1AB1F443;
	Thu, 10 Jul 2025 10:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142068; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1XY8FEGjOK9m+H0zcOy60S3cTBhmTPS69Q+IxzXujZ8=;
	b=x7YlM1N3hzAwv9CkCRrSxKnu+z1j9VXQiaHaOf7rs3YIR9PxAmNlnX2yIR7j0p241reuf9
	+cZowLKiNVe6+pT+hD3rcxg1zjg7FAfeljY7u+XVmIP26u1SdXYyeKXKMvix1Hw9J34qNm
	PlGjc1wKk+7tzxFxbT4U3FpOKWut9sA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142068;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1XY8FEGjOK9m+H0zcOy60S3cTBhmTPS69Q+IxzXujZ8=;
	b=YgdhYwcTTlb3VWe5GeHuUAJ3SHOIrSRwKNKghmZDn+M3O6l6YLWIJGc0gBscoVPgf5XFi0
	Q/0DxDBdXe7iycAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142068; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1XY8FEGjOK9m+H0zcOy60S3cTBhmTPS69Q+IxzXujZ8=;
	b=x7YlM1N3hzAwv9CkCRrSxKnu+z1j9VXQiaHaOf7rs3YIR9PxAmNlnX2yIR7j0p241reuf9
	+cZowLKiNVe6+pT+hD3rcxg1zjg7FAfeljY7u+XVmIP26u1SdXYyeKXKMvix1Hw9J34qNm
	PlGjc1wKk+7tzxFxbT4U3FpOKWut9sA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142068;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1XY8FEGjOK9m+H0zcOy60S3cTBhmTPS69Q+IxzXujZ8=;
	b=YgdhYwcTTlb3VWe5GeHuUAJ3SHOIrSRwKNKghmZDn+M3O6l6YLWIJGc0gBscoVPgf5XFi0
	Q/0DxDBdXe7iycAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7531013A70;
	Thu, 10 Jul 2025 10:07:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yJByG/SQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:48 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 087/103] ALSA: ymfpci: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:07:09 +0200
Message-ID: <20250710100727.22653-88-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
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
 sound/pci/ymfpci/ymfpci.c      | 2 +-
 sound/pci/ymfpci/ymfpci_main.c | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/pci/ymfpci/ymfpci.c b/sound/pci/ymfpci/ymfpci.c
index 48444dda44de..764ca59e98d1 100644
--- a/sound/pci/ymfpci/ymfpci.c
+++ b/sound/pci/ymfpci/ymfpci.c
@@ -188,7 +188,7 @@ static int __snd_card_ymfpci_probe(struct pci_dev *pci,
 	default: model = str = "???"; break;
 	}
 
-	strcpy(card->driver, str);
+	strscpy(card->driver, str);
 	sprintf(card->shortname, "Yamaha %s (%s)", model, str);
 	sprintf(card->longname, "%s at 0x%lx, irq %i",
 		card->shortname,
diff --git a/sound/pci/ymfpci/ymfpci_main.c b/sound/pci/ymfpci/ymfpci_main.c
index d495f53a8324..75e013b66c5b 100644
--- a/sound/pci/ymfpci/ymfpci_main.c
+++ b/sound/pci/ymfpci/ymfpci_main.c
@@ -1134,7 +1134,7 @@ int snd_ymfpci_pcm(struct snd_ymfpci *chip, int device)
 
 	/* global setup */
 	pcm->info_flags = 0;
-	strcpy(pcm->name, "YMFPCI");
+	strscpy(pcm->name, "YMFPCI");
 	chip->pcm = pcm;
 
 	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
@@ -1201,7 +1201,7 @@ int snd_ymfpci_pcm_spdif(struct snd_ymfpci *chip, int device)
 
 	/* global setup */
 	pcm->info_flags = 0;
-	strcpy(pcm->name, "YMFPCI - IEC958");
+	strscpy(pcm->name, "YMFPCI - IEC958");
 	chip->pcm_spdif = pcm;
 
 	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
@@ -1242,7 +1242,7 @@ int snd_ymfpci_pcm_4ch(struct snd_ymfpci *chip, int device)
 
 	/* global setup */
 	pcm->info_flags = 0;
-	strcpy(pcm->name, "YMFPCI - Rear PCM");
+	strscpy(pcm->name, "YMFPCI - Rear PCM");
 	chip->pcm_4ch = pcm;
 
 	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
@@ -1948,7 +1948,7 @@ int snd_ymfpci_timer(struct snd_ymfpci *chip, int device)
 	tid.subdevice = 0;
 	err = snd_timer_new(chip->card, "YMFPCI", &tid, &timer);
 	if (err >= 0) {
-		strcpy(timer->name, "YMFPCI timer");
+		strscpy(timer->name, "YMFPCI timer");
 		timer->private_data = chip;
 		timer->hw = snd_ymfpci_timer_hw;
 	}
-- 
2.50.0

