Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35EE321F4C
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 15:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756480065; cv=none; b=oRJFH+43/w2bDHEwe2sMMM8GORdCc1gJHYoxdKgU/xqBYqDqkii6W+F0GCtuX1Z7znH0RnstyTjvbt4xln/cUnDsFi6krs9pX6TnsVK5QEzU7sr6X0VAkLtBY3k3B6veaKYJpsiHJ3Vs6eCIMhNv39RC+pBUiSx25YerQW3Y5cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756480065; c=relaxed/simple;
	bh=2zCZ+90QXgjw/1Q8GieFI9RiAAxQ5V+Uq8+aENyIDLU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZmG2YGS16WcocCA9pCTKMLCK0Sv3j92j87wnHX8b0lmmg8la/HfbvDN7cHx1a3A9xXYygpI5itsErVIno+T0fNT/LeNxzBwlaKDne6ZK8BokVrmho+jrp92560ugVYEy9T7f1K0qKFFhu9gmFAZopiRGoD7oomLv0jomfNIkZhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=P4m943t6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gLDJ4Ilm; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=P4m943t6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gLDJ4Ilm; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="P4m943t6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gLDJ4Ilm";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="P4m943t6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gLDJ4Ilm"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AD2435C24C;
	Fri, 29 Aug 2025 15:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756480054; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/aa5VcFghxeFfLmPMn02paBHDalY2cbfCaUQJdRofkU=;
	b=P4m943t60lDredM0ZMWY1rF4wqQQdvQVuT3xdkMqkpBf3xZLiRbn0XXcNMrtwoCvktCkdd
	LUiNM5EK/sBp+F6jyoifOhphsizc2x/cLuhVjxh9ZqVk35oL5z6qWF4GGDOQuD2b+s0Of2
	MbcJvclTOFj9dAF2+2WD+qSI2DrP83U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756480054;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/aa5VcFghxeFfLmPMn02paBHDalY2cbfCaUQJdRofkU=;
	b=gLDJ4IlmxRpcmh77kiuG+OCqHpFC/GON95g1aNnD0203UGNU6WsKiW3+lEcM4hXLeO3Adg
	RxOTa/4mzUKLB3Ag==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756480054; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/aa5VcFghxeFfLmPMn02paBHDalY2cbfCaUQJdRofkU=;
	b=P4m943t60lDredM0ZMWY1rF4wqQQdvQVuT3xdkMqkpBf3xZLiRbn0XXcNMrtwoCvktCkdd
	LUiNM5EK/sBp+F6jyoifOhphsizc2x/cLuhVjxh9ZqVk35oL5z6qWF4GGDOQuD2b+s0Of2
	MbcJvclTOFj9dAF2+2WD+qSI2DrP83U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756480054;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/aa5VcFghxeFfLmPMn02paBHDalY2cbfCaUQJdRofkU=;
	b=gLDJ4IlmxRpcmh77kiuG+OCqHpFC/GON95g1aNnD0203UGNU6WsKiW3+lEcM4hXLeO3Adg
	RxOTa/4mzUKLB3Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8E0B013A6A;
	Fri, 29 Aug 2025 15:07:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yHFoITbCsWjMHwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 15:07:34 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 3/9] ALSA: usx2y: Use guard() for mutex locks
Date: Fri, 29 Aug 2025 17:07:11 +0200
Message-ID: <20250829150724.6886-4-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829150724.6886-1-tiwai@suse.de>
References: <20250829150724.6886-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

Replace the manual mutex lock/unlock pairs with guard() for code
simplification.

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/usx2y/us122l.c        | 44 +++++++++++----------------------
 sound/usb/usx2y/usbusx2yaudio.c | 23 ++++++-----------
 sound/usb/usx2y/usx2yhwdeppcm.c | 33 +++++++++----------------
 3 files changed, 35 insertions(+), 65 deletions(-)

diff --git a/sound/usb/usx2y/us122l.c b/sound/usb/usx2y/us122l.c
index 8dbbefe3e730..011ea96e9779 100644
--- a/sound/usb/usx2y/us122l.c
+++ b/sound/usb/usx2y/us122l.c
@@ -97,10 +97,10 @@ static vm_fault_t usb_stream_hwdep_vm_fault(struct vm_fault *vmf)
 	struct us122l *us122l = vmf->vma->vm_private_data;
 	struct usb_stream *s;
 
-	mutex_lock(&us122l->mutex);
+	guard(mutex)(&us122l->mutex);
 	s = us122l->sk.s;
 	if (!s)
-		goto unlock;
+		return VM_FAULT_SIGBUS;
 
 	offset = vmf->pgoff << PAGE_SHIFT;
 	if (offset < PAGE_ALIGN(s->read_size)) {
@@ -108,21 +108,17 @@ static vm_fault_t usb_stream_hwdep_vm_fault(struct vm_fault *vmf)
 	} else {
 		offset -= PAGE_ALIGN(s->read_size);
 		if (offset >= PAGE_ALIGN(s->write_size))
-			goto unlock;
+			return VM_FAULT_SIGBUS;
 
 		vaddr = us122l->sk.write_page + offset;
 	}
 	page = virt_to_page(vaddr);
 
 	get_page(page);
-	mutex_unlock(&us122l->mutex);
 
 	vmf->page = page;
 
 	return 0;
-unlock:
-	mutex_unlock(&us122l->mutex);
-	return VM_FAULT_SIGBUS;
 }
 
 
@@ -163,12 +159,11 @@ static int usb_stream_hwdep_release(struct snd_hwdep *hw, struct file *file)
 	usb_autopm_put_interface(iface);
 	if (us122l->first == file)
 		us122l->first = NULL;
-	mutex_lock(&us122l->mutex);
+	guard(mutex)(&us122l->mutex);
 	if (us122l->master == file)
 		us122l->master = us122l->slave;
 
 	us122l->slave = NULL;
-	mutex_unlock(&us122l->mutex);
 	return 0;
 }
 
@@ -179,23 +174,19 @@ static int usb_stream_hwdep_mmap(struct snd_hwdep *hw,
 	struct us122l	*us122l = hw->private_data;
 	unsigned long offset;
 	struct usb_stream *s;
-	int err = 0;
 	bool read;
 
 	offset = area->vm_pgoff << PAGE_SHIFT;
-	mutex_lock(&us122l->mutex);
+	guard(mutex)(&us122l->mutex);
 	s = us122l->sk.s;
 	read = offset < s->read_size;
-	if (read && area->vm_flags & VM_WRITE) {
-		err = -EPERM;
-		goto out;
-	}
+	if (read && area->vm_flags & VM_WRITE)
+		return -EPERM;
 	/* if userspace tries to mmap beyond end of our buffer, fail */
 	if (size > PAGE_ALIGN(read ? s->read_size : s->write_size)) {
 		dev_warn(hw->card->dev, "%s: size %lu > %u\n", __func__,
 			 size, read ? s->read_size : s->write_size);
-		err = -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
 	area->vm_ops = &usb_stream_hwdep_vm_ops;
@@ -203,9 +194,7 @@ static int usb_stream_hwdep_mmap(struct snd_hwdep *hw,
 	if (!read)
 		vm_flags_set(area, VM_DONTEXPAND);
 	area->vm_private_data = us122l;
-out:
-	mutex_unlock(&us122l->mutex);
-	return err;
+	return 0;
 }
 
 static __poll_t usb_stream_hwdep_poll(struct snd_hwdep *hw,
@@ -361,7 +350,7 @@ static int usb_stream_hwdep_ioctl(struct snd_hwdep *hw, struct file *file,
 
 	snd_power_wait(hw->card);
 
-	mutex_lock(&us122l->mutex);
+	guard(mutex)(&us122l->mutex);
 	s = us122l->sk.s;
 	if (!us122l->master) {
 		us122l->master = file;
@@ -381,7 +370,6 @@ static int usb_stream_hwdep_ioctl(struct snd_hwdep *hw, struct file *file,
 			err = 1;
 	}
 unlock:
-	mutex_unlock(&us122l->mutex);
 	wake_up_all(&us122l->sk.sleep);
 	return err;
 }
@@ -577,9 +565,9 @@ static void snd_us122l_disconnect(struct usb_interface *intf)
 	snd_card_disconnect(card);
 
 	us122l = US122L(card);
-	mutex_lock(&us122l->mutex);
-	us122l_stop(us122l);
-	mutex_unlock(&us122l->mutex);
+	scoped_guard(mutex, &us122l->mutex) {
+		us122l_stop(us122l);
+	}
 
 	/* release the midi resources */
 	list_for_each(p, &us122l->midi_list) {
@@ -611,9 +599,8 @@ static int snd_us122l_suspend(struct usb_interface *intf, pm_message_t message)
 	list_for_each(p, &us122l->midi_list)
 		snd_usbmidi_input_stop(p);
 
-	mutex_lock(&us122l->mutex);
+	guard(mutex)(&us122l->mutex);
 	usb_stream_stop(&us122l->sk);
-	mutex_unlock(&us122l->mutex);
 
 	return 0;
 }
@@ -633,7 +620,7 @@ static int snd_us122l_resume(struct usb_interface *intf)
 	if (!us122l)
 		return 0;
 
-	mutex_lock(&us122l->mutex);
+	guard(mutex)(&us122l->mutex);
 	/* needed, doesn't restart without: */
 	if (us122l->is_us144) {
 		err = usb_set_interface(us122l->dev, 0, 1);
@@ -664,7 +651,6 @@ static int snd_us122l_resume(struct usb_interface *intf)
 	list_for_each(p, &us122l->midi_list)
 		snd_usbmidi_input_start(p);
 unlock:
-	mutex_unlock(&us122l->mutex);
 	snd_power_change_state(card, SNDRV_CTL_POWER_D0);
 	return err;
 }
diff --git a/sound/usb/usx2y/usbusx2yaudio.c b/sound/usb/usx2y/usbusx2yaudio.c
index acca8bead82e..c7c7ec9c228b 100644
--- a/sound/usb/usx2y/usbusx2yaudio.c
+++ b/sound/usb/usx2y/usbusx2yaudio.c
@@ -751,7 +751,6 @@ static int usx2y_format_set(struct usx2ydev *usx2y, snd_pcm_format_t format)
 static int snd_usx2y_pcm_hw_params(struct snd_pcm_substream *substream,
 				   struct snd_pcm_hw_params *hw_params)
 {
-	int			err = 0;
 	unsigned int		rate = params_rate(hw_params);
 	snd_pcm_format_t	format = params_format(hw_params);
 	struct snd_card *card = substream->pstr->pcm->card;
@@ -760,7 +759,7 @@ static int snd_usx2y_pcm_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_substream *test_substream;
 	int i;
 
-	mutex_lock(&usx2y(card)->pcm_mutex);
+	guard(mutex)(&usx2y(card)->pcm_mutex);
 	dev_dbg(&dev->dev->dev, "%s(%p, %p)\n", __func__, substream, hw_params);
 	/* all pcm substreams off one usx2y have to operate at the same
 	 * rate & format
@@ -777,14 +776,11 @@ static int snd_usx2y_pcm_hw_params(struct snd_pcm_substream *substream,
 		     test_substream->runtime->format != format) ||
 		    (test_substream->runtime->rate &&
 		     test_substream->runtime->rate != rate)) {
-			err = -EINVAL;
-			goto error;
+			return -EINVAL;
 		}
 	}
 
- error:
-	mutex_unlock(&usx2y(card)->pcm_mutex);
-	return err;
+	return 0;
 }
 
 /*
@@ -796,7 +792,7 @@ static int snd_usx2y_pcm_hw_free(struct snd_pcm_substream *substream)
 	struct snd_usx2y_substream *subs = runtime->private_data;
 	struct snd_usx2y_substream *cap_subs, *playback_subs;
 
-	mutex_lock(&subs->usx2y->pcm_mutex);
+	guard(mutex)(&subs->usx2y->pcm_mutex);
 	dev_dbg(&subs->usx2y->dev->dev, "%s(%p)\n", __func__, substream);
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
@@ -816,7 +812,6 @@ static int snd_usx2y_pcm_hw_free(struct snd_pcm_substream *substream)
 			usx2y_urbs_release(subs);
 		}
 	}
-	mutex_unlock(&subs->usx2y->pcm_mutex);
 	return 0;
 }
 
@@ -835,7 +830,7 @@ static int snd_usx2y_pcm_prepare(struct snd_pcm_substream *substream)
 
 	dev_dbg(&usx2y->dev->dev, "%s(%p)\n", __func__, substream);
 
-	mutex_lock(&usx2y->pcm_mutex);
+	guard(mutex)(&usx2y->pcm_mutex);
 	usx2y_subs_prepare(subs);
 	// Start hardware streams
 	// SyncStream first....
@@ -843,25 +838,23 @@ static int snd_usx2y_pcm_prepare(struct snd_pcm_substream *substream)
 		if (usx2y->format != runtime->format) {
 			err = usx2y_format_set(usx2y, runtime->format);
 			if (err < 0)
-				goto up_prepare_mutex;
+				return err;
 		}
 		if (usx2y->rate != runtime->rate) {
 			err = usx2y_rate_set(usx2y, runtime->rate);
 			if (err < 0)
-				goto up_prepare_mutex;
+				return err;
 		}
 		dev_dbg(&usx2y->dev->dev, "%s: starting capture pipe for %s\n",
 			__func__, subs == capsubs ? "self" : "playpipe");
 		err = usx2y_urbs_start(capsubs);
 		if (err < 0)
-			goto up_prepare_mutex;
+			return err;
 	}
 
 	if (subs != capsubs && atomic_read(&subs->state) < STATE_PREPARED)
 		err = usx2y_urbs_start(subs);
 
- up_prepare_mutex:
-	mutex_unlock(&usx2y->pcm_mutex);
 	return err;
 }
 
diff --git a/sound/usb/usx2y/usx2yhwdeppcm.c b/sound/usb/usx2y/usx2yhwdeppcm.c
index 1b1496adb47e..7c90214485d9 100644
--- a/sound/usb/usx2y/usx2yhwdeppcm.c
+++ b/sound/usb/usx2y/usx2yhwdeppcm.c
@@ -365,7 +365,7 @@ static int snd_usx2y_usbpcm_hw_free(struct snd_pcm_substream *substream)
 	struct snd_usx2y_substream *playback_subs;
 	struct snd_usx2y_substream *cap_subs2;
 
-	mutex_lock(&subs->usx2y->pcm_mutex);
+	guard(mutex)(&subs->usx2y->pcm_mutex);
 	dev_dbg(&subs->usx2y->dev->dev, "%s(%p)\n", __func__, substream);
 
 	cap_subs2 = subs->usx2y->subs[SNDRV_PCM_STREAM_CAPTURE + 2];
@@ -394,7 +394,6 @@ static int snd_usx2y_usbpcm_hw_free(struct snd_pcm_substream *substream)
 				usx2y_usbpcm_urbs_release(cap_subs2);
 		}
 	}
-	mutex_unlock(&subs->usx2y->pcm_mutex);
 	return 0;
 }
 
@@ -504,15 +503,13 @@ static int snd_usx2y_usbpcm_prepare(struct snd_pcm_substream *substream)
 
 	dev_dbg(&usx2y->dev->dev, "snd_usx2y_pcm_prepare(%p)\n", substream);
 
-	mutex_lock(&usx2y->pcm_mutex);
+	guard(mutex)(&usx2y->pcm_mutex);
 
 	if (!usx2y->hwdep_pcm_shm) {
 		usx2y->hwdep_pcm_shm = alloc_pages_exact(USX2Y_HWDEP_PCM_PAGES,
 							 GFP_KERNEL);
-		if (!usx2y->hwdep_pcm_shm) {
-			err = -ENOMEM;
-			goto up_prepare_mutex;
-		}
+		if (!usx2y->hwdep_pcm_shm)
+			return -ENOMEM;
 		memset(usx2y->hwdep_pcm_shm, 0, USX2Y_HWDEP_PCM_PAGES);
 	}
 
@@ -523,19 +520,19 @@ static int snd_usx2y_usbpcm_prepare(struct snd_pcm_substream *substream)
 		if (usx2y->format != runtime->format) {
 			err = usx2y_format_set(usx2y, runtime->format);
 			if (err < 0)
-				goto up_prepare_mutex;
+				return err;
 		}
 		if (usx2y->rate != runtime->rate) {
 			err = usx2y_rate_set(usx2y, runtime->rate);
 			if (err < 0)
-				goto up_prepare_mutex;
+				return err;
 		}
 		dev_dbg(&usx2y->dev->dev,
 			"starting capture pipe for %s\n", subs == capsubs ?
 			"self" : "playpipe");
 		err = usx2y_usbpcm_urbs_start(capsubs);
 		if (err < 0)
-			goto up_prepare_mutex;
+			return err;
 	}
 
 	if (subs != capsubs) {
@@ -547,14 +544,12 @@ static int snd_usx2y_usbpcm_prepare(struct snd_pcm_substream *substream)
 					"Wait: iso_frames_per_buffer=%i,captured_iso_frames=%i\n",
 					usx2y_iso_frames_per_buffer(runtime, usx2y),
 					usx2y->hwdep_pcm_shm->captured_iso_frames);
-				if (msleep_interruptible(10)) {
-					err = -ERESTARTSYS;
-					goto up_prepare_mutex;
-				}
+				if (msleep_interruptible(10))
+					return -ERESTARTSYS;
 			}
 			err = usx2y_usbpcm_urbs_start(subs);
 			if (err < 0)
-				goto up_prepare_mutex;
+				return err;
 		}
 		dev_dbg(&usx2y->dev->dev,
 			"Ready: iso_frames_per_buffer=%i,captured_iso_frames=%i\n",
@@ -564,8 +559,6 @@ static int snd_usx2y_usbpcm_prepare(struct snd_pcm_substream *substream)
 		usx2y->hwdep_pcm_shm->capture_iso_start = -1;
 	}
 
- up_prepare_mutex:
-	mutex_unlock(&usx2y->pcm_mutex);
 	return err;
 }
 
@@ -646,11 +639,10 @@ static int snd_usx2y_hwdep_pcm_open(struct snd_hwdep *hw, struct file *file)
 	struct snd_card *card = hw->card;
 	int err;
 
-	mutex_lock(&usx2y(card)->pcm_mutex);
+	guard(mutex)(&usx2y(card)->pcm_mutex);
 	err = usx2y_pcms_busy_check(card);
 	if (!err)
 		usx2y(card)->chip_status |= USX2Y_STAT_CHIP_MMAP_PCM_URBS;
-	mutex_unlock(&usx2y(card)->pcm_mutex);
 	return err;
 }
 
@@ -659,11 +651,10 @@ static int snd_usx2y_hwdep_pcm_release(struct snd_hwdep *hw, struct file *file)
 	struct snd_card *card = hw->card;
 	int err;
 
-	mutex_lock(&usx2y(card)->pcm_mutex);
+	guard(mutex)(&usx2y(card)->pcm_mutex);
 	err = usx2y_pcms_busy_check(card);
 	if (!err)
 		usx2y(hw->card)->chip_status &= ~USX2Y_STAT_CHIP_MMAP_PCM_URBS;
-	mutex_unlock(&usx2y(card)->pcm_mutex);
 	return err;
 }
 
-- 
2.50.1

