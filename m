Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794365834;
	b=ba2ZVp0wlJU++jqvZF4ft7Q+FObBW5hBHoJX5KFqJDp9SGHXP6WXUz2/y9VhCsm7rwwX
	 kfLaZKo/T1EWwqgWPTc78af/JrZ6v8kb8qcvfEVjXENHhbEOS7qOutbfetcpF0WCgyZoy
	 lsP5WQy7FvkX1zxgt2IZpAQibcFhnW6lL4PLlOTEgOYLOjE+oKbQYMhD8dz9xZHt2pIlf
	 7tF75mEzcDa9+v5NdwyllVGVbFXDdK25aFawRvQ/FilovqIk5M3ubetwwsQIpud/NmE1o
	 zcJF1OkI6WN0QTlk1+ETD3HAMegcL+0k3aR6lUThYZu3EkB54xvbfUmPMS7n58VRkow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794365834;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6p3+pqMhjDImkIJEr0R5v0U340Sy0+dzECuu9p3HETc=;
	b=R78uBYl2JYdPsEO+MOarnfaKqhYg/QlklSJdaOY2Ce6JeNZSWVeO24Zl/p1SOXTeKB6x
	 q5448ujG4wtWjmRLu8n3emoiPyqg7/FWgtYeUefb9Tk6SUanmYM17QmaaEebJHu/vs4IG
	 65/z+0C10KtqQnL9xWQRMKDkI6AbHUAofEHV5jzacaLBgYBtzRQWAqdPPfNkkZJeJITRZ
	 pgOf3dRo319q8BWGyGV+OQTb4kZD5q2kPx3OEzUZU5PbkvguIg1qjW9y7sf1mMDvReqn2
	 HwkickMi+MbFBBcOYWk85O1N2+eZa5J18g6KmlBYVnnR1WjlI4hbdLfFIvSM86B2MwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rkoq9l7h;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B38C606A327
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 02:57:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B38C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rkoq9l7h
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so5398430eec.0
        for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 18:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794365832; x=1794970632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6p3+pqMhjDImkIJEr0R5v0U340Sy0+dzECuu9p3HETc=;
        b=rkoq9l7h4dI0JstUH9R1TzFIpiS0kGGy2vBoKTqk+Te/BR+HtG6VEp2D1AAre9pWTa
         Wb43YlWwDftZnki/S9UEGDnuLhIXS0qIx68QOHWAFbZXCNaEFz36mvq24VHz5WDQL6M1
         GLlJcKuIZzXCji5zMn7fuInv+BUKvMIdmcgDSBKEqGYT5CLZV6r53bAPAXTowIDQYVbp
         pDyfR0kw5cXvxNUBaV9NlQU5aTOelJunQfAcl2ZC0o3R0bFKh+4BZa0xKXD2jeVik+T0
         SrX5Ht5SYekW2QsirUzrVvUxlL0Xcri+LLC2tMLFAQjaRq6OGg9zr9EaqyTV+i6obnCn
         uopA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794365832; x=1794970632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6p3+pqMhjDImkIJEr0R5v0U340Sy0+dzECuu9p3HETc=;
        b=kGvMKODtcxicPPkgeSEA9tqQ6rxRNg3yQvSQy9n1CeY+BywHnO+efq5pvfIJBaNPoI
         x7lYfqutds+ZkbYi1YSK6yguEkvjg9nXxvhjVw0oMW8qACsZnkIucwE2vTacBEhKk8VA
         WcMCbAo7eYthmoBPCAas8RxxVXPbZuE0z39NDIJoZyo8Bag2JdDaoK76xfj/ZfFmoMZt
         ijWK+rw5QsnJVWFgjidbXn8PejruibEKNlY7OL92zpS+ssYUP4bJxuVfzNiocCQri0Rb
         fEw3Q8dk3KA7UkdAFmrL0mZ3cxle/bwOMKuLN+dM3Qwn3cH4GXVzgEsjZkOxJ/T3K07v
         HQ3A==
X-Gm-Message-State: APuU4Z+Ju/8GJ5m8l4yfc3KwtQXy7YPX/Z+EcVEBD3573iBs4Tp9gnt9
	Hq+g12xdxeE7dTI2btTSJByL7BAzaM4Gue/aJmJ0aFuuG3qWt0ICsgeuEJ363g==
X-Gm-Gg: AYBFou1G2IbY6pbm2kKTucPm66qoWOQhCJYaAMFEMAMSkK2IlCKcFAHPV2X+snjKpBM
	zkLRT95d8UPuwtXoVKBb15idfkrx8rEiOKL6yZlIGtEmqmurWKt30BmBDPXdzjUE3p6qWV6IMdg
	O51rKbZ+UreoBZv6ybYJwDoHRoNid/8hUPAsS7cIbbMjdHJsj5/ZMutKhcuobKQmqixMFC/AZZ+
	MsrRf+kXcXId1ycchybG9cIsFjXfDx0xmb+Iuv2K4qyFUYEELgcZiI1rORVDpFwBxWjpBn3ceKt
	S/Qcjm8nihAr2uPeMkXZF+w8+QAWt3klYZNmkH/yO6aPIW2nbSmKBBH6LnaOP6DzonKWJDJk+a0
	f4gOp3UIyr14JpuZEZoWQiIz/rXJL5u8+c+YvCxxmJr0hrJ4O8hHXzv9DfwnDz0cSqRvxFOCCNq
	AbcDgDUEe4qkeHymU3Tlk99hLUEgafhp1yLCm57bWbG04DoTm7uDX2N98SbktrX7p0fyHR1MZN1
	fP8nYrjlTMrPCWYUSfSTekdInUyXrfJ3+RrQwPtw0VDLSC1PkDGq/mInGyw/YPEwApVI+S7hprV
	IXM2TqpF/yrmuDr26eFUIxBkXcC2gM+g+DAKRLK4h1tcyzqV5Vn1jeuKXLEZHKfw1vMiISRShdt
	5xL21sPi+TIc9eR+0sRD0bx8w/2R5YzZ+/mH3nC0uS7w7Zx8=
X-Received: by 2002:a05:7300:e7b0:b0:36e:aa5c:7851 with SMTP id 5a478bee46e88-3768675e462mr2401785eec.27.1794365832271;
        Tue, 10 Nov 2026 18:57:12 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm12390018eec.17.2026.11.10.18.57.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 18:57:11 -0800 (PST)
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
Subject: [PATCH v25 03/16] ALSA: pcm: add an optional reset operation under the stream lock
Date: Wed, 11 Nov 2026 11:56:42 +0900
Message-ID: <20261111025655.63951-4-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111025655.63951-1-mynameisjune111@gmail.com>
References: <20261111025655.63951-1-mynameisjune111@gmail.com>
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
 
