Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19EB206E91
	for <linux-sound@vger.kernel.org>; Wed, 16 Oct 2024 13:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729083706; cv=none; b=UAW664QJIG0MUASTYEYFNuaBy1LSdq06fe5TUNfX5zNacMlDBUu4sndk06KuVnK4BWqVEXJY0RiHzCJfDsZRnRI7jVZACit0aH3f4XzSroUC/KXjNF2ZhKpDzjqRZaoyG64ipysEgDcvyAmhDM1mTyODv8j/eE9zhHFjq9tyTmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729083706; c=relaxed/simple;
	bh=YTucvGuqGqjSae/gXpF94kINnM6erhOXr9w7b7IsIu4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=azH6ANnxJoXdhWZ9KpCsNv+lt/prY6LoAXXxtrNROatXpfKxXmAVtaZUputOnaTysjgqTbzjoMfWu7BaXgbx/gyBIfObYygupsWzjSsutHzlq2bWeJs8mWmZVzi8cA08MA0odwvR9Yv2lS/rYk/FtZVU8hPJEabjyTli7qCl0I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bZcdLKqq; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bZcdLKqq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729083705; x=1760619705;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YTucvGuqGqjSae/gXpF94kINnM6erhOXr9w7b7IsIu4=;
  b=bZcdLKqq7ybrB4OW8z/2C7lFKmtU3TXBeupX81NZZIqn4a0+YB+ng/72
   HGX7kLA3IdXDBpc+lSz6EGbiZno2VPmfFKBzTh7ym2DLYZIIQ1nTFn6ZU
   pBMKgNbTaV+DIQfLpdwP++mvN8ARXksZT99kIIsH+Q4k+d6782UqN0ztW
   MVzkfuh9fTOTOQVRjVHc5JtlN7b/UPMHmWp76pVM05v6AYAnR3vMDnHEW
   gpmkEfVpKPcYsgQe8pe+rE8CG16dZ58NELgvsCEP1mNN0JA/P0mJ3BOwZ
   IEldNBSqgFlgLOT+mDsCcwkG4s5iRVxYbIwdfSWo03dRlmGu5bMrWpYzl
   g==;
X-CSE-ConnectionGUID: 1xiPZTvESLuQpor1FOTtGg==
X-CSE-MsgGUID: EvODLzklQ+OVOPMFG9ERIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="32450315"
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; 
   d="scan'208";a="32450315"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 06:01:45 -0700
X-CSE-ConnectionGUID: QWvBA436SratdYa1OROiGA==
X-CSE-MsgGUID: BmkSvju7T8O/2fWPDECi3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; 
   d="scan'208";a="78566118"
Received: from dev2.igk.intel.com ([10.237.148.94])
  by fmviesa010.fm.intel.com with ESMTP; 16 Oct 2024 06:01:43 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [RFC PATCH 2/4] ALSA: core: Allow polling for detection
Date: Wed, 16 Oct 2024 15:02:26 +0200
Message-Id: <20241016130228.1013227-3-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241016130228.1013227-1-amadeuszx.slawinski@linux.intel.com>
References: <20241016130228.1013227-1-amadeuszx.slawinski@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In order for userspace to wait for detection event to happen, there
needs to be possibility to wait in some way. Add API allowing to poll
for event when stream is in detection state.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 include/sound/pcm.h     |  4 ++++
 sound/core/pcm_native.c | 12 ++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index f06ef7c718733..28df5bc5c131c 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -448,6 +448,9 @@ struct snd_pcm_runtime {
 	struct snd_pcm_audio_tstamp_report audio_tstamp_report;
 	struct timespec64 driver_tstamp;
 
+	/* -- detection -- */
+	unsigned int detected:1;	/* detection was triggered */
+
 #if IS_ENABLED(CONFIG_SND_PCM_OSS)
 	/* -- OSS things -- */
 	struct snd_pcm_oss_runtime oss;
@@ -592,6 +595,7 @@ int snd_pcm_start(struct snd_pcm_substream *substream);
 int snd_pcm_stop(struct snd_pcm_substream *substream, snd_pcm_state_t status);
 int snd_pcm_drain_done(struct snd_pcm_substream *substream);
 int snd_pcm_stop_xrun(struct snd_pcm_substream *substream);
+void snd_pcm_detected(struct snd_pcm_substream *substream);
 #ifdef CONFIG_PM
 int snd_pcm_suspend_all(struct snd_pcm *pcm);
 #else
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 4fe1d2f41149c..c024eb0ed74ff 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -3662,6 +3662,14 @@ static ssize_t snd_pcm_writev(struct kiocb *iocb, struct iov_iter *from)
 	return result;
 }
 
+void snd_pcm_detected(struct snd_pcm_substream *substream)
+{
+	substream->runtime->detected = 1;
+
+	wake_up(&substream->runtime->sleep);
+}
+EXPORT_SYMBOL_GPL(snd_pcm_detected);
+
 static __poll_t snd_pcm_poll(struct file *file, poll_table *wait)
 {
 	struct snd_pcm_file *pcm_file;
@@ -3690,6 +3698,10 @@ static __poll_t snd_pcm_poll(struct file *file, poll_table *wait)
 	guard(pcm_stream_lock_irq)(substream);
 	avail = snd_pcm_avail(substream);
 	switch (runtime->state) {
+	case SNDRV_PCM_STATE_DETECTING:
+		if (runtime->detected)
+			mask = ok;
+		break;
 	case SNDRV_PCM_STATE_RUNNING:
 	case SNDRV_PCM_STATE_PREPARED:
 	case SNDRV_PCM_STATE_PAUSED:
-- 
2.34.1

