Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9EFA16DC07
	for <linux-sound@vger.kernel.org>; Thu,  1 Aug 2024 07:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722498349; cv=none; b=IYnxe0/uaHYyfUBFDM7y2WzimHegpoY7AFUrTJxzj3KtDLoqog0gqguhuEg0Bb3q2RgLZbNXLYYtvR1Z3EVuwKou2+MIiMf6mM9kp/y/j9vtTN+DDea4WRh8PrXqCrObeZTOZ7NfKag9daPwstoViV5J45Di/ad4Famvdmqeasw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722498349; c=relaxed/simple;
	bh=a7JZrxXlAvWguWbLwHHjnI9jE5TTUxWVnUV0D8XpHgM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bIY8S6nFQJ1UYA9tm86Jm+uIUjh5UfsPtXSHUm45O7r4LnCBBLd3v+3sbY/Y59y6gaEETaO2aqIVPhtfuyNTfnCZtYH8bPX0u+wRIBXgiDeKkQ5NeVfZiwJfyq563SQptndnq1EIfdIqCRtt8Ma83eqSF1NSSi7Q9icTbzd4hOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jha/+g0P; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tjLIbLL9; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oUvyyWZK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tyQXmYOK; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jha/+g0P";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tjLIbLL9";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oUvyyWZK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tyQXmYOK"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D482C1F8D9;
	Thu,  1 Aug 2024 07:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722498346; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=57aFWh/Dub2/eLknoLCVanKkSP+ZYFr4JIyoVo1Rbc8=;
	b=jha/+g0P8pyduuI7xxmx1r06++5lBxy6yeG9ebzTs3mi8fSCmGngKv5t7X+GrV9kv/IbkS
	hB429cQLhIyJN5CB7zyrGSfwlLuM1vzban0WRRCMWaEXRofMmUIQzdjJE3ia0hl96UK4pV
	pdAo0LSFYKfLcCICC86fZGV9I/zGpJE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722498346;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=57aFWh/Dub2/eLknoLCVanKkSP+ZYFr4JIyoVo1Rbc8=;
	b=tjLIbLL9uU6OhDAsPnxnrwRCM7tG81nTzVymIXAmpPgctzF/b6RTIe02qtAVTkel5HShP5
	nPIc5fmLYHsnJPDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=oUvyyWZK;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=tyQXmYOK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722498345; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=57aFWh/Dub2/eLknoLCVanKkSP+ZYFr4JIyoVo1Rbc8=;
	b=oUvyyWZKpVR6yFs6FdQLllMqMTeMwFJzW00ZW2enquDfVrfUsCy9II9x71fHpo3BXJdxCX
	G/kFatwjT3bfJfPUNuWDZk+qQqvsjQ7wdy1ZQ8Zo7/3LVgLQoyQ06J8qioc2EiNjjFTltn
	dpyZ2Gj4vMmvX0rCbYwa4ijoev3TJ5w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722498345;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=57aFWh/Dub2/eLknoLCVanKkSP+ZYFr4JIyoVo1Rbc8=;
	b=tyQXmYOKvvq9nFKZFgoqVgYELCmqTd3Y3J968ygf2H8eLLrNt8UbfJCRbsCv608D12gNmb
	i/tA4iju8hTA9LBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B858813946;
	Thu,  1 Aug 2024 07:45:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UKzhKyk9q2YLBQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 01 Aug 2024 07:45:45 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/3] ALSA: control: Rename ctl_files_rwlock to controls_rwlock
Date: Thu,  1 Aug 2024 09:46:07 +0200
Message-ID: <20240801074617.4997-2-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801074617.4997-1-tiwai@suse.de>
References: <20240801074617.4997-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-2.81 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -2.81
X-Rspamd-Queue-Id: D482C1F8D9

We'll re-use the existing rwlock for the protection of control list
lookup, too, and now rename it to a more generic name.

This is a preliminary change, only the rename of the struct field
here, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/core.h |  2 +-
 sound/core/control.c | 10 +++++-----
 sound/core/init.c    |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/sound/core.h b/include/sound/core.h
index dfef0c9d4b9f..55607e91d5fd 100644
--- a/include/sound/core.h
+++ b/include/sound/core.h
@@ -99,7 +99,7 @@ struct snd_card {
 	struct device *ctl_dev;		/* control device */
 	unsigned int last_numid;	/* last used numeric ID */
 	struct rw_semaphore controls_rwsem;	/* controls lock (list and values) */
-	rwlock_t ctl_files_rwlock;	/* ctl_files list lock */
+	rwlock_t controls_rwlock;	/* lock for ctl_files list */
 	int controls_count;		/* count of all controls */
 	size_t user_ctl_alloc_size;	// current memory allocation by user controls.
 	struct list_head controls;	/* all controls for this card */
diff --git a/sound/core/control.c b/sound/core/control.c
index f668826649b3..ae209dcfd049 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -79,7 +79,7 @@ static int snd_ctl_open(struct inode *inode, struct file *file)
 		ctl->preferred_subdevice[i] = -1;
 	ctl->pid = get_pid(task_pid(current));
 	file->private_data = ctl;
-	scoped_guard(write_lock_irqsave, &card->ctl_files_rwlock)
+	scoped_guard(write_lock_irqsave, &card->controls_rwlock)
 		list_add_tail(&ctl->list, &card->ctl_files);
 	snd_card_unref(card);
 	return 0;
@@ -117,7 +117,7 @@ static int snd_ctl_release(struct inode *inode, struct file *file)
 	file->private_data = NULL;
 	card = ctl->card;
 
-	scoped_guard(write_lock_irqsave, &card->ctl_files_rwlock)
+	scoped_guard(write_lock_irqsave, &card->controls_rwlock)
 		list_del(&ctl->list);
 
 	scoped_guard(rwsem_write, &card->controls_rwsem) {
@@ -157,7 +157,7 @@ void snd_ctl_notify(struct snd_card *card, unsigned int mask,
 	if (card->shutdown)
 		return;
 
-	guard(read_lock_irqsave)(&card->ctl_files_rwlock);
+	guard(read_lock_irqsave)(&card->controls_rwlock);
 #if IS_ENABLED(CONFIG_SND_MIXER_OSS)
 	card->mixer_oss_change_count++;
 #endif
@@ -2191,7 +2191,7 @@ int snd_ctl_get_preferred_subdevice(struct snd_card *card, int type)
 	struct snd_ctl_file *kctl;
 	int subdevice = -1;
 
-	guard(read_lock_irqsave)(&card->ctl_files_rwlock);
+	guard(read_lock_irqsave)(&card->controls_rwlock);
 	list_for_each_entry(kctl, &card->ctl_files, list) {
 		if (kctl->pid == task_pid(current)) {
 			subdevice = kctl->preferred_subdevice[type];
@@ -2341,7 +2341,7 @@ static int snd_ctl_dev_disconnect(struct snd_device *device)
 	struct snd_card *card = device->device_data;
 	struct snd_ctl_file *ctl;
 
-	scoped_guard(read_lock_irqsave, &card->ctl_files_rwlock) {
+	scoped_guard(read_lock_irqsave, &card->controls_rwlock) {
 		list_for_each_entry(ctl, &card->ctl_files, list) {
 			wake_up(&ctl->change_sleep);
 			snd_kill_fasync(ctl->fasync, SIGIO, POLL_ERR);
diff --git a/sound/core/init.c b/sound/core/init.c
index b9b708cf980d..b92aa7103589 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -315,7 +315,7 @@ static int snd_card_init(struct snd_card *card, struct device *parent,
 	card->module = module;
 	INIT_LIST_HEAD(&card->devices);
 	init_rwsem(&card->controls_rwsem);
-	rwlock_init(&card->ctl_files_rwlock);
+	rwlock_init(&card->controls_rwlock);
 	INIT_LIST_HEAD(&card->controls);
 	INIT_LIST_HEAD(&card->ctl_files);
 #ifdef CONFIG_SND_CTL_FAST_LOOKUP
-- 
2.43.0

