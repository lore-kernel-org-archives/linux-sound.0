Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058FC946C
	for <linux-sound@vger.kernel.org>; Thu,  6 Mar 2025 13:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741268099; cv=none; b=i+72HvBuRMKYZq5e2JRfk5ttblCHZd+w71KNjHTvRnMQeUP2J0d6K5+l47UGJiplwnMM71WTCFw0vYm8a4W5zQSYsd0QW2t8tFct9EbFPbn1F3n4Tji2EOYRvUO/pbCs2dTGon8SCr/z3Zn9K39myX3M2XOOI3zfBX9B7U7lGdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741268099; c=relaxed/simple;
	bh=ca0s4t0ebxS3WZU77K+j1lldfwDrdZR+CkartVxDWjw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SdrljL/nNWRvY5xkzMw3Z014qn4xtnm8Tm21tSB1YFlir3hG/oy9qpkFGuTMo/20hK4I2Ez9JiiYIuN5FT8cNfVeX8Fy24XpuKa3yFWsiprljCIdY+2EX5WA5al+J9pNlugiaxrYWjQsv7t9fc6KhanpQ+c3l+3mW0oF4yX8Wj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K6ISG1j4; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K6ISG1j4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741268098; x=1772804098;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ca0s4t0ebxS3WZU77K+j1lldfwDrdZR+CkartVxDWjw=;
  b=K6ISG1j4rUrz9lqJ8uLOKcKA/PyiQs7mOLiF74zODE8kppSa+3O/qL5w
   +K1Hw8f/SQYpKZl3onOYkgf5IkNBNRG4AcL+8cRApfh3tBH0/ie10FDKh
   QDnJaDUPeHDqniMDf69Gu1/XY2nL9WFin3aJ4rppzyf4zmltTMSfLy9Ek
   ZH4/LKc1tbEJNLOmf3wBNFrEkAlzxgiX3RWyydeETmaF9sR2VBC52a/ys
   pL9nSUl2wApG5dg72eaMpd89e9qnSKMIo4yRXzKti9LhoJ1d97Qx9HboJ
   ZBgswBoop9P/Ps08JVzXjN51XUuCYNMQFVst8C39+nRJDTEd145FE0H0I
   A==;
X-CSE-ConnectionGUID: t5/7+JBjQxKV6MXzqA655Q==
X-CSE-MsgGUID: eP/EaRD2RYq5E/XyV84paA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42164674"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="42164674"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 05:34:58 -0800
X-CSE-ConnectionGUID: wWYc45KoSI+wXYe+Pu7l3w==
X-CSE-MsgGUID: l/8po2pHT3Ww893xOBxqAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119538962"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.249.86])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 05:34:54 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com
Subject: [PATCH 1/8] ASoC: SOF: Intel: mtl: Split up dsp_ops setup code
Date: Thu,  6 Mar 2025 15:35:20 +0200
Message-ID: <20250306133527.16722-2-peter.ujfalusi@linux.intel.com>
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

Move the sof_mtl_ops and sof_mtl_ops_init() to pci-mtl.c as local static
and add a 'generic' sof_mtl_set_ops() function as replacement exported
function to fill the dsp_ops structure.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/intel/hda.h     |  2 --
 sound/soc/sof/intel/mtl.c     | 44 +++++++++++++++++------------------
 sound/soc/sof/intel/mtl.h     |  2 ++
 sound/soc/sof/intel/pci-mtl.c |  8 +++++++
 4 files changed, 31 insertions(+), 25 deletions(-)

diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index ee4ccc1a5490..92b7402e752e 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -913,8 +913,6 @@ extern struct snd_sof_dsp_ops sof_tgl_ops;
 int sof_tgl_ops_init(struct snd_sof_dev *sdev);
 extern struct snd_sof_dsp_ops sof_icl_ops;
 int sof_icl_ops_init(struct snd_sof_dev *sdev);
-extern struct snd_sof_dsp_ops sof_mtl_ops;
-int sof_mtl_ops_init(struct snd_sof_dev *sdev);
 extern struct snd_sof_dsp_ops sof_lnl_ops;
 int sof_lnl_ops_init(struct snd_sof_dev *sdev);
 
diff --git a/sound/soc/sof/intel/mtl.c b/sound/soc/sof/intel/mtl.c
index 4a6b1d56171e..ec563214dd1a 100644
--- a/sound/soc/sof/intel/mtl.c
+++ b/sound/soc/sof/intel/mtl.c
@@ -712,43 +712,40 @@ int mtl_dsp_core_put(struct snd_sof_dev *sdev, int core)
 }
 EXPORT_SYMBOL_NS(mtl_dsp_core_put, "SND_SOC_SOF_INTEL_MTL");
 
-/* Meteorlake ops */
-struct snd_sof_dsp_ops sof_mtl_ops;
-
-int sof_mtl_ops_init(struct snd_sof_dev *sdev)
+int sof_mtl_set_ops(struct snd_sof_dev *sdev, struct snd_sof_dsp_ops *dsp_ops)
 {
 	struct sof_ipc4_fw_data *ipc4_data;
 
 	/* common defaults */
-	memcpy(&sof_mtl_ops, &sof_hda_common_ops, sizeof(struct snd_sof_dsp_ops));
+	memcpy(dsp_ops, &sof_hda_common_ops, sizeof(struct snd_sof_dsp_ops));
 
 	/* shutdown */
-	sof_mtl_ops.shutdown = hda_dsp_shutdown;
+	dsp_ops->shutdown = hda_dsp_shutdown;
 
 	/* doorbell */
-	sof_mtl_ops.irq_thread = mtl_ipc_irq_thread;
+	dsp_ops->irq_thread = mtl_ipc_irq_thread;
 
 	/* ipc */
-	sof_mtl_ops.send_msg = mtl_ipc_send_msg;
-	sof_mtl_ops.get_mailbox_offset = mtl_dsp_ipc_get_mailbox_offset;
-	sof_mtl_ops.get_window_offset = mtl_dsp_ipc_get_window_offset;
+	dsp_ops->send_msg = mtl_ipc_send_msg;
+	dsp_ops->get_mailbox_offset = mtl_dsp_ipc_get_mailbox_offset;
+	dsp_ops->get_window_offset = mtl_dsp_ipc_get_window_offset;
 
 	/* debug */
-	sof_mtl_ops.debug_map = mtl_dsp_debugfs;
-	sof_mtl_ops.debug_map_count = ARRAY_SIZE(mtl_dsp_debugfs);
-	sof_mtl_ops.dbg_dump = mtl_dsp_dump;
-	sof_mtl_ops.ipc_dump = mtl_ipc_dump;
+	dsp_ops->debug_map = mtl_dsp_debugfs;
+	dsp_ops->debug_map_count = ARRAY_SIZE(mtl_dsp_debugfs);
+	dsp_ops->dbg_dump = mtl_dsp_dump;
+	dsp_ops->ipc_dump = mtl_ipc_dump;
 
 	/* pre/post fw run */
-	sof_mtl_ops.pre_fw_run = mtl_dsp_pre_fw_run;
-	sof_mtl_ops.post_fw_run = mtl_dsp_post_fw_run;
+	dsp_ops->pre_fw_run = mtl_dsp_pre_fw_run;
+	dsp_ops->post_fw_run = mtl_dsp_post_fw_run;
 
 	/* parse platform specific extended manifest */
-	sof_mtl_ops.parse_platform_ext_manifest = NULL;
+	dsp_ops->parse_platform_ext_manifest = NULL;
 
 	/* dsp core get/put */
-	sof_mtl_ops.core_get = mtl_dsp_core_get;
-	sof_mtl_ops.core_put = mtl_dsp_core_put;
+	dsp_ops->core_get = mtl_dsp_core_get;
+	dsp_ops->core_put = mtl_dsp_core_put;
 
 	sdev->private = kzalloc(sizeof(struct sof_ipc4_fw_data), GFP_KERNEL);
 	if (!sdev->private)
@@ -764,13 +761,14 @@ int sof_mtl_ops_init(struct snd_sof_dev *sdev)
 	/* External library loading support */
 	ipc4_data->load_library = hda_dsp_ipc4_load_library;
 
-	/* set DAI ops */
-	hda_set_dai_drv_ops(sdev, &sof_mtl_ops);
+	dsp_ops->set_power_state = hda_dsp_set_power_state_ipc4;
 
-	sof_mtl_ops.set_power_state = hda_dsp_set_power_state_ipc4;
+	/* set DAI ops */
+	hda_set_dai_drv_ops(sdev, dsp_ops);
 
 	return 0;
-};
+}
+EXPORT_SYMBOL_NS(sof_mtl_set_ops, "SND_SOC_SOF_INTEL_MTL");
 
 const struct sof_intel_dsp_desc mtl_chip_info = {
 	.cores_num = 3,
diff --git a/sound/soc/sof/intel/mtl.h b/sound/soc/sof/intel/mtl.h
index 9ab4b21c960e..4d098dae2973 100644
--- a/sound/soc/sof/intel/mtl.h
+++ b/sound/soc/sof/intel/mtl.h
@@ -145,3 +145,5 @@ void mtl_ipc_dump(struct snd_sof_dev *sdev);
 
 int mtl_dsp_core_get(struct snd_sof_dev *sdev, int core);
 int mtl_dsp_core_put(struct snd_sof_dev *sdev, int core);
+
+int sof_mtl_set_ops(struct snd_sof_dev *sdev, struct snd_sof_dsp_ops *dsp_ops);
diff --git a/sound/soc/sof/intel/pci-mtl.c b/sound/soc/sof/intel/pci-mtl.c
index 71f711cf8599..c5048a4a56be 100644
--- a/sound/soc/sof/intel/pci-mtl.c
+++ b/sound/soc/sof/intel/pci-mtl.c
@@ -20,6 +20,14 @@
 #include "hda.h"
 #include "mtl.h"
 
+/* Meteorlake ops */
+static struct snd_sof_dsp_ops sof_mtl_ops;
+
+static int sof_mtl_ops_init(struct snd_sof_dev *sdev)
+{
+	return sof_mtl_set_ops(sdev, &sof_mtl_ops);
+}
+
 static const struct sof_dev_desc mtl_desc = {
 	.use_acpi_target_states	= true,
 	.machines               = snd_soc_acpi_intel_mtl_machines,
-- 
2.48.1

