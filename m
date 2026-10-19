Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155FA49BD71
	for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 09:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792400728; cv=none; b=VnQ5ezcGzbU3IN0Qpr6xEZEpdVrthuObFmuDB1NKZBolke793fk2JGazWhtHvuI/ipN4+rgsPoQOn8C4bVIJ38+q28Wc9ppiqK17dV8M1jxh82+R/UqjKpD9gLwlyzs1tLra69Bk17uVCxTEfoMQq9iyxd25acAdhASzjwMpXgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792400728; c=relaxed/simple;
	bh=jzuuBPdye6GTrcgIGVh1N89w7hxFWqGWluT/hN3k5F0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=nkLUv1kXGmDmMS142fPKDiCQOJj11QXy/XqoqncFzjjYUGi5oqLRlwF6UGaLLX/D1rFFpnxFr90u2kD2GqhAwtuMqQGseYpVOaNsnX0eeu/1UMG/NPDr9YVYtaNiBF5X1bnaQlw502+h3dfTLQRtZ+EbCU975H1ZdkGVFLWlQgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NoCYVe1O; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NoCYVe1O"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e8ad5b31c7so9482385ad.3
        for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 02:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792400726; x=1793005526; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kvj/M3ZtnK2Eicov9e8cmB6yLpQmkSXQCrllxl7LZ3Y=;
        b=NoCYVe1Odx7Sl7zurBrtabgkBhzv+B52CvwGa6QDGGAFSKsLyPdX2QWRKs6osw49v+
         rSCb7tDR5L/BoN9Y5ti5CJyJxrTFuy385jDA38wXBynKtnHystHtTNpV4UhnHBfM8Jlc
         v5MazGLO+X6YAJ++/QM76B5GoBm9GJmLHNr1sP2GrdElXJHzNKhwg7f7ZwrdkXNwCWBh
         2HRWTE0BW//gyNF/V/BAjlf4YysCXXfnL62INP2utQdWlS/e6yZLGGHOKbHVRfYmlXnc
         nblBvGWKqoQQ470i01iFN4dTWGaT4J3eImDfxlwYFi4FO7D9sbGyYucIwdZYHHDrmCcf
         0tFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792400726; x=1793005526;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Kvj/M3ZtnK2Eicov9e8cmB6yLpQmkSXQCrllxl7LZ3Y=;
        b=fhsezqGzX8xiYrFSxfHtLO08iEB3MoCLF8A7Z3hBaiUxFWp9tHVfNGyNWbjRoZw5xj
         rIDmOxfmA2mEjajUd89SWGdf+n5te+5JjnHmfyTaI2HtT0ddzXF4ul8cdpKL4SsnIqPz
         0IKGO6T56FAlYs4M1BFCxnzskNsJMMwZ04k5oMVFkyNA95kp4rbNcQGfuiAuKYKvr1qQ
         gmmQhOiXMZ/utRNva4ilC3hE5LQvScVfsppn7OOSK85f/gcU7od4n0CAey3StstRjt/V
         V/XllwW9g+znJHq51+GO/Z8yZan3nKN/10Z2B+EzMfDVajNFgzev4M5OBYxdbZzlxHyi
         B0BQ==
X-Gm-Message-State: AFq9FYIZ2kC2OVyNKdTPaQ+clVIGIrnnMWg41knK1RC5rmzuK2XD1Kto
	qwcqEwbzBZ1u0Hy3U+xVZhsdtY8oOR+kCAPLR3B0oGMwseaDL7FhxgZM
X-Gm-Gg: AYBFou0lQiQ6oL7R1nC3B7cX79+Jgl9SSPhVOiEjb033SmcD1jLr4aOkVvJ1F71pHNP
	EAszsPXFpQmSIfTlAsZ2qittSU/U6dv0xoqYHSIrch5K8HARjSct/zSrqDDF2sRwleX6rmt+eys
	VMqc3M7Yy5WEuVwIY6wYVFYfjXX1I0T7upylQtjUFBjMJY5M2q+21OGUl+xzu+tNV69ra+DOKwn
	dAdOcPkPsf3Menee8sdbW7ZcMNBem0OUIrp69kS7gmZ/iuW7Dq70Zl2jpwuq1dJLl0uyW57oF1t
	pPkdMnSA6K1k2QHKl9wZpaZrBJWs8JkJJkzBfFqcLbXFz8ClxBojRe6RsSuEh8BKnYxFbVJGoOd
	5SiJL9nYdc7BikfU6lvxFMZp4pKiTnwN0f+CmueBxflStOw+u4ostvSyma4QO1JRcMB0wfiN13P
	RqGy9Vf1112GtT0iuvJVgpnR5x1UbORkIoNVD6wGL5zFaopfDxzZnfhMTYW8vUo5uc1g==
X-Received: by 2002:a17:903:244d:b0:2e8:34f9:735f with SMTP id d9443c01a7336-2e9a69eaa4dmr61772565ad.16.1792400726218;
        Mon, 19 Oct 2026 02:05:26 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8ab443sm35993515ad.65.2026.10.19.02.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:05:25 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH] ALSA: aloop: Keep shared timer callbacks alive through close
Date: Mon, 19 Oct 2026 17:05:21 +0800
Message-Id: <pm-pmb-275c4399f517e09d7188-v2-2f64c1328529ef7a8fec@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The shared sound-timer callback must finish using the selected PCM
runtimes before a close can detach them. loopback_snd_timer_period_elapsed()
saves the active substreams under cable->lock, then drops the lock before
calling snd_pcm_period_elapsed() or snd_pcm_stop_xrun(). The sound-timer
backend has no per-stream close drain, and free_cable() keeps the timer
open when the paired endpoint remains attached.

With both directions running on a shared sound timer, playback can be
dropped and closed while a notification is pending. Capture keeps the
timer alive, allowing this order:

  Timer callback                       Playback owner
  --------------                       --------------
  select playback under cable->lock
  unlock; delay notification
                                       DROP; HW_FREE -> OPEN
                                       close: snd_pcm_drop(); unlock
                                       free_cable(); peer stays alive
  snd_pcm_period_elapsed()
    lock stream; cache runtime
                                       snd_pcm_detach_substream()
                                         free runtime and its fasync
    read runtime->fasync

The stream lock taken by snd_pcm_drop() cannot protect a notification
that starts after it returns, and detach does not take it. The callback
can therefore read runtime->fasync after the runtime has been freed, and
an escaped notification can also reach a replacement runtime if the same
substream slot is reopened before the notification resumes.

Take the existing cable->stop_count reference under cable->lock when
selecting the targets and release it after the PCM callbacks finish,
including the XRUN path. free_cable() already removes the closing
endpoint under that lock and waits for stop_count before returning, so
runtime detach and slot reuse cannot overtake the notification.

Fixes: 26c53379f98d ("ALSA: aloop: Support selection of snd_timer instead of jiffies")
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
Assisted-by: LLM

---

diff --git a/sound/drivers/aloop.c b/sound/drivers/aloop.c
index 0aaa64b189daef377f080a63665a9be9036e9d9c..39710389f6243ef1fb8018fa4990c22d382a21b0 100644
--- a/sound/drivers/aloop.c
+++ b/sound/drivers/aloop.c
@@ -100,7 +100,7 @@ struct loopback_ops {
 struct loopback_cable {
 	spinlock_t lock;
 	struct loopback_pcm *streams[2];
-	/* in-flight peer stops running outside cable->lock */
+	/* in-flight PCM callbacks running outside cable->lock */
 	struct snd_refcount stop_count;
 	struct snd_pcm_hardware hw;
 	/* flags */
@@ -873,6 +873,8 @@ static void loopback_snd_timer_period_elapsed(struct loopback_cable *cable,
 		valid_runtime = (running & (1 << SNDRV_PCM_STREAM_PLAYBACK)) ?
 			dpcm_play->substream->runtime :
 			dpcm_capt->substream->runtime;
+		/* Keep runtimes alive through the PCM callbacks. */
+		snd_refcount_get(&cable->stop_count);
 
 		/* resolution is only valid for SNDRV_TIMER_EVENT_TICK events */
 		if (event == SNDRV_TIMER_EVENT_TICK) {
@@ -908,13 +910,16 @@ static void loopback_snd_timer_period_elapsed(struct loopback_cable *cable,
 			snd_pcm_stop_xrun(substream_play);
 		if (substream_capt)
 			snd_pcm_stop_xrun(substream_capt);
-		return;
+		goto exit;
 	}
 
 	if (substream_play)
 		snd_pcm_period_elapsed(substream_play);
 	if (substream_capt)
 		snd_pcm_period_elapsed(substream_capt);
+
+exit:
+	snd_refcount_put(&cable->stop_count);
 }
 
 static void loopback_snd_timer_function(struct snd_timer_instance *timeri,
@@ -1174,7 +1179,7 @@ static void free_cable(struct snd_pcm_substream *substream)
 		other_alive = cable->streams[!substream->stream];
 	}
 
-	/* Pair with the stop_count increment in loopback_check_format(). */
+	/* Wait for PCM callbacks running outside cable->lock. */
 	snd_refcount_sync(&cable->stop_count);
 	if (other_alive)
 		return;
