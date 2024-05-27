Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183411607B2
	for <linux-sound@vger.kernel.org>; Mon, 27 May 2024 19:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716838583; cv=none; b=RiQhg1wPQC2GmnYI5QfxW/UIDLwVUiXN+DFIyboTaJOQqLHhmERiHseGMLH8/eLuBx3TXyklW2xUhgJmMBQPDCccLzxUtTwlx6jrhbfXZyIzzGmLIonWB9oxVT690w32++NBNKJysxotM+hzL9SrQXAygwxGhCEf+zMRj6Gwbbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716838583; c=relaxed/simple;
	bh=U3Rbt/6smxjRheL/77eROvvMmUYTv45AaEcSrIsRTY0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=umYzRSqs+CO/lWS82yr1WqPGAFCrQPI7DSPAW49zJJtIJhwRedzMre+VTdgyqrE7MJ3gyUCRRsnL4QGsnlcshf1EK2KePZF65Y2kMr0ZrzAis18pJH8Z6Zawf7jXN+8YwZ9zhVMZHQZ3XYQUcSCzBemLWoI0DVOuyiD85/eJHjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HRjQOw4m; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HRjQOw4m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716838582; x=1748374582;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=U3Rbt/6smxjRheL/77eROvvMmUYTv45AaEcSrIsRTY0=;
  b=HRjQOw4mjFqwcpevKWJYfciKFIEjInZqoWsOfreaNDPoJCSG2BzmrGxd
   ANw9QhoNv/vA5WwBdAfqvcUy8/7rxoi7UPkA0uDeVECpMvULjVM4Ng0Mo
   XnsBS8cFv/k2Jw91qsfh3V0xL5Sx+jQDpP+aPgV5CiG8BOaRiKiVgA99P
   4yaqRFSBsmb85GEZh3GWQOYvSzPnxcavdUL4DUxWmPc7AWlzOikeAlKoe
   Ki5osbUeJGY9egecZUzVTfU+bhGCgHKyh0dowe1XUkmm8qbQh9aFFq9eE
   1HEhFtH5+Y4X1pgjkqDknQdKRWnPIVWq+jEigwe9VYMiMmcfVxe3G+u9m
   Q==;
X-CSE-ConnectionGUID: QLU+iGZuQ4CIdUxDMqb2pQ==
X-CSE-MsgGUID: oYkLBkSaQLuN4ATes3iMKQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13339395"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="13339395"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 12:36:22 -0700
X-CSE-ConnectionGUID: irAPE2IESt+QlpW+NtAvog==
X-CSE-MsgGUID: BMzUnfFcTmmCq2zlcx5/Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="58029794"
Received: from unknown (HELO pbossart-mobl6.lan) ([10.125.110.221])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 12:36:21 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 16/18] ASoC: Intel: maxim-common: rewrite max_98373_hw_params function
Date: Mon, 27 May 2024 14:35:50 -0500
Message-ID: <20240527193552.165567-17-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240527193552.165567-1-pierre-louis.bossart@linux.intel.com>
References: <20240527193552.165567-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brent Lu <brent.lu@intel.com>

Rewrite max_98373_hw_params() function to get tdm slot number from
topology in runtime because earlier platforms use 4-slot setting
instead of 8. Also check if the interface is configured in TDM mode
before calling snd_soc_dai_set_tdm_slot() function.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_maxim_common.c | 84 +++++++++++++++++++----
 1 file changed, 72 insertions(+), 12 deletions(-)

diff --git a/sound/soc/intel/boards/sof_maxim_common.c b/sound/soc/intel/boards/sof_maxim_common.c
index 6c40ecc04723..f965b172fa36 100644
--- a/sound/soc/intel/boards/sof_maxim_common.c
+++ b/sound/soc/intel/boards/sof_maxim_common.c
@@ -9,6 +9,7 @@
 #include <sound/soc-acpi.h>
 #include <sound/soc-dai.h>
 #include <sound/soc-dapm.h>
+#include <sound/sof.h>
 #include <uapi/sound/asound.h>
 #include "../common/soc-intel-quirks.h"
 #include "sof_maxim_common.h"
@@ -72,26 +73,85 @@ static struct snd_soc_dai_link_component max_98373_components[] = {
 	},
 };
 
+/*
+ * According to the definition of 'DAI Sel Mux' mixer in max98373.c, rx mask
+ * should choose two channels from TDM slots, the LSB of rx mask is left channel
+ * and the other one is right channel.
+ *
+ * For tx mask, each codec requires two channels: one for V-sense and the other
+ * one for I-sense. Must match the device property "maxim,vmon-slot-no" and
+ * "maxim,imon-slot-no" in ACPI table.
+ */
+static const struct {
+	unsigned int tx;
+	unsigned int rx;
+} max_98373_tdm_mask[] = {
+	{.tx = 0x03, .rx = 0x3},
+	{.tx = 0x0c, .rx = 0x3},
+};
+
 static int max_98373_hw_params(struct snd_pcm_substream *substream,
 			       struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai_link *dai_link = rtd->dai_link;
 	struct snd_soc_dai *codec_dai;
+	int i;
+	int tdm_slots;
 	int ret = 0;
-	int j;
 
-	for_each_rtd_codec_dais(rtd, j, codec_dai) {
-		if (!strcmp(codec_dai->component->name, MAX_98373_DEV0_NAME)) {
-			/* DEV0 tdm slot configuration */
-			ret = snd_soc_dai_set_tdm_slot(codec_dai, 0x03, 3, 8, 32);
-		} else if (!strcmp(codec_dai->component->name, MAX_98373_DEV1_NAME)) {
-			/* DEV1 tdm slot configuration */
-			ret = snd_soc_dai_set_tdm_slot(codec_dai, 0x0C, 3, 8, 32);
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		if (i >= ARRAY_SIZE(max_98373_tdm_mask)) {
+			dev_err(codec_dai->dev, "only 2 amps are supported\n");
+			return -EINVAL;
 		}
-		if (ret < 0) {
-			dev_err(codec_dai->dev, "fail to set tdm slot, ret %d\n",
-				ret);
-			return ret;
+
+		switch (dai_link->dai_fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+		case SND_SOC_DAIFMT_DSP_A:
+		case SND_SOC_DAIFMT_DSP_B:
+			/* get the tplg configured tdm slot number */
+			tdm_slots = sof_dai_get_tdm_slots(rtd);
+			if (tdm_slots <= 0) {
+				dev_err(rtd->dev, "invalid tdm slots %d\n",
+					tdm_slots);
+				return -EINVAL;
+			}
+
+			/*
+			 * check if tdm slot number is too small for channel
+			 * allocation
+			 */
+			if (fls(max_98373_tdm_mask[i].tx) > tdm_slots) {
+				dev_err(codec_dai->dev, "slot mismatch, tx %d slots %d\n",
+					fls(max_98373_tdm_mask[i].tx), tdm_slots);
+				return -EINVAL;
+			}
+
+			if (fls(max_98373_tdm_mask[i].rx) > tdm_slots) {
+				dev_err(codec_dai->dev, "slot mismatch, rx %d slots %d\n",
+					fls(max_98373_tdm_mask[i].rx), tdm_slots);
+				return -EINVAL;
+			}
+
+			dev_dbg(codec_dai->dev, "set tdm slot: tx 0x%x rx 0x%x slots %d width %d\n",
+				max_98373_tdm_mask[i].tx,
+				max_98373_tdm_mask[i].rx,
+				tdm_slots, params_width(params));
+
+			ret = snd_soc_dai_set_tdm_slot(codec_dai,
+						       max_98373_tdm_mask[i].tx,
+						       max_98373_tdm_mask[i].rx,
+						       tdm_slots,
+						       params_width(params));
+			if (ret < 0) {
+				dev_err(codec_dai->dev, "fail to set tdm slot, ret %d\n",
+					ret);
+				return ret;
+			}
+			break;
+		default:
+			dev_dbg(codec_dai->dev, "codec is in I2S mode\n");
+			break;
 		}
 	}
 	return 0;
-- 
2.43.0

