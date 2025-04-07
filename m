Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CB7226861
	for <linux-sound@vger.kernel.org>; Mon,  7 Apr 2025 11:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744024030; cv=none; b=njzl7aPSzL/m9jFkd9cLXz/R8Fv9Es6rvcMigp0RIOYZq4e01iQyt4tILQE/s20lTuVZrKAZE8hXZIB+MEn930OCAighdaTgIf1Yti4Xf4gjoShZeKxMYGEv2Li71P51L7s3nynxnN8DhMcu9ef5780SAb2W8hK+JcM8xM41rSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744024030; c=relaxed/simple;
	bh=ta85U2jeiLe7w7DdlP3Zt7H5IpN236f31FrIjipXoTA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HueMjYO/DgGPwacNmiKcmkRqso+Kv7uUcD2cpFEdth7a8LVJFxH6Ukr8jU/y2WJN/1SyvOUOs+ZyzneOUMzvckay1HF4IbLDBTcNlAYMw5RQddOp+Q2TnhC3VIk8b9lXzwAeNSCFbWCMJfDz7cDxshQNcVATpw1CRggvGC7KGCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PiCVRWEK; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PiCVRWEK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744024029; x=1775560029;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ta85U2jeiLe7w7DdlP3Zt7H5IpN236f31FrIjipXoTA=;
  b=PiCVRWEKuuvZ5wHy1G0xRYLGANT6U9mLP1E05bGisFS5e1cJFlZ9AZ3+
   QfrgMVHaZo1mMEUdMtv+nB3GFJ98rbyLmPWXa54p2US80NjupLxeqLV03
   kBTedSSN08liOEb/Q3Rs5FlaCacO2FLRV9MSA0rzI84sSNOaRy3ZPxQ9d
   XeteyyxhFtJY+q8fMfrzjhk3ASIYFB6P/qaRQ+fnMdDp4TQ1CjymvKyLR
   1gCgPe3nyxaglcIenyGZt4Xa1vy9BZm6jSVQ1EOBl+g8fstbcO+QYnkzl
   /ycHHq/MRXcZqkFT/gXKUc7AaQ+G0XWG9jVq//mrVcCrC1O5d9r9HtxuZ
   w==;
X-CSE-ConnectionGUID: ZNKtd3gRTDuy58xj2uTTzg==
X-CSE-MsgGUID: wmjK1b8XQlioxF/GKjM37A==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="49057374"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="49057374"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 04:07:08 -0700
X-CSE-ConnectionGUID: TIVZm+jPQIOftN0GNWtxDw==
X-CSE-MsgGUID: xtDm2yyBRCKRHuMsubix1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="127776324"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa006.fm.intel.com with ESMTP; 07 Apr 2025 04:07:06 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	liam.r.girdwood@intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 08/10] ASoC: Intel: avs: Conditionally add DMA config when creating Copier
Date: Mon,  7 Apr 2025 13:23:50 +0200
Message-Id: <20250407112352.3720779-9-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250407112352.3720779-1-cezary.rojewski@intel.com>
References: <20250407112352.3720779-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Starting from LunarLake (LNL) platform, non-HDAudio transfers e.g.:
I2S/DMIC utilize HDAudio LINK DMA instead of GPDMA for the data
transfer. Implement avs_append_dma_cfg() to account for the changes made
in LNL timeframe.

The handler checks the platform and transfer type before appending the
DMA configuration to the module's payload so it can safely be called
within the common initialization flow for Copier/WHM modules.

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/messages.h | 29 +++++++++++++++++++
 sound/soc/intel/avs/path.c     | 51 +++++++++++++++++++++++++++++++---
 2 files changed, 76 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/avs/messages.h b/sound/soc/intel/avs/messages.h
index 2f243802ccc2..afdf2a458c52 100644
--- a/sound/soc/intel/avs/messages.h
+++ b/sound/soc/intel/avs/messages.h
@@ -102,6 +102,8 @@ struct avs_tlv {
 } __packed;
 static_assert(sizeof(struct avs_tlv) == 8);
 
+#define avs_tlv_size(tlv) struct_size(tlv, value, (tlv)->length / 4)
+
 enum avs_module_msg_type {
 	AVS_MOD_INIT_INSTANCE = 0,
 	AVS_MOD_LARGE_CONFIG_GET = 3,
@@ -786,6 +788,33 @@ union avs_gtw_attributes {
 } __packed;
 static_assert(sizeof(union avs_gtw_attributes) == 4);
 
+#define AVS_GTW_DMA_CONFIG_ID	0x1000
+#define AVS_DMA_METHOD_HDA	1
+
+struct avs_dma_device_stream_channel_map {
+	u32 device_address;
+	u32 channel_map;
+} __packed;
+static_assert(sizeof(struct avs_dma_device_stream_channel_map) == 8);
+
+struct avs_dma_stream_channel_map {
+	u32 device_count;
+	struct avs_dma_device_stream_channel_map map[16];
+} __packed;
+static_assert(sizeof(struct avs_dma_stream_channel_map) == 132);
+
+struct avs_dma_cfg {
+	u8 dma_method;
+	u8 pre_allocated;
+	u16 rsvd;
+	u32 dma_channel_id;
+	u32 stream_id;
+	struct avs_dma_stream_channel_map map;
+	u32 config_size;
+	u8 config[] __counted_by(config_size);
+} __packed;
+static_assert(sizeof(struct avs_dma_cfg) == 148);
+
 struct avs_copier_gtw_cfg {
 	union avs_connector_node_id node_id;
 	u32 dma_buffer_size;
diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
index ef0c1d125d66..7800f62c8a1c 100644
--- a/sound/soc/intel/avs/path.c
+++ b/sound/soc/intel/avs/path.c
@@ -210,8 +210,51 @@ avs_nhlt_config_or_default(struct avs_dev *adev, struct avs_tplg_module *t)
 	return &fmtcfg->config;
 }
 
+static int avs_append_dma_cfg(struct avs_dev *adev, struct avs_copier_gtw_cfg *gtw,
+			      struct avs_tplg_module *t, u32 dma_id, size_t *cfg_size)
+{
+	u32 dma_type = t->cfg_ext->copier.dma_type;
+	struct avs_dma_cfg *dma;
+	struct avs_tlv *tlv;
+	size_t tlv_size;
+
+	if (!avs_platattr_test(adev, ALTHDA))
+		return 0;
+
+	switch (dma_type) {
+	case AVS_DMA_HDA_HOST_OUTPUT:
+	case AVS_DMA_HDA_HOST_INPUT:
+	case AVS_DMA_HDA_LINK_OUTPUT:
+	case AVS_DMA_HDA_LINK_INPUT:
+		return 0;
+	default:
+		break;
+	}
+
+	tlv_size = sizeof(*tlv) + sizeof(*dma);
+	if (*cfg_size + tlv_size > AVS_MAILBOX_SIZE)
+		return -E2BIG;
+
+	/* DMA config is a TLV tailing the existing payload. */
+	tlv = (struct avs_tlv *)&gtw->config.blob[gtw->config_length];
+	tlv->type = AVS_GTW_DMA_CONFIG_ID;
+	tlv->length = sizeof(*dma);
+
+	dma = (struct avs_dma_cfg *)tlv->value;
+	memset(dma, 0, sizeof(*dma));
+	dma->dma_method = AVS_DMA_METHOD_HDA;
+	dma->pre_allocated = true;
+	dma->dma_channel_id = dma_id;
+	dma->stream_id = dma_id + 1;
+
+	gtw->config_length += tlv_size / sizeof(u32);
+	*cfg_size += tlv_size;
+
+	return 0;
+}
+
 static int avs_fill_gtw_config(struct avs_dev *adev, struct avs_copier_gtw_cfg *gtw,
-			       struct avs_tplg_module *t, size_t *cfg_size)
+			       struct avs_tplg_module *t, u32 dma_id, size_t *cfg_size)
 {
 	struct acpi_nhlt_config *blob;
 	size_t gtw_size;
@@ -228,7 +271,7 @@ static int avs_fill_gtw_config(struct avs_dev *adev, struct avs_copier_gtw_cfg *
 	memcpy(gtw->config.blob, blob->capabilities, blob->capabilities_size);
 	*cfg_size += gtw_size;
 
-	return 0;
+	return avs_append_dma_cfg(adev, gtw, t, dma_id, cfg_size);
 }
 
 static int avs_copier_create(struct avs_dev *adev, struct avs_path_module *mod)
@@ -245,7 +288,7 @@ static int avs_copier_create(struct avs_dev *adev, struct avs_path_module *mod)
 	dma_id = mod->owner->owner->dma_id;
 	cfg_size = offsetof(struct avs_copier_cfg, gtw_cfg.config);
 
-	ret = avs_fill_gtw_config(adev, &cfg->gtw_cfg, t, &cfg_size);
+	ret = avs_fill_gtw_config(adev, &cfg->gtw_cfg, t, dma_id, &cfg_size);
 	if (ret)
 		return ret;
 
@@ -279,7 +322,7 @@ static int avs_whm_create(struct avs_dev *adev, struct avs_path_module *mod)
 	dma_id = mod->owner->owner->dma_id;
 	cfg_size = offsetof(struct avs_whm_cfg, gtw_cfg.config);
 
-	ret = avs_fill_gtw_config(adev, &cfg->gtw_cfg, t, &cfg_size);
+	ret = avs_fill_gtw_config(adev, &cfg->gtw_cfg, t, dma_id, &cfg_size);
 	if (ret)
 		return ret;
 
-- 
2.25.1

