Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609312309A7
	for <linux-sound@vger.kernel.org>; Tue, 12 Nov 2024 11:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731411562; cv=none; b=RiJyDCgohWiCv8WZCUlkOcTrRSmQv6EGBhhyCcOrRiG3l+W1ynGN8jKs5b/YAIikfC8jtzR3rsztQZUcKcn2susA3S7UannWXjoRFz/kTjWZGElB68lejM5R/vJw69YhSXPnm/wACEXOSnK3XIuVg+d5YOOKLP3go7ADhD4Ekgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731411562; c=relaxed/simple;
	bh=P94ys5rVKS4j1H9x92Eha+fju/GUR7KzWrZgETYkbDQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hopu2o0H+s5rvBj5KK0lnvB39LAzHMGoectvpdWX1L9ayayz3ZPD+10UcZtCG+Yw2PhboVQwY1NGUQGAlipfAUhj/Q3uiozQ7TcQyQiqM/Xd3RVlyZvEa2jUsxdnMV3pfe8TsD9ACJXU+gUF04M8X/gkkjsosP0qjQHmogjpwpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wzk8tPcQ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wzk8tPcQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731411562; x=1762947562;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=P94ys5rVKS4j1H9x92Eha+fju/GUR7KzWrZgETYkbDQ=;
  b=Wzk8tPcQUWjCQiPnxhUvPWyBlLHILPd1vj8hwUC25urwqmDQAb4YgFih
   6fs5cE3eYJjkm03SOC08By3PVx49x/JpqZLwNW3nAHXYV0ZJ+VCf/MLz2
   XsKX+Tdrg0GTBymUvGq+etwRxAT9+Zcuaj2Mio4AqymMb5ZyTuDZBbUHy
   XSjbFQ3QO9pCt2uXgqz3fBENcCFenqart6KU9Y50ALPrU8BA0rsWJWnq/
   CaF3VeEkwmS9vZjByeCp0L6CKbh5ZYVmAHEZXXSASDOk0BEqZNMTjc+79
   wU8gGM7XmrIgiZJNvH7WoIoTwPvanTMNkP1l6WMIYGib6Jlq7QisuAquY
   w==;
X-CSE-ConnectionGUID: RhBXZLTPQQ+TkQ/SgQ3fcA==
X-CSE-MsgGUID: XexQqEFQRvSZQ9Rdmi7d0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41802906"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41802906"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 03:39:22 -0800
X-CSE-ConnectionGUID: 3w8NCYFlS4KMKUC+Llna4Q==
X-CSE-MsgGUID: 1S6r/3mpQbyRiHqTqHRMow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; 
   d="scan'208";a="118358235"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmviesa001.fm.intel.com with ESMTP; 12 Nov 2024 03:39:19 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [RFC PATCH v2 4/4] ASoC: Intel: avs: Pause detecting pipeline before reset
Date: Tue, 12 Nov 2024 12:40:06 +0100
Message-Id: <20241112114006.2812697-5-amadeuszx.slawinski@linux.intel.com>
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

FW pipeline machine state follows specific order, so running path
needs to be paused before it can reset pipelines.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/path.c | 5 +++++
 sound/soc/intel/avs/path.h | 1 +
 sound/soc/intel/avs/pcm.c  | 8 ++++++++
 3 files changed, 14 insertions(+)

diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
index 5e7b9151178fa..3511ee7c0e22e 100644
--- a/sound/soc/intel/avs/path.c
+++ b/sound/soc/intel/avs/path.c
@@ -1102,3 +1102,8 @@ int avs_path_run(struct avs_path *path, int trigger)
 
 	return 0;
 }
+
+bool avs_path_is_detecting(struct avs_path *path)
+{
+	return (path->state == AVS_PATH_STATE_DETECTING);
+}
diff --git a/sound/soc/intel/avs/path.h b/sound/soc/intel/avs/path.h
index a60e6d2f4ad5c..48441a44c547b 100644
--- a/sound/soc/intel/avs/path.h
+++ b/sound/soc/intel/avs/path.h
@@ -76,5 +76,6 @@ int avs_path_unbind(struct avs_path *path);
 int avs_path_reset(struct avs_path *path);
 int avs_path_pause(struct avs_path *path);
 int avs_path_run(struct avs_path *path, int trigger);
+bool avs_path_is_detecting(struct avs_path *path);
 
 #endif
diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 0b618b1d04689..f54dc1ee6b9b2 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -178,6 +178,14 @@ static int avs_dai_prepare(struct snd_pcm_substream *substream, struct snd_soc_d
 	if (!data->path)
 		return 0;
 
+	if (avs_path_is_detecting(data->path)) {
+		ret = avs_path_pause(data->path);
+		if (ret < 0) {
+			dev_err(dai->dev, "pause path failed: %d\n", ret);
+			return ret;
+		}
+	}
+
 	ret = avs_path_reset(data->path);
 	if (ret < 0) {
 		dev_err(dai->dev, "reset path failed: %d\n", ret);
-- 
2.34.1

