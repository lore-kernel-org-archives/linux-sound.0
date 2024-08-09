Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7971922DB
	for <linux-sound@vger.kernel.org>; Fri,  9 Aug 2024 10:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723200122; cv=none; b=Y+4EqtReptvpu5OC5xkwhHLYaj+JcxFh9sVPX3SPEUNsddV1OD/ag2U+eSfs7oqUyQlhQHZSV0fMu4WRAs7OpfLI/Oa9qc0UZiR2AzsWhDH9qQQ8/w2T8xE4OGnCTkRbsjDvCaNByBbzlUQOWcdmZIQKgvYq3nY/Wlp3u3KsX+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723200122; c=relaxed/simple;
	bh=mKouGCbz92nX4nkhiyBBIwaMOMkGq6gDGLZb44waDSI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GUbtfE1DPPkZHfqav2Bilw8+mnBqJhpWE6y8a73DlPSae1dAQNvCTRfOBbHUyua4yePvZtjmKRuE5CJInBv8tFZmhgHWFe6PM5kNyKA+rQ6eY6MpQqyoZgtqzpee4nDKKDNeECi8bDubf/fpFv40Csz/rSkuzLISGA9iDrSY9RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EnFoWgxW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FMqHy/tc; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EnFoWgxW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FMqHy/tc; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EnFoWgxW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FMqHy/tc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EnFoWgxW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FMqHy/tc"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8519221F1F;
	Fri,  9 Aug 2024 10:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723200118; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o3ypoaWBbnHz34smua89tejVbEshRU5h6sktQrLBgsk=;
	b=EnFoWgxWOzJd4AOv3OBnuGKmlZvbgYnfARUaNt39+mWJ9X26NEuik7JqElIc7nuQQs8LVx
	k6xLuCQvquSmE+iOoxCLuzwJjl8r8RzXNROY81fvuNJ2a76JaPeouIgPvPKjQA7bsJcDrq
	rto5mq+NhJAkyqexK8MHM1+d+pZlm9c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723200118;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o3ypoaWBbnHz34smua89tejVbEshRU5h6sktQrLBgsk=;
	b=FMqHy/tcEDuFUee6GTjwDP9+jOMUMO6lLNsaDs+8T/ZB08I8Q1pIrMUmJAXKudom9I1Ete
	347kictt4ERYWpAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=EnFoWgxW;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="FMqHy/tc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723200118; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o3ypoaWBbnHz34smua89tejVbEshRU5h6sktQrLBgsk=;
	b=EnFoWgxWOzJd4AOv3OBnuGKmlZvbgYnfARUaNt39+mWJ9X26NEuik7JqElIc7nuQQs8LVx
	k6xLuCQvquSmE+iOoxCLuzwJjl8r8RzXNROY81fvuNJ2a76JaPeouIgPvPKjQA7bsJcDrq
	rto5mq+NhJAkyqexK8MHM1+d+pZlm9c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723200118;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o3ypoaWBbnHz34smua89tejVbEshRU5h6sktQrLBgsk=;
	b=FMqHy/tcEDuFUee6GTjwDP9+jOMUMO6lLNsaDs+8T/ZB08I8Q1pIrMUmJAXKudom9I1Ete
	347kictt4ERYWpAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6B2841379A;
	Fri,  9 Aug 2024 10:41:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KB3oGHbytWaqTAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 09 Aug 2024 10:41:58 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 2/3] ALSA: control: Optimize locking for look-up
Date: Fri,  9 Aug 2024 12:42:30 +0200
Message-ID: <20240809104234.8488-3-tiwai@suse.de>
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
X-Spam-Score: -5.01
X-Rspamd-Queue-Id: 8519221F1F
X-Spamd-Result: default: False [-5.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:email];
	TO_DN_NONE(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Spam-Flag: NO

For a fast look-up of a control element via either numid or name
matching (enabled via CONFIG_SND_CTL_FAST_LOOKUP), a locking isn't
needed at all thanks to Xarray.  OTOH, the locking is still needed for
a slow linked-list traversal, and that's rather a rare case.

In this patch, we reduce the use of locking at snd_ctl_find_*() API
functions, and switch from controls_rwsem to controls_rwlock for
avoiding unnecessary lock inversions.  This also resulted in a nice
cleanup, as *_unlocked() version of snd_ctl_find_*() APIs can be
dropped.

snd_ctl_find_id_mixer_unlocked() is still left just as an alias of
snd_ctl_find_id_mixer(), since soc-card.c has a wrapper and there are
several users.  Once after converting there, we can remove it later.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/control.h     |  22 +-----
 include/sound/core.h        |   2 +-
 sound/core/control.c        | 141 ++++++++++++++----------------------
 sound/core/control_compat.c |   2 +-
 sound/core/control_led.c    |   2 +-
 sound/core/oss/mixer_oss.c  |  10 +--
 6 files changed, 64 insertions(+), 115 deletions(-)

diff --git a/include/sound/control.h b/include/sound/control.h
index c1659036c4a7..4851a86c72ef 100644
--- a/include/sound/control.h
+++ b/include/sound/control.h
@@ -140,9 +140,7 @@ int snd_ctl_remove_id(struct snd_card * card, struct snd_ctl_elem_id *id);
 int snd_ctl_rename_id(struct snd_card * card, struct snd_ctl_elem_id *src_id, struct snd_ctl_elem_id *dst_id);
 void snd_ctl_rename(struct snd_card *card, struct snd_kcontrol *kctl, const char *name);
 int snd_ctl_activate_id(struct snd_card *card, struct snd_ctl_elem_id *id, int active);
-struct snd_kcontrol *snd_ctl_find_numid_locked(struct snd_card *card, unsigned int numid);
 struct snd_kcontrol *snd_ctl_find_numid(struct snd_card *card, unsigned int numid);
-struct snd_kcontrol *snd_ctl_find_id_locked(struct snd_card *card, const struct snd_ctl_elem_id *id);
 struct snd_kcontrol *snd_ctl_find_id(struct snd_card *card, const struct snd_ctl_elem_id *id);
 
 /**
@@ -167,27 +165,11 @@ snd_ctl_find_id_mixer(struct snd_card *card, const char *name)
 	return snd_ctl_find_id(card, &id);
 }
 
-/**
- * snd_ctl_find_id_mixer_locked - find the control instance with the given name string
- * @card: the card instance
- * @name: the name string
- *
- * Finds the control instance with the given name and
- * @SNDRV_CTL_ELEM_IFACE_MIXER. Other fields are set to zero.
- *
- * This is merely a wrapper to snd_ctl_find_id_locked().
- * The caller must down card->controls_rwsem before calling this function.
- *
- * Return: The pointer of the instance if found, or %NULL if not.
- */
+/* to be removed */
 static inline struct snd_kcontrol *
 snd_ctl_find_id_mixer_locked(struct snd_card *card, const char *name)
 {
-	struct snd_ctl_elem_id id = {};
-
-	id.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
-	strscpy(id.name, name, sizeof(id.name));
-	return snd_ctl_find_id_locked(card, &id);
+	return snd_ctl_find_id_mixer(card, name);
 }
 
 int snd_ctl_create(struct snd_card *card);
diff --git a/include/sound/core.h b/include/sound/core.h
index 55607e91d5fd..5c418ab24aa4 100644
--- a/include/sound/core.h
+++ b/include/sound/core.h
@@ -99,7 +99,7 @@ struct snd_card {
 	struct device *ctl_dev;		/* control device */
 	unsigned int last_numid;	/* last used numeric ID */
 	struct rw_semaphore controls_rwsem;	/* controls lock (list and values) */
-	rwlock_t controls_rwlock;	/* lock for ctl_files list */
+	rwlock_t controls_rwlock;	/* lock for lookup and ctl_files list */
 	int controls_count;		/* count of all controls */
 	size_t user_ctl_alloc_size;	// current memory allocation by user controls.
 	struct list_head controls;	/* all controls for this card */
diff --git a/sound/core/control.c b/sound/core/control.c
index 7c4410d1eeeb..38728b00f59c 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -470,7 +470,7 @@ static int __snd_ctl_add_replace(struct snd_card *card,
 	if (id.index > UINT_MAX - kcontrol->count)
 		return -EINVAL;
 
-	old = snd_ctl_find_id_locked(card, &id);
+	old = snd_ctl_find_id(card, &id);
 	if (!old) {
 		if (mode == CTL_REPLACE)
 			return -EINVAL;
@@ -491,10 +491,12 @@ static int __snd_ctl_add_replace(struct snd_card *card,
 	if (snd_ctl_find_hole(card, kcontrol->count) < 0)
 		return -ENOMEM;
 
-	list_add_tail(&kcontrol->list, &card->controls);
-	card->controls_count += kcontrol->count;
-	kcontrol->id.numid = card->last_numid + 1;
-	card->last_numid += kcontrol->count;
+	scoped_guard(write_lock_irq, &card->controls_rwlock) {
+		list_add_tail(&kcontrol->list, &card->controls);
+		card->controls_count += kcontrol->count;
+		kcontrol->id.numid = card->last_numid + 1;
+		card->last_numid += kcontrol->count;
+	}
 
 	add_hash_entries(card, kcontrol);
 
@@ -579,12 +581,15 @@ static int __snd_ctl_remove(struct snd_card *card,
 
 	if (snd_BUG_ON(!card || !kcontrol))
 		return -EINVAL;
-	list_del(&kcontrol->list);
 
 	if (remove_hash)
 		remove_hash_entries(card, kcontrol);
 
-	card->controls_count -= kcontrol->count;
+	scoped_guard(write_lock_irq, &card->controls_rwlock) {
+		list_del(&kcontrol->list);
+		card->controls_count -= kcontrol->count;
+	}
+
 	for (idx = 0; idx < kcontrol->count; idx++)
 		snd_ctl_notify_one(card, SNDRV_CTL_EVENT_MASK_REMOVE, kcontrol, idx);
 	snd_ctl_free_one(kcontrol);
@@ -634,7 +639,7 @@ int snd_ctl_remove_id(struct snd_card *card, struct snd_ctl_elem_id *id)
 	struct snd_kcontrol *kctl;
 
 	guard(rwsem_write)(&card->controls_rwsem);
-	kctl = snd_ctl_find_id_locked(card, id);
+	kctl = snd_ctl_find_id(card, id);
 	if (kctl == NULL)
 		return -ENOENT;
 	return snd_ctl_remove_locked(card, kctl);
@@ -659,7 +664,7 @@ static int snd_ctl_remove_user_ctl(struct snd_ctl_file * file,
 	int idx;
 
 	guard(rwsem_write)(&card->controls_rwsem);
-	kctl = snd_ctl_find_id_locked(card, id);
+	kctl = snd_ctl_find_id(card, id);
 	if (kctl == NULL)
 		return -ENOENT;
 	if (!(kctl->vd[0].access & SNDRV_CTL_ELEM_ACCESS_USER))
@@ -691,7 +696,7 @@ int snd_ctl_activate_id(struct snd_card *card, struct snd_ctl_elem_id *id,
 	int ret;
 
 	down_write(&card->controls_rwsem);
-	kctl = snd_ctl_find_id_locked(card, id);
+	kctl = snd_ctl_find_id(card, id);
 	if (kctl == NULL) {
 		ret = -ENOENT;
 		goto unlock;
@@ -745,7 +750,7 @@ int snd_ctl_rename_id(struct snd_card *card, struct snd_ctl_elem_id *src_id,
 	int saved_numid;
 
 	guard(rwsem_write)(&card->controls_rwsem);
-	kctl = snd_ctl_find_id_locked(card, src_id);
+	kctl = snd_ctl_find_id(card, src_id);
 	if (kctl == NULL)
 		return -ENOENT;
 	saved_numid = kctl->id.numid;
@@ -787,6 +792,7 @@ snd_ctl_find_numid_slow(struct snd_card *card, unsigned int numid)
 {
 	struct snd_kcontrol *kctl;
 
+	guard(read_lock_irqsave)(&card->controls_rwlock);
 	list_for_each_entry(kctl, &card->controls, list) {
 		if (kctl->id.numid <= numid && kctl->id.numid + kctl->count > numid)
 			return kctl;
@@ -795,32 +801,6 @@ snd_ctl_find_numid_slow(struct snd_card *card, unsigned int numid)
 }
 #endif /* !CONFIG_SND_CTL_FAST_LOOKUP */
 
-/**
- * snd_ctl_find_numid_locked - find the control instance with the given number-id
- * @card: the card instance
- * @numid: the number-id to search
- *
- * Finds the control instance with the given number-id from the card.
- *
- * The caller must down card->controls_rwsem before calling this function
- * (if the race condition can happen).
- *
- * Return: The pointer of the instance if found, or %NULL if not.
- */
-struct snd_kcontrol *
-snd_ctl_find_numid_locked(struct snd_card *card, unsigned int numid)
-{
-	if (snd_BUG_ON(!card || !numid))
-		return NULL;
-	lockdep_assert_held(&card->controls_rwsem);
-#ifdef CONFIG_SND_CTL_FAST_LOOKUP
-	return xa_load(&card->ctl_numids, numid);
-#else
-	return snd_ctl_find_numid_slow(card, numid);
-#endif
-}
-EXPORT_SYMBOL(snd_ctl_find_numid_locked);
-
 /**
  * snd_ctl_find_numid - find the control instance with the given number-id
  * @card: the card instance
@@ -830,54 +810,22 @@ EXPORT_SYMBOL(snd_ctl_find_numid_locked);
  *
  * Return: The pointer of the instance if found, or %NULL if not.
  *
- * Note that this function takes card->controls_rwsem lock internally.
+ * Note that this function takes card->controls_rwlock lock internally.
  */
 struct snd_kcontrol *snd_ctl_find_numid(struct snd_card *card,
 					unsigned int numid)
 {
-	guard(rwsem_read)(&card->controls_rwsem);
-	return snd_ctl_find_numid_locked(card, numid);
+	if (snd_BUG_ON(!card || !numid))
+		return NULL;
+
+#ifdef CONFIG_SND_CTL_FAST_LOOKUP
+	return xa_load(&card->ctl_numids, numid);
+#else
+	return snd_ctl_find_numid_slow(card, numid);
+#endif
 }
 EXPORT_SYMBOL(snd_ctl_find_numid);
 
-/**
- * snd_ctl_find_id_locked - find the control instance with the given id
- * @card: the card instance
- * @id: the id to search
- *
- * Finds the control instance with the given id from the card.
- *
- * The caller must down card->controls_rwsem before calling this function
- * (if the race condition can happen).
- *
- * Return: The pointer of the instance if found, or %NULL if not.
- */
-struct snd_kcontrol *snd_ctl_find_id_locked(struct snd_card *card,
-					    const struct snd_ctl_elem_id *id)
-{
-	struct snd_kcontrol *kctl;
-
-	if (snd_BUG_ON(!card || !id))
-		return NULL;
-	lockdep_assert_held(&card->controls_rwsem);
-	if (id->numid != 0)
-		return snd_ctl_find_numid_locked(card, id->numid);
-#ifdef CONFIG_SND_CTL_FAST_LOOKUP
-	kctl = xa_load(&card->ctl_hash, get_ctl_id_hash(id));
-	if (kctl && elem_id_matches(kctl, id))
-		return kctl;
-	if (!card->ctl_hash_collision)
-		return NULL; /* we can rely on only hash table */
-#endif
-	/* no matching in hash table - try all as the last resort */
-	list_for_each_entry(kctl, &card->controls, list)
-		if (elem_id_matches(kctl, id))
-			return kctl;
-
-	return NULL;
-}
-EXPORT_SYMBOL(snd_ctl_find_id_locked);
-
 /**
  * snd_ctl_find_id - find the control instance with the given id
  * @card: the card instance
@@ -887,13 +835,32 @@ EXPORT_SYMBOL(snd_ctl_find_id_locked);
  *
  * Return: The pointer of the instance if found, or %NULL if not.
  *
- * Note that this function takes card->controls_rwsem lock internally.
+ * Note that this function takes card->controls_rwlock lock internally.
  */
 struct snd_kcontrol *snd_ctl_find_id(struct snd_card *card,
 				     const struct snd_ctl_elem_id *id)
 {
-	guard(rwsem_read)(&card->controls_rwsem);
-	return snd_ctl_find_id_locked(card, id);
+	struct snd_kcontrol *kctl;
+
+	if (snd_BUG_ON(!card || !id))
+		return NULL;
+
+	if (id->numid != 0)
+		return snd_ctl_find_numid(card, id->numid);
+#ifdef CONFIG_SND_CTL_FAST_LOOKUP
+	kctl = xa_load(&card->ctl_hash, get_ctl_id_hash(id));
+	if (kctl && elem_id_matches(kctl, id))
+		return kctl;
+	if (!card->ctl_hash_collision)
+		return NULL; /* we can rely on only hash table */
+#endif
+	/* no matching in hash table - try all as the last resort */
+	guard(read_lock_irqsave)(&card->controls_rwlock);
+	list_for_each_entry(kctl, &card->controls, list)
+		if (elem_id_matches(kctl, id))
+			return kctl;
+
+	return NULL;
 }
 EXPORT_SYMBOL(snd_ctl_find_id);
 
@@ -1199,7 +1166,7 @@ static int snd_ctl_elem_info(struct snd_ctl_file *ctl,
 	struct snd_kcontrol *kctl;
 
 	guard(rwsem_read)(&card->controls_rwsem);
-	kctl = snd_ctl_find_id_locked(card, &info->id);
+	kctl = snd_ctl_find_id(card, &info->id);
 	if (!kctl)
 		return -ENOENT;
 	return __snd_ctl_elem_info(card, kctl, info, ctl);
@@ -1235,7 +1202,7 @@ static int snd_ctl_elem_read(struct snd_card *card,
 	int ret;
 
 	guard(rwsem_read)(&card->controls_rwsem);
-	kctl = snd_ctl_find_id_locked(card, &control->id);
+	kctl = snd_ctl_find_id(card, &control->id);
 	if (!kctl)
 		return -ENOENT;
 
@@ -1303,7 +1270,7 @@ static int snd_ctl_elem_write(struct snd_card *card, struct snd_ctl_file *file,
 	int result;
 
 	down_write(&card->controls_rwsem);
-	kctl = snd_ctl_find_id_locked(card, &control->id);
+	kctl = snd_ctl_find_id(card, &control->id);
 	if (kctl == NULL) {
 		up_write(&card->controls_rwsem);
 		return -ENOENT;
@@ -1381,7 +1348,7 @@ static int snd_ctl_elem_lock(struct snd_ctl_file *file,
 	if (copy_from_user(&id, _id, sizeof(id)))
 		return -EFAULT;
 	guard(rwsem_write)(&card->controls_rwsem);
-	kctl = snd_ctl_find_id_locked(card, &id);
+	kctl = snd_ctl_find_id(card, &id);
 	if (!kctl)
 		return -ENOENT;
 	vd = &kctl->vd[snd_ctl_get_ioff(kctl, &id)];
@@ -1402,7 +1369,7 @@ static int snd_ctl_elem_unlock(struct snd_ctl_file *file,
 	if (copy_from_user(&id, _id, sizeof(id)))
 		return -EFAULT;
 	guard(rwsem_write)(&card->controls_rwsem);
-	kctl = snd_ctl_find_id_locked(card, &id);
+	kctl = snd_ctl_find_id(card, &id);
 	if (!kctl)
 		return -ENOENT;
 	vd = &kctl->vd[snd_ctl_get_ioff(kctl, &id)];
@@ -1903,7 +1870,7 @@ static int snd_ctl_tlv_ioctl(struct snd_ctl_file *file,
 	container_size = header.length;
 	container = buf->tlv;
 
-	kctl = snd_ctl_find_numid_locked(file->card, header.numid);
+	kctl = snd_ctl_find_numid(file->card, header.numid);
 	if (kctl == NULL)
 		return -ENOENT;
 
diff --git a/sound/core/control_compat.c b/sound/core/control_compat.c
index 934bb945e702..401c12e62816 100644
--- a/sound/core/control_compat.c
+++ b/sound/core/control_compat.c
@@ -168,7 +168,7 @@ static int get_ctl_type(struct snd_card *card, struct snd_ctl_elem_id *id,
 	int err;
 
 	guard(rwsem_read)(&card->controls_rwsem);
-	kctl = snd_ctl_find_id_locked(card, id);
+	kctl = snd_ctl_find_id(card, id);
 	if (!kctl)
 		return -ENOENT;
 	info = kzalloc(sizeof(*info), GFP_KERNEL);
diff --git a/sound/core/control_led.c b/sound/core/control_led.c
index 804805a95e2f..14eb3e6cc94c 100644
--- a/sound/core/control_led.c
+++ b/sound/core/control_led.c
@@ -254,7 +254,7 @@ static int snd_ctl_led_set_id(int card_number, struct snd_ctl_elem_id *id,
 	if (!card)
 		return -ENXIO;
 	guard(rwsem_write)(&card->controls_rwsem);
-	kctl = snd_ctl_find_id_locked(card, id);
+	kctl = snd_ctl_find_id(card, id);
 	if (!kctl)
 		return -ENOENT;
 	ioff = snd_ctl_get_ioff(kctl, id);
diff --git a/sound/core/oss/mixer_oss.c b/sound/core/oss/mixer_oss.c
index 6a0508093ea6..33bf9a220ada 100644
--- a/sound/core/oss/mixer_oss.c
+++ b/sound/core/oss/mixer_oss.c
@@ -510,7 +510,7 @@ static struct snd_kcontrol *snd_mixer_oss_test_id(struct snd_mixer_oss *mixer, c
 	id.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
 	strscpy(id.name, name, sizeof(id.name));
 	id.index = index;
-	return snd_ctl_find_id_locked(card, &id);
+	return snd_ctl_find_id(card, &id);
 }
 
 static void snd_mixer_oss_get_volume1_vol(struct snd_mixer_oss_file *fmixer,
@@ -526,7 +526,7 @@ static void snd_mixer_oss_get_volume1_vol(struct snd_mixer_oss_file *fmixer,
 	if (numid == ID_UNKNOWN)
 		return;
 	guard(rwsem_read)(&card->controls_rwsem);
-	kctl = snd_ctl_find_numid_locked(card, numid);
+	kctl = snd_ctl_find_numid(card, numid);
 	if (!kctl)
 		return;
 	uinfo = kzalloc(sizeof(*uinfo), GFP_KERNEL);
@@ -559,7 +559,7 @@ static void snd_mixer_oss_get_volume1_sw(struct snd_mixer_oss_file *fmixer,
 	if (numid == ID_UNKNOWN)
 		return;
 	guard(rwsem_read)(&card->controls_rwsem);
-	kctl = snd_ctl_find_numid_locked(card, numid);
+	kctl = snd_ctl_find_numid(card, numid);
 	if (!kctl)
 		return;
 	uinfo = kzalloc(sizeof(*uinfo), GFP_KERNEL);
@@ -619,7 +619,7 @@ static void snd_mixer_oss_put_volume1_vol(struct snd_mixer_oss_file *fmixer,
 	if (numid == ID_UNKNOWN)
 		return;
 	guard(rwsem_read)(&card->controls_rwsem);
-	kctl = snd_ctl_find_numid_locked(card, numid);
+	kctl = snd_ctl_find_numid(card, numid);
 	if (!kctl)
 		return;
 	uinfo = kzalloc(sizeof(*uinfo), GFP_KERNEL);
@@ -656,7 +656,7 @@ static void snd_mixer_oss_put_volume1_sw(struct snd_mixer_oss_file *fmixer,
 	if (numid == ID_UNKNOWN)
 		return;
 	guard(rwsem_read)(&card->controls_rwsem);
-	kctl = snd_ctl_find_numid_locked(card, numid);
+	kctl = snd_ctl_find_numid(card, numid);
 	if (!kctl)
 		return;
 	uinfo = kzalloc(sizeof(*uinfo), GFP_KERNEL);
-- 
2.43.0

