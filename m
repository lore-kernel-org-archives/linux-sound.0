Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793338041;
	b=rBRUDfKIMGIBZiKDYqARZu+FE9ENhLsPIf3zJN2BeNlHH6RliwfE5MUSSCXyX3iZxcN9
	 1Hjk4JKQ1XAKvxF6TC1+4kG4kWFwr009diAemYA7ixRN/BTkJSOOEaY923YbcsKPk1XAD
	 pKhNMnVKxLkbbDv8ZFUD659/cNtz5fvu/uC9MIbnyyH0U5lbbCmzh7WUu84pgrnaTYBk1
	 19j0+1SiRNjw+lmmVpsNFCnNcYYbUOawNUaHCruOxA/nV+dwinDt9bcoPVVXJwTpELUs6
	 vZBNpPG+7RAhzJXJ/8x5xNI+5FpEgAUhGv+mnlG2OIO+OP3pJMlfJJW4yOxTIJRvJCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793338041;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=L+IYz8Es9Qy/f9V0V2aGa3c/aT6j+cONl3IYueQbDwE=;
	b=zaSjxDd9WleYTSA358wXQW62/jx/c2CuckEB5fXxNA37ZS6GrUKAf3zB/55D2MBL/EGw
	 HSELpA3A2SDFpLoWvIqtc33ilcwm8y5Hq/fWcxnJHsV7aC9WEUwYtggIsQjwLNZ4DCpAE
	 6gafdsrTQVfiNPNCebWH90gqXE2f0xWfYpocuXdzT6zTWQ3kaXvi+H16cRnVOPqs5JLQg
	 7laCTP/x+an1IPuvxcVT+BejkdByUciKBeW0sM/OHubiWOV9oNN9+YFJQJzxl9cAxC2HD
	 Kh489dCTp7u5KpyaBWC2aAUSO+xT7mQBGF78EfXrAioshKNIyzcZxdj0W/wZ/TuR/iA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WmMymrXa;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C8A60A2621
	for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 05:27:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37C8A60A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WmMymrXa
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3acb11973c3so257545a91.3
        for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 22:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793338040; x=1793942840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L+IYz8Es9Qy/f9V0V2aGa3c/aT6j+cONl3IYueQbDwE=;
        b=WmMymrXaoVSM0Qu0SrIO9bd78PLxmKqrPcXkQDKlfPvj8QdyKNPYYuveZ5L7r9Fmz0
         OZXf/T7ttY9ZO+UpXcQqicMeVtMcW9ATXU4DnkdgAX7AQ1Lsaz71fCyLkPsACJDBXiWA
         3sgxG9z3gRAOFSAYyZALkzH4jh/PaNPBLIwRLc5im7nNVBBsPKMIJAK/sUeCBu+ur0yf
         GkrOaHuiJ8wNhoIBybT2+oA2UDCGzZdHAsIR28s3VEQX9+9QTZ/GONOCZRSGHJU2k0I1
         7J2OYNKDAJDgiCrgDDeOa5h+S8W7TptspR5pyPBYL0p0/aIfKzFTiJK5Th/bB+Cx84j+
         u2sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793338040; x=1793942840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L+IYz8Es9Qy/f9V0V2aGa3c/aT6j+cONl3IYueQbDwE=;
        b=2ol6ZlExiBh8teqEtKT9i+pDT9QgED+cOGYdyx4NmT62h20xEiZARd+vxOZ+hEJcG3
         W/Zc3oTN1pTB2hmh3dmciKJ/zBvun+oq7vLHsuU7Ce9FsVsNqnvz9Q35+4eB5q4cWJll
         Ashf1wnyKcXIKT5vxn9aBfCPkFQyQQxK+byupMZarEaApXUtYjCp0XLH9bVe6JSNjGC0
         MrxozQidolzLd28XoT/fS13o5VhVj/RPYZVZrl+IXrbYZ71Hc3ShdFeWUqIKZHHTCARA
         LpY9j7qyqZt/kxG7r8iDy1I/ELYEIqaaoPhPhF59dSM3s6h3GdgHzrTKUzyqv94FOoCw
         h4kA==
X-Gm-Message-State: AFq9FYLK8ifFLBzE7acZ37UNEfWKPbDKmNg03+FO+xeHJPVUHIF7qzG9
	kZmep+cn1OPDa+jr3OG1+S5c3/ZfJZVJFiznXC+mwuBgMEkAoTin6SM0dXyxZg==
X-Gm-Gg: AYBFou1K3UdmW2CQPqKyhqZPLy4zTr5wjMfLvh3slHLdl1DmieXINA00yT29CU0rSMA
	nQBA+tECtdRJw0FxcSWclBuGencXGNORBnpqiWpuMQwb8tcEx+E7vv1phXCW+D4hEkx+4ARV7P+
	dZd8B2HDutq9H3BXqQQXpSK+P+IyeC1HyyJnUZdaEUAKdvxr/HloSasAonCL9cOxM4I2VMDkL1F
	etPJkqIiuLhCu48MmeSEYeLC/EshqQS6HDhFCLvcJwVBjpvnZ09TVdy5nehhDa5A+WfZSRCNiPA
	M70p+cc+A2YKzTiPeWbC3wfJK3x2uT5tQA8sF0YuNbleQyAmTXvB5Gu17DC9F/VBgTOx76SaZ5v
	3o0gn8uxhrfi+lGSgkqf4TwK07SwqZZgi+LYwoEk/po39sffusAF1ovCMeoCkciKBJDH2TPMJ0j
	UHOo2YPp6SfFMcBP5ekbonbMWXLeqYXR/KTPnQswYupo7UW/PLsGtqHV27816hGLiPm+RrCjm7G
	/t+Sg3qU6ywxu1pE1eO+HdbZPxibVT7XgWtXKRtsZw/wr+dvzzZyeorLspvEmuqULXz18blUxVd
	9h9tgAsbrJGFKonlJimjmi3zzx+YRiFYA/HGIbFctrORBLJjXJbk2A+jTT8RvSDdA6pDT397iPX
	xJj3RDiVMOmPu3GDe55KteFOow04kJDzMNwWwDFb87T+oifFExHwvjXtK/t/5UxJuy502
X-Received: by 2002:a17:90b:5830:b0:3a4:a850:6982 with SMTP id 98e67ed59e1d1-3ae89749ccfmr988542a91.26.1793338039474;
        Thu, 29 Oct 2026 22:27:19 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845429e6sm2421027a91.6.2026.10.29.22.27.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 22:27:19 -0700 (PDT)
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
Subject: [PATCH v10 13/14] ALSA: virtio: synchronize staged capture accounting during RESET
Date: Fri, 30 Oct 2026 14:26:28 +0900
Message-ID: <20261030052629.27742-14-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261030052629.27742-1-mynameisjune111@gmail.com>
References: <20261030052629.27742-1-mynameisjune111@gmail.com>
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
@@ -1731,6 +1736,61 @@
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
@@ -1760,3 +1820,18 @@
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
