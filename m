Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF4C19ADA4
	for <linux-sound@vger.kernel.org>; Thu,  7 May 2026 01:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778116803; cv=none; b=qLyoFQD+20866YzZVFIJbKjL0JsMeXPjdwL9wlVA3KhEYIM8qe7HSrct/XP8OBPI8V/Iry2GU3BSIK5MAxBNWmGhSXA3gRouHsNhu3NDxK1HAzPxxyFaHeWUvDcbUJG8ImFtPmW58Dwu1SmzuQXO03KHcTa/Cytq9yOhkO/cEe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778116803; c=relaxed/simple;
	bh=Z9kl4I2mfB/w+jPxVnqdY3FShwBp79BxtLp7QNIriks=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=vDpO+Eub01oFnLAAhXVyG5NL9OsHxmQ6WMWrIPMh9viNnAKdT2b85kLv+CRfQdC3pw4tVHLVDrPViqkKH0nnr/Gmwlhui/9R3wxM2QlkcqCAfQqYbgFUnNbfgjwcN1LZXd2te0CjepXVVPP7/F8s/46HnA48Gfrfiqwnazw+rUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XPMFNBg3; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XPMFNBg3"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ba3e3c4f87so2573695ad.3
        for <linux-sound@vger.kernel.org>; Wed, 06 May 2026 18:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778116801; x=1778721601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jUGQTAHwt1uQui9BCrjh8OlUKlhXS2NSOCMtKyNZUew=;
        b=XPMFNBg33o2GBseD7gPQtmVRLYjUd+xg7QmhYkDCdh3bc4ZOdkCpfQenZeiKCM4lhs
         YGlgOAbvp52aHBW9Ytny3kvRr0qFPKexs1kcefLh0wb7Y2O6jJzAKfnlYDtcDsOS2Rjf
         hy7mAAX1mVdMMyiPBD8KxXpI+dncT1RxLf87zk8ju+cSWxqB/FuBtdONo+v2eHprQkOj
         Pdr4dvM3/RRP3LfUIYLZDwIh4NJ5WqBF2vLnH2lOpDzR1YCmx2zemAL68akzTZAhFUUB
         tpl9/Zcv8DMdQcJBEWSfUhUxhZYD/6LFvFlAYG+CpGWBwS5WCHhTAZenNp4AUi1Wd9Ut
         EVXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778116801; x=1778721601;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jUGQTAHwt1uQui9BCrjh8OlUKlhXS2NSOCMtKyNZUew=;
        b=WZUcJ9zdZzfrXBTdcr8ik/qfkWDwqHiqHSYxGX1dcnYw+JoOswCl6nIoFZZ8GC/vr1
         Gpscmtdet4ZozzhzR+xglOmZmy9EG5xdzRkPa/aYj9dL0AJT4Aw2k56ejBelNvcc9ytO
         3lV6I+8K68CPZaO1Jd2iP6CD6TIE9qsGQQVofWr4lS2yUngli03Og2r/QM5I6TwMi1Tf
         PZ252faz+j17qR5PCTmdQd3x7UQkSwSgIBjCta2nlN9Yu8lSAp90o1xAGO7R68cLEkVA
         ssCfv0IVAmBMA3a78bYZtoz5jpHcjQxeQ+BM5NfboUUBjYC2EUIDyYNSNiiE9+8NVzb+
         MrHw==
X-Forwarded-Encrypted: i=1; AFNElJ9SPvpkIV1qzMIU49sGwj4sMeP+i/sqK4HB9hysPi4TWMmUCpvYkTTRaooM1MJ1NukYbl9ZioaSiRvZQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNVa+hChd0/17gKAr09pzQY4UDAfeCHw/WZjpektLvpJruYuF/
	HTB1rqP/yKz4+Gz/shjXyrLgaBhquMQoHE337xfm4uC2U8Qdj7MQlZTC
X-Gm-Gg: AeBDieuJ2eilg/gL7cL7vfgnOT5HOlqHTz0IIg+3EClBTdTOKaD+Nypk9LDA6EsgsBn
	MTTN0ORr+dXPNZUPKgeZj8E6m3ldZhw/r+0jv9105PXwbfFfcytFmjf0jipDoyMBcl4U/HedN5b
	jg803WwyBU/IWNicKBfYoiEG0YR8zuK6vf7iAZ1HsAJe33rKhXM4Uhd33tjuTATVDOqzMyG/2Np
	E4WP9EsfZWUzlmYd7UMnSa1rxLxVRCMkunqkOnfaYD25LJNIRJzxVJ5nYnsDGUzmzw5K0rOvKck
	cgJg83ntERpwJIHGM6NvI5UQenr+PH7KZDBNYN4n4HLz16YF8ehrjbLiBZEz3Md0KUA8SORosB6
	2QmAkqsHUuVeVbAJ8AlBYKPiciI64l+9KxkoMp3mC1dD+17AzN5RiWdzEhoUIlskdLbhNKedWKy
	4giK0n/pc1gcynm6j6n/E3Y1wX/1W1SzbUIPLTLx8=
X-Received: by 2002:a17:903:280e:b0:2b2:50e1:f104 with SMTP id d9443c01a7336-2ba78f63defmr42518355ad.3.1778116800937;
        Wed, 06 May 2026 18:20:00 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2babadef85esm4761775ad.62.2026.05.06.18.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 18:20:00 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: gregkh@linuxfoundation.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	Cen Zhang <zzzccc427@gmail.com>
Subject: [PATCH] ALSA: pcm: use snd_pcm_get_state() in remaining ioctl checks
Date: Thu,  7 May 2026 09:19:44 +0800
Message-Id: <20260507011944.2897240-1-zzzccc427@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The recent OSS runtime->state locking cleanup converted the OSS I/O
paths to use snd_pcm_get_state(), but a few ioctl-side checks in
pcm_native.c still sample runtime->state directly: the prepare
pre-checks, the early drain open-state check, and the common
snd_pcm_kernel_ioctl() disconnected check.

Use snd_pcm_get_state() for those remaining samples. In
snd_pcm_pre_prepare(), keep a single state snapshot and reuse it for
both the OPEN/DISCONNECTED check and the running-state test.

Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 sound/core/pcm_native.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index a541bb2..50da38b 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -1973,13 +1973,15 @@ static int snd_pcm_reset(struct snd_pcm_substream *substream)
 static int snd_pcm_pre_prepare(struct snd_pcm_substream *substream,
 			       snd_pcm_state_t state)
 {
-	struct snd_pcm_runtime *runtime = substream->runtime;
+	snd_pcm_state_t cur_state = snd_pcm_get_state(substream);
 	int f_flags = (__force int)state;
 
-	if (runtime->state == SNDRV_PCM_STATE_OPEN ||
-	    runtime->state == SNDRV_PCM_STATE_DISCONNECTED)
+	if (cur_state == SNDRV_PCM_STATE_OPEN ||
+	    cur_state == SNDRV_PCM_STATE_DISCONNECTED)
 		return -EBADFD;
-	if (snd_pcm_running(substream))
+	if (cur_state == SNDRV_PCM_STATE_RUNNING ||
+	    (cur_state == SNDRV_PCM_STATE_DRAINING &&
+	     substream->stream == SNDRV_PCM_STREAM_PLAYBACK))
 		return -EBUSY;
 	substream->f_flags = f_flags;
 	return 0;
@@ -2139,7 +2141,7 @@ static int snd_pcm_drain(struct snd_pcm_substream *substream,
 	card = substream->pcm->card;
 	runtime = substream->runtime;
 
-	if (runtime->state == SNDRV_PCM_STATE_OPEN)
+	if (snd_pcm_get_state(substream) == SNDRV_PCM_STATE_OPEN)
 		return -EBADFD;
 
 	if (file) {
@@ -3524,7 +3526,7 @@ int snd_pcm_kernel_ioctl(struct snd_pcm_substream *substream,
 	snd_pcm_uframes_t *frames = arg;
 	snd_pcm_sframes_t result;
 	
-	if (substream->runtime->state == SNDRV_PCM_STATE_DISCONNECTED)
+	if (snd_pcm_get_state(substream) == SNDRV_PCM_STATE_DISCONNECTED)
 		return -EBADFD;
 
 	switch (cmd) {
-- 
2.43.0

