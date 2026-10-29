Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263894;
	b=pqDZAkbQRvLFCzWLPcs9Z4CcgBIBhF9lzq+o1n4EhCBvG+k6ME6gjVXHuwHkRo02v80A
	 H+if/lhjVN/22jOn2TeDmdjrx4xyinHOJ2LQFRH2pmKMtDUBLYKrbJLXeXM9ha3Ey8ihY
	 z0DdFej1rOeqvarnbj1CvwJkZFC/Q4C5DbqzBOJsnawbLE6nuKSpJuP6vmICHXyPER7pw
	 edroVQh9+/Ghw80JWoBsslfzlY5tqaa2gw7Zh2oSoY/LfVsBV0SMmX2KeUXKcU9mRcAQC
	 0N9uvwSFco2nacXv+zzOz5WKHpKNkrR6nbTd8BeBSdSBVtUyUgfN1qEkyUSNLLgR8Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263894;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Rpn8KYcVL0EiT/FmqIaIfPQD2S7vrJUUAZEWCZQOS5g=;
	b=PjO0QlGV0OyTZR/1R06pD0Sj2GBvhRA7c139oXNVtn1Srhl5Ar/qWBw2SL5L45NiRX7v
	 +YvkHX0PsBnwM4NshR9+IU7KmcSeeAE2AG6hR6x1u3MJ4i5xGuFt4S2YJeO2eIbn7XasI
	 TjUd036CCYk0Aa3rweJ+MyWNBxVtyHbKLpO7T7up18+UjGtCmVNf6W3FkgUr+8wthe3sA
	 GmVhF9+jbKUh158Ieno3C5X2GoG2Kp/XvQ3b222BrorbeVVkMNtCP1TBJaVnKj1mYVWek
	 ZfEvYJECs3vRTm/HmQh+yG/i4u3nTz+xVCUXE8IDZHUC/No9So92gdZBldZtnUAHQBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bvJ1VIma;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341E960A2627
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 08:51:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 341E960A2627
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bvJ1VIma
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2eb0f1b592bso4563305ad.1
        for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 01:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793263893; x=1793868693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rpn8KYcVL0EiT/FmqIaIfPQD2S7vrJUUAZEWCZQOS5g=;
        b=bvJ1VIma1OiTv5lG1edzSyTUoKeiO/HTSrjF4O9r4Gk0k9oKrUoIVDghi+I82FSo7l
         26l0DhKi2nwdH4FZ07YXMfnWywP4jLqK3VMe8kXpL7w9jkvfG4UD16MhTEtlLtj2l3h6
         ksgSv1Hqm4yIJXZXG4AQRnNO+38NAEjDGDsNQhBW5/zbhL2YWfNjCoT3xefLJHGK7TQ8
         XT0ZvEejdzK6aE8jnAmzFu+MlbNNpBXQnxLY8SRGPlVWktPooUpw10zqETYnC/VinpN/
         o4qvybIfaryAC9w5mHL2nNMet+O0AWQQPaQYEQOGVkUHdlvI1BAkyEJQEK7t8yk1PREp
         MV7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793263893; x=1793868693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rpn8KYcVL0EiT/FmqIaIfPQD2S7vrJUUAZEWCZQOS5g=;
        b=ebKNQT7gDGXXf3vtaWRB67/CsWbT62UUwE8zQrSP/gxIbnig/yRzdRprtfBC5fuQJ5
         pb3RNnakBJb7knXLEp4/anLb1WIjtBlmrYihn+7yWPRX+YoAcAfTekO1/0ruzwWOkpXU
         V+gS1W8goIcOKayIoR1hHBu7gFpaTQs0eQaHAXYn2XzKHdW3NEWQdXkhiWPTaSwkS3eN
         br4+KSb/4ttOd1xRWe8vGVk7tnxajJdniDmbus1ajw5jGOG1caaRMiiBlTM/AohB1zwb
         OKyHG+UvA6gg/xNGBGg334rTuUYIz1lcgpl3j413J3qmfNaMQyZ3/s0jYBZmY6FE/ATm
         rnMg==
X-Gm-Message-State: AFq9FYKoqYbmYYj0SkFRsSeVZYPecu7wxd+FIP7tyjZHe5FSSkHqhkZx
	kP8VxbOR73ppUCWF4iC6unwVJNF9S2TfyiUYMVZPdOzH0jz4Yz+Lw9uhRbo5Mg==
X-Gm-Gg: AYBFou0cvMipsG0Ar0IG3tpJkEPWM95vu1VQv5DbQcvEkAbzSTCfe/9qnWrQUug5TQd
	l8l4YCOKJqjRt8LAfaw0/KmakLKZFFOnPbXEEzX5FXrOx0xOU1HEFM2Dv6udrhkcUOAoT64Aa2F
	yyq5ndm7bTm2FiuQqn0/ZB5XChL8Y9eQZ0zICvy1Wd1pLdijFMNfx5RrSnNR3dupnKGzI2Amk3B
	uNaRauRwnCUeOxRs1ZbbNSbPvA0m0yIsT7B7t5dkMmMVekrHBzq0rVfe6LwCG6pgrd1jdXg3oxu
	bo4KAfuEVkOMTkZ+RBC1b5FjHZ5Vbdye4dfTFw00b4erX5NT465bTK2vzS59I2LLdg5JlWk9G0a
	Y6kf01kx0ibSFJdcWvJaoJVL0C3grhWujCnjqxPdAtzIgVAXUgL6ON2WHAYzxjycczDgGzea0O5
	IiFN4CsET7yZwppXmHcOdWydeBrO6YOzlSmRVKAwXQ8ZChsIEevr/PxClLC8JFuh0K/Bh0k0VgT
	E86byMpKZz5NFpZyPXbm7wSTJmMF6tbVw2x6nBRUm44HZvjapy/a4O1zvVKBzHDgFu0LyhUZ52W
	39KMBoeW3P0/j6j3g4+6VX+EcHQvqTcAQSXPswS6jHhGxt6gHoU+BJzVuriqtMISh+gpO4kwA6w
	VsMYAby1a13J8lLTa++1RP9cwhQSl/S4rIkoTuN2GNA==
X-Received: by 2002:a17:902:c40a:b0:2e2:d02d:a173 with SMTP id d9443c01a7336-2eb00542986mr43647935ad.49.1793263893503;
        Thu, 29 Oct 2026 01:51:33 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6bddae0sm29991205ad.35.2026.10.29.01.51.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 01:51:33 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
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
Subject: [PATCH v9 12/14] ALSA: pcm: add an optional reset operation under the stream lock
Date: Thu, 29 Oct 2026 17:50:30 +0900
Message-ID: <20261029085032.70689-13-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261029085032.70689-1-mynameisjune111@gmail.com>
References: <20261029085032.70689-1-mynameisjune111@gmail.com>
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

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
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
@@ -1988,7 +1988,31 @@
 			    snd_pcm_state_t state)
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
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK &&
+		    runtime->silence_size > 0)
+			snd_pcm_playback_silence(substream, ULONG_MAX);
+		return 0;
+	}
+
+	err = snd_pcm_ops_ioctl(substream, SNDRV_PCM_IOCTL1_RESET, NULL);
 	if (err < 0)
 		return err;
 	guard(pcm_stream_lock_irq)(substream);
@@ -2004,6 +2028,9 @@
 			       snd_pcm_state_t state)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
+
+	if (substream->ops->reset)
+		return;
 	guard(pcm_stream_lock_irq)(substream);
 	runtime->control->appl_ptr = runtime->status->hw_ptr;
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK &&
