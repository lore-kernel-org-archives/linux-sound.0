Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BBC130E59
	for <linux-sound@vger.kernel.org>; Tue, 27 Feb 2024 08:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709024005; cv=none; b=PbLPkmBV7cfgCkEb/oOTvNxSdhHbKdCXK/01L8WEx9Ax7APb4bJr5dvrQEWk/nl2Wk+7HA68o6SZ1tuKe/IEo24cmOHLTsVd014XINt8qeH3eqrb5HcgCtXkctwqLo5PZMyMU3Br2qp+MYCI5oeYx3FDxFCbnpPNGORCIZYvBoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709024005; c=relaxed/simple;
	bh=gRmFlEyZXMgFGa6Rcm1rxYy8ggIVQC5wkGlRaS8LRZY=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lsiX5jkJ0aA97YhgpER/bcUH8zOgXTJw8gXmSDyJCBe0Higu7lxXx2ytXJ5UK7Pqnz30pZEOnGf2dYlObvDj5DSbRErt3oNZ6o3RY6n9prEseToVuGtjQUSaRCAryWbRqrwln1M7yFEvh63l8Szs86uuANEX1rAhuQVsLyuZ0YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FURUyulv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+9eGaW9r; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FURUyulv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+9eGaW9r; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FURUyulv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+9eGaW9r";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FURUyulv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+9eGaW9r"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 20F2922775;
	Tue, 27 Feb 2024 08:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709023995; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zJk8cKeMTrv8cduFMH+FaZIGBPuLTJaiuu7+IdCZ4Kg=;
	b=FURUyulvUsSarUH7kKdzGOm7CFBidT7KUlIbj98ouf6AlzdXuRLEy9Iam1coQTyJH+lTRW
	7cJSEK1AEXF6UTo/HIyvspL3g9F7Z7E/NtZhA5YkRQDZSd4sDY6zOfpUbQ6veplnoCWjUC
	+7XKzu4jqTenFpY5vjxirIrs2V958wQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709023995;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zJk8cKeMTrv8cduFMH+FaZIGBPuLTJaiuu7+IdCZ4Kg=;
	b=+9eGaW9rBcxlmwSPqDKqQR2J+JS2zLmxrJVa7Z35OAA1JNMta31L7pw+hTFOaelwLo8sf9
	Z1vrbbwapJcuzHDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709023995; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zJk8cKeMTrv8cduFMH+FaZIGBPuLTJaiuu7+IdCZ4Kg=;
	b=FURUyulvUsSarUH7kKdzGOm7CFBidT7KUlIbj98ouf6AlzdXuRLEy9Iam1coQTyJH+lTRW
	7cJSEK1AEXF6UTo/HIyvspL3g9F7Z7E/NtZhA5YkRQDZSd4sDY6zOfpUbQ6veplnoCWjUC
	+7XKzu4jqTenFpY5vjxirIrs2V958wQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709023995;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zJk8cKeMTrv8cduFMH+FaZIGBPuLTJaiuu7+IdCZ4Kg=;
	b=+9eGaW9rBcxlmwSPqDKqQR2J+JS2zLmxrJVa7Z35OAA1JNMta31L7pw+hTFOaelwLo8sf9
	Z1vrbbwapJcuzHDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 081F013AD7;
	Tue, 27 Feb 2024 08:53:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KK7OAPui3WWeaQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 27 Feb 2024 08:53:15 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v3 07/24] ALSA: mixer_oss: Use guard() for locking
Date: Tue, 27 Feb 2024 09:52:49 +0100
Message-Id: <20240227085306.9764-8-tiwai@suse.de>
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
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=FURUyulv;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=+9eGaW9r
X-Spamd-Result: default: False [1.69 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 FROM_HAS_DN(0.00)[];
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
X-Spam-Score: 1.69
X-Rspamd-Queue-Id: 20F2922775
X-Spam-Level: *
X-Spam-Flag: NO
X-Spamd-Bar: +

We can simplify the code gracefully with new guard() macro and co for
automatic cleanup of locks.

Only the code refactoring, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/oss/mixer_oss.c | 228 ++++++++++++++-----------------------
 1 file changed, 86 insertions(+), 142 deletions(-)

diff --git a/sound/core/oss/mixer_oss.c b/sound/core/oss/mixer_oss.c
index e10017a42ed8..6a0508093ea6 100644
--- a/sound/core/oss/mixer_oss.c
+++ b/sound/core/oss/mixer_oss.c
@@ -130,13 +130,12 @@ static int snd_mixer_oss_devmask(struct snd_mixer_oss_file *fmixer)
 
 	if (mixer == NULL)
 		return -EIO;
-	mutex_lock(&mixer->reg_mutex);
+	guard(mutex)(&mixer->reg_mutex);
 	for (chn = 0; chn < 31; chn++) {
 		pslot = &mixer->slots[chn];
 		if (pslot->put_volume || pslot->put_recsrc)
 			result |= 1 << chn;
 	}
-	mutex_unlock(&mixer->reg_mutex);
 	return result;
 }
 
@@ -148,13 +147,12 @@ static int snd_mixer_oss_stereodevs(struct snd_mixer_oss_file *fmixer)
 
 	if (mixer == NULL)
 		return -EIO;
-	mutex_lock(&mixer->reg_mutex);
+	guard(mutex)(&mixer->reg_mutex);
 	for (chn = 0; chn < 31; chn++) {
 		pslot = &mixer->slots[chn];
 		if (pslot->put_volume && pslot->stereo)
 			result |= 1 << chn;
 	}
-	mutex_unlock(&mixer->reg_mutex);
 	return result;
 }
 
@@ -165,7 +163,7 @@ static int snd_mixer_oss_recmask(struct snd_mixer_oss_file *fmixer)
 
 	if (mixer == NULL)
 		return -EIO;
-	mutex_lock(&mixer->reg_mutex);
+	guard(mutex)(&mixer->reg_mutex);
 	if (mixer->put_recsrc && mixer->get_recsrc) {	/* exclusive */
 		result = mixer->mask_recsrc;
 	} else {
@@ -177,7 +175,6 @@ static int snd_mixer_oss_recmask(struct snd_mixer_oss_file *fmixer)
 				result |= 1 << chn;
 		}
 	}
-	mutex_unlock(&mixer->reg_mutex);
 	return result;
 }
 
@@ -188,12 +185,12 @@ static int snd_mixer_oss_get_recsrc(struct snd_mixer_oss_file *fmixer)
 
 	if (mixer == NULL)
 		return -EIO;
-	mutex_lock(&mixer->reg_mutex);
+	guard(mutex)(&mixer->reg_mutex);
 	if (mixer->put_recsrc && mixer->get_recsrc) {	/* exclusive */
 		unsigned int index;
 		result = mixer->get_recsrc(fmixer, &index);
 		if (result < 0)
-			goto unlock;
+			return result;
 		result = 1 << index;
 	} else {
 		struct snd_mixer_oss_slot *pslot;
@@ -209,8 +206,6 @@ static int snd_mixer_oss_get_recsrc(struct snd_mixer_oss_file *fmixer)
 		}
 	}
 	mixer->oss_recsrc = result;
- unlock:
-	mutex_unlock(&mixer->reg_mutex);
 	return result;
 }
 
@@ -224,7 +219,7 @@ static int snd_mixer_oss_set_recsrc(struct snd_mixer_oss_file *fmixer, int recsr
 
 	if (mixer == NULL)
 		return -EIO;
-	mutex_lock(&mixer->reg_mutex);
+	guard(mutex)(&mixer->reg_mutex);
 	if (mixer->get_recsrc && mixer->put_recsrc) {	/* exclusive input */
 		if (recsrc & ~mixer->oss_recsrc)
 			recsrc &= ~mixer->oss_recsrc;
@@ -250,7 +245,6 @@ static int snd_mixer_oss_set_recsrc(struct snd_mixer_oss_file *fmixer, int recsr
 			}
 		}
 	}
-	mutex_unlock(&mixer->reg_mutex);
 	return result;
 }
 
@@ -262,7 +256,7 @@ static int snd_mixer_oss_get_volume(struct snd_mixer_oss_file *fmixer, int slot)
 
 	if (mixer == NULL || slot > 30)
 		return -EIO;
-	mutex_lock(&mixer->reg_mutex);
+	guard(mutex)(&mixer->reg_mutex);
 	pslot = &mixer->slots[slot];
 	left = pslot->volume[0];
 	right = pslot->volume[1];
@@ -270,21 +264,15 @@ static int snd_mixer_oss_get_volume(struct snd_mixer_oss_file *fmixer, int slot)
 		result = pslot->get_volume(fmixer, pslot, &left, &right);
 	if (!pslot->stereo)
 		right = left;
-	if (snd_BUG_ON(left < 0 || left > 100)) {
-		result = -EIO;
-		goto unlock;
-	}
-	if (snd_BUG_ON(right < 0 || right > 100)) {
-		result = -EIO;
-		goto unlock;
-	}
+	if (snd_BUG_ON(left < 0 || left > 100))
+		return -EIO;
+	if (snd_BUG_ON(right < 0 || right > 100))
+		return -EIO;
 	if (result >= 0) {
 		pslot->volume[0] = left;
 		pslot->volume[1] = right;
 	 	result = (left & 0xff) | ((right & 0xff) << 8);
 	}
- unlock:
-	mutex_unlock(&mixer->reg_mutex);
 	return result;
 }
 
@@ -297,7 +285,7 @@ static int snd_mixer_oss_set_volume(struct snd_mixer_oss_file *fmixer,
 
 	if (mixer == NULL || slot > 30)
 		return -EIO;
-	mutex_lock(&mixer->reg_mutex);
+	guard(mutex)(&mixer->reg_mutex);
 	pslot = &mixer->slots[slot];
 	if (left > 100)
 		left = 100;
@@ -308,12 +296,10 @@ static int snd_mixer_oss_set_volume(struct snd_mixer_oss_file *fmixer,
 	if (pslot->put_volume)
 		result = pslot->put_volume(fmixer, pslot, left, right);
 	if (result < 0)
-		goto unlock;
+		return result;
 	pslot->volume[0] = left;
 	pslot->volume[1] = right;
 	result = (left & 0xff) | ((right & 0xff) << 8);
- unlock:
-	mutex_unlock(&mixer->reg_mutex);
 	return result;
 }
 
@@ -539,28 +525,24 @@ static void snd_mixer_oss_get_volume1_vol(struct snd_mixer_oss_file *fmixer,
 
 	if (numid == ID_UNKNOWN)
 		return;
-	down_read(&card->controls_rwsem);
+	guard(rwsem_read)(&card->controls_rwsem);
 	kctl = snd_ctl_find_numid_locked(card, numid);
-	if (!kctl) {
-		up_read(&card->controls_rwsem);
+	if (!kctl)
 		return;
-	}
 	uinfo = kzalloc(sizeof(*uinfo), GFP_KERNEL);
 	uctl = kzalloc(sizeof(*uctl), GFP_KERNEL);
 	if (uinfo == NULL || uctl == NULL)
-		goto __unalloc;
+		return;
 	if (kctl->info(kctl, uinfo))
-		goto __unalloc;
+		return;
 	if (kctl->get(kctl, uctl))
-		goto __unalloc;
+		return;
 	if (uinfo->type == SNDRV_CTL_ELEM_TYPE_BOOLEAN &&
 	    uinfo->value.integer.min == 0 && uinfo->value.integer.max == 1)
-		goto __unalloc;
+		return;
 	*left = snd_mixer_oss_conv1(uctl->value.integer.value[0], uinfo->value.integer.min, uinfo->value.integer.max, &pslot->volume[0]);
 	if (uinfo->count > 1)
 		*right = snd_mixer_oss_conv1(uctl->value.integer.value[1], uinfo->value.integer.min, uinfo->value.integer.max, &pslot->volume[1]);
-      __unalloc:
-	up_read(&card->controls_rwsem);
 }
 
 static void snd_mixer_oss_get_volume1_sw(struct snd_mixer_oss_file *fmixer,
@@ -576,20 +558,18 @@ static void snd_mixer_oss_get_volume1_sw(struct snd_mixer_oss_file *fmixer,
 
 	if (numid == ID_UNKNOWN)
 		return;
-	down_read(&card->controls_rwsem);
+	guard(rwsem_read)(&card->controls_rwsem);
 	kctl = snd_ctl_find_numid_locked(card, numid);
-	if (!kctl) {
-		up_read(&card->controls_rwsem);
+	if (!kctl)
 		return;
-	}
 	uinfo = kzalloc(sizeof(*uinfo), GFP_KERNEL);
 	uctl = kzalloc(sizeof(*uctl), GFP_KERNEL);
 	if (uinfo == NULL || uctl == NULL)
-		goto __unalloc;
+		return;
 	if (kctl->info(kctl, uinfo))
-		goto __unalloc;
+		return;
 	if (kctl->get(kctl, uctl))
-		goto __unalloc;
+		return;
 	if (!uctl->value.integer.value[0]) {
 		*left = 0;
 		if (uinfo->count == 1)
@@ -597,8 +577,6 @@ static void snd_mixer_oss_get_volume1_sw(struct snd_mixer_oss_file *fmixer,
 	}
 	if (uinfo->count > 1 && !uctl->value.integer.value[route ? 3 : 1])
 		*right = 0;
-      __unalloc:
-	up_read(&card->controls_rwsem);
 }
 
 static int snd_mixer_oss_get_volume1(struct snd_mixer_oss_file *fmixer,
@@ -640,31 +618,27 @@ static void snd_mixer_oss_put_volume1_vol(struct snd_mixer_oss_file *fmixer,
 
 	if (numid == ID_UNKNOWN)
 		return;
-	down_read(&card->controls_rwsem);
+	guard(rwsem_read)(&card->controls_rwsem);
 	kctl = snd_ctl_find_numid_locked(card, numid);
-	if (!kctl) {
-		up_read(&card->controls_rwsem);
+	if (!kctl)
 		return;
-	}
 	uinfo = kzalloc(sizeof(*uinfo), GFP_KERNEL);
 	uctl = kzalloc(sizeof(*uctl), GFP_KERNEL);
 	if (uinfo == NULL || uctl == NULL)
-		goto __unalloc;
+		return;
 	if (kctl->info(kctl, uinfo))
-		goto __unalloc;
+		return;
 	if (uinfo->type == SNDRV_CTL_ELEM_TYPE_BOOLEAN &&
 	    uinfo->value.integer.min == 0 && uinfo->value.integer.max == 1)
-		goto __unalloc;
+		return;
 	uctl->value.integer.value[0] = snd_mixer_oss_conv2(left, uinfo->value.integer.min, uinfo->value.integer.max);
 	if (uinfo->count > 1)
 		uctl->value.integer.value[1] = snd_mixer_oss_conv2(right, uinfo->value.integer.min, uinfo->value.integer.max);
 	res = kctl->put(kctl, uctl);
 	if (res < 0)
-		goto __unalloc;
+		return;
 	if (res > 0)
 		snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_VALUE, &kctl->id);
-      __unalloc:
-	up_read(&card->controls_rwsem);
 }
 
 static void snd_mixer_oss_put_volume1_sw(struct snd_mixer_oss_file *fmixer,
@@ -681,18 +655,16 @@ static void snd_mixer_oss_put_volume1_sw(struct snd_mixer_oss_file *fmixer,
 
 	if (numid == ID_UNKNOWN)
 		return;
-	down_read(&card->controls_rwsem);
+	guard(rwsem_read)(&card->controls_rwsem);
 	kctl = snd_ctl_find_numid_locked(card, numid);
-	if (!kctl) {
-		up_read(&card->controls_rwsem);
+	if (!kctl)
 		return;
-	}
 	uinfo = kzalloc(sizeof(*uinfo), GFP_KERNEL);
 	uctl = kzalloc(sizeof(*uctl), GFP_KERNEL);
 	if (uinfo == NULL || uctl == NULL)
-		goto __unalloc;
+		return;
 	if (kctl->info(kctl, uinfo))
-		goto __unalloc;
+		return;
 	if (uinfo->count > 1) {
 		uctl->value.integer.value[0] = left > 0 ? 1 : 0;
 		uctl->value.integer.value[route ? 3 : 1] = right > 0 ? 1 : 0;
@@ -705,11 +677,9 @@ static void snd_mixer_oss_put_volume1_sw(struct snd_mixer_oss_file *fmixer,
 	}
 	res = kctl->put(kctl, uctl);
 	if (res < 0)
-		goto __unalloc;
+		return;
 	if (res > 0)
 		snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_VALUE, &kctl->id);
-      __unalloc:
-	up_read(&card->controls_rwsem);
 }
 
 static int snd_mixer_oss_put_volume1(struct snd_mixer_oss_file *fmixer,
@@ -822,18 +792,16 @@ static int snd_mixer_oss_get_recsrc2(struct snd_mixer_oss_file *fmixer, unsigned
 	uctl = kzalloc(sizeof(*uctl), GFP_KERNEL);
 	if (uinfo == NULL || uctl == NULL)
 		return -ENOMEM;
-	down_read(&card->controls_rwsem);
+	guard(rwsem_read)(&card->controls_rwsem);
 	kctl = snd_mixer_oss_test_id(mixer, "Capture Source", 0);
-	if (! kctl) {
-		err = -ENOENT;
-		goto __unlock;
-	}
+	if (!kctl)
+		return -ENOENT;
 	err = kctl->info(kctl, uinfo);
 	if (err < 0)
-		goto __unlock;
+		return err;
 	err = kctl->get(kctl, uctl);
 	if (err < 0)
-		goto __unlock;
+		return err;
 	for (idx = 0; idx < 32; idx++) {
 		if (!(mixer->mask_recsrc & (1 << idx)))
 			continue;
@@ -848,10 +816,7 @@ static int snd_mixer_oss_get_recsrc2(struct snd_mixer_oss_file *fmixer, unsigned
 			break;
 		}
 	}
-	err = 0;
-      __unlock:
-     	up_read(&card->controls_rwsem);
-      	return err;
+	return 0;
 }
 
 static int snd_mixer_oss_put_recsrc2(struct snd_mixer_oss_file *fmixer, unsigned int active_index)
@@ -870,15 +835,13 @@ static int snd_mixer_oss_put_recsrc2(struct snd_mixer_oss_file *fmixer, unsigned
 	uctl = kzalloc(sizeof(*uctl), GFP_KERNEL);
 	if (uinfo == NULL || uctl == NULL)
 		return -ENOMEM;
-	down_read(&card->controls_rwsem);
+	guard(rwsem_read)(&card->controls_rwsem);
 	kctl = snd_mixer_oss_test_id(mixer, "Capture Source", 0);
-	if (! kctl) {
-		err = -ENOENT;
-		goto __unlock;
-	}
+	if (!kctl)
+		return -ENOENT;
 	err = kctl->info(kctl, uinfo);
 	if (err < 0)
-		goto __unlock;
+		return err;
 	for (idx = 0; idx < 32; idx++) {
 		if (!(mixer->mask_recsrc & (1 << idx)))
 			continue;
@@ -892,17 +855,14 @@ static int snd_mixer_oss_put_recsrc2(struct snd_mixer_oss_file *fmixer, unsigned
 			break;
 		slot = NULL;
 	}
-	if (! slot)
-		goto __unlock;
+	if (!slot)
+		return 0;
 	for (idx = 0; idx < uinfo->count; idx++)
 		uctl->value.enumerated.item[idx] = slot->capture_item;
 	err = kctl->put(kctl, uctl);
 	if (err > 0)
 		snd_ctl_notify(fmixer->card, SNDRV_CTL_EVENT_MASK_VALUE, &kctl->id);
-	err = 0;
-      __unlock:
-	up_read(&card->controls_rwsem);
-	return err;
+	return 0;
 }
 
 struct snd_mixer_oss_assign_table {
@@ -918,24 +878,18 @@ static int snd_mixer_oss_build_test(struct snd_mixer_oss *mixer, struct slot *sl
 	struct snd_card *card = mixer->card;
 	int err;
 
-	down_read(&card->controls_rwsem);
-	kcontrol = snd_mixer_oss_test_id(mixer, name, index);
-	if (kcontrol == NULL) {
-		up_read(&card->controls_rwsem);
-		return 0;
+	scoped_guard(rwsem_read, &card->controls_rwsem) {
+		kcontrol = snd_mixer_oss_test_id(mixer, name, index);
+		if (kcontrol == NULL)
+			return 0;
+		info = kmalloc(sizeof(*info), GFP_KERNEL);
+		if (!info)
+			return -ENOMEM;
+		err = kcontrol->info(kcontrol, info);
+		if (err < 0)
+			return err;
+		slot->numid[item] = kcontrol->id.numid;
 	}
-	info = kmalloc(sizeof(*info), GFP_KERNEL);
-	if (! info) {
-		up_read(&card->controls_rwsem);
-		return -ENOMEM;
-	}
-	err = kcontrol->info(kcontrol, info);
-	if (err < 0) {
-		up_read(&card->controls_rwsem);
-		return err;
-	}
-	slot->numid[item] = kcontrol->id.numid;
-	up_read(&card->controls_rwsem);
 	if (info->count > slot->channels)
 		slot->channels = info->count;
 	slot->present |= 1 << item;
@@ -1048,7 +1002,7 @@ static int snd_mixer_oss_build_input(struct snd_mixer_oss *mixer,
 	memset(slot.numid, 0xff, sizeof(slot.numid)); /* ID_UNKNOWN */
 	if (snd_mixer_oss_build_test_all(mixer, ptr, &slot))
 		return 0;
-	down_read(&mixer->card->controls_rwsem);
+	guard(rwsem_read)(&mixer->card->controls_rwsem);
 	kctl = NULL;
 	if (!ptr->index)
 		kctl = snd_mixer_oss_test_id(mixer, "Capture Source", 0);
@@ -1056,15 +1010,11 @@ static int snd_mixer_oss_build_input(struct snd_mixer_oss *mixer,
 		struct snd_ctl_elem_info *uinfo __free(kfree) = NULL;
 
 		uinfo = kzalloc(sizeof(*uinfo), GFP_KERNEL);
-		if (! uinfo) {
-			up_read(&mixer->card->controls_rwsem);
+		if (!uinfo)
 			return -ENOMEM;
-		}
 			
-		if (kctl->info(kctl, uinfo)) {
-			up_read(&mixer->card->controls_rwsem);
+		if (kctl->info(kctl, uinfo))
 			return 0;
-		}
 		strcpy(str, ptr->name);
 		if (!strcmp(str, "Master"))
 			strcpy(str, "Mix");
@@ -1076,10 +1026,8 @@ static int snd_mixer_oss_build_input(struct snd_mixer_oss *mixer,
 		} else {
 			for (slot.capture_item = 1; slot.capture_item < uinfo->value.enumerated.items; slot.capture_item++) {
 				uinfo->value.enumerated.item = slot.capture_item;
-				if (kctl->info(kctl, uinfo)) {
-					up_read(&mixer->card->controls_rwsem);
+				if (kctl->info(kctl, uinfo))
 					return 0;
-				}
 				if (!strcmp(uinfo->value.enumerated.name, str)) {
 					slot.present |= SNDRV_MIXER_OSS_PRESENT_CAPTURE;
 					break;
@@ -1087,7 +1035,6 @@ static int snd_mixer_oss_build_input(struct snd_mixer_oss *mixer,
 			}
 		}
 	}
-	up_read(&mixer->card->controls_rwsem);
 	if (slot.present != 0) {
 		pslot = kmalloc(sizeof(slot), GFP_KERNEL);
 		if (! pslot)
@@ -1160,7 +1107,7 @@ static void snd_mixer_oss_proc_read(struct snd_info_entry *entry,
 	struct snd_mixer_oss *mixer = entry->private_data;
 	int i;
 
-	mutex_lock(&mixer->reg_mutex);
+	guard(mutex)(&mixer->reg_mutex);
 	for (i = 0; i < SNDRV_OSS_MAX_MIXERS; i++) {
 		struct slot *p;
 
@@ -1175,7 +1122,6 @@ static void snd_mixer_oss_proc_read(struct snd_info_entry *entry,
 		else
 			snd_iprintf(buffer, "\"\" 0\n");
 	}
-	mutex_unlock(&mixer->reg_mutex);
 }
 
 static void snd_mixer_oss_proc_write(struct snd_info_entry *entry,
@@ -1202,9 +1148,8 @@ static void snd_mixer_oss_proc_write(struct snd_info_entry *entry,
 		cptr = snd_info_get_str(str, cptr, sizeof(str));
 		if (! *str) {
 			/* remove the entry */
-			mutex_lock(&mixer->reg_mutex);
-			mixer_slot_clear(&mixer->slots[ch]);
-			mutex_unlock(&mixer->reg_mutex);
+			scoped_guard(mutex, &mixer->reg_mutex)
+				mixer_slot_clear(&mixer->slots[ch]);
 			continue;
 		}
 		snd_info_get_str(idxstr, cptr, sizeof(idxstr));
@@ -1213,28 +1158,27 @@ static void snd_mixer_oss_proc_write(struct snd_info_entry *entry,
 			pr_err("ALSA: mixer_oss: invalid index %d\n", idx);
 			continue;
 		}
-		mutex_lock(&mixer->reg_mutex);
-		slot = (struct slot *)mixer->slots[ch].private_data;
-		if (slot && slot->assigned &&
-		    slot->assigned->index == idx && ! strcmp(slot->assigned->name, str))
-			/* not changed */
-			goto __unlock;
-		tbl = kmalloc(sizeof(*tbl), GFP_KERNEL);
-		if (!tbl)
-			goto __unlock;
-		tbl->oss_id = ch;
-		tbl->name = kstrdup(str, GFP_KERNEL);
-		if (! tbl->name) {
-			kfree(tbl);
-			goto __unlock;
+		scoped_guard(mutex, &mixer->reg_mutex) {
+			slot = (struct slot *)mixer->slots[ch].private_data;
+			if (slot && slot->assigned &&
+			    slot->assigned->index == idx && !strcmp(slot->assigned->name, str))
+				/* not changed */
+				break;
+			tbl = kmalloc(sizeof(*tbl), GFP_KERNEL);
+			if (!tbl)
+				break;
+			tbl->oss_id = ch;
+			tbl->name = kstrdup(str, GFP_KERNEL);
+			if (!tbl->name) {
+				kfree(tbl);
+				break;
+			}
+			tbl->index = idx;
+			if (snd_mixer_oss_build_input(mixer, tbl, 1, 1) <= 0) {
+				kfree(tbl->name);
+				kfree(tbl);
+			}
 		}
-		tbl->index = idx;
-		if (snd_mixer_oss_build_input(mixer, tbl, 1, 1) <= 0) {
-			kfree(tbl->name);
-			kfree(tbl);
-		}
-	__unlock:
-		mutex_unlock(&mixer->reg_mutex);
 	}
 }
 
-- 
2.35.3

