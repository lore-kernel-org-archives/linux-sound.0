Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D761B1922E2
	for <linux-sound@vger.kernel.org>; Tue, 30 Jul 2024 12:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722342775; cv=none; b=qdgA4R7JDRxHNlbsWryDa9JX9ojg1mnymUe4bZ0dArwBw1dZzZqm/91mdoFh/o2jEMXYDhmXFAkx07W0zK8y2KXjrMMg4s7CFO7HW5YkDAkeJ2FSetBbYL329V1jifAE2avsms4UvhLH3tFWT4sow+3r9rouxwvw3a3EPIuQaK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722342775; c=relaxed/simple;
	bh=mdMEcsvsUbcpslpmrPj8CqtwKRTXUYZpGznQR0KvwPw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sts2pt3WacUwv74hO86WnRr+9CgqoF5eG0FcDaEZZaY1oe1CqMThelyv9wSN9tz6fbPC2K85+nLrv+tZpERXJwoXWW4ffFOyxAEGmwTrquabPRSNxYS9kYum6VIcOU4MgHV4/4W3TaoHefuZm6o2I6So8EdITFM6biRbnk2xAzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=s+X2tBBG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nTa1R10a; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=s+X2tBBG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nTa1R10a; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="s+X2tBBG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nTa1R10a";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="s+X2tBBG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nTa1R10a"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 111B51F7B2;
	Tue, 30 Jul 2024 12:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722342772; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oggZ8Pc7iID9gHIMAgwgfxxyb/zNMDNt4TSGVo8/dlI=;
	b=s+X2tBBGJ2YDLyJoPqCekNyEdGg1h5pbunASRHOXEK7+wKDMuH1eLK3ZEbrqpq4q1UhQb/
	NSR6rcXT2hbBetRV0Tc95yiCuze70cOSEyHid74uOAx7uNJWI26xZ3ygsgRKTkYkIZg5Ps
	4jdplFoptk1cru4B70oe1AfXZ65NptA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722342772;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oggZ8Pc7iID9gHIMAgwgfxxyb/zNMDNt4TSGVo8/dlI=;
	b=nTa1R10adLyWhBY9ZuBeo/GwwzQTTC2V4yfBD2pS234L8RgobB76xa8eDq8ERNVu2NOF7l
	8OZm8tYJSwibPGAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722342772; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oggZ8Pc7iID9gHIMAgwgfxxyb/zNMDNt4TSGVo8/dlI=;
	b=s+X2tBBGJ2YDLyJoPqCekNyEdGg1h5pbunASRHOXEK7+wKDMuH1eLK3ZEbrqpq4q1UhQb/
	NSR6rcXT2hbBetRV0Tc95yiCuze70cOSEyHid74uOAx7uNJWI26xZ3ygsgRKTkYkIZg5Ps
	4jdplFoptk1cru4B70oe1AfXZ65NptA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722342772;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oggZ8Pc7iID9gHIMAgwgfxxyb/zNMDNt4TSGVo8/dlI=;
	b=nTa1R10adLyWhBY9ZuBeo/GwwzQTTC2V4yfBD2pS234L8RgobB76xa8eDq8ERNVu2NOF7l
	8OZm8tYJSwibPGAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EBC1F13297;
	Tue, 30 Jul 2024 12:32:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qIT5OHPdqGb0SQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 30 Jul 2024 12:32:51 +0000
Date: Tue, 30 Jul 2024 14:33:28 +0200
Message-ID: <87ikwn3vqf.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	<broonie@kernel.org>,
	<lgirdwood@gmail.com>,
	<linux-sound@vger.kernel.org>,
	<patches@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs42l43: Move shutter IRQ handling into a worker thread
In-Reply-To: <ZqinleaAqikxdQGr@opensource.cirrus.com>
References: <20240729155932.3054632-1-ckeepax@opensource.cirrus.com>
	<87plqw9no5.wl-tiwai@suse.de>
	<ZqfHC7IodobTlVT4@opensource.cirrus.com>
	<87ikwo9etj.wl-tiwai@suse.de>
	<ZqinleaAqikxdQGr@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: multipart/mixed;
 boundary="Multipart_Tue_Jul_30_14:33:28_2024-1"
X-Spamd-Result: default: False [-3.10 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~,3:~];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,kernel.org,gmail.com,vger.kernel.org,opensource.cirrus.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	HAS_ATTACHMENT(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -3.10

--Multipart_Tue_Jul_30_14:33:28_2024-1
Content-Type: text/plain; charset=US-ASCII

On Tue, 30 Jul 2024 10:43:01 +0200,
Charles Keepax wrote:
> 
> On Mon, Jul 29, 2024 at 09:30:00PM +0200, Takashi Iwai wrote:
> > On Mon, 29 Jul 2024 18:44:59 +0200,
> > Charles Keepax wrote:
> > > 
> > > On Mon, Jul 29, 2024 at 06:18:50PM +0200, Takashi Iwai wrote:
> > > > On Mon, 29 Jul 2024 17:59:32 +0200,
> > > > Charles Keepax wrote:
> > > > > 
> > > > > The microphone/speaker privacy shutter ALSA control handlers need to
> > > > > call pm_runtime_resume, since the hardware needs to be powered up to
> > > > > check the hardware state of the shutter. The IRQ handler for the
> > > > > shutters also needs to notify the ALSA control to inform user-space
> > > > > the shutters updated. However this leads to a mutex inversion, between
> > > > > the sdw_dev_lock and the controls_rwsem.
> > > > 
> > > > That's bad, how does the mutex inversion look like?  Generally
> > > > speaking, a call of snd_ctl_notify() from an irq handler is a very
> > > > standard procedure, and it should work without too much workaround.
> > > > 
> > > 
> > > SoundWire IRQs are called under the sdw_dev_lock, and then in the
> > > IRQ handler we call snd_ctl_notify which takes controls_rwsem.
> > 
> > snd_ctl_notify() doesn't take rwsem but ctl_files_rwlock.
> > And rwlock isn't taken except for two cases, at a list traverse at
> > enumerating from user-space and at the device disconnection, so it
> > shouldn't race.  Anything missing there...?
> > 
> 
> The trouble here isn't the snd_ctl_notify, the handler uses
> snd_soc_component_notify_control which also does a
> snd_soc_card_get_kcontrol, which eventually calls snd_ctl_find_id
> which does take the controls_rwsem.

OK, now it's clearer.  I think we can change snd_ctl_find_*() rather
to take rwlock instead of rwsem.  It's only a quick look-up, hence
rwlock can work well.

Totally untested patch set is below.


Takashi


--Multipart_Tue_Jul_30_14:33:28_2024-1
Content-Type: application/octet-stream; type=patch; name="0001-ALSA-control-Rename-ctl_files_rwlock-to-controls_rwl.patch"
Content-Disposition: attachment; filename="0001-ALSA-control-Rename-ctl_files_rwlock-to-controls_rwl.patch"
Content-Transfer-Encoding: 7bit

From 07cec46f18e61c8f9d2dda0606f10d8a10c13a51 Mon Sep 17 00:00:00 2001
From: Takashi Iwai <tiwai@suse.de>
Date: Tue, 30 Jul 2024 14:04:00 +0200
Subject: [PATCH 1/2] ALSA: control: Rename ctl_files_rwlock to controls_rwlock

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
index 2b857757bb19..4b31f8753262 100644
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
@@ -2192,7 +2192,7 @@ int snd_ctl_get_preferred_subdevice(struct snd_card *card, int type)
 	struct snd_ctl_file *kctl;
 	int subdevice = -1;
 
-	guard(read_lock_irqsave)(&card->ctl_files_rwlock);
+	guard(read_lock_irqsave)(&card->controls_rwlock);
 	list_for_each_entry(kctl, &card->ctl_files, list) {
 		if (kctl->pid == task_pid(current)) {
 			subdevice = kctl->preferred_subdevice[type];
@@ -2342,7 +2342,7 @@ static int snd_ctl_dev_disconnect(struct snd_device *device)
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


--Multipart_Tue_Jul_30_14:33:28_2024-1
Content-Type: application/octet-stream; type=patch; name="0002-ALSA-control-Use-controls_rwlock-instead-of-rwsem-fo.patch"
Content-Disposition: attachment; filename="0002-ALSA-control-Use-controls_rwlock-instead-of-rwsem-fo.patch"
Content-Transfer-Encoding: 7bit

From 3965247ef976db0817a26572c1a50f5d7e5e1630 Mon Sep 17 00:00:00 2001
From: Takashi Iwai <tiwai@suse.de>
Date: Tue, 30 Jul 2024 14:28:10 +0200
Subject: [PATCH 2/2] ALSA: control: Use controls_rwlock instead of rwsem for
 look-up

For a look-up of a control element via either numid or name matching,
use controls_rwlock instead of controls_rwsem.  This avoids the
unnecessary (potential) deadlock.

snd_ctl_find_id_mixer_unlocked() is still left just an alias of
snd_ctl_find_id_mixer(), as it's used in soc-card.c.  Once after
converting there, we can remove it later.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/control.h     | 22 +---------
 include/sound/core.h        |  2 +-
 sound/core/control.c        | 88 +++++++++++++++----------------------
 sound/core/control_compat.c |  2 +-
 sound/core/control_led.c    |  2 +-
 sound/core/oss/mixer_oss.c  | 10 ++---
 6 files changed, 46 insertions(+), 80 deletions(-)

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
index 4b31f8753262..b0e9654ac1b8 100644
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
@@ -795,31 +800,27 @@ snd_ctl_find_numid_slow(struct snd_card *card, unsigned int numid)
 }
 #endif /* !CONFIG_SND_CTL_FAST_LOOKUP */
 
-/**
+/*
  * snd_ctl_find_numid_locked - find the control instance with the given number-id
  * @card: the card instance
  * @numid: the number-id to search
  *
  * Finds the control instance with the given number-id from the card.
  *
- * The caller must down card->controls_rwsem before calling this function
+ * The caller must down card->controls_rwlock before calling this function
  * (if the race condition can happen).
  *
  * Return: The pointer of the instance if found, or %NULL if not.
  */
-struct snd_kcontrol *
+static struct snd_kcontrol *
 snd_ctl_find_numid_locked(struct snd_card *card, unsigned int numid)
 {
-	if (snd_BUG_ON(!card || !numid))
-		return NULL;
-	lockdep_assert_held(&card->controls_rwsem);
 #ifdef CONFIG_SND_CTL_FAST_LOOKUP
 	return xa_load(&card->ctl_numids, numid);
 #else
 	return snd_ctl_find_numid_slow(card, numid);
 #endif
 }
-EXPORT_SYMBOL(snd_ctl_find_numid_locked);
 
 /**
  * snd_ctl_find_numid - find the control instance with the given number-id
@@ -830,36 +831,38 @@ EXPORT_SYMBOL(snd_ctl_find_numid_locked);
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
+	if (snd_BUG_ON(!card || !numid))
+		return NULL;
+	guard(read_lock_irqsave)(&card->controls_rwlock);
 	return snd_ctl_find_numid_locked(card, numid);
 }
 EXPORT_SYMBOL(snd_ctl_find_numid);
 
 /**
- * snd_ctl_find_id_locked - find the control instance with the given id
+ * snd_ctl_find_id - find the control instance with the given id
  * @card: the card instance
  * @id: the id to search
  *
  * Finds the control instance with the given id from the card.
  *
- * The caller must down card->controls_rwsem before calling this function
- * (if the race condition can happen).
- *
  * Return: The pointer of the instance if found, or %NULL if not.
+ *
+ * Note that this function takes card->controls_rwlock lock internally.
  */
-struct snd_kcontrol *snd_ctl_find_id_locked(struct snd_card *card,
-					    const struct snd_ctl_elem_id *id)
+struct snd_kcontrol *snd_ctl_find_id(struct snd_card *card,
+				     const struct snd_ctl_elem_id *id)
 {
 	struct snd_kcontrol *kctl;
 
 	if (snd_BUG_ON(!card || !id))
 		return NULL;
-	lockdep_assert_held(&card->controls_rwsem);
+
+	guard(read_lock_irqsave)(&card->controls_rwlock);
 	if (id->numid != 0)
 		return snd_ctl_find_numid_locked(card, id->numid);
 #ifdef CONFIG_SND_CTL_FAST_LOOKUP
@@ -876,25 +879,6 @@ struct snd_kcontrol *snd_ctl_find_id_locked(struct snd_card *card,
 
 	return NULL;
 }
-EXPORT_SYMBOL(snd_ctl_find_id_locked);
-
-/**
- * snd_ctl_find_id - find the control instance with the given id
- * @card: the card instance
- * @id: the id to search
- *
- * Finds the control instance with the given id from the card.
- *
- * Return: The pointer of the instance if found, or %NULL if not.
- *
- * Note that this function takes card->controls_rwsem lock internally.
- */
-struct snd_kcontrol *snd_ctl_find_id(struct snd_card *card,
-				     const struct snd_ctl_elem_id *id)
-{
-	guard(rwsem_read)(&card->controls_rwsem);
-	return snd_ctl_find_id_locked(card, id);
-}
 EXPORT_SYMBOL(snd_ctl_find_id);
 
 static int snd_ctl_card_info(struct snd_card *card, struct snd_ctl_file * ctl,
@@ -1197,7 +1181,7 @@ static int snd_ctl_elem_info(struct snd_ctl_file *ctl,
 	struct snd_kcontrol *kctl;
 
 	guard(rwsem_read)(&card->controls_rwsem);
-	kctl = snd_ctl_find_id_locked(card, &info->id);
+	kctl = snd_ctl_find_id(card, &info->id);
 	if (!kctl)
 		return -ENOENT;
 	return __snd_ctl_elem_info(card, kctl, info, ctl);
@@ -1238,7 +1222,7 @@ static int snd_ctl_elem_read(struct snd_card *card,
 	int ret;
 
 	guard(rwsem_read)(&card->controls_rwsem);
-	kctl = snd_ctl_find_id_locked(card, &control->id);
+	kctl = snd_ctl_find_id(card, &control->id);
 	if (!kctl)
 		return -ENOENT;
 
@@ -1307,7 +1291,7 @@ static int snd_ctl_elem_write(struct snd_card *card, struct snd_ctl_file *file,
 	int result = 0;
 
 	down_write(&card->controls_rwsem);
-	kctl = snd_ctl_find_id_locked(card, &control->id);
+	kctl = snd_ctl_find_id(card, &control->id);
 	if (kctl == NULL) {
 		up_write(&card->controls_rwsem);
 		return -ENOENT;
@@ -1387,7 +1371,7 @@ static int snd_ctl_elem_lock(struct snd_ctl_file *file,
 	if (copy_from_user(&id, _id, sizeof(id)))
 		return -EFAULT;
 	guard(rwsem_write)(&card->controls_rwsem);
-	kctl = snd_ctl_find_id_locked(card, &id);
+	kctl = snd_ctl_find_id(card, &id);
 	if (!kctl)
 		return -ENOENT;
 	vd = &kctl->vd[snd_ctl_get_ioff(kctl, &id)];
@@ -1408,7 +1392,7 @@ static int snd_ctl_elem_unlock(struct snd_ctl_file *file,
 	if (copy_from_user(&id, _id, sizeof(id)))
 		return -EFAULT;
 	guard(rwsem_write)(&card->controls_rwsem);
-	kctl = snd_ctl_find_id_locked(card, &id);
+	kctl = snd_ctl_find_id(card, &id);
 	if (!kctl)
 		return -ENOENT;
 	vd = &kctl->vd[snd_ctl_get_ioff(kctl, &id)];
@@ -1905,7 +1889,7 @@ static int snd_ctl_tlv_ioctl(struct snd_ctl_file *file,
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


--Multipart_Tue_Jul_30_14:33:28_2024-1--
