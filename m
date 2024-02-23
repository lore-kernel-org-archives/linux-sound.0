Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D77684FA5
	for <linux-sound@vger.kernel.org>; Fri, 23 Feb 2024 16:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708705708; cv=none; b=IQ6ip9B9uXDBUFEFWPxPDj0CyjBnMqIek/qV9i28hx6EhPKW1+97XHV43sfiGuwiFfmzQ05eZPS6O1Kqbhw1DoPqlS0ysI8O/l4OHH2zqb6ZW/s5Hoxx9/wrn8vMCD/FJhU/4s00rYYkTPVZso9XocLQgchUIy6qrMyz3hxKXFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708705708; c=relaxed/simple;
	bh=IR82NPAL7BQRTnSTuDAhquA7dfoxAafYkT8UgS02f/0=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=khiWHeYWvqRv5zq0WhD453eAUnH7Cx5MeTtvEmBFPraePfKqODGXVcc0/oa1MA6MkzMr2h84GGT5b/6L0eW632chObodDJmuYpyR7DvXqR3y4Ymj0+MuYvMcCQkgMiqPuCuMJ4RFpTJeO+YtboZaD61HkjooKVo5tW87o4j+BQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LhbI1TFe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5NLjSeAa; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LhbI1TFe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5NLjSeAa; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LhbI1TFe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5NLjSeAa";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LhbI1TFe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5NLjSeAa"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0849F1FD3C;
	Fri, 23 Feb 2024 16:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708705700; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=px5YcOaGyp0fjIZiLQMVzH2fgPhpHk/y6ZU+hcDEWkw=;
	b=LhbI1TFezPLOWclXkHmd4TTSusqZbiu8SdtAHxn+ynQnwNYk8v1TSlwn0Sw3gSiv4REzxz
	N3Fo6vMSrsEW+Zf4p9DwkqQnOrS5uWbnepDX+3mc4AiJXos0l+TPlqmklCuaXFZky9zR44
	V2r/JfUkv0LfWe1htFUyOhd3dTOWCrM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708705700;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=px5YcOaGyp0fjIZiLQMVzH2fgPhpHk/y6ZU+hcDEWkw=;
	b=5NLjSeAaw1ivEZW5bi5q3NC/xB8ficu/cwa60t2/knQEAWw2xo4Nn6GirG45AUOdUNn6FD
	9GC8PmFaS/nfY4CA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708705700; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=px5YcOaGyp0fjIZiLQMVzH2fgPhpHk/y6ZU+hcDEWkw=;
	b=LhbI1TFezPLOWclXkHmd4TTSusqZbiu8SdtAHxn+ynQnwNYk8v1TSlwn0Sw3gSiv4REzxz
	N3Fo6vMSrsEW+Zf4p9DwkqQnOrS5uWbnepDX+3mc4AiJXos0l+TPlqmklCuaXFZky9zR44
	V2r/JfUkv0LfWe1htFUyOhd3dTOWCrM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708705700;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=px5YcOaGyp0fjIZiLQMVzH2fgPhpHk/y6ZU+hcDEWkw=;
	b=5NLjSeAaw1ivEZW5bi5q3NC/xB8ficu/cwa60t2/knQEAWw2xo4Nn6GirG45AUOdUNn6FD
	9GC8PmFaS/nfY4CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E1ADE13AC1;
	Fri, 23 Feb 2024 16:28:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GGe5NaPH2GWaMQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 Feb 2024 16:28:19 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 11/24] ALSA: core: Use guard() for locking
Date: Fri, 23 Feb 2024 17:27:57 +0100
Message-Id: <20240223162810.32302-12-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240223162810.32302-1-tiwai@suse.de>
References: <20240223162810.32302-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [1.90 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_ONE(0.00)[1];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Level: *
X-Spam-Score: 1.90
X-Spam-Flag: NO

We can simplify the code gracefully with new guard() macro and co for
automatic cleanup of locks.

Only the code refactoring, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/init.c      | 199 +++++++++++++++++++----------------------
 sound/core/sound.c     |  28 +++---
 sound/core/sound_oss.c |  17 ++--
 3 files changed, 107 insertions(+), 137 deletions(-)

diff --git a/sound/core/init.c b/sound/core/init.c
index 22c0d217b860..4ed5037d8693 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -284,30 +284,31 @@ static int snd_card_init(struct snd_card *card, struct device *parent,
 	if (xid)
 		strscpy(card->id, xid, sizeof(card->id));
 	err = 0;
-	mutex_lock(&snd_card_mutex);
-	if (idx < 0) /* first check the matching module-name slot */
-		idx = get_slot_from_bitmask(idx, module_slot_match, module);
-	if (idx < 0) /* if not matched, assign an empty slot */
-		idx = get_slot_from_bitmask(idx, check_empty_slot, module);
-	if (idx < 0)
-		err = -ENODEV;
-	else if (idx < snd_ecards_limit) {
-		if (test_bit(idx, snd_cards_lock))
-			err = -EBUSY;	/* invalid */
-	} else if (idx >= SNDRV_CARDS)
-		err = -ENODEV;
+	scoped_guard(mutex, &snd_card_mutex) {
+		if (idx < 0) /* first check the matching module-name slot */
+			idx = get_slot_from_bitmask(idx, module_slot_match, module);
+		if (idx < 0) /* if not matched, assign an empty slot */
+			idx = get_slot_from_bitmask(idx, check_empty_slot, module);
+		if (idx < 0)
+			err = -ENODEV;
+		else if (idx < snd_ecards_limit) {
+			if (test_bit(idx, snd_cards_lock))
+				err = -EBUSY;	/* invalid */
+		} else if (idx >= SNDRV_CARDS)
+			err = -ENODEV;
+		if (!err) {
+			set_bit(idx, snd_cards_lock);		/* lock it */
+			if (idx >= snd_ecards_limit)
+				snd_ecards_limit = idx + 1; /* increase the limit */
+		}
+	}
 	if (err < 0) {
-		mutex_unlock(&snd_card_mutex);
 		dev_err(parent, "cannot find the slot for index %d (range 0-%i), error: %d\n",
-			 idx, snd_ecards_limit - 1, err);
+			idx, snd_ecards_limit - 1, err);
 		if (!card->managed)
 			kfree(card); /* manually free here, as no destructor called */
 		return err;
 	}
-	set_bit(idx, snd_cards_lock);		/* lock it */
-	if (idx >= snd_ecards_limit)
-		snd_ecards_limit = idx + 1; /* increase the limit */
-	mutex_unlock(&snd_card_mutex);
 	card->dev = parent;
 	card->number = idx;
 #ifdef MODULE
@@ -386,11 +387,10 @@ struct snd_card *snd_card_ref(int idx)
 {
 	struct snd_card *card;
 
-	mutex_lock(&snd_card_mutex);
+	guard(mutex)(&snd_card_mutex);
 	card = snd_cards[idx];
 	if (card)
 		get_device(&card->card_dev);
-	mutex_unlock(&snd_card_mutex);
 	return card;
 }
 EXPORT_SYMBOL_GPL(snd_card_ref);
@@ -398,12 +398,8 @@ EXPORT_SYMBOL_GPL(snd_card_ref);
 /* return non-zero if a card is already locked */
 int snd_card_locked(int card)
 {
-	int locked;
-
-	mutex_lock(&snd_card_mutex);
-	locked = test_bit(card, snd_cards_lock);
-	mutex_unlock(&snd_card_mutex);
-	return locked;
+	guard(mutex)(&snd_card_mutex);
+	return test_bit(card, snd_cards_lock);
 }
 
 static loff_t snd_disconnect_llseek(struct file *file, loff_t offset, int orig)
@@ -427,15 +423,15 @@ static int snd_disconnect_release(struct inode *inode, struct file *file)
 {
 	struct snd_monitor_file *df = NULL, *_df;
 
-	spin_lock(&shutdown_lock);
-	list_for_each_entry(_df, &shutdown_files, shutdown_list) {
-		if (_df->file == file) {
-			df = _df;
-			list_del_init(&df->shutdown_list);
-			break;
+	scoped_guard(spinlock, &shutdown_lock) {
+		list_for_each_entry(_df, &shutdown_files, shutdown_list) {
+			if (_df->file == file) {
+				df = _df;
+				list_del_init(&df->shutdown_list);
+				break;
+			}
 		}
 	}
-	spin_unlock(&shutdown_lock);
 
 	if (likely(df)) {
 		if ((file->f_flags & FASYNC) && df->disconnected_f_op->fasync)
@@ -501,27 +497,24 @@ void snd_card_disconnect(struct snd_card *card)
 	if (!card)
 		return;
 
-	spin_lock(&card->files_lock);
-	if (card->shutdown) {
-		spin_unlock(&card->files_lock);
-		return;
+	scoped_guard(spinlock, &card->files_lock) {
+		if (card->shutdown)
+			return;
+		card->shutdown = 1;
+
+		/* replace file->f_op with special dummy operations */
+		list_for_each_entry(mfile, &card->files_list, list) {
+			/* it's critical part, use endless loop */
+			/* we have no room to fail */
+			mfile->disconnected_f_op = mfile->file->f_op;
+
+			scoped_guard(spinlock, &shutdown_lock)
+				list_add(&mfile->shutdown_list, &shutdown_files);
+
+			mfile->file->f_op = &snd_shutdown_f_ops;
+			fops_get(mfile->file->f_op);
+		}
 	}
-	card->shutdown = 1;
-
-	/* replace file->f_op with special dummy operations */
-	list_for_each_entry(mfile, &card->files_list, list) {
-		/* it's critical part, use endless loop */
-		/* we have no room to fail */
-		mfile->disconnected_f_op = mfile->file->f_op;
-
-		spin_lock(&shutdown_lock);
-		list_add(&mfile->shutdown_list, &shutdown_files);
-		spin_unlock(&shutdown_lock);
-
-		mfile->file->f_op = &snd_shutdown_f_ops;
-		fops_get(mfile->file->f_op);
-	}
-	spin_unlock(&card->files_lock);	
 
 	/* notify all connected devices about disconnection */
 	/* at this point, they cannot respond to any calls except release() */
@@ -544,10 +537,10 @@ void snd_card_disconnect(struct snd_card *card)
 	}
 
 	/* disable fops (user space) operations for ALSA API */
-	mutex_lock(&snd_card_mutex);
-	snd_cards[card->number] = NULL;
-	clear_bit(card->number, snd_cards_lock);
-	mutex_unlock(&snd_card_mutex);
+	scoped_guard(mutex, &snd_card_mutex) {
+		snd_cards[card->number] = NULL;
+		clear_bit(card->number, snd_cards_lock);
+	}
 
 #ifdef CONFIG_PM
 	wake_up(&card->power_sleep);
@@ -569,11 +562,10 @@ void snd_card_disconnect_sync(struct snd_card *card)
 {
 	snd_card_disconnect(card);
 
-	spin_lock_irq(&card->files_lock);
+	guard(spinlock_irq)(&card->files_lock);
 	wait_event_lock_irq(card->remove_sleep,
 			    list_empty(&card->files_list),
 			    card->files_lock);
-	spin_unlock_irq(&card->files_lock);
 }
 EXPORT_SYMBOL_GPL(snd_card_disconnect_sync);
 
@@ -767,9 +759,8 @@ void snd_card_set_id(struct snd_card *card, const char *nid)
 	/* check if user specified own card->id */
 	if (card->id[0] != '\0')
 		return;
-	mutex_lock(&snd_card_mutex);
+	guard(mutex)(&snd_card_mutex);
 	snd_card_set_id_no_lock(card, nid, nid);
-	mutex_unlock(&snd_card_mutex);
 }
 EXPORT_SYMBOL(snd_card_set_id);
 
@@ -797,14 +788,11 @@ static ssize_t id_store(struct device *dev, struct device_attribute *attr,
 	}
 	memcpy(buf1, buf, copy);
 	buf1[copy] = '\0';
-	mutex_lock(&snd_card_mutex);
-	if (!card_id_ok(NULL, buf1)) {
-		mutex_unlock(&snd_card_mutex);
+	guard(mutex)(&snd_card_mutex);
+	if (!card_id_ok(NULL, buf1))
 		return -EEXIST;
-	}
 	strcpy(card->id, buf1);
 	snd_info_card_id_change(card);
-	mutex_unlock(&snd_card_mutex);
 
 	return count;
 }
@@ -897,26 +885,27 @@ int snd_card_register(struct snd_card *card)
 	err = snd_device_register_all(card);
 	if (err < 0)
 		return err;
-	mutex_lock(&snd_card_mutex);
-	if (snd_cards[card->number]) {
-		/* already registered */
-		mutex_unlock(&snd_card_mutex);
-		return snd_info_card_register(card); /* register pending info */
+	scoped_guard(mutex, &snd_card_mutex) {
+		if (snd_cards[card->number]) {
+			/* already registered */
+			return snd_info_card_register(card); /* register pending info */
+		}
+		if (*card->id) {
+			/* make a unique id name from the given string */
+			char tmpid[sizeof(card->id)];
+
+			memcpy(tmpid, card->id, sizeof(card->id));
+			snd_card_set_id_no_lock(card, tmpid, tmpid);
+		} else {
+			/* create an id from either shortname or longname */
+			const char *src;
+
+			src = *card->shortname ? card->shortname : card->longname;
+			snd_card_set_id_no_lock(card, src,
+						retrieve_id_from_card_name(src));
+		}
+		snd_cards[card->number] = card;
 	}
-	if (*card->id) {
-		/* make a unique id name from the given string */
-		char tmpid[sizeof(card->id)];
-		memcpy(tmpid, card->id, sizeof(card->id));
-		snd_card_set_id_no_lock(card, tmpid, tmpid);
-	} else {
-		/* create an id from either shortname or longname */
-		const char *src;
-		src = *card->shortname ? card->shortname : card->longname;
-		snd_card_set_id_no_lock(card, src,
-					retrieve_id_from_card_name(src));
-	}
-	snd_cards[card->number] = card;
-	mutex_unlock(&snd_card_mutex);
 	err = snd_info_card_register(card);
 	if (err < 0)
 		return err;
@@ -937,7 +926,7 @@ static void snd_card_info_read(struct snd_info_entry *entry,
 	struct snd_card *card;
 
 	for (idx = count = 0; idx < SNDRV_CARDS; idx++) {
-		mutex_lock(&snd_card_mutex);
+		guard(mutex)(&snd_card_mutex);
 		card = snd_cards[idx];
 		if (card) {
 			count++;
@@ -949,7 +938,6 @@ static void snd_card_info_read(struct snd_info_entry *entry,
 			snd_iprintf(buffer, "                      %s\n",
 					card->longname);
 		}
-		mutex_unlock(&snd_card_mutex);
 	}
 	if (!count)
 		snd_iprintf(buffer, "--- no soundcards ---\n");
@@ -962,13 +950,12 @@ void snd_card_info_read_oss(struct snd_info_buffer *buffer)
 	struct snd_card *card;
 
 	for (idx = count = 0; idx < SNDRV_CARDS; idx++) {
-		mutex_lock(&snd_card_mutex);
+		guard(mutex)(&snd_card_mutex);
 		card = snd_cards[idx];
 		if (card) {
 			count++;
 			snd_iprintf(buffer, "%s\n", card->longname);
 		}
-		mutex_unlock(&snd_card_mutex);
 	}
 	if (!count) {
 		snd_iprintf(buffer, "--- no soundcards ---\n");
@@ -985,12 +972,11 @@ static void snd_card_module_info_read(struct snd_info_entry *entry,
 	struct snd_card *card;
 
 	for (idx = 0; idx < SNDRV_CARDS; idx++) {
-		mutex_lock(&snd_card_mutex);
+		guard(mutex)(&snd_card_mutex);
 		card = snd_cards[idx];
 		if (card)
 			snd_iprintf(buffer, "%2i %s\n",
 				    idx, card->module->name);
-		mutex_unlock(&snd_card_mutex);
 	}
 }
 #endif
@@ -1072,15 +1058,13 @@ int snd_card_file_add(struct snd_card *card, struct file *file)
 	mfile->file = file;
 	mfile->disconnected_f_op = NULL;
 	INIT_LIST_HEAD(&mfile->shutdown_list);
-	spin_lock(&card->files_lock);
+	guard(spinlock)(&card->files_lock);
 	if (card->shutdown) {
-		spin_unlock(&card->files_lock);
 		kfree(mfile);
 		return -ENODEV;
 	}
 	list_add(&mfile->list, &card->files_list);
 	get_device(&card->card_dev);
-	spin_unlock(&card->files_lock);
 	return 0;
 }
 EXPORT_SYMBOL(snd_card_file_add);
@@ -1102,22 +1086,21 @@ int snd_card_file_remove(struct snd_card *card, struct file *file)
 {
 	struct snd_monitor_file *mfile, *found = NULL;
 
-	spin_lock(&card->files_lock);
-	list_for_each_entry(mfile, &card->files_list, list) {
-		if (mfile->file == file) {
-			list_del(&mfile->list);
-			spin_lock(&shutdown_lock);
-			list_del(&mfile->shutdown_list);
-			spin_unlock(&shutdown_lock);
-			if (mfile->disconnected_f_op)
-				fops_put(mfile->disconnected_f_op);
-			found = mfile;
-			break;
+	scoped_guard(spinlock, &card->files_lock) {
+		list_for_each_entry(mfile, &card->files_list, list) {
+			if (mfile->file == file) {
+				list_del(&mfile->list);
+				scoped_guard(spinlock, &shutdown_lock)
+					list_del(&mfile->shutdown_list);
+				if (mfile->disconnected_f_op)
+					fops_put(mfile->disconnected_f_op);
+				found = mfile;
+				break;
+			}
 		}
+		if (list_empty(&card->files_list))
+			wake_up_all(&card->remove_sleep);
 	}
-	if (list_empty(&card->files_list))
-		wake_up_all(&card->remove_sleep);
-	spin_unlock(&card->files_lock);
 	if (!found) {
 		dev_err(card->dev, "card file remove problem (%p)\n", file);
 		return -ENOENT;
diff --git a/sound/core/sound.c b/sound/core/sound.c
index df5571d98629..b9db9aa0bfcb 100644
--- a/sound/core/sound.c
+++ b/sound/core/sound.c
@@ -103,7 +103,7 @@ void *snd_lookup_minor_data(unsigned int minor, int type)
 
 	if (minor >= ARRAY_SIZE(snd_minors))
 		return NULL;
-	mutex_lock(&sound_mutex);
+	guard(mutex)(&sound_mutex);
 	mreg = snd_minors[minor];
 	if (mreg && mreg->type == type) {
 		private_data = mreg->private_data;
@@ -111,7 +111,6 @@ void *snd_lookup_minor_data(unsigned int minor, int type)
 			get_device(&mreg->card_ptr->card_dev);
 	} else
 		private_data = NULL;
-	mutex_unlock(&sound_mutex);
 	return private_data;
 }
 EXPORT_SYMBOL(snd_lookup_minor_data);
@@ -150,17 +149,15 @@ static int snd_open(struct inode *inode, struct file *file)
 
 	if (minor >= ARRAY_SIZE(snd_minors))
 		return -ENODEV;
-	mutex_lock(&sound_mutex);
-	mptr = snd_minors[minor];
-	if (mptr == NULL) {
-		mptr = autoload_device(minor);
-		if (!mptr) {
-			mutex_unlock(&sound_mutex);
-			return -ENODEV;
+	scoped_guard(mutex, &sound_mutex) {
+		mptr = snd_minors[minor];
+		if (mptr == NULL) {
+			mptr = autoload_device(minor);
+			if (!mptr)
+				return -ENODEV;
 		}
+		new_fops = fops_get(mptr->f_ops);
 	}
-	new_fops = fops_get(mptr->f_ops);
-	mutex_unlock(&sound_mutex);
 	if (!new_fops)
 		return -ENODEV;
 	replace_fops(file, new_fops);
@@ -269,7 +266,7 @@ int snd_register_device(int type, struct snd_card *card, int dev,
 	preg->f_ops = f_ops;
 	preg->private_data = private_data;
 	preg->card_ptr = card;
-	mutex_lock(&sound_mutex);
+	guard(mutex)(&sound_mutex);
 	minor = snd_find_free_minor(type, card, dev);
 	if (minor < 0) {
 		err = minor;
@@ -284,7 +281,6 @@ int snd_register_device(int type, struct snd_card *card, int dev,
 
 	snd_minors[minor] = preg;
  error:
-	mutex_unlock(&sound_mutex);
 	if (err < 0)
 		kfree(preg);
 	return err;
@@ -305,7 +301,7 @@ int snd_unregister_device(struct device *dev)
 	int minor;
 	struct snd_minor *preg;
 
-	mutex_lock(&sound_mutex);
+	guard(mutex)(&sound_mutex);
 	for (minor = 0; minor < ARRAY_SIZE(snd_minors); ++minor) {
 		preg = snd_minors[minor];
 		if (preg && preg->dev == dev) {
@@ -315,7 +311,6 @@ int snd_unregister_device(struct device *dev)
 			break;
 		}
 	}
-	mutex_unlock(&sound_mutex);
 	if (minor >= ARRAY_SIZE(snd_minors))
 		return -ENOENT;
 	return 0;
@@ -355,7 +350,7 @@ static void snd_minor_info_read(struct snd_info_entry *entry, struct snd_info_bu
 	int minor;
 	struct snd_minor *mptr;
 
-	mutex_lock(&sound_mutex);
+	guard(mutex)(&sound_mutex);
 	for (minor = 0; minor < SNDRV_OS_MINORS; ++minor) {
 		mptr = snd_minors[minor];
 		if (!mptr)
@@ -373,7 +368,6 @@ static void snd_minor_info_read(struct snd_info_entry *entry, struct snd_info_bu
 			snd_iprintf(buffer, "%3i:        : %s\n", minor,
 				    snd_device_type_name(mptr->type));
 	}
-	mutex_unlock(&sound_mutex);
 }
 
 int __init snd_minor_info_init(void)
diff --git a/sound/core/sound_oss.c b/sound/core/sound_oss.c
index 2751bf2ff61b..d65cc6fee2e6 100644
--- a/sound/core/sound_oss.c
+++ b/sound/core/sound_oss.c
@@ -29,7 +29,7 @@ void *snd_lookup_oss_minor_data(unsigned int minor, int type)
 
 	if (minor >= ARRAY_SIZE(snd_oss_minors))
 		return NULL;
-	mutex_lock(&sound_oss_mutex);
+	guard(mutex)(&sound_oss_mutex);
 	mreg = snd_oss_minors[minor];
 	if (mreg && mreg->type == type) {
 		private_data = mreg->private_data;
@@ -37,7 +37,6 @@ void *snd_lookup_oss_minor_data(unsigned int minor, int type)
 			get_device(&mreg->card_ptr->card_dev);
 	} else
 		private_data = NULL;
-	mutex_unlock(&sound_oss_mutex);
 	return private_data;
 }
 EXPORT_SYMBOL(snd_lookup_oss_minor_data);
@@ -106,7 +105,7 @@ int snd_register_oss_device(int type, struct snd_card *card, int dev,
 	preg->f_ops = f_ops;
 	preg->private_data = private_data;
 	preg->card_ptr = card;
-	mutex_lock(&sound_oss_mutex);
+	guard(mutex)(&sound_oss_mutex);
 	snd_oss_minors[minor] = preg;
 	minor_unit = SNDRV_MINOR_OSS_DEVICE(minor);
 	switch (minor_unit) {
@@ -130,7 +129,6 @@ int snd_register_oss_device(int type, struct snd_card *card, int dev,
 			goto __end;
 		snd_oss_minors[track2] = preg;
 	}
-	mutex_unlock(&sound_oss_mutex);
 	return 0;
 
       __end:
@@ -139,7 +137,6 @@ int snd_register_oss_device(int type, struct snd_card *card, int dev,
       	if (register1 >= 0)
       		unregister_sound_special(register1);
 	snd_oss_minors[minor] = NULL;
-	mutex_unlock(&sound_oss_mutex);
 	kfree(preg);
       	return -EBUSY;
 }
@@ -156,12 +153,10 @@ int snd_unregister_oss_device(int type, struct snd_card *card, int dev)
 		return 0;
 	if (minor < 0)
 		return minor;
-	mutex_lock(&sound_oss_mutex);
+	guard(mutex)(&sound_oss_mutex);
 	mptr = snd_oss_minors[minor];
-	if (mptr == NULL) {
-		mutex_unlock(&sound_oss_mutex);
+	if (mptr == NULL)
 		return -ENOENT;
-	}
 	switch (SNDRV_MINOR_OSS_DEVICE(minor)) {
 	case SNDRV_MINOR_OSS_PCM:
 		track2 = SNDRV_MINOR_OSS(cidx, SNDRV_MINOR_OSS_AUDIO);
@@ -176,7 +171,6 @@ int snd_unregister_oss_device(int type, struct snd_card *card, int dev)
 	if (track2 >= 0)
 		snd_oss_minors[track2] = NULL;
 	snd_oss_minors[minor] = NULL;
-	mutex_unlock(&sound_oss_mutex);
 
 	/* call unregister_sound_special() outside sound_oss_mutex;
 	 * otherwise may deadlock, as it can trigger the release of a card
@@ -220,7 +214,7 @@ static void snd_minor_info_oss_read(struct snd_info_entry *entry,
 	int minor;
 	struct snd_minor *mptr;
 
-	mutex_lock(&sound_oss_mutex);
+	guard(mutex)(&sound_oss_mutex);
 	for (minor = 0; minor < SNDRV_OSS_MINORS; ++minor) {
 		mptr = snd_oss_minors[minor];
 		if (!mptr)
@@ -233,7 +227,6 @@ static void snd_minor_info_oss_read(struct snd_info_entry *entry,
 			snd_iprintf(buffer, "%3i:       : %s\n", minor,
 				    snd_oss_device_type_name(mptr->type));
 	}
-	mutex_unlock(&sound_oss_mutex);
 }
 
 
-- 
2.35.3

