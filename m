Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4EEA13FD9B
	for <linux-sound@vger.kernel.org>; Fri, 26 Apr 2024 09:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714125426; cv=none; b=sxuTdanjw+3cKaAQItkoz5ea3SEbz8cPvS/jgLd3m3qH2aALPpfcIE7RQOhbsT0H6mhLv5W1ibebHxLMHVHpaNWhvzRquVCq9Dx8Kj1Ob31GrUg8vE/A1e/ZXqGASIxmClsddXScE69Qhk3qJPyIasz6nvObRkIz/Cmc+a21Odo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714125426; c=relaxed/simple;
	bh=WvPxcJCAnFWnb26FV2ZBZGxjnmSM3tYTZTkWyMv25OM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IIewFm8EUeN3H7YaaBREEOl3rpZRjwmdAJV74QYPark7SJjxhC0EIhHvhzVnRWGE1T0c8z+L+dyuEaVjUGec+EjbaNUjTS2dMetMVX5QgWpau3Uz51MJmlugs9zWXbkTmzTA29bS5Yw+K2NeMhoIaua5V5xithz/cC05w8Erii0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gK70iPFP; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gK70iPFP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714125425; x=1745661425;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WvPxcJCAnFWnb26FV2ZBZGxjnmSM3tYTZTkWyMv25OM=;
  b=gK70iPFPQo7ktj7lnMVRheKo2GvYJDcdzW1RWZGZf+SaEpg/cR4TKjYb
   5Z5tkqubqrbxM5m+iC6E96YI7HG2CNcW00NM5h2c239SKRxeKy33UD3uC
   iSQ1YqvBoNb+WDwvy+RzTnB6Nfj+1dS6pQPOwWw2YPgE6AIfKT7ZyRqpE
   OjFZceK8VLNZOFoczPvuFyZeHcfYqjNvf0GNe+ennULJ7+H3LKlwgmb/w
   T434b6H1GHJxGVSUuRczstqz7OUd66GSWUK1o72lSbY/CNb2KwaTF+2xE
   cWjm14Ew6Jtu4mck9f0oig31iAMr8OPfiayaVmj/ztFTGjl0cqob8KSXn
   A==;
X-CSE-ConnectionGUID: lYznuXc4SGuyrfSnwagrbw==
X-CSE-MsgGUID: /YEdDFmUS6CSnnImhb0Nxw==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="20409232"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="20409232"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 02:57:05 -0700
X-CSE-ConnectionGUID: AqEiny2qSouGxqljEvUXcQ==
X-CSE-MsgGUID: Lo7qdTGzR26njZq/LEbXBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="25460633"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa010.fm.intel.com with ESMTP; 26 Apr 2024 02:57:02 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 8/8] ASoC: Intel: avs: Clean up hw constraints initialization
Date: Fri, 26 Apr 2024 11:57:33 +0200
Message-Id: <20240426095733.3946951-9-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240426095733.3946951-1-cezary.rojewski@intel.com>
References: <20240426095733.3946951-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide a separate function that initializes all PCM hardware
constraints for the driver. No functional changes.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/pcm.c | 84 ++++++++++++++++++++-------------------
 1 file changed, 44 insertions(+), 40 deletions(-)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 168e16e82116..845b5ed9eb1b 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -448,19 +448,6 @@ static const struct snd_soc_dai_ops avs_dai_hda_be_ops = {
 	.trigger = avs_dai_hda_be_trigger,
 };
 
-static const unsigned int rates[] = {
-	8000, 11025, 12000, 16000,
-	22050, 24000, 32000, 44100,
-	48000, 64000, 88200, 96000,
-	128000, 176400, 192000,
-};
-
-static const struct snd_pcm_hw_constraint_list hw_rates = {
-	.count = ARRAY_SIZE(rates),
-	.list = rates,
-	.mask = 0,
-};
-
 static int hw_rule_param_size(struct snd_pcm_hw_params *params, struct snd_pcm_hw_rule *rule)
 {
 	struct snd_interval *interval = hw_param_interval(params, rule->var);
@@ -481,40 +468,33 @@ static int hw_rule_param_size(struct snd_pcm_hw_params *params, struct snd_pcm_h
 	return snd_interval_refine(interval, &to);
 }
 
-static int avs_dai_fe_startup(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
+static int avs_pcm_hw_constraints_init(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct avs_dma_data *data;
-	struct hdac_bus *bus;
-	struct hdac_ext_stream *host_stream;
+	static const unsigned int rates[] = {
+		8000, 11025, 12000, 16000,
+		22050, 24000, 32000, 44100,
+		48000, 64000, 88200, 96000,
+		128000, 176400, 192000,
+	};
+	static const struct snd_pcm_hw_constraint_list rate_list = {
+		.count = ARRAY_SIZE(rates),
+		.list = rates,
+	};
 	int ret;
 
-	ret = avs_dai_startup(substream, dai);
-	if (ret)
-		return ret;
-
-	data = snd_soc_dai_get_dma_data(dai, substream);
-	bus = &data->adev->base.core;
-
-	host_stream = snd_hdac_ext_stream_assign(bus, substream, HDAC_EXT_STREAM_TYPE_HOST);
-	if (!host_stream) {
-		ret = -EBUSY;
-		goto err;
-	}
-
-	data->host_stream = host_stream;
 	ret = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
 	if (ret < 0)
-		goto err;
+		return ret;
 
-	/* avoid wrap-around with wall-clock */
+	/* Avoid wrap-around with wall-clock. */
 	ret = snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_BUFFER_TIME, 20, 178000000);
 	if (ret < 0)
-		goto err;
+		return ret;
 
-	ret = snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE, &hw_rates);
+	ret = snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE, &rate_list);
 	if (ret < 0)
-		goto err;
+		return ret;
 
 	/* Adjust buffer and period size based on the audio format. */
 	snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_BUFFER_SIZE, hw_rule_param_size, NULL,
@@ -524,16 +504,40 @@ static int avs_dai_fe_startup(struct snd_pcm_substream *substream, struct snd_so
 			    SNDRV_PCM_HW_PARAM_FORMAT, SNDRV_PCM_HW_PARAM_CHANNELS,
 			    SNDRV_PCM_HW_PARAM_RATE, -1);
 
+	return ret;
+}
+
+static int avs_dai_fe_startup(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
+{
+	struct hdac_ext_stream *host_stream;
+	struct avs_dma_data *data;
+	struct hdac_bus *bus;
+	int ret;
+
+	ret = avs_pcm_hw_constraints_init(substream);
+	if (ret)
+		return ret;
+
+	ret = avs_dai_startup(substream, dai);
+	if (ret)
+		return ret;
+
+	data = snd_soc_dai_get_dma_data(dai, substream);
+	bus = &data->adev->base.core;
+
+	host_stream = snd_hdac_ext_stream_assign(bus, substream, HDAC_EXT_STREAM_TYPE_HOST);
+	if (!host_stream) {
+		avs_dai_shutdown(substream, dai);
+		return -EBUSY;
+	}
+
+	data->host_stream = host_stream;
 	snd_pcm_set_sync(substream);
 
 	dev_dbg(dai->dev, "%s fe STARTUP tag %d str %p",
 		__func__, hdac_stream(host_stream)->stream_tag, substream);
 
 	return 0;
-
-err:
-	kfree(data);
-	return ret;
 }
 
 static void avs_dai_fe_shutdown(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
-- 
2.25.1

