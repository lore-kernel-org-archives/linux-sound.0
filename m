Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FFF463B9E
	for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 13:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787836309; cv=none; b=jT3mhDZEDg+RUqXXZsJ0F91iNeiGGHPcRbkBJCK9YcWUOM8U1bmvE0ZGi1IbGBZRmjIXhLuwu98yDAndve2s7ATPsn6ITpzjiXINikejW6Oz+9MbzcVgy1BMrwMq+VJhOcxrSb8gWS4UJlnVZZbm7toIdmGUYQ9uRySvsJtNxCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787836309; c=relaxed/simple;
	bh=Wv5c3xMBJgvipzi7MgZidvwa73ccNDP5FeIcv7cptd4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dWbRi4hJM9qJfmeBYlgbvKFSbXQY6BBKQh/ZS8Hfeca4qDMwHEf4Cf18gch5aOSE2b+EL1SeNhwvHxS/gbCPnCiY1xYOz/ekgrMlfMrr6H2q219aKYPgVOIJd9DR0TOYUIyiXJcnaBVfw3Bod1jq004IUCkClLCMUXV0I6/MBq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IQ6hhVL5; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IQ6hhVL5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787836300; x=1819372300;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Wv5c3xMBJgvipzi7MgZidvwa73ccNDP5FeIcv7cptd4=;
  b=IQ6hhVL5tHrxV6dfwv7v72qWI+4+jMSNuHYFapYQ1vsejFmallYBC9tG
   2Mx2Xb7G8zRDS86i/01KgIfUEQur8RIP1S7zPlgji4e9jSGjfbmPXIg3l
   QWDzMICR95oLGGvWqJbG5nctTeR5CxYOdgLVF3f6r8ohRv/6I1r1QFOO8
   P/czPHu1eQUkfEueis8gsFo/VUIdnJJIHpnvNt38H8S7HLCrA5hXSzSGh
   SmSwHLujIFOYFVwypjBKqQpX3mzS7SssR60TdvpenLKwvEvF9eiXNw11s
   3SgjFcI1D37UzqK1FDm1AAezSBqC047fzyKdwTeup6n54j9qX84G9KkcT
   A==;
X-CSE-ConnectionGUID: gKIPrEZ7TmKpzK9aKs0pEg==
X-CSE-MsgGUID: sWCp68GmQGqOG8/OjfptMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88539094"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="88539094"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 06:11:05 -0700
X-CSE-ConnectionGUID: iuQH9AoJTki9YKug6wZvdQ==
X-CSE-MsgGUID: 9PCH445RQCy622q7MCqjmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="263589370"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa006.fm.intel.com with ESMTP; 27 Aug 2026 06:11:02 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 09/10] ASoC: Intel: avs: Refactor and fix init_config access
Date: Thu, 27 Aug 2026 15:15:09 +0200
Message-Id: <20260827131510.1014084-10-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260827131510.1014084-1-cezary.rojewski@intel.com>
References: <20260827131510.1014084-1-cezary.rojewski@intel.com>
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
 sound/soc/intel/avs/path.c     | 10 +++-----
 sound/soc/intel/avs/topology.c | 47 +++++++++++++++++++---------------
 sound/soc/intel/avs/topology.h |  4 +--
 3 files changed, 33 insertions(+), 28 deletions(-)

diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
index 213d6ecdd7cc..2207996d2552 100644
--- a/sound/soc/intel/avs/path.c
+++ b/sound/soc/intel/avs/path.c
@@ -836,15 +836,13 @@ static int avs_path_module_type_create(struct avs_dev *adev, struct avs_path_mod
 
 static int avs_path_module_send_init_configs(struct avs_dev *adev, struct avs_path_module *mod)
 {
+	struct avs_tplg_module *template = mod->template;
 	struct avs_soc_component *acomp;
 
-	acomp = to_avs_soc_component(mod->template->owner->owner->owner->owner->comp);
+	acomp = to_avs_soc_component(template->owner->owner->owner->owner->comp);
 
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

