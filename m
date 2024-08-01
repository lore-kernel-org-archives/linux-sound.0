Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C719E16D9BD
	for <linux-sound@vger.kernel.org>; Thu,  1 Aug 2024 07:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722498351; cv=none; b=Htz7gINngmya+ODwhakmhFdXygx9hZxf/FmG4F3CNMhrBu5KoOoVzZQccPXKKw3U5ChTZXRwzgknALcephAbGOc0ypf0j9ReswP1bUrVt/COwxckDxh+pJNPURJld+azCe1zesyURPiutrLETgrYiZ8jkzbV3H5FIR0SrzgvRaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722498351; c=relaxed/simple;
	bh=Plwn7BchYHkGlgkcM35kXQ0+hAkgu0yboCcmjCpi96k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DdBu+u5LBgSUSOa3J95mzV4liOonobyl5WgL24VheK+nuj+Fm6MJt7gvNX9kwpGnLWUIrzuqoDeaxhAiLYjdb1ry1dp7mjmP3uXZoTgRVmGsx8Nmx0Zw8uREu5HFTKPzsb7j/5t5Xu9+lqaC1KNT8hG2A8ctl7vmP8uhMb6+MBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nnkdUgdQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Gp9QkuiF; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=A1OCiczZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tVPuYMWv; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nnkdUgdQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Gp9QkuiF";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="A1OCiczZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tVPuYMWv"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D5F9A21A9B;
	Thu,  1 Aug 2024 07:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722498347; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=30/hLJO385IwXabN4Exst909GURMQ6K38SPtOU0BDmM=;
	b=nnkdUgdQSn5yCxwmGGSLniBhzHVMATMA6AgK9IlLEFjTR1KNLwzW2LmtK69KB66ac9WoQf
	8xMrx8KSKnHgBmOGetuvA+PocHndUjvkmkrdAarSXFUv0OZNeSAd7FItTV3zbKTVsmNeL6
	lp22HI2PViARJWIdzUBd8s1BeIjmFW8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722498347;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=30/hLJO385IwXabN4Exst909GURMQ6K38SPtOU0BDmM=;
	b=Gp9QkuiF93x/E/xSveyY+MVgJqmhcRrFf3cnVwfvZHQbD50BzGtUDO7uyVio7qGToMqpln
	I8VSmwx387PR17BQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=A1OCiczZ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=tVPuYMWv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722498346; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=30/hLJO385IwXabN4Exst909GURMQ6K38SPtOU0BDmM=;
	b=A1OCiczZcx0i/ZRJhej7o4ZMkKj4n9Gvg/DfTGRqaQJ7AHHq5yvYmsoO/3b4C6QBnLvJ/B
	AnPG5FAgFsQDsA7lXC+ZraqJ6wQHG56EWAOmewQGGxYo+ozfcqoJPy0h1nOY7wUzmptoFt
	7LrzrK6Bh9UPca4mSwSQfDbAXg38Xsw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722498346;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=30/hLJO385IwXabN4Exst909GURMQ6K38SPtOU0BDmM=;
	b=tVPuYMWvuimZ+4tQ7oivXvW+Vo7HG8uJbZaSHN1ggbRvwkkd3RaQGinfBKNhI4TRRIYgyA
	OlmCS/vxuYnojHCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B88B813946;
	Thu,  1 Aug 2024 07:45:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MJPtKyo9q2YLBQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 01 Aug 2024 07:45:46 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/3] ALSA: control: Optimize locking for look-up
Date: Thu,  1 Aug 2024 09:46:08 +0200
Message-ID: <20240801074617.4997-3-tiwai@suse.de>
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
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [0.19 / 50.00];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spamd-Bar: /
X-Rspamd-Queue-Id: D5F9A21A9B
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: 0.19

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
index 13511c50825f..6f9d3b8350ce 100644
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
index ae209dcfd049..7d7d592a8428 100644
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
 
@@ -1196,7 +1163,7 @@ static int snd_ctl_elem_info(struct snd_ctl_file *ctl,
 	struct snd_kcontrol *kctl;
 
 	guard(rwsem_read)(&card->controls_rwsem);
-	kctl = snd_ctl_find_id_locked(card, &info->id);
+	kctl = snd_ctl_find_id(card, &info->id);
 	if (!kctl)
 		return -ENOENT;
 	return __snd_ctl_elem_info(card, kctl, info, ctl);
@@ -1237,7 +1204,7 @@ static int snd_ctl_elem_read(struct snd_card *card,
 	int ret;
 
 	guard(rwsem_read)(&card->controls_rwsem);
-	kctl = snd_ctl_find_id_locked(card, &control->id);
+	kctl = snd_ctl_find_id(card, &control->id);
 	if (!kctl)
 		return -ENOENT;
 
@@ -1306,7 +1273,7 @@ static int snd_ctl_elem_write(struct snd_card *card, struct snd_ctl_file *file,
 	int result = 0;
 
 	down_write(&card->controls_rwsem);
-	kctl = snd_ctl_find_id_locked(card, &control->id);
+	kctl = snd_ctl_find_id(card, &control->id);
 	if (kctl == NULL) {
 		up_write(&card->controls_rwsem);
 		return -ENOENT;
@@ -1386,7 +1353,7 @@ static int snd_ctl_elem_lock(struct snd_ctl_file *file,
 	if (copy_from_user(&id, _id, sizeof(id)))
 		return -EFAULT;
 	guard(rwsem_write)(&card->controls_rwsem);
-	kctl = snd_ctl_find_id_locked(card, &id);
+	kctl = snd_ctl_find_id(card, &id);
 	if (!kctl)
 		return -ENOENT;
 	vd = &kctl->vd[snd_ctl_get_ioff(kctl, &id)];
@@ -1407,7 +1374,7 @@ static int snd_ctl_elem_unlock(struct snd_ctl_file *file,
 	if (copy_from_user(&id, _id, sizeof(id)))
 		return -EFAULT;
 	guard(rwsem_write)(&card->controls_rwsem);
-	kctl = snd_ctl_find_id_locked(card, &id);
+	kctl = snd_ctl_find_id(card, &id);
 	if (!kctl)
 		return -ENOENT;
 	vd = &kctl->vd[snd_ctl_get_ioff(kctl, &id)];
@@ -1904,7 +1871,7 @@ static int snd_ctl_tlv_ioctl(struct snd_ctl_file *file,
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

