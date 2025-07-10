Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FE32D59EA
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142094; cv=none; b=eWlHxlPmhjv0kRoNz0IDq4S/9KNEZKSFwZjU9eEc7cC6UavKbe8uuqNLA05aeHhgqhE8SWqWhCmiptg+LBixHE2MQzmgjcOJhMcq9PDqgJ6+7FgrBwFYb5YbM2symy7v7EQ9soKHL58gsXENt2amhsEQZw90lprnAhBcmzbi+fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142094; c=relaxed/simple;
	bh=utS/5OWMnap99CU+wRSEQhTkdK3D/Gz7eSe46P0VlYE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jCjp39WNp2+Um4Hdu92u26+89cAWuIOdSDNaRPFrn+SXcn5ICKTTmSXwOLlQQ2qqLWBIC4S0tLzYKdU0GUgiftEUXRkyEuWEeXElbtJeG5ggHSNdl7r5pe50C8okniTg16QMcTpqHWJB1DKjQ1HAMRmJ/7Fp2Ob40B8Od4r9qz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nT7o6BfK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WRksEgdP; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nT7o6BfK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WRksEgdP; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nT7o6BfK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WRksEgdP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nT7o6BfK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WRksEgdP"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BACF32117D;
	Thu, 10 Jul 2025 10:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142057; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0dMjOJdzj8FyfeXiY1R5l/hsiMSnHK6MgLatNHtPgxE=;
	b=nT7o6BfKiD+cMx9P6YRiSIBBMKH68AtkoexxcDEnLZ7bjMGvHZGVftHvG89nk/vhRJEeCh
	Jz1B/Ce8Fjos1iDmavTdtNU2vFhDY28oDJzrqROYs3Ccg9EL7TBjGICdj2MrCy79Thslgt
	C/KZ6LmRrqSyMQXtXVhkRE2bceRiziI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142057;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0dMjOJdzj8FyfeXiY1R5l/hsiMSnHK6MgLatNHtPgxE=;
	b=WRksEgdP9He1xrKASO+hCzQTbRTyzhPT2/drE8+gEYZiC/QSPHV7QCL6nytsRxTe6IL+gy
	fbRXKUCAtslMSYCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=nT7o6BfK;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=WRksEgdP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142057; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0dMjOJdzj8FyfeXiY1R5l/hsiMSnHK6MgLatNHtPgxE=;
	b=nT7o6BfKiD+cMx9P6YRiSIBBMKH68AtkoexxcDEnLZ7bjMGvHZGVftHvG89nk/vhRJEeCh
	Jz1B/Ce8Fjos1iDmavTdtNU2vFhDY28oDJzrqROYs3Ccg9EL7TBjGICdj2MrCy79Thslgt
	C/KZ6LmRrqSyMQXtXVhkRE2bceRiziI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142057;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0dMjOJdzj8FyfeXiY1R5l/hsiMSnHK6MgLatNHtPgxE=;
	b=WRksEgdP9He1xrKASO+hCzQTbRTyzhPT2/drE8+gEYZiC/QSPHV7QCL6nytsRxTe6IL+gy
	fbRXKUCAtslMSYCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9651313A70;
	Thu, 10 Jul 2025 10:07:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sJhrI+mQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:37 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 007/103] ALSA: pcsp: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:05:49 +0200
Message-ID: <20250710100727.22653-8-tiwai@suse.de>
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
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim,suse.de:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: BACF32117D
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Use a safer function strscpy() instead of strcpy() for copying to
arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/pcsp/pcsp.c       | 4 ++--
 sound/drivers/pcsp/pcsp_lib.c   | 2 +-
 sound/drivers/pcsp/pcsp_mixer.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/drivers/pcsp/pcsp.c b/sound/drivers/pcsp/pcsp.c
index e8482c2290c3..ff6bb375c900 100644
--- a/sound/drivers/pcsp/pcsp.c
+++ b/sound/drivers/pcsp/pcsp.c
@@ -122,8 +122,8 @@ static int snd_card_pcsp_probe(int devnum, struct device *dev)
 	if (err < 0)
 		return err;
 
-	strcpy(card->driver, "PC-Speaker");
-	strcpy(card->shortname, "pcsp");
+	strscpy(card->driver, "PC-Speaker");
+	strscpy(card->shortname, "pcsp");
 	sprintf(card->longname, "Internal PC-Speaker at port 0x%x",
 		pcsp_chip.port);
 
diff --git a/sound/drivers/pcsp/pcsp_lib.c b/sound/drivers/pcsp/pcsp_lib.c
index d9bc1ea1b53c..80b313f4fcd3 100644
--- a/sound/drivers/pcsp/pcsp_lib.c
+++ b/sound/drivers/pcsp/pcsp_lib.c
@@ -340,7 +340,7 @@ int snd_pcsp_new_pcm(struct snd_pcsp *chip)
 
 	chip->pcm->private_data = chip;
 	chip->pcm->info_flags = SNDRV_PCM_INFO_HALF_DUPLEX;
-	strcpy(chip->pcm->name, "pcsp");
+	strscpy(chip->pcm->name, "pcsp");
 
 	snd_pcm_set_managed_buffer_all(chip->pcm,
 				       SNDRV_DMA_TYPE_CONTINUOUS,
diff --git a/sound/drivers/pcsp/pcsp_mixer.c b/sound/drivers/pcsp/pcsp_mixer.c
index c0ae942358b9..27d6150329a8 100644
--- a/sound/drivers/pcsp/pcsp_mixer.c
+++ b/sound/drivers/pcsp/pcsp_mixer.c
@@ -158,7 +158,7 @@ int snd_pcsp_new_mixer(struct snd_pcsp *chip, int nopcm)
 	if (err < 0)
 		return err;
 
-	strcpy(card->mixername, "PC-Speaker");
+	strscpy(card->mixername, "PC-Speaker");
 
 	return 0;
 }
-- 
2.50.0

