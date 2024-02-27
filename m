Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C3F133416
	for <linux-sound@vger.kernel.org>; Tue, 27 Feb 2024 08:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709024004; cv=none; b=oTZwebcJgEbdSakwkXpeP0pxoFJ3Hn5seT0IUn5BhNZf2SIgPF0dJzbU/pPDky+aBqfx9aGJNI0Xc/u0S4cywNca7wDXHgNw/Ou6xaXleyzNTKtyMTV3zXO+mfQxL3L6kbdTkxT7RRMAvnzvBvHeAFfpoWhx2pQayq826NqsVjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709024004; c=relaxed/simple;
	bh=my8aQu5+qUXdy7wdXjyncNKiWsGU70cj9e+NgV3m4Ms=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lnSvw4QLLHBM0NFJIJWQ6keyK7Ht+dR+Y1XlQGZsMmvIMC0iRT3zzc4z1SYLqygfaP8wdrzxjHECkl9vDfOI8EMjyxADfgaXNqjEzRJ8YtcDJlY4vWIUZ8XPYLdByFgtIZ0O2fh1918vNTyLfzJs6dTLGz1Z6hpsutJjI16z67I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tjKeYIDL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RRq1o1sh; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tjKeYIDL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RRq1o1sh; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tjKeYIDL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RRq1o1sh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tjKeYIDL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RRq1o1sh"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 01DE722774;
	Tue, 27 Feb 2024 08:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709023995; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7jSwN4VC5k/7J0k/leqZ5mHEEbI1Rq3zXgXP729gKEU=;
	b=tjKeYIDLBpYq2TjaQ5a4FBuUpznRBnZX79lVXENZfR90zHnT+s4e5AC4S/Tqagvc01mVRm
	GsrhWYfC7Mqdk0zegEQTAxE3b+Kyh6gyELi3YIynY5zlrg3EQUSXfkXN/97esipeoFhgf1
	k+e6LmpituPin5t/FLmc15peBmk6ROA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709023995;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7jSwN4VC5k/7J0k/leqZ5mHEEbI1Rq3zXgXP729gKEU=;
	b=RRq1o1sht2oUe8pygk0eH27JS/JzRjaVwiEVOknBVfqvI6I8BlMCgrBnqkbyDNMwV7XmwB
	c+/P9WFfhvk/fbCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709023995; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7jSwN4VC5k/7J0k/leqZ5mHEEbI1Rq3zXgXP729gKEU=;
	b=tjKeYIDLBpYq2TjaQ5a4FBuUpznRBnZX79lVXENZfR90zHnT+s4e5AC4S/Tqagvc01mVRm
	GsrhWYfC7Mqdk0zegEQTAxE3b+Kyh6gyELi3YIynY5zlrg3EQUSXfkXN/97esipeoFhgf1
	k+e6LmpituPin5t/FLmc15peBmk6ROA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709023995;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7jSwN4VC5k/7J0k/leqZ5mHEEbI1Rq3zXgXP729gKEU=;
	b=RRq1o1sht2oUe8pygk0eH27JS/JzRjaVwiEVOknBVfqvI6I8BlMCgrBnqkbyDNMwV7XmwB
	c+/P9WFfhvk/fbCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DE4E813A58;
	Tue, 27 Feb 2024 08:53:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OMIlNfqi3WWeaQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 27 Feb 2024 08:53:14 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v3 06/24] ALSA: info: Use guard() for locking
Date: Tue, 27 Feb 2024 09:52:48 +0100
Message-Id: <20240227085306.9764-7-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240227085306.9764-1-tiwai@suse.de>
References: <20240227085306.9764-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
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
 sound/core/info.c     | 93 ++++++++++++++-----------------------------
 sound/core/info_oss.c | 10 ++---
 2 files changed, 33 insertions(+), 70 deletions(-)

diff --git a/sound/core/info.c b/sound/core/info.c
index e2f302e55bbb..1f5b8a3d9e3b 100644
--- a/sound/core/info.c
+++ b/sound/core/info.c
@@ -105,17 +105,15 @@ static loff_t snd_info_entry_llseek(struct file *file, loff_t offset, int orig)
 {
 	struct snd_info_private_data *data;
 	struct snd_info_entry *entry;
-	loff_t ret = -EINVAL, size;
+	loff_t size;
 
 	data = file->private_data;
 	entry = data->entry;
-	mutex_lock(&entry->access);
-	if (entry->c.ops->llseek) {
-		ret = entry->c.ops->llseek(entry,
-					   data->file_private_data,
-					   file, offset, orig);
-		goto out;
-	}
+	guard(mutex)(&entry->access);
+	if (entry->c.ops->llseek)
+		return entry->c.ops->llseek(entry,
+					    data->file_private_data,
+					    file, offset, orig);
 
 	size = entry->size;
 	switch (orig) {
@@ -126,21 +124,18 @@ static loff_t snd_info_entry_llseek(struct file *file, loff_t offset, int orig)
 		break;
 	case SEEK_END:
 		if (!size)
-			goto out;
+			return -EINVAL;
 		offset += size;
 		break;
 	default:
-		goto out;
+		return -EINVAL;
 	}
 	if (offset < 0)
-		goto out;
+		return -EINVAL;
 	if (size && offset > size)
 		offset = size;
 	file->f_pos = offset;
-	ret = offset;
- out:
-	mutex_unlock(&entry->access);
-	return ret;
+	return offset;
 }
 
 static ssize_t snd_info_entry_read(struct file *file, char __user *buffer,
@@ -238,10 +233,10 @@ static int snd_info_entry_open(struct inode *inode, struct file *file)
 	struct snd_info_private_data *data;
 	int mode, err;
 
-	mutex_lock(&info_mutex);
+	guard(mutex)(&info_mutex);
 	err = alloc_info_private(entry, &data);
 	if (err < 0)
-		goto unlock;
+		return err;
 
 	mode = file->f_flags & O_ACCMODE;
 	if (((mode == O_RDONLY || mode == O_RDWR) && !entry->c.ops->read) ||
@@ -257,14 +252,11 @@ static int snd_info_entry_open(struct inode *inode, struct file *file)
 	}
 
 	file->private_data = data;
-	mutex_unlock(&info_mutex);
 	return 0;
 
  error:
 	kfree(data);
 	module_put(entry->module);
- unlock:
-	mutex_unlock(&info_mutex);
 	return err;
 }
 
@@ -306,7 +298,6 @@ static ssize_t snd_info_text_entry_write(struct file *file,
 	struct snd_info_buffer *buf;
 	loff_t pos;
 	size_t next;
-	int err = 0;
 
 	if (!entry->c.text.write)
 		return -EIO;
@@ -317,34 +308,24 @@ static ssize_t snd_info_text_entry_write(struct file *file,
 	/* don't handle too large text inputs */
 	if (next > 16 * 1024)
 		return -EIO;
-	mutex_lock(&entry->access);
+	guard(mutex)(&entry->access);
 	buf = data->wbuffer;
 	if (!buf) {
 		data->wbuffer = buf = kzalloc(sizeof(*buf), GFP_KERNEL);
-		if (!buf) {
-			err = -ENOMEM;
-			goto error;
-		}
+		if (!buf)
+			return -ENOMEM;
 	}
 	if (next > buf->len) {
 		char *nbuf = kvzalloc(PAGE_ALIGN(next), GFP_KERNEL);
-		if (!nbuf) {
-			err = -ENOMEM;
-			goto error;
-		}
+		if (!nbuf)
+			return -ENOMEM;
 		kvfree(buf->buffer);
 		buf->buffer = nbuf;
 		buf->len = PAGE_ALIGN(next);
 	}
-	if (copy_from_user(buf->buffer + pos, buffer, count)) {
-		err = -EFAULT;
-		goto error;
-	}
+	if (copy_from_user(buf->buffer + pos, buffer, count))
+		return -EFAULT;
 	buf->size = next;
- error:
-	mutex_unlock(&entry->access);
-	if (err < 0)
-		return err;
 	*offset = next;
 	return count;
 }
@@ -369,10 +350,10 @@ static int snd_info_text_entry_open(struct inode *inode, struct file *file)
 	struct snd_info_private_data *data;
 	int err;
 
-	mutex_lock(&info_mutex);
+	guard(mutex)(&info_mutex);
 	err = alloc_info_private(entry, &data);
 	if (err < 0)
-		goto unlock;
+		return err;
 
 	data->rbuffer = kzalloc(sizeof(*data->rbuffer), GFP_KERNEL);
 	if (!data->rbuffer) {
@@ -386,15 +367,12 @@ static int snd_info_text_entry_open(struct inode *inode, struct file *file)
 		err = single_open(file, snd_info_seq_show, data);
 	if (err < 0)
 		goto error;
-	mutex_unlock(&info_mutex);
 	return 0;
 
  error:
 	kfree(data->rbuffer);
 	kfree(data);
 	module_put(entry->module);
- unlock:
-	mutex_unlock(&info_mutex);
 	return err;
 }
 
@@ -549,7 +527,7 @@ int snd_info_card_register(struct snd_card *card)
  */
 void snd_info_card_id_change(struct snd_card *card)
 {
-	mutex_lock(&info_mutex);
+	guard(mutex)(&info_mutex);
 	if (card->proc_root_link) {
 		proc_remove(card->proc_root_link);
 		card->proc_root_link = NULL;
@@ -558,7 +536,6 @@ void snd_info_card_id_change(struct snd_card *card)
 		card->proc_root_link = proc_symlink(card->id,
 						    snd_proc_root->p,
 						    card->proc_root->name);
-	mutex_unlock(&info_mutex);
 }
 
 /*
@@ -574,12 +551,11 @@ void snd_info_card_disconnect(struct snd_card *card)
 	if (card->proc_root)
 		proc_remove(card->proc_root->p);
 
-	mutex_lock(&info_mutex);
+	guard(mutex)(&info_mutex);
 	if (card->proc_root)
 		snd_info_clear_entries(card->proc_root);
 	card->proc_root_link = NULL;
 	card->proc_root = NULL;
-	mutex_unlock(&info_mutex);
 }
 
 /*
@@ -703,9 +679,8 @@ snd_info_create_entry(const char *name, struct snd_info_entry *parent,
 	entry->parent = parent;
 	entry->module = module;
 	if (parent) {
-		mutex_lock(&parent->access);
+		guard(mutex)(&parent->access);
 		list_add_tail(&entry->list, &parent->children);
-		mutex_unlock(&parent->access);
 	}
 	return entry;
 }
@@ -775,9 +750,8 @@ void snd_info_free_entry(struct snd_info_entry * entry)
 		return;
 	if (entry->p) {
 		proc_remove(entry->p);
-		mutex_lock(&info_mutex);
+		guard(mutex)(&info_mutex);
 		snd_info_clear_entries(entry);
-		mutex_unlock(&info_mutex);
 	}
 
 	/* free all children at first */
@@ -786,9 +760,8 @@ void snd_info_free_entry(struct snd_info_entry * entry)
 
 	p = entry->parent;
 	if (p) {
-		mutex_lock(&p->access);
+		guard(mutex)(&p->access);
 		list_del(&entry->list);
-		mutex_unlock(&p->access);
 	}
 	kfree(entry->name);
 	if (entry->private_free)
@@ -804,15 +777,13 @@ static int __snd_info_register(struct snd_info_entry *entry)
 	if (snd_BUG_ON(!entry))
 		return -ENXIO;
 	root = entry->parent == NULL ? snd_proc_root->p : entry->parent->p;
-	mutex_lock(&info_mutex);
+	guard(mutex)(&info_mutex);
 	if (entry->p || !root)
-		goto unlock;
+		return 0;
 	if (S_ISDIR(entry->mode)) {
 		p = proc_mkdir_mode(entry->name, entry->mode, root);
-		if (!p) {
-			mutex_unlock(&info_mutex);
+		if (!p)
 			return -ENOMEM;
-		}
 	} else {
 		const struct proc_ops *ops;
 		if (entry->content == SNDRV_INFO_CONTENT_DATA)
@@ -821,15 +792,11 @@ static int __snd_info_register(struct snd_info_entry *entry)
 			ops = &snd_info_text_entry_ops;
 		p = proc_create_data(entry->name, entry->mode, root,
 				     ops, entry);
-		if (!p) {
-			mutex_unlock(&info_mutex);
+		if (!p)
 			return -ENOMEM;
-		}
 		proc_set_size(p, entry->size);
 	}
 	entry->p = p;
- unlock:
-	mutex_unlock(&info_mutex);
 	return 0;
 }
 
diff --git a/sound/core/info_oss.c b/sound/core/info_oss.c
index ebc714b2f46b..0dbbb8005570 100644
--- a/sound/core/info_oss.c
+++ b/sound/core/info_oss.c
@@ -29,20 +29,17 @@ int snd_oss_info_register(int dev, int num, char *string)
 		return -ENXIO;
 	if (snd_BUG_ON(num < 0 || num >= SNDRV_CARDS))
 		return -ENXIO;
-	mutex_lock(&strings);
+	guard(mutex)(&strings);
 	if (string == NULL) {
 		x = snd_sndstat_strings[num][dev];
 		kfree(x);
 		x = NULL;
 	} else {
 		x = kstrdup(string, GFP_KERNEL);
-		if (x == NULL) {
-			mutex_unlock(&strings);
+		if (x == NULL)
 			return -ENOMEM;
-		}
 	}
 	snd_sndstat_strings[num][dev] = x;
-	mutex_unlock(&strings);
 	return 0;
 }
 EXPORT_SYMBOL(snd_oss_info_register);
@@ -53,7 +50,7 @@ static int snd_sndstat_show_strings(struct snd_info_buffer *buf, char *id, int d
 	char *str;
 
 	snd_iprintf(buf, "\n%s:", id);
-	mutex_lock(&strings);
+	guard(mutex)(&strings);
 	for (idx = 0; idx < SNDRV_CARDS; idx++) {
 		str = snd_sndstat_strings[idx][dev];
 		if (str) {
@@ -64,7 +61,6 @@ static int snd_sndstat_show_strings(struct snd_info_buffer *buf, char *id, int d
 			snd_iprintf(buf, "%i: %s\n", idx, str);
 		}
 	}
-	mutex_unlock(&strings);
 	if (ok < 0)
 		snd_iprintf(buf, " NOT ENABLED IN CONFIG\n");
 	return ok;
-- 
2.35.3

