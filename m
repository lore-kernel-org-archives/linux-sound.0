Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795010166;
	b=aZejhR+eNdvWmSb6OLNN9vhdU1M9Jch2clCytodh8asSrr5OsEFv0NPT3CDeeYrp2CXv
	 6Mb+4COutS3WWLUZAAnYhYsQlIH7Mp4B7LNY0u0CJa0QS/0jm+lhyOkhZI7ute2/vb4yt
	 eBJxqm7QgZs0lgAquNuWy2gDLQnkcd9JOykmQki4FQAlv1YFoM5BmtxC83FUsYqc6wNde
	 fD4qXUSBU0I3enPTd4NlrDIeaHZ1sCzqzrEPaXjAsgOQAn73vw8C1Af8izmEYK/PKvx5U
	 Hp4B1DmNKU8cyvnJEVLQLJWZGok8u2RgtAstDRN5psLMz/zF1+CUlXiM4cJ+wMniP3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795010166;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Spamd-Result:
	 X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Rspamd-Queue-Id;
	bh=RwZjnmpR5ee1/UpDJU66jOqtBppOtk+aQMBV3IpHCug=;
	b=RZdfaVjv6Ze2sFndnGaThOJ3d3a6RXb4i5FSlf8kETDl8q9OMUspVqME3bXgU8frRKUb
	 h/xVALowuEqA/kV41JcPHh/zu8aL1OqeIcEW0QOz45XkXwNenJK4NYC/3g5lK7W3xcTl3
	 cck8cDqmO15THQCr4AxLF0ll/0yDWYvLmH5VdCBuyQ//WK7woVF1I468EOwfRIFOUoo3W
	 0ILp4fW2IcdOc77KSB0tFpXT++AA/jWU1WW4vUEFdaWLRvgbfzh4eyDOqg21KnhPa/hSj
	 UPoDJ5sZDhPp6zSwiuqDPeHE2ljqotAAwczCZKAQymijiSOgUxPnAo41QfEFrJYqqSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=LSmgTO7b;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=p617x9tl;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=xL83W4XC;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=HBRTzPQl;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121D9606A320
	for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 13:56:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 121D9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=LSmgTO7b;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=p617x9tl;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=xL83W4XC;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=HBRTzPQl
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E74C81F80A;
	Wed, 18 Nov 2026 13:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795010164; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=RwZjnmpR5ee1/UpDJU66jOqtBppOtk+aQMBV3IpHCug=;
	b=LSmgTO7bCiv/G83M8TpzY/8CrZUcYQKSRfCwFFBZnTo8WVMW85Nm1/XXijH0nM9ByQb/uV
	AsENmPpOQwpN1yWj87I2mxAOGDdysApcGHRd3IE8rTuRsCnwkJP1U7UqO2vzWuY/LXBUFa
	nryQgIYQddRPsHmxvVPm9OXa7837lyw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795010164;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=RwZjnmpR5ee1/UpDJU66jOqtBppOtk+aQMBV3IpHCug=;
	b=p617x9tlf4Ki/9LUFz6xNB2smdnL8IA67JWEnsfUbVV0bHKWQRneRV55/9Gfx9wlgvpv0+
	MsrSoxdAH8BhLlDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=xL83W4XC;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=HBRTzPQl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795010161; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=RwZjnmpR5ee1/UpDJU66jOqtBppOtk+aQMBV3IpHCug=;
	b=xL83W4XCZtIAqxE65uEtNrze1M1tMW3JPBIX43GYVNSZydcwba180VXeDtHQm0+DxC6qZ0
	cUTVDrluDjhOh4T8QSScM94ECY0fEUVLypAFR3bdIBZipbZNO5oqTu+eYEn3cRh2aC0/XA
	UKSnpuK5reIyP390i0avjpENco6k5i0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795010161;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=RwZjnmpR5ee1/UpDJU66jOqtBppOtk+aQMBV3IpHCug=;
	b=HBRTzPQl/gUkG51eegsAVRIcKzDfUw3D6BGA5FjIw0FlZ51jhj7WFXHBBwnd7q9ilo68MO
	OunRqheQqgV1qeDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AF8901334C;
	Wed, 18 Nov 2026 13:56:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id y4KfIXGu/WooHAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 18 Nov 2026 13:56:01 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 1/2] ALSA: pcm: Simplify PCM buffer access gate with auto-cleanup helpers
Date: Wed, 18 Nov 2026 14:55:55 +0100
Message-ID: <20261118135558.1928160-1-tiwai@suse.de>
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
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.01
X-Spam-Level: 
X-Rspamd-Queue-Id: E74C81F80A

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
index 5d80b56449e2..f58d9be2ad44 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -3128,7 +3128,8 @@ static snd_pcm_sframes_t snd_pcm_rewind(struct snd_pcm_substream *substream,
 		return 0;
 
 	/* Keep the DMA buffer alive through the sync below. */
-	if (!atomic_inc_unless_negative(&runtime->buffer_accessing))
+	SND_PCM_BUFFER_ACQUIRE(runtime, lock);
+	if (SND_PCM_BUFFER_ACQUIRE_ERR(lock))
 		return -EBUSY;
 	scoped_guard(pcm_stream_lock_irq, substream) {
 		ret = do_pcm_hwsync(substream);
@@ -3138,7 +3139,6 @@ static snd_pcm_sframes_t snd_pcm_rewind(struct snd_pcm_substream *substream,
 	}
 	if (ret >= 0)
 		snd_pcm_dma_buffer_sync(substream, SNDRV_DMA_SYNC_DEVICE);
-	atomic_dec(&runtime->buffer_accessing);
 	return ret;
 }
 
@@ -3152,7 +3152,8 @@ static snd_pcm_sframes_t snd_pcm_forward(struct snd_pcm_substream *substream,
 		return 0;
 
 	/* Keep the DMA buffer alive through the sync below. */
-	if (!atomic_inc_unless_negative(&runtime->buffer_accessing))
+	SND_PCM_BUFFER_ACQUIRE(runtime, lock);
+	if (SND_PCM_BUFFER_ACQUIRE_ERR(lock))
 		return -EBUSY;
 	scoped_guard(pcm_stream_lock_irq, substream) {
 		ret = do_pcm_hwsync(substream);
@@ -3162,7 +3163,6 @@ static snd_pcm_sframes_t snd_pcm_forward(struct snd_pcm_substream *substream,
 	}
 	if (ret >= 0)
 		snd_pcm_dma_buffer_sync(substream, SNDRV_DMA_SYNC_DEVICE);
-	atomic_dec(&runtime->buffer_accessing);
 	return ret;
 }
 
@@ -3173,7 +3173,8 @@ static int snd_pcm_delay(struct snd_pcm_substream *substream,
 	int err;
 
 	/* Keep the DMA buffer alive through the sync below. */
-	if (!atomic_inc_unless_negative(&runtime->buffer_accessing))
+	SND_PCM_BUFFER_ACQUIRE(runtime, lock);
+	if (SND_PCM_BUFFER_ACQUIRE_ERR(lock))
 		return -EBUSY;
 	scoped_guard(pcm_stream_lock_irq, substream) {
 		err = do_pcm_hwsync(substream);
@@ -3181,7 +3182,6 @@ static int snd_pcm_delay(struct snd_pcm_substream *substream,
 			*delay = snd_pcm_calc_delay(substream);
 	}
 	snd_pcm_dma_buffer_sync(substream, SNDRV_DMA_SYNC_CPU);
-	atomic_dec(&runtime->buffer_accessing);
 
 	return err;
 }
@@ -4085,32 +4085,23 @@ int snd_pcm_mmap_data(struct snd_pcm_substream *substream, struct file *file,
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
@@ -4120,8 +4111,6 @@ int snd_pcm_mmap_data(struct snd_pcm_substream *substream, struct file *file,
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

