Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02344241F9
	for <linux-sound@vger.kernel.org>; Tue, 13 Feb 2024 10:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707819185; cv=none; b=oGFPVnFzulnn6KcKYCBNn27b+qp7j2fVsA8ieHfDjbzVgK8gCki5WfJOnkjjLcd8TfavA+x7gnxQfHs+UwwO4+LBWn1pIXDSYJ1+bxBxGUKMqr8QDb637QcjgGXhZrxaiH8yYoInjAPvlbtz4Pmvw1O8p7Kx/a4Nu6oYLwKtUdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707819185; c=relaxed/simple;
	bh=a2nm0ucbtGajMcWYT2D72gUHk4F5m+dYy0/SLZMutJs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A4DrViPPrrliOAGokpdRLHkwWSbuOehJOS7c17vq38wH1Av4IV7n07lQwXATOS3AEKGmqeIQiBQuDBD8XESjaBPbtP433Kkb/psB5kYlHNOET03Gc3TdZ3w5QdwfdCYIi4D11tYcTB0Z4oegztY7yrJrPiPNvsye8lh9/X+QoIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DfAGAfIi; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DfAGAfIi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707819184; x=1739355184;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=a2nm0ucbtGajMcWYT2D72gUHk4F5m+dYy0/SLZMutJs=;
  b=DfAGAfIiV189j1DzFlV8GThmRqWuEApAgCkMTlxfJKOt+/9AhJS3oZ1g
   be4vqn/JA331CcEhJOVNmadAJWYfS+Oa0lb3N4bTVgNX7onCUbj+Tv/Ch
   7IjGoTmtUrlUGnM1qlxQfJHgqYCQZR7mt6NZ/eDlIAsS5IjaqhDZUeOoH
   8ID//0GAT5xo00z/nJApkLqy4lfvtfw+e6lGksVjOQL2KcH+09mjF9Gog
   +T2IPkzMmmpcCe4/csyjtNrqE6j7zlSa1NzyhjJt0PgFcy1T8izpMOERL
   K0K9oWVrB9Ys1KeXS1LV2QM1NyQJCh9RhPFIQU3IQT0wcI4ZG7utecQPx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="27260184"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="27260184"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 02:13:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="7498075"
Received: from dcoroian-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.249.42.253])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 02:13:01 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 10/15] ASoC: SOF: Intel: start SoundWire links earlier for LNL+ devices
Date: Tue, 13 Feb 2024 12:12:42 +0200
Message-ID: <20240213101247.28887-11-peter.ujfalusi@linux.intel.com>
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

The SoundWire integration is different from previous platforms, with
no dependencies on the DSP enablement. We can start the SoundWire
links in the probe instead of waiting for the post_fw_run stage.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-dsp.c |  5 +++++
 sound/soc/sof/intel/hda.c     | 17 +++++++++++++++++
 sound/soc/sof/intel/lnl.c     | 15 ++++++++++++++-
 3 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index 2445ae7f6b2e..31ffa1a8f2ac 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -748,6 +748,7 @@ static int hda_suspend(struct snd_sof_dev *sdev, bool runtime_suspend)
 
 static int hda_resume(struct snd_sof_dev *sdev, bool runtime_resume)
 {
+	const struct sof_intel_dsp_desc *chip;
 	int ret;
 
 	/* display codec must be powered before link reset */
@@ -780,6 +781,10 @@ static int hda_resume(struct snd_sof_dev *sdev, bool runtime_resume)
 		hda_dsp_ctrl_ppcap_int_enable(sdev, true);
 	}
 
+	chip = get_chip_info(sdev->pdata);
+	if (chip && chip->hw_ip_version >= SOF_INTEL_ACE_2_0)
+		hda_sdw_int_enable(sdev, true);
+
 cleanup:
 	/* display codec can powered off after controller init */
 	hda_codec_i915_display_power(sdev, false);
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 0bae439feb8b..7fe72b065451 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1231,6 +1231,7 @@ int hda_dsp_probe(struct snd_sof_dev *sdev)
 {
 	struct pci_dev *pci = to_pci_dev(sdev->dev);
 	struct sof_intel_hda_dev *hdev = sdev->pdata->hw_pdata;
+	const struct sof_intel_dsp_desc *chip;
 	int ret = 0;
 
 	hdev->dmic_dev = platform_device_register_data(sdev->dev, "dmic-codec",
@@ -1344,12 +1345,28 @@ int hda_dsp_probe(struct snd_sof_dev *sdev)
 		INIT_DELAYED_WORK(&hdev->d0i3_work, hda_dsp_d0i3_work);
 	}
 
+	chip = get_chip_info(sdev->pdata);
+	if (chip && chip->hw_ip_version >= SOF_INTEL_ACE_2_0) {
+		ret = hda_sdw_startup(sdev);
+		if (ret < 0) {
+			dev_err(sdev->dev, "could not startup SoundWire links\n");
+			goto disable_pp_cap;
+		}
+
+		hda_sdw_int_enable(sdev, true);
+	}
+
 	init_waitqueue_head(&hdev->waitq);
 
 	hdev->nhlt = intel_nhlt_init(sdev->dev);
 
 	return 0;
 
+disable_pp_cap:
+	if (!sdev->dspless_mode_selected) {
+		hda_dsp_ctrl_ppcap_int_enable(sdev, false);
+		hda_dsp_ctrl_ppcap_enable(sdev, false);
+	}
 free_ipc_irq:
 	free_irq(sdev->ipc_irq, sdev);
 free_irq_vector:
diff --git a/sound/soc/sof/intel/lnl.c b/sound/soc/sof/intel/lnl.c
index 30712ea05a7a..b2ade2741dce 100644
--- a/sound/soc/sof/intel/lnl.c
+++ b/sound/soc/sof/intel/lnl.c
@@ -77,6 +77,19 @@ static int lnl_hda_dsp_runtime_resume(struct snd_sof_dev *sdev)
 	return hdac_bus_offload_dmic_ssp(sof_to_bus(sdev));
 }
 
+static int lnl_dsp_post_fw_run(struct snd_sof_dev *sdev)
+{
+	if (sdev->first_boot) {
+		struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
+
+		/* Check if IMR boot is usable */
+		if (!sof_debug_check_flag(SOF_DBG_IGNORE_D3_PERSISTENT))
+			hda->imrboot_supported = true;
+	}
+
+	return 0;
+}
+
 int sof_lnl_ops_init(struct snd_sof_dev *sdev)
 {
 	struct sof_ipc4_fw_data *ipc4_data;
@@ -106,7 +119,7 @@ int sof_lnl_ops_init(struct snd_sof_dev *sdev)
 
 	/* pre/post fw run */
 	sof_lnl_ops.pre_fw_run = mtl_dsp_pre_fw_run;
-	sof_lnl_ops.post_fw_run = mtl_dsp_post_fw_run;
+	sof_lnl_ops.post_fw_run = lnl_dsp_post_fw_run;
 
 	/* parse platform specific extended manifest */
 	sof_lnl_ops.parse_platform_ext_manifest = NULL;
-- 
2.43.0

