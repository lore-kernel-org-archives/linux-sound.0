Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F761607B1
	for <linux-sound@vger.kernel.org>; Mon, 27 May 2024 19:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716838574; cv=none; b=YJY8D4ua1hX0bYf4IG8NGwFtpXj6I3WnKFqyexPiHkhxF/B7LrHx5vxPK8+sMhmOQIOLyzVEPQY2dunmDcrXh1xTaPwI5Ps+AaNQqDD9PsvEiYSVUxZ8FiZ9vSrzDSye2s5lqmt9FD+1OBnSSXaFofdvdxgm7GjMfzzFaHAcEnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716838574; c=relaxed/simple;
	bh=/4pDOYBWNcEf9AroYPd8usrLXvoOq2NmzsOK87JNjVU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EODKk27BxSFFLijd/A//GOG5TNr4EFtlazLgafPvb4c0jkReZmLHkWuVqXEfguc67hvNIryv7v6PRzSdVjOZ7DXK74bJrag2iM9gVJTyQdborRpF+PT0FTEYKgbqJ6++cHRLUja7Z9H7fAksGaXctSW8alEJjJyoB4n0WN9mjHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m8HGXWeP; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m8HGXWeP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716838573; x=1748374573;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/4pDOYBWNcEf9AroYPd8usrLXvoOq2NmzsOK87JNjVU=;
  b=m8HGXWePgHv29AGj21uOWiIt0rPjTt6uzJCVN+bvGfKyLD/OcCrAHxLW
   a7CLVvL/rvd8YvwqCPY6mhjvr+wWxisv6qh0gSKHy2aFZzRt/bHG84tip
   NiDOmrWLrWLdRclVagYZmRjmqUDOnJMG5MJrOHJmlxIhM4l9p5gLghC47
   L+tYadnqT1gnGSn/F5/yp+DKyLci76uyuK2fSDdFxZdX6t3vCceKkv84B
   jDEKAxz8gxOHteMBpAS0a/Z4fJHeYJcwTax1ssm7q6rHIP7wKs/pIk8K/
   D3InKsf3+OThPhJDR066Nv+AjgucJO72JxqHLS0FqH7enCvhBcehxuHQT
   Q==;
X-CSE-ConnectionGUID: svikGxhSS4i/Brxg6wYhNw==
X-CSE-MsgGUID: eFtM3/JwR3GPkKp4680R4g==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13339333"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="13339333"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 12:36:13 -0700
X-CSE-ConnectionGUID: OvXNVPloTm+aiktCL3ThUA==
X-CSE-MsgGUID: C4GsiRY9SzeO5T+dbVAHqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="58029761"
Received: from unknown (HELO pbossart-mobl6.lan) ([10.125.110.221])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 12:36:12 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 05/18] ASoC: Intel: sof_sdw_rt_dmic: use from dai parameter
Date: Mon, 27 May 2024 14:35:39 -0500
Message-ID: <20240527193552.165567-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240527193552.165567-1-pierre-louis.bossart@linux.intel.com>
References: <20240527193552.165567-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Bard Liao <yung-chuan.liao@linux.intel.com>

The dai is passed from the parameter. We don't need to find the dai
by name.

Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw_rt_dmic.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw_rt_dmic.c b/sound/soc/intel/boards/sof_sdw_rt_dmic.c
index b8b493d5c6ec..ea7c1a4bc566 100644
--- a/sound/soc/intel/boards/sof_sdw_rt_dmic.c
+++ b/sound/soc/intel/boards/sof_sdw_rt_dmic.c
@@ -12,25 +12,13 @@
 #include "sof_board_helpers.h"
 #include "sof_sdw_common.h"
 
-static const char * const dmics[] = {
-	"rt715",
-	"rt715-sdca",
-	"rt712-sdca-dmic",
-	"rt722-sdca",
-};
-
 int rt_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct snd_soc_component *component;
-	struct snd_soc_dai *codec_dai;
 	char *mic_name;
 
-	codec_dai = get_codec_dai_by_name(rtd, dmics, ARRAY_SIZE(dmics));
-	if (!codec_dai)
-		return -EINVAL;
-
-	component = codec_dai->component;
+	component = dai->component;
 
 	/*
 	 * rt715-sdca (aka rt714) is a special case that uses different name in card->components
-- 
2.43.0

