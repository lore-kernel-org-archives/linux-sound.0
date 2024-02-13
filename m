Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE61249F5
	for <linux-sound@vger.kernel.org>; Tue, 13 Feb 2024 10:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707819192; cv=none; b=REpUy0RABPzBObn+2INrzwin/HVjKckbAtH8k7Wpv3mTzIlgvUSW4uZsfrWr9CTHZeg5Bi5EqG2HC25+CZCArM4jJ0zZ5wyFowIbqybXTPRpSPfh6XWNFHHB2uDWaaB4DT/BvOxmuVSwzYcuz8qj4iWHoLrlFmB3Rptcgthm+RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707819192; c=relaxed/simple;
	bh=nfyNmZ2e9yJFpU+DzOzQj8HEg52qMk/gZX4H03RrKEs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O0Gw+Z29XG20gI0xUxOcYHZzx+PtuXqjbS1CZc6RsrnXg6N3gPvDdWUxxkA1jT/PzpslGs4Fd08YmwJYQQLMYvhRldfBv23f1q5hNqQPrqGfhCfCkyz6+Iwqta1BaePpbcWHarFtsBmmyngpbAQVMGxOd8AUXbZBSBe/n9wRHk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aKfjspDB; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aKfjspDB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707819191; x=1739355191;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nfyNmZ2e9yJFpU+DzOzQj8HEg52qMk/gZX4H03RrKEs=;
  b=aKfjspDBIBND+BrWOmsDpJfMKWp1u627vcFe4fDE6zRtWLD/koGynZ1i
   ZKRjF4ybzEex9fyHMi4yvU2ziqcX6OHzTSNqyND4jMhbyJ8Lq2tsfPpB8
   sb0C56yiToEV9TX2a+0Y31TN6NQUwsZsZaCNFIMTfZH3ApmA6srzlvN2o
   ASETWNuRgxL4QVfgxjJXrU/HvC78O4Ak+25WtwdaVBWQgTX4eZaylyvRN
   9cHZLJeet6yUlgqNPNgaz9LcDP+dEjdnX1iaLbmLnRrXJUiwjx3PPP1OR
   U9qrm366U6khmBDUzPzI9lMBch0ujCRT8rTT7xFot2nT7jY40zxJICf5F
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="27260194"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="27260194"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 02:13:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="7498117"
Received: from dcoroian-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.249.42.253])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 02:13:09 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 13/15] ASoC: SOF: Intel: hda-dai-ops: add SoundWire dspless mode
Date: Tue, 13 Feb 2024 12:12:45 +0200
Message-ID: <20240213101247.28887-14-peter.ujfalusi@linux.intel.com>
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

This mode is only supported starting with LunarLake (ACE_2_0).

DMIC and SSP remain supported with the DSP only for now, since they
need a DAI configuration that is provided to firmware.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai-ops.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai-ops.c b/sound/soc/sof/intel/hda-dai-ops.c
index 5a5ef93858be..c50ca9e72d37 100644
--- a/sound/soc/sof/intel/hda-dai-ops.c
+++ b/sound/soc/sof/intel/hda-dai-ops.c
@@ -607,6 +607,13 @@ static const struct hda_dai_widget_dma_ops hda_dspless_dma_ops = {
 	.get_hlink = hda_get_hlink,
 };
 
+static const struct hda_dai_widget_dma_ops sdw_dspless_dma_ops = {
+	.get_hext_stream = hda_dspless_get_hext_stream,
+	.setup_hext_stream = hda_dspless_setup_hext_stream,
+	.calc_stream_format = generic_calc_stream_format,
+	.get_hlink = sdw_get_hlink,
+};
+
 #endif
 
 const struct hda_dai_widget_dma_ops *
@@ -614,12 +621,24 @@ hda_select_dai_widget_ops(struct snd_sof_dev *sdev, struct snd_sof_widget *swidg
 {
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_LINK)
 	struct snd_sof_dai *sdai;
+	const struct sof_intel_dsp_desc *chip;
 
-	if (sdev->dspless_mode_selected)
-		return &hda_dspless_dma_ops;
-
+	chip = get_chip_info(sdev->pdata);
 	sdai = swidget->private;
 
+	if (sdev->dspless_mode_selected) {
+		switch (sdai->type) {
+		case SOF_DAI_INTEL_HDA:
+			return &hda_dspless_dma_ops;
+		case SOF_DAI_INTEL_ALH:
+			if (chip->hw_ip_version < SOF_INTEL_ACE_2_0)
+				return NULL;
+			return &sdw_dspless_dma_ops;
+		default:
+			return NULL;
+		}
+	}
+
 	switch (sdev->pdata->ipc_type) {
 	case SOF_IPC_TYPE_3:
 	{
@@ -633,9 +652,6 @@ hda_select_dai_widget_ops(struct snd_sof_dev *sdev, struct snd_sof_widget *swidg
 	{
 		struct snd_sof_widget *pipe_widget = swidget->spipe->pipe_widget;
 		struct sof_ipc4_pipeline *pipeline = pipe_widget->private;
-		const struct sof_intel_dsp_desc *chip;
-
-		chip = get_chip_info(sdev->pdata);
 
 		switch (sdai->type) {
 		case SOF_DAI_INTEL_HDA:
-- 
2.43.0

