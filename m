Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A60135A68
	for <linux-sound@vger.kernel.org>; Tue, 27 Feb 2024 08:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709024009; cv=none; b=PsbOau/DLEGdaHs3rW3l5CMRmp2G2nq4Ek8be3RPQU6hfYRQLHRpDPQ3/Smw1oWfZbQcHb0cHx/BbcEhf+BXaQ61RQF7ANYLvxzA7OQV91+lB0z7bUocn4bp//2LTCc1xoD/3on0h35m35VONxWV9qYzx8oqQK2HMj5FkuCYf1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709024009; c=relaxed/simple;
	bh=Gm8ES37GC8nY+hXCEZT03EAKNuq4Wo9dwUi+RcISECw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XImO5qFYFFrrlvSDJMcafygxjPErZXs0xf0guzHgej40pUTaty63FJqBfP2VTNrrPZfnmEo6WLP0RUE2kP9YiI8sg26xe/W3ICjeDaSKiCxykBjEP0DUEFojedTINrOglwPfyWIDHXvQoO7t2bgqZ6dkdXzCb2Xavw93H7XAlQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VkSw2Myg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OR8BNYDE; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VkSw2Myg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OR8BNYDE; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VkSw2Myg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OR8BNYDE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VkSw2Myg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OR8BNYDE"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4CA8622786;
	Tue, 27 Feb 2024 08:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709023997; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EDPUqMTmZolyxq139RXrsdVw3qJOapC8UZaZmsiwy3I=;
	b=VkSw2MygfANBgFXVTx+5veWPJiEuvWy03A3D7MkuBkkcG9abbw3EmLobSsY3oDRB0nLQA/
	e3sOy65STRoVF78ihA2XLMUX+iW4+tL1FsPwXDxtZv7eI0xxOJF5DomcnaCv+023UzHOOU
	LvCiRMqf5PjsV+IPq2WDIP5Cw95jvZ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709023997;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EDPUqMTmZolyxq139RXrsdVw3qJOapC8UZaZmsiwy3I=;
	b=OR8BNYDEOIdDiY7tFIS7Wpt7KnDy5CIQKdXO/5ZlVIqISOrVVT8JAqPDCwM4mr8x6PX0i5
	Pe2Is2INTmAiw8DA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709023997; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EDPUqMTmZolyxq139RXrsdVw3qJOapC8UZaZmsiwy3I=;
	b=VkSw2MygfANBgFXVTx+5veWPJiEuvWy03A3D7MkuBkkcG9abbw3EmLobSsY3oDRB0nLQA/
	e3sOy65STRoVF78ihA2XLMUX+iW4+tL1FsPwXDxtZv7eI0xxOJF5DomcnaCv+023UzHOOU
	LvCiRMqf5PjsV+IPq2WDIP5Cw95jvZ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709023997;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EDPUqMTmZolyxq139RXrsdVw3qJOapC8UZaZmsiwy3I=;
	b=OR8BNYDEOIdDiY7tFIS7Wpt7KnDy5CIQKdXO/5ZlVIqISOrVVT8JAqPDCwM4mr8x6PX0i5
	Pe2Is2INTmAiw8DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2981D13A58;
	Tue, 27 Feb 2024 08:53:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qDX7CP2i3WWeaQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 27 Feb 2024 08:53:17 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v3 24/24] ALSA: control_led: Use guard() for locking
Date: Tue, 27 Feb 2024 09:53:06 +0100
Message-Id: <20240227085306.9764-25-tiwai@suse.de>
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
	 R_RATELIMIT(0.00)[to_ip_from(RLsqo7dymd5dgmoaprf5rep8is)];
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

