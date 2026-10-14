Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3694E8DE6
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 15:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791991480; cv=none; b=OLQeqcKS3nPjytnyjPeashlfuX0+cfrZotNUXtIWmLh+OXDuY0MCKI3YYF0PREoewsOlJZt0KbYQAP4NGJcnxSMmIZy2PQpVqjvi92l1r1ldtxVcRR09J4dgJpD5lFpDGRqAa5YR20bTUL8T0KwxMYq0rEfUbcc6BdErXFnvbSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791991480; c=relaxed/simple;
	bh=wSZ3zwnVBwhfAGt5ifjj+oFVu2p72JS9QMJwu71vpk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qCJsXSVp9+xnMLVfat+/f1dSshu4Hk/gIe3V+zVb9VJLHWUG88n/UGffTj0eUb9e4rcSIfQawWDEldHAnon/mKWrI9D+3hvTIMo0CHNM8/4dXIeAX/yC7XFDD0/6YGVuhS/Or+fZBKFDL7Vwz3Do52EkeAZGCqExWd/OwtrsONM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QfBE8ICn; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QfBE8ICn"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cd61a2dfd7aso380180a12.1
        for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 08:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791991479; x=1792596279; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t7IRL6SEiSa3rzeqlbvDCyLB5N7LUmPGMrQiBUcualE=;
        b=QfBE8ICnBaTlQIr0Ew8EulgJJxMWQQT9rxQSB5J859fwuJcD/OCaK62L9R4xp/udf5
         yNLrfnHILV6s+dZskFPnkl4JALRizQYL+ubN/tJlcCm2oH0L6q4P5gBNDe4v896lsjZA
         5RSPqiuplVAaxH7EqehwTjdsQYlfED3WDSEOYAjpqI5fwLUYkIgvs3KpYiaotthaWbDC
         eW1WuOE15ISxXG73RbwahGFKPtJ9lpSkOrS/XcCW47id0Vn281+iYgaAsJFZslBJvFSN
         DB/oA3sd1ZCStE5zhEnILwpLHJUQZUFsgH4KRHZJpl3/pdRUbmNUkBjFYWum+POckq6w
         rcbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791991479; x=1792596279;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t7IRL6SEiSa3rzeqlbvDCyLB5N7LUmPGMrQiBUcualE=;
        b=eU9PcbJDM87gpsdzWce+SXYwm0UdMJw0Ff5TRhZFQtu0jt2O1YBg5k91QMi0MLexfn
         xP5Wqpne58c9iBzxbUHrO673+stEy8y3wvenPXwvciKz0vP0GN4GcuITygytVuREN6IF
         eaoL5Uw21XKFh9WlAET8YVabXeP1lQu+U0CKCuW2FDl08XJuqd6gaL7mtB62gUcC2e8C
         OxPurv5HiQq/yTwkhIFBVnYr+RxYwXsfcFC9p5F4B5A4QNXOrGMHxoED3QQg+Omv8t22
         zILDMXyv02QrBq4jyCp8+i+nDagSdoMy9DenLjwpUd5d5eJPlxBbYp1/6W74Gm8FWx3u
         UmEg==
X-Forwarded-Encrypted: i=1; AKwUvBwJ2yYKnZSUYYOyvOHrAOy6/2JXNygYaxun1jCBhu++9WJIKKvao9w9j6X3kLVQEhqg+W0V7Kvw9F2pBg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIHWE1QWzVMiqpzzwgb/b+gRzH4hnOByNt2BU6YXi/IdcTBL+yY
	ngvg7CUFced9TXIprdHL7FbITrmpKgc16T7bqvkkoGCPR5FGjJ+25KK9
X-Gm-Gg: AYBFou1vTRNFmcYBItZmJWVXXE+t1P2oOZamnmLZO4BDE1bAsq7rHL1ssEgFGnhWYWC
	vUSbmMJyXp57CRb5yJpLsWjYSndu/r2+as7tqaFFjlSWUrpdY7ZtPM7qG3Zl0xqV5/EsGnARaQf
	MB39HfGxlXkukRf60zynVorv195WX4h1zICf3n3VKcFDQXIlkxH7rXe1g3bkDYE9j9SIMkI9PvL
	HeYrBbyI15gOdN33FVjEf41VksQ7ZNZHzqKzW6wSsK1KbL/s1lBBcMkLqVKurSTeLQB4A5xcGtG
	se0wqPwk0ZMqLrBa3lYBPuviAR5T8KS7KucCw35GVu2uOWcULNthGhe2VwAL4FI/HmMiEYUfohO
	Tc5Ztxnry905VAI6m2GQeyZWcimdzlm8BBgZwKSbFe67okOo8ndfKw8HFkh2nMRNhDp9/2m5lSM
	VE/1jCQL/gXvxksiKlfLK8b8hZ8drQKvFPQC23PrsLJUdXEqYEkIfYDG5KiB00Va+HhsRBh3EVr
	qpm4oJpmVYd9XRO7UXmNKHvify2fr3Z9ALbtllRFf8ecobKM+3Dl3YSEiCN4TZAupGvuD9uOeMS
	SuYKuwxJEs1Q7Es=
X-Received: by 2002:a17:90b:4c04:b0:3ac:80dc:f40a with SMTP id 98e67ed59e1d1-3ac80dd0188mr1244754a91.16.1791991478624;
        Wed, 14 Oct 2026 08:24:38 -0700 (PDT)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e08905sm7169469a12.9.2026.10.14.08.24.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 Oct 2026 08:24:37 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org
Subject: [RFC PATCH v3 1/2] ALSA: pcm: allow capture reads while draining
Date: Thu, 15 Oct 2026 00:24:22 +0900
Message-ID: <rfc-v3-core-capture-drain-1.cf2e307fcac34b6a@gmail.com>
In-Reply-To: <rfc-v3-core-capture-drain-0.cf2e307fcac34b6a@gmail.com>
References: <rfc-core-capture-drain-0.112c40f0e9284eaa@gmail.com> <rfc-core-capture-drain-2.112c40f0e9284eaa@gmail.com> <8733u8g0kh.wl-tiwai@suse.de> <87y0c0el29.wl-tiwai@suse.de> <core-drain-linked-lock-reply.cf2e307fcac34b6a@gmail.com> <rfc-v3-core-capture-drain-0.cf2e307fcac34b6a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Allow capture transfer calls in DRAINING so already captured tail frames
remain readable until drain completes.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>
---
 sound/core/pcm_lib.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index 4d665b4148d7..de952f639d3b 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -2208,13 +2208,17 @@ static int pcm_sanity_check(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int pcm_accessible_state(struct snd_pcm_runtime *runtime)
+static int pcm_accessible_state(struct snd_pcm_substream *substream)
 {
+	struct snd_pcm_runtime *runtime = substream->runtime;
+
 	switch (runtime->state) {
 	case SNDRV_PCM_STATE_PREPARED:
 	case SNDRV_PCM_STATE_RUNNING:
 	case SNDRV_PCM_STATE_PAUSED:
 		return 0;
+	case SNDRV_PCM_STATE_DRAINING:
+		return substream->stream == SNDRV_PCM_STREAM_CAPTURE ? 0 : -EBADFD;
 	case SNDRV_PCM_STATE_XRUN:
 		return -EPIPE;
 	case SNDRV_PCM_STATE_SUSPENDED:
@@ -2320,7 +2324,7 @@ snd_pcm_sframes_t __snd_pcm_lib_xfer(struct snd_pcm_substream *substream,
 	nonblock = !!(substream->f_flags & O_NONBLOCK);
 
 	snd_pcm_stream_lock_irq(substream);
-	err = pcm_accessible_state(runtime);
+	err = pcm_accessible_state(substream);
 	if (err < 0)
 		goto _end_unlock;
 
@@ -2388,7 +2392,7 @@ snd_pcm_sframes_t __snd_pcm_lib_xfer(struct snd_pcm_substream *substream,
 		atomic_dec(&runtime->buffer_accessing);
 		if (err < 0)
 			goto _end_unlock;
-		err = pcm_accessible_state(runtime);
+		err = pcm_accessible_state(substream);
 		if (err < 0)
 			goto _end_unlock;
 		appl_ptr += frames;
