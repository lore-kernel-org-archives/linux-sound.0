Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB833C1F41
	for <linux-sound@vger.kernel.org>; Tue,  1 Sep 2026 08:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788252425; cv=none; b=uYWmY24F9wz2LoN6HQnjahBATAipaVR6Nr0XUXApdfJZ+DoGwzzEfOozuwVAl4YIKtrB5WdQqbbCbwW7SCLK0KPuj6gAdVC6b48iRVLEZECVTNIBvVQVfOgVFLV3EYjXO+gS3xxO8Qq+kT9qt8G5VKHtv7Tn+iKhl24nQ+G84cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788252425; c=relaxed/simple;
	bh=wiy8pO7v9iI1/7qOJcZeis9iXMhYLOorLIS5PCg4eBE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hfXMddsAkDMbIRoSPzvtwONpAX0oIHsb1e7ulV3McwJC9rkREKTQiRWi2OlKVcw0KbPvTPjVh6otYqsk/KmU3BwoDKnAki5BomEDWvxkQ4W6W/Zoel87vgjQruVooc4zIkER60IqZNsFunkf8tUx5nOqfh6jcBZM/h3ajWqYx3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GF/nWHXF; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GF/nWHXF"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-499ae1c6471so32435765e9.3
        for <linux-sound@vger.kernel.org>; Tue, 01 Sep 2026 01:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788252422; x=1788857222; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VTk2I9UAlwFcSdMLy483yatScQNtKnIT1avRSc59jAI=;
        b=GF/nWHXFzOuCxuQv4YvkEWRQFPk5cLhoTOMVYKxJbqsicqjh0W8vtnttXwkoRZkqBe
         +qTqyUOCcI9ZJgbUI9BkT6CFFGB+/HDV+/lN2LAioAN0VWJqAckEY5WDF/gUyXQC01pP
         gGB0OTI5T1YdW5OLSmqKb4Z39FqX9rwBv7Qiar8H6munCzOX5/NuclHbTkP0ua77lJ62
         UrrOnUsiRQ6btTK8BC8T+ChNNlQZDHSivqMjE6h3CL9tokz+fUtfyGXFpta6RspCWTcB
         tfGFUCexYDNUNwcIusV21/O7HaMvd61AdaA3kTUVphQYD4rmIrZHWBMOfdexTYzeMdgb
         qzhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788252422; x=1788857222;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VTk2I9UAlwFcSdMLy483yatScQNtKnIT1avRSc59jAI=;
        b=Gf3NeHMDKJB7lsvQGBmbbv3UW4f2yJyOtVpuhdV+o23GnRqJhN38wJTY93c/vYUNTj
         ULKzVNp8P7+DmE2DS2I0TKuEcWBhjNXP80a/IZoE8gi28G4vaN2IZTPE9KBbLWGSo9mj
         R5/xlAsea210A3DUE4LN8SiJj30+MHGYbT3D92FIGvWvlvyT6T376qzkDl/ArSXfM7BH
         yPGVSRkEUG21duVMGFK4XP2Blt+4hfyEwW4/SStRsCJP5NJbJltLMNcmZtwrO0z273xA
         W2pCbV0aoqJDAMXP3uhlurF5Od+mWQkS9AhT9tscI1dhBykOR1dPJKp7Tbhw8FD4DpjI
         SdfA==
X-Forwarded-Encrypted: i=1; AHgh+RpokAgX7fehPf+zbhj/2LILnYhRabv2MV35+xjvOWwf8DS2cEY68S3FQ9DTTERHSngE0aB8QCwffXfgqw==@vger.kernel.org
X-Gm-Message-State: AFuF++kR1Tu5yg269LU9YLSLEfybKXS3HkSUjsWYC1SqKRSgSPfUzUWu
	VDVZE248c2CLD/9PyF40aZ6BCZj0NZ3pZQJHQOcxaL+vdzdAunjHEHzK
X-Gm-Gg: AR+sD11umA8/uMOPhcHVAbyaL17RoofLiwGwt9tCygTsEN7iTMgAJ8UMJmUBXR+1dP2
	GioMUbCFx5m/7Xrrsh5YM3n92u8s4n0kiDvPOGYp3YfYcS0FXN8LdFXqbnYj8dyOCoZzTO8AmUZ
	KBvBV7rI98O9wcE0iDCSUeyzmf5A0SEeiH7AALrToXB+mo9YI+FPz8X3jFJV1bC95//12gccaR2
	kqp6Hj+lN0qPrVifQxy//zwu98CPxRo0/kRekGbfoQWxxXL1KzIcChTC8Ok7yYfI38gdf2OnzxX
	GG6MpRPSRt93rddjkPXXIAJw5Y+1gIeUhHc7qkp/hVv4pnq/tbP384RXHh5OFEseJqa2CPrcKmW
	p92dRmtp0Q43152kbWXbDXcjxVM2cL2+oyFhfUO/dMJDTSonThE2JT8MByeuOexm64nuLpJ4Pzi
	z9vzz36R4F+2182OViL0v/5cKZM7J5dkwFanj9izHEw8PuIZEW/6rlzZ9ZSuk+a0SI7rVTWG4jE
	F9l5viC49cn2XNK6zWDzPlHdGFdPoE2y87KUIdYi7DP9ycaaTM+wv0Pb8RDVE+OSSXdDtnoS+NC
	C12kOzDnlEX5GlcQcQy6hBi5T0qDFmwLm5ci0ug0Gh4Md6077RCTuWQLKXuQtWHwT5I=
X-Received: by 2002:a05:600c:a00d:b0:49a:252d:52f5 with SMTP id 5b1f17b1804b1-49cdc45253dmr125349725e9.11.1788252422042;
        Tue, 01 Sep 2026 01:47:02 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a16a-7801-fd8c-4b37-36b4-e53a.310.pool.telefonica.de. [2a02:3100:a16a:7801:fd8c:4b37:36b4:e53a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9266be71sm727447725e9.2.2026.09.01.01.47.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 01 Sep 2026 01:47:01 -0700 (PDT)
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
Subject: [PATCH 6.6.y 2/2] ALSA: aloop: Fix peer runtime UAF during format-change stop
Date: Tue,  1 Sep 2026 10:46:37 +0200
Message-Id: <20260901084637.66106-3-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260901084637.66106-1-kmehltretter@gmail.com>
References: <2026050445-detention-cussed-a8c0@gregkh>
 <20260901084637.66106-1-kmehltretter@gmail.com>
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
