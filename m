Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7C92D59FA
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142137; cv=none; b=HuJXumSb6+tpvZfLYVstpcBYiTUyL01p/jjUZrsM6J8y9YTyALPDWLZhvueW/T4jUIfn2k9TkWSBGHPt9dXMXo0krfA6kJ+cfX0oUVqvBq9A/xOMMBAu8nndRYQSOGunWRpmVwPuRrZU+5y45I2rACadTVFPvzhhCrT3toy3Ecc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142137; c=relaxed/simple;
	bh=jpDC8ZCCWkdqbMZ9HB6tZRz7hCP6K/Uswf21sBdYp00=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RO2zLWFRrJ2jZJ4PFUuZOSoMNJkeTjqUDApulihFwvsvNyurWQeuI6N4EaO6NUeUHM9ugub63oeqKwI/+/zLhscfH/oRm0bQWV++R1ya1/7X03HTn2TS6c/zy/rhBEshLn7HuGOGEMLLBFxLzFuTwF+ES2NebALPsKzH8VfjMVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=C1TvzSY9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CdVZhomu; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=C1TvzSY9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CdVZhomu; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="C1TvzSY9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CdVZhomu";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="C1TvzSY9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CdVZhomu"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D115C1F38E;
	Thu, 10 Jul 2025 10:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142061; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZMq+2uZYqWh/HHrKPAcpwuU3X5gmuBINeH4Uxqv8d1I=;
	b=C1TvzSY9KKwXQi8lMRq1CidiSNc2j3glaK8WXyl+ByDPnMe6vQAPfyRhbzteRe2mEhsOee
	J9MkofI8XjR6EnBWq3YcxSESEcg96ZYXQq9Nal+V6WTyhRGmfULd6udOsISkpkan3vPhdk
	+UYv5O+vNNMKSwkqz5TgTid45z+YocI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142061;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZMq+2uZYqWh/HHrKPAcpwuU3X5gmuBINeH4Uxqv8d1I=;
	b=CdVZhomuXSAom3r15Xbu5l2sAM3p2AOqLixLptkHw42vCSAFNvm1hCb04I+nqVjV3mcQMt
	lC6EnoWI5dniJ1Cw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142061; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZMq+2uZYqWh/HHrKPAcpwuU3X5gmuBINeH4Uxqv8d1I=;
	b=C1TvzSY9KKwXQi8lMRq1CidiSNc2j3glaK8WXyl+ByDPnMe6vQAPfyRhbzteRe2mEhsOee
	J9MkofI8XjR6EnBWq3YcxSESEcg96ZYXQq9Nal+V6WTyhRGmfULd6udOsISkpkan3vPhdk
	+UYv5O+vNNMKSwkqz5TgTid45z+YocI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142061;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZMq+2uZYqWh/HHrKPAcpwuU3X5gmuBINeH4Uxqv8d1I=;
	b=CdVZhomuXSAom3r15Xbu5l2sAM3p2AOqLixLptkHw42vCSAFNvm1hCb04I+nqVjV3mcQMt
	lC6EnoWI5dniJ1Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B7CDD136DC;
	Thu, 10 Jul 2025 10:07:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kEyOK+2Qb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:41 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 038/103] ALSA: wss: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:06:20 +0200
Message-ID: <20250710100727.22653-39-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
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
 sound/isa/wss/wss_lib.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/isa/wss/wss_lib.c b/sound/isa/wss/wss_lib.c
index 9c655789574d..1b6a80021d18 100644
--- a/sound/isa/wss/wss_lib.c
+++ b/sound/isa/wss/wss_lib.c
@@ -1865,7 +1865,7 @@ int snd_wss_pcm(struct snd_wss *chip, int device)
 		pcm->info_flags |= SNDRV_PCM_INFO_HALF_DUPLEX;
 	if (chip->hardware != WSS_HW_INTERWAVE)
 		pcm->info_flags |= SNDRV_PCM_INFO_JOINT_DUPLEX;
-	strcpy(pcm->name, snd_wss_chip_id(chip));
+	strscpy(pcm->name, snd_wss_chip_id(chip));
 
 	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, chip->card->dev,
 				       64*1024, chip->dma1 > 3 || chip->dma2 > 3 ? 128*1024 : 64*1024);
@@ -1896,7 +1896,7 @@ int snd_wss_timer(struct snd_wss *chip, int device)
 	err = snd_timer_new(chip->card, "CS4231", &tid, &timer);
 	if (err < 0)
 		return err;
-	strcpy(timer->name, snd_wss_chip_id(chip));
+	strscpy(timer->name, snd_wss_chip_id(chip));
 	timer->private_data = chip;
 	timer->private_free = snd_wss_timer_free;
 	timer->hw = snd_wss_timer_table;
@@ -2176,7 +2176,7 @@ int snd_wss_mixer(struct snd_wss *chip)
 
 	card = chip->card;
 
-	strcpy(card->mixername, chip->pcm->name);
+	strscpy(card->mixername, chip->pcm->name);
 
 	/* Use only the first 11 entries on AD1848 */
 	if (chip->hardware & WSS_HW_AD1848_MASK)
-- 
2.50.0

