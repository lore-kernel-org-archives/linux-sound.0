Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8333DC4CC
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 09:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788168732; cv=none; b=pzSO5nQLKXsO2+qpyIjFsipPo/oQVh8myZBpS9oSJV0N6I3YmxjX0TRQ4tWoCDMdW0YAEwNgDstVzwAFDg4U2kV5KLNKkbHvkkPvA60FiqHZmcpY/cBdMrb0aOEM4ioTUOLH8GPOoIwBM+jdQ85PAddjDdFsafGBJzPeDQwid+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788168732; c=relaxed/simple;
	bh=mdV92BFhfePLIjGpyX+kBx0c4+nev+O8zhp7OxvYnbQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sVsiXPPRfbmuCB+NnbQKhDwdvzhtRVJyh6xHuiHvaJB+U8GDPGaA/sqtu3keV79Kdne6qLKvEheajsGc56AM9QAdgj6qojNFxlDa8snBjqlgs/MlU+LCazwCuI7rpEufgMoqI2nSzTiJ62eHfuF5/yWLD4wyGpIcq7YhZ1tt0SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PBCkVANH; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PBCkVANH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788168730; x=1819704730;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mdV92BFhfePLIjGpyX+kBx0c4+nev+O8zhp7OxvYnbQ=;
  b=PBCkVANHZFQfLg+7resbUaw9ycz8ZDr5t4beKTkf+cIDhoW/Wu9S05Pz
   I4tIpC4Mm3J64N2rftwUv8LODfjXV0dop6TE26qNrVwJ3bcbHUU40/BOe
   HBwJDDhQIbFdaSxZOwr8Wg5R/+PDkkvkT6q0QQJeMEpeoZ+itPcaLlsGc
   XDiGTKd2KbI3DT1PC87tFi4HQd8ROBSIx8ux+mApYIjq5fdI4TCDH6Ltu
   OjhA7yNO2g+QeXlwmR3hlPGShoYFBhppw43l2d1TqS9oJlhk5bNNW7www
   sUp1csO6aMa3+LrjJwnRuWyWKeR6qqxYXYV2939eNT5QNGck0CduTVROi
   w==;
X-CSE-ConnectionGUID: 7/B4Mqj8TRi7349DRd2nLA==
X-CSE-MsgGUID: 5BK4ggkiTJmb3hN6xHomJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88333035"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="88333035"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 02:32:10 -0700
X-CSE-ConnectionGUID: qhvulsAfQkqPfRu1CDED+Q==
X-CSE-MsgGUID: Hb/6L06OSpevrWRiZUEuZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="265508068"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa007.fm.intel.com with ESMTP; 31 Aug 2026 02:32:08 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 10/11] ASoC: Intel: avs: Refactor and fix init_config access
Date: Mon, 31 Aug 2026 11:36:14 +0200
Message-Id: <20260831093615.1117987-11-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260831093615.1117987-1-cezary.rojewski@intel.com>
References: <20260831093615.1117987-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Existing code accesses enties found in ->init_configs array through
indexes that are part of ->config_ids array.  Those two are limited by:
->num_init_configs and ->num_config_ids respectively.  Using ID larger
or equal to ->num_init_configs leads to out-of-bounds access:

avs_path_module_send_init_configs()
loop:
	(...) &acomp->tplg->init_configs[ids[i]]
					^ out-of-bounds candidate

Rather than adding another if-statement, refactor the code.  There is no
need to store the IDs, have a list of pointers to actual config-entries
instead.  As the verification of ->init_config entries does not differ from
verification of other types that are part of the topology.c file, simply
reuse the code.

Fixes: 8a49ef789b1b ("ASoC: Intel: avs: Send initial config to module if present")
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/path.c     | 11 +++-----
 sound/soc/intel/avs/topology.c | 47 +++++++++++++++++++---------------
 sound/soc/intel/avs/topology.h |  4 +--
 3 files changed, 32 insertions(+), 30 deletions(-)

diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
index 213d6ecdd7cc..a8a2b3484338 100644
--- a/sound/soc/intel/avs/path.c
+++ b/sound/soc/intel/avs/path.c
@@ -836,15 +836,10 @@ static int avs_path_module_type_create(struct avs_dev *adev, struct avs_path_mod
 
 static int avs_path_module_send_init_configs(struct avs_dev *adev, struct avs_path_module *mod)
 {
-	struct avs_soc_component *acomp;
+	struct avs_tplg_module *template = mod->template;
 
-	acomp = to_avs_soc_component(mod->template->owner->owner->owner->owner->comp);
-
-	u32 num_ids = mod->template->num_config_ids;
-	u32 *ids = mod->template->config_ids;
-
-	for (int i = 0; i < num_ids; i++) {
-		struct avs_tplg_init_config *config = &acomp->tplg->init_configs[ids[i]];
+	for (int i = 0; i < template->num_init_configs; i++) {
+		struct avs_tplg_init_config *config = template->init_configs[i];
 		size_t len = config->length;
 		void *data = config->data;
 		u32 param = config->param;
diff --git a/sound/soc/intel/avs/topology.c b/sound/soc/intel/avs/topology.c
index d5e641c73faf..5d70be63a4a7 100644
--- a/sound/soc/intel/avs/topology.c
+++ b/sound/soc/intel/avs/topology.c
@@ -350,6 +350,7 @@ AVS_DEFINE_PTR_PARSER(modcfg_base, struct avs_tplg_modcfg_base, modcfgs_base);
 AVS_DEFINE_PTR_PARSER(modcfg_ext, struct avs_tplg_modcfg_ext, modcfgs_ext);
 AVS_DEFINE_PTR_PARSER(pplcfg, struct avs_tplg_pplcfg, pplcfgs);
 AVS_DEFINE_PTR_PARSER(binding, struct avs_tplg_binding, bindings);
+AVS_DEFINE_PTR_PARSER(init_config, struct avs_tplg_init_config, init_configs);
 AVS_DEFINE_PTR_PARSER(nhlt_config, struct avs_tplg_nhlt_config, nhlt_configs);
 
 static int
@@ -1198,7 +1199,7 @@ static const struct avs_tplg_token_parser module_parsers[] = {
 	{
 		.token = AVS_TKN_MOD_INIT_CONFIG_NUM_IDS_U32,
 		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
-		.offset = offsetof(struct avs_tplg_module, num_config_ids),
+		.offset = offsetof(struct avs_tplg_module, num_init_configs),
 		.parse = avs_parse_byte_token,
 	},
 	{
@@ -1214,10 +1215,32 @@ static const struct avs_tplg_token_parser init_config_parsers[] = {
 		.token = AVS_TKN_MOD_INIT_CONFIG_ID_U32,
 		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
 		.offset = 0,
-		.parse = avs_parse_word_token,
+		.parse = avs_parse_init_config_ptr,
 	},
 };
 
+static int avs_tplg_module_init_configs(struct snd_soc_component *comp,
+					struct avs_tplg_module *module,
+					struct snd_soc_tplg_vendor_array *tuples, u32 block_size)
+{
+	struct avs_tplg_init_config **cfgs;
+	int ret;
+
+	if (!module->num_init_configs)
+		return -EINVAL;
+
+	cfgs = devm_kcalloc(comp->card->dev, module->num_init_configs, sizeof(*cfgs), GFP_KERNEL);
+	if (!cfgs)
+		return -ENOMEM;
+
+	ret = parse_dictionary_entries(comp, tuples, block_size, cfgs, module->num_init_configs,
+				       sizeof(*cfgs), AVS_TKN_MOD_INIT_CONFIG_ID_U32,
+				       init_config_parsers, ARRAY_SIZE(init_config_parsers));
+	if (!ret)
+		module->init_configs = cfgs;
+	return ret;
+}
+
 static struct avs_tplg_module *
 avs_tplg_module_create(struct snd_soc_component *comp, struct avs_tplg_pipeline *owner,
 		       struct snd_soc_tplg_vendor_array *tuples, u32 block_size)
@@ -1244,27 +1267,11 @@ avs_tplg_module_create(struct snd_soc_component *comp, struct avs_tplg_pipeline
 	block_size -= esize;
 	/* Parse trailing config ids if any. */
 	if (block_size) {
-		u32 num_config_ids = module->num_config_ids;
-		u32 *config_ids;
-
-		if (!num_config_ids)
-			return ERR_PTR(-EINVAL);
-
-		config_ids = devm_kcalloc(comp->card->dev, num_config_ids, sizeof(*config_ids),
-					   GFP_KERNEL);
-		if (!config_ids)
-			return ERR_PTR(-ENOMEM);
-
 		tuples = avs_tplg_vendor_array_at(tuples, esize);
-		ret = parse_dictionary_entries(comp, tuples, block_size,
-					       config_ids, num_config_ids, sizeof(*config_ids),
-					       AVS_TKN_MOD_INIT_CONFIG_ID_U32,
-					       init_config_parsers,
-					       ARRAY_SIZE(init_config_parsers));
+
+		ret = avs_tplg_module_init_configs(comp, module, tuples, block_size);
 		if (ret)
 			return ERR_PTR(ret);
-
-		module->config_ids = config_ids;
 	}
 
 	module->owner = owner;
diff --git a/sound/soc/intel/avs/topology.h b/sound/soc/intel/avs/topology.h
index b5799c994b88..189984ce7b51 100644
--- a/sound/soc/intel/avs/topology.h
+++ b/sound/soc/intel/avs/topology.h
@@ -221,8 +221,8 @@ struct avs_tplg_module {
 	u8 domain;
 	struct avs_tplg_modcfg_ext *cfg_ext;
 	u32 ctl_id;
-	u32 num_config_ids;
-	u32 *config_ids;
+	u32 num_init_configs;
+	struct avs_tplg_init_config **init_configs;
 	struct avs_tplg_nhlt_config *nhlt_config;
 
 	struct avs_tplg_pipeline *owner;
-- 
2.34.1

