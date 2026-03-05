Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3870429B79B
	for <linux-sound@vger.kernel.org>; Thu,  5 Mar 2026 19:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772739327; cv=none; b=GkmN2moGtO7j4+GvyOQN4tEBrqNhlhmZ1fyVxVU903YApymQyMtgNcQzPQ73pSIYviSwGRCh8y48GnYt3D0wj3OThEo1hfLnAevzSHfnUf3gzUiHJ2bAcm73OjUbA1Y5VA7ThCVGGpcfVJNqlbiq0GmlTirwNKUOW4UxsFjAD6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772739327; c=relaxed/simple;
	bh=PAvtlUAZJV23Ogtz1NgVoBzstnncqqGvH6vEP62bhE4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NLfsIBsplk5qpqHOmqMZKuwPz+6S4KLYFXVWIlV/nzAfNF90n9AX6DrMSdRg1nZNgihBraTHA5WC8sO9m9u83GBRELpe1gkmWLHEQ9oNZQ3vny/b2mkQAPn/+CoT0rD5n2kfMpecTbumIddVhwHi8kpzqpSSXgmz+VNBV+nSvdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UP/AhDOq; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UP/AhDOq"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-79628fb5c05so69951017b3.2
        for <linux-sound@vger.kernel.org>; Thu, 05 Mar 2026 11:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772739324; x=1773344124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JUsSuBpeeeWw+tAHopXopwOdrzE4R0Nfqxb1XRb2Jes=;
        b=UP/AhDOq7lRRIGG8N9dVPMz5ZmRxqOVJT+jDANcldTi3VO+InAk+eTfKb/IUVh/ITs
         /4SY7j1GK6sSf7A3Kp5IBW3mjsBM28cU2u705i7plaw9NS5MpLaaSeG7kytZGzBP6Xp8
         wu4vJjmNtBTjGzR9m4+ZqUQfWCcwLq9EXi3fb38n4YUuBR3mpxzKAleGtxpLMqMNTlDe
         tGMMayYgKshxO9THLz5hZf73qwin84q/CFY2use14L500S0r9Wwk7RJBDpPJktitby1m
         PUGkzP1C+TQ1L+rWyEp6uwrsinY/2+pCyDoa61qCJE45gJnNVQo0sSSHWgRo6GcFph1H
         v8xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772739324; x=1773344124;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JUsSuBpeeeWw+tAHopXopwOdrzE4R0Nfqxb1XRb2Jes=;
        b=lkTNkbM1vjQgKbXk6Vt49hkBVp5HbOtlGYTQnsEQUU1nPpt6c0VyKN/cAykaa5O1R7
         xzdywvuAnOQvcbYdLT7XHhL8Vz+Abxf2Rd9vx3/0U1xt4QNh9gFH0I5YW8mxlSZcmKK1
         5wRr0xgBkcKcOcOvSsioWBIOJzp685BVkaNyaa+RKbFP1TnEezgjSXDYh7ZT+rogcoHW
         PnpLCMCU34V89iXCkUtmsiQrftCnp/8FgciSNOBWzg6EFj0mUPmOTdRF+iMxFX9viSwN
         KmNaioikgLq2VpEA+tKYtZ14Ci9gim/Wkn+Fo++w4wLGoTSSuSkYZMsPTTVMQ8FEr9CM
         dZvw==
X-Gm-Message-State: AOJu0YyShAmTJvl9Ptya3UUGyUFh8REcHvIJgVzVF3/s0D+kiax9I4tY
	iAQJTHnnttJn10myENjUExcFPstSTKh3YJZxEKWWu7F0eRvXOkXWM+7eA5yzSsnvCBU=
X-Gm-Gg: ATEYQzyHiyR0MrVOwUrhyxwrmB0BE8pmedAFXd02UT9a3dv5xyh3N+zqSsB//rzyFlp
	6weTUD0qTY1VoLDtBKtwSzeJND3RdKaDq6Ph6CEVKpquPh385vfWzu/0PoqywJBD1nJApNtJ8Ej
	drNjZ8uOKW6AGN3t9Bfyg5VzyK6JfBIUFz9M0tGo8ZkQn2+fP9VC+76x57yW8LNI578iQRaXYyJ
	e0wOvurHzWkSuFSZyK9i4GQ9Umn7W8M+g/mxSh6gB3bC2SxWuGcCniyjFuwkeGTysFavu1K9fck
	9o4UbV+4xNfO1+hVW/SZJoH15aBWTy1/oXLaEu0XDCLc62qiPvwmytdqbxPRu6gviy7uJ7Vc7TC
	UEKBAJ0NAkpsI4m+Ke5o/+1xGyiIHs7OeoYky3y4psEQFPnIelLX2M9MxvWgmd/rtdxPhuP1EHI
	jKn8lS6TKY7EV63ktAy73s3k9jLb5s5qsjDQFKrZJjptbLe2dEMCxpRG1z
X-Received: by 2002:a05:690c:4d09:b0:798:5660:9314 with SMTP id 00721157ae682-798c6d23fd6mr52715547b3.64.1772739324161;
        Thu, 05 Mar 2026 11:35:24 -0800 (PST)
Received: from desktop-linux.python-stargazer.ts.net ([50.168.180.218])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79876a9004dsm92396307b3.6.2026.03.05.11.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 11:35:23 -0800 (PST)
From: Mehul Rao <mehulrao@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Mehul Rao <mehulrao@gmail.com>
Subject: [PATCH] ALSA: pcm: fix use-after-free on linked stream runtime in snd_pcm_drain()
Date: Thu,  5 Mar 2026 14:35:07 -0500
Message-ID: <20260305193508.311096-1-mehulrao@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In the drain loop, the local variable 'runtime' is reassigned to a
linked stream's runtime (runtime = s->runtime at line 2157).  After
releasing the stream lock at line 2169, the code accesses
runtime->no_period_wakeup, runtime->rate, and runtime->buffer_size
(lines 2170-2178) — all referencing the linked stream's runtime without
any lock or refcount protecting its lifetime.

A concurrent close() on the linked stream's fd triggers
snd_pcm_release_substream() → snd_pcm_drop() → pcm_release_private()
→ snd_pcm_unlink() → snd_pcm_detach_substream() → kfree(runtime).
No synchronization prevents kfree(runtime) from completing while the
drain path dereferences the stale pointer.

Fix by caching the needed runtime fields (no_period_wakeup, rate,
buffer_size) into local variables while still holding the stream lock,
and using the cached values after the lock is released.

Fixes: f2b3614cefb6 ("ALSA: PCM - Don't check DMA time-out too shortly")
Cc: stable@vger.kernel.org
Signed-off-by: Mehul Rao <mehulrao@gmail.com>
---
 sound/core/pcm_native.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 67cf6a0e1..5a64453da 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -2144,6 +2144,10 @@ static int snd_pcm_drain(struct snd_pcm_substream *substream,
 	for (;;) {
 		long tout;
 		struct snd_pcm_runtime *to_check;
+		unsigned int drain_rate;
+		snd_pcm_uframes_t drain_bufsz;
+		bool drain_no_period_wakeup;
+
 		if (signal_pending(current)) {
 			result = -ERESTARTSYS;
 			break;
@@ -2163,16 +2167,25 @@ static int snd_pcm_drain(struct snd_pcm_substream *substream,
 		snd_pcm_group_unref(group, substream);
 		if (!to_check)
 			break; /* all drained */
+		/*
+		 * Cache the runtime fields needed after unlock.
+		 * A concurrent close() on the linked stream may free
+		 * its runtime via snd_pcm_detach_substream() once we
+		 * release the stream lock below.
+		 */
+		drain_no_period_wakeup = to_check->no_period_wakeup;
+		drain_rate = to_check->rate;
+		drain_bufsz = to_check->buffer_size;
 		init_waitqueue_entry(&wait, current);
 		set_current_state(TASK_INTERRUPTIBLE);
 		add_wait_queue(&to_check->sleep, &wait);
 		snd_pcm_stream_unlock_irq(substream);
-		if (runtime->no_period_wakeup)
+		if (drain_no_period_wakeup)
 			tout = MAX_SCHEDULE_TIMEOUT;
 		else {
 			tout = 100;
-			if (runtime->rate) {
-				long t = runtime->buffer_size * 1100 / runtime->rate;
+			if (drain_rate) {
+				long t = drain_bufsz * 1100 / drain_rate;
 				tout = max(t, tout);
 			}
 			tout = msecs_to_jiffies(tout);
--
2.48.1
