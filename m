Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C86380BFF
	for <linux-sound@vger.kernel.org>; Thu,  8 Feb 2024 16:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707411364; cv=none; b=WKXtKDcfIXIluG+s+erRXEvIRdz9hdziycsxmt71gRhwoaNsar2pnM1XAaJlfYu7tdQHOsIgBSDsDELlR48t9/dPV0AUef1wJhGAb99WxTHte8qWeuA7DfBP+rOkLxcfW1E9sD1C2BE4hXfX+6xoVLZ9S3eJkFpzEOD6NQNuVgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707411364; c=relaxed/simple;
	bh=UdCYLIte7m8ilxEaeKXcyDxzS4kkNFr4Tmp4bU+PaIY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=h5WSk40I+jQyY3WhMhfHVvgbfQGI9cXUzqxyAoaycxVZnDlK/rB0UEhuVamarMpOWq9KdgZMmvjHG9m+0tggiewpEKXLyZqnkyvxhpdQ9N4g4ZwK9iUp0WqQvcbBVYhhK4frPtYouBHOdM66/q6ijSQm58rENQrUEG7CICUqmzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gXyWv0gs; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gXyWv0gs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707411363; x=1738947363;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UdCYLIte7m8ilxEaeKXcyDxzS4kkNFr4Tmp4bU+PaIY=;
  b=gXyWv0gsb8qlE01oW32eDnnffBVNzaa4k/eWBC31kTZL4TQGo3Ahc4FB
   e2g8ggd3eDURbWd2ogpJMHLfdrT8iUIkY7eVatnw1kOvavREVPwl+Y53H
   EvP1qgQdDfZbM5aaXsHXCJ3Mk/ExDCcLftqMjxQGafGt1kVEV5KpT/4/b
   gdHawHq5H+O/VqOJHGJkHs/JKlHG1BDsRcnulhXMPloi0KDAUuTUSU8TM
   V/4kq8OZS7VkXjxly2HXqA7ayzlMSsWmd+l3uYxXFGfuQ+8bZ7pws6VTH
   84odhEsFt/GQ04aLR9VMN7kpjMmXNh2h/707S+08mWvMheC2PwpdW2Nem
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="395675362"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="395675362"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 08:56:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="1690198"
Received: from stang1-mobl1.amr.corp.intel.com (HELO localhost.localdomain) ([10.212.92.130])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 08:56:00 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 11/24] ASoC: Intel: sof_sdw_rt_sdca_jack_common: use helper to get codec dai by name
Date: Thu,  8 Feb 2024 10:55:32 -0600
Message-Id: <20240208165545.93811-12-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240208165545.93811-1-pierre-louis.bossart@linux.intel.com>
References: <20240208165545.93811-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bard Liao <yung-chuan.liao@linux.intel.com>

Use helper to get codec dai by name.

Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig                    |  1 +
 sound/soc/intel/boards/sof_board_helpers.c        |  2 +-
 sound/soc/intel/boards/sof_board_helpers.h        |  2 +-
 .../intel/boards/sof_sdw_rt_sdca_jack_common.c    | 15 +++++++++++++--
 4 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 8fd5e7f83054..18ac3ce0752e 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -677,6 +677,7 @@ config SND_SOC_INTEL_SOUNDWIRE_SOF_MACH
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
 	depends on SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES || COMPILE_TEST
 	depends on SOUNDWIRE
+	select SND_SOC_INTEL_SOF_BOARD_HELPERS
 	select SND_SOC_MAX98363
 	select SND_SOC_MAX98373_I2C
 	select SND_SOC_MAX98373_SDW
diff --git a/sound/soc/intel/boards/sof_board_helpers.c b/sound/soc/intel/boards/sof_board_helpers.c
index 9c08d3e54e3b..088894ff4165 100644
--- a/sound/soc/intel/boards/sof_board_helpers.c
+++ b/sound/soc/intel/boards/sof_board_helpers.c
@@ -585,7 +585,7 @@ int sof_intel_board_set_dai_link(struct device *dev, struct snd_soc_card *card,
 EXPORT_SYMBOL_NS(sof_intel_board_set_dai_link, SND_SOC_INTEL_SOF_BOARD_HELPERS);
 
 struct snd_soc_dai *get_codec_dai_by_name(struct snd_soc_pcm_runtime *rtd,
-					  const char *dai_name[], int num_dais)
+					  const char * const dai_name[], int num_dais)
 {
 	struct snd_soc_dai *dai;
 	int index;
diff --git a/sound/soc/intel/boards/sof_board_helpers.h b/sound/soc/intel/boards/sof_board_helpers.h
index b626198f685d..f42d5d640321 100644
--- a/sound/soc/intel/boards/sof_board_helpers.h
+++ b/sound/soc/intel/boards/sof_board_helpers.h
@@ -119,6 +119,6 @@ int sof_intel_board_set_hdmi_in_link(struct device *dev,
 				     int ssp_hdmi);
 
 struct snd_soc_dai *get_codec_dai_by_name(struct snd_soc_pcm_runtime *rtd,
-					  const char *dai_name[], int num_dais);
+					  const char * const dai_name[], int num_dais);
 
 #endif /* __SOF_INTEL_BOARD_HELPERS_H */
diff --git a/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c b/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
index d9c283829fc7..4f2e105a1124 100644
--- a/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
+++ b/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
@@ -15,6 +15,7 @@
 #include <sound/soc-acpi.h>
 #include <sound/soc-dapm.h>
 #include <sound/jack.h>
+#include "sof_board_helpers.h"
 #include "sof_sdw_common.h"
 
 /*
@@ -84,15 +85,24 @@ static struct snd_soc_jack_pin rt_sdca_jack_pins[] = {
 	},
 };
 
+static const char * const jack_codecs[] = {
+	"rt711", "rt712", "rt713"
+};
+
 static int rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
-	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
-	struct snd_soc_component *component = codec_dai->component;
+	struct snd_soc_dai *codec_dai;
+	struct snd_soc_component *component;
 	struct snd_soc_jack *jack;
 	int ret;
 
+	codec_dai = get_codec_dai_by_name(rtd, jack_codecs, ARRAY_SIZE(jack_codecs));
+	if (!codec_dai)
+		return -EINVAL;
+
+	component = codec_dai->component;
 	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
 					  "%s hs:%s-sdca",
 					  card->components, component->name_prefix);
@@ -213,3 +223,4 @@ int sof_sdw_rt_sdca_jack_init(struct snd_soc_card *card,
 
 	return 0;
 }
+MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_BOARD_HELPERS);
-- 
2.40.1

