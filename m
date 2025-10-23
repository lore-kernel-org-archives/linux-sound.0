Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE622FD67D
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 09:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761210383; cv=none; b=SWY9Ww1fPT/M9hNzsbboNVwjVI/FRdmaEiU+kd+qR0cxU1+ESr0t27sDQB1APUJDBdI6Y+O///tALmVrP1udH8+3zV5WcNL+XI2wGPtNozEgb8L9CAnDYkQnz9nzj4nHjKlZ4hi6OftvmfQMlqeOEx+PR8ELL0ikpJGeBo1k6o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761210383; c=relaxed/simple;
	bh=azKjUcaF+Yh/xgJXQhJAzZufucDYEmaYUJXG9Gq+JUs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=coHdXRqMNEsgeQy7gmcoB7GXxQKK/+35Y3bj5zH3RRn66Scv8aINP/o3l+GyE/tfl8SLV/WQAlvtNc10v1GyTud7miK/72WOa4ErXL/3TbxzhSMeaIY4zEM5OBILr/oVQg/GLqEBF4UyFRq9XdSsM7WNlUuddIufxxEOgy0Fykc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YEgvTwrD; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YEgvTwrD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761210382; x=1792746382;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=azKjUcaF+Yh/xgJXQhJAzZufucDYEmaYUJXG9Gq+JUs=;
  b=YEgvTwrDtHw7tMHVcbZ/eXmnbBujta7nTRdRtUHK6zXRCKgwES0qOqxl
   YQaeJqpdtmrHyhup0hrQ1kxaDq6g4GqKaaOLAM9+g8rw7weipexGFYIC7
   4F0jt1odPqbZmBld7ClsDHLkt+tSV6mEfwKXbgERy54LoBN12ke/VaRSg
   ZH+REj2M7Qt4QyC9FdNiqksWyIdRoEbs1C1w3m6dyHJ3qo7i1oqyPQNgJ
   17NAiI9UTdDT6QVmL7Td9YnZ105z5uvPbK3bQ+yg9em30zstDEURL3ybT
   EIdoL8UApUnH0Y6Pp+qFv0I0H3MZx78WHGsOxbNwuKa2VsvBqNdjeP0SJ
   g==;
X-CSE-ConnectionGUID: P/bXdx4XQYOjnGFN2AVsaQ==
X-CSE-MsgGUID: P8V+i/5QS72gwjndwhUqBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62404311"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="62404311"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 02:06:21 -0700
X-CSE-ConnectionGUID: XMJis0G8S5S2AQx7gZNRcQ==
X-CSE-MsgGUID: Y6LCewMxQk6Ya+DEkcuLEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="189372415"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa004.fm.intel.com with ESMTP; 23 Oct 2025 02:06:19 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeusz.slawinski@gmail.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 3/3] ASoC: Intel: avs: Use snd_codec format when initializing probe
Date: Thu, 23 Oct 2025 11:23:48 +0200
Message-Id: <20251023092348.3119313-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251023092348.3119313-1-cezary.rojewski@intel.com>
References: <20251023092348.3119313-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The data probing is a debug feature. Currently parameters channels and
rate specified by the application are read while the format is ignored.
More robust approach is to read all of them.

Audio format, while not used by the Probe module for PCM streaming,
takes part in the gateway initialization on the DSP side. With full
parametrization we gain better coverage with the data probing feature.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/probes.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/sound/soc/intel/avs/probes.c b/sound/soc/intel/avs/probes.c
index c7b70006354a..aa168828fcb0 100644
--- a/sound/soc/intel/avs/probes.c
+++ b/sound/soc/intel/avs/probes.c
@@ -14,8 +14,8 @@
 #include "debug.h"
 #include "messages.h"
 
-static int avs_dsp_init_probe(struct avs_dev *adev, union avs_connector_node_id node_id,
-			      size_t buffer_size)
+static int avs_dsp_init_probe(struct avs_dev *adev, struct snd_compr_params *params, int bps,
+			      union avs_connector_node_id node_id, size_t buffer_size)
 {
 	struct avs_probe_cfg cfg = {{0}};
 	struct avs_module_entry mentry;
@@ -27,12 +27,16 @@ static int avs_dsp_init_probe(struct avs_dev *adev, union avs_connector_node_id
 		return ret;
 
 	/*
-	 * Probe module uses no cycles, audio data format and input and output
-	 * frame sizes are unused. It is also not owned by any pipeline.
+	 * Probe module uses no cycles, input and output frame sizes are unused.
+	 * It is also not owned by any pipeline.
 	 */
 	cfg.base.ibs = 1;
 	/* BSS module descriptor is always segment of index=2. */
 	cfg.base.is_pages = mentry.segments[2].flags.length;
+	cfg.base.audio_fmt.sampling_freq = params->codec.sample_rate;
+	cfg.base.audio_fmt.bit_depth = bps;
+	cfg.base.audio_fmt.num_channels = params->codec.ch_out;
+	cfg.base.audio_fmt.valid_bit_depth = bps;
 	cfg.gtw_cfg.node_id = node_id;
 	cfg.gtw_cfg.dma_buffer_size = buffer_size;
 
@@ -128,8 +132,6 @@ static int avs_probe_compr_set_params(struct snd_compr_stream *cstream,
 	struct hdac_ext_stream *host_stream = avs_compr_get_host_stream(cstream);
 	struct snd_compr_runtime *rtd = cstream->runtime;
 	struct avs_dev *adev = to_avs_dev(dai->dev);
-	/* compr params do not store bit depth, default to S32_LE. */
-	snd_pcm_format_t format = SNDRV_PCM_FORMAT_S32_LE;
 	unsigned int format_val;
 	int bps, ret;
 
@@ -142,7 +144,7 @@ static int avs_probe_compr_set_params(struct snd_compr_stream *cstream,
 	ret = snd_compr_malloc_pages(cstream, rtd->buffer_size);
 	if (ret < 0)
 		return ret;
-	bps = snd_pcm_format_physical_width(format);
+	bps = snd_pcm_format_physical_width(params->codec.format);
 	if (bps < 0)
 		return bps;
 	format_val = snd_hdac_stream_format(params->codec.ch_out, bps, params->codec.sample_rate);
@@ -166,7 +168,7 @@ static int avs_probe_compr_set_params(struct snd_compr_stream *cstream,
 		node_id.vindex = hdac_stream(host_stream)->stream_tag - 1;
 		node_id.dma_type = AVS_DMA_HDA_HOST_INPUT;
 
-		ret = avs_dsp_init_probe(adev, node_id, rtd->dma_bytes);
+		ret = avs_dsp_init_probe(adev, params, bps, node_id, rtd->dma_bytes);
 		if (ret < 0) {
 			dev_err(dai->dev, "probe init failed: %d\n", ret);
 			avs_dsp_enable_d0ix(adev);
-- 
2.25.1

