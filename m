Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180504;
	b=zmbUEOy9YZD7+TWn77gtB3em0AkEBapW2dKv/bqfhCob2r6cENsaGMfkGYgq2UCWPz5Q
	 WmWmDSe0rG4+eUyZmw9rWrseIgpWbK1f9SpLAOZy8r6CJyqJksVh+RQOcMlTd6vi9YI4O
	 N6a2BwEHn4AjF33ANaCNh6XWLogSz2npV7y5LG8l8GqIkcqnO8RIhaWkFPNWMNu2Shrem
	 cuncu2pqJt45pNojFeoL3hBbA/C80fGXxmKnrnL6/rdD+IZywCqEt6qm4KeMhrMj2/khu
	 ksnrnHzNtqaOS4j5bCFavzWvFMoH+jcj3grr5m3TVlopCJD7WQrHar9xOFwr83RmIKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180504;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GcN94qJJdoXXjjKHz4VCx6KeOGW9pO5t0VvopK/sL4c=;
	b=t5lvBFN04ArBHRAroxW+o4yb5ueQhylW8mNKI4a1Q1p2KSs8DdnREs+5XmI4sI8E7dk4
	 BrtOV4HdygzffK9xogH6/MGDSa19tmo9o5ABBZNrJqykcOL4Wmt8FbtoakCyYZ1WtS7my
	 vSSQig3D/vk/5T3s+KRD6sZjIKvSTVO9z1I227n/U2C4nFq9R8UsRY12cnsYgwEVsCSeW
	 Ju+jS5zZ+8sHw/wEi/9C/No+0qCb/RpCH3Z+1qq6qEa5FF+FF02iJXnXhXt2hJzE3KpAd
	 TLgBR0SNzhpyLpredXb4dG71WIbE8TMzxMV6fA7QWR/MdNjeCqaBQ2PbGyIjxwRiltw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AItRb3Bq;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FC8606A321
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 09:41:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7FC8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AItRb3Bq
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc52c1b8286so478715a12.1
        for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 02:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793180503; x=1793785303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GcN94qJJdoXXjjKHz4VCx6KeOGW9pO5t0VvopK/sL4c=;
        b=AItRb3BqeHFueEoxuBq6ehyUNNKsdKNXGjpCGcuEf2otvy4odI0sLTWf0MkSh+YMP9
         v8eqUAuSE+Of2rpqU1gumXx58EG5Uq+LMxp+a6tuz9E/8v5iHgYrKG9N400z31IN/Nex
         UUFxx/4j6Pvk5xqYyFTR4bK6CjZrDbSV+HvLTheqDJZIzji7xNZaizpI8C3e60pdF56n
         bkzeZMgMUECTWHr7dP85/P2+B+4e0yFGv/r1sjidSbszdE/ZnhtpJCsWSyokPhkoFeMd
         WVtJlH0tk6YCU2Dl99+eRCvBYWNqSGHvjnOFSEgtQPOHrtGl5q93V5SjaUfWM1KTEkpS
         MS/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180503; x=1793785303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GcN94qJJdoXXjjKHz4VCx6KeOGW9pO5t0VvopK/sL4c=;
        b=zl9oEpADU4dgsCg9x2IiT0j45fIJiZscfYAzvPds/3PWby6hFNRVDBN4wrUBot8w87
         lH1/ncnUOpZeOYQV8Ogu553Ehb/ICDT8KBGfsz+mllTmJ4GBFzAU0FsKzqImkK9J2vh1
         hhoAemE22bXnGqOAfQdBjtmCF8QkgDWS0jXnTwF/t8KFOZs9oMuXlOViVB6S+eH70r8r
         svYDEw/kdm6MEBRskY/tH9yjLUqFlUU/X5sH//fJIiM7i5SGnzDSNv4XpsfloaeT62HA
         9SmPUly0Q79X+TozVjrbd2u/ThUuXw/1zrJulpQ7kslb7CSm42R6ZF3lwNYx0JZb92e5
         l4bQ==
X-Gm-Message-State: AFq9FYIJYcNlA4oFz+64n5TuuVfWj/a3aqU8pvEpKqWBVvRNFdmcs7jU
	1n0EPSHBdJubUMiFkFTg+i4fdpomTNd8m9xJHbT65JEgRqlDlQTxZUnkd+EihQ==
X-Gm-Gg: AYBFou14kB2VYSJH3hQdOGhUuuWPYIoBl6f+HPZ5XExeNk1SuDxK1SeswrWfA5uelPC
	/HxEB6sEYyzvrfUvGPVUAhTH8LfiflITkbJAS2mH9RSizWzN2+Ya6jYAXCWeK5yObgQ5Pmf65ue
	DrKfirGU6Hm+X8dsD728MdY40fvFeGC3UDkzcguhab2/RKwTPlOcmYQ0oP0QJr0vvH1Hu1Vka2u
	bmKTefWNxwylsOR8JA2hL05XTsvf2rpQmm6lZycqOcOYjtJxF7sFg/qlFU26mp1CV2RxlerBNZX
	81PjBxp0xRpNwbu20CqJ/w52PVIpjkHrmYfDsfgI4prMB4aS8aSe3jZDw/7zCSzS05TK+SqvhuJ
	HCLx++QyoPRKTPWJUv+EllwN/XQEjaJt/CwJ/ksVIpj1gFu+mf82ZPf/5ut24O43waBECA3Y9IB
	tz8vhN5gE35D8Z8cScmickr2wEuhV3x+LLrpuWi1brc3xyhDfkwC8rTPoNF05CS+UNuziCjCWih
	j0y9wlItdUcDcFsq1UDEP+Oz4DwMfhUJZDnTO3/AV6YFcowODfZXNCm/+VG/aB5HpHs9LeTXIF7
	jbPKgKGF8QHUyHEjoJYhXgrIrxp8YKf5wqVCZRwmhgIT5D+pfpHkKGIjdPefXOdt18/OMzw8BlG
	M3zgLKxeyw5nRZq7QRUw73HzebCimXn/2mX3/zQ+DhJFO2UA=
X-Received: by 2002:a17:90b:3951:b0:3a2:bb9f:f87d with SMTP id 98e67ed59e1d1-3ae5c84f507mr566488a91.21.1793180503102;
        Wed, 28 Oct 2026 02:41:43 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a93b3f5sm2242377a91.5.2026.10.28.02.41.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 02:41:42 -0700 (PDT)
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
Subject: [PATCH v7 01/16] ALSA: virtio: Propagate PCM send failures through ACK
Date: Wed, 28 Oct 2026 18:41:17 +0900
Message-ID: <20261028094132.20364-2-mynameisjune111@gmail.com>
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

virtsnd_pcm_msg_send() can fail while queueing a transfer. Restore the
failed message's length and notify the device about earlier messages
queued by the same call, so they do not remain stranded.

Propagate that failure through the indirect PCM transfer callback instead
of discarding it. Commit the updated indirect state only after successful
submission and stop further transfers when a send fails. Return an XRUN
error to ALSA so the stream can recover.

Keep the polling feature path unchanged.

Fixes: fe981e67568c ("ALSA: virtio: use ack callback")
Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>
---
Changes in v3:
- No code or commit-message changes from v2.

 sound/virtio/virtio_pcm_msg.c | 12 +++++
 sound/virtio/virtio_pcm_ops.c | 82 +++++++++++++++++++++++++++++++----
 2 files changed, 85 insertions(+), 9 deletions(-)

diff --git a/sound/virtio/virtio_pcm_msg.c b/sound/virtio/virtio_pcm_msg.c
index 72103f606716..5371f4985fd0 100644
--- a/sound/virtio/virtio_pcm_msg.c
+++ b/sound/virtio/virtio_pcm_msg.c
@@ -260,6 +260,18 @@ int virtsnd_pcm_msg_send(struct virtio_pcm_substream *vss, unsigned long offset,
 				dev_err(&vdev->dev,
 					"SID %u: failed to send I/O message\n",
 					vss->sid);
+				msg->length -= n;
+
+				/*
+				 * Do not leave earlier messages queued without notifying
+				 * the device when a later message could not be added.
+				 */
+				if (msg_count != vss->msg_count &&
+				    !(vss->features &
+				      (1U << VIRTIO_SND_PCM_F_MSG_POLLING)) &&
+				    virtqueue_kick_prepare(vqueue))
+					virtqueue_notify(vqueue);
+
 				return rc;
 			}
 
diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
index 1091100a4c98..a40ea394bf17 100644
--- a/sound/virtio/virtio_pcm_ops.c
+++ b/sound/virtio/virtio_pcm_ops.c
@@ -466,36 +466,100 @@ virtsnd_pcm_cp_pointer(struct snd_pcm_substream *substream)
 		vss->hw_ptr);
 }
 
+struct virtsnd_pcm_transfer {
+	struct snd_pcm_indirect indirect;
+	int error;
+};
+
 static void virtsnd_pcm_trans_copy(struct snd_pcm_substream *substream,
 				   struct snd_pcm_indirect *rec, size_t bytes)
 {
 	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
+	struct virtsnd_pcm_transfer *transfer =
+		container_of(rec, struct virtsnd_pcm_transfer, indirect);
+
+	if (transfer->error)
+		return;
 
-	virtsnd_pcm_msg_send(vss, rec->sw_data, bytes);
+	transfer->error = virtsnd_pcm_msg_send(vss, rec->sw_data, bytes);
+}
+
+/* Caller holds vss->lock. */
+static void virtsnd_pcm_transfer_failed(struct virtio_pcm_substream *vss)
+{
+	vss->xfer_enabled = false;
+	vss->stopped = true;
+	vss->substream->runtime->stop_operating = true;
 }
 
 static int virtsnd_pcm_pb_ack(struct snd_pcm_substream *substream)
 {
 	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
 	struct virtio_snd_queue *queue = virtsnd_pcm_queue(vss);
+	struct virtsnd_pcm_transfer transfer = {};
+	int rc;
 
-	guard(spinlock_irqsave)(&queue->lock);
-	guard(spinlock)(&vss->lock);
+	scoped_guard(spinlock_irqsave, &queue->lock) {
+		guard(spinlock)(&vss->lock);
+		transfer.indirect = vss->pcm_indirect;
+		if (vss->stopped) {
+			rc = -EPIPE;
+		} else {
+			rc = snd_pcm_indirect_playback_transfer(substream,
+								&transfer.indirect,
+								virtsnd_pcm_trans_copy);
+		}
+		if (!rc)
+			rc = transfer.error;
+		if (rc)
+			virtsnd_pcm_transfer_failed(vss);
+		else
+			vss->pcm_indirect = transfer.indirect;
+	}
+	if (rc) {
+		dev_err(&vss->snd->vdev->dev,
+			"SID %u: playback ACK transfer failed: %d\n",
+			vss->sid, rc);
+		/* ALSA treats -EPIPE as an XRUN in ACK and pointer paths. */
+		return -EPIPE;
+	}
 
-	return snd_pcm_indirect_playback_transfer(substream, &vss->pcm_indirect,
-						  virtsnd_pcm_trans_copy);
+	return 0;
 }
 
 static int virtsnd_pcm_cp_ack(struct snd_pcm_substream *substream)
 {
 	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
 	struct virtio_snd_queue *queue = virtsnd_pcm_queue(vss);
+	struct virtsnd_pcm_transfer transfer = {};
+	int rc;
 
-	guard(spinlock_irqsave)(&queue->lock);
-	guard(spinlock)(&vss->lock);
+	scoped_guard(spinlock_irqsave, &queue->lock) {
+		guard(spinlock)(&vss->lock);
+		transfer.indirect = vss->pcm_indirect;
+		if (vss->stopped) {
+			rc = -EPIPE;
+		} else {
+			rc = snd_pcm_indirect_capture_transfer(substream,
+							       &transfer.indirect,
+							       virtsnd_pcm_trans_copy);
+		}
+		if (!rc)
+			rc = transfer.error;
+		if (rc)
+			virtsnd_pcm_transfer_failed(vss);
+		else
+			vss->pcm_indirect = transfer.indirect;
+	}
+	if (rc) {
+		dev_err(&vss->snd->vdev->dev,
+			"SID %u: capture ACK transfer failed: %d\n",
+			vss->sid, rc);
+		/* ALSA treats -EPIPE as an XRUN in ACK and pointer paths. */
+		return -EPIPE;
+	}
 
-	return snd_pcm_indirect_capture_transfer(substream, &vss->pcm_indirect,
-						 virtsnd_pcm_trans_copy);
+	return 0;
 }
 
 /* PCM substream operators map. */
-- 
2.54.0 (Apple Git-157)

