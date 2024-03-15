Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE099182DB
	for <linux-sound@vger.kernel.org>; Fri, 15 Mar 2024 10:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710497700; cv=none; b=UbjLiyAU6XLyRDKp/eE/JSsXmoPdR7sm0pI48/zphCJA1JsHFCGyBd/T0joxKoUn9Asx8TiUxcTJ4yo4kb+Yataw7Q75zAVSjyPEDg7ljJW23dG+x1X1AfW+YPa4/ca8lzmG/OPyElfsbF1p8eGZPf1pJOfhp+wlPLUwoYlsKTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710497700; c=relaxed/simple;
	bh=LYZfdMBBXdY5m3OVJWV0Hq04YaQ/6RcmeGUZKm5qHto=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=V4klqiMTihDwSYbqjNa/IOmy6q9vhNX0oo7vpoBfLg2oMUx5L1zUkcOLOcYtrM5YS9G3Ew6GbVQDfBCQqNhMkOi4MRPR69dsAaTQI2tBeLx6SJy3YW1fjOi/k4VQmPLoL/dUtIhO4I1CSBe7qrYUwXZh9zmRDTE7QK2YlRAMTAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rffSDGxn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9IfNNTrK; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rffSDGxn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9IfNNTrK; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rffSDGxn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9IfNNTrK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rffSDGxn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9IfNNTrK"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 27E0221CF0;
	Fri, 15 Mar 2024 10:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1710497691; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=QXy5RgG00NWy1TLQkkAZjMwRHKJ3Gp1Ye32HubyrYIA=;
	b=rffSDGxn7zZiWkJ777yVVvfNKaRB5trcxFe37ESzCR63T1cK+QhE78REy514b7D+N79IzI
	Gu30a5xfBs7sxCOKENNBStHZt8P8RNeyLvgsfrX19v2nkn1I1uYkNes98lcU8UAXhkgQT8
	pgzLQ07Jn9qDUoG5GsQBGUw79Zd4aMY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710497691;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=QXy5RgG00NWy1TLQkkAZjMwRHKJ3Gp1Ye32HubyrYIA=;
	b=9IfNNTrKLJ/sVbCupoF9kfCptzIqhyvUGJekSddsAW0AVDNduqa+vql1UNwYxpdhfUgM3k
	SO7vl6yibLCGhdCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1710497691; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=QXy5RgG00NWy1TLQkkAZjMwRHKJ3Gp1Ye32HubyrYIA=;
	b=rffSDGxn7zZiWkJ777yVVvfNKaRB5trcxFe37ESzCR63T1cK+QhE78REy514b7D+N79IzI
	Gu30a5xfBs7sxCOKENNBStHZt8P8RNeyLvgsfrX19v2nkn1I1uYkNes98lcU8UAXhkgQT8
	pgzLQ07Jn9qDUoG5GsQBGUw79Zd4aMY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710497691;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=QXy5RgG00NWy1TLQkkAZjMwRHKJ3Gp1Ye32HubyrYIA=;
	b=9IfNNTrKLJ/sVbCupoF9kfCptzIqhyvUGJekSddsAW0AVDNduqa+vql1UNwYxpdhfUgM3k
	SO7vl6yibLCGhdCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 09B4113460;
	Fri, 15 Mar 2024 10:14:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SjPdAJsf9GWWaAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 15 Mar 2024 10:14:51 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: timer: Fix missing irq-disable at closing
Date: Fri, 15 Mar 2024 11:14:42 +0100
Message-ID: <20240315101447.18395-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: 1.43
X-Spam-Flag: NO
X-Spamd-Bar: +
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=rffSDGxn;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=9IfNNTrK
X-Spamd-Result: default: False [1.43 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_ONE(0.00)[1];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[appspotmail.com:email,suse.de:dkim,suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.06)[61.91%];
	 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]
X-Spam-Level: *
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 27E0221CF0

The conversion to guard macro dropped the irq-disablement at closing
mistakenly, which may lead to a race.  Fix it.

Fixes: beb45974dd49 ("ALSA: timer: Use guard() for locking")
Reported-by: syzbot+28c1a5a5b041a754b947@syzkaller.appspotmail.com
Closes: http://lore.kernel.org/r/0000000000000b9a510613b0145f@google.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/timer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/timer.c b/sound/core/timer.c
index 15b07d09c4b7..4d2ee99c12a3 100644
--- a/sound/core/timer.c
+++ b/sound/core/timer.c
@@ -409,7 +409,7 @@ static void snd_timer_close_locked(struct snd_timer_instance *timeri,
 	struct snd_timer *timer = timeri->timer;
 
 	if (timer) {
-		guard(spinlock)(&timer->lock);
+		guard(spinlock_irq)(&timer->lock);
 		timeri->flags |= SNDRV_TIMER_IFLG_DEAD;
 	}
 
-- 
2.43.0

