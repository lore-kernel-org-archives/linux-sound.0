Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793144664;
	b=cbALN78lauGrFMD1Tmv4PB9ekISPLBA4FB821gWbwudyJtVZVrFRNKZGDE0wfN/mUSXW
	 aiVu0DDGC4oJyROO2sEdfKTsI03F2IVuBqcUvJYGZ3TMPHIuoJi/OFBlAbMVu7McS2Y38
	 +103A8lXpX7HpyUaXZfb2z5rAvU8FNHtMZ3Qsf04UGgK8S4BlyBKbpM/sxWiTEmp6dVUV
	 Le//xjgLvZr+cP/qNmuTv7QL5S6CLtjaYwtHYl3UA9SmHV1CrjsvRmvfgqm7i27Eyk557
	 /P5DgM5DAxGiFAloqymO2lVOxxjPLteFchUr4Stcz0/xDDN4QB5bXhXA3G9NUKnCp6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793144664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6eYi7haKrUUz5ppcKTnEsRmfpDKe/7u+K3cLCBGytI4=;
	b=dlfZDM5+2o2IVQUB1vW/uhM4Ueshv1J1epUWb4CA7OTXqmWw1YNicqI2GH35GxoilOke
	 7iXIxGlLZi4/EXvxIZlS4Mnvz9jLLHrDvUNRLd3Nl5gRbz9eosU34f6WHg7gK54dxO0Fz
	 M+uGgYTaHOrkHPdIOhB9q+liCoqQvwKYckQgvFCOXd87ODJiGckemudypzJzjh1AfrKx8
	 ExcGL6H85ytcQEalMpQnUck56ja5tDci1L/tsakyc7hfnfpectJKVDBAoL1s1U2MHB2Mz
	 pWRw0LzGyMyW61kFcdYng/0SLpTEsPAJWD95ZlfOMuZ0BYOpCogO17bTNdGDnrMDqOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="p/qeWaCK";
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE750606A322
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 23:44:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE750606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p/qeWaCK
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8a070755c8cso241849b3a.0
        for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 16:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793144663; x=1793749463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6eYi7haKrUUz5ppcKTnEsRmfpDKe/7u+K3cLCBGytI4=;
        b=p/qeWaCKPHeow0PAaCT8x5lC7TRe94coezk0yXoOPU2rid33CI4Q8eSgzpVYewTbRy
         Ji9LPTLgQa4jGCyi5FOdq0eXdQFfeU+bUeOeGw3BDq0CG/ldTAmOtlLA5O2Wv0xGex17
         qnMLVXX/1pisAaBb7ImFHdu8/51epCgByprT6t1NAovdwIYTpsKcMVFOE0ncIKmfuQP1
         /WvwF8NlJINRquT9n7houVxFgBt4V83cq4HsrVmpoNrAY+YtsCF4/DE95fKiYt8hPp7B
         VjUsW+grXywOOZfOioov+OAJTYxDYjpLHBcQILW8l1GlEE3lG5axNfwLHdFJkZhSU+WA
         S3lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793144663; x=1793749463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6eYi7haKrUUz5ppcKTnEsRmfpDKe/7u+K3cLCBGytI4=;
        b=TMrRb+p/fGeGjviADZ3DSApE8OqsfJEpHAN5aOiHwx4UT093ISUj8Djt8Py9poH71P
         64GoU8DEzcINtTd8KZt6YxOcWg9bnlRErQ6LooCbzURKp3iOzCkPwkUJvShpoWElz5jQ
         KW/v1ESCjsDogyj7A/od/mcBCAysgQ8ktkPA88EySOqg58kDXHBQVHEzypJKAxvPPKFw
         vOE30LW908YVEgjk5FZVd1iT9vUsr7gTaswC75KurApZgvccxVVM1hrox0ERA/XLRiHZ
         1Muj6IeKV532ULy4FitvsNuNflmTLri+aIIUKoykJagDMcxLK12LiEXDyHc6EdoOwVYo
         M9CA==
X-Gm-Message-State: AFq9FYLLd/vpx3key+CjlXt9+neCQ7vHUhvn44VB7poQUbFLfwUYUI7R
	GXkTRRZleZdZM2eHvMkYewk1AffBi1KF22dcAmnVq673cWyKyQifnM0CgyEPLw==
X-Gm-Gg: AYBFou3Edc20aZWj0bHUG9oGm043DzUK7s2nOPN0Es60ZV9p3GEkttkwIeRl1qC8bs7
	j0KCDiL0xQERe1hNZBpPvHqn3Sb/+MvHk+LFyKBl46c1dnjsYNg8sfEf48a0ndKMXLUddAu8P6p
	5101si6/QBv9UOK9h/vPmE3v8bzESDiFnRPeSz5q7PzVdnuFJqgS/gk9P1esJTTdzGNDNGMeSkr
	0k+r/PXEV9u/6IVOCudu1yaWzyVfnG2z4kQ6nU0Ps5pLWaJoyCnjbcpMoPsP+BhqNOUeO1NWSXT
	cR4sJeZ21FOy/rVFSvhOfwxMR6Aj3/If7F51Omc4qUcVOqmfsPKelI+Z8swRdLGDnmHl0IrcI9f
	4xHz6nmeJp8LRGh96xeo+Vjj8Ktpyz6wvq8cnDCmWsdv2ipIm3ieMTQttE8t0JVdlfvNpqZO4kV
	jyf6IgRBjvmtilIC0Vod0UkT1q2QTLDHhY4uGfdp6FT7M8YnKs9w28xu9qrSxz99GxcVbLRdxKB
	WG9WMpB3F3cbhL9t6vSHDvLA3QkL9sDCB7PhQl+0TPa0Mga3AWPMxi73+Ez3lLC9CkTaG+9GdV/
	C5j+nx3aQ7XL3O8liKtC/4dWQsvACzePgJhO3Vi8t8XHTpzSoM8qIAjVL1TRQ8Otd0ZDojKrsd5
	jcTm4iddr+E8Ixun07Nk=
X-Received: by 2002:a05:6a00:2302:b0:8a0:72e8:732e with SMTP id d2e1a72fcca58-8a6e6ff2f26mr515420b3a.29.1793144663102;
        Tue, 27 Oct 2026 16:44:23 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a662b9f5sm542507b3a.21.2026.10.27.16.44.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 16:44:20 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	perex@perex.cz,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joonho Lee <mynameisjune111@gmail.com>
Subject: [PATCH v5 08/11] ALSA: virtio: account staged capture reads before RX refill
Date: Wed, 28 Oct 2026 08:43:31 +0900
Message-ID: <20261027234334.32551-9-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261027234334.32551-1-mynameisjune111@gmail.com>
References: <20261027234334.32551-1-mynameisjune111@gmail.com>
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

The RX callback holds the queue lock across a batch of completions. A
reader that has copied samples can wait for that lock in ACK before its
consumed bytes are removed from capture_ready. A later completion in the
same batch can then reject data using stale ring occupancy.

Account the staged read under the substream lock before acquiring the RX
queue lock. Release that lock before taking the queue and substream locks
in their established order to refill requests.

Once accounting is committed, latch refill errors as XRUN and return
success from ACK. A negative return would make ALSA restore appl_ptr while
the driver retained the consumed-byte accounting. Keep pre-commit errors,
ring-capacity checks, and normal period-work scheduling unchanged.

Source-extracted host and kernel fixtures reproduce the stale-capacity
race and post-commit ALSA pointer rollback. The candidate preserves wrapped
data and pointer accounting. KASAN/lockdep QEMU lifecycle checks passed.
The fixtures substitute selected backend helpers and do not independently
establish physical-device acceptance.

This follows pending staged capture support, whose introducing patch has
no upstream commit ID for a Fixes tag yet.

Link: https://lore.kernel.org/all/rfc-v2-vz-capture-compat-1.b9ab4c1540dc4691@gmail.com/
Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>
---
 sound/virtio/virtio_pcm_ops.c | 128 ++++++++++++++++++++--------------
 1 file changed, 77 insertions(+), 51 deletions(-)

diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
index 003832d112551..85e7576903d56 100644
--- a/sound/virtio/virtio_pcm_ops.c
+++ b/sound/virtio/virtio_pcm_ops.c
@@ -1229,70 +1229,96 @@ static int virtsnd_pcm_pb_ack(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int virtsnd_pcm_cp_ack(struct snd_pcm_substream *substream)
+static int virtsnd_pcm_capture_staged_ack(struct virtio_pcm_substream *vss,
+					  struct snd_pcm_runtime *runtime)
 {
-	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
 	struct virtio_snd_queue *queue = virtsnd_pcm_queue(vss);
-	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct virtsnd_pcm_transfer transfer = {};
-	int rc;
+	int rc = 0;
+
+	/*
+	 * The RX callback holds the queue lock while draining completions.
+	 * Account ALSA's read under the substream lock alone so completions later
+	 * in that drain observe the newly released ring space.
+	 */
+	scoped_guard(spinlock_irqsave, &vss->lock) {
+		snd_pcm_uframes_t appl_ptr;
+		snd_pcm_sframes_t diff;
+		size_t bytes;
+		u64 next_acked_total;
+
+		if (!vss->runtime_active || !runtime || !runtime->control ||
+		    !runtime->dma_area)
+			return -EBADFD;
+		if (vss->xfer_xrun)
+			return -EPIPE;
+		if (!virtsnd_pcm_capture_counters_valid(vss)) {
+			vss->xfer_xrun = true;
+			schedule_work(&vss->elapsed_period);
+			return -EPIPE;
+		}
 
+		appl_ptr = runtime->control->appl_ptr;
+		diff = appl_ptr - vss->pcm_indirect.appl_ptr;
+		if (diff < -(snd_pcm_sframes_t)(runtime->boundary / 2))
+			diff += runtime->boundary;
+		if (diff < 0 ||
+		    (snd_pcm_uframes_t)diff > runtime->buffer_size) {
+			vss->xfer_xrun = true;
+			schedule_work(&vss->elapsed_period);
+			return -EPIPE;
+		}
+
+		/* ACK includes any subperiod tail already copied to the ring. */
+		bytes = frames_to_bytes(runtime, diff);
+		if (bytes > vss->capture_ready ||
+		    check_add_overflow(vss->capture_acked_total, (u64)bytes,
+				       &next_acked_total) ||
+		    next_acked_total > vss->capture_copied_total) {
+			vss->xfer_xrun = true;
+			schedule_work(&vss->elapsed_period);
+			return -EPIPE;
+		}
+
+		vss->capture_acked_total = next_acked_total;
+		vss->capture_ready -= bytes;
+		vss->pcm_indirect.appl_ptr = appl_ptr;
+	}
+
+	/* Preserve the queue -> substream lock order while refilling requests. */
 	scoped_guard(spinlock_irqsave, &queue->lock) {
 		guard(spinlock)(&vss->lock);
-		if (vss->capture_staging) {
-			snd_pcm_uframes_t appl_ptr;
-			snd_pcm_sframes_t diff;
-			size_t bytes;
-			u64 next_acked_total;
-
-			if (!vss->runtime_active || !runtime || !runtime->control ||
-			    !runtime->dma_area)
-				return -EBADFD;
-			if (vss->xfer_xrun)
-				return -EPIPE;
-			if (!virtsnd_pcm_capture_counters_valid(vss)) {
+		if (vss->runtime_active && vss->xfer_enabled &&
+		    !vss->xfer_xrun) {
+			rc = virtsnd_pcm_capture_send(vss);
+			if (rc) {
 				vss->xfer_xrun = true;
 				schedule_work(&vss->elapsed_period);
-				return -EPIPE;
 			}
-			appl_ptr = runtime->control->appl_ptr;
-			diff = appl_ptr - vss->pcm_indirect.appl_ptr;
+		}
+	}
 
-			if (diff < -(snd_pcm_sframes_t)(runtime->boundary / 2))
-				diff += runtime->boundary;
-			if (diff < 0 ||
-			    (snd_pcm_uframes_t)diff > runtime->buffer_size) {
-				vss->xfer_xrun = true;
-				schedule_work(&vss->elapsed_period);
-				return -EPIPE;
-			}
+	if (rc)
+		dev_warn_ratelimited(&vss->snd->vdev->dev,
+				     "SID %u: failed to refill capture queue after ACK: %d\n",
+				     vss->sid, rc);
 
-			/* ACK includes any subperiod tail already copied to the ring. */
-			bytes = frames_to_bytes(runtime, diff);
-			if (bytes > vss->capture_ready ||
-			    check_add_overflow(vss->capture_acked_total, (u64)bytes,
-					       &next_acked_total) ||
-			    next_acked_total > vss->capture_copied_total) {
-				vss->xfer_xrun = true;
-				schedule_work(&vss->elapsed_period);
-				return -EPIPE;
-			}
+	/* The ACK is committed; a refill failure is reported by the next XRUN. */
+	return 0;
+}
 
-			vss->capture_acked_total = next_acked_total;
-			vss->capture_ready -= bytes;
-			vss->pcm_indirect.appl_ptr = appl_ptr;
-			if (vss->xfer_enabled) {
-				rc = virtsnd_pcm_capture_send(vss);
-				if (rc) {
-					vss->xfer_xrun = true;
-					schedule_work(&vss->elapsed_period);
-				}
-				return rc;
-			}
+static int virtsnd_pcm_cp_ack(struct snd_pcm_substream *substream)
+{
+	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
+	struct virtio_snd_queue *queue = virtsnd_pcm_queue(vss);
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct virtsnd_pcm_transfer transfer = {};
+	int rc;
 
-			return 0;
-		}
+	if (vss->capture_staging)
+		return virtsnd_pcm_capture_staged_ack(vss, runtime);
 
+	scoped_guard(spinlock_irqsave, &queue->lock) {
+		guard(spinlock)(&vss->lock);
 		transfer.indirect = vss->pcm_indirect;
 		if (vss->stopped) {
 			rc = -EPIPE;
