Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B1413F004
	for <linux-sound@vger.kernel.org>; Fri, 23 Feb 2024 17:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708710620; cv=none; b=H/ZSQ+mOwhExnhTsSovEF1GiRY06ra11qXhiPbq/hf2KlZmzjNxouvuLHTmWpzGfX8YJm24YMYRne4fMraM8E2zupM/TChEtMcigcBAPVPR/PguYq+OivWfk1dl0aAIOGyxMwBl2b0QsCFt4ADhRAxgRTJJxb2Qsgz4bp5cpf9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708710620; c=relaxed/simple;
	bh=Gm8ES37GC8nY+hXCEZT03EAKNuq4Wo9dwUi+RcISECw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=B8okX7bsdA0k3tZ0oLBGN6oJ2Y48Pz+6kt6zTCtzS2/oYQaXlIzSCFkeF7cu7NFcaHd6zSUupw/eGiAhj2jux5gSph5k4FSnCHG1k5yKYm37WgUKYemNzHeojCkICzkEgH7gKTi0jmOk2sKCJY9AAfN442gDrfHy6xUTqfpB9tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ha7htjCa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3zr1ndHU; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ha7htjCa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3zr1ndHU; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ha7htjCa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3zr1ndHU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ha7htjCa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3zr1ndHU"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 94FCF1FD47;
	Fri, 23 Feb 2024 17:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708710614; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EDPUqMTmZolyxq139RXrsdVw3qJOapC8UZaZmsiwy3I=;
	b=ha7htjCaxUff4AJPUt4nMU0aS9MfM4FoZYZGeBCNJmaM17sYs86cQ68rcA3vhk8zJ0Ckkv
	ejfpxGbvNEQZTFClwKcqGAkRrPakbNq525V/DGVibb0D9Y2Q5t9Nktzkk++wjwm7DQL5Gc
	r8/2+ZaDVIQiBCdl+uTUKNSzjXUITA4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708710614;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EDPUqMTmZolyxq139RXrsdVw3qJOapC8UZaZmsiwy3I=;
	b=3zr1ndHU1jgv+FY2bNF1uqU2cKOsY5jWwrhTdQ1eLm4zXVfa0I0I0r62KzNfTNMJXBHK2q
	B6rAMgNj6f6R2OCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708710614; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EDPUqMTmZolyxq139RXrsdVw3qJOapC8UZaZmsiwy3I=;
	b=ha7htjCaxUff4AJPUt4nMU0aS9MfM4FoZYZGeBCNJmaM17sYs86cQ68rcA3vhk8zJ0Ckkv
	ejfpxGbvNEQZTFClwKcqGAkRrPakbNq525V/DGVibb0D9Y2Q5t9Nktzkk++wjwm7DQL5Gc
	r8/2+ZaDVIQiBCdl+uTUKNSzjXUITA4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708710614;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EDPUqMTmZolyxq139RXrsdVw3qJOapC8UZaZmsiwy3I=;
	b=3zr1ndHU1jgv+FY2bNF1uqU2cKOsY5jWwrhTdQ1eLm4zXVfa0I0I0r62KzNfTNMJXBHK2q
	B6rAMgNj6f6R2OCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7674F132C7;
	Fri, 23 Feb 2024 17:50:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SKt4G9ba2GW6RAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 Feb 2024 17:50:14 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 24/24] ALSA: control_led: Use guard() for locking
Date: Fri, 23 Feb 2024 18:50:01 +0100
Message-Id: <20240223175001.24375-25-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240223175001.24375-1-tiwai@suse.de>
References: <20240223175001.24375-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ha7htjCa;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=3zr1ndHU
X-Spamd-Result: default: False [-0.31 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 FROM_HAS_DN(0.00)[];
	 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_ONE(0.00)[1];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -0.31
X-Rspamd-Queue-Id: 94FCF1FD47
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Bar: /

We can simplify the code gracefully with new guard() macro and co for
automatic cleanup of locks.

A couple of functions that use snd_card_ref() and *_unref() are also
cleaned up with a defined class, too.

Only the code refactoring, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/control_led.c | 150 +++++++++++++++++----------------------
 1 file changed, 65 insertions(+), 85 deletions(-)

diff --git a/sound/core/control_led.c b/sound/core/control_led.c
index a78eb48927c7..3d37e9fa7b9c 100644
--- a/sound/core/control_led.c
+++ b/sound/core/control_led.c
@@ -147,29 +147,27 @@ static void snd_ctl_led_set_state(struct snd_card *card, unsigned int access,
 		return;
 	route = -1;
 	found = false;
-	mutex_lock(&snd_ctl_led_mutex);
-	/* the card may not be registered (active) at this point */
-	if (card && !snd_ctl_led_card_valid[card->number]) {
-		mutex_unlock(&snd_ctl_led_mutex);
-		return;
-	}
-	list_for_each_entry(lctl, &led->controls, list) {
-		if (lctl->kctl == kctl && lctl->index_offset == ioff)
-			found = true;
-		UPDATE_ROUTE(route, snd_ctl_led_get(lctl));
-	}
-	if (!found && kctl && card) {
-		lctl = kzalloc(sizeof(*lctl), GFP_KERNEL);
-		if (lctl) {
-			lctl->card = card;
-			lctl->access = access;
-			lctl->kctl = kctl;
-			lctl->index_offset = ioff;
-			list_add(&lctl->list, &led->controls);
+	scoped_guard(mutex, &snd_ctl_led_mutex) {
+		/* the card may not be registered (active) at this point */
+		if (card && !snd_ctl_led_card_valid[card->number])
+			return;
+		list_for_each_entry(lctl, &led->controls, list) {
+			if (lctl->kctl == kctl && lctl->index_offset == ioff)
+				found = true;
 			UPDATE_ROUTE(route, snd_ctl_led_get(lctl));
 		}
+		if (!found && kctl && card) {
+			lctl = kzalloc(sizeof(*lctl), GFP_KERNEL);
+			if (lctl) {
+				lctl->card = card;
+				lctl->access = access;
+				lctl->kctl = kctl;
+				lctl->index_offset = ioff;
+				list_add(&lctl->list, &led->controls);
+				UPDATE_ROUTE(route, snd_ctl_led_get(lctl));
+			}
+		}
 	}
-	mutex_unlock(&snd_ctl_led_mutex);
 	switch (led->mode) {
 	case MODE_OFF:		route = 1; break;
 	case MODE_ON:		route = 0; break;
@@ -201,14 +199,13 @@ static unsigned int snd_ctl_led_remove(struct snd_kcontrol *kctl, unsigned int i
 	struct snd_ctl_led_ctl *lctl;
 	unsigned int ret = 0;
 
-	mutex_lock(&snd_ctl_led_mutex);
+	guard(mutex)(&snd_ctl_led_mutex);
 	lctl = snd_ctl_led_find(kctl, ioff);
 	if (lctl && (access == 0 || access != lctl->access)) {
 		ret = lctl->access;
 		list_del(&lctl->list);
 		kfree(lctl);
 	}
-	mutex_unlock(&snd_ctl_led_mutex);
 	return ret;
 }
 
@@ -239,44 +236,36 @@ static void snd_ctl_led_notify(struct snd_card *card, unsigned int mask,
 	}
 }
 
+DEFINE_FREE(snd_card_unref, struct snd_card *, if (_T) snd_card_unref(_T))
+
 static int snd_ctl_led_set_id(int card_number, struct snd_ctl_elem_id *id,
 			      unsigned int group, bool set)
 {
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_unref) = NULL;
 	struct snd_kcontrol *kctl;
 	struct snd_kcontrol_volatile *vd;
 	unsigned int ioff, access, new_access;
-	int err = 0;
 
 	card = snd_card_ref(card_number);
-	if (card) {
-		down_write(&card->controls_rwsem);
-		kctl = snd_ctl_find_id_locked(card, id);
-		if (kctl) {
-			ioff = snd_ctl_get_ioff(kctl, id);
-			vd = &kctl->vd[ioff];
-			access = vd->access & SNDRV_CTL_ELEM_ACCESS_LED_MASK;
-			if (access != 0 && access != group_to_access(group)) {
-				err = -EXDEV;
-				goto unlock;
-			}
-			new_access = vd->access & ~SNDRV_CTL_ELEM_ACCESS_LED_MASK;
-			if (set)
-				new_access |= group_to_access(group);
-			if (new_access != vd->access) {
-				vd->access = new_access;
-				snd_ctl_led_notify(card, SNDRV_CTL_EVENT_MASK_INFO, kctl, ioff);
-			}
-		} else {
-			err = -ENOENT;
-		}
-unlock:
-		up_write(&card->controls_rwsem);
-		snd_card_unref(card);
-	} else {
-		err = -ENXIO;
+	if (!card)
+		return -ENXIO;
+	guard(rwsem_write)(&card->controls_rwsem);
+	kctl = snd_ctl_find_id_locked(card, id);
+	if (!kctl)
+		return -ENOENT;
+	ioff = snd_ctl_get_ioff(kctl, id);
+	vd = &kctl->vd[ioff];
+	access = vd->access & SNDRV_CTL_ELEM_ACCESS_LED_MASK;
+	if (access != 0 && access != group_to_access(group))
+		return -EXDEV;
+	new_access = vd->access & ~SNDRV_CTL_ELEM_ACCESS_LED_MASK;
+	if (set)
+		new_access |= group_to_access(group);
+	if (new_access != vd->access) {
+		vd->access = new_access;
+		snd_ctl_led_notify(card, SNDRV_CTL_EVENT_MASK_INFO, kctl, ioff);
 	}
-	return err;
+	return 0;
 }
 
 static void snd_ctl_led_refresh(void)
@@ -312,7 +301,7 @@ static void snd_ctl_led_clean(struct snd_card *card)
 
 static int snd_ctl_led_reset(int card_number, unsigned int group)
 {
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_unref) = NULL;
 	struct snd_ctl_led *led;
 	struct snd_ctl_led_ctl *lctl;
 	struct snd_kcontrol_volatile *vd;
@@ -322,26 +311,22 @@ static int snd_ctl_led_reset(int card_number, unsigned int group)
 	if (!card)
 		return -ENXIO;
 
-	mutex_lock(&snd_ctl_led_mutex);
-	if (!snd_ctl_led_card_valid[card_number]) {
-		mutex_unlock(&snd_ctl_led_mutex);
-		snd_card_unref(card);
-		return -ENXIO;
-	}
-	led = &snd_ctl_leds[group];
+	scoped_guard(mutex, &snd_ctl_led_mutex) {
+		if (!snd_ctl_led_card_valid[card_number])
+			return -ENXIO;
+		led = &snd_ctl_leds[group];
 repeat:
-	list_for_each_entry(lctl, &led->controls, list)
-		if (lctl->card == card) {
-			vd = &lctl->kctl->vd[lctl->index_offset];
-			vd->access &= ~group_to_access(group);
-			snd_ctl_led_ctl_destroy(lctl);
-			change = true;
-			goto repeat;
-		}
-	mutex_unlock(&snd_ctl_led_mutex);
+		list_for_each_entry(lctl, &led->controls, list)
+			if (lctl->card == card) {
+				vd = &lctl->kctl->vd[lctl->index_offset];
+				vd->access &= ~group_to_access(group);
+				snd_ctl_led_ctl_destroy(lctl);
+				change = true;
+				goto repeat;
+			}
+	}
 	if (change)
 		snd_ctl_led_set_state(NULL, group_to_access(group), NULL, 0);
-	snd_card_unref(card);
 	return 0;
 }
 
@@ -353,9 +338,8 @@ static void snd_ctl_led_register(struct snd_card *card)
 	if (snd_BUG_ON(card->number < 0 ||
 		       card->number >= ARRAY_SIZE(snd_ctl_led_card_valid)))
 		return;
-	mutex_lock(&snd_ctl_led_mutex);
-	snd_ctl_led_card_valid[card->number] = true;
-	mutex_unlock(&snd_ctl_led_mutex);
+	scoped_guard(mutex, &snd_ctl_led_mutex)
+		snd_ctl_led_card_valid[card->number] = true;
 	/* the register callback is already called with held card->controls_rwsem */
 	list_for_each_entry(kctl, &card->controls, list)
 		for (ioff = 0; ioff < kctl->count; ioff++)
@@ -367,10 +351,10 @@ static void snd_ctl_led_register(struct snd_card *card)
 static void snd_ctl_led_disconnect(struct snd_card *card)
 {
 	snd_ctl_led_sysfs_remove(card);
-	mutex_lock(&snd_ctl_led_mutex);
-	snd_ctl_led_card_valid[card->number] = false;
-	snd_ctl_led_clean(card);
-	mutex_unlock(&snd_ctl_led_mutex);
+	scoped_guard(mutex, &snd_ctl_led_mutex) {
+		snd_ctl_led_card_valid[card->number] = false;
+		snd_ctl_led_clean(card);
+	}
 	snd_ctl_led_refresh();
 }
 
@@ -430,9 +414,8 @@ static ssize_t mode_store(struct device *dev,
 	else
 		return count;
 
-	mutex_lock(&snd_ctl_led_mutex);
-	led->mode = mode;
-	mutex_unlock(&snd_ctl_led_mutex);
+	scoped_guard(mutex, &snd_ctl_led_mutex)
+		led->mode = mode;
 
 	snd_ctl_led_set_state(NULL, group_to_access(led->group), NULL, 0);
 	return count;
@@ -615,15 +598,15 @@ static ssize_t list_show(struct device *dev,
 			 struct device_attribute *attr, char *buf)
 {
 	struct snd_ctl_led_card *led_card = container_of(dev, struct snd_ctl_led_card, dev);
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_unref) = NULL;
 	struct snd_ctl_led_ctl *lctl;
 	size_t l = 0;
 
 	card = snd_card_ref(led_card->number);
 	if (!card)
 		return -ENXIO;
-	down_read(&card->controls_rwsem);
-	mutex_lock(&snd_ctl_led_mutex);
+	guard(rwsem_read)(&card->controls_rwsem);
+	guard(mutex)(&snd_ctl_led_mutex);
 	if (snd_ctl_led_card_valid[led_card->number]) {
 		list_for_each_entry(lctl, &led_card->led->controls, list) {
 			if (lctl->card != card)
@@ -634,9 +617,6 @@ static ssize_t list_show(struct device *dev,
 					   lctl->kctl->id.numid + lctl->index_offset);
 		}
 	}
-	mutex_unlock(&snd_ctl_led_mutex);
-	up_read(&card->controls_rwsem);
-	snd_card_unref(card);
 	return l;
 }
 
-- 
2.35.3

