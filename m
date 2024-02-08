Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93CC8002D
	for <linux-sound@vger.kernel.org>; Thu,  8 Feb 2024 16:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707411367; cv=none; b=mgSFNstlGLaPNPU5v0nxaqfQxGogznUytuhTMr5au3pOlPKPA4EwnYX+sl67BT7cNU4KFpFgR6VCKK1E2//sf4m/y2hfYiRaiXa0qC3O9Xz0LX48ykvY29055Alv5BAcvWXGecfCIZbEbEA398cezVj70M/Kuzxu+EcBUpRIKS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707411367; c=relaxed/simple;
	bh=iEbs4hKQ7oQNy0OveBLK1smzNs90IJnUIpGk9xHZW30=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=roPM8jRrttSsdA7uyTuUUk1vCdjs9h4ZovEyVdOmAvHf+rBbkblNvE6s87ooDKr/CtCGiHzE2s60neMDgjeOx6Hz6H5Ec3730LPD7K22FlcGkwfKACBuCgxdlpw5++yF00yWoyWNA7Ew7OWy/pdKvuCWMZ1w/dMEhhScrDrB2x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WvmDwYCk; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WvmDwYCk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707411364; x=1738947364;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iEbs4hKQ7oQNy0OveBLK1smzNs90IJnUIpGk9xHZW30=;
  b=WvmDwYCkQ42ZQfWS3qLdmO6/WxQQIjDdTnGGPuazHqX7Hsq+zMS4e6nb
   cSpm3fmL4S5CLneqsp93ARh2Iiux+Pt09KztHOZ7W+4hyyey21HIeQENi
   ey+PpGK7DfgD5nF2ugyFmws2NB5Y+8G+NO36GNVxQ0jYaFud+6i7CFzWR
   maf1fDn+9ZPBH4oCfrVhVV7yQTyoasX9E7YRTA3FckuizMJo8DJwuDv9F
   Kq0dVZhza8xbkxOz3sRjGjCa0LtJk9HzLfBYXQfjLeGLlu+fAWPBZRxhV
   8fQIQwGmVmI2JEfafHcsJyLlz7OOv3Fnp367t9leMwYvUkhssq7U7tqwH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="395675387"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="395675387"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 08:56:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="1690229"
Received: from stang1-mobl1.amr.corp.intel.com (HELO localhost.localdomain) ([10.212.92.130])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 08:56:02 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 14/24] ASoC: Intel: sof_sdw_rt700: use helper to get codec dai by name
Date: Thu,  8 Feb 2024 10:55:35 -0600
Message-Id: <20240208165545.93811-15-pierre-louis.bossart@linux.intel.com>
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
 sound/soc/intel/boards/sof_sdw_rt700.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw_rt700.c b/sound/soc/intel/boards/sof_sdw_rt700.c
index a1714afe8515..d9a45392bbbf 100644
--- a/sound/soc/intel/boards/sof_sdw_rt700.c
+++ b/sound/soc/intel/boards/sof_sdw_rt700.c
@@ -13,6 +13,7 @@
 #include <sound/soc-acpi.h>
 #include <sound/soc-dapm.h>
 #include <sound/jack.h>
+#include "sof_board_helpers.h"
 #include "sof_sdw_common.h"
 
 static const struct snd_soc_dapm_widget rt700_widgets[] = {
@@ -45,15 +46,24 @@ static struct snd_soc_jack_pin rt700_jack_pins[] = {
 	},
 };
 
+static const char * const jack_codecs[] = {
+	"rt700"
+};
+
 static int rt700_rtd_init(struct snd_soc_pcm_runtime *rtd)
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
 					  "%s hs:rt700",
 					  card->components);
@@ -127,3 +137,4 @@ int sof_sdw_rt700_init(struct snd_soc_card *card,
 
 	return 0;
 }
+MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_BOARD_HELPERS);
-- 
2.40.1

