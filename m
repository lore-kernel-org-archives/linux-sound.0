Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D0442B33D
	for <linux-sound@vger.kernel.org>; Wed, 23 Sep 2026 05:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790141332; cv=none; b=BPPusFV4s3vuq+yCvAXl98TetqKBE4Nvn9dgF63K6ybvDauo0aAonCklq5K2Yug5CdGpVdbVNqqUsgXXEHI5S59gyzqrLUGmAvtJTtPLhZbUtk/SQGpSc51clEwCsc+zGGT0SaCNUsunw7WMVb9Qt19nJe7Ft4yPgGgAD++lomY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790141332; c=relaxed/simple;
	bh=6AWVvxYNDqs0TasSxkVY8YEr3MffIUmkDliXz8wxvU4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=si6nWRI5mrIAKCbgrdnRwCYinAhcseGeV1XWUJBtaxLu3fnbTSgc4+vEfqAFOwnn9CijpFVF3ZSI4eSZ7+utHebGNv4+JBD4BWMIunryyFd3JAgU6pdLmuVJ2dr0YTlwXJmLle/tWh5fYTb+VvUMiVJ7WtMrN9pDrYMEQtVDMYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GtK0njkN; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GtK0njkN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790141330; x=1821677330;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6AWVvxYNDqs0TasSxkVY8YEr3MffIUmkDliXz8wxvU4=;
  b=GtK0njkNJmD3SMmYfGyiTK4lRb5dLaxowDLHK0VRnKEeBPkBB+C5n34o
   Eltx6GNu571K22iVrcyBwwaBlsjCEiLc+Ar3efF2FKCygLnXr21fLoJwf
   P7sfv2XF6lNkL45/9oG9L68ILhk4AmHwOoX/nviXHUtsep+iRE3+8dv8h
   xWRJ3XA0oBuQ8Qzw64u+/DnO2xx2JRWp2mhu1HHvT0MnjfZCiMoCbgyfG
   XBTOa56fsEmT2yLxJ+mWNmN7nUaUOH679CFOYVyQnmHMofWy2x5/0l21+
   mw3m+vND8ffgOFEgHpflrRoboHFhiS2rFpFPZGjg9C0gvU1u48Y5AIA3X
   A==;
X-CSE-ConnectionGUID: 1m4kytfERm68EYHIcypUVw==
X-CSE-MsgGUID: ZsVvfFY3Q4OhWRtmLK9LTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="90821718"
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="90821718"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 22:28:50 -0700
X-CSE-ConnectionGUID: zZEQ7jWHTbq2T2fMb94m6g==
X-CSE-MsgGUID: 6y6+0VMERWe3BALOmNHt2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="272938506"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 22:28:48 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH v2 1/7] ASoC: SOF: get nhlt from all topologies
Date: Wed, 23 Sep 2026 13:28:26 +0800
Message-ID: <20260923052832.2392758-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923052832.2392758-1-yung-chuan.liao@linux.intel.com>
References: <20260923052832.2392758-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The existing code assumes there is only one NHLT blob either from BIOS
or topology. As function topologies are used and each function topology
contains a NHLT blob section, we need to search the matching NHLT blob
from all the NHLT blobs.
The commit suggests adding a list of NHLTs and search the NHLTs from the
list.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/sof/intel/apl.c     |  1 +
 sound/soc/sof/intel/cnl.c     |  1 +
 sound/soc/sof/intel/hda-dai.c | 26 +++++++++++++--
 sound/soc/sof/intel/icl.c     |  1 +
 sound/soc/sof/intel/mtl.c     |  1 +
 sound/soc/sof/intel/skl.c     |  1 +
 sound/soc/sof/intel/tgl.c     |  1 +
 sound/soc/sof/ipc4-priv.h     | 10 ++++--
 sound/soc/sof/ipc4-topology.c | 63 ++++++++++++++++++++++++-----------
 9 files changed, 80 insertions(+), 25 deletions(-)

diff --git a/sound/soc/sof/intel/apl.c b/sound/soc/sof/intel/apl.c
index b0072601181e..753da09301fa 100644
--- a/sound/soc/sof/intel/apl.c
+++ b/sound/soc/sof/intel/apl.c
@@ -59,6 +59,7 @@ int sof_apl_ops_init(struct snd_sof_dev *sdev)
 			return -ENOMEM;
 
 		ipc4_data = sdev->private;
+		INIT_LIST_HEAD(&ipc4_data->nhlt_list);
 		ipc4_data->manifest_fw_hdr_offset = SOF_MAN4_FW_HDR_OFFSET;
 
 		ipc4_data->mtrace_type = SOF_IPC4_MTRACE_INTEL_CAVS_1_5;
diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index 660c1475e5a4..ec33cd18e669 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -406,6 +406,7 @@ int sof_cnl_ops_init(struct snd_sof_dev *sdev)
 			return -ENOMEM;
 
 		ipc4_data = sdev->private;
+		INIT_LIST_HEAD(&ipc4_data->nhlt_list);
 		ipc4_data->manifest_fw_hdr_offset = SOF_MAN4_FW_HDR_OFFSET;
 
 		ipc4_data->mtrace_type = SOF_IPC4_MTRACE_INTEL_CAVS_1_8;
diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index bb44d4f8a4da..c8729b6d82bd 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -760,8 +760,20 @@ void hda_set_dai_drv_ops(struct snd_sof_dev *sdev, struct snd_sof_dsp_ops *ops)
 
 	if (sdev->pdata->ipc_type == SOF_IPC_TYPE_4 && !hda_use_tplg_nhlt) {
 		struct sof_ipc4_fw_data *ipc4_data = sdev->private;
+		struct snd_ipc4_nhlt *entry;
 
-		ipc4_data->nhlt = intel_nhlt_init(sdev->dev);
+		entry = devm_kzalloc(sdev->dev, sizeof(*entry), GFP_KERNEL);
+		if (!entry)
+			return;
+
+		entry->nhlt = intel_nhlt_init(sdev->dev);
+		if (!entry->nhlt) {
+			devm_kfree(sdev->dev, entry);
+			return;
+		}
+
+		entry->from_acpi = true;
+		list_add(&entry->list, &ipc4_data->nhlt_list);
 	}
 }
 EXPORT_SYMBOL_NS(hda_set_dai_drv_ops, "SND_SOC_SOF_INTEL_HDA_COMMON");
@@ -770,9 +782,17 @@ void hda_ops_free(struct snd_sof_dev *sdev)
 {
 	if (sdev->pdata->ipc_type == SOF_IPC_TYPE_4) {
 		struct sof_ipc4_fw_data *ipc4_data = sdev->private;
+		struct snd_ipc4_nhlt *entry;
+		struct snd_ipc4_nhlt *tmp;
 
-		if (!hda_use_tplg_nhlt)
-			intel_nhlt_free(ipc4_data->nhlt);
+		if (!hda_use_tplg_nhlt) {
+			list_for_each_entry_safe(entry, tmp, &ipc4_data->nhlt_list, list) {
+				if (entry->from_acpi && entry->nhlt)
+					intel_nhlt_free(entry->nhlt);
+
+				list_del(&entry->list);
+			}
+		}
 
 		kfree(sdev->private);
 		sdev->private = NULL;
diff --git a/sound/soc/sof/intel/icl.c b/sound/soc/sof/intel/icl.c
index 549bb4ca73e1..196caba14be0 100644
--- a/sound/soc/sof/intel/icl.c
+++ b/sound/soc/sof/intel/icl.c
@@ -131,6 +131,7 @@ int sof_icl_ops_init(struct snd_sof_dev *sdev)
 			return -ENOMEM;
 
 		ipc4_data = sdev->private;
+		INIT_LIST_HEAD(&ipc4_data->nhlt_list);
 		ipc4_data->manifest_fw_hdr_offset = SOF_MAN4_FW_HDR_OFFSET;
 
 		ipc4_data->mtrace_type = SOF_IPC4_MTRACE_INTEL_CAVS_2;
diff --git a/sound/soc/sof/intel/mtl.c b/sound/soc/sof/intel/mtl.c
index 3d67d6777f1b..2506506f813a 100644
--- a/sound/soc/sof/intel/mtl.c
+++ b/sound/soc/sof/intel/mtl.c
@@ -762,6 +762,7 @@ int sof_mtl_set_ops(struct snd_sof_dev *sdev, struct snd_sof_dsp_ops *dsp_ops)
 		return -ENOMEM;
 
 	ipc4_data = sdev->private;
+	INIT_LIST_HEAD(&ipc4_data->nhlt_list);
 	ipc4_data->manifest_fw_hdr_offset = SOF_MAN4_FW_HDR_OFFSET;
 
 	ipc4_data->mtrace_type = SOF_IPC4_MTRACE_INTEL_CAVS_2;
diff --git a/sound/soc/sof/intel/skl.c b/sound/soc/sof/intel/skl.c
index 90519ebd3168..f831143a7afc 100644
--- a/sound/soc/sof/intel/skl.c
+++ b/sound/soc/sof/intel/skl.c
@@ -67,6 +67,7 @@ int sof_skl_ops_init(struct snd_sof_dev *sdev)
 		return -ENOMEM;
 
 	ipc4_data = sdev->private;
+	INIT_LIST_HEAD(&ipc4_data->nhlt_list);
 	ipc4_data->manifest_fw_hdr_offset = SOF_MAN4_FW_HDR_OFFSET_CAVS_1_5;
 
 	ipc4_data->mtrace_type = SOF_IPC4_MTRACE_INTEL_CAVS_1_5;
diff --git a/sound/soc/sof/intel/tgl.c b/sound/soc/sof/intel/tgl.c
index 7936361e2e39..09a8a4a2b017 100644
--- a/sound/soc/sof/intel/tgl.c
+++ b/sound/soc/sof/intel/tgl.c
@@ -95,6 +95,7 @@ int sof_tgl_ops_init(struct snd_sof_dev *sdev)
 			return -ENOMEM;
 
 		ipc4_data = sdev->private;
+		INIT_LIST_HEAD(&ipc4_data->nhlt_list);
 		ipc4_data->manifest_fw_hdr_offset = SOF_MAN4_FW_HDR_OFFSET;
 
 		ipc4_data->mtrace_type = SOF_IPC4_MTRACE_INTEL_CAVS_2;
diff --git a/sound/soc/sof/ipc4-priv.h b/sound/soc/sof/ipc4-priv.h
index a8cdf9bc750b..61dd48282dd3 100644
--- a/sound/soc/sof/ipc4-priv.h
+++ b/sound/soc/sof/ipc4-priv.h
@@ -58,13 +58,18 @@ struct sof_ipc4_fw_library {
 	struct sof_ipc4_fw_module *modules;
 };
 
+struct snd_ipc4_nhlt {
+	struct list_head list;
+	void *nhlt;
+	bool from_acpi;
+};
+
 /**
  * struct sof_ipc4_fw_data - IPC4-specific data
  * @manifest_fw_hdr_offset: FW header offset in the manifest
  * @fw_lib_xa: XArray for firmware libraries, including basefw (ID = 0)
  *	       Used to store the FW libraries and to manage the unique IDs of the
  *	       libraries.
- * @nhlt: NHLT table either from the BIOS or the topology manifest
  * @mtrace_type: mtrace type supported on the booted platform
  * @mtrace_log_bytes: log bytes as reported by the firmware via fw_config reply
  * @num_playback_streams: max number of playback DMAs, needed for CHAIN_DMA offset
@@ -74,6 +79,7 @@ struct sof_ipc4_fw_library {
  *		    base firmware
  * @fw_context_save: Firmware supports full context save and restore
  * @libraries_restored: The libraries have been retained during firmware boot
+ * @nhlt_list: The NHLT tables from the BIOS and the topology manifest
  *
  * @load_library: Callback function for platform dependent library loading
  * @pipeline_state_mutex: Mutex to protect pipeline triggers, ref counts, states and deletion
@@ -81,7 +87,6 @@ struct sof_ipc4_fw_library {
 struct sof_ipc4_fw_data {
 	u32 manifest_fw_hdr_offset;
 	struct xarray fw_lib_xa;
-	void *nhlt;
 	enum sof_ipc4_mtrace_type mtrace_type;
 	u32 mtrace_log_bytes;
 	int num_playback_streams;
@@ -90,6 +95,7 @@ struct sof_ipc4_fw_data {
 	u32 max_libs_count;
 	bool fw_context_save;
 	bool libraries_restored;
+	struct list_head nhlt_list;
 
 	int (*load_library)(struct snd_sof_dev *sdev,
 			    struct sof_ipc4_fw_library *fw_lib, bool reload);
diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 24a1175dd690..f6617dcbf789 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1844,12 +1844,13 @@ snd_sof_get_nhlt_endpoint_data(struct snd_sof_dev *sdev, struct snd_sof_dai *dai
 			       u32 linktype, u8 dir, u32 **dst, u32 *len)
 {
 	struct sof_ipc4_fw_data *ipc4_data = sdev->private;
-	struct nhlt_specific_cfg *cfg;
+	struct nhlt_specific_cfg *cfg = NULL;
+	struct snd_ipc4_nhlt *entry = NULL;
 	int sample_rate, channel_count;
 	bool format_change = false;
 	int bit_depth, ret;
 	u32 nhlt_type;
-	int dev_type = 0;
+	int dev_type = -EINVAL;
 
 	/* convert to NHLT type */
 	switch (linktype) {
@@ -1880,10 +1881,17 @@ snd_sof_get_nhlt_endpoint_data(struct snd_sof_dev *sdev, struct snd_sof_dai *dai
 		 * Query the type for the port and then pass that information back
 		 * to the blob lookup function.
 		 */
-		dev_type = intel_nhlt_ssp_device_type(sdev->dev, ipc4_data->nhlt,
-						      dai_index);
-		if (dev_type < 0)
+		list_for_each_entry(entry, &ipc4_data->nhlt_list, list) {
+			dev_type = intel_nhlt_ssp_device_type(sdev->dev, entry->nhlt,
+							      dai_index);
+			if (dev_type >= 0)
+				break;
+		}
+		if (dev_type < 0) {
+			dev_err(sdev->dev, "%s: No match for SSP%d in NHLT table\n",
+				__func__, dai_index);
 			return dev_type;
+		}
 		break;
 	default:
 		return 0;
@@ -1893,9 +1901,14 @@ snd_sof_get_nhlt_endpoint_data(struct snd_sof_dev *sdev, struct snd_sof_dai *dai
 		dai_index, nhlt_type, dir, dev_type);
 
 	/* find NHLT blob with matching params */
-	cfg = intel_nhlt_get_endpoint_blob(sdev->dev, ipc4_data->nhlt, dai_index, nhlt_type,
-					   bit_depth, bit_depth, channel_count, sample_rate,
-					   dir, dev_type);
+	list_for_each_entry(entry, &ipc4_data->nhlt_list, list) {
+		cfg = intel_nhlt_get_endpoint_blob(sdev->dev, entry->nhlt, dai_index,
+						   nhlt_type, bit_depth, bit_depth,
+						   channel_count, sample_rate, dir,
+						   dev_type);
+		if (cfg)
+			break;
+	}
 
 	if (!cfg) {
 		bool get_new_blob = false;
@@ -1929,13 +1942,15 @@ snd_sof_get_nhlt_endpoint_data(struct snd_sof_dev *sdev, struct snd_sof_dai *dai
 		}
 
 		if (get_new_blob) {
-			cfg = intel_nhlt_get_endpoint_blob(sdev->dev, ipc4_data->nhlt,
-							   dai_index, nhlt_type,
-							   bit_depth, bit_depth,
-							   channel_count, sample_rate,
-							   dir, dev_type);
-			if (cfg)
-				goto out;
+			list_for_each_entry(entry, &ipc4_data->nhlt_list, list) {
+				cfg = intel_nhlt_get_endpoint_blob(sdev->dev, entry->nhlt,
+								   dai_index, nhlt_type,
+								   bit_depth, bit_depth,
+								   channel_count, sample_rate,
+								   dir, dev_type);
+				if (cfg)
+					goto out;
+			}
 		}
 
 		dev_err(sdev->dev,
@@ -4069,6 +4084,7 @@ static int sof_ipc4_parse_manifest(struct snd_soc_component *scomp, int index,
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	struct sof_ipc4_fw_data *ipc4_data = sdev->private;
 	struct sof_manifest_tlv *manifest_tlv;
+	struct snd_ipc4_nhlt *tplg_nhlt;
 	struct sof_manifest *manifest;
 	u32 size = le32_to_cpu(man->priv.size);
 	u8 *man_ptr = man->priv.data;
@@ -4104,13 +4120,20 @@ static int sof_ipc4_parse_manifest(struct snd_soc_component *scomp, int index,
 
 		switch (le32_to_cpu(manifest_tlv->type)) {
 		case SOF_MANIFEST_DATA_TYPE_NHLT:
-			/* no NHLT in BIOS, so use the one from topology manifest */
-			if (ipc4_data->nhlt)
-				break;
-			ipc4_data->nhlt = devm_kmemdup(sdev->dev, manifest_tlv->data,
+			/* Get the nhlt from topology manifest */
+			tplg_nhlt = devm_kzalloc(sdev->dev, sizeof(*tplg_nhlt), GFP_KERNEL);
+			if (!tplg_nhlt)
+				return -ENOMEM;
+
+			tplg_nhlt->nhlt = devm_kmemdup(sdev->dev, manifest_tlv->data,
 						       le32_to_cpu(manifest_tlv->size), GFP_KERNEL);
-			if (!ipc4_data->nhlt)
+			if (!tplg_nhlt->nhlt)
 				return -ENOMEM;
+
+			tplg_nhlt->from_acpi = false;
+
+			list_add(&tplg_nhlt->list, &ipc4_data->nhlt_list);
+
 			break;
 		default:
 			dev_warn(scomp->dev, "Skipping unknown manifest data type %d\n",
-- 
2.43.0

