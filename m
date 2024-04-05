Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CAA15FA95
	for <linux-sound@vger.kernel.org>; Fri,  5 Apr 2024 09:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712308112; cv=none; b=HxgqvjA6btyJa4rRqy+WvdSd0YLJQ8hrr2NyGpgqsdZVCtkIg6N7qhPbKO6B3+WD2EMLWA3BQWIg/W1ALkw4fH3zf7JfLclnsXfir6tV9nWVIrpGuvgoSpiymx4xzYFXmAxTBErsrsBq7VNnddnqZruWJNjkrPIknCb1OYG18EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712308112; c=relaxed/simple;
	bh=Xz+EuLu3mCummqDYZn0YkU1RdW1rHBp9cTQ43JeIyqA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=asdaPdzhk4u9uBG+eW3XVx3quM4C7mM3hzc6YAzae7wyHsilVo947XmXMt3BRCCCdg68D7kPftn2A6PRodmUS4UXEFm2T2vSlBxIUOGL7u4V+ewgYt0PWK9yn6RvFmTzWTBLctKfgElp43C//8nC6b8a4wXFBuZWKEjeHAeYkCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dQxDHhCH; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dQxDHhCH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712308111; x=1743844111;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Xz+EuLu3mCummqDYZn0YkU1RdW1rHBp9cTQ43JeIyqA=;
  b=dQxDHhCHQdX0g+wI1y7XanOVOIV+gw2jlHxxvsQjHfGPu6QqPyMRQmi0
   bajcO+XdVjrcOZgGUWXVAARj/4oVlziNPGQKv+DQza3w7cP0ZAvmUEBtQ
   Wr3IQUgS5hh5znIJTd7/dHLx98lsp7tX4kvJED21yt2cM4bAIX9Cl9mqr
   qnk7Aw4iv5IkxEUNF670kMrIMphUa1QOUJIuIsUjRbqDQE2MHXKn6WqI6
   abTH4gxV3KHAdfCId4bOAttX1W2HxoGCn900KL7QtpNM57a9IzRmkVX41
   hX4T4wybfBF+yZz85pVK/Hgj5icpCDUFDkUuVDl/HgxkHlE75edRno6Xj
   g==;
X-CSE-ConnectionGUID: sUruKs8TTcWUSPbGo4aJhQ==
X-CSE-MsgGUID: p2EhlWnPR0mbz7LIsuHABQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7787490"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="7787490"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 02:08:31 -0700
X-CSE-ConnectionGUID: LduCTjZ2RCaMazriHeaqkw==
X-CSE-MsgGUID: RWcv0VeWSZ6wy4gl1dvmgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="19042454"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa009.jf.intel.com with ESMTP; 05 Apr 2024 02:08:29 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 12/13] ASoC: Intel: avs: Add assert_static to guarantee ABI sizes
Date: Fri,  5 Apr 2024 11:09:28 +0200
Message-Id: <20240405090929.1184068-13-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240405090929.1184068-1-cezary.rojewski@intel.com>
References: <20240405090929.1184068-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

In order to make sure that IPC interface is stable use assert_static to
check union and struct sizes that describe communication interface.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/avs.h      |  1 +
 sound/soc/intel/avs/icl.c      |  3 +++
 sound/soc/intel/avs/loader.c   |  2 ++
 sound/soc/intel/avs/messages.h | 43 ++++++++++++++++++++++++++++++++++
 4 files changed, 49 insertions(+)

diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index f80f79415344..39bdec591d58 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -381,6 +381,7 @@ struct avs_apl_log_buffer_layout {
 	u32 write_ptr;
 	u8 buffer[];
 } __packed;
+static_assert(sizeof(struct avs_apl_log_buffer_layout) == 8);
 
 #define avs_apl_log_payload_size(adev) \
 	(avs_log_buffer_size(adev) - sizeof(struct avs_apl_log_buffer_layout))
diff --git a/sound/soc/intel/avs/icl.c b/sound/soc/intel/avs/icl.c
index d279ec1e0ad0..e8b4983e03e9 100644
--- a/sound/soc/intel/avs/icl.c
+++ b/sound/soc/intel/avs/icl.c
@@ -52,12 +52,14 @@ union avs_icl_memwnd2_slot_type {
 		u32 type:24;
 	};
 } __packed;
+static_assert(sizeof(union avs_icl_memwnd2_slot_type) == 4);
 
 struct avs_icl_memwnd2_desc {
 	u32 resource_id;
 	union avs_icl_memwnd2_slot_type slot_id;
 	u32 vma;
 } __packed;
+static_assert(sizeof(struct avs_icl_memwnd2_desc) == 12);
 
 #define AVS_ICL_MEMWND2_SLOTS_COUNT	15
 
@@ -68,6 +70,7 @@ struct avs_icl_memwnd2 {
 	};
 	u8 slot_array[AVS_ICL_MEMWND2_SLOTS_COUNT][SZ_4K];
 } __packed;
+static_assert(sizeof(struct avs_icl_memwnd2) == 65536);
 
 #define AVS_ICL_SLOT_UNUSED \
 	((union avs_icl_memwnd2_slot_type) { 0x00000000U })
diff --git a/sound/soc/intel/avs/loader.c b/sound/soc/intel/avs/loader.c
index 57370f0905dc..c255c898b7a8 100644
--- a/sound/soc/intel/avs/loader.c
+++ b/sound/soc/intel/avs/loader.c
@@ -56,6 +56,7 @@ struct avs_fw_manifest {
 	u32 feature_mask;
 	struct avs_fw_version version;
 } __packed;
+static_assert(sizeof(struct avs_fw_manifest) == 36);
 
 struct avs_fw_ext_manifest {
 	u32 id;
@@ -64,6 +65,7 @@ struct avs_fw_ext_manifest {
 	u16 version_minor;
 	u32 entries;
 } __packed;
+static_assert(sizeof(struct avs_fw_ext_manifest) == 16);
 
 static int avs_fw_ext_manifest_strip(struct firmware *fw)
 {
diff --git a/sound/soc/intel/avs/messages.h b/sound/soc/intel/avs/messages.h
index 007bc4fb6d99..285d89607b6a 100644
--- a/sound/soc/intel/avs/messages.h
+++ b/sound/soc/intel/avs/messages.h
@@ -93,12 +93,14 @@ union avs_global_msg {
 		} ext;
 	};
 } __packed;
+static_assert(sizeof(union avs_global_msg) == 8);
 
 struct avs_tlv {
 	u32 type;
 	u32 length;
 	u32 value[];
 } __packed;
+static_assert(sizeof(struct avs_tlv) == 8);
 
 enum avs_module_msg_type {
 	AVS_MOD_INIT_INSTANCE = 0,
@@ -155,6 +157,7 @@ union avs_module_msg {
 		} ext;
 	};
 } __packed;
+static_assert(sizeof(union avs_module_msg) == 8);
 
 #define AVS_IPC_NOT_SUPPORTED 15
 
@@ -190,6 +193,7 @@ union avs_reply_msg {
 		} ext;
 	};
 } __packed;
+static_assert(sizeof(union avs_reply_msg) == 8);
 
 enum avs_notify_msg_type {
 	AVS_NOTIFY_PHRASE_DETECTED = 4,
@@ -226,6 +230,7 @@ union avs_notify_msg {
 		} ext;
 	};
 } __packed;
+static_assert(sizeof(union avs_notify_msg) == 8);
 
 #define AVS_MSG(hdr) { .val = hdr }
 
@@ -264,6 +269,7 @@ struct avs_notify_voice_data {
 	u16 kpd_score;
 	u16 reserved;
 } __packed;
+static_assert(sizeof(struct avs_notify_voice_data) == 4);
 
 struct avs_notify_res_data {
 	u32 resource_type;
@@ -272,6 +278,7 @@ struct avs_notify_res_data {
 	u32 reserved;
 	u32 data[6];
 } __packed;
+static_assert(sizeof(struct avs_notify_res_data) == 40);
 
 struct avs_notify_mod_data {
 	u32 module_instance_id;
@@ -279,6 +286,7 @@ struct avs_notify_mod_data {
 	u32 data_size;
 	u32 data[];
 } __packed;
+static_assert(sizeof(struct avs_notify_mod_data) == 12);
 
 /* ROM messages */
 enum avs_rom_control_msg_type {
@@ -332,6 +340,7 @@ struct avs_dxstate_info {
 	u32 core_mask;	/* which cores are subject for power transition */
 	u32 dx_mask;	/* bit[n]=1 core n goes to D0, bit[n]=0 it goes to D3 */
 } __packed;
+static_assert(sizeof(struct avs_dxstate_info) == 8);
 
 int avs_ipc_set_dx(struct avs_dev *adev, u32 core_mask, bool powerup);
 int avs_ipc_set_d0ix(struct avs_dev *adev, bool enable_pg, bool streaming);
@@ -367,11 +376,13 @@ struct avs_skl_log_state {
 	u32 enable;
 	u32 min_priority;
 } __packed;
+static_assert(sizeof(struct avs_skl_log_state) == 8);
 
 struct avs_skl_log_state_info {
 	u32 core_mask;
 	struct avs_skl_log_state logs_core[];
 } __packed;
+static_assert(sizeof(struct avs_skl_log_state_info) == 4);
 
 struct avs_apl_log_state_info {
 	u32 aging_timer_period;
@@ -379,6 +390,7 @@ struct avs_apl_log_state_info {
 	u32 core_mask;
 	struct avs_skl_log_state logs_core[];
 } __packed;
+static_assert(sizeof(struct avs_apl_log_state_info) == 12);
 
 enum avs_icl_log_priority {
 	AVS_ICL_LOG_CRITICAL = 0,
@@ -403,6 +415,7 @@ struct avs_icl_log_state_info {
 	u32 enable;
 	u32 logs_priorities_mask[];
 } __packed;
+static_assert(sizeof(struct avs_icl_log_state_info) == 12);
 
 int avs_ipc_set_enable_logs(struct avs_dev *adev, u8 *log_info, size_t size);
 
@@ -521,6 +534,7 @@ struct avs_module_type {
 	u32 lib_code:1;
 	u32 rsvd:24;
 } __packed;
+static_assert(sizeof(struct avs_module_type) == 4);
 
 union avs_segment_flags {
 	u32 ul;
@@ -537,12 +551,14 @@ union avs_segment_flags {
 		u32 length:16;
 	};
 } __packed;
+static_assert(sizeof(union avs_segment_flags) == 4);
 
 struct avs_segment_desc {
 	union avs_segment_flags flags;
 	u32 v_base_addr;
 	u32 file_offset;
 } __packed;
+static_assert(sizeof(struct avs_segment_desc) == 12);
 
 struct avs_module_entry {
 	u16 module_id;
@@ -559,11 +575,13 @@ struct avs_module_entry {
 	u16 instance_bss_size;
 	struct avs_segment_desc segments[3];
 } __packed;
+static_assert(sizeof(struct avs_module_entry) == 116);
 
 struct avs_mods_info {
 	u32 count;
 	struct avs_module_entry entries[];
 } __packed;
+static_assert(sizeof(struct avs_mods_info) == 4);
 
 static inline bool avs_module_entry_is_loaded(struct avs_module_entry *mentry)
 {
@@ -577,6 +595,7 @@ struct avs_sys_time {
 	u32 val_l;
 	u32 val_u;
 } __packed;
+static_assert(sizeof(struct avs_sys_time) == 8);
 
 int avs_ipc_set_system_time(struct avs_dev *adev);
 
@@ -680,6 +699,7 @@ struct avs_audio_format {
 	u32 sample_type:8;
 	u32 reserved:8;
 } __packed;
+static_assert(sizeof(struct avs_audio_format) == 24);
 
 struct avs_modcfg_base {
 	u32 cpc;
@@ -688,12 +708,14 @@ struct avs_modcfg_base {
 	u32 is_pages;
 	struct avs_audio_format audio_fmt;
 } __packed;
+static_assert(sizeof(struct avs_modcfg_base) == 40);
 
 struct avs_pin_format {
 	u32 pin_index;
 	u32 iobs;
 	struct avs_audio_format audio_fmt;
 } __packed;
+static_assert(sizeof(struct avs_pin_format) == 32);
 
 struct avs_modcfg_ext {
 	struct avs_modcfg_base base;
@@ -703,6 +725,7 @@ struct avs_modcfg_ext {
 	/* input pin formats followed by output ones */
 	struct avs_pin_format pin_fmts[];
 } __packed;
+static_assert(sizeof(struct avs_modcfg_ext) == 56);
 
 enum avs_dma_type {
 	AVS_DMA_HDA_HOST_OUTPUT = 0,
@@ -726,6 +749,7 @@ union avs_virtual_index {
 		u8 instance:3;
 	} dmic;
 } __packed;
+static_assert(sizeof(union avs_virtual_index) == 1);
 
 union avs_connector_node_id {
 	u32 val;
@@ -735,6 +759,7 @@ union avs_connector_node_id {
 		u32 rsvd:19;
 	};
 } __packed;
+static_assert(sizeof(union avs_connector_node_id) == 4);
 
 #define INVALID_PIPELINE_ID	0xFF
 #define INVALID_NODE_ID \
@@ -747,6 +772,7 @@ union avs_gtw_attributes {
 		u32 rsvd:31;
 	};
 } __packed;
+static_assert(sizeof(union avs_gtw_attributes) == 4);
 
 struct avs_copier_gtw_cfg {
 	union avs_connector_node_id node_id;
@@ -757,6 +783,7 @@ struct avs_copier_gtw_cfg {
 		DECLARE_FLEX_ARRAY(u32, blob);
 	} config;
 } __packed;
+static_assert(sizeof(struct avs_copier_gtw_cfg) == 16);
 
 struct avs_copier_cfg {
 	struct avs_modcfg_base base;
@@ -764,6 +791,7 @@ struct avs_copier_cfg {
 	u32 feature_mask;
 	struct avs_copier_gtw_cfg gtw_cfg;
 } __packed;
+static_assert(sizeof(struct avs_copier_cfg) == 84);
 
 struct avs_volume_cfg {
 	u32 channel_id;
@@ -772,22 +800,26 @@ struct avs_volume_cfg {
 	u32 reserved; /* alignment */
 	u64 curve_duration;
 } __packed;
+static_assert(sizeof(struct avs_volume_cfg) == 24);
 
 struct avs_peakvol_cfg {
 	struct avs_modcfg_base base;
 	struct avs_volume_cfg vols[];
 } __packed;
+static_assert(sizeof(struct avs_peakvol_cfg) == 40);
 
 struct avs_micsel_cfg {
 	struct avs_modcfg_base base;
 	struct avs_audio_format out_fmt;
 } __packed;
+static_assert(sizeof(struct avs_micsel_cfg) == 64);
 
 struct avs_mux_cfg {
 	struct avs_modcfg_base base;
 	struct avs_audio_format ref_fmt;
 	struct avs_audio_format out_fmt;
 } __packed;
+static_assert(sizeof(struct avs_mux_cfg) == 88);
 
 struct avs_updown_mixer_cfg {
 	struct avs_modcfg_base base;
@@ -796,21 +828,25 @@ struct avs_updown_mixer_cfg {
 	s32 coefficients[AVS_CHANNELS_MAX];
 	u32 channel_map;
 } __packed;
+static_assert(sizeof(struct avs_updown_mixer_cfg) == 84);
 
 struct avs_src_cfg {
 	struct avs_modcfg_base base;
 	u32 out_freq;
 } __packed;
+static_assert(sizeof(struct avs_src_cfg) == 44);
 
 struct avs_probe_gtw_cfg {
 	union avs_connector_node_id node_id;
 	u32 dma_buffer_size;
 } __packed;
+static_assert(sizeof(struct avs_probe_gtw_cfg) == 8);
 
 struct avs_probe_cfg {
 	struct avs_modcfg_base base;
 	struct avs_probe_gtw_cfg gtw_cfg;
 } __packed;
+static_assert(sizeof(struct avs_probe_cfg) == 48);
 
 struct avs_aec_cfg {
 	struct avs_modcfg_base base;
@@ -818,6 +854,7 @@ struct avs_aec_cfg {
 	struct avs_audio_format out_fmt;
 	u32 cpc_lp_mode;
 } __packed;
+static_assert(sizeof(struct avs_aec_cfg) == 92);
 
 struct avs_asrc_cfg {
 	struct avs_modcfg_base base;
@@ -828,11 +865,13 @@ struct avs_asrc_cfg {
 	u32 disable_jitter_buffer:1;
 	u32 rsvd3:27;
 } __packed;
+static_assert(sizeof(struct avs_asrc_cfg) == 48);
 
 struct avs_wov_cfg {
 	struct avs_modcfg_base base;
 	u32 cpc_lp_mode;
 } __packed;
+static_assert(sizeof(struct avs_wov_cfg) == 44);
 
 /* Module runtime parameters */
 
@@ -845,6 +884,7 @@ struct avs_copier_sink_format {
 	struct avs_audio_format src_fmt;
 	struct avs_audio_format sink_fmt;
 } __packed;
+static_assert(sizeof(struct avs_copier_sink_format) == 52);
 
 int avs_ipc_copier_set_sink_format(struct avs_dev *adev, u16 module_id,
 				   u8 instance_id, u32 sink_id,
@@ -878,6 +918,7 @@ struct avs_probe_dma {
 	union avs_connector_node_id node_id;
 	u32 dma_buffer_size;
 } __packed;
+static_assert(sizeof(struct avs_probe_dma) == 8);
 
 enum avs_probe_type {
 	AVS_PROBE_TYPE_INPUT = 0,
@@ -894,6 +935,7 @@ union avs_probe_point_id {
 		u32 index:6;
 	} id;
 } __packed;
+static_assert(sizeof(union avs_probe_point_id) == 4);
 
 enum avs_connection_purpose {
 	AVS_CONNECTION_PURPOSE_EXTRACT = 0,
@@ -906,6 +948,7 @@ struct avs_probe_point_desc {
 	u32 purpose;
 	union avs_connector_node_id node_id;
 } __packed;
+static_assert(sizeof(struct avs_probe_point_desc) == 12);
 
 int avs_ipc_probe_get_dma(struct avs_dev *adev, struct avs_probe_dma **dmas, size_t *num_dmas);
 int avs_ipc_probe_attach_dma(struct avs_dev *adev, struct avs_probe_dma *dmas, size_t num_dmas);
-- 
2.25.1

