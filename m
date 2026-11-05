Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793837374;
	b=zST9kmcJvhQ1VdlY9Ul+yT+AxKhYWJII3eDzN559GgIfX8Zh9xtvEdoeexoRNp671SMq
	 X7PBdNjGVKIStUXL/4JScTiDdC1SWq9BzF2UbW8BGJZnasMxkD3aLSVLVeQiQ7XLqOoMY
	 DFI0G6MBbshi+SUuhchBYiUyVmzuc/WmXe6IQbNo7fm1AyS5QZoUwqhpKJy1N0QVJxjeL
	 mA98Ff57rW33+fAQB5uiVcbjmQVGCcoz59JzHcVCuZWzvDpImtzoqo35E0jaa8CEiIn1V
	 u6+LnDSQiVjIdTxeMYStg8Y/AmYqVkGuImFj7P0ogx3Oib/tbK/QGu/sM2ZY2Ix01Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793837374;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yHKQF6GlsIfczjgrvixXpXdQCWhSz0d2+kn+Pm1nr8U=;
	b=bjg7f6iKP/3HToNULPA2+4hwLVSo2YQJeM3x8JEgqg0zOgRl4Zu32zCHwQ8j9uePo45Q
	 Iq1Fh3YSvF8YN2XuO1an9fmErxOQqbB8I8apAI+Ywn5jqsf1nf5k8Jh08OD/nZwbahtQM
	 kZGFcDFHe/c0Z2OowwQgwKxHHBFcW2csuO9WTPBip1XLmXy7m0QfRBkXn8goda2+aAIIb
	 Pwhk8jrtIbZEToClh2o+eqfioAwW7nXONiDmycNVuvAUr1kfLaVE1QDFQ8g3CEnnBeUfs
	 lEctGcX3zqOea8pcKHJaeH51nKySWvOr3Q5MlsiKrKLiVX9hlbjZkzrEArJV3aFwHFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yYM4fthh;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA26D606EE89
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 00:09:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA26D606EE89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yYM4fthh
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b0a2a44a0cso678031a91.1
        for <linux-sound@vger.kernel.org>; Wed, 04 Nov 2026 16:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793837373; x=1794442173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yHKQF6GlsIfczjgrvixXpXdQCWhSz0d2+kn+Pm1nr8U=;
        b=yYM4fthhWrzVUiOgBjbO4eghqwqXN2JOvpQmExdIKkWJs7H8nKY2Uh+AcvkK6hB0/+
         DGuSyntDd+A1HJbTtPjRc7V3ReIQiD7Vecwj6S+kkaeAievC+O09Zw0UfNBO841KPUky
         LP6pfpcJLnhHqyWtZGPzbDc6Uc0D63GuGeFFe/hAOxQM9fRdqMVICuYwZW6BhYY4QXV+
         l3GYa07zxwaXQNukLKz+mJay/L7Xv8E4M9wBumFWR1LUHdPew3eF+U1PZVaszowWaL6e
         v74s9Zh/kRulhT6lan1fyhJ2QI6s8Bt318NMnPIIgKOClbpuepbwxmhasGIScmOqvZFH
         8Ihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793837373; x=1794442173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yHKQF6GlsIfczjgrvixXpXdQCWhSz0d2+kn+Pm1nr8U=;
        b=nxhm0CjSRwAvRQJxOIUON3xKUG+elU/8WAFX/VWiKQR686nGbnAqYb5NCedz8/Xwlk
         BWAdRGRL9LC26Tck9bBQa5JZIr5ZKSzZZzR+jDVd7MUkaBNvsa8FTD0um1Lqf16U9+L7
         7yVWfy9dqZXJ6tmn9xy7faXY4GZJ5FuImq5P3YxVqs1Nif1BUwnYKkQsb3jLwQScTeD8
         gi1WQEpKg0toRSzLx+FxdMa6CmbuDY+sJK7xKZk5Un75rlXBa/aOYxtOITIInE04ENt/
         EOB70Ssue/Vt+JtdodGmcYzFNKbmkj4qaXnId5Kfq7Ds3XYN52JJQXUExei6u5+wXrwk
         Vtow==
X-Gm-Message-State: APuU4Z+ArUuwZZFr58a2Sl/iwuzOy5JL5bmy67vq9wJeSXZjhNL7HTKw
	0G+uwaYXz40opaORrcZQujJYqR2OF1UOYoje3VS79Keq7rjgI6/W6RNm7/jYwg==
X-Gm-Gg: AYBFou1moL/hRex3kF+UKEy6ljZNejxKfuxcuvUNXeheyMOWT9TDwSIwhMAxExKw9vV
	9FceMbRr6uipiKg3XgRxbtqxuBcZQ9hMqHhyrpuRmWSYFCzve3WcSt/T1tRcxlXZu3dgHU5T9Zu
	sIjT/v0fT6b1AKzW4MevgtoQlDCZoCTpMXYa8S4Kc1LdEfsY9exowTcg2NC8xEQH5pXCAeOyvP/
	DCNia0QzFF6WBJWWSuIXVZXoJ9oAOrmZ21sfa75RN52bWULRwcacS+6Twu6rOPlAiHog56MCAq7
	c8o3HsPGy8HPyuMjn/4892I4pyhGeKB1ftOf2nf0nx4YZvb7Jy0YhUBb6hsRL+2akdKaswJkx/W
	9yv+9ms3B+dqsNs9j6fAUtGJlhH4anOFGAWMKNOlrYSRuXQgL4oiQV641oNwPItz+vDSU5o+tde
	kUB2k/ikz3hBwGLc96HunXD74a0pNAvZmApvqPDenjMca+dUlM8wvpm3UBYHXwr9LiV4Bv0tsOR
	jmfrwTOeSk9B6iAxkaJeyLxBMehwYjfFl8oUcfT03fU36GxSdJqbEORYgvXy1J3HhaQpE2cDhzn
	ep5KXWe7Vs73Xk2dO3bArBqSTrd1SBdf9N9aX9r+ME9pn8Ob1ffogEdiJV850x01p6po5+q8otb
	b2pF/dhsfcBrGH/VmLMpDchk7YHX8fUTC48khZYreCCUBFCE=
X-Received: by 2002:a17:90b:440d:b0:3ad:1b31:92d8 with SMTP id 98e67ed59e1d1-3ae89829890mr14773097a91.60.1793837373127;
        Wed, 04 Nov 2026 16:09:33 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323c18fsm897208a91.4.2026.11.04.16.09.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 16:09:32 -0800 (PST)
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
Subject: [PATCH v15 03/12] ALSA: pcm: add an optional reset operation under the stream lock
Date: Thu,  5 Nov 2026 09:09:06 +0900
Message-ID: <20261105000915.15177-4-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105000915.15177-1-mynameisjune111@gmail.com>
References: <20261105000915.15177-1-mynameisjune111@gmail.com>
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

Zero permits the position rebase; it does not promise XRUN recovery.
A negative return skips the core rebase, so a callback returning an error
must leave coherent pointer state even after partial work.

Linked RESET and prepare stop at the first error without rollback.
Earlier callback members may already have completed. Legacy members keep
the existing post_action policy. Applications must recover the group
after partial failure before relying on shared positions.

This adds an internal kernel operation and no userspace ioctl or layout.
Out-of-tree modules using snd_pcm_ops need to be rebuilt.

Complete appl_ptr rebasing once in the callback path. A later linked
member can sleep in prepare while the earlier member accepts SYNC_PTR;
a subsequent unlocked post_prepare assignment would overwrite that
acknowledgment. Keep explicit RESET playback silence processing and
leave prepare-time filling to the normal START path, preserving samples
written and rewound after prepare.

Atomic and nonatomic synthetic-driver tests exercised both callback and
legacy members, mixed linked groups and later-member failures. The
callback retained an acknowledged appl_ptr of 64, and finite-silence
playback kept the written prefix while clearing the rewound tail.

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
@@ -1760,20 +1760,39 @@
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
 
