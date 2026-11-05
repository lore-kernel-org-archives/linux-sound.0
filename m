Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793845919;
	b=iNidnn393zddFGJKdVaetbRvXsk/ZzM3bp5kJKXljcPqFHLBJClEjmYb1c4ZDzJ+8DAL
	 v0jdiMd85Ut+dxbe3DOB7l1WKjx967F4u8Bzfi6jGTJbGBntA//7Mdm/+CriMMPCBfOQ9
	 DKbEQuYCF9iqckLRONZUrbAatRxgxXH9M27/veLeLMvKatqES8bA73T0pUEY9iKfuXlIQ
	 4LXatoDD8QNE3MFFtN8fq3hU0pBJ8D7Xq98Wh81nG5xJfkGm8EDJyHxNmLUhc5pjrhNvj
	 dCMuxQavBG/jebDufc6m+WBNMQ/no+GAbxd7PU7uCHKjijqrifdyU+YSVVqNK784rfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793845919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8Q2wSKnVNfn+0m2s/5+0NXziIvo2kKlyTlann6b/3WQ=;
	b=lyH0FZ2oEcJ5HH7R58A2GkrpTaCq0F05C21DppSTA/RlvfkNS1thN5F+qQHdozlkv80F
	 FszCG023pPO7wl8FC133LAj5TfXXTVOV59yXB4RtBj1giFgQHJ6NSTJZuHLuNaPRxBktu
	 a1uxPn2QlexCpQJypvYHSS3SeqOYj0YwgvfMnlOE1YzTCbDJhag6u1XiaygNLb1cNhjeY
	 1GypRb4+bJG/j7uhwaYPDUbrmvby5PHxxj7BIPexFqDb69nD/nLdvQdAbo6775fqLIeeC
	 d/xB1/ISYwqtUNOSUfBV5RgFy5z1ede4PcYnKMjf45uhntR4WM/hCNxnE1E/Sga3SvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yr89pume;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E801D606D818
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 02:31:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E801D606D818
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yr89pume
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cdb2e0062bbso567785a12.1
        for <linux-sound@vger.kernel.org>; Wed, 04 Nov 2026 18:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793845918; x=1794450718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Q2wSKnVNfn+0m2s/5+0NXziIvo2kKlyTlann6b/3WQ=;
        b=yr89pume9J5Q7b8qEd8sKapl3gSzQOLo3ioTIExp/fFRWBDm87cGGcl9vHOnVI+swp
         ey2Y9mfR91CcygSJezvhPWk3KmMt2VtuqvfIZyRoZGYqhUbCFN6nDKmIymXS3cEzuiEK
         sz9j3yqx/96t7J21cqyRD3q90kzmDx8qDsUbQcv04/TiNaQ1GZBDS0wJS7vps9hsv0Wp
         +EDYOS71RnBNciqKwhhAnmieIQWHDcF8h39WYdUcTPxiNjRIBlsyd+NWdCI89n682vfH
         daenpWu6ID7R2L5otHCVmikHM9ns/hcY7N9ve2lKABAtg0H8c8873iyWsWPWwsIpn/zE
         /QwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793845918; x=1794450718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Q2wSKnVNfn+0m2s/5+0NXziIvo2kKlyTlann6b/3WQ=;
        b=tQG1wnqZxDImSqfW5vpzzYHSzDUcjGo7kJpe4EqVfoX9rSB5PWaVKkYJZv7LZYgBS3
         SbeWHW70xRNlS75fA9Ek1NmB8XDGM8E70yyO7IexIGYo3OKa2St6V+dah4Jy6tsPoSMz
         F8FoE+TKdfEbHO0Zw8mNyVR6nkVwev10oX9ZYn2vMsVFMD0WLXCa+uRYmoa9Y4WDGe6o
         mUjC9oPxO9AiGToyWq5DSj3TTp/2GNVhojJOdeMeudchMh5X8oJgwd8OUwai8c0I4lQn
         LqTZr2An31X67j80Rk+eahcKXaiplMnHNmqC+0PialEnKjPWsBubVj/63VCmdnv9306t
         5ZIg==
X-Gm-Message-State: APuU4Z8bHrWEnLPPoShiz9+dXrzm7mfGmibYMCyXVdq5MNV3N/TnqnNl
	k9D2NIPnGTlM4/g1HsBiPpzr44Sgr+X8DXjrxYSWm9GHIpKBlLQj27c2HGOCcg==
X-Gm-Gg: AYBFou2p5CM4Wh8m4l37LQap9OjdJZAykOjAFChua52YBfWysHrtbBdbsFlr+93BWEi
	SyPlM7tSYpmMPrlaCsMPYmDymS7xVEhVpKmVwucPmnSKkwVQQxfB3431sEXyLM3DL/XbMXE3REm
	9y7cmvTc9GchhBgpvc8yNVQ9+dM7E4WZOYJb+Ira8Lra4m+Hbqe8Jr4NGNlSYwTSr0yRfscnqgc
	tyvrYlXuVXTg8TCHwFQiTEuA0G/1fmYj+WJmhdpoUbfv5UaydAl7Klz+btb2p5MRnm33OppCD3V
	EbSIDHcbzjs4uC1iYV5/2n83wBCli+fWCmZiUf+Bjf8ulHK/myYUTR5vt+o5l46plCLaxy1Xpgg
	tafUANdVmczQ3pRkWvV4FRZNdcC0JbUcPvA2ApA43Ct6N4+/y9HIAEXHnwlISJ1xJaAh2SD7wNg
	UQ+dAW6OYIyskIOlBJCXN10LaY+m+hm0PA+kbtEW/f6TAKkwRyJRQ8CZG1XY81bF0vBlZLzaPo4
	IM18AnBntfxDyYH6sJwtyU8CPtDq7V6dv8bzcCmJ4PJYI/Q+TYtfaafa3zuYqVk8BGyUqk2ekLl
	QEoCHjwoqnb7iKaXvV1A2pELyD8LBfMmwSQK0eiPrCVVOHIIqns2T6UD7m05fsqEoBxLVo21X71
	xc/A7Bv+zWUR6jRo7R5ofvENW3clTELynXe5Ihwj73vMYWRA=
X-Received: by 2002:a17:90b:3e89:b0:3a7:9045:fe29 with SMTP id 98e67ed59e1d1-3ae895362e9mr15653376a91.4.1793845917957;
        Wed, 04 Nov 2026 18:31:57 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323cd3csm1292775a91.3.2026.11.04.18.31.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 18:31:57 -0800 (PST)
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
Subject: [PATCH v16 03/12] ALSA: pcm: add an optional reset operation under the stream lock
Date: Thu,  5 Nov 2026 11:31:31 +0900
Message-ID: <20261105023140.18373-4-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105023140.18373-1-mynameisjune111@gmail.com>
References: <20261105023140.18373-1-mynameisjune111@gmail.com>
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
 
