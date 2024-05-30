Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9533617E455
	for <linux-sound@vger.kernel.org>; Thu, 30 May 2024 11:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717067950; cv=none; b=TYxT+bHQJfynehISH8MftJoIaDqaWWRDE6TtZybqtik7iEPZymnvzKZlOzXo9v6UgWf2N6tlLW6GgKB6s4aFjuOk8KWSsGXjK3mjOafKUmg9x9xxzX+x2ZwA9ZaU87ETCNrv3zRvp+jlN0ymEKhEH1DnYfHlYtjEFVwZYSuGQw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717067950; c=relaxed/simple;
	bh=w7cNiEjYow2fTnfJiZ8Vh2HdK1bq76ofNQices4Fmzc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YY8UvRQI5lA32CQ4scuN/+pLjriOSE7O/fIOJKqHgwnfIB87Mjkj+laAsxF3QXOlXdrdiBSHrym76ZM+mh/av8E+lbpHEmjFIh1DWhRBmjon86hTYUi2BDE3gXALyyjralp6U4CC26d7XmVEU5iw6prJpoAhGB/75SgznV2NKyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lcD6665t; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lcD6665t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717067949; x=1748603949;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=w7cNiEjYow2fTnfJiZ8Vh2HdK1bq76ofNQices4Fmzc=;
  b=lcD6665tikywXU13lzpWO91IYX6X6mzJgE3t2fJxpQzYMD6dHImCExWG
   iMa+qgz5r320pEqTabPep59rbpkqGG9P1X4RHJ8TkDENlrsCJHIjZXqDo
   AbAyW3eKM4V864eQfdrASO51gt9j0rd5ickm420StIhW36xrSle9j3JQ9
   eV8HX3u0qvf07eysmoBQfQrS0YafQrDcr8sREHoOEEd3ATowfScW1Zei2
   7k3eQ5Ja4MbHvSbz70PFhPC7VPEAIFxbIsq7WTML3EdnIwV4FjnUNCN9K
   EZTXcmVs/+YOnZTqbHIj/B5YHuNHihId9gQrBWcF9+NwAy3MyZ/pF7Z1a
   Q==;
X-CSE-ConnectionGUID: Cjm8wwmySWKEFjNrEPnQSA==
X-CSE-MsgGUID: 1rQ+61p3QNWhWo3SHKcChA==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="31065327"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; 
   d="scan'208";a="31065327"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 04:19:09 -0700
X-CSE-ConnectionGUID: ol1MzZB7TNizz4cGdEJfAA==
X-CSE-MsgGUID: dJ8vPtUcTimLrfouL7c3LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; 
   d="scan'208";a="73258840"
Received: from unknown (HELO pujfalus-desk.intel.com) ([10.124.223.207])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 04:19:06 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	seppo.ingalsuo@linux.intel.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 6.10 5/5] ASoC: SOF: ipc4-topology: Adjust the params based on DAI formats
Date: Thu, 30 May 2024 14:19:18 +0300
Message-ID: <20240530111918.21974-6-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240530111918.21974-1-peter.ujfalusi@linux.intel.com>
References: <20240530111918.21974-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently we only check the bit depth value among to DAI formats, but other
parameters might be constant, like number of channels and/or rate.

In capture we use the fe params as a reference to find the format and blob
which should be used, but in the path we can have components which can
handle expanding/narrowing number of channels or do a resample.

In these cases the topology is expected to have 'fixed' parameter for
channels/rates/bit depth and the conversion to the fe format is going to
be done within the path.

In practice this patch fixes issues like:
All DMIC formats are fixed four channels
We have a component which converts the four channel to stereo
FE is opened with 2 channel

Even if we have the correct bit depth format and blob (for four channel) we
will still be looking for stereo configurations, which will fail.

Note: the adjustment of params have switched order with the checking of
single bit depth (needed for the NHLT blob fallback support). This change
is non function, just that if the sof_ipc4_narrow_params_to_format() would
fail, there is no point of checking the single bit depth.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 71 ++++++++++++++++++++++++++++-------
 1 file changed, 57 insertions(+), 14 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 4c455d1bfd89..00987039c972 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1591,6 +1591,55 @@ bool sof_ipc4_copier_is_single_bitdepth(struct snd_sof_dev *sdev,
 	return true;
 }
 
+static int
+sof_ipc4_adjust_params_to_dai_format(struct snd_sof_dev *sdev,
+				     struct snd_pcm_hw_params *params,
+				     struct sof_ipc4_pin_format *pin_fmts,
+				     u32 pin_fmts_size)
+{
+	u32 params_mask = BIT(SNDRV_PCM_HW_PARAM_RATE) |
+			  BIT(SNDRV_PCM_HW_PARAM_CHANNELS) |
+			  BIT(SNDRV_PCM_HW_PARAM_FORMAT);
+	struct sof_ipc4_audio_format *fmt;
+	u32 rate, channels, valid_bits;
+	int i;
+
+	fmt = &pin_fmts[0].audio_fmt;
+	rate = fmt->sampling_frequency;
+	channels = SOF_IPC4_AUDIO_FORMAT_CFG_CHANNELS_COUNT(fmt->fmt_cfg);
+	valid_bits = SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(fmt->fmt_cfg);
+
+	/* check if parameters in topology defined formats are the same */
+	for (i = 1; i < pin_fmts_size; i++) {
+		u32 val;
+
+		fmt = &pin_fmts[i].audio_fmt;
+
+		if (params_mask & BIT(SNDRV_PCM_HW_PARAM_RATE)) {
+			val = fmt->sampling_frequency;
+			if (val != rate)
+				params_mask &= ~BIT(SNDRV_PCM_HW_PARAM_RATE);
+		}
+		if (params_mask & BIT(SNDRV_PCM_HW_PARAM_CHANNELS)) {
+			val = SOF_IPC4_AUDIO_FORMAT_CFG_CHANNELS_COUNT(fmt->fmt_cfg);
+			if (val != channels)
+				params_mask &= ~BIT(SNDRV_PCM_HW_PARAM_CHANNELS);
+		}
+		if (params_mask & BIT(SNDRV_PCM_HW_PARAM_FORMAT)) {
+			val = SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(fmt->fmt_cfg);
+			if (val != valid_bits)
+				params_mask &= ~BIT(SNDRV_PCM_HW_PARAM_FORMAT);
+		}
+	}
+
+	if (params_mask)
+		return sof_ipc4_update_hw_params(sdev, params,
+						 &pin_fmts[0].audio_fmt,
+						 params_mask);
+
+	return 0;
+}
+
 static int
 sof_ipc4_prepare_dai_copier(struct snd_sof_dev *sdev, struct snd_sof_dai *dai,
 			    struct snd_pcm_hw_params *params, int dir)
@@ -1609,10 +1658,9 @@ sof_ipc4_prepare_dai_copier(struct snd_sof_dev *sdev, struct snd_sof_dai *dai,
 	available_fmt = &ipc4_copier->available_fmt;
 
 	/*
-	 * If the copier on the DAI side supports only single bit depth then
-	 * this depth (format) should be used to look for the NHLT blob (if
-	 * needed) and in case of capture this should be used for the input
-	 * format lookup
+	 * Fixup the params based on the format parameters of the DAI. If any
+	 * of the RATE, CHANNELS, bit depth is static among the formats then
+	 * narrow the params to only allow that specific parameter value.
 	 */
 	if (dir == SNDRV_PCM_STREAM_PLAYBACK) {
 		pin_fmts = available_fmt->output_pin_fmts;
@@ -1622,18 +1670,13 @@ sof_ipc4_prepare_dai_copier(struct snd_sof_dev *sdev, struct snd_sof_dai *dai,
 		num_pin_fmts = available_fmt->num_input_formats;
 	}
 
+	ret = sof_ipc4_adjust_params_to_dai_format(sdev, &dai_params, pin_fmts,
+						   num_pin_fmts);
+	if (ret)
+		return ret;
+
 	single_bitdepth = sof_ipc4_copier_is_single_bitdepth(sdev, pin_fmts,
 							     num_pin_fmts);
-
-	/* Update the dai_params with the only supported format */
-	if (single_bitdepth) {
-		ret = sof_ipc4_update_hw_params(sdev, &dai_params,
-						&pin_fmts[0].audio_fmt,
-						BIT(SNDRV_PCM_HW_PARAM_FORMAT));
-		if (ret)
-			return ret;
-	}
-
 	ret = snd_sof_get_nhlt_endpoint_data(sdev, dai, single_bitdepth,
 					     &dai_params,
 					     ipc4_copier->dai_index,
-- 
2.45.1

