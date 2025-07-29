Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A1B79CD
	for <linux-sound@vger.kernel.org>; Tue, 29 Jul 2025 12:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753793137; cv=none; b=gWM6huiWh0gH0Swk5Z1AB3OS2oG7+a40WxJJAu1EpQABbroY+C0XblATWnkZOdQPIKE3ydIHJgtGscthZ1ZSs6RROrIW7irBJRtKydNbQVTbnqytNBYry/cGlbfYqUb3N4XOLtCF6DYqFt4rEIaLsdGHaBmGtGiOr2hHMiUmoTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753793137; c=relaxed/simple;
	bh=ZOErvGT9D26ZjyX6IO8zIydriqjqGNl6Ka/92uPrmE4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZllzguGgUO5Na/l7JC8+7UN70imEgxWu6m9tZqYxAzkQCBlVF7jl2WhM01Lpbc9GSAz2/7xOF7cAqtkliShJCpUv8GXKZ7v08LbiG0UgC74BX69UMMyG8JxvzxNfHHkyAzqiCgmJzVlBprYOuEwKhSmIvcv3GpObGy9zvrWe5iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fp5q7/fj; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fp5q7/fj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753793136; x=1785329136;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZOErvGT9D26ZjyX6IO8zIydriqjqGNl6Ka/92uPrmE4=;
  b=fp5q7/fjmfBTievVVB4WRXP1LLVg1QTS5S7m122ZHh7B9pbXpJ6tPQlc
   ILBUkMAWF3JVBnNkQ3znK5RJC69sC0afQdJ2xaPbXOWfPAiYDOavSomMJ
   TB6R9jMHBxdWVvdXsS7IyZLvM3JzQkdAEmk1sNRBQQ5ihzwQ1tQaziS7T
   1g5gkb5r50saQvof6NVjg5c04kXPQmCKmYVNoNq/ULAOH2vlGOHm9ROeq
   5/GZVPFddKmK2KemaRrR4scU2rf11lzlbS92c/hE5IacNYB6wmC11fPcj
   pkHgded/M57U6M8dsPy+/OkvjhkE9yTr3eYVqmgtgDqR4s7Kj+SmOggkd
   Q==;
X-CSE-ConnectionGUID: yX36KaBCSIOqIKyTfF5Kaw==
X-CSE-MsgGUID: QeM0AJTVSiuMH5PrQhF7LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="55922865"
X-IronPort-AV: E=Sophos;i="6.16,349,1744095600"; 
   d="scan'208";a="55922865"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 05:45:35 -0700
X-CSE-ConnectionGUID: cGlCwTeeTPiB0mMmhQXVHg==
X-CSE-MsgGUID: oCUU14+8R3KUpfIUtjXy9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,349,1744095600"; 
   d="scan'208";a="193682143"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa002.jf.intel.com with ESMTP; 29 Jul 2025 05:45:33 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 1/2] ASoC: Intel: avs: Parse conditional path tuples
Date: Tue, 29 Jul 2025 15:06:32 +0200
Message-Id: <20250729130633.310388-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250729130633.310388-1-cezary.rojewski@intel.com>
References: <20250729130633.310388-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Conditional paths need information about their source and sink paths to
be created which is then stored to keep track of who their parents are.
That information allows to change their state accordingly to what is
currently happening to their parent paths.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/uapi/sound/intel/avs/tokens.h |  15 ++++
 sound/soc/intel/avs/topology.c        | 110 ++++++++++++++++++++++++++
 sound/soc/intel/avs/topology.h        |   8 ++
 3 files changed, 133 insertions(+)

diff --git a/include/uapi/sound/intel/avs/tokens.h b/include/uapi/sound/intel/avs/tokens.h
index c9f845b3c523..f3ff6aae09a9 100644
--- a/include/uapi/sound/intel/avs/tokens.h
+++ b/include/uapi/sound/intel/avs/tokens.h
@@ -133,6 +133,21 @@ enum avs_tplg_token {
 	AVS_TKN_PATH_FE_FMT_ID_U32			= 1902,
 	AVS_TKN_PATH_BE_FMT_ID_U32			= 1903,
 
+	/* struct avs_tplg_path_template (conditional) */
+	AVS_TKN_CONDPATH_TMPL_ID_U32			= 1801,
+	AVS_TKN_CONDPATH_TMPL_SOURCE_TPLG_NAME_STRING	= 2002,
+	AVS_TKN_CONDPATH_TMPL_SOURCE_PATH_TMPL_ID_U32	= 2003,
+	AVS_TKN_CONDPATH_TMPL_SINK_TPLG_NAME_STRING	= 2004,
+	AVS_TKN_CONDPATH_TMPL_SINK_PATH_TMPL_ID_U32	= 2005,
+	AVS_TKN_CONDPATH_TMPL_COND_TYPE_U32		= 2006,
+	AVS_TKN_CONDPATH_TMPL_OVERRIDABLE_BOOL		= 2007,
+	AVS_TKN_CONDPATH_TMPL_PRIORITY_U8		= 2008,
+
+	/* struct avs_tplg_path (conditional) */
+	AVS_TKN_CONDPATH_ID_U32				= 1901,
+	AVS_TKN_CONDPATH_SOURCE_PATH_ID_U32		= 2102,
+	AVS_TKN_CONDPATH_SINK_PATH_ID_U32		= 2103,
+
 	/* struct avs_tplg_pin_format */
 	AVS_TKN_PIN_FMT_INDEX_U32			= 2201,
 	AVS_TKN_PIN_FMT_IOBS_U32			= 2202,
diff --git a/sound/soc/intel/avs/topology.c b/sound/soc/intel/avs/topology.c
index f2e4ad8b8e14..dfe8cf505381 100644
--- a/sound/soc/intel/avs/topology.c
+++ b/sound/soc/intel/avs/topology.c
@@ -1387,6 +1387,27 @@ static const struct avs_tplg_token_parser path_parsers[] = {
 	},
 };
 
+static const struct avs_tplg_token_parser condpath_parsers[] = {
+	{
+		.token = AVS_TKN_CONDPATH_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_path, id),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_CONDPATH_SOURCE_PATH_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_path, source_path_id),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_CONDPATH_SINK_PATH_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_path, sink_path_id),
+		.parse = avs_parse_word_token,
+	},
+};
+
 static struct avs_tplg_path *
 avs_tplg_path_create(struct snd_soc_component *comp, struct avs_tplg_path_template *owner,
 		     struct snd_soc_tplg_vendor_array *tuples, u32 block_size,
@@ -1454,6 +1475,39 @@ static const struct avs_tplg_token_parser path_tmpl_parsers[] = {
 	},
 };
 
+static const struct avs_tplg_token_parser condpath_tmpl_parsers[] = {
+	{
+		.token = AVS_TKN_CONDPATH_TMPL_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_path_template, id),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_CONDPATH_TMPL_SOURCE_TPLG_NAME_STRING,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_STRING,
+		.offset = offsetof(struct avs_tplg_path_template, source.tplg_name),
+		.parse = avs_parse_string_token,
+	},
+	{
+		.token = AVS_TKN_CONDPATH_TMPL_SOURCE_PATH_TMPL_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_path_template, source.id),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_CONDPATH_TMPL_SINK_TPLG_NAME_STRING,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_STRING,
+		.offset = offsetof(struct avs_tplg_path_template, sink.tplg_name),
+		.parse = avs_parse_string_token,
+	},
+	{
+		.token = AVS_TKN_CONDPATH_TMPL_SINK_PATH_TMPL_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_path_template, sink.id),
+		.parse = avs_parse_word_token,
+	},
+};
+
 static int parse_path_template(struct snd_soc_component *comp,
 			       struct snd_soc_tplg_vendor_array *tuples, u32 block_size,
 			       struct avs_tplg_path_template *template,
@@ -1524,6 +1578,56 @@ avs_tplg_path_template_create(struct snd_soc_component *comp, struct avs_tplg *o
 	return template;
 }
 
+static int avs_tplg_parse_condpath_templates(struct snd_soc_component *comp,
+					     struct snd_soc_tplg_vendor_array *tuples,
+					     u32 block_size)
+{
+	struct avs_soc_component *acomp = to_avs_soc_component(comp);
+	struct avs_tplg *tplg = acomp->tplg;
+	int ret, i;
+
+	ret = parse_dictionary_header(comp, tuples, (void **)&tplg->condpath_tmpls,
+				      &tplg->num_condpath_tmpls,
+				      sizeof(*tplg->condpath_tmpls),
+				      AVS_TKN_MANIFEST_NUM_CONDPATH_TMPLS_U32);
+	if (ret)
+		return ret;
+
+	block_size -= le32_to_cpu(tuples->size);
+	/* With header parsed, move on to parsing entries. */
+	tuples = avs_tplg_vendor_array_next(tuples);
+
+	for (i = 0; i < tplg->num_condpath_tmpls; i++) {
+		struct avs_tplg_path_template *template;
+		u32 esize;
+
+		template = &tplg->condpath_tmpls[i];
+		template->owner = tplg; /* Used when building sysfs hierarchy. */
+		INIT_LIST_HEAD(&template->path_list);
+		INIT_LIST_HEAD(&template->node);
+
+		ret = avs_tplg_vendor_entry_size(tuples, block_size,
+						 AVS_TKN_CONDPATH_TMPL_ID_U32, &esize);
+		if (ret)
+			return ret;
+
+		ret = parse_path_template(comp, tuples, esize, template,
+					  condpath_tmpl_parsers,
+					  ARRAY_SIZE(condpath_tmpl_parsers),
+					  condpath_parsers,
+					  ARRAY_SIZE(condpath_parsers));
+		if (ret < 0) {
+			dev_err(comp->dev, "parse condpath_tmpl: %d failed: %d\n", i, ret);
+			return ret;
+		}
+
+		block_size -= esize;
+		tuples = avs_tplg_vendor_array_at(tuples, esize);
+	}
+
+	return 0;
+}
+
 static const struct avs_tplg_token_parser mod_init_config_parsers[] = {
 	{
 		.token = AVS_TKN_INIT_CONFIG_ID_U32,
@@ -1891,6 +1995,12 @@ static int avs_manifest(struct snd_soc_component *comp, int index,
 		return ret;
 	}
 
+	/* Condpaths dictionary. */
+	ret = avs_tplg_parse_condpath_templates(comp, tuples,
+						has_init_config ? offset : remaining);
+	if (ret < 0)
+		return ret;
+
 	if (!has_init_config)
 		return 0;
 
diff --git a/sound/soc/intel/avs/topology.h b/sound/soc/intel/avs/topology.h
index f5601a4e3ec8..1e83fccf2ea2 100644
--- a/sound/soc/intel/avs/topology.h
+++ b/sound/soc/intel/avs/topology.h
@@ -33,6 +33,7 @@ struct avs_tplg {
 	u32 num_pplcfgs;
 	struct avs_tplg_binding *bindings;
 	u32 num_bindings;
+	struct avs_tplg_path_template *condpath_tmpls;
 	u32 num_condpath_tmpls;
 	struct avs_tplg_init_config *init_configs;
 	u32 num_init_configs;
@@ -155,6 +156,10 @@ struct avs_tplg_path_template {
 
 	struct snd_soc_dapm_widget *w;
 
+	/* Conditional path. */
+	struct avs_tplg_path_template_id source;
+	struct avs_tplg_path_template_id sink;
+
 	struct list_head path_list;
 
 	struct avs_tplg *owner;
@@ -176,6 +181,9 @@ struct avs_tplg_path {
 	/* Path format requirements. */
 	struct avs_audio_format *fe_fmt;
 	struct avs_audio_format *be_fmt;
+	/* Condpath path-variant requirements. */
+	u32 source_path_id;
+	u32 sink_path_id;
 
 	struct list_head ppl_list;
 
-- 
2.25.1

