Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m6QaajSg"
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6405FCB
	for <linux-sound@vger.kernel.org>; Mon,  4 Dec 2023 13:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701726258; x=1733262258;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=p3+n+ae88C54uWx4bKBguX0EyLE059rZ3qRBXQqjjLQ=;
  b=m6QaajSgbuVOgkpeP128Pn5qewc2XNUyC6LJdoP69XkhDHjQkygowjnp
   E7K4iQNffaZ26MT2tTciRg5F+JvxjMnSZmt/qaxI3+2nbVGUufEf8ZHRj
   cJrv21AUWPYl3UPfzpIEtDu2iwY0u4DbUa8cFoKbr0CLJ8WFKikFFkt2U
   mofaW6NUjd8oGXnhtCGZ1FRnOow6xNIjJfGbhbOJ7IJ4tvZfutiWvQUDZ
   IMk/HNUI7dISJhew3pdCNH5KymOd+Ang+TA88fcL0kpSGH/iLQ7VQDF/+
   /Vxbx6vCLbVFWcW2AZccz3KPMQ9pbwwZUsU0rzK72coQ88NM/k0KsnjNb
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="378829556"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="378829556"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 13:44:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="841205940"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="841205940"
Received: from akashams-mobl.amr.corp.intel.com (HELO pbossart-mobl3.lan) ([10.255.231.189])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 13:44:16 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Rander Wang <rander.wang@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH] ASoC: SOF: Intel: lnl: add core get and set support for dsp core
Date: Mon,  4 Dec 2023 15:44:07 -0600
Message-Id: <20231204214407.208528-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rander Wang <rander.wang@intel.com>

Driver uses get and set ops to change the power state of dsp core.

Closes: https://github.com/thesofproject/sof/issues/8478
Signed-off-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/lnl.c | 4 ++++
 sound/soc/sof/intel/mtl.c | 4 ++--
 sound/soc/sof/intel/mtl.h | 3 +++
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/lnl.c b/sound/soc/sof/intel/lnl.c
index 03308721ebd4..a095f5bcf50d 100644
--- a/sound/soc/sof/intel/lnl.c
+++ b/sound/soc/sof/intel/lnl.c
@@ -120,6 +120,10 @@ int sof_lnl_ops_init(struct snd_sof_dev *sdev)
 
 	sof_lnl_ops.get_stream_position = mtl_dsp_get_stream_hda_link_position;
 
+	/* dsp core get/put */
+	sof_lnl_ops.core_get = mtl_dsp_core_get;
+	sof_lnl_ops.core_put = mtl_dsp_core_put;
+
 	sdev->private = kzalloc(sizeof(struct sof_ipc4_fw_data), GFP_KERNEL);
 	if (!sdev->private)
 		return -ENOMEM;
diff --git a/sound/soc/sof/intel/mtl.c b/sound/soc/sof/intel/mtl.c
index bcf963976189..d4b666f125ea 100644
--- a/sound/soc/sof/intel/mtl.c
+++ b/sound/soc/sof/intel/mtl.c
@@ -638,7 +638,7 @@ u64 mtl_dsp_get_stream_hda_link_position(struct snd_sof_dev *sdev,
 	return ((u64)llp_u << 32) | llp_l;
 }
 
-static int mtl_dsp_core_get(struct snd_sof_dev *sdev, int core)
+int mtl_dsp_core_get(struct snd_sof_dev *sdev, int core)
 {
 	const struct sof_ipc_pm_ops *pm_ops = sdev->ipc->ops->pm;
 
@@ -651,7 +651,7 @@ static int mtl_dsp_core_get(struct snd_sof_dev *sdev, int core)
 	return 0;
 }
 
-static int mtl_dsp_core_put(struct snd_sof_dev *sdev, int core)
+int mtl_dsp_core_put(struct snd_sof_dev *sdev, int core)
 {
 	const struct sof_ipc_pm_ops *pm_ops = sdev->ipc->ops->pm;
 	int ret;
diff --git a/sound/soc/sof/intel/mtl.h b/sound/soc/sof/intel/mtl.h
index 95696b3d7c4c..cc5a1f46fd09 100644
--- a/sound/soc/sof/intel/mtl.h
+++ b/sound/soc/sof/intel/mtl.h
@@ -106,3 +106,6 @@ void mtl_ipc_dump(struct snd_sof_dev *sdev);
 u64 mtl_dsp_get_stream_hda_link_position(struct snd_sof_dev *sdev,
 					 struct snd_soc_component *component,
 					 struct snd_pcm_substream *substream);
+
+int mtl_dsp_core_get(struct snd_sof_dev *sdev, int core);
+int mtl_dsp_core_put(struct snd_sof_dev *sdev, int core);
-- 
2.39.2

