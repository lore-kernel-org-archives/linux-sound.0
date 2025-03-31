Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A6D2940F
	for <linux-sound@vger.kernel.org>; Mon, 31 Mar 2025 07:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743404738; cv=none; b=uf0wcdQkbMZu81PXDjlP32N+4j8vKvpTnX5gcUROY9Ka3AG780MTvTvu/x453fYg+hUHgCQTz0wAGZrZdI0gg+oM7HnRlAkGGru1Mn2WAyDu+Ex4WhgVX2BTbzZ+6hpMXGs9o1/SStnmm67a3ShDQql62aSYNc1Mqz18rojJGb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743404738; c=relaxed/simple;
	bh=ItaC9A/rlRxjM7F5E5dJe16wGPVP2u7DEKD4w6okvI4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i6dLTMtmAt+EOVK1qCMuu10hIb6jTeYO3yqgINUdkt5GrYXnTQwmMCHf5cFc08Tfu358Tw0iJwBagJFTrxOnN5OI+ygjnyThYCxhh97AoVWSOIf6qwH8pkNWcLYmztcggISOFDYzQHZ1E/4G+fVldZ8HWxtXKDcQTTWCAerTaow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q8OBF0TU; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q8OBF0TU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743404737; x=1774940737;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ItaC9A/rlRxjM7F5E5dJe16wGPVP2u7DEKD4w6okvI4=;
  b=Q8OBF0TUo62Dxq5dAwfRkkOFYDWSvflWycWvLZ9tmoDimCNOxlQVf6aQ
   qYgXA2ysGCZy+bdgtFYOiRHiRweASbBvMo+F84W4fYbSWgiJu5+sHakXM
   5KI4o8Ug1WF3MEyyvdaLJrR1s8aVi1KHr18xh0AIjFN7tNOmW/4jxCAaa
   NSSFy4J6OTBcQktWPs66IgFKmGv5etydSjrN66acReI4+Mvc3+I1Ne7+2
   ZNrMI4IM7oG8XgNF48vASkozyWjYUYwVyCklMekVyze18C4xIh3qwhpIh
   0nLao+S/zH8l/5hlsTc/8G97dk8N/t5lvhmdIFmsv+U+WgxweSOrCxoro
   w==;
X-CSE-ConnectionGUID: BZ9Sue5LQTmH18MznPJXow==
X-CSE-MsgGUID: pIIUPlRvTxmhiK8mGh29iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="44856863"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="44856863"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 00:05:36 -0700
X-CSE-ConnectionGUID: r0y6VzJnRF+QBuevxmdQtQ==
X-CSE-MsgGUID: T73A4aZLSiKyjljX2zOC7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="131022644"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.251.162])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 00:05:33 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com,
	guennadi.liakhovetski@linux.intel.com
Subject: [PATCH for v6.15] ASoC: SOF: hda/ptl: Move mic privacy change notification sending to a work
Date: Mon, 31 Mar 2025 10:06:23 +0300
Message-ID: <20250331070623.5985-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

IPC message cannot be sent from the irq thread directly as the message will
not receive the reply (interrupts are disabled) and it will time out - the
reply is going to be received right after the we leave the irq thread.
This is a different case compared to the delayed IPC messages due to DSP
busy state.

Add support for sending the mic privacy change notification to the firmware
from a work instead of the process callback.

The work needs to be canceled if there is a chance that it might be running
on module remove or before system/runtime suspend.

Fixes: 4a43c3241ec3 ("ASoC: SOF: Intel: ptl: Add support for mic privacy")
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-dsp.c |  8 ++++++++
 sound/soc/sof/intel/hda.c     |  4 ++++
 sound/soc/sof/intel/hda.h     |  8 ++++++++
 sound/soc/sof/intel/ptl.c     | 33 +++++++++++++++++++++++++++++----
 4 files changed, 49 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index ccf8eefdca70..f64e8a6a9a33 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -991,6 +991,10 @@ int hda_dsp_runtime_suspend(struct snd_sof_dev *sdev)
 	if (!sdev->dspless_mode_selected) {
 		/* cancel any attempt for DSP D0I3 */
 		cancel_delayed_work_sync(&hda->d0i3_work);
+
+		/* Cancel the microphone privacy work if mic privacy is active */
+		if (hda->mic_privacy.active)
+			cancel_work_sync(&hda->mic_privacy.work);
 	}
 
 	/* stop hda controller and power dsp off */
@@ -1017,6 +1021,10 @@ int hda_dsp_suspend(struct snd_sof_dev *sdev, u32 target_state)
 	if (!sdev->dspless_mode_selected) {
 		/* cancel any attempt for DSP D0I3 */
 		cancel_delayed_work_sync(&hda->d0i3_work);
+
+		/* Cancel the microphone privacy work if mic privacy is active */
+		if (hda->mic_privacy.active)
+			cancel_work_sync(&hda->mic_privacy.work);
 	}
 
 	if (target_state == SOF_DSP_PM_D0) {
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 6b1ada566476..b34e5fdf10f1 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -968,6 +968,10 @@ void hda_dsp_remove(struct snd_sof_dev *sdev)
 	if (sdev->dspless_mode_selected)
 		goto skip_disable_dsp;
 
+	/* Cancel the microphone privacy work if mic privacy is active */
+	if (hda->mic_privacy.active)
+		cancel_work_sync(&hda->mic_privacy.work);
+
 	/* no need to check for error as the DSP will be disabled anyway */
 	if (chip && chip->power_down_dsp)
 		chip->power_down_dsp(sdev);
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 76154627fc17..108cad04879e 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -487,6 +487,11 @@ enum sof_hda_D0_substate {
 	SOF_HDA_DSP_PM_D0I3,	/* low power D0 substate */
 };
 
+struct sof_ace3_mic_privacy {
+	bool active;
+	struct work_struct work;
+};
+
 /* represents DSP HDA controller frontend - i.e. host facing control */
 struct sof_intel_hda_dev {
 	bool imrboot_supported;
@@ -542,6 +547,9 @@ struct sof_intel_hda_dev {
 	/* Intel NHLT information */
 	struct nhlt_acpi_table *nhlt;
 
+	/* work queue for mic privacy state change notification sending */
+	struct sof_ace3_mic_privacy mic_privacy;
+
 	/*
 	 * Pointing to the IPC message if immediate sending was not possible
 	 * because the downlink communication channel was BUSY at the time.
diff --git a/sound/soc/sof/intel/ptl.c b/sound/soc/sof/intel/ptl.c
index 8fa4bdceedd9..aa0b772178bc 100644
--- a/sound/soc/sof/intel/ptl.c
+++ b/sound/soc/sof/intel/ptl.c
@@ -27,22 +27,44 @@ static bool sof_ptl_check_mic_privacy_irq(struct snd_sof_dev *sdev, bool alt,
 	return hdac_bus_eml_is_mic_privacy_changed(sof_to_bus(sdev), alt, elid);
 }
 
+static void sof_ptl_mic_privacy_work(struct work_struct *work)
+{
+	struct sof_intel_hda_dev *hdev = container_of(work,
+						      struct sof_intel_hda_dev,
+						      mic_privacy.work);
+	struct hdac_bus *bus = &hdev->hbus.core;
+	struct snd_sof_dev *sdev = dev_get_drvdata(bus->dev);
+	bool state;
+
+	/*
+	 * The microphone privacy state is only available via Soundwire shim
+	 * in PTL
+	 * The work is only scheduled on change.
+	 */
+	state = hdac_bus_eml_get_mic_privacy_state(bus, 1,
+						   AZX_REG_ML_LEPTR_ID_SDW);
+	sof_ipc4_mic_privacy_state_change(sdev, state);
+}
+
 static void sof_ptl_process_mic_privacy(struct snd_sof_dev *sdev, bool alt,
 					int elid)
 {
-	bool state;
+	struct sof_intel_hda_dev *hdev = sdev->pdata->hw_pdata;
 
 	if (!alt || elid != AZX_REG_ML_LEPTR_ID_SDW)
 		return;
 
-	state = hdac_bus_eml_get_mic_privacy_state(sof_to_bus(sdev), alt, elid);
-
-	sof_ipc4_mic_privacy_state_change(sdev, state);
+	/*
+	 * Schedule the work to read the microphone privacy state and send IPC
+	 * message about the new state to the firmware
+	 */
+	schedule_work(&hdev->mic_privacy.work);
 }
 
 static void sof_ptl_set_mic_privacy(struct snd_sof_dev *sdev,
 				    struct sof_ipc4_intel_mic_privacy_cap *caps)
 {
+	struct sof_intel_hda_dev *hdev = sdev->pdata->hw_pdata;
 	u32 micpvcp;
 
 	if (!caps || !caps->capabilities_length)
@@ -58,6 +80,9 @@ static void sof_ptl_set_mic_privacy(struct snd_sof_dev *sdev,
 	hdac_bus_eml_set_mic_privacy_mask(sof_to_bus(sdev), true,
 					  AZX_REG_ML_LEPTR_ID_SDW,
 					  PTL_MICPVCP_GET_SDW_MASK(micpvcp));
+
+	INIT_WORK(&hdev->mic_privacy.work, sof_ptl_mic_privacy_work);
+	hdev->mic_privacy.active = true;
 }
 
 int sof_ptl_set_ops(struct snd_sof_dev *sdev, struct snd_sof_dsp_ops *dsp_ops)
-- 
2.49.0

