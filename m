Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D213946C
	for <linux-sound@vger.kernel.org>; Thu,  6 Mar 2025 13:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741268119; cv=none; b=JlwNQRCuqvoCAJiODp6WELl3Vapfu8V5uMx/Uu0BCqCC7CSB1urjgygqfwuP/cmME+1qeCIYMWe9zZpW/zjT+QEpTCJOF2oi3tTZU4YnwvWvYeZ+pIEkLWSCRJPKZlTMlJtswHLkr9wew7jL/Yvag6wg0WHh1Y7DEPUAQo1zJUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741268119; c=relaxed/simple;
	bh=1iqpHSQxqzdDEdT8bSiVNBcx/JhZqRZsDKzSLsZ1+BM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ljdgdzPKIRE1wUEFu0O4kjKII5Hfr2WaAXQOFj42VloGJRxpIP/Gv9YqPI9KRh2bK/0jYkJzs+PZFVFfwoMskWaGhYphSvyIFhYZHG/BaM1XyzcwJhA2Ic+XQlv3lRq9xn4eGpuPVTzJjb2LbcaaXYN9/2IfD5xlJy7gposq4n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iWRlfzA3; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iWRlfzA3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741268118; x=1772804118;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1iqpHSQxqzdDEdT8bSiVNBcx/JhZqRZsDKzSLsZ1+BM=;
  b=iWRlfzA3tw0HQOF3d5HeatBGVPjkf425RCQytdUC5DLrdRDrzBz3wEKf
   +/9hp9Cbv/JJ5gPMgzhJg93t+2HPZa3UiYzpkY9PjsoDdTnuZkMViioOj
   WxTv7na62ahUR0zy2XOU0+ckHt6wXOH2baopRL+vTB/a7CTn3LHuPsHoc
   t6n2joydVtyOHjzkoxAzybCcUKZZUAxd6gpJwrTaueDUHVuo5tuewb5jO
   Y55DuPfhUx6pfzc4RbfN/bKDSMUKxBC7uGl5DJSp2h2Gyl/AKy6yq5ifz
   HlkWSq1//bUKBtQLo02Isb8fbPI1k6GTUSpSLDlC/F4Pquf0lsTB6TmKs
   w==;
X-CSE-ConnectionGUID: wMIW4wD/QlOrYKd+k8M+Vg==
X-CSE-MsgGUID: ZLqe8odDR+6huoiglzQ9Lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42164735"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="42164735"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 05:35:18 -0800
X-CSE-ConnectionGUID: +TWGsuOvRc+mlSY82Z3daA==
X-CSE-MsgGUID: o6KBNSzVR02u3ohPlJph7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119539055"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.249.86])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 05:35:15 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com
Subject: [PATCH 7/8] ASoC: SOF: hda/shim: Add callbacks to handle mic privacy change for sdw
Date: Thu,  6 Mar 2025 15:35:26 +0200
Message-ID: <20250306133527.16722-8-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306133527.16722-1-peter.ujfalusi@linux.intel.com>
References: <20250306133527.16722-1-peter.ujfalusi@linux.intel.com>
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

