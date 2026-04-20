Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753FF21CC5C
	for <linux-sound@vger.kernel.org>; Mon, 20 Apr 2026 06:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776665850; cv=none; b=Fj7leFMIYB0SMo9qXH38YUlqa5YWvNNc5vz8p7LauCO05ypGJeLyMC0qDU1YUXjk/86kFldhFm8T4exoseaqxxdbev+dsvt1+N/6kfkUWHOc9x5xMukNcIhod+zoHqoC1BUdps3Qj+8wsPH2NxGNIXgwsNrnksIQrtiD63LleRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776665850; c=relaxed/simple;
	bh=SzGg3BXfFEDQ4eOMd0j3IZ2Qr12zFGspeDa0wdBg/HU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fEMss2zwMGKIJXiPdGAG9JyrSzJm5c+k+xFaCpXkXGSX2SwtSxWTORhKcEjbkNh3axgqAJ5CwAHxfZSyxfNJY7MxTIgbU1LsPtk+pfdrezXHqN8mmw9bzav8uf4/9WASqvtApPfuyW0G1QELCgVPKJztnhGjW3mMH5MlMINSkmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yHhp/hxh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NmnqsVjz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yHhp/hxh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NmnqsVjz; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yHhp/hxh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NmnqsVjz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yHhp/hxh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NmnqsVjz"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C74CD5BD19;
	Mon, 20 Apr 2026 06:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776665847; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=p00euHxt4GpH6FaG+PzSYaSjlfKTYA0oHpOmT6VOqh4=;
	b=yHhp/hxhWGgwHGL/XpQcjqY6v5mmDtfLmTR9wg4IVWD5yJZL0z0ByXc4Qo2mKx0MGn25CO
	tvMaVm5S9ytyPDeLIkVLTrZhakKhF7xTKGYk1WeUQbFiFlR449ZeMw7CF212NauyY/xjs6
	HJDVGh5s2jl7uB4bWXVPYoIPcU6MNqg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776665847;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=p00euHxt4GpH6FaG+PzSYaSjlfKTYA0oHpOmT6VOqh4=;
	b=NmnqsVjzIg84LMZBt/e58Mn+nGy6aRR8RDMXPZHsFBJcUmpSMTW23qM100vSPiQ4PUo7DZ
	iUdrxUBPoXOLrlBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776665847; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=p00euHxt4GpH6FaG+PzSYaSjlfKTYA0oHpOmT6VOqh4=;
	b=yHhp/hxhWGgwHGL/XpQcjqY6v5mmDtfLmTR9wg4IVWD5yJZL0z0ByXc4Qo2mKx0MGn25CO
	tvMaVm5S9ytyPDeLIkVLTrZhakKhF7xTKGYk1WeUQbFiFlR449ZeMw7CF212NauyY/xjs6
	HJDVGh5s2jl7uB4bWXVPYoIPcU6MNqg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776665847;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=p00euHxt4GpH6FaG+PzSYaSjlfKTYA0oHpOmT6VOqh4=;
	b=NmnqsVjzIg84LMZBt/e58Mn+nGy6aRR8RDMXPZHsFBJcUmpSMTW23qM100vSPiQ4PUo7DZ
	iUdrxUBPoXOLrlBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A199A593AE;
	Mon, 20 Apr 2026 06:17:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UnSXI/fE5WlgEAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 20 Apr 2026 06:17:27 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Jake Lamberson <lamberson.jake@gmail.com>
Subject: [PATCH] ALSA: core: Fix potential data race at fasync handling
Date: Mon, 20 Apr 2026 08:17:20 +0200
Message-ID: <20260420061721.3253644-1-tiwai@suse.de>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	TAGGED_RCPT(0.00)[];
	FROM_HAS_DN(0.00)[];
	URIBL_BLOCKED(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO

In snd_fasync_work_fn(), which is the offload work for traversing and
processing the pending fasync list, the call of kill_fasync() is done
outside the snd_fasync_lock for avoiding deadlocks.  The problem is
that its the references of fasync->on, fasync->signal and fasync->poll
are done there also outside the lock.  Since these may be modified by
snd_kill_fasync() call concurrently from other process, inconsistent
values might be passed to kill_fasync().  Although there shouldn't be
critical UAF, it's still better to be addressed.

This patch moves the kill_fasync() argument evaluations inside the
snd_fasync_lock for avoiding the data races above.  The handling in
fasync->on flag is optimized in the loop to skip directly.

Also, for more clarity, snd_fasync_free() takes the lock and unlink
the pending entry more directly instead of clearing fasync->on flag.

Reported-by: Jake Lamberson <lamberson.jake@gmail.com>
Fixes: ef34a0ae7a26 ("ALSA: core: Add async signal helpers")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/misc.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/sound/core/misc.c b/sound/core/misc.c
index 88d9e1f9a6e9..5aca09edf971 100644
--- a/sound/core/misc.c
+++ b/sound/core/misc.c
@@ -100,14 +100,18 @@ static LIST_HEAD(snd_fasync_list);
 static void snd_fasync_work_fn(struct work_struct *work)
 {
 	struct snd_fasync *fasync;
+	int signal, poll;
 
 	spin_lock_irq(&snd_fasync_lock);
 	while (!list_empty(&snd_fasync_list)) {
 		fasync = list_first_entry(&snd_fasync_list, struct snd_fasync, list);
 		list_del_init(&fasync->list);
+		if (!fasync->on)
+			continue;
+		signal = fasync->signal;
+		poll = fasync->poll;
 		spin_unlock_irq(&snd_fasync_lock);
-		if (fasync->on)
-			kill_fasync(&fasync->fasync, fasync->signal, fasync->poll);
+		kill_fasync(&fasync->fasync, signal, poll);
 		spin_lock_irq(&snd_fasync_lock);
 	}
 	spin_unlock_irq(&snd_fasync_lock);
@@ -158,7 +162,10 @@ void snd_fasync_free(struct snd_fasync *fasync)
 {
 	if (!fasync)
 		return;
-	fasync->on = 0;
+
+	scoped_guard(spinlock_irq, &snd_fasync_lock)
+		list_del_init(&fasync->list);
+
 	flush_work(&snd_fasync_work);
 	kfree(fasync);
 }
-- 
2.53.0

