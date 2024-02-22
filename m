Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E2F3FE2A
	for <linux-sound@vger.kernel.org>; Thu, 22 Feb 2024 11:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708600519; cv=none; b=l8JYtVFn1U1OLnXHg2iBZ5mWNTdBVSO43AxgnBtQ02ug1AD5AdPTfh6mIpNoAQT+MbKJPTnOd7w3c7PxscyJDdPNtH0JeN2Ottbg5vN1aa7K/xqNBuhTrvLdidhi3eTPipzu1XO2MUtoZSRwSv/Q540TwysFuhs9khYR94O2IBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708600519; c=relaxed/simple;
	bh=6Or+iY5lxrM4xMMe2nqX8kSUs3K76ZQ9GY4eZMxFxgA=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=p8EOqPX91os05fWT80PBZ4BFW2jE4rGr3HagGnXanHuMn2i/EfdPTacfZ1SFdeY3gz0vFT/jWhL2j3YLKnvBWFlGMvLkEVeqaNAzMoL1dZbOhpTh5gmNfofovcU9sCOVKurWQS9ihiZa08sHIs1q1+TAQDO0Aa7gHTDQvl1pqgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=V7i+D9Pl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VhAyrbYq; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=V7i+D9Pl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VhAyrbYq; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="V7i+D9Pl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VhAyrbYq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="V7i+D9Pl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VhAyrbYq"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 75AF5222C5;
	Thu, 22 Feb 2024 11:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708600515; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yThV13tQqnIi7sz+8CROmOjoy298x14eiVoGv8y/Uq8=;
	b=V7i+D9PlD9PzJqgWbt/4qdsuzc/Qz8KkkmjbWuxdGJJaGvNVy7EzgkOhgjTM04/wP9Ylf6
	+/JOT0myH0tcucXkK7lPYZOoF2YItTXSabyPyEw/NFVCbp4DRwmbkFfT5EO48qlhzfLcMG
	Msk31gQ6Pxu3lB1/cNn0ihw49FGWB+k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708600515;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yThV13tQqnIi7sz+8CROmOjoy298x14eiVoGv8y/Uq8=;
	b=VhAyrbYqGtc6ytOLTN8ETKby5TAlz9KynCivh4xoRYDBSbBadULHSZQPLOnjLEQ1+T6fNw
	UdGy3DsR2s5z8CCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708600515; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yThV13tQqnIi7sz+8CROmOjoy298x14eiVoGv8y/Uq8=;
	b=V7i+D9PlD9PzJqgWbt/4qdsuzc/Qz8KkkmjbWuxdGJJaGvNVy7EzgkOhgjTM04/wP9Ylf6
	+/JOT0myH0tcucXkK7lPYZOoF2YItTXSabyPyEw/NFVCbp4DRwmbkFfT5EO48qlhzfLcMG
	Msk31gQ6Pxu3lB1/cNn0ihw49FGWB+k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708600515;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yThV13tQqnIi7sz+8CROmOjoy298x14eiVoGv8y/Uq8=;
	b=VhAyrbYqGtc6ytOLTN8ETKby5TAlz9KynCivh4xoRYDBSbBadULHSZQPLOnjLEQ1+T6fNw
	UdGy3DsR2s5z8CCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5817E13ADA;
	Thu, 22 Feb 2024 11:15:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6OdcFMMs12UFGgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 22 Feb 2024 11:15:15 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 1/9] ALSA: pcm: Use automatic cleanup of kfree()
Date: Thu, 22 Feb 2024 12:15:01 +0100
Message-Id: <20240222111509.28390-2-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240222111509.28390-1-tiwai@suse.de>
References: <20240222111509.28390-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Bar: /
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=V7i+D9Pl;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=VhAyrbYq
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [0.49 / 50.00];
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
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Score: 0.49
X-Rspamd-Queue-Id: 75AF5222C5
X-Spam-Flag: NO

There are common patterns where a temporary buffer is allocated and
freed at the exit, and those can be simplified with the recent cleanup
mechanism via __free(kfree).

A caveat is that some allocations are memdup_user() and they return an
error pointer instead of NULL.  Those need special cares and the value
has to be cleared with no_free_ptr() at the allocation error path.

Other than that, the conversions are straightforward.

No functional changes, only code refactoring.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/pcm.c        |  4 +-
 sound/core/pcm_compat.c | 29 +++++-------
 sound/core/pcm_native.c | 99 ++++++++++++++++-------------------------
 3 files changed, 49 insertions(+), 83 deletions(-)

diff --git a/sound/core/pcm.c b/sound/core/pcm.c
index d9b338088d10..87d27fbdfe5c 100644
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -342,7 +342,7 @@ static const char *snd_pcm_oss_format_name(int format)
 static void snd_pcm_proc_info_read(struct snd_pcm_substream *substream,
 				   struct snd_info_buffer *buffer)
 {
-	struct snd_pcm_info *info;
+	struct snd_pcm_info *info __free(kfree) = NULL;
 	int err;
 
 	if (! substream)
@@ -355,7 +355,6 @@ static void snd_pcm_proc_info_read(struct snd_pcm_substream *substream,
 	err = snd_pcm_info(substream, info);
 	if (err < 0) {
 		snd_iprintf(buffer, "error %d\n", err);
-		kfree(info);
 		return;
 	}
 	snd_iprintf(buffer, "card: %d\n", info->card);
@@ -369,7 +368,6 @@ static void snd_pcm_proc_info_read(struct snd_pcm_substream *substream,
 	snd_iprintf(buffer, "subclass: %d\n", info->dev_subclass);
 	snd_iprintf(buffer, "subdevices_count: %d\n", info->subdevices_count);
 	snd_iprintf(buffer, "subdevices_avail: %d\n", info->subdevices_avail);
-	kfree(info);
 }
 
 static void snd_pcm_stream_proc_info_read(struct snd_info_entry *entry,
diff --git a/sound/core/pcm_compat.c b/sound/core/pcm_compat.c
index c96483091f30..ef3c0d177510 100644
--- a/sound/core/pcm_compat.c
+++ b/sound/core/pcm_compat.c
@@ -235,7 +235,7 @@ static int snd_pcm_ioctl_hw_params_compat(struct snd_pcm_substream *substream,
 					  int refine, 
 					  struct snd_pcm_hw_params32 __user *data32)
 {
-	struct snd_pcm_hw_params *data;
+	struct snd_pcm_hw_params *data __free(kfree) = NULL;
 	struct snd_pcm_runtime *runtime;
 	int err;
 
@@ -248,34 +248,28 @@ static int snd_pcm_ioctl_hw_params_compat(struct snd_pcm_substream *substream,
 		return -ENOMEM;
 
 	/* only fifo_size (RO from userspace) is different, so just copy all */
-	if (copy_from_user(data, data32, sizeof(*data32))) {
-		err = -EFAULT;
-		goto error;
-	}
+	if (copy_from_user(data, data32, sizeof(*data32)))
+		return -EFAULT;
 
 	if (refine) {
 		err = snd_pcm_hw_refine(substream, data);
 		if (err < 0)
-			goto error;
+			return err;
 		err = fixup_unreferenced_params(substream, data);
 	} else {
 		err = snd_pcm_hw_params(substream, data);
 	}
 	if (err < 0)
-		goto error;
+		return err;
 	if (copy_to_user(data32, data, sizeof(*data32)) ||
-	    put_user(data->fifo_size, &data32->fifo_size)) {
-		err = -EFAULT;
-		goto error;
-	}
+	    put_user(data->fifo_size, &data32->fifo_size))
+		return -EFAULT;
 
 	if (! refine) {
 		unsigned int new_boundary = recalculate_boundary(runtime);
 		if (new_boundary)
 			runtime->boundary = new_boundary;
 	}
- error:
-	kfree(data);
 	return err;
 }
 
@@ -338,7 +332,7 @@ static int snd_pcm_ioctl_xfern_compat(struct snd_pcm_substream *substream,
 	compat_caddr_t buf;
 	compat_caddr_t __user *bufptr;
 	u32 frames;
-	void __user **bufs;
+	void __user **bufs __free(kfree) = NULL;
 	int err, ch, i;
 
 	if (! substream->runtime)
@@ -360,10 +354,8 @@ static int snd_pcm_ioctl_xfern_compat(struct snd_pcm_substream *substream,
 		return -ENOMEM;
 	for (i = 0; i < ch; i++) {
 		u32 ptr;
-		if (get_user(ptr, bufptr)) {
-			kfree(bufs);
+		if (get_user(ptr, bufptr))
 			return -EFAULT;
-		}
 		bufs[i] = compat_ptr(ptr);
 		bufptr++;
 	}
@@ -373,9 +365,8 @@ static int snd_pcm_ioctl_xfern_compat(struct snd_pcm_substream *substream,
 		err = snd_pcm_lib_readv(substream, bufs, frames);
 	if (err >= 0) {
 		if (put_user(err, &data32->result))
-			err = -EFAULT;
+			return -EFAULT;
 	}
-	kfree(bufs);
 	return err;
 }
 
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index f5ff00f99788..beee5249dae1 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -236,7 +236,7 @@ int snd_pcm_info(struct snd_pcm_substream *substream, struct snd_pcm_info *info)
 int snd_pcm_info_user(struct snd_pcm_substream *substream,
 		      struct snd_pcm_info __user * _info)
 {
-	struct snd_pcm_info *info;
+	struct snd_pcm_info *info __free(kfree) = NULL;
 	int err;
 
 	info = kmalloc(sizeof(*info), GFP_KERNEL);
@@ -247,7 +247,6 @@ int snd_pcm_info_user(struct snd_pcm_substream *substream,
 		if (copy_to_user(_info, info, sizeof(*info)))
 			err = -EFAULT;
 	}
-	kfree(info);
 	return err;
 }
 
@@ -359,7 +358,7 @@ static int constrain_params_by_rules(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_constraints *constrs =
 					&substream->runtime->hw_constraints;
 	unsigned int k;
-	unsigned int *rstamps;
+	unsigned int *rstamps __free(kfree) = NULL;
 	unsigned int vstamps[SNDRV_PCM_HW_PARAM_LAST_INTERVAL + 1];
 	unsigned int stamp;
 	struct snd_pcm_hw_rule *r;
@@ -435,10 +434,8 @@ static int constrain_params_by_rules(struct snd_pcm_substream *substream,
 		}
 
 		changed = r->func(params, r);
-		if (changed < 0) {
-			err = changed;
-			goto out;
-		}
+		if (changed < 0)
+			return changed;
 
 		/*
 		 * When the parameter is changed, notify it to the caller
@@ -469,8 +466,6 @@ static int constrain_params_by_rules(struct snd_pcm_substream *substream,
 	if (again)
 		goto retry;
 
- out:
-	kfree(rstamps);
 	return err;
 }
 
@@ -571,26 +566,24 @@ EXPORT_SYMBOL(snd_pcm_hw_refine);
 static int snd_pcm_hw_refine_user(struct snd_pcm_substream *substream,
 				  struct snd_pcm_hw_params __user * _params)
 {
-	struct snd_pcm_hw_params *params;
+	struct snd_pcm_hw_params *params __free(kfree) = NULL;
 	int err;
 
 	params = memdup_user(_params, sizeof(*params));
 	if (IS_ERR(params))
-		return PTR_ERR(params);
+		return PTR_ERR(no_free_ptr(params));
 
 	err = snd_pcm_hw_refine(substream, params);
 	if (err < 0)
-		goto end;
+		return err;
 
 	err = fixup_unreferenced_params(substream, params);
 	if (err < 0)
-		goto end;
+		return err;
 
 	if (copy_to_user(_params, params, sizeof(*params)))
-		err = -EFAULT;
-end:
-	kfree(params);
-	return err;
+		return -EFAULT;
+	return 0;
 }
 
 static int period_to_usecs(struct snd_pcm_runtime *runtime)
@@ -864,21 +857,19 @@ static int snd_pcm_hw_params(struct snd_pcm_substream *substream,
 static int snd_pcm_hw_params_user(struct snd_pcm_substream *substream,
 				  struct snd_pcm_hw_params __user * _params)
 {
-	struct snd_pcm_hw_params *params;
+	struct snd_pcm_hw_params *params __free(kfree) = NULL;
 	int err;
 
 	params = memdup_user(_params, sizeof(*params));
 	if (IS_ERR(params))
-		return PTR_ERR(params);
+		return PTR_ERR(no_free_ptr(params));
 
 	err = snd_pcm_hw_params(substream, params);
 	if (err < 0)
-		goto end;
+		return err;
 
 	if (copy_to_user(_params, params, sizeof(*params)))
-		err = -EFAULT;
-end:
-	kfree(params);
+		return -EFAULT;
 	return err;
 }
 
@@ -2271,7 +2262,8 @@ static int snd_pcm_link(struct snd_pcm_substream *substream, int fd)
 	int res = 0;
 	struct snd_pcm_file *pcm_file;
 	struct snd_pcm_substream *substream1;
-	struct snd_pcm_group *group, *target_group;
+	struct snd_pcm_group *group __free(kfree) = NULL;
+	struct snd_pcm_group *target_group;
 	bool nonatomic = substream->pcm->nonatomic;
 	struct fd f = fdget(fd);
 
@@ -2281,6 +2273,7 @@ static int snd_pcm_link(struct snd_pcm_substream *substream, int fd)
 		res = -EBADFD;
 		goto _badf;
 	}
+
 	pcm_file = f.file->private_data;
 	substream1 = pcm_file->substream;
 
@@ -2292,8 +2285,9 @@ static int snd_pcm_link(struct snd_pcm_substream *substream, int fd)
 	group = kzalloc(sizeof(*group), GFP_KERNEL);
 	if (!group) {
 		res = -ENOMEM;
-		goto _nolock;
+		goto _badf;
 	}
+
 	snd_pcm_group_init(group);
 
 	down_write(&snd_pcm_link_rwsem);
@@ -2324,8 +2318,6 @@ static int snd_pcm_link(struct snd_pcm_substream *substream, int fd)
 	snd_pcm_group_unlock_irq(target_group, nonatomic);
  _end:
 	up_write(&snd_pcm_link_rwsem);
- _nolock:
-	kfree(group);
  _badf:
 	fdput(f);
 	return res;
@@ -3279,7 +3271,7 @@ static int snd_pcm_xfern_frames_ioctl(struct snd_pcm_substream *substream,
 {
 	struct snd_xfern xfern;
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	void *bufs;
+	void *bufs __free(kfree) = NULL;
 	snd_pcm_sframes_t result;
 
 	if (runtime->state == SNDRV_PCM_STATE_OPEN)
@@ -3293,12 +3285,11 @@ static int snd_pcm_xfern_frames_ioctl(struct snd_pcm_substream *substream,
 
 	bufs = memdup_user(xfern.bufs, sizeof(void *) * runtime->channels);
 	if (IS_ERR(bufs))
-		return PTR_ERR(bufs);
+		return PTR_ERR(no_free_ptr(bufs));
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 		result = snd_pcm_lib_writev(substream, bufs, xfern.frames);
 	else
 		result = snd_pcm_lib_readv(substream, bufs, xfern.frames);
-	kfree(bufs);
 	if (put_user(result, &_xfern->result))
 		return -EFAULT;
 	return result < 0 ? result : 0;
@@ -3566,7 +3557,7 @@ static ssize_t snd_pcm_readv(struct kiocb *iocb, struct iov_iter *to)
 	struct snd_pcm_runtime *runtime;
 	snd_pcm_sframes_t result;
 	unsigned long i;
-	void __user **bufs;
+	void __user **bufs __free(kfree) = NULL;
 	snd_pcm_uframes_t frames;
 	const struct iovec *iov = iter_iov(to);
 
@@ -3595,7 +3586,6 @@ static ssize_t snd_pcm_readv(struct kiocb *iocb, struct iov_iter *to)
 	result = snd_pcm_lib_readv(substream, bufs, frames);
 	if (result > 0)
 		result = frames_to_bytes(runtime, result);
-	kfree(bufs);
 	return result;
 }
 
@@ -3606,7 +3596,7 @@ static ssize_t snd_pcm_writev(struct kiocb *iocb, struct iov_iter *from)
 	struct snd_pcm_runtime *runtime;
 	snd_pcm_sframes_t result;
 	unsigned long i;
-	void __user **bufs;
+	void __user **bufs __free(kfree) = NULL;
 	snd_pcm_uframes_t frames;
 	const struct iovec *iov = iter_iov(from);
 
@@ -3634,7 +3624,6 @@ static ssize_t snd_pcm_writev(struct kiocb *iocb, struct iov_iter *from)
 	result = snd_pcm_lib_writev(substream, bufs, frames);
 	if (result > 0)
 		result = frames_to_bytes(runtime, result);
-	kfree(bufs);
 	return result;
 }
 
@@ -4076,8 +4065,8 @@ static void snd_pcm_hw_convert_to_old_params(struct snd_pcm_hw_params_old *opara
 static int snd_pcm_hw_refine_old_user(struct snd_pcm_substream *substream,
 				      struct snd_pcm_hw_params_old __user * _oparams)
 {
-	struct snd_pcm_hw_params *params;
-	struct snd_pcm_hw_params_old *oparams = NULL;
+	struct snd_pcm_hw_params *params __free(kfree) = NULL;
+	struct snd_pcm_hw_params_old *oparams __free(kfree) = NULL;
 	int err;
 
 	params = kmalloc(sizeof(*params), GFP_KERNEL);
@@ -4085,34 +4074,28 @@ static int snd_pcm_hw_refine_old_user(struct snd_pcm_substream *substream,
 		return -ENOMEM;
 
 	oparams = memdup_user(_oparams, sizeof(*oparams));
-	if (IS_ERR(oparams)) {
-		err = PTR_ERR(oparams);
-		goto out;
-	}
+	if (IS_ERR(oparams))
+		return PTR_ERR(no_free_ptr(oparams));
 	snd_pcm_hw_convert_from_old_params(params, oparams);
 	err = snd_pcm_hw_refine(substream, params);
 	if (err < 0)
-		goto out_old;
+		return err;
 
 	err = fixup_unreferenced_params(substream, params);
 	if (err < 0)
-		goto out_old;
+		return err;
 
 	snd_pcm_hw_convert_to_old_params(oparams, params);
 	if (copy_to_user(_oparams, oparams, sizeof(*oparams)))
-		err = -EFAULT;
-out_old:
-	kfree(oparams);
-out:
-	kfree(params);
-	return err;
+		return -EFAULT;
+	return 0;
 }
 
 static int snd_pcm_hw_params_old_user(struct snd_pcm_substream *substream,
 				      struct snd_pcm_hw_params_old __user * _oparams)
 {
-	struct snd_pcm_hw_params *params;
-	struct snd_pcm_hw_params_old *oparams = NULL;
+	struct snd_pcm_hw_params *params __free(kfree) = NULL;
+	struct snd_pcm_hw_params_old *oparams __free(kfree) = NULL;
 	int err;
 
 	params = kmalloc(sizeof(*params), GFP_KERNEL);
@@ -4120,24 +4103,18 @@ static int snd_pcm_hw_params_old_user(struct snd_pcm_substream *substream,
 		return -ENOMEM;
 
 	oparams = memdup_user(_oparams, sizeof(*oparams));
-	if (IS_ERR(oparams)) {
-		err = PTR_ERR(oparams);
-		goto out;
-	}
+	if (IS_ERR(oparams))
+		return PTR_ERR(no_free_ptr(oparams));
 
 	snd_pcm_hw_convert_from_old_params(params, oparams);
 	err = snd_pcm_hw_params(substream, params);
 	if (err < 0)
-		goto out_old;
+		return err;
 
 	snd_pcm_hw_convert_to_old_params(oparams, params);
 	if (copy_to_user(_oparams, oparams, sizeof(*oparams)))
-		err = -EFAULT;
-out_old:
-	kfree(oparams);
-out:
-	kfree(params);
-	return err;
+		return -EFAULT;
+	return 0;
 }
 #endif /* CONFIG_SND_SUPPORT_OLD_API */
 
-- 
2.35.3

