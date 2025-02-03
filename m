Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36E5205ABE
	for <linux-sound@vger.kernel.org>; Mon,  3 Feb 2025 13:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738591043; cv=none; b=FGFK55RJixmm8LP8ITBxqpBIxx1yjCqPz6iYBXc4/CP5GLLRz1ccYEsMQPcIEttYG7Jb++/DuwyWhUr8I4TeWgNqQxcLx3VE0u47Y9wx/0cDoTqnsh0p6wty3YNVgWBvkZXEphuEmjsZATebFxVYHXK3UKG3K2YXT6waelK8a30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738591043; c=relaxed/simple;
	bh=XSG6QkLd4N8rhs02fOL8CmoS+QHescTPBiUs8lCnmfg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tdOl69punf8AIdGDE4a3hZPtCyXG7Mzg1auYkKQd6txzgkoLKjYjXk8Po4QTE7SpleVk8DR+h9DGvAwJXw8ZY64sxyk6MiSECC/WyuDrp1CV/y0nxuZpz5ysyGF8YzDn8czjglNRi1wEfyKavVtBTV78i++73ZaoJVwkeTHcg+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nO7hwnKV; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nO7hwnKV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738591042; x=1770127042;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XSG6QkLd4N8rhs02fOL8CmoS+QHescTPBiUs8lCnmfg=;
  b=nO7hwnKVEI6ikgXJb+7CbcuBzfDNbUmYvxymRBGJAipOmzKBikl1sexb
   GScRsJT1oPTJkXtL4TkDKhVBjOFvtpt51Y3wkhBZQwsmFdqF2cHwNJyh6
   jR95BR60RoFBr6lFc5dIHSgorZ7PKC5lHQ+9WuLbOzagpL+SVFTR7sbAT
   vzH2X095o9NRYF7dly5VR3eh1wI/12aavuiSP5pfl8gBZmq7TI7ZNX6CS
   E506yaSa0s7pXwj1OiCmxWfhyOirn58v2C+Uc6mrvALXDEr/sWAx22Bx+
   POryPPRwnjkL54POjpawN2nfikjFlkbELcZ2vkrB5n9V4OPM2CMO901Jb
   Q==;
X-CSE-ConnectionGUID: pn6VncI4TxacXDrYKj7vdA==
X-CSE-MsgGUID: DoqHmQXST9asm/luc4uqLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="56511850"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="56511850"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 05:57:22 -0800
X-CSE-ConnectionGUID: AMoNtwnMRnCGk/+E/2ZYvA==
X-CSE-MsgGUID: a/3cyy2wQ+WjSxn1WX03jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="110057922"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa009.jf.intel.com with ESMTP; 03 Feb 2025 05:57:19 -0800
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
Subject: [PATCH v3 08/11] ASoC: Intel: avs: New gateway configuration mechanism
Date: Mon,  3 Feb 2025 15:10:48 +0100
Message-Id: <20250203141051.2361323-9-cezary.rojewski@intel.com>
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

Creation of a module which contains gateway configuration consists of
few additional steps, namely:

- assigning ID (node_id) for the gateway
- attaching hardware configuration from the NHLT table (optional)

By splitting the steps into separate functions code becomes easier to
read and understand. Any redundancy created by this patch will be
addressed by follow up changes.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/path.c | 150 +++++++++++++++++++++++++++++++++++++
 1 file changed, 150 insertions(+)

diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
index f31d5e2caa7b..698a3d542244 100644
--- a/sound/soc/intel/avs/path.c
+++ b/sound/soc/intel/avs/path.c
@@ -115,6 +115,156 @@ avs_path_find_variant(struct avs_dev *adev,
 	return NULL;
 }
 
+static void avs_init_node_id(union avs_connector_node_id *node_id,
+			     struct avs_tplg_modcfg_ext *te, u32 dma_id)
+{
+	node_id->val = 0;
+	node_id->dma_type = te->copier.dma_type;
+
+	switch (node_id->dma_type) {
+	case AVS_DMA_DMIC_LINK_INPUT:
+	case AVS_DMA_I2S_LINK_OUTPUT:
+	case AVS_DMA_I2S_LINK_INPUT:
+		/* Gateway's virtual index is statically assigned in the topology. */
+		node_id->vindex = te->copier.vindex.val;
+		break;
+
+	case AVS_DMA_HDA_HOST_OUTPUT:
+	case AVS_DMA_HDA_HOST_INPUT:
+		/* Gateway's virtual index is dynamically assigned with DMA ID */
+		node_id->vindex = dma_id;
+		break;
+
+	case AVS_DMA_HDA_LINK_OUTPUT:
+	case AVS_DMA_HDA_LINK_INPUT:
+		node_id->vindex = te->copier.vindex.val | dma_id;
+		break;
+
+	default:
+		*node_id = INVALID_NODE_ID;
+		break;
+	}
+}
+
+/* Every BLOB contains at least gateway attributes. */
+static struct acpi_nhlt_config *default_blob = (struct acpi_nhlt_config *)&(u32[2]) {4};
+
+static struct acpi_nhlt_config *
+avs_nhlt_config_or_default(struct avs_dev *adev, struct avs_tplg_module *t)
+{
+	struct acpi_nhlt_format_config *fmtcfg;
+	struct avs_tplg_modcfg_ext *te;
+	struct avs_audio_format *fmt;
+	int link_type, dev_type;
+	int bus_id, dir;
+
+	te = t->cfg_ext;
+
+	switch (te->copier.dma_type) {
+	case AVS_DMA_I2S_LINK_OUTPUT:
+		link_type = ACPI_NHLT_LINKTYPE_SSP;
+		dev_type = ACPI_NHLT_DEVICETYPE_CODEC;
+		bus_id = te->copier.vindex.i2s.instance;
+		dir = SNDRV_PCM_STREAM_PLAYBACK;
+		fmt = te->copier.out_fmt;
+		break;
+
+	case AVS_DMA_I2S_LINK_INPUT:
+		link_type = ACPI_NHLT_LINKTYPE_SSP;
+		dev_type = ACPI_NHLT_DEVICETYPE_CODEC;
+		bus_id = te->copier.vindex.i2s.instance;
+		dir = SNDRV_PCM_STREAM_CAPTURE;
+		fmt = t->in_fmt;
+		break;
+
+	case AVS_DMA_DMIC_LINK_INPUT:
+		link_type = ACPI_NHLT_LINKTYPE_PDM;
+		dev_type = -1; /* ignored */
+		bus_id = 0;
+		dir = SNDRV_PCM_STREAM_CAPTURE;
+		fmt = t->in_fmt;
+		break;
+
+	default:
+		return default_blob;
+	}
+
+	/* Override format selection if necessary. */
+	if (te->copier.blob_fmt)
+		fmt = te->copier.blob_fmt;
+
+	fmtcfg = acpi_nhlt_find_fmtcfg(link_type, dev_type, dir, bus_id,
+				       fmt->num_channels, fmt->sampling_freq, fmt->valid_bit_depth,
+				       fmt->bit_depth);
+	if (!fmtcfg) {
+		dev_warn(adev->dev, "Endpoint format configuration not found.\n");
+		return ERR_PTR(-ENOENT);
+	}
+
+	if (fmtcfg->config.capabilities_size < default_blob->capabilities_size)
+		return ERR_PTR(-ETOOSMALL);
+	/* The firmware expects the payload to be DWORD-aligned. */
+	if (fmtcfg->config.capabilities_size % sizeof(u32))
+		return ERR_PTR(-EINVAL);
+
+	return &fmtcfg->config;
+}
+
+static int avs_fill_gtw_config(struct avs_dev *adev, struct avs_copier_gtw_cfg *gtw,
+			       struct avs_tplg_module *t, size_t *cfg_size)
+{
+	struct acpi_nhlt_config *blob;
+	size_t gtw_size;
+
+	blob = avs_nhlt_config_or_default(adev, t);
+	if (IS_ERR(blob))
+		return PTR_ERR(blob);
+
+	gtw_size = blob->capabilities_size;
+	if (*cfg_size + gtw_size > AVS_MAILBOX_SIZE)
+		return -E2BIG;
+
+	gtw->config_length = gtw_size / sizeof(u32);
+	memcpy(gtw->config.blob, blob->capabilities, blob->capabilities_size);
+	*cfg_size += gtw_size;
+
+	return 0;
+}
+
+static __maybe_unused int avs_copier_create2(struct avs_dev *adev, struct avs_path_module *mod)
+{
+	struct avs_tplg_module *t = mod->template;
+	struct avs_tplg_modcfg_ext *te;
+	struct avs_copier_cfg *cfg;
+	size_t cfg_size;
+	u32 dma_id;
+	int ret;
+
+	te = t->cfg_ext;
+	cfg = adev->modcfg_buf;
+	dma_id = mod->owner->owner->dma_id;
+	cfg_size = offsetof(struct avs_copier_cfg, gtw_cfg.config);
+
+	ret = avs_fill_gtw_config(adev, &cfg->gtw_cfg, t, &cfg_size);
+	if (ret)
+		return ret;
+
+	cfg->base.cpc = t->cfg_base->cpc;
+	cfg->base.ibs = t->cfg_base->ibs;
+	cfg->base.obs = t->cfg_base->obs;
+	cfg->base.is_pages = t->cfg_base->is_pages;
+	cfg->base.audio_fmt = *t->in_fmt;
+	cfg->out_fmt = *te->copier.out_fmt;
+	cfg->feature_mask = te->copier.feature_mask;
+	avs_init_node_id(&cfg->gtw_cfg.node_id, te, dma_id);
+	cfg->gtw_cfg.dma_buffer_size = te->copier.dma_buffer_size;
+	mod->gtw_attrs = cfg->gtw_cfg.config.attrs;
+
+	ret = avs_dsp_init_module(adev, mod->module_id, mod->owner->instance_id, t->core_id,
+				  t->domain, cfg, cfg_size, &mod->instance_id);
+	return ret;
+}
+
 __maybe_unused
 static bool avs_dma_type_is_host(u32 dma_type)
 {
-- 
2.25.1

