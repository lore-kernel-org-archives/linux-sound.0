Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E6912F59A
	for <linux-sound@vger.kernel.org>; Tue, 27 Feb 2024 08:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709023998; cv=none; b=aXAoQtPVMv4B8DYHycWUhf4WQdmVKoeWShEyqivK/7r6mAH3nR5P/M13m9N90OBD6EjA9MjfZukkfRoH4Rrzsmia5hdA0Yo2HeGBT4HYjaGzZBI3CRVBdVxdRUM8DlpCYvpkSWvx62343LwKHBdBTxIhySmBBuliE/h/kpoX5do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709023998; c=relaxed/simple;
	bh=ZPn/tdTSSf3n7eWk71txnBH81CTMnbn0RRGNmOiSVrI=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CJsn/QS4UH/n5/TN4Ce1ObYWZe1JpB9Pqx56ZNFjNdLrDBkxbj3UsHPc/lXi1uUzArorD1OUBd/EnSky9jhC6vTea0Pw/cN77LH9bRG8cc58hh0bWy50380xNa6/sW5D73C+jlzmyyCGiw/Rz/d8XiB+4sriqz21d0mYZ4DwOOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DYnkfI7W; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MGzaOmHV; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DYnkfI7W; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MGzaOmHV; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DYnkfI7W";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MGzaOmHV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DYnkfI7W";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MGzaOmHV"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7753C1FB98;
	Tue, 27 Feb 2024 08:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709023994; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IBYrlR5ZTiVA7fYXgeeV57T0h5Gzcl7nGe6eR/5tz4Y=;
	b=DYnkfI7WXMJ3Xg/Z0VfYTx2XnIEhfqhY8fwuyTY2DhMB0JFlFPp3FjmQ8W2UmJ3JtVvJgO
	mrxSs4m5leu5a/PJOmXRQCz6Q16s+oAShoBfzuJnQpFlsVLyfaUFLDf+qM/qb0SIDAi3fF
	e4jf3okT6A2DrE656fcgGbeTzumWqw8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709023994;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IBYrlR5ZTiVA7fYXgeeV57T0h5Gzcl7nGe6eR/5tz4Y=;
	b=MGzaOmHVEm+PLmpstZgaxEls8uYmU2z8i/VNRmzwGifOA5j8XXx4deB5Rpyv6GzhurOWZQ
	RRFOZcXWpx/HZABg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709023994; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IBYrlR5ZTiVA7fYXgeeV57T0h5Gzcl7nGe6eR/5tz4Y=;
	b=DYnkfI7WXMJ3Xg/Z0VfYTx2XnIEhfqhY8fwuyTY2DhMB0JFlFPp3FjmQ8W2UmJ3JtVvJgO
	mrxSs4m5leu5a/PJOmXRQCz6Q16s+oAShoBfzuJnQpFlsVLyfaUFLDf+qM/qb0SIDAi3fF
	e4jf3okT6A2DrE656fcgGbeTzumWqw8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709023994;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IBYrlR5ZTiVA7fYXgeeV57T0h5Gzcl7nGe6eR/5tz4Y=;
	b=MGzaOmHVEm+PLmpstZgaxEls8uYmU2z8i/VNRmzwGifOA5j8XXx4deB5Rpyv6GzhurOWZQ
	RRFOZcXWpx/HZABg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5BA9013AD8;
	Tue, 27 Feb 2024 08:53:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IMI/Ffqi3WWeaQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 27 Feb 2024 08:53:14 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v3 02/24] ALSA: compress_offload: Use guard() for locking
Date: Tue, 27 Feb 2024 09:52:44 +0100
Message-Id: <20240227085306.9764-3-tiwai@suse.de>
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
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=DYnkfI7W;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=MGzaOmHV
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
X-Rspamd-Queue-Id: 7753C1FB98
X-Spam-Level: *
X-Spam-Flag: NO
X-Spamd-Bar: +

We can simplify the code gracefully with new guard() macro and co for
automatic cleanup of locks.

The explicit mutex_lock/unlock are still seen only in
snd_compress_wait_for_drain() which does temporary unlock/relocking.

Only the code refactoring, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/compress_offload.c | 98 ++++++++++++-----------------------
 1 file changed, 33 insertions(+), 65 deletions(-)

diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index 5d926c5b737d..f0008fa2d839 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -127,9 +127,8 @@ static int snd_compr_open(struct inode *inode, struct file *f)
 	init_waitqueue_head(&runtime->sleep);
 	data->stream.runtime = runtime;
 	f->private_data = (void *)data;
-	mutex_lock(&compr->lock);
-	ret = compr->ops->open(&data->stream);
-	mutex_unlock(&compr->lock);
+	scoped_guard(mutex, &compr->lock)
+		ret = compr->ops->open(&data->stream);
 	if (ret) {
 		kfree(runtime);
 		kfree(data);
@@ -288,7 +287,7 @@ static ssize_t snd_compr_write(struct file *f, const char __user *buf,
 		return -EFAULT;
 
 	stream = &data->stream;
-	mutex_lock(&stream->device->lock);
+	guard(mutex)(&stream->device->lock);
 	/* write is allowed when stream is running or has been steup */
 	switch (stream->runtime->state) {
 	case SNDRV_PCM_STATE_SETUP:
@@ -296,7 +295,6 @@ static ssize_t snd_compr_write(struct file *f, const char __user *buf,
 	case SNDRV_PCM_STATE_RUNNING:
 		break;
 	default:
-		mutex_unlock(&stream->device->lock);
 		return -EBADFD;
 	}
 
@@ -322,7 +320,6 @@ static ssize_t snd_compr_write(struct file *f, const char __user *buf,
 		pr_debug("stream prepared, Houston we are good to go\n");
 	}
 
-	mutex_unlock(&stream->device->lock);
 	return retval;
 }
 
@@ -339,7 +336,7 @@ static ssize_t snd_compr_read(struct file *f, char __user *buf,
 		return -EFAULT;
 
 	stream = &data->stream;
-	mutex_lock(&stream->device->lock);
+	guard(mutex)(&stream->device->lock);
 
 	/* read is allowed when stream is running, paused, draining and setup
 	 * (yes setup is state which we transition to after stop, so if user
@@ -350,11 +347,9 @@ static ssize_t snd_compr_read(struct file *f, char __user *buf,
 	case SNDRV_PCM_STATE_PREPARED:
 	case SNDRV_PCM_STATE_SUSPENDED:
 	case SNDRV_PCM_STATE_DISCONNECTED:
-		retval = -EBADFD;
-		goto out;
+		return -EBADFD;
 	case SNDRV_PCM_STATE_XRUN:
-		retval = -EPIPE;
-		goto out;
+		return -EPIPE;
 	}
 
 	avail = snd_compr_get_avail(stream);
@@ -363,17 +358,13 @@ static ssize_t snd_compr_read(struct file *f, char __user *buf,
 	if (avail > count)
 		avail = count;
 
-	if (stream->ops->copy) {
+	if (stream->ops->copy)
 		retval = stream->ops->copy(stream, buf, avail);
-	} else {
-		retval = -ENXIO;
-		goto out;
-	}
+	else
+		return -ENXIO;
 	if (retval > 0)
 		stream->runtime->total_bytes_transferred += retval;
 
-out:
-	mutex_unlock(&stream->device->lock);
 	return retval;
 }
 
@@ -402,13 +393,12 @@ static __poll_t snd_compr_poll(struct file *f, poll_table *wait)
 
 	stream = &data->stream;
 
-	mutex_lock(&stream->device->lock);
+	guard(mutex)(&stream->device->lock);
 
 	switch (stream->runtime->state) {
 	case SNDRV_PCM_STATE_OPEN:
 	case SNDRV_PCM_STATE_XRUN:
-		retval = snd_compr_get_poll(stream) | EPOLLERR;
-		goto out;
+		return snd_compr_get_poll(stream) | EPOLLERR;
 	default:
 		break;
 	}
@@ -433,11 +423,9 @@ static __poll_t snd_compr_poll(struct file *f, poll_table *wait)
 			retval = snd_compr_get_poll(stream);
 		break;
 	default:
-		retval = snd_compr_get_poll(stream) | EPOLLERR;
-		break;
+		return snd_compr_get_poll(stream) | EPOLLERR;
 	}
-out:
-	mutex_unlock(&stream->device->lock);
+
 	return retval;
 }
 
@@ -795,12 +783,10 @@ static void error_delayed_work(struct work_struct *work)
 
 	stream = container_of(work, struct snd_compr_stream, error_work.work);
 
-	mutex_lock(&stream->device->lock);
+	guard(mutex)(&stream->device->lock);
 
 	stream->ops->trigger(stream, SNDRV_PCM_TRIGGER_STOP);
 	wake_up(&stream->runtime->sleep);
-
-	mutex_unlock(&stream->device->lock);
 }
 
 /**
@@ -957,70 +943,52 @@ static long snd_compr_ioctl(struct file *f, unsigned int cmd, unsigned long arg)
 {
 	struct snd_compr_file *data = f->private_data;
 	struct snd_compr_stream *stream;
-	int retval = -ENOTTY;
 
 	if (snd_BUG_ON(!data))
 		return -EFAULT;
 
 	stream = &data->stream;
 
-	mutex_lock(&stream->device->lock);
+	guard(mutex)(&stream->device->lock);
 	switch (_IOC_NR(cmd)) {
 	case _IOC_NR(SNDRV_COMPRESS_IOCTL_VERSION):
-		retval = put_user(SNDRV_COMPRESS_VERSION,
+		return put_user(SNDRV_COMPRESS_VERSION,
 				(int __user *)arg) ? -EFAULT : 0;
-		break;
 	case _IOC_NR(SNDRV_COMPRESS_GET_CAPS):
-		retval = snd_compr_get_caps(stream, arg);
-		break;
+		return snd_compr_get_caps(stream, arg);
 #ifndef COMPR_CODEC_CAPS_OVERFLOW
 	case _IOC_NR(SNDRV_COMPRESS_GET_CODEC_CAPS):
-		retval = snd_compr_get_codec_caps(stream, arg);
-		break;
+		return snd_compr_get_codec_caps(stream, arg);
 #endif
 	case _IOC_NR(SNDRV_COMPRESS_SET_PARAMS):
-		retval = snd_compr_set_params(stream, arg);
-		break;
+		return snd_compr_set_params(stream, arg);
 	case _IOC_NR(SNDRV_COMPRESS_GET_PARAMS):
-		retval = snd_compr_get_params(stream, arg);
-		break;
+		return snd_compr_get_params(stream, arg);
 	case _IOC_NR(SNDRV_COMPRESS_SET_METADATA):
-		retval = snd_compr_set_metadata(stream, arg);
-		break;
+		return snd_compr_set_metadata(stream, arg);
 	case _IOC_NR(SNDRV_COMPRESS_GET_METADATA):
-		retval = snd_compr_get_metadata(stream, arg);
-		break;
+		return snd_compr_get_metadata(stream, arg);
 	case _IOC_NR(SNDRV_COMPRESS_TSTAMP):
-		retval = snd_compr_tstamp(stream, arg);
-		break;
+		return snd_compr_tstamp(stream, arg);
 	case _IOC_NR(SNDRV_COMPRESS_AVAIL):
-		retval = snd_compr_ioctl_avail(stream, arg);
-		break;
+		return snd_compr_ioctl_avail(stream, arg);
 	case _IOC_NR(SNDRV_COMPRESS_PAUSE):
-		retval = snd_compr_pause(stream);
-		break;
+		return snd_compr_pause(stream);
 	case _IOC_NR(SNDRV_COMPRESS_RESUME):
-		retval = snd_compr_resume(stream);
-		break;
+		return snd_compr_resume(stream);
 	case _IOC_NR(SNDRV_COMPRESS_START):
-		retval = snd_compr_start(stream);
-		break;
+		return snd_compr_start(stream);
 	case _IOC_NR(SNDRV_COMPRESS_STOP):
-		retval = snd_compr_stop(stream);
-		break;
+		return snd_compr_stop(stream);
 	case _IOC_NR(SNDRV_COMPRESS_DRAIN):
-		retval = snd_compr_drain(stream);
-		break;
+		return snd_compr_drain(stream);
 	case _IOC_NR(SNDRV_COMPRESS_PARTIAL_DRAIN):
-		retval = snd_compr_partial_drain(stream);
-		break;
+		return snd_compr_partial_drain(stream);
 	case _IOC_NR(SNDRV_COMPRESS_NEXT_TRACK):
-		retval = snd_compr_next_track(stream);
-		break;
-
+		return snd_compr_next_track(stream);
 	}
-	mutex_unlock(&stream->device->lock);
-	return retval;
+
+	return -ENOTTY;
 }
 
 /* support of 32bit userspace on 64bit platforms */
-- 
2.35.3

