Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC2E2D6634
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142334; cv=none; b=alKkPUY22DEaoKaq7iVp+LefM0HK27Q16GXNv/gj0DSszRF1PrrAIegXshjTBHuYD4NHFdaf8MYl9BuGqChrVvlXOZxvsV3QNxC36Fb1Q7HfT4/S574iBt6Bs5/NaZ3ikNyTOJcRR9K074zCQxaeax2IVFcXWFBheeP3//e0sV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142334; c=relaxed/simple;
	bh=WwEK8B+O7Y6YkzAA5HFOGX2AdJ65shvm/Z7Hk7JdffQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rSDGnohHQQrl9rDSTlhVL2/ZSiKJ8CxcY8/xPKA8YOfWtISoQsF4Ctjw4dOD2kzbR11LLXgGqB8mrgdqUihib6qDez51QSl73GsqU76scgMcXG8OWjIEHy4eRaMNOHlOPjkOjh1a1aibqGDJm6fWS5iaoPFyowgeQ849QOvl/94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GrP9Jijq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LOTphE/y; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GrP9Jijq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LOTphE/y; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GrP9Jijq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LOTphE/y";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GrP9Jijq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LOTphE/y"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 45633211AD;
	Thu, 10 Jul 2025 10:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142066; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XAotbBE7hiMO5VKhJvFOtvFwHljz2k2nlMsh8VxeLqg=;
	b=GrP9JijqMfPwlW06svqOY+6TLFfxVItusQRUq/+3UnPx0i96dyAwYUV26yvenvDbRXHDuO
	DI6+q43Ufm+31JqrskbNwLFwf8+l4AL1ndSGlgVvTmCcTP1PEZKpF3iVv/3AcPlVH6nT9Q
	v3thgl3wJQK/hCdHYGCCgju+x/GLVG8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142066;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XAotbBE7hiMO5VKhJvFOtvFwHljz2k2nlMsh8VxeLqg=;
	b=LOTphE/yMh7wr/ZUo/aKWOBMdtolzVRoIgxIaGYi6Y80TDBHTNuZUYmpsu9jEyoCYjg1m2
	cpQA2pt4/V0++2DQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=GrP9Jijq;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="LOTphE/y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142066; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XAotbBE7hiMO5VKhJvFOtvFwHljz2k2nlMsh8VxeLqg=;
	b=GrP9JijqMfPwlW06svqOY+6TLFfxVItusQRUq/+3UnPx0i96dyAwYUV26yvenvDbRXHDuO
	DI6+q43Ufm+31JqrskbNwLFwf8+l4AL1ndSGlgVvTmCcTP1PEZKpF3iVv/3AcPlVH6nT9Q
	v3thgl3wJQK/hCdHYGCCgju+x/GLVG8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142066;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XAotbBE7hiMO5VKhJvFOtvFwHljz2k2nlMsh8VxeLqg=;
	b=LOTphE/yMh7wr/ZUo/aKWOBMdtolzVRoIgxIaGYi6Y80TDBHTNuZUYmpsu9jEyoCYjg1m2
	cpQA2pt4/V0++2DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 29E6413A70;
	Thu, 10 Jul 2025 10:07:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eLMRCfKQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:46 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 071/103] ALSA: lx6464es: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:06:53 +0200
Message-ID: <20250710100727.22653-72-tiwai@suse.de>
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
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 45633211AD
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLe1mc1hwayk397878n5a1j337)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01

Use a safer function strscpy() instead of strcpy() for copying to
arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/lx6464es/lx6464es.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/lx6464es/lx6464es.c b/sound/pci/lx6464es/lx6464es.c
index 63ebf9803ea8..9f12c936bb1f 100644
--- a/sound/pci/lx6464es/lx6464es.c
+++ b/sound/pci/lx6464es/lx6464es.c
@@ -814,7 +814,7 @@ static int lx_pcm_create(struct lx6464es *chip)
 
 	pcm->info_flags = 0;
 	pcm->nonatomic = true;
-	strcpy(pcm->name, card_name);
+	strscpy(pcm->name, card_name);
 
 	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
 				       &chip->pci->dev, size, size);
@@ -1022,7 +1022,7 @@ static int snd_lx6464es_probe(struct pci_dev *pci,
 		goto error;
 	}
 
-	strcpy(card->driver, "LX6464ES");
+	strscpy(card->driver, "LX6464ES");
 	sprintf(card->id, "LX6464ES_%02X%02X%02X",
 		chip->mac_address[3], chip->mac_address[4], chip->mac_address[5]);
 
-- 
2.50.0

