Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDF53F4829
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 11:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781005873; cv=none; b=t67uTOKn+TfcEbCvvPI1xmzZBIwRInlf54PAnPk8bZzCDipXFMEeskW3JIOzmqNO28e0CE/k9Rb9jJuxTAfS7nXTO6PuuUQee1l7dDol08iY1lHuI2aeXngvQN6AdnLlmHPFjnav3H1NFIfhLYsk1T2QhUyZ9ufMNOfyFCKKB2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781005873; c=relaxed/simple;
	bh=CmGljBLmbak3sqGj2IejSy+s6oSa9S7Q9cUjLDeYr/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DpN0QEKh+7+xgFmZB1KoIKR2p5FdGI/ksp5alq+gduuCjy4WPdW/cTUme9q2jIOzP7crdJLobuKfxhy+beFcHKnjBfn1dQ5bSvRpwB7xdqmrZ/NGJychNiuRJ2aJG40eY8Z2SwyKsfCHJIziFvjJQ788GIE4BBNXtFKLUXLTMTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JYsz/riS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2bhCC0qe; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JYsz/riS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2bhCC0qe; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JYsz/riS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2bhCC0qe";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JYsz/riS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2bhCC0qe"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1B7507584E;
	Tue,  9 Jun 2026 11:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781005865; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OATk/jJjwjMrFe7Gzox9LcUYHzg0b1z9Dll66/P9bIw=;
	b=JYsz/riST1kkIb/r9g0dMWhSknAQGpAhHRe9sA+6yTzUllWlUVYZB+i5TtOHGM5ccfMPbK
	owUsOr3U9AyUGqLUSSX3FdgsMQRbSYemBnk8hb8HLPqbkcJEAVPQOIbP+HlUT4Ba3PtWKn
	gAftxPQTTwsg7Jq2dgikD8dSDGrBIYk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781005865;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OATk/jJjwjMrFe7Gzox9LcUYHzg0b1z9Dll66/P9bIw=;
	b=2bhCC0qey+UCzCopo74Bm4efZXsMU0jBoRnLWH360iLfs4RP/ToL71R6XxUVnzKWHlTSuF
	AgegRpOR5uArnOCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="JYsz/riS";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=2bhCC0qe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781005865; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OATk/jJjwjMrFe7Gzox9LcUYHzg0b1z9Dll66/P9bIw=;
	b=JYsz/riST1kkIb/r9g0dMWhSknAQGpAhHRe9sA+6yTzUllWlUVYZB+i5TtOHGM5ccfMPbK
	owUsOr3U9AyUGqLUSSX3FdgsMQRbSYemBnk8hb8HLPqbkcJEAVPQOIbP+HlUT4Ba3PtWKn
	gAftxPQTTwsg7Jq2dgikD8dSDGrBIYk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781005865;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OATk/jJjwjMrFe7Gzox9LcUYHzg0b1z9Dll66/P9bIw=;
	b=2bhCC0qey+UCzCopo74Bm4efZXsMU0jBoRnLWH360iLfs4RP/ToL71R6XxUVnzKWHlTSuF
	AgegRpOR5uArnOCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EF221779AA;
	Tue,  9 Jun 2026 11:51:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8F7bOSj+J2rvMQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 09 Jun 2026 11:51:04 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Kyle Zeng <kylebot@openai.com>
Subject: [PATCH 2/3] Revert "ALSA: timer: Fix UAF at snd_timer_user_params()"
Date: Tue,  9 Jun 2026 13:50:54 +0200
Message-ID: <20260609115100.806869-3-tiwai@suse.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609115100.806869-1-tiwai@suse.de>
References: <20260609115100.806869-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim,suse.de:mid];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 1B7507584E
X-Spam-Score: -3.01

This reverts commit 053a401b592be424fea9d57c789f66cd5d8cec11.

With the change of the timer object lifecycle with kref, this
temporary workaround is no longer needed.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/timer.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/core/timer.c b/sound/core/timer.c
index 6d8fc1ee29f5..6baa63a3bad0 100644
--- a/sound/core/timer.c
+++ b/sound/core/timer.c
@@ -1861,7 +1861,6 @@ static int snd_timer_user_params(struct file *file,
 	struct snd_timer_params params;
 	int err;
 
-	guard(mutex)(&register_mutex);
 	tu = file->private_data;
 	if (!tu->timeri)
 		return -EBADFD;
-- 
2.54.0

