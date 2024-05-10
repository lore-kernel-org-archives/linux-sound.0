Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B63481DB
	for <linux-sound@vger.kernel.org>; Fri, 10 May 2024 12:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715345479; cv=none; b=aHgmRynBYO+w+jzd0StlqT96LpD+tXh1cqqIpVN04B6Ea57HuzHjjJdSy4K4M7uLv9EJCftA2MsjzFyKalnHqRdjpi35vg+/w7T6PE2IfF/VnTgOLtMgNUS1jYHHiIAY0rKi91fOCoTVJ4Nl2obFeqzMkP29j1V5Pw08GfjUhR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715345479; c=relaxed/simple;
	bh=V1mpR9FODt7T89JfoZD4OIQ+oCs4ogtFXhC0H8uUlec=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=LqM0niSqFZ5lnsFe7ofndV6q9o+Y0RPOinjJzlsRVjVFrX6x536uPQzNCFomrGKVxZpRc/kdLb+6aqxouTRezVJVnRB28P9D/IsesVZFg7xHk5SJkrt+NAy/RDvLCo8LkoUfccoMoR9WERF69u/5O//uh0NfLxG0Ja/DrXw3l5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=noTVtIpb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CLUea92z; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=noTVtIpb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CLUea92z; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="noTVtIpb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CLUea92z";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="noTVtIpb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CLUea92z"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D04F93F4B0;
	Fri, 10 May 2024 12:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715345475; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=dhrbL3UBAqEzYBi+ODUhVooSgS1YWQh9NCdTbnvL8D0=;
	b=noTVtIpbQoUYm3EJ77U/hediJuZLB227e83Ck6BAug4ukvi3FB3+nC0krW+zz0MttkULjM
	xkr8EEaBDuazWsZcghn0HBkXMme0fG8pG8vxjlGDDqleKDQdgKDFRu3JTzFkprdxAS7Mg6
	6jiqgfsi3RbHu3mGJ84b1Ra19sNjZmk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715345475;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=dhrbL3UBAqEzYBi+ODUhVooSgS1YWQh9NCdTbnvL8D0=;
	b=CLUea92zXeLCHSC8VectvBUoGayJeuHm+Ba+Piuhnt9+pPw+Ko5OGAzctspLZvUtEf54k0
	RmaEonwNZmGA/KBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715345475; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=dhrbL3UBAqEzYBi+ODUhVooSgS1YWQh9NCdTbnvL8D0=;
	b=noTVtIpbQoUYm3EJ77U/hediJuZLB227e83Ck6BAug4ukvi3FB3+nC0krW+zz0MttkULjM
	xkr8EEaBDuazWsZcghn0HBkXMme0fG8pG8vxjlGDDqleKDQdgKDFRu3JTzFkprdxAS7Mg6
	6jiqgfsi3RbHu3mGJ84b1Ra19sNjZmk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715345475;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=dhrbL3UBAqEzYBi+ODUhVooSgS1YWQh9NCdTbnvL8D0=;
	b=CLUea92zXeLCHSC8VectvBUoGayJeuHm+Ba+Piuhnt9+pPw+Ko5OGAzctspLZvUtEf54k0
	RmaEonwNZmGA/KBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id ADC851386E;
	Fri, 10 May 2024 12:51:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id T3QLKUMYPmbFdwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 10 May 2024 12:51:15 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: core: Remove superfluous CONFIG_PM
Date: Fri, 10 May 2024 14:51:27 +0200
Message-ID: <20240510125128.6058-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

Since the recent code change, the conditional build with CONFIG_PM is
calling only snd_power_sync_ref().  As a dummy function is provided
for this function, we can get rid of CONFIG_PM gracefully now.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/init.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/core/init.c b/sound/core/init.c
index 89c8354862c4..6b127864a1a3 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -550,9 +550,7 @@ void snd_card_disconnect(struct snd_card *card)
 		clear_bit(card->number, snd_cards_lock);
 	}
 
-#ifdef CONFIG_PM
 	snd_power_sync_ref(card);
-#endif
 }
 EXPORT_SYMBOL(snd_card_disconnect);
 
-- 
2.43.0

