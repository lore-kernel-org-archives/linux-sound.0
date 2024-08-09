Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F021917DD
	for <linux-sound@vger.kernel.org>; Fri,  9 Aug 2024 10:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723200121; cv=none; b=iWniyLAhDpKtGba3RiJCN5TICXOEgBfoqcgEV3WEMMTlCfgKKXy6WivtzE2o7znmdGXVhskN6Y2auwGvMgzmv8gfYw8R03tkDozGDOSAG3xiUq8faf8fVz7c41Rbbm4GEkhEZmrxi3MZOKmp6Xx3XLUf6avEe5omzUiVNL+9Q1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723200121; c=relaxed/simple;
	bh=maZZhQETQGP/I/BKHFZDMcoh/CdC4at/lIphCEZo+4E=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l9L7Ufl9eMbwgb9gI4Qn3M1SgyrdubWtFUWyWHvziwALjTvLC5tMZJLSVdH+E4Bqna/8W1fT32mzU8h9ZgSf7O43LxexYzr7IllHawunrEHgyiY+3UsZWW6+LspITjPyAOXE5nRGXdKscPkLo6pNBcfpWgtmO/T5PNU4t3FSQ0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eQXISDOS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wMoTMDhD; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eQXISDOS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wMoTMDhD; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eQXISDOS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wMoTMDhD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eQXISDOS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wMoTMDhD"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 62B8221F1D;
	Fri,  9 Aug 2024 10:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723200118; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Il21LHBPFLTCnx+VIvZdNWm1NyRJ95wD/ZFfQldHlX8=;
	b=eQXISDOSfiiaajT6idnyIyTDwF1j578tyBnnbvAKKB9yJjdt5IZ9msgJE/NnumjEcP1AP5
	SsVNsbLVkjNWpeCRB2d17xIiFhsG/J3+0+xLk0f+bpl4YguwPsotzEJuxU4zK/Tm1GL0eC
	/xmZDPR0Ak1kxRE8kp0P7s1O0QHzWc8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723200118;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Il21LHBPFLTCnx+VIvZdNWm1NyRJ95wD/ZFfQldHlX8=;
	b=wMoTMDhD50I7ufiJKiFFLcCjwpt2kURD83yxmBJHhY7ptEqU4hbE/cPD5PQYCQr47ohBZ1
	mHKTnd0UZOnBeBDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723200118; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Il21LHBPFLTCnx+VIvZdNWm1NyRJ95wD/ZFfQldHlX8=;
	b=eQXISDOSfiiaajT6idnyIyTDwF1j578tyBnnbvAKKB9yJjdt5IZ9msgJE/NnumjEcP1AP5
	SsVNsbLVkjNWpeCRB2d17xIiFhsG/J3+0+xLk0f+bpl4YguwPsotzEJuxU4zK/Tm1GL0eC
	/xmZDPR0Ak1kxRE8kp0P7s1O0QHzWc8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723200118;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Il21LHBPFLTCnx+VIvZdNWm1NyRJ95wD/ZFfQldHlX8=;
	b=wMoTMDhD50I7ufiJKiFFLcCjwpt2kURD83yxmBJHhY7ptEqU4hbE/cPD5PQYCQr47ohBZ1
	mHKTnd0UZOnBeBDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 491DD13A7D;
	Fri,  9 Aug 2024 10:41:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IKGhEHbytWaqTAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 09 Aug 2024 10:41:58 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 1/3] ALSA: control: Rename ctl_files_rwlock to controls_rwlock
Date: Fri,  9 Aug 2024 12:42:29 +0200
Message-ID: <20240809104234.8488-2-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240809104234.8488-1-tiwai@suse.de>
References: <20240809104234.8488-1-tiwai@suse.de>
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
	NEURAL_HAM_SHORT(-0.20)[-0.992];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

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
index f64a555f404f..7c4410d1eeeb 100644
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
@@ -2178,7 +2178,7 @@ int snd_ctl_get_preferred_subdevice(struct snd_card *card, int type)
 	struct snd_ctl_file *kctl;
 	int subdevice = -1;
 
-	guard(read_lock_irqsave)(&card->ctl_files_rwlock);
+	guard(read_lock_irqsave)(&card->controls_rwlock);
 	list_for_each_entry(kctl, &card->ctl_files, list) {
 		if (kctl->pid == task_pid(current)) {
 			subdevice = kctl->preferred_subdevice[type];
@@ -2328,7 +2328,7 @@ static int snd_ctl_dev_disconnect(struct snd_device *device)
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

