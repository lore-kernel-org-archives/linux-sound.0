Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793412581;
	b=Y8Kn3rrJO6AoQcdQHnppgcC5evk166Ap+qga4y+vIJbOy5dnq99KSDyBXc+IWs7TF1qw
	 2L/4QexZEVvie3DikrnopKG86W5OoYl/tKIU2LK7ojv5K6rFMLE0GtRSIHzoiIy/0xrlB
	 LyZQdY/etkTAs0bz9X6Ej16wGKARUP+SXpteCd5sMqWS8Cv6yu+ZhB5vXeIJ3OXsjQcns
	 9AbapWVp0M0sKLpdcbdfDsvI9BdLkrfJu9edvuSjXmWrUnwdl7KLM7Jqq/lmX9lINnwDk
	 Xo6rmA2tccaEDH1pWZQQlCIIJiKWfZdpH23NiAeFN9DjigzSsmEgJn7gCjzr8xVlSiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793412581;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kYTuX92aRtCeYi/y6rrhsUUqGJaj+xMsdosIKAjJqSI=;
	b=CxWSrPoAHirKs1AQracp4HZJWOmozeMeXFm8CjLN1e21KJoQsDMbkBYaRseMZWEuS+tj
	 STLegnHvP2Q6RCQNsW8POocPRjrfH9riz6SFlw3C6U9tuT+S7BAcpJqWs0XGqlPaEC8c1
	 PXrg44/G95MoU5hiudfPQ2jBF9yFJAd2wionRmYCMbNwVHAAYywSV5BK7LF+TFhgk0qUK
	 b/Z1x67Xfan6MM0tSf4a3ZMhrWz8xkSrtKd8gBMWJ/yHDLhc4oCb+fFUPXPi4o7RN4tjq
	 tyTmf07tCmlKFHqF45+D5ScSlN6Zqzx5hO/pUgrmH5yGHl1igNFUIJV3cO8rnVpMz2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YxHznL4+;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E333606A32E
	for <linux-sound@vger.kernel.org>; Sat, 31 Oct 2026 02:09:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E333606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YxHznL4+
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so2259914eec.1
        for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 19:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793412581; x=1794017381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kYTuX92aRtCeYi/y6rrhsUUqGJaj+xMsdosIKAjJqSI=;
        b=YxHznL4+CQ7T4IB8HqRCNk75YaeuOEr3YNpuKxQF/0QAR9uFN80NdijMt5RiPn8VZV
         K6RhZizjkhfrWegwudzHA1UjWlRghIZx3Tdznjo6nObzYxHX49YARfoOKVr6lmN9NWOm
         zYJY7ZnaOHkkxoDmSMPS7V3Ekq4eti0ISNuoYXG2UjnPxI2GJusCx4g+h/tzKSPf7aWn
         zR+KRGdZlznmNqwnesjkZCyBfKWUnSc+2vdhXJklG6dBOWUbFDT2w/+yTqPcJtz9O58y
         VKnSxedeQe7TDFYVSqS8OM1dEjDGlITTVc+bk/PP7LezKoszOKIb5PPTGVkX0hMTLh45
         9Rqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793412581; x=1794017381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kYTuX92aRtCeYi/y6rrhsUUqGJaj+xMsdosIKAjJqSI=;
        b=oQb65fFCnhejvSjDGUELgzKkVjxZsthkDsar7WzjHFLjx5QzprkUXwFiRULQBHuNK3
         3OUUxa/Ym6T3+k8yBmQfoFXYm3GP72a0z0p10UfGk0dBBu49GVcCZQT1W9xAgH/3OkC7
         zLl742lHoFlKDe9ceQQAhtcW2Ci7BxTVU7gpdvBwn1M1gS6mv6DiSzgq9C+cg6YiVvEq
         h3oYX8iHqRcEqWkoD60oQXMM9+hHuhDCG2WcO7hn75kdSeoSl6Zi6sqOlM6QlROBmG1x
         RfoiStr4dbXZ+CET68+F4XPVi/90bGjk5fpi5d0d+8YnFvAQ+TeMO5UanKaK7p+Uqp9V
         kbVg==
X-Gm-Message-State: AFq9FYJPNU6mN8/OrvCox1sbxJS0u31/NdIV0WsMhQGZlx6/yJefOMpD
	+yPt8atnTssB+t3+UOax+dJmUmlyEREwkpFighJJqo3XGiu6/Uy7/RUMCCLq+IiM
X-Gm-Gg: AYBFou1xmmLzbqK7XVVEPsVE+VnZkvTSIVcQNewKvyqwI58X5HGYxDBmF6ylUAQsmAO
	kJbEz4kXu3ez/9PykQBG8CpnOkq+PUoR0NVZOx2n5lMlbybmCNbKjPrryBAEuwCNGZgYBQ81lkb
	In5ZsEA/ImcYY3OMog+rUagx0qFRL46pzLFjFZaOntUulpLzik1Ovt5BimMaAmXV/3af2TB4kUt
	Bka+YIdcozaoDpNrh75YowZ3hoAliaCBuPRZ6h5sY2FYBIz8ivsuVho8aRehKoHkQA5fjqFpEvy
	iaF4K++o+Wz82DNC14K+5k6WvtqFnxQe1M02b+AHn2Qozw7u75526pd+FcEeIQP9Rod8mXDVwFq
	oX411SyYM8gr8bB5rhUQuOzJ+bCWHPA+juVAcf4bvP9kxwYGQh3Xa0SwjGensML/hkpqHgL2FVs
	w7dOHhN8eRpbzlvDS7742+RS7bpJKNEz7mgZc9W8N4CYsNeeW/R0wu0PAt/oPj2zItDnpea/P6s
	JSrpp+3JOcdZtA/4K2DLI7x7vJ9/3a/1crNDUm8dRwDN/ZOGD3rP3nkVz4djXrWZD59hFRMSjIM
	XADM/WpzuvWbJs7SocNHgYux4XCK7PAwp+vejHG5E3X4JCTrpb2sJ3Yfbuu4GQ66D8Tkdapq7Xf
	IaLADGC9FIbeM8EX8wsBvIPzrwsjdKK+LjTHzrHvqw8MrjbJpEAdY7nv5dPvlX3Qb0fg=
X-Received: by 2002:a05:7300:a188:b0:35f:4780:518e with SMTP id 5a478bee46e88-36a4238996bmr9338075eec.16.1793412580547;
        Fri, 30 Oct 2026 19:09:40 -0700 (PDT)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm13214096eec.26.2026.10.30.19.09.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 30 Oct 2026 19:09:40 -0700 (PDT)
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
Subject: [PATCH v11 13/14] ALSA: virtio: synchronize staged capture accounting during RESET
Date: Sat, 31 Oct 2026 11:08:54 +0900
Message-ID: <20261031020855.2402-14-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261031020855.2402-1-mynameisjune111@gmail.com>
References: <20261031020855.2402-1-mynameisjune111@gmail.com>
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
@@ -1754,6 +1759,61 @@
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
@@ -1783,3 +1843,18 @@
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
