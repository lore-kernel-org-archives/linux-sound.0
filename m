Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B163E2D59FA
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142125; cv=none; b=YMXoXHVKoM1cV3lT0Oknf84Z3TO6khf3sONknjHGYPansN5t7s7/LJGK6WP9PM18U7qi2tIpCtuyLiGo4jLYc9DsiSFinr9bvXxq1HUDmKQAaE2ELOGWSAhM0VoCot9xvpqXSuNK5ncoAww35PJGifRCNikhEaDaeJC0jPUbMHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142125; c=relaxed/simple;
	bh=leGZeyvVowC57MS/EcC3zE5revB1ySa8MAxJakZ7ERw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sisR4myTWOx6HBPNxtcvVIbXB+1cPw2vRo8Baz5Ir7O3smNzBW2qyEOFm6k43JiXGxcgdA8gmPRctkR65z9J3H3eAz4TfMSfUrdIe39JFAxz742AbK0+k9v4CouaOY20n2w704eBnDJttfq87r5GfknnOg76Dip+1WJp3LbBhZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZqZQq1Ei; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nNMk75Tx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZqZQq1Ei; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nNMk75Tx; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZqZQq1Ei";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nNMk75Tx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZqZQq1Ei";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nNMk75Tx"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 846C91F45A;
	Thu, 10 Jul 2025 10:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142060; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sgj2sSG6gaJFDStCuEMA7YNUjNoF4v7cO+VYnZevUeo=;
	b=ZqZQq1EirtPT8LJnkOyhuBq1t0FN9i5smJFs/zFV961+PL5gWobl5tsNvoRibHPRvxjfbX
	Rk+qxd8QfuDrGPsfqsXEUFA/9prU9pkNeAWwH2ho+oHKG8xU5ao/VHNhk3enwmsyYlQ5jb
	uFH5yEKa5pOWDKtHsseqzzYv00dUgp0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142060;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sgj2sSG6gaJFDStCuEMA7YNUjNoF4v7cO+VYnZevUeo=;
	b=nNMk75TxuDZLNlko9y3wt3ezTiGRxSQlZSkPP0P5X8Kmva9xnHrY+cb5JlghG6bR7k3ZJO
	IsqqNgPXy1swAPDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ZqZQq1Ei;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=nNMk75Tx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142060; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sgj2sSG6gaJFDStCuEMA7YNUjNoF4v7cO+VYnZevUeo=;
	b=ZqZQq1EirtPT8LJnkOyhuBq1t0FN9i5smJFs/zFV961+PL5gWobl5tsNvoRibHPRvxjfbX
	Rk+qxd8QfuDrGPsfqsXEUFA/9prU9pkNeAWwH2ho+oHKG8xU5ao/VHNhk3enwmsyYlQ5jb
	uFH5yEKa5pOWDKtHsseqzzYv00dUgp0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142060;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sgj2sSG6gaJFDStCuEMA7YNUjNoF4v7cO+VYnZevUeo=;
	b=nNMk75TxuDZLNlko9y3wt3ezTiGRxSQlZSkPP0P5X8Kmva9xnHrY+cb5JlghG6bR7k3ZJO
	IsqqNgPXy1swAPDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6CADC136DC;
	Thu, 10 Jul 2025 10:07:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0BlhGeyQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:40 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 028/103] ALSA: es1688: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:06:10 +0200
Message-ID: <20250710100727.22653-29-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLe1mc1hwayk397878n5a1j337)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 846C91F45A
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Use a safer function strscpy() instead of strcpy() for copying to
arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/es1688/es1688_lib.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/isa/es1688/es1688_lib.c b/sound/isa/es1688/es1688_lib.c
index c0c230149a75..2ef183f197ad 100644
--- a/sound/isa/es1688/es1688_lib.c
+++ b/sound/isa/es1688/es1688_lib.c
@@ -706,7 +706,7 @@ int snd_es1688_pcm(struct snd_card *card, struct snd_es1688 *chip, int device)
 
 	pcm->private_data = chip;
 	pcm->info_flags = SNDRV_PCM_INFO_HALF_DUPLEX;
-	strcpy(pcm->name, snd_es1688_chip_id(chip));
+	strscpy(pcm->name, snd_es1688_chip_id(chip));
 	chip->pcm = pcm;
 
 	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, card->dev,
@@ -971,7 +971,7 @@ int snd_es1688_mixer(struct snd_card *card, struct snd_es1688 *chip)
 	if (snd_BUG_ON(!chip || !card))
 		return -EINVAL;
 
-	strcpy(card->mixername, snd_es1688_chip_id(chip));
+	strscpy(card->mixername, snd_es1688_chip_id(chip));
 
 	for (idx = 0; idx < ARRAY_SIZE(snd_es1688_controls); idx++) {
 		err = snd_ctl_add(card, snd_ctl_new1(&snd_es1688_controls[idx], chip));
-- 
2.50.0

