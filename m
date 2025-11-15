Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE47301007
	for <linux-sound@vger.kernel.org>; Sat, 15 Nov 2025 17:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763228762; cv=none; b=tZP6LNfswEvfBDQ/MDVYnfbDMlbFYUlRnZFijH9SoRnm7kjkUBadjIkgF71CWJUV6pyIVsz/it6wPJXm+//MwvwgHS57r/0z3HEf5hiIijoyiLzst1CoT6jz71us4RgCLogXtIWfk53gVss7ryhE2HMw4gusfGWIb/4bSisdRD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763228762; c=relaxed/simple;
	bh=QlzhVBfnk4rYrRavZCYu4nkZfvO+ebeUf70Ztt9nQos=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X/s3lsfZtvdlfEGDN3gRpTMtDnBk6ujVTsbORJTmhJw044Js4r1P58khVvLnAbGBG2WomMRzBDMMJXFrx3QcB7t3Td5ffF/51aSAE3HdzUiw2zCOIm3Pr5UIg03tQD+0JVxVGO+VaxC4FJTusFSqYwk3VjqPdtolTvtVgv5p+YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZkKy3Qf9; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZkKy3Qf9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763228761; x=1794764761;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QlzhVBfnk4rYrRavZCYu4nkZfvO+ebeUf70Ztt9nQos=;
  b=ZkKy3Qf9OchKH/lsbRCRkc/2OHTkdPvA5zFvVEUagk6tKSnoKbh8q3am
   OfRZZjYEIPNGb0ttCeBhdRG86NgUs2H/nAf3Fxz/fPpDinAKyptzlf0LJ
   xhA10fdI1tOIDXYA8GR/tE08pRHzJUSd9stEplZRPDGwYazTsxEhS49CF
   EXf7iFuG1/Cfx549TkyII6wiE254smWfWOYjnuxam+eP2T0SjFbtL7RbB
   Yvopgq9CER+wledFCDriJaWwkF3tkQ+U0asG8MSEnOI+Kyl7ckPAM9G5/
   OzngFTs3q6jgKc60OMI9gMYDHgo84j2lIxmSmk7R2eZbtCho6HtmSBLtO
   Q==;
X-CSE-ConnectionGUID: vpmTl9DiSDO2aN1DrbVIgQ==
X-CSE-MsgGUID: dE63xX9CTcyPZCMveslIWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65228309"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="65228309"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2025 09:46:00 -0800
X-CSE-ConnectionGUID: 565yA/iqRfq0Qouwh1weBQ==
X-CSE-MsgGUID: Ew3jSuKzRmukAQbcmujHnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,307,1754982000"; 
   d="scan'208";a="190099181"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa007.jf.intel.com with ESMTP; 15 Nov 2025 09:45:58 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 2/2] ASoC: Intel: avs: Honor NHLT override when setting up a path
Date: Sat, 15 Nov 2025 19:06:27 +0100
Message-Id: <20251115180627.3589520-3-cezary.rojewski@intel.com>
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

In case topology provides NHLT configuration, use it instead of relying
on the table in ACPI tree. Only gateway-related modules e.g.: Copier
care about the process. For those the order of fetching for hardware
configuration becomes:

1) check if NHLT override is set,
2) check if NHLT descriptor override is set,
3) use NHLT from ACPI directly

Such approach ensures no conflicts exist between 1) and 2) and that 1)
always takes precedence.

Co-developed-by: Amadeusz Sławiński <amade@asmblr.net>
Signed-off-by: Amadeusz Sławiński <amade@asmblr.net>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/uapi/sound/intel/avs/tokens.h |  1 +
 sound/soc/intel/avs/path.c            | 13 +++++++++----
 sound/soc/intel/avs/topology.c        |  7 +++++++
 sound/soc/intel/avs/topology.h        |  1 +
 4 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/include/uapi/sound/intel/avs/tokens.h b/include/uapi/sound/intel/avs/tokens.h
index f7cbbfb00227..3ff6d9150822 100644
--- a/include/uapi/sound/intel/avs/tokens.h
+++ b/include/uapi/sound/intel/avs/tokens.h
@@ -125,6 +125,7 @@ enum avs_tplg_token {
 	AVS_TKN_MOD_KCONTROL_ID_U32			= 1707,
 	AVS_TKN_MOD_INIT_CONFIG_NUM_IDS_U32		= 1708,
 	AVS_TKN_MOD_INIT_CONFIG_ID_U32			= 1709,
+	AVS_TKN_MOD_NHLT_CONFIG_ID_U32			= 1710,
 
 	/* struct avs_tplg_path_template */
 	AVS_TKN_PATH_TMPL_ID_U32			= 1801,
diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
index 7aa20fcf1a33..c8b586aced20 100644
--- a/sound/soc/intel/avs/path.c
+++ b/sound/soc/intel/avs/path.c
@@ -210,9 +210,11 @@ int avs_path_set_constraint(struct avs_dev *adev, struct avs_tplg_path_template
 					continue;
 				}
 
-				blob = avs_nhlt_config_or_default(adev, module_template);
-				if (IS_ERR(blob))
-					continue;
+				if (!module_template->nhlt_config) {
+					blob = avs_nhlt_config_or_default(adev, module_template);
+					if (IS_ERR(blob))
+						continue;
+				}
 
 				rlist[i] = path_template->fe_fmt->sampling_freq;
 				clist[i] = path_template->fe_fmt->num_channels;
@@ -382,7 +384,10 @@ static int avs_fill_gtw_config(struct avs_dev *adev, struct avs_copier_gtw_cfg *
 	struct acpi_nhlt_config *blob;
 	size_t gtw_size;
 
-	blob = avs_nhlt_config_or_default(adev, t);
+	if (t->nhlt_config)
+		blob = t->nhlt_config->blob;
+	else
+		blob = avs_nhlt_config_or_default(adev, t);
 	if (IS_ERR(blob))
 		return PTR_ERR(blob);
 
diff --git a/sound/soc/intel/avs/topology.c b/sound/soc/intel/avs/topology.c
index 48fdbaef56dd..9033f683393c 100644
--- a/sound/soc/intel/avs/topology.c
+++ b/sound/soc/intel/avs/topology.c
@@ -350,6 +350,7 @@ AVS_DEFINE_PTR_PARSER(modcfg_base, struct avs_tplg_modcfg_base, modcfgs_base);
 AVS_DEFINE_PTR_PARSER(modcfg_ext, struct avs_tplg_modcfg_ext, modcfgs_ext);
 AVS_DEFINE_PTR_PARSER(pplcfg, struct avs_tplg_pplcfg, pplcfgs);
 AVS_DEFINE_PTR_PARSER(binding, struct avs_tplg_binding, bindings);
+AVS_DEFINE_PTR_PARSER(nhlt_config, struct avs_tplg_nhlt_config, nhlt_configs);
 
 static int
 parse_audio_format_bitfield(struct snd_soc_component *comp, void *elem, void *object, u32 offset)
@@ -1200,6 +1201,12 @@ static const struct avs_tplg_token_parser module_parsers[] = {
 		.offset = offsetof(struct avs_tplg_module, num_config_ids),
 		.parse = avs_parse_byte_token,
 	},
+	{
+		.token = AVS_TKN_MOD_NHLT_CONFIG_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_module, nhlt_config),
+		.parse = avs_parse_nhlt_config_ptr,
+	},
 };
 
 static const struct avs_tplg_token_parser init_config_parsers[] = {
diff --git a/sound/soc/intel/avs/topology.h b/sound/soc/intel/avs/topology.h
index 61d50960ef06..1cf7455b6c01 100644
--- a/sound/soc/intel/avs/topology.h
+++ b/sound/soc/intel/avs/topology.h
@@ -223,6 +223,7 @@ struct avs_tplg_module {
 	u32 ctl_id;
 	u32 num_config_ids;
 	u32 *config_ids;
+	struct avs_tplg_nhlt_config *nhlt_config;
 
 	struct avs_tplg_pipeline *owner;
 	/* Pipeline modules management. */
-- 
2.25.1

