Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117AA1DE4E1
	for <linux-sound@vger.kernel.org>; Sat, 15 Nov 2025 17:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763228762; cv=none; b=bCjcB2Qa5TIYOBi7aIpuWc5Ep5iP8TU2rxbugOwBPJHj8kW1G7Ly2iI3ufuuPYp429jYFxgIrzcMBP9pjfUx1nMxMVlr5HqqZp1qaA3vQi14F0gvBKn1J9WwT0/qkeeCdqZla2m2y5X23U0m752O55mZ2nSXblMGGlppueqtGmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763228762; c=relaxed/simple;
	bh=tl53blgYWMjkeRI26v9wAg4DeZt6VydK4LTGJtULMOA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A8rFtc5bKB3Hku1eKIiSkSnujREpIlkDIUEuThOVk5DLvvFkZS1WkMPAD0Kkxi6ixY1Z3eeDVysIREyCbXMxAVvxYp+xL+Ap1jI29aJzI318ytOmc3THf5K77Ot2e0YWusPxHcA9sZSypafYDBeueOm9xk+7q6qhZkrue6S8s0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NtRpld9S; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NtRpld9S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763228760; x=1794764760;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tl53blgYWMjkeRI26v9wAg4DeZt6VydK4LTGJtULMOA=;
  b=NtRpld9S6sLWfsx4EN1HSERbetJtwOymZO+84h85Z1zihui+NyWLtph4
   pCynEpovfFOSGUVyAmlJR/R3JT4MIL7hCxRk2heL/YWsfO3glB6kIGqeP
   8kmrMRRp15TzjsCzN1VXCi4J2mkK6m8crljUIAV1HJj1TNHwlqJFyHFR9
   RBZQbTOEfAySPxam8RvAUmvCXjOTLWUdlUzyJxyuNaYoD7+bdcsecGvYU
   71PE6ISqRE8ogggbYQ9LUJKn2lmtJeCL4lB3hLnXNRZe1Yjyp9wiHeC8A
   RWAnXOqewv8mUK/MGRKc38MCC+/r64UbKIEg/Ab7GRaCs0Jjt0S9SOT5c
   Q==;
X-CSE-ConnectionGUID: HitRnVD5TyCAKqjkTjJNKQ==
X-CSE-MsgGUID: D0M0zaWzSJy4eAuiEY3l3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65228302"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="65228302"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2025 09:45:59 -0800
X-CSE-ConnectionGUID: JHCYTVcWSGWPXFcnj3MMUQ==
X-CSE-MsgGUID: aPXOnUGATxWqtYtCXP+qnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,307,1754982000"; 
   d="scan'208";a="190099173"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa007.jf.intel.com with ESMTP; 15 Nov 2025 09:45:57 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 1/2] ASoC: Intel: avs: Allow the topology to carry NHLT data
Date: Sat, 15 Nov 2025 19:06:26 +0100
Message-Id: <20251115180627.3589520-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251115180627.3589520-1-cezary.rojewski@intel.com>
References: <20251115180627.3589520-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Typically the hardware configuration for I2S and DMIC devices resides
in the Non-HDAudio Link Table (NHLT) that is part of the ACPI tree. As
the NHLTs existing in the field are not always perfect, workaround
mechanisms are provided to patch them.

Currently the avs-driver is utilizing the ->blob_fmt override (see
topology.h and struct avs_tplg_modcfg_ext) when there is a valid entry
within a NHLT to configure the hardware for specific format but its
descriptor (header) is invalid.

A separate case is when there is no correct hardware configuration at
all within the NHLT available in the system. Patching the header won't
help and forcing ad-hoc BIOS updates for dated system is not feasible.
Allowing the topology to carry the data is the solution of choice as
replacing a userspace file that is part of /lib/firmware/intel/ is less
invasive than BIOS update and solves the problem.

Co-developed-by: Amadeusz Sławiński <amade@asmblr.net>
Signed-off-by: Amadeusz Sławiński <amade@asmblr.net>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/uapi/sound/intel/avs/tokens.h |   5 ++
 sound/soc/intel/avs/topology.c        | 106 +++++++++++++++++++++++++-
 sound/soc/intel/avs/topology.h        |   7 ++
 3 files changed, 115 insertions(+), 3 deletions(-)

diff --git a/include/uapi/sound/intel/avs/tokens.h b/include/uapi/sound/intel/avs/tokens.h
index f3ff6aae09a9..f7cbbfb00227 100644
--- a/include/uapi/sound/intel/avs/tokens.h
+++ b/include/uapi/sound/intel/avs/tokens.h
@@ -21,6 +21,7 @@ enum avs_tplg_token {
 	AVS_TKN_MANIFEST_NUM_BINDINGS_U32		= 8,
 	AVS_TKN_MANIFEST_NUM_CONDPATH_TMPLS_U32		= 9,
 	AVS_TKN_MANIFEST_NUM_INIT_CONFIGS_U32		= 10,
+	AVS_TKN_MANIFEST_NUM_NHLT_CONFIGS_U32		= 11,
 
 	/* struct avs_tplg_library */
 	AVS_TKN_LIBRARY_ID_U32				= 101,
@@ -160,6 +161,10 @@ enum avs_tplg_token {
 	AVS_TKN_INIT_CONFIG_ID_U32			= 2401,
 	AVS_TKN_INIT_CONFIG_PARAM_U8			= 2402,
 	AVS_TKN_INIT_CONFIG_LENGTH_U32			= 2403,
+
+	/* struct avs_tplg_nhlt_config */
+	AVS_TKN_NHLT_CONFIG_ID_U32			= 2501,
+	AVS_TKN_NHLT_CONFIG_SIZE_U32			= 2502,
 };
 
 #endif
diff --git a/sound/soc/intel/avs/topology.c b/sound/soc/intel/avs/topology.c
index dfe8cf505381..48fdbaef56dd 100644
--- a/sound/soc/intel/avs/topology.c
+++ b/sound/soc/intel/avs/topology.c
@@ -420,6 +420,22 @@ static int parse_link_formatted_string(struct snd_soc_component *comp, void *ele
 	return 0;
 }
 
+static int avs_parse_nhlt_config_size(struct snd_soc_component *comp, void *elem, void *object,
+				      u32 offset)
+{
+	struct snd_soc_tplg_vendor_value_elem *tuple = elem;
+	struct acpi_nhlt_config **blob = (struct acpi_nhlt_config **)((u8 *)object + offset);
+	u32 size;
+
+	size = le32_to_cpu(tuple->value);
+	*blob = devm_kzalloc(comp->card->dev, struct_size(*blob, capabilities, size), GFP_KERNEL);
+	if (!*blob)
+		return -ENOMEM;
+
+	(*blob)->capabilities_size = size;
+	return 0;
+}
+
 static int
 parse_dictionary_header(struct snd_soc_component *comp,
 			struct snd_soc_tplg_vendor_array *tuples,
@@ -1651,12 +1667,14 @@ static const struct avs_tplg_token_parser mod_init_config_parsers[] = {
 
 static int avs_tplg_parse_initial_configs(struct snd_soc_component *comp,
 					   struct snd_soc_tplg_vendor_array *tuples,
-					   u32 block_size)
+					   u32 block_size, u32 *offset)
 {
 	struct avs_soc_component *acomp = to_avs_soc_component(comp);
 	struct avs_tplg *tplg = acomp->tplg;
 	int ret, i;
 
+	*offset = 0;
+
 	/* Parse tuple section telling how many init configs there are. */
 	ret = parse_dictionary_header(comp, tuples, (void **)&tplg->init_configs,
 				      &tplg->num_init_configs,
@@ -1666,6 +1684,7 @@ static int avs_tplg_parse_initial_configs(struct snd_soc_component *comp,
 		return ret;
 
 	block_size -= le32_to_cpu(tuples->size);
+	*offset += le32_to_cpu(tuples->size);
 	/* With header parsed, move on to parsing entries. */
 	tuples = avs_tplg_vendor_array_next(tuples);
 
@@ -1681,6 +1700,7 @@ static int avs_tplg_parse_initial_configs(struct snd_soc_component *comp,
 		 */
 		tmp = avs_tplg_vendor_array_next(tuples);
 		esize = le32_to_cpu(tuples->size) + le32_to_cpu(tmp->size);
+		*offset += esize;
 
 		ret = parse_dictionary_entries(comp, tuples, esize, config, 1, sizeof(*config),
 					       AVS_TKN_INIT_CONFIG_ID_U32,
@@ -1692,6 +1712,7 @@ static int avs_tplg_parse_initial_configs(struct snd_soc_component *comp,
 		/* handle raw data section */
 		init_config_data = (void *)tuples + esize;
 		esize = config->length;
+		*offset += esize;
 
 		config->data = devm_kmemdup(comp->card->dev, init_config_data, esize, GFP_KERNEL);
 		if (!config->data)
@@ -1704,6 +1725,70 @@ static int avs_tplg_parse_initial_configs(struct snd_soc_component *comp,
 	return 0;
 }
 
+static const struct avs_tplg_token_parser mod_nhlt_config_parsers[] = {
+	{
+		.token = AVS_TKN_NHLT_CONFIG_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_nhlt_config, id),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_NHLT_CONFIG_SIZE_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_nhlt_config, blob),
+		.parse = avs_parse_nhlt_config_size,
+	},
+};
+
+static int avs_tplg_parse_nhlt_configs(struct snd_soc_component *comp,
+				       struct snd_soc_tplg_vendor_array *tuples,
+				       u32 block_size)
+{
+	struct avs_soc_component *acomp = to_avs_soc_component(comp);
+	struct avs_tplg *tplg = acomp->tplg;
+	int ret, i;
+
+	/* Parse the header section to know how many entries there are. */
+	ret = parse_dictionary_header(comp, tuples, (void **)&tplg->nhlt_configs,
+				      &tplg->num_nhlt_configs,
+				      sizeof(*tplg->nhlt_configs),
+				      AVS_TKN_MANIFEST_NUM_NHLT_CONFIGS_U32);
+	if (ret)
+		return ret;
+
+	block_size -= le32_to_cpu(tuples->size);
+	/* With the header parsed, move on to parsing entries. */
+	tuples = avs_tplg_vendor_array_next(tuples);
+
+	for (i = 0; i < tplg->num_nhlt_configs && block_size > 0; i++) {
+		struct avs_tplg_nhlt_config *config;
+		u32 esize;
+
+		config = &tplg->nhlt_configs[i];
+		esize = le32_to_cpu(tuples->size);
+
+		ret = parse_dictionary_entries(comp, tuples, esize, config, 1, sizeof(*config),
+					       AVS_TKN_NHLT_CONFIG_ID_U32,
+					       mod_nhlt_config_parsers,
+					       ARRAY_SIZE(mod_nhlt_config_parsers));
+		if (ret)
+			return ret;
+		/* With tuples parsed, the blob shall be allocated. */
+		if (!config->blob)
+			return -EINVAL;
+
+		/* Consume the raw data and move to the next entry. */
+		memcpy(config->blob->capabilities, (u8 *)tuples + esize,
+		       config->blob->capabilities_size);
+		esize += config->blob->capabilities_size;
+
+		block_size -= esize;
+		tuples = avs_tplg_vendor_array_at(tuples, esize);
+	}
+
+	return 0;
+}
+
 static int avs_route_load(struct snd_soc_component *comp, int index,
 			  struct snd_soc_dapm_route *route)
 {
@@ -2008,11 +2093,26 @@ static int avs_manifest(struct snd_soc_component *comp, int index,
 	tuples = avs_tplg_vendor_array_at(tuples, offset);
 
 	/* Initial configs dictionary. */
-	ret = avs_tplg_parse_initial_configs(comp, tuples, remaining);
+	ret = avs_tplg_parse_initial_configs(comp, tuples, remaining, &offset);
 	if (ret < 0)
 		return ret;
 
-	return 0;
+	remaining -= offset;
+	tuples = avs_tplg_vendor_array_at(tuples, offset);
+
+	ret = avs_tplg_vendor_array_lookup(tuples, remaining,
+					   AVS_TKN_MANIFEST_NUM_NHLT_CONFIGS_U32, &offset);
+	if (ret == -ENOENT)
+		return 0;
+	if (ret) {
+		dev_err(comp->dev, "NHLT config lookup failed: %d\n", ret);
+		return ret;
+	}
+
+	tuples = avs_tplg_vendor_array_at(tuples, offset);
+
+	/* NHLT configs dictionary. */
+	return avs_tplg_parse_nhlt_configs(comp, tuples, remaining);
 }
 
 enum {
diff --git a/sound/soc/intel/avs/topology.h b/sound/soc/intel/avs/topology.h
index 1e83fccf2ea2..61d50960ef06 100644
--- a/sound/soc/intel/avs/topology.h
+++ b/sound/soc/intel/avs/topology.h
@@ -37,6 +37,8 @@ struct avs_tplg {
 	u32 num_condpath_tmpls;
 	struct avs_tplg_init_config *init_configs;
 	u32 num_init_configs;
+	struct avs_tplg_nhlt_config *nhlt_configs;
+	u32 num_nhlt_configs;
 
 	struct list_head path_tmpl_list;
 };
@@ -175,6 +177,11 @@ struct avs_tplg_init_config {
 	void *data;
 };
 
+struct avs_tplg_nhlt_config {
+	u32 id;
+	struct acpi_nhlt_config *blob;
+};
+
 struct avs_tplg_path {
 	u32 id;
 
-- 
2.25.1

