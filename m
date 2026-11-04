Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793758684;
	b=EKQlstTxkhe7uXU21bIHTX1gA8svEvmV4IIpPUo0mM4MGOcY0qiRnnSqHtaKJnxI0B6Z
	 zFWYlVFHUbK3Bgu08p22q883lrgpBhPL56R7jXv/fmIXuDI+Gmq7ExtnonUJTGDtSla+u
	 b7aSVKfAcZe8GzDvT9Ts1ZHRq6M9VmaQ0HkTqLbuVGZZPhxQ41KrD0PANM6Vx5gyGfjzx
	 UsZ/7XZvMhDt7JAg5qzDFzcluj6s0mXLVfeFw9wTk/pjVus4WeGYegdhY+sVQp0XCOoZY
	 mWLxN/PWWRSDKFRyWVPomIi4Z0uEM4gbs7mGqV4RIlNz2D1QUWSmBkQ6ep0aglnJv5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793758684;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yHKQF6GlsIfczjgrvixXpXdQCWhSz0d2+kn+Pm1nr8U=;
	b=Zmvi4xDi+pD+g9DILTa3QAGVLl8oTRkOy5PsT93R8xPFYCmQwNaR2c533AKSYYiLZ52a
	 odHJnB3rZnIaqymw9BLJV3S4xSiA+PuyAFXIOUtfnb8yLNlUWqIOkJKUO+cB4yqvMkENz
	 Bt+RY18t/tkjnq+ytxAHBmBgeNJdgYKQ7I1kwsLTPNH/q6iqwbWoRnyK3raPoXLXWxHJu
	 Pa60/2JtaDhb0HpFqZ2wi8rdRWeRc70YxENvRbG+gczqP1M9BRpIHOd7zNUWnM/nwIEMu
	 V1Wp3xZec6b5DODmhCYOB2j/Spwcv3tkW3fm6HslbMaBOGF1VCbZHD4qUbCzF+3528Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yjPFimeh;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABF3606A335
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 02:18:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7ABF3606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yjPFimeh
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8a089dfee18so708148b3a.1
        for <linux-sound@vger.kernel.org>; Tue, 03 Nov 2026 18:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793758683; x=1794363483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yHKQF6GlsIfczjgrvixXpXdQCWhSz0d2+kn+Pm1nr8U=;
        b=yjPFimeh78kkX5YzfqUAp9V27KUQvf5jp0LPyp3DJNZGKuG/FI0+c3092Pqvgc49TK
         8wuf4tl5gIspzrdNLLAQaSRpEoGkORE1wuX3jcM6plDzWkAfa63z6WXNhJAd7p/zYxNj
         lh0iHIKL1cCFgSc//tT6Ahuenbye/8a1Q4Wiv6bEwX6IE3Ggqr+4Tf4K3ebsN3RjrIOx
         jiYJea4cS2ERqurEC2vkMvYJ8SZXYw23nD7atIp5Hgf630BWH9Ht/TIXtvBKzxhql0Oh
         YDUngpusHwS9ncDR7jBPFEjWkPYoE+6AY22eTxBFgvbFVjDXSxdkZuatpDfP2jDsJ/gd
         FUqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793758683; x=1794363483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yHKQF6GlsIfczjgrvixXpXdQCWhSz0d2+kn+Pm1nr8U=;
        b=WHaH30SnHPJS33i7eNw4yyP56h3vdWOnMI5wJ18FHCqVVfYf2R+hmkAeFM89AkWP8h
         E/FEv2igjfWnp8nJ36qCM9f85fZqw6cwoolCARLzFIDpNFeiXw3QRlEo0i4qQVLyWfRr
         VMILUq4iOjdNSPnJ8PjOoyVOZpEcbrhwtunz1Z7SahvzgppxHkyA0rCy7y6EKqhwUnh8
         YV7wblWtLz4qd+CmORdC65QN5o6zB0zcIyBFpbDCkxQk16ADAYUmGRbEy956CfZ3QH/j
         gI1wzbM8e0sQQ5Qde9sG+YVtob/eeCNqEtpHrADHbdvw2r9wt+NI0clau6z3kts9dyyM
         rmvA==
X-Gm-Message-State: APuU4Z8jaQsd2whYA8HcMxnf5HBAX/t1ocOIFg/aVArpJ71ANwuRubgB
	taU/66+uZMQiVSmy5pxjXvV2ui0OzvsA71OmiPuVoQBinrKSu1Yvhuf9dRwERw==
X-Gm-Gg: AYBFou30/vzjHUFBKJ1BOMraLLL9rrNYOibtxEmB3rfn1C0T0KFeKrX+in94nvylcB1
	+gNIn3Mw3fy1nxA/AVb3wNdFiBaGR6ujU0iZ5j3e+3cl25LQcXIPcDVV+J4XZeCl7RvYTPlt2ka
	eMswh93wTcs0/m39TRBxj5E3pr/QHdVt1u1x4arqFDpLkNtT/ij4Fr3VxxSjWP7G0jpTrch+K/X
	S1iN3oG+Uv7gxY7egOhYrV9O1umSjPHA7JIHD3fr4znmnWbxDaFFXPpaoefOrv+SPReB9kZi26N
	KWN5hmC/aUYW+4JHp2DM1ZsONGX69+fqhxbVGDJ7iyFW63rx8541yImdQZQnjPF+ML79hdSwpHe
	qG5Oy6hiu+OMrQOZguaEfxSh5OLqB60+g85a4P4wbVwjArLljEXx20dpzJPzWk4CinsZGdIcsDB
	Wzb1fqkUUfvUlHYM7aGRilabZL/CrMthenK2ky/bIfsp1hVzOJ7sLibKeEEMp1Ahd2xQuLrjqPP
	oaXN7xvHAkeSQZbUJ3GbndeqLF87b1XQxhlYwwZG/hHtOJbIRJlLmuT/mbUN9A2mkRRT8/q6J07
	JueuGA5QES3xl12zZGeZZoJ8KrrUPC+a3vHA3keQM4Ofk94JYGMMTlar3r/8psuhwywDMrDviSO
	5CL2Hta8JY1uQbQ18BVzdPQ186/KisLJXqgKnuwRoloCSVTqxka86ywmHeENjme0s22lk
X-Received: by 2002:a05:6a21:328c:b0:3e2:2b6c:2e7 with SMTP id adf61e73a8af0-3e913bbc026mr14402422637.28.1793758682701;
        Tue, 03 Nov 2026 18:18:02 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb46326f8bsm346131a12.0.2026.11.03.18.17.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 18:18:02 -0800 (PST)
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
Subject: [PATCH v14 03/12] ALSA: pcm: add an optional reset operation under the stream lock
Date: Wed,  4 Nov 2026 11:17:36 +0900
Message-ID: <20261104021745.57733-4-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104021745.57733-1-mynameisjune111@gmail.com>
References: <20261104021745.57733-1-mynameisjune111@gmail.com>
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
 
