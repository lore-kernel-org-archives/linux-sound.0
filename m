Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F075A2116ED
	for <linux-sound@vger.kernel.org>; Thu, 23 Jan 2025 16:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737649404; cv=none; b=FRRB7P/e3Z8q7qizQvTZ24EtOuDO3NBei4Ukm7bHUQYfvAa+gRpsoNpp2xzPxWeUpugApAkF/cmVH65QEdd39GJXOlzngyHskZ0l/ML11kdiFnnkr1Egi8obFAouLaCJaVcFqD/VpArFTbCqj2cnMEuvIVRRJMqZM31LUeyEei8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737649404; c=relaxed/simple;
	bh=EwwB9HNJNYNP5dCk5zvTqDXbSbfqDwkE3llaOGnllDw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bmPbn8SukW33osdIazg0idZLu8W6oCgHEQ2S7tckLGcbJGkTwhALgis5ahfBbMC5v24hqkRxxdTJtwoSSVklDdKrEYLv/oSY1SuNC7jrLWU7iO3SwcBUmicgtJSKt/9eQlR6bmNxm9FQe0FaGm7I2VHVvAIJfq+34P1LNDI2LXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E0qRNjhY; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E0qRNjhY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737649403; x=1769185403;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EwwB9HNJNYNP5dCk5zvTqDXbSbfqDwkE3llaOGnllDw=;
  b=E0qRNjhYwSBLtJlBtDjJV8iQW2rUnP3BRdaJ3EfT37G4Xa+t9Nl+RQz4
   chs2cBFaQSxtI3I5hPr2qvUYSisWBFOqioFm5n7lGQwrEd8KLFSF9w9CI
   gM/znPN03CCfty/ijtph5lGlbbxea4uJjq3HhYihNKfDyLHWnGljo2PB0
   tubw3B0bHkcXrzgYjopBMb5flwRCa6DbDKmmAQ3BzFFzJHZPYnFKS7FRY
   X+JpfiMc6tWHeH3UCWrimnq0Yq4MJIRTUwfEbTurSRsqoq8dHrfDqwu58
   v9P/DZKLLtBEpGsF4hWWYuXds2GWvKuEJjuELRg54SFbyfER/LRHek9au
   g==;
X-CSE-ConnectionGUID: 6jfCDkwZRNa7CNGoxVzcGw==
X-CSE-MsgGUID: NzN2qTasRaibej5gGocM5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="55572578"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="55572578"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 08:23:23 -0800
X-CSE-ConnectionGUID: HOSQ/OrPThuDbxFmbOG1/Q==
X-CSE-MsgGUID: fsK7Eh4LR6miLBqsj4v3YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107346834"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa010.jf.intel.com with ESMTP; 23 Jan 2025 08:23:19 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	shenghao-ding@ti.com,
	kevin-lu@ti.com,
	baojun.xu@ti.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Piotr Maziarz <piotrx.maziarz@linux.intel.com>
Subject: [PATCH v2 10/11] ASoC: Intel: avs: Add WHM module support
Date: Thu, 23 Jan 2025 17:36:33 +0100
Message-Id: <20250123163634.1451237-11-cezary.rojewski@intel.com>
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

WovHostModule (WHM) is used in wake-on-voice scenarios to optimize power
consumption. It combines capabilities of Copier, KeyPhraseBuffer,
WakeOnVoice and Muxer modules.

Signed-off-by: Piotr Maziarz <piotrx.maziarz@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/uapi/sound/intel/avs/tokens.h |  7 +++++
 sound/soc/intel/avs/messages.h        | 13 +++++++++
 sound/soc/intel/avs/path.c            | 36 +++++++++++++++++++++++
 sound/soc/intel/avs/topology.c        | 42 +++++++++++++++++++++++++++
 sound/soc/intel/avs/topology.h        |  9 ++++++
 5 files changed, 107 insertions(+)

diff --git a/include/uapi/sound/intel/avs/tokens.h b/include/uapi/sound/intel/avs/tokens.h
index 3e3fb258dd54..06ff30537f47 100644
--- a/include/uapi/sound/intel/avs/tokens.h
+++ b/include/uapi/sound/intel/avs/tokens.h
@@ -77,6 +77,13 @@ enum avs_tplg_token {
 	AVS_TKN_MODCFG_UPDOWN_MIX_CHAN_MAP_U32		= 430,
 	AVS_TKN_MODCFG_EXT_NUM_INPUT_PINS_U16		= 431,
 	AVS_TKN_MODCFG_EXT_NUM_OUTPUT_PINS_U16		= 432,
+	AVS_TKN_MODCFG_WHM_REF_AFMT_ID_U32		= 433,
+	AVS_TKN_MODCFG_WHM_OUT_AFMT_ID_U32		= 434,
+	AVS_TKN_MODCFG_WHM_WAKE_TICK_PERIOD_U32		= 435,
+	AVS_TKN_MODCFG_WHM_VINDEX_U8			= 436,
+	AVS_TKN_MODCFG_WHM_DMA_TYPE_U32			= 437,
+	AVS_TKN_MODCFG_WHM_DMABUFF_SIZE_U32		= 438,
+	AVS_TKN_MODCFG_WHM_BLOB_AFMT_ID_U32		= 439,
 
 	/* struct avs_tplg_pplcfg */
 	AVS_TKN_PPLCFG_ID_U32				= 1401,
diff --git a/sound/soc/intel/avs/messages.h b/sound/soc/intel/avs/messages.h
index 84b0d4b69ecb..f44fcfc81de7 100644
--- a/sound/soc/intel/avs/messages.h
+++ b/sound/soc/intel/avs/messages.h
@@ -652,6 +652,9 @@ int avs_ipc_set_system_time(struct avs_dev *adev);
 #define AVS_INTELWOV_MOD_UUID \
 	GUID_INIT(0xEC774FA9, 0x28D3, 0x424A, 0x90, 0xE4, 0x69, 0xF9, 0x84, 0xF1, 0xEE, 0xB7)
 
+#define AVS_WOVHOSTM_MOD_UUID \
+	GUID_INIT(0xF9ED62B7, 0x092E, 0x4A90, 0x8F, 0x4D, 0x82, 0xDA, 0xA8, 0xB3, 0x8F, 0x3B)
+
 /* channel map */
 enum avs_channel_index {
 	AVS_CHANNEL_LEFT = 0,
@@ -881,6 +884,16 @@ struct avs_wov_cfg {
 } __packed;
 static_assert(sizeof(struct avs_wov_cfg) == 44);
 
+struct avs_whm_cfg {
+	struct avs_modcfg_base base;
+	/* Audio format for output pin 0 */
+	struct avs_audio_format ref_fmt;
+	struct avs_audio_format out_fmt;
+	u32 wake_tick_period;
+	struct avs_copier_gtw_cfg gtw_cfg;
+} __packed;
+static_assert(sizeof(struct avs_whm_cfg) == 108);
+
 /* Module runtime parameters */
 
 enum avs_copier_runtime_param {
diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
index cfa19e4820d2..dfb85bd2b665 100644
--- a/sound/soc/intel/avs/path.c
+++ b/sound/soc/intel/avs/path.c
@@ -265,6 +265,41 @@ static int avs_copier_create(struct avs_dev *adev, struct avs_path_module *mod)
 	return ret;
 }
 
+static int avs_whm_create(struct avs_dev *adev, struct avs_path_module *mod)
+{
+	struct avs_tplg_module *t = mod->template;
+	struct avs_tplg_modcfg_ext *te;
+	struct avs_whm_cfg *cfg;
+	size_t cfg_size;
+	u32 dma_id;
+	int ret;
+
+	te = t->cfg_ext;
+	cfg = adev->modcfg_buf;
+	dma_id = mod->owner->owner->dma_id;
+	cfg_size = offsetof(struct avs_whm_cfg, gtw_cfg.config);
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
+	cfg->ref_fmt = *te->whm.ref_fmt;
+	cfg->out_fmt = *te->whm.out_fmt;
+	cfg->wake_tick_period = te->whm.wake_tick_period;
+	avs_init_node_id(&cfg->gtw_cfg.node_id, te, dma_id);
+	cfg->gtw_cfg.dma_buffer_size = te->whm.dma_buffer_size;
+	mod->gtw_attrs = cfg->gtw_cfg.config.attrs;
+
+	ret = avs_dsp_init_module(adev, mod->module_id, mod->owner->instance_id, t->core_id,
+				  t->domain, cfg, cfg_size, &mod->instance_id);
+	return ret;
+}
+
 static struct avs_control_data *avs_get_module_control(struct avs_path_module *mod)
 {
 	struct avs_tplg_module *t = mod->template;
@@ -536,6 +571,7 @@ static struct avs_module_create avs_module_create[] = {
 	{ &AVS_ASRC_MOD_UUID, avs_asrc_create },
 	{ &AVS_INTELWOV_MOD_UUID, avs_wov_create },
 	{ &AVS_PROBE_MOD_UUID, avs_probe_create },
+	{ &AVS_WOVHOSTM_MOD_UUID, avs_whm_create },
 };
 
 static int avs_path_module_type_create(struct avs_dev *adev, struct avs_path_module *mod)
diff --git a/sound/soc/intel/avs/topology.c b/sound/soc/intel/avs/topology.c
index d612f20ed989..471b00b9a149 100644
--- a/sound/soc/intel/avs/topology.c
+++ b/sound/soc/intel/avs/topology.c
@@ -815,6 +815,48 @@ static const struct avs_tplg_token_parser modcfg_ext_parsers[] = {
 		.offset = offsetof(struct avs_tplg_modcfg_ext, generic.num_output_pins),
 		.parse = avs_parse_short_token,
 	},
+	{
+		.token = AVS_TKN_MODCFG_WHM_REF_AFMT_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, whm.ref_fmt),
+		.parse = avs_parse_audio_format_ptr,
+	},
+	{
+		.token = AVS_TKN_MODCFG_WHM_OUT_AFMT_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, whm.out_fmt),
+		.parse = avs_parse_audio_format_ptr,
+	},
+	{
+		.token = AVS_TKN_MODCFG_WHM_WAKE_TICK_PERIOD_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, whm.wake_tick_period),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_MODCFG_WHM_VINDEX_U8,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_BYTE,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, whm.vindex),
+		.parse = avs_parse_byte_token,
+	},
+	{
+		.token = AVS_TKN_MODCFG_WHM_DMA_TYPE_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, whm.dma_type),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_MODCFG_WHM_DMABUFF_SIZE_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, whm.dma_buffer_size),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_MODCFG_WHM_BLOB_AFMT_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, whm.blob_fmt),
+		.parse = avs_parse_audio_format_ptr,
+	},
 };
 
 static const struct avs_tplg_token_parser pin_format_parsers[] = {
diff --git a/sound/soc/intel/avs/topology.h b/sound/soc/intel/avs/topology.h
index dcfc568081a3..23d5ccd19959 100644
--- a/sound/soc/intel/avs/topology.h
+++ b/sound/soc/intel/avs/topology.h
@@ -75,6 +75,15 @@ struct avs_tplg_modcfg_ext {
 			u32 dma_type;
 			u32 dma_buffer_size;
 		} copier;
+		struct {
+			struct avs_audio_format *ref_fmt;
+			struct avs_audio_format *out_fmt;
+			u32 wake_tick_period;
+			union avs_virtual_index vindex;
+			u32 dma_type;
+			u32 dma_buffer_size;
+			struct avs_audio_format *blob_fmt; /* optional override */
+		} whm;
 		struct {
 			u32 out_channel_config;
 			u32 coefficients_select;
-- 
2.25.1

