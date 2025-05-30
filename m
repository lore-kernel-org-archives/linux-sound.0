Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837CA6F099
	for <linux-sound@vger.kernel.org>; Fri, 30 May 2025 13:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748613244; cv=none; b=aA8j5BVvL0GRsYEWpBTt0qIAhu/g7SbF24B4GSjNaat6SPFIwV+reWLsYEhdqCD3g3upuvZRLwW4ftUUGCfUdfphabbiClgp4YDqlW6W6lTBQpA+hiRObngtrzvj3renfs0JxttKb69vxeyOLYf28X1maxnf/RqCd0pMA64Z3x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748613244; c=relaxed/simple;
	bh=MnhE6+wP+zTrrxTDKdEbuZIx5TBpekJ5tU9TGBZATQk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W3Q/rxg7YLsksbirs+xKRtBPPWoN0IjrbsN7KPZA43FHb6CTNAzfRRQTWVUsuHYYzd+1+hPa4ZWCRblDUcnBxouUDyz8js3cx6uqWbLlFr6ZFVcAk5KQGIj9/wXnQO9ooNHo915/k5dYev/VFXt/8CXU3vctNYi0Cs09i0kfztI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gD4zI+PM; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gD4zI+PM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748613242; x=1780149242;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MnhE6+wP+zTrrxTDKdEbuZIx5TBpekJ5tU9TGBZATQk=;
  b=gD4zI+PMVcFGqtKiG+i/8Yy4NdfAnyctNdJXtDY0bCmqumgZhzp4rRcy
   ESsJ8J6cagXJYFb6Y7laVfloX3kdE3WZnnNe7zyd81V2oSVnHLo4Stvo4
   XpsmBuLcOcS3lRLhRtlAZfw1KUtefi00wP2hzAyju3RaggCpQNMm2oAXC
   YqKwD0gqgUf/v7/CFngSObFB9+Q6rJg2avoAen/LDAKIQxXO2DBLaXzN0
   AB70fOozKWoKV75qmNvctJB6D1Na55SQJJt0Xw+rTtvp/xPJinJ8DuqAH
   hRsZKqkTiuTRQCcgNA7tJUzSq7O8ODdyMo79okH1V5jGM7NyUOnxMllFt
   A==;
X-CSE-ConnectionGUID: R7bwY2JITWuOuJhkqq2k4w==
X-CSE-MsgGUID: AEH411e9T82jMcVqGYC9Qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="68256188"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="68256188"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 06:54:02 -0700
X-CSE-ConnectionGUID: SfGSQVVuQoGru1RGCqd1DQ==
X-CSE-MsgGUID: Es4m7m+iQKus+7yrd+J+hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="174763391"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa001.fm.intel.com with ESMTP; 30 May 2025 06:54:01 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 4/9] ASoC: Intel: avs: Fix possible null-ptr-deref when initing hw
Date: Fri, 30 May 2025 16:10:20 +0200
Message-Id: <20250530141025.2942936-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250530141025.2942936-1-cezary.rojewski@intel.com>
References: <20250530141025.2942936-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Search result of avs_dai_find_path_template() shall be verified before
being used. As 'template' is already known when
avs_hw_constraints_init() is fired, drop the search entirely.

Fixes: f2f847461fb7 ("ASoC: Intel: avs: Constrain path based on BE capabilities")
Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/pcm.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index d1acc636add7..ccf90428126d 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -83,10 +83,8 @@ void avs_period_elapsed(struct snd_pcm_substream *substream)
 static int hw_rule_param_size(struct snd_pcm_hw_params *params, struct snd_pcm_hw_rule *rule);
 static int avs_hw_constraints_init(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_pcm_hw_constraint_list *r, *c, *s;
-	struct avs_tplg_path_template *template;
 	struct avs_dma_data *data;
 	int ret;
 
@@ -99,8 +97,7 @@ static int avs_hw_constraints_init(struct snd_pcm_substream *substream, struct s
 	c = &(data->channels_list);
 	s = &(data->sample_bits_list);
 
-	template = avs_dai_find_path_template(dai, !rtd->dai_link->no_pcm, substream->stream);
-	ret = avs_path_set_constraint(data->adev, template, r, c, s);
+	ret = avs_path_set_constraint(data->adev, data->template, r, c, s);
 	if (ret <= 0)
 		return ret;
 
-- 
2.25.1

