Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E1D3E4C85
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 08:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782462576; cv=none; b=qxbc4ZPhX2b6fuMSgLyes3fCcMbpSOk01sxptGaofagzdrbtr2NprxD9VqAnIMH6xHAVV2ppE/kIirN0SYuDJp4oAhrLNzc31RkzhRt/G+rx8ocbWCCTUNotR/L9RAqfwAZpiFHYAFD33P7FOredZiAO67nmb57PxF+OTTC0JIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782462576; c=relaxed/simple;
	bh=QMpLaeMYHzy6Myo4Ep3bqReIpEpJ9cE2JlLXp+bU+Jo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kTDlP14a5qn2D331lYXA9AT4yF9UVY34k6xUekianxwwvtvE0qHmvdgd7j+MHVUbAT+LUCVN04EdBYdjVMQKUdSMzXYTK+7+815IWZq6gEz0rwym38zlnASRRDv0Rvrb+6x7AXBBVCbGxB0Ca7YL3MJuzWJMYFBf14lEOdwaKwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f/ZfZ/b/; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f/ZfZ/b/"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-845b88dc991so316661b3a.3
        for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 01:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782462574; x=1783067374; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TeHEpV4WNXdJOMHFbuOyhms3Aw+Zto+W8VasHgPw/F0=;
        b=f/ZfZ/b/h8n8b58GKreA1V3v7ndPWESPDbu6NfueEjbq3D4lX40OiqbE+xo6iJhz1O
         z5w953UXChD2Qv1SuSqMmYmgVGQCr2RBjQX5SZPsdCWa3vxn7IjzRk8pCZFhFC8BzrNb
         Ru7U0ccDuIsIvRiAD5t3c6uouRtIeGpzyq/hRbOW7YdUS1Xs+sbm3FVa3ppy8b0hG7/a
         TfTf13tCroGgf1ocCCplEa7IbYRxli3VCf0TPSrZjwf/CrzN/sKo/RmYfrENOkb4WiPd
         nCihgu9ULwjV3wYD+jfALLguK5oRAequCXOl4hWgsizYTEPlAA1G+jKCouQUDnFKxZ0p
         yaXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782462574; x=1783067374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TeHEpV4WNXdJOMHFbuOyhms3Aw+Zto+W8VasHgPw/F0=;
        b=A8bX0+4n35aW3aenkQcHVyNRHRASfZiTw00xRkoj9BPp6nr3htmUOZD43YHT8q5z3I
         L754pIQpTcjLjGLy4vOS3s7YsYIGj6s3f7lFj3yjj+k7RaVdiUMCzEe+M0ydVPRFRlqt
         3nT8h/K6+pq42O1LTxj/CGbZIN0OaY+wLDcNvUKjzZKtlCCMzeuHF2Pv05lrAsA9F94U
         eypFGfp0CuyQOEC6CTiPKyxz5t1wo6P2vj79NKhHjQilGdLxOUW4Xu1f04a+ZypZBcUo
         vnwGj8lVltrRc5WIFLal5pH+oWmVMsWZNuQ4krhBVJ3B4+o4CMgL6fs/92zDw5zx2PSj
         3ykw==
X-Forwarded-Encrypted: i=1; AHgh+Ro2FmmnP8+FduLPa9OgSV68noKjD10LgC3/qIYGz4hW6sVNc7eOwValBixj/XhjFCDCpssnfqTaAy5PJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOA0s6DiMz91dp38Vi1hI2LU/9LnH/UhaV2wdJDHXeoKWhEUUB
	sGNoczeYUXruJYxkMP5JROk6ah1MTEmw6xmdVmQGXhOCIPz/XL+jLCos
X-Gm-Gg: AfdE7cnkp87FSwgT8/27uhsBHFua2FGoaU4kyZtOP6+pYFEpDeOc5yEOmhpgdknBBFv
	lYz+sqlDSnjJ0dwwCU9Tn61ptPTjw1WEw3SVNMezuQ8u2wQ0pl5ZB9qqJ/yT6m9MPHEmSGdfGLE
	yxt96IFUjV6yhPo1nT5Cxb+SM/st8sCS8+ZAV49kiK8m58mY44rUmtASR4bgRcVqlLX9XPxLD6/
	3cIyynOoG1az4AESyLyENTaaXOv9OUD/0ZXfzHVkZlQ5zJ9YnDbDrYpcntxfU6M1SygHqKokwyQ
	o80jY2f1klj0km2Vo866wN++ZJNQBNJCTYLwb6dmkTt3RX4JbwqJoTmiwluqCkhCmrPc9cLRmfc
	WPtJLvZJsWt87RA1oK9xVEZuYRYgp044fDUbk6//sojpEBmXNxmBBjnPRjhvd+tVgItGd/vJFJL
	N8Mq3rZHoogllPCwQswKKd/hKo1xVP5dsGnV44Vlm6Wo9kn7A=
X-Received: by 2002:a05:6a00:2e20:b0:845:bae3:a330 with SMTP id d2e1a72fcca58-845bae3a3f5mr5447171b3a.29.1782462573798;
        Fri, 26 Jun 2026 01:29:33 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a40d234esm6708789b3a.29.2026.06.26.01.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 01:29:33 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 2/5] ASoC: Intel: avs: Use scoped_guard() for scoped locking
Date: Fri, 26 Jun 2026 15:29:01 +0700
Message-ID: <20260626082904.32344-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260626082904.32344-1-phucduc.bui@gmail.com>
References: <20260626082904.32344-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using scoped_guard() for mutex & spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v3:
 - Drop the scoped_guard() conversion in avs_ipc_wait_busy_completion(),
   as the function still uses a goto-based cleanup path.

Changes in v4:
 - Add cleanup.h include where needed.

 sound/soc/intel/avs/debugfs.c | 19 +++++++------
 sound/soc/intel/avs/ipc.c     | 50 +++++++++++++++++------------------
 sound/soc/intel/avs/loader.c  | 15 ++++++-----
 3 files changed, 42 insertions(+), 42 deletions(-)

diff --git a/sound/soc/intel/avs/debugfs.c b/sound/soc/intel/avs/debugfs.c
index 701c247227bf..9ab503da3b75 100644
--- a/sound/soc/intel/avs/debugfs.c
+++ b/sound/soc/intel/avs/debugfs.c
@@ -6,6 +6,7 @@
 //          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/debugfs.h>
 #include <linux/kfifo.h>
 #include <linux/wait.h>
@@ -251,24 +252,22 @@ static int strace_release(struct inode *inode, struct file *file)
 	union avs_notify_msg msg = AVS_NOTIFICATION(LOG_BUFFER_STATUS);
 	struct avs_dev *adev = file->private_data;
 	unsigned long resource_mask;
-	unsigned long flags, i;
+	unsigned long i;
 	u32 num_cores;
 
 	resource_mask = adev->logged_resources;
 	num_cores = adev->hw_cfg.dsp_cores;
 
-	spin_lock_irqsave(&adev->trace_lock, flags);
+	scoped_guard(spinlock_irqsave, &adev->trace_lock) {
+		/* Gather any remaining logs. */
+		for_each_set_bit(i, &resource_mask, num_cores) {
+			msg.log.core = i;
+			avs_dsp_op(adev, log_buffer_status, &msg);
+		}
 
-	/* Gather any remaining logs. */
-	for_each_set_bit(i, &resource_mask, num_cores) {
-		msg.log.core = i;
-		avs_dsp_op(adev, log_buffer_status, &msg);
+		kfifo_free(&adev->trace_fifo);
 	}
 
-	kfifo_free(&adev->trace_fifo);
-
-	spin_unlock_irqrestore(&adev->trace_lock, flags);
-
 	module_put(adev->dev->driver->owner);
 	return 0;
 }
diff --git a/sound/soc/intel/avs/ipc.c b/sound/soc/intel/avs/ipc.c
index e99cb703eb7e..71e7997e52c2 100644
--- a/sound/soc/intel/avs/ipc.c
+++ b/sound/soc/intel/avs/ipc.c
@@ -100,39 +100,39 @@ static void avs_dsp_recovery(struct avs_dev *adev)
 	unsigned int core_mask;
 	int ret;
 
-	mutex_lock(&adev->comp_list_mutex);
-	/* disconnect all running streams */
-	list_for_each_entry(acomp, &adev->comp_list, node) {
-		struct snd_soc_pcm_runtime *rtd;
-		struct snd_soc_card *card;
-
-		card = acomp->base.card;
-		if (!card)
-			continue;
-
-		for_each_card_rtds(card, rtd) {
-			struct snd_pcm *pcm;
-			int dir;
-
-			pcm = rtd->pcm;
-			if (!pcm || rtd->dai_link->no_pcm)
+	scoped_guard(mutex, &adev->comp_list_mutex) {
+		/* disconnect all running streams */
+		list_for_each_entry(acomp, &adev->comp_list, node) {
+			struct snd_soc_pcm_runtime *rtd;
+			struct snd_soc_card *card;
+
+			card = acomp->base.card;
+			if (!card)
 				continue;
 
-			for_each_pcm_streams(dir) {
-				struct snd_pcm_substream *substream;
+			for_each_card_rtds(card, rtd) {
+				struct snd_pcm *pcm;
+				int dir;
 
-				substream = pcm->streams[dir].substream;
-				if (!substream || !substream->runtime)
+				pcm = rtd->pcm;
+				if (!pcm || rtd->dai_link->no_pcm)
 					continue;
 
-				/* No need for _irq() as we are in nonatomic context. */
-				snd_pcm_stream_lock(substream);
-				snd_pcm_stop(substream, SNDRV_PCM_STATE_DISCONNECTED);
-				snd_pcm_stream_unlock(substream);
+				for_each_pcm_streams(dir) {
+					struct snd_pcm_substream *substream;
+
+					substream = pcm->streams[dir].substream;
+					if (!substream || !substream->runtime)
+						continue;
+
+					/* No need for _irq() as we are in nonatomic context. */
+					snd_pcm_stream_lock(substream);
+					snd_pcm_stop(substream, SNDRV_PCM_STATE_DISCONNECTED);
+					snd_pcm_stream_unlock(substream);
+				}
 			}
 		}
 	}
-	mutex_unlock(&adev->comp_list_mutex);
 
 	/* forcibly shutdown all cores */
 	core_mask = GENMASK(adev->hw_cfg.dsp_cores - 1, 0);
diff --git a/sound/soc/intel/avs/loader.c b/sound/soc/intel/avs/loader.c
index 353e343b1d28..bebdc79ec88e 100644
--- a/sound/soc/intel/avs/loader.c
+++ b/sound/soc/intel/avs/loader.c
@@ -6,6 +6,7 @@
 //          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/firmware.h>
 #include <linux/module.h>
 #include <linux/slab.h>
@@ -630,15 +631,15 @@ static int avs_load_firmware(struct avs_dev *adev, bool purge)
 	if (ret)
 		goto reenable_gating;
 
-	mutex_lock(&adev->comp_list_mutex);
-	list_for_each_entry(acomp, &adev->comp_list, node) {
-		struct avs_tplg *tplg = acomp->tplg;
+	scoped_guard(mutex, &adev->comp_list_mutex) {
+		list_for_each_entry(acomp, &adev->comp_list, node) {
+			struct avs_tplg *tplg = acomp->tplg;
 
-		ret = avs_dsp_load_libraries(adev, tplg->libs, tplg->num_libs);
-		if (ret < 0)
-			break;
+			ret = avs_dsp_load_libraries(adev, tplg->libs, tplg->num_libs);
+			if (ret < 0)
+				break;
+		}
 	}
-	mutex_unlock(&adev->comp_list_mutex);
 
 reenable_gating:
 	avs_hda_l1sen_enable(adev, true);
-- 
2.43.0

