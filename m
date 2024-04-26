Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D21154450
	for <linux-sound@vger.kernel.org>; Fri, 26 Apr 2024 15:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714145141; cv=none; b=n7OLlqO8qiz9JWAsqASFVQXl7zp+wzj5AW42gYiViZcleJl9bUZ7wYWoWtMDPPqRh2nCOWLruGLtQaL2ni6wM+WgDSUKLqWOOX4qcSJreH4jdEpTuW2svzS9FRj0c973E3O34jLH3j+0yEObQXoehLjP4RyDd0io6n+RTvwJPLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714145141; c=relaxed/simple;
	bh=IhNyLvipIPGmOCLb0Rr8QiP1vU62Hi86DWOTep9C5b8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pD97Y9BuQXqVnnUR8C/L547Q3fBPFHF341/WYjqgyb0DaU4fhvqocV7qD0IYXuo+TgX4m6SNCOuI6icBGcekus71KU1plfmmdEfO6oRjljc+e7agTnG4xqpdKotPhKmLD6XT4SfmSPSX0JE9cOld57HZxsxinOXT9FG8nudc1a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WDZCLH+y; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WDZCLH+y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714145141; x=1745681141;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IhNyLvipIPGmOCLb0Rr8QiP1vU62Hi86DWOTep9C5b8=;
  b=WDZCLH+yiLNN9TPScMgcK/wbuOIIT+bph2BBz19rNWKgBmUfJfaXe/IT
   nMeiFaMNWks+OYg+AvDL6kCLX2HTfaXR9vWlYeRLzkmNLwXk/rvO56H3B
   WfO4zCaS+WF/dNvLIDfksabHOHoziT09HAJgOl2X0sBDbjYdvKFEvY7mg
   L4JhP8B0KIkOt5FENaKO3P1GJv50I8Zi1DOZoUx9hM2f123Klj/S/erzF
   6j8G8WWeLG0ohmoKdlwuSwB3TgD272Bs9rstRnKy3kvrUwL8gxEXQ119N
   CLbrjK6csupFldrCC3eifO/LwYz3hLkjYJZW7KrQBt9YDf50O2yhoSzEp
   g==;
X-CSE-ConnectionGUID: gyG1MlPYQgKBgnmnRO2xYQ==
X-CSE-MsgGUID: cH5SywrIRpSsMfOPfW9Zxg==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21291274"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="21291274"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:25:40 -0700
X-CSE-ConnectionGUID: icjGA+p+QJyV6mr5yZc9og==
X-CSE-MsgGUID: U7ifzDJoSa6NfDm65a8XYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="30259536"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:25:40 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 02/23] ASoC: Intel: sof_maxim_common: support MAX98390 on cml boards
Date: Fri, 26 Apr 2024 10:25:08 -0500
Message-Id: <20240426152529.38345-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
References: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brent Lu <brent.lu@intel.com>

Add support for 2xMAX98390 speaker amplifier running in I2S mode for
existing cml boards.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_maxim_common.c | 42 +++++++++++++++++++----
 1 file changed, 35 insertions(+), 7 deletions(-)

diff --git a/sound/soc/intel/boards/sof_maxim_common.c b/sound/soc/intel/boards/sof_maxim_common.c
index 53c7392bf3dd..bb12aab15ad5 100644
--- a/sound/soc/intel/boards/sof_maxim_common.c
+++ b/sound/soc/intel/boards/sof_maxim_common.c
@@ -10,6 +10,7 @@
 #include <sound/soc-dai.h>
 #include <sound/soc-dapm.h>
 #include <uapi/sound/asound.h>
+#include "../common/soc-intel-quirks.h"
 #include "sof_maxim_common.h"
 
 /*
@@ -219,6 +220,17 @@ static const struct snd_soc_dapm_route max_98390_tt_dapm_routes[] = {
 	{ "TR Spk", NULL, "Tweeter Right BE_OUT" },
 };
 
+static struct snd_soc_codec_conf max_98390_cml_codec_conf[] = {
+	{
+		.dlc = COMP_CODEC_CONF(MAX_98390_DEV0_NAME),
+		.name_prefix = "Left",
+	},
+	{
+		.dlc = COMP_CODEC_CONF(MAX_98390_DEV1_NAME),
+		.name_prefix = "Right",
+	},
+};
+
 static struct snd_soc_codec_conf max_98390_codec_conf[] = {
 	{
 		.dlc = COMP_CODEC_CONF(MAX_98390_DEV0_NAME),
@@ -271,6 +283,7 @@ static int max_98390_hw_params(struct snd_pcm_substream *substream,
 			       struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai_link *dai_link = rtd->dai_link;
 	struct snd_soc_dai *codec_dai;
 	int i, ret;
 
@@ -280,13 +293,24 @@ static int max_98390_hw_params(struct snd_pcm_substream *substream,
 			return -ENODEV;
 		}
 
-		ret = snd_soc_dai_set_tdm_slot(codec_dai, max_98390_tdm_mask[i].tx,
-					       max_98390_tdm_mask[i].rx, 4,
-					       params_width(params));
-		if (ret < 0) {
-			dev_err(codec_dai->dev, "fail to set tdm slot, ret %d\n",
-				ret);
-			return ret;
+		switch (dai_link->dai_fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+		case SND_SOC_DAIFMT_DSP_A:
+		case SND_SOC_DAIFMT_DSP_B:
+			/* 4-slot TDM */
+			ret = snd_soc_dai_set_tdm_slot(codec_dai,
+						       max_98390_tdm_mask[i].tx,
+						       max_98390_tdm_mask[i].rx,
+						       4,
+						       params_width(params));
+			if (ret < 0) {
+				dev_err(codec_dai->dev, "fail to set tdm slot, ret %d\n",
+					ret);
+				return ret;
+			}
+			break;
+		default:
+			dev_dbg(codec_dai->dev, "codec is in I2S mode\n");
+			break;
 		}
 	}
 	return 0;
@@ -395,6 +419,10 @@ void max_98390_set_codec_conf(struct device *dev, struct snd_soc_card *card)
 
 	switch (num_codecs) {
 	case 2:
+		if (soc_intel_is_cml())
+			card->codec_conf = max_98390_cml_codec_conf;
+
+		fallthrough;
 	case 4:
 		card->num_configs = num_codecs;
 		break;
-- 
2.40.1

