Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27E5811EC
	for <linux-sound@vger.kernel.org>; Thu,  8 Feb 2024 16:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707411365; cv=none; b=gBTpOdw0VkhUXCboMwofcZhvVPGbV73/F6P2dE8vypHiA/Mj+rLn9fDrVz0HccVf3P9L2rKVVlPwF0PC7GlkyYqNxqcDXpBxhCgvqXbNdcOWgE0I4tKT4d9ztE1T57liynqYbjKMJ/V5jHT8jCc1Zpg/zhLezfkzGQVnU3UALKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707411365; c=relaxed/simple;
	bh=WbMrcOtxEPTqPuAD9SZO9DSAuLMiWP+miOcXhisgqok=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=geWU870mWPhmKm01JyN7TWmgTQ4qXeFQbDcuUxp+Fcoxs3g0OuNwzEAmMeRuiQrI6K6HWvlqF700lVmkutmuJHPUCXB2nYXIZoDlgxY6yfGm4FI3K+saDFYVr2FX0iZeTVeHIq82vDPsW9yfekYv+rEOVq8+uiGw6rc5IdSTP1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KmQberr1; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KmQberr1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707411363; x=1738947363;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WbMrcOtxEPTqPuAD9SZO9DSAuLMiWP+miOcXhisgqok=;
  b=KmQberr1m83ATMsWcY7XsU19JudE9NXINt6j/CFznWu846bodnfb/D6h
   ziN4CuI39prgIzIkzbh0E8DWuYvCrP8NqgAFvwNwnWhcl7pesO7HNE3B4
   l/TMrq/wLKaznKog0n1yQqziZFYyux2jtCg4ZhTlTm7+I79xoCiW/kDGM
   RGyXr2srX2ySZhRi8hZZy94191NJVreNFr1P8VP0+PpCmtmPH3JA0M74F
   msgk8gHoMTZ9J4RWBN9FmaGcvrPXD7BNKBJg2rtun9hNYtqEFa7ckcuDh
   kkJNXCrf7pHUE2pveC0rC3Jpvx+OAUg5QZzCWVpQMH+CNUhGJdWvAvcjs
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="395675370"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="395675370"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 08:56:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="1690207"
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
Subject: [PATCH 12/24] ASoC: Intel: sof_sdw_rt711: use helper to get codec dai by name
Date: Thu,  8 Feb 2024 10:55:33 -0600
Message-Id: <20240208165545.93811-13-pierre-louis.bossart@linux.intel.com>
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
 sound/soc/intel/boards/sof_sdw_rt711.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw_rt711.c b/sound/soc/intel/boards/sof_sdw_rt711.c
index 38782fdfcf15..5d8f90f2bf55 100644
--- a/sound/soc/intel/boards/sof_sdw_rt711.c
+++ b/sound/soc/intel/boards/sof_sdw_rt711.c
@@ -15,6 +15,7 @@
 #include <sound/soc-acpi.h>
 #include <sound/soc-dapm.h>
 #include <sound/jack.h>
+#include "sof_board_helpers.h"
 #include "sof_sdw_common.h"
 
 /*
@@ -69,15 +70,24 @@ static struct snd_soc_jack_pin rt711_jack_pins[] = {
 	},
 };
 
+static const char * const jack_codecs[] = {
+	"rt711"
+};
+
 static int rt711_rtd_init(struct snd_soc_pcm_runtime *rtd)
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
 					  "%s hs:rt711",
 					  card->components);
@@ -180,3 +190,4 @@ int sof_sdw_rt711_init(struct snd_soc_card *card,
 
 	return 0;
 }
+MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_BOARD_HELPERS);
-- 
2.40.1

