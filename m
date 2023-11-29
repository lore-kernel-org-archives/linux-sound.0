Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PbhuUjYi"
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A98F9170B
	for <linux-sound@vger.kernel.org>; Wed, 29 Nov 2023 04:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701260522; x=1732796522;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+h/1jrB8qMUMeoBFiHU2NC+s08NbthFNAtV/926NzjQ=;
  b=PbhuUjYioqHotoilnsqew65OUfJ1f+Bw6F+ZJehz4SYwdDv9sIWNpGcQ
   1NkOmUAANl+o0Jssrdf5efR9+2AELIalXhw5l7EHrxlNE2RqvtSA0eptn
   bysR+ZNFQhZAnXKJ6Kurvw5VDXNLrWcIEzo2kfCxim9mR1G3VDdohNThl
   Wng7aymRNpFT954vAfUbW1OrFV0+yC3cxQiRyCVNijHW7MJGasDyI7wqF
   2w9MPUJQg1TNrpcwHCVPOhPUt67tsV1OTPjmg77pjQQOOdVqg4u//fWf5
   O2CmIYoOFD2AUA4MGLutKw5TDtlZjzI1O5L4sHYyOTf2/tPirCAkC7Gl3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="397051475"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="397051475"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 04:22:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="718746647"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="718746647"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.44.16])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 04:21:59 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	baofeng.tian@intel.com,
	chao.song@linux.intel.com
Subject: [PATCH] ASoC: SOF: ipc4-topology: Add module ID print during module set up
Date: Wed, 29 Nov 2023 14:22:34 +0200
Message-ID: <20231129122234.14515-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Baofeng Tian <baofeng.tian@intel.com>

This module ID will be used for module performance automatic analysis
for different modules, module name, module ID and module instance ID
will be combined as a new generated ID for current module, this ID
will be further used by analysis tools to identify current module.

Take below case as example:
0x030006 gain.11.1
3 is module instance ID, 6 is module ID and gain.11.1 is module name.

For pipeline widget print, keep as it is.

Signed-off-by: Baofeng Tian <baofeng.tian@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Chao Song <chao.song@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index b89065abb511..01f3f56495cd 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -2392,6 +2392,8 @@ static int sof_ipc4_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget
 	}
 
 	if (swidget->id != snd_soc_dapm_scheduler) {
+		int module_id = msg->primary & SOF_IPC4_MOD_ID_MASK;
+
 		ret = sof_ipc4_widget_assign_instance_id(sdev, swidget);
 		if (ret < 0) {
 			dev_err(sdev->dev, "failed to assign instance id for %s\n",
@@ -2407,9 +2409,15 @@ static int sof_ipc4_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget
 
 		msg->extension &= ~SOF_IPC4_MOD_EXT_PPL_ID_MASK;
 		msg->extension |= SOF_IPC4_MOD_EXT_PPL_ID(pipe_widget->instance_id);
+
+		dev_dbg(sdev->dev, "Create widget %s (pipe %d) - ID %d, instance %d, core %d\n",
+			swidget->widget->name, swidget->pipeline_id, module_id,
+			swidget->instance_id, swidget->core);
+	} else {
+		dev_dbg(sdev->dev, "Create pipeline %s (pipe %d) - instance %d, core %d\n",
+			swidget->widget->name, swidget->pipeline_id,
+			swidget->instance_id, swidget->core);
 	}
-	dev_dbg(sdev->dev, "Create widget %s instance %d - pipe %d - core %d\n",
-		swidget->widget->name, swidget->instance_id, swidget->pipeline_id, swidget->core);
 
 	msg->data_size = ipc_size;
 	msg->data_ptr = ipc_data;
-- 
2.43.0

