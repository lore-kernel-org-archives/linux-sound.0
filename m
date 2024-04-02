Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEECA126F16
	for <linux-sound@vger.kernel.org>; Tue,  2 Apr 2024 15:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712071131; cv=none; b=o/X70HJuUGSJbxBwfqtEAimGk534oEjoe0NrKOZgpTwUMxU9DYmPulRYiuZocrbwhNGUOJNah3D3JrBUAEX+4WV/7a6wURqTUnZ9Vl1go98JeM+Gs3iCpAGmwd1iVplcASaHb75pT5Mr8bj4eDS3bL6pL5IJfhpyLkIBUcIx2kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712071131; c=relaxed/simple;
	bh=O3Xjhr5i4oX12VFxWeKbSmbwSd+1rJmt2zqPFSMxbVQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T0+9JHSzzpbV3I2+rZ4cKL/Pmljr65P65zJf9uBUDvAxb/NQKy16804xEhCg5JdhejoJFoTSWUvkOseSmX7t84PylkTyXz7Ccs6qZBDw8NVTIwYPG5ot4w0b4WGcJGKJRX+J8udismy8JFplrG4o5GTrScod7kvGkeaqRf/ItoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cWk7RnIZ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cWk7RnIZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712071130; x=1743607130;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=O3Xjhr5i4oX12VFxWeKbSmbwSd+1rJmt2zqPFSMxbVQ=;
  b=cWk7RnIZbPr2SJFwX2CA12QTBWYshwrjDtnIbiNh0mjXcxjaHCS0S6CV
   pWF37rWWYkqRq8WksFuGcAQUku1faYCACXFQ6d322ShWl8wV4kL6ZY/FS
   vL1US3LaAwNdsW4otIoiIPhFZfsmz1+3dyO4BMkq1c17xox0ey9GqbNK6
   tt3FproyMM7wwNffKJ4MUCLgPB+kVMhWTAnyJ+3QYAaLnyOhI0M56MIJA
   3EZ938bqJ2hhD6tA/UhyITo02enR9gTadPvp9aq6QrGGU1uZ9yCK0CePe
   Zcdnfzl7+p4LlhXvnfnodd/1sizU0FFNlw/bGG/rQMBIWvuhWcnP//795
   A==;
X-CSE-ConnectionGUID: QjQAgy05RmqQWjuCVEwtqw==
X-CSE-MsgGUID: +91OFSgwRWCsce3emossGQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="29730251"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="29730251"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 08:18:49 -0700
X-CSE-ConnectionGUID: l4OevL10SqmZXeq5OCFxhA==
X-CSE-MsgGUID: 7l553nk0QIWtDyiIMrVUeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="22796559"
Received: from skhare-mobl5.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.8.83])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 08:18:47 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 17/17] ASoC: SOF: ipc4-topology: Save the ALH DAI index during hw_params
Date: Tue,  2 Apr 2024 10:18:28 -0500
Message-Id: <20240402151828.175002-18-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240402151828.175002-1-pierre-louis.bossart@linux.intel.com>
References: <20240402151828.175002-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

The node_id for multi-gateway ALH DAI's get overwritten with the
group_id during the DAI copier's ipc_prepare op. So, save the ALH
dai_index during the BE DAI hw_params in the dai_index field of struct
ipc4_copier and use that to set the device ID in the configuration blob.
This will avoid errors during copier init after an xrun.

Note that the dai_index is typically set in topology for DMIC/SSP, but
it's not used for ALH. Reclaiming this dai_index field to store the
node_id does not generate a conflict with topology-defined values.

Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda.c     |  1 +
 sound/soc/sof/ipc4-topology.c | 12 ++++++++++--
 sound/soc/sof/ipc4-topology.h |  1 +
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 2c64c25d6f3b..d38dc43c2f1c 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -164,6 +164,7 @@ static int sdw_params_free(struct device *dev, struct sdw_intel_stream_free_data
 		struct sof_ipc4_copier *ipc4_copier;
 
 		ipc4_copier = dai->private;
+		ipc4_copier->dai_index = 0;
 		copier_data = &ipc4_copier->data;
 
 		/* clear the node ID */
diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index e0e4f356275f..c29c1de4e925 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1732,6 +1732,8 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 			 */
 			i = 0;
 			list_for_each_entry(w, &sdev->widget_list, list) {
+				u32 node_type;
+
 				if (w->widget->sname &&
 				    strcmp(w->widget->sname, swidget->widget->sname))
 					continue;
@@ -1739,7 +1741,10 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 				dai = w->private;
 				alh_copier = (struct sof_ipc4_copier *)dai->private;
 				alh_data = &alh_copier->data;
-				blob->alh_cfg.mapping[i].device = alh_data->gtw_cfg.node_id;
+				node_type = SOF_IPC4_GET_NODE_TYPE(alh_data->gtw_cfg.node_id);
+				blob->alh_cfg.mapping[i].device = SOF_IPC4_NODE_TYPE(node_type);
+				blob->alh_cfg.mapping[i].device |=
+					SOF_IPC4_NODE_INDEX(alh_copier->dai_index);
 
 				/*
 				 * The mapping[i] device in ALH blob should be the same as the
@@ -2862,12 +2867,15 @@ static int sof_ipc4_dai_config(struct snd_sof_dev *sdev, struct snd_sof_widget *
 		/*
 		 * Do not clear the node ID when this op is invoked with
 		 * SOF_DAI_CONFIG_FLAGS_HW_FREE. It is needed to free the group_ida during
-		 * unprepare.
+		 * unprepare. The node_id for multi-gateway DAI's will be overwritten with the
+		 * group_id during copier's ipc_prepare op.
 		 */
 		if (flags & SOF_DAI_CONFIG_FLAGS_HW_PARAMS) {
+			ipc4_copier->dai_index = data->dai_node_id;
 			copier_data->gtw_cfg.node_id &= ~SOF_IPC4_NODE_INDEX_MASK;
 			copier_data->gtw_cfg.node_id |= SOF_IPC4_NODE_INDEX(data->dai_node_id);
 		}
+
 		break;
 	case SOF_DAI_INTEL_DMIC:
 	case SOF_DAI_INTEL_SSP:
diff --git a/sound/soc/sof/ipc4-topology.h b/sound/soc/sof/ipc4-topology.h
index aa5122c3721d..6e33208a357f 100644
--- a/sound/soc/sof/ipc4-topology.h
+++ b/sound/soc/sof/ipc4-topology.h
@@ -45,6 +45,7 @@
 #define SOF_IPC4_NODE_INDEX_MASK	0xFF
 #define SOF_IPC4_NODE_INDEX(x)	((x) & SOF_IPC4_NODE_INDEX_MASK)
 #define SOF_IPC4_NODE_TYPE(x)  ((x) << 8)
+#define SOF_IPC4_GET_NODE_TYPE(node_id) ((node_id) >> 8)
 
 /* Node ID for SSP type DAI copiers */
 #define SOF_IPC4_NODE_INDEX_INTEL_SSP(x) (((x) & 0xf) << 4)
-- 
2.40.1

