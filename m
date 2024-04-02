Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969AC12D76A
	for <linux-sound@vger.kernel.org>; Tue,  2 Apr 2024 15:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712071129; cv=none; b=WJ4LXn1X/iFDf39o6vi9yxpAjJNsUHYngaMV7wpbuCBhlBBSGOoAp+pv7G61hiC6Do7n3C2AYvkX001lIiVuirFL26lUst0GuswY0w0h2x0AM/aDd25gc0z5hNYHpvIenJnhknD2Q7UlmozfVdwhqIVNzKzvtpskj2QR0AvN/Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712071129; c=relaxed/simple;
	bh=TIDcl3HkmuBuvfpa50RLwxWaoTu2GNlR2qwiNtVLZyU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WPEbVSuy1bOJ0cuk4FIRZpUfshClx98NKQAWJ0SofKqSb+YNFFjK4qUfX3+ESVsjv9qO5BM4HXycWwZEdCdrCgTf+G1mCbEF7Esx+TRtFjdJsg3mBWvCv6HmlnNCEMGJuZdZh3D7d6GaJze9bNid3Vy9T8jOS4hmwflieot1kZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fn4kSW4N; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fn4kSW4N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712071128; x=1743607128;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TIDcl3HkmuBuvfpa50RLwxWaoTu2GNlR2qwiNtVLZyU=;
  b=fn4kSW4N/jMu+hqHu0xQ/RljLp4G2JZyk8UerGk8W0SrOOUGiNTKZ9Am
   0BtOWAKPEZz2q9OzTBJlffbGjDSdhmUfF2jFTDFpnh3BKkrDCaKSPVdAh
   8O0SVGX8GGpBMphUVwyJ2A9jJCvJapa7FeRCv3NhQIQKKObnEKGextjYw
   65YtpPk1Ty8OrDOvzRnBZwbrJI/Y3vJiDhPEhOZ+2DC7PWQt+fJhqH0P5
   K9HcDKsFALVf91WD2mVo2cjvDnGBBMPUgl+LgLmYudQukIKwC0R3tHZG2
   cToIJroROXA+booFlaT3Xo+FFq9E+ynoHec2ObOA7on/ZyFDN9wmXSG+f
   w==;
X-CSE-ConnectionGUID: oaYz7VT/THescTaCF55c3g==
X-CSE-MsgGUID: UTDJpv7ORZSLKlBbUEUDEQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="29730193"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="29730193"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 08:18:47 -0700
X-CSE-ConnectionGUID: QQ6oZkIIQV2pxSeYN7EJMQ==
X-CSE-MsgGUID: VA6F25PTRz2MyA9bEJNkfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="22796546"
Received: from skhare-mobl5.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.8.83])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 08:18:46 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Subject: [PATCH 15/17] ASoC: SOF: pcm: add pending_stop state variable
Date: Tue,  2 Apr 2024 10:18:26 -0500
Message-Id: <20240402151828.175002-16-pierre-louis.bossart@linux.intel.com>
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

Add a state variable to keep track of delayed stops, in case
pcm_ops->platform_stop_during_hw_free is set.

This patch should be iso-functionality, possibly removing no-op
cases. The main purpose of this new state variable is to prepare a
follow-up patch to reset all PCM and DMAs in case of stop/prepare xrun
sequences.

Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/pcm.c       | 11 +++++++++++
 sound/soc/sof/sof-audio.c |  1 +
 sound/soc/sof/sof-audio.h |  1 +
 3 files changed, 13 insertions(+)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index ed09756f6af6..fbd7e045bcfb 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -276,6 +276,8 @@ static int sof_pcm_trigger(struct snd_soc_component *component,
 	dev_dbg(component->dev, "pcm: trigger stream %d dir %d cmd %d\n",
 		spcm->pcm.pcm_id, substream->stream, cmd);
 
+	spcm->pending_stop[substream->stream] = false;
+
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 		ipc_first = true;
@@ -345,6 +347,15 @@ static int sof_pcm_trigger(struct snd_soc_component *component,
 		/* invoke platform trigger to stop DMA even if pcm_ops isn't set or if it failed */
 		if (!pcm_ops || !pcm_ops->platform_stop_during_hw_free)
 			snd_sof_pcm_platform_trigger(sdev, substream, cmd);
+
+		/*
+		 * set the pending_stop flag to indicate that pipeline stop has been delayed.
+		 * This will be used later to stop the pipelines during prepare when recovering
+		 * from xruns.
+		 */
+		if (pcm_ops && pcm_ops->platform_stop_during_hw_free &&
+		    cmd == SNDRV_PCM_TRIGGER_STOP)
+			spcm->pending_stop[substream->stream] = true;
 		break;
 	default:
 		break;
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index b5ca2861edbd..32fef64ef10d 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -852,6 +852,7 @@ int sof_pcm_stream_free(struct snd_sof_dev *sdev, struct snd_pcm_substream *subs
 		}
 
 		spcm->prepared[substream->stream] = false;
+		spcm->pending_stop[substream->stream] = false;
 	}
 
 	/* reset the DMA */
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 7c08f915b35b..f4134257789e 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -349,6 +349,7 @@ struct snd_sof_pcm {
 	struct list_head list;	/* list in sdev pcm list */
 	struct snd_pcm_hw_params params[2];
 	bool prepared[2]; /* PCM_PARAMS set successfully */
+	bool pending_stop[2]; /* only used if (!pcm_ops->platform_stop_during_hw_free) */
 };
 
 struct snd_sof_led_control {
-- 
2.40.1

