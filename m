Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2285A188CD0
	for <linux-sound@vger.kernel.org>; Mon, 17 Jun 2024 10:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718618707; cv=none; b=CbrMkB0xYFk7KH6Hrx5E75yiXMB37dz3avbG6YCJy+UmER6MeCR+t3kv9KLOltWjaPUPfd+C8Tnzb3AIsMsilYNkJl4uoOLQi0FWjJZSRlYdQHe+MR2QCJ3NnmnRcGl+fUDZawLvhcmLq6er+C+oyKWuqmes+EPWp62v29gyEE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718618707; c=relaxed/simple;
	bh=g+WLk0RxS2EMN89vGbWXtSgiG7lvPqlCfBroFDzC+t8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SgOMtuURjOy0sCRPysshdz6LWujOzu5m5wzGsOE4UI9S5cC/3QkDhQtHJzDzsuM3W8Jie+K5uUPEAcoT24I14pyILzyDPvvvBcesJHNtLC2drsbtfNXbi3e8XAauKzqm+I1ACYxnd+zTqUZSp83AOCwF7VF/dTNOPhKb5hlqw/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LbUWT9BE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=s8sPyYam; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LbUWT9BE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=s8sPyYam; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LbUWT9BE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="s8sPyYam";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LbUWT9BE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="s8sPyYam"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 755625FE6C;
	Mon, 17 Jun 2024 10:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1718618704; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wWzN4pkCW6pGExmpRwFdiKxFYEVrUUKYdKert3dyulA=;
	b=LbUWT9BE0H3GYq7SRZC6lxCnLlD+d9moGJVUZ713RKW33/SgWKaeFA+i23U7UN3dlTRoOF
	AoP/K3pMiGbVIPr49+grV5QZ6vldsO4FmePz7NYrSv72b2X/DXBu4V7yPK4G8ayhlDd5hl
	0kprEdeTiZTnl1J6hidP7osQd3lAU4E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718618704;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wWzN4pkCW6pGExmpRwFdiKxFYEVrUUKYdKert3dyulA=;
	b=s8sPyYamXYBSF7d1Rj4UQiH3l2LnaiRMAJyg4qnZGFyC5mNCu80OX5JnvIuaR0xiKSH0vq
	zgUGc/xmIBGJORBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1718618704; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wWzN4pkCW6pGExmpRwFdiKxFYEVrUUKYdKert3dyulA=;
	b=LbUWT9BE0H3GYq7SRZC6lxCnLlD+d9moGJVUZ713RKW33/SgWKaeFA+i23U7UN3dlTRoOF
	AoP/K3pMiGbVIPr49+grV5QZ6vldsO4FmePz7NYrSv72b2X/DXBu4V7yPK4G8ayhlDd5hl
	0kprEdeTiZTnl1J6hidP7osQd3lAU4E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718618704;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wWzN4pkCW6pGExmpRwFdiKxFYEVrUUKYdKert3dyulA=;
	b=s8sPyYamXYBSF7d1Rj4UQiH3l2LnaiRMAJyg4qnZGFyC5mNCu80OX5JnvIuaR0xiKSH0vq
	zgUGc/xmIBGJORBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5968313AAF;
	Mon, 17 Jun 2024 10:05:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iGjiE1AKcGYfAgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Jun 2024 10:05:04 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 1/5] ALSA: control: Allow NULL passed to snd_ctl_remove()
Date: Mon, 17 Jun 2024 12:05:23 +0200
Message-ID: <20240617100529.6667-2-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240617100529.6667-1-tiwai@suse.de>
References: <20240617100529.6667-1-tiwai@suse.de>
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
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	URIBL_BLOCKED(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

There are lots of code checking NULL for kcontrol passed to
snd_ctl_remove() in the caller side.  Let's make snd_ctl_remove()
accepting the NULL kcontrol instead a la free(), so that we can clean
up the caller side.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/control.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/core/control.c b/sound/core/control.c
index fb0c60044f7b..7f0999d1671e 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -604,6 +604,7 @@ static inline int snd_ctl_remove_locked(struct snd_card *card,
  *
  * Removes the control from the card and then releases the instance.
  * You don't need to call snd_ctl_free_one().
+ * Passing NULL to @kcontrol argument is allowed as noop.
  *
  * Return: 0 if successful, or a negative error code on failure.
  *
@@ -611,6 +612,8 @@ static inline int snd_ctl_remove_locked(struct snd_card *card,
  */
 int snd_ctl_remove(struct snd_card *card, struct snd_kcontrol *kcontrol)
 {
+	if (!kcontrol)
+		return 0;
 	guard(rwsem_write)(&card->controls_rwsem);
 	return snd_ctl_remove_locked(card, kcontrol);
 }
-- 
2.43.0

