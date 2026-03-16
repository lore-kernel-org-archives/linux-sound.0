Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727CB25A655
	for <linux-sound@vger.kernel.org>; Mon, 16 Mar 2026 07:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773644682; cv=none; b=LpGnP+3o839rk3ioCqMwNb+/BUBSk9975x+ssPGI3rsyRvhwK23cMLUksVW3xE1tBXO1PIPCgaDGhi+f+r/A/M5XI6DLA/R+VaFBBn/1czbUPeV5LdMlD9DECpBvGWsdqnpdQR6c1P4LBQL8CZY2TjKl4O5BVd75S6m1YnULl60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773644682; c=relaxed/simple;
	bh=ez82zxCDf9P9+PNzHGei2Hhnm1dPlCEked1dI8VnhJ4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oXia0+2DtZ2HECj+yV3Ppz0Ih9XUAu0E2za3B92k8An+1Kt6v+kF/tUCUER6YVFN3N9430el3rH2oL1nZ4tkNtJWPFzk+fm4lfBokgO4qgJwVkDdGh13s/2Gv6OxnsSX/qIcGa4s8BwwVdeiVFdWGfP/amoGIg1CSRUWeiyRLIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UUkgYD52; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UUkgYD52"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-35b88a4f123so736858a91.1
        for <linux-sound@vger.kernel.org>; Mon, 16 Mar 2026 00:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773644680; x=1774249480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nVCjl98hSGWubchG+CVHkUXvsWypJfNduECzgqravVA=;
        b=UUkgYD52+y8JATLvhduQb13MXCB7p5pJeChY2uO8XOy1DtLdWy75l/O+aturRFQ0Xk
         ZZkciDtSDpGlnqBjCGF6DSdxPeTBH+fxPi/70lWprzxNQojSp64jyJ+FKqXZwHEDzBJC
         Ej+VzAyBvid8LvsuPMl52L6PbvoSnPfy50+8oi/jISCieYXhxW+SbsNtCakXxO2T9qG0
         0NI+/AZZDqe2uS3ZTfXrW5ybQdYWuG6US7BeQEZZiALAvrXQZG1FZ1RNtWSHTneubzDV
         2fl4pjRWP/7kAo7GWp/DD3qO4BvUcwIqLU+9kqDY2yXezsXKal9GqTGFquQePWXPlJH9
         7vQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773644680; x=1774249480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nVCjl98hSGWubchG+CVHkUXvsWypJfNduECzgqravVA=;
        b=RsoSsaViOnhxOpZtfYd4Ni5apOJttaZLJbG3Y9zrM12wDLZ+TTndMLOig+eoa7WgTH
         qDwSmpwkptjY35IQ+3nfYAY6siXbB6qwrUSIEfvqpbdcXUk63mkmiUDs1orTKLUPC1Jf
         0SBzJuCS1YDG5au5pQ21AHyGFVzlAFIVG17yY6BRDrmqakw5jUwBj1/fZUIobfc5CRy1
         Cljp6bMuCF+KXtmEWnyJhx7KNWQl1YneDDK7E5gkrK4599VqdgtYpkGeF8NJSuCDtt5p
         xwVDSv7W+cF1A0aHyYdu2DZ8aIm6raiBcMrWhaS+vX+RJ1kKEC2Qy5PY6ie6JsSrBIzU
         7Izw==
X-Forwarded-Encrypted: i=1; AJvYcCXFngevbREOrYYQeJZOXeUQa136rdSiAHlwaQRjfcd618aRaCZ4ksb2gJwbzDMDkkXrCPVX0JAwKzAOJA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8TmJvw0P5HZt4+d3Dvg/boQTE0CY/kMjecyDhENcbT9fE7Edk
	QKLSch1EJTbNYarmh49hg98XPXGYNlTO/G/8SiAH/touBdecqGArvZ8JLTbVJAgFQSw=
X-Gm-Gg: ATEYQzyxB01zKWJJdynciLKKbBIHJyKjKaEJLfU4cUGro9hluIHdI+biog5RnLqU682
	7KUmhmEA4pikBwkrXxhQA5nmtkjXrqDIY4khe7CTaTvuR2ZTWsz2r35nux14Rl9SK6jZSRUc28U
	dk0TL5Xrxzs6tcTSu3wsGe8GXn1if/2vnkIJN46GwLOGZTPKLC4dRG7QaJ6yCmcRAtnEiHwfTC8
	mE1jE+lBnOS7h++KY4gIVbNiYIm+8CqdPhkeABHGbVTNWRRxyAiXd4qbvjxXIYOtdIwTN48aAqo
	KE5Jq6DUGbqRnIVdsfhczQFP9ARVxPk0/d7RQlxQ5/HK56Mtcuqb8ExoZrZXYupUNbBLLSiYoJw
	SbJMP/bNngkk0wU7BHjsNuCW46KwnUayZL53XjCeN+RIOzr6oEomq7qKwa3q2GtiXuuVDeTAZAN
	MxwIS5mkB/Z4VbmTOxc5nAfF6LPrHFDaOcUjqGP04=
X-Received: by 2002:a17:90b:580c:b0:359:8df1:8553 with SMTP id 98e67ed59e1d1-35a21fd7ac6mr9423638a91.9.1773644679682;
        Mon, 16 Mar 2026 00:04:39 -0700 (PDT)
Received: from lavm-prs74opxn5.. ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35b95822ca2sm1419864a91.4.2026.03.16.00.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 00:04:39 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	chleroy@kernel.org
Cc: tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	r33s3n6@gmail.com,
	gality369@gmail.com,
	zhenghaoran154@gmail.com,
	hanguidong02@gmail.com,
	ziyuzhang201@gmail.com,
	Cen Zhang <zzzccc427@gmail.com>
Subject: [PATCH] ALSA: pcm: oss: annotate data-races around runtime->state
Date: Mon, 16 Mar 2026 14:48:18 +0800
Message-Id: <20260316064818.2865473-1-zzzccc427@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__snd_pcm_set_state() writes runtime->state under the PCM stream lock:

    runtime->state = state;

However, the OSS I/O functions snd_pcm_oss_write3(), snd_pcm_oss_read3(),
snd_pcm_oss_writev3() and snd_pcm_oss_readv3() read runtime->state
without holding the stream lock, only holding oss.params_lock (a
different mutex that does not synchronize with the stream lock):

    if (runtime->state == SNDRV_PCM_STATE_XRUN || ...)

Since __snd_pcm_set_state() is called from IRQ context (e.g.,
snd_pcm_period_elapsed -> snd_pcm_update_state -> __snd_pcm_xrun ->
snd_pcm_stop -> snd_pcm_post_stop) while the OSS read/write paths
run in process context, these are concurrent accesses that constitute
a data race.

The code handles stale reads gracefully through its retry loop
(re-checking after __snd_pcm_lib_xfer returns -EPIPE), so the race
is not harmful under simple interleaving. However, plain C accesses
are formally undefined under LKMM, and without READ_ONCE the compiler
is free to fuse or cache the loads across loop iterations.

Add WRITE_ONCE() in __snd_pcm_set_state() for the write side and
READ_ONCE() on all lockless reads of runtime->state in the four OSS
I/O functions.

Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 include/sound/pcm.h      |  2 +-
 sound/core/oss/pcm_oss.c | 34 +++++++++++++++++-----------------
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index a7860c047503..a91061ace828 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -725,7 +725,7 @@ static inline int snd_pcm_running(struct snd_pcm_substream *substream)
 static inline void __snd_pcm_set_state(struct snd_pcm_runtime *runtime,
 				       snd_pcm_state_t state)
 {
-	runtime->state = state;
+	WRITE_ONCE(runtime->state, state);
 	runtime->status->state = state; /* copy for mmap */
 }
 
diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
index d4fd4dfc7fc3..b9277f54fa27 100644
--- a/sound/core/oss/pcm_oss.c
+++ b/sound/core/oss/pcm_oss.c
@@ -1229,12 +1229,12 @@ snd_pcm_sframes_t snd_pcm_oss_write3(struct snd_pcm_substream *substream, const
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	int ret;
 	while (1) {
-		if (runtime->state == SNDRV_PCM_STATE_XRUN ||
-		    runtime->state == SNDRV_PCM_STATE_SUSPENDED) {
+		if (READ_ONCE(runtime->state) == SNDRV_PCM_STATE_XRUN ||
+		    READ_ONCE(runtime->state) == SNDRV_PCM_STATE_SUSPENDED) {
 #ifdef OSS_DEBUG
 			pcm_dbg(substream->pcm,
 				"pcm_oss: write: recovering from %s\n",
-				runtime->state == SNDRV_PCM_STATE_XRUN ?
+				READ_ONCE(runtime->state) == SNDRV_PCM_STATE_XRUN ?
 				"XRUN" : "SUSPEND");
 #endif
 			ret = snd_pcm_oss_prepare(substream);
@@ -1249,7 +1249,7 @@ snd_pcm_sframes_t snd_pcm_oss_write3(struct snd_pcm_substream *substream, const
 			break;
 		/* test, if we can't store new data, because the stream */
 		/* has not been started */
-		if (runtime->state == SNDRV_PCM_STATE_PREPARED)
+		if (READ_ONCE(runtime->state) == SNDRV_PCM_STATE_PREPARED)
 			return -EAGAIN;
 	}
 	return ret;
@@ -1261,18 +1261,18 @@ snd_pcm_sframes_t snd_pcm_oss_read3(struct snd_pcm_substream *substream, char *p
 	snd_pcm_sframes_t delay;
 	int ret;
 	while (1) {
-		if (runtime->state == SNDRV_PCM_STATE_XRUN ||
-		    runtime->state == SNDRV_PCM_STATE_SUSPENDED) {
+		if (READ_ONCE(runtime->state) == SNDRV_PCM_STATE_XRUN ||
+		    READ_ONCE(runtime->state) == SNDRV_PCM_STATE_SUSPENDED) {
 #ifdef OSS_DEBUG
 			pcm_dbg(substream->pcm,
 				"pcm_oss: read: recovering from %s\n",
-				runtime->state == SNDRV_PCM_STATE_XRUN ?
+				READ_ONCE(runtime->state) == SNDRV_PCM_STATE_XRUN ?
 				"XRUN" : "SUSPEND");
 #endif
 			ret = snd_pcm_kernel_ioctl(substream, SNDRV_PCM_IOCTL_DRAIN, NULL);
 			if (ret < 0)
 				break;
-		} else if (runtime->state == SNDRV_PCM_STATE_SETUP) {
+		} else if (READ_ONCE(runtime->state) == SNDRV_PCM_STATE_SETUP) {
 			ret = snd_pcm_oss_prepare(substream);
 			if (ret < 0)
 				break;
@@ -1285,7 +1285,7 @@ snd_pcm_sframes_t snd_pcm_oss_read3(struct snd_pcm_substream *substream, char *p
 					 frames, in_kernel);
 		mutex_lock(&runtime->oss.params_lock);
 		if (ret == -EPIPE) {
-			if (runtime->state == SNDRV_PCM_STATE_DRAINING) {
+			if (READ_ONCE(runtime->state) == SNDRV_PCM_STATE_DRAINING) {
 				ret = snd_pcm_kernel_ioctl(substream, SNDRV_PCM_IOCTL_DROP, NULL);
 				if (ret < 0)
 					break;
@@ -1304,12 +1304,12 @@ snd_pcm_sframes_t snd_pcm_oss_writev3(struct snd_pcm_substream *substream, void
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	int ret;
 	while (1) {
-		if (runtime->state == SNDRV_PCM_STATE_XRUN ||
-		    runtime->state == SNDRV_PCM_STATE_SUSPENDED) {
+		if (READ_ONCE(runtime->state) == SNDRV_PCM_STATE_XRUN ||
+		    READ_ONCE(runtime->state) == SNDRV_PCM_STATE_SUSPENDED) {
 #ifdef OSS_DEBUG
 			pcm_dbg(substream->pcm,
 				"pcm_oss: writev: recovering from %s\n",
-				runtime->state == SNDRV_PCM_STATE_XRUN ?
+				READ_ONCE(runtime->state) == SNDRV_PCM_STATE_XRUN ?
 				"XRUN" : "SUSPEND");
 #endif
 			ret = snd_pcm_oss_prepare(substream);
@@ -1322,7 +1322,7 @@ snd_pcm_sframes_t snd_pcm_oss_writev3(struct snd_pcm_substream *substream, void
 
 		/* test, if we can't store new data, because the stream */
 		/* has not been started */
-		if (runtime->state == SNDRV_PCM_STATE_PREPARED)
+		if (READ_ONCE(runtime->state) == SNDRV_PCM_STATE_PREPARED)
 			return -EAGAIN;
 	}
 	return ret;
@@ -1333,18 +1333,18 @@ snd_pcm_sframes_t snd_pcm_oss_readv3(struct snd_pcm_substream *substream, void *
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	int ret;
 	while (1) {
-		if (runtime->state == SNDRV_PCM_STATE_XRUN ||
-		    runtime->state == SNDRV_PCM_STATE_SUSPENDED) {
+		if (READ_ONCE(runtime->state) == SNDRV_PCM_STATE_XRUN ||
+		    READ_ONCE(runtime->state) == SNDRV_PCM_STATE_SUSPENDED) {
 #ifdef OSS_DEBUG
 			pcm_dbg(substream->pcm,
 				"pcm_oss: readv: recovering from %s\n",
-				runtime->state == SNDRV_PCM_STATE_XRUN ?
+				READ_ONCE(runtime->state) == SNDRV_PCM_STATE_XRUN ?
 				"XRUN" : "SUSPEND");
 #endif
 			ret = snd_pcm_kernel_ioctl(substream, SNDRV_PCM_IOCTL_DRAIN, NULL);
 			if (ret < 0)
 				break;
-		} else if (runtime->state == SNDRV_PCM_STATE_SETUP) {
+		} else if (READ_ONCE(runtime->state) == SNDRV_PCM_STATE_SETUP) {
 			ret = snd_pcm_oss_prepare(substream);
 			if (ret < 0)
 				break;
-- 
2.34.1

