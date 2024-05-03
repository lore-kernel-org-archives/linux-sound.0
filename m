Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962A2153826
	for <linux-sound@vger.kernel.org>; Fri,  3 May 2024 13:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714743190; cv=none; b=AplpZfmMmpLtJcidvCWg5dJaiORSFdGqBibOIfJ9Li/PVYnU4uFh2XnXTVlECPfGFLpChtL3AZaiL+Cet457T2cpeNsQJVdUFX9Z6S9y3ExhYepfzXKVEf8RA3267kh++s3EkCf9wG0N6PsttvelXLwXRFsJCD6eWtlFlG94XsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714743190; c=relaxed/simple;
	bh=+Q6B5US8cjIZuGqrA77g1CRrT/PNP5/O70Mnu78eYec=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fIoQfiG2yYdUiEzx0kB4MFlvsf02hbGvMxynsf1bphVmJR0FSxjFgrQHdGicvw7og4YjKv6yxfFJIzCiXJuNShwYyGX2JRwzyUuf0huZdxXdHscFjZBsgzPaxGxZZ94RcswxLfwmtgswXQ5P+Zj2vPBuc14CA9gd/mJGx87cuMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W4cNuSw5; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W4cNuSw5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714743189; x=1746279189;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+Q6B5US8cjIZuGqrA77g1CRrT/PNP5/O70Mnu78eYec=;
  b=W4cNuSw53dtat7AK85KKKUGEawctIolSTNEqJypyHTjY8AeNOAB8FSHl
   bMDiXldCJQVT3Z8UvxUfNDNn7CkTCTSMgXQ56775tVzaLY22oy8uoNsgu
   3n6HFFUV1bMsxAY7bN9t9BpNLOnJ6daWDKPVNCfI+1gk3Oq7eVRb3KWeF
   QdHfr17HhfuRf5K63yyRWZrZKfT35DE7Pyx2fyaGVXcHq2lnRXcVAgmTI
   2qafqXiTerMy/Pk1M0kurFlFsHj8CczYit4GISkmPOXiq/0SELfWyfpwy
   rCPx9S5GRhHva9v9Ix81BayCuf7ag8hxa9JJdkeJkSADrayR/7JovxCgw
   A==;
X-CSE-ConnectionGUID: pZ4CHacESsO+z8C3Sqs7qA==
X-CSE-MsgGUID: 2ZUyQ07XSe+eBa3J2tynOA==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="13499111"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="13499111"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 06:33:07 -0700
X-CSE-ConnectionGUID: T9jhZxjBSS+sY48eN7RXww==
X-CSE-MsgGUID: H4ZvY/RSQb25h8WxaLWspA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="27501254"
Received: from sjslinke-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.113.3])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 06:33:03 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 2/3] ASoC: SOF: ipc4-topology: Allow selective update in sof_ipc4_update_hw_params
Date: Fri,  3 May 2024 08:32:52 -0500
Message-Id: <20240503133253.108201-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240503133253.108201-1-pierre-louis.bossart@linux.intel.com>
References: <20240503133253.108201-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

Add a bitmask parameter to sof_ipc4_update_hw_params() to be able to select
the param to be updated.
This feature can be used when not all params should be updated, for example
if caller only wants to update the format in the params, leaving the
channels and rates untouched.

Reviewed-by: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 83 +++++++++++++++++++++--------------
 1 file changed, 51 insertions(+), 32 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index a972b2b5122a..f56b7fbbe10f 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1119,42 +1119,50 @@ static int sof_ipc4_widget_assign_instance_id(struct snd_sof_dev *sdev,
 
 /* update hw_params based on the audio stream format */
 static int sof_ipc4_update_hw_params(struct snd_sof_dev *sdev, struct snd_pcm_hw_params *params,
-				     struct sof_ipc4_audio_format *fmt)
+				     struct sof_ipc4_audio_format *fmt, u32 param_to_update)
 {
-	snd_pcm_format_t snd_fmt;
 	struct snd_interval *i;
-	struct snd_mask *m;
-	int valid_bits = SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(fmt->fmt_cfg);
-	unsigned int channels, rate;
 
-	switch (valid_bits) {
-	case 16:
-		snd_fmt = SNDRV_PCM_FORMAT_S16_LE;
-		break;
-	case 24:
-		snd_fmt = SNDRV_PCM_FORMAT_S24_LE;
-		break;
-	case 32:
-		snd_fmt = SNDRV_PCM_FORMAT_S32_LE;
-		break;
-	default:
-		dev_err(sdev->dev, "invalid PCM valid_bits %d\n", valid_bits);
-		return -EINVAL;
+	if (param_to_update & BIT(SNDRV_PCM_HW_PARAM_FORMAT)) {
+		int valid_bits = SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(fmt->fmt_cfg);
+		snd_pcm_format_t snd_fmt;
+		struct snd_mask *m;
+
+		switch (valid_bits) {
+		case 16:
+			snd_fmt = SNDRV_PCM_FORMAT_S16_LE;
+			break;
+		case 24:
+			snd_fmt = SNDRV_PCM_FORMAT_S24_LE;
+			break;
+		case 32:
+			snd_fmt = SNDRV_PCM_FORMAT_S32_LE;
+			break;
+		default:
+			dev_err(sdev->dev, "invalid PCM valid_bits %d\n", valid_bits);
+			return -EINVAL;
+		}
+
+		m = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
+		snd_mask_none(m);
+		snd_mask_set_format(m, snd_fmt);
 	}
 
-	m = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
-	snd_mask_none(m);
-	snd_mask_set_format(m, snd_fmt);
+	if (param_to_update & BIT(SNDRV_PCM_HW_PARAM_RATE)) {
+		unsigned int rate = fmt->sampling_frequency;
 
-	rate = fmt->sampling_frequency;
-	i = hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE);
-	i->min = rate;
-	i->max = rate;
+		i = hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE);
+		i->min = rate;
+		i->max = rate;
+	}
 
-	channels = SOF_IPC4_AUDIO_FORMAT_CFG_CHANNELS_COUNT(fmt->fmt_cfg);
-	i = hw_param_interval(params, SNDRV_PCM_HW_PARAM_CHANNELS);
-	i->min = channels;
-	i->max = channels;
+	if (param_to_update & BIT(SNDRV_PCM_HW_PARAM_CHANNELS)) {
+		unsigned int channels = SOF_IPC4_AUDIO_FORMAT_CFG_CHANNELS_COUNT(fmt->fmt_cfg);
+
+		i = hw_param_interval(params, SNDRV_PCM_HW_PARAM_CHANNELS);
+		i->min = channels;
+		i->max = channels;
+	}
 
 	return 0;
 }
@@ -1844,7 +1852,11 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 	}
 
 	/* modify the input params for the next widget */
-	ret = sof_ipc4_update_hw_params(sdev, pipeline_params, &copier_data->out_format);
+	ret = sof_ipc4_update_hw_params(sdev, pipeline_params,
+					&copier_data->out_format,
+					BIT(SNDRV_PCM_HW_PARAM_FORMAT) |
+					BIT(SNDRV_PCM_HW_PARAM_CHANNELS) |
+					BIT(SNDRV_PCM_HW_PARAM_RATE));
 	if (ret)
 		return ret;
 
@@ -2069,7 +2081,10 @@ static int sof_ipc4_prepare_src_module(struct snd_sof_widget *swidget,
 	src->data.sink_rate = out_audio_fmt->sampling_frequency;
 
 	/* update pipeline_params for sink widgets */
-	return sof_ipc4_update_hw_params(sdev, pipeline_params, out_audio_fmt);
+	return sof_ipc4_update_hw_params(sdev, pipeline_params, out_audio_fmt,
+					 BIT(SNDRV_PCM_HW_PARAM_FORMAT) |
+					 BIT(SNDRV_PCM_HW_PARAM_CHANNELS) |
+					 BIT(SNDRV_PCM_HW_PARAM_RATE));
 }
 
 static int
@@ -2193,7 +2208,11 @@ static int sof_ipc4_prepare_process_module(struct snd_sof_widget *swidget,
 		       sizeof(struct sof_ipc4_audio_format));
 
 		/* modify the pipeline params with the pin 0 output format */
-		ret = sof_ipc4_update_hw_params(sdev, pipeline_params, &process->output_format);
+		ret = sof_ipc4_update_hw_params(sdev, pipeline_params,
+						&process->output_format,
+						BIT(SNDRV_PCM_HW_PARAM_FORMAT) |
+						BIT(SNDRV_PCM_HW_PARAM_CHANNELS) |
+						BIT(SNDRV_PCM_HW_PARAM_RATE));
 		if (ret)
 			return ret;
 	}
-- 
2.40.1

