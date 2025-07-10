Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABB42D59EA
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142100; cv=none; b=o9gKFlGeLi9KyMl0Gj7sdCnjueGngYqahGxMceUL10hTlXGWfItMKPI8yKuSBeyrsOcEjWMNj0xUhhrYDHzedsXvUWV/soWsId7EHgY2UwTa53OQn6XMTOHNOcyutU4BW0SK3vEaJTHTpBiF3dAigQ0KN911g5Iw2eO44h/NS8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142100; c=relaxed/simple;
	bh=otLO54O2buCZEc8sdUXwBCU6M7p6SxTI9fhiAtv5Hc0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I6FYeO8nadALxMeBkj954A1AJ5hfF9ZPMUFzVHudbX6PXowiO27Je6hpm6NP59ljxwEh3zJiKgXwqcGZpwY3cSiM0Fqz/O7+fs3G+6aC3j2lp6/yWS9ryCW/cHxGAeINNpunIlyvWug9rv+eySeIaGHe7GRPJA0XdkvK6+J8V1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=swB7v0Cf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RJ9Hnuyo; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=swB7v0Cf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RJ9Hnuyo; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="swB7v0Cf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RJ9Hnuyo";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="swB7v0Cf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RJ9Hnuyo"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D29892117F;
	Thu, 10 Jul 2025 10:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142057; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ifVGnzugUVW7QEXwGj3U6T3RrlcEyYGJFqZ1NBZIiQ4=;
	b=swB7v0CfDqkVfRakDl4hdtXpw/4IyLfWOCuGUq5uuNAAMC0fT8FZJuR1wLyDKSmFMP5/fx
	sAALXAD3Dmes43xyMAgiZVWlQqHVKTEsMXjriGyn8oYGX0EaBMf+WzrsD2xYCDxy+YBXTB
	upYVJgs6v+VtMSUlGlCRNuXfGgkbGWY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142057;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ifVGnzugUVW7QEXwGj3U6T3RrlcEyYGJFqZ1NBZIiQ4=;
	b=RJ9HnuyocqryirEq1Xd3isbXFpBnk50oSmMdXkbw7Z+yr5WN3MNh19uTyN5wQf+rUq5jWG
	o/lDr2PfqBIUBQBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=swB7v0Cf;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=RJ9Hnuyo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142057; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ifVGnzugUVW7QEXwGj3U6T3RrlcEyYGJFqZ1NBZIiQ4=;
	b=swB7v0CfDqkVfRakDl4hdtXpw/4IyLfWOCuGUq5uuNAAMC0fT8FZJuR1wLyDKSmFMP5/fx
	sAALXAD3Dmes43xyMAgiZVWlQqHVKTEsMXjriGyn8oYGX0EaBMf+WzrsD2xYCDxy+YBXTB
	upYVJgs6v+VtMSUlGlCRNuXfGgkbGWY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142057;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ifVGnzugUVW7QEXwGj3U6T3RrlcEyYGJFqZ1NBZIiQ4=;
	b=RJ9HnuyocqryirEq1Xd3isbXFpBnk50oSmMdXkbw7Z+yr5WN3MNh19uTyN5wQf+rUq5jWG
	o/lDr2PfqBIUBQBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B737E136DC;
	Thu, 10 Jul 2025 10:07:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4KxgK+mQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:37 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 008/103] ALSA: portman2x4: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:05:50 +0200
Message-ID: <20250710100727.22653-9-tiwai@suse.de>
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
X-Rspamd-Queue-Id: D29892117F
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01

Use a safer function strscpy() instead of strcpy() for copying to
arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/portman2x4.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/drivers/portman2x4.c b/sound/drivers/portman2x4.c
index 5e4ef25a83a4..b4fa6625a3d6 100644
--- a/sound/drivers/portman2x4.c
+++ b/sound/drivers/portman2x4.c
@@ -549,7 +549,7 @@ static int snd_portman_rawmidi_create(struct snd_card *card)
 		return err;
 
 	rmidi->private_data = pm;
-	strcpy(rmidi->name, CARD_NAME);
+	strscpy(rmidi->name, CARD_NAME);
 	rmidi->info_flags = SNDRV_RAWMIDI_INFO_OUTPUT |
 		            SNDRV_RAWMIDI_INFO_INPUT |
                             SNDRV_RAWMIDI_INFO_DUPLEX;
@@ -714,8 +714,8 @@ static int snd_portman_probe(struct platform_device *pdev)
 		dev_dbg(&pdev->dev, "Cannot create card\n");
 		return err;
 	}
-	strcpy(card->driver, DRIVER_NAME);
-	strcpy(card->shortname, CARD_NAME);
+	strscpy(card->driver, DRIVER_NAME);
+	strscpy(card->shortname, CARD_NAME);
 	sprintf(card->longname,  "%s at 0x%lx, irq %i", 
 		card->shortname, p->base, p->irq);
 
-- 
2.50.0

