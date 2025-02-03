Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890BD205AD6
	for <linux-sound@vger.kernel.org>; Mon,  3 Feb 2025 13:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738591046; cv=none; b=Q3z6CIUpR1ykwWoPbWA55/tZf7svUn8CAL4lXITqdngzVufG3V68UwB557BOYsqsu8Rls+Jd7QDPLw05MzfNMlZmo7U+rPknKTQhSJIMuHRyKtj4lBSl2j40aFh5WNP7KZGM0VVzJNyeLovCaLw5sXo85XBULjkv3A6KfzueCnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738591046; c=relaxed/simple;
	bh=FaUdIe8pMgEeyYSpc0pzx+UXJIxA2QinYRqwfuII/NM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZstR3HVvHDjBgM+Vj/Acdf37m4M1u1bxFFIDjgF4TFaW+DmM+riD6H/Bg5UGnWsj0Zd9OdcCN7OJdXjzFQsXgt343eBBigD1lDMJoCdaqek4is5a34IpeXnFLUUH32ZpVRscLMjU/T2Ga41+W1dx1G6hYj0zFVqaV9DTj7Njux4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UE0o+bKj; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UE0o+bKj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738591045; x=1770127045;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FaUdIe8pMgEeyYSpc0pzx+UXJIxA2QinYRqwfuII/NM=;
  b=UE0o+bKjVZ+jv8LLrzZacrApdYgWfQ+p63NOZMWsY1CmvcUyRahvqW/7
   R8W9evU6Iwpd+WjJGL7D6EHMcHlBOyhrcr+63LptP82bv7owIkM3JWK/E
   wvpKrnhydBiArP30D0xDUBuAe1rHJvMyg/H99st+mcnnz8A/EfCZ0BhZ7
   pzFu1A8L9EsO0F6kyBxz7beRu5L1FSjVRDQ1YTkVKl3XqxkNeO05voo12
   M0TAiAt0gFB90nnJO9n3kl8gyxyqa2wxA9iPUiP5TjTUO0yj1IzF9Is+x
   lV/DXKrFxu3zNchikgmdt5raMmCxkHDA0TsZfEgkD0KjZGQ6NqB86tCek
   w==;
X-CSE-ConnectionGUID: d1y3cZKDS4ackFipOr6f8w==
X-CSE-MsgGUID: cu4qw2MzSZmUVffCVHYDyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="56511857"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="56511857"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 05:57:24 -0800
X-CSE-ConnectionGUID: PLYTccUUQvS30lTTZ6JZcg==
X-CSE-MsgGUID: tniiSZ0iS7mNrpi4mhZVzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="110057932"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa009.jf.intel.com with ESMTP; 03 Feb 2025 05:57:22 -0800
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
Subject: [PATCH v3 09/11] ASoC: Intel: avs: Remove unused gateway configuration code
Date: Mon,  3 Feb 2025 15:10:49 +0100
Message-Id: <20250203141051.2361323-10-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250203141051.2361323-1-cezary.rojewski@intel.com>
References: <20250203141051.2361323-1-cezary.rojewski@intel.com>
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

