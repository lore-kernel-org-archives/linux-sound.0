Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D993D34B6
	for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 10:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782212279; cv=none; b=DCQLbCZEyLpFhGYrgPl1L4yKTyG8ch9DSFEdqPqLQuBH7/9M9iQXEBT+hOmeodzUsxkM2TknYBeszF8aa3IXceEOTi43l/Jl8J2up51YgzdG5/9/sVDe7t02QloqHmOjAM4CGWBTB0c1qCFyaao/3cnl8SM/2olvHQjvMnym4IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782212279; c=relaxed/simple;
	bh=9MyFcI9cPJOpoQi0eE8Q2rzGHvBU7RxMXpDn6e2gmKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l/9l1lhFou1XOoVjs39i9kHph+UsvcpZd0PHGf+5QceoH/AspDdra4k3DJcANEYmYfG2qIUrn+zD/Xjv1cC/vazUbP9w6v2Y/8f9NOhlYVLOrsraiwRy/Qz7AtlbJDD19fXyDqfNkqT8t15mBAvxAqOMue/4TtePfyXEU9Hp8CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IbfNTp8y; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IbfNTp8y"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8422f395a4aso566914b3a.0
        for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 03:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782212277; x=1782817077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ZitVKxhTy9Co03Ms8Z3kq8u0mcxCfig6tF6agXpmC0=;
        b=IbfNTp8ydJDNyWIi6cpdmff8+OgLtaYxuBMjD/SF62Ff3kj+7UJHibpbXUsVDkEWXG
         mohIwkvzqxDNH45XeABiaxVLXVjBmCnCglgBkPls2T3g+KoenPDuLJNR+B/VSn/4hlAL
         8hlUodPmOpzanq0aEjO/DiUF1LM7THF74wmevm1Yt0a+Tk1DetXLnaVjwZYd2fE9/3LH
         VngbrCQPWzIy+uJC8Bl/qm+ftb2CtE8ZEDMuPAAWzn/5TKv2PfNsOn+8eup5tVmDh7ZI
         NDLeB9EIeS+3fDOzQ7rpZrF1tBBs15YaLBW7Z2lPd93tU4jkz8dGqtfGF0Ct8pTAlVIo
         buYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782212277; x=1782817077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4ZitVKxhTy9Co03Ms8Z3kq8u0mcxCfig6tF6agXpmC0=;
        b=BZ598heEBCHU+n2TnFeeELuxag4Fbm3jMpWaFlAHhfcSvle0W4ypzdBJAM2/bDDrgx
         EaQoEjc3P6R5syFnuNLH4qYAGEu1lCVQm0EeVe2Axtg800/gSEJq3v5/HMfbnc1GarbL
         pjNXT+rb7ELuLZR8Urf5+s8bGUz4TkL1vI79fA8hjV4cG1XODSlM6HzOuQRA2zsQaQks
         1UXfKytrdTVLgX1VJuqaDhE1bYQQ4j8snwfIOBxsAxZN2UpV+2w8S8+Nm3UAoeU4Rpcn
         oh/rXa6xi2R4p1l6l1EVT2G8DblYbNbm3vxu/kZz4kzfESD6O0Atmah3dSEzxoXpgack
         vxBg==
X-Forwarded-Encrypted: i=1; AHgh+RpCuTUF61qpF+WlDu+kHBpdr1Y1eL/zHyUDR9dyp12ArZJ820HcYEaI8sCE9JtA/hV7x76M8Kq5qVrCyw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9FrSDGfG9CCiYtwAwMIcuZwDTqxgiKmj7QZErOz/RBa0O9EWA
	LaivXgG+5DUgxFtWxoVwT5Amu4vKmYV50QYABMR+UuQ/itNh2bZ12Mbg
X-Gm-Gg: AfdE7cnTFjQzPbTx/WsKnLowhHcregz4ba4KhcosHTE7j4k5C85vhOBYHLW72kf8Dww
	D90v5dDjJrMIg2j8OfduGweepgRozk8ObTYgfNTj4JaySiqMWydAiG8DmhvJaIUsqNP8CNmZDmF
	SUGNWXUaP9kH8X52foBcrRshVfWP2v3wwIUzF2RL/pXprphv2Gcx+44SpOxqNBW60hLI/3iYej4
	IzDHHsFnwmvUDTg2uQiPGvL+j4a3yaSauty0h07gePFTx2UcNjbxy2hLVtFN4KiLkyvZSmvzNip
	CUHFdiIgI/Dtisl/b9oTS1FlbWLfGcgnVgns9J4TVvUKapSWOA3dTIcyC7Hm/BqflGxXJ7esBWD
	IJBOnW/JtVC3XzoHcL13iD99dJ2Uimq/V74wkJIr4r0aE1HAqw3jGfSZXCAMciEt+uwyVr1+81m
	+0fPMA92Pv735hAsfz8cYDg2BFKyxEP9amggceuSsaYeUMt/4=
X-Received: by 2002:a05:6a00:94d6:b0:842:5bc8:ccf7 with SMTP id d2e1a72fcca58-84591d1f3aamr2788064b3a.34.1782212277578;
        Tue, 23 Jun 2026 03:57:57 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564d68130sm12343868b3a.10.2026.06.23.03.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 03:57:57 -0700 (PDT)
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
Subject: [PATCH v3 3/5] ASoC: Intel: avs: Use scoped_guard() for scoped locking
Date: Tue, 23 Jun 2026 17:57:19 +0700
Message-ID: <20260623105721.25865-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260623105721.25865-1-phucduc.bui@gmail.com>
References: <20260623105721.25865-1-phucduc.bui@gmail.com>
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

 sound/soc/intel/avs/debugfs.c | 18 ++++++-------
 sound/soc/intel/avs/ipc.c     | 50 +++++++++++++++++------------------
 sound/soc/intel/avs/loader.c  | 14 +++++-----
 3 files changed, 40 insertions(+), 42 deletions(-)

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
index 98403fc08c14..26c02dc4520f 100644
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

