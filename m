Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC37322AE76
	for <linux-sound@vger.kernel.org>; Mon,  7 Apr 2025 11:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744024027; cv=none; b=bmCVAJubrS8j7j5vibfneLTCBv5ZYI43FzuSkkUGESaCfi09JmUMIcq52B+QcZx22I70vqn1yLfwHI68YNM8Pn1gUwtCFN8NKWh6OuYKNRyXtpJpf5xRKUeG29pnlc/c/5gP217qj39nVUbr/qs8tCnaF+OhF583tydNUmO5/Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744024027; c=relaxed/simple;
	bh=SZ15w1yM6DKkA9pR455T6FP/0Xvez41ShePpAK86M+g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qawV5Y2iX60W01NAwqZErGBt0FPgwigHUqoUFIv7VX+kHfIs+5rbExOCKo59i+Grzuz2hoMEkmGRsLu/S1ZqaGIndPcv1VFD9glg1OvCnqu8NVOE+AMiGVn8S+QWndNM6FKk1BCgzUoWSSmndnyEgLrNlpZzjuPZC7fl/XcjSYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jP/M2usC; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jP/M2usC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744024026; x=1775560026;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SZ15w1yM6DKkA9pR455T6FP/0Xvez41ShePpAK86M+g=;
  b=jP/M2usCb9wXHLhrJXSnnPh3nVJXImpgbWwXEXM9ihUDNlra6d+rIhAx
   rKArNGfcl1ttFPdN6PKS+rqtm7rv2jvJyap8CPEj7Ek5kQ3csAkx+VZAj
   rKgup8IljbCKEVoRFBuAU4B9ElEB5bnfoObKg/vxWztxQ/mAYF1kdLuyd
   RlZmRoTc5fwtdXpiJlBvdayNcPGAuvjG9J+H7cF/NKleoJ/AD12leqM3Z
   aU2+Xq8chKLZVZ19EF+eMQdsetXjx1FIHvEvsOPm7TyP+V746SwhUsS/f
   t0QEfyAb4VRsWHzYQYBXNt7EINs0repSAXykXxo+qZ6hQxSr+D/KgtYM+
   w==;
X-CSE-ConnectionGUID: XV+oV+8TQAaU9+UpOEor0w==
X-CSE-MsgGUID: zA7rngytT2eYR8PEH0JYgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="49057366"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="49057366"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 04:07:06 -0700
X-CSE-ConnectionGUID: 7W5a6sxwQm2xYPa3/XoPdg==
X-CSE-MsgGUID: lOM6krCjRDWWEgFuZ0lZTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="127776316"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa006.fm.intel.com with ESMTP; 07 Apr 2025 04:07:04 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	liam.r.girdwood@intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 07/10] ASoC: Intel: avs: Dynamically assign ops for non-HDAudio DAIs
Date: Mon,  7 Apr 2025 13:23:49 +0200
Message-Id: <20250407112352.3720779-8-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250407112352.3720779-1-cezary.rojewski@intel.com>
References: <20250407112352.3720779-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Provide dynamic selection mechanism of DAI operations for the
non-HDAudio DAIs so that both LunarLake+ platforms and their
predecessors are supported.

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/pcm.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index d7d3c696be28..7e17df580a6e 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -502,7 +502,6 @@ static const struct snd_soc_dai_ops avs_dai_hda_be_ops = {
 	.trigger = avs_dai_hda_be_trigger,
 };
 
-__maybe_unused
 static const struct snd_soc_dai_ops avs_dai_i2shda_be_ops = {
 	.startup = avs_dai_i2shda_be_startup,
 	.shutdown = avs_dai_althda_be_shutdown,
@@ -512,7 +511,6 @@ static const struct snd_soc_dai_ops avs_dai_i2shda_be_ops = {
 	.trigger = avs_dai_hda_be_trigger,
 };
 
-__maybe_unused
 static const struct snd_soc_dai_ops avs_dai_dmichda_be_ops = {
 	.startup = avs_dai_dmichda_be_startup,
 	.shutdown = avs_dai_althda_be_shutdown,
@@ -1359,7 +1357,6 @@ int avs_soc_component_register(struct device *dev, const char *name,
 static struct snd_soc_dai_driver dmic_cpu_dais[] = {
 {
 	.name = "DMIC Pin",
-	.ops = &avs_dai_nonhda_be_ops,
 	.capture = {
 		.stream_name	= "DMIC Rx",
 		.channels_min	= 1,
@@ -1370,7 +1367,6 @@ static struct snd_soc_dai_driver dmic_cpu_dais[] = {
 },
 {
 	.name = "DMIC WoV Pin",
-	.ops = &avs_dai_nonhda_be_ops,
 	.capture = {
 		.stream_name	= "DMIC WoV Rx",
 		.channels_min	= 1,
@@ -1383,12 +1379,20 @@ static struct snd_soc_dai_driver dmic_cpu_dais[] = {
 
 int avs_dmic_platform_register(struct avs_dev *adev, const char *name)
 {
+	const struct snd_soc_dai_ops *ops;
+
+	if (avs_platattr_test(adev, ALTHDA))
+		ops = &avs_dai_dmichda_be_ops;
+	else
+		ops = &avs_dai_nonhda_be_ops;
+
+	dmic_cpu_dais[0].ops = ops;
+	dmic_cpu_dais[1].ops = ops;
 	return avs_soc_component_register(adev->dev, name, &avs_component_driver, dmic_cpu_dais,
 					  ARRAY_SIZE(dmic_cpu_dais));
 }
 
 static const struct snd_soc_dai_driver i2s_dai_template = {
-	.ops = &avs_dai_nonhda_be_ops,
 	.playback = {
 		.channels_min	= 1,
 		.channels_max	= 8,
@@ -1421,10 +1425,15 @@ int avs_i2s_platform_register(struct avs_dev *adev, const char *name, unsigned l
 			      unsigned long *tdms)
 {
 	struct snd_soc_dai_driver *cpus, *dai;
+	const struct snd_soc_dai_ops *ops;
 	size_t ssp_count, cpu_count;
 	int i, j;
 
 	ssp_count = adev->hw_cfg.i2s_caps.ctrl_count;
+	if (avs_platattr_test(adev, ALTHDA))
+		ops = &avs_dai_i2shda_be_ops;
+	else
+		ops = &avs_dai_nonhda_be_ops;
 
 	cpu_count = 0;
 	for_each_set_bit(i, &port_mask, ssp_count)
@@ -1452,6 +1461,7 @@ int avs_i2s_platform_register(struct avs_dev *adev, const char *name, unsigned l
 
 			if (!dai->name || !dai->playback.stream_name || !dai->capture.stream_name)
 				return -ENOMEM;
+			dai->ops = ops;
 			dai++;
 		}
 	}
@@ -1472,6 +1482,7 @@ int avs_i2s_platform_register(struct avs_dev *adev, const char *name, unsigned l
 
 			if (!dai->name || !dai->playback.stream_name || !dai->capture.stream_name)
 				return -ENOMEM;
+			dai->ops = ops;
 			dai++;
 		}
 	}
-- 
2.25.1

