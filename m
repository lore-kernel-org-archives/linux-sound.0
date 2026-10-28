Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180533;
	b=ifN766iTp21jlQnmI+IlCKOp4al8sRAGKRpH+sngKdfyBlz26ghgyDEucWFjJgWyeo3n
	 3SMiik/CVarx5wLiWFQnnqFVrS/LZIiU0Fbnbt1AfpPeqBbXq0l9cH90XoLRwXGS213r+
	 oItKLVSaB/+OrARz75bGWppdT6xqfDhI4+NgW/kvoXxFGONVFnM9k+XBY6ubxe9AfsF2J
	 7BrKvIJo63T4IvvIbBVw0o5GMWXgiG91ST75DpKkqXcf7w4wMtCh42hHauEIiHQGxE78G
	 fsmrl1Egg6D0jPm1egNa7ujWyIc4FML6bAJsTIF0DF8hRQFApEcyoi5Gzxk6tS4WKXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180533;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1SSKD9R3/tZDll832XAf/4iUolviOcI2RSxt/Z/hu94=;
	b=kpV/DPaREgHt/Ntf7Td/wjPQ7QCd3NMZ2Ug996YvrgFgyO0iaajdAOzDwNEfWEyNY+/b
	 82NMomOLtE+XrCWOorGRsTEzV475+xr9PEG1WQBFNeM2XfmikU9aDEv1ZFbiza/quYph2
	 eTjXi8K8D0fPUjoXq9wHHtvrSKyMY3XvCe8o4/xvqrB9mLWsEA1rc3nDn/dT3DdnANmHo
	 +V3rF7evsP75tKI5dcK2yvjf7ZPgG9q4i5LpDtGIuUrC73PjDEF9f6KK6CIvMSPSFXGs8
	 lNAispa4ITc3Lou49qs+QlEKi6dD88GFqQUj7kKlTnoxhTwju2wvPe0JVIrBDhpXMRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lv8nc96V;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5DB606A33F
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 09:42:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A5DB606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lv8nc96V
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso425415a12.0
        for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 02:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793180533; x=1793785333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1SSKD9R3/tZDll832XAf/4iUolviOcI2RSxt/Z/hu94=;
        b=Lv8nc96Vj638jhK+Nu0b890PYUx8A4roeDUJaIw+7/dWn2paKf8254dLSO7qth9hYy
         Qt708dstJAezYa6e75WIk+MG7H5dOv0+bBs1KIEHTMPjCMiF+ekATn9Xg8GPTo12sb0I
         EUepLJb1cf9uFNmYjZzFFci21dgAVVPJKV5rlidxenpP8kbC4/LRySq6Sco4K582fpdO
         7IoYb9b8BUG3jQGk/V/o7tfI+n3ZtCe1jSqzhYqa7ifwHetoa+HFDTMXnZEvaFOyy6o/
         WWb5Cd+lQlUxC+VehMEh3DuyytJEsqqaNsF0kg1H1sAZPoTjcnEqvnr5IfdP/y/KxVHt
         yrRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180533; x=1793785333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1SSKD9R3/tZDll832XAf/4iUolviOcI2RSxt/Z/hu94=;
        b=Rc0OGROvwd7DK1m2lUFD12AUPoM4l3E5NE8FNCA8jKT63psCbIPOm6k/usLEpO9wKm
         FJgBdj6ItIbuNBAG1PMlP2vgzNeMbgp/Zd4izkqxSKVKw1ar0GAZ795GSV4X3HkqkKCi
         QMM6yl1mkqwuEroW3RB8PHneyEK95XRi13CGWrgpEYZR805drZF2Oqy13b75AFEMd0Xt
         6rAhklenFgtRzxXFqgbg0o3Ewss+4/8rujserKElyQkxZUrf0cqPHQw4zD91OKkaaFYL
         H8wSknal3zPdem24zoAKrZHGcwVLZWbnO362YiwnxhSRlXyF44f50DvStf6IQSMMLTY+
         yu6Q==
X-Gm-Message-State: AFq9FYIHBUJRqlFnw7anP4BcB7bepAD0U4GtD4thkJTotMevV9iK7T7c
	wKcpKBZ+YaEHEIpNsjwlNWUE+AIH44MfNWRuwk2obsS8R7o2pGRchtEN0U4AGw==
X-Gm-Gg: AYBFou3/AxaonTiICd/ubHtYvuMVyehDQ3MDqd47ZXXy8qGVliq5WL5LZz+dZHuZuts
	NxvZ+vLrYWtDmhpp+oaiJ/cTZNPz2VIelABkxFbgYga0GzLBXod8ThgssVRt/yGURhO0RokaQ9i
	hWYxkTh/H9tExuP+Si8aJjBL9FtmQnL3WtovNEyHorvDwDwWCTRzbP4xQQ8IgFBY7FbHjQbk3kq
	UYVElJApQjATJeOhYnpjdHYqFijJGV2pj0penwzEdl73SPMyyyNZbuRppdV3QbM47qu7Cc/9tJy
	mTdlq/JXMzQV8/lp7ltZDx7WzW/if34pn9qxEa4FbQb/7KoDpWfuaCdfRJ/jDV8IXk7toaFnPYl
	Z8u2ySDiFTLBBxfmmc46qBhjLnK5Gen64mjX3USvLgeOFY7TYDWHAiUrW1xZlT170ARSYF56Eig
	zzZkp3KmFDiouLs50XmNZhoAn3frZT3q0u+293HuDkioDu8BFg+/XvOvUXvZk56CXijZKJI4rOc
	baudXlrNhL5X6zMmnAqRqbvZeoIfbjxd7KYRfUgYH48QrDhDHrOeYiEDIQEtro0N9p7NBNYyUYQ
	5vvsCTHgkAubIEf/twFJm/dvMrUI3NVpJDpbOve56mkr2te5ZX8whG1iwqwfMtz/TD0XgnIdnO+
	eQExCa14pyKORekptIbC0et/oVzqf6Z0IxgEwv/+SC7XgjEg=
X-Received: by 2002:a17:90b:2705:b0:3ac:9717:afd1 with SMTP id 98e67ed59e1d1-3ae58319466mr1220106a91.63.1793180532909;
        Wed, 28 Oct 2026 02:42:12 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a93b3f5sm2242377a91.5.2026.10.28.02.42.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 02:42:12 -0700 (PDT)
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
Subject: [PATCH v7 09/16] ALSA: virtio: prioritize staged capture period work
Date: Wed, 28 Oct 2026 18:41:25 +0900
Message-ID: <20261028094132.20364-10-mynameisjune111@gmail.com>
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

CPU contention can delay staged capture period notifications while RX
completions continue filling the unread ring. In a two-vCPU VZ guest with
16 nice-0 CPU workers, the ACK-fixed baseline stopped with ring_capacity
and EPIPE in three runs, after 11.74, 30.77 and 30.33 seconds of audio.

Route staged capture period work through system_highpri_wq with a common
helper at all ten producers, including ACK errors and self-requeue. Keep
playback and non-staged streams on the normal workqueue. Initialization,
cancellation, buffer geometry and capture accounting remain unchanged.

With the same kernel, input, geometry and userspace priority, the candidate
completed three 70-second captures and immediate reopens. Its maximum
matched queue-to-start delay was 20.366 ms, versus 108.112 ms in the first
baseline failure. The other baseline failures had pending work without
matching execution, so matched-only statistics do not bound that delay.

Reader scheduling delays were also present. Both arms passed a separate
nice -10 reader control, and host load varied between runs. These results
support the change for the tested workload without isolating a kernel-only
cause or guaranteeing lossless capture under arbitrary CPU load.
KASAN/lockdep QEMU regressions passed with the unchanged candidate source.

This follows the staged ACK fix and pending VZ capture support. The
introducing staged-capture patch has no upstream Fixes commit ID yet.

Link: https://lore.kernel.org/all/rfc-v2-vz-capture-compat-1.b9ab4c1540dc4691@gmail.com/
Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>
---
 sound/virtio/virtio_pcm.c     |  4 ++--
 sound/virtio/virtio_pcm.h     | 12 ++++++++++++
 sound/virtio/virtio_pcm_msg.c |  6 +++---
 sound/virtio/virtio_pcm_ops.c | 10 +++++-----
 4 files changed, 22 insertions(+), 10 deletions(-)

diff --git a/sound/virtio/virtio_pcm.c b/sound/virtio/virtio_pcm.c
index a3478fc8848db..d8515b2144a14 100644
--- a/sound/virtio/virtio_pcm.c
+++ b/sound/virtio/virtio_pcm.c
@@ -397,7 +397,7 @@ static void virtsnd_pcm_period_elapsed(struct work_struct *work)
 	}
 
 	if (requeue)
-		schedule_work(&vss->elapsed_period);
+		virtsnd_pcm_schedule_period_elapsed(vss);
 }
 
 /**
@@ -606,7 +606,7 @@ void virtsnd_pcm_event(struct virtio_snd *snd, struct virtio_snd_event *event)
 			if (vss->xfer_enabled) {
 				vss->xfer_xrun = true;
 				if (vss->capture_staging)
-					schedule_work(&vss->elapsed_period);
+					virtsnd_pcm_schedule_period_elapsed(vss);
 			}
 		}
 		break;
diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
index e143a15592f05..5d1d88f2823b2 100644
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -8,6 +8,7 @@
 
 #include <linux/atomic.h>
 #include <linux/virtio_config.h>
+#include <linux/workqueue.h>
 #include <sound/pcm.h>
 #include <sound/pcm-indirect.h>
 
@@ -114,6 +115,17 @@ struct virtio_pcm_substream {
 	wait_queue_head_t msg_empty;
 };
 
+/* Keep non-staged PCM notifications on schedule_work()'s normal queue. */
+static inline bool
+virtsnd_pcm_schedule_period_elapsed(struct virtio_pcm_substream *vss)
+{
+	if (vss->direction == SNDRV_PCM_STREAM_CAPTURE &&
+	    vss->capture_staging)
+		return queue_work(system_highpri_wq, &vss->elapsed_period);
+
+	return schedule_work(&vss->elapsed_period);
+}
+
 /*
  * ALSA may observe a subperiod tail before its period callback. Keep actual
  * unread occupancy separate from pointer observations and notification state.
diff --git a/sound/virtio/virtio_pcm_msg.c b/sound/virtio/virtio_pcm_msg.c
index 795e52e09564b..663f7695b5be8 100644
--- a/sound/virtio/virtio_pcm_msg.c
+++ b/sound/virtio/virtio_pcm_msg.c
@@ -627,7 +627,7 @@ static void virtsnd_pcm_capture_xrun_locked(struct virtio_pcm_substream *vss)
 {
 	if (!vss->xfer_xrun) {
 		vss->xfer_xrun = true;
-		schedule_work(&vss->elapsed_period);
+		virtsnd_pcm_schedule_period_elapsed(vss);
 	}
 }
 
@@ -720,7 +720,7 @@ static void virtsnd_pcm_capture_complete(struct virtio_pcm_msg *msg,
 			virtsnd_pcm_capture_xrun_locked(vss);
 		}
 		if (got_audio && !vss->xfer_xrun)
-			schedule_work(&vss->elapsed_period);
+			virtsnd_pcm_schedule_period_elapsed(vss);
 	} else if (!vss->msg_count) {
 		wake_up_all(&vss->msg_empty);
 	}
@@ -858,7 +858,7 @@ static void virtsnd_pcm_msg_complete(struct virtio_pcm_msg *msg,
 		runtime->delay =
 			bytes_to_frames(runtime,
 					le32_to_cpu(msg->status.latency_bytes));
-		schedule_work(&vss->elapsed_period);
+		virtsnd_pcm_schedule_period_elapsed(vss);
 	} else if (!vss->msg_count) {
 		wake_up_all(&vss->msg_empty);
 	}
diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
index 85e7576903d56..d50924b792f65 100644
--- a/sound/virtio/virtio_pcm_ops.c
+++ b/sound/virtio/virtio_pcm_ops.c
@@ -232,7 +232,7 @@ virtsnd_pcm_pause_restart_fail(struct virtio_pcm_substream *vss,
 				VIRTSND_PCM_PAUSE_RESTART_RESET_REQUIRED;
 	}
 	if (notify_xrun)
-		schedule_work(&vss->elapsed_period);
+		virtsnd_pcm_schedule_period_elapsed(vss);
 	vss->substream->runtime->stop_operating = true;
 }
 
@@ -1253,7 +1253,7 @@ static int virtsnd_pcm_capture_staged_ack(struct virtio_pcm_substream *vss,
 			return -EPIPE;
 		if (!virtsnd_pcm_capture_counters_valid(vss)) {
 			vss->xfer_xrun = true;
-			schedule_work(&vss->elapsed_period);
+			virtsnd_pcm_schedule_period_elapsed(vss);
 			return -EPIPE;
 		}
 
@@ -1264,7 +1264,7 @@ static int virtsnd_pcm_capture_staged_ack(struct virtio_pcm_substream *vss,
 		if (diff < 0 ||
 		    (snd_pcm_uframes_t)diff > runtime->buffer_size) {
 			vss->xfer_xrun = true;
-			schedule_work(&vss->elapsed_period);
+			virtsnd_pcm_schedule_period_elapsed(vss);
 			return -EPIPE;
 		}
 
@@ -1275,7 +1275,7 @@ static int virtsnd_pcm_capture_staged_ack(struct virtio_pcm_substream *vss,
 				       &next_acked_total) ||
 		    next_acked_total > vss->capture_copied_total) {
 			vss->xfer_xrun = true;
-			schedule_work(&vss->elapsed_period);
+			virtsnd_pcm_schedule_period_elapsed(vss);
 			return -EPIPE;
 		}
 
@@ -1292,7 +1292,7 @@ static int virtsnd_pcm_capture_staged_ack(struct virtio_pcm_substream *vss,
 			rc = virtsnd_pcm_capture_send(vss);
 			if (rc) {
 				vss->xfer_xrun = true;
-				schedule_work(&vss->elapsed_period);
+				virtsnd_pcm_schedule_period_elapsed(vss);
 			}
 		}
 	}
