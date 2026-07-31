Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9F719E968
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 07:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785483844; cv=none; b=SMNXO5OawqSOKmxppW+Zy6h2oNkr9f9Bcc/ASQYS6a56BLsgwXvFyCIG1klWsDrq2CPjkIiYO6G2yFE4foLkKwoGXsyJtagLsRVpXY7GJMMoXoI92ssFqY8bp2Jci0+GaHcqva/hgOK8PoEguyaKyEKfQ8f6AOpM16RAXfTYrRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785483844; c=relaxed/simple;
	bh=yE69Eme228d1LmreT7Y4hRtJZh1nZD7/C0FT5+F3hWs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LHlcAw7p850jgQovpORvAaEiaQKZUoZXmgis8hJwhB36q12wa/Spw+HRVzkhwKmA/enfGXP3djRIdHVTM89Ez+7BgNrOs4QTeAS2tgay5rGFCBTqMAeB4oKXCEjtbk9DVPR/mKxWMgO9VVvHmbRn3x2ScHkkn4NpvaQ8taPG4bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CVCGVjlj; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CVCGVjlj"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-84e507b079dso527048b3a.0
        for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 00:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785483842; x=1786088642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AazHT0RVZ5SXR5gPgJOo7RhEyRbnTq3IhCor0nbYEic=;
        b=CVCGVjljxqh6jMMYBrZQ2TxNHDup1a+y3XwF/OOpEeIZP+AP+Ohr86rKu0iyT6sRIo
         qZGiPR/Tiiytu44xmNRAhwjresjhoFjlJrWr8Au5FIN7ROpMF2uXLwaZeRSSyWZDNDWC
         sCersOcweBUsqZ5hKE1cpXW3aH1/TLeaEtG6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785483842; x=1786088642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AazHT0RVZ5SXR5gPgJOo7RhEyRbnTq3IhCor0nbYEic=;
        b=JWWu5XCDygOBxm6ZVQUv3+IhWb7JqVgtLwA+ftOknYtxbJOe65BgAQXbrYSTCeS9Tk
         l2S6vPgTYasOAENByulqmdujWq1FUeouPBi7w6t5UqYCzdTjA/W2VV0Zk3IP7STOntbk
         miKBfxbN7FSh9zytpLvg+2l7pcHFnJwYjFY1STJE/cRccfz3hg7SQZk62TcWX9wNPps2
         FRVjSLCRfCsoThEeI+Wdq+d0TP0FiMLdBEYBSWAH7ToYBAOGphsN5t4BR4hwbn1cq/kB
         7XTFsv8zsHPdd10v6ZDwytHuc4SgJRG+jkTr1vLhHgbR1fQiU1iEPFcnhsNIfLQYBwgy
         PrAA==
X-Forwarded-Encrypted: i=1; AHgh+RpZLqgKNWFnFasFak3ASe14uqdScyM+w8ogLzb5uqm81VrwsPDe07eMnHi9liJFo/cb4rHPeCDMKINqwg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzusP3wPna8JXQmNr0Z1EZ+RQImEZnvnbQd+5aSBu+FvG6gmH4H
	Gqw4o7HGul0szAym+q+wvAHAwddDn5/0VGxkhpcgorHkd8wc5Lp6PzYIHYJDTyeHMyOkgoVwHyK
	oLiw=
X-Gm-Gg: AR+sD12kALWUrThPHDQ0Wa+G4UInqGCYdebogc0wxHMan38qJg29XY8mQ4uk/iULyr9
	ZlmKF1yATZW8B3qDUm/HLsVHe/y88FzdtZux3PTc+54hc4nUrWHpLc+1/H57oLgVTGLNNE/FHTa
	sJjweuIosy1clFOv9mzwX5ZFg+if2/LT3eVpU0thX+/iC+ISe3zybUidBFI8sz4efWaemCkcsqq
	qrd5BOii3s9htOTAuQirtG59wZRSX/4wXgxupFsgHrLrz2/Av9M0tfgb/IrtxW3tAlIeXiv1ja2
	APk9pt0jV+m+7lqmVC0S/SPlc3AKK06Qu7IgcNE5jdBVTCBOF5wZHPptwlXJi/PGRcxflhh94uA
	0+1JoP0HAWLRDnKKfHP7iIo4GCLFyKzKgRRUJrpuSOkZs+KCpAgwp4rM2Gl5YWAcCdjJv9gmziE
	M8Bypll2TFXn9xePD7i+cQiAOO6UQS5LysyHDL3ShVWio/y0z9PASH8EAeF30vChssrKRcZ0o+q
	NxPuSvo5SXrktjSOZzutcNrY2GzcQ==
X-Received: by 2002:a05:6a20:728c:b0:3bf:e2f1:1b08 with SMTP id adf61e73a8af0-3c91b3a9745mr899592637.40.1785483841867;
        Fri, 31 Jul 2026 00:44:01 -0700 (PDT)
Received: from localhost (79.162.199.104.bc.googleusercontent.com. [104.199.162.79])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-3153dd4e5c7sm3124503eec.5.2026.07.31.00.43.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 00:44:01 -0700 (PDT)
From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Yu-Hsuan Hsu <yuhsuan@chromium.org>,
	=?UTF-8?q?C=C3=A1ssio=20Gabriel?= <cassiogabrielcontato@gmail.com>,
	linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: aloop: Fix spinlock deadlock in loopback_hrtimer_stop()
Date: Fri, 31 Jul 2026 07:39:35 +0000
Message-ID: <20260731074255.1513402-1-yuhsuan@chromium.org>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In loopback_hrtimer_stop(), calling hrtimer_cancel() while holding
cable->lock triggers an AB-BA spinlock deadlock if the hrtimer softirq
is executing concurrently on another CPU:

1) CPU A runs loopback_trigger(STOP), acquires spin_lock(&cable->lock),
   and calls hrtimer_cancel(). Since hrtimer_cancel() is synchronous,
   it spins waiting for the executing callback to complete before
   returning.
2) CPU B executes loopback_hrtimer_function(), which immediately tries
   to acquire spin_lock(&cable->lock).

This mutual dependency leads to a CPU hard lockup and NMI watchdog
panic when multiple streams start and stop concurrently with small
period sizes.

Replace hrtimer_cancel() in loopback_hrtimer_stop() with the non-blocking
hrtimer_try_to_cancel(), matching the behavior of jiffies timers
(timer_delete vs timer_delete_sync). If try_to_cancel returns -1
because the handler is running, CPU A releases cable->lock cleanly.
When the running handler subsequently acquires cable->lock, it observes
that the stream is no longer in running state (cleared by trigger STOP)
and terminates without re-arming the timer. Synchronous hrtimer_cancel()
remains preserved in loopback_hrtimer_stop_sync() where cable->lock is
not held.

Fixes: bf08a5f698dc ("ALSA: aloop: Add 'hrtimer' option to timer_source")
Signed-off-by: Yu-Hsuan Hsu <yuhsuan@chromium.org>
---
 sound/drivers/aloop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/drivers/aloop.c b/sound/drivers/aloop.c
index 236f49a7fb8b..60f5bf1e48bb 100644
--- a/sound/drivers/aloop.c
+++ b/sound/drivers/aloop.c
@@ -303,7 +303,7 @@ static inline int loopback_jiffies_timer_stop(struct loopback_pcm *dpcm)
 /* call in cable->lock */
 static inline int loopback_hrtimer_stop(struct loopback_pcm *dpcm)
 {
-	hrtimer_cancel(&dpcm->hrtimer);
+	hrtimer_try_to_cancel(&dpcm->hrtimer);
 
 	return 0;
 }
-- 
2.55.0.508.g3f0d502094-goog

