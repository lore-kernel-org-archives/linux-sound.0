Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E171E12DD98
	for <linux-sound@vger.kernel.org>; Tue,  2 Apr 2024 15:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712071120; cv=none; b=JAjqTDvWrPfvZ5nYZQsxW4HHumTZoNOM5PJ1G4VAgpADTWa7mFCFFQBkwav62JAcFb2ya5DG0fqdEMqllFjdih9z9UuHPWWN1fQX58afcOaTlW3iOIsSW8/CciEyjvWgOSpKYaK/5GYdZIP4EexrI90hM8yYH5+a7Xv+CJb32PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712071120; c=relaxed/simple;
	bh=HoaNNXuPU7N8X9DQGEvbTrS2CyF30mmJSOl1g25k9ZE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=N5uKQpv65xTxzurYH45pM0UipQl4MP7jsUmdhdAflJIkB8T5hAzRtuxhDvNS4cOvRovU2BKlqefK3ZuTBQEt0H4vt9P/M/Jyu5MOz1UZNTbY/D4ju2snm436S4rQOtzS7P/CYcjDMo5keV6/wrGwgnZKtd+mHdEvxKnJnjwApCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K4xNji/V; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K4xNji/V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712071119; x=1743607119;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HoaNNXuPU7N8X9DQGEvbTrS2CyF30mmJSOl1g25k9ZE=;
  b=K4xNji/VCrxo3iItxcWK8c3886tirE7rxWYoZdSn2qqfaNmaeCf8i43R
   tKgaaCiGxHux70lpA8O+/crIzjOLlrYib0WcxzMIH3PxEp4lJiOL8E8uh
   eF/U2lUgrH1huDSVOVXWNeufkRVpFBcmsdy5JdRMfqdsn0p2MmKXkXnDC
   ojM9WvAhHsWLCTumqHWvu7S2Gc4pk0GCs1uIm58Bws7x/WFXtjB/wwuuN
   hERv7g+kYsDMAlBGmuAZEsarqlu0eqP2SDY+2YO1PjGISQL6cvOljjrO7
   AHW1ZtNsfJXfTbqzaxUc81h/xRw7UpR4OoEUAl3Nu83sInXUFVuB76L++
   A==;
X-CSE-ConnectionGUID: 4IoHQ24PRByIS8mOWjleYw==
X-CSE-MsgGUID: wfMT+nBaSDafN5Jc7nXwMg==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="29729916"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="29729916"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 08:18:37 -0700
X-CSE-ConnectionGUID: LEG2b/CGR1WJ65vD/Rm2CQ==
X-CSE-MsgGUID: EIodZmpMQ2KWwH3IRWMnyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="22796488"
Received: from skhare-mobl5.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.8.83])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 08:18:36 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 02/17] Revert "ASoC: SOF: Intel: hda-dai-ops: reset device count for SoundWire DAIs"
Date: Tue,  2 Apr 2024 10:18:13 -0500
Message-Id: <20240402151828.175002-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240402151828.175002-1-pierre-louis.bossart@linux.intel.com>
References: <20240402151828.175002-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bard Liao <yung-chuan.liao@linux.intel.com>

This reverts commit 699e146d9ebf42ee2a5d4e4e28f7a49c4aef0105.
Don't reset device_count as we will use the multi-gateway firmware
configuration.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai-ops.c | 24 +-----------------------
 1 file changed, 1 insertion(+), 23 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai-ops.c b/sound/soc/sof/intel/hda-dai-ops.c
index b073720b4cf4..e17b83575e84 100644
--- a/sound/soc/sof/intel/hda-dai-ops.c
+++ b/sound/soc/sof/intel/hda-dai-ops.c
@@ -446,28 +446,6 @@ static int hda_ipc4_post_trigger(struct snd_sof_dev *sdev, struct snd_soc_dai *c
 	return ret;
 }
 
-static struct hdac_ext_stream *sdw_hda_ipc4_get_hext_stream(struct snd_sof_dev *sdev,
-							    struct snd_soc_dai *cpu_dai,
-							    struct snd_pcm_substream *substream)
-{
-	struct snd_soc_dapm_widget *w = snd_soc_dai_get_widget(cpu_dai, substream->stream);
-	struct snd_sof_widget *swidget = w->dobj.private;
-	struct snd_sof_dai *dai = swidget->private;
-	struct sof_ipc4_copier *ipc4_copier = dai->private;
-	struct sof_ipc4_alh_configuration_blob *blob;
-
-	blob = (struct sof_ipc4_alh_configuration_blob *)ipc4_copier->copier_config;
-
-	/*
-	 * Starting with ACE_2_0, re-setting the device_count is mandatory to avoid using
-	 * the multi-gateway firmware configuration. The DMA hardware can take care of
-	 * multiple links without needing any firmware assistance
-	 */
-	blob->alh_cfg.device_count = 1;
-
-	return hda_ipc4_get_hext_stream(sdev, cpu_dai, substream);
-}
-
 static const struct hda_dai_widget_dma_ops hda_ipc4_dma_ops = {
 	.get_hext_stream = hda_ipc4_get_hext_stream,
 	.assign_hext_stream = hda_assign_hext_stream,
@@ -509,7 +487,7 @@ static const struct hda_dai_widget_dma_ops dmic_ipc4_dma_ops = {
 };
 
 static const struct hda_dai_widget_dma_ops sdw_ipc4_dma_ops = {
-	.get_hext_stream = sdw_hda_ipc4_get_hext_stream,
+	.get_hext_stream = hda_ipc4_get_hext_stream,
 	.assign_hext_stream = hda_assign_hext_stream,
 	.release_hext_stream = hda_release_hext_stream,
 	.setup_hext_stream = hda_setup_hext_stream,
-- 
2.40.1

