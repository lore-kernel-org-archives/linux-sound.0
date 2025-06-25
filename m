Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481E220C00B
	for <linux-sound@vger.kernel.org>; Wed, 25 Jun 2025 14:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750860315; cv=none; b=jFopofubfQbP5op94F6D7/sjSoe1fKPEB2OQr8HfW0QDkOTj//YdtD2Y+WbSrlJzYxp6nOXHu8Zp1enASOv89Vqafg9s9duAOtM6Uc3dYrvBFgU9VYwOj4sYeA5w+2gLIhIIOY25uvQvbawElDrmJrp3CvRkzDddsnnJEfckWgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750860315; c=relaxed/simple;
	bh=t7K3Go8thfjk+2C2kMMshZjha0NV08H3/2hVwGHMN2w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YxO8jB9I4rB/aZeFWAEfTfLbD4wgRRte4OG6zDCBkOfnFRvmGbj0JpAu5WGDnDEUITIzIZ89VzfJuWJbnI1Vyhrk+CafWjTfcr5cpTISiW+TM4dmi2wV9k0+oPoWuo58XzucXyl+E88ZDXLtOyw+PqhDGhO5RhVoWR7kG5l67uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PHxT9VEK; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PHxT9VEK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750860314; x=1782396314;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=t7K3Go8thfjk+2C2kMMshZjha0NV08H3/2hVwGHMN2w=;
  b=PHxT9VEKJxeifFx74g7qJR7rRB8TG9agHF/5W+l2mN9MEtn5NeHsDsFH
   Lf0b6/Wz8obXnmLl/k1phu/fGkhyml5slTQu29BdYc71jesobkpA+O6yq
   rEfOlA5NZLtCf3FJPgXhmzyh0RYZY1UivWuBR4Ao2+Vw6lJ08gXUzyljP
   5C2pBfLXXBPacA3kAIEhKbqCUa65FD4Jgpb70ccyVkl3dYyeZ7lEES6Oa
   3qHEC6BvVEBBgtb8VxNm2fDCdYXU3s/637oD6VQ5uBSKBPkUC0KdMyyya
   umicLblctWqv/A0OG4vjuvWmYcdw0uruKyfE4jYJWsGK3Vot29UMqnN4X
   A==;
X-CSE-ConnectionGUID: iGP5trz0Tlu0dABp9iP4VQ==
X-CSE-MsgGUID: QrlA0LzWT8O+YCsYchahEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="52248811"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="52248811"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 07:04:42 -0700
X-CSE-ConnectionGUID: L6BGiv23TNe4/02T6EdY9g==
X-CSE-MsgGUID: E1yHK5DcRzSjtXMuONXRiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="175873496"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 07:04:40 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 1/2] ASoC: sdw_utils: add component_name string to dai_info
Date: Wed, 25 Jun 2025 22:04:28 +0800
Message-ID: <20250625140430.311865-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250625140430.311865-1-yung-chuan.liao@linux.intel.com>
References: <20250625140430.311865-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently the sdw machine driver uses different way to get the
component name from the DAI name for different codecs in the rtd_init
callback. It means that we need to rely on the rtd_init callback to get
the component name. Add an optional component string to the
asoc_sdw_dai_info struct allows the machine driver to get the component
name directly.
The commit adds the component names for the AMP dais for the preparation
to set card->components string for combined speaker configs.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Shuming Fan <shumingf@realtek.com>
---
 include/sound/soc_sdw_utils.h       | 1 +
 sound/soc/sdw_utils/soc_sdw_utils.c | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/include/sound/soc_sdw_utils.h b/include/sound/soc_sdw_utils.h
index b63021f5afaf..6049a5d0cfcd 100644
--- a/include/sound/soc_sdw_utils.h
+++ b/include/sound/soc_sdw_utils.h
@@ -46,6 +46,7 @@ struct asoc_sdw_codec_info;
 struct asoc_sdw_dai_info {
 	const bool direction[2]; /* playback & capture support */
 	const char *dai_name;
+	const char *component_name;
 	const int dai_type;
 	const int dailink[2]; /* dailink id for each direction */
 	const struct snd_kcontrol_new *controls;
diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index d75e7292240b..2e8820137c69 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -135,6 +135,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 			{
 				.direction = {true, false},
 				.dai_name = "rt712-sdca-aif2",
+				.component_name = "rt712",
 				.dai_type = SOC_SDW_DAI_TYPE_AMP,
 				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
 				.init = asoc_sdw_rt_amp_init,
@@ -275,6 +276,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 			{
 				.direction = {true, false},
 				.dai_name = "rt1320-aif1",
+				.component_name = "rt1320",
 				.dai_type = SOC_SDW_DAI_TYPE_AMP,
 				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
 				.init = asoc_sdw_rt_amp_init,
@@ -409,6 +411,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 			{
 				.direction = {true, false},
 				.dai_name = "rt722-sdca-aif2",
+				.component_name = "rt722",
 				.dai_type = SOC_SDW_DAI_TYPE_AMP,
 				/* No feedback capability is provided by rt722-sdca codec driver*/
 				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
@@ -438,6 +441,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 			{
 				.direction = {true, true},
 				.dai_name = "max98373-aif1",
+				.component_name = "mx8373",
 				.dai_type = SOC_SDW_DAI_TYPE_AMP,
 				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_AMP_IN_DAI_ID},
 				.init = asoc_sdw_maxim_init,
@@ -456,6 +460,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 			{
 				.direction = {true, false},
 				.dai_name = "max98363-aif1",
+				.component_name = "mx8363",
 				.dai_type = SOC_SDW_DAI_TYPE_AMP,
 				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
 				.init = asoc_sdw_maxim_init,
@@ -491,6 +496,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 			{
 				.direction = {true, false},
 				.dai_name = "cs35l56-sdw1",
+				.component_name = "cs35l56",
 				.dai_type = SOC_SDW_DAI_TYPE_AMP,
 				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
 				.init = asoc_sdw_cs_amp_init,
@@ -516,6 +522,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 			{
 				.direction = {true, false},
 				.dai_name = "cs35l56-sdw1",
+				.component_name = "cs35l56",
 				.dai_type = SOC_SDW_DAI_TYPE_AMP,
 				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
 				.init = asoc_sdw_cs_amp_init,
-- 
2.43.0

