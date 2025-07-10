Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4382D5C77
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142218; cv=none; b=EdQpQgSf2yAA+EuywgAGJ+/N3W5VHslrPq+RTMt0GepWbHyA1gxvQ82CgozRoIp2w8cmPPjlYBzK83obu2Eg9eo2Xl1H21MHQL+25FUGrHJWsJVbiSe9vXQMC3uko3a4k/uhSmyZHiUo38A91IvjzNN0XRWlit950jMqBDchJk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142218; c=relaxed/simple;
	bh=WSI2KIfzMTGSifz+5kZyfRQBbopiYnKGr1AHQINwEfc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ejpSrqnQvcfWKJV6jHAz/IlXHNoyLnscJ7nnyBH3y2mY5/64kVPgIaAXkDy4swsxpzZwyZDDGSQ24ga2KITy85eo9/on/sjHpCnU4FZ1ZJ4uV+HzFqWWJKWVcKaTcqUJgJli7817dRwt5zx0TajDaYjY8NmJyXxhZr5p97wLzUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YIqNPMGC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cwND43Fs; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YIqNPMGC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cwND43Fs; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YIqNPMGC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cwND43Fs";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YIqNPMGC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cwND43Fs"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 928AB21197;
	Thu, 10 Jul 2025 10:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142061; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lmCs91CIDWUn7hljSOzDZR3iXL5pB3rxA0pVzf43W4Q=;
	b=YIqNPMGC+UgecofH/3zw8iQF9BYHWcQm6MkDI+XSE/rbIiJP8ygF6NlqtSjwaY6V1Fyo0X
	poUXG+VO8IYbVcvBgFagFsPju0Rk3tc73T1Kcya4wAOKm0NndXVwWDzzbJuJHux2A4Rl/r
	OpduapDWXoJpk5HsY5dH5d/uCvNURHM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142061;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lmCs91CIDWUn7hljSOzDZR3iXL5pB3rxA0pVzf43W4Q=;
	b=cwND43FsKy8mybOKhSwqfMkQQQbrwh1bQwjlUlzP4JTr6bY7K/GpJ3HDwdmTI5uk3IDzY7
	058NA0daPORLGDCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142061; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lmCs91CIDWUn7hljSOzDZR3iXL5pB3rxA0pVzf43W4Q=;
	b=YIqNPMGC+UgecofH/3zw8iQF9BYHWcQm6MkDI+XSE/rbIiJP8ygF6NlqtSjwaY6V1Fyo0X
	poUXG+VO8IYbVcvBgFagFsPju0Rk3tc73T1Kcya4wAOKm0NndXVwWDzzbJuJHux2A4Rl/r
	OpduapDWXoJpk5HsY5dH5d/uCvNURHM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142061;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lmCs91CIDWUn7hljSOzDZR3iXL5pB3rxA0pVzf43W4Q=;
	b=cwND43FsKy8mybOKhSwqfMkQQQbrwh1bQwjlUlzP4JTr6bY7K/GpJ3HDwdmTI5uk3IDzY7
	058NA0daPORLGDCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7AB60136DC;
	Thu, 10 Jul 2025 10:07:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gCG/HO2Qb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:41 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 036/103] ALSA: sscape: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:06:18 +0200
Message-ID: <20250710100727.22653-37-tiwai@suse.de>
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
 sound/isa/sscape.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/isa/sscape.c b/sound/isa/sscape.c
index 09120e38f4c2..709a1659d66f 100644
--- a/sound/isa/sscape.c
+++ b/sound/isa/sscape.c
@@ -1047,8 +1047,8 @@ static int create_sscape(int dev, struct snd_card *card)
 			wss_port[dev], irq[dev]);
 		return err;
 	}
-	strcpy(card->driver, "SoundScape");
-	strcpy(card->shortname, name);
+	strscpy(card->driver, "SoundScape");
+	strscpy(card->shortname, name);
 	snprintf(card->longname, sizeof(card->longname),
 		 "%s at 0x%lx, IRQ %d, DMA1 %d, DMA2 %d\n",
 		 name, sscape->chip->port, sscape->chip->irq,
-- 
2.50.0

