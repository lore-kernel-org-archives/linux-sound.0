Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BA522F0A
	for <linux-sound@vger.kernel.org>; Tue, 13 Feb 2024 10:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707819168; cv=none; b=tVhAIbTnF2Hegd//RLAJ10nkMz9aMLLjPTgdqdwO7xv8aJjvAYN6YDdMcNXcpBNkUFlaZeuaJFO8NFVC84hyvNjaW9eugeH04kkG/TT4bP7pXYjVnnt1NAnmyIEMPCUDTHGc/F1m93mXqqqEOQD8ysvj/56GQ//HcY8HWXHpUzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707819168; c=relaxed/simple;
	bh=BT13nTaSKLZPkPXA4uhleotdp00zgwfDkpHDpxIwY9k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JBdIbk7CXy1B2XxOtw5SE+wn9wUr2g4ZVieZXZwnr4aucd+AwzchDCt3PbMk7Ed1My1PZwALBOf81Mz8fyvNbiPWxG63kRini4Zt/qEyKI8bhWCEc50EL1KmvnsHXJ30NLXw9Rb3+AEkNCIWGc+aU9OS5JrpfuoycQVict73Nb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gb1w6J+D; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gb1w6J+D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707819167; x=1739355167;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BT13nTaSKLZPkPXA4uhleotdp00zgwfDkpHDpxIwY9k=;
  b=Gb1w6J+DjDokwkMW+4HDVrVvb9/SZwf/UpqqXGRzTsvuiOtghqxkzkq4
   ZL8wlmEuFUsFocgbt3G22rLZZvdyFdJnw7U9rpHQlCujl1Ag8PLc20wbI
   7QAo4M8mjyG2Dw5Bh2TAhlKv2fBLFwxKRBgzLI9Foh1FgEo3dU2oq4b7Q
   sbkuI7BH4lxc6C4x5nWtDdhltsrh+i8qMCDUbY45hxArhOyOIn7wr61Au
   GqvSAkZmiLaFw3UPJe1R8i+utXzsBEv1yNpdu3DTcQc+xu+/hmkhYWySv
   dF5RL3LyPUnzVkjWmrPZZpoyLnl7ssBj4vFBNd3BRBvNWN79sooWj6JNe
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="27260157"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="27260157"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 02:12:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="7498018"
Received: from dcoroian-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.249.42.253])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 02:12:44 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 03/15] ASoC: SOF: Intel: hda: add 'is_chain_dma_supported' callback
Date: Tue, 13 Feb 2024 12:12:35 +0200
Message-ID: <20240213101247.28887-4-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213101247.28887-1-peter.ujfalusi@linux.intel.com>
References: <20240213101247.28887-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Reuse existing function to get the interface mask and expose it to the
SOF core with a callback - the main user is the IPC4 topology so only
HDaudio platforms provide this callback.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-common-ops.c |  1 +
 sound/soc/sof/intel/hda.c            | 63 ++++++++++++++++++++++------
 sound/soc/sof/intel/hda.h            |  5 +++
 sound/soc/sof/sof-priv.h             |  7 ++++
 4 files changed, 64 insertions(+), 12 deletions(-)

diff --git a/sound/soc/sof/intel/hda-common-ops.c b/sound/soc/sof/intel/hda-common-ops.c
index 26105d8f1bdc..2b385cddc385 100644
--- a/sound/soc/sof/intel/hda-common-ops.c
+++ b/sound/soc/sof/intel/hda-common-ops.c
@@ -83,6 +83,7 @@ struct snd_sof_dsp_ops sof_hda_common_ops = {
 	/* DAI drivers */
 	.drv		= skl_dai,
 	.num_drv	= SOF_SKL_NUM_DAIS,
+	.is_chain_dma_supported	= hda_is_chain_dma_supported,
 
 	/* PM */
 	.suspend		= hda_dsp_suspend,
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index fe4ae349dad5..0bae439feb8b 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -46,44 +46,83 @@
 #define EXCEPT_MAX_HDR_SIZE	0x400
 #define HDA_EXT_ROM_STATUS_SIZE 8
 
-static u32 hda_get_interface_mask(struct snd_sof_dev *sdev)
+static void hda_get_interfaces(struct snd_sof_dev *sdev, u32 *interface_mask)
 {
 	const struct sof_intel_dsp_desc *chip;
-	u32 interface_mask[2] = { 0 };
 
 	chip = get_chip_info(sdev->pdata);
 	switch (chip->hw_ip_version) {
 	case SOF_INTEL_TANGIER:
 	case SOF_INTEL_BAYTRAIL:
 	case SOF_INTEL_BROADWELL:
-		interface_mask[0] =  BIT(SOF_DAI_INTEL_SSP);
+		interface_mask[SOF_DAI_DSP_ACCESS] =  BIT(SOF_DAI_INTEL_SSP);
 		break;
 	case SOF_INTEL_CAVS_1_5:
 	case SOF_INTEL_CAVS_1_5_PLUS:
-		interface_mask[0] = BIT(SOF_DAI_INTEL_SSP) | BIT(SOF_DAI_INTEL_DMIC) |
-				    BIT(SOF_DAI_INTEL_HDA);
-		interface_mask[1] = BIT(SOF_DAI_INTEL_HDA);
+		interface_mask[SOF_DAI_DSP_ACCESS] =
+			BIT(SOF_DAI_INTEL_SSP) | BIT(SOF_DAI_INTEL_DMIC) | BIT(SOF_DAI_INTEL_HDA);
+		interface_mask[SOF_DAI_HOST_ACCESS] = BIT(SOF_DAI_INTEL_HDA);
 		break;
 	case SOF_INTEL_CAVS_1_8:
 	case SOF_INTEL_CAVS_2_0:
 	case SOF_INTEL_CAVS_2_5:
 	case SOF_INTEL_ACE_1_0:
-		interface_mask[0] = BIT(SOF_DAI_INTEL_SSP) | BIT(SOF_DAI_INTEL_DMIC) |
-				    BIT(SOF_DAI_INTEL_HDA) | BIT(SOF_DAI_INTEL_ALH);
-		interface_mask[1] = BIT(SOF_DAI_INTEL_HDA);
+		interface_mask[SOF_DAI_DSP_ACCESS] =
+			BIT(SOF_DAI_INTEL_SSP) | BIT(SOF_DAI_INTEL_DMIC) |
+			BIT(SOF_DAI_INTEL_HDA) | BIT(SOF_DAI_INTEL_ALH);
+		interface_mask[SOF_DAI_HOST_ACCESS] = BIT(SOF_DAI_INTEL_HDA);
 		break;
 	case SOF_INTEL_ACE_2_0:
-		interface_mask[0] = BIT(SOF_DAI_INTEL_SSP) | BIT(SOF_DAI_INTEL_DMIC) |
-				    BIT(SOF_DAI_INTEL_HDA) | BIT(SOF_DAI_INTEL_ALH);
-		interface_mask[1] = interface_mask[0]; /* all interfaces accessible without DSP */
+		interface_mask[SOF_DAI_DSP_ACCESS] =
+			BIT(SOF_DAI_INTEL_SSP) | BIT(SOF_DAI_INTEL_DMIC) |
+			BIT(SOF_DAI_INTEL_HDA) | BIT(SOF_DAI_INTEL_ALH);
+		 /* all interfaces accessible without DSP */
+		interface_mask[SOF_DAI_HOST_ACCESS] =
+			interface_mask[SOF_DAI_DSP_ACCESS];
 		break;
 	default:
 		break;
 	}
+}
+
+static u32 hda_get_interface_mask(struct snd_sof_dev *sdev)
+{
+	u32 interface_mask[SOF_DAI_ACCESS_NUM] = { 0 };
+
+	hda_get_interfaces(sdev, interface_mask);
 
 	return interface_mask[sdev->dspless_mode_selected];
 }
 
+bool hda_is_chain_dma_supported(struct snd_sof_dev *sdev, u32 dai_type)
+{
+	u32 interface_mask[SOF_DAI_ACCESS_NUM] = { 0 };
+	const struct sof_intel_dsp_desc *chip;
+
+	if (sdev->dspless_mode_selected)
+		return false;
+
+	hda_get_interfaces(sdev, interface_mask);
+
+	if (!(interface_mask[SOF_DAI_DSP_ACCESS] & BIT(dai_type)))
+		return false;
+
+	if (dai_type == SOF_DAI_INTEL_HDA)
+		return true;
+
+	switch (dai_type) {
+	case SOF_DAI_INTEL_SSP:
+	case SOF_DAI_INTEL_DMIC:
+	case SOF_DAI_INTEL_ALH:
+		chip = get_chip_info(sdev->pdata);
+		if (chip->hw_ip_version < SOF_INTEL_ACE_2_0)
+			return false;
+		return true;
+	default:
+		return false;
+	}
+}
+
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE)
 
 /*
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 1592e27bc14d..b36eb7c78913 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -573,6 +573,11 @@ struct sof_intel_hda_stream {
 
 #define SOF_STREAM_SD_OFFSET_CRST 0x1
 
+/*
+ * DAI support
+ */
+bool hda_is_chain_dma_supported(struct snd_sof_dev *sdev, u32 dai_type);
+
 /*
  * DSP Core services.
  */
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 6c163c008607..5e5c5a36c3c9 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -157,6 +157,13 @@ struct sof_firmware {
 	u32 payload_offset;
 };
 
+enum sof_dai_access {
+	SOF_DAI_DSP_ACCESS,	/* access from DSP only */
+	SOF_DAI_HOST_ACCESS,	/* access from host only */
+
+	SOF_DAI_ACCESS_NUM
+};
+
 /*
  * SOF DSP HW abstraction operations.
  * Used to abstract DSP HW architecture and any IO busses between host CPU
-- 
2.43.0

