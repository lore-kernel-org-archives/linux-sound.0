Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA74F3E5A19
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 11:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781780838; cv=none; b=J0bphPLvO0wrueO5xym4eKQYNYh+X0Fhn8YVVzU4Fg8s/7t5i5in5NgM8cBBkK1jg7nKJqbKRiz4RI9lVu7l4wGlFyv0yLeXp1bbCCUeYLN2VKUESSLQEibsIs8ohmCrY7/aidGN5/9fxp5jU9wfEu88xofscPrW7yvEqj2Ivm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781780838; c=relaxed/simple;
	bh=oMUlKq3RD1K+ykHbAmj3/WKiPMtUp/mXsMPFjIajRS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g02Ng8I8pjWO47n1jLa5vJIgOY7Yc3ufE4wcbQIREH+5QhehiTQfkwvoVseWe9j1/hBI/AomZhqtQyU5ZWfowZFfaInocZi2RQLzP/C3wX4nzw/vLRbyCXqWeV04VuGxVwN330zNeh6EVNEstwcRZHRi8VucN8dIUaSKRl7GCnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mlMcCJfM; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mlMcCJfM"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2c6dadfbaafso8343065ad.3
        for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 04:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781780836; x=1782385636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cUIXETDrIcgFTu7/kgx9kJX4C1C5wxx7lpXk9aU+IJk=;
        b=mlMcCJfMhHJRon5eZjCwMWTZPGxYBIkSPfX4ncLCzNU19IwQ6y8Ir9xVBqLqesdehT
         nwQhowP8F2+bxmbwlSO7eM7CS75LasvKAK2yg5KsiOKNy95JEyBaW6N5s78u+DSMCb7w
         hfgbqQhiCKB95Bj4vv1AePOcNAvOi56Kw4qgWTugRgD3iijj97bJmgLuLIt6zcLCCkps
         +agNb2Iw5vrbJQsR3iFqOGduR65jCbQKiGC5vH8AApjUihzZ9HNWS0r2FmecRu2eGWWx
         bqKiMY4g9hYLH5qVYug2EyiTU/yRnkoqOI3tCcLL0rsQmweSeRYLOA4L5Vm5xAPIR3yL
         jO4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781780836; x=1782385636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cUIXETDrIcgFTu7/kgx9kJX4C1C5wxx7lpXk9aU+IJk=;
        b=NxCZhQaUXErKRtl6xUKORSy2ybnHA6Cv+TWAtoIYiLN5YLnqf2Wi22TngDE9ZGOSKc
         bmm8w5p4yQ3Ca/RQAj1pBTVAXDPJt57+UeQh1bMNYI53OivvPZ/UPK1faAItP+etPPTE
         pcaDpY4gZ45QpPM5NfbOqeJWEVZaX1vIvU3jpacCDAIEFxCALh3m37jXL8cnB8Gx1wHX
         CxU5zcnMcli4kHf3/mnNw16NU/O8l7VNGeyRfiGH33Ie4CT/rLchLrg345s2l03DQp5n
         /b3XX4mr5YdpgpXKbAqtIIhLmhoWSrWxo7dJ0TBH93SUA28YRpZ1exNcmFNSjXlU8ikz
         95mg==
X-Forwarded-Encrypted: i=1; AFNElJ/tsZ+25Fu64BxW6D4HG1BctCegkd0wE8SgQav3um4hugHvyZ3lJs4P7HNFCwTas7ebrzwaMMWYYhlbDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVJIiVGivdFxu750tRjT/rNgRaqAeldAPbxEEZWlVSZwQjWQS1
	ydZTjRTi6FlxrTCU+xRKM8Hp9Ae4bkrOpsl3hnPasKOevOO0Qsv9DKvK
X-Gm-Gg: AfdE7cmzdKes+woqkh2cZ8ABuFOCGaavPdsp7xXVCoLsrwHpgxn4TsNxubwSeF0ga9I
	B4ctjzqJVMRCqr41x7AEutqT08mqLyDsV4EGxR272ACv4p6hDrY7T8yIlAg7CCevYbGq/8aNORX
	+6MRQWX3KBrrRqaGJ8HvVrNAEtEi/44ZW+ZxOH2hWIj5aEOTUYCf8dY3XMkRHTh7RPc0CHn9B6t
	YRgJWMoxC1FY7s4j3reNrWdfhhU+GKNGX8AuvDq/wAiOCMM3cJD1UFOswNIEKThJZES69mbCvJ/
	iDbPpLK1Lf4T19/l6a9YhXuJTO4hhXcwjkZX6fjBbY05TvaPh41z8C2Jwq5KPQxWN6rUC0XhgZM
	R8oFaZneXLXxN70xF0NRNkeT2KH+YG3rlibzSryIcHoGdto7Hl5R1UPGP2pa3N3mTFpYHrRO6+g
	+6WipWrP2c3g8M7o6rM351Xxdbnvr58Ih16ibO96pgCXmj+Bc=
X-Received: by 2002:a17:902:e84e:b0:2c0:3400:5c42 with SMTP id d9443c01a7336-2c6e52774femr36037805ad.26.1781780836100;
        Thu, 18 Jun 2026 04:07:16 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c6a1878426sm77828025ad.64.2026.06.18.04.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:07:15 -0700 (PDT)
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
Subject: [PATCH v2 2/4] ASoC: Intel: avs: Use scoped_guard() for scoped locking
Date: Thu, 18 Jun 2026 18:06:46 +0700
Message-ID: <20260618110649.227062-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618110649.227062-1-phucduc.bui@gmail.com>
References: <20260618110649.227062-1-phucduc.bui@gmail.com>
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
 sound/soc/intel/avs/debugfs.c | 18 +++++-----
 sound/soc/intel/avs/ipc.c     | 63 +++++++++++++++++------------------
 sound/soc/intel/avs/loader.c  | 14 ++++----
 3 files changed, 45 insertions(+), 50 deletions(-)

diff --git a/sound/soc/intel/avs/debugfs.c b/sound/soc/intel/avs/debugfs.c
index 701c247227bf..f398ebd68e13 100644
--- a/sound/soc/intel/avs/debugfs.c
+++ b/sound/soc/intel/avs/debugfs.c
@@ -251,24 +251,22 @@ static int strace_release(struct inode *inode, struct file *file)
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
index 98403fc08c14..e6c5035db923 100644
--- a/sound/soc/intel/avs/ipc.c
+++ b/sound/soc/intel/avs/ipc.c
@@ -99,39 +99,39 @@ static void avs_dsp_recovery(struct avs_dev *adev)
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
@@ -338,21 +338,18 @@ static int avs_ipc_wait_busy_completion(struct avs_ipc *ipc, int timeout)
 	}
 
 	/* Ongoing notification's bottom-half may cause early wakeup */
-	spin_lock(&ipc->rx_lock);
-	if (!ipc->rx_completed) {
-		if (repeats_left) {
+	scoped_guard(spinlock, &ipc->rx_lock) {
+		if (!ipc->rx_completed) {
+			if (!repeats_left)
+				return -ETIMEDOUT;
+
 			/* Reply delayed due to notification. */
 			repeats_left--;
 			reinit_completion(&ipc->busy_completion);
-			spin_unlock(&ipc->rx_lock);
 			goto again;
 		}
-
-		spin_unlock(&ipc->rx_lock);
-		return -ETIMEDOUT;
 	}
 
-	spin_unlock(&ipc->rx_lock);
 	return 0;
 }
 
diff --git a/sound/soc/intel/avs/loader.c b/sound/soc/intel/avs/loader.c
index 353e343b1d28..3b158039acb2 100644
--- a/sound/soc/intel/avs/loader.c
+++ b/sound/soc/intel/avs/loader.c
@@ -630,15 +630,15 @@ static int avs_load_firmware(struct avs_dev *adev, bool purge)
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

