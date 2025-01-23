Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9CF2116ED
	for <linux-sound@vger.kernel.org>; Thu, 23 Jan 2025 16:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737649400; cv=none; b=d2xoccmOKLNGgGoGCeQoQZ8cZ2Zq70pdZFTNVvfvj2r1JyMVA9lMA6V73RuKlj2VkD79ymAbdeP85rkHwiQSC4jrE3S+zKVGs6jW6Wfr0JkGUwDdNIr+BXcQp1nv8KAg5d8a3guYycuirudOCGTxG6vboGu///T+PTgly6BR4Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737649400; c=relaxed/simple;
	bh=FaUdIe8pMgEeyYSpc0pzx+UXJIxA2QinYRqwfuII/NM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FyF2/tBMm3lg+jDeJ8TCTf1dFxhMsWLxSrilIYxS9SJnUR+tQcvmpDeRXlIlIugUQA5P4UnZD2dFQAaysJsPVMUm3BP459xUk3rKDMGI1LONm66aa3SFM3gI6jowJTYfWZ5OlqsZ1NkX/ZniBB9gTwiEl9FwTm7bi+tbiEzpDtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D2HaU8v1; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D2HaU8v1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737649400; x=1769185400;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FaUdIe8pMgEeyYSpc0pzx+UXJIxA2QinYRqwfuII/NM=;
  b=D2HaU8v1e/n/mQW+rsLEoBschYWgham3kr5Eno8UvcIMgGr5nDPSWUdx
   bnckxHl9xrIqn+F4x30rncg10cd1J9fY1qe3hsS6xuVxL1rwsWaFB6WdJ
   0giJxlTq51Ie+/2Geh+8H5xYQvl3NFY9dZ0cikWhdi+B3JFHRvmlYkQdl
   Cd7XTqYiZ3pGZip5Ad1IeDpnPD2ZE+pG4dj96dzaU5U1AIFsbEu/jjnnU
   r/t79Q5iWLKIHqQFz1qBeSKmHH1PKH6AvInqO4OHtWryjhY7Vtn/3ZHL+
   VC94sccA/pBXU3RW7HTbv7lIUauSK81Xv8yzaegtMueKiBbSsn6Rt4W1A
   Q==;
X-CSE-ConnectionGUID: S68evhLLSWCrQVREGCKnoQ==
X-CSE-MsgGUID: 2PLveUqkRQuoN5HlOYNe2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="55572572"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="55572572"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 08:23:19 -0800
X-CSE-ConnectionGUID: LJe+tUNhS0yolaGFglHBBw==
X-CSE-MsgGUID: LjS0zvAwRzCgnogfNx1BvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107346816"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa010.jf.intel.com with ESMTP; 23 Jan 2025 08:23:16 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	shenghao-ding@ti.com,
	kevin-lu@ti.com,
	baojun.xu@ti.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 09/11] ASoC: Intel: avs: Remove unused gateway configuration code
Date: Thu, 23 Jan 2025 17:36:32 +0100
Message-Id: <20250123163634.1451237-10-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250123163634.1451237-1-cezary.rojewski@intel.com>
References: <20250123163634.1451237-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch to new copier module constructor and remove code that becomes
unused because of that.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/path.c     | 149 +--------------------------------
 sound/soc/intel/avs/topology.h |   2 -
 2 files changed, 1 insertion(+), 150 deletions(-)

diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
index 698a3d542244..cfa19e4820d2 100644
--- a/sound/soc/intel/avs/path.c
+++ b/sound/soc/intel/avs/path.c
@@ -231,7 +231,7 @@ static int avs_fill_gtw_config(struct avs_dev *adev, struct avs_copier_gtw_cfg *
 	return 0;
 }
 
-static __maybe_unused int avs_copier_create2(struct avs_dev *adev, struct avs_path_module *mod)
+static int avs_copier_create(struct avs_dev *adev, struct avs_path_module *mod)
 {
 	struct avs_tplg_module *t = mod->template;
 	struct avs_tplg_modcfg_ext *te;
@@ -265,153 +265,6 @@ static __maybe_unused int avs_copier_create2(struct avs_dev *adev, struct avs_pa
 	return ret;
 }
 
-__maybe_unused
-static bool avs_dma_type_is_host(u32 dma_type)
-{
-	return dma_type == AVS_DMA_HDA_HOST_OUTPUT ||
-	       dma_type == AVS_DMA_HDA_HOST_INPUT;
-}
-
-__maybe_unused
-static bool avs_dma_type_is_link(u32 dma_type)
-{
-	return !avs_dma_type_is_host(dma_type);
-}
-
-__maybe_unused
-static bool avs_dma_type_is_output(u32 dma_type)
-{
-	return dma_type == AVS_DMA_HDA_HOST_OUTPUT ||
-	       dma_type == AVS_DMA_HDA_LINK_OUTPUT ||
-	       dma_type == AVS_DMA_I2S_LINK_OUTPUT;
-}
-
-__maybe_unused
-static bool avs_dma_type_is_input(u32 dma_type)
-{
-	return !avs_dma_type_is_output(dma_type);
-}
-
-static int avs_copier_create(struct avs_dev *adev, struct avs_path_module *mod)
-{
-	struct avs_tplg_module *t = mod->template;
-	struct avs_copier_cfg *cfg;
-	struct acpi_nhlt_format_config *ep_blob;
-	struct acpi_nhlt_endpoint *ep;
-	union avs_connector_node_id node_id = {0};
-	size_t cfg_size, data_size;
-	void *data = NULL;
-	u32 dma_type;
-	int ret;
-
-	data_size = sizeof(cfg->gtw_cfg.config);
-	dma_type = t->cfg_ext->copier.dma_type;
-	node_id.dma_type = dma_type;
-
-	switch (dma_type) {
-		struct avs_audio_format *fmt;
-		int direction;
-
-	case AVS_DMA_I2S_LINK_OUTPUT:
-	case AVS_DMA_I2S_LINK_INPUT:
-		if (avs_dma_type_is_input(dma_type))
-			direction = SNDRV_PCM_STREAM_CAPTURE;
-		else
-			direction = SNDRV_PCM_STREAM_PLAYBACK;
-
-		if (t->cfg_ext->copier.blob_fmt)
-			fmt = t->cfg_ext->copier.blob_fmt;
-		else if (direction == SNDRV_PCM_STREAM_CAPTURE)
-			fmt = t->in_fmt;
-		else
-			fmt = t->cfg_ext->copier.out_fmt;
-
-		ep = acpi_nhlt_find_endpoint(ACPI_NHLT_LINKTYPE_SSP,
-					     ACPI_NHLT_DEVICETYPE_CODEC, direction,
-					     t->cfg_ext->copier.vindex.i2s.instance);
-		ep_blob = acpi_nhlt_endpoint_find_fmtcfg(ep, fmt->num_channels, fmt->sampling_freq,
-							 fmt->valid_bit_depth, fmt->bit_depth);
-		if (!ep_blob) {
-			dev_err(adev->dev, "no I2S ep_blob found\n");
-			return -ENOENT;
-		}
-
-		data = ep_blob->config.capabilities;
-		data_size = ep_blob->config.capabilities_size;
-		/* I2S gateway's vindex is statically assigned in topology */
-		node_id.vindex = t->cfg_ext->copier.vindex.val;
-
-		break;
-
-	case AVS_DMA_DMIC_LINK_INPUT:
-		direction = SNDRV_PCM_STREAM_CAPTURE;
-
-		if (t->cfg_ext->copier.blob_fmt)
-			fmt = t->cfg_ext->copier.blob_fmt;
-		else
-			fmt = t->in_fmt;
-
-		ep = acpi_nhlt_find_endpoint(ACPI_NHLT_LINKTYPE_PDM, -1, direction, 0);
-		ep_blob = acpi_nhlt_endpoint_find_fmtcfg(ep, fmt->num_channels, fmt->sampling_freq,
-							 fmt->valid_bit_depth, fmt->bit_depth);
-		if (!ep_blob) {
-			dev_err(adev->dev, "no DMIC ep_blob found\n");
-			return -ENOENT;
-		}
-
-		data = ep_blob->config.capabilities;
-		data_size = ep_blob->config.capabilities_size;
-		/* DMIC gateway's vindex is statically assigned in topology */
-		node_id.vindex = t->cfg_ext->copier.vindex.val;
-
-		break;
-
-	case AVS_DMA_HDA_HOST_OUTPUT:
-	case AVS_DMA_HDA_HOST_INPUT:
-		/* HOST gateway's vindex is dynamically assigned with DMA id */
-		node_id.vindex = mod->owner->owner->dma_id;
-		break;
-
-	case AVS_DMA_HDA_LINK_OUTPUT:
-	case AVS_DMA_HDA_LINK_INPUT:
-		node_id.vindex = t->cfg_ext->copier.vindex.val |
-				 mod->owner->owner->dma_id;
-		break;
-
-	case INVALID_OBJECT_ID:
-	default:
-		node_id = INVALID_NODE_ID;
-		break;
-	}
-
-	cfg_size = offsetof(struct avs_copier_cfg, gtw_cfg.config) + data_size;
-	if (cfg_size > AVS_MAILBOX_SIZE)
-		return -EINVAL;
-
-	cfg = adev->modcfg_buf;
-	memset(cfg, 0, cfg_size);
-	cfg->base.cpc = t->cfg_base->cpc;
-	cfg->base.ibs = t->cfg_base->ibs;
-	cfg->base.obs = t->cfg_base->obs;
-	cfg->base.is_pages = t->cfg_base->is_pages;
-	cfg->base.audio_fmt = *t->in_fmt;
-	cfg->out_fmt = *t->cfg_ext->copier.out_fmt;
-	cfg->feature_mask = t->cfg_ext->copier.feature_mask;
-	cfg->gtw_cfg.node_id = node_id;
-	cfg->gtw_cfg.dma_buffer_size = t->cfg_ext->copier.dma_buffer_size;
-	/* config_length in DWORDs */
-	cfg->gtw_cfg.config_length = DIV_ROUND_UP(data_size, 4);
-	if (data)
-		memcpy(&cfg->gtw_cfg.config.blob, data, data_size);
-
-	mod->gtw_attrs = cfg->gtw_cfg.config.attrs;
-
-	ret = avs_dsp_init_module(adev, mod->module_id, mod->owner->instance_id,
-				  t->core_id, t->domain, cfg, cfg_size,
-				  &mod->instance_id);
-	return ret;
-}
-
 static struct avs_control_data *avs_get_module_control(struct avs_path_module *mod)
 {
 	struct avs_tplg_module *t = mod->template;
diff --git a/sound/soc/intel/avs/topology.h b/sound/soc/intel/avs/topology.h
index 7892e3797f63..dcfc568081a3 100644
--- a/sound/soc/intel/avs/topology.h
+++ b/sound/soc/intel/avs/topology.h
@@ -74,8 +74,6 @@ struct avs_tplg_modcfg_ext {
 			union avs_virtual_index vindex;
 			u32 dma_type;
 			u32 dma_buffer_size;
-			u32 config_length;
-			/* config_data part of priv data */
 		} copier;
 		struct {
 			u32 out_channel_config;
-- 
2.25.1

