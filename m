Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D032367DF
	for <linux-sound@vger.kernel.org>; Mon, 11 Aug 2025 10:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754908414; cv=none; b=BfadHzIThf+gLMMZop1AMKdMjVv6L/QhEzp5s/ANjFCMcIpt6MdhO/0ArkP4fDleBT4WtVv+r+6CKmqoqjAhmmGpKvMyQdKTr4mhroBHvSqLYHLqozWG/MgLcjGWaVMZJRQGQ6WY0PPO30fF8zoh9NjmIsGPVeo6ljaBKTqKMuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754908414; c=relaxed/simple;
	bh=maBfCHaYCRLxfENnOi6XoR5MAdzNaXuN76LYKNzxPII=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Icg03Gcwxqp0H73+QeyV8ns6YTPQo585/Mf4Lrdv+KlRvEx+f3CHi1CvGA3lmG3Su8UlsAS1Ydm4V2bh+SepLYXLgCXSQiVASsWDVcys3tD+eDW7VJu/q/JJuc+PSvb0p/cToCjeUY+iw9OstSJ3ij/Jr9U5tBFzfiqOIFcRb18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=avnqo8pw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3qA+vQU6; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=avnqo8pw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3qA+vQU6; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="avnqo8pw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3qA+vQU6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="avnqo8pw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3qA+vQU6"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5447F21F51;
	Mon, 11 Aug 2025 10:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754908375; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TPkqP6aAnKcf1tCDzc8HT2LLxVS+IkQGSTw54svuE+4=;
	b=avnqo8pwFoYGz8oxnuSh1ayai6uK6OVDzsl3jkt6V0WwuIu29VuPE/9SMn2FhO1UpDM8xB
	4ASKKxwiqY+9M45gC9QOePw9TTaURDCiNKx9tRaBF1Ue60HGwgm9fGay632omdhJ6FQQ29
	wFrGzf0zBnJxJzlwsrP+XLPFgMfsY74=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754908375;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TPkqP6aAnKcf1tCDzc8HT2LLxVS+IkQGSTw54svuE+4=;
	b=3qA+vQU6MeXh3cH1+UgUt2846NTsHqYknBwCGZzMyWzSvnuVSq8i0IvNPUO/cPKpz0SS8F
	gkzEGOkZqTK0B5Cw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=avnqo8pw;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=3qA+vQU6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754908375; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TPkqP6aAnKcf1tCDzc8HT2LLxVS+IkQGSTw54svuE+4=;
	b=avnqo8pwFoYGz8oxnuSh1ayai6uK6OVDzsl3jkt6V0WwuIu29VuPE/9SMn2FhO1UpDM8xB
	4ASKKxwiqY+9M45gC9QOePw9TTaURDCiNKx9tRaBF1Ue60HGwgm9fGay632omdhJ6FQQ29
	wFrGzf0zBnJxJzlwsrP+XLPFgMfsY74=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754908375;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TPkqP6aAnKcf1tCDzc8HT2LLxVS+IkQGSTw54svuE+4=;
	b=3qA+vQU6MeXh3cH1+UgUt2846NTsHqYknBwCGZzMyWzSvnuVSq8i0IvNPUO/cPKpz0SS8F
	gkzEGOkZqTK0B5Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3A6A613479;
	Mon, 11 Aug 2025 10:32:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QK8XDdfGmWjEDgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 11 Aug 2025 10:32:55 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 11/11] ALSA: seq: oss/rw: Cleanup with guard
Date: Mon, 11 Aug 2025 12:32:47 +0200
Message-ID: <20250811103249.10644-12-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250811103249.10644-1-tiwai@suse.de>
References: <20250811103249.10644-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 5447F21F51
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

