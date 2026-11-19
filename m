Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795091049;
	b=x0sMC6bhGB+EeIZVP9RfXUP/hi++I2/7UAMUxbH3QDyBWHevf0QzKHh2EWg4QZ7n1Agl
	 loOnMgqWM5wBYKfcJ43cm5xzN6U2YxTmOjGcgjTN5k99+DN9+bYQ9o+3hPK/KTckiXQUb
	 ntKsqNX3hDAYK7RwKgSf2PArR8JoD/EgvD3+uTGUxA8plOM8xhCUgXk6hfzCaYJf/F1G5
	 3CQL4MR4FMrz1JkJULsyweEsdAaAcG2/gmJaO7Q1/h38GN51Xbl6TkTJ7wzTzFi3aQPpi
	 sPZXG+jzH95ffVtUjCG9eJYmFxJZFJ+kdxp9SCQppSV3rYKSqwFtoF5f8QL711hKs3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795091049;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id:X-Spam-Level:
	 X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:X-Spamd-Result:
	 X-Spam-Score;
	bh=jF8ZG+UF+L93oe8DW/ppEVw1EDpaAxwec5tc+bzNUfo=;
	b=w+nuIYUIRWxCnRJDogJcQe1FLKRW16BcDHacj+eiDdMMlSI3gsmwzmN85VK+ku4w6OWa
	 kZXBZAOFEz4zEvZw0yPO4aVyB/WdzJ5ieo140lzPGCwYjgs7lD1xaCLG2DyUeUddrGNPa
	 tcCPt4E6v7zUvzO0K7LJa1W1VdNFVovNEk7AMVxlbFxR2LfDXX7BnDiIbClu6B2eEEjGo
	 VRZjWUfsiTW1rp66/zN57VSLjGRj3PG86o8mm01DmVu0jZ8LZ1KxOh6hnH98W16K8mbST
	 JG74K8cBcgmu/WCOOrAyW22DvHwjtlJPYzsAb1W1nI6/l5UYn9lkUHw7GcoTMkoYs7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=QIpqaECz;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=rdzHaPry;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=QIpqaECz;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=rdzHaPry;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8206A606A324
	for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 12:24:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8206A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=QIpqaECz;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=rdzHaPry;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=QIpqaECz;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=rdzHaPry
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B868221C55;
	Thu, 19 Nov 2026 12:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795091046; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jF8ZG+UF+L93oe8DW/ppEVw1EDpaAxwec5tc+bzNUfo=;
	b=QIpqaECzczS8SifQTnOU2X9lyZX8yidS24BLSM7qmN31Ellc7cWRpWvgVPxaFaE0GgNIuv
	abdA0k63ibTrENSTJy61I2rBnfYHolWHdUGbyS2HfeWN/hna4/UQwIWognz4ss1foSh40t
	Lku6mYRQWE3cpxpC7Yj9zbuc00PV1bI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795091046;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jF8ZG+UF+L93oe8DW/ppEVw1EDpaAxwec5tc+bzNUfo=;
	b=rdzHaPryHuQPiKXqKQlCViSj/3DarcJo3pkM2/QOLJb22mEJigAiWQfn9Lr2zvNxWaNco8
	fG6QbiLiC5IXCLCQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=QIpqaECz;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=rdzHaPry
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795091046; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jF8ZG+UF+L93oe8DW/ppEVw1EDpaAxwec5tc+bzNUfo=;
	b=QIpqaECzczS8SifQTnOU2X9lyZX8yidS24BLSM7qmN31Ellc7cWRpWvgVPxaFaE0GgNIuv
	abdA0k63ibTrENSTJy61I2rBnfYHolWHdUGbyS2HfeWN/hna4/UQwIWognz4ss1foSh40t
	Lku6mYRQWE3cpxpC7Yj9zbuc00PV1bI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795091046;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jF8ZG+UF+L93oe8DW/ppEVw1EDpaAxwec5tc+bzNUfo=;
	b=rdzHaPryHuQPiKXqKQlCViSj/3DarcJo3pkM2/QOLJb22mEJigAiWQfn9Lr2zvNxWaNco8
	fG6QbiLiC5IXCLCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 41CC313507;
	Thu, 19 Nov 2026 12:24:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ENprLGXq/mqWBwAAD6G6ig:T3
	(envelope-from <tiwai@suse.de>); Thu, 19 Nov 2026 12:24:06 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 2/3] ALSA: pcm: Simplify PCM buffer access gate with auto-cleanup helpers
Date: Thu, 19 Nov 2026 13:23:53 +0100
Message-ID: <20261119122356.2134523-3-tiwai@suse.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261119122356.2134523-1-tiwai@suse.de>
References: <20261119122356.2134523-1-tiwai@suse.de>
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
X-Rspamd-Queue-Id: B868221C55
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-12.01 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FROM_EQ_ENVFROM(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -12.01

There are a few places to grant the PCM buffer access with the gate
using runtime->buffer_accessing.  They are paired like below in each
place:

	if (!atomic_inc_unless_negative(&runtime->buffer_accessing))
		return -EBUSY;
	....
	atomic_dec(&runtime->buffer_accessing);

which is not really intuitive and error-prone, as being open-coded.

This patch introduces helper macros to replace the code like the above
with auto-cleanup.  With the new helper, the above will become

	SND_PCM_BUFFER_ACQUIRE(runtime, lock);
	if (SND_PCM_BUFFER_ACQUIRE_ERR(lock))
		return -EBUSY;
	....

and the counter-part (atomic_dec()) is dropped as it's automagically
done by the auto-cleanup.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
v1->v2: no change

 sound/core/pcm_lib.c    |  7 +++---
 sound/core/pcm_local.h  | 26 +++++++++++++++++++++++
 sound/core/pcm_native.c | 47 ++++++++++++++++-------------------------
 3 files changed, 47 insertions(+), 33 deletions(-)

diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index bb16738bb591..3b66677c037a 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -2377,10 +2377,9 @@ snd_pcm_sframes_t __snd_pcm_lib_xfer(struct snd_pcm_substream *substream,
 			err = -EINVAL;
 			goto _end_unlock;
 		}
-		if (!atomic_inc_unless_negative(&runtime->buffer_accessing)) {
-			err = -EBUSY;
+		err = snd_pcm_buffer_access_get(runtime);
+		if (err < 0)
 			goto _end_unlock;
-		}
 		snd_pcm_stream_unlock_irq(substream);
 		if (!is_playback)
 			snd_pcm_dma_buffer_sync(substream, SNDRV_DMA_SYNC_CPU);
@@ -2389,7 +2388,7 @@ snd_pcm_sframes_t __snd_pcm_lib_xfer(struct snd_pcm_substream *substream,
 		if (is_playback)
 			snd_pcm_dma_buffer_sync(substream, SNDRV_DMA_SYNC_DEVICE);
 		snd_pcm_stream_lock_irq(substream);
-		atomic_dec(&runtime->buffer_accessing);
+		snd_pcm_buffer_access_put(runtime);
 		if (err < 0)
 			goto _end_unlock;
 		err = pcm_accessible_state(substream);
diff --git a/sound/core/pcm_local.h b/sound/core/pcm_local.h
index 4b134d435c24..7762c89e0f9f 100644
--- a/sound/core/pcm_local.h
+++ b/sound/core/pcm_local.h
@@ -86,4 +86,30 @@ static inline void snd_pcm_dma_buffer_sync(struct snd_pcm_substream *substream,
 #define is_oss_stream(substream)	false
 #endif
 
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
 #endif	/* __SOUND_CORE_PCM_LOCAL_H */
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index c6c2a7053923..7d5e662b219b 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -3140,7 +3140,8 @@ static snd_pcm_sframes_t snd_pcm_rewind(struct snd_pcm_substream *substream,
 		return 0;
 
 	/* Keep the DMA buffer alive through the sync below. */
-	if (!atomic_inc_unless_negative(&runtime->buffer_accessing))
+	SND_PCM_BUFFER_ACQUIRE(runtime, lock);
+	if (SND_PCM_BUFFER_ACQUIRE_ERR(lock))
 		return -EBUSY;
 	scoped_guard(pcm_stream_lock_irq, substream) {
 		ret = do_pcm_hwsync(substream);
@@ -3150,7 +3151,6 @@ static snd_pcm_sframes_t snd_pcm_rewind(struct snd_pcm_substream *substream,
 	}
 	if (ret >= 0)
 		snd_pcm_dma_buffer_sync(substream, SNDRV_DMA_SYNC_DEVICE);
-	atomic_dec(&runtime->buffer_accessing);
 	return ret;
 }
 
@@ -3164,7 +3164,8 @@ static snd_pcm_sframes_t snd_pcm_forward(struct snd_pcm_substream *substream,
 		return 0;
 
 	/* Keep the DMA buffer alive through the sync below. */
-	if (!atomic_inc_unless_negative(&runtime->buffer_accessing))
+	SND_PCM_BUFFER_ACQUIRE(runtime, lock);
+	if (SND_PCM_BUFFER_ACQUIRE_ERR(lock))
 		return -EBUSY;
 	scoped_guard(pcm_stream_lock_irq, substream) {
 		ret = do_pcm_hwsync(substream);
@@ -3174,7 +3175,6 @@ static snd_pcm_sframes_t snd_pcm_forward(struct snd_pcm_substream *substream,
 	}
 	if (ret >= 0)
 		snd_pcm_dma_buffer_sync(substream, SNDRV_DMA_SYNC_DEVICE);
-	atomic_dec(&runtime->buffer_accessing);
 	return ret;
 }
 
@@ -3185,7 +3185,8 @@ static int snd_pcm_delay(struct snd_pcm_substream *substream,
 	int err;
 
 	/* Keep the DMA buffer alive through the sync below. */
-	if (!atomic_inc_unless_negative(&runtime->buffer_accessing))
+	SND_PCM_BUFFER_ACQUIRE(runtime, lock);
+	if (SND_PCM_BUFFER_ACQUIRE_ERR(lock))
 		return -EBUSY;
 	scoped_guard(pcm_stream_lock_irq, substream) {
 		err = do_pcm_hwsync(substream);
@@ -3193,7 +3194,6 @@ static int snd_pcm_delay(struct snd_pcm_substream *substream,
 			*delay = snd_pcm_calc_delay(substream);
 	}
 	snd_pcm_dma_buffer_sync(substream, SNDRV_DMA_SYNC_CPU);
-	atomic_dec(&runtime->buffer_accessing);
 
 	return err;
 }
@@ -4097,32 +4097,23 @@ int snd_pcm_mmap_data(struct snd_pcm_substream *substream, struct file *file,
 	}
 	runtime = substream->runtime;
 	/* don't race with buffer reallocation in hw_params/hw_free */
-	if (!atomic_inc_unless_negative(&runtime->buffer_accessing))
+	SND_PCM_BUFFER_ACQUIRE(runtime, lock);
+	if (SND_PCM_BUFFER_ACQUIRE_ERR(lock))
 		return -EBUSY;
-	if (runtime->state == SNDRV_PCM_STATE_OPEN) {
-		err = -EBADFD;
-		goto out;
-	}
-	if (!(runtime->info & SNDRV_PCM_INFO_MMAP)) {
-		err = -ENXIO;
-		goto out;
-	}
+	if (runtime->state == SNDRV_PCM_STATE_OPEN)
+		return -EBADFD;
+	if (!(runtime->info & SNDRV_PCM_INFO_MMAP))
+		return -ENXIO;
 	if (runtime->access == SNDRV_PCM_ACCESS_RW_INTERLEAVED ||
-	    runtime->access == SNDRV_PCM_ACCESS_RW_NONINTERLEAVED) {
-		err = -EINVAL;
-		goto out;
-	}
+	    runtime->access == SNDRV_PCM_ACCESS_RW_NONINTERLEAVED)
+		return -EINVAL;
 	size = area->vm_end - area->vm_start;
 	offset = area->vm_pgoff << PAGE_SHIFT;
 	dma_bytes = PAGE_ALIGN(runtime->dma_bytes);
-	if ((size_t)size > dma_bytes) {
-		err = -EINVAL;
-		goto out;
-	}
-	if (offset > dma_bytes - size) {
-		err = -EINVAL;
-		goto out;
-	}
+	if ((size_t)size > dma_bytes)
+		return -EINVAL;
+	if (offset > dma_bytes - size)
+		return -EINVAL;
 
 	area->vm_ops = &snd_pcm_vm_ops_data;
 	area->vm_private_data = substream;
@@ -4132,8 +4123,6 @@ int snd_pcm_mmap_data(struct snd_pcm_substream *substream, struct file *file,
 		err = snd_pcm_lib_default_mmap(substream, area);
 	if (!err)
 		atomic_inc(&substream->mmap_count);
-out:
-	atomic_dec(&runtime->buffer_accessing);
 	return err;
 }
 EXPORT_SYMBOL(snd_pcm_mmap_data);
-- 
2.53.0

