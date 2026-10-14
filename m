Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38954A9D58
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 08:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791965751; cv=none; b=LuwlQB5TFYWMbmKFJUXAAT37h2+gA50euYucXViulc4jD9iWQAGYFzv39lHDzXdNsq4fBqInn1zuf4N14rGMiIULCvJx2usYRxCaPkyP6tTSbtUFSsNpA5lAhWQvKaaBU7SOjgOvC4E0fp/2EOHf8gi6PQGtO7tPH0qx7xg5XIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791965751; c=relaxed/simple;
	bh=wSZ3zwnVBwhfAGt5ifjj+oFVu2p72JS9QMJwu71vpk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KyT4s6n7UKdRaPHwF0Ypj4g1gAi1eo2eK5JqB4rEHDtRTfbR4Wj+brsgm/XgUlZKSQW4GNKI7n4xhiEbmkqBSQ6yeP2JH5rqL3BVapVQ8PX2iPwyimCenN1jzDG9ndJvrbP1lWmE9+HcZCjiui5YKn0UDRZcXsAxNo6OlVZmDZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DhOGTsII; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DhOGTsII"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ab9268d90eso1916545a91.3
        for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 01:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791965748; x=1792570548; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t7IRL6SEiSa3rzeqlbvDCyLB5N7LUmPGMrQiBUcualE=;
        b=DhOGTsIIoYoFoB3HtfXJWqtn7l1e+BYak3aD2IASvJXXb0az5D4s31qAwUTcZTI6xH
         STxLs0yiX2k9EqUmxhJhc+TBis73InrMRrjzjA5anO4QivtSWElt8BoXSUrRooMclyhL
         yW8Nrkp7Fv/86wRPB28BTLAJS7oVOaHmW5I/bttvUUAT0Akq+NbHIa1mqy7F8fH+E1qG
         zXDtMChb6ojZ6Qu8gTRLos3gWfMqHYji6g+uqLXbPtUtou33y3ioHUDrr04lU17oDm1l
         a/6koldbij1XRjW1kbpTl1MqWdJuN9S0d3SWuZeT/GbYLJzFyrcmnrJGrIWE1evdhEhb
         XzjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791965748; x=1792570548;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t7IRL6SEiSa3rzeqlbvDCyLB5N7LUmPGMrQiBUcualE=;
        b=aZr6x+xQahxcBdubHDi1MpPgFYQjZUrGJe9YrQlyNyvN6o5XhA3ioYHvp6EixigC3/
         GSfgYi4WVziJUJrkpRe3nTLg19t7YI7o5wPggEYKl58HwOxZKHfOniu9qNaoxlV1azhW
         WuHS1f9XGxmR51CfgqRG2v02QvYZ52fTomoEufEXa1wfadfmz7p1XtEdXYIjtgVAVH2/
         umZkBi18mLY9VWI43E7BzkmgVePDf7DdiSUdOuJxLUsP7Od8F9DDwwqQ1wjZG7CdBY6q
         J5UKPsgRlrxANYlMV8CiTiHDCLWhGHO36R8s06HIgP96duZ8VifVFYr9LsBAsxxaP1AU
         ZJ3w==
X-Gm-Message-State: AFq9FYLH1kRtn8VwOqxZk7CBSZRYYFY9X9fTOkXTPlC3Tmr+P/9YyYao
	rV4h4ZdHhfegbY14niWiDnWQghzgtUtUKhlkrdcVw6dOeXGOBo8DbUiBhH7/kA==
X-Gm-Gg: AYBFou3nJ9ZFPlyKWYzRAkjeVdxoDAoiOGp74kpg7tag8O795ezX4TMhriY7LkPsem/
	3tc4maX4uoTkway7W63EpfINYbPwno0w81O0QSN+My0xrZg33VCVZvkQ2qc1rHyR/dT5LG+cMJC
	BdzwyKWgAP92EKb7iwjx+sYa6Ez0fm27p/c3bUhrP+268g0Oc9+HkIYqGjIMLOGfs9uhdKUtZgd
	Mxzv0yaf8W2iSHgmX8oXAo8dkGBay9wa7ZTK0o2W03PReqasXg5LrPCDArFryhp2H1ben4Earms
	DsdHLhIIg0a63hI5EKYUhtvdaGR/faW28+dSFsWV2KXRg36X7w7/khYyDzj8eawTJUJgDaZlrJL
	SCm341dTxfuqYFD1uVdv1LVyavbdgHc0QE+xZHxbLp5N4vcLB6PqYn3QTo07C8tLrXxNgF988/h
	fOHx4jOL7ahB6Qy0+hRYw2LT13zt9253k23e82qY1ylqwftz/X2ksA/LiqpG6iEuVR+AGMxsxpL
	kO4shz6rltxz6XCC+orGDRFMw4TStxECmF525l/YLCmxFUkI41aIt9RcL2NlkaKdv3CBSUv1ZYv
	vqw6Z5MqwXLOTrFTS4e94YJmgw==
X-Received: by 2002:a17:90b:51cf:b0:3ab:c370:3684 with SMTP id 98e67ed59e1d1-3abc370392emr7678451a91.30.1791965747930;
        Wed, 14 Oct 2026 01:15:47 -0700 (PDT)
Received: from localhost.localdomain ([121.137.86.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f24b757sm3569229a91.10.2026.10.14.01.15.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 Oct 2026 01:15:47 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org
Subject: [RFC PATCH v2 1/2] ALSA: pcm: allow capture reads while draining
Date: Wed, 14 Oct 2026 17:15:43 +0900
Message-ID: <rfc-v2-core-capture-drain-1.2eddd58a796e497f@gmail.com>
In-Reply-To: <rfc-v2-core-capture-drain-0.2eddd58a796e497f@gmail.com>
References: <rfc-v2-core-capture-drain-0.2eddd58a796e497f@gmail.com>
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
