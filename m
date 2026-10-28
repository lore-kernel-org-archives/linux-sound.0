Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793156033;
	b=LgyhjvFWqi0M/SBZxs3Dgzv2LQzrT+1Iy2fqudoYqLMm6pzR6Rh4jE/YalUeM0uYsNCW
	 zL0/ixsyd/dwU81I2H6sU0dzj3irs7iHvjzfTGKjqNHwswS1Nxm8lIPgweZzvwBfaVBK+
	 P7h0Wg6/JrCWQNYUDMgWVsCUl+vU2hsf5pDJ7VdzP8sA99zcN7NAb1MZvlx90TVvUZFDp
	 Io+CcyN9I8ZT8PbrMBSBWkt0IADs9UJLkMe18ER3qQCJzmx+/pc5tWs9rbeQvUC8rC6vj
	 d+IZfCUrRwmv4SfCkwPRM1qZlB7+cj4iYXCRO6teywBZcWd+u5i80LzUA5tDp2iX06w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793156033;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1SSKD9R3/tZDll832XAf/4iUolviOcI2RSxt/Z/hu94=;
	b=0olHHYDCgxt+Xa3ySf9MKB6+JjxR9t4issACgu7EyuuFmdVj+V1ImLSp7fclyhJ68Ekm
	 DKMFvqmWppKn12AnNrtW6AfePzxkGzbEg7z563WCLB65hAXIhId9zRuEX6H491j5QlNr3
	 7LVoAeLYZDnQx0KtGaV41iRSn6wgYDOm224ESKBTmIyzs3xSv0cMEB1aDibbq4RwqtnJ0
	 L9wsCzNTX0XuTdQajBllMfIY5NQgvVpaPpNFoCXr4EgzIPvc5tHeliJRguiFn3RNlLUQo
	 lhnIzUAjjcDADQw0gMp3u5NiLQF/zheYJGO2RaAbvhD1FdgaxU7EplfpBQeVutK/aAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DPi8iLdR;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAB660A3801
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 02:53:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBAB660A3801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DPi8iLdR
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36a17a332ecso646310eec.1
        for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 19:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793156032; x=1793760832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1SSKD9R3/tZDll832XAf/4iUolviOcI2RSxt/Z/hu94=;
        b=DPi8iLdRyWSaczsEbkNC0GUVGXhSs0lm4GlgWnajxIkDH03GPk/RnsoCEN0RCCmQ4A
         Gutd4I+W7m/5C5xKezUBE3JXMLjZsg87O4cqBykkrgPwnJ2SvoYST38Cl/Tz9K4zUfUG
         baoR7N4XApxfEg93X1WvpYtiCemecJuxrXCQffYNfLWbtTwidrIiNvZ1/kQ2j7o3wv10
         kCH4XxtL4IhwuvAr1o8ao0JzyaVMYkYoOmRw9txMfl7+5S0UpEJtw+yYw9fy7hxmRAoW
         dSHOMyYKHe5IywS1qeneGj6Bs/4lvHmXQRufDsa8Gi1v7FoHOGUl5de12icaVJD7ICmx
         oFKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793156032; x=1793760832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1SSKD9R3/tZDll832XAf/4iUolviOcI2RSxt/Z/hu94=;
        b=NMtuKJoJ1gfg/Q/IL1fN6w58VMnhAa8sThb6lUnQraik4nalF0xK9Bc6tpqiybGwuW
         7FettwC4RCfwrmZVfd55qkbDGyrc8mVI4kV+zZufpgVrj9Sc4gKQIRG4vcousr2dnJfW
         OpmzHw9qDdoddbdOQcgMEKLtC8Dg2JKKBeAACcrK49gWqENM2+Rwm4rAKW0SlUVG6SZI
         FCMC9tkiVcBpUx1JWALwG0AarhDc3eRR3SiMuLlR7RuWFq0JIt1NJQ4V41P2GaD3oQjD
         VgfqWXddPhk3dVYesGSNKDcBER4RrzapMX0ogMiVFF1OBzWZdYyB6MuoFJE7E/1yUsTU
         1Mwg==
X-Gm-Message-State: AFq9FYI4vf8A/GHGTAva+bAcxJQBDmFpMRCq7TE1VTFzp4UMNb3qrzqo
	9Y9W7QprsG6hK0JCoa2dOt72xogn7MUwWUVh5zMWAoETTybfXNZKJRLGtPW/2w==
X-Gm-Gg: AYBFou3qPGi7NeOPrWocqEBgOpB0LfblOhqvxGLtkneU5oBNsGpp1W283UMTFHxMsfD
	dIy9eK5s94WPIeZL2qKAUq3+b27dTLmoxBp7HVKG8baLX4hS3uqVg8CJXA2n9CJa+Pp/cJ4GQYZ
	ilYE6VYHZopJxvsLORVPfHfK8syow8Gq8XYKtOGkZ2t+P5JLkSLpbdtfd7tkJ+gN0lh2hx+SV+F
	PuARt03BdFsyU6x/pRlXCjMlkWpgfkwxILYK0G6FuHADmv6a/yntFFLrmpjicFz1Y5LMppPKaoU
	mcUX9IfIyUrusdhDP7qUUTjFKh6bAMVGum9sYn1GCCE59UASmdL15vE2dkPvgWjrpymrmetPt7d
	XRk+TiUyweIf+wBuV3ULg/dQ8/0vnwcJnLTjkB6x3NIQ8a3fbtSJ71cu59UHBd2MJnezIZRZGJ7
	DSjgp+moMkFDs1AdWSlPLLMaFRL6Zng0QOfabHnGQynhCCT1FHmvD0AsiC5IlFp/yhNvEEVkwOM
	tsT07cdqKtfbuR7qbLFsb6dgC+sMYgqH1HgcjrTsKvl9eMbUx24J587O0LLQ/OS6lE6EY8nwgEd
	4n50231Hd4uv84o4er+Pmz3T+K/Zkg9yZX5cPkrmvCefrXneZ99RpR/GFV5DcKAZdNbeYYMaByP
	RwcApxl1PZ40TRg63xR9ILA5yVMXDRFU+ITUe2KxHrOZ6A+c=
X-Received: by 2002:a05:7300:3a9d:b0:35c:85fa:5a61 with SMTP id 5a478bee46e88-36a201eb246mr1662143eec.38.1793156031765;
        Tue, 27 Oct 2026 19:53:51 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239644efsm1711914eec.23.2026.10.27.19.53.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 19:53:51 -0700 (PDT)
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
Subject: [PATCH v6 09/14] ALSA: virtio: prioritize staged capture period work
Date: Wed, 28 Oct 2026 11:53:12 +0900
Message-ID: <20261028025317.92450-10-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261028025317.92450-1-mynameisjune111@gmail.com>
References: <20261028025317.92450-1-mynameisjune111@gmail.com>
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
