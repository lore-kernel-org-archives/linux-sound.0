Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373C61DEFFC
	for <linux-sound@vger.kernel.org>; Fri, 21 Mar 2025 17:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742578019; cv=none; b=KmIwHGLVMBb9MPJYXVQmX7W+LumGw4i7Vs6OBH3oiTDGnN/NneCdhFphBUEBJZ7BVhmJ48RJRAfICawWDzZB/KViJOnsMm5XvKd7IrFdEnF+CFrXhIs1qANjt6IwBO9/yD9hbpcg7JOdljHWn1WsZrcnOK/+bFIn7u+g3tLBZnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742578019; c=relaxed/simple;
	bh=S6LOhBcDy/pT5S5Rpd+EQsmkJ6u5+Piyodn1CJDC9zo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=Uhr7Lu242gTFVA3UP3v+D6WuKfkf5WFEJMiPQh+pkWtSeljYz2n5/qbqTO/PEujkxaJ0vYbeL2+xyaUiWwzbZZp7+ZQnZGgt6Al07QEKP99HOyyxbVEgjZtYhGLExmS51FIGtVgKwr+WgivVD8Z+h3jmDN1I4PJTfiH6r3Qbn2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YN+dPM2y; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LflgYAj9; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YN+dPM2y; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LflgYAj9; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YN+dPM2y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LflgYAj9";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YN+dPM2y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LflgYAj9"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 239E021D4D;
	Fri, 21 Mar 2025 17:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742578015; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=JdjDnfBNAIIaT2O2a7eJrQmuGrhqa0laxDN0YCnX0iM=;
	b=YN+dPM2yBMdSfVSaJMJ9Ml9AL9SnwduPrXGxa2XnjvKHRmmTD/tzeZi7kdjMC5w6RlL2lI
	W4x5gmVyjEkGIdOx9RLHskulxxInlwgprZbPZJQcRRY8r4uPewhEaqWS0j0NZ7HnISeBJI
	NLQexNy1by0MThBookowKqwDBdqE868=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742578015;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=JdjDnfBNAIIaT2O2a7eJrQmuGrhqa0laxDN0YCnX0iM=;
	b=LflgYAj92RHCZNQSR38aoYLciVgz2wQxFzqndaNnE+XGD3TfpoiVNbukiERnZQgsSgGiRc
	KDtuE+j0iz4p42BA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=YN+dPM2y;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=LflgYAj9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742578015; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=JdjDnfBNAIIaT2O2a7eJrQmuGrhqa0laxDN0YCnX0iM=;
	b=YN+dPM2yBMdSfVSaJMJ9Ml9AL9SnwduPrXGxa2XnjvKHRmmTD/tzeZi7kdjMC5w6RlL2lI
	W4x5gmVyjEkGIdOx9RLHskulxxInlwgprZbPZJQcRRY8r4uPewhEaqWS0j0NZ7HnISeBJI
	NLQexNy1by0MThBookowKqwDBdqE868=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742578015;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=JdjDnfBNAIIaT2O2a7eJrQmuGrhqa0laxDN0YCnX0iM=;
	b=LflgYAj92RHCZNQSR38aoYLciVgz2wQxFzqndaNnE+XGD3TfpoiVNbukiERnZQgsSgGiRc
	KDtuE+j0iz4p42BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 07BC9139AA;
	Fri, 21 Mar 2025 17:26:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ONK3AF+h3We6NwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 21 Mar 2025 17:26:55 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: timer: Don't take register_mutex with copy_from/to_user()
Date: Fri, 21 Mar 2025 18:26:52 +0100
Message-ID: <20250321172653.14310-1-tiwai@suse.de>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 239E021D4D
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

The infamous mmap_lock taken in copy_from/to_user() can be often
problematic when it's called inside another mutex, as they might lead
to deadlocks.

In the case of ALSA timer code, the bad pattern is with
guard(mutex)(&register_mutex) that covers copy_from/to_user() -- which
was mistakenly introduced at converting to guard(), and it had been
carefully worked around in the past.

This patch fixes those pieces simply by moving copy_from/to_user() out
of the register mutex lock again.

Fixes: 3923de04c817 ("ALSA: pcm: oss: Use guard() for setup")
Reported-by: syzbot+2b96f44164236dda0f3b@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/67dd86c8.050a0220.25ae54.0059.GAE@google.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/timer.c | 147 ++++++++++++++++++++++++---------------------
 1 file changed, 77 insertions(+), 70 deletions(-)

diff --git a/sound/core/timer.c b/sound/core/timer.c
index fbada79380f9..d774b9b71ce2 100644
--- a/sound/core/timer.c
+++ b/sound/core/timer.c
@@ -1515,91 +1515,97 @@ static void snd_timer_user_copy_id(struct snd_timer_id *id, struct snd_timer *ti
 	id->subdevice = timer->tmr_subdevice;
 }
 
-static int snd_timer_user_next_device(struct snd_timer_id __user *_tid)
+static void get_next_device(struct snd_timer_id *id)
 {
-	struct snd_timer_id id;
 	struct snd_timer *timer;
 	struct list_head *p;
 
-	if (copy_from_user(&id, _tid, sizeof(id)))
-		return -EFAULT;
-	guard(mutex)(&register_mutex);
-	if (id.dev_class < 0) {		/* first item */
+	if (id->dev_class < 0) {		/* first item */
 		if (list_empty(&snd_timer_list))
-			snd_timer_user_zero_id(&id);
+			snd_timer_user_zero_id(id);
 		else {
 			timer = list_entry(snd_timer_list.next,
 					   struct snd_timer, device_list);
-			snd_timer_user_copy_id(&id, timer);
+			snd_timer_user_copy_id(id, timer);
 		}
 	} else {
-		switch (id.dev_class) {
+		switch (id->dev_class) {
 		case SNDRV_TIMER_CLASS_GLOBAL:
-			id.device = id.device < 0 ? 0 : id.device + 1;
+			id->device = id->device < 0 ? 0 : id->device + 1;
 			list_for_each(p, &snd_timer_list) {
 				timer = list_entry(p, struct snd_timer, device_list);
 				if (timer->tmr_class > SNDRV_TIMER_CLASS_GLOBAL) {
-					snd_timer_user_copy_id(&id, timer);
+					snd_timer_user_copy_id(id, timer);
 					break;
 				}
-				if (timer->tmr_device >= id.device) {
-					snd_timer_user_copy_id(&id, timer);
+				if (timer->tmr_device >= id->device) {
+					snd_timer_user_copy_id(id, timer);
 					break;
 				}
 			}
 			if (p == &snd_timer_list)
-				snd_timer_user_zero_id(&id);
+				snd_timer_user_zero_id(id);
 			break;
 		case SNDRV_TIMER_CLASS_CARD:
 		case SNDRV_TIMER_CLASS_PCM:
-			if (id.card < 0) {
-				id.card = 0;
+			if (id->card < 0) {
+				id->card = 0;
 			} else {
-				if (id.device < 0) {
-					id.device = 0;
+				if (id->device < 0) {
+					id->device = 0;
 				} else {
-					if (id.subdevice < 0)
-						id.subdevice = 0;
-					else if (id.subdevice < INT_MAX)
-						id.subdevice++;
+					if (id->subdevice < 0)
+						id->subdevice = 0;
+					else if (id->subdevice < INT_MAX)
+						id->subdevice++;
 				}
 			}
 			list_for_each(p, &snd_timer_list) {
 				timer = list_entry(p, struct snd_timer, device_list);
-				if (timer->tmr_class > id.dev_class) {
-					snd_timer_user_copy_id(&id, timer);
+				if (timer->tmr_class > id->dev_class) {
+					snd_timer_user_copy_id(id, timer);
 					break;
 				}
-				if (timer->tmr_class < id.dev_class)
+				if (timer->tmr_class < id->dev_class)
 					continue;
-				if (timer->card->number > id.card) {
-					snd_timer_user_copy_id(&id, timer);
+				if (timer->card->number > id->card) {
+					snd_timer_user_copy_id(id, timer);
 					break;
 				}
-				if (timer->card->number < id.card)
+				if (timer->card->number < id->card)
 					continue;
-				if (timer->tmr_device > id.device) {
-					snd_timer_user_copy_id(&id, timer);
+				if (timer->tmr_device > id->device) {
+					snd_timer_user_copy_id(id, timer);
 					break;
 				}
-				if (timer->tmr_device < id.device)
+				if (timer->tmr_device < id->device)
 					continue;
-				if (timer->tmr_subdevice > id.subdevice) {
-					snd_timer_user_copy_id(&id, timer);
+				if (timer->tmr_subdevice > id->subdevice) {
+					snd_timer_user_copy_id(id, timer);
 					break;
 				}
-				if (timer->tmr_subdevice < id.subdevice)
+				if (timer->tmr_subdevice < id->subdevice)
 					continue;
-				snd_timer_user_copy_id(&id, timer);
+				snd_timer_user_copy_id(id, timer);
 				break;
 			}
 			if (p == &snd_timer_list)
-				snd_timer_user_zero_id(&id);
+				snd_timer_user_zero_id(id);
 			break;
 		default:
-			snd_timer_user_zero_id(&id);
+			snd_timer_user_zero_id(id);
 		}
 	}
+}
+
+static int snd_timer_user_next_device(struct snd_timer_id __user *_tid)
+{
+	struct snd_timer_id id;
+
+	if (copy_from_user(&id, _tid, sizeof(id)))
+		return -EFAULT;
+	scoped_guard(mutex, &register_mutex)
+		get_next_device(&id);
 	if (copy_to_user(_tid, &id, sizeof(*_tid)))
 		return -EFAULT;
 	return 0;
@@ -1620,23 +1626,24 @@ static int snd_timer_user_ginfo(struct file *file,
 	tid = ginfo->tid;
 	memset(ginfo, 0, sizeof(*ginfo));
 	ginfo->tid = tid;
-	guard(mutex)(&register_mutex);
-	t = snd_timer_find(&tid);
-	if (!t)
-		return -ENODEV;
-	ginfo->card = t->card ? t->card->number : -1;
-	if (t->hw.flags & SNDRV_TIMER_HW_SLAVE)
-		ginfo->flags |= SNDRV_TIMER_FLG_SLAVE;
-	strscpy(ginfo->id, t->id, sizeof(ginfo->id));
-	strscpy(ginfo->name, t->name, sizeof(ginfo->name));
-	scoped_guard(spinlock_irq, &t->lock)
-		ginfo->resolution = snd_timer_hw_resolution(t);
-	if (t->hw.resolution_min > 0) {
-		ginfo->resolution_min = t->hw.resolution_min;
-		ginfo->resolution_max = t->hw.resolution_max;
-	}
-	list_for_each(p, &t->open_list_head) {
-		ginfo->clients++;
+	scoped_guard(mutex, &register_mutex) {
+		t = snd_timer_find(&tid);
+		if (!t)
+			return -ENODEV;
+		ginfo->card = t->card ? t->card->number : -1;
+		if (t->hw.flags & SNDRV_TIMER_HW_SLAVE)
+			ginfo->flags |= SNDRV_TIMER_FLG_SLAVE;
+		strscpy(ginfo->id, t->id, sizeof(ginfo->id));
+		strscpy(ginfo->name, t->name, sizeof(ginfo->name));
+		scoped_guard(spinlock_irq, &t->lock)
+			ginfo->resolution = snd_timer_hw_resolution(t);
+		if (t->hw.resolution_min > 0) {
+			ginfo->resolution_min = t->hw.resolution_min;
+			ginfo->resolution_max = t->hw.resolution_max;
+		}
+		list_for_each(p, &t->open_list_head) {
+			ginfo->clients++;
+		}
 	}
 	if (copy_to_user(_ginfo, ginfo, sizeof(*ginfo)))
 		return -EFAULT;
@@ -1674,31 +1681,31 @@ static int snd_timer_user_gstatus(struct file *file,
 	struct snd_timer_gstatus gstatus;
 	struct snd_timer_id tid;
 	struct snd_timer *t;
-	int err = 0;
 
 	if (copy_from_user(&gstatus, _gstatus, sizeof(gstatus)))
 		return -EFAULT;
 	tid = gstatus.tid;
 	memset(&gstatus, 0, sizeof(gstatus));
 	gstatus.tid = tid;
-	guard(mutex)(&register_mutex);
-	t = snd_timer_find(&tid);
-	if (t != NULL) {
-		guard(spinlock_irq)(&t->lock);
-		gstatus.resolution = snd_timer_hw_resolution(t);
-		if (t->hw.precise_resolution) {
-			t->hw.precise_resolution(t, &gstatus.resolution_num,
-						 &gstatus.resolution_den);
+	scoped_guard(mutex, &register_mutex) {
+		t = snd_timer_find(&tid);
+		if (t != NULL) {
+			guard(spinlock_irq)(&t->lock);
+			gstatus.resolution = snd_timer_hw_resolution(t);
+			if (t->hw.precise_resolution) {
+				t->hw.precise_resolution(t, &gstatus.resolution_num,
+							 &gstatus.resolution_den);
+			} else {
+				gstatus.resolution_num = gstatus.resolution;
+				gstatus.resolution_den = 1000000000uL;
+			}
 		} else {
-			gstatus.resolution_num = gstatus.resolution;
-			gstatus.resolution_den = 1000000000uL;
+			return -ENODEV;
 		}
-	} else {
-		err = -ENODEV;
 	}
-	if (err >= 0 && copy_to_user(_gstatus, &gstatus, sizeof(gstatus)))
-		err = -EFAULT;
-	return err;
+	if (copy_to_user(_gstatus, &gstatus, sizeof(gstatus)))
+		return -EFAULT;
+	return 0;
 }
 
 static int snd_timer_user_tselect(struct file *file,
-- 
2.49.0

