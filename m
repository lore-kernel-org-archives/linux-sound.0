Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB22A218596
	for <linux-sound@vger.kernel.org>; Fri,  7 Mar 2025 11:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741346875; cv=none; b=iwikwPo61THO4i/Lh2gum5gzrJicOiKlMxgSjYsXyq9D82axYoFFJ6ym/4rLelAtDwNrBzfeTWPbzQuNAvysXgqwwHY79l64PHf7KqxgQwZTUCdIchaqXLOtBiD8BZf3NLyEISEm1hE3/meY+vBzQAl1P0NVHy3OZdCIxXEUQV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741346875; c=relaxed/simple;
	bh=64cDrEs3dPTQhbf/RFPQR87Ph7tXRhqADvvVwHFrnTw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oMrEZc7CVj9m5hsjNTbuXSumFwGm/DP2c7xtOVQLNJEaQ2zCt7iQilH60WBDmgVsRs1kpxEkP5kUgFewM/Md4W+WG0ijuWDXlwVfhQmkjjTJ/mCvTuaVf3HCVqkNl++I7jRPiFCd5cPQ//uAU7r7glycH24Ax0U2beEetqh0+y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QZXoIakL; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QZXoIakL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741346873; x=1772882873;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=64cDrEs3dPTQhbf/RFPQR87Ph7tXRhqADvvVwHFrnTw=;
  b=QZXoIakLG6qsSweFY9s5/kOlZ3pOXySJXAAWY5apSAS+hfL55ObhXZtc
   o69IVyGqR0ZMs5sTax1WpFtZ5vcXxugP71SZpNnbJASjR42eh+vly6wuu
   Qdnjb/AIlIFsHjJBzC7hUVH+BqMkIowc7Pkp9m2Y5ebWK7rLy0mJe9wM4
   3LWlkvtOm+YgkRv5siqM4h/RxOrcJ6NjQnjAND7O5zB1yl8Of2aQCYhHw
   1lsfNnVkjgg+n27hLrz0NuR4r/pSmBK6yrXAFWzZa+wvgKG56MlwaX+TC
   DdlG+WQwBxSpq7DjSZ+AUWXNomJbeKxX41vYYVSp/2yzp0oXdD+oJri5p
   g==;
X-CSE-ConnectionGUID: 7gfjI+7WTgih12/ULblQ+Q==
X-CSE-MsgGUID: oc21sYqNRC2FJ8tFLcN44g==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="29972299"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="29972299"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 03:27:53 -0800
X-CSE-ConnectionGUID: tIRBXv8SRYWuWkEQR+BryQ==
X-CSE-MsgGUID: kcCKUrcZSu+CfNCuZIsGjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="124390687"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.249.140])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 03:27:50 -0800
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
Subject: [PATCH v2 3/8] ASoC: SOF: Intel: mtl: Stop exporting dsp_ops callback functions
Date: Fri,  7 Mar 2025 13:28:11 +0200
Message-ID: <20250307112816.1495-4-peter.ujfalusi@linux.intel.com>
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

There is no need to export individual dsp_ops functions anymore as the
callbacks are filled now by sof_mtl_set_ops()

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/intel/mtl.c | 30 ++++++++++--------------------
 sound/soc/sof/intel/mtl.h | 15 ---------------
 2 files changed, 10 insertions(+), 35 deletions(-)

diff --git a/sound/soc/sof/intel/mtl.c b/sound/soc/sof/intel/mtl.c
index ec563214dd1a..2242c96bfa51 100644
--- a/sound/soc/sof/intel/mtl.c
+++ b/sound/soc/sof/intel/mtl.c
@@ -96,7 +96,7 @@ static bool mtl_dsp_check_sdw_irq(struct snd_sof_dev *sdev)
 	return false;
 }
 
-int mtl_ipc_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg)
+static int mtl_ipc_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg)
 {
 	struct sof_intel_hda_dev *hdev = sdev->pdata->hw_pdata;
 	struct sof_ipc4_msg *msg_data = msg->msg_data;
@@ -122,7 +122,6 @@ int mtl_ipc_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(mtl_ipc_send_msg, "SND_SOC_SOF_INTEL_MTL");
 
 void mtl_enable_ipc_interrupts(struct snd_sof_dev *sdev)
 {
@@ -238,7 +237,7 @@ int mtl_enable_interrupts(struct snd_sof_dev *sdev, bool enable)
 EXPORT_SYMBOL_NS(mtl_enable_interrupts, "SND_SOC_SOF_INTEL_MTL");
 
 /* pre fw run operations */
-int mtl_dsp_pre_fw_run(struct snd_sof_dev *sdev)
+static int mtl_dsp_pre_fw_run(struct snd_sof_dev *sdev)
 {
 	struct sof_intel_hda_dev *hdev = sdev->pdata->hw_pdata;
 	u32 dsphfpwrsts;
@@ -298,9 +297,8 @@ int mtl_dsp_pre_fw_run(struct snd_sof_dev *sdev)
 
 	return ret;
 }
-EXPORT_SYMBOL_NS(mtl_dsp_pre_fw_run, "SND_SOC_SOF_INTEL_MTL");
 
-int mtl_dsp_post_fw_run(struct snd_sof_dev *sdev)
+static int mtl_dsp_post_fw_run(struct snd_sof_dev *sdev)
 {
 	int ret;
 
@@ -325,9 +323,8 @@ int mtl_dsp_post_fw_run(struct snd_sof_dev *sdev)
 	hda_sdw_int_enable(sdev, true);
 	return 0;
 }
-EXPORT_SYMBOL_NS(mtl_dsp_post_fw_run, "SND_SOC_SOF_INTEL_MTL");
 
-void mtl_dsp_dump(struct snd_sof_dev *sdev, u32 flags)
+static void mtl_dsp_dump(struct snd_sof_dev *sdev, u32 flags)
 {
 	char *level = (flags & SOF_DBG_DUMP_OPTIONAL) ? KERN_DEBUG : KERN_ERR;
 	u32 fwsts;
@@ -343,7 +340,6 @@ void mtl_dsp_dump(struct snd_sof_dev *sdev, u32 flags)
 
 	sof_ipc4_intel_dump_telemetry_state(sdev, flags);
 }
-EXPORT_SYMBOL_NS(mtl_dsp_dump, "SND_SOC_SOF_INTEL_MTL");
 
 static bool mtl_dsp_primary_core_is_enabled(struct snd_sof_dev *sdev)
 {
@@ -559,7 +555,7 @@ int mtl_dsp_cl_init(struct snd_sof_dev *sdev, int stream_tag, bool imr_boot)
 }
 EXPORT_SYMBOL_NS(mtl_dsp_cl_init, "SND_SOC_SOF_INTEL_MTL");
 
-irqreturn_t mtl_ipc_irq_thread(int irq, void *context)
+static irqreturn_t mtl_ipc_irq_thread(int irq, void *context)
 {
 	struct sof_ipc4_msg notification_data = {{ 0 }};
 	struct snd_sof_dev *sdev = context;
@@ -641,21 +637,18 @@ irqreturn_t mtl_ipc_irq_thread(int irq, void *context)
 
 	return IRQ_HANDLED;
 }
-EXPORT_SYMBOL_NS(mtl_ipc_irq_thread, "SND_SOC_SOF_INTEL_MTL");
 
-int mtl_dsp_ipc_get_mailbox_offset(struct snd_sof_dev *sdev)
+static int mtl_dsp_ipc_get_mailbox_offset(struct snd_sof_dev *sdev)
 {
 	return MTL_DSP_MBOX_UPLINK_OFFSET;
 }
-EXPORT_SYMBOL_NS(mtl_dsp_ipc_get_mailbox_offset, "SND_SOC_SOF_INTEL_MTL");
 
-int mtl_dsp_ipc_get_window_offset(struct snd_sof_dev *sdev, u32 id)
+static int mtl_dsp_ipc_get_window_offset(struct snd_sof_dev *sdev, u32 id)
 {
 	return MTL_SRAM_WINDOW_OFFSET(id);
 }
-EXPORT_SYMBOL_NS(mtl_dsp_ipc_get_window_offset, "SND_SOC_SOF_INTEL_MTL");
 
-void mtl_ipc_dump(struct snd_sof_dev *sdev)
+static void mtl_ipc_dump(struct snd_sof_dev *sdev)
 {
 	u32 hipcidr, hipcidd, hipcida, hipctdr, hipctdd, hipctda, hipcctl;
 
@@ -671,7 +664,6 @@ void mtl_ipc_dump(struct snd_sof_dev *sdev)
 		"Host IPC initiator: %#x|%#x|%#x, target: %#x|%#x|%#x, ctl: %#x\n",
 		hipcidr, hipcidd, hipcida, hipctdr, hipctdd, hipctda, hipcctl);
 }
-EXPORT_SYMBOL_NS(mtl_ipc_dump, "SND_SOC_SOF_INTEL_MTL");
 
 static int mtl_dsp_disable_interrupts(struct snd_sof_dev *sdev)
 {
@@ -680,7 +672,7 @@ static int mtl_dsp_disable_interrupts(struct snd_sof_dev *sdev)
 	return mtl_enable_interrupts(sdev, false);
 }
 
-int mtl_dsp_core_get(struct snd_sof_dev *sdev, int core)
+static int mtl_dsp_core_get(struct snd_sof_dev *sdev, int core)
 {
 	const struct sof_ipc_pm_ops *pm_ops = sdev->ipc->ops->pm;
 
@@ -692,9 +684,8 @@ int mtl_dsp_core_get(struct snd_sof_dev *sdev, int core)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(mtl_dsp_core_get, "SND_SOC_SOF_INTEL_MTL");
 
-int mtl_dsp_core_put(struct snd_sof_dev *sdev, int core)
+static int mtl_dsp_core_put(struct snd_sof_dev *sdev, int core)
 {
 	const struct sof_ipc_pm_ops *pm_ops = sdev->ipc->ops->pm;
 	int ret;
@@ -710,7 +701,6 @@ int mtl_dsp_core_put(struct snd_sof_dev *sdev, int core)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(mtl_dsp_core_put, "SND_SOC_SOF_INTEL_MTL");
 
 int sof_mtl_set_ops(struct snd_sof_dev *sdev, struct snd_sof_dsp_ops *dsp_ops)
 {
diff --git a/sound/soc/sof/intel/mtl.h b/sound/soc/sof/intel/mtl.h
index 4d098dae2973..e01a1536709e 100644
--- a/sound/soc/sof/intel/mtl.h
+++ b/sound/soc/sof/intel/mtl.h
@@ -122,28 +122,13 @@
 #define MTL_DSP_REG_HfIMRIS1_IU_MASK	BIT(0)
 
 bool mtl_dsp_check_ipc_irq(struct snd_sof_dev *sdev);
-int mtl_ipc_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg);
 
 void mtl_enable_ipc_interrupts(struct snd_sof_dev *sdev);
 void mtl_disable_ipc_interrupts(struct snd_sof_dev *sdev);
 
 int mtl_enable_interrupts(struct snd_sof_dev *sdev, bool enable);
 
-int mtl_dsp_pre_fw_run(struct snd_sof_dev *sdev);
-int mtl_dsp_post_fw_run(struct snd_sof_dev *sdev);
-void mtl_dsp_dump(struct snd_sof_dev *sdev, u32 flags);
-
 int mtl_power_down_dsp(struct snd_sof_dev *sdev);
 int mtl_dsp_cl_init(struct snd_sof_dev *sdev, int stream_tag, bool imr_boot);
 
-irqreturn_t mtl_ipc_irq_thread(int irq, void *context);
-
-int mtl_dsp_ipc_get_mailbox_offset(struct snd_sof_dev *sdev);
-int mtl_dsp_ipc_get_window_offset(struct snd_sof_dev *sdev, u32 id);
-
-void mtl_ipc_dump(struct snd_sof_dev *sdev);
-
-int mtl_dsp_core_get(struct snd_sof_dev *sdev, int core);
-int mtl_dsp_core_put(struct snd_sof_dev *sdev, int core);
-
 int sof_mtl_set_ops(struct snd_sof_dev *sdev, struct snd_sof_dsp_ops *dsp_ops);
-- 
2.48.1

