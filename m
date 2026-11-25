Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795601440;
	b=3vXiAi6+yq4/EP6TDe7qzLosdFTTDNiqUg1dWUaIlzAXAKu87/gC8o6WLbY73OUhaIgx
	 +1aaZ8243Ul9sx0xrvbgC/7AojMYq2kJESweI7GcTpwzDVf3CC47gBWaxIXDY6xZppmXE
	 Czro8XEmmbKIpkNdSZCa/b7PAR6Ex5GxDmVz5+xM5k5FdbDcNE+of5dUhBUuYuKSmG+po
	 NXaLfzXaLRctbKrDg7DDA8vfaQgvf8DursgjodGoLhM6P0nOcDDDjaTOpI6OF3UjUsOxp
	 cao0fca4ZIRsBq52IwnYM1o0H3FeNn75b2E3yUwnZVaaeyWpTr/gqDWvrfg+semfgIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601440;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Spam-Flag:
	 X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=eRgKCSOVQLlYdGnQ42KqaSDUUDva1bKv3y/USXOMqNQ=;
	b=Y7vYQtWjRakJrdvxkXjhDM3ge8vaYPsgLAJrZlkFy/+0eANxpmhS0uCjC3wIjjF0Evs3
	 xM9FvTT1CCat4/fzoref+yMu0nm2+8Cw5yZlFdzig+fNLex22tkKALXzvboGFwvMHqEy3
	 /4Ylpp3kQGnWSSDoh8LfKghXqvBZcGb6ro/CXTUqH8mrPk1w/Kjowbr86XMCINtyBcwpl
	 WLirUTBqSZB2CIbex68PkXs56UlC/HpoNSJ/DSMQcLv3b9PNrxMetZbEhf9dy+xu+vslj
	 WLt5K9XpVXNtqKsfGHIX5PWRC1nVgrPJA+blX7lbnHZt9ZTk1QEUAoIawlhGKp2CY5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=G9gH1wkp;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=9ap1UFnT;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=G9gH1wkp;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=9ap1UFnT;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E5D606A31E
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 10:10:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8E5D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=G9gH1wkp;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=9ap1UFnT;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=G9gH1wkp;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=9ap1UFnT
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B093121FE9;
	Wed, 25 Nov 2026 10:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795601437; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=eRgKCSOVQLlYdGnQ42KqaSDUUDva1bKv3y/USXOMqNQ=;
	b=G9gH1wkpBuRsvU8TbuDkN4pf6BRBb0iKBS8OfVNCPW2l6sRgzythSsmSjfLrYqu37cvvPm
	yBSgA4wqWpd5zgAUXJtxsi2xetBNPcTD5vHYDcMbyBftsyOXWKp+PtTKgleYAbS/fNU269
	qsGDREOPOGMJyfTKfjVwlQ8tcJpez10=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795601437;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=eRgKCSOVQLlYdGnQ42KqaSDUUDva1bKv3y/USXOMqNQ=;
	b=9ap1UFnTnvhhFIZr822lEfjNfQRMILrB5JV0+NHdScP1hVLEB8CPCgMKRkXpx/HqkLPvDu
	LQSslacL+16xonCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795601437; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=eRgKCSOVQLlYdGnQ42KqaSDUUDva1bKv3y/USXOMqNQ=;
	b=G9gH1wkpBuRsvU8TbuDkN4pf6BRBb0iKBS8OfVNCPW2l6sRgzythSsmSjfLrYqu37cvvPm
	yBSgA4wqWpd5zgAUXJtxsi2xetBNPcTD5vHYDcMbyBftsyOXWKp+PtTKgleYAbS/fNU269
	qsGDREOPOGMJyfTKfjVwlQ8tcJpez10=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795601437;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=eRgKCSOVQLlYdGnQ42KqaSDUUDva1bKv3y/USXOMqNQ=;
	b=9ap1UFnTnvhhFIZr822lEfjNfQRMILrB5JV0+NHdScP1hVLEB8CPCgMKRkXpx/HqkLPvDu
	LQSslacL+16xonCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 75FBD134CA;
	Wed, 25 Nov 2026 10:10:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Qe8gEx20Bmv3UwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 25 Nov 2026 10:10:37 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2] ALSA: pcm: Cover buffer access gate in all read/write ioctls
Date: Wed, 25 Nov 2026 11:10:30 +0100
Message-ID: <20261125101035.1754568-1-tiwai@suse.de>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-11.80 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.995];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -11.80

We haven't applied the buffer access gate in interleaved read/write
because it doesn't involve with the runtime attribute access before
the actual snd_pcm_lib_read/write calls.  However, there can be a
slight race during those ioctls between the PCM state check and
read/write calls, which may trigger a kernel WARNING() for the NULL
runtime->dma_area check in pcm_sanity_check().

For addressing it, in this patch, all callers of __snd_pcm_lib_xfer()
are changed to take the buffer access get via SND_PCM_BUFFER_ACQUIRE()
call for avoiding the unexpected PCM state change during the whole
operation.  Some inline helpers imply the runtime->buffer_access
gating, so the definitions of SND_PCM_BUFFER_ACQUIRE() & co are moved
to the standard pcm.h now (so that the usage outside sound/* can work
e.g. for USB gadget audio driver).

Meanwhile, this change makes the snd_pcm_buffer_access_get() and
_put() calls in __snd_pcm_lib_xfer() superfluous, so those are
dropped, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
v1->v2: fixed the mistakenly dropped error check, covering more calls

 include/sound/pcm.h      | 45 ++++++++++++++++++++++++++++++++++++----
 sound/core/oss/pcm_oss.c |  9 ++++----
 sound/core/pcm_compat.c  |  3 +++
 sound/core/pcm_lib.c     |  5 +----
 sound/core/pcm_local.h   | 26 -----------------------
 sound/core/pcm_native.c  |  3 +++
 6 files changed, 53 insertions(+), 38 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 1cf511f8d880..71143c19c7ae 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -701,6 +701,32 @@ DEFINE_LOCK_GUARD_1(pcm_stream_lock_irqsave, struct snd_pcm_substream,
 	     stream <= SNDRV_PCM_STREAM_LAST;		\
 	     stream++)
 
+/*
+ * helpers for restricting hw_params / hw_refine changes
+ */
+static inline int snd_pcm_buffer_access_get(struct snd_pcm_runtime *runtime)
+{
+	if (!atomic_inc_unless_negative(&runtime->buffer_accessing))
+		return -EBUSY;
+	return 0;
+}
+
+static inline void snd_pcm_buffer_access_put(struct snd_pcm_runtime *runtime)
+{
+	atomic_dec(&runtime->buffer_accessing);
+}
+
+/* auto-cleanup macros */
+DEFINE_GUARD(snd_pcm_buffer_access, struct snd_pcm_runtime *,
+	     snd_pcm_buffer_access_get(_T), snd_pcm_buffer_access_put(_T));
+DEFINE_GUARD_COND(snd_pcm_buffer_access, _try,
+		  snd_pcm_buffer_access_get(_T), _RET == 0);
+
+#define SND_PCM_BUFFER_ACQUIRE(runtime, var) \
+	ACQUIRE(snd_pcm_buffer_access_try, var)(runtime)
+#define SND_PCM_BUFFER_ACQUIRE_ERR(var) \
+	ACQUIRE_ERR(snd_pcm_buffer_access_try, &(var))
+
 /**
  * snd_pcm_running - Check whether the substream is in a running state
  * @substream: substream to check
@@ -1187,6 +1213,17 @@ snd_pcm_sframes_t __snd_pcm_lib_xfer(struct snd_pcm_substream *substream,
 				     void *buf, bool interleaved,
 				     snd_pcm_uframes_t frames, bool in_kernel);
 
+static inline snd_pcm_sframes_t
+snd_pcm_lib_get_and_xfer(struct snd_pcm_substream *substream,
+			 void *buf, bool interleaved,
+			 snd_pcm_uframes_t frames, bool in_kernel)
+{
+	SND_PCM_BUFFER_ACQUIRE(substream->runtime, lock);
+	if (SND_PCM_BUFFER_ACQUIRE_ERR(lock))
+		return -EBUSY;
+	return __snd_pcm_lib_xfer(substream, buf, interleaved, frames, in_kernel);
+}
+
 static inline snd_pcm_sframes_t
 snd_pcm_lib_write(struct snd_pcm_substream *substream,
 		  const void __user *buf, snd_pcm_uframes_t frames)
@@ -1219,28 +1256,28 @@ static inline snd_pcm_sframes_t
 snd_pcm_kernel_write(struct snd_pcm_substream *substream,
 		     const void *buf, snd_pcm_uframes_t frames)
 {
-	return __snd_pcm_lib_xfer(substream, (void *)buf, true, frames, true);
+	return snd_pcm_lib_get_and_xfer(substream, (void *)buf, true, frames, true);
 }
 
 static inline snd_pcm_sframes_t
 snd_pcm_kernel_read(struct snd_pcm_substream *substream,
 		    void *buf, snd_pcm_uframes_t frames)
 {
-	return __snd_pcm_lib_xfer(substream, buf, true, frames, true);
+	return snd_pcm_lib_get_and_xfer(substream, buf, true, frames, true);
 }
 
 static inline snd_pcm_sframes_t
 snd_pcm_kernel_writev(struct snd_pcm_substream *substream,
 		      void **bufs, snd_pcm_uframes_t frames)
 {
-	return __snd_pcm_lib_xfer(substream, bufs, false, frames, true);
+	return snd_pcm_lib_get_and_xfer(substream, bufs, false, frames, true);
 }
 
 static inline snd_pcm_sframes_t
 snd_pcm_kernel_readv(struct snd_pcm_substream *substream,
 		     void **bufs, snd_pcm_uframes_t frames)
 {
-	return __snd_pcm_lib_xfer(substream, bufs, false, frames, true);
+	return snd_pcm_lib_get_and_xfer(substream, bufs, false, frames, true);
 }
 
 int snd_pcm_hw_limit_rates(struct snd_pcm_hardware *hw);
diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
index 66162caa45d4..e417cb618dce 100644
--- a/sound/core/oss/pcm_oss.c
+++ b/sound/core/oss/pcm_oss.c
@@ -1246,8 +1246,8 @@ snd_pcm_sframes_t snd_pcm_oss_write3(struct snd_pcm_substream *substream, const
 				break;
 		}
 		mutex_unlock(&runtime->oss.params_lock);
-		ret = __snd_pcm_lib_xfer(substream, (void *)ptr, true,
-					 frames, in_kernel);
+		ret = snd_pcm_lib_get_and_xfer(substream, (void *)ptr, true,
+					       frames, in_kernel);
 		mutex_lock(&runtime->oss.params_lock);
 		if (ret != -EPIPE && ret != -ESTRPIPE)
 			break;
@@ -1287,9 +1287,10 @@ snd_pcm_sframes_t snd_pcm_oss_read3(struct snd_pcm_substream *substream, char *p
 		if (ret < 0)
 			break;
 		mutex_unlock(&runtime->oss.params_lock);
-		ret = __snd_pcm_lib_xfer(substream, (void *)ptr, true,
-					 frames, in_kernel);
+		ret = snd_pcm_lib_get_and_xfer(substream, ptr, true,
+					       frames, in_kernel);
 		mutex_lock(&runtime->oss.params_lock);
+
 		if (ret == -EPIPE) {
 			if (snd_pcm_get_state(substream) == SNDRV_PCM_STATE_DRAINING) {
 				ret = snd_pcm_kernel_ioctl(substream, SNDRV_PCM_IOCTL_DROP, NULL);
diff --git a/sound/core/pcm_compat.c b/sound/core/pcm_compat.c
index c5931fdfe1f5..924fd269dace 100644
--- a/sound/core/pcm_compat.c
+++ b/sound/core/pcm_compat.c
@@ -293,6 +293,9 @@ static int snd_pcm_ioctl_xferi_compat(struct snd_pcm_substream *substream,
 		return -ENOTTY;
 	if (substream->stream != dir)
 		return -EINVAL;
+	SND_PCM_BUFFER_ACQUIRE(substream->runtime, lock);
+	if (SND_PCM_BUFFER_ACQUIRE_ERR(lock))
+		return -EBUSY;
 	if (snd_pcm_get_state(substream) == SNDRV_PCM_STATE_OPEN)
 		return -EBADFD;
 
diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index 3b66677c037a..9c60fd3d38fc 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -2275,6 +2275,7 @@ int pcm_lib_apply_appl_ptr(struct snd_pcm_substream *substream,
 }
 
 /* the common loop for read/write data */
+/* the caller should reserve the buffer via runtime->buffer_access beforehand */
 snd_pcm_sframes_t __snd_pcm_lib_xfer(struct snd_pcm_substream *substream,
 				     void *data, bool interleaved,
 				     snd_pcm_uframes_t size, bool in_kernel)
@@ -2377,9 +2378,6 @@ snd_pcm_sframes_t __snd_pcm_lib_xfer(struct snd_pcm_substream *substream,
 			err = -EINVAL;
 			goto _end_unlock;
 		}
-		err = snd_pcm_buffer_access_get(runtime);
-		if (err < 0)
-			goto _end_unlock;
 		snd_pcm_stream_unlock_irq(substream);
 		if (!is_playback)
 			snd_pcm_dma_buffer_sync(substream, SNDRV_DMA_SYNC_CPU);
@@ -2388,7 +2386,6 @@ snd_pcm_sframes_t __snd_pcm_lib_xfer(struct snd_pcm_substream *substream,
 		if (is_playback)
 			snd_pcm_dma_buffer_sync(substream, SNDRV_DMA_SYNC_DEVICE);
 		snd_pcm_stream_lock_irq(substream);
-		snd_pcm_buffer_access_put(runtime);
 		if (err < 0)
 			goto _end_unlock;
 		err = pcm_accessible_state(substream);
diff --git a/sound/core/pcm_local.h b/sound/core/pcm_local.h
index 7762c89e0f9f..4b134d435c24 100644
--- a/sound/core/pcm_local.h
+++ b/sound/core/pcm_local.h
@@ -86,30 +86,4 @@ static inline void snd_pcm_dma_buffer_sync(struct snd_pcm_substream *substream,
 #define is_oss_stream(substream)	false
 #endif
 
-/*
- * helpers for restricting hw_params / hw_refine changes
- */
-static inline int snd_pcm_buffer_access_get(struct snd_pcm_runtime *runtime)
-{
-	if (!atomic_inc_unless_negative(&runtime->buffer_accessing))
-		return -EBUSY;
-	return 0;
-}
-
-static inline void snd_pcm_buffer_access_put(struct snd_pcm_runtime *runtime)
-{
-	atomic_dec(&runtime->buffer_accessing);
-}
-
-/* auto-cleanup macros */
-DEFINE_GUARD(snd_pcm_buffer_access, struct snd_pcm_runtime *,
-	     snd_pcm_buffer_access_get(_T), snd_pcm_buffer_access_put(_T));
-DEFINE_GUARD_COND(snd_pcm_buffer_access, _try,
-		  snd_pcm_buffer_access_get(_T), _RET == 0);
-
-#define SND_PCM_BUFFER_ACQUIRE(runtime, var) \
-	ACQUIRE(snd_pcm_buffer_access_try, var)(runtime)
-#define SND_PCM_BUFFER_ACQUIRE_ERR(var) \
-	ACQUIRE_ERR(snd_pcm_buffer_access_try, &(var))
-
 #endif	/* __SOUND_CORE_PCM_LOCAL_H */
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 897975e43a9b..9e4a82d4ee82 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -3418,6 +3418,9 @@ static int snd_pcm_xferi_frames_ioctl(struct snd_pcm_substream *substream,
 	struct snd_xferi xferi;
 	snd_pcm_sframes_t result;
 
+	SND_PCM_BUFFER_ACQUIRE(substream->runtime, lock);
+	if (SND_PCM_BUFFER_ACQUIRE_ERR(lock))
+		return -EBUSY;
 	if (snd_pcm_get_state(substream) == SNDRV_PCM_STATE_OPEN)
 		return -EBADFD;
 	if (put_user(0, &_xferi->result))

base-commit: c3c132d63840093a3ca4bd09e7434614c1bd07e3
-- 
2.53.0

