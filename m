Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458133;
	b=oHO438C3jzGa21lxf+ofj5yP9ys4WvZxKE5sytGaG9bWFgb0dTkusLQtVN7ZEjZqlr7+
	 r5WgclxgbrOOpWHCYQQVXuvHd4Zt0DL1uk/KfH1T+ylRwV926yVqky5s5vc+9kxskUkeb
	 wXdi3FzQ8EWctIHugH6/MzpTTXsgtk5ynTx8OzsEBTkpJ8Sw5r1TjbiLDe8CQBglWexFo
	 qUo+pRyKjs4+ELItLZ0CRYeA1/g0FR2ZnZJtmmzj8hZcOK+s6rvDoQBr7r0uVzdMK+55K
	 eBFTqjdgUCTXcS3tgoXkuu2d/lt4vqMLzgnM06DhAphhEml/gLqujBK+/PML1DZkA8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458133;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6p3+pqMhjDImkIJEr0R5v0U340Sy0+dzECuu9p3HETc=;
	b=m4PRVJyWilE4xDURwj+/HgGkd9/qwvHfZzT8EkXnl9wiNKX5dlbWO8FImkfu+DsqyWMX
	 BYIZR6cDW0riXMhzhSi/hNpTsgwVK8RDX4XGq7mp+ISQaRR8JqleFigzpRMbJbx1TYAAV
	 wwpjWloerbD79mcfoaIc40O4oCbEharnz/9rVSFQ7CYd7nL5fzJ4Sf4uYHdN5jAQLOn2x
	 EI6j4TSh0rOGnAdCMcbvWrY+abnE9DWZx9fevw7XLt2LRf3UIq8TN00fjY33cD2p7OQPb
	 3kbfzehFtg9+P4YWHINOBw5zTJOpqFLaND85QSf+Dds1IDMrbJgX+p3WzgB2y00k/PA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TPLdja2t;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083AC606A8A3
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 04:35:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 083AC606A8A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TPLdja2t
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cdb9d5c1c8eso1980942a12.0
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 20:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794458132; x=1795062932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6p3+pqMhjDImkIJEr0R5v0U340Sy0+dzECuu9p3HETc=;
        b=TPLdja2t1JFKoYK9F5hwjU9ujo0HxtbcH1B8ZCKjgdUP+zZWArn7r0Q38aFqtIaeNI
         dXwuzhf9X73FcacRxPhe/+eu9nREYxBsVcZ0rfYu+XW4DpvxZAXZPljgs88wC1Zn5Kri
         O9RB9kT5/feJw25x3NZSve7BlrarVXqA9ladr/f/TFvMijqqfEG06bcrDfd/LREyyT9h
         bvOhDeb7g9Lrh1sdRi46dSuMgJyClHcX2CPMJukp7df18c9GaOXtDHQB2wMzfIMtJnam
         rIAAQHn5AJ+poLiFpnvy5tDvuk6D9qdJYx51+9acINCMP7ywJNoQU18kmv5QIi0DPtjo
         oQ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458132; x=1795062932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6p3+pqMhjDImkIJEr0R5v0U340Sy0+dzECuu9p3HETc=;
        b=qwbKf7OoapBToa9E4R0hrEFmrsGoNiFiuTsKA7S6mvOe5w2m7094Tbu/EZXWhHDzzg
         oO0PVJlRLCJViflJzKKofrJpZ5WL4FUeiYAoOWeeHnqr2U1Me5MckzkU9L2KTLkL+n2r
         aKwSAfCHgOuzqpTGtzUrvZV6HH2FNtAl1AzNiesxEw19okAX1z7bBdthAfKhoGqq9AYv
         a6TruEavB7J8SM3HnfpTlEaMQ+bwzWZRXYLjmjPg+2222XNZeWQf8KF8wv0IzJDp7jr+
         RRg3G8YE16pFPTwU+xFYzTfWGOI5RF/zF827McWPwuRw61BeCKE6FSfH1nmVqpnmkxKM
         PrNw==
X-Gm-Message-State: APuU4Z/idJ+KwTB92FXKC4lHo3YlAEf85wXjUX8LrvDeufqSlIA1zjbQ
	p78v6EqY7QX3MsH2T3f/XXS0omKJD5GdMw1WmXRk8WuLk952xmadH/AIEjSUaQ==
X-Gm-Gg: AYBFou3YpRiuJX+a6BNERkaEJaJSKqMGAsZxdDtwiotZIhkgnwON7KlXvBY40BDs/3i
	Gi1WuU9TZ0TSsLK1sG7dP0Kw1+d9IwWMG6s7Qj0jqck4tdoEKWJW91U/ell0R7QgJRv5EXAaOZ0
	nkU4jQK7zvqNwiGOekLhQpheNdVlpkUJXWE4za9uhgJgSRbB4KBjFNIcwjJvx2zsC2g0+rI/qQe
	2RGD2nJZrnkAPYOaV9VgFpg4a93Qjj4Ii5hWxt5rJjxAS4BBE6IrP48ohUR/5r22JBjxB6BxXPU
	C+/SzdwTzDwxELOkwilpxApfh/d+LGA1vzpymHpO2URnHlYZ10apLeN8SycgPThglzuvUMHptPr
	klFZzZEFUdKX223HoeqF3fNO3RkR3OU9J6e+HrU+TqN08ErJVWNobpvQ+gUoJsMXIePyJyaqugp
	shNk0c7XojbzpBBI2ZRb70HPh4rK1HEWli/7qEn0tuwd9aF9PYyUPkpcLmgKY4jrRT5sF09BAgh
	LBzm+zLVP6KeqKdXIm6F1dGYD18vB58nBmlIGVeDjlx3QjnCRt0LSfjwkgrT4oBRcPHZervwyd9
	2pqSXTgP67nKK6JGQ9dLP+9sHCW+yFEFEXZU+XtcS+v4xXTDLXjy+HeWAQ7KeTOf5h2oiTGnLmG
	7wW8bxbhZ1qauJdD4P42sZtthvrapbjH6y4QKNTn1stcDt4k=
X-Received: by 2002:a17:90b:2e46:b0:3b0:c22e:9460 with SMTP id 98e67ed59e1d1-3b182deaa09mr4052634a91.2.1794458132310;
        Wed, 11 Nov 2026 20:35:32 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c8b287sm2470466a91.15.2026.11.11.20.35.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 20:35:31 -0800 (PST)
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
Subject: [PATCH v28 03/17] ALSA: pcm: add an optional reset operation under the stream lock
Date: Thu, 12 Nov 2026 13:35:02 +0900
Message-ID: <20261112043516.37010-4-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112043516.37010-1-mynameisjune111@gmail.com>
References: <20261112043516.37010-1-mynameisjune111@gmail.com>
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
 
