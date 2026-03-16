Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4462384231
	for <linux-sound@vger.kernel.org>; Mon, 16 Mar 2026 09:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773652032; cv=none; b=tz/c9Bk0pk0GiCQKjrg77d4EoDtMwS0VL+AvdWn85KYKQYlCVPHpNaLZEleZ4j9OJBK8zFgz/3KwLwx58bluO1JFgnRbxJiRiab8QCC5FMXm1pPY11npcyuZNOy630ArOeY8PekIPzT+r/e7zYL7MzSc9WvIBSe6rgeA2BZXJFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773652032; c=relaxed/simple;
	bh=8NYax7rMXGw6UklnwmlW6QXAHYcjnC8hCmc2/pZQrgY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=f18I4vm3as2urh/hRXDMsrpngrm1pLXxIdln+mTj+N8QY0HfMWrlGb3hLidrPpGM2t0hwsei4FOCIeB0VBjn2aD71/JxJxr84bAQincRkFCZ0rd3fqMxp9yobGaJu7r9UUMYA2IbT+XrE0VMR8JU7ks/FkbAKFziilP7gk1QbcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EdLkudCx; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EdLkudCx"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-829b8b6c4d0so3506323b3a.0
        for <linux-sound@vger.kernel.org>; Mon, 16 Mar 2026 02:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773652030; x=1774256830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mgojYXpmBrvzhdHNlEYoOPMdv6sXqH93TcVi/jNcSt0=;
        b=EdLkudCxDLA0VTIjfk3ySZbWCvSDKlRhK0p2OmWK/EtKxKNdMtsRtJGy9KanzPEYuK
         b5VSZQ3k+B/DHQyrAeTZigfTJE2ENSADh9bcdDFk27sqXIWmcr6BibsbF/HCw9fHyDib
         4cH0x3sPp4CXCWLKKgPgZA5F2RYt9RPRAoArzAaKZLmd+zPDcdzh7Swt9pFWSfNSltTd
         iC/xZB9L7ItR6bNKXN8xxFUlMGu4tHeLx5tXdldhgxCZNYAzM07Pbzh6XJ/nZusvoik2
         MsnWl9XeV0fvg6RJX2afyL2guDHCx/PN8d6c5ABQhJuF+L263lEOUtw3s6sjj0tfVNE3
         KA+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773652030; x=1774256830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mgojYXpmBrvzhdHNlEYoOPMdv6sXqH93TcVi/jNcSt0=;
        b=qACCs+tcO+fodaCNBq07GeaGIRTzc5SXtsdJ1HXk/R3Zf43d8cy9AT/cENUNbwZzaL
         Nw7LljyXkd7MQSdtwaw/LASDVLY73mN1LV5s5oOYKZYwNAoY1KtYRdiAkiSLUjXTd8Un
         O3slDRQm37Av38xjtXiVhJWQtqUY4EmFmP0sKQRFKZq9s/66FKMqeTsw5vvl4Yif9W6s
         0+KUfwyiDnOoDtztVm4hBKWF379kSEAo9cq7cJxeE+QiBy2BYdIkiodIu8JXrVWKn4Ui
         o1IMNXrpelhY1XAIqeeW4bcmQSoGdq/ztRTib2f1qalfp+vosORkHCUVy8m4lNDghjtJ
         8UdA==
X-Forwarded-Encrypted: i=1; AJvYcCWg8gtBpbQkCMQOuRtsSVTe2joAleZJn2vKSaSpahDtCy9D/++WCseDsLvKUVf/t/EyO5eVryTRXpD9lQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yznj4Jj34LTQLdIbushXLpVPLF3z44ldT6lHJy06WceTVKhz50e
	99vgBVhtKSez0FouniiL+Q7gvppyt0M2DS4IdUrZED+cvGDV7NxGpaDl
X-Gm-Gg: ATEYQzz+wEZ11g5JL4rjjW94RJd6A1PkQAa41auO2c1SPnCUfOpwNImZatY0NPiZ9Ub
	8g0VU3xknKmu/E/M0IEcwObiIOoWe4KG14n91W8DF4gVTahvmpjHO3rw16q8vM7to22ONcKdqnB
	AGrx/qwghQWZzx3Y9jzdNVPvU0LpOHDHQanI4ryRlRT+u6a5/BYsd+U3wcCrtBbhEfO1K/mLoR5
	FjZ3XXklJR04/ojRylwCK+ZGuwv7jlDlARHsgECcuxRnh+SJgw9EC4q1gUIKh8GlOychB1HLsln
	hT3lb62CyCa8KCXbHeUy47ikZ2JNWuPqmVns0CpDFnnAwBESTtj3/4n6Qeo6i7trHBMfyx2+cp/
	TTzWAQXdMnNYZaEsm0i6jbDe9xKxLKba1+2hyVyvW74hl3UTi4wWyXXZ9hUJAzxpE6S3J+GrcS9
	aagWWjnHHTNS9m5jfoY7hLDWGC4l5z
X-Received: by 2002:a05:6a00:3d9b:b0:82a:122e:539c with SMTP id d2e1a72fcca58-82a198456f0mr9358093b3a.20.1773652029941;
        Mon, 16 Mar 2026 02:07:09 -0700 (PDT)
Received: from lavm-prs74opxn5.. ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a07340439sm12789768b3a.31.2026.03.16.02.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 02:07:09 -0700 (PDT)
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
Subject: [PATCH v2] ALSA: pcm: oss: use proper stream lock for runtime->state access
Date: Mon, 16 Mar 2026 16:50:47 +0800
Message-Id: <20260316085047.2876451-1-zzzccc427@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__snd_pcm_set_state() writes runtime->state under the PCM stream lock.
However, the OSS I/O functions snd_pcm_oss_write3(), snd_pcm_oss_read3(),
snd_pcm_oss_writev3() and snd_pcm_oss_readv3() read runtime->state
without holding the stream lock, only holding oss.params_lock (a
different mutex that does not synchronize with the stream lock).

Since __snd_pcm_set_state() is called from IRQ context (e.g.,
snd_pcm_period_elapsed -> snd_pcm_update_state -> __snd_pcm_xrun ->
snd_pcm_stop -> snd_pcm_post_stop) while the OSS read/write paths
run in process context, these are concurrent accesses that constitute
a data race.

Rather than using READ_ONCE()/WRITE_ONCE() barriers, introduce a
snd_pcm_get_state() helper that reads runtime->state under the stream
lock, matching the locking discipline used elsewhere in the PCM layer.
Also export snd_pcm_set_state() for completeness.

Use snd_pcm_get_state() in all four OSS I/O functions, caching the
result in a local variable where the same snapshot is used for
multiple comparisons to avoid taking the lock repeatedly.

Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 include/sound/pcm.h      |  4 ++++
 sound/core/oss/pcm_oss.c | 44 +++++++++++++++++++++++-----------------
 sound/core/pcm_native.c  | 23 +++++++++++++++++++--
 3 files changed, 50 insertions(+), 21 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index a7860c047503..76fc33dce537 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -729,6 +729,10 @@ static inline void __snd_pcm_set_state(struct snd_pcm_runtime *runtime,
 	runtime->status->state = state; /* copy for mmap */
 }
 
+void snd_pcm_set_state(struct snd_pcm_substream *substream,
+		       snd_pcm_state_t state);
+snd_pcm_state_t snd_pcm_get_state(struct snd_pcm_substream *substream);
+
 /**
  * bytes_to_samples - Unit conversion of the size from bytes to samples
  * @runtime: PCM runtime instance
diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
index d4fd4dfc7fc3..a140a0d9abb8 100644
--- a/sound/core/oss/pcm_oss.c
+++ b/sound/core/oss/pcm_oss.c
@@ -1227,14 +1227,16 @@ static int snd_pcm_oss_capture_position_fixup(struct snd_pcm_substream *substrea
 snd_pcm_sframes_t snd_pcm_oss_write3(struct snd_pcm_substream *substream, const char *ptr, snd_pcm_uframes_t frames, int in_kernel)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
+	snd_pcm_state_t state;
 	int ret;
 	while (1) {
-		if (runtime->state == SNDRV_PCM_STATE_XRUN ||
-		    runtime->state == SNDRV_PCM_STATE_SUSPENDED) {
+		state = snd_pcm_get_state(substream);
+		if (state == SNDRV_PCM_STATE_XRUN ||
+		    state == SNDRV_PCM_STATE_SUSPENDED) {
 #ifdef OSS_DEBUG
 			pcm_dbg(substream->pcm,
 				"pcm_oss: write: recovering from %s\n",
-				runtime->state == SNDRV_PCM_STATE_XRUN ?
+				state == SNDRV_PCM_STATE_XRUN ?
 				"XRUN" : "SUSPEND");
 #endif
 			ret = snd_pcm_oss_prepare(substream);
@@ -1249,7 +1251,7 @@ snd_pcm_sframes_t snd_pcm_oss_write3(struct snd_pcm_substream *substream, const
 			break;
 		/* test, if we can't store new data, because the stream */
 		/* has not been started */
-		if (runtime->state == SNDRV_PCM_STATE_PREPARED)
+		if (snd_pcm_get_state(substream) == SNDRV_PCM_STATE_PREPARED)
 			return -EAGAIN;
 	}
 	return ret;
@@ -1259,20 +1261,22 @@ snd_pcm_sframes_t snd_pcm_oss_read3(struct snd_pcm_substream *substream, char *p
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	snd_pcm_sframes_t delay;
+	snd_pcm_state_t state;
 	int ret;
 	while (1) {
-		if (runtime->state == SNDRV_PCM_STATE_XRUN ||
-		    runtime->state == SNDRV_PCM_STATE_SUSPENDED) {
+		state = snd_pcm_get_state(substream);
+		if (state == SNDRV_PCM_STATE_XRUN ||
+		    state == SNDRV_PCM_STATE_SUSPENDED) {
 #ifdef OSS_DEBUG
 			pcm_dbg(substream->pcm,
 				"pcm_oss: read: recovering from %s\n",
-				runtime->state == SNDRV_PCM_STATE_XRUN ?
+				state == SNDRV_PCM_STATE_XRUN ?
 				"XRUN" : "SUSPEND");
 #endif
 			ret = snd_pcm_kernel_ioctl(substream, SNDRV_PCM_IOCTL_DRAIN, NULL);
 			if (ret < 0)
 				break;
-		} else if (runtime->state == SNDRV_PCM_STATE_SETUP) {
+		} else if (state == SNDRV_PCM_STATE_SETUP) {
 			ret = snd_pcm_oss_prepare(substream);
 			if (ret < 0)
 				break;
@@ -1285,7 +1289,7 @@ snd_pcm_sframes_t snd_pcm_oss_read3(struct snd_pcm_substream *substream, char *p
 					 frames, in_kernel);
 		mutex_lock(&runtime->oss.params_lock);
 		if (ret == -EPIPE) {
-			if (runtime->state == SNDRV_PCM_STATE_DRAINING) {
+			if (snd_pcm_get_state(substream) == SNDRV_PCM_STATE_DRAINING) {
 				ret = snd_pcm_kernel_ioctl(substream, SNDRV_PCM_IOCTL_DROP, NULL);
 				if (ret < 0)
 					break;
@@ -1301,15 +1305,16 @@ snd_pcm_sframes_t snd_pcm_oss_read3(struct snd_pcm_substream *substream, char *p
 #ifdef CONFIG_SND_PCM_OSS_PLUGINS
 snd_pcm_sframes_t snd_pcm_oss_writev3(struct snd_pcm_substream *substream, void **bufs, snd_pcm_uframes_t frames)
 {
-	struct snd_pcm_runtime *runtime = substream->runtime;
+	snd_pcm_state_t state;
 	int ret;
 	while (1) {
-		if (runtime->state == SNDRV_PCM_STATE_XRUN ||
-		    runtime->state == SNDRV_PCM_STATE_SUSPENDED) {
+		state = snd_pcm_get_state(substream);
+		if (state == SNDRV_PCM_STATE_XRUN ||
+		    state == SNDRV_PCM_STATE_SUSPENDED) {
 #ifdef OSS_DEBUG
 			pcm_dbg(substream->pcm,
 				"pcm_oss: writev: recovering from %s\n",
-				runtime->state == SNDRV_PCM_STATE_XRUN ?
+				state == SNDRV_PCM_STATE_XRUN ?
 				"XRUN" : "SUSPEND");
 #endif
 			ret = snd_pcm_oss_prepare(substream);
@@ -1322,7 +1327,7 @@ snd_pcm_sframes_t snd_pcm_oss_writev3(struct snd_pcm_substream *substream, void
 
 		/* test, if we can't store new data, because the stream */
 		/* has not been started */
-		if (runtime->state == SNDRV_PCM_STATE_PREPARED)
+		if (snd_pcm_get_state(substream) == SNDRV_PCM_STATE_PREPARED)
 			return -EAGAIN;
 	}
 	return ret;
@@ -1330,21 +1335,22 @@ snd_pcm_sframes_t snd_pcm_oss_writev3(struct snd_pcm_substream *substream, void
 	
 snd_pcm_sframes_t snd_pcm_oss_readv3(struct snd_pcm_substream *substream, void **bufs, snd_pcm_uframes_t frames)
 {
-	struct snd_pcm_runtime *runtime = substream->runtime;
+	snd_pcm_state_t state;
 	int ret;
 	while (1) {
-		if (runtime->state == SNDRV_PCM_STATE_XRUN ||
-		    runtime->state == SNDRV_PCM_STATE_SUSPENDED) {
+		state = snd_pcm_get_state(substream);
+		if (state == SNDRV_PCM_STATE_XRUN ||
+		    state == SNDRV_PCM_STATE_SUSPENDED) {
 #ifdef OSS_DEBUG
 			pcm_dbg(substream->pcm,
 				"pcm_oss: readv: recovering from %s\n",
-				runtime->state == SNDRV_PCM_STATE_XRUN ?
+				state == SNDRV_PCM_STATE_XRUN ?
 				"XRUN" : "SUSPEND");
 #endif
 			ret = snd_pcm_kernel_ioctl(substream, SNDRV_PCM_IOCTL_DRAIN, NULL);
 			if (ret < 0)
 				break;
-		} else if (runtime->state == SNDRV_PCM_STATE_SETUP) {
+		} else if (state == SNDRV_PCM_STATE_SETUP) {
 			ret = snd_pcm_oss_prepare(substream);
 			if (ret < 0)
 				break;
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 5a64453da728..674b50c7c5f6 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -618,13 +618,32 @@ static int period_to_usecs(struct snd_pcm_runtime *runtime)
 	return usecs;
 }
 
-static void snd_pcm_set_state(struct snd_pcm_substream *substream,
-			      snd_pcm_state_t state)
+/**
+ * snd_pcm_set_state - Set the PCM runtime state with stream lock
+ * @substream: PCM substream
+ * @state: state to set
+ */
+void snd_pcm_set_state(struct snd_pcm_substream *substream,
+		       snd_pcm_state_t state)
 {
 	guard(pcm_stream_lock_irq)(substream);
 	if (substream->runtime->state != SNDRV_PCM_STATE_DISCONNECTED)
 		__snd_pcm_set_state(substream->runtime, state);
 }
+EXPORT_SYMBOL_GPL(snd_pcm_set_state);
+
+/**
+ * snd_pcm_get_state - Read the PCM runtime state with stream lock
+ * @substream: PCM substream
+ *
+ * Return: the current PCM state
+ */
+snd_pcm_state_t snd_pcm_get_state(struct snd_pcm_substream *substream)
+{
+	guard(pcm_stream_lock_irqsave)(substream);
+	return substream->runtime->state;
+}
+EXPORT_SYMBOL_GPL(snd_pcm_get_state);
 
 static inline void snd_pcm_timer_notify(struct snd_pcm_substream *substream,
 					int event)
-- 
2.34.1

