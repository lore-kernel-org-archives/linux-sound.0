Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794201394;
	b=UGZ5PkYIYsK1o+fyZq+Ltds6rOP7lMZxehvGEGpg7PToBdUHgbr/T7eDc6EoQvY5A604
	 oMbM2GVe8B21VCvg+I/NzVkuJQY87c7idzapBl07nx2GY0oquYL9xMgeL7UmOExRHXoPY
	 YV//rpC5VcFoX7NWUxJl0RTpDtfzCXkyVd88q03NNtH6MvktVU44cE3oSYyWtCCLL1pB6
	 KqBcmOvbJ4LXJCeI+9ivx2hQKimlaW3zDYlDH25z5r1AiEOqIGLvfmnmklcFF1ctIUH+a
	 v19cIDHTiShw05aPgsETfjFZ7uEcgOSTFY8u+oZ6T+iCiy7pTf7Qj8GbjJZ9ZUaiFfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794201394;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Gg2vIzMEdybNIlex02QZ7Vn3MXaakx+B0gxwqcZG4aE=;
	b=WE82QdfDt0lIv2tclufgIkFgpZRTUT8Y7aFfjnxQBRLWlLAgvssCh0x7uPRd3z2nyvC6
	 /rRUZsVIQFlT5NZOOPGcZ6vLvUJjNXlN4BCX6kd7o0u89pu88Pr1XMf2dHej0M7EJGPwP
	 NJidgauBI1bQQ0g8eW8MfOpPieUgQo1N5m+8ntXDy9FLduCAZfdENOKd+bTze+2o+nCT1
	 twjLtUm1OGulmSafxrpnBRxxNfLxAen3n4OWwJJaSzO/WOGTQGcb93p/baN9BOVd5Gh8a
	 qjW1/KYkuQMPwW7qgN/br1OjNvP3teCh22bb9PedUJbF8LaI5/epB7ctAWTA1JNdpig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m2Gx5rIH;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69449606D80B
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 05:16:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69449606D80B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m2Gx5rIH
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-15ea896ddc8so961898c88.0
        for <linux-sound@vger.kernel.org>; Sun, 08 Nov 2026 21:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794201393; x=1794806193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gg2vIzMEdybNIlex02QZ7Vn3MXaakx+B0gxwqcZG4aE=;
        b=m2Gx5rIHegX0d2GWTn7cDT/8hIB+x9izzhoU4JnwX9KqEqtwreX8atgNqK+AX/V1d5
         7wQcFQn0TFzzHUVzeKxcGVBQvcENIFljLKYrxMYayyUImy3gEpSru9rs4KVOSTXAd8dH
         cyV+I5eidIC+LOMY69KfhFTR+uIFLbq7H6xh2I6aFllvWQy59hS8B/XoQH6cl6W2j+eI
         z/R/N0q6LnQAt+9OVhr7ib5Z+J8ZZe+A0v9Dg3GTwa/19uWWG+20yXQ8thPlFFAlxk+4
         h3g0/DUpzqidAqmi/n2lS4Lyfpt8GY2q92Flj4k/fPDJt0HBhl/fkDNaLuqZxmj9+nrj
         ST8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794201393; x=1794806193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gg2vIzMEdybNIlex02QZ7Vn3MXaakx+B0gxwqcZG4aE=;
        b=DfTgO8aOfBxyCNgLMlBl/+IF7hzgt2wTDuLxBk+WUwAoEF9ulr7rkKhSS9KXzwtkDD
         3uTPgQ9106H/fLz6Ri+JIYbhe8RuDyQFSsU6RTTRq4sU+OyaxWtR125KTUjFOPyuy824
         5KTb67eicI1FO2sNy8pVqKYm0dTb6qXyYvoDsQVz3M+9fkNfZEWTlNPoLuVhHt5evJKh
         lUNHvAP9gU6MdGz1qH5OX06AlGxGpi+kYLJ8blJavnT/mQ8hrLpMEXmpUmx8Ti2snIXs
         M9bXwGYsQGqTR0DZh86JgsrzLF1xfza+qfzJm7gJaL51BjJFl82jxH/qs7+KtMXPwYUq
         ej2w==
X-Gm-Message-State: APuU4Z9Zq41B+AVfqlTlx3nW3RMadqtwa+jjdP3BtIH4XL/jrOrCkBm4
	AEbwqImBfbUOaGggSVKZupZ1DIQwrNblSzVt9/eu4OrnFcooGIHsgpGQZmN99w==
X-Gm-Gg: AYBFou03BYtmbeJCRtnyha2mFfaQllx3v62cZ9f9on4a3EQhZxqu4yKJ6v48t1INWB3
	ExNy3M5mZNKXz2BEwYsE46o3/T3mQkAJPf/uqE8wKv8vWOkoJW2gHfkv4lYICtSDQHEofObXcfq
	0WFgxNfXmikhR64kQZo7fQFCXbC6QvB0yVRz0EaE/ohJF2SoK1bBGw8ahwIFiftA/S/Y9sSg77Z
	Y6V/f9mzYvSAoYmp5eNYhJBjqDmTvFjFQuWJ15aUxUvCk8aRyuJ9K/da4BKKvyCLxj0kv5mYsM8
	NmXZZCIf1momZXo/6+s4Y3OJ9qUSEbQpbSrI8UcQjpUanWr50CTPwIC1sKVqikD4z+rwaPFD80Q
	QNrhS6A96CLfa2F9roAc8cwXmZyK8F/du2JKeRFenEsZEUEii+qywgSCkJLqgeopAe/nXYSER25
	u605XKbFpdHK2q3qD+woXYxWSMoDXY78yleRlwYA7pJeATTZD6PE4ui4ojD2UZbZsRcBWgoxUy3
	Qb1YwTl9Cmy6uHDqW8HH8cHp3hxIpMZavY+lQkqL48nGSL82TKKQfSolK7/FWYa1ry3Hap4xVuN
	RYQUykAr0L5IRi6MrJ4uHsTPLGReTgYc61uMktSW2Dcd4ov/TiR+cXvgxhR7PnwUwVYGc27wT/a
	VfAQS8xjyWsV2+aXbAh/VTBgK5YIBly5UK84Ss9dEmsU+Scs=
X-Received: by 2002:a05:701b:2705:b0:189:d6bf:7ec7 with SMTP id a92af1059eb24-1b39fe946b5mr5229948c88.19.1794201393273;
        Sun, 08 Nov 2026 21:16:33 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b37314826asm11395635c88.3.2026.11.08.21.16.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 21:16:32 -0800 (PST)
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
Subject: [PATCH v22 03/13] ALSA: pcm: add an optional reset operation under the stream lock
Date: Mon,  9 Nov 2026 14:16:08 +0900
Message-ID: <20261109051618.22506-4-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109051618.22506-1-mynameisjune111@gmail.com>
References: <20261108235457.12688-1-mynameisjune111@gmail.com>
 <20261109051618.22506-1-mynameisjune111@gmail.com>
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
 
