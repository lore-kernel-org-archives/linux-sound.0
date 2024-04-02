Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF28131742
	for <linux-sound@vger.kernel.org>; Tue,  2 Apr 2024 15:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712071128; cv=none; b=UnRqjW6A4JZ2RlX1so0w7DOs0mMSwcrBdLHQ4uBW9ttTBhwIx0L2mqOFvQbPm2iX3Xwc50zkHR/rGWilVf1DvjDhZBd0hIRPyfLVFDYar0XeFsd0UyEWygC9XhGE/f4wSmkIb7H4zAlTWd5UkeBBjWpVy/9lcaWDNIuAeKLScAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712071128; c=relaxed/simple;
	bh=pvf02amI0FeM/33GrNU+1kEDh57vg/K+58jbwJAR05Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m11dRCplUvF6nefydtkc+vqhkg4fd68PJefMmM8CtcVmdGBK0VTHKH4zVbLuWY2Z8lvG2fEB7zYKsAXPMUsDz5wiI9LWrbIuTJ8lz8qsz/OQ07sjlSebQ6Lnkq0+uZWMsSvkZwPRbJSaH4xwyIZPrzX2d4zwPB9FwWUKAp8PEs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lK6/3o+/; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lK6/3o+/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712071127; x=1743607127;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pvf02amI0FeM/33GrNU+1kEDh57vg/K+58jbwJAR05Y=;
  b=lK6/3o+/9ptNRVnNqYPKd0AU66EWCM/s7FAi4FEszp2idebShubuF487
   NSmucwq0R77HD0kR78mQCtXnJhnmBOpH/fuYif94VZvQnFmXwzIJzsj4N
   J1swB86Ev9RsRTG4rUrrgKxrun2yjjKMaCpFPV+piwWFxMvP50eWzDvTv
   8t5F7gnqZUaqTmswl7OdS/WU/iyPKGgkXC8lJtbJp5OwpDlySgbd1XDB7
   JSqeMeA29lXvsFDpdGHVkr7oZXfD2mi/Fb9Ev1NZhNkKQaoFN34z8kyAo
   jgnras0h+r0lN4yk7O94w1GVmcsI0/YL48LUTYaXjsVn5j9+uBivUtmQL
   Q==;
X-CSE-ConnectionGUID: HR51IJjCTCy//5x+9dfQwQ==
X-CSE-MsgGUID: ed8Q+X49QY2Rum96pofDeQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="29730168"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="29730168"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 08:18:46 -0700
X-CSE-ConnectionGUID: Pcloce0iSZ+u39QEAIwUsA==
X-CSE-MsgGUID: WUHTcC+aTemVfzQeUhjQTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="22796541"
Received: from skhare-mobl5.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.8.83])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 08:18:45 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Subject: [PATCH 14/17] ASoC: SOF: pcm: simplify sof_pcm_hw_free() with helper
Date: Tue,  2 Apr 2024 10:18:25 -0500
Message-Id: <20240402151828.175002-15-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240402151828.175002-1-pierre-louis.bossart@linux.intel.com>
References: <20240402151828.175002-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The same sequence is used twice, use common helper.

Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/pcm.c | 32 +++-----------------------------
 1 file changed, 3 insertions(+), 29 deletions(-)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index f03cee94bce6..ed09756f6af6 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -196,9 +196,8 @@ static int sof_pcm_hw_free(struct snd_soc_component *component,
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
-	const struct sof_ipc_pcm_ops *pcm_ops = sof_ipc_get_ops(sdev, pcm);
 	struct snd_sof_pcm *spcm;
-	int ret, err = 0;
+	int ret;
 
 	/* nothing to do for BE */
 	if (rtd->dai_link->no_pcm)
@@ -211,36 +210,11 @@ static int sof_pcm_hw_free(struct snd_soc_component *component,
 	dev_dbg(component->dev, "pcm: free stream %d dir %d\n",
 		spcm->pcm.pcm_id, substream->stream);
 
-	if (spcm->prepared[substream->stream]) {
-		/* stop DMA first if needed */
-		if (pcm_ops && pcm_ops->platform_stop_during_hw_free)
-			snd_sof_pcm_platform_trigger(sdev, substream, SNDRV_PCM_TRIGGER_STOP);
-
-		/* free PCM in the DSP */
-		if (pcm_ops && pcm_ops->hw_free) {
-			ret = pcm_ops->hw_free(component, substream);
-			if (ret < 0)
-				err = ret;
-		}
-
-		spcm->prepared[substream->stream] = false;
-	}
-
-	/* reset DMA */
-	ret = snd_sof_pcm_platform_hw_free(sdev, substream);
-	if (ret < 0) {
-		dev_err(component->dev, "error: platform hw free failed\n");
-		err = ret;
-	}
-
-	/* free the DAPM widget list */
-	ret = sof_widget_list_free(sdev, spcm, substream->stream);
-	if (ret < 0)
-		err = ret;
+	ret = sof_pcm_stream_free(sdev, substream, spcm, substream->stream, true);
 
 	cancel_work_sync(&spcm->stream[substream->stream].period_elapsed_work);
 
-	return err;
+	return ret;
 }
 
 static int sof_pcm_prepare(struct snd_soc_component *component,
-- 
2.40.1

