Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793252696;
	b=4CTkERfydZgc5aQJQaYB2RpbpOWzV8YDUJMZXhtCHdgqr6JWPlJXKxtR1GO3TmfcYuIy
	 Pwus6NmPkeHOUhm6DJqMUsda0r7PqIlwCs9yjqW8Tm5XXI/rwG4GLKihXaQjbbwMGPaMg
	 RjXemrco8IbcZXOKZ8sAGsYYz6BblbfrFBB6U9RyJHYq4KKSOBXHJH4RPPwzut+3VuLVk
	 /HoTWI65B/CRhGYEr1uNZQexvf13bEsqx4z8knKavpfxdHVioaj2smoI8DHsQgpwtC9DY
	 29QkqpkZP6Q1gdWnJAUGcIjzb8C777QHwqirpH7K3ZaHgsZu2rev/2H6uAxXFtM/D2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793252696;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rn33wo8VGHhjpHEwoQH/m2TS1FP3dM6s2FcxZAOqUUo=;
	b=U78gxsQO9a6RHY3FlbioBVEhvBNlpkBWvZFibUH3jHA+akpexQSWpqyodd+irdQjBheA
	 bfaj+ImSKiL47X6Ex3ihU16THCWkVCe1vYjDJ1/F9GQad/HSiIsXQlJEnfs5q/aU3v6O/
	 D+UAb9Fsszfd7GoUifar2PZJ07OrHCKdTXmCMF664cBF6s/2kuQLIuYjFmS5LAFOhL0/N
	 ++dhbwN+TMJVJba/XJUPClQ3zu7R4YpE2LdYbMPz1zhrbwVA3SX6j7QH1UrxKT+cgK5gJ
	 5Z6ALHsFEO28FTXSPYLvyY3++Bbk/HjdGRqfQryuyePnEIrzDrA6l+ltI7dtpqmMOtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bockavAG;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA262606A32D
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 05:44:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA262606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bockavAG
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e8b20a899fso12009745ad.1
        for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 22:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793252695; x=1793857495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rn33wo8VGHhjpHEwoQH/m2TS1FP3dM6s2FcxZAOqUUo=;
        b=bockavAGG9CgSPhXpT2YfENGrJDsH6ZRDQ1Okk+V9fpfIdPpMzr46n+ofdHYjOKzG5
         momK4e7xeAexQ9+yhizn/9RJiSWNRYlEKgrbXspga79C2QGhyArxLwkdyBZYjWY+rt1D
         MH0FPZB1e16Nsz0ToCPPvg3xA7WNYxUcdKc+6osULL05Swa8xqJ1vCH+WnWg724eaKyl
         F3S9NKhV7ggbTWRatF/c9dcjdrXkEAiKJ0iHclD9Tv4LqE1w1CGzSihZzUUM//prc+Q3
         HndU/GOkeu69XQIuvv9JjNWfpDekQDHlsPLX0UIXXLIehqo8p8SCVgDKjNigVfSBufSr
         p12Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793252695; x=1793857495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rn33wo8VGHhjpHEwoQH/m2TS1FP3dM6s2FcxZAOqUUo=;
        b=tdEZ1qJC0Dga/kBzgN6NMDpP2FP8bi0htZeHdqTb6eDTuqH5PdssZz+HDXYHPReNTH
         Y4peR0SfYsmv+FYQWenhFGDZrALbMYR7R0p83PNxAxHQAot79hSJqxHz9wW9aWm1TEKu
         /OzdprdK0S/iC3Pn69SmqgBoKDfUY/KZ7Fpv9sa4unF5TEnFPRyqBUPscuEQFZGhEGcY
         8F4GQfJMmJbMbxsUAgNmOKW3wtWbeXgvts94ohtL+C+sDtx13YU3BYysZBcc7cyTCZ1+
         YeY2ovJZ6zqkJku3kZg3HXzGPGdiHlQPdZgAkr0WzEUTj3klZFolVRoxiXIVcba+Q9FJ
         cqEA==
X-Gm-Message-State: AFq9FYKLZylpbYZ0E9pLCLLR/vwPARyL/kJ7ufpWzSH6ye0C+AoPOs1Z
	G7pdT1Z97QS98IwnTsesDTorF57WWuRbfZLb3U2gToKQVRIyRiR01IZ1Fe//nw==
X-Gm-Gg: AYBFou1aXzXW6CwTFsLbYRnt+GtFVdZyxqEE70dfmgSpijI53CmUYPwL2zPyFv1pVgv
	ThqPX5adupSSjueyrbN1nrHlfTY1fhOA/iY3IeJrFAXQADVLppwnL07t5uFSF1HKEEIuhHnq8MJ
	HsCboKOnuDV/xC6jvNyUHBApPAcbTLasy7eV2qZ8zWU7IiQVuu+e0jXPtXwolz3BSgx+5odV9/Q
	Hkh5ur724bn1gRVK+f1jrsALq7rAj+u0ZWB66cCUXHuJjm+KkRNaUA43t73t2eHOKeJ4k2rXAvu
	Cdj8ZFwT+CGR5SckgpWPWHuWJNFPx74LbCgqGs3S2OxdiHQD4hip5onzD1Kd9awaz5kVEzy2Lqy
	9znjJMlmr8AsvwjSWHHKqgivJFqOUB426SEX+eEdseW5f8Hopm7iVlVO/E0ypDeJQVPLJ1LV4Fq
	I1ArLJhU67aemYrhL3j1dTbhZJhvTxC4m8+ycyhzrIZu0HVvpMS5zTNlUkv7V/Bd5NX/U+W5rjW
	1ngOszn0+4Dt8JleEKEMt4UScima2c4BR+/Pn/D9F1s6wqHHQIukud6HT4OCB/7iGD7iXuaqee/
	PnmiItB0RlrC/i0XX3tIhXDgkiiLxKlCJDeNs8yGq47BKcuGDTulrkTlF93zU0vcZ4lAfX3dlxf
	FuI28anoU1Rg4X0wEyRw2wnKlNM7NHUvkJAZNUNdP54xxguE=
X-Received: by 2002:a17:90a:e7d2:b0:3ad:fb12:9bf5 with SMTP id 98e67ed59e1d1-3ae583152ffmr3612053a91.62.1793252695309;
        Wed, 28 Oct 2026 22:44:55 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e83127csm2433520a91.10.2026.10.28.22.44.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 22:44:54 -0700 (PDT)
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
Subject: [PATCH v8 14/14] ALSA: virtio: synchronize indirect capture positions on reset
Date: Thu, 29 Oct 2026 14:43:54 +0900
Message-ID: <20261029054354.2931-15-mynameisjune111@gmail.com>
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

RESET rebases the PCM application position without updating the indirect
capture accounting. The next ACK can interpret that change as a backward
application move and return -EPIPE. In a QEMU reproduction, the PCM
application position changed from 24000 to 2880 frames while the private
position stayed at 24000. Both running and paused capture failed with
free-running and buffer-sized stop thresholds.

Use a separate reset operation for indirect capture. The PCM stream lock
covers the common pointer reset, private accounting and core completion.
Discard the observed unread data and return its buffer space to RX. Keep
the hardware and software ring offsets so in-flight completions continue
at their existing DMA positions. Set the private application position to
the position core will publish on completion.

A paused device retains its fixed DMA positions. Keep the observed
software ring position as the reset position in this state, instead of
making userspace read from offset zero while the device continues at a
different offset. Completions after the observation are retained.

If returning RX space fails, stop further transfers and return the
error. The caller must drop and prepare or reopen the stream after this
partial failure. The existing staged reset operation and playback are
unchanged.

This patch depends on the proposed PCM reset operation and helper in
patch 1. The series diff applies after patch 2 because both touch the
operation tables. The indirect reset implementation also applies on top
of patch 1 alone; an alternate local diff is supplied for that order.
The reproduction uses the pending virtio-snd stack with local follow-up
corrections described in the cover letter.

The earlier RW capture tests covered running and paused RESET, both stop
thresholds, a 240 ms read backlog, refill-error recovery and reopen. The
core-only plus indirect variant also passed the four RW reset cases.

Additional direct MMAP_INTERLEAVED tests used 48 kHz mono S16_LE in
ARM64 QEMU. The pre-fix running and paused cases failed after RESET with
ACK -EPIPE. All 13 fixed runs passed, including two 1-vCPU 70-second
captures, refill -ENOSPC injection, managed overrun recovery and reopen.
All 9,072,000 captured frames matched the deterministic source at their
expected positions. RESET discards observed unread data; verification
starts at the resulting position. Recovery and reopen checks start at
the device's new START position.

KASAN and lockdep reported no errors. These MMAP runs used the combined
local stack with staging disabled. Physical VZ/MOTU, other MMAP layouts,
multi-channel input and concurrent RESET between mmap_begin and
mmap_commit remain untested for this candidate.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
--- a/sound/virtio/virtio_pcm_ops.c
+++ b/sound/virtio/virtio_pcm_ops.c
@@ -10,6 +10,7 @@
 #include "virtio_card.h"
 
 static const struct snd_pcm_ops virtsnd_pcm_capture_staged_ops;
+static const struct snd_pcm_ops virtsnd_pcm_capture_indirect_ops;
 
 bool virtsnd_capture_staging;
 module_param_named(capture_staging, virtsnd_capture_staging, bool, 0444);
@@ -389,10 +390,13 @@
 		}
 	}
 
-	/* Keep the legacy RESET completion policy outside staged capture. */
+	/* Keep RESET operation selection fixed for the opened runtime. */
 	substream->ops = vss->capture_staging ?
 		&virtsnd_pcm_capture_staged_ops :
 		&virtsnd_pcm_ops[substream->stream];
+
+	if (vss->direction == SNDRV_PCM_STREAM_CAPTURE && !vss->capture_staging)
+		substream->ops = &virtsnd_pcm_capture_indirect_ops;
 
 	snd_pcm_hw_constraint_integer(substream->runtime,
 				      SNDRV_PCM_HW_PARAM_PERIODS);
@@ -1596,6 +1600,54 @@
 			return 0;
 	}
 	return virtsnd_pcm_sync_stop_locked(substream);
+}
+
+/* The PCM lock covers both indirect accounting and core completion. */
+static int virtsnd_pcm_indirect_reset(struct snd_pcm_substream *substream)
+{
+	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct virtio_snd_queue *queue = virtsnd_pcm_queue(vss);
+	struct virtsnd_pcm_transfer transfer = {};
+	int rc;
+
+	rc = snd_pcm_lib_reset(substream);
+	if (rc)
+		return rc;
+	if (!snd_pcm_running(substream) &&
+	    runtime->state != SNDRV_PCM_STATE_PAUSED)
+		return 0;
+
+	guard(spinlock_irqsave)(&queue->lock);
+	guard(spinlock)(&vss->lock);
+	if (vss->resetting)
+		return -ECANCELED;
+	if (!vss->prepared || vss->stopped)
+		return -EBADFD;
+
+	/* Pausing does not move the device's fixed DMA buffer positions. */
+	if (runtime->state == SNDRV_PCM_STATE_PAUSED)
+		runtime->status->hw_ptr =
+			bytes_to_frames(runtime, vss->pcm_indirect.sw_io);
+
+	transfer.indirect = vss->pcm_indirect;
+	transfer.indirect.sw_ready = 0;
+	/* Consume no application delta while returning discarded RX space. */
+	transfer.indirect.appl_ptr = runtime->control->appl_ptr;
+	rc = snd_pcm_indirect_capture_transfer(substream, &transfer.indirect,
+					       virtsnd_pcm_trans_copy);
+	if (!rc)
+		rc = transfer.error;
+	if (rc) {
+		virtsnd_pcm_transfer_failed(vss);
+		return rc;
+	}
+
+	/* RESET discards all samples through the observed software pointer. */
+	transfer.indirect.sw_ready = 0;
+	transfer.indirect.appl_ptr = runtime->status->hw_ptr;
+	vss->pcm_indirect = transfer.indirect;
+	return 0;
 }
 
 /* The core holds the stream lock through the matching appl_ptr reset. */
@@ -1691,3 +1743,17 @@
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
