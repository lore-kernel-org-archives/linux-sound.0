Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A284842A9D
	for <linux-sound@vger.kernel.org>; Fri,  7 Mar 2025 08:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741336974; cv=none; b=UV217qFy81s7k5Siy51VEciiEzpZtrH8ndEKIU9mrYNKfPjMPPX5DBc6s+VNU4l5+F5wl+NFQjspVLbHbhqOP9rwlOqvaAb0lYq4E4GKE+WZY/OS9aqRQogehqqSAZwKY4MPbAz+/y3CkB1IYCAcCiM1vyBG/fgBSOZEaT2Op7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741336974; c=relaxed/simple;
	bh=CghVsW59Yk3516HdYYtRuLHfa8o21H2pKdxwADYy850=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=RPmPCwfHGT9JTZ3EO+jyw4FzvMTtF5PFWu/6K1O3eMBSxnkUGOc3hLIviFk4mkle8vflFXEWty+w8qJipLeFX2oq6ZmpmMQZ6bUZdRfutrBz+Je5aNafTEjaSK87u3qMYhzVMAWscmCRD/f2QA4kKyQvLYy3VheiLY4mowl0tXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EM2u9D/F; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iBTEhMVB; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EM2u9D/F; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iBTEhMVB; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EM2u9D/F";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iBTEhMVB";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EM2u9D/F";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iBTEhMVB"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A400A1F38E;
	Fri,  7 Mar 2025 08:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741336970; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=f76RRDf0ztAOnYjBTdiweCcBZyOXt9XC1GiJDvWqBj0=;
	b=EM2u9D/FuIrAzRr1MlawzXejoNocpqMbSlBLKQJSkMnii/jvotX3izHDX6pkLbi3K4xfYx
	ws3AHYw0GBkbjrXJIptqUKssE5q1LtXFGcpnU8nxD0m8FTmzXKqq4hXoja7Yumaw0790f8
	HgGqKwTeESMGG9AxSrrYFQ1VJs4mvBA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741336970;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=f76RRDf0ztAOnYjBTdiweCcBZyOXt9XC1GiJDvWqBj0=;
	b=iBTEhMVBcOHkgcLKdDi5HLnqtnYnGzRTLIXM0+Rlk5WnqLvwKLHItk1LnlAGM46QNpkBwc
	a+U39OmysaLu7RDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741336970; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=f76RRDf0ztAOnYjBTdiweCcBZyOXt9XC1GiJDvWqBj0=;
	b=EM2u9D/FuIrAzRr1MlawzXejoNocpqMbSlBLKQJSkMnii/jvotX3izHDX6pkLbi3K4xfYx
	ws3AHYw0GBkbjrXJIptqUKssE5q1LtXFGcpnU8nxD0m8FTmzXKqq4hXoja7Yumaw0790f8
	HgGqKwTeESMGG9AxSrrYFQ1VJs4mvBA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741336970;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=f76RRDf0ztAOnYjBTdiweCcBZyOXt9XC1GiJDvWqBj0=;
	b=iBTEhMVBcOHkgcLKdDi5HLnqtnYnGzRTLIXM0+Rlk5WnqLvwKLHItk1LnlAGM46QNpkBwc
	a+U39OmysaLu7RDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8A09B13939;
	Fri,  7 Mar 2025 08:42:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id X92JIIqxymfhOAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 07 Mar 2025 08:42:50 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 1/2] ALSA: seq: Improve data consistency at polling
Date: Fri,  7 Mar 2025 09:42:42 +0100
Message-ID: <20250307084246.29271-1-tiwai@suse.de>
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
	BAYES_HAM(-3.00)[100.00%];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

snd_seq_poll() calls snd_seq_write_pool_allocated() that reads out a
field in client->pool object, while it can be updated concurrently via
ioctls, as reported by syzbot.  The data race itself is harmless, as
it's merely a poll() call, and the state is volatile.  OTOH, the read
out of poll object info from the caller side is fragile, and we can
leave it better in snd_seq_pool_poll_wait() alone.

A similar pattern is seen in snd_seq_kernel_client_write_poll(), too,
which is called from the OSS sequencer.

This patch drops the pool checks from the caller side and add the
pool->lock in snd_seq_pool_poll_wait() for better data consistency.

Reported-by: syzbot+2d373c9936c00d7e120c@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/67c88903.050a0220.15b4b9.0028.GAE@google.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_clientmgr.c | 5 +----
 sound/core/seq/seq_memory.c    | 1 +
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/core/seq/seq_clientmgr.c b/sound/core/seq/seq_clientmgr.c
index 073b56dc2225..659494e00c51 100644
--- a/sound/core/seq/seq_clientmgr.c
+++ b/sound/core/seq/seq_clientmgr.c
@@ -1130,8 +1130,7 @@ static __poll_t snd_seq_poll(struct file *file, poll_table * wait)
 	if (snd_seq_file_flags(file) & SNDRV_SEQ_LFLG_OUTPUT) {
 
 		/* check if data is available in the pool */
-		if (!snd_seq_write_pool_allocated(client) ||
-		    snd_seq_pool_poll_wait(client->pool, file, wait))
+		if (snd_seq_pool_poll_wait(client->pool, file, wait))
 			mask |= EPOLLOUT | EPOLLWRNORM;
 	}
 
@@ -2566,8 +2565,6 @@ int snd_seq_kernel_client_write_poll(int clientid, struct file *file, poll_table
 	if (client == NULL)
 		return -ENXIO;
 
-	if (! snd_seq_write_pool_allocated(client))
-		return 1;
 	if (snd_seq_pool_poll_wait(client->pool, file, wait))
 		return 1;
 	return 0;
diff --git a/sound/core/seq/seq_memory.c b/sound/core/seq/seq_memory.c
index 20155e3e87c6..ccde0ca3d208 100644
--- a/sound/core/seq/seq_memory.c
+++ b/sound/core/seq/seq_memory.c
@@ -427,6 +427,7 @@ int snd_seq_pool_poll_wait(struct snd_seq_pool *pool, struct file *file,
 			   poll_table *wait)
 {
 	poll_wait(file, &pool->output_sleep, wait);
+	guard(spinlock_irq)(&pool->lock);
 	return snd_seq_output_ok(pool);
 }
 
-- 
2.43.0

