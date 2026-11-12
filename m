Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794461704;
	b=LwsnNHBSuD4zzmVp26f1g9Kd3c2oCizKymuRlk0oH/EwSJIe6G5bSEn7ppeYsaf+JIcT
	 48SIx40q+CN5nWv1hmrKDDj+KPIQ++bODYa6cjU0lX8+Jcf98flejQYugrn3z6tpZeedG
	 Pd2fZKOoY1UT76x6w2MMDzMs52kDNTTyHCZaaXLGjIEgTS/Fv9iOuDnz0v2SBnXjsz8v+
	 lnaNZ7AMJRRmy+KLVqPJzZQMbZDqbbRBUi8jzxAk0cHH97uDSZpXuRJTr18F4SNSAdW1C
	 IoyYWVAirHW6PRHDOhwm1OyG9s/3CZNNl4Irsvvs1r3uiEdyrc6IVNNslGUphiKDuxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794461704;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6p3+pqMhjDImkIJEr0R5v0U340Sy0+dzECuu9p3HETc=;
	b=Zfvr0+zta5NxcNtUt1Gn8Hap8PJCYl5DAdNzaDLmy0WwqtPItpPIOdQubMw3y1ab749L
	 MbbHMmW/uap2NgK+Ye69y+dD8KSv3cLeZKlpzoAGXN2rlDpyi/7nONfV5YWxqdrXKttaR
	 lGNK/OarRiJYdFcmZch8XHhPn69pkBkfsoAilk0/zF0E4lkatm8D9EXoOzoYwmDpN8+Rw
	 ZrOIVOP2PfhQ7wUQjYHSPuDoemxALVOWUiyd11qZrAOqZHYuC/sRUshZg7pnWRwNWNWRj
	 RBzs35m57lcoFymbAZTwoSUTOgzTrHNlBDbWnk0ii2WyVuc50yXRflumRCtL/MVHKxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BjJLRKCC;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8F7606A8A2
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 05:35:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE8F7606A8A2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BjJLRKCC
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-15dd124bbe7so6079191c88.1
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 21:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794461703; x=1795066503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6p3+pqMhjDImkIJEr0R5v0U340Sy0+dzECuu9p3HETc=;
        b=BjJLRKCCWjp9mFsF1KQyu1y/+m0/pyahyYNYGRqICrjijkuQ3dFl8/rr3Z/zvI8D4P
         7th97yecwptP2iYeUMlOj1spbmXo7bfHmKmzdaosFiLPcptMH/tMvxvZVVDp7dka7XZ+
         4v6x5qZSV9cXjdpB0v9Ip4+zfRLiZk52djfMfDH2jrP1K0OEf5jSQeTylLUr6T+5Mzcq
         9jxWhR9aMYBx3/eujgA1td1O5tFuDmgyHn6Em3x0YhJTNO6do1ImfzeBSEuW/GMAB/rn
         tgEKy2m4dqLu4+gw5T64z29dxdyWio2U/oycpd0LLETkHKBTAiMmqCm/QaUFzSf4PbfU
         vV0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794461703; x=1795066503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6p3+pqMhjDImkIJEr0R5v0U340Sy0+dzECuu9p3HETc=;
        b=YXfIbJsm+179sZ6zrQZT0/6w36vrrVwdNVVPGWDvxuOI62ySRfuXNMEYc8Y3ARiA7R
         TQOjxYDtISmbl6kHh+gclPTBQsLQzy7Okb81gQSAyIUoGRN17FcVpXXP84erxOY2vT6m
         PG/EMXOKpDnaFPDhe+aVMjs6Q9dZi0lDfX+NXEaxH0csbJkRiHZpawpJfTDHxYm9CeTv
         e4y/gQFy/ig9ivPs5T+Tn+1+wmDLmdYZWDnjGhGZPq6XjcvUsYjwhUlufw26hAk2IDj2
         e0rQ/oNDmZbgdciCK1rJjjbyhMZezfdpF0c+N8M3LzHzpQv8WXTK3xRBxFXqjai5JXlx
         UWUg==
X-Gm-Message-State: APuU4Z9z6YvA6qsKZ7XDrNNFR+nfbqcUvP1Gn6cZieU6mSefkQV/WoxC
	sc2gqEP8SP8eZGXncXMUgVvTmybokHX/qI67cNK0r92vb0qF565Gx/Q1UZmh1g==
X-Gm-Gg: AYBFou2Ypl4XWAsxJMLwg+nXYwBVNWHodx6GwpyLkgv1Pqq6voK+QfvYmlc3XzsuHGO
	B8uStsiqWQGaHm0LhQ9Jr7nMju6XS61Ga4k6//Zj2afxGdsstymu3TFmxmW/ECS92ZzImOacuvu
	EKSEhweeN9a7LA1mGpF/2DSlc2TasvxJFqdT0Uq3LUuB5r/tih8aRJNNZ/YUzyeGZsGiwBdPjku
	t7C1cu7mWNUk2dQVje9YmO2HpBaf5o/jtqmKQLcyHuv3u2hCrngs8OIwY9lWtmqCBmW74wYuFub
	VJc4VuMe0id6dtBhbY9pb2hVs/hDE0dzA917X+ryJ7ziLjTmnXkit2LrVTEo8LFIUoAHiwPFfFq
	9kg51iul/QRaNzspVZ/gtLajKhmpP2XtkacT/lQPQfnRg/g2SfgUaKKz8Y582yKbq794/qrR84q
	XGw0Vs5Xo1C1p+23gs0Ga/WRRthFPrnAeZ7AD5Mk1ITmhIV9hOEZjZVaeth9q64Jywq0ariviri
	5mWH94PodI6z2T/kRVwXmr+FW0kRdGnhGemAVv8PYUkvq8s9+jO/ud0cQQI8tNbyuccfhjtDdMx
	iiZI0yTKTbOtl3jukY/hO5enQ+w41JnCc0/zmVCP4gJNIewnFCUmx4QTz1S5uQNv7IFAqUiGxWg
	KVE7DmKLGLYhIgQxE2c4wdRZdeEQefgyfHFR7UBqSoCbpRGZ6fXRSNQZ1LZMh7gJysXz1
X-Received: by 2002:a05:701b:4554:20b0:177:9a5b:a89 with SMTP id a92af1059eb24-1b3c0325732mr4560857c88.29.1794461702806;
        Wed, 11 Nov 2026 21:35:02 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890c0esm21953240c88.1.2026.11.11.21.34.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 21:35:02 -0800 (PST)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	Joonho Lee <mynameisjune111@gmail.com>
Subject: [PATCH v29 03/17] ALSA: pcm: add an optional reset operation under the stream lock
Date: Thu, 12 Nov 2026 14:34:32 +0900
Message-ID: <20261112053446.73504-4-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112053446.73504-1-mynameisjune111@gmail.com>
References: <20261112053446.73504-1-mynameisjune111@gmail.com>
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

A driver may need to synchronize private capture accounting with the
common RESET pointer observation and the core's position rebase.

Add an optional reset operation called under the member's stream lock.
Expose snd_pcm_lib_reset() so the callback can retain common pointer and
time handling. On zero return the core completes that member's rebase
before unlocking it. Drivers without the callback retain the ioctl path.
The operation is also used after a successful prepare.

Zero permits the position rebase; it does not promise XRUN recovery. A
negative return skips the core rebase, so a callback returning an error
must leave coherent pointer state even after partial work.

Linked RESET and prepare stop at the first error without rollback.
Earlier callback members may already have completed. Legacy members keep
the existing post_action policy. Applications must recover the group
after partial failure before relying on shared positions.

This adds an internal kernel operation and no userspace ioctl or layout.
Out-of-tree modules using snd_pcm_ops need to be rebuilt.

Complete appl_ptr rebasing once in the callback path. A later linked
member can sleep in prepare while the earlier member accepts SYNC_PTR; a
subsequent unlocked post_prepare assignment would overwrite that
acknowledgment. Keep explicit RESET playback silence processing and
leave prepare-time filling to the normal START path, preserving samples
written and rewound after prepare.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
include/sound/pcm.h     |   21 +++++++++++++++++++++
 sound/core/pcm_lib.c    |   29 ++++++++++++++++++++++++-----
 sound/core/pcm_native.c |   45 ++++++++++++++++++++++++++++++++++++++++-----
 3 files changed, 85 insertions(+), 10 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -77,6 +77,26 @@
 			     unsigned long offset);
 	int (*mmap)(struct snd_pcm_substream *substream, struct vm_area_struct *vma);
 	int (*ack)(struct snd_pcm_substream *substream);
+	/*
+	 * Optional RESET operation, also used after a successful prepare.
+	 * Called with this substream's PCM lock held; atomic streams must not
+	 * sleep. Do not reacquire the PCM lock through snd_pcm_lib_ioctl().
+	 * snd_pcm_lib_reset() provides the common pointer update under this
+	 * lock. The core completes the position and appl_ptr rebase before
+	 * unlocking a successful member.
+	 *
+	 * Return zero to let the core complete the position rebase. As with
+	 * the legacy RESET ioctl, zero does not guarantee recovery from XRUN;
+	 * callers must still handle the stream state and subsequent I/O errors.
+	 * On a negative return the core does not finish the rebase, so the
+	 * callback must leave coherent pointer state even after partial work.
+	 *
+	 * Linked RESET/prepare
+	 * stops at the first error without rollback. Earlier callback members
+	 * retain their completed reset; legacy members retain the existing
+	 * post_action policy. An error does not guarantee unchanged state.
+	 */
+	int (*reset)(struct snd_pcm_substream *substream);
 };
 
 /*
@@ -1179,6 +1199,7 @@
 {
 	substream->runtime->std_sync_id = true;
 }
+int snd_pcm_lib_reset(struct snd_pcm_substream *substream);
 int snd_pcm_lib_ioctl(struct snd_pcm_substream *substream,
 		      unsigned int cmd, void *arg);                      
 void snd_pcm_period_elapsed_under_stream_lock(struct snd_pcm_substream *substream);
diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -1766,20 +1766,39 @@
 }
 EXPORT_SYMBOL(snd_pcm_hw_params_bits);
 
-static int snd_pcm_lib_ioctl_reset(struct snd_pcm_substream *substream,
-				   void *arg)
+/**
+ * snd_pcm_lib_reset - Reset the pointer while holding the PCM stream lock
+ * @substream: PCM substream
+ *
+ * Context: PCM stream lock held. The caller must not hold driver locks
+ * acquired by the pointer or XRUN callbacks.
+ *
+ * Update a running stream through the ordinary pointer path. Other states
+ * start at zero. Pointer errors keep the existing RESET return semantics;
+ * a zero return does not imply recovery from XRUN.
+ * This helper does not update appl_ptr or acquire the stream lock.
+ *
+ * Return: zero.
+ */
+int snd_pcm_lib_reset(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 
-	guard(pcm_stream_lock_irqsave)(substream);
-	if (snd_pcm_running(substream) &&
-	    snd_pcm_update_hw_ptr(substream) >= 0)
+	if (snd_pcm_running(substream) && snd_pcm_update_hw_ptr(substream) >= 0)
 		runtime->status->hw_ptr %= runtime->buffer_size;
 	else {
 		runtime->status->hw_ptr = 0;
 		runtime->hw_ptr_wrap = 0;
 	}
 	return 0;
+}
+EXPORT_SYMBOL(snd_pcm_lib_reset);
+
+static int snd_pcm_lib_ioctl_reset(struct snd_pcm_substream *substream,
+				   void *arg)
+{
+	guard(pcm_stream_lock_irqsave)(substream);
+	return snd_pcm_lib_reset(substream);
 }
 
 static int snd_pcm_lib_ioctl_channel_info(struct snd_pcm_substream *substream,
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -1984,11 +1984,35 @@
 	}
 }
 
-static int snd_pcm_do_reset(struct snd_pcm_substream *substream,
-			    snd_pcm_state_t state)
+static int snd_pcm_reset_substream(struct snd_pcm_substream *substream,
+				   bool for_prepare)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	int err = snd_pcm_ops_ioctl(substream, SNDRV_PCM_IOCTL1_RESET, NULL);
+	int err;
+
+	if (substream->ops->reset) {
+		/*
+		 * Complete this member before releasing its PCM lock. A later
+		 * linked member may fail; RESET has no group rollback operation.
+		 */
+		guard(pcm_stream_lock_irq)(substream);
+
+		err = substream->ops->reset(substream);
+		if (err < 0)
+			return err;
+		runtime->hw_ptr_base = 0;
+		runtime->hw_ptr_interrupt = runtime->status->hw_ptr -
+			runtime->status->hw_ptr % runtime->period_size;
+		runtime->silence_start = runtime->status->hw_ptr;
+		runtime->silence_filled = 0;
+		runtime->control->appl_ptr = runtime->status->hw_ptr;
+		if (!for_prepare && substream->stream == SNDRV_PCM_STREAM_PLAYBACK &&
+		    runtime->silence_size > 0)
+			snd_pcm_playback_silence(substream, ULONG_MAX);
+		return 0;
+	}
+
+	err = snd_pcm_ops_ioctl(substream, SNDRV_PCM_IOCTL1_RESET, NULL);
 	if (err < 0)
 		return err;
 	guard(pcm_stream_lock_irq)(substream);
@@ -2000,10 +2024,19 @@
 	return 0;
 }
 
+static int snd_pcm_do_reset(struct snd_pcm_substream *substream,
+			    snd_pcm_state_t state)
+{
+	return snd_pcm_reset_substream(substream, false);
+}
+
 static void snd_pcm_post_reset(struct snd_pcm_substream *substream,
 			       snd_pcm_state_t state)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
+
+	if (substream->ops->reset)
+		return;
 	guard(pcm_stream_lock_irq)(substream);
 	runtime->control->appl_ptr = runtime->status->hw_ptr;
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK &&
@@ -2053,14 +2086,16 @@
 	if (err < 0)
 		return err;
 	pcm_qos_req_update(substream, period_to_usecs(substream->runtime));
-	return snd_pcm_do_reset(substream, state);
+	return snd_pcm_reset_substream(substream, true);
 }
 
 static void snd_pcm_post_prepare(struct snd_pcm_substream *substream,
 				 snd_pcm_state_t state)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	runtime->control->appl_ptr = runtime->status->hw_ptr;
+	/* The reset callback path already completed this rebase under the lock. */
+	if (!substream->ops->reset)
+		runtime->control->appl_ptr = runtime->status->hw_ptr;
 	snd_pcm_set_state(substream, SNDRV_PCM_STATE_PREPARED);
 }
 
