Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2DB7FBB0
	for <linux-sound@vger.kernel.org>; Thu,  8 Feb 2024 16:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707411366; cv=none; b=fUgR/Yaj9vYfO5Xcrqk0RHGINntouv707AZAxpkbah3upBDcwfajlzruTzzDvz3NOvYQrBQIbKgjwHPyr+VB4dDQhaGuoIerpp5+jOdP6q+h1GdWB5MqWh7RGknKPezZDBhd9G4fXpQaaVx7mdK1lJSHdsWVvKQ86cqjB00yYlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707411366; c=relaxed/simple;
	bh=CB0MQPT1ZuhAYcjooRIGfBXF6KNofDELkTeUfNmtW+c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IJfCd4NgCZgElY0FhuqTdrzQoYDaArZ/nySlv2wRQIxKBt3hHB8vIlslesbexVc9esIotqOSPtEgKu0tOIyk2ouaakiKntBKdpsH0CY4n18GD9FCoTr2NMolamEIjot3ZcAZIKjiHbHAMwN6kfh2ZvFn8QKEBcaYeKINfSx9ZaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Em6DzPvu; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Em6DzPvu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707411364; x=1738947364;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CB0MQPT1ZuhAYcjooRIGfBXF6KNofDELkTeUfNmtW+c=;
  b=Em6DzPvugraxTJ4XwQlqSvnDvyDSfLABmhyCEVheFWAKOI8XFA4EmGGP
   6MkK2p/VDFfH6YtywVYMWL2G6ehj2x7/FSAoeEXOFwJ76+PbXwKr1SoIH
   nAWG15V7i8RaBeO8HMwJa4uvJxhgoTw9eXBWJK+O1NhttpjvTs05Lbx2W
   HUfq0JagmMUmLP35/VgpdveRZEOv8sXA7lHZS52Fev5jh2Tn2NHDc5duP
   MSxgZRSp+56qilt7wmhgiT4SLcjQIx1K8p+L6I3uMRc7TOvqpNumQ2OJG
   rAHezPsiMC0qD9cm/Dv70PBYNV9Whoa2mm4Zizj8bF1R7GjhGFzTmGbun
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="395675379"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="395675379"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 08:56:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="1690220"
Received: from stang1-mobl1.amr.corp.intel.com (HELO localhost.localdomain) ([10.212.92.130])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 08:56:01 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 13/24] ASoC: Intel: sof_sdw_rt712_sdca: use helper to get codec dai by name
Date: Thu,  8 Feb 2024 10:55:34 -0600
Message-Id: <20240208165545.93811-14-pierre-louis.bossart@linux.intel.com>
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
 sound/soc/intel/boards/sof_sdw_rt712_sdca.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw_rt712_sdca.c b/sound/soc/intel/boards/sof_sdw_rt712_sdca.c
index 3092029419df..27c924885ffc 100644
--- a/sound/soc/intel/boards/sof_sdw_rt712_sdca.c
+++ b/sound/soc/intel/boards/sof_sdw_rt712_sdca.c
@@ -13,6 +13,7 @@
 #include <sound/soc.h>
 #include <sound/soc-acpi.h>
 #include <sound/soc-dapm.h>
+#include "sof_board_helpers.h"
 #include "sof_sdw_common.h"
 
 static const struct snd_soc_dapm_widget rt712_spk_widgets[] = {
@@ -77,12 +78,21 @@ int sof_sdw_rt712_spk_init(struct snd_soc_card *card,
 	return 0;
 }
 
+static const char * const dmics[] = {
+	"rt712-sdca-dmic"
+};
+
 static int rt712_sdca_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
-	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
-	struct snd_soc_component *component = codec_dai->component;
+	struct snd_soc_dai *codec_dai;
+	struct snd_soc_component *component;
 
+	codec_dai = get_codec_dai_by_name(rtd, dmics, ARRAY_SIZE(dmics));
+	if (!codec_dai)
+		return -EINVAL;
+
+	component = codec_dai->component;
 	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
 					  "%s mic:%s",
 					  card->components, component->name_prefix);
@@ -102,3 +112,4 @@ int sof_sdw_rt712_sdca_dmic_init(struct snd_soc_card *card,
 
 	return 0;
 }
+MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_BOARD_HELPERS);
-- 
2.40.1

