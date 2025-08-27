Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85023218AB
	for <linux-sound@vger.kernel.org>; Wed, 27 Aug 2025 08:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756281947; cv=none; b=Rk9wRHVfmBI7gJk/0oWcQXCTQcNiNVSmUxeufHKDvZuc3UsCbIhHZvuxJxJbVwChAXkA+jGlBstH66kp+05dKcmCTgIG+UYLC+zDugI2cbhaH2oWk1ddLsAD1B00nSQK0G5ocMwO85MULNgKJNfrcqC8r8GY/WwpZTX4JTJ2WI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756281947; c=relaxed/simple;
	bh=maBfCHaYCRLxfENnOi6XoR5MAdzNaXuN76LYKNzxPII=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xwd2AA/jZFFe9Eg7gTCiGcHSFFFrqHe3mZgHDvX3K8GBSgWTDx3ylvKS5uanFOW/3YbpzN1AkXgq/EYVx7HvvVosUz81PmaIOD+iaLMDgW42U2T1iAQTyEUI/utLVvZXj6T8kmjEp46SpY+KYHcQAxf7gz+motav+O+eaCyK1+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bfJDiyK0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/uhhp68e; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bfJDiyK0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/uhhp68e; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bfJDiyK0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/uhhp68e";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bfJDiyK0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/uhhp68e"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 943F621F26;
	Wed, 27 Aug 2025 08:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756281924; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TPkqP6aAnKcf1tCDzc8HT2LLxVS+IkQGSTw54svuE+4=;
	b=bfJDiyK0Cvn0tf4vdxtqt0WkjmaEkfhWImKFzvNMf/13gK0ytPYPjER57mEEYJpGjUhPGK
	QwqXvHWJQ6CfNblWk4sVCatYHZKQWozJ7STbDhc0q00ZNGNrFnpAa+trG6v+sSdZWht3Hm
	LewDyQZfXdXI0JNLQ4t0p41UBn540jI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756281924;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TPkqP6aAnKcf1tCDzc8HT2LLxVS+IkQGSTw54svuE+4=;
	b=/uhhp68eGCkew1mcSKRI2D7IFKZfd+aDkBXpAUpricBpsE1PP4qqCElZkfuGsK4oSBUhhZ
	j4DCHJTJ7FiO3KBQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=bfJDiyK0;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="/uhhp68e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756281924; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TPkqP6aAnKcf1tCDzc8HT2LLxVS+IkQGSTw54svuE+4=;
	b=bfJDiyK0Cvn0tf4vdxtqt0WkjmaEkfhWImKFzvNMf/13gK0ytPYPjER57mEEYJpGjUhPGK
	QwqXvHWJQ6CfNblWk4sVCatYHZKQWozJ7STbDhc0q00ZNGNrFnpAa+trG6v+sSdZWht3Hm
	LewDyQZfXdXI0JNLQ4t0p41UBn540jI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756281924;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TPkqP6aAnKcf1tCDzc8HT2LLxVS+IkQGSTw54svuE+4=;
	b=/uhhp68eGCkew1mcSKRI2D7IFKZfd+aDkBXpAUpricBpsE1PP4qqCElZkfuGsK4oSBUhhZ
	j4DCHJTJ7FiO3KBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7C98413310;
	Wed, 27 Aug 2025 08:05:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eLFAHUS8rmgHdwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 27 Aug 2025 08:05:24 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 11/11] ALSA: seq: oss/rw: Cleanup with guard
Date: Wed, 27 Aug 2025 10:05:17 +0200
Message-ID: <20250827080520.7544-12-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250827080520.7544-1-tiwai@suse.de>
References: <20250827080520.7544-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_NONE(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim,suse.de:email]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 943F621F26
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Replace the manual spin lock/unlock pairs with guard() for code
simplification.

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/oss/seq_oss_readq.c  | 10 ++--------
 sound/core/seq/oss/seq_oss_writeq.c |  5 +----
 2 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/sound/core/seq/oss/seq_oss_readq.c b/sound/core/seq/oss/seq_oss_readq.c
index f0db5d3dcba4..bbaf72e70b35 100644
--- a/sound/core/seq/oss/seq_oss_readq.c
+++ b/sound/core/seq/oss/seq_oss_readq.c
@@ -140,13 +140,9 @@ int snd_seq_oss_readq_sysex(struct seq_oss_readq *q, int dev,
 int
 snd_seq_oss_readq_put_event(struct seq_oss_readq *q, union evrec *ev)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave(&q->lock, flags);
-	if (q->qlen >= q->maxlen - 1) {
-		spin_unlock_irqrestore(&q->lock, flags);
+	guard(spinlock_irqsave)(&q->lock);
+	if (q->qlen >= q->maxlen - 1)
 		return -ENOMEM;
-	}
 
 	memcpy(&q->q[q->tail], ev, sizeof(*ev));
 	q->tail = (q->tail + 1) % q->maxlen;
@@ -155,8 +151,6 @@ snd_seq_oss_readq_put_event(struct seq_oss_readq *q, union evrec *ev)
 	/* wake up sleeper */
 	wake_up(&q->midi_sleep);
 
-	spin_unlock_irqrestore(&q->lock, flags);
-
 	return 0;
 }
 
diff --git a/sound/core/seq/oss/seq_oss_writeq.c b/sound/core/seq/oss/seq_oss_writeq.c
index 3e3209ce53b1..a93ff8315b8e 100644
--- a/sound/core/seq/oss/seq_oss_writeq.c
+++ b/sound/core/seq/oss/seq_oss_writeq.c
@@ -122,13 +122,10 @@ snd_seq_oss_writeq_sync(struct seq_oss_writeq *q)
 void
 snd_seq_oss_writeq_wakeup(struct seq_oss_writeq *q, abstime_t time)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave(&q->sync_lock, flags);
+	guard(spinlock_irqsave)(&q->sync_lock);
 	q->sync_time = time;
 	q->sync_event_put = 0;
 	wake_up(&q->sync_sleep);
-	spin_unlock_irqrestore(&q->sync_lock, flags);
 }
 
 
-- 
2.50.1

