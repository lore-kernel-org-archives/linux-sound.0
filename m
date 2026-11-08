Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794182122;
	b=EEEIBivH1V/ygureK7XnxNse9azQg3JdX5z1TgO0TfkRFPMqsNdGvm7eV0TmMRjlZOb+
	 +0D/9X9txxPUAC60djj8uJTa6H54uStK4yIIBBx7OWPCHTasij5ALNrypzy2PVwPigpDb
	 8XHCiGU8A9SoONHqTn9OcNqOcGDyxH7EekvfQ0SXHNtZcuWvQY6afiHat3P2AUh7/ykF0
	 /FRWMBtDxxnpSoiJP1WsOQjrRBU7F8fKYD/IAMylJrMoS5YS5SWFpuIqkR7hT61u/7VbV
	 Oe1aXHsbxxAvAss46TiE06nCUIqBpNadLdOs6TlMhPG91P0Wjg26Wf2dQpcaNch6XxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794182122;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=K9g1EmpJPl3VsiiyXPfTHGa4seP6cTbErFussR8Q6f4=;
	b=gtT9MbgyVN86nbqMm0WajYxBBzoTU2LhZwm9I/KJTAnoiYdQ0ST1m4X7spGCH7uwOvgY
	 g8TLISkrtyVZDVzfR0TwVCxeiVrGHBB5Fpb1AYBNr6Zryj2A+wcQTtB6mi6XjSiulqrjn
	 dzb21DFhxKfVuUhRgkxaMTDgj8TbW4tiQlpY81fmttYOx+xiWGiic54bcaTOhe1HhZIZo
	 Cmy8nxQJ6kxdEEO4YXq7P5PYCcPZUDK24MhMvh8v2knkGgXaNxClEQE2DCu3n9yITZo8J
	 MrfOwy7gDRJyIcUpna3nlIphlGSRJi9XlT8qCBQ1P1hHkwt/N5Pv3MPEcDS9fPuPGiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l7o4rQvt;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D521606A333
	for <linux-sound@vger.kernel.org>; Sun,  8 Nov 2026 23:55:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D521606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l7o4rQvt
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ed1f1a7695so837695ad.2
        for <linux-sound@vger.kernel.org>; Sun, 08 Nov 2026 15:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794182121; x=1794786921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K9g1EmpJPl3VsiiyXPfTHGa4seP6cTbErFussR8Q6f4=;
        b=l7o4rQvtP5dSqN8z5Z5LGC30BIIPLW4wx/qoUvDRRwbOVgEfekKGEpMwc9QmWD61NU
         VbSImC7sZAJ+u5u3cDkXhIVq8THYZFU1710DINQchYQj4gyYdQztEHbMDgFYc/OVq0V8
         5/ov26cQMFXFhgRw2ZLRCOzuTHd4xsXloNN1DOG3j72GyoiqabiDtbC7PqQ4wuqhv4FZ
         jL6fgE4369CzMI1zIK/cZfw5E9vcoHds2PXRjqnTHnhYXm9waOuUF7AEFFDMtNwfos2p
         +UIlU13WBFlOmwYvbwgbogAXKaXKEhO7sN9DKU0kwBnoUZuI0GojkCcI+IWUFykceZrb
         tJow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794182121; x=1794786921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K9g1EmpJPl3VsiiyXPfTHGa4seP6cTbErFussR8Q6f4=;
        b=ojujjRsaJeE7ebv18RUiDEl59x4yqRORPP68mvdYf6KKQGpDSzaoAmG8jxalneMZM8
         iV7UD1iQusQKJj21AblnTpT+O2V4dtMrIUReS9Tx03hBeJCGjIbLMAhrrlJ0LPK+SO25
         A7H1yqG5SOU2rjfwwgwwJRAyd/vK/dPOxtzH4oDdlcU9Iqp39GiqMKLf3VJegSVUUgoK
         yK05NREc+jdcpqb4vjPcs0Sd+i4zAH1KHxW8kfF+O1FwNWYcDt4p76uhFOUUzj9ray/v
         CTti4WCsbWS7xCc57H0CBCsxjEv/aFYnO6Alx46utmCJljDl7XB2mYTMgEKn5pJJhcgq
         pBaQ==
X-Gm-Message-State: APuU4Z9tqIZrFUyZVnDDGwQlJGQjK9K9ZtvSDjs2KNG1rQ7oTZUgRYQX
	oby8Db7bcenUPK6jgoUNL7PPoQVW+EsD0rwg69HjH8tz8Y+8tzntUTLnNKHQXw==
X-Gm-Gg: AYBFou1xc53IoJpqjvd5sK2YqT2Jc7avBqmYmobBYV6Xd1AB/iNNGpJ3V3t+XBB8Oyw
	KUdpkWG2VP5KtsRs2hfpEqLqyzesUm2f7FrTuHvaq26+d2jWfaW7NNGkniyqlt2TArM48+V7PEV
	3gj7kxTe4Zp7i+XQRSKhAHinibLVP5pdhbUuciOmONs5+dzM9TsfiaFPB+iv1VorVZht6iW5fPP
	oCISLgipuneHaRjr1a/a9tj0f2xkpebtYmWI7gXMMP20rna4Ll3qdYp9I+S5ylbGgi602H/WxOQ
	EoB9/1sDktiaSgvfxy+nyrILSq26ikTRPre6xRlE84zfjMZ0aGmjrBK6QGSofYd+zfsilEdwCcC
	vXUk6JRGaX9BJ8v/4jzztsiXZSYq1oTeZ5ujz3cN5bd4soNymlNMfujwqtugu5xe0hCwicyvpMc
	AVI/PLY5QkZ8XPJtr1cz/ND88dUUrczejqtUKkbL5oIOAxeoLS/ViOXQlal0RjEQkIx1vJDXoOS
	oLx0yzq8B7hGeXecTBxgkVIvFnZn2bc6BKT0m1UfBb6OqZgIJgYEggYAibq9PSEx+Tbncgq2W6H
	zVpzuSd3IZk7b8G7B2j1yCyxcecemTOkcDDxFdFF0MibgwPZOIgU1ryu7iHyoPDOarLrA8AcNhQ
	Gr6X3iDbqP3RRGWKLRoN/tGql39GJ3tJNYNjs9ZJSrxCNgLA=
X-Received: by 2002:a17:903:19cf:b0:2e9:3c10:c5f8 with SMTP id d9443c01a7336-2ed83c13b3fmr20414215ad.65.1794182120546;
        Sun, 08 Nov 2026 15:55:20 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed81722edesm6095215ad.55.2026.11.08.15.55.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 15:55:18 -0800 (PST)
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
Subject: [PATCH v21 03/12] ALSA: pcm: add an optional reset operation under the stream lock
Date: Mon,  9 Nov 2026 08:54:48 +0900
Message-ID: <20261108235457.12688-4-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261108235457.12688-1-mynameisjune111@gmail.com>
References: <20261108235457.12688-1-mynameisjune111@gmail.com>
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
 
