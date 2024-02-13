Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE4C1774A
	for <linux-sound@vger.kernel.org>; Tue, 13 Feb 2024 10:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707819197; cv=none; b=Kna1y0Q8QEs8Zc5s5ya+avkZDYvR3CRL1LmInZv0u1/omm3lprZr9eOEGHEMcJ0zqCaR/itvrNu3AQJSOChJq+LR32qs8E4O2fMXl9JHMdGI7sx1VZtHU9GVkq8t8gucHSClqPjtsPejGc9Jh2kzB2FH3EvLq5dwfi89GKtRGfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707819197; c=relaxed/simple;
	bh=Hj08XuYPBgqzIM4Qklm1smDpNSf225cvdVMZE+xpTUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JYsEhp7BmvsZzXDHmiMWzEKV+uQNM5GL2gPjm+tpnAtr0XDgzzbyKdN1tVXYxHcAhU872+j9Hi032+vioj5m8XPeKf4o5QkwIF45aakfNYUWckZehyaDgikI2gG1fpfdJ/mlaYrnvxfE4/G/ippvwyI9QHYSDguyt3zuIjGI01w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jELMHlB6; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jELMHlB6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707819196; x=1739355196;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Hj08XuYPBgqzIM4Qklm1smDpNSf225cvdVMZE+xpTUU=;
  b=jELMHlB6nAus/+LGoJXZY+/LyJ78DxWRNFaITTZAS8zAZHl36f6PIjyP
   1lt+i8kJl8LEL/ljU6w1FzRqSWB1TxYiUN/0cWQ64kCYCqarN6AkPYUzQ
   D9UpBk7mV6Gf49uBPPLNDWBE3YKgE1GiMf9OEWNBv2dsvWnakTzrpNcxE
   qU9CtLrizumWHo6ioq2zpfdPAsdnq5UBoklO5frUz6fLaWP4lqYKoRBZy
   DLIYxCuq0zLKoLaSjv/D4uTwPFNGtWs+bFNaK7HV5WtBVZxlF0SkS9hAG
   nioZPuAsI0MR7xpu61+WV1RRWfnUOfuPZjpX88SnwlK2zMhMPfCjOayfe
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="27260203"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="27260203"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 02:13:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="7498141"
Received: from dcoroian-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.249.42.253])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 02:13:14 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 15/15] ASoC: SOF: Intel: hda-dai: add support for dspless mode beyond HDAudio
Date: Tue, 13 Feb 2024 12:12:47 +0200
Message-ID: <20240213101247.28887-16-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213101247.28887-1-peter.ujfalusi@linux.intel.com>
References: <20240213101247.28887-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

For SoundWire/ALH, we need to have a dai configured, but we don't want
to send a DMA_TLV to firmware. Add additional code branches.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 4bffd9ea21a9..c1682bcdb5a6 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -83,6 +83,11 @@ hda_dai_get_ops(struct snd_pcm_substream *substream, struct snd_soc_dai *cpu_dai
 
 	sdev = widget_to_sdev(w);
 
+	if (!swidget) {
+		dev_err(sdev->dev, "%s: swidget is NULL\n", __func__);
+		return NULL;
+	}
+
 	if (sdev->dspless_mode_selected)
 		return hda_select_dai_widget_ops(sdev, swidget);
 
@@ -364,8 +369,11 @@ static int non_hda_dai_hw_params(struct snd_pcm_substream *substream,
 		return ret;
 	}
 
-	/* get stream_id */
 	sdev = widget_to_sdev(w);
+	if (sdev->dspless_mode_selected)
+		goto skip_tlv;
+
+	/* get stream_id */
 	hext_stream = ops->get_hext_stream(sdev, cpu_dai, substream);
 
 	if (!hext_stream) {
@@ -398,6 +406,7 @@ static int non_hda_dai_hw_params(struct snd_pcm_substream *substream,
 	dma_config->dma_stream_channel_map.device_count = 0; /* mapping not used */
 	dma_config->dma_priv_config_size = 0;
 
+skip_tlv:
 	return 0;
 }
 
-- 
2.43.0

