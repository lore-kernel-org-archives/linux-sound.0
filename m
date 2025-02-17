Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB4D216E3D
	for <linux-sound@vger.kernel.org>; Mon, 17 Feb 2025 10:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739786848; cv=none; b=UIel3ZTEY6yPlh4DFrf7nu+t/sfnKPNlGk23b+DG35Nh88Xh1gdJI6+PVYjWtZKbr6bt2JSv67Ziu/DIjpScL1ki0xKNpgo0aeT+sQ3KL6UiIqEWVgheLfy3o2oxPcYYwDRmjuEoNwyGylvn8rVTD2zgioGWjx6Pme39UtjXA94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739786848; c=relaxed/simple;
	bh=fBvEsiCMIUJtjp7bTeteXWv2BjRuhe53deQjU/fFi4k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GJ70dqsSnuuEwzjqN9HB49f4lYZmd7P7gf2Mcpt+ncyAKw/rCIKLRd0kq3DYIqtPgX6JjfZPUtrcIBKyDbiX6QwxHyPsgUxf1mJK63EymeBn1f1jf/Pe6A/I8Q0rdrxdzlPSgvpl6uLZNjgd4cZ6gWpinRG/SaCMxDApmiQ8l60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dg5G/HUl; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dg5G/HUl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739786847; x=1771322847;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fBvEsiCMIUJtjp7bTeteXWv2BjRuhe53deQjU/fFi4k=;
  b=dg5G/HUl7TbMq3zUykvuN79Abaqmif/uZ4mmVjPLRzjKbEJRWYSlqM/g
   3UKuWPvbgtdtnJ/hIfRFNiGumTVBXFI/lNCDR6YU1QtaGYoChxe6DoHgl
   /PrRNsbM2UNfdGhfScijOS3s9/YJ3WyRveqS9VIJAPX2CjuDiW8NX+y3L
   KcKqaCrs6LWbGoEQb/CLfVh3Uj4R0CkfdOY8Bvbuw0BDDtNuwEPTA1ThY
   wOEZRmizj6LN+Y0od+EzmyYaMVTa4WPQhDuzpKpql2H1dplxXgfIagBZ0
   uIijEMN5e6ICETAYhFdq1A4b1K/M5Ccs4SJfsvGqVAO9Efs9S0LPv+iMM
   w==;
X-CSE-ConnectionGUID: DebyrY7sTaG8Dkhu4EF6mw==
X-CSE-MsgGUID: x14TyU70TW+HETe5np5PRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="65818297"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; 
   d="scan'208";a="65818297"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 02:07:26 -0800
X-CSE-ConnectionGUID: L97tmUHrTA+Zar/0vd8erA==
X-CSE-MsgGUID: a6wB9xqzQb2MFR8rv/U8EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118219055"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by fmviesa003.fm.intel.com with ESMTP; 17 Feb 2025 02:07:25 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 03/10] ASoC: Intel: avs: Make PEAKVOL configurable from topology
Date: Mon, 17 Feb 2025 11:21:08 +0100
Message-Id: <20250217102115.3539427-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250217102115.3539427-1-cezary.rojewski@intel.com>
References: <20250217102115.3539427-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver exposes volume kcontrols if PEAKVOL/GAIN module is present
in the streaming path. Currently there is no control over their default
values including the effect that may accompany the volume change event.

Add template for PEAKVOL/GAIN module which holds all the information
needed to address the limitation.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/uapi/sound/intel/avs/tokens.h |  4 ++++
 sound/soc/intel/avs/path.c            |  4 ++--
 sound/soc/intel/avs/topology.c        | 18 ++++++++++++++++++
 sound/soc/intel/avs/topology.h        |  5 +++++
 4 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/include/uapi/sound/intel/avs/tokens.h b/include/uapi/sound/intel/avs/tokens.h
index 06ff30537f47..c9f845b3c523 100644
--- a/include/uapi/sound/intel/avs/tokens.h
+++ b/include/uapi/sound/intel/avs/tokens.h
@@ -84,6 +84,10 @@ enum avs_tplg_token {
 	AVS_TKN_MODCFG_WHM_DMA_TYPE_U32			= 437,
 	AVS_TKN_MODCFG_WHM_DMABUFF_SIZE_U32		= 438,
 	AVS_TKN_MODCFG_WHM_BLOB_AFMT_ID_U32		= 439,
+	AVS_TKN_MODCFG_PEAKVOL_VOLUME_U32		= 440,
+	AVS_TKN_MODCFG_PEAKVOL_CHANNEL_ID_U32		= 441, /* reserved */
+	AVS_TKN_MODCFG_PEAKVOL_CURVE_TYPE_U32		= 442,
+	AVS_TKN_MODCFG_PEAKVOL_CURVE_DURATION_U32	= 443,
 
 	/* struct avs_tplg_pplcfg */
 	AVS_TKN_PPLCFG_ID_U32				= 1401,
diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
index dfb85bd2b665..329838119015 100644
--- a/sound/soc/intel/avs/path.c
+++ b/sound/soc/intel/avs/path.c
@@ -350,8 +350,8 @@ static int avs_peakvol_create(struct avs_dev *adev, struct avs_path_module *mod)
 	cfg->base.audio_fmt = *t->in_fmt;
 	cfg->vols[0].target_volume = volume;
 	cfg->vols[0].channel_id = AVS_ALL_CHANNELS_MASK;
-	cfg->vols[0].curve_type = AVS_AUDIO_CURVE_NONE;
-	cfg->vols[0].curve_duration = 0;
+	cfg->vols[0].curve_type = t->cfg_ext->peakvol.curve_type;
+	cfg->vols[0].curve_duration = t->cfg_ext->peakvol.curve_duration;
 
 	ret = avs_dsp_init_module(adev, mod->module_id, mod->owner->instance_id, t->core_id,
 				  t->domain, cfg, cfg_size, &mod->instance_id);
diff --git a/sound/soc/intel/avs/topology.c b/sound/soc/intel/avs/topology.c
index 471b00b9a149..45952fbe9694 100644
--- a/sound/soc/intel/avs/topology.c
+++ b/sound/soc/intel/avs/topology.c
@@ -857,6 +857,24 @@ static const struct avs_tplg_token_parser modcfg_ext_parsers[] = {
 		.offset = offsetof(struct avs_tplg_modcfg_ext, whm.blob_fmt),
 		.parse = avs_parse_audio_format_ptr,
 	},
+	{
+		.token = AVS_TKN_MODCFG_PEAKVOL_VOLUME_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, peakvol.target_volume),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_MODCFG_PEAKVOL_CURVE_TYPE_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, peakvol.curve_type),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_MODCFG_PEAKVOL_CURVE_DURATION_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, peakvol.curve_duration),
+		.parse = avs_parse_word_token,
+	},
 };
 
 static const struct avs_tplg_token_parser pin_format_parsers[] = {
diff --git a/sound/soc/intel/avs/topology.h b/sound/soc/intel/avs/topology.h
index 23d5ccd19959..304880997717 100644
--- a/sound/soc/intel/avs/topology.h
+++ b/sound/soc/intel/avs/topology.h
@@ -113,6 +113,11 @@ struct avs_tplg_modcfg_ext {
 		struct {
 			struct avs_audio_format *out_fmt;
 		} micsel;
+		struct {
+			u32 target_volume;
+			u32 curve_type;
+			u32 curve_duration;
+		} peakvol;
 	};
 };
 
-- 
2.25.1

