Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793412585;
	b=PvpcXHSM++XmbL3YYPrqxywgTeIERgyk7CMImB1i7sICB5H32VWAwpCf/V3m0qdZDmDX
	 kT0yGBNsT8uSJdQgeXclyyh55wFf5JjktusC9rJTf+ZQN2HgmCQb1iFqQqJE0QG4VAVfC
	 S6GaPDmZcYzJVvP4p+jy5Jhn3XZXKnqqsO6YqWANzSXSBV2l61K1DkpWOm/ezJ7hIxiJh
	 qbtQbBvk1eObDzP/siSMtVrY+n6jOx7bbG0WOWyKoc57xNWA92ic80O190atzo8tSD52T
	 KLcb0lOEiv3dy5Ax8MmPrsc/A9+8gt2rYxdU6MucQHo2+N1ihwfr2SOyAhlXeHBsQcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793412585;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bhNDjqO9TvYmvioIqiGGiLqz7fELlYmLdRUXFsLMln0=;
	b=WBg/+n/pCLN96uK9etbMcJSEoogU5Ik6mZ1w3MmNQ2+2ysaDuhw87Q5BxzOFZz70yVm6
	 XsHOMzMPuCPvTgQ1gK9HH39T9bknhsU6oLdT6IvFkHlp0aY+XP64+S9jnXJQEakKCqsp5
	 k9JtE2J8wy5LM02XMg2BIPzYGgNFXgULxsEeeCMWpQwTu/MY38AnuLrO+xk+buMjSWucJ
	 x6eTcTjFobOJ/+QBPQVTWeDRY109ejZB2ul5anhgKNiPyhY9RGzxDeSKOP9+FbIy8ii2b
	 9hBhSJqx3ZaFAuoWTwqmuACenK3WWiZGytpJDQrT3WgDNvb/beOVCMpdhsA9hE1YwAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fTzwE4Pn;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A1D606A325
	for <linux-sound@vger.kernel.org>; Sat, 31 Oct 2026 02:09:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6A1D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fTzwE4Pn
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-35829219da8so2817917eec.0
        for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 19:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793412584; x=1794017384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bhNDjqO9TvYmvioIqiGGiLqz7fELlYmLdRUXFsLMln0=;
        b=fTzwE4PngQGwqpMMBgHBcuhmnZjg+XDzOwJDz9S1QXEU0GYPdBLQCsc6j9wD1WbV/X
         OnPLrQbh267GoEuCi9p+qs3zw64R0ZZeVTpcTooJNtQB9uhZNb+CmtkT7HuxyJNt20e0
         aYkXGhScmaavMQiVkFVrUUiGDvC8fSxOuYq/9UkRejiXkJWzhWLlGRe4NusxSgeBKMAN
         QGMfnU07BLGjj83SnYkV0wXi7iGE8FH9qZquKk2ZGhkjfoz742ZL2pHoVnxuYz8Ojk/q
         cP28SUHP4VafQAnHWkqJFR4ldOB2EYDUen1rxX9GZgByssz54fHaO4ZLqGf1voA3v7o4
         Brpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793412584; x=1794017384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bhNDjqO9TvYmvioIqiGGiLqz7fELlYmLdRUXFsLMln0=;
        b=yrJnEHBA6fCcWb+pl/6EZt6jc1Q2Jkdma0a9vkXguQTMnu+m72c6zYNz4b1yL6zhkW
         AVCqlgPN3xj5Rzwc7B345HFp66oOl7o8eNIhc6XfnonfQC7y6pqwSKQUq7WJuFFBN48U
         v0kIBHjkhAbVbveWiVpHErz17UuQyQOsIhuiBX/e4NlvJj+KZpK/7TAIesGWdMy4JY1o
         rdWpsqXzpj+2kTXTQoHxiuC3Enuj4b6okCr5aBWyHyYDILcUbSljv+JCOEqxHQb62Zbn
         Xzof2CqqhYF1KeCIe81ktJKfxlZSCYKOZ5XsT30XeGi/uNA0XbVUSFrO/NIhhxWggHqi
         RFPw==
X-Gm-Message-State: AFq9FYJg80iZfPhmVB1sSpImIUNjOo4KGZaAsifYfc2mwepF8ifsP7BW
	qRF/YQlBa4QDf4ZCjHBXdWNetZjBtzG2p8Fw0+ONlwTBZOvYFzffJDbZ9neEI6vY
X-Gm-Gg: AYBFou2anfD5EAeV2hcPI2l6CWkIxvuf9hqLgmiNHllw8/0Nplv8s8bCkFx4DommkaM
	lUcpClJWF+LorPWnchq8IDwm1MUb7NviwsLWtwtpfcuZY/bV1TNf4Iekk9vSj1JbFkuiwsDomvk
	x1IAnnW2jQbyLFPTMvqU3VpulYVsndfTpdzMzzmRgHPkklEtEdIGT3yTRG84ipFWVj0gjh9Eehu
	Dtq84M+k24lDrn6ET5YgPx3y30+0QYksuOJQXjvvIY6p7agJH3MdiCID8hfwRciFDgqFIj+Tagy
	Jx1jo0Hg/NBbhbYcx7m9fCMJhsb/72q5pTGuTZ9xlfTbJEXI9N+ZX5mgP6tL2H9T30eNo7sZ1iQ
	FEgjtboMN29zxjxF5V6vcu0/0tMJqYRb3IYT9OCqCza843hEY5hHYxRJysNQuk5VzgYzuR0VSOu
	ZWnLtxjOsW5wc7T23zjusc2aLAkpSIevvwebQjC31Ukikenc+PIgyLM5Aq/J/HmFBk6ukS2UUtZ
	RZekzE8yqB2nAbrTeimSDBjXcGdX992MlalwIitfQNpR8U4QH/NaBBvsJQx0HCNdoJfy8lNeRHU
	b+LV+d7tuv/P5OaSAfmIXn5MP5eMVPAALaJb0EwxulUFY+MmKIiARbxf97mLv5B+uEg8Rrt9jqP
	7lXCsqtzccBKcfEInxayrDaGtbA4MSTxqqo7xj9HKGEwnoA==
X-Received: by 2002:a05:693c:4088:b0:36a:2f6c:490e with SMTP id 5a478bee46e88-36a30009ecemr10595948eec.6.1793412583676;
        Fri, 30 Oct 2026 19:09:43 -0700 (PDT)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm13214096eec.26.2026.10.30.19.09.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 30 Oct 2026 19:09:43 -0700 (PDT)
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
Subject: [PATCH v11 14/14] ALSA: virtio: rebase ordinary capture accounting on RESET
Date: Sat, 31 Oct 2026 11:08:55 +0900
Message-ID: <20261031020855.2402-15-mynameisjune111@gmail.com>
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

Ordinary capture's indirect positions must follow the common RESET
observation while preserving the device's fixed DMA ring offsets. Select
its reset callback at open alongside the staged capture callback.

Suppress nested ACK refills during snd_pcm_lib_reset(). For paused
capture, hold the RX queue and substream locks while checking lifecycle
state and observing the latest completed position. Update a local copy
of the indirect state, return discarded RX space, and commit on success.
This also keeps the observation boundary consistent with a late RX
completion. Data arriving after the committed observation remains unread.

Honor an existing XRUN before changing private paused accounting or
refilling descriptors. On a refill failure, retain the error and complete
the core rebase; the worker then reports XRUN. RESET can return zero while
the error notification is pending. Prepare or reopen recovers the stream.
Device reset suppresses fresh notifications until a usable queue exists.

Set the ordinary notification floor to the RESET observation so queued
work cannot report a discarded period as new progress. Native resume
preserves the RX ring ownership established by the earlier patches.

Fault tests covered late completions, existing XRUN, nested refill and
refill failures with recovery and reopen. Ordinary and staged 70-second
RW and MMAP captures matched the deterministic sequence, including
PAUSE, RESET, resume and the intended discard boundary. The paused
interleaving test verifies the atomic observation boundary; it does not
establish sample loss in the original implementation.

Link: https://sashiko.dev/#/patchset/20261030052629.27742-1-mynameisjune111%40gmail.com?part=14
Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -76,6 +76,8 @@
  * @release_required: Successful PREPARE still needs a successful RELEASE.
  * @control_uncertain: Native control result requires device reset before reuse.
  * @capture_reset_observing: Reclaim staged samples during RESET pointer capture.
+ * @indirect_reset_observing: Suppress ordinary ACK refill during RESET pointer
+ *                            capture; protected by the PCM stream lock.
  * @suspended: True if the substream is suspended and must be reconfigured on
  *             the device side at resume.
  * @pause_restart_state: Device-side state for opt-in pause compatibility.
@@ -127,6 +129,7 @@
 	bool release_required;
 	bool control_uncertain;
 	bool capture_reset_observing;
+	bool indirect_reset_observing;
 	bool suspended;
 	enum virtio_pcm_pause_restart_state pause_restart_state;
 	struct virtio_pcm_msg **msgs;
diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
--- a/sound/virtio/virtio_pcm_ops.c
+++ b/sound/virtio/virtio_pcm_ops.c
@@ -10,6 +10,7 @@
 #include "virtio_card.h"
 
 static const struct snd_pcm_ops virtsnd_pcm_capture_staged_ops;
+static const struct snd_pcm_ops virtsnd_pcm_capture_indirect_ops;
 
 bool virtsnd_capture_staging;
 module_param_named(capture_staging, virtsnd_capture_staging, bool, 0444);
@@ -398,6 +399,9 @@
 		&virtsnd_pcm_capture_staged_ops :
 		&virtsnd_pcm_ops[substream->stream];
 
+	if (vss->direction == SNDRV_PCM_STREAM_CAPTURE && !vss->capture_staging)
+		substream->ops = &virtsnd_pcm_capture_indirect_ops;
+
 	snd_pcm_hw_constraint_integer(substream->runtime,
 				      SNDRV_PCM_HW_PARAM_PERIODS);
 
@@ -1724,9 +1728,13 @@
  */
 static int virtsnd_pcm_cp_ack(struct snd_pcm_substream *substream)
 {
+	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	int rc;
 
+	/* RESET observes the pointer before returning discarded RX space. */
+	if (vss->indirect_reset_observing)
+		return 0;
 	if (!mutex_trylock(&runtime->buffer_mutex))
 		return -EBADFD;
 	rc = virtsnd_pcm_cp_ack_locked(substream);
@@ -1759,6 +1767,89 @@
 			return 0;
 	}
 	return virtsnd_pcm_sync_stop_locked(substream);
+}
+
+/*
+ * The PCM lock covers indirect accounting and core completion. Once lib_reset
+ * changes hw_ptr, complete the core rebase even if refilling fails. The latched
+ * XRUN rejects subsequent pointer/ACK operations; the worker publishes XRUN to
+ * paused streams too. RESET success therefore does not imply stream recovery.
+ */
+static int virtsnd_pcm_indirect_reset(struct snd_pcm_substream *substream)
+{
+	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct virtio_snd_queue *queue = virtsnd_pcm_queue(vss);
+	struct virtsnd_pcm_transfer transfer = {};
+	snd_pcm_uframes_t paused_ptr = 0;
+	bool paused = runtime->state == SNDRV_PCM_STATE_PAUSED;
+	int rc;
+
+	/* Only PCM-locked callbacks access this observation flag. */
+	vss->indirect_reset_observing = true;
+	rc = snd_pcm_lib_reset(substream);
+	vss->indirect_reset_observing = false;
+	if (rc)
+		return rc;
+	guard(spinlock_irqsave)(&queue->lock);
+	guard(spinlock)(&vss->lock);
+	if (vss->resetting)
+		return 0;
+	if (vss->xfer_xrun) {
+		virtsnd_pcm_transfer_failed(vss);
+		virtsnd_pcm_schedule_period_elapsed(vss);
+		return 0;
+	}
+	if (!snd_pcm_running(substream) && !paused)
+		return 0;
+	if (!vss->prepared || vss->stopped) {
+		virtsnd_pcm_transfer_failed(vss);
+		vss->xfer_xrun = true;
+		virtsnd_pcm_schedule_period_elapsed(vss);
+		return 0;
+	}
+
+	transfer.indirect = vss->pcm_indirect;
+	if (paused) {
+		/* Observe and reclaim paused completions in one queue transaction. */
+		vss->capture_pointer_seen_total = vss->capture_copied_total;
+		vss->indirect_reset_observing = true;
+		paused_ptr = snd_pcm_indirect_capture_pointer(substream,
+							      &transfer.indirect, vss->hw_ptr);
+		vss->indirect_reset_observing = false;
+		if (paused_ptr == SNDRV_PCM_POS_XRUN) {
+			virtsnd_pcm_transfer_failed(vss);
+			vss->xfer_xrun = true;
+			virtsnd_pcm_schedule_period_elapsed(vss);
+			return 0;
+		}
+		runtime->status->hw_ptr = paused_ptr;
+	}
+	transfer.indirect.sw_ready = 0;
+	/* Consume no application delta while returning discarded RX space. */
+	transfer.indirect.appl_ptr = runtime->control->appl_ptr;
+	rc = snd_pcm_indirect_capture_transfer(substream, &transfer.indirect,
+					       virtsnd_pcm_trans_copy);
+	if (!rc)
+		rc = transfer.error;
+	if (rc) {
+		virtsnd_pcm_transfer_failed(vss);
+		vss->xfer_xrun = true;
+		virtsnd_pcm_schedule_period_elapsed(vss);
+		return 0;
+	}
+
+	/* RESET discards all samples through the observed software pointer. */
+	transfer.indirect.sw_ready = 0;
+	transfer.indirect.appl_ptr = runtime->status->hw_ptr;
+	vss->pcm_indirect = transfer.indirect;
+	{
+		size_t period = snd_pcm_lib_period_bytes(substream);
+
+		vss->capture_notified_periods = period ?
+			div64_ul(vss->capture_pointer_seen_total, period) : 0;
+	}
+	return 0;
 }
 
 /* The core holds the stream lock through the matching appl_ptr reset. */
@@ -1858,3 +1949,17 @@
 	.pointer = virtsnd_pcm_cp_pointer,
 	.ack = virtsnd_pcm_cp_ack,
 };
+
+static const struct snd_pcm_ops virtsnd_pcm_capture_indirect_ops = {
+	.open = virtsnd_pcm_open,
+	.close = virtsnd_pcm_close,
+	.ioctl = snd_pcm_lib_ioctl,
+	.reset = virtsnd_pcm_indirect_reset,
+	.hw_params = virtsnd_pcm_hw_params,
+	.hw_free = virtsnd_pcm_hw_free,
+	.prepare = virtsnd_pcm_prepare,
+	.trigger = virtsnd_pcm_trigger,
+	.sync_stop = virtsnd_pcm_sync_stop,
+	.pointer = virtsnd_pcm_cp_pointer,
+	.ack = virtsnd_pcm_cp_ack,
+};
