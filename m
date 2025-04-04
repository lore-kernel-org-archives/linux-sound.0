Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7578C1AC458
	for <linux-sound@vger.kernel.org>; Fri,  4 Apr 2025 09:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743759210; cv=none; b=XMfqEvEdrQB4A/d1dn6T0Erlsly5afqJPzTofNQqST2lb5TgXPBUEUlVvM24F6pSAdOB7P5ttvBgTIu59r3YhSCTEezIZFrInr39R9yKnw04n/9PsWV8Rbh8cbTqsAd+5Bqzx4pRLr1KSSI6ypL1jCenOKgrMG4G0KwbFOuYLo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743759210; c=relaxed/simple;
	bh=ta85U2jeiLe7w7DdlP3Zt7H5IpN236f31FrIjipXoTA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NqbqFJjP0ZrtuFH3DHKJ3wLfkG/dKEJHlgsn/kpeIS9aelIllWIVpLHVfS1/rTB6a9TtZFM+xCMQJCTbRZ+bs8m7atHBtx8IkEPPbQF+SXgpQQL2BiGFKcx9jn82nwFzPd+1QC4NGE1LKiJQ+KJ9b26rTDNiNg+PGu//q2wydb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GuUjT4Yd; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GuUjT4Yd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743759209; x=1775295209;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ta85U2jeiLe7w7DdlP3Zt7H5IpN236f31FrIjipXoTA=;
  b=GuUjT4Yd4VGhrb7B/LgLj65Id6vBErAp9Jb9HiYWc5Qu6pH3Mfc/sh0Q
   rDTThv4gfgcpiQW4/CjAdkM5sJOVYrOyDJ5clemODn/t1wh16FKgB7mTI
   WhB90U/1vmturVKj9K+DKRSw4mWmwXhveuww6oS2rniUPjmRdPwOBXOGT
   ty/YBvTdyI+X6dN9bA42HjifrYGakhrwVC4HjAwIxp/47DE1cZuSUINgV
   j8vprwIu1r0LuPhXGTwPdh9yozyOjNCD6tGMTYgYthpEfACZzQ1+5Up1G
   h0WvUZ3IbErsKMQj+UP0Sz0cG2Cb5O0FSVS/gKqGLdJEfE+LhdXgO5Kg0
   Q==;
X-CSE-ConnectionGUID: +iYsI0fETB6kNIpQ7PX25w==
X-CSE-MsgGUID: 3ePNbomkRDmLEwyQtwjpzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="70566382"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="70566382"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 02:33:24 -0700
X-CSE-ConnectionGUID: /Om7ZrVmT1+rrNm1dLy+SA==
X-CSE-MsgGUID: GwOxAJV8THq5M9BLjkpQ6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="158248670"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa001.fm.intel.com with ESMTP; 04 Apr 2025 02:33:10 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 10/12] ASoC: Intel: avs: Conditionally add DMA config when creating Copier
Date: Fri,  4 Apr 2025 11:49:51 +0200
Message-Id: <20250404094953.3657679-11-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250404094953.3657679-1-cezary.rojewski@intel.com>
References: <20250404094953.3657679-1-cezary.rojewski@intel.com>
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

