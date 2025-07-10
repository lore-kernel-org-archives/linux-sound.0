Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D992D5C7B
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142383; cv=none; b=Ro+TvmF890SKSIx4QQkGsNCt81NBmFvwK5DzZ3Coiu77KHTNYCv3L8jk5KVQRVgZCBKQK9rmpTm7T/X5jXnLPRmKqC5UocY9Tpkqjt55Ufp7EkEA8ams0fX4ol7r8Qy7FkRu4KmTycUSLuI7DA00k41Z2KJ6uCv1WTN+0AE8q68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142383; c=relaxed/simple;
	bh=5++qBi6MaJL2nrmWLllLdkZljUku/H0gNn2Jm3EUprY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hfykbw6nz9YFNrU/r4XfCO6Zo1o33vAZm34+D6z25SU+fEnLTbGkws0boi4X1KJfEamELG4aF4IDV1/3v1+PJzL0eAFQDF85mMseff+T12HuTFhT9r2sCeUP8ACmLdC1eDNwK0gKCW6xTw+7qNi1ryQ0jXfXVaIi2dJELBz2ayA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Iz2cyrsJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/zMLwU0J; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Iz2cyrsJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/zMLwU0J; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Iz2cyrsJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/zMLwU0J";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Iz2cyrsJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/zMLwU0J"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AF14321174;
	Thu, 10 Jul 2025 10:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142068; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=06tpOHd50tsnmCXDx0es6GJh0GBUot/52Vmy+nwk/zk=;
	b=Iz2cyrsJCoNTTKplfH/fawebt3F2mYBRX4+o5sU01iSTEtmb2OUq2zD0VxD5fjtole+dwS
	wpvsQzxy6fyVsAbtyJw9PSmY78hYXZXJNPJHxTJZYNIeW9WEX2SenCUYmyb1q3nDOE5DD7
	vpbe3WK8oL43cGpTtm+GToILCDHe4PQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142068;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=06tpOHd50tsnmCXDx0es6GJh0GBUot/52Vmy+nwk/zk=;
	b=/zMLwU0JPGnR3TalLiX6/rthtYa7xOo4+6yNqUzS/Ozp5JECoJKSayIahz+32fhuGU1OMw
	X6BXcX0IaVcKo3DQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142068; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=06tpOHd50tsnmCXDx0es6GJh0GBUot/52Vmy+nwk/zk=;
	b=Iz2cyrsJCoNTTKplfH/fawebt3F2mYBRX4+o5sU01iSTEtmb2OUq2zD0VxD5fjtole+dwS
	wpvsQzxy6fyVsAbtyJw9PSmY78hYXZXJNPJHxTJZYNIeW9WEX2SenCUYmyb1q3nDOE5DD7
	vpbe3WK8oL43cGpTtm+GToILCDHe4PQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142068;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=06tpOHd50tsnmCXDx0es6GJh0GBUot/52Vmy+nwk/zk=;
	b=/zMLwU0JPGnR3TalLiX6/rthtYa7xOo4+6yNqUzS/Ozp5JECoJKSayIahz+32fhuGU1OMw
	X6BXcX0IaVcKo3DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 94D94136DC;
	Thu, 10 Jul 2025 10:07:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kBggI/SQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:48 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 088/103] ALSA: pdaudiocf: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:07:10 +0200
Message-ID: <20250710100727.22653-89-tiwai@suse.de>
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
 sound/pcmcia/pdaudiocf/pdaudiocf.c     | 2 +-
 sound/pcmcia/pdaudiocf/pdaudiocf_pcm.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pcmcia/pdaudiocf/pdaudiocf.c b/sound/pcmcia/pdaudiocf/pdaudiocf.c
index 494460746614..13419837dfb7 100644
--- a/sound/pcmcia/pdaudiocf/pdaudiocf.c
+++ b/sound/pcmcia/pdaudiocf/pdaudiocf.c
@@ -160,7 +160,7 @@ static int snd_pdacf_assign_resources(struct snd_pdacf *pdacf, int port, int irq
 	if (err < 0)
 		return err;	
 
-	strcpy(card->driver, "PDAudio-CF");
+	strscpy(card->driver, "PDAudio-CF");
 	sprintf(card->shortname, "Core Sound %s", card->driver);
 	sprintf(card->longname, "%s at 0x%x, irq %i",
 		card->shortname, port, irq);
diff --git a/sound/pcmcia/pdaudiocf/pdaudiocf_pcm.c b/sound/pcmcia/pdaudiocf/pdaudiocf_pcm.c
index aaa82ec36540..20aba745f1dc 100644
--- a/sound/pcmcia/pdaudiocf/pdaudiocf_pcm.c
+++ b/sound/pcmcia/pdaudiocf/pdaudiocf_pcm.c
@@ -263,7 +263,7 @@ int snd_pdacf_pcm_new(struct snd_pdacf *chip)
 	pcm->private_data = chip;
 	pcm->info_flags = 0;
 	pcm->nonatomic = true;
-	strcpy(pcm->name, chip->card->shortname);
+	strscpy(pcm->name, chip->card->shortname);
 	chip->pcm = pcm;
 	
 	err = snd_ak4117_build(chip->ak4117, pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream);
-- 
2.50.0

