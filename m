Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9973F2D63E9
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142279; cv=none; b=D2nIsXc0ZDBBhUsiNdrsP0ZhEQOTrUynLcSNtXj7wFGEIaADoQEcXGaHUe/5JQfzGXMYm40JXrUJ4xZ1LvAf6VqfRQZWsTwfCPzdXHG11+IT5fAEsoLG80sU131zrZCEszNvN6KNQfLYJAWDd+lwPTnG87Mdhy9+6OdKlkLZ9TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142279; c=relaxed/simple;
	bh=u/O9CaFZdTOtn8pfrGU2nbypZDnKE02srtS/9t5y0sg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EY5fyvhcFZym/8tLSC6ZX5Rf3s+iMJdSQPPDyNYnuEWV+r0X/wun0yYeX3Ioc1g1kdrgwfs8OZSBVfRbNKsbFEUVkNsTU6s6SIk+awtmSjCd/6t3NO15PMUv47qec0l1FG/ASeVfm0g5eyiqAq4Tqf+NGabDY9oIqQrLDtsPkGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pz06kKDP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fX36CMae; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pz06kKDP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fX36CMae; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pz06kKDP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fX36CMae";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pz06kKDP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fX36CMae"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3055A1F787;
	Thu, 10 Jul 2025 10:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142068; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cpu1IiRuKaLey3iXP4RRcVgBknMdx5XeYv4gYa1Sc6w=;
	b=pz06kKDP/3cluriSG+3TxpBk2fWdILfU0nnv3nGd1592EywnRXINXjPbVm8nXa+cypHSkT
	nEMeSL8EAbmwXQBxkppwa52H/OHboLxuXPpjKWawNKfBhek9xP6wj4dm0oXMQo0SZJPdaH
	jQo1X2QgsTiKPQNCn4nsXlEdfYvv34Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142068;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cpu1IiRuKaLey3iXP4RRcVgBknMdx5XeYv4gYa1Sc6w=;
	b=fX36CMaeTf7p9wyVJUEZMuKqqdibgDPww4L1mF/gzOitHUDH3ZS1ipEXnlb7UFdw5xAlTm
	UFveec4/wVquhXDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142068; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cpu1IiRuKaLey3iXP4RRcVgBknMdx5XeYv4gYa1Sc6w=;
	b=pz06kKDP/3cluriSG+3TxpBk2fWdILfU0nnv3nGd1592EywnRXINXjPbVm8nXa+cypHSkT
	nEMeSL8EAbmwXQBxkppwa52H/OHboLxuXPpjKWawNKfBhek9xP6wj4dm0oXMQo0SZJPdaH
	jQo1X2QgsTiKPQNCn4nsXlEdfYvv34Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142068;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cpu1IiRuKaLey3iXP4RRcVgBknMdx5XeYv4gYa1Sc6w=;
	b=fX36CMaeTf7p9wyVJUEZMuKqqdibgDPww4L1mF/gzOitHUDH3ZS1ipEXnlb7UFdw5xAlTm
	UFveec4/wVquhXDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 13170136DC;
	Thu, 10 Jul 2025 10:07:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SBF7A/SQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:48 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 084/103] ALSA: sonicvibes: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:07:06 +0200
Message-ID: <20250710100727.22653-85-tiwai@suse.de>
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
 sound/pci/sonicvibes.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/pci/sonicvibes.c b/sound/pci/sonicvibes.c
index 808a793ff4da..f85a9556dacb 100644
--- a/sound/pci/sonicvibes.c
+++ b/sound/pci/sonicvibes.c
@@ -863,7 +863,7 @@ static int snd_sonicvibes_pcm(struct sonicvibes *sonic, int device)
 
 	pcm->private_data = sonic;
 	pcm->info_flags = 0;
-	strcpy(pcm->name, "S3 SonicVibes");
+	strscpy(pcm->name, "S3 SonicVibes");
 	sonic->pcm = pcm;
 
 	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
@@ -1091,7 +1091,7 @@ static int snd_sonicvibes_mixer(struct sonicvibes *sonic)
 	if (snd_BUG_ON(!sonic || !sonic->card))
 		return -EINVAL;
 	card = sonic->card;
-	strcpy(card->mixername, "S3 SonicVibes");
+	strscpy(card->mixername, "S3 SonicVibes");
 
 	for (idx = 0; idx < ARRAY_SIZE(snd_sonicvibes_controls); idx++) {
 		kctl = snd_ctl_new1(&snd_sonicvibes_controls[idx], sonic);
@@ -1415,8 +1415,8 @@ static int __snd_sonic_probe(struct pci_dev *pci,
 	if (err < 0)
 		return err;
 
-	strcpy(card->driver, "SonicVibes");
-	strcpy(card->shortname, "S3 SonicVibes");
+	strscpy(card->driver, "SonicVibes");
+	strscpy(card->shortname, "S3 SonicVibes");
 	sprintf(card->longname, "%s rev %i at 0x%llx, irq %i",
 		card->shortname,
 		sonic->revision,
-- 
2.50.0

