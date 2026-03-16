Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F302248A0
	for <linux-sound@vger.kernel.org>; Mon, 16 Mar 2026 03:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773631337; cv=none; b=QU22dofvkqoX5hoUr1Hn5uCjqq8ZDWIXQdD3PWOz4zp5Ww7Y3g1Ji9yAfUXPzh/z5G1ddouSlLbV9vMCvXPoDdu8+5aB3nOq+nfAU1dKylWs/eTobjDWbMnENjbypdtiWqIzqB5pLaqAYc5CpqDKULZLiPluUi7BQ4pKQqnLkSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773631337; c=relaxed/simple;
	bh=ez82zxCDf9P9+PNzHGei2Hhnm1dPlCEked1dI8VnhJ4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kMbvqnBZWzNlF20DntcpIRb8VIv88TW70tnRDH9CuHU0BcnThbR63trRuC5wt7t4Jr24Ui+0B0E8VTO8bWyZSUJKg0IoMMiNWAwvcj+MeYvBw0R5qi+QR3RFJhK43m4alEocPB2SVf7793zzF+iG5/9PGKBfkLpbeIvJhVnLP5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E+v3+2Al; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E+v3+2Al"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c7393536e53so1548195a12.2
        for <linux-sound@vger.kernel.org>; Sun, 15 Mar 2026 20:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773631335; x=1774236135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nVCjl98hSGWubchG+CVHkUXvsWypJfNduECzgqravVA=;
        b=E+v3+2AlQqalRr860RJSm30HrQXFFDMroT9aEwpIzyWknMnVBzDkqyieDINeAGuBcw
         qWpc4aU70tbspexSKbXWSoP8ollF3VWXSZoeO/ILuITf+LGibi1oF7A86BwyZOT4FjEM
         s2xooPiaD2w3lBoC4+MYUBgMhdnlxytg9+UjkpQvTZs2AfjWsAHo4UbWhUa1ZFheZk1h
         7526upNCp2ZqgGIJLDf7SMyozYg912haV7mQ1l5tlgUD70DmKucW/upoVe8/p2GYLEfT
         nM77V5jLST7R1+50Xbe9emqEBuMvRZFT7Vsypb4z88X56fRyi2ra3EwbUfWv+8jFGrrq
         1V9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773631335; x=1774236135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nVCjl98hSGWubchG+CVHkUXvsWypJfNduECzgqravVA=;
        b=r9cjtqN1FNRWXeJ2Tw0qPf5GmK94JP6LdIZnNplORNjY5Ok50bpy47IizAk7N52kwX
         /n7VBhP/ZQST1YwsLkSUGVKmz8iW3WzFZOpwyxRsaBwssqW9LnGVY3nUrU6ZliAM+NC8
         flBtRXoS3AU8nDo31j182FWS6Pl+fSnu1NDhpvCgp5EumOOIxAV+K4jSyUjPPegH0EKn
         nYtiSWiogmnWnyeu2mfo09u84bC0thu5ICkpiCYYKSB0ecmk18Obw4epqlMeT8+4toAP
         Jx/wJN2NoD/RzKqUWVLms2K6ZBKPAIruezJTNJZQZTuKXiaAWTPwU+DaYFoFnRvLrPcY
         nroA==
X-Gm-Message-State: AOJu0YzlVzOXy6T7WulkW1VS1ZYGMmeACyFVu/GIJO1fJElBmsbdEeHn
	D1pgEm9AF5uQhxYge0f+/fmMbrfY2tYKa0FkOkv8ID/anpjgkjk0pGuK
X-Gm-Gg: ATEYQzyzZPo2ARJtRARneHQNXuXnlpqal7JwrFPOhu27bOT4zvb7o7n6YgsB14brLck
	ziURs0g2gLg/Kvgf98+BjgPukgPQGf6FOXjeVh3BjiPLQqskLo8O1KmYyaG4F0kVkKwgfOAhSTc
	B5wlL5iwcgy2JSizBhFVTUSxdoXmYVpJ4FiiePWWTeHUXbNbAu2ftftDEuBTQCDLH7y/h8HvzFO
	t4P76LmyXddqkPrpy3bICGGqBoq7zLgDuy7CnmOF1gn+quA2k0UAHNWZa5qaKYJEKyAAEmH+Pt6
	KYBZbaW+JsAHlndfZz7W5hAwMQZeOImrtczlo7bf9Z9fSftarpBueFqhbPNh5YBrmdOumD4WDSy
	IB3LSUQggVkP4NTQThO/wHkExXRgUc4Syy/bDMCHPAxY6qURrPgji4FAl8JOxhI8ZCj7nN5RF6j
	VaVSH7UyjaaMWlr/KjW1Ue3sTM/PCn
X-Received: by 2002:a05:6a21:7113:b0:398:a306:d645 with SMTP id adf61e73a8af0-398ecaf75abmr10382710637.25.1773631334813;
        Sun, 15 Mar 2026 20:22:14 -0700 (PDT)
Received: from lavm-prs74opxn5.. ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73ebb6336bsm8319076a12.21.2026.03.15.20.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 20:22:14 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	chleroy@kernel.org
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	r33s3n6@gmail.com,
	gality369@gmail.com,
	zhenghaoran154@gmail.com,
	hanguidong02@gmail.com,
	ziyuzhang201@gmail.com,
	Cen Zhang <zzzccc427@gmail.com>
Subject: [PATCH] ALSA: pcm: oss: annotate data-races around runtime->state
Date: Mon, 16 Mar 2026 11:05:50 +0800
Message-Id: <20260316030550.2848349-1-zzzccc427@gmail.com>
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

