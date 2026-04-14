Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEDF3EC2E7
	for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 16:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776185287; cv=none; b=s3MY3XaxDOyN9J1zlUwZzbmJkHsAEDQ2LGEioOwtAh5vWgH/rgbeeZOFyySfRhJbj6chB5DlzcPabfrg0mnBbCCsykA9h9tGMR9IeHzZ8WI0afKY8F/tG1uESPFHG7MPvlaid9+XijTySONSPCw8XzEU2Z/sVptfsbIQDgnVXkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776185287; c=relaxed/simple;
	bh=uCY/nj9CD/1M1siCKk8xhE+z0p9kwT0Bf4ZGHP2fews=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D4FwwYs3Hd35MWSdCJB/9tPNQDOwZ5bJHqbhSkyQ51c0HsAGkrrsiq8wfuYM6zHXE875JkI0KjfkUF1MHFedMa4Aoo6LhW8JjvS5pXPla9AuCq3ffmxIdFxnymu4fzO8GurudedVABlWWEoyXxJ4PRkfRg94eloFd0kJ1mvpuXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gDQyPTFj; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gDQyPTFj"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2ba9c484e5eso5974250eec.1
        for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 09:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776185285; x=1776790085; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5QqwWZmoSxDFlOxH8SMWYFfGSd27ukOlZrAEvYnzROs=;
        b=gDQyPTFjYy3SPm8V+9EzNfnJy1i8NxwSWEAEjrvc0YluA5SOA3BWZx6Caaw/R+UvCK
         Qn+o+KKo7/sENpc/hu3ZIXNcZQ6ExFoRSBNz00lau2Hy3aQGr0ewCsYja3lYJCvnTYvJ
         9HANFdkBMcFvGhf9ywArriwb+NyMY9jNy+P1SKOU5kc19cOqRozDeB2c1FTnfs9bTBXU
         JlaZs32ZmDMxhdcsJu233iKMKuw/1NUCtFOcHZkfVxps1FDWlg70BbL0z8StT4v0d7PN
         gv1kPvZsxyiIvBef+vjZMFhNuQ59Zec9uonxrDWhjmmXUeQGninNs1pDJ3CLVsyNkKgN
         kfoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776185285; x=1776790085;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5QqwWZmoSxDFlOxH8SMWYFfGSd27ukOlZrAEvYnzROs=;
        b=jxAykJwX5Z9e6QqBn+6mBfXJxh2eSI6WHQIUu3Tf483wvqYWaT8sqwEBmvO/RA7DHt
         G3DCxSqsY8oXRw53RUVO7rOB9KL7jRIJapWCGLYnwiwf5imiHLuZENXu+x8jzwh86k3i
         t6zaHD0SPP7qRxZjFCvSpuxp/7kqC9yE1KQIzyi6kVNtstCZkReN38lbKlBN/qYZFKah
         FCrqD9TXIKHrsqTv9O/8UrQ2IfsLderxCpRSkQPBT2ocs0iqIWSE3iMNO2EjIBXCKGWK
         p8yTGL1ldzgbeRJteTsVFkBfQx19u2/34Rj7utFGDN6sDaSxJmxtDE87RAIwjePZQIPj
         0teQ==
X-Gm-Message-State: AOJu0YzO8z2/ypLaT9b8/saXjQsdpF3qKVFm+0YIJ7a8kVPkSEei+43l
	vaDR65nEtdaJ1aqrr+g5eI9R7f0ER4lkQKNGl+YnvTrYcnufgvFIPCzgz0zHDN3emxQ=
X-Gm-Gg: AeBDieuXK7ZbMsWBvCFjQ9pM34mJNCuBYeXRx4w6lGGEMc+qs63llB6znBGxb3S7Ypf
	mrZfITZAWJATIwd1uHkXOHvHHnZmKvdjhghCjb1a+82wfBn88XbZPhCNOXN+Yy09fa/r5pi9H4I
	eUse9xgfBFGRCkrzvVEP0bUD3M4AkvwU5hB/qpodQvQrENCgRds8J5nBicFkjH8pteJ8W9in6/3
	aOu7pA2MmCWYeR9kXLyEGnuoZpuwq6W7THC5GTcX/dphubv/SXVI6PEKIs8kvh5F7P2a4nPCpEm
	1vs41Z9/25KUO8y8UcjE9hHhwF/Y+ux2RMbsA7vdeYwqp5NXGYxZJmsP5XpgZPXkP+6F2SZDRyV
	mJB9dYEC/xTZZ6B98wElyhDP1bX1B4jiepgKp4oGUSEohnsHfWJQn4VL/3MDeANuGxxuDiC8xPF
	/XIEyeqDnVM2SBDDhH+W5ZRpM1VHjQO8+Ns0WvfjFc+e6UnMCFOh3RV/MziH6WvJ2Mdzj6tY9O4
	LiP
X-Received: by 2002:a05:7300:80c2:b0:2c0:d46d:cfc2 with SMTP id 5a478bee46e88-2d5887a2fe5mr10237011eec.23.1776185284959;
        Tue, 14 Apr 2026 09:48:04 -0700 (PDT)
Received: from [192.168.1.18] (177-4-160-195.user3p.v-tal.net.br. [177.4.160.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de130e056dsm558584eec.30.2026.04.14.09.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 09:48:04 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Tue, 14 Apr 2026 13:47:54 -0300
Subject: [PATCH 2/2] ALSA: compress: Propagate real pointer errors in avail
 paths
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260414-alsa-compress-pointer-avail-errors-v1-2-f5a1a8b1dfba@gmail.com>
References: <20260414-alsa-compress-pointer-avail-errors-v1-0-f5a1a8b1dfba@gmail.com>
In-Reply-To: <20260414-alsa-compress-pointer-avail-errors-v1-0-f5a1a8b1dfba@gmail.com>
To: Takashi Iwai <tiwai@suse.com>, Vinod Koul <vkoul@kernel.org>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5707;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=uCY/nj9CD/1M1siCKk8xhE+z0p9kwT0Bf4ZGHP2fews=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJn38vcw7bwn8bLE0uJTsvAS9cf7f14zT3A5WhAWL9rbF
 T1nS2dvRykLgxgXg6yYIsvqpEWWe7oeXK2PW+EBM4eVCWQIAxenAExE2puR4XeF3aF9P/b+628v
 PPr65+vJjJ686SYMfCz73rGWLwnt3crwh+dKc2Su4eOve/4qXtyof5Zvq050xeXL/1MmSUxmvBg
 cyQ0A
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

Commit 61327f3d817c ("ALSA: compress: Pay attention if drivers
error out retrieving pointers") made snd_compr_update_tstamp()
return driver pointer() failures, but snd_compr_calc_avail()
still ignores that status and continues with stale runtime
counters.

The fallback for an unsupported pointer callback remains
intentional, so keep ignoring -EOPNOTSUPP there. Propagate
real pointer-refresh failures instead.

This makes SNDRV_COMPRESS_AVAIL, read() and write() fail
immediately on real pointer errors, and makes poll() report
EPOLLERR instead of continuing with stale availability data.
snd_compr_tstamp() already propagates the same errors, so
this also restores consistency between the timestamp and
avail paths.

Fixes: 61327f3d817c ("ALSA: compress: Pay attention if drivers error out retrieving pointers")
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/core/compress_offload.c | 53 ++++++++++++++++++++++++++++++-------------
 1 file changed, 37 insertions(+), 16 deletions(-)

diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index e3239c739d34..5a125329d5b7 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -207,18 +207,23 @@ static int snd_compr_update_tstamp(struct snd_compr_stream *stream,
 	return 0;
 }
 
-static size_t snd_compr_calc_avail(struct snd_compr_stream *stream,
-				   struct snd_compr_avail64 *avail)
+static int snd_compr_calc_avail(struct snd_compr_stream *stream,
+				struct snd_compr_avail64 *avail)
 {
+	int ret;
+
 	memset(avail, 0, sizeof(*avail));
-	snd_compr_update_tstamp(stream, &avail->tstamp);
-	/* Still need to return avail even if tstamp can't be filled in */
+	ret = snd_compr_update_tstamp(stream, &avail->tstamp);
+	if (ret < 0 && ret != -EOPNOTSUPP)
+		return ret;
+	/* Still need to return avail when no timestamp is available */
 
 	if (stream->runtime->total_bytes_available == 0 &&
 			stream->runtime->state == SNDRV_PCM_STATE_SETUP &&
 			stream->direction == SND_COMPRESS_PLAYBACK) {
 		pr_debug("detected init and someone forgot to do a write\n");
-		return stream->runtime->buffer_size;
+		avail->avail = stream->runtime->buffer_size;
+		return 0;
 	}
 	pr_debug("app wrote %llu, DSP consumed %llu\n",
 		 stream->runtime->total_bytes_available,
@@ -227,11 +232,12 @@ static size_t snd_compr_calc_avail(struct snd_compr_stream *stream,
 				stream->runtime->total_bytes_transferred) {
 		if (stream->direction == SND_COMPRESS_PLAYBACK) {
 			pr_debug("both pointers are same, returning full avail\n");
-			return stream->runtime->buffer_size;
+			avail->avail = stream->runtime->buffer_size;
 		} else {
 			pr_debug("both pointers are same, returning no avail\n");
-			return 0;
+			avail->avail = 0;
 		}
+		return 0;
 	}
 
 	avail->avail = stream->runtime->total_bytes_available -
@@ -240,14 +246,21 @@ static size_t snd_compr_calc_avail(struct snd_compr_stream *stream,
 		avail->avail = stream->runtime->buffer_size - avail->avail;
 
 	pr_debug("ret avail as %zu\n", (size_t)avail->avail);
-	return avail->avail;
+	return 0;
 }
 
-static inline size_t snd_compr_get_avail(struct snd_compr_stream *stream)
+static inline int snd_compr_get_avail(struct snd_compr_stream *stream,
+				      size_t *avail_ret)
 {
 	struct snd_compr_avail64 avail;
+	int ret;
 
-	return snd_compr_calc_avail(stream, &avail);
+	ret = snd_compr_calc_avail(stream, &avail);
+	if (ret < 0)
+		return ret;
+
+	*avail_ret = avail.avail;
+	return 0;
 }
 
 static void snd_compr_avail32_from_64(struct snd_compr_avail *avail32,
@@ -262,15 +275,16 @@ static int snd_compr_ioctl_avail(struct snd_compr_stream *stream,
 {
 	struct snd_compr_avail64 ioctl_avail64;
 	struct snd_compr_avail ioctl_avail32;
-	size_t avail;
 	const void *copy_from = &ioctl_avail64;
 	size_t copy_size = sizeof(ioctl_avail64);
+	int ret;
 
 	if (stream->direction == SND_COMPRESS_ACCEL)
 		return -EBADFD;
 
-	avail = snd_compr_calc_avail(stream, &ioctl_avail64);
-	ioctl_avail64.avail = avail;
+	ret = snd_compr_calc_avail(stream, &ioctl_avail64);
+	if (ret < 0)
+		return ret;
 	if (is_32bit) {
 		snd_compr_avail32_from_64(&ioctl_avail32, &ioctl_avail64);
 		copy_from = &ioctl_avail32;
@@ -346,7 +360,9 @@ static ssize_t snd_compr_write(struct file *f, const char __user *buf,
 		return -EBADFD;
 	}
 
-	avail = snd_compr_get_avail(stream);
+	retval = snd_compr_get_avail(stream, &avail);
+	if (retval < 0)
+		return retval;
 	pr_debug("avail returned %lu\n", (unsigned long)avail);
 	/* calculate how much we can write to buffer */
 	if (avail > count)
@@ -402,7 +418,9 @@ static ssize_t snd_compr_read(struct file *f, char __user *buf,
 		return -EPIPE;
 	}
 
-	avail = snd_compr_get_avail(stream);
+	retval = snd_compr_get_avail(stream, &avail);
+	if (retval < 0)
+		return retval;
 	pr_debug("avail returned %lu\n", (unsigned long)avail);
 	/* calculate how much we can read from buffer */
 	if (avail > count)
@@ -437,6 +455,7 @@ static __poll_t snd_compr_poll(struct file *f, poll_table *wait)
 	struct snd_compr_stream *stream;
 	struct snd_compr_runtime *runtime;
 	size_t avail;
+	int ret;
 	__poll_t retval = 0;
 
 	if (snd_BUG_ON(!data))
@@ -471,7 +490,9 @@ static __poll_t snd_compr_poll(struct file *f, poll_table *wait)
 	}
 #endif
 
-	avail = snd_compr_get_avail(stream);
+	ret = snd_compr_get_avail(stream, &avail);
+	if (ret < 0)
+		return snd_compr_get_poll(stream) | EPOLLERR;
 	pr_debug("avail is %lu\n", (unsigned long)avail);
 	/* check if we have at least one fragment to fill */
 	switch (runtime->state) {

-- 
2.53.0

