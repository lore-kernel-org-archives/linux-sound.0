Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4FA83CD3
	for <linux-sound@vger.kernel.org>; Fri, 23 Feb 2024 16:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708705704; cv=none; b=IMISsfq3blO8ILVtHCDzjznr9O7OcK1ZHSRVk3lOqcMYpMT0me62K7AaOgnykgY82aCNnnw+AqnHg3k6Y6nxmRarW0BKwJnihYLqSd+9y6rLqGyMfAT+TkWzMdfoHas30jUejbANVOMy3bT5oekmOvD8zUu2z2GFGbPW+dhy8/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708705704; c=relaxed/simple;
	bh=nhbAipQ9o+zb43E+yxnwB9O+zyALiA51pVxnXO884Rg=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GlpkVfAGncnCHdPdrhshcRoBs2DPgc7wGGSjSjr0SGTqxRO+cGhWhjXLsLDFFViyyfYHsoiBhibi/D9AZ1raa6A0P2bUftBM/xUJ1NP3AD9bYIpFWLtGBD2Z1BN0z25Y/LOYAVJnVeGX9Lgrve8YXF599CrLm2f7JeELwq4mTDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZD2lV2Cw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0gWaxMX4; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZD2lV2Cw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0gWaxMX4; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZD2lV2Cw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0gWaxMX4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZD2lV2Cw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0gWaxMX4"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B191E22087;
	Fri, 23 Feb 2024 16:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708705699; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W0c3hNHaLesqTiGUrA+ouhpkkiJpBWE9h/Ni2OMuHEk=;
	b=ZD2lV2CwMyAey/sGxHNhUMjz28kE0P/y5MMl+ZycKufUIsC1iv7rOYxZJODat+nh32fXbD
	X55wJ9iqQfb1GVpK1hfgLUYi67juOdwVhxyuHB0xVyZrBjCOmGOr3rpDcFNfVLhp3wxTxm
	+IdEzEr6BZnVfx5KjWrsppTd6/pcdac=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708705699;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W0c3hNHaLesqTiGUrA+ouhpkkiJpBWE9h/Ni2OMuHEk=;
	b=0gWaxMX4mmDYCXzIxt1V1nhrkdhgdTb6D+aYcclTZpYBlSIr7BQL9UG8kgCsYAYSaAu05n
	jdozlG0LlwHtTFCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708705699; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W0c3hNHaLesqTiGUrA+ouhpkkiJpBWE9h/Ni2OMuHEk=;
	b=ZD2lV2CwMyAey/sGxHNhUMjz28kE0P/y5MMl+ZycKufUIsC1iv7rOYxZJODat+nh32fXbD
	X55wJ9iqQfb1GVpK1hfgLUYi67juOdwVhxyuHB0xVyZrBjCOmGOr3rpDcFNfVLhp3wxTxm
	+IdEzEr6BZnVfx5KjWrsppTd6/pcdac=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708705699;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W0c3hNHaLesqTiGUrA+ouhpkkiJpBWE9h/Ni2OMuHEk=;
	b=0gWaxMX4mmDYCXzIxt1V1nhrkdhgdTb6D+aYcclTZpYBlSIr7BQL9UG8kgCsYAYSaAu05n
	jdozlG0LlwHtTFCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9697313AC1;
	Fri, 23 Feb 2024 16:28:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eFppI6PH2GWaMQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 Feb 2024 16:28:19 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 09/24] ALSA: rawmidi: Use guard() for locking
Date: Fri, 23 Feb 2024 17:27:55 +0100
Message-Id: <20240223162810.32302-10-tiwai@suse.de>
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

There are a few remaining explicit mutex and spinlock calls, and those
are the places where the temporary unlock/relocking happens -- which
guard() doens't cover well yet.

Only the code refactoring, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/rawmidi.c | 232 +++++++++++++++----------------------------
 1 file changed, 82 insertions(+), 150 deletions(-)

diff --git a/sound/core/rawmidi.c b/sound/core/rawmidi.c
index 1431cb997808..0e20ab3a4d75 100644
--- a/sound/core/rawmidi.c
+++ b/sound/core/rawmidi.c
@@ -105,13 +105,8 @@ static inline bool __snd_rawmidi_ready(struct snd_rawmidi_runtime *runtime)
 
 static bool snd_rawmidi_ready(struct snd_rawmidi_substream *substream)
 {
-	unsigned long flags;
-	bool ready;
-
-	spin_lock_irqsave(&substream->lock, flags);
-	ready = __snd_rawmidi_ready(substream->runtime);
-	spin_unlock_irqrestore(&substream->lock, flags);
-	return ready;
+	guard(spinlock_irqsave)(&substream->lock);
+	return __snd_rawmidi_ready(substream->runtime);
 }
 
 static inline int snd_rawmidi_ready_append(struct snd_rawmidi_substream *substream,
@@ -238,12 +233,9 @@ static void __reset_runtime_ptrs(struct snd_rawmidi_runtime *runtime,
 static void reset_runtime_ptrs(struct snd_rawmidi_substream *substream,
 			       bool is_input)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave(&substream->lock, flags);
+	guard(spinlock_irqsave)(&substream->lock);
 	if (substream->opened && substream->runtime)
 		__reset_runtime_ptrs(substream->runtime, is_input);
-	spin_unlock_irqrestore(&substream->lock, flags);
 }
 
 int snd_rawmidi_drop_output(struct snd_rawmidi_substream *substream)
@@ -260,33 +252,29 @@ int snd_rawmidi_drain_output(struct snd_rawmidi_substream *substream)
 	long timeout;
 	struct snd_rawmidi_runtime *runtime;
 
-	spin_lock_irq(&substream->lock);
-	runtime = substream->runtime;
-	if (!substream->opened || !runtime || !runtime->buffer) {
-		err = -EINVAL;
-	} else {
+	scoped_guard(spinlock_irq, &substream->lock) {
+		runtime = substream->runtime;
+		if (!substream->opened || !runtime || !runtime->buffer)
+			return -EINVAL;
 		snd_rawmidi_buffer_ref(runtime);
 		runtime->drain = 1;
 	}
-	spin_unlock_irq(&substream->lock);
-	if (err < 0)
-		return err;
 
 	timeout = wait_event_interruptible_timeout(runtime->sleep,
 				(runtime->avail >= runtime->buffer_size),
 				10*HZ);
 
-	spin_lock_irq(&substream->lock);
-	if (signal_pending(current))
-		err = -ERESTARTSYS;
-	if (runtime->avail < runtime->buffer_size && !timeout) {
-		rmidi_warn(substream->rmidi,
-			   "rawmidi drain error (avail = %li, buffer_size = %li)\n",
-			   (long)runtime->avail, (long)runtime->buffer_size);
-		err = -EIO;
+	scoped_guard(spinlock_irq, &substream->lock) {
+		if (signal_pending(current))
+			err = -ERESTARTSYS;
+		if (runtime->avail < runtime->buffer_size && !timeout) {
+			rmidi_warn(substream->rmidi,
+				   "rawmidi drain error (avail = %li, buffer_size = %li)\n",
+				   (long)runtime->avail, (long)runtime->buffer_size);
+			err = -EIO;
+		}
+		runtime->drain = 0;
 	}
-	runtime->drain = 0;
-	spin_unlock_irq(&substream->lock);
 
 	if (err != -ERESTARTSYS) {
 		/* we need wait a while to make sure that Tx FIFOs are empty */
@@ -297,9 +285,8 @@ int snd_rawmidi_drain_output(struct snd_rawmidi_substream *substream)
 		snd_rawmidi_drop_output(substream);
 	}
 
-	spin_lock_irq(&substream->lock);
-	snd_rawmidi_buffer_unref(runtime);
-	spin_unlock_irq(&substream->lock);
+	scoped_guard(spinlock_irq, &substream->lock)
+		snd_rawmidi_buffer_unref(runtime);
 
 	return err;
 }
@@ -363,14 +350,13 @@ static int open_substream(struct snd_rawmidi *rmidi,
 			snd_rawmidi_runtime_free(substream);
 			return err;
 		}
-		spin_lock_irq(&substream->lock);
+		guard(spinlock_irq)(&substream->lock);
 		substream->opened = 1;
 		substream->active_sensing = 0;
 		if (mode & SNDRV_RAWMIDI_LFLG_APPEND)
 			substream->append = 1;
 		substream->pid = get_pid(task_pid(current));
 		rmidi->streams[substream->stream].substream_opened++;
-		spin_unlock_irq(&substream->lock);
 	}
 	substream->use_count++;
 	return 0;
@@ -433,9 +419,8 @@ int snd_rawmidi_kernel_open(struct snd_rawmidi *rmidi, int subdevice,
 	if (!try_module_get(rmidi->card->module))
 		return -ENXIO;
 
-	mutex_lock(&rmidi->open_mutex);
+	guard(mutex)(&rmidi->open_mutex);
 	err = rawmidi_open_priv(rmidi, subdevice, mode, rfile);
-	mutex_unlock(&rmidi->open_mutex);
 	if (err < 0)
 		module_put(rmidi->card->module);
 	return err;
@@ -568,10 +553,10 @@ static void close_substream(struct snd_rawmidi *rmidi,
 		}
 		snd_rawmidi_buffer_ref_sync(substream);
 	}
-	spin_lock_irq(&substream->lock);
-	substream->opened = 0;
-	substream->append = 0;
-	spin_unlock_irq(&substream->lock);
+	scoped_guard(spinlock_irq, &substream->lock) {
+		substream->opened = 0;
+		substream->append = 0;
+	}
 	substream->ops->close(substream);
 	if (substream->runtime->private_free)
 		substream->runtime->private_free(substream);
@@ -586,7 +571,7 @@ static void rawmidi_release_priv(struct snd_rawmidi_file *rfile)
 	struct snd_rawmidi *rmidi;
 
 	rmidi = rfile->rmidi;
-	mutex_lock(&rmidi->open_mutex);
+	guard(mutex)(&rmidi->open_mutex);
 	if (rfile->input) {
 		close_substream(rmidi, rfile->input, 1);
 		rfile->input = NULL;
@@ -596,7 +581,6 @@ static void rawmidi_release_priv(struct snd_rawmidi_file *rfile)
 		rfile->output = NULL;
 	}
 	rfile->rmidi = NULL;
-	mutex_unlock(&rmidi->open_mutex);
 	wake_up(&rmidi->open_wait);
 }
 
@@ -695,12 +679,8 @@ static int __snd_rawmidi_info_select(struct snd_card *card,
 
 int snd_rawmidi_info_select(struct snd_card *card, struct snd_rawmidi_info *info)
 {
-	int ret;
-
-	mutex_lock(&register_mutex);
-	ret = __snd_rawmidi_info_select(card, info);
-	mutex_unlock(&register_mutex);
-	return ret;
+	guard(mutex)(&register_mutex);
+	return __snd_rawmidi_info_select(card, info);
 }
 EXPORT_SYMBOL(snd_rawmidi_info_select);
 
@@ -744,9 +724,8 @@ static int resize_runtime_buffer(struct snd_rawmidi_substream *substream,
 		newbuf = kvzalloc(params->buffer_size, GFP_KERNEL);
 		if (!newbuf)
 			return -ENOMEM;
-		spin_lock_irq(&substream->lock);
+		guard(spinlock_irq)(&substream->lock);
 		if (runtime->buffer_ref) {
-			spin_unlock_irq(&substream->lock);
 			kvfree(newbuf);
 			return -EBUSY;
 		}
@@ -754,7 +733,6 @@ static int resize_runtime_buffer(struct snd_rawmidi_substream *substream,
 		runtime->buffer = newbuf;
 		runtime->buffer_size = params->buffer_size;
 		__reset_runtime_ptrs(runtime, is_input);
-		spin_unlock_irq(&substream->lock);
 		kvfree(oldbuf);
 	}
 	runtime->avail_min = params->avail_min;
@@ -767,15 +745,12 @@ int snd_rawmidi_output_params(struct snd_rawmidi_substream *substream,
 	int err;
 
 	snd_rawmidi_drain_output(substream);
-	mutex_lock(&substream->rmidi->open_mutex);
+	guard(mutex)(&substream->rmidi->open_mutex);
 	if (substream->append && substream->use_count > 1)
-		err = -EBUSY;
-	else
-		err = resize_runtime_buffer(substream, params, false);
-
+		return -EBUSY;
+	err = resize_runtime_buffer(substream, params, false);
 	if (!err)
 		substream->active_sensing = !params->no_active_sensing;
-	mutex_unlock(&substream->rmidi->open_mutex);
 	return err;
 }
 EXPORT_SYMBOL(snd_rawmidi_output_params);
@@ -788,7 +763,7 @@ int snd_rawmidi_input_params(struct snd_rawmidi_substream *substream,
 	int err;
 
 	snd_rawmidi_drain_input(substream);
-	mutex_lock(&substream->rmidi->open_mutex);
+	guard(mutex)(&substream->rmidi->open_mutex);
 	if (framing == SNDRV_RAWMIDI_MODE_FRAMING_NONE && clock_type != SNDRV_RAWMIDI_MODE_CLOCK_NONE)
 		err = -EINVAL;
 	else if (clock_type > SNDRV_RAWMIDI_MODE_CLOCK_MONOTONIC_RAW)
@@ -802,7 +777,6 @@ int snd_rawmidi_input_params(struct snd_rawmidi_substream *substream,
 		substream->framing = framing;
 		substream->clock_type = clock_type;
 	}
-	mutex_unlock(&substream->rmidi->open_mutex);
 	return 0;
 }
 EXPORT_SYMBOL(snd_rawmidi_input_params);
@@ -814,9 +788,8 @@ static int snd_rawmidi_output_status(struct snd_rawmidi_substream *substream,
 
 	memset(status, 0, sizeof(*status));
 	status->stream = SNDRV_RAWMIDI_STREAM_OUTPUT;
-	spin_lock_irq(&substream->lock);
+	guard(spinlock_irq)(&substream->lock);
 	status->avail = runtime->avail;
-	spin_unlock_irq(&substream->lock);
 	return 0;
 }
 
@@ -827,11 +800,10 @@ static int snd_rawmidi_input_status(struct snd_rawmidi_substream *substream,
 
 	memset(status, 0, sizeof(*status));
 	status->stream = SNDRV_RAWMIDI_STREAM_INPUT;
-	spin_lock_irq(&substream->lock);
+	guard(spinlock_irq)(&substream->lock);
 	status->avail = runtime->avail;
 	status->xruns = runtime->xruns;
 	runtime->xruns = 0;
-	spin_unlock_irq(&substream->lock);
 	return 0;
 }
 
@@ -1025,7 +997,7 @@ static int snd_rawmidi_next_device(struct snd_card *card, int __user *argp,
 		return -EFAULT;
 	if (device >= SNDRV_RAWMIDI_DEVICES) /* next device is -1 */
 		device = SNDRV_RAWMIDI_DEVICES - 1;
-	mutex_lock(&register_mutex);
+	guard(mutex)(&register_mutex);
 	device = device < 0 ? 0 : device + 1;
 	for (; device < SNDRV_RAWMIDI_DEVICES; device++) {
 		rmidi = snd_rawmidi_search(card, device);
@@ -1037,7 +1009,6 @@ static int snd_rawmidi_next_device(struct snd_card *card, int __user *argp,
 	}
 	if (device == SNDRV_RAWMIDI_DEVICES)
 		device = -1;
-	mutex_unlock(&register_mutex);
 	if (put_user(device, argp))
 		return -EFAULT;
 	return 0;
@@ -1050,18 +1021,16 @@ static int snd_rawmidi_call_ump_ioctl(struct snd_card *card, int cmd,
 {
 	struct snd_ump_endpoint_info __user *info = argp;
 	struct snd_rawmidi *rmidi;
-	int device, ret;
+	int device;
 
 	if (get_user(device, &info->device))
 		return -EFAULT;
-	mutex_lock(&register_mutex);
+	guard(mutex)(&register_mutex);
 	rmidi = snd_rawmidi_search(card, device);
 	if (rmidi && rmidi->ops && rmidi->ops->ioctl)
-		ret = rmidi->ops->ioctl(rmidi, cmd, argp);
+		return rmidi->ops->ioctl(rmidi, cmd, argp);
 	else
-		ret = -ENXIO;
-	mutex_unlock(&register_mutex);
-	return ret;
+		return -ENXIO;
 }
 #endif
 
@@ -1168,27 +1137,23 @@ static struct timespec64 get_framing_tstamp(struct snd_rawmidi_substream *substr
 int snd_rawmidi_receive(struct snd_rawmidi_substream *substream,
 			const unsigned char *buffer, int count)
 {
-	unsigned long flags;
 	struct timespec64 ts64 = get_framing_tstamp(substream);
 	int result = 0, count1;
 	struct snd_rawmidi_runtime *runtime;
 
-	spin_lock_irqsave(&substream->lock, flags);
-	if (!substream->opened) {
-		result = -EBADFD;
-		goto unlock;
-	}
+	guard(spinlock_irqsave)(&substream->lock);
+	if (!substream->opened)
+		return -EBADFD;
 	runtime = substream->runtime;
 	if (!runtime || !runtime->buffer) {
 		rmidi_dbg(substream->rmidi,
 			  "snd_rawmidi_receive: input is not active!!!\n");
-		result = -EINVAL;
-		goto unlock;
+		return -EINVAL;
 	}
 
 	count = get_aligned_size(runtime, count);
 	if (!count)
-		goto unlock;
+		return result;
 
 	if (substream->framing == SNDRV_RAWMIDI_MODE_FRAMING_TSTAMP) {
 		result = receive_with_tstamp_framing(substream, buffer, count, &ts64);
@@ -1211,7 +1176,7 @@ int snd_rawmidi_receive(struct snd_rawmidi_substream *substream,
 			count1 = runtime->buffer_size - runtime->avail;
 		count1 = get_aligned_size(runtime, count1);
 		if (!count1)
-			goto unlock;
+			return result;
 		memcpy(runtime->buffer + runtime->hw_ptr, buffer, count1);
 		runtime->hw_ptr += count1;
 		runtime->hw_ptr %= runtime->buffer_size;
@@ -1239,8 +1204,6 @@ int snd_rawmidi_receive(struct snd_rawmidi_substream *substream,
 		else if (__snd_rawmidi_ready(runtime))
 			wake_up(&runtime->sleep);
 	}
- unlock:
-	spin_unlock_irqrestore(&substream->lock, flags);
 	return result;
 }
 EXPORT_SYMBOL(snd_rawmidi_receive);
@@ -1362,20 +1325,15 @@ static ssize_t snd_rawmidi_read(struct file *file, char __user *buf, size_t coun
 int snd_rawmidi_transmit_empty(struct snd_rawmidi_substream *substream)
 {
 	struct snd_rawmidi_runtime *runtime;
-	int result;
-	unsigned long flags;
 
-	spin_lock_irqsave(&substream->lock, flags);
+	guard(spinlock_irqsave)(&substream->lock);
 	runtime = substream->runtime;
 	if (!substream->opened || !runtime || !runtime->buffer) {
 		rmidi_dbg(substream->rmidi,
 			  "snd_rawmidi_transmit_empty: output is not active!!!\n");
-		result = 1;
-	} else {
-		result = runtime->avail >= runtime->buffer_size;
+		return 1;
 	}
-	spin_unlock_irqrestore(&substream->lock, flags);
-	return result;
+	return (runtime->avail >= runtime->buffer_size);
 }
 EXPORT_SYMBOL(snd_rawmidi_transmit_empty);
 
@@ -1449,16 +1407,10 @@ static int __snd_rawmidi_transmit_peek(struct snd_rawmidi_substream *substream,
 int snd_rawmidi_transmit_peek(struct snd_rawmidi_substream *substream,
 			      unsigned char *buffer, int count)
 {
-	int result;
-	unsigned long flags;
-
-	spin_lock_irqsave(&substream->lock, flags);
+	guard(spinlock_irqsave)(&substream->lock);
 	if (!substream->opened || !substream->runtime)
-		result = -EBADFD;
-	else
-		result = __snd_rawmidi_transmit_peek(substream, buffer, count);
-	spin_unlock_irqrestore(&substream->lock, flags);
-	return result;
+		return -EBADFD;
+	return __snd_rawmidi_transmit_peek(substream, buffer, count);
 }
 EXPORT_SYMBOL(snd_rawmidi_transmit_peek);
 
@@ -1505,16 +1457,10 @@ static int __snd_rawmidi_transmit_ack(struct snd_rawmidi_substream *substream,
  */
 int snd_rawmidi_transmit_ack(struct snd_rawmidi_substream *substream, int count)
 {
-	int result;
-	unsigned long flags;
-
-	spin_lock_irqsave(&substream->lock, flags);
+	guard(spinlock_irqsave)(&substream->lock);
 	if (!substream->opened || !substream->runtime)
-		result = -EBADFD;
-	else
-		result = __snd_rawmidi_transmit_ack(substream, count);
-	spin_unlock_irqrestore(&substream->lock, flags);
-	return result;
+		return -EBADFD;
+	return __snd_rawmidi_transmit_ack(substream, count);
 }
 EXPORT_SYMBOL(snd_rawmidi_transmit_ack);
 
@@ -1531,21 +1477,13 @@ EXPORT_SYMBOL(snd_rawmidi_transmit_ack);
 int snd_rawmidi_transmit(struct snd_rawmidi_substream *substream,
 			 unsigned char *buffer, int count)
 {
-	int result;
-	unsigned long flags;
-
-	spin_lock_irqsave(&substream->lock, flags);
+	guard(spinlock_irqsave)(&substream->lock);
 	if (!substream->opened)
-		result = -EBADFD;
-	else {
-		count = __snd_rawmidi_transmit_peek(substream, buffer, count);
-		if (count <= 0)
-			result = count;
-		else
-			result = __snd_rawmidi_transmit_ack(substream, count);
-	}
-	spin_unlock_irqrestore(&substream->lock, flags);
-	return result;
+		return -EBADFD;
+	count = __snd_rawmidi_transmit_peek(substream, buffer, count);
+	if (count <= 0)
+		return count;
+	return __snd_rawmidi_transmit_ack(substream, count);
 }
 EXPORT_SYMBOL(snd_rawmidi_transmit);
 
@@ -1558,17 +1496,15 @@ EXPORT_SYMBOL(snd_rawmidi_transmit);
 int snd_rawmidi_proceed(struct snd_rawmidi_substream *substream)
 {
 	struct snd_rawmidi_runtime *runtime;
-	unsigned long flags;
 	int count = 0;
 
-	spin_lock_irqsave(&substream->lock, flags);
+	guard(spinlock_irqsave)(&substream->lock);
 	runtime = substream->runtime;
 	if (substream->opened && runtime &&
 	    runtime->avail < runtime->buffer_size) {
 		count = runtime->buffer_size - runtime->avail;
 		__snd_rawmidi_transmit_ack(substream, count);
 	}
-	spin_unlock_irqrestore(&substream->lock, flags);
 	return count;
 }
 EXPORT_SYMBOL(snd_rawmidi_proceed);
@@ -1772,7 +1708,7 @@ static void snd_rawmidi_proc_info_read(struct snd_info_entry *entry,
 			    rawmidi_is_ump(rmidi) ? "UMP" : "Legacy");
 	if (rmidi->ops && rmidi->ops->proc_read)
 		rmidi->ops->proc_read(entry, buffer);
-	mutex_lock(&rmidi->open_mutex);
+	guard(mutex)(&rmidi->open_mutex);
 	if (rmidi->info_flags & SNDRV_RAWMIDI_INFO_OUTPUT) {
 		list_for_each_entry(substream,
 				    &rmidi->streams[SNDRV_RAWMIDI_STREAM_OUTPUT].substreams,
@@ -1787,10 +1723,10 @@ static void snd_rawmidi_proc_info_read(struct snd_info_entry *entry,
 				    "  Owner PID    : %d\n",
 				    pid_vnr(substream->pid));
 				runtime = substream->runtime;
-				spin_lock_irq(&substream->lock);
-				buffer_size = runtime->buffer_size;
-				avail = runtime->avail;
-				spin_unlock_irq(&substream->lock);
+				scoped_guard(spinlock_irq, &substream->lock) {
+					buffer_size = runtime->buffer_size;
+					avail = runtime->avail;
+				}
 				snd_iprintf(buffer,
 				    "  Mode         : %s\n"
 				    "  Buffer size  : %lu\n"
@@ -1814,11 +1750,11 @@ static void snd_rawmidi_proc_info_read(struct snd_info_entry *entry,
 					    "  Owner PID    : %d\n",
 					    pid_vnr(substream->pid));
 				runtime = substream->runtime;
-				spin_lock_irq(&substream->lock);
-				buffer_size = runtime->buffer_size;
-				avail = runtime->avail;
-				xruns = runtime->xruns;
-				spin_unlock_irq(&substream->lock);
+				scoped_guard(spinlock_irq, &substream->lock) {
+					buffer_size = runtime->buffer_size;
+					avail = runtime->avail;
+					xruns = runtime->xruns;
+				}
 				snd_iprintf(buffer,
 					    "  Buffer size  : %lu\n"
 					    "  Avail        : %lu\n"
@@ -1835,7 +1771,6 @@ static void snd_rawmidi_proc_info_read(struct snd_info_entry *entry,
 			}
 		}
 	}
-	mutex_unlock(&rmidi->open_mutex);
 }
 
 /*
@@ -2024,12 +1959,12 @@ static int snd_rawmidi_dev_register(struct snd_device *device)
 	if (rmidi->device >= SNDRV_RAWMIDI_DEVICES)
 		return -ENOMEM;
 	err = 0;
-	mutex_lock(&register_mutex);
-	if (snd_rawmidi_search(rmidi->card, rmidi->device))
-		err = -EBUSY;
-	else
-		list_add_tail(&rmidi->list, &snd_rawmidi_devices);
-	mutex_unlock(&register_mutex);
+	scoped_guard(mutex, &register_mutex) {
+		if (snd_rawmidi_search(rmidi->card, rmidi->device))
+			err = -EBUSY;
+		else
+			list_add_tail(&rmidi->list, &snd_rawmidi_devices);
+	}
 	if (err < 0)
 		return err;
 
@@ -2102,9 +2037,8 @@ static int snd_rawmidi_dev_register(struct snd_device *device)
  error_unregister:
 	snd_unregister_device(rmidi->dev);
  error:
-	mutex_lock(&register_mutex);
-	list_del(&rmidi->list);
-	mutex_unlock(&register_mutex);
+	scoped_guard(mutex, &register_mutex)
+		list_del(&rmidi->list);
 	return err;
 }
 
@@ -2113,8 +2047,8 @@ static int snd_rawmidi_dev_disconnect(struct snd_device *device)
 	struct snd_rawmidi *rmidi = device->device_data;
 	int dir;
 
-	mutex_lock(&register_mutex);
-	mutex_lock(&rmidi->open_mutex);
+	guard(mutex)(&register_mutex);
+	guard(mutex)(&rmidi->open_mutex);
 	wake_up(&rmidi->open_wait);
 	list_del_init(&rmidi->list);
 	for (dir = 0; dir < 2; dir++) {
@@ -2140,8 +2074,6 @@ static int snd_rawmidi_dev_disconnect(struct snd_device *device)
 	}
 #endif /* CONFIG_SND_OSSEMUL */
 	snd_unregister_device(rmidi->dev);
-	mutex_unlock(&rmidi->open_mutex);
-	mutex_unlock(&register_mutex);
 	return 0;
 }
 
-- 
2.35.3

