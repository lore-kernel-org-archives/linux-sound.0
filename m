Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5014A3D35
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 16:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788194329; cv=none; b=GzSqr245LzGLiWs5sdcI4JBUhP9dprckh+hTo1hLuCwPs5HyRgSNzLuawXsLuGCJhRgZOq/3KHrrvQgk5iPFPF4H0Unl3CUfsEIR1d/dvcd1mpzHqp9yDdcjFr/POsgJ/99tMLtifrLmFkQWAgypGzSSY5/pGpJSWI384Ee+8Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788194329; c=relaxed/simple;
	bh=mdV92BFhfePLIjGpyX+kBx0c4+nev+O8zhp7OxvYnbQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LwwVc9bCQLHDeRhzYIytllB5eAr8n0T6JdUnUkED0w3yfMbY3CuBysz2jPPoUy1plMIFJEHXLEhopkA4rfxMnR9rDf4aReaMX6OqsvmHixv6m014IBu7E7+uKjXtr0KoNljVke2bSSQicDte98az/rog5zU0NSY1djKqcXiaIrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KKiU6lst; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KKiU6lst"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788194328; x=1819730328;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mdV92BFhfePLIjGpyX+kBx0c4+nev+O8zhp7OxvYnbQ=;
  b=KKiU6lstqAjzGKWejkG/VKzoHLEEjzQuMZ7WtgUShv9ULlIUXRELLWqA
   DiqIzbS8dfKgVsrw7/MOxQwwUhr7VhLDShGJ49v2AtUJj1NqG/a/fQQYF
   DrQHp/5HN3173L/E73FMf45ymM1MOPBUYLr1+qmGzMLVKMZqyTIBFylOd
   PWbubS8QpuWod+bpfaV1Qo4HDTYpd4BkMgtzo6/ZkZOGNiGINrHeY9rZK
   wDtwWm27oFtatrfoZJQYApjhqWHXE2qRGHJZ7SiSGayOJs6jtWjYkIh2f
   VXWUaVh9FIlbIf7Q2kreD83BO2DI1LnBkcfu5XLIJSH1YTm2lN1fv/0RC
   g==;
X-CSE-ConnectionGUID: PD4Rl7wTSempjd4YSqJQmA==
X-CSE-MsgGUID: V36Xjd+ATCWxC2d1r99WwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="111379764"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="111379764"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 09:38:48 -0700
X-CSE-ConnectionGUID: vmXEo4m8Si2ViR1hW5Fw8A==
X-CSE-MsgGUID: hzk8kDuKTNi2d4DpxCxb+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="274111899"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa005.fm.intel.com with ESMTP; 31 Aug 2026 09:38:46 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v3 09/10] ASoC: Intel: avs: Refactor and fix init_config access
Date: Mon, 31 Aug 2026 18:42:32 +0200
Message-Id: <20260831164233.1487766-10-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260831164233.1487766-1-cezary.rojewski@intel.com>
References: <20260831164233.1487766-1-cezary.rojewski@intel.com>
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

