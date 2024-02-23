Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8410A85292
	for <linux-sound@vger.kernel.org>; Fri, 23 Feb 2024 16:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708705708; cv=none; b=hajDcXFpERIBnYAEKAQJr52wYZHh3/1f/3XfQuUeJ7dY1RXLstRoS595Qdlyf2MRCJUNdiQFET+odREwK/DwcKRHmcnfaAal8RVOJw8W2QPR7mfUB3FRc2dDBjS2B5ssrdWbYLjS8QwwF/s83cHQioduiykKzkx5a1HiQmGMrHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708705708; c=relaxed/simple;
	bh=EpPEjBmkoeR5a/LNNWahYDUPu1vDl7SZR73hKXpiqf4=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BwbTJw6f6+UnkU0AbDdvnKuHKndVqEP9DaydyYBP5BbHTB000zqogEhwQNublqBOMcaUo1qgLiqorKS2+h/LPnNGrnAc/9Ccm8xKF+sODIbd9vhl+zs8ULAstsWkaQcqjIhnED7o9ccY7h0l+VjtSPHmVAErNa0C1Qce0Qsee0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vOp3YsK/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WrIG6Rix; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vOp3YsK/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WrIG6Rix; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vOp3YsK/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WrIG6Rix";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vOp3YsK/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WrIG6Rix"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 84A3B1FD49;
	Fri, 23 Feb 2024 16:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708705701; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oM0M1pd2b46NDgAwXgLPMP1sayrB/6gPKN6yfWMxPS4=;
	b=vOp3YsK/CETWXaKx512i6MUhXAq4CcMLSB86LGzma4cx1KvBplnl0L2/UkgmhZp+JWLHoO
	Ip5GtIs71XncscUlg/cMToYHcbyqs0/NWQKFuIB3T4Mpyo2boIQjNO+aXoKlVpGRd2uMVK
	xnOtKYKzmyTWoj2vgLBsMuto0mpYKro=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708705701;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oM0M1pd2b46NDgAwXgLPMP1sayrB/6gPKN6yfWMxPS4=;
	b=WrIG6RixRJRLk+ddqa9wuoY3zpXNO+z4GTOg2jwRpWV3uZlN7tYnHGFSnhBWj9ce2NYvCg
	KMsa2nUmHPa4rTDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708705701; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oM0M1pd2b46NDgAwXgLPMP1sayrB/6gPKN6yfWMxPS4=;
	b=vOp3YsK/CETWXaKx512i6MUhXAq4CcMLSB86LGzma4cx1KvBplnl0L2/UkgmhZp+JWLHoO
	Ip5GtIs71XncscUlg/cMToYHcbyqs0/NWQKFuIB3T4Mpyo2boIQjNO+aXoKlVpGRd2uMVK
	xnOtKYKzmyTWoj2vgLBsMuto0mpYKro=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708705701;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oM0M1pd2b46NDgAwXgLPMP1sayrB/6gPKN6yfWMxPS4=;
	b=WrIG6RixRJRLk+ddqa9wuoY3zpXNO+z4GTOg2jwRpWV3uZlN7tYnHGFSnhBWj9ce2NYvCg
	KMsa2nUmHPa4rTDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6560D13AC7;
	Fri, 23 Feb 2024 16:28:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CAVoF6XH2GWaMQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 Feb 2024 16:28:21 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 21/24] ALSA: pcm: Use guard() for locking
Date: Fri, 23 Feb 2024 17:28:07 +0100
Message-Id: <20240223162810.32302-22-tiwai@suse.de>
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
Authentication-Results: smtp-out2.suse.de;
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
 sound/core/pcm.c        | 90 ++++++++++++++---------------------------
 sound/core/pcm_memory.c | 30 ++++++--------
 sound/core/pcm_native.c | 48 ++++++++--------------
 3 files changed, 59 insertions(+), 109 deletions(-)

diff --git a/sound/core/pcm.c b/sound/core/pcm.c
index 87d27fbdfe5c..dc37f3508dc7 100644
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -91,9 +91,8 @@ static int snd_pcm_control_ioctl(struct snd_card *card,
 
 			if (get_user(device, (int __user *)arg))
 				return -EFAULT;
-			mutex_lock(&register_mutex);
-			device = snd_pcm_next(card, device);
-			mutex_unlock(&register_mutex);
+			scoped_guard(mutex, &register_mutex)
+				device = snd_pcm_next(card, device);
 			if (put_user(device, (int __user *)arg))
 				return -EFAULT;
 			return 0;
@@ -106,7 +105,6 @@ static int snd_pcm_control_ioctl(struct snd_card *card,
 			struct snd_pcm *pcm;
 			struct snd_pcm_str *pstr;
 			struct snd_pcm_substream *substream;
-			int err;
 
 			info = (struct snd_pcm_info __user *)arg;
 			if (get_user(device, &info->device))
@@ -118,35 +116,23 @@ static int snd_pcm_control_ioctl(struct snd_card *card,
 			stream = array_index_nospec(stream, 2);
 			if (get_user(subdevice, &info->subdevice))
 				return -EFAULT;
-			mutex_lock(&register_mutex);
+			guard(mutex)(&register_mutex);
 			pcm = snd_pcm_get(card, device);
-			if (pcm == NULL) {
-				err = -ENXIO;
-				goto _error;
-			}
+			if (pcm == NULL)
+				return -ENXIO;
 			pstr = &pcm->streams[stream];
-			if (pstr->substream_count == 0) {
-				err = -ENOENT;
-				goto _error;
-			}
-			if (subdevice >= pstr->substream_count) {
-				err = -ENXIO;
-				goto _error;
-			}
+			if (pstr->substream_count == 0)
+				return -ENOENT;
+			if (subdevice >= pstr->substream_count)
+				return -ENXIO;
 			for (substream = pstr->substream; substream;
 			     substream = substream->next)
 				if (substream->number == (int)subdevice)
 					break;
-			if (substream == NULL) {
-				err = -ENXIO;
-				goto _error;
-			}
-			mutex_lock(&pcm->open_mutex);
-			err = snd_pcm_info_user(substream, info);
-			mutex_unlock(&pcm->open_mutex);
-		_error:
-			mutex_unlock(&register_mutex);
-			return err;
+			if (substream == NULL)
+				return -ENXIO;
+			guard(mutex)(&pcm->open_mutex);
+			return snd_pcm_info_user(substream, info);
 		}
 	case SNDRV_CTL_IOCTL_PCM_PREFER_SUBDEVICE:
 		{
@@ -389,15 +375,15 @@ static void snd_pcm_substream_proc_hw_params_read(struct snd_info_entry *entry,
 	struct snd_pcm_substream *substream = entry->private_data;
 	struct snd_pcm_runtime *runtime;
 
-	mutex_lock(&substream->pcm->open_mutex);
+	guard(mutex)(&substream->pcm->open_mutex);
 	runtime = substream->runtime;
 	if (!runtime) {
 		snd_iprintf(buffer, "closed\n");
-		goto unlock;
+		return;
 	}
 	if (runtime->state == SNDRV_PCM_STATE_OPEN) {
 		snd_iprintf(buffer, "no setup\n");
-		goto unlock;
+		return;
 	}
 	snd_iprintf(buffer, "access: %s\n", snd_pcm_access_name(runtime->access));
 	snd_iprintf(buffer, "format: %s\n", snd_pcm_format_name(runtime->format));
@@ -416,8 +402,6 @@ static void snd_pcm_substream_proc_hw_params_read(struct snd_info_entry *entry,
 		snd_iprintf(buffer, "OSS period frames: %lu\n", (unsigned long)runtime->oss.period_frames);
 	}
 #endif
- unlock:
-	mutex_unlock(&substream->pcm->open_mutex);
 }
 
 static void snd_pcm_substream_proc_sw_params_read(struct snd_info_entry *entry,
@@ -426,15 +410,15 @@ static void snd_pcm_substream_proc_sw_params_read(struct snd_info_entry *entry,
 	struct snd_pcm_substream *substream = entry->private_data;
 	struct snd_pcm_runtime *runtime;
 
-	mutex_lock(&substream->pcm->open_mutex);
+	guard(mutex)(&substream->pcm->open_mutex);
 	runtime = substream->runtime;
 	if (!runtime) {
 		snd_iprintf(buffer, "closed\n");
-		goto unlock;
+		return;
 	}
 	if (runtime->state == SNDRV_PCM_STATE_OPEN) {
 		snd_iprintf(buffer, "no setup\n");
-		goto unlock;
+		return;
 	}
 	snd_iprintf(buffer, "tstamp_mode: %s\n", snd_pcm_tstamp_mode_name(runtime->tstamp_mode));
 	snd_iprintf(buffer, "period_step: %u\n", runtime->period_step);
@@ -444,8 +428,6 @@ static void snd_pcm_substream_proc_sw_params_read(struct snd_info_entry *entry,
 	snd_iprintf(buffer, "silence_threshold: %lu\n", runtime->silence_threshold);
 	snd_iprintf(buffer, "silence_size: %lu\n", runtime->silence_size);
 	snd_iprintf(buffer, "boundary: %lu\n", runtime->boundary);
- unlock:
-	mutex_unlock(&substream->pcm->open_mutex);
 }
 
 static void snd_pcm_substream_proc_status_read(struct snd_info_entry *entry,
@@ -456,17 +438,17 @@ static void snd_pcm_substream_proc_status_read(struct snd_info_entry *entry,
 	struct snd_pcm_status64 status;
 	int err;
 
-	mutex_lock(&substream->pcm->open_mutex);
+	guard(mutex)(&substream->pcm->open_mutex);
 	runtime = substream->runtime;
 	if (!runtime) {
 		snd_iprintf(buffer, "closed\n");
-		goto unlock;
+		return;
 	}
 	memset(&status, 0, sizeof(status));
 	err = snd_pcm_status64(substream, &status);
 	if (err < 0) {
 		snd_iprintf(buffer, "error %d\n", err);
-		goto unlock;
+		return;
 	}
 	snd_iprintf(buffer, "state: %s\n", snd_pcm_state_name(status.state));
 	snd_iprintf(buffer, "owner_pid   : %d\n", pid_vnr(substream->pid));
@@ -480,8 +462,6 @@ static void snd_pcm_substream_proc_status_read(struct snd_info_entry *entry,
 	snd_iprintf(buffer, "-----\n");
 	snd_iprintf(buffer, "hw_ptr      : %ld\n", runtime->status->hw_ptr);
 	snd_iprintf(buffer, "appl_ptr    : %ld\n", runtime->control->appl_ptr);
- unlock:
-	mutex_unlock(&substream->pcm->open_mutex);
 }
 
 #ifdef CONFIG_SND_PCM_XRUN_DEBUG
@@ -1009,9 +989,8 @@ void snd_pcm_detach_substream(struct snd_pcm_substream *substream)
 	kfree(runtime->hw_constraints.rules);
 	/* Avoid concurrent access to runtime via PCM timer interface */
 	if (substream->timer) {
-		spin_lock_irq(&substream->timer->lock);
-		substream->runtime = NULL;
-		spin_unlock_irq(&substream->timer->lock);
+		scoped_guard(spinlock_irq, &substream->timer->lock)
+			substream->runtime = NULL;
 	} else {
 		substream->runtime = NULL;
 	}
@@ -1068,10 +1047,10 @@ static int snd_pcm_dev_register(struct snd_device *device)
 		return -ENXIO;
 	pcm = device->device_data;
 
-	mutex_lock(&register_mutex);
+	guard(mutex)(&register_mutex);
 	err = snd_pcm_add(pcm);
 	if (err)
-		goto unlock;
+		return err;
 	for (cidx = 0; cidx < 2; cidx++) {
 		int devtype = -1;
 		if (pcm->streams[cidx].substream == NULL)
@@ -1090,7 +1069,7 @@ static int snd_pcm_dev_register(struct snd_device *device)
 					  pcm->streams[cidx].dev);
 		if (err < 0) {
 			list_del_init(&pcm->list);
-			goto unlock;
+			return err;
 		}
 
 		for (substream = pcm->streams[cidx].substream; substream; substream = substream->next)
@@ -1098,9 +1077,6 @@ static int snd_pcm_dev_register(struct snd_device *device)
 	}
 
 	pcm_call_notify(pcm, n_register);
-
- unlock:
-	mutex_unlock(&register_mutex);
 	return err;
 }
 
@@ -1110,8 +1086,8 @@ static int snd_pcm_dev_disconnect(struct snd_device *device)
 	struct snd_pcm_substream *substream;
 	int cidx;
 
-	mutex_lock(&register_mutex);
-	mutex_lock(&pcm->open_mutex);
+	guard(mutex)(&register_mutex);
+	guard(mutex)(&pcm->open_mutex);
 	wake_up(&pcm->open_wait);
 	list_del_init(&pcm->list);
 
@@ -1138,8 +1114,6 @@ static int snd_pcm_dev_disconnect(struct snd_device *device)
 			snd_unregister_device(pcm->streams[cidx].dev);
 		free_chmap(&pcm->streams[cidx]);
 	}
-	mutex_unlock(&pcm->open_mutex);
-	mutex_unlock(&register_mutex);
 	return 0;
 }
 
@@ -1164,7 +1138,7 @@ int snd_pcm_notify(struct snd_pcm_notify *notify, int nfree)
 		       !notify->n_unregister ||
 		       !notify->n_disconnect))
 		return -EINVAL;
-	mutex_lock(&register_mutex);
+	guard(mutex)(&register_mutex);
 	if (nfree) {
 		list_del(&notify->list);
 		list_for_each_entry(pcm, &snd_pcm_devices, list)
@@ -1174,7 +1148,6 @@ int snd_pcm_notify(struct snd_pcm_notify *notify, int nfree)
 		list_for_each_entry(pcm, &snd_pcm_devices, list)
 			notify->n_register(pcm);
 	}
-	mutex_unlock(&register_mutex);
 	return 0;
 }
 EXPORT_SYMBOL(snd_pcm_notify);
@@ -1190,7 +1163,7 @@ static void snd_pcm_proc_read(struct snd_info_entry *entry,
 {
 	struct snd_pcm *pcm;
 
-	mutex_lock(&register_mutex);
+	guard(mutex)(&register_mutex);
 	list_for_each_entry(pcm, &snd_pcm_devices, list) {
 		snd_iprintf(buffer, "%02i-%02i: %s : %s",
 			    pcm->card->number, pcm->device, pcm->id, pcm->name);
@@ -1202,7 +1175,6 @@ static void snd_pcm_proc_read(struct snd_info_entry *entry,
 				    pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream_count);
 		snd_iprintf(buffer, "\n");
 	}
-	mutex_unlock(&register_mutex);
 }
 
 static struct snd_info_entry *snd_pcm_proc_entry;
diff --git a/sound/core/pcm_memory.c b/sound/core/pcm_memory.c
index a0b951471699..506386959f08 100644
--- a/sound/core/pcm_memory.c
+++ b/sound/core/pcm_memory.c
@@ -38,17 +38,15 @@ static void __update_allocated_size(struct snd_card *card, ssize_t bytes)
 
 static void update_allocated_size(struct snd_card *card, ssize_t bytes)
 {
-	mutex_lock(&card->memory_mutex);
+	guard(mutex)(&card->memory_mutex);
 	__update_allocated_size(card, bytes);
-	mutex_unlock(&card->memory_mutex);
 }
 
 static void decrease_allocated_size(struct snd_card *card, size_t bytes)
 {
-	mutex_lock(&card->memory_mutex);
+	guard(mutex)(&card->memory_mutex);
 	WARN_ON(card->total_pcm_alloc_bytes < bytes);
 	__update_allocated_size(card, -(ssize_t)bytes);
-	mutex_unlock(&card->memory_mutex);
 }
 
 static int do_alloc_pages(struct snd_card *card, int type, struct device *dev,
@@ -58,14 +56,12 @@ static int do_alloc_pages(struct snd_card *card, int type, struct device *dev,
 	int err;
 
 	/* check and reserve the requested size */
-	mutex_lock(&card->memory_mutex);
-	if (max_alloc_per_card &&
-	    card->total_pcm_alloc_bytes + size > max_alloc_per_card) {
-		mutex_unlock(&card->memory_mutex);
-		return -ENOMEM;
+	scoped_guard(mutex, &card->memory_mutex) {
+		if (max_alloc_per_card &&
+		    card->total_pcm_alloc_bytes + size > max_alloc_per_card)
+			return -ENOMEM;
+		__update_allocated_size(card, size);
 	}
-	__update_allocated_size(card, size);
-	mutex_unlock(&card->memory_mutex);
 
 	if (str == SNDRV_PCM_STREAM_PLAYBACK)
 		dir = DMA_TO_DEVICE;
@@ -191,20 +187,20 @@ static void snd_pcm_lib_preallocate_proc_write(struct snd_info_entry *entry,
 	size_t size;
 	struct snd_dma_buffer new_dmab;
 
-	mutex_lock(&substream->pcm->open_mutex);
+	guard(mutex)(&substream->pcm->open_mutex);
 	if (substream->runtime) {
 		buffer->error = -EBUSY;
-		goto unlock;
+		return;
 	}
 	if (!snd_info_get_line(buffer, line, sizeof(line))) {
 		snd_info_get_str(str, line, sizeof(str));
 		size = simple_strtoul(str, NULL, 10) * 1024;
 		if ((size != 0 && size < 8192) || size > substream->dma_max) {
 			buffer->error = -EINVAL;
-			goto unlock;
+			return;
 		}
 		if (substream->dma_buffer.bytes == size)
-			goto unlock;
+			return;
 		memset(&new_dmab, 0, sizeof(new_dmab));
 		new_dmab.dev = substream->dma_buffer.dev;
 		if (size > 0) {
@@ -218,7 +214,7 @@ static void snd_pcm_lib_preallocate_proc_write(struct snd_info_entry *entry,
 					 substream->pcm->card->number, substream->pcm->device,
 					 substream->stream ? 'c' : 'p', substream->number,
 					 substream->pcm->name, size);
-				goto unlock;
+				return;
 			}
 			substream->buffer_bytes_max = size;
 		} else {
@@ -230,8 +226,6 @@ static void snd_pcm_lib_preallocate_proc_write(struct snd_info_entry *entry,
 	} else {
 		buffer->error = -EINVAL;
 	}
- unlock:
-	mutex_unlock(&substream->pcm->open_mutex);
 }
 
 static inline void preallocate_info_init(struct snd_pcm_substream *substream)
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 0e84de4b484d..f2a0cbb25bb7 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -1398,17 +1398,15 @@ static int snd_pcm_action_nonatomic(const struct action_ops *ops,
 	int res;
 
 	/* Guarantee the group members won't change during non-atomic action */
-	down_read(&snd_pcm_link_rwsem);
+	guard(rwsem_read)(&snd_pcm_link_rwsem);
 	res = snd_pcm_buffer_access_lock(substream->runtime);
 	if (res < 0)
-		goto unlock;
+		return res;
 	if (snd_pcm_stream_linked(substream))
 		res = snd_pcm_action_group(ops, substream, state, false);
 	else
 		res = snd_pcm_action_single(ops, substream, state);
 	snd_pcm_buffer_access_unlock(substream->runtime);
- unlock:
-	up_read(&snd_pcm_link_rwsem);
 	return res;
 }
 
@@ -2259,7 +2257,6 @@ static bool is_pcm_file(struct file *file)
  */
 static int snd_pcm_link(struct snd_pcm_substream *substream, int fd)
 {
-	int res = 0;
 	struct snd_pcm_file *pcm_file;
 	struct snd_pcm_substream *substream1;
 	struct snd_pcm_group *group __free(kfree) = NULL;
@@ -2281,20 +2278,15 @@ static int snd_pcm_link(struct snd_pcm_substream *substream, int fd)
 	group = kzalloc(sizeof(*group), GFP_KERNEL);
 	if (!group)
 		return -ENOMEM;
-
 	snd_pcm_group_init(group);
 
-	down_write(&snd_pcm_link_rwsem);
+	guard(rwsem_write)(&snd_pcm_link_rwsem);
 	if (substream->runtime->state == SNDRV_PCM_STATE_OPEN ||
 	    substream->runtime->state != substream1->runtime->state ||
-	    substream->pcm->nonatomic != substream1->pcm->nonatomic) {
-		res = -EBADFD;
-		goto _end;
-	}
-	if (snd_pcm_stream_linked(substream1)) {
-		res = -EALREADY;
-		goto _end;
-	}
+	    substream->pcm->nonatomic != substream1->pcm->nonatomic)
+		return -EBADFD;
+	if (snd_pcm_stream_linked(substream1))
+		return -EALREADY;
 
 	snd_pcm_stream_lock_irq(substream);
 	if (!snd_pcm_stream_linked(substream)) {
@@ -2310,9 +2302,7 @@ static int snd_pcm_link(struct snd_pcm_substream *substream, int fd)
 	refcount_inc(&target_group->refs);
 	snd_pcm_stream_unlock(substream1);
 	snd_pcm_group_unlock_irq(target_group, nonatomic);
- _end:
-	up_write(&snd_pcm_link_rwsem);
-	return res;
+	return 0;
 }
 
 static void relink_to_local(struct snd_pcm_substream *substream)
@@ -2327,14 +2317,11 @@ static int snd_pcm_unlink(struct snd_pcm_substream *substream)
 	struct snd_pcm_group *group;
 	bool nonatomic = substream->pcm->nonatomic;
 	bool do_free = false;
-	int res = 0;
 
-	down_write(&snd_pcm_link_rwsem);
+	guard(rwsem_write)(&snd_pcm_link_rwsem);
 
-	if (!snd_pcm_stream_linked(substream)) {
-		res = -EALREADY;
-		goto _end;
-	}
+	if (!snd_pcm_stream_linked(substream))
+		return -EALREADY;
 
 	group = substream->group;
 	snd_pcm_group_lock_irq(group, nonatomic);
@@ -2353,10 +2340,7 @@ static int snd_pcm_unlink(struct snd_pcm_substream *substream)
 	snd_pcm_group_unlock_irq(group, nonatomic);
 	if (do_free)
 		kfree(group);
-
-       _end:
-	up_write(&snd_pcm_link_rwsem);
-	return res;
+	return 0;
 }
 
 /*
@@ -2929,10 +2913,10 @@ static int snd_pcm_release(struct inode *inode, struct file *file)
 	/* block until the device gets woken up as it may touch the hardware */
 	snd_power_wait(pcm->card);
 
-	mutex_lock(&pcm->open_mutex);
-	snd_pcm_release_substream(substream);
-	kfree(pcm_file);
-	mutex_unlock(&pcm->open_mutex);
+	scoped_guard(mutex, &pcm->open_mutex) {
+		snd_pcm_release_substream(substream);
+		kfree(pcm_file);
+	}
 	wake_up(&pcm->open_wait);
 	module_put(pcm->card->module);
 	snd_card_file_remove(pcm->card, file);
-- 
2.35.3

