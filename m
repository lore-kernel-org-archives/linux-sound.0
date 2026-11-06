Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793981935;
	b=xr4NW4rrjyarCKkVCmAG3IfTrLjYt0b7Yv+LoDaJf/x6hATFfRYaN8nOz2qbz34gZJWQ
	 vYInd3UbNa4cCHlweX3qD5f121gR2uBRl4PmRGF49vjPF5sqHLZvSngD5LsTXKrScvVPA
	 AO3z7g4Y1dhktGQqGn5Aa0oH9md8ciJGbeGi0wIT2nB4qPhrTA67BZuvqbqHR70nRMw4k
	 CQwr6utUnayH25g1ht8HcqcmgcN4vlr1c6D6fFKydnhtpx/29kfP5EALb7gJly19MtlPx
	 hlK84II+6Dk3IlqTAzZL8gWc3FnqZgsC6cpEy969RYuRAqmSL8t8kRZOQCEruKgYwIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793981935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=K9g1EmpJPl3VsiiyXPfTHGa4seP6cTbErFussR8Q6f4=;
	b=WXNoi8AWAocIoDK5SREC0xftb/e+xWcT8sB0unRfi+BWCIvVSmh+I8n5RkUkH+z8nGt2
	 6pzHscIugVAMB+KfIHHVQ4QcBzBEl+IiuEvhMmFrotsI4RKT6bwZtV2oMblUqrf6bGYG/
	 LdOJzMHZY6zXsWT3Htq845LtU+ji3GU8h8vf9YJwmrO3AL87ph6S5zb+zjDQcomw6HkTB
	 N045k9CVBwG9T9hLVgP7DWmxiA9FRxLPD3uJdqs3WGeT4EJqxS2Gy364X/qD/LVZXgMWM
	 jAPI3yJxY+MQFXcANE9Lr7nfnCkTC8zjM6F5dCVVHOFABEw9dy1q3Bld5Kx68X32ysw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cU8HJhjt;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDB2606EE88
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 16:18:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDDB2606EE88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cU8HJhjt
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-15dd124bbe7so1671366c88.1
        for <linux-sound@vger.kernel.org>; Fri, 06 Nov 2026 08:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793981934; x=1794586734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K9g1EmpJPl3VsiiyXPfTHGa4seP6cTbErFussR8Q6f4=;
        b=cU8HJhjtqlhIs2maRf1EiCoJCyiSaHUxjkgBTLdtxojCEEVuWphGIsr50Jia9xX6M3
         gjRJU/GHm4aBY0wyZlYMU4xDOGJGmccHn3A56czCcin6aDl9cjZ6jvNUcvNKY3r5dUKJ
         ex4go3V2wMexgFrOfc/aUxZEHH6g8B/vPIV+O2EMF/CFPoAczxx7Mud7Ljy0AEbxpnSw
         VbpLa75GrXQLSfBSzwcy8VzqiIxFDviOyPVcNwSyyvM4XZ4hgz+yD5n7ZLwk6yBr3hs4
         oCL3bui9cQU05tk0zOeEe92veM66bUBU8P+Qt3j6D86iFnY9cpR5jCIcwx+yUo7mrtUF
         i71Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793981934; x=1794586734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K9g1EmpJPl3VsiiyXPfTHGa4seP6cTbErFussR8Q6f4=;
        b=MG9bnTnmy7mfdj1Fy5mfL39n//7YAl2Cb9NlfyQkCtGKLaL6hHy+hl6O8TaqcF4/2s
         SPTnZB/qRuOsYcxGQiNEyUkSExtv8HMi+PwG6LJNNRui4PzkxzBk/EBqYbS0IkNj7Umh
         Z1jjjr5pY5k5PA1zTGP/VNuQ+YT/wb8ZlZtbrx8ifHWmVJQxM9j/W//wE4q7liKN3A0h
         uY3r9m7saRFnr4oB/AXs9z6GlPXZZ4HH05VIAReMppZDYFWx1++mTQQakE5Ub9dahwvp
         c0H09fWjqEG+tk4LSyauJCPZ4I2H3Ftv/zMdbmSGypCy6rdgBR9vlByBLXZGLbpDRP29
         LPlw==
X-Gm-Message-State: APuU4Z/abOrmySSfb7yGiRunOPHgGwiM5Zob/GsdxSeF5MaLTMRXhXyN
	dlMwoLFjJ0pva9hQLDoG7s472N6Tt/c8hMetKsRGUQHpSSOL4YB9P4lBGmBfdtFn
X-Gm-Gg: AYBFou3z+QmQSDU0+h4NQoslDKScZc45sNziF2Bpctonlth3KtnyTqJD3mdz1VZLYy6
	4Ja9Gj+hHBUMtl5wmz4DbE+UDgbANt4OyW021ZX67obfdVnwyu6dsbsIxTAjjC+r6IXNSwEhr5i
	Ff9Sh6Un2haAmqpmBXQWNh02P3xIyX5l8OvoPSOInALDVJc6PQ3mu+/3PKRdZEVatKarbdV2WJY
	aVJN0SDsJIAPRR+5QYT5B+/LQEZBHa4SNCrzwySC3i7duvatLK0L7y8HjBWazRWgj7/jW1ulsHR
	rtB4ZHOGfvH+NrMy2JFTdW3xzTToMgEnEy6MyFaCB7GE3q5iDHLsPxFtJGc1s5NnUWHf1VuwFhj
	NbdqCec3l7q3dkd4rzQVoVcDiiFqWN1wXTlb3eXjAlU101GdB4AEfBOHgSBXZjGnwbMZO9zu8k2
	Cs6Q7SiSfO4EzCuRtLaYS0QsITnPQhRT7noG4Q7eoQobIXXcUcueffBolBRfD7v+k6obKYUsZ5P
	PEJWUmRgaR2noTV1T4ndqagVni0Pb4/kTSRDH00CVDNHEMxalU7tOj2r3/2qOKSpgfwqekaAfWE
	ErtBmT6EmWKhysfkpjtF/8HXmNEtSNx7weXW1PkeRkfz2gDDRH2k2nMTsYauGppdYwOiBhX8Xen
	oiUDFsyOWNjszI6is/fTbEbUPgTNDeRnU+8GDrv6tmjGglTxRWnSn4O9eJBgYT8PCt+M=
X-Received: by 2002:a05:701b:2916:b0:17a:e684:b497 with SMTP id a92af1059eb24-1b25d293b87mr3742048c88.5.1793981933956;
        Fri, 06 Nov 2026 08:18:53 -0800 (PST)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4840f3sm13139526c88.5.2026.11.06.08.18.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 08:18:53 -0800 (PST)
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
Subject: [PATCH v19 03/12] ALSA: pcm: add an optional reset operation under the stream lock
Date: Sat,  7 Nov 2026 01:18:29 +0900
Message-ID: <20261106161838.94308-4-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261106161838.94308-1-mynameisjune111@gmail.com>
References: <20261106161838.94308-1-mynameisjune111@gmail.com>
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
 
