Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005B62D5A0F
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142174; cv=none; b=n3KC4E2we0DFO2XjlChK3EdYeb0AocGrYYsL2jjQdXcj0pVXwcSB1n6afT1vaDsl42NYuiTaxtc+ARKoukPkDoFASyFC212TXf4U3YcRQDzwY6928pfcIbGyQkjBpQWpiP/FURBvyIYckJkQaWY2cFShda03IAeFDo4aUUZa4VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142174; c=relaxed/simple;
	bh=Zpp2ITQgH2RLG6pYC1e88FRMfj+wGeOMbRg66gfLtM8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lqTqST+xj5WtEc84Y8Cpo7rtOXcj427xmnfm4DAgqpDlDtpLeKM2y5N8M5DVhzfJpFx4+dkXuMjUHKvMg9mXJRbhMiSaWqp/IgXW60OqMmYvTscSAjoianJE532pQAcrcMKKzOFnIE0XVYRsmWanECLMvDPCmlDxBjrbd2gvqGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=p+EafE8x; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4OCmgHPf; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=p+EafE8x; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4OCmgHPf; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="p+EafE8x";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4OCmgHPf";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="p+EafE8x";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4OCmgHPf"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 056AE21190;
	Thu, 10 Jul 2025 10:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142060; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=04x0gHXduKgmS1wvBMQd6uOwxWc/lizHb0lutNWAAg8=;
	b=p+EafE8x6ZYDhELeW4qk45VgmPi4dY2JGTsXMllm3enGz1SzeVC+4+mH7hXrE7tZUJxRH5
	hC017n2YZfiR0a5tvsUsOxV9PEoZQsYmNSsofbsJPT9OhHwPZ2/JpRMXuIMe52KfNlT9vU
	Kh1kyDfVrfKQiKiKlZVpdGvoHCPNpL4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142060;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=04x0gHXduKgmS1wvBMQd6uOwxWc/lizHb0lutNWAAg8=;
	b=4OCmgHPfM7HYUdESSBaN0qdcu8LoIylpIEsQWevkaGKLi5qn7AXg4zit16/gLMGh0R9v+Z
	XzLdIAhYGRKuV9Cw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=p+EafE8x;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=4OCmgHPf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142060; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=04x0gHXduKgmS1wvBMQd6uOwxWc/lizHb0lutNWAAg8=;
	b=p+EafE8x6ZYDhELeW4qk45VgmPi4dY2JGTsXMllm3enGz1SzeVC+4+mH7hXrE7tZUJxRH5
	hC017n2YZfiR0a5tvsUsOxV9PEoZQsYmNSsofbsJPT9OhHwPZ2/JpRMXuIMe52KfNlT9vU
	Kh1kyDfVrfKQiKiKlZVpdGvoHCPNpL4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142060;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=04x0gHXduKgmS1wvBMQd6uOwxWc/lizHb0lutNWAAg8=;
	b=4OCmgHPfM7HYUdESSBaN0qdcu8LoIylpIEsQWevkaGKLi5qn7AXg4zit16/gLMGh0R9v+Z
	XzLdIAhYGRKuV9Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E136D136DC;
	Thu, 10 Jul 2025 10:07:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kAGdNeuQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:39 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 024/103] ALSA: als100: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:06:06 +0200
Message-ID: <20250710100727.22653-25-tiwai@suse.de>
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
	BAYES_HAM(-3.00)[99.99%];
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
X-Rspamd-Queue-Id: 056AE21190
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Use a safer function strscpy() instead of strcpy() for copying to
arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/als100.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/isa/als100.c b/sound/isa/als100.c
index e70dbf0b099a..cfc241bd252e 100644
--- a/sound/isa/als100.c
+++ b/sound/isa/als100.c
@@ -192,14 +192,14 @@ static int snd_card_als100_probe(int dev,
 	acard->chip = chip;
 
 	if (pid->driver_data == SB_HW_DT019X) {
-		strcpy(card->driver, "DT-019X");
-		strcpy(card->shortname, "Diamond Tech. DT-019X");
+		strscpy(card->driver, "DT-019X");
+		strscpy(card->shortname, "Diamond Tech. DT-019X");
 		snprintf(card->longname, sizeof(card->longname),
 			 "Diamond Tech. DT-019X, %s at 0x%lx, irq %d, dma %d",
 			 chip->name, chip->port, irq[dev], dma8[dev]);
 	} else {
-		strcpy(card->driver, "ALS100");
-		strcpy(card->shortname, "Avance Logic ALS100");
+		strscpy(card->driver, "ALS100");
+		strscpy(card->shortname, "Avance Logic ALS100");
 		snprintf(card->longname, sizeof(card->longname),
 			 "Avance Logic ALS100, %s at 0x%lx, irq %d, dma %d&%d",
 			 chip->name, chip->port, irq[dev], dma8[dev],
-- 
2.50.0

