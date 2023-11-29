Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GHW0HD1z"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77481D44
	for <linux-sound@vger.kernel.org>; Wed, 29 Nov 2023 04:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701262400; x=1732798400;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RwxIUDEAMlV2abnxADO+KNz5UWOsUSZv/pAFbBcJ+1Q=;
  b=GHW0HD1zJfkQaWhsiOoxhGanenvQtU4gaNkhS6vyFgnmPN9+r3UfoNM+
   YFtA1q9hcy/5wUOWnEgJhteVk8HXVMwJcfLEUxtKI0wqGT3XTTH2qAyKt
   lV8jQKP4acagiPHGdzRNWboMJIN7lmM4AFPFX5z5W7DzcuxKu0WcpGCbD
   VWNhotlpCEFOfegYqU9XXROujtGhnOTAXG3frDj0c6ICaxxEYpjff/fYm
   O8GCCwKnWOJbkiuYFs9i15k9ySYW0019T3ZFFhkhDetGKyj7Wp2/RGZZ6
   DRbdHFwGDURY8QVOYW1HHzcguQsNt8BaMp0vdevJt/4r0K7Gd5VzCIuGk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="392022969"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="392022969"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 04:53:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="17174648"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.44.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 04:53:17 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com
Subject: [PATCH 12/13] ASoC: SOF: Intel: Do not use resource managed allocation for ipc4_data
Date: Wed, 29 Nov 2023 14:53:26 +0200
Message-ID: <20231129125327.23708-13-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129125327.23708-1-peter.ujfalusi@linux.intel.com>
References: <20231129125327.23708-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Manage the ipc4_data allocation in code instead of devm since the ops_init
might be called more than once due to IPC type fallback.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/intel/apl.c     | 2 +-
 sound/soc/sof/intel/cnl.c     | 2 +-
 sound/soc/sof/intel/hda-dai.c | 3 +++
 sound/soc/sof/intel/icl.c     | 2 +-
 sound/soc/sof/intel/lnl.c     | 2 +-
 sound/soc/sof/intel/mtl.c     | 2 +-
 sound/soc/sof/intel/skl.c     | 2 +-
 sound/soc/sof/intel/tgl.c     | 2 +-
 8 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sof/intel/apl.c b/sound/soc/sof/intel/apl.c
index 776b66389c34..dee6c7f73e80 100644
--- a/sound/soc/sof/intel/apl.c
+++ b/sound/soc/sof/intel/apl.c
@@ -55,7 +55,7 @@ int sof_apl_ops_init(struct snd_sof_dev *sdev)
 	if (sdev->pdata->ipc_type == SOF_IPC_TYPE_4) {
 		struct sof_ipc4_fw_data *ipc4_data;
 
-		sdev->private = devm_kzalloc(sdev->dev, sizeof(*ipc4_data), GFP_KERNEL);
+		sdev->private = kzalloc(sizeof(*ipc4_data), GFP_KERNEL);
 		if (!sdev->private)
 			return -ENOMEM;
 
diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index 598cf50abadb..85e1e4760d0e 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -402,7 +402,7 @@ int sof_cnl_ops_init(struct snd_sof_dev *sdev)
 	if (sdev->pdata->ipc_type == SOF_IPC_TYPE_4) {
 		struct sof_ipc4_fw_data *ipc4_data;
 
-		sdev->private = devm_kzalloc(sdev->dev, sizeof(*ipc4_data), GFP_KERNEL);
+		sdev->private = kzalloc(sizeof(*ipc4_data), GFP_KERNEL);
 		if (!sdev->private)
 			return -ENOMEM;
 
diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index a20deaf3b428..f4cbc0ad5de3 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -621,6 +621,9 @@ void hda_ops_free(struct snd_sof_dev *sdev)
 
 		if (!hda_use_tplg_nhlt)
 			intel_nhlt_free(ipc4_data->nhlt);
+
+		kfree(sdev->private);
+		sdev->private = NULL;
 	}
 }
 EXPORT_SYMBOL_NS(hda_ops_free, SND_SOC_SOF_INTEL_HDA_COMMON);
diff --git a/sound/soc/sof/intel/icl.c b/sound/soc/sof/intel/icl.c
index 8e29d6bb6fe8..040698591992 100644
--- a/sound/soc/sof/intel/icl.c
+++ b/sound/soc/sof/intel/icl.c
@@ -123,7 +123,7 @@ int sof_icl_ops_init(struct snd_sof_dev *sdev)
 	if (sdev->pdata->ipc_type == SOF_IPC_TYPE_4) {
 		struct sof_ipc4_fw_data *ipc4_data;
 
-		sdev->private = devm_kzalloc(sdev->dev, sizeof(*ipc4_data), GFP_KERNEL);
+		sdev->private = kzalloc(sizeof(*ipc4_data), GFP_KERNEL);
 		if (!sdev->private)
 			return -ENOMEM;
 
diff --git a/sound/soc/sof/intel/lnl.c b/sound/soc/sof/intel/lnl.c
index db94b45e53af..03308721ebd4 100644
--- a/sound/soc/sof/intel/lnl.c
+++ b/sound/soc/sof/intel/lnl.c
@@ -120,7 +120,7 @@ int sof_lnl_ops_init(struct snd_sof_dev *sdev)
 
 	sof_lnl_ops.get_stream_position = mtl_dsp_get_stream_hda_link_position;
 
-	sdev->private = devm_kzalloc(sdev->dev, sizeof(struct sof_ipc4_fw_data), GFP_KERNEL);
+	sdev->private = kzalloc(sizeof(struct sof_ipc4_fw_data), GFP_KERNEL);
 	if (!sdev->private)
 		return -ENOMEM;
 
diff --git a/sound/soc/sof/intel/mtl.c b/sound/soc/sof/intel/mtl.c
index 3ef9e5c37028..f941e2c49d78 100644
--- a/sound/soc/sof/intel/mtl.c
+++ b/sound/soc/sof/intel/mtl.c
@@ -709,7 +709,7 @@ int sof_mtl_ops_init(struct snd_sof_dev *sdev)
 
 	sof_mtl_ops.get_stream_position = mtl_dsp_get_stream_hda_link_position;
 
-	sdev->private = devm_kzalloc(sdev->dev, sizeof(struct sof_ipc4_fw_data), GFP_KERNEL);
+	sdev->private = kzalloc(sizeof(struct sof_ipc4_fw_data), GFP_KERNEL);
 	if (!sdev->private)
 		return -ENOMEM;
 
diff --git a/sound/soc/sof/intel/skl.c b/sound/soc/sof/intel/skl.c
index d24e64e71b58..93824e6ce573 100644
--- a/sound/soc/sof/intel/skl.c
+++ b/sound/soc/sof/intel/skl.c
@@ -62,7 +62,7 @@ int sof_skl_ops_init(struct snd_sof_dev *sdev)
 	/* probe/remove/shutdown */
 	sof_skl_ops.shutdown	= hda_dsp_shutdown;
 
-	sdev->private = devm_kzalloc(sdev->dev, sizeof(*ipc4_data), GFP_KERNEL);
+	sdev->private = kzalloc(sizeof(*ipc4_data), GFP_KERNEL);
 	if (!sdev->private)
 		return -ENOMEM;
 
diff --git a/sound/soc/sof/intel/tgl.c b/sound/soc/sof/intel/tgl.c
index f7de1f5ba06d..d890cac6cb01 100644
--- a/sound/soc/sof/intel/tgl.c
+++ b/sound/soc/sof/intel/tgl.c
@@ -82,7 +82,7 @@ int sof_tgl_ops_init(struct snd_sof_dev *sdev)
 	if (sdev->pdata->ipc_type == SOF_IPC_TYPE_4) {
 		struct sof_ipc4_fw_data *ipc4_data;
 
-		sdev->private = devm_kzalloc(sdev->dev, sizeof(*ipc4_data), GFP_KERNEL);
+		sdev->private = kzalloc(sizeof(*ipc4_data), GFP_KERNEL);
 		if (!sdev->private)
 			return -ENOMEM;
 
-- 
2.43.0

