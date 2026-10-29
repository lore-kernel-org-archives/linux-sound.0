Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793252692;
	b=tlXNRsqx/XdaQoC0dmunbGmEGPj3B5ortDr3ZIkUgdL7MTB2QZumT7B9WzW9wlR+cDhE
	 TLH4Rj7qdLDoHbczmh0SSvu3jacwnrfPPXjgak+O143JK/GbuzxFp5N8/wtOFJgPluBcg
	 6cQVfwMWrK3PZhFMlDJPxXrnGwa5UK+vxP5ZRwC9q6mGunLlHsXywZihrQE7bt1riWIji
	 ySwD1rAIf14jyXwzV7v+bn5WP6zhL3tP5cM43HsjlGBtagRO3OOrPchVzCJ/1Q98Dw3Ec
	 jotE2kZzHNG86fJJ5zA7KXoGV6cLsthHF+fAQF07yIV/R2lEBSlujTzddifPzVgILrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793252692;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=H28URnKyaN7/kOHJ43ygrA1xfHZ+j0XXEmbGM+MQsbE=;
	b=21b+5U44hnGE9Q+xJC9DkBVfakZTgKty8TAIHIAeGXAYSQybMMooY7y5bL0KKuMReFU1
	 RR/fCDWasHdLZcYZJWnDtcL4kZD7xnhs9KuEWyPZd3lW5vjZOfKWWFbzQ7KpaWeCXpPQU
	 cHtSIyNNkDDF31pxeRb0tEGh72dJYqiCrOD0tc9L8l1LXOLQhRCE50XnpolrqQDvOT8bX
	 LhJdxbKManOZbuj6CNOmRub1uNM4FgqsktVBhHf5ykS/KpbRKvSyWM4QPBvHXTztOsV8t
	 jEbfi79JTQkXZtF7iJJIoLW2jVWetN0vpPia4vtL8fJ3tu7pxVM46HqDMxbM7fyB0TQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LPyag5FX;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C75606A31A
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 05:44:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62C75606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LPyag5FX
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e812e2b31bso10215425ad.3
        for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 22:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793252692; x=1793857492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H28URnKyaN7/kOHJ43ygrA1xfHZ+j0XXEmbGM+MQsbE=;
        b=LPyag5FXfsJXD7Pr3YwWSeFXBaO4vo5BGXYim41xQTRUTv3MGTNhcKh0M9ws/mMwUC
         V95zS85DqADTkxTYw3Une4Tqw/WJ5uwfc+B4IqAQgrS0sFiF1qrOPs1JkJkT46+2wmIh
         8oA4pYZCMRMGGxUuUN0GUAE5mLb856aXVtjGUvnjgvXOmGkxnVs49C4H/8vgUI3mnfox
         RPjSNittzqgP74TxGoNy4OmGAvi88DUPTg9CamUAQhdk1k/2lfMaOdFf9IMp4IPovfkj
         JZaJ798Rg17+LVTU3QyxELpDKlAfzYvE4lE1UEPnNsZ8gviVZRda+a96z9VxfPRSxOfZ
         flig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793252692; x=1793857492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H28URnKyaN7/kOHJ43ygrA1xfHZ+j0XXEmbGM+MQsbE=;
        b=i4wO3d7mxB1cSB3I4qKNQmkZ9kRdfGMjyp3ejlsXt3dDje74VASBxZ2wllT+Agc0iX
         MMHzIlQhs5q3U+aRSUSdWRRHOx5QMXJAtrXvP+JSXelueLChZo1wag26aROErtDGZmPZ
         bw6mzxeyntY1eFx8uPISZozeuU0B3Hv+P9KG/nhFnbSgNC0y2R8Deq8KCLBwfJXjgFeU
         UNSL2yLasvTtz4mU1o+R01gbr5fej+wgKIq6Kq/oTjpUkOdkgV2Fa8WQd4Ko3AeoCpm6
         OqvbaaLa0C/5XB832KA/CkkL7pEapLncH2ywGYYGEI5INGunaxzK3qgT46Q7FuTbshKi
         Fq3w==
X-Gm-Message-State: AFq9FYJ0pJJthM7Zxsj3A/lzefuyBa66gnhLYineqvSiXigMz8tVgzZV
	QwdQ7EhXL+bzFzvALHjfUXHlEI5gCWfuAlfK2aUwPINxJ+8e1keznrOOwU/Z4w==
X-Gm-Gg: AYBFou0TkmHLRB7CbJnNr94WXJcfUug0WtTyaCCx/IcBPyk9JnifHEtOGBtICZbgNMT
	Ijzfv9b5B9ncRTGbosR4QPJV9rgK8XhPZ47+8wqpehKCd3ms5xZJe+fmSl0z/jYc7qTVAU4N4oI
	OjrnhFL4e+tqYdEauy7nZlaPCoaRbtZd6FZ0Za1GLJsFLuUlvdyHGfqJG20OG3LAtaxkuyne1jC
	mbzLtG2dov/fI1edWAovxj//JIZ6TQavPo/gqh4cyoOmeQR0RU4m/L1s6bw926BofS/euSnNC0o
	zaVw7PXkzB5vwoV47iS1qg4FvZ3vMDgn3ckBqHK1SbY4DW9b/wH6qVYYiyu8TUHDo8+xQCLISC9
	nJmtqZtjmn2YdmCXf7vV3oDJ3vQwebbEsAQHH1awCCAaZXJPWGL1z0v/0M1bhyT1MtGsxrgWyti
	32cB4MFeeF3ULeQeKFD1Kt1vGX8zSvxjjYr8B3Mtk+Hu39XNahcNR91c3QOU/IkB01TFyXBHLAq
	eZpfeBhbdduGTWBTbgad7iY/mx9QOjQJAdzxLFeycrm6bqCcwiCGbQSXxHUUe+clBZTaLNVmXRg
	q48AmB9yvzOlwvM02XT/Zn5KjqNQ/WEog8sOuzcENNekptb6R9lEQ2x5Z64HfCSHezdlA5NECNQ
	SyLzGKJS/ybIvNWg+NKv+JFOgLkB5WuYpu9OwwjcCjHh8w90=
X-Received: by 2002:a17:90b:28c7:b0:3ab:17b6:9a93 with SMTP id 98e67ed59e1d1-3ae58140220mr3556932a91.52.1793252691492;
        Wed, 28 Oct 2026 22:44:51 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e83127csm2433520a91.10.2026.10.28.22.44.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 22:44:51 -0700 (PDT)
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
Subject: [PATCH v8 13/14] ALSA: virtio: synchronize staged capture reset with PCM positions
Date: Thu, 29 Oct 2026 14:43:53 +0900
Message-ID: <20261029054354.2931-14-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261029054354.2931-1-mynameisjune111@gmail.com>
References: <20261029054354.2931-1-mynameisjune111@gmail.com>
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

Staged capture maintains private copied and acknowledged byte totals.
Its ioctl RESET handler cannot keep the PCM lock held until core has
rebased appl_ptr. It also rebases the copied total, which loses the
relationship to completions arriving after the pointer observation.

Select the optional PCM reset operation when opening staged capture. At
this step, ordinary capture and playback keep the legacy RESET
completion policy, including when a later linked member fails. Call the
common snd_pcm_lib_reset() before acquiring the queue and substream
locks. For a running stream, retain copied_total and advance acked_total
only to pointer_seen_total. Completions after that observation remain
readable. For other states, align the private counters with the common
reset position. The operation table stays fixed for the opened runtime.

Complete the core rebase even if refilling RX fails, then report XRUN
through the period worker. A successful RESET return therefore does not
promise a usable running stream. A device-generation cancellation can
return -ECANCELED after common pointer processing; recovery still needs
the normal prepare path.

This patch depends on the core reset operation in patch 1 and the
pending staged capture and lifecycle work described in the cover letter.

Earlier narrow-candidate ARM64 QEMU tests forced RX progress between the
pointer observation and accounting, covering two capture policies and
10, 20 and 40 ms gaps. Two 1-vCPU runs crossed the ring boundary and
matched all 3,360,000 samples over the following 70 seconds, then
reopened successfully. Intentional-loss controls were detected. KASAN
and lockdep were quiet. The current narrow candidate has not been tested
with VZ and MOTU.

The ordinary capture RESET failure remains reproducible at this step.
Patch 3 handles its indirect accounting in a separate operation.
Playback continues to use the existing ioctl RESET completion path.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
--- a/sound/virtio/virtio_pcm_ops.c
+++ b/sound/virtio/virtio_pcm_ops.c
@@ -8,6 +8,8 @@
 #include <sound/pcm_params.h>
 
 #include "virtio_card.h"
+
+static const struct snd_pcm_ops virtsnd_pcm_capture_staged_ops;
 
 bool virtsnd_capture_staging;
 module_param_named(capture_staging, virtsnd_capture_staging, bool, 0444);
@@ -387,6 +389,11 @@
 		}
 	}
 
+	/* Keep the legacy RESET completion policy outside staged capture. */
+	substream->ops = vss->capture_staging ?
+		&virtsnd_pcm_capture_staged_ops :
+		&virtsnd_pcm_ops[substream->stream];
+
 	snd_pcm_hw_constraint_integer(substream->runtime,
 				      SNDRV_PCM_HW_PARAM_PERIODS);
 
@@ -1591,6 +1598,58 @@
 	return virtsnd_pcm_sync_stop_locked(substream);
 }
 
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
+	/* Keep ALSA's pointer validation, time accounting and XRUN processing. */
+	rc = snd_pcm_lib_reset(substream);
+	if (rc || !vss->capture_staging)
+		return rc;
+
+	guard(spinlock_irqsave)(&queue->lock);
+	guard(spinlock)(&vss->lock);
+	if (vss->resetting)
+		return -ECANCELED;
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
+}
+
+/* PCM substream operators map. */
 const struct snd_pcm_ops virtsnd_pcm_ops[] = {
 	{
 		.open = virtsnd_pcm_open,
@@ -1617,3 +1676,18 @@
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
