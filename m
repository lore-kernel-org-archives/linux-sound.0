Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180530;
	b=NXIwcXO9ghvVQ4cUZFxqKoFADmLnzOulblItFXDEYyuGo25a/5PEHMZEjEf/f4k3wpAv
	 dpT1kuqaqe3t6sTgU3Wq4hIQnf0sS0/SGm9FPPdzT8C/Fqcxt50vHSue6m6m6QieQlmiR
	 xAMpK236/EsCg8Lt4B+HhtiRjTqAT+rPGdXNqBWU/s5oqsbcVCWYOTSZISu4MMYf5/b95
	 f49+AVZX3GYzKZxj9CNO2H17dlkK1m0yJp+3QFvEdv3EnRB0uQzPJBDi7jrrrvVbN5UP8
	 Jt0+cbZ1MnfC1XiSZnP3lsT2yF88khJd8x7gPrQP2wCBjGMWyyAc+EmzrKym24OiEzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180530;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6eYi7haKrUUz5ppcKTnEsRmfpDKe/7u+K3cLCBGytI4=;
	b=KZUeOHh2tbXQYTeloJFr2k0b2RMx7qaAzb3gXEhyb6VxzPI9iK1gNxTjxuSMxaCRpRP7
	 A76yXivrkzbo79FKGKsQTB4Gfkre+FqSX+uImghP5w5Qf5up3KPi9LhV69aFs5oQJtLG1
	 01Q19bIBwejOvL7Pm4tgpRv1BN1SFRIW4TwXxiaSODl1e0kgsOlbBaOOSeRO7Zo5kvmSo
	 oF+0iPtr+31GAj8iu3DL2CSTGrEvdT1YRFvQX1o329ju3/l/Fl1HNH8TMe6xoYikJatEt
	 z8MDHQ2VgsXnJIRHjZJxD0dBQv2UmGFTM4I/VzUzZbvl1gSQeDIveH4N3pHGqzhu2AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kkmygWZ3;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E4460A262B
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 09:42:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5E4460A262B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kkmygWZ3
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so433186a91.0
        for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 02:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793180529; x=1793785329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6eYi7haKrUUz5ppcKTnEsRmfpDKe/7u+K3cLCBGytI4=;
        b=kkmygWZ3Bd1ORBZYN123uCbvxb2lbmlJfyOq5n1XCDNyvAVl8PfrvtOK9IsldIsm33
         keEpELDr9sHVvf2T9x/SZvEFLyouN8knmMIIRgRui1FGu30lH2+hjXxR6SaEXauRF0CJ
         78m5Qbkwow9edI6vZieGSLDbQ4yhvP0+kQ1+voQX8Hoa0oq2HelH7pCKcS7TJilthrH1
         0lRQxJNb+bQXMPB0GabTVdSIBB8sr68w/JiziR57BDQgkQKwSTYJK9IBA9m7REmNzH/0
         4EOQnPC9hKzOCG+d/g/vh9ky7qbzzEcVnZ8lTP3ZldQ9TYoZU7rpmVCPg4Mk3N7qJGTm
         r2SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180529; x=1793785329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6eYi7haKrUUz5ppcKTnEsRmfpDKe/7u+K3cLCBGytI4=;
        b=VORrLEEUyGmL5waKky3D8bwVVe0Ok64KM9sNCS5rKwRDMZTcR2FYghLJyHS+TO0OYa
         Xez3qtQvbrPKCTXF1KKd7HjmywS5Hic7kMaPhLXn52TSXLH9EXbKQi0JIEX99ffB+ap6
         TqZl4Dahh7YPCaUCk+3W3oywo0sJqZmlqO+MA0SX4eMnhq22hQ9hO9xJAJTlmUuSnGbK
         XyM5Y4XznkcdCgtECZKXhM2/41LfwLA8jgkJV7ORhr00vM4o+CLZ8BoLs+adIj6gqswC
         qfn2dqHut7KFdM5UCRbYGWNTh+rjsfkFHwu+2YqHw7XVhLk38dJVQw6FbxdAyrbnytaM
         IqAg==
X-Gm-Message-State: AFq9FYLhsXcDJhuxnjQNiBhyxIoUhx7XruwW2xOd/s5+jlgXbG2OIYMQ
	eSwDAkLVDZmrr6ost+mRSRTNyg/tHb9j2gOOuLGRg44W0UscIme+8TqGss2vrA==
X-Gm-Gg: AYBFou2mRojr2uFiYL/0WQkXLxao4snncaNQ3MilUnO+DBCkYvwi3UzhidMuiSy4kfP
	wtcyyLIuwhxULyZBTMShfVuevBL6n+n7/CUk0EiZLglXUeXA29ojmj0VLzZi8SoafWbmh22g6JN
	anqsfChYk7jeiKXK5qjAiwZH4Q0aiIL7gNAQVybFyDHwYKah76UAhFy+CVk3q1VYOLNqh2ZgfV6
	ZcBi44dEI/Zz9jjElM9izfwOxJhSW63I16ttK8MmqmjK+WhQwtJ1jcPs7zkRoLtBD/+X49kURs8
	l3lJk6sDlwKD7cJQEor3iOx6ZXaWyiGmalA3jUBmeDZiipGKljxEH+Bc135xungH/DD6ggzLcAE
	Ul5DvTZGpotAJCaHNIiIxKPz2zk8IZsmLnayDtQijc8Rpy1DdlkthHOhTPjv7aCdxnjIY73M/qe
	ZgDRvrb1ShUN1MAl8gMNA0g3J24IrVpxb2IMqaYlaFnAusdwvRGJH4cxPlcEVwAdton1EpQh8im
	eE0MjPg0y6PbABRM2JkI6nJgYwNuqHvueBzceTDpD7dcct0LRA7ae60LniRiK+qC3rbgMjeJSiR
	2hheMyjXuoi1Li89R7tkt84VJYO7LEtrsvupNhuyHPriQ8OPGvVNocTY+PzBg+DbARqEiF4vtFM
	ZoJYqf4frmC5eLx55Q14zOlEn5HUdFwhORq5l3iEANgFDfKFM
X-Received: by 2002:a17:90b:4ec8:b0:3ab:de4:7fa5 with SMTP id 98e67ed59e1d1-3ae582c0671mr1363142a91.56.1793180529080;
        Wed, 28 Oct 2026 02:42:09 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a93b3f5sm2242377a91.5.2026.10.28.02.42.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 02:42:08 -0700 (PDT)
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
Subject: [PATCH v7 08/16] ALSA: virtio: account staged capture reads before RX refill
Date: Wed, 28 Oct 2026 18:41:24 +0900
Message-ID: <20261028094132.20364-9-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261028094132.20364-1-mynameisjune111@gmail.com>
References: <20261028094132.20364-1-mynameisjune111@gmail.com>
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
