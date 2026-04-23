Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C323074A1
	for <linux-sound@vger.kernel.org>; Thu, 23 Apr 2026 03:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776914556; cv=none; b=Eu+BfhwwvbfLXyq2PpRIrB2CbQ26O58bnc2HrXS7Qdk+GXATKKr5hfv41iubBXgOoAl+V11nTzzjo097aLyckqhJc5p4372sqWfbyQOyZ7ZIBmhDEvd2AROBRHe+FDjLEC7YkoYPCBTkLOg4gWksCExmga235jlYtvhQf8oLazQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776914556; c=relaxed/simple;
	bh=NubATWqIlRQtHd86zU1bKapSR3mZbmlH/41h5Ws8wx0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LJQGyws8rp67lgsZTlR57ePtkzHAulC3Uikn6lG4PWSNsHyHxnYLcKJ1o2QLx6wP7LZrmCt+vdLXPpOy4o6vWe1oAwdMl/nHvp/6MiPBqzBA49az7Z51edaVZW/ZLTtEWdb36GqxS+HNP7KTTflOxFZkVFmLrg1ZldA0D0K1r9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YwygvMXj; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YwygvMXj"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2de831d2b20so3559793eec.1
        for <linux-sound@vger.kernel.org>; Wed, 22 Apr 2026 20:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776914554; x=1777519354; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QncE8TBARcMHwtxwUcHJfb/q3J332m6DpzRIhKgNNdc=;
        b=YwygvMXjxbFi76b4v2p16YaztYpwVr3DJeiS53ZHjt1pNcRzOo5RLYVILx6TvtmXtZ
         XhXOpKQFMa8JFwA5Vk91hcbL0gksLTc16Blw+nRxAyAQEu2Y/a9RJ734xQS8T+WeqQ7K
         iFjnfVZO62IzS1T9yfjwju7wXkiKRmg0zZ0W9Efy3QV7ZuFYKEDJ/vZbYetF5lK9/6/t
         EJ0TK9GJleV36r6HRsSmEqIelk1IB58xh1+wP4g0l5eIwHT9PWZnmsBIOvx7hulGpx+B
         zyZMJXItdHauieZenVwUchkBC+QovcIAycdzBPWr3ZN4RU6GqrIunOGCDXa3sOtMnYUj
         AXyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776914554; x=1777519354;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QncE8TBARcMHwtxwUcHJfb/q3J332m6DpzRIhKgNNdc=;
        b=KakqBX3IDCVFnBnLGWUPzJ5rPOF8g+CFVl8dUSYul2Qxo7+AsSYcXm1rthc58nqvix
         IRYIlaW4TponnBhjuEqkrA7xeM6PU2fgSZKKQWOuIPzMFkbQs0x4MnTJiLzr4/FsB6Wy
         0OakLuXnBeId7c4VGeeAF8sfEu8AG8bJgdqymvE0W758ISIVNZS8vSiPVIpMdpAcaYCa
         QxXAcTrXm4Il2CsBb43/cfyEifFt4KL95wbE8RBY2DeorCyPNLJZIxMoSApRcjsDOfp5
         rwHBAHyuBzLISbvKN3gzovlJsRXZTyT2yUSFTkU2S3nCPLSGkGgXR4+djG0mYHXaZjoF
         7adg==
X-Gm-Message-State: AOJu0Yye6E7fIQfzomOe+qBLYnHg2q95ExPqaqFJb1wVIhfeMMnux7Ks
	zF5EHYP23pp9BJbOQorC7nsALgrjgDoKruPtD2woancxttl5wT/Wwczz
X-Gm-Gg: AeBDievdHGerp4upiaiHb2hSoRss8R/z63dKzBmQi6ZfqrDbe7cys9dnVmMKT6VN9z1
	Vv37bBl7ubyAf2hTTFVjp+61c6RejZktXQnpK5vMTUjYBg/s5weVJR3SXQXhSejTFqpiEeYrtCT
	dalQj3smVHNrqXxF57adpMO7SY2V6dvk5S3iVb2VDh4ywHYxGcI75aF+KibIDxYBq3VrGKk4ODk
	mCb5MrPnNYuQmRpGb3aqsosbNKvAy3L5ui5A5GscoJg1JtHMhxNSEdtPdARS8+4kbRT3bwVsUwS
	JSHMcmx34Y02UdOFORuUXJdz49m7OtvDhuuTb+gOGsJ+iWmWQxnBiAFyhsN+VY7ydRUw2RZ13/s
	rxzd9WFRvSfVuYGwBJsll7dBw1VhSCdbzAT2wGme34nilf4vCxCKFZJejlJAywgpSNMhyb76BnE
	VnvVLOUWJPpjbgllVO1daCLjAZ+yLLFkmuO5li4ewAGjRpdOxXNiVbFrzxsEMlpqjtp3s4E2Al0
	ftcnGfbuJE9M9X3NXOpuuA=
X-Received: by 2002:a05:693c:2a07:b0:2e5:8123:c7f3 with SMTP id 5a478bee46e88-2e581244e84mr11175794eec.28.1776914553963;
        Wed, 22 Apr 2026 20:22:33 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-87.user3p.v-tal.net.br. [177.4.161.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d2cfd3esm25599854eec.21.2026.04.22.20.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 20:22:32 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Thu, 23 Apr 2026 00:22:22 -0300
Subject: [PATCH] ALSA: aloop: Fix peer runtime UAF during format-change
 stop
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260423-alsa-aloop-peer-stop-uaf-v1-1-25d8a9745f6c@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQrCQAxFr1KyNpCG6sKriItp+6sR6QyTVoTSu
 xt18/lv8d5GjmpwOjcbVbzMLc8B7aGh4Z7mG9jGYFLRk3SqnJ6eYnIuXIDKvsRb08Qi3QhtVfq
 jUuilYrL3L325/tnX/oFh+fZo3z9cgOsefAAAAA==
X-Change-ID: 20260422-alsa-aloop-peer-stop-uaf-004de2120b52
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 syzbot+8fa95c41eafbc9d2ff6f@syzkaller.appspotmail.com, 
 stable@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5283;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=NubATWqIlRQtHd86zU1bKapSR3mZbmlH/41h5Ws8wx0=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJkvJ5Q6GH73bOneFOY0ZbH+/uMv79fdK/w89cjtrZXSp
 7Kqlsi97ShlYRDjYpAVU2RZnbTIck/Xg6v1cSs8YOawMoEMYeDiFICJNKozMjR4B025vHTXh3nh
 P7+lfnuqbL/2aHxO/N6cN2+P9+ZO3beJ4a+oj/GbFm+bax8/dLaJ/Jq66F9GyLbXkwt+STq9uvV
 gcSsnAA==
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

loopback_check_format() may stop the capture side when playback starts
with parameters that no longer match a running capture stream. Commit
826af7fa62e3 ("ALSA: aloop: Fix racy access at PCM trigger") moved
the peer lookup under cable->lock, but the actual snd_pcm_stop() still
runs after dropping that lock.

A concurrent close can clear the capture entry from cable->streams[] and
detach or free its runtime while the playback trigger path still holds a
stale peer substream pointer.

Keep a per-cable count of in-flight peer stops before dropping
cable->lock, make free_cable() wait for those stops before detaching the
runtime, and take the peer stream lock around snd_pcm_stop(). This
preserves the existing behavior while making the peer runtime lifetime
explicit.

Reported-by: syzbot+8fa95c41eafbc9d2ff6f@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=8fa95c41eafbc9d2ff6f
Fixes: 597603d615d2 ("ALSA: introduce the snd-aloop module for the PCM loopback")
Cc: stable@vger.kernel.org
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/drivers/aloop.c | 56 ++++++++++++++++++++++++++++++++++++---------------
 1 file changed, 40 insertions(+), 16 deletions(-)

diff --git a/sound/drivers/aloop.c b/sound/drivers/aloop.c
index aa0d2fcb1a18..a997ee262740 100644
--- a/sound/drivers/aloop.c
+++ b/sound/drivers/aloop.c
@@ -99,6 +99,9 @@ struct loopback_ops {
 struct loopback_cable {
 	spinlock_t lock;
 	struct loopback_pcm *streams[2];
+	/* in-flight peer stops running outside cable->lock */
+	atomic_t stop_count;
+	wait_queue_head_t stop_wait;
 	struct snd_pcm_hardware hw;
 	/* flags */
 	unsigned int valid;
@@ -337,10 +340,10 @@ static bool is_access_interleaved(snd_pcm_access_t access)
 static int loopback_check_format(struct loopback_cable *cable, int stream)
 {
 	struct loopback_pcm *dpcm_play, *dpcm_capt;
+	struct loopback_pcm *stop_dpcm = NULL;
 	struct snd_pcm_runtime *runtime, *cruntime;
 	struct loopback_setup *setup;
 	struct snd_card *card;
-	bool stop_capture = false;
 	int check;
 
 	scoped_guard(spinlock_irqsave, &cable->lock) {
@@ -366,8 +369,11 @@ static int loopback_check_format(struct loopback_cable *cable, int stream)
 				return 0;
 			if (stream == SNDRV_PCM_STREAM_CAPTURE)
 				return -EIO;
-			else if (cruntime->state == SNDRV_PCM_STATE_RUNNING)
-				stop_capture = true;
+			else if (cruntime->state == SNDRV_PCM_STATE_RUNNING) {
+				/* close must not free the peer runtime below */
+				atomic_inc(&cable->stop_count);
+				stop_dpcm = dpcm_capt;
+			}
 		}
 
 		setup = get_setup(dpcm_play);
@@ -396,8 +402,18 @@ static int loopback_check_format(struct loopback_cable *cable, int stream)
 		}
 	}
 
-	if (stop_capture)
-		snd_pcm_stop(dpcm_capt->substream, SNDRV_PCM_STATE_DRAINING);
+	if (stop_dpcm) {
+		struct snd_pcm_substream *stop_substream = stop_dpcm->substream;
+		unsigned long flags;
+
+		snd_pcm_stream_lock_irqsave_nested(stop_substream, flags);
+		if (stop_substream->runtime && snd_pcm_running(stop_substream))
+			snd_pcm_stop(stop_substream, SNDRV_PCM_STATE_DRAINING);
+		snd_pcm_stream_unlock_irqrestore(stop_substream, flags);
+
+		if (atomic_dec_and_test(&cable->stop_count))
+			wake_up(&cable->stop_wait);
+	}
 
 	return 0;
 }
@@ -1049,23 +1065,29 @@ static void free_cable(struct snd_pcm_substream *substream)
 	struct loopback *loopback = substream->private_data;
 	int dev = get_cable_index(substream);
 	struct loopback_cable *cable;
+	struct loopback_pcm *dpcm;
+	bool other_alive;
 
 	cable = loopback->cables[substream->number][dev];
 	if (!cable)
 		return;
-	if (cable->streams[!substream->stream]) {
-		/* other stream is still alive */
-		guard(spinlock_irq)(&cable->lock);
-		cable->streams[substream->stream] = NULL;
-	} else {
-		struct loopback_pcm *dpcm = substream->runtime->private_data;
 
-		if (cable->ops && cable->ops->close_cable && dpcm)
-			cable->ops->close_cable(dpcm);
-		/* free the cable */
-		loopback->cables[substream->number][dev] = NULL;
-		kfree(cable);
+	scoped_guard(spinlock_irq, &cable->lock) {
+		cable->streams[substream->stream] = NULL;
+		other_alive = cable->streams[!substream->stream];
 	}
+
+	/* Pair with the stop_count increment in loopback_check_format(). */
+	wait_event(cable->stop_wait, !atomic_read(&cable->stop_count));
+	if (other_alive)
+		return;
+
+	dpcm = substream->runtime->private_data;
+	if (cable->ops && cable->ops->close_cable && dpcm)
+		cable->ops->close_cable(dpcm);
+	/* free the cable */
+	loopback->cables[substream->number][dev] = NULL;
+	kfree(cable);
 }
 
 static int loopback_jiffies_timer_open(struct loopback_pcm *dpcm)
@@ -1260,6 +1282,8 @@ static int loopback_open(struct snd_pcm_substream *substream)
 			goto unlock;
 		}
 		spin_lock_init(&cable->lock);
+		atomic_set(&cable->stop_count, 0);
+		init_waitqueue_head(&cable->stop_wait);
 		cable->hw = loopback_pcm_hardware;
 		if (loopback->timer_source)
 			cable->ops = &loopback_snd_timer_ops;

---
base-commit: 03ef04a70af3ddfa925d78015713fdb4a15e4e88
change-id: 20260422-alsa-aloop-peer-stop-uaf-004de2120b52

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

