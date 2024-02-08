Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C04580058
	for <linux-sound@vger.kernel.org>; Thu,  8 Feb 2024 16:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707411366; cv=none; b=ecPNwrmOstxXmK4+PiK9MbVr5yTAApxmOUaVX+Yu5tm8pu9K53i3P+LG76d672tAJtVyT9vfDqdDnLGrmGeiKFWaI0qNzgZP8UHqL+/2iC/wXMfIINXmonymttVfiZ2KHUH4RPzhkRDSpNY+ibh4pnVUg0a7tIOPrD87R+pTbL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707411366; c=relaxed/simple;
	bh=KqUKDtXlJkWIpAsWAyeaN4J4Fr5x6Ik5O1TuLR3mj/c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bX1gp+Dn/fE40L82UoyPHsT3b5sJkR2kBNdBR2hmCwnjF9RaJ29pA36RRVqWl2NffUombbmENGWx8dldvluAGnrrexhEzW3np2jgvRJTKnkte+ErVN9pzpZTLWkfDCYoYClra19ydjFRh8QQp9IPxf4EBoQENYfxVhS6OE7UNqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yl+SrsSh; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yl+SrsSh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707411365; x=1738947365;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KqUKDtXlJkWIpAsWAyeaN4J4Fr5x6Ik5O1TuLR3mj/c=;
  b=Yl+SrsSh39uclrMtwXwhExO0p4daDp4RoULr330eZI6vqT9FirIm1YLg
   7S82L6OYONwXx1OqLgQiJsRdqmahtbqUH01YlzMdfH6i/bHkMH0G9sTK3
   wBF44K5E5sCHS6+aFnKwns/PbfA2tN4s0L6I0BE6y5QWuaKiSUQZ0dzQA
   x48zr793Ul7ykd5QQYGv7z9h68Fc7bs7jKKuvM/1Plh6JlNkDGiytFYFv
   XXRF7cS5DBXyRdLvQsqNuRJo3Ayv9BL1WKsU6Wa+bXnO3rFP0OZlJkXna
   UR1PdQ/ml8N/h+FfJmOd+VhQwFT5TkZHRSCtUziapD2Gngr/ajlKkree+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="395675395"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="395675395"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 08:56:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="1690237"
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
Subject: [PATCH 15/24] ASoC: Intel: sof_sdw_cs42l42: use helper to get codec dai by name
Date: Thu,  8 Feb 2024 10:55:36 -0600
Message-Id: <20240208165545.93811-16-pierre-louis.bossart@linux.intel.com>
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
 sound/soc/intel/boards/sof_sdw_cs42l42.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw_cs42l42.c b/sound/soc/intel/boards/sof_sdw_cs42l42.c
index 436f41086da6..22f4f9a19088 100644
--- a/sound/soc/intel/boards/sof_sdw_cs42l42.c
+++ b/sound/soc/intel/boards/sof_sdw_cs42l42.c
@@ -15,6 +15,7 @@
 #include <sound/soc-acpi.h>
 #include <sound/soc-dapm.h>
 #include <sound/jack.h>
+#include "sof_board_helpers.h"
 #include "sof_sdw_common.h"
 
 static const struct snd_soc_dapm_widget cs42l42_widgets[] = {
@@ -46,15 +47,24 @@ static struct snd_soc_jack_pin cs42l42_jack_pins[] = {
 	},
 };
 
+static const char * const jack_codecs[] = {
+	"cs42l42"
+};
+
 static int cs42l42_rtd_init(struct snd_soc_pcm_runtime *rtd)
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
 					  "%s hs:cs42l42",
 					  card->components);
@@ -129,3 +139,4 @@ int sof_sdw_cs42l42_init(struct snd_soc_card *card,
 
 	return 0;
 }
+MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_BOARD_HELPERS);
-- 
2.40.1

