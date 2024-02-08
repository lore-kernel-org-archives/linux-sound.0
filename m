Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D4B811EC
	for <linux-sound@vger.kernel.org>; Thu,  8 Feb 2024 16:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707411367; cv=none; b=hDQxV3PxulUjAppDpuIbmRd3sIdaZ61L618CqLJZBOqZhNU1Zo0Au1LMgqpzNWXgd1SwaOb5797aG5K/h+07X71wln6sjaBEWFp3Mc/z4YbxeBzPyzFns3KLsBYwRBViz8X/NoWC2RvU/UxQ9dlBedzpJYfOSAJ2N9OkDdJ+0ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707411367; c=relaxed/simple;
	bh=fHtN//ka+p5LthmuZqDd00qlYGpT8zGHktxEt5fZsXw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k6NeuARbU6MYklDykZ1CupJHtGyy4zHNYVMrQSJpA2TCRRIgUk92fRhUKi7ZO8T3RGOviaRSD7YTrxVTIRbRexmhYupNV4ChS6FXta2DJVlcNsXaIhAga+1Kc5GzZbkBVTmT7ptwwa8Fy9Re21AC1oZ8xP9R/V56Eb2v1Dmx9VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B54rApV3; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B54rApV3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707411366; x=1738947366;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fHtN//ka+p5LthmuZqDd00qlYGpT8zGHktxEt5fZsXw=;
  b=B54rApV3EcG8AWc3wR39aWkC+N8vvqZGjjoMw2IPtW67Ebr5RAezuIuW
   JgyU2JXqc0gxY8r9bB0ZIrtUIJbHQunmM+wksUO70/iMIJe4qKiN3KkaF
   P3SSJb45/BMc8taTyK7l7ehqumccccyC3a+T/M95QpZ24OzVJ9KiQee40
   ZlJ53A7d3/72V57ZMS/Z/pI7aguKsLqKQqngjONNMKX982J7VpEDu3owO
   FSu0v00co0nkDJg7tmarRFU+I+zLm1KEDL49sEUMh3yNgb/dhQPM2x1dd
   gqEsSfk2BOGRCE2O425kdyhdA5JQmtm7dK1Yi+0FPcom7aWRUUV6Jkpyb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="395675400"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="395675400"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 08:56:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="1690250"
Received: from stang1-mobl1.amr.corp.intel.com (HELO localhost.localdomain) ([10.212.92.130])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 08:56:03 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 16/24] ASoC: Intel: sof_sdw_rt5682: use helper to get codec dai by name
Date: Thu,  8 Feb 2024 10:55:37 -0600
Message-Id: <20240208165545.93811-17-pierre-louis.bossart@linux.intel.com>
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
 sound/soc/intel/boards/sof_sdw_rt5682.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw_rt5682.c b/sound/soc/intel/boards/sof_sdw_rt5682.c
index 7b7c9def398b..27aca76dbee4 100644
--- a/sound/soc/intel/boards/sof_sdw_rt5682.c
+++ b/sound/soc/intel/boards/sof_sdw_rt5682.c
@@ -15,6 +15,7 @@
 #include <sound/soc-acpi.h>
 #include <sound/soc-dapm.h>
 #include <sound/jack.h>
+#include "sof_board_helpers.h"
 #include "sof_sdw_common.h"
 
 static const struct snd_soc_dapm_widget rt5682_widgets[] = {
@@ -45,15 +46,24 @@ static struct snd_soc_jack_pin rt5682_jack_pins[] = {
 	},
 };
 
+static const char * const jack_codecs[] = {
+	"rt5682"
+};
+
 static int rt5682_rtd_init(struct snd_soc_pcm_runtime *rtd)
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
 					  "%s hs:rt5682",
 					  card->components);
@@ -128,3 +138,4 @@ int sof_sdw_rt5682_init(struct snd_soc_card *card,
 
 	return 0;
 }
+MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_BOARD_HELPERS);
-- 
2.40.1

