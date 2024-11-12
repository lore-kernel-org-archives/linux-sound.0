Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C689523098C
	for <linux-sound@vger.kernel.org>; Tue, 12 Nov 2024 11:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731411561; cv=none; b=ONo161FFPTGVVsEuhnGYr/r13Rf9KEWSkHMI7xFVVm2L6dOCSx59iz8kjM2LrMGbESRtV8TJSWmXly0rJggqul7RGzbluh4j6M9IlyKJr+9alGle4cp4c3jaXvykfNlIL2HTwivg3ZKuu1kmtr8sA1sp17wNo/X/QTyDW+q25uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731411561; c=relaxed/simple;
	bh=OfrMTCOQtd3AxA7/QMXmiv+5zTwIrefyxMwL+ab9SWc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CzskbCF7Ly8AMyZ6STrhgcSeNpleClF6EmXMaC3HnKszJKhf9p6N+KLclMmA6S33N+vgc1VreE4F9xNMvKoZTYzm5MfquO2O56OMHdb93igXzkZkjKrn5Y8XEMBGnOzhLmgxgf065tnRA6kcr60Fkm+AYmlrrob2fFuwFPW0yig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V9oODhFK; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V9oODhFK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731411560; x=1762947560;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OfrMTCOQtd3AxA7/QMXmiv+5zTwIrefyxMwL+ab9SWc=;
  b=V9oODhFK31XTlV6i0ESJ+7bzzWWCJ5Rz8lAYg7OxhaTbfyHiOSp1vDYl
   Ay47Xj5btnXvsDyeHDkSFghRa8Kz1mdsMbwoxOcbZsmJf8CeqeKe9xoQA
   nxkSYpAdB6ddir8qMdGXtxTrzwyst4m+hQWOnEX9JP7Wh76138Y/a+mUY
   SLUF9z1mrB2Uj58dpuU8HWGFL25nQmvdwjHBQl1/FW/5hLos2GqVc57GD
   NIxxzS4ba1bmAtgkHaRZvbF/Qex0dFaw58VDSb0W7oSE9iHzPu0gVmh5x
   qbeHF0y47NN6sAnnS9nin7P9r7WFYqUZZ1xICscQLqgfbM7Mky5LFeJxt
   g==;
X-CSE-ConnectionGUID: Gio+IWrST2Sb3G3gx7Q5lQ==
X-CSE-MsgGUID: vZtkW55sS1KPI1coDtql2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41802898"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41802898"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 03:39:20 -0800
X-CSE-ConnectionGUID: qWYxunpkQZelnvCrN4TG5Q==
X-CSE-MsgGUID: uom0NAnbShiw/xIquGcfXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; 
   d="scan'208";a="118358231"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmviesa001.fm.intel.com with ESMTP; 12 Nov 2024 03:39:18 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [RFC PATCH v2 3/4] ASoC: Intel: avs: Run detecting paths during prepare
Date: Tue, 12 Nov 2024 12:40:05 +0100
Message-Id: <20241112114006.2812697-4-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112114006.2812697-1-amadeuszx.slawinski@linux.intel.com>
References: <20241112114006.2812697-1-amadeuszx.slawinski@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Setup and run detecting paths during snd_pcm_prepare() call, so they can
wait for event to start drain pipelines.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/path.c     | 5 ++++-
 sound/soc/intel/avs/pcm.c      | 8 +++++++-
 sound/soc/intel/avs/topology.h | 1 +
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
index fa9ca3faec871..5e7b9151178fa 100644
--- a/sound/soc/intel/avs/path.c
+++ b/sound/soc/intel/avs/path.c
@@ -1095,7 +1095,10 @@ int avs_path_run(struct avs_path *path, int trigger)
 		}
 	}
 
-	path->state = AVS_PATH_STATE_RUNNING;
+	if (trigger == AVS_TPLG_TRIGGER_AUTO)
+		path->state = AVS_PATH_STATE_RUNNING;
+	else if (trigger == AVS_TPLG_TRIGGER_DETECT)
+		path->state = AVS_PATH_STATE_DETECTING;
 
 	return 0;
 }
diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 83eb01cf17e9c..0b618b1d04689 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -185,8 +185,14 @@ static int avs_dai_prepare(struct snd_pcm_substream *substream, struct snd_soc_d
 	}
 
 	ret = avs_path_pause(data->path);
-	if (ret < 0)
+	if (ret < 0) {
 		dev_err(dai->dev, "pause path failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = avs_path_run(data->path, AVS_TPLG_TRIGGER_DETECT);
+	if (ret < 0)
+		dev_err(dai->dev, "run path failed: %d\n", ret);
 	return ret;
 }
 
diff --git a/sound/soc/intel/avs/topology.h b/sound/soc/intel/avs/topology.h
index 7892e3797f63c..9d3b73c9b2add 100644
--- a/sound/soc/intel/avs/topology.h
+++ b/sound/soc/intel/avs/topology.h
@@ -112,6 +112,7 @@ struct avs_tplg_modcfg_ext {
 /* Specifies path behaviour during PCM ->trigger(START) command. */
 enum avs_tplg_trigger {
 	AVS_TPLG_TRIGGER_AUTO = 0,
+	AVS_TPLG_TRIGGER_DETECT = 1,
 };
 
 struct avs_tplg_pplcfg {
-- 
2.34.1

