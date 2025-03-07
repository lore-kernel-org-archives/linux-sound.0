Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95F12185B4
	for <linux-sound@vger.kernel.org>; Fri,  7 Mar 2025 11:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741346889; cv=none; b=AOCGouxUuhtgXVCDab6y0EXMVlPvpa58MplyRCjVj7A7cAQTm1yb+3I+W9+35XRtknIULHH1PaU+Sjcqs+zoKexxA9EoSdY9jBb1GahgMjjhajBkqLoOpr8xOy8j9H8T3hPL+0dSuHjWqI2t7RNd7HuFwLEoL/wqbcyFozB6S9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741346889; c=relaxed/simple;
	bh=1iqpHSQxqzdDEdT8bSiVNBcx/JhZqRZsDKzSLsZ1+BM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OZSBL9IX9NZaD8JO3t31Bv60hfykpBedLmHl4px3Ze6kxqs1LFrtw3MH3HVW+MP0BC+RrEt2Cixtv5qZ7gCPx/tVGo4YVtJ5w60DPxksFtlelVxS1WFLrvBwpqiBuJJxc+J068WO7cndeBPBZGk5XvfQqUphf/OkMNWXqhHWBqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fp6vcXoM; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fp6vcXoM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741346887; x=1772882887;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1iqpHSQxqzdDEdT8bSiVNBcx/JhZqRZsDKzSLsZ1+BM=;
  b=Fp6vcXoMw9n6FuqonSo/ovOzw4Kejr4TxGIC0TJ/cyp7v/NweW8aykmB
   6qMHI36zcCmnofuMyLpE2SyAhPdc84tX1Y1ujwYz5IH5du/6KP9MS0SmK
   cc/xWDLd1zk7pTGHfcYXlcAjCeNrOIDtL+SWs27H2Op9ZhwkDKBOXYz2T
   TrYPVS7BbNHyP+TB51zm6UqmcRxvzlpH8bBQZn8ICz5ImCvY8GFsf5H0P
   v6k1T5/L5cRArCi1XLaCs05DalGrDH5XbwWrHDy5Iq0gWRlm/JF0UAX/2
   P6NC+R0VIqJe/rtqwIJ5Gk9r4PnK8/xFli1ZBEvlkjvF0JudZwIjLH238
   Q==;
X-CSE-ConnectionGUID: BnjnrX9QR/yEVHmpjCvQ5A==
X-CSE-MsgGUID: U/9TT1QNTHS8KYtqA1n7Dw==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="29972331"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="29972331"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 03:28:07 -0800
X-CSE-ConnectionGUID: Kbi+lopZQA+fXNOhXnc85A==
X-CSE-MsgGUID: hILpaUw8S9ySz0bFsZqQ7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="124390720"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.249.140])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 03:28:05 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com,
	amadeuszx.slawinski@linux.intel.com
Subject: [PATCH v2 7/8] ASoC: SOF: hda/shim: Add callbacks to handle mic privacy change for sdw
Date: Fri,  7 Mar 2025 13:28:15 +0200
Message-ID: <20250307112816.1495-8-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250307112816.1495-1-peter.ujfalusi@linux.intel.com>
References: <20250307112816.1495-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add generic callback definitions for checking the mic privacy interrupt and
status.
Implement wrappers for mic privacy reported via the Soundwire interrupt and
its vendor specific SHIM registers.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/intel/hda.c  | 34 ++++++++++++++++++++++++++++++++++
 sound/soc/sof/intel/shim.h |  2 ++
 2 files changed, 36 insertions(+)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index a1ccd95da8bb..6b1ada566476 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -352,6 +352,27 @@ void hda_sdw_process_wakeen_common(struct snd_sof_dev *sdev)
 }
 EXPORT_SYMBOL_NS(hda_sdw_process_wakeen_common, "SND_SOC_SOF_INTEL_HDA_GENERIC");
 
+static bool hda_dsp_sdw_check_mic_privacy_irq(struct snd_sof_dev *sdev)
+{
+	const struct sof_intel_dsp_desc *chip;
+
+	chip = get_chip_info(sdev->pdata);
+	if (chip && chip->check_mic_privacy_irq)
+		return chip->check_mic_privacy_irq(sdev, true,
+						   AZX_REG_ML_LEPTR_ID_SDW);
+
+	return false;
+}
+
+static void hda_dsp_sdw_process_mic_privacy(struct snd_sof_dev *sdev)
+{
+	const struct sof_intel_dsp_desc *chip;
+
+	chip = get_chip_info(sdev->pdata);
+	if (chip && chip->process_mic_privacy)
+		chip->process_mic_privacy(sdev, true, AZX_REG_ML_LEPTR_ID_SDW);
+}
+
 #else /* IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE) */
 static inline int hda_sdw_acpi_scan(struct snd_sof_dev *sdev)
 {
@@ -383,6 +404,13 @@ static inline bool hda_sdw_check_wakeen_irq(struct snd_sof_dev *sdev)
 	return false;
 }
 
+static inline bool hda_dsp_sdw_check_mic_privacy_irq(struct snd_sof_dev *sdev)
+{
+	return false;
+}
+
+static inline void hda_dsp_sdw_process_mic_privacy(struct snd_sof_dev *sdev) { }
+
 #endif /* IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE) */
 
 /* pre fw run operations */
@@ -678,7 +706,13 @@ static irqreturn_t hda_dsp_interrupt_thread(int irq, void *context)
 
 	if (hda_dsp_check_sdw_irq(sdev)) {
 		trace_sof_intel_hda_irq(sdev, "sdw");
+
 		hda_dsp_sdw_thread(irq, hdev->sdw);
+
+		if (hda_dsp_sdw_check_mic_privacy_irq(sdev)) {
+			trace_sof_intel_hda_irq(sdev, "mic privacy");
+			hda_dsp_sdw_process_mic_privacy(sdev);
+		}
 	}
 
 	if (hda_sdw_check_wakeen_irq(sdev)) {
diff --git a/sound/soc/sof/intel/shim.h b/sound/soc/sof/intel/shim.h
index 8709b750a11e..d4372f0bff7e 100644
--- a/sound/soc/sof/intel/shim.h
+++ b/sound/soc/sof/intel/shim.h
@@ -193,6 +193,8 @@ struct sof_intel_dsp_desc {
 	bool (*check_sdw_wakeen_irq)(struct snd_sof_dev *sdev);
 	void (*sdw_process_wakeen)(struct snd_sof_dev *sdev);
 	bool (*check_ipc_irq)(struct snd_sof_dev *sdev);
+	bool (*check_mic_privacy_irq)(struct snd_sof_dev *sdev, bool alt, int elid);
+	void (*process_mic_privacy)(struct snd_sof_dev *sdev, bool alt, int elid);
 	int (*power_down_dsp)(struct snd_sof_dev *sdev);
 	int (*disable_interrupts)(struct snd_sof_dev *sdev);
 	int (*cl_init)(struct snd_sof_dev *sdev, int stream_tag, bool imr_boot);
-- 
2.48.1

