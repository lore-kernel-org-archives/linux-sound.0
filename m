Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614A235A387
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 03:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791948658; cv=none; b=IECbLLS6sxGbsOkhUdG24NE+/w2/WdLtmu2+ZRdRPYtHC8PN6Lk9EScQKdWOz8XgKjiLlUKeTRddAqOwY1TrnwaCfune3THB9Tps2Ur8szqDfTMgQDX8dRYIvw2VNSBu1A6XUtBYNMJX52Buh/iDvGQOWlkN1PpQMfz+1uiWiwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791948658; c=relaxed/simple;
	bh=wSZ3zwnVBwhfAGt5ifjj+oFVu2p72JS9QMJwu71vpk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ewpy6g/YayyIjWnr1BK/cKYXdpzQHcw3Wdcxx6V4Bv7jEY+d0pqcFQopLU9DLLFx6221QIJb2yoQs+eIXASVfw30barV1gCecJNMlvP5auubZH6V6HjuSjoLbtnTvaLE3IQpP0ynCfb09QLSNHGECM/D59vPzQsCg+ZYBjH86QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZcIxQ4fQ; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZcIxQ4fQ"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso327032a12.3
        for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 20:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791948657; x=1792553457; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t7IRL6SEiSa3rzeqlbvDCyLB5N7LUmPGMrQiBUcualE=;
        b=ZcIxQ4fQPwR+TZiLlaYG55ZbbYOi1loEwJYwfyOl5fwpJw5SgsuopKGGI2gQ7QVbi9
         oy5ubrcbdKHjJhVQy8k63wasDtxiw6edStZHnU+5XYnoHtDMghJcA8Ib6zPK9CMLoG30
         mAmnjmwCbgH5LkLTsbs85hObKQF6h8MVbcsSQnbyoqDG5WB9D8S/9Gxj1EkYrsuUfWE2
         S3vbS7+KK4QwiG5CdQ/jSL0U8lFuCaC+i8vYW3H71y70K+VhW8e0nST/5RSS+rlgdAZS
         6SV2S3hJZQsVVLtHwJPtK7k2X3FQE2bNJcAKfGcT9ngSKZ5oYf7IL4Gnv9erDYMZSKpt
         pBig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791948657; x=1792553457;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t7IRL6SEiSa3rzeqlbvDCyLB5N7LUmPGMrQiBUcualE=;
        b=eh3SzgwLXDGwPkd1l4+kaeqWJTEYD0wi6YsJBv2zzObxVMs860c4A3BwP2AAkqOIW6
         Pek8APY8Z2F+p4jf+JswaKKG+atYRj72h8sblvzN6EOIdOGqXo3zWjezbEpul7Pbl4f8
         FbhR0hXCOb2Z+m0Aug0L1+jGJW6N08eif+AjeZvm+H7pLWCgt2xDfBcWHdtoGKdg9hNx
         Rd6jAEyrMZ1bHKvyMPBfKLBLetAwPyJK8LuDbeI5BnFJs1PP11QCiVyZ2fZlkq/29Tvd
         5OerEKiRmfXAJ2lFrB4rs8QznqES1yzOZzz7jzAApNR/46uSRgyXKoYF+WHFHD/+CtaK
         yxVA==
X-Gm-Message-State: AFq9FYJVIG8mdDfUimtl38+9aN0adJUFNmAwxFWbgtoMUxLBxsjDJaIY
	m9CRC2XoQhSlmMMU882cWP0Iba8SEJSgRp9iEUjmEJ7+PX6uGUJWCinq
X-Gm-Gg: AYBFou0tF2UsiPQvbyYs8tKW1S8DVxNHPUYM54eKeaFfGhD67tSexyn09I1LMN72j/5
	QA2wCYh7wL5wzYXnFD4l877SbKUmjJnsOeEJBLorIEtF5YWZP6kVBu7GZUH3wE8SW+UhPpttPxh
	OCUTUIoJtybCV1eaDejb/Y5EOFQDrB1IEWZwtEC4vhk5UtdKSfF5TAEHZcmEhZcBSzQXj/HJ78j
	t/tgvwE8xtx6tdLDOaMwZEGQjjtFFQHt+k932AcrIXigYHMUHS5Lt4nV2f2doqOfXCH3JGslgIW
	OyI9mwAF5lPHG4A3B9BilLX7bGO9aERF9oQbHgGKwVMk/12u51ulV9niX2pKKSa+aH0AwAhw9gp
	wILpc5QL6R7/d2oDqaIlj6ZHImr8NlcZ5uf4oBhxssx9BxaADZEiK/j3UVWuTjqiiU2Qhc2kTam
	IinLs6qHZ12sZdzITtzAFewuzzg04IBwv8XbCJLJUFXyj54jpccdIl1VLaY3U2kIE0XInwbuwDw
	o9vSnzIrOsNDWBtk8PRZY6WKQbVt6nJHUC3wKOmvRKfnGFPaeZ2XeTuXbRxgXNKidxoUSLnY0rZ
	zMQLMHsQAO/+p9QZ
X-Received: by 2002:a17:90b:3145:b0:3a4:b0b9:6b3e with SMTP id 98e67ed59e1d1-3ab3ab40fa2mr11879030a91.36.1791948656754;
        Tue, 13 Oct 2026 20:30:56 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5ee3093bsm3301344a91.0.2026.10.13.20.30.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Oct 2026 20:30:56 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org
Subject: [RFC PATCH 1/2] ALSA: pcm: allow capture reads while draining
Date: Wed, 14 Oct 2026 12:30:52 +0900
Message-ID: <rfc-core-capture-drain-1.112c40f0e9284eaa@gmail.com>
In-Reply-To: <rfc-core-capture-drain-0.112c40f0e9284eaa@gmail.com>
References: <rfc-core-capture-drain-0.112c40f0e9284eaa@gmail.com>
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
