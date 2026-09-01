Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FCC479891
	for <linux-sound@vger.kernel.org>; Tue,  1 Sep 2026 09:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788254010; cv=none; b=s4MDheKY9vsM0BBzEvzj3S184H/D5u7/d95FaEQQyAI5YFRXeWxgJ6g3m4l0R5xG8dAEHUXZq6FxakG/5myWj+8ANlWBbtSz8I8u1xpmkRVRAo16XOESA5jT3LF7GLgNtcAPKwtIDwx18aXutB1GX0IzNxsfVU1sPLFDda/s8wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788254010; c=relaxed/simple;
	bh=wiy8pO7v9iI1/7qOJcZeis9iXMhYLOorLIS5PCg4eBE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z+K6BevCNl3w5M0gb3QPGfDaR9k3TtnFHv9yflqC82rJ1XkwGYKcRU4mNB0DM8kMUbYGrV1a+2saZ6B08WV2LkDS1LhsePAzk+zB0w3LAQVCrT+Dj82R5imk+9zR6YJdpBCK8Z0qWYE18cmiVFBqVVr8C7CkBhDbMGxTTwGKJOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NPoU7h1V; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NPoU7h1V"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-484392e3d33so1347333f8f.2
        for <linux-sound@vger.kernel.org>; Tue, 01 Sep 2026 02:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788254006; x=1788858806; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VTk2I9UAlwFcSdMLy483yatScQNtKnIT1avRSc59jAI=;
        b=NPoU7h1VFHs9yhF1P/3i7cfJt/00J2/eoUqyzFfqMk3K0POIMYTaxtODh0C6albeTo
         QgMlvgduPTmQgWJ1pIns+QXYKsqaK/n+NczhcRu5Yg1MoC9kSUz89MeysgKybHhVaSqA
         iBaySSBSnfTqRIjuwRjcc/GVtB5OQLWBiHjv4mcB7kXX31/GYhelcpirpJC46Hi0Wuob
         x2TxA5aGaQ/QZhPRLGcm+GcT9MyMsoDBhq8Jato07Fok2hZzGiqOkOvKmhzOdnyxprxp
         y0xgv+E+yT7k2+1RBWSukI7DlE5MQq6vcPQwJTmVdzJGOEK74PqQ9w62C22rhnq1ZjA3
         MtUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788254006; x=1788858806;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VTk2I9UAlwFcSdMLy483yatScQNtKnIT1avRSc59jAI=;
        b=mal5bDwZLolMQs5tXCOx7rdhZ54l6MS3G6nJFukCLhAhjpVKlJJQz8BgFYcr5eFX5x
         U86Ai61H6KeT+N9sIwZAgtF2cE5uVdagThBNgzOE0KPoXwfroE2kNqx51BMs+Oqn/7Xg
         hLWVq3H3Sf1Ff439rTwTA7NKaftNMYTAHT3K3tAMfBrz4FQ37OkdJcNZoJlELVG9ouVI
         /Dh1yde9mqczdWClwB2JvVdH1HTa0EwVyDTK8KUZspEZYZcCbyikqh2Ynu4vRJPx+0Sy
         RnPJrQ6Icn+16XFrNGhBrciCiiAcbnOTCqKAtSc8A1+mFYi4NjfuFgcUY7O6UZNxjO0p
         wkKQ==
X-Forwarded-Encrypted: i=1; AKwUvBxwEnf44mIRutk9vw7p7ShAXSKtYkvtej4DSsqZv4hDzWhf5x/CamX7J2b+4Q3+i4oPNHQo13JrgnCl/A==@vger.kernel.org
X-Gm-Message-State: AFuF++lnPjaxxjBAGHutBJUZzYDwVo64Cr9CAEwgCa9uCdJxkET0XELH
	8egmloXlfx0iYtFl3sQob4QFCalBkO0fvgfm7ID3ovkDb/4lePGWiNeH
X-Gm-Gg: AYBFou3Fb2tOPajZqxW+CUs0nN9njVqQEYzK4ap7uECJEdpfkSyCA6l0Mac+LynObZC
	oUzO0qNaDGz0G2oaUHA0NJ/iagLNlkxg65IRL3Q1gHdGRFiw5EcEUC1gxyyMDC84dbwuTRJDf+t
	GXgYQoW9bKPpED8xVpl+VyHsjnti5zeKmgmSOnDT9O/k7IgGYU6HiJ83d/+YQUyQgMR+wpN45yw
	DzRBthMOUdmUGcPrfrlkSmb0r2sb8ZkM4tNz0i9G1+XA0qom81oES6d+vUlE7Dybhegx22eUNfj
	VKiAXbXgwk8wkQjaFClLeT9G3W3LohXXW6Q3OqGgAVHaT1dIMgtA/GrTSeHor6KjyT1IdDvvdeD
	8kjcImSIRqdtOp0KQcxF6wu0HJHE4mWEuwhk6WW0FKKTzdzUIiiNGXxZTMuZW5IgF9UbbqDDthj
	pNdPs7xJwizxoajlZEtlSkSXensVrPvgnyZ/IquiT9lFhhAuinR1f4ZFZJmkjhG6Go3m652cSoo
	6QfmbthlA2BFwXKysvxCY7yRb2lBpIo25oXmJ9GTTctcGFzarBTjRMlbKEOdvAXVWKaY/lZ+u6C
	9XBmYvw4/yN33sLatkIGwn/YZkVeE7xfjwVdRF2EEVqz0/6Kuo+EvrJINFySPxoP+hw=
X-Received: by 2002:a05:6000:3106:b0:47f:8d71:210a with SMTP id ffacd0b85a97d-482f79cf4d0mr47047548f8f.15.1788254005998;
        Tue, 01 Sep 2026 02:13:25 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a16a-7801-fd8c-4b37-36b4-e53a.310.pool.telefonica.de. [2a02:3100:a16a:7801:fd8c:4b37:36b4:e53a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d781bcsm3378291f8f.26.2026.09.01.02.13.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 01 Sep 2026 02:13:25 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: stable@vger.kernel.org
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	=?UTF-8?q?C=C3=A1ssio=20Gabriel?= <cassiogabrielcontato@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+8fa95c41eafbc9d2ff6f@syzkaller.appspotmail.com,
	Takashi Iwai <tiwai@suse.de>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 6.1.y 2/2] ALSA: aloop: Fix peer runtime UAF during format-change stop
Date: Tue,  1 Sep 2026 11:13:02 +0200
Message-Id: <20260901091302.66860-3-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260901091302.66860-1-kmehltretter@gmail.com>
References: <2026050445-connector-rebuff-f713@gregkh>
 <20260901091302.66860-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Cássio Gabriel <cassiogabrielcontato@gmail.com>

[ Upstream commit e5c33cdc6f402eab8abd36ecf436b22c9d3a8aff ]

loopback_check_format() may stop the capture side when playback starts
with parameters that no longer match a running capture stream. Commit
826af7fa62e3 ("ALSA: aloop: Fix racy access at PCM trigger") moved
the peer lookup under cable->lock, but the actual snd_pcm_stop() still
runs after dropping that lock.

A concurrent close can clear the capture entry from cable->streams[] and
detach or free its runtime while the playback trigger path still holds a
stale peer substream pointer.

Keep a per-cable count of in-flight peer stops before dropping
cable->lock, and make free_cable() wait for those stops before
detaching the runtime. This preserves the existing behavior while
making the peer runtime lifetime explicit.

Reported-by: syzbot+8fa95c41eafbc9d2ff6f@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=8fa95c41eafbc9d2ff6f
Fixes: 597603d615d2 ("ALSA: introduce the snd-aloop module for the PCM loopback")
Cc: stable@vger.kernel.org
Suggested-by: Takashi Iwai <tiwai@suse.com>
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
Link: https://patch.msgid.link/20260424-alsa-aloop-peer-stop-uaf-v2-1-94e68101db8a@gmail.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
[ used scoped_guard(spinlock_irq) instead of guard(spinlock_irq) ]
Signed-off-by: Sasha Levin <sashal@kernel.org>
[ Karl Mehltretter: 6.12.y commit 03f52a9c1704 applies to 6.1.y/6.6.y
  unchanged; identical patch-id. ]
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 sound/drivers/aloop.c | 44 +++++++++++++++++++++++++++++--------------
 1 file changed, 30 insertions(+), 14 deletions(-)

diff --git a/sound/drivers/aloop.c b/sound/drivers/aloop.c
index 67bbadcec02b0..64870381d66ec 100644
--- a/sound/drivers/aloop.c
+++ b/sound/drivers/aloop.c
@@ -98,6 +98,9 @@ struct loopback_ops {
 struct loopback_cable {
 	spinlock_t lock;
 	struct loopback_pcm *streams[2];
+	/* in-flight peer stops running outside cable->lock */
+	atomic_t stop_count;
+	wait_queue_head_t stop_wait;
 	struct snd_pcm_hardware hw;
 	/* flags */
 	unsigned int valid;
@@ -347,8 +350,11 @@ static int loopback_check_format(struct loopback_cable *cable, int stream)
 				return 0;
 			if (stream == SNDRV_PCM_STREAM_CAPTURE)
 				return -EIO;
-			else if (cruntime->state == SNDRV_PCM_STATE_RUNNING)
+			else if (cruntime->state == SNDRV_PCM_STATE_RUNNING) {
+				/* close must not free the peer runtime below */
+				atomic_inc(&cable->stop_count);
 				stop_capture = true;
+			}
 		}
 
 		setup = get_setup(dpcm_play);
@@ -371,8 +377,11 @@ static int loopback_check_format(struct loopback_cable *cable, int stream)
 		}
 	}
 
-	if (stop_capture)
+	if (stop_capture) {
 		snd_pcm_stop(dpcm_capt->substream, SNDRV_PCM_STATE_DRAINING);
+		if (atomic_dec_and_test(&cable->stop_count))
+			wake_up(&cable->stop_wait);
+	}
 
 	return 0;
 }
@@ -1004,24 +1013,29 @@ static void free_cable(struct snd_pcm_substream *substream)
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
-		spin_lock_irq(&cable->lock);
-		cable->streams[substream->stream] = NULL;
-		spin_unlock_irq(&cable->lock);
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
@@ -1216,6 +1230,8 @@ static int loopback_open(struct snd_pcm_substream *substream)
 			goto unlock;
 		}
 		spin_lock_init(&cable->lock);
+		atomic_set(&cable->stop_count, 0);
+		init_waitqueue_head(&cable->stop_wait);
 		cable->hw = loopback_pcm_hardware;
 		if (loopback->timer_source)
 			cable->ops = &loopback_snd_timer_ops;
-- 
2.53.0
