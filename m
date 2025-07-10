Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D367E2D661F
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142397; cv=none; b=k6yj8O+63QOKh6ZCC7TUQXfiMj7lmGB75JefpADSFPAdvgqek36e2jP9nNukX2pLiln6/y6p3kGxh7aWlPc6/K39/LDzRf8wPJ2mJISlLT22MYWTZAAdH1T6W2rtoKzCeXajrcQfSNdhOmaesaRkhT/EJBnishDVcJTMuH0BdsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142397; c=relaxed/simple;
	bh=IZzLTg8UDEouIQ833sk8pNxBAWVQPyUXt94v90GvkNQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QiSmayq+mXwOEk0WQZg8Asg8MLHKBZcbMyZVCxstc2Kl7QyKZ/xk8L6qCzp/bcYihN1z/qKEqXto8Ln0rLMeDdEI3hYCthBWGmVjW6jZnO2GUGsdnDln1AiAvOb3QN8vaGMRWHLnKgnKXv0W9Zku/1Npq1eI6lXTeClanNNMJ5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TXe77Oc0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NCpkk+b/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TXe77Oc0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NCpkk+b/; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TXe77Oc0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NCpkk+b/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TXe77Oc0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NCpkk+b/"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 292BD211C7;
	Thu, 10 Jul 2025 10:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142069; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=weBdVqtwh7x7TERLuVZSPdhhHIcu9lo5qBst+DtEu5k=;
	b=TXe77Oc0fS7eiIHIs1E1sc4FnJ+ea1jNeqPrd1m4jRqkho39njWOo7sWVmdYKmDpn39P51
	LneqPzfYN3qNW93ctIb5e4VHDoiNISR3Shm8QVDu+uZaifiz6FwjEOTE1DpqbpZgRyiGy/
	t+7O61Q1rgCpmFFoccQR1EPP9zsrHJg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142069;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=weBdVqtwh7x7TERLuVZSPdhhHIcu9lo5qBst+DtEu5k=;
	b=NCpkk+b/lJT//X5Ihf9BdJ88yTFW9HQTrXgV4hfUu3pcwLA+KC/sXONQ5TAyLLSEalTu/O
	oZA6SDOFn4TvXIDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142069; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=weBdVqtwh7x7TERLuVZSPdhhHIcu9lo5qBst+DtEu5k=;
	b=TXe77Oc0fS7eiIHIs1E1sc4FnJ+ea1jNeqPrd1m4jRqkho39njWOo7sWVmdYKmDpn39P51
	LneqPzfYN3qNW93ctIb5e4VHDoiNISR3Shm8QVDu+uZaifiz6FwjEOTE1DpqbpZgRyiGy/
	t+7O61Q1rgCpmFFoccQR1EPP9zsrHJg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142069;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=weBdVqtwh7x7TERLuVZSPdhhHIcu9lo5qBst+DtEu5k=;
	b=NCpkk+b/lJT//X5Ihf9BdJ88yTFW9HQTrXgV4hfUu3pcwLA+KC/sXONQ5TAyLLSEalTu/O
	oZA6SDOFn4TvXIDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0E67D13AAB;
	Thu, 10 Jul 2025 10:07:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gDRJAvWQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:49 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 091/103] ALSA: sh: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:07:13 +0200
Message-ID: <20250710100727.22653-92-tiwai@suse.de>
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
	BAYES_HAM(-3.00)[99.99%];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLsqo7dymd5dgmoaprf5rep8is)];
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
 sound/sh/aica.c         | 8 ++++----
 sound/sh/sh_dac_audio.c | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/sh/aica.c b/sound/sh/aica.c
index 40ea843113a7..fa81bfba59c1 100644
--- a/sound/sh/aica.c
+++ b/sound/sh/aica.c
@@ -424,7 +424,7 @@ static int __init snd_aicapcmchip(struct snd_card_aica
 	if (unlikely(err < 0))
 		return err;
 	pcm->private_data = dreamcastcard;
-	strcpy(pcm->name, "AICA PCM");
+	strscpy(pcm->name, "AICA PCM");
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK,
 			&snd_aicapcm_playback_ops);
 	/* Allocate the DMA buffers */
@@ -568,9 +568,9 @@ static int snd_aica_probe(struct platform_device *devptr)
 		kfree(dreamcastcard);
 		return err;
 	}
-	strcpy(dreamcastcard->card->driver, "snd_aica");
-	strcpy(dreamcastcard->card->shortname, SND_AICA_DRIVER);
-	strcpy(dreamcastcard->card->longname,
+	strscpy(dreamcastcard->card->driver, "snd_aica");
+	strscpy(dreamcastcard->card->shortname, SND_AICA_DRIVER);
+	strscpy(dreamcastcard->card->longname,
 	       "Yamaha AICA Super Intelligent Sound Processor for SEGA Dreamcast");
 	/* Prepare to use the queue */
 	INIT_WORK(&(dreamcastcard->spu_dma_work), run_spu_dma);
diff --git a/sound/sh/sh_dac_audio.c b/sound/sh/sh_dac_audio.c
index 84a4b17a0cc2..164f91240d02 100644
--- a/sound/sh/sh_dac_audio.c
+++ b/sound/sh/sh_dac_audio.c
@@ -224,7 +224,7 @@ static int snd_sh_dac_pcm(struct snd_sh_dac *chip, int device)
 		return err;
 
 	pcm->private_data = chip;
-	strcpy(pcm->name, "SH_DAC PCM");
+	strscpy(pcm->name, "SH_DAC PCM");
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &snd_sh_dac_pcm_ops);
 
 	/* buffer size=48K */
@@ -358,8 +358,8 @@ static int snd_sh_dac_probe(struct platform_device *devptr)
 	if (err < 0)
 		goto probe_error;
 
-	strcpy(card->driver, "snd_sh_dac");
-	strcpy(card->shortname, "SuperH DAC audio driver");
+	strscpy(card->driver, "snd_sh_dac");
+	strscpy(card->shortname, "SuperH DAC audio driver");
 	dev_info(&devptr->dev, "%s %s\n", card->longname, card->shortname);
 
 	err = snd_card_register(card);
-- 
2.50.0

