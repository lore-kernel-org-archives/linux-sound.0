Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E85528C2A1
	for <linux-sound@vger.kernel.org>; Mon, 12 Jan 2026 10:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768212586; cv=none; b=PIOBQcZRRXweoZpxP6BEwYDndbhwxaucZx+RPBzxRwGFvQRUoCkD0EGnmXRH68cEFzr9mLlbABOusC3XHhp1Qi9RMguijH9gXvLNgiVG/jEN1iMG64qhPIJj+Ql8s+AaQqiHTQ73Q3hrN3e1K0Q6Y+JCPZiQogpsweWBvYOtPtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768212586; c=relaxed/simple;
	bh=tXHO1QV2UdnVPPcItOkJ37I7Sr5Kba7yKnUKQqMxOrM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U6KLW6G7oFpxZdLeZJ46Mzv/+c29igosCerCh/vgDFY0skoB919g11WGYJsRynmdlyyT7atToP7g/5iYC6xA7SWllCNiJa5ZuWm64VnPWDRyX7sqKRWm/InAvhyZe/BvrlKhmgEYD4+TOi0ITuDVw0GTymTXqoDutMShisYrRTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CYZTNTEt; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CYZTNTEt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768212584; x=1799748584;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tXHO1QV2UdnVPPcItOkJ37I7Sr5Kba7yKnUKQqMxOrM=;
  b=CYZTNTEtj0q1cOjAMCPMJGj6OFp7f5esMTY6UQ9NSqcE6H1wMU81sUVF
   m48kCwhn+I2z0GBSUV7QFM8EoytQvalpFwCYaB1ggVy5BiTEqxenkMa5d
   Rtak4Fa9PeRfLjBA7twXF0Gk4r42ZJ+wAmAUPKtUMtwmOOj6IbqwRPOZj
   za90Zs+DaU+ZKR54a4UtnliRoAA4qXyU9nIGTxAeLbw8MJ/mb5opo5I5j
   uY+SvoxVRlQYGpB0iVWw78uNaxVLGmcqALehiGe1Rb/IqL3s0YppFXPfV
   LDTNUi9p3Tk34uUsUOSgw4oAPXLHd2uEj1Ks3ny3PCozRtsbVl48RwMJJ
   Q==;
X-CSE-ConnectionGUID: n/c+WdOBSZCvnzsVt1hiTg==
X-CSE-MsgGUID: NUhsuCzSTyaj+HbiI/0DEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69535298"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69535298"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 02:09:44 -0800
X-CSE-ConnectionGUID: vwCAX11jQOWbo7Nsm4A27Q==
X-CSE-MsgGUID: cRvgUs1vQjyCkGGNcuaGlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="208534723"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.204])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 02:09:42 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	daniel.baluta@nxp.com
Subject: [PATCH 6/7] ASoC: SOF: Intel: Use guard() for spinlocks where it makes sense
Date: Mon, 12 Jan 2026 12:10:03 +0200
Message-ID: <20260112101004.7648-7-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112101004.7648-1-peter.ujfalusi@linux.intel.com>
References: <20260112101004.7648-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the manual spinlock lock/unlock pairs with guard().

Only code refactoring, and no behavior change.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/atom.c        |  7 +------
 sound/soc/sof/intel/bdw.c         |  7 +------
 sound/soc/sof/intel/cnl.c         | 11 ++---------
 sound/soc/sof/intel/hda-dai-ops.c |  3 +--
 sound/soc/sof/intel/hda-ipc.c     | 11 ++---------
 sound/soc/sof/intel/hda-stream.c  | 11 ++++-------
 sound/soc/sof/intel/mtl.c         |  5 +----
 7 files changed, 12 insertions(+), 43 deletions(-)

diff --git a/sound/soc/sof/intel/atom.c b/sound/soc/sof/intel/atom.c
index 0d364bcdcfa9..32bf5e5e5978 100644
--- a/sound/soc/sof/intel/atom.c
+++ b/sound/soc/sof/intel/atom.c
@@ -143,9 +143,6 @@ irqreturn_t atom_irq_thread(int irq, void *context)
 
 	/* reply message from DSP */
 	if (ipcx & SHIM_BYT_IPCX_DONE) {
-
-		spin_lock_irq(&sdev->ipc_lock);
-
 		/*
 		 * handle immediate reply from DSP core. If the msg is
 		 * found, set done bit in cmd_done which is called at the
@@ -153,11 +150,9 @@ irqreturn_t atom_irq_thread(int irq, void *context)
 		 * because the done bit can't be set in cmd_done function
 		 * which is triggered by msg
 		 */
+		guard(spinlock_irq)(&sdev->ipc_lock);
 		snd_sof_ipc_process_reply(sdev, ipcx);
-
 		atom_dsp_done(sdev);
-
-		spin_unlock_irq(&sdev->ipc_lock);
 	}
 
 	/* new message from DSP */
diff --git a/sound/soc/sof/intel/bdw.c b/sound/soc/sof/intel/bdw.c
index f1287d509835..9534d18be97d 100644
--- a/sound/soc/sof/intel/bdw.c
+++ b/sound/soc/sof/intel/bdw.c
@@ -315,9 +315,6 @@ static irqreturn_t bdw_irq_thread(int irq, void *context)
 		snd_sof_dsp_update_bits_unlocked(sdev, BDW_DSP_BAR,
 						 SHIM_IMRX, SHIM_IMRX_DONE,
 						 SHIM_IMRX_DONE);
-
-		spin_lock_irq(&sdev->ipc_lock);
-
 		/*
 		 * handle immediate reply from DSP core. If the msg is
 		 * found, set done bit in cmd_done which is called at the
@@ -325,11 +322,9 @@ static irqreturn_t bdw_irq_thread(int irq, void *context)
 		 * because the done bit can't be set in cmd_done function
 		 * which is triggered by msg
 		 */
+		guard(spinlock_irq)(&sdev->ipc_lock);
 		snd_sof_ipc_process_reply(sdev, ipcx);
-
 		bdw_dsp_done(sdev);
-
-		spin_unlock_irq(&sdev->ipc_lock);
 	}
 
 	ipcd = snd_sof_dsp_read(sdev, BDW_DSP_BAR, SHIM_IPCD);
diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index 0cc5725515e7..69376fb5b20d 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -69,13 +69,10 @@ irqreturn_t cnl_ipc4_irq_thread(int irq, void *context)
 				data->primary = primary;
 				data->extension = extension;
 
-				spin_lock_irq(&sdev->ipc_lock);
-
+				guard(spinlock_irq)(&sdev->ipc_lock);
 				snd_sof_ipc_get_reply(sdev);
 				cnl_ipc_host_done(sdev);
 				snd_sof_ipc_reply(sdev, data->primary);
-
-				spin_unlock_irq(&sdev->ipc_lock);
 			} else {
 				dev_dbg_ratelimited(sdev->dev,
 						    "IPC reply before FW_READY: %#x|%#x\n",
@@ -141,15 +138,11 @@ irqreturn_t cnl_ipc_irq_thread(int irq, void *context)
 					CNL_DSP_REG_HIPCCTL_DONE, 0);
 
 		if (likely(sdev->fw_state == SOF_FW_BOOT_COMPLETE)) {
-			spin_lock_irq(&sdev->ipc_lock);
-
 			/* handle immediate reply from DSP core */
+			guard(spinlock_irq)(&sdev->ipc_lock);
 			hda_dsp_ipc_get_reply(sdev);
 			snd_sof_ipc_reply(sdev, msg);
-
 			cnl_ipc_dsp_done(sdev);
-
-			spin_unlock_irq(&sdev->ipc_lock);
 		} else {
 			dev_dbg_ratelimited(sdev->dev, "IPC reply before FW_READY: %#x\n",
 					    msg);
diff --git a/sound/soc/sof/intel/hda-dai-ops.c b/sound/soc/sof/intel/hda-dai-ops.c
index cdfa3636f70c..b2c559559962 100644
--- a/sound/soc/sof/intel/hda-dai-ops.c
+++ b/sound/soc/sof/intel/hda-dai-ops.c
@@ -58,7 +58,7 @@ hda_link_stream_assign(struct hdac_bus *bus, struct snd_pcm_substream *substream
 		return NULL;
 	}
 
-	spin_lock_irq(&bus->reg_lock);
+	guard(spinlock_irq)(&bus->reg_lock);
 	list_for_each_entry(hstream, &bus->stream_list, list) {
 		struct hdac_ext_stream *hext_stream =
 			stream_to_hdac_ext_stream(hstream);
@@ -110,7 +110,6 @@ hda_link_stream_assign(struct hdac_bus *bus, struct snd_pcm_substream *substream
 		res->link_locked = 1;
 		res->link_substream = substream;
 	}
-	spin_unlock_irq(&bus->reg_lock);
 
 	return res;
 }
diff --git a/sound/soc/sof/intel/hda-ipc.c b/sound/soc/sof/intel/hda-ipc.c
index 94425c510861..2aef3954f4f7 100644
--- a/sound/soc/sof/intel/hda-ipc.c
+++ b/sound/soc/sof/intel/hda-ipc.c
@@ -204,13 +204,10 @@ irqreturn_t hda_dsp_ipc4_irq_thread(int irq, void *context)
 				data->primary = primary;
 				data->extension = extension;
 
-				spin_lock_irq(&sdev->ipc_lock);
-
+				guard(spinlock_irq)(&sdev->ipc_lock);
 				snd_sof_ipc_get_reply(sdev);
 				hda_dsp_ipc_host_done(sdev);
 				snd_sof_ipc_reply(sdev, data->primary);
-
-				spin_unlock_irq(&sdev->ipc_lock);
 			} else {
 				dev_dbg_ratelimited(sdev->dev,
 						    "IPC reply before FW_READY: %#x|%#x\n",
@@ -289,16 +286,12 @@ irqreturn_t hda_dsp_ipc_irq_thread(int irq, void *context)
 		 * reply.
 		 */
 		if (likely(sdev->fw_state == SOF_FW_BOOT_COMPLETE)) {
-			spin_lock_irq(&sdev->ipc_lock);
-
 			/* handle immediate reply from DSP core */
+			guard(spinlock_irq)(&sdev->ipc_lock);
 			hda_dsp_ipc_get_reply(sdev);
 			snd_sof_ipc_reply(sdev, msg);
-
 			/* set the done bit */
 			hda_dsp_ipc_dsp_done(sdev);
-
-			spin_unlock_irq(&sdev->ipc_lock);
 		} else {
 			dev_dbg_ratelimited(sdev->dev, "IPC reply before FW_READY: %#x\n",
 					    msg);
diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index 9c3b3a9aaf83..8fdaf1fdc338 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -724,12 +724,12 @@ int hda_dsp_stream_hw_free(struct snd_sof_dev *sdev,
 		struct hdac_bus *bus = sof_to_bus(sdev);
 		u32 mask = BIT(hstream->index);
 
-		spin_lock_irq(&bus->reg_lock);
+		guard(spinlock_irq)(&bus->reg_lock);
+
 		/* couple host and link DMA if link DMA channel is idle */
 		if (!hext_stream->link_locked)
 			snd_sof_dsp_update_bits(sdev, HDA_DSP_PP_BAR,
 						SOF_HDA_REG_PP_PPCTL, mask, 0);
-		spin_unlock_irq(&bus->reg_lock);
 	}
 
 	hda_dsp_stream_spib_config(sdev, hext_stream, HDA_DSP_SPIB_DISABLE, 0);
@@ -747,7 +747,7 @@ bool hda_dsp_check_stream_irq(struct snd_sof_dev *sdev)
 	u32 status;
 
 	/* The function can be called at irq thread, so use spin_lock_irq */
-	spin_lock_irq(&bus->reg_lock);
+	guard(spinlock_irq)(&bus->reg_lock);
 
 	status = snd_sof_dsp_read(sdev, HDA_DSP_HDA_BAR, SOF_HDA_INTSTS);
 
@@ -757,8 +757,6 @@ bool hda_dsp_check_stream_irq(struct snd_sof_dev *sdev)
 	if (status != 0xffffffff)
 		ret = true;
 
-	spin_unlock_irq(&bus->reg_lock);
-
 	return ret;
 }
 EXPORT_SYMBOL_NS(hda_dsp_check_stream_irq, "SND_SOC_SOF_INTEL_HDA_COMMON");
@@ -842,7 +840,7 @@ irqreturn_t hda_dsp_stream_threaded_handler(int irq, void *context)
 	 * unsolicited responses from the codec
 	 */
 	for (i = 0, active = true; i < 10 && active; i++) {
-		spin_lock_irq(&bus->reg_lock);
+		guard(spinlock_irq)(&bus->reg_lock);
 
 		status = snd_sof_dsp_read(sdev, HDA_DSP_HDA_BAR, SOF_HDA_INTSTS);
 
@@ -853,7 +851,6 @@ irqreturn_t hda_dsp_stream_threaded_handler(int irq, void *context)
 		if (status & AZX_INT_CTRL_EN) {
 			active |= hda_codec_check_rirb_status(sdev);
 		}
-		spin_unlock_irq(&bus->reg_lock);
 	}
 
 	return IRQ_HANDLED;
diff --git a/sound/soc/sof/intel/mtl.c b/sound/soc/sof/intel/mtl.c
index 095dcf1a18e4..4ac81537ca05 100644
--- a/sound/soc/sof/intel/mtl.c
+++ b/sound/soc/sof/intel/mtl.c
@@ -596,13 +596,10 @@ static irqreturn_t mtl_ipc_irq_thread(int irq, void *context)
 				data->primary = primary;
 				data->extension = extension;
 
-				spin_lock_irq(&sdev->ipc_lock);
-
+				guard(spinlock_irq)(&sdev->ipc_lock);
 				snd_sof_ipc_get_reply(sdev);
 				mtl_ipc_host_done(sdev);
 				snd_sof_ipc_reply(sdev, data->primary);
-
-				spin_unlock_irq(&sdev->ipc_lock);
 			} else {
 				dev_dbg_ratelimited(sdev->dev,
 						    "IPC reply before FW_READY: %#x|%#x\n",
-- 
2.52.0

