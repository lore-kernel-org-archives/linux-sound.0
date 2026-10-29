Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263900;
	b=HyS6psRbwiGWIVDCXuK71mtL4F+T/Jy7XBRjczkU5MltzzumRQmkWzdOjsVjUmMuDzoN
	 O4kvBwCc6UWxfvGNBfFByeKlcF42ZYaTKlmw7QOB9QzusFHhTAHmPbJgihf2bz6FXW6el
	 dwulndaespsSdpefV5SaxnNhHLm3Ouom6wK5wXCEtLriAx6ZSfdEJvQGaH75GiYAbOW0z
	 tgLXH93bjyjEDAwhnAt9sLh9pIYw8jjIT5tvL+zMsH7JMibXGfyKgxIt0IfSqMD5E+7/s
	 5po+mMXeXB5YC7J3F379UKrujK/geNCXvjMC/O+K8uzaxhXsWLX7bvBv8wRD4jWzEKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263900;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Gu64q4Vrpm6v33wr+KjZ/SbqqwGqHiw0oJu04YH4us4=;
	b=D/0iTCeEL3hlbPN/qa5snMiae5/eXtX6MxZuivN+kqT8AVvHUCBcvzE1Kv4POLn8l6jc
	 xt+8sVW7/LMeVD/JeCaII21Qjc80vdCK0xkwp3NLJpgAZCYW30dTL0tnOwld0cGR0zsE3
	 9k6JtbNpE7+wrZZsWYQKT0ldUtqeWd6s+dJ9mbrvZhKlgWMOxB5b615O/ka4L2xeyvdTq
	 rQdBFACnt8T3uWtc6qZBIdnlLcP/fJEwjgO6vLLLpmcFO7jbV2kGCinUW1B2tMKGYFQAi
	 Q4HHGgayD3j4qc11cKab/HvuKi+uUcb6go6bOkXywJGJ9bw/5fs52UpWx5RNtW0rPYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eT4oPxLq;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C661606A32A
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 08:51:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C661606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eT4oPxLq
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e8246b13cbso15951775ad.2
        for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 01:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793263899; x=1793868699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gu64q4Vrpm6v33wr+KjZ/SbqqwGqHiw0oJu04YH4us4=;
        b=eT4oPxLqJt0vehLbTNIH2mhmtt+2Mwa7maTZ2MZYEysHOZHfx5anz0cPd570qdx5RX
         LBh4uwduRem7viRFsTbi3VkcCj72ljudHtTDE8gNgBaQx2PcsnUmEJvVxn4EXXt0WyrI
         Jn3r1xMk1ZFIrwoGQ45oHBbhzS8QDnOVAvpojZgd+pFC/8HB19cXvK1grSkKr+buLQKQ
         1IQx68g+3oQzixPWGOAk7RAXjYfjATfxBjRMgAM/APOI/CM/yilqLy6QebXX6yY8D776
         CmQAOyIVDc1JnFszVerhjlXIePvlntBiEk0uLSeJo+RY0BBD9oCYiH7Fl176DY3YUES1
         OqOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793263899; x=1793868699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gu64q4Vrpm6v33wr+KjZ/SbqqwGqHiw0oJu04YH4us4=;
        b=VEgXh7q7YJglwI3+whlRASjbFO+wim+QLbyEvi4t9ZtpRyl43mUDdtitUg5C7PbvuS
         AabdhYbIcK8Sy5utUvoONrhFiX8V36UHDY1Rvgc9laccyFIYn2lgLtP7rptd4ZtYD9Ap
         pA1eeLk8IHfCd4+ZwOLR2g/ZeM5XUcCYnjZUSYaUn44m6kAtDw86uazms6RARyficTJF
         vbo5b0GcKpogTSvWLKxd5wcSpEL6XlxqeNYCpEZ+VSVZV8rmdYHsN1Ts8a5yWp1PNgpM
         BWIS776+Q9uZgZhtF8/rLAAHakqkAJcLxO7tLZRbPEEX+NgKK6Ah5uzPkWl11OIm3i81
         jAmg==
X-Gm-Message-State: AFq9FYKHMTB0DnMU60raFM/jbt5Rw5KIqPmA/D9qdchvVF70jPVsvgAX
	GLrgcK5tNiJ7mwAEypnlYmTAu838h6XFvYSklwyUPmY4G3cD6a7Ihe7V5+qCAw==
X-Gm-Gg: AYBFou0py5MBKzaO/xFmDvrTWUAcC/bzjnRCRI3slzmIeObsPlwhOq5snTZZLyjJF5R
	SB4oYyxAE4e7mYNY1Q4+s9VnSr3MhG+Alen2C8Jgo0RLVp/Y+Aybjnw4mN/Nl7yFBALUxdhkDSg
	ViNsvFjG3Gdn23csU6BaWiY8BVAfdN1L1JIMQaroJ64RxFwdHbyvkrsySR2zfUO3k9esDpMXX2h
	A++sI/xwjiCy9hA6IF7EgxbmU7VeY9EHhNXnSlkw3T2+3M4DhgdbDjel3lMDqBeTOB9uqZ2uQ2g
	kdkwxMdhrob7So386JvDWD3l6+6Bvay9HVObi7lyRPE9cmrzTTBJZBpjh6PA+LFusSaM7UhH2PF
	u+JBwuVQ5K+CeOz3KcNAAjXFa5lwTQGM4xxkSpT1/R1jvF1GGPsWg7IoU5lrWPTIadJXL2kxxsO
	GrspFrqgwgPn1mR7zYo24CcmkRxdQwirCzXpyRwkP0QQGk9KfkXQY9hirWI97N76TUKokH2truR
	dV2L8EIf3Tk8T9pQjl3XSl2JWaBrztfB7R5DpVTK/HYRz1W14WB0TZIqWWop/757tk1w136niWF
	hpR7l3eZbGMRgb84YfkY7oh6mSQMmc7bVj/lhrdVUroQumS4WTadsI9n+uC86NDCtcqehESJ/S+
	Wc4kKwrnjGqzkJ8ZGkM4+nx+/G80Z72u2wsgPNAJW/A==
X-Received: by 2002:a17:902:e80b:b0:2e9:5829:9b41 with SMTP id d9443c01a7336-2eb0041f925mr46273925ad.37.1793263899253;
        Thu, 29 Oct 2026 01:51:39 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6bddae0sm29991205ad.35.2026.10.29.01.51.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 01:51:37 -0700 (PDT)
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
Subject: [PATCH v9 13/14] ALSA: virtio: synchronize staged capture accounting during RESET
Date: Thu, 29 Oct 2026 17:50:31 +0900
Message-ID: <20261029085032.70689-14-mynameisjune111@gmail.com>
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

Use the locked PCM reset operation for staged capture. Reclaim RX space
at the same locked pointer observation used by the common reset and keep
completions arriving after that observation. Rebase the notified-period
counter there to avoid replaying old period notifications.

After common pointer mutation, finish the matching core rebase even if
refill fails. Latch XRUN and schedule notification. RESET can return zero
before the asynchronous error is visible; userspace still needs ordinary
XRUN recovery. A nonblocking read can initially return -EAGAIN and later
-EPIPE. This avoids leaving core and driver positions partly rebased.

A forced 90 ms RX interval reproduced -EPIPE with the earlier accounting.
The corrected sequence matched the next 48,000 deterministic frames and
passed reopen. Linked RESET and prepare partial-failure fixtures also
passed with atomic and nonatomic stream locking.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
--- a/sound/virtio/virtio_pcm_ops.c
+++ b/sound/virtio/virtio_pcm_ops.c
@@ -9,6 +9,7 @@
 
 #include "virtio_card.h"
 
+static const struct snd_pcm_ops virtsnd_pcm_capture_staged_ops;
 
 bool virtsnd_capture_staging;
 module_param_named(capture_staging, virtsnd_capture_staging, bool, 0444);
@@ -392,6 +393,10 @@
 		}
 	}
 
+	/* Keep RESET operation selection fixed for the opened runtime. */
+	substream->ops = vss->capture_staging ?
+		&virtsnd_pcm_capture_staged_ops :
+		&virtsnd_pcm_ops[substream->stream];
 
 	snd_pcm_hw_constraint_integer(substream->runtime,
 				      SNDRV_PCM_HW_PARAM_PERIODS);
@@ -1686,6 +1691,61 @@
 			return 0;
 	}
 	return virtsnd_pcm_sync_stop_locked(substream);
+}
+
+/* The core holds the stream lock through the matching appl_ptr reset. */
+static int virtsnd_pcm_reset(struct snd_pcm_substream *substream)
+{
+	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct virtio_snd_queue *queue = virtsnd_pcm_queue(vss);
+	size_t position;
+	size_t period;
+	int rc;
+
+	/* Reclaim RX space atomically with the pointer observation. */
+	scoped_guard(spinlock_irqsave, &vss->lock)
+		vss->capture_reset_observing = true;
+	rc = snd_pcm_lib_reset(substream);
+	scoped_guard(spinlock_irqsave, &vss->lock)
+		vss->capture_reset_observing = false;
+	if (rc || !vss->capture_staging)
+		return rc;
+
+	guard(spinlock_irqsave)(&queue->lock);
+	guard(spinlock)(&vss->lock);
+	if (vss->resetting)
+		return 0;
+	/* The common reset has already handled a pointer-reported XRUN. */
+	if (vss->xfer_xrun)
+		return 0;
+	if (snd_pcm_running(substream)) {
+		/* Keep completions arriving after the core's pointer observation. */
+		vss->capture_acked_total = vss->capture_pointer_seen_total;
+		vss->capture_ready = vss->capture_free_running ? 0 :
+			vss->capture_copied_total - vss->capture_acked_total;
+	} else {
+		position = frames_to_bytes(runtime, runtime->status->hw_ptr);
+		vss->hw_ptr = position;
+		period = snd_pcm_lib_period_bytes(substream);
+		vss->capture_copied_total = position;
+		vss->capture_acked_total = position;
+		vss->capture_pointer_seen_total = position;
+		vss->capture_ready = 0;
+		vss->capture_notified_periods = period ? position / period : 0;
+	}
+	vss->capture_callback_snapshot = 0;
+	vss->capture_callback_snapshot_active = false;
+	vss->pcm_indirect.appl_ptr = runtime->status->hw_ptr;
+	if (snd_pcm_running(substream) && vss->xfer_enabled && vss->prepared) {
+		rc = virtsnd_pcm_capture_send(vss);
+		if (rc) {
+			vss->xfer_xrun = true;
+			virtsnd_pcm_schedule_period_elapsed(vss);
+		}
+	}
+	/* Complete the matching core pointer rebase before reporting XRUN. */
+	return 0;
 }
 
 /* PCM substream operators map. */
@@ -1715,3 +1775,18 @@
 		.ack = virtsnd_pcm_cp_ack,
 	},
 };
+
+/* Selected at open; the staging policy remains fixed for that runtime. */
+static const struct snd_pcm_ops virtsnd_pcm_capture_staged_ops = {
+	.open = virtsnd_pcm_open,
+	.close = virtsnd_pcm_close,
+	.ioctl = snd_pcm_lib_ioctl,
+	.reset = virtsnd_pcm_reset,
+	.hw_params = virtsnd_pcm_hw_params,
+	.hw_free = virtsnd_pcm_hw_free,
+	.prepare = virtsnd_pcm_prepare,
+	.trigger = virtsnd_pcm_trigger,
+	.sync_stop = virtsnd_pcm_sync_stop,
+	.pointer = virtsnd_pcm_cp_pointer,
+	.ack = virtsnd_pcm_cp_ack,
+};
